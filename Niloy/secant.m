function [p, iter_n] = secant(fun_handle, p0, p1, tolerance, max_iter)
    fpnminus = fun_handle(p0);
    pn = p1;
    pnminus = p0;
    for i = 1:max_iter
        iter_n = i;
        fpn = fun_handle(pn);
        pnplus = pn - ((pn - pnminus)*fpn/(fpn - fpnminus));
        if abs(pnplus - pn)/abs(pnplus) < tolerance
            break
        end
        pnminus = pn;
        pn = pnplus;
        fpnminus = fpn;
    end
    p = pn;
end