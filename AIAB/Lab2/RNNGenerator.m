function [] = RNNGenerator(dt, T, N, w, Y, b, fig)

% dt  = time slice
% T   = amount of time to run for
% N   = the number of neurons
% w   = the weights, if w is not set then the weights will be randomly set to
%       size NxN
% b   = the biases, if b not set then biases set randomly. 0 parameter sets all
%       biases to 0.
% Y   = initial conditions, if not set then set randomly
% i   = figure number

time= -1:dt:T;  % a time vector

if isequal(w,[])
  W = randn(N); % a random N*N matrix
else
  W = w; % a hand coded 3*3 matrix
end

if isequal(Y,[])
  y =randn(N,length(time)); %initial conditions
else
  y = Y;
end

if isequal(b,[])
  theta = rand(N,1); %the biases
elseif isequal(b,0)
  theta = zeros(N,1);
else
  theta = b; % a hand coded 3*3 matrix
end

%main loop
for i=2:length(time)
 y(:,i) = y(:,i-1) +dt*(-y(:,i-1)+tanh( W*y(:,i-1) +theta));
end

%plot the data
figure(fig); plot(time,y);
