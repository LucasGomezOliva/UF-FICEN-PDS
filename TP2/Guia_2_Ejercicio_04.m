%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 2;

a = [ 2 5 3 5 9 8 6 4 32 76 ];


H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 4: Sobremuestreo de señales');


subplot(2,1,1);
stem(a,'blue');
title('Señal Original')
grid;
ylabel('x[n]')
xlabel('n[ ]')
%a_sobremuestreada = upsample(a,L);
% decimale
a_sobremuestreada = interp(a,L);
subplot(2,1,2);
stem(a_sobremuestreada,'blue')
title(['Señal Sobremuestreada con un factor de L = ' num2str(L)])
grid;
ylabel('x[n]')
xlabel('n[ ]')