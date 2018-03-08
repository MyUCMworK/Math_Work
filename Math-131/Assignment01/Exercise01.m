 [c, n, err] = bisection_method(@(x) (2.*x.^3 + 3.*x - 1).*(cos(x)) - x, -1, 1, 10^-5, 100);
% call the function bisection_method
f = @(x) (2 .* x.^3 + 3 .* x - 1) .* cos(x);
% the function that need to be solved, and find the roots from it
a = -1; % a is the left interval which is left bound
b = 1; % b is the right inverval which is right bound
tol = 10^-5; 
% it is the error tolerance which our error should be less than it after calculating
N = 100; % it is the number of iterations exceeds which is 100 times
function [c, n, err] = bisection_method(f, a, b, tol, N) 
% creat a function called bisection_method:
% c is the answer we need to find, n is the times that the calculation runs
% and err is the error that we need to calculate
    err = 1; % initialize the error that we need to find
             % set it to 1 because it need to be a 100% error at the beginning
    n = 0; % n is to record how many times that the loop runs which is the times that 
           % calculate the solution and the error the more times it runs the 
           % more accurate we can get until our error is less than the the error that gives us
    if f(a) * f(b) < 0 
        % the bisection method can be used iff f(a) and f(b) should be 
        % one positive and one negative which means the left bound or right
        % bound has to be one positive and one negative
        while err > tol && n < N 
            % this is a while loop and it can run iff our error is still 
            % bigger than the error tolerance and the times that the loop 
            % runs are not reach the limit
            middle = (a + b) / 2; % because it is the bisection method
                              % we need to calculate the middle of the interval [a, b] 
                              % which is the root that we need to find. however
                              % it is not accurate at the first time, so we need to 
                              % caluculate more times. Because a or b will be 
                              % less and less by we are finding the middle number of them
                              % and the number more closer to the real root
            err = abs(a - b) / 2; % we need to calculate the error, because the 
                                  % a or b is less and less by we are finding the 
                                  % middle number of them, so the error
                                  % will be less and less by a and b are
                                  % less and less
            if f(middle) == 0 || err < tol % f(middle) = 0 means we find the real root
                                           % and it is not possible to this
                                           % question, or err < tol means
                                           % that our solution is good
                                           % enough to use because our
                                           % error is small than the tolerance
                c = middle; % if one condition are tenable, let c = middle which is our 
                            % answer that we calculate at current time of loop
            elseif f(middle) * f(a) > 0 
                % however, if last two conditions are not tenable
                % f(middle) * f(a) > 0 means that the left bound need to
                % shift to the middle because if the right bound shift to
                % middle, there cannot be one postive and one negative on
                % two intervals the conditions of the bisection method will
                % be not tenabel
                a = middle; % shift left bound to middle 
                n = n + 1; 
                % when loop runs and the middle and error is calculate one more time
                % n will add 1 to it until the loop stops
            else % if above conditions are not tenable, let right bound shift 
                 % to the middle because it can make one positive and one
                 % negative in the two interval 
                b = middle; % shift right bound to midlle
                n = n + 1; 
                % when loop runs and the middle and error is calculate one more time
                % n will add 1 to it until the loop stops
            end
                
        end    
        
    end
    x = linspace(-1, 1, 10000); % set x from -1 to 1 and make the graph has 
                                % 10000 points to make sure that the graph
                                % is very smooth
    plot (x, f(x)); % graph the y = f(x) with the x
    hold on; % let the graph not disappear after graph another graph
    y = 0; % set y as 0
    line ([-1, 1], [y, y]); % graph a line y = 0 with x from -1 to 1
end
% % the iterations are 18
% error = 7.6294*10^-6
% g = solve( @(x) (2.*x.^3 + 3.*x - 1).*(cos(x)) - x)
% x = 0.4385674577098013167563577921244
% c = 0.4386 which is not accurate as x when I use the solve