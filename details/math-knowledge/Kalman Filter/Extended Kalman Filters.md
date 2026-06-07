# Kalman and Extended Kalman Filters: Concept, Derivation and Properties

Converted from: `Kalman Filter\Extended Kalman Filters.pdf`


## Page 1

Kalman and Extended Kalman Filters:
Concept, Derivation and Properties
Maria Isabel Ribeiro
Institute for Systems and Robotics
Instituto Superior T´ecnico
Av. Rovisco Pais, 1
1049-001 Lisboa PORTUGAL
{mir@isr.ist.utl.pt}
c⃝ M. Isabel Ribeiro, 2004
February 2004


## Page 2

Contents
1 Introduction 2
2 The Filtering Problem 3
3 Estimation of Random Parameters. General Results 8
3.1 Problem Formulation . . . . . . . . . . . . . . . . . . . . . . . . 8
3.2 Problem Reformulation . . . . . . . . . . . . . . . . . . . . . . . 10
3.3 Particularization for Gaussian Random Vectors . . . . . . . . . . 12
4 The Kalman Filter 14
4.1 Kalman Filter dynamics . . . . . . . . . . . . . . . . . . . . . . . 15
4.2 One-step ahead prediction dynamics . . . . . . . . . . . . . . . . 22
4.3 Kalman ﬁlter dynamics for a linear time-invariant system . . . . . 23
4.4 Steady-state Kalman ﬁlter . . . . . . . . . . . . . . . . . . . . . . 24
4.5 Initial conditions . . . . . . . . . . . . . . . . . . . . . . . . . . 25
4.6 Innovation Process . . . . . . . . . . . . . . . . . . . . . . . . . 27
4.7 The Kalman ﬁlter dynamics and the error ellipsoids . . . . . . . . 29
5 The Extended Kalman Filter 31
5.1 Derivation of Extended Kalman Filter dynamics . . . . . . . . . . 34
1


## Page 3

Chapter 1
Introduction
This report presents and derives the Kalman ﬁlter and the Extended Kalman ﬁlter
dynamics. The general ﬁltering problem is formulated and it is shown that, un-
der linearity and Gaussian conditions on the systems dynamics, the general ﬁlter
particularizes to the Kalman ﬁlter. It is shown that the Kalman ﬁlter is a linear,
discrete time, ﬁnite dimensional time-varying system that evaluates the state esti-
mate that minimizes the mean-square error.
The Kalman ﬁlter dynamics results from the consecutive cycles of prediction
and ﬁltering. The dynamics of these cycles is derived and interpreted in the frame-
work of Gaussian probability density functions. Under additional conditions on
the system dynamics, the Kalman ﬁlter dynamics converges to a steady-state ﬁl-
ter and the steady-state gain is derived. The innovation process associated with
the ﬁlter, that represents the novel information conveyed to the state estimate by
the last system measurement, is introduced. The ﬁlter dynamics is interpreted in
terms of the error ellipsoids associated with the Gaussian pdf involved in the ﬁlter
dynamics.
When either the system state dynamics or the observation dynamics is non-
linear, the conditional probability density functions that provide the minimum
mean-square estimate are no longer Gaussian. The optimal non-linear ﬁlter prop-
agates these non-Gaussian functions and evaluate their mean, which represents an
high computational burden. A non optimal approach to solve the problem, in the
frame of linear ﬁlters, is the Extended Kalman ﬁlter (EKF). The EKF implements
a Kalman ﬁlter for a system dynamics that results from the linearization of the
original non-linear ﬁlter dynamics around the previous state estimates.
2


## Page 4

Chapter 2
The Filtering Problem
This section formulates the general ﬁltering problem and explains the conditions
under which the general ﬁlter simpliﬁes to a Kalman ﬁlter (KF).
Figure 2.1: Typical application of the Kalman Filter
Figure 2.1, reproduced from [4], illustrates the application context in which
the Kalman Filter is used. A physical system, (e.g., a mobile robot, a chemical
process, a satellite) is driven by a set of external inputs or controls and its outputs
are evaluated by measuring devices or sensors, such that the knowledge on the
system’s behavior is solely given by the inputs and the observed outputs. The
observations convey the errors and uncertainties in the process, namely the sensor
noise and the system errors.
Based on the available information (control inputs and observations) it is re-
quired to obtain an estimate of the system’s state that optimizes a given criteria.
This is the role played by a ﬁlter. In particular situations, explained in the follow-
ing sections, this ﬁlter is a Kalman Filter.
3


## Page 5

The general ﬁltering problem may formulated along the following lines. Let
x(k + 1) = f (x(k), u (k), w (k)) (2.1)
y(k) = h(x(k), v (k)) (2.2)
be the state dynamics of a general non-linear time-varying system, where
• x ∈ Rn is the system state vector,
• f (., ., . ) deﬁnes the system’s dynamics,
• u ∈ Rm is the control vector,
• w is the vector that conveys the system error sources,
• y ∈ Rr is the observation vector,
• h(., ., . ) is the measurement function,
• v is the vector that represents the measurement error sources.
Given
- f, h, the noise characterization, the initial conditions,
- the set of controls, u(0), u (1), . . . , u (k − 1),
- the set of measurements, y(1), y (1), y (2), . . . , y (k),
obtain
- the best estimate of x(k).
Any type of ﬁlter tries to obtain an optimal estimate of the desired quantities
(the system’s state) from data provided by a noisy environment. The concept of
optimality expressed by the words best estimate corresponds to the minimization
of the state estimation error in some respect.
Taking a Bayesian viewpoint, the ﬁlter propagates the conditional probabil-
ity density function of the desired quantities, conditioned on the knowledge of
the actual data coming from the measuring devices, i.e., the ﬁlter evaluates and
propagates the conditional pdf
p(x(k)|y(1), . . . , y (k), u (0), . . . , u (k − 1)) (2.3)
4


## Page 6

for increasing values of k. This pdf conveys the amount of certainty on the knowl-
edge of the value of x(k).
Consider that, for a given time instant k, the sequence of past inputs and the
sequence of past measurements are denoted by1
U k−1
0 = {u0, u 1, . . . , u k−1} (2.4)
Y k
1 = {y1, y 2, . . . , y k}. (2.5)
The entire system evolution and ﬁltering process, may be stated in the follow-
ing steps, [1], that considers the systems dynamics (2.1)-(2.2):
• Given x0
- Nature apply w0,
- We apply u0,
- The system moves to state x1,
- We make a measurement y1.
• Question: which is the best estimate of x1?
Answer: is obtained from p(x1|Y 1
1 , U 0
0 )
- Nature apply w1,
- We apply u1,
- The system moves to state x2,
- We make a measurement y2.
• Question: which is the best estimate of x2?
Answer: is obtained from p(x2|Y 2
1 , U 1
0 )
- ...
- ...
- ...
- ...
• Question: which is the best estimate of xk−1?
Answer: is obtained from p(xk−1|Y k−1
1 , U k−2
0 )
- Nature apply wk−1,
- We apply uk−1,
- The system moves to state xk,
1Along this text u(i) = ui, y(i) = yi and x(i) = xi.
5


## Page 7

- We make a measurement yk.
• Question: which is the best estimate of xk?
Answer: is obtained from p(xk|Y k
1 , U k−1
0 )
- ...
- ...
- ...
- ...
Therefore, aiming at obtaining the best state estimate, the ﬁlter propagates the
conditional pdf for increasing values of k, and for each k, it obtains the estimate
ˆxk that optimizes a chosen criteria, as represented in the following diagram.
p(x0)
p(x1|Y 1
1 , U 0
0 ) − → ˆx1
p(x2|Y 2
1 , U 1
0 ) − → ˆx2
... − → ...
p(xk−1|Y k−1
1 , U k−2
0 ) − → ˆxk−1
p(xk|Y k
1 , U k−1
0 ) − → ˆxk
Different optimization criteria may be chosen, leading to different estimates
of the system’s state vector. The estimate can be
• the mean, i.e., the center of the probability mass, corresponding to the min-
imum mean-square error criteria,
• the mode that corresponds to the value of x that has the highest probability,
corresponding to the Maximum a Posterior (MAP) criteria,
• the median, where the estimate is the value ofx such that half the probabil-
ity weight lies to the left and half to the right of it.
For the conditional pdf represented in Figure 2.2 these criteria leads to different
state estimates. So far, we formulated the general ﬁltering problem. Under a set
of particular conditions related with the linearity of the system (state and obser-
vation) dynamics and the normality of the random vectors involved (e.g., initial
condition, state and measurement noise), the conditional probability density func-
tions propagated by the ﬁlter are Gaussian for every k. The involved pdf are thus
completely characterize by the mean vector and the covariance matrix. Rather
6


