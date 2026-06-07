# Kalman Filtering with Intermittent Observations

Converted from: `Kalman Filter\Intermittent Kalman Observations.pdf`


## Page 1

1
Kalman Filtering with Intermittent
Observations
Bruno Sinopoli, Luca Schenato, Massimo Franceschetti,
Kameshwar Poolla, Michael I. Jordan, Shankar S. Sastry
Department of Electrical Engineering and Computer Sciences
University of California at Berkeley
{sinopoli, massimof, lusche, sastry }@eecs.berkeley.edu
poolla@me.berkeley.edu, jordan@cs.berkeley.edu
Abstract
Motivated by navigation and tracking applications within sensor networks, we consider the prob-
lem of performing Kalman ﬁltering with intermittent observations. When data travel along unreliable
communication channels in a large, wireless, multi-hop sensor network, the effect of communication
delays and loss of information in the control loop cannot be neglected. We address this problem starting
from the discrete Kalman ﬁltering formulation, and modelling the arrival of the observation as a random
process. We study the statistical convergence properties of the estimation error covariance, showing the
existence of a critical value for the arrival rate of the observations, beyond which a transition to an
unbounded state error covariance occurs. We also give upper and lower bounds on this expected state
error covariance.
This research is partially supported by DARPA under grant F33615-01-C-1895.
DRAFT


## Page 2

2
I. I NTRODUCTION
Advances in VLSI and MEMS technology have boosted the development of micro sensor
integrated systems. Such systems combine computing, storage, radio technology, and energy
source on a single chip [1] [2]. When distributed over a wide area, networks of sensors can
perform a variety of tasks that range from environmental monitoring and military surveillance,
to navigation and control of a moving vehicle [3] [4] [5]. A common feature of these systems
is the presence of signiﬁcant communication delays and data loss across the network. From the
point of view of control theory, signiﬁcant delay is equivalent to loss, as data needs to arrive
to its destination in time to be used for control. In short, communication and control become
tightly coupled such that the two issues cannot be addressed independently.
Consider, for example, the problem of navigating a vehicle based on the estimate from a sensor
web of its current position and velocity. The measurements underlying this estimate can be lost
or delayed due to the unreliability of the wireless links. What is the amount of data loss that the
control loop can tolerate to reliably perform the navigation task? Can communication protocols be
designed to satisfy this constraint? At Berkeley, we have faced these kind of questions in building
sensor networks for pursuit evasion games. Practical advances in the design of these systems
are described in [6]. The goal of this paper is to examine some control-theoretic implications of
using sensor networks for control. These require a generalization of classical control techniques
that explicitly take into account the stochastic nature of the communication channel.
In our setting, the sensor network provides observed data that are used to estimate the state of a
controlled system, and this estimate is then used for control. We study the effect of data losses due
to the unreliability of the network links. We generalize the most ubiquitous recursive estimation
technique in control—the discrete Kalman ﬁlter [7]—modelling the arrival of an observation
as a random process whose parameters are related to the characteristics of the communication
channel, see Figure 1. We characterize the statistical convergence of the expected estimation
error covariance in this setting.
The classical theory relies on several assumptions that guarantee convergence of the Kalman
ﬁlter. Consider the following discrete time linear dynamical system:
xt+1 = Axt + wt
yt = Cx t + vt, (1)
DRAFT


## Page 3

3
M
z
-1
M
z
-1
+
+
+
-
Fig. 1. Overview of the system. We study the statistical convergence of the expected estimation error covariance of the discrete
Kalman ﬁlter, where the observation, travelling over an unreliable communication channel, can be lost at each time step with
probability 1 − λ.
where xt ∈ ℜ n is the state vector, yt ∈ ℜ m the output vector, wt ∈ ℜ p and vt ∈ ℜ m are Gaussian
random vectors with zero mean and covariance matrices Q ≥ 0 and R > 0, respectively. wt
is independent of ws for s < t . Assume that the initial state, x0, is also a Gaussian vector of
zero mean and covariance Σ0. Under the hypothesis of stabilizability of the pair (A, Q) and
detectability of the pair (A, C), the estimation error covariance of the Kalman ﬁlter converges
to a unique value from any initial condition [8].
These assumptions have been relaxed in various ways [8]. Extended Kalman ﬁltering attempts
to cope with nonlinearities in the model; particle ﬁltering is also appropriate for nonlinear
models, and additionally does not require the noise model to be Gaussian. Recently, more
general observation processes have been studied. In particular, in [9], [10] the case in which
observations are randomly spaced in time according to a Poisson process has been studied, where
the underlying dynamics evolve in continuous time. These authors showed the existence of a
lower bound on the arrival rate of the observations below which it is possible to maintain the
estimation error covariance below a ﬁxed value, with high probability. The results were restricted
to scalar SISO systems.
DRAFT


## Page 4

4
We approach a similar problem within the framework of discrete time, and provide results
for general n-dimensional MIMO systems. In particular, we consider a discrete-time system in
which the arrival of an observation is a Bernoulli process with parameter 0 < λ < 1, and,
rather than asking for the estimation error covariance to be bounded with high probability, we
study the asymptotic behavior (in time) of its average. Our main contribution is to show that,
depending on the eigenvalues of the matrix A, and on the structure of the matrix C, there exists
a critical value λc, such that if the probability of arrival of an observation at time t is λ > λ c,
then the expectation of the estimation error covariance is always ﬁnite (provided that the usual
stabilizability and detectability hypotheses are satisﬁed). If λ ≤ λc, then the expectation of the
estimation error covariance tends to inﬁnity. We give explicit upper and lower bounds on λc,
and show that they are tight in some special cases.
Philosophically this result can be seen as another manifestation of the well known uncertainty
threshold principle [11], [12]. This principle states that optimum long-range control of a dynam-
ical system with uncertain parameters is possible if and only if the uncertainty does not exceed
a given threshold. The uncertainty is modelled as white noise scalar sequences acting on the
system and control matrices. In our case, the result applies to optimal estimation, rather than
optimal control, and the uncertainty is due to the random arrival of the observation, with the
randomness arising from losses in the network.
We can also relate our approach to the theory of jump linear systems [13]. Jump linear
systems (JLS) are stochastic hybrid systems characterized by linear dynamics and discrete regime
transitions modelled as Markov chains. In the work of Nilsson et al. [14], [15] the Kalman ﬁlter
with missing observations is modelled as a JLS switching between two discrete regimes: an open
loop conﬁguration and a closed loop one. Within this framework these authors obtain a critical
loss probability for the divergence of the expected estimation error covariance. However, their
JLS formulation is restricted to the steady state Kalman Filter, where the Kalman gain is constant.
The resulting process is wide sense stationary [16], and this makes the exact computation of the
transition probability and state error covariance possible. Instead, we consider the general case
of time-varying Kalman gain, where jump linear systems theory cannot be directly applied. We
also show that the resulting ﬁlter can tolerate a higher dropping rate than the one obtained with a
stationary ﬁlter modeled with the JLS approach. In fact, the time-varying Kalman ﬁlter is optimal,
in the sense that it minimizes the state error covariance, unlike its steady state counterpart.
DRAFT


