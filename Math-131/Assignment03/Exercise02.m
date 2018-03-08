f = @(x) cos((pi .* x.^2) ./ 2);% the function needs to be used to 
                                %solve the question
a = pi; % from the question a = pi which are the upper bound of the integral
b = 0; % from the question b = 0 which are the lower bound of the integral
n = [10^3, 10^5]; % create a array to store the value of n

err = zeros(1, 2); % create a array has one row with two column with all zeros

% call function with the outputs and inputs
% err1 is the first element in array err due to err(1) = err1
% err2 is the second element in array err due to err(2) = err2
% n(1) and n(2) is the first and second element of the array n
[I1, err1] = composite_trapezoid(f,a,b,n(1));
err(1) = err1;
[I2, err2] = composite_trapezoid(f,a,b,n(2));
err(2) = err2;

% draw a graph with loglog with err verses n, and loglog is to make the graph smooth
loglog(err, n);

% the function is to use composite trapezoid method to solve c and use
% the fresnel cosine integral of the very top funtion to calculate the exact answer 
% to calculate the error with c by using relative error for graphing
function [I, err] = composite_trapezoid(f,a,b,n)
    II = 0; % intialize the II
    h = (a - b) ./ n; % solve h by using the equation of composite trapezoid method
    x = b:h:a; % create an array called x from b to a with plus h every time
    for i = 1:n % for loop let i be from 1 to n
        % the equation of the composite trapezoid method, plug i in
        % function, add them up
        II = II + ((f(x(i)) + f(x(i + 1)))); 
    end
    I = (h ./ 2) .* II; % the equation of the composite trapezoid method, add them up
    % using the fresnel cosine integral to solve the exact answer, 
    % but the cody does not accept the fresnelc() function, so I solve it in terminal 
    ce = 0.523698543726229; 
    err = abs(I - ce) ./ abs(ce); % solve error by using the relative error
end
% error is decreasing when n is increasing because when n is bigger the 
% more time the for loop need to run and the more calculation has to be done
% and the answer is more accurate and the error is more smaller