function []=Kmeans(nuev)

%----------Para entrenar otra base de conocimiento----------
%[vect,color]=entrenar_base();

%----------------------------------------------------------------------
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

long=length(vect);
vect(1,long+1)=nuev(1,1);
vect(2,long+1)=nuev(2,1);
vect(3,long+1)=nuev(3,1);

vect(1,:)=vect(1,:)/max(vect(1,:));
vect(2,:)=vect(2,:)/max(vect(2,:));
vect(3,:)=vect(3,:)/max(vect(3,:));

color(long+1,1)=0;
color(long+1,2)=0;
color(long+1,3)=1;


figure
hold on
for i=1:(length(vect))
	if (i <= ((length(vect)-1)*0.25))
        graf1=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
    end
	if (i <= (length(vect)-1)*0.50 && i>(length(vect)-1)*0.25)
        graf2=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
    end
	if (i <= (length(vect)-1)*0.75 && i>(length(vect)-1)*0.50)
        graf3=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
    end
	if (i <= (length(vect)-1) && i>(length(vect)-1)*0.75)
        graf4=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
    end
	if (i <= length(vect) && i>(length(vect)-1))
        graf5=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:),'filled');
 	end
end
legend([graf1,graf2,graf3,graf4,graf5], {'Arandela','Tornillo','Tuerca','Clavo','Nueva imagen'}, 'FontSize',7.5);
xlabel('valor maximo diagonal');
ylabel('área');
zlabel('cuadrado');
title('Base de conocimiento con imagen a clasificar - k-means')
grid on
hold off


k=4;    
delta=0.005; 
distintos=0;
it=0;
while(distintos==0)
    columna1=round((10-1)*rand+1);
    columna2=round((20-11)*rand+11);
    columna3=round((30-21)*rand+21);
    columna4=round((40-31)*rand+31);
    if (columna1~=columna2 && columna1~=columna3 && columna1~=columna4)
        if (columna2 ~= columna3 && columna2 ~= columna4)
            if (columna3 ~= columna4)
                if (columna1~=0 && columna2~=0 && columna3~=0 && columna4~=0)
                    distintos=1;
                end
            end
        end
    end
    if it>100
        distintos=1;
    end
    it=it+1;
end
centro1=[vect(1,columna1);vect(2,columna1);vect(3,columna1)];  
centro2=[vect(1,columna2);vect(2,columna2);vect(3,columna2)];
centro3=[vect(1,columna3);vect(2,columna3);vect(3,columna3)];  
centro4=[vect(1,columna4);vect(2,columna4);vect(3,columna4)];


