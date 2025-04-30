n1 = 0:255;
x = sin(2.*pi.*(8.*n1)./256)+sin(2.*pi.*(16.*n1)/256)+sin(2.*pi.*(80.*n1)./256);
subplot(3,1,1)
stem(n1,x)
xlabel('n')
ylabel('x[n]')

n2 = 0:32;
D = 16;
a = ((-1).^n2) .* sin(0.5.*pi.*(n2-D))./(0.5.*pi.*(n2-D));
a(n2==D)=1;
subplot(3,1,2);
stem(n2,a);
xlabel('n')
ylabel('a[n]')

[ya,A] = mtxfilter(a,x);
n3 = 0:length(ya)-1;
subplot(3,1,3)
stem(n3,ya)
xlabel('n')
ylabel('ya[n]')
