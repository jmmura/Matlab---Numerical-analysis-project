function [t,T] = explicite_lin(t,condis_init)


pas_temps=0.001;
t=t(1):pas_temps:t(end);

T=zeros(length(t),4);
T(1,:)=condis_init;
pas_Euler=0.001;

for i=2:length(t)
    T(i,:) = T(i-1,:)+ pas_Euler *((odefunction_lin(t(i),T(i-1,:)))'); 
end

figure
subplot(121)
plot(t,T(:,1))
title('Y(t) Euler explicite linéaire')
xlabel('Temps [s]');ylabel('Y [m]');

subplot(122)
plot(t,T(:,3))
title('Theta(t) Euler explicite linéaire')
xlabel('Temps [s]');ylabel('Theta [rad]');

end