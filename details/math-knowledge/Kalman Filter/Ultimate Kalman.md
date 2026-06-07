# UltimateKalman: Flexible Kalman Filtering and Smoothing Using Orthogonal Transformations

Converted from: `Kalman Filter\Ultimate Kalman.pdf`


## Page 1

UltimateKalman: Flexible Kalman Filtering and
Smoothing Using Orthogonal Transformations
Sivan Toledo
Blavatnik School of Computer Science, Tel A viv University
August 30, 2024
Abstract
UltimateKalman is a flexible linear Kalman filter and smoother implemented in
three popular programming languages: MATLAB, C, and Java. UltimateKalman
is a slight simplification and slight generalization of an elegant Kalman filter and
smoother that was proposed in 1977 by Paige and Saunders. Their algorithm
appears to be numerically superior and more flexible than other Kalman filters
and smoothers, but curiously has never been implemented or used before. Ulti-
mateKalman is flexible: it can easily handle time-dependent problems, problems
with state vectors whose dimensions vary from step to step, problems with varying
number of observations in different steps (or no observations at all in some steps),
and problems in which the expectation of the initial state is unknown. The program-
ming interface of UltimateKalman is broken into simple building blocks that can be
used to construct filters, single or multi-step predictors, multi-step or whole-track
smoothers, and combinations. The paper describes the algorithm and its implemen-
tation as well as a test suite of examples and tests.
1 Introduction
The invention of the Kalman filter by Rudolf E. Kálmán in 1960 (Kalman, 1960) is con-
sidered one of the major inventions of the 20th century. The filter efficiently and incre-
mentally tracks the hidden state of a linear discrete dynamic system; each state estimate
uses all the observations of the system up to that point in time. The filter can also predict
future states and with suitable adaptations, can handle nonlinear dynamic systems and
smooth entire state trajectories. The literature on Kalman filters and their applications is
vast and the importance of Kalman filters is beyond doubt. We mention a few relatively
recent and relatively comprehensive sources (Brown and Hwang, 1997; Grewal and An-
drews, 2015; Humpherys et al., 2012), but there are numerous other authoritative sources
on Kalman filtering.
Twelve years later, Duncan and Horn discovered that mathematically, the Kalman
filter computes the solution to a generalized linear least squares problem (Duncan and
Horn, 1972). Algorithmically and numerically, however, the Kalman filter algorithm is far
from state-of-the art algorithms for linear least squares problems. In particular, it does
not use orthogonal factorizations, which were invented and published in the 1950s (Givens,
1954; Householder, 1958).
1
arXiv:2207.13526v3  [math.NA]  29 Aug 2024


## Page 2

Numerically, the most stable algorithms for least squares minimization are based on
orthogonal transformations, and more specifically on the QR factorization, the singular-
value decomposition, or their variants (Björck, 1996; Golub and Loan, 2013; Higham,
2002). Kalman filter algorithms are not, and many of them, including Kálmán’s original
algorithm, are based on algebraic building blocks, like explicit matrix inversion, that are
prone to instability.
In 1977, Paige and Saunders discovered and published an elegant Kalman filter algo-
rithm based on orthogonal transformations (Paige and Saunders, 1977). Their algorithm
is a specialized QR factorization and it can easily implement filtering, prediction, and
smoothing.
Strangely, the Paige-Saunders algorithm appears to have had very limited impact, even
though it was about as efficient as other Kalman filters and smoothers and was claimed
to be more numerically stable. Their paper was not cited much, nobody approached the
authors to discuss it (Saunders, 2018), and to the best of our knowledge, it was never
implemented (Paige and Saunders’ paper describes the algorithm and analyzes it, but
does not mention an implementation).
The present paper and the software that it describes, called UltimateKalman, aim to
make the algorithm widely available and to highlight its advantages over other Kalman
filtering and smoothing algorithms. Indeed, the Paige and Saunders algorithm is more
flexiblethanotherKalmanalgorithmsintwoimportantsenses. First, unlikeotherKalman
filters, it does not need to know the expectation of the initial state of the system. Second,
it can be easily generalized to handle quantities that are added or dropped from the state
vector. These features make modeling easier, as we demonstrate with concrete examples
in Sections 5.4 and 5.5. The algorithm can also easily handle problems with a varying
number of observations and with missing observations, and it can both filter and smooth.
Many other Kalman filter algorithms lack these two characteristics, but some do posses
them, so they are not completely unique.
UltimateKalman is not completely identical to the Paige-Saunders algorithm, but
rather a variant that is simpler and more general at the same time. We explain later in the
paper the differences from the original algorithm, but at the same time acknowledge that
all the fundamental algorithmic ideas in UltimateKalman come from the Paige-Saunders
algorithm and paper.
Our implementation is split into a collection of easy-to-understand building blocks
from which a user can compose a variety of Kalman-based computations, including filters,
predictors, and smoothers, and combinations of these.
The implementation is available in three popular programming languages: MATLAB,
Java, and C.
The rest of the paper is organized as follows. Section 2 provides background material
on discrete linear dynamic systems and Kalman filters and smoothers. Section 3 describes
the details of UltimateKalman. Section 4 presents our implementations of the algorithm,
and Section 5 describes a suite of examples and tests that come with UltimateKalman,
demonstrate its correctness, and show how to use it in various cases, some nontrivial. We
discuss the algorithm and the software and our conclusions from this project in Section 6.
This paper does not directly compare UltimateKalman to other Kalman filtering al-
gorithms and does not prove its correctness and its numerical properties; the paper by
Paige and Saunders addresses these issues thoroughly, and the analyses there are equally
applicable to UltimateKalman (Paige and Saunders, 1977).
2


## Page 3

