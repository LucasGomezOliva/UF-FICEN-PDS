%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio Nro. 2a),b) y c) de la Guía_3
%%%
%%% Unidad N° 3
%%%
%%% Análisis de Filtros con polos y ceros y distintas entradas
%%% cálculo de h[n]
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

function [B,A,y1,y2,y3]=Ejercicio_2abc(Z,P,b0)

[B,A]=zp2tf(Z,P,b0); % Descripción mediante polos y ceros a Transferencia

N=100;
n=0:N-1;
x1=ones(1,length(n));
x2=cos(pi*n);
x3=cos(pi*n/2);
y1=filter(B,A,x1);
y2=filter(B,A,x2);
y3=filter(B,A,x3);

y4=zeros(size(n));
y4(4:length(n))=0.9.^(n(4:length(n))-3); 
x4=filter(A,B,y4);

Ha=figure(1);
set(Ha,'NumberTitle','off','Menubar','none','name','Ejercicio#2 TP#3. PDS FICEN','position',[20 30 1000 700]);
% Graficado de la Respuesta en Frecuencia
subplot(3,2,1)
stem(n,x1);
grid
xlabel('n []');
ylabel('x1[n]')
subplot(3,2,2)
stem(n,y1);
grid
xlabel('n []');
ylabel('y1[n]')
subplot(3,2,3)
stem(n,x2);
grid
xlabel('n []');
ylabel('x2[n]')
subplot(3,2,4)
stem(n,y2);
grid
xlabel('n []');
ylabel('y2[n]')
subplot(3,2,5)
stem(n,x3);
grid
xlabel('n []');
ylabel('x3[n]')
subplot(3,2,6)
stem(n,y3);
grid
xlabel('n []');
ylabel('y3[n]')

[H,w]=freqz(B,A,'whole',512);

Hb=figure(2);
set(Hb,'NumberTitle','off','Menubar','none','name','Ejercicio#2 TP#3. PDS FICEN','position',[80 20 1000 700]);
% Graficado de la Respuesta en Frecuencia
subplot(2,1,1)
plot(w,abs(H));
grid
xlabel('omega [rad]');
ylabel('|H(w)|')
subplot(2,1,2)
plot(w,angle(H));
xlabel('omega [rad]');
ylabel('Fase [rad]')
grid

Hc=figure(3);
set(Hc,'NumberTitle','off','Menubar','none','name','Ejercicio#2 Inciso c TP#3. PDS FICEN','position',[100 20 1000 700]);
% Graficado de la Respuesta en Frecuencia
subplot(2,1,1)
stem(n,y4);
grid
xlabel('n');
ylabel('y4[n]')
subplot(2,1,2)
stem(n,x4);
xlabel('n');
ylabel('x4[n]')
grid



