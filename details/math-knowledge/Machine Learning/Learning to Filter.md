# Learning to Filter with Predictive State Inference Machines

Converted from: `Machine Learning\Learning to Filter.pdf`


## Page 1

Learning to Filter with Predictive State Inference Machines
Wen Sun† WENSUN @CS.CMU .EDU
Arun V enkatraman† ARUNVENK @CS.CMU .EDU
Byron Boots∗ BBOOTS @CC.GATECH .EDU
J. Andrew Bagnell† DBAGNELL @RI.CMU .EDU
†Robotics Institute, Carnegie Mellon University, USA
∗College of Computing, Georgia Institute of Technology, USA
Abstract
Latent state space models are a fundamental
and widely used tool for modeling dynamical
systems. However, they are difﬁcult to learn
from data and learned models often lack perfor-
mance guarantees on inference tasks such as ﬁl-
tering and prediction. In this work, we present
the P REDICTIVE STATE INFERENCE MACHINE
(PSIM), a data-driven method that considers the
inference procedure on a dynamical system as
a composition of predictors. The key idea is
that rather than ﬁrst learning a latent state space
model, and then using the learned model for in-
ference, PSIM directly learns predictors for in-
ference in predictive state space. We provide the-
oretical guarantees for inference, in both realiz-
able and agnostic settings, and showcase prac-
tical performance on a variety of simulated and
real world robotics benchmarks.
1. Introduction
Data driven approaches to modeling dynamical systems is
important in applications ranging from time series fore-
casting for market predictions to ﬁltering in robotic sys-
tems. The classic generative approach is to assume that
each observation is correlated to the value of a latent
state and then model the dynamical system as a graph-
ical model, or latent state space model, such as a Hid-
den Markov Model (HMM). To learn the parameters of the
model from observed data, Maximum Likelihood Estima-
tion (MLE) based methods attempt to maximize the like-
lihood of the observations with respect to the parameters.
This approach has proven to be highly successful in some
applications (Coates et al., 2008; Roweis & Ghahramani,
Proceedings of the 33rd International Conference on Machine
Learning, New York, NY , USA, 2016. JMLR: W&CP volume
48. Copyright 2016 by the author(s).
1999), but has at least two shortcomings. First, it may be
difﬁcult to ﬁnd an appropriate parametrization for the la-
tent states. If the model is parametrized incorrectly, the
learned model may exhibit poor performance on inference
tasks such as Bayesian ﬁltering or predicting multiple time
steps into the future. Second, learning a latent state space
model is difﬁcult. The MLE objective is non-convex and
ﬁnding the globally optimal solution is often computation-
ally infeasible. Instead, algorithms such as Expectation-
Maximization (EM) are used to compute locally optimal
solutions. Although the maximizer of the likelihood objec-
tive can promise good performance guarantees when it is
used for inference, the locally optimal solutions returned
by EM typically do not have any performance guarantees.
Spectral Learning methods are a popular alternative to
MLE for learning models of dynamical systems (Boots,
2012; Boots et al., 2011; Hsu et al., 2009; Hefny et al.,
2015). This family of algorithms provides theoretical guar-
antees on discovering the global optimum for the model pa-
rameters under the assumptions of inﬁnite training data and
realizability. However, in the non-realizable setting — i.e.
model mismatch (e.g., using learned parameters of a Lin-
ear Dynamical System (LDS) model for a non-linear dy-
namical system) — these algorithms lose any performance
guarantees on using the learned model for ﬁltering or other
inference tasks. For example, Kulesza et al. (2014) shows
when the model rank is lower than the rank of the under-
lying dynamical system, the inference performance of the
learned model may be arbitrarily bad.
Both EM and spectral learning suffer from limited theoreti-
cal guarantees: from model mismatch for spectral methods,
and from computational hardness for ﬁnding the global op-
timality of non-convex objectives for MLE-based methods.
In scenarios where our ultimate goal is to infer some quan-
tity from observed data, a natural solution is to skip the
step of learning a model, and instead directly optimize the
inference procedure. Toward this end, we generalize the
supervised message-passing Inference Machine approach
arXiv:1512.08836v2  [cs.LG]  30 May 2016


## Page 2

Learning to Filter with Predictive State Inference Machines
of Ross et al. (2011b); Ramakrishna et al. (2014); Lin et al.
(2015). Inference machines do not parametrize the graph-
ical model (e.g., design of potential functions) and instead
directly train predictors that use incoming messages and
local features to predict outgoing messages via black-box
supervised learning algorithms. By combining the model
and inference procedure into a single object — an Infer-
ence Machine — we directly optimize the end-to-end qual-
ity of inference. This uniﬁed perspective of learning and
inference enables stronger theoretical guarantees on the in-
ference procedure: the ultimate task that we care about.
One of the principal limitations of inference machines is
that they require supervision. If we only have access to ob-
servations during training, then there is no obvious way to
apply the inference machine framework to graphical mod-
els with latent states. To generalize Inference Machines
to dynamical systems with latent states, we leverage ideas
from Predictive State Representations (PSRs) (Littman
et al., 2001; Singh et al., 2004; Boots et al., 2011; Hefny
et al., 2015). In contrast to latent variable representations
of dynamical systems, which represent the belief state as a
probability distribution over the unobserved state space of
the model, PSRs instead maintain an equivalent belief over
sufﬁcient features of future observations.
We propose PREDICTIVE STATE INFERENCE MACHINES
(PSIMs), an algorithm that treats the inference procedure
(ﬁltering) on a dynamical system as a composition of pre-
dictors. Our procedure takes the current predictive state
and the latest observation from the dynamical system as in-
puts and outputs the next predictive state (Fig. 1). Since
we have access to the observations at training, this imme-
diately brings the supervision back to our learning problem
— we quantify the loss of the predictor by measuring the
likelihood that the actual future observations are generated
from the predictive state computed by the learner. PSIM
allows us to treat ﬁltering as a general supervised learning
problem handed-off to a black box learner of our choosing.
The complexity of the learner naturally controls the trade-
off between computational complexity and prediction accu-
racy. We provide two algorithms to train a PSIM. The ﬁrst
algorithm learns a sequence of non-stationary ﬁlters which
are provably consistent in the realizable case. The second
algorithm is more data efﬁcient and learns a stationary ﬁlter
which has reduction-style performance guarantees.
The three main contributions of our work are: (1) we pro-
vide a reduction of unsupervised learning of latent state
space models to the supervised learning setting by leverag-
ing PSRs; (2) our algorithm, PSIM, directly minimizes er-
ror on the inference task—closed loop ﬁltering; (3) PSIM
works for general non-linear latent state space models and
guarantees ﬁltering performance even in agnostic setting.
2. Related Work
In addition to the MLE-based approaches and the spectral
learning approaches mentioned in Sec. 1, there are several
supervised learning approaches related to our work. Data
as Demonstrator (DaD) (Venkatraman et al., 2015) applies
the Inference Machine idea to fully observable Markov
chains, and directly optimizes the open-loop forward pre-
diction accuracy. In contrast, we aim to design anunsuper-
vised learning algorithm for latent state space models (e.g.,
HMMs and LDSs) to improve the accuracy of closed loop
prediction–Bayesian ﬁltering. It is unclear how to apply
DaD to learning a Bayesian ﬁlter. Autoregressive models
(Wei, 1994) onk-th order fully observable Markov chains
(AR-k) use the most recent k observations to predict the
next observation. The AR model is not suitable for latent
state space models since the beliefs of latent states are con-
ditioned on the entire history. Learning mappings from en-
tire history to next observations is unreasonable and one
may need to use a large k in practice. A large k, how-
ever, increases the difﬁculty of the learning problem (i.e.,
requires large computational and samples complexity).
In summary, our work is conceptually different from DaD
and AR models in that we focus on unsupervised learning
of latent state space models. Instead of simply predicting
next observation, we focus on predictive state—a distribu-
tion of future observations, as an alternative representation
of the beliefs of latent states.
3. Preliminaries
We consider uncontrolled discrete-time time-invariant dy-
namical systems. At every time step t, the latent state
of the dynamical system, st ∈ Rm, stochastically gener-
ates an observation, xt ∈ Rn, from an observation model
P (xt|st). The stochastic transition modelP (st+1|st) com-
putes the predictive distribution of states att + 1 given the
state at timet. We deﬁne the belief of a latent statest+1 as
the distribution ofst+1 given all the past observations up to
time stept: {x1,...,x t}, which we denote asht.
3.1. Belief Propagation in Latent State Space Models
Let us deﬁnebt as the beliefP (st|ht−1). When the transi-
tion modelP (st+1|st) and observation modelP (xt|st) are
known, the belief bt can be computed by a special-case of
message passing called forward belief propagation:
bt+1 = 1
P (xt|ht−1)
∫
st
btP (st+1|st)P (xt|st)dst. (1)
The above equation essentially maps the belief bt and the
current observationxt to the next beliefbt+1.


