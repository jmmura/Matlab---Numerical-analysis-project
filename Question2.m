tic

%Données
A=27500;    %amplitude (N)
omega=3;    %fréquence angulaire (rad/s) ; où A*sin(omega*t) représente l'excitation du vent
alpha=0.1;  %paramètre du modèle du cable (m^(-1))   

%y représente les déplacements verticaux du pont (m)
%theta représente l’angle de torsion du tablier par rapport à l’horizontal(rad)

conditions_initiales=[0,0,0.002,0];  %[y, y', theta, theta'] 
t=0:1000;
tol=1e-3;

%Fonctions modèle linéaire
ode45_lin(t,conditions_initiales);
explicite_lin(t,conditions_initiales);

%Fonctions modèle non linéaire

y=ode45_nl(t,conditions_initiales,A,alpha);
x=0:0.1:1000;
figure
subplot(121)
hold on
plot(x,y(:,1))
title('Y(t) Ode45 modèle non linéaire')
xlabel('Temps [s]');ylabel('Y [m]');
grid
hold off

subplot(122)
hold on
plot(x,y(:,3))
title('Theta(t) Ode45 modèle non linéaire')
xlabel('Temps [s]');ylabel('Theta [rad]');
grid
hold off
explicite_nl(t,conditions_initiales);



toc