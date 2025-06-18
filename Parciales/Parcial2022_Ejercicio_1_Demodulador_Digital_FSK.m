clear 
close all
clc

Av = 1;
L = 1024;
fo = 2.5e3;
f1 = 1.25e3;
fs = 10e3;
n = 0:1:(L-1);
M = 4;

[xn0,xn_retrasada0,xm0] = Generador_Xm(Av,fo,fs,n,M);
[xn1,xn_retrasada1,xm1] = Generador_Xm(Av,f1,fs,n,M);

Cantidad_Puntos_Graficar = 20;

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Demodulador Digital FSK(Frequency Shift Keying): Señal recibida');

%   Utilizando fx = f0 = 2.5KHz

subplot(3,2,1)
stem(xn0(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal de entrada xn cuando fx = f0 = 2.5KHz')
xlabel('n')
ylabel('x[n]')
subplot(3,2,3)
stem(xn_retrasada0(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal xn retrasada cuando fx = f0 = 2.5KHz')
xlabel('n')
ylabel('x[n]')
subplot(3,2,5)
stem(xm0(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal xm cuando fx = f0 = 2.5KHz')
xlabel('n')
ylabel('x[n]')

%   Utilizando fx = f1 = 1.25KHz

subplot(3,2,2)
stem(xn1(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal de entrada xn cuando fx = f1 = 1.25KHz')
xlabel('n')
ylabel('x[n]')
subplot(3,2,4)
stem(xn_retrasada1(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal xn retrasada cuando fx = f1 = 1.25KHz')
xlabel('n')
ylabel('x[n]')
subplot(3,2,6)
stem(xm1(1:Cantidad_Puntos_Graficar));
grid on;
title('Señal xm cuando fx = f1 = 1.25KHz')
xlabel('n')
ylabel('x[n]')

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        ['Demodulador Digital FSK(Frequency Shift Keying): ' ...
        'Respuesta en amplitud y en fase del filtro digital']);

D = 4;
K = 5;

B = zeros(1,D+1);
B(1) = 1;
B(D+1) = -1;
B = B * K;
A = [1 -1] * D;

[H,w] = freqz(B,A,1024,"whole");

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
set(F3,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        ['Demodulador Digital FSK(Frequency Shift Keying): ' ...
        'Diagrama de Polos y Ceros del filtro digital']);

zplane(B,A);
grid on;

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Demodulador Digital FSK(Frequency Shift Keying): Salida Sistema');

y0 = filter(B,A,xm0);
y1 = filter(B,A,xm1);
subplot(2,1,1);
plot(y0);
grid on;
title('Salida del sistema FSK cuando fx = f0 = 2.5KHz')
xlabel('n');
ylabel('y_0[n]');
subplot(2,1,2)
plot(y1)
grid on;
title('Salida del sistema FSK cuando fx = f1 = 1.25KHz')
xlabel('n')
ylabel('y_1[n]')

function [xn,xn_retrasada,xm] = Generador_Xm(A,fx,fs,n,M)
xn = A * cos (2*pi*(fx/fs)*n);
xn_retrasada = [zeros(1,M),xn(1:end-M)];
xm = xn .* xn_retrasada;
end
