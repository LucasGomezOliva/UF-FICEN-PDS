%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Funci�n que permite el ingreso de datos para las se�ales de entrada.    %
% Sirve para las Se�ales originales, las de convoluci�n y las de          %
% correlaci�n. Permite el ingreso de dos o tres par�metros seg�n          %
% el tipo de se�al ingresada.                                             %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingenier�a y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [V1,V2,V3]=Init_Valor(L1,L2,L3)

H_Par=figure(2);
clf;
set(H_Par,'position',[200 150 380 150],'NumberTitle','off','menubar','none',...  % Seteo del area de visualizacion de los graficos
  'name','Ingreso de Parametros de Se�al'); 
if nargin<3
   % Rutina para las se�ales que requieren solo dos argumentos de entrada
  uicontrol(H_Par,'style','text','string',L1,'position',[60 100 100 20],...
   'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  uicontrol(H_Par,'style','text','string',L2,'position',[220 100 100 20],...
   'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  C1=uicontrol(H_Par,'style','edit','position',[60 70 100 20],...
       'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  C2=uicontrol(H_Par,'style','edit','position',[220 70 100 20],...
     'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  waitfor(C1,'string')
  V1=str2double(get(C1,'string'));
  waitfor(C2,'string')
  V2=str2double(get(C2,'string'));
  close(H_Par);
  return
else   
   % Rutina para las se�ales que requieren tres argumentos de entrada 
  uicontrol(H_Par,'style','text','string',L1,'position',[20 100 100 20],...
     'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  uicontrol(H_Par,'style','text','string',L2,'position',[140 100 100 20],...
     'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  uicontrol(H_Par,'style','text','string',L3,'position',[260 100 100 20],...
     'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  C1=uicontrol(H_Par,'style','edit','position',[20 70 100 20],...
     'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  C2=uicontrol(H_Par,'style','edit','position',[140 70 100 20],...
     'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  C3=uicontrol(H_Par,'style','edit','position',[260 70 100 20],...
     'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]); 
  waitfor(C1,'string')
  V1=str2double(get(C1,'string'));
  waitfor(C2,'string')
  V2=str2double(get(C2,'string'));
  waitfor(C3,'string')
  V3=str2double(get(C3,'string'));
  close(H_Par);
  return
end   