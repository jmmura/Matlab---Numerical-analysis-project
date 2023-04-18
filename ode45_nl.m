function [x,ode_nl] = ode45_nl(t,condis,A,alpha)


pas_temps=0.1;
t=t(1):pas_temps:t(end);

tol=0.001;
options = odeset('RelTol', tol);

[x,ode_nl]=ode45(@(t,condis)odefunction_nl(t,condis,A,alpha),t,condis,options);


end


