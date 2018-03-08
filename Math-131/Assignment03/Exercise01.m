f = @(x) (x^2 - 3 .* x + 2) .* atan(x); % the function needs to be used to 
                                        %solve the question
n = [1, 3, 6]; % create a array to store the value of n
h = @(n) 10^(-n); % from the question variable h = 10^(-n)
x = 0; % from the question variable x = 0

err1 = zeros(1, 3); % create a array has one row with three column with all zeros
err3 = zeros(1, 3); % create a array has one row with three column with all zeros
err6 = zeros(1, 3);% create a array has one row with three column with all zeros

h1 = zeros(1, 3); % create a array has one row with three column with all zeros
h3 = zeros(1, 3); % create a array has one row with three column with all zeros
h6 = zeros(1, 3); % create a array has one row with three column with all zeros

% call function with the outputs and inputs
% err1(1) is the first element in err1 array, h1(1) is the first element in
% h1 array, and n(1) is the first element in n array
% after the first one all of the function called in the same parttern
[FD1, err1(1), h1(1)] = FD (f, x, n(1), h); 
[FD3, err1(2), h1(2)] = FD (f, x, n(2), h);
[FD6, err1(3), h1(3)] = FD (f, x, n(3), h);
[CD31, err3(1), h3(1)] = CD3 (f, x, n(1), h);
[CD33, err3(2), h3(2)] = CD3 (f, x, n(2), h);
[CD36, err3(3), h3(3)] = CD3 (f, x, n(3), h);
[CD51, err6(1), h6(1)] = CD6 (f, x, n(1), h);
[CD53, err6(2), h6(2)] = CD6 (f, x, n(2), h);
[CD56, err6(3), h6(3)] = CD6 (f, x, n(3), h);

% draw a graph with loglog with err1 verses h1, and loglog is to make the graph smooth
% hold on is to hold the first graph on the graph when the second graph is
% appear
loglog(err1, h1); 
hold on;
loglog(err3, h3);
hold on;
loglog(err6, h6);

% first function is to use forward difference method to solve c and use
% the derivative of the very top funtion to calculate the exact answer
% then, to calculate the error with c by using relative error for graphing
function [c, err, h] = FD (f, x, n, h)
    % each h of n with the different n
    h = h(n);
    % equation we use to solve the answer
    c = (f(x + h) - f(x)) ./ h;
    fp = @(x) ((2 .* x - 3) .* atan(x) + (x .^ 2 - 3 .* x + 2)) ./ (x .^ 2 + 1);
    ce = fp(x); % solve the derivative of the funtion with plug-in x
    err = abs(c - ce) ./ abs(ce); % relative error
    
end

% second function is to use 3 pt centered difference method to solve c and use
% the derivative of the very top funtion to calculate the exact answer 
% then, to calculate the error with c by using relative error for graphing
function [c, err, h] = CD3 (f, x, n, h)
    % each h of n with the different n
    h = h(n);
    % equation we use to solve the answer
    c = (f(x + h) - (f(x - h))) ./ (2 .* h);
    fp = @(x) ((2 .* x - 3) .* atan(x) + (x .^ 2 - 3 .* x + 2)) ./ (x .^ 2 + 1);
    ce = fp(x); % solve the derivative of the funtion with plug-in x
    err = abs(c - ce) ./ abs(ce); % relative error
end

% third function is to use 5 pt centered difference method to solve c and use
% the derivative of the very top funtion to calculate the exact answer
% then, to calculate the error with c by using relative error for graphing
function [c, err, h] = CD6 (f, x, n, h)
    % each h of n with the different n
    h = h(n);
    % equation we use to solve the answer
    c = ((-f(x + 2 .* h)) + 8 .* f(x + h) -8 .* f(x - h) + f(x - 2 .* h)) ./ (12 .* h);
    fp = @(x) ((2 .* x - 3) .* atan(x) + (x .^ 2 - 3 .* x + 2)) ./ (x .^ 2 + 1);
    ce = fp(x); % solve the derivative of the funtion with plug-in x
    err = abs(c - ce) ./ abs(ce); % relative error
end
% the error is decreasing when h decreasing
% because h is the distance bewteen the points, and it is shorter, pointers
% are more closer to each other and the error is smaller
% forwarding difference has the largest error
% because it has the least numbers of point in those three method
% 5 pt centered difference has the smallest error
% beacause it has the most numbers of point in those three method
% and the more points they have the less error they can get.

