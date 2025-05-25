%% Implenetation of Golden Section Algorithm

%% Parameters
 xL = 0;
 xU = 4;
 N = 100;
phi = (1 + sqrt(5))/2;
 %% Funtion to be Omptimized
 f = @(x) x^2/10 - 2*sin(x);

 %% Golden Section Algorithm
 for i = 1:N

    d = (phi -1)*(xU - xL);
    x1 = xL + d;
    x2 = xU - d;

    if f(x1) < f(x2)

        xL = x2;

    elseif f(x1) > f(x2)

        xU = x1;

    else

        xL = x2;
        xU = x1;

    end

 end

 disp(x1)
 disp(x2)