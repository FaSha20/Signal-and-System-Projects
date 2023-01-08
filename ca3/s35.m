close all

ts = 0.01;
t = 0:ts:30-ts;

amplitude = 1;

x = coding_amp('signal', 1);
xNoisy = x + amplitude * rand(1, length(x));

y = decoding_amp(x, 1);
yNoisy = decoding_amp(xNoisy, 1);

disp('Decoded message of Original signal: ')
disp(y);
disp('Decoded message of Noisy signal: ')
disp(yNoisy);

figure 
subplot(2,1,1)
plot(t,x)
title('Original Signal', 'FontSize', 15);
subplot(2,1,2)
plot(t,xNoisy);
title('Noisy Signal', 'FontSize', 15);