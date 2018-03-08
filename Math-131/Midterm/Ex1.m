[c, n, err] = bi(f, a, b, tol, N);
f = @(x) (2 .* x.^3 + 3 .* x - 1) .* cos(x) - x;
a = -1;
b = 1;
tol = 10^-5;
N = 100;

function [c, n, err] = bi(f, a, b, tol, N)
    n = 0;
    err = 1;
    while err > tol && n < N
        mid = (a + b)/2;
        err = abs(a - b)/2;
        n = n + 1;
        if f(mid) == 0 || err < tol
            c = mid;
        elseif f(a) * f(mid) > 0
            a = mid;
        else 
            b = mid;
        end
    end
end