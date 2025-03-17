function X = Senoidal_Discreta( A , NI , NF , W0 , TITA )

N = NI:1:NF;
X = A * sin (W0 * N + TITA);
stem(N,X);
grid;
% Extra para poder ver una señal en tiempo continuo
T=NI:0.01:NF;
X = A * sin (W0 * T + TITA);
hold on;
plot(T,X);
hold off;
ylabel('x[n]');
xlabel('n [ ]')
end

