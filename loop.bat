@echo off
:loop
echo This is an infinite loop.
timeout /t 1000000 > nul  # Wait for 1 second
goto loop

