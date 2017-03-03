% % Load and display an image
% img = imread('dolphin.png');
% imshow(img);
%
% disp(size(img));
% disp(class(img)); % returns the class of an image
%
% disp(img(101:103,201:203));
% % 81  77  77
% % 81  78  76
% % 82  79  77
%
%
% % Crop an image
% img = imread('bicycle.png');
% imshow(img);
%
% disp(size(img));  % check size
%
% cropped = img(110:310, 10:160);
% imshow(cropped);
%
% % TODO: Find out cropped image size
% size(cropped)

% Color planes
img = imread('fruit.png');
imshow(img);

disp(size(img));

% TODO: Select a color plane, display it, inspect values from a row
red_img = img(:,:,1);
imshow(red_img)
red_img(50,:);
plot(red_img(50,:))
imshow(red_img(1:50,:))
