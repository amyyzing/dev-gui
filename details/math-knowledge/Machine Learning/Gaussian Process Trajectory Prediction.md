# Gaussian Process Trajectory Prediction

Source title: Faculty of Health, Science and Technology

Converted from: `6.pdf`


## Page 1

Faculty of Health, Science and Technology
Master Thesis for Master of Science in Engineering Physics (Civilingenjör Teknisk Fysik)
30 HP (ECTS)
Supervisors: Tomas Almlöf (Saab Dynamics AB) and Thijs Holleboom (Karlstad University)
Examiner: Lars Johansson
Date: 2024-05-30
Trajectory Prediction Using
Gaussian Process Regression
Estimating Three Dynamical States Using Two Parameters
Positionsprediktering med Gaussisk Process Regression
Estimering av Tre Dynamiska Tillstånd Baserat på Två Parametrar
Ludvig Hannebo


## Page 2

This page was intentionally left blank


## Page 3

Abstract
In this thesis a Gaussian process regression (GPR) model and a Kalman filter (KF)
model were developed and applied to a trajectory prediction problem. The main
subject of the thesis is GPR, where the intended purpose of the KF is to compare
it to the GPR model. The input data for the models consists of two noisy spherical
angle coordinates of a moving target relative to a moving guided projectile. In order
to perform trajectory predictions the models need to estimate the distance between
the target and guided projectile since there are only two coordinates available and
an estimation of three coordinates is desired. The distance estimation was done by a
Low Speed Approximation. The trajectories investigated were harmonic-exponential,
exponential-spiral and linear. The results showed issues with the hyperparameters
of the GPR model which may be related to the preprocessing of the trajectory data.
However, the GPR model did outperform the KF model when there was acceleration,
despite the issues with the hyperparameters. The KF model outperformed the GPR
model when the target trajectory behaved linearly. The results indicate that GPR has
potential as a trajectory prediction algorithm.
Keywords: Kriging, Gaussian Process Regression, Trajectory Prediction, Sliding Win-
dow, Time Series Analysis, Machine Learning, Kalman Filter


## Page 4

This page was intentionally left blank


## Page 5

Sammanfattning
I denna avhandling utvecklades och tillämpades en Gaussisk process regression (GPR)-
modell och en Kalman Filter (KF)-modell på ett positionspredikteringsproblem. Hu-
vudämnet för avhandlingen är GPR medan det avsedda syftet med KF är att jämföra
den med GPR-modellen. Modellernas indata består av två brusiga sfäriska vinkelko-
ordinater av ett rörligt mål i förhållande till en styrd projektil. För att modellerna
ska kunna utföra positionsprediktering så behöver avståndet mellan målet och den
styrda projektilen skattas, eftersom det endast finns två tillgängliga koordinater och
en uppskattning av tre koordinater önskas. Avståndsberäkningen gjordes baserat på
ett antagande om att hastigheten för målet är liten relativt hastigheten för den styrda
projektilen, i avhandlingen är denna approximation benämnd Low Speed Approx-
imation. De undersökta banorna var harmonisk-exponentiell, exponentiell-spiral
och linjär. Resultaten visade problem med hyperparametrarna för GPR-modellen,
vilket kan vara relaterat till förbehandlingen av bandatan. Trots problem med hyper-
parametrarna så presterade GPR-modellen bättre än KF-modellen när det fanns ac-
celeration. KF-modellen presterade bättre än GPR-modellen när målets bana betedde
sig linjärt. Resultaten indikerar att GPR har potential som en algoritm för position-
sprediktering.
Nyckelord: Kriging, Gaussisk Process Regression, Positionsprediktering, Tidsserieanalys,
Maskininlärning, Kalman Filter


## Page 6

This page was intentionally left blank


## Page 7

Acknowledgements
I would like to express my sincere gratitude to Tomas Almlöf, my supervisor at Saab
Dynamics, for the numerous discussions and his guidance and support. I am also
grateful to Thijs Holleboom, my supervisor at Karlstad University, for the guidance and
support. I would like to thank Saab Dynamics and Mikael Sahlin who gave me the op-
portunity to write this thesis at Saab Dynamics. Additionally I want to thank everyone
in the hallway at Saab Dynamics for their kindness and the amusing discussions in
the lunch room which made the work even more enjoyable. I want to especially thank
Robert Johansson, Gabriel Khajo and Gustav Alteryd, at Saab Dynamics, for their mi-
nor but still appreciable contributions to my thesis.
I am extremely grateful for my wonderful classmates, Daniel Arketeg, Elsa Bernholm,
Alexander Fasth, Albin Brunzell, and Hannes Persson, who have embarked on this
five-year journey with me. Thank you for the copious amount of discussions to un-
derstand the course material, homework assignments, and the collaboration when it
was needed. This endeavor would not have been possible without you, and I am deeply
grateful and glad that we made it to the end.
Lastly, I would like to express my deepest appreciation to my lovely parents, for their
unconditional love and support. Without you this journey would have been very diffi-
cult, or perhaps not even possible.


## Page 8

This page was intentionally left blank


## Page 9

Acronyms
GPR Gaussian Process Regression
GP Gaussian Process
MVN Multivariate Normal Distribution
PDF Probability Density Function
RBF Radial Basis Function
LML Log Marginal Likelihood
IID Independent and Identically Distributed
SD Standard Deviation
KF Kalman Filter


## Page 10

This page was intentionally left blank


## Page 11

Contents
1 Introduction 1
1.1 Background . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.2 Problem Description . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
1.3 Kalman Filter Comparison . . . . . . . . . . . . . . . . . . . . . . . . . . 2
1.4 Ethics and Sustainability . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.5 Conventions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
2 Theory 5
2.1 Regression . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.2 Gaussian Distribution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.3 Multivariate Gaussian Distribution . . . . . . . . . . . . . . . . . . . . . 10
2.3.1 Kernels . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
2.3.2 Combining Kernels . . . . . . . . . . . . . . . . . . . . . . . . . . 12
2.4 Gaussian Process . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
2.4.1 Gaussian Process Regression . . . . . . . . . . . . . . . . . . . . 14
2.4.2 Extrapolation via Gaussian Process Regression . . . . . . . . . 17
2.4.3 GPR Algorithm . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
2.4.4 Bayesian Non-parametric Model . . . . . . . . . . . . . . . . . . 20
2.5 Hyperparameter Optimization . . . . . . . . . . . . . . . . . . . . . . . . 21
2.5.1 Log Marginal Likelihood . . . . . . . . . . . . . . . . . . . . . . . 22
2.5.2 Grid Search . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
2.5.3 Random Search . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
2.6 Real time vs Execution time . . . . . . . . . . . . . . . . . . . . . . . . . 24
2.7 Machine Learning . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
2.7.1 Normalization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26


## Page 12

2.8 Kalman Filter . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
3 Estimating Three Dynamic States from Two Parameters 35
3.1 Geometrical Attempt . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
3.2 Low Speed Approximation . . . . . . . . . . . . . . . . . . . . . . . . . . 38
4 Algorithm 41
4.1 Parameters, Trajectory and Setup . . . . . . . . . . . . . . . . . . . . . . 41
4.2 Guided Projectile Relative Target . . . . . . . . . . . . . . . . . . . . . . 43
4.3 Coordinate Transformation . . . . . . . . . . . . . . . . . . . . . . . . . 45
4.4 Estimating the Distance . . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
4.5 Sliding Window . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
4.6 Hyperparameter Optimization . . . . . . . . . . . . . . . . . . . . . . . . 48
4.7 GPR Implementation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
4.8 Error Estimation and Performance . . . . . . . . . . . . . . . . . . . . . 51
4.9 KF Implementation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 52
5 Results and Discussion 57
5.1 Data preprocessing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
5.2 GPR: Three Spherical Coordinates Input . . . . . . . . . . . . . . . . . . 59
5.3 GPR: Two Spherical Coordinates Input with Guided Projectile . . . . . 64
5.3.1 Three Spherical Coordinates Input Comparison . . . . . . . . . 74
5.4 GPR: Noisy Measurements . . . . . . . . . . . . . . . . . . . . . . . . . . 79
5.5 KF: Two Spherical Coordinates Input with Guided Projectile . . . . . . 81
5.6 KF: Three Spherical Coordinates Input . . . . . . . . . . . . . . . . . . . 87
5.7 Future Improvements and Future Aspects for Investigation . . . . . . . 93
6 Conclusion 97
Bibliography 99


## Page 13

List of Figures
2.1 Linear regression . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
2.2 Three different functions that fits random data . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.3 Two independent Gaussian vectors. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
2.4 Ten independent Gaussian vectors. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
2.5 Relation between Gaussian vectors as functions and Gaussian distribution . . . . . . . . 9
2.6 Ten Gaussian vectors with RBF kernel . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
2.7 Prior versus posterior distribution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
2.8 Gaussian process regression with training points from a sinus curve . . . . . . . . . . . . 18
2.9 Length scale hyperparameter effect on the predictive function . . . . . . . . . . . . . . . . 22
2.10 Grid search vs random search . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
2.11 Real time versus execution time in the context of positional prediction . . . . . . . . . . . 25
2.12 Non-scaled data from a sinus curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
2.13 Normalizing the data used in figure 2.12 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
2.14 The Kalman filter algorithm and its two main steps. . . . . . . . . . . . . . . . . . . . . . . 31
3.1 Spherical coordinate system . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36
3.2 Angle problem when estimating the distance between target and guided projectile . . . 37
3.3 Solution to the angle problem when the speed of the target is given . . . . . . . . . . . . . 38
4.1 Spherical coordinate system within a stationary coordinate system . . . . . . . . . . . . . 44
4.2 GPR acting on a sliding window . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
4.3 Time series window and its constituent parts . . . . . . . . . . . . . . . . . . . . . . . . . . 48
4.4 Flowchart of the GPR trajectory prediction algorithm . . . . . . . . . . . . . . . . . . . . . 50
4.5 Flowchart of the KF trajectory prediction algorithm . . . . . . . . . . . . . . . . . . . . . . 54
5.1 Scaling data from a sinus curve with a factor of 10 and 10 4 . . . . . . . . . . . . . . . . . . 58


## Page 14

5.2 Scaling data from a sinus curve with hyperparameter range 0.1 : 10 : 1000 . . . . . . . . . 59
5.3 Three coordinates input for harmonic-exponential target trajectory . . . . . . . . . . . . 61
5.4 Three coordinates input for exponential-spiral target trajectory . . . . . . . . . . . . . . . 63
5.5 Three coordinates input for linear target trajectory . . . . . . . . . . . . . . . . . . . . . . . 64
5.6 Two coordinates input for harmonic-exponential target trajectory . . . . . . . . . . . . . 66
5.7 Harmonic-exponential target trajectory plotted without guided projectile . . . . . . . . . 67
5.8 Two coordinates input for exponential-spiral target trajectory . . . . . . . . . . . . . . . . 68
5.9 Exponential-spiral target trajectory plotted without guided projectile . . . . . . . . . . . 69
5.10 Two coordinates input for linear target trajectory . . . . . . . . . . . . . . . . . . . . . . . . 70
5.11 Linear target trajectory plotted without guided projectile . . . . . . . . . . . . . . . . . . . 71
5.12 Manually scaled data with two coordinates input for linear target trajectory . . . . . . . . 72
5.13 Absolute error of z for the results in figure 5.12 . . . . . . . . . . . . . . . . . . . . . . . . . 73
5.14 Three coordinates input comparison for harmonic-exponential target trajectory . . . . . 74
5.15 Three coordinates input comparison for exponential-spiral target trajectory . . . . . . . 76
5.16 Exponential-spiral target trajectory with x and y equally scaled relating to figure 5.15 . . 77
5.17 Three coordinates input comparison for linear target trajectory . . . . . . . . . . . . . . . 78
5.18 Three coordinates input for linear target trajectory with location (0,0,0) . . . . . . . . . . 79
5.19 Error plot for harmonic-exponential target trajectory with noise and GPR with 3 inputs . 80
5.20 Error plot for exponential-spiral target trajectory with noise and GPR with 3 inputs . . . 80
5.21 Error plot for linear target trajectory with noise and GPR with 3 inputs . . . . . . . . . . . 81
5.22 Error plot for harmonic-exponential target trajectory with noise and KF with 2 inputs . . 82
5.23 Error plot for exponential-spiral target trajectory with noise and KF with 2 inputs . . . . 82
5.24 Error plot for linear target trajectory with noise and KF with 2 inputs . . . . . . . . . . . . 83
5.25 Comparing KF versus GPR for harmonic-exponential target trajectory in the z-axis . . . 85
5.26 Comparing KF versus GPR for harmonic-exponential target trajectory in the x-axis . . . 85
5.27 Comparing KF versus GPR for harmonic-exponential target trajectory in the x-axis . . . 86
5.28 Comparing KF versus GPR for linear target trajectory in the z-axis . . . . . . . . . . . . . . 87
5.29 Interval of error plot for linear target trajectory with noise and GPR with 3 inputs . . . . 87
5.30 Error plot for harmonic-exponential target trajectory and KF with 3 inputs . . . . . . . . 88
5.31 Error plot for exponential-spiral target trajectory and KF with 3 inputs . . . . . . . . . . . 88
5.32 Error plot for linear target trajectory and KF with 3 inputs . . . . . . . . . . . . . . . . . . 89
5.33 Error plot in z. KF versus GPR with 3 coordinates for harmonic-exponential trajectory . 90


## Page 15

5.34 Error plot in x. KF versus GPR with 3 coordinates for exponential-spiral trajectory . . . . 91
5.35 Error plot in z. KF versus GPR with 3 coordinates for exponential-spiral trajectory . . . . 92
List of Tables
2.1 Common kernels in Gaussian processes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
2.2 Kalman filter terms . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
4.1 Explanation of Parameters . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
4.2 Target and guided projectile trajectories . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
5.1 Parameters and corresponding value used in section 5.2 . . . . . . . . . . . . . . . . . . . 60
5.2 Parameters and corresponding value used in section 5.3 . . . . . . . . . . . . . . . . . . . 65
5.3 Derived parameters used in section 5.3 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 65
5.4 Execution times for GPR . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
5.5 Execution times for KF . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 83
List of Algorithms
1 Standard GPR Algorithm . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2 Constructing relative spherical coordinates . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
3 Spherical coordinates to Cartesian coordinates . . . . . . . . . . . . . . . . . . . . . . . . . 45
4 Estimation of distance between target and guided projectile . . . . . . . . . . . . . . . . . 46
5 Hyperparameter Optimization with grid search . . . . . . . . . . . . . . . . . . . . . . . . . 49
6 Random search . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49


## Page 16

