%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

L = 512;
fs = 1e3;       % Frecuencia de muestreo del filtro
ts = 1/fs;      %   Periodo de Muestreo
nTs = 0:ts:(L-1)*ts;        % Tiempo discreto

% Ruido blanco Gauseano

mu = 0;
sigma = 120;
ruido = sigma * rand(L,1)';

xk = ruido;   %   Señal de entrada

fp = 60;

wc = 2 * pi * fp;

Nums = wc;
Dens = [1 wc];

disp('Transferencia de filtro RC de primer orden analogico')

Hs = tf(Nums,Dens)

[Numz,Denz] = bilinear(Nums,Dens,fs);

disp('Transferencia de filtro RC con trasnformada bilineal')

Hz = tf(Numz,Denz,ts)

dk = filter(Numz,Denz,xk);

P = 1;   %   Orden de los coeficientes del Numerador
Q = 1;   %   Orden de los coeficientes del Numerador

[ B, A, yk, ek ] = ARMA_Adaptativo( xk', dk' ,P , Q );

disp('Transferencia del filtro adaptativo')

Hz_adap = tf(B',A',ts)

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Señales');
subplot(4,1,1);
plot(nTs,xk); grid on; hold on;
title('Señal de entrada'); ylabel('xk'); xlabel('k');
subplot(4,1,2);
plot(nTs,dk); grid on; hold on;
title('Señal deseada');  ylabel('dk'); xlabel('k');
subplot(4,1,3);
plot(nTs,yk); grid on; hold on;
title('Señal salida filtro adaptativo');  ylabel('yk'); xlabel('k');
subplot(4,1,4);
plot(nTs,ek); grid on; hold on;
title('Señal salida filtro adaptativo');  ylabel('yk'); xlabel('k');

[ H, w ] = freqz(B,A,L,"whole");

H3 = figure(3);
set(H3,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Espectro de magnitud y fase del filtro adaptativo');

subplot(2,1,1)
plot(pi*(w/pi)*(fs/2)/pi,abs(H)); grid on; hold on;
title('Espectro de Magnitud'); xlabel('Frecuencia [ Hz ]'); ylabel('Magnitud');
subplot(2,1,2)
plot(pi*(w/pi)*(fs/2)/pi,angle(H)); grid on; hold on;
title('Espectro de Fase'); xlabel('Frecuencia [ Hz ]'); ylabel('Fase');

