%% Information
% Final Project, Stage 4, Optimized PID Controller
% Programmer: Golnaz Esmaeili
% Date: 1400/08/08
clc;
clear;
close all;

%% Start of optimization
% Objective function and constraints
obj_fcn=@(k) simulation_fcn(k,'j',false);
lb=[-10, -10, -10];
ub=[50, 50, 50];
u_max=20;
nvar=numel(lb);
cns_fcn=@(k) input_constraint(k,u_max);
opt_alg=2; % 1 for ga and 2 for fmincon
% It takes a long to run the code with ga, so it's better
% to obtain the best variables with fmincon function.

%% Optimization
if opt_alg==1
    options=optimoptions('ga','Display','iter','PlotFcn', @gaplotbestf);
    k=ga(obj_fcn,nvar,[],[],[],[],lb,ub,cns_fcn,options);
elseif opt_alg==2
    k0=lb+rand(1,nvar).*(ub-lb);
    options = optimoptions('fmincon','Display','iter','Algorithm',...
        'sqp','MaxIterations',30);
    
    k=fmincon(obj_fcn,k0,[],[],[],[],lb,ub,cns_fcn,options);
end

j = simulation_fcn(k,'j',true);
[c,~]=input_constraint(k,u_max);

%% Displying results
disp("optimum values to minimize objective function 'J' :")
disp(k)
disp(["Objective function value:", num2str(j)])
disp(["Constraint value:",c])