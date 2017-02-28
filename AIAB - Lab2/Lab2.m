% Build a 1 node Neural Network

% Randomly set weights
RNNGenerator(0.01,100,1,[],[],0,1)
print -dpng 1NodeRandW.png

% Set weights low
w1 = [0.01];
RNNGenerator(0.01,100,1,w1,[],0,2)
print -dpng 1Node001W.png

% Set weights low
w1 = [1];
RNNGenerator(0.01,100,1,w1,[],0,3)
print -dpng 1Node1W.png

% Set weights
w1 = [10];
RNNGenerator(0.01,100,1,w1,[],0,4)
print -dpng 1Node10W.png


% Build a 2 node Neural Network

% Randomly set weights
RNNGenerator(0.01,100,2,[],[],0,5)
print -dpng 2NodeSetW.png

% Set weights decaying
w2 = [1 1; -0.5 1];
RNNGenerator(0.01,100,2,w2,[],0,6)
print -dpng 2NodeDecayW.png

% Set weights stable
w2 = [2 2; -2 2];
RNNGenerator(0.01,100,2,w2,[],0,7)
print -dpng 2NodeStableW.png


% Set weights decaying
w2 = [1 1; -2 1];
RNNGenerator(0.01,100,2,w2,[],0,11)
print -dpng 2NodeDecayW.png



% Build a 100 node Neural Network
% Randomly set weights. CHAOS
RNNGenerator(0.01,100,100,[],[],0,8)
print -dpng ChaosNodeRandW.png

% Randomly set weights. CHAOS
RNNGenerator(0.01,100,100,randi([50 100],100,100),[],0,9)
print -dpng ChaosNodeHighW.png

% Randomly set weights. CHAOS
RNNGenerator(0.01,100,100,rand(100,100),[],0,10)
print -dpng ChaosNodeLowW.png