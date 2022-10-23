clear all
clc

X = importdata('100_Portfolios_10x10.txt');
X = X(1:1000,2:end);
[f c] = size(X);

asimetria = skewness(X); %Asimetria
curtosis = kurtosis(X); %Curtosis
varianza = var(X); %Varianza

pon = 1:f;
pon = pon / f;



m = mean(X);
for i=1:c
    d(i) = sum(X(:,i) - m(i))^2 * pon(i);
end

varianza_global = sum(d);  %%Varianza global



%%%%% Agregando  fila
for i=1:c
    prom(i) = sum(X(:,i)) / f;
end

new_data = X;
new_data(end+1,:) = prom;

asimetria_2 = skewness(new_data); %Asimetria
curtosis_2 = kurtosis(new_data); %Curtosis
varianza_2 = var(new_data); %Varianza

pon_2 = 1:f;
pon_2 = pon_2 / f;

m_2 = mean(new_data);


for i=1:c
    d(i) = sum(new_data(:,i) - m_2(i))^2 * pon_2(i);
end

varianza_global_2 = sum(d); %%Varianza global
asimetria_ = norm(asimetria - asimetria_2)
curtosis_ = norm(curtosis - curtosis_2)
varianza_= norm(varianza - varianza_2)
varianza_g_diff = abs(varianza_global - varianza_global_2)