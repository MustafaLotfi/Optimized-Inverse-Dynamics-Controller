# Optimized-PID-Controller
## Problem
### Optimized PID controller design for tracking reference input in presence of time variant disturbance and saturated actutor.

For a given dynamical system like this:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-03-47.png">
</div>
The PID controller structure is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-04-07.png">
</div>
Input reference is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-12-50.png">
</div>
and disturbance is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_20-06-35.png">
</div>
Sensor noise is:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-04-27.png">
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
I wrote some codes that I'll explain them in bellow:

plant.m --> Differential equation of the system.

SLV.m --> Runge-kutta method to solve differential equations.

simulation_fcn.m --> simulate the system with controller input

main.m --> used Optimizatoin Agorithms of Matlab to obtain best PID coefficients.

## Results:
Supposing bellow parameters for system:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2021-11-06_21-20-51.png">
</div>
I got this results:
<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/1.png">
</div>

<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/2.png">
</div>

<div align="left">
  <img src="https://github.com/MustafaLotfi/Optimized-PID-Controller/blob/main/displaying/3.png">
</div>

'''
Iter  Func-count            Fval   Feasibility   Step Length       Norm of   First-order  
                                                                       step    optimality
    0           4    5.738366e-03     0.000e+00     1.000e+00     0.000e+00     4.598e+02  
    1          38    5.645441e-03     0.000e+00     2.254e-05     1.420e-03     3.183e+02  
    2          82    5.643358e-03     0.000e+00     6.367e-07     2.078e-05     5.976e+02  
    3          97    5.643358e-03     0.000e+00     4.748e-03     1.684e-05     1.704e+02  

Local minimum possible. Constraints satisfied.

fmincon stopped because the size of the current step is less than
the value of the step size tolerance and constraints are 
satisfied to within the value of the constraint tolerance.

<stopping criteria details>
optimum values to minimize objective function 'J' :
   16.5735    6.4122   19.1475

    "Objective function value:"    "0.0056615"

    "Constraint value:"    "-8.4102"
'''

## how ot run
1.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

2.Change parameters of main.m file if you want and then run the file in Matlab to find the best coefficients with Optimization Algorithm.
