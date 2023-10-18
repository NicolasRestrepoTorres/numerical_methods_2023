clc;
%% Assignment 5 - b) RK4 implementation

%% Declarations
h = 0.05;    % Step size
x = 0:h:10;   % Interval size                                     % Calculates upto y(3)
y = zeros(1,length(x)); % Initial filling with zeroes
y(1) = 0.3; % Initial condition in the IVP problem 
    % initial condition
F_xy = @(t,y) -10*y + 30 - 18*exp(-t);   %Function in a canonical form                 % change the function as you desire
solution = @(t) 3 - (2*exp(-t)) - 0.7*exp(-10*t);
rungeKuttaErrors = []; % Vector for keeping errors
tspan = [0,100]; y0 = y(1);
[tx, yx] = ode45(F_xy, tspan, y0);
%%
%% Declaration of Runge Kutta equations according to Butcher table
for i=1:(length(x)-1)                              
    k_1 = F_xy(x(i),y(i));
    k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k_4 = F_xy((x(i)+h),(y(i)+k_3*h));
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
    %fprintf(' %.16f\n', abs(solution(i+1) - y(i+1))); Uncomment to display errors
    rungeKuttaErrors = [rungeKuttaErrors, abs(solution(i+1) - y(i+1))]
end
%% Graphs
%% Figure 1: Absolute value of errors
figure(1);
loglog(1:length(rungeKuttaErrors), rungeKuttaErrors, 'DisplayName', 'Errors')
grid;
hold on;
xlabel('Iteration number');
ylabel('Absolute value of difference');
title('Errors computed in log log')
legend("Errors", '')
hold off;
% validate using a decent ODE integrator  

%% Figure 2: Plotting of the solution against the numerical solution
figure(2);
loglog(x,y, 'o-');
hold on;
loglog(tx,yx, '--' );
xlabel('Step size')
ylabel('Evaluation of the function')
title('Analytical solution vs Runge Kutta computed')
fplot(solution, tspan, 'g-');
legend('Runge Kutta solution', 'ODE45 solver', 'Analytical solution');
hold off;
grid;
%% Graphs



