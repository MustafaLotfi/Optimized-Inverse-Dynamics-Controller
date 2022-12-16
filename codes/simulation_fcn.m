function vars = simulation_fcn(theta,j_u)
%% Simulation Parameters
t0=0;
t_f=30;
dt=0.02;
h=dt/2;
n=floor((t_f-t0)/dt);
t=linspace(t0,t_f,n);

%% Plant Parameters
m=2;
c=1.5;
k1=2;
k2=1;

x0=[-1;-1];

%% Input Parameters
A=2;
w=1.2;

%% Disturbance & Noise Parameters
d0=1; %2;
a=0.5; %1.5;
wd=4;
sigma_p=0.01;
sigma_v=0.01;

%% Controller Parameters
kp=theta(1);
kd=theta(2);
ki=theta(3);

%% Restoring Parameters
params.dt=dt;
params.h=h;
params.m=m;
params.c=c;
params.k1=k1;
params.k2=k2;

%% Initializing
x=zeros(numel(x0),n);
xn=x;
err=x;
u=zeros(1,n);
d_vec = u;

% harmonic input
% x_d=[A*sin(w*t);
%     A*w*cos(w*t);
%     -A*w^2*sin(w*t)];

% step input
x_d = [ones(1, n);zeros(2,n)];

x(:,1)=x0;
%% Simulation Loop
for i=1:n
    d=d0+a*sin(wd*t(i));
    d_vec(i) = d;
    params.d=d;
    
    xn(:,i)=x(:,i)+[sigma_p*randn;sigma_v*randn];
    
    err(:,i)=xn(:,i)-x_d(1:2,i);
    
    u(i)=c*xn(2,i)+k1*xn(1,i)+k2*xn(1,i)^3+m*(x_d(3,i)-kd*err(2,i)...
        -kp*err(1,i)-ki*dt*trapz(err(1,:)));
    
    x(:,i+1)=SLV(x(:,i),u(i),params);
end

j = sum(err(1,:).^2)/n;

if j_u=='j'
    vars=j;
elseif j_u=='u'
    vars=u;
else
    vars.t = t;
    vars.x = x;
    vars.x_d = x_d;
    vars.u = u;
    vars.j = j;
    vars.d = d_vec;
    vars.k = theta;
    vars.err = err;
end

end
