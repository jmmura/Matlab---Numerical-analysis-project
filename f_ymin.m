function force = f_min(y,theta)

K=1000;
alpha=0.1;
l=6;

ymin= y-l*sin(theta);

force = (K/alpha)*(exp(alpha*ymin)-1);
