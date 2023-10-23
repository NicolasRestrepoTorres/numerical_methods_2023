clear all; clc;
format long;
interval = linspace(1,15,15);
H_num =@(n) 2^(-n);
H_squared = @(n) n^2;
h = arrayfun(H_num,interval);
H_squared = arrayfun(H_squared, h);

f = @(x) x^x;
x0 = 1.5;
df = @(x) (x^x)*((1+log(x))^3 + (3/x)*(1+log(x))-(1/x^2));
CDF2 = @(h) (f(2*h+x0) -2*f(h+x0) +2*f(x0-h) -f(x0-2*h))/(2*h^3);

CDF2_values = arrayfun(CDF2, h);
df_value = df(x0);

error_CDF2 = abs(df_value - CDF2_values);
    
loglog(h,error_CDF2);
hold on
plot(h,CDF2_values,'--bx');
plot(h,H_squared,':r');
yline(df_value, '-');
legend({'Error (loglog scale)','Approximations with CDF','Order of convergence $(h^{2})$', 'Actual Value of third order derivative'}, 'Interpreter', 'latex', 'Location','southeast')

disp(df_value);
disp(CDF2_values);
disp(h);
disp(error_CDF2);
disp(2*sqrt(error_CDF2(11)/df_value))   