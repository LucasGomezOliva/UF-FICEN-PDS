%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 5c) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%%   Filtro Pasa Banda FIR con Ventana Blackman
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_5c
% Filtro FIR Pasa Banda f1=1 KHz y f2=2 KHz
fs=8000;
figure(1)
fe1=600;
fp1=1000;
fp2=2000;
fe2=2600;
fc1=(fe1+fp1)/2;        % Frecuencia de Corte inferior
fc2=(fe2+fp2)/2;        % Frecuencia de Corte inferior
Af1=fp1-fe1;
Af2=fe2-fp2;
Af=min([Af1 Af2]);
Aw=2*pi*Af/fs;
N=ceil(11*pi/Aw)+1;		% tamaño del filtro FIR
alfa=(N-1)/2;	% Linealidad de fase
n=0:N-1;
w1=2*pi*fc1/fs;
w2=2*pi*fc2/fs;
hn=w2/pi*sinc(w2*(n-alfa)/pi)-w1/pi*sinc(w1*(n-alfa)/pi);
Wn=blackman(N)';
hn=hn.*Wn;
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. FIR Pasa Banda con Ventana de Blackman');
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