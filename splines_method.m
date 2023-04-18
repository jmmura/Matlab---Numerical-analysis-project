function [Y] = splines_method(t) 

%Lecture des données du fichier Excel
donnees = xlsread('enveloppe.xls');
temps = donnees(:,1);
angles = donnees(:,2);

Y = interp1(temps,angles,t,'splines');      %Interpolation par splines cubiques des données du tableau Excel

end