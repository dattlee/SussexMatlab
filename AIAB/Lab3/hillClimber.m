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

popVols = popGens*V';
popFits = popGens*B'.*(popVols<=20);

gen = 100;

fitRec = zeros(pop,gen);
fitRec(:,1) = popFits;

for g = 1:gen
    
    tempGen = popGens;
    
    for p = 1:pop
        r = randi(10);
        tempGen(p, r) = ~tempGen(p, r);
    end
    
    tempVols = tempGen*V';
    tempFits = tempGen*B'.*(tempVols<=20);
    better = tempFits>popFits;
    
    for b = 1:pop
        if better(b)
            popGens(b,:) = tempGen(b,:);
            popFits(b,:) = tempFits(b,:);
            popVols(b,:) = tempVols(b,:);
        end
    end
    
    fitRec(:,g) = popFits;
end
    
%
x = linspace(1,100,gen); % Linspace has a maximum val of 100
plot(x,fitRec');

%index of the smallest in the population and an index of the largest
[mi,miI] = min(popFits);
[ma,maI] = max(popFits);