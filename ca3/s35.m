close all

ts = 0.01;
t = 0:ts:30-ts;

amplitude = 0.09;
bitrate = 3;
signal = 'signal';

[x, bin_input_sig] = coding_amp(signal, bitrate);
xNoisy = x + amplitude * rand(1, length(x));

y = decoding_amp(x, bitrate);
[yNoisy, bin_judged_sig] = decoding_amp(xNoisy, bitrate);

disp('Decoded message of Original signal: ')
disp(y);
disp('Decoded message of Noisy signal: ')
disp(yNoisy);

disp(bin_input_sig)
disp(bin_judged_sig);

n = 0;
for i = 1:bitrate:length(signal)*5
    diff = bin_judged_sig(i:i+bitrate-1)~=bin_input_sig(i:i+bitrate-1);
    if(nnz(diff) == 0)
        n = n + 1;
    end
end
disp('Number of correct judgements:');disp(n)
disp('Number of total judgements:');disp(length(signal)*5/bitrate)

figure 
subplot(2,1,1)
plot(t,x)
title('Original Signal', 'FontSize', 15);
subplot(2,1,2)
plot(t,xNoisy);
title('Noisy Signal', 'FontSize', 15);