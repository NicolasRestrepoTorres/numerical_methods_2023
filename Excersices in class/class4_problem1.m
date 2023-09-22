%% Class 4 - Problem 1
clc

% Taking ten points 
interval = linspace(1,10,10);
H_num =@(n) 2^(-n);
h = arrayfun(H_num,interval);


f = @(x) x*exp(-2*x);
x0 = 1;
df = @(x) (1-2*x)*exp(-2*x);
FDF = @(h) (f(h+x0) - f(x0))/(h); 
CDF2 = @(h) (f(h+x0) - f(x0-h))/(2*h);  
CDF4 = @(h) (-f(x0+2*h) + 8*f(x0+h) - 8*f(x0-h) + f(x0-2*h))/(12*h);

FDF_values = arrayfun(FDF,h);
CDF2_values = arrayfun(CDF2,h);
CDF4_values = arrayfun(CDF4,h);
df_value = df(x0);

error_FDF = abs(df_value - FDF_values);
error_CDF2 = df_value - CDF2_values;
error_CDF4 = df_value - CDF4_values;

loglog(h,error_FDF);
hold on
loglog(h,h);

