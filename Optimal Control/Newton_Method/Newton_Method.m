%% Implenetation of Newton Method Algorithm
clc;
clear;
close all;

%% Parameters
N = 7;
x = zeros(2, N);
x(:, 1) = [0.85; 0.05];
a = 1;
 
%% Funtion to be Omptimized
 f = @(x) -log(1 - x(1) - x(2)) - log(x(1)) - log(x(2));
 Gf = @(x) [1/(1 - x(1) - x(2)) - 1/x(1); 1/(1 - x(1) - x(2)) - 1/x(2)];
 Jf = @(x) [1/(1 - x(1) - x(2))^2 + 1/x(1)^2, 1/(1 - x(1) - x(2))^2; 1/(1 - x(1) - x(2))^2, 1/(1 - x(1) - x(2))^2 + 1/x(2)^2];
 
 %% Golden Section Algorithm
 for i = 1:N

     x(:, i + 1) = x(:, i) - a*Jf(x(:, i))^(-1)*Gf(x(:, i));

 end

 %% Plot Convergence

 plot(1:N+1, x);
 grid on
 xlabel('Iteration');
 ylabel('x');
 title('Newton Algorithm Optimization');