function [T] = explicite_nl(t,condis_init)


%Constantes
alpha=0.1;
A=27500;

pas_temps=0.001;
t=t(1):pas_temps:t(end);

pas_Euler=0.001;
T=zeros(length(t),4);
T(1,:)=condis_init;

for i=2:length(t)
    T(i,:) = T(i-1,:)+ pas_Euler *((odefunction_nl(t(i),T(i-1,:),A,alpha)'));
end

figure
subplot(121)
plot(t,T(:,1),'b')
title('Y(t) Euler Explicite non linéaire')
xlabel('Temps [s]');ylabel('y [m]');

subplot(122)
plot(t,T(:,3),'r');
title('Theta(t) Euler Explicite non linéaire')
xlabel('Temps [s]');ylabel('theta [rad]');

end




