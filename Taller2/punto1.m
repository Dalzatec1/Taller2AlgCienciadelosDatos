%punto 1

clear all;
close all;

A1 = rand(40,30);
A2 = rand(100,90);
A3 = rand(50,50);

C1= A1'*A1;
C2= A2'*A2;
C3= A3'*A3;

[Vectors1, values1] = eig(C1);
[Vectors2, values2] = eig(C2);
[Vectors3, values3] = eig(C3);

x = diag(values1);
bar(x)