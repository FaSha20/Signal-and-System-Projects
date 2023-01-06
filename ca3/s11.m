close all

T = 2;
N = 100;
ts = T / N;        % (0.02 s)
fs = 1 / ts;      %sampling rate(50 Hz)
deltaf = fs / N;  %frequence resolution
t = -1:ts:1-ts;
figure
y = cos(10 * pi * t) ;
 plot(t,y);
hold on
x = rectpuls(t, 2);
plot(t,x );

figure;
plot(t, x.*y);

z = x .* y;

f = -fs/2 : fs/N : fs/2 - fs/N;
y = fftshift(fft(z));
y = y / max(abs(y));
figure;
plot(f,abs(y));