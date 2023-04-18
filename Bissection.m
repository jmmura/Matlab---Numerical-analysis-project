function x = Bissection(f,x0,x1,search,tol,i_max)
tic
j=0; %Compteur d'itérations
%Cas  d'une fonction strictement croissante entre x0 et x1
if(f(x0)<f(x1)) 
    while (abs(f(x0)-search) > tol) 
        j=j+1;
        milieu = (x0+x1)/2;
        if(j>i_max)
            disp('nombre d itérations maximal dépassé');
            break
        end
        if(f(milieu) > search)
            x1=milieu;
        else
            x0=milieu;
        end
    end
end


%Cas d'une fonction strictement décroissante entre x0 et x1
if(f(x0)>f(x1))
    while (abs(f(x0)-search)>tol)
        j=j+1;
        milieu = (x0+x1)/2;
        if(j>i_max)
            disp('nombre d itérations maximal dépassé');
            break
        end
        if (f(milieu)>search)
            x0 = milieu;
        else
            x1 = milieu;
        end
    end
end
x = milieu;
toc

  
