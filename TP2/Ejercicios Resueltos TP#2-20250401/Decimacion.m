%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Ejemplo Global Decimación
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% FRBA
%%% Universidad Tecnológica Nacional
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
f0 = (0:N-1)*Fs/N;
N2 = N/2;
t2 = (0:N2-1)*2*Ts;
f2 = (0:N2-1)*Fs/N2/2;
N4 = N2/2;
t4 = (0:N4-1)*4*Ts;
f4 = (0:N4-1)*Fs/N4/4;
N8 = ceil(N4/2);
t8 = (0:N8-1)*8*Ts;
f8 = (0:N8-1)*Fs/N8/8;
x = sin(2*pi*30*t0) + sin(2*pi*60*t0);
X = fft(x);
y2u = downsample(x,2);
Y2u = fft(y2u);
y2 = decimate(x,2);
y4u = downsample(x,4);
Y4u = fft(y4u);
y4 = decimate(x,4);
y8u = downsample(x,8);
Y8u = fft(y8u);
y8 = decimate(x,8);

H1=figure(1);
set(H1,'name','Señal submuestreada con M=2, 4 y 8','position',[10 20 1450 800],...
    'menubar','none');
subplot(4,1,1)
stem(t0(1:70),x(1:70),'r')
subplot(4,1,2)
stem(t0(1:70),x(1:70),'r')
ylabel('M=2')
hold on
stem(t2(1:round(70/2)),y2u(1:round(70/2)),'b','filled')
hold off
subplot(4,1,3)
stem(t0(1:70),x(1:70),'r')
ylabel('M=4')
hold on
stem(t4(1:round(70/4)),y4u(1:round(70/4)),'b','filled')
hold off
subplot(4,1,4)
stem(t0(1:70),x(1:70),'r')
xlabel('t (s)')
ylabel('M=8')
hold on
stem(t8(1:round(70/8)),y8u(1:round(70/8)),'b','filled')
hold off
disp('Presione cualquier tecla para continuar...')
pause;

H2=figure(2);
set(H2,'name','Espectros de Fourier con L=2, 4 y 8','position',[50 20 1450 800],...
    'menubar','none');
subplot(4,1,1)
stem(f0,abs(X),'r','filled')
subplot(4,1,2)
stem(f2,abs(Y2u),'b')
ylabel('M=2')
subplot(4,1,3)
stem(f4,abs(Y4u),'b')
ylabel('M=4')
subplot(4,1,4)
stem(f8,abs(Y8u),'b')
ylabel('M=8')
xlabel('f (Hz)')
disp('Presione cualquier tecla para continuar...')
pause;

H3=figure(3);
set(H3,'name','Señal Decimada con L=2, 4 y 8','position',[90 20 1450 800],...
    'menubar','none');
subplot(4,1,1)
stem(t0(1:70),x(1:70),'r')
subplot(4,1,2)
stem(t2(1:round(70/2)),y2(1:round(70/2)),'b','filled')
ylabel('M=2')
hold on
stem(t0(1:70),x(1:70),'r')
hold off
subplot(4,1,3)
stem(t4(1:round(70/4)),y4(1:round(70/4)),'b','filled')
ylabel('M=4')
hold on
stem(t0(1:70),x(1:70),'r')
hold off
subplot(4,1,4)
stem(t8(1:round(70/8)),y8(1:round(70/8)),'b','filled')
ylabel('M=8')
xlabel('t (s)')
hold on
stem(t0(1:70),x(1:70),'r')
hold off