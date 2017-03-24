data = csvread('data133610.csv');

X = data(:,1:5);
Xavg = mean(X(:,1:5));
Xsd = std(X(:,1:5));
y = data(:,6);

for i = 1:5
    (X(:,i)-Xavg(i))/(Xsd(i));
end

gplotmatrix(X,y);