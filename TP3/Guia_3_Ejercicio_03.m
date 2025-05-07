%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas


A = [ 0.3639 0 0 ; 1.3639 0.5111 -0.8580 ; 0 0.8580 0]

B = [ 1 1 0]'

C = [ 1.3629 0.6019 0.3074]

D = 1

[b , a] = ss2tf(A,B,C,D);

Hz = tf( b, a ,-1)

% Polos de la Funcion Transferencia

Polos = pole(Hz)

% Autovalores de la matriz A

Autovalores = eig(A)

%Diagrama de Polos y ceros

pzmap(Hz);grid on;

%% Respuesta del sistema utilizando una version truncada de la respuesta al impulso

n_max = 50;

[h , n] = impz(b,a,n_max + 1);

nx = size(A,1);           % Número de estados
x = zeros(nx, n_max+1);    % Estados
u = [1, zeros(1, n_max)];  % Entrada impulso

for k = 1:n_max
    x(:,k+1) = A * x(:,k) + B * u(k);
    y1(k) = C * x(:,k) + D * u(k);
end

subplot(2,1,1);
stem(y1);grid on;
title('Salida del sistema obtenia del modelo de estado con N = 0:50')

%% Respuesta Utilizando el comando filter 

x2(1) = 1;
x2(2:1:50) = 0;
y2 = filter(b,a,x2);
% [h,t] = impz(b,a,50); respuesta al impulso utilizando el comando impz
subplot(2,1,2)
stem(y2);grid on;
title('Salida del sistema obtenia con el comando filter')

