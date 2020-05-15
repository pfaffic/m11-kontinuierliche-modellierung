%clear all;
step=0.03;
 X=[0:step:2];
 Y=[0:step:2];
 [x,y]=meshgrid(X,Y);
 
for i=1:(length(X)) 
  for j=1:(length(Y))
   f(j,i)=1*Quellfunktion(x(j,i),y(j,i)); 
   u0(j,i)=1*Anfangslosung(x(j,i),y(j,i)); 
 endfor  
endfor

t0=0.001
dt=0.01
a=10;
maxT=3
 
%Implementierung der Integralformel für Diffusionsgleichung
for k=0:maxT
 t=t0+k*dt
    for i=1:(length(X)) 
        for j=1:(length(Y))
       
        xstar=x(j,i)*ones(length(Y),length(X));
        ystar=y(j,i)*ones(length(Y),length(X));
        % Psi mit verschobenem Argument:
        psi=(1/(4*a*t*pi))*exp(-((xstar.-x).^2+(ystar.-y).^2))/(4*a*t);
        %nicht notwendig
        %%psi(j,i)=0;

        %numerische Integration
       % I(j,i) = trapz(Y,trapz(X,psi.*f,2));
         I(j,i) = trapz(Y,trapz(X,psi.*u0,2));
        endfor  
     endfor
     %SPeicher der berechneten Zeitschritte
     Losung(:,:, k+1)=I;
endfor

for k=0:maxT
figure(k+1)
meshc(x,y,Losung(:,:,k+1))
grid on
title (['Losung von Diffusionsgleichung in t=', num2str(t0+(k)*dt)])
xlabel('x')
xlabel ('y')
%axis ([0 2 0 2 0  15])
endfor
 figure (maxT+1)
 meshc(x,y,u0)
 title ('Anfangsloesung')