@echo off
dir /ah
set /p file="Type the path of the file to unhide: "
attrib -h -s %file%