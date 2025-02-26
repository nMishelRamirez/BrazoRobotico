

ejecutar.m es el script principal del Sistema de Reconocimiento de Gestos en Tiempo Real para control de un Brazo Rob�tico


------usersData-----------------
Es la carpeta donde la rutina de entrenamiento guarda las se�ales electromiogr�ficas EMG.


------MATLAB-----------------
GUI: contiene las funciones y figuras dependientes de la interfaz gr�fica. 
images: contiene las im�genes de las 6 clases que reconoce el Sistema de Reconocimiento de Gestos
scripts&Functions


-----------EV3--------------
"Lego ev3 Toolbox" es un toolbox de Matlab para control de Lego Mindstorms EV3. Se utiliza para enviar comandos al EV3 desde Matlab.

"modelos rearmado Lego" contiene los archivos del software Lego Digital Designer para rearmado del brazo rob�tico.

"robot3GDL.ev3" es el framework para control del brazo rob�tico en Lego Mindstorms Education EV Teacher Edition.



-----------MyoMex--------------
Esta librer�a conecta a Matlab con el Myo Armband. Para ello, compila una funci�n en C++ como funci�n MEX.
Nota: el sistema de Reconocimiento de gestos no realiza la instalaci�n de MyoMex; en caso de requerir compilar la funci�n MEX nuevamente, siga las gu�as de instalaci�n y sobreescribir la librer�a MyoMex.