2 Background
The discrete Kalman filter is a method to efficiently estimate the state of a discrete linear
dynamic system from indirect observations. UltimateKalman can handle more general
cases than Kalman filters, so we describe here the more general version.
2.1 Discrete linear dynamic systems
The instantaneous state of a discrete dynamic system at timeti is represented by anni-
dimensionalstate vectorui ∈ Rni. We assume thatui satisfies a recurrence that we refer to
as anevolution equationand possibly another equation that we refer to as anobservation
equation. Note that we do not require all the states to have the same dimension, although
the uniform-dimension case is very common. The evolution equation has the form
Hiui = Fiui−1 + ci + ϵi , (1)
where Hi ∈ Rℓi×ni and Fi ∈ Rℓi×ni−1 are known full-rank matrices,ci ∈ Rℓi is a known
vector, called acontrol vector, that represents external forces acting on the system, and
ϵi is an unknown noise or error vector. The control vector is often assumed to be the
product of a known matrix and a known vector, but this is irrelevant for the Kalman
filter. The noise or error vectorϵi admits state vectors that do not satisfy the equation
Hiui = Fiui−1 + ci exactly. The matrixHi is often assumed to be the identity matrix, but
we do not require this (and do not require it to be square). WhenHi and Fi are square
and full-rank, ui is a function of ui−1 and ci up to the error term. Obviously, the first
state u0 that we model is not defined by an evolution recurrence.
Some of the state vectorsui (but perhaps not all) also satisfy anobservation equation
of the form
oi = Giui + δi , (2)
where Gi ∈ Rmi×ni is a known full-rank matrix,oi ∈ Rmi is a known vector of observations
(measurements), andδi represents unknown measurement errors or noise. The dimension
mi of the observation ofui can vary; it can be smaller thanni (including zero, meaning
that there are no observations ofui), equal toni, or greater thanni.
We can write all of the evolution and observation equations up to stepk as a single
large block-matrix equation,


o0
c1
o1
c2
...
...
ck
ok


=


G0
−F1 H1
G1
−F2 H2
... ...
... ...
−Fk Hk
Gk




u0
u1
u2
...
uk−1
uk


+


δ0
ϵ1
δ1
ϵ2
...
...
ϵk
δk


. (3)
We denote this system byb = Au + e. The matrix A and the vectorb are known. The
noise or error termse are not known, but we assume that they are small. Our task is to
estimate u from A and b.
3


## Page 4

If e is random, has zero expectationE(e) = 0, and has a known nonsingular covariance
matrix cov(e) = E(eeT ) with cov(e)−1 = U T U, where U is square then the solutionˆu of
the generalized least squaresproblem
ˆu = arg min
u
∥U (Au − b)∥2
2 (4)
=

AT U T U A
−1
AT U T U b
is the so-called best linear unbiased estimator (BLUE) ofu (Aitken, 1936). If we add the
assumption that e has a Gaussian (normal) distribution, then the same minimizer is also
the maximum-likelihood estimator ofu. (In this paper, capital letters and small letters
denote unrelated objects; in this paragraph, for example,E denotes the expectation and
e denotes an error or noise vector.)
If the structure of theGis, Fis, and His guarantees that the rank ofA always equals
the number of columns, the system is calledobservable. This guarantees that (4) has a
unique solution. We use this term also in a more concrete sense: we say that a matrix
or a block of a matrix isobservable if its rank equals its column dimension. We also use
the termsflat to describe a rectangular matrix or block with more columns than rows (a
flat matrix cannot be observable) andtall to describe a rectangular matrix or block with
more rows than columns.
Because our goal is to estimate the states of adynamic system, we also denote the
linear system (3) byb(k) = A(k)u(k) + e(k), to provide a notation for the matrixA and for
the right-hand b at a particular stepk. Similarly, we denotecov(e(k))−1 = (U (k))T U (k).
2.2 Kalman filters and smoothers
Kalman filters and smoothers are a large family of efficient algorithms for solving prob-
lem (4) for some of theˆuks when cov(e) is block diagonal with known blocks,
cov(e) =


C0
K1
C1
...
Kk
Ck


.
That is, we assume that the matrices
Ki = cov ( ϵi) = E

ϵiϵT
i

Ci = cov ( δi) = E

δiδT
i

are known and that the offdiagonal blocks ofcov(e) are all zero:
E

ϵiδT
j

= 0 for all i and j
E

ϵiϵT
j

= 0 for i ̸= j
E

δiδT
j

= 0 for i ̸= j .
Most Kalman filtering and smoothing algorithms make additional assumptions. For ex-
ample, many Kalman filters assume thatG0 = I, which is equivalent to assuming that
4


## Page 5

the expectation of u0 is known., UltimateKalman also makes an additional assumption:
that all theCis and all theKis are nonsingular.
The generalized least-squares solution of Equation (3) estimates all the state vectors
u1, . . . , uk using all the observations up to and including stepk. We denote the vectors
that make up this solution by 

ˆu0|k
ˆu1|k
...
ˆuk|k

 . (5)
The vectorˆuk|k is called thefilteredestimate at stepk. This estimate uses all the available
observations of present and past states, but not of any future state. Vectorsˆu0|k, . . . ,ˆuk−1|k
are step-k smoothed estimates; they use observations of past, present, and future states.
We can hope to compute filtered estimates almost in real time, whereas smoothed esti-
mates can only be computed after a time lag. If we extend system (3) with one or more
block rows and columns that represent only evolution equations, the new vector compo-
nents of the solutions arepredicted estimates. For example, if we add a block row and a
block column that contain−Fk+1, Hk+1, and ck+1, but not Gk+1 and not ok+1, the last
vector in the solution, denoted ˆuk+1|k, is a prediction of uk+1 from the information we
have up to stepk. We can obviously continue to predict into the future by adding more
evolution equations.
Kalman filters are efficient incremental algorithms that produce filtered and predicted
estimates. Given Hk, Fk, Gk, ck, ok, Ck, Kk, and the compact data structure that
was used to estimateˆuk−1|k−1, Kalman filters quickly computeˆuk|k and update the data
structure (Brown and Hwang, 1997; Grewal and Andrews, 2015; Humpherys et al., 2012;
Kalman, 1960). The data structure itself is of sizeΘ((nk−1 + nk)2) and the number of
operations required isO((nk−1 + mk + nk)3).
3 UltimateKalman and its heritage
This section describes the UltimateKalman algorithm. The algorithm is a slight sim-
plification of the algorithm of Paige and Saunders (Paige and Saunders, 1977) in that
UltimateKalman uses block orthogonal transformations whereas the algorithm of Paige
and Saunders uses Givens rotations. The algorithm is also a generalization of the algo-
rithm of Paige and Saunders in that we allow the user to specifyHi and we allow the
dimension of the state vector to change from step to step.
3.1 A specialized QR factorization
UltimateKalman computes estimates of the state vectors using a thin QR factorization of
the weighted matrix
5


