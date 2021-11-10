Poner el arc.exe en el mismo directorio donde se encuentra el ARCToolsV2.1.2.jar
Se puede agregar el directorio donde se encuentra el arc.exe al PATH de windows para
poder ejecutar el programa con el comando "arc" desde cualquier ubicacion del programa

(https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) recuerde en el path
agregar un "/" al final del directorio de la carpeta para que funcione correctamente

puede ejecutar desde la consola "arc" o "arc.exe" o "arc.bat" para ver las opciones disponibles.

El programa compila y ejecuta directamente el simulador. Notese que por error del
programa ARCToolsV2.1.2.jar, una vez ejecutado el arc.exe, antes de cambiar la notacion
de los numeros de Hex a Dec, tiene que clickear el boton "reload", para que el programa
no borre todo el programa de la memoria del simulador.

En el caso de que el codigo fuente contenga algun error de sintaxis, se mostrará por consola
la devolucion del compilador, en el caso de que el compilador indique el error,
o se imprimirá el archivo .lst en el caso de que allí se indique el error.


El archivo arc.bat contiene el codigo fuente del ejecutable
