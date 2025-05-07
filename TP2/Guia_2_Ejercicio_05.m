%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 2;

a = [ 1 3 5 7 9 8 6 ];


H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 5: Submuestreo de Señales');

subplot(2,1,1);
stem(a,'blue');
title('Señal Original')
grid;
ylabel('x[n]')
xlabel('n[ ]')
%a_subemuestreada = downsample(a,L);
a_subemuestreada = decimate(a,1);
subplot(2,1,2);
stem(a_subemuestreada,'blue');
title('Señal Submuestreada con un factor de L')
grid;
ylabel('x[n]')
xlabel('n[ ]')
