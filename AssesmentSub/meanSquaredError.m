% Mean Squared Error Function
function error = meanSquaredError(target, prediction)
m = length(target);
error = (sum((target - prediction).^2))/(2*m);
end
