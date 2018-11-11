function [p,ph,g] = fourth_part(N_SW)

b=[0.6 0.4 0.2 0.1 0.05];


k=0:0.01:pi;
j=k.*180/pi;

for i=1:length(b)
    
    p(i,:)=farfield(b(i),N_SW); 
    
end;

g=0:360/length(p):360-360/length(p);
figure();


for i=1:length(b)
    ph(i,:)=fliplr(p(i,1:ceil(size(p,2)/2)));%strogylopoihsh stoixeiwn kai kanw flip to miso p sto p gia na parw to swsto teliko diagramma alliws 8a ebgane anapoda to 8ewrhtiko 
    semilogy(g(1:ceil(length(g)/2)),2*pi*1e+6.*(ph(i,:).^2));
    hold on;
    y=2*pi*1e+6.*(ph(i,:).^2);
    x=g(1:ceil(length(g)/2));
    title(sprintf('calculated scattering range for different values \n normalized scatterer radius'));
    text(x(end-1),y(end-1),sprintf('%gλ',b(i)));

    xlim([0 180]);ylim([0 20]);xlabel('moires 0..180');ylabel('SW');grid;
    
end;
hold off;

end
