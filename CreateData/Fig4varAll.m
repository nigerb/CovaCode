clear;
%load worlds9;
alphavalues=linspace(1,2.5,4);%1-2.5 include 1 1.5 2 2.5 
dispmort=linspace(0,0.9,6);%0.9
phi=10;
dormmort=linspace(0,0.9,5);% 0.9
start_cond=[0.5*rand 0.5*rand 0.5*rand]%starting conditions for a&b for [sex disp dorm]
mu=0.01*ones([26 1]); % mutation probability
w=0.5; % probability to wake up at given t (when env is suitable)
mu_dist=1; % mean of dispersal distance
maxt=1000;
maxrep=10
S=10

disp('varAllshortnew')
%A= 0.5*ones(S,S,maxt);
for rep=1:maxrep
    
    
for i=1:length(dormmort)
    for j=1:length(dispmort)
        
        for q= 1:length(alphavalues)
       
ps=0.9; pt=0.9; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

            
        [rep i j q]
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,1);
        SexMS(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexMS(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispMS(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispMS(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormMS(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormMS(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyMS(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyMS(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaMS(i,j,1,rep)=mean(meantheta(end-100:end));
        
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,1);
        
        SexMU(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexMU(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispMU(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispMU(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormMU(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormMU(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyMU(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyMU(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaMU(i,j,q,1,rep)=mean(meantheta(end-100:end));
        %}
        
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,2);
        SexOS(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexOS(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispOS(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispOS(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormOS(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormOS(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyOS(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyOS(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaOS(i,j,q,1,rep)=mean(meantheta(end-100:end));
       
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,2);
        
        SexOU(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexOU(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispOU(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispOU(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormOU(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormOU(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyOU(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyOU(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaOU(i,j,q,1,rep)=mean(meantheta(end-100:end));
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
ps=0; pt=0; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

        
        [rep i j q]
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,1);
        SexLLMS(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexLLMS(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispLLMS(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispLLMS(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormLLMS(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormLLMS(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyLLMS(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyLLMS(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaLLMS(i,j,1,rep)=mean(meantheta(end-100:end));
        
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,1);
        
        SexLLMU(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexLLMU(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispLLMU(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispLLMU(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormMU(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormLLMU(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyLLMU(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyLLMU(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaLLMU(i,j,q,1,rep)=mean(meantheta(end-100:end));
        %}
        
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(A,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,2);
        SexLLOS(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexLLOS(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispLLOS(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispLLOS(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormLLOS(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormLLOS(i,j,q,2,rep)=mean(Dormw(end-100:end));
        HappyLLOS(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyLLOS(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaLLOS(i,j,q,1,rep)=mean(meantheta(end-100:end));
       
        [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta]=popdyn(B,S,maxt,alphavalues(q),dispmort(j),dormmort(i),start_cond,phi,mu,w,mu_dist,2);
        
        SexLLOU(i,j,q,1,rep)=mean(Sexb(end-100:end)); SexLLOU(i,j,q,2,rep)=mean(Sexw(end-100:end)); 
        DispLLOU(i,j,q,1,rep)=mean(Dispb(end-100:end)); DispLLOU(i,j,q,2,rep)=mean(Dispw(end-100:end)); 
        DormLLOU(i,j,q,1,rep)=mean(Dormb(end-100:end)); DormLLOU(i,j,2,rep)=mean(Dormw(end-100:end));
        HappyLLOU(i,j,q,1,rep)=mean(Happyb(end-100:end)); HappyLLOU(i,j,q,2,rep)=mean(Happyw(end-100:end));
        ThetaLLOU(i,j,q,1,rep)=mean(meantheta(end-100:end));
    %}    
         save varAllshort
    end
end

 save varAllshort
end
 save varAllshort
end
disp('end')