@echo off
:loop
echo This is an infinite loop.
timeout /t 1 > nul  # Wait for 1 second
goto loop
