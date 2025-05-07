function Y  = Filtro_Nivel( x , Nivel )
% Duda si usar el abs o no
X = abs(fft(x));
% X = fft(x);
mod = abs(fft(x));
Y = zeros(size(X));
for i=1:1:length(X)
if( mod(i) > Nivel)
    Y(i) = X(i);
else
    Y(i) = 0;
end
end

