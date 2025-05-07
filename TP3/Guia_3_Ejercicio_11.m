%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas


wc = 2 * pi * 60;

num = wc;
den = [1 wc];

Hs = tf(num,den)

H1 = figure(1);

set(H1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 11: Bode Filtro Analogico de primer Orden');
bode(Hs);grid on;

H2 = figure(2);

set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 11: Espectro en Magnitud y Fase de filtro Digital');
fs = 1e3;
[b,a] = bilinear(num,den,fs);

Htf = tf( b, a ,-1)

[H,w] = freqz(b,a,512,'whole');

subplot(2,1,1)
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

H3 = figure(3);
set(H3,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 11: Entrada y Salida del filtro digital');

Ts = 1/fs;    %   Periodo de Muestreo
nTs = 0:Ts:(512-1)*Ts; % Tiempo discreto

s1 = 2 * sin(2 * pi * 50 * nTs);
s2 = sin(2 * pi * 300 * nTs);

x = s1 + s2;

y = filter(b,a,x);

subplot(2,1,1)
plot(nTs,x);grid on;
title('Señal de Entrada');
subplot(2,1,2)
plot(nTs,y);grid on;
title('Señal de Salida');
