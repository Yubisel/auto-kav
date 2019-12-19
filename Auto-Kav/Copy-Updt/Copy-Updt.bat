@echo off 
rem ===========================================================================================================================
rem ===========================Esto es lo que se va a ejecutar cada vez que se conecte un dispositivo==========================
rem ===========================================================================================================================
rem ==		"D:\Auto-Kav\Copy-Updt\Copy-Updt.bat"  %DriveLetter%\Kaspersky.rar   --- con el USB Safely Remove				 ==
rem ===========================================================================================================================
if not exist %1 goto End
if exist "%userprofile%\Desktop\kaspersky.rar" goto Existe_Archivo
:Preg_copia
set /p CopUpdt=Desea copiar y actualizar el antivirus?[s/n]:

if /i %CopUpdt%==s (goto Copiar) else if /i %CopUpdt%==n (goto End) else ( echo Disculpe la ignorancia de un humilde servidor, pero no le he comprendido.
goto Preg_copia
)
:Copiar
echo.
echo Copiando con TeraCopy...
rem IF EXIST %1 (copy  %1 "%userprofile%\Desktop\")
IF EXIST %1 ("%programfiles%\TeraCopy\TeraCopy.exe" Copy %1 "%userprofile%\Desktop\" /OverwriteAll)   
echo Copia Terminada. 
goto Descomprimir
echo.
:Existe_Archivo
echo El archivo ya existe.
:Descomprimir
echo.
echo Preparando para descomprimir...

echo Descomprimiendo...
echo.
Rar.exe x -o+ "%userprofile%\Desktop\kaspersky.rar" "%userprofile%\Desktop\kav\"
echo.
echo Preparando para actualizar el antivirus.

echo Actualizando...
echo.
"%programfiles%\Kaspersky Lab\Kaspersky Anti-Virus 6.0 for Windows Workstations MP4\avp.com" update 
echo Actualizacion terminada.
echo.
rem == Eliminar la actualizacion que se descomprimio en el escritorio
echo Eliminando "%userprofile%\Desktop\kav"...
RMDIR /s /q "%userprofile%\Desktop\kav"
echo.
rem == Eliminar la actualizacion comprimida que esta guardada en Store III
:Preg_Guardar
set /p guardar=Desea guardar la nueva actualizacion y borrar la anterior?[s/n]:
if /i %guardar%==s (goto Guardar) else if /i %guardar%==n (goto End) else ( echo Disculpe la ignorancia de un humilde servidor, pero no le he comprendido.
goto Preg_Guardar
)
echo.
:Guardar
echo Moviendo con TeraCopy...
"%programfiles%\TeraCopy\TeraCopy.exe" Move "%userprofile%\Desktop\kaspersky.rar" H: /OverwriteAll
rem echo Eliminando "H:\Kaspersky.rar"...
rem DEL /q "H:\Kaspersky.rar"
rem echo.
rem == Mueve la actualizacion que se encuentra en el escritorio a Store III, esta es la nueva. 
rem echo Moviendo la nueva actualizacion...
rem MOVE /Y "%userprofile%\Desktop\kaspersky.rar" H:
echo.
pause 
:End
exit