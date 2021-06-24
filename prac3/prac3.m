% y(t) = a * x(t-td) + w(t)
% Sampling period T
% x[n] = x(nT)
% y[n] = y(nT) = a*x(nT-DT) + w(nT)
% td = DT -> D is an integer

% Barker Sequence -> n = 13
x_n = [1, 1, 1, 1, 1, -1, -1, 1, 1,-1, 1, -1, 1];
[r, j] = xcorr(x_n);
stem(j, r)
%Noise with variance = 0.01;
w = sqrt(10).*randn(1,200); 
% v = var(w); % Variance of white noise is 0.01

gap = 141:259;
% Q 3b) Take a = 0.9; D=20; n=200
D = 20;
delay = zeros(1,D);
fill = zeros(1, 200-D-13);

x_n_reflected = [delay, x_n, fill];
y = 0.9.*x_n_reflected + w;
[r3, i3] = xcorr(y, x_n);
stem(i3(gap), r3(gap));
pause


%Question 4
x_n = [1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1];
% from Q 3b) Take a = 0.9; D=20; n=200
w = sqrt(0.1).*randn(1,200);
x_n_reflected = [delay, x_n, fill];
y4 = 0.9.*x_n_reflected + w;
stem(y4);
[r, i] = xcorr(x_n);
stem(i, r)

[r4, i4] = xcorr(y,x_n_reflected);
stem(i4(gap), r4(gap));

%Question 5
%Now let x[n] itself consist of 200 samples of Gaussian white noise with
%variance ? =1
w = sqrt(1).*randn(1,200); 
x_n = sqrt(1).*randn(1,180); 
[r, i] = xcorr(x_n);
stem(i, r)
x_n_reflected = [delay, x_n];
y5 = 0.9.*x_n_reflected + w;
stem(y5);
[r5, i5] = xcorr(y5, x_n);
stem(i5(gap), r5(gap));

%Question 6
x_n = sqrt(1).*randn(1,13);
[r, i] = xcorr(x_n);
stem(i, r)

x_n_reflected = [delay, x_n, fill];
y6 = 0.9.*x_n_reflected + w;
stem(y6);

[r6, i6] = xcorr(y6, x_n_reflected);
stem(i6(gap), r6(gap));
pause

