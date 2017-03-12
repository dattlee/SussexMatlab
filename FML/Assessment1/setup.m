data = csvread('data133610.csv');
X = data(:,1:5);
Y = data(:,6);

X_avg = mean(X);
X_std = std(X);
x = X;

for i = 1:length(X(1,:))
    x(:,i) = X(:,i) - X_avg(i);
    x(:,i) = X(:,i) / X_std(i);
end

figure(1);gplotmatrix(x,Y);
figure(2);gplotmatrix(X,Y);

X1 = x(:,1);
X2 = x(:,2);
X3 = x(:,3);
X4 = x(:,4);
X5 = x(:,5);

scatter(X1,X2,[],Y)
scatter(X1,X3,[],Y)
scatter(X1,X4,[],Y)
scatter(X1,X5,[],Y)
scatter(X2,X3,[],Y)
scatter(X2,X4,[],Y)
scatter(X2,X5,[],Y)
% scatter(X3,X4,[],Y)
% scatter(X3,X5,[],Y)
% scatter(X4,X5,[],Y)