## Page 3

Learning to Filter with Predictive State Inference Machines
Consider the following linear dynamical system:
st+1 =Ast +ϵs, ϵs ∼ N (0,Q ),
xt =Cst +ϵx, ϵx ∼ N (0,R ), (2)
whereA ∈ Rm×m is the transition matrix, C ∈ Rn×m is
the observation matrix, and Q ∈ Rm×m and R ∈ Rn×n
are noise covariances. The Kalman Filter (Van Overschee
& De Moor, 2012) update implements the belief update
in Eq. 1. Since P (st|ht−1) is a Gaussian distribution, we
simply use the mean ˆst and the covariance Σt to represent
P (st|ht−1). The Kalman Filter update step can then be
viewed as a function that maps(ˆst, Σt) and the observation
xt to (ˆst+1, Σt+1), which is a nonlinear map.
Given the sequences of observations {xt}t generated from
the linear dynamical system in Eq. 2, there are two com-
mon approaches to recover the parameters A,C,Q,R .
Expectation-Maximization (EM) attempts to maximize the
likelihood of the observations with respect to parameters
(Roweis & Ghahramani, 1999), but suffers from locally
optimal solutions. The second approach relies on Spec-
tral Learning algorithms to recover A,C,Q,R up to a lin-
ear transformation (Van Overschee & De Moor, 2012). 1
Spectral algorithms have two key characteristics: 1) they
use an observable state representation; and 2) they rely on
method-of-moments for parameter identiﬁcation instead of
likelihood. Though spectral algorithms can promise global
optimality in certain cases, this desirable property does not
hold under model mismatch (Kulesza et al., 2014). In this
case, using the learned parameters for ﬁltering may result
in poor ﬁltering performance.
3.2. Predictive State Representations
Recently, predictive state representations and observable
operator models have been used to learn from, ﬁlter on, pre-
dict, and simulate time series data (Jaeger, 2000; Littman
et al., 2001; Singh et al., 2004; Boots et al., 2011; Boots &
Gordon, 2011; Hefny et al., 2015). These models provide
a compact and complete description of a dynamical system
that is easier to learn than latent variable models, by repre-
senting state as a set of predictions of observable quantities
such as future observations.
In this work, we follow a predictive state representation
(PSR) framework and deﬁne state as the distribution of
ft = [xT
t ,...,x T
t+k−1]T ∈ Rkn, a k-step ﬁxed-sized time
window of future observations {xt,...,x t+k−1} (Hefny
et al., 2015). PSRs assume that if we can predict everything
aboutft at time-stept (e.g., the distribution offt), then we
also know everything there is to know about the state of a
dynamical system at time step t (Singh et al., 2004). We
1Sometimes called subspace identiﬁcation (Van Overschee &
De Moor, 2012) in the linear time-invariant system context.
xt
E[(ft)|ht 1]
xt 1
xt+k1
xt+1 xt+ k
Predictive
State Filter
x1
E[(ft+1 )|ht 1,x t]
ht 1
Figure 1. Filtering with predictive states for a k-observable sys-
tem. At time step t, the ﬁlter uses the belief E[φ(ft)|ht−1]
and the latest observation xt as feedback, outputs the next belief
E[φ(ft+1)|ht−1,xt].
assume that systems we consider arek-observable2 fork ∈
N+: there is a bijective function that maps P (st|ht−1) to
P (ft|ht−1). For convenience of notation, we will present
our results in terms of k-observable systems, where it suf-
ﬁces to select features from the nextk observations.
Following Hefny et al. (2015), we deﬁne the predic-
tive state at time step t as E[φ(ft)|ht−1] where φ is
some feature function that is sufﬁcient for the distri-
bution P (ft|ht−1). The expectation is taken with re-
spect to the distribution P (ft|ht−1): E[φ(ft)|ht−1] =∫
ft
φ(ft)P (ft|ht−1)dft. The conditional expectation can
be understood as a function of which the input is
the random variable ht−1. For example, we can set
E[φ(f)|ht−1] = E[f,ff T |ht−1] ifP (ft|ht−1) is a Gaus-
sian distribution (e.g., linear dynamical system in Eq. 2 );
or we can set φ(f) = [xt ⊗... ⊗xt+k−1] if we are work-
ing on a discrete models (discrete latent states and discrete
observations), where xt is an indicator vector representa-
tion of the observation and ⊗ is the tensor product. There-
fore, we assume that there exists a bijective function map-
pingP (f |ht−1) to E[φ(ft)|ht−1]. For any test f′
t, we can
compute the probability ofP (f′
t|ht−1) by simply using the
predictive state E[φ(ft)|ht−1]. Note that the mapping from
E[φ(ft)|ht−1] toP (f′
t|ht−1) is not necessarily linear.
To ﬁlter from the current predictive state E[φ(ft)|ht−1] to
the next state E[φ(ft+1)|ht] conditioned on the most recent
observation xt (see Fig. 1 for an illustration), PSRs ad-
ditionally deﬁne an extended state E[ζ(ft,xt+k)|ht−1] =∫
(ft,xt+k)ζ(ft,xt+k)P (ft,xt+k|ht−1)d(ft,xt+k), where
ζ is another feature function for the future observations ft
and one more observation xt+k. PSRs explicitly assume
there exists a linear relationship betweenE[φ(ft)|ht−1] and
E[ζ(ft,xt+k)|ht−1], which can be learned by Instrumen-
tal Variable Regression (IVR) (Hefny et al., 2015). PSRs
then additionally assume a nonlinear conditioning operator
that can compute the next predictive state with the extended
state and the latest observation as inputs.
2This assumption allows us to avoid the cryptographic hard-
ness of the general problem (Hsu et al., 2009).


## Page 4

