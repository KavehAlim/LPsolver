function [x_opt, hist] = lps_SP(A , b , c , x0)
    e = 10 ^(-3);
    m = 200;
    t = 1;
    x = x0;
    hist = zeros(2 , 1000);
    i = 0;
    while(1)
        i = i + 1;
        [x, ~, l2] = centeringStep(A , b, t * c , x ); 
        dg = length(x0) / t;
        hist(: , i) = [size(l2,2) , dg];
        if dg < e
            break
        end
        t = m * t;
    end
    x_opt = x;
end