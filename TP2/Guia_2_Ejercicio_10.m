%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

Num = 0.0761 * [ 1 0 -0.7631  0 1 ];
Den = [ 1  0 1.355 0  0.6196 ];

[H,w] = freqz(Num, Den, 512,'whole');

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 10: Ejercicio A ( Filtro Pasa Banda)');

subplot(2,2,1)
plot(w/pi(),real(H));grid; hold on;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w/pi(),imag(H));grid;hold on;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

H2 = figure(2);
set(H2,'NumberTitle','off','name','Ejercicio 10: Ejercicio A ( Filtro Pasa Banda)');

zplane(Num,Den); grid on;

Num = [0.0518 -0.1553 0.1553 0.0518];
Den = [ 1 1.2828 1.0388 0.3418];

[H,w] = freqz(Num, Den, 512,'whole');

H3 = figure(3);
set(H3,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 10: Ejercicio B ( Filtro Pasa Bajos)');

subplot(2,2,1)
plot(w/pi(),real(H));grid; hold on;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w/pi(),imag(H));grid;hold on;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w/pi(),abs(H));grid;hold on;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w/pi(),angle(H));grid;hold on;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

H4 = figure(4);
set(H4,'NumberTitle','off','name','Ejercicio 10: Ejercicio B ( Filtro Pasa Bajos)');

zplane(Num,Den); grid on;

figure(4);
figure(3);
figure(2);
figure(1);
