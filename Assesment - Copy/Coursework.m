%% Import the data
close all; clear; clc;
data = csvread('data133610.csv');

% data = csvread('testdata.csv');

%% 

% Separate data into Inputs and output
X = data(:,1:(end-1));
Y = data(:,end);
% plot(data,'.')

%% Temp Cross Validation

% trainS = 1;
% trainF = 100;
% testS = 101;
% testF = 1000;
% 
% % Select features 1 and 2 as they corrolate with data
% 
% x_train = X(trainS:trainF,:);
% y_train = Y(trainS:trainF);
% x_test = X(testS:testF,:);
% y_test = Y(testS:testF);

%% Build Model

% lambda = 0.001; % used by regularization
% sigma = 0;
% 
% % Normalize data and Regularize weights
% [mdl_avg, mdl_std, mdl_weights, mdl_centers] = train_mdl_reg(x_train, y_train, lambda,sigma);
% 
% % Error in the models
% train_predictions = mdl_reg(x_train, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
% train_error = reg_meanSquaredError(y_train,train_predictions,lambda,mdl_weights)
% 
% % Error in the test
% test_predictions = mdl_reg(x_test, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
% test_error = reg_meanSquaredError(y_test,test_predictions,lambda,mdl_weights)

%% 5 fold Cross validation
lambda = 0.1; % used by regularization
sigma = 0; % used by gaussian
[five_fold_error, training_error, best_avg, best_std, best_centers, best_weights] = crossValidation5(X,Y,lambda,sigma);
five_fold_error
training_error
%%
% 
% figure(1);scatter(x_test(:,1),test_predictions);
% figure(2);scatter(x_test(:,1),y_test);
% figure(3);scatter(x_test(:,1),test_predictions)

%% Predictions


% testdata = csvread('testdata.csv');


%%
% 
% 
% a = linspace(1,1000,1000);
% b = X(:,2);
% c = Y;
% scatter3(a,b,c);
% xlabel('it');
% ylabel('x1');
% zlabel('output');
%% Luke Test
lambda = 10; % used by regularization
sigma = 0;

% Error in the test
test_predictions = mdl_reg(X, best_avg, best_std, best_centers, best_weights,sigma);
test_error = reg_meanSquaredError(Y,test_predictions,lambda,best_weights)

scatter(X(:,2),test_predictions)
