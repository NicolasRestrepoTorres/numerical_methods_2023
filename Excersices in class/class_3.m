%%Real solution

%% Problem 2

N = 100;
F= zeros(1,N);
F(1) = 0; F(2) = 1;
tic
for n=3:N
    F(n) = F(n-1) + F(n-2);
end
toc

%% Problem 1
f = 1./(1 + exp(-t));
g = 1./(1 + exp(-2*t));
v = 1./(1 + exp(-4*t));

subplot(3,1,1)
plot(t,f)
xlabel('time')
ylabel('energy')
title('Graph of f(x)')

subplot(3,1,2)
plot(t,g)
xlabel('time')
ylabel('energy')
title('Graph of g(x)')

subplot(3,1,3)
plot(t,v)
xlabel('time')
ylabel('energy')
title('Graph of v(x)')




%% Problem 1
t = linspace(-4, 4, 100)

function x = first(t)
    x = 1 / (1 + e^(-t))
end

function x = second(t)
    x = 1 / (1 + e^(-2*t))
end

function x = third(t)
    x = 1 / (1 + e^(-4*t))
end
