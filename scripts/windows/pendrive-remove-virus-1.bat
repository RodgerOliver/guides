@echo off

echo DESABILITANDO PROCESSOS
taskkill /f /im *.inf
taskkill /f /im *.EXE

echo DESOCULTANDO ARQUIVOS...
attrib +A -R -S -H /S /D *.* 

echo DELETANDO O AUTORUN...
del *.inf /f

echo DELETANDO ARQUIVOS INDESEJAVEIS CRIADOS PELO VIRUS.
del *.ico /f
del x.mpeg /f

echo APAGANDO ATALAHOS.
del *.lnk /f 

echo DELETANDO PASTAS DESNECESSARIAS.
rd RECYCLER /s /q
rd QUARANTINE /s /q
rd System Volume Information /s /q
del *.com /f

pause