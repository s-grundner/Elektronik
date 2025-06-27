% explores the leakage effect of DFT/FFT
close all
clear all
Fx=10; %Frequency of the sinusoid
Fs=100; %Sampling Frequency
observationTime = 1; %observation time in seconds
t=0:1/Fs:observationTime-1/Fs; %time base
x=sin(2*pi*Fx*t);%sampled sine wave

N=length(t); %DFT length same as signal length
X1 = 1/N*fftshift(fft(x,N));%N-point complex DFT of x
f1=(-N/2:1:N/2-1)*Fs/N; %frequencies on x-axis, Fs/N is the frequency resolution

N=128; %DFT length
X2 = 1/N*fftshift(fft(x,N));%N-point complex DFT of x
f2=(-N/2:1:N/2-1)*Fs/N; %frequencies on x-axis, Fs/N is the frequency resolution

figure;
subplot(3,1,1);stem(x,'r')
title('Time domain');xlabel('Sample index (n)');ylabel('x[n]');
subplot(3,1,2);stem(f1,abs(X1)); %magnitudes vs frequencies
xlim([-16,16]);title(['FFT, N=100, \Delta f=',num2str(Fs/100)]);xlabel('f (Hz)'); ylabel('|X(k)|');
subplot(3,1,3);stem(f2,abs(X2)); %magnitudes vs frequencies
xlim([-16,16]);title(['FFT, N=',num2str(N),' \Delta f=',num2str(Fs/N)]);xlabel('f (Hz)'); ylabel('|X(k)|');