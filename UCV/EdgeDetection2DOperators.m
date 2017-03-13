% For Your Eyes Only
% pkg load image;

frizzy = imread('frizzy.png');
froomer = imread('froomer.png');
imshow(frizzy);
imshow(froomer);

% TODO: Find edges in frizzy and froomer images
x = edge(frizzy(:,:,1),'canny')
y = edge(frizzy(:,:,2),'canny')
z = edge(frizzy(:,:,3),'canny')
all = x+y+z
figure(1);imshow(all)

x = edge(froomer(:,:,1),'canny')
y = edge(froomer(:,:,2),'canny')
z = edge(froomer(:,:,3),'canny')
all = x+y+z
figure(2);imshow(all)


frizzy_gray = rgb2gray(frizzy)
froomer_gray = rgb2gray(froomer)
%%
frizzyEdges = edge(frizzy_gray,'log')
figure(1);imshow(frizzyEdges)
%%
frizzyEdges2 = edge(frizzy_gray,'canny')
figure(2);imshow(frizzyEdges)
%%
froomerEdges = edge(froomer_gray, 'canny')
%%

% TODO: Display common edge pixels
same = froomerEdges & frizzyEdges
imshow(same);