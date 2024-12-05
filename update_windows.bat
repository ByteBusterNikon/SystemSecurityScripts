@echo off
echo Checking for Windows updates...

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges.
) else (
    echo This script requires administrator privileges.
    echo Please run this script as an administrator.
    pause
    exit /b 1
)

:: Run PowerShell commands with execution policy bypass
powershell.exe -ExecutionPolicy Bypass -Command ^
"if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) { Install-Module PSWindowsUpdate -Force -Scope AllUsers }; ^
Import-Module PSWindowsUpdate; ^
Get-WindowsUpdate -Install -AcceptAll -AutoReboot"

echo Windows update process completed.
pause