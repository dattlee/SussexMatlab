function weights = HiddenLayer(in, out, noInputs, noInputCases)

    i = 1;
    error = ones(1,4);
    
    while sum(error) ~= 0 && i < 10000 % The random search
        randWeights = randn(3, noInputs);
        error = zeros(1,4); % resets error
        
        for  j = 1:noInputCases
            
            input = [1; in(:,j)];
            output1 = randWeights(1:2,:) * input;
            
            for k = 1:length(output1)
                if output1(k) >= 0
                    output1(k) = 1;
                else
                    output1(k) = 0;
                end
            end
            
            output2 = randWeights(3,:) * [1; output1];
            
            if output2 >= 0
                result = 1;
            else
                result = 0;
            end
            
            error(j) = (result - out(j))^2;
            
        end
        
        i = i + 1;
        
    end
    
    if i == 1000
        weights = 'no weight found';
    else
        weights = randWeights;
    end
    
end

