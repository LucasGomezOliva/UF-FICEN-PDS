function [ y ] = Filtro_pasa_altos_fase_cero( x , NC )
    X = abs(fft(x));
    N = length(x);
    H = zeros(1,N);
    H( NC:( N - NC )) = 1;
    Y = H.*X;
    y = real(ifft(Y));

    figure(61);
    subplot(3,1,1)
    plot(X); grid on;
    title('Espectro de Magnitud de Señal Original'); 
    xlabel('n [ ]'); ylabel('Magnitud');
    subplot(3,1,2)
    plot(H); grid on;
    title('Espectro de Magnitud del Filtro Pasa Bjaos de Fase Cero'); 
    xlabel('n [ ]'); ylabel('Magnitud');
    subplot(3,1,3)
    plot(Y); grid on;
    title('Espectro de Magnitud de la salida del filtro'); 
    xlabel('n [ ]'); ylabel('Magnitud');
    

end

