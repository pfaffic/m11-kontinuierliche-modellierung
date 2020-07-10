 clf;
 
 N=50;%Punkte in x-Richtung. Ganzzahligteilbar durch 5 
 M=N*4/5;
 colormap ("hot");
 A = getBevDichteMatrix();

 x = [0,1,2,3,4];  y = [0,1,2,3];
 xi = linspace (min (x), max (x), N); %Anzahl der Unterteilungen
 yi = linspace (min (y), max (y), M)'; %Anzahl der Unterteilungen
 AInt = interp2 (x,y,A,xi,yi, "cubic");
 surface (xi,yi,AInt);
 [x,y] = meshgrid (x,y);
 hold on;
 plot3 (x,y,A,"bo");
 title ("Bevoelkerungsdichte Landau");
 ylabel("y")
 xlabel("x")
 axis([0 4 0 4])
 colorbar
 hold off;