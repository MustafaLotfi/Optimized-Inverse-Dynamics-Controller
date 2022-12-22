%% Information
%%% Project: Optimized Inverse Dynamic Controller
%%% Programmer: Mostafa Lotfi
%%% Date: 1/1/2022
%%% Matlab version: 2021a

%%% Breif description: In this project, a dynamical system has been
%%% controlled using Optimized Inverse Dynamics method. The system is a
%%% nonlinear mass-spring and represented with a second order Oridinary
%%% Differential Equation (ODE). In addition, the system is exposed to 
%%% harmonic disturbance and white gaussian noise. To find the best 
%%% coefficents of the controller, optimization algorithms were used. The 
%%% algorithms are Gradient Descent and Genetic. 
clc;
clear;
close all;

%% Start of optimization
% Objective function and constraints
default_k = [49, 25, 50];
opt_alg=0;
% To find the best coefficients, enter either 1 to use ga or 2
% to use fmincon. if you want to use the default values, enter 0.
% Warning: It takes a long time to run the code with ga, so it's better
% to achieve the best coefficents with fmincon function.
% It is possible that in primary application runs, the algorithms get
% some coeffs that causing system instability. So run the program
% frequently untill gaining the best coeffs.

obj_fcn=@(k) simulation_fcn(k,'j');
lb=[-10, -10, -10];     % Lower bound for coeffs
ub=[50, 50, 50];        % Upper bound for coeffs
u_max=20;               % Constraint: Maximum value for unput
nvar=numel(lb);
cns_fcn=@(k) input_constraint(k,u_max);

%% Optimization
if opt_alg==1
    options=optimoptions('ga','Display','iter','PlotFcn', @gaplotbestf);
    k=ga(obj_fcn,nvar,[],[],[],[],lb,ub,cns_fcn,options);
elseif opt_alg==2
    k0=lb+rand(1,nvar).*(ub-lb);
    options = optimoptions('fmincon','Display','iter','Algorithm',...
        'sqp','MaxIterations',30);
    
    k=fmincon(obj_fcn,k0,[],[],[],[],lb,ub,cns_fcn,options);
else
    k = default_k;
end

vars = simulation_fcn(k,'x');
[c,~]=input_constraint(k,u_max);

%% Ploting resutls
static_plots(vars)
dynamic_plot(vars)

%% Displying results
disp("optimum values to minimize objective function 'J' :")
disp(k)
disp(["Objective function value:", num2str(j)])
disp(["Constraint value:",c])