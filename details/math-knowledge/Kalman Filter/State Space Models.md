# Approximate Methods for State-Space Models Shinsuke Koyama∗ Lucia Castellanos P´ erez-Bolde†

Converted from: `Kalman Filter\State Space Models.pdf`


## Page 1

arXiv:1004.3476v1  [stat.ME]  20 Apr 2010
Approximate Methods for State-Space Models
Shinsuke Koyama∗ Lucia Castellanos P´ erez-Bolde†
Cosma Rohilla Shalizi ‡ Robert E. Kass §
Abstract
State-space models provide an important body of techniques for an-
alyzing time-series, but their use requires estimating uno bserved states.
The optimal estimate of the state is its conditional expecta tion given
the observation histories, and computing this expectation is hard when
there are nonlinearities. Existing ﬁltering methods, incl uding sequential
Monte Carlo, tend to be either inaccurate or slow. In this pap er, we
study a nonlinear ﬁlter for nonlinear/non-Gaussian state- space models,
which uses Laplace’s method, an asymptotic series expansio n, to approxi-
mate the state’s conditional mean and variance, together wi th a Gaussian
conditional distribution. This Laplace-Gaussian ﬁlter (LGF) gives fast,
recursive, deterministic state estimates, with an error wh ich is set by the
stochastic characteristics of the model and is, we show, sta ble over time.
We illustrate the estimation ability of the LGF by applying i t to the prob-
lem of neural decoding and compare it to sequential Monte Car lo both in
simulations and with real data. We ﬁnd that the LGF can delive r superior
results in a small fraction of the computing time.
Keywords: Laplace’s method, recursive Bayesian estimation, neural de-
coding
1 Introduction
The central statistical problem in applying state-space models is th at of ﬁlter-
ing, i.e., estimating the unobserved state from the observations. For nonlinear
∗Postdoctoral fellow, Department of Statistics and Center f or the Neural Basis of Cog-
nition, Carnegie Mellon University, Pittsburgh, PA 15213 ( email: koyama@stat.cmu.edu).
Corresponding author.
†Graduate Student, Machine Learning Department and Center f or the Neural Basis of
Cognition, Carnegie Mellon University, Pittsburgh, PA 152 13 (email: lcastell@cs.cmu.edu).
‡Assistant Professor, Department of Statistics, Carnegie M ellon University, Pittsburgh,
PA 15213 (email: cshalizi@stat.cmu.edu), and External Fac ulty, Santa Fe Institute, Santa Fe,
NM 87501.
§Professor, Department of Statistics, Machine Learning Dep artment and Center for
the Neural Basis of Cognition, Carnegie Mellon University, Pittsburgh, PA 15213 (email:
kass@stat.cmu.edu).
1


## Page 2

or non-Gaussian models, considerable eﬀort has been devoted to d evising ap-
proximate solutions to the ﬁltering problem, based mainly on simulation meth-
ods such as particle ﬁltering and its variants (Kitagawa 1987; Kitaga wa 1996;
Doucet, de Freitas and Gordon 2001). In this article we study a det erministic
approximation based on sequential application of Laplace’s method w hich we
call the Laplace Gaussian ﬁlter (LGF), and we illustrate the approach in the
context of real-time neural decoding (Brockwell, Schwartz and Ka ss 2007; Eden,
Frank, Barbieri, Solo and Brown 2004; Serruya, Hatsopoulos, Pan inski, Fellows
and Donoghue 2002). In this context we ﬁnd the LGF to be far more accurate,
for equivalent computational cost, than particle ﬁltering.
Suppose we have a stochastic state process {xt}, t = 1 , 2, . . . and a related
observation process {yt}. Filtering consists of estimating the state xt given a
sequence of observations y1, y 2, . . . y t ≡ y1:t, i.e., ﬁnding the posterior distribu-
tion p(xt|y1:t) of the state, given the sequence. It is common to assume that
the state xt is a ﬁrst-order homogeneous Markov process, with initial density
p(x1) and transition density p(xt+1|xt), and that yt is independent of states
and observations at all other times given xt, with observation density p(yt|xt).
Bayes’s Rule gives a recursive ﬁltering formula,
p(xt|y1:t) = p(yt|xt)p(xt|y1:t− 1)∫
p(yt|xt)p(xt|y1:t− 1)dxt
, (1)
where
p(xt|y1:t− 1) =
∫
p(xt|xt− 1)p(xt− 1|y1:t− 1)dxt− 1 (2)
is the predictive distribution, which convolves the previous ﬁltered d istribution
with the transition density. In principle, Equations (1) and (2) give a complete,
recursive solution to the ﬁltering problem for state-space models: the mean-
squared optimal point estimate is simply the mean of the posterior de nsity
given by Equation (1). When the dynamics are nonlinear, non-Gauss ian, or
even just high-dimensional, however, computing these estimates s equentially
can be a major challenge.
One approach to Bayesian computation is to attempt to simulate fro m the
posterior distribution. Applying Monte Carlo simulation to Equations ( 1)–(2)
would let us draw from p(xt|y1:t), if we had p(xt|y1:t− 1). The insight of parti-
cle ﬁltering is that the latter distribution can itself be approximated b y Monte
Carlo simulation (Kitagawa 1996; Doucet et al. 2001). This turns the recursive
equations for the ﬁltering distribution into a stochastic dynamical s ystem of
interacting particles (Del Moral and Miclo 2000), each representin g one draw
from that posterior. While particle ﬁltering has proven itself to be us eful in
practice (Doucet et al. 2001; Brockwell, Rojas and Kass 2004; Erg ¨ un, Barbieri,
Eden, Wilson and Brown 2007), like any Monte Carlo scheme it can be co m-
putationally costly; moreover, the number of particles (and so the amount of
computation) needed for a given accuracy grows rapidly with the dim ensional-
ity of the state-space. For real-time processing, such as neural decoding, the
computational cost of eﬀective particle ﬁltering can quickly become prohibitive.
2


## Page 3

The primary diﬃculty with the nonlinear ﬁltering equations comes from
their integrals. We use Laplace’s method to obtain estimates of the m ean and
variance of the posterior density in Eq. (1), and then approximate that density
by a Gaussian with that mean and variance. This distribution is then re cursively
updated in its turn when the next observation is taken.
There are several versions of Laplace’s method, all of which replac e integrals
with series expansion around the maxima of integrands. An expansio n param-
eter, γ, measures the concentration of the integrand about its peak. In the
simplest version, the posterior distribution is replaced by a Gaussian centered
at the posterior mode. Under mild regularity conditions, this gives a ﬁ rst-order
approximation of posterior expectations, with error of order O(γ − 1). Several
papers have applied some form of ﬁrst-order Laplace approximatio n sequentially
(Brown, Frank, Tang, Quirk and Wilson 1998; Eden et al. 2004). In t he ordi-
nary static context, Tierney, Kass and Kadane (1989) analyzed t he way a reﬁned
procedure, the “fully exponential” Laplace approximation, gives a s econd-order
approximation for posterior expectations, having an error of ord er O(γ − 2). In
this paper we provide theoretical results justifying these approx imations in the
sequential context. Because state estimation proceeds recurs ively over time, it is
conceivable that the approximation error could accumulate, which w ould make
the approach ineﬀective. Our results show that, under reasonab le regularity
conditions, this does not happen: the posterior mean from the LGF approxi-
mates the true posterior mean with error O(γ − α) uniformly across time, where
α = 1 or 2 depending on the order of the LGF.
We specify the LGF in Section 2, and give our theoretical results in Se ction
3. Section 4 introduces the neural decoding problem and reports c omparative
results both in simulation studies and with real data. We provide addit ional
comments in Section 5. Proofs and implementation details are collecte d in the
appendix.1
2 The Laplace-Gaussian ﬁlter (LGF)
Throughout the paper, xt|t and vt|t denote the mode and variance of the true
ﬁltered distribution at time t given a sequence of observations y1:t, and simi-
larly xt|t− 1 and vt|t− 1 are those of the predictive distribution at time t given
y1:t− 1, respectively. Hats ˆ and tildes ˜ on variables indicate approximation s; in
particular, ˆx denotes the approximated posterior mode, and ˜x the approximated
posterior mean. The transpose of a matrix A is written AT . Bold type of a
small letter indicates a column vector.
2.1 Algorithm
The LGF procedure for a one-dimensional state is as follows. (The m ulti-
dimensional extension is straightforward; see below.)
1Appendices B–E appeared as a supplementary ﬁle in the journa l version.
3


## Page 4

