%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 32;

% Primera Ecuacion

A1 = [ 1 0 0.9 ];
B1 = [ 0.3 0.6 0.3 ];

H1 = figure(1);
impz( B1 , A1 , L );
grid;
HH1 = tf( B1 , A1 , -1)

% Segunda Ecuacion

H2 = figure(2);

A2 = [ 1 1.8*cos(pi/16) 0.81 ];

B2 = [ 1 1/2 0 ];

impz( B2 , A2 , L );
grid;
HH2 = tf( B2 , A2 , -1)