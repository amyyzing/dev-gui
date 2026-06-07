# An Elementary Introduction to Kalman Filtering

Converted from: `Kalman Filter\Kalman Filtering Intro.pdf`


## Page 1

An Elementary Introduction to Kalman Filtering
Yan Pei
University of Texas at Austin
ypei@cs.utexas.edu
Swarnendu Biswas
Indian Institute of Technology Kanpur
swarnendu@cse.iitk.ac.in
Donald S. Fussell
University of Texas at Austin
fussell@cs.utexas.edu
Keshav Pingali
University of Texas at Austin
pingali@cs.utexas.edu
ABSTRACT
Kalman filtering is a classic state estimation technique used
in application areas such as signal processing and autonomous
control of vehicles. It is now being used to solve problems
in computer systems such as controlling the voltage and
frequency of processors.
Although there are many presentations of Kalman filtering
in the literature, they usually deal with particular systems
like autonomous robots or linear systems with Gaussian
noise, which makes it difficult to understand the general
principles behind Kalman filtering. In this paper, we first
present the abstract ideas behind Kalman filtering at a level
accessible to anyone with a basic knowledge of probability
theory and calculus, and then show how these concepts can
be applied to the particular problem of state estimation in
linear systems. This separation of concepts from applications
should make it easier to understand Kalman filtering and to
apply it to other problems in computer systems.
KEYWORDS
Kalman filtering, data fusion, uncertainty, noise, state esti-
mation, covariance, BLUE, linear systems
1 INTRODUCTION
Kalman filtering is a state estimation technique invented
in 1960 by Rudolf E. Kálmán [ 16]. Because of its ability to
extract useful information from noisy data and its small com-
putational and memory requirements, it is used in many
application areas including spacecraft navigation, motion
planning in robotics, signal processing, and wireless sen-
sor networks [12, 21, 28–30]. Recent work has used Kalman
filtering in controllers for computer systems [5, 13, 14, 24].
Although many introductions to Kalman filtering are avail-
able in the literature [1–4, 6–11, 18, 22, 26, 30], they are usu-
ally focused on particular applications like robot motion or
state estimation in linear systems. This can make it difficult
to see how to apply Kalman filtering to other problems. Other
presentations derive Kalman filtering as an application of
Bayesian inference assuming that noise is Gaussian. This
leads to the common misconception that Kalman filtering
can be applied only if noise is Gaussian [ 15]. The goal of
this paper is to present the abstract concepts behind Kalman
filtering in a way that is accessible to most computer scien-
tists while clarifying the key assumptions, and then show
how the problem of state estimation in linear systems can
be solved as an application of these general concepts.
Abstractly, Kalman filtering can be seen as a particular
approach to combining approximations of an unknown value
to produce a better approximation. Suppose we use two de-
vices of different designs to measure the temperature of a
CPU core. Because devices are usually noisy, the measure-
ments are likely to differ from the actual temperature of the
core. Since the devices are of different designs, let us assume
that noise affects the two devices in unrelated ways (this
is formalized using the notion of correlation in Section 2).
Therefore, the measurements x1 and x2 are likely to be dif-
ferent from each other and from the actual core temperature
xc. A natural question is the following: is there a way to
combine the information in the noisy measurements x1 and
x2 to obtain a good approximation of the actual temperature
xc?
One ad hoc solution is to use the formula 0.5∗x1+0.5∗x2
to take the average of the two measurements, giving them
equal weight. Formulas of this sort are calledlinear estimators
because they use a weighted sum to fuse values; for our
temperature problem, their general form is β∗x1+α∗x2. In
this paper, we use the term estimate to refer to both a noisy
measurement and to a value computed by an estimator, since
both are approximations of unknown values of interest.
Suppose we have additional information about the two
devices; say the second one uses more advanced tempera-
ture sensing. Since we would have more confidence in the
second measurement, it seems reasonable that we should
discard the first one, which is equivalent to using the linear
estimator 0.0∗x1 + 1.0∗x2. Kalman filtering tells us that in
general, this intuitively reasonable linear estimator is not
“optimal”; paradoxically, there is useful information even in
the measurement from the lower-quality device, and the op-
timal estimator is one in which the weight given to each
measurement is proportional to the confidence we have in
the device producing that measurement. Only if we have no
arXiv:1710.04055v5  [eess.SY]  27 Jun 2019


## Page 2

confidence whatever in the first device should we discard its
measurement.
Section 2 describes how these intuitive ideas can be quan-
tified. Estimates are modeled as random samples from distri-
butions, and confidence in estimates is quantified in terms
of the variances and covariances of these distributions.1 Sec-
tions 3-5 develop the two key ideas behind Kalman filtering.
(1) How should estimates be fused optimally?
Section 3 shows how to fuse scalar estimates such
as temperatures optimally. It is also shown that the
problem of fusing more than two estimates can be re-
duced to the problem of fusing two estimates at a time
without any loss in the quality of the final estimate.
Section 4 extends these results to estimates that arevec-
tors, such as state vectors representing the estimated
position and velocity of a robot.
(2) In some applications, estimates are vectors but only
a part of the vector can be measured directly. For ex-
ample, the state of a spacecraft may be represented
by its position and velocity, but only its position may
be observable. In such situations, how do we obtain a
complete estimate from a partial estimate?
Section 5 shows how the Best Linear Unbiased Esti-
mator (BLUE) can be used for this. Intuitively, it is
assumed that there is a linear relationship between the
observable and hidden parts of the state vector, and
this relationship is used to compute an estimate for
the hidden part of the state, given an estimate for the
observable part.
Section 6 uses these ideas to solve the state estimation
problems for linear systems, which is the usual context for
presenting Kalman filters. Section 7 briefly discusses exten-
sions of Kalman filtering for nonlinear systems.
2 FORMALIZATION OF ESTIMATES
This section makes precise the notions of estimates and con-
fidence in estimates.
2.1 Scalar estimates
To model the behavior of devices producing noisy measure-
ments, we associate each device i with a random variable
that has a probability density function (pdf) pi (x) such as the
ones shown in Figure 1 (the x-axis in this figure represents
temperature). Random variables need not be Gaussian.2 Ob-
taining a measurement from devicei corresponds to drawing
a random sample from the distribution for that device. We
write xi ∼pi (µi ,σ2
i ) to denote that xi is a random variable
1Basic concepts including probability density function, mean, expectation,
variance and covariance are introduced in Appendix A.
2The role of Gaussians in Kalman filtering is discussed in Section 6.5.
x
58 ◦C 60 ◦C 63 ◦C
p1(x)
p2(x)
p(x)
Figure 1: Using pdfs to model devices with systematic
and random errors. Ground truth is60 ◦C. Dashed lines
are means of pdfs.
with pdf pi whose mean and variance areµi andσ2
i respec-
tively; following convention, we usexi to represent a random
sample from this distribution as well.
Means and variances of distributions model different kinds
of inaccuracies in measurements. Device i is said to have a
systematic error or bias in its measurements if the mean µi
of its distribution is not equal to the actual temperature xc
(in general, to the value being estimated, which is known as
ground truth); otherwise, the instrument isunbiased. Figure 1
shows pdfs for two devices that have different amounts of
systematic error. The varianceσ2
i on the other hand is a mea-
sure of the random error in the measurements. The impact
of random errors can be mitigated by taking many measure-
ments with a given device and averaging their values, but
this approach will not help to reduce systematic error.
In the usual formulation of Kalman filtering, it is assumed
that measuring devices do not have systematic errors. How-
ever, we do not have the luxury of taking many measure-
ments of a given state, so we must take into account the
impact of random error on a single measurement. Therefore,
confidence in a device is modeled formally by the variance
of the distribution associated with that device; the smaller
the variance, the higher our confidence in the measurements
made by the device. In Figure 1, the fact that we have less
confidence in the first device has been illustrated by making
p1 more spread out than p2, giving it a larger variance.
The informal notion that noise should affect the two de-
vices in “unrelated ways” is formalized by requiring that
the corresponding random variables be uncorrelated. This is
a weaker condition than requiring them to be independent,
as explained in the Appendix A. Suppose we are given the
measurement made by one of the devices (say x1) and we
have to guess what the other measurement ( x2) might be.
If knowing x1 does not give us any new information about
what x2 might be, the random variables are independent.
This is expressed formally by the equation p(x2|x1) = p(x2);
intuitively, knowing the value of x1 does not change the
pdf for the possible values of x2. If the random variables are
2


