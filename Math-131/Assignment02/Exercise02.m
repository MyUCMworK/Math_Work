x = -3:0.01:3; %set x as a array equal to -3 and add 0.01 until reach to 3  
datx = -3:1:3; %set datx as a array equal to -3 and add 1 until reach to 3  
daty = @(x) exp(-x .^ 2); %set datx1 as a array equal to -3 and add 0.5 
% until reach to 3  
P5 = Newtons_divided_differences(x,datx,daty);
% call the function with x, datx, and daty
function y = Newtons_divided_differences(x,datx,daty)
% create a function called Newtons_divided_differences with the output y and input x,
% datx and daty
    F = ones(size(datx, 2), size(datx, 2));
    % create a matrix full of ones and it has the second 
    % element of size x, which is 7, rows and another size(datx, 2)
    P = ones(size(x, 2), size(datx, 2));
    % create a matrix full of ones and it has size(x, 2), 
    % which is an array has 601 element columns,the size(datx, 2) second 
    % element of size x, which is 7 rows
    for i = 1:size(datx, 2) 
        % set a for loop from 1 to the the size(datx, 2) 
        % second element of size x, which is 7 rows
        F(i,1) = daty(datx(i)); % let very first element in F be the daty of 
        % datx of i
    end
        for i = 2:size(datx, 2) % set a for loop from 2 to the the size(datx, 2) 
        % second element of size x, which is 7 rows
            for j = 2:i % set another for loop from 2 to i
                F(i,j)=(F(i,j-1) - F(i-1,j-1))/(datx(i) - datx(i-j+1));
                % set the matrix F equal to second row and first column
                % minus first row and first column divided by the x0 minus 
                % last x0 and go on from second to the number of end of loop
            end
        end
        
    for i = 1:size(x, 2) % set a for loop from 1 to the size(x, 2), 
                         % which is an array has 601 element
        P(i,:) = x(i); % set p equal to x
    end
    
    for i = 1:size(x, 2)% set a for loop from 1 to the size(x, 2), 
                        % which is an array has 601 element
        for j = 1:size(datx, 2)% set a for loop from 1 to the the size(datx, 2) 
        % second element of size x, which is 7 rows
            if j == 1 % if j is equal to 1
                P(i,j) = (P(i,j) - datx(j)); % P with the first element is equal 
                % to the himself minus the last element and go on
                % from first to the number of end of loop
            else % if the last condition false
                P(i,j) = P(i,j-1) * (P(i,j) - datx(j)); 
                % P is equal to the first rwo and last column times the
                % current row and column minus last element and go on from 
                % second to the number of end of loop
            end
        end
    end
    y = zeros(size(x, 2), 1); % set a matrix called y full of zeros and size is 601 * 1
    for i = 1:size(x, 2) % set a for loop from 1 to the size(x, 2), 
                         % which is an array has 601 element
        for j = 1:size(datx, 2) - 1
        % set a for loop from 1 to the the size(datx, 2) - 1
        % second element of size x, which is 6 rows because the first
        % element of F will be added after
            y(i) = y(i) + P(i,j) * F(j+1, j+1); 
            % set y equal to y plus the first row and column of p times the
            % second row and column of F and go on like seconde of P and
            % third of F 
        end
        y(i) = y(i) + F(1,1); % add first element of F to y
    end
    
    plot(datx, daty(datx)); % draw a graph with datx and daty of datx
    hold on; % hold the last graph on 
    plot(x, y);% draw the graph based on x and y
end
% the graph is similar with the P2
% the source is from book and slice