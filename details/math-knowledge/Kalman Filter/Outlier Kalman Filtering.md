# Outlier-Insensitive Kalman Filtering: Theory and Applications

Converted from: `Kalman Filter\Outlier Kalman Filtering.pdf`


## Page 1

Outlier-Insensitive Kalman Filtering:
Theory and Applications
Shunit Truzman, Guy Revach, Nir Shlezinger, Itzik Klein
Abstract—State estimation of dynamical systems from noisy
observations is a fundamental task in many applications. It
is commonly addressed using the linear Kalman filter (KF),
whose performance can significantly degrade in the presence of
outliers in the observations, due to the sensitivity of its convex
quadratic objective function. To mitigate such behavior, outlier
detection algorithms can be applied. In this work, we propose
a parameter-free algorithm which mitigates the harmful effect
of outliers while requiring only a short iterative process of
the standard KF’s update step. To that end, we model each
potential outlier as a normal process with unknown variance and
apply online estimation through either expectation maximization
or alternating maximization algorithms. Simulations and field
experiment evaluations demonstrate our method’s competitive
performance, showcasing its robustness to outliers in filtering
scenarios compared to alternative algorithms.
Index Terms— Outlier Detection, Kalman Filter, Alternat-
ing Maximization, Expectation Maximization, Global Naviga-
tion Satellite Systems
I. I NTRODUCTION
S
TATE estimation from noisy observation is a core task
in various signal processing applications [2], such as
localization and tracking [3]–[5]. This task is commonly
addressed by the celebrated Kalman filter (KF) [6], a recursive
and efficient algorithm providing an optimal low-complexity
solution under the Gaussian noise and linear dynamics as-
sumptions. However, the KF’s performance degrades signifi-
cantly when observations are impaired by outliers, due to its
least-squares cost function [7]–[9]. In real-world scenarios,
measurements, especially from lower-quality sensors such
as global navigation satellite system (GNSS) devices, often
contain outliers [5], [10], [11]. This presents a significant
challenge to the KF effectiveness. Therefore, an algorithm’s
ability to remain insensitive to outliers plays a crucial role in
state estimation missions. Various techniques were proposed
in the literature to cope with outliers: basic techniques, such as
those in [12]–[14], employ statistical tests like the χ2-test to
identify outliers based on prior information, and subsequently
reject them. However, their robustness against outliers relies
Parts of this work were presented at the IEEE International Conference on
Acoustics, Speech, and Signal Processing (ICASSP) 2023 [1].
S. Truzman and I. Klein are with the Hatter Dept. of Marine Technolo-
gies, University of Haifa, Haifa, Israel, (e-mail: shunitruzman@gmail.com,
kitzik@univ.haifa.ac.il). G. Revach is with the Institute for Signal and
Information Processing (ISI), D-ITET, ETH Z ¨urich, Switzerland (e-mail:
grevach@ethz.ch). N. Shlezinger is with the School of ECE, Ben-Gurion
University of the Negev, Be’er Sheva, Israel (e-mail: nirshl@bgu.ac.il).
S. Truzman is supported by the Maurice Hatter Foundation.
The authors thank Prof. Hans-Andrea Loeliger for the helpful discussions.
solely on the prediction step. The methods in [15]–[17] suggest
reweighting the observation noise covariance at each update
step, but they often require extensive hyper-parameter tuning.
The approaches in [8], [18]–[20] strive to reduce the KF’s
sensitivity to outliers by replacing its quadratic cost function.
Specifically, the works [18], [19] propose a Huber-based KF
by minimizing the combined L1 and L2 norms. The nominal
noise is bounded using a Huber function, but the feature of
heavy tails inherent in non-Gaussian noises could limit the
estimation accuracy. The techniques in [8], [20] substitute the
quadratic cost function with more suitable, often nonsmooth,
convex functions, controlling outliers by promoting spar-
sity. However, these techniques involve smoothing algorithms
rather than filtering and can be computationally complex.
Methods such as [21] employ heavy-tailed distributions, like
the Student’s t-distribution, to model the observation noise.
However, in the absence of outliers, a significant degradation
is expected due to the violated Gaussian assumption. The
authors of [22] address this problem by using a hierarchical
distribution, specifically adopting a more robust distribution
when the noise is skewed. Another popular technique, known
as the maximum correntropy KF (MCKF) [23], [24], enhances
the KF’s performances for state estimation in presence of non-
Gaussian noises, where correntropy is maximized. However,
when the process model has uncertainties, the performance
of MCKF degrades [25]. With recent advancements in neural
networks (NNs), methods such as [14], [26] suggest detecting
and correcting outlier observations using NNs before they
enter into the KF stage. Nonetheless, these methods often
require access to large amounts of data and pre-training.
In [27], the use of normal with unknown variance (NUV)
prior is introduced to devising an outlier insensitive Kalman
smoother (KS). Inspired by sparse Bayesian learning [28],
[29], the authors propose to model each potential outlier as
NUV [30]–[32], and estimate the unknown variance using
expectation maximization (EM) algorithm [33], [34], resulting
in sparse outlier detection. In [27] focuses on the offline
smoothing task and proposes only the derivation of the EM
to estimate the unknown variance, which requires the com-
putation of second-order moments. In addition, this work
focuses on a smoothing problem, commonly used for post
processing, where all the data is available and one can run a
forward and backward pass algorithm that allows to refine the
state estimates simultaneously, which makes the task simpler
compared to KF.
In the preliminary findings of this work, reported in the con-
ference paper [1], we introduced the outlier-insensitive Kalman
filter (OIKF), which is designed for the more commonly
1
arXiv:2309.09505v3  [eess.SP]  25 Aug 2024


## Page 2

