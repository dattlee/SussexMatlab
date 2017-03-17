%% Import the data
close all; clear; clc;
data = csvread('data133610.csv');

% Separate data into Inputs and output
X = data(:,1:5);
Y = data(:,6);

%% Assess Data
X1 = X(:,1); % Gaussian
X2 = X(:,2); % Guassian
X3 = X(:,3); % Uniform
X4 = X(:,4); % Uniform
X5 = X(:,5); % Uniform
%%
% Compare data points against each other
subplot(4,3,1), scatter(X1,X2,[],Y)
xlabel('X1'),ylabel('X2');
subplot(4,3,2), scatter(X1,X3,[],Y)
xlabel('X1'),ylabel('X3');
subplot(4,3,3), scatter(X1,X4,[],Y)
xlabel('X1'),ylabel('X4');
subplot(4,3,4), scatter(X1,X5,[],Y)
xlabel('X1'),ylabel('X5');
subplot(4,3,5), scatter(X2,X3,[],Y)
xlabel('X2'),ylabel('X3');
subplot(4,3,6), scatter(X2,X4,[],Y)
xlabel('X2'),ylabel('X4');
subplot(4,3,7), scatter(X2,X5,[],Y)
xlabel('X2'),ylabel('X5');
subplot(4,3,8), scatter(X3,X4,[],Y)
xlabel('X3'),ylabel('X4');
subplot(4,3,9), scatter(X3,X5,[],Y)
xlabel('X3'),ylabel('X5');
subplot(4,3,10), scatter(X4,X5,[],Y)
xlabel('X4'),ylabel('X5');

%%
% help hist
figure(1);

subplot(3,2,1), hist(X1,100), title('X1 Distribution');
xlabel('X1'),ylabel('Total');
subplot(3,2,2), hist(X2,100), title('X2 Distribution');
xlabel('X2'),ylabel('Total');
subplot(3,2,3), hist(X3,25), title('X3 Distribution');
xlabel('X3'),ylabel('Total');
subplot(3,2,4), hist(X4,25), title('X4 Distribution');
xlabel('X4'),ylabel('Total');
subplot(3,2,5), hist(X5,25), title('X5 Distribution');
xlabel('X5'),ylabel('Total');
print -dpng DataDistribution.png

%% Parametric Density Estimation

mu = mean(x); % mean
sigma = std(X); % standard deviation


%x = X; % will result in preprocessed data

% Parametric Density Estimation of 1 and 2 because they are Gaussian
for i = [1 2]
    in = (1/sqrt((2*pi)^size(x,2)*sigma(i)^2)) * exp(-((x(:,i)-mu(i)).^2)./(2 * sigma(i)^2));
    eval(['x' num2str(i) '=in;']);
end 

clear data in i; % clears stated variables from workspace

%%
figure(11); hist(x1,100), title('X1 Distribution');
xlabel('X1'),ylabel('Total');

figure(12); hist(x2,100), title('X2 Distribution');
xlabel('X2'),ylabel('Total');

%% Normalise data
% 
% X_avg = mean(X);
% X_std = std(X);
% x = X;
% 
% for i = 1:length(X(1,:))
%     x(:,i) = X(:,i) - X_avg(i);
%     x(:,i) = X(:,i) / X_std(i);
% end
% 
% X1 = x(:,1); % Gaussian
% X2 = x(:,2); % Guassian
% X3 = x(:,3); % Uniform
% X4 = x(:,4); % Uniform
% X5 = x(:,5); % Uniform
% 
% figure(1);gplotmatrix(x,Y);
% figure(2);gplotmatrix(X,Y);

%% Initialize weights

noInputs = length(X(1,:))+1; % Number of nodes in 1st hidden layer (5 features + bias)

hidden1 = length(X(1,:))+1; % Number of nodes in 1st hidden layer (5 features + bias)
output = 1 ;% No nodes in output layer

w1 = ones(hidden1,noInputs); % Initilaize weights of first hidden layer
w2 = ones(output,hidden1); % Initilaize weights of last hidden layer

w(1,:) = w(1,:) *2; % test: multiply 1 set of weights by 2

a = x(1,:)'
b = w1 * a
c = w2 * b

%% COMPLETED COURSEWORK



k = 1000;
color=1:k;
x = featScale(X);


[clustering,C] = kmeans(x,k);

G = pdist2(C,x);
% % Linear
% G = sqrt(G.^2);
% Gaussian
sigma = 0.03;
G = (exp(-(G).^2)/(2*sigma^2));
% 
W = pinv(G')*Y;
% 
% input=linspace(0,1,1000);
% output=zeros(1,length(input));

output = W'*G;
% for i = 1:length(input)
%     for j = 1:k
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         d=sqrt((input(i)-C(j))^2);% to complete
%         output(i)=output(i)+W(j)*d;% to complete
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     end
% end

% %plot of the points
% figure(1)
% scatter(x,y)
% hold on
% plot(input,output)
% hold off

figure(1); scatter(x(:,1),Y);
figure(2); scatter(x(:,1),output);

%%

a = (x(:,1:5));
b = Y(:,1);
m=a(clustering == 1);
n=b(clustering == 1);
o=color(1);

gplotmatrix(m,n)
hold on
%%
for i = 2:k
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    gplotmatrix(a(clustering == i),b(clustering == i),color(i))% to complete
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
xlabel('x'),ylabel('y');


















