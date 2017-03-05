function [fitness,volume] = fitness(MAX_VOLUME, B, V,popGens)

  volume = popGens*V'; % Calculate the volume of each phenotype
  legal = (volume<=MAX_VOLUME)*2-1;
  fitness = popGens*B'.*legal;
end
