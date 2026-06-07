# Forthcoming inJournal of Econometrics Bellman filtering and smoothing for state-space models

Converted from: `Kalman Filter\Bellman Filtering.pdf`


## Page 1

Forthcoming inJournal of Econometrics
Bellman filtering and smoothing for state-space models
Rutger-Jan Lange ∗
Econometric Institute, Erasmus School of Economics, Rotterdam, Netherlands
November 29, 2023
Abstract
This paper presents a new filter for state-space models based on Bellman’s dynamic-programming princi-
ple, allowing for nonlinearity, non-Gaussianity and degeneracy in the observation and/or state-transition
equations. The resulting Bellman filter is a direct generalisation of the (iterated and extended) Kalman
filter, enabling scalability to higher dimensions while remaining computationally inexpensive. It can
also be extended to enable smoothing. Under suitable conditions, the Bellman-filtered states are stable
over time and contractive towards a region around the true state at every time step. Static (hy-
per)parameters are estimated by maximising a filter-implied pseudo log-likelihood decomposition. In
univariate simulation studies, the Bellman filter performs on par with state-of-the-art simulation-based
techniques at a fraction of the computational cost. In two empirical applications, involving up to 150
spatial dimensions or highly degenerate/nonlinear state dynamics, the Bellman filter outperforms com-
peting methods in both accuracy and speed.
JEL Classification Codes: C32, C53, C61
Keywords: dynamic programming, posterior mode, Kalman filter, particle filter
1 Introduction
1.1 State-space models
State-space models allow observations to be affected by an unobserved state that changes stochastically
over time. For discrete times t = 1, 2, . . . , n, the observation yt ∈ Rl is drawn from a conditional distribu-
tion, p(yt|αt), while the latent state αt ∈ Rm follows a first-order Markov process with a state-transition
density, p(αt+1|αt), and some initial condition, p(α1), i.e.
yt ∼ p(yt|αt), αt+1 ∼ p(αt+1|αt), α1 ∼ p(α1). (1)
∗I thank Wisse Rutgers for research assistance, Serena Ng for helpful editorial guidance, and the anonymous AE and two
referees for their valuable comments. Thansks are also due to Maksim Anisimov, Francisco Blasques, Leopoldo Catania,
Dick van Dijk, Simon Donker van Heel, Jippe van Dunn´ e, Dennis Fok, Maria Grith, Andrew Harvey, Christiaan Heij,
Elwin Kardux, Matthias Katzfuss, Onno Kleen, Erik Kole, Siem Jan Koopman, Rutger Lit, Rasmus Lonn, Andr´ e Lucas,
Robin Lumsdaine, Jan Maciejowski, Andrea Naghi, Jochem Oorschot, Richard Paap, Andreas Pick, Krzysztof Postek, Rogier
Quaedvlieg, Daniel Ralph, Bram van Os, Omiros Papaspiliopoulos, Marcel Scharth, Annika Schn¨ ucker, Ekaterina Smetanina,
Panos Toulis, Stephen Thiele, Nando Vermeer, Sebastiaan Vermeulen, Michel van der Wel, Martina Zaharieva, Mikhail
Zhelonkin and Chen Zhou. Finally, I thank participants of the 2021 North American summer meeting of the Econometric
Society and the 27th international conference on Computing in Economics and Finance for stimulating discussions.
1
arXiv:2008.11477v16  [stat.ME]  28 Nov 2023


## Page 2

Forthcoming inJournal of Econometrics
In a slight abuse of notation, p(·|·) and p(·) denote generic conditional and marginal densities; i.e. any
two p’s need not denote the same probability density function (e.g. Durbin and Koopman, 2000, p. 6).
For a given model, the functional form of all p’s is considered known. These densities may further depend
on a static (hyper)parameter ψ, which for notational simplicity is suppressed. They may also depend on
lags of yt or, more generally, any Ft−1-measurable variables, where Ft−1 denotes the information set at
time t − 1. This potential dependence on Ft−1 is likewise suppressed for the sake of readability. Both the
observation and state-transition densities may involve non-Gaussianity, nonlinearity and degeneracy.
Observations yt may take either continuous or discrete values inRl; in the case of discrete observations,
p(yt|αt) is interpreted as a probability rather than a density. Latent states are assumed to take continuous
values in Rm; hence, the state space can be viewed as ‘infinite dimensional’ even as m remains finite. This
is in contrast with Markov-switching models (also known as hidden Markov models; see e.g. K¨ unsch, 2001,
p. 109 and Fuh, 2006, p. 2026), in which the state takes a finite number of (discrete) values.
Myriad examples of model (1) can be found in engineering, biology, geological physics, economics and
mathematical finance (for a comprehensive overview, see K¨ unsch, 2001, or Doucet et al., 2001). Examples
in financial econometrics with continuous state spaces include models for count data (Singh and Roberts,
1992, Fr¨ uhwirth-Schnatter and Wagner, 2006), intensity (Bauwens and Hautsch, 2006), duration (Bauwens
and Veredas, 2004), volatility (Harvey et al., 1994, Ghysels et al., 1996, Jacquier et al., 2002, Taylor, 2008)
and dependence structure (Hafner and Manner, 2012).
Model (1) presents researchers and practitioners with three important problems: (a) filtering, (b)
smoothing and (c) parameter estimation. The filtering problem concerns the real-time estimation of the
current state αt conditional on the real-time data y1, . . . ,yt, where the static parameter ψ is considered
known. The smoothing problem concerns the ex-post estimation of all latent states α1, . . . ,αn conditional
on the full sample y1, . . . ,yn, still assuming that ψ is known. The parameter-estimation problem entails
determining the parameter ψ, where both this parameter and the latent states are assumed to be unknown.
The filtering and smoothing problems can be solved in closed form when model (1) is linear and
Gaussian. Kalman’s (1960) filter then computes the real-time expectation of the state (i.e. the mean)
and the most likely state (i.e. the mode), which are identical for these models (see Table 1). The Rauch,
Tung and Striebel (RTS, 1965) smoother, colloquially known as the ‘Kalman smoother’, computes ex-
post state estimates by complementing the (forward) Kalman filter with a subsequent backward recursion.
Parameter estimation is typically performed by numerically maximising the log-likelihood function, which
is known in closed form through the standard prediction-error decomposition (e.g Harvey, 1990, p. 126).
For the majority of state-space models, however, no exact methods are available for filtering, smoothing
or likelihood computation. Here I present an approximate filter and smoother for the general state-space
model (1), followed by an approximate parameter-estimation method. This paper thus addresses all three
problems mentioned above.
1.2 Primary contribution: Filtering and smoothing using Bellman’s equation
This article develops an approximate filter and smoother that are generally applicable and computa-
tionally efficient even in higher dimensions. My point of departure is the view that optimisation may
be computationally more attractive than integration—especially in higher dimensions. For this reason,
I consider a filter and smoother based not on the mean but on the mode, which is also known as the
maximum a posteriori (MAP) estimate (e.g. Koyama and Paninski, 2010, Liu and Ihler, 2013) or the
posterior mode (e.g Fahrmeir, 1992, Durbin and Koopman, 1997, Jungbacker and Koopman, 2007). In
2


## Page 3

Forthcoming inJournal of Econometrics
Table 1: Categorisation of filtering methods.
Discrete states Continuously varying states
Linear & Gaussian Nonlinear and/or non-Gaussian
Exact filters Exact filters Approximate filters
Mean Baum and Petrie (1966) Kalman (1960) Iterated extended KF (e.g. Anderson and Moore, 2012)
Hamilton (1989) Unscented KF (Julier and Uhlmann, 1997)
Masreliez (1975) filter
Numerical integration filter (Kitagawa, 1987)
Discretisation filter (Farmer, 2021)
Mode Viterbi (1967) Kalman (1960) Bellman filter (BF, this article)
Special cases of BF: Fahrmeir’s (1992) mode estimator
and Koyama et al.’s (2010) Laplace Gaussian filter
Note: The table should be considered indicative rather than exhaustive, and, for brevity, excludes simulation-based
approaches. KF = Kalman filter. BF = Bellman filter.
line with the literature, this approach relies on the assumption that the mode exists and is unique. This
assumption is not overly restrictive in practice, although it is possible to formulate models for which it
does not hold. 1
Computing the mode in real time using plain-vanilla optimisation methods is, however, computation-
ally cumbersome. A naive approach would be to re-estimate, at each time step t, all previous states of
dimension m, requiring us to continually solve m×t dimensional optimisation problems. Computing times
per time step then scale as O(m3t3), implying a cumulative computing effort, up to time t, of O(m3t4).
This escalating complexity over time may explain why the mode estimator has to date received scant
attention as a potential filtering method.
My proposed solution to this drawback is to apply Bellman’s (1957) dynamic-programming principle,
which yields a forward recursion in function space. The solution to this recursion at any time step is
referred to as the value function , which maps the state space Rm to values in R and summarises the
researcher’s knowledge of the state at time t. First, the argmax of the value function represents the
most likely state at time t conditional on y1, . . . ,yt; hence, it acts as our filtered state estimate. Second,
the negative Hessian matrix evaluated at the peak is indicative of the precision of this state estimate:
a ‘sharper’ peak corresponds to a more precise state estimate. Recursively solving Bellman’s equation
thus yields a feasible filtering method, producing at each time step both a filtered state and an associated
measure of uncertainty.
Importantly for the present purpose, computing the argmax of the value function entails maximisation
over a single state of dimension m for each time step. The required computing cost per time step remains
constant at O(m3). The resulting cumulative computational complexity over t time steps then amounts
to O(m3t), which is identical to that of the (information form of the) Kalman filter. On the one hand, the
computational complexity of O(t) means the Bellman filter can be classed as a filter in the strict sense of
the term. On the other, the complexity of O(m3) offers full scalability to higher dimensional state spaces;
e.g. up to 150 dimensions in the application in section 9.
The price we pay for this reduced computational complexity is that Bellman’s recursion generally
lacks an analytic solution; hence, we must resort to approximation, which can be viewed as a form of
approximate dynamic programming (e.g. Bertsekas, 2012). One possibility is to discretise the (continuous)
1E.g. when the observation equation reads yt = α2
t + εt with εt∼N(0, σ2
ε).
3


## Page 4

Forthcoming inJournal of Econometrics
state space Rm, forcing the state to take a finite number of (discrete) values. Bellman’s equation can then
be solved exactly, yielding Viterbi’s (1967) algorithm (see Table 1), which has proven highly successful
in engineering. However, this approach quickly becomes infeasible due to the curse of dimensionality
(K¨ unsch, 2001, p. 125, Liu, 2008, p. 29), as it requires the computation and storage ofN m values for each
time step, where N is the number of gridpoints in each of m spatial directions (e.g. N = 100 and m = 5
is infeasible).
Instead, I take inspiration from another exact solution to Bellman’s forward recursion. As it turns
out, Bellman’s recursion allows an exact solution if the entire model (1) is linear and Gaussian, yielding
Kalman’s (1960) filter. The solution to Bellman’s equation is then a function, rather than a finite-
dimensional object as in Viterbi’s case. This value function has a particularly simple form: it is multi-
variate quadratic at every time step, with a unique argmax that corresponds to Kalman’s filtered state.
Moreover, its negative Hessian matrix equals the inverse of the usual Kalman-filtered covariance matrix.
Hence, the Kalman filter represents an exact function-space solution to Bellman’s equation. This was long
recognised in the engineering literature (e.g. Whittle, 1996, ch. 12; Whittle, 2004) before finding its way
into the econometrics literature (Hansen and Sargent, 2013, ch. 8). Perhaps less widely known is the fact
that the RTS (1965) smoother similarly corresponds to an exact—also multivariate quadratic—solution
to a combination of Bellman’s forward and backward recursions (see section 6).
The basic premise of this article is that Bellman’s forward and backward recursions remain valid in
the context of the general state-space model (1). Motivated by the exact solutions leading to the Kalman
filter and RTS smoother, I deviate from the literature in exploring function-space approximations of value
functions rather than discretising. Computing at every time step some parametric approximation of the
value function yields a new class of (Bellman) filters and smoothers. Within the class of function-space ap-
proximations, I employ arguably the simplest non-trivial option: a multivariate quadratic function. This
quadratic approximation is exact for linear Gaussian models and—given that value functions in filtering
applications are typically smooth and possess global maxima—broadly applicable. The approximation
can also be viewed as a second-order Taylor expansion of a generic smooth value function. This simple
approximation approach yields immediate and novel extensions of the Kalman filter and smoother. The
main contribution of this article is the insight that using function-space rather than discrete approxima-
tions allows us to avoid the curse of dimensionality, leading to a new class of filters and smoothers that
are computationally frugal and turn out to be remarkably accurate.
1.3 Secondary contribution: Parameter estimation using likelihood approximation
To address the parameter-estimation problem, I deviate from the literature that relies on simulation-based
approaches (e.g. Malik and Pitt, 2011, Koopman et al., 2015, Koopman et al., 2016) by presenting a deter-
ministic and computationally efficient—albeit approximate—method based on the output of the Bellman
filter. While no formal guarantees are offered, an extensive simulation study (section 8) demonstrates
that the proposed estimator is no less accurate or efficient than (asymptotically exact) simulation-based
methods, while requiring a fraction of the computational cost. Establishing the asymptotic properties of
the estimator remains an open question.
Specifically, I propose to maximise an approximate version of the log-likelihood function that is im-
mediately computable from the output of the Bellman filter. First, the (exact) log-likelihood function
is decomposed into (a) the ‘fit’ of the Bellman-filtered states in view of the data, minus (b) the realised
Kullback-Leibler (KL, see Kullback and Leibler, 1951) divergence between filtered and predicted state
4


## Page 5

Forthcoming inJournal of Econometrics
densities. While the former is known in closed form, the latter typically is not—except in the case of
linear Gaussian state-space models, in which case it is multivariate quadratic. Second, I approximate
this KL divergence term using a multivariate quadratic term computed from the output of the Bellman
filter. The resulting pseudo log-likelihood function remains exact in the case of linear Gaussian models;
more generally, it can be viewed as a second-order approximation of the log-likelihood function. It can be
optimised using standard gradient-based numerical optimisers, making approximate parameter estimation
for the general state-space model (1) as simple and fast as maximum-likelihood estimation of the Kalman
filter.
1.4 Limitations of existing methods
Existing approaches to filtering, smoothing and parameter estimation can be classified as either approximation-
or simulation-based, each with their own disadvantages. First, approximate filtering methods (see Table 1)
tend to be specialised in their applications. The extended and unscented Kalman filters account for nonlin-
earity, but assume additive noise and maintain the normality assumption. Conversely, West (1981) relaxes
the normality assumption, while maintaining the linearity assumption. Masreliez’s (1975) filter is robust in
the case of heavy-tailed observation noise but, due to the need to approximate integrals, computationally
inefficient in higher dimensions. Similarly, numerical integration (Kitagawa, 1987) and other discretisation
methods (Farmer, 2021) are flexible in theory, but restricted in practice by the curse of dimensionality.
Fahrmeir’s (1992) method applies to observations drawn from an exponential distribution. Durbin and
Koopman (2000) and Koyama et al. (2010) mostly rely on a linear Gaussian state equation. M¨ uller and
Petalas (2010) assume that deviations of the latent state from its equilibrium value are small. In the
literature, no approximate filters seem to be available at the level of generality of model (1). Moreover,
the aforementioned approaches tend to neglect the smoothing and parameter-estimation problems.
Second, simulation-based methods such as particle filters are widely applicable and easy to implement
(for a textbook treatment, see e.g. Chopin and Papaspiliopoulos, 2020). However, the curse of dimension-
ality means that particle filters may struggle with high-dimensional state spaces (Surace et al., 2019). For
the same reason, the importance-sampling method by Koopman et al. (2015, 2016, 2017) has not been
applied in situations in which the state-space dimension exceeds two. Particle smoothing (as opposed
to filtering) tends to be even more computationally expensive, as the computational cost scales with the
number of particles squared (Kantas et al., 2015). Particle filters have also been applied to the parameter-
estimation problem, but this remains challenging (Liu and West, 2001, Kantas et al., 2015); e.g. Malik
and Pitt’s (2011) method applies only when the state space is one dimensional.
2 Main idea: Filtering using Bellman’s principle
The state-space model under consideration is given in equation (1). A realised path is denoted by
(y1, . . . ,yt)(ω) for every event ω ∈ Ω, where Ω denotes the event space of the underlying complete
probability space of interest, denoted (Ω , F , P). The logarithm of joint and conditional densities are writ-
ten using generic notation as ℓ(·, ·) := log p(·, ·) and ℓ(·|·) := log p(·|·), respectively, for potentially different
p’s. This section considers the filtering problem; any dependence on ψ is suppressed.
The joint log-likelihood function of the states and the data is written asL1:t(a1, . . . ,at) : Ω×Rm ×. . .×
Rm → R. Here, the data y1, . . . ,yt are considered fixed and known, as indicated by the subscript, while
the states a1, . . . ,at in Roman font are considered variables to be evaluated along any path. The true
5


## Page 6

Forthcoming inJournal of Econometrics
states α1, . . . ,αt in Greek font remain unknown. For the state-space model (1), the joint log likelihood
of the data and the states follows from the ‘probability chain rule’ (Godsill et al., 2004, p. 156):
L1:t(a1, . . . ,at) =
tX
i=1
ℓ(yi|ai) +
tX
i=2
ℓ(ai|ai−1) + ℓ(a1), t ≤ n. (2)
This joint log likelihood is, a priori, a random function of the observationsy1, . . . ,yt, even though the data
are considered known and fixed ex post. For clarity, I formalise the assumption that for some sufficiently
large t, there exists a unique sequence of states, denoted a1|t, . . . ,at|t, that maximise equation (2).
Assumption E (Existence of the mode) . There exists some t0 ≥ 1, such that for all t ≥ t0, the mode
(a1|t, a2|t, . . . ,at|t) exists and is unique, where
(a1|t, a2|t, . . . ,at|t) := arg max
(a1,a2,...,at)∈Rm×t
L1:t(a1, . . . ,at). (3)
This assumption is labelled “E” for existence, because it is required to underpin the main idea; later,
Assumption 1-3 (in section 5) are used to derive the theoretical properties of the filter.
As equation (3) illustrates, elements of the mode at time t are denoted by ai|t for i ≤ t, where i denotes
the state that is estimated, t the information set used. The entire solution is a collection of t vectors, each
of length m. Iterative solution methods for solving (3) were proposed in Durbin and Koopman (2000)
and So (2003). When the mode (3) is computed for each time step t ≥ t0, we can extract a sequence of
real-time state estimates {at|t}t≥t0, where each estimate at|t is extracted from a different mode (3).
As time progresses, however, the computation of filtered states{at|t}t becomes ever more complicated—
note that optimisation problem (3) involves m × t optimisation variables at each time t. Indeed, solving
problem (3) may become practically infeasible for large t. This raises the question whether it is possible
to proceed in real time without solving an optimisation problem of ever-increasing complexity. As shown
next, this can be achieved using Bellman’s dynamic-programming principle. To this end, I define the
value function by maximising the joint log-likelihood function (2) with respect to all states apart from
the most recent state at ∈ Rm; such functions are also known as ‘profile’ log-likelihood functions (Murphy
and Van der Vaart, 2000) in statistics and ‘stress’ functions in engineering (Whittle, 1981, p. 769).
Definition 1 (Value function). Let Assumption E hold. For t ≥ t0, the value function Vt : Ω × Rm → R
is
Vt(at) := max
(a1,a2,...,at−1)∈Rm×(t−1)
L1:t(a1, . . . ,at), at ∈ Rm. (4)
The value function Vt(·) encodes our knowledge of the state at time t, as indicated by the subscript,
and depends on past and current data y1, . . . ,yt, which are considered fixed, as well as on its argument
at, which is a continuous variable in Rm. Naturally, at|t = arg maxat Vt(at), such that the last element of
the mode (3) can be recovered from the value function. Usefully, the value function (4) satisfies a forward
recursive equation, known as Bellman’s equation, which can be used for the purpose of filtering.
Proposition 1 (Filtering using Bellman’s equation) . Let Assumption E hold. The value function (4)
satisfies Bellman’s forward recursion:
Vt(at) = ℓ(yt|at) + max
at−1∈Rm
n
ℓ(at|at−1) + Vt−1(at−1)
o
, at ∈ Rm, (5)
6


## Page 7

Forthcoming inJournal of Econometrics
for all t0 < t ≤ n. Further,
at|t := arg max
at∈Rm
Vt(at), t 0 ≤ t ≤ n. (6)
Bellman’s equation (5) is a forward recursion that relates the value function Vt(at) to the (previous)
value function Vt−1(at−1) by adding one term reflecting the state transition,ℓ(at|at−1); one term reflecting
the observation density, ℓ(yt|at); and a subsequent maximisation over a single state variable, at−1 ∈ Rm.
The value function Vt(at) still depends on the data y1, . . . ,yt−1, but only indirectly, i.e. through the
previous value function Vt−1(at−1). Apart from assuming the existence of the mode, no (additional)
assumptions are imposed on the log densities ℓ(yt|at) and ℓ(at|at−1); the proof in Supplement A uses
only standard dynamic-programming arguments. As such, Bellman’s equation (5) is of quite general
applicability. As the researcher receives the data y1 through yt, she can iteratively compute a sequence of
value functions (5), which imply a sequence of filtered state estimates via the respective maximisers (6).
Remark 1. For Markov-switching models, in which the latent state takes a finite number of (discrete)
values, Bellman’s equation (5) can be solved exactly for all time steps, yielding Viterbi’s (1967) algorithm.
Exact solubility of (5) tends to be lost when the states take continuous values.
When latent states take values in a continuum, as in the present article, the solution to Bellman’s
equation (5) is a function rather than a (finite-dimensional) vector as in Viterbi’s algorithm. While the
value function cannot generally be found exactly, there is an exception to this rule, as highlighted next.
Corollary 1 (Kalman filter as a special case). Take a linear Gaussian state-space model with observation
equation yt = d+Z αt+εt, where εt ∼ i.i.d. N(0, H), and state-transition equation αt = c+T α t−1+ηt,
where ηt ∼ i.i.d. N(0, Q) with a positive semidefinite covariance matrix Q, such that Kalman’s (1960)
filter applies. Assume the Kalman-filtered covariance matrices, denoted {Pt|t}, are positive definite. Then
(a) the value function is exactly multivariate quadratic at every time step, (b) the Bellman-filtered states
are identical to the Kalman-filtered states, and (c) the negative Hessian matrix of the value function equals
P −1
t|t at every time step.
The proof of Corolary 1 is contained in section 4, where I treat the case of a linear Gaussian state
equation but a general observation density. As is well known in engineering (e.g. Whittle, 1996, ch.
12), the exact solubility of Bellman’s equation in the case of linear Gaussian models is attributable to
the quadratic nature of all terms appearing on its right-hand side. The left-hand side turns out to be
quadratic as well, preserving exact solubility over time.
A key contribution of this article is the insight that Bellman’s equation continues to hold for state-
space models that are not necessarily linear and Gaussian, even if analytic solubility is lost. In this case, I
deviate from the literature in considering function-space approximations in solving Bellman’s recursion (5).
I consider a particularly simple approximation—the multivariate quadratic function—which happens to
be exact for linear Gaussian state-space models. A different class of Bellman filters, not explored here,
would be obtained by using non-parametric approximations.
7


## Page 8

Forthcoming inJournal of Econometrics
3 Bellman filter for general state-space models
3.1 Non-degenerate case
This section develops the Bellman filter for the general state-space model (1) by approximating the value
function, at every time step, by a multivariate quadratic function. I assume here that the observation and
state-transition densities are non-degenerate; an extension to the degenerate case is set out below.
The Bellman-filtered state (6) requires a maximisation with respect to the current state,at, while Bell-
man’s equation (5) additionally contains a maximisation with respect to the lagged state, at−1. Merging
both steps generates a joint optimisation problem in both state variables:
"
at|t
at−1|t
#
:= arg max"
at
at−1
#
∈ R2m
n
ℓ(yt|at) + ℓ(at|at−1) + Vt−1(at−1)
o
. (7)
The left-hand side features the filtered state, at|t, as well as the revised estimate of the previous state,
denoted at−1|t. The computation of the latter, while not our main focus, is inherent to Bellman’s equation
and cannot be avoided. The right-hand side features two log densities denoted ℓ(·|·) := log p(·|·), which
are given in closed form by the state-space model (1).
While the lagged value function Vt−1(·) on the right-hand side of optimisation (7) is typically un-
available in closed form, the shape around its peak turns out to be most relevant in the determination
of the filtered state at|t. I thus propose to approximate Vt−1(at−1) by a multivariate quadratic function
that is parametrised by its argmax, denoted at−1|t−1 ∈ Rm, and the negative Hessian matrix, denoted
It−1|t−1 ∈ Rm×m, which is assumed positive definite and can be interpreted as an information (or ‘preci-
sion’) matrix. The approximation thus reads
Vt−1(at−1) = −1
2(at−1 − at−1|t−1)′ It−1|t−1 (at−1 − at−1|t−1) + constants , at−1 ∈ Rm, (8)
which for simplicity is written with equality. Constants can be ignored in the context of optimisation (7).
Substituting the quadratic approximation (8) into maximisation (7) yields a viable function-space algo-
rithm. For linear Gaussian state-space models, approximation (8) is exact and the bivariate optimisa-
tion (7) can be performed analytically, leading to (the information form of) the Kalman filter.
While optimisation (7) does not generally allow closed-form solutions, it is typically straightforward
to write out analytically the steps of e.g. Newton’s method (Nocedal and Wright, 2006):

 at
at−1

←

 at
at−1

+


J11
t − d2ℓ(yt|at)
datda′
t
J12
t
J21
t It−1|t−1 + J22
t


−1
 J1
t + dℓ(yt|at)
dat
J2
t − It|t−1(at−1 − at−1|t−1)

, (9)
where, for notational simplicity, I use the assignment symbol; this allows the iterates (which appear on
both the left- and right-hand sides) to be denoted by at and at−1. In Newton’s step (9), derivatives
related to the state-transition density are
"
J1
t
J2
t
#
:=
" dℓ(at|at−1)
dat
dℓ(at|at−1)
dat−1
#
,
"
J11
t J12
t
J21
t J22
t
#
:= −


d2ℓ(at|at−1)
datda′
t
d2ℓ(at|at−1)
datda′
t−1
d2ℓ(at|at−1)
dat−1da′
t
d2ℓ(at|at−1)
dat−1da′
t−1

 . (10)
Fisher’s optimisation method is obtained by replacing d 2ℓ(yt|at)/(datda′
t) in equation (9) with its expec-
8


## Page 9

