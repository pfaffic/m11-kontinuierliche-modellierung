% clear all loescht alle  bosher definierten Variablen
%clear all;
a=1;
step=0.03;
 X=[0:step:2];
 Y=[0:step:2];
 [x,y]=meshgrid(X,Y);

for i=1:(length(X)) 
for j=1:(length(Y))
   f(j,i)=1*Quellfunktion4(x(j,i),y(j,i)); 
 endfor  
n_Fig=1;
endfor
t_step = 0.05;
t_max = 3;
for t=1:t_step:t_max
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

figure(n_Fig)
meshc(x,y,I)
axis([0 2 0 2 -0.001 0.001])
grid on
title (['Losung von Poissongleichung | t=' num2str(t) " | a=" num2str(a)])
xlabel('x')
ylabel ('y')
  filename=["images/Figure_",num2str(n_Fig),".jpg"];
  saveas(n_Fig, filename);
  n_Fig=n_Fig+1;
  close all;
endfor

figure(99)
surfc(x,y,f)
title ('Funktion der rechten Seite')
saveas(99, ["images/Figure_",num2str(99),".jpg"]);
  close all;