Learning to Filter with Predictive State Inference Machines
4. Predictive State Inference Machines
The original Inference Machine framework reduces the
problem of learning graphical models to solving a set of
classiﬁcation or regression problems, where the learned
classiﬁers mimic message passing procedures that output
marginal distributions for the nodes in the model (Lang-
ford et al., 2009; Ross et al., 2011b; Bagnell et al., 2010).
However, Inference Machines cannot be applied to learn-
ing latent state space models (unsupervised learning) since
we do not have access to hidden states’ information.
We tackle this problem with predictive states. By using
an observable representation for state, observations in the
training data can be used for supervision in the inference
machine. More formally, instead of tracking the hidden
state st, we focus on the corresponding predictive state
E[φ(ft)|ht−1]. Assuming that the given predictive state
E[φ(ft)|ht−1] can reveal the probability P (ft|ht−1), we
use the training data ft to quantify how good the predic-
tive state is by computing the likelihood of ft. The goal is
to learn an operator F (the green box in Fig. 1) which de-
terministically passes the predictive states forward in time
conditioned on the latest observation:
E[φ(ft+1)|ht] =F
(
E[φ(ft)|ht−1],xt
)
, (3)
such that the likelihood of the observations {ft}t be-
ing generated from the sequence of predictive states
{E[φ(ft)|ht−1]}t is maximized. In the standard PSR
framework, the predictor F can be regarded as the com-
position of the linear mapping (from predictive state to
extended state) and the conditioning operator. Below we
show if we can correctly ﬁlter with predictive states, then
this is equivalent to ﬁltering with latent states as in Eq. 1.
4.1. Predictive State Propagation
The belief propagation in Eq. 1 is for latent states st.
We now describe the corresponding belief propagation
for updating the predictive state from E[φ(ft)|ht−1] to
E[φ(ft+1)|ht] conditioned on the new observation xt.
Since we assume that the mapping from P (st|ht−1)
to P (ft|ht−1) and the mapping from P (ft|ht−1) to
E[φ(ft)|ht−1] are both bijective, there must exist a bijec-
tive map q and its inverse q−1 such that q(P (st|ht−1)) =
E[φ(ft)|ht−1] and q−1(E[φ(ft)|ht−1]) = P (st|ht−1),3
then the message passing in Eq. 1 is also equivalent to:
E[φ(ft+1)|ht] = q(P (st+1|ht)) (4)
= q
(∫
st
P (st|ht−1)P (st+1|st)P (xt|st)
P (xt|ht−1) dst
)
= q
(∫
st
q−1(E[φ(ft)|ht−1])P (st+1|st)P (xt|st)
P (xt|ht−1) dst
)
3The composition of two bijective functions is bijective.
Eq. 4 explicitly deﬁnes the map F that takes the inputs
of E[φ(ft)|ht−1] and xt and outputs E[φ(ft+1)|ht]. This
map F could be non-linear since it depends the transi-
tion model P (st+1|st), observation model P (xt|st) and
function q, which are all often complicated, non-linear
functions in real dynamical systems. We do not place
any parametrization assumptions on the transition and ob-
servation models. Instead, we parametrize and restrict
the class of predictors to encode the underlying dynam-
ical system and aim to ﬁnd a predictor F from the re-
stricted class. We call this framework for inference the
PREDICTIVE STATE INFERENCE MACHINE (PSIM).
PSIM is different from PSRs in the following respects:
(1) PSIM collapses the two steps of PSRs (predict the ex-
tended state and then condition on the latest observation)
into one step—as an Inference Machine—for closed-loop
update of predictive states; (2) PSIM directly targets the
ﬁltering task and has theoretical guarantees on the ﬁlter-
ing performance; (3) unlike PSRs where one usually needs
to utilize linear PSRs for learning purposes (Boots et al.,
2011), PSIM can generalize to non-linear dynamics by
leveraging non-linear regression or classiﬁcation models.
Imagine that we can perform belief propagation with PSIM
in predictive state space as shown in Eq. 4, then this is
equivalent to classic ﬁlter with latent states as shown in
Eq. 1. To see this, we can simply apply q−1 on both sides
of the above equation Eq. 4, which exactly reveals Eq. 1.
We refer readers to the Appendix for a detailed case study
of the stationary Kalman Filter, where we explicitly show
this equivalence. Thanks to this equivalence, we can learn
accurate inference machines, even for partially observable
systems. We now turn our focus on learning the map F in
the predictive state space.
4.2. Learning Non-stationary Filters with Predictive
States
For notational simplicity, let us deﬁne trajectory as τ,
which is sampled from a unknown distribution Dτ . We
denote the predictive state as mt = E[φ(ft)|ht−1]. We
use ˆmt to denote an approximation of mt. Given a pre-
dictive statemt and a noisy observation ft conditioned on
the history ht−1, we let the loss function 4 d(mt,ft) =
∥mt − φ(ft)∥2
2. This squares loss function can be re-
garded as matching moments. For instance, in the station-
ary Kalman ﬁlter setting, we could set mt = E[ft|ht−1]
andd(mt,ft) = ∥mt −ft∥2
2 (matching the ﬁrst moment).
4Squared loss in an example Bregman divergence of which
there are others that are optimized by the conditional expecta-
tion (Banerjee et al., 2005). We can design d(mt,ft) as nega-
tive log-likelihood, as long as it can be represented as a Bregman
divergence (e.g., negative log-likelihood of distributions in expo-
nential family).


## Page 5

Learning to Filter with Predictive State Inference Machines
Algorithm 1 PREDICTIVE STATE INFERENCE MACHINE
(PSIM) with Forward Training
1: Input:M independent trajectoriesτi, 1 ≤i ≤M;
2: Set ˆm1 = 1
M
∑M
i=1φ(fi
1);
3: Set ˆmi
1 = ˆm1 for trajectoryτi, 1 ≤i ≤M;
4: for t = 1 to T do
5: For each trajectoryτi, add the inputzi
t = ( ˆmi
t,xi
t) to
Dt as feature variables and the corresponding fi
t+1
toDt as the targets;
6: Train a hypothesis Ft on Dt to minimize the loss
d(F (z),f ) overDt;
7: For each trajectory τi, roll out F1,...,F t along the
trajectory (Eq. 6) to compute ˆmi
t+1;
8: end for
9: Return: the sequence of hypothesis {Ft}N
t=1.
We ﬁrst present a algorithm for learning non-stationary ﬁl-
ters using Forward Training (Ross & Bagnell, 2010) in
Alg. 1. Forward Training learns a non-stationary ﬁlter for
each time step. Namely, at time step t, forward training
learns a hypothesisFt that approximates the ﬁltering proce-
dure at time stept: ˆmt+1 =Ft( ˆmt,xt), where ˆmt is com-
puted by Ft−1( ˆmt−1,xt−1) and so on. Let us deﬁne ˆmi
t
as the predictive state computed by rolling out F1,..,F t−1
on trajectory τi to time step t − 1. We deﬁne fi
t as the
nextk observations starting at time step t on trajectoryτi.
At each time step t, the algorithm collects a set of training
dataDt, where the feature variables zt consist of the pre-
dictive states ˆmi
t from the previous hypothesisFt−1 and the
local observations xi
t, and the targets consist of the corre-
sponding future observationsfi
t+1 across all trajectoriesτi.
It then trains a new hypothesisFt over the hypothesis class
F to minimize the loss over datasetDt.
PSIM with Forward Training aims to ﬁnd a good sequence
of hypotheses {Ft} such that:
min
F1∈F,...FT∈F
Eτ∼Dτ
[ 1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1)
]
, (5)
s.t. ˆmτ
t+1 =Ft( ˆmτ
t,xτ
t ), ∀t ∈ [1,T − 1], (6)
where ˆm1 = arg minm
∑M
t=1d(m,f i
1), which is equal to
1
T
∑T
i=1φ(fi
i ). Let us deﬁne ωt as the joint distribution
of feature variables zt and targets ft+1 after rolling out
F1,...,F t−1 on the trajectories sampled from Dτ . Under
this deﬁnition, the ﬁlter error deﬁned above is equivalent
to 1
T
∑T
t=1 E(z,f )∼ωt
[
d(Ft(z),f )
]
. Note essentially the
datasetDt collected by Alg. 1 at time step t forms a ﬁnite
sample estimation ofωt.
To analyze the consistency of our algorithm, we assume
every learning problem can be solved perfectly (risk mini-
mizer ﬁnds the Bayes optimal) (Langford et al., 2009). We
ﬁrst show that under inﬁnite many training trajectories, and
in realizable case — the underlying true ﬁlters F∗
1,...,F ∗
T
are in the hypothesis class F, Alg. 1 is consistent:
Theorem 4.1. With inﬁnite many training trajectories and
in the realizable case, if all learning problems are solved
perfectly, the sequence of predictors F1,F 2,...,F T from
Alg. 1 can generate exact predictive states E[φ(fτ
t )|hτ
t−1]
for any trajectoryτ ∼ Dτ and 1 ≤t ≤T .
We include all proofs in the appendix. Next for the
agnostic case, we show that Alg. 1 can still achieve
a reasonable upper bound. Let us deﬁne ϵt =
minF∼F E(z,f )∼ωt[d(F (z),f )], which is the minimum
batch training error under the distribution of inputs re-
sulting from hypothesis class F. Let us deﬁne ϵmax =
maxt{ϵt}. Under inﬁnite many training trajectories, even
in the model agnostic case, we have the following guaran-
tees for ﬁltering error for Alg. 1:
Theorem 4.2. With inﬁnite many training trajectories, for
the sequence {Ft}t generated by Alg. 1, we have:
Eτ∼Dτ
[ 1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1)
]
= 1
T
∑
t
ϵt ≤ϵmax.
Theorem. 4.2 shows that the ﬁltering error is upper-
bounded by the average of the minimum batch training er-
rors from each step. If we have a rich class of hypotheses
and small noise (e.g., small Bayes error),ϵt could be small.
To analyze ﬁnite sample complexity, we need to split the
dataset intoT disjoint sets to make sure that the samples in
the datasetDt are i.i.d (see details in Appendix). Hence we
reduce forward training to T independent passive super-
vised learning problems. We have the following agnostic
theoretical bound:
Theorem 4.3. WithM training trajectories, for anyF∗
t ∈
F, ∀t, we have with probability at least 1 −δ:
Eτ∼Dτ
[ 1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1)
]
≤ Eτ∼Dτ
[ 1
T
T∑
t=1
d(F∗
t ( ˆmτ
t,xτ
t ),f τ
t+1)
]
+ 4ν ¯R(F) + 2
√
T ln(T/δ )
2M , (7)
wherev = supF,z,f 2∥F (z)−f∥2, ¯R(F) = 1
T
∑T
t=1Rt(F))
andRt(F) is the Rademacher number ofF underωt.
As one might expect, the learning problem becomes harder
as T increases, however our ﬁnite sample analysis shows
the average ﬁltering error grows sublinearly as ˜O(
√
T ).
Although Alg. 1 has nice theoretical properties, one short-
coming is that it is not very data efﬁcient. In practice, it


