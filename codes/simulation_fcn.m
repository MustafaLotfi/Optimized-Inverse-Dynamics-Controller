function out = simulation_fcn(theta,j_u,plot_results)
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

x0=[1;-1];

%% Input Parameters
A=2;
w=1.2;

%% Disturbance & Noise Parameters
d0=2;
a=1.5;
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
x_d=[A*sin(w*t);
    A*w*cos(w*t);
    -A*w^2*sin(w*t)];

x(:,1)=x0;
%% Simulation Loop
for i=1:n
    d=d0+a*sin(wd*t(i));
    params.d=d;
    
    xn(:,i)=x(:,i)+[sigma_p*randn;sigma_v*randn];
    
    err(:,i)=xn(:,i)-x_d(1:2,i);
    
    u(i)=c*xn(2,i)+k1*xn(1,i)+k2*xn(1,i)^3+m*(x_d(3,i)-kd*err(2,i)...
        -kp*err(1,i)-ki*dt*trapz(err(1,:)));
    
    x(:,i+1)=SLV(x(:,i),u(i),params);
end

j = sum(err(1,:).^2)/n;
if j_u=='j'
    out=j;
elseif j_u=='u'
    out=u;
end
%% Plotting Results
if plot_results
    x = x(:, 1:end-1);
    figure;
    subplot(2,1,1);
    plot(t,x_d(1,:),"LineWidth",2,"DisplayName","x_{d,1}");
    hold on
    plot(t,x(1,:),"--r","LineWidth",2,"DisplayName","x_1");
    grid on
    legend show
    ylabel('x(m)','fontsize',12,'fontweight','b')
    xlabel('time(s)','fontsize',12,'fontweight','b')
    
    subplot(2,1,2);
    plot(t,x_d(2,:),"LineWidth",2,"DisplayName","x_{d,2}");
    hold on
    plot(t,x(2,:),"--r","LineWidth",2,"DisplayName","x_{2}");
    grid on
    legend show
    ylabel('dx(m/s)','fontsize',12,'fontweight','b')
    xlabel('time(s)','fontsize',12,'fontweight','b')
    
    figure;
    subplot(2,1,1);
    plot(t,err(1,:),"LineWidth",2);
    grid on
    ylabel('e(m)','fontsize',12,'fontweight','b')
    xlabel('time(s)','fontsize',12,'fontweight','b')
    
    subplot(2,1,2);
    plot(t,err(2,:),"LineWidth",2);
    grid on
    ylabel('edot(m/s)','fontsize',12,'fontweight','b')
    xlabel('time(s)','fontsize',12,'fontweight','b')
    
    figure;
    plot(t,u,"LineWidth",2);
    grid on
    ylabel('u','fontsize',12,'fontweight','b')
    xlabel('time(s)','fontsize',12,'fontweight','b')
end
end
