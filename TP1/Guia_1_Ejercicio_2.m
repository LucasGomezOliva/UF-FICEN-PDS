%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas


L = 100;    %   Longitud deseada
A = 7;      %   Valor pico de la señal
P = 4;     %   Cantidad de peridos en la longitud deseada
Fs = 20000; %   Frecuencia de muestreo de 20kHz
Ts = 1/Fs;  %   Periodo de Muestreo
DUTY = 60;  %   Ciclo de trabajo

nTs = 0:Ts:( L - 1 )*Ts;    % Tiempo discreto Total

f0 = ( P / L ) * Fs;

H1 = figure(1);
subplot(2,1,1);
X1 = sawtooth(2*pi*f0*nTs);
stem(nTs, A * X1 );
grid;
subplot(2,1,2);
X2 = square(2*pi*f0*nTs,DUTY);
stem(nTs, A * X2);
grid;