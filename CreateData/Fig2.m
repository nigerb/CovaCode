% 


alphavalues=2;
dispmort=0.5;
phi=10;
dormmort=0.5;
start_cond=[0.5*rand 0.5*rand 0.5*rand]%starting conditions for a&b for [sex disp dorm]
mu=0.01*ones([26 1]); % mutation probability
w=0.8; % probability to wake up at given t (when env is suitable)
mu_dist=1; % mean of dispersal distance
maxt=2000;
S=10

ps=0.9; pt=0.9; mstd=[0.5 0.2]; unsuitable=0.05; [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable);

[N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta,Nt] = popdyn(A,S,maxt,alphavalues,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,1)

figure(1)
plot(1:maxt, mean([Sexb(:,:) ;Sexw(:,:)]), 1:maxt, mean([Dispb(:,:) ;Dispw(:,:)]),1:maxt, mean([Dormb(:,:) ;Dormw(:,:)]))