7 Trajectory Prediction Implementation using GPR with Sliding Windows . . . . . . . . . . . 51
8 Trajectory Prediction Implementation using KF . . . . . . . . . . . . . . . . . . . . . . . . . 55


## Page 17

Chapter 1
Introduction
1.1 Background
Describing and predicting the motion of objects is usually based on Newton’ s laws of
motion. Newton’ s laws of motion can be integrated in modern sophisticated meth-
ods for trajectory prediction, for example using a Kalman filter [1, 2]. One method of
trajectory prediction that do not use Newton’ s laws of motion and is purely statistical
is the method of using a Gaussian process regression. The wish to predict the path of
objects has many applications such as autonomous system guidance, vehicle navi-
gation, automated weapon systems, traffic monitoring and robotics [2, 3].
Using a purely statistical model to predict the trajectory of an object compared to
a Kalman filter which integrate dynamical equations in a so called state transition
matrix [4] may seem doubtful. Can the statistical model incorporate all the dynam-
ical properties of the object that is travelling? This thesis aims to investigate that. A
possible advantage with the statistical model compared to a model that includes dy-
namical equations is that the dynamical equations may not accurately describe the
true behavior of the object that is in motion. The dynamical equations may for ex-
ample disregard acceleration, a common characteristic of the Kalman filter, and thus
not accurately describe the motion of some object. If the motion of the object is diffi-
cult to describe then it could be better to avoid the dynamical equations all together
and try something else, perhaps a purely statistical model.
1


## Page 18

1.2 Problem Description
Consider a guided projectile that receives noisy data in the form of two spherical co-
ordinate angle parameters θ and φ. The angles θ and φ are the angles created by
some target and the current direction of the guided projectile. The aim of the thesis
is to investigate the use of a Gaussian process regression method trained on the data
from θ and φ to predict the future position x, y and z of the target. Since the number
of parameters of the input data is less than the desired number of parameters of the
output means that the system is in a sense underdetermined. However, using a sta-
tistical approach where the model trains on data could still yield meaningful results.
The task is then to estimate three dynamical states using only two parameters. The
distance between the guided projectile and the target, also referred to as the radius
r in the spherical coordinate system, is known for the algorithm only at the initial
time t = 0 by definition of the problem. The trajectory of the guided projectile is also
considered known.
1.3 Kalman Filter Comparison
The main theme of this thesis will be Gaussian process regression. The Gaussian
process regression model will be compared with a Kalman filter. However, while
a Kalman filter will also be developed throughout the thesis, it will not receive the
same level of detailed explanation and investigation as the Gaussian process regres-
sion model. The main purpose of the Kalman filter in the thesis is to compare it
against the Gaussian process regression model. Gaussian process regression is a sta-
tistical approach to trajectory prediction, while Kalman filter uses dynamical equa-
tions to perform trajectory prediction. Comparing Gaussian process regression with
a Kalman filter is particularly interesting due to the distinct difference in design. Fur-
thermore, the Kalman filter is commonly the method used for trajectory prediction,
adding to the significance of the comparison.
2


## Page 19

1.4 Ethics and Sustainability
The problem description describes a guided projectile and a target which is undoubt-
edly related to military practices. However, despite the specific context of the prob-
lem description, applications of Gaussian process regression extend far beyond that
of automated weapon systems as described in the background. Exploring Gaussian
process regression in the military context does not only yield insight and applica-
tions in the military context but also offer insight in other applications. Developing
technology for weapons raises great ethical concerns. An argument that is commonly
used in favour of technological advancement related to weapons is that of develop-
ing it for the use of defence. An argument against the development of weapons is that
despite whatever the claimed purpose or aim is, the eventual use can be unexpected
and lead to unfavorable outcomes in an unintended manner.
1.5 Conventions
Boldfont will be used for vectors. Capital letters will be used for matrices. The do-
main for the training points and the domain for the test points defined as X and X∗
respectively are treated as matrices in the theory chapter which is the general case.
However, for the specific problem in this thesis the training points and test points
represent time and are vectors. Taking the transpose of some vector v and some ma-
trix A is indicated by the following notationvT and AT , respectively. The identity ma-
trix will be defined as I . The notation P (A | B) represents the probability of A given
that B has occurred.
3


## Page 20

This page was intentionally left blank


## Page 21

Chapter 2
Theory
The main theme in the theory chapter is the Gaussian process regression
where the intended purpose of the chapter is to first explain regression,
then start with Gaussian distribution and build towards Gaussian pro-
cess regression. The concluding sections of the chapter regards hyperpa-
rameter optimization in Gaussian process regression, the concept of time
in trajectory prediction, machine learning aspects of Gaussian processes,
and finally, the theoretical foundations of the Kalman filter. The theory
is largely based on the book ”Gaussian Processes for Machine Learning”
by Rasmussen et al. [5] and the article ”An Intuitive Tutorial to Gaussian
Process Regression” by Wang [6].
2.1 Regression
Regression is a common machine learning task that can be described as finding a
function that represents a given dataset. In simple linear regression a model function
of the parametric form y = α + βx is used to model the dataset. The parameters α
and β are to be estimated using some method. A common method for estimating the
parameters α and β are using least squares. Least squares is based on minimizing the
sum of the squares of the residuals which is the difference between an observed value
and a fitted value from the model function [7]. Figure 2.1 illustrates linear regression
using least squares.
5


## Page 22

Figure 2.1: Linear regression using least squares. Figure created in MAT-
LAB.
The function that fits the dataset is commonly used for making predictions. Pre-
dictions can be performed within the interval of the dataset, which is referred to as
interpolation, or outside the interval, which is referred to as extrapolation. In the
context of trajectory prediction the prediction regards a position of an object in the
future and thus extrapolation is the main interest.
There can be more than one function that fits observed data, see figure 2.2. Mo-
tivating which function reflects the true nature of the observed data points can be
difficult. Even motivating which function has a superior fit can be difficult. Gaussian
process regression yields a probability distribution over possible functions that can
fit the data, therefore it can ascribe an uncertainty associated to the most probable
function of the distribution over possible functions [5]. Instead of assuming a para-
metric form as for simple linear regression a Gaussian process regression models the
relationship using a Gaussian process. What a ’Gaussian process’ is will be developed
in the following sections and defined in section 2.4.
6


## Page 23

Figure 2.2: Three different functions that fits random data. Figure created
in MATLAB.
2.2 Gaussian Distribution
A Gaussian distribution also known as a normal distribution is a continuous proba-
bility density distribution. For a Gaussian distribution of a random variable X with
mean µ and variance σ2 the probability density function (PDF) is defined as [7]
PX (x) = 1
σ
p
2π
exp
µ
−1
2
³ x − µ
σ
´2¶
. (2.1)
The notation used for when a random variable X follows a Gaussian distribution with
mean µ and variance σ2 is X ∼ N (µ, σ2). Consider two standard normal vectors
x1 = [x1
1, x2
1, ...,xn
1 ] and x2 = [x1
2, x2
2,..., xn
2 ] with n elements which are outputs from a
random variable X ∼ N (0, 1). Let n = 10 and let x1 be plotted at Y = 0 and x2 be
plotted at Y = 1 with lines connecting the elements from x1 and x2 randomly with a
uniform probability distribution. Figure 2.3 shows the plot of vector x1 and x2.
7


## Page 24

Figure 2.3: Connecting points by lines from two standard normal vectors
with ten elements each. The points are connected by lines randomly with
a uniform probability distribution. Figure created in MATLAB following
the article [6].
The lines in figure 2.3 can be seen as functions that can be used for linear regression
analysis. However, in the context of Gaussian process regression the functions are not
limited to a linear relationship. Instead of plotting only vectors x1 and x2 let the plot
contain ten independent vectors evenly distributed along the Y-axis with elements
drawn from a Gaussian distribution, see figure 2.4.
8


## Page 25

Figure 2.4: Connecting points by lines from ten standard normal vectors
with ten elements each. The vectors are evenly distributed along the Y-
axis. Figure created in MATLAB following the article [6].
Figure 2.5 clearly depicts the relation between the vectors plotted in figure 2.4 with
the Gaussian distribution. Also note that the majority of the highlighted points in
figure 2.5a that is shown in figure 2.5b is close to the mean zero, which is expected.
(a) Highlighted the arbitrarily chosen sixth
Gaussian vector from figure 2.4 with black as-
terisks.
(b) Corresponding points on the probability
density curve.
Figure 2.5: Visualizing the relation between the Gaussian vectors in figure
2.4 to the Gaussian distribution.
9


## Page 26

The functions in figure 2.4 have sharp points which are undesirable. Kernels, also
known as covariance functions can be used to make the functions smoother, in other
words, inputs that are close to each other should have similar output values. The de-
sire to make the functions smoother impose the use of a covariance function which
imply that the independent Gaussian vectors are correlated as a joint Gaussian dis-
tribution, also known as a multivariate Gaussian distribution.
2.3 Multivariate Gaussian Distribution
If a system is described by multiple Gaussian distributions that are correlated then
to model that system a multivariate Gaussian/Normal distribution (MVN) is needed
[6]. MVN is a generalization of univariate Gaussian distribution to n dimensions for
a vector valued random variable X ∈ Rn with mean µ ∈ Rn and covariance matrix
Σ ∈ Sn
++ where Sn
++ refers to the space of symmetric positive definite n × n matrices.
The probability density function (PDF) for a MVN with n dimension is defined as [6]
p(X|µ, Σ) = 1
(2π)n/2|Σ|1/2 exp
µ
−1
2(X − µ)T Σ−1(X − µ)
¶
(2.2)
where |Σ| denotes the determinant of Σ.
Consider a Gaussian vector X = (X1, ...,Xn)T with the special case that the compo-
nents of X are independent and Xi ∼ N (0, 1) for all i = 1, ...,n. The components of
X being independent implies that the off-diagonal elements of the covariance ma-
trix being zero. This is mathematically expressed as Σ = diag
¡
σ2
1, σ2
2,..., σ2
n
¢
and the
inverse of the covariance matrix is thus Σ−1 = diag
³
1
σ2
1
, 1
σ2
2
,..., 1
σ2n
´
. Substituting Σ and
Σ−1 in equation 2.2 and using
(X − µ)T diag
Ã
1
σ2
1
, 1
σ2
2
,..., 1
σ2
n
!
(X − µ) =
nX
i =1
(xi − µi )2
σ2
i
(2.3)
gives
p(X|µ, Σ) =
nY
i =1
1
σi
p
2π
exp
µ
−1
2
µ xi − µi
σi
¶2¶
. (2.4)
10


## Page 27

It can be observed that equation 2.4 is a product of univarite normal distributions
equation 2.1 for each element.
2.3.1 Kernels
The covariance matrix Σ is constructed using a given kernel which is crucial for the
resulting behavior of the prior and posterior distribution which will be defined in
section 2.4. Consider ten dependent Gaussian vectors following the distribution X ∼
N (0, Σ) where the elements Σi j in the covariance matrix Σ are created using a Radial
Basis Function (RBF) kernel
Σi j = k(xi , x j ) = σ2
f exp
Ã
−
¡
xi − x j
¢2
2l 2
!
(2.5)
with σ2
f = 1 and l = 1. Figure 2.6 shows ten dependent Gaussian vectors using the
RBF kernel with ten elements each.
Figure 2.6: Ten Gaussian vectors with RBF kernel evenly distributed along
the Y-axis. Figure created in MATLAB following the article [6].
Comparing figure 2.4 with 2.6 it can be seen that the results are drastically different.
The two results are both using the same set of Gaussian vectors except for the Ker-
11


## Page 28

nel used. Figure 2.4 uses an identity kernel while figure 2.6 uses a RBF kernel. The
conclusion is that the RBF kernel in this case made the prior functions in some sense
smoother.
The parameters in the RBF kernel also influence the shape of the prior functions in
figure 2.6 in addition to the type of kernel selected. Table 2.1 shows a list of common
kernels that can be used in Gaussian processes 1. The parameters within the kernels
are referred to as hyperparameters, which need to be optimized for regression prob-
lems to achieve favorable outcomes.
Table 2.1: Common kernels in Gaussian processes [5, 8].
Kernel Name Kernel Function
Radial Basis Function (RBF) k(xi , x j ) = exp
³
−
∥xi −x j ∥2
2l 2
´
Matérn k(xi , x j ) = 21−ν
Γ(ν)
µ p
2ν∥xi −x j ∥
l
¶ν
Kν
µ p
2ν∥xi −x j ∥
l
¶
Exponential k(xi , x j ) = exp
³
−
∥xi −x j ∥
l
´
Linear k(xi , x j ) = (xi )T (x j )
Polynomial k(xi , x j ) = (α(xi )T (x j ) + c)d
Periodic k(xi , x j ) = exp
³
−
2 sin2(π∥xi −x j ∥/p)
l 2
´
2.3.2 Combining Kernels
The common kernels provided in 2.1 do not always express the desired properties
that are desired to model. It is possible to combine kernels to create new kernels
with different properties. Combining kernels is done in primarily two ways: addition
and multiplication [8]
ka+b = ka
¡
xi , x j
¢
+ kb
¡
xi , x j
¢
(2.6)
ka×b = ka
¡
xi , x j
¢
× kb
¡
xi , x j
¢
. (2.7)
1The kernel functions have slight variations from source to source in how the hyperparameters are
included in the kernels.
12


## Page 29

Equation 2.6 will prove to be very important due to a common feature that exist for
the common kernels being that k
¡
xi , x j
¢
→ 0 as ∥xi − x j ∥ → ∞ which can be easily
observed in table 2.1. The importance of this is elaborated in subsection 2.4.2
2.4 Gaussian Process
Increasing the number of dimensions of the multivariate Gaussian distribution to
infinity then every point in some domain D can be mapped to a point in a codomain
Rn which leads to the concept of a Gaussian process (GP). A Gaussian process is a
distribution over functions. Formally it is defined as [5]
Definition 2.1. A Gaussian process is a collection of random variables, any finite num-
ber of which have a joint Gaussian distribution.
The use of ”collection” in definition 2.1 does not specify if the collection is infinite or
finite. The collection can be finite, however that would simply result in a Gaussian
distribution. In theory to model a continuous function the domain of the function
and thus the collection of random variables needs to be infinite. However, in prac-
tice infinitely many points cannot be used and thus a finite set of random variables
are used to describe the predictive function. In the context of trajectory prediction
the input domain is time hence the random variables represent time.
A Gaussian process is fully described by its mean functionm(x) and covariance func-
tion k(x, x′) which is similar to a multivariate Gaussian distribution which is fully de-
fined by its mean and covariance matrix. The mathematical notation for a Gaussian
process of a real process f (x) is [5]
f (x) ∼ GP(m(x),k(x, x′)). (2.8)
A Gaussian process is usually applied to training data also known as observations to
perform regression tasks. A Gaussian process before or without training data consists
of what is referred to as a prior distribution. When observations are used to update
the elements of the covariance matrix using the covariance function a posterior dis-
tribution is achieved. Figure 2.7 shows the difference between the prior distribution
13


