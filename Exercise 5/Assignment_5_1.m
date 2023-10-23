clc;


tspan = [0 10]; % Range
y0 = 0; % Initial point
%% ODE solver in matlab
[t,y] = ode45(@(t,y) -10*y + 30 - 18*exp(-t), tspan, y0);
%% Exact solution provided
solution = @(t) 3 - (2*exp(-t)) - 0.7*exp(-10*t);


figure(1);
plot(t,y,'-o')
hold on;
fplot(solution,  tspan, y0);
title("Plot of solution function and ODE")
ylabel("y(t) with respect to time");
xlabel("y values");
legend('ODE45: -10*y + 30 - 18*exp(-t)', 'Exact solution');
hold off;

errors = [];

for ii = 1:numel(t)
    euclidean_distance = abs(solution(t(ii)) - y(ii));
    errors = [errors, euclidean_distance];
end

figure(2);
hold on;
plot(t, errors, 'r--');
title("Absolute errors in functions")
disp("The norm of the errors is")
ylabel("y(t) with respect to time");
xlabel("y values");
disp(norm(errors));
disp("Over a span of this many points")
disp(length(t))
hold off;

