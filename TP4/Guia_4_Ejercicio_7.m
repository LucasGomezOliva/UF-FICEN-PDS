%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

load("noise.mat")       %   Señal de ruido
load("recNoise.mat")    %   Grabacion de la señal de ruido
load("singing.mat")     %   Sonido anecoico

L = 48e4;               %   Cantidad de muestras
fs = 48e3;              %   Frecuencia de muestreo del filtro
ts = 1/fs;              %   Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;    %   Tiempo discreto

xk = noise;
dk = recNoise;
P = 2;                  %   P = Q Entonces es un filtro IIR
Q = P;

[ B, A, yk, ek ] = ARMA_Adaptativo( xk, dk ,P , Q );

H1 = figure(1);
set(H1,'position',[60 30 1000 700],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 07: Identificacion de Sistemas');

subplot(2,2,1);
plot(nTs,xk); grid on; hold on;
title('Ruido'); ylabel('xk'); xlabel('k');
subplot(2,2,2);
plot(nTs,dk); grid on; hold on;
title('Grabacion Ruido'); ylabel('dk'); xlabel('k');
subplot(2,2,3);
plot(nTs,ek); grid on; hold on;
title('Error del filtro'); ylabel('ek'); xlabel('k');
subplot(2,2,4);
plot(nTs,yk); grid on; hold on;
title('Salida del filtro adaptativo'); ylabel('yk'); xlabel('k');

[ H, w ] = freqz(B,A,L,"whole");

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 07: Espectro de magnitud y fase del filtro adaptativo');

subplot(2,1,1)
plot(pi*(w/pi)*(fs/2)/pi,abs(H)); grid on; hold on;
title('Espectro de Magnitud'); xlabel('Frecuencia [Hz]'); ylabel('Magnitud');
subplot(2,1,2)
plot(pi*(w/pi)*(fs/2)/pi,angle(H)); grid on; hold on;
title('Espectro de Fase'); xlabel('Frecuencia [Hz]'); ylabel('Fase');

H3 = figure(3);
set(H3,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 07: Entrada y salida sonido anecoico');

y = filter(B ,A ,singing );

subplot(2,1,1);
plot(singing); grid on; hold on;
title('Entrada'); ylabel('x'); xlabel('k');
subplot(2,1,2);
plot(y); grid on; hold on;
title('Salida'); ylabel('y'); xlabel('k');
