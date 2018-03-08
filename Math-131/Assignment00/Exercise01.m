x1 = mysum(20);
x2 = mysum(100);
function answer = mysum(n)
    a = 0;
    for i = 1:n
        a = i + a;
    end
    answer = a;
end