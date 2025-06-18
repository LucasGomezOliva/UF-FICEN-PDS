clear 
close all
clc

Ejercicio_02();

function [TFS , w] = Ejercicio_02()

B_01 = [1 -2];  % (1 - 2z^(-1))
B_02 = [1 -4];  % (1 - 4z^(-1))
B_03 = [0 1];   % (z^(-1))

A = [1 -(1/2)]; % (1 - (1/2)z^(-1))

B_AUX = conv(B_01,B_02);
B = conv(B_AUX,B_03);   % B = [0     1    -6     8]

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