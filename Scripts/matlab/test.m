clear all;

% x = [1,2,0,1,1]';
% 
% %define kernel
% a = [1];
% 
% %call function
% [ya,A] = mtxfilter(a,x');

% plotSig(ya,1)


%define test signal
Nx = 256;
Na = 33;
D = 16;

n = 1:Nx;

x_test = sin(2*pi*8*n/Nx)+sin(2*pi*16*n/Nx)+sin(2*pi*80*n/Nx);
plotSig(x_test,1)

%define coefficients
a_test = ones(1,16);
for i = 1:(Na-1)
  if i==D
    a_test(i)=1;
  else
    a_test(i) = (-1)^i*(sin(0.5*pi*(i-D)))/((0.5*pi)*(i-D));
  end
end


subplot(3,1,1);
plotSig(x_test,0)
xlabel('n')
ylabel('Eingangssignal x[n]')

subplot(3,1,2);
h = zeros(1,Nx);
h(1)=1;
hres_test = mtxfilter(a_test,h);
plotSig(hres_test,0)
xlabel('n')
ylabel('Impulsantwort h[n]')

subplot(3,1,3); 
[ya_test,A_test] = mtxfilter(a_test,x_test);
plotSig(ya_test,0)
xlabel('n')
ylabel('Ausgangssignal ya[n]')

%d
figure

b_test = zeros(1,32);
b_test(3) = 1;

subplot(3,1,1);
plotSig(x_test,0)
xlabel('n')
ylabel('Eingangssignal x[n]')

subplot(3,1,2);
h = zeros(1,Nx);
h(1)=1;
hres_test = mtxfilter(b_test,h);
plotSig(hres_test,0)
xlabel('n')
ylabel('Impulsantwort h[n]')

subplot(3,1,3); 
[yb_test,B_test] = mtxfilter(b_test,x_test);
plotSig(yb_test,0)
xlabel('n')
ylabel('Ausgangssignal yb[n]')


%e
yc = ya_test+yb_test;


%combination of matrices
C_test = A_test+B_test;

figure
subplot(3,1,1)
plotSig(yc,0)
xlabel('n')
ylabel('Summe der Ausgangssignale yc[n]')

subplot(3,1,2)
y_c_tilde = C_test*x_test';
plotSig(y_c_tilde,0)
xlabel('n')
ylabel('Ausgangssignal über kombinierte Matrix yc[n]')

subplot(3,1,3)
y_c_error = yc-y_c_tilde;
plotSig(y_c_error,0)
xlabel('n')
ylabel("Fehlersignal yc[n]-yc'[n]")
