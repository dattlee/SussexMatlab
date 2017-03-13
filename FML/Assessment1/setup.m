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



%% Initialize weights
noInputs = length(X(1,:));
layer1 = 6 % Number of nodes in 1st hidden layer
output = 1 % No nodes in output layer
w1 = ones(layer1,noInputs) % Initilaize weights of first hidden layer
w2 = ones(output,layer1)*2 % Initilaize weights of last hidden layer

w(1,:) = w(1,:) *2 % test: multiply 1 set of weights by 2

a = x(1,:)' %
b = w1 * a
c = w2 * b

