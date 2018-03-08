datx = -3:1:3; %set datx as a array equal to -3 and add 1 until reach to 3  
x = -3:0.01:3; %set x as a array equal to -3 and add 0.01 until reach to 3  
datx1 = -3:0.5:3; %set datx1 as a array equal to -3 and add 0.5 until reach to 3  
daty = @(x) exp(-x.^2); %set daty equal to first function
daty1 = @(x) 1 ./ (1 + x.^2); %set daty equal to second function
P1 = Lagrange_Poly(x, datx, daty); 
% call the function with x, datx, and daty
P2 = Lagrange_Poly(x, datx, daty1);
% call the function with x, datx, and daty1
P3 = Lagrange_Poly(x, datx1, daty);
% call the function with x, datx1, and daty
P4 = Lagrange_Poly(x, datx1, daty1);
% call the function with x, datx1, and daty1
function y = Lagrange_Poly(x,datx,daty)
% create a function called Lagrange_Poly with the output y and input x,
% datx, and daty
    % size(datx,2) is datx which the first element is 
    % 1 and second element is 7, and set n equal to second element 
    prod = ones(size(datx, 2), size(x, 2)); %create a matrix full of ones and it has the second 
    % element of size x, which is 7, rows and size(x, 2), which is an array has 601 element, columns 
        for k = 0:size(datx, 2) % a for loop called k from zero to the second 
                                % element of size x which is 7
            for i = 0:size(datx, 2) % a for loop called i from zero to the second 
                                    % element of size x which is 7
                if (k == 0 || i == 0 || k == i)
                    % if-else statement and try to pass through those
                    % conditions if they are true, the program will pass
                    % them and run the elseif statement
                    continue; 
                elseif (k ~= i) % elseif k is not equal to i
                    prod(k,:) = prod(k,:) .* (x - datx(i)) / (datx(k) - datx(i));
                    % first let k be his columns and the rest of the rows
                    % are also be k. then using the current x minus last x
                    % and divided by first x minus next x and second x minus
                    % next x and go on
                end
            end
        end
        y = 0; % set the initial y equal to zero
        for i = 1:size(datx, 2) % set a for loop called i from 1 to the second 
                                % element of size x which is 7
            y = y + daty(datx(i)) * prod(i,:); 
            % set y equal to daty of datx of i times prod and y should be a
            % matrix at the end and go on from first to the number of end of loop
        end
    y = y'; % transformate the y from 1*601 to 601*1
    scatter(datx, daty(datx)); % draw the point on the graph of datx and daty(datx)
    hold on; % hold the last graph on 
    plot(x, y); % draw the graph based on x and y
end
% P1 and P2 are both going up at the beginning and P3 and P4 are both going
% down
% source from book and slice