## Page 6

U (k)A(k) =


W0G0
−V1F1 V1H1
W1G1
−V2F2 V2H2
... ...
... ...
−VkFk VkHk
WkGk


, (6)
where W T
i Wi = C −1
i and V T
i Vi = K −1
i . The factorization is computed using a series of
orthonormal transformations that are applied to block rows to reduceU (k)A(k) to a block
upper triangular form:
R(k) =

Q(k)T
U (k)A(k)
,
where
R(k) =


R0,0 R0,1
R1,1 R1,2
R2,2 R2,3
... ...
Rk−1,k−1 Rk−1,k
˜Rk,k


. (7)
The diagonal blocksRi,i are normally square and upper triangular, but are also allowed
to be rectangular with more columns than rows. The superdiagonal blocksRi−1,i are not
identically zero. The same series of transformations is applied to the weighted right-hand
side vector
U (k)b(k) =


W0o0
V1c1
W1o1
V2c2
...
...
Vkck
Wkok


. (8)
We denote the transformed right-hand side byy(k) =

Q(k)T
U (k)b(k)
.
The transformations are discarded immediately after they are applied to the matrix
and vector; no representation ofQ(k) is stored.
3.2 Observability
Many Kalman algorithms rely on the assumption thatA is observable, which guarantees
that all the diagonal blocksRi,i, as well as ˜Rk,k, are square and upper triangular. For
example, assuming thatG0 is square or tall (or is the identity) and that theFis andHis are
square, along with the standard assumption that all of them have full rank, guarantees
that A is observable. When all the diagonal blocks are square and triangular, we can
compute the estimates using back substitution, starting fromˆuk|k and ending withˆu0|k.
6


## Page 7

However, UltimateKalman works and can provide useful estimates even whenA is not
always observable, and even when it is never observable. We explain the different cases
in terms of the structure of theR factor and their meaning to the user.
If ˜Rk,k is flat but all the otherRi,i blocks are square and triangular, the system isnot
yet observable, but it may become observable in a future state. We currently do not have
enough observations to estimate any of the states. As the system evolves and additional
observations are made, the system may become observable, allowing us to estimate the
states that are currently unobservable.
If for some i < k the diagonal block Ri,i is flat, then states u0, . . . , ui are not ob-
servable and will never become observable. For any assignment of statesui+1 and up,
there is a nontrivial space of equally good (in the sense of (4)) estimates foru0, . . . , ui.
UltimateKalman tolerates this situation because even in this case, the observations of
u0, . . . , ui do provide useful information on future states.
If a state is not observable (or not yet observable), the method in UltimateKalman
that returns an estimate of the state vector return a vector consisting ofNaN values (not-
a-number, a floating point value that indicates that a value is not available). This informs
client code that the state is not observable.
3.3 The Paige-Saunders factorization algorithm
UltimateKalman uses the technique of the Paige-Saunders algorithm to produce R(k)
incrementally.
Step k starts by adding to R(k−1) a block row and a block column that express an
evolution equation, 

... ...
Rk−2,k−2 Rk−2,k−1
˜Rk−1,k−1
−VkFk VkHk

 .
We now examine the block  ˜Rk−1,k−1
−VkFk

. (9)
If this block is flat (or more generally, if its rank is smaller thannk, which implies that
it can be orthogonally reduced to a flat block), the algorithm leaves the bottom2-by-2
block as is, but treats it as a1-by-2 block matrix

Rk−1,k−1 Rk−1,k−1

, with the same
column partitioning. This allows the algorithm to handle all shapes of (9) in a uniform
way. That is, we rename the blocks as

Rk−1,k−1 Rk−1,k−1

=
 ˜Rk−1,k−1
−VkFk VkHk

.
Otherwise, the algorithm computes a QR factorization of (9), uses the resultingR factor
as Rk−1,k−1, and applies the orthonormal transformation to the last block column and to
the right-hand sidey. This transforms theR factor into


... ...
Rk−2,k−2 Rk−2,k−1
Rk−1,k−1 Rk−1,k
¯Rk,k

 .
7


## Page 8

Block row k − 1 is nowsealed; it will not change any more. If˜Rk−1,k−1 was square,
then so is Rk−1,k−1. If ˜Rk−1,k−1 was flat, then Rk−1,k−1 might be either square or flat,
depending on VkFk.
The bottom right block ¯Rk,k is not upper triangular, and it might be completely
missing if (9) is square or flat. If¯Rk,k is square or tall and we now need to predictˆuk|k−1
(and perhaps additional future states), we compute the QR factorization of¯Rk,k and apply
the transformation toy. We denote theR factor of ¯Rk,k by ˇRk,k.
If there are no observations ofuk, then ˜Rk,k = ˇRk,k (or ˜Rk,k = ¯Rk,k if ¯Rk,k is flat or
missing) and we are done with stepk.
If there are observations in stepk, we add another block row to theR factor:


... ...
Rk−2,k−2 Rk−2,k−1
Rk−1,k−1 Rk−1,k
¯Rk,k
WkGk


.
If we computed ˇRk,k, in principle we can use it instead of¯Rk,k, but there is usually no
significant benefit to this. If the block
 ¯Rk,k
WkGk

is flat, it becomes˜Rk,k and we are done. Otherwise we compute the QR factorization of
this block, use theR factor as ˜Rk,k, and apply the transformation toy.
We now have R(k) and y(k). Note that we have not used in this step block rows
1, . . . , k− 2 of R(k−1) and y(k−1).
3.4 Forgetting and rolling back
Given R(k) and y(k), theestimates ˆui|k arecomputedbybacksubstitution, fromthebottom
up.
Therefore, if we need only filtered estimatesˆuk|k, we only need the last sealed block
row, row k − 1, and the incomplete block rows of step k. If we also need smoothed
estimates but only for time stepi + 1 and higher, we need to store block rowsi + 1 and
higher, but not earlier rows.
Dropping old rows that would not be used for smoothing in the future saves memory.
UltimateKalman allows the user toforget the rows of steps≤ i from R(k) and y(k).
Smoothing uses R(k) but does not modify it. UltimateKalman also retainsy(k) when
smoothing. This allows the algorithm to smooth again later if more observations are
obtained, enabling easy implementation of strategies such asfixed-lag smoothing(Grewal
and Andrews, 2015), in which each state is estimated once from past observations and
from observations of the nextn steps for some fixed lagn.
In many cases it is useful to predict future states before any observations of them are
available. In particular, by comparing the expectation of the observations of a predicted
state Gkˆuk|k−1 with the actual observation vectorok it is sometimes possible to detect and
discard outlier observations.
UltimateKalman allows the user to predict future states while retaining the ability
to provide observations later. To do so, UltimateKalman stores with sealed rows the
8


