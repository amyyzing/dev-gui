# The Multivariate Gaussian Distribution Chuong B. Do

Converted from: `Probability\Multivariate Gaussian.pdf`


## Page 1

The Multivariate Gaussian Distribution
Chuong B. Do
October 10, 2008
A vector-valued random variable X =
[
X1 · · · Xn
] T
is said to have a multivariate
normal (or Gaussian) distribution with mean µ ∈ Rn and covariance matrix Σ ∈ Sn
++
1
if its probability density function 2 is given by
p(x; µ, Σ) = 1
(2π)n/2|Σ|1/2 exp
(
− 1
2(x − µ)T Σ−1(x − µ)
)
.
We write this as X ∼ N (µ, Σ). In these notes, we describe multivariate Gaussians and some
of their basic properties.
1 Relationship to univariate Gaussians
Recall that the density function of a univariate normal (or Gaussian) distribution is
given by
p(x; µ, σ2) = 1
√
2πσ exp
(
− 1
2σ2 (x − µ)2
)
.
Here, the argument of the exponential function, − 1
2σ2 (x − µ)2, is a quadratic function of the
variable x. Furthermore, the parabola points downwards, as the coeﬃcie nt of the quadratic
term is negative. The coeﬃcient in front, 1√
2πσ , is a constant that does not depend on x;
hence, we can think of it as simply a “normalization factor” use d to ensure that
1√
2πσ
∫ ∞
−∞
exp
(
− 1
2σ2 (x − µ)2
)
= 1.
1Recall from the section notes on linear algebra that Sn
++ is the space of symmetric positive deﬁnite n × n
matrices, deﬁned as
Sn
++ =
{
A ∈ Rn×n : A = AT and xT Ax > 0 for all x ∈ Rn such that x ̸= 0
}
.
2In these notes, we use the notation p(•) to denote density functions, instead of fX (•) (as in the section
notes on probability theory).
1


## Page 2

0 1 2 3 4 5 6 7 8 9 10
0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
0.8
0.9
−10
−5
0
5
10
−10
−5
0
5
10
0
0.005
0.01
0.015
0.02
Figure 1: The ﬁgure on the left shows a univariate Gaussian densit y for a single variable X.
The ﬁgure on the right shows a multivariate Gaussian density over two variables X1 and X2.
In the case of the multivariate Gaussian density, the argument of the exponential function,
− 1
2(x − µ)T Σ−1(x − µ), is a quadratic form in the vector variable x. Since Σ is positive
deﬁnite, and since the inverse of any positive deﬁnite matrix is also positive deﬁnite, then
for any non-zero vector z, zT Σ−1z > 0. This implies that for any vector x ̸= µ,
(x − µ)T Σ−1(x − µ) > 0
− 1
2(x − µ)T Σ−1(x − µ) < 0.
Like in the univariate case, you can think of the argument of th e exponential function as
being a downward opening quadratic bowl. The coeﬃcient in fr ont (i.e., 1
(2π)n/2|Σ|1/2 ) has an
even more complicated form than in the univariate case. Howeve r, it still does not depend
on x, and hence it is again simply a normalization factor used to ensu re that
1
(2π)n/2|Σ|1/2
∫ ∞
−∞
∫ ∞
−∞
· · ·
∫ ∞
−∞
exp
(
− 1
2(x − µ)T Σ−1(x − µ)
)
dx1dx2 · · ·dxn = 1.
2 The covariance matrix
The concept of the covariance matrix is vital to understanding multivariate Gaussian
distributions. Recall that for a pair of random variables X and Y , their covariance is
deﬁned as
Cov [X, Y ] = E[(X − E[X])(Y − E[Y ])] = E[XY ] − E[X]E[Y ].
When working with multiple variables, the covariance matrix provides a succinct way to
summarize the covariances of all pairs of variables. In partic ular, the covariance matrix,
which we usually denote as Σ, is the n × n matrix whose ( i, j)th entry is Cov [Xi, Xj].
2


