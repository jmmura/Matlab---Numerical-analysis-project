function [M_non_lin] = odefunction_nl(t,y,A,alpha)
%Fonction calculant les d�riv�es des composants du vecteur y = [y;y';theta;theta']
%en fonction du temps dans le cas du mod�le de cable non lin�aire 


%t: vecteur temps (s)
%A:  amplitude (N)
%alpha: constante caract�risant la non-lin�arit� de la raideur du c�ble (m^(-1))

%Constantes
omega=3;        %fr�quence angulaire (rad/s) ; o� A*sin(omega*t) repr�sente l'excitation du vent
m=2500;         %masse du tablier de pont (kg)
l=6;            %demi-largeur du tablier de pont (m)
cy=25;          %coefficient d�amortissement (N*s/m)
ctheta=300;     %coefficient d�amortissement en torsion (Nms)
K=1000;         %raideur des c�bles(N/m)  


%Distances verticale des extr�mit�s du tablier par rapport � sa position d'�quilibre (m)
ymin =  y(1) - l*sin(y(3));
ymax = y(1) + l*sin(y(3));


%Calculs des d�riv�es
M_non_lin=zeros(4,1);
M_non_lin(1) = y(2);
M_non_lin(2) = (1/m)*(-(cy*y(2))-((K/alpha)*(-2+exp(alpha*ymin)+exp(alpha*ymax)))+(A*sin(omega*t)));
M_non_lin(3) = y(4);
M_non_lin(4) = (3/(m*l*l))*(-(ctheta*y(4))+l*((K/alpha)*(exp(alpha*ymin)-exp(alpha*ymax)))*cos(y(3)));

%vecteur M_non_lin = [y';y'';theta';theta'']