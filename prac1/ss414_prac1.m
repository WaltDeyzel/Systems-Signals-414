%Question 1
f_s = 2000;
% x_ = 0:f_s %create array
n = 0:39;
Freq = 50;
A = 2;
T = 1/f_s;
d = 25/60;
t = 0:0.0001:0.1;

x_ = sinewave(A,Freq,t);
 
plot(t, x_)
title('Analogue sine example')
xlabel('time(s)')
ylabel('Amplitude')

%Question 2
T= 1/f_s;
t = n*T;
A = 10;

F = [0, 100, 900, 1000, 1100, 1900, 2000, 2100];
x_ = sinewave(A, 900, t); %Matlab has 1-indexing, not zero-indexing
f1 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=0Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)


x_ = sinewave(A, 100, t)
f2 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=100Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 900, t)
f3 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=900Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 1000, t)
f4 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=1000Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 1100, t)
f5 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=1100Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 1900, t)
f6 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=1900Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 2000, t)
f7 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=2000Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

x_ = sinewave(A, 2100, t)
f8 = figure;
stem(t, x_)
title('Sampled continuous-time signal, f=2100Hz')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
yticks(-10:2:10)
xticks(0:0.001:0.02)

% choose f = 100 Hz to verify digital frequency
f = 100;
f_w = f/f_s;
f9 = figure;
stem(n, sinewave_(A, f_w, n))
title('Discrete-time analogue sinusoid for f_w digital frequency')
xlabel('n')
ylabel('Amplitude')

%Question 3
f_s_3 = 40000;
T_3 = 1/f_s_3;
n_3 = 0:799;
t_3 = n_3*T_3;

f10 = figure;
x_ = sinewave(A, 900, t_3);
stem(t_3, x_)
title('Comparison of 900Hz sinusoid')
xlabel('time(s)')
ylabel('Amplitude')
ylim([-10.5, 10.5])
xlim([0, 0.02])
xticks(0:0.001:0.02)
hold on

T = 1/f_s;
t = n*T;
x_q2 = sinewave(A, 900, t);
plot(t, x_q2)
% xlim([0, 0.02])
hold off

f11 = figure;
ylim([-10.5, 10.5])
x_ = sinewave(A, 100, t_3);
stem(t_3, x_)
hold on
title('Comparison of 100Hz sinusoid')
xlabel('time(s)')
ylabel('Amplitude')
% xticks(0:0.001:0.02)
T = 1/f_s;
t = n*T;
x_q2_ = sinewave(A, 100, t);
plot(t, x_q2_)
% xlim([0, 0.02])
hold off

%Question4
n = 0:39;
A = 10;
f_s = 2000;
T = 1/f_s;
t = n*T;
f12 = figure;
y = (sinewave(A, 100, t) + sinewave(A, 2100, t));
stem(t, y)
title('Sampled sum of sinusoids')
xlabel('time(s)')
ylabel('Amplitude')

%Question5
T_p_900 = 1/900;
T_p_100 = 1/100;
N_P_100 = 40000*T_p_100;
N_P_900 = 40000*T_p_900;
N_P_900_r = 40000*2*pi/900;

function x = sinewave(A,F,t)
    x = A*sin(2*pi*F*t)
end

function x = sinewave_(A,F, n)
    x = A*sin(2*pi*F*n)
end