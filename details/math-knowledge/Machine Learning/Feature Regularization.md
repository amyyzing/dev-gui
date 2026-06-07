# 12_13PDFArxivPostN6

Converted from: `Machine Learning\Feature Regularization.pdf`


## Page 1

Feature Vector Regularization in Machine Learning
Yue Fan1, Mark Kon1,2, and Louise Raphael3
Abstract: Problems in machine learning (ML) often invol ve noisy input data, a nd ML classification
methods have in some cases reached limiting accuracies when  they are based on standard ML data sets, e.g.
consisting of feature vectors and classes. An important  step toward greater accuracy in ML will require
incorporation of prior structural information on data into learning.  We will denote methods which
regularize feature vectors as unsuperv ised regularization methods, analogous  to supervised regularization
methods used to estimate functions in machine learni ng. We study regularization ( denoising) of ML feature
vectors using analogues of Tikhonov and other regularization methods for functions on /Rbbn .  A feature
vector x=(x1,… , xn)={xq}q=1
n is viewed as a function of its index q , and smoothed using some prior
information on the structure of the feature vector.  Th is can involve a penalty functional on feature vectors
analogous to those in statistical l earning, or use of some proximity (e .g. graph) structure on the set of
indices q (the index space). Such feature vector regularization inhe rits a property from function denoising
on /Rbbn , in that denoising accuracy is non-monotonic i n the denoising (regularization) parameter α.  Under
some assumptions about the noise level and the data structure, we show that the best reconstruction
accuracy also occurs at a finite positive αin index spaces with graph struct ures. We adapt two standard
function denoising methods used on /Rbbn , local averaging and kernel regression. In general the index space
can be any discrete set with a notion of proximity, e.g. a metric space, a subset of /Rbbn , or a graph/network,
with feature vectors as functions with some notion of  continuity. We show this improves feature vector
recovery, and thus the subsequent classification o r regression done on them. We give an example in gene
expression analysis for cancer classification, with the genome as an index space w ith a network structure
based on prior knowledge of pr otein-protein interactions.
1.  Introduction
Noise from irregular or imprecisely measured data is an important problem in machine
learning, particularly in computational biology applications [1, 2]. A single gene
expression array can measure human gene expressions in the tens of thousands.
However, measurement errors and other sources of variation in gene expression can
interfere with the learning and other algorithms that use them to classify cancer and other
tissue subtypes [3-5]. The accuracies of regression and classification in such high
dimensional problems are in some cases reaching limits, in particular when they are
based strictly on information in datasets, without any known structural constraints.  An
important step in improving this could involve using prior knowledge of constraints in
data structures, based on domain (e.g. biological) information [[6]; [7] [8]].  In
comparison, the machine learning problem of regularizing and denoising functions
defined on Euclidean spaces /Rbbd (e.g. from visual images) has been studied very broadly
([9] [10] [11]).  Regularization methods exploit continuity and other prior constraints on
functions that are measured, and also the lack of such continuity or constraints on noise,
which is largely stochastically independent. One denoising method is to average or
1 Department of Mathematics and Statis tics, Boston University, Boston, MA 02215
2 Department of Mathematics and Center for Theoretical Physics, MIT, Cambridge, MA 02139
3 Department of Mathematics, Howard  University, Washington, DC, 20059


## Page 2

smooth empirically measured functions over adjacent locations (e.g. pixels) in order to
maximally quench noise (variance) and minimally add error to true function values
(bias). Other regularization methods based on noisy as well as partial information about
functions have been studied widely in ML, and these again involve regularization
methods.   For example, given a function f(x) whose (noisy) values yi are known at
points {xi}i=1
n in /Rbbd , a regularization method typically estimates f as the minimizer of
a regularization functional
L( f)= | f(xi)−yi |2 +α|| f||2
∑ (1.1)
where the second term α|| f||2 represents an appropriate penalty representing the
deviation of f from known prior constraints, while the first term is a penalty for
deviation of the approximating f from the measured values at the points xi ∈/Rbbd .
The success of such regularization methods suggests that similar methods might be
useful in a different stage of the machine learning process, the formation of the feature
vector x=(x1,… , xn) itself.  To exploit methods previously used for function
regularization, we will view an ML feature vector z=(z1,… , zn) , e.g., defining
expressions of genes q=1,… ,n , as a feature function z(q) defined on its index space (of
genes) q , 1≤q≤n .  This allows the adoption of well-studied machine learning and
functional and numerical analysis tools for denoising and interpolation of functions on
/Rbbd .  Thus, the spatial structure of /Rbbd can be replaced by a metric or network structure
on the space G of genes q . More generally the feature index q can range over any
structured set on which there is a prior notion of nearness, such as a metric or network
structure.  The resulting denoised feature vectors (e.g. gene arrays) can lead to more
accurate predictions (for example of cancer subtypes). Regularization of a feature vector
requires prior information, for example that (as function on q ) it is ‘continuous’,
meaning that ‘nearby’ indices q yield ‘nearby’ features zq = z(q). In practice the space
of q can be a topological or metric space, the real line, or a graph/network. For example,
averaging the value z(q) at index q with the values z(r) of its neighbors will average
out noise, reinforcing similarity and diminishing individually high errors. We will denote
this type of regularization of feature vectors (without use of the information in function
values yi ) as unsupervised regularization.
An example of such regularization in numerical analysis occurs in processing of very
noisy images, where blurring (softening) an image improves visual information content.
This assumes adjacent pixels (feature indices) have nearby illumination levels (feature
values).   The bias from blurring is more than offset by the variance reduction in noise
averaging.  There is an optimal amount of blurring – too little or too much will diminish
the information content.  This can apply to many types feature vectors structured with
continuity relationships between adjacent features, i.e., with features zq similar if their
indices q are nearby.
As seen in blurring (and denoising on /Rbbn ), reconstruction accuracy can be non-
monotonic, first increasing and then decreasing in the regularization parameter, so the
best accuracy occurs at some (but not too much) regularization.  Here we will state and


## Page 3

prove sufficient conditions for this to occur for unsupervised regularization ML index
spaces G with network structures.  Thus we seek conditions under which regularization
can be shown to help. In supervised machine learning this non-monotonicity in the
regularization parameter αis handled through optimization of αusing cross-validation
and other structured risk minimization methods ([6, 7]).  In the unsupervised context of
feature vector regularization, this must be handled differently, since accuracy of the
regularization cannot be measured.  One way to optimize α is to measure the
performance of the unsupervised regularization method in a subsequent supervised
learning task (see Section 6).
Regularization approaches for functions on /Rbbd have been studied widely in the
functional and numerical analysis literature.  Explicit attention to optimal regularization
was introduced originally by Tikhonov [12]. In Tikhonov regularization, there is partial
information about a function f(x) , and the ill posed problem of inverting this to a unique
estimate of f is solved by adding a regularization requirement that some functional or
norm || f|| be minimized (see (1.1) above). This is the basis regularization methods in
statistical machine learning ([6, 7]).
These ideas were extended by Krukovskii [13], who showed that if f(x) is perturbed
by noise η(x) , then a regularization f1α of f1(x)= f(x)+η(x) (with regularization
parameter αscaled properly in the magnitude ||η|| of the noise) can recover f(x) from
pointwise errors better than direct measurement of f1 .  This was made precise in an
asymptotic result as both ||η|| and αgo to 0 in a scaled way, and illustrated the power of
regularization against noise in numerical analysis. Our results, on the other hand, show
when such regularization (on discrete spaces) can help non-asymptotically.  We give
conditions when, for fixed noise η and regularization α, the approximations f1α
improve over direct measurement of f1 , i.e., when regularization cancels noise in
f1 = f +η. This is not novel in numerical analysis, but it has not been applied in general
to regularizing feature vectors.
Regularization of feature vectors. Regularization denoising of feature vectors is thus
pre-processing step prior to any supervised learning of the data, for example using a
classification algorithm.  We will illustrate this in section 6 for regularization of gene
expression vectors used for predicting cancer metastasis. In particular our approach is
not aimed at providing better machine learning decision/discrimination rules,- these are
typically downstream from unsupervised regularization.  This viewpoint has effectively
been used previously e.g., in computational biology applications, where prior group,
network or metric structures on gene sets have been used to regularize gene expression
information [3, 14].
Prior Work.  Denoising of gene expression arrays based on gene networks has been used
elsewhere, including [3], in which local gene clusters based on a protein-protein
interaction (PPI) network were used to provide averaged features for discrimination in
cancer prognosis.  Unlike the approach here, where preprocessing is unsupervised (i.e.,
does not use the classes of the samples), these clusters are built up in a supervised way so


## Page 4

as to maximally differentiate cases and controls, in the same cancer metastasis data sets
(of Wang [5] and van de Vijver [4]) analyzed by us.
Local averaging in gene networks has been used in other contexts. Kasif, et al. [15]
uses biochemical pathway and more generally gene network-based averaging to
strengthen signals in gene expression arrays.  That method, GNEA (Gene Network
Enrichment Analysis) stabilizes gene expression signals by averaging network-connected
expressions. Hammond, et al. [16] studies localized wavelets on graphs based on spectral
decomposition of the graph Laplacian, yielding canonical (graph-based) clustering
methods alternative to those used here.
Methods for regularizing (smoothing) functions on graphs using spectral approaches
have also been studied recently.  Smola and Kondor [17] studied Laplacian
eigenfunctions on graphs to regularize graph-based functions.  Decomposing a function
f on the graph in eigenfunctions of the graph Laplacian gives compression and
dimensional reduction via projection onto a few Laplacian eigenfunctions.   Since the
eigenfunctions typically have local support, this can also decompose f into canonical
local clusters.
In Rapaport, et al., [18], spectral denoising techniques for functions on graphs are
used to regularize gene expression arrays also viewed as functions on the gene network.
Higher spectral components of expression functions are eliminated in a smoothing
process giving less noisy arrays for prediction and classification.
Szlam, et al. [19] overviews diffusions on graphs as means of smoothing (generally
noisy) functions on them. Belkin [20] also studies dimensional reduction via
regularization on graphs using the graph Laplacian and the heat equation. Bougleux, et al.
[21] study alternative methods for function regularization on graphs using energy
functional minimization.  This is used on image functions in which pixels come with an
adjacency structure, using a procedure analogous to smoothing methods for functions on
/Rbbd .
Local averaging and kernel regression. Classical methods for denoising Euclidean
functions include local averaging [22, 23]; convolution methods [24]; and support vector
regression [25].  Our examples will first generalize local averaging; a prototypical
example for this on /Rbbd is Haar wavelet denoising [22, 23]). Finite local averages form a
finite martingale of approximations of the original feature function f1(q) on the (index)
space G of indices q .  The sequence, indexed by a parameter t , consists of locally
averaged conditional expectations 1tf of the perturbed ideal feature function f , given as
1ff η=+ , with ηrepresenting noise and batch effects. Here increasing t represents
averages over larger local sets of indices q .
The sequence f1t of approximations, like its analog in numerical denoising,
approximates the ‘true’ feature function ()fq with an accuracy that increases and then
decreases, in t .  This maximum in accuracy (Theorems 1 and 3) represents a balance in
bias versus variance [26-29], so competing errors due to bias (over-averaging) and
variance (under-quenching of noise) balance at the optimal regularization level (with
minimal error|| f1t −f||).


