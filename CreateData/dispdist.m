function d = dispdist(mu,option,n,m)
% draws the dispersal distance d from a distribution
% what distribution this is is defined by option with
% option = 1 exponential
% option = 2 e.g fat tailed (not done yet)

if option == 1 % draw distance from exponential distribution around mean mu
    d=exprnd(mu,n,m);
    %at the moment there is no option 2..
end
