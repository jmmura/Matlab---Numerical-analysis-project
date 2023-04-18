tic
profile on

%Paramètres de la fonction 'force_foncA'
interv_A=27000:30000;                                                           %Intervalle des valeurs de A
interv_alpha=0.1:0.005:0.2;                                                     %Intervalle de valeurs de alpha
interv_temps=0:1000;                                                            %Intervalle de temps
vals_A=zeros(1,length(interv_alpha));   
condis_init=[0;0;0.002;0];                                                      %Conditions initiales


for i=1:length(interv_alpha)
    vals_A(i)=force_foncA(interv_temps,interv_A,condis_init,interv_alpha(i));   %vals_A(i) = amplitude de rupture A pour le alpha(i) correspondant
end

%Affichage du graphe de l'évolution de l'amplitude de rupture en fonction
%de alpha
figure
hold on
plot(interv_alpha,vals_A)
title('Amplitude de rupture A en fonction de Alpha')
xlabel('Alpha [m^(-1)]');
ylabel('A [N]')
grid


profile off
profile viewer
toc
