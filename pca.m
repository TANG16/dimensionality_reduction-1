function [U, S] = pca(X)
%	Run principal component analysis on the dataset X
%   It computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S

[m, n] = size(X);
U = zeros(n);
S = zeros(n);
[U, S, V] = svd((1/m) * X' * X);

end