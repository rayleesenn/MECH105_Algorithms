%Raylee Senn
%MECH 105-001, Dr. Bechara
%March 5th, 2022
%Homework 11- Algorithm Activity of False Position

%%
function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
fx = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
iter = 0;
rnew = xl;
signtest = func(xl)*func(xu);

if nargin < 3
    error('Needs at least 3 inouts')
end
if nargin < 4 || isempty(es)
    es = 0.000001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end
if signtest>=0
    error('Sign does not change.')
end

while (1)
    rold = rnew;
    rnew = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    signtest = func(xl)*func(xu);
    iter = iter+1;
    ea = (abs((rnew-rold)/rnew))*100;
    if rnew ~= 0
        ea = (abs((rnew-rold)/rnew))*100;
    end
    if ea<=es || iter>=maxit
        break
    end
    if signtest<0
        xu = rnew;
    elseif signtest>0
        xl = rnew;
    else 
        func(xl)==0 || func(rnew)==0;
    end

end

root = rnew;
fx = func(rnew);
ea = ea;
iter = iter-1;
end
