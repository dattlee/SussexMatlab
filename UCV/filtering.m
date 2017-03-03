% % % Practice
% hsize = 31;
% sigma = 10;
% h = fspecial('gaussian', hsize,sigma);
% 
% figure(4);surf(h)
% figure(5);imagesc(h)
% saturn = imread('saturn.png'); 
% figure(1);imshow(saturn);%imfilter(saturn,h));
% 
% noise = randn(size(saturn));
% noisySaturn = saturn + uint8(noise*sigma);
% figure(2);imshow(noisySaturn);
% 
% smoothedSaturn = imfilter(noisySaturn,h);
% figure(3);imshow(smoothedSaturn);


% % Removing noise with a Gaussian filter
img = imread('saturn.png'); 
imshow(img);

% % Add some noise
noise_sigma = 25;
noise = randn(size(img)) .* noise_sigma;
noisy_img = img + uint8(abs(noise));
imshow(noisy_img);

% % Create a Gaussian filter
filter_size = 11; 
filter_sigma = 2;
% pkg load image; % Octave only
filter = fspecial('gaussian', filter_size, filter_sigma);

% % Apply it
smoothed = imfilter(noisy_img, filter);
imshow(smoothed);