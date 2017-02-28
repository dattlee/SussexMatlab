addpath T:\Departments\Informatics\ComputerVision\matlab
% 
% help teachimage
% 
% helpwin
% 

im = teachimage('chess1.bmp');
imshow(im)
% size(im)
% im(120,109) % Y is the X value and visa versa. REMEMBER!

imnew = im;
% imnew(100,:) = 0;
% imshow(imnew)
 
% figure();t = im > 0.5;
% imshow(t)
% 
% figure;s = im <= 0.5;
% imshow(s)
% 
% d = im(:, 100:end) - im(:, 1:end-99);
% imshow(d,[]);

% d(1,1)

f = im(1,1)
g = im(1,2)
f-g
im(1,1)
im(1,1,1)

e = im(100:end,:) - im(1:end-99,:);
figure(2);imshow(e)

