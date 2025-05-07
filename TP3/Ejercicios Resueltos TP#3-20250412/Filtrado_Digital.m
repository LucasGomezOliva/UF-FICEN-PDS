%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Vista de Filtros FIR e IIR
%%%
%%% PDS FICEN
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Hw=Filtrado_Digital(Nz,Dz,N)

n=0:N-1;
disp('Transferencia del Filtro:')
Hz=tf(Nz,Dz,[])
h=impz(Nz,Dz,N); % h[n]
Hk=fft(h); % TDF de h[n]
[Hw,w]=freqz(Nz,Dz,N,'whole'); % H(e^jw)
F1=figure(1);
set(F1,'position',[80 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'PDS. Filtrado Digital');
subplot(4,1,1)
stem(n,h);
grid
xlabel('n ()')
ylabel('h[n] ()')
subplot(4,1,2)
plot(w,abs(Hw));,
grid
xlabel('w (rad)')
ylabel('Angle H(e^jw)')
subplot(4,1,3)
plot(w,angle(Hw));
grid
xlabel('w (rad)')
ylabel('H(e^jw)')
subplot(4,1,4)
stem(n,abs(Hk));
grid
xlabel('k ()')
ylabel('abs(H[k])')
F2=figure(2);
set(F2,'position',[180 20 800 800],'Menubar','none',...
        'NumberTitle','off','name', 'PDS. Filtrado Digital. Polos y ceros');
zplane(roots(Nz),roots(Dz));
grid

