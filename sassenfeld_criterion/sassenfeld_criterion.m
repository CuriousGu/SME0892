function isConvergent = sassenfeld(A)
    n = size(A, 1);
    beta = zeros(n, 1);

    for i = 1:n
        sum1 = 0;
        for j = 1:i-1
            sum1 = sum1 + abs(A(i,j)) * beta(j);
        end
        
        sum2 = 0;
        for j = i+1:n
            sum2 = sum2 + abs(A(i,j));
        end
        
        beta(i) = (sum1 + sum2) / abs(A(i,i));  % division by A(i,i)
        
        if beta(i) >= 1
            isConvergent = false;
            return;
        end
    end
    
    isConvergent = max(beta) < 1;
end

str = input('', 's');
A = str2num(str);

if sassenfeld(A)
    disp('SATISFAZ');
else
    disp('NÃO SATISFAZ');
end