%% Implenetation of Finding Optimal Control Signal Using DP for a LQR System
clc;
clear;
close all;

%% Parameters
N = 200; % Number of samples
H = [2, 0; 0, 0];
Q = [2, 0; 0, 1];
R = 2;
A = [0.9974, 0.0539; -0.1078, 1.1591];
B = [0.0013; 0.0539];
F = zeros(1,2,N);
P = zeros(2,2,N);
P(:,:,1) = H;

%% Algorithm 
for k = 2:N-1

    F(:,:,N-k) = -(R + B'*P(:,:,k-1)*B)^(-1)*B'*P(:,:,k-1)*A;    
    P(:,:,k) = (A + B*F(:,:,N-k))'*P(:,:,k-1)*(A + B*F(:,:,N-k)) + F(:,:,N-k)'*R*F(:,:,N-k) + Q;

end

%% Plots
F1 = F(1,1,:);
F1 = F1(:);
F2 = F(1,2,:);
F2 = F2(:);

figure(1);
plot(1:N, F1, 1:N, F2, 'LineWidth', 2);
grid on
xlabel('Iteration');
ylabel('F');
legend('F1', 'F2');

%% Matlab Built-in Function to Do the Same
K = -dlqr(A, B, Q, R, [0;0]);

%% State Variables
x = zeros(2,N);
x(:,1) = [1; -1];
u = zeros(1,N);

for i = 1:N-1

    u(i) = F(:,:,i)*x(:,i);
    x(:,i+1) = A*x(:,i) + B*u(i);

end

%% Plots
F1 = F(1,1,:);
F1 = F1(:);
F2 = F(1,2,:);
F2 = F2(:);

figure(2);

subplot(211);
plot(1:N, x, 'LineWidth', 2);
grid on
xlabel('Iteration');
ylabel('x');
legend('x1', 'x2');

subplot(212);
plot(1:N, u, 'LineWidth', 2);
grid on
xlabel('Iteration');
ylabel('u');
legend('u');

%% Computing Optimal Cost
Jopt = 0.5*x(:,1)'*P(:,:,N-1)*x(:,1);