% clear all loescht alle  bosher definierten Variablen
%clear all;
a=1;
step=0.03;
 X=[0:step:2];
 Y=[0:step:2];
 [x,y]=meshgrid(X,Y);

#for i=1:(length(X)) 
#for j=1:(length(Y))
#   f(j,i)=1*Quellfunktion4(x(j,i),y(j,i)); 
# endfor  
#endfor
n_Fig=1;
t_step = 0.05;
t_max = 2;
for t=1:t_step:t_max
for i=1:(length(X)) 
for j=1:(length(Y))
  f(j,i)=1*QuellfunktionT(x(j,i),y(j,i),t);
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
axis([0 2 0 2 0 4E-5])
grid on
title (['Losung von Poissongleichung | t=' num2str(t) " | a=" num2str(a)])
xlabel('x')
ylabel ('y')
  filename=["images/psi/Figure_",num2str(n_Fig),".jpg"];
  saveas(n_Fig, filename);
  figure(100+n_Fig)
surfc(x,y,f)
title ('Funktion der rechten Seite')
saveas(100+n_Fig, ["images/f/Figure_",num2str(100+n_Fig),".jpg"]);
  n_Fig=n_Fig+1;
  close all;
endfor