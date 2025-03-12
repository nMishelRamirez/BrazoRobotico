function connectMyo(obj)
% Funci�n para conectarse al Myo. Utiliza librer�a Myo Mex. No se realiza
% ninguna acci�n en el caso de que el dispositivo ya est�
% conectado. La estructura que contiene los datos del Myo se llama
% myoObject.


obj.isConnected = 1; % Bandera que indica estado de conexi�n

try
    % Revisando si existe conexi�n existente
    obj.isConnected = obj.myoObject.myoData.isStreaming;
    
    if isnan(obj.myoObject.myoData.rateEMG)
        terminateMyo
        obj.isConnected = 0;
    end
catch
    % En el caso de que no haya conexi�n detectada.
    
    try
        % Nueva conexi�n
        obj.myoObject = MyoMex();
        %         beep
        obj.myoObject.myoData.startStreaming();
        
        % fprintf('Conexi�n con MYO exitosa!!!\n');
    catch
        % No conexi�n posible
        obj.isConnected = 0;
    end
end
end