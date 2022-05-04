function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
[m,X] = size(x);
[m,Y] = size(y);

if X ~=Y
    error('Inputs are not correct size.')
end

check = x(1):x(2)-x(1):x(end);
for i = 1:size(x,2)
    if x(i) ~= check(i)
        error('X input is not equally spaced.')
    end
end

n = size(x,2);
h = (x(end)-x(1))/(n-1);

sum = y(1);
for i = 2:(X-2)
    if mod(i,2) == 0
        sum = sum+4*y(i);
    else
        sum = sum+2*y(i);
    end
end

if mod(X,2) == 0
    warning('Function will be using trapezoidal rule for last interval.')
    sum = sum+y(X-1);
    I = (sum*h/3) + ((y(X)+y(X-1))*h/2);
else
    sum = sum+4*y(X-1) + y(X);
    I = sum*h/3;
end

