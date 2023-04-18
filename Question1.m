tic
close all

%Données Excel
donnees = xlsread('enveloppe.xls');                                 %Encodage des données du tableau Excel 'enveloppe.xls'
temps=donnees(:,1);
angles=donnees(:,2);

%Pas et intervalle de temps
dt=1e-1;
range=0:dt:300;

%Interpolation polynomiale
p20=polyfit(temps,angles,20);                                       %Polynomiale degré 20
s20=polyval(p20,range);

%Interpolation linéaire et interpolation par splines cubiques
lin=interp1(temps,angles,range);                                    %Interpolation linéaire
spl=splines_method(range);                                          %Interpolation linéaire par splines cubiques

%Recherche de x0 et x1
search=0.3;                                                         %Valeur recherchée
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

%résultats de la méthode de la sécante et de la méthode de la bisection
tol=1e-5;                                                               %Tolérance absolue appliquée aux méthodes
i_max=50;                                                               %Nombre d'itérations maximal de chaque méthode
sec=Secante(@splines_method,x0,x1,search,tol,i_max);
bis=Bissection(@splines_method,x0,x1,search,tol,i_max);
disp(['Résultat méthode de la sécante: ',num2str(sec),' rad']);
disp(['Résultat méthode de la bissection: ',num2str(bis),' rad']);



%Affichage des méthodes d'interpolations choisies
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
legend('Valeurs réelles','Polynomiale[20]','Linéaire','Spline', 'Résultat sécante','Résultat bissection')
set(legend,'location','southeast')
grid on
hold off

toc
