function [M_non_lin] = odefunction_nl(t,y,A,alpha)
%Fonction calculant les dérivées des composants du vecteur y = [y;y';theta;theta']
%en fonction du temps dans le cas du modèle de cable non linéaire 


%t: vecteur temps (s)
%A:  amplitude (N)
%alpha: constante caractérisant la non-linéarité de la raideur du câble (m^(-1))

%Constantes
omega=3;        %fréquence angulaire (rad/s) ; où A*sin(omega*t) représente l'excitation du vent
m=2500;         %masse du tablier de pont (kg)
l=6;            %demi-largeur du tablier de pont (m)
cy=25;          %coefficient d’amortissement (N*s/m)
ctheta=300;     %coefficient d’amortissement en torsion (Nms)
K=1000;         %raideur des câbles(N/m)  


%Distances verticale des extrémités du tablier par rapport à sa position d'équilibre (m)
ymin =  y(1) - l*sin(y(3));
ymax = y(1) + l*sin(y(3));


%Calculs des dérivées
M_non_lin=zeros(4,1);
M_non_lin(1) = y(2);
M_non_lin(2) = (1/m)*(-(cy*y(2))-((K/alpha)*(-2+exp(alpha*ymin)+exp(alpha*ymax)))+(A*sin(omega*t)));
M_non_lin(3) = y(4);
M_non_lin(4) = (3/(m*l*l))*(-(ctheta*y(4))+l*((K/alpha)*(exp(alpha*ymin)-exp(alpha*ymax)))*cos(y(3)));

%vecteur M_non_lin = [y';y'';theta';theta'']