function [N,Sexb,Sexw,Dispb,Dispw,Dormb,Dormw,Happyb,Happyw,meantheta,Nt,thetab,thetaw,MeanPhenotypePP,sexb,sexw,dispw,dispb,dormw,dormb,itheta,ThetaPP,ithetaall] = popdyn(A,S,maxt,alpha,dispmort,dormmort,start_cond,phi,mu,w,mu_dist,option)

% if option==1 then mother decides, if option==2 then offspring decide

% N has:
% 1..2, environment-matching trait
% 3..4, 'a' for sex prob
% 5..6, 'b' for sex prob
% 7..8, 'c' for sex prob
% 9..10, 'd' for sex prob
% 11..12, 'a' for dispersal
% 13..14, 'b' for dispersal
% 15..16, 'c' for dispersal
% 17..18, 'd' for dispersal
% 19..20, 'a' for dormancy
% 21..22, 'b' for dormancy
% 23..24, 'c' for dormancy
% 25..26, 'd' for dormancy
% 27, x location. This one is used to mark if an individual actually
% exists: it is set to NaN if not.
% 28, y location

globalmaxpop=S^2*phi; % maximal number of active individuals in world
max_nof_dormants=10*globalmaxpop; % max N
all_inds=globalmaxpop+max_nof_dormants;
N=nan(28,all_inds);% we hope to keep much of N as NaN for much of the time (to avoid artificial constraints)

Sexb=NaN(1,maxt);
Sexw=NaN(1,maxt);
Dispb=NaN(1,maxt);
Dispw=NaN(1,maxt);
Dormb=NaN(1,maxt);
Dormw=NaN(1,maxt);
Happyb=NaN(1,maxt);
Happyw=NaN(1,maxt);

N(1:2,1:globalmaxpop)=rand(2,globalmaxpop)./2;% random starting values for env. trait -> there is already variation in the population



