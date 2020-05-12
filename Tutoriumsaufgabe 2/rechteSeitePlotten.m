step=0.03;
 X=[0:step:2]; %Vektor von 0 bis 2 in 0.3 Schritten -> gibt x-Achse an
 Y=[0:step:2]; %Vektor von 0 bis 2 in 0.3 Schritten -> gibt y-Achse an
 [x,y]=meshgrid(X,Y); %erstellt jeweils f�r x und f�r y eine Matrix
n=1;
 
for i=1:(length(X)) %i ist ein Vektor, indem die Indizes von x drinstehen
 for j=1:(length(Y)) %j ist ein Vektor, indem die Indizes von y drinstehen
   f(j,i)=1*Quellfunktion(x(j,i),y(j,i)); %Quellfunktion wird f�r jeden Punkt, den man betrachten will, aufgerufen und Funktion schaut nach, ob die Punkte in unserem definierten Gitter liegen; f(j,i) ist Matrix 
 endfor  
endfor

figure (1)
surfc(x,y,f)
title ('Funktion der rechten Seite')
  filename=["images/abgabe/Figure_00" num2str(n) ".jpg"];
  saveas(1, filename);