## Page 3

only uncorrelated, knowing x1 might give us new informa-
tion about x2 such as restricting its possible values but the
mean of x2|x1 will still beµ2. Using expectations, this can be
written as E[x2|x1] = E[x2], which is equivalent to requiring
that E[(x1−µ1)(x2−µ2)], the covariance between the two vari-
ables, be equal to zero. This is obviously a weaker condition
than independence.
Although the discussion in this section has focused on
measurements, the same formalization can be used for esti-
mates produced by an estimator. Lemma 2.1(i) shows how
the mean and variance of a linear combination of pairwise
uncorrelated random variables can be computed from the
means and variances of the random variables [19]. The mean
and variance can be used to quantify bias and random errors
for the estimator as in the case of measurements.
An unbiased estimator is one whose mean is equal to the
unknown value being estimated and it is preferable to a bi-
ased estimator with the same variance. Only unbiased estima-
tors are considered in this paper. Furthermore, an unbiased
estimator with a smaller variance is preferable to one with a
larger variance since we would have more confidence in the
estimates it produces. As a step towards generalizing this
discussion to estimators that produce vector estimates, we
refer to the variance of an unbiased scalar estimator as the
Mean Square Error of that estimator or MSE for short.
Lemma 2.1(ii) asserts that if a random variable is pairwise
uncorrelated with a set of random variables, it is uncorrelated
with any linear combination of those variables.
Lemma 2.1. Let x1∼p1(µ1,σ2
1 ), ..., xn∼pn(µn,σ2
n) be a set of
pairwise uncorrelated random variables. Lety = Ín
i=1αixi be
a random variable that is a linear combination of the xi ’s.
(i) The mean and variance of y are:
µy =
nÕ
i=1
αiµi (1)
σ2
y =
nÕ
i=1
α2
iσ2
i (2)
(ii) If a random variable xn+1 is pairwise uncorrelated with
x1, .., xn, it is uncorrelated with y.
2.2 Vector estimates
In some applications, estimates are vectors. For example, the
state of a mobile robot might be represented by a vector
containing its position and velocity. Similarly, the vital signs
of a person might be represented by a vector containing his
temperature, pulse rate and blood pressure. In this paper, we
denote a vector by a boldfaced lowercase letter, and a matrix
by an uppercase letter.
The covariance matrix Σxx of a random variable x is the
matrix E[(x −µµµx)(x −µµµx)T], whereµµµx is the mean of x. In-
tuitively, entry (i,j) of this matrix is the covariance between
the i and j components of vector x; in particular, entry (i,i)
is the variance of the it h component of x. A random variable
x with a pdf p whose mean isµxµxµx and covariance matrix is
Σxx is written as x∼p(µxµxµx , Σxx). The inverse of the covariance
matrix (Σ−1
xx) is called the precision or information matrix.
Uncorrelated random variables: The cross-covariance ma-
trix Σvw of two random variables v and w is the matrix
E[(v−µµµv)(w−µµµw )T]. Intuitively, element (i,j) of this matrix
is the covariance between elements v(i) and w(j). If the ran-
dom variables are uncorrelated, all entries in this matrix are
zero, which is equivalent to saying that every component of
v is uncorrelated with every component of w. Lemma 2.2
generalizes Lemma 2.1.
Lemma 2.2. Let x1∼p1(µµµ1, Σ1), ..., xn∼pn(µµµn, Σn) be a set
of pairwise uncorrelated random variables of length m. Let
y = Ín
i=1 Ai xi .
(i) The mean and covariance matrix of y are the following:
µµµy =
nÕ
i=1
Aiµµµi (3)
Σyy =
nÕ
i=1
Ai ΣiAT
i (4)
(ii) If a random variable xn+1 is pairwise uncorrelated with
x1, .., xn, it is uncorrelated with y.
The MSE of an unbiased estimator y is E[(y−µµµy)T(y−µµµy)],
which is the sum of the variances of the components of y;
if y has length 1, this reduces to variance as expected. The
MSE is also the sum of the diagonal elements of Σyy (this is
called the trace of Σyy).
3 FUSING SCALAR ESTIMATES
Section 3.1 discusses the problem of fusing two scalar esti-
mates. Section 3.2 generalizes this to the problem of fusing
n>2 scalar estimates. Section 3.3 shows that fusing n>2 esti-
mates can be done iteratively by fusing two estimates at a
time without any loss of quality in the final estimate.
3.1 Fusing two scalar estimates
We now consider the problem of choosing the optimal values
of the parametersαandβin the linear estimatorβ∗x1 +α∗x2
for fusing estimates x1 and x2 from uncorrelated random
variables.
The first reasonable requirement is that if the two esti-
mates x1 and x2 are equal, fusing them should produce the
same value. This implies thatα+β=1. Therefore the linear
3


## Page 4

estimators of interest are of the form
yα(x1, x2)=(1−α)∗x1 +α∗x2 (5)
If x1 and x2 in Equation 5 are considered to be unbiased
estimators of some quantity of interest, thenyαis an unbi-
ased estimator for any value of α. How should optimality
of such an estimator be defined? One reasonable definition
is that the optimal value of αminimizes the variance of yα
since this will produce the highest-confidence fused esti-
mates as discussed in Section 2. The variance ( MSE) ofyα
can be determined from Lemma 2.1:
σ2
y (α) = (1 −α)2∗σ2
1 +α2∗σ2
2 (6)
Theorem 3.1. Let x1∼p1(µ1,σ2
1 ) and x2∼p2(µ2,σ2
2 ) be un-
correlated random variables. Consider the linear estimator
yα(x1, x2) = (1−α)∗x1 +α∗x2. The variance of the estimator
is minimized for α= σ2
1
σ2
1 +σ2
2
.
This result can be proved by setting the derivative ofσ2
y (α)
with respect toαto zero and solving equation forα.
Proof.
d
dασ2
y (α) = −2(1 −α) ∗σ2
1 + 2α∗σ2
2
= 2α∗ (σ2
1 +σ2
2 ) − 2 ∗σ2
1 = 0
α= σ2
1
σ2
1 +σ2
2
(7)
The second order derivative ofσ2
y (α), (σ2
1 +σ2
2 ), is positive,
showing thatσ2
y (α) reaches a minimum at this point. □
In the literature, the optimal value ofαis called theKalman
gain K. Substituting K into the linear fusion model, we get
the optimal linear estimatory(x1, x2):
y(x1, x2) = σ2
2
σ2
1 +σ2
2
∗x1 + σ2
1
σ2
1 +σ2
2
∗x2 (8)
As a step towards fusion of n>2 estimates, it is useful to
rewrite this as follows:
y(x1, x2) =
1
σ2
1
1
σ2
1
+ 1
σ2
2
∗x1 +
1
σ2
2
1
σ2
1
+ 1
σ2
2
∗x2 (9)
Substituting the optimal value of αinto Equation 6, we
get
σ2
y = 1
1
σ2
1
+ 1
σ2
2
(10)
The expressions fory andσ2
y are complicated because they
contain the reciprocals of variances. If we letν1 andν2 denote
the precisions of the two distributions, the expressions fory
andνy can be written more simply as follows:
y(x1, x2) = ν1
ν1 +ν2
∗x1 + ν2
ν1 +ν2
∗x2 (11)
νy =ν1 +ν2 (12)
These results say that the weight we should give to an
estimate is proportional to the confidence we have in that
estimate, and that we have more confidence in the fused es-
timate than in the individual estimates, which is intuitively
reasonable. To use these results, we need only the variances
of the distributions. In particular, the pdfs pi, which are usu-
ally not available in applications, are not needed, and the
proof of Theorem 3.1 does not require these pdf’s to have
the same mean.
3.2 Fusing multiple scalar estimates
The approach in Section 3.1 can be generalized to optimally
fuse multiple pairwise uncorrelated estimates x1, x2, ..., xn.
Letyn,α(x1, .., xn) denote the linear estimator for fusing the
n estimates given parametersα1, ..,αn, which we denote by
α. The notationyα(x1, x2) introduced in the previous section
can be considered to be an abbreviation ofy2,α(x1, x2).
Theorem 3.2. Let xi ∼pi (µi ,σ2
i ) for (1≤i≤n) be a set of
pairwise uncorrelated random variables. Consider the linear
estimatoryn,α(x1, .., xn) = Ín
i=1αixi where Ín
i=1αi = 1. The
variance of the estimator is minimized for
αi =
1
σ2
i
Ín
j=1
1
σ2
j
Proof. From Lemma 2.1,σ2
y (α) = Ín
i=1αi 2σi 2. To find the
values of αi that minimize the variance σ2
y under the con-
straint that theαi’s sum to1, we use the method of Lagrange
multipliers. Define
f (α1, ...,αn) =
nÕ
i=1
αi 2σi 2 +λ(
nÕ
i=1
αi − 1)
whereλis the Lagrange multiplier. Taking the partial deriva-
tives of f with respect to eachαi and setting these derivatives
to zero, we findα1σ2
1 =α2σ2
2 = ... =αnσ2
n = −λ/2. From this,
and the fact that sum of theαi’s is1, the result follows. □
The minimal variance is given by the following expression:
σ2
yn = 1
nÕ
j=1
1
σ2
j
(13)
As in Section 3.1, these expressions are more intuitive if
the variance is replaced with precision: the contribution ofxi
4


