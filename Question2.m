tic

%Donn�es
A=27500;    %amplitude (N)
omega=3;    %fr�quence angulaire (rad/s) ; o� A*sin(omega*t) repr�sente l'excitation du vent
alpha=0.1;  %param�tre du mod�le du cable (m^(-1))   

%y repr�sente les d�placements verticaux du pont (m)
%theta repr�sente l�angle de torsion du tablier par rapport � l�horizontal(rad)

conditions_initiales=[0,0,0.002,0];  %[y, y', theta, theta'] 
t=0:1000;
tol=1e-3;

%Fonctions mod�le lin�aire
ode45_lin(t,conditions_initiales);
explicite_lin(t,conditions_initiales);

%Fonctions mod�le non lin�aire

y=ode45_nl(t,conditions_initiales,A,alpha);
x=0:0.1:1000;
figure
subplot(121)
hold on
plot(x,y(:,1))
title('Y(t) Ode45 mod�le non lin�aire')
xlabel('Temps [s]');ylabel('Y [m]');
grid
hold off

subplot(122)
hold on
plot(x,y(:,3))
title('Theta(t) Ode45 mod�le non lin�aire')
xlabel('Temps [s]');ylabel('Theta [rad]');
grid
hold off
explicite_nl(t,conditions_initiales);



toc