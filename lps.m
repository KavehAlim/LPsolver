function [x_opt, status] = lps(A , b , c)
  [m,n] = size(A);
   x0 = A\b;
   t = 2 + max(0 , -min(x0));
   c_ph1 = [zeros(n , 1) ; 1];
   A_ph1 = [A , -A * ones(n , 1)];
   b_ph1 = b - A * ones(n , 1);
   x_ph1 = x0 + (t - 1) * ones(n , 1); 
   [x,~] = lps_SP(A_ph1,b_ph1,c_ph1,[x_ph1;t]);
if (x(n+1) >= 1)
    x_opt = [];
    status = 'Infeasible';
return;
end
x_feas = x(1:n) +(1 - x(n+1)) * ones(n,1);
[x_opt, ~] = lps_SP(A , b , c , x_feas);
status = 'Solved';
end