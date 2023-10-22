function [p, iter_n] = newton_raphson(fun_handle, dfun_handle, p0, tolerance, max_iter)
    pn = p0;
    for i = 1:max_iter
        iter_n = i;
        fpn = fun_handle(pn);
        dfpn = dfun_handle(pn);
        if fpn == 0
            break
        end
        pn1 = pn - fpn/dfpn;
        if abs(pn1 - pn) < tolerance
            p = pn1;
            break
        end
        pn = pn1;
    end
    p = pn;
end