clear 
close all
clc

a = 0.8;

Ejercicio_06(a);

function [TFS , w] = Ejercicio_06(a)

B = zeros(1,8+1);
B(1) = 1;
B(8+1) = -a^8;
A = [1 -a];

[H,w] = freqz(B,A,512,'whole');
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
tf(B,A,-1)
figure(3)
h = ifft(H);
stem(h(1:8));
grid on;
hold on;
plot(h(1:8));
title('Respuesta en al impulso')
xlabel('n')
ylabel('h[n]')
end