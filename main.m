f=importdata('data.txt');
Nas=f.data(:,3);
Ncp=f.data(:,4);
Rs=f.data(:,1);
Rh=f.data(:,2);



Rreal=0.6;
Rhelp=0.4;

N=Ncp(1);

%orismos gewmetrias 
% 1 erwthma
[cpx,cpy,asx,asy,theta,testtheta,testcpx,testcpy,Ntest]=prwto(Rreal,Rhelp,N);


%2 erwthma 
%ypologismwn platwn voh8htikwn pgwn

[X,mat,sim,matnew,simnew,Xnew]=deytero(Rreal,Rhelp,cpx,cpy,asx,asy,theta,N,testcpx,testcpy,Ntest,testtheta);


[sf]= trito(X,mat,sim,Ntest,Rreal,Rhelp);

%metavalw th aktina ths voh8htikhs epifaneias
for i=2:length(Ncp)-4
   Rreal=0.6;
   Rhelp=0.4;
   N=Ncp(i);
    
    [cpx,cpy,asx,asy,theta,testtheta,testcpx,testcpy,Ntest]=prwto(Rreal,Rhelp,N);
    [X,mat,sim,matnew,simnew,Xnew]=deytero(Rreal,Rhelp,cpx,cpy,asx,asy,theta,N,testcpx,testcpy,Ntest,testtheta);
    [sf]= trito(X,mat,sim,Ntest,Rreal,Rhelp);

end;
    


%for i=1:5
    %Rreal=0.6;
   % Rhelp=Rh(i);
   % N=Ncp(3);
    %[cpx,cpy,asx,asy,theta,testtheta,testcpx,testcpy,Ntest]=prwto(Rreal,Rhelp,N);
   % [X,mat,sim,matnew,simnew,Xnew]=deytero(Rreal,Rhelp,cpx,cpy,asx,asy,theta,N,testcpx,testcpy,Ntest,testtheta);
   % [sf]= trito(X,mat,sim,Ntest,Rreal,Rhelp);

%end;
 

[p,ph,g]=fourth_part(60);
  

