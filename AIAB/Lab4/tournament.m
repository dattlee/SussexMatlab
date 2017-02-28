function [winner,winnerInd,fitRec,popGens] = tournament(B,V,maxVol,pop,gen)
% B = benefit of each gene
% V = volume of each gene
% maxVol = maximum volume of the algorithm
% pop = size of population
% gen = number of generations/matchups

    popGens = randi([0 1],pop,length(B));
    popVols = popGens*V';
    popFits = popGens*B'.*(popVols<=maxVol);
    local = 10; % size local search space when picking matchup
    cross = 0.5; % percentage chance of crossover
    mutRate = 1/length(B); % mutation rate
    
    fitRec = zeros(pop,gen+1);
    fitRec(:,1) = popFits;

    for g = 1:gen;
        A = randi(pop);
        C = mod((A + randi(local)),pop) + 1;
        
        if popFits(A) > popFits(C)
            w = A; % Winner
            l = C; % Loser
        else
            w = C; % Winner
            l = A; % Loser
        end
            %random chance of recieving each gene
        for allele = 1:length(B)
            if rand() < cross
                popGens(l,allele) = popGens(w,allele);
            end
            if rand() < mutRate
                popGens(l,allele) = ~popGens(l,allele);
            end
        end
        
        popVols(l) = popGens(l,:)*V';
        
%         (popGens(l,:)*B')
%         (popVols(l)<=maxVol)
        popFits(l) = (popGens(l,:)*B')*(popVols(l)<=maxVol);
                
        fitRec(:,g+1) = popFits;       
    end

    
    [winner,winnerInd] = max(popFits);
    
end