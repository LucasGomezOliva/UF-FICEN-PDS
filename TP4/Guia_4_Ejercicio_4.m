%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

L = 1024;
fs = 1e3;               %   Frecuencia de muestreo del filtro
ts = 1/fs;              %   Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;    %   Tiempo discreto

desvio = 0.5;
xk = randn(length(nTs),1)*desvio;

Numz = [1 0 0];
Denz = [1 -1.2 0.6 ];

Hz = tf(Numz,Denz,-1)

dk = filter(1,Denz,xk);

P = 2;
Q = 2;

[ B, A, yk, ek ] = ARMA_Adaptativo( xk, dk ,P , Q );

Hz_adap = tf(B',A',-1)

figure(1)
subplot(4,1,1)
plot(xk)
grid on;
title('Señal de entrada')
xlabel('n[]')
ylabel('x[n]')
subplot(4,1,2)
plot(dk)
grid on;
title('Señal deseada')
xlabel('n[]')
ylabel('d[n]')
subplot(4,1,3)
plot(yk)
grid on;
xlabel('n[]')
ylabel('y[n]')
title('Señal de salida')
subplot(4,1,4)
plot(ek)
grid on;
xlabel('n[]')
ylabel('e[n]')
title('Señal de error')
