@echo off
:: chcp 65001

:: authorized by saltyzero@foxmail.com
:: VS141(VS2017) RelWithDebInfo x64

set name=%1

if "%name%"=="" (
echo please input a script name or * for all scripts
set /p name=
) else (
echo %1
)

if "%name%"=="" (
set name=*
echo *
)

if "%name%"=="*" (
for /R "%~dp0" %%i in (%name%.vcxproj) do (
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\amd64\MSBuild.exe" "%%i" /t:Rebuild /p:Configuration=RelWithDebInfo /p:Platform=x64
)
) else (
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\amd64\MSBuild.exe" "%name%\%name%.vcxproj" /t:Rebuild /p:Configuration=RelWithDebInfo /p:Platform=x64
)


:Exit
Pause