1. At time t = 1, initialize the predictive distribution of the state, p(x1).
2. Observe yt.
3. (Filtering) Obtain the approximate posterior mean ˜ xt|t and variance ˜vt|t
by Laplace’s method (see below), and set ˆ p(xt|y1:t) to be a Gaussian dis-
tribution with the same mean and variance.
4. (Prediction) Calculate the predictive distribution,
ˆp(xt+1|y1:t) =
∫
p(xt+1|xt)ˆp(xt|y1:t)dxt. (3)
5. Increment t and go to step 2.
We consider ﬁrst- and second- order Laplace’s approximations. In the ﬁrst-
order Laplace approximation the posterior mean and variance are ˜ xt|t = ˆxt|t ≡
argmaxxt l(xt) and ˜vt|t = [− l′′(ˆxt|t)]− 1, where l(xt) = log p(yt|xt)ˆp(xt|y1:t− 1).
The second-order (fully exponential) Laplace approximation is calcu lated as
follows (Tierney et al. 1989). For a given positive function g of the state, let
k(xt) = log g(xt)p(yt|xt)ˆp(xt|y1:t− 1), and let ¯ xt|t maximize k. The posterior
expectation of g for the second order approximation is then
ˆE[g(xt)|y1:t] ≈ | − k′′(¯xt|t)|− 1
2 exp[k(¯xt|t)]
| − l′′(ˆxt|t)|− 1
2 exp[l(ˆxt|t)]
. (4)
When the g we care about is not necessarily positive, a simple and practical
trick is to add a large constant c to g so that g(x) + c > 0, apply Eq. (4), and
then subtract c. The posterior mean is thus calculated as ˜ xt|t = ˆE[xt + c] − c.
(In practice it suﬃces that the probability of the event {g(xt) + c > 0} is
close to one under the true distribution of xt. Allowing this to be merely very
probable rather than almost sure introduces additional approxima tion error,
which however can be made arbitrarily small simply by increasing the co nstant
c. See Tierney et al. (1989) for details.) The posterior variance is set to be
˜vt|t = [− l′′(ˆxt|t)]− 1, as this suﬃces for second-order accuracy (see Remark 1 in
Appendix A).
To use the LGF to estimate a state in d-dimensional space, one simply
takes the function g to be each coordinate in turn, i.e., g(xt) = xt,i + c for
each i = 1 , 2, . . . , d . Each g is a function of Rd → R, and | − l′′(ˆxt|t)|− 1
2 and
| − k′′(¯xt|t)|− 1
2 in Eq. (4) are replaced by the determinants of the Hessians of
l( ˆxt|t) and k( ¯xt|t), respectively. Thus, estimating the state with the second-
order LGF takes d times as long as using the ﬁrst-order LGF, since posterior
means of each component of xt must be calculated separately.
In many applications the state process is taken to be a linear Gaussia n
process (such as an autoregression or random walk) so that the in tegral in
Eq. (3) is analytic. When this integral is not done analytically, either t he
asymptotic expansion (23) or a numerical method may be employed. To apply
4


## Page 5

our theoretical results, the numerical error in the integration mu st be O(γ − α),
where γ is the expansion parameter, to be discussed in section 3.1, and α = 1
or 2 depending on the order of the LGF.
2.2 Smoothing
The LGF can also be used for smoothing. That is, given the observat ion up to
time T , y1:T , smoothed state distributions, p(xt|y1:T ), t ≤ T , can be calculated
from ﬁltered and predictive distributions by recursing backwards ( Anderson
and Moore 1979). Instead of the true ﬁltered and predictive distr ibutions,
however, we now have the approximated ﬁltered and predictive dist ributions
computed by the LGF. By using these approximated distributions, t he approx-
imated smoothed distributions can be obtained as
ˆp(xt|y1:T ) = ˆp(xt|y1:t)
∫ ˆp(xt+1|y1:T )p(xt+1|xt)
ˆp(xt+1|y1:t) dxt+1. (5)
We address the accuracy of LGF smoothing in Theorem 5.
2.3 Implementation
Two aspects of the numerical implementation of the LGF call for spe cial com-
ment: maximizing the likelihood and computing its second derivatives. O ne
key point is that the Hessian in Eq. (4) may be computed by careful n umeri-
cal diﬀerentiation. Avoiding analytical derivatives saves substant ial time when
ﬁtting many alternative models. See Appendix B for a brief descriptio n of our
numerical procedure for computing the Hessian matrix, and Kass ( 1987) for full
details.
The log-likelihood function can be maximized by an iterative algorithm (e .g.
Newton’s method), in which ˆ xt|t− 1 and ˆxt|t would be chosen as a reasonable
starting point for maximizing l(xt) and k(xt), respectively. The convergence
criterion also deserves some care. Writing x(i) for the value attained on the ith
step of the iteration, the iteration should be stopped when

x(i+1) − x(i)
 <
cγ − α, where c is a constant and γ is the expansion parameter, to be discussed
in section 3.1, and α is the order of the Laplace approximation. The value of c
should be smaller than that of γ (c = 1 is a reasonable choice in practice).
3 Theoretical Results
For simplicity, we state the results for the one dimensional case. Th e exten-
sion to the multi-dimensional case is notationally somewhat cumberso me but
conceptually straightforward. Let p and ˆp denote the true density of a random
variable and its approximation, and let h(xt) be
h(xt) = − 1
γ log p(yt|xt)p(xt|y1:t− 1), (6)
5


## Page 6

where γ is the expansion parameter, whose meaning will be explained later in
this section.
3.1 Regularity conditions
The following properties are the regularity conditions that are suﬃc ient for the
validity of Laplace’s method (Erd´ elyi 1956; Kass, Tierney and Kada ne 1990;
Wojdylo 2006).
(C.1) h(xt) is a constant-order function of γ as γ → ∞ , and is ﬁve-times
diﬀerentiable with respect to xt.
(C.2) h(xt) has an unique interior minimum, and its second derivative is posi-
tive (the Hessian matrix is positive deﬁnite for multi-dimensional case s)
(C.3) p(xt+1|xt) is four-times diﬀerentiable with respect to xt.
(C.4) The integral ∫
p(xt+1|xt) exp [− γh(xt)]dxt
exists and is ﬁnite.
We also assume the following condition which prohibits ill-behaved, “exp losive”
trajectories in state space:
(C.5) Derivatives of h(xt) up to ﬁfth-order and those of p(xt+1|xt) with respect
to xt up to third-order are bounded uniformly across time.
Strictly speaking, h(xt) is a random variable, taking values in the space of
integrable non-negative functions of R. This random variable is measurable with
respect to σ (y1:t). Therefore, the stated regularity conditions only need to hold
with probability 1 under the distribution of y1:t (Kass et al. 1990).
In the following section we will state the theorems that ensure that , under
conditions (C.1)–(C.5), the LGF does not accumulate error over tim e, but ﬁrst
we explain the meaning of the expansion parameter.
Meaning of γ As seen in Eq. (6) and the regularity condition (C.1), for a
given state-space model, γ is constructed by combing the model parameters so
that the log posterior density is scaled by γ as γ → ∞ . In general, γ would be
interpreted in terms of sample size, the concentration of the obse rvation density,
and the inverse of the noise in the state dynamics; we will describe ho w γ is
chosen for a neural decoding model in section 4. From the constru ction of γ,
the second derivative of the log posterior density, which determine s the concen-
tration of the posterior density, is also scaled by γ. Therefore, the larger γ is,
the more precisely variables can be estimated, and the more accura te Laplace’s
method becomes. When the concentration of the posterior densit y is not uni-
form across state-dimentions in a multidimensional case, a multidimen sional γ
could be taken. Without a loss of approximation accuracy, however , a sim-
ple implementation for this case is taking the largest γ as a single expansion
parameter.
6


## Page 7

3.2 Main theoretical results
Theorem 1 (accuracy of predictive distributions) Under the regularity con-
ditions (C.1)–(C.4), the α -order LGF approximates the predictive distribution
as
ˆp(xt|y1:t− 1) = p(xt|y1:t− 1) + O(γ − β),
for t ∈ N, where β = 1 for α = 1 and β = 2 for α ≥ 2. Furthermore, if condition
(C.5) holds, the error term is bounded uniformly across time .
The error bound can also be established for the posterior (ﬁltered ) expecta-
tions in the following theorem.
Theorem 2 (accuracy of posterior expectations) Under the regularity con-
ditions (C.1)–(C.4), the α -order LGF approximates the ﬁltered conditional ex-
pectation of a four-times diﬀerentiable function g(x),
ˆE[g(xt)|y1:t] = E[g(xt)|y1:t] + O(γ − β),
for t ∈ N, with β as in Theorem 1. Here E[·|y1:t] and ˆE[·|y1:t] denote the
expectation with respect to p(xt|y1:t) and ˆp(xt|y1:t), respectively. Furthermore,
if condition (C.5) holds, the error term is bounded uniforml y across time.
Note that the order of the error is γ − 2 even for α ≥ 2 both in Theorem 1 and
Theorem 2. That is, even if higher than the second-order Laplace a pproximation
in Step 3 of the LGF is employed, the resulting approximation error do es not
go beyond the second-order accuracy with respect to γ − 1. This fact leads to
the following corollary.
Corollary 3 The second-order approximation is the best achievable for t he LGF
scheme.
The following theorem refers to stability of the LGF. It states that minor
diﬀerences in the initially-guessed distribution of the state tend to b e reduced,
rather than ampliﬁed, by conditioning on further observations, ev en under the
Laplace’s approximation.
Theorem 4 (stability of the algorithm) Suppose that two approximated pre-
dictive distributions at time t satisfy
ˆp1(xt|y1:t− 1) − ˆp2(xt|y1:t− 1) = O(γ − ν ),
where ν > 0. Then, under the regularity conditions (C.1)-(C.4), apply ing the
LGF u(> 0) times leads to the diﬀerence of two approximated predictive distri-
butions at time t + u as
ˆp1(xt+u|y1:t+u− 1) − ˆp2(xt+u|y1:t+u− 1) = O(γ − ν− u).
7