## Page 30

and the posterior distribution. Figure 2.7a shows ten prior functions and figure 2.7b
shows ten posterior functions along with the posterior mean function as a dashed
red curve.
(a) Prior
 (b) Posterior
Figure 2.7: Subfigure 2.7a shows ten Gaussian vectors with RBF kernel
from the prior distribution along with 95% confidence region. Subfigure
2.7b shows two observations ’+’ along with ten Gaussian vectors using RBF
kernel from the posterior distribution also with a 95% confidence region
and with the mean plotted as a dashed red curve. Figures created in MAT-
LAB.
In figure 2.7 it can be observed that at the observations the confidence region tends
towards zero which is to be expected since at an observed point there is 100% confi-
dence that the regression function will pass through that point, assuming there is no
uncertainty in the observation.
2.4.1 Gaussian Process Regression
Gaussian process regression (GPR) is the use of a Gaussian process to perform re-
gression tasks. The posterior function mean also known as simply posterior mean
¯f∗ from the Gaussian process is the most probable outcome since the distribution
follows a Gaussian distribution where the mean is the most probable outcome (see
figure 2.5b). The posterior mean is also known as the predictive function since it is
used for interpolation and extrapolation predictions.
14


## Page 31

The joint distribution of the test outputs f∗ and the training outputs f is
"
f∗
f
#
∼ N
Ã"
m(X∗)
m(X )
#
,
"
K (X∗, X∗) K (X∗, X )
K (X , X∗) K (X , X )
#!
(2.9)
where X represents the domain for the training points and X∗ represents the do-
main for the test points where prediction is desired. Let K = K (X , X ), K∗ = K (X∗, X )
and K∗∗ = K (X∗, X∗). Assuming the training data has additive independent identi-
cally distributed (IID) Gaussian noise ϵ ∼ N
¡
0, σ2
n
¢
, then the covariance for the noisy
training data y = f (x) + ϵ becomes
Cov
¡
y
¢
= K + σ2
n I . (2.10)
The joint distribution of f∗ and y is then
"
f∗
y
#
∼ N
Ã"
m(X∗)
m(X )
#
,
"
K∗∗ K∗
K T
∗ K + σ2
n I
#!
. (2.11)
The marginals and conditionals of an MVN can be calculated via the following theo-
rem [9].
Theorem 2.1(Marginals and conditionals of an MVN). Suppose X = (x1,x2) is jointly
Gaussian with parameters
µ =
"
µ1
µ2
#
, Σ =
"
Σ11 Σ12
Σ21 Σ22
#
, Λ = Σ−1 =
"
Λ11 Λ12
Λ21 Λ22
#
(2.12)
Then the marginals are given by
p(x1) ∼ N (x1 | µ1, Σ11)
p(x2) ∼ N (x2 | µ2, Σ22)
(2.13)
and the posterior conditional is given by
15


## Page 32

p(x1 | x2) = N (x1 | µ1|2, Σ1|2)
µ1|2 = µ1 + Σ12Σ−1
22
¡
x2 − µ2
¢
= µ1 − Λ−1
11 Λ−1
12
¡
x2 − µ2
¢
= Σ1|2
¡
Λ11µ1 − Λ12
¡
x2 − µ2
¢¢
Σ1|2 = Σ11 − Σ12Σ−1
22 Σ21 = Λ−1
11
(2.14)
Using Theorem 2.1 with the results in equation 2.14 on p
¡
f∗ | y, X , X∗
¢
with
x1 = f∗,
x2 = y,
µ =
"
µ1
µ2
#
=
"
m(X∗)
m(X )
#
,
Σ =
"
Σ11 Σ12
Σ21 Σ22
#
=
"
K (X∗, X∗) K (X∗, X )
K (X∗, X )T K (X , X ) + σ2
n I
#
(2.15)
gives the resulting distribution
p(f∗ | y, X , X∗) = N
¡¯f∗, Cov(f∗)
¢
,
¯f∗ = m(X∗) + K (X∗, X )[K (X , X ) + σ2
n I ]−1(y − m(X )),
Cov(f∗) = K (X∗, X∗) − K (X∗, X )[K (X , X ) + σ2
n I ]−1K (X∗, X )T .
(2.16)
Equation 2.16 shows the Gaussian process regression equations. The equations can
be written in the following compact form
¯f∗ = m(X∗) + K∗[K + σ2
n I ]−1 ¡
y − m(X )
¢
(2.17)
Cov(f∗) = K∗∗ − K∗[K + σ2
n I ]−1K T
∗ . (2.18)
The posterior covariance matrix Cov (f∗) is used to describe the uncertainty with the
predictions given by ¯f∗, for example in terms of a confidence region. Note that the
covariance matrix Cov(f∗) in equation 2.18 does only depend on X and X∗ which in
the context of trajectory prediction are the time instances for the training points and
16


## Page 33

the predictive time instances, respectively.
2.4.2 Extrapolation via Gaussian Process Regression
It is common to assume that the prior function mean at X and X∗ are zero due to
either simplicity or lack of information. Assuming the prior function mean to be zero
m(X ) = m(X∗) = 0 is by no means necessary and using equations 2.17 and 2.18 with
non-zero prior function mean is possible [5].
Using a kernel k(x, x∗) that approaches zero as the distances between x and x∗ ap-
proaches infinity results in
¯f∗ = m(X∗) + 0 · [K + σ2
n I ]−1 ¡
y − m(X )
¢
= m(X∗) (2.19)
meaning that the posterior mean function tends towards the posterior mean. A ker-
nel that give rise to this behavior is the RBF kernel
k(x, x∗) = σ2
f exp
µ
−(x − x∗)2
2l 2
¶
. (2.20)
This is important to be aware of since the mean function is usually set to zero which
in turn greatly affect extrapolation predictions which can be seen in figure 2.8.
17


## Page 34

Figure 2.8: Gaussian process regression using a RBF kernel with zero pos-
terior mean trained on points ’+’ from a sinus curve. The figure shows what
can occur when performing extrapolation using a RBF kernel. The extrap-
olation predictions tends towards the posterior mean. Figure created in
MATLAB.
In figure 2.8 it is seen that the Gaussian process regression accurately interpolates
and decently extrapolates close to the last training point. However, further away from
the last training point the extrapolation gets worse since the predictive function goes
towards the mean function which is set to zero. When it is not desired for the poste-
rior mean to tend towards the mean as ∥xi − x j ∥ → ∞ the use of combining kernels
can be used, especially equation 2.6 which is the addition of kernels. When adding
for example a RBF kernel with a linear kernel the properties from the RBF kernel can
be achieved without the problem that the predictive function goes towards zero as
∥xi − x j ∥ → ∞.
2.4.3 GPR Algorithm
The following is a construction of a standard GPR algorithm. Assumingm(X ) = 0 and
m(X∗) = 0 the GPR equations are
¯f∗ = K∗[K + σ2
n I ]−1y (2.21)
Cov(f∗) = K∗∗ − K∗[K + σ2
n I ]−1K T
∗ . (2.22)
18


## Page 35

Let α = [K + σ2
n I ]−1y and K y = [K + σ2
n I ]. Utilizing a Cholesky decomposition of K y
where L is lower triangular gives K y = LL T . Hence α can be expressed as
α = K −1
y y = L−T L−1y. (2.23)
The algorithm to calculate ¯f∗ is done by performing the Choleksy decomposition on
K y and then calculating α thus calculating ¯f∗ via ¯f∗ = K∗α.
Let v = L−1K T
∗ then the posterior covariance matrix Cov(f∗) can be written as
Cov(f∗) = K∗∗ − K∗K −1
y K T
∗
= K∗∗ − K∗
¡
L−T L−1¢
K T
∗
= K∗∗ − K∗
¡
L−T L−1¢
K T
∗
= K∗∗ − v T v.
(2.24)
The algorithm to calculate the posterior covariance matrix Cov(f∗) is thus to calculate
v = L−1K T
∗ and then utilizing Cov (f∗) = K∗∗ − v T v. Algorithm 1 shows a standard
implementation of a GPR algorithm, with the permission from the author [5].
Algorithm 1 Standard GPR Algorithm
input: X (inputs), y (targets), k(covariance function), σ2
n(noise) , x∗(test input)
L := cholesky(K + σ2
n I )
α := LT \(L\y)
¯f∗ := k∗α
v := L\kT
∗
V [f∗] := k(x∗, x∗) − vT v
log p
¡
y | X
¢
:= − 1
2 yT α − Σi logLi i − n
2 log2 π
return: ¯f∗(mean), V [f∗] (variance), log p
¡
y | X
¢
(log marginal likelihood)
In algorithm 1 log p
¡
y | X
¢
is included which is the log marginal likelihood which is
covered in the Log Marginal Likelihood section 2.5.1 of the Hyperparameter Opti-
mization chapter 2.5.
19


## Page 36

The method of predicting with a Gaussian process regression model is straightfor-
ward to conduct since algorithm 1 is easy to implement. Algorithm 1 could be even
more simplified where the use of a Choelsky decomposition is ignored which would
turn the algorithm into solving for ˜α in K y ˜α = y and then multiplying K∗ with ˜α to
get ¯f∗ = K∗ ˜α. However, this simplification is unnecessary and the use of a Cholesky
decomposition is faster and numerically more stable [5].
2.4.4 Bayesian Non-parametric Model
Gaussian process regression is closely related to Bayesian statistics. Bayes’ theorem
given two events A and B is the following
P(A | B) = P(B | A)P(A)
P(B) (2.25)
which can be expressed as [5]
posterior = likelihood × prior
marginal likelihood (2.26)
where
P(A | B) = posterior,
P(B | A) = likelihood,
P(A) = prior,
P(B) = marginal likelihood.
Notice how Bayesian statistics being based on Bayes’ theorem uses a prior probabil-
ity P(A) which is updated using the factor P(B | A)/P(B) to give a posterior P(A | B).
This is very similar to Gaussian process regression with a prior distribution that is
updated using observed data that gives a posterior distribution.
A parametric model assumes that the data can be modeled using a finite set of pa-
rameters. For example in simple linear regression the model function is y = α + βx
which requires that α and β are specified. Data with a complex pattern may not be
20


## Page 37

possible to be described by a linear model function and thus require more parame-
ters, for example a polynomial of second degree y = α + βx + γx2. The complexity of
the model is limited by the number of parameters and thus having a model that can
increase the number of parameters as the size of the dataset increases in order to cap-
ture a potentially more complex behavior is referred to as anon-parametric model [6].
Gaussian process regression does not have a fixed set of parameters, instead it uses
a distribution over functions directly. GPR is therefore a Bayesian non-parametric
model.
2.5 Hyperparameter Optimization
The parameters of the covariance functions are known as hyperparameters [5]. The
hyperparameters greatly affect the result of the predictive function. The RBF kernel
k(x, x∗) = σ2
f exp
µ
−(x − x∗)2
2l 2
¶
(2.27)
has two hyperparameters l and σ2
f which are referred to as length scale and output
variance or signal variance, respectively [5, 10]. The output variance exists in every
kernel and always acts as a scale factor [10]. Figure 2.9 illustrates how the length scale
hyperparameter affects the predictive function.
21


## Page 38

(a) l = 0.3
 (b) l = 20
Figure 2.9: Illustrating how the length scale hyperparameter l in the RBF
kernel affects the predictive function. The training points ”+” in subfigure
2.9a and subfigure 2.9b are the same. Figure created in MATLAB.
The distance between the test point x∗ at which a prediction is sought and at a train-
ing point x is divided by the length scale hyperparameter. The interpretation is there-
fore that if the length scale is large then the distance between x and x∗ needs to be
large to have an effect. A large scale length would then in theory make the predictive
function in some sense ”smoother” . This is clearly seen in figure 2.9 when comparing
subfigure 2.9a with 2.9b that the predictive function in the case l = 20 is smoother
compared to when l = 0.3.
2.5.1 Log Marginal Likelihood
The kernel along with the hyperparameters are crucial for the resulting predictive
function as seen in previous sections. In order to determine how well the predictive
function fits the training data a log marginal likelihood implementation can be used.
The distribution of the training data p(y | X ) describes the probability of observation
targets y given observation inputs X which then should be optimized to a maximum
value. The distribution p(y | X ) is also known as marginal likelihood since a parame-
ter X has been integrated out [5]
p(y | X ) =
Z
p(y | f, X )p(f | X )df. (2.28)
22


## Page 39

Using equation 2.28 gives the log marginal likelihood
log p
¡
y | X
¢
= −1
2 yT α − 1
2 log
¡
det(K + σ2
n I )
¢
− n
2 log(2π) (2.29)
Alternatively, a negative log marginal likelihood can be introduced [11]
−log p
¡
y | X
¢
= 1
2 yT α + 1
2 log
¡
det(K + σ2
n I )
¢
+ n
2 log(2π) (2.30)
which then is supposed to be minimized. Note that
1
2 log
¡
det(K + σ2
n I )
¢
= Σi logLi i (2.31)
where the right-hand side of equation 2.31 is used in the standard GPR algorithm 1.
2.5.2 Grid Search
Using log marginal likelihood it is possible to quantify the performance of the GPR
model trained on the training data. Finding the most optimal hyperparameters Θ is
very difficult and often not possible [12]. Finding a local maximum of logp
¡
y | X , Θ
¢
is
practically more realistic and can be done by performing, for example, a grid search.
Grid search is a very simple optimization method where a finite set of values for each
hyperparameter is specified in advance and then evaluating the value of logp
¡
y | X , Θ
¢
for each combination of the sets [13]. Subfigure 2.10a illustrates the grid search hy-
perparameter optimization method.
2.5.3 Random Search
Grid search is very simple and straightforward. The problem with grid search is that
it suffers from ”the curse of dimensionality” which refer to the wasted grid search
trials that increase exponentially with the number of search dimensions [12]. One
alternative to grid search is random search which instead of a fixed set interval for
the grid search space a random interval is used. Grid search versus random search
is illustrated in figure 2.10. According to Bergstra et al. [12] the random search is at
least as good or better than the grid search when searching over the same domain.
23


## Page 40

(a) Grid search.
 (b) Random search.
