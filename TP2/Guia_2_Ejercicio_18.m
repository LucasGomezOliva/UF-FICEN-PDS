%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 32;        %   Longitud de datos
Fs = 5;    %   Frecuencia de muestreo
Ts = 1/Fs;      %   Periodo de Muestreo

A = 1;
alfa = -2;

[ nTs , x ] = S_Exponencial( A , alfa , L  , Ts );

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 18');


stem(nTs,x);grid on;
title('Señal en Tiempo discreto'); xlabel('n [ ]'); ylabel('Magnitud');



%% Transformada Discreta de Fourier

X = fft(x);

f = (0:L-1)*(Fs/L);  

H2 = figure(2);
set(H2,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 16: FFT Señal Original');

subplot(2, 1, 1);
stem(f,abs(X)); grid on; 
title('Magnitud de la FFT'); xlabel('n [ ]'); ylabel('Magnitud');

subplot(2, 1, 2);
stem(f,angle(X)); grid on;
title('Fase de la FFT'); xlabel('n [ ])'); ylabel('Fase (radianes)');
