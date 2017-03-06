function fitRec = hillClimber(B,V,pop,gen,MAX_VOLUME,generate,mut)
% B - Item Benefits
% V - Item Volumes
% pop - population size
% gen - number of generations to run for
% MAX_VOLUME - Maximum volume knapsack
% generate - 1, to randomly generate population genomes, 0 to set to nothing
% mut - Number of mutations per offspring


    % The genotypes
    if generate
        popGens = randi([0 1],pop,length(B));
    else
        popGens = zeros(pop,length(B));
    end
    popVols = popGens*V';
    popFits = fitness(MAX_VOLUME,B,V,popGens);
    
    fitRec = zeros(1,gen);
    fitRec(1) = max(popFits);
    
    for g = 1:gen % For each generation
    
        tempGens = popGens; % Generate offspring
        
        % Randomly mutate one offspring allele
        for gt = 1:pop % For each genotype in population
            r = randi(10,1,mut);
            tempGens(gt, r) = ~tempGens(gt, r);
        end
        
        [tempFits,tempVols] = fitness(MAX_VOLUME,B,V,tempGens);
        better = tempFits>popFits;
    
        % For each parent ofspring pair, if the offspring is fitter
        % overwrite the parent
        for b = 1:pop
            if better(b)
                popGens(b,:) = tempGens(b,:);
                popFits(b) = tempFits(b);
                popVols(b) = tempVols(b);
            end
        end
    
    fitRec(g) = max(popFits);
    end
end