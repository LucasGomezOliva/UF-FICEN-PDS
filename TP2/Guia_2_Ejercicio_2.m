%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

% Definir la señal
a = [1 3 5 7 5 3 1];

N = length(a)

n0 = -4;

% Calcular la FFT de la señal
fft_a = fft(a);

H1 = figure(1);

subplot(3,2,1)
stem(a)
title('Señal Original en tiempo discreto')
grid;

subplot(3,2,2)
stem(real(fft_a));
title('Señal Original en frecuencia discreta')
grid;

subplot(3,2,3)
a_desp = circshift(a',n0);
stem(a_desp)
title('Señal Desplazada en tiempo discreto')
grid;

fft_a_adesp = fft(a_desp);
subplot(3,2,4)
stem(real(fft_a_adesp));
title('Señal Original desplazada en tiempo discreto en frecuencia discreta')
grid;

subplot(3,2,6)
fft_a_desplazada = fft_a .* exp((1i*2*pi()*4*(0:1:(N-1)))/N);
stem(real(fft_a_desplazada));
title('Señal desplazada en frecuencia discreta')
grid;

subplot(3,2,5)
stem(real(ifft(fft_a_desplazada)));
title('Señal desplazada en frecuencia discreta')
grid;