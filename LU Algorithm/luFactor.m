%Raylee Senn
%MECH 105-001, Dr. Bechara
%April 1st, 2022
%Homework 17- LU Factorization

%%
function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,c]=size(A);
if m~=c
    error('Incorrect size of matrix! Must be square.')
end

r = length(A);
U = A;
L = zeros(r);
P = eye(r);

for i = 1:r-1
    [maxvalue,it] = max(abs(U(i:r,i)));
    it = it+(i-1);
    if maxvalue == 0
        error('Matrix cannot pivot!')
    end
    U([i, it],:)= U([it, i],:);
    P([i, it],:) = P([it, i],:);
    L([i, it],:) = L([it, i],:);

for i2 = i+1:r;
    multfac = -U(i2,i)/U(i,i);
    U(i2,:) = U(i2,:) + multfac*U(i,:);
    L(i2,i) = -multfac;
end
end
L = L+eye(r)

