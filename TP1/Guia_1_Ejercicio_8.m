%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

% Parámetros de la señal
Ac = 5; % Amplitud de la portadora
Am = 2; % Amplitud de la señal modulante
Fm = 1; % Frecuencia de la señal modulante (Hz)
Fc = 50; % Frecuencia de la portadora (Hz)
t_max = 2; % Tiempo máximo en segundos
N = 1000; % Número de muestras

% Vector de tiempo
t = linspace(0, t_max, N);

x = Ac * ( 1 + ( Am / Ac ) * sin( 2 * pi * Fm * t)) .* cos( 2 * pi * Fc * t);

H1=figure(1);
plot(t, x);

%% Señal Pulso

clc;        %   Consola limpia
clear;      %   Workspace limpio

A = 3;
N = 32;
t0 = 20;
t=0:1:N-1;
x = S_Pulso( A , t0 , N );
H2=figure(2);
set(H2,'name','PDS. TP#1. Ejercicio 8: Señal Pulso');
plot(t,x);
hold on;
stem(t,x);
hold off;
grid;


%% Señal Exponencial

clc;        %   Consola limpia
clear;      %   Workspace limpio

A = 3;
alfa = -0.05;
N = 64;
t0 = 10;

[ t , y ] = S_Exponencial( A , alfa , N , t0 );

H3=figure(3);
set(H3,'name','PDS. TP#1. Ejercicio 8: Señal Exponencial');
plot(t,y);
hold on;
stem(t,y);
hold off;
grid;

%% Funcion Sampling SINC

clc;        %   Consola limpia
clear;      %   Workspace limpio


N=128;
n=-N/2:1:((N/2) - 1);

y = S_Funcion_Sampling_SINC( 0.05 , -20 , n  );

H4=figure(4);

set(H4,'name','PDS. TP#1. Ejercicio 8: Señal Sampling SINC');
plot(n,y);
hold on;
stem(n,y);
hold off;
grid;


%% Funcion Delta

clc;        %   Consola limpia
clear;      %   Workspace limpio


N=128;
n=-N/2:1:((N/2));

[ x , t ] = S_Delta( 20 , 40 , N );

H5=figure(5);

set(H5,'name','PDS. TP#1. Ejercicio 8: Señal Delta de Dirac');
plot(t,x);
hold on;
stem(t,x);
hold off;
grid;

