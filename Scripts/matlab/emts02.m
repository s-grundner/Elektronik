a = 1;
b = 1;
Q = linspace(0, 1, 100);
I = a * sqrt(b);
E = 0.5 * a * sqrt(b./Q);
plot(Q, I);
plot(Q, E);

%% -----

R = [995, 993, 1006, 994, 1003, 1001, 1005, 999]
RE = mean(R)
SE = std(R)

