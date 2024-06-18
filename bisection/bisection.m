function h = find_h_bisection(V, L, r)
    tol = 1e-5;
    
    a = 0;
    b = r;
    
    volume_func = @(h) L * (0.5 * pi * r^2 - r^2 * asin(h/r) - h * sqrt(r^2 - h^2)) - V;
    
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        if volume_func(c) == 0
            break;
        elseif volume_func(a) * volume_func(c) < 0
            b = c;
        else
            a = c;
        end
    end
    
    h = (a + b) / 2;
    fprintf('%.4f\n', h);
end


V = input('');
L = input('');
r = input('');
h = find_h_bisection(V, L, r);