## Page 5

In Theorem 1 we give conditions for this regularization to help for function denoising
on /Rbb, and then for denoising feature vectors on graph structures (Theorem 3). We show
when such regularization of feature vectors x=(xi)i=1
n = x(q) (through averaging using
the graph structure of q∈G ) improves over no regularization.  In section 6 we
numerically study this non-monotonicity of error for several gene expression datasets,
demonstrating optimal accuracy for intermediate clustering levels t .
We average feature values z(q) over different hierarchical clusterings of graph
indices, with indices q and r clustered together based on graph proximity.  These
clusters are hierarchical, with the clustering (partition) At at time t1 is a sub-clustering of
that at time t2 > t1 . Equivalently, σ-field Ft generated by the partition At forms a
filtration, i.e., Ft1
⊆Ft2
for t1 ≤t2 . Thus on a large graph G , we consider a filtration Ft
giving local cluster averages of the feature function f(q) as a conditional expectation,
f1t = E( f1 ||Ft ) , which forms a martingale ([30]).  With some uniformity assumptions on
the filtering Ft (see Section 3, Theorem 3) we have:
Theorem 3:  Let F be a space of feature vectors (feature space) with a basis {bq}q∈G
indexed by a graph G , and let f1 = f +η∈F be a noisy feature vector, with independent
Gaussian noise η~ N(0,εI) .  Let {Ft}0≤t≤T be a filter of G , with σ-fields Ft1
⊆Ft2
for
t1 ≤t2 .  Then the error of the averaging regularization f1t = E( f +η|| Ft) over 0< t< T
is non-monotonic, i.e., there is a 0< t< T for which the regularization is optimal
(minimizes || f −f1t || in L2 norm).  In particular the optimal regularization is non-trivial,
so t>0 . This statement is uniform over all graphs G , chains 0{}tt TA ≤≤ of refinements
and functions f on G .
Our second approach, also adapted from numerical analysis adapts the function
denoising technique of kernel regression into a regularization method for feature vectors.
This is done again using graph structures on their index sets.
Theorem 5 :  Let G be a finite graph, and ()fq a function on G . Define the noisy
function f1(q)= f (q)+εg(q) , with ()gq standard Gaussian noise on G . Let 1(, )Kq qα
be a kernel converging to the identity as α→0 . Then for every sufficiently small noise
level 0ε> , the expected error E(|| f −f1α||) of the kernel regression approximation
f1α(q)= f1
G
∑(q1)Kα(q1,q)dq1 is minimized at a positive value of the regularization
parameter α, so this regularization improves feature vectors based on G .
In numerical analysis, an alternative method to kernel regression is direct convolution
of the signal function f(q) with a denoising kernel ()gq (such as a Gaussian), creating a
smoothed signal more stable with respect to fluctuations ([31]). Direct convolution (not
studied here) uses a pre-defined convolution kernel, while kernel regression uses a kernel
solving an optimization problem.


## Page 6

Application. We will illustrate such denoising on gene expression arrays, as expression
functions on gene networks,. This will be done using cluster-based local averaging and
will numerically illustrate the above martingales and the non-monotonicity of the error in
clustering parameter t, showing error that has a global minimum at intermediate values.
We will also look at network-based support vector regression, which convolves a
Gaussian g(q) with the expression function f(q) , creating smoothed feature vectors
more stable against fluctuations.  This is illustrated (as a preprocessing step) on gene
expression arrays for predicting breast cancer metastasis. The network structure gives a
prior notion of distance on the feature index set, which admits kernel regression on
expression vectors.
We use two benchmark gene expression cancer datasets, of Van de Vijver [4] and
Wang [5], both analyzing gene expression against metastasis outcomes in breast cancer.
An announcement of these results was presented in [32]. In this paper we give complete
proofs and provide tables of the numerical examples.
To order the topics in the paper, in Section 2 we begin by presenting the real line
analog of our main graph/network theorem on local averaging.  It shows that for
optimized regularization of noisy functions on /Rbb1, the bias-variance tradeoff requires
that the amount ofaveragingneeded for optimal recovery isdetermined by noise tosignal
ratio,parallelingresultslike that of Krukowskii [13]mentioned earlier. Section 3presents
the analogous theorem for functions on graphs or networks.  Sections 4 and 5 similarly
prove theorems onkernel regression on Euclidean spaces, then extended tographs.
Section 6 shows cancer gene expression arrays (as feature vectors) can be denoised
this way, using protein interaction networks. With expression vectors smoothed on an
appropriate network distance scale (similarity measure) they improve prediction of
biologicalproperties, herethe prospective metastasis of given cancer.
The reading of this paper can be done either serially through the sections, or more
compactly by reading this introduction and then moving directly to section 6.
2.  Local averaging for denoising on /Rbb
Local averaging methods for denoising functions ()fq on /Rbbd rely on the metric
structure of /Rbbd , and assumptions on the continuity or smoothness of f . One family of
such denoising methods (e.g. Haar wavelet denoising) uses averaging over local subsets
of /Rbbd which we call clusters.  This method on /Rbbd can be adapted to regularize or smooth
functions on a graph G . In both cases the cluster-based averages can be viewed as
conditional expectations.
On /Rbbd consider a function f1(q)= f (q)+η(q) , where f is a signal and ηis noise.
Let t be a parameter, and {} ttA τ∈ be a sequence of clusterings (i.e. for each t , At is a
collection of disjoint sets partitioning /Rbbd ). We assume the sequence is nested, so that
for t1 < t2 , clustering At2
is the same as or a refinement of At1
.
We view these clusterings on /Rbbd in terms of their σ-fields Ft =σ( At ) , with () tAσ
the σ-field (minimal collection of subsets closed under complements and countable


## Page 7

unions) generated by partition tA . The collection {Ft}t>0 is a nested sequence of σ-
fields, or a filtration on /Rbbd .  The function 1tf formed by averaging 1f over clusters tA is
the conditional expectation f1t = E( f1 ||Ft ) .
Mathematically the conditional expectations
f1t = E( f1 ||Ft )= E( f ||Ft )+ E(η||Ft )
that average 1ff η=+ over the clusters of Ft form a martingale, a collection 1{} ttf τ∈ of
increasingly informative functions (with increasing t ), with f1t measurable with respect
toFt .  Though there is successively more information in 1 ()tfq with increasing t , there
is a local maximum in the accuracy of 1tf in reconstructing the signal f(q) , at a point
0tt= .  This occurs where the averaged noise ηt0
= E(η||Ft0
) in
01tf is optimally
quenched by cluster averaging in Ft0
(variance is reduced), without sacrificing the
information content (addition of too much bias from over-averaging f in tf ).   For t< t0
decreasing away from t0 the function 1tt tff η=+ becomes less informative, since noise
tη exceeds the signal tf without significant averaging over nearby values.   For 0tt>
increasing, information is lost, on the other hand, because over-averaging in tf on large
clusters diminishes the original signal in f , biasing it.
We study this here for functions on /Rbbn and then on networks, and will also illustrate
an application to gene expression arrays. We start with an example theorem on /Rbbfor
denoising continuous f(q) . We will repeat for completeness some definitions in
martingale theory.
Definition 1 :  For a domain G⊂/Rbbn , let F be the collection of Borel sets, i.e. the
minimal extension of the collection of open sets that is closed under complements and
countable unions and forms a σ-field.  A filter of F on G is an increasing sequence Ft
of σ-fields (so Ft1
⊂Ft2
if t2 > t1 )o n G indexed by a non-negative integer parameter
0,tt T ≤≤ , with Ft
t
∪ =F .   For fixed t , the clustering tA of G based on {Ft }t is the
most refined partition of G measurable with respect to Ft , i.e., it is the maximal disjoint
collection of sets in Ft such that all sets in Ft are unions of sets in tA .
LetFt be a filter of F on G. Recall that in case the σ-field Ft is discrete (i.e., is
composed of a finite number of sets) then f1t = E( f ||F1t ) consists of 1f averaged over
sets in the clustering tA generated byFt ⊂F .  For example, if Ft is finite (in addition to
being discrete) then
f1t (q)= 1
| a | f1(q)
q∈a
∑ (for q∈a∈At ) ,


## Page 8

