function gauss_pivoteamento_parcial(A)
  n = size(A, 1);
  P = eye(n);
  L = zeros(n,n);  
  U = A;

  pks = {};
  mks = {};

  for k = 1:n-1
    [~, m] = max(abs(U(k:n,k)));
    p = m + k - 1;

    if p ~= k
      temp = P(k,:);
      P(k,:) = P(p,:);
      P(p,:) = temp;

      temp = U(k,:);
      U(k,:) = U(p,:);
      U(p,:) = temp;

      temp = L(k,:);
      L(k,:) = L(p,:);
      L(p,:) = temp;
    end

    Pk = eye(n);
    Pk([k,p],:) = Pk([p,k],:);
    pks{end+1} = Pk;

    Mk = eye(n);
    Mk(k+1:end, k) = -U(k+1:end, k) / U(k, k); 

    U(k+1:end, :) = U(k+1:end, :) + Mk(k+1:end, k) * U(k, :);
    mks{end+1} = Mk;

    L(k+1:end, k) = -Mk(k+1:end, k);  

  end
    
  % hardcode para ajustar os valores 
  % da diagonal principal de L
  L(1:n+1:end) = 1;

  invA = inv(A);
  disp('inv(A) =');
  disp(invA);

  disp('L =');
  disp(full(L)); 

  disp('U =');
  disp(U);

  disp('P =');
  disp(P);

  for i = 1:length(pks)
    fprintf('P%d =\n', i);
    disp(pks{i});
  end

  for i = 1:length(pks)
    fprintf('M%d =\n', i);
    disp(mks{i});
  end
end

str = input('', 's');
A = str2num(str);
gauss_pivoteamento_parcial(A)