Figure 2.10: Comparing grid search and random search for two hyperpa-
rameters x1 and x2. The black dots represent specific permutations of the
hyperparameters. The blue curves are example of contour lines of some
function for example logp
¡
y | X , Θ
¢
. Figure created in Microsoft Paint with
inspiration from [14].
Figure 2.10 illustrates the special case where the grid is square, meaning the inter-
val for hyperparameter x1 and x2 are identical. This is not necessary. A rectangular
grid could also be used and may be beneficial, for example, given that the interval
range of interest for one of the hyperparameters is different compared to the other
hyperparameter.
2.6 Real time vs Execution time
Predicting the trajectory for tpred amount of seconds forward of some object does
not give an accurate description of the location of that object at that given time. The
prediction must include the execution time denoted texe which is the time it takes
for the algorithm to perform the calculations that calculate the positional prediction.
The real time denoted treal is the elapsed time in the physical world for the motion of
24


## Page 41

the object. The equation to calculate the real time is therefore
treal = tpred + texe. (2.32)
Figure 2.11 is used to illustrate the problem that arises when not including the execu-
tion time. The prediction algorithm starts at four seconds. Assuming the execution
time for the algorithm is one second, the algorithm is then finished at the five second
mark and aims to predict one second forward in time. The positional prediction of
the object is thus at six meters, when in the physical world the true position of the
object is at five meters.
Figure 2.11: Object travelling in one dimension. Blue points indicate mea-
sured position. Dotted black point is the predicted position of the object
one second forward in time from the perspective of the algorithm without
considering execution time and the green point is the true position of the
object. Figure created in Microsoft Paint.
One requirement for the execution time texe is that texe < tpred meaning that the exe-
cution time must be less than the desired of amount of time forward for the predic-
tion of the object.
25


## Page 42

2.7 Machine Learning
Gaussian processes fall under the category of machine learning which can be de-
scribed as learning done by a machine or algorithm. The use of the term ”learn-
ing” refers in a broad sense to when a machine alters its structure, program, or data
based on external information or some input [15]. This can be related to Gaussian
processes regression where a prior distribution is constructed and then updated by
observations which results in a posterior distribution which is the updated belief.
According to Rasmussen et al. [5] the Gaussian process is ”[...] one of the most im-
portant Bayesian machine learning approaches [...]” [5, p. xi]. One important aspect
of machine learning is the concept of preprocessing the data before it is analyzed.
Preprocessing is the act of removing corrupt data values, organizing and normalizing
the data.
2.7.1 Normalization
Normalization of data refers to scaling the data, usually scaling it so the data range
is between zero and one. Scaling the data is performed in order to improve perfor-
mance and numerical stability. Figure 2.12 illustrates the effects of not normalizing
the data in the context of Gaussian process regression. While figure 2.13 shows the
effect of normalizing the data.
26


## Page 43

(a) Magnitude of data initially between 0 and
1 which has not been scaled. Figure created in
MATLAB.
(b) Magnitude of data initially between 0 and
10 which has not been scaled. Figure created
in MATLAB.
Figure 2.12: The effect the magnitude of the data has on the predictive
function. RBF kernel was used with zero mean with grid search hyperpa-
rameter optimization giving the hyperparameters seen in the subfigures.
The log marginal likelihood is also shown and denoted as ”logp” .
Figure 2.13: Normalizing the data that was used in subfigure 2.12b. Figure
created in MATLAB.
27


## Page 44

It can be seen from figure 2.12 that the large values in subfigure 2.12b contribute to an
inferior fit at the test points. The inferior fit can be seen visually and by log marginal
likelihood compared to the data that is already between zero and one in subfigure
2.12a. The solution is as already stated, to normalize the data which is performed in
figure 2.13 which has the large values with the same fit as in subfigure 2.12a.
There exist numerous methods of scaling data for example Z-score, Min-Max scal-
ing and Decimal scaling [16, 17]. The scaling method used in figure 2.13 was done
by simply dividing all values with the magnitude of the largest value in the data set,
referred to as maximum absolute scaling [18]. Commonly after the data has been
normalized it is scaled back to original magnitude, as was done in figure 2.12b.
2.8 Kalman Filter
Kalman filter (KF) is an algorithm that incorporates linear dynamical equations 2 in
order to estimate the state x of some dynamical system. The term filter in Kalman
filter refers to filtering out unwanted noise from the measurements [21]. One of the
main differences between GPR and Kalman filter is that Kalman filter uses dynamical
equations while GPR does not use any dynamical equations. Consider a state vector
x =


x
y
z
˙x
˙y
˙z


(2.33)
where x, y and z represent the position of the target relative to the guided projectile.
The velocity of the target relative to the guided projectile for each axis corresponds
to ˙x, ˙y and ˙z. The state vector is what the Kalman filter will estimate. The dynamical
equations, which depend on the problem and design choice of the model, are usually
2There exist extensions to Kalman filter that use non-linear dynamical equations, for example Ex-
tended Kalman filter [19, 20].
28


## Page 45

expressed by a state transition matrix. The state transition matrix A is used to predict
next instance of the state vector by using equation [22]
xk+1 = Axk (2.34)
where A is
A =


1 0 0 dt 0 0
0 1 0 0 dt 0
0 0 1 0 0 dt
0 0 0 1 0 0
0 0 0 0 1 0
0 0 0 0 0 1


(2.35)
with dt being equal to one time step. Equation 2.34 then corresponds to
xk+1 = xk + d t · ˙xk
yk+1 = yk + d t · ˙yk
zk+1 = zk + d t · ˙zk
˙xk+1 = ˙xk
˙yk+1 = ˙yk
˙zk+1 = ˙zk.
(2.36)
The state transition matrix A as described by equation 2.35 assumes constant velocity
which can also be seen in equation 2.36. It is not necessarily true that the target
will have constant velocity and therefore constructing a state vector that would also
include acceleration could be considered
29


## Page 46

x =


x
y
z
˙x
˙y
˙z
¨x
¨y
¨z


(2.37)
which would give a state transition matrix
A =


1 0 0 dt 0 0 1
2dt2 0 0
0 1 0 0 dt 0 0 1
2dt2 0
0 0 1 0 0 dt 0 0 1
2dt2
0 0 0 1 0 0 dt 0 0
0 0 0 0 1 0 0 dt 0
0 0 0 0 0 1 0 0 dt
0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 1


. (2.38)
However, this is not suitable in the context of the problem description since the ac-
celeration of the target cannot be measured. Therefore the state transition matrix
that will be used in this thesis will be the one described by equation 2.35.
The Kalman filter consists of two main steps: predict and update, see figure 2.14.
30


## Page 47

Figure 2.14: The Kalman filter algorithm and its two main steps: predict
and update. Figure created in Microsoft Paint with inspiration from [23].
The predict step consists of equation 2.34 that regards predicting the next instance of
the state vector using the dynamical equations and of predicting the next instance of
the state covariance matrix. The state covariance matrix P describes the uncertainty
of the state estimates and is given by [22]
Pk+1 = AP k AT +Q (2.39)
where Q is the process noise covariance matrix which regards uncertainty related to
the dynamical model.
The update step consists of updating the state vector and updating the state covari-
ance matrix which is done by the following equations [22]
xk+1 = xk + Kk+1
£
yk+1 − Hk+1xk
¤
(2.40)
Pk+1 = [I − Kk+1Hk+1]Pk (2.41)
where y are measurements,H is the state-to-measurement matrixand K is the Kalman
gain. The state-to-measurement matrix is used to specify which states in the state
31


## Page 48

vector that are measured. The measurements for the problem in this thesis consists
of the spherical angle coordinates θ and φ which together with some distance r are
converted into Cartesian coordinates. Hence, the state-to-measurement matrix will
be the following
H =


1 0 0 0 0 0
0 1 0 0 0 0
0 0 1 0 0 0

. (2.42)
The Kalman gain is a weight given to the measurements and the predictions. It can
be regarded as how much the model trusts measurements versus the dynamical pre-
diction. The Kalman gain is calculated as following [22]
Kk+1 = Pk H T
k+1
£
Hk+1Pk H T
k+1 + R
¤−1
(2.43)
R is the measurement covariance matrix that describes the uncertainty related to the
measurement. All the relevant terms for the Kalman filter are summarized in table
2.2.
Table 2.2: Kalman filter terms.
Term Name
x State variable
P State Covariance matrix
A State transition matrix
H State-to-measurement matrix
R Measurement covariance matrix
Q Process noise covariance matrix
y Measurements
K Kalman gain
The measurements received can be assumed to be and seen as a normal distribution,
32


## Page 49

where the mean of the distribution is yk+1 and the covariance is given by Rk+1. The
dynamical prediction referred to as process will also have some uncertainty and can
therefore also be assumed to be and seen as a normal distribution, where the mean
is xk+1 and the covariance is Qk+1. The Kalman filter combines the normal distri-
bution from the measurements and the process. The combined normal distribution
will also be a normal distribution but with meanxk+1 and covariance Pk+1. The com-
bined normal distribution is the posterior distribution and will in the next iteration
be the prior distribution. One cycle of the algorithm is then complete and the cycle
can continue. This is illustrated in figure 2.14.
In figure 2.14 it can be observed that KF uses a prior distribution and posterior dis-
tribution, recall that GPR also uses a prior and posterior distribution. In subsection
2.4.4 it was explained that the use of a prior and posterior is based on Bayes’ theorem.
KF is therefore also a Bayesian model.
33


## Page 50

This page was intentionally left blank


## Page 51

Chapter 3
Estimating Three Dynamic States from
Two Parameters
This chapter presents two potential methods for the problem of estimat-
ing the distance between the target and the guided projectile. One of the
methods being an geometrical approach is presented, but will not be suf-
ficiently developed and will thus not be used. Another approach, based
on the assumption that the speed of the target is small compared to the
speed of the guided projectile is presented and will be used in this thesis.
In the problem formulation it is stated that the guided projectile has only the angles
θ and φ from a spherical coordinate system with origin at the guided projectile as
input data, see figure 3.1.
35


## Page 52

Figure 3.1: Spherical coordinate system. Origin at guided projectile M. Tar-
get represented by label ’T’ . Figure created in Microsoft Paint.
The initial distance between the guided projectile and target is known. The trajectory
of the guided projectile is also considered known. Based on the initial distance, the
trajectory of the guided projectile and measurements consisting of θ and φ some es-
timation of the distance r between the guided projectile and target is needed. Find-
ing a good estimation method for this is not an easy task and there exists at least
one case where it is impossible to perform any reasonable estimation. Consider the
case where the trajectory of both the guided projectile and target are travelling on the
same line. The angles θ and φ are zero and it is impossible to determine if the target is
travelling towards or away from the guided projectile. Assuming that the target trav-
els either away or towards the target gives a large uncertainty in the estimation of the
distance since the two potential trajectories will have drastically different distances
between target and guided projectile.
Methods of estimating the distance between target and guided projectile are a geo-
metrical approach where using the measurements of the angles θ and φ to perform
an estimation. A different method which neglects the use of θ and φ completely and
is not geometrical based is the Low Speed Approximation method.
36


## Page 53

3.1 Geometrical Attempt
The issue that arises with a geometrical approach is shown in figure 3.2. In figure 3.2
the target T is initial at some position and then moves along either path ”1” or ”2” .
It is not possible to know if T has travelled along path 1 or 2, and for both paths the
angle α will be equal. The angle α represents one of the spherical coordinate angles,
either θ or φ.
Figure 3.2: Illustrating the problem related to the angles when estimating
the distance between target T and guided projectile M . Figure created in
Microsoft Paint.
Knowing the speed of the target would be beneficial since all the paths that are too
long or too short can be omitted. The circle in figure 3.3 represents the possible po-
sitions that the target can have after some given time. The radius of the circle can
be calculated if the speed of the target is known or calculated and thus the path ’2’
can be omitted since it is not on the circle and therefore the trajectory of the target
must have travelled along either path ’1’ or ’3’ . Hence, even with the speed of the tar-
37


## Page 54

get known the correct path cannot be determined. The speed of the target is by the
problem formulation not known and the speed of the target is not necessarily con-
stant. The speed of the target could perhaps be estimated using the rate of change
of θ and φ which can be calculated using the measurement frequency. The measure-
ment frequency is known and can be used for such calculations.
Figure 3.3: The circle represents all the potential points where the target
can exist after some given time. Figure created in Microsoft Paint.
Note that figure 3.2 and 3.3 have been used to illustrate the situation for two dimen-
sions but the same concepts apply for three dimensions. The circle in figure 3.3 is a
sphere in three dimensions. The line in figure 3.2 where T can exist is also a line in
three dimensions where both θ and φ are considered.
3.2 Low Speed Approximation
The Low Speed Approximationis a simple method of estimating the distance between
T and M. Assuming that the speed of the target is very small compared to the speed
38


## Page 55

of the guided projectile then from the perspective of the guided projectile the target
is approximately fixed in space, and thus only the trajectory of the guided projectile
needs to be considered in order to estimate the distance. Assuming that the guided
projectile is faster than the target is fair. However, approximating that the speed of
M is much larger than the speed of T could be a stretch. In a realistic context the
difference in speed can and will be assumed to be a factor between 2 and 5. The Low
Speed Approximation is the method that will be used in this thesis to estimate the
distance between T and M.
39


## Page 56

This page was intentionally left blank


## Page 57

Chapter 4
Algorithm
This chapter aims to break down vital aspects of the full implementation of
the algorithm that executes the trajectory prediction using GPR. The chap-
ter follows the order of the intended implementation and then presents the
complete implementation. The last section of the chapter regards the im-
plementation of the KF .
4.1 Parameters, Trajectory and Setup
Parameters that are static compared to the hyperparameters that are tuned in every
iteration need to be specified. The static parameters that are considered are shown
in table 4.1.
41


## Page 58

Table 4.1: Explanation of Parameters
Parameter Explanation
σ2
n Noise variance: The variance of the noise that is added to
the measurements.
winLen Window Length: Number of observations that will be in-
cluded in a single time series window.
N Total number of observations.
numP Total number of prediction points.
numPred Number of predictions between two measurements.
mFreq Measurement Frequency: The frequency of the incoming
measurements.
The trajectory of the guided projectile and the target are predetermined and con-
structed as matrices with sizes 3 × numP or numP × 3 that represent three spatial
coordinates for every time step. The trajectory of the guided projectile is known for
the model and the trajectory of the target is unknown. The model will only use mea-
surements from the predetermined target trajectory. In practical applications, the
trajectory of the guided projectile would typically be controlled by a dedicated con-
trol system. However, implementing such a system is beyond the scope of this thesis.
The trajectories that will be considered can be seen in table 4.2.
Table 4.2: Target and guided projectile trajectories that will be considered.
The ’-’ in this context indicates a trajectory transition where it transitions
from the left hand side of the ’-’ to the right hand side.
Target Guided Projectile
Harmonic - Exponential Square root
Exponential - Spiral Square root
Linear Square root
The ’Harmonic-Exponential’ target trajectory consists of a trajectory that is linear in
42


