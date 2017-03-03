% % % 
% % % Load and display an image
% % % 
img = imread('dolphin.png');
imshow(img);    % Show an image

disp(size(img)); % returns the dimentions of an image
disp(class(img)); % returns the class of an image

disp(img(101:103,201:203));
% 81  77  77
% 81  78  76
% 82  79  77

% % % 
% % % Crop an image
% % % 
img = imread('bicycle.png');
imshow(img);

disp(size(img));  % check size

cropped = img(110:310, 10:160);
imshow(cropped);

%cropped image size
size(cropped)


% % % 
% % % Color planes
% % % 
img = imread('fruit.png');
imshow(img);

disp(size(img));

% TODO: Select a color plane, display it, inspect values from a row
red_img = img(:,:,1);
imshow(red_img)
red_img(50,:);
plot(red_img(50,:))
imshow(red_img(1:50,:))

% % % 
% % % Blending 2 images
% % % 
result = blend(dolphin, bicycle, 0.40);
imshow(result); % note: will result in an error if blend() returns empty or incorrect value


% % % 
% % % Image Difference
% % % 

dolphin = imread('dolphin.png');
bicycle = imread('bicycle.png');

imshow((dolphin-bicycle) + (bicycle-dolphin));


% % pkg load image; % Used by octave, but not matlab
abs_diff2 = imabsdiff(dolphin,bicycle);
imshow(abs_diff2);

% % % 
% % % Generating Gaussian Noise
% % % 
some_numbers = randn([2,3]);
disp(some_numbers);


noise =  randn(1,100);
[n, x] = hist(noise,[-3 -2 -1 0 1 2 3]);
disp([n;x]);

plot(x,n);


noise =  randn(1,10000);
[n, x] = hist(noise,linspace(-3,3,21));
disp([n;x]);

plot(x,n);

% Adding noise to an image
figure(1);imshow(bicycle);
figure(2);imshow(bicycle-uint8(abs(randn(size(bicycle))))*10);

% Set the low and high bounds of the image
imshow(bicycle,[100 101])

