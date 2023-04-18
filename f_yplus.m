function force = f_yplus(y,theta,alpha)

K=1000;
l=6;

yplus= y+l*sin(theta);

force = (K/alpha)*(exp(alpha*yplus)-1);