where | a | is the cardinality of set a∈At . This definition on the real line (again in case
F is finite) is similar: for q∈a∈At we define f1t(q) to be the average of f1(q) (now an
integral) over set a .
Definition 2: The above successive averaging of a function over successive σ-fields is
called the martingale on G defined by the function f and the filter Ft .
The martingale ft = E( f ||Ft ) (of approximations to the underlying function f )i s
increasingly informative about f as t increases.  Indeed, tf is an orthogonal projection of
f onto the increasing family of spaces L2 (Ft ) (the square integrable functions
measureable with respect to Ft ). Thus 2|| || tff− decreases monotonically for all t .
This stops holding once noise is added to f. If we measure the noisy function
1() () ()fq q q f η=+ (with added mean zero random noise ()qη ), then as t increases the
conditional expectations f1t = E( f1 ||Ft ) first give better approximations of f, which then
can become successively worse for larger t.  This is a case of too much information as t
increases, in that incrementally more noise than signal is captured in f1t .
It is well known that averaging out noise can improve the estimate of f, something
that occurs in denoising using Haar wavelets (e.g., [23]).  This can be illustrated on the
unit interval with a continuous signal f(q), q∈[0,1] , and additive noise η(q)=εg(q) ,
with g(q) the standard Gaussian noise distribution (i.e.,
0
() () ( 0 , )
s
gqd q bs N s==∫ is
Brownian motion), with ε> 0 .  Let the parameter t= n vary through the positive
integers, and Ft be the σ-field consisting of unions of sets 1,22tt
ii−⎡⎤
⎢⎥⎣⎦
for ( 12 ti≤≤ ).
Consider the behavior (as t→∞) of the 2L error between the signal f(q) and its
denoised approximation f1t (q)= E( f1 ||Ft ) given by
1122 2 2
11 002|| (( ) || ( ( ) ( ) )) ( ( ) ( ))tt t tR t f f fq f q d q f q fq qd qη=− − = + −=∫∫ .(2.1)
We will need the fact that the noise-free error function 02( ) || || tRt f f=− is strictly
decreasing in t for any continuous non-constant f on [0,1], using standard facts from the
Haar wavelet approximation.  Indeed, let [,]ab be any interval on which f is continuous
and non-constant, and 0 ()fx be the constant function averaging f on [,]ab . It follows
easily that if 1 ()fx is constant the left and right halves of [,]ab (averaging f on each
half) then 02 12|| || || ||ff ff−> − .  [L,] The following theorem, stated on [0,1], holds on
any interval of the real line, and generalizes this fact.
Theorem 1: If f is non-constant and continuously differentiable on the unit interval, then
with probability arbitrarily close to 1 for sufficiently small noise level ε> 0 , the error
12() | | || tffRt −= is monotonically decreasing for sufficiently small t, and monotonically
increasing for sufficiently large t, so it is minimized at an intermediate value 0< t0 <∞.


## Page 9

That is, for 0δ> there exists a noise thresholdε> 0 below which the error minimization
statement above holds with probability greater than 1 δ−. By monotonically decreasing
we mean 12 (()() ) ( )EE R tRt ≤ for 12tt≥ , with a similar statement for monotonically
increasing.
Sketch of Proof: Note that for t a nonnegative integer and 1,[ 0 , 1 ]22tt
iiq −⎛⎤∈⊂⎜ ⎥⎝ ⎦
, the
function gt (q)= E(g(q)| |Ft ) takes the constant value
/2 /2 /2
(1 ) / 2
'( ' ) 2 2() 2 2 ,
t
t
itt t t
ti i i
dqgq Z gq Z −
−
== =∫
with iZ independent and identically distributed (iid) standard normal random variables.
Note that R(t)= || ft (q)+εgt (q)−f (q)| |2 , so for sufficiently small ε> 0 , the contribution
of noise εgt (q) to ()Rt is clearly negligible compared to that of the monotonically
decreasing function 20 ( ) | | () () | |tRt fq fq=− .  Thus it will follow (see below) that for
fixed t1 if εis sufficiently small, ()Rt is monotonically decreasing in t for all t≤t1 with
probability greater than 1 δ− , with lim
ε→0
δ= 0 .
Note first that (all norms are in L2 )
R(t)2 =|| f1t −f ||2=|| ft +εgt (q)−f ||2= dq ( ft −f )2 + 2εgt ( ft −f )+ε2 gt
2⎡⎣ ⎤⎦0
1
∫
= dq ( ft −f )2 +ε2 gt
2⎡⎣ ⎤⎦0
1
∫ =|| ft −f ||2 +ε2 || gt ||2 ,
using the fact that on each sub-interval 1,22tt
ii−⎡⎤
⎢⎥⎣⎦
, the function tg is constant, while
/2
(1 ) / 2
() 0t
ti
ti
dq f f
−
−=∫ . Note that
|| gt (q)| |2= dq gt
2
0
1
∫ (q)= dq
(i−1)/2t
i/2t
∫
i=1
2t
∑ gt
2 = 2−t 2t/2 Zi()
i=1
2t
∑
2
=χ2
2t .
where iZ are iid (0,1)N random variables and 2
nχdenotes a chi-square random variable
with n degrees of freedom.  Hence
R(t)2 =|| ft −f ||2 +ε2χ2t
2 (2.2)
Clearly, for εsufficiently small, ()Rt is decreasing for small t with probability arbitrarily
close to 1, since || ||tff− is decreasing.
We now consider the case of large t .  We first note that successive differences in
|| ||tff− converge to 0 as the integer t→∞.  Thus successive differences in the
sequence ()Rt are eventually bounded below by R(t+1)−R(t)≥−1+ε2 (χ2
2t+1 −χ2t
2 ) , with
the two 2χ distributions defined by (2.2) above and not generally independent.  In
addition, the probability that the above term −1+ε2 (χ2
2t+1 −χ2t
2 ) is negative infinitely


## Page 10

often is 0. This follows from the Borel-Cantelli lemma and (the sums below are all in t
ranging over integers)
P χ2t+1
2 −χ2
2t −1
ε2 < 0⎛
⎝⎜
⎞
⎠⎟
2t>1/ε2
∞
∑ ≤ P | χ2t+1
2 −χ2
2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟−2t+1 −2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟|> 2t+1 −2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟
⎛
⎝⎜
⎞
⎠⎟
2t>1/ε2
∞
∑
= P | χ2t+1
2 −χ2
2t() −2t |> 2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟
2t>1/ε2
∞
∑ ≤
V χ2t+1
2 −χ2
2t()
2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟
2
2t>1/ε2
∞
∑
≤
V (χ2t+1
2 )+V (χ2t
2 )+ 2 V (χ2t+1
2 )V (χ2t
2 )
2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟
2
2t>1/ε2
∞
∑ = 2·2t+1 + 2·2t + 2· 2·2 t+1·2·2t
2t −1
ε2
⎛
⎝⎜
⎞
⎠⎟
2
2t>1/ε2
∞
∑ <∞,
where we have used Chebyshev’s inequality.  Note that the last inequality above is
independent of the covariance of the two (dependent) 2χ distributions, and follows from
the Schwartz inequality | c o v (,) | ()()AB V AV B≤ .  This shows that with probability 1,
()Rt is increasing with t for t sufficiently large, and completes the proof.
3.  Graph martingale approximations
We will extend the above theorem for local averaging on /Rbb1 , to clustering-based
averages of functions on graphs, again defined as martingales.  Since a graph/network
structure G is not necessarily consistent with a metric on G , the previous theorem on /Rbb
does not directly extend to graphs or networks.  Nevertheless the notion that proximity-
based averaging can regularize noise carries over to this case.  If network-based data are
given as a noisy function f1(q) on a network G , then the network structure and an
analog of continuity for 1f can help eliminate noise, based on a graph theorem analogous
to the above theorem on /Rbb1 .
As an example, assume G is a network of genes, and that the function
1() () ()fq q q f η=+ represents experimentally measured expression of gene qG∈ (here
q∈G , f (q) is the expression signal and ηnoise). The network structure on G is
assumed to reflect biological relationships among genes that tend to make their
expressions similar, so network-based clusters contain genes with a priori similar gene
expressions.  Thus cluster-averaged expressions, while biasing individual gene
expressions, will quench noise through averaging over genes.  Thus the bias is tolerable
assuming gene expression ()fq is ‘continuous’ onG .
Definition 3. A graph (or network) {G,w} is a collection G of vertices, with the edges
defined as unordered pairs (i, j) .  A symmetric function w(i, j)( i, j∈G),defined on the
edges,has values known as the weights of G.


## Page 11

Let {Ft }T
t=0 be a filter on a finite graph G, with F0 = {G,φ} (the trivial σ-field) and
FT = 2G , σ-field of all subsets, with 0,...,tT= integer-valued.
Given a function f(q) on G, consider the finite martingale on G consisting of local
averages ft = E( f ||Ft ) of f over the clusters At defined byFt . The measurements of f
are subject to noise η(q)=εg(q) .  We assume (discretized) white noise, with ()gq an
(0,1)N standard normal rv (random variable) for qG∈ .  We wish to approximate f from
its noisy measurements f1(q)= f (q)+εg(q) , by projecting 1()fq onto its conditional
expectation f1t = E( f1 ||Ft ) .  We will show that for certain ranges of the parameters, the
non-monotonicity of the error in εon the real line also occurs here. In what follows all
function norms are L2 norms on G unless otherwise specified, and V , E are variance
and expectation respectively.
Lemma 2:  On graph G , let {Ft }1≤t≤T be a filter with clustering tA , and with kt ≡| At | the
number of clusters at level t . Assume 1||| |ttAC A+ ≥ for a fixed 1C> . Letting
ηt(q)= E(η(q)||Ft) , then uniformly over all graphs G (and of course over kt )
1
εE(||ηt ||)= kt + O(1 / kt )( kt →∞) .
and
1
ε2 V (||ηt ||)= O(1) , (3.1)
where V is the variance.
Proof: We first estimate (below at ∈At is a cluster in clustering At )
1
εE(||ηt ||2 )= Eg a (q)2
q∈a
∑
a∈At
∑
⎛
⎝
⎜
⎞
⎠
⎟= E | a | ga (q)2
a∈At
∑
⎛
⎝
⎜
⎞
⎠
⎟= EZ a
2
a∈At
∑
⎛
⎝
⎜
⎞
⎠
⎟, (3.2)
where for cluster a ,
1() ()   ( and )|| ||aaa
aq
ga qg q Z g qa ∈
≡≡∑ .
The above holds since when qa∈ then 1
εηt (q)= ga (q) .
Note that {}
taa AZ ∈ are independent and identically distributed (iid) standard normal
(0,1)N rv’s, since () ( 0 , 1 / | | )agq N a= . Thus letting || tkA= (the number of clusters)
and 2
kχ be a chi-square rv with k degrees of freedom,
1
εE(||ηt ||2 )= EZ a
2
a∈At
∑
⎛
⎝
⎜
⎞
⎠
⎟= E χk
2
() = dx x 1
2k/2Γ(k /2 ) xk/2−1e−x/2
0
∞
∫


## Page 12

