function vectorCadena=leyendoCadenaDatos()
% funci�n para exportar en el caso de que exista m�s de un elemento.
% Vectores!
% se debi� ya haber enviado el comando para leer la variable!
% for m=1
% EV3.writeMailBox('modos','text','exportarDatos')
% EV3.writeMailBox('exportar','text','prueba')

global EV3

while 1
    [title,msg] = EV3.readMailBox('numeric');
    title=cellstr(title);
    switch title{1}
        case 'pasos'
            vectorCadena=zeros(1,msg);
            pasos=msg;
            k=1;
            
        case 'variable'
            
            vectorCadena(k)=msg;
            if k<pasos
            k=k+1;
            else
            break
            end
            
        otherwise
            title
            msg
            disp('Algo sali� super mal!, leyendo cadena de datos')
            return
    end
end
end