clear; 
disprate=logspace(-3,0,10);
dormrate= 0.5*rand
sexrate=logspace(-3,0,9)
phi=10;
dispmort=0.1; 
dormmort=0.1;
w=0.8;
mu=0.01*ones([26 1]); % mutation probability
mu(11:18)=0;% this makes dispersal non-evolving
mu(3:10)=0; % this makes sex non-evolving
mu_dist=1; % mean of dispersal distance
alpha=2;
S=10;
maxt=1000; % for proper runs make this longer
maxrep=10;
            
disp('Fig3Dorm')

for rep=1:maxrep
for i=1:length(sexrate)
for j=1:length(disprate)
    
    [i j rep]
    
     % probability to wake up at given t (when env is suitable)
    start_cond=[sexrate(i) disprate(j) dormrate]
    ps=0.9; pt=0.9; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);


    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,1);
    DormHH(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormHH(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,1);
    DormHHUS(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormHHUS(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
    
    ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,1);
    DormLL(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormLL(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
   [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,1);
   DormLLUS(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormLLUS(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
   %%%%%%%%%%%%%% Offspring decides:
   


    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DormHHOD(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormHH(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DormHHUSOD(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormHHUS(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
    
    ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DormLLOD(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormLL(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
    
   [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
   DormLLUSOD(i,j,1,rep)=mean(Dormb(:,end-100,end),2); DormLLUS(i,j,2,rep)=mean(Dormw(:,end-100,end),2); 
   
    save Fig3Dorm
end


end
save Fig3Dorm
end
disp('end')