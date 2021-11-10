::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJH+F+Us8IRpGcCCHL2CuCaUgzfvv/f+EtlgPVaI7fYOb2buDMPUH60HrZ6oM5Flul8QAHw0KMEPlPDM1u20Ms3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
:: Deshabilita el printeo de los comandos en sí
@ECHO OFF

::Muestra ayuda del programa
if "%1" == "" if "%2" == "" if "%3" == "" (
echo usage: arc [-version] ^| ^<file^> [-c] [-bin] [-lst]
echo    -c  : For compile only, witout running the simulator.
echo          By default it compiles the .bin and .lst files; but you can use
echo          an extra parameter to conserve only one of the files.

echo    -bin: Don't delete the .bin file after closing the simulator.
echo    -lst: Don't delete the .lst file after closing the simulator.
exit
)


:: Muestra version del programa
if "%1" == "-version" (
echo arc version 1.1
echo -Mariano Lazzarini
exit
)


:: Determina si existe el archivo antes de ejecutar algo más
if not exist %1 (
echo Can't find file selected.
exit
)


:: Esta parte verifica si existen parametros, y si son validos. Si no lo son no ejecuta nada y devuelve un mensaje
set error_parametros=false
if not "%2" == "" if not "%2" == "-lst" if not "%2" == "-bin" if not "%2" == "-c" set error_parametros=true
if not "%3" == "" if not "%3" == "-lst" if not "%3" == "-bin" set error_parametros=true

if %error_parametros% == true (
echo There is an incorrect parameter. Execute "arc" to see avaible commands.
exit
)


:: Seteo de variables para saber si luego de la ejecucion hay que borrar el .bin y el .lst
set solo_compilar=false
set borrar_bin=true
set borrar_lst=true

::Comparo los parametros de no eliminacion de los archivos, pueden ser insertados de manera intercambiable

if "%2" == "-c" (
  set solo_compilar=true
  
  if "%3" == "" (
    set borrar_bin=false
    set borrar_lst=false  
  )
)


if "%2" == "-lst" set borrar_lst=false
if "%3" == "-lst" set borrar_lst=false
if "%4" == "-lst" set borrar_lst=false

if "%2" == "-bin" set borrar_bin=false
if "%3" == "-bin" set borrar_bin=false
if "%4" == "-bin" set borrar_bin=false



:: Ejecucion del compilador. el %1 representa el parametro de ejecucion
java -classpath %0\..\ARCToolsv2.1.2.jar ARCTools.ARCAsm %1


:: Caso en el que la compilacion del archivo fue exitosa, seteo para eliminar ambos archivos de la compilacion,
:: y ejecuto el simulador con el archivo (ejecuto con wjava para que no aparezca el log del simulador)
if %errorlevel% == 0 if %solo_compilar% == false (
javaw -jar %0\..\ARCToolsv2.1.2.jar %1.bin
)


:: Caso en el que el compilador encuentra un error, pero no lo devuelve por consola, sino que lo describe en el archivo .lst
:: entonces mustro el archivo .lst para debuggear.
if %errorlevel% == 1 (
type %1.lst
set borrar_bin=false
)


:eliminar_archivos
if %borrar_bin% == true del %1.bin
if %borrar_lst% == true del %1.lst
