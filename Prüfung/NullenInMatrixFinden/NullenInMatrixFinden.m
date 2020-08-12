B=ones(5,5);
B(2,2)=0;
B(1,5)=0;
c=0.25;

x=c./B

index=find(x==Inf)
x(x==Inf)=0