= 1
2k/2
1
Γ(k /2 ) dx x
k−1() /2
e−x/2
0
∞
∫ = 1
2k/2
1
Γ(k /2 ) 2dx 2x()
k−1() /2
e−x
0
∞
∫
2(( 1) / 2 12 )( / 2 1 / 2 )(/ 2 )2(/ 2 )
kk kk
Γ−+ = Γ +Γ=
Γ
using the density of the 2
kχ distribution in the third equality.  Using the asymptotic series
[33]:
Γ( j+1/2)
Γ( j) = j 1−1
8 j+ 1
128 j2 + 5
1024 j3 − 21
32768 j4 + ...⎛
⎝⎜
⎞
⎠⎟,
we obtain
1
εE(||ηt ||2 )= 2 k /2 + O(1 / k )= k + O(1 / k ) .
(3.3)
Now
1
ε2 V (||ηt ||2 )= 1
ε2 E(||ηt ||2
2 )−E(||ηt ||2 )2⎡⎣ ⎤⎦= EZ a
2
a∈At
∑
⎛
⎝⎜
⎞
⎠⎟− k + O(1 / k )()
2
= k− k + O(1/ k)()
2
= O(1) (k→∞) , (3.4)
completing the proof.
The following theorem can be used to denoise any function on a graph/network
G that varies ‘slowly’ relative to the network structure. The network plays the role of the
Euclidean metric in Theorem 1, allowing denoising through local averaging. As above,
|| f ||2=|| f ||2
2= dq f (q)2
G
∫ .
We assume noisy measurements f1(q)= f (q)+εg(q) of f (q) , with ()gq white noise on
G (an iid normal for each q ).  We use a filtration Ft on G , with the martingale
f1t = E( f1 ||Ft ) for denoising f1 . The following states Theorem 3 of the introduction
more precisely.
Theorem 3 : Consider all functions f(q) on graphs G that satisfy a uniformity
condition
|| ft −f ||−|| ft+1 −f ||≥K(t) (3.5)
(t=0,1,2,… ,T) on the errors || ft −f|| of their (finite) martingale approximations
ft = E( f ||Ft ), with K(t) a fixed positive function.  Assume that the clusters 0{}tt TA ≤≤ of
the filter {Ft }0≤t≤T have cardinalities satisfying 1||| |ttAC A+ ≥ for some 1C> . Let
f1t = E( f1 ||Ft ) be the martingale for recovering f(q) from the perturbed function
f1 = f(q)+ε(q) .  Then with a probability p arbitrarily close to 1 if 1/εand | G| are


## Page 13

