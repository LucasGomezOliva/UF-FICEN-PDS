%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 256;        %   Longitud de datos
Fs = 2 * 60;    %   Frecuencia de muestreo
Ts = 1/Fs;      %   Periodo de Muestreo
nTs = 0:Ts:( L - 1 ) * Ts;  %   Tiempo discreto

s1 = 10 * sin( 2 * pi * 20 * nTs);

s2 = 20 * cos( 2 * pi * 30 * nTs);

% ruido = rand(1 , length(s1)) * 0.5;

x = s1 + s2;

% Transformada Discreta de Fourier

X = fft(x);

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Transformada Discreta de Fourier');
    
f = (0:L-1)*(Fs/L);  

subplot(2, 1, 1);
plot(f,abs(X)); grid on; 
title('Magnitud de la FFT'); xlabel('n [ ]'); ylabel('Magnitud');

subplot(2, 1, 2);
plot(f,angle(X)); grid on;
title('Fase de la FFT'); xlabel('n [ ])'); ylabel('Fase (radianes)');

%% Filtro Pasa bajos de Fase Cero

H2 = figure(2);
set(H2,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Filtro pasa Bajos de Fase Cero');
    
subplot(2,1,1)
%%stem(nTs,x);
hold on;
plot(nTs,x); grid on;
title('Señal de entrada suma de 2 senoidales')

[ y ] = Filtro_pasa_bajos_fase_cero( x , 58);

figure(2);
subplot(2,1,2)
%%stem(nTs,real(y));
hold on;
plot(nTs,real(y)); grid on;
title('Señal de salida del Filtro pasa Bajos de Fase Cero')

%% Filtro Elimina Banda de Fase Cero


% Filtro Pasa Altos de Fase Cero

x = s1 + s2 ;

H4 = figure(4);
set(H4,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Filtro pasa Altos de Fase Cero');
    
subplot(2,1,1)
%%stem(nTs,x);
hold on;
plot(nTs,x); grid on;
title('Señal de entrada suma de 2 senoidales')

[ y ] = Filtro_pasa_altos_fase_cero( x , 60);

figure(4);
subplot(2,1,2)
%%stem(nTs,real(y));
hold on;
plot(nTs,real(y)); grid on;
title('Señal de salida del Filtro pasa Bajos de Fase Cero')


%% Filtro Pasa Banda de Fase Cero

