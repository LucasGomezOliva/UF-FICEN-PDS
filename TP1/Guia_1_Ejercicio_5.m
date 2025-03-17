%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

A = [1 0.7 -0.45 -0.6]

B = [0.8 -0.44 0.16 0.02]

L = 128;

impz( B , A , L )
grid;

H = tf( B , A , -1)