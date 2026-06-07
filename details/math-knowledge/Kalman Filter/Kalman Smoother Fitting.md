# Fitting a Kalman Smoother to Data Shane Barratt Stephen Boyd

Converted from: `Kalman Filter\Kalman Smoother Fitting.pdf`


## Page 1

Fitting a Kalman Smoother to Data
Shane Barratt Stephen Boyd
March 7, 2020
Abstract
This paper considers the problem of ﬁtting the parameters in a Kalman smoother
to data. We formulate the Kalman smoothing problem with missing measurements as a
constrained least squares problem and provide an eﬃcient method to solve it based on
sparse linear algebra. We then introduce the Kalman smoother tuning problem, which
seeks to ﬁnd parameters that achieve low prediction error on held out measurements.
We derive a Kalman smoother auto-tuning algorithm, which is based on the proximal
gradient method, that ﬁnds good, if not the best, parameters for a given dataset.
Central to our method is the computation of the gradient of the prediction error on
the held out measurements with respect to the parameters of the Kalman smoother;
we describe how to compute this at little to no additional cost. We demonstrate the
method on population migration within the United States as well as data collected
from a smartphone’s IMU+GPS system while driving.
1 Introduction
Kalman smoothers are used widely to estimate the state of a linear dynamical system from
noisy measurements [Swe58, Kal60]. In the traditional formulation, the dynamics and output
matrices are considered ﬁxed attributes of the system; the covariance matrices of the process
and sensor noise are tuned by the designer, within some limits, to obtain good performance
in simulation or on the actual system. For example, it is common to use noise levels in the
Kalman smoother well in excess of the actual noise to obtain practical robustness [Gel74,
§8].
In this paper we take a machine learning approach to the problem of tuning a Kalman
smoother. We start with the observation that (by our deﬁnition) only the output is observed.
This implies that the only way we can verify that a Kalman smoother is working well is to
compare the outputs we predict with those that actually occur, on new or unseen test data,
i.e., data that was not used by the Kalman smoother. In machine learning terms, we would
consider this output prediction error to be our error, with the goal of minimizing it. We
consider the noise covariance matrices, as well as the system matrices, as parameters that
can be varied to obtain diﬀerent estimators, in this case, diﬀerent Kalman smoothers. These
1


## Page 2

are varied, within limits, to obtain good test performance; this ﬁnal Kalman smoother can
then be checked on entirely new data.
To do this we formulate the Kalman smoothing problem, with missing observations, as a
simple least squares problem, with a coeﬃcient matrix that depends on the parameters, i.e.,
the system and noise covariance matrices. We show how to eﬃciently compute the derivative
of the test error with respect to the parameters, and use a simple proximal gradient method to
update them to improve the test error. This method yields a Kalman smoother auto-tuning
method. It uses one or more observed output sequences, and the usual prior knowledge in
determining the starting system matrices as well as a description of the set over which we
are allowed to vary them.
The same formulation works for tuning robust Kalman smoothers, where the process
and sensor noises are assumed to have a non-Gaussian distribution, typically with fatter
tails. In this case the least squares formulation of the Kalman smoother becomes a convex
optimization problem, and the eﬀect of the parameters is even less obvious, and therefore
harder to tune manually. Our auto-tuning method extends immediately to such problems.
In summary, the contributions of this paper are:
• We describe a Kalman smoother auto-tuning method that requires only a dataset of
measurements, which may have missing entries.
• We describe an eﬃcient method for computing the gradient of the prediction error
with respect to the Kalman smoother parameters, that incurs little to no additional
computational cost on top of already smoothing.
• We provide an open-source implementation of the aforementioned ideas and illustrate
the method via numerical examples that use real data.
Related work. The Kalman ﬁlter was independently invented by Swerling [Swe58] and
Kalman [Kal60] around 1960, and one of its original applications was for space aircraft track-
ing in the Apollo navigation system [MS85]. The Kalman ﬁlter assumes a priori knowledge
of the system matrices and noise statistics. Indeed, in his ground-breaking paper, Kalman
remarked on the diﬃculty of identifying such parameters:
In real life, however, the situation is usually reversed. One is given the covariance
matrix [of the state] and the problem is to get [the dynamics] and the statistical
properties of [the disturbance]. This is a subtle and presently largely unsolved
problem in experimentation and data reduction.
Despite its wide use and success, practitioners employing the Kalman smoother still have
to resort to manually tuning its parameters. As a result, many have proposed methods
for automatically tuning the parameters in Kalman smoothers. One of the ﬁrst methods
proposed was to jointly learn the parameters and state/output sequence using expectation-
maximization [SS82]. More recent approaches employ diﬀerent optimization algorithms,
including the simplex algorithm [Pow02], coordinate descent [ACM +05], genetic algorithms
2


