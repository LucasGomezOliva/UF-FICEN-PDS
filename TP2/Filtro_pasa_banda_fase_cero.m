function [ y ] = Filtro_pasa_banda_fase_cero( x , W1 , W2 )
X = fft(x);
N = length(x);
H = zeros(1,N);
H( W1 : W2) = 1;
H( N - W2 : N - W1) = 1;
Y = H.*X;
y = real(ifft(Y));
end

