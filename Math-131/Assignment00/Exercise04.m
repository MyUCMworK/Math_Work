x1 = vectornorm([1, 1, 1]);
x2 = vectornorm([1/(2^0.5), 0, 1/(2^0.5)]);
x3 = vectornorm([0:0.01:1]);
function norm = vectornorm(x)
    a = 0;
    for  i = 1:+1:length(x)
        a = (x(1, i))^2 + a;
    end
    norm = a ^ 0.5;
end