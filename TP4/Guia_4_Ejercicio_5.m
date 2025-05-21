%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 550;                %   Cantidad de muestras
fs = 250;               %   Frecuencia de muestreo de la ECG
ts = 1/fs;              %   Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;    %   Tiempo discreto

s_linea = sin(2* pi * 50 * nTs);    %   Ruido conocido

Punt = fopen('ecg_nt_Ejercicio_5.txt','r');
ecg = fscanf(Punt,'%f\n');
fclose(Punt);

H1 = figure(1);
set(H1,'position',[60 30 1000 700],'Menubar','none',...
        'NumberTitle','off','name','Señales');

xk = s_linea;
dk = ecg;
P = 5;
Q = 0;  %   Trabajo con un filtro FIR

[ B, A, yk, ek ] = ARMA_Adaptativo( xk', dk' ,P , Q );

subplot(3,1,1);
plot(nTs,s_linea); grid on; hold on;
title('Ruido: senoidal 50Hz'); ylabel('xk'); xlabel('k');
subplot(3,1,2);
plot(nTs,ecg); grid on; hold on;
title('ECG + ruido'); ylabel('dk'); xlabel('k');
subplot(3,1,3);
plot(nTs,ek); grid on; hold on;
title('ECG sin ruido'); ylabel('ek'); xlabel('k');

[ H, w ] = freqz(B,A,L,"whole");

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Espectro de magnitud y fase del filtro adaptativo');

subplot(2,1,1)
plot(pi*(w/pi)*(fs/2)/pi,abs(H)); grid on; hold on;
title('Espectro de Magnitud'); xlabel('Frecuencia [Hz]'); ylabel('Magnitud');
subplot(2,1,2)
plot(pi*(w/pi)*(fs/2)/pi,angle(H)); grid on; hold on;
title('Espectro de Fase'); xlabel('Frecuencia [Hz]'); ylabel('Fase');