## Page 3

[OS00], nonlinear programming using ﬁnite diﬀerencing for the gradient [AE12], Bayesian
optimization [CHJA18], and reinforcement learning [GES07].
Our approach is inspired by previous research on automatically tuning hyper-parameters
in least squares [BB19]. Our paper departs from prior work on tuning Kalman ﬁlters in
several ways. Since our Kalman smoother can deal with missing measurements, we can
hold out measurements and use those to evaluate the smoother. Also, our method makes
explicit use of the gradient of the loss with respect to the parameters, leading to a more
eﬃcient optimization algorithm than black box (or zeroth order) techniques, such as genetic
algorithms and ﬁnite diﬀerencing.
2 Kalman smoother
System model. We consider a linear system with dynamics
xt+1 =Axt +wt, t = 1,...,T − 1, (1)
and output or sensor measurements
yt =Cxt +vt, t = 1,...,T. (2)
Here xt∈ Rn is the state, wt∈ Rn is the process noise, yt∈ Rp is the output or sensor
measurement, and vt∈ Rp is the sensor noise, at time t. The matrix A∈ Rn×n is the state
dynamics matrix and C ∈ Rp×n is the output matrix. We make the standard statistical
assumptions that w1,...,w T−1 are IIDN (0,W ) and v1,...,v T are IIDN (0,V ), where the
symmetric positive deﬁnite matrices W and V are the process and sensor noise covariance
matrices, respectively.
Missing measurements. We assume throughout that only the sequence yt is observed.
Indeed, we will assume that not all of the measurements are available to us. To model this,
we modify the output equation (2) so that yt∈ (R∪{ ?})p, where ? denotes a missing value.
We have
(yt)i = (Cxt +vt)i, (t,i )∈K, (3)
whereK ⊆{1,...,T }×{ 1,...,p } is the set of (scalar) outputs that are available. For
(t,i )̸∈K , we take (yt)i = ?. We refer to entries of yt that are real as known measurements
and entries of yt that have the value ? as missing measurements.
Smoothing. The goal in smoothing is to reconstruct or approximate the missing measure-
ments given the known measurements. Since the outputs and states are jointly Gaussian,
the maximum likelihood and conditional mean estimates of the missing output values are
the same, and can be found as the solution of the constrained least squares problem
minimize ∑T−1
t=1∥W−1/2(ˆxt+1−A ˆxt)∥2
2+
∑T
t=1∥V−1/2( ˆyt−C ˆxt)∥2
2,
subject to (ˆyt)i = (yt)i, (t,i )∈K,
(4)
3


## Page 4

with variables ˆx1,..., ˆxT and ˆy1,..., ˆyT .
We note that problem (4) has a simple and widely used recursive solution for ˆ xt when
K = (1,...,T )× (1,...,p ), and also when T→∞ . This recursive solution is often referred
to as the Kalman ﬁlter [Kal60].
Solving the Kalman smoothing problem. There are many ways to solve the Kalman
smoothing problem (4). One method is to eliminate the equality constraint [BV04, §4.2.4]
and solve the resulting unconstrained least squares problem, which has a banded coeﬃcient
matrix. This method has time and space complexity of orderT (n+p)2. We give some details
on another method that has roughly the same complexity, but is simpler since it does not
require eliminating the equality constraints.
Let N = T (n +p) and deﬁne the vector z∈ RN as z = (ˆx1,..., ˆxT, ˆy1,..., ˆyT ). Using
the variablez, we can express the estimation problem (4) compactly as the constrained least
squares problem [BV18,§17.3]
minimize 1
2∥Dz∥2
2
subject to Bz =c, (5)
whereB∈ R|K|×N is a selector matrix and c∈ R|K| contains the corresponding entries of yt.
Concretely, if we denote the elements inK asK1,..., K|K|, then ifKj = (t,i ), the jth row of
B is eTn +tp+i and the jth entry of c is (yt)i. The matrix D∈ RN−n×N is given by
D =
[ D11 0
D21 D22
]
,
where
D11 =


