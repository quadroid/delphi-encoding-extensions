@echo off
cd /d "%~dp0"

if exist Win32 rmdir /s /q Win32
del /q *.dproj
del /q *.exe
del /q *.res
del /q files\*.out.txt

cd ..
if not exist EncodingEx.pas exit /b

del /s /q *.bak
del /s /q *.dcu
del /s /q *.ddp
del /s /q *.delphilsp.*
del /s /q *.dof
del /s /q *.drc
del /s /q *.dsk
del /s /q *.identcache
del /s /q *.local
del /s /q *.map
del /s /q *.mes
del /s /q *.tvsconfig
del /s /q *.~*

for /f "tokens=*" %%d in ('dir /b /ad /s "..\__history"')  do rmdir /q "%%d"
for /f "tokens=*" %%d in ('dir /b /ad /s "..\__recovery"') do rmdir /q "%%d"
