%% Inicio Limpio

clc;        %   Consola limpia
clear;      %   Workspace limpio
close all;  %   Cierra otras ventanas

L = 128;

H2 = figure(2);

A2 = [ 1 1.8*cos(pi/16) 0.81 ];

B2 = [ 1 1/2 0 ];

impz( B2 , A2 , L );
grid;
HH2 = tf( B2 , A2 , -1)

z = tf('z',-1);

x = z/(z-1)

y = HH2 * x

% 
% y =
%  
%             z^3 + 0.5 z^2
%   ----------------------------------
%   z^3 + 0.7654 z^2 - 0.9554 z - 0.81

syms z k
F = ( z ^3 + 0.5*z^2)/(z^3+0.7654*z^2 - 0.9554*z - 0.81);
g=iztrans(F)
gn = double( subs(g, sym('k'), k) );
stem(gn, k)