## Page 8

Theorem 5 Under the regularity conditions (C.1)–(C.4), the expectat ion of a
four-times diﬀerentiable function g(x) with respect to the approximated smoothed
distribution Eq. (5) is given by
ˆE[g(xt)|y1:T ] = E[g(xt)|y1:T ] + O(γ − β),
for t = 1 , 2, . . . , T , with β as in Theorem 1. Furthermore, if condition (C.5) is
satisﬁed, the error term is bounded uniformly across time.
3.3 Computational cost
Assuming that the maximization of l(xt) and k(xt) is done by Newton’s method,
the time complexity of the LGF goes as follows. Let d be the number of di-
mensions of the state, T the number of time steps, and N be the sample size.
The bottleneck of the computational cost in the ﬁrst-order LGF c omes from
maximization of l(xt) at each time t. In each iteration of Newton’s method,
evaluation of the Hessian matrix of l(xt) typically costs O(N d2), as d2 is the
time complexity for matrix manipulation. Over T time steps, the time com-
plexity of the ﬁrst-order LGF is O(T N d2). In the second-order LGF, the time
complexity of calculating the posterior expectation of each xt,i is still O(N d2),
but calculating it for i = 1 , . . . , d results in O(N d3). Repeating over T time
steps, the complexity of the second-order LGF is O(T N d3).
For comparison, take the time complexity of a particle ﬁlter (PF) with M
particles. It is not hard to check that the computational cost acr oss time step
T of the particle ﬁlter is O(T M N d). For the computational cost of the particle
ﬁlter to be comparable with an LGF, the number of particles should be M =
O(d) for the ﬁrst-order LGF and M = O(d2) for the second-order LGF.
4 Application to neural decoding
The problem of neural decoding consists in using an organism’s neura l activ-
ity to draw inferences about the organism’s environment and its inte raction
therewith — sensory stimuli, bodily states, motor behaviors, etc. ( Rieke, War-
land, de Ruyter van Steveninck Rob and Bialek 1997). Scientiﬁcally, n eural
decoding is vital to studying neural information processing, as reﬂ ected by the
many proposed decoding techniques (Dayan and Abbott 2001). It s engineer-
ing importance comes from eﬀorts to design brain-machine interfac e devices,
especially neural motor prostheses (Schwartz 2004) such as com puter cursors,
robotic arms, etc. The brain-machine interface devices must dete rmine, from
real-time neural recordings, what motion the user desires the pro sthesis to have.
Such considerations have led to many proposals, emanating from Br own et al.
(1998), for neural decoding based on state-space models (Broc kwell et al. 2007).
In the rest of this section, we introduce a standard model setup f or neural
decoding tasks, and identify its Laplace expansion γ. We then simulate the
model and apply the LGF, conﬁrming the applicability of our theoretic al results,
8


## Page 9

and comparing its performance to particle ﬁltering. Finally, we apply t he model
and the LGF to experimental data.
4.1 Model setup
We consider the problem of decoding a “state process” from the ﬁr ing of an en-
semble of neurons. Here we suppose that neurons respond to a xt ∈ Rd, where d
is the number of dimensions. xt may be interpreted as two- or three-dimensional
hand kinematics for motor cortical decoding (Georgopoulos, Schw artz and Kettner
1986; Ketter, Schwartz and Georgopoulos 1988; Paninski, Fellows , Hatsopoulos
and Donoghue 2004), or hand posture (about 20 degrees of free dom) for dexter-
ous grasping control (Artemiadis, Shakhnarovich, Vargas-Irwin , Donoghue and
Black 2007). We consider N such neurons, and assume that the logarithm of the
ﬁring rate of neuron i is (Truccolo, Eden, Fellows, Donoghue and Brown 2005)
log λ i(xt) = α i + β i ·xt . (7)
We let yi,t be the spike count of neuron i at time-step t. We assume that yi,t
has a Poisson distribution with intensity λ i(xt)∆, where ∆ is the duration of
the short time-intervals over which spikes are counted at each time step. We
also assume that ﬁring of neurons is conditionally independent with ea ch other
given xt. Thus the probability distribution of yt, the vector of all the yi,t, is
the product of the ﬁring probabilities of each neuron. We assume th at the state
model is given by
xt = F xt− 1 + ǫt, (8)
where F ∈ Rd× d and ǫt is a d-dimensional Gaussian random variable with mean
zero and covariance matrix W ∈ Rd× d.
The expansion parameter γ for this model is identiﬁed as follows. The second
derivative of l(xt) = log p(yt|xt)ˆp(xt|y1:t− 1) is
l′′(xt) = − ∆
N∑
i=1
β iexp(α i + β i ·xt)β T
i − V − 1
t|t− 1,
where Vt|t− 1 is the covariance matrix of the predictive distribution at time t.
Then, from the Cauchy-Schwarz inequality,
∥l′′(xt)∥ ≤ ∆
N∑
i=1
exp(α i + β i ·xt)∥β i∥2 + ∥V − 1
t|t− 1∥.
Since ∥V − 1
t|t− 1∥ is scaled by ∥W − 1∥, we can identify the expansion parameter:
γ = ∆
N∑
i=1
eαi∥β i∥2 + ∥W − 1∥. (9)
We see that γ combines the number and the mean ﬁring rate of the neurons,
the sharpness of neuronal tuning curves and the noise in the stat e dynamics.
9


## Page 10

Given our assumptions, the observation model p(yt|xt) and the state tran-
sition density p(xt+1|xt) are strictly log-concave and have an unique interior
maximum in xt, and their derivatives up to ﬁfth-order are uniformly bounded
if the state is bounded. Furthermore, h(xt) is a constant-order function of γ
as γ → ∞ , which can be seen from the construction of γ. Thus, the regularity
conditions (C.1)–(C.5) are satisﬁed if the initial distribution satisﬁes them.
In what follows, we took the initial value for ﬁltering to be the true st ate
at t = 0. Note that when there is no information about the initial distribut ion,
we could use a “diﬀuse” prior density whose covariance is taken to be large
(Durbin and Koopman 2001). Either type of initial condition would sat isfy the
regularity conditions. We can thus construct LGFs according to se ction 2.
4.2 Simulation study
We performed numerical simulations to study ﬁrst and second-ord er LGF (la-
beled by LGF-1 and LGF-2, respectively) approximations under con ditions rel-
evant to the neural decoding problems we are working on. We also co mpared
LGF to particle ﬁltering. We judged performance by accuracy in com puting
the posterior mean (which was determined by particle ﬁltering with a v ery large
number of particles). However, the posterior mean contains stat istical inaccu-
racy (due to limited data). We also evaluated the accuracy with which the
several alternative methods approximate the underlying true sta te.
Simulation Setup In each simulation run, we generated a state trajectory
from a d-dimensional AR process, Eq. (8), with F = 0. 94I and W = 0. 019I, I
being the identity matrix, over T = 30 time-steps of duration ∆ = 0 . 03 seconds.
We examined diﬀerent number of state-dimensions, d = 6, 10, 20, 30. Regardless
of d, we observed neural activity due to the state through N = 100 neurons,
with α i = 2. 5 + N (0, 1) and β i uniformly distributed on the unit sphere in Rd.
Finally, the spike counts were drawn from Poisson distributions with t he ﬁring
rates λ i(xt) given by Eq. (7) above.
Methods To compare LGF state estimates to the posterior mean we ﬁrst
needed a high-accuracy evaluation of the posterior mean itself. We obtained this
by averaging results from ten independent realizations of particle ﬁ ltering with
106 particles; the resulting approximation error in the mean integrated squared
error (MISE) is O(10− 7), and so negligible for our purposes. We also applied
the particle ﬁlter (PF) for comparison. The number of particles in th e PF was
chosen by consideration of computational cost; as discussed in su bsection 3.3,
a LGF-1 is comparable in time complexity to a PF with O(d) particles, and a
LGF-2 is comparable to a PF with O(d2) particles. For the case of d ≤ 30, 100
particles (PF-100) was about the least number at which the PF was e ﬀective
and was not much more resource-intensive than the LGF-1. In ord er that the
computational time of a PF matchs that of the LGF-2, we chose 100 , 300, 500
and 1000 particles for d = 6, 10, 20 and 30, respectively. (We label it PF-scaled.)
See also Table 2.
10


## Page 11

