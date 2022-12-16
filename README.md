# Optimized-PID-Controller
## Problem
In this project, a dynamical system has been controlled using Inverse Dynamics method. The controller also has Proportional-Integral-Derivative (PID) gains. The system is Mass-Spring and represented with a second order Oridinary Differential Equation (ODE). In addition the system is exposed to harmonic disturbance and white gaussian noise. To find the best coefficents of PID controller, optimization algorithms were used. The algorithms are Gradient Descent and Genetic.

### Dynamical system, inputs and other parameters:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/1.png">
</div>

## Solve the problem
Explaining the codes in bellow:

plant.m --> Differential equation of the system.

SLV.m --> Runge-kutta method to solve differential equations.

simulation_fcn.m --> Simulate the system in time with controller input.

main.m --> Used Optimizatoin Agorithms of Matlab to obtain best PID coefficients (fmincon & ga).

## Results:
Supposing bellow parameters for system:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-20-51.png">
</div>

Reference input and state variables:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/1.png">
</div>
Errors:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2.png">
</div>
Controller input:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/3.png">
</div>

Best values:

Optimum values to minimize objective function J :
kp=16.5735, kd=6.4122, ki=19.1475

Objective function value: 0.0056615

Constraint value: -8.4102

## how ot run
1.Clone the repository.

2.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

3.Change parameters of main.m file if you want.

4.Run main.m file in Matlab.
