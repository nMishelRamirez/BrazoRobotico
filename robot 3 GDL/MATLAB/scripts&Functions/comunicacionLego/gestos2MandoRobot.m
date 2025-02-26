%         %% exportar!
%         EV3.writeMailBox('modos','text','exportarDatos')
%         EV3.writeMailBox('exportar','text','prueba')
%         [title,msg] = EV3.readMailBox('numeric')

function gestos2MandoRobot(handles)
% Decisión de movimientos. Se ejecuta únicamente cuando el sistema detecta
% un gesto!
global flags datosUsuario myoObject EV3

flags.kdiscernirGesto2Robot = flags.kdiscernirGesto2Robot + 1;
gestoRespuesta = datosUsuario.gestoRespuesta;


switch gestoRespuesta
    
    
    case 1
        %% wave in, play y pausa!
        % movimiento del brazo a partir de la señal del magnetómetro
        
        if ~flags.isRobotMoving % bandera para el toogle del play pausa!
            % alistándose!
            flags.isRobotMoving = true ;
            
            set(handles.mensajesTextBox,'String','MANDO DEL BRAZO ROBOTICO')
            
            % posición inicial del myo
            Ro = myoObject.myoData.rot;
            datosUsuario.orientacion = initOrientacion(Ro);
            
            % comando de inicio!
            EV3.writeMailBox('modos','text','robot3GDL')
            EV3.writeMailBox('movimiento','text','iniciar')
            
        else
            % ya a la marcha! toca parar!
            flags.isRobotMoving = false ;
            set(handles.mensajesTextBox,'String','Robot Pausado!!!')
            pararMandoRobot(datosUsuario,EV3);
        end
        
        
    case 2
        %% wave out , detener ejecución
        set(handles.mensajesTextBox,'String','MANDO DEL BRAZO ROBOTICO DETENIDO')
        
        set(handles.pausaRadio,'Value',1)
        
        pararMandoRobot(datosUsuario,EV3);
        
        %% pausar!
        if flags.isRobotMoving
            pararMandoRobot(datosUsuario,EV3);
        end
        
        flags.moverIMULego = 0;
        flags.iniciado = false;
        set ( handles.iniciarButton, 'String' , 'Reanudar' )
        flags.reconocer = false;
        set(handles.tituloGestoText,'String','')
        
        flags.dibujarEMG = true; %
        beep
        
    case 3
        %% fist,
        if flags.isRobotMoving
            pararMandoRobot(datosUsuario,EV3);
        end
        set(handles.mensajesTextBox,'String','CERRANDO PINZA ROBOTICA!!!')
        
        EV3.writeMailBox('modos','text','cerrarGarra')
        scatter(handles.pinzaAxes,0,0,30,'r','filled');
        axis(handles.pinzaAxes,'off');
        handles.pinzaText.String = 'Estado cerrado';
        
        
    case 4
        %% open,
        % abrir garra, última versión!
        
        if flags.isRobotMoving
            pararMandoRobot(datosUsuario,EV3);
        end
        set(handles.mensajesTextBox,'String','ABRIENDO PINZA ROBOTICA!!!')
        
        EV3.writeMailBox('modos','text','abrirGarra')
        scatter(handles.pinzaAxes,0,0,30,'g','filled');
        axis(handles.pinzaAxes,'off');
        handles.pinzaText.String = 'Estado abierto';
        
    case 5
        %% pinch
        if flags.isRobotMoving
            pararMandoRobot(datosUsuario,EV3);
        end
        set(handles.mensajesTextBox,'String','Posición inicial')
        EV3.writeMailBox('modos','text','posicionInicial')
        
        
    case {6, 0}
        %% variantes del no gesto
        
    otherwise
        gestoRespuesta
        disp('gesto aparecido, aboratar, mayday, mayday!, en gestos2MandoRobot')
end


end
