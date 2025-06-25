clear 
close all
clc

N = 10;
alfa = 0.8;
R = 4;
L = 50;

[B, A] = Obtener_Coeficientes_Ecos(alfa, R, N);

n = 0:1:L-1;
x = zeros(1, L);
x(1) = 1;  

y = filter(B, A, x);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Señal de Entrada y Salida del Filtro');

subplot(2,1,1);
stem(n,x,'LineWidth',1,'MarkerSize',6,'MarkerFaceColor','b');
title('Señal Original');
xlabel('n'); ylabel('x[n]');
grid on;
subplot(2,1,2);
stem(n,y,'LineWidth',1,'MarkerSize',6,'MarkerFaceColor','b');
title('Señal con Eco');
xlabel('n'); ylabel('y[n]');
grid on;

[H,w] = freqz(B,A,1024,"whole");

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Respuesta en Amplitud y en Fase');

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

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Diagrama de Polos y Ceros del Filtro');

zplane(B,A);

function [B, A] = Obtener_Coeficientes_Ecos(alfa, R, N)
    B = zeros(1, R*N+1);
    B(1) = 1;
    B(R*N+1) = -alfa^N;
    A = zeros(1, R+1);
    A(1) = 1;
    A(R+1) = -alfa;
end
