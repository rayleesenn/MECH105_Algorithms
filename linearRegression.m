function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Name: Raylee Senn
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
x = [1 2 3];
y = [2 4 6];

if size(x)~=size(y)
    error('Sizes of x and y do not match!')
end

issortedX = issorted(x);
issortedY = issorted(y);
n = length(y);

if issortedX==1 && issortedY==1
    sortedX = x;
    sortedY = y;
else
    [sortedY, sortOrder] = sort(y);
    sortedX = x(sortOrder);
end

xQ1 = floor((n+1)/4);
xQ3 = floor((3*n+3)/4);
Q1 = sortedY(xQ1);
Q3 = sortedY(xQ3);
IQR = Q3-Q1;
lbound = Q1-(IQR*1.5);
ubound = Q3+(IQR*1.5);
outliers = find(sortedY < lbound | sortedY > ubound);
sortedX(outliers) = [];
sortedY(outliers) = [];
fX = sortedX;
fY = sortedY;

n = length(fY);
A = [n sum(fX);sum(fX) sum(fX.^2)];
B = [sum(fY); sum(fX.*fY)];
a = A\B;
y = a(2)*x+a(1);
meanfY = (sum(fY)/n);
slope = a(2);
intercept = a(1);
SSres = sum(((fY-a(1)-(a(2)*fX))).^2);
SStot = sum((fY-meanfY).^2);
Rsquared = 1-(SSres/SStot);


end
