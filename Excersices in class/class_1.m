%%%%%% Class 1 exercises
%% Problem 1


% volumen = calculateVolumen(3, 8, 1)
% %result = loopVolumen(10)
% h = 0:6
% plot(h, volumen(3, 8, h), '-ro')
% hold on


%% Problem 2

%% Problem 7: Fibonacci conversion

example = fibonacci(20)
all_ratios = fibonacci_ratio(7)
ratio_result = ratio(20)

F(1) = 0; F(2) =1;
for n = 3:21
    F(n) = F(n-1) + F(n-2)
end
for n =1:20
    G(n) = F(n) / F(n+1)
    GR(n) = (sqrt(5)- 1) / 2
end
n = 1:20
plot(1:20, G, '-bo')
hold on
xlabel('n')
plot(1:20, GR, '-r')

function f = fibonacci(n)
 if (n==1)
     f= 1;
 elseif (n == 2)
     f = 2;
 else
     f = fibonacci(n-1) + fibonacci(n-2);   
 end
end

function f = fibonacci_ratio(n)
    for i=2:n
        current_ratio = fibonacci(i) / fibonacci(i - 1)
        disp("Fib number !" + current_ratio)
    end
    f = 111111

   
end

function r = ratio(n)
    r = fibonacci(n) / fibonacci(n + 1)
end

function gr = gr(n)
    gr = 1
end



function s = simpleLoop(x)
    for i=1:x
        disp("ah sopota madre !" + i)
    end
    s = 2
end

function s = loopVolumen(x)
    for i=1:x
        disp("ah sopota madre !" + i)
    end
end


function volumen = calculateVolumen(R, L, h)
    volumen = (R^2*acos((R-h)/R)-(R-h)*sqrt(2*R*h-h^2))*L;
end