## Page 6

Learning to Filter with Predictive State Inference Machines
is possible that we only have small number of training tra-
jectories but each trajectory is long (T is big). This means
that we may have few training data samples (equal to the
number of trajectories) for learning hypothesis Ft. Also,
instead of learning non-stationary ﬁlters, we often prefer to
learn a stationary ﬁlter such that we can ﬁlter indeﬁnitely.
In the next section, we present a different algorithm that
utilizes all of the training data to learn a stationary ﬁlter.
4.3. Learning Stationary Filters with Predictive States
The optimization framework for ﬁnding a good stationary
ﬁlterF is deﬁned as:
min
F∈F
Eτ∼Dτ
1
T
T∑
t=1
d(F ( ˆmt,xt),ft+1), (8)
s.t ˆmt+1 =F ( ˆmt,xt), ∀t ∈ [1,T − 1], (9)
where ˆm1 = arg minm
∑M
t=1d(m,f i
1) = 1
T
∑T
i=1φ(fi
i ).
Note that the above objective function is non-convex,
since ˆmt is computed recursively and in fact is equal to
F (...F (F ( ˆm1,x 1),x 2)...), where we have t − 1 nested
F . As we show experimentally, optimizing this objective
function via Back-Propagation likely leads to local optima.
Instead, we optimize the above objective function using
an iterative approach called Dataset Aggregation (DAgger)
(Ross et al., 2011a) (Alg. 2). Due to the non-convexity of
the objective, DAgger also will not promise global opti-
mality. But as we will show, PSIM with DAgger gives us
a sound theoretical bound for ﬁltering error.
Given a trajectory τ and hypothesis F , we deﬁne ˆmτ,F
t
as the predictive belief generated by F on τ at time step
t. We also deﬁne zτ,F
t to represent the feature variables
( ˆmτ,F
t ,xτ
t ). At iteration n, Alg. 2 rolls out the predic-
tive states using its current hypothesis Fn (Eq. 9) on all
the given training trajectories (Line. 2). Then it collects all
the feature variables {( ˆmi,Fn
t ,xi
t)}t,i and the correspond-
ing target variables {fi
t+1}t,i to form a new datasetD′
n and
aggregates it to the original datasetDn−1. Then a new hy-
pothesisFn is learned from the aggregated dataset Dn by
minimizing the lossd(F (z),f ) overDn.
Alg. 2 essentially utilizes DAgger to optimize the non-
convex objective in Eq. 8. By using DAgger, we can guar-
antee a hypothesis that, when used during ﬁltering, per-
forms nearly as well as when performing regression on the
aggregate dataset DN . In practice, with a rich hypothe-
sis class F and small noise (e.g., small Bayes error), small
regression error is possible. We now analyze the ﬁltering
performance of PSIM with DAgger below.
Let us ﬁx a hypothesis F and a trajectory τ, we
deﬁne ωF,τ as the uniform distribution of (z,f ):
ωF,τ = U
[
(zτ,F
1 ,f τ
2 ),..., (zτ,F
T ,f τ
T +1)
]
. Now we
Algorithm 2 PREDICTIVE STATE INFERENCE MACHINE
(PSIM) with DAgger
1: Input:M independent trajectoriesτi, 1 ≤i ≤M;
2: InitializeD0 ← ∅ and initalizeF0 to be any hypothesis
in F;
3: Initialize ˆm1 = 1
M
∑M
i=1φ(fi
1)
4: for n = 0 to N do
5: UseFn to perform belief propagation (Eq. 9) on tra-
jectoryτi, 1 ≤i ≤M
6: For each trajectory τi and each time step t, add the
inputzi
t = (mi,Fn
t ,xi
t) encountered byFn toD′
n+1
as feature variables and the corresponding fi
t+1 to
D′
n+1 as the targets ;
7: Aggregate datasetDn+1 =Dn ∪D′
n+1;
8: Train a new hypothesisFn+1 onDn+1 to minimize
the lossd(F (m,x ),f );
9: end for
10: Return: the best hypothesis ˆF ∈ {Fn}n on validation
trajectories.
can rewrite the ﬁltering error in Eq. 8 as L(F ) =
Eτ[Ez,f∼ωF,τ [d(F (z),f )]|τ]. Let us deﬁne the loss func-
tion for any predictorF at iterationn of Alg. 2 as:
Ln(F ) = Eτ[Ez,f∼ωFn,τ [d(F (z),f )]|τ]. (10)
As we can see, at iterationn, the datasetD′
n that we collect
forms an empirical estimate of the lossLn:
ˆLn(F ) = 1
M
M∑
τ =1
Ez,f∼ωFn,τ
(
d(F (z),f )
)
. (11)
We ﬁrst analyze the algorithm under the assumption that
M = ∞, ˆLn(F ) = Ln(F ). Let us deﬁne Regret γN
as: 1
N
∑N
n=1Ln(Fn) − minF∈F 1
N
∑N
n=1Ln(F ) ≤ γN .
We also deﬁne the minimum average training error ϵN =
minF∈F 1
N
∑N
n=1Ln(F ). Alg. 2 can be regarded as run-
ning the Follow the Leader (FTL) (Cesa-Bianchi et al.,
2004; Shalev-Shwartz & Kakade, 2009; Hazan et al., 2007)
on the sequence of loss functions {Ln(F )}N
n=1. When the
loss function Ln(F ) is strongly convex with respect to F ,
FTL is no-regret in a sense that limN→∞γN = 0 . Ap-
plying Theorem 4.1 and its reduction to no-regret learning
analysis from (Ross et al., 2011a) to our setting, we have
the following guarantee for ﬁltering error:
Corollary 4.4. (Ross et al., 2011a) For Alg. 2, there exists
a predictor ˆF ∈ {Fn}N
n=1 such that:
L( ˆF ) = Eτ
[
Ez,f∼ω ˆF,τ (d( ˆF (z),f ))|τ
]
≤γN +ϵN.
As we can see, under the assumption that Ln is strongly
convex, asN → ∞ ,γN goes to zero. Hence the ﬁltering
error of ˆF is upper bounded by the minimum batch training


## Page 7