## Page 9

incomplete diagonal block ¯Rk,k and the associated right-hand side ¯yi. If the user later
asks UltimateKalman toroll back to step k, the algorithm discards from memory sealed
rows k and higher and restores¯Rk,k and ¯yi as the bottommost incomplete row. Obviously,
it is not possible to roll back to a forgotten step.
3.5 Computing the covariance matrices of estimates
UltimateKalman computes representations of the covariance matricescov(ˆui|k) of esti-
mates using orthogonal transformations ofR(k). We assume here that˜Rk,k is square and
triangular (otherwise existing steps are not yet observable).
The covariance matrix of the filtered estimate satisfies
cov(ˆuk|k)−1 = ˜RT
k,k ˜Rk,k ,
so UltimateKalman simply returns˜Rk,k as a representation ofcov(ˆuk|k). We refer to this
as aninverse-factor representation.
Producing inverse-factor representations of smoothed estimates requires a series of
orthogonal transformations. The algorithm first computes the QR factorization of the
bottom-right 2-by-1 block of
R(k) =


... ...
Rk−2,k−2 Rk−2,k−1
Rk−1,k−1 Rk−1,k
˜Rk,k


and applies the transformation to the entire two bottom block rows, to produce


... ...
Rk−2,k−2 Rk−2,k−1
Sk−1,k−1 Sk−1,k
Sk,k−1 0


with Sk,k−1 square. This block satisfies
cov(ˆuk−1|k)−1 = ST
k,k−1Sk,k−1 ,
so it is returned as a representation of the covariance matrix. The algorithm now permutes
the last two block rows to obtain


... ...
Rk−2,k−2 Rk−2,k−1
Sk,k−1 0
Sk−1,k−1 Sk−1,k


and continues in the same way. The process continues with the QR factorization of
 Rk−2,k−1
Sk,k−1

,
repeating the same procedure. The correctness of this algorithm is shown in (Paige and
Saunders, 1977) and in a perhaps slightly clearer way, in (Toledo, 2020).
The computation proceeds upwards inR(k) and can produce the covariance matrices
of all the steps that have not been forgotten.
9


## Page 10

4 Implementation
UltimateKalman is currently available in MATLAB, C, and Java. This section describes
the main features of the implementations, but not their details. A user guide that is dis-
tributed together with the source code of the library explains the programming interfaces
of the library and how to build it, how to build test programs, and how to run these tests.
Each implementation is separate and does not rely on the others. The implementation
includes MATLAB adapter classes that allow invocation of the C and Java implementa-
tions from MATLAB and from GNU Octave, a free open-source MATLAB-like environ-
ment. This allows a single set of test functions to test all three implementations. The
code also includes standalone demonstration programs in Java and C, to show users how
to use the library without MATLAB.
The MATLAB implementation does not rely on any MATLAB toolbox, only on func-
tionality that is part of the core product. The implementation also works under GNU
Octave. The C implementation relies on basic matrix and vector operations from the
BLAS (Dongarra et al., 1990b,a) and on the QR and Cholesky factorizations from LA-
PACK (Anderson et al., 1999). The Java implementation uses the Apache Commons
Math library for both basic matrix-vector operations and for the QR and Cholesky fac-
torizations.
4.1 Programming interface
All three versions implement a data type that encapsulates the state of a Kalman filter
or smoother. The operations on the data type areevolve, which describes an evolution
equation (Equation (1) together with the associated covariance matrix Ki), observe,
which describes an observation equation (Equation (2) andCi), estimate, which returns
an estimated state vector ˆui and its covariance matrix, smooth, which performs back
substitution to compute smoothed estimates, and forget and rollback, described in
Section 3.4.
The MATLAB and Java implementations use overloading (using the same method
name more than once, with different argument lists) to express variants of these opera-
tions, while the C implementation usesNULL to express missing or default values. The
estimate method returns two values in the MATLAB implementation, the estimated
vector and its covariance matrix, but only the estimated vector in the Java and C imple-
mentations. The covariance matrix is returned in these implementations by a separate
method, covariance. These design decisions reflect good programming practices in each
programming language.
4.2 The representation of vectors and matrices
The MATLAB implementation uses native MATLAB matrices and vectors. The Java
implementation uses the typesRealMatrix and RealVector from the Apache Commons
Math library (both are interface types with multiple implementations).
The C implementation defines a type calledmatrix_t to represent matrices and vec-
tors. The implementation defines functions that implement basic operations of matrices
and vectors of this type. The type is implemented using a structure that contains a
pointer to an array of double-precision elements, which are stored columnwise as in the
BLAS and LAPACK, and integers that describe the number of rows and columns in
the matrix and the stride along rows (the so-called leading dimension in the BLAS and
10


## Page 11

LAPACK interfaces). To avoid name-space pollution, in client code this type is called
kalman_matrix_t.
State vectors are not always observable. This topic is explained in Section 3.2 in the
companion article. This situation usually arises when there are not enough observations
to estimate the state. The function calls and methods that return estimates of state
vectors and the covariance matrices of the estimates return in such cases a vector ofNaNs
(not-a-number, a floating point value that indicates that the value is not available) and a
diagonal matrix whose diagonal elements areNaN.
4.3 The representation of covariance matrices
Like all Kalman filters, UltimateKalman consumes covariance matrices that describe the
distribution of the error terms and produces covariance matrices that describe the uncer-
tainty in the state estimatesˆui. The input covariance matrices are not used explicitly;
instead, the inverse factor W of a covariance matrixC = ( W T W )−1 is multiplied, not
necessarily explicitly, by matrices or by a vector.
The programming interface of UltimateKalman expects input covariance matricesCi
and Ki to be represented as objects belonging to a type with a method weigh that
multiplies the factor Wi such that Ci = ( W T
i Wi)−1 by a matrix A or a vector v. In
the MATLAB and Java implementations, this type is calledCovarianceMatrix. The
constructors of these classes accept many representations of a covariance matrix:
• An explicit covariance matrix C; the constructor computes an upper triangular
Cholesky factorU of C = U T U and implementsX=C.weigh(A) by solvingU X = A.
• An inverse factorW such thatW T W = C −1; this factor is stored and multiplied by
the argument ofweigh.
• An inverse covariance matrixC −1; the constructor computes its Cholesky factoriza-
tion and stores the lower-triangular factor asW.
• A diagonal covariance matrix represented by a vectorw such that W = diag(w)
(the elements ofw are inverses of standard deviations).
• A few other, less important, variants.
UltimateKalman always returns the covariance matrix of an estimated state vectorˆui as
an upper-triangular inverse factorWi. The MATLAB and Java implementations return
covariance matrices as objects of theCovarianceMatrix type (always with an inverse-
factor representation); the C implementation simply returns the inverse factor as a matrix.
5 Examples and tests
We implemented an extensive set of tests for UltimateKalman. The individual tests
are implemented by several MATLAB functions. Most of the functions receive as a first
argument a handle to a function that serves as a factory of UltimateKalman filters. These
functions are invoked by a top-level function calledreplication that defines the factory
function and performs the tests. The factory function can produce objects of either
the MATLAB implementation or objects of adapter classes that invoke the C or Java
implementation.
11


