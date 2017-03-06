function [fitness,volume] = fitness(MAX_VOLUME, B, V,popGens)
  
  volume = popGens*V'; % Calculate the volume of each phenotype
  legal = volume<=MAX_VOLUME;
  fitness = ((popGens*B').*legal) - ((popGens*V')-MAX_VOLUME).*(1-legal);

end
