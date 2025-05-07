%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 4b) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%% Filtro Pasa Altos FIR con Ventana Rectangular
%%% FIR con su respuesta de frecuencia y fase. Diseño mediante ventana
%%% cuadrada
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function Ejercicio_4b
% Filtro pasa altos FIR wc=0.75*pi
fs=8000;
figure(1)
N=67;			% tamaño del filtro FIR
fc=3000;        % Frecuencia de corte
alfa=(N-1)/2;	% Linealidad de fase
wc=2*pi*fc/fs;
n=0:N-1;
expo=(-1).^n;
hn=(pi-wc)/pi*sinc((pi-wc)*(n-alfa)/pi).*expo;
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. Pasa Altos FIR con Ventana rectangular');
subplot(221)
plot(n,hn);
title('Pasa Altos. h[n]')
grid on
[H,W]=freqz(hn,1,N);
f=W*fs/(2*pi);
subplot(222)
plot(f,abs(H));
grid on
title('Resp. de Amplitud')
subplot(223)
Hdb=20*log(abs(H));
plot(f,Hdb);
grid on
title('Resp. de Amplitud (dB)')
xlabel('f [Hz]')
subplot(224)
plot(f,angle(H));
title('Resp. de Fase')
grid on
xlabel('f [Hz]')