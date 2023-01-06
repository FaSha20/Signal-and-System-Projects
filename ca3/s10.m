close all;

T = 1;
N = 20;
ts = T / N;
fs = 1 / ts;      %sampling rate
deltaf = fs / N;  %frequence resolution
t = 0:ts:0.95;
x = exp(1i*2*pi*5*t) + exp(1i*2*pi*5.1*t);
% plot(t,x);
f = -fs/2 : fs/N : fs/2 - fs/N;
y = fftshift(fft(x));
y = y / max(abs(y));
figure;
plot(f,abs(y));
xlabel('f');
ylabel('|F( x(t) )|');
grid;

figure;
plot(f,angle(y));
xlabel('f');
ylabel('F( x(t))');
grid;