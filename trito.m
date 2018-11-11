function [error] =trito(Xnew,matnew,simnew,Ntest,r1,r2)
    

    
    error=abs(matnew*Xnew + simnew);
    
    figure,plot(0:360/length(error):360-360/length(error),error);
    title(sprintf('Sfalma gia %d AS`s and %d of CP`s ,\n aktina  skedasth %g kai aktina voh8htikhs epifaneias %g',Ntest,Ntest,r1,r2))
    grid,xlabel('0...360\circ'),xlim([0 360]);
    
end

