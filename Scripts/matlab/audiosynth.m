% Audio signal prelude by Marc-Antoine Charpentier (1634-1704)

clear all
close all

% pitch in Hz
A = 220;
Dhigh = A*2^(5/12); % high
C   = A*2^(3/12);
B   = A*2^(2/12);
G   = A*2^(-2/12);
Fis = A*2^(-3/12);
E   = A*2^(-5/12);
D   = A*2^(-7/12);
pitch = [D G G A B G Dhigh B B C Dhigh C B C Dhigh A G A B A];

% duration of the individual tones
duration = [1/4 1/4 1/8 1/8 1/4 1/4 1/2 3/8 1/8 1/4 ...
             1/8 1/8 1/8 1/8 1/4 1/8 1/8 1/8 1/8 1/4];

% parameters and generation of the audio signal
T = 2;                          % duration of a whole tone
fs = 8000;                      % sampling frequency
Ts = 1/fs;                      % sampling time
music = [];                     % define variable for audio signal
for k=1:length(pitch)           % for loop
  L = T/Ts*duration(k);         % number of samples per tone
  n = 0:L-1;                    % normalized time
  Omega = 2*pi*pitch(k)/fs;     % normalized radian frequency
  s = sin(Omega*n);             % tone
  music = [music s];            % concatenated audio signal
end

% pc sound card output
soundsc(music,fs,16);