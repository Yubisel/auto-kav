@echo off
:Preg_download
set /p DownLoad=Desea descargar el archivo y moverlo a la memoria?[s/n]:
if /i %DownLoad%==s (goto Descargar) else if /i %DownLoad%==n (goto End) else ( echo Disculpe la ignorancia de un humilde servidor, pero no le he comprendido.
goto Preg_download
)
:Descargar
if exist "%userprofile%\Escritorio\kaspersky.rar" DEL /q "%userprofile%\Escritorio\kaspersky.rar"
echo.
echo Descargando http://localhost/Antivirus/kaspersky.rar...
wget -P "%userprofile%\Escritorio" http://proxy/antivirus/Kaspersky-comprimido/kaspersky.rar
echo Descarga terminada.
echo.
echo Moviendo el archivo a %1...
rem MOVE /Y "%userprofile%\Escritorio\kaspersky.rar" %1
"%programfiles%\TeraCopy\TeraCopy.exe" Move "%userprofile%\Escritorio\kaspersky.rar" %1 /OverwriteAll 
pause 
:End
exit