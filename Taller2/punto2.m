clear all;
close all;

A = randn(3,5);

A2 = A'*A;
A3 = A*A';

% Determinantes.
detA2 = det(A2);
detA3 = det(A3);

% Trazas
t = trace(A2);
t2 = trace(A3);