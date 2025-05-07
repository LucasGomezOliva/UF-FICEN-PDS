function [ y ] = Filtro_pasa_bajos_fase_cero( x , NC )
    X = abs(fft(x));
    N = length(X);
    H = ones(1,N);
    H(NC:N-1-NC) = 0;
    Y = H.*X;
    y = ifft(Y);
    
    Haux = figure(60);
    set(Haux,'position',[50 50 1200 750],'Menubar','figure',...
        'NumberTitle','off','name','Filtro Pasa Bajos de fase Cero');
    
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

