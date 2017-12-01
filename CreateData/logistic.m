
function f=logistic(k,d,x)
%gives f as an output wich is the probability to become unsuitable
%depending on the env. value
f= 1./(1+ exp(-k*(x-d)));
end


