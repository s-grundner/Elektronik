clc; clearvars; close all;

%% 2.1 Lösungsberechnung (Zeitkontinuierlich)

A = [-3, -1; 2, 0];

% Phasenportrait
[X, Y] = meshgrid(-2:0.5:2, -2:0.5:2);
DX = A(1,1) * X + A(1,2) * Y;
DY = A(2,1) * X + A(2,2) * Y;
figure;
quiver(X, Y, DX, DY, 0.5, 'b')
hold on
axis equal
xlabel('x_1')
ylabel('x_2')
title('Phasenportrait')
grid on

% Lösung
syms t

[V, D, e] = eig(A); % V, D sind Outputargs -> help eig
Phi = V * expm(D * t) * inv(V)

x1_t = Phi * [1; -2]; % In der Angabe [2, -4]
x2_t = Phi * [2; 0];

% Lösungstrajektorien

time = linspace(0, 10, 100);
p = double(subs(Phi * [-1;2], t, time));
plot(p(1,:), p(2,:), 'g')

[t1, t2] = meshgrid(-2:2:2, -1:1:1);
for i = 1:length(t1)
  for j = 1:length(t2)
    x = [t1(i,j); t2(i,j)]
    p = double(subs(Phi * x, t, time));
    plot(p(1,:), p(2,:), 'r')
  end
end

