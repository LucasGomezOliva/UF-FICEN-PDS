function [ t , y ] = S_Exponencial( A , alfa , N , t0 )
t=0:1:N-1;
for n = 0:1:N-1
    if n < t0
        y(n + 1)=0;
    end
    if n >= t0
        y(n + 1) = A * exp(alfa*(n- t0));
    end
end

