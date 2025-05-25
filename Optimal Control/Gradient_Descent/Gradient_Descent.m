%% Implenetation of Gradient Descent Algorithm

%% Parameters
x = zeros(2, N);
x(:, 1) = [0.1; 0.1];
N = 50;
a = 0.01;
 
%% Funtion to be Omptimized
f = @(x) -log(1 - x(1) - x(2)) - log(x(1)) - log(x(2));
Gf = @(x) [1/(1 - x(1) - x(2)) - 1/x(1); 1/(1 - x(1) - x(2)) - 1/x(2)];
 
%% Golden Section Algorithm
for i = 1:N

    x(:, i + 1) = x(:, i) - a*Gf(x(:, i));

end

 %% Plot Convergence

plot(1:N+1, x);
grid on
xlabel('Iteration');
ylabel('x');
title('Gradient Descent Algorithm Optimization');