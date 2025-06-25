clear 
close all
clc

alfa = 0.9;
N = 5;
R = 8000;

[B, A] = Obtener_Coeficientes_Ecos(alfa, R, N);

[archivo, ruta] = uigetfile('introBlackDog.wav', 'Selecciona un archivo de audio');
if isequal(archivo, 0)
    disp('No se seleccionó ningún archivo.');
    return;
end

[x, fs] = audioread(fullfile(ruta, archivo));

if size(x,2) == 2
x = mean(x, 2);
end

disp('Frecuencia de muestreo...');
disp(fs);

y = filter(B, A, x);

disp('Reproduciendo audio original...');
sound(x, fs);
pause(length(x)/fs + 1);

disp('Reproduciendo audio con ecos...');
sound(y, fs);
pause(length(y)/fs + 1);

t = (0:length(x)-1)/fs;

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Generador de Ecos');
subplot(2,1,1);
plot(t, x);
title('Audio original');
xlabel('Tiempo [s]');
ylabel('Amplitud');
grid on;
subplot(2,1,2);
plot(t, y);
title('Audio con ecos');
xlabel('Tiempo [s]');
ylabel('Amplitud');
grid on;

audiowrite('audio_con_ecos.wav', y, fs);
disp('Archivo con ecos guardado como "audio_con_ecos.wav".');

function [B, A] = Obtener_Coeficientes_Ecos(alfa, R, N)
    B = zeros(1, R*N+1);
    B(1) = 1;
    B(R*N+1) = -alfa^N;
    A = zeros(1, R+1);
    A(1) = 1;
    A(R+1) = -alfa;
end
