scale = 10
step = 0.1;
x=[-scale:step:0-step, 0+step:step:scale]; % Zeilen laufen von 1 bis 10
y=[-scale:step:0-step, 0+step:step:scale]; % Spalten laufen von 1 bis 10

[x,y]=meshgrid (x,y); % verbindet x und y zu einer Matrix, so dass ein Punktegitter entsteht

norm = sqrt(x.^2+y.^2); %norm gibt für jeden Eintrag der 10x10 Matrix den Abstand zum Ursprung an.

z=(-1/2*pi)*log(norm); % gibt unsere Fundamentallösung für die stationäre Laplace Gleichung an für R^2

meshc(x,y,z) %plottet unsere Funktion im Dreidimensionalen