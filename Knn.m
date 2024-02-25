function [error]= Knn(k,nuev)

%----------Para entrenar otra base de conocimiento----------
%[vect,color]=entrenar_base();  

%----------Para usar la base de conocimiento ya entrenada----------
fileID = fopen('C:\Users\Víctor\Documents\MATLAB\IA\vect.txt','r');
formatSpec = '%f';
sizevect = [3 Inf];
vect = fscanf(fileID,formatSpec,sizevect);
fclose(fileID);

fileID = fopen('C:\Users\Víctor\Documents\MATLAB\IA\color.txt','r');
formatSpec = '%f';
sizecolor = [40 3];
color = fscanf(fileID,formatSpec,sizecolor);
fclose(fileID);
%-----------------------------------------------------------------

nuev(1,1)=nuev(1,1)/max(vect(1,:));
nuev(2,1)=nuev(2,1)/max(vect(2,:));
nuev(3,1)=nuev(3,1)/max(vect(3,:));
vect(1,:)=vect(1,:)/max(vect(1,:));
vect(2,:)=vect(2,:)/max(vect(2,:));
vect(3,:)=vect(3,:)/max(vect(3,:));

figure
hold on
for i=1:(length(vect))+1
	if (i <= length(vect)*0.25)
        graf1=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
	end
	if (i <= length(vect)*0.50 && i>length(vect)*0.25)
        graf2=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
	end
	if (i <= length(vect)*0.75 && i>length(vect)*0.50)
        graf3=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
	end
	if (i <= length(vect) && i>length(vect)*0.75)
        graf4=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
	end
	if (i <= length(vect)+1 && i>length(vect))
        graf5=scatter3(nuev(1),nuev(2),nuev(3),25,'b','filled');
	end
end
legend([graf1,graf2,graf3,graf4,graf5], {'Arandela','Tornillo','Tuerca','Clavo','Nueva imagen'}, 'FontSize',7.5);    
xlabel('valor maximo diagonal');
ylabel('área');
zlabel('cuadrado');;
title('Base de conocimiento con imagen a clasificar - KNN');
grid on
hold off

dist=zeros(1,length(vect));
dist_marcas=zeros(length(vect),3);
for i=1:length(vect)
    dist(1,i)=((nuev(1,1)-vect(1,i))^2+(nuev(2,1)-vect(2,i))^2+(nuev(3,1)-vect(3,i))^2)^0.5;
    dist_marcas(i,:)=color(i,:);
end
dist;
dist_marcas;
ordenado=zeros(1,length(vect));
ordenado_marcas=zeros(length(vect),3);
aux=0;
aux2=zeros(1,3);
 for j=1:length(vect)-1
	for i=1:length(vect)-1
        if(dist(i)>dist(i+1))
            aux=dist(i);
            dist(i)=dist(i+1);
            dist(i+1)=aux;
            aux2=dist_marcas(i,:);
            dist_marcas(i,:)=dist_marcas(i+1,:);
            dist_marcas(i+1,:)=aux2;
        end
	end
 end
dist;
dist_marcas;
aux=0;

tipo=zeros(1,4);
for i=1:k
    if dist_marcas(i,:)==[0 1 0]
        tipo(1,1)=tipo(1,1)+1;
    end
    if dist_marcas(i,:)==[0 0 0]
        tipo(1,2)=tipo(1,2)+1;
    end
    if dist_marcas(i,:)==[1 0 0]
        tipo(1,3)=tipo(1,3)+1;
    end
    if dist_marcas(i,:)==[0 1 1]
        tipo(1,4)=tipo(1,4)+1;
    end
end

if (tipo(1,1)>tipo(1,2)) && (tipo(1,1)>tipo(1,3)) && (tipo(1,1)>tipo(1,4))
    disp('Es una Arandela');
    color2=[0 1 0];
end
if (tipo(1,2)>tipo(1,1)) && (tipo(1,2)>tipo(1,3)) && (tipo(1,2)>tipo(1,4))
    disp('Es un Tornillo');
    color2=[0 0 0];
end
if (tipo(1,3)>tipo(1,1)) && (tipo(1,3)>tipo(1,2)) && (tipo(1,3)>tipo(1,4))
    disp('Es una Tuerca');
    color2=[1 0 0];
end
if (tipo(1,4)>tipo(1,1)) && (tipo(1,4)>tipo(1,2)) && (tipo(1,4)>tipo(1,3))
    disp('Es un Clavo');
    color2=[0 1 1];
end
 for j=1:length(tipo)-1
	for i=1:length(tipo)-1
        if(tipo(i)<tipo(i+1))
            aux=tipo(i);
            tipo(i)=tipo(i+1);
            tipo(i+1)=aux;
        end
	end
 end

if tipo(1)==tipo(2)
	disp('Pruebe con otro valor de k');
    error=1;
else
    error=0;
	figure
    hold on
    for i=1:(length(vect))+1
        if (i <= length(vect)*0.25)
            graf1=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
        end
        if (i <= length(vect)*0.50 && i>length(vect)*0.25)
            graf2=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
        end
        if (i <= length(vect)*0.75 && i>length(vect)*0.50)
            graf3=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
        end
        if (i <= length(vect) && i>length(vect)*0.75)
            graf4=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
        end
        if (i <= length(vect)+1 && i>length(vect))
            graf5=scatter3(nuev(1),nuev(2),nuev(3),25,color2,'filled');
        end
    end
    legend([graf1,graf2,graf3,graf4,graf5], {'Arandela','Tornillo','Tuerca','Clavo','Nueva imagen'}, 'FontSize',7.5);
    xlabel('valor maximo diagonal');
    ylabel('área');
    zlabel('cuadrado');
    title('Algoritmo - KNN');
    grid on
    hold off
end
fprintf('\n')

