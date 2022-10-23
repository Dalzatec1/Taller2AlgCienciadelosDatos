clear all;
close all;

A = randn(4,4);
Q = orth(A);
B = randn(4,4);
C = Q * B;

norma1_B = norm(B, 1);
norma1_C = norm(C, 1);
norma2_B = norm(B, 2);
norma2_C = norm(C, 2);
normainf_B = norm(B, 'inf');
normainf_C = norm(C, 'inf');
normafro_B = norm(B, 'fro');
normafor_C = norm(C, 'fro');


