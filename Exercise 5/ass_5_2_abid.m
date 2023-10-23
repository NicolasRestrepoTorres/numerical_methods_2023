clc;
%% Assignment 5 - b) RK4 implementation

%% Declarations

computed_norms = [];
numerical_norms = [];
error_vectors_norms = [];
stepsizes = [];

for q=1:4
    h = 10^(-q);
    x = 0:h:10;

    stepsizes = [stepsizes, h];

    y = zeros(1, length(x)); 

    y(1) = 0.3;
    F_xy = @(t,y) -10*y + 30 - 18*exp(-t);           
    solution = @(t) 3 - (2*exp(-t)) - 0.7*exp(-10*t);

    solution_vector = [];
    solution_vector = [solution_vector, solution(x(1))];

    for i=1:(length(x)-1)
        k_1 = F_xy(x(i),y(i));
        k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
        k_3 = F_xy((x(i)+0.5*h),y(i)+0.5*h*k_2);
        k_4 = F_xy((x(i)+h),y(i)+k_3*h);
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
        solution_vector = [solution_vector, solution(x(i+1))];
        
        %fprintf(' %.16f  ->  %.16f\n', y(i+1), solution(i+1))
        %fprintf(' %.16f\n', abs(solution(i+1) - y(i+1))); Uncomment to display errors
        %rungeKuttaErrors = [rungeKuttaErrors, abs(solution(i+1) - y(i+1))];
    end
    
    %euclidean_distance = sqrt(sum((y - solution_vector).^2));
    %error_vectors_norms = [error_vectors_norms, euclidean_distance];
    
    computed_current_norm = norm(y);
    computed_norms = [computed_norms, computed_current_norm];
    
    %disp(norm(solution_vector));
    numerical_current_norm = norm(solution_vector);
    numerical_norms = [numerical_norms, numerical_current_norm];
    error_vectors_norms = [error_vectors_norms, abs(computed_current_norm - numerical_current_norm)];

end

fprintf(' %.16f', error_vectors_norms)
%disp(error_vectors_norms)
%disp(y)

%% Graphs
%% Figure 1: Absolute value of errors


loglog(stepsizes, error_vectors_norms, '-o');
% PLOT FUNCTION AS TAU! ERRORS SHOULD BE DECREASING