We implemented all the algorithms in Matlab, and we ran them on Windows
computer with Pentium 4 CPU, 3.80GHz and 3.50GB of RAM.
Results The ﬁrst four rows in Table 1 show the four ﬁlters’ MISE in ap-
proximating the actual posterior mean. LGF-2 gives the best appr oximation,
followed by LGF-1; both are better than PF-100 and PF-scaled. No te that
LGF-1 is much faster than PF-100, and the computational time of L GF-2 is
approximately the same as that of PF-scaled (Table 2). Figure 1 disp lays the
MISE of particle ﬁlters in approximating the actual posterior mean a s a function
of the number of particles, for d = 6. PF needs on the order of 10 4 particles
to be as accurate as LGF-1, and about 10 6 particles to match LGF-2. Further-
more, since the computational time of the PF is proportional to the number
of particles, the time needed to decode by PF with 10 4 and 10 6 particles are
expected to be about 20s and 2,000s, respectively (from Table 2). Thus, if we
allow the LGFs and the PF to have the same accuracy, LGF-1 is about 1, 000
times faster than the PF, and LGF-2 is expected to be about 10 , 000 times faster
than the PF.
Table 1: MISEs for diﬀerent ﬁlters
Method Number of dimensions, d
6 10 20 30
LGF-2 0.0000008 0.000002 0.00001 0.00006
LGF-1 0.00003 0.00004 0.0001 0.0002
PF-100 0.006 0.01 0.03 0.04
PF-scaled 0.006 0.007 0.01 0.02
posterior 0.03 0.04 0.06 0.07
NOTE: The ﬁrst four rows give the discrepancy between four appr oximate ﬁlters
and the optimal ﬁlter (approximation error). The ﬁfth row gives th e MISE
between the true state and the estimate of the optimal ﬁlter, i.e., t he actual
posterior mean (statistical error). All values are means from 10 in dependent
replicates. The simulation standard errors are all smaller than the le ading digits
in the table.
The value of γ for this state-space model is γ ≈ 100 (Eq. (9)). From Theorem
2, the MISEs of LGF-1 and LGF-2 are, respectively, evaluated as c2
1γ − 2 and
c2
2γ − 4, where c1 and c2 are constants depending on the model parameters. If c1
and c2 were in the range 1 to 10, then the MISEs of LGF-1 and LGF-2 should
be 10 − 4 to 10 − 6, roughly matching the simulation results.
The ﬁfth row of Table 1 shows the MISE between the true state and the
actual posterior mean. The error in using the optimal ﬁlter, i.e., the actual
posterior mean, to estimate the true state is statistical error, in herent in the
system’s stochastic characteristics, and not due to the approxim ations. The
statistical error is an order of magnitude larger than the approxim ation error
11


## Page 12

Table 2: Time (seconds) needed to decode
Method Number of dimensions, d
6 10 20 30
LGF-2 0.24 0.43 1.0 2.0
LGF-1 0.018 0.024 0.032 0.056
PF-100 0.18 0.18 0.18 0.19
PF-scaled 0.18 0.50 0.81 1.8
NOTE: All values are means from 10 independent replicates. The simu lation
standard errors are all smaller than the leading digits in the table.
102 103 104 105 10610
−7
10
−6
10
−5
10
−4
10
−3
10
−2
Number of particles
MISE

PF
LGF1
LGF2
Figure 1: Scaling of the MISE for particle ﬁlters. The solid line represe nts the
MISE (vertical axis) of the particle ﬁlter as a function of the numbe r of particles
(horizontal axis). Error here is with respect to the actual poste rior expectation
(optimal ﬁlter). The dashed and dotted horizontal lines represen t the MISEs
for the ﬁrst- and second-order LGF, respectively.
12


## Page 13

in the LGFs, so that increasing the accuracy with which the posterio r expec-
tation is approximated does little to improve the estimation of the sta te. The
approximation error in the PFs, however, becomes on the same ord er as the
statistical error when the state dimension is larger ( d = 20 or 30). In such cases
the inaccuracy of the PF will produce comparatively inaccurate est imates of the
true state.
Finally, we examined how the choice of initial prior density aﬀects the ﬁ l-
tering result. Figure 2 shows ﬁve estimated trajectories started with diﬀerent
initial values. These ﬁve trajectories converged to the same stat e as the time
evolves, as expected from Theorem 4.
0 5 10 15 20 25 30
−0.6
−0.4
−0.2
0
0.2
0.4
0.6
0.8
Time
State
Figure 2: The solid lines represent the estimated trajectories with ﬁ ve diﬀerent
initial values by LGF-1. The dashed line represents the true state t rajectory.
4.3 Real data analysis
Experiment setting and data collection We used LGF to estimate the
hand motion from neural activity. A multi-electrode array was implan ted in the
motor cortex of a monkey to record neural activity following proce dures similar
to those described previously in Velliste, Perel, Spalding, Whitford an d Schwartz
(2008). In all, 78 distinct neurons were recorded simultaneously. R aw voltage
waveforms were thresholded and spikes were sorted to isolate the activity of
individual cells. A monkey in this experiment was presented with a virtu al 3-D
space, containing a cursor which was controlled by the subject’s ha nd position,
and eight possible targets which were located on the corners of a cu be. The task
was to move the cursor to a highlighted target from the middle of the cube; the
monkey received a reward upon successful completion. In our dat a each trial
consisted of time series of spike-counts from the recorded neuro ns, along with
the recorded hand positions, and hand velocities found by taking diﬀ erences
in hand position at successive ∆ = 0 . 03s intervals. Each trial contained 23
time-steps on average. Our data set consisted of 104 such trials.
13


## Page 14

Methods For decoding, we used the same state-space model as in our simu-
lation study. Many neurons in the motor cortex ﬁre preferentially in response
to the velocity vt ∈ R3 and the position zt ∈ R3 of the hand (Wang, Chan,
Heldman and Moran 2007). We thus took the state xt to be a 6-dimensional
concatenated vector xt = (zt, vt). The state model was taken to be
xt =
(
I ∆I
O I
)
xt− 1 +
(
0
ǫt
)
, (10)
where ǫt is a 3-D Gaussian random variable with mean zero and covariance
matrix σ 2I, I being the identity matrix. 16 trials consisting of 2 presentations
of each of the 8 targets, were reserved for estimating the param eters of the
model. The parameters in the ﬁring rate, α i and β i, were estimated by Poisson
regression of spike counts on cursor position and velocity, and the value of
σ 2 was determined via maximum likelihood. The time-lag between the hand
movement and each neural activity was also estimated from the sam e training
data. This was done by ﬁtting a model over diﬀerent values of time-la g ranging
from 0 to 3∆s. The estimated optimal time-lag was the value at which t he
model had the highest R2. Having estimated all the parameters, cursor motions
were reconstructed from spike trains for the other 88 trials, and it is on these
trials we focused. For comparison, we also reconstructed the cur sor motion
with a PF-100 and a widely-used population vector algorithm (PV A) (D ayan
and Abbott 2001, pp. 97–101) (see also Appendix D).
Results Figure 3 compares MISEs for diﬀerent algorithms in estimating the
true cursor position. Figure 3 (a) compares the MISE of LGF-1 with that of
LGF-2. Just like in the simulation study, there is no substantial diﬀer ence
between them since the statistical error is larger than the LGFs’ a pproximation
errors. Figure 3 (b) compares LGF-1 to PF-100: the former estim ates the true
cursor position better than the latter in most trials. Also (Table 2), LGF-1 is
much faster than PF-100. Figure 3 (c) shows that the numerical e rror in the
PF-100 is of the same order as the error resulting from using PV A. ( Plots of the
true and reconstructed cursor trajectories are shown in Appen dix E.)
5 Discussion
In this paper we have shown that, under suitable regularity conditio ns, the
error of the LGF does not accumulate across time. In the context of a neural
decoding example we found the LGF to be much more accurate than t he particle
ﬁlter with the same computational cost: in our simulation study the ﬁ rst-order
and second-order LGFs had MISE of about 1/200 to 1/7,500 the siz e of the
particle ﬁlter. We also found that for 6-dimensional case, about 10 ,000 particles
were required in order for the particle ﬁltering to become competitiv e with the
ﬁrst-order LGF; and the second-order LGF remained as accurat e as the particle
ﬁlter with 1,000,000 particles. In many situations (such as some neur al decoding
14


## Page 15

0 0.5 1 1.5
x 10
−3
0
0.5
1
1.5
x 10
−3
LGF2
LGF1
0 0.5 1 1.5
x 10
−3
0
0.5
1
1.5
2
2.5
x 10
−3
LGF1
PF100
0 0.5 1 1.5 2 2.5
x 10
−3
0
0.5
1
1.5
2
2.5
x 10
−3
PF100
PVA
(a) (c)(b)
Figure 3: Algorithm comparisons. The horizontal and vertical axes represent
the MISE of diﬀerent algorithms in estimating the true cursor positio n. Each
point compares two diﬀerent algorithms for a trial. Overall, 4 algorith ms (LGF-
1, LGF-2, PF-100 and PV A) were compared for 88 trials. (a) LGF-2 vs. LGF-1,
(b) LGF-1 vs. PF-100, and (c) PF-100 vs. PV A.
applications), implementation needs to be easy so that repeated re ﬁnements in
modeling assumptions may be carried out quickly. With this in mind, it migh t
be argued that the simplicity of the particle ﬁlter gives it some advant ages.
We have, however, noted how numerical methods may be used to su pply the
necessary second-derivative matrices (see Appendix B, and Kass (1987)), and
these, together with maximization algorithms, make it as easy to mod ify the
LGF for new variations on models as it is to modify the particle ﬁlter. No r
does the use of the LGF interfere with diagnostic tests and model-a dequacy
checks, such as the time-rescaling theorem for point processes ( Brown, Barbieri,
Ventura, Kass and Frank 2002). The obvious conclusion is that the LGF is
likely to be preferable to the particle ﬁlter in applications where the po sterior
in Eq. (1) becomes concentrated.
We should note that the validity of the LGF is guaranteed only when th e
posterior distribution is uni-modal and has a log-concave property . On the
other hand, the particle ﬁlter is a distribution-free method and can be used in
a multi-modal case.
It is perhaps worth emphasizing the distinction between the LGF and other
alternatives to the Kalman ﬁlter. The simplest non-linear ﬁlter, the extended
Kalman ﬁlter (EKF) (Ahmed 1998), linearizes the state dynamics and the ob-
servation function around the current state estimate ˆ x, assuming Gaussian dis-
tributions for both. The error thus depends on the strength of t he quadratic
nonlinearities and the accuracy of preceding estimates, and so error can accu-
mulate dramatically. The LGF makes no linear approximations—every ﬁ ltering
step is a (generally simple) nonlinear optimization—nor does it need to a pprox-
imate either the state dynamics or the observation noise as Gaussia ns.
In our simulation studies, the second-order LGF was always more (in some
15


## Page 16

cases much more) than 20 times as accurate as the ﬁrst-order LG F in approx-
imating the posterior, but this translated into only small gains in deco ding
accuracy. The reason is simply that the inherent statistical error of the poste-
rior itself was much larger than the numerical error of the ﬁrst-or der LGF in
approximating the posterior. We would expect this to be the case qu ite gener-
ally. Thus, our work may be seen as supporting the use of the ﬁrst- order LGF,
as applied to neural decoding in Brown et al. (1998).
Finally, an interesting idea is to use a sequential approximation to the
posterior based on some well-behaved and low-dimensional paramet ric family,
and to apply sequential simulation based on that family. The Gaussian could
again be used (e.g., (Azimi-Sadjadi and Krishnaprasad 2005; Brigo, Hanzon and
LeGland 1995; Erg¨ un et al. 2007)), and our results would provide n ew theoret-
ical justiﬁcation for such procedures. However, it is well-known th at Gaussian
distributions, with their very thin tails, are poorly suited for importa nce sam-
pling, so that heavier-tailed alternatives often work better (e.g., ( Evans and
Swartz 1995)). Sequential simulation schemes with approximating G aussians
replaced by multivariate t, or other heavy-tailed distributions, may be worth
exploring.
Acknowledgment
This work was supported by grants RO1 MH064537, RO1 EB005847 a nd RO1
NS050256.
16


