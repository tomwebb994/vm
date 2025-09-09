@echo off
setlocal

set "condition=true"  REM Initialize the condition variable

:loop
if "%condition%"=="true" (
    echo The loop is running...
    timeout /t 999

    REM Here you can add logic to change the condition
    set /p "userInput=Do you want to continue the loop? (yes/no): "
    if /i "%userInput%"=="no" (
        set "condition=false"  REM Change condition to false to exit the loop
    )
)

echo The loop has ended.
