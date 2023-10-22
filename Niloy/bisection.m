function [p, iter_n] = bisection (fun_handle, a, b, tolerance, max_iter)
    an = a;
    bn = b;
    
    fan = fun_handle(an);
    fbn = fun_handle(bn);
    pn = NaN;
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