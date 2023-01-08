close all

MAP = cell(2,32);
letters = 'abcdefghijklmnopqrstuvwxyz .,!?;"';

for i=1:32
   MAP(1,i) = {letters(i)};
   MAP(2,i)={dec2bin(i-1,5)};
end

save MAP.mat MAP

T = 2;
N = 200;
ts = T / N;
fs = 1 / ts;      %sampling rate 100

x = coding_amp('signal', 1);
t = 0:ts:30-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;


x = coding_amp('signal', 2);
t = 0:ts:30-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;

x = coding_amp('signal', 3);
t = 0:ts:30-ts; 
figure
plot(t,x);
xlabel('t');
ylabel('x(t)');
grid;
