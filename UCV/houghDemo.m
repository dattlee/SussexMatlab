%% Hough Demo

img = imread('shapes.png');
grays = rgb2gray(img);
edges = edge(grays,'canny');

figure(1), imshow(img), title('Original image');
figure(2), imshow(grays), title('Greyscale image');
figure(3), imshow(edges), title('Edge image');

% % hough() % Matlab
% % houghtf() % Octave
% % doc hough

[accum, theta, rho] = hough(edges); % Matlab
figure(4), imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');


%% Find peaks in the Hough accumulato0r matrix
peaks = houghpeaks(accum,100);
hold on; plot(theta(peaks(:,2)), rho(peaks(:,1)), 'rs'); hold off;

size(peaks);

%% Find lines (segments in the image)
lineSegs = houghlines(edges, theta, rho, peaks);
lineSegs

figure(5), imshow(img), title('Line segments');
hold on;
for k = 1:length(lineSegs);
    endpoints = [lineSegs(k).point1; lineSegs(k).point2];
    plot(endpoints(:,1), endpoints(:,2), 'LineWidth', 2, 'color', 'green');
end
hold off;
%% Finding more meaningful lines
%% Improving the line detection by increasing threshold parameters of Hough Peaks
peaks = houghpeaks(accum,100, ...
    'Threshold', ceil(0.6 * max(accum(:))), ... % the defualt is 0.5*max
    'NHoodSize', [15 15]);

size(peaks) % Notice the number of peaks reduce?

figure(4), imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');
hold on; plot(theta(peaks(:,2)), rho(peaks(:,1)), 'rs'); hold off;

%% Increase the fill gap between lines
lineSegs = houghlines(edges, theta, rho, peaks, 'FillGap', 100, 'MinLength',100);
figure(5), imshow(img), title('Line segments');
hold on;
for k = 1:length(lineSegs);
    endpoints = [lineSegs(k).point1; lineSegs(k).point2];
    plot(endpoints(:,1), endpoints(:,2), 'LineWidth', 2, 'color', 'green');
end
hold off;
