x0 = [1 1 1 1];
x1 = [2104 1416 1534 852];
x2 = [5 3 3 2];
x3 = [1 2 2 1];
x4 = [45 40 30 36];

X = [x0; x1; x2; x3; x4];

y = [460 232 315 178];

m = 4;

% normieren und Matrix drehen
% X_norm = (X - mean(X))/std(X);

% Kostenfunktion J
Theta = [1;2;3;4;5];
J = (1/(2*m)) * sum((Theta'*X_norm-y).^2);