Forthcoming inJournal of Econometrics
tation conditional on at. When the observation and state-transition densities in model (1) are given, it is
straightforward (if tedious) to compute all required derivatives. As It−1|t−1 is assumed to be invertible,
analytic block-matrix inversion can be used for each Newton step (9), reducing the size of matrices to be
numerically inverted from 2m × 2m to m × m (see Supplement B for details). The resulting algorithm is
shown under step 4 in Table 2. Alternatively, black-box numerical optimisers may be used to solve (7),
obviating the need for manual computations; this will save researcher time but potentially increase the
required computer time. The optimisation can be started using ( at, at−1) ← (at|t−1, at−1|t−1), where
at|t−1 := arg maxa ℓ(a|at−1|t−1), as indicated under steps 2 and 3 in Table 2. This prediction at|t−1 can
often be computed in closed form.
To facilitate the proposed recursive method, the left-hand side of Bellman’s equation (5) must also be
approximated by a multivariate quadratic function. To this end, I compute the negative Hessian matrix
(with respect to at) of the value function, i.e. Vt(at) = ℓ(yt|at) + maxat−1{ℓ(at|at−1) + Vt−1(at−1)}. The
negative Hessian may be then be evaluated at the peak. Employing the second-order envelope theorem
(Supplement C) yields
It|t := J11
t − J12
t (It−1|t−1 + J22
t )−1J21
t − d2ℓ(yt|at)
datda′
t

at=at|t,at−1=at−1|t
(11)
as shown in Table 2 under step 6. Fisher’s version is obtained by taking a conditional expectation of the
last term. For linear Gaussian state-space models, Newton and Fisher versions of update (11) are identical
and equal to the information update of the Kalman filter (Supplement D). Update (11) can also be viewed
as a ‘realised’ version of the recursion for the inverse of Cram´ er-Rao lower bounds (Tichavsky et al., 1998,
eq. 21)—the difference being that equation (11) has no expectations. The predicted information It|t−1,
given in step 2 of Table 2, is similar in form and used for static-parameter estimation purposes in section 7.
The resulting Bellman filter in Table 2 has a computational complexity ofO(m3t), which is attributable
to the need to invert m×m matrices at every time step. This complexity matches that of (the information
form of) the Kalman filter, thus offering scalability to at least moderately high dimensionsm. I am unaware
of other approximate filters offering the same breadth of applicability and computational efficiency. 2
3.2 Extension to the degenerate case
When some elements of at−1|t−1 are known to be pinpoint accurate, the corresponding diagonal values of
the precision matrix It−1|t−1 in equation (8) are unbounded. Such infinite diagonal values make optimisa-
tion (7) easier rather than harder, as some elements of at−1 are constrained and need not be numerically
optimised; rather, they can be fixed by hand. When the relevant restriction is implemented, the un-
bounded contributions in the quadratic term (8) can be dropped. Similarly, when the state-transition
density ℓ(at|at−1) is degenerate, some elements of the current state are deterministic functions of the
previous state. When these restrictions are implemented, the degenerate part of the transition density
can be dropped. Indeed, this procedure will be used for the model in section 10, which involves degenerate
state dynamics. Finally, when the observation density ℓ(yt|at) is degenerate, as when some elements of
at are fully revealed by the observation yt, optimisation (7) requires that some elements of at take a
2In related work, Koyama et al. (2010, p. 173) report a computational complexity of O(m2t), purportedly as O(m2)
is the ‘complexity of matrix manipulations’. This result comes with two important caveats. First, it relies on having a
linear and Gaussian state equation; otherwise, their prediction step requires the (numerical) evaluation of an integral in m
dimensions. Second, it overlooks the fact that the (dense) matrix inversion required by Newton’s method typically requires
O(m3) computational effort; not even the best linear solvers achieve O(m2).
9


## Page 10

Forthcoming inJournal of Econometrics
Table 2: Bellman filter for model (1).
Step Method Computation
1. Initialise Set a0|0 equal to the unconditional mean of the latent state (or treat it as a static parameter to be
estimated) and set I0|0 equal to some sufficiently large multiple of the identity matrix. Set t = 1.
2. Predict at|t−1 = arg maxat∈Rm ℓ(at|at−1|t−1)
It|t−1 = J 11
t − J 12
t (It−1|t−1 + J 22
t )−1J 21
t

at=at|t−1,at−1=at−1|t−1
3. Start Set at ← at|t−1 and at−1 ← at−1|t−1.
4. Optimise Newton St ← J 11
t − J 12
t (It−1|t−1 + J 22
t )−1J 21
t − d2ℓ(yt|at)
datda′
t
, Dt ← It−1|t−1 + J 22
t ,
G1
t ← J 1
t + dℓ(yt|at)
dat
, G2
t ← J 2
t − It−1|t−1(at−1 − at−1|t−1),
at ← at + S−1
t G1
t − S−1
t J 12
t D−1
t G2
t ,
at−1 ← at−1 − D−1
t J 21
t S−1
t G1
t + (D−1
t + D−1
t J 21
t S−1
t J 12
t D−1
t )G2
t .
Fisher Like Newton’s method, but with St adjusted to include E[d2ℓ(yt|at)/(datda′
t)|at].
5. Stop Stop if some convergence criterion is satisfied or after a predetermined number of iterations.
6. Update at|t = at and at−1|t = at−1.
Newton It|t = J 11
t − J 12
t (It−1|t−1 + J 22
t )−1J 21
t − d2ℓ(yt|at)
datda′
t
at=at|t,at−1=at−1|t
Fisher It|t = J 11
t − J 12
t (It−1|t−1 + J 22
t )−1J 21
t − E
d2ℓ(yt|at)
datda′
t
at
at=at|t,at−1=at−1|t
6. Proceed Set t = t + 1 and return to step 2.
Note: The log-likelihood functions ℓ(yt|at) and ℓ(at|at−1) are known in closed form and can be read off from the data-
generating process (1). Various derivatives of ℓ(at|at−1) are defined in equation (10). Two (intentionally vanilla) optimisa-
tion methods are listed under steps 4 and 6. Users may also implement more sophisticated and/or black-box optimisation
methods based on maximisation (7).
specific functional form of yt. From an optimisation perspective, therefore, degeneracies correspond to
equality constraints that can typically be implemented by hand, reducing the dimension of the numerical
optimisation problem to be solved. This capacity to deal with (partially) deterministic state dynamics
forms an advantage over e.g. particle-filtering methods, which may struggle in such situations.
4 Bellman filter for models with linear Gaussian state dynamics
This section applies the general idea developed in the previous section to models in which the state-
transition equation remains linear and Gaussian. The advantage of this special case is that the ‘inner’
optimisation in Bellman’s equation (5), i.e. with respect to the lagged state at−1, can now be performed
in closed form. The ‘outer’ optimisation with respect to the current state at remains numerical. Models
with linear Gaussian state equations are written as in Koopman et al. (2015, 2016):
yt ∼ p(yt | αt), αt+1 = c + T α t + ηt+1, ηt ∼ i.i.d. N(0, Q), α1 ∼ p(α1), (12)
where t = 1 , . . . , n, and the state-transition equation contains the system vector c ∈ Rm and system
matrix T ∈ Rm×m. The state innovation ηt is controlled by a positive semidefinite covariance matrix
Q ∈ Rm×m, which presents no loss of generality compared to authors who write the innovation as Rηt for
some matrix R.3 The observation density p(yt | αt) may still be non-Gaussian and involve nonlinearity.
3Indeed, my Q could throughout be replaced by RQR′; for a similar comment, see Durbin and Koopman (2000, p. 43).
10


## Page 11

Forthcoming inJournal of Econometrics
4.1 Inner maximisation
Taking Bellman’s equation (5), substituting the quadratic approximation (8) and the (similarly quadratic)
logarithmic state-transition density from model (12) yields
Vt(at) = ℓ(yt|at) + max
at−1∈Rm
n
− 1
2(at − c − T at−1)′ Q−1 (at − c − T at−1) (13)
−1
2(at−1 − at−1|t−1)′ It−1|t−1 (at−1 − at−1|t−1)
o
+ constants, at ∈ Rm.
While Q−1 is assumed to exist in writing equation (13), the results derived below will remain valid
when Q is only positive semidefinite; this follows from standard limiting arguments (e.g. Chopin and
Papaspiliopoulos, 2020, p. 78). Here I focus on the maximisation over the lagged state variable at−1.
As the variable at−1 appears at most quadratically on the right-hand side of equation (13), its max-
imisation can be performed in closed form. Importantly for the development below, the solution, denoted
a∗
t−1 ∈ Rm, depends linearly on the variable at ∈ Rm, which is involved in the outer maximisation. Hence
a∗
t−1 is a vector function a∗
t−1 : Rm → Rm, whose expression following from the standard first-order
condition can be usefully expressed (after some algebra, see Supplement E) as
a∗
t−1 = at−1|t−1 + I −1
t−1|t−1 T ′ It|t−1

at − at|t−1

, (14)
which employs the definitions of the predicted state at|t−1 and the predicted precision matrix It|t−1 given
under step 2 in Table 3. Expression (14) can be recognised the one-period version of RTS (1965) smoother,
providing the best estimate of at−1 conditional on the best estimate of next state, at, which at this point
remains to be found; i.e. the optimal a∗
t−1 is a function of the (still to be optimised) state variable at.
Regarding the predicted precision matrix It|t−1, the first expression in step 2 of Table 3 relies on
the positive definiteness of the matrix Q. The second expression, which holds by the Woodbury matrix
identity, remains valid even when Q becomes singular; a similar argument is made in Chopin and Pa-
paspiliopoulos (2020, p. 78). Hence the algorithm in Table 3 remains valid when Q is singular. While
the derivation here is different, the resulting prediction step 2 in Table 3 is in fact identical to that of the
(information form of the) Kalman filter (e.g. Harvey, 1990, p. 106). Hence, while the usual derivation of
the Kalman filter is based on taking expectations, the optimisation approach presented here yields the
same result.
4.2 Outer maximisation
Substituting the vector function a∗
t−1 : Rm → Rm of equation (14) back into Bellman’s equation (13), we
obtain (after some algebra, see Supplement F) the value function with a single argument, at, as follows:
Vt(at) = ℓ(yt|at) − 1
2(at − at|t−1)′ It|t−1 (at − at|t−1) + constants, at ∈ Rm, (15)
where predicted quantities at|t−1 ∈ Rm and It|t−1 ∈ Rm×m were derived above (see step 2 of Table 3). The
(approximate) value function (15) involves two terms: (a) the log-likelihood contribution of yt evaluated
at the state variable at and (b) a quadratic term that penalises deviations of at from at|t−1. The filtered
11


## Page 12

Forthcoming inJournal of Econometrics
Table 3: Bellman filter and smoother for model (12).
Step Method Computation
1. Initialise Unconditional Set a0|0 = (1m×m − T )−1c and vec(I −1
0|0) = (1m2×m2 − T ⊗ T )−1vec(Q). Set t = 1.
Estimation Treat a0|0 as a static parameter to be estimated and set I0|0 equal to a large multiple of the
identity matrix. Set t = 1.
Diffuse Possible if arg max a ℓ(y1|a) exists. Set I0|0 equal to a small multiple of the identity matrix.
Set t = 1.
2. Predict at|t−1 = c + T a t−1|t−1.
It|t−1 = Q−1 − Q−1T

It−1|t−1 + T ′Q−1T
−1
T ′Q−1 = (T I−1
t−1|t−1T ′ + Q)−1.
3. Start Set at ← at|t−1.
Alternatively, set at ← arg maxa ℓ(yt|a) if this quantity exists.
4. Optimise Newton at ← at +
h
It|t−1 − d2ℓ(yt|at)
dat da′
t
i−1hdℓ(yt|at)
dat
− It|t−1

at − at|t−1
i
.
Fisher Like Newton step, but replace d 2ℓ(yt|at)/(dat da′
t) by E[d2ℓ(yt|at)(dat da′
t)|at].
BHHH Like Newton step, but replace d 2ℓ(yt|at)/(dat da′
t) by −dℓ(yt|at)/dat × dℓ(yt|at)/da′
t .
5. Stop Stop at if some convergence criterion is satisfied or after a predetermined number of iterations.
6. Update at|t = at.
Newton It|t = It|t−1 − d2ℓ(yt|at)
dat da′
t

at=at|t
if the realised information is positive semidefinite
Fisher Like Newton update, but replace d 2ℓ(yt|at)/(dat da′
t) by E[d2ℓ(yt|at)(dat da′
t)|at].
BHHH Like Newton update, but replace d 2ℓ(yt|at)/(dat da′
t) by −dℓ(yt|at)/dat × dℓ(yt|at)/da′
t.
7. Proceed Set t = t + 1 and return to step 2.
8. Smooth Run the Bellman filter and store at|t, Pt|t = I −1
t|t and Pt|t−1 = I −1
t|t−1 for all 1 ≤ t ≤ n.
Start with t = n − 1 and iterate the following recursions backwards until t = 1 is reached:
at|n = at|t + Pt|tT ′It+1|t(at+1|n − c − T at|t), and
Pt|n = Pt|t − Pt|tT ′It+1|t(Pt+1|t − Pt+1|n)It+1|tT Pt|t.
Note: BHHH = Berndt-Hall-Hall-Hausman. The log-likelihood function ℓ(yt|αt) is known in closed form and can be read
off from the data-generating process (12). The corresponding score and the realised and expected information quantities are
written as d ℓ(yt|a)/da, −d2ℓ(yt|a)/(dada′) and E[−d2ℓ(yt|a)/(dada′)|a], respectively, which are viewed as functions of a,
to be evaluated at some state estimate. Steps 4 and 6 list three (intentionally vanilla) optimisation methods, which may
but need not be identical for both steps. Users may also implement more sophisticated optimisation methods based on the
argmax (16). The expressions in the (optional) smoother step 8 are derived in section 6.
state at time t maximises the sum of both terms, i.e.
at|t := argmax
at∈Rm
Vt(at) = argmax
at∈Rm

ℓ(yt|at) − 1
2(at − at|t−1)′ It|t−1 (at − at|t−1)

. (16)
The optimisation can be performed in closed form when the observation density is Gaussian with mean
d + Zat, as in Corollary 1, in which case ℓ(yt|at) is multivariate quadratic in at; this yields the standard
Kalman filter (see Supplement G for details). In general, the potentially complicated functional form of
ℓ(yt|at) implies that optimisation (16) cannot be performed in closed form. Some plain-vanilla applications
of optimisation methods are included in Table 3 under step 4. The presence of the score in this optimisation
step is distinctive for the Bellman filter and guarantees its robustness if the observation density is heavy
tailed. As before, the computational complexity of the resulting filter is O(m3t).
A unique argmax (16) is guaranteed when the precision matrix It|t−1 is positive definite and the log-
likelihood function ℓ(yt|at) is concave in the state variable at ∈ Rm. When the smallest eigenvalue of the
precision matrix It|t−1 is sufficiently large, a unique argmax is still guaranteed to exist even when ℓ(yt|at)
fails to be concave in at. In the non-concave case, it is possible that It|t−1 is insufficiently ‘large’ to pin
down the update. This may be solved by adding to It|t−1 some positive multiple of the identity matrix
12


## Page 13