## Page 5

to the value ofyn(x1, .., xn) is proportional to xi’s confidence.
yn(x1, .., xn) =
nÕ
i=1
νi
ν1+...+νn
∗ xi (14)
νyn =
nÕ
i=1
νi (15)
Equations 14 and 15 generalize Equations 11 and 12.
3.3 Incremental fusing is optimal
In many applications, the estimates x1, x2, ..., xn become
available successively over a period of time. While it is possi-
ble to store all the estimates and use Equations 14 and 15 to
fuse all the estimates from scratch whenever a new estimate
becomes available, it is possible to save both time and storage
if one can do this fusion incrementally. We show that just as
a sequence of numbers can be added by keeping a running
sum and adding the numbers to this running sum one at a
time, a sequence of n>2 estimates can be fused by keeping a
“running estimate” and fusing estimates from the sequence
one at a time into this running estimate without any loss in
the quality of the final estimate. In short, we want to show
thatyn(x1, x2, ..., xn) =y2(y2(y2(x1, x2), x3)..., xn).
A little bit of algebra shows that if n>2, Equations 14 and
15 for the optimal linear estimator and its precision can be
expressed as shown in Equations 16 and 17.
yn(x1, .., xn) = νyn−1
νyn−1+νn
yn−1(x1, ..., xn−1) + νn
νyn−1+νn
xn
(16)
νyn =νyn−1 +νn (17)
This shows that yn(x1, .., xn) = y2(yn−1(x1, .., xn−1), xn).
Using this argument recursively gives the required result.3
To make the connection to Kalman filtering, it is useful
to derive the same result using a pictorial argument. Fig-
ure 2 shows the process of incrementally fusing the n es-
timates. In this picture, time progresses from left to right,
the precision of each estimate is shown in parentheses next
to it, and the weights on the edges are the weights from
Equation 11. The contribution of each xi to the final value
y2(y2(y2(x1, x2), x3)..., xn) is given by the product of the weights
on the path from xi to the final value and this product is ob-
viously equal to the weight of xi in Equation 14, showing
that incremental fusion is optimal.
3.4 Summary
The results in this section can be summarized informally
as follows. When using a linear estimator to fuse uncertain
scalar estimates, the weight given to each estimate should be
3We thank Mani Chandy for showing us this approach to proving the result.
+(ν1)
x1
ν1
ν1+ν2
x2
(ν2)
ν2
ν1+ν2
y(x1, x2)
(ν1 +ν2)
+
x3
(ν3)
ν1+ν2
ν1+ν2+ν3
ν3
ν1+ν2+ν3
. . .
y2(y2(x1, x2), x3)
(ν1 +ν2 +ν3)
+
xn−1
(νn−1)
νn−1
ν1+··· +νn−1
y2(y2(. . . ), xn−1)
(ν1 + · · · +νn−1)
+
xn
(νn )
νn
ν1+··· +νn
ν1+··· +νn−1
ν1+··· +νn
y2(y2(. . . ), xn )
(ν1 + · · · +νn )
Figure 2: Dataflow graph for incremental fusion.
inversely proportional to the variance of the random variable
from which that estimate is obtained. Furthermore, when fus-
ing n>2 estimates, estimates can be fused incrementally with-
out any loss in the quality of the final result. These results are
often expressed formally in terms of the Kalman gain K, as
shown below; the equations can be applied recursively to fuse
multiple estimates. Note that ifν1≫ν2, K≈0 andy(x1,x2)≈x1;
conversely ifν1≪ν2, K≈1 andy(x1,x2)≈x2.
x1∼p1(µ1,σ2
1 ), x2∼p2(µ2,σ2
2 )
K = σ2
1
σ2
1 +σ2
2
= ν2
ν1 +ν2
(18)
y(x1, x2) = x1 + K(x2 − x1) (19)
σ2
y = (1 − K)σ2
1 or νy =ν1 +ν2 (20)
4 FUSING VECTOR ESTIMATES
The results in Section 3 for fusing scalar estimates can be
extended to vectors by replacing variances with covariance
matrices.
4.1 Fusing multiple vector estimates
For vectors, the linear estimator is
yn,A(x1, x2, .., xn) =
nÕ
i=1
Ai xi where
nÕ
i=1
Ai = I (21)
Here A stands for the matrix parameters (A1, ..., An). All the
vectors xi are assumed to be of the same length. To simplify
notation, we omit the subscript n in yn,A in the discussion
below since it is obvious from the context.
Optimality: The parameters A1, ..., An in the linear data
fusion model are chosen to minimize MSE(yA) which is
E[(yA−µµµyA )T(yA−µµµyA )], as explained in Section 2.
Theorem 4.1 generalizes Theorem 3.2 to the vector case.
The proof of this theorem uses matrix derivatives [23] (see
Appendix B) and is given in Appendix C since it is not needed
for understanding the rest of this paper. Comparing Theo-
rems 4.1 and 3.2, we see that the expressions are similar, the
main difference being that the role of variance in the scalar
case is played by the covariance matrix in the vector case.
5


## Page 6

