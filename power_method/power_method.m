function [x, k] = metodo_potencias(x0, m, s)

    n = size(m, 1);
    A = zeros(n);
    A(1, :) = m;

    for i = 1:n-1
        A(i+1, i) = s(i);
    end

    x = x0;
    erro = inf;
    k = 0;
    tol = 1e-6;

    while erro > tol
        x_proximo = A * x;
        x_proximo = x_proximo / norm(x_proximo);
        
        erro = abs(abs(x_proximo' * x) - 1);
        x = x_proximo;
        k = k + 1;
    end

    disp('x = ');
    disp(x);
    fprintf('k = %d\n', k);
end

x0 = input('');
m = input('');
s = input('');

metodo_potencias(x0, m, s);