Learning to Filter with Predictive State Inference Machines
N4SID IVR PSIM-Lineard PSIM-Linearb PSIM-RFFd Traj. Pwr
Robot Drill Assembly2.87±0.2 2.39±0.1 2.15±0.1 2.54±0.1 1.80±0.1 27.90
Motion Capture 7.86±0.8 6.88±0.7 5.75±0.5 9.94±2.9 5.41±0.5 107.92
Beach Video Texture231.33±10.5 213.27±11.5 164.23±8.7 268.73±9.5 130.53±9.1 873.77
Flag Video Texture 3.38e3±1.2e2 3.38e3±1.3e2 1.28e3±7.1e1 1.31e3±6.4e1 1.24e3±9.6e1 3.73e3
Table 1. Filter error (1-step ahead) and standard deviation on different datasets. We see that using PSIM with DAgger with both RFF
and Linear outperforms the spectral methods N4SID and IVR, with the RFF performing better on almost all the datasets. DAgger (20
iterations) trains a better linear regression for PSIM than back-propagation with random initialization (400 epochs). We also give the
average trajectory power for the true observations from each dataset.
error that could be achieved by doing regression on DN
within class F. In general the termϵN depends on the noise
of the data and the expressiveness of the hypothesis class
F. Corollary. 4.4 also shows for fully realizable and noise-
free case, PSIM with DAgger ﬁnds the optimal ﬁlter that
drives the ﬁltering error to zero whenN → ∞.
The ﬁnite sample analysis from (Ross et al.,
2011a) can also be applied to PSIM. Let us deﬁne
ˆϵN = min F∈F 1
N
ˆLn(F ), ˆγN ≥ 1
N
∑N
n=1 ˆLn(Fn) −
minF∈F 1
N
∑N
n=1 ˆLn(F ), we have:
Corollary 4.5. (Ross et al., 2011a) For Alg. 2, there exists
a predictor ˆF ∈ { Fn}N
n=1 such that with probability at
least 1 −δ:
L( ˆF ) = Eτ
[
Ez,f∼ω ˆF,τ (d( ˆF (z),f ))|τ
]
≤ ˆγN + ˆϵN
+Lmax(
√
2 ln(1/δ)
MN ). (12)
5. Experiments
We evaluate the PSIM on a variety of dynamical system
benchmarks. We use two feature functions: φ1(ft) =
[xt,...,x t+k−1], which stack the k future observations
together (hence the message m can be regarded as a
prediction of future k observations (ˆxt,.., ˆxt+k−1)), and
φ2(ft) = [xt,...,x t+k−1,xt2,...,x 2
t+k−1], which includes
second moments (hence m represents a Gaussian distri-
bution approximating the true distribution of future obser-
vations). To measure how good the computed predictive
states are, we extract ˆxi from ˆmt, and evaluate ∥ˆxi −xi∥2
2,
the squared distance between the predicted observation ˆxi
and the corresponding true observation xi. We implement
PSIM with DAgger using two underlying regression meth-
ods: ridge linear regression ( PSIM-Lineard) and linear
ridge regression with Random Fourier Features ( PSIM-
RFFd) (Rahimi & Recht, 2007)5. We also test PSIM with
back-propagation for linear regression ( PSIM-Linearb).
We compare our approaches to several baselines: Autore-
gressive models (AR), Subspace State Space System Iden-
tiﬁcation (N4SID) (Van Overschee & De Moor, 2012), and
PSRs implemented with IVR (Hefny et al., 2015).
5With RFF, PSIM approximately embeds the distribution of
ft into a Reproducing Kernel Hilbert Space.
Figure 2. The convergence rate of different algorithms. The ratios
(y-axis) are computed as log( e
eF
) for errore from corresponding
algorithms. The x-axis is computed as log(N), where N is the
number of trajectories used for training.
5.1. Synthetic Linear Dynamical System
First we tested our algorithms on a synthetic linear dynami-
cal system (Eq. 2) with a 2-dimensional observationx. We
designed the system such that it is exactly 2-observable.
The sequences of observations are collected from the linear
stationary Kalman ﬁlter of the LDS (Boots, 2012; Hefny
et al., 2015). The details of the LDS are in Appendix.
Since the data is collected from the stationary Kalman
ﬁlter of the 2-observable LDS, we set k = 2 and use
φ1(ft) = [ xt,xt+1]. Note that the 4-dimensional pre-
dictive state E[φ1(ft)|ht] will represent the exact condi-
tional distribution of observations (xt,xt+1) and therefore
is equivalent toP (st|ht−1) (see the detailed case study for
LDS in Appendix). With linear ridge regression, we test
PSIM with forward training, PSIM with DAgger, and AR
models (AR-k) with different lengths ( k steps of past ob-
servations) of history on this dataset. For each method, we
compare the average ﬁltering errore toeF which is com-
puted by using the underlying linear ﬁlterF of the LDS.
Fig. 2 shows the convergence trends of PSIM with DAg-
ger, PSIM with Forward Training, and AR as the number of
training trajectories N increases. The prediction error for
AR withk = 5, 10, 20 is too big to ﬁt into the plot. PSIM
with DAgger performs much better with few training data
while Forward Training eventually slightly surpasses DAg-
ger with sufﬁcient data. The AR-k models need long his-
tories to perform well given data gnereated by latent state
space models, even for this 2-observable LDS. Note AR-


## Page 8

Learning to Filter with Predictive State Inference Machines
Pred. Step 1 Pred. Step 2 Pred. Step 3 Pred. Step 4
Avg. Filtering Error
0
1
2
3
4
5
6
7
8
9 Robot Drill Assembly
RFF + Linear
Linear
IVR
N4SID
(a) Robot Drill Assembly
Pred. Step 1 Pred. Step 2 Pred. Step 3
Avg. Filtering Error
0
50
100
150
200
250
300
350 Beach Video Texture
RFF + Linear
Linear
IVR
N4SID (b) Beach Video Texture
Pred. Step 1 Pred. Step 2 Pred. Step 3 Pred. Step 4
Avg. Filtering Error
0
2
4
6
8
10
12
14
16
18 Motion Capture
RFF + Linear
Linear
IVR
N4SID (c) Motion Capture
Figure 3. Filter error for multiple look ahead steps for the future predictions shown for a few of the datasets. We see across datasets that
the performance of both IVR and N4SID are signiﬁcantly worse than using PSIM with either linear or random Fourier feature + linear
learner. For some datasets, the nonlinearity of the random Fourier features helps to improve the performance.
35 performs regression in a 70-dimensional feature space
(35 past observations), while PSIM only uses 6-d features
(4-d predictive state + 2-d current observation). This shows
that predictive state is a more compact representation of the
history and can reduce the complexity of learning problem.
5.2. Real Dynamical Systems
We consider the following three real dynamical systems:
(1) Robot Drill Assembly: the dataset consists of 96 sensor
telemetry traces, each of length 350, from a robotic manip-
ulator assembling the battery pack on a power drill. The 13
dimensional noisy observations consist of the robot arm’s
7 joint torques as well as the the 3D force and torque vec-
tors. Note the ﬁxed higher level control policy for the drill
assembly task is not given in the observations and must
be learned as part of the dynamics; (2) Human Motion
Capture: the dataset consists of 48 skeletal tracks of 300
timesteps each from a Vicon motion capture system from
three human subjects performing walking actions. The ob-
servations consist of the 3D positions of the various skeletal
parts (e.g. upperback, thorax, clavicle, etc.); (3) Video Tex-
tures: the datasets consists of one video of ﬂag waving and
the other one of waves on a beach.
For these dynamical systems, we do not test PSIM with
Forward Training since our benchmarks have a large num-
ber of time steps per trajectory. Throughout the experi-
ments, we set k = 5 for all datasets except for video tex-
tures, where we set k = 3 . For each dataset, we ran-
domly pick a small number of trajectories as a validation
set for parameter tuning (e.g., ridge, rank for N4SID and
IVR, band width for RFF). We partition the whole dataset
into ten folds, train all algorithms on 9 folds and test on
1 fold. For the feature function φ1, the average one-step
ﬁltering errors and its standard deviations across ten folds
are shown in Tab. 1. Our approaches outperforms the two
baselines across all datasets. Since the datasets are gener-
ated from complex dynamics, PSIM with RFF exhibits bet-
ter performance than PSIM with Linear. This experimen-
tally supports our theorems suggesting that with powerful
regressors, PSIM could perform better. We implement
PSIM with back-propagation using Theano with several
training approaches: gradient descent with step decay, RM-
SProp (Tieleman & Hinton, 2012) and AdaDelta (Zeiler,
2012) (see Appendix. E). With random initialization, back-
propagation does not achieve comparable performance, ex-
cept on the ﬂag video, due to local optimality.We observe
marginal improvement by using back-propogation to reﬁne
the solution from DAgger. This shows PSIM with DAgger
ﬁnds good models by itself (details in Appendix. E). We
also compare these approaches for multi-step look ahead
(Fig. 3). PSIM consistently outperforms the two baselines.
To show predictive states with largerk encode more infor-
mation about latent states, we additionally run PSIM with
k = 1 using φ1 . PSIM (DAgger) with k = 5 outper-
formsk = 1 by 5% for robot assembly dataset, 6% for mo-
tion capture, 8% for ﬂag and 32% for beach video. Includ-
ing belief over longer futures into predictive states can thus
capture more information and increase the performance.
For feature functionφ2 andk = 5, with linear ridge regres-
sion, the 1-step ﬁlter error achieved by PSIM with DAgger
across all datasets are: 2.05 ± 0.08 on Robot Drill Assem-
bly, 5.47 ± 0.42 on motion capture, 154.02 ± 9.9 on beach
video, and 1.27e3 ± 13e1 on ﬂag video. Comparing to the
results shown in the PSIM-Lineard in column of Table. 1,
we achieve slightly better performance on all datasets, and
noticeably better performance on the beach video texture.
6. Conclusion
We introduced P REDICTIVE STATE INFERENCE MA-
CHINES , a novel approach to directly learn to ﬁlter with
latent state space models. Leveraging ideas from PSRs,
PSIM reduces the unsupervised learning of latent state
space models to a supervised learning setting and guaran-
tees ﬁltering performance for general non-linear models in
both the realizable and agnostic settings.
Acknowledgements
This material is based upon work supported in part by:
DARPA ALIAS contract number HR0011-15-C-0027 and
National Science Foundation Graduate Research Fellow-
ship Grant No. DGE-1252522. The authors also thank Ge-
off Gordon for valuable discussions.