−W−1/2A W−1/2 0 0
0 ... ... 0
0 0 −W−1/2A W−1/2


D21 =


−V−1/2C 0 0
0 ... 0
0 0 −V−1/2C


D22 =


V−1/2 0 0
0 ... 0
0 0 V−1/2

.
The matrices D andB are evidently very sparse, since each have a density of approximately
1/N.
The optimality conditions for (5) can be expressed as


0 DT BT
D −I 0
B 0 0




z
v
η

 =


0
0
c

,
4


## Page 5

where η∈ R|K| is the dual variable for the equality constraint and v = Dz. The KKT
matrix, denoted by
M =


0 DT BT
D −I 0
B 0 0

,
is also very sparse, since B and D are sparse.
We assume for the remainder of the paper that M is full rank (if it is not, we can add
a small amount of regularization to make it invertible). Therefore we can solve the KKT
system using any method for solving a sparse system of linear equations, e.g., a sparse LU
factorization. The complexity of a sparse LU factorization mainly depends on the ﬁll-in of
the factorization, making it hard to analyze, but we have observed that the time complexity
is roughly linear in T .
Judging a Kalman smoother. Suppose we have gathered a sequence of outputs denoted
y1,...,y T ∈ (R∪{ ?})p. We can judge how well a Kalman smoother is working on this
sequence of observations by obscuring a fraction of the known outputs and comparing the
outputs predicted by the Kalman smoother to those that actually occurred.
The ﬁrst step in judging a Kalman smoother is to mask some fraction ( e.g., 20%) of
the non-missing entries in the observations, denoted by the set M⊆ (1,...,T )× (1,...,p ),
resulting in a masked trajectory ˜y1,..., ˜yT . That is, we let (˜ yt)i = ? for ( t,i )∈M and
(˜yt)i = (yt)i for (t,i )̸∈M .
We then solve the smoothing problem (4) with yt = ˜yt and known setK\M , resulting
in a predicted output trajectory ˆy1,..., ˆyT .
In order to judge the Kalman smoother, we calculate the prediction error, which is the
squared diﬀerence between the predicted output trajectory and the actual trajectory in the
entries that we masked,
L =
∑
(t,i)∈M
((ˆyt)i− (yt)i)2. (6)
The goal in the sequel will be to adjust the parameters to minimize this error.
3 Kalman smoother auto-tuning
In this section we describe how to automatically tune the parameters in a Kalman smoother
(that is, the dynamic matrices and covariance matrices) to minimize the prediction error on
the held-out measurements (6). Once the parameters have been tuned, the Kalman smoother
can be tested on another (unseen) output sequence.
Algorithm 3.1 Kalman smoother auto-tuning.
given initial hyper-parameter vector θ1∈ Θ, initial step size t1, number of iterations niter,
tolerance ϵ.
5


## Page 6

