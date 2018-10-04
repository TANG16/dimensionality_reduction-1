% Principle Component Analysis

% Initialization
cleanup()

%  Loading and Visualizing Face Data: We start by first loading and visualizing the dataset.
fprintf('\nLoading face dataset.\n\n');

%  Load Face dataset
load ('faces_dataset.mat')

%  Display the first 100 faces in the dataset
displayData(X(1:100, :));
pauseProgram();

%  PCA on Face Data: Eigenfaces
%  Run PCA and visualize the eigenvectors which are in this case eigenfaces

fprintf(['\nRunning PCA on face dataset.\n' ...
         '(this might take a minute or two ...)\n\n']);

%  Before running PCA, it is important to first normalize X by subtracting 
%  the mean value from each feature
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
[U, S] = pca(X_norm);

%  Visualize the top 36 eigenvectors found
displayData(U(:, 1:36)');

pauseProgram();


%  Dimension Reduction for Faces:
%  Project images to the eigen space using the top k eigenvectors 
%  If you are applying a machine learning algorithm 
fprintf('\nDimension reduction for face dataset.\n\n');

K = 100;
Z = projectData(X_norm, U, K);

fprintf('The projected data Z has a size of: ')
fprintf('%d \n\n', size(Z));

pauseProgram();

%  Visualization of Faces after PCA Dimension Reduction
%  Project images to the eigen space using the top K eigen vectors and 
%  visualize only using those K dimensions
%  Compare to the original input, which is also displayed

fprintf('\nVisualizing the projected (reduced dimension) faces.\n\n');

K = 100;
X_rec  = recoverData(Z, U, K);

% Display normalized data
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('Original faces');
axis square;

% Display reconstructed data from only k eigenfaces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('Recovered faces');
axis square;