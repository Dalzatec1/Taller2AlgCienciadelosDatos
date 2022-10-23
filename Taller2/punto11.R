# 5 (20%) 
library(MASS)
n=1000
X= matrix(rep(0,n*6), ncol=6  )
for (i in 1:6){
  # x_i
  X[ , i]= rnorm(n=n, mean=i, sd=1 )
  
}
error<- rnorm(n=n, mean=0, sd=0.2)

A= cbind(matrix(rep(1,n),ncol=1), X )
betas=matrix( c(15,(1:6)^3),ncol=1 )
y = A %*% betas + error
coef_generalizada<-ginv(A) %*% y

modelo<-lm(y~X)

coef_minimos_caudrados<-matrix(modelo$coefficients,ncol=1)
betas
coef_minimos_caudrados
modelo