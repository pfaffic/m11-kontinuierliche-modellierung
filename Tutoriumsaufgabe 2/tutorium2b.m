% clear all loescht alle  bosher definierten Variablen
%clear all;
a=1;
step=0.03;
 X=[0:step:2];
 Y=[0:step:2];
 [x,y]=meshgrid(X,Y);

for i=1:(length(X)) 
for j=1:(length(Y))
   f(j,i)=1*Quellfunktion(x(j,i),y(j,i)); 
 endfor  
endfor

for t=1:3
for i=1:(length(X)) 
for j=1:(length(Y))
xstar=x(j,i)*ones(length(Y),length(X));
ystar=y(j,i)*ones(length(Y),length(X));
% Psi mit verschobenem Argument:
psi=(1/(4*pi*a*t))*exp(-sqrt((xstar.-x).^2+(ystar.-y).^2)^2/(4*a*t)); #-log(sqrt((xstar.-x).^2+(ystar.-y).^2))/(2*pi);
psi(j,i)=0;

%numerische Integration
I(j,i) = trapz(Y,trapz(X,psi.*f,2));
 endfor  
endfor

figure(10+t)
meshc(x,y,I)
axis([0 2 0 2 0 0.0003])
grid on
title ('Losung von Poissongleichung')
xlabel('x')
xlabel ('y')
endfor

figure(99)
surfc(x,y,f)
title ('Funktion der rechten Seite')