## Page 17

APPENDIX A. Proofs of theorems
We begin by proving a lemma and a proposition needed for the main theo rems.
To simplify notation we introduce the symbols h(l)
t ≡ ∂ lh(xt)/∂x l
t|xt=xt|t and
q(l)(xt+1) ≡ ∂ lp(xt+1|xt)/∂x l
t|xt=xt|t .
Lemma 6 Let ˆh(xt) be
ˆ
h(xt) = − 1
γ log p(yt|xt)ˆp(xt|y1:t− 1) , (11)
ˆh(l)
t ≡ ∂ l
xt
ˆh(ˆxt|t), and ˆxt|t the minimizer of ˆh(xt). Then, under the regular-
ity conditions, the order- α Laplace approximation of the posterior mean and
variance have series expansions as
˜xt|t =
α− 1∑
j=0
Aj ({ˆh(l)
t })γ − j , (12)
and
˜vt|t =
α− 1∑
j=1
Bj({ˆh(l)
t })γ − j , (13)
where the coeﬃcients, Aj and Bj, are functions of {ˆh(l)
t }.
Proof (Lemma 6) The expectation of a function g(xt) with respect to the
approximated posterior distribution is
ˆE[g(xt)|y1:t] =
∫
g(xt) exp [− γˆ
h(xt)]dxt
∫ exp [− γˆ
h(xt)]dxt
, (14)
where g(xt) = xt for the mean and g(xt) = x2
t for the second moment. We get
the coeﬃcients Aj and Bj by applying Laplace’s method, an (inﬁnite) asymp-
totic expansion of a Laplace-type integral (Theorem 1.1 in (Wojdylo 2006); see
Appendix C for a brief summary), to both the numerator and the de nominator
of Eq. (14); those formulae also show that the coeﬃcients are fun ctions of {ˆh(l)
t },
l = 1, 2, . . . .. For example, the coeﬃcients of up to ﬁrst-order terms are obta ined
as A0({ˆh(l)
t }) = ˆxt|t, A1({ˆh(l)
t }) = − ˆh′′′
t / (2(ˆh′′
t )
2
), and B1({ˆh(l)
t }) = ( ˆh′′
t )− 1. ✷
Remark 1 Lemma 6 guarantees that the choice of ˜ xt|t = ˆxt|t and ˜vt|t =
(γˆ
h′′
t )− 1 provides the ﬁrst-order approximation of posterior mean and var iance.
As proved in Tierney et al. (1989), Eq. (4) achieves the second-or der expansion of
the posterior mean ˜xt|t = ˆxt|t + A1({ˆh(l)
t })γ − 1. Thus Eq. (4) and ˜vt|t = (γˆ
h′′
t )− 1
provide the second-order approximation.
17


## Page 18

Proposition 7 Suppose that the regularity conditions (C.1)–(C.4) hold, a nd
that the approximated predictive distribution of time t satisﬁes
ˆp(xt|y1:t− 1) = p(xt|y1:t− 1) +
N∑
j=ν
Et,j(xt)γ − j + O(γ − N − 1), (15)
where Et,j(xt) is a constant-order function of γ and 0 < ν < N for ν, N ∈ N.
Replacing the ﬁltered distribution at time t with a Gaussian with α -order Laplace
approximated mean and variance leads to the approximate pre dictive distribution
at time t + 1,
ˆp(xt+1|y1:t) = p(xt+1|y1:t)+
N∑
j=β
E ∗
t+1,j(xt+1)γ − j+
N∑
j=ν
Et+1,j+1(xt+1)γ − j− 1+O(γ − N − 1),
(16)
where β = 1 for α = 1 and β = 2 for α ≥ 2. Here E ∗
t+1,j(xt+1) does not depend
on {Et,k(xt)}k=ν,ν+1,... and
Et+1,j+1(xt+1) = q′(xt+1)
h′′
t
∂
∂x t
( Et,j(xt)
p(xt|y1:t− 1)
) ⏐
⏐
⏐
⏐
⏐
xt=xt|t
+ O(γ − 1), (17)
for j = ν, ν + 1 , . . . , N . Furthermore, if the condition (C.5) is satisﬁed, the
coeﬃcients of the expansion terms in Eq. (16) are bounded uni formly across
time.
Proof (Proposition 7) The proof works by comparing the asymptotic ex-
pansions of the true and approximated predictive distributions. To do this, we
must ﬁnd those asymptotic expansions; once this is done the remain ing steps
are fairly straightforward.
(i) We begin by evaluating the true predictive distribution at time t + 1.
From Eqs. (1) and (2), this is
p(xt+1|y1:t) =
∫ p(xt+1|xt) exp [− γh(xt)]dxt
∫
exp [− γh(xt)]dxt
.
Applying Laplace’s method (Theorem 1.1 in (Wojdylo 2006), see also Ap pendix
C) to both the numerator and the denominator of above equation le ads to
p(xt+1|y1:t) =
∑N
s=0 Γ(s + 1
2 )( 2
h′′
t
)sc∗
2sγ − s + O(γ − N − 1)
∑N
s=0 Γ(s + 1
2 )( 2
h′′
t
)s¯c∗
2sγ − s + O(γ − N − 1)
, (18)
where
c∗
s =
s∑
i=0
qs− i(xt+1)
(s − i)!
i∑
j=0
(
− s+1
2
j
)
Ci,j(A1, . . . ) , (19)
18


## Page 19

and
¯c∗
s =
s∑
j=0
(
− s+1
2
j
)
Cs,j(A1, . . . ) . (20)
Here Cs,j(A1, . . . ) is a partial ordinary Bell polynomial, which is the coeﬃcient
of xi in the formal expansion of ( A1x + A2x2 + · · ·)j, and Ai ≡ Ai({h(l)
t }) is
the coeﬃcient which appeared in Lemma 6. Expanding with respect to γ − 1, we
obtain the asymptotic expansion of p(xt+1|y1:t) as
p(xt+1|y1:t) = q(xt+1) +
N∑
j=1
Cj(xt+1)γ − j + O(γ − N − 1) , (21)
where q(xt+1) was earlier deﬁned as p(xt+1|xt), and where Cj(xt+1) depends
on q(k)(xt+1) and h(l)
t (k, l = 1 , 2, . . . ). Cj(xt+1) is directly calculated by Eqs.
(18)–(20).
(ii) We next consider the approximated predictive distribution of time t + 1,
ˆp(xt+1|y1:t) =
∫
p(xt+1|xt)ˆp(xt|y1:t)dxt , (22)
where ˆp(xt|y1:t) is the Gaussian distribution whose mean and variance are given
by Eq. (12) and (13), respectively. Eq. (22) can be re-written as
ˆp(xt+1|y1:t) = 1√2π ˜vt|t
∫
p(xt+1|xt) exp
[
− (xt − ˜xt|t)2
2˜vt|t
]
dxt.
Applying Laplace’s method again,
ˆp(xt+1|y1:t) = ˜q(xt+1) +
N∑
j=1
˜q(2j)(xt+1)
2jΓ(j + 1) ˜vj
t|t + O(˜v− N − 1
t|t ), (23)
where Γ( j + 1) is the Gamma function and
˜q(l)
t ≡ ∂ lp(xt+1|xt)
∂x t
⏐
⏐
⏐
⏐
xt=˜xt|t
. (24)
Now we compare Eqs. (23) and (21), via a series of substitutions. W e want
to re-write Eq. (23) with q(k)(xt+1) and h(l)
t . Substituting Eq. (15) into Eq.
(11),
ˆh(xt) = − 1
γ log p(yt|xt)
[
p(xt|y1:t− 1) +
N∑
j=ν
Et,j(xt)γ − j + O(γ − N − 1)
]
= h(xt) −
N∑
j=ν
Ft,j(xt)γ − j− 1 + O(γ − N − 2), (25)
19


