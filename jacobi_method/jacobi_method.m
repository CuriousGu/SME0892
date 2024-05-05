function [k, x] = jacobi(A, b, x0, tol)
    n = length(b);
    x = x0;
    k = 0;
    err = inf;
    
    while err > tol
        x_new = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i, j) * x(j);
                end
            end
            x_new(i) = (b(i) - sigma) / A(i, i);
        end
        err = norm(x_new - x) / norm(x_new);
        x = x_new;
        k = k + 1;
    end
end

str = input('', 's');
A = str2num(str);

b = input('', 's');
b = str2num(b);

x0 = input('', 's');
x0 = str2num(x0);

tol = input('');

[k, x] = jacobi(A, b, x0, tol);

fprintf("k = %d\n", k);
disp("x =");
disp(x);