%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% C�lculo de la Transformada Ondita Discreta
%%%
%%% function [Mat,L,Coef]=DWT_FMP_Ejer_13(s,lp,Niv)
%%%
%%% Par�metros de Entrada:
%%%
%%%    s:   Se�al a Transformar
%%%    lp:  FPBj de Reconstrucci�n
%%%    Niv: Nivel de descomposici�n
%%%
%%% Par�metros de Salida:
%%%
%%%    Mat: Matriz con el siguiente contenido:
%%%         Fila1:       Coef Det 1
%%%         Fila2:       Coef Det 2
%%%            :             :
%%%         FilaNivel:   Coef Det Nivel
%%%         FilaNivel+1: Coef App Nivel
%%%    L: Vector conteniendo la longitud de los coef de det y app
%%%         L(1):       Long Coef Det 1
%%%         L(2):       Long Coef Det 2
%%%           :                :
%%%         L(Nivel):   Long Coef Det Nivel
%%%         L(Nivel+1): Long Coef App Nivel
%%%    Coef: Vector con concatenaci�n de Coef (como MatLab)
%%%    Coef=[Coef_Det_1|Coef_Det_2| ... |Coef_Det_Nivel||Coef_App_Nivel]
%%%
%%% IMPORTANTE:
%%% hp, filtro pasa bajos de reconstrucci�n, no tiene que estar
%%% normalizado, ya que dentro de esta rutina se realiza el escalamiento de
%%% los filtros por sqrt(2) para el escalamiento de energ�as
%%%
%%% Versi�n Propia del comando MatLab wavedec
%%%
%%% Procesamiento Digital de Se�ales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingenier�a y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Mat,L,Coef]=DWT_FMP_Ejer_13(s,lp,Niv)

if nargin<3
    Niv=1;
end
N=length(lp); % Longitud de los filtros de descomposici�n y an�lisis
V=floor(log2(length(s)));
if Niv>V
    disp('No puede haber mas niveles que log2(longitud se�al). Ingrese menos niveles');
    return;
end
n=0:N-1;
l=lp(N-n);  % Filtro Pasa Bajos de descomposici�n
hp=(-1).^n.*l; % Filtro Pasa Altos de reconstrucci�n
h=hp(N-n); % Filtro Pasa Altos de Descomposici�n
Mat=zeros(Niv+1,floor((length(s)+length(h)-1)/2)); % Matriz que contiene coeficientes de detalles y aproximaci�n
L=zeros(1,Niv+1); % Vector que contiene las longitudes de los coeficientes de detalle y aproximaci�n
Coef=zeros(1,length(s)); % Vector que contiene los coeficientes de detalle y aproximaci�n
CA_i=s; % Coeficiente de aproximaci�n de Nivel 0 (la se�al de entrada)
for k=1:Niv
    CD_i=dyaddown(conv(CA_i,h/sqrt(2)));  % Coeficiente de detalle i-�simo. El submuestreo deja los componentes impares
    CA_i=dyaddown(conv(CA_i,l/sqrt(2)));  % Coeficiente de aproximaci�n i-�simo. Con downsample se dejan las impares
    L(k)=length(CD_i);
    Coef(1+sum(L(1:k-1)):sum(L(1:k)))=CD_i;
    Mat(k,1:length(CD_i))=CD_i;
    if k==Niv
        L(k+1)=length(CA_i);
        Coef(1+sum(L(1:k)):sum(L(1:k+1)))=CA_i;
        Mat(k+1,1:length(CA_i))=CA_i;
    end    
end
% [C,Long]=wavedec(s,Niv,'haar');