@echo off
set m=
cls
echo ################################################################
echo # Reparacion de conexion DNS red Windows - 1.0 - javier (c) ####
echo ################################################################
echo ** Verificar que se este ejecutando modo Administrador **
echo.
echo 1- Modo Rapidido
echo 2-Modo Avanzado
echo 3-experimental
echo.
echo.
set /p M=Elija una opcion  y presiones enter
IF %m%==1 goto rapido
IF %m%==2 goto avanzado
IF %m%==3 goto expery


:expery
cls
echo Si todo lo anterior no funciono
echo eliminar las claves de registros de 
echo HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections
echo.
pause
goto fin

:rapido
echo %date% %time% Reparcion DNS >registrodns.log
cls
echo ### Modo Rapido..
echo Liberando Cache de DNS..
ipconfig /flushdns >>registrodns.log
echo Registra de nuevo el DNS..
ipconfig /registerdns >>registrodns.log
echo Libera la dirección IP
ipconfig /release >>registrodns.log
echo Renueva la dirección IP
ipconfig /renew >>registrodns.log
echo Resetea el socket DNS
netsh winsock reset >>registrodns.log
echo.
echo Listo!
pause
goto fin

:avanzado
echo %date% %time% Reparcion DNS >registrodns.log
cls
echo Trabajando.. 
netsh winsock reset catalog >>registrodns.log
netsh int ip reset resetlog.txt >>registrodns.log
echo.
echo Listo!
echo Se recomienda reiniciar la pc
pause
goto fin

:fin