## Page 12

-1 -0.5 0 0.5 1
-1
-0.5
0
0.5
1
-1 -0.5 0 0.5 1
-1
-0.5
0
0.5
1
Figure 1: Kalman filtering, prediction, and smoothing of the trajectory of a rotating point
in the plane. On the leftG = I and observations are indicated by red dots. The yellow
curve represents a simulated system; the blue curve represents filtered estimates, the cyan
whole-trajectory smoothed estimates, and the green predictions from one observation.
On the rightG =

1 0

; we cannot predict the state from one such observation, and we
cannot produce a filtered estimate of the first state.
Thefunctionthatperformsperformancetestingisalittledifferent: itincludesafactory
function and it can test multiple implementations, to enable plotting their performance
on one graph.
The tests generate graphs similar to the ones presented below. The user can inspect
the output visually, to ensure that the results are similar to those presented here. The
tests do not produce pass/fail flags.
The tests were run on a laptop with an Intel quad-core 14nm i7-8565U processor
running Windows 11 using MATLAB version R2021b. We also verified that the MATLAB
implementation works correctly under GNU Octave. The C version is compiled into a
MATLAB-callable dynamic link library (a so-calledmex file) by MATLAB itself using a
script, compile.m. In our tests, MATLAB used the C compiler from Microsoft’s Visual
Studio 2019. The Java version is compiled using Eclipse so that it can be used by Java 1.8
and up (this is the version that MATLAB R2021b uses) and is packaged into ajar file
by a simple shell script,build.bat.
5.1 Basic tests
We demonstrate and test the basic features of UltimateKalman using a simple model of
a point in the plane that rotates around the origin. The initial state is

1 0
T
. The
evolution matrix is
F =
 cos(α) − sin(α)
sin(α) cos( α)

for α = 2π/16, the observation matrixG has between 1 and 6 rows, with an identity in
the first two rows,K = 0.0012I and C = 0.12I. With these parameters, the rotation is
very accurate, but the observations are not. The system is simulated for16 steps, just
short of a complete rotation.
12


## Page 13

Figure 1 shows the results of simulation, predicting, filtering, and smoothing with
G = I and with G =

1 0

. The code, called rotation, first simulates the system and
produces the ground-truth u1, . . . , u15 and the observations o0, . . . , o15. Then the code
creates an UltimateKalman filter and runs it for 16 steps while providing only the first
observation o0. This attempts to predictu1, . . . , u15. Then the code rolls back to step 1
and runs the filter again, providing all the observations. Finally, the code smooths the
trajectory and collects the smoothed observations.
The first observation in the case ofG = I is quite inaccurate, so predictions from it are
far from the real track, but they do follow nicely the system dynamics of exact rotation.
The filtered estimates, on the other hand, improve quickly. The smooth estimates are
nearly perfect, at least visually.
When G =

1 0

the block ¯R0,0 is flat, so the algorithm fails to produce a filtered
estimate of u0, but it does produce filtered estimates ofu1, . . . , u15.
This example is also used to test the code with overdeterminedGs.
5.2 Variance variations
The next example demonstrates and tests the evaluation of covariance matrices, and it
also demonstrates the effectiveness of Kalman filtering even when the model of the system
is not perfect.
The code simulates a scalar that evolves either according toui = ui−1 + ϵi with ϵ1 ∼
N(0, 1) (the errors are distributed normally with expectation0 and standard deviation
1) or according toui = ui−1 + 0.2. However, even in the latter case, the Kalman filter
uses the ui = ui−1 + ϵi evolution equations, which do not reflect the true dynamics of the
system. The observations are direct,oi = ui + δi, with δi having a standard deviation of
10 in almost all cases.
Figure 2 shows results for the caseui = ui−1+0.2. The graphs show both the estimates
and their standard deviations. We see that the variance of the filtered estimates drops
quickly in the first few steps and then stabilizes. If the standard deviation ofo50 is much
smaller than the rest,0.25, the variance of the filtered estimate also drops at that step, but
it climbs back up. The variance of the smoothed estimates is impacted in both directions
around step 50. It also increases towards iteration0 and 100, but not dramatically.
All the estimates track the trajectory nicely, even though the Kalman filter and
smoother use evolution equations that are different from those of the actual dynamic
system. This is an important reason that Kalman filtering is so useful in practice: it often
works well even when it models the dynamic system only approximately.
The results for a simulation withui = ui−1 + ϵi are similar and not shown in the paper.
5.3 Adding and removing parameters
The add_remove example shows how to add and remove parameters from the state vector.
In the first two steps, the filter tracks the constant1 using the evolution equationui =
ui−1 + ϵi and observation equationoi = ui + δi with both error terms having a standard
deviation of0.1. In the third step, we add a dimension to the state; the first argument to
evolve is now2. This causes UltimateKalman to construct and use a matrix
Hi =

