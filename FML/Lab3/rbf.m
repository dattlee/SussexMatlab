%% Question 1 - Data Initialisation
clear;close all; clc;
% We want to plot the function y -> 0.5 + 0.4*sin(2*pi*x) to which we add a
% bit of noise (i.e. gaussian noise of standard variation 0.05). To do so
% you can use the randn() function. 

%Create 30 points uniformly chosen between 0 and 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=linspace(0,1,30); % to complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% % % % We first initilize the y vector as follows
% % %  y=zeros(1,length(x));
% % % % And we then compute the y vector as below:
% % % for i = 1:length(x)
% % %     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %     y(i) = 0.6 + sin(2*pi*x(i))/4 + cos(4*pi*x(i))/4;%to complete
% % %     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % end
y = 0.6 + sin(2*pi.*x)/4 + cos(4*pi.*x)/4;
% add normally dstributed noise
y = y + rand(size(y))/20;
%We then plot the points using the scatter function
figure(1)
% figure('units','normlized','position',[0 1 0 1])
scatter(x,y);
%% Question 2 -Exact Identity RBF
% In this question, you are asked to complete an exact Identity RBF. We
% need to find the function that F(x(i))=y(i) for i =1,...,30, where F(x) =
% sum( wj * (x - xj)^2), j = 1,..,30. 

G = zeros(30,30);
for i = 1:30
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        G(i,j) = sqrt((x(i)-x(j))^2); % to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%You need to compute the weights. You can use the inv() function to
%inverse the G matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = inv(G)*y';% to complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We cr that eate the vectors inputgoes from 0 to 1. We initialise the
% output vector. Now that we know the weight vector, we can compute the 
% forward propagation.
input=linspace(0,1,100);
output=zeros(1,length(input));
for i = 1:length(input)
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        d= sqrt((input(i) - x(j))^2) * W(j); % to complete
        output(i) = output(i) + d; % to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end
% % 
% % inter = sqrt((input.-x)^2)
% % output = W'*input;

%Plot of the data
figure(1)
scatter(x,y)
hold on
plot(input,output)
hold off

%% Exact Gaussian RBF
% In this question, you are asked to complete an exact gaussian RBF. We
% need to find the function that F(x(i))=y(i) for i =1,...,30, where F(x) =
% sum( wj * ((x - xj)^2/sigma)), j = 1..30. 

%This sigma is good enough, you don't need to change it but you can try to
%change it to see what is going on.
sigma = 0.003;

G = double(zeros(30,30));
for i = 1:30
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        G(i,j) = exp(-((x(i)-x(j))^2)/(2*sigma^2)); %to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%You need to compute the weights. You can use the inv() function to
%inverse the G matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = y/G;% to complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%We create the vectors input that goes from 0 to 1. We initialise the
%output vector. Now that we know the weight vector, we can compute the 
%forward propagation.
input=linspace(0,1,1000);
output=zeros(1,length(input));
for i = 1:length(input)
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        d = exp(-((input(i)-x(j))^2)/(2*sigma^2)) * W(j); % to complete
        output(i)= output(i) + d; % to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%Plot of the data
figure(1)
scatter(x,y)
hold on
plot(input,output)
hold off

%% Question 4 - Clustering - kmean algorithm

%Choice of the number of center to use within the k-means algorithm
k=10;

%Using the kmeans function that is implemented within matlab, compute the
%index of the indices and the center associated of the x vector. We want to
%have k-centers using clusetering 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[clustering,C] = kmeans(x',k); % to complete, remove the deal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%We decide the color of the points as a vector of point, Matlab will itself
%define the color of each cluster. 
color=1:k;


%Plot of the data
figure(1)
scatter(x(clustering == 1),y(clustering == 1),'red')
hold on
for i = 2:k
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    scatter(x(clustering == i),y(clustering == i),color(i));% to complete
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
hold off

%% RBFN - Identity
% In this question, you are asked to complete an  Identity RBF. We
% need to find the function that F(x(j))=y(j) for j =1,...,30, where F(x) =
% sum( wi * Phi(norm(x - xi))), i = 1..k. But now you need to use the 
% clusters you previously defined.

G = zeros(k,30);
for i = 1:k
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        G(i,j) = 0;% to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%now you need to compute the weights. You can use the pinv() function to
%inverse the G matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = 0; % to complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%We create the vectors input that goes from 0 to 1. We initialise the
%output vector. Now that we know the weight vector, we can compute the 
%forward propagation.
input=linspace(0,1,100);
output=zeros(1,length(input));
for i = 1:length(input)
    for j = 1:k
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        d=0;% to complete
        output(i)=0;% to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%plot of the points
figure(1)
scatter(x,y)
hold on
plot(input,output)
hold off

%% RBFN - GAUSSIAN
% In this question, you are asked to complete an exact gaussian RBF. We
% need to find the function that F(x(j))=y(j) for j =1..30, where F(x) =
% sum( wi * ((x - xi)^2/sigma)), i = 1..k. 

%This sigma is good enough, you don't need to change it but you can try to
%change it to see what is going on.

sigma = 0.1;

G = zeros(k,30);
for i = 1:k
    for j = 1:30
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        G(i,j) = 0;% to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%now you need to compute the weights. You can use the pinv() function to
%inverse the G matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = pinv(G')*y'; % to complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%We create the vectors input that goes from 0 to 1. We initialise the
%output vector. Now that we know the weight vector, we can compute the 
%forward propagation.
input=linspace(0,1,1000);
output=zeros(1,length(input));
for i = 1:length(input)
    for j = 1:k
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        d=0;% to complete
        output(i)=0;% to complete
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

%Plot of the figure
figure(1)
scatter(x,y)
hold on
plot(input,output)
hold off