## Page 5

5
Considering tracking applications in cluttered environments, Fortmann et al. [17] also study the
case of a dynamic Kalman ﬁlter with missing or false observations, deriving stochastic equations
for the state covariance error. They do not, however, characterize its convergence statistically,
providing only numerical evidence of the transition to instability, and leaving a formal charac-
terization of this transition as an open problem—a characterization which is provided in this
paper.
Finally, we point out that our problem can also be viewed from the perspective of the
Expectation-Maximization (EM) algorithm. EM provides a general framework for ﬁnding maxi-
mum likelihood estimates in missing-data models [18]. The state-space model underlying Kalman
ﬁltering is an instance of a missing-data model, and the E step of the EM algorithm coincides
with Kalman ﬁltering and smoothing in this case [19]. More generally, a wide variety of gen-
eralizations of state-space models can be uniﬁed under the framework of probabilistic graphical
models, and Lauritzen [20] shows how to derive EM algorithms for general graphical models.
Our case, however, lies beyond Lauritzen’s framework, in that the graph structure is a function
of the missing data—there is one graph for each pattern of missing data. More fundamentally,
EM provides a framework for computing a posteriori parameter estimates; it does not provide
the a priori bounds on the state covariance error that are our focus here.
The paper is organized as follows. In section II we formalize the problem of Kalman ﬁltering
with intermittent observations. In section III we provide upper and lower bounds on the expected
estimation error covariance of the Kalman ﬁlter, and ﬁnd the conditions on the observation arrival
probability λ for which the upper bound converges to a ﬁxed point, and for which the lower
bound diverges. Section IV describes some special cases and provides an intuitive understanding
of the results. In section V we compare our approach to previous approaches [14] based on jump
linear systems. Finally, in section VI, we state our conclusions and give directions for future
work.
II. P ROBLEM FORMULATION
Consider the canonical state estimation problem. We deﬁne the arrival of the observation at
time t as a binary random variable γt, with probability distribution pγt(1) = λ, and with γt
independent of γs if t ̸= s. The output noise vt is deﬁned in the following way:
DRAFT


## Page 6

6
p(vt|γt) =



N (0, R) : γt = 1
N (0, σ2I) : γt = 0,
for some σ2 . Therefore, the variance of the observation at time t is R if γt is 1, and σ2I
otherwise. In reality the absence of observation corresponds to the limiting case of σ → ∞. Our
approach is to re-derive the Kalman ﬁlter equations using a “dummy” observation with a given
variance when the real observation does not arrive, and then take the limit as σ → ∞.
First let us deﬁne:
ˆxt|t
∆
= E[xt|yt, γt] (2)
Pt|t
∆
= E[(xt − ˆx)(xt − ˆx)′|yt, γt] (3)
ˆxt+1|t
∆
= E[xt+1|yt, γt+1] (4)
Pt+1|t
∆
= E[(xt+1 − ˆxt+1)(xt+1 − ˆxt+1)′|yt, γt+1] (5)
ˆyt+1|t
∆
= E[yt+1|yt, γt+1], (6)
where we have deﬁned the vectors yt
∆
= [y0, . . . , yt]′ and γt
∆
= [γ0, . . . , γt]′. Using the Dirac delta
δ(·) we have:
E[(yt+1 − ˆyt+1|t)(xt+1 − ˆxt+1|t)′|yt, γt+1] = CP t+1|t (7)
E[(yt+1 − ˆyt+1|t)(yt+1 − ˆyt+1|t)′|yt, γt+1] = CP t+1|tC ′ + δ(γt+1 − 1)R + δ(γt+1)σ2I, (8)
and it follows that the random variables xt+1 and yt+1, conditioned on the output yt and on the
arrivals γt+1, are jointly gaussian with mean
E[xt+1, yt+1|yt, γt+1] =

 ˆxt+1|t
C ˆxt+1|t

 ,
and covariance
COV (xt+1, yt+1|yt, γt+1) =

 Pt+1|t Pt+1|tC ′
CP t+1|t CP t+1|tC ′ + δ(γt+1 − 1)R + δ(γt+1)σ2I

 . (9)
Hence, the Kalman ﬁlter equations are modiﬁed as follows:
ˆxt+1|t = Aˆxt|t (10)
Pt+1|t = APt|tA′ + Q (11)
ˆxt+1|t+1 = ˆ xt+1|t + Pt+1|tC ′(CP t+1|tC ′ + δ(γt+1 − 1)R + δ(γt+1)σ2I)−1(yt+1 − C ˆxt+1|t) (12)
Pt+1|t+1 = Pt+1|t − Pt+1|tC ′(CP t+1|tC ′ + δ(γt+1 − 1)R + δ(γt+1)σ2I)−1CP t+1|t. (13)
DRAFT


## Page 7

7
Taking the limit as σ → ∞, the update equations (12) and (13) can be rewritten as follows:
ˆxt+1|t+1 = ˆ xt+1|t + γt+1Pt+1|tC ′(CP t+1|tC ′ + R)−1(yt+1 − C ˆxt+1|t) (14)
Pt+1|t+1 = Pt+1|t − γt+1Pt+1|tC ′(CP t+1|tC ′ + R)−1CP t+1|t. (15)
Note that performing this limit corresponds exactly to propagating the previous state when
there is no observation update available at time t. We also point out the main difference from
the standard Kalman ﬁlter formulation: Both ˆxt+1|t+1 and Pt+1|t+1 are now random variables,
being a function of γt+1, which is itself random.
Given the new formulation, we now study the Riccati equation of the state error covariance
matrix in this generalized setting and provide deterministic upper and lower bounds on its
expectation. We then characterize the convergence of these upper and lower bounds, as a function
of the arrival probability λ of the observation.
III. C ONVERGENCE CONDITIONS AND TRANSITION TO INSTABILITY
It is easy to verify that the modiﬁed Kalman ﬁlter formulation in Equations (11) and (15) can
be rewritten as follows:
Pt+1 = APtA′ + Q − γt APtC ′(CP tC ′ + R)−1CP tA′, (16)
where we use the simpliﬁed notation Pt = Pt|t−1. Since the sequence {γt}∞
0 is random, the
modiﬁed Kalman ﬁlter iteration is stochastic and cannot be determined off-line. Therefore, only
statistical properties can be deduced. In this section we show the existence of a critical value
λc for the arrival probability of the observation update, such that for λ > λ c the mean state
covarianceE[Pt] is bounded for all initial conditions, and for λ ≤ λc the mean state covariance
diverges for some initial condition. We also ﬁnd a lower bound λ, and upper bound λ, for the
critical probability λc, i.e., λ ≤ λc ≤ λ. The lower bound is expressed in closed form; the upper
bound is the solution of a linear matrix inequality (LMI). In some special cases the two bounds
coincide, giving a tight estimate. Finally, we present numerical algorithms to compute a lower
bound ¯S, and upper bound ¯V , for limt→∞E[Pt], when it is bounded.
First, we deﬁne the modiﬁed algebraic Riccati equation (MARE) for the Kalman ﬁlter with
intermittent observations as follows,
gλ(X) = AXA ′ + Q − λ AXC ′(CXC ′ + R)−1CXA ′. (17)
DRAFT