## Page 9

Learning to Filter with Predictive State Inference Machines
References
Bagnell, J Andrew, Grubb, Alex, Munoz, Daniel, and Ross,
Stephane. Learning deep inference machines. The Learning
Workshop, 2010.
Banerjee, Arindam, Guo, Xin, and Wang, Hui. On the optimality
of conditional expectation as a bregman predictor. Information
Theory, IEEE Transactions on, 51(7):2664–2669, 2005.
Bastien, Fr ´ed´eric, Lamblin, Pascal, Pascanu, Razvan, Bergstra,
James, Goodfellow, Ian J., Bergeron, Arnaud, Bouchard, Nico-
las, and Bengio, Yoshua. Theano: new features and speed im-
provements. Deep Learning and Unsupervised Feature Learn-
ing NIPS 2012 Workshop, 2012.
Boots, Byron. Spectral Approaches to Learning Predictive Rep-
resentations. PhD thesis, Carnegie Mellon University, 2012.
Boots, Byron and Gordon, Geoffrey J. Predictive state temporal
difference learning. In NIPS, 2011.
Boots, Byron, Siddiqi, Sajid M, and Gordon, Geoffrey J. Clos-
ing the learning-planning loop with predictive state representa-
tions. The International Journal of Robotics Research , 30(7):
954–966, 2011.
Cesa-Bianchi, Nicolo, Conconi, Alex, and Gentile, Claudio. On
the generalization ability of on-line learning algorithms. In-
formation Theory, IEEE Transactions on , 50(9):2050–2057,
2004.
Coates, Adam, Abbeel, Pieter, and Ng, Andrew Y . Learning for
control from multiple demonstrations. In ICML, pp. 144–151,
New York, NY , USA, 2008.
Duchi, John, Hazan, Elad, and Singer, Yoram. Adaptive subgra-
dient methods for online learning and stochastic optimization.
The Journal of Machine Learning Research , 12:2121–2159,
2011.
Hazan, Elad, Agarwal, Amit, and Kale, Satyen. Logarithmic
regret algorithms for online convex optimization. Machine
Learning, 69(2-3):169–192, 2007.
Hefny, Ahmed, Downey, Carlton, and Gordon, Geoffrey J. Super-
vised learning for dynamical system learning. In Advances in
Neural Information Processing Systems 28, 2015.
Hsu, Daniel, M. Kakade, Sham, and Zhang, Tong. A spectral
algorithm for learning hidden markov models. In COLT, 2009.
Jaeger, Herbert. Observable operator models for discrete stochas-
tic time series. Neural Computation, 12(6):1371–1398, 2000.
Kulesza, Alex, Rao, N Raj, and Singh, Satinder. Low-rank spec-
tral learning. In Proceedings of the 17th Conference on Artiﬁ-
cial Intelligence and Statistics, 2014.
Langford, John, Salakhutdinov, Ruslan, and Zhang, Tong. Learn-
ing nonlinear dynamic models. In Proceedings of the 26th In-
ternational Conference on Machine Learning (ICML-09) , pp.
75, 2009.
Lin, Guosheng, Shen, Chunhua, Reid, Ian, and van den Hengel,
Anton. Deeply learning the messages in message passing infer-
ence. In Advances in Neural Information Processing Systems,
pp. 361–369, 2015.
Littman, Michael L., Sutton, Richard S., and Singh, Satinder. Pre-
dictive representations of state. In NIPS, pp. 1555–1561. MIT
Press, 2001.
Mohri, Mehryar, Rostamizadeh, Afshin, and Talwalkar, Ameet.
Foundations of machine learning. MIT press, 2012.
Rahimi, Ali and Recht, Benjamin. Random features for large-
scale kernel machines. In Advances in neural information pro-
cessing systems, pp. 1177–1184, 2007.
Ramakrishna, Varun, Munoz, Daniel, Hebert, Martial, Bagnell,
James Andrew, and Sheikh, Yaser. Pose machines: Articulated
pose estimation via inference machines. In Computer Vision–
ECCV 2014, pp. 33–47. Springer, 2014.
Ross, St´ephane and Bagnell, J. Andrew. Efﬁcient reductions for
imitation learning. In AISTATS, pp. 661–668, 2010.
Ross, St ´ephane, Gordon, Geoffrey J, and Bagnell, J.Andrew. A
reduction of imitation learning and structured prediction to no-
regret online learning. InInternational Conference on Artiﬁcial
Intelligence and Statistics, 2011a.
Ross, Stephane, Munoz, Daniel, Hebert, Martial, and Bagnell,
J Andrew. Learning message-passing inference machines for
structured prediction. In CVPR, pp. 2737–2744, 2011b.
Roweis, Sam and Ghahramani, Zoubin. A unifying review of
linear gaussian models. Neural computation, 11(2):305–345,
1999.
Shalev-Shwartz, Shai and Kakade, Sham M. Mind the duality
gap: Logarithmic regret algorithms for online optimization. In
NIPS, pp. 1457–1464, 2009.
Singh, Satinder, James, Michael R., and Rudary, Matthew R. Pre-
dictive state representations: A new theory for modeling dy-
namical systems. In UAI, 2004.
Srebro, Nathan, Sridharan, Karthik, and Tewari, Ambuj. Opti-
mistic rates for learning with a smooth loss. arXiv preprint
arXiv:1009.3896, 2010.
Tieleman, Tijmen and Hinton, Geoffrey. Lecture 6.5-rmsprop:
Divide the gradient by a running average of its recent magni-
tude. COURSERA: Neural Networks for Machine Learning, 4:
2, 2012.
Van Overschee, Peter and De Moor, BL. Subspace identiﬁca-
tion for linear systems: TheoryImplementationApplications .
Springer Science & Business Media, 2012.
Venkatraman, Arun, Hebert, Martial, and Bagnell, J Andrew. Im-
proving multi-step prediction of learned time series models.
AAAI, 2015.
Wei, William Wu-Shyong.Time series analysis. Addison-Wesley
publication, 1994.
Zeiler, Matthew D. Adadelta: an adaptive learning rate method.
arXiv preprint arXiv:1212.5701, 2012.


