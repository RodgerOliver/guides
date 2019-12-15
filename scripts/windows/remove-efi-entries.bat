@echo off
bcdedit /enum firmware
bcdedit /export newbcd
copy newbcd bcdbackup
set /p var="Type the indentifier to delete: "
bcdedit /store newbcd /delete %var%
bcdedit /import newbcd /clean