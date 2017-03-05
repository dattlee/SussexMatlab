% Explore edge options
pkg load image;

%% Load an image
img = imread('fall-leaves.png');  % also available: peppers.png, mandrill.png
figure(1);imshow(img);

%% TODO: Create a Gaussian filter

% % Create a Gaussian filter
filter_size = 31;
filter_sigma = 10 ;
filter = fspecial('gaussian', filter_size, filter_sigma);

% % Apply it
smoothed = imfilter(img, filter);   % default black edges
figure(2);imshow(smoothed);

%% TODO: Apply it, specifying an edge parameter (try different parameters)
smoothed2 = imfilter(img,filter,0); % black
figure(3);imshow(smoothed2);

smoothed3 = imfilter(img,filter,'circular'); % wrap around
figure(4);imshow(smoothed3);

smoothed4 = imfilter(img,filter,'replicate'); % copy edge
figure(5);imshow(smoothed4);

smoothed5 = imfilter(img,filter,'symmetric'); % reflect across edge
figure(6);imshow(smoothed5);


%% Read an image
img = imread('moon.png');  % also try: brooklyn-bridge.png, penny-farthing.png
figure(7);imshow(img);

%% TODO: Add salt & pepper noise
noisy_img = imnoise(img, 'salt & pepper', 0.02);
figure(8);imshow(noisy_img);

%% TODO: Apply a median filter (how is the result different compared to Gaussian smoothing?)
median_filtered = medfilt2(noisy_img); % A median filter in 2 dimentions
figure(9);imshow(median_filtered);
