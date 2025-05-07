%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

fs = 250;
fc = 50;
tetha = (2*pi*fc)/fs;
aux = 1 - cos(tetha);
NumH = [1/(2*aux) -cos(tetha)/aux 1/(2*aux)];

lim_sup_der_ = (1+cos(tetha))/(1-cos(tetha))
Hz = tf(NumH,1,1/fs)

[H,w] = freqz(NumH,1,512);
%
% pi ----- fs/2
% w/pi-----

H1 = figure(1);
set(H1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 7: Filtro FIR Notch de segundo orden ( N = 2 )  ');

    
subplot(2,1,1)
plot(pi*(w/pi)*(fs/2)/pi,abs(H)); grid on; hold on;
title('Espectro de Magnitud'); xlabel('Frecuencia [ Hz ]'); ylabel('Magnitud');
subplot(2,1,2)
plot(pi*(w/pi)*(fs/2)/pi,angle(H)); grid on; hold on;
title('Espectro de Fase'); xlabel('Frecuencia [ Hz ]'); ylabel('Fase');


Punt = fopen('ecg_nt_Ejercicio_7.txt','r');
x = fscanf(Punt,'%f\n');
fclose(Punt);

H2 = figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 7: Filtro FIR Notch de segundo orden ( N = 2 )  ');

y = filter(NumH,1,x);

subplot(2,1,1)
plot(x); grid on; hold on;
title('Señal de ECG sin filtrar');
subplot(2,1,2)
plot(y); grid on; hold on;
title('Señal de ECG filtrada utilizando un  Filtro FIR');

H3 = figure(3);
set(H3,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Ejercicio 7: Transformada rapida de fourier de la entrada y de la salida');
    
subplot(2,1,1)
plot(abs(fft(x))); grid on; hold on;
title('Señal de ECG sin filtrar');
subplot(2,1,2)
plot(abs(fft(y))); grid on; hold on;
title('Señal de ECG filtrada utilizando un  Filtro FIR');