## Page 3

The following proposition (whose proof is provided in the Appen dix A.1) gives an alter-
native way to characterize the covariance matrix of a random vector X:
Proposition 1. For any random vector X with mean µ and covariance matrix Σ,
Σ = E[(X − µ)(X − µ)T ] = E[XX T ] − µµT . (1)
In the deﬁnition of multivariate Gaussians, we required that th e covariance matrix Σ
be symmetric positive deﬁnite (i.e., Σ ∈ Sn
++). Why does this restriction exist? As seen
in the following proposition, the covariance matrix of any random vector must always be
symmetric positive semideﬁnite:
Proposition 2. Suppose that Σ is the covariance matrix corresponding to some random
vector X. Then Σ is symmetric positive semideﬁnite.
Proof. The symmetry of Σ follows immediately from its deﬁnition. Next , for any vector
z ∈ Rn, observe that
zT Σz =
n∑
i=1
n∑
j=1
(Σijzizj) (2)
=
n∑
i=1
n∑
j=1
(Cov [Xi, Xj] · zizj)
=
n∑
i=1
n∑
j=1
(E[(Xi − E[Xi])(Xj − E[Xj])] · zizj)
= E
[ n∑
i=1
n∑
j=1
(Xi − E[Xi])(Xj − E[Xj]) · zizj
]
. (3)
Here, (2) follows from the formula for expanding a quadratic f orm (see section notes on linear
algebra), and (3) follows by linearity of expectations (see p robability notes).
To complete the proof, observe that the quantity inside the bra ckets is of the form∑
i
∑
j xixjzizj = ( xT z)2 ≥ 0 (see problem set #1). Therefore, the quantity inside the
expectation is always nonnegative, and hence the expectati on itself must be nonnegative.
We conclude that zT Σz ≥ 0.
From the above proposition it follows that Σ must be symmetric po sitive semideﬁnite in
order for it to be a valid covariance matrix. However, in order for Σ−1 to exist (as required in
the deﬁnition of the multivariate Gaussian density), then Σ must be invertible and hence full
rank. Since any full rank symmetric positive semideﬁnite matri x is necessarily symmetric
positive deﬁnite, it follows that Σ must be symmetric positive de ﬁnite.
3


## Page 4

3 The diagonal covariance matrix case
To get an intuition for what a multivariate Gaussian is, consider the simple case where n = 2,
and where the covariance matrix Σ is diagonal, i.e.,
x =
[ x1
x2
]
µ =
[ µ1
µ2
]
Σ =
[ σ2
1 0
0 σ2
2
]
In this case, the multivariate Gaussian density has the form,
p(x; µ, Σ) = 1
2π
⏐
⏐
⏐
⏐
σ2
1 0
0 σ2
2
⏐
⏐
⏐
⏐
1/2 exp
(
− 1
2
[ x1 − µ1
x2 − µ2
] T [ σ2
1 0
0 σ2
2
] −1 [ x1 − µ1
x2 − µ2
] )
= 1
2π(σ2
1 · σ2
2 − 0 · 0)1/2 exp
(
− 1
2
[ x1 − µ1
x2 − µ2
] T [ 1
σ2
1
0
0 1
σ2
2
] [ x1 − µ1
x2 − µ2
] )
,
where we have relied on the explicit formula for the determin ant of a 2 × 2 matrix 3, and the
fact that the inverse of a diagonal matrix is simply found by tak ing the reciprocal of each
diagonal entry. Continuing,
p(x; µ, Σ) = 1
2πσ1σ2
exp
(
− 1
2
[ x1 − µ1
x2 − µ2
] T [ 1
σ2
1
(x1 − µ1)
1
σ2
2
(x2 − µ2)
])
= 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1 − µ1)2 − 1
2σ2
2
(x2 − µ2)2
)
= 1√
2πσ1
exp
(
− 1
2σ2
1
(x1 − µ1)2
)
· 1√
2πσ2
exp
(
− 1
2σ2
2
(x2 − µ2)2
)
.
The last equation we recognize to simply be the product of two in dependent Gaussian den-
sities, one with mean µ1 and variance σ2
1, and the other with mean µ2 and variance σ2
2.
More generally, one can show that an n-dimensional Gaussian with mean µ ∈ Rn and
diagonal covariance matrix Σ = diag( σ2
1, σ2
2, . . . , σ2
n) is the same as a collection of n indepen-
dent Gaussian random variables with mean µi and variance σ2
i , respectively.
4 Isocontours
Another way to understand a multivariate Gaussian conceptually is to understand the shape
of its isocontours. For a function f : R2 → R, an isocontour is a set of the form
{
x ∈ R2 : f (x) = c
}
.
for some c ∈ R.4
3Namely,
⏐
⏐
⏐
⏐
a b
c d
⏐
⏐
⏐
⏐ = ad − bc.
4Isocontours are often also known as level curves. More generally, a level set of a function f : Rn → R,
is a set of the form
{
x ∈ R2 : f (x) = c
}
for some c ∈ R.
4


