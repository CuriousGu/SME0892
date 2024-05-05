function [D, k, erros, spd] = francis_method(A, epsilon)
    n = size(A, 1);
    k = 0;
    erros = [];
    spd = 'não é';
    
    if isequal(A, A') && all(eig(A) > 0)
        spd = 'é';
    end
    
    while true
        [Q, R] = qr(A);
        A = R * Q;
        off_A = sqrt(sum(sum(A.^2)) - sum(diag(A).^2));
        erros = [erros; off_A];  
        
        k = k + 1;
        
        if off_A < epsilon
            D = sort(diag(A), 'descend');
            return;
        end
    end
end

A = input('');
epsilon = input('');

[D, k, erros, spd] = francis_method(A, epsilon);

disp('D = ');
disp(D);
fprintf('k = %d\n', k);
disp('erros = ');
disp(erros);
fprintf('A %s SPD\n', spd);