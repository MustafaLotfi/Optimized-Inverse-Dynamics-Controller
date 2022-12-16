function static_plots(vars)
t = vars.t;
x_d = vars.x_d;
x = vars.x;
u = vars.u;
err = vars.err;

%% Plotting Results
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