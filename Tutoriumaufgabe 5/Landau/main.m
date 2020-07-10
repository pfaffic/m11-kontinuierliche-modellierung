 clf;
  
 B = getBevDichteMatrix();
 sizeX= size(B)(2); %entspricht xend also x in km
 sizeY= size(B)(1); %entspricht yend also y in km
 N=sizeX*10 %sizeX ist x in km -> * 10 = 100m Raster
 h = sizeX/(N) 
 M=sizeY/h
 colormap ("hot");
 x = 0:1:size(B)(2)-1;  y = 0:1:size(B)(1)-1;
 xi = linspace (min (x), max (x), N); %Anzahl der Unterteilungen
 yi = linspace (min (y), max (y), M)'; %Anzahl der Unterteilungen
 BInt = interp2 (x,y,B,xi,yi, "cubic");
 surface (xi,yi,BInt);
 [x,y] = meshgrid (x,y);
 hold on;
 plot3 (x,y,B,"bo");
 title ("Bevoelkerungsdichte Landau");
 ylabel("y")
 xlabel("x")
 
if(size(x)(2)>size(y)(2))
 axis_value = size(x)(2)-1;
else
 axis_value = size(y)(2)-1;
endif
 axis([0 axis_value 0 axis_value])
 colorbar
 hold off;