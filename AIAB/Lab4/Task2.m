function [winner,winnerInd,fitRec,popGens] = Task2(B,V,maxVol,pop,gen,local)
% B = benefit of each gene
% V = volume of each gene
% maxVol = maximum volume of the algorithm
% pop = size of population
% gen = number of generations/matchups. The Algorithm considers the first
%       initialised generation as part of the 'gen' generations
% local = size of the local/neighbourhood search space for a competitor

    popGens = randi([0 1],pop,length(B)); % Initialise a random population of
                                          % 'pop' individuals
    popVols = popGens*V'; % Calculate the volume of each phenotype
    popFits = popGens*B'.*(popVols<=maxVol);  % calculate the the fitness of each
                                              % phenotype and set the fitness to 0
                                              % if its volume is greater than maxVol
    cross = 0.5; % percentage chance of crossover
    mutRate = 1/length(B); % mutation rate

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

        % Copy Winner over Loser
        popGens(l,:) = popGens(w,:);

        % Add a random mutation to the Loser
        allele = randi(length(B));
        popGens(l,allele) = ~popGens(l,allele);

        % Update volume of Loser
        popVols(l) = popGens(l,:)*V';

        % Update fitness of Loser
        popFits(l) = (popGens(l,:)*B')*(popVols(l)<=maxVol);

        % Update fitness record
        fitRec(:,g) = popFits;
    end


    [winner,winnerInd] = max(popFits);

end