## Page 8

8
Our results derive from two principal facts: the ﬁrst is that concavity of the modiﬁed algebraic
Riccati equation for our ﬁlter with intermittent observations allows use of Jensen’s inequality to
ﬁnd an upper bound on the mean state covariance; the second is that all the operators we use to
estimate upper and lower bounds are monotonically increasing, therefore if a ﬁxed point exists,
it is also stable.
We formally state all main results in form of theorems. Omitted proofs appear in the Appendix.
The ﬁrst theorem expresses convergence properties of the MARE.
Theorem 1. Consider the operator φ(K, X) = (1 − λ)(AXA ′ + Q) + λ(F XF ′ + V ), where
F = A + KC , V = Q + KRK ′. Suppose there exists a matrix ˜K and a positive deﬁnite matrix
˜P such that
˜P > 0 and ˜P > φ ( ˜K, ˜P )
Then,
(a) for any initial condition P0 ≥ 0, the MARE converges, and the limit is independent of
the initial condition:
lim
t→∞
Pt = lim
t→∞
gt
λ(P0) = P
(b) P is the unique positive semideﬁnite ﬁxed point of the MARE.
The next theorem states the existence of a sharp transition.
Theorem 2. If (A, Q
1
2 ) is controllable, (A, C) is detectable, and A is unstable, then there exists
a λc ∈ [0, 1) such that
lim
t→∞
E[Pt] = + ∞ for 0 ≤ λ ≤ λc and some initial condition P0 ≥ 0 (18)
E[Pt] ≤ MP0 ∀t for λc < λ ≤ 1 and any initial condition P0 ≥ 0 (19)
where MP0 > 0 depends on the initial condition P0 ≥ 01.
The next theorem gives upper and lower bounds for the critical probability λc.
1We use the notation limt→∞ At = + ∞ when the sequence At ≥ 0 is not bounded; i.e., there is no matrix M ≥ 0 such
that At ≤ M, ∀t.
DRAFT


## Page 9

9
Theorem 3. Let
λ = arginfλ[∃ ˆS |ˆS = (1 − λ)A ˆSA′ + Q] = 1 − 1
α2 (20)
λ = arginfλ[∃( ˆK, ˆX) |ˆX > φ ( ˆK, ˆX)] (21)
where α = max i |σi|and σi are the eigenvalues of A. Then
λ ≤ λc ≤ λ. (22)
Finally, the following theorem gives an estimate of the limit of the mean covariance matrix
E[Pt], when this is bounded.
Theorem 4. Assume that (A, Q
1
2 ) is controllable, (A, C) is detectable and λ > λ, where λ is
deﬁned in Theorem 4. Then
0 ≤ ¯S ≤ lim
t→∞
E[Pt] ≤ ¯V ∀E[P0] ≥ 0 (23)
where ¯S = (1 − λ)A ¯SA′ + Q and ¯V = gλ( ¯V ).
The previous theorems give lower and upper bounds for both the critical probability λc and
for the mean error covariance E[Pt]. The lower bound λ is expressed in closed form. We now
resort to numerical algorithms for the computation of the remaining bounds λ, ¯S and ¯V .
The computation of the upper bound λ can be reformulated as the iteration of an LMI feasibility
problem. To establish this we need the following theorem:
Theorem 5. If (A, Q
1
2 ) is controllable and (A, C) is detectable, then the following statements
are equivalent:
(a) ∃ ¯X such that ¯X > g λ( ¯X)
(b) ∃ ¯K, ¯X > 0 such that ¯X > φ ( ¯K, ¯X)
(c) ∃ ¯Z and 0 < ¯Y ≤ I such that
Ψλ(Y, Z) =


Y
√
λ(Y A + ZC )
√
1 − λY A
√
λ(A′Y + C ′Z ′) Y 0
√
1 − λA′Y 0 Y

 > 0.
Proof: (a)=⇒(b) If ¯X > g λ( ¯X) exists, then ¯X > 0 by Lemma 1(g). Let ¯K = K ¯X. Then
¯X > g λ( ¯X) = φ( ¯K, ¯X) which proves the statement. (b) =⇒(a) Clearly ¯X > φ ( ¯K, ¯X) ≥ gλ( ¯X)
DRAFT


## Page 10

10
which proves the statement. (b) ⇐ ⇒(c) Let F = A + KC , then:
X > (1 − λ)AXA ′ + λF XF ′ + Q + λKRK ′
is equivalent to 
 X − (1 − λ)AXA ′ √
λF
√
λF ′ X −1

 > 0,
where we used the Schur complement decomposition and the fact that X − (1 − λ)AXA ′ ≥
λF XF ′ + Q + λKRK ′ ≥ Q > 0. Using one more time the Schur complement decomposition
on the ﬁrst element of the matrix we obtain
Θ =


X
√
λF
√
1 − λA
√
λF ′ X −1 0
√
1 − λA′ 0 X −1

 > 0.
This is equivalent to
Λ =


X −1 0 0
0 I 0
0 0 I

 Θ


X −1 0 0
0 I 0
0 0 I

 > 0
=


X −1 √
λX −1F
√
1 − λX −1A
√
λF ′X −1 X −1 0
√
1 − λA′X −1 0 X −1

 > 0.
Let us consider the change of variable Y = X −1 > 0 and Z = X −1K, in which case the
previous LMI is equivalent to:
Ψ(Y, Z) =


Y
√
λ(Y A + ZC )
√
1 − λY A
√
λ(A′Y + C ′Z ′) Y 0
√
1 − λA′Y 0 Y

 > 0.
Since Ψ(αY, αK ) = αΨ(Y, K), then Y can be restricted to Y ≤ I, which completes the theorem.
Combining theorems 3 and 5 we immediately have the following corollary
DRAFT


## Page 11

