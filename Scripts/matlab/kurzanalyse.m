% short time spectral analysis

%% PARAMETER REQUEST
fprintf('Audio spectral analysis\n')
filename = input('name of audio file (*.wav): ','s');
[y, fs] = audioread(filename);

M = input('FFT-length: ');
OL = input('Overlap of the fft blocks: ');

Ts = 1/fs;		% Sampling time
N  = length(y);	% Number of signal samples
T  = N*Ts;	    % Duration of the signal
df = 1/T;  		% Spectral resolution


%% SPECTRUM ANALYSIS: TOTAL SIGNAL
Y = fft(y);
YY = abs(Y)/max(abs(Y));	% magnitude and normalize

t = (0:N-1)*Ts;				% time base vector
f = (0:N-1)*df;				% Frequency scale

% VISUALIZATION
FIG1 = figure('Name', 'short time spectrum analysis', 'NumberTitle', 'off');
plot(f, YY)
axis([0 fs/2 0 1]);
grid, xlabel('f / [Hz]'), ylabel('norm. |Y(f)|')
soundsc(y, fs);				% Sound


%% SHORT TIME SPECTRUM ANALYSIS
%M = 4096;            			% fft length
%OL = 2;             			% Overlap of the fft blocks, i.e, size of overlap M/OL  
w = hamming(M);     			% Hamming window
N = floor(length(y)/M);			% number of blocks without overlapping

Y = zeros(OL*N, M/2);			% preallocate memory
for k=1:OL*(N-1)	% loop for each ST spectrum
	start  = 1 + (M/OL)*(k-1);
	stop   = start+M-1;
	YY     = fft(w.*y(start:stop))';
	Y(k, :)= abs(YY(1:M/2));	% 0...8kHz
end

% Graphics
figure(3), clf
Y = abs(Y(:,1:M/4));			% 0...4kHz
Ymax=max(max(Y));
Y = Y/Ymax;
dt = M/OL*Ts;
t = 0:dt:(OL*N-1)*dt;		% Time scale
df = fs/M;
f=0:df:(M/4-1)*df; 		   	% Frequency scale
h = surf(f,t,Y);
shading interp
view(30,30)
xlabel(' f / [Hz]'), ylabel(' t / [s]')
zlabel('magnitudes of short term dft spectra')
