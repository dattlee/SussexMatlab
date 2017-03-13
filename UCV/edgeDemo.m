% Edge Detection Demo

%% Read lena image
lena = imread('lena.png');
figure(1), imshow(lena), title('Original image');

%% Convert to monochrome (grayscale) using rgb2gray
lenaMono = rgb2gray(lena);
figure(2), imshow(lena), title('Original image, monochrome');

%% Makee a blurred/smoothed version
h = fspecial('gaussian', [11 11], 4);

% print the filter out
disp(h)
% display the filter as a surface
figure(3), surf(h);


lenaSmooth = imfilter(lenaMono, h);
figure(4), imshow(lenaSmooth), title('Smoothed Image');
%% Method 1: Shift the image left and right and show the difference

lenaL = lenaSmooth;
lenaL(:, [1:(end-1)]) = lenaL(:, [2:end]);
lenaR = lenaSmooth;
lenaR(:, [2:end]) = lenaR(:, [1:(end-1)]);
lenaDiff = double(lenaR) - double(lenaL);
figure(5), imshow(lenaDiff, []), title('Difference between right and left shifted images');

%% Method 2: Canny edge detector

cannyEdges = edge(lenaMono, 'canny');
figure(6), imshow(cannyEdges), title('Original edges');

cannyEdges2 = edge(lenaSmooth, 'canny'); % Edge detection on a smoothed image
figure(7), imshow(cannyEdges2), title('edges of smoothed image');


%% Method 3: Laplacian of Gaussian

logEdges = edge(lenaMono, 'log');
figure(8), imshow(logEdges), title('Original Edges: Laplacian of Gaussian');

logEdges2 = edge(lenaSmooth, 'log');
figure(9), imshow(logEdges2), title('Smooth Edges: Laplacian of Gaussian');

%% Get docs on edge function

doc edge

