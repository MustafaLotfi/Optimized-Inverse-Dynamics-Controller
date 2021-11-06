function [c, ceq]=input_constraint(k,u_max)
u=simulation_fcn(k,'u',false);
c=max(abs(u))-u_max;
ceq = [];
end