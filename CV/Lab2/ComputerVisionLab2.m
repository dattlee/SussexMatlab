addpath T:\Departments\Informatics\ComputerVision\matlab

im = teachimage('chess1.bmp');
imshow(im)

% % Lecture slide examples

maximum = max(im(:))
minimum = min(im(:))
average = mean(im(:))
standard_deviation = std(im(:))

reg = im(100:150, 280:330);
imshow(reg);
cropsize = size(reg)
% % ans = 51 51
cropaverage = mean(reg(:))
% % ans = 0.3099

 