function [nuev]= nueva_imagen(imagen,nivel,negro,parametros)

n = genvarname({'imagen'}); 
Nueva = genvarname({char(imagen)});
n1 = genvarname({'nuevai'});
n2 = genvarname({'nuevabin'});

texto=strcat(Nueva(1),'.jpg');
n{1} =imread(char(texto));
n1{1}=imresize(n{1},[500 500]);
n2{1}=im2bw(n1{1},nivel);
if negro==0
    n2{1} = 1 - n2{1};
end

if parametros==0
    imshow(n1{1})
    figure
    imshow(n2{1})
end

nuev=zeros(3,1);
if parametros==1
    vectn=genvarname({'vectn'});
    vectn{1}=zeros(1,length(n2{1}));

    for i=1:500
        for j=1:500
            if i>=j
                vectn{1}(i)=vectn{1}(i)+n2{1}(i,j);
            else
                vectn{1}(i)=vectn{1}(i)+n2{1}(i,j);
            end
        end
    end

    %------------------PARAMETRO 1--------------------
    
    nuev(1,1)= max(vectn{1});

    %------------------PARAMETRO 2--------------------
    for i=1:1:500
        for j=1:1:500
            nuev(2,1)= n2{1}(i,j)+nuev(2,1);        
        end
    end

    %-----------------PARAMETRO 3:--------------------
    factor=0.6;
    for j=1:249
        aux=0;
        for m=-j:j
            for n=-j:j
                if n2{1}(250+m,250+n)==1
                    aux=aux+1;
                end
            end
        end
        if aux>nuev(2,1)*factor
            nuev(3,1)= j;
            break
        end
    end
    nuev(2,1)=nuev(2,1)/1000;
    
end
