x = [1, 1.2, 1.4, 1.6, 1.8, 2.0];
y = [1.0139, 0.7959, 0.6249, 0.4906, 0.3851, 0.3023];

figure(1)
plot(x, y);

figure(2)
semilogx(x, y);

figure(3)
semilogy(x, y);

figure(4)
loglog(x, y);
