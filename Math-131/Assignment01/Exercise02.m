[c, n, err] = fixed_point_iteration(@(x) (exp(-x)), 0.33, 10^-10, 100);
% calling the function fixed_point_iteration 
% c is the answer we need to find, n is the times that the calculation runs
% and err is the error that we need to calculate
g = @(x) exp(-x); % the function that need to be solved, and find the roots from it
x0 = 0.25; % the number we need to put it in the function at the first time
tol = 10^-10;
% it is the error tolerance which our error should be less than it after calculating
N = 100; % it is the number of iterations exceeds which is 100 times
function [c,n,err] = fixed_point_iteration(g,x0,tol,N)
% create a function called fixed_point_iteration with the variable g, x0, tol, and N
    err = 1;% initialize the error that we need to find
            % set it to 1 because it need to be a 100% error at the beginning
    n = 0;
    % n is to record how many times that the loop runs which is the times that 
    % calculate the solution and the error the more times it runs the 
    % more accurate we can get until our error is less than the the error that gives us
    while err > tol && n < N
        % this is a while loop and it can run iff our error is still 
        % bigger than the error tolerance and the times that the loop 
        % runs are not reach the limit
        x0 = g(x0); % let x0, which is the number need to plug into the function
                    % next time, equal to g(x0), which is the function that
                    % plugs in the current x0. Means that the current
                    % function will be the next varible to plug in the
                    % function next time we solve the function
        err = abs(g(x0) - x0); % we need to calculate the error and the method
                               % is using the next x0 subtract the current
                               % x0, and the next x0 is the the number of
                               % the function of the current x0 and
                               % absolute the number to make it not
                               % negative. the error will be more accurate
                               % because the g(x0) and x0 will be closer
                               % after calculate many times, and error is more
                               % close to the error iterations
        n = n + 1;
        % when loop runs and the middle and error is calculate one more time
        % n will add 1 to it until the loop stops
        if err < tol 
            % if the error is smaller than the error tolerance, which means
            % the answer we want to find is very close to the real root
            % and if the first answer is the real root, the error we found
            % should be zero and it is smaller than error tolerance
            c = x0; % if one condition are tenable, let c = x0
                    % which is our answer that we
                    % calculate at current time of loop 
        end
    end
    x = linspace(-1, 1, 10000);% set x from -1 to 1 and make the graph has 
                               % 10000 points to make sure that the graph
                               % is very smooth
    plot (x, g(x)); % graph the y = g(x) with the x 
    hold on; % let the graph not disappear after graph another graph
    plot (x, x); % graph when y = x
end
% the iterations are 40