## Page 5

4.1 Shape of isocontours
What do the isocontours of a multivariate Gaussian look like? As b efore, let’s consider the
case where n = 2, and Σ is diagonal, i.e.,
x =
[ x1
x2
]
µ =
[ µ1
µ2
]
Σ =
[ σ2
1 0
0 σ2
2
]
As we showed in the last section,
p(x; µ, Σ) = 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1 − µ1)2 − 1
2σ2
2
(x2 − µ2)2
)
. (4)
Now, let’s consider the level set consisting of all points where p(x; µ, Σ) = c for some constant
c ∈ R. In particular, consider the set of all x1, x2 ∈ R such that
c = 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1 − µ1)2 − 1
2σ2
2
(x2 − µ2)2
)
2πcσ1σ2 = exp
(
− 1
2σ2
1
(x1 − µ1)2 − 1
2σ2
2
(x2 − µ2)2
)
log(2πcσ1σ2) = − 1
2σ2
1
(x1 − µ1)2 − 1
2σ2
2
(x2 − µ2)2
log
( 1
2πcσ1σ2
)
= 1
2σ2
1
(x1 − µ1)2 + 1
2σ2
2
(x2 − µ2)2
1 = (x1 − µ1)2
2σ2
1 log
(
1
2πcσ1σ2
) + (x2 − µ2)2
2σ2
2 log
(
1
2πcσ1σ2
) .
Deﬁning
r1 =
√
2σ2
1 log
( 1
2πcσ1σ2
)
r2 =
√
2σ2
2 log
( 1
2πcσ1σ2
)
,
it follows that
1 =
( x1 − µ1
r1
) 2
+
( x2 − µ2
r2
) 2
. (5)
Equation (5) should be familiar to you from high school analyti c geometry: it is the equation
of an axis-aligned ellipse , with center ( µ1, µ2), where the x1 axis has length 2 r1 and the
x2 axis has length 2 r2!
4.2 Length of axes
To get a better understanding of how the shape of the level curve s vary as a function of
the variances of the multivariate Gaussian distribution, suppo se that we are interested in
5


## Page 6

−6 −4 −2 0 2 4 6 8 10 12
−6
−4
−2
0
2
4
6
8
−4 −2 0 2 4 6 8 10
−4
−2
0
2
4
6
8
Figure 2:
The ﬁgure on the left shows a heatmap indicating values of the d ensity function for an
axis-aligned multivariate Gaussian with mean µ =
[ 3
2
]
and diagonal covariance matrix Σ =
[ 25 0
0 9
]
. Notice that the Gaussian is centered at (3 , 2), and that the isocontours are all
elliptically shaped with major/minor axis lengths in a 5:3 ra tio. The ﬁgure on the right
shows a heatmap indicating values of the density function for a non axis-aligned multivariate
Gaussian with mean µ =
[ 3
2
]
and covariance matrix Σ =
[ 10 5
5 5
]
. Here, the ellipses are
again centered at (3 , 2), but now the major and minor axes have been rotated via a lin ear
transformation.
6


