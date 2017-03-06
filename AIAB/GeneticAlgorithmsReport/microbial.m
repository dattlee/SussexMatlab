function [winner,winnerInd,fitRec,popGens] = microbial(B,V,pop,gen,MAX_VOLUME,generate,mut,local,cross)
% B             - benefit of each gene
% V             - volume of each gene
% MAX_VOLUME    - maximum volume of the algorithm
% pop           - size of population
% gen           - number of generations/matchups. The Algorithm considers the first
%                 initialised generation as part of the 'gen' generations
% generate      - 1, to randomly generate population genomes, 0 to set to nothing
% mut           - Mutation proportion (1 would be 1/length(B))
% local         - size of the local/neighbourhood search space for a competitor
% cross         - crossover probability of genes

    % The genotypes
    if generate
        popGens = randi([0 1],pop,length(B));
    else
        popGens = zeros(pop,length(B));
    end
    [popFits,popVols] = fitness(MAX_VOLUME,B,V,popGens);

    mutRate = mut/length(B);  % mutation rate ** Low enough so that on average
                            % only one gene mutates after evaluation

    fitRec = zeros(1,gen);
    fitRec(1) = max(popFits);

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

        
        [popFits(l),popVols(l)] = fitness(MAX_VOLUME,B,V,popGens(l,:));
        
        % Update fitness record
        fitRec(g) = max(popFits);
    end

    [winner,winnerInd] = max(popFits);

end