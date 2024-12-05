@echo off
echo Initiating secure shutdown process...

REM Set up logging in the same directory as the script
set LOGFILE=%~dp0SecureShutdown_log.txt
echo Secure Shutdown Log - %date% %time% > "%LOGFILE%"

REM Disable network adapters
echo Disabling network adapters...
powershell.exe -Command "Get-NetAdapter | Disable-NetAdapter -Confirm:$false" 2>> "%LOGFILE%"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to disable network adapters
    echo [ERROR] Failed to disable network adapters >> "%LOGFILE%"
) else (
    echo [DONE] Network adapters disabled.
    echo [DONE] Network adapters disabled. >> "%LOGFILE%"
)

REM Flush DNS cache
echo Flushing DNS cache...
ipconfig /flushdns 2>> "%LOGFILE%"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to flush DNS cache
    echo [ERROR] Failed to flush DNS cache >> "%LOGFILE%"
) else (
    echo [DONE] DNS cache flushed.
    echo [DONE] DNS cache flushed. >> "%LOGFILE%"
)

REM Clear ARP cache
echo Clearing ARP cache...
arp -d * 2>> "%LOGFILE%"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to clear ARP cache
    echo [ERROR] Failed to clear ARP cache >> "%LOGFILE%"
) else (
    echo [DONE] ARP cache cleared.
    echo [DONE] ARP cache cleared. >> "%LOGFILE%"
)

REM Kill non-essential processes
echo Attempting to close non-essential processes...
for %%P in (chrome.exe firefox.exe msedge.exe) do (
    tasklist /FI "IMAGENAME eq %%P" 2>NUL | find /I /N "%%P">NUL
    if "%ERRORLEVEL%"=="0" (
        taskkill /F /IM %%P 2>> "%LOGFILE%"
        if %errorlevel% neq 0 (
            echo [WARNING] Could not terminate %%P
            echo [WARNING] Could not terminate %%P >> "%LOGFILE%"
        ) else (
            echo [DONE] Terminated %%P
            echo [DONE] Terminated %%P >> "%LOGFILE%"
        )
    ) else (
        echo [INFO] %%P was not running
        echo [INFO] %%P was not running >> "%LOGFILE%"
    )
)
echo [DONE] Process termination attempt completed.
echo [DONE] Process termination attempt completed. >> "%LOGFILE%"

REM Final security check
echo Performing final security check...
powershell.exe -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | ForEach-Object { Write-Host '[WARNING] ' $_.Name 'is still active'; Add-Content '%LOGFILE%' ('[WARNING] ' + $_.Name + ' is still active') }"

echo [FINAL] Secure shutdown process complete.
echo [FINAL] Secure shutdown process complete. >> "%LOGFILE%"
echo Log file location: %LOGFILE%
echo Log file location: %LOGFILE% >> "%LOGFILE%"

REM Pause to allow reading the output
timeout /t 10

REM Shutdown the computer
echo Initiating system shutdown...
shutdown /s /t 0