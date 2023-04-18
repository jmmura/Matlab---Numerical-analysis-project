function x = Secante(f,x0,x1,search,tol,nb_itr_max)
tic
f0=f(x0)-search;
f1=f(x1)-search;

for i=1:nb_itr_max-1
    x=x1-f1*(x1-x0)/(f1-f0);
    fx=f(x)-search;
    x0=x1;
    f0=f1;
    x1=x;
    f1=fx;
    dy=abs(x0-x1);
    if dy<tol
        break
    end    
end
toc