%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Submuestreo y Decimación
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

Fs=1000;
L=[2 4 8];
Ts=1/Fs;
N=2048;     % Cantidad de Puntos
n=0:N-1;    % Eje discreto
t=n*Ts;     % Eje de tiempos muestreado
alfa=50;
xa=exp(-alfa*t);    % señal analógica muestreada
Af=Fs/N;
f=0:Af:(N-1)*Af; % Eje de Frecuancias Discretas
w=2*pi*f;        % Eje de Frecuencias Angulares Discretas
Xa=fft(xa);
Xa_desp=fftshift(Xa);
h1=figure(1);
set(h1,'name','Espectros de las señales Submuestreadas','position',[10 30 1400 750])
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
y2=downsample(xa,L(1));
Ts2=Ts*L(1);
t2=Ts2*(0:N/L(1)-1);
y4=downsample(xa,L(2));
Ts4=Ts*L(2);
t4=Ts4*(0:N/L(2)-1);
y8=downsample(xa,L(3));
Ts8=Ts*L(3);
t8=Ts8*(0:N/L(3)-1);
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
Af2=f2/(N/L(1));
ef2=0:Af2:f2-Af2; % Eje de Frecuencias Discretas
H2=zeros(size(f));
H2(1:N/(2*L(1))+1)=1;                % Desarrollo del filtro de fase cero
H2(N-N/(2*L(1))+1:N)=1;
Y4=fft(y4);
f4=1/Ts4;
Af4=f4/(N/L(2));
ef4=0:Af4:f4-Af4; % Eje de Freuencias Discretas
H4=zeros(size(f));
H4(1:N/(2*L(2))+1)=1;                % Desarrollo del filtro de fase cero
H4(N-N/(2*L(2))+1:N)=1;
Y8=fft(y8);
f8=1/Ts8;
Af8=f8/(N/L(3));
ef8=0:Af8:f8-Af8; % Eje de Frecucencias Discretas
H8=zeros(size(f));
H8(1:N/(2*L(3))+1)=1;                % Desarrollo del filtro de fase cero
H8(N-N/(2*L(3))+1:N)=1;
subplot(424)
plot(ef2,abs(Y2))
xlabel('f [Hz]')
ylabel('X_2(f)')
grid on
subplot(426)
plot(ef4,abs(Y4))
xlabel('f [Hz]')
ylabel('X_4(f)')
grid on
subplot(428)
plot(ef8,abs(Y8))
xlabel('f [Hz]')
ylabel('X_8(f)')
grid on
h2=figure(2);
set(h2,'name','Espectros de las señales Decimadas','position',[50 30 1400 750])
subplot(421)
plot(t,xa)
xlabel('t [s]');
ylabel('xa(t)');
grid on
subplot(422)
plot(f,abs(Xa),f,Xa(1)*H2,'r',f,Xa(1)*H4,'g',f,Xa(1)*H8,'m')
xlabel('f [Hz]');
ylabel('Xa(f)');
grid on
Y2f=Xa.*H2;
y2f=abs(ifft(Y2f));
y2fd=downsample(y2f,L(1));
Y2fd=fft(y2fd);
Y4f=Xa.*H4;
y4f=abs(ifft(Y4f));
y4fd=downsample(y4f,L(2));
Y4fd=fft(y4fd);
Y8f=Xa.*H8;
y8f=abs(ifft(Y8f));
y8fd=downsample(y8f,L(3));
Y8fd=fft(y8fd);
subplot(423)
plot(t2,y2fd)
xlabel('t [s]')
ylabel('x_2f(t)')
grid on
subplot(425)
plot(t4,y4fd)
xlabel('t [s]')
ylabel('x_4f(t)')
grid on
subplot(427)
plot(t8,y8fd)
xlabel('t [s]')
ylabel('x_8f(t)')
grid on
subplot(424)
plot(ef2,abs(Y2fd))
xlabel('f [Hz]')
ylabel('X_2(f)')
grid on
subplot(426)
plot(ef4,abs(Y4fd))
xlabel('f [Hz]')
ylabel('X_4(f)')
grid on
subplot(428)
plot(ef8,abs(Y8fd))
xlabel('f [Hz]')
ylabel('X_8(f)')
grid on
%%%%%%%%%%%%%%%%%%%%%% Ahora con instrucciones 
h3=figure(3);
set(h3,'name','Espectros de las señales Decimadas con Instruciones de MATLAB','position',[90 30 1400 750])
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
y2fdm=decimate(xa,L(1));
Y2fdm=fft(y2fdm);
y4fdm=decimate(xa,L(2));
Y4fdm=fft(y4fdm);
y8fdm=decimate(xa,L(3));
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

