%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Sobremuestreo e Interpolación
%%% 
%%% Verificación de las expresiones brindadas en la teoría
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

Fs=1000;    % Frecuencia de Muestreo original
L=[2 4 8];  % Factores de sobremuestreo
Ts=1/Fs;    % Período de muestreo
N=2048;     % Cantidad de Puntos
n=0:N-1;    % Eje discreto
t=n*Ts;     % Eje de tiempos muestreado
alfa=30;
xa=exp(-alfa*t);    % señal analógica muestreada
Af=Fs/N;
f=0:Af:(N-1)*Af; % Eje de Frecuencias Discretas
w=2*pi*f;        % Eje de Frecuencias Angulares Discretas
Xa=fft(xa);
Xa_desp=fftshift(Xa);
h1=figure(1);
set(h1,'name','Espectros de las señales Sobremuestreadas','position',[10 30 1400 750])
subplot(421)
plot(t,xa)
xlabel('t [s]');
ylabel('xa(t)');
grid on
subplot(422)
plot(f,abs(Xa))
xlabel('f [Hz]');
ylabel('Xa(f)');
grid on
y2=upsample(xa,L(1));
Ts2=Ts/L(1);
t2=Ts2*(0:L(1)*N-1);
y4=upsample(xa,L(2));
Ts4=Ts/L(2);
t4=Ts4*(0:L(2)*N-1);
y8=upsample(xa,L(3));
Ts8=Ts/L(3);
t8=Ts8*(0:L(3)*N-1);
subplot(423)
plot(t2,y2)
xlabel('t [s]')
ylabel('x_2(t)')
grid on
subplot(425)
plot(t4,y4)
xlabel('t [s]')
ylabel('x_4(t)')
grid on
subplot(427)
plot(t8,y8)
xlabel('t [s]')
ylabel('x_8(t)')
grid on
Y2=fft(y2);
f2=1/Ts2;
Af2=f2/(L(1)*N);
ef2=0:Af2:f2-Af2; % Eje de Frecuencias Discretas
H2=zeros(size(ef2));
H2(1:N/2+1)=1;                % Desarrollo del filtro de fase cero
H2(L(1)*N-N/2+1:L(1)*N)=1;
Y4=fft(y4);
f4=1/Ts4;
Af4=f4/(L(2)*N);
ef4=0:Af4:f4-Af4; % Eje de Frecuencias Discretas
H4=zeros(size(ef4));
H4(1:N/2+1)=1;                % Desarrollo del filtro de fase cero
H4(L(2)*N-N/2+1:L(2)*N)=1;
Y8=fft(y8);
f8=1/Ts8;
Af8=f8/(L(3)*N);
ef8=0:Af8:f8-Af8; % Eje de Frecuencias Discretas
H8=zeros(size(ef8));
H8(1:N/2+1)=1;                % Desarrollo del filtro de fase cero
H8(L(3)*N-N/2+1:L(3)*N)=1;
subplot(424)
plot(ef2,abs(Y2),ef2,Y2(1)*H2,'r')
xlabel('f [Hz]')
ylabel('X_2(f)')
grid on
subplot(426)
plot(ef4,abs(Y4),ef4,Y4(1)*H4,'r')
xlabel('f [Hz]')
ylabel('X_4(f)')
grid on
subplot(428)
plot(ef8,abs(Y8),ef8,Y8(1)*H8,'r')
xlabel('f [Hz]')
ylabel('X_8(f)')
grid on
h2=figure(2);
set(h2,'name','Espectros de las señales Interpoladas','position',[50 30 1400 750])
subplot(421)
plot(t,xa)
xlabel('t [s]');
ylabel('xa(t)');
grid on
subplot(422)
plot(f,abs(Xa))
xlabel('f [Hz]');
ylabel('Xa(f)');
grid on
Y2f=L(1)*Y2.*H2;
y2f=ifft(Y2f);
Y4f=L(2)*Y4.*H4;
y4f=ifft(Y4f);
Y8f=L(3)*Y8.*H8;
y8f=ifft(Y8f);
subplot(423)
plot(t2,abs(y2f))
xlabel('t [s]')
ylabel('x_2f(t)')
grid on
subplot(425)
plot(t4,abs(y4f))
xlabel('t [s]')
ylabel('x_4f(t)')
grid on
subplot(427)
plot(t8,abs(y8f))
xlabel('t [s]')
ylabel('x_8f(t)')
grid on
subplot(424)
plot(ef2,abs(Y2f),ef2,Y2f(1)*H2,'r')
xlabel('f [Hz]')
ylabel('X_2(f)')
grid on
subplot(426)
plot(ef4,abs(Y4f),ef4,Y4f(1)*H4,'r')
xlabel('f [Hz]')
ylabel('X_4(f)')
grid on
subplot(428)
plot(ef8,abs(Y8f),ef8,Y8f(1)*H8,'r')
xlabel('f [Hz]')
ylabel('X_8(f)')
grid on
A=[t(N) xa(N)];
A2=[t2(N*L(1)) y2f(N*L(1))];
A4=[t4(N*L(2)) y4f(N*L(2))];
A8=[t8(N*L(3)) y8f(N*L(3))];
%%%%%%%%%%%%%%%%%%%%%% Ahora con instrucciones 
h3=figure(3);
set(h3,'name','Espectros de las señales Interpoladas con Instruciones de MATLAB','position',[90 30 1400 750])
subplot(421)
plot(t,xa)
xlabel('t [s]');
ylabel('xa(t)');
grid on
subplot(422)
plot(f,abs(Xa))
xlabel('f [Hz]');
ylabel('Xa(f)');
grid on
y2fdm=interp(xa,L(1));
Y2fdm=fft(y2fdm);
y4fdm=interp(xa,L(2));
Y4fdm=fft(y4fdm);
y8fdm=interp(xa,L(3));
Y8fdm=fft(y8fdm);
subplot(423)
plot(t2,y2fdm)
xlabel('t [s]')
ylabel('x_2f(t)')
grid on
subplot(425)
plot(t4,y4fdm)
xlabel('t [s]')
ylabel('x_4f(t)')
grid on
subplot(427)
plot(t8,y8fdm)
xlabel('t [s]')
ylabel('x_8f(t)')
grid on
subplot(424)
plot(ef2,abs(Y2fdm))
xlabel('f [Hz]')
ylabel('X_2(f)')
grid on
subplot(426)
plot(ef4,abs(Y4fdm))
xlabel('f [Hz]')
ylabel('X_4(f)')
grid on
subplot(428)
plot(ef8,abs(Y8fdm))
xlabel('f [Hz]')
ylabel('X_8(f)')
grid on