## Page 7

the values of r1 and r2 at which c is equal to a fraction 1 /e of the peak height of Gaussian
density.
First, observe that maximum of Equation (4) occurs where x1 = µ1 and x2 = µ2. Substi-
tuting these values into Equation (4), we see that the peak heig ht of the Gaussian density
is 1
2πσ1σ2
.
Second, we substitute c = 1
e
(
1
2πσ1σ2
)
into the equations for r1 and r2 to obtain
r1 =




√
2σ2
1 log

 1
2πσ1σ2 · 1
e
(
1
2πσ1σ2
)

 = σ1
√
2
r2 =




√
2σ2
2 log

 1
2πσ1σ2 · 1
e
(
1
2πσ1σ2
)

 = σ2
√
2.
From this, it follows that the axis length needed to reach a fra ction 1/e of the peak height of
the Gaussian density in the ith dimension grows in proportion to the standard deviation σi.
Intuitively, this again makes sense: the smaller the variance o f some random variable xi, the
more “tightly” peaked the Gaussian distribution in that dimensi on, and hence the smaller
the radius ri.
4.3 Non-diagonal case, higher dimensions
Clearly, the above derivations rely on the assumption that Σ is a diagonal matrix. However,
in the non-diagonal case, it turns out that the picture is not a ll that diﬀerent. Instead
of being an axis-aligned ellipse, the isocontours turn out to be simply rotated ellipses .
Furthermore, in the n-dimensional case, the level sets form geometrical structures k nown as
ellipsoids in Rn.
5 Linear transformation interpretation
In the last few sections, we focused primarily on providing an int uition for how multivariate
Gaussians with diagonal covariance matrices behaved. In part icular, we found that an n-
dimensional multivariate Gaussian with diagonal covariance m atrix could be viewed simply
as a collection of n independent Gaussian-distributed random variables with mean s and vari-
ances µi and σ2
i , respectvely. In this section, we dig a little deeper and provi de a quantitative
interpretation of multivariate Gaussians when the covarianc e matrix is not diagonal.
The key result of this section is the following theorem (see proo f in Appendix A.2).
Theorem 1. Let X ∼ N (µ, Σ) for some µ ∈ Rn and Σ ∈ Sn
++. Then, there exists a matrix
B ∈ Rn×n such that if we deﬁne Z = B−1(X − µ), then Z ∼ N (0, I).
7


## Page 8

To understand the meaning of this theorem, note that if Z ∼ N (0, I), then using the
analysis from Section 4, Z can be thought of as a collection of n independent standard normal
random variables (i.e., Zi ∼ N (0, 1)). Furthermore, if Z = B−1(X − µ) then X = BZ + µ
follows from simple algebra.
Consequently, the theorem states that any random variable X with a multivariate Gaus-
sian distribution can be interpreted as the result of applying a linear transformation ( X =
BZ + µ) to some collection of n independent standard normal random variables ( Z).
8


## Page 9

Appendix A.1
Proof. We prove the ﬁrst of the two equalities in (1); the proof of the o ther equality is similar.
Σ =



Cov [X1, X1] · · · Cov [X1, Xn]
.
.
. . . . .
.
.
Cov [Xn, X1] · · · Cov [Xn, Xn]



=



E[(X1 − µ1)2] · · · E[(X1 − µ1)(Xn − µn)]
.
.
. . . . .
.
.
E[(Xn − µn)(X1 − µ1)] · · · E[(Xn − µn)2]



= E



(X1 − µ1)2 · · · (X1 − µ1)(Xn − µn)
.
.
. . . . .
.
.
(Xn − µn)(X1 − µ1) · · · (Xn − µn)2


 (6)
= E






X1 − µ1
.
.
.
Xn − µn



[
X1 − µ1 · · · Xn − µn
]


 (7)
