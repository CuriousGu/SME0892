function least_squares_polynomial(x, y)

    for d = 1:3
        A = zeros(length(x), d + 1);
        for i = 0:d
            A(:, d + 1 - i) = x.^i;
        end
        coeffs = (A' * A) \ (A' * y');

        approximations = A * coeffs;
        truncation_error = sum((y' - approximations).^2);

        fprintf('\nPolinômio de grau %d\n', d);
        fprintf('-> Coeficientes:');
        fprintf(' %.4f', coeffs);
        fprintf('\n-> Aproximações:');
        fprintf(' %.4f', approximations);
        fprintf('\n-> Erro de truncamento: %.4f', truncation_error);
        fprintf("\n");
    end
end

x = input("");
y = input("");

least_squares_polynomial(x, y);