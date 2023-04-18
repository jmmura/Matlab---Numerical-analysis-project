function x = force_foncA(t,interv_A,condis_init,alpha)
%Fonction recherchant l'amplitude A donnant lieu à une tension
%de 7900 N dans les câbles

tol=0.1;
nb_it=50;

x=Secante(@(A)max_force(t,condis_init,A,alpha),interv_A(1),interv_A(end),7900,tol,nb_it);

end