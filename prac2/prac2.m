a = 5;

continuous_time = 0:0.000001:0.02;
y = signal(continuous_time);
plot(continuous_time, y);

% -------------   Question 1  -------------
fs_1 = 2000;
n_1 = 0:39;
T_1 = 1/fs_1;
discrete_time_1 = n_1 * T_1;
sampled_signal_1 = signal(discrete_time_1);
stem(discrete_time_1, sampled_signal_1); %Q1c
hold on;                  %Q1d
plot(continuous_time, y); %Q1b
hold off;

%-------------   Question 2  -------------
% DFT for signal 1
L = 40; %Length of signal 40 samples
Y = fft(sampled_signal_1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2); %Q2b



% Zero padding %Q1d
z = 160;
zero = zeros(1,z);
sampled_signal_1_padded = [sampled_signal_1, zero];
%stem(sampled_signal_1_padded);%Padded signal

L = 40+z; %Length of signal 40 samples + 160 zeros
Y = fft(sampled_signal_1_padded);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2);


% -------------   Question 3  -------------
continuous_time_2 = 0:0.000001:0.025;
y_2 = signal(continuous_time_2);
fs_2 = 2000;
n_2 = 0:49;
T_2 = 1/fs_2;
discrete_time_2 = n_2 * T_2;
sampled_signal_2 = signal(discrete_time_2);
stem(discrete_time_2, sampled_signal_2);
hold on;
plot(continuous_time_2, y_2);
hold off;


z = 150;
zero = zeros(1,z);
sampled_signal_2_padded = [sampled_signal_2, zero];
stem(sampled_signal_2_padded);

L = 200; %Length of signal 50 samples
%Y = fft(sampled_signal_2);
Y = fft(sampled_signal_2_padded);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2);




L = 50;
Hs = hamming(L,'symmetric');
sampled_signal_2_hamming = Hs'.*sampled_signal_2;
stem(sampled_signal_2_hamming);

L = 150+50;
Y = fft([sampled_signal_2_hamming, zero]);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2);


%Question 4

fs_4 = 2000;
n_4 = 0:39;
L = 40;
T_4 = 1/fs_4;
discrete_time_4 = n_4 * T_4;
sampled_signal_4 = signal2(discrete_time_4);
stem(discrete_time_4, sampled_signal_4);



Y = fft(sampled_signal_4);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2);


z = 160;
zero = zeros(1,z);
middle_pad_DFT = [P2(1:20), zero, P2(21:40)];
stem(middle_pad_DFT);

y = real(ifft(middle_pad_DFT));
stem(y)

% Question 5
fs_5 = 2000;
n_5 = 0:49;
L = 50;
T_5 = 1/fs_5;
discrete_time_5 = n_5 * T_5;
sampled_signal_5 = signal2(discrete_time_5);
stem(discrete_time_5, sampled_signal_5);

Y = fft(sampled_signal_5);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = (0:(L-1))/L;
stem(f,P2);

z = 150;
zero = zeros(1,z);
middle_pad_DFT = [P2(1:24), zero(1:75), P2(25), zero(1:75), P2(26:50)];
%middle_pad_DFT = [P2, zero];
stem(middle_pad_DFT);

y = real(ifft(middle_pad_DFT));
stem(y)
pause
function x=signal(t)
    
    x = cos(2*900*pi*t) + 0.15*cos(2*800*pi*t);

end

function x=signal2(t)
    
    x = cos(2*50*pi*t);

end