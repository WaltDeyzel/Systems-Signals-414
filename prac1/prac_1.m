
f = 50;
A = 2;
t = 0:0.0001:5/f;
y = sinewave(A, f, t);

%plot(t,y);

%stem(t,y);

%Q2 
A = 10;
n_2 = 0:39;
fs_2 = 2000; %Sampling
T_2= 1/fs_2;
t_2 = n_2*T_2;
f_2 = 9*100;
fw_2 = f_2/fs_2;

y_2 = sinewave(A, f_2, t_2);
%stem(t_2, y_2);

%Q3

fs_3 = 40000;
n_3 = 0:799;
T_3=  1/fs_3;
t_3 = n_3*T_3;
f_3 = 900;
y_3 = sinewave(A, f_3, t_3);
t_scale = n_2 * T_2 * 10;
%stem(t_2, y_2);
hold on;
%plot(t_3,y_3);
hold off;

%Q4

A = 10;
fs_4 = 2000;
n_4 = 0:39;
T_4= 1/fs_4;
t_4 = n_4*T_4;


tx = 0:0.00001:0.02;
f1 = 100;
y1x = sinewave(A, f1, tx);
f2 = 2100;
y2x = sinewave(A, f2, tx);
yx = y2x+y1x;
plot(tx, y2x);

plot(tx, y1x);

f1 = 100;
y1 = sinewave(A, f1, t_4);
f2 = 2100;
y2 = sinewave(A, f2, t_4);
y =  y2;

stem(t_4,y);
%plot(t_4,y2);




%Q5
A = 10;
n_5 = 0:39;
fs_5 = 2000; %Sampling
T_5= 1/fs_2;
t_5 = n_5*T_5;
f_5 = 143.239;

y_5 = sinewave(A, f_5, t_5);
stem(t_5, y_5);
hold on 
plot(tx, sinewave(A, f_5, tx));


function x = sinewave(A,f,t)
    
    x = A*sin(2*pi*f*t);

end