clear all; clf
f = @(x) x.^3-7*x.^2+14*x-6;
x=linspace(0,1,100);
y=f(x);
plot(x,y)
grid on
x0 = 1;
p = fsolve(f,x0);
pexact = 2 - sqrt(2)
error = abs(p - pexact)