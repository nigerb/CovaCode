load varAllshort.mat
load mycolours


vSexb=mean(SexMU(:,:,:,1,:),5);
vectSexb=vSexb(:).';
vSexw=mean(SexMU(:,:,:,2,:),5);
vectSexw=vSexw(:).';
vDispb=mean(DispMU(:,:,:,1,:),5);
vectDispb=vDispb(:).';
vDispw=mean(DispMU(:,:,:,2,:),5);
vectDispw=vDispw(:).';
vDormb=mean(DormMU(:,:,:,1,:),5);
vectDormb=vDormb(:).';
vDormw=mean(DormMU(:,:,:,2,:),5);
vectDormw=vDormw(:).';

%%%%% invert color scheme maybe green to red (red high cost)
c= [0.687500000000000,1,0.312500000000000;
    0.375000000000000,1,0.625000000000000;
    0.0625000000000000,1,0.937500000000000;
     0,0.687500000000000,1;
      0,0.375000000000000,1;
    0,0.125000000000000,1];
   
   
    
    
  
    %1,1,0;
    %1,0.687500000000000,0;
    %1,0.437500000000000,0;
    %1,0.125000000000000,0];


    
    
for i=1:6

SexDiCostb(:,:)=vSexb(:,i,:);SexDiCostw(:,:)=vSexw(:,i,:);
DispDiCostb(:,:)=vDispb(:,i,:);DispDiCostw(:,:)=vDispw(:,i,:);
DormDiCostb(:,:)=vDormb(:,i,:);DormDiCostw(:,:)=vDormw(:,i,:);


figure(1);subplot(3,2,1); hold on
colormap(c)
% Scatters for points
scatter(DispDiCostb(:), SexDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter(DispDiCostw(:), SexDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
xlabel('Frequency of dispersal');ylabel('Frequency of sex');
colorbar



figure(1);subplot(3,2,3); hold on
% Scatters for points
scatter(DormDiCostb(:), DispDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter(DormDiCostw(:), DispDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
ylabel('Frequency of dispersal');xlabel('Frequency of domrancy');

figure(1);subplot(3,2,5); hold on
% Scatters for points
scatter( SexDiCostb(:),DormDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter( SexDiCostw(:),DormDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
ylabel('Frequency of dormancy');xlabel('Frequency of sex')

for j=1:5
    for z=1:4

        
figure(1);
subplot(3,2,1);
%set(gca, 'colororder', c(i,:))
line([DispDiCostb(j,z); NaN.*DispDiCostw(j,z)], [SexDiCostb(j,z); NaN.*SexDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line([NaN.*DispDiCostb(j,z); DispDiCostw(j,z)], [NaN.*SexDiCostb(j,z); SexDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line([DispDiCostb(j,z); DispDiCostw(j,z)], [SexDiCostb(j,z); SexDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts

figure(1);
subplot(3,2,3);
%set(gca, 'colororder', c(i,:))
line([DormDiCostb(j,z); NaN.*DormDiCostw(j,z)], [DispDiCostb(j,z); NaN.*DispDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line([NaN.*DormDiCostb(j,z); DormDiCostw(j,z)], [NaN.*DispDiCostb(j,z); DispDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line([DormDiCostb(j,z); DormDiCostw(j,z)], [DispDiCostb(j,z); DispDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts


figure(1);
subplot(3,2,5);
%set(gca, 'colororder', c(i,:))
line( [SexDiCostb(j,z); NaN.*SexDiCostw(j,z)],[DormDiCostb(j,z); NaN.*DormDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line( [NaN.*SexDiCostb(j,z); SexDiCostw(j,z)],[NaN.*DormDiCostb(j,z); DormDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line( [SexDiCostb(j,z); SexDiCostw(j,z)],[DormDiCostb(j,z); DormDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts



    end
end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For LL world%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


vSexb=mean(SexLLMU(:,:,:,1,:),5);
vectSexb=vSexb(:).';
vSexw=mean(SexLLMU(:,:,:,2,:),5);
vectSexw=vSexw(:).';
vDispb=mean(DispLLMU(:,:,:,1,:),5);
vectDispb=vDispb(:).';
vDispw=mean(DispLLMU(:,:,:,2,:),5);
vectDispw=vDispw(:).';
vDormb=mean(DormLLMU(:,:,:,1,:),5);
vectDormb=vDormb(:).';
vDormw=mean(DormLLMU(:,:,:,2,:),5);
vectDormw=vDormw(:).';


    
for i=1:6

SexDiCostb(:,:)=vSexb(:,i,:);SexDiCostw(:,:)=vSexw(:,i,:);
DispDiCostb(:,:)=vDispb(:,i,:);DispDiCostw(:,:)=vDispw(:,i,:);
DormDiCostb(:,:)=vDormb(:,i,:);DormDiCostw(:,:)=vDormw(:,i,:);


figure(1);subplot(3,2,2); hold on
colormap(c)
% Scatters for points
scatter(DispDiCostb(:), SexDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter(DispDiCostw(:), SexDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
xlabel('Frequency of dispersal');ylabel('Frequency of sex');
colorbar



figure(1);subplot(3,2,4); hold on
% Scatters for points
scatter(DormDiCostb(:), DispDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter(DormDiCostw(:), DispDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
ylabel('Frequency of dispersal');xlabel('Frequency of domrancy');

figure(1);subplot(3,2,6); hold on
% Scatters for points
scatter( SexDiCostb(:),DormDiCostb(:),30,c(i,:),'d','filled'); % plotting with black (k) crosses (x)
scatter( SexDiCostw(:),DormDiCostw(:),30,c(i,:),'o','filled'); % plotting with black (k) circles (o)
ylabel('Frequency of dormancy');xlabel('Frequency of sex')

for j=1:5
    for z=1:4

        
figure(1);
subplot(3,2,2);
%set(gca, 'colororder', c(i,:))
line([DispDiCostb(j,z); NaN.*DispDiCostw(j,z)], [SexDiCostb(j,z); NaN.*SexDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line([NaN.*DispDiCostb(j,z); DispDiCostw(j,z)], [NaN.*SexDiCostb(j,z); SexDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line([DispDiCostb(j,z); DispDiCostw(j,z)], [SexDiCostb(j,z); SexDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts

figure(1);
subplot(3,2,4);
%set(gca, 'colororder', c(i,:))
line([DormDiCostb(j,z); NaN.*DormDiCostw(j,z)], [DispDiCostb(j,z); NaN.*DispDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line([NaN.*DormDiCostb(j,z); DormDiCostw(j,z)], [NaN.*DispDiCostb(j,z); DispDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line([DormDiCostb(j,z); DormDiCostw(j,z)], [DispDiCostb(j,z); DispDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts


figure(1);
subplot(3,2,6);
%set(gca, 'colororder', c(i,:))
line( [SexDiCostb(j,z); NaN.*SexDiCostw(j,z)],[DormDiCostb(j,z); NaN.*DormDiCostw(j,z)],'Color',c(i,:), 'marker', 'd') % Plot coloured x markes
line( [NaN.*SexDiCostb(j,z); SexDiCostw(j,z)],[NaN.*DormDiCostb(j,z); DormDiCostw(j,z)],'Color',c(i,:), 'marker', 'o') % Plot coloured o markes
line( [SexDiCostb(j,z); SexDiCostw(j,z)],[DormDiCostb(j,z); DormDiCostw(j,z)],'Color',c(i,:)) % Plot coloured lines between 'b' and 'w' pts



    end
end
end





