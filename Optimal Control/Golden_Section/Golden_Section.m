%% Implenetation of Golden Section Algorithm

%% Parameters
 xL = 0;
 xU = 4;
 N = 20;
phi = (1 + sqrt(5))/2;
x1 = zeros(N,1);
x2 = zeros(N,1);
 %% Funtion to be Omptimized
 f = @(x) x^2/10 - 2*sin(x);

 %% Golden Section Algorithm
 for i = 1:N

    d = (phi -1)*(xU - xL);
    x1(i) = xL + d;
    x2(i) = xU - d;

    if f(x1(i)) < f(x2(i))

        xL = x2(i);

    elseif f(x1(i)) > f(x2(i))

        xU = x1(i);

    else

        xL = x2(i);
        xU = x1(i);

    end

 end

 disp(x1(end))
 disp(x2(end))

 %% Plot Convergence

 plot(1:N, x1, 1:N, x2);
 grid on
 xlabel('Iteration');
 ylabel('X1,2');
 title('Golden Section Optimization');
