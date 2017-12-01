clear; 
dormrate=logspace(-3,0,9);
disprate=logspace(-3,0,10);
startsex=0.5*rand
phi=10;
dispmort=0.1; dormmort=0.1;
alpha=2;
mu=0.01*ones([26 1]); % mutation probability
mu(11:18)=0;% this makes dispersal non-evolving
mu(19:26)=0; % this makes dormancy non-evolving
w=0.5; % probability to wake up at given t (when env is suitable)
mu_dist=1; % mean of dispersal distance
S=10;
maxt=1000; % for proper runs make this longer
maxrep=10;


disp('Fig3SexNew')


for rep=1:maxrep    
for i=1:length(disprate)
 for j=1:length(dormrate) 
    
    [i j rep]
    

    ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,0.9,0.9,mstd,maxt,unsuitable);
    start_cond=[startsex disprate(i) dormrate(j)]
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexHH(i,j,1,rep)=mean(Sexb(:,end-100),2); SexHH(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexHHUS(i,j,1,rep)=mean(Sexb(:,end-100),2); SexHHUS(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
     ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,0.1,0.1,mstd,maxt,unsuitable);

  [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexLL(i,j,1,rep)=mean(Sexb(:,end-100),2); SexLL(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexLLUS(i,j,1,rep)=mean(Sexb(:,end-100),2); SexLLUS(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
    %%%%%
    


    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexHHOD(i,j,1,rep)=mean(Sexb(:,end-100),2); SexHH(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexHHUSOD(i,j,1,rep)=mean(Sexb(:,end-100),2); SexHHUS(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
     ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,0.1,0.1,mstd,maxt,unsuitable);

  [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexLLOD(i,j,1,rep)=mean(Sexb(:,end-100),2); SexLL(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    SexLLUSOD(i,j,1,rep)=mean(Sexb(:,end-100),2); SexLLUS(i,j,2,rep)=mean(Sexw(:,end-100,end),2); 
     
save Fig3SexNew
end


end


save Fig3SexNew
end
disp('end')
