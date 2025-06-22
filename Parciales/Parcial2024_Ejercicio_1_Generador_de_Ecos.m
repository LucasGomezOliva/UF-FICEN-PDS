clear 
close all
clc

N = 6;
alfa = 0.8;
R = 4;
Generador_De_Ecos(alfa,R,N);

function Generador_De_Ecos(alfa,R,N)
B = zeros(1,R*N+1);
B(1) = 1;
B(R*N+1) = -alfa^N;
A = zeros(1,R+1);
A(1) = 1;
A(R+1) = -alfa;
[H,w] = freqz(B,A,1024,"whole");
F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Respuesta en Modulo y Fase');
subplot(2,1,1)
plot(w/pi,abs(H));
grid on;
title('Respuesta en modulo')
xlabel('\omega / \pi')
ylabel('|H(e{jw})|')
subplot(2,1,2)
plot(w/pi,angle(H));
grid on;
title('Respuesta en fase')
xlabel('\omega / \pi')
ylabel('∠H(e^{j\omega})')
F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Diagrama de polos y ceros');
zplane(B,A);
grid on;
F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos: Respuesta al impulso');
impz(B,A,23);
grid on;
end