flag=1;
iter=0;
while(flag==1)
    if(iter==0)
        for i=1:length(vect)   
            if (i~=columna1 && i~=columna2 && i~=columna3 && i~=columna4)  
                dist1(i)=((centro1(1,1)-vect(1,i))^2+(centro1(2,1)-vect(2,i))^2+(centro1(3,1)-vect(3,i))^2)^0.5;
                dist2(i)=((centro2(1,1)-vect(1,i))^2+(centro2(2,1)-vect(2,i))^2+(centro2(3,1)-vect(3,i))^2)^0.5;
                dist3(i)=((centro3(1,1)-vect(1,i))^2+(centro3(2,1)-vect(2,i))^2+(centro3(3,1)-vect(3,i))^2)^0.5;
                dist4(i)=((centro4(1,1)-vect(1,i))^2+(centro4(2,1)-vect(2,i))^2+(centro4(3,1)-vect(3,i))^2)^0.5;
            end
        end
    end
    if(iter>0)
        for i=1:length(vect)
            dist1(i)=((centro1(1,1)-vect(1,i))^2+(centro1(2,1)-vect(2,i))^2+(centro1(3,1)-vect(3,i))^2)^0.5;  
            dist2(i)=((centro2(1,1)-vect(1,i))^2+(centro2(2,1)-vect(2,i))^2+(centro2(3,1)-vect(3,i))^2)^0.5;
            dist3(i)=((centro3(1,1)-vect(1,i))^2+(centro3(2,1)-vect(2,i))^2+(centro3(3,1)-vect(3,i))^2)^0.5;
            dist4(i)=((centro4(1,1)-vect(1,i))^2+(centro4(2,1)-vect(2,i))^2+(centro4(3,1)-vect(3,i))^2)^0.5;
        end
    end
    aux1=0;
    aux2=0;
    aux3=0;
    aux4=0;
    sumx1=0;
    sumx2=0;
    sumx3=0;
    sumx4=0;
    sumy1=0;
    sumy2=0;
    sumy3=0;
    sumy4=0;
    sumz1=0;
    sumz2=0;
    sumz3=0;
    sumz4=0;
    for i=1:length(vect)
        if(dist1(i)<dist2(i) && dist1(i)<dist3(i) && dist1(i)<dist4(i)) 
            aux1=aux1+1;
            sumx1=vect(1,i)+sumx1;
            sumy1=vect(2,i)+sumy1;
            sumz1=vect(3,i)+sumz1;
            color(i,1)=0;
            color(i,2)=1;
            color(i,3)=0;
        end
        if(dist2(i)<dist1(i) && dist2(i)<dist3(i) && dist2(i)<dist4(i))
            aux2=aux2+1;
            sumx2=vect(1,i)+sumx2;
            sumy2=vect(2,i)+sumy2;
            sumz2=vect(3,i)+sumz2;
            color(i,1)=0;
            color(i,2)=0;
            color(i,3)=0;
        end
        if(dist3(i)<dist1(i) && dist3(i)<dist2(i) && dist3(i)<dist4(i))
            aux3=aux3+1;
            sumx3=vect(1,i)+sumx3;
            sumy3=vect(2,i)+sumy3;
            sumz3=vect(3,i)+sumz3;
            color(i,1)=1;
            color(i,2)=0;
            color(i,3)=0;
        end
        if(dist4(i)<dist1(i) && dist4(i)<dist2(i) && dist4(i)<dist3(i))
            aux4=aux4+1;
            sumx4=vect(1,i)+sumx4;
            sumy4=vect(2,i)+sumy4;
            sumz4=vect(3,i)+sumz4;
            color(i,1)=0;
            color(i,2)=1;
            color(i,3)=1;
        end
    end    
    centro1aux=[(sumx1+centro1(1,1))/(aux1+1); (sumy1+centro1(2,1))/(aux1+1); (sumz1+centro1(3,1))/(aux1+1)];  
    centro2aux=[(sumx2+centro2(1,1))/(aux2+1); (sumy2+centro2(2,1))/(aux2+1); (sumz2+centro2(3,1))/(aux2+1)];
    centro3aux=[(sumx3+centro3(1,1))/(aux3+1); (sumy3+centro3(2,1))/(aux3+1); (sumz3+centro3(3,1))/(aux3+1)];
    centro4aux=[(sumx4+centro4(1,1))/(aux4+1); (sumy4+centro4(2,1))/(aux4+1); (sumz4+centro4(3,1))/(aux4+1)];
    
    figure
    hold on
    for i=1:(length(vect))
        if (i <= ((length(vect)-1)*0.25))
            graf1=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
        end
        if (i <= (length(vect)-1)*0.50 && i>(length(vect)-1)*0.25)
            graf2=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:));
        end
        if (i <= (length(vect)-1)*0.75 && i>(length(vect)-1)*0.50)
            graf3=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
        end
        if (i <= (length(vect)-1) && i>(length(vect)-1)*0.75)
            graf4=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:)); 
        end
        if (i <= length(vect) && i>(length(vect)-1))
            graf5=scatter3(vect(1,i),vect(2,i),vect(3,i),25,color(i,:),'filled');
        end
    end
    scatter3(centro1aux(1,1),centro1aux(2,1),centro1aux(3,1),50,'x')
    scatter3(centro2aux(1,1),centro2aux(2,1),centro2aux(3,1),50,'x')
    scatter3(centro3aux(1,1),centro3aux(2,1),centro3aux(3,1),50,'x')
    scatter3(centro4aux(1,1),centro4aux(2,1),centro4aux(3,1),50,'x')
    xlabel('valor maximo diagonal');
    ylabel('área');
    zlabel('cuadrado');
    title('Algoritmo k-means')
    grid on
    hold off
    
    errorx1=abs(centro1(1,1)-centro1aux(1,1));
    errorx2=abs(centro2(1,1)-centro2aux(1,1));
    errorx3=abs(centro3(1,1)-centro3aux(1,1));
    errorx4=abs(centro4(1,1)-centro4aux(1,1));
    errory1=abs(centro1(2,1)-centro1aux(2,1));
    errory2=abs(centro2(2,1)-centro2aux(2,1));
    errory3=abs(centro3(2,1)-centro3aux(2,1));
    errory4=abs(centro4(2,1)-centro4aux(2,1));
    errorz1=abs(centro1(3,1)-centro1aux(3,1));
    errorz2=abs(centro2(3,1)-centro2aux(3,1));
    errorz3=abs(centro3(3,1)-centro3aux(3,1));
    errorz4=abs(centro4(3,1)-centro4aux(3,1));
    if(errorx1<delta && errorx2<delta && errorx3<delta && errorx4<delta && errory1<delta && errory2<delta && errory3<delta && errory4<delta && errorz1<delta && errorz2<delta && errorz3<delta && errorz4<delta )
        flag=0;
    end
    if(iter>20)
        flag=0;
    end
    
    centro1=centro1aux;
    centro2=centro2aux;
    centro3=centro3aux;
    centro4=centro4aux;
    iter=iter+1;
end

if color(length(vect),:)== [0 1 0]
    disp('Es una Arandela');
end
if color(length(vect),:)== [0 0 0]
    disp('Es un Tornillo');
end
if color(length(vect),:)== [1 0 0]
    disp('Es una Tuerca');
end
if color(length(vect),:)== [0 1 1]
    disp('Es un Clavo');
end


    