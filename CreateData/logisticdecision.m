function [y,p]=logisticdecision(alleles,maladaptation)
% gives 0 or 1 according to the logistic probabilities for given a,b,c,d
a=sum(alleles(1:2,:));
b=sum(alleles(3:4,:));
c=sum(alleles(5:6,:));
d=sum(alleles(7:8,:));
p=a+(b-a)./(1+exp((-10*c).*(maladaptation-d)));
y=rand([1 size(alleles,2)])<p;