11
Corollary 1. The upper bound λ is given by the solution of the following optimization problem,
λ = argmin λΨ(Y, Z) > 0, 0 ≤ Y ≤ I.
This is a quasi-convex optimization problem in the variables (λ, Y, Z) and the solution can
be obtained by iterating LMI feasibility problems and using bisection for the variable λ.
The lower bound ¯S for the mean covariance matrix can be easily obtained via standard
Lyapunov Equation solvers. The upper bound ¯V can be found by iterating the MARE or by
solving an semideﬁnite programming (SDP) problem as shown in the following.
Theorem 6. If λ > λ, then the matrix ¯V = gλ(V ) is given by:
(a) ¯V = lim t→∞ Vt; Vt+1 = gλVt where V0 ≥ 0
(b)
argmaxV T race(V )
subject to

 AV A′ − V
√
λAV C ′
√
λCV A ′ CV C ′ + R

 ≥ 0, V ≥ 0
Proof: (a) It follows directly from Theorem 1.
(b) It can be obtained by using the Schur complement decomposition on the equation V ≤
gλ(V ). Clearly the solution ¯V = gλ( ¯V ) belongs to the feasible set of the optimization problem.
We now show that the solution of the optimization problem is the ﬁxed point of the MARE.
Suppose it is not, i.e., ˆV solves the optimization problem but ˆV ̸= gλ( ˆV ). Since ˆV is a feasible
point of the optimization problem, then ˆV < g λ( ˆV ) = ˆˆV . However, this implies that T race( ˆV ) <
T race( ˆˆV ), which contradicts the hypothesis of optimality of matrix ˆV . Therefore ˆV = gλ( ˆV )
and this concludes the theorem.
IV. S PECIAL CASES AND EXAMPLES
In this section we present some special cases in which upper and lower bounds on the critical
value λc coincide and give some examples. From Theorem 1, it follows that if there exists a ˜K
such that F is the zero matrix, then the convergence condition of the MARE is for λ > λ c =
1 − 1/α2, where α = max i |σi|, and σi are the eigenvalues of A.
• C is invertible . In this case a choice of K = −AC −1 makes F = 0. Note that the scalar
case also falls under this category. Figure (1) shows a plot of the steady state of the upper
DRAFT


## Page 12

12
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
0
10
20
30
40
50
60
70
80
90
100
S, V
λ
Special case: C is invertible
V
S
λc
Fig. 2. Example of transition to instability in the scalar case. The dashed line shows the asymptotic value of the lower bound
( ¯S), the solid line the asymptotic value of the upper bound ( ¯V ), and the dash-dot line shows the asymptote ( λc).
and lower bounds versus λ in the scalar case. The discrete time LTI system used in this
simulation has A = −1.25, C = 1, with vt and wt having zero mean and variance R = 2.5
and Q = 1, respectively. For this system we have λc = 0.36. The transition clearly appears
in the ﬁgure, where we see that the steady state value of both upper and lower bound tends
to inﬁnity as λ approaches λc. The dashed line shows the lower bound, the solid line the
upper bound, and the dash-dot line shows the asymptote.
• A has a single unstable eigenvalue . In this case, regardless of the dimension of C (and
as long as the pair (A, C) is detectable), we can use Kalman decomposition to bring to
zero the unstable part of F and thereby obtain tight bounds. Figure (2) shows a plot for
the system A =


1.25 1 0
0 .9 7
0 0 .60

, C =
(
1 0 2
)
with vt and wt having zero mean and variance R = 2 .5 and Q = 20 ∗ I3x3, respectively.
This time, the asymptotic value for trace of upper and lower bound is plotted versus λ.
Once again λc = 0.36.
DRAFT


## Page 13

13
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
0
0.5
1
1.5
2
2.5
3
3.5
4
4.5
5
x 10
6 Special case: one unstable eigenvalue
Tr(V)
Tr(S)
Tr(S), Tr(V)
λλc
Fig. 3. Example of transition to instability with a single unstable eigenvalue in the MIMO case. The dashed line shows the
asymptotic value of the trace of lower bound ( ¯S), the solid line the asymptotic value of trace of the upper bound ( ¯V ), and the
dash-dot line shows the asymptote ( λc).
In general F cannot always be made zero and we have shown that while a lower bound on
λc can be written in closed form, an upper bound on λc is the result of a LMI. Figure (3) shows
an example where upper and lower bounds have different convergence conditions. The system
used for this simulation is A =

 1.25 0
1 1 .1

, C =
(
1 1
)
with vt and wt having zero mean and variance R = 2.5 and Q = 20 ∗ I2x2, respectively.
Finally, in Figure (4) we report results of another experiment, plotting the state estimation
error of another system at two similar values of λ, one being below and one above the critical
value. We note a dramatic change in the error at λc ≈ 0.125. The ﬁgure on the left shows the
estimation error with λ = 0 .1. The ﬁgure on the right shows the estimation error for the same
system evolution with λ = 0.15. In the ﬁrst case the estimation error grows dramatically, making
it practically useless for control purposes. In the second case, a small increase in λ reduces the
estimation error by approximately three orders of magnitude.
DRAFT


## Page 14

14
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
0
5
10
15
x 10
4 General case
Tr(V)
Tr(S)
Tr(S), Tr(V)
λ λ λ
Fig. 4. Transition to instability in the general case, with arbitrary A and C. In this case lower and upper bounds do not have
the same asymptote.
0 100 200 300 400 500
−3
−2
−1
0
1
2
3
x 10
5
0 100 200 300 400 500
−1000
−800
−600
−400
−200
0
200
400
600
800
1000
tk
Estimation Error: λ = 0.15
tk
Estimation Error: λ = 0.1
Fig. 5. Estimation error for λ below (left) and above (right) the critical value
DRAFT


## Page 15

15
V. S TATIC VERSUS OPTIMAL DYNAMIC KALMAN GAIN
In this section we compare the performance of ﬁltering with static and dynamic gains for
a scalar discrete system. For the static estimator we follow the jump linear system approach
of [14]. The scalar static estimator case has been also worked out in [21].
Consider the dynamic state estimator
ˆxd
t+1 = Aˆxd
t + γtK d
t (yt − ˆyt)
K d
t = APtC ′(CP tC ′ + R)−1
Pt+1 = APtA′ + Q − γtAPtC ′(CP tC ′ + R)−1CP tA′ (24)
where the Kalman gain K d
t is time-varying. Also consider the static state estimator
ˆxs
t+1 = Aˆxd
t + γtKs(yt − ˆyt) (25)
where the estimator gain Ks is constant. If no data arrives, i.e. γt = 0, both estimators simply
propagate the state estimate of the previous time-step.
The performance of the dynamic state estimator (24) has been analyzed in the previous
sections. The performance of static state estimator (25) can be readily obtained using jump
linear system theory [13] [14]. To do so, let us consider the estimator error es
t+1
∆
= xt+1 − ˆxs
t+1.
Substituting Equations (1) for xt+1 and (25) for ˆxs
t+1, we obtain the dynamics of the estimation
error:
es
t+1 = (A − γtKsC)es
t + vt + γtKswt. (26)
Using the same notation of Chapter 6 in Nilsson [14], where he considers the general system:
zk+1 = Φ(rk)zk + Γ(rk)ek
the system (26) can be seen as jump linear system switching between two states rk ∈ {1, 2}
given by:
Φ(1) = A − KsC Γ(1) = [1 Ks]
Φ(2) = A Γ(2) = [1 0]
DRAFT


