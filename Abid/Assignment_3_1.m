% The equation in findAandB can be wrong. Just putting the right equation should work


clc;

given_x = [0.1, 0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9];
given_y = [2.04, 0.07, -2.52, 0.07, 2.04, -0.18, -0.78, 0.22, -0.78, -0.18];
given_equation = @(A, B, x) A * cos(2 * pi * x) + B * sin(3 * pi * x);

[output_A, output_B] = findAandB(given_x, given_y);
disp("Output A: " + char(output_A))
disp("Output B: " + char(output_B))

drawGraph(output_A, output_B, given_x, given_y, given_equation)


function [output_A, output_B] = findAandB(given_x, given_y)
    sumY = sum(given_y);

    sumCos2pi = sum(cos(2*pi*given_x));
    sumSin3pi = sum(sin(3*pi*given_x));

    sumCos2piSquare = sumCos2pi * sumCos2pi;
    sumSin3piSquare = sumSin3pi * sumSin3pi;

    syms A B;
    Equation_1 = (A * sumCos2piSquare) + (B * sumCos2pi * sumSin3pi) - (sumY * sumCos2pi);
    Equation_2 = (A * sumCos2pi * sumSin3pi) + (B * sumSin3piSquare) - (sumY * sumSin3pi);
    
    solutions = solve([Equation_1, Equation_2], [A, B]);
    output_A = solutions.A;
    output_B = solutions.B;
end


function drawGraph(A, B, given_x, given_y, given_equation)
    y = given_equation(A, B, given_x);
    plot(given_x, y, Color='b')
    hold on 
    scatter(given_x, given_y, 'r');
end


