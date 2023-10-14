f(x) = (exp(x) * sin(x)) / (1 + power(x, 2)) ;

a = 0;  
b = 1;  

integral_f = int(f, a, b); 

fprintf(' %.15f\n', integral_f);
