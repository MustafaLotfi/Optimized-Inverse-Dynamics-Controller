# Optimized-PID-Controller
## Problem
### We have a dynamical system and we want to force it to track input reference. the controller we selected is PID. The problem is finding the best coefficients for PID controller, with Optimization Algorithms of Matlab.

Dynamical system:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-03-47.png">
</div>
PID controller structure:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-04-07.png">
</div>
Input reference:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-12-50.png">
</div>
Disturbance:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-35.png">
</div>
Sensor noise:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-04-27.png">
</div>
Saturation constraints of the controller:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-46-14.png">
</div>
Objective function:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-54.png">
</div>
Optimization variables (PID coefficients):
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-07-20.png">
</div>

## Solve the problem
Explaining the codes in bellow:

plant.m --> Differential equation of the system.

SLV.m --> Runge-kutta method to solve differential equations.

simulation_fcn.m --> Simulate the system in time with controller input.

main.m --> Used Optimizatoin Agorithms of Matlab to obtain best PID coefficients.

## Results:
Supposing bellow parameters for system:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-20-51.png">
</div>
### I got this results
Reference input tracking diagram:
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

optimum values to minimize objective function J :
kp=16.5735, kd=6.4122, ki=19.1475

Objective function value: 0.0056615

Constraint value: -8.4102

## how ot run
1.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

2.Change parameters of main.m file if you want and then run the file in Matlab to find the best coefficients.
