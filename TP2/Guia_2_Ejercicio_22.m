%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 32;        %   Longitud de datos
Fs = 40;    %   Frecuencia de muestreo
Ts = 1/Fs;      %   Periodo de Muestreo

A = 1;
alfa = -2;

[ nTs , x ] = S_Exponencial( A , alfa , L  , Ts );

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 18');


stem(nTs,x);grid on;hold on;
title('Señal en Tiempo discreto'); xlabel('n [ ]'); ylabel('Magnitud');
