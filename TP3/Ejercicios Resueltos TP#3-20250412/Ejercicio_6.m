%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 6) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%% Filtro Diferenciador
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



function Ejercicio_6
figure(1)
N=40;			% tamaño del filtro FIR
alfa=(N-1)/2;	% Linealidad de fase
n=0:N-1;
expo=(-1).^(n+1);
hn=expo./(pi*pi*(n-alfa).^2); % Integrar H(e^jw)
Wn=blackman(N)';
hn=hn.*Wn;
H=figure(1);
set(H,'position',[50 100 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'FICEN UF. TP#3. FIR Diferenciador con Ventana de Blackman');
subplot(221)
stem(n,hn);
title('Diferenciador h[n]')
grid on,
[H,W]=freqz(hn,1,N,'whole');
W=W;
%f=W*fs/(2*pi);			% Escala de Frecuencia en Hz.
subplot(222)
plot(W,abs(H));
grid on
title('Resp. de Amplitud')
subplot(223)
Hdb=20*log(abs(H));
plot(W,Hdb);
grid on
title('Resp. de Amplitud (dB)')
subplot(224)
plot(W,angle(H));
grid on
title('Resp. de Fase')
grid on