## Page 59

two axes and oscillates harmonically in the third axis. The target trajectory transi-
tions after some while from oscillating harmonically to increasing exponentially. The
’Exponential-Spiral’ target trajectory has linear motion in two axes and is exponen-
tially increasing in the third axis. The target trajectory shifts from exponential growth
to linear growth, while concurrently adopting circular motion in the plane created by
the other two axes. The ’Linear’ target trajectory is linear in two axes and does not
increase or decrease in the third axis. The ’Linear’ is the only target trajectory that
does not have any transition into a different trajectory. The guided projectile trajec-
tory has a square root curvature in one axis and is linear in the other two axes.
The kernel and mean function need to be predetermined. Recall equation for the
posterior mean
¯f∗ = m(X∗) + K∗[K + σ2
n I ]−1 ¡
y − m(X )
¢
. (4.1)
The mean function m(X∗) and m(X ) will be set to zero since it is assumed there exists
no known preferred trajectory of the target. The choice of kernel will be a combined
kernel with the argument from the theory chapter that most common kernels have
the property of tending towards zero when the test points are far away from the last
observation. The combined kernel used was RBF + linear.
4.2 Guided Projectile Relative Target
The target T moves relative to the guided projectile M and the guided projectile is
moving relative to some stationary coordinate system O, see figure 4.1.
43


## Page 60

Figure 4.1: The guided projectile has a non-stationary spherical coordinate
system M relative to a stationary Cartesian coordinate system O. Target is
labeled T . Figure created in Microsoft Paint.
In order to implement the non-stationary coordinate system relative to the stationary
coordinate system the trajectories of the guided projectile and target are created in
Cartesian coordinates relative O. The trajectory of T relative M can be constructed
by the vector relation shown in figure 4.1. The vector from M to T equals the vector
from O to T subtracted by the vector fromO to M. In other words, the coordinates of
T relative M equals the coordinates of T relative O subtracted by the coordinates M
relative O. The coordinates T relative M are transformed into spherical coordinates
using
r =
q
x2 + y 2 + z2
θ = arccos zp
x2 + y 2 + z2
φ = sgn(y)arccos xp
x2 + y 2
.
(4.2)
Algorithm 2 illustrates the construction of the coordinates for T relative O defined as
T O and transforming T O into spherical using function car t 2sph based on equation
4.2. The coordinates of M relative O are defined as MO .
44


## Page 61

Algorithm 2 Constructing relative spherical coordinates
1: function SPHERICAL RELATIVE COORDINATES (TO,MO)
2: T M ← T O− MO
3: θ, φ,r ← car t 2sph (T M)
4: return θ, φ,r
5: end function
The angle coordinates θ and φ of T relative M will be referred to as ”measurements”
or ”measured coordinates” as they constitute the sole input data for the problem.
4.3 Coordinate Transformation
The previous sections regarded setting up an environment and constructing input
data also referred to as measurements. The model that transforms the input into an
output consists of a loop that begins by transforming the measurementsθ and φ into
to Cartesian coordinates using
x = r E st sin θ cos φ
y = r E st sin θ sin φ
z = r E st cos θ
(4.3)
where r E st is defined as the estimated distance between T and M. Recall that the
first element of r E st = r0 = r (t = 0). Note that using equation 4.3 gives the Cartesian
coordinates of target relative M. Recall that the coordinates of the guided projectile
are known. The measured Cartesian coordinates of the target relative O defined as
T Omeasur ed can therefore be simply constructed by adding the measured Carte-
sian coordinates of target relative M with the known Cartesian coordinates of the
guided projectile, as seen in algorithm 3.
Algorithm 3 Spherical coordinates to Cartesian coordinates
1: function MEASURED TARGET COORDINATES (r E st,θ, φ)
2: T Mmeasur ed ← sph 2car t (r E st, θ, φ)
3: T Omeasur ed ← T Mmeasur ed + MO
4: return T Omeasur ed
5: end function
45


## Page 62

4.4 Estimating the Distance
The first iteration of the loop uses r E st = r0 = r (t = 0), the next iteration requires
an estimation of the distance between T and M. As stated in chapter 3 the method
that will be used is theLow Speed Approximation. The initial distance between T and
M is T Omeasur ed (1). The location of the guided projectile relative O for time step
i t er+1 is MO (i ter +1), thus the location forT relative M is T M = T Omeasur ed (1)−
MO (i t er + 1). The distance between T and M is then the length of the vector T M.
See algorithm 4 that presents pseudocode for estimating the distance between the
target and the guided projectile.
Algorithm 4 Estimation of distance between target and guided projectile
1: function TM DIST (θ, φ)
2: T M ← T Omeasur ed (1) − MO (i t er + 1)
3: r E st(i t er + 1) ← sqr t (sum ((T M)2))
4: return r E st(i t er + 1)
5: end function
4.5 Sliding Window
The standard GPR algorithm (algorithm 1) is applied to a single time series window.
The model could be implemented in a manner where all the available observation
points are considered, that would however be highly computational expensive and
not necessarily better. Consider a case where the trajectory of the target has initially
a distinct form and then after some time it alters to a different distinct trajectory. It
could be beneficial to neglect the previous observations and only use the observa-
tions from the new distinct trajectory. In the context of the problem description of
this thesis a time series window is required due to mainly execution time demands
which limits the computational load. The implementation is that a predetermined
window length is set and the algorithm collects data to fill a window and then per-
forms a single iteration of the standard GPR algorithm. When the next observation is
available the window slides to capture that new observation and excludes the oldest
observation in the previous window. This process is illustrated in figure 4.2.
46


## Page 63

Figure 4.2: Illustrating how the GPR algorithm acts on a single window
which slides to the next observation. The standard GPR algorithm acts on
observations Xi and generates predictions P j . Figure created in Microsoft
Paint.
A large window length could be beneficial for achieving good positional estimates of
target which could be computationally fast enough to meet execution time demands.
However, one con with a large window length is that the algorithm needs to wait for
a long period before it can start to perform the standard GPR algorithm and perform
predictions.
Figure 4.3 shows an example of a window length of 2, where 2 specifies the number
of measurements Xi . The number of predictions between measurements, numPred,
equals to 3. For every rectangle in figure 4.3 consisting of either a measurement or
prediction is specified by a time index. The time index is related to a specific time for
the trajectories. For example if the time steps between each time index is 1 second
then time index 5 would correspond to 5 seconds into the flight of the target and
the guided projectile. The time step in the implementation will always be fixed. The
time step is inversely proportional to the update frequency which is the frequency
that regulates some system. The time index corresponding to the measurements and
predictions will be stored in vectors tObsI ndex and t Pr ed I ndex, respectively. The
time instances for the measurements and predictions are thus t(tObsI ndex ) and
t(t Pr ed I ndex).
47


## Page 64

Figure 4.3: Time series window and its constituent parts. Figure created in
Microsoft Paint.
Implementing a sliding window in terms of code is easily done by selecting window
length of elements from the matrix containingT Omeasur ed and then for every iter-
ation the index of the selected elements of theT Omeasur ed matrix are incremented
by one.
4.6 Hyperparameter Optimization
When the data has been prepared for a single time series window it will undergo a
hyperparameter optimization before the standard GPR algorithm is executed. The
hyperparameter optimization is done by performing either a grid search or random
search and evaluating the log marginal likelihood. The hyperparameters giving the
maximum log marginal likelihood for the given search space are stored and used
in the standard GPR algorithm. Algorithm 5 shows hyperparameter optimization
with grid search. The hyperparameter optimization algorithm with random search
is equivalent to algorithm 5 but replacing the step ”Creating the grid” with the grid
that is shown in algorithm 6.
48


## Page 65

Algorithm 5 Hyperparameter Optimization with grid search
1: lGr i d ← st ar t : st ep : end ▷ Creating the grid
2: σf Gr i d ← st ar t : st ep : end
3: for i = 1 : l eng t h(lGr i d) do ▷ Iterating over grid
4: l ← lGr i d(i )
5: for j = 1 : l eng t h(σf Gr i d) do
6: σf ← σf Gr i d(j )
7: function KERNEL (ti , t j ) ▷ Defining RBF + linear kernel
8: return σf · exp (−0.5 · sum ((ti − t j )2)/l 2) + σf · (t T
i · t j )
9: end function
10: K ← Kernel(t(tObsI ndex ), t(tObsI ndex ))
11: L ← chol esk y (K + σ2
n · I )
12: α ← L′\(L\wi ndow )
13: l og p(i , j ) ← −0.5wi ndow T · α − Σk logLkk − (wi nLen /2) · l og(2π)
14: end for
15: end for
16: l og pM ax,l , σf ← max (l og p) ▷ Storing l, σf and the maximum value of l og p
Algorithm 6 Random search
1: lGr i d = r and (st ar t,end ) ▷ Creating grid with random points
2: σf Gr i d = r and (st ar t,end )
4.7 GPR Implementation
The previous sections of this chapter deconstructed and examined parts of the full
implementation of the GPR trajectory prediction algorithm. In algorithm 7 the com-
plete implementation of the GPR trajectory prediction algorithm used is shown. Al-
gorithm 7 describes the implementation in pseudocode. The programming language
used in this thesis was MATLAB. A flowchart of the GPR trajectory prediction algo-
rithm is shown in figure 4.4.
49


## Page 66

Start
Input Measurement
Coordinate Transformation
Estimating the distance between T and M
Iteration≥Window Length?
Slide Window
Hyperparameter Optimization
Standard GPR Algorithm
Iteration=End?
Stop
Yes
No
no
Yes
Figure 4.4: Flowchart of the trajectory prediction algorithm based on the
GPR model with sliding window. Figure created using TikZ.
50


## Page 67

Algorithm 7 Trajectory Prediction Implementation using GPR with Sliding Windows
1: for i t er = 1 : N · numPr ed do
2: T Omeasur ed ← MeasuredTargetCoordinates
¡
r E st, θ, φ
¢
3: r E st(i t er + 1) ← TMdist
¡
θ, φ
¢
4: if iter ≥ winLen then
5: wi ndow ← T Omeasur ed (1 + i t er − wi nLen : i ter ) ▷ Sliding window
6: lGr i d ← st ar t : st ep : end ▷ Creating the grid
7: σf Gr i d ← st ar t : st ep : end
8: for i = 1 : l eng t h(lGr i d) do ▷ Iterating over grid
9: l ← lGr i d(i )
10: for j = 1 : l eng t h(σf Gr i d) do
11: σf ← σf Gr i d(j )
12: function KERNEL (ti , t j ) ▷ Defining RBF + linear kernel
13: return σf · exp (−0.5 · (ti − t j )2/l 2) + σf · (ti · t j )
14: end function
15: K ← Kernel(t(tObsI ndex ), t(tObsI ndex ))
16: L ← chol esk y (K + σ2
n · I )
17: α ← L′\(L\wi ndow )
18: l og p(i , j ) ← −0.5wi ndow T · α − Σk logLkk − (wi nLen /2) · l og(2π)
19: end for
20: end for
21: l og pM ax,l , σf ← max (l og p) ▷ Store optimal hyperparameters
22: function KERNEL (ti , t j ) ▷ Defining kernel with optimal hyperparameters
23: return σf · exp (−0.5 · (ti − t j )2/l 2) + σf · (ti · t j )
24: end function
25: K∗ ← Kernel(t(tObsI ndex ), t(t Pr ed I ndex)) ▷ Standard GPR algorithm
26: L ← chol esk y (K + σ2
n · I )
27: α ← L′\(L\wi ndow )
28: ¯f∗ ← K∗ · α
29: end if
30: end for
4.8 Error Estimation and Performance
The log marginal likelihood (LML) can be used to evaluate the performance of the
model as described in thetheory chapter. However, since a new GPR model is trained
for every time series window with a corresponding LML meaning that there is not a
single LML that can be used as reference. Numerous methods of solving this could
51


## Page 68

be used, for example an average over all LML could be used or choosing the LML
with the lowest value. A more simple method of quantifying the performance is by
terms of error. The error is the difference between the predicted position and the true
position. The disadvantage with this method is that using ocular inspection of an
error plot can yield ambiguous conclusions. Nonetheless, the error plot is interesting
and will be calculated and shown in the Results and Discussion chapter.
4.9 KF Implementation
The KF implementation will be identical to the GPR implementation in terms of ini-
tial set up. Meaning that the trajectories, measurement frequency, number of pre-
dictions, total number of observations and the method for estimating the distance
between the target and guided projectile will be identical to the GPR implementa-
tion. There will be no scaling of the data for the KF implementation, since this is not
necessary.
Designing a KF involves determining the terms listed in table 2.2. Some of the KF
terms have already been determined by the problem formulation as described in sec-
tion 2.8 of the theory chapter. The initial state variable will be
x =


x
y
z
˙x
˙y
˙z


(4.4)
where the initial position x, y, z and the initial velocity ˙x, ˙y and ˙z are specified. The
state transition matrix will be defined as
52


## Page 69

A =


1 0 0 dt 0 0
0 1 0 0 dt 0
0 0 1 0 0 dt
0 0 0 1 0 0
0 0 0 0 1 0
0 0 0 0 0 1


(4.5)
where dt = 0.01 to represent an update frequency of 100Hz. The state-to-measurement
matrix is set to
H =


1 0 0 0 0 0
0 1 0 0 0 0
0 0 1 0 0 0

. (4.6)
The initial state covariance matrix P needs to be defined. Recall from section 2.8 in
the theory chapter that the state covariance matrix describes the uncertainty for the
state estimates. It will be assumed that the initial state covariance is small, it will be
set to the identity matrix, P = I . Regardless of the initial P it will be altered by both
the prediction step and the update step.
The measurement covariance matrix R will be equal to the standard deviation σ of
the present Gaussian noise. It will be assumed that there is no correlation between
noise across different axes, as in the case for the GPR model, which is a fair assump-
tion that reflects real-world conditions. Therefore R will be set to R = σI . The ex-
perimental trials where there are no Gaussian noise R will be defined as R = 10−9I to
represent zero noise. The reason for avoiding R = 0I is to avoid potential issues with
numerical stability.
The process noise covariance matrix Q can be compared to R. The relation between
Q and R determines if the KF model will give more weight towards measurements or
towards process 1. The process noise covariance will be set to Q = I .
1The term ’process’ refers to the dynamical aspect of the KF . Recall section 2.8 of the theory chapter.
53


## Page 70

A flowchart of the KF algorithm is shown in figure 4.5 and the algorithm in terms of
pseudocode is shown algorithm 8.
Start
Predict
If measurement
Coordinate transformation
Estimating the distance between T and M
Update
If End
Stop
Yes
No
no
Yes
Figure 4.5: Flowchart of the trajectory prediction algorithm for the KF
model. Figure created using TikZ.
54