## Page 16

16
where the noise covariance E[eke′
k] = Re, the transition probability matrix Qπ and the steady
state probability distribution π∞ are given by:
Re =

 Q 0
0 R

 Qπ =

 λ 1 − λ
λ 1 − λ

 π∞ =
[
λ 1 − λ
]
Following the methodology proposed in Nilsson [14], it is possible to show that the system
above is mean square stable, i.e., limt→∞E[(es
t )′es
t ] = 0 if and only if the transition probability
is
λ < λ s = 1
1 −
(
1 − KsC
A
)2
(
1 − 1
A2
)
. (27)
If the system is mean square stable, the steady state error covariance P s
∞ = lim t→∞E[es
t (es
t )′] is
given by:
P s
∞ = Q + K 2
s R
1 − λ(A − KsC)2 − (1 − λ)A2 . (28)
Calculations to obtain Equations (27) and (28) are tedious but straightforward, therefore they
are omitted.
It is immediately evident that the transition probability λs of the estimator (25) using a static
gain is always greater than the transition probability λc of the estimator (24) which uses a
dynamic gain, in fact
λs = λc
1
1 −
(
1 − KsC
A
)2
with equality only in the case when Ks = A
C . A natural choice for the estimator gain Ks is
the steady state Kalman gain for the closed loop system ( r = 1 ), which is always different
from A
C . Figure 6 shows the steady state error covariance for the scalar system considered in
the previous section, where A = −1.5, C = 1, Q = 1, R = 2 .5. The steady state Kalman gain
for this system is KSSKalman = −0.70, and the gain for largest mean square stability range is
Ks = A
C = −1.25. The ﬁgure also displays the upper bound of the state error covariance ¯V for
the dynamic estimator (24) that can be computed as indicated in Theorem 6. The steady state
error covariance of the static predictor for the two different gains is always greater than our
upper bound ¯V . This is not surprising, since the dynamic estimator is optimal over all possible
estimators as shown in Section II. It is interesting to note that the static predictor with steady
state Kalman gain is close to the upper bound of the optimal predictor for arrival probability
DRAFT


## Page 17

17
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
0
5
10
15
20
25
30
λ
State Error Covariance P
V
Ks = KSSKalman
Ks = A/C
λc λs
Fig. 6. Error covariance bound ¯V for dynamic predictor obtained from our theory and steady state error covariance for two
static predictors obtained from JLS theory using a steady state Kalman gain and maximum stability margin gain
close to unity, while the static predictor giving the largest stability margin approaches the optimal
predictor asymptotically for arrival probability close to the critical arrival probability.
From this example, it seems that the upper bound for the dynamic estimator ¯V gives an
estimate of the minimum steady state covariance that can be achieved with a static estimator for
any given arrival probability if the static gain Ks is chosen optimally. Then the MARE could
be used to ﬁnd the minimum steady state covariance and then the corresponding steady state
modiﬁed Kalman gain, thus providing an useful tool for optimal static estimator design. Future
work will explore this possibility.
VI. C ONCLUSIONS
In this paper we have presented an analysis of Kalman ﬁltering in the setting of intermittent
observations. We have shown how the expected estimation error covariance depends on the
tradeoff between loss probability and the system dynamics. Such a result is useful to the system
designer who must assess the relationship between the dynamics of the system whose state is
to be estimated and the reliability of the communication channel through which that system is
measured.
DRAFT


## Page 18

18
Our motivating application is a distributed sensor network that collects observations and sends
them to one or more central units that are responsible for estimation and control. For example,
in a pursuit evasion game in which mobile pursuers perform their control actions based on the
current estimate of the positions of both pursuers and evaders, the sensing capability of each
pursuer is generally limited, and an embedded sensor network is essential for providing a larger
overall view of the terrain. The results that we have presented here can aid the designer of the
sensor network in the choice of the number and disposition of the sensors.
This application also suggests a number of interesting directions for further work. For example,
although we have assumed independent Bernoulli probabilities for the observation events, in the
sensor network there will generally be temporal and spatial sources of variability that lead to
correlations among these events. While it is possible to compute posterior state estimates in such
a setting, it would be of interest to see if a priori bounds of the kind that we have obtained here
can be obtained in this case. Similarly, in many situations there may be correlations between
the states and the observation events; for example, such correlations will arise in the pursuit
evasion game when the evaders move near the boundaries of the sensor network. Finally, the
sensor network setting also suggests the use of smoothing algorithms in addition to the ﬁltering
algorithms that have been our focus here. In particular, we may be willing to tolerate a small
amount of additional delay to wait for the arrival of a sensor measurement, if that measurement
is expected to provide a signiﬁcant reduction in uncertainty. Thus we would expect that the
tradeoff that we have studied here between loss probability and the system dynamics should
also be modulated in interesting ways by the delay due to smoothing.
As another motoviation for considering more complex models that remove the assumption that
the arrivals are independent Bernoulli, one can imagine situations where some of the sensing is
done locally and therefore measurements are available at all sampling times, while measurements
taken at distant locations are available at irregular intervals. This would imply different dropping
rates for different channels.
VII. A PPENDIX A
In order to give complete proofs of our main theorems, we need to prove some preliminary
lemmas. The ﬁrst lemma displays some useful properties of the MARE.
DRAFT


## Page 19

