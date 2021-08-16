@echo off
title Deploying Site
mode 80,20
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
hugo
git add .
git commit -m "Updating site %mytime% %mydate%"
git push origin master
cd public
git add .
git commit -m "Rebuilding Site %mytime% %mydate%"
git push origin master
:::   ____                      _      _       
:::  / ___|___  _ __ ___  _ __ | | ___| |_ ___ 
::: | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
::: | |__| (_) | | | | | | |_) | |  __/ ||  __/
:::  \____\___/|_| |_| |_| .__/|_|\___|\__\___|
:::                      |_|                   
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
pause > nul