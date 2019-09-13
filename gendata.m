clear all;close all;

ieee='b';
accuracy='real*8';

Ho=4000;
nx=640; hx=2.5; dx=5e3;
ny=640; hy=2.5; dy=5e3;
nt = 1;
nz=1;

% Flat bottom at z=-Ho
h=-Ho*ones(nx,ny);
% Walls
% h(:,1)=0;
% h(:,end)=0;
% fid=fopen('topog_d4000m_1600km_h2-5km.box','w',ieee); fwrite(fid,h,accuracy); fclose(fid);

%-------------------------------------------------------------------------
% Wind speed file
%-------------------------------------------------------------------------
% uwind = zeros(nx,ny);
% vwind = zeros(nx,ny);
% 
% uwind(:,:) = 7;

uwind = zeros(nx,ny,nt);
vwind = zeros(nx,ny,nt);

for i = 1:nt
    uwind(:,:,i) = 7;
end

% % Turn wind on at day 21
% for i = 21:nt
%     uwind(:,:,i) = 7;
% end

% Turn on wind slowly from day 21 until steady wind achieved at day 40
% init_wind = 0;
% for i = 21:nt
%     if i < 41
%         init_wind = init_wind + 7/20;
%         uwind(:,:,i) = init_wind;
%     else
%         uwind(:,:,i) = 7;
%     end
% end

% Turn on wind slowly from day 21 until steady wind achieved at day 60
% init_wind = 0;
% for i = 21:2:60
%         init_wind = init_wind + 7/20;
%         uwind(:,:,i) = init_wind;
%         uwind(:,:,i+1) = init_wind;
% %         U(i) = uwind(1,1,i);
% %         U(i+1) = uwind(1,1,i+1);
% end
% for i = 61:nt
%     uwind(:,:,i) = 7;
% end
% save('smoother_windfile','uwind','vwind');


% Linear wind
% uwind(:,[120:159]) = sqrt(0.12/(1.2*1.1e-3));
% uwind(:,[2:40]) = sqrt(0.10/(1.2*1.1e-3));
% t = linspace(uwind(1,2),uwind(1,159),80);
% for i = 1:nx
%     for j = 41:119
%         % linear wind
%         uwind(i,j) = t(j-39);
%     end
% end

fid=fopen('uwind_period_constant_1600km_h2-5km.bin','w',ieee); fwrite(fid,uwind,accuracy); fclose(fid);
fid=fopen('vwind_period_constant_1600km_h2-5km.bin','w',ieee); fwrite(fid,vwind,accuracy); fclose(fid);


% Wind-stress
% tauMax=0.1;
% x=((1:nx)-0.5)/(nx-1); % nx-1 accounts for a solid wall
% y=((1:ny)-0.5)/(ny-1); % ny-1 accounts for a solid wall
% [X,Y]=ndgrid(x,y);
% tau=tauMax*sin(pi*Y);
% fid=fopen('windx.sin_y','w',ieee); fwrite(fid,tau,accuracy); fclose(fid);


% [x,y] = ndgrid(1:1:nx,1:1:ny);
% [x,y]=ndgrid(-(0.5*nx)*hx+5:hx:(0.5*nx-1)*hx+5,-(0.5*ny)*hy+5:hy:(0.5*ny-1)*hy+5);
% 
% taux = zeros(nx,ny);
% % % Wind stress with a linear piecewise wind
% taux(:,[120:159]) = 0.2;
% taux(:,[2:40]) = 0.1;
% t = linspace(0.1,0.2,80);
% for i = 1:nx
%     for j = 41:119
%         % linear wind
%         taux(i,j) = t(j-39);
% %         taux(i,j) = (1.2)*(1.1e-3)*(0.001*y(i,j)+7)^2;
%         % uniform wind
% %         taux(i,j) = (1.2)*(1.2e-3)*(7)^2;
%     end
% end




% taux(:,[1:39]) = taux(40,40); taux(:,[121:160])=taux(120,120);
% fid=fopen('linwindx_pw_nswalls.bin','w',ieee); fwrite(fid,taux,accuracy); fclose(fid);


