clc
clear
format short
A = [-1,3;1,1;1,-1];
B = [10;6;2];
c=[3,5];
y1 = 0:max(B);
x11 = (B(1)-A(1,1)*y1)/A(1,2);
x21 = (B(2)-A(2,1)*y1)/A(2,2);
x31 = (B(3)-A(3,1)*y1)/A(3,2);
x11 = max(0,x11);
x21 = max(0,x21);
x31 = max(0,x31);
plot(y1,x11,'r',y1,x21,'b',y1,x31,'g');

cx1 = find(y1==0);
c1 = find(x11==0);
line1 = [y1(:,[c1 cx1]);x11(:,[c1 cx1])]';
c2 = find(x21==0);
line2 = [y1(:,[c2 cx1]);x21(:,[c2 cx1])]';
c3 = find(x31==0);
line3 = [y1(:,[c3 cx1]);x31(:,[c3 cx1])]';
corpt = unique([line1;line2;line3],"rows");
%%phase 4
pt = [];
for i=1:size(A,1)
    for j=i+1:size(A,1)
        A4=A([i,j],:);
        B4=B([i,j]);
        X=inv(A4)*B4;
        pt=[pt,X];
    end
end

ptt = pt';
allpt = [ptt;corpt];
points = unique(allpt,"rows");

%%phase 6
for i= 1:size(points,1)
    const1(i) = A(1,1)*points(i,1) + A(1,2)*points(i,2) - B(1);
    const2(i) = A(2,1)*points(i,1) + A(2,2)*points(i,2) - B(2);
    const3(i) = A(3,1)*points(i,1) + A(3,2)*points(i,2) - B(3);
    s1 = find(const1>0);
    s2 = find(const2>0);
    s3 = find(const3>0);
end

s= unique([s1 s2 s3]);
points(s,:) = [];
value = points*c';
table = [points, value];
[obj, index ] = max(value);
x1 = points(index,1);
x2 = points(index,2);
fprintf('obj: value is %f at (%f,%f)',obj,x1,x2);