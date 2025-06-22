clear 
close all
clc

N = 1024;
fx = 5;
fs = 105;
Ts = 1/fs;
omega = 2*pi*fx/fs;
alfa = 0.9;

B = [0 sin(omega)*exp(-alfa*Ts)];
A = [1 -2*cos(omega)*exp(-alfa*Ts) exp(-alfa*Ts*2)];

[H,w] = freqz(B,A,1024,"whole");

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Oscilador Digial Amortiguado: Respuesta en Modulo y Fase');

subplot(2,1,1)
plot(w/pi,abs(H));
grid on;
title('Respuesta en modulo')
xlabel('\omega / \pi')
ylabel('|H(e{jw})|')
subplot(2,1,2)
plot(w/pi,angle(H));
grid on;
title('Respuesta en fase')
xlabel('\omega / \pi')
ylabel('∠H(e^{j\omega})')

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Oscilador Digial Amortiguado: Diagrama de polos y ceros');

zplane(B,A);
grid on;

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Oscilador Digial Amortiguado: Respuesta al impulso');

n = 0:N-1;
x = [1 zeros(1, N-1)];
y = filter(B, A, x);
stem(n(1:200),y(1:200));
grid on; 
hold on;
plot(n(1:200),y(1:200));
title(['Señal oscilatoria generada: \Omega_0 = ' num2str(omega)])
xlabel('n')
ylabel('y[n] = sen(\Omega_0 n)')
