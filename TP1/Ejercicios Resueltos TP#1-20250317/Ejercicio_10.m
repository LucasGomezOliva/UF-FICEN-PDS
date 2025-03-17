%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Cambio de bits por muestra en una se�al de audio                        %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingenier�a y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
%%%%% Cargado de la se�al original para 1 canal
[x,fs] = audioread('Audio_TP1_Ej_10.wav');
disp('Frecuencia de muestreo de la se�al de audio [Hz]:')
fs
disp('Longitud de la se�al de audio [muestras]:')
N = length(x)
t=0:1/fs:(N-1)/fs;
Af = fs/N;
f = 0:Af:fs-Af;
M = figure(1);
set(M,'name','PDS. TP#1. Ejercicio 10','position',[50 50 1000 700],'menubar','none');
subplot(2,1,1)
plot(t,x)
xlabel('t [seg]')
ylabel('x(t)')
grid
X=fft(x);
subplot(2,1,2)
plot(f,abs(X))
xlabel('f [Hz]')
ylabel('X(f)')
grid
bits=24;
disp('Escuchando la se�al original (24 bits)...')
sound(x,fs,bits);
fprintf('\n')
disp('Pulse una tecla para continuar...')
pause()
bits=16;
disp('Escuchando la se�al 16 bits...')
sound(x,fs,bits);
fprintf('\n')
disp('Pulse una tecla para continuar...')
pause()
bits=8;
disp('Escuchando la se�al 8 bits...')
sound(x,fs,bits);