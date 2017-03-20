% RBF Implementation
function [output, X, W] = rbf_reg(X, Y, k, imp, sigma, lambda)
% X = preprocessed data, and centers
% Y = target outputs
% k = number of centers
% imp = type of rbf to perfom
% sigma = value of sigma if using guassian implementation

% Linear
G = pdist2(X,X); % This function determines the Euclidian Norms
size(G)
if strcmp(imp, 'Linear')
    'linear';
elseif strcmp(imp, 'Gaussian')
    % Gaussian
    G = (exp(-(G).^2)/(2*sigma^2));

elseif strcmp(imp, 'Multiquadratic')
    % Multiquadratic
    %G = (exp(-(G).^2)/(2*sigma^2));

elseif  strcmp(imp, 'InverseMultiquadratic')
    % Inverse Multiquadratic
    %G = (exp(-(G).^2)/(2*sigma^2));
end

% W = pinv(G')*Y;
fprintf('\nIs it going to work?\n');
pause;

W = inv(G' * G + lambda * eye(size(X,1)))*G'*Y;

fprintf('\nWell fuck.\n');
pause;
%W = inv(G'*G + lambda*eye(size(X,2)))*G'*Y;

output = W'*G;

% fprintf('\nProgram paused. Press enter to continue.\n');
% pause;
end
