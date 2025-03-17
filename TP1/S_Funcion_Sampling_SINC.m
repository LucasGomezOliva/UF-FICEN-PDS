function x  = S_Funcion_Sampling_SINC( F0 , T0 , t )

 x = sin( 2 .* pi .* F0 .* ( t - T0) )./( 2 .* pi .* F0 .* ( t - T0));

%x= sinc(2 .* pi .* F0 .* ( t - T0));

end