Theorem 4.1. Let xi ∼pi (µiµiµi , Σi ) for (1≤i≤n) be a set of
pairwise uncorrelated random variables. Consider the linear
estimator yA(x1, .., xn)=Ín
i=1 Ai xi , where Ín
i=1 Ai = I . The
value of MSE (yA) is minimized for
Ai = (
nÕ
j=1
Σ−1
j )−1Σ−1
i (22)
Therefore the optimal estimator is
y(x1, ..., xn) = (
nÕ
j=1
Σ−1
j )−1
nÕ
i=1
Σ−1
i xi (23)
The covariance matrix of y can be computed by using
Lemma 2.2.
Σyy = (
nÕ
j=1
Σ−1
j )−1 (24)
In the vector case, precision is the inverse of a covariance
matrix, denoted by N . Equations 25–26 use precision to ex-
press the optimal estimator and its variance and generalize
Equations 14–15 to the vector case.
y(x1, ..., xn) = N −1
y
nÕ
i=1
Ni xi (25)
Ny =
nÕ
j=1
Nj (26)
As in the scalar case, fusion of n>2 vector estimates can
be done incrementally without loss of precision. The proof
is similar to the scalar case, and is omitted.
There are several equivalent expressions for the Kalman
gain for the fusion of two estimates. The following one,
which is easily derived from Equation 22, is the vector analog
of Equation 18:
K = Σ1(Σ1 + Σ2)−1 (27)
The covariance matrix of the optimal estimator y(x1, x2)
is the following.
Σyy = Σ1(Σ1 + Σ2)−1Σ2 (28)
= K Σ2 = Σ1 − K Σ1 (29)
4.2 Summary
The results in this section can be summarized in terms of the
Kalman gain K as follows.
x1∼p1(µµµ1, Σ1), x2∼p2(µµµ2, Σ2)
K = Σ1(Σ1 + Σ2)−1 = (N1 + N2)−1N2 (30)
y(x1, x2) = x1 + K(x2 − x1) (31)
Σyy = (I − K)Σ1 or Ny = N1 + N2 (32)
5 BEST LINEAR UNBIASED ESTIMATOR
(BLUE)
In some applications, the state of the system is represented
by a vector but only part of the state can be measured directly,
so it is necessary to estimate the hidden portion of the state
corresponding to a measured value of the visible state. This
section describes an estimator called theBest Linear Unbiased
Estimator (BLUE) [17, 20, 27] for doing this.
x
y
x1
by1
µx
µy

(by −µy) = ΣyxΣ−1
xx(x −µx)
Figure 3: BLUE line corresponding to Equation 33.
Consider the general problem of determining a value for
vector y given a value for a vector x. If there is a functional
relationship between x and y (say y=F (x) and F is given),
it is easy to compute y given a value for x (say x1).
In our context however, x and y are random variables, so
such a precise functional relationship will not hold. Figure 3
shows an example in whichx andy are scalar-valued random
variables. The gray ellipse in this figure, called a confidence
ellipse, is a projection of the joint distribution ofx andy onto
the (x,y) plane, that shows where some large proportion of
the (x,y) values are likely to be. Suppose x takes the value
x1. Even within the confidence ellipse, there are many points
(x1,y), so we cannot associate a single value ofy with x1. One
possibility is to compute the mean of they values associated
with x1 (that is, the expectation E[y|x=x1]), and return this
as the estimate fory if x=x1. This requires knowing the joint
distribution of x andy, which may not always be available.
In some problems, we can assume that there is an un-
known linear relationship between x and y and that uncer-
tainty comes from noise. Therefore, we can use a technique
similar to the ordinary least squares (OLS) method to esti-
mate this linear relationship, and use it to return the best
estimate ofy for any given value ofx. In Figure 3, we see that
although there are many points (x1,y), they values are clus-
tered around the line shown in the figure so the value by1 is a
reasonable estimate for the value ofy corresponding to x1.
This line, called the best linear unbiased estimator (BLUE), is
the analog of ordinary least squares (OLS) for distributions.
6


## Page 7

Computing BLUE. Consider the estimator byA,b(x)=Ax+b.
We chooseA and b so that this is an unbiased estimator with
minimal MSE. The “b ” over the y is notation that indicates
that we are computing an estimate for y.
Theorem 5.1. Let
x
y

∼p(
µµµx
µµµy

,
Σxx Σxy
Σyx Σyy

). The estima-
tor byA,b(x)=Ax+b for estimating the value of y for a given
value of x is an unbiased estimator with minimal MSE if
b =µµµy−A(µµµx)
A = ΣyxΣ−1
xx
The proof of Theorem 5.1 is straightforward. For an unbi-
ased estimator, E[by]=E[y]. This implies that b=µµµy−A(µµµx) so
an unbiased estimator is of the form byA(x) =µµµy+A(x−µµµx).
Note that this is equivalent to asserting that the BLUE line
must pass through the point (µµµx,µµµy). Setting the derivative
of MSE A(byA) with respect to A to zero[23] and solving for
A, we find that the best linear unbiased estimator is
by =µµµy + ΣyxΣ−1
xx(x −µµµx) (33)
This equation can be understood intuitively as follows. If
we have no information about x and y, the best we can do is
the estimate (µµµx,µµµy), which lies on the BLUE line. However,
if we know that x has a particular value x1, we can use the
correlation between y and x to estimate a better value for
y from the difference (x1−µµµx). Note that if Σyx = 0 (that is,
x and y are uncorrelated), the best estimate of y is justµµµy,
so knowing the value of x does not give us any additional
information about y as one would expect. In Figure 3, this
corresponds to the case when the BLUE line is parallel to
the x-axis. At the other extreme, suppose that y and x are
functionally related so y = Cx. In that case, it is easy to see
that Σyx = CΣxx, so by = Cx as expected. In Figure 3, this
corresponds to the case when the confidence ellipse shrinks
down to the BLUE line.
Equation 33 is a generalization of ordinary least squares
in the sense that if we compute the relevant means and
variances of a set of discrete data (xi ,yi ) and substitute into
Equation 33, we get the same line that is obtained by using
OLS.
6 KALMAN FILTERS FOR LINEAR
SYSTEMS
In this section, we apply the algorithms developed in Sec-
tions 3-5 to the particular problem of state estimation in
linear systems, which is the classical application of Kalman
filtering.
Figure 4a shows how the evolution of the state of such
a system over time can be computed if the initial state x0
and the model of the system dynamics are known precisely.
Time advances in discrete steps. The state of the system
at any time step is a function of the state of the system at
the previous time step and the control inputs applied to the
system during that interval. This is usually expressed by
an equation of the form xt = ft (xt −1, ut ) where ut is the
control input. The function ft is nonlinear in the general
case, and can be different for different steps. If the system
is linear, the relation for state evolution over time can be
written as xt = Ft xt −1 + Bt ut , where Ft and Bt are time-
dependent matrices that can be determined from the physics
of the system. Therefore, if the initial state x0 is known
exactly and the system dynamics are modeled perfectly by
the Ft and Bt matrices, the evolution of the state over time
can be computed precisely as shown in Figure 4a.
In general however, we may not know the initial state ex-
actly, and the system dynamics and control inputs may not
be known precisely. These inaccuracies may cause the state
computed by the model to diverge unacceptably from the
actual state over time. To avoid this, we can make measure-
ments of the state after each time step. If these measurements
were exact, there would of course be no need to model the
system dynamics. However, in general, the measurements
themselves are imprecise.
Kalman filtering was invented to solve the problem of state
estimation in such systems. Figure 4b shows the dataflow
of the computation, and we use it to introduce standard
terminology. An estimate of the initial state, denoted bybx0|0,
is assumed to be available. At each time step t=1, 2, .., the
system model is used to provide an estimate of the state at
time t using information from time t−1. This step is called
prediction and the estimate that it provides is called the a
priori estimate and denoted by bxt |t −1. The a priori estimate
is then fused with zt , the state estimate obtained from the
measurement at time t, and the result is the a posteriori state
estimate at time t, denoted bybxt |t . This a posteriori estimate
is used by the model to produce the a priori estimate for
the next time step and so on. As described below, the a
priori and a posteriori estimates are the means of certain
random variables; the covariance matrices of these random
variables are shown within parentheses above each estimate
in Figure 4b, and these are used to weight estimates when
fusing them.
Section 6.1 presents the state evolution model and a priori
state estimation. Section 6.2 discusses how state estimates
are fused if an estimate of the entire state can be obtained
by measurement; Section 6.3 addresses this problem when
only a portion of the state can be measured directly.
6.1 State evolution model and prediction
The evolution of the state over time is described by a series
of random variables x0, x1, x2,...
7


## Page 8

