clear 
close all
clc


L = 100;

fs = 40;

Ts = 1/fs;

fo = 2;

n = 0:1:L-1;

x1 = 2 * sin(2*pi*fo/fs*n);

P = 5;

L=100;

N = 0:1:L-1;

x2 = 2 * sin(2*pi*P/L*N);

figure(1);
subplot(2,1,1)
plot(n,x1);
grid on;
subplot(2,1,2)
plot(N,x2);
grid on;

figure(2);
X1 = fft(x1);

w = 0:2*pi/L:2*pi*(1-1/L);

subplot(2,1,1)
plot(w/pi,abs(X1));
grid on;
X2 = fft(x2);
subplot(2,1,2)
plot(abs(X2));
grid on;


