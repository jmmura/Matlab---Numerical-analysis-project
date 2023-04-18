function x = max_force(t,condis_init,A,alpha)
%Fonction calculant la force maximale exercée dans les cables

M = ode45_nl(t,condis_init,A,alpha);
vals_y = M(:,1);
vals_theta=M(:,3);
fp=f_yplus(vals_y,vals_theta,alpha);
fm=f_ymin(vals_y,vals_theta);
x=max(max(fp),max(fm));