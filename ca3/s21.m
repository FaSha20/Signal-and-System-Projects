close all

T = 2;
N = 100;
ts = T / N;
fs = 1 / ts;      %sampling rate
t = -1:ts:1-ts;
x = dirac(t);
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;

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
