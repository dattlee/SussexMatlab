%David Attlee, Simple Neural Network

% AND Gate
AND_In = [[0;0],[1;0],[0;1],[1;1]];
AND_Out = [0 0 0 1];

% OR Gate
OR_In = [[0;0],[1;0],[0;1],[1;1]];
OR_Out = [0 1 1 1];

% XOR Gate
XOR_In = [[0;0],[1;0],[0;1],[1;1]];
XOR_Out = [0 1 1 0];

% NOT Gate
NOT_In = [0 1];
NOT_Out = [1 0];

% NAND Gate
NAND_In = [[0;0],[1;0],[0;1],[1;1]];
NAND_Out = [1 1 1 0];



% Random AND
RAND = 'Random Weight AND GATE'
andWeights = rand(1,2);
for i = (1:4)
    input = AND_In(:,i);
    output = andWeights * input;
    if output <= 0.5
        result = 0;
    else
        result = 1;
    end
    
    error = AND_Out(i) - result; % correct if returns 0 for all inputs
end

% Random OR Gate
ROR = 'Random Weight OR GATE'
orWeights = rand(1,2);
for i = (1:4)
    input = OR_In(:,i);
    output = orWeights * input;
    if output <= 0.5
        result = 0;
    else
        result = 1;
    end
    
    error = OR_Out(i) - result; % correct if returns 0 for all inputs
end

% Random XOR Gate
RXOR = 'Random Weight XOR GATE'
xorWeights = rand(1,2);
for i = (1:4)
    input = XOR_In(:,i);
    output = xorWeights * input +0.5;
    if output <= 0.5
        result = 0;
    else
        result = 1;
    end
    
    error = XOR_Out(i) - result; % correct if returns 0 for all inputs
end

% Random NOT Gate
RNOT = 'Random Weight NOT GATE'
notWeight = randn(); % need to use randn() to get negitive valued weights.
for i = (1:2)
    input = NOT_In(i);
    output = input * notWeight;
    if output < -0.5
        result = 0;
    else
        result = 1;
    end
    
    error = (NOT_Out(i) - result).^2;
end


% Random NAND Gate
RNAND = 'Random Weight NAND GATE'
nandWeight = randn(1,2); % need to use randn() to get negitive valued weights.
for i = (1:4)
    input = NAND_In(i);
    output = nandWeight * input;
    if output < 0.5
        result = 1;
    else
        result = 0;
    end
    
    error = (NAND_Out(i) - result).^2;
end



% Threshold of 0.5 to return 0 or 1
%
% Handwritten AND
AND = 'AND GATE'

for i = (1:4)
    input = AND_In(:,i);
    output = [0.5 0.5] * input;
    if output <= 0.5
        result = 0;
    else
        result = 1;
    end
    
    error = AND_Out(i) - result; % returns 0 for all inputs
end

plotGraph(AND_In,AND_Out,1,'AND Gate');


% Handwritten OR Gate
OR = 'OR GATE'
for i = (1:4)
    input = OR_In(:,i);
    output = [0.5 0.5] * input +0.5;
    if output <= 0.5
        result = 0;
    else
        result = 1;
    end
    
    error = OR_Out(i) - result; % returns 0 for all inputs
end

plotGraph(OR_In,OR_Out,2,'OR Gate');


% Handwritten NOT Gate
NOT = 'NOT GATE'
for i = (1:2)
    input = NOT_In(i);
    output = input * -1;
    if output < -0.5
        result = 0;
    else
        result = 1;
    end
    
    error = (NOT_Out(i) - result).^2;
end


% Handwritten NAND Gate
NAND = 'NAND GATE'
for i = (1:4)
    input = NAND_In(:,i);
    output = [0.5 0.5] * input;
    if output <= 0.5
        result = 1;
    else
        result = 0;
    end
    
    error = (NAND_Out(i) - result).^2;
end

plotGraph(NAND_In,NAND_Out,3,'NAND Gate');


% % No bias nodes used. Threshold created instead.


% XOR Gate
XOR = 'XOR GATE'

xorWeights1 = [20 20 -10; -20 -20 30]; % Third is the bias (-10 and 30)
xorWeights2 = [20 20 -30];


for i = (1:4)
    input = XOR_In(:,i);
    layer1 = xorWeights1 * [input; 1];
    
    for j = 1:length(layer1),
        if layer1(j) >= 0,
            layer1(j) = 1;
        else
            layer1(j) = 0;
        end
    end
    
    layer2 = xorWeights2 * [layer1;1];
    if layer2 >=0,
        layer2 = 1;
    else
        layer2 = 0;
    end    
    error = XOR_Out(i) - layer2;
end

% plot(AND_In, AND_Out)

NetworkTests = 'Random weight generator'

NetworkWeights(AND_In,AND_Out)
NetworkWeights(NAND_In,NAND_Out)
NetworkWeights(OR_In,OR_Out)
NetworkWeights(NOT_In,NOT_Out)

NetworkWeights(XOR_In,XOR_Out)

SigmoidNetworkWeights(AND_In,AND_Out)


