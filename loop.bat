@echo off
setlocal

set "condition=true"  REM Initialize the condition variable

:recheck
if "%condition%"=="true" (
    echo The loop is running...
    timeout /t 9999
    set "condition=false"  REM Change condition to false to exit the loop
)
goto recheck
echo The loop has ended.

