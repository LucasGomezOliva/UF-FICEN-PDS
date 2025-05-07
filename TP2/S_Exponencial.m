function [ nTs , x ] = S_Exponencial( A , alfa , L  , Ts )
nTs = 0:Ts:( L - 1 ) * Ts;  %   Tiempo discreto
x = A * exp( alfa * nTs );

end