encountered task of online real-time filtering. In addition to
presenting the EM algorithm, we also provide the alternating
maximization (AM) algorithm [35] for estimating the unknown
variance, which eliminates the need for computing the second-
order moment of the state vector, makes its implementation
simpler and requires significantly less computation time. The
main advantages of our approach, compared to other existing
outlier-robust KF methods, are that it (i) is parameter-free;
(ii) amounts to a short iterative process within the KF’s update
step, i.e., we effectively stay within the linear Gaussian frame-
work, and (iii) effectively leverages all observation samples
during the state estimation process of the KF. This paper
extends the preliminary findings reported in our conference
paper [1] with the following additional contributions:
1) Motivation: A comprehensive motivation for the utiliza-
tion of NUV in outlier detection within the KF frame-
work, highlighting its benefits.
2) Theory: A comprehensive elucidation of the motivation
behind the NUV prior representation to model outlier and
tackle the problem of state estimation in the presence of
outliers. To that end, we provide a complete mathematical
derivation providing in-depth insights into the theoretical
aspects of our OIKF with its two implementations OIKF-
EM and OIKF-AM.
3) Extensive Simulation Analysis : a comparison for sce-
narios with low outlier intensity, suitable for any sensor
updating the KF, which are inherently more challenging
to detect and compensate for.
4) GNSS Outlier Detection : A real-world analysis focused
on GNSS outlier detection using two datasets with three
different platforms to highlight our approach’s robustness.
One dataset comprises of Segway recordings [36], while
the other comprises data from a quadrotor and a marine
vessel [37].
5) Open Source : The source code and additional in-
formation on our empirical study can be found at
https://github.com/KalmanNet/OIKF-NUV .git.
The rest of this paper is organized as follows: Section II
reviews the preliminaries for the outlier-robust state estima-
tion task. Section III provides detailed explanations of NUV
modeling and its utilization in the OIKF. Section IV presents
the results of the empirical study, while Section V concludes
the paper with final remarks.
II. P ROBLEM FORMULATION AND PRELIMINARIES
In this section, we introduce the preliminaries for the task of
outlier-robust online state estimation, namely, the state space
(SS) model with outliers, and recapitulate the KF algorithm.
A. State Space Model with Outliers
We consider a scenario where noisy time-series observa-
tions, denoted as {yτ }t
τ =1, are sequentially presented to a
filter. The objective is to provide a sequence of estimates,
{ˆxτ }t
τ =1, corresponding to a sequence of hidden (latent)
values or ’states’, {xτ }t
τ =1 [38]. This scenario introduces an
additional challenge: a subset of the observations may be
impaired by outliers from an unknown distribution. We operate
under the assumption that an anomalous observation should be
considered a rare event to qualify as an outlier.
Unlike the offline state estimation task, also known as as
smoothing, which is considered in [39], where all observations
are provided as a batch, we focus on real-time filtering here. In
this approach, the estimate of xt relies solely on current and
past observations. This stands in contrast to the methodology
in [27], where iterating on the entire batch of observations
is used to enhance robustness to outliers and consequently
improve state estimation performance.
In this work, we assume that the underlying relationship
between the observed values and the hidden values is repre-
sented by a SS model [2]. We focus on a linear Gaussian SS
model in discrete-time, t ∈ Z, represented as follows:
xt = F · xt−1 + et, et ∼ N (0, Q) , xt ∈ Rm (1a)
yt = H · xt + zt + ut, zt ∼ N (0, R) , yt ∈ Rn. (1b)
Equation (1a) describes the time evolution of the state xt from
the previous state xt−1, governed by an system (evolution)
matrix F and additive Gaussian noise et. This noise, with a
process covariance matrix Q, represents potential modeling
uncertainties. Equation (1b) portrays how observations yt are
generated from xt, the current state at time step t. This pro-
cess involves a measurement (observation) matrix H, additive
Gaussian noise zt, with a measurement covariance matrix R
accounting for uncertainties in the measurements, and potential
outliers ut, which follows an unspecified distribution.
B. Linear Kalman Filtering
The celebrated KF [6] is particularly noteworthy for its
recursive and efficient algorithm, providing an optimal solution
under Gaussian noise and linear dynamics [2], [40]. In its most
general form, the KF aims to estimate the current state based
on a noisy observation signal. However, the KF’s performance
can degrade in the presence of outliers [8], [9], [20]. This
sensitivity stems from the filter’s objective to minimize a
quadratic cost function, a structure that inherently is not able
to follow fast jumps in the state dynamics [41]. For full details
on how the Maximum a posteriori (MAP) formulation boils
down to least-squares minimization, see [42], [43].
The KF estimates the state xt from the observations
{yτ }τ ≤t and can be thought of as a two-step process at
each time step: predict and update. In the predict step, the
joint probability distribution is computed using the first and
second-order moments of the Gaussian distribution, resulting
in the prior distribution. The predict of the 1st and 2nd order
moments:
ˆxt|t−1 = F · ˆxt−1, Σt|t−1 =F · Σt−1 · F⊤+Q, (2a)
ˆyt|t−1 = H · ˆxt|t−1 , St|t−1 =H · Σt|t−1 · H⊤+R. (2b)
where Σ represents the covariance of the state, F is the
state-transition model, and H is the observation and model.
The matrices Q and R are the covariance matrices of the
process noise and observation noise, respectively. The KF
uses this prior distribution in the update step in the posterior
2


## Page 3

distribution calculation by computing the new observation yt
with the previously predicted prior ˆxt|t−1 . And the update of
the 1st and 2st order statistical moment
ˆxt = ˆxt|t−1 + Kt · ∆yt, Σt =Σt|t−1 −Kt ·St|t−1 · K⊤
t , (3)
Kt = Σt|t−1 · H⊤ · S−1
t|t−1 , ∆yt = yt − ˆyt|t−1 . (4)
where Kt is the Kalman gain matrix used to balance the
contributions of both parts and produce the final posterior
distribution.
III. O UTLIER -INSENSITIVE KALMAN FILTERING USING
NUV P RIOR
This section introduces our OIKF algorithm. First, we
present the particular property of the NUV prior that motivates
us to model outliers as NUV and helps us tackle the problem
of state estimation in the presence of outliers, as seen in KF.
Then, we elaborate on our innovative approach of integrating
the NUV prior into the KF algorithm for outlier detection,
denoted as OIKF. Finally, we provide a comprehensive deriva-
tion of our two proposed algorithms to estimate the unknown
variance of the NUV, namely NUV-based EM and NUV-based
AM.
A. Motivation F or NUV Prior Representation
The NUV formulation models a variable of interest as a
normal distribution with unknown variance, given that the
unknown variance has a prior distribution [30], [32]. The NUV
representation method proves to be a robust approach with
various applications, each encountering different problems,
and the choice of a specific prior depends on its circumstances.
For example, [44] proposes different priors for computer
imaging problems. In our specific problem, outlier-insensitive
KF, we opt for a uniform prior, based on a previous work
[31], which demonstrates scenarios similar to our SS model.
This choice is motivated by computational convenience and the
objective of resulting in sparse outlier detection, as explained
in Subsection III-C and in Subsection III-E. Once the prior is
set, our approach is in fact a parameter free approach.
One well-known property of the NUV is its tendency to
yield a non-convex penalty [31], suitable for addressing sparse
least-squares problems with outliers. This non-convex penalty
is motivated by the influence function [45] in residuals. This
function assesses the effect of a residual’s size on the loss
by evaluating its derivative [20]. As the size of the residuals
increases, the influence function gradually approaches zero,
leading to a sparse solution.
To motivate, we employ a simple example, based on the
observation model (1b), which illustrates the fundamental
property of NUV priors. Consider a single observation of the
form
y = v + u, y ∈ R (5)
Here, v is an additive white Gaussian noise (AWGN) with
variance r2. The variable of interest u is modeled as a zero-
mean real scalar Gaussian random variable with an unknown
variance γ2 (NUV). The maximum likelihood estimation
(MLE) of γ2 from a single sample y ∈ R can be computed
as follows:
ˆγ2 = arg max
γ2≥0
P

y
γ2
P

γ2
(6)
when we assume a constant prior P

γ2
=
√
2π for compu-
tation convenience and P

y
γ2
is normally distributed, that
is P

