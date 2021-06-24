r1 = 0.95;
r2 = 0.95;
o1 = 3*pi/4;
o2 = pi/4;
z = tf('z');

% ZEROS
zz_1 = r1*exp(o1*1i);
zz_2 = r1*exp(-o1*1i);
% POLES
pp_1 = r2*exp(o2*1i);
pp_2 = r2*exp(-o2*1i);

p = [pp_1, pp_2];
z = [zz_1, zz_2];

%zplane(z,p)
%----------------------------------------------------------
% TRANSFER FUNCTION
top = [1 -2*cos(o1)*r1 r1*r1];
bottom = [1 -2*cos(o2)*r2 r2*r2];
[z,p,k] = tf2zp(top,bottom);

zplane(z,p)

H = tf(top, bottom);
[h, w] = freqz(top, bottom, 1000);
plot(w/pi,20*log10(abs(h)));
%----------------------------------------------------------
%----------------------------------------------------------

rr = [0.0, 0.5, 0.8, 1.0, 1.05];
% Frequency reponse with R1
i = 1;
for r = rr
    [h, f] = freqz([1 -2*cos(o1)*r r*r], bottom,  'whole');
    a = unwrap(angle(h));
    
    subplot(5,2,i);
    plot(f/pi,20*log10(abs(h)));
    title('Magnitude spectrum with r1 = '+ string(r));
    ylabel '|H|'
    xlabel 'x pi rad/sample'
    
    subplot(5,2,i+1);
    plot(f/pi,a)
    title('Phase sepctrum with r1 = '+ string(r));
    xlabel 'x pi rad/sample'
    ylabel 'angle'
    i = i + 2;
end
close all hidden
%----------------------------------------------------------

% Impulse reponse R1
imp = [1; zeros(49,1)];
i = 1;
for r = rr
    subplot(3,2,i);
    h = filter([1 -2*cos(o1)*r r*r],bottom,imp);
    stem(0:49,h);
    title('Impulse response with r1 = '+ string(r));
    ylabel 'magnitude'
    xlabel 'x pi rad/sample'
    i = i + 1;
end
close all hidden
%----------------------------------------------------------
%----------------------------------------------------------

% Frequency reponse with R2
i = 1;
for r = rr
        
    [h, f] = freqz(top, [1 -2*cos(o2)*r r*r], 'whole');
    a = unwrap(angle(h));
    
    subplot(5,2,i);
    plot(f/pi,20*log10(abs(h)));
    title('Magnitude spectrum with r2 = '+ string(r));
    ylabel '|H|'
    xlabel 'x pi rad/sample'
    
    subplot(5,2,i+1);
    plot(f/pi,a)
    title('Phase sepctrum with r2 = '+ string(r));
    xlabel 'x pi rad/sample'
    ylabel 'angle'
    i = i + 2;
end
close all hidden
%----------------------------------------------------------

% Impulse reponse R2
imp = [1; zeros(49,1)];
i = 1;
for r = rr
    subplot(3,2,i);
    h = filter(top,[1 -2*cos(o2)*r r*r],imp);
    stem(0:49,h);
    title('Impulse response with r2 = '+ string(r));
    i = i + 1;
end
close all hidden
%----------------------------------------------------------
%----------------------------------------------------------

oo = [0, pi/4, pi/2, 3*pi/4, pi];

% Frequency reponse with o1
i = 1;
for o = oo
    [h, f] = freqz([1 -2*cos(o)*r1 r1*r1], bottom, 'whole');
    a = unwrap(angle(h));
    
    subplot(5,2,i);
    plot(f/pi,20*log10(abs(h)));
    title('Magnitude spectrum with O1 = '+ string(o));
    ylabel '|H|'
    xlabel 'x pi rad/sample'
    
    subplot(5,2,i+1);
    plot(f/pi,a)
    title('Phase sepctrum with O1 = '+ string(o));
    xlabel 'x pi rad/sample'
    ylabel 'angle'
    i = i + 2;
end
close all hidden
%----------------------------------------------------------

% Impulse reponse with o1
i = 1;
for o = oo
    subplot(3,2,i);
    h = filter([1 -2*cos(o)*r1 r1*r1],bottom,imp);
    stem(0:49,h);
    title('Impulse response with o1 = '+ string(o));
    i = i + 1;
end
close all hidden
%----------------------------------------------------------
%----------------------------------------------------------

% Frequency reponse with o2
i = 1;
for o = oo
    [h, f] = freqz(top, [1 -2*cos(o)*r2 r2*r2], 'whole');
    a = unwrap(angle(h));
    
    subplot(5,2,i);
    plot(f/pi,20*log10(abs(h)));
    title('Magnitude spectrum with O2 = '+ string(o));
    ylabel '|H|'
    xlabel 'x pi rad/sample'
    
    subplot(5,2,i+1);
    plot(f/pi,a)
    title('Phase sepctrum with O2 = '+ string(o));
    xlabel 'x pi rad/sample'
    ylabel 'angle'
    i = i + 2;
end
close all hidden
%----------------------------------------------------------

% Impulse reponse with o2
i = 1;
for o = oo
    subplot(3,2,i);
    h = filter(top, [1 -2*cos(o)*r2 r2*r2],imp);
    stem(0:49,h);
    title('Impulse response with o2 = '+ string(o));
    i = i + 1;
end
close all hidden
%----------------------------------------------------------
%----------------------------------------------------------

ww = [0.22*pi, 0.25*pi, 0.27*pi];
t = 0:0.001:49;
i = 1;
for w = ww
    subplot(3, 1, i);
    y = sin(w*t);
    h = filter(top, [1 -2*cos(o2)*1 1],y);
    plot(t, h);
    hold on
    plot(t, y);
    title('Sin('+ string(w)+'t)');
    xlabel 'time'
    ylabel 'Amplitude'
    i = i + 1;
end
