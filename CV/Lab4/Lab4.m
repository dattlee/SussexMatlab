addpath T:\Departments\Informatics\ComputerVision\matlab



chess = teachimage('chess1.bmp');
imshow(chess);

im = [0 0 0 1 1 0 0; 0 0 1 1 2 1 0;...
0 4 1 1 1 1 0; 0 1 1 1 0 0 0]
[rows,cols,vals] = findpeaks(im)

g = fspecial('gauss', 25, 5);
s = convolve2(image, g, 'reflect');

[rows, cols, vals] = findpeaks(s);

imshow(s);
hold on;
plot(cols, rows, 'g*');
hold off;