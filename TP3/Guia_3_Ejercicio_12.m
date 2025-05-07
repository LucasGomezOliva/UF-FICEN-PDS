%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

w0 = 2 * pi * 50;
Q0 = 100;

nums = [ 1 0 w0^2];

dens = [ 1 w0/Q0 w0^2];

Hs = tf(nums , dens)

H1 = figure(1);
set(H1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 12: Bode Filtro Notch Analogico');
bode(Hs); grid on;

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 12: Respuesta en Magnitd y en Fase del Filtro Notch Digital');
fs = 1e3;
[b,a] = bilinear(nums,dens,fs);
Htf = tf( b, a ,-1)
[H,w] = freqz(b,a,512,'whole');
subplot(2,1,1);
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2);
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

