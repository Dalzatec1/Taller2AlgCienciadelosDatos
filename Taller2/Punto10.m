clear all
clc
A=magic(3)

Asimetrico=tril(A)+triu(A',1)

[av, ad]=eig(Asimetrico)

Av_inv=transpose(av)

A_desc=av*ad*Av_inv

A_trans=Asimetrico'

C=inv(Asimetrico)
[cv, cd]=eig(C)
Cv_inv=transpose(cv)
C_desc=cv*cd*Cv_inv

Asimetrico==A_trans
