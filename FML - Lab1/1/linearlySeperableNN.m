function weights = NetworkWeights(in, out)

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
            
            if output > 0
                result = 1;
            else
                result = 0;
            end
            
            error(j) = (result - out(j))^2;
            
        end
        
        i = i + 1;
        
    end
    
    if i == 1000
        %weights = 'no weight found';
        weights = hiddenLayer(in, out, noInputs, noInputCases);
    else
        weights = randWeights;
    end
    
end