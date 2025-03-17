%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Generaci�n de se�al senoidal discreta a partir de su �ngulo discreto    %
% w0=2*pi*P/N o bien w0=2*pi*f/Fs, fase inicial, inicio, fin de secuencia %
% y amplitud m�xima                                                       %
%                                                                         %
% Sintaxis:                                                               %
%                                                                         %
% function x = Ejercicio_3(A,N1,N2,w0,Tita)                               %
%                                                                         %
%      A = Amplitud pico de las se�ales                                   %
%      N1,N2= Inicio y fin de las se�ales                                 %
%      Tita = fase inicial (en radianes)                                  %
%      w0 = Angulo Discreto (entre 0 y pi)                                %
%      x = Se�al de salida                                                %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingenier�a y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function x = Ejercicio_3(A,N1,N2,w0,Tita)

if nargin < 5 
    A = 3;
    N1 = 0;
    N2 = 25;
    w0 = pi/17;
    Tita = 0;
end
n = N1:N2;
x = A*cos(w0*n+Tita); % Senoidal discreta
H = figure(1);
set(H,'name','PDS. TP#1. Ejercicio 3','position',[20 50 1200 700],'menubar','none');
h = stem(n,x,'r');
grid
set(h,'LineWidth',0.75);
ylabel('x[n]');
xlabel('n [ ]');