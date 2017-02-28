% Build a 1 node Neural Network

% Randomly set weights
RNNGenerator(0.01,100,1,[],[],0,1)

% Set weights
w1 = [1];
RNNGenerator(0.01,100,1,w1,[],0,2)

% Build a 1 node Neural Network
% Randomly set weights
RNNGenerator(0.01,100,2,[],[],0,3)
% % Set weights
% w1 = [1];
% RNNGenerator(0.01,100,1,w1,[],0,21)



% Build a 100 node Neural Network
% Randomly set weights
RNNGenerator(0.01,100,100,[],[],0,4)
