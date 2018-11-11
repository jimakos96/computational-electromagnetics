function [cpx,cpy,asx,asy,theta,testtheta,testcpx,testcpy,Ntest] = prwto(r1,r2,N )
    theta=0:2*pi/N:2*pi-2*pi/N;
    %metatroph se kylindrikes syntetagmenes 
    Ntest=5*N;
    testtheta=0:2*pi/Ntest:2*pi-2*pi/Ntest;
    
    % oi metavlhtes typou test gia to 3o erwthma 
    
    cpx=r1*cos(theta);
    cpy=r1*sin(theta);
    asx=r2*cos(theta);
    asy=r2*sin(theta);
    
    testcpx=r1*cos(testtheta);
    testcpy=r1*sin(testtheta);
    
    
    figure,hold on;
    
    plot([cpx(end) cpx(1)],[cpy(end) cpy(1)],'.r');
    plot([asx(end) asx(1)],[asy(end) asy(1)],'.b');
    
    plot(cpx,cpy,'.r',asx,asy,'.b');
    title(sprintf('%d voh8htikes phges ,\n %d shmeia elegxoy ,aktina skedasth %g kai aktina boh8htikhs surface %g',N,N,r1,r2));
    xlim([-2*max(r1,r2) 2*max(r1,r2)]);
    ylim([-2*max(r1,r2) 2*max(r1,r2)]);
    axis square; grid;
    hold off


end

