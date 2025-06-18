clear 
close all
clc

a = 0.2;

b = -0.2;

Ejercicio_01(a,b);

function [TFS , w] = Ejercicio_01(a,b)

B_01 = [-a 1];  % (z^(-1) - a)
B_02 = [-b 1];  % (z^(-1) - b)

A_01 = [1 -a];  % (1 - az^(-1))
A_02 = [1 -b];  % (1 - bz^(-1))

B = conv(B_01,B_02);
A = conv(A_01,A_02);

[H,w] = freqz(B,A,512,'whole'); % Es un filtro pasa todo

figure(1)
subplot(2,1,1)
plot(w/pi,abs(H));
grid on;
title('Respuesta en modulo')
xlabel('w')
ylabel('|H(e{jw})|')
subplot(2,1,2)
plot(w/pi,angle(H));
grid on;
title('Respuesta en fase')
xlabel('w')
ylabel('|angulo (e{jw})|')
TFS = H;
figure(2);
zplane(B,A);
grid on;
end