## Page 10

Learning to Filter with Predictive State Inference Machines
A. Proof of Theorem. 4.1
Proof. We prove the theorem by induction. We start from t = 1. Under the assumption of inﬁnite many training trajectories, ˆm1 is
exactly equal tom1, which is Eτ(φ(f1)) (no observations yet, conditioning on nothing).
Now let us assume at time step t, we have all computed ˆmτ
j equals tomτ
j for 1≤j≤t on any trajectoryτ. Under the assumption of
inﬁnite training trajectories, minimizing the empirical risk over Dt is equivalent to minimizing the true risk Eτ[d(F (mτ
t,xτ
t ),f τ
t+1)].
Since we use sufﬁcient features for distributionP (ft|ht−1) and we assume the system is k-observable, there exists a underlying deter-
ministic map, which we denote asF∗
t here, that mapsmτ
t andxτ
t tomτ
t+1 (Eq. 4 representsF∗
t ). Without loss of generality, for anyτ,
conditioned on the historyhτ
t , we have that for a noisy observationfτ
t :
φ(fτ
t+1)|hτ
t = E[φ(fτ
t+1)|hτ
t ] +ϵ (13)
=mτ
t+1 +ϵ (14)
=F∗
t (mτ
t,xτ
t ) +ϵ, (15)
where E[ϵ] = 0. Hence we have thatF∗
t is the operator of conditional expectation E[
(
φ(ft+1)|ht
)
|mt,xt], which exactly computes the
predictive statemt+1 = E[φ(fτ
t+1)|hτ
t ], givenmτ
t andxτ
t on any trajectoryτ.
Since the lossd is a squared loss (or any other loss that can be represented by Bregman divergence), the minimizer of the true risk will
be the operator of conditional expectation E[
(
φ(ft+1)|ht
)
|mt,xt]. Since it is equal to F∗ and we haveF∗∈F due to the realizable
assumption, the risk minimization at step t exactly ﬁndsF∗
t . Using ˆmτ
t (equals to mτ
t based on the induction assumption for step t),
andxτ
t , the risk minimizer F∗ then computes the exact mτ
t+1 for time step t + 1. Hence by the induction hypothesis, we prove the
theorem.
B. Proof of Theorem. 4.2
Under the assumption of inﬁnitely many training trajectories, we can represent the objective as follows:
Eτ∼D
1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1) = 1
T
T∑
t=1
E(z,f )∼ωt
[
d(Ft(z),f )
]
(16)
Note that eachFt is trained by minimizing the risk:
Ft = arg min
F∼F
E(z,f )∼ωt
[
d(F (z),f )
]
. (17)
Since we deﬁneϵt = minF∼F E(z,f )∼ωt
[
d(F (z),f )
]
, we have:
Eτ∼D
1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1) = 1
T
T∑
t=1
E(z,f )∼ωt
[
d(Ft(z),f )
]
≤ 1
T
∑
t
ϵt. (18)
Deﬁningϵmax = maxt{ϵt}, we prove the theorem.
C. Proof of Theorem. 4.3
Proof. Without loss of generality, let us assume the loss d(F (z),f ) ∈ [0, 1]. To derive generalization bound using Rademacher
complexity, we assume that∥F (z)∥2 and∥f∥2 are bounded for any z,f,F ∈F , which makes sure that d(F (z),f ) will be Lipschitz
continuous with respect to the ﬁrst termF (z)6.
GivenM samples, we further assume that we split M samples intoT disjoint setsS1,...,S T , one for each training process of Fi, for
1≤i≤T . The above assumption promises that the dataSt for training each ﬁlterFt is i.i.d. Note that eachSi now containsM/T i.i.d
trajectories.
Since we assume that at time step t, we use St (rolling out F1,...,F t−1 on trajectories in St) for training Ft, we can essentially treat
each training step independently: when learningFt, the training dataz,f are sampled fromωt and are i.i.d.
Now let us consider time step t. With the learned F1,...,F t−1, we roll out them on the trajectories in St to get M
T i.i.d samples of
(z,f )∼ ωt. Hence, training Ft on these M
T i.i.d samples becomes classic empirical risk minimization problem. Let us deﬁne loss
class asL = {lF : (z,f ) → d(F (z),f ) : F ∈ F}, which is determined by F and d. Without loss of generality, we assume
l(z,f )∈ [0, 1],∀l∈L . Using the uniform bound from Rademacher theorem (Mohri et al., 2012), we have for any F ∈F , with
6Note that in fact for the squared loss, d is 1-smooth with respect to its ﬁrst item. In fact we can remove the boundness assumption
here by utilizing the existing Rademacher complexity analysis for smooth loss functions (Srebro et al., 2010).


## Page 11

Learning to Filter with Predictive State Inference Machines
probability at least 1−δ′:
Ez,f∼ωt[d(F (z),f )]− T
M
∑
i
d(F (zi),f i)| (19)
≤ 2Rt(L) +
√
T ln(1/δ′)
2M , (20)
whereRt(L) is Rademacher complexity of the loss class L with respect to distribution ωt. Since we have Ft is the empirical risk
minimizer, for anyF∗
t ∈F , we have with probability at least 1−δ′:
Ez,f∼ωt[d(Ft(z),f )]≤ Ez,f∼ωt[d(F∗
t (zi),f i)] + 4Rt(L) + 2
√
T ln(1/δ′)
2M . (21)
Now let us combine all time steps together. For anyF∗
t ∈F ,∀t, with probability at least (1−δ′)T , we have:
Eτ∼Dτ
[ 1
T
T∑
t=1
d(Ft( ˆmτ
t,xτ
t ),f τ
t+1)
]
= 1
T
T∑
t=1
Ez,f∼dt
[
d(Ft(z),f )
]
≤ 1
T
T∑
t=1
Ez,f∼ωt[d(F∗
t (z),f )] + 4 ¯R(L) + 2
√
T ln(1/δ′)
2M
= Eτ∼Dτ
[ 1
T
T∑
t=1
d(F∗
t ( ˆmτ
t,xτ
t ),f τ
t+1)
]
+ 4 ¯R(L) + 2
√
T ln(1/δ′)
2M , (22)
where ¯R(L) = (1/T )∑T
t=1Rt(L) is the average Rademacher complexity. Inequality. 22 is derived from the fact the event that the
above inequality holds can be implied by the event that Inequality. 21 holds for every time step t (1≤ t≤ T ) independently. The
probability of Inequality. 21 holds for allt is at least (1−δ′)T .
Note that in our settingd(F (z),f ) =∥F (z)−f∥2
2, and under our assumptions that∥F (z)∥2 and∥f∥2 are bounded for anyz,f,F ∈F ,
d(F (z),f ) is Lipschitz continuous with respect to its ﬁrst item with Lipschitz constant equal to ν, which is supF,z,f 2∥F (z)−f∥2.
Hence, from the composition property of Rademacher number (Mohri et al., 2012), we have:
Rt(L)≤νRt(F), ∀t. (23)
It is easy to verify that forT≥ 1,δ′∈ (0, 1), we have (1−δ′)T≥ 1−Tδ′. Let 1−Tδ′ = 1−δ, and solve forδ′, we getδ′ =δ/T .
Substitute Eq. 23 andδ′ =δ/T into Eq. 22, we prove the theorem.
Note that the above theorem shows that for ﬁxed number training examples, the generalization error increase as˜O(
√
T ) (sublinear with
respect toT ).
D. Case Study: Stationary Kalman Filter
To better illustrate PSIM, we consider a special dynamical system in this section. More speciﬁcally, we focus on the stationary Kalman
ﬁlter (Boots, 2012; Hefny et al., 2015)7:
st+1 =Ast +ϵs, ϵs∼N (0,Q ),
xt =Cst +ϵx, ϵx∼N (0,R ). (24)
As we will show, the Stationary Kalman Filter allows us to explicitly represent the predictive states (sufﬁcient statistics of the distributions
of future observations are simple). We will also show that we can explicitly construct a bijective map between the predictive state space
and the latent state space, which further enables us to explicitly construct the predictive state ﬁlter. We will show that the predictive state
ﬁlter is closely related to the original ﬁlter in the latent state space.
The k-observable assumption here essentially means that the observability matrix: O =
[
C CA CA 2 ... CA k−1]⊤
is full
(column) rank. Now let us deﬁneP (st|ht−1) =N (ˆst, Σs), andP (ft|ht−1) =N ( ˆft, Σf). Note that Σs is a constant for a stationary
Kalman ﬁlter (the Kalman gain is converged). Since Σf is purely determined by Σs,A,C,R,Q, it is also a constant. It is clear now
7For a well behaved system, the ﬁlter will become stationary (Kalman gain converges) after running for some period of time. Our
deﬁnition here is slightly different from the classic Kalman ﬁlter: we focus on ﬁltering fromP (st|ht−1) (without conditioning on the
observationxt generated fromst) toP (st+1|ht), while traditional Kalman ﬁlter usually ﬁlters fromP (st|ht) toP (st+1|ht+1).


