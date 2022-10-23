clear all
clc

for n=2:100
    An=rand(10,n);
    Cn=An'*An;
    mu=zeros([1,n]);
    X= mvnrnd (mu , Cn , 1000);    
    CovHabitual =cov(X);
    %distancias
    distanica1(n)=norm(Cn-CovHabitual,1);
    distanica2(n)=norm(Cn-CovHabitual,2);
    distanica3(n)=norm(Cn-CovHabitual,'fro');
    distanica4(n)=norm(Cn-CovHabitual,'inf');

    [sigma , shrinkage ]= cov1para (X);
    
    distanica1mejorada(n)=norm(Cn-sigma,1);
    distanica2mejorada(n)=norm(Cn-sigma,2);
    distanica3mejorada(n)=norm(Cn-sigma,'fro');
    distanica4mejorada(n)=norm(Cn-sigma,'inf');


end
%{
nexttile
plot(distanica1);
title('Norma 1');
nexttile
plot(distanica2);
title('Norma 2');
nexttile
plot(distanica3);
title('Norma frobenius')
nexttile
plot(distanica4);
title('Norma infinito');
%}
nexttile
plot(distanica1mejorada);
title('Norma 1 mejorada');
nexttile
plot(distanica2mejorada);
title('Norma 2 mejorada');
nexttile
plot(distanica3mejorada);
title('Norma frobenius mejorada')
nexttile
plot(distanica4mejorada);
title('Norma infinito mejorada');
