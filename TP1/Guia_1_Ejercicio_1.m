%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas


L = 100;    %   Longitud de datos
Fs = 20000;  %   Frecuencia de muestreo
Ts=1/Fs    %   Periodo de Muestreo
nTs=0:Ts:(L-1)*Ts; % Tiempo discreto

x1=zeros(size(nTs)); % Delta de Kronecker
x1(1)=1;
x2=ones(size(nTs)); % Escalon Unitario
x3=0:L-1; % rampa Unitaria

H=figure(1);
set(H,'name','PDS. TP#1. Ejercicio 1');
subplot(3,1,1)
stem(nTs,x1);
grid
ylabel('d[n]');
xlabel('nTs [s]');
subplot(3,1,2)
stem(nTs,x2);
grid
ylabel('u[n]');
xlabel('nTs [s]');
subplot(3,1,3)
stem(nTs,x3);
grid
ylabel('n.u[n]');
xlabel('nTs [s]');