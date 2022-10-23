

clear all;
clc;

n = 2; p = 3;

A = randn(n)*10
B = randn(p)*10

 K = kron(A,B);

[VK, DK] = eig(K);
% Generar vectores/valores propios de A y B
[VA, DA] = eig(A);

[VB, DB] = eig(B);
%resultado
VK
K2 = kron(VA,VB)



