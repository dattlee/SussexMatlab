function weights = SigmoidNetworkWeights(in, out),
    
    % This function returns the weights for perceptrons of logic operators.
    % The first weight is the weight returned is always the weight for the
    % bias node. The following nodes will be the 
    noInputs = length(in(:,1))+1; % Add 1 for the bias node
    noInputCases = length(in(1,:));
    i = 1;
    error = ones(1,4);
    
    while sum(error) ~= 0 && i < 1000 % The random search
        
        randWeights = randn(1, noInputs);
        error = zeros(1,4); % resets error
        
        for  j = 1:noInputCases
            
            input = [1; in(:,j)];
            output = randWeights * [input];
            
            result = 1/(1+exp(output));
            
            error(j) = (result - out(j))^2;
            
        end
        
        i = i + 1;
        
    end
    
    result

    
    if i == 1000
        weights = 'no weight found';
    else
        weights = randWeights;
    end
    
end