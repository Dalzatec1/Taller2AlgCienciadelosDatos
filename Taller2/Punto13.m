clear all
clc
clear all
clc

X = importdata('100_Portfolios_10x10.txt');
X = X(1:1000,2:end);
A=X*X';
xn=1*ones(length(A));
b=A*xn;

%datos
Ainv=inv(A);
%R = chol(A);
[L,U] = lu(A);
[Q,R] = qr(A);
%final
x1=Ainv*b;
x2=pinv(A)*b;
x3=U\(L\b);
%x4=R\(R'\b);
x5=R\(Q'*b);


%distancias
norm1=norm(abs(x1-xn),1)
norm2=norm(abs(x2-xn),1)
norm3=norm(abs(x3-xn),1)
%norm4=norm(abs(x4-xn),1)
norm5=norm(abs(x5-xn),1)