19
Lemma 1. Let the operator
φ(K, X) = (1 − λ)(AXA ′ + Q) + λ(F XF ′ + V ) (29)
where F = A + KC, V = Q + KRK ′. Assume X ∈S = {S ∈Rn×n|S ≥ 0}, R > 0, Q ≥ 0,
and (A, Q
1
2 ) is controllable. Then the following facts are true:
(a) With KX = −AXC ′ (CXC ′ + R)−1, gλ(X) = φ(KX, X)
(b) gλ(X) = min K φ(K, X) ≤ φ(K, X)∀K
(c) If X ≤ Y , then gλ(X) ≤ gλ(Y )
(d) If λ1 ≤ λ2 then gλ1(X) ≥ gλ2(X)
(e) If α ∈ [0, 1], then gλ(αX + (1 − α)Y ) ≥ αgλ(X) + (1 − α)gλ(Y )
(f) gλ(X) ≥ (1 − λ)AXA ′ + Q
(g) If ¯X ≥ gλ( ¯X), then ¯X > 0
(h) If X is a random variable, then (1 − λ)AE[X]A′ + Q ≤E[gλ(X)] ≤ gλ(E[X])
Proof: (a) Deﬁne FX = A + KXC, and observe that
FXXC ′ + KXR = (A + KXC)XC ′ + KXR = AXC ′ + KX(CXC ′ + R) = 0 .
Next, we have
gλ(X) = (1 − λ)(AXA ′ + Q) + λ(AXA ′ + Q − AXC ′ (CXC ′ + R)−1 CXA ′)
= (1 − λ)(AXA ′ + Q) + λ(AXA ′ + Q + KXCXA ′)
= (1 − λ)(AXA ′ + Q) + λ(FXXA ′ + Q)
= (1 − λ)(AXA ′ + Q) + λ(FXXA ′ + Q) + (FXXC ′ + KXR)K ′
= φ(KX, X)
(b) Let ψ(K, X) = ( A + KC )X(A + KC )′ + KRK ′ + Q. Note that
argminKφ(K, X) = argminKF XF ′ + V = argminKψ(X, K).
Since X, R ≥ 0, φ(K, X) is quadratic and convex in the variable K, therefore the minimizer
can be found by solving ∂ψ(K,X)
∂K = 0, which gives:
2(A + KC )XC ′ + 2KR = 0 =⇒ K = −AXC ′ (CXC ′ + R)−1 .
Since the minimizer corresponds to KX deﬁned above, the fact follows from fact (1).
DRAFT


## Page 20

20
(c) Note that φ(K, X) is afﬁne in X. Suppose X ≤ Y . Then
gλ(X) = φ(KX, X) ≤ φ(KY , X) ≤ φ(KY , Y ) = gλ(Y ).
This completes the proof.
(d) Note that AXC ′(CXC ′ + R)−1CXA ≥ 0. Then
gλ1(X) = AXA ′ + Q − λ1 AXC ′(CXC ′ + R)−1CXA
≥ AXA ′ + Q − λ2 AXC ′(CXC ′ + R)−1CXA = gλ2(X)
(e) Let Z = αX + (1 − α)Y where α ∈ [0, 1]. Then we have
gλ(Z) = φ(KZ, Z)
= α(A + KZ C)X(A + KZ C)′ + (1 − α)(A + KZ C)Y (A + KZ C)′+
+(α + 1 − α)(KZ R K ′
Z + Q)
= αφ(KZ, X) + (1 − α)φ(KZ, Y )
≥ αφ(KX, X) + (1 − α)φ(KY , Y )
= αgλ(X) + (1 − α)gλ(Y ).
(30)
(f) Note that FXXF ′
X ≥ 0 and KRK ′ ≥ 0 for all K and X. Then
gλ1(X) = φ(KX, X) = (1 − λ)(AXA ′ + Q) + λ(FXXF ′
X + KXRK ′
X + Q)
≥ (1 − λ)(AXA ′ + Q) + λQ = (1 − λ)AXA ′ + Q.
(g) From fact (f) follows that ¯X ≥ gλ1( ¯X) ≥ (1 − λ)A ¯XA ′ + Q. Let ˆX such that ˆX =
(1 − λ)A ˆXA ′ + Q. Such ˆX must clearly exist. Therefore ¯X − ˆX ≥ (1 − λ)A( ¯X − ˆX)A′ ≥ 0.
Moreover the matrix ˆX solves the Lyapunov Equation ˆX = ˜A ˆX ˜A′ + Q where ˜A =
√
1 − λA.
Since ( ˜A, Q
1
2 ) is detectable, it follows that ˆX > 0 and so ¯X > 0, which proves the fact.
(h) Using fact (f) and linearity of expectation we have
E[gλ(X)] ≥E[(1 − λ)AXA ′ + Q] = (1 − λ)AE[X]A′ + Q,
fact (e) implies that the operator gλ() is concave, therefore by Jensen’s Inequality we have
E[gλ(X)] ≤ gλ(E[X]).
DRAFT


## Page 21

21
Lemma 2. Let Xt+1 = h(Xt) and Yt+1 = h(Yt). If h(X) is a monotonically increasing function
then:
X1 ≥ X0 ⇒ Xt+1 ≥ Xt, ∀t ≥ 0
X1 ≤ X0 ⇒ Xt+1 ≤ Xt, ∀t ≥ 0
X0 ≤ Y0 ⇒ Xt ≤ Yt, ∀t ≥ 0
Proof: This lemma can be readily proved by induction. It is true for t = 0, since X1 ≥ X0
by deﬁnition. Now assume that Xt+1 ≥ Xt, then Xt+2 = h(Xt+1) ≥ h(Xt+1) = Xt+1 because
of monotonicity of h(·). The proof for the other two cases is analogous.
It is important to note that while in the scalar case X ∈R either h(X) ≤ X or h(X) ≥ X;
in the matrix case X ∈ Rn×n, it is not generally true that either h(X) ≥ X or h(X) ≤ X.
This is the source of the major technical difﬁculty for the proof of convergence of sequences in
higher dimensions. In this case convergence of a sequence {Xt}∞
0 is obtained by ﬁnding two
other sequences, {Yt}∞
0 , {Zt}∞
0 that bound Xt, i.e., Yt ≤ Xt ≤ Zt, ∀t, and then by showing that
these two sequences converge to the same point.
The next two lemmas show that when the MARE has a solution ¯P , this solution is also stable,
i.e., every sequence based on the difference Riccati equation Pt+1 = gλ(Pt) converges to ¯P for
all initial positive semideﬁnite conditions P ≥ 0.
Lemma 3. Deﬁne the linear operator
L(Y ) = (1 − λ)(AY A′) + λ(F Y F ′)
Suppose there exists Y > 0 such that Y > L(Y ).
(a) For all W ≥ 0,
lim
k→∞
Lk(W ) = 0
(b) Let U ≥ 0 and consider the linear system
Yk+1 = L(Yk) + U initialized at Y0.
Then, the sequence Yk is bounded.
Proof: (a) First observe that 0 ≤ L(Y ) for all 0 ≤ Y . Also, X ≤ Y implies L(X) ≤ L(Y ).
Choose 0 ≤ r < 1 such that L(Y ) < r Y . Choose 0 ≤ m such that W ≤ mY . Then,
0 ≤ L k(W ) ≤ mLk(Y ) < mr kY
DRAFT


## Page 22

