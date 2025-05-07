%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

Wp = 500 * 2 * pi;  %%  Wp: frecuencia de borde de banda de paso
Ws = 1e3 * 2 * pi;  %%  Ws: frecuencia de banda de parada del filtro
Rp = 1;             %%  Rp: dB de ondulación de banda de p´{aso 
Rs = 45;            %%  Rs: dB de atenuación en la banda de parada

[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs,'s');

[Nums,Dens] = cheby1(n,Rp,Wp,'s');

Hs = tf(Nums,Dens)

H1 = figure(1);
set(H1,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 13: Filtro Pasa Bajos Chebyshev Analogico');
    
bode(Hs); grid on; hold on;

fs = 10e3;          %% Frecuencia de muestreo
ts = 1/fs;          %% Periodo de muestreo

[Numz,Denz] = bilinear(Nums,Dens,fs);

Hz = tf(Numz,Denz,ts)

[H,w] = freqz(Numz,Denz,512,'whole');

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 13: Filtro Pasa Bajos Chebyshev IIR ');
    
subplot(2,1,1)
plot(w/pi(),abs(H)); grid on; hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,1,2)
plot(w/pi(),angle(H)); grid on; hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase');