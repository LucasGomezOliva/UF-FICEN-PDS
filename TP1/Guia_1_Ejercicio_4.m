%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

A  = 5;     %   Amplitud de la señal
F0 = 4;     %   Frecuencia de oscilacion
TITA = 0;%   Fase Inicial
L = 16;     %   Longitud discreta

H1 = figure (1);
set(H1,'name','Ejercicio 4: Senoidal Continua y Discreta');
subplot(2,2,1);
title(' FS = 10 * F0 ')
Senoidal_Continua_Muestreada(  A , F0 , TITA , 10 * F0 , L )
subplot(2,2,2);
title(' FS = 4.5 * F0 ')
Senoidal_Continua_Muestreada(  A , F0 , TITA , 4.5 * F0 , L )
subplot(2,2,3);
title(' FS = 2 * F0 ')
Senoidal_Continua_Muestreada(  A , F0 , TITA , 2 * F0 , L )
subplot(2,2,4);
title(' FS = 1/3 * F0 ')
Senoidal_Continua_Muestreada(  A , F0 , TITA , ( 1 / 3 ) * F0 , L )
