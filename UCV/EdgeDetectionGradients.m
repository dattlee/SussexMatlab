pkg load image;
%
% filt = fspecial('sobel');
%
% disp(filt);
%
% outim = imfilter(double(im),filt);
% imagesc(outim);
% colormap gray;

img = double(imread('octagon.png'))/255; % To set to a number between 0 and 1, as imshow assumes 0-1 range for doubles
figure(1);imshow(img);

[gx gy] = imgradientxy(img, 'sobel');
% REMEBER, above we set each value of the image to a number between 0 and 1.
figure(2);imshow((gx + 4)/8); % to preserve 0,1 range you need to add 4 and divide by 8 after applying the SOBEL mask
% or imshow(gx,[-4 4]) % gives the output range so all numbers are seen
% or imshow(gx,[]) % asssumes the range of the image is the max and minimum values. (can distort image slightly)


[gmag gdir] = imgradient(gx, gy);

figure(3);imshow(gmag/(4*sqrt(2)));
class(gmag)

my_grad = select_gdir(gmag, gdir, 1, 30, 60);
figure(4);imshow(my_grad);