## Page 8

Figure 2.2: General conditional pdf
than propagating the entire pdf, the ﬁlter only propagates (recursively) the ﬁrst
and second moments of the conditional pdf. The general ﬁlter simpliﬁes to what
is known as the Kalman ﬁlter, whose dynamics is be derived in Section 4.
The Kalman ﬁlter dynamics will be derived as a general random parameter
vector estimation. The KF ﬁlter evaluates the minimum mean-square error esti-
mate of the random vector that is the system’s state.
Results on the estimation of a general random parameter vector are presented
in Section 3.
7


## Page 9

Chapter 3
Estimation of Random Parameters.
General Results
This section presents basic results on the estimation of a random parameter vector
based on a set of observations. This is the framework in which the Kalman ﬁlter
will be derived, given that the state vector of a given dynamic system is interpreted
as a random vector whose estimation is required. Deeper presentations of the
issues of parameter estimation may be found, for example, in [3], [5], [10].
Let
θ ∈ Rn (3.1)
be a random vector, from which the available information is given by a ﬁnite set
of observations
Y k
1 = [y(1), y (2), . . . , y (k − 1), y (k)] (3.2)
with no assumption on the dependency between y(i) and θ.
Denote by
p(θ, Y k
1 ), p (θ|Y k
1 ) e p(Y k
1 )
the joint probability density function (pdf) of θ and Y k
1 , the conditional pdf of θ
given Y k
1 , and the pdf of Y k
1 , respectively.
3.1 Problem Formulation
The estimation problem of the random vector θ is stated, in general terms, as
follows: given the observations y(1), y (2), ..., y (k), evaluate an estimate of θ, i.e.,
ˆθ(k) = f [y(i), i = 1, ..., k ] (3.3)
8


## Page 10

that optimizes a given criteria. Common optimization criteria are:
• the mean square error,
• the maximum a posterior.
In the sequel we will consider the mean-square error estimator, and therefore,
the estimated value of the random vector is such that the cost function
J[˜θ(k)] = E[˜θ(k)T ˜θ(k)] (3.4)
is minimized, where ˜θ(k) stands for the estimation error given by
˜θ(k)
△
= θ − ˆθ(k). (3.5)
According to the above formulated problem, the estimate ˆθ(k) is given by
ˆθ(k) = argmin E[(θ − ˆθ(k))T (θ − ˆθ(k)]. (3.6)
We now show that minimizing E[˜θ(k)T ˜θ(k)] relative to ˆθ(k) is equivalent to
minimize the condition mean E[˜θ(k)T ˜θ(k)|Y k
1 ] relative to ˆθ(k). In fact, from the
deﬁnition of the mean operator, we have
E[˜θ(k)T ˜θ(k)] =
∫ ∞
−∞
∫ ∞
−∞
˜θ(k)T ˜θ(k)p(θ, Y k
1 )dθdY k
1 (3.7)
where dθ = dθ1dθ2...dθ n and dY k
1 = dy1dy2...dy k. Using the result obtained from
Bayes law, (see e.g., [8])
p(θ, Y k
1 ) = p(θ|Y k
1 )p(Y k
1 ) (3.8)
in (3.7) yields:
E[˜θ(k)T ˜θ(k)] =
∫ ∞
−∞
[∫ ∞
−∞
˜θ(k)T ˜θ(k)p(θ|Y k
1 )dθ
]
p(Y k
1 )dY k
1 .
Moreover, reasoning about the meaning of the integral inside the square brackets,
results
E[˜θ(k)T ˜θ(k)] =
∫ ∞
−∞
E[˜θ(k)T ˜θ(k)|Y k
1 ]p(Y k
1 )dY k
1 .
Therefore, minimizing the mean value of the left hand side of the previous equality
relative to ˆθ(k) is equivalent to minimize, relative to the same vector, the mean
value E[˜θ(k)T ˜θ(k)|Y k
1 ] on the integral on the right hand side. Consequently, the
estimation of the random parameter vector can be formulated in a different way,
as stated in the following subsection.
9


## Page 11

3.2 Problem Reformulation
Given the set of observations y(1), y (2), ..., y (k), the addressed problem is the
derivation of an estimator of θ that minimizes the conditional mean-square error,
i.e.,
ˆθ(k) = argmin E[˜θ(k)T ˜θ(k)|Y k
1 ]. (3.9)
Result 3.2.1 : The estimator that minimizes the conditional mean-square error is
the conditional mean, [5], [10],
ˆθ(k) = E[θ|Y k
1 ]. (3.10)
Proof: From the deﬁnition of the estimation error in (3.5), the cost function in
(3.9) can be rewritten as
J = E[(θ − ˆθ(k))T (θ − ˆθ(k))|Y k
1 ] (3.11)
or else,
J = E[θT θ − θT ˆθ(k) − ˆθ(k)T θ + ˆθ(k)T ˆθ(k)|Y k
1 ] (3.12)
= E[θT θ|Y k
1 ] − E[θT |Y k
1 ]ˆθ(k) − ˆθ(k)T E[θ|Y k
1 ] + E[ˆθ(k)T ˆθ(k)|Y k
1 ]. (3.13)
The last equality results from the fact that, by deﬁnition (see (3.3)), θ(k) is a
function of Y k
1 and thus
E[ˆθ(k)|Y k
1 ] = ˆθ(k).
If we add and subtract E[θT |Y k
1 ]E[θ|Y k
1 ] to (3.13) yields
J = E[θT θ|Y k
1 ] − E[θT |Y k
1 ]E[θ|Y k
1 ] + [ ˆθ(k) − E[θ|Y k
1 ]]T [ˆθ(k) − E[θ|Y k
1 ]]
where the ﬁrst two terms in the right hand side do not depend on ˆθ(k). The de-
pendency of ˆθ(k) on J results from a quadratic term, and therefore it is immediate
that J achieves a minimum when the quadratic term is zero, and thus
ˆθ(k) = E[θ|Y k
1 ],
which concludes the proof.
2
Corollary 3.2.1 : Consider that f (Y k
1 ) is a given function of the observations
Y k
1 . Then, the estimation error is orthogonal to f (Y k
1 ), θ − ˆθ(k) ⊥ f (Y k
1 ), this
meaning that
E[(θ − ˆθ(k))f T (Y k
1 )] = 0 . (3.14)
10


## Page 12

Proof: For the proof we use the following result on jointly distributed random
variables. Let x and y be jointly distributed random variables and g(y) a function
of y. It is known that, [8]
E[xg(y)] = E [E(x|y)g(y)] (3.15)
where the outer mean-value operator in the right hand side is deﬁned relative to
the random variable y. Using (3.15) in the left hand side of (3.14) results
E[˜θ(k)f T (Y k
1 )] = E[E(˜θ(k)|Y k
1 )f T (Y k
1 )]. (3.16)
Evaluating the mean value of the variable inside the square brackets in (3.16)
leads to
E[˜θ(k)|Y k
1 ] = E[θ|Y k
1 ] − ˆθ(k) (3.17)
because ˆθ(k) is known when Y k
1 is given. Therefore, (3.17) is zero, from where
(3.14) holds, this concluding the proof.
2
The particularization of the corollary for the case where f (Y k
1 ) = ˆθ(k) yields,
E[˜θ(k)ˆθT (k)] = 0 . (3.18)
Figure 3.1: Minimum mean-square error orthogonal to ˆθ(k)
Figure 3.1 presents a graphical interpretation of the meaning of Corollary 3.2.1
and of its particularization. The space spanned by Y k
1 is represented by the yellow
area. The parameter vector exact value, θ, is not known. The information we have
to estimate θ is exclusively given by the set of observations, and therefore ˆθ(k)
lies in the space generated by Y − 1k. The minimum-mean square error estimator
is such that the estimation error is minimized. From the ﬁgure it is evident that
the error is minimum when ˆθ(k) is the orthogonal projection of θ in the space
11


## Page 13

spanned by Y k
1 . Therefore, the estimation error ˜θ(k) is orthogonal to the space of
the observations, as expressed in (3.18).
The results derived so far, made no assumptions on the type of the probability
density functions involved. In the next subsection the previous results are partic-
ularized for the Gaussian case.
3.3 Particularization for Gaussian Random Vectors
The Result 3.2.1 is valid for any joint distribution of θ and Y k
1 , i.e., it does not
particularize the joint pdf of these variables.
It is well known from the research community dealing with estimation and
ﬁltering theory that many results simplify when assuming that the involved vari-
ables are Gaussian. This subsection discusses the simpliﬁcations resulting from
considering that θ and Y k
1 in Result 3.2.1 are jointly Gaussian.
Result 3.3.1 If θ e Y k
1 are jointly Gaussian random vectors, then,
E[θ|Y k
1 ] = E[θ] + RθY k
1
R−1
Y k
1
[Y k
1 − E[Y k
1 ]], (3.19)
where
RθY k
1
= E[(θ − E(θ))(Y k
1 − E(Y k
1 )T ], (3.20)
RY k
1 Y k
1
= E[(Y k
1 − E(Y k
1 ))(Y k
1 − E(Y k
1 )T ]. (3.21)
The previous result is very important. It states that, when θ e Y k
1 are jointly
Gaussian, the estimatior ofθthat minimizes the conditional mean-square error is a
linear combination of the observations. In fact, note that (3.19) may be rewritten
as
E[θ|Y k
1 ] = f (E(θ), E (Y k
1 )) +
k∑
i=1
WiYi, (3.22)
making evident the linear combination of the observations involved.
When θ and Y k
1 , are not jointly Gaussian then, in general terms, E[θ|Y k
1 ] is a
non linear function of the observations.
Result 3.3.2 In the situation considered in Result 3.3.1, ˆθ(k) is an unbiased esti-
mate of θ, i.e.,
E[ˆθ(k)] = E[θ]. (3.23)
12


## Page 14

Result 3.3.3 In the situation considered in Result 3.3.1, ˆθ(k) is a minimum vari-
ance estimator.
Result 3.3.4 In the situation considered in Result 3.3.1, ˆθ(k) and ˜θ(k) are jointly
distributed Gaussian random vectors.
For the proofs of the three previous results see [5]. A result, related with
Result 3.3.1, is now presented.
Result 3.3.5 Consider that θ e Y k
1 are not jointly Gaussian, but E[θ], E[Y k
1 ],
RY k
1 Y k
1
and RθY k
1
are known. Then, the linear estimator that minimizes the mean
square error is (still) given by
ˆθ(k) = E[θ] + RθY k
1
R−1
Y k
1
(
Y k
1 − E[Y k
1 ]
)
. (3.24)
Note that the minimization in Result 3.3.5 is subject to the constraint of having
a linear estimator while in Result 3.3.1 no constraint is considered. If the linear
estimator constraint in Result 3.3.5 was not considered, the minimum mean square
error estimator will generally yield an estimate ˆθ(k) as a non-linear function of
the observations.
13


## Page 15

Chapter 4
The Kalman Filter
Section 2 presented the ﬁltering problem for a general nonlinear system dynamics.
Consider now that the system represented in Figure 2.1 has a linear time-varying
dynamics, i.e., that (2.1)-(2.2) particularizes to,
xk+1 = Akxk + Bkuk + Gwk k ≥ 0 (4.1)
yk = Ckxk + vk (4.2)
where x(k) ∈ R n, u(k) ∈ R m, w(k) ∈ R n, v(k) ∈ R r, y(k) ∈ R r, {wk}and
{vk}are sequences of white, zero mean, Gaussian noise with zero mean
E[wk] = E[vk] = 0 , (4.3)
and joint covariance matrix
E
[( wk
vk
)
(wT
k vT
k )
]
=
[ Qk 0
0 Rk
]
. (4.4)
The initial state, x0, is a Gaussian random vector with mean
E[x0] = ¯x0 (4.5)
and covariance matrix
E[(x0 − ¯x0)(x0 − ¯x0)T ] = Σ 0. (4.6)
The sequence {uk}is deterministic.
14


## Page 16

The problem of state estimation was formulated in Section 2. It can also be
considered as the estimation of a random parameter vector, and therefore the re-
sults in Section 3 hold.
For the system (4.1)-(4.2), the Kalman ﬁlter is the ﬁlter that obtains the min-
imum mean-square state error estimate. In fact, when x(0) is a Gaussian vector,
the state and observations noises w(k) and v(k) are white and Gaussian and the
state and observation dynamics are linear,
1. the conditional probability density functions p(xk)|Y k
1 , U k−1
0 ) are Gaussian
for any k,
2. the mean, the mode, and the median of this conditional pdf coincide,
3. the Kalman ﬁlter, i.e., the ﬁlter that propagates the conditional pdfp(xk)|Y k
1 , U k−1
0 )
and obtains the state estimate by optimizing a given criteria, is the best ﬁlter
among all the possible ﬁlter types and it optimizes any criteria that might be
considered.
Let
p(xk)|Y k
1 , U k−1
0 ) ∼ N (ˆx(k|k), P (k|k)) (4.7)
represent the conditional pdf as a Gaussian pdf. The state estimate ˆx(k|k) is the
conditional mean of the pdf and the covariance matrix P (k|k) quantiﬁes the un-
certainty of the estimate,
ˆx(k|k) = E[x(k)|Y k
1 , U k−1
0 ]
P (k|k) = E[(x(k) − ˆx(k|k))(x(k) − ˆx(k|k))T |Y k
1 , U k−1
0 ].
Therefore, rather than propagating the entire conditional pdf, the Kalman ﬁlter
only propagates the ﬁrst and second moments. This is illustrated in Figure 4.1.
Subsection 4.1 derives the ﬁlter dynamics in terms of the mean and covariance
matrix of the conditional pdf, i.e., it shows how the ﬁlter propagates the mean and
the covariance matrix. This dynamics is recursive in the sense that to evaluate
ˆx(k + 1|k + 1), the Kalman ﬁlter only requires the previous estimate, ˆx(k|k) and
the new observation, y(k + 1).
4.1 Kalman Filter dynamics
When vk, wk and x0 are Gaussian vectors, the random vectors xk, xk+1, Y k
1 are
jointly Gaussian. As discussed before, the Kalman ﬁlter propagates the Gaussian
15


