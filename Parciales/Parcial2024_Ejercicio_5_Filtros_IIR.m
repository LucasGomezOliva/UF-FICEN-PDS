clear 
close all
clc

alfa = 0.5;

B1 = [1 1] * (1 - alfa);
A1 = [1 -alfa] * 2;

[H,w] = freqz(B1,A1,512,"whole");
F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro Pasa Bajos IIR');
subplot(2,1,1);
plot(w/pi,abs(H));
grid on;
xlabel('w');
ylabel('|H(e^{jw})|');
title('Respuesta en amplitud');
subplot(2,1,2);
plot(w/pi,angle(H));
grid on;
xlabel('w');
ylabel('angle(H(e^{jw}))');
title('Respuesta en fase')

B2 = [1 -1] * (1 + alfa);
A2 = [1 -alfa] * 2;

[H,w] = freqz(B2,A2,512,"whole");
F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','none',...
        'NumberTitle','off','name',...
        'Filtro Pasa Altos IIR');
subplot(2,1,1);
plot(w/pi,abs(H));
grid on;
xlabel('w');
ylabel('|H(e^{jw})|');
title('Respuesta en amplitud');
subplot(2,1,2);
plot(w/pi,angle(H));
grid on;
xlabel('w');
ylabel('angle(H(e^{jw}))');
title('Respuesta en fase')

wc_analitica = acos(2*alfa/(1+alfa.^2));
disp(wc_analitica);
disp(Calculo_wc(B1,A1))
disp(Calculo_wc(B2,A2))

% Calculo de la wc de un filtro
function wc = Calculo_wc(B,A)
[H,w] = freqz(B,A,512);
[~,Ubmin] = min(abs(abs(H)-(1/sqrt(2))));
wc = w(Ubmin);
end
