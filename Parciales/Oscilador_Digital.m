clear 
close all
clc

N = 1024;
fx = 5;
fs = 205;
omega = 2*pi*fx/fs;

B = [0 sin(omega)];
A = [1 -2*cos(omega) 1];

[H,w] = freqz(B,A,1024,"whole");

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Oscilador Digial: Respuesta en modulo y fase');

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
        'Oscilador Digial: Diagrama de polos y ceros');

zplane(B,A);
grid on;

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Oscilador Digial: Respuesta al impulso');

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