1 0

,
which represents a normal evolution of the first component of the state while not using
any historical information about the second, new component. The evolution matrixF2
13


## Page 14

0 20 40 60 80 100step
-40
-30
-20
-10
0
10
20
30
40
0 20 40 60 80 100step
-20
-10
0
10
20
30
40
0 20 40 60 80 100step
-40
-30
-20
-10
0
10
20
30
40
0 20 40 60 80 100step
-20
-10
0
10
20
30
40
Figure 2: Kalman filtering and smoothing of a scalar trajectory. The yellow lines show
the actual trajectory, the red dots show the observations, the blue lines show the filtered
estimates (left column), the cyan lines show smoothed estimates (right column), and the
gray areas represent values that are±3ˆσi from the estimateˆui, where ˆσi is the estimated
standard deviation ofˆui. In the top row, the standard deviation ofδi is always10; in the
bottom row, it drops down to0.25 at iteration 50 and then goes back up to10.
14


## Page 15

0 0.5 1 1.5 2 2.5 3 3.5
#104
-5000
0
5000
10000
15000
20000
1.2 1.3 1.4 1.5 1.6 1.7
#104
1.6
1.62
1.64
1.66
1.68
1.7
1.72
1.74
1.76
1.78
1.8
#104
Figure 3: Kalman filtering and smoothing of the trajectory of a projectile affected by
gravity and drag. Again, the yellow line show the actual trajectory, the red dots show
the observations, the blue line shows the filtered estimates of the trajectory, and the cyan
line shows the smoothed estimates. Smoothing was performed on the entire trajectory, to
estimate the point of departure and the point where the projectile hits the ground. The
graph on the left shows the entire trajectory and the graph on the right only the part in
which observations are available.
remains a 1-by-1 identity in this step, but G2 is now a 2-by-2 identity; o2 becomes 2-
dimensional as well. The actual value of the second parameter is2 and the observations
reflect that. In the next iteration, F3 grows to 2-by-2. After two iterations with a 2-
dimensional state vector, we drop the first (original) component of the state vector by
calling evolve with a first argument1 and by providing an explicit matrix
H4 =
 0
1

.
This matrix causes the filter to retain the second component of the state and to drop the
first. In this step F4 remains 2-by-2 but G4 is 1-by-1. In the next iteration F5 shrinks
back to a1-by-1 identity.
This demonstrates how to handle addition and removal of parameters and tests that
UltimateKalman handles these cases correctly. The evolution and observation equations
are very simple and track the two parameters separately, but this is immaterial for the
addition and removal procedures.
5.4 A Projectile problem
ThenextexamplethatweconsideristakenalmostasisfromHumpherysetal.(Humpherys
et al., 2012). The problem uses a linear dynamic system to model a projectile. The states
are four-dimensional; they model the horizontal and vertical displacements and the hor-
izontal and vertical velocities. The model accounts for gravity, reducing the vertical
velocity by a constant every time step, and for drag, which scales both components of the
15


## Page 16

0 50 100 150 200 250time (s)
-2
-1.5
-1
-0.5
0
0.5
1
1.5
2
relative offset (s)
#10-6
Figure 4: Kalman tracking of the relative offsets of three clocks from times of arrival of
radio packets. The graphs show the relative offsets relative to the offset of the first clock.
The yellow lines are the simulated offsets and the blue lines are the filtered estimates.
velocity by a constant in every step. The matrices and vectors associated with the system
are
Fi = F =


1 0 ∆ t 0
0 1 0 ∆ t
0 0 1 − b 0
0 0 0 1 − b

 and ci = c =


0
0
0
−9.8∆t


Gi = G =
 1 0 0 0
0 1 0 0

,
where ∆t = 0.1 and b = 10−4. The example in (Humpherys et al., 2012) invites the reader
to simulate the dynamic system for 1200 steps of0.1s each, starting from a known state,
to generate noisy observations of the displacements (not the velocities) in steps 400 to
600, and to estimate the trajectory using a Kalman filter. They also ask the reader to use
the filter to predict when and where the projectile will fall back to its original altitude,
and to estimate the point of departure by reversing the dynamic system.
We have successfully applied UltimateKalman to this problem. The example code,
projectile, generated the plots in Figure 3, which are similar to Figures 7.1a and 7.1b
in (Humpherys et al., 2012). (It seems that the measurement noise shown in their Fig-
ure 7.1b has variance larger than the value 500 specified in (Humpherys et al., 2012).)
UltimateKalman also allows the user to easily extrapolate the trajectory by evolving
the filter without providing additional observations, and to estimate the point of departure
by smoothing time steps 0 to 600. Reversing the dynamic system is not required (and in
particular, it is not necessary to invert the evolution matrix).
5.5 Clock offsets in a distributed system
The clock_offsets example highlights the utility of the Hi matrices. The aim is to
estimate the relative offsets of a set of clocks in a distributed system. Each clock is
16


## Page 17

associated with a receiver and we assume that at timeτ, clock j shows tj = τ + fij
where fij is the offset of clockj from real time at the time in which it displays the value
tj. The receivers receive radio packets from a beacon transmitter. The locations of the
transmitter and receivers are known, so the line-of-sight propagation delaysdj between
the transmitter and receiverj are also known. The receivers estimate the time of arrival
of the packets using their local imperfect clocks. The observation equation for the time
of arrival of packeti at receiver j is
tij = τi + dj + fij + δij ,
where tij is the time-of-arrival estimate, as represented by imperfect clockj, τi is the
unknown time of departure of theith packet,fij is the offset of clockj at (local) timetij,
dj is the known delay to receiverj, and δij is the time-of-arrival estimation error.
The evolution equations are very simple:
fij = fi−1,j + ϵij .
They express the belief that the offsets change slowly. Note that the number of evolution
equations is equal to the number of clocks, so is smaller than the dimension of the state
vectors by one. The code uses the following matrices and vectors, including an explicit
fixed Hi:


