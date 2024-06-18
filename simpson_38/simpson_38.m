function I = simpson(fun, a, b, N)

    if mod(N,3) >0
        % n de segmentos deve ser multiplo de 3
        N = N * 3;
    end

    x = a;
    h = (b - a) / N;
    s = 0;
    for i = 1: (N / 3)
        s = s + fun(x) + 3*fun(x+h) + 3*fun(x+2*h) + fun(x+3*h);
        x = x + 3 * h;
    end
    I = (3 / (N * 8)) * (b - a) * s;
    fprintf('%.9f\n', I);
    end


fun = input("");
limits = input("");
N = input("");

simpson(fun, limits(1), limits(2), N);