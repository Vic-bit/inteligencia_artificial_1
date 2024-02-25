function [vect,color]=entrenar_base()

a = genvarname({'aran', 'aran', 'aran', 'aran', 'aran', 'aran', 'aran', 'aran', 'aran', 'aran'});  
Arandela = genvarname({'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela', 'Arandela'});
a1 = genvarname({'arani', 'arani', 'arani', 'arani', 'arani', 'arani', 'arani', 'arani', 'arani', 'arani'});
a2 = genvarname({'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin', 'aranbin'});
l1=length(a)
for i=1:l1
    text=strcat(Arandela(i),'.jpg');
    a{i} =imread(char(text));
    a1{i}=imresize(a{i},[500 500]);
    a2{i}=im2bw(a1{i},0.55);
    %figure
    %imshow(a2{i})
end

to = genvarname({'torn', 'torn', 'torn', 'torn', 'torn', 'torn', 'torn', 'torn', 'torn', 'torn'}); 
Tornillo = genvarname({'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo', 'Tornillo'});
to1 = genvarname({'torni', 'torni', 'torni', 'torni', 'torni', 'torni', 'torni', 'torni', 'torni', 'torni'});
to2 = genvarname({'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin', 'tornibin'});
l2=length(to);
for i=1:l2
    text=strcat(Tornillo(i),'.jpg');
    to{i} =imread(char(text));
    to1{i}=imresize(to{i},[500 500]);
    to2{i}=im2bw(to1{i},0.55);
    %figure
    %imshow(to2{i})
end

tu = genvarname({'tuer', 'tuer', 'tuer', 'tuer', 'tuer', 'tuer', 'tuer', 'tuer', 'tuer', 'tuer'});  
Tuerca = genvarname({'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca', 'Tuerca'});
tu1 = genvarname({'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni', 'tuerni'});
tu2 = genvarname({'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin', 'tuerbin'});
l3=length(tu);
for i=1:l3
    text=strcat(Tuerca(i),'.jpg');
    tu{i} =imread(char(text));
    tu1{i}=imresize(tu{i},[500 500]);
    tu2{i}=im2bw(tu1{i},0.55);
    %figure
    %imshow(tu2{i})
end

c = genvarname({'clav', 'clav', 'clav', 'clav', 'clav', 'clav', 'clav', 'clav', 'clav', 'clav'});    %3 clavos
Clavo = genvarname({'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo', 'Clavo'});
c1 = genvarname({'clavi', 'clavi', 'clavi', 'clavi', 'clavi', 'clavi', 'clavi', 'clavi', 'clavi', 'clavi'});
c2 = genvarname({'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin', 'clavbin'});
l4=length(c);
for i=1:l4
    text=strcat(Clavo(i),'.jpg');
    c{i} =imread(char(text));
    c1{i}=imresize(c{i},[500 500]);
    c2{i}=im2bw(c1{i},0.60);
    %figure
    %imshow(c2{i})
end

vecta=genvarname({'vecta','vecta','vecta','vecta','vecta','vecta','vecta','vecta','vecta','vecta'});
for i=1:l1
    vecta{i}=zeros(1,length(a2{i}));
end
vectto=genvarname({'vectto','vectto','vectto','vectto','vectto','vectto','vectto','vectto','vectto','vectto'});
for i=1:l2
    vectto{i}=zeros(1,length(to2{i}));
end
vecttu=genvarname({'vecttu','vecttu','vecttu','vecttu','vecttu','vecttu','vecttu','vecttu','vecttu','vecttu'});
for i=1:l3
    vecttu{i}=zeros(1,length(tu2{i}));
end
vectc=genvarname({'vectc','vectc','vectc','vectc','vectc','vectc','vectc','vectc','vectc','vectc'});
for i=1:l4
    vectc{i}=zeros(1,length(c2{i}));
end

