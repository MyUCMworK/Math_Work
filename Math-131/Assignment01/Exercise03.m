[c, n, err] = newtons_method(@(x) (atan(x) - 1), @(x) (1 / (1 + x^2)), 2, 10^-8, 100);
% calling the function Newtons_method
% c is the answer we need to find, n is the times that the calculation runs
% and err is the error that we need to calculate
f = @(x) (atan(x) - 1);
% the function that need to be solved, and find the roots from it
fp = @(x) (1 / (1 + x^2));
% the derivative of the function f
x0 = 2; % start the number with x0, which is the initial guess of the answer
tol = 10^-8;
% it is the error tolerance which our error should be less than it after calculating
N = 100; % it is the number of iterations exceeds which is 100 times
function [c,n,err] = newtons_method(f,fp,x0,tol,N)
% create a function called Newtons_method with the variable f, fp, x0, tol and N
    err = 1;% initialize the error that we need to find
            % set it to 1 because it need to be a 100% error at the beginning
    n = 0;
    % n is to record how many times that the loop runs which is the times that 
    % calculate the solution and the error the more times it runs the 
    % more accurate we can get until our error is less than the the error that gives us
    while n < N
        % this is a while loop and it can run iff our error is still 
        % bigger than the error tolerance and the times that the loop 
        % runs are not reach the limit
        c = x0 - (f(x0) / fp(x0)); 
        err = abs(c - x0); % we need to calculate the error and the method
                           % is using the current answer which is c subtract x0, which
                           % is the last answer which is the last c the error will be 
                           % more accurate because the c and x0 will be closer
                           % after calculate many times, and error is more
                           % close to the error iterations
        x0 = c; % set x0 equal to the current answer which is c
        n = n + 1;
        % when loop runs and the middle and error is calculate one more time
        % n will add 1 to it until the loop stops
        if err < tol % if the error is smaller than the error tolerance, which means
                     % the answer we want to find is very close to the real root
                     % and if the first answer is the real root, the error we found
                     % should be zero and it is smaller than error tolerance
            break; % if the condition is tenable the while loop will stop
        end
    end
    x = linspace(-10, 10, 10000); % set x from -1 to 1 and make the graph has 
                                  % 10000 points to make sure that the graph
                                  % is very smooth
    plot (x, f(x)); % graph the y = f(x) with the x
    hold on; % let the graph not disappear after graph another graph
    y = 0; % set y as 0
    line ([-10, 10], [y, y]); % graph a line y = 0 with x from -1 to 1
end
% my method converge, my iterations are 5
% for -2 the method is diverge because c will get negative infinity at the end