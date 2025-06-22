clear 
close all
clc

alfa = 1;
R=6;
Filtro_Peine(alfa,R);

% Filtro peine multile elimina banda
function Filtro_Peine(alfa,R)
B = zeros(1,R+1);   % [ 0 0 .......0 0 ]
B(1) = 1;           % [ 1 0 .......0 0 ]
B(R+1) = alfa;      % [ 1 0 ... 0 alfa ] 1 + alfa z^(-R)
A = 1;
[H,w] = freqz(B,A,512,"whole");
F = figure(1);
set(F,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro Peine: Respuestas');
subplot(3,1,1);
plot(w/pi,abs(H)); 
grid on;
xlabel('w');
ylabel('|H(e^{jw})|');
title('Respuesta en amplitud'); 
subplot(3,1,2);
plot(w/pi,angle(H)); 
grid on;
xlabel('w');
ylabel('angle(H(e^{jw}))');
title('Respuesta en fase')
subplot(3,1,3);
n = 0:1:R;
stem(n,B); 
grid on;
xlabel('n');
ylabel('h [n]');
title('Respuesta al impulso'); 
F2 = figure(2);
set(F2,'position',[80 130 550 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro Peine: Diagrama de Polos y Ceros');
zplane(B,A); grid on;
end