## Page 20

where
Ft,j(xt) = Et,j(xt)
p(xt|y1:t− 1) + O(γ − ν).
is a collection of terms which depend on Et,j(xt).
Suppose ˆxt|t = xt|t + ǫ and ǫ ≪ 1. Taking the derivative both sides of Eq.
(25) and evaluating it at xt|t, we obtain
ǫ =
N∑
j=ν
F ′
t,j
h′′
t
γ − j− 1 + O(γ − N − 2).
Then we get
ˆxt|t = xt|t +
N∑
j=ν
F ′
t,j
h′′
t
γ − j− 1 + O(γ − N − 2). (26)
Inserting Eq. (26) into Eq. (25) gives
ˆh(l)
t = h(l)
t −
N∑
j=ν
[
F (l)
t,j − F ′
t,jh(l+1)
t
h′′
t
]
γ − j− 1 + O(γ − N − 2). (27)
Substituting Eq. (26) and Eq. (27) into Eq. (12) leads to
˜xt|t = xt|t +
α− 1∑
j=1
Aj γ − j +
N∑
j=ν
F ′
t,j
h′′
t
γ − j− 1 + O(γ − N − 2). (28)
Inserting Eq. (28) into Eq. (24) and expanding with respect to γ − 1,
˜q(l)(xt+1) = q(l)(xt+1) +
α− 1∑
j=1
Aj q(l+1)(xt+1)γ − j +
α∑
j=2
[ j∑
k=2
1
k! q(l+k)(xt+1)Cj,k(A1, . . . )
]
γ − j
+
N∑
j=ν
F ′
t,j
h′′
t
q(l+1)(xt+1)γ − j− 1 + O(γ − α− 1). (29)
Substituting Eqs. (13), (27) and (29) into Eq. (23), we obtain the ﬁnal
asymptotic expansion of ˆp(xt+1|y1:t),
ˆp(xt+1|y1:t) = (30)
q(xt+1) +
α∑
j=1
Rj(xt+1)γ − j +
N − 1∑
j=ν
F ′
t,j
h′′
t
q′(xt+1)γ − j− 1 + O(γ − α− 1) ,
in which
Rj(xt+1) =
{
Gj(xt+1) + Ajq′(xt+1) 1 ≤ j ≤ α − 1
Gj(xt+1) j = α
20


## Page 21

and
Gj(xt+1) =
j∑
s=2
1
s! Cj,s(A1, . . . )q(s)(xt+1) +
j∑
s=1
Cj,s(B1, . . . )q(2s)(xt+1)
2sΓ(s + 1)
+
j− 1∑
s=1
j− 1∑
k=s
Aj− kCk,s(B1, . . . )q(2s+1)(xt+1)
2sΓ(s + 1)
+
j− 2∑
s=1
j− 2∑
k=s
j− k∑
n=2
Cj− k,n(A1, . . . )Ck,s(B1, . . . )q(2s+n)(xt+1)
2sΓ(s + 1)n! ,
where Bj ≡ Bj({h(l)
t }) appeared in Lemma 6.
(iii) Now we compare Eqs. (21) and (30). The coeﬃcients, up to seco nd
order terms, in the former are
C1(xt+1) = q′′(xt+1)
2h′′
t
− h′′′
t q′(xt+1)
2(h′′
t )2 , (31)
and
C2(xt+1) = q(4)(xt+1)
8(h′′
t )2 − 5h′′′
t q′′′(xt+1)
12(h′′
t )3 +
[ 5(h′′′
t )2
8(h′′
t )4 − h(4)
t
4(h′′
t )3
]
q′′(xt+1)
+
[ 2h′′′
t h(4)
t
3(h′′
t )4 − 5(h′′′
t )3
8(h′′
t )5 − h(5)
t
8(h′′
t )3
]
q′(xt+1). (32)
For the ﬁrst-order Laplace approximation ( α = 1), the coeﬃcient of order
γ − 1 in Eq. (30) is
R1(xt+1) = q′′(xt+1)
2h′′
t
, (33)
which does not correspond to C1(xt+1), and hence Eq. (16) holds.
For α ≥ 2, R1(xt+1) is as
R1(xt+1) = q′′(xt+1)
2h′′
t
− h′′′
t q′(xt+1)
2(h′′
t )2 , (34)
which corresponds to C1(xt+1), and the ﬁrst-order error term in Eq. (16) is
canceled.
The second-order error term in Eq. (30) is calculated as
R2(xt+1) = q(4)(xt+1)
8(h′′
t )2 − h′′′
t q′′′(xt+1)
4(h′′
t )3 +
[ 5(h′′′
t )2
8(h′′
t )4 − h(4)
t
4(h′′
t )3
]
q′′(xt+1), (35)
for α = 2, and
R2(xt+1) = q(4)(xt+1)
8(h′′
t )2 − h′′′
t q′′′(xt+1)
4(h′′
t )3 +
[ 5(h′′′
t )2
8(h′′
t )4 − h(4)
t
4(h′′
t )3
]
q′′(xt+1)
+
[ 2h′′′h(4)
t
3(h′′
t )4 − 5(h′′′
t )3
8(h′′
t )5 − h(5)
t
8(h′′
t )3
]
q′(xt+1), (36)
21


## Page 22

for α ≥ 3. Thus R2(xt+1) ̸= C2(xt+1) and second-order error term in Eq. (16)
remains for α ≥ 2.
From (31)–(36), the leading error term introduced by the Gaussia n approx-
imation is
E ∗
t+1,1(xt+1) = R1(xt+1) − C1(xt+1) = h′′′
t q′(xt+1)
2(h′′
t )2
for α = 1, and
E ∗
t+1,2(xt+1) = R2(xt+1) − C2(xt+1)
= h′′′
t q′′′(xt+1)
6(h′′
t )3 −
[ 2h′′′
t h(4)
t
3(h′′
t )4 − 5(h′′′
t )3
8(h′′
t )5 − h(5)
t
8(h′′
t )3
]
q′(xt+1)
for α = 2, and
E ∗
t+1,2(xt+1) = R2(xt+1) − C2(xt+1) = h′′′
t q′′′(xt+1)
6(h′′
t )3
for α ≥ 3. Thus if the condition (C.5) is satisﬁed, the leading error term is
bounded uniformly across time. We can conﬁrm in the same way that t he other
error terms are also bounded uniformly. ✷
There are two sources of error in Eq. (16): ﬁrst, that due to the replacement
of the true ﬁltered distribution at time t by a Gaussian, ∑N
j=β E ∗
t+1,j(xt+1)γ − j,
and, second, that due to propagation from time t, ∑N − 1
j=ν Et+1,j+1(xt+1)γ − j− 1.
At each step, the Gaussian approximation introduces an O(γ − β) error into
the predictive distribution, where β = 1 for α = 1 and β = 2 for α ≥ 2.
However, the errors propagated from the previous time-step “m ove up” one
order of magnitude (power of γ). Applying Eq. (17) repeatedly, we ﬁnd that the
leading error term, E ∗
t,β(xt)γ − β, which is generated at time-step t, is propagated,
by a strictly later time-step u, to be Eu,u− t+β(xu)γ − (u− t+β) where
Eu,u− t+β(xu) = q′(xu)
u− 1∏
k=t+1
[ 1
h′′
k
∂
∂x k
( q′(xk)
p(xk|y1:k− 1)
) ⏐
⏐
⏐
⏐
xk=xk|k
]
×
[ 1
h′′
t
∂
∂x t
( E ∗
t,β(xt)
p(xt|y1:t− 1)
) ⏐
⏐
⏐
⏐
xt=xt|t
]
.
The compounded error in time-step u is then given by the summation of the
propagated errors from t = 1 to u − 1 as
Su =
u− 1∑
t=1
Eu,u− t+β(xu)γ − (u− t+β) < C − β
u− 1∑
t=1
(Cγ − 1)(u− t+β),
where the inequality holds under the condition (C.5), C < γ is a constant which
is independent of time t. The right hand side in this equation converge on
22


## Page 23

O(γ − β− 1) as u → ∞ , so that the compounded error after inﬁnite time-step
remains O(γ − β− 1). The result is that the whole error term in the predictive
distribution becomes O(γ − β), even if it started out smaller, but it does not grow
beyond that order. Theorem 1 is then proved from Proposition 7 imm ediately:
Proof (Theorem 1) The LGFs start with an initial predictive distribution
which does not involve any errors. Thus, from Proposition 7 it is prov ed induc-
tively that the error in the approximated predictive distribution is O(γ − β) and
uniformly bounded for t ∈ N. ✷
Proof (Theorem 2) (Sketch) Since the predictive distribution,
p(xt+1|y1:t) =
∫
p(xt+1|xt)p(xt|y1:t)dxt
is the posterior expectation of p(xt+1|xt) with respect to xt, Theorem 2 is proved
in the same way as Theorem 1 (replacing p(xt+1|xt) by g(xt) in the proof of
Theorem 1). ✷
Proof (Theorem 4) From Proposition 7, the two predictive distributions at
time t are given by
ˆp1(xt|y1:t− 1) = p(xt|y1:t− 1) +
N∑
j=ν
E (1)
t,j (xt)γ − j + O(γ − N − 1),
and
ˆp2(xt|y1:t− 1) = p(xt|y1:t− 1) +
N∑
j=ν
E (2)
t,j (xt)γ − j + O(γ − N − 1),
where E (1)
t,j (xt) ̸= E (2)
t,j (xt). Applying the LGF to both predictive distributions
introduces the same errors at time t + 1, ∑N
j=β E ∗
t+1,j(xt+1)γ − j, which are can-
celed, while propagated errors from time-step t to t + 1 in both predictive dis-
tributions, ∑N − 1
j=ν E (1)
t+1,j+1(xt+1)γ − j− 1 and ∑N − 1
j=ν E (2)
t+1,j+1(xt+1)γ − j− 1 are not
canceled. Then we get ˆ p1(xt+1|y1:t) − ˆp2(xt+1|y1:t) = O(γ − ν− 1). Applying this
procedure u times completes the theorem. ✷
Proof (Theorem 5) Assume that the expectation at time t + 1 satisﬁes
ˆE[g(xt+1)|y1:T ] = E[g(xt+1)|y1:T ] + O(γ − β). (37)
From Theorem 1 and Eq. (37), we obtain
∫ ˆp(xt+1|y1:T )p(xt+1|xt)
ˆp(xt+1|y1:t) dxt+1 =
∫ p(xt+1|y1:T )p(xt+1|xt)
p(xt+1|y1:t) dxt+1 + O(γ − β).
23


## Page 24

Using Theorem 2, the expectation at time t is
ˆE[g(xt)|y1:T ] =
∫
g(xt)ˆp(xt|y1:t)
∫ p(xt+1|y1:T )p(xt+1|xt)
p(xt+1|y1:t) dxt+1dxt + O(γ − β)
=
∫
g(xt)p(xt|y1:t)
∫ p(xt+1|y1:T )p(xt+1|xt)
p(xt+1|y1:t) dxt+1dxt + O(γ − β)
= E[g(xt)|y1:T ] + O(γ − β).
The initial smoothed distribution of the backward recursion is given b y the ﬁl-
tered distribution ˆp(xT |y1:T ), which satisﬁes ˆE[xT |y1:T ] = E[xT |y1:T ] + O(γ − β)
by theorem 2. Then, the theorem is proved inductively. ✷
APPENDIX B. Numerical Computation for sec-
ond derivatives
We describe the numerical algorithm for computing the Hessian matr ix, as
promised in Section 2.3.
The Laplace approximation requires the second derivative (or the H essian
matrix) of the log-likelihood function evaluated at its maximum. Howev er, it is
often diﬃcult, and even more often tedious, to get correct analyt ical derivatives
of the log-likelihood function. In such cases accurate numerical co mputations of
the derivative may be used, as follows. Consider calculating the seco nd deriva-
tive of l(x) at x0 for the one-dimensional case. For n = 0 , 1, 2, . . . and c > 1,
deﬁne the second central diﬀerence quotient,
An,0 = [l(x0 + c− nh0) + l(x0 − c− nh0) − 2l(x0)]/ (c− nh0)2,
and then for k = 1, 2, . . . , n compute
An,k = An,k− 1 + An,k− 1 − An− 1,k− 1
c2(k+1) − 1 . (38)
When the value of |An,k − An− 1,k| is suﬃciently small, An,k+1 is used for the
second derivative.
This algorithm is an iterated version of the second central diﬀerenc e formula,
often called Richardson extrapolation, producing an approximation with an error
of order O(h2(k+1)) (Dahlquist and Bjorck 1974).
In the d-dimensional case of a second-derivative approximation at a max-
imum, Kass (1987) proposed an eﬃcient numerical routine which red uces the
computation of the Hessian matrix to a series of one-dimensional se cond-derivative
calculations. The trick is to apply the second-diﬀerence quotient to suitably-
deﬁned functions f of a single variable s as follows.
1. Initialize the increment h = (h1, . . . , h d).
2. Find the maximum of l(x), and call it ˆx.
24


## Page 25

3. Get all unmixed second derivatives for each i = 1 to d, using the function
xi = ˆ xi + s
xj = ˆ xj for j not equal to i
f (s) = l(x(s)).
Compute the second diﬀerence quotient; then repeat and extrap olate until
the diﬀerence in successive approximations meets a relative error c riterion,
as in (38); store as diagonal elements of the Hessian matrix array, l′′
i,i =
f ′′(0).
4. Similarly, get all the mixed second derivatives. For each i = 1 to d, for
each j = i + 1 to d, using the function
xi = ˆ xi + s/
√
l′′
i,i
xj = ˆ xj + s/
√
l′′
j,j
xk = ˆ xk for k not equal to i or j
f (s) = l(x(s)).
Compute the second diﬀerence quotient; then repeat and extrap olate until
diﬀerence in successive approximations is less than relative error cr iterion
as in (38); store as oﬀ-diagonal elements of the Hessian matrix arr ay,
l′′
i,i = (f ′′(0)/ 2 − 1)
√
l′′
i,il′′
j,j.
In practice, the increment for computing the Hessian at time t would be
taken to be hi = 0. 1 ×
√
v(i,i)
t|t− 1, i = 1, 2, . . . , d , where v(i,i)
t|t− 1 is the ( i, i )-element
of the covariance matrix of the predictive distribution at time t.
APPENDIX C. Laplace’s Method
Here, we brieﬂy describe Laplace’s method, especially the details use d in the
proofs of Lemma 6 and Proposition 7.
We consider the following integral,
I(γ) =
∫
g(x)e− γh(x)dx, (39)
where x ∈ R; γ, the expansion parameter, is a large positive real number;
h(x) and g(x) are independent of γ (or very weakly dependent on γ); and the
interval of integration can be ﬁnite or inﬁnite. Laplace’s method app roximates
I(γ) as a series expansion in descending powers of γ. There is a computationally
eﬃcient method to compute the coeﬃcients in this inﬁnite asymptotic expansion
(Theorem 1.1 in (Wojdylo 2006)). Suppose that h(x) has an interior minimum
25


## Page 26

at x0, and h(x) and g(x) are assumed to be expandable in a neighborhood of
x0 in series of ascending powers of x. Thus, as x → x0,
h(x) ∼ h(x0) +
∞∑
s=0
as(x − x0)s+2,
and
g(x) ∼
∞∑
s=0
bs(x − x0)s,
in which a0, b 0 ̸= 0.
Let us introduce two dimensionless sets of quantities, Ai ≡ ai/a 0 and Bi ≡
bi/b 0, as well as the constants α 1 = 1/a 1/2
0 and c0 = b0/a 1/2
0 . Then the integral
in 39) can be asymptotically expanded as
I(γ) ∼ c0e− γh(x0)
∞∑
s=0
Γ(s + 1
2 )α 2s
1 c∗
2sγ − s− 1
2 ,
where
c∗
s =
s∑
i=0
Bs− i
i∑
j=0
(
− s+1
2
j
)
Ci,j(A1, . . . ) ,
where Ci,j(A1, . . . ) is a partial ordinary Bell polynomial, the coeﬃcient of xi in
the formal expansion of ( A1x + A2x2 + · · ·)j. Ci,j(A1, . . . ) can be computed by
the following recursive formula,
Ci,j(A1, . . . ) =
i− 1∑
m=j− 1
Ai− mCm,j− 1(A1, . . . ) ,
for 1 ≥ j ≥ i. Note that C0,0(A1, . . . ) = 1, and Ci,0(A1, . . . ) = C0,j(A1, . . . ) = 0
for all i, j > 0.
APPENDIX D. The Population Vector Algorithm
The population vector algorithm (PV A) is a standard method for neural de-
coding, especially for directionally-sensitive neurons like the motor- cortical cells
recorded from in the experiments we analyze (Dayan and Abbott 20 01, pp.
97–101). Brieﬂy, the idea is that each neuron i, 1 ≤ i ≤ N , has a preferred mo-
tion vector θi, and the expected spiking rate λ i varies with the inner product
between this vector and the actual motion vector x(t),
λ i(t) − ri
Λi
= x(t) ·θi , (40)
where ri is a baseline ﬁring rate for neuron i, and Λ i a maximum ﬁring rate.
((40) corresponds to a cosine tuning curve.) If one observes yi(t), the actual
26


