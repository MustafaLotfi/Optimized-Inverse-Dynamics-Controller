function out=plant(X,u,params)
m=params.m;
c=params.c;
k1=params.k1;
k2=params.k2;
d=params.d;

x=X(1);
dx=X(2);

d2x=1/m*(u+d-c*dx-k1*x-k2*x^3);

out=[dx;d2x];