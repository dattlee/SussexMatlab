% Find template 1D
% NOTE: Function definition must be the very first piece of code here!
function index = find_template_1D(t, s)
    % TODO: Locate template t in signal s and return index

    c = normxcorr2(t,s)   % Normalising uses 'full' boundarys,
                          % So it returns a signal larger than the original image
    disp(c) % notice the returned signal is 2(t-1) larger

    [maxValue rawIndex] = max(c); % raw index is the image plus the boundary
    index =  rawIndex - size(t,2) + 1 % returns the index in the true image

    % NOTE: Turn off all output from inside the function before submitting!
end
