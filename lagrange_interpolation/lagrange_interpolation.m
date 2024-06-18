function lagrange_barycentric(x, y, x_test)
    n = length(x) - 1;
    w = ones(n + 1, 1);
    
    for k = 1:n + 1
        for i = 1:n + 1
            if i ~= k
                w(k) = w(k) / (x(k) - x(i));
            end
        end
    end
    
    P = zeros(size(x_test));
    for j = 1:length(x_test)
        numerator = 0;
        denominator = 0;
        for k = 1:n + 1
            denominator_part = w(k) / (x_test(j) - x(k));
            numerator = numerator + denominator_part * y(k);
            denominator = denominator + denominator_part;
        end
        P(j) = numerator / denominator;
    end
    
    fprintf('Exato:\n');
    fprintf(' %.4f', sin(x_test));
    fprintf('\nInterpolado:\n');
    fprintf(' %.4f', P);
    fprintf('\nPesos:\n');
    fprintf(' %.4f', w);
end


x = input("");
y = input("");
x_test = input("");

lagrange_barycentric(x, y, x_test); 