Forthcoming inJournal of Econometrics
or skip the optimisation altogether; in the simulation study in section 8, this situation never arose.
Before proceeding to the next time step, the value function (15) must be approximated by a mul-
tivariate quadratic function. Because constants are irrelevant and the argmax has already been found,
what remains is to determine the negative matrix of second derivatives evaluated at the peak, denoted
It|t, as indicated in Table 3 under step 6. Intuitively, one expects It|t ≥ It|t−1, where the weak inequality
means that the left-hand side minus the right-hand side is positive semidefinite. The intuition derives
from the fact that missing observations can be dealt with as in the Kalman filter by setting at|t = at|t−1
and It|t = It|t−1. Any (existing) observation should be weakly more informative than a nonexistent one,
implying It|t ≥ It|t−1. The lower bound may be reached in the limit for extreme observations (i.e. outliers),
which are uninformative. While Newton’s updating method under step 6 has the advantage of explicitly
utilising the observation yt, enabling it to recognise that some observations carry little information, the
inequality It|t ≥ It|t−1 is not guaranteed unless the realised information quantity is positive semidefinite.
For Fisher’s updating method under step 6, the situation is reversed, failing to utilise the realisation yt
while ensuring It|t ≥ It|t−1. For some models it is possible to formulate a hybrid version, e.g. by taking
a weighted average of Newton’s and Fisher’s updating methods, that achieves the best of both worlds (I
use this hybrid method for some models in section 8).
4.3 Special cases of Bellman filter with linear Gaussian states
Special cases of the algorithm in Table 3 include the Kalman filter (Supplement G), the iterated extended
Kalman filter (Supplement H), Fahrmeir’s (1992) approximate mode estimator (Supplement I), Koyama
et al.’s (2010) Laplace Gaussian filter (Supplement J), and Toulis and Airoldi’s (2017) implicit stochastic
gradient method for the estimation of states that are constant over time (Supplement K). The key differ-
ence with implicit stochastic gradient methods is that the Bellman filter, like the Kalman filter, generally
remains perpetually responsive and does not converge to a ‘true’ parameter value.
5 Theory: Contractivity, error bounds and stability
This section investigates the theoretical properties of the Bellman filter derived in the previous section, i.e.
under the assumption of linear and Gaussian state dynamics. Under appropriate conditions, this section
will show that (a) at a fixed time step, the Bellman filtering step is contractive in quadratic mean to
a small region around the true state, (b) over time, the mean squared filtering error remains uniformly
bounded (i.e. approximation errors cannot accumulate), and (c) the effect of the initialisation of the filter
vanishes asymptotically and exponentially fast, an important property known as invertibility (Straumann
and Mikosch (2006) or stability (Koyama et al., 2010, Th. 4).
5.1 Contractivity at a fixed time step
Here the time step t ≥ 1 is considered fixed. Similarly, in the Bellman-filter update (16), predictions
at|t−1 ∈ Rm and It|t−1 ∈ Rm×m are fixed. Update (16) can generally be viewed as a stochastic version of
Rockafellar’s (1976) proximal point algorithm, which similarly combines a target function to be optimised,
in this case ℓ(yt|at), with a quadratic penalty centred at a previous iterate, in this case at|t−1. Indeed,
optimisation (16) can be classed as a stochastic proximal point method (e.g. Ryu and Boyd, 2016, Bianchi,
2016, Patrascu and Necoara, 2018, Asi and Duchi, 2019). Its intuitive link with proximal optimisation
13


## Page 14

Forthcoming inJournal of Econometrics
methods suggests that update (16) should remain both applicable and reasonably accurate outside the
classic Kalman-filtering context. Theorem 1 below confirms this intuition.
Notation: For vectors x ∈ Rm, the Euclidean norm is denoted by ∥x∥ :=
√
x′x. For a positive
definite weight matrix W > 0, the weighted Euclidean vector norm is denoted ∥x∥W :=
√
x′W x, while
for a matrix M ∈ Rm×m, the induced matrix norm is denoted ∥M ∥W := max{∥M x∥W : ∥x∥W = 1}
(see e.g. Jungers, 2009, Def. 2.8). The gradient and Hessian of ℓ(y|a) with respect to a are written as
∇ℓ(y|a) and ∇2ℓ(y|a), respectively. The smallest and largest eigenvalues of a matrix · are denoted λmin(·)
and λmax(·), respectively. The m × m identity matrix is denoted by 1m×m.
Assumption 1 (Concavity). With probability one in the random draw y, the observation log density ℓ(y|·)
maps Rm to R, and is either (a) concave, or (b) strictly concave, or (c) strongly concave with parameter
ϵ > 0.
Assumption 2 (Differentiability). With probability one in the random draw y, the observation log density
a 7→ ℓ(y|a) is (a) once or (b) twice continuously differentiable on all of Rm.
Assumption 3 (Bounded information). E[∥∇ℓ(yt|αt)∥2] ≤ σ2 < ∞, where αt is the true latent state
that generates yt ∼ p(yt|αt).
Theorem 1 (Contractivity of the mean squared error) . Fix the time step t ≥ 1. Let at|t−1 ∈ Rm and
It|t−1 ∈ Rm×m be given and fixed, where the latter is symmetric and positive definite with eigenvalues
satisfying 0 < λmin(It|t−1) ≤ λmax(It|t−1) < ∞. Let update at|t be defined by (16).
1. Boundedness of updates: Under Assumption 1a, with probability one, the update at|t is well
defined and satisfies 1
2


at|t − at|t−1


2
It|t−1
≤ ℓ(yt|at|t) − ℓ(yt|at|t−1) . (17)
2. Stability for a single time step: Let Assumption 2b hold. Let λmin(It|t−1) > max{0, λmax(∇2ℓ(y|a))}
for all a ∈ Rm and with probability one in y. Then, with probability one,





dat|t
da′
t|t−1





It|t−1
≤ 1 − λmin(−∇2ℓ(yt|at|t))
λmax(It|t−1) + λmax(−∇2ℓ(yt|at|t)) . (18)
The right-hand side does not exceed (is strictly less than) unity under the additional Assumption 1a
(1b).
3. Contractivity of the quadratic error: Under Assumptions 1c, 2a and 3,
E


at|t − αt


2
It|t−1+2ϵ 1m×m

≤ E


at|t−1 − αt


2
It|t−1

+ σ2
λmin(It|t−1) . (19)
The proof is presented in Supplement L. Compared with other results for approximate filters (e.g.
Koyama et al., 2010), Theorem 1 is attractive because the assumptions are (a) more easily verifiable
(relating to model inputs instead of outputs) and (b) less stringent. For example, Theorem 1 applies to
the Kalman filter, while the theory developed in Koyama et al. (2010) does not. 4
4Koyama et al. (2010) require logarithmic observation densities with five uniformly bounded derivatives, ruling out the
Gaussian case in which the logarithmic density is quadratic, implying unbounded first derivatives on Rm.
14


## Page 15

Forthcoming inJournal of Econometrics
Part 1 of Theorem 1 indicates that the update is well-defined, while Part 2 demonstrates that the
Bellman-filtered state at|t is stable in the prediction at|t−1. This stability property can be used to establish
the stability of the Bellman filter (see section 5.3). Part 3 of Theorem 1 says that the quadratic filtering
error is contractive in expectation towards a small region around the true state. Inequality (19) features
a weighted norm on both sides, in which the predicted information matrix It|t−1 plays a key role. The
weight matrix on the left-hand side of inequality (19) contains the additional term 2 ϵ1m×m such that
the diagonal is ‘reinforced’: this drives the contraction. Intuitively, when the weight matrix is ‘bigger’
(i.e. has larger eigenvalues), the vector inside the norm must be ‘smaller’ in magnitude. Of course, an
improvement is impossible when the prediction is perfect, such that the additive term σ2/λmin(It|t−1) on
the right-hand side of equation (19) is unavoidable. Hence updates are contractive in quadratic mean
towards a ‘noise-dominated region’ (NDR) around the true state (e.g. Patrascu and Necoara, 2018, p. 3).
Theorem 1 also relates to Toulis et al. (2016, p. 1291), who present the seemingly stronger result that
proximal updates are ‘contracting almost surely’ when the log-likelihood function is strongly concave;
however, their result relies on a nonstandard definition of strong concavity that rules out important cases
of interest, e.g. the Kalman filter (see Supplement M for a detailed comparison).
5.2 Error bounds over time
While Theorem 1 involved a fixed time step, it is equally important to investigate how filtered quantities
behave over extended time periods. When the latent state is stationary, even a trivial filter may asymp-
totically achieve a bounded mean squared error (MSE), e.g. by setting the filter output equal to zero for
all time steps. Hence a more pertinent question is whether the filter can asymptotically achieve a bounded
MSE in the case of unit-root states. As this section shows, in the long run, the Bellman filter achieves a
bounded MSE even if the true process is free to roam.
For simplicity I focus on the case in which It|t−1 is a constant multiple of the identity matrix;
hence It|t−1 = γ1m×m, where γ > 0 can be interpreted as a smoothing parameter, and λmin(It|t−1) =
λmax(It|t−1) = γ. The weighted MSE contraction (19) for a fixed time step then reduces to a standard
MSE contraction:
E


at|t − αt


2
| {z }
MSE of update
≤ γ
γ + 2 ϵ| {z }
<1
"
E


at|t−1 − αt


2
| {z }
MSE of prediction
+ σ2
γ2
|{z}
>0
#
. (20)
Inequality (20) features a multiplicative constant on its right-hand side that is strictly less than unity,
which gives rise to the contraction. As illustrated in Figure 1, the inequality says that the MSE of the
update is bounded above by a linear function of the MSE of the prediction. The slope of this line is
γ/(γ + 2ϵ) < 1, while the intercept is σ2/(γ(γ + 2ϵ)) > 0. The area below the line, shaded in grey,
shows the contraction due to inequality (20). When the prediction error is large, the contractive property
dominates and the update is expected to be beneficial: the grey area lies below the 45 ◦ line. When the
prediction happens to be pinpoint accurate (i.e. the corresponding MSE is zero), the MSE of the update
need not be zero, as can be seen in Figure 1 from the fact that the grey area stretches above the 45 ◦ line
close to the origin. This is unavoidable with noisy data: when predictions are perfect, updates cannot be
better. In the limit ϵ → 0, whereby the target function is concave but not strongly so, inequality (20) is
closely related to Theorem 3.2 in Asi and Duchi (2019).
MSE contraction (20) is used below in Proposition 2 (see Supplement N for the proof) to demonstrate
that the filtering MSE remains uniformly bounded over time. Proposition 2 applies to the Kalman filter,
15


## Page 16

Forthcoming inJournal of Econometrics
Figure 1: Illustration of mean squared error (MSE) contraction due to inequality (20)
Note: NDR = noise-dominated region. The grey area corresponds to possible values of the MSE after updating, which is
conditional on the MSE before updating. Purely for illustrative purposes, the parameters are σ = ϵ = 1 and γ = 2.
which can similarly track unit-root states in the long run, but holds more generally for strictly concave
logarithmic observation densities.
Proposition 2 (Uniformly bounded MSE). Assume αt = αt−1+ηt with ηt ∼ i.i.d. ( 0, Q), which need not
be Gaussian, and σ2
η = Trace(Q) < ∞. Set at+1|t = at|t and take It+1|t = γ1m×m for some γ > 0 and all
t ≥ 1. Let at|t be given by update (16). Denote MSEt|t := E∥at|t − αt∥2 and MSEt|t−1 := E∥at|t−1 − αt∥2.
In the setting of part 3 of Theorem 1,
MSEt|t ≤ γ
γ + 2 ϵ
h
MSEt|t−1 + σ2
γ2
i
, MSEt+1|t = MSEt|t + σ2
η, t ≥ 1. (21)
Irrespective of the initial value MSE1|0, the long-run filtering error remains uniformly bounded:
lim sup
t→∞
MSEt|t ≤ σ2
2 γ ϵ + γ σ2
η
2 ϵ . (22)
Minimising the bound with respect to γ yields γ = σ/ση.
5.3 Stability
As emphasised by Anderson and Moore (2012, p. 63), ‘a question of vital interest [...] is whether or not
the filter is stable’. A filter can be considered stable if deviations in the initial conditions ‘tend to be
reduced, rather than amplified, by conditioning on further observations’ (Koyama et al., 2010). To this
end, it is sufficient that filtered paths with different initialisations—but based on identical data—converge
exponentially fast over time, a concept known as ‘invertibility’ (e.g. Straumann and Mikosch, 2006). This
section demonstrates the stability of a time-invariant version of the Bellman filter.
Stability analyses of the Kalman filter rely on the fact that, in the time-invariant version of the filter,
the matrix da′
t|t/dat−1|t−1 is static, as at|t is then a linear function of at|t−1 with a static coefficient matrix.
16


## Page 17

Forthcoming inJournal of Econometrics
Stability follows when the spectral radius of this coefficient matrix is strictly exceeded by one. Unfortu-
nately, the stability analysis here is complicated by the fact that each derivative matrix d a′
t|t/dat−1|t−1
is stochastic, depending on the observations as well as the filtered states. Moreover, an analysis based on
the spectral radius is ruled out because it fails to be a norm. I follow the classic literature in investigating
a time-invariant setting, which implies that the predicted information matrix It|t−1 = I ∈ Rm×m is taken
to be static over time. I deviate by basing the result not on the spectral radius but the (weighted) matrix
norm ∥ · ∥I.
Theorem 2 (Stability of the time-invariant Bellman filter.). Let the initialisation a0|0 ∈ Rm be given. For
all t ≥ 1, (a) set at|t−1 = c+ T at−1|t−1, where c ∈ Rm and T ∈ Rm×m are given, and (b) let update at|t be
defined by maximisation (16), where It|t−1 = I ∈ Rm×m is a time-invariant (i.e. static) positive-definite
matrix with eigenvalues in the range (νmin, νmax). Assume that, with probability one, the observation
log density ℓ(y|a) is twice continuously differentiable, while the negative Hessian matrix −∇2ℓ(y|a) has
eigenvalues in the range (µmin, µmax) uniformly for a ∈ Rm, where max{0, −µmin} < ν min. Then, with
probability one,




dat|t
da′
0|0





I
≤

1 − min
 δ
νmin
, δ
νmax
t/2
1 − µmin
νmax + µmax
t
, (23)
where δ := λmin(I − T ′IT ) ≤ νmin. As t → ∞, exponential almost sure convergence to zero is guaranteed
under the following sufficient condition:
1
2 log

1 − min
 δ
νmin
, δ
νmax

+ log

1 − µmin
νmax + µmax

< 0. (24)
The proof is presented in Supplement O. Theorem 2 assumes thatI is positive definite while its smallest
eigenvalue νmin > 0 is sufficiently large. For concave log densities (i.e. µmin ≥ 0), it is required only that
νmin > 0 such thatI is positive definite. For log densities that fail to be concave (i.e.µmin < 0), the stronger
condition νmin > max{0, −µmin} is imposed to ensure that optimisation problem (16) is well-defined and
leads to unique solution at|t for all t. The sufficient condition (24) for invertibility is automatically satisfied
if the prediction and updating steps are both non-expansive (both δ ≥ 0 and µmin ≥ 0), while at least one
is strictly contractive (δ > 0 and/or µmin > 0). For example, the observation log density could be strictly
concave (i.e. µmin > 0) while T is the identity matrix (in which case δ = 0); hence, unit root dynamics
are permitted. Moreover, inequality (24) will always be satisfied if the observations point adequately
to the underlying state. More specifically, if µmin and µmax approach infinity at the same rate (such
that the measurement is exceedingly precise), then the second logarithm in condition (24) approaches
negative infinity such that the condition is satisfied. For sufficiently informative observations, therefore,
even explosive state dynamics may be accommodated.
6 Smoothing using Bellman’s principle
Here the general method in section 2 is extended to present a unified method for both filtering and
smoothing using Bellman’s dynamic-programming principle. Readers purely interested in filtering can
skip this section without loss of continuity. While the approach below is general, I present the most
explicit result in the case of a linear Gaussian state equation. This specialised setting allows me to
show that the classic Rauch, Tung and Striebel (RTS, 1965) smoother expressions remain valid, albeit as
approximations, for a general (i.e. non-Gaussian) observation density—an insight that may be useful in
17


## Page 18

Forthcoming inJournal of Econometrics
practice.
Below I introduce three value functions, based on (a) past data, (b) future data and (c) all data. All
three are based on the partial log-likelihood function Lt1:t2 : Ω × Rm × . . . × Rm → R involving states and
observations from time t1 to t2 as follows:
Lt1:t2(at1, . . . ,at2) :=
t2X
i=t1
ℓ(yi|ai) +
t2X
i=t1+1
ℓ(ai|ai−1) + 1t1=1 ℓ(a1), 1 ≤ t1 ≤ t2 ≤ n, (25)
where sums containing no terms are understood to be zero. Equation (25) generalises equation (2), which
is a special case with t1 = 1 and t2 = t. The new function Lt1:t2(· · ·) depends on observations yt1 through
yt2, which are considered fixed, and involves t2 − t1 state transitions from at1 to at2. For definiteness, I
assume that Lt1:t2(·, · · · , ·) can be maximised with respect to each input argument; this assumption is too
strong but sufficient for the development below.
Assumption 4. For all 1 ≤ t1 ≤ t2 ≤ n, the partial log-likelihood function Lt1:t2(·, · · · , ·) defined in
equation (25) has a unique maximum with respect to each state variable at, i.e. for each t1 ≤ t ≤ t2.
Assumption 4 allows us to define three value functions Vt(·), Wt(·), Zt(·) : Ω × Rm → R as follows:
using past data: Vt(at) := max
a1,...,at−1
L1:t(a1, . . . ,at), (26)
using future data: Wt(at) := max
at+1,...,an
Lt:n(at, . . . ,an), (27)
using all data: Zt(at) := max
a1,...,at−1,at+1,...,an
L1:n(a1, . . . ,an), (28)
where 1 ≤ t ≤ n. Maximisations are written as max a instead of max a∈Rm; i.e. it is implicitly understood
that each state variable takes values in the state space Rm. The backward-looking value function Vt(·)
is identical to that in Definition 1. The forward-looking value function Wt(·) is based on current and
future data and specialises to that in Mayne (1966, eq. 18) for linear Gaussian state-space models. The
convention that any maximisation involving no variables can be ignored gives the correct initial and
terminal conditions for t = 1 and t = n, respectively. Function Zt(·) is based on all data and implies
a smoothed state estimate via at|n := argmaxaZt(a). The usefulness of the above definitions lies in the
fact that the first two value functions satisfy forward and backward recursions, respectively, while jointly
implying the third:
Proposition 3 (Bellman’s forward and backward recursions.) . Let Assumption 4 hold. Then
forward recursion: Vt(at) = ℓ(yt|at) + max
at−1
n
ℓ(at|at−1) + Vt−1(at−1)
o
, 1 < t ≤ n, (29)
backward recursion: Wt(at) = ℓ(yt|at) + max
at+1
n
ℓ(at+1|at) + Wt+1(at+1)
o
, 1 ≤ t < n, (30)
relation between both: Zt(at) = Vt(at) + max
at+1
n
ℓ(at+1|at) + Wt+1(at+1)
o
, 1 ≤ t < n, (31)
= Wt(at) + max
at−1
n
ℓ(at|at−1) + Vt−1(at−1)
o
, 1 < t ≤ n. (32)
The proof, being a straightforward extension of that of Proposition 1, is omitted. Forward recur-
sion (29) is identical that in Proposition 1, while backward recursion (30) can be derived using similar
arguments; for linear Gaussian state-space models, the latter collapses to the backward recursion in Mayne
18


## Page 19

Forthcoming inJournal of Econometrics
(1966, eq. 27). Function Zt(·) can be constructed by combining the output of both recursions, where either
the forward or backward recursion extends to time t as in equations (31) and (32), respectively. In both
cases, a single-state transition log-density is added, followed by an optimisation involving a single state
variable.
Interestingly, equations (31) and (32) do not (explicitly) contain the observation density. Instead, they
contain only two value functions (one using past data, one using future data) that are linked through a
single state-transition density. When both value functions are quadratic, and the state-transition equation
is linear and Gaussian, such that ℓ(at|at−1) is also quadratic, then equations (31) and (32) contain only
quadratic terms and should thus be analytically soluble. As illustrated below, this yields the classic
RTS smoother expressions. However, the main innovation of this article is to consider quadratic value
functions even when inexact. As the next proposition shows, if we are willing to accept that value functions
may be reasonably approximated by quadratic functions, then the resulting expression is still given by
the classic RTS smoother. This insight appears to be new, and considerably extends the domain of
applicability of the RTS smoother, at least as an approximation. In practice, it means that the Bellman
filter developed in section 4 can be executed and its output used in the standard RTS smoothing formulas
to obtain approximate smoothed state estimates—which the simulation study in section 8 finds to be
highly accurate.
Proposition 4 (Bellman smoother with linear Gaussian state equation). Let Assumption 4 hold. Assume
αt = c + T α t−1 + ηt with ηt ∼ i.i.d. N(0, Q). Suppose that both value functions on the right-hand side
of equation (31) are approximated as quadratic functions; in particular let Vt(·) have argmax at|t and
negative Hessian It|t = P −1
t|t > 0. Under this approximation, Zt(·) on the left-hand side of equation (31)
is also quadratic. Moreover, the argmax at|n of Zt(·) can be expressed in terms of the argmax at+1|n of
Zt+1(·) as follows:
at|n = at|t + Pt|tT ′It+1|t(at+1|n − c − T at|t), (33)
Pt|n = Pt|t − Pt|tT ′It+1|t(Pt+1|t − Pt+1|n)It+1|tT Pt|t, (34)
where It+1|t := ( T Pt|tT ′ + Q)−1 > 0 and It|n = P −1
t|n > 0 for t = 1 , . . . , n is the negative Hessian of
Zt(·). Expressions (33) and (34) are identical to the classic RTS smoother expressions, but in a more
general—i.e. possibly approximate—context.
The proof, presented in Supplement Q, employs only standard matrix algebra, including a simple
lemma on multivariate quadratic functions in Supplement P. Exact solubility of equation (31) is clear
given that all functions on its right-hand side are assumed to be quadratic; the crucial step is to relate the
properties of Zt(·) to those of Zt+1(·) to obtain a backward recursion. The resulting RTS smoother (33)
requires us to store the output of the filter for all time steps and subsequently to compute the smoothed
state, at|n, as a linear combination of the filtered state, at|t, and the adjacent smoothed state, at+1|n.
The backward recursion can be initialised using the final filtered state, an|n. The output of the backward
matrix recursion (34), which provides a measure of uncertainty, is not required if one is merely interested
in the smoothed state estimates (33).
19


## Page 20

Forthcoming inJournal of Econometrics
7 Parameter estimation by likelihood approximation
This section presents a heuristic approach to the static-parameter estimation problem, as distinct from
the filtering problem, in that we aim to estimate both the time-varying states and the static (hy-
per)parameter ψ. I deviate from the literature by decomposing the log-likelihood function of the data
in terms of the ‘fit’ generated by the Bellman filter, penalised by a nonnegative term that resembles a
‘realised’ version of the Kullback-Leibler (KL, 1951) divergence between filtered and predicted states. In-
tuitively, this decomposition illustrates that we wish to maximise the congruence of the Bellman-filtered
states and the data, while minimising the distance between the filtered and predicted states to prevent
over-fitting.
The proposed pseudo log-likelihood decomposition has the advantage that all terms can be evaluated
or approximated using the output of the Bellman filter; no sampling techniques or numerical integration
methods are required. While no formal guarantees of convergence are provided, I analyse the statistical
properties of the proposed static-parameter estimator in extensive simulation studies (see section 8) and
find that it performs on par with simulation-based methods at a fraction of the computational cost. The
development of an asymptotic theory remains unresolved.
To introduce the proposed decomposition, I focus on the log-likelihood contribution of a single ob-
servation, ℓ(yt|Ft−1) := log p(yt|Ft−1). The equalities below follow immediately from the definition of
conditional densities and the assumption of the state-space model (1):
ℓ(yt|Ft−1) = ℓ(yt, αt|Ft−1) − ℓ(αt|yt, Ft−1) = ℓ(yt|αt) + ℓ(αt|Ft−1) − ℓ(αt|Ft). (35)
While the above decomposition is valid for any αt ∈ Rm, the resulting expression is not a computable
quantity, as the true latent state αt remains unknown. It is practical to evaluate the expression at the
Bellman-filtered state at|t and swap the order of the last two terms, such that
ℓ(yt|Ft−1) = ℓ(yt|αt)

αt=at|t
−
n
ℓ(αt|Ft) − ℓ(αt|Ft−1)
o
αt=at|t
| {z }
‘realised’ KL divergence
. (36)
The first term on the right-hand side, ℓ(yt|αt) evaluated at αt = at|t, quantifies the congruence (or
‘fit’) between the Bellman-filtered state at|t and the observation yt, which we wish to maximise. We
simultaneously aim to minimise the term in curly brackets, i.e. the difference ℓ(αt|Ft) − ℓ(αt|Ft−1) eval-
uated at αt = at|t. This difference can be viewed as a ‘realised’ version of the KL divergence between
the filtered and predicted densities; intuitively, it indicates the level of ‘surprise’ associated with the fil-
tered state at|t. The standard KL divergence between filtered and predicted densities would have read
E[log(αt|Ft)−log(αt|Ft−1)], which involves an expectation operator that integrates out the state αt using
the true density p(αt|Ft). Equation (36) contains no expectation but is simply evaluated at the filtered
state at|t; hence, it can be viewed as a realised version. The trade-off in equation (36) between maximising
the fit while minimising the surprise gives rise to a meaningful optimisation problem.
While decomposition (36) is exact, we do not generally have an exact expression for the terms in curly
brackets. To ensure that the log-likelihood contribution (36) is computable, I now turn to approximating
the realised KL divergence. In deriving the Bellman filter, I presumed that the researcher’s knowledge, as
measured in log-likelihood space for each time step, could be approximated by a multivariate quadratic
function. Extending this line of reasoning, I consider the following approximations of the two terms that
20


## Page 21

Forthcoming inJournal of Econometrics
compose the realised KL divergence:
ℓ(αt|Ft) ≈ 1
2 log det{It|t/(2π)} − 1
2(αt − at|t)′ It|t (αt − at|t), (37)
ℓ(αt|Ft−1) ≈ 1
2 log det{It|t−1/(2π)} − 1
2(αt − at|t−1)′ It|t−1 (αt − at|t−1). (38)
Here the state αt is understood as a variable in Rm, while at|t−1, at|t, It|t−1 ≥ 0 and It|t ≥ 0 are known
quantities determined by the Bellman filter in Table 2 or 3, depending on the context. If the model is linear
and Gaussian, then the Bellman filter is exact (it is, in fact, the Kalman filter), as are equations (37)–(38).
Based on approximations (37) and (38), the approximation of the realised KL divergence reads
ℓ(αt|Ft) − ℓ(αt|Ft−1)

αt=at|t
≈ 1
2 log det(It|t)
det(It|t−1) + 1
2(at|t − at|t−1)′ It|t−1 (at|t − at|t−1), (39)
where all constants involving π drop out. Nonnegativity of this quantity is guaranteed if It|t ≥ It|t−1,
which can be ensured in the implementation of the filter. Even when approximations (37)–(38) are
somewhat inaccurate, it may be that the approximation of their difference in equation (39) is quite
accurate. Intuitively, the realised KL divergence between two densities can be approximated to second
order by considering the difference between both argmaxes and the sharpness of both peaks.
To define the proposed approximate maximum-likelihood estimator (MLE) for the static parameters,
I take the usual definition bψ := arg maxP
t ℓ(yt|Ft−1). Then I substitute the (exact) decomposition (36)
and the KL approximation (39), which gives
bψ := arg max
ψ
nX
t=t0+1
(
ℓ(yt|at|t)| {z }
‘fit’ of the filter
−
h 1
2 log det(It|t)
det(It|t−1) + 1
2(at|t − at|t−1)′ It|t−1 (at|t − at|t−1)
| {z }
≥0, KL-type penalty
i)
, (40)
where all terms on the right-hand side implicitly or explicitly depend on the (hyper)parameter ψ. Time
t0 ≥ 0 is long enough to ensure the mode exists at time t0. If model (12) is stationary and α0 is drawn
from the unconditional distribution, as in the simulation studies in section 8, then t0 = 0. The case t0 > 0
is analogous to that for the Kalman filter when the first t0 observations are used to construct a ‘proper’
prior (see Harvey, 1990, p. 123). The first term inside curly brackets, involving the observation density, is
given by model (12). The remaining terms can be computed based on the output of the Bellman filter in
Table 2 or 3. Expression (40) can be viewed as an alternative to the prediction-error decomposition for
linear Gaussian state-space models (see e.g. Harvey, 1990, p. 126), the advantage being that estimator (40)
remains applicable—albeit as an approximation—outside the classic context of linear Gaussian state-space
models.
Corollary 2. Take the linear Gaussian state-space model specified in Corollary 1. Assume that the
Kalman-filtered covariance matrices {Pt|t} are positive definite. Estimator (40) then equals the MLE.
Estimator (40) is only slightly more computationally demanding than static-parameter estimation
using the Kalman filter. The sole source of additional computational complexity derives from the fact
that the Bellman filter in Table 2 or 3 may perform several optimisation steps for each time step, while
the Kalman filter performs only one. However, because each optimisation step is straightforward and few
steps are typically required, the additional computational burden is negligible.
21


## Page 22

Forthcoming inJournal of Econometrics
8 Simulation studies
8.1 Design
This section contains an extensive Monte Carlo study to investigate the performance of the Bellman
filter for a range of data-generating processes (DGPs). I consider 10 DGPs with linear Gaussian state
dynamics (12). (The empirical sections 9 and 10 consider high-dimensional and non-linear state dynamics,
respectively.) The observation densities for this simulation study are listed in Supplement R, which also
includes link functions, scores and other quantities used by the Bellman filter. To avoid selection bias,
these DGPs have been taken from Koopman et al. (2016). While the numerically accelerated importance-
sampling (NAIS) method in Koopman et al. (2015, 2016) has been shown to produce highly accurate
results, the Bellman filter turns out to be equally (if not more) accurate at a fraction of the computational
cost.
I add one DGP to the nine considered in Koopman et al. (2016): a local-level model with heavy-tailed
observation noise. While a local-level model with additive Gaussian observation noise would be solved
exactly by the Kalman filter, the latter does not adjust for heavy-tailed observation noise. Although the
Kalman filter remains the best linear unbiased estimator of the state, the results below show that the
(nonlinear) Bellman filter fares better.
The static (hyper)parameters for the first nine DGPs are taken from Koopman et al. (2016, Table 3).
In particular, the state-transition equation (i.e. αt = c+T αt−1+ηt with ηt ∼ N(0, σ2
η)) has parameters c =
0, T = ϕ = 0.98 and ση = 0.15, except for both dependence models, in which case c = 0.02, T = ϕ = 0.98
and ση = 0.10. In the observation densities (provided in Supplement R), the Student’s t distributions have
10 degrees of freedom, i.e. ν = 10, except for the local-level model, in which case ν = 3. The remaining
shape parameters are κ = 4 for the negative binomial distribution, κ = 1.5 for the Gamma distribution,
κ = 1.2 for the Weibull distribution and σ = 0.45 for the local-level model.
For each of the 10 DGPs, I simulate 1,000 time series of length 5,000. I take the first 2,500 observations
to represent the ‘in-sample’ period. For the purpose of static-parameter estimation, I use either (a) all
2,500 in-sample observations (long estimation window), (b) the last 1,000 in-sample observations (medium
estimation window), or (c) the last 250 in-sample observations (short estimation window). Based on these
parameter estimates, I run the Bellman filter and smoother in Table 3 on the entire dataset, including
the out-of-sample period from t = 2,501 through t = 5,000. For the Bellman filter, I also produce out-of-
sample ‘smoothed’ state estimates at|n using parameters estimated from in-sample period, but including
out-of-sample data for the purpose of smoothing.
I compute mean absolute errors (MAEs) and root mean squared errors (RMSEs) by comparing filtered
and smoothed states against their true (simulated) counterparts. 5 For each DGP and each method, the
reported average loss is based on 2 ,500 × 1,000 = 2.5 million filtered states. I consider five methods:
1. Infeasible mode estimator: For filtering, I compute the mode using the true static parameters
and a moving window of the most recent 250 observations; hence, 250 first-order conditions are
solved for each time step (larger windows result in excessive computational times). The final state
estimate at|t for each time t represents the filtered state. For smoothing, I use the mode estimator (3)
based on the true parameters with t = n (i.e. based on the full sample).
2. Bellman filter (BF): The algorithm in Table 3 is initialised using the unconditional distribution.
5The Bellman filter, being based on the mode, is technically suboptimal for both loss functions.
22


## Page 23

Forthcoming inJournal of Econometrics
Optimisation steps are performed until the estimated state is stable up to a tolerance of 0 .0001 (on
average, ∼5 iterations are needed). The logarithmic observation density is smooth and concave for
the first seven DPGs, in which case optimisation (16) is strongly concave; quasi-Newton methods
then quickly find the optimum (e.g. Nocedal and Wright, 2006). For simplicity, I pick Newton’s
method which proved fast and stable. For the last three DGPs, the logarithmic observation density
fails to be concave; in this case, I amend Newton’s method by replacing the Hessian of the logarith-
mic density by a weighted average of the Hessian and its expectation to ensure that the resulting
expression is negative with probability one. 6 For these DGPs, the same weighting scheme ensures
It|t ≥ It|t−1 as desired for the static-parameter estimator (40). Smoothed states are obtained as
stated in Table 3.
3. Particle filter (PF): I follow Malik and Pitt’s (2011) implementation of the continuous sampling
importance resampling (CSIR) particle filter, as it allows static parameters to be estimated using
the same numerical optimisers employed for other methods. Experimentation suggests that using
1,000 particles is necessary to achieve a performance similar to that of the other methods. The seed
that controls randomness is fixed beforehand, after which new random variates are drawn for each
of the 1 ,000 times series; variations on this setup make no noticeable difference. The mean and the
median of the particles at each time step are stored to compute RMSEs and MAEs, respectively.
4. Numerically accelerated importance sampler (NAIS): I follow Koopman et al. (2016), whose
code is available online, deviating slightly by computing not only the weighted mean but also the
weighted median of the (simulated) states. The resulting filtered states are used to compute RMSEs
and MAEs, respectively.
5. Kalman filter (KF):I follow Ruiz (1994) and Harvey and Shephard (1996) in using quasi maximum-
likelihood estimation (QMLE) to estimate the static parameters of both stochastic-volatility (SV)
models. For both SV models, the observations are squared and taking the logarithm produces a lin-
ear state-space model, albeit with biased and non-Gaussian observation noise (for details, see Ruiz,
1994 or Harvey et al., 1994). For the local-level model with heavy-tailed observation noise, the
Kalman filter is applied directly, i.e. without adjustments, and estimated by QMLE. For all three
models, filtered and smoothed states are obtained, respectively, by the familiar Kalman filter and
Rauch, Tung and Striebel smoother.
8.2 Results
This section compares (a) computational complexity, (b) quality of estimated (hyper)parameters, (c)
quality of filtered and (d) smoothed state estimates, and (e) coverage (and length) of predicted, filtered
and smoothed confidence intervals.
a. Computational complexity: Table 4 shows average computation times (in seconds per sample)
required for parameter estimation (based on the long estimation window) and filtering (based on all
data) for three methods (BF, PF and NAIS). The BF is considerably faster than both simulation-
based methods for the purposes of both parameter estimation and filtering. Compared to the NAIS
6For the dependence model with the Gaussian distribution, the weight placed on the expectation should weakly exceed
1/2. For the Student’s t distribution, this generalises to 1 /2 × (ν + 4)/(ν + 3). For the local-level model with heavy-tailed
noise, the weight given to the expectation should weakly exceed (1 + ν/3)/(1 + 3ν).
23


## Page 24

Forthcoming inJournal of Econometrics
Table 4: Average computing time (in seconds per sample) for parameter estimation and filtering
DGP Parameter estimation Filtering
Type Distribution PF NAIS BF NAIS PF BF
Count Poisson 51 1.1 0.25 4.0 0.7 0.0024
Count Negative binomial 146 3.1 0.64 5.2 1.0 0.0024
Intensity Exponential 43 1.1 0.24 3.4 0.6 0.0022
Duration Gamma 138 3.8 0.55 4.8 1.0 0.0026
Duration Weibull 162 8.4 0.84 9.4 1.4 0.0060
Volatility Gaussian 48 1.3 0.28 3.7 0.7 0.0023
Volatility Student’s t 95 2.7 0.70 5.2 1.0 0.0027
Dependence Gaussian 69 2.4 0.57 5.5 0.8 0.0050
Dependence Student’s t 129 6.4 1.21 7.1 1.1 0.0060
Local level Student’s t 176 n/a 1.01 n/a 0.9 0.0029
Note: BF = Bellman filter. PF = particle filter. NAIS = numerically accelerated impor-
tance sampler. Computation times are measured on a computer running 64-bit Windows
8.1 Pro with an Intel(R) Core(TM) i7-4810MQ CPU @ 2.80GHz. Average parameter es-
timation times are based on the first 2,500 observations across 1,000 repetitions for each
DGP. Average filtering times are based on filtering the entire sample of 5,000 observations
across 1,000 repetitions for each DGP.
method, parameter estimation by the BF is faster by a factor 4 to 10, while filtering is faster by a
factor between ∼1,000 and ∼2,000. Compared to the PF, parameter estimation by the BF is faster
by a factor between ∼100 and ∼250, while filtering is faster by a factor between ∼160 and ∼400.
b. (Hyper)parameter estimates: Table 5 displays average (hyper)parameter estimates and root
mean squared errors (RMSEs) versus the true parameters for three methods (BF, PF and NAIS) for
the long estimation window. Parameter estimates for the short and medium windows are presented
in Supplement S. The BF is about as accurate as both simulation-based methods for all three window
sizes in terms of both average parameters and RMSEs relative to the true parameters. The average
parameters are close to the true values and tend to be drawn even closer as the estimation window
is increased, while the RMSEs decrease rapidly. These simulation results suggest that, for these
models and sample sizes, any potential bias or loss of efficiency compared to the simulation-based
methods under investigation is negligible.
c. Filtered state estimates: Table 6 shows mean absolute errors (MAEs) of filtered states in the out-
of-sample period, reported relative to the MAEs of the infeasible mode estimator, for four methods:
BF, PF, NAIS and KF. The infeasible estimator uses true parameters and the same information set
as the filtering methods. The main finding is that the BF, PF and NAIS perform near identically,
while the KF, when applicable, lags substantially behind. 7 The out-of-sample performance of the
BF based on the long estimation window falls within ∼2% of that of the infeasible state estimator
across all DGPs. For this estimation window, the BF marginally outperforms the PF and NAIS
for three DGPs (for the Poisson, negative binomial and exponential distributions). It performs on
par with both these methods for four DGPs (with the Gamma/Weibull distributions and for the
Gaussian volatility and Student’s t dependence models), but is marginally outperformed for three
DGPs (for the Student’s t volatility, Gaussian dependence and local-level models), albeit by max
∼0.3%. Filtering results deteriorate by a few percentage points for the medium estimation window,
7This difference is not due to the choice of loss function; the relative performance of the KF deteriorates further when
reporting RMSEs (see Supplement T).
24


## Page 25

Forthcoming inJournal of Econometrics
Table 5: Average parameter estimates and RMSEs based on the long estimation window
DGP BF PF NAIS
Type Distribution Truth Average RMSE Average RMSE Average RMSE
Count Poisson c 0.000 −0.007 [0 .008] 0 .000 [0 .003] 0 .000 [0 .003]
ϕ 0.980 0 .977 [0 .007] 0 .978 [0 .006] 0 .978 [0 .006]
ση 0.150 0 .153 [0 .014] 0 .152 [0 .014] 0 .149 [0 .013]
Count Negative Bin. c 0.000 −0.004 [0 .005] 0 .000 [0 .003] 0 .000 [0 .003]
ϕ 0.980 0 .979 [0 .006] 0 .977 [0 .007] 0 .979 [0 .006]
ση 0.150 0 .149 [0 .015] 0 .152 [0 .016] 0 .145 [0 .015]
1/κ 0.250 0 .239 [0 .036] 0 .248 [0 .031] 0 .287 [0 .049]
Intensity Exponential c 0.000 −0.007 [0 .008] 0 .000 [0 .003] 0 .000 [0 .003]
ϕ 0.980 0 .976 [0 .008] 0 .978 [0 .007] 0 .978 [0 .007]
ση 0.150 0 .158 [0 .017] 0 .151 [0 .014] 0 .151 [0 .014]
Duration Gamma c 0.000 0 .007 [0 .008] 0 .000 [0 .004] 0 .000 [0 .004]
ϕ 0.980 0 .976 [0 .007] 0 .977 [0 .006] 0 .977 [0 .006]
ση 0.150 0 .158 [0 .015] 0 .152 [0 .013] 0 .152 [0 .013]
κ 1.500 1 .507 [0 .043] 1 .501 [0 .043] 1 .501 [0 .043]
Duration Weibull c 0.000 0 .009 [0 .010] 0 .000 [0 .003] 0 .000 [0 .003]
ϕ 0.980 0 .975 [0 .008] 0 .978 [0 .006] 0 .978 [0 .006]
ση 0.150 0 .160 [0 .018] 0 .152 [0 .013] 0 .152 [0 .013]
κ 1.200 1 .207 [0 .023] 1 .200 [0 .021] 1 .200 [0 .021]
Volatility Gaussian c 0.000 0 .007 [0 .008] 0 .000 [0 .004] 0 .000 [0 .004]
ϕ 0.980 0 .975 [0 .010] 0 .977 [0 .008] 0 .977 [0 .008]
ση 0.150 0 .166 [0 .026] 0 .152 [0 .018] 0 .152 [0 .018]
Volatility Student’s t c 0.000 0 .005 [0 .006] 0 .000 [0 .004] 0 .000 [0 .004]
ϕ 0.980 0 .975 [0 .010] 0 .977 [0 .008] 0 .977 [0 .008]
ση 0.150 0 .162 [0 .031] 0 .153 [0 .021] 0 .153 [0 .022]
1/ν 0.100 0 .089 [0 .030] 0 .100 [0 .010] 0 .097 [0 .023]
Dependence Gaussian c 0.020 0 .021 [0 .009] 0 .024 [0 .011] 0 .024 [0 .011]
ϕ 0.980 0 .979 [0 .008] 0 .977 [0 .010] 0 .977 [0 .010]
ση 0.100 0 .095 [0 .020] 0 .103 [0 .024] 0 .103 [0 .024]
Dependence Student’s t c 0.020 0 .022 [0 .010] 0 .025 [0 .013] 0 .025 [0 .014]
ϕ 0.980 0 .977 [0 .010] 0 .975 [0 .013] 0 .975 [0 .014]
ση 0.100 0 .098 [0 .023] 0 .106 [0 .029] 0 .107 [0 .030]
1/ν 0.100 0 .103 [0 .012] 0 .100 [0 .006] 0 .098 [0 .025]
Level Student’s t c 0.000 0 .000 [0 .004] 0 .000 [0 .003]
ϕ 0.980 0 .979 [0 .005] 0 .978 [0 .005]
ση 0.150 0 .139 [0 .013] 0 .151 [0 .008]
σ 0.450 0 .453 [0 .025] 0 .451 [0 .027]
1/ν 0.333 0 .277 [0 .066] 0 .332 [0 .024]
Note: BF = Bellman filter. PF = Particle filter. NAIS = Numerically accelerated importance sampler. RMSE
= root mean squared error. I simulated 1 ,000 time series each of length 5 ,000 for 10 data-generating processes
with linear Gaussian state dynamics (12), i.e. αt+1 = c + ϕαt + ηt+1 with ηt+1 ∼ N(0, σ2
η). The observation den-
sities are listed in Supplement R. The estimation of static parameters is based on the long estimation window,
which consists of 2,500 observations. Parameter estimation is performed as follows: Bellman filter: based on es-
timator (40); Particle filter: as in Malik and Pitt (2011); Importance sampler: as in Koopman et al. (2015, 2016).
and by ∼10−30% for the short estimation window, in paricular for both dependence models. Even
for the short estimation window, the results for the BF, PF and NAIS are virtually identical with
the KF lagging behind. The robustness of the BF means that it compares favourably with the KF
for both the SV and local-level models: e.g. for the local-level model, the maximum absolute error
in the out-of-sample period, averaged across 1 ,000 samples, is 1 .80 for the KF; double that for the
25


## Page 26

Forthcoming inJournal of Econometrics
Table 6: MAEs of filtered states in out-of-sample period
Short estimation Medium estimation Long estimation
Infeasible window (250 obs.) window (1,000 obs.) window (2,500 obs.)
DGP estimator BF PF NAIS KF BF PF NAIS KF BF PF NAIS KF
Type Distribution MAE Relative MAE Relative MAE Relative MAE
Count Poisson 0 .283 1 .145 1 .141 1 .140 1 .015 1 .015 1 .016 1 .001 1 .002 1 .003
Count Neg. Bin. 0 .300 1 .159 1 .154 1 .155 1 .018 1 .019 1 .020 1 .005 1 .006 1 .007
Intensity Exponential 0 .286 1 .128 1 .130 1 .128 1 .013 1 .014 1 .014 1 .002 1 .003 1 .003
Duration Gamma 0 .259 1 .158 1 .156 1 .154 1 .023 1 .024 1 .023 1 .007 1 .007 1 .007
Duration Weibull 0 .264 1 .117 1 .115 1 .114 1 .012 1 .012 1 .012 1 .001 1 .001 1 .001
Volatility Gaussian 0 .337 1 .198 1 .200 1 .200 1 .473 1 .023 1 .023 1 .023 1 .230 1 .005 1 .005 1 .005 1 .230
Volatility Student’s t 0.352 1 .231 1 .213 1 .217 1 .574 1 .038 1 .029 1 .030 1 .336 1 .012 1 .009 1 .010 1 .275
Dependence Gaussian 0 .288 1 .291 1 .296 1 .290 1 .056 1 .056 1 .055 1 .018 1 .016 1 .016
Dependence Student’s t 0.295 1 .301 1 .313 1 .291 1 .063 1 .065 1 .067 1 .022 1 .022 1 .022
Level Student’s t 0.159 1 .059 1 .045 1 .196 1 .014 1 .004 1 .128 1 .003 1 .000 1 .122
Note: MAE = mean absolute error. BF = Bellman filter. PF = particle filter. NAIS = numerically accelerated impor-
tance sampler. KF = Kalman filter. I simulated 1 ,000 time series each of length 5 ,000 for 10 data-generating processes
of type (12); the observation densities are listed in Supplement R. The data is split in an ‘in-sample’ period (first 2 ,500
observations) and an ‘out-of-sample’ period (last 2 ,500 observations). The short, medium and long estimation windows
consist of the 250, 1,000 or 2,500 observations, respectively, of the in-sample period. Filtered states based on simulation-
based methods (importance sampler and particle filter) are computed by taking the median of the simulated states.
In all cases, MAEs are computed by comparing the last 2 ,500 filtered states with their true (simulated) counterparts.
MAEs are reported relative to the MAE of the infeasible mode estimator.
Table 7: MAEs of smoothed states in out-of-sample period
Short estimation Medium estimation Long estimation
Infeasible window (250 obs.) window (1,000 obs.) window (2,500 obs.)
DGP estimator BF KF BF KF BF KF
Type Distribution MAE Relative MAE Relative MAE Relative MAE
Count Poisson 0.222 1.118 1.020 1.013
Count Neg. Bin. 0.236 1.139 1.018 1.009
Intensity Exponential 0.222 1.099 1.021 1.016
Duration Gamma 0.201 1.168 1.040 1.024
Duration Weibull 0.204 1.096 1.026 1.021
Volatility Gaussian 0.266 1.196 1.628 1.033 1.259 1.022 1.221
Volatility Student’s t 0.280 1.247 2.156 1.047 1.433 1.024 1.366
Dependence Gaussian 0.240 1.359 1.056 1.018
Dependence Student’s t 0.247 1.379 1.064 1.021
Level Student’s t 0.126 1.035 1.154 1.017 1.131 1.015 1.129
Note: For the simulation setting, see the note to Table 6. For the SV models, the static parameters in the Kalman
filter are estimated by QMLE as in Ruiz (1994), after which the RTS smoother is applied (Rauch et al., 1965). MAEs
are reported relative to the MAE of the infeasible estimator (3).
BF (0.90). The BF is thus more robust in the face of heavy-tailed observation noise, while having
only a single additional parameter to estimate (the degrees of freedom of the observation noise, ν).
d. Smoothed state estimates: Table 7 shows the MAEs of smoothed states in the out-of-sample
period obtained by the Bellman filter/smoother combination in Table 3, where the static parame-
ters are estimated based on three different in-sample estimation windows. The results are reported
relative to those of the infeasible state estimator (3) with t = n, which similarly exploits all data
and uses the true parameters. Where appropriate, results are also reported for the Kalman fil-
ter/smoother. The performance of the Bellman filter/smoother using the long estimation window
26


## Page 27

Forthcoming inJournal of Econometrics
Table 8: Coverage (in %) and average length (in square brackets) of Bellman-predicted, -filtered and
-smoothed confidence intervals for different parameter-estimation windows
Short estimation Medium estimation Long estimation
DGP window (250 obs.) window (1,000 obs.) window (2,500 obs.)
Type Distribution Predict Filter Smooth Predict Filter Smooth Predict Filter Smooth
Count Poisson 90 .2 90 .6 92 .5 94 .7 94 .8 94 .7 95 .2 95 .3 94 .9
[1.52] [1 .41] [1 .17] [1 .51] [1 .41] [1 .11] [1 .51] [1 .41] [1 .11]
Count Neg. Bin. 89 .5 89 .7 91 .7 94 .3 94 .3 94 .3 94 .9 94 .9 94 .6
[1.61] [1 .50] [1 .24] [1 .57] [1 .48] [1 .16] [1 .57] [1 .48] [1 .16]
Intensity Exponential 90 .8 91 .1 93 .4 95 .4 95 .4 95 .5 95 .8 95 .8 95 .5
[1.56] [1 .46] [1 .20] [1 .57] [1 .47] [1 .16] [1 .57] [1 .47] [1 .15]
Duration Gamma 90 .8 90 .9 92 .1 95 .2 95 .2 94 .9 95 .7 95 .7 95 .3
[1.43] [1 .31] [1 .06] [1 .44] [1 .32] [1 .04] [1 .44] [1 .33] [1 .03]
Duration Weibull 92 .4 92 .6 94 .3 95 .6 95 .6 95 .5 96 .0 95 .9 95 .5
[1.50] [1 .37] [1 .12] [1 .48] [1 .36] [1 .07] [1 .48] [1 .36] [1 .06]
Volatility Gaussian 88 .1 88 .4 90 .8 95 .3 95 .3 95 .5 96 .1 96 .0 95 .8
[1.81] [1 .73] [1 .47] [1 .84] [1 .76] [1 .42] [1 .84] [1 .77] [1 .41]
Volatility Student’s t 88.4 88 .4 90 .5 94 .5 94 .5 94 .7 95 .4 95 .3 95 .2
[1.98] [1 .87] [1 .61] [1 .88] [1 .81] [1 .46] [1 .87] [1 .80] [1 .44]
Dependence Gaussian 73 .9 74 .0 75 .7 90 .5 90 .6 91 .2 93 .1 93 .1 93 .1
[1.26] [1 .23] [1 .10] [1 .37] [1 .34] [1 .14] [1 .39] [1 .36] [1 .14]
Dependence Student’s t 71.9 71 .9 73 .5 90 .4 90 .4 91 .2 93 .0 93 .1 93 .4
[1.28] [1 .25] [1 .13] [1 .42] [1 .40] [1 .20] [1 .43] [1 .41] [1 .19]
Level Student’s t 93.1 93 .5 94 .7 94 .9 95 .0 95 .2 95 .1 95 .1 95 .3
[0.98] [0 .80] [0 .65] [0 .99] [0 .81] [0 .64] [0 .99] [0 .81] [0 .64]
Note: For the simulation setting, see the note to Table 6.
lies within ∼2% of that of the infeasible state estimator across all DGPs. The performance com-
pared with the filtering results in Table 6 is improved by ∼20%. This shows that smoothing has
substantial benefits, which the Bellman filter/smoother successfully exploits. The KF smoothing
results are comparatively poor, especially for the short estimation window. Neither Malik and Pitt
(2011) nor Koopman et al. (2016) present smoothing methods; hence, no PF or NAIS smoothing
results are reported.
e. Coverage of confidence intervals:Table 8 shows the coverage of approximate Bellman-predicted,
-filtered and -smoothed confidence intervals with endpoints given byat|t−1 ± 2/pIt|t−1, at|t ± 2/pIt|t
and at|n ± 2/pIt|n, respectively, as well as the average length of these intervals, where the estimation
of static parameters is based on three possible window sizes. These confidence intervals are based
on the quadratic approximation of the value function and are analogous to those in the Kalman
filter. For brevity, both simulation-based approaches are excluded. The Bellman-predicted, -filtered
and -smoothed confidence intervals based on the medium and long estimation windows tend to be
fairly accurate, containing the true states ∼93 − 96% of the time for most DGPs and ∼90−96%
for both dependence models. Confidence intervals based on the short estimation window tend to
be overly optimistic, especially for the two dependence models. Finally, the length of confidence
intervals based on the smoothed states is substantially reduced, while the coverage remains good for
the medium and long estimation windows, further highlighting the benefits of smoothing.
27


## Page 28

Forthcoming inJournal of Econometrics
9 Application I: High-dimensional state space
This section considers the modelling of high-dimensional cloud-intensity data from a regional climate
model as in Katzfuss et al. (2020). In a simulation study with realistic parameter values, I demonstrate
that the performance of the Bellman filter is unaffected as the dimension of the state increases from
10 to 150, while the performance of the standard (bootstrap) particle filter deteriorates sharply—even
when using very many particles. When predicting real data, I show that the Bellman filter substantially
outperforms the particle-ensemble Kalman filter in Katzfuss et al. (2020) and the exact approximation of
the Rao-Blackwellised particle filter in Johansen et al. (2012).
9.1 Model
Following Katzfuss et al. (2020, p. 868), I consider a multivariate overdispersed Poisson density that
generates an integer number of clouds recorded at adjacent locations over a period of time, in combination
with a linear Gaussian state equation for the logarithmic cloud intensities. The model for t = 1 , . . . , n
reads
yt ∼ Poisson(exp(βt)), yt ∈ Nm, βt ∈ Rm, (41)
βt = αt + ξt, ξt ∼ i.i.d. N(0m, σ2
ξ 1m×m), (42)
αt = (1m×m − T ) c + T αt−1 + ηt, ηt ∼ i.i.d. N(0m, Q), (43)
where αt ∈ Rm is the latent state, βt ∈ Rm is an overdispersed (i.e. noisy) realisation of αt with overdis-
persion parameter σξ ≥ 0, and yt ∈ Nm is a vector of m Poisson-generated counts with corresponding
intensities exp(βt). The exponent of a vector in equation (41) is understood elementwise, i.e. observation
yi,t is drawn independently from a Poisson density with intensity exp( βi,t) for each i = 1, . . . , m. When
σξ = 0, such that αt = βt for all t, the model collapses to a standard state-space model with state vector
αt of length m. For σξ > 0, the hierarchical structure (41)–(43) can be cast in the standard state-space
format as I show below, where the dimension of the state is 2 m. Models with σξ = 0 and σξ > 0 are
referred to as the ‘standard’ and ‘overdispersed’ versions of the model, respectively.
The system vectors and matrices in the state-transition equation are c ∈ Rm and T , Q ∈ Rm×m.
Following Katzfuss et al. (2020), I assume that T is tridiagonal with γ1 on the main diagonal, γ2 above
the main diagonal, and γ3 below the main diagonal. Intuitively, these parameters govern the probability
of cloud intensities staying in place or drifting left or right. As in Katzfuss et al. (2020), I assume new
cloud formation to be more highly correlated at shorter distances. Specifically, the covariance matrix
Q is assumed to be a spatial Mat` ern covariance matrix, with a smoothness of 1 .5, spatial dependence
parameter λ > 0, and overall scale governed by τ > 0, i.e. ( Q)ij = τ 2(1 +
√
3|i − j|/λ) exp(−
√
3|i − j|/λ)
for i, j = 1, . . . , m. While Katzfuss et al. (2020) set c = 0m, I consider the more general case c ̸= 0m,
where c can be interpreted as the long-run average of αt if the eigenvalues of T lie inside the unit circle.
For simplicity I set c = c1m, where a single parameter c ∈ R controls the overall level. Static parameters
are collected in the vector ψ = (c, γ1, γ2, γ3, τ, λ, σξ)′.
28


## Page 29

Forthcoming inJournal of Econometrics
Figure 2: MAE of filtered states and filtering times (in seconds per sample)
10 30 60 90 120 150
0.3
0.4
0.5
0.6
0.7
(a) Mean absolute error
10 30 60 90 120 150
10-1
100
101
102
103 (b) Filtering time (seconds/sample)
Note: MAE = mean absolute error. I simulated 100 instances of the model (41)–(43) with n = 80 time steps and
static parameters ψ = (0, 0.4, 0, 0.4, 0.8, 5, 0)′ for various values of the state dimension m. Using the true static pa-
rameter for the purpose of filtering, I recorded the MAE of the filtered states at|t relative to the true (simulated)
states αt and runtime in seconds per sample for the Bellman filter and particle filter, where the latter was imple-
mented with 10 4, 105 and 106 particles.
9.2 State-space formulation and Bellman-filter implementation
For σξ > 0, a standard state-space model can be obtained by writing the dynamics of αt and βt jointly as
"
βt
αt+1
#
=
"
0m
(1m×m − T )c
#
+
"
0m×m 1m×m
0m×m T
#"
βt−1
αt
#
+
"
ξt
ηt+1
#
, (44)
where {ξt} and {ηt} are series of i.i.d. disturbances with characteristics specified in equations (42)–(43).
The state vector in the overdispersed model is ( β′
t, α′
t+1)′ ∈ R2m, which is 120-dimensional when m = 60
(as in Katzfuss et al., 2020). The Bellman filter in Table 3 is directly applicable after appropriate redefi-
nitions; e.g. c in Table 3 should be identified with the first vector on the right-hand side of equation (44).
The Bellman filter solves a high-dimensional optimisation problem at each time step. The logarithmic
Poisson density is jointly concave in all elements of βt. The Bellman-filtered state in equation (16) then
is unique; it can typically be found using e.g. Newton steps. To avoid the need for repeated large-matrix
inversions, however, I opted for the Broyden-Fletcher-Goldfarb-Shanno (BFGS) algorithm (e.g. Nocedal
and Wright, 2006, §6.1), which proved both fast and stable. Indeed, at the estimated parameter values,
executing the Bellman filter for the standard (overdispersed) model using data from Katzfuss et al. (2020),
involving a 60-dimensional (120-dimensional) optimisation problem for each of 80 time steps, takes about
∼0.25 (∼0.60) seconds. In both cases, convergence with a tolerance of 10 −5 at each time step is reached
within ∼12 BFGS optimisation steps.
29


## Page 30

Forthcoming inJournal of Econometrics
9.3 Simulation study with high-dimensional state space
This section investigates the performance of the Bellman filter in high-dimensional state spaces by per-
forming a simulation study for the model (41)–(43) with varying spatial dimension m. I compare the
Bellman filter’s performance against that of the standard (bootstrap) particle filter. For simplicity, the
static parameter ψ is considered known and taken as ψ = (c, γ1, γ2, γ3, τ, λ, σξ)′ = (0, 0.4, 0, 0.4, 0.8, 5, 0)′,
which is similar to the empirical parameter estimates obtained from real data. As in the real data, the
relatively large value of γ3 = 0.4 reflects the fact that logarithmic cloud intensities tend to float from lower
to higher location numbers, which may be due to a fixed wind direction during the observation period.
The overdispersion parameter σξ is set to zero, as my empirical study contains no evidence to suggest
otherwise. For σξ = 0, the state-augmentation procedure (44) is not required; hence, the dimension of
the state space is simply m. I investigate cases where m equals 10, 30, 60, 90, 120 or 150, thus exploring
different spatial dimensions beyond that of the real data set considered in Katzfuss et al. (2020), where
m = 60. For each m, I simulate 100 datasets with 80 time steps, matching the time dimension of the real
data.
The particle filter is subject to the curse of dimensionality and may struggle in higher dimensions
(e.g. Surace et al., 2019). Hence, I experiment with 10 4, 10 5 and 10 6 particles; increasing this number
further turns out to be computationally infeasible (see further discussion below). I compute the median
of the particles as the filtered state. For both methods, mean absolute errors (MAEs) of filtered states are
computed by taking the one-norm of the vector at|t − αt ∈ Rm, dividing this norm by m, and averaging
the resulting quantity across 80 time steps and 100 simulated data sets.
Figure 2 (Panel A) shows that the MAE of the Bellman filter is almost entirely flat at ∼0.34, indepen-
dently of the dimension m. In fact, the MAE appears to improve slightly as the dimension m increases,
possibly because the filter benefits from improved predictions: cloud observations even in distant locations
may, due to wind conditions, be informative as to the possible future presence of clouds at other locations.
In contrast, the MAE of the particle filter increases sharply with m and substantially exceeds that of the
Bellman filter even at m = 60 or m = 90. This heightened inaccuracy in higher dimensions materialises
for any (fixed) number of particles. Even with 10 6 particles, the particle filter at m = 150 produces an
MAE of ∼0.63, a factor ∼1.8 higher than that of the Bellman filter.
Figure 2 (Panel B) shows that using 10 6 particles in m = 150 dimensions necessitates a filtering
time of ∼800 seconds per simulated dataset, such that the total runtime for the particle filter across 100
simulations is 100 × 800 seconds = ∼22 hours. The BFGS implementation of the Bellman filter required
between 0.03 seconds (for m = 10) and 0 .80 seconds (for m = 150), translating in the latter case to a
total runtime across 100 simulations of only ∼1.3 minutes. Panel B also shows that the computational
complexity of the particle filter scales with the number of particles employed: for 10 6 particles, the
difference with the Bellman filter is around three orders of magnitude for any m. The relative accuracy
and speed of the Bellman filter as demonstrated in this section can largely be attributed to its approach
to optimisation, which is simpler than the sampling/integration approach used in the particle filter—
especially in higher dimensions.
9.4 Real-data application with artificially missing data
For the real-data application, I take the cloud-motion data investigated by Katzfuss et al. (2020), which
contains m = 60 locations along a spatial transect (i.e. a line), where the number of visible clouds is
recorded at each of n = 80 time steps. Following their procedure, I artificially introduce ‘missing data’
30


## Page 31

Forthcoming inJournal of Econometrics
Table 9: Full-sample-with-missing-data parameter estimates for model (41)–(43)
c γ 1 γ2 γ3 τ λ σ ξ MSE CRPS
Standard model −3.656 0 .254 0 .050 0 .372 1 .749 7 .040 0 .513 0 .185
[0.242] [0 .053] [0 .040] [0 .056] [0 .100] [0 .471]
Standard model ( c = 0) 0 .260 0 .127 0 .482 1 .771 8 .295 0 .547 0 .192
[0.060] [0 .047] [0 .055] [0 .108] [0 .561]
Overdispersed model −4.236 0 .245 0 .055 0 .384 1 .839 7 .249 0 .000 0 .509 0 .185
[0.072] [0 .025] [0 .033] [0 .027] [0 .053] [0 .053] [0 .018]
Overdispersed model ( c = 0) 0 .230 0 .142 0 .494 1 .791 8 .301 0 .000 0 .556 0 .197
[0.055] [0 .045] [0 .047] [0 .102] [0 .346] [0 .035]
Note: MSE = mean squared error. CRPS = continuously ranked probability score. The standard model
has σξ = 0, while the overdispersed model has σξ > 0. Numerical standard errors in square brackets are
computed by taking the square root of diagonal elements of the inverse of the negative finite-difference
Hessian matrix. Using the output of the Bellman filter at times and locations where observations were
declared missing, I produce ‘nowcasts’ of missing data, the quality of which can be judged on the basis of
MSE and CRPS values in the right-most columns.
by assuming that at each time step only 90% of the locations, i.e. 54 randomly selected locations, deliver
a measurement that the researcher can use for parameter estimation and state filtering. The remaining
80 × 6 = 480 observations are declared ‘missing’, but remain available for testing. For reproducibility, the
same missing data are considered as in Katzfuss et al. (2020), whose code is available online. The aim is
to ‘nowcast’ the (same) missing data by running the Bellman filter on the available data.
To implement the Bellman filter with missing data, I write the logarithm of the observation density
at time t used in the Bellman-filter update (16) as
log Poisson(yt| exp(βt)) =
X
i∈Ot
log Poisson(yi,t| exp(βi,t)), (45)
where Ot is the set of available observations at time t; i.e. log-likelihood contributions of missing data are
excluded. The Bellman filter in Table 3 remains applicable as long as the score and (realised) informa-
tion quantities are computed by taking derivatives of the logarithmic density on the right-hand side of
equation (45). This implies that elements of the score vector corresponding to missing observations are
set to zero. Nevertheless, the Bellman-filtered states at times and locations for which observations are de-
clared missing remain non-trivial, because the filtered state—representing the solution to an optimisation
problem—is affected by all available observations at a given time step. The Bellman filter in Table 3 is
initialised with I1|0 equal to a small multiple of the identity. The static parameter ψ is estimated using
the approximate maximum-likelihood estimator (40), employing equation (45) to exclude data declared
missing.
9.5 Results: Full sample with missing data
Table 9 contains the resulting parameter estimates for various model specifications, where the parameter-
estimation procedure used all data deemed available. Consistent with Katzfuss et al. (2020), in all specifi-
cations the relatively large estimate of γ3 picks up the drift of clouds along the spatial transect, indicating
that clouds tend to float from lower to higher location numbers. While Katzfuss et al. (2020) investigated
only the overdispersed model, our comparison of the overdispersed model and the standard model yields
31


## Page 32

Forthcoming inJournal of Econometrics
Figure 3: Expanding-window parameter estimation results for model (41)–(43)
0 10 20 30 40 50 60 70 80
0
0.1
0.2
0.3
0.4
(a) Estimates of γ1, γ2, γ3
0 10 20 30 40 50 60 70 80
-10
-8
-6
-4
-2
0
2
4
6
8
10
12 (b) Estimates of λ, τ, σξ, c
Note: Parameters estimated by an expanding window using cloud data from Katzfuss et al. (2020).
no evidence that the former is preferable to the latter: estimates of the overdispersion parameter σξ are
practically zero. On the other hand, the inclusion of an additional parameter c governing the overall level
appears to be beneficial.
Running the Bellman filter on the entire sample with missing data produces filtered states at times
and locations for which observations were declared missing. By taking the exponent, a filtered state
translates to an intensity, which in turn equals the expected value of a draw from the relevant Poisson
distribution. This allows us to produce both point and density ‘nowcasts’ of missing data conditional on
the available data up to and including the relevant time step. Following Katzfuss et al. (2020), these point
and density nowcasts can be compared with the actual observations using the mean squared error (MSE)
and continuously ranked probability score (CRPS), respectively, which are reported in the right-most
columns of Table 9. Depending on the model specification, the MSEs of the Bellman filter lie in the range
∼0.51−0.56, the CRPS in ∼0.18−0.20. These numbers are not (yet) directly comparable with those in
Katzfuss et al. (2020), who use an expanding window for the purpose of parameter estimation. This is
addressed in the next section.
9.6 Results: Expanding window with missing data
The highly parametrised model (41)–(43) allows us to estimate the static parameters in an expanding-
window-with-missing-data setting, starting with a window of one time step. For the most general (i.e.
overdispersed) version of model, Figure 3 shows the parameter estimates over time. At the end of the
sample, the parameter estimates match the results in Table 9. For all time steps, the estimate of σξ is
practically zero. After some variation at the start of the sample, the estimates of λ, τ and c converge
relatively quickly. The estimates of γ1, γ2, γ3, however, show considerable time variation even towards the
end of the sample, indicating that these parameters may not in fact be static. This may explain why the
expanding-window results, discussed below, appear to be no worse than the full-sample results.
32


## Page 33

Forthcoming inJournal of Econometrics
Table 10: Quality of nowcasts using an expanding window for parameter estimation and filtering
Model Method MSE CRPS
Overdispersed (σξ > 0) Rao-Blackwellised particle filter ( c = 0, Johansen et al., 2012) 1.26 0.33
Particle ensemble Kalman filter ( c = 0, Katzfuss et al., 2020) 0.75 0.25
Bellman filter (c = 0) 0 .554 0 .194
Bellman filter (c ̸= 0) 0 .519 0 .188
Standard (σξ = 0) Bellman filter ( c = 0) 0 .556 0 .196
Bellman filter (c ̸= 0) 0 .525 0 .190
Note: MSE = mean squared error. CRPS = continuously ranked probability score. The data (including
the classification of training and test data) are available from Katzfuss et al. (2020). The first two rows are
copied from Katzfuss et al. (2020), who consider only the overdispersed model with c = 0.
For the purpose of nowcasting missing data, Table 10 shows that both the standard ( σξ = 0) and
overdispersed (σξ > 0) versions of the model with c ̸= 0 achieve MSEs of ∼0.52, with the particle ensem-
ble Kalman filter and Rao-Blackwellised particle filter lagging behind by ∼45% and ∼140%, respectively.
Irrespective of the exact specification, the Bellman filter achieves CRPS values of ∼0.19, with the cor-
responding numbers for both particle-filtering methods inflated by ∼30% and ∼75%. This demonstrates
that Bellman filter can outperform state-of-the-art particle filtering methods in high-dimensional settings,
while the computational burden remains low.
10 Application II: Nonlinear and degenerate state dynamics
This section considers a recent state-space model in financial econometrics featuring multidimensional,
nonlinear and degenerate state dynamics. A simulation study demonstrates that the Bellman filter out-
performs the particle filter for the purposes of both parameter estimation and filtering, while an empirical
application using real data yields similar results for both methods.
10.1 Model
Catania (2022, eq. 1) considers a stochastic-volatility model with a general leverage specification:
yt = µ + exp(ht/2) εt, ε t ∼ i.i.d. N(0, 1), (46)
ht = c + φ ht−1 + ση ηt, (47)
ηt =
kX
j=0
ρj εt−j + σξ ξt, ξ t ∼ i.i.d. N(0, 1). (48)
Here, yt is a financial log return, with median (but not mean, as we shall see) µ. The dynamics for the
log-volatility process {ht} feature the intercept c, persistence parameter |φ| < 1 and variability ση > 0.
The volatility shock ηt is a linear function of current and lagged return shocks, i.e. εt, . . . , εt−k, where
k ≥ 0 represents the maximum lag length. Unlike in standard volatility models, the return shock εt
and log-volatility ht are generally dependent; both are related to ηt whenever ρ0 ̸= 0. When ρ0 < 0, as
is typical for financial returns, a negative return shock εt tends to coincide, contemporaneously, with a
positive volatility shock ηt. This is known as the ‘volatility-feedback effect’ (e.g. Carr and Wu, 2017) and
implies that the distribution of yt is negatively skewed, explaining why µ is the median but not generally
33


## Page 34

Forthcoming inJournal of Econometrics
the mean. While Catania (2022) sets µ = 0, the introduction of µ enables a more accurate estimation of
ρ0 by disentangling the location and scale. Parameters ρj ∈ (−1, 1) for j = 1, . . . , k quantify a generalised
‘leverage effect’: the impact of multiple lagged return shocks εt−j on the volatility shock ηt. Catania
(2022) sets σ2
ξ = 1 −Pk
j=0 ρ2
j withPk
j=0 ρ2
j < 1 to ensure that the unconditional variance of ηt is unity;
this is required for the identification of ση.
10.2 State-space formulation
Model (46) through (48) can be written in the general state-space format (1) if the latent state is identified
as at = (ht, ht−1, . . . , ht−k)′ ∈ Rk+1, which contains the log volatility ht as well as k lags. As shown in
Supplement U, the probability density of yt ∈ R conditional on the (now multidimensional) state at and
the information set at time t − 1 is Gaussian with mean µy,t and standard deviation σy,t as follows:
p(yt|at, Ft−1) = 1
σy,t
√
2π exp

−(yt − µy,t)2
2σ2
y,t
!
, σ y,t = exp(ht/2)
s
1 − ρ2
0
1 −Pk
j=1 ρ2
j
, (49)
µy,t = µ + ρ0
1 −Pk
j=1 ρ2
j
exp(ht/2)

 ht − c − φ ht−1
ση
−
kX
j=1
ρj
yt−j − µ
exp(ht−j/2)

 .
The mean µy,t depends on the log volatility ht as well as k of its lags (except when ρ0 = 0), such that
yt provides information about the entire state vector at = ( ht, . . . , ht−k)′. This implies that, at each
time step, k + 1 logarithmic volatilities must be estimated; this insight will be important for the choice
of estimation method. The density of the state vector at conditional on the previous state and the
information set Ft−1 is a degenerate Gaussian (for details, see Supplement U). The first element of at
(i.e. ht) has a proper distribution, while lagged versions of ht are not random when the conditioning set
includes the previous state at−1:
p(at|at−1, Ft−1) = 1
σh,t
√
2π exp

−(ht − µh,t)2
2σ2
h,t
!
×
kY
j=1
δ(aj+1,t − aj,t−1), (50)
µh,t = c + φ ht−1 + ση
kX
j=1
ρj
yt−j − µ
exp(ht−j/2) , σ h,t = ση
vuut1 −
kX
j=1
ρ2
j .
Here, aj,t denotes the j-th element of the state vector at = (ht, ht−1, . . . , ht−k)′, and δ(·) denotes the Dirac
delta function. The product of Dirac deltas ensures that the second element of at equals the first element
in at−1, and so on. The resulting state dynamics are multidimensional, nonlinear and degenerate. This
is problematic, as parameter estimation for multidimensional states (Kantas et al., 2015, p. 335) and/or
degenerate state dynamics (K¨ unsch, 2013, p. 1396) using particle-filtering methods remains a challenge
that has not yet been fully resolved in the literature. For the same reasons, approximate filters such as
that in Koyama et al. (2010) are ruled out.
10.3 Parameter-estimation methods
Catania (2022) estimates the static parameters of the state-space model (49) and (50) using a univariate
implementation of Malik and Pitt’s (2011) continuous sampling importance resampling (CSIR) method.
The effect of this univariate approach on parameter estimation and model selection is a priori unclear.
34


## Page 35

Forthcoming inJournal of Econometrics
Table 11: Average parameter estimates across 100 samples, standard deviations (in parentheses) and the
average of numerical standard errors (in square brackets).
Parameter estimates MAE
µ c φ σ η ρ0 ρ1 ρ2 ht|t−1
True value → 0.0015 −0.200 0 .980 0 .250 −0.700 −0.400 0 .300 ht
Bellman filter 0 .0015 −0.207 0 .979 0 .252 −0.651 −0.438 0 .294 0 .358
(0.0001) (0 .038) (0 .004) (0 .024) (0 .089) (0 .115) (0 .101)
[0.0001] [0 .033] [0 .003] [0 .026] [0 .094] [0 .107] [0 .102]
Particle filter 0 .0016 −0.262 0 .974 0 .279 −0.739 −0.109 0 .095 0 .382
(0.0002) (0 .155) (0 .016) (0 .051) (0 .110) (0 .293) (0 .203)
[0.0001] [0 .004] [0 .001] [0 .004] [0 .004] [0 .005] [0 .005]
True value → 0.0015 −0.200 0 .980 0 .250 −0.400 −0.700 0 .300 ht
Bellman filter 0 .0015 −0.208 0 .979 0 .265 −0.355 −0.715 0 .306 0 .335
(0.0001) (0 .033) (0 .004) (0 .034) (0 .083) (0 .062) (0 .084)
[0.0001] [0 .034] [0 .004] [0 .033] [0 .088] [0 .064] [0 .089]
Particle filter 0 .0015 −0.242 0 .976 0 .250 −0.471 −0.441 0 .061 0 .358
(0.0003) (0 .099) (0 .010) (0 .062) (0 .207) (0 .347) (0 .258)
[0.0001] [0 .005] [0 .001] [0 .006] [0 .007] [0 .007] [0 .008]
Note: MAE = mean absolute error. For both sets of true parameter values, I simulate 100 samples of length 5 ,000
and compute parameter estimates based on the first 2 ,500 observations. For the Bellman filter, the proposed ap-
proximate estimator (40) is used. For the particle filter, I follow Catania (2022) in using Malik and Pitt’s (2011)
continuous sampling importance resampling (CSIR) particle filter with 5,000 particles. For each sample I compute,
in addition to parameter estimates, numerical standard errors by inverting the negative Hessian matrix evaluated
at the peak and taking the square root of the diagonal. I exclude standard errors based on non-invertible Hessian
matrices, which were encountered in ∼40% of samples based on the CSIR method. Using estimated parameters,
I make out-of-sample predictions by running the filter on the entire data set, computing mean absolute errors
(MAEs) by comparing out-of-sample predictions ht|t−1 with actual (simulated) values ht for t > 2,500.
Moreover, this approach comes with three potential disadvantages. First, the univariate approach means
that only the first element of the state vector at = ( ht, ht−1, . . . , ht−k)′ is estimated at time t, while
the other elements remain fixed at previously estimated values. However, the observation yt contains
information about the entire state vectorat, as can be seen from the observation density (49). While actual
(i.e. true) lags of ht are constant over time, the researcher’s estimates need not be. Even when focusing
purely on the real-time estimation of ht, the decision not to re-estimate the lags at each point in time may
lead to an efficiency loss. Second, while the CSIR method guarantees a continuous approximation of the
log-likelihood function, this approximation need not be smooth, potentially causing standard gradient-
based optimisers to fail. I employ a grid search to identify promising areas of the parameter space, followed
by a simplex-based optimisation algorithm that does not utilise gradients. Third, numerical standard
errors derived from the inversion of negative Hessian matrices may be misleading when the objective
function is nonsmooth. For a piecewise linear approximation as in the CSIR method, finite-difference
Hessian matrices may be badly scaled when evaluated near kinks, or identically zero when evaluated on
linear pieces. This may explain the exceedingly small standard errors reported in Catania (2022), as well
as my finding that Hessian matrices based on the CSIR method frequently fail to be invertible.
In addition to the particle filter, I employ the general version of the Bellman filter (section 3.1)
extended to account for degenerate state dynamics (section 3.2). The Bellman filter is implemented using
closed-form expressions (given in Supplement V) for derivatives of the observation and state-transition
log densities with respect to the entire state vector at = ( ht, ht−1, . . . , ht−k); hence, the entire ( k + 1)-
dimensional state is estimated at each time t. I allow up to kmax = 10 lags, implying that the Bellman
35


## Page 36

Forthcoming inJournal of Econometrics
Table 12: Parameter estimates for preferred model specifications and numerical standard errors in square
brackets
µ c φ σ η ρ0 ρ1 ρ2 ρ3
Bellman filter 0 .051 −0.001 0 .982 0 .258 −0.377 −0.583 −0.091 0 .463
[0.008] [0 .002] [0 .003] [0 .016] [0 .049] [0 .066] [0 .099] [0 .060]
Particle filter 0 .052 −0.006 0 .983 0 .239 −0.398 −0.571 −0.114 0 .459
[0.004] [0 .002] [0 .002] [0 .005] [0 .009] [0 .007] [0 .007] [0 .005]
Note: For both parameter-estimation methods, the preferred model determined by the
Bayesian information criterion (BIC) has three lags. Full parameter-estimation results
with up to ten lags are available in Supplement W. The data are log returns of the S&P500
(multiplied by 100) from 3 Jan 1990 to 31 Dec 2019 (7 ,558 observations).
filter solves an optimisation problem with up to 11 dimensions at each time step. To estimate the static
parameters, I identify promising starting values using a grid search, after which I implement estimator (40)
using a gradient-based numerical optimiser. In the Bellman-filtering procedure, at each time step I execute
Newton or Fisher optimisation steps when the search direction is well-defined; otherwise, the optimisation
is skipped and the update is set equal to the prediction. This somewhat crude approach ensures that
the filter runs smoothly even when using flawed parameter values, which may be encountered during the
black-box estimation routine (40). At the optimal parameter values identified using this routine, the filter
is convergent at every time step.
10.4 Simulation results
To investigate the difference between the multivariate approach and the (one-dimensional) CSIR method,
a simulation study is performed. Two sets of realistic parameter values are shown in Table 11. I generate
100 series of length 5 ,000, using the first half for parameter estimation. The results in Table 11 show
that average parameter estimates of ρ0, ρ1 and ρ2 obtained by the CSIR particle filter are inaccurate,
while those based on the Bellman filter are relatively accurate. For example, the average estimate of ρ2
by the Bellman filter differs from the true value by no more than 0 .01, compared to at least 0 .20 for
the particle filter. While Catania (2022) demonstrated that the CSIR method may produce accurate
parameter estimates, this finding may partly be explained by the fact that the parameter-optimisation
routine there was initialised using the true parameters, in which case the CSIR estimates typically remain
close to the starting point. The results also show that the parameter estimates based on the particle
filter vary greatly across samples, as can be seen from the large standard deviations in parentheses in
Table 11, while parameter estimates based on the Bellman filter are relatively stable. Additionally, the
average of numerically computed standard errors, in square brackets, indicates that standard errors are
somewhat reliable for the Bellman filter, closely matching the actual variation across samples, but not
for the CSIR method, where they are several orders of magnitude too small. This may be due to the
nonsmooth approximation of the log-likelihood function in the CSIR method, and casts doubt on the
validity of similarly small standard errors in Catania (2022). Finally, the right-most column shows that
the improved parameter estimates lead to out-of-sample forecasting gains, which are consistent across
samples (the Bellman filter produces better forecasts for each sample) and overwhelmingly statistically
significant according to a standard Diebold-Mariano test (not shown).
36


## Page 37

Forthcoming inJournal of Econometrics
10.5 Empirical results
For the empirical application, I take log returns of the S&P500 from 3 Jan 1990 to 31 Dec 2019 (7 ,558
observations). Table 12 shows preferred models when using the Bayesian information criterion, which
suggests setting k = 3 lags for both parameter-estimation methods when up to 10 lags are allowed (full
results are available in Supplement W). Parameter estimates for both methods are similar, perhaps due
to the comparatively long dataset. Both methods indicate that volatility feedback and leverage play
important roles, with the positive estimate of ρ3 suggesting that the leverage effect is temporary: upward
volatility shocks following negative returns may be partially reversed on day three. The small standard
errors for the particle filter, similar to those reported in Catania (2022, table 2), may underestimate the
true uncertainty surrounding the parameter estimates. Standard errors based on the Bellman filter, which
are up to an order of magnitude higher for the parameters of interest, were in simulation studies found to
be reasonably accurate.
11 Conclusion
The Bellman filter for state-space models as developed in this article generalises the Kalman filter and
is equally computationally inexpensive in high-dimensional state spaces, but robust in the case of heavy-
tailed observation noise and applicable to a wider range of (nonlinear and non-Gaussian) models. Under
suitable conditions, the Bellman-filtered states are globally contractive to a small region around the true
state at every time step, while filtering errors remain uniformly bounded over time. A second contribution
is the development of a Bellman smoother that is mathematically equivalent to the classic Rauch, Tung
and Striebel (1965) smoother, but applicable more generally—as an approximation—to state-space mod-
els with nonlinear and/or non-Gaussian observation equations. Third, the approximate static-parameter
estimation procedure developed here is straightforward to implement and, again, computationally inex-
pensive; the resulting parameter estimates for various sample sizes appear to be no less accurate or efficient
than those of (asymptotically exact) simulation-based methods.
In a simulation study involving a wide range of univariate models, the performance of the Bellman filter
is near identical to those of state-of-the art simulation-based methods in terms of parameter estimation
and filtering, while additionally enabling smoothing. Filtering speeds are improved by factors up to ∼160
(compared to particle filters) and ∼2,000 (cf. importance samplers). Likewise, computation times for
estimating the static parameters are reduced by factors up to ∼10 (cf. importance samplers) and ∼400
(cf. particle filters). In an application with a high-dimensional climate model, the tracking performance
of the Bellman filter remains virtually unchanged as the dimension of the state space is increased from
10 to 150, while that of the particle filter deteriorates sharply—due to the curse of dimensionality—even
when employing very many particles: e.g. with 10 6 particles in 150 spatial dimensions, the Bellman filter
is both faster (by a factor ∼1,000) and more accurate (by a factor ∼1.8 in terms of mean absolute filtering
error). In a second application with highly nonlinear and degenerate state dynamics, the Bellman filter
outperforms the particle filter for the purposes of both parameter estimation and filtering.
37


## Page 38

Forthcoming inJournal of Econometrics
References
Amari, S.-i., Park, H. and Fukumizu, K. (2000) Adaptive method of realizing natural gradient learning for multilayer
perceptrons. Neural Computation, 12, 1399–1409.
Anderson, B. D. and Moore, J. B. (2012) Optimal Filtering. Courier Corporation.
Asi, H. and Duchi, J. C. (2019) Stochastic (approximate) proximal point methods: Convergence, optimality, and
adaptivity. SIAM Journal on Optimization , 29, 2257–2290.
Baum, L. E. and Petrie, T. (1966) Statistical inference for probabilistic functions of finite state Markov chains. The
Annals of Mathematical Statistics , 37, 1554–1563.
Bauwens, L. and Hautsch, N. (2006) Stochastic conditional intensity processes. Journal of Financial Econometrics ,
4, 450–493.
Bauwens, L. and Veredas, D. (2004) The stochastic conditional duration model: A latent variable model for the
analysis of financial durations. Journal of Econometrics , 119, 381–412.
Bellman, R. E. (1957) Dynamic Programming. PUP.
Bernstein, D. S. (2009) Matrix Mathematics: Theory, Facts, and Formulas . PUP.
Bertsekas, D. P. (2012) Dynamic Programming and Optimal Control, Vol. II: Approximate Dynamic Programming .
Athena Scientific.
Bianchi, P. (2016) Ergodic convergence of a stochastic proximal point algorithm. SIAM Journal on Optimization ,
26, 2235–2260.
Carr, P. and Wu, L. (2017) Leverage effect, volatility feedback, and self-exciting market disruptions. Journal of
Financial & Quantitative Analysis, 52, 2119–2156.
Catania, L. (2022) A stochastic volatility model with a general leverage specification. Journal of Business &
Economic Statistics, 40, 678–689.
Chopin, N. and Papaspiliopoulos, O. (2020) An Introduction to Sequential Monte Carlo . Springer.
Doucet, A., De Freitas, N. and Gordon, N. (2001) Sequential Monte Carlo Methods in Practice . Springer.
Durbin, J. and Koopman, S. J. (1997) Monte Carlo maximum likelihood estimation for non-Gaussian state space
models. Biometrika, 84, 669–684.
— (2000) Time series analysis of non-Gaussian observations based on state space models from both classical and
Bayesian perspectives. Journal of the Royal Statistical Society: Series B (Statistical Methodology) , 62, 3–56.
Fahrmeir, L. (1992) Posterior mode estimation by extended Kalman filtering for multivariate dynamic generalized
linear models. Journal of the American Statistical Association , 87, 501–509.
Farmer, L. E. (2021) The discretization filter: A simple way to estimate nonlinear state space models. Quantitative
Economics, 12, 41–76.
Fr¨ uhwirth-Schnatter, S. and Wagner, H. (2006) Auxiliary mixture sampling for parameter-driven models of time
series of counts with applications to state space modelling. Biometrika, 93, 827–841.
Fuh, C.-D. (2006) Efficient likelihood estimation in state space models. The Annals of Statistics , 34, 2026–2068.
Ghysels, E., Harvey, A. C. and Renault, E. (1996) Stochastic volatility. InHandbook of Statistics, Vol. 14, Statistical
Methods in Finance (eds. G. Maddala and C. Rao), 119–191. Elsevier.
Godsill, S. J., Doucet, A. and West, M. (2004) Monte Carlo smoothing for nonlinear time series. Journal of the
American Statistical Association, 99, 156–168.
Hafner, C. M. and Manner, H. (2012) Dynamic stochastic copula models: Estimation, inference and applications.
Journal of Applied Econometrics , 27, 269–295.
Hamilton, J. D. (1989) A new approach to the economic analysis of nonstationary time series and the business cycle.
Econometrica, 57, 357–384.
Hansen, L. P. and Sargent, T. J. (2013) Recursive Models of Dynamic Linear Economies . PUP.
Harvey, A. C. (1990) Forecasting, Structural Time Series Models and the Kalman Filter . CUP.
Harvey, A. C., Ruiz, E. and Shephard, N. (1994) Multivariate stochastic variance models. The Review of Economic
Studies, 61, 247–264.
38


## Page 39

Forthcoming inJournal of Econometrics
Harvey, A. C. and Shephard, N. (1996) Estimation of an asymmetric stochastic volatility model for asset returns.
Journal of Business & Economic Statistics , 14, 429–434.
Henderson, H. V. and Searle, S. R. (1981) On deriving the inverse of a sum of matrices. SIAM Review, 23, 53–60.
Jacquier, E., Polson, N. G. and Rossi, P. E. (2002) Bayesian analysis of stochastic volatility models. Journal of
Business & Economic Statistics , 20, 69–87.
Johansen, A. M., Whiteley, N. and Doucet, A. (2012) Exact approximation of Rao-Blackwellised particle filters.
IFAC Proceedings Volumes, 45, 488–493.
Julier, S. J. and Uhlmann, J. K. (1997) New extension of the Kalman filter to nonlinear systems. InSignal Processing,
Sensor Fusion, and Target Recognition VI (ed. I. Kadar), vol. 3068, 182–193. International Society for Optics
and Photonics.
Jungbacker, B. and Koopman, S. J. (2007) Monte Carlo estimation for nonlinear non-Gaussian state space models.
Biometrika, 94, 827–839.
Jungers, R. (2009) The Joint Spectral Radius: Theory and Applications . Springer.
Kalman, R. E. (1960) A new approach to linear filtering and prediction problems. Journal of Basic Engineering ,
82, 35–45.
Kantas, N., Doucet, A., Singh, S. S., Maciejowski, J. and Chopin, N. (2015) On particle methods for parameter
estimation in state-space models. Statistical Science, 30, 328–351.
Katzfuss, M., Stroud, J. R. and Wikle, C. K. (2020) Ensemble Kalman methods for high-dimensional hierarchical
dynamic space-time models. Journal of the American Statistical Association , 115, 866–885.
Kitagawa, G. (1987) Non-Gaussian state-space modeling of nonstationary time series. Journal of the American
Statistical Association, 82, 1032–1041.
Koopman, S. J., Lit, R. and Lucas, A. (2017) Intraday stochastic volatility in discrete price changes: The dynamic
Skellam model. Journal of the American Statistical Association , 112, 1490–1503.
Koopman, S. J., Lucas, A. and Scharth, M. (2015) Numerically accelerated importance sampling for nonlinear
non-Gaussian state-space models. Journal of Business & Economic Statistics , 33, 114–127.
— (2016) Predicting time-varying parameters with parameter-driven and observation-driven models. Review of
Economics and Statistics , 98, 97–110.
Koyama, S., Castellanos P´ erez-Bolde, L., Shalizi, C. R. and Kass, R. E. (2010) Approximate methods for state-space
models. Journal of the American Statistical Association , 105, 170–180.
Koyama, S. and Paninski, L. (2010) Efficient computation of the maximum a posteriori path and parameter esti-
mation in integrate-and-fire and more general state-space models. Journal of Computational Neuroscience , 29,
89–105.
Kullback, S. and Leibler, R. A. (1951) On information and sufficiency. The Annals of Mathematical Statistics , 22,
79–86.
K¨ unsch, H. R. (2001) State space and hidden Markov models. InComplex Stochastic Systems (eds. O. E. Barndorff-
Nielsen and C. Kluppelberg), 109–174. Chapman & Hall/CRC.
— (2013) Particle filters. Bernoulli, 19, 1391–1403.
Liu, J. and West, M. (2001) Combined parameter and state estimation in simulation-based filtering. In Sequential
Monte Carlo Methods in Practice (eds. A. Doucet, N. De Freitas and N. Gordon), 197–223. Springer.
Liu, J. S. (2008) Monte Carlo Strategies in Scientific Computing . Springer.
Liu, Q. and Ihler, A. (2013) Variational algorithms for marginal MAP. The Journal of Machine Learning Research,
14, 3165–3200.
Malik, S. and Pitt, M. K. (2011) Particle filters for continuous likelihood evaluation and maximisation. Journal of
Econometrics, 165, 190–209.
Masreliez, C. (1975) Approximate non-Gaussian filtering with linear state and observation relations. IEEE Trans-
actions on Automatic Control , 20, 107–110.
Mayne, D. Q. (1966) A solution of the smoothing problem for linear dynamic systems. Automatica, 4, 73–92.
M¨ uller, U. K. and Petalas, P.-E. (2010) Efficient estimation of the parameter path in unstable time series models.
The Review of Economic Studies , 77, 1508–1539.
39


## Page 40

Forthcoming inJournal of Econometrics
Murphy, S. A. and Van der Vaart, A. W. (2000) On profile likelihood.Journal of the American Statistical Association,
95, 449–465.
Nesterov, Y. (2003) Introductory Lectures on Convex Optimization: A Basic Course . Springer.
Nocedal, J. and Wright, S. J. (2006) Numerical Optimization. Springer.
Patrascu, A. and Necoara, I. (2018) Nonasymptotic convergence of stochastic proximal point methods for constrained
convex optimization. The Journal of Machine Learning Research , 18, 7204–7245.
Rauch, H. E., Tung, F. and Striebel, C. T. (1965) Maximum likelihood estimates of linear dynamic systems. AIAA
Journal, 3, 1445–1450.
Rockafellar, R. T. (1976) Monotone operators and the proximal point algorithm. SIAM Journal on Control and
Optimization, 14, 877–898.
Ruiz, E. (1994) Quasi-maximum likelihood estimation of stochastic volatility models. Journal of Econometrics, 63,
289–306.
Ryu, E. K. and Boyd, S. (2016) Stochastic proximal iteration: A non-asymptotic improvement upon stochastic
gradient descent. Author website.
Singh, A. and Roberts, G. (1992) State space modelling of cross-classified time series of counts. International
Statistical Review, 60, 321–335.
So, M. K. (2003) Posterior mode estimation for nonlinear and non-Gaussian state space models. Statistica Sinica,
13, 255–274.
Straumann, D. and Mikosch, T. (2006) Quasi-maximum-likelihood estimation in conditionally heteroscedastic time
series: A stochastic recurrence equations approach. The Annals of Statistics , 34, 2449–2495.
Surace, S. C., Kutschireiter, A. and Pfister, J.-P. (2019) How to avoid the curse of dimensionality: Scalability of
particle filters with and without importance weights. SIAM Review, 61, 79–91.
Taylor, S. J. (2008) Modelling Financial Time Series . World Scientific.
Tichavsky, P., Muravchik, C. H. and Nehorai, A. (1998) Posterior Cram´ er-Rao bounds for discrete-time nonlinear
filtering. IEEE Transactions on Signal Processing , 46, 1386–1396.
Toulis, P. and Airoldi, E. M. (2015) Scalable estimation strategies based on stochastic approximations: Classical
results and new insights. Statistics and Computing , 25, 781–795.
— (2017) Asymptotic and finite-sample properties of estimators based on stochastic gradients. Annals of Statistics,
45, 1694–1727.
Toulis, P., Horel, T. and Airoldi, E. M. (2021) The proximal Robbins–Monro method.Journal of the Royal Statistical
Society: Series B (Statistical Methodology) , 83, 188–212.
Toulis, P., Tran, D. and Airoldi, E. (2016) Towards stability and optimality in stochastic gradient descent. In
Artificial Intelligence and Statistics , vol. 51, 1290–1298. PMLR.
Viterbi, A. J. (1967) Error bounds for convolutional codes and an asymptotically optimum decoding algorithm.
IEEE Transactions on Information Theory , 13, 260–269.
Wang, B.-Y. and Gong, M.-P. (1993) Some eigenvalue inequalities for positive semidefinite matrix power products.
Linear Algebra and Its Applications , 184, 249–260.
West, M. (1981) Robust sequential approximate bayesian estimation. Journal of the Royal Statistical Society Series
B: Statistical Methodology, 43, 157–166.
Whittle, P. (1981) Risk-sensitive linear/quadratic/Gaussian control. Advances in Applied Probability, 13, 764–777.
— (1996) Optimal Control: Basics and Beyond . Wiley.
— (2004) State structure, decision making and related issues. In State space and unobserved component models:
Theory and applications (eds. A. Harvey, S. J. Koopman and N. Shephard), 26–39. CUP.
40


## Page 41

Forthcoming inJournal of Econometrics
A Proof of Proposition 1
To understand how a recursive approach may be feasible, we start by noting that the joint log-likelihood function (2)
satisfies a straightforward recursive relation for 2 ≤ t ≤ n as follows:
L1:t(a1, . . . ,at) = ℓ(yt|at) + ℓ(at|at−1) + L1:t−1(a1, . . . ,at−1). (A.1)
That is, in transitioning from time t − 1 to time t, two terms are added: one representing the state-transition
density, ℓ(at|at−1); the other representing the observation density, ℓ(yt|at). Next, standard dynamic-programming
arguments imply
Vt(at) := max
(a1,...,at−1)∈Rm×(t−1)
L1:t(a1, . . . ,at), by definition (4), (A.2)
= max
a1:t−1∈Rm×(t−1)

ℓ(yt|at) + ℓ(at|at−1) + L1:t−1(a1, . . . ,at−1)

, by recursion (A.1),
= max
at−1∈Rm
n
ℓ(yt|at) + ℓ(at|at−1) + max
(a1,...,at−2)∈Rm×(t−2)
L1:t−1(a1, . . . ,at−1)
o
,
by moving all but one maximisation inside curly brackets,
= max
at−1∈Rm

ℓ(yt|at) + ℓ(at|at−1) + Vt−1(at−1)

, again by definition (4),
= ℓ(yt|at) + max
at−1∈Rm

ℓ(at|at−1) + Vt−1(at−1)

.
Further, it is evident that
at|t = arg max
at∈Rm
Vt(at) = arg max
at∈Rm
max
(a1,...,at−1)∈Rm×(t−1)
L1:t(a1, . . . ,at). (A.3)
B Block-matrix inversion
Consider the second diagonal block of the negative Hessian matrix in equation (9). Define this block as Dt ∈ Rm×m
and define its Schur complement St ∈ Rm×m as follows:
Dt := It−1|t−1 + J 22
t , St := J 11
t − J 12
t D−1
t J 21
t − d2ℓ(yt|at)
datda′
t
. (B.1)
As is standard (e.g. Bernstein, 2009, p. 108), the required block-matrix inverse can then be expressed as
"
J 11
t − d2ℓ(yt|at)
datda′
t
J 12
t
J 21
t It−1|t−1 + J 22
t
#−1
=
 S−1
t −S−1
t J 12
t D−1
t
−D−1
t J 21
t S−1
t D−1
t + D−1
t J 21
t S−1
t J 12
t D−1
t

, (B.2)
as long as the required inverses exist.
C Derivation of equation (11)
Here we compute the negative Hessian of the value function, i.e.
Vt(at) = ℓ(yt|at) + max
at−1∈Rm
n
ℓ(at|at−1) − 1
2(at−1 − at−1|t−1)′It−1|t−1(at−1 − at−1|t−1)
o
,
= ℓ(yt|at) + ℓ(at|a∗
t−1) − 1
2(a∗
t−1 − at−1|t−1)′It−1|t−1(a∗
t−1 − at−1|t−1), (C.1)
where the second line employs the definition
a∗
t−1 := arg max
at−1∈Rm
n
ℓ(at|at−1) − 1
2(at−1 − at−1|t−1)′It−1|t−1(a∗
t−1 − at−1|t−1)
o
. (C.2)
We must keep in mind that a∗
t−1 depends on at; we could have written a∗
t−1(at). Indeed, to compute the negative
Hessian of Vt(at), we must account for the change ina∗
t−1(at) using the chain rule. The first-order condition satisfied
41


## Page 42

Forthcoming inJournal of Econometrics
by a∗
t−1, i.e.
0 = dℓ(at|a∗
t−1)
da∗
t−1
− It−1|t−1(a∗
t−1 − at−1|t−1), (C.3)
can be differentiated with respect to at to obtain
0 =

−J 21
t − J 22
t
da∗
t−1
da′
t
− It−1|t−1
da∗
t−1
da′
t

at−1=a∗
t−1
, (C.4)
where J 21
t and J 22
t are as in equation (10). Solving for the sensitivity of a∗
t−1 with respect to at, we obtain
da∗
t−1
da′
t
=

−(It−1|t−1 + J 22
t )−1J 21
t

at−1=a∗
t−1
. (C.5)
Next, the chain rule tells us that the Hessian with respect to at can be computed as
d2 ·
datda′
t
=


1m×m
da∗
t−1
da′
t


′


∂2 ·
∂at∂a′
t
∂2 ·
∂at∂a∗
t−1
′
∂2 ·
∂a∗
t−1∂a′
t
∂2 ·
∂a∗
t−1∂a∗
t−1
′




1m×m
da∗
t−1
da′
t

 , (C.6)
where instances of ∂ and d denote ‘partial’ and ‘total’ derivatives, respectively, while 1m×m denotes an identity
matrix of size m × m. By the first-order envelope theorem, no first order derivative with respect to a∗
t−1 appears.
The negative Hessian of Vt(at) becomes
−d2Vt(at)
datda′
t
=


1m×m
da∗
t−1
da′
t


′
 J 11
t − d2ℓ(yt|at)
datda′
t
J 12
t
J 21
t It−1,t−1 + J 22
t




1m×m
da∗
t−1
da′
t



at−1=a∗
t−1
,
= J 11
t − d2ℓ(yt|at)
datda′
t
− 2J 12
t (It−1|t−1 + J 22
t )−1J 21
t + da∗
t−1
dat
(It−1,t−1 + J 22
t )da∗
t−1
da′
t

at−1=a∗
t−1
,
= J 11
t − d2ℓ(yt|at)
datda′
t
− J 12
t (It−1|t−1 + J 22
t )−1J 12
t

at−1=a∗
t−1
. (C.7)
Finally a∗
t−1(at|t) = at−1|t, such that
−d2Vt(at)
datda′
t

at|t
=

J 11
t − d2ℓ(yt|at)
datda′
t
− J 12
t (It−1|t−1 + J 22
t )−1J 21
t

at=at|t,at−1=at−1|t
, (C.8)
which confirms equation (11).
D Kalman information update as a special case of (11)
For the linear Gaussian model in Corollary 1, we have J 11
t = Q−1, J 12
t = Q−1T , J 21
t = T ′Q−1, J 22
t = T ′Q−1T
and d2ℓ(yt|at)/(datda′
t) = −Z ′H −1Z. Substituting these equalities into the information update (11), we obtain
It|t = Q−1 − Q−1T (It−1|t−1 + T ′Q−1T )−1T ′Q−1 + Z ′H −1Z,
= It|t−1 + Z ′H −1Z, (D.1)
where It|t−1 is defined as
It|t−1 := Q−1 − Q−1T (It−1|t−1 + T ′Q−1T )−1T ′Q−1 = (T I−1
t−1|t−1T ′ + Q)−1, (D.2)
and where the second equality follows by the Woodbury matrix equality (e.g. Henderson and Searle, 1981, eq. 1).
Next, assuming the inverses Pt|t−1 := I −1
t|t−1 and Pt|t := I −1
t|t exist, using again Henderson and Searle (1981, eq. 1),
we find
Pt|t = I −1
t|t = (It|t−1 + Z ′H −1Z)−1 = Pt|t−1 − Pt|t−1Z ′(ZP t|t−1Z ′ + H)−1ZP t|t−1, (D.3)
42


## Page 43

Forthcoming inJournal of Econometrics
which is exactly the Kalman filter covariance matrix updating step (again, see Harvey, 1990, p. 106).
E Derivation of equation (14)
The first-order condition for the maximisation over at−1 in equation (13) can be usefully manipulated as follows:
a∗
t−1 =

It−1|t−1 + T ′Q−1T
−1
It−1|t−1 at−1|t−1 + T ′Q−1(at − c)

,
= at−1|t−1 + (It−1|t−1 + T ′Q−1T
−1
T ′Q−1
at − c − T at−1|t−1

,
= at−1|t−1 + I −1
t−1|t−1 T ′
T I−1
t−1|t−1T ′ + Q
−1
at − c − T at−1|t−1

,
= at−1|t−1 + I −1
t−1|t−1 T ′ It|t−1

at − at|t−1

, (E.1)
which confirms equation (14) in the main text. This second line expresses a∗
t−1 as the sum of at−1|t−1 and a
correction that is linear in the ‘innovation’ at − c − T at−1|t−1. The third line uses matrix-inversion formulas by
Henderson and Searle (1981, eqns. 9–11) to ensure that Q−1 no longer appears, such that by a limiting argument
the result remains valid even when Q is singular. The last line employs the definitions of at|t−1 and It|t−1 in Table 3.
F Derivation of equation (15)
Computing the first-order condition in equation (15), with respect to at−1, we obtain
0 = T ′Q−1(at − c − T at−1) − It−1|t−1(at−1 − at−1|t−1), (F.1)
the solution of which reads
a∗
t−1 =

It−1|t−1 + T ′Q−1T
−1
It−1|t−1 at−1|t−1 + T ′Q−1(at − c)

, (F.2)
which depends linearly on at. In principle, equation (15) in the main text can be obtained by substituting equa-
tion (F.2) into equation (13) and performing algebraic manipulations. The desired result can be obtained more
elegantly by ‘completing the square’ as follows. First, we replace at−1 with a∗
t−1 in equation (13), which then
contains the following terms:
−1
2(at − c − T a∗
t−1)′ Q−1 (at − c − T a∗
t−1) − 1
2(a∗
t−1 − at−1|t−1)′ It−1|t−1 (a∗
t−1 − at−1|t−1). (F.3)
Then we recall from equation (F.2) that a∗
t−1 is linear in at, such that the collection of terms in equation (F.3)
above is at most multivariate quadratic in at. Hence, we should be able to rewrite equation (F.3) as a quadratic
function (i.e., by completing the square) as follows:
−1
2(at − at|t−1)′ It|t−1(at − at|t−1) + constants, (F.4)
for some vector at|t−1 to be found and some matrix It|t−1 to be determined.
To do this, we note that at|t−1 represents the argmax of equation (F.4), which can most readily be found by
differentiating equation (F.3) with respect to at and setting the result to zero. Using the envelope theorem, we
need not account for the fact that a∗
t−1 depends on at (the first derivative with respect to a∗
t−1 is zero because
a∗
t−1 is optimal). Thus we set the derivative of equation (F.3) with respect to at equal to zero, which gives
0 = at − c − T a∗
t−1, or, by substituting a∗
t−1 from equation (F.2), we obtain
0 = at − c − T [It−1|t−1 + T ′Q−1T ]−1It−1|t−1at−1|t−1 (F.5)
−T [It−1|t−1 + T ′Q−1T ]−1T ′Q−1(at − c).
The solution to this equation reads at|t−1 := T at−1|t−1 + c, which confirms the expression in Table 3.
Next, we compute the negative second derivative of equation (F.3) with respect to at, which should give us
It|t−1. To account for the dependence of a∗
t−1 on at, we use the chain rule. Specifically, in equation (F.2), a∗
t−1 is
43


## Page 44

Forthcoming inJournal of Econometrics
linear in at, with the following Jacobian matrix:
J := da∗
t−1
da′
t
= [ It−1|t−1 + T ′Q−1T ]−1 T ′ Q−1. (F.6)
Next, the chain rule tells us that
d2 ·
datda′
t
=
 1m×m
J
′


∂2 ·
∂at∂a′
t
∂2 ·
∂at∂a∗
t−1
′
∂2 ·
∂a∗
t−1∂a′
t
∂2 ·
∂a∗
t−1∂a∗
t−1
′


 1m×m
J

, (F.7)
where instances of ∂ and d denote ‘partial’ and ‘total’ derivatives, respectively, while 1m×m denotes an identity
matrix. As before, the envelope theorem ensures that no first derivative with respect to a∗
t appears. When applying
equation (F.7), we find that the negative second derivative of equation (F.3) becomes
 1m×m
J
′ Q−1 −Q−1T
−T ′Q−1 It−1|t−1 + T ′Q−1T
 1m×m
J

= Q−1 − Q−1T J| {z } − J ′T ′Q−1
| {z } + J ′[It−1|t−1 + T ′Q−1T ]J| {z },
= Q−1 − Q−1T [It−1|t−1 + T ′Q−1T ]−1T ′Q−1. (F.8)
In the last line, we have used the fact that all three terms with curly brackets equal Q−1T [It|t + T ′Q−1T ]−1T ′Q−1,
such that two terms with curly brackets and opposite signs cancel, leaving only one term with a negative sign, which
confirms the expression for It|t−1 in Table 3.
G Kalman filter as a special case
Consider the linear Gaussian state-space model in Corollary 1. Suppose the inverse of the Kalman-filtered covariance
matrix exists, i.e. P −1
t−1|t−1 := It−1|t−1 exists. In Table 3, take the starting point a(0)
t|t = at|t−1, and use Newton or
Fisher optimisation steps. Given that the observation density is Gaussian, the log likelihood ℓ(yt|at) is multivariate
quadratic in at, such that the entire objective function (15) turns out to be multivariate quadratic in at. The
matrix of second derivatives is constant, such that Newton and Fisher optimisation steps are identical. Moreover,
given the quadratic nature of the objective function, both methods find the location of the optimum in a single
step. Indeed, the result is the classic Kalman filter, albeit written in the information form.
More explicitly, take yt = d + Z αt + εt with εt ∼ i.i.d. N( 0, H). Then
ℓ(yt|at) = −1/2(yt − d − Za t)′H −1(yt − d − Za t) + constants. (G.1)
The score and realised information are
d ℓ

yt|at

dat
= Z ′ H −1 (yt − d − Za t), −d2 ℓ

yt|at

dat da′
t
= Z ′H −1Z. (G.2)
As the realised information is constant, it equals the (expected) marginal information. Taking the starting point
a(0)
t|t = at|t−1 for Newton’s optimisation method, the estimate after a single Newton iteration reads
a(1)
t|t = at|t−1 +

It|t−1 + Z ′H −1Z
−1
Z ′H −1(yt − d − Za t|t−1), (G.3)
which is exactly the Kalman filter level update written in information form. To see the equivalence with the
covariance form of the Kalman filter, suppose that Pt|t−1 := I −1
t|t−1 exists. Then, using a standard matrix-inversion
formula (see e.g. Henderson and Searle, 1981, eqns. 9–10), the expression above is equivalent to
a(1)
t|t = at|t−1 + Pt|t−1Z ′(ZP t|t−1Z ′ + H)−1(yt − d − Za t|t−1), (G.4)
which is exactly the Kalman filter updating step (see e.g. Harvey, 1990, p. 106). For the information matrix update
44


## Page 45

Forthcoming inJournal of Econometrics
we have
It|t = It|t−1 − d2 ℓ

yt|a

da da′

a=at|t
= It|t−1 + Z ′H −1Z. (G.5)
If the inverses Pt|t−1 := I −1
t|t−1 and Pt|t := I −1
t|t exist, then, again using Henderson and Searle (1981, eq. 1), we find
Pt|t = I −1
t|t = (It|t−1 + Z ′H −1Z)−1 = Pt|t−1 − Pt|t−1Z ′(ZP t|t−1Z ′ + H)−1ZP t|t−1, (G.6)
which is exactly the Kalman filter covariance matrix updating step (again, see Harvey, 1990, p. 106).
H Iterated extended Kalman filter as a special case
Consider the linear Gaussian state-space model in Corollary 1, except let yt = d + Z(αt) + εt for some nonlinear
vector function Z(·) and εt ∼ i.i.d. N( 0, H). In Table 3, take the starting point a(0)
t|t = at|t−1 and perform Fisher
optimisation steps, ignoring (i.e. setting to zero) all second-order derivatives of Z(·). The iterated extended Kalman
filter is then obtained as a special case.
More explicitly, take yt = d + Z(αt) + εt with εt ∼ i.i.d. N( 0, H). Here, Zt := Z(αt) is a column vector of
the same size as yt, where each element of Zt depends on the elements of αt. Then
ℓ(yt|at) = −1/2(yt − d − Z(at))′H −1(yt − d − Z(at)) + constants. (H.1)
The score and marginal information are similar to those in Appendix G, as long as Z there is replaced by the
Jacobian of the transformation from αt to Zt, i.e. d Z(at)/da′
t. Hence
d ℓ

yt|at

dat
= dZ ′
dat
H −1 (yt − d − Z(at)), (H.2)
d2 ℓ

yt|at

dat da′
t
= −dZ ′
dat
H −1 dZ
da′
t
+ second-order derivatives. (H.3)
The iterated extended Kalman filter (IEKF) is obtained from the Bellman filter by choosing Newton’s method and
by making one further simplifying approximation: namely that all second-order derivatives of elements of Zt with
respect to the elements of αt are zero. It is not obvious under what circumstances this approximation is justified,
but here we are interested only in showing that the IEKF is a special case of the Bellman filter. Higher-order IEKFs
may be obtained by retaining the second-order derivatives. If the observation noise εt is heavy tailed, however, the
Bellman filter in Table 3 suggests a ‘robustified’ version of the Kalman filter and its extensions, in which case the
tail behaviour of p(yt|at) is accounted for in the optimisation step by using the score d ℓ(yt|at)/dat.
I Fahrmeir’s approximate mode estimator as a special case
When considering an observation density p(yt|at) from the exponential family and taking just one optimisation
step, we recover Fahrmeir’s (1992) approximate mode estimator. Our analysis differs from Fahrmeir’s in that (a)
we show that online mode estimation can in theory be performed exactly by solving Bellman’s equation, (b) we
consider a general (rather than exponential) observation distribution, and (c) we allow more than one optimisation
step.
J Laplace Gaussian filter as a special case
When the state-transition density is linear and Gaussian, step 4 in the algorithm of Koyama et al. (2010) can be
performed in closed form. The first-order Laplace Gaussian filter in step three of their algorithm is then equivalent
to maximisation (16). Both algorithms differ when the state transition is nonlinear and/or non-Gaussian.
K Implicit stochastic gradient method as a special case
In model (12), suppose that c = 0, Q = 0 and T = 1m×m, where 1m×m is an m×m identity matrix. The (constant)
state αt = α1 for all t = 1, 2, . . . now represents an unknown parameter to be estimated recursively over time. The
45


## Page 46

Forthcoming inJournal of Econometrics
prediction step of the Bellman filter simplifies to at|t−1 = at−1|t−1 and It|t−1 = It−1|t−1, while update (16) equates
to an implicit stochastic gradient method (e.g. Toulis and Airoldi, 2015, Toulis et al., 2016, Toulis and Airoldi,
2017, Toulis et al., 2021). In this case, the Bellman filter with BHHH updating steps becomes an implicit version
of the (explicit) stochastic gradient methods in Amari et al. (2000, eq. 2.14) or Toulis and Airoldi (2017, eq. 11).
While such methods are asymptotically convergent to the true parameter value, the Bellman filter typically remains
perpetually responsive.
L Proof of Theorem 1
1. The objective function Vt(a) := ℓ(yt|a)−1/2∥a−at|t−1∥2
It|t−1
is strongly concave with probability one because
ℓ(yt|·) is concave with probability one (Assumption 1a), while −1/2∥a − at|t−1∥2
It|t−1
is strongly concave.
Because the objective function is also real valued, at|t is well defined. Moreover, Vt(at|t) ≥ Vt(at|t−1) =
ℓ(yt|at|t−1), i.e.
0 ≤ Vt(at|t) − Vt(at|t−1) = ℓ(yt|at|t) − 1
2


at|t − at|t−1


2
It|t−1
− ℓ(yt|at|t−1). (L.1)
Re-arranging gives
1
2


at|t − at|t−1


2
It|t−1
≤ ℓ(yt|at|t) − ℓ(yt|at|t−1). (L.2)
The right-hand side is bounded because the set {a ∈ Rm : Vt(a) ≥ Vt(at|t−1)} is bounded.
2. Assuming that a 7→ ℓ(yt|a) is twice continuously differentiable (Assumption 2b), the following first- and
second-order conditions must hold at the Bellman-filtered state at|t ∈ Rm:
first-order condition: ∇ ℓ(yt|at|t) − It|t−1(at|t − at|t−1) = 0m, (L.3)
second-order condition: ∇2 ℓ(yt|at|t) − It|t−1 ≤ 0m×m, (L.4)
where the weak inequality in the second line means the matrix on the left-hand side is negative semi-definite.
Differentiating the first-order condition with respect to at|t−1, we obtain
∇2 ℓ(yt|at|t) dat|t
da′
t|t−1
= It|t−1
"
dat|t
da′
t|t−1
− 1m×m
#
, (L.5)
which can be re-written as dat|t
da′
t|t−1
=

It|t−1 − ∇ 2 ℓ(yt|at|t)
−1
It|t−1, (L.6)
where the required inverse exists because It|t−1 − ∇2 ℓ(yt|at|t) is positive definite by assumption.
Next, we use a result of Wang and Gong (1993, eq. 2), which says that λmin(A)λmin(B) ≤ λmin(AB) for two
square, symmetric and positive semidefinite matrices A and B, where λmin(·) denotes the smallest eigenvalue
of a matrix. Denoting Ht := −∇2ℓ(yt|at|t) and applying this result to ( It|t−1 + Ht)−1It|t−1 yields
0 < λmin(It|t−1)
λmax(It|t−1 + Ht) = λmin[(It|t−1 + Ht)−1]λmin(It|t−1) ≤ λmin[(It|t−1 + Ht)−1It|t−1]. (L.7)
Hence, the eigenvalues of (It|t−1 + Ht)−1It|t−1 are strictly positive. To show that the eigenvalues of ( It|t−1 +
Ht)−1It|t−1 are bounded above by one, we note that
λmax[(It|t−1 + Ht)−1It|t−1] = λmax[1m×m − (It|t−1 + Ht)−1Ht],
= 1 − λmin[(It|t−1 + Ht)−1Ht],
≤ 1 − λmin[(It|t−1 + Ht)−1]λmin(Ht),
= 1 − λmin(Ht)
λmax(It|t−1 + Ht) ≤ 1 − λmin(Ht)
λmax(It|t−1) + λmax(Ht) , (L.8)
which does not exceed (is strictly smaller than) than unity if Ht ≥ 0 (Ht > 0). The conditions Ht ≥ 0 or
Ht > 0 are ensured, respectively, if the observation log density is concave (Assumption 1a) or strictly concave
46


## Page 47

Forthcoming inJournal of Econometrics
(Assumption 1b).
Next, we use the well known fact (e.g. Jungers, 2009, p. 39) that the induced matrix norm satisfies
∥M ∥W = ∥W 1/2M W −1/2∥ =
q
λmax

W 1/2M W −1M ′W 1/2
=
p
λmax (M W −1M ′W ),
where the last equality follows by cyclically rotating inside the λmax(·) operator. Here M , W ∈ Rm×m and
W > 0 is the positive definite weight matrix. Using this fact along with the symmetry of It|t−1 and Ht, we
then obtain





dat|t
da′
t|t−1





It|t−1
=



(It|t−1 + Ht)−1It|t−1



It|t−1
,
=
r
λmax
n
(It|t−1 + Ht)−1It|t−1I −1
t|t−1It|t−1(It|t−1 + Ht)−1It|t−1
o
,
=
s
λmax
h
(It|t−1 + Ht)−1It|t−1
i2
≤ 1 − λmin(Ht)
λmax(It|t−1) + λmax(Ht) , (L.9)
where we have used equation (L.8) along with the fact that the eigenvalues of the square of a matrix are equal
to the squares of the eigenvalues of the original matrix. If additionally Assumption 1a (1b) holds, then we
have λmin(Ht) ≥ 0 (λmin(Ht) > 0), such that the right-hand side does not exceed (is strictly less than) unity.
3. Assuming that a 7→ ℓ(yt|a) is strongly concave with parameter ϵ > 0 (Assumption 1c) and once continuously
differentiable (Assumption 2a), standard arguments (e.g. Nesterov, 2003, eq. 2.1.17) give
⟨ at − αt , ∇ℓ(yt|at) − ∇ℓ(yt|αt) ⟩ ≤ − ϵ · ∥ at − αt∥2, ∀at, αt ∈ Rm. (L.10)
Strong concavity means that equation (L.10) holds for all pairsat, αt ∈ Rm, but we shall need it only when αt
is the true state. Assuming differentiability (Assumption 2a), the first-order condition It|t−1(at|t − at|t−1) =
∇ℓ(yt|at|t) is rewritten by pre-multiplying the equation by I −1/2
t|t−1 and subtracting I 1/2
t|t−1αt − I −1/2
t|t−1∇ℓ(yt|αt)
from both sides to obtain
I 1/2
t|t−1(at|t − αt) − I −1/2
t|t−1

∇ℓ(yt|at|t) − ∇ℓ(yt|αt)

= I 1/2
t|t−1(at|t−1 − αt) + I −1/2
t|t−1∇ℓ(yt|αt). (L.11)
Computing the quadratic norm on both sides and ignoring one term on the left, we obtain an inequality as
follows:


at|t − αt


2
It|t−1
− 2 ⟨at|t − αt, ∇ℓ(yt|at|t) − ∇ℓ(yt|αt)⟩
≤


at|t−1 − αt


2
It|t−1
+ 2 ⟨at|t−1 − αt, ∇ℓ(yt|αt)⟩ + ∥∇ℓ(yt|αt)∥2
I −1
t|t−1
.
By strong concavity (L.10), we have


at|t − αt


2
It|t−1
+ 2ϵ ·


at|t − αt


2
≤


at|t−1 − αt


2
It|t−1
+ 2 ⟨at|t−1 − αt, ∇ℓ(yt|αt)⟩ + ∥∇ℓ(yt|αt)∥2
I −1
t|t−1
. (L.12)
Taking expectations yields
E


at|t − αt


2
It|t−1

+ 2ϵ E


at|t − αt


2
≤ E


at|t−1 − αt


2
It|t−1

+ E

∥∇ℓ(yt|αt)∥2
I −1
t|t−1

. (L.13)
where we have used E ⟨at|t−1 − αt, ∇ℓ(yt|αt)⟩ = 0, which is obvious from the expectation of the score
being zero, i.e. E[∇ℓ(yt|αt)|αt] = 0. Finally, the theorem is proved by noting that the left-hand side is
E


at|t − αt


2
It|t−1+2ϵ1m×m

, where 1m×m is an m × m identity matrix, while Assumption 3 together with
47


## Page 48

Forthcoming inJournal of Econometrics
the assumed positive definiteness of It|t−1 implies that on the right-hand side we have
E

∥∇ℓ(yt|αt)∥2
I −1
t|t−1

≤ σ2/λmin.
M Comparison of Theorem 1 with Toulis et al. (2016)
This section casts light on the different definitions of strong concavity used in Theorem 1 and in Toulis et al. (2016).
Here we show that Theorem 1 applies to e.g. the Kalman filter, while the seemingly stronger result in Toulis et al.
(2016) does not.
By the combination of Assumptions 1c (strong concavity) and 2b (twice differentiability), part 3 of Theorem 1
assumes that the negative Hessian −∇2ℓ(yt|a) is strictly positive definite with smallest eigenvalue ϵ > 0. Standard
arguments (e.g. Nesterov, 2003, eq. 2.1.17) imply that
⟨at − αt, ∇ℓ(yt|at) − ∇ℓ(yt|αt)⟩ ≤ − ϵ · ∥ at − αt∥2, ∀at, αt ∈ Rm. (M.1)
Toulis et al. (2016) take a different view on strong concavity, defining a log-likelihood function to be strongly concave,
for a typical observation yt ∈ Rl, when
strong concavity in Toulis et al. (2016): ⟨at − αt, ∇ℓ(yt|at)⟩ ≤ − ϵ · ∥ at − αt∥2, ∀at, αt ∈ Rm, (M.2)
which differs from definition (M.1) in that the term ∇ℓ(yt|αt) is no longer present. Inequality (M.2) appears in
Remark 2 and equation 17 of the supplementary material to Toulis et al. (2016), where µt > 0 appears instead
of our ϵ, the random draw ξt appears instead of our yt, θt appears instead of our at, the true value θ⋆ appears
instead of our αt, their L is a negative log-likelihood function, and index n is used instead of our t. Toulis et al.
(2016) permit the parameter of strong concavity to depend on the observation; for simplicity, we do not. The term
∇ℓ(yt|αt), which appears in equation (M.1) but not equation (M.2), is the score function evaluated at the true
parameter; hence, this term is zero on average. For many models of interest, however, realisations of the score are
non-zero with probability one, such that definition (M.2) materially differs from (M.1).
While definition (M.1) of strong concavity was used in the proof of Theorem 1, definition (M.2) allows a stronger
result due to Toulis et al. (2016) to be derived. First, the first-order condition corresponding to maximisation (16),
i.e. It|t−1(at|t − at|t−1) = ∇ℓ(y|at|t), is rewritten as
I 1/2
t|t−1(at|t − αt) − I −1/2
t|t−1∇ℓ(yt|at|t) = I 1/2
t|t−1(at|t−1 − αt). (M.3)
Computing the quadratic norm on both sides, we have


at|t − αt


2
It|t−1
− 2 ⟨at|t − αt, ∇ℓ(yt|at|t)⟩ +


∇ℓ(yt|at|t)


2
I −1
t|t−1
=


at|t−1 − αt


2
It|t−1
. (M.4)
By strong concavity (M.2), it follows that


at|t − αt


2
It|t−1
+ 2 ϵ ·


at|t − αt


2
+


∇ℓ(yt|at|t)


2
I −1
t|t−1
≤


at|t−1 − αt


2
It|t−1
. (M.5)
Ignoring the third term on the left-hand side and combining terms, we find


at|t − αt


2
It|t−1+2 ϵ1m×m
≤


at|t−1 − αt


2
It|t−1
, (M.6)
where 1m×m denotes an m × m identity matrix. In Toulis et al. (2016, p. 1291) it holds that It|t−1 = γ−11m×m,
where 1m×m is an m × m identity matrix and γ > 0 is a learning parameter, in which case we obtain


at|t − αt


2
≤ 1
1 + 2γϵ


at|t−1 − αt


2
, (M.7)
as in Toulis et al. (2016, p. 1291). This result is stronger than that in Theorem 1, because (M.7) holds for all
realisations yt, without taking expectations. Inequality (M.7) implies that the update is ‘contracting almost surely’
(Toulis et al., 2016, p. 1291). Unfortunately, this is desirable property is not observed in practice for e.g. the Kalman
filter.
To explain why the Kalman filter fails to be almost surely contractive in the sense of Toulis et al. (2016), we
48


## Page 49

Forthcoming inJournal of Econometrics
observe that the Kalman filter satisfies our assumption (M.1) as used in Theorem 1, but not assumption (M.2) as
used by Toulis et al. (2016). To demonstrate this, we take the linear Gaussian state-space model in Corollary 1, such
that the observation density p(yt|αt) is Gaussian with mean d + Zα t and covariance matrix H, which is assumed
positive definite. The log-likelihood function and its gradient then read
ℓ(yt|αt) = −1
2(yt − d − Zα t)′ H −1 (yt − d − Zα t) + constants, (M.8)
∇ℓ(yt|αt) = Z ′H −1 (yt − d − Zα t). (M.9)
The multivariate Gaussian is strongly concave according to our definition (M.1), because
⟨at − αt, ∇ℓ(yt|at) − ∇ℓ(yt|αt)⟩ = ⟨at − αt, Z ′H −1 (yt − d − Za t) − Z ′H −1 (yt − d − Zα t)⟩ ,
= − ⟨at − αt, Z ′H −1Z(at − αt)⟩ ,
= −∥at − αt∥2
Z′H −1Z ,
≤ −λmin

Z ′H −1Z

· ∥ at − αt∥2, (M.10)
where λmin(·) denotes the smallest eigenvalues of a matrix. Hence, condition (M.1) is satisfied withϵ = λmin(Z ′H −1Z) >
0. Conversely, the multivariate Gaussian fails to be strongly concave when using the alternative definition (M.2) of
Toulis et al. (2016), because
⟨at − αt, ∇ℓ(yt|at)⟩ = ⟨at − αt, Z ′H −1 (yt − d − Za t)⟩ ≰ − positive scalar · ∥ at − αt∥2. (M.11)
Stepping back, it is not too surprising that the almost sure contractive property of Toulis et al. (2016) fails for
the Kalman filter, because the Kalman filter can (and does) move in the wrong direction when confronted with
atypical observations. The contribution of Theorem 1 is to demonstrate that, in a general context, such ‘bad’
behaviour does not dominate. Theorem 1 allows for the fact that updates may be less accurate than predictions,
while still ensuring that the updates are contractive in quadratic mean towards a noise-dominated region around
the true state, which is the situation that is relevant in practice.
N Proof of Proposition 2
Repeated self-substitution of the recursions (21) yields:
MSEt|t ≤
 γ
γ + 2ϵ
t
MSE1|0 + σ2
γ2
tX
i=1
 γ
γ + 2ϵ
i
+ σ2
η
t−1X
i=1
 γ
γ + 2ϵ
i
,
=
 γ
γ + 2ϵ
t
MSE1|0 + σ2
γ2
 γ
γ + 2ϵ
 1 −

γ
γ+2ϵ
t
1 − γ
γ+2ϵ
+ σ2
η
 γ
γ + 2ϵ
 1 −

γ
γ+2ϵ
t−1
1 − γ
γ+2ϵ
,
where the second line employsPt
i=1 xi−1 = (1 − xt)/(1 − x) for −1 < x < 1. Using γ, ϵ > 0 and taking the the limit
t → ∞ yields equation (22).
O Proof of Theorem 2
By the chain rule, we have





dat|t
da′
0|0





I
=





dat|t
da′
t|t−1
dat|t−1
da′
t−1|t−1
× . . . × da1|1
da′
1|0
da1|0
da′
0|0





I
≤





dat|t
da′
t|t−1





I
∥T ∥I × . . . ×





da1|1
da′
1|0





I
∥T ∥I ,
≤ (∥T ∥I)t
tY
τ =1

1 − λmin(Hτ)
λmax(I) + λmax(Hτ)

≤ (∥T ∥I)t

1 − µmin
νmax + µmax
t
. (O.1)
The inequality in the first line holds by the sub-multiplicative property of the induced matrix norm in combination
with the linear prediction step. The second line holds by equation (L.9), where Ht := −∇2ℓ(yt|at|t). The last
inequality holds because λmax(I) = νmax and 0 ≤ µmin ≤ λmin(Ht) ≤ λmax(Ht) ≤ µmax by assumption.
49


## Page 50

Forthcoming inJournal of Econometrics
To prove equation (23), we must still bound the term ∥T ∥I. To this end, we define δ := λmin(I − T ′IT )′ ∈ R,
which could be positive or negative. Since I is positive definite, we must have
δ = λmin(I − T ′IT ) ≤ λmin(I) = νmin, (O.2)
so δ ≤ νmin. Next, we have the inequality
0 ≤ I − δ 1m×m − T ′IT , (O.3)
as we will use below. As I is positive definite with smallest and largest eigenvalues νmin and νmax respectively, we
have 1
νmax
I ≤ 1m×m ≤ 1
νmin
I.
When δ > 0, multiplying this sequence of inequalities by −δ yields
−δ
νmax
I ≥ − δ 1m×m ≥ −δ
νmin
I, δ > 0.
When δ < 0, we obtain instead
−δ
νmax
I ≤ − δ 1m×m ≤ −δ
νmin
I, δ < 0.
Combining the last two results, we see that −δ1m×m is bounded above by −δ/νmaxI when δ > 0 and −δ/νminI
when δ < 0. This means that for all δ ∈ R, we can write
−δ 1m×m ≤ − min
 δ
νmin
, δ
νmax

I, δ ∈ R. (O.4)
Using inequality (O.4), inequality (O.3) can be further extended as
0 ≤ I − δ 1m×m − T ′IT ≤

1 − min
 δ
νmin
, δ
νmax

I − T ′IT . (O.5)
Equation (O.5) shows that z2I − T ′IT ≥ 0 for a particular value of z. This is useful because from Jungers (2009,
p. 39) we have
∥T ∥I = inf

z ≥ 0 : z2I − T ′IT ≥ 0

, (O.6)
which says that ∥T ∥I is the infimum of such values. Hence equations (O.5) and (O.6) together imply
∥T ∥I ≤
s
1 − min
 δ
νmin
, δ
νmax

. (O.7)
As a sanity check, we may verify that the right-hand side is nonnegative, as when δ > 0 we have δ ≤ νmin by
equation (O.2) above. Substituting equation (O.7) in equation (O.1) yields equation (23) in the main text.
To prove equation (24) in the main text, compute the derivative of the logarithm of the right-hand side of
equation (23) as follows:
d
dt log
"
1 − δ
νmin
t/2
1 − µmin
νmax + µmax
t#
= 1
2 log

1 − δ
νmin

+ log

1 − µmin
νmax + µmax

. (O.8)
When this quantity is strictly negative, exponential almost sure convergence to zero follows.
P Lemma involving quadratic functions
Lemma 1. Let x, y ∈ Rm. Let A, B ∈ Rm×m be symmetric positive definite matrices. Define f : Rm → R as
f(x) := max
y

−1
2 x′Ax − 1
2 y′By + x′Cy + a′x + b′y

, (P.1)
= max
y
(
−1
2
 x
y
′ A −C
−C ′ B
 x
y

+
 a
b
′ x
y

,
)
(P.2)
50


## Page 51

Forthcoming inJournal of Econometrics
for C, a, b of appropriate size. Then f(x) is multivariate quadratic with negative Hessian matrix A − CB −1C ′.
When this negative Hessian is positive definite, the argmax of f(x) over x equals (A − CB −1C ′)−1(a + CB −1b).
Proof. Take x as fixed. The first-order condition for the maximisation over y reads 0 = −By + b + C ′x, which
leads to y = B−1(b + C ′x). Substituting the optimised value of y into the expression for f(x) gives
f(x) = −1
2 x′Ax − 1
2(b + C ′x)′B−1(b + C ′x) + x′CB −1(b + C ′x) + a′x + b′B−1(b + C ′x).
Several terms cancel and remaining terms can be grouped as
f(x) = −1
2 x′(A − CB −1C ′)x + (a + CB −1b)′x + constants,
where constants independent of x are ignored. When A − CB −1C is positive definite, this quadratic function of x
is maximised at ( A − CB −1C ′)−1(a + CB −1b), completing the proof.
Q Proof of Proposition 4
To derive a relation between at|n and at+1|n in the context of approximately quadratic value functions, it is useful
to define a new value function Ut,t+1(·, ·) : Rm × Rm → R, which takes two state variables as input. This value
function is defined using the partial sum (25), and can be rewritten using the value functions Vt(·) and Wt+1(·)
defined in equations (26) and (27), respectively, as follows:
Ut,t+1(at, at+1) := max
a1,...,at−1,at+2,...,an
L1:n(a1, . . . ,an), (Q.1)
= max
a1,...,at−1,at+2,...,an

L1:t(a1, . . . ,at) + ℓ(at+1|at) + Lt+1:n(at+1, . . . ,an)

, (Q.2)
=

max
a1,...,at−1
L1:t(a1, . . . ,at)

+ ℓ(at+1|at) +

max
at+2,...,an
Lt+1:n(at+1, . . . ,an)

, (Q.3)
= Vt(at) + ℓ(at+1|at) + Wt+1(at+1), (Q.4)
= −1
2 ∥at − at|t∥2
It|t − 1
2 ∥at+1 − c − T at∥2
Q−1 − 1
2 ∥at+1 −bat+1|t+1∥2
bIt+1|t+1
. (Q.5)
In the last line, we take a linear Gaussian state equation as in Corollary 1, and use the assumption that Vt(at) is
multivariate quadratic with argmax at|t and negative Hessian matrix It|t, while Wt+1(at+1) is similarly multivari-
ate quadratic with argmax bat+1|t+1 and negative Hessian matrix bIt+1|t+1. Here, hats denote ‘backward filtered’
quantities. It follows that Ut,t+1(·, ·) is a multivariate quadratic function in two state variables, at and at+1.
From definition (Q.1), it is clear that Zt(·) and Zt+1(·) defined in equation (28) can be recovered from Ut,t+1(·, ·)
as follows:
Zt(at) = max
at+1
Ut,t+1(at, at+1), (Q.6)
Zt+1(at+1) = max
at
Ut,t+1(at, at+1). (Q.7)
Since at|n := arg max a Zt(a) while at+1|n := arg max a Zt+1(a), it is clear that Ut,t+1(·, ·) is maximised when
at = at|n and at+1 = at+1|n. We evaluate Ut,t+1(·, ·) at at+1 = at+1|n. Subsequently, the first-order condition with
respect to at reads
0 = It|t(at − at|t) − T ′Q−1(at+1|n − c − T at).
Solving for at yields at|n, which can be usefully rewritten as
at|n =

It|t + T ′Q−1T
−1
It|t at|t + T ′Q−1(at+1|n − c)

, (Q.8)
= at|t + (It|t + T ′Q−1T
−1
T ′Q−1
at+1|n − c − T at|t

, (Q.9)
= at|t + I −1
t|t T ′
T I−1
t|t T ′ + Q
−1
at+1|n − c − T at|t

, (Q.10)
= at|t + I −1
t|t T ′ It+1|t

at+1|n − at+1|t

. (Q.11)
This second line expresses at|n as the sum of at|t and a correction that is linear in at+1|n − c − T at|t. The third line
uses matrix-inversion formulas by Henderson and Searle (1981, eqns. 9–11) to ensure that Q−1 no longer appears,
51


## Page 52

Forthcoming inJournal of Econometrics
such that by a limiting argument the result remains valid even when Q is singular. The last line employs the
prediction step at+1|t := c + T at|t and It+1|t := ( T I−1
t|t T ′ + Q)−1. Equation (Q.11) is the Rauch-Tung-Striebel
smoother expression, given in the main article in equation (33).
To derive the backward recursion for the precision matrix, we note that Ut,t+1(·, ·) in equation (Q.5) can be
written using matrix notation as
Ut,t+1(at, at+1) = −1
2
 at
at+1
′ It|t + T ′Q−1T −T ′Q−1
−Q−1T bIt+1|t+1 + Q−1
 at
at+1

(Q.12)
+
 It|tat|t − T ′Q−1c
Q−1c +bIt+1|t+1at+1|t+1:n
′
at
at+1

+ constants,
where any constants that do not depend on at and at+1 are ignored. This representation together with Lemma 1
implies that Zt(·) := max a Ut,t+1(·, a) is multivariate quadratic functions with negative Hessian matrix given by
the following Schur complement:
It|n = It|t + T ′Q−1T − T ′Q−1(bIt+1|t+1 + Q−1)−1Q−1T , (Q.13)
= It|t + T ′(bI −1
t+1|t+1 + Q)−1T , (Q.14)
where the second line employs the Woodbury matrix equality (e.g. Henderson and Searle, 1981, eq. 1). Similarly,
Zt+1(·) := maxa Ut,t+1(a, ·) is multivariate quadratic with a negative Hessian given by the other Schur complement
as follows:
It+1|n = bIt+1|t+1 + Q−1 − Q−1T (It|t + T ′Q−1T )−1T ′Q−1, (Q.15)
= bIt+1|t+1 + (T I−1
t|t T ′ + Q)−1, (Q.16)
= bIt+1|t+1 + It+1|t, (Q.17)
where the second line again follows by the Woodbury matrix identity, while the last line employs the definition
It+1|t := (T I−1
t|t T ′ + Q)−1. To derive equation (34), we note that
I −1
t|n =

It|t + T ′ (bI −1
t+1|t+1 + Q)−1 T
−1
, (Q.18)
= I −1
t|t − I −1
t|t T ′bI −1
t+1|t+1 + T I−1
t|t T ′ + Q
−1
T I−1
t|t , by Woodbury, (Q.19)
= I −1
t|t − I −1
t|t T ′bI −1
t+1|t+1 + I −1
t+1|t
−1
T I−1
t|t , by Woodbury, (Q.20)
= I −1
t|t − I −1
t|t T ′
It+1|t − It+1|t(bIt+1|t+1 + It+1|t)−1It+1|t

T I−1
t|t , Woodbury again, (Q.21)
= I −1
t|t − I −1
t|t T ′
It+1|t − It+1|tI −1
t+1|nIt+1|t

T I−1
t|t , by equation (Q.17), (Q.22)
= I −1
t|t − I −1
t|t T ′It+1|t

I −1
t+1|t − I −1
t+1|n

It+1|tT I−1
t|t , (Q.23)
confirming equation (34) in the main text.
52


## Page 53

Forthcoming inJournal of Econometrics
R Simulation study: Observation densities
Table R.1: Overview of data-generating processes in simulation studies.
DGP Link function Density Score Realised information Information
Type Distribution p(yt|αt) dℓ(yt|αt)
dαt
−d2ℓ(yt|αt)
dα2
t
E

−d2ℓ(yt|αt)
dα2
t
αt

Count Poisson λt = exp(αt) λyt
t exp(−λt)/yt! yt − λt λt λt
Count Negative bin. λt = exp(αt)
Γ(κ + yt)

κ
κ+λt
κ
λt
κ+λt
yt
Γ(κ)Γ(yt + 1) yt − λt(κ + yt)
κ + λt
κλt(κ + yt)
(κ + λt)2
κ λt
κ + λt
Intensity Exponential λt = exp(αt) λt exp(−λtyt) 1 − λt yt ytλt 1
Duration Gamma βt = exp(αt) yκ−1
t exp(−yt/βt)
Γ(κ)βκ
t
yt
βt
− κ yt
βt
κ
Duration Weibull βt = exp(αt) κ (yt/βt)κ−1
βt exp{(yt/βt)κ} κ
 yt
βt
κ
− κ κ 2
 yt
βt
κ
κ2
Volatility Gaussian σ2
t = exp(αt) exp{−y2
t /(2σ2
t )}
{2πσ 2
t }1/2
y2
t
2σ2
t
− 1
2
y2
t
2σ2
t
1
2
Volatility Student’s t σ2
t = exp(αt)
Γ
 ν+1
2

1 +
y2
t
(ν−2)σ2
t
− ν+1
2
p
(ν − 2)πΓ (ν/2) σt
ωt y2
t
2σ2
t
− 1
2
ν − 2
ν + 1
ω2
t y2
t
2σ2
t
ν
2ν + 6
ωt := ν + 1
ν − 2 + y2
t /σ2
t
Dependence Gaussian ρt = 1 − exp(−αt)
1 + exp(−αt)
exp
n
−
y2
1t+y2
2t−2ρty1ty2t
2(1−ρ2
t )
o
2π
p
1 − ρ2
t
ρt
2 + 1
2
z1t z2t
1 − ρ2
t
0 ≰ 1
4
z2
1t + z2
2t
1 − ρ2
t
− 1 − ρ2
t
4
1 + ρ2
t
4
z1t := y1t − ρty2t
z2t := y2t − ρty1t
Dependence Student’s t ρt = 1 − exp(−αt)
1 + exp(−αt)
ν

1 +
y2
1t+y2
2t−2ρty1ty2t
(ν−2)(1−ρ2
t )
− ν+2
2
2π(ν − 2)
p
1 − ρ2
t
ρt
2 + ωt
2
z1t z2t
1 − ρ2
t
0 ≰ ωt
4
z2
1t + z2
2t
1 − ρ2
t
− 1 − ρ2
t
4 − 1
2
ω2
t
ν + 2
z2
1t z2
2t
(1 − ρ2
t )2
2 + ν(1 + ρ2
t )
4(ν + 4)
z1t := y1t − ρty2t ωt := ν + 2
ν − 2 +
y2
1t+y2
2t−2ρty1ty2t
1−ρ2
t
z2t := y2t − ρty1t
Local level Student’s t µt = αt
Γ
 ν+1
2

1 + (yt−µt)2
(ν−2)σ2
− ν+1
2
p
(ν − 2)πΓ
 ν
2

σ
1
σ
(ν + 1)et
ν − 2 + e2
t
0 ≰ ν + 1
σ2
ν − 2 − e2
t
(ν − 2 + e2
t )2
ν(ν + 1)
σ2(ν − 2)(ν + 3)
et := yt − µt
σ
Note: The table contains ten data-generating processes (DGPs) and link functions, the first nine of which are adapted from Koopman et al. (2016). For each model, the
DGP is given by the linear Gaussian state equation (12) in combination with the observation density and link functions indicated in the table. The table further displays
scores, realised information quantities and expected information quantities. The realised information quantities are nonnegative except for the bottom three models.
53


## Page 54

Forthcoming inJournal of Econometrics
S Simulation study: Parameter-estimation results
Table S.1: Short-window parameter estimates
DGP BF PF NAIS
Type Distribution Truth Average RMSE Average RMSE Average RMSE
Count Poisson c 0.000 −0.016 [0 .088] −0.003 [0 .042] −0.002 [0 .040]
ϕ 0.980 0 .932 [0 .132] 0 .941 [0 .099] 0 .945 [0 .084]
ση 0.150 0 .182 [0 .083] 0 .170 [0 .070] 0 .168 [0 .060]
Count Negative Bin. c 0.000 −0.019 [0 .095] −0.008 [0 .080] −0.001 [0 .036]
ϕ 0.980 0 .925 [0 .147] 0 .929 [0 .153] 0 .946 [0 .099]
ση 0.150 0 .194 [0 .123] 0 .176 [0 .098] 0 .158 [0 .055]
1/κ 0.250 0 .205 [0 .138] 0 .227 [0 .122] 0 .298 [0 .141]
Intensity Exponential c 0.000 −0.006 [0 .033] 0 .000 [0 .030] 0 .000 [0 .030]
ϕ 0.980 0 .943 [0 .070] 0 .946 [0 .079] 0 .948 [0 .064]
ση 0.150 0 .180 [0 .070] 0 .168 [0 .063] 0 .169 [0 .059]
Duration Gamma c 0.000 0 .002 [0 .041] −0.003 [0 .036] −0.003 [0 .037]
ϕ 0.980 0 .944 [0 .072] 0 .948 [0 .072] 0 .949 [0 .062]
ση 0.150 0 .175 [0 .062] 0 .166 [0 .054] 0 .166 [0 .054]
κ 1.500 1 .541 [0 .160] 1 .531 [0 .156] 1 .532 [0 .155]
Duration Weibull c 0.000 0 .005 [0 .041] −0.003 [0 .034] −0.003 [0 .033]
ϕ 0.980 0 .939 [0 .079] 0 .946 [0 .069] 0 .947 [0 .064]
ση 0.150 0 .188 [0 .075] 0 .172 [0 .064] 0 .173 [0 .060]
κ 1.200 1 .225 [0 .080] 1 .215 [0 .075] 1 .215 [0 .075]
Volatility Gaussian c 0.000 0 .000 [0 .068] −0.004 [0 .063] −0.003 [0 .073]
ϕ 0.980 0 .905 [0 .200] 0 .906 [0 .218] 0 .914 [0 .184]
ση 0.150 0 .202 [0 .119] 0 .174 [0 .112] 0 .183 [0 .099]
Volatility Student’s t c 0.000 −0.010 [0 .113] −0.008 [0 .106] −0.005 [0 .070]
ϕ 0.980 0 .870 [0 .261] 0 .872 [0 .311] 0 .914 [0 .162]
ση 0.150 0 .249 [0 .198] 0 .190 [0 .151] 0 .192 [0 .116]
1/ν 0.100 0 .063 [0 .069] 0 .088 [0 .041] 0 .082 [0 .057]
Dependence Gaussian c 0.020 0 .082 [0 .103] 0 .142 [0 .292] 0 .165 [0 .350]
ϕ 0.980 0 .916 [0 .102] 0 .859 [0 .278] 0 .834 [0 .339]
ση 0.100 0 .124 [0 .090] 0 .155 [0 .185] 0 .144 [0 .132]
Dependence Student’s t c 0.020 0 .148 [0 .321] 0 .263 [0 .540] 0 .189 [0 .349]
ϕ 0.980 0 .854 [0 .303] 0 .744 [0 .501] 0 .810 [0 .344]
ση 0.100 0 .136 [0 .128] 0 .201 [0 .225] 0 .146 [0 .139]
1/ν 0.100 0 .100 [0 .031] 0 .096 [0 .033] 0 .091 [0 .066]
Level Student’s t c 0.000 0 .000 [0 .016] 0 .000 [0 .019]
ϕ 0.980 0 .965 [0 .027] 0 .959 [0 .034]
ση 0.150 0 .131 [0 .028] 0 .155 [0 .027]
σ 0.450 0 .433 [0 .061] 0 .484 [0 .147]
1/ν 0.333 0 .237 [0 .121] 0 .324 [0 .083]
Note: BF = Bellman filter. PF = Particle filter. NAIS = Numerically accelerated importance sampler. RMSE
= root mean squared error. For the simulation setting, see the note to Table 5 in the main text.
54


## Page 55

Forthcoming inJournal of Econometrics
Table S.2: Medium-window parameter estimates
DGP BF PF NAIS
Type Distribution Truth Average RMSE Average RMSE Average RMSE
Count Poisson c 0.000 −0.007 [0 .010] 0 .000 [0 .006] 0 .000 [0 .006]
ϕ 0.980 0 .974 [0 .013] 0 .975 [0 .011] 0 .975 [0 .011]
ση 0.150 0 .155 [0 .023] 0 .154 [0 .022] 0 .151 [0 .021]
Count Negative Bin. c 0.000 −0.004 [0 .008] 0 .000 [0 .007] 0 .001 [0 .006]
ϕ 0.980 0 .976 [0 .012] 0 .974 [0 .013] 0 .976 [0 .011]
ση 0.150 0 .152 [0 .027] 0 .155 [0 .027] 0 .147 [0 .025]
1/κ 0.250 0 .236 [0 .058] 0 .245 [0 .051] 0 .288 [0 .066]
Intensity Exponential c 0.000 −0.007 [0 .010] 0 .000 [0 .007] 0 .000 [0 .007]
ϕ 0.980 0 .972 [0 .014] 0 .974 [0 .013] 0 .974 [0 .013]
ση 0.150 0 .162 [0 .027] 0 .154 [0 .023] 0 .154 [0 .023]
Duration Gamma c 0.000 0 .007 [0 .010] 0 .000 [0 .007] 0 .000 [0 .007]
ϕ 0.980 0 .973 [0 .013] 0 .974 [0 .012] 0 .974 [0 .012]
ση 0.150 0 .159 [0 .023] 0 .154 [0 .021] 0 .153 [0 .020]
κ 1.500 1 .510 [0 .070] 1 .503 [0 .069] 1 .503 [0 .069]
Duration Weibull c 0.000 0 .009 [0 .012] 0 .000 [0 .007] 0 .000 [0 .007]
ϕ 0.980 0 .971 [0 .015] 0 .974 [0 .012] 0 .974 [0 .012]
ση 0.150 0 .163 [0 .027] 0 .154 [0 .021] 0 .154 [0 .021]
κ 1.200 1 .209 [0 .037] 1 .201 [0 .035] 1 .202 [0 .035]
Volatility Gaussian c 0.000 0 .007 [0 .010] 0 .000 [0 .007] 0 .000 [0 .007]
ϕ 0.980 0 .970 [0 .019] 0 .973 [0 .016] 0 .973 [0 .016]
ση 0.150 0 .169 [0 .040] 0 .156 [0 .032] 0 .156 [0 .031]
Volatility Student’s t c 0.000 0 .004 [0 .010] 0 .000 [0 .007] 0 .000 [0 .007]
ϕ 0.980 0 .969 [0 .023] 0 .974 [0 .015] 0 .973 [0 .015]
ση 0.150 0 .173 [0 .059] 0 .157 [0 .037] 0 .158 [0 .038]
1/ν 0.100 0 .083 [0 .045] 0 .098 [0 .021] 0 .094 [0 .034]
Dependence Gaussian c 0.020 0 .028 [0 .024] 0 .035 [0 .055] 0 .034 [0 .039]
ϕ 0.980 0 .972 [0 .023] 0 .965 [0 .056] 0 .966 [0 .038]
ση 0.100 0 .101 [0 .033] 0 .113 [0 .054] 0 .113 [0 .049]
Dependence Student’s t c 0.020 0 .034 [0 .059] 0 .042 [0 .088] 0 .039 [0 .052]
ϕ 0.980 0 .966 [0 .063] 0 .958 [0 .082] 0 .961 [0 .053]
ση 0.100 0 .107 [0 .044] 0 .121 [0 .072] 0 .122 [0 .074]
1/ν 0.100 0 .102 [0 .017] 0 .099 [0 .013] 0 .095 [0 .039]
Level Student’s t c 0.000 0 .000 [0 .005] 0 .000 [0 .006]
ϕ 0.980 0 .979 [0 .007] 0 .975 [0 .010]
ση 0.150 0 .129 [0 .023] 0 .152 [0 .012]
σ 0.450 0 .431 [0 .033] 0 .455 [0 .053]
1/ν 0.333 0 .246 [0 .094] 0 .330 [0 .043]
Note: BF = Bellman filter. PF = Particle filter. NAIS = Numerically accelerated importance sampler. RMSE
= root mean squared error. For the simulation setting, see the note to Table 5 in the main text.
55


## Page 56

Forthcoming inJournal of Econometrics
T Simulation study: Root mean squared errors
Table T.1: Root mean squared errors (RMSEs) of filtered states in the out-of-sample period.
Short estimation Medium estimation Long estimation
Infeasible window (250 obs.) window (1,000 obs.) window (2,500 obs.)
DGP estimator BF PF NAIS KF BF PF NAIS KF BF PF NAIS KF
Type Distribution Absolute RMSE Relative RMSE Relative RMSE Relative RMSE
Count Poisson 0 .360 1 .163 1 .157 1 .155 1 .015 1 .015 1 .015 1 .000 1 .000 1 .001
Count Neg. Bin. 0 .379 1 .177 1 .171 1 .173 1 .019 1 .019 1 .020 1 .005 1 .005 1 .006
Intensity Exponential 0 .361 1 .139 1 .141 1 .137 1 .013 1 .012 1 .012 1 .001 1 .001 1 .000
Duration Gamma 0 .326 1 .169 1 .165 1 .163 1 .023 1 .022 1 .022 1 .006 1 .005 1 .005
Duration Weibull 0 .332 1 .126 1 .123 1 .120 1 .010 1 .009 1 .009 0 .999 0 .998 0 .998
Volatility Gaussian 0 .425 1 .218 1 .221 1 .220 1 .497 1 .022 1 .022 1 .022 1 .229 1 .003 1 .003 1 .002 1 .229
Volatility Student’s t 0.442 1 .250 1 .231 1 .235 1 .593 1 .039 1 .028 1 .029 1 .338 1 .012 1 .028 1 .009 1 .275
Dependence Gaussian 0 .362 1 .307 1 .313 1 .321 1 .057 1 .056 1 .054 1 .017 1 .014 1 .014
Dependence Student’s t 0.371 1 .314 1 .327 1 .303 1 .065 1 .066 1 .068 1 .022 1 .021 1 .021
Level Student’s t 0.204 1 .058 1 .045 n/a 1 .233 1 .007 1 .000 n/a 1 .156 0 .998 0 .996 n/a 1 .148
Note: MAE = mean absolute error. BF = Bellman filter. PF = particle filter. NAIS = numerically accelerated importance
sampler. KF = Kalman filter. See the note to Table 3 in the main text. The only difference is that here we report root mean
squared errors (RMSEs), not mean absolute errors (MAEs).
U Catania’s (2022) model: State-space representation
Fix t > k +1. Conditional on the information set at time t−k −1, denoted Ft−k−1, Catania’s (2022) model (46)–(48)
implies that the volatility shock ηt and the return shocks εt, . . . , εt−k are jointly normally distributed as


ηt
εt
εt−1
...
εt−k


Ft−k−1 ∼ N




0
0
0
...
0


,


1 ρ0 ρ1 . . . ρ k
ρ0 1 0 . . . 0
ρ1 0 1 . . . 0
... ... ... ... ...
ρk 0 0 . . . 1




. (U.1)
Next, we compute the distribution of both current shocks, i.e.ηt and εt, conditional on the past shocks,εt−1, . . . , εt−k.
From a well-known lemma regarding conditional Gaussian distributions (e.g. Harvey, 1990, p. 165), it follows that
ηt, εt conditional on εt−1, . . . , εt−k, or, equivalently, Ft−1 and at−1, are jointly normally distributed as
 ηt
εt
 Ft−1, at−1 ∼ N
 Pk
j=1 ρjεt−j
0

,

1 −Pk
j=1 ρ2
j ρ0
ρ0 1

. (U.2)
The marginal distribution of ηt is again Gaussian, with a mean and variance that can be read off. Next, the
state-transition equation implies that ht = c + φht−1 + σηηt, being a linear transformation of ηt, is distributed as
ht|Ft−1, at−1 ∼ N(µh,t, σ2
h,t), where (U.3)
µh,t = c + φht−1 + ση
kX
j=1
ρj
yt−j − µ
exp(ht−j/2) , σ h,t = ση
vuut1 −
kX
j=1
ρ2
j , (U.4)
where we have used εt−j = ( yt−j − µ) exp(−ht−j/2) for j = 1 , . . . , k in the expression for µh,t. This confirms
the non-degenerate part of the state-transition density (50). To derive the observation density, we note that the
bivariate distribution (U.2) with another application of the conditional-Gaussian lemma (Harvey, 1990, p. 165) gives
εt|Ft−1, at−1, ηt ∼ N(µε,t, σ2
ε,t), where (U.5)
µε,t = ρ0
1 −Pk
j=1 ρ2
j

ηt −
kX
j=1
ρjεt−j

 , σ ε,t =
s
1 − ρ2
0
1 −Pk
j=1 ρ2
j
. (U.6)
56


## Page 57

Forthcoming inJournal of Econometrics
Noting that neither µε,t nor σε,t depend on ht−k−1, while at−1 and ηt together imply at, the conditioning set
(Ft−1, at−1, ηt) can be simplified to ( Ft−1, at). Further, by substituting ηt = ( ht − c − φht−1)/ση and εt−j =
(yt−j − µ) exp(−ht−j/2) for j = 1, . . . , k, equations (U.5)–(U.6) become
εt|Ft−1, at, ∼ N(µε,t, σ2
ε,t), where (U.7)
µε,t = ρ0
1 −Pk
j=1 ρ2
j

 ht − c − φht−1
ση
−
kX
j=1
ρj
yt−j − µ
exp(ht−j/2)

 , σ ε,t =
s
1 − ρ2
0
1 −Pk
j=1 ρ2
j
. (U.8)
Finally, the distribution of the observation yt = µ + exp(ht/2)εt conditional on Ft−1 and at is Gaussian with mean
µy,t = µ + exp(ht/2)µε,t and variance σ2
y,t = exp( ht)σ2
ε,t, where µε,t and σε,t are given in equation (U.8). This
confirms observation density (49).
V Catania’s (2022) model: Bellman-filter implementation
Bellman’s equation (7) at time t involves the maximisation over two state variables, i.e. at and at−1, which in
general contain independent components. For the specific case of Catania’s (2022) model, as described in section 9,
the state vector is at = ( ht, ht−1, . . . , ht−k)′ ∈ Rk+1, which contains the log-volatility ht as well as k lags. This
implies that the state variables at and at−1 have k elements in common, namely ht−1 through ht−k. Further, ht
appears only in at, while ht−k−1 appears only in at−1. Taking into account these restrictions, optimisation (7)
specialised to Catania’s (2022) model reads

at|t
ht−k−1|t

=


ht|t
ht−1|t
...
ht−k|t
ht−k−1|t


= arg max
ht ,ht−1 ,...,h t−k−1
n
ℓ(yt|at, Ft−1) + ℓ(ht|at−1, Ft−1) + Vt−1(at−1)
o
, (V.1)
where ℓ(·|·) := log p(·|·) and the observation and state-transition densities are given in equations (49) and (50),
respectively. In equation (V.1), we have dropped the degenerate part of the state-transition density, which is
permitted given that the optimisation variables are taken to be ht, . . . , ht−k−1, such that the restrictions on the
components of at and at−1 are automatically satisfied. Value function Vt−1 : Rk+1 → R on the right-hand side is
approximated by the quadratic form (8).
To simplify the analysis of optimisation (V.1), we introduce three notational conventions. First, the k + 2
optimisation variables in optimisation (V.1) are collected in a single vector:
xt := ( ht, ht−1, . . . , ht−k−1)′ = (ht, a′
t−1)′ = ( a′
t, ht−k−1)′ ∈ Rk+2. (V.2)
Second, we write the observation log density as f := ℓ(yt|at, Ft−1), such that by equation (49) we have
f(at) := −1
2 log(2π) − log(σy,t) − (yt − µy,t)2
2σ2
y,t
, σ y,t = exp(ht/2)
s
1 − ρ2
0
1 −Pk
j=1 ρ2
j
, (V.3)
µy,t = µ + ρ0 exp(ht/2)
1 −Pk
j=1 ρ2
j

 ht − c − φ ht−1
ση
−
kX
j=1
ρj
yt−j − µ
exp(ht−j/2)

 .
Third, for the state-transition log density we use the short-hand g := ℓ(ht|at−1, Ft−1) and note from equation (50)
that it does not depend on ht−k−1, such that we may write g = g(at) as follows:
g(at) := −1
2 log(2π) − log(σh,t) − (ht − µh,t)2
2σ2
h,t
, (V.4)
µh,t = c + φ ht−1 + ση
kX
j=1
ρj
yt−j − µ
exp(ht−j/2) , σ h,t = ση
vuut1 −
kX
j=1
ρ2
j .
57


## Page 58

Forthcoming inJournal of Econometrics
Notation (V.2) through (V.4) allows us to write optimisation (V.1) as
ˆxt|t = arg max
xt
n
f(at) + g(at) − 1
2(at−1 − at−1|t−1)′It−1|t−1(at−1 − at−1|t−1)
o
. (V.5)
The Newton scoring algorithm for optimisation (V.5) reads
xt ← xt +
"
− d2f
datda′
t
− d2g
datda′
t
0k+1
0′
k+1 0
!
+
 0 0′
k+1
0k+1 It−1|t−1
#−1
 d(f +g)
dat
0

−
 0
It−1|t−1(at−1 − at−1|t−1)

, (V.6)
where 0k+1 is a column vector consisting of k+1 zeroes. Fisher scoring steps are obtained by replacing d2f /(datda′
t)
by E[d2f /(datda′
t)|at, Ft−1]. Iterating Newton step (V.6) or its Fisher equivalent requires (expectations of) first
and second derivatives of f, g, as derived next.
Derivatives of f: By the chain rule, first and second derivatives of the function f defined in equation (V.3)
with respect to at = (ht, . . . , ht−k)′ read
df
dat
= df
dµy,t
dµy,t
dat
+ df
dσy,t
dσy,t
dat
, (V.7)
d2f
datda′
t
= d2f
(dµy,t)2
dµy,t
dat
dµy,t
da′
t
+ d2f
(dσy,t)2
dσy,t
dat
dσy,t
da′
t
+ d2f
dµy,tdσy,t
dµy,t
dat
dσy,t
da′
t
(V.8)
+ d2f
dµy,tdσy,t
dσy,t
dat
dµy,t
da′
t
+ df
dµy,t
d2µy,t
datda′
t
+ df
dσy,t
d2σy,t
datda′
t
.
E
 d2f
datda′
t
at, Ft−1

= d2f
(dµy,t)2
dµy,t
dat
dµy,t
da′
t
+ E
 d2f
(dσy,t)2
at, Ft−1
 dσy,t
dat
dσy,t
da′
t
(V.9)
+ E
 d2f
dµy,tdσy,t
at, Ft−1
 dµy,t
dat
dσy,t
da′
t
+ E
 d2f
dµy,tdσy,t
at, Ft−1
 dσy,t
dat
dµy,t
da′
t
.
Equation (V.9) contains two fewer terms than equation (V.8), because the expectation of the last two terms in
equation (V.8) is zero. In equations (V.7) through (V.9), derivatives of f with respect µy,t and σy,t are given by
df
dµy,t
= yt − µy,t
σ2
y,t
, df
dσy,t
= (yt − µy,t)2
σ3
y,t
− 1
σy,t
, (V.10)
d2f
(dµy,t)2 = −1
σ2
y,t
, d2f
dµy,tdσy,t
= −2 yt − µy,t
σ3
y,t
, d2f
(dσy,t)2 = 1
σ2
y,t
− 3(yt − µy,t)2
σ4
y,t
, (V.11)
E
 d2f
dµy,tdσy,t
Ft−1, at

= 0, E
 d2f
(dσy,t)2
Ft−1, at

= −2
σ2
y,t
, (V.12)
where we also give expectations when relevant for Fisher scoring steps. In equations (V.7) and (V.8), first derivatives
of µy,t with respect to the elements of at read
dµy,t
dat
=


(µy,t − µ)/2
0
...
0

 + ρ0 exp(ht/2)
1 −Pk
j=1 ρ2
j


1/ση
−φ/σ η + ρ1/2 yt−1−µ
exp(ht−1/2)
ρ2/2 yt−2−µ
exp(ht−2/2)
...
ρk/2 yt−k −µ
exp(ht−k /2)


=:


(µy,t − µ)/2
0
...
0

 + bt, (V.13)
58


## Page 59

Forthcoming inJournal of Econometrics
where the second equality entails a definition of bt. For second derivatives of µy,t, we have
d2µy,t
datda′
t
= diag


(µy,t − µ)/4
0
...
0

 − 1
4
ρ0 exp(ht/2)
1 −Pk
j=1 ρ2
j
diag


0
ρ1
yt−1−µ
exp(ht−1/2)
ρ2
yt−2−µ
exp(ht−2/2)
...
ρk
yt−k−µ
exp(ht−k/2)


+


1/2
0
...
0

 b′
t + bt
1
2 0 . . . 0

, (V.14)
where the diag operator creates a diagonal matrix from a given vector. The derivatives of σy,t read
dσy,t
dat
=


σy,t/2
0
...
0

 , d2σy,t
datda′
t
= diag


σy,t/4
0
...
0

 . (V.15)
All components of equations (V.7) and (V.8) have now been specified.
Derivatives of g: By the chain rule, first and second derivatives of the function g given in equation (V.4) with
respect to at = (ht, . . . , ht−k)′ are
dg
dat
= ht − µh,t
σ2
h,t


−1
φ − ση
2 ρ1
yt−1−µ
exp(ht−1/2)
− ση
2 ρ2
yt−2−µ
exp(ht−2/2)
...
− ση
2 ρk
yt−k−µ
exp(ht−k/2)


=: ht − µh,t
σ2
h,t
ct, (V.16)
d2g
datda′
t
= −1
σ2
h,t
ctc′
t + ht − µh,t
σ2
h,t
ση
4 diag


0
ρ1
yt−1−µ
exp(ht−1/2)
ρ2
yt−2−µ
exp(ht−2/2)
...
ρk
yt−k−µ
exp(ht−k/2)


. (V.17)
Jointly, equations (V.7) through (V.17) specify all components of the Fisher scoring step (V.6).
Finally, the updated information matrix It|t is determined by the Schur complement of the bottom-right element
of the negative Hessian matrix used in Newton’s scoring step, which is given by

− d2f
datda′
t
− d2g
datda′
t
0k+1
0′
k+1 0
!
+
 0 0′
k+1
0k+1 It−1|t−1

,
Taking Schur complement of the bottom-right element and evaluating the result at the peak, i.e. at at|t, gives the
updated information matrix It|t. The Fisher version of the updating steps is obtained by replacing d 2f /(datda′
t)
by E[d2f /(datda′
t)|at, Ft−1].
59


## Page 60

Forthcoming inJournal of Econometrics
W Full estimation results for the S &P500
Table W.1: Full estimation results for the Bellman filter (top panel) and particle filter (bottom panel).
µ c φ σ η ρ0 ρ1 ρ2 ρ3 ρ4 ρ5 ρ6 ρ7 ρ8 ρ9 ρ10 LogL BIC
.0696 .0004 .9839 .2006 −.7189 −9555.1 2 .5344
.0519 −.0017 .9759 .2058 −.4830 −.4028 −9531.7 2 .5294
.0518 −.0013 .9776 .2447 −.4020 −.5945 .2910 −9524.3 2 .5286
.0513 −.0006 .9815 .2582 −.3770 −.5828 −.0913 .4633 −9503.2 2.5242
.0509 −.0003 .9826 .2456 −.3989 −.6108 −.0926 .3612 .1463 −9500.3 2 .5246
.0509 −.0001 .9842 .2456 −.4016 −.6037 −.0962 .3665 −.0382 .2132 −9494.5 2 .5243
.0503 .0002 .9852 .2412 −.4136 −.6107 −.0921 .3715 −.0424 .0808 .1616 −9490.9 2 .5245
.0499 .0005 .9862 .2397 −.4193 −.6115 −.0936 .3750 −.0478 .0916 .0186 .1644 −9487.6 2 .5248
.0508 .0002 .9867 .2376 −.4204 −.6163 −.0955 .3817 −.0511 .0968 .0159 .0540 .1242 −9482.0 2 .5245
.0502 .0006 .9875 .2384 −.4223 −.6096 −.0897 .3791 −.0572 .0986 .0188 .0553 −.0462 .1901 −9477.4 2 .5245
.0500 .0007 .9881 .2353 −.4309 −.6126 −.0912 .3828 −.0616 .1031 .0175 .0597 −.0471 .0804 .1277 −9474.5 2 .5249
.0680 −.0042 .9850 .1926 −.7319 −9562.1 2 .5362
.0517 −.0071 .9784 .1932 −.5071 −.4149 −9539.3 2 .5314
.0511 −.0065 .9796 .2262 −.4278 −.5935 .2732 −9534.2 2 .5312
.0519 −.0056 .9828 .2395 −.3979 −.5707 −.1141 .4593 −9516.9 2.5278
.0513 −.0065 .9826 .2420 −.3743 −.6300 −.0624 .4107 .0501 −9516.2 2 .5288
.0502 −.0051 .9837 .2284 −.4059 −.6137 −.1062 .3489 .1464 .0044 −9515.1 2 .5297
.0491 −.0041 .9853 .2267 −.4217 −.5909 −.1206 .3700 −.0808 .1629 .1019 −9509.1 2 .5293
.0489 −.0038 .9860 .2301 −.4171 −.6001 −.1134 .3845 −.0756 .1106 −.0147 .1842 −9505.9 2 .5296
.0495 −.0039 .9864 .2294 −.4165 −.5988 −.1126 .3838 −.0760 .1102 −.0146 .1846 .0001 −9505.9 2 .5308
.0495 −.0039 .9863 .2294 −.4163 −.5991 −.1128 .3831 −.0761 .1104 −.0144 .1848 .0001 .0003 −9505.9 2 .5320
.0471 −.0037 .9874 .2204 −.4107 −.6221 −.1563 .3621 .0545 .0495 .0157 .0727 −.0021 .0014 .1236 −9501.9 2 .5321
Note: LogL = log likelihood. BIC = Bayesian information criterion. For each panel, the best BIC is indicated
in bold. The data are 100 × the log returns of the S&P500 from 3 Jan 1990 to 31 Dec 2019 (7 ,558 observations).
The Bellman filter is implemented as described in Appendix V and estimated using estimator (40). The par-
ticle filter is estimated as in Catania (2022), who uses the continuous sampling importance resampling (CSIR)
method of Malik and Pitt (2011).
60
