clear all;
close all;
clc;
%% 9.5
n = 500;
m = 100;

%% a) Centering step
%% verify quadratic convergance and 
[A,b,c,x0] = randGen(m,n);
[x, v, l2] = centeringStep(A , b , c , x0);
semilogy(l2);
%% alpha and beta effect on convergance
[x, v, l2] = centeringStep(A , b , c , x0);
semilogy(l2);
%% check kkt
norm(c - x.^(-1) + A'*v)
norm(A*x - b)

%% b) LP solver with strictly feasible starting point
[A,b,c,x0] = randGen(m,n);
[x_opt, hist] = lps_SP(A , b , c , x0);
[xx, yy] = stairs(cumsum(history(1,:)),history(2,:));
semilogy(xx,yy);

cvx_begin
    variable x(n)
    minimize(c' * x)
    subject to
        A*x == b
        x >= 0
cvx_end
myoptval = c'*x_opt

%% c) LP solver
[x_opt,status] = lps(A , b , c);
cvx_begin
    variable x(n)
    minimize(c'*x)
    subject to
        A*x == b
        x >= 0
cvx_end
myoptval = c'*x_opt
