REM Overwrites the Teredo Adapter "0x8e" state (Disabled) to "0x0" (Enabled). Forces "Yes" when asked to overwrite "DisabledComponents".
reg add HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters /f /v DisabledComponents /t REG_DWORD /d 0x0

REM Enables Teredo tunneling, otherwise direct access clients cannot utilize Teredo to connect
netsh interface teredo set state type=enterpriseclient

REM After executing the overwrite, simply restart the IP Helper service to eliminate the need to fully reboot the system to apply this fix.
net stop "IP Helper" /y
net start "IP Helper"
