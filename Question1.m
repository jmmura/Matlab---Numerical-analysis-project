tic
close all

%Donn�es Excel
donnees = xlsread('enveloppe.xls');                                 %Encodage des donn�es du tableau Excel 'enveloppe.xls'
temps=donnees(:,1);
angles=donnees(:,2);

%Pas et intervalle de temps
dt=1e-1;
range=0:dt:300;

%Interpolation polynomiale
p20=polyfit(temps,angles,20);                                       %Polynomiale degr� 20
s20=polyval(p20,range);

%Interpolation lin�aire et interpolation par splines cubiques
lin=interp1(temps,angles,range);                                    %Interpolation lin�aire
spl=splines_method(range);                                          %Interpolation lin�aire par splines cubiques

%Recherche de x0 et x1
search=0.3;                                                         %Valeur recherch�e
t=0:300;                                                            %Intervalle de temps
f=splines_method(t);

if(f(1)<search)
    x=find(f>search,1);
    x1=x;
    x0=x-2;
else
    if(f(1)>search)
    x=find(f<search,1);
    x1=x;
    x0=x-2;
    end
end

%r�sultats de la m�thode de la s�cante et de la m�thode de la bisection
tol=1e-5;                                                               %Tol�rance absolue appliqu�e aux m�thodes
i_max=50;                                                               %Nombre d'it�rations maximal de chaque m�thode
sec=Secante(@splines_method,x0,x1,search,tol,i_max);
bis=Bissection(@splines_method,x0,x1,search,tol,i_max);
disp(['R�sultat m�thode de la s�cante: ',num2str(sec),' rad']);
disp(['R�sultat m�thode de la bissection: ',num2str(bis),' rad']);



%Affichage des m�thodes d'interpolations choisies
figure
hold on
plot(temps,angles,'ok')
plot(range,s20,'b')
plot(range,lin,'r')
plot(range,spl,'g')
plot(sec,search,'*b')
plot(bis,search,'*r')
xlabel('Temps [s]')
ylabel('Angles [rad]')
legend('Valeurs r�elles','Polynomiale[20]','Lin�aire','Spline', 'R�sultat s�cante','R�sultat bissection')
set(legend,'location','southeast')
grid on
hold off

toc
