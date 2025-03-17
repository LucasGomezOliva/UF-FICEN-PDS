%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Funci�n dedicada al grafico de se�ales individuales.                    %
%                                                                         %
% Sintaxis:                                                               %
%                                                                         %
%  Grafica(x,Lx,Ly,Ti)                                                    %
%                                                                         %
%       x: Se�al a graficar                                               %
%       Lx: T�tulo del eje x                                              %
%       Ly: T�tulo del eje y                                              %
%       Ti: T�ulo de la ventana gr�fica                                   % 
%                                                                         %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingenier�a y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Grafica(x,Lx,Ly,Ti)

M = figure(1);
set(M,'NumberTitle','off','name',...
    strcat('Ejercicio N�8. S�ntesis de Se�al:',Ti),...
    'position',[20 50 1000 650],'menubar','none');
n = 0:length(x)-1;
maxx = max(n);
miny = min(x);
maxy = max(x);

h = plot(n,x);
xlabel(Lx)
ylabel(Ly)
axis([0 maxx miny maxy]);
grid
set(h,'LineWidth',1.5);