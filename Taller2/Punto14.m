clear all
clc
means = zeros([15,1]);
cova = hilb(15);
n = 10;
n_contamination = 100;

D = mvnrnd(means, cova, n);
D_cov=cov(D)
[D_vec, D_val] = eig(D_cov);
a=D(D<0)
detD = det(cov(D));
for j = 1:25
   index = randi([1,15]);
   means = zeros([15,1]);
   means(index) = j;
   
   C = mvnrnd(means, cova, n_contamination);
   S = [D
       C];
   S_cov = cov(S);
   [S_vec, S_val] = eig(S_cov);
 
%wolf
   [sigma , shrinkage ]= cov1para (S);
   [wolf_vec, wolf_val] = eig(sigma);
%minima cur
   %[idx,dm,mm,Ss,wval0,ndir]=kur_main(S);
   %[mm_vec, mm_val] = eig(mm);
 %pearson
    pearson=corr(S);
    [pearson_vec, pearson_val]=eig(pearson);
%kendall
    Kendall=corr(S,'type','Kendall');
    [Kendall_vec, pearson_val]=eig(Kendall);
 %distancias
   dis1=(D_vec-S_vec);
   dis2=(wolf_vec-S_vec);
   %dis3=abs(mm_vec-S_vec);
   dis4=(pearson_vec-S_vec);
   dis5=(Kendall_vec-S_vec);

   distancia1(j)=norm(dis1,2);
   distancia2(j)=norm(dis2,2);
   %distancia3(j)=norm(dis3,2);
   distancia4(j)=norm(dis4,2);
    distancia5(j)=norm(dis5,2);
end

plot(distancia1)
hold on
plot(distancia2)
hold on
%plot(distancia3)
%hold on
plot(distancia4)
hold on
plot(distancia5)

legend('cov habitual','Wolf','Pearson','Kendall')