for k = 1,...,n iter
1. Filter the output sequence . Let ˆy1,..., ˆyT be the solution to (4).
2. Compute the gradient of the prediction error . gk =∇θL(θ).
3. Compute the gradient step . θk+1/2 =θk−tkgk.
4. Compute the proximal operator . θtent = proxtkr(θk+1/2).
5. if F (θtent)≤F (θk):
Increase step size and accept update. tk+1 = (1.5)tk; θk+1 =θtent.
Stopping criterion. quit if∥(θk−θk+1)/tk + (gk+1−gk)∥2≤ϵ.
6. else Decrease step size and reject update . tk+1 = (0.5)tk; θk+1 =θk.
end for
Kalman smoother parameters. A Kalman smoother has four parameters, which we
denote by
θ = (A,W−1/2,C,V −1/2)∈ Rn×n× Rn×n× Rp×n× Rp×p.
Evidently, this parametrization of the Kalman smoother is not unique. For example, if
T ∈ Rn×n is invertible, then ˜xt = Txt, ˜A = TAT−1, ˜W = T−1WT−T , ˜C = CT−1, and
˜V =V gives another representation of (4). As another example, scaling W andV byα> 0
gives an equivalent representation of (4).
Auto-tuning problem. The prediction error L in (6) is a function of the parameters,
and from here onwards we denote that function by L(θ). To tune the Kalman smoother, we
propose solving the optimization problem
minimize F (θ) =L(θ) +r(θ), (7)
with variable θ (the parameters of the Kalman smoother), where r : Θ→ R is a regulariza-
tion function. Here Θ denotes the set of allowable parameters and can, for example, include
constraints on what parameters we are allowed to change. (The function r evaluates to +∞
for θ̸∈ Θ, thus constraining θ to be in Θ.)
The objective functionF : Θ→ R is composed of two parts: the prediction error and the
regularization function. The ﬁrst term encourages the Kalman smoother to have the same
outputs as those observed, and the second encourages the parameters to be simpler or closer
to an initial guess.
Regularization functions. There are many possibilities for the regularization functionr;
here we describe a few. Suppose we have some initial guess for A, denoted Anom. We could
then penalize deviations of A from Anom by letting, e.g.,
r(θ) =∥A−Anom∥2
F.
As another example, suppose we suspected that C was low rank; then we could use
r(θ) =∥C∥∗,
6


## Page 7

where∥C∥∗ is the nuclear norm ofC, i.e., the sum of the singular values ofC. This regularizer
encourages C to be low rank. Of course, any combination of these regularization functions
is possible.
Allowable sets. There are also many possibilities for Θ, the allowable set of parameters.
One option is to only allow certain entries of A to vary by letting the set of allowable A
matrices be
{A|Aij = (Anom)ij, (i,j )∈ Ω}
for some set Ω. If we wanted to keep A ﬁxed, we could let Θ = {Anom}. Another sensible
option is to let A vary within a box by letting the set of allowable A matrices be
{A|∥A−Anom∥∞≤ρ},
for some nominal guess Anom and maximum allowable change ρ> 0.
Solution method. The auto-tuning problem (7) is in general nonconvex, even if Θ and
r are convex, so it is very diﬃcult to solve exactly. Therefore, we must resort to a local or
heuristic optimization method to (approximately) solve it. There are many methods that
we could use to (approximately) solve the auto-tuning problem (see, e.g., [DR56, LM79,
Sho85, Nes13b]). In this paper we employ one of the simplest, the proximal gradient method
[Mar70, Nes13a], since F is diﬀerentiable in θ (see Sec. 3).
The proximal gradient method is described by the iteration
θk+1 = proxtkr(θk−tk∇θL(θ)),
where k is the iteration number, tk > 0 is a step size, and the proximal operator of the
function tr is deﬁned as
proxtr(ν) = argmin
θ∈Θ
(
tr(θ) + (1/2)∥θ−ν∥2
2
)
.
When Θ is a convex set and r is convex, evaluating the proximal operator requires solving
a (small) convex optimization problem. Also, the proximal operator often has a (simple)
closed-form expression [PB14]. We note that r need not be diﬀerentiable.
We employ the proximal gradient method with the adaptive step size scheme and stopping
condition described in [BB19]. The full algorithm for Kalman smoother auto-tuning is
summarized in Algorithm 3.1.
Computing the gradient. Evidently, the proximal gradient method requires computing
the gradient of the prediction error with respect to the parameters, denoted ∇θL(θ). The
sensitivity analysis of Kalman smoothing has previously been considered in the forward
direction, i.e., how changes in the parameters aﬀect the output [Gel74, §7].
7


## Page 8

