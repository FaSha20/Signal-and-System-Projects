close all

T = 2;
N = 200;
ts = T / N;
fs = 1 / ts;      %sampling rate 100

x = coding_amp('signal', 3);
y = decoding_amp(x, 3);
disp(y)
% t = -3:ts:length(x)/fs-3-ts; 
% figure
% plot(t,x);
% xlabel('t');
% ylabel('x(t)');
% grid;