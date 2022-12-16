# Optimized-PID-Controller
## Problem
In this project, a dynamical system has been controlled using Inverse Dynamics method. The controller also has Proportional-Integral-Derivative (PID) gains. The system is Mass-Spring and represented with a second order Oridinary Differential Equation (ODE). In addition the system is exposed to harmonic disturbance and white gaussian noise. To find the best coefficents of PID controller, optimization algorithms were used. The algorithms are Gradient Descent and Genetic.

## Dynamical system, inputs and other parameters:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/1.png">
</div>

## System response:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2.png">
</div>

## how ot run
1.Clone the repository.

2.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

3.Change parameters of main.m file if you want.

4.Run main.m file in Matlab.
