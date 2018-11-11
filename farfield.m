function [p] = farfield(param, N)

dist=zeros(N,N);
distnew=zeros(N,N);
sim=zeros(1,N);

theta=0:2*pi/N:2*pi-2*pi/N;
r2=param/2;
asx=r2*cos(theta);  %voh8htika shmeia
asy=r2*sin(theta);

Nnew=1*N;



testcp=0:2*pi/Nnew:2*pi-2*pi/Nnew;

r1=1e+6;
cpx=param*cos(theta);
cpy=param*sin(theta);
testcpx=r1*cos(testcp);
testcpy=r1*sin(testcp);
k=2*pi/1;
for m=1:N
    sim(m)=exp(-1i*k*cos(theta(m))*param);
end;

%8ewrhmeno platos arxikou prospiptontos A=1
A=1;sim=A*sim';


for i=1:N
    
    for j=1:N
        
    %metro dianusmatikhs diaforas ka8e collocation point gia ka8e boh8htikh phgh
    dist(i,j)=((cpx(i)-asx(j))^2+(cpy(i)-asy(j))^2)^0.5;
    
    end;
    
end;

    for i=1:Nnew
        
        for j=1:N
        
            distnew(i,j)=((testcpx(i)-asx(j))^2+(testcpy(i)-asy(j))^2)^0.5;
        
        end;
        
    end;


matrix=(besselh(0,2,k*dist));
matrixnew=(besselh(0,2,k*distnew));

X=linsolve(matrix,-sim);

p=abs(matrixnew*X);

end

