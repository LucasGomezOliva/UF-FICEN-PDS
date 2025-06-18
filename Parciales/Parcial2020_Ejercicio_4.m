
clear 
close all
clc

B = [2 -3 1];
A = [1 1 1 ];

[H,w] = freqz(B,A,512,"whole");
tf(B,A,-1)
F1 = figure(1);
figure(1)
subplot(2,1,1);
plot(w/pi,abs(H));
grid on;
xlabel('w');
ylabel('|H(e^{jw})|');
title('Respuesta en amplitud');
subplot(2,1,2);
plot(w/pi,angle(H));
grid on;
xlabel('w');
ylabel('angle(H(e^{jw}))');
title('Respuesta en fase')
figure(2)
zplane(B,A)
grid on;
