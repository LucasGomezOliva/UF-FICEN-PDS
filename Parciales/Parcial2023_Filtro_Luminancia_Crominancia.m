
clear
close all 
clc

% Parámetros de la señal
Fs = 1000;            % Frecuencia de muestreo en Hz
T = 1/Fs;             % Periodo de muestreo
L = 1000;             % Longitud de la señal
nTS = (0:L-1)*T;      % Vector de tiempo

% Señal de entrada con dos componentes:
% - Luminancia: baja frecuencia (20 Hz)
% - Crominancia: alta frecuencia (200 Hz)
r = cos(2*pi*20*nTS) + 0.5*cos(2*pi*200*nTS);

M = 25;

%   Filtro H0
b0(1) = 1;
b0(M+1) = 1;
a0 = 2;

%   Filtro H1
b1(1) = 1;
b1(M+1) = -1;
a1 = 2;

[H0,w0] = freqz(b0,a0,512,"whole");
[H1,w1] = freqz(b1,a1,512,"whole");

g0 = filter(b0,a0,r);   %   Luminancia
g1 = filter(b1,a1,r);   %   Crominancia

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro de Luminancia');
subplot(4,1,1);
plot(w0/(pi),abs(H0))
grid on;
title('Respuesta en amplitud')
subplot(4,1,2);
plot(w0/pi,angle(H0))
grid on;
title('Respuesta en fase')
subplot(4,1,3)
plot(nTS,r);
grid on;
title('Señal de entrada');
subplot(4,1,4)
plot(nTS,g0);
grid on;
title('Señal de salida del filtro');

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro de Crominancia');
subplot(4,1,1);
plot(w1/(pi),abs(H1))
grid on;
title('Respuesta en amplitud')
subplot(4,1,2);
plot(w1/pi,angle(H1))
grid on;
title('Respuesta en fase')
subplot(4,1,3)
plot(nTS,r);
grid on;
title('Señal de entrada');
subplot(4,1,4)
plot(nTS,g1);
grid on;
title('Señal de salida del filtro');
