
% The Items
B = [5 6 1 9 2 8 4 3 7 10];
V = [3 2 4 5 8 9 10 1 6 7];

pop = 100;

popGens = zeros(pop,length(B));
popFits = zeros(pop,1);

for p = 1:pop
    % Encode a phenotype
    PT = zeros(10,1);
    vol = V*PT;
    if vol>20
        fit = 0;
    else
        fit = B*PT;
    end

    % number of generations
    gen = 100;

    % fitness record
    fitRec = zeros(gen,1);

    for g = 1:gen
        % random mutation
        mPT = PT;
        n = randi(10);
        mPT(n) = ~mPT(n);

        mutatedVol = V*mPT;
        mutatedFit = B*mPT;

       if mutatedVol > 20
           mutatedFit = 0;
       end

       if mutatedFit > fit
           PT = mPT;
           vol = mutatedVol;
           fit = mutatedFit;
       end

       fitRec(g) = fit;
    end
    
    popGens(p,:) = PT;
    popFits(p) = fit;
    
end


%
% x = linspace(1,100,gen); % Linspace has a maximum val of 100
% plot(x,fitRec);

%index of the smallest in the population and an index of the largest
[mi,miI] = min(popFits);
[ma,maI] = max(popFits);





% % 
% % 
% % Multiple mutations at once
% % 
% % By mutating multiple genes at once you are less likely to get stuck at
% % local minima
% % 
B = [5 6 1 9 2 8 4 3 7 10];
V = [3 2 4 5 8 9 10 1 6 7];

pop = 100;
popGens = zeros(pop,length(B));
popFits = zeros(pop,1);

for p = 1:pop
    % Encode a phenotype
    PT = zeros(10,1);
    vol = V*PT;
    if vol>20
        fit = 0;
    else
        fit = B*PT;
    end

    % number of generations
    gen = 100;

    % fitness record
    fitRec = zeros(gen,1);

    for g = 1:gen
        % random mutation
        mPT = PT;
        n = randi(10,1,3);
        mPT(n) = ~mPT(n);

        mutatedVol = V*mPT;
        mutatedFit = B*mPT;

       if mutatedVol > 20
           mutatedFit = 0;
       end

       if mutatedFit > fit
           PT = mPT;
           vol = mutatedVol;
           fit = mutatedFit;
       end

       fitRec(g) = fit;
    end
    
    popGens(p,:) = PT;
    popFits(p) = fit;
    
end


[mi,minI] = min(popFits);
[ma,maxI] = max(popFits);


% % % 
% % % 
% % % 
% % % VECTORIZED
% % % 
% % % 
% % % 
% % % 

% The Items
B = [5 6 1 9 2 8 4 3 7 10];
V = [3 2 4 5 8 9 10 1 6 7];

pop = 100;

popGens = randi([0 1],pop,length(B));
popFits = popGens*B';
popVols = popGens*V';
popFits = (popFits.*(popVols>20));



for p = 1:pop
    % Encode a phenotype
    PT = zeros(10,1);
    vol = V*PT;
    if vol>20
        fit = 0;
    else
        fit = B*PT;
    end

    % number of generations
    gen = 100;

    % fitness record
    fitRec = zeros(gen,1);

    for g = 1:gen
        % random mutation
        mPT = PT;
        n = randi(10);
        mPT(n) = ~mPT(n);

        mutatedVol = V*mPT;
        mutatedFit = B*mPT;

       if mutatedVol > 20
           mutatedFit = 0;
       end

       if mutatedFit > fit
           PT = mPT;
           vol = mutatedVol;
           fit = mutatedFit;
       end

       fitRec(g) = fit;
    end
    
    popGens(p,:) = PT;
    popFits(p) = fit;
    
end



%
% x = linspace(1,100,gen); % Linspace has a maximum val of 100
% plot(x,fitRec);

%index of the smallest in the population and an index of the largest
[mi,miI] = min(popFits);
[ma,maI] = max(popFits);










