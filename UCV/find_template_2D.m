% Find template 2D
function [yIndex xIndex] = find_template_2D(template, img)

    c = normxcorr2(template,img);

    % My method
    [row rawIndexY] = max(c);
    [column rawIndexX] = max(row);

    yIndex =  rawIndexY(rawIndexX) - size(template,1) + 1; % returns the index in the true image
    xIndex =  rawIndexX - size(template,2) + 1; % returns the index in the true image

    % % Alternate method using find function
    % c = normxcorr2(template,img);
    % [yRaw xRaw] = find(c == max(c(:))); % return the index where c == max value in c
    % yIndex = yRaw = size(template,1) + 1;
    % xIndex = xRaw = size(template,2) + 1;

end
