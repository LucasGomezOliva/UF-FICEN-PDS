%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 5b) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%%  Filtro Pasa Altos FIR con Ventana Hanning
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_5b
% Filtro pasa altos FIR wc=0.75*pi
fs=10000;
figure(1)
fe=3000;
fp=3500;
fc=(fp+fe)/2;        % Frecuencia de Corte
Af=fp-fe;
Aw=2*pi*Af/fs;
N=ceil(11*pi/Aw)+1;		% tamaño del filtro FIR
alfa=(N-1)/2;	% Linealidad de fase
wc=2*pi*fc/fs;  % Angulo de corte
n=0:N-1;
expo=(-1).^n;
hn=(pi-wc)/pi*sinc((pi-wc)*(n-alfa)/pi).*expo;
Wn=blackman(N)';
hn=hn.*Wn;
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. FIR Pasa Altos con Ventana de Hanning');
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