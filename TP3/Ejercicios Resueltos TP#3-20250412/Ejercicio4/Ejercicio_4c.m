%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 4c) de la Guía_3 PDS FICEN UF
%%%
%%% Unidad N° 3
%%%
%%% Filtro Pasa Banda con Ventana Rectangular
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

function Ejercicio_4c
% Filtro FIR Pasa Banda f1=1 KHz y f2=2 KHz
fs=8000;
figure(1)
N=67;			% tamaño del filtro FIR
fc1=1000;       % Frecuencia de corte inferior
fc2=2000;       % Frecuencia de corte superior
alfa=(N-1)/2;	% Linealidad de fase
w1=2*pi*fc1/fs;
w2=2*pi*fc2/fs;
n=0:N-1;
hn=w2/pi*sinc(w2*(n-alfa)/pi)-w1/pi*sinc(w1*(n-alfa)/pi);
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. Pasa Banda FIR con Ventana rectangular');
subplot(221)
plot(n,hn);
title('Pasa Banda. H[n]')
grid on
[H,W]=freqz(hn,1,N);
f=W*fs/(2*pi);			% Escala de Frecuencia en Hz.
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
grid on
title('Resp. de Fase')
grid on
xlabel('f [Hz]')