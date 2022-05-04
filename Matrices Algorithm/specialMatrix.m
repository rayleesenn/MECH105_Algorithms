function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrix A of the correct size, filling it with zeros to start with is not a bad choice
A = [4,5];

if nargin == 2
    disp('Function requires exactly 2 arguments.')
else error('Function requires exactly 2 arguments.')
end

for k=1:n
    for h=1:m
        if k==1
        A(k,h)=h;
        elseif h==1
        A(k,h)=k;
        else
        A(k,h)=A(k,h-1)+A(k-1,h)
        end
    end
end

% Now the real challenge is to fill in the correct values of A


end
% Things beyond here are outside of your function
