%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

N = 5;  %   Cantidad de muestras

k=(0:1000)';

xk = sin(2 * pi * k / N );  %   Señal de entrada
dk = 2 * cos(2 * pi * k / N);   %   Señal deseada
P = 1;   %   Orden de los coeficientes del Numerador ( 1 solo retardo )
Q = 0;   %   Orden de los coeficientes del Numerador

[ B, A, yk, ek ] = ARMA_Adaptativo( xk, dk ,P , Q );

H1 = figure(1);
set(H1,'position',[60 30 1000 700],'Menubar','none',...
        'NumberTitle','off','name','Señales');
subplot(3,1,1);
plot(k,xk); grid on; hold on;
title('Señal de entrada'); ylabel('xk'); xlabel('k');
subplot(3,1,2);
plot(k,dk); grid on; hold on;
title('Señal deseada');  ylabel('dk'); xlabel('k');
subplot(3,1,3);
plot(k,yk); grid on; hold on;
title('Señal salida filtro adaptativo');  ylabel('yk'); xlabel('k');
