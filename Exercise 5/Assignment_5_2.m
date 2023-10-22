clc;
%% Assignment 5 - b) RK4 implementation

%% Declarations

computed_norms = [];
numerical_norms = [];
error_vectors_norms = [];
for q=1:4  
    h = 10^(-q)%0.05%10^(-q);    % Step size
    x = 0:h:10;   % Interval size                                     % Calculates upto y(3)
    disp(length(x));
    y = zeros(1,length(x)); % Initial filling with zeroes
    y(1) = 0.3; % Initial condition in the IVP problem 
        % initial condition
    F_xy = @(t,y) -10*y + 30 - 18*exp(-t);   %Function in a canonical form                 % change the function as you desire
    solution = @(t) 3 - (2*exp(-t)) - 0.7*exp(-10*t);
    rungeKuttaErrors = []; % Vector for keeping errors
    %tspan = [0,100]; 
    y0 = y(1);
    solution_vector = [];
    %[tx, yx] = ode45(F_xy, tspan, y0);
    %%
    %% Declaration of Runge Kutta equations according to Butcher table
    tau = 10^(-q);
    for i=1:(length(x)-1)                              
        k_1 = F_xy(x(i),y(i));
        k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
        k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
        k_4 = F_xy((x(i)+h),(y(i)+k_3*h));
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
        solution_vector = [solution_vector, solution(i+1)];
        %fprintf(' %.16f\n', abs(solution(i+1) - y(i+1))); Uncomment to display errors
        %rungeKuttaErrors = [rungeKuttaErrors, abs(solution(i+1) - y(i+1))];
    end
    computed_current_norm = norm(y);
    computed_norms = [computed_norms, computed_current_norm];
    disp(norm(solution_vector));
    numerical_current_norm = norm(solution_vector);
    numerical_norms = [numerical_norms, numerical_current_norm];
    error_vectors_norms = [error_vectors_norms, abs(computed_current_norm - numerical_current_norm)];
end



%% Graphs
%% Figure 1: Absolute value of errors
figure(1);
hold on;
plot(1:length(computed_norms), computed_norms, 'g-');
plot(1:length(numerical_norms), numerical_norms, 'o-');
xlabel("Tau size: 10^(x)");
ylabel("Norm vectors");
legend('numerical', ' analytical');
hold off;

figure(2);
hold on;
loglog(1:length(error_vectors_norms), error_vectors_norms, '--');
xlabel("Tau size: 10^(x)");
ylabel("Norm vectors");
legend('Absolute value errors');
hold off;
% PLOT FUNCTION AS TAU! ERRORS SHOULD BE DECREASING


% figure(2);
% loglog(1:length(rungeKuttaErrors), rungeKuttaErrors, 'DisplayName', 'Errors')
% grid;
% hold on;
% xlabel('Iteration number');
% ylabel('Absolute value of difference');
% title('Errors computed in log log')
% legend("Errors", '')
% hold off;
% % validate using a decent ODE integrator  
% 
% %% Figure 2: Plotting of the solution against the numerical solution
% figure(3);
% loglog(x,y, 'o-');
% hold on;
% loglog(tx,yx, '--' );
% xlabel('Step size')
% ylabel('Evaluation of the function')
% title('Analytical solution vs Runge Kutta computed')
% fplot(solution, tspan, 'g-');
% legend('Runge Kutta solution', 'ODE45 solver', 'Analytical solution');
% hold off;
% grid;
% %% Graphs



