linear = importdata('/Users/Dattlee/Developer/SussexFML/lab1/linsep.mat');

X = linear(:,1:(end-1));
Y = linear(:,end);

figure(1);scatter(X(:,1),X(:,2),[],Y)

xlabel('x1') % add x axis label to last plot
ylabel('x2')  % add y axis label to last plot
title('Data')

Xt = [ones(length(X(:,1)),1),X];

w = zeros(length(Xt(1,:)),1);
iterations = 100;
learn = 1;

for i = 1:iterations
  temp_w = w-(1*sum(Xt))';
  w = temp_w;
end


x1 = linspace(0, 1, 101);
y = x1;
for i = 1:length(x1),
  y(i) = (sum(x1(i)*w));
end

% Grid over which we will calculate J
% w * x1(3)
%
% x1(3)

fprintf('figuring something out. Program paused. Press enter to continue.\n');    %%% DELETELINE
pause;                                                    %%% DELETELINE


% theta1_vals = linspace(-1, 4, 100);
hold on;
plot(x1,y, '-')
% legend('Training data', 'Linear regression')
% hold off
