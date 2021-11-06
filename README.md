# Optimized-PID-Controller
## Problem
### Optimized PID controller design for tracking reference input in presence of time variant disturbance and saturated actutor.

For a given dynamical system like this:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-04-58.png">
</div>
The PID controller structure is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-05-43.png">
</div>
Input reference is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-14.png">
</div>
and disturbance is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-35.png">
</div>
We want to minimize the objective function:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-54.png">
</div>
Optimization variables are PID coefficients:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-07-20.png">
</div>
For a zero initial conditions, contorller variables should be found some how to satisfy actuator saturation constraint:

## Solve the problem
I wrote some codes that I'll explain them bellow:

plant.m --> Differential equation of the system.

SLV.m --> Runge-kutta method to solve differential equations.

simulation_fcn.m --> simulate the system with controller input

main.m --> used Optimizatoin Agorithms of Matlab to obtain best PID coefficients.

## Results:


## how ot run
1.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

2.Change parameters of main.m file if you want and then run the file in Matlab to find the best coefficients with Optimization Algorithm.
