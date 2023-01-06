close all

T = 2;
N = 200;
ts = T / N;
fs = 1 / ts;      %sampling rate 100

x = coding_amp('signal', 1);
t = -3:ts:length(x)/fs-3-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;

x = coding_amp('signal', 2);
t = -3:ts:length(x)/fs-3-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;

x = coding_amp('signal', 3);
t = -3:ts:length(x)/fs-3-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;
