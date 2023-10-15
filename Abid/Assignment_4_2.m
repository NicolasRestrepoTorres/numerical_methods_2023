clc;

given_funciton = @(x) (exp(x) * sin(x)) / (1 + power(x, 2)) ;
get_step_number = @(a, b, h) (b - a)/h; 

exact_val = 0.6080870949063203;
integral_lower = 0;
integral_higher = 1;

midpointErros = [];
simpsonErrors = [];
step_sizes = [];

fprintf('Result: \n\n');

for i = 1:15
    step_size = 2^-i;
    step_sizes = [step_sizes, step_size];

    step_number = get_step_number(integral_lower, integral_higher, step_size);
    
    midpointResult = midpointRule(step_number, step_size, given_funciton, integral_lower);
    midpointErros = [midpointErros, abs(exact_val - midpointResult)];

    simpsonResult = simpsonsSum(step_number, step_size, given_funciton, integral_lower);
    simpsonErrors = [simpsonErrors, abs(exact_val - simpsonResult)];

    fprintf('For stepsize %.6f -> midpointRes = %.16f , simpsonRes = %.16f\n',step_size, midpointResult, simpsonResult);
end

fprintf('\n\nErrors: \n\n')
for i = 1:15
    fprintf('For stepsize %.6f -> midpointErros = %.16f , simpsonErrors = %.16f\n',step_sizes(i), midpointErros(i), simpsonErrors(i));
end 

loglog(step_sizes, midpointErros, '-b', 'DisplayName', 'Midpoint Errors');
hold on;
loglog(step_sizes, simpsonErrors, '-r', 'DisplayName', 'Simpson Errors');

xlabel('Step Size');
ylabel('Errors');
legend('Location', 'northwest');

function [midpointRes] = midpointRule(step_number, step_size, given_funciton, integral_lower)
    midpointRes = 0;

    for i = 0:step_number-1
        mid_point_val = integral_lower + (i + 0.5) * step_size;
        midpointRes = midpointRes + (given_funciton(mid_point_val) * step_size);
    end
end


function [simpsonsSumRes] = simpsonsSum(step_number, step_size, given_funciton, integral_lower)
    total_sum = 0;
    odd_step_sum = 0;
    even_step_sum = 0; 

    for i = 0:step_number
        point_val = integral_lower + (i * step_size);

        if i == 0 || i == step_number
            total_sum = total_sum + given_funciton(point_val);
        elseif mod(i, 2) == 1
            odd_step_sum = odd_step_sum + given_funciton(point_val);
        elseif mod(i, 2) == 0
            even_step_sum = even_step_sum + given_funciton(point_val);
        end
    end
    
    total_sum = total_sum + (4 * odd_step_sum) + (2 * even_step_sum);
    simpsonsSumRes = (step_size/3) * total_sum;
end

