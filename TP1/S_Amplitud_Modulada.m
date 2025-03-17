function x = S_Amplitud_Modulada( Ac , Am , Fm , t)

x = Ac * ( 1 + ( Am / Ac ) * sin( 2 * pi * Fm * t)) .* cos( 2 * pi * Fc * t);

end

