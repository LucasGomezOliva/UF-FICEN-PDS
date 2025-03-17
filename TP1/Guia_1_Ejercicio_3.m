%% Inicio Limpio

clc;        % Consola limpia
clear;      % Workspace limpio
close all;  % Cierra otras ventanas

%   Primer senoidal

A  = 3; 
NI = 0;
NF = 25;
W0 = pi/17;
TITA = 0;
H1 = figure (1);
X = Senoidal_Discreta( A , NI , NF , W0 , TITA );

%   Segunda senoidal

A  = 3; 
NI = -15;
NF = 25;
W0 = pi/17;
TITA = 0;
H2 = figure (2);
X = Senoidal_Discreta( A , NI , NF , W0 , TITA );

%   Tercera senoidal

A  = 5; 
NI = -10;
NF = 10;
W0 = 3*pi;
TITA = pi/2;
H3 = figure (3);
X = Senoidal_Discreta( A , NI , NF , W0 , TITA );

%   Cuarta senoidal

A  = 1; 
NI = 0;
NF = 50;
W0 = pi/sqrt(23);
TITA = pi/2;
H4 = figure (4);
X = Senoidal_Discreta( A , NI , NF , W0 , TITA );
