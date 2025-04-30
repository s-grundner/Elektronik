n1 = 0:255;
x = sin(2.*pi.*(8.*n1)./256)+sin(2.*pi.*(16.*n1)/256)+sin(2.*pi.*(80.*n1)./256);
subplot(3,1,1)
stem(n1,x)
xlabel('n')
ylabel('x[n]')

n2 = 0:2;
b = [0 0 1];
subplot(3,1,2);
stem(n2,b);
xlabel('n')
ylabel('b[n]')

[yb,A] = mtxfilter(b,x);
n3 = 0:length(yb)-1;
subplot(3,1,3)
stem(n3,yb)
xlabel('n')
ylabel('yb[n]')
