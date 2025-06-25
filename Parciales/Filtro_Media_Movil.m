clear 
close all
clc

L = 5;

B = zeros(1,L+2);

B(1) = 1;
B(L+2) = -1;
B = B * 1/(L+1);

A = [1 -1];

[H,w] = freqz(B,A,1024,"whole");

tf(B,A,-1)

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro de Media Movil con L = 5 : Respuesta en Modulo y Fase');

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
        'Filtro de Media Movil con L = 5 : Diagrama de polos y ceros');

zplane(B,A);
grid on;

h = impz(B,A);

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro de Media Movil con L = 5 : Respuesta al impulso');

stem(0:1:length(h)-1,h,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor','b')
title('Respuesta al impulso')
xlabel('n')
ylabel('h[n]')
grid on;
