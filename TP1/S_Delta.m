function [ x , t ] = S_Delta( A , t0 , N )
t=0:1:N;
for n=0:1:N
    if n == t0
        x(n + 1) = A;
    else
        x(n + 1) = 0;
    end
end

