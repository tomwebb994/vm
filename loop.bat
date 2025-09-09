@echo off
setlocal enabledelayedexpansion

:loop
set /a countdown=10  REM Set countdown time in seconds

:countdown
if !countdown! gtr 0 (
    echo Countdown: !countdown! seconds remaining...
    timeout /t 1 > nul  REM Wait for 1 second
    set /a countdown-=1  REM Decrease countdown by 1
    goto countdown
)

echo Time's up! Restarting the loop...
goto loop
