%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

%% Primera Ecuacion

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 09');

%
%   H = B/a = Y/X
%

r = [ .75 .40 .80];
colors = ['r' 'b' 'g']
th = [ pi/3 45 90 120];

H1 = figure(1);
set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 09: Valor Fijo de theta r variable');

for i=1:length(r)
    Num = [ 1 ]
    Den = [ 1 -2.*r(i).*cos(th(1)) r(i).^2]
    [H,w] = freqz(Num, Den, 512,'whole');
    subplot(2,2,1)
    plot(w/pi(),real(H),'color',colors(i));grid; hold on;
    title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud');
    subplot(2,2,2)
    plot(w/pi(),imag(H),'color',colors(i));grid;hold on;
    title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
    subplot(2,2,3)
    plot(w/pi(),abs(H),'color',colors(i));grid;hold on;
    title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
    subplot(2,2,4)
    plot(w/pi(),angle(H),'color',colors(i));grid;hold on;
    title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');
end

H2 = figure(2);
set(H2,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name','Ejercicio 09: Valor Fijo de R y ang variable');

for i=1:length(r)
    Num = [ 1 ]
    Den = [ 1 -2.*r(2).*cos(th(i)) r(2).^2]
    [H,w] = freqz(Num, Den, 512,'whole');
    subplot(2,2,1)
    plot(w/pi(),real(H),'color',colors(i));grid; hold on;
    title('Parte Real'); xlabel('omega [rad]'); ylabel('Amplitud')
    subplot(2,2,2)
    plot(w/pi(),imag(H),'color',colors(i));grid;hold on;
    title('Parte Imaginaria'); xlabel('omega [rad]'); ylabel('Amplitud');
    subplot(2,2,3)
    plot(w/pi(),abs(H),'color',colors(i));grid;hold on;
    title('Espectro de Magnitud'); xlabel('omega [rad]'); ylabel('Magnitud');
    subplot(2,2,4)
    plot(w/pi(),angle(H),'color',colors(i));grid;hold on;
    title('Espectro de Fase'); xlabel('omega [rad]'); ylabel('Fase, radianes');
end
