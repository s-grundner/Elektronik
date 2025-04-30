n1 = 0:255;
x = sin(2.*pi.*(8.*n1)./256)+sin(2.*pi.*(16.*n1)/256)+sin(2.*pi.*(80.*n1)./256);

n2 = 0:32;
D = 16;
a = ((-1).^n2) .* sin(0.5.*pi.*(n2-D))./(0.5.*pi.*(n2-D));
a(n2==D)=1;
[ya,A] = mtxfilter(a,x);


b = [0 0 1];
[yb,B] = mtxfilter(b,x);
n4 = 0:length(yb)-1;


if length(ya) < length(yb)
    y = yb + [ya(:); zeros(length(yb)-length(ya),1)];
elseif length(ya) > length(yb)
    y = ya + [yb(:); zeros(length(ya)-length(yb),1)];
else
    y = ya + yb;
end


n3 = 0:length(y)-1;
subplot(2,1,1);
stem(n3,y);
xlabel('n')
ylabel('y[n]')


B = [B; zeros(30,256)];


C = A + B;

y1 = C*x(:);
n5 = 0:length(y1)-1;
subplot(2,1,2);
stem(n5,y1)
xlabel('n')
ylabel('y1[n]')
