%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

%% Primera Ecuacion

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 08: Ecuacion 1');

%
%   H = B/a = Y/X
%

yn = [ 1 0.13 0.52 0.3 ];
xn = [ 0.16 -0.48 0.48  -0.16];

[H,w] = freqz(xn, yn, 512,'whole');

HH = tf( xn , yn , -1)   % Funcion transferencia del filtro

subplot(2,2,1)
plot(w,real(H));grid;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w,imag(H));grid;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w,abs(H));grid;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w,angle(H));grid;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

%zplane(xn,yn)

%% Segunda Ecuacion

H2 = figure(2);
set(H2,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 08: Ecuacion 2');

yn = [ 1 0 -0.268 ];
xn = [ 0.634 0 -0.634 ];

[H,w] = freqz(xn, yn, 512,'whole');

HH = tf( xn , yn , -1)   % Funcion transferencia del filtro

subplot(2,2,1)
plot(w,real(H));grid;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w,imag(H));grid;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w,abs(H));grid;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w,angle(H));grid;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

%% Tercer Ecuacion

H3 = figure(3);
set(H3,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 08: Ecuacion 3');

yn = [ 1 0 0.268 ];
xn = [ 0.634 0 0.634 ];

[H,w] = freqz(xn, yn, 512,'whole');

HH = tf( xn , yn , -1)   % Funcion transferencia del filtro

subplot(2,2,1)
plot(w,real(H));grid;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w,imag(H));grid;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w,abs(H));grid;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w,angle(H));grid;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

%% Cuarta Ecuacion

H4 = figure(4);
set(H4,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 08: Ecuacion 4');

yn = [ 10 -5 1 ];
xn = [ 1 -5 10];

[H,w] = freqz(xn, yn, 512,'whole');

HH = tf( xn , yn , -1)   % Funcion transferencia del filtro

subplot(2,2,1)
plot(w,real(H));grid;
title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
plot(w,imag(H));grid;
title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
subplot(2,2,3)
plot(w,abs(H));grid;
title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
subplot(2,2,4)
plot(w,angle(H));grid;
title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');

%% Graficos

figure(4);
figure(3);
figure(2);
figure(1);
