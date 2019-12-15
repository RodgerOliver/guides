@echo off
set /p file="Type the path of the file to hide: "
attrib +h +s %file%