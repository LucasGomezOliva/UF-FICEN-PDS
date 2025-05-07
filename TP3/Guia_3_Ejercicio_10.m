%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas


wc = 2 * pi * 60;

num = [wc];
den = [1 wc];
Hs = tf(num,den)

H1 = figure(1);
bode(Hs);grid on;

H2 = figure(2);

fs = 1e3;

[b,a] = bilinear(num,den,fs)

Htf = tf( b, a ,-1)

[H,w] = freqz(b,a,512,'whole');

subplot(2,1,1)
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');