sufficiently large, the approximation error || f1t −f || is non-monotonic, decreasing for
small t and increasing for large t, thus achieving a minimum for a positive value of the
regularization parameter t .
Remark. As is shown below, the statement is uniform over all graphs G , all
hierarchical clusterings 0{}tt TA ≤≤ satisfying the growth condition on || tA , and all
functions f on G satisfying (3.5), for fixed ()Kt and C .  That is, the probability p
defined in the theorem converges to 1 uniformly as ε→0 and | G|→∞.
Proof: Again letting η(t)=εg(q) with the same definitions as in the Lemma, note that
1 1 1( 1) 1|| || ||| || || || || | || | | | | | |tt t t t t ff f f f f f fηη++ + −− −−− − −− ≤
11|| || | || | | ||| | | | |tt t t fff f ηη++−− +≤− + , (3.6)
since 1tt tff f f η−=+− , with a similar statement for tf . Thus by the Lemma (recall
kt =| At |),
1
εE(||ηt+1 ||)−E(||ηt ||)⎡⎣ ⎤⎦= | At+1 |− | At |+ O(1 / | At |)≥ C | At |− | At |+ O(1 / | At |)
() 1| ( 1 / | )||ttCA O A=− + . (3.7)
For random variables X and Y , note
() ( )2 () ( ) 2 ()2(( ) ) VX V Y VX VVX Y VX V YY ≤++ ≤ ++ .
Thus by (3.1),
1
ε2 V (||ηt+1 ||−||ηt ||)≤2
ε2 V (||ηt+1 ||)+ 2
ε2 V (||ηt ||)= O(1) (| At |→∞). (3.8)
Since tf is an orthogonal projection of f , || ft −f ||≤|| f || ,a n d
1( 1) 1 1 1 1|| || || || || || || || || || || || || || || 2 || || ||t t tt t t ttff f f f f fffηη ηη++ + + ≥− − − − − ≥−−− − − ,
and
1( 1) 1 1 || || || ||(|| 0) ( || 2 || || 0 ) |) 0|(||tt t t tPf f P Pff f B ηη++ <≤ −−− − − < = < ,
where
1 |||| || 2 || || ||tt tBB f ηη+≡−=− .
Note however that letting ()BE B≡ , (3.7) gives
B=εC−1() | At |+εO(1 / | At |)−2| | f ||=εC−1() | At |+ O(1) (| At |→∞) ,
So that B>0 for large t .  Note this statement is uniform over all graphs G and
admissible graph clusterings {As}0≤s≤T , (with As the set of clusters at level s ), so it is
non-vacuous only for clusterings with T ≥t .
Thus
2(0 )( ())( | | ) VBBB P B B BP BBP B <− ≤ − ≥ ≤<= − . (3.9)


## Page 14

In addition, (3.8) gives
V (B)= V (||ηt+1 ||−||ηt ||)=ε2O(1) (| At |→∞).
Letting L>0 be sufficiently large that the term O(1)< L for all t , we have V(B)≤Lε2
for a universal constant L (uniform over all graphs and cluster sizes | At | ), so that
P(|| f1(t+1) −f ||−|| f1t −f ||< 0)≤V (B)
B2 = L
C−1() | At |+ O(1)
ε2
⎡
⎣⎢
⎤
⎦⎥
2 ≤ 2L
C−1()
2
| At |
(3.10)
,
for sufficiently large || tA , since εis fixed.
Now note that for the sequence of clusterings (indexed by t ), we have for a given 1t
sufficiently large,
P(Bt ≤0f o r s o m et≥t1)≤ P(Bt ≤0)
t≥t1
∑ ≤ 2L
C−1()
2
| At |t≥t1
∑ .
Here we have required 1t to be large enough for (3.10) to hold for all t≥t1 .  The sum on
the right converges, since the || tA grow geometrically.  For large 1t the right side and
hence the left side above are arbitrarily small.  So 10 for some() t tPB t≤≥ is small for
large 1t , uniformly over all graphs G satisfying the conditions of the theorem.  Thus for
any 0δ> , there is a 1 0t > such that tB is positive for all 1tt≥ with probability greater
than 1 δ− .  Thus with probability greater than 1 δ− , we have || f1(t+1) −f ||−|| f1t −f ||> 0
for all t≥t1(δ) , assuming G is large enough to accommodate a sequence of clusters with
the sizes tA . This completes the case of large t .
For small t, we have from (3.5)
1( 1) 1 1 1 1|| || || || || || || || |||| || || || || || || ( )t t t t tt ttff f f f f f K ft ηη ηη+++ + ≤− + ≤ +−− − − −+ −
Note
() ( )11 || ( )) |(|| | | ( )|| | | | | | | |tt t tEE Kt Kt Eηη η η++ −= −++
=ε| At |+ | At+1 |+ O(| At |−1/2 )+ O(| At+1 |−1/2 )⎡⎣ ⎤⎦−K(t)< 0 , (3.11)
for 0tt≤ (for any fixed 0t ), and sufficiently small ε<ε0 (with ε0 depending on 0t ),
since the 1/2(| | )tOA − term is uniformly bounded in t over G and | At | . (Note there are
only a finite number of integer values t satisfying 00 tt≤≤, and for all of them
() 0Kt > ).  Furthermore by Lemma 2
V (||ηt+1 ||+ ||ηt ||−K(t))= V (||ηt+1 ||)+V (||ηt ||)=ε2O(1) ( t→∞) .
where the (1)O term can similarly be made uniform in the choice of G and | At | .
Thus letting 1|| || || || ( )tt tDK tηη+ +=− , we have (using the same Chebyshev inequality
argument made in (3.9) (note () 0ED D≡< by (3.11) for εsufficiently small and t≤t0 ),


## Page 15

1( 1) 1 ||(| || |||0 )ttff fPf + −− ≥−≤
P(Dt ≥0)≤V (Dt )
Dt
2 = ε2O(1)
ε| At |+ | At+1 |+ O(| At |−1/2 )+ O(| At+1 |−1/2 )⎡⎣ ⎤⎦−K(t){}
2 , (3.12)
which can be made arbitrarily small for 0tt≤ for fixed 0t if εis sufficiently small.
Putting together (3.10) and (3.12), it follows that for any 0δ> , for sufficiently small ε
and large || | | TGA= , (recall the final clustering AT consists of singletons) with
probability at least 1 δ− , there exist t0 > 2 and t1 > t0 such that for 0tt≤ , 1|| || tff − is
decreasing, while for 1tt≥ it is increasing. (Note if t0 =1 monotonicity for t≤t1 is
trivial). This statement is uniform over all finite graphs G and clusterings At satisfying
1||| |ttAC A+ ≥ for a fixed C , and satisfying (3.5) for a fixed K(t). This completes the
proof.
We remark that above, generically, as εdecreases, the thresholds 0t and 1t both increase.
4.  Kernel regression approximation: Euclidean spaces
Our second example of adapting regularization (smoothing) methods on /Rbbd to
regularizing feature vectors uses kernel regression. We will show first on /Rbbd and then
for the graph case, that optimal recovery typically means just the right amount of
smoothing.  Again in smoothing parameter
α, we are interested in when the optimal
recovery is non-trivial, occurring at a finite positive regularization level α.  In this case
the recovery error non-monotonic, worsening as αbecomes very large and very small,
with an intermediate αyielding optimal recovery.
For a function ()fx on a domain E⊂/Rbbd (with continuous boundary E∂), suppose
we are given a noisy version f1(q)= f (q)+εg(q) , with (as earlier) ()gq the Gaussian
(white) noise distribution on /Rbbd (see, e.g., [34]); note that 1()fq is a distribution since
()gq is.  We will recover an approximation of f from f1(q) by smoothing, using
standard Euclidean kernel regression to recover f (q)≈ αi
i
∑ K(q,zi )+ b .
On /Rbbd we assume a family of non-negative kernel functions (() ),,Kq E rrqα ∈
parameterized by 0α> , is an approximate identity, approaching the delta function
()qrδ − (i.e., the identity kernel) as 0α→ .  This means that (similarly to a Gaussian
family 1
(2π)d/2αd e−|q−r|2/(2α2) ) (1)
KαR∫ (q,r)dnr→
α→0
1i f q∈H
0o t h e r w i s e
⎧
⎨⎪
⎩⎪
(4.1)


## Page 16

for any open H⊂E , (2) for α>0 Kα(q,r) is continuous in αand is bounded
uniformly in q,r by a continuous function of α, and (3) that Kα(q,r) converges
uniformly to 0 on E× E as α→∞.
Through the regularization
f1(q)→Kαf1(q)≡ dr Kα(q,r) f1(r)
E
∫ ≡f1α(q) ,
we seek results analogous to those in Section 3, with kernel smoothing replacing local
averaging as a denoising method.
We again seek conditions (based on the previous discussion) for a non-trivial
regularization f1α (with α>0 ) to improve the estimate of f from f1 .  That is, we seek a
condition under which, for increasing values of the regularization α, the error
1| | () () | |fq f q α− should first decrease and then increase, again yielding an intermediate
0αα= for which error is minimized.
Theorem 4:  Let E be a closed bounded domain of /Rbbd , with continuous boundary, and
()fq be a non-zero continuously differentiable function on E . Let ()gq be standard
Gaussian noise in /Rbbd , and define the perturbed function f1(q)= f (q)+εg(q) .   Let
(,)Kq rα be an approximate identity, i.e., a family of bounded functions on EE× ,
converging to the delta distribution ()qrδ − (as above) as 0α→ . Then for small εthe
error E(|| f1α−f ||2 ) of the approximation 11 () (,) () n
E
fq K q r f r d rαα =∫ is non-monotonic
in α≥0 and this error is minimized at a positive regularization level α>0 (which
depends on ε).
Again our interpretation is that error is minimized for positive α, at a value that balances
bias versus variance so that regularization improves estimation.
We define
Gα(q)=
E∫Kα(q,r)g(r)dnr and fα(q)=
E∫Kα(q,r) f (r)dnr (4.2)
for the proof below.
We start with
Lemma 1.  The expected norm E(|| f1α−f ||) is continuous in α.
Proof. Defining R(α)= E(|| f1α−f ||), we have
R(α)−R( ′α)=|| fα+εGα(q)−f||−|| f ′α+εG ′α(q)−f||
≤||( fα+εGα(q)−f)−( f ′α+εG ′α(q)−f)|| =|| fα−f ′α+εGα−εG ′α||
≤|| fα−f ′α||+ε|| Gα−G ′α|| (4.3)
Taking expectations in (4.3),
| E(R(α))−E(R( ′α))|≤|| fα−f ′α||+εE(|| Gα−G ′α||)


## Page 17

Now note that
Gα(q)−Gα′(q)= (Kα(q,r)−Kα′(q,r))g(r)dr
E∫
~ N 0, ( Kα(q,r)−Kα′(q,r)2 dr∫() ~ bq Z(q),
where bq
2 = (Kα(q,r)−Kα′(q,r)2 dr∫ and Z(q) is a standard normal rv for each q . Thus
(Gα(q)−Gα′(q))2 ~ bq
2χ2
1(q), with χ2
1(q) a standard χ2
1 random variable for each q .
Thus
|| Gα−Gα′||2= bq
2χ2
1(q)dq
E∫ ,
and
E(|| Gα−Gα′||2)= bq
2 E(χ2
1(q))dq
E∫ = bq
2
E∫ dq
= (Kα(q,r)−Kα′(q,r))2 dr dq →
α→ ′α
0
E×E∫ .
Hence it follows that E(|| Gα−Gα′||) →
α→α′
0 since the expectation is over a (probability)
space of measure 1.  In addition, fα(q)= f(r)Kα(r,q)dr
E∫ is continuous in α, since
|| fα(q)−fα′(q)|| q ≤ Kα(r,q)−Kα′(r,q) q f(r)dr
E∫ →
α→α′
0 ,
by the dominated convergence theorem. Hence by (4.3) we conclude that
R(α)−R(α′) →
α′→α
0 in distribution, so that E(R(α)) is continuous in α, as desired.
Lemma 2.  The expected norm E ||Gα(q)| |() →
α→∞
0 .
Proof. By standard properties of white noise (as a multidimensional distribution
g(r), r∈/Rbbn ),
E∫Kα(q,r)g(r)dnr≡Gα(q)~ N 0,σα
2 (q)=
E∫Kα
2 (q,r)dnr() (4.4)
is a random variable-valued function of q .  From (4.4), Gα(q)2 ~σα
2(q)χ1
2(q), where
χ2
1(q) is a χ2
1 random variable for each q , and generally depends on q .  Now note
E || Gα||2
() = EG α
2(q)() dq
E∫ = E σα
2(q)χ1
2(q)() dq
E∫
= σα
2(q)E χ1
2(q)() dq
E∫ = σα
2(q)dq
E∫ =||σα
2(q)||2
=
E∫Kα
2(q,r)dnr
E∫ dnq →
α→∞
0
as desired, with the last limit depending on the above-mentioned uniform convergence of
Kα(q,r) for large α, and that E is bounded set.
In the proof below ||·|| denotes an 2L norm.


## Page 18

Proof of Theorem 4:  We first consider the behavior of the expected error
E(R(α)))≡E(|| f1α−f||) for small α.  We write
f1α(q)=
E∫Kα(q,r) f1(r)dnr=
E∫Kα(q,r) f (r)dnr+ε
E∫Kα(q,r)g(r)dnr .
≡fα(q)+εGα(q) , (4.5)
where fα and Gα are as in (4.2). Note that
R(α)≡|| f1α−f ||=|| fα+εGα(q)−f ||≥ε||Gα(q)| |−|| fα−f || . (4.6)
For fixed q note also that Gα(q)2 converges to ∞in distribution as α→0 , since
E∫Kα
2 (q,r)dnr→
α→0
∞. Hence also
|| Gα(q)||2= Gα
2(q)dq
/Rbbd∫ →
α→0
∞
in distribution, and so || Gα(q)|| does the same, and therefore
E(|| Gα(q)||) →
α→0
∞. (4.7)
Since || fα−f||→
α→0
0 , it follows from (4.6) and (4.7) that
E(R(α))≥εE(|| Gα(q)||)−|| fα−f||→
α→0
∞,
so that E(R(α)) increases unboundedly as α→0
Now we consider the behavior of E(R(α)) as α→∞.  In order to show that
E(R(α)) attains its minimum at a finite value of α, we now show that it is greater than
its minimum for large α>0 .  We now use the fact that
R(α)≡|| f1α−f ||=|| fα+εGα(q)−f ||≥|| fα−f ||−ε||Gα(q)| |. (4.8)
Also by the uniform convergence to 0 for Kα(q,r) as α→∞, it follows that fα(q)
converges (deterministically) to the zero function in L2(E).  Thus || fα−f||>1
2|| f|| for
αlarge. By
E(R(α))≥|| fα−f||−εE(|| Gα(q)||) , (4.9)
if ε>0 is sufficiently small then (for large α)
liminf
α→∞
E(R(α))≥lim
α→∞
|| fα−f||−εlimsup
α→∞
E(|| Gα(q)||)
>1
2|| f||>0.
On the other hand, for small ε(i.e. as ε→0 ) the overall minimum value (over all α)
inf
α>0
E(R(α))=inf
α>0
(|| f −fα||+εE(|| Gα||)) (4.10)
becomes arbitrarily small, given that || fα−f||→
α→0
0 . In particular for small ε


## Page 19

inf
α≥0
E(R(α))<1
2|| f|| , (4.11)
the infimum being achieved (in α) for αsufficiently close to 0 that the first term in
(4.10) is small, while decreasing ε>0 can make the second term arbitrarily small as
well.  In fact the infimum (4.11) can be made as close to 0 as desired by making εsmall
enough, and in particular (4.11) will hold for small ε.
Combining the facts that E(R(α)) is continuous in α(Lemma 2), increases to ∞as
α→0 , and (for εsufficiently small) has a minimum below 1
2|| f||, and increases above
this value as α→∞, it follows that (for sufficiently small ε), inf
α≥0
E(R(α)) is attained for
a finite positive value of α, i.e.,
0<arginf
α≥0
E(R(α))<∞ .
That is, a finite regularization level α0 >0 achieves the minimal error || f1α−f|| .
As before, this minimal error involves a compromise between positive bias || fα−f|| in
exchange for diminished noise amplitude || Gα(q)|| .
5.  Graph Kernel regression approximation theorem
We now extend Theorem 4 (which shows when kernel regularization improves
approximation on /Rbbd ), to the regularization of perturbed functions f1(q) on networks,
again usingkernel regression.  As in Section 2, let G be a network with a scalar-valued
function f defined on its nodes.  We assume a perturbation of f given by
f1(q)= f (q)+εg(q) , where g(q) is Gaussian noise at each point in G , i.e.,
,() )~ ( 01Ngq for each qG∈ , with each ()gq independent. We wish to regularize the
noisy f1(q) by integrating it against a smoothing kernel 12 )(,Kq qα .  We assume K to be
a non-negative-valued function with the property that
Kα(q1,q2 )→
α→0
δ(q1,q2 )= 1i f q1 = q2
0o t h e r w i s e
⎧
⎨⎪
⎩⎪
monotonically, in that as α→0 , Kα(q1,q2 ) increases if q1 ≠q2 and decreases if q1 = q2 .
We also assume that this convergence to the identity kernel occurs in the same way as in
the previous section in /Rbbn ,s o
1
1(, ) 1
q
Kq qα =∑ and as α→∞, 1(, )Kq qα converges to a
fixed constant (which we assume without loss of generality is 0). We further assume
1(, )Kq qα is differentiable with respect to α.  We seek conditions parallel to those of
Theorem 2 that guarantee that regularization can help, so there is a minimum of the error
1|| ||ffα− at a finite positive regularization parameter α, intermediate between no
regularization (α=0 ) and over-regularization (α>>1).


## Page 20

Figure 1: Schematic relationship between regularization parameter α and error of approximation for a perturbed noisy
f(q)= f1(q)+εg(q) .
Theorem 5:  Let G be a graph or network, and ()fq a function on G that measured
with error, yielding the noisy function f1(q)= f (q)+εg(q) , with g(q)~ N(0,1)
independnt standard Gaussian noise defined on G . Let the regression kernel 1(, )Kq qα
converge to the identity operator (i.e., delta distribution) as above.  Then for sufficiently
small noise 0ε> , there is a positive finite regularization parameter α for which the
expected error of the kernel regression approximation 1111 1() ,) )((
G
fq f d Kq qqqαα =∑
achieves a minimum. This error is non-monotonic, decreasing for small α and
increasing for large α.
To prove this we first show:
Lemma 3.  Define the regularized functions
11
11 1 1() (, ) ( ) ; () (, )( )
qG qG
fq Kq qf q gq Kq q g qαα αα
∈∈
==∑∑ .
Then
E(|| f −f1α||2 )= f (q)−fα(q)()
q∈G
∑
2
+ε2
q1,q
∑Kα(q,q1)2.
Proof:  We have
d
dα|| gα||2= d
dαq
∑gα(q)2 =
q
∑2gα(q) d
dαgα(q)
and


## Page 21

E(|| f −f1α||2 )= E(|| f −fα−εgα||2 )= E
q∈G
∑f (q)−fα(q)−εgα(q)()
2⎡
⎣
⎢
⎢
⎤
⎦
⎥
⎥
= f (q)−fα(q)()
q∈G
∑
2
+ε2 Eg α(q)2
() (4.12)
Also,
11
2
22 2
11 1 1(( ) ) ( , ( )) ( , ( ) )
qq
ggEg q E K qq q E K qq qαα α
⎡⎤⎛⎞ ⎡ ⎤⎢⎥== ⎜⎟ ⎢⎥⎜⎟⎢⎥⎝⎠ ⎣ ⎦⎣⎦
∑∑
=
q1
∑Kα(q,q1)2 Eg (q1)2
() =
q1
∑Kα(q,q1)2
,
which increases as 0α→ , and by (4.12)
E(|| f −f1α||2 )= f (q)−fα(q)()
q∈G
∑
2
+ε2
q1,q
∑Kα(q,q1)2. (4.13)
as desired.
Proof of Theorem 5:
We will first show the error is decreasing for small
α.  If 0α> is sufficiently small, we
have by the Lemma
d
dαE(|| f −f1α||2 )= d
dα f (q)−fα(q)()
q∈G
∑
2
+ε2 d
dαq1,q
∑Kα
2 (q,q1).
= 2( f (q)−fα(q))
q∈G
∑
d
dαfα(q)+ 2ε2
q1,q
∑Kα(q,q1) d
dαKα(q,q1)
= 2( f (q)−fα(q))
q∈G
∑
d
dα Kα(q,q1)
q1
∑ f (q1)+ 2ε2
q1,q
∑Kα(q,q1) d
dαKα(q,q1)
=
q,q1∈G
∑2( f (q )−fα(q )) f (q1) d
dαKα(q,q1)+ 2ε2
q1,q
∑Kα(q,q1) d
dαKα(q,q1)
= 2
q,q1∈G
∑( f (q )−fα(q )) f (q1)+ε2 Kα(q,q1)⎡⎣ ⎤⎦
d
dαKα(q,q1)
= 2
q
∑( f (q)−fα(q)) f (q)+ε2 Kα(q,q)⎡⎣ ⎤⎦
d
dαKα(q,q)


## Page 22

+2
q1≠q
∑( f (q)−fα(q)) f (q1)+ε2 Kα(q,q1)⎡⎣ ⎤⎦
d
dαKα(q,q1)
≤2
q
∑
1
4ε2 d
dαKα(q,q)+ 2supq1≠q ( f (q)−fα(q)) f (q1)+ε2 Kα(q,q1)
q≠q1
∑
d
dαKα(q,q1)
= 1
2ε2
q
∑
d
dαKα(q,q )+ 2supq1≠q ( f (q )−fα(q)) f (q1)+ε2 Kα(q,q1)
q≠q1
∑
d
dαKα(q,q1)
= 1
2ε2 −2supq1≠q ( f (q )−fα(q)) f (q1)+ε2 Kα(q,q1)⎛
⎝⎜
⎞
⎠⎟
q
∑
d
dαKα(q,q )
⎡
⎣
⎢
⎢
⎤
⎦
⎥
⎥
< 0.
In the first inequality above (where the two sums are combined into one) we have used:
(a) (,) 0d Kq qd
α
α < since (,)Kq qα increases as 0α→ .  Thus the coefficient 1
4ε2
of the first sum on the right of the inequality needs to be less than
( f (q)−fα(q)) f (q)+ε2 Kα(q,q) for the inequality to hold.
(b) For αsmall, 1
2(,)Kq qα ≥ , and
(c) ()fq is uniformly bounded, and for α sufficiently small () ()fq f q α− is
uniformly small in q , so ( f (q)−fα(q)) f (q1) ≤ε2
4 .
(d) d
dαKα(q,q1)> 0 for 1qq≠ .
For the last equality we have used:
(a)
1
1(, ) 1
q
Kqq =∑ , so
1
1(, ) (,)
qq q
Kq q N Kq qαα
≠
=−∑∑ and
d
dα Kα
q1≠q
∑ (q,q1)=− d
dα Kα(q,q)
q
∑ with the sum on the left a double sum. Here ||NG=
is the size of the square matrix ·)(·,Kα
Finally, for the last inequality we have used:
(a) if α is sufficiently small, then the indicated supremum on the right is
arbitrarily small.
(b) (,) 0d Kq qd
α
α < .


## Page 23

Since d
dαE(|| f −f1α||2 )< 0 at 0α= , the minimum value of error occurs at 0α> , as
desired.
We now show that the above minimum occurs for a finite positive value of α(rather
than at α=∞). First note that when 0ε= , the global minimum of
E(|| f −f1α||2 )= f (q)−fα(q)()
q∈G
∑
2
+ε2
q1,q
∑Kα(q,q1)2 (4.14)
occurs at 0α= .  We will use a continuity argument to conclude that for sufficiently
small 0ε> the minimum of (4.14) is achieved at a finite α. First, for some α0 (and for
all ε≥0 ) the value of (4.14) for α>α0 is strictly greater than some 0η> .  However for
sufficiently small ε,  (4.14) is smaller than ηwhen αis close to 0. Thus for such (now
fixed) ε>0 (4.14) must achieve a minimum at some finite α≤α0 . This minimum will
not be at 0α= , since (4.14) is decreasing at 0α= .  Hence for sufficiently small 0ε>
the minimum value for (4.14) is achieved at a finite positive α, as desired.
6.  Application: smoothed gene expression
In many current applications of machine learning, noise and so-called batch effects
(originating from imprecise measurements or natural variations in measured populations)
occur in data sets to be learned.  These form a dominant problem preventing accurate
learning and application of algorithms [1, 2]. In computational biology a standard
technique for classification of tissue samples (e.g. to determine cancer subtypes) is based
on a gene expression arrays, which measure expression levels xq of genes, usually
numbering in the thousands to form a single feature vector x per tissue sample.
Variations from different methodologies, along with abovementioned variations due to
noise and batch effects in data, create difficulties at the data creation level in
implementation of learning algorithms [3-5].  Because of such problems it is often
considered adequate to have sensitivity and specificity of discriminations between two
cancer tissue subtypes at 70-80% levels.
Mathematically the ith training tissue sample yields a feature vector xi =(xi1,… , xin)
(where xiq is the expression level of gene q in sample i ) and a class yi =0or1 ,
indicating which of the two cancer subtypes the training sample represents.  This dataset
of training vectors and classes forms a dataset D={xi, yi}i=1
m .  We view feature vector
xi =(xi1,… , xin) as a function xiq = fi(q) on the feature index q . A machine learning
algorithm uses information like that in D to build a machine, a function M which can
take a novel sample’s feature vector x=(x1,… , xn) and classify its cancer subtype as
M(x)=0or1 , predicting the subtype y .  Given that measured feature vectors xi are
subject to noise, we seek to improve the vector by reducing noise, via smoothing of the
feature function fi(q) defined on the genome, based on a network structure for genes.
The gene network represents a similarity structure where genes are connected if they are


## Page 24

likely to have similar expression levels, preferably based on prior information unrelated
to the experiment producing x .  Here we use a so-called protein-protein interaction (PPI)
network [35].  In such networks genes are connected if the proteins they code interact
chemically.  Thus regularization (denoising) of the feature vector xi is accomplished by
smoothing its feature function fi(q) over this network on genes q .
This is a pre-process entirely independent of the machine M ; the regularization
process improves the input data (training data xi and the test data x ).  The network
gives prior information about a likely structure for D , providing input for regularizing
feature vectors. This pre-processing step is implemented before any training or testing
algorithms.
Such prior structural information has been used in various ways to eliminate error. In
addition to the work of Rapaport [18] mentioned in the introduction, other methods that
similarly smooth gene expression information in pre-processing have been developed.
For prediction of breast cancer metastasis, [3-5] used opportunistic averaging of gene
expression data over a protein-protein interaction gene network, selecting gene clusters
based on their empirical predictive powers in a training set. In recent work on
regularization/denoising of gene expression data, the re-interpretation of expression data
as gene signatures averaged over pathway-based gene clusters has been studied more
widely [36]
As mentioned earlier, the use of prior information (unrelated to current experimental
data) for unsupervised regularization can improve feature vectors. The regularization can
be done with prior graph or network structures on the genome (or analogous ones based
on metric rather than network-based nearnesses). Incorporating such information may
help to improve highly uncertain inference algorithms to have tolerable error levels.
We will consider two sets of gene expression microarray data from breast cancers,
and use them as machine learning inputs to predict future tumor metastasis. Formally let
{}12, ,..., nGq q q= be a set of genes whose expression levels are measured. For this
analysis we will assume each cancer has a ‘true’ underlying gene expression level f(q) ,
independent of noise, batch and methodology effects.  We will incorporate the sum of the
last three effects (which we collectively designate as ‘noise’) into a noise function η(q) .
From the measured gene expression feature vector x={xq}q=1
n (after all standard
normalizations have been performed), with corresponding ‘noisy’ feature function
f1(q)= f(q)+η(q) , we seek a regularized function f1α(q) and corresponding feature
vector for implementation of ML algorithms to distinguish metastatic ( y=1) from non-
metastatic ( y=0 ) subtypes.
For a dataset of subjects with breast cancer, consider the ith subject, and denote the
true underlying expression value for genes 1 ,, nqq… to be as () 1( ),..., ( )ii i n fq fq=f ,s o
the values form a function on G.  Thus in our model, ()ifq represents ‘true’ expression
levels of genes (expression measurements that would be obtained without the above-
mentioned collective noise).  This ideal measurement is perturbed by a deviation ηi (q)
consisting of measurement noise. Henceforth index i is omitted, and it is assumed the
expression pattern ()fq corresponds to a single subject (i.e., i is fixed).


## Page 25

Thus (again suppressing i), gene qG∈ has expression f1(q)= f (q)+η(q) with noise
η(q)=εg(q) where ()gq is standard Gaussian noise, assumed independent with
distribution (0,1)N for each q . Subject i is thus represented as feature vector
f1 = f1 q1() ,..., f1 qn()() of observed expression values. For subjects in the training group
we also know whether their cancer will metastasize, and a label y= yi = 0o r1 indicates
whether subject i belongs to the metastasis group ( y=1 indicates metastasis) . We seek
to improve prediction via denoised expression values 1tf , defined by averaging over
clusters.  This is done by taking the conditional expectation f1t (q)= Ef 1(q)|Ft⎡⎣ ⎤⎦of the
measured gene expression function f1 = f1(q) with respect to σ-fields Ft .  These σ-
fields are generated by hierarchically clustering the genome G at different levels indexed
by t .  The clustering is based on a protein-protein interaction (PPI) network on G .
Thus the conditional expectations f1t(q) are simply averaged versions of the expression
functions f(q) . More specifically, each σ-field Ft is generated by a disjoint partition
(clustering) (){} k
t
kG of the genome ()t
kkGG= ! for each value of the index t .
The conditional expectation f1t(q) of f1(q) on G under Ft can re-defined as a
function ˆf1t defined directly on the set of clusters (){} k
t
kG , so ˆf1t Gk
t()() = f1 q() Gk
t()
q∈Gk
t()
∑ ,
and ˆf1t is a piecewise averaging of the full expression function 1()fq defined on clusters
()t
kG . As mentioned, biologically we assume genes in the same cluster should have
similar expression, and thus yield more accurate values when stabilized by averaging
over each cluster. For given t this then gives an tn -dimensional vector ( tn is the number
of gene clusters at level t) containing de-noised expression values,
ˆf1t = ˆf1t G1
k()() ,..., ˆf1t Gnt
t()()() . Such de-noised features can then be used in classification
machine, in our case a support vector machine (SVM), in standard way.
PPI network Clustering
To test this approach a protein-protein interaction (PPI) network on the human genome G
is used here to identify (via graph clustering) protein subgroups that have similar or
related functions. Thus neighboring proteins and those in a cluster are assumed to be in
the same biochemical functional module, and thus to be co-expressed. We employ the
GraClus software [37] to perform the graph clustering. A series of partitions
() ()tt
kkGG= ! are then obtained for an increasing series of numbers of gene sets tn .
Combination of PPI network and Co-expression network
A disadvantage of using the PPI network to cluster genes into groups with presumably
similar expression patterns, is that such proteins, even if they function together, may in
fact not have similar expression behavior. For example, a regulatory gene that inhibits its
gene targets could exhibit a behavior which is inverse to that of its targets. Hence the


## Page 26

conditional expectation above may allow gene pairs with opposite expressions to be
averaged within the same cluster. To deal with this we can augment the above (un-
weighted) PPI network G to also incorporate information on co-expression correlations
(i.e., correlations of expression patterns of gene pairs qi and qj across different subjects
in the training data set). Specifically, an edge connecting the two genes can be weighted
by ()
22exp /ij ijwd σ=− , where ijd is a distance defined by hierarchical co-expression
clustering of training data. The proteins most likely to be clustered together on this
modified co-expression-adjusted PPI network {,}Gw do not only interact physically
(based on their adjacency in the PPI network), but also are produced by genes which are
manifestly co-expressed across patients, based on the above gene-gene correlations. The
GraClus clustering algorithm can incorporate such weights in its clustering.
Results
Datasets
We have tested our algorithm on two breast cancer datasets from high-throughput gene
expression studies by Wang, et al. [5] and van de Vijver, et al. [4] .  In both datasets we
have aimed to predict metastatic versus non-metastatic breast cancer patients based on
their prior gene expression profiles f .  The Wang dataset contains 286 breast cancer
patients, of whom 93 eventually metastasized. The van de Vijver dataset contains 295
patients, of whom 79 metastasized.
The complete datasets contain expression measures of approximately 13,000 genes
each. However in our expression feature vectors we use only genes contained in a PPI
network that we compile from two databases, Reactome [38] and iRefIndex [39] . Thus
5,747 genes are kept in the Wang dataset (having a total of 70,353 documented PPI
interactions), and 5,310 genes (with 67,342 interactions) for the van’t Vijver dataset.
Experimental Protocols
In order to test the machine learning algorithms (SVM) trained on these data, we use a 5-
fold cross-validation, in which the original datasets are divided into 5 groups (folds) of
equal size, and training of the machine classifier is done using 4 of these groups, with
testing of the classifier performance on the 5th group. Thus a machine model is trained on
the 4 folds (used as training data, in which metastasis outcomes yi are known), and then
used to score each reserved patient in the 5 th fold to predict metastasis or no metastasis.
The training and test groups are rotated through the 5 folds until all 5 groups have been
used 4 times each as training data and once as test data.  Three measures are used to
compare the performance of the above-mentioned prediction algorithms, including area
under the ROC curve (AUROC) and the area under the precision-recall curve (AUPRC).
The ROC curve is a plot of sensitivity versus specificity, while the precision-recall curve
is a plot of precision versus recall (sensitivity). Both curves assess the classification
performance by balancing the type I and type II errors. Note that in this 5-fold protocol,
the clusters are determined only by the 4 training folds, and only these clusters are used
in training and in testing.  In the case of just the PPI network, we simply build fixed
(data-independent) clusters without any cross-validation protocol, since the clustering
procedure does not use any information from the label yi .


## Page 27

Use of cluster data improves classification performance
We test the three aforementioned clustering methods on each breast cancer dataset. We
choose the numbers of clusters tn to be 64, 128, 256, 512 1024 and 2048 (so that the
above clustering parameter t takes on 6 values). The machine learning predictive
accuracies on both cancer metastasis datasets are improved compared with the same
methods using individual gene features (i.e., for which tn > 5000). For example, the area
under the precision recall curve is improved by co-expression-adjusted PPI clustering
from 36.2% to 52.4% and from 34.6% to 43.0% for the Wang and van de Vijver datasets,
respectively. Details are listed in Table 1a and Table 1b.
PPI + Expr k = 64 128 256 512 1024 2048 All Genes
AUROC 0.668(0.013) 0.691(0.015) 0. 714(0.017) 0.705(0.018) 0.724(0.021) 0.732(0.018) 0.534(0.044)
AUPRC 0.466(0.021) 0.489(0.025) 0. 511(0.029) 0.491(0.029) 0.512(0.034) 0.524(0.029) 0.362(0.032)
Table 1a : The performance of co-expression adjusted PPI ne twork clustering on Wang’s dataset. Quantities in
parentheses represent standard deviations over 100 trials (random selections of 5 folds).
PPI + Expr k = 64 128 256 512 1024 2048 All Genes
AUROC 0.690(0.015) 0.708(0.013) 0. 721(0.015) 0.715(0.018) 0.711(0.018) 0.729(0.017) 0.660(0.027)
AUPRC 0.385(0.019) 0.401(0.019) 0. 421(0.022) 0.402(0.022) 0.404(0.025) 0.430(0.027) 0.346(0.028)
Table 1b: The performance of co-expression adjusted PPI network clustering on van de Vijver’s dataset.
We observe that that as tn increases classification performance improves until an optimal
number (between 1024 and 2048) is reached, consistent with the statement of Theorem 2.
We thus average gene expressions at increasingly refined (small cluster) levels until
approaching the unaggregated individual gene expression levels, which then lowers
prediction performance. As indicated in Theorem 2, averaging over too small a gene
cluster does not sufficiently quench noise ηq() . We observe also that co-expression
adjustment improves performance (see Table 2a and Table 2b ), suggesting that such
aggregated feature vectors do the best job of quenching noise in gene expression arrays.
PPI k = 64 128 256 512 1024 2048 All Genes
AUROC 0.658(0.014) 0.680(0.015) 0. 692(0.019) 0.684(0.019) 0.708(0.019) 0.730(0.017) 0.534(0.044)
AUPRC 0.450(0.019) 0.462(0.021) 0. 475(0.026) 0.487(0.031) 0.500(0.032) 0.522(0.029) 0.362(0.032)
Table 2a: Performance of plain PPI network clustering on Wang’s dataset.
PPI k = 64 128 256 512 1024 2048 All Genes
AUROC 0.687(0.014) 0.705(0. 013) 0.689(0.016) 0.686(0.021) 0.712(0.019) 0.503(0.035) 0.660(0.027)
AUPRC 0.371(0.015) 0.399(0. 019) 0.398(0.022) 0.375(0.023) 0.403(0.026) 0.270(0.026) 0.346(0.028)
Table 2b: Performance of plain PPI network clustering on van de Vijver’s dataset.
We have also tested the performance of random clustering ( Table 3a and Table 3b), in
which genes are clustered randomly into tn clusters, independently of graph G or other
biological information. For random clustering, performance improves as well, which can
be explained by the fact that the noise ηq() can still be quenched by the smoothing over
relatively large clusters, including random ones. As expected, true underlying expression
cannot be as accurately approximated as in biology-based clustering, given randomly


## Page 28

grouped genes lack the same underlying expression behavior. As shown in Tables 3a
and 3b) , the optimal numbers of clusters for random clustering are smaller than for
meaningful (non-random) clustering.
Random k = 64 128 256 512 1024 2048 All Genes
AUROC 0.556(0.031) 0. 545(0.030) 0.600(0.032) 0.617(0.029) 0.500(0.035) 0.502(0.034) 0.534(0.044)
AUPRC 0.409(0.013) 0. 433(0.019) 0.487(0.025) 0.514(0.032) 0.341(0.026) 0.338(0.026) 0.362(0.032)
Table 3a: The performance of random clustering on Wang’s dataset.
Random k = 64 128 256 512 1024 2048 All Genes
AUROC 0.579(0.036) 0.617(0.033) 0.640(0.030) 0.627(0.033) 0.509(0.039) 0.504(0.038) 0.660(0.027)
AUPRC 0.340(0.015) 0. 381(0.017) 0.378(0.019) 0.426(0.028) 0.271(0.027) 0.272(0.023) 0.346(0.028)
Table 3b: The performance of random clustering on van de Vijver’s dataset.
Though this expression feature preprocessing method produces more accurate
classification, a strict performance assessment for this as an application in computational
biology would also compare performance of our preprocessing algorithm with un-
preprocessed performance, but including feature selection methods on both. We have
noted that the performance of regularization followed by dimensional reduction is
comparable to just dimensional reduction, using SVMRFE [40] as a feature selector.
However, to distinguish the two methodologies our feature vector regularization is fully
unsupervised, i.e., does not use (known or unknown) data classes yi .  Hence it plays a
role that is orthogonal to standard supervised feature selection methods, which depend on
knowing the classes yi of all feature vectors xi .  This unsupervised regularization
method can in particular be used either before or after supervised feature selection, or
without it.  Being only dependent on the data xi and not the classes, the regularization
method is independent of the machine M that is subsequently trained and used on the
data.  Since the method applies independently of dimensional reductions, we expect its
benefits to be supplemental to those of standard dimensional reduction methods, though
this is not the case here. The processes of unsupervised regularization and feature
selection are independent and deal with different stages of classifier-building.
Bibliography:
[1] G. Sanguinetti, M. Milo, M. Rattray, and N. D. Lawrence,
"Accounting for probe-level noise in principal component analysis of microarray
data," Bioinformatics, vol. 21, pp. 3748-3754, 2005.
[2] V. Quaranta and S. P. Garbett, "Not all noise is waste," nature
methods, vol. 7, pp. 269-272, 2010.
[3] E. Lee, H. Y. Chuang, J. W. Kim, T. Ideker, and D. Lee, "Inferring
pathway activity toward precise disease classification," PLoS Computational
Biology, vol. 4, p. e1000217, 2008.
[4] M. J. Van De Vijver, Y. D. He, L. J. van't Veer, H. Dai, A. A. M. Hart,
D. W. Voskuil, G. J. Schreiber, J. L. Peterse, C. Roberts, and M. J. Marton, "A
gene-expression signature as a predictor of survival in breast cancer," New
England Journal of Medicine, vol. 347, pp. 1999-2009, 2002.


## Page 29

[5] Y. Wang, J. G. M. Klijn, Y. Zhang, A. M. Sieuwerts, M. P. Look, F.
Yang, D. Talantov, M. Timmermans, M. E. Meijer-van Gelder, and J. Yu, "Gene-
expression profiles to predict distant metastasis of lymph-node-negative primary
breast cancer," The Lancet, vol. 365, pp. 671-679, 2005.
[6] T. Hastie, R. Tibshirani, J. Friedman, and J. Franklin, "The elements of
statistical learning: data mining, inference and prediction," The Mathematical
Intelligencer, vol. 27, pp. 83-85, 2005.
[7] V. N. Vapnik, "Statistical learning theory," 1998.
[8] P. Niyogi, F. Girosi, and T. Poggio, "Incorporating prior information
in machine learning by creating virtual examples," Proceedings of the IEEE, vol.
86, pp. 2196-2209, 1998.
[9] S. G. Chang, B. Yu, and M. Vetterli, "Adaptive wavelet thresholding
for image denoising and compression," Image Processing, IEEE Transactions on,
vol. 9, pp. 1532-1546, 2000.
[10] J.-L. Starck, E. J. Cand ®s, and D. L. Donoho, "The curvelet
transform for image denoising," Image Processing, IEEE Transactions on, vol.
11, pp. 670-684, 2002.
[11] T. F. Chan, S. Esedoglu, and M. Nikolova, "Algorithms for finding
global minimizers of image segmentation and denoising models," SIAM Journal
on Applied Mathematics, vol. 66, pp. 1632-1648, 2006.
[12] A. N. Tikhonov, "Stable methods for the summation of Fourier series,"
Soviet Math. Dokl., vol. 5, p. 4, 1964.
[13] N. M. Krukovskii, "On the Tikhonov-stable summation of Fourier
series with perturbed coefficients by some regular methods," Moscow Univ. Math.
Bull., vol. 28, p. 7, 1973.
[14] S. Kim, M. Kon, and C. DeLisi, "Pathway-based classification of
cancer subtypes," Biology Direct, vol. 7, p. 21, 2012.
[15] M. Liu, A. Liberzon, S. W. Kong, W. R. Lai, P. J. Park, I. S. Kohane,
and S. Kasif, "Network-based analysis of affected biological processes in type 2
diabetes models," PLoS genetics, vol. 3, p. e96, 2007.
[16] D. K. Hammond, P. Vandergheynst, and R. Gribonval, "Wavelets on
graphs via spectral graph theory," Applied and Computational Harmonic
Analysis, vol. 30, pp. 129-150, 2011.
[17] A. Smola and R. Kondor, "Kernels and regularization on graphs,"
Learning theory and kernel machines, pp. 144-158, 2003.
[18] F. Rapaport, A. Zinovyev, M. Dutreix, E. Barillot, and J.-P. Vert,
"Classification of microarray data using gene networks," BMC Bioinformatics,
vol. 8, p. 35, 2007.
[19] A. D. Szlam, M. Maggioni, and R. R. Coifman, "Regularization on
graphs with function-adapted diffusion processes," The Journal of Machine
Learning Research, vol. 9, pp. 1711-1739, 2008.
[20] M. Belkin and P. Niyogi, "Laplacian eigenmaps for dimensionality
reduction and data representation," Neural computation, vol. 15, pp. 1373-1396,
2003.
[21] S. Bougleux, A. Elmoataz, and M. Melkemi, "Discrete regularization
on weighted graphs for image and mesh filtering," Scale Space and Variational


## Page 30

Methods in Computer Vision, pp. 128-139, 2007.
[22] S. Sardy, A. G. Bruce, and P. Tseng, "Block coordinate relaxation
methods for nonparametric wavelet denoising," Journal of computational and
graphical statistics, vol. 9, pp. 361-379, 2000.
[23] R. R. Coifman and D. L. Donoho, "Translation-invariant de-noising,"
LECTURE NOTES IN STATISTICS-NEW YORK-SPRINGER VERLAG-, pp. 125-
125, 1995.
[24] A. Buades, B. Coll, and J. M. Morel, "A non-local algorithm for image
denoising," in Computer Vision and Pattern Recognition, 2005. CVPR 2005.
IEEE Computer Society Conference on, 2005, pp. 60-65.
[25] A. J. Smola and B. Scholkopf, "A tutorial on support vector
regression," Statistics and computing, vol. 14, pp. 199-222, 2004.
[26] S. Geman, E. Bienenstock, and R. Doursat, "Neural networks and the
bias/variance dilemma," Neural computation, vol. 4, pp. 1-58, 1992.
[27] W. Hardle, G. Kerkyacharian, D. Picard, and A. Tsybakov, Wavelets,
approximation, and statistical applications: Springer New York, 1998.
[28] F. Cucker and S. Smale, "Best choices for regularization parameters in
learning theory: On the bias-variance problem," Foundations of Computational
Mathematics, vol. 2, pp. 413-428, 2002.
[29] T. Poggio and S. Smale, "The mathematics of learning: Dealing with
data," Notices of the AMS, vol. 50, pp. 537-544, 2003.
[30] W. Feller, "Introduction to Probability Theory and Its Applications,
Vol. II POD," 1974.
[31] Y. Fan, M. Kon, S. Kim, L. Raphael, and C. DeLisi, "Regularization
techniques for machine learning on graphs and networks with biological
applications," Communications in Mathematical Analysis, vol. 8, pp. 136-145,
2010.
[32] Y. Fan, S. Kim, M. Kon, L. Raphael, and C. DeLisi, "Smoothing gene
expression using biological networks," Machine Learning and Applications, vol.
9, pp. 540-545, 2010.
[33] R. Graham, D. Knuth, and O. Patashnik, "Answer to problem 9.60 in
concrete mathematics: A foundation for computer science," ed: Reading, MA:
Addison-Wesley, 1994.
[34] H. Holden, B. ksendal, J. Ub e, and T. Zhang, Stochastic
partial differential equations: a modeling, white noise functional approach :
Birkhauser Boston Inc., 1996.
[35] J.-F. o. Rual, K. Venkatesan, T. Hao, T. Hirozane-Kishikawa, A. l.
Dricot, N. Li, G. F. Berriz, F. D. Gibbons, M. Dreze, and N. Ayivi-
Guedehoussou, "Towards a proteome-scale map of the human protein‚Äìprotein
interaction network," Nature, vol. 437, pp. 1173-1178, 2005.
[36] C. J. Vaske, S. C. Benz, J. Z. Sanborn, D. Earl, C. Szeto, J. Zhu, D.
Haussler, and J. M. Stuart, "Inference of patient-specific pathway activities from
multi-dimensional cancer genomics data using PARADIGM," Bioinformatics,
vol. 26, pp. i237-i245, 2010.
[37] I. S. Dhillon, Y. Guan, and B. Kulis, "Weighted graph cuts without
eigenvectors a multilevel approach," Pattern Analysis and Machine Intelligence,


## Page 31

IEEE Transactions on, vol. 29, pp. 1944-1957, 2007.
[38] G. Joshi-Tope, M. Gillespie, I. Vastrik, P. D'Eustachio, E. Schmidt, B.
de Bono, B. Jassal, G. Gopinath, G. Wu, and L. Matthews, "Reactome: a
knowledgebase of biological pathways," Nucleic Acids Research, vol. 33, pp.
D428-D432, 2005.
[39] S. Razick, G. Magklaras, and I. M. Donaldson, "iRefIndex: a
consolidated protein interaction database with provenance," BMC Bioinformatics,
vol. 9, p. 405, 2008.
[40] I. Guyon and A. Elisseeff, "An introduction to variable and feature
selection," The Journal of Machine Learning Research, vol. 3, pp. 1157-1182,
2003.
