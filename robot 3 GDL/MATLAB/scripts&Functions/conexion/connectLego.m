function isConnectedLego=connectLego(handles)
% funci�n para conectar al Lego EV3 v�a Bluetooth. Como argumento de salida
% se tiene una bandera. isConnectedLego. La funci�n detecta si existe o no
% una conexi�n existente.


global EV3
isConnectedLego = 1;

try
    beep(EV3)
    set( handles.auxiliarText, 'String' , 'L ok');
catch
    %% borramos todas las conexiones que haya    
    
    try
        EV3= Brick('ioType','instrbt','btDevice','EV3','btChannel',1);
        beep(EV3)
        set( handles.auxiliarText , 'String' , 'L start!');
    catch
        fclose( instrfindall ) ;
        delete(instrfindall);
        set( handles.auxiliarTex , 'String' , '!L');
        isConnectedLego=0;
    end
end
end
