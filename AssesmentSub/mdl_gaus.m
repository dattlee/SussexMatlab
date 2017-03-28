function predictions = mdl_gaus(x_train,whMat, mdl_centers, mdl_weights,sigma)


x_train = x_train(:,[1 2]);

X = x_train*whMat;

predictions = mdl_gaus_rbf(X, mdl_centers, mdl_weights,sigma);

end
