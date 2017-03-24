% Cross Validation
function [five_fold_error, training_error, best_avg, best_std, best_centers, best_weights] = crossValidation5(X,Y,lambda,sigma)
% W are weights to be passed to RBF

inds = randperm(length(Y));

start = 1;
fin = 200;

min_error = 1000;

totalError = 0; % Comulitive error
training_error = 0;
for i = 1:5
x_train = X(inds,:);
y_train = Y(inds,:);
x_test = x_train(start:fin,:);
y_test = y_train(start:fin,:);
x_train(start:fin,:) = [];
y_train(start:fin,:) = [];
test_error = 0;
%% Build Model

% Normalize data and Regularize weights
[mdl_avg, mdl_std, mdl_weights, mdl_centers] = train_mdl_reg(x_train, y_train, lambda,sigma);

% Error in the models
train_predictions = mdl_reg(x_train, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
training_error = training_error + reg_meanSquaredError(y_train,train_predictions,lambda,mdl_weights);

% Error in the test
test_predictions = mdl_reg(x_test, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
test_error = test_error + reg_meanSquaredError(y_test,test_predictions,lambda,mdl_weights);

% Return best model
if test_error < min_error
    min_error = test_error;
    
    best_avg = mdl_avg;
    best_std = mdl_std;
    best_weights = mdl_weights;
    best_centers = mdl_centers;
end

totalError = totalError + test_error;

start = start + 200;
fin = fin + 200;
end

five_fold_error = totalError/5;
training_error = training_error/5;

end