## Page 71

Algorithm 8 Trajectory Prediction Implementation using KF
1: for i t er = i : numP do
2: x ← Ax ▷ Predict
3: P ← AP AT +Q
4: if mod (i − 1,numPr ed ) = 0 then
5: j ← j + 1
6: T Omeasur ed ← MeasuredTargetCoordinates
¡
r E st, θ, φ
¢
7: r E st(j + 1) ← TMdist
¡
θ, φ
¢
8: K ← (P HT )/(HP H T + R) ▷ Update
9: x ← x + K (T Omeasur ed (j )T − H x)
10: P ← (I − K H)P
11: end if
12: ¯f∗ ← x(1 : 3) ▷ Store predicted target position
13: end for
55


## Page 72

This page was intentionally left blank


## Page 73

Chapter 5
Results and Discussion
The beginning of this chapter presents potential issues with the quality
of data for the GPR model. Thereafter the results for the GPR model with
three spherical coordinates input are shown and discussed, this section
has few prediction points and other settings in order to more easily visu-
alize the behavior of the GPR model. The following section regards the
main problem of this thesis, using the GPR model, without noisy input.
The main results without noise are compared to the equivalent three co-
ordinate input case. Thereafter the main results, predicting the trajectory
of a target using GPR with two noisy spherical angle coordinates as input
to a guided projectile, are presented. The concluding sections show the
results for the equivalent set up and trajectories but with the KF model
instead of the GPR model. The results for the KF model are compared
against the results for the GPR model. The last section of this chapter
regards future improvements and future aspects of investigation for the
GPR model.
The LML and the hyperparameters presented in the figures of this chapter does only
correspond to the last window of all the iterations. This will be the case for all figures
when there is window sliding. Section 5.1 does not regard window sliding. The kernel
that will be used for all results is the combined kernel RBF + linear. All results will use
grid search with the grid range 1 : 9 : 100 for l and 1 : 1 : 10 for σf unless otherwise
stated.
57


## Page 74

5.1 Data preprocessing
Scaling the data is important as presented in the theory chapter 2 subsection 2.7.1.
Figure 5.1 shows the potential issues with scaling.
(a) Scaling the data by a factor of 10. Figure
created in MATLAB.
(b) Scaling the data by a factor of 10 4. Figure
created in MATLAB.
Figure 5.1: Maximum absolute scaling on data points from the function
x(Y ) = 10 sin0.9Y using two different factors. Rescaling was done in both
subfigures. The combined kernel of RBF and linear was used. The hyper-
parameters l and σf along with log marginal likelihood at the top of the
subfigures. The hyperparameter range is 0.1 : 1 : 100 using grid search. The
absolute difference between the predictive function andx(Y ) = 10 sin0.9Y
is shown at the bottom of the subfigures.
In subfigure 5.1a the magnitude of the data is between 0 and 1 while in subfigure 5.1b
the magnitude is between 0 and 10−3. This results in the interesting behavior that the
log marginal likelihood (LML) is larger for the case with scale factor 10 4 but has an
inferior fit compared to the case with scale factor 10. It can also be observed that
both hyperparameters are at opposite boundaries of the hyperparameter range. The
result in figure 5.1 shows that the data can be scaled down too much and that LML
can be misleading. Increasing the hyperparameter boundary for the case shown in
subfigure 5.1b gives the result shown in figure 5.2.
58


## Page 75

(a) Interval Y = [−5, 10]. Figure created in MATLAB.
 (b) Interval Y = [−5, 5]. Figure created in MATLAB.
Figure 5.2: The same setup as in subfigure 5.1b with hyperparameter range
0.1 : 10 : 1000.
Figure 5.2 shows an increase in LML compared to subfigure 5.1b and with an even
worse fit. It can also be seen in figure 5.2 that the hyperparameter optimization again
adopted the boundary value. This indicates that when the data is scaled down too
much the LML cannot be used and the hyperparameter optimization will adopt the
boundary values.
Realistic magnitude range of the data for the problem presented in this thesis is be-
tween 0 and 105 meters. Using the maximum absolute scaling on this data would give
a scaling factor of 105 which could yield issues as seen in figure 5.1 and figure 5.2.
5.2 GPR: Three Spherical Coordinates Input
The optimal case in terms of input is when the input consists of three spherical co-
ordinates namely r, θ and φ. In the optimal case with r, θ and φ as input then the
trajectory of the guided projectile does not affect the results more than rounding er-
rors. This is not the case for when only θ and φ are the input and r is estimated since
the performance of the estimation depends on the guided projectile trajectory.
59


## Page 76

This section aims to investigate and illustrate how the model behaves which is easier
when the number of predictions are few and the size of the trajectories are small. The
results in this section uses the parameters shown in table 5.1
Table 5.1: Parameters and corresponding value used in this section.
Parameter Value
Noise Variance 10−9 m2
Window Length 5
Number of Observations 46
Measurement Frequency 4 Hz
Number of Predictions between Measurements 10
The value 10−9 m2 of the noise variance in table 5.1 can be considered zero and thus
represent noise free measurements. The reason that the noise variance is non-zero
instead of exactly zero is to ensure thatK remains positive definite , a prerequisite for
the Cholesky decomposition.
Figure 5.3 shows the result for target trajectory consisting of harmonic oscillation that
alters midway to an exponential trajectory.
60


## Page 77

(a) Three-dimensional plot of the harmonic-exponential target
trajectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) plotted
against time, when target follows a harmonic-
exponential trajectory. Figure created in MAT-
LAB.
Figure 5.3: Three spherical coordinates as input for harmonic-exponential
trajectory of the target.
It can be seen in subfigure 5.3a that the predictions are worse for when predicting
the oscillating trajectory compared to the exponential trajectory. This is confirmed
in subfigure 5.3b where the absolute error is larger in the z-axis. The absolute error
for the x and y components are identical which is to be expected since the trajectory
is equal in x and y. It can also be noted in subfigure 5.3b that the absolute error in-
creases at the transition between the two trajectories, which is expected. For some of
the first measurements in the exponential trajectory the model struggles. However,
when the window has moved far enough to not include any measurements from the
oscillating part of the trajectory and only from the exponential part it immediately
performs accurate predictions. Interestingly it can be seen in subfigure 5.3a that the
model overshoots at the harmonic oscillation trajectory. The reason for this is most
likely that the kernel is a combined kernel consisting of RBF + linear. Recall that RBF
61


## Page 78

is an exponentiated quadratic kernel which also explains the low absolute error and
good fit for the exponential trajectory part of the complete trajectory.
In subfigure 5.3a it can be seen that the hyperparameters for the last window were
the boundary values which indicates issues with the hyperparameter optimization.
Nonetheless, the absolute errors are small and the overall result can be considered
good.
Figure 5.4a shows the result for the exponential-spiral trajectory. The first part of
the trajectory is exponential that later transforms into a spiral linear incline. Judg-
ing from subfigure 5.4a the prediction seems very accurate. This is confirmed by the
absolute error plot in subfigure 5.4b. The model struggles at most in the transition,
as expected. One possible explanation for the good prediction fit is due to the RBF +
linear kernel. It seems that the two different types of trajectories can be represented
by either the RBF or the linear part of the kernel. This could be used as an argument
to combine more types of kernels to include more types of behaviors. The risk with
including more kernels is that all kernels will be considered and thus could influence
the overall performance in a negative way. One interesting approach to this is using
a dynamical kernel that alters what type of kernel being used depending on the be-
havior of the trajectory. This is beyond the scope of this thesis but can be seen as an
area for more research and development.
62


## Page 79

(a) Three-dimensional plot of the exponential-spiral target tra-
jectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) plot-
ted against time, when the target follows an
exponential-spiral trajectory. Figure created in
MATLAB.
Figure 5.4: Three spherical coordinates as input for exponential-spiral tra-
jectory of the target.
The length scale hyperparameter l did not take the boundary value of the grid for the
last window in the case of exponential-spiral target trajectory as can be seen in figure
5.4a. The hyperparameter σf did take the lower boundary value, indicating that the
lower boundary could perhaps have been lower.
Figure 5.5a shows a target trajectory that is linear in all three components. The abso-
lute error is very small as can be seen in figure 5.5b. The oscillating behavior of the
absolute error plot is due to the model using a window of measurements to make 10
predictions. The predictions that are further away get worse and worse resulting in an
increase of the absolute error. The window slides and performs new predictions that
start closer to the newest measurement compared to the prediction that was furthest
away in the previous window, the absolute error is therefore very small compared to
63


## Page 80

the previous point. This gives the oscillating behavior seen in the absolute error plot.
The absolute error in the z-axis is so small that it cannot be analyzed and may be due
to rounding errors or other types of error such as floating-point errors.
(a) Three-dimensional plot of the linear target trajectory. Figure
created in MATLAB.
(b) Absolute error components (x,y,z) plotted
against time, when the target follows a linear
trajectory. Figure created in MATLAB.
Figure 5.5: Three spherical coordinates as input for linear trajectory target.
The hyperparameters l and σf did once again take the boundary values of the grid
for the linear target trajectory case, as seen in figure 5.5a.
5.3 GPR: Two Spherical Coordinates Input with Guided
Projectile
The results in this section use the parameters shown in table 5.2.
64


## Page 81

Table 5.2: Parameters and corresponding value used in this section.
Parameter Value
Noise Variance 10−9 m2
Window Length 5
Number of Observations 800
Measurement Frequency 4 Hz
Number of Predictions between Measurements 25
The update frequency of the model is
Number of Predictions between Measurements
1/Measurement Frequency = 100 Hz. (5.1)
The total elapsed time for the flight of the target and guided projectile can be calcu-
lated by multiplying the number of observations with the inverse of the measurement
frequency. This gives the total elapsed time to approximately 200 s≈ 3.33 min.
Table 5.3 shows important parameters that can be calculated or derived.
Table 5.3: Derived parameters used in this section.
Derived Parameter Value
Update Frequency 100 Hz
Total Elapsed Time 200 s
Target Speed ≈ Mach1
Guided Projectile Speed ≈ Mach3
Subfigure 5.6a shows an overview of an guided projectile moving towards a target
with harmonic-exponential trajectory. Subfigure 5.6b shows corresponding absolute
error in x, y, z and r .
65


## Page 82

(a) Three-dimensional plot of the harmonic-exponential target
trajectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) and r
plotted against time, when the target follows
a harmonic-exponential trajectory. Figure cre-
ated in MATLAB.
Figure 5.6: Two spherical coordinates as input for harmonic-exponential
target trajectory.
It is difficult to observe the shape of target trajectory and corresponding prediction
in subfigure 5.6a. Excluding the guided projectile from the plot makes the target
trajectory and prediction easier to comprehend. Figure 5.7 depicts the harmonic-
exponential target trajectory without the guided projectile.
66


## Page 83

Figure 5.7: Three-dimensional plot of the harmonic-exponential target
trajectory with two spherical coordinates as input. Plotted without guided
projectile. Figure created in MATLAB.
Illustrated in figure 5.7 it can be seen that the prediction resembles the overall shape
of the target trajectory but is slightly rotated. The rotation is due to the estimation of
r . The absolute error of r seen in figure 5.6b is seemingly large. The absolute error of
r has a local peek with a magnitude of approximately 104 m that is 104/(2·105) = 5% of
the total initial distance between target and guided projectile. After the local peak the
absolute error goes towards zero and then increases again when the guided projec-
tile is about to pass by the target. The absolute error for the trajectory prediction inx
and z of the target is very small until the very end at the exponential trajectory part of
the target trajectory. The absolute error in y mirrors that of r , which is unsurprising
given that the guided projectile primarily travels along the y axis towards the target.
Consequently, the disparity betweenr and y is minimal, resulting in a similarly small
difference in absolute error between the two.
In subfigure 5.6b it can be seen that there is no oscillating behavior as in subfigure
5.5b. The reason for this is that the prediction starts from the previous measurement
but the measurement is not necessarily on the true path of the target trajectory since
67


## Page 84

only two input parameters are available, as seen in figure 5.7. Hence it will generally
not display an oscillating behavior in the absolute error plot when there are only two
spherical coordinate angles as input.
The exponential-spiral target trajectory with guided projectile along with correspond-
ing absolute errors in x, y, z and r is presented in figure 5.8. The exponential-spiral
target trajectory without the guided projectile is presented in figure 5.9.
(a) Three-dimensional plot of the exponential-spiral target tra-
jectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) and r
plotted against time, when the target follows
an exponential-spiral trajectory. Figure cre-
ated in MATLAB.
Figure 5.8: Two spherical coordinates as input for exponential-spiral target
trajectory.
The absolute error for the exponential-spiral target trajectory shown in subfigure 5.8b
illustrates that the absolute error for y and r behaves in the same manner as for the
harmonic-exponential target trajectory. The shape of the absolute error for x and z
are very similar but the magnitude of the absolute error of x is twice as large com-
pared to absolute error for z. Notice that the absolute error for x, y and z are almost
zero when the absolute error for r is close to zero at the end of the trajectory. This is
68


## Page 85

to be expected since if r is given then predicting the trajectory of the target is more
simple as was seen in section 5.2. This will also be shown in section 5.3.1.
Figure 5.9: Three-dimensional plot of the exponential-spiral target trajec-
tory with two spherical coordinates as input. Plotted without guided pro-
jectile. Figure created in MATLAB.
Figure 5.9 shows that the predicted trajectory is rotated in a similar manner to the
harmonic-exponential target trajectory. The spiral part of the predicted trajectory re-
sembles a spiral in the beginning but later transforms into some other shape. One
possible explanation for this is that the absolute error forr increases at the end of the
trajectory due to the guided projectile is about to travel past the target. The increase
in the absolute error of r could be the reason for the resulting misshape at the end of
the spiral of the prediction trajectory.
The linear target trajectory with guided projectile along with corresponding absolute
errors in x, y, z and r is presented in figure 5.10. The linear target trajectory without
the guided projectile is presented in figure 5.11.
69


## Page 86

(a) Three-dimensional plot of the linear target trajectory. Figure
created in MATLAB.
(b) Absolute error components (x,y,z) and r
plotted against time, when the target follows
a linear trajectory. Figure created in MATLAB.
Figure 5.10: Two spherical coordinates as input for linear target trajectory.
The absolute error in z is close to zero, as seen in subfigure 5.10b. This is expected
since the target trajectory does not alter the position in z and thus the model should
not predict the target to increase or decrease inz. Notice that the plot for the absolute
error in z seems to be filled in, which is not the case. The absolute error in z consists
of a dense amount of oscillations. This is expected since oscillating behavior for the
absolute error plots will arise when the measurements lie on the true path for the tar-
get trajectory, which is the case for linear target trajectory since there is no motion in
the z-axis.
The target trajectory and the corresponding prediction are more easily visualized
without the guided projectile, this is shown in figure 5.11. The absolute error in x
is small except at the very end. The absolute error in y is as for the other trajectories
similar in shape to the absolute error of r .
70


