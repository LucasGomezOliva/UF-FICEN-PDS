%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 5a) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%%  Filtro Pasa Bajos FIR con Ventana Hamming
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_5a
%%%%%%%%%%%%% (1) %%%%%%%%%%%%%%%%%%
% Filtro pasabajos FIR wc=0.3*pi
fs=8000;
figure(1)
fp=1000;
fe=1400;
fc=(fp+fe)/2;        % Frecuencia de Corte
Af=fe-fp;
Aw=2*pi*Af/fs; % Delta W en radianes
N=ceil(6.6*pi/Aw)+1;			% tamaño del filtro FIR
alfa=(N-1)/2;	% Linealidad de fase
wc=2*pi*fc/fs;  % Angulo de corte
n=0:N-1;
hn=wc/pi*sinc(wc*(n-alfa)/pi);% Respuesta al Impluso del Filtro
Wn=hamming(N)';
hn=hn.*Wn;
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. FIR Pasa Bajos con Ventana de Hamming');
subplot(221)
plot(n,hn);
title('Pasa Bajos. h[n]')
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
title('Resp. de Fase')
grid on
xlabel('f [Hz]')
