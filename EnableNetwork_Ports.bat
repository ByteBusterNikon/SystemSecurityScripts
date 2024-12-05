@echo off
echo Initiating network re-enablement...

REM Enable all network adapters
powershell.exe -Command "Get-NetAdapter | Enable-NetAdapter -Confirm:$false"
echo [DONE] Network adapters re-enabled.

REM Renew IP address
ipconfig /renew
echo [DONE] IP address renewed.

REM Flush DNS cache
ipconfig /flushdns
echo [DONE] DNS cache flushed.

echo [FINAL] Network adapters have been re-enabled.
echo [FINAL] IP address renewed and DNS cache flushed.

pause