## Page 87

Figure 5.11: Three-dimensional plot of the linear target trajectory with two
spherical coordinates as input. Plotted without guided projectile. Figure
created in MATLAB.
The hyperparameter optimization has at least for the last window taken one or both
of the boundary values as has been seen from the results in section 5.2 and 5.3. Trying
to manually alter the scaling in order to find a region where the hyperparameter op-
timization does not take the boundary values gives the results seen in figure 5.12 and
5.13. The manually altering of scaling the data is done for the linear target trajectory
which can be compared with the linear trajectory result in figure 5.10.
71


## Page 88

(a) Three-dimensional plot of the linear target trajectory. Figure
created in MATLAB.
(b) Absolute error components (x,y,z) and r
plotted against time, when the target follows
a linear trajectory. Figure created in MATLAB.
Figure 5.12: Two spherical coordinates as input for linear target trajectory.
Manually scaled data.
In figure 5.12 it can be seen that the LML is lower compared to the results in subfigure
5.10a even when the hyperparametersl and σf do not take the boundary values. The
absolute errors seem similar to the result in subfigure 5.10b except for the absolute
error in z. The absolute error in z is large in the beginning compared to subfigure
5.10b where the absolute error in z is close to zero. The peak of the absolute error
in z in subfigure 5.12b is approximately 10 times larger than the absolute error of z
in subfigure 5.10b. The absolute error of z in subfigure 5.12b seems to be close to
zero. Figure 5.13 shows the absolute error in z for the time interval 100-200 seconds.
It can be seen in figure 5.13 that the error is not exactly zero but very close to it. The
absolute error in z after the peak is so small that it could be due to rounding errors.
72


## Page 89

Figure 5.13: Absolute error of z-component plotted against time, when the
target follows a linear trajectory. Manually scaled data. Figure created in
MATLAB.
The execution times for the trajectories in this section can be observed in table 5.4.
Table 5.4: Execution times for GPR.
Target Trajectory Execution Time (s) Execution time for one iteration (s)
Harmonic-Exponential 2.52 3.15 · 10−3
Exponential-Spiral 2.61 3.26 · 10−3
Linear 2.66 2.66 · 10−3
The execution times for one iteration for the three different target trajectories are less
than the inverse of the measurement frequency 1/4 Hz = 0.25 s. This means that the
calculation time for a single prediction is shorter than the time it takes to receive an
incoming measurement which is required as explained in section 2.6 of the theory
chapter. The total execution time for all 25 predictions can be estimated by multi-
plying the execution time for one iteration by 25 in table 2.11. It can be easily seen
that even the execution time for the total number of predictions between two mea-
73


## Page 90

surements is greatly shorter than the time it takes to receive a measurement. This
execution time result is desirable and can be seen as good.
5.3.1 Three Spherical Coordinates Input Comparison
The results presented in section 5.3 can be compared with those of an identical case,
but with all three spherical coordinates used as input instead. Figure 5.14, 5.15 and
5.17 illustrate the results for the trajectories presented in section 5.3 but with three
spherical coordinates input.
(a) Three-dimensional plot of the harmonic-exponential
target trajectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) plotted
against time, when the target follows a harmonic-
exponential trajectory. Figure created in MATLAB.
Figure 5.14: Three spherical coordinates as input for exponential-spiral
target trajectory corresponding to figure 5.6.
The absolute error shown in subfigure 5.14b shows that the absolute error is much
smaller compared to the identical case with three coordinates as input seen in sub-
figure 5.6b. The spike in the absolute error of x, y and z that is seen subfigure 5.14b is
due to the transition from harmonic oscillating trajectory to exponential trajectory.
The absolute error that arises due to the transition is distinctly seen and previously
74


## Page 91

discussed for figures 5.3 and 5.4. The absolute error from the transition can be mit-
igated using small window length since a smaller window length is less sensitive to
new patterns in the target trajectory. A larger window length would widen the abso-
lute error peak that arise due to an alteration in trajectory pattern.
The absolute error plots in subfigure 5.14b seem to be filled in, as expected. The re-
sults regard three spherical coordinates as input and thus as explained in section 5.3.
The prediction will start from the previous measurement and since the measurement
lie on the true path of the target trajectory it will in several instances predict away
from the true path, thus increasing in absolute error, and then drop down when the
new measurement is received.
The oscillating shape of the absolute error inz is due to the same reason as discussed
in relation to figure 5.3. The model overshoots for harmonic oscillation target trajec-
tory, which was clearly seen in subfigure 5.3a.
75


## Page 92

(a) Three-dimensional plot of the exponential-spiral tar-
get trajectory. Figure created in MATLAB.
(b) Absolute error components (x,y,z) plot-
ted against time, when the target follows an
exponential-spiral trajectory. Figure created in
MATLAB.
Figure 5.15: Three spherical coordinates as input for exponential-spiral
target trajectory corresponding to figure 5.8.
The absolute error in x and z for the exponential-spiral target trajectory seen in sub-
figure 5.15b is close to zero except for the absolute error peak that arise from the
transition from exponential to spiral trajectory.
The absolute error iny for both the trajectories harmonic-exponential and exponential-
spiral are very similar. This absolute error in y is an artefact from the data. Altering
the location of the trajectory in y in such a manner that x and y have the same scale,
seen in figure 5.16, makes the artefact disappear.
76


## Page 93

(a) Three-dimensional plot of the exponential-spiral tar-
get trajectory with x and y having the same scale. Figure
created in MATLAB.
(b) The absolute error in x, y and z corresponds to
subfigure 5.16a. Figure created in MATLAB.
Figure 5.16: Three spherical coordinates as input for exponential-spiral
target trajectory where x and y have the same scale.
The absolute errors inx, y and z does in subfigure 5.16a almost only consist of the ab-
solute error peak that arise from the target trajectory transition, after x and y having
the same scale. This indicates once again the importance of the quality of the data
discussed in the Machine learning section 2.7 of the theory chapter and in section 5.1
at the beginning of the Results and Discussion chapter.
In figure 5.17 the linear target trajectory with three coordinates as input is shown
along with corresponding absolute errors. The absolute errors do not show any sign
of trajectory transition peak as expected. The shape of the absolute error of x, y and
z resembles the shape of the absolute error in y of figure 5.14 and 5.15. Altering the
initial location of the linear target trajectory to (0, 0, 0) in order to achieve the same
scale of x, y and z as done previously in figure 5.16, is performed for the linear target
trajectory and shown in figure 5.18.
77


## Page 94

(a) Three-dimensional plot of the linear target trajectory.
Figure created in MATLAB.
(b) Absolute error components (x,y,z) plotted
against time, when the target follows a linear tra-
jectory. Figure created in MATLAB.
Figure 5.17: Three spherical coordinates as input for linear target trajec-
tory corresponding to figure 5.10.
78


## Page 95

Figure 5.18: Alter the initial location of the linear target trajectory to (0,0,0)
in order to achieve the same scale in all axes. Figure created in MATLAB.
Figure 5.18 illustrates that the absolute error in x and y after the altering of the target
location is equal in shape and magnitude, as expected. The absolute error ofz seems
to be noise and may be due to rounding errors.
5.4 GPR: Noisy Measurements
In a realistic context the measurements y will have some noise ϵ, recall section 2.4.1
of the theory chapter. Assuming ϵ is IID Gaussian noise with a standard deviation
(SD) of 50 m and with the same parameters (table 5.2) as in section 5.3, gives the
results shown in figure 5.19, 5.20 and 5.21.
79


## Page 96

Figure 5.19: Absolute error components (x,y,z) and r plotted against time,
when the target follows a harmonic-exponential trajectory, using GPR.
Gaussian noise with SD of 50 m. Figure created in MATLAB.
Figure 5.20: Absolute error components (x,y,z) and r plotted against time,
when the target follows a exponential-spiral trajectory, using GPR. Gaus-
sian noise with SD of 50 m. Figure created in MATLAB.
80


## Page 97

Figure 5.21: Absolute error components (x,y,z) and r plotted against time,
when the target follows a linear trajectory, using GPR. Gaussian noise with
SD of 50m. Figure created in MATLAB.
When comparing figures 5.19, 5.20 and 5.21 with subfigures 5.6b, 5.8b and 5.10b it
can be seen that the respective absolute error plot have the same overall shape with
an element of noise, as expected. The noise is most easily observed for the absolute
error components that have small absolute error magnitude, for example the abso-
lute error in x in figure 5.19.
5.5 KF: Two Spherical Coordinates Input with Guided Pro-
jectile
Figure 5.22, 5.23 and 5.24 shows the results for two spherical angle coordinates as
input with guided projectile using KF instead of GPR. The target trajectory and guided
trajectory plots have been omitted from this section since it will be very similar to the
plots in section 5.3. The absolute error plot is the main interest since it is used for
evaluating performance.
81


## Page 98

Figure 5.22: Absolute error components (x,y,z) and r plotted against time,
when the target follows a harmonic-exponential trajectory, using KF . Gaus-
sian noise with SD of 50 m. Figure created in MATLAB.
Figure 5.23: Absolute error components (x,y,z) and r plotted against time,
when the target follows an exponential-spiral trajectory, using KF . Gaus-
sian noise with SD of 50 m. Figure created in MATLAB.
82


## Page 99

Figure 5.24: Absolute error components (x,y,z) and r plotted against time,
when the target follows a linear trajectory, using KF . Gaussian noise with
SD of 50m. Figure created in MATLAB.
The execution times using KF for the harmonic-exponential, exponential-spiral and
linear target trajectory are shown in table 5.5.
Table 5.5: Execution times for KF .
Target Trajectory Execution Time (s) Execution time for one iteration (s)
Harmonic-Exponential 0.095 4.57 · 10−6
Exponential-Spiral 0.112 5.41 · 10−6
Linear 0.0984 4.73 · 10−6
The measurement frequency is 4 Hz and thus the measurements have an interval
of 0.25 s which is much larger than the execution for iteration, hence the execution
times are sufficiently short. Also note that the execution time for one iteration is a fac-
tor of 1000 smaller compared to GPR, see table 5.4 for execution times for GPR. Recall
that the GPR model calculates all the predictions between two measurements in one
iteration while the KF model calculates only one prediction per iteration. Therefore,
83


## Page 100

for a fair comparison between KF and GPR the results in table 5.4 should be divided
by 25, which is the number of prediction points between two measurements, and
then compared against table 5.5. The execution time difference is then in the order
of 100. The difference in execution between KF and GPR is still large. However, GPR
has the potential to be much faster if for example the hyperparameter optimization
were implemented differently. The hyperparameter optimization is very time con-
suming, and as the results have shown, the hyperparameter optimization does not
contribute to the performance since the hyperaparameters almost always take the
boundary values. Nonetheless, a faster execution time is not necessarily important
as long as it is sufficiently fast, as explained in section 2.6 of the theory chapter.
The only difference between the results in figures 5.22, 5.23 and 5.24 with figures 5.19,
5.20 and 5.21 is the model, GPR versus KF . It can be observed that the overall shape
of the error plots are the same for both GPR and KF .
Comparing GPR and KF for the harmonic-exponential target trajectory it can be ob-
served that GPR performs better in the z-axis, see figure 5.25. This is exepected since
there is acceleration in the z-axis. However, KF performed better than GPR in the
x-axis, which can more easily be seen in figure 5.26. The KF also performed slightly
better than GPR in the y-axis, as easily visualized in figure 5.27.
84


## Page 101

(a)
 (b)
Figure 5.25: Comparing KF versus GPR for harmonic-exponential target
trajectory in the z-axis. Two input parameters with Gaussian noise where
SD is 50 m. The error plots forx, y, z and r for harmonic-exponential target
trajectory for GPR and KF can be seen in figure 5.19 and 5.22, respectively.
Figure created in MATLAB.
(a)
 (b)
Figure 5.26: Comparing KF versus GPR for harmonic-exponential target
trajectory in the x-axis. Two input parameters with Gaussian noise where
SD is 50 m. The error plots forx, y, z and r for harmonic-exponential target
trajectory for GPR and KF can be seen in figure 5.19 and 5.22, respectively.
Figure created in MATLAB.
85


## Page 102

(a)
 (b)
Figure 5.27: Comparing KF versus GPR for harmonic-exponential target
trajectory in the y-axis. Two input parameters with Gaussian noise where
SD is 50 m. The error plots forx, y, z and r for harmonic-exponential target
trajectory for GPR and KF can be seen in figure 5.19 and 5.22, respectively.
Figure created in MATLAB.
Comparing figure 5.20 and 5.22 it can be seen that the results for GPR and KF where
target trajectory is exponential-spiral are very similar. Recall that the spiral part of
the target trajectory is linear in the z-axis and thus KF has the possibility to perform
well in that axis. The main difference between the results is that GPR have a more
distinct noise compared to KF .
Comparing figure 5.21 and 5.24 shows that the results for GPR and KF are similar
except for in the z-axis. GPR has a very large absolute error at the very end of the
flight path which is most likely due to the guided projectile passing by the target and
thus largely increases the absolute error in r which affects the absolute error in z.
The KF does not have this large absolute error at the end which could be attributed to
the dynamical aspect of KF where it can give less weight to measurements and more
weight to the dynamics and thus giving a better result. Neglecting the larger absolute
error in the end for GPR the KF outperforms GPR by a factor of around 4, which can
be more easily seen and compared to using figure 5.29. This is expected since KF is
the general case better than GPR when the target trajectory behaves linearly. GPR,
however, can be better than KF where there is non-linear motion, as was seen when
comparing KF and GPR for the harmonic-exponential target trajectory.
86


## Page 103

(a)
 (b)
Figure 5.28: Comparing KF versus GPR for linear target trajectory in the
z-axis. Two input parameters with Gaussian noise where SD is 50 m. The
error plots for x, y, z and r for linear target trajectory for GPR and KF can
be seen in figure 5.21 and 5.24, respectively. Figure created in MATLAB.
Figure 5.29: Absolute error components (x,y,z) and r plotted against time,
when the target follows a linear trajectory, using GPR. Gaussian noise with
SD of 50m. Figure created in MATLAB.
5.6 KF: Three Spherical Coordinates Input
The results for KF with three spherical coordinates input without noise are shown in
figures 5.30, 5.31 and 5.32. The results in figures 5.30, 5.31 and 5.32 are intended to
be compared to the identical set up but with GPR model instead of KF , see figures
5.14, 5.15 and 5.17. The three spherical coordinates input without noise for GPR are
discussed and shown in section 5.3.1.
87