22
The assertion follows when we take the limit r → ∞, on noticing that 0 ≤ r < 1.
(b) The solution of the linear iteration is
Yk = Lk(Y0) +
k−1∑
t=0
Lt(U )
≤
(
mY0rk +
k−1∑
t=0
mU rt
)
Y
≤
(
mY0rk + mU
1 − r
)
Y
≤
(
mY0 + mU
1 − r
)
Y
proving the claim.
Lemma 4. Consider the operator φ(K, X) deﬁned in Equation (29). Suppose there exists a
matrix K and a positive deﬁnite matrix P such that
P > 0 and P > φ (K, P ).
Then, for any P0, the sequence Pt = gt
λ(P0) is bounded, i.e. there exists MP0 ≥ 0 dependent of
P0 such that
Pt ≤ M for all t.
Proof: First deﬁne the matrices F = A + KC and consider the linear operator
L(Y ) = (1 − λ)(AY A′) + λ(F Y F
′
)
Observe that
P > φ (K, P ) = L(P ) + Q + λKRK
′
≥ L(P ).
Thus, L meets the condition of Lemma 3. Finally, using fact (b) in Lemma 1 we have
Pt+1 = gλ(Pt) ≤ φ(K, Pt) = LPt + Q + λKRK
′
= L(Pt) + U.
Since U = λKRK
′
+ Q ≥ 0, using Lemma 3, we conclude that the sequence Pt is bounded.
We are now ready to give proofs for Theorems 1-4.
DRAFT


## Page 23

23
A. Proof of Theorem 1
(a) We ﬁrst show that the modiﬁed Riccati difference equation initialized at Q0 = 0 converges.
Let Qk = gk
λ(0). Note that 0 = Q0 ≤ Q1. It follows from Lemma 1(c) that
Q1 = gλ(Q0) ≤ gλ(Q1) = Q2.
A simple inductive argument establishes that
0 = Q0 ≤ Q1 ≤ Q2 ≤ · · · ≤ MQ0.
Here, we have used Lemma 4 to bound the trajectory. We now have a monotone non-decreasing
sequence of matrices bounded above. It is a simple matter to show that the sequence converges,
i.e.
lim
k→∞
Qk = P .
Also, we see that P is a ﬁxed point of the modiﬁed Riccati iteration:
P = gλ(P ),
which establishes that it is a positive semideﬁnite solution of the MARE.
Next, we show that the Riccati iteration initialized at R0 ≥ P also converges, and to the same
limit P . First deﬁne the matrices
K = −AP C′ (
CP C′ + R
)−1
, F = A + KC
and consider the linear operator
ˆL(Y ) = (1 − λ)(AY A′) + λ(F Y F
′
).
Observe that
P = gλ(P ) = L(P ) + Q + KRK
′
> ˆL(P ).
Thus, ˆL meets the condition of Lemma 3. Consequently, for all Y ≥ 0,
lim
k→∞
ˆLk(Y ) = 0 .
Now suppose R0 ≥ P . Then,
R1 = gλ(R0) ≥ gλ(P ) = P .
DRAFT


## Page 24

24
A simple inductive argument establishes that
Rk ≥ P for all k.
Observe that
0 ≤ (Rk+1 − P ) = gλ(Rk) − gλ(P )
= φ(KRk, Rk) − φ(KP , P )
≤ φ(KP , Rk) − φ(KP , P )
= (1 − λ)A(Rk − P )A′ + λFP (Rk − P )F ′
P
= ˆL(Rk − P ).
Then, 0 ≤ limk→∞(Rk+1 − P ) ≤ 0, proving the claim.
We now establish that the Riccati iteration converges to P for all initial conditions P0 ≥ 0.
Deﬁne Q0 = 0 and R0 = P0 + P . Consider three Riccati iterations, initialized at Q0, P0, and
R0. Note that
Q0 ≤ P0 ≤ R0.
It then follows from Lemma 2 that
Qk ≤ Pk ≤ Rk for all k.
We have already established that the Riccati equations Pk and Rk converge to P . As a result,
we have
P = lim
k→∞
Pk ≤ lim
k→∞
Qk ≤ lim
k→∞
Rk = P ,
proving the claim.
(b) Finally, we establish that the MARE has a unique positive semideﬁnite solution. To this
end, consider ˆP = gλ( ˆP ) and the Riccati iteration initialized at P0 = ˆP . This yields the constant
sequence
ˆP , ˆP , · · ·
However, we have shown that every Riccati iteration converges to P . Thus P = ˆP .
DRAFT


## Page 25

25
B. Proof of Theorem 2
First we note that the two cases expressed by the theorem are indeed possible. If λ = 1 the
modiﬁed Riccati difference equation reduces to the standard Riccati difference equation, which
is known to converge to a ﬁxed point, under the theorem’s hypotheses. Hence, the covariance
matrix is always bounded in this case, for any initial condition P0 ≥ 0. If λ = 0 then we reduce
to open loop prediction, and if the matrix A is unstable, then the covariance matrix diverges
for some initial condition P0 ≥ 0. Next, we show the existence of a single point of transition
between the two cases. Fix a 0 < λ 1 ≤ 1 such that Eλ1[Pt] is bounded for any initial condition
P0 ≥ 0. Then, for any λ2 ≥ λ1 Eλ2[Pt] is also bounded for all P0 ≥ 0. In fact we have
Eλ1[Pt+1] = Eλ1[APtA′ + Q − γt+1APtC ′(CP tC ′ + R)−1CP tA]
= E[APtA′ + Q − λ1APtC ′(CP tC ′ + R)−1CP tA]
= E[gλ1(Pt)]
≥ E[gλ2(Pt)]
= Eλ2[Pt+1],
where we exploited fact (d) of Lemma 1 to write the above inequality . We can now choose
λc = {inf λ∗ : λ > λ ∗ ⇒Eλ[Pt]is bounded, for all P0 ≥ 0},
completing the proof.
C. Proof of Theorem 3
Deﬁne the Lyapunov operator m(X) = ˜AX ˜A′+Q where ˜A =
√
1 − λA. If (A, Q
1
2 ) is control-
lable, also ( ˜A, Q
1
2 ) is controllable. Therefore, it is well known that ˆS = m( ˆS) has a unique strictly
positive deﬁnite solution ˆS > 0 if and only if maxi |σi( ˜A)|< 1, i.e.
√
1 − λ maxi |σi(A)|< 1,
from which follows λ = 1 − 1
α2 . If maxi |σi( ˜A)| ≥ 1 it is also a well known fact that there
is no positive semideﬁnite ﬁxed point to the Lyapunov equation ˆS = m( ˆS), since ( ˜A, Q
1
2 ) is
controllable.
Let us consider the difference equation St+1 = m(St), S 0 = 0 . It is clear that S0 = 0 ≤
Q = S1. Since the operator m() is monotonic increasing, by Lemma 2 it follows that the
sequence {St}∞
0 is monotonically increasing, i.e. St+1 ≥ St for all t. If λ < λ this sequence
DRAFT


## Page 26

