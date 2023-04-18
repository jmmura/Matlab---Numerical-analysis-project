function [ode_lin] = ode45_lin(t,condis)

pas_temps=0.1;
t=t(1):pas_temps:t(end);

tol=0.001;
options = odeset('Reltol', tol);

[~,ode_lin]=ode45(@(t,condis)odefunction_lin(t,condis),t,condis,options);

figure
subplot(121)
plot(t,ode_lin(:,1))
title('Y(t) Ode45 linéaire')
xlabel('Temps [s]');ylabel('Y [m]');

subplot(122)
plot(t,ode_lin(:,3))
title('Theta(t) Ode45 linéaire')
xlabel('Temps [s]');ylabel('Theta [rad]');

end
