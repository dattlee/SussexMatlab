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
% lambda = 0.1; % used by regularization
% sigma = 0; % used by gaussian
% [five_fold_error, training_error, best_avg, best_std, best_centers, best_weights] = crossValidation5(X,Y,lambda,sigma);
% five_fold_error
% training_error

%% Best Lambda
lambda = 30; % used by regularization
best_training_error = 1000;
best_lambda = 30;
for i = 1:30
    [five_fold_error, training_error, best_avg, best_std, best_centers, best_weights] = crossValidation5(X,Y,lambda,sigma);
    if five_fold_error < best_training_error
        best_training_error = five_fold_error;
        best_lambda = lambda;
    end
    lambda = lambda / 3;
end
parameters = struct('best_lambda',best_lambda, 'best_avg', best_avg, 'best_std',best_std,...
            'best_centers',best_centers, 'best_weights',best_weights);
        
save('parameters.mat','parameters');
%% Luke Test
%testdata = csvread('testdata.csv');

parameters = struct('best_lambda',best_lambda, 'best_avg', best_avg, 'best_std',best_std,...
            'best_centers',best_centers, 'best_weights',best_weights);

% X = testdata;
best_avg = parameters.best_avg;
best_std = parameters.best_std;
best_centers = parameters.best_centers;
best_weights = parameters.best_weights;
sigma = 0; % unused parameter

% Error in the test
luke_predictions = mdl_reg(X, best_avg, best_std, best_centers, best_weights,sigma);

