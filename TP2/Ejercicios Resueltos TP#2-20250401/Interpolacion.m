%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Ejemplo Global Interpolaci�n
%%%
%%% Procesamiento Digital de Se�ales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% FRBA
%%% Universidad Tecnol�gica Nacional
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

Ts = 0.001;
T0 = 0.35;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
f0 = (0:N-1)*Fs/N;
t2 = 0:Ts/2:T0-Ts/2;
N2 = length(t2);
f2 = (0:N2-1)*2*Fs/N2;
t4 = 0:Ts/4:T0-Ts/4;
N4 = length(t4);
f4 = (0:N4-1)*4*Fs/N4;
t8 = 0:Ts/8:T0-Ts/8;
N8 = length(t8);
f8 = (0:N8-1)*8*Fs/N8;
x = sin(2*pi*30*t0) + sin(2*pi*60*t0);
X = fft(x);
y2u = upsample(x,2);
Y2u = fft(y2u);
y2 = interp(x,2);
y4u = upsample(x,4);
Y4u = fft(y4u);
y4 = interp(x,4);
y8u = upsample(x,8);
Y8u = fft(y8u);
y8 = interp(x,8);

H1=figure(1);
set(H1,'name','Se�al sobremuestreada con L=2, 4 y 8','position',[10 20 1450 800],...
    'menubar','none');
subplot(4,1,1)
stem(t0(1:35),x(1:35),'r','filled')
subplot(4,1,2)
stem(t2(1:35*2),y2u(1:35*2),'b')
ylabel('L=2')
hold on
stem(t0(1:35),x(1:35),'r','filled')
hold off
subplot(4,1,3)
stem(t4(1:35*4),y4u(1:35*4),'b')
ylabel('L=4')
hold on
stem(t0(1:35),x(1:35),'r','filled')
hold off
subplot(4,1,4)
stem(t8(1:35*8),y8u(1:35*8),'b')
xlabel('t (s)')
ylabel('L=8')
hold on
stem(t0(1:35),x(1:35),'r','filled')
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
ylabel('L=2')
subplot(4,1,3)
stem(f4,abs(Y4u),'b')
ylabel('L=4')
subplot(4,1,4)
stem(f8,abs(Y8u),'b')
ylabel('L=8')
xlabel('f (Hz)')
disp('Presione cualquier tecla para continuar...')
pause;

H3=figure(3);
set(H3,'name','Se�al Interpolada con L=2, 4 y 8','position',[90 20 1450 800],...
    'menubar','none');
subplot(4,1,1)
stem(t0(1:35),x(1:35),'r','filled')
subplot(4,1,2)
stem(t2(1:35*2),y2(1:35*2),'b')
ylabel('L=2')
hold on
stem(t0(1:35),x(1:35),'r','filled')
hold off
subplot(4,1,3)
stem(t4(1:35*4),y4(1:35*4),'b')
ylabel('L=4')
hold on
stem(t0(1:35),x(1:35),'r','filled')
hold off
subplot(4,1,4)
stem(t8(1:35*8),y8(1:35*8),'b')
ylabel('L=8')
xlabel('t (s)')
hold on
stem(t0(1:35),x(1:35),'r','filled')
hold off