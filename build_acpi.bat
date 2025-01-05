@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: Check if at least 2 arguments are provided
IF "%~2"=="" (
    ECHO Usage: build_acpi.bat -p <platform> -d <device> [-aeob] [-acpi] [-all]
    EXIT /B
)

:: Initialize variables
SET PLATFORM=
SET DEVICE=
SET BUILD_AEOB=0
SET FULL_ACPI=0
SET BUILD_ALL=0

:: Parse arguments
:ARG_LOOP
IF "%~1"=="" GOTO END_ARGS
IF /I "%~1"=="-p" (
    SET PLATFORM=%~2
    SHIFT
    SHIFT
    GOTO ARG_LOOP
)
IF /I "%~1"=="-d" (
    SET DEVICE=%~2
    SHIFT
    SHIFT
    GOTO ARG_LOOP
)
IF /I "%~1"=="-aeob" (
    SET BUILD_AEOB=1
    SHIFT
    GOTO ARG_LOOP
)
IF /I "%~1"=="-acpi" (
    SET FULL_ACPI=1
    SHIFT
    GOTO ARG_LOOP
)
IF /I "%~1"=="-all" (
SET BUILD_AEOB=1
SET FULL_ACPI=1
    SHIFT
    GOTO ARG_LOOP
)
SHIFT
GOTO ARG_LOOP
:END_ARGS

:: Check if required arguments are set
IF "%PLATFORM%"=="" (
    ECHO Error: Platform (-p) not specified.
    EXIT /B
)

IF "%DEVICE%"=="" (
    ECHO Error: Device (-d) not specified.
    EXIT /B
)

:: Define base and device directories
SET BASE_DIR=%PLATFORM%
SET DEVICE_DIR=%BASE_DIR%\Devices\%DEVICE%
SET TEMP_DIR=temp
SET ASL_EXECUTABLE=/home/arminas/Documents/kodiak_acpi/bin/asl.exe

:: Check if the device directory exists
IF NOT EXIST "%DEVICE_DIR%" (
    ECHO Error: Directory "%DEVICE_DIR%" not found!
    EXIT /B
)

:: Read the "PARENTS" file to determine the SUBT_DIR
SET PARENTS_FILE_DEVICE=%DEVICE_DIR%\PARENTS
IF NOT EXIST "%PARENTS_FILE_DEVICE%" (
    ECHO Error: File "%PARENTS_FILE_DEVICE%" not found in "%DEVICE_DIR%"!
    EXIT /B
)

FOR /F "delims=" %%A IN (%PARENTS_FILE_DEVICE%) DO SET SUBT_DIR=%%A

:: Verify SUBT_DIR is a valid directory
IF NOT EXIST "%SUBT_DIR%" (
    ECHO Error: SUBT_DIR "%SUBT_DIR%" not found!
    EXIT /B
)

:: Read the "PARENTS" file inside SUBT_DIR to determine the COMMON_DIR
SET PARENTS_FILE_SUBT=%SUBT_DIR%\PARENTS
IF NOT EXIST "%PARENTS_FILE_SUBT%" (
    ECHO Error: File "%PARENTS_FILE_SUBT%" not found in "%SUBT_DIR%"!
    EXIT /B
)

FOR /F "delims=" %%A IN (%PARENTS_FILE_SUBT%) DO SET COMMON_SUBDIR=%%A
SET COMMON_DIR=%COMMON_SUBDIR%

:: Verify COMMON_DIR is a valid directory
IF NOT EXIST "%COMMON_DIR%" (
    ECHO Error: COMMON_DIR "%COMMON_DIR%" not found!
    EXIT /B
)

:: Create temp directory
IF EXIST "%TEMP_DIR%" RMDIR /S /Q "%TEMP_DIR%"
MKDIR "%TEMP_DIR%"

:: Copy .asl files from "common" and the platform directory to temp
ECHO Copying files...
XCOPY "%SUBT_DIR%\*.asl" "%TEMP_DIR%\" /Y /E >NUL
XCOPY "%COMMON_DIR%\*.asl" "%TEMP_DIR%\" /Y /E >NUL
XCOPY "%DEVICE_DIR%\*.asl" "%TEMP_DIR%\" /Y /E >NUL

:: Compile DSDT.asl with asl.exe
PUSHD "%TEMP_DIR%"
IF NOT EXIST "Dsdt.asl" (
    ECHO Error: Dsdt.asl file not found in temp directory!
    EXIT /B
)
ECHO Compiling Dsdt.asl...
"%ASL_EXECUTABLE%" Dsdt.asl
IF ERRORLEVEL 1 (
    ECHO Error: Compilation failed!
    EXIT /B
)
POPD

rmdir /Q /S out
MKDIR out

:: Move compiled DSDT.aml to the current directory
MOVE /Y "%TEMP_DIR%\DSDT.aml" out >NUL

IF "%FULL_ACPI%"=="1" (

    for /f %%a in ('dir /b %TEMP_DIR%\*.aslc') do (
        bin\MSVC\cl.exe /nologo /Fo%TEMP_DIR%\%%~na.obj /WX /c /TC /Iinc /Iinc\%PLATFORM% %TEMP_DIR%\%%~na.aslc
        if NOT ERRORLEVEL 0 GOTO:EOF
        if ERRORLEVEL 1 GOTO:EOF
        bin\MSVC\link.exe /DLL /MACHINE:ARM /NODEFAULTLIB /NOENTRY /NOLOGO /OUT:%TEMP_DIR%\%%~na.dll %TEMP_DIR%\%%~na.obj
        if NOT ERRORLEVEL 0 GOTO:EOF
        if ERRORLEVEL 1 GOTO:EOF
        bin\acpi_extract.exe %TEMP_DIR%\%%~na.dll out\%%~na.aml
        if NOT ERRORLEVEL 0 GOTO:EOF
        if ERRORLEVEL 1 GOTO:EOF
    )

)

:: Clean up temp directory
RMDIR /S /Q "%TEMP_DIR%"

:: Additionally process AeoB files and full ACPI build if -all argument is provided
IF "%BUILD_AEOB%"=="1" (
    MKDIR out\AeoB

    :: Process .aeobsl files
    for /f %%f in ('dir /b /s 7325\common\AeoB\*.aeobsl') do bin\AeoBUtils.exe aeobsl2aeob -p %%f -o out\AeoB\%%~nf.aeob

    :: Process .axbsl files
    for /f %%f in ('dir /b /s 7325\common\AeoB\*.axbsl') do bin\AeoBUtils.exe axbsl2axb -p %%f -o out\AeoB\%%~nf.axb
)

ECHO Script finished successfully.
EXIT /B
