@echo off
rmdir /Q /S AeoB
mkdir AeoB
for /f %%f in ('dir /b /s 7325\common\AeoB\*.aeobsl') do bin\AeoBUtils.exe aeobsl2aeob -p %%f -o AeoB\%%~nf.aeob
for /f %%f in ('dir /b /s 7325\common\AeoB\*.axbsl') do bin\AeoBUtils.exe axbsl2axb -p %%f -o AeoB\%%~nf.axb