## Page 104

Figure 5.30: Absolute error components (x,y,z) and r plotted against time,
when the target follows a harmonic-exponential trajectory, using KF .
Figure 5.31: Absolute error components (x,y,z) and r plotted against time,
when the target follows a exponential-spiral trajectory, using KF .
88


## Page 105

Figure 5.32: Absolute error components (x,y,z) and r plotted against time,
when the target follows a linear trajectory, using KF .
Comparing figure 5.14b with figure 5.30 it can be seen that the results are the same as
for the three coordinate case, discussed in section 5.5. KF performed slightly better in
the x-axis and y-axis compared to GPR in terms of absolute error, while GPR clearly
outperformed KF in the z-axis especially for the harmonic part of the harmonic-
exponential target trajectory, as seen in figure 5.33.
89


## Page 106

(a)
 (b)
Figure 5.33: Comparing KF versus GPR with three coordinates as input
for harmonic-exponential target trajectory in the z-axis. Figure created in
MATLAB.
For the exponential-spiral target trajectory with three coordinates as input the figures
5.15b and 5.31 should be compared. Recall from section 5.5 that there was no signif-
icant difference between KF and GPR for exponential-spiral target trajectory, besides
less noise in the results for KF compared to GPR. However, in the three coordinate
input case there is a significant difference, see figure 5.34. A difference between GPR
and KF is expected for the exponential-spiral target trajectory since it contains ac-
celeration. The reason that there was no significant difference between the results
of the GPR and KF in the two coordinate input case for the exponential-spiral target
trajectory could be attributed to the considerable noise present in the results of the
GPR model.
90


## Page 107

(a)
 (b)
Figure 5.34: Comparing KF versus GPR with three coordinates as input for
exponential-spiral target trajectory in the x-axis. Figure created in MAT-
LAB.
In figure 5.34 it can be seen that GPR performs better than KF in the spiral part of the
exponential-spiral target trajectory. The results for they-axis are the the same or very
similar to the results for the x-axis since the target trajectory is equivalent for both
axes. Figure 5.35 illustrates the difference for the exponential-spiral target trajectory
in the z-axis. It can be observed from figure 5.35 that GPR is slightly better than KF
before the large peak which is expected since there is acceleration in the exponential
part of the target trajectory. The peak right after 100s indicates the transition from
the exponential to the spiral target trajectory. This absolute error peak is prevalent
in the majority of the results as anticipated since there is a drastic difference in the
behavior of the target trajectory.
91


## Page 108

(a)
 (b)
Figure 5.35: Comparing KF versus GPR with three coordinates as input for
exponential-spiral target trajectory in the z-axis. Figure created in MAT-
LAB.
When comparing figure 5.17b or figure 5.18, representing GPR with and without al-
tering the target’ s initial location for the linear target trajectory respectively, to fig-
ure 5.32, which illustrates the KF equivalence without altering the initial location, KF
outperforms GPR in all three axes. This was anticipated and already indicated by the
results from section 5.5 where it was mainly seen in the z-axis, recall figure 5.28.
The results have shown that GPR can outperform KF where there is acceleration. This
could be somewhat anticipated from how the KF and GPR are designed. The state
transition matrix in the KF model assumes there is no acceleration and thus where
there is acceleration the KF model will most likely predict the trajectory of the tar-
get poorly. The reason the state transition matrix does not contain acceleration is
explained in section 2.8 of the theory section, the acceleration of the target cannot
be measured and thus it is not included. The GPR model which does not use dy-
namical equations for the trajectory predictions can incorporate acceleration by a
statistical approach, as has been seen by the results. This difference between the
92


## Page 109

GPR model and the KF model could be the reason why the GPR model outperformed
the KF model when there was acceleration.
5.7 Future Improvements and Future Aspects for Inves-
tigation
The GPR model developed in this thesis has plenty of room for improvement. It was
seen from the results that the hyperparameter optimization did not serve a purpose
since the hyperparameters l and σf in the majority of the results came to be the
largest and smallest possible value, respectively. The method for the hyperparameter
optimization being grid search was not the issue since using random search would
yield the same behavior. The issue was the quality of the trajectory data which is af-
fected by the scaling of the data. Maximum absolute scaling was used in order to try
to improve the quality of the data and thus improve the GPR model. While it did im-
prove the results it was still suboptimal since the hyperparameters almost always had
the same value. Nonetheless, the GPR model could still perform and generate good
results even though this issue existed. Improving the hyperparameter optimization
for the GPR model could be done by scaling the data differently, perhaps using loga-
rithmic scaling. Depending on the trajectory data different scaling methods could be
needed, which is an aspect that can be further investigated.
The kernel used for all the GPR results was the combined kernel RBF+linear. Other
types of kernel could be used for future investigations. One potential improvement
for the GPR model is using a dynamic kernel instead of a static kernel, meaning that
the kernel can change to a different kernel during the prediction algorithm. The type
of kernel is crucial for how the GPR model performs and thus having a dynamic ker-
nel that can alter and suit the present scenario would be optimal. How to determine
what kernel to use in the given moment is not necessarily easy and straightforward.
If prior knowledge regarding common trajectories is available then a selection of ker-
nels could be chosen where the specific kernel for some instance would depend on
the measurements received.
93


## Page 110

The window length was also static in the GPR model and not changed throughout
the results. Hence, investigating different window lengths is an aspect for future
investigation. Altering the window length is easy but developing an algorithm that
can determine when to alter the window length is not as easy. Having a large win-
dow length when the behavior of the target is predictable could be beneficial. Hav-
ing a small window length when the target alters its behavior or is unpredictable is
most likely beneficial since then the GPR can ignore older measurements that would
disturb the future predictions. Implementing this dynamic window length could be
done by some type of trigger, either by information that the target is planning to al-
ter its trajectory, for example being spotted by the target. The trigger could also be a
change in the measurements that indicates that the target seems to have a different
trajectory and thus, at least temporarily, decrease the window length.
Having a dynamic kernel and dynamic window length requires that the calculations
that governs the behavior of these are fast enough so that the prediction algorithm
can perform predictions before it is too late. This regards the time aspect of the tra-
jectory prediction as explained in section 2.6 of the theory chapter.
The distance estimation developed in chapter 3 were used for both the GPR model
and the KF model. This method for distance estimation between the target and the
guided projectile has room for improvement as already suggested in chapter 3. Im-
provements for estimating the distance consists of using geometry and the measure-
ments in order to perform better estimations compared to the Low-Speed Approxi-
mation. What could also be investigated is how the trajectory of the guided projectile
influences the method or methods for estimating the distance. Some guided projec-
tile trajectories gives more information than others, as also described in chapter 3.
In this thesis, three distinct trajectories were examined: harmonic-exponential,
exponential-spiral, and linear. However, exploring additional trajectories is an aspect
for future investigation that could offer valuable insights. For instance, circular tra-
jectories and those alternating between linear and non-linear trajectories.
94


## Page 111

For a fair comparison between GPR and KF it should be mentioned that also the KF
developed in this thesis can be improved. Improving the KF consists of altering the
design of the KF or using a different type of KF , as mentioned in section 2.8 from the
theory chapter, there exist multiple different types of KF . Other types of KF are for ex-
ample extended Kalman filter and unscented Kalman filter [19, 20].
KF and GPR seem to excel at different aspects of trajectory prediction, thus combin-
ing KF and GPR could potentially generate an even better model than using them
separately. Combining KF and GPR into a hybrid filter has been done before and is
termed KFGP1 by Reece et al. [24]. In the work by Reece et al. [24] they combine KF
and GPR for spatial-temporal modelling, where GPR is used to model the spatial field
and KF is used to model the temporal component.
1Composite of KF and GP .
95


## Page 112

This page was intentionally left blank


## Page 113

Chapter 6
Conclusion
This thesis aimed to investigate the use of Gaussian process regression (GPR) for pre-
dicting the trajectory of some target. The problem set up consisted of a guided pro-
jectile that received measurements of a target that was divided into two cases: two
and three spherical angle coordinates input. The spherical angle coordinates were of
the target relative the guided projectile. For the two spherical angle coordinate input
a method for estimating the third coordinate, being the distance between the guided
projectile and target, was needed. A simple Low Speed Approximation was used for
estimating the distance between target and the guided projectile.
The performance of the GPR model was analyzed by plotting the absolute error inx,y
and z Cartesian coordinates. A Kalman filter (KF) was implemented and conducted
on the same trajectories that were used for the GPR model. The purpose of this was to
compare two different models. GPR is a purely statistical model, thus, incorporating
no dynamics. KF on the other hand does incorporate dynamical equations in order
to perform trajectory predictions.
The results showed that GPR was very capable of predicting the trajectory of the tar-
get and executed the prediction calculations quickly enough. The GPR model is a
machine learning model that trains on previous measurements in order to predict
the future and thus the GPR model can be sensitive to the quality of the data. This
was seen in the results for the GPR model where scaling the data drastically changed
97


## Page 114

the performance. Another problem related to the GPR model is the hyperparame-
ter optimization that was deemed meaningless since the optimization almost every
single time chose the boundary values of the grid search. Future potential improve-
ments regarding the hyperaparameter optimization could be scaling the data differ-
ently compared to maximum absolute scaling.
KF being a common method for trajectory prediction did outperform GPR where the
target trajectory behaved linearly. In the instances where the target trajectory be-
haved non-linearly and thus having acceleration the GPR outperformed the KF . There
is a lot of potential for future improvements regarding the GPR model, for example:
dynamic kernel, dynamic window length and improving the hyperparameter opti-
mization. Nonetheless, the results in this thesis indicate that GPR could have a future
potential use for trajectory prediction.
98


## Page 115

Bibliography
1. Chen X, Wang X, and Xuan J. Tracking Multiple Moving Objects Using Unscented
Kalman Filtering Techniques. CoRR 2018; abs/1802.01235. arXiv:1802.01235.
Available from: http://arxiv.org/abs/1802.01235
2. Taylor LE, Mirdanies M, and Saputra RP. Optimized Object Tracking Technique
Using Kalman Filter. CoRR 2021; abs/2103.05467. arXiv: 2103.05467 . Avail-
able from: https://arxiv.org/abs/2103.05467
3. Shah A, S V A, Karthik K A, N NT, and Deshpande RR. Detecting, Tracking and
Predicting the Path of an Object. International Journal of Advance Research and
Innovative Ideas in Education 2023; 9:382–6
4. Becker A. Kalman Filter: From the Ground Up. 2nd. KalmanFilter.NET, 2023
5. Rasmussen CE and Williams CKI. Gaussian Processes for Machine Learning.
London, England: The MIT Press, 2006
6. Wang J. An Intuitive Tutorial to Gaussian Processes Regression. Computing in
Science &; Engineering 2023 :1–8. DOI : 10.1109/mcse.2023.3342149 .
Available from: http://dx.doi.org/10.1109/MCSE.2023.3342149
7. Alm S and Britton T. Stokastik: Sannolikhetsteori och statistikteori med tillämp-
ningar. Stockholm: Liber, 2008
8. Duvenaud DK. Automatic Model Construction with Gaussian Processes. PhD
thesis. University of Cambridge, 2014 Jun
9. Dai F. Machine Learning Cheat Sheet: Classical Equations and Diagrams in Ma-
chine Learning. 2017
99


## Page 116

10. Duvenaud D. The Kernel Cookbook. Online. (Accessed: 01 March 2024). Avail-
able from: https://www.cs.toronto.edu/~duvenaud/cookbook/
11. Chen Z and Wang B. How priors of initial hyperparameters affect Gaussian pro-
cess regression models. Neurocomputing 2018 Jan; 275:1702–10. DOI : 10 .
1016 / j . neucom . 2017 . 10 . 028. Available from: http : / / dx . doi .
org/10.1016/j.neucom.2017.10.028
12. Bergstra J and Bengio Y. Random Search for Hyper-Parameter Optimization.
Journal of Machine Learning Research 2012 :281–305
13. Feurer M and Hutter F. Hyperparameter Optimization. Automated Machine Learn-
ing: Methods, Systems, Challenges. Ed. by Hutter F, Kotthoff L, and Vanschoren J.
Cham: Springer International Publishing, 2019 :3–33. DOI : 10.1007/978-3-
030-05318-5_1 . Available from: https://doi.org/10.1007/978-
3-030-05318-5_1
14. Elvers A. Hyperparameter Optimization. [Accessed: 13 May 2024]. 2024. Avail-
able from: https://en.wikipedia.org/wiki/Hyperparameter_
optimization
15. Nilsson NJ. Introduction to Machine Learning—An Early Draft of a Proposed
Textbook. Robotics Laboratory, Department of Computer Science, Stanford Uni-
versity, Stanford. https : / / ai . stanford . edu / ~nilsson / MLBOOK .
pdf. 1998
16. Muhammad Ali P and Faraj R. Data Normalization and Standardization: A Tech-
nical Report. 2014 Jan. DOI : 10.13140/RG.2.2.28948.04489
17. Patro SG and Sahu DKK. Normalization: A Preprocessing Stage. IARJSET 2015
Mar. DOI : 10.17148/IARJSET.2015.2305
18. Amorim LB de, Cavalcanti GD, and Cruz RM. The choice of scaling technique
matters for classification performance. Applied Soft Computing 2023 Jan; 133:109924.
DOI : 10 . 1016 / j . asoc . 2022 . 109924. Available from: http : / / dx .
doi.org/10.1016/j.asoc.2022.109924
100


## Page 117

19. Madhukar PS and Prasad L. State Estimation using Extended Kalman Filter and
Unscented Kalman Filter. 2020 International Conference on Emerging Trends
in Communication, Control and Computing (ICONC3) . 2020 :1–4. DOI : 10 .
1109/ICONC345789.2020.9117536
20. Zarchan P and Musoff H. Fundamentals of Kalman Filtering: A Practical Ap-
proach. 3rd. American Institute of Aeronautics and Astronautics, 2009
21. Grewal MS and Andrews AP. Kalman Filtering: Theory and Practice Using MAT-
LAB. 3rd. Hoboken, NJ: Wiley, 2008
22. Franklin W. Kalman filter explained simply. The Kalman Filter. 2020. Available
from: https://thekalmanfilter.com/kalman-filter-explained-
simply/ [Accessed on: 2024 Apr 24]
23. Kelly J. Kalman Filter - Part 1. [Accessed: 13 May 2024]. 2021. Available from:
https://www.youtube.com/watch?v=LioOvUZ1MiM
24. Reece S and Roberts S. An introduction to Gaussian processes for the Kalman
filter expert. 2010 13th International Conference on Information Fusion . 2010
:1–9. DOI : 10.1109/ICIF.2010.5711863
101