%----------PARAMETRO 1: Sumo toda las filas anteriores y columnas anteriores para reducirlo a un elemento---------
for i=1:500
    for j=1:500
        if i>=j
            for k=1:l1
                vecta{k}(i)=vecta{k}(i)+a2{k}(i,j);
            end
            for k=1:l2
                vectto{k}(i)=vectto{k}(i)+to2{k}(i,j);
            end
            for k=1:l3
                vecttu{k}(i)=vecttu{k}(i)+tu2{k}(i,j);
            end
            for k=1:l4
            	vectc{k}(i)=vectc{k}(i)+c2{k}(i,j);
            end
        else
            for k=1:l1
                vecta{k}(i)=vecta{k}(i)+a2{k}(i,j);
            end
            for k=1:l2
                vectto{k}(i)=vectto{k}(i)+to2{k}(i,j);
            end
            for k=1:l3
                vecttu{k}(i)=vecttu{k}(i)+tu2{k}(i,j);
            end
            for k=1:l4
            	vectc{k}(i)=vectc{k}(i)+c2{k}(i,j);
            end

        end
    end
end

vect=zeros(3,l1+l2+l3+l4);
for i=1:(l1+l2+l3+l4)
    if (i <= l1)
        vect(1,i)= max(vecta{i});
    end
    if (i <= l1+l2 && i>l1)
        vect(1,i)= max(vectto{i-l1}); 
    end
    if (i <= l1+l2+l3 && i>l1+l2)
        vect(1,i)= max(vecttu{i-l1-l2}); 
    end
    if (i <= l1+l2+l3+l4 && i>l1+l2+l3)
        vect(1,i)= max(vectc{i-l1-l2-l3}); 
    end
end

%------------------PARAMETRO 2: Suma de todo el área--------------------
for i=1:1:500
    for j=1:1:500
        for k=1:(l1+l2+l3+l4)
            if k <= l1
                vect(2,k)= a2{k}(i,j)+vect(2,k);    
            end
            if k <= (l1+l2) && k > l1
                vect(2,k)= to2{k-l1}(i,j)+vect(2,k); 
            end
            if k <= (l1+l2+l3) && k > (l1+l2)
                vect(2,k)= tu2{k-l1-l2}(i,j)+vect(2,k);
            end
            if k <= (l1+l2+l3+l4) && k > (l1+l2+l3)
                vect(2,k)= c2{k-l1-l2-l3}(i,j)+vect(2,k);
            end
        end
    end
end

%---------------------PARAMETRO 3: Comparación con un cuadrado que aumenta de lado-----------------------------------
factor=0.6;
for k=1:(l1+l2+l3+l4)
    if k <= l1
        for j=1:249
            aux=0;
            for m=-j:j
                for n=-j:j
                    if a2{k}(250+m,250+n)==1
                        aux=aux+1;
                    end
                end
            end
            if aux>vect(2,k)*factor
                vect(3,k)= j;
                break
            end
        end
    end
    if k <= (l1+l2) && k > l1
        for j=1:249
            aux=0;
            for m=-j:j
                for n=-j:j
                    if to2{k-l1}(250+m,250+n)==1
                        aux=aux+1;
                    end
                end
            end
            if aux>vect(2,k)*factor
                vect(3,k)= j;
                break
            end
        end
    end
    if k <= (l1+l2+l3) && k > (l1+l2)
        for j=1:249
            aux=0;
            for m=-j:j
                for n=-j:j
                    if tu2{k-l1-l2}(250+m,250+n)==1
                        aux=aux+1;
                    end
                end
            end
            if aux>vect(2,k)*factor
                vect(3,k)= j;
                break
            end
        end
    end
    if k <= (l1+l2+l3+l4) && k > (l1+l2+l3)
        for j=1:249
            aux=0;
            for m=-j:j
                for n=-j:j
                    if c2{k-l1-l2-l3}(250+m,250+n)==1
                        aux=aux+1;
                    end
                end
            end
            if aux>vect(2,k)*factor
                vect(3,k)= j;
                break
            end
        end
    end
end
vect(2,:)=vect(2,:)/1000;

color=[0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1;0 1 1];

figure
hold on
scatter3(vect(1,:),vect(2,:),vect(3,:),25,color)

xlabel('valor maximo diagonal');
ylabel('área');
zlabel('cuadrado');
title('Base de conocimiento')
grid on 
hold off

fileID = fopen('C:\Users\Víctor\Documents\MATLAB\IA\vect.txt','w');
fprintf(fileID,' %8.4f %8.4f %8.4f \n',vect);
fclose(fileID);
fileID = fopen('C:\Users\Víctor\Documents\MATLAB\IA\color.txt','w');
fprintf(fileID,' %8.4f %8.4f %8.4f \n',color);
fclose(fileID);

end
