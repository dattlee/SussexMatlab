function [winner,winnerInd,fitRec,popGens] = Task3(B,V,maxVol,pop,gen,local,cross)
% B = benefit of each gene
% V = volume of each gene
% maxVol = maximum volume of the algorithm
% pop = size of population
% gen = number of generations/matchups. The Algorithm considers the first
%       initialised generation as part of the 'gen' generations
% local = size of the local/neighbourhood search space for a competitor
% cross = crossover probability of genes

    popGens = randi([0 1],pop,length(B)); % Initialise a random population of
                                          % 'pop' individuals
    % popVols = popGens*V'; % Calculate the volume of each phenotype
    % popFits = popGens*B'.*(popVols<=maxVol);  % calculate the the fitness of each
    %                                           % phenotype and set the fitness to 0
    %                                           % if its volume is greater than maxVol

% I FOUND THAT BY USING THE BENEFIT FOR THE FITNESS AND SETTING THE FITNESS TO 0
% IF THE VOLUME WAS TOO LARGE THEN WHEN THE ALGORITHM WAS USED TO SCALE

    % [popFits, popVols] = fitness(maxVol,B,V,popGens);

    % Fitness function mark 1
    % popVols = popGens*V';
    % legal = (popVols<=maxVol)*2-1;
    % popFits = popGens*B'.*legal;

    %Fitness Function mark 2
    popVol = popGens*V';
    legal = popVol<=maxVol;
    popFits = ((popGens*B').*legal) - ((popGens*V')-maxVol).*(1-legal);


    mutRate = 1/length(B);  % mutation rate ** Low enough so that on average
                            % only one gene mutates after evaluation

    fitRec = zeros(pop,gen);
    fitRec(:,1) = popFits;

    for g = 2:gen;

        % Select two individuals at random
        first = randi(pop);
        % Select a competitor from Deme *** Note: local search space maintains diversity
        second = mod((first + randi(local)),pop) + 1; % mod function wraps around
                                                  % +1 prevents 0 index

        % Evaluate strongest individual
        if popFits(first) > popFits(second);
            w = first; % Winner
            l = second; % Loser
        else
            w = second; % Winner
            l = first; % Loser
        end


        % Mutation of the Loser
        for allele = 1:length(B);
            % Random crossover of each gene
            if rand() < cross;
                popGens(l,allele) = popGens(w,allele);
            end
            % Random mutation of an allele
            if rand() < mutRate
                popGens(l,allele) = ~popGens(l,allele);
            end
        end

        %[popVol(l),popFits(l)] = fitness(maxVol, B, V,popGens(l,:))
        % Fitness function failed

        % Fitness function mark 1
        % popVol(l) = popGens(l,:)*V';
        % legal = (popVol(l)<=maxVol)*2-1;
        % popFits(l) = popGens(l,:)*B'.*legal;

        %Fitness Function mark 2
        popVol(l) = popGens(l,:)*V';
        legal = popVol(l)<=maxVol;
        popFits(l) = (popGens(l,:)*B'.*legal) - ((popGens(l,:)*V')-maxVol).*(1-legal);

        % Update fitness record
        fitRec(:,g) = popFits;
    end


    [winner,winnerInd] = max(popFits);

end
