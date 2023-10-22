clear all; clc;
format long
R = 15;
p = 0.71;
fun_handle = @(h) h^3 -3*R*h^2 +4*R^3*p;
dfun_handle = @(h) 3*h^2-6*R*h;
a=5;b=25;Tol=1e-15;max_iter=100;
p0 = 5; p1 = 25;
tic
[pb, maxIterb] = bisection(fun_handle,a,b,Tol,max_iter);
[pn, maxItern] = newton_raphson(fun_handle,dfun_handle,p0,Tol,max_iter);
[ps, maxIters] = secant(fun_handle,p0,p1,Tol,max_iter);
toc
approximations = [pb, pn, ps];
numofiters = [maxIterb, maxItern, maxIters];
disp(approximations);
disp(numofiters);
%real_root = 2 - sqrt(2);
%abs_error = abs(p - real_root);
%disp(abs_error);