y
γ2
∼ N

0, r2 + γ2
, then (6) can be rewritten as:
ˆγ2 = arg max
γ2≥0
(
1p
2π (r2 + γ2)
exp
 −y2
2(r2 + γ2)
)
(7)
To simplify the computation of (7) is written in terms of a
logarithmic function:
ˆγ2 = arg min
γ2≥0

ln

r2 + γ2
+ y2
(r2 + γ2)

. (8)
In order to derive (8), we equate its derivative with regard to
γ2 to zero and we get the closed form of unknown variance
γ2 of Gaussian u:
ˆγ2 = max

y2 − r2, 0

. (9)
In a subsequent step, assuming γ2 is estimated as ˆγ2 as in (9),
the MAP estimate of u, denoted as ˆ u, is given by:
ˆ u = arg max
u
P (y |u) · P (u) (10)
when P (y |u) ∼ N

u, r2
and P (u) ∼ N

0, γ2
, the
derivation of ˆ ucan be accomplished simper to γ2 in (9), thus,
ˆ u = arg max
u
(
1√
2πr2 e
−(y−u)2
2r2 + 1p
2πγ 2 e
−u2
2γ2
)
=arg min
u
(
(y − u)2
2r2 + u2
2γ2
)
.
(11)
Maximizing the expression in (11) results in
ˆ u =y· ˆγ2
ˆγ2 + r2 = max
y2 − r2
y , 0

. (12)
Plugging the obtained result (9) into P (y):
P (y) = max
γ2≥0
P

y |γ 2

· P

γ2
(13)
yields the equivalent cost function L (y) = − log P (y), when
P (y) can be derived from (8) when we also assume a constant
prior for P

γ2
, and we obtain:
L (y) = − log
"
1p
r2 + γ2 exp
 −y2
2 (r2 + γ2)
#
=1
2 log

