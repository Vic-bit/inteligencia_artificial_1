clc,clear 

disp('Se aplicaran los algoritmos K-means y KNN a la imagen introducida para clasificarla');
imagen=input('Ingrese el nombre del la imagen a analizar sin el formato: ','s');
nivel=0.55;
negro=1;
flag=0;
parametros=0;
while flag==0
    [nuev]= nueva_imagen(imagen,nivel,negro,parametros);
    disp('La imagen debe tener fondo de color negro')
    disp('¿Resulta satisfactoria la imagen segmentada?');
    correcta=input('(S)Es correcta /(N)No es correcta: ','s');
    if (correcta=='S')||(correcta=='s')
        flag=1;
    else        
        flag2=0;
        while flag2==0
            fprintf('El valor actual del nivel es de %f \n',nivel);
            nivel=input('Ingrese un valor para modificar el nivel comprendido entre 0 y 1: ');
            if (nivel<0 || nivel>1)
                disp('Error, debe estar comprendido en el intervalo');
            else
                flag2=1;
            end
            disp('¿El fondo de la imagen está todo blanco?');
            demasiado_blanca=input('(S)Sí /(N)No: ','s');
            if (demasiado_blanca=='S')||(demasiado_blanca=='s')
                negro=0;    
            end
        end
    end
end
parametros=1;
[nuev]= nueva_imagen(imagen,nivel,negro,parametros);
disp('A continuación se aplicarán los algoritmos K-means y KNN a la imagen introducida para clasificarla');
fprintf('\n');
%----------KKN----------
disp('Algoritmo KNN');
flag3=0;
while(flag3==0)
    k=input('Ingrese el valor de k del algoritmo KNN: ');
    error=Knn(k,nuev);
    if error==0
        flag3=1;
    end
end
%----------K-MEANS----------
disp('Algoritmo K-means');
Kmeans(nuev);