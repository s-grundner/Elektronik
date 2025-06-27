clear all
close all

load test  % load data from a Impulse Hammer Test

%plot in time
f0 = figure;
plot(t,xt,t,yt)
xlabel('time (s)');
ylabel('amplitide (a.u.)');
legend('input','output')
%set(gca,'XLim',[0 .05])
title('Signals in time domain')
set(f0, 'WindowStyle', 'Docked');

%calculate frequency response
f1 = figure;
dt=t(2)-t(1);
fa=1/dt;
N=length(t);

NFFT=2.^nextpow2(N);
subplot(3,1,1)
X=fft(xt,NFFT)/N;
Y=fft(yt,NFFT)/N;
% cut vector to show only positive frequencies
X=X(1:NFFT/2+1);
Y=Y(1:NFFT/2+1);

% create vector of frequencies
freq=fa/2*linspace(0,1,NFFT/2+1);

%Frequency plots (linear)
subplot(3,1,1)
plot(freq,abs(X));
title('frequency domain (linear axis)')
ylabel('input (a.u.)');
subplot(3,1,2)
plot(freq,abs(Y));
ylabel('output (a.u.)');
%Frequency Response Function (FRF)
FRF=Y./X;
subplot(3,1,3)
plot(freq,abs(FRF));
xlabel('Frequency (Hz)');
ylabel('FRF')

set(f1, 'WindowStyle', 'Docked');
%Frequency plots (log scale)
f2 = figure;
subplot(3,1,1)
loglog(freq,abs(X));
title('frequency domain (log-log axis)')
set(gca,'XLim',[1e1 2e3]) % limits the view from 10 Hz to 2 kHz
ylabel('input (a.u.)');
subplot(3,1,2)
loglog(freq,abs(Y));
ylabel('output (a.u.)');
set(gca,'XLim',[1e1 2e3])
subplot(3,1,3)
loglog(freq,abs(FRF));
set(gca,'XLim',[1e1 2e3])
xlabel('Frequency (Hz)');
ylabel('FRF')
set(f2, 'WindowStyle', 'Docked');
