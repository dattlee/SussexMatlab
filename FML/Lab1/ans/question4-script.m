%% Introduction
% I divided the code into section, that can be run separetaly using control
% + enter. Please read all the comments before each line and then run
% control+enter to see the output.

%% Data loading and vizualisation
% The first thing to do is to load the data, we use the following function
% that put the data into a matrix called data. If you were to doublie click
% onto the matrix, you will see that first column (data(:,1)) is x
% coordinates of the points, the second column (data(:,2)) is the y
% coordinate of the points and the last one (data(:,3)) is the target
% value.
load('sem2a_q4_linsep_data.mat');

%Thanks to the find function, we are able to find the position of the
%indices of the third column of data that are equal to +1 in p1 and to -1
% in p0.
p1=find(data(:,3)==1);
p0=find(data(:,3)==-1);

%We now plot those points thanks to the scatter function of matlab. We plot
%the points that have a target value of 1 in red ('r') and the points that 
%have a target value of -1 in blue ('b'). The scatter function takes as
%input two vectors, the first one (e.g. data(p1,1)) is the x coordinates of
%the points and the second one (e.g. data(p1,2)) is the y coordinates of
%the points.
figure(1)
scatter(data(p1,1),data(p1,2),'r')
hold on
scatter(data(p0,1),data(p0,2),'b')
hold off

%% First border - below all the points
% The classification line is defined as w(1) + w(2)x + w(3)y=0. We first 
%define a random w. And then we need to define the classification line 
%itself. In matlab and in any other programming language you cannot define 
%continuous line. Instead what we will do is to define a vector x that is
%made of 101 points between 0 and 1 and for each of the value of x, we will
%compute the associated y value: y(i) = - (w(1) + w(2)*x(i))/w(3)
w=[-1,1,-1];

%definition of x
x=(0:0.01:1); 
%we initiate y to zeros so that Matlab creates a space within its memory 
%for the y vector and we then compute its values
y=zeros(length(x),1); 
for i = 1:length(x)
    y(i) = - (w(1) + w(2)*x(i))/w(3);
end

%We now plot the line and the points, remember to use the hold on function
figure(1)
scatter(data(p1,1),data(p1,2),'r')
hold on
scatter(data(p0,1),data(p0,2),'b')
plot(x,y)
title('Plot of the data and the border')
hold off 

%We now print the value of the classification. The classification is made
%thanks to the dot product between the weights w and the position of the
%point. You can see that because the classification line is below all the
%points (i.e., the points are on the side of the decision boundary opposite
%to the direction of the weight vector, all the dot products are negative.
classification=zeros(100,1);
for i = 1:100
    classification(i)=dot([1,data(i,1),data(i,2)],w);
end
classification

%% Second border - above all the points
% We now change the weights, so that the decision boundary is above all 
% the points. You shall observe that now the classification only returns
% positive values.
w=[1,1,-1];

%definition of x
x=(0:0.01:1); 
%we initiate y to zeros so that Matlab creates a space within its memory 
%for the y vector and we then compute its values
y=zeros(length(x),1); 
for i = 1:length(x)
    y(i) = - (w(1) + w(2)*x(i))/w(3);
end

%We now plot the line and the points, remember to use the hold on function
figure(1)
scatter(data(p1,1),data(p1,2),'r')
hold on
scatter(data(p0,1),data(p0,2),'b')
plot(x,y)
title('Plot of the data and the border')
hold off 

%We now print the value of the classification. The classification is made
%thanks to the dot product between the weights w and the position of the
%point. You can see that because the classification line is above all 
%points, all the dot products are now positive.
classification=zeros(100,1);
for i = 1:100
    classification(i)=dot([1,data(i,1),data(i,2)],w);
end
classification


%% Perceptron implementation
% We will now update the value of the parameters weight. So we upadte the
% weight if and only if there is an error. For each point, 
% point=[1,data(ind,1),data(ind,2)], there is an error if the dot product
% between w and point is of the sign of t = data(ind,3), the target. We
% update the paramters value as explained in the pdf file. If you run that
% section a sufficient number of times, you should be able to see that line
% converging to its final best state. To do so please press control + enter
% when this section is highlighted in yellow.

eta=0.01;

for ind = 1:100
    point=[1,data(ind,1),data(ind,2)];
    
    sign_given_by_line = sign(dot([1,data(ind,1),data(ind,2)],w));
    if sign_given_by_line ~= data(ind,3)
        w_old=w;
        w = w_old + eta*point*data(ind,3); % Gradient of Perceptron criterion
    end
end


%When the weight have now been updated we plot the figure again
figure(1)
scatter(data(p1,1),data(p1,2),'r')
hold on
scatter(data(p0,1),data(p0,2),'b')
dx=[min(data(:,1)),max(data(:,1))];
y=zeros(length(dx),1);

for i = 1:length(dx)
    y(i) = - (w(1) + w(2)*dx(i))/w(3);
end
plot(dx,y)
axis equal
title('Plot of the training data and the border')
hold off 

