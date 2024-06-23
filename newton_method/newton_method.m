function common_tangent(t0, s0, epsilon)
    f1 = @(t,s) (-2 * s * sin(t) - cos(t));
    f2 = @(t,s) (s^2 - 2 * s * cos(t) + sin(t));

    u0 = [t0, s0]';
    f = @(t,s) [f1(t,s), f2(t,s)]';
    J = @(t,s) [(-2 * s * cos(t) + sin(t)), (-2 * sin(t)); (2 * s * sin(t) + cos(t)), (2 * s - 2* cos(t))];

    erro = inf;
    iter = 0;

    while erro >= epsilon
        v = J(u0(1),u0(2)) \ f(u0(1),u0(2));
        u = u0 - v;
        erro = norm(u-u0,2);
        u0 = u;
        
        if iter > 1000
            break;
        end
        iter = iter + 1;
    end
    fprintf("Pontos:\n");
    fprintf("A = (%.4f,%.4f)\n",cos(u0(1)),sin(u0(1)));
    fprintf("B = (%.4f,%.4f)",u0(2),u0(2)^2);
end

t0 = input("");
s0 = input("");
epsilon = input("");

common_tangent(t0, s0, epsilon);