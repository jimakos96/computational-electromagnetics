function [X,mat,sim,matnew,simnew,Xnew]=deytero(r1,r2,cpx,cpy,asx,asy,theta,N,testcpx,testcpy,Ntest,testtheta)

    sim=zeros(1,N);
    dist=zeros(N,N);
    
    simnew=zeros(1,Ntest);
   
    distnew=zeros(Ntest,Ntest);
  
    k=2*pi/1;
    %vriskw thn diergesh
    for m=1:N
        sim(m)=exp(-1i*k*cos(theta(m))*r1);
    end;
    
    for m=1:Ntest
        simnew(m)=exp(-1i*k*cos(testtheta(m))*r1);
    end;
    
    
    
    
    
    A=1;
  
    sim=A*sim'; %metatrepw  th diegersh se katallhlh morfh gia na ly8ei to mat*X=sim
    
    for m=1:N
        for l=1:N
            dist(m,l)=((cpx(m)-asx(l))^2+(cpy(m)-asy(l))^2)^0.5; %apostash metaksy voh8htikwn kai shmeiwn elegxoy
            
            
        end;
    end;
      
    for m=1:Ntest
        for l=1:N
            distnew(m,l)=((testcpx(m)-asx(l))^2+(testcpy(m)-asy(l))^2)^0.5; %apostash metaksy voh8htikwn kai shmeiwn elegxoy
            
            
        end;
    end;
      
      
      mat=besselh(0,2,k*dist); %mat*X=sim
      matnew=besselh(0,2,k*distnew);
      simnew=simnew';
      X=linsolve(mat,-sim);
      Xnew=linsolve(matnew,-simnew);
      
      %sxediash tou X kata mhkos ths epifaneias tou skedasth
      
      
      figure()
      grid;
      
      view(-75,25);
      hold on;
      grid on;
    
      for j=1:length(asx)
          title(sprintf('3d x-y-z for N=%d  Rreal=%g Rhelp=%g',N,r1,r2));
          xlabel('x');
          ylabel('y');
          zlabel('Amplitude of currents');
          
          
              if(j<length(asx))
                  
                    plot3([asx(j) asx(j+1)],[asy(j) asy(j+1)],[0 0]);   
              %prospa8w na sxhmatisw thn epi8aneia dhmioyrgwntas tis diadoxikes apostaseis twn shmewn AS
              elseif(j==length(asx))
                    plot3([asx(j) asx(1)],[asy(j) asy(1)],[0 0]);  %prwto me teleytaio kommati 
              end;
		%sxediasmos |X|

              plot3([asx(j) asx(j)],[asy(j) asy(j)],[0 abs(X(j))],'linewidth',2.5);
              
              plot3([asx(j) asx(j)],[asy(j) asy(j)],[-2*m 2*m]);
              
              text(asx(j),asy(j),abs(X(j)),sprintf('%g',abs(X(j))));
              
      

              
               
             
              
          
          
      end;
      
      
                  
    
                
                  
    
      
      
    
    


end