## Page 27

neuronal counts over some time-window ∆, then averaging over ne urons and
inverting gives the population vector
xpop(t) =
N∑
i=1
y(t) − ri∆
Λi∆ θi ,
which the PV A uses as an estimate of x(t). If preferred vectors θi are uniformly
distributed, then xpop converges on a vector parallel to x as N → ∞ , and is
in that sense unbiased (Dayan and Abbott 2001, p. 101). If prefe rred vectors
are not uniform, however, then in general the population vector g ives a biased
estimate.
APPENDIX E. Real data analysis
Figure 4 shows trajectories of the true and estimated (by LGF, PF -100 and
PV A) cursor position of the real data analysis. It is seen that the L GF provides
better estimation than either the PF-100 or the PV A.
27


## Page 28

0 0.2 0.4
0
0.02
0.04
0.06
0 0.2 0.4
−0.02
0
0.02
0.04
0.06
0 0.2 0.4
−0.04
−0.02
0
0.02
0.04
0 0.1 0.2 0.3
−0.02
−0.01
0
0.01
0.02
0.03
0 0.1 0.2 0.3
−0.06
−0.04
−0.02
0
0.02
0 0.1 0.2 0.3
0
0.01
0.02
0.03
0.04
0 0.2 0.4 0.6
−0.02
0
0.02
0.04
0.06
0.08
0 0.2 0.4 0.6
−0.08
−0.06
−0.04
−0.02
0
0.02
0 0.2 0.4 0.6
−0.02
0
0.02
0.04
0 0.1 0.2 0.3
−0.01
0
0.01
0.02
0.03
0.04
0 0.1 0.2 0.3
−0.02
0
0.02
0.04
0.06
0 0.1 0.2 0.3
−0.03
−0.02
−0.01
0
0.01
0 0.1 0.2 0.3 0.4
−0.04
−0.03
−0.02
−0.01
0
0.01
0 0.1 0.2 0.3 0.4
−0.02
0
0.02
0.04
0 0.1 0.2 0.3 0.4
−0.02
0
0.02
0.04
0.06
True LGF1 PF100 PVA
x position y position z position
time [s]
Figure 4: The trajectories of the cursor position. “True”: actua l trajectory.
“LGF1”: trajectories estimated by ﬁrst-order LGF, respective ly. “PF100”: tra-
jectory estimated by the particle ﬁlter with 100 particles. “PV A”: t rajectory
estimated by the population vector algorithm. The trajectories es timated by
the LGF2 are not shown; they are similar to those estimated by the L GF1.
28


