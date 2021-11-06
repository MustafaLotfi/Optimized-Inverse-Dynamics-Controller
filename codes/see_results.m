%% Information
% Final Project, Stage 4, Optimized PID Controller
% Programmer: Golnaz Esmaeili
% Date: 1400/08/08
clc;
clear;
close all;

%% Simulation
k=[50,20,50];
j=simulation_fcn(k,'j',true);
