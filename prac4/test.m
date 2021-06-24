
top = [0.0038 0.0001 0.0051 0.0001 0.0038];
bottom = [1 -3.2821 4.236 -2.5275 0.5865];
H = tf(top, bottom);

%----------------------------------------------------------
[h, f] = freqz(top, bottom, 'whole');
a = unwrap(angle(h));
    
subplot(2,1,1);
plot(f/pi,20*log10(abs(h)));
title('Magnitude spectrum');
ylabel '|H|'
xlabel 'x pi rad/sample'
    
subplot(2,1,2);
plot(f/pi,a)
title('Phase sepctrum');
xlabel 'x pi rad/sample'
ylabel 'angle'
close all hidden
[z,p,k] = tf2zp(top,bottom);
x = [-0.41218585899469, -0.41218585899469, 0.399027964257851, 0.399027964257851, 0.836616006780976, 0.836616006780976, 0.804433993219025, 0.804433993219025];
y = [0.911099784680475, -0.911099784680475, 0.91693875680998, -0.916938756809982, 0.411603487883070, -0.411603487883070, 0.165929973214432, -0.165929973214432];
%zplane(z,p)
[theta, rho] = cart2pol(x,y);
polarscatter(theta, rho)
pause
%----------------------------------------------------------
%----------------------------------------------------------
ww = [0.1*pi, 0.5*pi, 1*pi];
t = 0:0.001:29;
i = 1;
for w = ww
    subplot(3, 1, i);
    y = sin(w*t);
    h = filter(top, bottom,y);
    stem(h);
    plot(t, h);
    hold on
    plot(t, y);
    title('Sin('+ string(w)+'t)');
    xlabel 'time'
    ylabel 'Amplitude'
    i = i + 1;
end