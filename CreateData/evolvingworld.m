function [A,B]=evolvingworld(S,ps,pt,mstd,maxt,unsuitable)
% [A,B]=evolvingworld(S,ps,pt,maxt)
% S is the size of the world (e.g. 20)
% creates a lattice space on a toroid world, where each location reflects an
% environmental value between 0 and 1 that varies over time
% pt is the temporal autocorrelation
% ps is the spatial autocorrelation
% mstd is a 1 x 2 vector giving the desired mean and the std at each time step
% maxt is the maximal number of time steps
% unsuitable, if defined as...
% ...0, means that patches are never unsuitable
% ...a number between 0 and 1, means randomly chosen patches are unsuitable
% ...2, means that we will use option 2 which is to assume a logistic
% probability for the unsuitability

A=NaN*ones(S,S,maxt); %create a world containig NaN for every timestep
A(:,:,1)=unidrnd(2,S,S)-1; % start with a random 0,1 Matrix

for t=1:maxt
    
    %with this we could plot the world at every timestep
    %if t/10 == floor(t/10)
    %figure(1); surf(A(:,:,t)), axis([0 S 0 S -3 3]);drawnow
    %end
    %set(gca,'XColor','white');
    %set(gca,'YColor','white');
    %set(gca,'ZColor','white');
    %colormap('summer')
    %drawnow
    
    for i=1:S
        for j=1:S
            ni=[i-1 S+i-1 i i+1 i+1-S]; f=find(ni>S | ni<1); if ~isempty(f) ni(f)=[]; end; % find the i neighbous in the doughnut shaped world
            nj=[j-1 S+j-1 j j+1 j+1-S]; f=find(nj>S | nj<1); if ~isempty(f) nj(f)=[]; end; % find the j neighbous in the doughnut shaped world
            surroundings=nanmean([A(ni(1),nj,t) A(ni(2),nj,t) A(ni(3),nj,t)]);
            self=A(i,j,t);
            Anew(i,j)=(pt*(ps*surroundings+(1-ps)*self)+(1-pt)*rand(1));
        end
    end
    A(:,:,t+1)=mstd(1)+mstd(2)*(Anew-mean(Anew(:)))/std(Anew(:)); %rescaling
    
    % if asked (nargout==2), we will also produce B which is the same as A
    % but unsuitable patches marked as nan
    if nargout==2
        B=A;
        if unsuitable==2 % we use a logistic function (midpoint 0, steepness 1)
            
            steep=1;
            mid=0;
            L=logistic(steep,mid,B); % logistic probability distribution with a certain steepness s and midpoint m
            B(L<rand(size(B)))=nan;
            
        else % random patches become nan; unsuitable interpreted as the proportion that should do so
            
            B(rand(size(B))<unsuitable)=nan;
            
        end
    end
    
end