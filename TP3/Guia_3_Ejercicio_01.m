%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas


a = [1 -.8741 .9217 -.2672]

b = [ .1866 .2036 .2036 .1866]

[A,B,C,D] = tf2ss (b,a)

Htf = tf( b, a ,-1)

[H,w] = freqz(b,a,512,'whole');

subplot(2,1,1)
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');