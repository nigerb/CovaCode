clear; 
disprate=0.5*rand
sexrate= logspace(-3,0,9);
dormrate= logspace(-3,0,10);
phi=10;
dormmort=0.1;
mu_dist=1;
dispmort=0.1;
mu=0.01*ones([26 1]); % mutation probability
mu(19:26)=0;% this makes dormancy non-evolving
mu(3:10)=0; % this makes sex non-evolving
w=0.5; % probability to wake up at given t (when env is suitable)
 % mean of dispersal distance
alpha=2;
S=10;
maxrep=10;
maxt=1000; % for proper runs make this longer

disp('Fig3Disp')
            
for rep=1:maxrep
for i=1:length(sexrate)
for j=1:length(dormrate)
    
    [i j rep]
 
    ps=0.9; pt=0.9; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

    start_cond=[sexrate(i) disprate dormrate(j)]
 
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispHH(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispHH(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispHHUS(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispHHUS(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispLL(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispLL(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispLLUS(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispLLUS(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    

%%%% Offspring decides


    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispHHOD(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispHH(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispHHUSOD(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispHHUS(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispLLOD(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispLL(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,2);
    DispLLUSOD(i,j,1,rep)=mean(Dispb(:,end-100,end),2); DispLLUS(i,j,2,rep)=mean(Dispw(:,end-100,end),2); 
    
    save Fig3Disp
end


end

save Fig3Disp
end

disp('end')
