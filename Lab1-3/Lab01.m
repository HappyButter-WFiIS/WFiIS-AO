clear; clc;

A = [1,2,3,4; 
    1,4,9,16;
    2,3,5,8;
    2,3,5,7];

b = [1,2,3,4]';


det_A = det(A);

for i = 1:4
    tmpA = A;
    tmpA(:,i) = b;
    det(tmpA) / det_A
    
end
