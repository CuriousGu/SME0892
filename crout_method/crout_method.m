function [L, U] = crout_method(A)
    n = size(A, 1);
    L = zeros(n);
    U = eye(n);
    for k = 1:n
        L(k, k) = A(k, k) - L(k, 1:k-1) * U(1:k-1, k);
        for i = k+1:n
            L(i, k) = (A(i, k) - L(i, 1:k-1) * U(1:k-1, k)) / U(k, k);
        end
        for j = k+1:n
            U(k, j) = (A(k, j) - L(k, 1:k-1) * U(1:k-1, j)) / L(k, k);
        end
    end
end

str = input('', 's');
A = str2num(str);

[L, U] = crout_method(A);

disp("L = ");
disp(L);
disp("U = ");
disp(U);
