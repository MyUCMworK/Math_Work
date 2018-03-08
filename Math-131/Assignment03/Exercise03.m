f = @(x) cos((pi .* x.^2) ./ 2);% the function needs to be used to 
                                %solve the question
a = pi; % from the question a = pi which are the upper bound of the integral
b = 0; % from the question b = 0 which are the lower bound of the integral
n = [10^3, 10^5]; % create a array to store the value of n

err = zeros(1, 2); % create a array has one row with two column with all zeros

% call function with the outputs and inputs
% err3 is the first element in array err due to err(1) = err3
% err4 is the second element in array err due to err(2) = err4
% n(1) and n(2) is the first and second element of the array n
[I3, err3] = composite_simpsons(f,a,b,n(1));
err(1) = err3;
[I4, err4] = composite_simpsons(f,a,b,n(2));
err(2) = err4;

% draw a graph with loglog with err verses n, and loglog is to make the graph smooth
loglog(err, n);

% the function is to use composite simpsons method to solve c and use
% the fresnel cosine integral of the very top funtion to calculate the exact answer 
% to calculate the error with c by using relative error for graphing
function [I, err] = composite_simpsons(f,a,b,n)
    II = 0; % intialize the II
    h = (a - b) ./ n; % solve h by using the equation of composite simpsons method
    for i = 0:n/2-1 % for loop let i be from 0 to n/2 - 1
        % the equation of composite simpsons method
        xi = 2 .* i .* h; % the x of (2 * i) 
        xip = (2 .* i + 1) .* h; % the x of (2 * i + 1)
        xipp = (2 .* i + 2) .* h; % the x of (2 * i + 2) 
        % plug all xi, xip, xipp in the function and add them up
        II = II + f(xi) + 4 .* f(xip) + f(xipp); 
    end
    % using the fresnel cosine integral to solve the exact answer, 
    % but the cody does not accept the fresnelc() function, so I solve it in terminal 
    I = h ./ 3 .* II; % the equation of composite simpsons method, add them up
    ce = 0.523698543726229;
    err = abs(I - ce) ./ abs(ce); % solve error by using the relative error
end

% Simpson?s is better because it uses quadratically polynomial apporach to
% function is always better than using the lines in the trapezoid
% error is decreasing when n is increasing because when n is bigger the 
% more time the for loop need to run and the more calculation has to be done
% and the answer is more accurate and the error is more smaller