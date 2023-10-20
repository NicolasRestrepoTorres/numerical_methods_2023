clc;

given_x = [0.1, 0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9];
given_y = [2.04, 0.07, -2.52, 0.07, 2.04, -0.18, -0.78, 0.22, -0.78, -0.18];
given_equation = @(A, B, x) A * cos(2 * pi * x) + B * sin(3 * pi * x);

[output_A, output_B] = findAandB(given_x, given_y);

disp("A : " + output_A);
disp("B : " + output_B);

rms_val = errorAnalysis(output_A, output_B, given_x, given_y, given_equation);
disp("RMS Value : " + rms_val);

drawGraph(output_A, output_B, given_x, given_y, given_equation);


function [output_A, output_B] = findAandB(given_x, given_y)
    sumCos2piSquare = sum(cos(2*pi*given_x).^2);
    sumSin3piSquare = sum(sin(3*pi*given_x).^2);

    sumCos2piSin3pi = sum(cos(2*pi*given_x) .* sin(3*pi*given_x));

    sum_y_cos2pi = sum(given_y .* cos(2*pi*given_x));
    sum_y_sin3pi = sum(given_y .* sin(3*pi*given_x));

    syms A B;
    Equation_1 = (A * sumCos2piSquare) + (B * sumCos2piSin3pi) - sum_y_cos2pi;
    Equation_2 = (A * sumCos2piSin3pi) + (B * sumSin3piSquare) - sum_y_sin3pi;

    solutions = solve([Equation_1, Equation_2], [A, B]);
    output_A = double(solutions.A);
    output_B = double(solutions.B);
end


function drawGraph(A, B, given_x, given_y, given_equation)
    custom_x = linspace(0, 2, 100);
    y = given_equation(A, B, custom_x);

    plot(custom_x, y, Color='b')
    hold on 
    scatter(given_x, given_y, 'r', 'filled');

    xlabel('X');
    ylabel('Y');
end


function [rms_val] = errorAnalysis(A, B, given_x, given_y, given_equation)
    error_sum = 0;
    for i=1:length(given_x)
        calc_y = given_equation(A, B, given_x(i));
        error_sum = error_sum + power(calc_y - given_y(i), 2);
    end
    
    rms_val = sqrt((1/length(given_x)) * error_sum);
end


