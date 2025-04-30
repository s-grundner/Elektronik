clc;
n = linspace(0, 20, 21);
a = cos(30/105*pi*n);

bn = linspace(0, 200, 201);
b = cos(0.02*pi*bn);

c = sin(5*n);
d = cos(5*pi*n);
e = sin(62/20*pi*n);

figure(1);

subplot(5,1,1);
stem(n, a);
title('a = cos(30/105*pi*n)');
subplot(5,1,2);
stem(bn, b);
title('b = cos(0.02*pi*n)');
subplot(5,1,3);
stem(n, c);
title('c = sin(5n)');
subplot(5,1,4);
stem(n, d);
title('d = cos(5*pi*n)');
subplot(5,1,5);
stem(n, e);
title('e = sin(62/20*pi*n)');