## Page 29

References
Ahmed, N. U. (1998), Linear and Nonlinear Filtering for Scientists and Engi-
neers, Singapore: World Scientiﬁc.
Anderson, B. D., and Moore, J. B. (1979), Optimal ﬁltering , New Jersey:
Prentice-Hall.
Artemiadis, P. K., Shakhnarovich, G., Vargas-Irwin, C., Donoghue, J. P., and
Black, M. J. (2007), Decoding grasp aperture from motor-cortic al popula-
tion activity,, in Proceedings of the 3rd international IEEE EMBS confer-
ence on Neural engineering , pp. 518–521.
Azimi-Sadjadi, B., and Krishnaprasad, P. S. (2005), “Approximate Nonlinear
Filtering and Its Applications in Navigation,” Automatica, 41, 945–956.
Brigo, D., Hanzon, B., and LeGland, F. (1995), A diﬀerential geomet ric ap-
proach to nonlinear ﬁltering: The projection ﬁlter,, in Proceedings of the
34th IEEE conference on decision and control , pp. 4006–4011.
Brockwell, A. E., Rojas, A. L., and Kass, R. E. (2004), “Recursive B ayesian
Decoding of Motor Cortical Signals by Particle Filtering,” Journal of Neu-
rophysiology, 91, 1899–1907.
Brockwell, A. E., Schwartz, A. B., and Kass, R. E. (2007), “Statist ical signal
processing and the motor cortex,” Proceeding of the IEEE , 95, 882–898.
Brown, E. N., Barbieri, R., Ventura, V., Kass, R. E., and Frank, L. M. (2002),
“The Time-Rescaling Theorem and Its Applications to Neural Spike Tr ain
Data Analysis,” Neural Computation , 14.
Brown, E. N., Frank, L. M., Tang, D., Quirk, M. C., and Wilson, M. A. (19 98),
“A statistical paradigm for neural spike train decoding applied to po sition
prediction from ensemble ﬁring patterns of rat hippocampal place c ells,”
Journal of Neuroscience , 18, 7411–7425.
Dahlquist, G., and Bjorck, A. (1974), Numerial Methods , New Jersey, Prentice
Hall: Englewood.
Dayan, P., and Abbott, L. F. (2001), Theoretical Neuroscience, Cambridge,
Massachusetts: MIT Press.
Del Moral, P., and Miclo, L. (2000), Branching and Interacting Part icle Sys-
tems Approximations of Feynman-Kac Formulae with Applications to N on-
Linear Filtering,, in Semainaire de Probabilites XXXIV , eds. J. Azema,
M. Emery, M. Ledoux, and M. Yor, Springer-Verlag, Berlin, pp. 1–1 45.
Doucet, A., de Freitas, N., and Gordon, N., eds (2001), Sequential Monte Carlo
Methods in Practice , Berlin: Springer-Verlag.
29


## Page 30

Durbin, J., and Koopman, S. J. (2001), Time Series Analysis by State Space
Models, Oxford: Oxford University Press.
Eden, U. T., Frank, L. M., Barbieri, R., Solo, V., and Brown, E. N. (200 4),
“Dynamic analyses of neural encoding by point process adaptive ﬁlt ering,”
Neural Computation , 16, 971–998.
Erd´ elyi, A. (1956),Asymptotic Expansions , New York: Dover.
Erg¨ un, A., Barbieri, R., Eden, U., Wilson, M. A., and Brown, E. N. (200 7),
“Construction of point process adaptive ﬁlter algorithms for neur al systems
using sequential Monte Carlo methods,” IEEE Transactions on Biomedical
Engineering, 54, 419–428.
Evans, M., and Swartz, T. (1995), “Methods for approximating int egrals in
statistics with special emphasis on Bayesian integration problems,” Statis-
tical Science, 10, 254–272.
Georgopoulos, A. B., Schwartz, A. B., and Kettner, R. E. (1986), “Neural pop-
ulation coding of movement direction,” Science, 233, 1416–1419.
Kass, R. E. (1987), “Computing observed information by ﬁnite diﬀe rences,”
Communication in Statistics: Simulation and Computation , 2, 587–599.
Kass, R. E., Tierney, L., and Kadane, J. B. (1990), “The validity of p osterior
expectations based on Laplace’s method,” in Essays in Honor of George
Bernard, eds. S. Geisser, J. S. Hodges, S. J. Press, and A. Zellner, North -
Holland: Elsevier Science Publishers.
Ketter, R. E., Schwartz, A. B., and Georgopoulos, A. P. (1988), “ Primate motor
cortex and free arm movements to visual targets in three-dimens ional space.
III. Positional gradients and population coding of movement direct ion from
various movement origins,” Journal of Neuroscience , 8, 2938–2947.
Kitagawa, G. (1987), “Non-Gaussian state-space modeling of non stationary time
series,” Journal of the American Statistical Association , 82, 1032–1063.
Kitagawa, G. (1996), “Monte Carlo ﬁlter and smoother for non-Ga ussian nonlin-
ear state space models,” Journal of Computational and Graphical Statistics ,
5, 1–25.
Paninski, L., Fellows, M. R., Hatsopoulos, N. G., and Donoghue, J. P. ( 2004),
“Spatiotemporal tuning of motor cortical neurons for hand posit ion and
velocity,” Journal of Neurophysiology , 91, 515–532.
Rieke, F., Warland, D., de Ruyter van Steveninck Rob, and Bialek, W. ( 1997),
Spikes: Exploring the Neural Code , Cambridge, Massachusetts: MIT Press.
Schwartz, A. B. (2004), “Cortical Neural Prosthetics,” Annual Review of Neu-
roscience, 27, 487–507.
30


## Page 31

Serruya, M. D., Hatsopoulos, N. G., Paninski, L., Fellows, M. R., and Do noghue,
J. P. (2002), “Brain-machine interface: Instant neural contro l of a move-
ment signal,” Nature, 416, 141–142.
Tierney, L., Kass, R. E., and Kadane, J. B. (1989), “Fully Exponent ial Laplace
Approximations to Expectations and Variances of Nonpositive Func tions,”
Journal of the American Statistical Association , 84, 710–716.
Truccolo, W., Eden, U., Fellows, M., Donoghue, J., and Brown, E. (200 5), “A
Point Process Framework for Relating Neural Spiking Activity to Spik -
ing History, Neural Ensemble and Extrinsic Covariate Eﬀects,” Journal of
Neurophysiology, 93, 1074–1089.
Velliste, M., Perel, S., Spalding, M. C., Whitford, A. S., and Schwartz, A . B.
(2008), “Cortical control of a prosthetic arm for self-feeding,” Nature,
doi:10.1038/nature06996.
Wang, W., Chan, S. S., Heldman, D. A., and Moran, D. W. (2007), “Mot or Cor-
tical Representation of Position and Velocity During Reaching,” Journal
of Neurophysiology, 97, 4258–4270.
Wojdylo, J. (2006), “On the coeﬃcients that arise from Laplace’s m ethod,”
Journal of Computational and Applied Mathematics , 196.
31
