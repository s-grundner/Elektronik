% Funtion that sintetizes a square signal
%
function puls
    %clear all;
    close all;
    A=1;
    f0=1; % T=1; fundamental frequency
    tau=0.25; % duty cicle

    t=-2:.01:2;
    per = -2 : 1 : 2;
    x_orig=pulstran(t,per,'rectpuls',tau); 
    %Matlab function that generates a perfect square signal to compare
    plot(t,x_orig)

    % from here generate a sum of complex exponentials
    x_N=zeros(1,length(t)); %vector of zeros
    N=5; %number of harmonics
    j=1; % init counter for harmonics
    for n=-N:N
        cn(j)=A*f0*tau*sinc(n*f0*tau); % coef for square signal
        x_N=x_N+cn(j)*exp(1i*n*2*pi*f0*t); % sum of all components
        j=j+1; % update counter for each harmonic
    end
    figure(1);
    plot(t,real(x_N),t,x_orig); % plot
    hold on;
    xlabel('time');
    ylabel('x(t)');
    legend('Sintetized','Original');


    figure(2) % show line spectrum
    n=-N:N; % vector of harmonics
    subplot(211)
    stem(n,abs(cn));
    xlabel('Harmonics n');
    ylabel('Amplitude');
    subplot(212)
    stem(n,angle(cn));
    xlabel('Harmonics n');
    ylabel('Phase');
