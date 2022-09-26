function [A, b, c, x] = randGen(m, n)
    A = (rand(m-1,n) - .5) * 100;
    A(m , :) = 10 * rand(1 , n);
    while (rank(A) < m)
        A = (rand(m-1,n) - .5) * 100;
        A(m , :) = 10 * rand(1 , n);
    end
    x = 100 * rand(n , 1);
    b = A * x;
    c = (rand(n , 1) - .5);
end