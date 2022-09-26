function [x_opt, v_opt, l2] = centeringStep(A,b,c,x_0)
    x = x_0;
    e = 10 ^ (-6);
    l2 = zeros(1 , 200);
    beta = 0.8;
    alpha = 0.1;
    i = 0;
    f = @(x) c'*x - sum(log(x));
while(1) 
        i = i + 1;
        h_inv = diag(x.^(2));
        g = c - x.^(-1);
        v = (A * h_inv * A')\(-A * h_inv * g);
        dx = - h_inv * (g + A' * v);
        l2(i) = -dx' * g;
        if l2(i)/2 <= e
            break
        end
        t = 1;
        while ((min(x + dx * t) <= 0)|| ~(f(x + dx * t) < f(x) + alpha * t * g' * dx))
            t = t * beta;
        end
        x = x + t * dx;
    end
    x_opt = x;
    v_opt = v;
end