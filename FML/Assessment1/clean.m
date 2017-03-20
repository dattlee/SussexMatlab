%% Import the data
close all; clear; clc;
data = csvread('data133610.csv');
% data = csvread('data163318.csv');

% Separate data into Inputs and output
X = data(:,1:(end-1));
Y = data(:,end);


%% RBF Implementation

k = 100; % Number of centers
color=1:k; % Colours to distingish kmeans
x = featScale(X); % Normalization

trainS = 1;
trainF = 600;
testS = 601;
testF = 1000;

% [trainOutput,centers,weights] = rbf(x(trainS:trainF,1:2), Y(trainS:trainF), k, 'Linear ', []);
[trainOutput,centers,weights] = rbf_reg(x(trainS:trainF,1:2), ...
                                Y(trainS:trainF), k, 'Linear', [] , 0.1);

% BEST
% [trainOutput,centers,weights] = rbf_reg(x(trainS:trainF,1:2), ...
%                                 Y(trainS:trainF), k, 'Linear', [] , 0.1);
fprintf('\nErrors for this run:\n\n');

% Calculate Mean Squared Errors
m = length(Y(trainS:trainF));
ETrain = (1/(m))*sum((trainOutput-Y(trainS:trainF)').^2)

% Test Data

G = pdist2(centers,x(testS:testF,1:2));
testOutput = weights'*G;

% Calculate Mean Squared Errors
m = length(Y(testS:testF));
ETest = (1/(m))*sum((testOutput-Y(testS:testF)').^2)

fprintf('\n\n\n\n\n');
pause;
% Plot data

figure(1); scatter(x(:,1),Y,'g');
hold on;
scatter(x(trainS:trainF,1),trainOutput,'b');
scatter(x(testS:testF,1),testOutput,'r');
hold off;

%%
% surf(x(:,1:2), Y);

%% Cross Validation
N = 4;
cvpartition(Y,'k',N);
% %
% %
% % P. Flach, Machine Learning: the Art and Science of
% % Algorithms that Make Sense of Data, Cambridge University
% % Press, 2012.
% % � S. Rogers and M. Girolami, A First Course in Machine
% % Learning, Chapman & Hall, 2011.
% % � C. M. Bishop, Pattern Recognition and Machine Learning,
% % Springer, 2007.