N(3:4,1:globalmaxpop)=start_cond(1)/2*ones([2 globalmaxpop]); % 3..4, 'a' for sex prob
N(5:6,1:globalmaxpop)=start_cond(1)/2*ones([2 globalmaxpop]); % 5..6, 'b' for sex prob
N(7:8,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 7..8, 'c' for sex prob
N(9:10,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 9..10, 'd' for sex prob

N(11:12,1:globalmaxpop)=start_cond(2)/2*ones([2 globalmaxpop]); % 11..12, 'a' for dispersal
N(13:14,1:globalmaxpop)=start_cond(2)/2*ones([2 globalmaxpop]); % 13..14, 'b' for dispersal
N(15:16,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 15..16, 'c' for dispersal
N(17:18,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 17..18, 'd' for dispersal

N(19:20,1:globalmaxpop)=start_cond(3)/2*ones([2 globalmaxpop]); % 19..20, 'a' for dormancy
N(21:22,1:globalmaxpop)=start_cond(3)/2*ones([2 globalmaxpop]); % 21..22, 'b' for dormancy
N(23:24,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 23..24, 'c' for dormancy
N(25:26,1:globalmaxpop)=0.5*rand([2 globalmaxpop]); % 25..26, 'd' for dormancy

N(27:28,1:globalmaxpop)=unidrnd(S,2,globalmaxpop); % locations are integers


for t=1:maxt
    
    offspring=NaN*N;
    offspringdone=0;
    
    % death of dormant individuals
    dead_during_dormancy=find(N(27,:)<0 & rand(1,all_inds)<dormmort); % dormant ones are indicated with negative coordinates
    N(27,dead_during_dormancy)=NaN;
    
    % what happens at each site:
    for i=1:S
        for j=1:S
            
            f=find(N(27,:)==i & N(28,:)==j); % who is there now (and active)?
           
            % Mean Env value on patch 
            
                MeanPhenotypePP(i,j)=nanmean(sum(N(1:2,f)));
            
            % check if the patch is unsuitable
            if isnan(A(i,j,t)) % if unsuitable -> no germination, and everyone active dies
                
          
                N(27,f)=NaN; % the active! ones on the patch die
                %If there are dormants on the patch they are added to the offspringpool as
                %dormants
                if length(find(N(27,:)==-i & N(28,:)==-j))>0
                localoffspring=N(:,find(N(27,:)==-i & N(28,:)==-j));
                offspring(:,offspringdone+1:offspringdone+size(localoffspring,2))=localoffspring;
                offspringdone=offspringdone+size(localoffspring,2);
                end
                
            else % the environment is suitable
                
                % first see who might end diapause
                local_ready_to_awaken=vectperm(find(N(27,:)==-i & N(28,:)==-j & w>rand([1 all_inds]))); % wannabe germinators
                max_nof_awaken=max(0,phi-length(f)); % how many can maximally germinate on the patch
                % now see who actually can germinate (there is enough space)
                nof_awaken=min(length(local_ready_to_awaken),max_nof_awaken);
                newly_awakened=local_ready_to_awaken(1:nof_awaken);
                N(27:28,newly_awakened)=abs(N(27:28,newly_awakened)); % coordinates become positive for those who are newly active
                
                % update f to contain information about all active individuals
                f=find(N(27,:)==i & N(28,:)==j); % who is there now, recomputed after there may be newly active ones too
                
                
                 
                
                if length(f)>0 % patch is not empty, thus breeding (etc) can happen
                    
                    % Breeding
                    theta(f)=abs(sum(N(1:2,f))-A(i,j,t)); % maladaptation scores for active individuals on the patch
                    thetaneg(f)=sum(N(1:2,f))-A(i,j,t);
                    ThetaPP(i,j)=mean(sum(N(1:2,f))-A(i,j,t));
                    perform(f)=exp(-(theta(f)).^2); % performance score for determining maternity and paternity
                    
                    % who will opt for sex (or asex)?
                    if length(f)==1 asexual(f)=1; else asexual(f)=1-logisticdecision(N(3:10,f),theta(f)); end;
                    
                    % phi offspring will be created
                    % first choose the mother; asexuals are alpha times as likely to be chosen
                    % also, individuals that are better adapted are more likely to be chosen
                    motherid=f(ddists(perform(f).^5.*(1+alpha*asexual(f)),phi));
                    
                    % choose the father (so far same individual can be mum & dad, later we will cancel that; also remove him, if mother was in fact asexual)
                    fatherid=f(ddists(perform(f).^5,phi));
                    fatherid(find(asexual(motherid)))=nan; % when the mother is asexual no father is needed
                    
                    % now let's also avoid selfing
                    problemcases=find(motherid==fatherid);
                    while length(problemcases)>0
                        for pc=1:length(problemcases)
                            pf = f(find(f ~= motherid(problemcases(pc))));
                            fatherid(problemcases(pc))=pf(ddists(perform(pf),1));
                        end
                        problemcases=find(motherid==fatherid);
                    end;
                    
                    
                    % now we know mothers and fathers of this patch, and can create the offspring of this patch
                    localoffspring=nan(28,phi);
                    
                    for o=1:phi
                        if isnan(fatherid(o))% offspring is produced asexually
                            localoffspring(:,o)= N(:,motherid(o));
                        else % offspring is outcrossed
                            localoffspring(1:2:25,o)=N((0:2:24)+unidrnd(2,1,13),motherid(o)); % alleles from mum
                            localoffspring(2:2:26,o)=N((0:2:24)+unidrnd(2,1,13),fatherid(o)); % alleles from dad
                            localoffspring(27:28,o)= N(27:28,motherid(o)); % the location of dad doesn't matter as mums and dads are at the same patch anyways.
                        end
                    end
                    % mutations
                    mutatedalleles=(rand([26 phi])<mu(:)*ones(1,phi));
 
                    %localoffspring(1:26,:)=(1-mutatedalleles).*localoffspring(1:26,:)+mutatedalleles.*(0.5*rand(26,phi));% whether mutation happens and what magnitude it has;
                    localoffspring(1:26,:)=(1-mutatedalleles).*localoffspring(1:26,:)+mutatedalleles.*(localoffspring(1:26,:)+0.1*randn(26,phi));% whether mutation happens and what magnitude it has;
                    localalleles(:,:)=localoffspring(1:26,:);localalleles(localalleles<0)=0; localalleles(localalleles>0.5)=0.5; localoffspring(1:26,:)=localalleles(:,:); % keep between 0 and 0.5
                    
                    % Dispersal is assumed under maternal control
                    if option==1
                        disp=logisticdecision(N(11:18,motherid),theta(motherid));
                    else
                        disp=logisticdecision(localoffspring(11:18,:),abs(sum(localoffspring(1:2,:))-A(i,j,t)));
                    end
                    
                    % Dispersal mortality
                    localoffspring(27,find(disp & rand(1,phi)<dispmort))=NaN;
                    
                    traveldist=disp.*dispdist(mu_dist,1,1,phi); % the multiplication by dist makes the distance stay 0 for those who opt to stay in the natal patch
                    angle=2*pi*rand(1,phi);
                    
                    % find new coordinates
                    xnew=mod(round(localoffspring(27,:) + cos(angle).*traveldist),S); xnew(xnew==0)=S;
                    ynew=mod(round(localoffspring(28,:) + sin(angle).*traveldist),S); ynew(ynew==0)=S;
                    
                    localoffspring(27,:)=xnew;
                    localoffspring(28,:)=ynew;
                    
                    % Dormancy
                    if option==1 % mother decides
                        dormant=logisticdecision(N(19:26,motherid),theta(motherid)); % individuals that intend to go dormant
                    else % offspring decide based on where they are NOW
                        for p=1:size(localoffspring,2)
                            if  ~isnan(localoffspring(27,p))%if not dead during disp
                                if ~isnan(A(localoffspring(27,p),localoffspring(28,p),t))%if world is suitable
                                    thetanew(p)= abs(sum(localoffspring(1:2,p))-A(localoffspring(27,p),localoffspring(28,p),t));
                                else
                                    thetanew(p)=inf;% if unsuitable they are maximally maladapted
                                end
                            else
                                thetanew(p)=nan;%if died during dispersal, dormancy can't reanimate them...
                            end
                        end
                        dormant=logisticdecision(localoffspring(19:26,:),thetanew); % individuals that intend to go dormant
                    end
                    localoffspring(27:28,find(dormant))=-localoffspring(27:28,find(dormant)); % dormancy is switched on by making the coordinates negative
                    nof_new_dormants=sum(dormant);
                    %add localoffspring of the path to the offspringmatrix
                    offspring(:,(offspringdone+1):(offspringdone+phi))=localoffspring;
                    offspringdone=offspringdone+phi;
                    
                end
            end
        end
    end
    
    % collect data
    % hist(theta);
    % find individuals that are better and worse than median, and see what
    % they would do (note: this is collected regardless of whether they actually reproduced this round!
    % Data on actual offspring that have been produced could be collected as well, but it'll be more stochastic
    % and also weighted more by those parents who do lots of reproduction - though neither point means we shouldn't look at that data too)
    
    % find active individuals that are better or worse adapted that the median
    
    %find the active ones and split them in the better and worse adapted halves
    
    actives=find(N(27,:)>0); mediantheta=median(theta(actives));
    betterhalf=actives(theta(actives)<=mediantheta);
    worsehalf=actives(theta(actives)>mediantheta);
    %ithetab=theta(betterhalf);
    %ithetaw=theta(worsehalf);
    itheta=thetaneg(actives);
    ithetaall=thetaneg(:);
    [tmp,sexb]=logisticdecision(N(3:10,betterhalf),theta(betterhalf));
    [tmp,sexw]=logisticdecision(N(3:10,worsehalf),theta(worsehalf));
    [tmp,dispb]=logisticdecision(N(11:18,betterhalf),theta(betterhalf));
    [tmp,dispw]=logisticdecision(N(11:18,worsehalf),theta(worsehalf));
    [tmp,dormb]=logisticdecision(N(19:26,betterhalf),theta(betterhalf));
    [tmp,dormw]=logisticdecision(N(19:26,worsehalf),theta(worsehalf));
    happyb=(1-sexb).*(1-dispb).*(1-dormb); % these individuals go for no escape mechanism whatsoever - just happy to go on like they are
    happyw=(1-sexw).*(1-dispw).*(1-dormw);
    
    Sexb(t)=nanmean(sexb);
    Sexw(t)=nanmean(sexw);
    Dispb(t)=nanmean(dispb);
    Dispw(t)=nanmean(dispw);
    Dormb(t)=nanmean(dormb);
    Dormw(t)=nanmean(dormw);
    Happyb(t)=nanmean(happyb);
    Happyw(t)=nanmean(happyw);
    meantheta(t)=nanmean(theta);
    thetab(t)=nanmean(theta(betterhalf));
    thetaw(t)=nanmean(theta(worsehalf));
    
    %figure(1);
    %subplot(3,1,1); plot(1:maxt,Sexb,'r',1:maxt,Sexw,'r:'); ylabel('Sex');
    %subplot(3,1,2); plot(1:maxt,Dispb,'r',1:maxt,Dispw,'r:'); ylabel('Disp');
    %subplot(3,1,3); plot(1:maxt,Dormb,'r',1:maxt,Dormw,'r:'); ylabel('Dorm');
    %drawnow
    % When all patches are done define offspring as new population
    N=offspring;
    %pause
    
    Nt(t)= sum(~isnan(N(1,:)));
    
end

