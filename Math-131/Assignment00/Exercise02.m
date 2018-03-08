x1 = myabsolutevalue(-2.3343224);
x2 = myabsolutevalue(9242.23);
function x = myabsolutevalue(n)
    if n < 0
        x = -n;
    else
        x = n;
    end
end