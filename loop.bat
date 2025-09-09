@echo off
setlocal enabledelayedexpansion

:loop
set /a countdown=10  REM Set countdown time in seconds

:countdown
if !countdown! gtr 0 (
    echo Countdown: 
    timeout /t 1  
    set /a countdown-=1  
    goto countdown
)

echo Time's up! Restarting the loop...
goto loop

