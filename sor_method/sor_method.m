function [x, iter, r] = sor(A, b, w, epsilon, kmax)
    n = length(b);
    x = zeros(n, 1);
    L = tril(A, -1);
    R = triu(A, 1);
    
    iter = 0;
    r = zeros(kmax, 1);
    
    while iter < kmax
        x_old = x;
        
        for i = 1:n
            x(i) = (1 - w) * x_old(i) + (w / A(i, i)) * (b(i) - L(i, :) * x - R(i, :) * x_old);
        end
        
        res = norm(A * x - b);
        iter = iter + 1; 
        r(iter) = res; 
        
        if res < epsilon
            break;
        end
    end
    
    disp('x = ');
    disp(x);
    disp('iter = ');
    disp(iter);
    disp('hres = ');
    disp(r(1:iter));
end

A = input('');
b = input('');
w = input('');
epsilon = input('');
kmax = input('');

[x, iter, r] = sor(A, b, w, epsilon, kmax);
