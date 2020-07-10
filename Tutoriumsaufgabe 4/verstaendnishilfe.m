#Verständnishilfe
N=3;
BB=zeros(N*N,N*N);
block=[3,0,0;0,3,0;0,0,3]
BB(1:N,1:N)=block
BB(1:N,N+1:2*N)=-block