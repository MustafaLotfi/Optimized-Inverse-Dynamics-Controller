%%% Runge-kutta method to solve differential equations
function out=SLV(X,U,params)
dt=params.dt;
h=params.h;
n=floor(dt/h);
h=dt/n;

X(:,1)=X;
for i=1:n
    k1=h*plant(X(:,i),U,params); 
    k2=h*plant(X(:,i)+k1/2,U,params);
    k3=h*plant(X(:,i)+k2/2,U,params);
    k4=h*plant(X(:,i)+k3,U,params);
    X(:,i+1)=X(:,i)+1/6*(k1+2*k2+2*k3+k4);
end
out=X(:,n+1);
