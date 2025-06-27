% Script that analyzes the spectra of a function
% see section 8 of Book [Schrü]

close all
tc=0:1e-3:10; % "continous" time
T=2; f0=1/pi; 
xc=3*exp(-tc/T).*sin(2*pi*f0*tc); % "continuous" function f(t)

plot(tc,xc); grid

Ta=.1; fa=1/Ta; %define sampling time and frequency
td=0:Ta:10-Ta; % vector of discrete times
xd=3*exp(-td/T).*sin(2*pi*f0*td); % discretized version of f(t)
hold on
stem(td,xd) % plot on same figure the samples

% Spectral analysis of the discrete signal 
X=Ta*fft(xd); % calculates DFT. Continous FT is approximated by the FFT
              % but must be multiplied by Ta (or divided by fa)
N=length(X); % size of vector
fd=(-N/2:1:N/2-1)*fa/N; %frequencies on x-axis, fa/N is the frequency resolution
X = fftshift(abs(X)); % fftshift to show negative and positive frequencies
figure
stem(fd,X); % frequency spectrum by FFT
hold on
fc=-4:.01:4; % define a "continous" frequency
w=fc*2*pi;
Xc=6./sqrt(w.^4-7.5*w.^2+(17/4)^2); % theoretical frequency spectrum by Fourier Transform of f(t)
plot(fc,Xc)
title(sprintf('fa = %d Hz',fa)) % shows the sampling frequency used
