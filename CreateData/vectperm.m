function v2=vectperm(v1)
% v2=vectperm(v1): randomized order of vector
index=randperm(length(v1));
v2=v1(index);
