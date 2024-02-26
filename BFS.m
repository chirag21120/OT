clc
clear all
A = [12 3 -11 4;
    1 2 6 -7];
B =[7;
    3];
C = [2 3 5 7];
n = size(A,2);
m = size(A,1);

if n>m
    nCm = nchoosek(n,m);
    p = nchoosek(1:n,m);
    sol = [];
    for i=1:nCm
        y = zeros(n,1);
        selected_index = p(i,:);
        A1 = A(:,selected_index);
        X = inv(A1)*B;
        if all(X>=0 & X~=-inf & X~=inf)
            y(selected_index) = X;
            sol = [sol,y];
        end
    end
else
    error("NUmber of Constraint Greater than number of Variables");
end
Z = C*sol;
[obj,index] = max(Z);
bfs = sol(:,index);
optval= [bfs' obj];
array2table(optval,'VariableNames',{'X1','X2','X3','X4','Z'})
