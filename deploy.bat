@echo off
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
hugo
cd public
git add .
git commit -m "Rebuilding Site %mytime% %mydate%"
git push origin master
echo Complete. Press Any Key to Exit...
pause > nul