1 0 0 0 0
0 1 0 0 0
...
0 0 0 1 0




fi1
fi2
...
fim
τi


=


1 0 0 0 0
0 1 0 0 0
...
0 0 0 1 0




fi−1,1
fi−1,2
...
fi−1,m
τi−1


+


ϵi1
ϵi2
...
ϵ1ℓ

 ,


ti1 − d1
ti2 − d2
...
tim − dm

 =


1 0 · · · 0 1
0 1 · · · 0 1
...
0 0 · · · 1 1




fi−1,1
fi−1,2
...
fi−1,m
τi−1


+


δi1
δi2
...
δiℓ

 .
The structure ofHi and Fi reflects the removal ofτi−1 and the introduction ofτi in every
step.
The problem as presented up to now is clearly rank-deficient, because the residual
is invariant under an addition of a constantT to all the offsets and a subtraction ofT
from all the depsarture times. Nothing anchors the solution relative to absolute time;
indeed, we only want to estimate the relative offsets. To address this issue, we add a
pseudo-observation of one offset in the first step. This removes the rank-deficiency.
This model can be easily extended to allow for packets that are not received by all
receivers, for multiple transmitters, for slowly-changing rate-errors instead of slowly-
changing offsets, and so on. The model can also allow receivers to join and leave the
system without restarting the estimation process, as we have done in Section 5.3.
The results are shown in Figure 4.
5.6 Performance testing
Figure 5 shows the result of testing the performance of the three implementations using
their perftest method. The experiments were carried out on a laptop with an Intel i7
17


## Page 18

0 2 4 6 8step #104
0
0.02
0.04
0.06
0.08
0.1
0.12
0.14time (ms)
n = 6
MATLABJavaC
0 2 4 6 8step #104
0
0.5
1
1.5
2
2.5
3time (ms)
n = 48
MATLABJavaC
Figure 5: Performance testing of the three UltimateKalman implementations. The graphs
show the time per step (window averages of nonoverlapping groups of steps) when the
algorithm filtered systems with random square unitary matricesFi and Gi.
processor. The test uses two random square unitary matrices F and G, sets Fi = F
and Gi = G, uses identities for Ci and Ki, ci = 0, and a random Gaussian vector for
oi. The matrices Hi are identities created by the algorithm itself; they are not passed as
arguments. The use of unitary matrices avoids overflows and underflows.
The graphs in Figure 5 show the average runtimes per step, averaged over groups of
1000 steps.
The results show that on small problems (ni = 6), the C implementation is the fastest,
filtering taking about 8 µs per step. The Java implementation is about a factor of two
slower, with periodic jumps that are most likely caused by the garbage collector. The
MATLAB implementation is much slower, taking about140 µs per step. Both the Java
and MATLAB implementations are initially even slower, probably due to just-in-time
compilation of the code.
On larger problems (ni = 48), the C implementation is still the fastest. The MAT-
LAB implementation is now only about two times slower than the C implementation.
The improved ratio is most likely the result ofΘ(n3) dense-matrix operations (matrix
multiplications and QR factorizations) taking a significant fraction of the running times.
The data structure and method invocation overheads in C are much smaller than in
MATLAB, but dense-matrix operations are performed at the same rate. On these larger
problems, the Java implementation is the slowest, most likely because of the relative poor
performance of the Apache Commons Math library relative to the BLAS and LAPACK
implementations that come with MATLAB.
Some of the changes in the runtimes that are visible in some of the plots are likely due
to the computer, a laptop, slowing down to avoid overheating.
Smoothing takes more time per step, due to the back substitution phase, and perhaps
more importantly, a lot more memory, because the code retains the blocks ofR and the
transformed b. Still, the library can smooth very long sequences. On the same computer
we were able to smooth 5 million steps withni = mi = 6 in about 96 s and100, 000 steps
with ni = mi = 48 in 84 s. Both runs required less than 16GB of memory.
18


## Page 19

6 Discussion
Orthogonal transformations are the bedrock of numerical linear algebra. The numeri-
cal stability of algorithms that rely solely or mostly on orthogonal transformations is
often both superior and easier to analyze than the stability of algorithms that use non-
orthogonal transformations or explicit matrix inversion. From this standpoint, the fact
that the Paige-Saunders algorithm did not become the standard linear Kalman filter and
smoother is both puzzling and unfortunate. There is no good reason not to use it.
UltimateKalman aims to rectify this defect. It is a simplified version of the Paige-
Saunders algorithm that is easier to implement, hopefully also easier to understand, and is
probably just as efficient. UltimateKalman also generalizes the Paige-Saunders algorithm,
making it more flexible. While there are certainly many high-quality and well-documented
Kalman filter implementations, for example (Torres, 2010; Tusell, 2011), we are not aware
of any other linear Kalman filter algorithm that is as flexible and that can handle problems
with varying state-vector dimensions, does not require the expectation of the initial state,
can handle missing observations, and can easily filter, predict, and smooth.
The Paige-Saunders algorithm does have two limitations that UltimateKalman in-
herits. First, it assumes that the covariance matrices Ci and Ki are all nonsingular.
Traditional Kalman filters can cope with singular covariance matrices. However, this is
not a significant limitation, since physical observations are always associated with some
level of uncertainty, and physical evolution equations usually are too. Continuous evolu-
tion equations can be exact, with no uncertainty (e.g., equations of motion), but discrete
evolution equations have at least discretization (truncation) error terms. Even contin-
uous evolution equations sometimes suffer from uncertainty due to incomplete physical
modeling (e.g., a missing or simplified drag term). Second, the algorithm is almost com-
pletely sequential, except for parallelism within the matrix operations that are carried
out in each step. In real-time filtering applications, this limitation is meaningless, as the
application is inherently sequential. However, in post-processing applications the ability
to use many cores to reduce runtimes could be beneficial; the Paige-Saunders algorithm
and UltimateKalman lack this ability.
The MATLAB implementation has been optimized for clarity and conciseness, not
for computational efficiency. In particular, the sequence of steps in memory is repre-
sented by a dynamically-resized cell array. We made this design choice in order to make
UltimateKalman easy to port to other languages and easy to specialize.
The C implementation was optimized for computational and memory efficiency while
retaining full generality (e.g., it can handle changes in the dimension of the state vector,
and it can smooth, like the other implementations) and without a specialized memory
manager. The main cost of these design decisions is the dynamic allocation and deal-
location of several matrices in every step. Specializing the algorithm to simple special
cases, say only filtering and no changes in the state-vector dimension, would have allowed
the algorithm to avoid dynamic memory allocation, making it faster and perhaps better
suited to tiny embedded systems.
We hope that the numerical robustness afforded by the use of orthogonal transforma-
tions, the flexibility, the convenient programming interfaces, and the availability of the
algorithm in multiple languages will make UltimateKalman the standard linear Kalman
filter and smoother in new software. We also hope that authors and maintainers of sta-
tistical software packages of wider scope (Peng and Aston, 2011; Villegas and Pedregal,
2018), which often include nonlinear Kalman filters and other state-space models, will
19


