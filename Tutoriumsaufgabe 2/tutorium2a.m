scale = 5
step = 0.1;
a=0.1;
x=[-scale:step:0-step, 0+step:step:scale]; % Zeilen laufen von 1 bis 10
y=[-scale:step:0-step, 0+step:step:scale]; % Spalten laufen von 1 bis 10

[x,y]=meshgrid (x,y); % verbindet x und y zu einer Matrix, so dass ein Punktegitter entsteht

norm = sqrt(x.^2+y.^2); %norm gibt für jeden Eintrag der 10x10 Matrix den Abstand zum Ursprung an.

z=(-1/2*pi)*log(norm); % gibt unsere Fundamentallösung für die stationäre Laplace Gleichung an für R^2
figure(100)
meshc(x,y,z) %plottet unsere Funktion im Dreidimensionalen

t_step = 0.1
t_max = 5
i=1; %nur benötigt um die Dateinamen der Bilder durchzuzählen
for t=1:t_step:t_max
   z= (1/(4*pi*a*t))*(exp(-norm.^2/(4*a*t))); %.t bedeutet, dass du jeden Eintrag des Vektors mit t multiplizierst; z gibt uns die Fundamtenallösung für unsere homogene (instationäre) Diffusionsgleichung an
  figure(i) %gibt die einzelnen Bilder aus zu den einzelnen Zeitpunkt von t=1 bis t=10
 
  meshc(x,y,z) %plottet unsere Funktion im Dreidimensionalen
 title(["t=" num2str(t) " | a=" num2str(a)]); 
 axis([-scale scale -scale scale 0 (1/(4*pi*a))]) %obere Z Grenze dynamisch mit a anpassen, damit Graph immer ganz im Bild ist.
  filename=["images/Figure_",num2str(i),".jpg"];
  saveas(i, filename);
  i=i+1;
  close all;
endfor
