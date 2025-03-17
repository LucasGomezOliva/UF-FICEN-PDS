function Senoidal_Continua_Muestreada(  A , F0 , TITA , Fs , L )

% Se�al continua
Ts=1/Fs;    
T = 0:0.01:(L*Ts);
Xt = A * sin (2 * pi * F0 * T + TITA);
hold on;
plot(T,Xt);
grid on;

%   Se�al Muestreada

Ts=1/Fs;            %   Periodo de Muestreo
nTs=0:Ts:(L-1)*Ts;  % Tiempo discreto
Xn = A * sin (2 * pi * F0 * nTs + TITA);
stem(nTs,Xn);
grid on;
hold off;

end

