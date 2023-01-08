close all

T = 2;
N = 200;
ts = T / N;
fs = 1 / ts;      %sampling rate 100

x = coding_amp('signa!', 1);
y = decoding_amp(x, 1);
disp('Decoded Message with Bitrate 1: ')
disp(y)

x = coding_amp('sign!l', 2);
y = decoding_amp(x, 2);
disp('Decoded Message with Bitrate 2: ')
disp(y)

x = coding_amp('signal', 3);
y = decoding_amp(x, 3);
disp('Decoded Message with Bitrate 3: ')
disp(y)