## Page 20

incorporate UltimateKalman into their packages, ideally exposing some of the unique fea-
tures through their own programming and user interfaces. Finally, we hope that authors
of code generators that automatically generate Kalman filter code optimized for specific
cases (Whittle and Schumann, 2004) will also incorporate the algorithm into their gener-
ators. The code clarity that we strived to achieve should simplify such efforts, as well as
efforts to implement the algorithm in additional programming languages that are widely
used for numerical computing like Python and Julia.
Acknowledgements
This research was supported in part by grant 1919/19 from the Israel Science Foundation
and by a grant from the Israeli Ministry of Science and Technology..
References
A. C. Aitken. 1936. On Least Squares and Linear Combinations of Observations.Pro-
ceedings of the Royal Society of Edinburgh55 (1936), 42–48. https://doi.org/10.
1017/S0370164600014346
E. Anderson, Z. Bai, C. Bischof, S. Blackford, J. Demmel J. Dongarra, J. Du Croz, A.
Greenbaum, S. Hammarling, A. McKenney, and D. Sorensen. 1999.LAPACK Users’
Guide (3rd ed.). SIAM, Philadelphia, PA, USA.
Åke Björck. 1996.Numerical Methods for Least Squares Problems. SIAM, Philadelphia,
PA, USA. xvii+408 pages.
Robert Grover Brown and Patrick Y. C. Hwang. 1997.Introduction to Random Signals
and Applied Kalman Filtering(3rd ed.). Wiley.
J. J. Dongarra, Jeremy Du Cruz, Sven Hammarling, and I. S. Duff. 1990a. Algorithm
679: A Set of Level 3 Basic Linear Algebra Subprograms: Model Implementation and
Test Programs.ACM Trans. Math. Software16, 1 (1990), 18–28.https://doi.org/
10.1145/77626.77627
J. J. Dongarra, Jeremy Du Cruz, Sven Hammarling, and I. S. Duff. 1990b. A Set of Level
3 Basic Linear Algebra Subprograms.ACM Trans. Math. Software16, 1 (1990), 1–17.
https://doi.org/10.1145/77626.79170
D. B. Duncan and S. D. Horn. 1972. Linear Dynamic Recursive Estimation from the
Viewpoint of Regression Analysis. J. Amer. Statist. Assoc.67, 340 (1972), 815–821.
https://doi.org/10.1080/01621459.1972.10481299
Wallace Givens. 1954. Numerical Computation of the Characteristic Values of a Real
Symmetric Matrix. Technical Report 1574. Oak Ridge National Laboratory. https:
//doi.org/10.2172/4412175
Gene H. Golub and Charles F. Van Loan. 2013.Matrix Computations (4th ed.). Johns
Hopkins University Press. xxi+756 pages.
20


## Page 21

Mohinder S. Grewal and Angus P. Andrews. 2015.Kalman Filtering: Theory and Practice
with MATLAB(4th ed.). Wiley.
Nicholas J. Higham. 2002. Accuracy and Stability of Numerical Algorithms(2nd ed.).
SIAM, Philadelphia, PA, USA. xxx+680 pages.
Alston S. Householder. 1958. Unitary Triangularization of a Nonsymmetric Matrix.J.
ACM 5, 4 (1958), 339–342.https://doi.org/10.1145/320941.320947
Jeffrey Humpherys, Preston Redd, and Jeremy West. 2012. A Fresh Look at the Kalman
Filter. SIAM Rev.54, 4 (2012), 801–823.https://doi.org/10.1137/100799666
R. E. Kalman. 1960. A New Approach to Linear Filtering and Prediction Problems.
Journal of Basic Engineering 82, 1 (1960), 35–45. https://doi.org/10.1115/1.
3662552
ChristopherC.PaigeandMichaelA.Saunders.1977. LeastSquaresEstimationofDiscrete
Linear Dynamic Systems Using Orthogonal Transformations.SIAM J. Numer. Anal.
14, 2 (1977), 180–193.https://doi.org/10.1137/0714012
Jyh-Ying Peng and John A. D. Aston. 2011. The State Space Models Toolbox for MAT-
LAB. Journal of Statistical Software41, 6 (2011), 1–26.https://doi.org/10.18637/
jss.v041.i06
Michael Saunders. 2018. Private Communication. email.
Sivan Toledo. 2020.Location Estimation from the Ground Up. SIAM, Philadelphia, PA.
https://doi.org/10.1137/1.9781611976298
Germán A. Torres. 2010. Algorithm 900: A Discrete Time Kalman Filter Package for
Large Scale Problems. ACM Transactions on Mathemathical Software37, 1 (2010),
11:1–11:16. https://doi.org/10.1145/1644001.1644012
Fernando Tusell. 2011. Kalman Filtering in R.Journal of Statistical Software39, 2 (2011),
1–27. https://doi.org/10.18637/jss.v039.i02
Marco A. Villegas and Diego J. Pedregal. 2018. SSpace: A Toolbox for State Space
Modeling. Journal of Statistical Software87, 5 (2018), 1–26.https://doi.org/10.
18637/jss.v087.i05
Jon Whittle and Johann Schumann. 2004. Automating the Implementation of Kalman
Filter Algorithms. ACM Transactions on Mathemathical Software30, 4 (2004), 434–
453. https://doi.org/10.1145/1039813.1039816
21
