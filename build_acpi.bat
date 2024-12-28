@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: Check if at least 4 arguments are provided
IF "%~4"=="" (
    ECHO Usage: script.bat -p <platform> -d <device>
    EXIT /B
)

:: Initialize variables
SET PLATFORM=
SET VARIANT=

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
    SET VARIANT=%~2
    SHIFT
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

IF "%VARIANT%"=="" (
    ECHO Error: Device (-d) not specified.
    EXIT /B
)

:: Define directories
SET BASE_DIR=%PLATFORM%
SET COMMON_DIR=%BASE_DIR%\common
SET TARGET_DIR=%BASE_DIR%\%BASE_DIR%_%VARIANT%
SET TEMP_DIR=temp
SET ASL_EXECUTABLE=/home/arminas/Documents/kodiak_acpi/bin/asl.exe

:: Check if required directories exist
IF NOT EXIST "%COMMON_DIR%" (
    ECHO Error: Directory "%COMMON_DIR%" not found!
    EXIT /B
)

IF NOT EXIST "%TARGET_DIR%" (
    ECHO Error: Directory "%TARGET_DIR%" not found!
    EXIT /B
)

:: Create temp directory
IF EXIST "%TEMP_DIR%" RMDIR /S /Q "%TEMP_DIR%"
MKDIR "%TEMP_DIR%"

:: Copy .asl files from "common" and the platform directory to temp
ECHO Copying files...
XCOPY "%COMMON_DIR%\*.asl" "%TEMP_DIR%\" /Y /E >NUL
XCOPY "%TARGET_DIR%\*.asl" "%TEMP_DIR%\" /Y /E >NUL

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

:: Move compiled DSDT.aml to the current directory
MOVE /Y "%TEMP_DIR%\DSDT.aml" . >NUL

:: Clean up temp directory
RMDIR /S /Q "%TEMP_DIR%"

ECHO Compilation successful. DSDT.aml built.
EXIT /B
