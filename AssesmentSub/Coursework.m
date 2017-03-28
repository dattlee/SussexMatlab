%% Import the data
close all; clear; clc;
data = csvread('data133610.csv');

X = data(:,1:(end-1));
Y = data(:,end);

%% Best K Means Centers
% This was a brute force method for searching the optiumum number of
% centers
best_training_error = 10000; % High starting Error
% M = 50; % number of centers

no_centers = 1; % Best number of centers found was 9

for i = 1:500
    % Find the Error in each model up to 500 centers
    [five_fold_error, training_error, whitening_matrix, best_centers, best_weights] = crossValidation5guas(X,Y,i);
    
    if five_fold_error < best_training_error
        best_training_error = five_fold_error; 
        no_centers = i;
    end
end

%% Best Lambda

% Brute force search for best lambda for model

sigma = 0; % unused parameter
lambda = 30; % used by regularization

best_training_error = 10000; 
best_lambda = 10000;

% Record to plot lambda against error
lambda_record = zeros(2,30); % row 1 corresponds to lambda, row to corresponds to error

for i = 1:30
    % Lambda to Error Record
    lambda_record(1,i) = lambda;
    
    % To understand implementation of Model open 'crossvalidation5'
    [five_fold_error, training_error, best_avg, best_std, best_centers, best_weights] = crossValidation5(X,Y,lambda,sigma);
    
    if five_fold_error < best_training_error
        best_training_error = five_fold_error;
        best_lambda = lambda; 
    end
    lambda = lambda / 3;
    lambda_record(2,i) = five_fold_error;
end

parameters = struct('best_lambda',best_lambda, 'best_avg', best_avg, 'best_std',best_std,...
            'best_centers',best_centers, 'best_weights',best_weights);

plot(lambda_record(1,:),lambda_record(2,:));title('Change in error with Lambda'),xlabel('Lambda'),ylabel('Error');
save('parameters.mat','parameters');
%% Testdata Precictions
% To  get predictions add the, testdata.csv file to this file and change 
% the matlab current working directory to the file path containing this file

% Then run this data

testdata = csvread('testdata.csv');

parameters = load('parameters.mat');
parameters = parameters.parameters;

X = testdata;
best_avg = parameters.best_avg;
best_std = parameters.best_std;
best_centers = parameters.best_centers;
best_weights = parameters.best_weights;
sigma = 0; % unused parameter

% Predictions with my model
luke_predictions = mdl_reg(X, best_avg, best_std, best_centers, best_weights,sigma);