To do this, we ﬁrst form the gradient of L with respect to ˆy1,..., ˆyT , given by
∇(ˆyt)iL =
{
2 ((ˆyt)i− (yt)i) ( t,i )∈M,
0 otherwise .
Next we form the gradient of L with respect to the solution to (5), which is given by
g =∇(z,η,v)L = (0,∇ˆy1L,..., ∇ˆyTL, 0, 0).
Next we solve the linear system
M


q1
q2
q3

 =−g,
which only requires a backsolve if we have already factorized M. Since the KKT system M
is invertible, the prediction error is indeed diﬀerentiable.
The next step is to form the gradient ofL with respect to the coeﬃcient matrix D, which
is given by
G =∇DL =D(q1zT +zqT
1 ).
Since θ only aﬀects D at certain entries, we only need to compute G at those entries. That
is, we compute G at the entries
G =
[ G11 0
G21 G22
]
,
where
G11 =


G11 G12 0 0
0 ... ... 0
0 0 G(T−1)(T−1) G(T−1)T

,
G21 =


GT 1 0 0
0 ... 0
0 0 G(2T−1)T

,
G22 =


G(T +1)T 0 0
0 ... 0
0 0 G(2T−1)(2T−1)

,
which we can eﬃciently do since
Gij = (Dq1)izj + (Dz)i(q1)j.
The ﬁnal step is to form the gradients with respect to the parameters, which are given
by
∇AL = −(W−1/2)T∑T−1
t=1 Gtt,
∇W −1/2L = ∑T−1
t=1 Gt(t+1)−GttAT,
∇CL = −(V−1/2)T∑T
t=1G(T−1+t)t,
∇V −1/2L = ∑T
t=1G(T +t)(T +1+t)−G(T−1+t)tCT.
8


## Page 9

The complexity of computing the gradient is roughly the same complexity as solving the
original problem, since it requires the solution of another linear system. However, the time
required to compute the gradient is often lower since we cache the factorization of M.
4 Experiments
In this section, we describe our implementation of Kalman smoother auto-tuning, as well as
the results of some numerical experiments that illustrate the method. All experiments were
performed on a single core of an unloaded Intel i7-8770K CPU.
Implementation. We have implemented the Kalman smoother auto-tuning method de-
scribed in this paper as an open-source Python package, available at
https://github.com/cvxgrp/auto_ks.
Our CPU-based implementation has methods for performing Kalman smoothing with missing
measurements and for tuning the matrices in the Kalman smoother (Algorithm 3.1). Our
only dependencies are scipy [JOP+01], which we use for sparse linear algebra, and numpy
[WCV11], which we use for dense linear algebra.
Performance. We ran our Kalman smoothing function on random problems with n =
p = 10. ﬁgure 1 shows the execution time, averaged over ten runs, of solving the smoothing
problem (denoted as forward in the ﬁgure), as well as computing the derivative with respect
to the the parameters (denoted as backward in the ﬁgure). As expected, the time required
to compute the solution and its derivative is roughly linear in the length of the sequence T .
Empirically, we found that the time required to compute the derivative is roughly half of
the time required to compute the solution. We remark that our method is very eﬃcient and
eﬀortlessly scales to extremely large problem sizes.
4.1 Human migration example
Suppose we have n states, where the ith state has a population xi. At some cadence, say
yearly, a fraction of people in each state decide to move to another state. We take noisy
measurements of the population in some of the states and wish to infer the population in
every state, including those we have not even measured.
Dynamics. The vector xt ∈ Rn denotes the population in each state at year t. The
dynamics are described by
xt+1 =Axt +wt,
where A∈ Rn×n
+ . Here Aij denotes the fraction of the population in state j that move to
state i each year. The process noise wt includes births, deaths, and immigration from or to
outside places.
9


## Page 10

101 102 103 104 105
T
101
102
103
104
Execution time (ms)
forward
backward
Figure 1: Method timings for a random problem with n =p = 10.
Outputs. Each year, we take noisy measurements of the populations in some of the states.
The outputs are described by
yt =xt +vt.
We use the set of known measurements K to denote the measurements we actually have
access to.
United States population data. We gathered yearly population data (in millions of
people) for the n = 48 states in the continental U.S from the U.S. Census Bureau [cen19].
The data includes all years from 1900 to 2018.
Experiment details. Our goal is to learn the dynamics matrix, dynamics covariance, and
output covariance via Kalman smoother auto-tuning. To this end, we use the regularization
function r(θ) = 0 and allowable set
Θ ={(A, diag(w),C 0, diag(v))|A∈ Rn×n
+ ,w,v ∈ Rn
+}.
We initialize the parameters as
A0 =I, W −1/2
0 = (30)I, C 0 =I, V −1/2
0 = (10)I
For each year, we pick 30 out of the 48 states at random to be measured. In each year, of
those measured, we pick 12 at random to be missing and 5 at random to be part of the test
set. We ran the method for 50 iterations with t0 = 1× 10−4.
10


## Page 11

T able 1: Entries in the learned A matrix.
From To Fraction
Texas California 0.56%
Florida California 0.42%
California Texas 0.30%
Texas Florida 0.29%
Pennsylvania California 0.28%
Results. The prediction error decreased from 0.0097 to 0.0058. The test error decreased
from 0.0041 to 0.0030. The algorithm took 31 seconds to run. Besides the purely numerical
results, there are interesting interpretations of the resulting parameters. For example, we
can interpret the oﬀ-diagonal entries in theA matrix as the fraction of the population in one
state that migrates to another state over the course of one calendar year. The biggest such
entries are displayed in table 1.
4.2 Vehicle smoothing example
In vehicle smoothing, we have noisy measurements of the position, velocity, and acceleration
of a vehicle over time, and wish to infer the true position, velocity, and acceleration at each
time step.
Dynamics. The state xt = (pt,vt,at) is composed of the position pt∈ R3, the velocity
vt∈ R3, and the acceleration at∈ R3. The dynamics are described by
xt+1 =


I hI 0
0 I hI
0 0 I

xt +wt.
Outputs. Any output vector and linear output matrix is possible. In this speciﬁc example
we use yt = (ˆpt, ˆat, (ˆvt)1, (ˆvt)2), so p = 8. The output is described by
yt =


I 0 0 0
0 0 0 I
0 I2 0 0

xt +vt.
Data. We used the Sensor Play data recorder iOS application [Bro14] to record the ac-
celeration, attitude, latitude, longitude, heading, speed, and altitude of an iPhone mounted
on a passenger vehicle. We converted the latitude and longitude into local North-East-Up
coordinates, used the heading to convert the speed into a velocity in local coordinates, and
used the attitude to orient the acceleration to local coordinates. We recorded data for a total
of 330 seconds with a sampling frequency of 100 Hz, resulting in T = 33000 measurements.
11


## Page 12

Experiment details. Our goal is to learn the state and observation covariance matrices,
via Kalman smoother auto-tuning. To this end, we penalize the oﬀ-diagonal entries ofW−1/2
and V−1/2 by using the regularization function
r(θ) =α
∑
i̸=j
(W−1/2
ij )2 +α
∑
i̸=j
(V−1/2
ij )2,
where α is a hyper-parameter (we use α = 1× 10−4) and
Θ ={(A0,W−1/2,C 0,V −1/2)|W∈ S9
+,V ∈ S8
+}.
We initialize the covariances as W−1/2
0 = I, V−1/2
0 = (0.01)I, and initialize A0 and C0 as
given in Sec. 4.2 and Sec. 4.2 respectively. We consider all measurement indices where
the GPS or velocity change as known (since GPS is only useful when it changes) and all
acceleration indices as known. We use 20% of the known position measurements as the
missing measurements and another 20% as the test measurements. We ran the method for
25 iterations with t0 = 1× 10−2.
Results. The prediction error decreased from 13.23 to 2.97. The test error decreased from
16.57 to 1.37. The algorithm took 135 seconds to run. The diagonals of the ﬁnal state and
output covariance matrices were
W = diag(5.7, 14.9, 1.1, 0.8, 1.3, 1.0, 1.0, 1.0, 1.3),
V = diag(0.2, 0.4, 9.6, 2.7, 2.3, 0.2, 1.4, 2.4).
(Note that these matrices can be scaled and the smoothing result is the same, so only relative
magnitude matters.) We observe that there is more state noise in north and east dimensions
than up, which makes sense. Also, there is less state noise in velocity than in position. We
also observe that there is much higher measurement noise for z direction in GPS, which is
true with GPS. In ﬁgure 2 we show the position estimates before and after tuning. Visually,
we see signiﬁcant improvement from tuning.
12


## Page 13

0 100 200 300 400
East (m)
0
100
200
300
400North (m)
before
after
Figure 2: Smoothed position estimates before and after tuning.
13


## Page 14

Acknowledgments
S. Barratt is supported by the National Science Foundation Graduate Research Fellowship
under Grant No. DGE-1656518.
References
[ACM+05] P. Abbeel, A. Coates, M. Montemerlo, A. Ng, and S. Thrun. Discriminative
training of Kalman ﬁlters. In RSS, volume 2, page 1, 2005.
[AE12] Dylan Asmar and Greg Eslinger. Nonlinear programming approach to ﬁlter
tuning, 2012.
[BB19] S. Barratt and S. Boyd. Least squares auto-tuning. arXiv preprint
arXiv:1904.05460, 2019.
[Bro14] Philip Broder. Sensor Play - data recorder, iOS App, 2014.
[BV04] S. Boyd and L. Vandenberghe. Convex optimization. Cambridge University Press,
2004.
[BV18] S. Boyd and L. Vandenberghe. Introduction to applied linear algebra: vectors,
matrices, and least squares . Cambridge University Press, 2018.
[cen19] U.S. census bureau, resident population by state. https://fred.stlouisfed.
org/release/tables?rid=118&eid=259194, 2019.
[CHJA18] Z. Chen, C. Heckman, S. Julier, and N. Ahmed. Weak in the NEES?: Auto-
tuning Kalman ﬁlters with bayesian optimization. In Intl. Conf. Information
Fusion, pages 1072–1079. IEEE, 2018.
[DR56] J. Douglas and H. Rachford. On the numerical solution of heat conduction
problems in two and three space variables. Transactions of the American Math-
ematical Society, 82(2):421–439, 1956.
[Gel74] A. Gelb. Applied optimal estimation . MIT press, 1974.
[GES07] C. Goodall and N. El-Sheimy. Intelligent tuning of a Kalman ﬁlter using low-
cost mems inertial sensors. In Proc. Intl. Symposium Mobile Mapping Technology,
pages 1–8, 2007.
[JOP+01] E. Jones, T. Oliphant, P. Peterson, et al. SciPy: Open source scientiﬁc tools for
Python, 2001. [Online; accessed 9/25/2019].
[Kal60] R. Kalman. A new approach to linear ﬁltering and prediction problems. Journal
Basic Engineering, 82(1):35–45, 1960.
14


## Page 15

[LM79] P. Lions and B. Mercier. Splitting algorithms for the sum of two nonlinear
operators. Numerical Analysis, 16(6):964–979, 1979.
[Mar70] B. Martinet. Br` eve communication. r´ egularisation d’in´ equations variationnelles
par approximations successives. Mathematical Modelling and Numerical Analysis,
4(R3):154–158, 1970.
[MS85] L. McGee and S. Schmidt. Discovery of the Kalman ﬁlter as a practical tool for
aerospace and industry. 1985.
[Nes13a] Y. Nesterov. Gradient methods for minimizing composite functions. Mathemat-
ical Programming, 140(1):125–161, 2013.
[Nes13b] Y. Nesterov. Introductory lectures on convex optimization: A basic course , vol-
ume 87. Springer Science & Business Media, 2013.
[OS00] Yaakov Oshman and Ilan Shaviv. Optimal tuning of a Kalman ﬁlter using genetic
algorithms. In AIAA GNC Conference, page 4558, 2000.
[PB14] N. Parikh and S. Boyd. Proximal algorithms. Foundations and Trends R⃝ in
Optimization, 1(3):127–239, 2014.
[Pow02] Thomas Powell. Automated tuning of an extended Kalman ﬁlter using the down-
hill simplex algorithm. Journal Guidance, Control, and Dynamics , 25(5):901–
908, 2002.
[Sho85] N. Shor. Minimization methods for non-diﬀerentiable functions , volume 3.
Springer Science & Business Media, 1985.
[SS82] Robert Shumway and David Stoﬀer. An approach to time series smoothing and
forecasting using the EM algorithm. Journal Time Series Analysis, 3(4):253–264,
1982.
[Swe58] P. Swerling. A proposed stagewise diﬀerential correction procedure for satellite
tracking and prediciton. Rand Corporation, 1958.
[WCV11] S. Walt, S. Colbert, and G. Varoquaux. The numpy array: a structure for eﬃcient
numerical computation. Computing in Science & Engineering, 13(2):22–30, 2011.
15
