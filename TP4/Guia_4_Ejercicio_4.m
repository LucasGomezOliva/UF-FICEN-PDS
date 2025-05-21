%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

L = 512;
fs = 1e3;       % Frecuencia de muestreo del filtro
ts = 1/fs;      %   Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;        % Tiempo discreto

% Ruido blanco Gauseano

mu = 0;
sigma = 1;
xk = sigma * rand(L,1)';

Numz = [1];
Denz = [1 -1.2 0.6 ];

Hz = tf(Numz,Denz,-1)

dk = filter(Numz,Denz,xk);

P = 0;
Q = 2;

[ B, A, yk, ek ] = ARMA_Adaptativo( xk', dk' ,P , Q );

Hz_adap = tf(B',A',-1)
