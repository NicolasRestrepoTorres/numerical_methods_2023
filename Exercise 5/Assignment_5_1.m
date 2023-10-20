clc;

%% ODE solver in matlab
tspan = [0 10];
y0 = 0;
[t,y] = ode45(@(t,y) -10*y + 30 - 18*exp(-t), tspan, y0);

plot(t,y,'-o')