## Page 17

Figure 4.1: Propagation of the conditional pdf: General ﬁlter and Kalman ﬁlter
pdf p(xk)|Y k
1 , U k−1
0 ) and therefore the ﬁlter dynamics deﬁnes the general transi-
tion from p(xk)|Y k
1 , U k−1
0 ) to p(xk+1)|Y k+1
1 , U k
0 )
where both pdf are Gaussian and the input and observation information available
at time instant k and k+1 are displayed. Rather than being done directly, this tran-
sition is implemented as a two step-procedure, a prediction cycle and a ﬁltering or
update cycle, as represented in the diagram of Figure 4.2, where
Figure 4.2: Prediction and Filtering cyles in the Kalman Filter dynamics
16


## Page 18

Figure 4.3: Consecutive prediction and ﬁltering cycles on Kalman Filter dynamics
• p(xk+1|Y k
1 , U k
0 ), deﬁned for time instant k + 1, represents what can be said
about x(k + 1) before making the observation y(k + 1).
• The ﬁltering cycle states how to improve the information on x(k + 1) after
making the observation y(k + 1).
In summary, the Kalman ﬁlter dynamics results from a recursive application of
prediction and ﬁltering cycles, as represented in Figure 4.3.
Let
p(xk|Y k
1 , U k−1
0 ) ∼ N (ˆx(k|k), P (k|k)) (4.8)
p(xk+1|Y k
1 , U k
0 ) ∼ N (ˆx(k + 1|k), P (k + 1|k)) (4.9)
where ˆx(k|k) e ˆx(k + 1|k) are given by
ˆx(k|k) = E[x(k)|Y k
1 , U k−1
0 ] (4.10)
ˆx(k + 1|k) = E[x(k + 1)|Y k
1 , U k
0 ] (4.11)
and
P (k|k) = E[(xk − ˆx(k|k))(xk − ˆx(k|k))T |Y k
1 , U k−1
0 ] (4.12)
P (k + 1|k) = E[(xk+1 − ˆx(k + 1|k)(xk+1 − ˆx(k + 1|k))T |Y k
1 , U k
0 ].(4.13)
For the derivation of the ﬁlter’s dynamics, assume, at this stage, thatp(xk|Y k
1 , U k−1
0 ),
is known, i.e., ˆx(k|k) and P (k|k) are given.
Step 1: Evaluation of p(xk+1|Y k
1 , U k
0 ) State PREDICTION
17


## Page 19

This Gaussian pdf is completely characterized by the mean and covariance
matrix. Applying the mean value operator on both sides of (4.1), yields
E[xk+1|Y k
1 , U k
0 ] = AkE[xk|Y k
1 , U k
0 ]+BkE[uk|Y k
1 , U k
0 ]+GE[wk|Y k
1 , U k
0 ]. (4.14)
Taking (4.8) and (4.9) into account, considering that wk e Y k
1 are independent
random vectors and that wk has zero mean, we obtain:
ˆx(k + 1|k) = Ak ˆx(k|k) + Bkuk. (4.15)
Deﬁning the prediction error as
˜x(k + 1|k)
△
= x(k + 1) − ˆx(k + 1|k) (4.16)
and replacing in this expression the values of x(k + 1) and ˆx(k + 1|k) yields:
˜x(k + 1|k) = Akxk + Bkuk + Gkwk − Ak ˆx(k|k) − Bkuk = Ak ˜x(k|k) + Gkwk
(4.17)
where the ﬁltering error was deﬁned similarly to (4.16)
˜x(k|k)
△
= x(k) − ˆx(k|k). (4.18)
Given that ˜x(k|k) and wk are independent, from (4.17) we have
E[˜x(k + 1|k)˜x(k + 1|k)T |Y k
1 , U k
0 ] = AkE[˜x(k|k)|Y k
1 , U k
0 ]AT
k + GkQGT
k . (4.19)
Including in (4.19) the notations (4.12) and (4.13) results:
P (k + 1|k) = AkP (k|k)AT
k + GkQkGT
k . (4.20)
The predicted estimate of the system’s state and the associated covariance ma-
trix in (4.15) and (4.20), correspond to the best knowledge of the system’s state at
time instant k + 1 before making the observation at this time instant. Notice that
the prediction dynamics in (4.15) follows exactly the system’s dynamics in (4.1),
which is the expected result given that the system noise has zero mean.
Step 2: Evaluation of p(yk+1|Y k
1 , U k
0 ) Measurement PREDICTION
From (4.2), it is clear that
p(yk+1|Y k
1 , U k
0 ) = p(Ck+1xk+1 + vk+1|Y k
1 , U k
0 ) (4.21)
18


## Page 20

and thus, as this is a Gaussian pdf, the predicted measurement is given by
ˆy(k + 1|k) = E[yk+1|Y k
1 , U k
0 ] = Ck+1 ˆxk+1|k. (4.22)
Deﬁning the measurement prediction error as
˜y(k + 1|k)
△
= yk+1 − ˆy(k + 1|k), (4.23)
and replacing the values of y(k + 1) and ˆy(k + 1|k) results:
˜y(k + 1|k) = Ck+1 ˆx(k + 1|k) + vk+1. (4.24)
Therefore, the covariance matrix associated to (4.24) is given by
P˜y(k + 1|k) = Ck+1P (k + 1|k)C T
k+1 + Rk. (4.25)
Multiplying xk+1 on the right by ˜y(k + 1|k)T and using (4.24) we obtain:
xk+1 ˜yT (k + 1|k) = xk+1 ˆx(k + 1|k)T C T
k+1 + xk+1vT
k+1
from where
E[xk+1 ˜yT (k + 1|k)] = P (k + 1|k)C T
k+1. (4.26)
Given the predicted estimate of the state at time instant k + 1 knowing all the
observations until k, ˆx(k+1|k) in (4.15), and taking into account that, in the linear
observation dynamics (4.2) the noise has zero mean, it is clear that the predicted
measurement (4.22) follows the same observation dynamics of the real system.
Step 3: Evaluation of p(xk+1|Y k+1
1 , U k
0 ) FILTERING
To evaluate the conditional mean of xk+1 note that
Y k+1
1 e {Y k
1 , ˜y(k + 1|k)}
are equivalent from the view point of the contained information. Therefore,
E[xk+1|Y k+1
1 , U k
0 ] = E[xk+1|Y k
1 , ˜y(k + 1|k), U k
0 ]. (4.27)
On the other hand, Y k
1 and ˜y(k + 1 |k) are independent (see Corollary 3.2.1 in
Section 3) and therefore
ˆx(k + 1|k + 1) = E[x(k + 1)|Y k
1 ] + E[xk+1, ˜yT (k + 1|k)P −1
˜y(k+1|k) ˜y(k + 1|k)
19


## Page 21

which is equivalent to,
ˆx(k+1|k+1) = ˆx(k+1|k)+P (k+1|k)C T
k+1[Ck+1P (k+1|k)C T
k+1+R]−1[y(k+1)−Ck+1 ˆx(k+1|k)]
(4.28)
Deﬁning the Kalman gain as
K(k + 1) = P (k + 1|k)C T
k+1[Ck+1P (k + 1|k)C T
k+1 + R]−1 (4.29)
equation (4.28) may be rewritten as
ˆx(k+1|k+1) = ˆx(k+1|k)+P (k + 1|k)CT
k+1[Ck+1P (k + 1|k)CT
k+1 + R]−1
  
K(k+1
[y(k + 1) − Ck+1 ˆx(k+1|k)]  
ˆy(k+1|k)
(4.30)
ˆx(k + 1|k + 1) = ˆx(k + 1|k) + K(k + 1)[y(k + 1) − Ck+1 ˆx(k+1|k)] (4.31)
from where we can conclude that, the ﬁltered state estimate is obtain from the
predicted estimate as,
ﬁltered state estimate = predicted state estimate + Gain * Error
The Gain is the Kalman gain deﬁned in (4.29). The gain multiplies the error. The
error is given by [y(k + 1) − Ck+1 ˆx(k+1|k)], i.e., is the difference between the real
measurement obtained at time instant k + 1 and measurement prediction obtained
from the predicted value of the state. It states the novelty or the new information
that the new observationy(k + 1)brought to the ﬁlter relative to the statex(k + 1).
Deﬁning the ﬁltering error as,
ˆx(k + 1|k + 1)
△
= x(k + 1) − ˆx(k + 1|k + 1)
and replacing in (4.28) yields:
˜x(k+1|k+1) = ˜x(k+1|k)−P (k+1|k)C T
k+1[Ck+1Pk+1|kC T
k+1+R]−1[Ck+1 ˜x(k+1|k)+vk+1]
from where
P (k+1|k+1) = P (k+1|k)−P (k+1|k)C T
k+1[Ck+1Pk+1|kC T
k+1+R]−1Ck+1P (k+1|k).
(4.32)
Summary:
Prediction :
20


## Page 22

ˆx(k + 1|k) = Ak ˆx(k|k) + Bkuk (4.33)
P (k + 1|k) = AkP (k|k)AT
k + GkQGT
k (4.34)
Filtering
ˆx(k|k) = ˆ x(k|k − 1) + K(k)[y(k) − Ck ˆxk|k−1] (4.35)
K(k) = P (k|k − 1)C T
k [CkP (k|k − 1)C T
k + R]−1] (4.36)
P (k|k) = [ I − K(k)CkP (k|k − 1) (4.37)
Initial conditions
ˆx(0| −1) = ¯x0 (4.38)
P (0| −1) = Σ 0 (4.39)
Figure 4.4: Block diagram of the Kalman ﬁlter
Figure 4.4 presents the block diagram of the Kalman ﬁlter. We list a number
of important properties of the Kalman Filter:
• the Kalman Filter is a linear, discrete time, ﬁnite dimensional time-varying
system, whose inputs are the system inputs, uo, u 1, . . . , u k−1, and the
system measurements, y0, y 1, . . . , y k. The output is the process ˆx(k|k − 1)
or ˆx(k|k),
• The conditional error covariance matrix
P (k|k − 1) = E[(x(k) − ˆx(k|k − 1) (x(k) − ˆx(k|k − 1))T |Y k−1
1 , U k−1
0
21


## Page 23

is actually independent of Y k−1
1 , which means that no one set of measure-
ments helps any more than other to eliminate some uncertainty about x(k).
The ﬁlter gain, K(k) is also independent of Y k−1
1 . Because of this, the error
covariance P (k|k − 1) and the ﬁlter gain K(k) can be computed before the
ﬁlter is actually run. This is not generally the case in nonlinear ﬁlters.
Some other useful properties will be discussed in the following sections.
4.2 One-step ahead prediction dynamics
Using simultaneously (4.33) and (4.35) the ﬁlter dynamics is written in terms of
the state predicted estimate,
ˆx(k + 1|k) = Ak[I − K(k)Ck]ˆx(k|k − 1) + Bkuk + AkK(k)yk (4.40)
with initial condition
ˆx(0| −1) = ¯x0 (4.41)
where,
K(k) = P (k|k − 1)CT
k [CkP (k|k − 1)CT
k + R]−1 (4.42)
P (k + 1|k) = AkP (k|k − 1)AT
k − A(k)K(k)CkP (k|k − 1)A(k)T + GkQGT
k(4.43)
P (0| −1) = Σ o (4.44)
Equation (4.44) may be rewritten differently by replacing the gain K(k) by its
value given by (4.42),
P (k+1|k) = AkP (k|k−1)AT
k +GkQGT
k −AkP (k|k−1)CT
k [CkP (k|k−1)CT
k +R]−1CkP (k|k−1)AT
k
(4.45)
or else,
P (k+1|k) = AkP (k|k−1)AT
k +GkQGT
k −AkK(k)[CkP (k|k−1)C T
k +R]K T (k)AT
k .
(4.46)
which is a Riccati equation.
From the deﬁnition of the predicted and ﬁltered errors in (4.16) and (4.18),
and the above recursions, it is immediate that
˜x(k + 1|k) = Ak ˜x(k|k) + Gkwk (4.47)
˜x(k|k) = [ I − K(k)Ck]˜x(k|k − 1) − K(k)vk (4.48)
22


## Page 24

Figure 4.5: Block diagram of the Kalman ﬁlter prediction dynamics
from where it is possible to write the dynamics of the one-step prediction error,
˜x(k + 1|k) = Ak[I − K(k)Ck]˜x(k|k − 1) − AkK(k)vk + Gkwk. (4.49)
Evaluating the mean of the above equation, and taking into account that wk and
vk are zero mean sequences, yields,
E[˜x(k + 1|k)] = Ak[I − K(k)Ck]E[˜x(k|k − 1)]. (4.50)
showing that it satisﬁes an homogeneous dynamics.
The one step-ahead prediction dynamics of the Kalman ﬁlter is represented in
Figure 4.5.
4.3 Kalman ﬁlter dynamics for a linear time-invariant
system
Consider now that the linear system (4.1)-(4.2) is time-invariant, i.e. Ak = A,
Bk = B, Gk = G, Ck = C, ∀k ≥ 0, and that Qk = Q, Rk = R, i.e.,
xk+1 = Axk + Buk + Gwk k ≥ 0 (4.51)
yk = Cx k + vk (4.52)
with wk and vk mutually independent sequences of zero mean white Gaussian
noise with joint covariance matrix
E
[( wk
vk
)
(wT
k vT
k )
]
=
[ Q 0
0 R
]
. (4.53)
23


## Page 25

The initial condition, x(0) is Gaussian with mean ¯x0 and covariance Σ 0.
The Kalman ﬁlter dynamics is obtained by the particularization of the general
time-varying dynamics for the time-invariant situation, i.e.,
ˆx(k + 1|k) = Aˆx(k|k − 1) + Buk + K(k)[yk − C ˆxk|k−1] (4.54)
K(k) = P (k|k − 1)C T [CP (k|k − 1)C T + R]−1 (4.55)
P (k + 1|k) = AP (k|k − 1)AT + GQGT − AK(k)[CP (k|k − 1)C T + R]K T (k)A
(4.56)
Note that, even though the original system is time-invariant, the Kalman Filter is
a time-varying linear system, given that in (4.54) the Kalman gain is a function
of k.
Equation (4.56) is known as a discrete Riccati equation. In the sequel, we
discuss the conditions under which the Riccati equation converges.
Under certain conditions, detailed in the following subsection, the Kalman
gain converges to a steady-state value. The corresponding ﬁlter is known as the
steady-state Kalman ﬁlter.
4.4 Steady-state Kalman ﬁlter
Consider the system dynamics (4.51)-(4.52) and assume the following additional
assumptions:
1. The matrix Q = QT > 0, i.e., is a positive deﬁnite matrix,
2. The matrix R = RT > 0, i.e., is a positive deﬁnite matrix,
3. The pair (A, G ) is controllable, i.e.,
rank[G |AG |A2G |. . . |An−1G] = n,
4. The pair (A, C ) is observable, i.e.,
rank[C T |AT C T |AT 2
C T |. . . |AT n−1
C T ] = n.
Result 4.4.1 Under the above conditions,
24


## Page 26

1. The prediction covariance matrix P (k|k−1) converges to a constant matrix,
lim
k→∞
P (k|k − 1) = ¯P
where ¯P is a symmetric positive deﬁnite matrix, P = P T > 0.
2. ¯P is the unique positive deﬁnite solution of the discrete algebraic Riccati
equation
¯P = A ¯P AT − A ¯P CT [C ¯P CT + R]−1C ¯P AT (4.57)
3. ¯P is independent of Σ 0 provided that Σ 0 ≥ 0.
Proof: see [2].
As a consequence of Result 4.4.1, the ﬁlter gain in (4.55) converges to
¯K = lim
k→∞
K(k) = ¯P CT [C ¯P CT + R]−1 (4.58)
i.e., in steady-state the Kalman gain is constant and the ﬁlter dynamics is time-
invariant.
4.5 Initial conditions
In this subsection we discuss the initial conditions considered both for the system
and for the Kalman ﬁlter. With no loss of generality, we will particularize the
discussion for null control inputs, uk = 0.
System
Let { xk+1 = Axk + Gwk, k ≥ 0
yk = Cx k + vk
(4.59)
where
E[x0] = ¯ x0 (4.60)
Σ 0 = E[(x0 − ¯x0)(x0 − ¯x0)T ] (4.61)
and the sequences {vk}and {wk}have the statistical characterization presented in
Section 2.
25


## Page 27

Applying the mean value operator to both sides of (4.59) yields
E[xk+1] = AE[xk]
whose solution is
E[xk] = Ak ¯x0. (4.62)
Thus, if ¯x0 ̸= 0 , {xk}is not a stationary process. Assume that the following hy-
pothesis hold:
Hypothesis: x0 = 0
The constant variation formula applied to (4.59) yields
x(l) = Al−kx(k) +
l−1∑
j=k
Al−1−jGwj. (4.63)
Multiplying (4.63) on the right by xT (k) and evaluating the mean value, results:
E[x(l)xT (k)] = Al−kE[x(k)x(k)T ], l ≥ k.
Consequently, for x(k) to be stationary, E[x(l)xT (k)] should not depend on k.
Evaluating E[x(k)x(k)T ] for increasing values of k we obtain:
E[x(0)x(0)T ] = Σ 0 (4.64)
E[x(1)x(1)T ] = E[(Ax(0) + Gw(0))(xT (0)AT + wT (0)GT )] = AΣ 0AT + GQGT(4.65)
E[x(2)x(2)T ] = AE[(x(1)x(1)T ]AT + GQGT = A2Σ 0A2T
+ AGQGT AT + GQGT(4.66)
from where
E[x(k)x(k)T ] = AE[(x(k − 1)x(k − 1)T ]AT + GQGT . (4.67)
Therefore, the process {xk}is stationary if and only if
Σ 0 = AΣ 0AT + GQGT .
Remark, however, that this stationarity condition is not required for the applica-
tion of the Kalman ﬁlter nor it degrades the ﬁlter performance.
Kalman ﬁlter
26


## Page 28

The ﬁlter initial conditions, given, for example, in terms of the one-step pre-
diction are:
ˆx(0 | −1) = ¯ x0 (4.68)
P (0 | −1) = Σ 0, (4.69)
which means that the ﬁrst state prediction has the same statistics as the initial
condition of the system. The above conditions have an intuitive explanation.In
the absence of system measurements (i.e., formally at time instant k = −1), the
best that can be said in terms of the state prediction at time instant 0 is that this
prediction coincides with the mean value of the random vector that is the system
initial state.
As will be proved in the sequel, the choice of (4.68) and (4.69) leads to un-
biased state estimates for all k. When the values of ¯x0 and Σ 0 are not a priori
known, the ﬁlter initialization cannot reﬂect the system initial conditions. A pos-
sible choice is
ˆx(0 | −1) = 0 (4.70)
P (0 | −1) = P0 = αI. (4.71)
4.6 Innovation Process
The process
e(k) = y(k) − ˆy(k|k − 1) (4.72)
is known as the innovation process. It represents the component of y(k) that can-
not be predicted at time instant k − 1. In other others, it represents the innovation,
the novelty that y(k) brings to the system at time instant k. This process has some
important characteristics, that we herein list.
Property 4.6.1 The innovation process has zero mean.
Prof:
E[e(k)] = E[y(k) − ˆy(k|k − 1)]
= E[Cx(k) + v(k) − C ˆx(k|k − 1)]
= CE [˜x(k|k − 1)]
27


## Page 29

given that {vk}is zero mean. For a time-invariant system, the prediction error dy-
namics is given by (4.50) that is a homogeneous dynamics. The same conclusion
holds for a time-invariant system. For k = 0, E[˜x(0| −1)] = 0 given that
E[˜x(0| −1)] = E[x0] − ˆx(0| −1)
and we choose ˆx(0| − 1) = ¯ x0 (see 4.38). Therefore, the mean value of the
prediction error is zero, and in consequence, the innovation process has zero mean.
2
The above proof raises a comment relative to the initial conditions chosen for
the Kalman ﬁlter. According to (4.50) the prediction error has a homogeneous
dynamics, and therefore an initial null error leads to a null error for every k. If
ˆx0|−1 ̸= ¯x0 the initial prediction error is not zero. However, under the conditions
for which there exists a steady solution for the discrete Riccati equation, the error
assimptotically converges to zero.
Property 4.6.2 The innovation process is white.
Proof: In this proof we will consider that ˆx0|−1 = ¯x0, and thus E[e(k)] = 0 , i.e.,
the innovation process is zero mean. We want to prove that
E[e(k)eT (j)] = 0
for k ̸= j. For simplicity we will consider the situation in which j = k + 1; this
is not the entire proof, but rather a ﬁrst step towards it. From the deﬁnition of the
innovation process, we have :
e(k) = C ˜x(k|k − 1) + vk
and thus
E[e(k)eT (k + 1)] = CE [˜x(k|k − 1)˜x(k + 1|k)]C T + CE [˜x(k|k − 1)vT
k+1]
+E[vk ˜xT (k + 1|k)]C T + E[vkvT
k+1] (4.73)
As {vk} has zero mean and is a white process, the second and fourth terms in
(4.73) are zero. We invite the reader to replace (4.33) and (4.35) in the above
equality and to conclude the demonstration.
Property 4.6.3
E[e(k)eT (k)] = CP (k|k − 1)C T + R
Property 4.6.4
lim
k→∞
E[e(k)eT (k)] = C ¯P CT + R
28


## Page 30

4.7 The Kalman ﬁlter dynamics and the error ellip-
soids
In previous subsections we demonstrate that,
p(x(k + 1)|Y k
1 , U k
0 ) ∼ N (ˆx(k + 1|k), P (k + 1|k))
p(x(k + 1)|Y k+1
1 , U k
0 ) ∼ N (ˆx(k + 1|k + 1), P (k + 1|k + 1)).
Moreover, according to known results on Gaussian random vectors, [9] it is known
that
[x(k + 1) − ˆx(k + 1|k)]T P (k + 1|k)−1[x(k + 1) − ˆx(k + 1|k)] ≤ K
[x(k + 1) − ˆx(k + 1|k + 1)]T P (k + 1|k + 1)−1[x(k + 1) − ˆx(k + 1|k + 1)] ≤ K
represent contours of equal probability of the random variable around its mean
value.
All the pdf involved in the Kalman ﬁlter are Gaussian, and therefore, associ-
ated with the ﬁlter dynamics, we may consider the corresponding locus of equal
probability around the predicted and estimated values of the state, that constitute
the mean of the conditional pdf that the ﬁlter propagates.
Figures 4.6 and 4.7 illustrate that interpretation. In these ﬁgures the ellipses
represent the contour of equal probability (in the particular case of second order
Gaussian random variables) around the mean, the dashes lines corresponds to the
actual ﬁlter dynamics that involves the mean values and the solid lines represent
the exact values of the random variables (the ones that the ﬁlter estimates).
29


## Page 31

Figure 4.6: Error ellipsoid propagation in the Kalman ﬁlter prediction cycle
Figure 4.7: Error ellipsoid propagation in the Kalman ﬁlter ﬁltering cycle
30


## Page 32

Chapter 5
The Extended Kalman Filter
In this section we address the ﬁltering problem in case the system dynamics (state
and observations) is nonlinear. With no loss of generality we will consider that
the system has no external inputs. Consider the non-linear dynamics
xk+1 = fk(xk) + wk (5.1)
yk = hk(xk) + vk (5.2)
where,
xk ∈ R n, f k(xk) : Rn, − → R n
yk ∈ R r hk(xk) : Rn − → R r
vk ∈ R r
wk ∈ R n
(5.3)
and {vk}, {wk} are white Gaussian, independent random processes with zero
mean and covariance matrix
E[vkvT
k ] = Rk, E [wkeT
k ] = Qk (5.4)
and x0 is the system initial condition considered as a Gaussian random vector,
x0 ∼ N (x0, Σ 0).
Let Y k
1 = {y1, y 2, . . . , y k}be a set of system measurements. The ﬁlter’s goal is
to obtain an estimate of the system’s state based on these measurements.
As presented in Section 2, the estimator that minimizes the mean-square error
evaluates the condition mean of the pdf of xk given Y k
1 . Except in very partic-
ular cases, the computation of the conditional mean requires the knowledge of
31


## Page 33

the entire conditional pdf. One of these particular cases, referred in Section 4, is
the one in which the system dynamics is linear, the initial conditional is a Gaus-
sian random vector and system and measurement noises are mutually independent
white Gaussian processes with zero mean. As a consequence, the conditional pdf
p(x(k) |Y k
1 ), p(x(k + 1) |Y k
1 ) and p(x(k + 1) |Y k+1
1 ) are Gaussian.
With the non linear dynamics (5.1)-(5.2), these pdf are non Gaussian. To
evaluate its ﬁrst and second moments, the optimal nonlinear ﬁlter has to propagate
the entire pdf which, in the general case, represents a heavy computational burden.
The Extended Kalman ﬁlter (EKF) gives an approximation of the optimal es-
timate. The non-linearities of the systems’s dynamics are approximated by a lin-
earized version of the non-linear system model around the last state estimate. For
this approximation to be valid, this linearization should be a good approximation
of the non-linear model in all the uncertainty domain associated with the state
estimate.
Figure 5.1: Extented Kalman ﬁlter dynamic concept
Figure 5.1 represents one cycle of consecutive prediction and ﬁltering updates
with the consecutive pdf transitions,
p(xk|Y k
1 , U k−1
0 ) − → p(xk+1|Y k
1 , U k
0 ) − → p(xk+1|Y k+1
1 , U k
0 )
Rather than propagating the non Gaussian pdf, the Extended Kalman ﬁlter consid-
ers, at each cycle, a linearization of the non-linear dynamics (5.1)-(5.2) around the
last consecutive predicted and ﬁltered estimates of the state, and for the linearized
dynamics, it applies the Kalman Filter.
One iteration of the EKF is composed by the following consecutive steps:
32


## Page 34

1. Consider the last ﬁltered state estimate ˆx(k|k),
2. Linearize the system dynamics, xk+1 = f (xk) + wk around ˆx(k|k),
3. Apply the prediction step of the Kalman ﬁlter to the linearized system dy-
namics just obtained, yielding ˆx(k + 1|k) and P (k + 1|k),
4. Linearize the observation dynamics, yk = h(xk) + vk around ˆx(k + 1|k),
5. Apply the ﬁltering or update cycle of the Kalman ﬁlter to the linearized
observation dynamics, yielding ˆx(k + 1|k + 1) and P (k + 1|k + 1).
Let F (k) and H(k) be the Jacobian matrices of f (. ) and h(. ), denoted by
F (k) = ▽ fk |ˆx(k|k)
H(k + 1) = ▽ h |ˆx(k+1|k)
The Extended Kalman ﬁlter algorithm is stated below:
Predict Cycle
ˆx(k + 1|k) = fk(ˆx(k|k))
P (k + 1|k) = F (k)P (k|k)F T (k) + Q(k)
Filtered Cycle
ˆx(k + 1|k + 1) = ˆ x(k + 1|k) + K(k + 1)[yk+1 − hk+1(ˆx(k + 1|k))]
K(k + 1) = P (k + 1|k)H T (k + 1)[H(k + 1)P (k + 1|k)H T (k + 1) + R(k + 1)]−1
P (k + 1|k + 1) = [ I − K(k + 1)H(k + 1)]P (k + 1|k)
It this important to state that the EKF is not an optimal ﬁlter, but rathar it is
implemented based on a set of approximations. Thus, the matrices P (k|k) and
P (k + 1|k) do not represent the true covariance of the state estimates.
Moreover, as the matrices F (k) and H(k) depend on previous state estimates
and therefore on measurements, the ﬁlter gain K(k) and the matrices P (k|k) and
P (k + 1|k) cannot be computed off-line as occurs in the Kalman ﬁlter.
Contrary to the Kalman ﬁlter, the EKF may diverge, if the consecutive lin-
earizations are not a good approximation of the linear model in all the associated
uncertainty domain.
33


## Page 35

5.1 Derivation of Extended Kalman Filter dynamics
This subsection presents the formal derivation of the EKF dynamics.
Prediction
Assume that p(xk |Y k
1 ) is a Gaussian pdf with mean ηn
F
1 and covariance
matrix V n
F , i.e.,
p(xk |Y k
1 ) ∼ N (xk − ηk
F , V k
F ) = N (xk − ˆx(k|k), P (k|k)). (5.5)
From the non-linear system dynamics,
xk+1 = fk(xk) + wk, (5.6)
and the Bayes law, the conditional pdf of xk+1 given Y k
1 is given by
p(xk+1 |Y k
1 ) =
∫ ∞
−∞
p(xk+1 |xk)p(xk |Y k
1 )dxk,
or also,
p(xk+1 |Y k
1 ) =
∫ ∞
−∞
pwk(xk+1 − fk(xk))p(xk |Y k
1 )dxk (5.7)
where
pwk (xk+1 − fn(xk)) = 1
(2π)n/ 2[detQk]1/ 2 exp[− 1
2 (xk+1 − fk(xk))T Q−1
k (xk+1 − fk(xk))].
(5.8)
The previous expression is not a Gaussian pdf given the nonlinearity in xk.
We will linearize fk(xk) in (5.6) around ηk
F = ˆx(k |k) negleting higher order
terms, this yielding
fk(xk) ∼= fk(ηk
F ) + ▽ fk |ηk
F
·[xk − ηk
F ]
=
sk
  
fk(ηk
F ) − ▽ fk |ηk
F
·ηk
F + ▽ fk |ηk
F
·xk. (5.9)
where ▽ fk is the Jacobian matrix of f (. ),
▽ fk = ∂f (x(k))
∂x(k) |ηk
F
1F - refers ﬁltering
34


## Page 36

With this linearization, the system dynamics may be written as:
xk+1 = ▽ fk |ηk
F
·xk + wk + [fk(ηk
F ) − ▽ fk |ηk
F
·ηk
F
  
sk
] (5.10)
or, in a condensed format,
xk+1 = ▽ fk |ηk
F
·xk + wk + sk (5.11)
Note that (5.11) represents a linear dynamics, in which sk is known, has a null
conditional expected value and depends on previous values of the state estimate.
According to (5.9) the pdf in (5.7) can be written as:
p(xk+1 |Y k
1 ) =
∫ ∞
−∞
pwk (xk+1 − ▽ fk |ηk
F
·xk − sk) ·p(xk |Y k
1 )dxk
=
∫ ∞
−∞
N (xk+1 − ▽ fk |ηk
F
·xk − sk, Q k) · N(xk − ηk
F , V k
F )dxk
=
∫ ∞
−∞
N (xk+1 − sk − ▽ fk |ηk
F
·xk, Q k)N (xk − ηk
F , V k
F )dxk (5.12)
To simplify the computation of the previous pdf, consider the following variable
transformation
zk = ▽ fk ·xk. (5.13)
where we considered, for the sake of simplicity, the simpliﬁed notation ▽ fk to
represent ▽ fk |ηk
F
.
Evaluating the mean and the covariance matrix of the random vector (5.13)
results:
E[yk] = ▽ fk ·E[xk] = ▽ fk ·ηk
F (5.14)
E[ykyT
k ] = ▽ fk ·V k
F · ▽f T
k . (5.15)
From the previous result, the pdf of xk in (5.5) may be written as:
N (xk − ηk
F , V k
F ) =
1
(2π)n/ 2(detV k
F )1/ 2 exp[− 1
2 (xk − ηk
F )T (V k
F )−1(xn − ηk
F )] =
1
(2π)n/ 2(detV k
F )1/ 2 exp[− 1
2 (▽ fkxk − ▽ fk ·ηk
F )T (▽ f k
F )−T (V k
F )−1(▽ f k
F )−1(▽ fkxk − ▽ fkηk
F )] =
1
(2π)n/ 2(detV k
F )1/ 2 exp[− 1
2 (▽ fkxk − ▽ fkηk
F )T (▽ fk ·V k
F ▽ f T
k )−1(▽ fkxk − ▽ fkηk
F )] =
= det ▽ fk · 1
(2π)n/ 2(det ▽ fkV k
F ▽ f T
k )n/ 2
exp[− 1
2 (▽ fkxk − ▽ fkηk
F )T (▽ fkV k
F ▽ f T
k )−1(▽ fkxk − ▽ fkηk
F )].
35


## Page 37

We thus conclude that
N (xk − ηk
F , V k
F ) = det ▽ fk · N(▽ fkxk − ▽ fkηk
F , ▽ fkV k
F ▽ f T
k ). (5.16)
Replacing (5.16) in (5.12) yields:
p(xk+1 |Y k
1 ) =
=
∫∞
−∞ N (xk+1 − sk − ▽ fkxk, Q k)N (▽ fkxk − ▽ fkηk
F , ▽ fkV k
F ▽ f T
k )d(▽ fk ·xk)
= N (xk+1 − sk, Q k) ⋆ N (xk+1 − ▽ fk ·ηk
F , ▽ fkV k
F ▽ f T
k )
where ⋆ represents the convolution of the two functions. We ﬁnally conclude that,
p(xk+1 |Y k
1 ) = N (xk+1 − ▽ fk |ηk
F
·ηk
F − sk, Q k + ▽ fk |ηk
F
V k
F ▽ fk |T
ηk
F
(5.17)
We just conclude that,
if p(xk |Z k
1 ) is a Gaussian pdf with
1. mean ηn
F ,
2. covariance matrix V n
F
then, the linearization of the dynamics around ηn
F yields p(xk+1 |Z k
1 ), which is
a Gaussian pdf with
1. mean ηk+1
P
2. covariance matrix V k+1
P
where
ηk+1
P = ▽ fk |ηk
F
·ηk
F + fk(ηk
F ) − ▽ fk |ηk
F
·ηk
F (5.18)
or else, given the value of sk given in (5.10), can be simpliﬁed to
ηk+1
P = fk(ηk
F ) (5.19)
V k+1
P = Qk + ▽ fk |ηk
F
·V k
F · ▽f T
k |ηk
F
. (5.20)
These values are taken as the predicted state estimate and the associated co-
variance obtained by the EKF, i.e.,
ˆx(k + 1|k) = ηk+1
P (5.21)
P (k + 1|k) = = V k+1
P , (5.22)
representing the predicted dynamics,
36


## Page 38

ˆx(k + 1|k) = fk(ˆx(k|k)
P (k + 1|k) = ▽ fk |ηk
F
·P (k|k) · ▽f T
k |ηk
F
Filtering
In the ﬁltering cycle, we use the system measurement at time instant k + 1,
yk+1 to update the pdf p(xk+1 |Y k
1 ) as represented
p(xk+1 |Y k
1 )
yk+1
− → p(xk+1 |Y k+1
1 )
According to Bayes law,
p(xk+1 |Y k+1
1 ) = p(Y k
1 )
p(Y k+1
1 ) ·[p(yk+1 |xk+1) ·p(xk+1 |Y k
1 )]. (5.23)
Given that
yk+1 = hk+1(xk+1) + vk+1, (5.24)
the pdf of yk+1 conditioned on the state xk+1 is given by
p(yk+1 |xk+1) = 1
(2π)r/ 2(detRk+1)1/ 2 exp[− 1
2 (yk+1−hk+1(xk+1))T R−1
k+1(yk+1−hk+1(xk+1))].
(5.25)
With a similar argument as the one used on the prediction cycle, the previous pdf
may be simpliﬁed through the linearization of the observation dynamics.
Linearizing hk+1(xk+1) around ηk+1
P and neglecting higher order terms results
hk+1(xk+1) ≃ hk+1(ηk+1
P ) + ▽ h |ηk+1
P
(xk+1 − ηk+1
P ), (5.26)
and so the system observation equation may be approximated by,
yk+1 ≃ ▽ h |ηk+1
P
·xk+1 + vk+1 + rk+1 (5.27)
with
rk+1 = hk+1(ηk+1
P ) − ▽ h |ηk+1
P
·ηk+1
P . (5.28)
being a known term in the linearized observation dynamics, (5.27). After the
linearization around the predicted state estimate - that corresponds to ηk+1
P =
ˆxk+1|k (see (5.21), - the observation dynamics may be considered linear, and the
computation of p(yk+1 |xk+1) in (5.25) is immediate. We have,
p(yk+1 |xk+1) = N (yk+1 − rk+1 − ▽ hk+1 |ηk+1
P
·xk+1, R k+1). (5.29)
37


## Page 39

Expression (5.29) may be rewritten as:
p(yk+1 |xk+1) = N (▽ hk+1 |ηk+1
P
·xk+1 + rk+1 − yk+1, R k+1). (5.30)
Using a variable transformation similar to the one used in the prediction cycle, the
previous pdf may be expressed as
p(xk+1 |Y k
1 ) = det▽ h |ηk+1
P
N (▽ hk+1 |ηk+1
P
·xk+1−▽ hk+1 |ηk+1
P
·ηk+1
P , ▽ hk+1V k+1
P ▽ hT
k+1)
(5.31)
Multiplying expressions (5.30) and (5.31) as represented in the last product in
(5.23) yields:
p(yk+1|xk+1).p (xk+1|Y k
1 ) ∼ N (▽ hk+1 |ηk+1
P
·xk+1 − µ, V ) (5.32)
where the mean and covariance matrix are given by:
µ = ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1[−rk+1 + yk+1]
+Rk+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1 ▽ hk+1 ·ηk+1
P , (5.33)
V = ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1Rk+1. (5.34)
Replacing in (5.33) the expression (5.28) we obtain:
µ = ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
T ▽ hT
k+1 + Rk+1)−1 (5.35)
[−hk+1(ηk+1
P ) + ▽ hk+1 ·ηk+1
P + zk+1]
+Rk+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1 ▽ hk+1ηk+1
P
= ▽ hk+1ηk+1
P + ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1[yk+1 − hk+1(ηk+1
P )] ·(5.36)
V = ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1Rk+1 (5.37)
where we use the short notation
▽ hk+1 = ▽ hk+1 |ηk+1
P
. (5.38)
Note that (5.32) expresses the pdf of ▽ hk+1 |ηk+1
P
·xk+1 and not that of xk+1
as desired. In fact, the goal is to evaluate the mean and covariance matrix in
N (xk+1 − µ1, V 1). (5.39)
Note that (5.32) can be obtained from (5.39). We know that:
N (xk+1 − µ1, V 1) = det ▽ hk+1 · N(▽ hk+1xk+1 − ▽ hk+1µ1, ▽ hk+1V1 ▽ hT
k+1)
= det ▽ hk+1N (▽ hk+1xk+1 − µ, V ), (5.40)
38


## Page 40

where µ and V are given by (5.33) and (5.34).
Comparing (5.40) with (5.40) yields:
▽ hk+1µ1 = ▽ hk+1ηk+1
P + ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1[yk+1 − hk+1(ηk+1
P )]
µ1 = ηk+1
P + V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1[yk+1 − hk+1(ηk+1
P )].
We thus conclude that:
ηk+1
F = ηk+1
P + V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1[yk+1 − hk+1(ηk+1
P )].
(5.41)
Comparing (5.40) and (5.40) in terms of the covariance matrices, yields:
V = ▽ hk+1V1 ▽ hT
k+1. (5.42)
Replacing in this expression V by its value given by (5.37) result,
V = ▽ hk+1V k+1
P ▽ hT
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)−1Rk+1
= ▽ hk+1V k+1
F ▽ hT
k+1
that has to be solved relative to V k+1
F . From the above equalities, we successively
obtain:
▽ hk+1V k+1
P ▽ hT
k+1 = ▽ hk+1V k+1
F ▽ hT
k+1R−1
k+1(▽ hk+1V k+1
P ▽ hT
k+1 + Rk+1)
= ▽ hk+1V k+1
F ▽ hT
k+1R−1
k+1 ▽ hk+1V k+1
P ▽ hT
k+1 + ▽ hk+1V k+1
F ▽ hT
k+1
or else,
V k+1
P = V k+1
F ▽ hT
k+1R−1
k+1 ▽ hk+1V k+1
P + V k+1
F
V k+1
P = V k+1
F [I + ▽ hT
k+1R−1
k+1 ▽ hk+1V k+1
P ]
V k+1
F = V k+1
P [I + ▽ hT
k+1R−1
k+1 ▽ hk+1V k+1
P ]−1.
Using the lemma of the inversion of matrices,
V k+1
F = V k+1
P [I − ▽ hT
k+1R−1
k+1(I + ▽ hk+1V k+1
P ▽ hT
k+1R−1
k+1)−1 ▽ hk+1V k+1
P ]
= V k+1
P [I − ▽ hT
k+1[Rk+1 + ▽ hk+1V k+1
P ▽ hT
k+1]−1 ▽ hk+1V k+1
P ]
V k+1
F = V k+1
P − V k+1
P ▽ hT
k+1[Rk+1 + ▽ hk+1V k+1
P ▽ hT
k+1]−1 ▽ hk+1V k+1
P
(5.43)
Therefore, if we consider that p(xk+1|Y k
1 ) is a Gaussian pdf, have access
to the measurement yk+1 and linearize the system observation dynamics around
39


## Page 41

ηk+1
P = ˆx(k + 1|k) we obtain a Gaussian pdf p(xk+1 |Y k+1
1 ) with mean ηk+1
F and
covariance matrix V k+1
F given by (5.41) and (5.43), respectively.
Finally, we summarize the previous results and interpret the Extended Kalman
ﬁlter as a Kalman ﬁter applied to a linear time-varying dynamics.
Let:
ηk+1
P = ˆ x(k + |k)
V k+1
P = P (k + 1|k)
ηk+1
F = ˆ x(k + 1|k + 1)
V k+1
F = P (k + 1|k + 1)
and consider
▽ fk |ηk
F
= ▽ fk |ˆx(k|k)= F (k)
▽ hk+1 |ηk+1
P
= ▽ h |ˆx(k+1|k)= H(k + 1)
s(k) = fk(ˆx(k|k)) − F (k) ·ˆx(k|k)
r(k + 1) = hk+1(ˆx(k + 1|k)) − H(k + 1) ·ˆx(k + 1|k).
Assume the linear system in whose dynamics the just evaluated quantities are
included.
x(k + 1) = F (k)x(k) + wk + s(k) (5.44)
y(k + 1) = H(k + 1)x(k + 1) + vk+1 + r(k + 1) (5.45)
where wk and vk+1 are white Gaussian noises, s(k) and r(k) are known quantities
with null expected value.
The EKF applies the Kalman ﬁlter dynamics to (5.44)-(5.45), where the ma-
trices F (k) and H(k) depend on the previous state estimates, yielding
ˆx(k + 1|k) = fk(ˆx(k|k))
ˆx(k + 1|k + 1) = ˆ x(k + 1|k) + K(k + 1)[yk+1 − hk+1(ˆx(k + 1|k))]
where K(k + 1) is the ﬁlter gain and
K(k + 1) = P (k + 1|k)H T (k + 1)[H(k + 1)P (k + 1|k)H T (k + 1) + R(k + 1)]−1
P (k + 1|k) = F (k)P (k|k)F T (k) + Q(k)
P (k + 1|k + 1) = P (k + 1|k) − P (k + 1|k)H T (k + 1)
[H(k + 1)P (k + 1|k)H T (k + 1) + R(k + 1)]−1H(k + 1)P (k + 1|k)(5.46)
40


## Page 42

Expression (5.46) may be rewritten as:
P (k + 1|k + 1) = P (k + 1|n) × (5.47)
×[I − P (k + 1|n)H T (k + 1)[H(k + 1) + P (k + 1|k)H T (k + 1) + Rk+1]−1H(k + 1)](5.48)
P (k + 1|k + 1) = [ I − K(k + 1)H(k + 1)]P (k + 1|k) (5.49)
41


## Page 43

Bibliography
[1] Michael Athans, ”Dynamic Stochastic Estimation, Prediction and Smooth-
ing,” Series of Lectures, Spring 1999.
[2] T. Kailath, “Lectures Notes on Wiener and Kalman Filtering,” Springer-
Verlag, 1981.
[3] Thomas Kailath, Ali H. Sayed, Babak Hassibi, ” Linear Estimation,” Pren-
tice Hall, 2000.
[4] Peter S. Maybeck, ”The Kalman Filter: An Introduction to Concepts,” in
Autonomous Robot Vehciles, I.J. Cox, G. T. Wilfong (eds), Springer-Verlag,
1990.
[5] J. Mendel, “Lessons in Digital Estimation Theory”, Prentice-Hall, 1987.
[6] K. S. Miller, “Multidimensional Gaussian Distributions,” John Wiley &
Sons, 1963.
[7] J. M. F. Moura, “Linear and Nonlinear Stochastic Filtering,” NATO Ad-
vanced Study Institute, Les Houches, September 1985.
[8] A. Papoulis, “Probability, Random Variables and Stochastic Processes,”
McGraw-Hill, 1965.
[9] M. Isabel Ribeiro, “Gaussian Probability Density Functions: Properties and
Error Characterization,” Institute for Systems and Robotics, Technical Re-
port, February 2004.
[10] H. L. Van Trees, “Detection, Estimation and Modulation Theory,” John Wi-
ley & Sons, 1968.
42


## Page 44

ERRATA

The equation (4.37) has an error. The correct version is
P(k|k)=[I ‐ K(k)C]P(k|k ‐ 1)
Thanks to Sergio Trimboli that pointed out the error in a preliminary version

23.March.2008
