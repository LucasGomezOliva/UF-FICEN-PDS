%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

    
[ x,fs ] = audioread('introBlackDog.wav');

disp('Frecuencia de muestreo de la señal de audio [Hz]:')

fs

disp('Longitud de la señal de audio [muestras]:')

N = length(x)
t=0:1/fs:(N-1)/fs;
Af = fs/N;
f = 0:Af:fs-Af;
H = fft(x);

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 16: FFT Señal Original');

subplot(2,1,1)
plot(f,abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(f,angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

H2 = figure(2);
set(H2,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 16: FFT Señal de Salida');

Nivel = 2000;

H  = Filtro_Nivel( x , Nivel );

subplot(2,1,1)
plot(f,abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(f,angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

H3 = figure(3);
set(H3,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Ejercicio 16: Señal en tiempo');

y = ifft(H);

subplot(2,1,1)
plot(t,x);grid on;
title('Señal Original'); xlabel('t [seg]'); ylabel('x(t)');
subplot(2,1,2)
plot(t,y);grid on;
title('Señal de Salida del Filtro'); xlabel('t [seg]');ylabel('y(t)')

%%sound(y,fs);
