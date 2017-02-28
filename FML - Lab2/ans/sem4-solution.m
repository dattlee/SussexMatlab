%% Data plotting
% The point of today's seminar is to implement a MLP that will do a
% regression of a function. In order to avoid over fitting, we will add
% some noise.

%We first define a vector of 100 points between 0 and 1, which corresponds 
%to the x coordinate of the points of funtion we want to find
x=rand(100,1);

%We then associate to each x-coordinate the y-coordinate. The function we
%want to find is f: x -> y = sin(2*pi*x) + cos(4*pi*x).
y=zeros(1,length(x));
for i = 1:length(x)
    y(i) = 0.6+sin(2*pi*x(i))/4 + cos(4*pi*x(i))/4 ;%to hide
end


%We then need to add some noise, the noise is taken from a normal
%distribution centered in 0 and of standard deviation 0.1. Use the randn()
%function
y = y + randn(1,length(y))/40;%hide only the last part

figure(1)
scatter(x,y,'b')

%% Initialisation
% We are going to implement a two layer perceptrons to match the data we
% have just created. In order to force you not to copy the lecture slides,
% we will use the different weights notations. The input vector is called
% Input, the intermediary one is called Inter and the final one is called
% Output. The weights that go from Input to Inter are U and the one that go
% from Inter to Output is V.


%We first need to initialise and choose the size of those vectors. We work
%in 2D, we therefore use 2 coordinates for the Input vectors (x and the
% bias) and one coordinate for the output vector (y). We start by arbitrarily 
%choosing to have 3 intermediary states. Therefore U is a matrix of size (2,3) while 
%V is a matrix of size (3,1).

nb_state=3;
U = rand(nb_state,2);
V = rand(1,nb_state);

% Initialisation of empty matrices
Inter=zeros(nb_state,1);
Output=zeros(length(x),1);
Err=zeros(length(x),1);

%You now need to implement the forward step. The sigmoid has already been 
%chosen. It is the g function.
for i = 1:length(x)
    Input=[1,x(i)];
    %What is the intermediary vector?
    for j = 1:nb_state
        Inter(j)=g(Input*U(j,:)');%to remove
    end
    
    %How do you compute the output?
    Output(i)=g(V*Inter);%to remove
    
    %Expression of the error:
    Err(i)=(Output(i)-y(i))^2;
end
sum(Err)

figure(1)
scatter(x,y,'b')
hold on
scatter(x,Output,'r')
hold off

%% Forward propagation and Back propagation
%Here you will also implement the back propagation. By pressing control
%enter a sufficent number of times, you should see that the red dots
%converge to the position of the blue ones. You can also accelarate the
%computation by choosing a greater number of ieration of the update of the
%weights.

nb_iter=1;
eta = 1;

for iter = 1:nb_iter
    for i = 1:length(x)
        Input=[1,x(i)];
        %What is the intermediary vector?
        for j = 1:nb_state
            Inter(j)=g(Input*U(j,:)');%to remove
        end

        %How do you compute the output?
        Output(i)=g(V*Inter);%to remove
       
        %Now you need to compute the Delta and the delta values that you
        %will be able to find within the lecture notes. However you need to
        %be careful with the notations.
        Delta = -(y(i) - Output(i))*g_diff(V*Inter);%to remove
        
        delta = zeros(nb_state,1);
        for j = 1:nb_state
            delta(j)=Delta*V(j)*g_diff(Input*U(j,:)');%to remove
        end
        %Finally you need to update the weights values according to the
        %equation you can find witin the slides.
        for j = 1:2
            for l = 1:nb_state
                U(l,j) = U(l,j) - eta * delta(l)*Input(j);%to remove
            end
        end
        for j = 1:nb_state
            V(j) = V(j) - eta * Delta*Inter(j);%to remove
        end

        %the error is still the same
        Err(i)=(Output(i)-y(i))^2;
    end
end

sum(Err)

figure(1)
scatter(x,y,'b')
hold on
scatter(x,Output,'r')
hold off