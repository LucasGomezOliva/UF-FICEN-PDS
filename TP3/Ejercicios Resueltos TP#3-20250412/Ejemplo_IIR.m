%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Diseño de H(s) y Hiir(z)
%%%
%%% PDS FICEN
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 4;
wc = 1; % Frecuencia de corte normalizada
Aw =10; % Ancho de banda (Para pasa banda y elimina banda)
R1=5; % Ripple Banda de Paso
R2=200; % Ripple Banda de Atenuación

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Seleccione el tipo de filtro analógico normalizado
%%% para obtener luego los #4 Filtros desnormalizados
%[N1,D1]=butter(N,wc,'s');
[N1,D1]=cheby1(N,R1,wc,'s');
%[N1,D1]=ellip(N,R1,R2,wc,'s');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Hlpp=tf(N1,D1)
F1 = figure(1);
set(F1,'position',[80 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Pasa Bajos Prototipo');
bode(Hlpp)
grid
wclp = 100; % Frcuencia de corte
[N2,D2]=lp2lp(N1,D1,wclp);
Hlp=tf(N2,D2)
F2 = figure(2);
set(F2,'position',[120 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Pasa Bajos Desnormalizado');
bode(Hlp)
grid
[N3,D3]=lp2hp(N1,D1,wclp);
Hhp=tf(N3,D3)
F3 = figure(3);
set(F3,'position',[160 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Pasa Altos desnormalizado');
bode(Hhp)
grid
[N4,D4]=lp2bp(N1,D1,wclp,Aw);
Hbp=tf(N4,D4)
F4 = figure(4);
set(F4,'position',[200 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Pasa banda Desnormalizado');
bode(Hbp)
grid
[N5,D5]=lp2bs(N1,D1,wclp,Aw);
Hrb=tf(N5,D5)
F5 = figure(5);
set(F5,'position',[240 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Elimina Bands Desnormalizado');
bode(Hrb)
grid
F6 = figure(6);
set(F6,'position',[280 20 1200 800],'Menubar','none',...
        'NumberTitle','off','name', 'Polos y Ceros LPP');
zplane(roots(N1),roots(D1))
