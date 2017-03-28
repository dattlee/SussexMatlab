% Cross Validation
function [five_fold_error, training_error, whitening_matrix, best_centers, best_weights] = crossValidation5guas(X,Y,M)
% W are weights to be passed to RBF

    inds = randperm(length(Y));
    
    start = 1;
    fin = 200;
    
    min_error = 1000;
    
    totalError = 0; % Cumulitive error
    training_error = 0;
    
    for i = 1:5
        x_train = X(inds,:);
        y_train = Y(inds,:);
        x_test = x_train(start:fin,:);
        y_test = y_train(start:fin,:);
        x_train(start:fin,:) = [];
        y_train(start:fin,:) = [];
        test_error = 0;

        % Normalize data and Regularize weights
        [whMat, sigma, mdl_weights, mdl_centers] = train_mdl_guas(x_train, y_train,M);

        % Error in the model
        train_predictions = mdl_gaus(x_train,whMat, mdl_centers, mdl_weights,sigma);
        % Calculate training Error
        training_error = training_error + meanSquaredError(y_train,train_predictions);
        
        % Error in the test
        test_predictions = mdl_gaus(x_test,whMat, mdl_centers, mdl_weights,sigma);
        % Calculate Test Error
        test_error = test_error + meanSquaredError(y_test,test_predictions);
        
        % Save the prameters if the error is lower than one of the previous
        % models
        if test_error < min_error
            min_error = test_error;
            
            whitening_matrix = whMat;
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