x0 x1 x2f 1 f 2 ..... xt −1 xtf t
(a) Discrete-time dynamical system.
+ +bx0|0
(Σ0|0)
f1
bx1|0
(Σ1|0)
bx1|1
(Σ1|1)
z1
(R1)
x1
f2
bx2|1
(Σ2|1)
z2
(R2)
x2
bx2|2
(Σ2|2)
..... +bxt −1|t −1
(Σt −1 |t −1)
ft
bxt |t −1
(Σt |t −1)
bxt |t
(Σt |t )
zt
(Rt )
xt
(b) Dynamical system with uncertainty.
(Σ0|0)
bx0|0 bxt |t −1 = Ftbxt −1|t −1 + Bt ut
Σt |t −1 = Ft Σt −1|t −1F T
t + Qt
(Σt |t −1)
bxt |t −1
Kt = Σt |t −1(Σt |t −1 + Rt )−1
bxt |t = bxt |t −1 + Kt (zt - bxt |t −1)
Σt |t = (I - Kt )Σt |t −1
zt
(Rt )
xt
(Σt |t )
bxt |t
Predictor Measurement Fusion+
(c) Implementation of the dataflow diagram (b).
(Σ0|0)
bx0|0 bxt |t −1 = Ftbxt −1|t −1 + Bt ut
Σt |t −1 = Ft Σt −1|t −1F T
t + Qt
(Σt |t −1)
bxt |t −1
Kt = Σt |t −1Ht T(Ht Σt |t −1Ht T + Rt )−1
bxt |t = bxt |t −1 + Kt (zt - Htbxt |t −1)
Σt |t = (I - Kt Ht )Σt |t −1
zt
(Rt )
Ht xt
(Σt |t )
bxt |t
Predictor Measurement Fusion+
(d) Implementation of the dataflow diagram (b) for systems with partial observability.
Figure 4: State estimation using Kalman filtering.
• The random variable x0 captures the likelihood of dif-
ferent initial states.
• The random variables at successive time steps are re-
lated by the following linear model:
xt = Ft xt −1 + Bt ut + wt (34)
Here, ut is the control input, which is assumed to
be deterministic, and wt is a zero-mean noise term
that models all the uncertainty in the system. The
covariance matrix of wt is denoted by Qt , and the
noise terms in different time steps are assumed to be
uncorrelated to each other (that is, E[wi wj ]=0 if i,j)
and to x0.
For estimation, we have a random variable x0|0 that cap-
tures our belief about the likelihood of different states at
time t=0, and two random variables xt |t −1 and xt |t at each
time step t = 1, 2, ... that capture our beliefs about the likeli-
hood of different states at timet before and after fusion with
the measurement respectively. The mean and covariance ma-
trix of a random variable xi |j are denoted by bxi |j and Σi |j
respectively. We assumeE[bx0|0]=E[x0] (no bias).
Prediction essentially uses xt −1|t −1 as a proxy for xt −1 in
Equation 34 to determine xt |t −1 as shown in Equation 35.
xt |t −1 = Ft xt −1|t −1 + Bt ut + wt (35)
For state estimation, we need only the mean and covari-
ance matrix of xt |t −1. The Predictor box in Figure 4 com-
putes these values; the covariance matrix is obtained from
Lemma 2.2 under the assumption that wt is uncorrelated
with xt −1 |t −1, which is justified in Section 6.2.
8


## Page 9

xˆt+1|t+1
xt+1|t+1
⨁
xt+1
zt+1
xˆt+1|t
xˆt|t⨁
zt
xt
xˆt|t−1
xt|t−1
xt+1|t
xt|t
Figure 5: Pictorial representation of Kalman filtering.
6.2 Fusing complete observations of the
state
If the entire state can be measured at each time step, the
imprecise measurement at time t is modeled as follows:
zt = xt + vt (36)
where vt is a zero-mean noise term with covariance matrix
Rt . The noise terms in different time steps are assumed to be
uncorrelated with each other (that is, E[vi vj ] is zero if i,j)
as well as with x0|0 and all wk. A subtle point here is that
xt in this equation is the actual state of the system at time t
(that is, a particular realization of the random variable xt ),
so variability in zt comes only from vt and its covariance
matrix Rt .
Therefore, we have two imprecise estimates for the state
at each time step t = 1, 2, ..., the a priori estimate from the
predictor (bxt |t −1) and the one from the measurement (zt ). If
zt is uncorrelated to xt |t −1, we can use Equations 30-32 to
fuse the estimates as shown in Figure 4c.
The assumptions that (i) xt −1|t −1 is uncorrelated with wt ,
which is used in prediction, and (ii) xt |t −1 is uncorrelated
with zt , which is used in fusion, are easily proved to be
correct by induction on t, using Lemma 2.2(ii). Figure 4b
gives the intuition: xt |t −1 for example is an affine function
of the random variables x0|0, w1, v1, w2, v2, ..., wt , and is
therefore uncorrelated with vt (by assumption about vt and
Lemma 2.2(ii)) and hence with zt .
Figure 5 shows the computation pictorially using confi-
dence ellipses to illustrate uncertainty. The dotted arrows
at the bottom of the figure show the evolution of the state,
and the solid arrows show the computation of the a priori
estimates and their fusion with measurements.
6.3 Fusing partial observations of the state
In some problems, only a portion of the state can be mea-
sured directly. The observable portion of the state is specified
formally using a full row-rank matrix Ht called the observa-
tion matrix: if the state is x, what is observable is Ht x. For
example, if the state vector has two components and only
the first component is observable,Ht can be [ 1 0 ]. In general,
the Ht matrix can specify a linear relationship between the
state and the observation, and it can be time-dependent. The
imprecise measurement model introduced in Equation 36
becomes:
zt = Ht xt + vt (37)
The hidden portion of the state can be specified using a
matrix Ct , which is an orthogonal complement of Ht . For
example, if Ht = [ 1 0 ], one choice for Ct is [ 0 1 ].
Figure 4d shows the computation for this case. The fusion
phase can be understood intuitively in terms of the following
steps.
(i) The observable part of the a priori estimate of the state
Htbxt |t −1 is fused with the measurement zt , using the
techniques developed in Sections 3-4. The quantityzt − Htbxt |t −1
is called the innovation. The result is the a posteriori es-
timate of the observable state Htbxt |t .
(ii) The BLUE in Section 5 is used to obtain the a pos-
teriori estimate of the hidden state Ctbxt |t by adding
to the a priori estimate of the hidden state Ctbxt |t −1 a
value obtained from the product of the covariance be-
tween Ht xt |t −1 and Ct xt |t −1 and the difference between
Htbxt |t −1 and Htbxt |t .
(iii) The a posteriori estimates of the observable and hidden
portions of the state are composed to produce the a
posteriori estimate of the entire state bxt |t .
The actual implementation produces the final result di-
rectly without going through these steps as shown in Fig-
ure 4d, but these incremental steps are useful for understand-
ing how all this works, and they are implemented as follows.
(i) The a priori estimate of the observable part of the state
is Htbxt |t −1 and the covariance isHt Σt |t −1H T
t . The a pos-
teriori estimate is obtained directly from Equation 31:
Htbxt |t = Htbxt |t −1
+ Ht Σt |t −1H T
t (Ht Σt |t −1H T
t + Rt )−1(zt − Htbxt |t −1)
Let Kt =Σt |t −1H T
t (Ht Σt |t −1H T
t + Rt )−1. The a posteriori
estimate of the observable state can be written in terms
of Kt as follows:
Htbxt |t = Htbxt |t −1 + Ht Kt (zt − Htbxt |t −1) (38)
(ii) The a priori estimate of the hidden state is Ctbxt |t −1.
The covariance between the hidden portion Ct xt |t −1
and the observable portion Ht xt |t −1 is Ct Σt |t −1H T
t . The
difference between the a priori estimate and a posteriori
estimate of Ht x is Ht Kt (zt −Hbxt |t −1). Therefore the a
posteriori estimate of the hidden portion of the state is
9


## Page 10

obtained directly from Equation 33:
Ctbxt |t = Ctbxt |t −1
+ (Ct Σt |t −1H T
t )(Ht Σt |t −1H T
t )−1Ht Kt (zt − Htbxt |t −1)
= Ctbxt |t −1 + Ct Kt (zt − Htbxt |t −1) (39)
(iii) Putting the a posteriori estimates (38) and (39) together,
Ht
Ct

bxt |t =
Ht
Ct

bxt |t −1 +
Ht
Ct

