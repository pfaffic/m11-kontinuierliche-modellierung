%Abgabe Gruppe: Gauer / Lemke / Pfaffmann

%Bilder auf PC speichern?
bilderSpeichern = false;


% Loesen der Poissongleichung mit Quellfunktion ----------------------------------------------------------------
%---------------------------------------------------------------------------------------------------------------
%Variablenfestlegen
step=0.03;
 X=[0:step:2]; %Vektor von 0 bis 2 in 0.3 Schritten -> gibt x-Achse an
 Y=[0:step:2]; %Vektor von 0 bis 2 in 0.3 Schritten -> gibt y-Achse an
 [x,y]=meshgrid(X,Y); %erstellt jeweils für x und für y eine Matrix

% Berechnen der Funktion der rechten Seite (f) -----------------------------------------------------------------
for i=1:(length(X)) %i ist ein Vektor, indem die Indizes von x drinstehen
  for j=1:(length(Y)) %j ist ein Vektor, indem die Indizes von y drinstehen
    
    %Hier können die Funktionen->Quellfunktion, Quellfunktion2, ..., Quellfunktion5 eingesetzt werden
    f(j,i)=1*Quellfunktion(x(j,i),y(j,i)); %Quellfunktion wird für jeden Punkt, den man betrachten will, aufgerufen und Funktion schaut nach, ob die Punkte in unserem definierten Gitter liegen; f(j,i) ist Matrix 
  endfor  
endfor
% Anwenden der elementarlösung mittels Faltung ------------------------------------------------------------------
for i=1:(length(X)) 
  for j=1:(length(Y))
    xstar=x(j,i)*ones(length(Y),length(X));%xstar ist festes verschobenes Argument siehe Erklärung in Implimentierung Poissonformel
    ystar=y(j,i)*ones(length(Y),length(X));
    % Phi mit verschobenem Argument:
    phi=-log(sqrt((xstar.-x).^2+(ystar.-y).^2))/(2*pi);% allgemeine Lösung für phi bei n=2
    phi(j,i)=0;
    %numerische Integration
    I(j,i) = trapz(Y,trapz(X,phi.*f,2));
  endfor  
endfor

figure 1
meshc(x,y,I)
grid on
title ('Loesung von Poissongleichung')
xlabel('x')
xlabel ('y')

figure 2
surfc(x,y,f)
title ('Funktion der rechten Seite')
if(bilderSpeichern)
  filename=["images/abgabe/Figure_000rechteSeite.jpg"];
  saveas(2, filename);
endif
%Bilder stellen Lösung der Poissongleichung mit der Funktion der rechten Seite dar

%Loesen der Diffusion mit Anfangswert --------------------------------------------------------------------------
%---------------------------------------------------------------------------------------------------------------

a=1;
u_null = I; %Lösung der Poissongleichung als Startwert u0 festlegen

%Festlegen der Achsengrenzen u0 min +-5% und u0 max +-5%
z_min_if=min(min(u_null));
z_max_if=max(max(u_null));
z_max = z_max_if * 1.05;
z_min = z_min_if * 1.05;
if (z_max_if < 0)
  z_max = z_max_if * 0.95;
endif
if (z_min_if > 0)
  z_min = z_min_if * 0.95;
endif
%-----------------------------------------------------------------------
% erneutes Plotten der Startwerte-Funktion u0 mit min/max der Z Koordinate ---------------------------
figure(99)
meshc(x,y,u_null)
axis([0 2 0 2 z_min z_max])
title ('Startbedingung t=0')
if(bilderSpeichern)
  filename=["images/abgabe/Figure_00.jpg"];
  saveas(99, filename);
endif
for t=0.01:0.005:0.15 %da jetzt Funktion zeitabhängig ist braucht Zeitschleife
  for i=1:(length(X))
    for j=1:(length(Y))
      xstar=x(j,i)*ones(length(Y),length(X));
      ystar=y(j,i)*ones(length(Y),length(X));
      % Psi mit verschobenem Argument:
      psi=(1/(4*pi*a*t))*exp(-((xstar.-x).^2+(ystar.-y).^2)/(4*a*t)); #-log(sqrt((xstar.-x).^2+(ystar.-y).^2))/(2*pi); %Fundamentallösung der Poissongleichung,die jetzt zeitabhängig ist
      psi(j,i)=0;

      %numerische Integration
      J(j,i) = trapz(Y,trapz(X,psi.*u_null,2)); %
    endfor  
  endfor
  n_fig=(1000+t*1000);
  figure(n_fig)
  meshc(x,y,J)
  axis([0 2 0 2 z_min z_max])
  grid on
  title (['Verteilung zum Zeitpunkt ' num2str(t)])
  xlabel('x')
  ylabel ('y')
  filename=["images/abgabe/Figure_",num2str(n_fig),".jpg"];
  if(bilderSpeichern)
    saveas(n_fig, filename);
  endif
endfor
close all
%Bilder stellen Diffusion der Startbedingung dar