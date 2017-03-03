% Blend two images
function output = blend(a, b, alpha)
    % TODO: Your code here; finally assign: output = <something>;
a = a * alpha;
b = b * (1-alpha);
output = a+b;
end