26
does not converge to a ﬁnite matrix ¯S, otherwise by continuity of the operator m we would
have ¯S = m( ¯S), which is not possible. Since it is easy to show that a monotonically increasing
sequence St that does not converge is also unbounded, then we have
lim
t→∞
St = ∞.
Let us consider now the mean covariance matrix E[Pt] initialized at E[P0] ≥ 0. Clearly
0 = S0 ≤E[P0]. Moreover it is also true
St ≤E[Pt] =⇒ St+1 = (1 − λ)AStA′ + Q ≤ (1 − λ)AE[Pt]A′ + Q ≤E[gλ(Pt)] =E[Pt+1],
where we used fact (h) from Lemma 1. By induction, it is easy to show that
St ≤E[Pt] ∀t, ∀E[P0] ≥ 0 =⇒ lim
t→∞
E[Pt] ≥ lim
t→∞
St = ∞.
This implies that for any initial condition E[Pt] is unbounded for any λ < λ , therefore λ ≤ λc,
which proves the ﬁrst part of the Theorem.
Now consider the sequence Vt+1 = gλ(Vt), V 0 =E[P0] ≥ 0. Clearly
E[Pt] ≤ Vt =⇒ E[Pt+1] =E[gλ(Pt)] ≤ gλ(E[Pt]) ≤ [gλ(Vt)] = Vt+1,
where we used facts (c) and (h) from Lemma 1. Then a simple induction argument shows
that Vt ≥ E[Pt] for all t. Let us consider the case λ > λ, therefore there exists ˆX such that
ˆX ≥ gλ( ˆX). By Lemma 1(g) ¯X > 0, therefore all hypotheses of Lemma 3 are satisﬁed, which
implies that
E[Pt] ≤ Vt ≤ MV0 ∀t.
This shows that λc ≤ λ and concludes the proof of the Theorem.
D. Proof of Theorem 4
Let consider the sequences St+1 = (1 − λ)AStA′ + Q, S 0 = 0 and Vt+1 = gλ(Vt), V 0 =
E[P0] ≥ 0. Using the same induction arguments in Theorem 3 it is easy to show that
St ≤E[Pt] ≤ Vt ∀t.
From Theorem 1 follows that limt→∞ Vt = ¯V , where ¯V = gλV . As shown before the sequence St
is monotonically increasing. Also it is bounded since St ≤ Vt ≤ M. Therefore limt→∞ St = ¯S,
and by continuity ¯S = (1 − λ)A ¯SA′ + Q, which is a Lyapunov equation. Since
√
1 − λA is
DRAFT


## Page 27

27
stable and (A, Q
1
2 ) is controllable, then the solution of the Lyapunov equation is strictly positive
deﬁnite, i.e. ¯S > 0. Adding all the results together we get
0 < ¯S = lim
t→∞
St ≤ lim
t→∞
E[Pt] ≤ lim
t→∞
Vt = ¯V ,
which concludes the proof.
DRAFT


## Page 28

28
REFERENCES
[1] Smart dust project home page. http://robotics.eecs.berkeley.edu/ pister/SmartDust/.
[2] NEST project at Berkeley home page. http://webs.cs.berkeley.edu/nest-index.html.
[3] Seismic sensor research at berkeley, home page. http://www.berkeley.edu/news/media/releases /2001/12/13 snsor.html.
[4] P. Varaiya, “Smart cars on smart roads: Problems of control,”IEEE Transactions on Automatic Control, vol. 38(2), February
1993.
[5] J. Lygeros, D. N. Godbole, and S. S. Sastry, “Veriﬁed hybrid controllers for automated vehicles,” IEEE Transactions on
Automatic Control, vol. 43(4), 1998.
[6] B. Sinopoli, C. Sharp, S. Schaffert, L. Schenato, and S. Sastry, “Distributed control applications within sensor networks,”
IEEE Proceedings Special Issue on Distributed Sensor Networks , November 2003.
[7] R. E. Kalman, “A new approach to linear ﬁltering and prediction problems,” Transactions of the ASME - Journal of Basic
Engineering on Automatic Control , vol. 82(D), pp. 35–45, 1960.
[8] P. S. Maybeck, Stochastic models, estimation, and control , ser. Mathematics in Science and Engineering, 1979, vol. 141.
[9] M. Micheli and M. I. Jordan, “Random sampling of a continiuous-time stochastic dynamical system,” in Proceedings of
15th International Symposium on the Mathematical Theory of Networks and Systems (MTNS) , University of Notre Dame,
South Bend, Indiana, August 2002.
[10] M. Micheli, “Random sampling of a continuous-time stochastic dynamical system: Analysis, state estimation, applications,”
Master’s Thesis, University of California at Berkeley, Deparment of Electrical Engineering, 2001.
[11] M. Athans, R. Ku, and S. B. Gershwin, “The uncertainty threshold principle, some fundamental limitations of optimal
decision making under dynamic uncertainty,” IEEE Transactions on Automatic Control , vol. 22(3), pp. 491–495, June
1977.
[12] R. Ku and M. Athans, “Further results on the uncertainty threshold principle,” IEEE Transactions on Automatic Control ,
vol. 22(5), pp. 491–495, October 1977.
[13] M. Mariton, Jump Linear Systems in Automatic Control . Marcel Dekker, 1990.
[14] J. Nilsson, “Real-time control systems with delays,” Ph.D. dissertation, Department of Automatic Control, Lund Institute
of Technology, 1998.
[15] J. Nilsson, B. Bernhardsson, and B. Wittenmark, “Stochastic analysis and control of real-time systems with random time
delays.” [Online]. Available: citeseer.nj.nec.com/101333.html
[16] Q. Ling and M. Lemmon, “Soft real-time scheduling of networked control systems with dropouts governed by a markov
chain,” in American Control Conference , June 2003, denver, CO.
[17] T. Fortmann, Y . Bar-Shalom, M. Scheffe, and S. Gelfand, “Detection thresholds for tracking in clutter-a connection between
estimation and signal processing,” IEEE Transactions on Automatic Control, vol. AC-30, no. 3, pp. 221–228, March 1985.
[18] N. M. Dempster, A. Laird, and D. B. Rubin, “Maximum likelihood from incomplete data via the EM algorithm,” Journal
of the Royal Statistical Society B , vol. 39, pp. 185–197, 1977.
[19] R. H. Shumway and D. S. Stoffer, Time Series Analysis and Its Applications . Springer Verlag, March 2000.
[20] S. Lauritzen, Graphical Models. Clarendon Press, 1996.
[21] C. N. Hadjicostis and R. Touri, “Feedback control utilizing packet dropping network links,” in Proceedings of the 41st
IEEE Conference on Decision and Control , Las Vegas, NV , Dec 2002, invited.
DRAFT