r2 + γ2
+ y2
2 (r2 + γ2)
(14)
Using the obtained expression for ˆγ2 from (9), we obtain:
L (y) =
(
y2/

2r2
+ log r, y2 < r2
log |y| + 0.5, y2 ≥ r2 (15)
If r > 0, (15) results in a nonconvex function, which proves
valuable for handling sparse least-squares models, such as KF,
3


## Page 4

in the presence of outliers [31]. Through this example, we
establish that γ2 = 0 leads to u = 0, indicating that no outlier
is identified and the obtained γ2 leads to a nonconvex cost
function.
B. Kalman Filtering with NUV Prior
The proposed OIKF introduces a new form of the SS
model (1) by incorporating an additional variable into the ob-
servation signal, denoted as ut. This variable ut represents the
impulsive noise responsible for causing outliers. To improve
the model’s capability to handle heavy-tailed distributions
in observations, we model this outlier ut as normal with
unknown variance γγγ2
t , namely:
ut ∼ N (0, γγγ2
t ), γ γγ2
t ∼ P

γγγ2
t

(16)
where p(γγγ2
t ) is the prior distribution of γγγ2
t . The assumption
that NUV modeling follows a Gaussian distribution does
not imply that the noise obeys a conventional independent
and identically distributed (i.i.d) Gaussian model and that it
is perfectly suitable for representing outliers. This approach
allows us to remain within the linear Gaussian framework
without making strict assumptions about the outlier distribu-
tion. Figure 1 demonstrates visually the integration of the NUV
representation into the overall model through a factor graph.
The NUV representation approach results in a sparse outlier
detection solution [30], [32], indicating that most values of γγγ2
t
will be zero. Consequently, as can be seen in (12) this leads
to ut = 0, suggesting the absence of outliers, as expected.
For any given observation sample yt (1b), we define vt to
be the error vector as the sum of two independent sources:
the observation noise zt and the outlier noise ut. Thus, the
covariance matrix of vt is equal by definition:
vt ≜ yt − H · xt = zt + ut, vt ∼ N (0, Γt) (17)
Γt is diagonal and comprises the sum of variances of the two
noise sources, namely:
Γt = diag

ν2
t

, ν2
t ≜ r2 + γγγ2
t . (18)
In case the matrix Γt is non-diagonal, the KF becomes
nonlinear, requiring the use of an extended KF (EKF). In each
KF iteration, the temporary estimate of γγγ2
t is incorporated
into the overall covariance Γt, effectively reweighting the
covariance noise of the observations. Consequently, this affects
the Kalman gain Kt in the update equations, allowing to
extract the information from all the noisy observations and
leverage their information effectively.
For the process of MAP estimation of the unknown vari-
ance, γγγ2
t , we can apply either EM (Subsection III-C) or AM
(Subsection III-D) algorithms. While in the EM approach, the
second-order moment νt (18) is directly estimated, in the AM
approach, it is obtained from estimating the first-order moment
vt (17) only, as summarized below:
ˆγγγ2
t = max

ν2
t − r2, 0

, ν2
t =

EM : ˆν2
t , AM : ˆ v2
t

. (19)
For both approaches, an outlier is detected when ˆγγγ2
t ̸= 0 ,
otherwise, when ˆγγγ2
t = 0, it implies no outlier is present and
F +
N (0, Q)
=
H
+P(γγγ2
t )
N (0, 1) × +
N (0, R)
x0
et
zt
yt
γγγ2
t
ut
xtxt−1
Fig. 1: Factor graph of the system model at time step t
we revert to the standard KF, preserving its optimally for data
without outliers.
C. Expectation Maximization
For an observation yt, and the state vector xt as defined in
(1), the MAP estimation for the unknown variance ˆγγγ2
t is
ˆγγγ2
t (yt) = arg max
γγγ2
t ≥0
P

γγγ2
t |yt

= arg max
γγγ2
t ≥0
P

yt
γγγ2
t

· P

γγγ2
t

(20)
= arg max
γγγ2
t ≥0
Z
P

yt, xt
γγγ2
t

dx · P

γγγ2
t

(21)
To solve the optimization problem in (21), we devise the
iterative EM algorithm, which consists of two iterating steps,
namely, E-step and M-step.
The E-step determines the conditional expectation:
Ext
(γγγi−1
t )
2
,yt
h
log

P

yt, xt |γγγ 2
t

· P

γγγ2
t
i
=
Ext
(γγγi−1
t )
2
,yt

log P

yt
xt, γγγ2
t

+ P

xt
γγγ2
t

+ log P

γγγ2
t

(22)
Using the Markov property and the structure of the SS model,
the term P

xt
γγγ2
t

is can be rewritten as P (xt |xt−1 ).
The M-step goal is to maximize (22) with respect to γγγ2
t .
In this problem, we assume a uniform prior on the unknown
variance [30]:
P

γγγ2
t

∝ 1 (23)
The choice of P

γγγ2
t

to be uniform is one of many options.
As stated in [31], a uniform prior on P

γγγ2
t

, also known as
plain NUV , eventually leads to a non-convex cost function
which results in the sparse effect of the unknown variance,
with most of them being zeros, as expected.
Since P

γγγ2
t

and the evolution P (xt |xt−1 ) do not depend
on γγγ2
t , they can thus be omitted from the optimization process
(22) and we can evaluate the standard EM and compute the
conditional distribution in (22). Thus, the ith iteration step is
4


## Page 5

derived by:
Q
h
γγγi
t
2i
= Ext
(γγγi−1
t )
2
,yt

log P

yt
xt, γγγ2
t

=Ext
(γγγi−1
t )
2
,yt
"
log

1√Γt
· exp

− (yt − H · xt)2
2 · Γt
!!#
∝ log Γt + 1
Γt
· Ext
(γγγi−1
t )
2
,yt
h
(yt − H · xt)2
i
. (24)
To expand the term Ext
(γγγi−1
t )
2
,yt
h
(yt − H · xt)2
i
,we utilize
the KF, allowing to obtain the first- and second-order posterior
moments of xt, which equal by definition:
Ext
(γγγi−1
t )
2
,yt
(xt) ≜ ˆxi
t, (25a)
Ext
(γγγi−1
t )
2
,yt

xt · x⊤
t

= Σi
t + XII
t ≜ ˆXi
t. (25b)
The KF defines ˆxt as the posteriori state estimate mean of
x at time t, considering all observations up to and including
time t [6]. Therefore, given yt and

γγγi−1
t
2
, (25a) holds true.
Equation (25b) represents the squared first moment of xt, as
defined in (26), plus ˆΣt, the posteriori estimated covariance
matrix of xt, derived from the KF [6].
To simplify computations, the following expressions are
equal by definition:
XII
t ≜ ˆ xi
t · ˆ xi
t
⊤
, YII
t ≜ yt · y⊤
t ,
XYt ≜ ˆ xi
t · y⊤
t , YXt ≜ yt · ˆ xi
t
⊤
,
(26)
Finally, the expectation step (24) is reduced to the following
expression:
Q
h
γγγi
t
2i
= log Γt + 1
Γt
· Vt (27)
where Vt is equal by definition:
Vt ≜
n
YII
t − H · XYt − YXt · H⊤ − H · ˆXi
t · H⊤
o
(28)
In M-Step, we maximize (27) w.r.t. to Γt, thus for the i-th
iteration:
ˆΓi
t = arg max
Γ2
t ≥0

ln Γt + 1
Γt
· Vt

= Vt (29)
We further exploit the fact that Γt in (18) is diagonal, to
expand Γt to its components and estimate the variance

ˆνi
t,k
2
for each dimension k ∈ { 1, . . . , n} in a scalar manner
using (28)

ˆνi
t,k
2
= y2
t,k − 2 · yt,k · H · ˆxi
t,k + H ·
ˆxi
t,k
II
· H⊤ (30)
when ˆ xt is the posteriori state estimate. From (18), (30) and
the fact that variance must be positive, we can calculate γ2
t,k
in the ith iteration:

ˆγi
t,k
2
= max
n
ˆνi
t,k
2
− r2
k, 0
o
. (31)
Thus, when an outlier is detected at a time step t, γ2
t,k > 0
otherwise its 0, which may lead to a sparse solution. As a
consequence, the outlier will be estimated as ˆ ut,k = 0.
The above procedure is repeated iteratively for a fixed
K iterations, or until convergence is achieved. Algorithm 1
provides the suggested pseudo-code for the OIKF based NUV-
EM.
Algorithm 1 OIKF based NUV-EM for time instance t
1: Number of iterations K
2: Predict: Estimate a priori for ˆ xi=0
t|t−1 , Σi=0
t|t−1 via (2a)
3: for i = 0, ..., K −1 do
4: EM: Estimate
ˆγγγi
t
2
via (31) with the 2nd-order
5: moment ˆXi
t as in (25b)
6: Compute Γi
t = diag

r2 +
ˆγγγi
t
2
7: Compute ˆ yi
t|t−1 , Si
t|t−1 via (2b) with R = Γi
t.
8: Update: Estimate a posteriori for ˆ xi
t, Σi
t via (3)
9: end for
D. Alternating Maximization
As in the EM approach, our goal is to estimate γγγ2
t but here
using AM instead. To that end, we employ the iterative AM
algorithm based on the plain smoothed NUV [31] to compute
the joint MAP estimate for γγγ2
t , when the variable of interest
is vt. Consider the use of a NUV prior on variable vt in a
SS model with observation yt, we aim to determine their joint
MAP estimate:
[ˆvt, ˆγγγ2
t ](yt) = arg max
vt,γγγ2
t ≥0
P

yt, vt, γγγ2
t

=arg max
vt,γγγ2
t ≥0
P (yt |vt ) · P

vt
γγγ2
t

· P

γγγ2
t

. (32)
The latter is valid because as for certain continuous random
variables, the joint probability density function is defined as
the derivative of the joint cumulative distribution function.
To compute (32), we derive the AM algorithm, which
iterates between a maximization step over the error state vt
with a fixed variance γγγ2
t :
ˆvt =arg max
vt
P (yt |vt ) · P

vt |γγγ 2
t

(33)
In particular, we replace vt in (32) with its instantaneous
estimate ˆ vi
t = yt − H · ˆ xi
t, which can be extracted from the
KF. The next step in the AM is maximization (32) over the
unknown variance γγγ2
t based on vt, resulting in
ˆγγγ2
t = arg max
γγγ2
t ≥0
P

vt |γγγ 2
t

· P

γγγ2
. (34)
Note that since P (yt |vt ) doesn’t depend on γγγ2
t , and as we
assume a uniform prior for P

γγγ2
t

as in (23), these expressions
are not relevant for the maximization process (34) and can be
omitted.
For convenience, we formulate (34) in a scalar manner,
which extends to multivariate observations. To do that, we
assume that the observation noise zt and the outlier ut in each
dimension k are independent, allowing to treat their sum, vt,k,
in dimension k as a scalar, leading to the scalar rule:
ˆγ2
t,k = arg max
γ2
t,k≥0
P

vt,k|γ2
t,k

(35)
This maximization rule for γ2 is to the one in (6), when here
the variable of interest is the Gaussian vt,k. Therefore, we
5


## Page 6

can use the result obtained in (9), and find the closed-form
expression for the unknown variance of the ith iteration and
for the kth entry:

ˆγi
t,k
2
= max
n
ˆ vi
t,k
2
− r2
k, 0
o
(36)
We obtain an analytic expression of ˆγ2
t,k for the update step,
where we alternate between ˆ vi
t and ˆγ2
t,k until convergence.
Equation (36) is parameter-free and solely relies on the poste-
rior estimate of the state ˆxi
t. This is in contrast to EM, which
incorporates estimates of both the first- and second-order
moments of the states, represented as ˆxi
t and ˆXi
t, (25a) and
(25b), respectively. Similar to EM, this procedure is repeated
iteratively. Algorithm 2 provides the suggested pseudo-code
for the OIKF based NUV-AM.
Algorithm 2 OIKF based NUV-AM for time instance t
1: Number of iterations K
2: Predict: Estimate a priori for ˆ xi=0
t|t−1 , Σi=0
t|t−1 via (2a)
3: for i = 0, ..., K −1 do
4: AM: Compute ˆ vi
t = yt − H · ˆ xi
t
5: Estimate
ˆγγγi
t
2
via (36)
6: Compute Γi
t = diag

r2 +
ˆγγγi
t
2
7: Compute ˆ yi
t|t−1 , Si
t|t−1 via (2b) with R = Γi
t.
8: Update: Estimate a posteriori for ˆ xi
t, Σi
t via (3)
9: end for
E. Discussion
The NUV modeling is particularly efficient due to its sparse
features, suitable for handling KF in presence of outliers,
which can be achieved by selecting the prior distribution of γγγ2.
To that end, we opt for a uniform prior for the computations’
convenience, which effectively adjusts the overall loss function
to accommodate very sparse outliers’ detection. Different
choices for this prior would lead to alternative loss functions,
such as the convex Huber cost function [7]. Furthermore, the
efficiency of NUV modeling comes from being parameter-
free and not requiring hyper-parameter tuning, and from a
computational perspective, it involves a short iterative process
in the KF update step, leveraging all observation samples.
To integrate the NUV within the KF, we utilize either the
EM or AM algorithms to estimate the unknown variance of
the NUV. The estimated result combines to enhance the KF
update step. The main limitation of the EM is that it requires
the posterior variances of the state xt in each iteration, which
may be infeasible for large problems, while in AM version
it is obtained from the first-order moment. However, the AM
proves more effective compared to EM, as evident from the
empirical evaluation in Section IV.
It is important to note that in certain applications, EM
empirically gives better results than AM, primarily due to its
accounting for the accuracy of the state estimate. Its simplicity
relies on empirical second-order moments, and holds potential
for augmentation with trainable data-driven variations of the
KF, for instance [38], [39]. Such fusion leverages robust
filtering in partially known SS models and helps manage
sensitivity to outliers.
IV. A NALYSIS AND RESULTS
In this section, we present a comprehensive assessment of
the effectiveness of our proposed approaches: OIKF based
NUV-EM, and OIKF based NUV-AM, for outlier detection
within various KF setups. Their performance is evaluated
across different outlier intensities and tasks while comparing
their effectiveness to other established works in the literature:
(a) Simulations: Our first experimental study considers a
standard localization task with generated data. The syn-
thetic dataset is generated using the white noise accel-
eration (WNA) [40] model, and the observation signal
is subject to varying degrees of outlier corruption. Such
models are commonly used in several applications such
as navigation and target tracking.
(b) North Campus Long-Term (NCLT) Dataset : In our
second study, we examine localization use case based on
real-world data - the Michigan NCLT [36] dataset. Here,
we compare our methods with different algorithms for
tracking real-world dynamic data of a moving Segway
robot using GNSS noisy measurements.
(c) Autonomous Platforms Inertial (API) Dataset : The
third and fourth studies involve another localization use
case, based on the real-world data - the API [37], [46]
dataset. Here, we demonstrate the performances of our
algorithms in tracking a quadrotor and a marine vessel
using GNSS noisy measurements.
A. Simulations
In this study, we utilize a KF algorithm where the state
vector is represented by,
x =

p v
⊤
(37)
where p and v denote the position and velocity states, re-
spectively. For the experiments that involve generated data,
we establish the dynamic white noise acceleration model,
followed by a linear SS model. For the filtering process, we
assume both position and velocity measurements are available,
thus the observation matrix is the identity matrix and the
observation noise covariance matrix is diagonal; i.e.,
H =
1 0
0 1

, R = r2
1 0
0 1

(38)
The process noise covariance matrix is :
Q = q2
1 0
0 1

(39)
where q2 is the process noise variance, set to a constant value
of −10 [dB].
To evaluate our approach, we consider three scenarios for
generating measurements: noisy data without outliers, noisy
data with mild outliers, and noisy data with significant outliers.
The presence of outliers within the measurement vector is
modeled with intensities drawn from a Rayleigh distribution
with parameter σ2
u, where we employ two scale parameters
σ2
u = [3 , 30], representing low and high outlier intensities,
respectively. The occurrence of outliers in the dataset is
6


## Page 7

10
 5
 0 5 10 15 20 25 30
r 2 [dB]
30
20
10
0
10
MSE [dB]
Noise floor
KF
WRKF
2 - Test
Student's t
NUV-AM
NUV-EM
(a) Noisy data clean of outliers
10
 5
 0 5 10 15 20 25 30
r 2 [dB]
25
20
15
10
5
0
5
10
MSE [dB]
Noise floor
KF
WRKF
2 - Test
Student's t
NUV-AM
NUV-EM (b) Noisy data with outliers p = 0.2 scl = 3
10
 5
 0 5 10 15 20 25 30
r 2 [dB]
20
10
0
10
20
MSE [dB]
Noise floor
KF
WRKF
2 - Test
Student's t
NUV-AM
NUV-EM (c) Noisy data with outliers p = 0.2 scl = 30
Fig. 2: Sub-Fig. 2a, 2b and 2c present the mean-squared error (MSE) of the estimated position for the tracking application
in the KF setup. Our NUV methods were compared to different well-established robust KF algorithms in the literature.
determined using a Bernoulli distribution, B(p), where we set
the probability of an outlier to be p = 0 .2, indicating that
roughly 20% of the data points are considered outliers. In
Figure 2 we compare our proposed OIKF based on NUV-
EM and based on NUV-AM with the following algorithms:
classical KF, reweighted algorithm (WRKF [15]), χ2-test [13],
[14] and Student’s t-distribution [21]. The results are presented
in dB units to accentuate the distinctions between the obtained
results. The unit conversion to dB is as follows:
MSE [dB] = 10 · log10(MSE) (40)
This decision was motivated by the fact that, in some cases, the
differences can be subtle, making them challenging to notice
without the emphasis provided by dB units.
Figure 2a presents the results of evaluating the performance
of the NUV-AM algorithm on synthetic data that is clean of
outliers, wherein the algorithm achieves the optimal minimal
MSE bound by estimating a significant proportion of γγγ2
t
values as zero. Consequently, the model reverts to the KF,
which is optimal for data without outliers. However, the
student’s t outperforms our method because we optimize its
hyperparameter such that it tends toward a normally distributed
model (as the KF), which is also its drawback because it isn’t
an adaptive algorithm. In contrast, the χ2-test is deviating
significantly from the performance of the KF. This is due
to the necessity of determining its confidence level. In cases
of low-noise observations, it may incorrectly identify normal
samples as outliers, leading to their rejection and rendering
the model reliant solely on the prediction step. The relative
efficiencies of our OIKF and the KF can be assessed based
on the resulting MSE. Notably, as depicted in Figure 2a, the
average ratio of MSE values between the KF and OIKF-based
NUV-EM yields a relative efficiency of 92%, while OIKF-
based NUV-AM results in a relative efficiency of 96%. This
outcome underscores the effectiveness of our algorithms even
in the absence of outliers, due to the fact that a Gaussian
framework is maintained.
When utilizing synthetic data with outliers, as shown in Fig-
ure 2b and Figure 2c with outlier intensities of 3 and 30,
respectively, the NUV-AM algorithm exhibits superior per-
formance in terms of MSE as compared to other algorithms,
across varying values of observation noise variance r2, and for
both high and low outlier intensities. Notably, it demonstrates
similar performance to the NUV-EM algorithm and even
surpasses it for low observation noise without utilizing a
second-order moment as in EM.
In Figure 3, we exhibit the convergence plots of the esti-
mated variance ˆγ2, using the NUV-AM algorithm when an
outlier was identified. It is evident that the NUV-AM algo-
rithm achieves rapid convergence after approximately three
iterations, regardless of whether the outlier intensities are high
or low.
0 1 2 3 4 5 6 7
No. of iteration
2.18
2.20
2.22
2.24
2.26
2.28
2.30
2.32
2.34
2
(a) Low outlier intensity
0 1 2 3 4 5 6 7
No. of iteration
27.00
27.25
27.50
27.75
28.00
28.25
28.50
2
 (b) High outlier intensity
Fig. 3: Convergence plots of the estimated outliers’ variance
computed using the NUV-AM algorithm.
B. NCLT Dataset
For real-world data, we make use of the NCLT dataset [36].
The NCLT dataset is collected from a session with the date
2013-04-05, which GNSS readings sampled at 5[Hz] with
a degree of noise and the corresponding ground location
information of a Segway robot in motion. In the simulation
setting, we process the measured vehicle position directions
independently. To filter out these processes, we employ the
dynamic white noise acceleration model [40] for each direction
separately. Since only the GNSS position is observable in this
dataset, the measurement matrix is:
H =
1 0 
, (41)
and the process and measurement noise covariances are
R = r2, Q = q2

1 0
0 1

(42)
Figure 4 and Figure 5 depict the trajectory of the Segway
in the east and north directions, respectively, when the GNSS
7


## Page 8

measurements are subjected to outliers, that result in readings
deviating significantly from the ground truth (GT). We have
divided each trajectory into two time intervals, with the first
interval displaying outliers with lower intensity and the second
interval with higher intensity.
In addition, Figure 6 presents the spatial trajectory of the
moving Segway in both directions. In the x-axis, we depict the
trajectory from Figure 4, while the y-axis depicts the trajectory
from Figure 5.
(a) Time interval 0-50[min]
 (b) Time interval 50-68[min]
Fig. 4: The measured vehicle position in east direction ob-
tained from the noisy GNSS NCLT dataset (red points), is
compared to the estimated trajectory by our NUV-AM (blue
dashed line), which succeeded in passing the outliers and
achieved performance comparable to the ground-truth (green
dashed line).
(a) Time interval 0-50[min]
 (b) Time interval 50-68[min]
Fig. 5: The measured vehicle position in north direction
obtained from the noisy GNSS NCLT dataset (red points), is
compared to the estimated trajectory by our NUV-AM (blue
dashed line), which succeeded in passing the outliers and
achieved performance comparable to the ground-truth (green
dashed line).
Our analysis focuses on evaluating the effectiveness of
NUV-AM in estimating position from real-world data and
removing outliers reliably. In Table I we compare our proposed
OIKF based on NUV-EM and based on NUV-AM with
the following algorithms: classical KF, reweighted algorithm
(ORKF [16]), χ2-test [13], [14] and Student’s t-distribution
[21]. Additionally, Table I presents the root mean-squared
error (RMSE) and MSE for each algorithm, while the process
noise q2 and observation noise variance r2 of each algorithm
are optimized separately through grid search to yield the
lowest MSE. As shown in Table I, OIKF with both NUV-
EM and NUV-AM has the lowest estimation errors in both
directions, with NUV-AM performing slightly better when it
coincides with NUV-EM, even without utilizing the second-
order moment.
(a) Time interval 0-50[min]
 (b) Time interval 50-68[min]
Fig. 6: The measured vehicle position structure obtained from
the noisy GNSS NCLT dataset (red points), is compared
to the estimated trajectory by our NUV-AM (blue dashed
line), which succeeded in passing the outliers and achieved
performance comparable to the ground-truth (green dashed
line).
In terms of computation time, algorithms that combine
KF with outlier detection techniques achieve higher accuracy
but at the cost of longer computation runtimes, as outlier
detection is applied. Compared to other algorithms, the χ2-
test stands out as the shortest, stemming from the fact that it
only detects and rejects outliers during the prediction step. On
the other hand, a more sophisticated technique, such as the
ORKF, requires more time due to its increased computational
complexity, which requires tuning multiple parameters. In con-
trast, the runtime computation for the student’s t distribution
is significantly shorter compared to the ORKF because it
requires tuning only one parameter. Our algorithms present
relatively shorter computation times among outlier detection
and weighting algorithms, coupled with low MSE, making
them suitable for real-time tasks. Additionally, in comparison
to our other suggested method, NUV-based EM, NUV-based
AM showcases an almost 40% reduced runtime.
TABLE I: Position error for optimal values of
r2 and q2 for NCLT dataset
North direction East direction Runtime
RMSE[m] MSE[dB] RMSE[m] MSE[dB] [ms]
Noisy
GNSS 349.3 50.8 266.1 48.5 -
KF 92.3 39.3 164.4 44.3 0.05
ORKF 27.7 28.8 28 28.9 2.8
χ2-test 12.3 21.8 14.2 23 0.1
Student’s t 11.5 21.2 13.8 22.8 0.5
NUV-AM 10.4 20.3 13 22.3 0.3
NUV-EM 10.3 20.3 13 22.3 0.4
C. API Dataset
To emphasize the versatility and robustness of our ap-
proaches in tracking real-world dynamic data of different plat-
forms, which may be corrupted by various types of outliers,
we evaluate the API dataset [37]. The API dataset is collected
from the MATRICE 300 quadrotor platform containing GNSS
RTK reading sampled at 10[Hz] and from a marine vessel
named ”Shikmona” containing motion reference units (MRU)
with GNSS RTK receiver, sampled at 100[Hz].
8


## Page 9

Their trajectories were populated with generated outliers,
sampled with intensity from a Rayleigh distribution, while
their time steps within the data were drawn from a Bernoulli
distribution. To filter out this process, we use the same model
and parameters as in Subsection IV-B.
It is evident from Figure 7 that our OIKF based on NUV-
AM algorithm accurately estimates the position, effectively
handling all outliers in both vertical and horizontal directions
of the quadrotor trajectory.
(a) Horizontal direction
 (b) Vertical direction
Fig. 7: The measured quadrotor trajectory obtained from the
noisy GNSS measurements (red points), with the estimated
trajectory by our NUV-AM (blue dashed line), and ground-
truth (green dashed line).
In Table II we compare our proposed OIKF based on NUV-
EM and based on NUV-AM with the following algorithms:
classical KF, reweighted algorithm (ORKF [16]) and χ2-
test [13], [14]. Additionally, Table II presents the RMSE and
MSE for each algorithm, while the process noise q2 and
observation noise variance r2 of each algorithm are optimized
at the same procedure as in the Table I. As shown in Table II,
OIKF with both NUV-EM and NUV-AM has the lowest
estimation errors for both directions and emphasize the use
in NUV method for outlier detection.
TABLE II: Position error for optimal values of
r2 and q2 for API dataset - quadrotor recordings
Horizontal direction Vertical direction
RMSE[m] MSE[dB] RMSE[m] MSE[dB]
Noisy GNSS 10.4 20.3 6.4 16.1
KF 0.9 -1.2 1.8 5.3
ORKF 0.8 -1.9 1 -0.4
χ2-test 0.3 -11.4 0.5 -6.3
NUV-AM 0.1 -17.9 0.3 -10
NUV-EM 0.1 -17.9 0.3 -10.2
Figure 8 demonstrates the performance of our OIKF-based
NUV-AM in estimating the position of the ”Shikmona” ma-
rine vessel. The examined trajectory includes straight line
segments and turns. As can be seen, OIKF-based NUV-AM
successfully tracks the ground truth and surpasses outliers,
even during turns. Table III underscores the superior perfor-
mance of our proposed OIKF based on NUV-EM and based
on NUV-AM compared to the following algorithms: classical
KF, reweighted algorithm (ORKF [16]) and χ2-test [13], [14],
revealing significantly low RMSE and MSE values for both
our NUV-EM and NUV-AM algorithms.
Fig. 8: The measured ”Shikmona” marine vessel trajectory
obtained from the noisy GNSS measurements (red points),
with the estimated trajectory by our NUV-AM (blue dashed
line), and ground-truth (green dashed line).
TABLE III: Position error for optimal values of r2
and q2 for API dataset - marine vessel recordings
RMSE[m] MSE[dB]
Noisy GNSS 373 51
KF 267 48
ORKF 48 34
χ2-test 6 16
NUV-AM 2.4 7.52
NUV-EM 2.4 7.52
V. C ONCLUSION
In this work, we have proposed an innovative outlier-
insensitive KF that offers improved performance to tackle
the problem of state estimation in the presence of outliers.
Based on Bayesian learning concepts, we model the outlier
as NUV and estimate the unknown variance using either EM
or AM algorithms, resulting in sparse outlier detection. Both
algorithms are parameter-free and amount essentially to a
short iterative process during the update step of the KF. Our
numerical study demonstrates the effectiveness of our algo-
rithms and highlights the robustness and wide applicability in
addressing a variety of applications. We demonstrate superior
performances competing with other algorithms in terms of
MSE and RMSE across synthetic and real-world datasets.
These findings emphasize the robustness and accuracy of our
OIKF approach, making it especially suitable for systems
reliant on high-quality sensory data.
REFERENCES
[1] S. Truzman, G. Revach, N. Shlezinger, and I. Klein, “Outlier-Insensitive
Kalman Filtering Using NUV Priors,” IEEE International Conference on
Acoustics, Speech and Signal Processing (ICASSP) , pp. 1–5, 2023.
[2] J. Durbin and S. J. Koopman, Time Series Analysis by State Space
Methods. Oxford University Press, 05 2012.
[3] H. Zhu, K. Zou, Y . Li, and H. Leung, “Robust sensor fusion with heavy-
tailed noises,” Signal Process., vol. 175, p. 107659, 2020.
[4] Y . Yuan, Y . Wang, W. Gao, and F. Shen, “Vehicular Relative Positioning
With Measurement Outliers and GNSS Outages,” IEEE Sensors Journal,
vol. 23, no. 8, pp. 8556–8567, 2023.
[5] E. Navon and B. Bobrovsky, “An efficient outlier rejection technique for
kalman filters,” Signal Process., vol. 188, p. 108164, 2021.
[6] R. E. Kalman, “A New Approach to Linear Filtering and Prediction
Problems,” in Journal of Basic Engineering , 1960, vol. 82, pp. 35–45.
[7] P. J. H. Roncetti and E. M., Robust Statistics , 2nd ed. John Wiley &
Sons, 2009.
[8] S. Farahmand, G. B. Giannakis, and D. Angelosante, “Doubly Robust
Smoothing of Dynamical Processes via Outlier Sparsity Constraints,”
IEEE Transactions on Signal Processing , pp. 4529–4543, 2011.
9


## Page 10

[9] A. Y . Aravkin, J. V . Burke, and G. Pillonetto, “Sparse/Robust Estima-
tion and Kalman Smoothing with Nonsmooth Log-Concave Densities:
Modeling, Computation, and Theory,” J. Mach. Learn. Res. , vol. 14, pp.
2689–2728, 2013.
[10] J. A. Knight, N.L.;Wang, “A Comparison of Outlier Detection Proce-
dures and Robust Estimation Methods in GPS Positioning,” Journal of
Navigation, vol. 62, pp. 699–709, 2009.
[11] F. Zhu, Z. Hu, W. Liu, and X. Zhang, “Dual-Antenna GNSS Integrated
With MEMS for Reliable and Continuous Attitude Determination in
Challenged Environments,” IEEE Sensors Journal , vol. 19, no. 9, pp.
3449–3461, 2019.
[12] N. Ye and Q. Chen, “An anomaly detection technique based on a
chi-square statistic for detecting intrusions into information systems,”
Quality and Reliability Engineering International , pp. 105–112, 2001.
[13] A. Lekkas, M. Candeloro, and I. Schjølberg, “Outlier rejection in
underwater acoustic position measurements based on prediction errorr,”
4th IF AC Workshop on Navigation, Guidance and Control of Underwater
V ehicles, vol. 48, no. 2, pp. 82–87, 2015.
[14] F. Van Wyk, Y . Wang, A. Khojandi, and N. Masoud, “Real-time sensor
anomaly detection and identification in automated vehicles,” IEEE
Transactions on Intelligent Transportation Systems , vol. 21, no. 3, pp.
1264–1276, 2020.
[15] J. A. Ting, E. Theodorou, and S. Schaal, “A Kalman Filter for Robust
Outlier Detection,” IEEE International Conference on Intelligent Robots
and Systems , pp. 1514–1519, 2007.
[16] G. Agamennoni, J. I. Nieto, and E. M. Nebot, “An Outlier-Robust
Kalman Filter,” IEEE International Conference on Robotics and Au-
tomation, pp. 1551–1558, 2011.
[17] Y . Tao and S. S. T. Yau, “Outlier-Robust Iterative Extended Kalman
Filtering,” IEEE Signal Processing Letters , vol. 30, pp. 743–747, 2023.
[18] C. D. Karlgaard and H. Schaub, “Huber-based divided difference filter-
ing,” Journal of guidance, control, and dynamics , pp. 885–891, 2007.
[19] M. A. Gandhi and L. Mili, “Robust Kalman Filter Based on a Gen-
eralized Maximum-Likelihood-Type Estimator,” IEEE Transactions on
Signal Processing, vol. 58, no. 5, pp. 2509–2520, 2010.
[20] A. Aravkin, J. V . Burke, L. Ljung, A. Lozano, and G. Pillonetto, “Gen-
eralized Kalman Smoothing: Modeling and Algorithms,” Automatica,
vol. 86, no. 287381, pp. 63–86, 2017.
[21] G. Agamennoni, J. I. Nieto, and E. M. Nebot, “Approximate Inference
in State-Space Models with Heavy-Tailed Noise,” IEEE Transactions on
Signal Processing, vol. 60, no. 10, pp. 5024–5037, 2012.
[22] Y . Huang, Y . Zhang, N. Li, Z. Wu, and J. A. Chambers, “A Novel Robust
Student’s t-based Kalman Filter,” IEEE Transactions on Aerospace and
Electronic Systems, vol. 53, no. 3, pp. 1545–1554, 2017.
[23] G. Wang, Y . Zhang, and X. Wang, “Maximum Correntropy Rauch-Tung-
Striebel Smoother for Nonlinear and Non-Gaussian Systems,” IEEE
Trans. Autom. Control. , vol. 66, no. 3, pp. 1270–1277, 2021.
[24] B. Chen, X. Liu, H. Zhao, and J. C. Principe, “Maximum correntropy
Kalman filter,” Automatica, vol. 76, pp. 70–77, 2017.
[25] X. Liu, B. Chen, H. Zhao, J. Qin, and J. Cao, “Maximum correntropy
kalman filter with state constraints,” IEEE Access , vol. 5, pp. 25 846–
25 853, 2017.
[26] N. Davari and A. P. Aguiar, “Real-Time Outlier Detection Applied to
a Doppler Velocity Log Sensor Based on Hybrid Autoencoder and
Recurrent Neural Network,” IEEE Journal of Oceanic Engineering ,
vol. 46, no. 4, pp. 1288–1301, 2021.
[27] F. Wadehn, L. Bruderer, J. Dauwels, V . Sahdeva, H. Yu, and H.-A.
Loeliger, “Outlier-insensitive Kalman Smoothing and Marginal Message
Passing,” 24th European Signal Processing Conference (EUSIPCO) , pp.
1242–1246, 2016.
[28] M. E. Tipping, “Sparse Bayesian Learning and the Relevance Vector
Machine,” J. Mach. Learn. Res. , vol. 1, pp. 211–244, 2001.
[29] D. Wipf and B. Rao, “Sparse Bayesian Learning for Basis Selection,”
IEEE Transactions on Signal Processing , vol. 52, pp. 2153–2164, 2004.
[30] H.-A. Loeliger, L. Bruderer, H. Malmberg, F. Wadehn, and N. Zalmai,
“On Sparsity by NUV-EM, Gaussian Message Passing, and Kalman
Smoothing,” Information Theory and Applications Workshop (ITA) , pp.
1–10, 2016.
[31] H.-A. Loeliger, B. Ma, H. Malmberg, and F. Wadehn, “Factor Graphs
with NUV Priors and Iteratively Reweighted Descent for Sparse Least
Squares and More,”IEEE 10th International Symposium on Turbo Codes
& Iterative Information Processing (ISTC) , pp. 1–5, 2018.
[32] H.-A. Loeliger, “On NUV priors and Gaussian message passing,” IEEE
International Workshop on Machine Learning for Signal Processing
(MLSP), 2023.
[33] A. P. Dempster, N. M. Laird, and D. B. Rubin, “Maximum Likelihood
from Incomplete Data Via the EM Algorithm,” Journal of the Royal
Statistical Society: Series B , vol. 39, no. 1, pp. 1–22, 1977.
[34] J. A. Palmer, D. P. Wipf, K. Kreutz-Delgado, and B. D. Rao, “Variational
em algorithms for non-gaussian latent variable models,” in Advances in
neural information processing systems , 2005, pp. 1059–1066.
[35] V . S. A Andresen, “Convergence of an Alternating Maximization Pro-
cedure,” Journal of Machine Learning Research , vol. 17, 2016.
[36] N. Carlevaris-Bianco, A. K. Ushani, and R. M. Eustice, “University of
Michigan North Campus long-term vision and lidar dataset,” Interna-
tional Journal of Robotics Research , vol. 35, pp. 1023–1035, 2016.
[37] A. Shurin, A. Saraev, M. Yona, Y . Gutnik, S. Faber, A. Etzion, and
I. Klein, “The Autonomous Platforms Inertial Dataset,” IEEE Access ,
vol. 10, pp. 10 191–10 201, 2022.
[38] G. Revach, N. Shlezinger, X. Ni, A. L. Escoriza, R. J. G. van Sloun, and
Y . C. Eldar, “KalmanNet: Neural Network Aided Kalman Filtering for
Partially Known Dynamics,” IEEE Transactions on Signal Processing ,
vol. 70, pp. 1532–1547, 2022.
[39] G. Revach, X. Ni, N. Shlezinger, R. J. G. van Sloun, and Y . C. Eldar,
“RTSNet: Learning to Smooth in Partially Known State-Space Models,”
IEEE Transactions on Signal Processing , vol. 71, pp. 4441–4456, 2023.
[40] Y . Bar-Shalom, X. R. Li, and T. Kirubarajan, Estimation with applica-
tions to tracking and navigation: Theory algorithms and software . John
Wiley & Sons, 2004.
[41] H. Ohlsson, F. Gustafsson, L. Ljung, and S. P. Boyd, “Smoothed state
estimates under abrupt changes using sum-of-norms regularization,”
Autom., vol. 48, no. 4, pp. 595–605, 2012.
[42] B. Bell and F. Cathey, “The Iterated Kalman Filter Update as a Gauss-
Newton Method,” IEEE Transactions on Automatic Control , vol. 38,
no. 2, pp. 294–297, 1993.
[43] J. Humpherys, P. Redd, and J. M. West, “A Fresh Look at the Kalman
Filter,” SIAM Rev., vol. 54, no. 4, pp. 801–823, 2012.
[44] B. Ma, N. Zalmai, R. Torfason, C. Striti, and H.-A. Loeliger, “Color
image segmentation using iterative edge cutting, NUV-EM, and Gaussian
message passing,” IEEE Global Conference on Signal and Information
Processing (GlobalSIP), pp. 161–165, 2017.
[45] P. J. Rousseeuw and M. Hubert, “Robust Statistics for Outlier Detection,”
WIREs Data Mining Knowl. Discov. , vol. 1, no. 1, pp. 73–79, 2011.
[46] A. Shurin and I. Klein, “QuadNet: A Hybrid Framework for Quadrotor
Dead Reckoning,” Sensors, vol. 22, no. 4, p. 1426, 2022.
10
