%% Class 5 Problem 6
format long
clear all; clc
f = @(x) x^3-7*x^2+14*x-6;
df = @(x) 3*x^2-14*x+14
a=0; b=1; Tol=1e-15; Max_iter=100; p0=0; p1=1;
secant_tolerance = 1e-12;
[pB, NiterB] = newtonraphson(f, df, p0, Tol, Max_iter);
[pN, NiterN] = newtonraphson(f, df, p0, Tol, Max_iter);
[pS, NiterS] = secant(f, df, p0, Tol, Max_iter);

approximations=[pB, pN, pS];
number_of_iterations = [NiterB, NiterN, NiterS];
disp(approximations)
disp(number_of_iterations)

function stop = check_stop_condition(precision, tolerance)
    if precision < tolerance
       stop = true
    else
       stop = false
    end
end

function [p, iter_n] = newtonraphson(f, df, p0, tolerance, max_iter)
    iter_n = max_iter;
    pn = p0;
    for i = 1:max_iter
        pn1 = pn - (f(pn) / df(pn));
        precision = abs(pn1 - pn);
        stop = check_stop_condition(precision, tolerance);
        if stop
            break
        else
            iter_n = iter_n - 1
        end
        pn = pn1
    end
    p = pn
    iter_n = i
end


function [p, iter_n] = secant(f, df, p0, tolerance, max_iter)
    p = p0
    for k = 1:max_iter
        dp = f(p) / df(p);
        p = p - dp;
        if abs(dp) < tolerance
            break
        end
        
    end

    iter_n = k

end

function [p, iter_n] = bisection (fun_handle, a, b, tolerance, max_iter)
    an = a;
    bn = b;
    
    fan = fun_handle(an);
    fbn = fun_handle(bn);
    pn = (a+b) / 2;
    iter_n = NaN;

    for i = 1:max_iter
        iter_n = i;
        pn = (an + bn)/2;
        fpn = fun_handle(pn);
        if fpn == 0
            break
        elseif (fan*fpn) < 0
            an = an;
            fan = fan;
            bn = pn;
            fbn = fpn;
        else
            an = pn;
            fan = fpn;
            bn = bn;
            fbn = fbn;
        end
        if (b - a)/(2^i) < tolerance
            break
        end
    end
    p = pn;
end