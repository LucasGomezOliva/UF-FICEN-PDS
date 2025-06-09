

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 2b)
%%%
%%% Unidad N� 5. Transformada Ondita
%%%
%%% An�lisis de Se�ales con ventanas de Gabor
%%% 
%%% Se�al de Prueba (Escal�n de energ�a)
%%%
%%% Procesamiento Digital de Se�ales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingenier�a y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
N=512;
T0=4;
fs=N/T0;  % 256 Hz en este caso
Ts=1/fs;
al=1/512;  % Dispersi�n de la ventana de Gabor
t1=0:Ts:1-Ts;
t2=1:Ts:1.1-Ts;
t3=1:Ts:T0-Ts;

f1=zeros(size(t1));
f2=ones(size(t2));
f3=zeros(size(t3));
t=[t1 t2 t3];
f=[f1 f2 f3];  % Pulso rectangular desplazado 
Nd=64; % Cantidad de desplazamientos de la ventana de Gabor

Ejercicio_1(f,fs,al,Nd);   % Llamado a la Transformada de Gabor