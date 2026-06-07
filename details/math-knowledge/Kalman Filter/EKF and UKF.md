# EKF_UKF.pptx

Converted from: `Kalman Filter\EKF and UKF.pdf`


## Page 1

Page 1!
EKF, UKF   Pieter Abbeel UC Berkeley EECS     Many slides adapted from Thrun, Burgard and Fox, Probabilistic Robotics
TexPoint fonts used in EMF.  Read the TexPoint manual before you delete this box.: AAAAAAAAAAAAA
n Kalman Filter = special case of a Bayes’ filter with dynamics model and sensory model being linear Gaussian:
Kalman Filter
2 -1


## Page 2

Page 2!
n At time 0:
n For t = 1, 2, … n Dynamics update:
n Measurement update:
Kalman Filtering Algorithm
4
Nonlinear Dynamical Systems n Most realistic robotic problems involve nonlinear functions:
n Versus linear setting:


## Page 3

Page 3!
5
Linearity Assumption Revisited
y y
x
x
p(x)
p(y)
6
Non-linear Function
“Gaussian of p(y)” has mean and variance of y under p(y)
y y
x
x
p(x)
p(y)


## Page 4

Page 4!
7
EKF Linearization (1)
8
EKF Linearization (2)
p(x) has high variance relative to region in which linearization is accurate.


## Page 5

Page 5!
9
EKF Linearization (3)
p(x) has small variance relative to region in which linearization is accurate.
10
n Dynamics model: for xt “close to” µt we have:
n Measurement model: for xt “close to” µt we have:
EKF Linearization: First Order Taylor Series Expansion


## Page 6

Page 6!
n Numerically compute Ft column by column:
n Here ei is the basis vector with all entries equal to zero, except for the i’t entry, which equals 1.
n If wanting to approximate Ft as closely as possible then ² is chosen to be a small number, but not too small to avoid  numerical issues
EKF Linearization: Numerical
n Given: samples {(x(1), y(1)), (x(2), y(2)), …, (x(m), y(m))}
n Problem: find function of the form f(x) = a0 + a1 x that fits the samples as well as possible in the following sense:
Ordinary Least Squares


## Page 7

Page 7!
n Recall our objective:
n Let’s write this in vector notation:
n       ,      giving:
n Set gradient equal to zero to find extremum:
Ordinary Least Squares
(See the Matrix Cookbook for matrix identities, including derivatives.)
n For our example problem we obtain a = [4.75; 2.00]
Ordinary Least Squares
a0 + a1 x


## Page 8

Page 8!
n More generally:
n In vector notation:
n         ,            gives:
n Set gradient equal to zero to find extremum (exact same derivation as two slides back):
Ordinary Least Squares
0 10 20 30 40 0 10 20 30 20 22 24 26
n So far have considered approximating a scalar valued function from  samples {(x(1), y(1)), (x(2), y(2)), …, (x(m), y(m))} with
n A vector valued function is just many scalar valued functions and we can approximate it the same way by solving an OLS problem multiple times.  Concretely, let  then we have:
n In our vector notation:
n This can be solved by solving a separate ordinary least squares problem to find each row of
Vector Valued Ordinary Least Squares Problems


## Page 9

Page 9!
n Solving the OLS problem for each row gives us:
n Each OLS problem has the same structure.  We have
Vector Valued Ordinary Least Squares Problems
n Approximate xt+1 = ft(xt, ut)
   with affine function a0 + Ft xt
   by running least squares on samples from the function:
 {( xt(1), y(1)=ft(xt(1),ut), ( xt(2), y(2)=ft(xt(2),ut), …, ( xt(m), y(m)=ft(xt(m),ut)}
n Similarly for  zt+1 = ht(xt)

Vector Valued Ordinary Least Squares and EKF Linearization


## Page 10

Page 10!
n OLS vs. traditional (tangent) linearization:
OLS and EKF Linearization: Sample Point Selection
traditional (tangent)
OLS
n Perhaps most natural choice:
n
n  reasonable way of trying to cover the region with reasonably high probability mass
OLS Linearization: choosing samples points


## Page 11

Page 11!
n Numerical (based on least squares or finite differences) could  give a more accurate “regional” approximation.  Size of region determined by evaluation points.
n Computational efficiency:
n Analytical derivatives can be cheaper or more expensive than function evaluations
n Development hint:
n Numerical derivatives tend to be easier to implement
n If deciding to use analytical derivatives, implementing finite  difference derivative and comparing with analytical results can help debugging the analytical derivatives
Analytical vs. Numerical Linearization
n At time 0:
n For t = 1, 2, … n Dynamics update:
n Measurement update:
EKF Algorithm


## Page 12

Page 12!
34
EKF Summary
n Highly efficient: Polynomial in measurement dimensionality k and state dimensionality n:               O(k2.376 + n2)
n Not optimal! n Can diverge if nonlinearities are large! n Works surprisingly well even when all assumptions are violated!
35
Linearization via Unscented Transform
EKF UKF


## Page 13

Page 13!
36
UKF Sigma-Point Estimate (2)
EKF UKF
37
UKF Sigma-Point Estimate (3)
EKF UKF


## Page 14

Page 14!
UKF Sigma-Point Estimate (4)
n Assume we know the distribution over X and it has a mean \bar{x}
n Y = f(X)
n EKF approximates f by first order and ignores higher-order terms
n UKF uses f exactly, but approximates p(x).
UKF intuition why it can perform better
[Julier and Uhlmann, 1997]


## Page 15

Page 15!
n When would the UKF significantly outperform the EKF?
n Analytical derivatives, finite-difference derivatives, and least squares will all end up with a horizontal linearization
à they’d predict zero variance in Y = f(X)
Self-quiz
x
y
Beyond scope of course, just including for completeness.   A crude preliminary investigation of whether we can get EKF to match UKF by particular choice of points used in the least squares fitting


## Page 16

Page 16!
n Picks a minimal set of sample points that match 1st, 2nd and 3rd moments of a Gaussian:
n \bar{x} = mean, Pxx = covariance, i à i’th column, x 2 <n
n  · : extra degree of freedom to fine-tune the higher order moments of the approximation; when x is Gaussian, n+· = 3 is a suggested heuristic
n L = \sqrt{P_{xx}} can be chosen to be any matrix satisfying:
n L LT = Pxx
Original unscented transform
[Julier and Uhlmann, 1997]
n Dynamics update:
n Can simply use unscented transform and estimate the mean and variance at the next time from the sample points
n Observation update:
n Use sigma-points from unscented transform to compute the covariance matrix between xt and zt.  Then can do the  standard update.
Unscented Kalman filter


## Page 17

Page 17!
[Table 3.4 in Probabilistic Robotics]
UKF Summary
n Highly efficient: Same complexity as EKF, with a constant factor slower in typical practical applications
n Better linearization than EKF: Accurate in first two terms of Taylor expansion (EKF only first term) + capturing more aspects of the higher order terms
n Derivative-free: No Jacobians needed
n Still not optimal!