Kt (zt − Htbxt |t −1)
Since
Ht
Ct

is invertible, it can be canceled from the left
and right hand sides, giving the equation
bxt |t = bxt |t −1 + Kt (zt − Htbxt |t −1) (40)
To compute Σt |t , Equation 40 can be rewritten as
bxt |t = (I − Kt Ht )bxt |t −1 + Kt zt . Since xt |t −1 and zt are un-
correlated, it follows from Lemma 2.2 that
Σt |t = (I − Kt Ht )Σt |t −1(I − Kt Ht )T + Kt Rt K T
t
Substituting the value of Kt and simplifying, we get
Σt |t = (I − Kt Ht )Σt |t −1 (41)
Figure 4d puts all this together. In the literature, this
dataflow is referred to as Kalman filtering. Unlike in Sec-
tions 3 and 4, the Kalman gain is not a dimensionless value
here. If Ht = I, the computations in Figure 4d reduce to those
of Figure 4c as expected.
Equation 40 shows that the a posteriori state estimate is a
linear combination of the a priori state estimate (bxt |t −1) and
the measurement (zt ). The optimality of this linear unbiased
estimator is shown in the Appendix D. In Section 3.3, it was
shown that incremental fusion of scalar estimates is optimal.
The dataflow of Figures 4(c,d) computes thea posteriori state
estimate at time t by incrementally fusing measurements
from the previous time steps, and this incremental fusion
can be shown to be optimal using a similar argument.
6.4 Example: falling body
To demonstrate the effectiveness of the Kalman filter, we
consider an example in which an object falls from the origin
at time t=0 with an initial speed of 0 m/s and an expected
constant acceleration of 9.8 m/s2 due to gravity. Note that
acceleration in reality may not be constant due to factors
such as wind, air friction, and so on.
The state vector of the object contains two components,
one for the distance from the origin s(t) and one for the
velocityv(t). We assume that only the velocity state can be
measured at each time step. If time is discretized in steps of
0.25 seconds, the difference equation for the dynamics of the
system is easily shown to be the following:
vn
sn

=
 1 0
0.25 1
 vn−1
sn−1

+
0 0 .25
0 0 .5 × 0.252
  0
9.8

(42)
where we assume
v0
s0

=
0
0

and Σ0 =
80 0
0 10

.
The gray lines in Figure 6 show the evolution of velocity
and distance with time according to this model. Because of
uncertainty in modeling the system dynamics, the actual
evolution of the velocity and position will be different in
practice. The red lines in Figure 6 show one trajectory for
this evolution, corresponding to a Gaussian noise term with
covariance
 2 2 .5
2.5 4

in Equation 34 (because this noise
term is random, there are many trajectories for the evolu-
tion, and we are just showing one of them). The red lines
correspond to “ground truth” in our example.
The green points in Figure 6b show the noisy measure-
ments of velocity at different time steps, assuming the noise
is modeled by a Gaussian with variance 8. The blue lines
show the a posteriori estimates of the velocity and position.
It can be seen that thea posteriori estimates track the ground
truth quite well even when the ideal system model (the gray
lines) is inaccurate and the measurements are noisy. The
cyan bars in the right figure show the variance of the veloc-
ity at different time steps. Although the initial variance is
quite large, application of Kalman filtering is able to reduce
it rapidly in few time steps.
6.5 Discussion
This section shows that Kalman filtering for state estimation
in linear systems can be derived from two elementary ideas:
optimal linear estimators for fusing uncorrelated estimates
and best linear unbiased estimators for correlated variables.
This is a different approach to the subject than the standard
presentations in the literature. One standard approach is to
use Bayesian inference. The other approach is to assume that
the a posteriori state estimator is a linear combination of the
form Atbxt |t −1+Bt zt , and then find the values of At and Bt
that produce an unbiased estimator with minimum MSE. We
believe that the advantage of the presentation given here is
that it exposes the concepts and assumptions that underlie
Kalman filtering.
Most presentations in the literature also begin by assuming
that the noise termswt in the state evolution equation andvt
in the measurement are Gaussian. Some presentations [1, 10]
use properties of Gaussians to derive the results in Sections 3
although as we have seen, these results do not depend on
distributions being Gaussians. Gaussians however enter the
picture in a deeper way if one considersnonlinear estimators.
It can be shown that if the noise terms are not Gaussian, there
may be nonlinear estimators whose MSE is lower than that
10


## Page 11

0 5 10 15 20
Time (s)
0
500
1000
1500
2000
2500Distance (m)
Model-only
Ground Truth
Estimated
(a) Evolution of state: Distance
0 5 10 15 20
Time (s)
0
50
100
150
200
250
300Velocity (m/s)
0
25
50
75
100
125
150
Variance
Model-only
Ground Truth
Estimated
Measured
Variance (b) Evolution of state: Velocity
Figure 6: Estimates of the object’s state over time.
of the linear estimator presented in Figure 4d. However if
the noise is Gaussian, this linear estimator is as good as any
unbiased nonlinear estimator (that is, the linear estimator is a
minimum variance unbiased estimator (MVUE)). This result
is proved using the Cramer-Rao lower bound [25].
7 EXTENSION TO NONLINEAR SYSTEMS
The Extended Kalman Filter (EKF) and Unscented Kalman Fil-
ter (UKF) are heuristic approaches to using Kalman filtering
for nonlinear systems. The state evolution and measurement
equations for nonlinear systems with additive noise can be
written as follows; in these equations, f and h are nonlinear
functions.
xt = f (xt −1, ut ) + wt (43)
zt = h(xt ) + vt (44)
Intuitively, the EKF constructs linear approximations to
the nonlinear functions f and h and applies the Kalman
filter equations, while the UKF constructs approximations
to probability distributions and propagates these through
the nonlinear functions to construct approximations to the
posterior distributions.
EKF. Examining Figure 4d, we see that the a priori state
estimate in the predictor can be computed using the system
model: bxt |t −1 = f (bxt −1|t −1, ut ). However, since the system
dynamics and measurement equations are nonlinear, it is not
clear how to compute the covariance matrices for thea priori
estimate and the measurement. In the EKF, these matrices
are computed by linearizing Equations 43 and 44 using the
Taylor series expansions for the nonlinear functions f and
h. This requires computing the following Jacobians4, which
play the role of Ft and Ht in Figure 4d.
Ft = ∂ f
∂x
bxt −1|t −1,ut
Ht = ∂h
∂x
bxt |t −1
The EKF performs well in some applications such as navi-
gation systems and GPS [29].
UKF. When the system dynamics and observation models
are highly nonlinear, the Unscented Kalman Filter (UKF) [15]
can be an improvement over the EKF. The UKF is based on
the unscented transformation, which is a method for comput-
ing the statistics of a random variable x that undergoes a
nonlinear transformation (y =д(x)). The random variable x
is sampled using a carefully chosen set of sigma points and
these sample points are propagated through the nonlinear
functionд. The statistics of y are estimated using a weighted
sample mean and covariance of the posterior sigma points.
The UKF tends to be more robust and accurate than the EKF
but has higher computation overhead due to the sampling
process.
8 CONCLUSION
In this paper, we have shown that two concepts - optimal
linear estimators for fusing uncorrelated estimates and best
linear unbiased estimators for correlated variables - provide
the underpinnings for Kalman filtering. By combining these
ideas, standard results on Kalman filtering for linear systems
can be derived in an intuitive and straightforward way that
is simpler than other presentations of this material in the
4The Jacobian matrix is the matrix of all first order partial derivatives of a
vector-valued function.
11


## Page 12

