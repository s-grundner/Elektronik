b = [1, 2, 3, -3, -2, -1];
a = [1, 0];
% zAbsOverlay(b, 1);
% hold on;
% zPhaseOverlay(b, 1);

oldparam = sympref('HeavisideAtOrigin',1);
n = linspace(0, 50, 51);
x = rectangularPulse(0, 9, n) - rectangularPulse(10, 19, n);
y = filter(b, a, x);

subplot(2,1,1)
stem(n, x);
subplot(2,1,2)
stem(n, y);
