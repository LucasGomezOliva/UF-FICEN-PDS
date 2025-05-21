%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

L = 5000;
fs = 250;               % Frecuencia de muestreo del filtro
ts = 1/fs;              % Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;    % Tiempo discreto

Punt = fopen('ecg_nt_long_E_6.txt','r');
ecg = fscanf(Punt,'%f\n');
fclose(Punt);

% ecg 250hz

H1 = figure(1);
set(H1,'position',[60 30 1000 700],'Menubar','none',...
        'NumberTitle','off','name','Señales');
delta = 100;
dk = ecg;
xk = ecg(1+delta:5000);
xK(1:delta) = 0;
P = 15;
Q = 0;  % Trabajo con un filtro FIR

[ B, A, yk, ek ] = ARMA_Adaptativo( xk, dk ,P , Q );

subplot(2,1,1);
plot(nTs(1:2000),ecg(1:2000)); grid on;
title('ECG + ruido'); ylabel('xk'); xlabel('k');
subplot(2,1,2);
plot(nTs(1:2000),ek(1:2000)); grid on;
title('ECG sin ruido'); ylabel('xk'); xlabel('k');

