function isConnectedLego=connectLego(handles)
% funci�n para conectar al Lego EV3 v�a Bluetooth. Como argumento de salida
% se tiene una bandera. isConnectedLego. La funci�n detecta si existe o no
% una conexi�n existente.

global EV3
isConnectedLego = 1;

try
    beep(EV3)  % Emite un sonido al dispositivo EV3 para verificar la conexi�n
    set( handles.auxiliarText, 'String' , 'L ok');
catch
    %% Si falla, intenta crear la conexi�n
    try
    % Intentar establecer la conexi�n con el EV3 a trav�s de Bluetooth
    disp('cL: Intentando establecer la conexi�n Bluetooth...');
    EV3 = Brick('ioType', 'instrbt', 'btDevice', 'EV3', 'btChannel', 1);  
    
    % Verificar si la conexi�n fue exitosa
    if isvalid(EV3)
        beep(EV3);  % Emite un sonido si la conexi�n es exitosa
        set(handles.auxiliarText, 'String', 'L start!');
        disp('Conexi�n Bluetooth exitosa!');
    else
        disp('Fallo al establecer la conexi�n Bluetooth');
        set(handles.auxiliarText, 'String', '!L');  % Mensaje de error
        isConnectedLego = 0;
    end
    catch
        % Si ocurre un error, cierra cualquier conexi�n existente
        fclose(instrfindall); 
        delete(instrfindall);
        disp('cL: Error en la conexi�n Bluetooth');
        disp(getReport(exception));  % Mostrar el informe del error
        set(handles.auxiliarText, 'String', '!L');  % Mensaje de error
        isConnectedLego = 0;  % Se establece como no conectado
    end

end
end
