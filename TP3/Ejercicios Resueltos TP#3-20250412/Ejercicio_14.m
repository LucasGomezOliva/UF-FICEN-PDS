%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 7) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%% Filtro pasa Bajos Chevyshev IIR
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_14()

[N,Wn]=cheb1ord(2*pi*500,2*pi*1000,1,45,'s');	% Orden y Frecuencia Natural de Diseño
[B,A]=cheby1(N,1,Wn,'s');
H=tf(B,A)
H1=figure(1);
set(H1,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. Ejercicio 14 Pasa Bajos Chebyshev analógico');
bode(H)
grid
Fs=10000;						% Frecuencia de Muestreo
[Numz,Denz]=bilinear(B,A,Fs);		% Transformada Bilineal para obtener IIR
[Hd,W]=freqz(Numz,Denz);
H2=figure(2);
set(H2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. Ejercicio 14 Pasa Bajos Chevyshev Digital');
F=Fs*W./(2*pi);
subplot(211)
plot(F(1:150),abs(Hd(1:150)));
grid
xlabel('Hz')
ylabel('Hd')
HHd=tf(Numz,Denz,1/Fs)				% Filtro Chevyshev de 5to orden digital
Z=roots(Numz);
P=roots(Denz);
subplot(212)
zplane(Z,P)
grid