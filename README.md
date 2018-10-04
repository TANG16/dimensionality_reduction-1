# Dimensionality Reduction on Face images
In this project, <a href="https://en.wikipedia.org/wiki/Principal_component_analysis">Principal Component Analysis (PCA)</a> is applied to face images to perform <a href="https://en.wikipedia.org/wiki/Dimensionality_reduction">dimensionality reduction</a>. The output is a low dimensional facial representation of the input image. We will be using a dataset which consists of face images, each a 32X32 grayscale image. This dataset is based on a cropped version of the <a href="http://vis-www.cs.umass.edu/lfw/">"labeled faces in the wild"</a> dataset. This project is implemented as part of the <a href="https://github.com/adityachandupatla/ML_Coursera">machine learning course</a> from Coursera, while I was learning the Principal Component Analysis chapter.

<h2>Running the Project</h2>
<ul>
  <li>Make sure you have Octave/MATLAB installed</li>
  <li>Clone the project to your local machine and open it in one of your favorite IDE's which supports Octave/MATLAB code</li>
  <li>Run driver.m</li>
  <li>The dataset is first loaded for visualization</li>
  <li>Then we apply PCA to find the principal components and perform dimensionality reduction to reduce the dimensions of the input image, which has 1024 features, to a smaller image size, which has only 100 features. This can help speed up our learning algorithm</li>
  <li>We then recover the original image from the "reduced image", let us call it "recovered image". We now juxtapose the recovered image and original image to gain insights regarding the important features.</li>
  <li>From the reconstruction, we can patently observe that the general structure and appearance of the face are kept while the fine details are lost. This is a remarkable reduction (more than 10X) in the dataset size that can help speed up our learning algorithm significantly</li>
</ul>

If you find any problem deploying the project in your machine, please do let me know.

<h2>Development</h2>
<ul>
  <li>Sublimt Text has been used to program the application. No IDE has been used.</li>
  <li>Command line has been used to interact with the application.</li>
  <li>The project has been tested on Octave version: 3.8.0.</li>
</ul>

<h2>Working</h2>
<p>PCA reduces n-dimensions to k-dimensions by finding k vectors: u(1), u(2), ..., u(k), onto which to project data, so as to minimize the projection error. The best usage of PCA comes in image classification based problems. Image classification is a logistic regression based problem. But if there are several features i.e. for an image of size 100 X 100 we will be having 10^4 features. In such scenarios, it will be increasingly difficult to apply logistic regression. What we can do is, apply PCA on those 10^4 pixels and reduce the dimensionality to say a 100 features. Then the logistic regression, or for that matter any learning algorithm, will run faster! This is because we now have less data.</p><br/>
<p>PCA consists of two computational steps: First, you compute the covariance matrix of the data. Then, you use Octave/MATLAB’s SVD (Singular Value Decomposition) function to compute the eigenvectors U1, U2, . . . , Un. These will correspond to the principal components of variation in the data. Before using PCA, it is important to first normalize the data by subtracting the mean value of each feature from the dataset, and scaling each dimension so that they are in the same range.</p><br/>
<p>After normalizing the data, we can run PCA to compute the principal components. First, we need to compute the covariance matrix of the data, given by:</p>
<img src="https://github.com/adityachandupatla/dimensionality_reduction/blob/master/images/covariance_matrix.png" width="300" height="200" />
<p>where X is the data matrix with examples in rows, and m is the number of examples.</p><br/>
<p>After computing the covariance matrix, we need to run SVD to compute the principal components. We use Octave's svd() function to accomplish the same. After computing the principal components, we can use them to reduce the feature dimension of our dataset by projecting each example onto a lower dimensional space.

<img src="https://github.com/adityachandupatla/dimensionality_reduction/blob/master/images/sample_image.png" width="400" height="400" />

<img src="https://github.com/adityachandupatla/dimensionality_reduction/blob/master/images/top_eigen_vectors.png" width="400" height="400" />
</p><br/>
<p>After projecting the data onto the lower dimensional space, you can approximately recover the data by projecting them back onto the original high dimensional space.

<img src="https://github.com/adityachandupatla/dimensionality_reduction/blob/master/images/reconstruction.png" width="800" height="500" /></p><br/>

<h2>TO DO</h2>
<ul>
  <li>As of now, the PCA is done on the dataset specified, i.e. it is hardcoded that way. In the next iteration I'm planning on developing a module, which when given a dataset, along with the miscellaneous inputs, performs the dimensionality reduction and outputs a new dataset. This entire module can be used as a part of a bigger project to help speed up the learning.</li>
</ul>
<br/><br/>
Use this, report bugs, raise issues and Have fun. Do whatever you want! I would love to hear your feedback :)

~ Happy Coding
