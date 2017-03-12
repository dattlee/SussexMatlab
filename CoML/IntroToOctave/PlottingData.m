
t=[0:0.01:0.98]; % make a list from 0 to 0.98

y1 = sin(2*pi*4*t);
plot(t,y1); % plots data of t on x axis and y1 on y axis

y2 = cos(2*pi*4*t);
plot(t,y1);

%
% REALLY plotting data
%

plot(t,y1); % plot data on figure
hold on; % function to make octave plot new figures on top of the old one
plot(t,y2,'r'); % will now plot cosine function in 'r' (red) on old figures

xlabel('time') % add x axis label to last plot
ylabel('value')  % add y axis label to last plot
legend('sin','cos')  % create legend for plotted data
title('My plot') % create title for figure
print -dpng 'myPlot.png' % saves plotted data as a png file

% you may want to change directory before saving data so...
cd '~\Desktop'; print -dpng 'myPlot.png'

help plot % To see what other formats you can save figures as
close % forces all images/figures to be closed.

%
% creating new images
%
figure(1); plot(t,y1); % specifies the figure number for the plt being made
figure(2); plot(t,y2); % obviously this one is called 'figure 2'

subplot(1,2,1); % divides plot (space in figure) into a 1x2 grid and
                % accesses the first element / grid space
plot(t,y1); % Plots in first space ()
subplot(1,2,2); % accesses the second element in divided plot (hence last 2)
plot(t,y2); % Plots data in second space

axis([0.5 1 -1 1]) % changes axis of current plot to [min(x) max(x) min(y) max(y)]
help axis % for more

clf; % clears figure in current plot

%
% NEAT LITTLE VISULATATION TRICKS
%
A = magic(5)
imagesc(A) % creates a 5x5 colour grid where each color corresponds to a value

imagesc(A), colorbar, colormap gray;
% colorbar, creates a 'key' on the side that shows how colours correspond to values
% colormap gray, sets the colors of each element to a shade of gray

%
% COMMA CHAINING FUNCTION CALLS
%

a=1, b=2, c=3; % Is the same as making 3 statements
% Like this