literature. This approach makes clear the assumptions that
underlie the optimality results associated with Kalman filter-
ing, and should make it easier to apply Kalman filtering to
problems in computer systems.
ACKNOWLEDGMENTS
This research was supported by NSF grants 1337281, 1406355,
and 1618425, and by DARPA contracts FA8750-16-2-0004 and
FA8650-15-C-7563. The authors would like to thank K. Mani
Chandy (Caltech), Ivo Babuska (UT Austin) and Augusto
Ferrante (Padova) for their feedback on this paper.
REFERENCES
[1] Tim Babb. 2018. How a Kalman filter works, in pictures | Bzarg. https:
//www.bzarg.com/p/how-a-kalman-filter-works-in-pictures/. (2018).
Accessed: 2018-11-30.
[2] A. V. Balakrishnan. 1987. Kalman Filtering Theory . Optimization
Software, Inc., Los Angeles, CA, USA.
[3] Allen L. Barker, Donald E. Brown, and Worthy N. Martin. 1994.
Bayesian Estimation and the Kalman Filter . Technical Report. Char-
lottesville, VA, USA.
[4] Alex Becker. 2018. Kalman Filter Overview. https://www.kalmanfilter.
net/default.aspx. (2018). Accessed: 2018-11-08.
[5] K. Bergman. 2009. Nanophotonic Interconnection Networks in Multi-
core Embedded Computing. In2009 IEEE/LEOS Winter Topicals Meeting
Series. 6–7. https://doi.org/10.1109/LEOSWT.2009.4771628
[6] Liyu Cao and Howard M. Schwartz. 2004. Analysis of the Kalman
Filter Based Estimation Algorithm: An Orthogonal Decomposition
Approach. Automatica 40, 1 (Jan. 2004), 5–19. https://doi.org/10.1016/
j.automatica.2003.07.011
[7] Charles K. Chui and Guanrong Chen. 2017. Kalman Filtering: With
Real-Time Applications (5th ed.). Springer Publishing Company, Incor-
porated.
[8] R.L. Eubank. 2005. A Kalman Filter Primer (Statistics: Textbooks and
Monographs). Chapman & Hall/CRC.
[9] Geir Evensen. 2006. Data Assimilation: The Ensemble Kalman Filter .
Springer-Verlag New York, Inc., Secaucus, NJ, USA.
[10] Rodney Faragher. 2012. Understanding the Basis of the Kalman Filter
Via a Simple and Intuitive Derivation. IEEE Signal Processing Magazine
29, 5 (September 2012), 128–132.
[11] Mohinder S. Grewal and Angus P. Andrews. 2014. Kalman Filtering:
Theory and Practice with MATLAB (4th ed.). Wiley-IEEE Press.
[12] Anne-Kathrin Hess and Anders Rantzer. 2010. Distributed Kalman
Filter Algorithms for Self-localization of Mobile Devices. InProceedings
of the 13th ACM International Conference on Hybrid Systems: Compu-
tation and Control (HSCC ’10) . ACM, New York, NY, USA, 191–200.
https://doi.org/10.1145/1755952.1755980
[13] Connor Imes and Henry Hoffmann. 2016. Bard: A Unified Framework
for Managing Soft Timing and Power Constraints. In International
Conference on Embedded Computer Systems: Architectures, Modeling
and Simulation (SAMOS).
[14] C. Imes, D. H. K. Kim, M. Maggio, and H. Hoffmann. 2015. POET:
A Portable Approach to Minimizing Energy Under Soft Real-time
Constraints. In 21st IEEE Real-Time and Embedded Technology and
Applications Symposium. 75–86. https://doi.org/10.1109/RTAS.2015.
7108419
[15] Simon J. Julier and Jeffrey K. Uhlmann. 2004. Unscented Filtering
and Nonlinear Estimation. Proc. IEEE 92, 3 (2004), 401–422. https:
//doi.org/10.1109/JPROC.2003.823141
[16] Rudolph Emil Kalman. 1960. A New Approach to Linear Filtering
and Prediction Problems. Transactions of the ASME–Journal of Basic
Engineering 82, Series D (1960), 35–45.
[17] Peter K Kitanidis. 1987. Unbiased Minimum-variance Linear State
Estimation. Automatica 23, 6 (Nov. 1987), 775–778. https://doi.org/10.
1016/0005-1098(87)90037-9
[18] Anders Lindquist and Giogio Picci. 2017. Linear Stochastic Systems .
Springer-Verlag.
[19] Peter S Maybeck. 1982. Stochastic models, estimation, and control. Vol. 3.
Academic press.
[20] Jerry M Mendel. 1995.Lessons in Estimation Theory for Signal Processing,
Communications, and Control. Pearson Education.
[21] Kaushik Nagarajan, Nicholas Gans, and Roozbeh Jafari. 2011. Mod-
eling Human Gait Using a Kalman Filter to Measure Walking Dis-
tance. In Proceedings of the 2nd Conference on Wireless Health (WH ’11).
ACM, New York, NY, USA, Article 34, 2 pages. https://doi.org/10.1145/
2077546.2077584
[22] Eduardo F. Nakamura, Antonio A. F. Loureiro, and Alejandro C. Frery.
2007. Information Fusion for Wireless Sensor Networks: Methods,
Models, and Classifications. ACM Comput. Surv. 39, 3, Article 9 (Sept.
2007). https://doi.org/10.1145/1267070.1267073
[23] Kaare Brandt Petersen and Michael Syskind Pedersen. 2012. The Matrix
Cookbook. http://www2.imm.dtu.dk/pubdb/views/publication_details.
php?id=3274. (Nov. 2012). Version 20121115.
[24] Raghavendra Pradyumna Pothukuchi, Amin Ansari, Petros Voulgaris,
and Josep Torrellas. 2016. Using Multiple Input, Multiple Output
Formal Control to Maximize Resource Efficiency in Architectures. In
Computer Architecture (ISCA), 2016 ACM/IEEE 43rd Annual Interna-
tional Symposium on. IEEE, 658–670.
[25] C.R. Rao. 1945. Information and the Accuracy Attainable in the Esti-
mation of Statistical Parameters. Bulletin of the Calcutta Mathematical
Society 37 (1945), 81–89.
[26] Matthew B. Rhudy, Roger A. Salguero, and Keaton Holappa. 2017. A
Kalman Filtering Tutorial for Undergraduate Students. International
Journal of Computer Science & Engineering Survey 8, 1 (Feb. 2017).
[27] Sailes K. Sengupta. 1995. Fundamentals of Statistical Signal Processing:
Estimation Theory. Technometrics 37, 4 (1995), 465–466. https://doi.
org/10.1080/00401706.1995.10484391
[28] Éfren L. Souza, Eduardo F. Nakamura, and Richard W. Pazzi. 2016.
Target Tracking for Sensor Networks: A Survey. ACM Comput. Surv.
49, 2, Article 30 (June 2016), 31 pages. https://doi.org/10.1145/2938639
[29] Sebastian Thrun, Wolfram Burgard, and Dieter Fox. 2005. Probabilistic
Robotics (Intelligent Robotics and Autonomous Agents) . The MIT Press.
[30] Greg Welch and Gary Bishop. 1995. An Introduction to the Kalman
Filter. Technical Report. Chapel Hill, NC, USA.
[31] Yan Pei, Swarnendu Biswas, Donald S. Fussell, and Keshav Pingali.
2017. An Elementary Introduction to Kalman Filtering. ArXiv e-prints
(Oct. 2017). arXiv:1710.04055
12


## Page 13