## Page 12

Learning to Filter with Predictive State Inference Machines
that ˆft =Oˆst. When the Kalman ﬁlter becomes stationary, it is enough to keep tracking ˆst. Note that here, given ˆst, we can compute
ˆft; and given ˆft, we can reveal ˆst asO† ˆft, whereO† is the pseudo-inverse ofO. This map is bijective sinceO is full column rank due
to thek-observability.
Now let us take a look at the update of the stationary Kalman ﬁlter:
ˆst+1 =Aˆst−AΣsCT (CΣsCT +R)−1(Cˆst−xt) =Aˆst−L(Cˆst−xt), (25)
where we deﬁneL =AΣsCT (CΣsCT +R)−1. Here due to the stationary assumption, Σs keeps constant across time steps. Multiple
O on both sides and plug inO†O, which is an identity, at proper positions, we have:
ˆft+1 =Oˆst+1 =OA(O†O)ˆst−OL(CO†Oˆst−xt)
=OAO† ˆft−OL(CO† ˆft−xt) = ˜A ˆft− ˜L( ˜C ˆft−xt) (26)
=
[ ˜A− ˜L ˜C ˜L
][ ˆft
xt
]
, (27)
where we deﬁne ˜A =OAO†, ˜C = CO† and ˜L =OL. The above equation represents the stationary ﬁlter update step in predictive
state space. Note that the deterministic map from ( ˆft, Σf) andxt to ( ˆft+1, Σf) is a linear map (F deﬁned in Sec. 4 is a linear function
with respect to ˆft andxt). The ﬁlter update in predictive state space is very similar to the ﬁlter update in the original latent state space
except that predictive state ﬁlter uses operators (˜A, ˜C, ˜Q) that are linear transformations of the original operators (A,C,Q ).
We can do similar linear algebra operations (e.g., multiplyO and plug inO†O in proper positions) to recover the stationary ﬁlter in the
original latent state space from the stationary predictive state ﬁlter. The above analysis leads to the following proposition:
Proposition D.1. For a linear dynamical system with k-observability, there exists a ﬁlter in predictive state space (Eq. 27) that is
equivalent to the stationary Kalman ﬁlter in the original latent state space (Eq. 25).
We just showed a concrete bijective map between the ﬁlter with predictive states and the ﬁlter with the original latent states by utilizing
the observability matrix O. Though we cannot explicitly construct the bijective map unless we know the parameters of the LDS
(A,B,C,Q,R), we can see that learning the linear ﬁlter shown in Eq. 27 is equivalent to learning the original linear ﬁlter in Eq. 25 in a
sense that the predictive beliefs ﬁltered from Eq. 27 encodes as much information as the beliefs ﬁltered from Eq. 25 due to the existence
of a bijective map between predictive states and the beliefs for latent states.
D.1. Collection of Synthetic Data
We created a linear dynamical system with A∈ R3×3,C∈ R2×3,Q∈ R3×3,R∈ R2×2. The matrix A is full rank and its largest
eigenvalue is less than 1. The LDS is 2-observable. We computed the constance covariance matrix Σs, which is a ﬁxed point of
the covariance update step in the Kalman ﬁlter. The initial distribution of s0 is set toN (1, Σs). We then randomly sampled 50000
observation trajectories from the LDS. We use half of the trajectories for training and the left half for testing.
E. Additional Experiments
With linear regression as the underlying ﬁlter model: ˆmt+1 =W [ ˆmT
t,xT
t ]T , whereW is a 2-d matrix, we compare PSIM with back-
propagation using the solutions from DAgger as initialization to PSIM with DAgger, and PSIM with back-propagation with random
initialization. We implemented PSIM with Back-propagation in Theano (Bastien et al., 2012). For random initialization, we uniformly
sample non-zero small matrices to avoid gradient blowing up. For training, we use mini-batch gradient descent where each trajectory is
treated as a batch. We tested several different gradient descent approaches: regular gradient descent with step decay, AdaGrad (Duchi
et al., 2011), AdaDelta (Zeiler, 2012), RMSProp (Tieleman & Hinton, 2012). We report the best performance from the above approaches.
When using the solutions from PSIM with DAgger as an initialization for back-propagation, we use the same setup. We empirically
ﬁnd that RMSProp works best across all our datasets for the inference machine framework, while regular gradient descent generally
performs the worst.
PSIM-Linear (DAgger) PSIM-Linear (Bp) PSIM-Linear (DAgger + Bp)
Robot Drill Assembly 2.15 2.54 2.09
Motion Capture 5.75 9.94 5.66
Beach Video Texture 164.23 268.73 164.08
Table 2. Comparison between PSIM with DAgger, PSIM with back-propagation using random initialization, and PSIM with back-
propagation using DAgger as initialization with ridge linear regression.
Tab. 2 shows the results of using different training methods with ridge linear regression as the underlying model.
Additionally, we test back-propagation for PSIM with Kernel Ridge regression as the underlying model: ˆmt+1 =Wη ( ˆmt,xt), where
η is a pre-deﬁned, deterministic feature function that maps ( ˆmt,xt) to a reproducing kernel Hilbert space approximated with Random


## Page 13

Learning to Filter with Predictive State Inference Machines
Fourier Features (RFF). Essentially, we lift the inputs ( ˆmt,xt) into a much richer feature space (a scaled, and transition invariant
feature space) before feeding it to the next module. The results are shown in Table. 3. As we can see, with RFF, back-propagation
achieves better performance than back-propagation with simple linear regression (PSIM-Linear (Bp)). This is expected since using
RFF potentially captures the non-linearity in the underlying dynamical systems. On the other hand, PSIM with DAgger achieves better
results than back-propagation across all the datasets. This result is consistent with the one from PSIM with ridge linear regression.
PSIM-RFF (Bp) PSIM-RFF (DAgger) RNN
Robot Drill Assembly 2.54 1.80 1.99
Motion Capture 9.26 5.41 9.6
Beach Video Texture 202.10 130.53 346.0
Table 3. Comparison between PSIM with DAgger, PSIM with back-propagation using random initialization with kernel ridge linear
regression, and Recurrent Neural Network. For RNN, we use 100 hidden states for Robot Drill Assembly, 200 hidden states for motion
capture, and 2500 hidden states for Beach Video Texture.
Overall, several interesting observations are: (1) back-propagation with random initialization achieves reasonable performance (e.g.,
good performance on ﬂag video compared to baselines), but worse than the performance of PSIM with DAgger. PSIM back-propagation
is likely stuck at locally optimal solutions in some of our datasets; (2) PSIM with DAgger and Back-propagation can be symbiotically
beneﬁcial: using back-propagation to reﬁne the solutions from PSIM with DAgger improves the performance. Though the improvement
seems not signiﬁcant over the 400 epochs we ran, we do observe that running more epochs continues to improve the results; (3)
this actually shows that PSIM with DAgger itself ﬁnds good ﬁlters already, which is not surprising because of the strong theoretical
guarantees that it has.
