x = -6:0.0001:6;
y = atan(x);
xlabel("x");
ylabel("y = arctan(x)");
plot(x, y, '-b', "LineWidth", 2);
hold on;
fplot([-pi/2, pi/2], [-6, 6], '--r');
ylim([-2, 2]);