Appendices
A BASIC PROBABILITY THEORY AND
STATISTICS TERMINOLOGY
Probability density function. For a continuous random vari-
able x, a probability density function (pdf) is a function p(x)
whose value provides a relative likelihood that the value of
the random variable will equal x. The integral of the pdf
within a range of values is the probability that the random
variable will take a value within that range.
Ifд(x) is a function of x with pdf p(x), the expected value
or expectation of д(x) is E[д(x)], defined as the following
integral:
E[д(x)] =
∫ ∞
−∞
д(x)p(x)dx
By definition, the meanµx of a random variable x is E[x].
The variance of a random variable x measures the variability
of the distribution. For the set of possible values ofx, variance
(denoted byσ2
x ) is defined byσ2
x = E[(x −µx )2]. The variance
of a continuous random variable x can be written as the
following integral:
σ2
x =
∫ ∞
−∞
(x −µ)2p(x)dx
If x is discrete and all outcomes are equally likely, then
σ2
x = Σ(xi −µx )2
n . The standard deviationσx is the square root
of the variance.
Covariance. The covariance of two random variables is a
measure of their joint variability. The covariance between
random variables x1 : p1∼(µ1,σ2
1 ) and x2 : p2∼(µ2,σ2
2 ) is the
expectation E[(x1−µ1)∗(x2−µ2)]. Two random variables are
uncorrelated or not correlated if their covariance is zero. This
is not the same concept as independence of random variables.
Two random variables are independent if knowing the
value of one of the variables does not give us any information
about the possible values of the other one. This is written
formally as p(x1|x2) = p(x1); intuitively, knowing the value
of x2 does not change the probability thatp1 takes a particular
value.
Independent random variables are uncorrelated but ran-
dom variables can be uncorrelated even if they are not in-
dependent. It can be shown that if x1 and x2 are not corre-
lated, E[x1|x2]=E[x1]; intuitively, knowing the value of x2
may change the probability that x1 takes a particular value,
but the mean of the resulting distribution remains the same
as the mean of x1. A special case of this that is easy to un-
derstand are examples in which knowing x2 restricts the
possible values of x1 without changing the mean. Consider a
random variable u : U that is uniformly distributed over the
unit circle, and consider random variables x1 : [−1, 1] and
x2 : [−1, 1] that are the projections of u on the x andy axes
respectively. Given a value forx2, there are only two possible
values for x1, so x1 and x2 are not independent. However, the
mean of these values is 0, which is the mean of x1, so x1 and
x2 are not correlated.
B MATRIX DERIV ATIVES
If f (X ) is a scalar function of a matrix X , the matrix deriva-
tive ∂f (X )
∂X is defined as the matrix
©­­
«
∂f (X )
∂X (1,1) ... ∂f (X )
∂X (1,n)
... ... ...
∂f (X )
∂X (n,1) ... ∂f (X )
∂X (n,n)
ª®®
¬
Lemma B.1. Let X be a m × n matrix, a be a m × 1 vector,
b be a n × 1 vector.
∂aT X b
∂X = abT (45)
∂(aT X T X b)
∂X = X (abT + baT ) (46)
∂(trace (X BXT ))
∂X = X BT + X B (47)
See Petersen and Pedersen for a proof [23].
C PROOF OF THEOREM 4.1
Theorem 4.1, which is reproduced below for convenience,
can be proved using matrix derivatives.
Theorem. Let pairwise uncorrelated estimates xi (1≤i≤n)
drawn from distributionspi (x)=(µµµi , Σi ) be fused using the lin-
ear model yA(x1, .., xn) = Ín
i=1 Ai xi , where Ín
i=1 Ai = I . The
MSE (yA) is minimized for
Ai = (
nÕ
j=1
Σ−1
j )−1Σ−1
i .
Proof. To use the Lagrange multiplier approach, we can
convert the constraint Ín
i=1 Ai = I into a set of m2 scalar
equations (for example, the first equation would beA1(1, 1) +
A2(1, 1) + .. + An(1, 1) = 1), and then introduce m2 Lagrange
multipliers, which can denoted byλ(1, 1), ...λ(m, m).
This obscures the matrix structure of the problem so it is
better to implement this idea implicitly. Let Λ be an m×m
matrix in which each entry is one of the scalar Lagrange
multipliers we would have introduced in the approach de-
scribed above. Analogous to the inner product of vectors, we
can define the inner product of two matrices as <A, B> =
trace (ATB) (it is easy to see that<A, B> isÍm
i=1
Ím
j=1 A(i, j)B(i, j)).
13


## Page 14

Using this notation, we can formulate the optimization prob-
lem using Lagrange multipliers as follows:
f (A1, ..., An) = E
 nÕ
i=1
(xi −µµµi )TAi TAi (xi −µµµi )

+

Λ,  nÕ
i=1
Ai − I
Taking the matrix derivative of f with respect to each Ai
and setting each derivative to zero to find the optimal values
of Ai gives us the equationE

2Ai (xi −µµµi )(xi −µµµi )T + Λ

= 0.
This equation can be written as 2Ai Σi + Λ = 0, which im-
plies
A1Σ1 = A2Σ2 = ... = An Σn = − Λ
2
Using the constraint that the sum of all Ai equals to the
identity matrix I gives us the desired expression for Ai:
Ai = (
nÕ
j=1
Σ−1
j )−1Σ−1
i
□
D PROOF OF THE OPTIMALITY OF
EQUATION 40
We show that(bxt |t = bxt |t −1 + Kt (zt − Htbxt |t −1)) (Equation 40)
is an optimal unbiased linear estimator for fusing thea priori
state estimate with the measurement at each step. The proof
has two steps: we show that this estimator is unbiased, and
then show it is optimal.
Unbiased condition: We prove a more general result that
characterizes unbiased linear estimators for this problem,
assuming that the prediction stage (Figure 4(d)) is unchanged.
The general form of the linear estimator for computing the
a posteriori state estimate is
byt |t = At ∗ byt |t −1 + Bt ∗ zt (48)
It is unbiased if E[byt |t ]=E[xt ], and we show that this is true
if At =(I −Bt ) ∗ Ht .
The proof is by induction ont. By assumption,E[by0|0] = E[x0].
Assume inductively that E[byt −1|t −1]=E[xt −1].
(a) We first prove that the predictor is unbiased.
byt |t −1 = Ft ∗byt −1|t −1 + Bt ∗ut (Predictor in Figure 4)
E[byt |t −1] = Ft ∗ E[byt −1|t −1] + Bt ∗ut
= Ft ∗ E[xt −1] + Bt ∗ut (By inductive assumption)
= E[Ft ∗ xt −1 + Bt ∗ut ]
= E[Ft ∗ xt −1 + Bt ∗ut + wt ] (wt is zero mean)
= E[xt ] (From state evolution equation 34)
(b) We prove that the estimator in Equation 48 is unbiased if
At =(I −Bt ) ∗ Ht .
E[byt |t ] = E[At ∗ byt |t −1 + Bt ∗ zt ] (From Equation 48)
= At ∗ E[byt |t −1] + Bt ∗ E[zt ]
= At ∗ E[xt ] + Bt ∗ E[Ht xt + vt ] (Equation 37 for zt )
= At ∗ E[xt ] + Bt ∗ Ht ∗ E[xt ] (Because vt is zero mean)
= (At + Bt ∗ Ht ) ∗ E[xt ]
The estimator is unbiased if (At + Bt ∗ Ht ) = I, which is
equivalent to requiring that At = (I − Bt ∗ Ht ). Therefore
the general unbiased linear estimator is of the form
byt |t = (I − Bt ∗ Ht ) ∗ byt |t −1 + Bt ∗ zt
= byt |t −1 + Bt ∗ (zt − Ht ∗ byt |t −1) (49)
Since Equation 40 is of this form, it is an unbiased linear
estimator.
Optimality: We now show that usingBt = Kt at each step
is optimal, assuming that this is done at all time steps beforet.
Since zt and yt |t −1 are uncorrelated, we can use Lemma 2.2 to
compute the covariance matrix ofbyt |t , denoted by Ξt |t . This
gives Ξt |t = (I − Bt Ht )Σt |t −1(I − Bt Ht )T + Bt Rt BT
t . TheMSE
is the trace of this matrix, and we need to find Bt that mini-
mizes this trace. Using matrix derivatives (Equation 47), we
see that
∂(trace (Ξt |t ))
∂Bt
= −2(I − Bt Ht )Σt |t −1HT
t + 2 ∗ Bt Rt
Setting this zero and solving for Bt gives
Bt = Σt |t −1HT
t [Ht Σt |t −1HT
t + Rt ]−1. This is exactly Kt , prov-
ing that Equation 40 is an optimal unbiased linear estimator.
Comment: This proof of optimality provides another way
of deriving Equation 40. We believe the constructive ap-
proach described in Section 6 provides more insight into how
and why Kalman filtering works. The ideas in that construc-
tion can be used to provide a different proof of optimality.
14
