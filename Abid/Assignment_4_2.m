clc;

given_funciton = @(x) (exp(x) * sin(x)) / (1 + power(x, 2)) ;
get_step_number = @(a, b, h) (b - a)/h; 

exact_val = 0.608087094906320;

for i = 1:15
    step_size = 2^-i;
    step_number = get_step_number(0, 1, step_size);
    simpsonResult = simpsonsSum(step_number, step_size, given_funciton);

    fprintf('Simpson %d \t - \t %.15f\n', i, (simpsonResult));
end


function [simpsonsSumRes] = simpsonsSum(step_number, step_size, given_funciton)
    total_sum = 0;
    odd_step_sum = 0;
    even_step_sum = 0; 

    for i = 0:step_number
        point_val = i * step_size;

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


