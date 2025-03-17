%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas


%% Señal Pulso

A = 1;
N = 64;
t0 = 40;
t = 0:1:N-1;
x = S_Pulso( A , t0 , N );
H1 = figure(1);
set(H1,'name','PDS. TP#1. Ejercicio 9: Señal Pulso');
plot(t,x);
hold on;
stem(t,x);
hold off;
grid;

%% Señal Exponencial

A = 12;
alfa = -0.05;
N = 64;
t0 = 10;

[ t , y1 ] = S_Exponencial( A , alfa , N , t0 );

H2 = figure(2);
set(H2,'name','PDS. TP#1. Ejercicio 9: Señal Exponencial');
plot(t,y1);
hold on;
stem(t,y1);
hold off;
grid;

%% Convolucion Discreta

H3 = figure(3);

y3 = conv(y1,x);

t = 0:1:(2*N-2);
set(H3,'name','PDS. TP#1. Ejercicio 9: Convolucion');
plot(t,y3);
hold on;
stem(t,y3);
hold off;
grid;
