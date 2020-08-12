 clf;
 clear all;
 close all;
 %Ausbreitungskoeffizient (Diffusionskoeffizient)
 %beschreibt nur die Ausbreitung im Raum
 c = 0.1;
 
 %Infektionsrate
 %Wkeit, dass eine Person im Raum infiziert wird
 infektionsrate=0.3258;
 
 %Wechselrate
 w=(1/14);
 
 %Zeitvariablen
 tage = 200;
 delta_t = 0.01;
 Zeitschritte = floor(tage/delta_t);
 
 %-------
 %slowdown für c)!
 
 %-------
 
 %Bev�lkerungsmatrix --------- 
 B = getBevDichteMatrix();
 sizeX= rows(B); %entspricht xend also x in km
 sizeY= columns(B); %entspricht yend also y in km
 N=sizeX*10; %sizeX ist x in km -> * 10 = 100m Raster
 h = sizeX/(N);
 M=sizeY/h;
 colormap ("hot");
 
 %B=zeros(4,5).+232;
 
 x = 0:1:size(B)(2)-1;  y = 0:1:size(B)(1)-1;
 xi = linspace (min (x), max (x), N); %Anzahl der Unterteilungen
 yi = linspace (min (y), max (y), M)'; %Anzahl der Unterteilungen
 BInt2 = interp2 (x,y,B,xi,yi,"cubic");
 
 xxi = linspace (min (x)-0.5, max (x)+0.5, N); %Anzahl der Unterteilungen
 yyi = linspace (min (y)-0.5, max (y)+0.5, M)'; %Anzahl der Unterteilungen
 BInt = griddata(xi,yi,BInt2,xxi,yyi,"nearest");
 figure(1001)
 surface (xxi,yyi,BInt);
 [x,y] = meshgrid (x,y);
 hold on;
 plot3 (x,y,B,"bo");
 title ("Bevoelkerungsdichte Landau");
 ylabel("y")
 xlabel("x")