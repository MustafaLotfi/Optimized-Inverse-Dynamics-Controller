# Optimized-PID-Controller
## Problem
### Optimized PID controller design for tracking reference input in presence of time variant disturbance and saturated actutor.

For a given dynamical system like this:

The PID controller structure is:

Input reference:

disturbance:

We want to minimize the objective function:

Optimization variables are PID coefficients:

For a zero initial conditions, contorller variables should be found some how ot satisfy actuator saturation constraint:

## Results:


## how ot run
1.Change parameters of your dynamical system in simulation_fcn.m and input_constraint.m files.

2.Change parameters of main.m file if you want and then run the file in Matlab to find the best coefficients with Optimization Algorithm.
