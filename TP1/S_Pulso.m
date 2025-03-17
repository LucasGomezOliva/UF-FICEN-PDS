function x = S_Pulso( A , t0 , N )
for n = 0:1:N-1
    if n < t0
        x(n + 1) = A * 1;
    end
    if n >= t0
         x(n + 1)= 0;
    end
end