= E
[
(X − µ)(X − µ)T ]
.
Here, (6) follows from the fact that the expectation of a matri x is simply the matrix found
by taking the componentwise expectation of each entry. Also, (7 ) follows from the fact that
for any vector z ∈ Rn,
zz T =





z1
z2
.
.
.
zn





[
z1 z2 · · ·zn
]
=





z1z1 z1z2 · · · z1zn
z2z1 z2z2 · · · z2zn
.
.
. .
.
. . . . .
.
.
znz1 znz2 · · · znzn




 .
Appendix A.2
We restate the theorem below:
Theorem 1. Let X ∼ N (µ, Σ) for some µ ∈ Rn and Σ ∈ Sn
++. Then, there exists a matrix
B ∈ Rn×n such that if we deﬁne Z = B−1(X − µ), then Z ∼ N (0, I).
The derivation of this theorem requires some advanced linear algebra and probability
theory and can be skipped for the purposes of this class. Our argum ent will consist of two
parts. First, we will show that the covariance matrix Σ can be fac torized as Σ = BB T
for some invertible matrix B. Second, we will perform a “change-of-variable” from X to a
diﬀerent vector valued random variable Z using the relation Z = B−1(X − µ).
9


## Page 10

Step 1: Factorizing the covariance matrix. Recall the following two properties of
symmetric matrices from the notes on linear algebra 5:
1. Any real symmetric matrix A ∈ Rn×n can always be represented as A = U ΛU T , where
U is a full rank orthogonal matrix containing of the eigenvect ors of A as its columns,
and Λ is a diagonal matrix containing A’s eigenvalues.
2. If A is symmetric positive deﬁnite, all its eigenvalues are positiv e.
Since the covariance matrix Σ is positive deﬁnite, using the ﬁr st fact, we can write Σ = U ΛU T
for some appropriately deﬁned matrices U and Λ. Using the second fact, we can deﬁne
Λ1/2 ∈ Rn×n to be the diagonal matrix whose entries are the square roots of t he corresponding
entries from Λ. Since Λ = Λ 1/2(Λ1/2)T , we have
Σ = U ΛU T = U Λ1/2(Λ1/2)T U T = U Λ1/2(U Λ1/2)T = BB T ,
where B = U Λ1/2.6 In this case, then Σ −1 = B−T B−1, so we can rewrite the standard
formula for the density of a multivariate Gaussian as
p(x; µ, Σ) = 1
(2π)n/2|BB T |1/2 exp
(
− 1
2(x − µ)T B−T B−1(x − µ)
)
. (8)
Step 2: Change of variables. Now, deﬁne the vector-valued random variable Z =
B−1(X − µ). A basic formula of probability theory, which we did not intr oduce in the section
notes on probability theory, is the “change-of-variables” f ormula for relating vector-valued
random variables:
Suppose that X =
[
X1 · · · Xn
] T
∈ Rn is a vector-valued random variable with
joint density function fX : Rn → R. If Z = H(X) ∈ Rn where H is a bijective,
diﬀerentiable function, then Z has joint density fZ : Rn → R, where
fZ(z) = fX(x) ·
⏐
⏐
⏐
⏐
⏐
⏐
⏐
det






∂x1
∂z1
· · · ∂x1
∂zn
.
.
. . . . .
.
.
∂xn
∂z1
· · · ∂xn
∂zn






⏐
⏐
⏐
⏐
⏐
⏐
⏐
.
Using the change-of-variable formula, one can show (after some a lgebra, which we’ll skip)
that the vector variable Z has the following joint density:
pZ(z) = 1
(2π)n/2 exp
(
− 1
2zT z
)
. (9)
The claim follows immediately. □
5See section on “Eigenvalues and Eigenvectors of Symmetric Matrices.”
6To show that B is invertible, it suﬃces to observe that U is an invertible matrix, and right-multiplying
U by a diagonal matrix (with no zero diagonal entries) will rescale its columns but will not change its rank.
10
