function [M_lin] = odefunction_lin(t,y)
%Fonction calculant les d�riv�es des composants du vecteur y = [y;y';theta;theta']
%en fonction du temps dans le cas du mod�le de cable lin�aire 



%Constantes
A=27500;        %amplitude (N)
omega=3;        %fr�quence angulaire (rad/s) ; o� A*sin(omega*t) repr�sente l'excitation du vent
m=2500;         %masse du tablier de pont (kg)
l=6;            %demi-largeur du tablier de pont (m)
cy=25;          %coefficient d�amortissement (N*s/m)
ctheta=300;     %coefficient d�amortissement en torsion (N*m*s)
K=1000;         %raideur des c�bles(N/m)


%Calculs des d�riv�es
M_lin=zeros(4,1);
M_lin(1) = y(2);
M_lin(2) = (1/m)*(-(cy*y(2))-(2*K*y(1))+(A*sin(omega*t)));
M_lin(3) = y(4);
M_lin(4) = (3/(m*(l^2)))*(-(ctheta*y(4))-(2*K*(l^2)*sin(y(3))*cos(y(3))));

end

%vecteur M_lin = [y';y'';theta';theta'']


