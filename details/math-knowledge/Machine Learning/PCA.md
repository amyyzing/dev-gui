# CS229: Machine Learning Dimensionality ReductionPrincipal Component Analysis (PCA)

Converted from: `Machine Learning\PCA.pdf`


## Page 1

CS229: Machine Learning
Dimensionality ReductionPrincipal Component Analysis (PCA)
©2022 Carlos Guestrin
CS229: Machine LearningCarlos GuestrinStanford UniversitySlides include content developed by and co-developed with Emily Fox


## Page 2

CS229: Machine Learning2
EmbeddingExample: Embedding images to visualize dataDataMLMethodIntelligencePCA
[Saul & Roweis‘03]
Images with thousands or millions of pixels
Can we give each image a coordinate, such that similar images are near each other?
©2022 Carlos Guestrin


## Page 3

CS229: Machine Learning3
[Joseph Turian2008]
Embedding words
©2022 Carlos Guestrin


## Page 4

CS229: Machine Learning4
Embedding words (zoom in)
[Joseph Turian2008]
©2022 Carlos Guestrin


## Page 5

CS229: Machine Learning5
Dimensionality reduction•Input data may have thousands or millions of dimensions!-e.g., text data •Dimensionality reduction: represent data with fewer dimensions-easier learning –fewer parameters-visualization–hard to visualize more than 3D or 4D-discover “intrinsic dimensionality” of data•high dimensional data that is truly lower dimensional
©2022 Carlos Guestrin


## Page 6

CS229: Machine Learning6
Lower dimensional projections•Rather than picking a subset of the features, we can create new featuresthat are combinations of existing features
•Let’s see this in the unsupervised setting -just x, but no y
©2022 Carlos Guestrin


## Page 7

CS229: Machine Learning7
Linear projection and reconstruction
#awesome
#awful
01234…01234…
Reconstruction:Only knowing z, what was (x1,x2)?
Project onto 1-dimension
©2022 Carlos Guestrin


## Page 8

CS229: Machine Learning8
What if we project onto d vectors?
#awesome
#awful
01234…01234…
Perfect reconstruction!©2022 Carlos Guestrin


## Page 9

CS229: Machine Learning9
If I had to choose one of these vectors, which do I prefer?
#awesome
#awful
01234…01234…
©2022 Carlos Guestrin


## Page 10

CS229: Machine Learning10
Principal component analysis (PCA) –Basic idea•Project d-dimensional data into k-dimensional space while preserving as much information as possible:-e.g., project space of 10000 words into 3-dimensions-e.g., project 3-d into 2-d•Choose projection with minimum reconstruction error
©2022 Carlos Guestrin


## Page 11

CS229: Machine Learning11
“PCA explained visually”
http://setosa.io/ev/principal-component-analysis/
©2022 Carlos Guestrin


## Page 12

CS229: Machine Learning12
Linear projections, a review•Project a point into a (lower dimensional) space:-point: x = (x1,…,xd) -select a basis–set of basis vectors –(u1,…,uk)•we consider orthonormal basis: -ui•ui=1, and ui•uj=0 for i¹j-select a center–x, defines offset of space -best coordinates in lower dimensional space defined by dot-products: (z1,…,zk), zi= (x-x)•ui•minimum squared error
©2022 Carlos Guestrin


## Page 13

CS229: Machine Learning13
PCA finds projection that minimizes reconstruction error•Given N data points: xi= (x1i,…,xdi), i=1…N•Will represent each point as a projection:here:                           and
•PCA:-Given k<<d, find (u1,…,uk) minimizing reconstruction error:
x1
x2
NN
N
©2022 Carlos Guestrin


## Page 14

CS229: Machine Learning14
•Note that xican be represented exactly by d-dimensional projection:
•Rewriting error:
Understanding the reconstruction error
¨Given k<<d, find (u1,…,uk) minimizing reconstruction error:
Nd
©2022 Carlos Guestrin


## Page 15

CS229: Machine Learning15
Reconstruction error and covariance matrix
N NNd
©2022 Carlos Guestrin


## Page 16

CS229: Machine Learning16
Minimizing reconstruction error and eigen vectors
Nd•Minimizing reconstruction error equivalent to picking orthonormal basis (u1,…,ud) minimizing:•Eigen vector:
•Minimizing  reconstruction error equivalent to picking (uk+1,…,ud) to be eigenvectors with smallest eigenvalues
©2022 Carlos Guestrin


## Page 17

CS229: Machine Learning17
Basic PCA algoritm•Start from N by d data matrix X•Recenter: subtract mean from each row of X-Xc¬X –X•Compute covariance matrix:-S¬1/NXcTXc•Find eigenvectors and values of S•Principal components:k eigenvectors with highest eigenvalues
©2022 Carlos Guestrin


## Page 18

CS229: Machine Learning18
PCA example
©2022 Carlos Guestrin


## Page 19

CS229: Machine Learning19
PCA example –reconstruction
only used first principal component
©2022 Carlos Guestrin


## Page 20

CS229: Machine Learning20
Eigenfaces [Turk, Pentland ’91]•Input images:
nPrincipal components:
©2022 Carlos Guestrin


## Page 21

CS229: Machine Learning21
Eigenfaces reconstruction•Each image corresponds to adding 8 principal components:
©2022 Carlos Guestrin


## Page 22

CS229: Machine Learning22
Scaling up•Covariance matrix can be really big!-Sis d by d-Say, only 10000 features-finding eigenvectors is very slow…•Use singular value decomposition (SVD)-finds to k eigenvectors-great implementations available, e.g., python, R, Matlabsvd©2022 Carlos Guestrin


## Page 23

CS229: Machine Learning23
SVD•Write X = W S VT-X¬data matrix, one row per datapoint-W¬weight matrix, one row per datapoint –coordinate of xiin eigenspace -S¬singular value matrix, diagonal matrix•in our setting each entry is eigenvalue lj-VT¬singular vector matrix•in our setting each row is eigenvector vj
©2022 Carlos Guestrin


## Page 24

CS229: Machine Learning24
PCA using SVD algoritm•Start from m by n data matrix X•Recenter: subtract mean from each row of X-Xc¬X –X•Call SVD algorithm on Xc–ask for k singular vectors•Principal components:k singular vectors with highest singular values (rows of VT)-Coefficients become:
©2022 Carlos Guestrin


## Page 25

CS229: Machine Learning25
What you need to know•Dimensionality reduction-why and when it’s important•Simple feature selection•Principal component analysis-minimizing reconstruction error-relationship to covariance matrix and eigenvectors-using SVD
©2022 Carlos Guestrin
