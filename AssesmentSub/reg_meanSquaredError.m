function error = reg_meanSquaredError(target, prediction, lambda, weights)
m = length(target);

omega = weights'*weights;
error = (sum((target - prediction).^2))/(2*m);
error = error + lambda*omega;
end
