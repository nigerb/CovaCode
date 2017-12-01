load Fig1TestSex2OD

x= SexHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,1);ciplot(lower,upper,disprate,[193/255 0 153/255]);hold on
figure(1);subplot(3,2,1);plot(disprate,mean(x(:,1,:),3),'k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');

x= SexHHUS(:,1,:)% Create Data
SEM = nanstd(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,1);ciplot(lower,upper,disprate,[1 204/255 1]);hold on
figure(1);subplot(3,2,1);plot(disprate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/dormancy');


x= SexLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,2);ciplot(lower,upper,disprate,[193/255 0 153/255]);hold on
figure(1);subplot(3,2,2);plot(disprate,mean(x(:,1,:),3),'k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');


x= SexLLUS(:,1,:)% Create Data
SEM = nanstd(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,2);ciplot(lower,upper,disprate,[1 204/255 1]);hold on
figure(1);subplot(3,2,2);plot(disprate,nanmean(x(:,1,:),3),'--k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');

load Fig1TestDorm3OD


x= DormHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,1);ciplot(lower,upper,disprate,[0 76/255 153/255]);hold on
figure(1);subplot(3,2,1);plot(disprate,mean(x(:,1,:),3),'k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');

x= DormHHUS(:,1,:)% Create Data
SEM = nanstd(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,1);ciplot(lower,upper,disprate,[204/255 229/255 1]);hold on
figure(1);subplot(3,2,1);plot(disprate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');


x= DormLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,2);ciplot(lower,upper,disprate,[0 76/255 153/255]);hold on
figure(1);subplot(3,2,2);plot(disprate,mean(x(:,1,:),3),'k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');


x= DormLLUS(:,1,:)% Create Data
SEM = nanstd(x,0,3)/sqrt(length(x));               % Standard Error
upper=nanmean(x(:,1,:),3)+SEM
lower=nanmean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,2);ciplot(lower,upper,disprate,[204/255 229/255 1]);hold on
figure(1);subplot(3,2,2);plot(disprate,nanmean(x(:,1,:),3),'--k');hold on
xlabel('Dispersal rate');ylabel('Frequency of sex/ dormancy');


load Fig1TestDisp2OD

x= DispHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,3);ciplot(lower,upper,dormrate,[76/255 153/255 0]);hold on
figure(1);subplot(3,2,3);plot(dormrate,mean(x(:,1,:),3),'k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');


x= DispHHUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,3);ciplot(lower,upper,dormrate,[204/255 1 153/255]);hold on
figure(1);subplot(3,2,3);plot(dormrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');

x= DispLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,4);ciplot(lower,upper,dormrate,[76/255 153/255 0]);hold on
figure(1);subplot(3,2,4);plot(dormrate,mean(x(:,1,:),3),'k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/  sex');

x= DispLLUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,4);ciplot(lower,upper,dormrate,[204/255 1 153/255]);hold on
figure(1);subplot(3,2,4);plot(dormrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');

load Fig1TestSex3OD


x= SexHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,3);ciplot(lower,upper,dormrate,[193/255 0 153/255]);hold on
figure(1);subplot(3,2,3);plot(dormrate,mean(x(:,1,:),3),'k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');


x= SexHHUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,3);ciplot(lower,upper,dormrate,[1 204/255 1]);hold on
figure(1);subplot(3,2,3);plot(dormrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/sex');

x= SexLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,4);ciplot(lower,upper,dormrate,[193/255 0 153/255]);hold on
figure(1);subplot(3,2,4);plot(dormrate,mean(x(:,1,:),3),'k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');

x= SexLLUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,4);ciplot(lower,upper,dormrate,[1 204/255 1]);hold on
figure(1);subplot(3,2,4);plot(dormrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Dormancy rate');ylabel('Frequency of dispersal/ sex');


load Fig1TestDorm2OD
   
x= DormHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,5);ciplot(lower,upper,sexrate,[0 76/255 153/255]);hold on
figure(1);subplot(3,2,5);plot(sexrate,mean(x(:,1,:),3),'k');hold on

xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');

x= DormHHUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,5);ciplot(lower,upper,sexrate,[204/255 229/255 1]);hold on
figure(1);subplot(3,2,5);plot(sexrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');


x=DormLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,6);ciplot(lower,upper,sexrate,[0 76/255 153/255]);hold on
figure(1);subplot(3,2,6);plot(sexrate,mean(x(:,1,:),3),'k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');

x=DormLLUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,6);ciplot(lower,upper,sexrate,[204/255 229/255 1]);hold on
figure(1);subplot(3,2,6);plot(sexrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');

load Fig1TestDisp3OD

  
x= DispHH(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,5);ciplot(lower,upper,sexrate,[76/255 153/255 0]);hold on
figure(1);subplot(3,2,5);plot(sexrate,mean(x(:,1,:),3),'k');hold on

xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');

x= DispHHUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,5);ciplot(lower,upper,sexrate,[204/255 1 153/255]);hold on
figure(1);subplot(3,2,5);plot(sexrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');


x=DispLL(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,6);ciplot(lower,upper,sexrate,[76/255 153/255 0]);hold on
figure(1);subplot(3,2,6);plot(sexrate,mean(x(:,1,:),3),'k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');

x=DispLLUS(:,1,:)% Create Data
SEM = std(x,0,3)/sqrt(length(x));               % Standard Error
upper=mean(x(:,1,:),3)+SEM
lower=mean(x(:,1,:),3)-SEM
figure(1);subplot(3,2,6);ciplot(lower,upper,sexrate,[204/255 1 153/255]);hold on
figure(1);subplot(3,2,6);plot(sexrate,mean(x(:,1,:),3),'--k');hold on
xlabel('Sex rate');ylabel('Frequency of dormancy/ dispersal');
