% Cross Validation
function error = crossValidation5(X,Y)
% W are weights to be passed to RBF

inds = randperm(length(Y));

x = X(inds,:);
y = Y(inds,:);

start = 1;
fin = 200;

totalError = 0; % Comulitive error

for i = 1:5
x_test = x(start:fin,:)
y_test = y(start:fin,:)
    %% Build Model

lambda = 0.001; % used by regularization
sigma = 0.035;

% Normalize data and Regularize weights
[mdl_avg, mdl_std, mdl_weights, mdl_centers] = train_mdl_reg(x_train, y_train, lambda,sigma);

% Error in the models
train_predictions = mdl_reg(x_train, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
train_error = reg_meanSquaredError(y_train,train_predictions,lambda,mdl_weights)

% Error in the test
test_predictions = mdl_reg(x_test, mdl_avg, mdl_std, mdl_centers, mdl_weights,sigma);
totalError = reg_meanSquaredError(y_test,test_predictions,lambda,mdl_weights)

end


end