# Numerical Methods for Partial Differential Equations

Converted from: `Numerical Methods\Numerical PDEs.pdf`


## Page 1

Numerical Methods for Partial
Differential Equations
Seongjai Kim
Department of Mathematics and Statistics
Mississippi State University
Mississippi State, MS 39762 USA
Email: skim@math.msstate.edu
December 11, 2023


## Page 2

Seongjai Kim, Department of Mathematics and Statistics, Mississippi State
University, Mississippi State, MS 39762-5921 USA Email: skim@math.msstate.edu.
The work of the author is supported in part by NSF grant DMS-1228337.


## Page 3

Prologue
In the area of “Numerical Methods for Differential Equations", it seems very
hard to ﬁnd a textbook incorporating mathematical, physical, and engineer-
ing issues of numerical methods in a synergistic fashion. So the ﬁrst goal of
this lecture note is to provide students a convenient textbook that addresses
both physical and mathematical aspects of numerical methods for partial dif-
ferential equations (PDEs).
In solving PDEs numerically, the following are essential to consider:
• physical laws governing the differential equations (physical understand-
ing),
• stability/accuracy analysis of numerical methods (mathematical under-
standing),
• issues/difﬁculties in realistic applications, and
• implementation techniques (efﬁciency of human efforts).
In organizing the lecture note, I am indebted by Ferziger and Peric [23], John-
son [32], Strikwerda [64], and Varga [68], among others. Currently the lecture
note is not fully grown up; other useful techniques would be soon incorporated.
Any questions, suggestions, comments will be deeply appreciated.
3


## Page 4

4


## Page 5

Contents
Title 2
Prologue 3
Table of Contents 9
1 Mathematical Preliminaries 1
1.1. Taylor’s Theorem & Polynomial Fitting . . . . . . . . . . . . . . . . . . . . . . . 2
1.2. Finite Differences . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.2.1. Uniformly spaced grids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.2.2. General grids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.3. Overview of PDEs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
1.4. Difference Equations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
1.5. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
2 Numerical Methods for ODEs 31
2.1. Taylor-Series Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
2.1.1. The Euler method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
2.1.2. Higher-order Taylor methods . . . . . . . . . . . . . . . . . . . . . . . . . 37
2.2. Runge-Kutta Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
2.2.1. Second-order Runge-Kutta method . . . . . . . . . . . . . . . . . . . . . . 41
2.2.2. Fourth-order Runge-Kutta method . . . . . . . . . . . . . . . . . . . . . . 44
2.2.3. Adaptive methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
2.3. Accuracy Comparison for One-Step Methods . . . . . . . . . . . . . . . . . . . . 47
2.4. Multi-step Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 50
2.5. High-Order Equations & Systems of Differential Equations . . . . . . . . . . . 52
2.6. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
3 Properties of Numerical Methods 55
3.1. A Model Problem: Heat Conduction in 1D . . . . . . . . . . . . . . . . . . . . . . 56
3.2. Consistency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 60
5


## Page 6

6 Contents
3.3. Convergence . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 63
3.4. Stability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
3.4.1. Approaches for proving stability . . . . . . . . . . . . . . . . . . . . . . . 70
3.4.2. The von Neumann analysis . . . . . . . . . . . . . . . . . . . . . . . . . . 72
3.4.3. Inﬂuence of lower-order terms . . . . . . . . . . . . . . . . . . . . . . . . . 76
3.5. Boundedness – Maximum Principle . . . . . . . . . . . . . . . . . . . . . . . . . 77
3.5.1. Convection-dominated ﬂuid ﬂows . . . . . . . . . . . . . . . . . . . . . . . 78
3.5.2. Stability vs. boundedness . . . . . . . . . . . . . . . . . . . . . . . . . . . 79
3.6. Conservation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
3.7. A Central-Time Scheme . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 81
3.8. The θ-Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 82
3.8.1. Stability analysis for the θ-Method . . . . . . . . . . . . . . . . . . . . . . 84
3.8.2. Accuracy order . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 85
3.8.3. Maximum principle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
3.8.4. Error analysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 89
3.9. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 90
4 Finite Difference Methods for Elliptic Equations 91
4.1. Finite Difference (FD) Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . 92
4.1.1. Constant-coefﬁcient problems . . . . . . . . . . . . . . . . . . . . . . . . . 93
4.1.2. General diffusion coefﬁcients . . . . . . . . . . . . . . . . . . . . . . . . . 96
4.1.3. FD schemes for mixed derivatives . . . . . . . . . . . . . . . . . . . . . . 98
4.1.4. L∞-norm error estimates for FD schemes . . . . . . . . . . . . . . . . . . 98
4.1.5. The Algebraic System for FDM . . . . . . . . . . . . . . . . . . . . . . . . 105
4.2. Solution of Linear Algebraic Systems . . . . . . . . . . . . . . . . . . . . . . . . . 109
4.2.1. Direct method: the LU factorization . . . . . . . . . . . . . . . . . . . . . 110
4.2.2. Linear iterative methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . 115
4.2.3. Convergence theory . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 116
4.2.4. Relaxation methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 122
4.2.5. Line relaxation methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . 129
4.3. Krylov Subspace Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 132
4.3.1. Steepest descent method . . . . . . . . . . . . . . . . . . . . . . . . . . . . 133
4.3.2. Conjugate gradient (CG) method . . . . . . . . . . . . . . . . . . . . . . . 135
4.3.3. Preconditioned CG method . . . . . . . . . . . . . . . . . . . . . . . . . . 138
4.4. Other Iterative Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 140
4.4.1. Incomplete LU-factorization . . . . . . . . . . . . . . . . . . . . . . . . . . 140
4.5. Numerical Examples with Python . . . . . . . . . . . . . . . . . . . . . . . . . . 144
4.6. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 150
5 Finite Element Methods for Elliptic Equations 153


## Page 7

Contents 7
5.1. Finite Element (FE) Methods in 1D Space . . . . . . . . . . . . . . . . . . . . . . 154
5.1.1. Variational formulation . . . . . . . . . . . . . . . . . . . . . . . . . . . . 154
5.1.2. Formulation of FEMs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 159
5.2. The Hilbert spaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 172
5.3. An error estimate for FEM in 1D . . . . . . . . . . . . . . . . . . . . . . . . . . . 174
5.4. Other Variational Principles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 179
5.5. FEM for the Poisson equation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 180
5.5.1. Integration by parts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 180
5.5.2. Deﬁning FEMs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 183
5.5.3. Assembly: Element stiffness matrices . . . . . . . . . . . . . . . . . . . . 189
5.5.4. Extension to Neumann boundary conditions . . . . . . . . . . . . . . . . 191
5.6. Finite Volume (FV) Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 193
5.7. Average of The Diffusion Coefﬁcient . . . . . . . . . . . . . . . . . . . . . . . . . 198
5.8. Abstract Variational Problem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 200
5.9. Numerical Examples with Python . . . . . . . . . . . . . . . . . . . . . . . . . . 203
5.10.Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 206
6 FD Methods for Hyperbolic Equations 209
6.1. Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 210
6.2. Basic Difference Schemes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 213
6.2.1. Consistency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 215
6.2.2. Convergence . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 217
6.2.3. Stability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 220
6.2.4. Accuracy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 224
6.3. Conservation Laws . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 227
6.3.1. Euler equations of gas dynamics . . . . . . . . . . . . . . . . . . . . . . . 227
6.4. Shocks and Rarefaction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 234
6.4.1. Characteristics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 234
6.4.2. Weak solutions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 236
6.5. Numerical Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 238
6.5.1. Modiﬁed equations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 238
6.5.2. Conservative methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 245
6.5.3. Consistency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 249
6.5.4. Godunov’s method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 250
6.6. Nonlinear Stability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 251
6.6.1. Total variation stability (TV-stability) . . . . . . . . . . . . . . . . . . . . 252
6.6.2. Total variation diminishing (TVD) methods . . . . . . . . . . . . . . . . . 254
6.6.3. Other nonoscillatory methods . . . . . . . . . . . . . . . . . . . . . . . . . 255
6.7. Numerical Examples with Python . . . . . . . . . . . . . . . . . . . . . . . . . . 260


## Page 8

8 Contents
6.8. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 262
7 Domain Decomposition Methods 265
7.1. Introduction to DDMs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 266
7.2. Overlapping Schwarz Alternating Methods (SAMs) . . . . . . . . . . . . . . . . 269
7.2.1. Variational formulation . . . . . . . . . . . . . . . . . . . . . . . . . . . . 269
7.2.2. SAM with two subdomains . . . . . . . . . . . . . . . . . . . . . . . . . . . 270
7.2.3. Convergence analysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 271
7.2.4. Coarse subspace correction . . . . . . . . . . . . . . . . . . . . . . . . . . 274
7.3. Nonoverlapping DDMs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 277
7.3.1. Multi-domain formulation . . . . . . . . . . . . . . . . . . . . . . . . . . . 277
7.3.2. The Steklov-Poincaré operator . . . . . . . . . . . . . . . . . . . . . . . . 279
7.3.3. The Schur complement matrix . . . . . . . . . . . . . . . . . . . . . . . . 281
7.4. Iterative DDMs Based on Transmission Conditions . . . . . . . . . . . . . . . . 284
7.4.1. The Dirichlet-Neumann method . . . . . . . . . . . . . . . . . . . . . . . 284
7.4.2. The Neumann-Neumann method . . . . . . . . . . . . . . . . . . . . . . . 286
7.4.3. The Robin method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 287
7.4.4. Remarks on DDMs of transmission conditions . . . . . . . . . . . . . . . 288
7.5. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 294
8 Multigrid Methods ∗ 297
8.1. Introduction to Multigrid Methods . . . . . . . . . . . . . . . . . . . . . . . . . . 298
8.2. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 299
9 Locally One-Dimensional Methods 301
9.1. Heat Conduction in 1D Space: Revisited . . . . . . . . . . . . . . . . . . . . . . . 302
9.2. Heat Equation in Two and Three Variables . . . . . . . . . . . . . . . . . . . . . 308
9.2.1. The θ-method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 309
9.2.2. Convergence analysis for θ-method . . . . . . . . . . . . . . . . . . . . . . 311
9.3. LOD Methods for the Heat Equation . . . . . . . . . . . . . . . . . . . . . . . . . 314
9.3.1. The ADI method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 315
9.3.2. Accuracy of the ADI: Two examples . . . . . . . . . . . . . . . . . . . . . 321
9.3.3. The general fractional step (FS) procedure . . . . . . . . . . . . . . . . . 324
9.3.4. Improved accuracy for LOD procedures . . . . . . . . . . . . . . . . . . . 326
9.3.5. A convergence proof for the ADI-II . . . . . . . . . . . . . . . . . . . . . . 333
9.3.6. Accuracy and efﬁciency of ADI-II . . . . . . . . . . . . . . . . . . . . . . . 335
9.4. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 337
10 Special Schemes 339
10.1.Wave Propagation and Absorbing Boundary Conditions . . . . . . . . . . . . . . 340


## Page 9

Contents 9
10.1.1. Introduction to wave equations . . . . . . . . . . . . . . . . . . . . . . . . 340
10.1.2. Absorbing boundary conditions (ABCs) . . . . . . . . . . . . . . . . . . . 341
10.1.3. Waveform ABC . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 342
11 Projects∗ 347
11.1.High-order FEMs for PDEs of One Spacial Variable . . . . . . . . . . . . . . . . 347
A Basic Concepts in Fluid Dynamics 349
A.1. Conservation Principles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 349
A.2. Conservation of Mass . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 350
A.3. Conservation of Momentum . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 351
A.4. Non-dimensionalization of the Navier-Stokes Equations . . . . . . . . . . . . . 354
A.5. Generic Transport Equations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 355
A.6. Homework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 356
B Elliptic Partial Differential Equations 359
B.1. Regularity Estimates . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 359
B.2. Maximum and Minimum Principles . . . . . . . . . . . . . . . . . . . . . . . . . 361
B.3. Discrete Maximum and Minimum Principles . . . . . . . . . . . . . . . . . . . . 363
B.4. Coordinate Changes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 365
B.5. Cylindrical and Spherical Coordinates . . . . . . . . . . . . . . . . . . . . . . . . 366
C Helmholtz Wave Equation ∗ 369
D Richards’s Equation for Unsaturated Water Flow∗ 371
E Orthogonal Polynomials and Quadratures 373
E.1. Orthogonal Polynomials . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 373
E.2. Gauss-Type Quadratures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 375
F Some Mathematical Formulas 379
F.1. Trigonometric Formulas . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 379
F.2. Vector Identities . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 379
G Finite Difference Formulas 381
Bibliography 383
Index 391


## Page 10

10 Contents


## Page 11

Chapter 1
Mathematical Preliminaries
In the approximation of derivatives, we consider the Taylor series expansion
and the curve-ﬁtting as two of most popular tools. This chapter begins with
a brief review for these introductory techniques, followed by ﬁnite difference
schemes, and an overview of partial differential equations (PDEs).
In the study of numerical methods for PDEs, experiments such as the im-
plementation and running of computational codes are necessary to under-
stand the detailed properties/behaviors of the numerical algorithm under con-
sideration. However, these tasks often take a long time so that the work can
hardly be ﬁnished in a desired period of time. Particularly, it is the case for
the graduate students in classes of numerical PDEs. Basic software will be
provided to help you experience numerical methods satisfactorily.
1


## Page 12

2 CHAPTER 1. MATHEMATICAL PRELIMINARIES
1.1. Taylor’s Theorem & Polynomial Fitting
While the differential equations are deﬁned on continuous variables, their nu-
merical solutions must be computed on a ﬁnite number of discrete points. The
derivatives should be approximated appropriately to simulate the physical
phenomena accurately and efﬁciently. Such approximations require various
mathematical and computational tools. In this section we present a brief re-
view for the Taylor’s series and the curve ﬁtting.
Theorem 1.1. (Taylor’s Theorem). Assume that u ∈ Cn+1[a,b ] and let
c ∈ [a,b ]. Then, for every x ∈ (a,b ), there is a pointξ that lies betweenx andc
such that
u(x) =pn(x) +En+1(x), (1.1)
wherepn is a polynomial of degree≤n andEn+1 denotes the remainder deﬁned
as
pn(x) =
n∑
k=0
u(k)(c)
k! (x −c)k, E n+1(x) = u(n+1)(ξ)
(n + 1)! (x −c)n+1.
The formula (1.1) can be rewritten for u(x +h) (about x) as follows: for
x, x+h ∈ (a,b ),
u(x +h) =
n∑
k=0
u(k)(x)
k! hk +u(n+1)(ξ)
(n + 1)!hn+1 (1.2)


## Page 13

1.1. Taylor’s Theorem & Polynomial Fitting 3
Curve ﬁtting
Another useful tool in numerical analysis is thecurve ﬁtting. It is often the
case that the solution must be represented as a continuous function rather
than a collection of discrete values. For example, when the function is to be
evaluated at a point which is not a grid point, the function must be interpo-
lated near the point before the evaluation.
First, we introduce the existence theorem for interpolating polynomials.
Theorem 1.2. Let x0,x 1, · · ·,xN be a set of distinct points. Then, for arbi-
trary real valuesy0,y 1, · · ·,yN, there is a unique polynomialpN of degree ≤N
such that
pN(xi) =yi, i = 0, 1, · · ·,N.


## Page 14

4 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Lagrange interpolating polynomial
Let {a =x0<x 1< · · ·<x N =b} be a partition of the interval [a,b ].
Then, the Lagrange form of interpolating polynomial is formulated as a
linear combination of the so-called cardinal functions:
pN(x) =
N∑
i=0
LN,i(x)u(xi). (1.3)
Here the cardinal functions are deﬁned as
LN,i(x) =
N∏
j = 0
j̸= i
(x −xj
xi −xj
)
∈ PN, (1.4)
where PN is the set of polynomials of degree ≤N, which satisfy
LN,i(xj) =δij, i,j = 0, 1, · · ·,N.


## Page 15

1.1. Taylor’s Theorem & Polynomial Fitting 5
Newton polynomial
The Newton form of the interpolating polynomial that interpolates u at
{x0,x 1, · · ·,xN } is given as
pN(x) =
N∑
k=0
[
ak
k−1∏
j=0
(x −xj)
]
, (1.5)
where the coefﬁcients ak, k = 0, 1, · · ·,N , can be computed as divided differ-
ences
ak =u[x0,x 1, · · ·,xk]. (1.6)
Deﬁnition 1.3. (Divided Differences). The divided differences for the
functionu(x) are deﬁned as
u[xj] =u(xj),
u[xj,xj+1] = u[xj+1] −u[xj]
xj+1 −xj
,
u[xj,xj+1,xj+2] = u[xj+1,xj+2] −u[xj,xj+1]
xj+2 −xj
,
(1.7)
and the recursive rule for higher-order divided differences is
u[xj,xj+1, · · ·,xm]
= u[xj+1,xj+2, · · ·,xm] −u[xj,xj+1, · · ·,xm−1]
xm −xj
,
(1.8)
forj <m.


## Page 16

6 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Table 1.1: Divided-difference table foru(x).
xj u[xj] u[ , ] u[ , , ] u[ , , , ] u[ , , , , ]
x0 u[x0]
x1 u[x1] u[x0,x 1]
x2 u[x2] u[x1,x 2] u[x0,x 1,x 2]
x3 u[x3] u[x2,x 3] u[x1,x 2,x 3] u[x0,x 1,x 2,x 3]
x4 u[x4] u[x3,x 4] u[x2,x 3,x 4] u[x1,x 2,x 3,x 4] u[x0,x 1,x 2,x 3,x 4]
Example


## Page 17

1.1. Taylor’s Theorem & Polynomial Fitting 7
Figure 1.1: A Maple program
Interpolation Error Theorem
Theorem 1.4. (Interpolation Error Theorem). Let the interval be par-
titioned into {a = x0 < x1 < · · ·< xN = b} and pN interpolate u at the nodal
points of the partitioning. Assume that u(N+1)(x) exists for each x ∈ [a,b ].
Then, there is a pointξ ∈ [a,b ] such that
u(x) =pN(x) +u(N+1)(ξ)
(N + 1)!
N∏
j=0
(x −xj), ∀x ∈ [a,b ]. (1.9)
Further, assume that the points are uniformly spaced and max
x∈[a,b]
|u(N+1)(x)| ≤
M, for someM >0. Then,
max
x∈[a,b]
|u(x) −pN(x)| ≤ M
4(N + 1)
(b −a
N
)N+1
. (1.10)


## Page 18

8 CHAPTER 1. MATHEMATICAL PRELIMINARIES
1.2. Finite Differences
In this section, we present bases of ﬁnite difference (FD) approximations. Tay-
lor series approaches are more popular than curve-ﬁtting approaches; how-
ever, higher-order FD schemes can be easily obtained by curve-ﬁtting ap-
proaches, although grid points are not uniformly spaced.
1.2.1. Uniformly spaced grids
• Let h = (b −a)/N, for some positive integerN, and
xi =a +ih, i = 0, 1, · · ·,N.
• Deﬁne ui =u(xi),i = 0, 1, · · ·,N .
Then, it follows from (1.2) that
(a) ui+1 = ui +ux(xi)h +uxx(xi)
2! h2 +uxxx(xi)
3! h3
+uxxxx(xi)
4! h4 +uxxxxx(xi)
5! h5 + · · ·,
(b) ui−1 = ui −ux(xi)h +uxx(xi)
2! h2 −uxxx(xi)
3! h3
+uxxxx(xi)
4! h4 −uxxxxx(xi)
5! h5 + · · ·.
(1.11)


## Page 19

1.2. Finite Differences 9
One-sided FD operators
Solve the above equations forux(xi) to have
ux(xi) = ui+1 −ui
h −uxx(xi)
2! h −uxxx(xi)
3! h2
−uxxxx(xi)
4! h3 + · · ·,
ux(xi) = ui −ui−1
h +uxx(xi)
2! h −uxxx(xi)
3! h2
+uxxxx(xi)
4! h3 − · · ·.
(1.12)
By truncating the terms includinghk,k = 1, 2, · · ·, we deﬁne the ﬁrst-order
FD schemes
ux(xi) ≈ D+
xui := ui+1 −ui
h , (forward)
ux(xi) ≈ D−
xui := ui −ui−1
h , (backward)
(1.13)
where D+
x and D−
x are called the forward and backward difference operators,
respectively.


## Page 20

10 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Central FD operators
The central second-order FD scheme forux: Subtract (1.11.b) from (1.11.a)
and divide the resulting equation by 2h.
ux(xi) = ui+1 −ui−1
2h −uxxx(xi)
3! h2
−uxxxxx(xi)
5! h4 − · · ·.
(1.14)
Thus the central second-order FD scheme reads
ux(xi) ≈D1
xui := ui+1 −ui−1
2h . (central) (1.15)
Note that the central difference operatorD1
x is the average of the forward and
backward operators, i.e.,
D1
x = D+
x +D−
x
2 .
A FD scheme for uxx(xi): Add the two equations in (1.11) and divide the
resulting equation byh2.
uxx(xi) = ui−1 − 2ui +ui+1
h2 − 2uxxxx(xi)
4! h2
−2uxxxxxx(xi)
6! h4 − · · ·.
(1.16)
Thus the central second-order FD scheme foruxx atxi reads
uxx(xi) ≈D2
xui := ui−1 − 2ui +ui+1
h2 . (1.17)
Note that
D2
x =D−
xD+
x =D+
xD−
x. (1.18)
1.2.2. General grids
Taylor series approaches
For {a =x0<x 1< · · ·<x N =b}, a partition of the interval [a,b ], let
hi =xi −xi−1, i = 1, 2, · · ·,N.


## Page 21

1.2. Finite Differences 11
The Taylor series expansions forui+1 andui−1 (aboutxi) become
(a) ui+1 = ui +ux(xi)hi+1 +uxx(xi)
2! h2
i+1
+uxxx(xi)
3! h3
i+1 + · · ·,
(b) ui−1 = ui −ux(xi)hi +uxx(xi)
2! h2
i
−uxxx(xi)
3! h3
i + · · ·.
(1.19)
which correspond to (1.11).


## Page 22

12 CHAPTER 1. MATHEMATICAL PRELIMINARIES
The second-order FD scheme forux
Multiply (1.19.b) by r2
i (:= (hi+1/hi)2) and subtract the resulting equation
from (1.19.a) to have
ux(xi) = ui+1 − (1 −r2
i )ui −r2
iui−1
hi+1 +r2
ihi
− h3
i+1 +r2
ih3
i
6(hi+1 +r2
ihi)uxxx(xi) − · · ·
= h2
iui+1 + (h2
i+1 −h2
i )ui −h2
i+1ui−1
hihi+1(hi +hi+1)
−hihi+1
6 uxxx(xi) − · · ·.
Thus the second-order approximation forux(xi) becomes
ux(xi) ≈ h2
iui+1 + (h2
i+1 −h2
i )ui −h2
i+1ui−1
hihi+1(hi +hi+1) . (1.20)
Note: It is relatively easy to ﬁnd the second-order FD scheme forux in nonuni-
form grids, as just shown, using the Taylor series approach. However, for
higher-order schemes, it requires a tedious work for the derivation. The curve
ﬁtting approached can be applied for the approximation of both ux and uxx
more conveniently.


## Page 23

1.2. Finite Differences 13
Figure 1.2: The curve ﬁtting by the interpolating quadratic polynomial.
Curve ﬁtting approaches
An alternative way of obtaining FD approximations is to
• ﬁt the function to an interpolating polynomial &
• differentiate the resulting polynomial.
For example, the quadratic polynomial that interpolates u at {xi−1,xi,xi+1}
can be constructed as (see Figure 1.2)
p2(x) =a0 +a1(x −xi−1) +a2(x −xi−1)(x −xi), (1.21)
where the coefﬁcientsak,k = 0, 1, 2, are determined by e.g. the divided differ-
ences:
a0 = ui−1, a 1 = ui −ui−1
hi
,
a2 = hi(ui+1 −ui) −hi+1(ui −ui−1)
hihi+1(hi +hi+1) .
Thus
ux(xi) ≈ p′
2(xi) = a1 +a2hi
= h2
iui+1 + (h2
i+1 −h2
i )ui −h2
i+1ui−1
hihi+1(hi +hi+1) ,
(1.22)
which is second-order and identical to (1.20).


## Page 24

14 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Higher-order FDs forux(xi)
For higher-order approximations forux(xi), the function must be ﬁt to higher-
degree polynomials that interpolateu at a larger set of grid points includingxi.
For a fourth-order approximation, for example, we should construct a fourth-
degree polynomial.
Let pi−2,4(x) be the fourth-order Newton polynomial that interpolates u at
{xi−2,xi−1,xi,xi+1,xi+2}, i.e.,
pi−2,4(x) =
4∑
k=0
[
ai−2,k
k−1∏
j=0
(x −xi−2+j)
]
, (1.23)
where
ai−2,k =u[xi−2,xi−1, · · ·,xi−2+k], k = 0, · · ·, 4.
Then it follows from the Interpolation Error Theorem (1.9) that
ux(xi) =p′
i−2,4(xi)
+u(5)(ξ)
5! (xi −xi−2)(xi −xi−1)(xi −xi+1)(xi −xi+2).
Therefore, under the assumption that u(5)(x) exists, p′
i−2,4(xi) approximates
ux(xi) with a fourth-order truncation error.


## Page 25

1.2. Finite Differences 15
FDs foruxx(xi)
The second-derivativeuxx can be approximated by differentiating the inter-
polating polynomial twice. For example, fromp2 in (1.21), we have
uxx(xi) ≈ p′′
2(xi) = 2 hi(ui+1 −ui) −hi+1(ui −ui−1)
hihi+1(hi +hi+1)
= hi+1ui−1 − (hi +hi+1)ui +hiui+1
1
2hihi+1(hi +hi+1) .
(1.24)
The above approximation has a ﬁrst-order accuracy for general grids. How-
ever, it turns out to be second-order accurate when hi =hi+1; compare it with
the one in (1.17).
A higher-order FD scheme for uxx can be obtained from the twice differen-
tiation ofpi−2,4 in (1.23):
uxx(xi) ≈p′′
i−2,4(xi), (1.25)
which is a third-order approximation and becomes fourth-order for uniform
grids.
The thumb of rule is to utilize higher-order interpolating polynomials for
higher-order FD approximations.


## Page 26

16 CHAPTER 1. MATHEMATICAL PRELIMINARIES
1.3. Overview of PDEs
Parabolic Equations
The one-dimensional (1D) differential equation
ut −α2uxx =f(x,t ), x ∈ (0,L ), (1.26)
is a standard 1D parabolic equation, which is often called theheat/diffusion
equation.
The equation models many physical phenomena such as heat distribution
on a rod: u(x,t ) represents the temperature at the position x and timet,α2 is
the thermal diffusivity of the material, andf(x,t ) denotes a source/sink along
the rod.
When the material property is not uniform along the rod, the coefﬁcient α
is a function of x. In this case, the thermal conductivity K depends on the
positionx and the heat equation becomes
ut − ∇ · (K(x)ux)x =f(x,t ). (1.27)
Note: To make the heat equation well-posed (existence, uniqueness, and sta-
bility), we have to supply an initial condition and appropriate boundary con-
ditions on the both ends of the rod.


## Page 27

1.3. Overview of PDEs 17
Heat equation in 2D/3D
In 2D or 3D, the heat equations can be formulated as
ut − ∇ · (K∇u) =f, (x,t ) ∈ Ω × [0,J ]
u(x,t = 0) =u0(x), x ∈ Ω (IC)
u(x,t ) =g(x,t ), (x,t ) ∈ Γ × [0,J ] (BC)
(1.28)
where Γ =∂Ω, the boundary of Ω.


## Page 28

18 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Hyperbolic Equations
The second-order hyperbolic differential equation
1
v2utt −uxx =f(x,t ), x ∈ (0,L ) (1.29)
is often called the wave equation. The coefﬁcient v is the wave velocity, while
f represents a source. The equation can be used to describe the vibration of a
ﬂexible string, for which u denotes the displacement of the string.
In higher dimensions, the wave equation can be formulated similarly.
Elliptic Equations
The second-order elliptic equations are obtained as the steady-state solu-
tions (ast → ∞) of the parabolic and hyperbolic equations. For example,
−∇ · (K∇u) =f, x ∈ Ω
u(x) =g(x), x ∈ Γ
(1.30)
represents a steady-state heat distribution for the given heat sourcef and the
boundary conditiong.


## Page 29

1.3. Overview of PDEs 19
Fluid Mechanics
The 2D Navier-Stokes (NS) equations for viscous incompressible ﬂuid ﬂows:
Momentum equations
ut +px − 1
R∆u + (u2)x + (uv)y =g1
vt +py − 1
R∆v + (uv)x + (v2)y =g2
Continuity equation
ux +vy = 0
(1.31)
Here (u,v ) denote the velocity ﬁelds in (x,y )-directions, respectively,p is the
pressure, R is the (dimensionless) Reynolds number, and (g1,g 2) are body
forces. See e.g. [23] for computational methods for ﬂuid dynamics.


## Page 30

20 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Finance Modeling
In option pricing, the most popular model is the Black-Scholes (BS) differ-
ential equation
ut + 1
2σ2S2∂2u
∂S 2 +rS∂S−
∂uSru = 0 (1.32)
Here
• S(t) is the stock price at timet
• u =u(S(t),t ) denotes the price of an option on the stock
• σ is the volatility of the stock
• r is the (risk-free) interest rate
Note that the BS model is a backward parabolic equation, which needs
a ﬁnal condition at time T. For European calls, for example, we have the
condition
u(S,T ) = max(S −X, 0),
while for a put option, the condition reads
u(S,T ) = max(X −S, 0),
whereX is the exercise price at the expiration dateT.
• Call option: the right to buy the stock
• Put option: the right to sell the stock


## Page 31

1.3. Overview of PDEs 21
Image Processing
• As higher reliability and efﬁciency are required, PDE-based mathemati-
cal techniques have become important components of many research and
processing areas, including image processing.
• PDE-based methods have been applied for various image processing tasks
such as image denoising, interpolation, inpainting, segmentation, and ob-
ject detection.
Example: Image denoising
• Noise model:
f =u +η (1.33)
wheref is the observed (noisy) image,u denotes the desired image, andη
is the noise.
• Optimization problem
Minimize the total variation (TV) with the constraint
min
u
ˆ
Ω
|∇u|dx subj. to∥f −u∥2 =σ2. (1.34)
Using a Lagrange multiplier, the above minimization problem can be
rewritten as
min
u
(ˆ
Ω
|∇u|dx +λ
2
ˆ
Ω
(f −u)2dx
)
, (1.35)
from which we can derive the corresponding Euler-Lagrange equation
−∇ ·
( ∇u
|∇u|
)
=λ(f −u), (1.36)
which is called the TV model in image denoising [58].
Remarks:
• Many other image processing tasks (such as interpolation and inpaint-
ing) can be considered as “generalized denoising." For example, the main


## Page 32

22 CHAPTER 1. MATHEMATICAL PRELIMINARIES
issue in interpolation is to remove or signiﬁcantly reduce artifacts of easy
and traditional interpolation methods, and the artifacts can be viewed as
noise [8, 34].
• Variants of the TV model can be applied for various image processing
tasks.


## Page 33

1.3. Overview of PDEs 23
Numerical methods for PDEs
• Finite difference method: Simple, easiest technique. It becomes quite
complex for irregular domains
• Finite element method : Most popular, due to most ﬂexible over com-
plex domains
• Finite volume method: Very popular in computational ﬂuid dynamics
(CFD).
– Surface integral over control volumes
– Locally conservative
• Spectral method: Powerful if the domain is simple and the solution is
smooth.
• Boundary element method: Useful for PDEs which can be formulated
as integral equations; it solves the problem on the boundary to ﬁnd the
solution over the whole domain.
– The algebraic system is often full
– Not many problems can be written as integral equations. for example,
nonlinear equations
• Meshless/mesh-free method: Developed to overcome drawbacks of mesh-
ing and re-meshing, for example, in crack propagation problems and large
deformation simulations


## Page 34

24 CHAPTER 1. MATHEMATICAL PRELIMINARIES
1.4. Difference Equations
In this section, we will consider solution methods and stability analysis for
difference equations, as a warm-up problem.
Problem: Find a general form for yn by solving the recurrence relation
2yn+2 − 5yn+1 + 2yn = 0
y0 = 2, y1 = 1
(1.37)
Solution: Let
yn =αn. (1.38)
and plug it into the ﬁrst equation of (1.37) to have
2αn+2 − 5αn+1 + 2αn = 0,
which implies
2α2 − 5α + 2 = 0. (1.39)
The last equation is called the characteristic equation of the difference
equation (1.37), of which the two roots are
α = 2, 1
2.


## Page 35

1.4. Difference Equations 25
Thus, the general solution of the difference equation reads
yn =c1 2n +c2
(1
2
)n
, (1.40)
where c1 and c2 are constants. One can determine the constants using the
initial conditions in (1.37).
y0 =c1 +c2 = 2, y 1 = 2c1 +c2
2 = 1
which implies
c1 = 0, c 2 = 2. (1.41)
What we have found is that
yn = 2
(1
2
)n
= 21−n. (1.42)


## Page 36

26 CHAPTER 1. MATHEMATICAL PRELIMINARIES
A small change in the initial conditions
Now, consider another difference equation with a little bit different initial
conditions from those in (1.37):
2wn+2 − 5wn+1 + 2wn = 0
w0 = 2, w1 = 1.01
(1.43)
Then, the difference equation has the general solution of the form as in (1.40):
wn =c1 2n +c2
(1
2
)n
. (1.44)
Using the new initial conditions, we have
w0 =c1 +c2 = 2, w 1 = 2c1 +c2
2 = 1.01,
Thus, the solution becomes
wn = 1
150 2n + 299
150
(1
2
)n
. (1.45)
Comparison
y0 = 2 w0 = 2
y1 = 1 w1 = 1 .01
... ...
y10 = 9 .7656 × 10−4 w10 = 6 .8286
y20 = 9 .5367 × 10−7 w20 = 6 .9905 × 103
Thus, the difference equation in (1.37) or (1.43) is unstable.


## Page 37

1.4. Difference Equations 27
Stability Theory
Physical Deﬁnition: A (FD) scheme is stable if a small change in the initial
conditions produces a small change in the state of the system.
• Most aspects in the nature are stable.
• Some phenomena in the nature can be represented by differential equa-
tions (ODEs and PDEs), while they may be solved through difference
equations.
• Although ODEs and PDEs are stable, their approximations (ﬁnite differ-
ence equations) may not be stable. In this case, the approximation is a
failure.
Deﬁnition: A differential equation is
• stable if for every set of initial data, the solution remains bounded as
t → ∞.
• strongly stable if the solution approaches zero ast → ∞.


## Page 38

28 CHAPTER 1. MATHEMATICAL PRELIMINARIES
Stability of difference equations
Theorem 1.5. A ﬁnite difference equation is stable if and only if
(a) |α| ≤ 1 for all roots of the characteristic equation, and
(b) if |α| = 1 for some root, then the root is simple.
Theorem 1.6. A ﬁnite difference equation is strongly stable if and only if
|α|< 1 for all roots of the characteristic equation.


## Page 39

1.5. Homework 29
1.5. Homework
1. For an interval [a,b ], let the grid be uniform:
xi =ih +a; i = 0, 1, · · ·,N, h = b −a
N . (1.46)
Second-order schemes for ux and uxx, on the uniform grid given as in
(1.46), respectively read
ux(xi) ≈D1
xui = ui+1 −ui−1
2h ,
uxx(xi) ≈D2
xui =D+
xD−
xui = ui−1 − 2ui +ui+1
h2 .
(1.47)
(a) Use Divided Differences to construct the second-order Newton poly-
nomialp2(x) which passes (xi−1,ui−1), (xi,ui), and (xi+1,ui+1).
(b) Evaluate p′
2(xi) andp′′
2(xi) to compare with the FD schemes in (1.47).
2. Find the general solution of each of the following difference equations:
(a) yn+1 = 3yn
(b) yn+1 = 3yn + 2
(c) yn+2 − 8yn+1 + 12yn = 0
(d) yn+2 − 6yn+1 + 9yn = 1
3. Determine, for each of the following difference equations, whether it is
stable or unstable.
(a) yn+2 − 5yn+1 + 6yn = 0
(b) 8yn+2 + 2yn+1 − 3yn = 0
(c) 3yn+2 +yn = 0
(d) 4yn+4 + 5yn+2 +yn = 0


## Page 40

30 CHAPTER 1. MATHEMATICAL PRELIMINARIES


## Page 41

Chapter 2
Numerical Methods for ODEs
The ﬁrst-order initial value problem (IVP) is formulated as follows: ﬁnd{yi(x) :
i = 1, 2, · · ·,M } satisfying
dyi
dx = fi(x,y 1,y 2, · · ·,yM),
yi(x0) = yi0,
i = 1, 2, · · ·,M, (2.1)
for a prescribed initial values {yi0 :i = 1, 2, · · ·,M }.
We assume that (2.1) admits a unique solution in a neighborhood ofx0.
For simplicity, we consider the caseM = 1:
dy
dx = f(x,y ),
y(x0) = y0.
(2.2)
It is known that if f and∂f/∂y are continuous in a strip (a,b ) × R containing
(x0,y 0), then (2.2) has a unique solution in an intervalI, wherex0 ∈I ⊂ (a,b ).
31


## Page 42

32 Chapter 2. Numerical Methods for ODEs
In the following, we describestep-by-step methods for (2.2); that is, we start
fromy0 =y(x0) and proceed stepwise.
• In the ﬁrst step, we compute y1 which approximate the solutiony of (2.2)
atx =x1 =x0 +h, whereh is the step size.
• The second step computes an approximate value y2 of the solution atx =
x2 =x0 + 2h, etc..
We ﬁrst introduce the Taylor-series methods for (2.2), followed by Runge-
Kutta methods and multi-step methods. All of these methods are applicable
straightforwardly to (2.1).


## Page 43

2.1. Taylor-Series Methods 33
2.1. Taylor-Series Methods
Here we rewrite the initial value problem (IVP):
{
y′ = f(x,y ),
y(x0) = y0. (IVP) (2.3)
For the problem, a continuous approximation to the solution y(x) will not be
obtained; instead, approximations to y will be generated at various points,
called mesh points, in the interval [x0,T ] for someT >x0.
Let
• h = (T −x0)/nt, for an integernt ≥ 1
• xn =x0 +nh,n = 0, 1, 2, · · ·,nt
• yn be the approximate solution ofy atxn


## Page 44

34 Chapter 2. Numerical Methods for ODEs
2.1.1. The Euler method
Let us try to ﬁnd an approximation ofy(x1), marching through the ﬁrst subin-
terval [x0,x 1] and using a Taylor-series involving only up to the ﬁrst-derivative
ofy.
Consider the Taylor series
y(x +h) =y(x) +hy′(x) +h2
2y′′(x) + · · ·. (2.4)
Letting x = x0 and utilizing y(x0) = y0 and y′(x0) = f(x0,y 0), the value y(x1)
can be approximated by
y1 =y0 +hf(x0,y 0), (2.5)
where the second- and higher-order terms ofh are ignored.
Such an idea can be applied recursively for the computation of solution on
later subintervals. Indeed, since
y(x2) =y(x1) +hy′(x1) +h2
2y′′(x1) + · · ·,
by replacingy(x1) andy′(x1) withy1 andf(x1,y 1), respectively, we obtain
y2 =y1 +hf(x1,y 1), (2.6)
which approximates the solution atx2 =x0 + 2h.


## Page 45

2.1. Taylor-Series Methods 35
Figure 2.1: The Euler method.
In general, forn ≥ 0,
yn+1 =yn +hf(xn,yn) (2.7)
which is called the Euler method.
Geometrically it is an approximation of the curve {x,y (x)} by a polygon of
which the ﬁrst side is tangent to the curve at x0, as shown in Figure 2.1. For
example,y1 is determined by moving the point (x0,y 0) by the length of h with
the slopef(x0,y 0).


## Page 46

36 Chapter 2. Numerical Methods for ODEs
Convergence of the Euler method
Theorem 2.1. Letf satisfy the Lipschitz condition in its second variable,
i.e., there isλ> 0 such that
∥f(x,y 1) −f(x,y 2)∥ ≤ λ∥y1 −y2∥, ∀y1,y 2. (2.8)
Then, the Euler method is convergent; more precisely,
∥yn −y(xn)∥ ≤ C
λh[(1 +λh)n − 1], n = 0, 1, 2, · · ·. (2.9)
Proof. The true solution y satisﬁes
y(xn+1) =y(xn) +hf(xn,y (xn)) + O(h2). (2.10)
Thus it follows from (2.7) and (2.10) that
en+1 = en +h[f(xn,yn) −f(xn,y (xn))] + O(h2)
= en +h[f(xn,y (xn) +en) −f(xn,y (xn))] + O(h2),
whereen =yn −y(xn). Utilizing (2.8), we have
∥en+1∥ ≤ (1 +λh)∥en∥ +Ch2. (2.11)
Here we will prove (2.9) by using (2.11) and induction. It holds trivially when
n = 0. Suppose it holds for n. Then,
∥en+1∥ ≤ (1 +λh)∥en∥ +Ch2
≤ (1 +λh) ·C
λh[(1 +λh)n − 1] +Ch2
= C
λh[(1 +λh)n+1 − (1 +λh)] +Ch2
= C
λh[(1 +λh)n+1 − 1],
which completes the proof.


## Page 47

2.1. Taylor-Series Methods 37
2.1.2. Higher-order Taylor methods
These methods are based on Taylor series expansion.
If we expand the solutiony(x), in terms of itsmth-order Taylor polynomial
aboutxn and evaluated atxn+1, we obtain
y(xn+1) = y(xn) +hy′(xn) +h2
2!y′′(xn) + · · ·
+hm
m!y(m)(xn) + hm+1
(m + 1)!y(m+1)(ξn).
(2.12)
Successive differentiation of the solution,y(x), gives
y′(x) =f(x,y (x)), y′′(x) =f ′(x,y (x)), · · ·,
and generally,
y(k)(x) =f (k−1)(x,y (x)). (2.13)
Thus, we have
y(xn+1) = y(xn) +hf(xn,y (xn)) +h2
2!f ′(xn,y (xn)) + · · ·
+hm
m!f (m−1)(xn,y (xn)) + hm+1
(m + 1)!f (m)(ξn,y (ξn))
(2.14)


## Page 48

38 Chapter 2. Numerical Methods for ODEs
The Taylor method of order m corresponding to (2.14) is obtained by
deleting the remainder term involvingξn:
yn+1 =yn +hTm(xn,yn), (2.15)
where
Tm(xn,yn) = f(xn,yn) + h
2!f ′(xn,yn) + · · ·
+hm−1
m! f (m−1)(xn,yn).
(2.16)
Remarks
• m = 1 ⇒yn+1 =yn +hf(xn,yn)
which is the Euler method.
• m = 2 ⇒yn+1 =yn +h
[
f(xn,yn) +h
2f ′(xn,yn)
]
• As m increases, the method achieves higher-order accuracy; however, it
requires to compute derivatives off(x,y (x)).


## Page 49

2.1. Taylor-Series Methods 39
Example: For the initial-value problem
y′ =y −x3 +x + 1, y (0) = 0.5, (2.17)
ﬁndT3(x,y ).
• Solution: Since y′ =f(x,y ) =y −x3 +x + 1,
f ′(x,y ) = y′ − 3x2 + 1
= ( y −x3 +x + 1) − 3x2 + 1
= y −x3 − 3x2 +x + 2
and
f ′′(x,y ) = y′ − 3x2 − 6x + 1
= ( y −x3 +x + 1) − 3x2 − 6x + 1
= y −x3 − 3x2 − 5x + 2
Thus
T3(x,y ) = f(x,y ) +h
2f ′(x,y ) +h2
6f ′′(x,y )
= y −x3 +x + 1 +h
2(y −x3 − 3x2 +x + 2)
+h2
6 (y −x3 − 3x2 − 5x + 2)


## Page 50

40 Chapter 2. Numerical Methods for ODEs
2.2. Runge-Kutta Methods
The Taylor-series method of the preceding section has the drawback of re-
quiring the computation of derivatives of f(x,y ). This is a tedious and time-
consuming procedure for most cases, which makes the Taylor methods seldom
used in practice.
Runge-Kutta methods have high-order local truncation error of the Taylor
methods but eliminate the need to compute and evaluate the derivatives of
f(x,y ). That is, the Runge-Kutta Methods are formulated, incorporating a
weighted average of slopes, as follows:
yn+1 =yn +h (w1K1 +w2K2 + · · · +wmKm), (2.18)
where
• wj ≥ 0 andw1 +w2 + · · · +wm = 1
• Kj are recursive evaluations of the slopef(x,y )
• Need to determine wj and other parameters to satisfy
w1K1 +w2K2 + · · · +wmKm ≈Tm(xn,yn) + O(hm) (2.19)
That is, Runge-Kutta methods evaluate an average slope off(x,y ) on the
interval [xn,xn+1] in the same order of accuracy as the mth-order Taylor
method.


## Page 51

2.2. Runge-Kutta Methods 41
2.2.1. Second-order Runge-Kutta method
Formulation:
yn+1 =yn +h (w1K1 +w2K2) (2.20)
where
K1 = f(xn,yn)
K2 = f(xn +αh,yn +βhK1)
Requirement: Determine w1, w2, α, βsuch that
w1K1 +w2K2 = T2(xn,yn) + O(h2)
= f(xn,yn) +h
2f ′(xn,yn) + O(h2)
Derivation: For the left-hand side of (2.20), the Taylor series reads
y(x +h) =y(x) +hy′(x) +h2
2y′′(x) + O(h3).
Sincey′ =f andy′′ =fx +fyy′ =fx +fyf,
y(x +h) =y(x) +hf +h2
2 (fx +fyf) + O(h3). (2.21)


## Page 52

42 Chapter 2. Numerical Methods for ODEs
On the other hand, the right-side of (2.20) can be reformulated as
y +h(w1K1 +w2K2)
=y +w1hf(x,y ) +w2hf(x +αh,y +βhK1)
=y +w1hf +w2h(f +αhfx +βhfyf) + O(h3)
which reads
y +h(w1K1 +w2K2)
=y + (w1 +w2)hf +h2(w2αfx +w2βfyf) + O(h3)
(2.22)
The comparison of (2.21) and (2.22) drives the following result, for the
second-order Runge-Kutta methods.
Results:
w1 +w2 = 1, w 2α = 1
2, w 2β = 1
2 (2.23)


## Page 53

2.2. Runge-Kutta Methods 43
Common Choices:
I. w1 =w2 = 1
2, α =β = 1
Then, the algorithm becomes
yn+1 =yn +h
2(K1 +K2) (2.24)
where
K1 = f(xn,yn)
K2 = f(xn +h,yn +hK1)
This algorithm is thesecond-order Runge-Kutta (RK2) method, which
is also known as the Heun’s method.
II. w1 = 0, w2 = 1, α =β = 1
2
For the choices, the algorithm reads
yn+1 =yn +hf
(
xn +h
2,yn +h
2f(xn,yn)
)
(2.25)
which is also known as the modiﬁed Euler method.


## Page 54

44 Chapter 2. Numerical Methods for ODEs
2.2.2. Fourth-order Runge-Kutta method
Formulation:
yn+1 =yn +h (w1K1 +w2K2 +w3K3 +w4K4) (2.26)
where
K1 = f(xn,yn)
K2 = f(xn +α1h,yn +β1hK1)
K3 = f(xn +α2h,yn +β2hK1 +β3hK2)
K4 = f(xn +α3h,yn +β4hK1 +β5hK2 +β6hK3)
Requirement: Determine wj, αj, βj such that
w1K1 +w2K2 +w3K3 +w4K4 = T4(xn,yn) + O(h4)


## Page 55

2.2. Runge-Kutta Methods 45
The most common choice: The most commonly used set of parameter val-
ues yields
yn+1 =yn +h
6 (K1 + 2K2 + 2K3 +K4) (2.27)
where
K1 = f(xn,yn)
K2 = f(xn + 1
2h,yn + 1
2hK1)
K3 = f(xn + 1
2h,yn + 1
2hK2)
K4 = f(xn +h,yn +hK3)
The local truncation error for the above RK4 can be derived as
h5
5!y(5)(ξn) (2.28)
for someξn ∈ [xn,xn+1]. Thus the global error becomes
(T −x0)h4
5! y(5)(ξ) (2.29)
for someξ ∈ [x0,T ]


## Page 56

46 Chapter 2. Numerical Methods for ODEs
2.2.3. Adaptive methods
• Accuracy of numerical methods can be improved by decreasing the step
size.
• Decreasing the step size ≈ Increasing the computational cost
• There may be subintervals where a relatively large step size sufﬁces and
other subintervals where a small step is necessary to keep the truncation
error within a desired limit.
• An adaptive method is a numerical method which uses a variable step
size.
• Example: Runge-Kutta-Fehlberg method (RKF45), which uses RK5 to
estimate local truncation error of RK4.


## Page 57

2.3. Accuracy Comparison for One-Step Methods 47
2.3. Accuracy Comparison for One-Step Methods
For an accuracy comparison among the one-step methods presented in the
previous sections, consider the motion of the spring-mass system:
y′′(t) + κ
my = F0
m cos(µt),
y(0) =c0, y ′(0) = 0,
(2.30)
where m is the mass attached at the end of a spring of the spring constant
κ, the term F0 cos(µt) is a periodic driving force of frequency µ, and c0 is the
initial displacement from the equilibrium position.
• It is not difﬁcult to ﬁnd the analytic solution of (2.30):
y(t) =A cos(ωt) + F0
m(ω2 −µ2) cos(µt),
whereω =
√
κ/m is the angular frequency and the coefﬁcientA is deter-
mined corresponding toc0.
• Let y1 =y andy2 = −y′
1/ω. Then, we can reformulate (2.30) as
y′
1 = −ωy2, y 0(0) =c0,
y′
2 =ωy1 − F0
mω cos(µt), y2(0) = 0.
(2.31)
See § 2.5 on page 52 for high-order equations.
• The motion is periodic only if µ/ω is a rational number. We choose
m = 1, F0 = 40, A= 1 (c0 ≈ 1.33774), ω= 4π, µ= 2π. (2.32)
Thus the fundamental period of the motion
T = 2πq
ω = 2πp
µ = 1.
See Figure 2.2 for the trajectory of the mass satisfying (2.31)-(2.32).


## Page 58

48 Chapter 2. Numerical Methods for ODEs
Figure 2.2: The trajectory of the mass satisfying (2.31)-(2.32).
Accuracy comparison
Table 2.1: Theℓ2-error att = 1 for various time step sizes.
1/h Euler Heun RK4
100 1.19 3.31E-2 2.61E-5
200 4.83E-1 (1.3) 8.27E-3 (2.0) 1.63E-6 (4.0)
400 2.18E-1 (1.1) 2.07E-3 (2.0) 1.02E-7 (4.0)
800 1.04E-1 (1.1) 5.17E-4 (2.0) 6.38E-9 (4.0)
Table 2.1 presents theℓ2-error att = 1 for various time step sizesh, deﬁned
as
|yh
nt − y(1)| =
([
yh
1,nt −y1(1)
]2
+
[
yh
2,nt −y2(1)
]2)1/2
,
where yh
nt denotes the computed solution at thent-th time step withh = 1/nt.
• The numbers in parenthesis indicate the order of convergence α, deﬁned


## Page 59

2.3. Accuracy Comparison for One-Step Methods 49
as
α := log(E(2h)/E(h))
log 2 ,
whereE(h) andE(2h) denote the errors obtained with the grid spacing to
beh and 2h, respectively.
• As one can see from the table, the one-step methods exhibit the expected
accuracy.
• RK4 shows a much better accuracy than the lower-order methods, which
explains its popularity.


## Page 60

50 Chapter 2. Numerical Methods for ODEs
2.4. Multi-step Methods
The problem: The ﬁrst-order initial value problem (IVP)
{
y′ = f(x,y ),
y(x0) = y0. (IVP) (2.33)
Numerical Methods:
• Single-step/Starting methods: Euler’s method, Modiﬁed Euler’s, Runge-
Kutta methods
• Multi-step/Continuing methods: Adams-Bashforth-Moulton
Deﬁnition: An m-step method, m ≥ 2, for solving the IVP, is a difference
equation for ﬁnding the approximationyn+1 atx =xn+1, given by
yn+1 = a1yn +a2yn−1 + · · · +amyn+1−m
+h[b0f(xn+1,yn+1) +b1f(xn,yn) + · · ·
+bmf(xn+1−m,yn+1−m)]
(2.34)
Them-step method is said to be
{
explicit or open, ifb0 = 0
implicit or closed, ifb0 ̸= 0


## Page 61

2.4. Multi-step Methods 51
Fourth-order multi-step methods
Lety′
i =f(xi,yi).
• Adams-Bashforth method (explicit)
yn+1 =yn + h
24(55y′
n − 59y′
n−1 + 37y′
n−2 − 9y′
n−3)
• Adams-Moulton method (implicit)
yn+1 =yn + h
24(9y′
n+1 + 19y′
n − 5y′
n−1 +y′
n−2)
• Adams-Bashforth-Moulton method (predictor-corrector)
y∗
n+1 = yn + h
24(55y′
n − 59y′
n−1 + 37y′
n−2 − 9y′
n−3)
yn+1 = yn + h
24(9y′∗
n+1 + 19y′
n − 5y′
n−1 +y′
n−2)
wherey′∗
n+1 =f(xn+1,y ∗
n+1)
Remarks
• y1, y2, y3 can be computed by RK4.
• Multi-step methods may save evaluations of f(x,y ) such that in each step,
they require only one new evaluation off(x,y ) to fulﬁll the step.
• RK methods are accurate enough and easy to implement, so that multi-
step methods are rarely applied in practice.
• ABM shows a strong stability for special cases, occasionally but not
often [11].


## Page 62

52 Chapter 2. Numerical Methods for ODEs
2.5. High-Order Equations & Systems of Differ-
ential Equations
The problem: 2nd-order initial value problem (IVP)
{
y′′ =f(x,y,y ′), x ∈ [x0,T ]
y(x0) =y0, y′(x0) =u0,
(2.35)
Letu =y′. Then,
u′ =y′′ =f(x,y,y ′) =f(x,y,u )
An equivalent problem: Thus, the above 2nd-order IVP can be equivalently
written as the following system of ﬁrst-order DEs:
{
y′ =u, y (x0) =y0,
u′ =f(x,y,u ), u(x0) =u0,
x ∈ [x0,T ] (2.36)
Notes:
• The right-side of the DEs involves no derivatives.
• The system (2.36) can be solved by one of the numerical methods (we have
studied), after modifying it for vector functions.


## Page 63

2.6. Homework 53
2.6. Homework
1. For the IVP in (2.17),
(a) Find T4(x,y ).
(b) Perform two steps of the 3rd and 4th-order Taylor methods, with h =
1/2, to ﬁnd an approximate solutions ofy atx = 1.
(c) Compare the errors, given that the exact solution
y(x) = 4 + 5x + 3x2 +x3 − 7
2ex
2. Derive the global error of RK4 in (2.29), given the local truncation error
(2.28).
3. Write the following DE as a system of ﬁrst-order differential equations.
x′′ +x′y − 2y′′ = t,
−2y +y′′ +x = e−t,
where the derivative denotesd/dt.


## Page 64

54 Chapter 2. Numerical Methods for ODEs


## Page 65

Chapter 3
Properties of Numerical Methods
Numerical methods compute approximate solutions for differential equations
(DEs). In order for the numerical solution to be a reliable approximation of
the given problem, the numerical method should satisfy certain properties. In
this chapter, we consider properties of numerical methods that are most com-
mon in numerical analysis such asconsistency, convergence, stability, accuracy
order, boundedness/maximum principle, and conservation.
55


## Page 66

56 Chapter 3. Properties of Numerical Methods
3.1. A Model Problem: Heat Conduction in 1D
Let Ω = (0, 1) andJ = (0,T ], for some T > 0. Consider the following simplest
model problem for parabolic equations in one-dimensional (1D) space:
ut −uxx =f, (x,t ) ∈ Ω ×J,
u = 0, (x,t ) ∈ Γ ×J,
u =u0, x ∈ Ω, t = 0,
(3.1)
wheref is a heat source, Γ denotes the boundary of Ω, i.e., Γ = {0, 1}, and u0
is the prescribed initial value of the solution att = 0.


## Page 67

3.1. A Model Problem: Heat Conduction in 1D 57
Finite difference methods
We begin with our discussion of ﬁnite difference (FD) methods for (3.1) by
partitioning the domain. Let
∆t =T/nt, tn =n∆t, n = 0, 1, · · ·,nt;
∆x = 1/nx, xj =j∆x, j = 0, 1, · · ·,nx;
for some positive integersnt andnx. Deﬁneun
j =u(xj,tn).
Let
Sn := Ω × (tn−1,tn] (3.2)
be thenth space-time slice. Suppose that the computation has been performed
foruk = {uk
j }, 0 ≤k ≤n − 1. Then, the task is to computeun by integrating the
equation on the space-time slice Sn, utilizing FD schemes.
The basic idea of FD schemes is to replace derivatives by FD approxima-
tions. It can be done in various ways; here we consider most common ways
that are based on the Taylor’s formula.


## Page 68

58 Chapter 3. Properties of Numerical Methods
Recall the central second-order FD formula foruxx presented in (1.16):
uxx(xi) = ui−1 − 2ui +ui+1
h2 − 2uxxxx(xi)
4! h2
−2uxxxxxx(xi)
6! h4 − · · ·.
(3.3)
Apply the above to have
uxx(xj,tn) = un
j−1 − 2un
j +un
j+1
∆x2
−2uxxxx(xj,tn)
4! ∆x2 + O(∆x4).
(3.4)
For the temporal direction, one can also apply a difference formula for the
approximation of the time-derivative ut. Depending on the way of combining
the spatial and temporal differences, the resulting scheme can behave quite
differently.


## Page 69

3.1. A Model Problem: Heat Conduction in 1D 59
Explicit Scheme
The following presents the simplest scheme:
vn
j −vn−1
j
∆t −vn−1
j−1 − 2vn−1
j +vn−1
j+1
∆x2 =fn−1
j (3.5)
which is an explicit scheme for (3.1), called the forward Euler method.
Herevn
j is an approximation ofun
j .
The above scheme can be rewritten as
vn
j = µvn−1
j−1 + (1 − 2µ)vn−1
j +µvn−1
j+1 + ∆tfn−1
j (3.6)
where
µ = ∆t
∆x2


## Page 70

60 Chapter 3. Properties of Numerical Methods
3.2. Consistency
The bottom line for an accurate numerical method is that the discretization
becomes exact as the grid spacing tends to zero, which is the basis of consis-
tency.
Deﬁnition 3.1. Given a PDE Pu = f and a FD scheme P∆x,∆tv = f,
the FD scheme is said to be consistent with the PDE if for every smooth
functionφ(x,t )
Pφ −P∆x,∆tφ → 0 as (∆x, ∆t) → 0,
with the convergence being pointwise at each grid point.
Not all numerical methods based on Taylor series expansions are consis-
tent; sometimes, we may have to restrict the manner in which ∆x and ∆t
approach zero in order for them to be consistent.


## Page 71

3.2. Consistency 61
Example 3.2. The forward Euler scheme (3.5) is consistent.
Proof. For the heat equation in 1D,
Pφ ≡
(∂
∂t − ∂2
∂x2
)
φ =φt −φxx.
The forward Euler scheme (3.5) reads
P∆x,∆tφ = φn
j −φn−1
j
∆t −φn−1
j−1 − 2φn−1
j +φn−1
j+1
∆x2
The truncation error for the temporal discretization can be obtained applying
the one-sided FD formula:
φt(xj,tn−1) = φi
j −φn−1
j
∆t
−φtt(xj,tn−1)
2! ∆t + O(∆t2).
(3.7)
It follows from (3.4) and (3.7) that the truncation error of the forward Euler
scheme evaluated at (xj,tn−1) becomes
(Pφ −P∆x,∆tφ) (xj,tn−1)
= −φtt(xj,tn−1)
2! ∆t + 2φxxxx(xj,tn−1)
4! ∆x2
+O(∆t2 + ∆x4),
(3.8)
which clearly approaches zero as (∆x, ∆t) → 0.


## Page 72

62 Chapter 3. Properties of Numerical Methods
Truncation Error
Deﬁnition 3.3. Letu be smooth and
P u(xj,tn) = P∆x,∆tun
j + Tun
j, (3.9)
Then, Tun
j is called the truncation error of the FD schemeP∆x,∆tv =f eval-
uated at (xj,tn).
It follows from (3.8) that the truncation error of the forward Euler scheme
(3.5) is
O(∆t + ∆x2)
for all grid points (xj,tn).


## Page 73

3.3. Convergence 63
3.3. Convergence
A numerical method is said to be convergent if the solution of the FD scheme
tends to the exact solution of the PDE as the grid spacing tends to zero. We
deﬁne convergence in a formal way as follows:
Deﬁnition 3.4. A FD scheme approximating a PDE is said to be conver-
gent if
u(x,t ) −vn
j → 0, as (xj,tn) → (x,t ) and (∆x, ∆t) → 0,
whereu(x,t ) is the exact solution of PDE andvn
j denotes the the solution of
the FD scheme.
Consistency implies that the truncation error
(Pu −P∆x,∆tu) → 0, as (∆x, ∆t) → 0.
So consistency is certainly necessary for convergence, but may not be sufﬁ-
cient.


## Page 74

64 Chapter 3. Properties of Numerical Methods
Example 3.5. The forward Euler scheme (3.5) is convergent, when
µ = ∆t
∆x2 ≤ 1
2. (3.10)
Proof. (The scheme) Recall the explicit scheme (3.5):
vn
j −vn−1
j
∆t −vn−1
j−1 − 2vn−1
j +vn−1
j+1
∆x2 =fn−1
j (3.11)
which can be expressed as
P∆x,∆tvn−1
j =fn−1
j (3.12)
On the other hand, for the exact solutionu,
P∆x,∆tun−1
j + Tun−1
j =fn−1
j (3.13)
(Error equation) Let
en
j =un
j −vn
j,
where u is the exact solution of (3.1). Then, from (3.12) and (3.13), the error
equation becomes
P∆x,∆ten−1
j = −Tun−1
j ,
which in detail reads
en
j −en−1
j
∆t −en−1
j−1 − 2en−1
j +en−1
j+1
∆x2 = −Tun−1
j . (3.14)
In order to control the error more conveniently, we reformulate the error equa-
tion
en
j = µen−1
j−1 + (1 − 2µ)en−1
j +µen−1
j+1 − ∆t Tun−1
j . (3.15)
(Error analysis withℓ∞-norm) Now, deﬁne
En = max
j
|en
j |, T n = max
j
|Tun
j |, ˆT = max
n
T n.
Note thatv0
j =u0
j for allj and therefore E0 = 0.


## Page 75

3.3. Convergence 65
It follows from (3.15) and the assumption (3.10) that
|en
j | ≤ µ |en−1
j−1 | + (1 − 2µ) |en−1
j | +µ |en−1
j+1 |
+∆t |Tun−1
j |
≤ µ En−1 + (1 − 2µ) En−1 +µ En−1
+∆t T n−1
= En−1 + ∆t T n−1.
(3.16)
Since the above inequality holds for allj, we have
En ≤ En−1 + ∆t T n−1, (3.17)
and therefore
En ≤ E n−1 + ∆t T n−1
≤ E n−2 + ∆t T n−1 + ∆t T n−2
≤ · · ·
≤ E 0 +
n−1∑
k=1
∆t T k.
(3.18)
Since E0 = 0,
En ≤ (n − 1)∆tˆT ≤ T ˆT, (3.19)
whereT is the upper bound of the time available. Since ˆT = O(∆t + ∆x2), the
maximum norm of the error approaches zero as (∆x, ∆t) → 0.


## Page 76

66 Chapter 3. Properties of Numerical Methods
Remarks
• The assumption µ ≤ 1/2 makes coefﬁcients in the forward Euler scheme
(3.6) nonnegative, which in turn makesvn
j a weighted average of{vn−1
j−1,vn−1
j ,vn−1
j+1 }.
• The analysis can often conclude
En = O(ˆT ), ∀n
• Convergence is what a numerical scheme must satisfy.
• However, showing convergence is not easy in general, if attempted in a
direct manner as in the previous example.
• There is a related concept, stability, that is easier to check.


## Page 77

3.3. Convergence 67
An Example:µ≤ 1/2
Figure 3.1: The explicit scheme (forward Euler) in Maple.
The problem:
ut −α2uxx = 0, (x,t ) ∈ [0, 1] × [0, 1],
u = 0, (x,t ) ∈ {0, 1} × [0, 1],
u = sin(πx), x ∈ [0, 1], t = 0,
(3.20)
The exact solution:
u(x,t ) =e−π2t sin(πx)


## Page 78

68 Chapter 3. Properties of Numerical Methods
Parameter setting:
a := 0; b := 1; T := 1; α := 1; f := 0;
nx := 10;
Numerical results:
nt := 200 (µ = 1/2) ∥unt −vnt∥∞ = 7.94 × 10−6
nt := 170 (µ ≈ 0.588) ∥unt −vnt∥∞ = 1.31 × 109
• For the case µ ≈ 0.588, the numerical solution becomes oscillatory and
blows up.


## Page 79

3.4. Stability 69
3.4. Stability
The example with Figure 3.1 shows that consistency of a numerical method is
not enough to guarantee convergence of its solution to the exact solution. In
order for a consistent numerical scheme to be convergent, a required property
is stability. Note that if a scheme is convergent, it produces a bounded solution
whenever the exact solution is bounded. This is the basis of stability. We ﬁrst
deﬁne theL2-norm of grid functionv:
∥v∥∆x =
(
∆x
∑
j
|vj|2
)1/2
.
Deﬁnition 3.6. A FD schemeP∆x,∆tv = 0 for a homogeneous PDEPu = 0
is stable if for any positiveT, there is a constantCT such that
∥vn∥∆x ≤CT
M∑
m=0
∥um∥∆x, (3.21)
for 0 ≤ tn ≤ T and for ∆x and ∆t sufﬁciently small. Here M is chosen to
incorporate the data initialized on the ﬁrstM + 1 levels.


## Page 80

70 Chapter 3. Properties of Numerical Methods
3.4.1. Approaches for proving stability
There are two fundamental approaches for proving stability:
• The Fourier analysis (von Neumann analysis)
It applies only to linear constant coefﬁcient problems.
• The energy method
It can be used for more general problems with variable coefﬁcients and
nonlinear terms. But it is quite complicated and the proof is problem
dependent.
Theorem 3.7. (Lax-Richtmyer Equivalence Theorem). Given a well-
posed linear initial value problem and its FD approximation that satisﬁes
the consistency condition, stability is a necessary and sufﬁcient condition
for convergence.
The above theorem is very useful and important. Proving convergence is
difﬁcult for most problems. However, the determination of consistency of a
scheme is quite easy as shown in §3.2, and determining stability is also easier
than showing convergence. Here we introduce the von Neumann analysis of
stability of FD schemes, which allows one to analyze stability much simpler
than a direct veriﬁcation of (3.21).


## Page 81

3.4. Stability 71
Theorem 3.8. A FD scheme P∆x,∆tv = 0 for a homogeneous PDE Pu = 0
is stable if
∥vn∥∆x ≤ (1 +C∆t)∥vn−1∥∆x, (3.22)
for someC ≥ 0 independent on ∆t
Proof. Recall ∆t =T/nt, for some positive integernt. A recursive application
of (3.22) reads
∥vn∥∆x ≤ (1 +C∆t)∥vn−1∥∆x ≤ (1 +C∆t)2∥vn−2∥∆x
≤ · · · ≤ (1 +C∆t)n∥v0(=u0)∥∆x.
(3.23)
Here the task is to show (1 +C∆t)n is bounded by some positive number CT
forn = 1, · · ·,nt, independently on ∆t. Since ∆t =T/nt, we have
(1 +C∆t)n = (1 + CT/nt)n
≤ (1 +CT/nt)nt
=
[
(1 +CT/nt)nt/CT
]CT
≤ eCT,
which proves (3.21) with byCT :=eCT .


## Page 82

72 Chapter 3. Properties of Numerical Methods
3.4.2. The von Neumann analysis
• Let φ be a grid function deﬁned on grid points of spacing ∆x and φj =
φ(j∆x). Then, its Fourier transform is given by, forξ ∈ [−π/∆x,π/ ∆x],
ˆφ(ξ) = 1√
2π
∞∑
j=−∞
e−ij∆xξφj, (3.24)
and the inverse formula is
φj = 1√
2π
ˆ π/∆x
−π/∆x
eij∆xξˆφ(ξ)dξ. (3.25)
• Parseval’s identity
∥φn∥∆x = ∥ˆφn∥∆x, (3.26)
where
∥φn∥∆x =
( ∞∑
j=−∞
|φj|2∆x
)1/2
,
∥ˆφn∥∆x =
(ˆ π/∆x
−π/∆x
|ˆφ(ξ)|2dξ
)1/2
• The stability inequality (3.21) can be replaced by
∥ˆvn∥∆x ≤CT
M∑
m=0
∥ˆvm∥∆x. (3.27)
• Thus stability can be determined by providing (3.27) in the frequency
domain.


## Page 83

3.4. Stability 73
Example
To show how one can use the above analysis, we exemplify the forward Euler
scheme (3.6), withf = 0:
vn
j = µvn−1
j−1 + (1 − 2µ)vn−1
j +µvn−1
j+1 (3.28)
• The inversion formula implies
vn
j = 1√
2π
ˆ π/∆x
−π/∆x
eij∆xξˆvn(ξ)dξ. (3.29)
Thus it follows from (3.28) and (3.29) that
vn
j = 1√
2π
ˆ π/∆x
−π/∆x
F∆x,j(ξ)dξ, (3.30)
where
F∆x,j(ξ) = µei(j−1)∆xξˆvn−1(ξ)
+(1 − 2µ)eij∆xξˆvn−1(ξ)
+µei(j+1)∆xξˆvn−1(ξ)
= eij∆xξ [µe −i∆xξ + (1 − 2µ) +µei∆xξ]ˆvn−1(ξ)
• Comparing (3.29) with (3.30), we obtain
ˆvn(ξ) = [µe −i∆xξ + (1 − 2µ) +µei∆xξ]ˆvn−1(ξ) (3.31)
• Letting ϑ = ∆xξ, we deﬁne theampliﬁcation factorfor the scheme (3.6)
by
g(ϑ) = µe −i∆xξ + (1 − 2µ) +µei∆xξ
= µe −iϑ + (1 − 2µ) +µeiϑ
= (1 − 2µ) + 2µ cos(ϑ)
= 1 − 2µ(1 − cos(ϑ)) = 1 − 4µ sin2(ϑ/2)
(3.32)
• Equation (3.31) can be rewritten as
ˆvn(ξ) =g(ϑ)ˆvn−1(ξ) =g(ϑ)2ˆvn−2(ξ) = · · · =g(ϑ)nˆv0(ξ). (3.33)
Therefore, when g(ϑ)n is suitably bounded, the scheme is stable. In fact,
g(ϑ)n would be uniformly bounded only if |g(ϑ)| ≤ 1 +C∆t.


## Page 84

74 Chapter 3. Properties of Numerical Methods
• It is not difﬁcult to see
|g(ϑ)| = |1 − 2µ(1 − cos(ϑ))| ≤ 1
only if
0 ≤µ ≤ 1/2 (3.34)
which is the stability condition of the scheme (3.6).


## Page 85

3.4. Stability 75
The von Neumann analysis: Is it complicated?
A simpler and equivalent procedure of the von Neumann analysis can be sum-
marized as follows:
• Replace vn
j bygneijϑ for each value ofj andn.
• Find conditions on coefﬁcients and grid spacings which would satisfy|g| ≤
1 +C∆t, for someC ≥ 0.
The forward Euler scheme (3.6):
vn
j = µvn−1
j−1 + (1 − 2µ)vn−1
j +µvn−1
j+1
Replacingvn
j withgneijϑ gives
gneijϑ =µgn−1ei(j−1)ϑ + (1 − 2µ)gn−1eijϑ +µgn−1ei(j+1)ϑ
Dividing both sides of the above bygn−1eijϑ, we obtain
g =µe −iϑ + (1 − 2µ) +µeiϑ
which is exactly the same as in (3.32)


## Page 86

76 Chapter 3. Properties of Numerical Methods
3.4.3. Inﬂuence of lower-order terms
Let us consider the model problem (3.1) augmented by lower-order terms
ut =uxx +aux +bu (3.35)
wherea andb are constants.
We can construct an explicit scheme
vn
j −vn−1
j
∆t = vn−1
j−1 − 2vn−1
j +vn−1
j+1
∆x2 +avn−1
j+1 −vn−1
j−1
2∆x +bvn−1
j (3.36)
From the von Neumann analysis, we can obtain the ampliﬁcation factor
g(ϑ) = 1 − 4µ sin2(ϑ/2) +ia∆t
∆x sin(ϑ) +b∆t, (3.37)
which gives
|g(ϑ)|2 =
(
1 − 4µ sin2(ϑ/2) +b∆t
)2
+
(a∆t
∆x sin(ϑ)
)2
=
(
1 − 4µ sin2(ϑ/2)
)2
+ 2
(
1 − 4µ sin2(ϑ/2)
)
b∆t
+(b∆t)2 +
(a∆t
∆x sin(ϑ)
)2
Hence, under the condition 0<µ = ∆t/∆x2 ≤ 1/2,
|g(ϑ)|2 ≤ 1 + 2|b|∆t + (b∆t)2 + |a|2
2 ∆t
≤
(
1 + (|b| + |a|2/4) ∆t
)2
.
(3.38)
Thus, lower-order terms do not change the stability condition. (Homework for
details.)


## Page 87

3.5. Boundedness – Maximum Principle 77
3.5. Boundedness – Maximum Principle
Numerical solutions should lie between proper bounds. For example, physical
quantities such as density and kinetic energy of turbulence must be positive,
while concentration should be between 0 and 1.
In the absence of sources and sinks, some variables are required to have
maximum and minimum values on the boundary of the domain. The above
property is call the maximum principle, which should be inherited by the
numerical approximation.


## Page 88

78 Chapter 3. Properties of Numerical Methods
3.5.1. Convection-dominated ﬂuid ﬂows
To illustrate boundedness of the numerical solution, we consider the convection-
diffusion problem:
ut −εuxx +aux = 0. (3.39)
whereε> 0.
When the spatial derivatives are approximated by central differences, the
algebraic equation forun
j reads
un
j =un−1
j −
[
ε−un−1
j−1 + 2un−1
j −un−1
j+1
∆x2 +aun−1
j+1 −un−1
j−1
2∆x
]
∆t,
or
un
j =
(
d +σ
2
)
un−1
j−1 + (1 − 2d)un−1
j +
(
d −σ
2
)
un−1
j+1, (3.40)
where the dimensionless parameters are deﬁned as
d = ε∆t
∆x2 and σ = a∆t
∆x.
• σ: the Courant number
• ∆x/a: the characteristic convection time
• ∆x2/ε: the characteristic diffusion time
These are the time required for a disturbance to be transmitted by con-
vection and diffusion over a distance ∆x.


## Page 89

3.5. Boundedness – Maximum Principle 79
3.5.2. Stability vs. boundedness
The requirement that the coefﬁcients of the old nodal values be nonnegative
leads to
(1 − 2d) ≥ 0, |σ|
2 ≤d. (3.41)
• The ﬁrst condition leads to the limit on ∆t as
∆t ≤ ∆x2
2ε ,
which guarantees stability of (3.40). Recall that lower-order terms do
not change the stability condition (§3.4.3).
• The second condition imposes no limit on the time step. But it gives a
relation between convection and diffusion coefﬁcients.
• The cell Peclet number is deﬁned and bounded as
Pecell := |σ|
d = |a|∆x
ε ≤ 2. (3.42)
which is a sufﬁcient (but not necessary) condition for boundedness of
the solution of (3.40).


## Page 90

80 Chapter 3. Properties of Numerical Methods
3.6. Conservation
When the equations to be solved are from conservation laws, the numerical
scheme should respect these laws both locally and globally. This means that
the amount of a conserved quantity leaving a control volume is equal to the
amount entering to adjacent control volumes.
If divergence form of equations and a ﬁnite volume method is used, this
is readily guaranteed for each individual control volume and for the solution
domain as a whole.
For other discretization methods, conservation can be achieved if care is
taken in the choice of approximations. Sources and sinks should be carefully
treated so that the net ﬂux for each individual control volume is conservative.
Conservation is a very important property of numerical schemes. Once
conservation of mass, momentum, and energy is guaranteed, the error of con-
servative schemes is only due to an improper distribution of these quantities
over the solution domain.
Non-conservative schemes can produce artiﬁcial sources or sinks, changing
the balance locally or globally. However, non-conservative schemes can be
consistent and stable and therefore lead to correct solutions in the limit of
mesh reﬁnement; error due to non-conservation is appreciable in most cases
only when the mesh is not ﬁne enough.
The problem is that it is difﬁcult to know on which mesh the non-conservation
error is small enough. Conservative schemes are thus preferred.


## Page 91

3.7. A Central-Time Scheme 81
3.7. A Central-Time Scheme
Before we begin considering general implicit methods, we would like to men-
tion an interesting scheme for solving (3.1):
vn+1
j −vn−1
j
2∆t −vn
j−1 − 2vn
j +vn
j+1
∆x2 =fn
j, (3.43)
of which the truncation error
Trunc.Err = O(∆t2 + ∆x2). (3.44)
To study its stability, we set f ≡ 0 and substitute vn
j = gneijϑ into (3.43) to
obtain
g − 1/g
2∆t −e−iϑ − 2 +eiϑ
∆x2 = 0,
or
g2 + (8µ sin2(ϑ/2))g − 1 = 0. (3.45)
We see that (3.45) has two distinct real rootsg1 andg2 which should satisfy
g1 ·g2 = −1. (3.46)
Hence the magnitude of one root must be greater than one, for some modes
and for all µ >0, for which we say that the scheme is unconditionally un-
stable.
This example warns us that we need be careful when developing a FD
scheme. We cannot simply put combinations of difference approximations to-
gether.


## Page 92

82 Chapter 3. Properties of Numerical Methods
3.8. The θ-Method
Let A1 be the central second-order approximation of −∂xx, deﬁned as
A1vn
j := −vn
j−1 − 2vn
j +vn
j+1
∆x2 .
Then theθ-method for (3.1) is
vn −vn−1
∆t + A1
[
θvn + (1 −θ)vn−1]
=fn−1+θ, (3.47)
forθ ∈ [0, 1], or equivalently
(I +θ∆tA1)vn
= [I − (1 −θ)∆tA1]vn−1 + ∆tfn−1+θ.
(3.48)
The following three choices ofθ are popular.
• Forward Euler method (θ = 0): The algorithm (3.48) is reduced to
vn = (I − ∆tA1)vn−1 + ∆tfn−1, (3.49)
which is the explicit scheme in (3.6), requiring the stability condition
µ = ∆t
∆x2 ≤ 1
2.


## Page 93

3.8. The θ-Method 83
• Backward Euler method (θ = 1 ): This is an implicit method written
as
(I + ∆tA1)vn =vn−1 + ∆tfn. (3.50)
– The method must invert a tridiagonal matrix to get the solution in
each time level.
– But it is unconditionally stable, stable independently on the choice
of ∆t.
• Crank-Nicolson method (θ = 1/2):
(
I + ∆t
2 A1
)
vn =
(
I − ∆t
2 A1
)
vn−1 + ∆tfn−1/2. (3.51)
– It requires to solve a tridiagonal system in each time level, as in the
backward Euler method.
– However, the Crank-Nicolson method is most popular, because it is
second-order in both space and time and unconditionally stable.
– The Crank-Nicolson method can be viewed as an explicit method in
the ﬁrst half of the space-time sliceSn(:= Ω×(tn−1,tn]) and an implicit
method in the second half of Sn. Hence it is often called a semi-
implicit method.


## Page 94

84 Chapter 3. Properties of Numerical Methods
3.8.1. Stability analysis for the θ-Method
Settingf ≡ 0, the algebraic system (3.48) reads pointwisely
−θµv n
j−1 + (1 + 2θµ)vn
j −θµv n
j+1
= (1 −θ)µvn−1
j−1 + [1 − 2(1 −θ)µ]vn−1
j + (1 −θ)µvn−1
j+1,
(3.52)
whereµ = ∆t/∆x2.
For an stability analysis for this one-parameter family of systems by uti-
lizing the von Neumann analysis in §3.4.2, substitute gneijϑ forvn
j in (3.52) to
have
g
[
−θµe −iϑ + (1 + 2θµ) −θµeiϑ]
= (1 −θ)µe −iϑ + [1 − 2(1 −θ)µ] + (1 −θ)µeiϑ.
That is,
g = 1 − 2(1 −θ)µ (1 − cosϑ)
1 + 2θµ (1 − cosϑ)
= 1 − 4(1 −θ)µ sin2(ϑ/2)
1 + 4θµ sin2(ϑ/2) .
(3.53)
Because µ >0 and θ ∈ [0, 1], the ampliﬁcation factor g cannot be larger than
one. The condition g ≥ −1 is equivalent to
1 − 4(1 −θ)µ sin2(ϑ/2) ≥ −
[
1 + 4θµ sin2(ϑ/2)
]
,
or
(1 − 2θ)µ sin2ϑ
2 ≤ 1
2.
Thus theθ-method (3.48) is stable if
(1 − 2θ)µ ≤ 1
2. (3.54)
In conclusion:
• The θ-method is unconditionally stable forθ ≥ 1/2
• When θ <1/2, the method is stable only if
µ = ∆t
∆x2 ≤ 1
2(1 − 2θ), θ ∈ [0, 1/2). (3.55)


## Page 95

3.8. The θ-Method 85
3.8.2. Accuracy order
We shall choose (xj,tn−1/2) for the expansion point in the following derivation
for the truncation error of theθ-method.
The arguments in §1.2 give
un
j −un−1
j
∆t =
[
ut +uttt
6
(∆t
2
)2
+ · · ·
]n−1/2
j
. (3.56)
Also from the section, we have
A1uℓ
j = −
[
uxx +uxxxx
12 ∆x2 + 2uxxxxxx
6! ∆x4 + · · ·
]ℓ
j
, ℓ =n − 1,n.
We now expand each term in the right side of the above equation in powers
of ∆t, about (xj,tn−1/2), to have
A1u
(n− 1
2)± 1
2
j = −
[
uxx +uxxxx
12 ∆x2 + 2uxxxxxx
6! ∆x4 + · · ·
]n−1/2
j
∓∆t
2
[
uxxt +uxxxxt
12 ∆x2 + 2uxxxxxxt
6! ∆x4 + · · ·
]n−1/2
j
−1
2
(∆t
2
)2[
uxxtt +uxxxxtt
12 ∆x2 + · · ·
]n−1/2
j
− · · ·.
(3.57)
It follows from (3.56) and (3.57) that
un
j −un−1
j
∆t + A1
[
θun
j + (1 −θ)un−1
j
]
= ut +uttt
6
(∆t
2
)2
+ O(∆t4)
−
(
uxx +uxxxx
12 ∆x2 + 2uxxxxxx
6! ∆x4 + · · ·
)
−∆t
2 (2θ − 1)
(
uxxt +uxxxxt
12 ∆x2 + 2uxxxxxxt
6! ∆x4 + · · ·
)
−1
2
(∆t
2
)2(
uxxtt +uxxxxtt
12 ∆x2 + · · ·
)
− · · ·,
(3.58)
of which the right side is evaluated at (xj,tn−1/2).


## Page 96

86 Chapter 3. Properties of Numerical Methods
So the truncation error Tu(:=Pu −P∆x,∆tu) turns out to be
Tun−1/2
j =
(
θ − 1
2
)
uxxt∆t +uxxxx
12 ∆x2 −uttt
24 ∆t2 +uxxtt
8 ∆t2
+
(
θ − 1
2
)uxxxxt
12 ∆t∆x2 + 2uxxxxxx
6! ∆x4 + · · ·
=
[(
θ − 1
2
)
∆t + ∆x2
12
]
uxxt + ∆t2
12 uttt
+
[(
θ − 1
2
)
∆t + ∆x2
12
]∆x2
12 uxxxxt −
( 1
122 − 2
6!
)
uxxxxxx∆x4 + · · ·,
(3.59)
where we have utilizedut =uxx +f.
Thus the accuracy order reads



O(∆t2 + ∆x2) when θ = 1
2,
O(∆t2 + ∆x4) when θ = 1
2 − ∆x2
12∆t,
O(∆t + ∆x2) otherwise.
(3.60)
Note that the second choice ofθ in (3.60) is less than 1/2, which is equivalent
to ∆t
∆x2 = 1
6(1 − 2θ).
Hence it satisﬁes (3.55); the method is stable and we can take large time steps
while maintaining accuracy and stability. For example, when∆x = ∆t = 0.01,
we haveθ = 1
2 − 1
1200 for the (2, 4)-accuracy scheme in time-space.


## Page 97

3.8. The θ-Method 87
3.8.3. Maximum principle
For heat conduction without interior sources/sinks, it is known mathemati-
cally and physically that the extreme values of the solution appear either in
the initial data or on the boundary. This property is called the maximum
principle.
• It is quite natural and sometimes very important to examine if the nu-
merical solution satisﬁes the maximum principle.
• Once the scheme satisﬁes the maximum principle, the solution will never
involve interior local extrema.


## Page 98

88 Chapter 3. Properties of Numerical Methods
Theorem 3.9. (Maximum principle for θ-method) Letf = 0 and the
θ-method be set satisfyingθ ∈ [0, 1] and
(1 −θ)µ ≤ 1
2. (3.61)
If the computed solution v has an interior maximum or minimum, then v
is constant.
Proof. We rewrite the component-wise expression of the θ-method, (3.52), in
the form
(1 + 2θµ)vn
j =θµ(vn
j−1 +vn
j+1) + (1 −θ)µ(vn−1
j−1 +vn−1
j+1 )
+[1 − 2(1 −θ)µ]vn−1
j .
(3.62)
Under the hypotheses of the theorem all coefﬁcients in the right side of the
above equation are nonnegative and sum to (1 + 2θµ). Hence this leads to
the conclusion that the interior point (xj,tn) can have a local maximum or
minimum only if all ﬁve neighboring points, related to the right side of (3.62),
have the same maximum or minimum value. The argument then implies that
v has the same value at all grid points including those on the boundary. This
completes the proof.


## Page 99

3.8. The θ-Method 89
3.8.4. Error analysis
Let
en
j =un
j −vn
j,
whereun
j =u(xj,tn) withu being the exact solution of (3.1). Deﬁne
En = max
j
|en
j |, T n−1/2 = max
j
|Tun−1/2
j |,
where Tun−1/2
j is the truncation error at (xj,tn−1/2) deﬁned in (3.59).
Theorem 3.10. Letθ ∈ [0, 1] and (1 −θ)µ ≤ 1
2 for theθ-method. Then,
En ≤ ∆t
n∑
k=1
T k−1/2. (3.63)
It follows from (3.63) that
En ≤ n∆t max
k
T k−1/2 ≤ T max
k
T k−1/2, (3.64)
whereT is the upper limit of the time variable.


## Page 100

90 Chapter 3. Properties of Numerical Methods
3.9. Homework
1. The energy method can be utilized to prove stability of the forward Euler
scheme forut −uxx = 0:
vn
j = µvn−1
j−1 + (1 − 2µ)vn−1
j +µvn−1
j+1 (3.65)
The analysis requires you to prove
∥vn∥2
∆x ≤ (1 +C∆t)2∥vn−1∥2
∆x, (3.66)
for some C ≥ 0. Prove it, assuming 1 − 2µ ≥ 0 and using the following
hint
• Start with squaring (3.65).
• Apply the inequality |ab| ≤ a2 +b2
2 .
• Use the observation
∑
j
|vn−1
j−1 |2 =
∑
j
|vn−1
j |2 =
∑
j
|vn−1
j+1 |2
2. Verify (3.37) and (3.38).
3. Use the arguments in the proof of Example 3.5 on page 64 to prove Theo-
rem 3.10.
4. This problem shows a different way of maximum principle for FD meth-
ods. Prove that the solution of the forward Euler method (3.5) satisﬁes
min
j
vn−1
j ≤vn
j ≤ max
j
vn−1
j (3.67)
whenf ≡ 0 andµ ≤ 1/2.
5. Consider the problem in (3.20):
ut −uxx = 0, (x,t ) ∈ [0, 1] × [0, 1],
u = 0, (x,t ) ∈ {0, 1} × [0, 1],
u = sin(πx), x ∈ [0, 1], t = 0
(3.68)
(a) Implement a code for the θ-method.
(b) Compare its performances for θ = 0, 1, 1/2.
Choose ∆x = 1/10, 1/20; set either ∆t = ∆x or ∆t to satisfy the stabil-
ity limit.


## Page 101

Chapter 4
Finite Difference Methods for Elliptic
Equations
This chapter introduces ﬁnite difference methods for elliptic PDEs deﬁned on
1-dimensional (1D), 2-dimensional (2D), or 3-dimensional (3D) regions.
91


## Page 102

92 Chapter 4. Finite Difference Methods for Elliptic Equations
4.1. Finite Difference (FD) Methods
Let Ω = (ax,bx) × (ay,by) in 2D space. Consider the model problem
(a) −∇ · (a∇u) +cu =f, x ∈ Ω
(b) auν +βu =g, x ∈ Γ, (4.1)
where the diffusivitya(x)> 0 and the coefﬁcientc(x) ≥ 0.
• When c ≡ 0 andβ ≡ 0, the problem (4.1) has inﬁnitely many solutions.
– Ifu(x) is a solution, so isu(x) +C, for ∀C ∈ R.
– Also we can see that the corresponding algebraic system is singular.
– The singularity is not a big issue in numerical simulation; one may
impose a Dirichlet condition at a grid point on the boundary.
• We may assume that (4.1) admits a unique solution.
To explain the main feature of the central FD method, we may start with
the problem (4.1) with the constant diffusivity, i.e.,a = 1.


## Page 103

4.1. Finite Difference (FD) Methods 93
4.1.1. Constant-coefﬁcient problems
Consider the following simpliﬁed problem (a ≡ 1):
−uxx −uyy +cu = f(x,y ), (x,y ) ∈ Ω,
uν +βu = g(x,y ), (x,y ) ∈ Γ, (4.2)
Furthermore, we may start with the 1D problem:
(a) −uxx +cu = f, x ∈ (ax,bx),
(b) −ux +βu = g, x =ax,
(c) ux +βu = g, x =bx.
(4.3)
Selectnx equally spaced grid points on the interval [ax,bx]:
xi =ax +ihx, i = 0, 1, · · ·,nx, h x = bx −ax
nx
.
Letui =u(xi) and recall (1.16) on page 10:
−uxx(xi) ≈ −ui−1 + 2ui −ui+1
h2x
+uxxxx(xi)
12 h2
x + · · ·. (4.4)


## Page 104

94 Chapter 4. Finite Difference Methods for Elliptic Equations
Apply the FD scheme for (4.3.a) to have
−ui−1 + (2 +h2
xc)ui −ui+1 =h2
xfi. (4.5)
However, we will meet ghost grid values at the end points. For example, at
the pointax =x0, the formula becomes
−u−1 + (2 +h2
xc)u0 −u1 =h2
xf0. (4.6)
Here the valueu−1 is not deﬁned and we call it a ghost grid value.
Now, let’s replace the value by using the boundary condition (4.3.b). Recall
the central FD scheme (1.15) forux atx0:
ux(x0) ≈ u1 −u−1
2hx
, Trunc.Err = −uxxx(x0)
6 h2
x + · · ·. (4.7)
Thus he equation (4.3.b) can be approximated (atx0)
u−1 + 2hxβu0 −u1 = 2hxg0. (4.8)
Hence it follows from (4.6) and (4.8) that
(2 +h2
xc + 2hxβ)u0 − 2u1 =h2
xf0 + 2hxg0. (4.9)
The same can be considered for the algebraic equation at the pointxn.


## Page 105

4.1. Finite Difference (FD) Methods 95
The problem (4.3) is reduced to ﬁnding the solution u1 satisfying
A1u1 = b1, (4.10)
where
A1 =


2 +h2
xc + 2hxβ −2
−1 2 + h2
xc −1
... ... ...
−1 2 + h2
xc −1
−2 2 + h2
xc + 2hxβ


,
and
b1 =


h2
xf0
h2
xf1
...
h2
xfnx−1
h2
xfnx


+


2hxg0
0
...
0
2hxgnx


.
Such a technique of removing ghost grid values is called outer bordering.
We can use it for the 2D problem (4.2) along the boundary grid points.
Symmetrization: The matrixA1 is not symmetric! You can symmetrize it
by dividing the ﬁrst and the last rows of[A1|b1] by 2. For the 2D problem, you
have to apply “division by 2" along each side of boundaries. (So, the algebraic
equations corresponding to the corner points would be divided by a total factor
of 4, for a symmetric algebraic system.)


## Page 106

96 Chapter 4. Finite Difference Methods for Elliptic Equations
4.1.2. General diffusion coefﬁcients
Let the 1D problem read
(a) −(aux)x +cu = f, x ∈ (ax,bx),
(b) −aux +βu = g, x =ax,
(c) aux +βu = g, x =bx.
(4.11)
The central FD scheme for (aux)x can be obtained as follows.
• The term (aux) can be viewed as a function and approximated as
(aux)x(xi) ≈ (aux)i+1/2 − (aux)i−1/2
hx
+ O(h2
x), (4.12)
where (aux)i+1/2 denotes the value of (aux) evaluated at xi+1/2 := (xi +
xi+1)/2.
• The terms (aux)i+1/2 and (aux)i−1/2 can be again approximated as
(aux)i+1/2 ≈ ai+1/2
ui+1 −ui
hx
−ai+1/2
uxxx(xi+1/2)
3!
(hx
2
)2
+ · · ·,
(aux)i−1/2 ≈ ai−1/2
ui −ui−1
hx
−ai−1/2
uxxx(xi−1/2)
3!
(hx
2
)2
+ · · ·.
(4.13)
• Combine the above two equations to have
−(aux)x(xi) ≈ −ai−1/2ui−1 + (ai−1/2 +ai+1/2)ui −ai+1/2ui+1
h2x
, (4.14)
of which the overall truncation error becomes O(h2
x). See Homework 4.1
on page 150.


## Page 107

4.1. Finite Difference (FD) Methods 97
Notes
• The y-directional approximation can be done in the same fashion.
• The reader should also notice that the quantities ai+1/2 evaluated at mid-
points are not available in general.
• We may replace it by the arithmetic/harmonic average of ai andai+1:
ai+1/2 ≈ ai +ai+1
2 or
[ 1
2
( 1
ai
+ 1
ai+1
)]−1
. (4.15)
• The harmonic average is preferred; the resulting system holds the con-
servation property. See §5.7.


## Page 108

98 Chapter 4. Finite Difference Methods for Elliptic Equations
4.1.3. FD schemes for mixed derivatives
The linear elliptic equation in its general form is given as
−∇ · (A(x)∇u) + b · ∇u +cu =f, x ∈ Ω ⊂ Rd, (4.16)
where 1 ≤d ≤ 3 and
−∇ · (A(x)∇u) = −
∑
i,j
∂
∂xi
(
aij(x)∂u
∂xj
)
.
Thus we must approximate the mixed derives whenever they appear.
As an example, we consider a second-order FD scheme for(aux)y on a mesh
of grid sizehx ×hy:
(aux)y(xpq) ≈ aux(xp,q+1) −aux(xp,q−1)
2hy
+ O(h2
y)
≈ ap,q+1(up+1,q+1 −up−1,q+1) −ap,q−1(up+1,q−1 −up−1,q−1)
4hxhy
+O(h2
x) + O(h2
y).
(4.17)
• There may involve difﬁculties in FD approximations when the diffusion
coefﬁcientA is a full tensor.
• Scalar coefﬁcients can also become a full tensor when coordinates are
changed.
4.1.4. L∞-norm error estimates for FD schemes
Let Ω be a rectangular domain in 2D and Γ =∂Ω. Consider
−∆u =f, x ∈ Ω,
u =g, x ∈ Γ, (4.18)
where x = (x,y ) = (x1,x 2) and
∆ = ∇ · ∇ = ∂2
∂x2 + ∂2
∂y2 = ∂2
∂x2
1
+ ∂2
∂x2
2
.


## Page 109

4.1. Finite Difference (FD) Methods 99
Let ∆h be the discrete ﬁve-point Laplacian:
∆hupq = (δ2
x +δ2
y)upq
:= up−1,q − 2upq +up+1,q
h2x
+up,q−1 − 2upq +up,q+1
h2y
.
(4.19)


## Page 110

100 Chapter 4. Finite Difference Methods for Elliptic Equations
Consistency: Let uh be the FD solution of (4.18), i.e.,
−∆huh =f, x ∈ Ωh,
uh =g, x ∈ Γh, (4.20)
where Ωh and Γh are the sets of grid points on Ω◦ and Γ, respectively. Note
that the exact solutionu of (4.18) satisﬁes
−∆hu =f + O(h2∂4u), x ∈ Ωh. (4.21)
Thus it follows from (4.20) and (4.21) that for someC >0 independent ofh,
∥∆h(u −uh)∥∞,Ωh ≤Ch2∥∂4u∥∞,Ωh, (4.22)
where ∥ · ∥∞,Ωh denotes the maximum norm measured on the grid points Ωh.


## Page 111

4.1. Finite Difference (FD) Methods 101
Convergence: We are more interested in an error estimate for (u −uh)
rather than for ∆h(u −uh). We begin with the following lemma.
Lemma 4.1. Let Ω is a rectangular domain and vh be a discrete function
deﬁned on a grid Ωh of Ω withvh = 0 on the boundary Γh. Then
∥vh∥∞,Ωh ≤C∥∆hvh∥∞,Ωh, (4.23)
for someC >0 independent onh.
Proof. Let the function fh be deﬁned as
fh := −∆hvh, x ∈ Ωh.
Then obviously
(a) ∥fh∥∞,Ωh = ∥∆hvh∥∞,Ωh,
(b) −∥fh∥∞,Ωh ≤ −∆hvh ≤ ∥fh∥∞,Ωh. (4.24)
Letˆx = (ˆx, ˆy) be the centroid of Ω and consider
wh(x) = 1
4 |x −ˆx|2 = 1
4
(
(x − ˆx)2 + (y − ˆy)2)
, x ∈ Ωh.
Then wh has its maximum on the boundary, bounded by a constant C > 0
independent onh, and
−∆hwh = −1, x ∈ Ωh.
So from (4.24.b) we have
−∆h(vh + ∥fh∥∞,Ωhwh) = −∆hvh − ∥fh∥∞,Ωh ≤ 0
and therefore from the discrete maximum principle for subharmonic func-
tions, Theorem B.7 on page 363,
vh + ∥fh∥∞,Ωhwh ≤ ∥fh∥∞,Ωh ∥wh∥∞,Γh ≤C ∥fh∥∞,Ωh.
Sincewh ≥ 0,
vh ≤C ∥fh∥∞,Ωh. (4.25)
The argument in the proof can be applied for the same conclusion, when vh is
replaced by −vh. Thus, (4.23) follows from (4.24.a) and (4.25).


## Page 112

102 Chapter 4. Finite Difference Methods for Elliptic Equations
Clearly, (u −uh) in (4.22) can be considered as a discrete function on the
unit square with u −uh = 0 on Γh. Therefore, with a aid of Lemma 4.1, one
can conclude
Theorem 4.2. Letu anduh be the solutions of (4.18) and (4.20), respectively.
Then
∥u −uh∥∞,Ωh ≤Ch2∥∂4u∥∞,Ωh, (4.26)
for someC >0 independent on the grid sizeh.


## Page 113

4.1. Finite Difference (FD) Methods 103
Generalization: The above theorem can be expanded for more general
elliptic problems of the form
Lu := −∇ · (A(x)∇u) + b(x) · ∇u =f, x ∈ Ω,
u =g, x ∈ Γ, (4.27)
whereA(x) = diag(a11(x),a 22(x)).
LetLh be the ﬁve-point central discretization ofL anduh be the solution of
Lhuh =f, x ∈ Ωh,
uh =g, x ∈ Γh. (4.28)
Theorem 4.3. Letu anduh be the solutions of (4.27) and (4.28), respectively.
Assumeh is sufﬁciently small for the case b ̸= 0. Then
∥u −uh∥∞,Ωh ≤Ch2, (4.29)
for someC =C(Ω,∂ 3u,∂ 4u)> 0 independent on the grid sizeh.


## Page 114

104 Chapter 4. Finite Difference Methods for Elliptic Equations
Proof. Note that
Lhu =f + O(h2),
Lhuh =f, x ∈ Ωh.
Thus, we have
∥Lh(u −uh)∥∞,Ωh ≤Ch2, (4.30)
for someC >0 independent onh. Now, follow the same arguments utilized in
Lemma 4.1, with Theorem B.7 replaced by Theorem B.8, to get
∥vh∥∞,Ωh ≤C∥Lhvh∥∞,Ωh, (4.31)
for discrete functions vh such that vh = 0 on Γh. The inequality (4.29) follows
from (4.30) and (4.31) withvh =u −uh.


## Page 115

4.1. Finite Difference (FD) Methods 105
4.1.5. The Algebraic System for FDM
Let Ω = [ax,bx] × [ay,by] and Γ =∂Ω. Consider (4.18):
−∆u =f, x ∈ Ω,
u =g, x ∈ Γ. (4.32)
Deﬁne, for some positive integersnx, ny,
hx = bx −ax
nx
, h y = by −ay
ny
and
xp =ax +phx, p = 0, 1, · · ·,nx
yq =ay +qhy, q = 0, 1, · · ·,ny
Let ∆h be the discrete ﬁve-point Laplacian (4.19):
∆hupq = (δ2
x +δ2
y)upq
:= up−1,q − 2upq +up+1,q
h2x
+up,q−1 − 2upq +up,q+1
h2y
.
(4.33)


## Page 116

106 Chapter 4. Finite Difference Methods for Elliptic Equations
Then, when the grid points are ordered row-wise, the algebraic system for
the FDM reads
Au = b, (4.34)
where
A =


B −I/h2
y 0
−I/h2
y B −I/h2
y
... ... ...
−I/h2
y B −I/h2
y
0 −I/h2
y B


(4.35)
withI being the identity matrix of dimension nx − 1 andB being a matrix of
ordernx − 1 given by
B =


d −1/h2
x 0
−1/h2
x d −1/h2
x
... ... ...
−1/h2
x d −1/h2
x
0 −1/h2
x d


(4.36)
whered = 2
h2x
+ 2
h2y
.
On the other hand,
bpq = fpq +gp−1,q
h2x
δp−1,0 +gp+1,q
h2x
δp+1,nx
+gp,q−1
h2y
δq−1,0 +gp,q+1
h2y
δq+1,ny
(4.37)
Here, the global point index for the row-wise ordering of the interior points,
i = 0, 1, 2, · · ·, becomes
i = (q − 1) ∗ (nx − 1) +p − 1 (4.38)


## Page 117

4.1. Finite Difference (FD) Methods 107
Saving and managing the algebraic system
• For the FDM we just considered, the total number of interior nodal points
is
(nx − 1) ∗ (ny − 1)
Thus, you may try to open the matrix and other arrays based on this
number.
• Saving nonzero entries only, the matrix A can be stored in an array of the
form
A[M][5] or A[ny − 1][nx − 1][5], (4.39)
whereM = (nx − 1) ∗ (ny − 1).
• However, it is often more convenient when the memory objects are opened
incorporating all the nodal points (including those on boundaries). You
may open the matrix as
A[ny + 1][nx + 1][5]. (4.40)


## Page 118

108 Chapter 4. Finite Difference Methods for Elliptic Equations
• The matrix A in (4.35) can be saved, in Python, as
rx, ry = 1/hx**2, 1/hy**2
d = 2*(rx+ry)
for q in range(1,ny):
for p in range(1,nx):
A[q][p][0] = -ry
A[q][p][1] = -rx
A[q][p][2] = d
A[q][p][3] = -rx
A[q][p][4] = -ry
• Let the solution vector u be opened in u[ny+1][nx+1] and initialized
along the boundaries. Then, the Gauss-Seidel iteration can be carried
out as
import numpy as np; import copy
from numpy import abs,sqrt,pi,sin,cos
# the Jacobi matrix
T = copy.deepcopy(A) # np.ndarray((ny+1,nx+1,5),float)
for q in range(1,ny):
for p in range(1,nx):
for c in [0,1,3,4]:
T[q][p][c] = -T[q][p][c]/T[q][p][2]
# A function for the Gauss-Seidel iteration
def Gauss_Seidel(T,u,itmax=1):
ny,nx = leng(u)-1, len(u[0])-1
for it in range(0,itmax):
for q in range(1,ny):
for p in range(1,nx):
u[q][p] = T[q][p][0]*u[q-1][p] \
+T[q][p][1]*u[q][p-1] \
+T[q][p][3]*u[q][p+1] \
+T[q][p][4]*u[q+1][p]


## Page 119

4.2. Solution of Linear Algebraic Systems 109
4.2. Solution of Linear Algebraic Systems
In this section, we consider solution methods for the following linear system
Ax = b, (4.41)
where A ∈ Cn×n and b ∈ Cn. In most applications of PDEs, the matrix A
is real-valued and sparse. By being sparse we mean that a large portion of
entries inA is zero. For example, the maximum number of nonzero entries in
a row is ﬁve for the central FD application to the Poisson equation in 2D.


## Page 120

110 Chapter 4. Finite Difference Methods for Elliptic Equations
4.2.1. Direct method: the LU factorization
Let the matrix
A = [aij]
be factorized intoLU, where
L = [lij], U = [uij]
are respectively lower and upper triangular matrices withlii = 1.
Then (4.41) reads
Ax =LU x = b, (4.42)
which can be solved by
Ly = b,
U x = y, (4.43)
by the forward elimination and backward substitution.


## Page 121

4.2. Solution of Linear Algebraic Systems 111
The LU factorization can be carried out by the Gauss elimination proce-
dure. DeﬁneA(1) = [a(1)
ij ] = [aij] and
A(k) =


a(k)
11 a(k)
12 · · · · · · · · · a(k)
1n
a(k)
22 · · · · · · · · · a(k)
2n
... · · · · · · ...
a(k)
kk · · · a(k)
kn
0 a(k)
k+1,k · · · a(k)
k+1,n
... ... ...
a(k)
nk · · · a(k)
nn


. (4.44)
Using the Gauss elimination procedure, A(k+1) and the entries of L can be
determined as
a(k+1)
ij =
{
a(k)
ij −
(
a(k)
ik
/
a(k)
kk
)
a(k)
kj, for i =k + 1, · · ·,n, j =k, · · ·,n,
a(k)
ij , else,
lkk = 1,
lik =a(k)
ik
/
a(k)
kk, i =k + 1, · · ·,n.
(4.45)
Then, ﬁnally
U =A(n) = [a(n)
ij ]. (4.46)


## Page 122

112 Chapter 4. Finite Difference Methods for Elliptic Equations
The above procedure can be summarized into the following pseudocode:
Fork = 1 ton − 1

Fori =k + 1 ton

mi ←aik/akk ;
ifmi = 0, continue ;
aik ←mi ;
Forj =k + 1 ton[
aij ←aij −miakj ;
(4.47)
In the output of the algorithm, the upper part including the main diagonal
becomesU, while its strictly lower part is the corresponding part ofL.
Algorithm (4.47) should be modiﬁed to incorporate the so-calledpartial piv-
oting when a pivotakk is expected to be zero or small in modulus.


## Page 123

4.2. Solution of Linear Algebraic Systems 113
The LU factorization with partial pivoting must look like the following:
Fork = 1 ton − 1

amax ← 0 ; imax ← 0 ; /*find pivot*/
Fori =k ton[ if (|aik|>a max)[
amax ← |aik| ; imax ←i ;
if (imax = 0) stop ; /*A is singular*/
if (imax ̸=k)

forj = 1 ton /*row interchange*/

tmp ←akj ;
akj ←aimax,j ;
aimax,j ← tmp ;
itmp ← intch[k] ; /*save interchange*/
intch[k] ← intch[imax] ;
intch[imax] ← itmp ;
Fori =k + 1 ton /*row operations*/

mi ←aik/akk ;
ifmi = 0, continue ;
aik ←mi ;
Forj =k + 1 ton[
aij ←aij −miakj ;
(4.48)
In the above algorithm, the array “intch" must be initialized in advance
intch[i]=i. You can use the array resulting from (4.48) to reorder the en-
tries of the right-hand side b. That is,
b[i] ← b[intch[i]], i = 1, · · ·,n


## Page 124

114 Chapter 4. Finite Difference Methods for Elliptic Equations
Banded matrices: For a square matrixA = [aij], if
aij = 0 for |i −j|>d, ∀i,j,
the matrix is called to be banded with the bandwidthd.
• In most applications with the numerical solution of PDEs, the algebraic
system is banded.
• For banded matrices, the LU factorization algorithms presented in (4.47)
and (4.48) can be easily modiﬁed. For example, for the algorithm (4.47),
simply replace the integers n appeared as the last indices of the i- and
j-loops by min(n,k +d).


## Page 125

4.2. Solution of Linear Algebraic Systems 115
4.2.2. Linear iterative methods
Basic concepts : For solving linear algebraic systems, linear iterative
methods begin with splitting the matrixA by
A =M −N, (4.49)
for some invertible matrixM.
Then, the linear system equivalently reads
M x =N x + b. (4.50)
Associated with the splitting is an iterative method
M xk =N xk−1 + b, (4.51)
or, equivalently,
xk =M −1(N xk−1 + b) = xk−1 +M −1(b −Axk−1), (4.52)
for an initial value x0.
Notes:
• Methods differ for different choices of M.
• M must be easy to invert (efﬁciency) and
M −1 ≈A−1 (convergence).


## Page 126

116 Chapter 4. Finite Difference Methods for Elliptic Equations
4.2.3. Convergence theory
Let
ek = x − xk;
from (4.50) and (4.51), we obtain the error equation
M ek =N ek−1
or, equivalently,
ek =M −1N ek−1. (4.53)
Since
∥ek∥ ≤ ∥ M −1N ∥ · ∥ek−1∥
≤ ∥ M −1N ∥2 · ∥ek−2∥
...
≤ ∥ M −1N ∥k · ∥e0∥,
(4.54)
a sufﬁcient condition for the convergence is
∥M −1N ∥< 1. (4.55)
Letσ(B) be the spectrum, the set of eigenvalues of the matrix B, andρ(B)
denote the spectral radius deﬁned by
ρ(B) = max
λi∈σ(B)
|λi|.
Theorem 4.4. The iteration converges if and only if
ρ(M −1N)< 1. (4.56)


## Page 127

4.2. Solution of Linear Algebraic Systems 117
Graph theory for the estimation of the spectral
radius
Deﬁnition 4.5. A permutation matrix is a square matrix in which each
row and each column has one entry of unity, all others zero.
Deﬁnition 4.6. Forn ≥ 2, ann ×n complex-valued matrixA is reducible if
there is a permutation matrixP such that
PAP T =
[ A11 A12
0 A22
]
,
where A11 and A22 are respectively r ×r and (n −r) × (n −r) submatrices,
0<r <n . If no such permutation matrix exists, thenA is irreducible.
The geometrical interpretation of the concept of the irreducibility by means
of graph theory is useful.


## Page 128

118 Chapter 4. Finite Difference Methods for Elliptic Equations
Geometrical interpretation of irreducibility
Figure 4.1: The directed paths for nonzero aii andaij.
Figure 4.2: The directed graph G(A) forA in (4.57).
• Given A = (aij) ∈ Cn×n, considern distinct points
P1,P 2, · · ·,Pn
in the plane, which we will call nodes or nodal points.
• For any nonzero entry aij of A, we connect Pi to Pj by a path
− →
PiPj, di-
rected from the nodePi to the nodePj; a nonzeroaii is joined to itself by a
directed loop, as shown in Figure 4.1.
• In this way, every n ×n matrixA can be associated a directed graphG(A).
For example, the matrix
A =


2 −1 0
−1 2 −1
0 −1 2

 (4.57)
has a directed graph shown in Figure 4.2.


## Page 129

4.2. Solution of Linear Algebraic Systems 119
Deﬁnition 4.7. A directed graph is strongly connected if, for any ordered
pair of nodes (Pi,Pj), there is a directed path of a ﬁnite length
− →
PiPk1,
− →
Pk1Pk2, · · ·,
− →
Pkr−1Pkr=j,
connecting fromPi toPj.
The theorems to be presented in this subsection can be found in [68] along
with their proofs.
Theorem 4.8. Ann ×n complex-valued matrixA is irreducible if and only if
its directed graphG(A) is strongly connected.
It is obvious that the matrices obtained from FD/FE methods of the Poisson
equation are strongly connected. Therefore the matrices are irreducible.


## Page 130

120 Chapter 4. Finite Difference Methods for Elliptic Equations
Eigenvalue locus theorem
ForA = [aij] ∈ Cn×n, let
Λi :=
n∑
j = 1
j ̸=i
|aij|
Theorem 4.9. (Eigenvalue locus theorem) LetA = [aij] be an irreducible
n ×n complex matrix. Then,
1. (Gerschgorin [25]) All eigenvalues of A lie in the union of the disks in
the complex plane
|z −aii| ≤ Λi, 1 ≤i ≤n. (4.58)
2. (Taussky [65]) In addition, assume that λ, an eigenvalue of A, is a
boundary point of the union of the disks |z −aii| ≤ Λi. Then, all the n
circles |z −aii| = Λi must pass through the point λ, i.e., |λ −aii| = Λi for
all 1 ≤i ≤n.
For example, for
A =


2 −1 0
−1 2 −1
0 −1 2


Λ1 = 1, Λ2 = 2, and Λ3 = 1. Since aii = 2, fori = 1, 2, 3,
|λ − 2|< 2
for all eigenvaluesλ ofA.


## Page 131

4.2. Solution of Linear Algebraic Systems 121
Positiveness
Deﬁnition 4.10. An n ×n complex-valued matrix A = [aij] is diagonally
dominant if
|aii| ≥ Λi :=
n∑
j = 1
j ̸=i
|aij|, (4.59)
for all 1 ≤i ≤n. An n ×n matrixA is irreducibly diagonally dominant ifA is
irreducible and diagonally dominant, with strict inequality holding in (4.59)
for at least onei.
Theorem 4.11. LetA be ann ×n strictly or irreducibly diagonally dominant
complex-valued matrix. Then, A is nonsingular. If all the diagonal entries of
A are in addition positive real, then the real parts of all eigenvalues of A are
positive.
Corollary 4.12. A Hermitian matrix satisfying the conditions in Theorem 4.11
is positive deﬁnite.
Corollary 4.13. The FD/FE matrices from diffusion equations (including the
Poisson equation) are positive deﬁnite, when it is symmetric.


## Page 132

122 Chapter 4. Finite Difference Methods for Elliptic Equations
Regular splitting and M-matrices
Deﬁnition 4.14. For n ×n real matrices, A, M, and N, A = M −N is a
regular splitting ofA ifM is nonsingular withM −1 ≥ 0, andN ≥ 0.
Theorem 4.15. IfA =M −N is a regular splitting ofA andA−1 ≥ 0, then
ρ(M −1N) = ρ(A−1N)
1 +ρ(A−1N) < 1. (4.60)
Thus, the matrix M −1N is convergent and the iterative method of (4.51) con-
verges for any initial value x0.
Deﬁnition 4.16. Ann ×n real matrixA = [aij] withaij ≤ 0 for alli ̸=j is an
M-matrix ifA is nonsingular andA−1 ≥ 0.
Theorem 4.17. LetA = (aij) be ann ×nM -matrix. If M is anyn ×n matrix
obtained by setting certain off-diagonal entries of A to zero, then A =M −N
is a regular splitting ofA andρ(M −1N)< 1.
Theorem 4.18. LetA be ann×n real matrix withA−1> 0, andA =M1−N1 =
M2 −N2 be two regular splittings of A. If N2 ≥N1 ≥ 0, where neitherN2 −N1
norN1 is null, then
1>ρ (M −1
2 N2)>ρ (M −1
1 N1)> 0. (4.61)
4.2.4. Relaxation methods
We ﬁrst expressA = (aij) as the matrix sum
A =D −E −F, (4.62)
where
D = diag(a11,a 22, · · ·,ann),
E = (eij), e ij =
{ −aij, ifi>j,
0, else,
F = (fij), f ij =
{ −aij, ifi<j,
0, else.


## Page 133

4.2. Solution of Linear Algebraic Systems 123
Then, a relaxation method can be formulated by selecting M and N for a
regular splitting:
A =M −N (4.63)
Popular examples are
Table 4.1: Relaxation methods
Methods M N
Jacobi method D E +F
Gauss-Seidel method D −E F
SOR method 1
ωD −E 1 −ω
ω D +F
Richardson method I I −A
SOR stands for Successive Over Relaxation.


## Page 134

124 Chapter 4. Finite Difference Methods for Elliptic Equations
Jacobi method
It is formulated as
Dxk = (E +F )xk−1 + b, (4.64)
which is the same as choosing
M =D, N =E +F
Thei-th component of (4.64) reads
aiixk
i = −
i−1∑
j=1
aijxk−1
j −
n∑
j=i+1
aijxk−1
j +bi
or, equivalently,
xk
i =
(
bi −
i−1∑
j=1
aijxk−1
j −
n∑
j=i+1
aijxk−1
j
)/
aii, (4.65)
fori = 1, · · ·,n .


## Page 135

4.2. Solution of Linear Algebraic Systems 125
Gauss-Seidel method
For the choice
M =D −E, N =F,
we obtain the Gauss-Seidel method:
(D −E)xk =F xk−1 + b. (4.66)
Itsi-th component reads
i∑
j=1
aijxk
j =
n∑
j=i+1
−aijxk−1
j +bi,
which is equivalent to
xk
i =
(
bi −
i−1∑
j=1
aijxk
j −
n∑
j=i+1
aijxk−1
j
)/
aii, i = 1, · · ·,n. (4.67)
Note:
• The difference of the Gauss-Seidel method (4.67) out of the Jacobi method
(4.65) is to utilize the updated valuesxk
j,j = 1, · · ·,i − 1.s
• It makes the method converge or diverge twice faster asymptotically.


## Page 136

126 Chapter 4. Finite Difference Methods for Elliptic Equations
Successive over-relaxation (SOR) method
Now, we consider the third basic linear iterative method for solvingAx = b.
Choose
M = 1
ωD −E, N = 1 −ω
ω D +F, ω ∈ (0, 2),
whereω is called the relaxation parameter which is often set larger than one.
With the splitting, the SOR method can be formulated as
(D −ωE)xk =
[
(1 −ω)D +ωF
]
xk−1 +ωb. (4.68)
Since the above equation equivalently reads
Dxk = (1 −ω)Dxk−1 +ω
(
b +Exk +F xk−1)
,
thei-th component of SOR becomes
xk
GS,i =
(
bi −
i−1∑
j=1
aijxk
j −
n∑
j=i+1
aijxk−1
j
)/
aii,
xk
i = (1 −ω)xk−1
i +ωxk
GS,i.
(4.69)
fori = 1, · · ·,n. Note that SOR turns out to be the Gauss-Seidel method when
ω = 1.


## Page 137

4.2. Solution of Linear Algebraic Systems 127
Convergence of relaxation methods
LetB, L1, and Lω be respectively the iteration matrices of the Jacobi, Gauss-
Seidel, and SOR methods. That is,
B =D−1(E +F ), L1 = (D −E)−1F,
Lω = (D −ωE)−1[
(1 −ω)D +ωF
]
.
Theorem 4.19. (Stein and Rosenberg [62]) On and only one of the follow-
ing mutually exclusive relations is valid:
1. ρ(B) =ρ(L1) = 0,
2. 0<ρ (L1)<ρ (B)< 1,
3. ρ(B) =ρ(L1) = 1,
4. 1<ρ (B)<ρ (L1).
(4.70)
Thus the Jacobi and Gauss-Seidel methods are either both convergent or both
divergent.
Theorem 4.20. (Ostrowski [55]) LetA =D −E −E∗ be ann ×n Hermitian
matrix, whereD is Hermitian and positive deﬁnite andD −ωE is nonsingular
for 0 ≤ω ≤ 2. Then,
ρ(Lω)< 1 ⇐ ⇒A is positive deﬁnite & 0<ω < 2. (4.71)
Note that the matricesD andE in Ostrowski’s theorem need not to be diago-
nal and strictly lower triangular matrices.


## Page 138

128 Chapter 4. Finite Difference Methods for Elliptic Equations
Optimal parameter for SOR: For algebraic systems of good proper-
ties, it is theoretically known that the convergence of SOR can be optimized
when
ω = 2
1 +
√
1 −ρ(B)
, (4.72)
whereB is the Jacobi iteration matrix.
However, in most cases you can ﬁnd a better parameter for a given algebraic
system.


## Page 139

4.2. Solution of Linear Algebraic Systems 129
4.2.5. Line relaxation methods
• The standard Jacobi, Gauss-Seidel, and SOR schemes are called point
relaxation methods.
• We can compute a whole line of new values using a direct method, e.g.,
Gauss elimination.
• this leads to line relaxation methods.
Algebraic interpretation: As in §4.1.5, consider
−∆u =f, x ∈ Ω,
u =g, x ∈ Γ, (4.73)
where Ω is a rectangular domain in R2, and its discrete ﬁve-point Laplacian
∆hupq = (δ2
x +δ2
y)upq
:= up−1,q − 2upq +up+1,q
h2x
+up,q−1 − 2upq +up,q+1
h2y
.
(4.74)


## Page 140

130 Chapter 4. Finite Difference Methods for Elliptic Equations
Then, for the column-wise point ordering, the algebraic system for the FDM
reads
Au = b, (4.75)
where
A =


C −I/h2
x 0
−I/h2
x C −I/h2
x
... ... ...
−I/h2
x C −I/h2
x
0 −I/h2
x C


(4.76)
withI being the identity matrix of dimension ny − 1 andC being a matrix of
ordernx − 1 given by
C =


d −1/h2
y 0
−1/h2
y d −1/h2
y
... ... ...
−1/h2
y d −1/h2
y
0 −1/h2
y d


(4.77)
whered = 2
h2x
+ 2
h2y
.
• A line relaxation method can be viewed as a (standard) relaxation method
which deals with the matrixC like a single entry of a tridiagonal matrix.
• Once a point relaxation method converges, its line method converges
twice faster asymptotically.
• Line methods can employ the line solver in alternating directions of (x,y ).


## Page 141

4.2. Solution of Linear Algebraic Systems 131
Convergence comparison: For (4.73) on p.129, we choose
Ω = (0, 1)2, n =nx =ny.
The following table includes the spectral radii of iteration matrices ρ(T ) and
the required iteration counts k for the convergence to satisfy the tolerance
∥ek∥
/
∥e0∥< 10−6.
Table 4.2: Convergence comparison
Point Jacobi Line Jacobi Point GS Line GS
n ρ (T ) k ρ (T ) k ρ (T ) k ρ (T ) k
5 0.8090 66 0.6793 36 0.6545 33 0.4614 18
10 0.9511 276 0.9067 142 0.9045 138 0.8221 71
20 0.9877 1116 0.9757 562 0.9755 558 0.9519 281
40 0.9969 4475 0.9939 2241 0.9938 2238 0.9877 1121
Final remarks for relaxation methods
• GS methods converge asymptotically twice faster than Jacobi methods, in
either point or line iterations. SOR is yet faster and the line SOR is again
twice faster.
• Relaxation methods sweep over either points or groups of points. For a
faster convergence, you may let them visit the points in an order followed
by the opposite order.
• For line methods, the tridiagonal matrix can be stored in a 3-column ar-
ray, instead of a square big-fat array.


## Page 142

132 Chapter 4. Finite Difference Methods for Elliptic Equations
4.3. Krylov Subspace Methods
We consider Krylov subspace methods for solving
Ax = b, (4.78)
whenA is symmetric positive deﬁnite.
Given an initial guess x0 ∈ Rn, ﬁnd successive approximations xk ∈ Rn of
the form
xk+1 = xk +αkpk, k = 0, 1, · · ·, (4.79)
where pk is the search direction andαk > 0 is the step length. Different meth-
ods differ in the choice of the search direction and the step length.
In this section, we consider the gradient method (also known as the
steepest descent method, or the Richardson’s method), the conjugate gra-
dient (CG) method , and preconditioned CG method . For other Krylov
subspace methods, see e.g. [3, 33].
Note that (4.78) admits a unique solution x ∈ Rn, which is equivalently
characterized by
minη∈Rn
f(η), f(η) = 1
2η ·Aη − b ·η, (4.80)
where a · b = aT b.


## Page 143

4.3. Krylov Subspace Methods 133
4.3.1. Steepest descent method
We denote the gradient and Hessian off byf ′ andf ′′, respectively:
f ′(η) =Aη − b, f ′′(η) =A.
Given xk+1 as in (4.79), we have by Taylor’s formula
f(xk+1) = f(xk +αkpk)
= f(xk) +αkf ′(xk) · pk +α2
k
2 pk ·f ′′(ξ)pk,
for someξ. Since the element off ′′ is bounded (As a matter of fact, we assumed
it!),
f(xk+1) =f(xk) +αkf ′(xk) · pk + O(α2
k), as αk → 0.
The goal: to ﬁnd pk andαk such that
f(xk+1)<f (xk),
which can be achieved if
f ′(xk) · pk < 0 (4.81)
andαk is sufﬁciently small.
Choice: (4.81) holds if we choose, when f ′(xk) ̸= 0,
pk = −f ′(xk) = b −Axk =: rk (4.82)


## Page 144

134 Chapter 4. Finite Difference Methods for Elliptic Equations
Optimal step length: We may determineαk such that
f(xk +αkpk) = min
α
f(xk +αpk),
in which caseαk is said to be optimal. If αk is optimal, then
0 = d
dαf(xk +αpk)
⏐⏐⏐⏐
α=αk
=f ′(xk +αkpk) · pk
= ( A(xk +αkpk) − b) · pk
= ( Axk − b) · pk +αkpk ·Apk.
So,
αk = rk · pk
pk ·Apk
. (4.83)
Convergence of the steepest descent method : For the method, the fol-
lowing is known
∥ x − xk ∥2 ≤
(
1 − 1
κ(A)
)k
∥ x − x0 ∥2. (4.84)
Thus, the number of iterations required to reduce the error by a factor of ε is
in the order of the condition number ofA:
k ≥ κ(A) log 1
ε. (4.85)
Deﬁnition 4.21. The condition number of a matrixA is
κ(A) = ∥A∥ · ∥A−1∥, (4.86)
for a matrix norm.


## Page 145

4.3. Krylov Subspace Methods 135
4.3.2. Conjugate gradient (CG) method
In this method the search directions pk are conjugate, i.e.,
pi ·Apj = 0, i ̸=j,
and the step lengthαk is chosen to be optimal.
The following is the original version of the CG method.
CG Algorithm, V.1
Select x0, ε;
r0 = b −Ax0, p0 = r0;
Dok = 0, 1, · · ·
αk = rk · pk/pk ·Apk; (CG1)
xk+1 = xk +αkpk; (CG2)
rk+1 = rk −αkApk; (CG3)
if ∥ rk+1 ∥2<ε ∥ r0 ∥2, stop;
βk = −rk+1 ·Apk/pk ·Apk; (CG4)
pk+1 = rk+1 +βkpk; (CG5)
End Do
(4.87)
Remarks:
• αk in (CG1) is designed such that rk+1 · pk = 0. You may easily verify it
using rk+1 in (CG3).
• rk = b −Axk, by deﬁnition. So,
rk+1 = b −Axk+1 = b −A(xk +αkpk)
= b −Axk −αkApk = rk −αkApk,
which is (CG3).
• βk in (CG4) is determined such that pk+1 ·Apk = 0. Verify it using pk+1 in
(CG5).
• The CG method ﬁnds the iterate
xk ∈ x0 + span{r0,A r0, · · ·,Ak−1r0}
so that (x − xk) ·A(x − xk) is minimized.


## Page 146

136 Chapter 4. Finite Difference Methods for Elliptic Equations
Theorem 4.22. Form = 0, 1, · · ·,
span{p0, · · ·, pm} = span {r0, · · ·, rm}
= span {r0,A r0, · · ·,Amr0}. (4.88)
Theorem 4.23. The search directions and the residuals satisfy the orthogo-
nality,
pi ·Apj = 0; ri · rj = 0, i ̸=j. (4.89)
Theorem 4.24. For somem ≤n, we haveAxm =b and
∥ x − xk ∥A ≤ 2
(√
κ(A) − 1√
κ(A) + 1
)k
∥ x − x0 ∥A. (4.90)
So the required iteration number to reduce the error by a factor ofε is
k ≥ 1
2
√
κ(A) log 2
ε. (4.91)
Proofs of the above theorems can be found in e.g. [32].


## Page 147

4.3. Krylov Subspace Methods 137
Simpliﬁcation of the CG method : Using the properties and iden-
tities involved in the method, one can derive a more popular form of the CG
method.
CG Algorithm, V.2
Select x0, ε;
r0 = b −Ax0, p0 = r0;
Computeρ0 = r0 · r0;
Dok = 0, 1, · · ·
αk =ρk/pk ·Apk;
xk+1 = xk +αkpk;
rk+1 = rk −αkApk;
if ∥ rk+1 ∥2<ε ∥ r0 ∥2, stop;
ρk+1 = rk+1 · rk+1;
βk =ρk+1/ρk;
pk+1 = rk+1 +βkpk;
End Do
(4.92)
Note:
rk · pk = rk · (rk +βk−1pk−1) = rk · rk,
βk = −rk+1 ·Apk/pk ·Apk = −rk+1 ·Apk
αk
ρk
= rk+1 · (rk+1 − rk)/ρk =ρk+1/ρk.


## Page 148

138 Chapter 4. Finite Difference Methods for Elliptic Equations
4.3.3. Preconditioned CG method
The condition number of A is the critical point for the convergence of the CG
method. If we can ﬁnd a matrixM such that
M ≈A
and it is easy to invert, we may try to apply the CG algorithm to the following
system
M −1Ax =M −1b. (4.93)
Since
κ(M −1A) ≪κ(A) (4.94)
(hopefully,κ(M −1A) ≈ 1), the CG algorithm will converge much faster.


## Page 149

4.3. Krylov Subspace Methods 139
In practice, we do not have to multiplyM −1 to the original algebraic system
and the algorithm can be implemented as
Preconditioned CG
Select x0, ε;
r0 = b −Ax0, Mz0 = r0;
p0 = z0, computeρ0 = z∗
0r0;
Dok = 0, 1, · · ·
αk =ρk/p∗
kApk;
xk+1 = xk +αkpk;
rk+1 = rk −αkApk;
if ∥ rk+1 ∥2<ε ∥ r0 ∥2, stop;
M zk+1 = rk+1;
ρk+1 = z∗
k+1rk+1;
βk =ρk+1/ρk;
pk+1 = zk+1 +βkpk;
End Do
(4.95)
Here the superscript * indicates the transpose complex-conjugate; it is the
transpose for real-valued systems.


## Page 150

140 Chapter 4. Finite Difference Methods for Elliptic Equations
4.4. Other Iterative Methods
4.4.1. Incomplete LU-factorization
Here, we introduce Stone’s strongly implicit procedure (SIP) [63] to solve
the following linear system
Ax = b. (4.96)
As for other iterative methods, SIP is based on a regular splitting , A =
M −N, withM being an incompleteLU (ILU) factorization;
M =LIUI =A +N, (4.97)
whereLI andUI are respectively the lower and upper triangular components
of the ILU factorization ofA, where the entries of the main diagonal ofUI are
all one.
The iteration corresponding to the splitting (4.97) is formulated as
LIUIxk = N xk−1 + b, (4.98)
or, sinceN =LIUI −A,
(a) rk−1 = b −Axk−1,
(b) LIUIδk = rk−1,
(c) xk = xk−1 +δk.
(4.99)
The iteration (4.98) converges fast, when we choose elements of LI andUI in
a way thatN is as small as possible.


## Page 151

4.4. Other Iterative Methods 141
Figure 4.3: Systematic presentation of LIUI = M. The subscripts S, W, E,
N, and C denote respectively south, west, east, north, and center. Note that
diagonals ofM marked by subscriptsSE andNW are not found inA.
Derivation of SIP : For a 2D problem in a rectangular mesh where the
grid points are ordered in the row-wise manner, the ILU factorization is in
the form as in Figure 4.3 and the row ofM corresponding to the (ℓ,m )-th grid
point is given as
Mℓ,m
S = Lℓ,m
S ,
Mℓ,m
SE = Lℓ,m
S Uℓ,m−1
E ,
Mℓ,m
W = Lℓ,m
W ,
Mℓ,m
C = Lℓ,m
S Uℓ,m−1
N +Lℓ,m
W Uℓ−1,m
E +Lℓ,m
C ,
Mℓ,m
E = Lℓ,m
C Uℓ,m
E ,
Mℓ,m
NW = Lℓ,m
W Uℓ−1,m
N ,
Mℓ,m
N = Lℓ,m
C Uℓ,m
N .
(4.100)


## Page 152

142 Chapter 4. Finite Difference Methods for Elliptic Equations
The (ℓ,m )-th component ofN x is
(N x)ℓ,m = Nℓ,m
C xℓ,m +Nℓ,m
S xℓ,m−1 +Nℓ,m
W xℓ−1,m +Nℓ,m
E xℓ+1,m
+Nℓ,m
N xℓ,m+1 +Mℓ,m
SExℓ+1,m−1 +Mℓ,m
NWxℓ−1,m+1.
(4.101)
By utilizing the approximations
xℓ+1,m−1 ≈ α(xℓ,m−1 +xℓ+1,m −xℓ,m),
xℓ−1,m+1 ≈ α(xℓ,m+1 +xℓ−1,m −xℓ,m), 0<α ≤ 1, (4.102)
we can rewrite (4.101) as
(N x)ℓ,m ≈ (Nℓ,m
C −αMℓ,m
SE −αMℓ,m
NW )xℓ,m
+(Nℓ,m
S +αMℓ,m
SE )xℓ,m−1 + (Nℓ,m
W +αMℓ,m
NW )xℓ−1,m
+(Nℓ,m
E +αMℓ,m
SE )xℓ+1,m + (Nℓ,m
N +αMℓ,m
NW )xℓ,m+1.
(4.103)
Set each of coefﬁcients in the right-side of (4.103) to be zero. Then, it follows
from (4.100) that entries ofN are presented by those ofLI andUI:
Nℓ,m
S = −αMℓ,m
SE = −αLℓ,m
S Uℓ,m−1
E ,
Nℓ,m
W = −αMℓ,m
NW = −αLℓ,m
W Uℓ−1,m
N ,
Nℓ,m
C =α(Mℓ,m
SE +Mℓ,m
NW ) =α(Lℓ,m
S Uℓ,m−1
E +Lℓ,m
W Uℓ−1,m
N ),
Nℓ,m
E = −αMℓ,m
SE = −αLℓ,m
S Uℓ,m−1
E ,
Nℓ,m
N = −αMℓ,m
NW = −αLℓ,m
W Uℓ−1,m
N .
(4.104)


## Page 153

4.4. Other Iterative Methods 143
Now, utilizingM =A +N, (4.100), and (4.104), one can obtain Stone’s SIP
[63]:
Lℓ,m
S = Aℓ,m
S /(1 +αUℓ,m−1
E ),
Lℓ,m
W = Aℓ,m
W /(1 +αUℓ−1,m
N ),
Lℓ,m
C = Aℓ,m
C +α(Lℓ,m
S Uℓ,m−1
E +Lℓ,m
W Uℓ−1,m
N )
−Lℓ,m
S Uℓ,m−1
N −Lℓ,m
W Uℓ−1,m
E ,
Uℓ,m
E = ( Aℓ,m
E −αLℓ,m
S Uℓ,m−1
E )/Lℓ,m
C ,
Uℓ,m
N = ( Aℓ,m
N −αLℓ,m
W Uℓ−1,m
N )/Lℓ,m
C .
(4.105)
Remark: The approximations in (4.102) are second-order accurate when α =
1. But the algorithm (4.105) can be unstable for the case; the parameter α is
often chosen between 0.92 and 0.96 [23]. Entries of LI andUI used in (4.105)
whose indices are outside the index boundaries should be set zero.


## Page 154

144 Chapter 4. Finite Difference Methods for Elliptic Equations
4.5. Numerical Examples with Python
Here we demonstrate a Python code for solving
−∆u =f, x ∈ Ω = (0, 1)2
u =g, x ∈∂Ω (4.106)
The exact solution is chosen as
u(x,y ) = sin(πx) sin(πy) (4.107)
so that the right-hand side becomes
f(x,y ) = 2π2 sin(πx) sin(πy)
With the number of grid points n = nx = ny, the maximum errors are as
follows
Table 4.3: The maximum error ∥u −uh∥∞.
n 10 20 40 80
∥u −uh∥∞ 0.00827 0.00206 0.00050 6.42e-05


## Page 155

4.5. Numerical Examples with Python 145
Figure 4.4: Contour plots of computed solution with n = 40 (left) and the
10000-times magniﬁed error (right)
The whole code is attached below.


## Page 156

146 Chapter 4. Finite Difference Methods for Elliptic Equations
#=======================================================
# Elliptic_2D.py
# This module solves, by the 2nd-order FD method & SOR
# -(u_xx+u_yy)=f, (x,y) in (ax,bx)x(ay,by)
# u=g, (x,y) on its boundary
# Supporting functions are built in "util_ellip2D.py"
#=======================================================
from util_ellip2D import *
##----------------------
## User Input
##----------------------
ax,bx = 0., 1.
ay,by = 0., 1.
nx= 40; ny=nx
itmax = 1000
tol = 1.e-6
omega = 1.8
level = 2
##----------------------
## End of "User Input"
##----------------------
print 'Elliptic_2D: (ax,bx)x(ay,by)=(%g,%g)x(%g,%g),\
(nx,ny)=(%d,%d)' % (ax,bx,ay,by, nx,ny)
## build up coefficient matrix & others
A = coeff_matrix(ax,bx,ay,by,nx,ny,level)
b = get_rhs(ax,bx,ay,by,nx,ny,level)
U = get_exact_sol(ax,bx,ay,by,nx,ny,level)
X = init_X(U)
## solve with SOR
sol_SOR(A,X,b,omega,tol,itmax,level)


## Page 157

4.5. Numerical Examples with Python 147
## Checking error
if level:
print " Max-error=%g" % (error8(U,X,level))
## Want to see the figure?
if level>=3:
contourplot(U,ax,bx,ay,by,'Exact Solution',2)
contourplot(X,ax,bx,ay,by,'Computed Solution',2)
##===================================================
## util_ellip2D.py
##===================================================
import numpy as np
from numpy import abs,sqrt,pi,sin,cos
import matplotlib.pyplot as plt
from matplotlib.mlab import griddata
from copy import deepcopy
def coeff_matrix(ax,bx,ay,by,nx,ny,level=0):
matA = np.ndarray((ny+1,nx+1,5),float)
hx,hy= (bx-ax)/nx, (by-ay)/ny
for p in range(0,nx+1):
matA[0][p]=[0,0,1,0,0]; matA[ny][p]=[0,0,1,0,0]
for q in range(0,ny+1):
matA[q][0]=[0,0,1,0,0]; matA[q][nx]=[0,0,1,0,0]
rx,ry = 1./hx**2, 1./hy**2
d = 2 *(rx+ry)
for q in range(1,ny):
for p in range(1,nx):
matA[q][p][0] = -ry
matA[q][p][1] = -rx
matA[q][p][2] = d
matA[q][p][3] = -rx
matA[q][p][4] = -ry
return matA


## Page 158

148 Chapter 4. Finite Difference Methods for Elliptic Equations
def get_rhs(ax,bx,ay,by,nx,ny,level=0):
vec_b = np.ndarray((ny+1,nx+1),float)
hx,hy = (bx-ax)/nx, (by-ay)/ny
for q in range(0,ny+1):
y = ay+q*hy
for p in range(0,nx+1):
x = ax+p*hx
vec_b[q][p] = funct_f(x,y)
return vec_b
def get_exact_sol(ax,bx,ay,by,nx,ny,level=0):
vec_u = np.ndarray((ny+1,nx+1),float)
hx,hy = (bx-ax)/nx, (by-ay)/ny
for q in range(0,ny+1):
y = ay+q*hy
for p in range(0,nx+1):
x = ax+p*hx
vec_u[q][p] = funct_u(x,y)
return vec_u
def funct_f(x,y):
return 2*pi**2*sin(pi*x)*sin(pi*y)
def funct_u(x,y):
return sin(pi*x)*sin(pi*y)
def contourplot(XX,ax,bx,ay,by,title,level=0):
ny,nx = len(XX),len(XX[0])
xi = np.linspace(ax,bx,nx)
yi = np.linspace(ay,by,ny)
X,Y= np.meshgrid(xi, yi)
Z = griddata(X.ravel(),Y.ravel(),XX.ravel(),xi,yi)
CS = plt.contour(X, Y, Z, linewidths=2,colors='k')
plt.clabel(CS, inline=2, fmt='%1.1f', fontsize=12)
plt.title(title)


## Page 159

4.5. Numerical Examples with Python 149
plt.show()
def init_X(U,level=0):
X = deepcopy(U)
ny,nx = len(U),len(U[0])
for q in range(1,ny-1):
for p in range(1,nx-1):
X[q][p] = 0.
return X
def sol_SOR(A,X,b,omega,tol,itmax,level=0):
ny,nx = len(X),len(X[0])
for it in range(0,itmax):
err=0.
for j in range(1,ny-1):
for i in range(1,nx-1):
gs =( b[j][i]-(A[j][i][0]*X[j-1][i]\
+A[j][i][1]*X[j][i-1]\
+A[j][i][3]*X[j][i+1]\
+A[j][i][4]*X[j+1][i]) )\
/ A[j][i][2]
xnew = (1.-omega)*X[j][i]+omega*gs
err = max(err, abs(X[j][i]-xnew))
X[j][i] = xnew
if err<tol:
if level>=1:
print "sol_SOR: converged it= %d" %(it+1)
break
def error8(X,Y,level=0):
ny,nx = len(X),len(X[0])
err8=0.
for q in range(0,ny):
for p in range(0,nx):
err8=max(err8,abs(X[q][p]-Y[q][p]))
return err8


## Page 160

150 Chapter 4. Finite Difference Methods for Elliptic Equations
4.6. Homework
1. Verify that the overall truncation error for the FD scheme (4.14) is second-
order inhx. Hint: Deﬁne
K(x) =a(x)uxxx(x)
3!
(hx
2
)2
+ · · ·,
for the truncation errors appeared in (4.13). Then the truncation error for
the approximation of (aux)i+1/2 −(aux)i−1/2 becomesK(xi+1/2) −K(xi−1/2) =
hxK ′(xi) + · · ·.
2. Implement a code to solve
{
−(uux)x = 0, x ∈ (0, 2),
u(0) =gL, u (2) =gR, (4.108)
utilizing the second-order FD scheme (4.14) on a uniform grid. At the grid
pointxi, your approximation will read
−u2
i−1 + 2u2
i −u2
i+1
h2x
= 0. (4.109)
For the solver, you may use the simplest method (the Jacobi!) and its
variant. For the number of grid points, you may choose a convenient
number, e.g.,nx = 20.
(a) Derive (4.109).
(b) Solve to plot the FD solution for gL = 0 andgR = 2.
(The exact solutionu =
√
2x and you may assume that the numerical
solution is nonnegative.)
(c) Solve to plot the FD solution for gL = −1 andgR = 1.(
The exact solutionu =
{ √x − 1, x ≥ 1,
−√1 −x, x< 1.
)
The FD equation (4.109)
reads ui = ±
√
(u2
i−1 +u2
i+1)/2. You have to modify the iterative algo-
rithm to choose the right one. This step will be so hard, but I believe
it is fun to conquer.
(d) (Optional) Do you have any idea overcoming the difﬁculty involved in
(4.2c)?


## Page 161

4.6. Homework 151
3. For the 3D Poisson equation
−(uxx +uyy +uzz) =f, x = (x,y,z ) ∈ Ω = (0, 1)3,
u = 0, x = (x,y,z ) ∈∂Ω
(4.110)
(a) Apply the central second-order FD method, with a uniform grid size
h =hx =hy =hz, to get difference equations.
(b) Show that the maximum principle still applies.
(c) Prove that
∥u −uh∥∞ ≤ h2
24 max
x∈Ω
(|uxxxx| + |uyyyy | + |uzzzz |), (4.111)
whereuh is the ﬁnite difference solution.
4. Consider the eigenvalue problem
−∆u =λu, (x,y ) ∈ Ω = (0, 1)2,
u = 0, (x,y ) ∈∂Ω,
(4.112)
where the eigenfunction u(x,y ) ̸= 0. Prove that the eigenvalues and the
corresponding eigenfunctions are
λmn = (m2 +n2)π2,
umn(x,y ) = sin(mπx) sin(nπy),
(4.113)
form,n = 1, 2, · · ·. (Hint: Set u(x,y ) =X(x)Y (y) to plug it in (4.112).)
5. Modify the Python code in §4.5 to add a line SOR method, for the line
either in thex-direction or in they-direction. Provide a convergence anal-
ysis comparing convergence speeds between the point SOR and the line
SOR.
6. Edit once more the Python code you just modiﬁed for Homework 4.5 to
solve more general elliptic problem of the form
−[d1(x,y )ux]x − [d2(x,y )uy]y +r(x,y )u =f, x ∈ Ω = (0, 1)2
u =g, x ∈∂Ω. (4.114)
(a) Choose f andg accordingly such that the exact solution
u(x,y ) = (1 −x2)(y3 −y) (4.115)
and the coefﬁcients
d1(x,y ) = 2 +x2 −y2, d 2(x,y ) =exy, r (x,y ) =x + 2y.


## Page 162

152 Chapter 4. Finite Difference Methods for Elliptic Equations
(b) Estimate the convergence rate by running different mesh sizes, for
example,n = 10, 20, 40, 80.
(c) Visualize computed solutions with 3D mesh/surface plots in Python.
7. (Optional) LetA = (aij) be a nonsingular square matrix, obtained from
a FD/FE approximation of an elliptic problem of the form
−∇ · (a(x)∇u) + b(x) · ∇u +c(x)u =f(x), x ∈ Ω,
α(x)uν +β(x)u =g(x), x ∈ Γ, (4.116)
where a >0, c ≥ 0, α ≥ 0, and Ω is a bounded domain in Rd, 1 ≤ d ≤ 3,
with its boundary Γ =∂Ω. Assume that
(i) The elements in the main diagonal of A are positive and the other
elements are nonpositive, i.e., for eachi,
aii> 0; aij ≤ 0, i ̸=j.
(ii) A is diagonally dominant, i.e., for eachi,
aii ≥
∑
j̸=i
|aij|,
and at least one of the inequalities is strict.
(iii) The directed graph of A is strongly connected. (The standard FD/FE
methods always satisfy this condition.)
(a) Prove the following generalized maximum principle:
Theorem 4.25. (Maximum Principle) Suppose thatA satisﬁes all
the above assumptions and that
Au ≤ 0 (Au ≥ 0).
Then, the solution u has its maximum (minimum) on the boundary.
(b) Let Ω = (0, 1)3 and consider the 7-point FD method for the problem
in (4.116). Find conditions on the coefﬁcients and the mesh size h
with which the numerical solution of (4.116) satisﬁes the maximum
principle.


## Page 163

Chapter 5
Finite Element Methods for Elliptic
Equations
This chapter consideres ﬁnite element and ﬁnite volume methods for elliptic
PDEs deﬁned on 1D and 2D regions.
153


## Page 164

154 Chapter 5. Finite Element Methods for Elliptic Equations
5.1. Finite Element (FE) Methods in 1D Space
Consider the model problem formulated in 1D space:
(D)
{ −u′′ =f, x ∈I = (0, 1),
u = 0, x = 0, 1, (5.1)
which we call the differential problem (D).
FEM begins with a variational formulation for the given differential
problem. The variational formulation is sometimes called the weak formu-
lation.
5.1.1. Variational formulation
Deﬁne the product
(v,w ) =
ˆ
I
v(x)w(x)dx (5.2)
and the linear space
V = {v :v ∈C0[0, 1]; v′ is piecewise continuous
and bounded on [0, 1]; v(0) =v(1) = 0}. (5.3)


## Page 165

5.1. Finite Element (FE) Methods in 1D Space 155
Variational problem: Use the integration by parts to have
ˆ
I
−u′′v = −u′v
⏐⏐⏐
1
0
+
ˆ
I
u′v′ =
ˆ
I
u′v′.
Then, (5.1) can be written as
(u′,v ′) = (f,v ), ∀v ∈V. (5.4)
Now, we deﬁne the variational problem (V) corresponding to the differ-
ential problem (5.1):
(V) Find u ∈V such that
(u′,v ′) = (f,v ), ∀v ∈V.
(5.5)
Claim 5.1. The problem (D) is equivalent to the problem (V), when solutions
are sufﬁciently smooth.
Proof. ((D) ⇒ (V)): Clear.
((D) ⇐ (V)): Let u be a solution of (V). Then,
(u′,v ′) = (f,v ), ∀v ∈V. (5.6)
Now, assume thatu′′ exists. Then, because
(u′,v ′) =
ˆ
I
u′v′ =u′v
⏐⏐⏐
1
0
−
ˆ
I
u′′v = (−u′′,v ),
Equation (5.6) reads
(u′′ +f,v ) = 0, ∀v ∈V.
Sou should satisfy (5.1).


## Page 166

156 Chapter 5. Finite Element Methods for Elliptic Equations
Minimization problem:
Deﬁne a functionalF :V → R as
F (v) = 1
2(v′,v ′) − (f,v ), v ∈V. (5.7)
Then, the minimization problem (M) is formulated as
(M) Find u ∈V such that
F (u) ≤F (v), ∀v ∈V.
(5.8)


## Page 167

5.1. Finite Element (FE) Methods in 1D Space 157
Claim 5.2. The minimization problem (M) is equivalent to the variational
problem (V).
Proof. (⇒): Let u be a solution of (M). Then,
F (u) ≤F (u +εv), ∀v ∈V, ∀ε ∈ R. (5.9)
Deﬁneg(ε) =F (u +εv). Then, g′(0) = 0. Since
g(ε) = 1
2(u′,u ′) +ε(u′,v ′) +ε2
2 (v′,v ′) − (f,u ) −ε(f,v ), (5.10)
we have
g′(ε)
⏐⏐⏐
ε=0
= [(u′,v ′) +ε(v′,v ′) − (f,v )]
⏐⏐⏐
ε=0
= 0, ∀v ∈V.
So, we conclude (u′,v ′) = (f,v ), ∀v ∈V .
(⇐): Now, let u be a solution of (V). Then, the objective is to show F (u) ≤
F (v), ∀v ∈V. For givenv ∈V , letw =v −u. Then, w ∈V and
F (v) = F (u +w) = 1
2(u′ +w′,u ′ +w′) − (f,u +w)
= 1
2(u′,u ′) − (f,u ) + 1
2(w′,w ′) + (u′,w ′) − (f,w ).
The last two terms in the right side of the above equation become zero, because
u be a solution of (V). So
F (v) =F (u) + 1
2(w′,w ′) ≥F (u), ∀v ∈V,
which completes the proof.


## Page 168

158 Chapter 5. Finite Element Methods for Elliptic Equations
Claim 5.3. The problem (V) admits a unique solution.
Proof. Existence and uniqueness can be proved in an abstract mathematical
theory for variational problems, using the Lax-Milgram lemma, as in Theo-
rem 5.12 on p.202. Here we will consider uniqueness only.
(Uniqueness): Let u1 andu2 be two solutions of (V). Then,
(u′
1,v ′) = (f,v ), ∀v ∈V,
(u′
2,v ′) = (f,v ), ∀v ∈V,
which reads
(u′
1 −u′
2,v ′) = 0, ∀v ∈V.
Thus, by choosingv = (u1 −u2), we reach at
ˆ
I
(u′
1 −u′
2)2dx = 0,
which impliesu′
1 −u′
2 = 0 and thereforeu1 −u2 =c, a constant. Since u1(0) =
u2(0) = 0 , the constant c must be zero. Thus u1 ≡ u2, which completes the
proof.
In summary:
• (D) ⇔ (V) ⇔ (M). (when u′′ exists)
• They admit a unique solution.


## Page 169

5.1. Finite Element (FE) Methods in 1D Space 159
5.1.2. Formulation of FEMs
In designing a FEM, the following steps are to be performed:
• Partitioning: The domain should be partitioned into a collection of ele-
ments of the mesh sizeh.
• Subspace Vh ⊂ V and basis functions {ϕj(x)}: A subspace is set to
represent the numerical solution that is a linear combination of basis
functions. That is,
uh(x) =
M∑
j=1
ξjϕj(x). (5.11)
For example,ϕj(x) are piecewise polynomials (splines).
• Application of variational principles : Different variational princi-
ples produce various FEMs.
– the minimization principle (Rayleigh-Ritz)
– weighted residual approaches with the weights being either the basis
functions (Galerkin) or different functions (Petrov-Galerkin)
– least-square approaches
– collocation method
• Assembly for a linear system : The linear system can be assembled
for (ξ1,ξ 2, · · ·,ξM)T with the integrals approximated by numerical quadra-
ture.


## Page 170

160 Chapter 5. Finite Element Methods for Elliptic Equations
Step 1. Partitioning: Let
0 =x0<x 1< · · ·<x M <x M+1 = 1
be a partition of the unit interval. Deﬁne
hj =xj −xj−1, Ij = [xj−1,xj], j = 1, 2, · · ·,M + 1
and
h = max
1≤j≤M+1
hj.
Step 2. Subspace and basis functions: Deﬁne a ﬁnite-dimensional
subspace ofV as
Vh = {v ∈V :v is a polynomial of
degree ≤k on each Ij}.
(5.12)
Notes:
• Corresponding basis functions are determined depending on the choice of
polynomial degreek ≥ 1 and therefore on the nodal points.
• Each of basis functions is related to a nodal point.
• Basis functions ϕj ∈Vh are deﬁned to satisfy
ϕj(xi) =δij :=
{ 1, if i =j,
0, else.


## Page 171

5.1. Finite Element (FE) Methods in 1D Space 161
Figure 5.1: The basis function ϕj.
Example: k = 1 (the linear FEM) : The basis function ϕj is depicted in
Figure 5.1:
ϕj(x) =



1
hj
(x −xj−1), x ∈ [xj−1,xj],
−1
hj+1
(x −xj+1), x ∈ [xj,xj+1],
0, elsewhere.
(5.13)
Notes:
• The functions v ∈Vh can be expressed as a linear combination of the basis
functions as
v(x) =
M∑
j=1
ηjϕj(x), x ∈ [0, 1].
• The above expression is unique for given v ∈Vh; in fact,
ηj =v(xj), j = 1, 2, · · ·,M.


## Page 172

162 Chapter 5. Finite Element Methods for Elliptic Equations
Example:k> 1 (higher-order FEMs):
• For each interval Ij = [xj−1,xj], the degree of freedom of k-th order poly-
nomials isk + 1.
It requires to choosek + 1 nodal points in each interval.
• As for the linear FEM, the two endpoints can naturally become nodal
points.
We should selectk − 1 extra nodal points inside the intervalIj.
• In the literature, a common practice is to select those nodal points in
such a way that the numerical quadrature of the integrals is as accurate
as possible when the nodal points are used as quadrature points.
• Such selection is related to the family of orthogonal polynomials such as
Legendre polynomials and Chebyshev polynomials; see Appendix E for
details.


## Page 173

5.1. Finite Element (FE) Methods in 1D Space 163
Step 3. Application of variational principles: The most popular
FEM is the Galerkin method, which is a weighted residual approach with
the weights being basis functions.
Weighted residual approaches : Let P (u) = −u′′. For the differential
problem (5.1), deﬁne the residualR as
R(v) =P (v) −f (5.14)
Then, we have
R(u) =P (u) −f = 0.
However, foruh(x) =
M∑
j=1
ξjϕj(x),
R(uh) =P (uh) −f ̸= 0, in general. (5.15)
Weighed residual approaches are seeking an approximate solution
uh(x) =
M∑
j=1
ξjϕj(x)
which satisﬁes ˆ
I
R(uh)w(x)dx = 0, (5.16)
for a sequence of weight functions w(x) ∈ {wi(x)}, which is also called
trial functions.
When the integration by parts is utilized, (5.16) reads
(u′
h,w ′) = (f,w ) (5.17)


## Page 174

164 Chapter 5. Finite Element Methods for Elliptic Equations
The linear Galerkin method: For the subspaceVh of linear basis functions
{ϕj(x)}, let
wi(x) =ϕi(x) (5.18)
Then, the linear Galerkin FEM for the differential problem (5.1) is formulated
as
Finduh ∈Vh s.t. (u′
h,ϕ ′
i) = (f,ϕi), ∀ϕi ∈Vh (5.19)
As in §5.1.1, one can show that (5.19) admits a unique solution.


## Page 175

5.1. Finite Element (FE) Methods in 1D Space 165
Step 4. Assembly for a linear system:
• Given basis functions {ϕj(x)} ⊂ Vh, the numerical solutionuh is uniquely
expressed as
uh(x) =
M∑
j=1
ξjϕj(x). (5.20)
• The numerical solution must be the solution of a variational formulation.
For example, the solution of the linear Galerkin FEM satisﬁes
(u′
h,ϕ ′
i) = (f,ϕi), ∀ϕi ∈Vh (5.21)
The next objective is to assemble the linear system for the unknown vector
ξ := (ξ1,ξ 2, · · ·,ξM)T. From (5.20) and (5.21),
(u′
h,ϕ ′
i) =
M∑
j=1
ξj(ϕ′
j,ϕ ′
i) = (f,ϕi), ∀ϕi ∈Vh.
We rewrite the above equation
M∑
j=1
(ϕ′
j,ϕ ′
i)ξj = (f,ϕi), i = 1, · · ·,M. (5.22)
Deﬁne
aij = (ϕ′
j,ϕ ′
i), b i = (f,ϕi). (5.23)


## Page 176

166 Chapter 5. Finite Element Methods for Elliptic Equations
Then, (5.22) equivalently reads the algebraic system of the form
Aξ = b, (5.24)
where A = (aij) is an M ×M matrix and b = (b1,b 2, · · ·,bM)T is the source
vector.
• The matrix A has good properties such as being symmetric and positive
deﬁnite.
• We will show them later; we ﬁrst consider details for the computation of
aij andbi.
• Note that
aij = (ϕ′
j,ϕ ′
i) =
ˆ
I
ϕ′
j(x)ϕ′
i(x)dx = 0, if |i −j| ≥ 2,
because the support of ϕj is [xj−1,xj+1]. Thus, there are only three cases
for nonzero entries ofA:
j =i − 1, i, i+ 1.


## Page 177

5.1. Finite Element (FE) Methods in 1D Space 167
Computation ofaij andbi: Recall
ϕj(x) =



1
hj
(x −xj−1), x ∈ [xj−1,xj],
−1
hj+1
(x −xj+1), x ∈ [xj,xj+1],
0, elsewhere.
(5.25)
Casej =i − 1: It follows from (5.25) that
ai,i−1 = ( ϕ′
i−1,ϕ ′
i) =
ˆ xi
xi−1
ϕ′
i−1(x)ϕ′
i(x)dx
=
ˆ xi
xi−1
−1
hi
· 1
hi
dx = −1
hi
.
Casej =i: Again utilizing (5.25), we have
ai,i = ( ϕ′
i,ϕ ′
i) =
ˆ xi+1
xi−1
ϕ′
i(x)ϕ′
i(x)dx
=
ˆ xi
xi−1
+
ˆ xi+1
xi
ϕ′
i(x)ϕ′
i(x)dx = 1
hi
+ 1
hi+1
.
Casej =i + 1:
ai,i+1 = ( ϕ′
i+1,ϕ ′
i) =
ˆ xi+1
xi
ϕ′
i+1(x)ϕ′
i(x)dx
=
ˆ xi+1
xi
1
hi+1
· −1
hi+1
dx = −1
hi+1
.
Computation ofbi: Finally, it can be done as
bi = (f,ϕi) =
ˆ xi+1
xi−1
f(x)ϕi(x)dx ≈fi
hi +hi+1
2 ,
wheref has been approximated byfi =f(xi) on [xi−1,xi+1].


## Page 178

168 Chapter 5. Finite Element Methods for Elliptic Equations
Properties of the algebraic system:
Deﬁnition 5.4. A matrixS = (sij) ∈ RM ×M is said to be positive deﬁnite if
η ·Sη =
M∑
i,j=1
ηisijηj > 0, ∀η ∈ RM, η ̸= 0.
It has been known that a matrixS is symmetric positive deﬁnite if and only
if all eigenvalues ofS are strictly positive.
Lemma 5.5. The matrixA in (5.24) is symmetric positive deﬁnite.
Proof. Symmetry is easy to see, because
aij := (ϕ′
j,ϕ ′
i) = (ϕ′
i,ϕ ′
j) =:aji.
Givenη ∈ RM, we deﬁnev(x) =
M∑
j=1
ηjϕj(x). Then
η ·Aη =
M∑
i,j=1
ηiaijηj =
M∑
i,j=1
ηi(ϕ′
i,ϕ ′
j)ηj
=
( M∑
i
ηiϕ′
i,
M∑
j
ηjϕ′
j
)
≥ 0,
(5.26)
with equality satisﬁed only if v′ = 0 , and therefore only if v = 0 because
v(0) = 0 ; which implies that equality holds only if η = 0. This completes the
proof.


## Page 179

5.1. Finite Element (FE) Methods in 1D Space 169
Figure 5.2: The element Ii = [xi−1,xi] and the basis functions for the cubic FE
method.
Higher-order FEMs:
• Higher-order FE methods introduce higher-order basis functions.
• Figure 5.2 presents the element Ii = [xi−1,xi] and the basis functions each
of which is cubic inIi.
• Since the degree of freedom for cubic polynomials is four, we need to pro-
vide four independent information to determine the polynomial uniquely.
• For the purpose, one can choose four distinct points (including two edge
points), as shown in Figure 5.2. The points are called the nodal points.


## Page 180

170 Chapter 5. Finite Element Methods for Elliptic Equations
Construction of cubic basis functions:
• Let the nodal points be given and denoted by ℓp,p = 0, · · ·, 3.
• Then the local basis functions ϕj on the elementIi must read
ϕj(ℓp) =δjp, j,p = 0, · · ·, 3.
• The above property can be satisﬁed the cardinal functions:
ϕj(x) =
3∏
m = 0
m ̸=j
(x −ℓm
ℓj −ℓm
)
, j = 0, · · ·, 3, (5.27)
and they can serve as basis functions.
• It is often to choose Gauss-Lobatto points for the nodal points; see Ap-
pendix E for details.


## Page 181

5.1. Finite Element (FE) Methods in 1D Space 171
Construction of general-order basis functions: We generalize
the above argument for FE methods utilizing piecewisekth-order polynomials
k ≥ 1, as follows:
• Select extra (k −1) nodal points such that each elementIi has (k+1) nodal
points including the two edge points.
• Denote them by ℓm, m = 0, · · ·,k .
• Deﬁne the local basis functions as
ϕj(x) =
k∏
m = 0
m ̸=j
(x −ℓm
ℓj −ℓm
)
, j = 0, · · ·,k.
• The basis functions associated with the edge points must be extended
both side for the ﬁnal form of the basis functions.


## Page 182

172 Chapter 5. Finite Element Methods for Elliptic Equations
5.2. The Hilbert spaces
We ﬁrst deﬁne the space ofsquare integrable functions onI:
L2(I) = {v :v is deﬁned onI and
ˆ
I
v2dx< ∞}.
The spaceL2(I) is a Hilbert space with the scalar product
(v,w ) =
ˆ
I
v(x)w(x)dx
and the corresponding norm (theL2-norm)
∥v∥ = (v,v )1/2 =
(ˆ
I
[v(x)]2dx
)1/2
.
In general, for an integerr ≥ 0, we deﬁne a Hilbert space
Hr(I) = {v ∈L2(I) :v(k) ∈L2(I), k = 1, · · ·,r }
with the corresponding norm (theHr(I)-norm)
∥v∥r =
(ˆ
I
r∑
k=0
[
v(k)(x)
]2
dx
)1/2
,
wherev(k) denotes thek-th derivative ofv. It is often convenient to deﬁne
|v|r =
(ˆ
I
[
v(r)(x)
]2
dx
)1/2
, v ∈Hr(I).
Note thatL2(I) =H0(I) and ∥ · ∥ = ∥ · ∥0 = | · |0.
The following shall be useful for the error estimate to be presented in §5.3.


## Page 183

5.2. The Hilbert spaces 173
The Cauchy-Schwarz inequality reads
|(v,w )| ≤ ∥v∥ · ∥w∥. (5.28)
Consider the problem (D) in (5.1). Then, it is well known that
∥u∥s+2 ≤C∥f ∥s, s = 0, 1, · · ·, (5.29)
for some C >0, independent of u andf. The above regularity estimate holds
for higher-dimensional problems (the Poisson equation in 2D and 3D) when
the boundary is smooth enough. See Appendix B.1 for the details.


## Page 184

174 Chapter 5. Finite Element Methods for Elliptic Equations
5.3. An error estimate for FEM in 1D
Letu anduh be the solutions of Problem (V) in (5.5) and Problem (Vh) in (5.19),
respectively. Then,
(u′,v ′) = (f,v ), ∀v ∈V,
(u′
h,v ′) = (f,v ), ∀v ∈Vh.
Note thatVh ⊂V . Thus it follows from the above equations that
(u′ −u′
h,v ′) = 0, ∀v ∈Vh. (5.30)
Theorem 5.6. For anyv ∈Vh, we have
∥(u −uh)′∥ ≤ ∥ (u −v)′∥. (5.31)
Proof. Givenv, an arbitrary function inVh, letw =uh −v ∈Vh. Then, utilizing
(5.30) and the Cauchy-Schwarz inequality, we have
∥(u −uh)′∥2 = (( u −uh)′, (u −uh)′)
= (( u −uh)′, (u −uh)′) + ((u −uh)′,w ′)
= (( u −uh)′, (u −uh +w)′)
= (( u −uh)′, (u −v)′)
≤ ∥ (u −uh)′∥ · ∥(u −v)′∥,
from which (5.31) follows.


## Page 185

5.3. An error estimate for FEM in 1D 175
Figure 5.3: The solution u and its interpolantπhu.
Notes
• The inequality (5.31) allows us to analyze the error ∥(u −uh)′∥ quantita-
tively.
• That is, we can choose v ∈Vh suitably to estimate the right side of (5.31).
• We shall choose v to be the interpolant ofu,πhu, which interpolatesu at
all the nodal pointsxj. See Figure 5.3.
Now, one can prove that forx ∈ [0, 1],
|u(x) −πhu(x)| ≤ h2
8 max
ξ∈(0,1)
|u′′(ξ)|, (5.32)
|u′(x) −πhu′(x)| ≤ h max
ξ∈(0,1)
|u′′(ξ)|. (5.33)
(See Homework 5.2.) The above inequalities hold for any (sufﬁciently smooth)
functionu and its interpolantπhu. The estimates are called theinterpolation
estimates.


## Page 186

176 Chapter 5. Finite Element Methods for Elliptic Equations
It follows from (5.33) and Theorem 5.6 that
∥(u −uh)′∥0 ≤Ch|u|2, (5.34)
for some constantC >0, independent ofh.
Since
|(u −uh)(x)| =
⏐⏐⏐
ˆ x
0
(u −uh)′(t)dt
⏐⏐⏐
≤ ∥ (u −uh)′∥0 ·
(ˆ x
0
12dt
)1/2
≤ ∥ (u −uh)′∥0,
we have
|(u −uh)(x)| ≤ Ch|u|2. (5.35)
Therefore, from (5.34) and (5.35),
∥u −uh∥1 ≤Ch|u|2, (5.36)


## Page 187

5.3. An error estimate for FEM in 1D 177
Estimation of∥u−uh∥0
Theorem 5.7. Letu anduh be the solutions of Problem (V) and Problem
(Vh), respectively. Then
∥u −uh∥0 ≤Ch2|u|2, (5.37)
whereC >0 is independent onh.
Proof. Let e =u −uh. Then, we know from (5.30) that
(e′,v ′) = 0, ∀v ∈Vh. (5.38)
We shall estimate (e,e ) = ∥e∥2
0 using the so-called duality argument which
is popular in FEM error analysis. Let φ be the solution of the following dual
problem
−φ′′ =e, x ∈I,
φ = 0, x = 0 or 1. (5.39)
Then, from (5.29) withs = 0,
∥φ∥2 ≤C∥e∥0, (5.40)
whereC >0 is independent on e. Using the integration by parts and the fact
thate(0) =e(1) = 0,
(e,e ) = (e, −φ′′) = (e′,φ ′) = (e′,φ ′ −πhφ′),
where πhφ ∈ Vh denotes the interpolant of φ. Now, apply the interpolation
estimate (5.33) toφ and use the regularity estimate (5.40) to get
∥e∥2
0 ≤ ∥e∥1 · ∥φ −πhφ∥1 ≤ ∥e∥1 ·Ch|φ|2 ≤Ch∥e∥1 · ∥e∥0.
Thus dividing by ∥e∥0 and utilizing (5.36), we ﬁnally reach at
∥e∥0 ≤Ch∥e∥1 ≤Ch2|u|2
and the proof is complete.
Summary: Error estimate for the linear FEM : The error estimates in
(5.36) and (5.37) can be rewritten as


## Page 188

178 Chapter 5. Finite Element Methods for Elliptic Equations
∥u −uh∥s ≤Ch2−s|u|2, s = 0, 1. (5.41)
Error estimate for general-order FEMs: When piecewise k-th order poly-
nomials (k ≥ 1) are employed for the basis functions, one can use the same
arguments presented in this section to show
∥u −uh∥s ≤Chk+1−s|u|k+1, s = 0, 1, · · ·,k. (5.42)


## Page 189

5.4. Other Variational Principles 179
5.4. Other Variational Principles
The FEM we have consider so far is the Galerkin method, one of weighted
residual approaches.
There have been other variational principles such as
• the minimization principle (Rayleigh-Ritz methods),
• least-square approaches,
• collocation methods, and
• weighted residual approaches with the weights being different from the
basis functions (Petrov-Galerkin methods).


## Page 190

180 Chapter 5. Finite Element Methods for Elliptic Equations
5.5. FEM for the Poisson equation
Let Ω ⊂ R2 be bounded domain with its boundary Γ = ∂Ω being smooth.
Consider
(D)
{ −∆u =f, x ∈ Ω,
u = 0, x ∈ Γ, (5.43)
where x = (x,y ) = (x1,x 2).
5.5.1. Integration by parts
To derive a variational form for (5.43), we ﬁrst introduce the divergence theo-
rem. Let A = (A1,A 2) be a vector-valued function on R2. Then divergence of A
is deﬁned as
∇ ·A = ∂A1
∂x1
+∂A2
∂x2
.
Let n = (n1,n 2) be the outward unit normal to Γ and
vn = ∂v
∂n = ∇v · n = ∂v
∂x1
n1 + ∂v
∂x2
n2.
Theorem 5.8. (Divergence theorem) Let A = (A1,A 2) be a vector-valued
differentiable function on a bounded region Ω in R2. Then
ˆ
Ω
∇ ·Adx =
ˆ
Γ
A · nds, (5.44)
wheres is the element of arc length.


## Page 191

5.5. FEM for the Poisson equation 181
Apply the divergence theorem toA = (vw, 0) andA = (0,vw ) to read
ˆ
Ω
∂
∂x1
(vw)dx =
ˆ
Γ
vwn1ds,
ˆ
Ω
∂
∂x2
(vw)dx =
ˆ
Γ
vwn2ds,
which implies
ˆ
Ω
∂v
∂xi
wdx =
ˆ
Γ
vwnids −
ˆ
Ω
v∂w
∂xi
dx, i = 1, 2. (5.45)
Thus we have the Green’s formula
ˆ
Ω
∇v · ∇wdx ≡
ˆ
Ω
[ ∂v
∂x1
∂w
∂x1
+ ∂v
∂x2
∂w
∂x2
]
=
ˆ
Γ
v∂w
∂x1
n1ds −
ˆ
Ω
v∂2w
∂x12dx
+
ˆ
Γ
v∂w
∂x2
n2ds −
ˆ
Ω
v∂2w
∂x22dx
=
ˆ
Γ
v∂w
∂nds −
ˆ
Ω
v∆wdx.
That is,
(∇v, ∇w) =<v,w n> −(v, ∆w), (5.46)
where<v,w > =
´
Γvwds.


## Page 192

182 Chapter 5. Finite Element Methods for Elliptic Equations
The linear space: Now, deﬁne the linear space
V = {v :v ∈C0(Ω); ∇v is piecewise continuous
and bounded on Ω; v(x) = 0, x ∈ Γ}. (5.47)
Let
a(u,v ) =
ˆ
Ω
∇u · ∇vdx.
Deﬁne the variational problem (V)
(V)
{
Findu ∈V such that
a(u,v ) = (f,v ), ∀v ∈V,
(5.48)
and the minimization problem (M)
(M)
{
Findu ∈V such that
F (u) ≤F (v), ∀v ∈V,
(5.49)
where
F (v) = 1
2a(v,v ) − (f,v ).
Then, as for the 1D model problem in §5.1.1, one can prove that
• problems (D), (V), and (M) are equivalent when the solution u is sufﬁ-
ciently smooth, and
• they admit a unique solution.


## Page 193

5.5. FEM for the Poisson equation 183
5.5.2. Deﬁning FEMs
To deﬁne an FEM for the Poisson equation (5.48), we need to follow steps as
for the FE method for the 1D problem presented in §5.1.2:
• Triangulation
• Subspace Vh ⊂V and basis functions
• Application of variational principles
• Assembly for the linear system


## Page 194

184 Chapter 5. Finite Element Methods for Elliptic Equations
Figure 5.4: Triangulation Th of Ω.
Step 1. Triangulation : Let Kj, j = 1, · · ·,m , be nonoverlapping trian-
gles such that
Ω = ∪m
j=1Kj;
we assume that no vertex of a triangle lies on the edge of another triangle as
shown in Figure 5.4.
Leth be the longest side of edges of the triangles, i.e.,
h = max
j
diam(Kj).
Then the collection of such triangles composes the ﬁnite elements
Th = {K1,K 2, · · ·,Km}.
An FE mesh consists of
nPT the number of vertices (points)
nEL the number of elements/triangles
(x,y )i the vertices
(n1,n 2,n 3)j the connectivity


## Page 195

5.5. FEM for the Poisson equation 185
Figure 5.5: Two meshes Dr. Kim made, using the Python package MeshPy.
Step 2. Subspace Vh⊂ V and basis functions: For the linear
FE method, we deﬁne a subspace ofV as
Vh = {v ∈V :v is linear on each Kj}. (5.50)
The corresponding basis functions {ϕj} are as
ϕj(Ni) =δij,
whereNi are the vertices, the nodal points.
Each basis function ϕi restricted on an element Kj, one vertex of which is
Ni, is linear of the form
ϕi(x) =ax1 +bx2 +c, x ∈Kj.


## Page 196

186 Chapter 5. Finite Element Methods for Elliptic Equations
Step 3. Application of variational principles: The linear Galerkin
FEM for (5.48) can be formulated as
(Vh)
{
Finduh ∈Vh such that
a(uh,v ) = (f,v ), ∀v ∈Vh.
(5.51)
The error analysis for the linear Galerkin method can be carried out fol-
lowing the arguments in §5.3.
Theorem 5.9. Let u and uh be the solutions of (5.48) and (5.51), respec-
tively. Then
∥u −uh∥s ≤Ch2−s|u|2, s = 0, 1, (5.52)
whereC >0 is a constant independent onh.
It is fun to prove the theorem; challenge it for an extra credit, or more impor-
tantly, for your pride!


## Page 197

5.5. FEM for the Poisson equation 187
Step 4. Assembly for the linear system: Let
uh(x) =
M∑
j=1
ξjϕj(x), for someM >0.
Then, the algebraic system for (5.51) can be formulated as
Aξ = b, (5.53)
whereξ = (ξ1, · · ·,ξM)T is the solution vector and
A = (aij), a ij :=a(ϕj,ϕi),
b = (b1, · · ·,bM)T, b i := (f,ϕi).
Notes:
• As for the 1D problem in §5.1.2, the matrix A is symmetric and positive
deﬁnite.
• Thus the system (5.53) admits a unique solution.


## Page 198

188 Chapter 5. Finite Element Methods for Elliptic Equations
Stiffness matrixA:
Let the stiffness matrix beA = (aij). Then,
aij =a(ϕj,ϕi) =
∑
K∈Th
aK
ij, (5.54)
where
aK
ij =aK(ϕj,ϕi) =
ˆ
K
∇ϕj · ∇ϕidx. (5.55)
Deﬁnition 5.10. The element stiffness matrixAK of the elementK is
AK =


aK
11 aK
12 aK
13
aK
21 aK
22 aK
23
aK
31 aK
32 aK
33

,
where each component can be computed from (5.55).
• The stiffness matrix A can be constructed through the contributions from
the element stiffness matricesAK,K ∈ Th.
• Looks complicated? We will deal with an efﬁcient method for the compu-
tation ofaK
ij in a separate section; see §5.5.3.


## Page 199

5.5. FEM for the Poisson equation 189
Figure 5.6: The afﬁne mappingF : ˆK →K.
5.5.3. Assembly: Element stiffness matrices
• The computation of the element stiffness matrix
AK :=
(
aK
ij
)
∈ R3×3
is not a simple task for the elementK ∈ Th in a general geometry.
• To overcome the complexity, we introduce the reference element ˆK and
an afﬁne mappingF : ˆK →K. See Figure 5.6.
The reference elementˆK: It has the following three vertices
ˆa1 = [0, 0]T, ˆa2 = [1, 0]T, ˆa3 = [0, 1]T, (5.56)
and the corresponding reference basis functions are
ˆϕ1(ˆx) = 1 −ˆx1 −ˆx2, ˆϕ2(ˆx) =ˆx1, ˆϕ3(ˆx) =ˆx2. (5.57)


## Page 200

190 Chapter 5. Finite Element Methods for Elliptic Equations
Afﬁne mappingF : The mapping F : ˆK →K (ˆx ↦→ x) must be deﬁned as
ai =F (ˆai), ϕ i(x) = ˆϕi(ˆx), i = 1, 2, 3. (5.58)
That is, the corners and the basis functions of K are deﬁned as the afﬁne
images of those of ˆK.
LetJ be the Jacobian of the afﬁne mappingF:
J :=
[∂Fi
∂ˆxj
]
=
[∂xi
∂ˆxj
]
=
[ ∂x1
∂ˆx1
∂x1
∂ˆx2
∂x2
∂ˆx1
∂x2
∂ˆx2
]
. (5.59)
Then, it follows from the chain rule that
∇ϕj =J −T ∇ˆϕj, j = 1, 2, 3, (5.60)
whereJ −T is the transpose ofJ −1, which implies
aK
ij :=
ˆ
K
∇ϕj · ∇ϕidx
=
ˆ
ˆK
(J −T ∇ˆϕj) · (J −T ∇ˆϕi) |detJ|dˆx.
(5.61)
Notes:
• Every afﬁne mapping in Rn has the form Bˆx + s, where B ∈ Rn×n and
s ∈ Rn.
• From some algebra, it can be shown that
F (ˆx) = [a2 − a1, a3 − a1]ˆx + a1 (5.62)
Thus
J = [a2 − a1, a3 − a1] ∈ R2×2. (5.63)


## Page 201

5.5. FEM for the Poisson equation 191
5.5.4. Extension to Neumann boundary conditions
Consider the following problem of Neumann boundary condition
−∆u +u =f, x ∈ Ω,
un =g, x ∈ Γ. (5.64)
For the problem, it is natural to chooseV =H1(Ω) for the linear space.
Integration by parts: It follows from the Green’s formula (5.46) that (5.64)
reads
(∇u, ∇v) + (u,v ) = (f,v )+<g,v >, v ∈V. (5.65)
Deﬁne
a(u,v ) = (∇u, ∇v) + (u,v ),
F (v) = 1
2a(v,v ) − (f,v )−<g,v >.
Then, one can formulate the variational problem
(V)
{
Findu ∈V such that
a(u,v ) = (f,v )+<g,v >, ∀v ∈V,
(5.66)
and the minimization problem
(M)
{
Findu ∈V such that
F (u) ≤F (v), ∀v ∈V.
(5.67)


## Page 202

192 Chapter 5. Finite Element Methods for Elliptic Equations
Notes:
• In (5.66) the boundary condition is implicitly imposed. Such a boundary
condition is called a natural boundary condition.
• On the other hand, the Dirichlet boundary condition as in (5.43) is called
a essential boundary condition.
• For the problem (5.66), an FEM can be formulated as for (5.48); a similar
error analysis can be obtained.


## Page 203

5.6. Finite Volume (FV) Method 193
5.6. Finite Volume (FV) Method
Here we will discuss one of easiest FV methods formulated on a rectangu-
lar domain. For problems on more general domains or convection-dominated
problems, the FV method can be more complicated. However, the major ideas
would be near around the same corner.
Consider the following problem of general diffusion coefﬁcients
−∇ · (a∇u) =f, x ∈ Ω,
u = 0, x ∈ Γ. (5.68)


## Page 204

194 Chapter 5. Finite Element Methods for Elliptic Equations
Figure 5.7: Cell-centered FV method on a uniform mesh of grid size hx ×hy.
For this case, each cell is a control volume.
Formulation of FV methods
1. Triangulation: Let Ω be a rectangular domain partitioned into elements,
called cells. For simplicity, we assume all cells are rectangular of sizehx ×hy.
See Figure 5.7.
2. Localization: Let φpq be the characteristic function of the cellKpq, i.e.,
φpq(x) =
{ 1, if x ∈Kpq,
0, else.
3. Variational principle: Multiplying the ﬁrst equation of (5.68) by φpq and
integrating the result over the domain Ω, we haveˆ
Ω
−∇ · (a∇u)φpqdx =
ˆ
Kpq
−∇ · (a∇u)dx =
ˆ
Kpq
fd x.
Therefore, from the divergence theorem,
−
ˆ
∂Kpq
aunpqds =
ˆ
Kpq
fd x, (5.69)
wheres is the edge element and npq denotes the unit out normal to∂Kpq.
4. Approximation and evaluation : Now we have to evaluate or approxi-
mate the quantityaunpq along the boundary of the cellKpq.


## Page 205

5.6. Finite Volume (FV) Method 195
On ∂Kpq ∩∂Kp+1,q (“East", the right vertical edge), for example, it can be
approximated as
aunpq(x) ≈ ap+1/2,q
up+1,q −up,q
hx
, x ∈∂Kpq ∩∂Kp+1,q, (5.70)
where the approximation is second-order accurate.
Thus
(E)
ˆ
Kpq∩∂Kp+1,q
aunpq(x)ds ≈ hy
hx
ap+1/2,q(up+1,q −up,q). (5.71)
The same can be applied for other edges. That is,
(W)
ˆ
Kpq∩∂Kp−1,q
aunpq(x)ds ≈ hy
hx
ap−1/2,q(up−1,q −up,q)
(N)
ˆ
Kpq∩∂Kp,q+1
aunpq(x)ds ≈ hx
hy
ap,q+1/2(up,q+1 −up,q)
(S)
ˆ
Kpq∩∂Kp,q−1
aunpq(x)ds ≈ hx
hy
ap,q−1/2(up,q−1 −up,q)
(5.72)


## Page 206

196 Chapter 5. Finite Element Methods for Elliptic Equations
The right-hand side term : The right-hand side term of (5.69) can be inte-
grated by the mass-lumping technique to becomehxhyfpq. That is,
ˆ
Kpq
fd x ≈hxhyfpq. (5.73)
For (5.69), combine (5.71), (5.72), and (5.73) and divide the resulting equa-
tion byhxhy to have
−
[ 1
h2x
ap+1/2,q(up+1,q −up,q) + 1
h2x
ap−1/2,q(up−1,q −up,q)
+ 1
h2y
ap,q+1/2(up,q+1 −up,q) + 1
h2y
ap,q−1/2(up,q−1 −up,q)
]
= −ap−1/2,qup−1,q + (ap−1/2,q +ap+1/2,q)up,q −ap+1/2,qup+1,q
h2x
−ap,q−1/2up,q−1 + (ap,q−1/2 +ap,q+1/2)up,q −ap,q+1/2up,q+1
h2y
= fpq
(5.74)
which is the same as the ﬁnite difference equation for interior nodal points.
Convection term: When a convection term b · ∇u appears in the differential
equation, the same idea can be applied. For example, sinceb · ∇u =b1ux +b2uy
in 2D,
ˆ
Ω
b · ∇uφpqdx =
ˆ
Kpq
(b1ux +b2uy)dx
≈ hxhy
(
b1,pq
up+1,q −up−1,q
2hx
+b2,pq
up,q+1 −up,q−1
2hy
)
,
(5.75)
which is again the same as the FD method.


## Page 207

5.6. Finite Volume (FV) Method 197
Remarks:
• The idea used in the above is the basis for the ﬁnite volume method de-
ﬁned on control volumes (CVs).
• Here we have put the nodal points at the center of the rectangular cells
and used the cells for the CVs. Thus the method is sometimes called the
cell-centered ﬁnite difference method.
• At interior points, the algebraic equations obtained from the FV method
are equivalent to those of the second-order FD method (on rectangular
meshes) or the linear FE method (on triangular meshes).
• Boundary conditions must be treated accurately. See Homework 5.3.
• When the nodal points are set on the corners of the cells, the CV should be
determined such that it contains the nodal point in an appropriate way;
the CVs are nonoverlapping and their union becomes the whole domain.


## Page 208

198 Chapter 5. Finite Element Methods for Elliptic Equations
5.7. Average of The Diffusion Coefﬁcient
Remarks
• The conormal ﬂux aun on a interface denotes the mass or energy move-
ment through the interface.
• Thus it must be continuous (mass/energy conservation), on the interfaces
of ﬁnite elements or control volumes. That is,
aunpq(x) = −aunp+1,q(x), x ∈∂Kpq ∩∂Kp+1,q (5.76)
• Such a physical consideration gives a way of approximating the diffusion
coefﬁcienta to get a more physical (and therefor more accurate) numeri-
cal solution.


## Page 209

5.7. Average of The Diffusion Coefﬁcient 199
Approximation of the diffusion coefﬁcient
• Let a be locally constant, i.e., constant on each cell.
• Then conormal ﬂux in (5.69) on ∂Kpq ∩∂Kp+1,q can be approximated as
aunpq(x) ≈apq
ue −upq
hx/2 , x ∈∂Kpq ∩∂Kp+1,q, (5.77)
where ue is introduced to represent the solution on the interface ∂Kpq ∩
∂Kp+1,q.
• From the other side of the interface, we have
aunp+1,q(x) ≈ap+1,q
ue −up+1,q
hx/2 , x ∈∂Kpq ∩∂Kp+1,q. (5.78)
• Here the goal is to ﬁnd˜a such that
apq
ue −upq
hx/2 =ap+1,q
up+1,q −ue
hx/2 =˜aup+1,q −upq
hx
. (5.79)
• It can be solved as
˜a =
[ 1
2
( 1
apq
+ 1
ap+1,q
)]−1
, (5.80)
which is the harmonic average ofapq andap+1,q.


## Page 210

200 Chapter 5. Finite Element Methods for Elliptic Equations
5.8. Abstract Variational Problem
LetV be a normed space and consider the following abstract variational prob-
lem:
Findu ∈V such that
a(u,v ) =f(v), ∀v ∈V, (5.81)
where a(·, ·) : V ×V → R is a continuous bilinear form and f : V → R is a
continuous linear form.
Theorem 5.11. (Lax-Milgram Lemma) Suppose that V is a Hilbert
space with norm ∥ · ∥ . Let a(·, ·) : V ×V → R is a continuous V -elliptic
bilinear form in the sense that
∃α s.t. α∥v∥2 ≤a(v,v ), ∀v ∈V, (5.82)
and f : V → R, a continuous linear form. Then, the abstract variational
problem (5.81) has one and only one solution.


## Page 211

5.8. Abstract Variational Problem 201
Existence and uniqueness of the solution: Consider the Laplace
equation
−∆u = f x ∈ Ω,
u = 0 x ∈ Γ =∂Ω.
(5.83)
Then, using the Green’s formula, its variational problem is formulated as fol-
lows:
Findu ∈V =H1
0(Ω) such that
a(u,v ) ≡ (∇u, ∇v) = (f,v ) ≡f(v), ∀v ∈V. (5.84)
Here the Hilbert space
H1
0(Ω) = {v : v ∇v are square-integrable and v|Γ = 0}
equipped with the norm ∥ · ∥1 deﬁned as
∥v∥2
1 = ∥v∥2
0 + ∥∇v∥2
0


## Page 212

202 Chapter 5. Finite Element Methods for Elliptic Equations
Theorem 5.12. The variational problem (5.84) has a unique solution.
Proof. Application of the Cauchy-Schwarz inequality shows that
|(∇u, ∇v)| ≤ ∥∇u∥0 · ∥∇v∥0 ≤ ∥∇u∥1 · ∥∇v∥1,
which implies thata(·, ·) is continuous onH1
0(Ω) ×H1
0(Ω).
Using the Poincaré inequality,
ˆ
Ω
u2dx ≤C
ˆ
Ω
|∇u|2dx, ∀v ∈H1
0(Ω), (5.85)
or
∥v∥2
0 ≤C∥∇v∥2
0 =Ca(v,v ),
we obtain
∥v∥2
0 + ∥∇v∥2
0 ≤ (1 +C)∥∇v∥2
0 = (1 +C)a(v,v ).
That is,
1
1 +C ∥v∥2
1 ≤a(v,v ) (5.86)
which shows that a(·, ·) is V -elliptic. Hence, by the Lax-Milgram lemma, the
variational problem has a unique solution.
TheV -ellipticity is sometimes said to be coercive.


## Page 213

5.9. Numerical Examples with Python 203
5.9. Numerical Examples with Python
A Python code is implemented for solving
−uxx =f, x ∈ (0, 1)
u =g, x = 0, 1, (5.87)
using high-order Galerkin FE methods.
The exact solution is chosen as
u(x) = sin(πx) (5.88)
so that the right-hand side becomes
f(x,y ) =π2 sin(πx)
For various number of grid pointsnx and the order of basis functionsk, the
maximum errors are found as in the table.
Table 5.1: The maximum error ∥u −uh∥∞.
k
nx 1 2 3 4
2 0.234 0.00739 0.000428 1.67e-05
4 0.053(2.14) 0.000562(3.72) 1.45e-05(4.88) 3.37e-07(5.63)
8 0.013(2.03) 3.67e-05(3.94) 4.61e-07(4.98) 5.58e-09(5.92)
16 0.00322(2.01) 2.31e-06(3.99) 1.45e-08(4.99) 8.84e-11(5.98)
The numbers in parentheses denote convergence rates. Note that super-
convergence is observed fork ≥ 2.


## Page 214

204 Chapter 5. Finite Element Methods for Elliptic Equations
The following shows the main routineFEM_1D_High_Order.py, the user pa-
rameter ﬁleUSER_PARS.py, and the core functions for the construction of the
stiffness matrix.
## FEM_1D_High_Order.py
##-- read USER_PARS and util ---------
from USER_PARS import *
from util_FEM_1D import *
level = 2
print_USER_PARS(level)
from fem_1d import *
#------------------------------------
A = stiffness_mtx(level)
b = get_rhs(level)
dirichlet_BC(A)
ALU = mtx_banded_lu(A,level)
mtx_banded_lusol(ALU,b)
U = exact_sol(level)
print "L8-error = %.3g" %(max_difference(U,b))
## USER_PARS.py
##-----------------------
ax,bx = 0.,1.0;
nx = 20
poly_order = 3
## fem_1d.py
##-----------------------
def stiffness_mtx(level=0):
A = np.ndarray((row,col),float)
init_array(A)
for e in range (nx):


## Page 215

5.9. Numerical Examples with Python 205
g0,g1 = e*kpoly,(e+1)*kpoly
xl,xr = XG[e],XG[e+1]
E = element_stiffness(xl,xr,kpoly)
for i in range(kpoly+1):
for j in range(kpoly+1):
A[g0+i][kpoly+j-i] += E[i][j]
return A
def element_stiffness(xl,xr,kpoly):
m = kpoly+1
E = np.ndarray((m,m),float)
init_array(E)
XL,WT = local_points_weights(xl,xr,kpoly)
XT = get_XT(XL)
for i in range(m):
for j in range(m):
for l in range(m):
dphi_i_xl=eval_dphi(i,kpoly,XL[i],XL[l],XT)
dphi_j_xl=eval_dphi(j,kpoly,XL[j],XL[l],XT)
E[i][j]+=(dphi_i_xl*dphi_j_xl*WT[l])
return E


## Page 216

206 Chapter 5. Finite Element Methods for Elliptic Equations
5.10. Homework
1. Consider the model problem (5.1). Verify that the algebraic system from
the linear Galerkin method is equivalent to that of ﬁnite difference method
when the mesh is uniform, i.e.,
h =hi, i = 1, · · ·,M + 1,
2. Prove (5.32) and (5.33). Hint: In each subintervalIj = [xj−1,xj], the differ-
ence betweenu and its linear interpolant can be expressed as follows: for
x ∈Ij,
u(x) −πhu(x) = u′′(ξj)
2! (x −xj−1)(x −xj), for some ξj ∈Ij.
(See (1.9)on p.7.)
3. Let Ω = (0, 1)2 and Γ =∂Ω and consider
−∇ · (a(x)∇u) =f, x ∈ Ω,
u =gD, x ∈ ΓD,
aun =gN, x ∈ ΓN,
(5.89)
where Γ = ΓD ∪ ΓN and ΓD and ΓN are distinct nonempty boundary por-
tions corresponding to the Dirichlet and Neumann boundary conditions,
respectively. Consider a FV method on a rectangular cells with cell-
centered nodal points, as considered in Section 5.6. Design to suggest
numerical methods for an effective treatment for each of the boundary
conditions. (You may assumegD =gN ≡ 0, if you want.)
4. Consider the following 1D elliptic problem of general form
−((1 +x2)ux)x + 5ux =f, x ∈ (0, 1)
ux(0) =gN, u(1) =gD
(5.90)
Choose the exact solution as in (5.88):
u(x) = sin(πx)
and correspondingly the right sidef and the boundary data,gN andgD.
(a) Formulate the Galerkin method for (5.90).


## Page 217

5.10. Homework 207
(b) Modify the Python code in §5.9 to solve the above problem.
(c) Carry out an error analysis as in Table 5.1.
5. Assume that v(x) ∈C1[a,b ] andv(a) = 0. Prove that the one-dimensional
Poincaré inequality
∥v∥0 ≤ b −a√
2 ∥v′∥0. (5.91)
Hint: You may begin with
v(x) =v(a) +
ˆ x
a
v′(t)dt =
ˆ x
a
v′(t)dt.
Thus, by the Cauchy-Schwarz inequality
|v(x)| ≤
ˆ x
a
|v′|dt ≤
(ˆ x
a
dt
)1/2(ˆ x
a
(v′)2dt
)1/2
≤
√
x −a ∥v′∥0
(5.92)
Now, square the inequality and then integrate over the interval.
6. (Optional) Use the arguments in the proof of Homework 5.5 to prove the
Poincaré inequality (5.85) when Ω = (0, 1)2:
ˆ
Ω
u2dx ≤C
ˆ
Ω
|∇u|2dx, ∀v ∈H1
0(Ω), (5.93)
for some C > 0. Try to determine the constant C as small as possible.(
Note that
ˆ
Ω
f(x)dx =
ˆ 1
0
ˆ 1
0
f(x,y )dxdy =
ˆ 1
0
ˆ 1
0
f(x,y )dydx.
)


## Page 218

208 Chapter 5. Finite Element Methods for Elliptic Equations


## Page 219

Chapter 6
FD Methods for Hyperbolic Equations
This chapter considers ﬁnite difference methods for hyperbolic PDEs. We be-
gin with numerical methods for the linear scalar wave equation. Then, numer-
ical methods for conservation laws are treated along with nonlinear stability.
A Python code is included for the Lax-Wendroff scheme to solve the one-way
wave equation.
209


## Page 220

210 Chapter 6. FD Methods for Hyperbolic Equations
6.1. Introduction
Consider the initial value problem
ut +A ux = 0
u|t=0 = u0(x), (6.1)
whereA = [aij] ∈ Rm×m and u is a vector function ofm components,m ≥ 1.
• The problem (6.1) is well-posed if and only if all eigenvalues of A are real
and there is a complete set of eigenvectors [27].
• Such a system is called (strongly) hyperbolic.
• We will restrict our discussions to such hyperbolic problems.


## Page 221

6.1. Introduction 211
Let {φ1, · · ·,φm} be the complete set of eigenvectors corresponding to the
eigenvalues {λ1, · · ·,λm}. Deﬁne a matrix
S = [φ1, · · ·,φm], Γ = diag(λ1, · · ·,λm).
Then, from linear algebra theory, we obtain
A =SΓS−1. (6.2)
ApplyS−1 to (6.1) to have
S−1ut + ΓS−1 ux = 0
S−1u|t=0 = S−1u0(x). (6.3)
Let˜u =S−1u. Then, (6.3) is reduced to the following m scalar equations
˜ui,t +λi˜ui,x = 0, i = 1, · · ·,m,
˜ui|t=0 = ˜ui,0(x). (6.4)


## Page 222

212 Chapter 6. FD Methods for Hyperbolic Equations
Hence the chapter begins with discussions focusing on the scalar equation:
ut +aux = 0, (x,t ) ∈ Ω ×J,
u(x, 0) =u0(x), x ∈ Ω, t = 0, (6.5)
where Ω = ( ax,bx) ⊂ R and J = (0,T ], T > 0, the time interval. Here the
boundary condition is ignored for simplicity. (Or, we may assumeΩ = R.)
Whena is a constant, (6.5) has the exact solution
u(x,t ) =u0(x −at). (6.6)


## Page 223

6.2. Basic Difference Schemes 213
6.2. Basic Difference Schemes
We begin with our discussion of ﬁnite difference (FD) schemes for (6.5) by
deﬁning grid points in the (x,t ) plane.
Let ∆x and ∆t be the spatial and temporal grid sizes, respectively; then the
grid will be the points
(xm,tn) = (m∆x,n ∆t)
for integers m and n ≥ 0. For a function v deﬁned either on the grid or for
continuously varying (x,t ), we writevn
m for the value ofv at (xm,tn), i.e.,
vn
m =v(xm,tn).
Let
Sn := Ω × (tn−1,tn]
be thenth space-time slice. Suppose that the computation has been performed
for uj = {uj
m}, 0 ≤ j ≤ n − 1. Then, the task is to compute un by integrating
the equation on the space-time slice Sn, utilizing FD schemes.


## Page 224

214 Chapter 6. FD Methods for Hyperbolic Equations
The following presents examples of the forward-time (explicit) schemes for
(6.5):
(a) vn
m −vn−1
m
∆t +avn−1
m −vn−1
m−1
∆x = 0,
(b) vn
m −vn−1
m
∆t +avn−1
m+1 −vn−1
m
∆x = 0,
(c) vn
m −vn−1
m
∆t +avn−1
m+1 −vn−1
m−1
2∆x = 0,
(d) vn
m −vn−2
m
2∆t +avn−1
m+1 −vn−1
m−1
2∆x = 0, (leapfrog)
(e) vn
m − vn−1
m+1+vn−1
m−1
2
∆t +avn−1
m+1 −vn−1
m−1
2∆x = 0. (Lax-Friedrichs)
(6.7)
These explicit schemes shall be exempliﬁed in describing properties of nu-
merical methods.


## Page 225

6.2. Basic Difference Schemes 215
6.2.1. Consistency
The bottom line for accurate numerical methods is that the discretization be-
comes exact as the grid spacing tends to zero, which is the basis ofconsistency.
Recall the deﬁnition of consistency.
Deﬁnition 6.1. Given a PDE Pu = f and a FD scheme P∆x,∆tu = f, the
FD scheme is said to be consistent with the PDE if for every smooth function
φ(x,t )
Pφ −P∆x,∆tφ → 0 as (∆x, ∆t) → 0,
with the convergence being pointwise at each grid point.
Not all numerical methods based on Taylor series expansions are consis-
tent.


## Page 226

216 Chapter 6. FD Methods for Hyperbolic Equations
Example 6.2. The forward-time forward-space scheme is consistent.
Proof. For the one-way wave equation (6.5),
Pφ ≡
(∂
∂t +a ∂
∂x
)
φ =φt +aφx.
For the forward-time forward-space scheme (6.7b),
P∆x,∆tφ = φn
m −φn−1
m
∆t +aφn−1
m+1 −φn−1
m
∆x .
To ﬁnd the truncation error of the numerical scheme, we begin with the Taylor
series inx andt about (xm,tn):
φn
m =φn−1
m + ∆tφt(xm,tn−1) + ∆t2
2 φtt(xm,tn−1) + O(∆t3),
φn−1
m+1 =φn−1
m + ∆xφx(xm,tn−1) + ∆x2
2 φxx(xm,tn−1) + O(∆x3).
With some algebra, one can obtain
P∆x,∆tφ =φt +aφx + ∆t
2 φtt +a∆x
2 φxx + O(∆x2 + ∆t2).
Thus, as (∆x, ∆t) → 0,
Pφ −P∆x,∆tφ = −∆t
2 φtt −a∆x
2 φxx + O(∆x2 + ∆t2) → 0.
Therefore, the scheme is consistent.


## Page 227

6.2. Basic Difference Schemes 217
6.2.2. Convergence
A numerical method is said to be convergent if the solution of the FD scheme
tends to the exact solution of the PDE as the grid spacing tends to zero. We
redeﬁne convergence in a formal way as follows:
Deﬁnition 6.3. A FD scheme approximating a PDE is said to be convergent
if
u(x,t ) −un
m → 0 as (xm,tn) → (x,t ) as (∆x, ∆t) → 0,
where u(x,t ) is the exact solution of PDE and un
m denotes the the solution of
the FD scheme.
Consistency implies that the truncation error
(Pu −P∆x,∆tu) → 0
as ∆x and ∆t approach zero. So consistency is certainly necessary for con-
vergence. But as the following example shows, a numerical scheme may be
consistent but not convergent.


## Page 228

218 Chapter 6. FD Methods for Hyperbolic Equations
Figure 6.1: The characteristic curve passing the origin of the xt-plane.
Example 6.4. The forward-time forward-space scheme for (6.5) is not con-
vergent, whena> 0.
Proof. The scheme (6.7b) is consistent from Example 6.2. The problem (6.5)
has the exact solution
u(x,t ) =u0(x −at),
a shift of u0 by at. The lines having the slope 1/a in the xt-plane become
characteristics of the problem; when a > 0, the characteristic curve passing
the origin is shown in Figure 6.1.
On the other hand, the scheme (6.7b) can be rewritten as
vn
m =vn−1
m −aλ(vn−1
m+1 −vn−1
m ) = (1 +aλ)vn−1
m −aλvn−1
m+1, (6.8)
whereλ = ∆t/∆x. Let the initial data be given
u0(x) =
{ 1, if x ≤ 0,
0, else.
Since it is natural for the scheme to take the initial data
v0
m =
{ 1, if xm ≤ 0,
0, else,
it follows from (6.8) that
vn
m ≡ 0 ∀m> 0, n ≥ 0.


## Page 229

6.2. Basic Difference Schemes 219
Figure 6.2: The forward-time forward-space scheme forut +aux = 0,a> 0.
See Figure 6.2. The above holds for any choices of ∆x and ∆t. Therefore, vn
m
cannot converge to the exact solutionu(x,t ) in (6.6).
Showing that a given consistent scheme is convergent is not easy in gen-
eral, if attempted in a direct manner as in Homework 6.1. However, there is
a related concept, stability, that is easier to check.


## Page 230

220 Chapter 6. FD Methods for Hyperbolic Equations
6.2.3. Stability
Example 6.4 shows that consistency is not enough for a numerical method to
guarantee convergence of its solution to the exact solution. In order for a con-
sistent numerical scheme to be convergent, the required property is stability.
Recall theL2-norm of grid functionv:
∥v∥∆x =
(
∆x
∞∑
m=−∞
|vm|2
)1/2
.
Deﬁnition 6.5. A FD scheme P∆x,∆tv = 0 for a homogeneous PDE Pu = 0 is
stable if for any positiveT, there is a constantCT such that
∥vn∥∆x ≤CT
J∑
j=0
∥vj∥∆x, (6.9)
for 0 ≤ tn ≤ T and for ∆x and ∆t sufﬁciently small. Here J is chosen to
incorporate the data initialized on the ﬁrstJ + 1 levels.


## Page 231

6.2. Basic Difference Schemes 221
Example 6.6. The schemes (6.7a) and (6.7b) can be written of the form
vn
m =αvn−1
m +βvn−1
m∓1.
Then they are stable if |α| + |β| ≤ 1.
Proof. Indeed, for the scheme (6.7a),
∞∑
m=−∞
|vn
m|2 =
∞∑
m=−∞
|αvn−1
m +βvn−1
m−1|2
≤
∞∑
m=−∞
|αvn−1
m |2 + 2|αβvn−1
m vn−1
m−1| + |βvn−1
m−1|2
≤
∞∑
m=−∞
|α|2|vn−1
m |2 + |α||β|(|vn−1
m |2 + |vn−1
m−1|2) + |β|2|vn−1
m−1|2
=
∞∑
m=−∞
(|α| + |β|)2|vn−1
m |2.
Thus the scheme is stable if |α| + |β| = |1 −aλ| + |aλ| ≤ 1, where λ = ∆t/∆x.
Therefore, a sufﬁcient condition for stability of (6.7a) is 0 ≤ aλ ≤ 1. The
analysis is similar for (6.7b); it is stable if −1 ≤aλ ≤ 0.
The stability inequality (6.9) can be easily satisﬁed when
∥vn∥∆x ≤ (1 +C∆t)∥vn−1∥∆x, (6.10)
for someC ≥ 0 independent on ∆t.


## Page 232

222 Chapter 6. FD Methods for Hyperbolic Equations
Theorem 6.7. (Lax-Richtmyer Equivalence Theorem). Given a well-
posed linear initial value problem and its FD approximation that satisﬁes the
consistency condition, stability is the necessary and sufﬁcient condition for
convergence.
The above theorem is very useful and important. Providing convergence
is difﬁcult for most problems. However, the determination of consistency of a
scheme is quite easy as shown in §6.2.1, and determining stability is also eas-
ier than showing convergence. Here we introduce the von Neumann analysis
of stability of FD schemes, which allows one to analyze stability much simpler
than a direct veriﬁcation of (6.9).
The von Neumann analysis
A simple procedure of the von Neumann analysis reads
• Replacevn
m bygneimϑ for each value ofm andn.
• Find conditions on coefﬁcients and grid spacings which would satisfy|g| ≤
1 +C∆t, for someC ≥ 0.


## Page 233

6.2. Basic Difference Schemes 223
The Courant-Friedrichs-Lewy (CFL) condition
The von Neumann analysis is not easy to utilize for rather general problems,
in particular, for nonlinear problems . In computational ﬂuid dynamics
(CFD), a more popular concept is the so-called CFL condition.
Theorem 6.8. Given an explicit scheme forut +aux = 0 of the form
vn
m =αvn−1
m−1 +βvn−1
m +γvn−1
m+1
with λ = ∆t/∆x held constant, a necessary condition for stability is the
Courant-Friedrichs-Lewy (CFL) condition
|aλ| ≤ 1.
Proof. Let ∆t = 1/n, for somen ≥ 1. Then the physical domain of dependence
for the exact solution at the point (x,t ) = (0, 1) must be (±a, 0), i.e.,
u(0, 1) =u0(±a).
On the other hand, it follows from the FD scheme that the numerical solu-
tionvn
0 depends onv0
m, |m| ≤ n. Since
m∆x =m∆t/λ ≤n∆t/λ = 1/λ,
we can see that the numerical solution at (0, 1),vn
0 , depends onx for |x| ≤ 1/λ.
Suppose |aλ|> 1. Then we have |a|> 1/λ. So vn
0 depends onx for
|x| ≤ 1/λ< |a|.
Thus vn
0 cannot converge to the exact value u(0, 1) = u0(±a) as ∆x → 0 with
λ = ∆t/∆x keeping constant. This proves the theorem.
One can see from the above theorem and proof that
stability requires the numerical domain of dependence contain the physical
domain of dependence.
This physical observation is very useful for stability analysis for certain
nonlinear problems [40].


## Page 234

224 Chapter 6. FD Methods for Hyperbolic Equations
6.2.4. Accuracy
We deﬁne the order of accuracy for numerical schemes for PDEs.
Deﬁnition 6.9. (Order of accuracy). LetP∆x,∆tu =R∆x,∆tf be a numerical
scheme forPu =f. Assume that for every smooth function φ,
P∆x,∆tφ =R∆x,∆t(Pφ ) + O(∆xp) + O(∆tq).
Then, the scheme is said to have thep-th order accuracy in space and theq-th
order accuracy in time , and denoted by the “accuracy order (p,q ) in space-
time".
For example, the forward-time forward-space, forward-time central-space,
and leapfrog schemes for (6.5) have the accuracy orders (1, 1), (2, 1), and (2, 2)
in space-time, respectively.


## Page 235

6.2. Basic Difference Schemes 225
Crank-Nicolson (CN) scheme: Consider the one-way wave equation with a
source term
ut +aux =f. (6.11)
The scheme is based on central differences about (x,tn−1/2), where tn−1/2 =
(tn−1 +tn)/2. Since
ut(xm,tn−1/2) = un
m −un−1
m
∆t + O(∆t2),
ux(xm,tn−1/2) = ux(xm,tn) +ux(xm,tn−1)
2 + O(∆t2)
= 1
2
[un
m+1 −un
m−1
2∆x +un−1
m+1 −un−1
m−1
2∆x
]
+ O(∆x2) + O(∆t2),
f(xm,tn−1/2) = fn
m +fn−1
m
2 + O(∆t2),
we obtain the CN scheme
vn
m −vn−1
m
∆t +a
2
[vn
m+1 −vn
m−1
2∆x +vn−1
m+1 −vn−1
m−1
2∆x
]
= fn
m +fn−1
m
2 , (6.12)
where the truncation error is
O(∆x2) + O(∆t2).
Thus the CN scheme has the accuracy order (2, 2).


## Page 236

226 Chapter 6. FD Methods for Hyperbolic Equations
It follows from the von Neumann analysis presented in §6.2.3 that the am-
pliﬁcation factor for the CN scheme is
g(ϑ) = 1 −iaλ
2 sinϑ
1 +iaλ
2 sinϑ, λ = ∆t
∆x.
Thus its magnitude is identically one and therefore the CN scheme is stable
for every choice of ∆x and ∆t (unconditional stability).
Note: The numerical solution of the CN method (6.12) may involve oscilla-
tions when the initial data is nonsmooth.
For a wide range of PDEs, the CN scheme is unconditionally stable and
of a second-order accuracy in both space and time. These two advantageous
properties have made the scheme quite popular.


## Page 237

6.3. Conservation Laws 227
6.3. Conservation Laws
The conservation laws in one-dimensional (1D) space have the form
∂
∂tu(x,t ) + ∂
∂xf(u(x,t )) = 0. (6.13)
Here
u : R × R → Rm
and f : Rm → Rm is called the ﬂux function . For simplicity, we may consider
the pure initial value problem, or Cauchy problem, in which (6.13) holds for
−∞<x< ∞ andt ≥ 0. In this case we must specify initial conditions only
u(x, 0) =u0(x), −∞<x< ∞. (6.14)
We assume that the system (6.13) is hyperbolic. That is, the Jacobian ma-
trixf ′(u) of the ﬂux function is
• of real eigenvalues, and
• diagonalizable, i.e., there is a complete set of m linearly independent
eigenvectors.
In 2D, a system of conservation laws can be written as
ut +f(u)x +g(u)y = 0, (6.15)
where
u : R2 × R → Rm, f,g : Rm → Rm.
6.3.1. Euler equations of gas dynamics
Consider “a tube" where properties of the gas such as density and velocity are
assumed to be constant across each cross section of the tube. Let ρ(x,t ) and
v(x,t ) be respectively the density and the velocity at pointx and timet. Then
mass in [x1,x 2] at timet =
ˆ x2
x1
ρ(x,t )dx.


## Page 238

228 Chapter 6. FD Methods for Hyperbolic Equations
Assume that the walls of the tube are impermeable and that mass is neither
created nor destroyed. Then the mass in a section [x1,x 2] can change only
because of gas ﬂowing across the end points x1 andx2. The rate of ﬂow, or ﬂux
of gas at (x,t ) is given by
mass ﬂux at (x,t ) =ρ(x,t )v(x,t ).
Thus, the change rate of mass in [x1,x 2] is
d
dt
ˆ x2
x1
ρ(x,t )dx =ρ(x1,t )v(x1,t ) −ρ(x2,t )v(x2,t ), (6.16)
which is one integral form of conservation law.


## Page 239

6.3. Conservation Laws 229
Integrate (6.16) in time fromt1 tot2 to have
ˆ x2
x1
ρ(x,t 2)dx =
ˆ x2
x1
ρ(x,t 1)dx
+
ˆ t2
t1
ρ(x1,t )v(x1,t )dt −
ˆ t2
t1
ρ(x2,t )v(x2,t )dt.
(6.17)
This is another integral form of conservation law.
Geometric interpretation for (6.17):


## Page 240

230 Chapter 6. FD Methods for Hyperbolic Equations
Derivation of differential form : Now, assume ρ and v are differentiable.
Since
ρ(x,t 2) −ρ(x,t 1) =
ˆ t2
t1
∂
∂tρ(x,t )dt,
ρ(x2,t )v(x2,t ) −ρ(x1,t )v(x1,t ) =
ˆ x2
x1
∂
∂x (ρ(x,t )v(x,t ))dx,
the equation (6.17) reads
ˆ t2
t1
ˆ x2
x1
[∂
∂tρ(x,t ) + ∂
∂x (ρ(x,t )v(x,t ))
]
dxdt = 0. (6.18)
Since this must hold for any section [x1,x 2] and for any time interval [t1,t 2],
the integrand in (6.18) must be identically zero, i.e.,
ρt + (ρv)x = 0. (conservation of mass) (6.19)


## Page 241

6.3. Conservation Laws 231
Euler equations of gas dynamics:
ρt + (ρv)x = 0, (conservation of mass)
(ρv)t + (ρv2 +p)x = 0, (conservation of momentum)
Et + (v(E +p))x = 0. (conservation of energy)
(6.20)
The rule of thumb (in the derivation of conservation laws) is that
• For any quantity z which is advected with the ﬂow will have a contribu-
tion to the ﬂux of the form zv.
• Besides advection, there are forces on the ﬂuid that cause acceleration
due to Newton’s laws. Since we assume there is no outside forces, the
only force is due to variations in the ﬂuid itself; it is proportional to the
pressure gradient for momentum and proportional to the gradient of vp
for energy.


## Page 242

232 Chapter 6. FD Methods for Hyperbolic Equations
The pressure variable can be replaced by additional equations of physics,
called the state equations. For gases,
E = 1
2ρv2 +ρe, (total energy)
p =RρT, (pressure: ideal gas law)
e =cvT, (speciﬁc internal energy: polytropic gas)
h =e +p/ρ =cpT, (enthalpy: polytropic gas)
γ =cp/cv, (ratio of speciﬁc heat)
R =cp −cv. (polytropic gas)
The polytropic gas is such that the internal energy is proportional to the tem-
perature, so the coefﬁcients cv and cp are constants, called respectively the
speciﬁc heat at constant volume and the speciﬁc heat at constant pressure. (In
general, “speciﬁc" means “per unit mass".)


## Page 243

6.3. Conservation Laws 233
The equation of state for a polytropic gas: Note that T =p/(Rρ) so that
e =cvT = cv
R
p
ρ = cv
cp −cv
p
ρ = 1
γ − 1
p
ρ.
Thus the equation of state for a polytropic gas is
E = p
γ − 1 + 1
2ρv2. (6.21)
Isothermal ﬂow : Assume the temperature is constant through the tube.
Then, from the ideal gas law,
p =RρT =a2ρ,
wherea =
√
RT is the sound speed. Thus the isothermal equations read
[ ρ
ρv
]
t
+
[ ρv
ρv2 +a2ρ
]
x
= 0. (6.22)


## Page 244

234 Chapter 6. FD Methods for Hyperbolic Equations
6.4. Shocks and Rarefaction
6.4.1. Characteristics
Consider the linear advection equation
ut +aux = 0,
u(x, 0) =u0(x). (6.23)
The exact solution is simply
u(x,t ) =u0(x −at), t ≥ 0.
The solution is constant along each ray x −at = x0. Such rays are known as
the characteristics of the equation.
Note that the characteristics are curves in thex-t plane satisfying the ODE
x′(t) =a,x(0) =x0. Let us differentiateu(x,t ) along one of these curves to ﬁnd
the change rate of the solution along the characteristics:
d
dtu(x,t ) = ∂
∂tu(x,t ) + ∂
∂xu(x,t )x′ =ut +aux = 0,
which conﬁrms thatu is constant along the characteristics.
There is a fundamental property of linear hyperbolic equations: singulari-
ties propagate only along characteristics.


## Page 245

6.4. Shocks and Rarefaction 235
Nonsmooth data: We consider the so-called vanishing-viscosity approach.
Letuε be the solution of
ut +aux =εuxx. (6.24)
Thenuε is smooth for t >0 even ifu0 is not smooth, because it is the solution
of a parabolic equation.
Note that (6.24) simpliﬁes if we make a change of variables to follow the
characteristics:
vε(x,t ) =uε(x +at,t ).
Thenvε satisﬁes the heat equation
vε
t (x,t ) =εvε
xx(x,t ).
Thus, after solving the heat equation, we can compute uε(x,t ) = vε(x −at,t )
explicitly. It is easy to verify that the vanishing-viscosity solution is equal to
u0(x −at):
lim
ε→0
uε(x,t ) =u(x,t ) =u0(x −at).


## Page 246

236 Chapter 6. FD Methods for Hyperbolic Equations
6.4.2. Weak solutions
A natural way to deﬁne a generalized solution of the inviscid equation that
does not require differentiability is to go back to the integral form of the con-
servation law. We say u(x,t ) is a generalized solution if (6.17) is satisﬁed for
allx1,x2,t1, andt2.
There is another approach that results in a different integral formulation
that is often more convenient to work with.
Letφ ∈ C1
0(R × R+). Multiply ut +f(u)x = 0 byφ and integrate over space
and time to have ˆ ∞
0
ˆ ∞
−∞
[φut +φf(u)x]dxdt = 0.
Using integration by parts gives
ˆ ∞
0
ˆ ∞
−∞
[φtu +φxf(u)]dxdt = −
ˆ ∞
−∞
φ(x, 0)u(x, 0)dx. (6.25)
Deﬁnition 6.10. The functionu(x,t ) is called a weak solution ofut+f(u)x = 0
if (6.25) holds for allφ ∈C1
0(R × R+).


## Page 247

6.4. Shocks and Rarefaction 237
Known facts:
• Any weak solution satisﬁes the original integral conservation law.
• The vanishing-viscosity generalized solution is a weak solution.
• For nonlinear problems, weak solutions are often not unique, and there-
fore an additional problem is often considered to identify which weak so-
lution is the physically correct vanishing-viscosity solution.
• There are other conditions to avoid working with the viscous equation di-
rectly. They are usually called theentropy conditions. Thus the vanishing-
viscosity solution is also called the entropy solution.


## Page 248

238 Chapter 6. FD Methods for Hyperbolic Equations
6.5. Numerical Methods
6.5.1. Modiﬁed equations
In this subsection, we brieﬂy review accuracy and stability for the Riemann
problem of the linear advection equation:
ut +aux = 0, x ∈ R, t ≥ 0,
u0(x) =
{ 1, x< 0,
0, x> 0.
(6.26)
The exact solution is given
u(x,t ) =u0(x −at). (6.27)
Consider the following numerical schemes:
Un+1
j −Un
j
k +aUn
j −Un
j−1
h = 0, (explicit one-sided)
Un+1
j −
Un
j+1+Un
j−1
2
k +aUn
j+1 −Un
j−1
2h = 0, (Lax-Friedrichs)
Un+1
j −Un
j
k +aUn
j+1 −Un
j−1
2h
−k
2a2Un
j+1 − 2Un
j +Un
j−1
h2 = 0. (Lax-Wendroff)
(6.28)


## Page 249

6.5. Numerical Methods 239
Lax-Wendroff scheme: Note that
ut(xj,tn) = Un+1
j −Un
j
k −k
2utt −k2
6uttt − · · ·.
Since
ut = −aux,
we have
utt = (ut)t = (−aux)t = −auxt = −autx
= −a(ut)x = −a(−aux)x =a2uxx
Therefore, the Lax-Wendroff scheme can be obtained by taking care of utt =
a2uxx by the central scheme; its truncation error is
−k2
6uttt −ah2
6uxxx + · · · = k2
6a3uxxx −ah2
6uxxx + · · ·
= h2
6a
(k2
h2a2 − 1
)
uxxx + · · ·
Thus, whenh andk are sufﬁciently small, solving (6.26) by the Lax-Wendroff
scheme is equivalent to solving the following equation exactly:
ut +aux = h2
6a
(k2
h2a2 − 1
)
uxxx. (6.29)
Equation (6.29) is called themodiﬁed equationof (6.26) for the Lax-Wendroff
scheme. By analyzing (6.29) in PDE sense, one can understand the Lax-
Wendroff scheme.


## Page 250

240 Chapter 6. FD Methods for Hyperbolic Equations
Finite difference equation was introduced in the ﬁrst place because it is eas-
ier to solve than a PDE; on the other hand, it is often easier to predict qualita-
tive behavior of a PDE than difference equations.
Dispersion analysis: Equation (6.29) is a dispersive equation of the form
ut +aux =µuxxx. (6.30)
To look at a Fourier series solution to this equation, takeu(x,t ) as
u(x,t ) =
ˆ ∞
−∞
ˆu(ξ,t )eiξxdξ,
where ξ is the wave number . Here the purpose is to see that the Fourier
components with different wave number ξ propagate at different speeds (dis-
persion).
Due to linearity, it sufﬁces to consider each wave number in isolation, so
suppose that we look for solution of (6.30) of the form
u(x,t ) =ei(ξx−ct), (6.31)
wherec =c(ξ) is called the frequency. Plugging this into (6.30) gives
c(ξ) =aξ +µξ 3. (6.32)
This expression is called the dispersion relation for (6.30).


## Page 251

6.5. Numerical Methods 241
Deﬁne
cp(ξ) =c(ξ)/ξ, (phase velocity)
cg(ξ) =c′(ξ). (group velocity)
The phase velocity is the speed of wave peaks or in single frequency, while the
group velocity is the speed of energy in wavetrain.
Then, for the modiﬁed equation of Lax-Friedrichs scheme in (6.29), we have
cp =a +µξ 2, c g =a + 3µξ 2. (6.33)
Recall that the CFL condition reads
|aλ| = |ak/h| ≤ 1.
Thus, when the Lax-Friedrichs scheme is stable, the coefﬁcient µ for (6.29)
must be nonpositive, i.e.,
µ = h2
6a
(k2
h2a2 − 1
)
≤ 0, (6.34)
which implies from (6.33) that both the phase velocity and the group velocity
are smaller than the actual velocitya.


## Page 252

242 Chapter 6. FD Methods for Hyperbolic Equations
Remarks:
• For the step function in (6.26), the Fourier spectrum decays only as
ˆu0(ξ) = O(1/ξ), as |ξ| → ∞.
(For smooth solutions, its Fourier spectrum decays exponentially.)
• Thus for the Lax-Wendroff scheme, dispersion becomes visible near
x =cgt.
(although the scheme satisﬁes the stability condition.)
• The numerical solution is oscillatory in the upstream (behind).


## Page 253

6.5. Numerical Methods 243
Beam-Warming scheme: This method is one-sided second-order veni-
son of the Lax-Wendroff scheme:
Un+1
j −Un
j
k +a3Un
j − 4Un
j−1 +Un
j−2
2h
−k
2a2Un
j − 2Un
j−1 +Un
j−2
h2 = 0. (Beam-Warming)
(6.35)
Then the associated modiﬁed equation reads
ut +aux =µuxxx, µ = h2
6a
(
2 − 3k
h a +k2
h2a2
)
. (6.36)
Remarks:
• Since µ> 0 for sufﬁciently smallk, the group velocity will be larger than
the actual speed a; there must be oscillation propagating faster than the
shock speed.
• Here the point is that a upwind modiﬁcation is not sufﬁcient enough to
cure oscillation.


## Page 254

244 Chapter 6. FD Methods for Hyperbolic Equations
Upwind (one-sided) scheme : For the explicit one-sided scheme in
(6.28), one can ﬁnd its modiﬁed equation as
ut +aux =εuxx, ε = 1
2ha
(
1 −k
ha
)
. (6.37)
Note that the stability requires ε ≥ 0. This is a heat equation; the solution
must be diffusive.
When the dispersion analysis is applied for (6.37), the dispersion relation
is complex-valued as
c(ξ) =aξ −iεξ2.
It is not appropriate to analyze dispersive behavior of the solution. What we
can claim is that the solution is diffusive.


## Page 255

6.5. Numerical Methods 245
6.5.2. Conservative methods
Consider the Burgers’s equation in conservation form:
ut +
(u2
2
)
x
= 0. (6.38)
It can be rewritten in advection form
ut +uux = 0. (6.39)
When we consider the advection form, a natural (explicit) numerical scheme
reads
Un+1
j −Un
j
k +Un
j
Un
j −Un
j−1
h = 0. (6.40)
When e.g. the initial value is given as
U 0
j =
{ 1, j <0,
0, j ≥ 0,
one can easily verify that
U 1
j =U 0
j, ∀j.
For other initial values, the scheme easily involves a large error in the shock
speed. Why? Answer: It is not conservative.


## Page 256

246 Chapter 6. FD Methods for Hyperbolic Equations
Conservative methods : Consider the following conservative form of
conservation law
ut +f(u)x = 0. (6.41)
Its simple and natural numerical method can be formulated as
Un+1
j −Un
j
k + F (Un
j−p,U n
j−p+1, · · ·,U n
j+q) −F (Un
j−p−1,U n
j−p+1, · · ·,U n
j+q−1)
h = 0,
(6.42)
for someF ofp +q + 1 arguments, called the numerical ﬂux function .
In the simplest case,p = 0 andq = 1. Then, (6.42) becomes
Un+1
j =Un
j−k
h[F (Un
j,U n
j+1)−F (Un
j−1,U n
j )]. (6.43)


## Page 257

6.5. Numerical Methods 247
The above numerical scheme is very natural if we view Un
j as an approxi-
mation of the cell averageun
j ,
un
j = 1
h
ˆ xj+1/2
xj−1/2
u(x,tn)dx.
Consider the integral form of the conservation law (6.17),
ˆ xj+1/2
xj−1/2
u(x,tn+1)dx =
ˆ xj+1/2
xj−1/2
u(x,tn)dx
+
ˆ tn+1
tn
f(u(xj−1/2,t ))dt −
ˆ tn+1
tn
f(u(xj+1/2,t ))dt.
(6.44)
Then, dividing byh, we have
un+1
j = un
j − 1
h
( ˆ tn+1
tn
f(u(xj+1/2,t ))dt −
ˆ tn+1
tn
f(u(xj−1/2,t ))dt
)
. (6.45)
Comparing this with (6.43), we can see that the numerical ﬂux F (Un
j,U n
j+1)
plays the role of an average ﬂux at x =xj+1/2 over the time interval [tn,tn+1]:
F (Un
j,U n
j+1)≈ 1
k
ˆ tn+1
tn
f (u(xj+1/2,t ))dt. (6.46)
The Godunov’s method is based on this approximation, assuming that the
solution is piecewise constant on each cell (xj−1/2,xj+1/2).


## Page 258

248 Chapter 6. FD Methods for Hyperbolic Equations
Upwind scheme: For the Burgers’s equation (6.38), the upwind scheme in
conservative form reads
Un+1
j =Un
j −k
h
[1
2(Un
j )2 − 1
2(Un
j−1)2
]
, (6.47)
where
F (Un
j,U n
j+1) = 1
2(Un
j )2.
Lax-Friedrichs scheme: The generalization of the Lax-Friedrichs scheme
to the conservation law takes the form
Un+1
j = 1
2(Un
j−1 +Un
j+1) − k
2h
[
f(Un
j+1) −f(Un
j−1)
]
, (6.48)
which can be rewritten in the conservation form by taking
F (Un
j,U n
j+1) = h
2k(Un
j −Un
j+1) + 1
2(f(Un
j ) +f(Un
j+1)). (6.49)


## Page 259

6.5. Numerical Methods 249
6.5.3. Consistency
The numerical method (6.43) is said to be consistent with the original conser-
vation law if the numerical ﬂux F reduces to the true ﬂux f for the constant
ﬂow. That is, if u(x,t ) ≡ˆu, say, then we expect
F (ˆu,ˆu) =f(ˆu), ∀ˆu ∈ R. (6.50)
We say F is Lipschitz continuous atˆu if there is a constant K ≥ 0 (which
may depend onˆu) such that
|F (v,w ) −f(ˆu)| ≤ K max(|v −ˆu|, |w −ˆu|).
Note that the Lipschitz continuity is sufﬁcient for consistency.


## Page 260

250 Chapter 6. FD Methods for Hyperbolic Equations
6.5.4. Godunov’s method
Un+1
j =Un
j −k
h[F (Un
j,U n
j+1) −F (Un
j−1,U n
j )], (6.51)
where
F (Un
j,U n
j+1) ≈ 1
k
ˆ tn+1
tn
f(˜u(xj+1/2,t ))dt =f(u∗(Un
j,U n
j+1)). (6.52)
Here
• ˜u(x,t ) is the piecewise constant representation of the solution, over the
grid cell (xj−1/2,xj+1/2).
• u∗(Un
j,U n
j+1) is the Riemann solution on {xj+1/2} × [tn,tn+1].
• The method is consistent.
• Stability of the method requires to choose k small enough to satisfy
σ = k
h max
j
|f ′(Un
j )| ≤ 1,
whereσ is called the Courant number.


## Page 261

6.6. Nonlinear Stability 251
6.6. Nonlinear Stability
To guarantee convergence, we need some form of stability, just as for linear
problems. Unfortunately, the Lax-Richtmyer Equivalence Theorem no longer
holds and we cannot use the same approach to prove convergence. In this sec-
tion, we will consider one form of nonlinear stability that allows us to prove
convergence results for a wide class of practical problems. So far, this ap-
proach has been completely successful only for scalar problems. For general
systems of equations with arbitrary initial data, no numerical method has
been prove to be stable or convergent, although convergence results have been
obtained in some special cases.


## Page 262

252 Chapter 6. FD Methods for Hyperbolic Equations
6.6.1. Total variation stability (TV-stability)
We ﬁrst deﬁne thetotal variation (TV) over [0,T ] by
TVT(u) = lim sup
ε→0
1
ε
ˆ T
0
ˆ ∞
−∞
|u(x +ε,t ) −u(x,t )|dxdt
+ lim sup
ε→0
1
ε
ˆ T
0
ˆ ∞
−∞
|u(x,t +ε) −u(x,t )|dxdt.
(6.53)
Deﬁne
∥v∥1,T =
ˆ T
0
∥v∥1dt =
ˆ T
0
ˆ ∞
−∞
|v(x,t )|dxdt
and
K = {u ∈L1,T :TVT(u) ≤R and Supp(u(·,t )) ⊂ [−M,M ], ∀t ∈ [0,T ]}. (6.54)
When we consider numerical solutionU = {Un
j }, piecewise constant, then
TVT(U) =
T/k∑
n=0
∞∑
j=−∞
[
k|Un
j+1 −Un
j | +h|Un+1
j −Un
j |
]
=
T/k∑
n=0
[
kTV (Un) + ∥Un+1
j −Un
j ∥1
]
.
(6.55)


## Page 263

6.6. Nonlinear Stability 253
Deﬁnition 6.11. We will say that a numerical method is total variation
stable (TV-stable), if all approximations Uk for k < k0 lie in some ﬁxed set of
the form (6.54) (whereR andM may depend on the initial datau0 and the ﬂux
functionf(u), but not onk).
Theorem 6.12. Consider a conservative method with a Lipschitz continuous
numerical ﬂuxF (U;j). Suppose that for each initial datau0, there exists some
k0,R> 0 such that
TV (Un) ≤R, ∀n,k withk <k0, nk ≤T. (6.56)
Then, the method is TV-stable.
Theorem 6.13. Suppose Uk is generated by a numerical method in conser-
vation form with Lipschitz continuous numerical ﬂux, consistent with some
scalar conservation law. If the method is TV-stable, then it is convergent in
the following sense
dist(Uk, W) → 0, ask → 0, (6.57)
where W = {w : w(x,t ) is a weak solution}.


## Page 264

254 Chapter 6. FD Methods for Hyperbolic Equations
6.6.2. Total variation diminishing (TVD) methods
We have just seen that TV-stability of a consistent and conservative numer-
ical method is enough to guarantee convergence, in the sense in (6.57). One
easy way to ensure TV-stability is to require that the TV be nonincreasing as
time evolves, so that the TV at any time is uniformly bounded by the TV of
the initial data. This requirement gives rise to the very important class of
methods.
Deﬁnition 6.14. The numerical method Un+1
j = H(Un;j) is called total vari-
ation diminishing (TVD) if
TV (Un+1) ≤TV (Un) (6.58)
for all grid functionsUn.
It can be shown that the true solution to the scalar conservation law has
this TVD property, i.e., any weak solutionu(x,t ) satisﬁes
TV (u(·,t 2)) ≤TV (u(·,t 1)) for t2 ≥t1. (6.59)
Thus it is reasonable to impose TVD on the numerical solution as well, yield-
ing a TV-stability and hence convergence method.


## Page 265

6.6. Nonlinear Stability 255
6.6.3. Other nonoscillatory methods
Monotonicity preserving methods : A method is monotonicity preserving
ifUn,n ≥ 1, are monotone for a monotone initial datau0.
Theorem 6.15. Any TVD method is monotonicity preserving.
Another attractive feature of the TVD requirement is that it is possible to
derive methods with a high order of accuracy that are TVD. By contrast, if we
deﬁne “stability" by mimicking certain other properties of the true solution,
we ﬁnd that accuracy is limited to ﬁrst order. Nevertheless, we introduce
some of these other concepts, because they are useful and frequently seen in
the literature.


## Page 266

256 Chapter 6. FD Methods for Hyperbolic Equations
l1-contracting methods : Any weak solution of a scalar conservation law
satisﬁes
∥u(·,t 2)∥1 ≤ ∥u(·,t 1)∥1, fort2 ≥t1. (6.60)
More generally: Ifu andv are both entropy solutions of the same conservation
law (but possibly with different data), and ifu0 −v0 has compact support, then
∥u(·,t 2) −v(·,t 2)∥1 ≤ ∥u(·,t 1) −v(·,t 1)∥1, fort2 ≥t1. (6.61)
This property is called L1-contraction. In discrete space l1, for grid functions
U = {Uj} we deﬁne thel1-norm by
∥U ∥1 =h
∞∑
j=−∞
|Uj|.
In analogy to the L1-contraction property (6.61) of the true solution operator,
we say that a numerical method
Un+1
j = H(Un;j) (6.62)
is l1-contracting if any two grid functions Un and Vn for which Un −Vn has
compact support satisfy
∥Un+1 −Vn+1∥1 ≤ ∥Un −Vn∥1. (6.63)


## Page 267

6.6. Nonlinear Stability 257
Theorem 6.16. Anyl1-contracting numerical method is TVD.
Proof. The proof depends on the following important relation between the
1-norm and TV: Given any grid functionU, deﬁneV by shiftingU as
Vj =Uj−1, ∀j.
Then
TV (U) = 1
h∥U −V ∥1.
Now, suppose the method (6.62) isl1-contracting. DeﬁneVn
j =Un
j−1. Note that
the methods under consideration are translation invariant, i.e.,
Vn+1
j = H(Vn;j).
Thusl1-contraction implies
TV (Un+1) = 1
h∥Un+1 −Vn+1∥1
≤ 1
h∥Un −Vn∥1
= TV (Un)
and hence the method is TVD.
Example 6.17. The upwind method is l1-contracting and therefore TVD,
provided the CFL condition is satisﬁed.


## Page 268

258 Chapter 6. FD Methods for Hyperbolic Equations
Monotone methods : Another useful property of the entropy-satisfying
weak solution is as following: If we take two sets of initial datau0 andv0, with
v0(x) ≥u0(x), ∀x,
then the respective entropy solutionsu andv satisfy
v(x,t ) ≥u(x,t ), ∀x, t. (6.64)
The numerical methodUn+1
j = H(Un;j) is called a monotone method if
Vn
j ≥Un
j ⇒Vn+1
j ≥Un+1
j , ∀j. (6.65)
To prove that a method is monotone, it sufﬁces to check that
∂
∂Un
i
H(Un;j) ≥ 0, ∀i, j, Un. (6.66)
This means that if we increase the value of any Un
i then the value of Un+1
j
cannot decrease as a result.
Example 6.18. The Lax-Friedrichs scheme (6.48) (See page 248) is monotone
provided that the CFL condition is satisﬁed, because
H(Un;j) = 1
2(Un
j−1 +Un
j+1) − k
2h
[
f(Un
j+1) −f(Un
j−1)
]
satisﬁes
∂
∂Un
i
H(Un;j) =



1
2
(
1 +k
hf ′(Un
j−1)
)
, i =j − 1,
1
2
(
1 −k
hf ′(Un
j+1)
)
, i =j + 1,
0, otherwise.


## Page 269

6.6. Nonlinear Stability 259
Theorem 6.19. Any monotone method isl1-contracting.
To summarize the relation between the different types of methods consid-
ered above, we have
monotone ⇒ l1-contracting ⇒ TVD
⇒ monotonicity preserving
Theorem 6.20. A monotone method is at most ﬁrst-order accurate.
Theorem 6.21. The numerical solution computed with a consistent mono-
tone method withk/h ﬁxed converges to the entropy solution ask → 0.
Note that the numerical solution by a TVD method converges to a weak
solution that may not be the entropy solution. However, the notion of TV-
stability is much more useful, because it is possible to derive TVD methods
that have better than ﬁrst-order accuracy.
We close the chapter with the following well-known theorem:
Theorem 6.22. (Godunov). A linear, monotonicity preserving method is at
most ﬁrst-order accurate.


## Page 270

260 Chapter 6. FD Methods for Hyperbolic Equations
6.7. Numerical Examples with Python
A Python code is implemented for the Lax-Wendroff scheme in (6.28), for solv-
ing
ut +aux = 0, (x,t ) ∈ (−1, 6) × (0, 2]
u(x, 0) =
{ 1, x ∈ [0, 2]
0, elsewhere,
(6.67)
wherea = 1.
Figure 6.3: The Lax-Wendroff scheme: (left) The initial solution and (right)
the solution att = 2.


## Page 271

6.7. Numerical Examples with Python 261
The following shows the main routinelax_wendroff.py:
def lax_wendroff(U0,ax,bx,nx,T,nt,a,level=0):
hx,ht = (bx-ax)/nx, T/nt
if level>=1:
print("Lax-Wendroff: a=%g, nx=%d, nt=%d, hx=%g, ht=%g")\
%(a,nx,nt,hx,ht)
U =np.ndarray((2,nx+1),float)
for i in range(nx+1):
U[0][i]=U0[i]; U[1][i]=0.
alam = a*ht/hx
alam2= alam**2
for n in range(0,nt):
id0,id1 = n%2,(n+1)%2
for j in range (1,nx):
U[id1][j]=U[id0][j]-(alam/2.)*(U[id0][j+1]-U[id0][j-1])\
+(alam2/2.)*(U[id0][j+1]-2.*U[id0][j]+U[id0][j-1])
return U[id1]


## Page 272

262 Chapter 6. FD Methods for Hyperbolic Equations
6.8. Homework
1. Find conditions on a and λ with which the FD schemes in (6.7.a)-(6.7.c)
are stable or unstable.
2. Consider the leapfrog scheme (6.7.d).
(a) Derive the relation
∞∑
m=−∞
|vn+1
m |2 + |vn
m|2 +aλ(vn+1
m vn
m+1 −vn+1
m+1vn
m)
=
∞∑
m=−∞
|vn
m|2 + |vn−1
m |2 +aλ(vn
mvn−1
m+1 −vn
m+1vn−1
m )
=
∞∑
m=−∞
|v1
m|2 + |v0
m|2 +aλ(v1
mv0
m+1 −v1
m+1v0
m)
(Hint: Multiply the leapfrog scheme by vn+1
m +vn−1
m and sum over all
m.)
(b) Show that
(1 − |aλ|)
∞∑
m=−∞
|vn+1
m |2 + |vn
m|2 ≤ (1 + |aλ|)
∞∑
m=−∞
|v1
m|2 + |v0
m|2.
(Hint: Use the inequality −1
2(x2 +y2) ≤xy ≤ 1
2(x2 +y2).)
(c) Conclude the scheme is stable if |aλ|< 1.
3. Consider ﬁnite difference schemes of the form
vn+1
m =αvn
m+1 +βvn
m−1.
(a) Show that they are stable if |α| + |β| ≤ 1.
(Use the arguments as in Example 6.6 rather than the Von Neumann
analysis.)
(b) Conclude that the Lax-Friedrichs scheme (6.7.e) is stable if |aλ| ≤ 1,
whereλ =k/h.
4. Verify the modiﬁed equation of the Beam-Warming scheme presented in
(6.36).


## Page 273

6.8. Homework 263
5. Derive the conservation form for the Lax-Friedrichs scheme applied to
the conservation law and presented in (6.48). (Use (6.49).)
6. Modify the Python code in § 6.7 to solve the one-way wave equation (6.67)
by the Beam-Warming scheme (6.35).


## Page 274

264 Chapter 6. FD Methods for Hyperbolic Equations


## Page 275

Chapter 7
Domain Decomposition Methods
The development of high-performance parallel computers has promoted the
effort to search for new efﬁcient parallel algorithms for scientiﬁc computa-
tion rather than parallelize existing sequential algorithms. In the last two
decades, domain decomposition (DD) methods have been studied extensively
for the numerical solution of PDEs.
265


## Page 276

266 Chapter 7. Domain Decomposition Methods
7.1. Introduction to DDMs
The earliest DD method for elliptic problems is the alternating method discov-
ered by Hermann A. Schwarz in 1869 [60], so it is called Schwarz alternating
method (SAM).
Schwarz used the method to establish the existence of harmonic functions
on the nonsmooth domains that were constructed as a union of regions where
the existence could be established by some other methods; see Figure 7.1.
Figure 7.1: The domain used by Schwarz to show the existence of harmonic
solutions on irregular domains.


## Page 277

7.1. Introduction to DDMs 267
• Indeed, for a given initial value, SAM provided a convergent sequence
with a limit that is the harmonic function satisfying the given boundary
condition.
• Each iteration of the method consists of two fractional steps.
– In the ﬁrst step, the previous approximation on Ω1 is replaced by the
harmonic function for which the Dirichlet data on˜Γ12 (:=∂Ω1 ∩ Ω2) is
given by the previous approximation on Ω2.
– The second step, in which new approximation is obtained on Ω2, is
carried out similarly.
• Therefore, an arbitrarily accurate approximation of the harmonic func-
tion in the domain Ω1 ∪ Ω2 can be computed by using only solvers for
circles and rectangles. The method of separation of variables can be used
for the solution of these subdomains.


## Page 278

268 Chapter 7. Domain Decomposition Methods
SAM: Historical Backgrounds
• SAM offers a process that can be carried out by a series of fast solvers on
relatively smooth subdomains.
• Over last two decades, Schwarz’s idea has been extensively applied to
various problems deﬁned on general domains.
• It has offered a possibility of efﬁcient numerical algorithms for poorly-
conditioned large-scale problems and of parallelism for the very large sys-
tems of linear or nonlinear algebraic equations that arise from discretiza-
tions of elliptic problems in ﬂuid dynamics, elasticity, wave propagation,
and other important areas.
• The main question for the classical SAM and its modern extensions has
been to show that the convergence rate of the iteration is satisfactory and
that it is independent or grows slowly when the mesh is to be reﬁned
and/or when the number of subdomains increases.
• It is not surprising that reducing the amount of overlap without a dete-
rioration of the convergence rate has become an important issue in theo-
retical analyses and numerical simulations using SAM.


## Page 279

7.2. Overlapping Schwarz Alternating Methods (SAMs) 269
Ω1 Ω2
0.3 (2,4)
˜Ω1
˜Ω2
Figure 7.2: Nonoverlapping and overlapping partitions of Ω.
7.2. Overlapping Schwarz Alternating Methods
(SAMs)
7.2.1. Variational formulation
Let Ω be a bounded domain in Rd,d ≤ 3, with Lipschitz boundary Γ =∂Ω.
Consider the following elliptic problem with a homogeneous Dirichlet bound-
ary condition: Find u ∈V =H1
0(Ω) such that
Lu := −∇ · (a(x)∇u) =f(x), x ∈ Ω,
u = 0, x ∈ Γ, (7.1)
where we assumed that 0<a ∗ ≤a(x) ≤a∗< ∞.
The problem (7.1) in its variational form reads
a(u,v ) = (f,v ), v ∈V, (7.2)
where
a(u,v ) =
ˆ
Ω
a∇u · ∇vdx, (f,v ) =
ˆ
Ω
fvd x.


## Page 280

270 Chapter 7. Domain Decomposition Methods
7.2.2. SAM with two subdomains
In the simplest form, SAM decomposes the original domain into two overlap-
ping subdomains˜Ω1 and˜Ω2; see Figure 7.2. Let
˜Vj = {v ∈V :v = 0 on Ω \˜Ωj}, j = 1, 2.
Then,˜Vj are subspaces ofV andV =˜V1+˜V2. Let an initial guessu0 = {u0
1,u 0
2} ∈
V be given. Then, the iterate un ∈ V is determined from un−1 by sequentially
solving
(a) Lun−1/2
1 =f, in˜Ω1,
(b) un−1/2
1 = 0, on˜Γ1,
(c) un−1/2
1 =un−1
2 , on˜Γ12,
(d) Lun
2 =f, in˜Ω2,
(e) un
2 = 0, on˜Γ2,
(f) un
2 =un−1/2
1 , on˜Γ21,
(7.3)
where˜Γj =∂˜Ωj ∩∂Ω and˜Γjk =∂˜Ωj ∩ Ωk.
• This multiplicative Schwarz method solves at each iteration a series of
smaller problems restricted on subdomains.
• These subproblems require an additional boundary condition on the inte-
rior (artiﬁcial) boundaries˜Γjk.
• The Schwarz method is easy to implement and can be applied to more
general elliptic differential operators and domains.


## Page 281

7.2. Overlapping Schwarz Alternating Methods (SAMs) 271
7.2.3. Convergence analysis
Let us consider the error propagation operator of (7.3); see [47, 70] for details.
In (7.3), one may extend un−1/2
1 by un−1
2 on Ω2 and un
2 by un−1/2
1 on Ω1. In the
variational form, (7.3) reads
a(un−1/2
1 ,v ) = ( f,v ), v ∈˜V1, un−1/2
1 −un−1 ∈˜V1,
a(un
2,v ) = ( f,v ), v ∈˜V2, un
2 −un−1/2 ∈˜V2. (7.4)
Since
(f,v ) =a(u,v ), v ∈˜Vj, j = 1, 2,
one can rewrite (7.4) as
a(un−1/2
1 −un−1,v ) = a(u −un−1,v ), v ∈˜V1, un−1/2
1 −un−1 ∈˜V1,
a(un
2 −un−1/2,v ) = a(u −un−1/2,v ), v ∈˜V2, un
2 −un−1/2 ∈˜V2. (7.5)
It is easy and convenient to describe the method in terms of two projections
Pj,j = 1, 2, onto˜Vj, deﬁned by
a(Pjv,w ) =a(v,w ), ∀w ∈˜Vj.
Then, (7.5) obviously means
un−1/2 −un−1 = P1(u −un−1),
un −un−1/2 = P2(u −un−1/2),
or equivalently
u −un−1/2 = ( I −P1) (u −un−1),
u −un = ( I −P2) (u −un−1/2),
whereI is the identity operator. Therefore, the error propagates as
u −un = (I −P2) (I −P1) (u −un−1). (7.6)
Domain Decomposition for FEMs : Now, let Vh be the piecewise linear
FE subspace of V corresponding to a regular triangulation Th. Then the FE
method for the variational problem (7.2) can be formulated as follows: Find
uh ∈Vh such that
a(uh,vh) = (f,v h), v h ∈Vh. (7.7)


## Page 282

272 Chapter 7. Domain Decomposition Methods
The FE procedure corresponding to the DDM (7.3) is formulated by ﬁnding
iterates {un−1/2, un} fromVh. One can consider analogous projections Pj, j =
1, 2, onto ˜Vh
j (:= ˜Vj ∩Vh) for FE methods. Then, the error for the FE methods
propagates as
uh −uh,n = (I −P2) (I −P1) (uh −uh,n−1). (7.8)
So, the FE formulation of (7.3) can be viewed as an iterative method for
solving
(P1 +P2 −P2P1)uh =gh, (7.9)
with an appropriate right hand side gh. Here the upshot/hope is that the
condition number of (P1 +P2 −P2P1) is much smaller than that of the original
algebraic system.


## Page 283

7.2. Overlapping Schwarz Alternating Methods (SAMs) 273
Notes
• The multiplicative Schwarz method has an important variant, i.e., the
additive Schwarz method which decouples the subproblems (7.3.a)-(7.3.c)
and (7.3.d)-(7.3.f). In additive Schwarz method, (7.3.f) is replaced by
un
2 =un−1
1 , on˜Γ21;
the additive algorithm is a simple iterative method for solving
(P1 +P2)uh =gh
0, (7.10)
for somegh
0; see Exercise 7.1.
• Such Schwarz methods can be generalized immediately to any number of
overlapping subdomains ˜Ωj expanded from the original nonoverlapping
subdomains Ωj,j = 1, 2, · · ·,M .


## Page 284

274 Chapter 7. Domain Decomposition Methods
7.2.4. Coarse subspace correction
LetHj measure the size of Ωj and
H = max
j=1,···,M
Hj.
It is known that a DD preconditioner for which the new iterate is updated by
the former solutions on local subregions of diameter on the order of H has a
condition number which grows at least as fast as1/H2; see [19] and references
therein.
To overcome this difﬁculty, one can introduce thecoarse subspace correction
technique as a preconditioner. Then, our FE space is represented as the sum
ofM + 1 subspaces
Vh =Vh
0 +˜Vh
1 + · · · +˜Vh
M, (7.11)
where Vh
0 = VH, the piecewise linear FE space on the coarse mesh deﬁned
by the nonoverlapping partition {Ωj}. (We have implicitly assumed that each
subdomain is triangle.)
The corresponding additive algorithm can be viewed as an iterative method
for solving
Puh = (P0 +P1 + · · · +PM)uh =Gh, (7.12)
for an appropriateGh, whereP0 is the projection fromVh toVH.


## Page 285

7.2. Overlapping Schwarz Alternating Methods (SAMs) 275
Known: Let λ∗ > 0 and λ∗ > 0 be the minimum and the maximum eigen-
values for a symmetric positive deﬁnite (SPD) matrix A, respectively. The
condition number ofA,κ(A), is deﬁned by
κ(A) =λ∗/λ∗.
The required iteration number for the CG method to solve SPD systems is
O
(√
κ(A)
)
for a given accuracy. (For more general systems, GMRES [59] and
QMR [24] can be used.) The following result was established by Dryja and
Widlund [19].
Theorem 7.1. Let δ = min
j=1,···,M
dist(∂Ωj \ ∂Ω, ∂˜Ωj \ ∂Ω) > 0. Assume the
problem coefﬁcient a is continuous on ¯Ω. Then, the condition number of the
additive Schwarz method for solving (7.12) satisﬁes
κ(P ) ≤C(1 +H/δ), (7.13)
whereC is independent ofH,h, andδ.
If there is no coarse subspace correction, (7.13) must be replaced by (see
[45])
κ(P ) ≤C
(
1 + 1
H2
min
H
δ
)
,
whereHmin is the minimum diameter of the subdomains.


## Page 286

276 Chapter 7. Domain Decomposition Methods
Final Notes
• Introducing a global solver at a modest cost is the key to efﬁciency of
iterative algorithms.
• On the other hand, if the overlap is a fraction of H, the condition number
in (7.13) is bounded uniformly by a constant.
• In numerical simulations, however, the requirement on the amount of
overlap may degrade the algorithm due to a heavy cost of local solvers.
Consider the algorithm with a small overlap. The number of CG itera-
tions is higher in such a case, but this can be compensated for by cheaper
local problem solvers.
• The condition number for DD methods incorporating a small overlap to-
gether with a coarse subspace solver is often bounded by
κ(P ) ≤C(1 + log(H/h))r, r = 2, 3, or 4, (7.14)
wherer depends on the amount of overlap and the regularity of the diffu-
sion coefﬁcienta.
• The convergence analysis of Schwarz method is more complicated when
the subdomains overlap less. See [47] and the survey papers [19, 45] for
details.


## Page 287

7.3. Nonoverlapping DDMs 277
7.3. Nonoverlapping DDMs
7.3.1. Multi-domain formulation
Recall the model problem: Find u ∈V =H1
0(Ω) such that
Lu := −∇ · (a(x)∇u) =f(x), x ∈ Ω,
u = 0, x ∈ Γ, (7.15)
where we assumed that 0<a ∗ ≤a(x) ≤a∗< ∞.
Consider a nonoverlapping partition {Ωj :j = 1, 2, · · ·,M } of Ω:
Ω = ∪M
j=1Ωj; Ω j ∩ Ωk = ∅, j ̸=k;
Γj = Γ ∩∂Ωj; Γ jk = Γkj =∂Ωj ∩∂Ωk.
Letuj denote the restriction ofu to Ωj.


## Page 288

278 Chapter 7. Domain Decomposition Methods
Then, the problem (7.15) can be formulated as follows: Find {uj} such that
(a) Luj =f, x ∈ Ωj,
(b) uj = 0, x ∈ Γj,
(c) uj =uk, x ∈ Γjk,
(d) ∂uj
∂νL,j
= − ∂uk
∂νL,k
, x ∈ Γjk,
(7.16)
where the conormal derivative is deﬁned as
∂uj
∂νL,j
=a∇uj · nj,
where nj indicates the unit outer normal from∂Ωj.
• Equations (7.16.c)-(7.16.d) are the transmission conditions which impose
the continuity of the solution and its conormal ﬂuxes on the subdomain
interfaces.
• Nonoverlapping DDMs can be characterized depending on how the trans-
mission conditions are incorporated in the iteration procedure.
We ﬁrst introduce theSteklov-Poincaré operator which is useful for the con-
vergence analysis for the variational formulation of the DDMs.


## Page 289

7.3. Nonoverlapping DDMs 279
7.3.2. The Steklov-Poincaré operator
Let λjk be the unknown value of u on Γjk. Consider the following Dirichlet
problems:
Lwj =f, x ∈ Ωj,
wj = 0, x ∈ Γj,
wj =λjk, x ∈ Γjk,
(7.17)
forj = 1, · · ·,M . Then, we can state that
wj =u0
j +u∗
j, (7.18)
where {u0
j} and {u∗
j} are deﬁned as the solutions of
Lu0
j = 0, x ∈ Ωj,
u0
j = 0, x ∈ Γj,
u0
j =λjk, x ∈ Γjk,
(7.19)
and
Lu∗
j =f, x ∈ Ωj,
u∗
j = 0, x ∈ Γj,
u∗
j = 0, x ∈ Γjk,
(7.20)
Note that whena(x) = 1,u0
j is the harmonic extension of {λjk} (fork’s such that
Γjk ̸= ∅) into Ωj; for general coefﬁcients, we still call it the harmonic extension
and denote byHjλjk. We will also writeGjf instead ofu∗
j,j = 1, · · ·,M .


## Page 290

280 Chapter 7. Domain Decomposition Methods
It follows from comparing (7.16) with (7.17) that
{
uj =wj, ∀j = 1, · · ·,M
}
⇐ ⇒
{∂wj
∂νL,j
= −∂wk
∂νL,k
, ∀j,k such that Γjk ̸= ∅
}
. (7.21)
The latter condition equivalently amounts to the requirement that each of
{λjk} satisﬁes the Steklov-Poincaré interface equation
Sjkλjk =χjk, (7.22)
whereS = {Sjk} is the Steklov-Poincaré operator deﬁned as
Sjkη = ∂
∂νL,j
Hjη + ∂
∂νL,k
Hkη, (7.23)
forη deﬁned on Γjk(̸= ∅), and
χjk = −
( ∂
∂νL,j
Gjf + ∂
∂νL,k
Gkf
)
. (7.24)
The operatorS is symmetric, positive deﬁnite (coercive), and continuous.
Here the goal is to ﬁnd{λjk} such thatλjk =u
⏐⏐
Γjk
, which must satisfy (7.22).
Some DDMs update the iterates {λn
jk} by iteratively solving (7.22), of which
each step solves the subproblems in (7.19) and (7.20). The process can be
understood easily by considering the algebraic system of the discrete Steklov-
Poincaré operator, which is known as theSchur complement matrix.


## Page 291

7.3. Nonoverlapping DDMs 281
7.3.3. The Schur complement matrix
Consider the FE method for the variational form (7.7). Let Nj denote the
number of interior nodes in Ωj, j = 1, 2, · · ·,M , and NB be the number of
nodal points on ∪Γjk. Thus the total number of nodes are N1 + · · · +NM +NB.
We order the interior nodes of {Ωj}’ﬁrst and those on ∪Γjk next. Then, the
algebraic system of (7.7) can be written as
Au :=
[ AII AIB
ABI ABB
][ uI
uB
]
=
[ fI
fB
]
, (7.25)
whereAII is a block diagonal matrix andABI =AT
IB:
AII = diag(A11,A 22, · · ·,AMM ),
ABI = (AB1,AB2, · · ·,ABM ).
Here thesr-th entry ofAjj, theℓr-th entry ofABj, and theℓm-th entry ofABB
are given by
(Ajj)sr =aj(ϕ(j)
r ,ϕ (j)
s ), s,r = 1, · · ·,Nj,
(ABj)ℓr =aj(ϕ(j)
r ,ϕ (B)
ℓ ), ℓ = 1, · · ·,NB, r = 1, · · ·,Nj,
(ABB)ℓm =
∑
j
aj(ϕ(B)
m ,ϕ (B)
ℓ ), ℓ,m = 1, · · ·,NB,
where aj(·, ·) is the restriction of a(·, ·) to Ωj, and ϕ(j)
s and ϕ(B)
ℓ are the basis
functions associated with nodes lying in Ωj and ∪Γjk, respectively.


## Page 292

282 Chapter 7. Domain Decomposition Methods
By eliminating all degrees of freedom that are associated with interior
nodes of subdomains, (7.25) reduces to the following interface problem:
Σ uB = fB −AT
IBA−1
II fI, (7.26)
where Σ is the Schur complement matrix deﬁned as
Σ =ABB −AT
IBA−1
IIAIB.
The matrix Σ is exactly the algebraic counterpart of the discrete Steklov-
Poincaré operator; it can be proved symmetric positive deﬁnite, as for the
Steklov-Poincaré operator.
In early substructuring techniques of the 1960’s, the interface problem
(7.26) was solved by a direct solver (for which a frontal method was often
employed mainly due to insufﬁcient computer memory). Most of the recent it-
erative nonoverlapping DDMs can be explained as preconditioning techniques
for solving the interface problem by the CG method.
Each matrix-vector multiplication with Σ involves M subdomain solves,
i.e.,
A−1
II = diag(A−1
11, · · ·,A −1
MM ),
which can be carried out in parallel.


## Page 293

7.3. Nonoverlapping DDMs 283
Convergence
• As reported in Le Tallec [45], the condition number of Σ is bounded as
κ(Σ) ≤C H
hH2
min
,
where H and Hmin are respectively the maximum and minimum diame-
ters of the subdomains.
• Thus a mathematical challenge is to construct a preconditioner for Σ such
that the convergence rate of the preconditioned iterative method becomes
independent on bothh andH.
• However, in practice the incorporation of such an optimal preconditioner
may not imply that the resulting algorithm is fastest in computation time.
We refer interested readers to Quarteroni and Valli [57].


## Page 294

284 Chapter 7. Domain Decomposition Methods
7.4. Iterative DDMs Based on Transmission Con-
ditions
7.4.1. The Dirichlet-Neumann method
As it is called, some subproblems are solved using Dirichlet data on the inter-
faces and the others use Neumann data. We may separate the subdomains
into two groups by a red-black coloring.
LetIR andIB be respectively the indices of the red and black subdomains.
Then, the method is formulated as follows: For given {λ0
jk}, ﬁnd {un
j }, n ≥ 1,
by recursively solving
(a)



Lun
j =f, x ∈ Ωj,
un
j = 0, x ∈ Γj,
un
j =λn−1
jk , x ∈ Γjk,
j ∈IB,
(b)



Lun
j =f, x ∈ Ωj,
un
j = 0, x ∈ Γj,
∂un
j
∂νL,j
= − ∂un
k
∂νL,k
, x ∈ Γjk,
j ∈IR,
(c) λn
jk =θjkun
j,R + (1 −θjk)λn−1
jk ,
(7.27)
where {θjk} > 0 is an acceleration parameter and un
j,R denotes the solution
from the subdomains colored red.


## Page 295

7.4. Iterative DDMs Based on Transmission Conditions 285
The acceleration parameter is often set less than one; the method without
relaxation (i.e.,θjk ≡ 1) is not necessarily convergent, unless special assump-
tions are made on the size of the subdomains. We refer readers interested in
the Dirichlet-Neumann method to [4, 6, 52] and [57] for details.


## Page 296

286 Chapter 7. Domain Decomposition Methods
7.4.2. The Neumann-Neumann method
This method requires solving the subproblems twice, one with Dirichlet-Dirichlet
data and the other with Neumann-Neumann data: For given {λ0
jk}, ﬁnd {un
j },
n ≥ 1, satisfying
(a)



Lun
j =f, x ∈ Ωj,
un
j = 0, x ∈ Γj,
un
j =λn−1
jk , x ∈ Γjk,
(b)



Lvn
j = 0, x ∈ Ωj,
vn
j = 0, x ∈ Γj,
∂vn
j
∂νL,j
= ∂un
j
∂νL,j
+ ∂un
k
∂νL,k
, x ∈ Γjk,
(c) λn
jk =λn−1
jk −θjk
(
σjkvn
j + (1 −σjk)vn
k
)⏐⏐
Γjk
, j >k,
(7.28)
where {θjk}> 0 is again an acceleration parameter and {σjk} is an averaging
coefﬁcient.
The Neumann-Neumann method was studied in [1, 5, 12, 50]. It is known
that the method is efﬁcient when the subdomains are similar [45]. The re-
sulting condition number (without a coarse grid solver) has been shown to be
[12]
κ(M −1A) ≤ C
H2
(
1 + logH
h
)2
,
whereM is the Neumann-Neumann preconditioning matrix forA.


## Page 297

7.4. Iterative DDMs Based on Transmission Conditions 287
7.4.3. The Robin method
The method was ﬁrst suggested by Lions [48] and has been applied to various
physical problems with a great efﬁciency; see e.g. [13, 17, 36, 38, 41, 42, 53].
For given {u0
j}, ﬁnd {un
j },n ≥ 1, satisfying
(a) Lun
j =f, x ∈ Ωj,
(b) un
j = 0, x ∈ Γj,
(c) ∂un
j
∂νL,j
+θjkun
j = −∂un−1
k
∂νL,k
+θjkun−1
k , x ∈ Γjk,
(7.29)
where {θjk} ≥ 0 is an acceleration parameter with
θjk +θkj > 0.
Lions [48] proved the convergence of the method through an energy estimate
on the interfaces.
Note that (7.29.c) is deﬁned twice on each of Γjk from both sides of the
interface:
∂un
j
∂νL,j
+θjkun
j = −∂un−1
k
∂νL,k
+θjkun−1
k ,
∂un
k
∂νL,k
+θkjun
k = −∂un−1
j
∂νL,j
+θkjun−1
j .
When the iterates converge, the limit {uj} would satisfy the above equations
in the same way (without the superscripts n and n − 1). By subtracting
and adding the equations, one can get the transmission conditions (7.16.c)-
(7.16.d).


## Page 298

288 Chapter 7. Domain Decomposition Methods
7.4.4. Remarks on DDMs of transmission conditions
• The DDMs based on transmission conditions ((7.27), (7.28), and (7.29)) re-
quire to choose appropriate acceleration parameters to either guarantee
or accelerate convergence. However, there is no guide line to be applied
to various problems; ﬁnding the acceleration parameter is problematic.
• For the Robin method applied, Kim [37, 44] suggested an automatic way
of choosing the acceleration parameter to solve the Helmholtz wave prob-
lem.
• A very important accuracy issue is related to the discrete transmission
conditions. Recall that the standard discretization methods such as the
FD and FE methods allow the conormal ﬂux to be discontinuous at the
element interfaces.
• Since the transmission conditions impose the continuity of both the so-
lution and its conormal ﬂux on the subdomain interfaces, there will be
a ﬂux conservation error , i.e., the discrete solution uh would not satisfy
(7.16.c)-(7.16.d) unless it is linear across the subdomain interfaces.


## Page 299

7.4. Iterative DDMs Based on Transmission Conditions 289
Flux conservation error
• In practice, the ﬂux conservation error can severely deteriorate accuracy
of the computed solution.
• Thus the conormal ﬂux must be treated with a special care, in particular,
when the DDM is to be utilized as the main solver.
• When the DDM is used as a preconditioner, i.e., another algorithm such
as a Krylov subspace method is applied as an outer iteration, the ﬂux
conservation error may affect the convergence speed of the resulting al-
gorithm; however, the required accuracy of the solution can be achieved
by the main solver (the outer iteration).


## Page 300

290 Chapter 7. Domain Decomposition Methods
W O E
N
S
Ωj Γjk Ωk
Figure 7.3: The ﬁve point stencil at a grid point on the interface Γjk.
Discretization of the Robin boundary condition: To illustrate
a way of dealing with the conormal ﬂux, consider the Robin method applied to
the Poisson equation,L = −∆:
(a) −∆un
j =f, x ∈ Ωj,
(b) un
j = 0, x ∈ Γj,
(c) ∂un
j
∂νj
+βun
j = −∂un−1
k
∂νk
+βun−1
k , x ∈ Γjk,
(7.30)
whereβ >0 is a constant acceleration parameter.
Let the domain be discretized into uniform cells of edge sizeh and the sub-
domain interfaces {Γjk} coincide with parts of grid lines. Let∂b,jkuj and∂f,jkuj
be the backward and forward differences for ∂uj/∂νj on Γjk, respectively. For
example, at the nodal point O ∈ Γjk in Figure 7.3, they are deﬁned as
∂b,jkuj(O) = (uj(O) −uj(W) )/h, ∂ f,jkuj(O) = (uj(E) −uj(O) )/h,
∂b,kjuk(O) = (uk(O) −uk(E) )/h, ∂f,kjuk(O) = (uk(W) −uk(O) )/h.
(Here we have employed an exterior bordering of the subdomains.)


## Page 301

7.4. Iterative DDMs Based on Transmission Conditions 291
Let ∆huj be the central ﬁve-point difference approximation of ∆uj. Then
the DD iterative algorithm in the FD formulation can be deﬁned as follows:
For given {u0
j}, ﬁnd {un
j },n ≥ 1, by recursively solving
(a) −∆hun
j =f, x ∈ Ωj,
(b) un
j = 0, x ∈ Γj,
(c) ∂f,jkun
j +βun
j = −∂b,kjun−1
k +βun−1
k , x ∈ Γjk.
(7.31)
Note that (7.31.c) imposes the continuity of the discrete solution only, when
the algorithm converges. Such a treatment of the Robin condition, a forward-
backward difference matching , was introduced by Kim [36, 38] to enforce
equivalence of the DD method to the original discrete problem of the multi-
linear FE methods.


## Page 302

292 Chapter 7. Domain Decomposition Methods
Equivalence: In the following, we will check the equivalence of algorithm
(7.31) to the original discrete problem. It sufﬁces to consider the algebraic
equations of (7.31) at interface grid points. At the point O (in Figure 7.3), the
equation (7.31.a) reads
4un
j,O −un
j,E −un
j,W −un
j,S −un
j,N =h2fO, (7.32)
whereun
j,O = un
j (O), the value of un
j at the point O, and the others are similarly
deﬁned.
The termun
j,E in (7.32) evaluated at a point out of the subdomain Ωj can be
substituted by using (7.31.c). Equation (7.31.c) is written as
un
j,E −un
j,O
h +βun
j,O =
un−1
k,E −un−1
k,O
h +βun−1
k,O ,
or equivalently
un
j,E − (1 −βh)un
j,O =un−1
k,E − (1 −βh)un−1
k,O . (7.33)
Adding (7.32) and (7.33) reads
[4 − (1 −βh)]un
j,O −un
j,W −un
j,S −un
j,N = h2fO +un−1
k,E − (1 −βh)un−1
k,O . (7.34)


## Page 303

7.4. Iterative DDMs Based on Transmission Conditions 293
In the same manner, one can treat cross points arising in a box-type decom-
position of the domain. When the algorithm converges, the limit would clearly
satisfy the original algebraic equation
4uO −uE −uW −uS −uN =h2fO,
which proves the equivalence of (7.31) to the original discrete problem.
• It should be noticed that the standard FE formulation of (7.30) fails to get
the original discrete solution, unless the original solution is linear across
the subdomain interfaces. The forward-backward difference matching
can be incorporated into the FE formulation to overcome the difﬁculty.
See Exercises 7.2 and 7.3.
• For FD schemes, the normal derivatives in (7.30) can be approximated
by the central differences, without a failure for the original FD solution.
However, the convergence speed of the iteration may matter.


## Page 304

294 Chapter 7. Domain Decomposition Methods
7.5. Homework
1. Derive (7.10) for the additive Schwarz method for two overlapping subdo-
mains.
2. Consider the bilinear FE method of grid sizeh on the unit square applied
to the DD method (7.30): Given {uh,0
j }, uh,0
j ∈ Vh
j := Vh⏐⏐
Ωj
, j = 1, · · ·,M ,
ﬁnd {uh,n
j },n ≥ 1, satisfying
(∇uh,n
j , ∇v)Ωj +
∑
k
⟨βuh,n
j ,v ⟩Γjk = (f,v )Ωj
+
∑
k
⟨−∂uh,n−1
k
∂νk
,v ⟩Γjk +
∑
k
⟨βuh,n−1
k ,v ⟩Γjk, v ∈Vh
j .
(7.35)
(a) Show that the algebraic equation of (7.35) at the boundary nodal point
O as given in Figure 7.3 reads
(2 +βh)un
j,O −un
j,W − 1
2un
j,S − 1
2un
j,N = h2
2fO +un−1
k,E − (1 −βh)un−1
k,O , (7.36)
provided that the mass-lumping quadrature rule is used.
(b) Show that (7.36) is equivalent to (7.34), in their limits, if the discrete
solution is linear across the subdomain boundary Γjk.
3. A modiﬁcation of (7.35) can be obtained incorporating the forward-backward
difference matching (7.31.c) as follows: Given{uh,0
j },uh,0
j ∈Vh
j ,j = 1, · · ·,M ,
ﬁnd {uh,n
j },n ≥ 1, satisfying
(∇uh,n
j , ∇v)Ωj +
∑
k
⟨−∂c,jkuh,n
j ,v ⟩Γjk = (f,v )Ωj, v ∈Vh
j ,
∂f,jkun
j +βun
j = −∂b,kjun−1
k +βun−1
k , x ∈ Γjk,
(7.37)
where ∂c,jkuh,n
j is the central approximation of
∂uh,n
j
∂νj
, i.e., ∂c,jk = (∂b,jk +
∂f,jk)/2. (We have assumed the outer bordering.) Equations (7.37) can be
rewritten as
(∇uh,n
j , ∇v)Ωj +
∑
k
⟨1
2(−∂b,jkuh,n
j +βun
j ), v⟩Γjk
= (f,v )Ωj +
∑
k
⟨1
2(−∂b,kjuh,n−1
k +βun−1
k ), v⟩Γjk, v ∈Vh
j .
(7.38)


## Page 305

7.5. Homework 295
Prove that the algorithm (7.38) solves the original discrete solution if it
converges.


## Page 306

296 Chapter 7. Domain Decomposition Methods


## Page 307

Chapter 8
Multigrid Methods∗
See sepatate hand-out.
297


## Page 308

298 Chapter 8. Multigrid Methods∗
8.1. Introduction to Multigrid Methods


## Page 309

8.2. Homework 299
8.2. Homework
1.


## Page 310

300 Chapter 8. Multigrid Methods∗


## Page 311

Chapter 9
Locally One-Dimensional Methods
Explicit schemes for parabolic equations are easy to implement, but they are
stable only if the time step size is chosen sufﬁciently small: ∆t = O(∆x2).
Implicit methods are often unconditionally stable; however, a large algebraic
system must be solved (directly or iteratively) for the time integration on each
of the space-time slices. In this chapter, we will introduce the locally one-
dimensional (LOD) methods such as the alternating direction implicit (ADI)
method and the fractional step (FS) method, in order to solve the algebraic
system of equations efﬁciently. The LOD methods can be viewed as a pertur-
bation of standard implicit methods.
301


## Page 312

302 Chapter 9. Locally One-Dimensional Methods
9.1. Heat Conduction in 1D Space: Revisited
Let Ω = (0, 1) andJ = (0,T ], for some T > 0. Consider the following simplest
model problem for parabolic equations in 1D:
ut −uxx = 0, (x,t ) ∈ Ω ×J,
u = 0, (x,t ) ∈ Γ ×J,
u =u0, x ∈ Ω, t = 0,
(9.1)
where Γ is the boundary of Ω, i.e., Γ = {0, 1}, and u0 is the prescribed initial
value of the solution att = 0.
Let
∆t =T/nt, tn =n∆t, n = 0, 1, · · ·,nt;
∆x = 1/nx, xj =j∆x, j = 0, 1, · · ·,nx;
for some positive integersnt andnx. Deﬁneun
j =u(xj,tn). Let A1 be the central
second-order approximation of −∂xx, deﬁned as
A1un
j := −un
j−1 + 2un
j −un
j+1
∆x2 .
Then theθ-method for (9.1) is
vn −vn−1
∆t + A1
[
θvn + (1 −θ)vn−1]
= 0, θ ∈ [0, 1], (9.2)
or equivalently
(I +θ∆tA1)vn = [I − (1 −θ)∆tA1]vn−1, θ ∈ [0, 1]. (9.3)


## Page 313

9.1. Heat Conduction in 1D Space: Revisited 303
Forward Euler method (θ = 0): The algorithm (9.3) is reduced to
vn = (I − ∆tA1)vn−1,
which is explicit and cheap to compute the solution in each time level. How-
ever, we shall see later that its stability requires to choose∆t small enough to
satisfy
µ = ∆t
∆x2 ≤ 1
2.
Backward Euler method (θ = 1): This is an implicit method written as
(I + ∆tA1)vn =vn−1.
The method must invert a tridiagonal matrix to get the solution in each time
level. But it is stable independently on the choice of ∆t.
Crank-Nicolson method (θ = 1/2):
(
I + ∆t
2 A1
)
vn =
(
I − ∆t
2 A1
)
vn−1.
It requires to solve a tridiagonal system in each time level, as in the backward
Euler method. However, the Crank-Nicolson method is most popular, because
• it is unconditionally stable
• its error = O(∆x2 + ∆t2)
It is often called a semi-implicit method.


## Page 314

304 Chapter 9. Locally One-Dimensional Methods
Stability analysis
Components of the algebraic system (9.3) are
−θµv n
j−1 + (1 + 2θµ)vn
j −θµv n
j+1
= (1 −θ)µvn−1
j−1 + [1 − 2(1 −θ)µ]vn−1
j + (1 −θ)µvn−1
j+1, (9.4)
whereµ = ∆t/∆x2.
For an stability analysis for this one-parameter family of systems, substi-
tutegneijϑ forvn
j in (9.4) to have
g
[
−θµe −ijϑ + (1 + 2θµ) −θµeijϑ]
= (1 −θ)µe −ijϑ + [1 − 2(1 −θ)µ] + (1 −θ)µeijϑ,
i.e.,
g = 1 − 2(1 −θ)µ (1 − cosϑ)
1 + 2θµ (1 − cosϑ) = 1 − 4(1 −θ)µ sin2 ϑ
2
1 + 4θµ sin2 ϑ
2
.
Because µ >0 and θ ∈ [0, 1], the ampliﬁcation factor g cannot be larger than
one. The condition g ≥ −1 is equivalent to
1 − 4(1 −θ)µ sin2ϑ
2 ≥ −
[
1 + 4θµ sin2ϑ
2
]
,
or
(1 − 2θ)µ sin2ϑ
2 ≤ 1
2.
Thus (9.3) is stable if
(1 − 2θ)µ ≤ 1
2. (9.5)


## Page 315

9.1. Heat Conduction in 1D Space: Revisited 305
In conclusion:
• The θ-method is unconditionally stable for θ ≥ 1/2, because every choice
ofµ satisﬁes the above inequality.
• When θ <1/2, the method is stable only if
µ = ∆t
∆x2 ≤ 1
2(1 − 2θ), θ ∈ [0, 1/2). (9.6)
• For example, the forward Euler method ( θ = 0) is stable only if
∆t ≤ ∆x2/2;
∆t must be chosen sufﬁciently small for stability.


## Page 316

306 Chapter 9. Locally One-Dimensional Methods
Maximum principle
For heat conduction without interior sources/sinks, it is known mathemat-
ically and physically that the extreme values of the solution appear either
in the initial data or on the boundary. This property is called the maximum
principle. It is quite natural and sometimes very important to examine if the
numerical solution satisﬁes the maximum principle, too.
Theorem 9.1. (Maximum principle for theθ-method). Let theθ-method
be set satisfyingθ ∈ [0, 1] and
(1 −θ)µ ≤ 1
2.
If the computed solution v has an interior maximum or minimum, then v is
constant.


## Page 317

9.1. Heat Conduction in 1D Space: Revisited 307
Error analysis
Let
en
j =un
j −vn
j,
whereun
j =u(xj,tn) withu being the exact solution of (9.1). Deﬁne
En = max
j
|en
j |, T n−1/2 = max
j
|Tun−1/2
j |,
where Tun−1/2
j is the truncation error expanded at (xj,tn−1/2). Note that v0
j =
u0
j,j = 0, · · ·,nx, and therefore E0 = 0.
Theorem 9.2. Let the θ-method be set satisfying θ ∈ [0, 1] and (1 −θ)µ ≤ 1
2.
Then,
En ≤ ∆t
n∑
k=1
T k−1/2. (9.7)
It follows from (9.7) that
En ≤ n∆t max
k
T k−1/2 ≤ T max
k
T k−1/2,
whereT is the upper limit of the time variable.


## Page 318

308 Chapter 9. Locally One-Dimensional Methods
9.2. Heat Equation in Two and Three Variables
Let Ω be a bounded domain inRm,m = 2 or 3, with boundaryΓ =∂Ω. Consider
the parabolic problem
ut − ∇ · (a∇u) +cu =f, (x,t ) ∈ Ω ×J,
α1uν +α2u =g, (x,t ) ∈ Γ ×J,
u =u0, x ∈ Ω, t = 0,
(9.8)
where
• a> 0,c ≥ 0,α1 ≥ 0, andα2 ≥ 0 are given functions,α1 +α2> 0,
• the subscript ν denotes the outer unit normal on Γ,
• u0 is the prescribed initial value of the solution att = 0, and
• f andg represent external sources and sinks.


## Page 319

9.2. Heat Equation in Two and Three Variables 309
9.2.1. The θ-method
Let Th be the mesh of Ω consisting of elements of which the maximum edge
size is h. Let A be the approximation of −∇ ·a∇ +c on the mesh Th, having
thep-th order accuracy, i.e.,
Au ≈ −∇ · (a∇u) +cu + O(hp).
Then, theθ-method for (9.8) reads1
vn −vn−1
∆t + A
[
θvn + (1 −θ)vn−1]
=fn−1/2, θ ∈ [0, 1], (9.9)
and the truncation error for then-th time level is
δn−1/2 = O
(
(1 − 2θ)∆t + ∆t2 +hp)
.
Note that A is symmetric and nonnegative; it is positive deﬁnite when c >0
orα2> 0.
Let vn be the solution vector in the n-th time level. Then the method (9.9)
in its matrix representation reads
[I +θ∆tA] vn = ∆tfn−1/2 + [I − (1 −θ)∆tA] vn−1. (9.10)
1Here we usedfn−1/2, instead offn−1+θ, for a simplier presentation.


## Page 320

310 Chapter 9. Locally One-Dimensional Methods
Notes:
• When θ >0, it is necessary to invert a matrix, either exactly or approxi-
mately, to get the solution in the new time level.
• When the domain is rectangular or cubic, the algebraic system (9.10) can
be perturbed to become a series of traditional systems; the resulting prob-
lem can be solved very efﬁciently. This is the basic idea of the locally
one-dimensional (LOD) methods to be treated in this chapter later.


## Page 321

9.2. Heat Equation in Two and Three Variables 311
9.2.2. Convergence analysis for θ-method
For a simpler presentation, we deﬁne
∂tvn = vn −vn−1
∆t .
Let
en =un −vn,
where un is the exact solution of (9.8) at the time level tn. Then, the error
equation associated with theθ-method (9.9) is
∂ten + A[θen + (1 −θ)en−1] =δn−1/2. (9.11)
Choose∂ten as a test function. Then, for n ≥ 1,
(∂ten,∂ten) +
(
A[θen + (1 −θ)en−1], ∂ten)
= (δn−1/2,∂ten). (9.12)
Note that
θen + (1 −θ)en−1 = 1
2
(
(en +en−1) + (2θ − 1)(en −en−1)
)
and therefore (
A[θen + (1 −θ)en−1], ∂ten)
∆t
= 1
2
[
(Aen,en) − (Aen−1,en−1)
+(2θ − 1)(A∂ten,∂ten)∆t2
]
, n ≥ 1.
(9.13)


## Page 322

312 Chapter 9. Locally One-Dimensional Methods
Multiply (9.12) by ∆t and utilize (9.13) to have
∥∂ten∥2∆t + 2θ − 1
2 (A∂ten,∂ten)∆t2
+1
2
[
(Aen,en) − (Aen−1,en−1)
]
= (δn−1/2,∂ten)∆t, n ≥ 1.
(9.14)
Summing (9.14) beginning atn = 1 reads
n∑
j=1
∥∂tej∥2∆t + 2θ − 1
2
n∑
j=1
(A∂tej,∂tej)∆t2 + 1
2(Aen,en)
= 1
2(Ae0,e 0) +
n∑
j=1
(δj−1/2,∂tej)∆t.
(9.15)
Now, we apply the inequality ( |ab| ≤ (a2 +b2)/2) to the last term in (9.15) to
obtain the following inequality:
n∑
j=1
∥∂tej∥2∆t + (2θ − 1)
n∑
j=1
(A∂tej,∂tej)∆t2 + (Aen,en)
≤ (Ae0,e 0) +
n∑
j=1
∥δj−1/2∥2∆t.
(9.16)
Thus, the estimation of the error generated by the θ-method is reduced to
bounding the errors inv0 and the truncation error.


## Page 323

9.2. Heat Equation in Two and Three Variables 313
Note: The estimate (9.16) also indicates that
• The θ-method is unconditionally stable forθ ∈ [1/2, 1].
• When θ ∈ [0, 1/2), it is stable if
1 + (2θ − 1)ρ(A)∆t ≥ 0,
where ρ(A) is the spectral radius of A (the largest eigenvalue of A in
modulus). Since
ρ(A) ≈ 4m∥a∥∞/h2,
where m is the dimensionality and ∥a∥∞ = max
x∈Ω
|a(x)|, the θ-method is
stable if ∆t
h2 ≤ 1
4(1 − 2θ)m∥a∥∞
, θ ∈ [0, 1/2). (9.17)
The inequality in (9.17) is compared to the analysis in (9.6).
• The θ-method is particularly interesting when θ = 1/2, because the trun-
cation error becomes second-order in time. This case is called the Crank-
Nicolson or semi-implicit method. The spatial derivatives can be approx-
imated to have ap-th order accuracy,p ≥ 2, independently onθ or ∆t.


## Page 324

314 Chapter 9. Locally One-Dimensional Methods
9.3. LOD Methods for the Heat Equation
Over the last ﬁve decades or so, many time-stepping procedures have been
introduced to allow multidimensional parabolic problems to be approximated
accurately and efﬁciently. These procedures treat the spatial variables in-
dividually in a cyclic fashion; we shall call any such a procedure a locally
one-dimensional (LOD) method. Here we will be mainly concerned with two
families of these methods, namely the alternating direction implicit (ADI)
methods [14, 18, 56] and the fractional-step (FS) procedures [20, 51, 71, 72].
These methods can be interpreted as perturbations of some underlying im-
plicit multidimensional numerical method, such as the Crank-Nicolson or the
backward Euler method. Recently, a uniﬁed approach of these LOD methods,
along with strategies for virtual elimination of the splitting error, has been
studied by Douglas and Kim [16].


## Page 325

9.3. LOD Methods for the Heat Equation 315
9.3.1. The ADI method
Consider the parabolic problem (9.8) deﬁned on a rectangular domainΩ ⊂ R2.
Let Th be a uniform mesh of rectangular elements of which the edge lengths
arehx andhy,h = max(hx,hy). Deﬁne
A1u ≈ −(aux)x + 1
2cu, A2u ≈ −(auy)y + 1
2cu,
which are ﬁnite difference or ﬁnite element approximations on the mesh Th
having a truncation error of O(hp),p ≥ 2. Let
A = A1 + A2.
Then the Crank-Nicolson difference equation for the heat equation (9.8) reads
vn −vn−1
∆t + 1
2A(vn +vn−1) =fn−1/2 + O(hp + ∆t2), (9.18)
where
fn−1/2 = 1
2(fn +fn−1).
The truncation error for the CN procedure (9.18) is
O(∆x2 + ∆t2).


## Page 326

316 Chapter 9. Locally One-Dimensional Methods
The original ADI method:
The ADI method of Douglas-Peaceman-Rachford [14, 18, 56] is a pertur-
bation of the Crank-Nicolson difference equation that has a splitting error of
O(∆t2), so that it is second-order correct in time.
Let us formulate it in an equivalent way that will coincide with the general
formulation in Douglas-Gunn [15] of ADI methods. Given an approximation
w0 tou0, ﬁndwn,n ≥ 1, by solving
w∗ −wn−1
∆t + 1
2A1(w∗ +wn−1) + A2wn−1 =fn−1/2,
wn −wn−1
∆t + 1
2A1(w∗ +wn−1) + 1
2A2(wn +wn−1) =fn−1/2,
(9.19)
or, equivalently,
(
1 + ∆t
2 A1
)
w∗ =
(
1 − ∆t
2 A1 − ∆tA2
)
wn−1 + ∆tfn−1/2,
(
1 + ∆t
2 A2
)
wn = w∗ + ∆t
2 A2wn−1.
(9.20)
Herew∗ is an intermediate value.


## Page 327

9.3. LOD Methods for the Heat Equation 317
Splitting error of ADI : The intermediate solution w∗ can be found (implic-
itly) as
w∗ =wn + ∆t
2 A2(wn −wn−1).
Thus, by plugging it into the ﬁrst equation of (9.20), we have
(
1 + ∆t
2 A1
)(
1 + ∆t
2 A2
)
wn =
(
1 − ∆t
2 A
)
wn−1
+∆t2
4 A1A2wn−1 + ∆tfn−1/2.
Multiply out the left hand side and rewrite the result as
wn −wn−1
∆t + 1
2A(wn +wn−1) + ∆t
4 A1A2(wn −wn−1) =fn−1/2. (9.21)
Thus, compared with (9.18), the splitting error is given by
∆t
4 A1A2(wn −wn−1), (9.22)
which is O(∆t2) for a smooth solution.


## Page 328

318 Chapter 9. Locally One-Dimensional Methods
Notes:
• Some theoretical aspects of the method were treated in detail in Douglas
[14], while practical aspects of the method were considered in the com-
panion paper by Peaceman-Rachford [56].
• In each half of the calculation, the matrix to be inverted is tridiagonal, so
that the algorithm requires O(N :=ntnxny) ﬂops.
• The ADI (9.19) can be equivalently formulated in many different ways.
The modelcode ADI_HEAT.CF.tar in GRADE [35] is implemented based
on the following formulation:
(
1 + ∆t
2 A1
)
w∗ =
(
1 − ∆t
2 A2
)
wn−1 + ∆t
2 fn−1/2
(
1 + ∆t
2 A2
)
wn =
(
1 − ∆t
2 A1
)
w∗ + ∆t
2 fn−1/2.
(9.23)


## Page 329

9.3. LOD Methods for the Heat Equation 319
General ADI procedure
Consider a parabolic problem of the form
ut +
m∑
i=1
Aiu =f, (x,t ) ∈ Ω ×J, (9.24)
with an appropriate initial data and boundary condition. IfA =A1 + · · ·+Am,
then the basic Crank-Nicolson approximation to (9.24) is given by
wn −wn−1
∆t + 1
2A(wn +wn−1) =fn−1/2, n ≥ 1. (9.25)
(Here, we are interested in the time discretization of (9.24); consequently, we
shall ignore spatial discretization for the moment.)
The Douglas-Gunn algorithm [15] for ADI time discretization of (9.24) is as
follows: Forκ = 1,...,m , ﬁndwn,κ such that
wn,κ −wn−1
∆t + 1
2
κ∑
i=1
Ai(wn,i +wn−1) +
m∑
i=κ+1
Aiwn−1 =fn−1/2, (9.26)
and then to set
wn =wn,m. (9.27)
In the above,
m∑
m+1
Aiwn−1 := 0.


## Page 330

320 Chapter 9. Locally One-Dimensional Methods
The Douglas-Gunn algorithm equivalently reads
(
1 + ∆t
2 A1
)
wn,1 =
(
1 − ∆t
2 A1 − ∆t
m∑
i=2
Ai
)
wn−1 + ∆tfn−1/2,
(
1 + ∆t
2 Aκ
)
wn,κ = wn,κ−1 + ∆t
2 Aκwn−1, κ = 2,...,m,
wn = wn,m.
(9.28)
Splitting error: The intermediate values wn,1, · · ·,wn,m−1 can be eliminated
by recursively operating on the second equation of (9.28) by (1 + ∆t
2 Aκ) for
κ =m − 1, · · ·, 1:
wn −wn−1
∆t + 1
2A(wn +wn−1) + B∆t(wn −wn−1) =fn−1/2, (9.29)
where
B∆t = ∆t
4
∑
1≤i1<i2≤m
Ai1Ai2 + ∆t2
8
∑
1≤i1<i2<i3≤m
Ai1Ai2Ai3
+ · · · + ∆tm−1
2m A1A2 · · ·Am.
(9.30)
The splitting perturbation is given by B∆t(wn − wn−1), and for sufﬁciently
smooth solutionsu,
B∆t(un −un−1) = O(∆t2), (9.31)
which is of the same order in ∆t as the Crank-Nicolson truncation error. But
the splitting error can be much larger than the truncation error as shown in
the following.


## Page 331

9.3. LOD Methods for the Heat Equation 321
9.3.2. Accuracy of the ADI: Two examples
Let Ω ×J = (0, 1)2 × (0, 1), a = α1 ≡ 1, and c = α2 ≡ 0 in (9.8). Consider two
different solutions:
u+ = sin(2 πνtt) + sin(2πνxx) + sin(2πνyy),
u× = sin(2 πνtt) · sin(2πνxx) · sin(2πνyy). (9.32)
For the moment, takeνt =νx =νy = 1.
The sources f and g are evaluated so that (9.8) is satisﬁed. Also, let n :=
nt = nx = ny. To compare computation cost and accuracy, we implemented
three algorithms:
• an LU-based algorithm,
• a PCG-ILU0 procedure for the Crank-Nicolson equation derivable from
(9.9), and
• the ADI procedure of (9.19).
Here, PCG-ILU0 denotes the conjugate gradient method preconditioned by
the zero-level (not allowing ﬁll-in) incomplete LU-factorization. The PCG-
ILU0 procedure was initialized at each time level by the extrapolation
un,0 = 2un−1 −un−2, n ≥ 2,
and the iteration stopped when the residual was reduced by a factor of 10−5.


## Page 332

322 Chapter 9. Locally One-Dimensional Methods
n = 40 n = 80 n = 160
CPU L2-error CPU L2-error CPU L2-error
LU-based 0.74 4.10e-3 9.07 1.00e-3 126 2.47e-4
PCG-ILU0 0.46 4.11e-3 5.67 1.00e-3 53.4 2.47e-4
ADI 0.26 4.10e-3 2.16 1.00e-3 17.9 2.47e-4
Table 9.1: The performances of the LU-based, PCG-ILU0, and ADI methods
foru = u+. The elapsed time (CPU) is measured in seconds and the L2-norm
of the error is evaluated att = 1.
n = 40 n = 80 n = 160
CPU L2-error CPU L2-error CPU L2-error
LU-based 0.91 2.46e-4 10.5 5.98e-5 136 1.47e-5
PCG-ILU0 0.83 2.46e-4 12.5 5.97e-5 121 1.42e-5
ADI 0.45 8.44e-3 3.62 2.02e-3 29.0 4.90e-4
Table 9.2: The performances of the LU-based, PCG-ILU0, and ADI methods
foru =u×.
Table 9.1 presents the elapsed times and numerical errors for u = u+ for
various grid sizes. As one can see from the table, the three different algo-
rithms show the same errors and their second-order convergence.
Table 9.2 shows the results for u = u×. The computation cost for the ADI
method increases linearly as the number of grid points grows, while the PCG-
ILU0 calculation shows a slight superlinearity in its computation cost. How-
ever, the ADI method produces an error approximately 34 times larger than
that for the LU-based or PCG-ILU0 methods for the same grid size.


## Page 333

9.3. LOD Methods for the Heat Equation 323
Truncation error vs. splitting error : The truncation error for the Crank-
Nicolson difference equation is of the form
O
(
h2
x
∂4u
∂x4
)
+ O
(
h2
y
∂4u
∂y4
)
+ O
(
∆t2∂3u
∂t3
)
,
while the splitting error of the ADI method is
O
(
∆t2 ∂2
∂x2
∂2
∂y2
∂
∂tu
)
.
This is, roughly speaking, why the ADI method introduces no splitting error
foru+ and a large splitting error foru×.
Now, since the operators Ai usually represent second-order differential op-
erators in an xi direction, it should not be surprising that the higher-order
derivatives in B∆t contribute bigger errors than the truncation error. We shall
see in §9.3.4 that it is not only possible but also quite feasible to modify the
algorithm (9.26) in a rather simple fashion to reduce the splitting error to
O(∆t3).


## Page 334

324 Chapter 9. Locally One-Dimensional Methods
9.3.3. The general fractional step (FS) procedure
We shall consider the same parabolic problem (9.24) for a FS time discretiza-
tion. For reasons that will appear below, it is not the usual case to look for
an FS procedure based on the Crank-Nicolson equation (9.25); however, it is
useful for us to do so.
The appropriate FS algorithm is given by
wn,1 −wn−1
∆t + 1
2A1(wn,1 +wn−1) = fn−1/2,
wn,κ −wn,κ−1
∆t + 1
2Aκ(wn,κ +wn−1) = 0 , κ = 2,...,m − 1,
wn −wn,m−1
∆t + 1
2Am(wn +wn−1) = 0 .
(9.33)
Equivalently,
(
1 + ∆t
2 A1
)
wn,1 =
(
1 − ∆t
2 A1
)
wn−1 + ∆tfn−1/2,
(
1 + ∆t
2 Aκ
)
wn,κ = wn,κ−1 − ∆t
2 Aκwn−1, κ = 2,...,m − 1,
(
1 + ∆t
2 Am
)
wn = wn,m−1 − ∆t
2 Amwn−1.
(9.34)


## Page 335

9.3. LOD Methods for the Heat Equation 325
Splitting error of FS procedure : Again, the intermediate values can be
eliminated:
wn −wn−1
∆t + 1
2A(wn +wn−1) + B∆t(wn +wn−1) =fn−1/2, (9.35)
with B∆t being the same as for the ADI; see (9.30).
Thus, for the Crank-Nicolson version of the FS method, the splitting per-
turbation term becomes B∆t(wn +wn−1). We know that
B∆t(un +un−1) = O(∆t); (9.36)
i.e., the splitting error term is worse than the inherent local error in the
Crank-Nicolson equation.
This is the reason that (9.33) is not common; the FS methods have been
employed for the backward Euler method rather than the Crank-Nicholson
method. However, we shall be able to modify the procedure (9.33) in an
equally simple fashion to reduce the splitting error to O(∆t3) below.


## Page 336

326 Chapter 9. Locally One-Dimensional Methods
9.3.4. Improved accuracy for LOD procedures
We present a strategy to reduce the perturbation error of ADI and FS proce-
dures and essentially to recover the accuracy of the Crank-Nicolson difference
equation for an additional computational cost that is a small fraction of the
standard ADI or FS cost.
Correction term for the ADI method : Observation from (9.26),
(9.29), and (9.30) is that
if the right hand side term of (9.26) isfn−1/2, then the right hand side
of (9.29) is also fn−1/2 and the splitting error is given by B∆t(wn −
wn−1).
If we could add B∆t(wn −wn−1) to the right hand side of (9.29), then we
could cancel the perturbation term completely; but since we do not know wn,
we cannot make this modiﬁcation in the algorithm.
Our best estimate for (wn −wn−1) is (wn−1 −wn−2).


## Page 337

9.3. LOD Methods for the Heat Equation 327
Modiﬁcation of the ADI: Let us modify the ADI algorithm to the fol-
lowing: Forn ≥ 2,
Fn
AD = fn−1/2 + B∆t(zn−1 −zn−2),
(
1 + ∆t
2 A1
)
zn,1 =
(
1 − ∆t
2 A1 − ∆t
m∑
i=2
Ai
)
zn−1 + ∆tF n
AD,
(
1 + ∆t
2 Aκ
)
zn,κ = zn,κ−1 + ∆t
2 Aκzn−1, κ = 2,...,m,
zn = zn,m.
(9.37)
The evaluation of z1 will be discussed below by interpreting the modiﬁed
method as an iterative procedure; for practical purposes, assume that z1 is
obtained by solving the Crank-Nicolson equation for this single time step.


## Page 338

328 Chapter 9. Locally One-Dimensional Methods
Splitting error : By eliminating the intermediate values (or referring to
(9.29)), we see thatzn satisﬁes
zn −zn−1
∆t + 1
2A(zn +zn−1) + B∆t(zn − 2zn−1 +zn−2)
=fn−1/2, n ≥ 2.
(9.38)
Now, for a smooth solutionu of (9.8),
B∆t(un − 2un−1 +un−2) = O(∆t3), (9.39)
and the splitting error is now higher order in ∆t than the truncation error of
the Crank-Nicolson equation.
We shall both prove the convergence of the solution of (9.37) to that of (9.8)
under certain circumstances and demonstrate that the error in the solution of
(9.37) is reduced essentially to that of the Crank-Nicolson procedure for the
exampleu× considered above, for which the splitting error was many times as
large as the Crank-Nicolson error.


## Page 339

9.3. LOD Methods for the Heat Equation 329
Algebraic interpretation: We will interpret (9.38) as the iterative proce-
dure related to the matrix splitting [67]
1 + ∆t
2 A =
(
1 + ∆t
2 A + B∆t
)
− B∆t.
Consider the algorithm: Find ζ, ≥ 1, by recursively solving
(
1 + ∆t
2 A + B∆t
)
ζ = B∆tζ −1 +
(
1 − ∆t
2 A
)
γ +fn−1/2. (9.40)
The solutionwn of the original ADI method (9.26) is the ﬁrst iterateζ1 of (9.40)
forγ =wn−1 starting with the initial value
ζ0 =wn−1. (9.41)
On the other hand, the solution zn of (9.37) is the ﬁrst iterate of (9.40) with
γ =zn−1 and the initial value
ζ0 = 2zn−1 −zn−2. (9.42)
Consequently, the algorithm (9.37) is called the alternating direction implicit
method with improved initialization (ADI-II) [16].
If the general time step code for (9.37) is written to perform the iteration
(9.40), then, forn ≥ 2, (9.42) would be used to initialize the “iteration" and one
step of iteration calculated, while for n = 1, (9.41) would be used to initialize
the iteration and two or more iterations would givez1 to the desired accuracy.


## Page 340

330 Chapter 9. Locally One-Dimensional Methods
Reformulation of ADI-II : As for ADI, ADI-II (9.37) can be formu-
lated in a various way. For the 2D problem ( m = 2 ), the ADI-II routine in
ADI_HEAT.CF.tar is implemented based on
(
I + ∆t
2 A1
)
zn,1 =
(
I − ∆t
2 A
)
zn−1 + ∆tfn−1/2
+∆t2
4 A1A2(2zn−1 −zn−2),
(
I + ∆t
2 A2
)
zn = zn,1.
(9.43)
• It might seem reasonable to use a higher-order extrapolation than (9.42),
but experiments have shown that instability can result unless the time
step is small enough.
• It has also been observed that (9.42) can over-correct for large time steps,
and it is possible that the use of
ζ0 =zn−1 +η(zn−1 −zn−2), 0 ≤η ≤ 1, (9.44)
could lead to better computational results for large time steps.
• However, experiments have shown that, when the time step is reason-
ably chosen ( e.g., ∆t ≲ ah), ADI-II methods have worked better than
ADI methods for various heterogeneous media; see Tables 9.3 and 9.4
in §9.3.6. So, (9.44) does not seem necessary for solving heat equations in
practice.


## Page 341

9.3. LOD Methods for the Heat Equation 331
Correction term for the FS method
The FS difference equation (9.35) preserves the right hand side of the FS
algorithm (9.34) and exhibits the splitting perturbationB∆t(wn+wn−1). Modify
(9.34) as follows. Forn ≥ 2, let
Fn
FS = fn−1/2 + B∆t(3zn−1 −zn−2),
(
1 + ∆t
2 A1
)
zn,1 =
(
1 − ∆t
2 A1
)
zn−1 + ∆tF n
FS,
(
1 + ∆t
2 Aκ
)
zn,κ = zn,κ−1 − ∆t
2 Aκzn−1, κ = 2, · · ·,m − 1,
(
1 + ∆t
2 Am
)
zn = zn,m−1 − ∆t
2 Amzn−1.
(9.45)
After the intermediate values are eliminated, we see thatzn satisﬁes
zn −zn−1
∆t + 1
2A(zn +zn−1) + B∆t(zn − 2zn−1 +zn−2) =fn−1/2, (9.46)
which is identical to the equation (9.38) satisﬁed by the solution of the ADI-II
algorithm (9.37).


## Page 342

332 Chapter 9. Locally One-Dimensional Methods
Remarks [16]:
• We have not only shown how to reduce the splitting errors for the ADI
and FS methods but also discovered that their improved procedures lead
to identical results “(after several decades of being considered to be
different techniques)."
• Again, it is advisable to obtain z1 as discussed earlier.
• If the values of Aizn−1 are saved, then there is essentially no difference in
the implementation of algorithms (9.37) and (9.45). That being the case,
we shall address both algorithms as pertaining to the ADI-II method.


## Page 343

9.3. LOD Methods for the Heat Equation 333
9.3.5. A convergence proof for the ADI-II
Let ∥ · ∥ denote the L2(Ω) or 2(Ω) norm and ∥ · ∥1 the norm on either H1(Ω) or
h1(Ω), as appropriate. (That is, depending on spatial discretization by ﬁnite
elements or ﬁnite differences.) Assume that the operators {Ai} commute:
AiAj =AjAi, i,j = 1,...,m, (9.47)
and that
(Aiz,z ) ≥α∥z∥2
1, α> 0. (9.48)
By (9.47) and (9.48), it follows that
(B∆tz,z ) ≥ 0.
Let∂tvn = (vn −vn−1)/∆t anden =un −zn. Then, the error equation associ-
ated with ADI-II (9.38) is
∂ten + 1
2A(en +en−1) + B∆t(en − 2en−1 +en−2) =δn, (9.49)
whereδn is the truncation error on then-th level, i.e.,
δn = O(∆t2 +hp), p ≥ 2, (9.50)
for any reasonable spatial discretization. Choose∂ten as a test function. Then,
forn ≥ 2,
(∂ten,∂ten) + 1
2
(
A(en +en−1),∂ten)
+ ∆t2
(
B∆t∂
2
ten,∂ten
)
= (δn,∂ten). (9.51)
Multiply (9.51) by ∆t and sum beginning atn = 2 to have
n∑
j=2
∥∂tej∥2∆t + 1
2(Aen,en) + ∆t2
n∑
j=2
(B∆t∂
2
tej,∂tej)∆t
= 1
2(Ae1,e 1) +
n∑
j=2
(δj,∂tej)∆t.
(9.52)
Now, sinceb2 −ab ≥ (b2 −a2)/2, we have
n∑
j=2
(B∆t∂
2
tej,∂tej)∆t =
n∑
j=2
(B∆t[∂tej −∂tej−1],∂tej)
≥ 1
2(B∆t∂ten,∂ten) − 1
2(B∆t∂te1,∂te1).
(9.53)


## Page 344

334 Chapter 9. Locally One-Dimensional Methods
Apply the inequality (|ab| ≤ (a2+b2)/2) to the last term in (9.52). Then utilizing
(9.53), one can obtain the following inequality:
n∑
j=2
∥∂tej∥2∆t + (Aen,en) + ∆t2(B∆t∂ten,∂ten)
≤
n∑
j=2
∥δj∥2∆t + (Ae1,e 1) + ∆t2(B∆t∂te1,∂te1), n ≥ 2.
(9.54)
Thus, the estimation of the error generated by the ADI-II method is, in
the commutative case, reduced to bounding the errors in z0 and z1, thereby
emphasizing the remarks above on the evaluation of z1. Try to compare the
above analysis with (9.16) whenθ = 1/2.


## Page 345

9.3. LOD Methods for the Heat Equation 335
9.3.6. Accuracy and efﬁciency of ADI-II
To check the accuracy and efﬁciency of the ADI-II algorithm, let us choose
the domain Ω = (0 , 1)2 and the time interval J = (0, 1], along with the four
diffusion coefﬁcients
a1(x,y ) = 1 ,
a2(x,y ) = 1 /(2 + cos(3πx) · cos(2πy)),
a3(x,y ) =
{ 1 + 0.5 · sin(5πx) +y3, ifx ≤ 0.5,
1.5/(1 + (x − 0.5)2) +y3, else,
a4(x,y ) =
[ a2(x,y ) 0
0 a3(x,y )
]
.
(9.55)
• The ﬁrst time step to obtain z1 for the ADI-II was made by following the
w1-ADI calculation by SOR iterations to get the Crank-Nicolson value.
• Here, we compare the results of four different algorithms, namely the
LU-based, PCG-ILU0, ADI, and ADI-II methods.


## Page 346

336 Chapter 9. Locally One-Dimensional Methods
a =a1 a =a2 a =a3
CPU L2-error CPU L2-error CPU L2-error
LU-based 23.6 1.10e-3 27.2 3.52e-3 24.2 5.35e-3
PCG-ILU0 21.6 1.09e-3 24.0 3.52e-3 24.7 5.36e-3
ADI 7.14 1.70e-2 10.9 1.02e-2 7.91 2.67e-2
ADI-II 7.77 1.10e-3 11.3 3.54e-3 8.46 5.35e-3
Table 9.3: The performances of the LU-based, PCG-ILU0, ADI, and ADI-II
methods withc =α2 ≡ 0,νt = 1,νx = 4,νy = 3,nx =ny =nt = 100 foru =u×.
∆t = 2h ∆t =h ∆t =h/2 ∆ t =h/4
CPU L2-error CPU L2-error CPU L2-error CPU L2-error
LU-based 28.4 2.12e-3 49.6 2.13e-3 92.1 2.13e-3 176 2.13e-3
PCG-ILU0 24.9 2.14e-3 36.5 2.15e-3 57.6 2.14e-3 96.8 2.13e-3
ADI 8.19 2.01e-1 16.3 6.76e-2 32.4 1.75e-2 64.5 4.86e-3
ADI-II 8.80 1.10e-2 16.9 2.17e-3 33.2 2.13e-3 66.1 2.13e-3
Table 9.4: The performances of the LU-based, PCG-ILU0, ADI, and ADI-II
methods witha =a4,c =α2 ≡ 0,νt = 2.0,νx = 6.25,νy = 7,h =hx =hy = 1/120,
andu =u×.
Table 9.3 presents the performances of the four algorithms for the ﬁrst
three diffusion coefﬁcients in (9.55) foru =u× withνt = 1,νx = 4, and νy = 3.
The error for the ADI method is 16, 3, and 5 times larger than the Crank-
Nicolson error fora =a1, a2, anda3, respectively. The ADI-II method requires
only about 5-7% extra cost over the ADI method and its accuracy hardly differs
from that of the direct, LU-based solver, when ∆t ≤h.
Table 9.4 shows numerical results for various time steps, when a = a4 (an
anisotropic diffusivity), c =α2 ≡ 0,νt = 2,νx = 6.25, and νy = 7, and h =hx =
hy = 1/120. The ADI calculations show large splitting errors, even for small
time steps. Here again the improved initialization (9.42) greatly improves
the accuracy of the alternating direction procedure, for a few percent of extra
cost. However, as one can see from the table, the ADI-II algorithm generates a
splitting error that is a few times the Crank-Nicolson error for ∆t = 2h. Thus
one has to choose ∆t sufﬁciently small, although the splitting error isO(∆t3).


## Page 347

9.4. Homework 337
9.4. Homework
1. Show that all of (9.19), (9.20), and (9.23) are equivalent to each other.
Count and compare the required operations for (9.20) and (9.23) in each
time level.
2. Show that (9.28) is equivalent to (9.29)-(9.30), for m = 3.
3. Check if (9.37) is equivalent to (9.43), when m = 2. Count to compare the
required operations for them.
4. The given code in Matlab is an implementation for the ADI (9.20) solving
the heat equation in 2D. Adjust the code for ADI-II (9.37) withm = 2.
(a) The major step you should fulﬁll is to adjustF inxy_sweeps.m.
(b) Perform error analysis comparing errors from ADI and ADI-II.
(c) Report your additions to the code.


## Page 348

338 Chapter 9. Locally One-Dimensional Methods


## Page 349

Chapter 10
Special Schemes
In this chapter, we will deal with
• Absorbing boundart conditions (ABCs) for wave propagation
• Numerical techniques for PDE-based image processing
• ...
339


## Page 350

340 Chapter 10. Special Schemes
10.1. Wave Propagation and Absorbing Bound-
ary Conditions
10.1.1. Introduction to wave equations
Wave equations are often imposed by a suitable radiation condition at inﬁnity.
Such problems can be solved numerically by
• ﬁrst truncating the given unbounded domain,
• imposing a suitable ABC on the boundary of the truncated bounded do-
main,
• approximating the resulting problem by discretization methods such as
ﬁnite differences and ﬁnite element methods, and then
• applying computational algorithms to the resulting algebraic system.
Let Ω ⊂ Rm, 1 ≤m ≤ 3, be a bounded domain with its boundaryΓ =∂Ω and
J = (0,T ],T >0. Consider
(a) 1
v2utt − ∆u =S(x,t ), (x,t ) ∈ Ω ×J,
(b) 1
vut +uν = 0, (x,t ) ∈ Γ ×J,
(c) u(x, 0) =g0(x), ut(x, 0) =g1(x), x ∈ Ω,
(10.1)
where v = v(x) > 0 denotes the normal velocity of the wavefront, S is the
wave source/sink, ν denote the unit outer normal from Γ, and g0 and g1 are
initial data. Equation (10.1.b) is popular as a ﬁrst-order absorbing boundary
condition (ABC), since introduced by Clayton and Engquist [9]. We will call
(10.1.b) the Clayton-Engquist ABC (CE-ABC).
Equation (10.1) has been studied extensively as a model problem for second-
order hyperbolic problems; see e.g. [2, 7, 10, 46, 61]. It is often the case that
the source is given in the following form
S(x,t ) =δ(x − xs)f(t),
where xs ∈ Ω is the source point. For the function f, the Ricker wavelet of
frequencyλ can be chosen, i.e.,
f(t) =π2λ2 (1 − 2π2λ2t2)e−π2λ2t2
. (10.2)


## Page 351

10.1. Wave Propagation and Absorbing Boundary Conditions 341
10.1.2. Absorbing boundary conditions (ABCs)
The CE-ABC (10.1.b) has been studied and applied widely, representing a
ﬁrst-order ABC which allows normally incident waves to pass out of Ω trans-
parently. Various other ABCs have been introduced to absorb the energy pass-
ing the boundary more effectively.
Consider the Fourier transform (time to frequency) of the CE-ABC (10.1.b):
iω
v ˆu +ˆuν = 0, (10.3)
wherei is the imaginary unit,ω (:= 2πλ) denotes the angular frequency, and
ˆu(x,ω ) = 1√
2π
ˆ ∞
−∞
u(x,t )e−iωtdt.
In order to suppress the boundary reﬂection, Kim et al. [43] introduced the
following ABC
iωτνˆu +ˆuν = 0, (10.4)
whereτ is an appropriate solution of the eikonal equation
|∇τ | = 1
v, τ (xs) = 0, (10.5)
which can be solved effectively by employing optimal solvers such as the group
marching method (GMM) [39] and a high-order ENO-type iterative method
[40].
For the time domain simulation of the acoustic waves, we apply the inverse
Fourier transform to (10.4) to obtain
τνut +uν = 0, (10.6)
which will be called the traveltime ABC (TT-ABC). Note that τν ≥ 0 for out-
going waves and
τν = ∇τ ·ν = |∇τ | cosθ = cosθ
v ,
where θ is the angle of the wave measured with respect to the normal of the
boundary. Thus the TT-ABC is a canonical form of the ﬁrst-order ABC [29].
For normally incident wavefronts,τν = |∇τ | and therefore the TT-ABC (10.6)
acts like the CE-ABC (10.1.b).


## Page 352

342 Chapter 10. Special Schemes
• See Engquist-Majda [22] and Higdon [29, 30] for a hierarchy of ABCs
which approximate the nonlocal, pseudodifferential ABC [21].
• See [28, 31, 49, 66] for recent strategies for effective ABCs.
10.1.3. Waveform ABC
In this subsection, we introduce a new ABC which incorporates local wave-
form information in order to accurately estimate the incident angles of wave-
fronts, without using the ﬁrst-arrival traveltime.
We begin with an observation that ∇τ is parallel to ∇u (in acoustic media).
Thus, since |∇τ | = 1/v, we have
∇τ = ±1
v
∇u
|∇u|. (10.7)
Recall thatτν ≥ 0 for out-going wavefronts. Hence it follows from (10.7) that
τν = ∇τ ·ν = 1
v
|uν|
|∇u|. (10.8)
Note that the above equation must be satisﬁed for every wavefront that ap-
proaches to the boundary, including multiple arrivals. Thus an effective ABC
can be formulated as follows:
1
v
|uν|
|∇u|ut +uν = 0, (10.9)
which we will call the waveform ABC (WF-ABC).
Remarks:
• The TT-ABC (10.6) must be identical to the WF-ABC (10.9) for the ﬁrst
arrival. However, for later arrivals having different incident angles, the
TT-ABC may introduce a large boundary reﬂection. The WF-ABC is de-
signed in such a way that all wavefronts can pass out of the domain with
no noticeable reﬂection.
• Since it is in the form of ﬁrst-order ABCs, it can be easily implemented as
a stable boundary condition.
• For normally incident wavefronts, we have |uν| = |∇u| and therefore the
WF-ABC acts like the CE-ABC (10.1.b).


## Page 353

10.1. Wave Propagation and Absorbing Boundary Conditions 343
Approximation of WF-ABC:Here we present numerical strategies for
the approximation of the WF-ABC.
For example, let Ω = (0, 1)2 and ∆x = 1/nx, ∆y = 1/ny, for some positive
integersnx andny; let the grid points be given as
xij = (xi,yj) := (i∆x,j ∆y), i = 0, 1, · · ·,nx, j = 0, 1, · · ·,ny.
Let ∆t be the timestep andtn =n∆t.
Assume that we have computed uk(≈ u(·,tk)), k ≤ n, and un+1 is to be ob-
tained. Then, we may approximate (10.9) as
1
vQ(un)un+1 −un−1
2∆t + (∇hun) ·ν = 0, Q (un) ≈ |un
ν |
|∇un|, (10.10)
where ∇h is an spatial approximation of ∇. Here the quantity Q(un) must
evaluate accurately the cosine of the incident angle of the wavefront.


## Page 354

344 Chapter 10. Special Schemes
Figure 10.1: A boundary point B and a corner pointC.
Let Ω = (ax,bx) × (ay,by) and
∆x = (bx −ax)/nx, ∆y = (by −ay)/ny,
for some positive integersnx andny; let the grid points be given as
xij = (xi,yj) := (i∆x,j ∆y), i = 0, · · ·,nx, j = 0, · · ·,ny.
For the boundary points B andC as in Figure 10.1, we may apply difference
schemes to determineun.
• For bothB andC, the second-order FDM approximates the main equa-
tion (10.1.a) as
1
v2
un+1
O − 2un
O +un−1
O
∆t2 + −un
W + 2un
O −un
E
∆x2
+−un
S + 2un
O −un
N
∆y2 =Sn
O.
(10.11)
• For the point B, un
S is a ghost value to be eliminated. The WF-ABC
(10.10) reads
1
vQS(un)un+1
O −un−1
O
2∆t +un
S −un
N
2∆y = 0, (10.12)
whereQS(un) = | −un
y |/|∇un|.
Perform (10.11)+ 2
∆y(10.12) and then solve the resulting equation forun+1
O at the pointB:
[ 1
v2∆t2 +QS(un)
v∆t∆y
]
un+1
O = 2un
O −un−1
O
v2∆t2 +QS(un)
v∆t∆yun−1
O
+Sn
O − −un
W + 2un
O −un
E
∆x2 − 2un
O − 2un
N
∆y2 .


## Page 355

10.1. Wave Propagation and Absorbing Boundary Conditions 345
Multiplying both sides of the above equation byv2∆t2, we reach at
(At the boundary pointB):
[
1 +v∆tQS(un)
∆y
]
un+1
O = (2un
O −un−1
O )
+v∆tQS(un)
∆y un−1
O
+v2∆t2
[
Sn
O − −un
W + 2un
O −un
E
∆x2 − 2un
O − 2un
N
∆y2
]
.
(10.13)
• For the pointC,un
S andun
W are ghost values to be eliminated. The WF-
ABC (10.10) reads
(a) 1
vQW(un)un+1
O −un−1
O
2∆t +un
W −un
E
2∆x = 0 ,
(b) 1
vQS(un)un+1
O −un−1
O
2∆t +un
S −un
N
2∆y = 0 ,
(10.14)
whereQW(un) = | −un
x|/|∇un|.
Perform (10.11)+ 2
∆x(10.14.a)+ 2
∆y(10.14.b) and then solve the resulting
equation forun+1
O at the pointC:
[ 1
v2∆t2 +QW(un)
v∆t∆x +QS(un)
v∆t∆y
]
un+1
O = 2un
O −un−1
O
v2∆t2
+
(QW(un)
v∆t∆x +QS(un)
v∆t∆y
)
un−1
O
+Sn
O − 2un
O − 2un
E
∆x2 − 2un
O − 2un
N
∆y2 .
Multiplying both sides of the above equation byv2∆t2, we reach at


## Page 356

346 Chapter 10. Special Schemes
(At the corner pointC):
[
1 +v∆t
(QW(un)
∆x +QS(un)
∆y
)]
un+1
O = (2un
O −un−1
O )
+v∆t
(QW(un)
∆x +QS(un)
∆y
)
un−1
O
+v2∆t2
(
Sn
O − 2un
O − 2un
E
∆x2 − 2un
O − 2un
N
∆y2
)
.
(10.15)


## Page 357

Chapter 11
Projects∗
11.1. High-order FEMs for PDEs of One Spacial
Variable
The provided Python code is implemented for solving
−uxx =f, x ∈ (a,b )
u =g, x =a, b, (11.1)
using high-order Galerkin FE methods.
Through the project, you will modify the code for the numerical solution of
more general problems of the form
−(Kux)x +ru =f, x ∈ (a,b )
Kuν =g, x =a, b, (11.2)
whereK =K(x) andr are prescribed continuous positive functions.
347


## Page 358

348 Chapter 11. Projects∗
Here are your objectives:
• Derive Galerkin FEMs for (11.2) of Neumann boundary conditions.
• Modify the code for the problem. You may have to spend a certain amount
of time to understand the code. Please save new functions in a new ﬁle;
do not add any extra functions toutil_FEM_1D.py.
• Test your code for its convergence, for example, for
– (a,b ) = (0,π )
–K(x) = 1 +x
–r(x) ≡ 1
– The exact solutionu(x) = sin(x).
You have to setf andg correspondingly; for example,g(0) = 1 andg(π) =
−(1 +π).
• Report your results by Tue Nov 24, 2015, in hard copies, including new
functions (you implemented) and convergence analysis. The project is
worth 100 points.


## Page 359

Appendix A
Basic Concepts in Fluid Dynamics
Physical properties of ﬂuid ﬂow under consideration must be known if one is
to either study ﬂuid motion or design numerical methods to simulate it. This
appendix is devoted to introducing basic concepts of ﬂuid ﬂows.
A.1. Conservation Principles
Conservation laws can be derived by considering a given quantity of matter or
control mass (CM) and its extensive properties such as mass, momentum, and
energy. This approach is used to study the dynamics of solid bodies, where the
CM is easily identiﬁed. However, it is difﬁcult to follow matter in ﬂuid ﬂows.
It is more convenient to deal with the ﬂow in a certain spatial region, called
the control volume (CV).
We ﬁrst consider the conservation laws for extensive properties: mass and
momentum. For mass, which is neither created nor destroyed, the conserva-
tion equation reads
dm
dt = 0, (A.1)
wheret is time andm represents mass. On the other hand, the momentum can
be changed by the action of forces and its conservation equation is Newton’s
second law of motion
d(mv)
dt =
∑
f, (A.2)
where v is the ﬂuid velocity and f is forces acting on the control mass.
349


## Page 360

350 Appendix A. Basic Concepts in Fluid Dynamics
We will reformulate these laws with incorporation of the control volume.
The fundamental variables will beintensive, rather than extensive, properties
that are independent of the amount of matter. Examples are density ρ (mass
per unit volume) and velocity v (momentum per unit mass).
For any intensive propertyφ, the corresponding extensive property Φ is by
deﬁnition given as
Φ =
ˆ
ΩCM
ρφ dΩ, (A.3)
where ΩCM is the volume occupied by the CM. For example, φ = 1 for mass
conservation,φ = v for momentum conservation, and for a scalar property, φ
represents the conserved property per unit mass. Using (A.3), the left hand
side of each of conservation equations, (A.1) and (A.2), can be written as
d
dt
ˆ
ΩCM
ρφ dΩ = d
dt
ˆ
ΩCV
ρφ dΩ +
ˆ
∂ΩCV
ρφ(v − vb) · n dS, (A.4)
where ΩCV is the CV, n denotes the unit outward normal to ∂ΩCV , dS repre-
sents the surface element, v is the ﬂuid velocity, and vb denotes the velocity
of the CV surface∂ΩCV . The equation (A.4) is called the control volume equa-
tion or the Reynolds’s transport equation. For a ﬁxed CV, vb = 0 and the ﬁrst
derivative on the right hand side of (A.4) becomes a local (partial) derivative:
d
dt
ˆ
ΩCM
ρφ dΩ = ∂
∂t
ˆ
ΩCV
ρφ dΩ +
ˆ
∂ΩCV
ρφ v · n dS. (A.5)
Note that the material derivative applied to the control volume is
d
dt = ∂
∂t + vb · ∇.
For a detailed derivation of this equation, see e.g. [54, 69].
A.2. Conservation of Mass
The integral form of the mass conservation equation follows from the control
volume equation (A.5), by settingφ = 1:
∂
∂t
ˆ
Ω
ρdΩ +
ˆ
∂Ω
ρv · n dS = 0, (A.6)


## Page 361

A.3. Conservation of Momentum 351
where we have omitted the subscript CV from Ω. The above equation is also
called the continuity equation. Recall the Gauss’s divergence theorem
ˆ
Ω
∇ · A dΩ =
ˆ
∂Ω
A · n dS, (A.7)
for any vector ﬁeld A deﬁned in the control volume Ω. Applying (A.7) to (A.6)
and allowing the CV to become inﬁnitesimally small, we have the following
differential coordinate-free form of the continuity equation
∂ρ
∂t + ∇ · (ρv) = 0, (A.8)
and its Cartesian form
∂ρ
∂t +∂(ρvi)
∂xi
= ∂ρ
∂t +∂(ρu)
∂x +∂(ρv)
∂y +∂(ρw)
∂z = 0, (A.9)
wherexi (i = 1, 2, 3) or (x,y,z ) are the Cartesian coordinates andvi or (u,v,w )
are the Cartesian components of the velocity v. Here we have utilized the
Einstein convention that whenever the same index appears twice in any term,
summation over the range of that index is applied.
A.3. Conservation of Momentum
Using (A.2) and (A.5) with φ = v, one can obtain the integral form of the
momentum conservation equation
∂
∂t
ˆ
Ω
ρv dΩ +
ˆ
∂Ω
ρv v · n dS =
∑
f. (A.10)
The right hand side consists of the forces:
– surface forces: pressure, normal and shear stresses, surface tension, etc.;
– body forces: gravity, electromagnetic forces, etc..
The surface forces due to pressure and stresses are the microscopic momen-
tum ﬂux across the surface. For Newtonian ﬂuids, the stress tensor T , which
is the molecular transport rate of momentum, reads
T = 2µD +
[(
κ − 2
3µ
)
∇ · v −p
]
I, (A.11)


## Page 362

352 Appendix A. Basic Concepts in Fluid Dynamics
where p is the static pressure, µ and κ are respectively the shear coefﬁcient
of viscosity and the bulk coefﬁcient of viscosity,I is the unit (identity) tensor,
and D is the rate of strain (deformation) tensor deﬁned by
D = 1
2
(
∇v + (∇v)T
)
. (A.12)
The following notation is often used in the literature to denote the viscous
part of the stress tensor
τ = 2µD +
[(
κ − 2
3µ
)
∇ · v
]
I. (A.13)
Thus the stress tensor can be written as
T =τ −pI (A.14)
and its components read
Tij =τij −pδij, (A.15)
where
τij = 2µDij +
(
κ − 2
3µ
)
δij∇ · v, Dij = 1
2
(∂vi
∂xj
+∂vj
∂xi
)
.
Assume that gravity g is the only body force. Then, the integral form of the
momentum conservation equation becomes
∂
∂t
ˆ
Ω
ρv dΩ +
ˆ
∂Ω
ρv v · n dS =
ˆ
∂Ω
T · n dS +
ˆ
Ω
ρg dΩ. (A.16)
A coordinate-free vector form of the momentum conservation equation is read-
ily obtained by applying the Gauss’s divergence theorem (A.7) to the convec-
tive and diffusive ﬂux terms of (A.16):
∂(ρv)
∂t + ∇ · (ρvv) = ∇ · T +ρg. (A.17)
The continuity equation (A.8) and the momentum equations (A.17) are called
the Navier-Stokes equations.
The corresponding equation for theith component of (A.17) is
∂(ρvi)
∂t + ∇ · (ρviv) = ∇ · Ti +ρgi, (A.18)


## Page 363

A.3. Conservation of Momentum 353
where Ti in the Cartesian coordinates can be expressed as
Ti =µ
(∂vi
∂xj
+∂vj
∂xi
)
Ij +
[(
κ − 2
3µ
)
∇ · v −p
]
Ii, (A.19)
whereIi is the Cartesian unit vector in the direction of the coordinatexi.
The integral form of (A.18) reads
∂
∂t
ˆ
Ω
ρvi dΩ +
ˆ
∂Ω
ρvi v · n dS =
ˆ
∂Ω
Ti · n dS +
ˆ
Ω
ρgi dΩ. (A.20)
In index notation, (A.18) can be rewritten as
∂(ρvi)
∂t +∂(ρvjvi)
∂xj
= −∂p
∂xi
+∂τij
∂xj
+ρgi. (A.21)
In approximating the momentum equations by ﬁnite difference schemes, it is
often more convenient to deal with the following non-conservative form
ρ
(∂vi
∂t + v · ∇vi
)
= ∇ · Ti +ρgi. (A.22)
Here we describe the momentum equations for the incompressible Newto-
nian ﬂuid of constant density and viscosity. In this case, since ∇ ·v = 0, (A.21)
becomes
ρ
(∂vi
∂t +vj
∂vi
∂xj
)
= −∂p
∂xi
+ρgi +µ ∂2vi
∂xj∂xj
. (A.23)
In 2D Cartesian coordinates, (A.23) reads
(a) ρ
(∂v1
∂t +v1
∂v1
∂x +v2
∂v1
∂y
)
= −∂p
∂x +ρg1 +µ
(∂2v1
∂x2 +∂2v1
∂y2
)
,
(b) ρ
(∂v2
∂t +v1
∂v2
∂x +v2
∂v2
∂y
)
= −∂p
∂y +ρg2 +µ
(∂2v2
∂x2 +∂2v2
∂y2
)
.
(A.24)
Thus the complete set of the Navier-Stokes equations for incompressible ho-
mogeneous ﬂows becomes (in Gibbs notation)
(a) ∇ · v = 0,
(b) ∂v
∂t + (v · ∇)v = −∇p′ + g +ν∆v.
(A.25)
wherep′ =p/ρ andν =µ/ρ is the kinematic viscosity coefﬁcient.


## Page 364

354 Appendix A. Basic Concepts in Fluid Dynamics
In the case of frictionless (inviscid) ﬂow, i.e., µ = 0, the equation of motion
(A.25.b) reduces to the Euler’s equation,
∂v
∂t + (v · ∇)v = −∇p′ + g. (A.26)
A.4. Non-dimensionalization of the Navier-Stokes
Equations
Now we will discuss some scaling properties of the Navier-Stokes equations
with the aim of introducing a parameter (the Reynolds number) that mea-
sures the effect of viscosity.
LetL be a reference length L andU a reference velocity. These number are
chosen in an arbitrary way. For example, if we consider a free-stream ﬂow
past a sphere,L can be either the radius or the diameter of the sphere and U
can be the magnitude of the ﬂuid velocity at inﬁnity. The choice determines a
time scale T = L/U. We measure x, v, and t as fractions of these scales, i.e.,
we introduce the following dimensionless quantities
x′ = x
L, v′ = v
U, t ′ = t
T.
Consider the change of variables e.g. for thex-component of the Navier-Stokes
equations in 2D Cartesian coordinates (A.24.a):
ρ
(∂(Uv ′
1)
∂t′
∂t′
∂t +Uv ′
1
∂(Uv ′
1)
∂x′
∂x′
∂x +Uv 2
∂(Uv ′
1)
∂y ′
∂y ′
∂y
)
= −∂p
∂x′
∂x′
∂x +ρg1 +µ
(∂2(Uv ′
1)
∂(Lx′)2 +∂2(Uv ′
1)
∂(Lx′)2
)
,
or
ρU 2
L
(∂v ′
1
∂t′ +v′
1
∂v ′
1
∂x′ +v′
2
∂v ′
1
∂y ′
)
= − 1
L
∂p
∂x′ +ρg1 +µ U
L2
(∂2v′
1
∂x′2 +∂2v′
1
∂y ′2
)
.
Thus we have
∂v ′
1
∂t′ +v′
1
∂v ′
1
∂x′ +v′
2
∂v ′
1
∂y ′ = − 1
ρU 2
∂p
∂x′ + L
U 2g1 + ν
LU
(∂2v′
1
∂x′2 +∂2v′
1
∂y ′2
)
.


## Page 365

A.5. Generic Transport Equations 355
It is straightforward to apply the change of variables to thex-component (and
also the other ones) of the Navier-Stokes equations in 3D. It follows from the
change of variables that (A.25) becomes
(a) ∇′ · v′ = 0,
(b) ∂v′
∂t′ + v′ · ∇′v′ = −∇′p′ + g′ + 1
R∆′v′,
(A.27)
where
p′ = p
ρU 2, g′ = Lg
U 2, R = LU
ν .
Here the dimensionless quantity R is the Reynolds number. The equations
(A.27) are the the Navier-Stokes equations in dimensionless variables. (The
gravity term g′ is often ignored.)
WhenR is very small, the ﬂow transport is dominated by the diffusion/dissipation
and the convection term (sometimes, called inertia) v · ∇ v becomes much
smaller than the diffusion term 1
R∆v, i.e.,
|v · ∇v| ≪
⏐⏐⏐ 1
R∆v
⏐⏐⏐.
Ignoring the convection term, we have the Stokes’s equations
(a) ∇ · v = 0,
(b) ∂v
∂t = −∇p + g + 1
R∆v.
(A.28)
A.5. Generic Transport Equations
The integral form of the equation describing conservation of a scalar quantity
φ is analogous to the previous equations and reads
∂
∂t
ˆ
Ω
ρφ dΩ +
ˆ
∂Ω
ρφ v · n dS =
∑
fφ, (A.29)
wherefφ represents any sources and sinks and transport ofφ by mechanisms
other than convection. Diffusive transport fd
φ is always present and usually
expressed by a gradient approximation
fd
φ =
ˆ
∂Ω
D∇φ · n dS, (A.30)


## Page 366

356 Appendix A. Basic Concepts in Fluid Dynamics
where D is the diffusivity for φ. The equation (A.30) is called Fick’s law for
mass diffusion or Fourier’s law for heat diffusion. Since the sources/sinks can
be expressed as
fs
φ =
ˆ
Ω
qφ dΩ,
setting fφ = fd
φ +fs
φ and applying the Gauss’s divergence theorem, one can
obtain the generic transport equation, the coordinate-free form of the equation
(A.29):
∂(ρφ)
∂t + ∇ · (ρφv) = ∇ · (D∇φ) +qφ. (A.31)
The lecture note will ﬁrst focus on the numerical methods for (A.31). More pre-
cisely, we will consider numerical methods for the convection-diffusion equa-
tion of the form
(a) ∂c
∂t + ∇ · (vc) − ∇ · (D∇c) =f, (x,t ) ∈ Ω ×J,
(b) (D∇c) ·ν = 0, (x,t ) ∈ Γ ×J,
(c) c =c0, x ∈ Ω, t = 0,
(A.32)
wherec is the unknown (e.g. concentration), Ω ⊂ Rd, 1 ≤ d ≤ 3, is a bounded
domain with its boundary Γ = ∂Ω and J = (0,T ] the time interval, T > 0.
Here v = v(c) is the ﬂuid velocity, ν is the outward normal to Γ, and f =f(c)
denotes chemical reactions and source/sink. The diffusion tensor D =D(v,c )
is symmetric and positive deﬁnite:
DT =D; D∗|y|2 ≤ yTD(x)y ≤ D∗|y|2, ∀ x ∈ Ω, ∀ y ∈ Rd,
for some positive constants D∗ and D∗. The velocity either can be obtained
by solving another equation such as the pressure equation or is given from
experiments.
Special features of the continuity and momentum equations (Navier-Stokes
equations) will be considered afterwards as applications of the numerical meth-
ods for the generic equation.
A.6. Homework
1. Use ∇ · (ρviv) =vi∇ · (ρv) +ρv · ∇vi to derive (A.22) from (A.9) and (A.18).


## Page 367

A.6. Homework 357
2. Derive (A.23).


## Page 368

358 Appendix A. Basic Concepts in Fluid Dynamics


## Page 369

Appendix B
Elliptic Partial Differential Equations
B.1. Regularity Estimates
The quasilinear second-order elliptic equation in 2D is deﬁned as
−∇ · (A(x)∇u) +b(x,u, ∇u) =f(x), (B.1)
whereb is a general function andA is symmetric positive deﬁnite, i.e.,
A =
[ a11 a12
a12 a22
]
, a 11> 0, a22> 0, a 11a22>a 2
12.
For simplicity, we begin with the constant coefﬁcient linear equation
−∇ · (A∇u) + b · ∇u +cu =f, (B.2)
where b = (b1,b 2).
The Fourier transform in 2D reads
ˆu(ξ) = 1
2π
ˆ
R2
u(x)e−ix·ξdx;
its inverse formula is
u(x) = 1
2π
ˆ
R2
u(ξ)eix·ξdξ.
The Fourier transform satisﬁes the Parseval’s identity
ˆ
R2
|u(x)|2dx =
ˆ
R2
|ˆu(ξ)|2dξ. (B.3)
359


## Page 370

360 Appendix B. Elliptic Partial Differential Equations
Let ∂x = (∂x1,∂x2), where ∂xi = ∂/∂xi, i = 1, 2. For α = (α1,α 2), a pair of
nonnegative integers, deﬁne
|α| =α1 +α2, ξα =ξα1
1 ξα2
2 , ∂ α
x = (∂α1
x1,∂α2
x2 ).
Since
ˆ∂α
xu =i|α|ξαˆu, (B.4)
equation (B.2) in its Fourier transform becomes
P (ξ)ˆu(ξ) = ˆf(ξ), (B.5)
where
P (ξ) =ξ ·Aξ +ib ·ξ +c.
From the ellipticity requirements: a11> 0,a22> 0, anda11a22>a 2
12, we see
ξ ·Aξ ≥ C0|ξ|2,
for someC0> 0. Thus there are C1> 0 andR0 ≥ 0 such that
|P (ξ)| ≥ C1|ξ|2, if |ξ| ≥ R0, (B.6)
and therefore we have
|ˆu(ξ)| ≤ C2
|ˆf(ξ)|
|ξ|2 , if |ξ| ≥ R0, (B.7)
for someC2> 0. Thus, from (B.3), (B.4), and (B.7),
ˆ
R2
|∂α
xu|2dx =
ˆ
R2
|ξαˆu|2dξ
≤
ˆ
|ξ|≤R0
|ξ|2|α| |ˆu|2dξ +
ˆ
|ξ|≥R0
C2|ξ|2|α| |ˆf |2
|ξ|2dξ
≤ R2|α|
0
ˆ
R2
|ˆu|2dξ +C2
ˆ
R2
|ξ|2|α|−2 |ˆf |2dξ.
(B.8)
For nonnegative integers, theHs(R2)-norm is deﬁned as
∥u∥2
s =
∑
|α|≤s
ˆ
R2
|∂α
xu|2dx.


## Page 371

B.2. Maximum and Minimum Principles 361
Then, it follows from (B.8) and the Parseval’s identity that
∥u∥2
s+2 ≤C(∥f ∥2
s + ∥u∥2
0), s ≥ 0, (B.9)
for someC =C(s,A, b,c )> 0.
The inequality (B.9) is called a regularity estimate. Note that when b = 0
andc ≥ 0, (B.6) holds withR0 = 0. Thus the regularity estimate reads
∥u∥s+2 ≤C∥f ∥s, s ≥ 0, if b = 0 andc ≥ 0. (B.10)
When (B.2) is deﬁned on bounded domain Ω ⊂ R2 whose boundary is suf-
ﬁciently smooth, one can obtain an interior regularity estimate of the form
∥u∥2
s+2,Ω1 ≤C(∥f ∥2
s,Ω + ∥u∥2
0,Ω), s ≥ 0, (B.11)
where Ω1 ⊂ Ω is such that its boundary is contained in the interior of Ω, and
the constantC =C(s,A, b,c, Ω, Ω1)> 0.
B.2. Maximum and Minimum Principles
This section presents the maximum and minimum principles for subharmonic
and superharmonic functions, respectively, following Gilberg and Trudinger
[26, Ch.2].
The functionu is called harmonic (subharmonic, superharmonic) in Ω ⊂ Rn
if it satisﬁes
−∆u = 0 ( ≤ 0, ≥ 0), x ∈ Ω.
The following is known as the mean value theorems , which characterize har-
monic functions.
Theorem B.1. Letu ∈C2(Ω) satisfy −∆u = 0 ( ≤ 0, ≥ 0) in Ω. Then, for any
ballB =BR(y) ⊂⊂ Ω, we have
u(y) = ( ≤, ≥) 1
|∂B |
ˆ
∂B
uds,
u(y) = ( ≤, ≥) 1
|B|
ˆ
B
ud x.
(B.12)


## Page 372

362 Appendix B. Elliptic Partial Differential Equations
With the aid of Theorem B.1, the strong maximum principle for subhar-
monic functions and the strong minimum principle for superharmonic func-
tions can be derived as follows.
Theorem B.2. Let −∆u ≤ 0 ( ≥ 0) in Ω and suppose there is a point y ∈ Ω
such that
u(y) = sup
Ω
u (inf
Ω
u).
Thenu is constant. Therefore a harmonic function cannot assume an interior
maximum or minimum value unless it is constant.
Proof. Let −∆u ≤ 0 in Ω, M = sup Ωu and ΩM = {x ∈ Ω : u(x) = M }.
By assumption, ΩM ̸= ∅. Furthermore since u is continuous, ΩM is closed
relative to Ω. We are going to show ΩM is also open relative to Ω to conclude
ΩM = Ω. Let z is a point in ΩM. Apply the mean value inequality (B.12) to the
subharmonic functionu −M in a ballB =BR(z) ⊂⊂ Ω to get
0 =u(z) −M ≤ 1
|B|
ˆ
B
(u −M)dx ≤ 0.
Sinceu −M ≤ 0 in inBR(z), we must haveu =M inBR(z), which implies ΩM
is open. The result for superharmonic functions follows by replacing u by −u.
Theorem B.2 implies the following weak maximum and minimum princi-
ples.
Theorem B.3. Let u ∈ C2(Ω) ∩ C0(Ω) with −∆u ≤ 0 ( ≥ 0) in Ω. Then,
provided that Ω is bounded,
sup
Ω
u = sup
∂Ω
u (inf
Ω
u = inf
∂Ω
u).
Therefore, for a harmonic functionu,
inf
∂Ω
u ≤u(x) ≤ sup
∂Ω
u, x ∈ Ω.
The uniqueness theorem for the classical Dirichlet problem for the Poisson
equation in bounded domains follows from Theorem B.3.
Theorem B.4. Let u,v ∈ C2(Ω) ∩C0(Ω) satisfy −∆u = −∆v in Ω and u = v
on∂Ω. Then u =v in Ω.


## Page 373

B.3. Discrete Maximum and Minimum Principles 363
Proof. Let w = u −v. Then −∆w = 0 in Ω and w = 0 on ∂Ω. It follows from
Theorem B.3 thatw ≡ 0 in Ω.
Now, consider the linear elliptic operator of the form
Lu = −∇ · (A(x)∇u) + b(x) · ∇u +c(x)u. (B.13)
A functionu satisfyingLu = 0 ( ≤ 0, ≥ 0) in Ω is called a solution (subsolution,
supersolution) of Lu = 0 in Ω. Analogues to Theorems B.3 and B.4 can be
proved forL. See [26, §3.1] for proofs.
Theorem B.5. LetL be elliptic in a bounded domain Ω withc = 0. Suppose
u ∈C2(Ω) ∩C0(Ω) withLu ≤ 0 ( ≥ 0) in Ω. Then
sup
Ω
u = sup
∂Ω
u (inf
Ω
u = inf
∂Ω
u).
Theorem B.6. Let L be elliptic with c ≥ 0. Suppose u,v ∈ C2(Ω) ∩C0(Ω)
satisfyLu = Lv in Ω andu = v on∂Ω. Then u = v in Ω. If Lu ≤ Lv in Ω and
u ≤v on∂Ω, thenu ≤v in Ω.
B.3. Discrete Maximum and Minimum Principles
Let ∆h be the discrete ﬁve-point Laplacian deﬁned on grid points Ωh = {xpq ∈
Ω}, whereh is the grid size and Ω is a bounded region in 2D.
Theorem B.7. Let Ω be a rectangular region and −∆hu ≤ 0 ( ≥ 0) on Ωh. If u
has an interior maximum (minimum), thenu is constant on Ωh. Therefore
max
Ωh
u = max
∂Ωh
u (min
Ωh
u = min
∂Ωh
u).
Proof. First, consider the case −∆hu ≤ 0; let u have a maximum value at an
interior point xpq. The condition −∆hu ≤ 0 is equivalent to
upq ≤ 1
2 + 2r2(up−1,q +up+1,q +r2up,q−1 +r2up,q+1), (B.14)
where r = hx/hy. Hence this easily leads to the conclusion that the interior
point xpq can have a (local) maximum only if all neighboring points have the


## Page 374

364 Appendix B. Elliptic Partial Differential Equations
same maximum value and that the inequality is actually an equality. The
argument then implies that u has the same value at all grid points includ-
ing those on the boundary. This proves the discrete maximum principle for
−∆hu ≤ 0. Now, the discrete minimum principle for the superharmonic func-
tions can be proved by replacing u by −u and following the same argument.
The following generalizes Theorem B.7.
Theorem B.8. LetL = −∇ ·A(x)∇ + b(x) · ∇ be an elliptic operator deﬁned
in a rectangular region Ω, where A(x) = diag(a11(x),a 22(x)), and Lh be the a
ﬁve-point FD discretization of L. Assume that h is sufﬁciently small when
b ̸= 0. Suppose a function u satisﬁesLhu ≤ 0 ( ≥ 0) on Ωh and has an interior
maximum (minimum), thenu is constant on Ωh. Thus
max
Ωh
u = max
∂Ωh
u (min
Ωh
u = min
∂Ωh
u)
and therefore, for a solutionu ofLhu = 0,
inf
∂Ωh
u ≤u(x) ≤ sup
∂Ωh
u, x ∈ Ωh.
Proof. Let u have a maximum at an interior point xpq. The condition Lhu ≤ 0
is equivalent to
upq ≤ 1
apq
pq
(
−apq
p−1,qup−1,q −apq
p+1,qup+1,q −apq
p,q−1up,q−1 −apq
p,q+1up,q+1
)
, (B.15)
whereapq
rs is the matrix entry corresponding to the relationship of Lh fromupq
tours. Note that for ﬁve-point FD schemes,
apq
pq = −(apq
p−1,q +apq
p+1,q +apq
p,q−1 +apq
p,q+1)> 0. (B.16)
When b = 0 , it is easy to see that the coefﬁcients apq
rs, (pq) ̸= (rs), are all
strictly negative; for the case b ̸= 0, one needs to choose the grid size h sufﬁ-
ciently small in order for the four off-diagonal entries of the algebraic system
to remain negative. Now, let upq be an interior (local) maximum. Then it fol-
lows from (B.15), (B.16), and apq
rs < 0, (pq) ̸= (rs), that all the neighboring
values must be the same as the maximum, which implies u is constant on


## Page 375

B.4. Coordinate Changes 365
Ωh. This proves the discrete maximum principle for subsolutions. As in the
proof of Theorem B.7, the discrete minimum principle for supersolutions can
be proved by replacingu by −u and following the same argument.
See Exercise 4.7, on page 152, for the maximum principle applied for more
general elliptic problems.
B.4. Coordinate Changes
Often we have to solve the PDEs on a domain that is not a rectangle or other
easy shape. In the case it is desirable to change coordinates so that the solu-
tion can be computed in a convenient coordinate system. We begin with the
elliptic equation
−∇ · (A(x)∇u) =f(x), (B.17)
where A = [aij] is symmetric positive deﬁnite. Let ξ be another coordinate
system:
ξ =ξ(x). (B.18)
Then we see
∇x =JT ∇ξ, J =
[∂ξi
∂xj
]
, (B.19)
and therefore
∇x ·A∇x = ∇ξ ·JAJT ∇ξ. (B.20)
Note thatB(:=JAJT) is symmetric; its positiveness can be shown for certain
cases.
As an example consider the Poisson equation deﬁned on a trapezoidal do-
main:
Ω = {(x1,x 2) : 0<x 1< 1, 0<x 2< (1 +x1)/2}.
Deﬁne a new coordinate systemξ ∈ (0, 1)2,
ξ1 =x1, ξ 2 = 2x2
1 +x1
.
Then the Jacobian reads
J =
[ 1 0
−ξ2/(1 +ξ1) 2 /(1 +ξ1)
]


## Page 376

366 Appendix B. Elliptic Partial Differential Equations
and
B =JAJT =JJT =


1 − ξ2
1 +ξ1
− ξ2
1 +ξ1
ξ2
2 + 4
(1 +ξ1)2

.
The matrixB(ξ) is clearly symmetric and positive deﬁnite on the unit square.
The problem
−∇ ·B(ξ)∇u =f(ξ), ξ ∈ (0, 1)2,
can be approximated by the standard second-order FD method.
B.5. Cylindrical and Spherical Coordinates
The cylindrical coordinates (ρ,φ,z ) determine a point P whose Cartesian co-
ordinates are
x =ρ cosφ, y =ρ sinφ, z =z. (B.21)
Thus ρ and φ are the polar coordinates in the xy-plane of the point Q, where
Q is the projection ofP onto that plane. Relations (B.21) can be written as
ρ =
√
x2 +y2, φ = tan−1(y/x), z =z. (B.22)
It follows from (B.21) and (B.22) that
∂u
∂x = ∂u
∂ρ
∂ρ
∂x +∂u
∂φ
∂φ
∂x = x
ρ
∂u
∂ρ − y
ρ2
∂u
∂φ = cosφ∂u
∂ρ − sinφ
ρ
∂u
∂φ.
Replacing the functionu in the above equation by ∂u
∂x, we see
∂2u
∂x2 = cos φ ∂
∂ρ
(∂u
∂x
)
− sinφ
ρ
∂
∂φ
(∂u
∂x
)
= cos φ ∂
∂ρ
(
cosφ∂u
∂ρ − sinφ
ρ
∂u
∂φ
)
− sinφ
ρ
∂
∂φ
(
cosφ∂u
∂ρ − sinφ
ρ
∂u
∂φ
)
= cos 2φ∂2u
∂ρ2 − 2 sinφ cosφ
ρ
∂2u
∂φ∂ρ + sin2φ
ρ2
∂2u
∂φ2
+sin2φ
ρ
∂u
∂ρ + 2 sinφ cosφ
ρ2
∂u
∂φ.
(B.23)


## Page 377

B.5. Cylindrical and Spherical Coordinates 367
In the same way, one can show that
∂u
∂y = sinφ∂u
∂ρ + cosφ
ρ
∂u
∂φ
and
∂2u
∂y2 = sin 2φ∂2u
∂ρ2 + 2 sinφ cosφ
ρ
∂2u
∂φ∂ρ + cos2φ
ρ2
∂2u
∂φ2
+cos2φ
ρ
∂u
∂ρ − 2 sinφ cosφ
ρ2
∂u
∂φ.
(B.24)
From (B.23) and (B.24), the Laplacian ofu in cylindrical coordinates is
∆u = ∂2u
∂ρ2 + 1
ρ
∂u
∂ρ + 1
ρ2
∂2u
∂φ2 +∂2u
∂z 2
= 1
ρ(ρuρ)ρ + 1
ρ2uφφ +uzz.
(B.25)
The spherical coordinates (r,φ,θ ) of a point are related to x, y, and z as
follows:
x =r sinθ cosφ, y =r sinθ sinφ, z =r cosθ. (B.26)
Using the arguments for the cylindrical coordinates, one can see that the
Laplacian ofu in spherical coordinates is
∆u = ∂2u
∂r2 + 2
r
∂u
∂r + 1
r2 sin2θ
∂2u
∂φ2 + 1
r2
∂2u
∂θ2 + cotθ
r2
∂u
∂θ
= 1
r2(r2ur)r + 1
r2 sin2θuφφ + 1
r2 sinθ(uθ sinθ)θ.
(B.27)


## Page 378

368 Appendix B. Elliptic Partial Differential Equations


## Page 379

Appendix C
Helmholtz Wave Equation∗
To be included.
369


## Page 380

370 Appendix C. Helmholtz Wave Equation∗


## Page 381

Appendix D
Richards’s Equation for Unsaturated
Water Flow∗
To be included.
371


## Page 382

372 Appendix D. Richards’s Equation for Unsaturated Water Flow∗


## Page 383

Appendix E
Orthogonal Polynomials and
Quadratures
E.1. Orthogonal Polynomials
Letw be a given function deﬁned on (−1, 1) and positive there. (The function
w is often called a weight function.) Let f and g be deﬁned on the interval
(−1, 1). Deﬁne the scalar product of the functionsf andg on (−1, 1) as
(f,g )w =
ˆ 1
−1
f(x)g(x)w(x)dx. (E.1)
Then, the orthogonal polynomials on (−1, 1) with respect to the weight func-
tionw are a series of polynomials {Pk}k=0,1,2,··· satisfying
Pk ∈ Pk; ( Pk,Pm)w = 0, k ̸=m, (E.2)
where Pk denotes the space of polynomials of degree ≤k.
Those orthogonal polynomials satisfy athree-term recurrence relationof the
form
Pk+1(x) =Ak(x −Bk)Pk(x) −CkPk−1(x), k = 0, 1, 2, · · ·, (E.3)
373


## Page 384

374 Appendix E. Orthogonal Polynomials and Quadratures
where
P−1 ≡ 0,
Ak = αk+1
αk
,
Bk = (xPk,Pk)w
Sk
,
Ck =



arbitrary, k = 0,
AkSk
Ak−1Sk−1
, k > 0.
Hereαk is the leading coefﬁcient ofPk andSk is deﬁned as
Sk = (Pk,Pk)w.
Example E.1. Legendre Polynomials{Lk}: the weight function
w(x) ≡ 1.
With this choice of the weight function, starting withL0(x) = 1, one can get
Ak = 2k + 1
k + 1, B k = 0, C k = k
k + 1,
where a normalization is applied for Lk(1) = 1. Thus the Legendre polynomi-
als satisfy the following three-term recurrence relation
Lk+1(x) = (2k + 1)xLk(x) −kLk−1(x)
k + 1 . (E.4)
A few ﬁrst Legendre polynomials are
L0(x) = 1 ,
L1(x) = x,
L2(x) = 3
2
(
x2 − 1
3
)
,
L3(x) = 5
2
(
x3 − 3
5x
)
,
L4(x) = 35
8
(
x4 − 6
7x2 + 3
35
)
.
(E.5)


## Page 385

E.2. Gauss-Type Quadratures 375
Relevant properties are
|Lk(x)| ≤ 1, ∀x ∈ [−1, 1],
Lk(±1) = (±1)k,
|L′
k(x)| ≤ k(k + 1)/2, ∀x ∈ [−1, 1],
L′
k(±1) = (±1)kk(k + 1)/2,
(Lk,Lk)w=1 = (k + 1/2)−1.
(E.6)
Example E.2. Chebyshev Polynomials{Tk}: the weight function
w(x) := (1 −x2)−1/2.
With this choice of the weight function, one can get the three-term recurrence
relation for the Chebyshev polynomials
Tk+1(x) = 2xTk(x) −Tk−1(x). (E.7)
A few ﬁrst Chebyshev polynomials are
T0(x) = 1 ,
T1(x) = x,
T2(x) = 2 x2 − 1,
T3(x) = 4 x3 − 3x,
T4(x) = 8 x4 − 8x2 + 1.
(E.8)
Relevant properties are
|Tk(x)| ≤ 1, ∀x ∈ [−1, 1],
Tk(±1) = (±1)k,
|T ′
k(x)| ≤ k2, ∀x ∈ [−1, 1],
T ′
k(±1) = (±1)kk2,
(Tk,Tk)w =
{ π, ifk = 0,
π/2, ifk ≥ 1.
(E.9)
E.2. Gauss-Type Quadratures
There are close relations between orthogonal polynomials and Gauss-type in-
tegration quadrature formulas on the interval [−1, 1]. We ﬁrst review the


## Page 386

376 Appendix E. Orthogonal Polynomials and Quadratures
Gauss-type integration formulas.
Theorem E.3. Gauss Integration . Let {x0,x 1, · · ·,xn} be the zeros of the
(n + 1)-th orthogonal polynomial Pn+1. Let {w0,w 1, · · ·,wn} be the solution of
the linear system
n∑
j=0
(xj)iwj =
ˆ 1
−1
xiw(x)dx, i = 0, 1, · · ·,n.
Then, (1). wj > 0,j = 0, 1, · · ·,n , and
ˆ 1
−1
f(x)w(x) =
n∑
j=0
f(xj)wj, ∀f ∈ P2n+1. (E.10)
(2). There is no xj and wj, j = 0, 1, · · ·,n , such that (E.10) holds for all f ∈
P2n+2.
The Gauss integration formula is well known. However, the zeros of Pn+1
are all in the interior of [−1, 1]. Thus, it shows a drawback when a bound-
ary condition is to be imposed. In particular, most ﬁnite element methods
require the continuity of the solution on element boundaries and introduce
nodal points on the boundary. The following Gauss-Lobatto formula is more
useful than the Gauss formula in numerical PDEs.
Theorem E.4. Gauss-Lobatto Integration . Let x0 = −1, xn = 1, and xj,
j = 1, 2, · · ·,n − 1, be the zeros of the ﬁrst-derivative of the n-th orthogonal
polynomial,P ′
n. Let {w0,w 1, · · ·,wn} be the solution of the linear system
n∑
j=0
(xj)iwj =
ˆ 1
−1
xiw(x)dx, i = 0, 1, · · ·,n.
Then, ˆ 1
−1
f(x)w(x) =
n∑
j=0
f(xj)wj, ∀f ∈ P2n−1. (E.11)
For the Legendre polynomials, the explicit formulas for the quadrature
nodes are not known. Thus the nodal points and the corresponding weights
must be computed numerically as zeros of appropriate polynomials and the


## Page 387

E.2. Gauss-Type Quadratures 377
solution of a linear system, respectively. On the other hand, for Chebyshev
series, the points and weights are known explicitly. Here we collect those
formulas and explicit expressions:
Legendre-Gauss:
xj (= zeros ofLn+1), j = 0, 1, · · ·,n,
wj = 2
(1 −x2
j)[L′
n+1(xj)]2, j = 0, 1, · · ·,n. (E.12)
Legendre-Gauss-Lobatto:
x0 = −1, xn = 1; xj (= zeros ofL′
n), j = 1, 2, · · ·,n − 1,
wj = 2
n(n + 1)[Ln(xj)]2, j = 0, 1, · · ·,n. (E.13)
Chebyshev-Gauss:
xj = − cos
((2j + 1)π
2n + 2
)
, w j = π
n + 1, j = 0, 1, · · ·,n. (E.14)
Chebyshev-Gauss-Lobatto:
xj = − cos
(jπ
n
)
, w j =
{ π/(2n), j = 0,n,
π/n, j = 1, · · ·,n − 1. (E.15)
The following shows a few examples for the Legendre-Gauss-Lobatto points
and the corresponding weights on the interval [−1, 1]:
Legendre-Gauss-Lobatto points weights
n = 1 −1 1 1 1
n = 2 −1 0 1 1
3
4
3
1
3
n = 3 −1 −
(1
5
)1/2 (1
5
)1/2
1 1
6
5
6
5
6
1
6
n = 4 −1 −
(3
7
)1/2
0
(3
7
)1/2
1 1
10
49
90
64
90
49
90
1
10
(E.16)


## Page 388

378 Appendix E. Orthogonal Polynomials and Quadratures


## Page 389

Appendix F
Some Mathematical Formulas
F.1. Trigonometric Formulas
The following trigonometric formulas are useful
(a) sin(x +y) = sinx cosy + cosx siny,
(b) cos(x +y) = cosx cosy − sinx siny,
(c) sinx + siny = 2 sin
(x +y
2
)
cos
(x −y
2
)
,
(d) sinx − siny = 2 cos
(x +y
2
)
sin
(x −y
2
)
,
(e) cosx + cosy = 2 cos
(x +y
2
)
cos
(x −y
2
)
,
(f) cosx − cosy = −2 sin
(x +y
2
)
sin
(x −y
2
)
.
(F.1)
By settingx = 2θ andy = 0 in (F.1.e), one also can have
2 sin2θ = 1 − cos(2θ), 2 cos2θ = 1 + cos(2θ). (F.2)
F.2. Vector Identities
Let A, B, C, and D be vectors in R3 andf is scalar. Let
A · B =A1B1 +A2B2 +A3B3
379


## Page 390

380 Appendix F. Some Mathematical Formulas
and
A × B = ( A2B3 −A3B2, A3B1 −A1B3, A1B2 −A2B1)
= det


ˆj1 ˆj2 ˆj3
A1 A2 A3
B1 B2 B3

,
whereˆji is the unit vector in thexi-direction. Then
A · B = |A| |B| cosθ, A × B = |A| |B| sinθˆn,
whereθ is the angle betweenA and B andˆn is the unit normal vector from the
plane containing A and B whose orientation is determined by the right-hand
rule. (When four ﬁngers grab directing from A to B, then the direction of the
thumb determinesˆn.) Let ∇× denote the curl operator deﬁned as
∇ × A =
(∂A3
∂y −∂A2
∂z , ∂A1
∂z −∂A3
∂x , ∂A2
∂x −∂A1
∂y
)
.
Then,
A · (B × C) = B · (C × A) = C · (A × B),
A × (B × C) = (A · C)B − (A · B)C,
(A × B) · (C × D) = (A · C)(B · D) − (A · D)(B · C),
∇(A · B) = A × (∇ × B) + B × (∇ × A) + (A · ∇)B + (B · ∇)A,
∇ · (A × B) = B · (∇ × A) − A · (∇ × B),
∇ × (f A) =f(∇ × A) − A × (∇f),
∇ × (A × B) = (B · ∇)A − (A · ∇)B + A(∇ · B) − B(∇ · A),
∇ · (∇ × A) = 0,
∇ × (∇f) = 0,
∇ × (∇ × A) = ∇(∇ · A) − ∇2A.
(F.3)
Associated with vectors are the following integrals.
Gauss’s divergence theorem:
ˆ
V
∇ · Bdx =
˛
A
B · nds
Stokes’s theorem: ˆ
A
(∇ × B) · nds =
˛
C
B ·dl


## Page 391

Appendix G
Finite Difference Formulas
Here we summarize second- and fourth-order ﬁnite difference formulas. In
the following,h(> 0) is the spatial variable andui =u(x0 +ih).
Central 2nd-order FD schemes:
ux(x0) ≈ u1 −u−1
2h
uxx(x0) ≈ u1 − 2u0 +u−1
h2
uxxx(x0) ≈ u2 − 2u1 + 2u−1 −u−2
2h3
u(4)(x0) ≈ u2 − 4u1 + 6u0 − 4u−1 +u−2
h4
(G.1)
Central 4th-order FD schemes:
ux(x0) ≈ −u2 + 8u1 − 8u−1 +u−2
12h
uxx(x0) ≈ −u2 + 16u1 − 30u0 + 16u−1 −u−2
12h2
uxxx(x0) ≈ −u3 + 8u2 − 13u1 + 13u−1 − 8u−2 +u−3
8h3
u(4)(x0) ≈ −u3 + 12u2 − 39u1 + 56u0 − 39u−1 + 12u−2 −u−3
6h4
(G.2)
381


## Page 392

382 Appendix G. Finite Difference Formulas
One-sided 2nd-order FD schemes:
ux(x0) ≈ ± −3u0 + 4u±1 −u±2
2h
uxx(x0) ≈ 2u0 − 5u±1 + 4u±2 −f±3
h2
uxxx(x0) ≈ ± −5u0 + 18u±1 − 24u±2 + 14f±3 − 3u±4
2h3
u(4)(x0) ≈ 3u0 − 14u±1 + 26u±2 − 24f±3 + 11u±4 − 2u±5
h4
(G.3)


## Page 393

Bibliography
[1] V. A GHOSKOV , Poincaré–Steklov’s operators and domain decomposition
methods in ﬁnite dimensional spaces, in First International Symposium
on Domain Decomposition Method for Partial Differential Equations,
R. Glowinski, G. Golub, G. Meurant, and J. Periaux, eds., SIAM, Philadel-
phia, 1988, pp. 73–112.
[2] W. A MES AND D. L EE, Current development in the numerical treatment
of ocean acoustic propagation, Appl. Numer. Math., 3 (1987), pp. 25–47.
[3] R. B ARRETT , M. B ERRY, T. C HAN, J. D EMMEL , J. D ONATO , J. D ON-
GARRA , V. E IJKHOUT , R. P OZO, C. R OMINE , AND H. VAN DER VORST ,
Templates for the solution of linear systems: Building blocks for iterative
methods, SIAM, Philadelphia, 1994. The postscript ﬁle is free to down-
load from http://www.netlib.org/templates/ along with source
codes.
[4] P. B JORSTAD AND O. W IDLUND , Iterative methods for the solution of el-
liptic problems on regions partitioned into substructures, SIAM J. Numer.
Anal., 23 (1986), pp. 1097–1120.
[5] J.-F. B OURGAT , R. G LOWINSKI , P. L E TALLEC , AND M. V IDRASCU ,
Variational formulation and algorithm for trace operator in domain de-
composition calculations, in Domain Decomposition Methods, T. Chan,
R. Glowinski, J. Periaux, and O. Widlund, eds., SIAM, Philadelphia,
1989, pp. 3–16.
[6] J. B RAMBLE , J. PASCIAK , AND A. S CHATZ , An iterative method for ellip-
tic problems on regions partitioned into substructures, Math. Comput., 46
(1986), pp. 361–369.
383


## Page 394

384 BIBLIOGRAPHY
[7] S. C ANDEL , A review of numerical methods in acoustic wave propagation,
in Recent Advances in Aeroacoustics, A. Krothapalli and C. A. Smith,
eds., Springer-Verlag, New York, 1986, pp. 339–410.
[8] Y. C HA AND S. K IM, Edge-forming methods for color image zooming ,
IEEE Trans. Image Process., 15 (2006), pp. 2315–2323.
[9] R. C LAYTON AND B. E NGQUIST , Absorbing boundary conditions for
acoustic and elastic wave calculations , Bull. Seismol. Soc. Amer., 67
(1977), pp. 1529–1540.
[10] G. C OHEN , P. J OLY, AND N. T ORDJMAN , Construction and analysis of
higher order ﬁnite elements with mass lumping for the wave equation ,
in Second International Conference on Mathematical and Numerical As-
pects of Wave Propagation, R. Kleinman, T. Angell, D. Colton, F. Santosa,
and I. Stakgold, eds., SIAM, Philadelphia, 1993, pp. 152–160.
[11] G. D AHLQUIST , A special stability problem for linear multistep methods,
BIT, 3 (1963), pp. 27–43.
[12] Y. D E ROECK AND P. L E TALLEC , Analysis and test of a local do-
main decomposition preconditioner, in Fourth International Symposium
on Domain Decomposition Method for Partial Differential Equations,
R. Glowinski, G. Meurant, J. Periaux, and O. B. Widlund, eds., SIAM,
Philadelphia, 1991, pp. 112–128.
[13] B. D ESPRÉS , Domain decomposition method and the Helmholtz problem,
in Mathematical and Numerical Aspects of Wave Propagation Phenom-
ena, G. Cohen, L. Halpern, and P. Joly, eds., Philadelphia, 1991, SIAM,
pp. 44–52.
[14] J. D OUGLAS , JR., On the numerical integration of∂2u
∂x2+∂2u
∂y 2 = ∂u
∂t by implicit
methods, J. Soc. Indust. Appl. Math., 3 (1955), pp. 42–65.
[15] J. D OUGLAS , J R. AND J. GUNN, A general formulation of alternating di-
rection methods Part I. Parabolic and hyperbolic problems, Numer. Math.,
6 (1964), pp. 428–453.
[16] J. D OUGLAS , J R. AND S. K IM, Improved accuracy for locally one-
dimensional methods for parabolic equations, Mathematical Models and
Methods in Applied Sciences, 11 (2001), pp. 1563–1579.


## Page 395

BIBLIOGRAPHY 385
[17] J. D OUGLAS , JR., P. PAES LEME , J. ROBERTS , AND J. WANG, A parallel
iterative procedure applicable to the approximate solution of second order
partial differential equations by mixed ﬁnite element methods , Numer.
Math., 65 (1993), pp. 95–108.
[18] J. D OUGLAS , J R. AND D. P EACEMAN , Numerical solution of two-
dimensional heat ﬂow problems , American Institute of Chemical Engi-
neering Journal, 1 (1955), pp. 505–512.
[19] M. D RYJA AND O. W IDLUND , Some recent results on Schwarz type do-
main decomposition algorithms , in Domain Decomposition Methods in
Science and Engineering, A. Quarteroni, J. Periaux, Y. Kuznetsov, and
O. Widlund, eds., vol. 157 of Contemporary Mathematics, Philadelphia,
1994, SIAM, pp. 53–61.
[20] E. D’ YAKONOV , Difference schemes with split operators for multidimen-
sional unsteady problems (English translation) , USSR Comp. Math., 3
(1963), pp. 581–607.
[21] B. E NGQUIST AND A. M AJDA , Absorbing boundary conditions for the nu-
merical simulation of waves, Math. Comp., 31 (1977), pp. 629–651.
[22] B. E NGQUIST AND A. M AJDA , Radiation boundary conditions for acous-
tic and elastic wave calculations , Comm. Pure Appl. Math., 32 (1979),
pp. 314–358.
[23] J. F ERZIGER AND M. P ERIC , Computational methods for ﬂuid dynamics,
2nd Edition, Springer-Verlag, Berlin, Heidelberg, New York, 1999.
[24] R. W. F REUND , Conjugate gradient–type methods for linear systems with
complex symmetric coefﬁcient matrices , SIAM J. Sci. Stat. Comput., 13
(1992), pp. 425–448.
[25] S. G ERSCHGORIN , Über die abgrenzung der eigenwerte einer matrix, Izv.
Akad. Nauk SSSR Ser. Mat., 7 (1931), pp. 746–754.
[26] D. G ILBERG AND N. TRUDINGER , Elliptic Partial Differential Equations
of Second Order, Springer-Verlag, Berlin, Heidelberg, New York, Tokyo,
1983.


## Page 396

386 BIBLIOGRAPHY
[27] B. G USTAFSSON , H.-O. K REISS , AND J. OLIGER , Time Dependent Prob-
lems and Difference Methods, Wiley-Interscience, New York, 1996.
[28] I. H ARARI AND R. DJELLOULI , Analytical study of the effect of wave num-
ber on the performance of local absorbing boundary conditions for acous-
tic scattering, Appl. Numer. Math., 50 (2004), pp. 15–47.
[29] R. L. H IGDON , Absorbing boundary conditions for difference approxima-
tions to the multi-dimensional wave equation , Math. Comp., 47 (1986),
pp. 437–459.
[30] , Numerical absorbing boundary conditions for the wave equation ,
Math. Comp., 49 (1987), pp. 65–90.
[31] F. Q. H U, Absorbing boundary conditions, Int. J. Comput. Fluid Dyn., 18
(2004), pp. 513–522.
[32] C. J OHNSON , Numerical Solutions of Partial Differential Equations by
the Finite Element Method, Cambridge University Press, New York, New
Rochelle, Melbourne, Sydney, 1987.
[33] C. K ELLY, Iterative methods for linear and nonlinear equations , SIAM,
Philadelphia, 1995.
[34] H. K IM, Y. CHA, AND S. K IM, Curvature interpolation method for image
zooming, IEEE Trans. Image Process., 20 (2011), pp. 1895–1903.
[35] S. K IM, GRADE: Graduate Research and Applications for Differential
Equations. The modelcode library is under construction for educa-
tion and research in Industrial and Computational Mathematics, initi-
ated in Spring 1999; the codes are available through internet access to
http://skim.math.msstate.edu/GRADE.
[36] , Numerical treatments for the Helmholtz problem by domain decom-
position technique, Contemporary Mathematics, 180 (1994), pp. 245–250.
[37] , Parallel multidomain iterative algorithms for the Helmholtz wave
equation, Appl. Numer. Math., 17 (1995), pp. 411–429.
[38] , Domain decomposition iterative procedures for solving scalar waves
in the frequency domain, Numer. Math., 79 (1998), pp. 231–259.


## Page 397

BIBLIOGRAPHY 387
[39] , An O(N) level set method for eikonal equations , SIAM J. Sci. Com-
put., 22 (2001), pp. 2178–2193.
[40] S. K IM AND R. C OOK, 3D traveltime computation using second-order
ENO scheme, Geophysics, 64 (1999), pp. 1867–1876.
[41] S. K IM AND SOOHYUN KIM, Multigrid simulation for high-frequency so-
lutions of the Helmholtz problem in heterogeneous media , SIAM J. Sci.
Comput., 24 (2002), pp. 684–701.
[42] S. K IM AND M. LEE, Artiﬁcial damping techniques for scalar waves in the
frequency domain, Computers Math. Applic., 31, No. 8 (1996), pp. 1–12.
[43] S. K IM, C. S HIN, AND J. K ELLER , High-frequency asymptotics for the
numerical solution of the Helmholtz equation , Appl. Math. Letters, 18
(2005), pp. 797–804.
[44] S. K IM AND W. S YMES , Multigrid domain decomposition methods for
the Helmholtz problem, in Mathematical and Numerical Aspects of Wave
Propagation, J. A. DeSanto, ed., SIAM, Philadelphia, 1998, pp. 617–619.
[45] P. L E TALLEC , Domain decomposition methods in computational me-
chanics, Comput. Mech. Advances, 1 (1994), pp. 121–220.
[46] H. L IM, S. K IM, AND J. D OUGLAS , J R., Numerical methods for viscous
and nonviscous wave equations, Appl. Numer. Math., 57 (2007), pp. 194–
212.
[47] P. L IONS , On the Schwarz alternating method I , in First International
Symposium on Domain Decomposition Method for Partial Differential
Equations, R. Glowinski, G. Golub, G. Meurant, and J. Periaux, eds.,
Philadelphia, PA, 1988, SIAM, pp. 1–42.
[48] , On the Schwarz alternating method III: a variant for nonoverlap-
ping subdomains, in Domain Decomposition Methods for Partial Differ-
ential Equations, T. Chan, R. Glowinski, J. Periaux, and O. Widlund, eds.,
Philadelphia, PA, 1990, SIAM, pp. 202–223.
[49] F. M AGOULÈS , F.-X. R OUX , AND L. S ERIES , Algebraic way to derive
absorbing boundary conditions for the Helmholtz equation , J. Comput.
Acoust., 13 (2005), pp. 433–454.


## Page 398

388 BIBLIOGRAPHY
[50] J. M ANDEL , Two-level domain decomposition preconditioning for the p-
version ﬁnite element method in three dimensions, Int. J. Numer. Methods
Engrg., 29 (1990), pp. 1095–1108.
[51] G. M ARCHUK , Methods of numerical mathematics, Springer-Verlag, New
York, Heidelberg, and Berlin, 1982.
[52] L. M ARINI AND A. Q UARTERONI , A relaxation procedure for domain
decomposition methods using ﬁnite elements , Numer. Math., 55 (1989),
pp. 575–598.
[53] L. M CINNES , R. S USAN -RESIGA , D. K EYES , AND H. A TASSI , Additive
Schwarz methods with nonreﬂecting boundary conditions for the paral-
lel computation of Helmholtz problems, in Domain Decomposition Meth-
ods 10, J. Mandel, C. Farhat, and X.-C. Cai, eds., vol. 218 of Contempo-
rary Mathematics, Providence, RI, 1998, American Mathematical Soci-
ety, pp. 325–333. Proceedings of the Tenth International Conference on
Domain Decomposition Methods, August 10-14, 1997, Boulder, CO.
[54] R. M EYER , Introduction to mathematical ﬂuid dynamics , Dover Publica-
tions, Inc., New York, 1982.
[55] A. O STROWSKI , On the linear iteration procedures for symmetric matri-
ces, Rend. Mat. e Appl., 14 (1954), pp. 140–163.
[56] D. P EACEMAN AND H. R ACHFORD , The numerical solution of parabolic
and elliptic differential equations , J. Soc. Indust. Appl. Math., 3 (1955),
pp. 28–41.
[57] A. Q UARTERONI AND A. VALLI , Domain Decomposition Methods for Par-
tial Differential Equations, Oxford University Press, Oxford, New York,
1999.
[58] L. R UDIN , S. O SHER , AND E. F ATEMI , Nonlinear total variation based
noise removal algorithms, Physica D, 60 (1992), pp. 259–268.
[59] Y. S AAD AND M. S CHULTZ , GMRES: A generalized minimal residual al-
gorithm for solving nonsymmetric linear systems, SIAM J. Sci. Stat. Com-
put., 7 (1986), pp. 856–869.


## Page 399

BIBLIOGRAPHY 389
[60] H. S CHWARZ , Ueber einige abbildungsaufgaben, J. Reine Angew. Math.,
70 (1869), pp. 105–120.
[61] A. S EI AND W. S YMES , Dispersion analysis of numerical wave propa-
gation and its computational consequences , J. Sci. Comput., 10 (1995),
pp. 1–27.
[62] P. S TEIN AND R. R OSENBERG , On the solution of linear simultaneous
equations by iteration, J. London Math. Soc., 23 (1948), pp. 111–118.
[63] H. S TONE , Iterative solution of implicit approximations of multidimen-
sional partial differential equations , SIAM J. Numer. Anal., 5 (1968),
pp. 530–558.
[64] J. C. S TRIKWERDA , Finite Difference Schemes and Partial Differential
Equations, Wadsworth & Brooks/Cole, Paciﬁc Grove, California, 1989.
[65] O. T AUSSKY , Bounds for characteristic roots of matrices, Duke Math. J.,
15 (1948), pp. 1043–1044.
[66] O. V ACUS , Mathematical analysis of absorbing boundary conditions for
the wave equation: the corner problem, Math. Comp., 74 (2005), pp. 177–
200.
[67] R. V ARGA , Matrix Iterative Analysis , Prentice-Hall, Englewood Cliffs,
NJ, 1962.
[68] , Matrix Iterative Analysis, 2nd Ed., Springer-Verlag, Berlin, Heidel-
berg, 2000.
[69] S. W HITAKER , Introduction to ﬂuid mechanics , R.E. Krieger Publishing
Company, Malabar, Florida, 1968.
[70] O. W IDLUND , Optimal iterative reﬁnement methods, in Domain Decom-
position Methods, T. Chan, R. Glowinski, J. Periaux, and O. Widlund,
eds., SIAM, Philadelphia, 1989, pp. 114–125.
[71] N. Y ANENKO , Convergence of the method of splitting for the heat con-
duction equations with variable coefﬁcients (English translation) , USSR
Comp. Math., 3 (1963), pp. 1094–1100.


## Page 400

390 BIBLIOGRAPHY
[72] , The method of fractional steps, Springer-Verlag, Berlin, Heidelberg,
and New York, 1971. (English translation; originally published in Rus-
sian, 1967).


## Page 401

Index
L1-contraction, 256
θ-method, 82, 309
l1-contracting method, 256
absorbing boundary condition, 341
abstract variational problem, 200
accuracy, 224
accuracy order, 85
acoustic wave equation, 340
Adams-Bashforth method, 51
Adams-Bashforth-Moulton method, 51
Adams-Moulton method, 51
adaptive methods, 46
additive Schwarz method, 273
ADI method, 314
ADI-II, 329
advection form, 245
afﬁne mapping, 190
alternating direction implicit method, 314
ampliﬁcation factor, 73
average slope, 40
backward difference operator, 9
backward Euler method, 83, 303
banded matrix, 114
bandwidth, 114
Beam-Warming scheme, 243
Black-Scholes differential equation, 20
boundedness, 77
Burgers’s equation, 245
cardinal functions, 4, 170
Cauchy problem, 227
Cauchy-Schwarz inequality, 173, 202
cell Peclet number, 79
cell-centered FDM, 197
central difference operator, 10
CFL condition, 223
CG method, 135
characteristic equation, 24
characteristic function, 194
characteristics, 234
Chebyshev polynomials, 375
Chebyshev-Gauss formula, 377
Chebyshev-Gauss-Lobatto formula, 377
Clayton-Engquist ABC, 340
coarse subspace correction, 274
coercivity, 202
collocation method, 159
column-wise point ordering, 130
condition number, 134, 275
conjugate gradient method, 135
conormal ﬂux, 198
conservation, 80, 97
conservation form, 245
conservation laws, 227
conservation of mass, 350
conservation of momentum, 351
conservation principles, 349
conservative method, 245
consistency, 60, 100, 215, 249
continuity equation, 351
control mass, 349
control volume, 194, 197, 349
control volume equation, 350
convection-diffusion equation, 356
convergence, 63, 217
coordinate change, 365
Courant number, 78, 250
Courant-Friedrichs-Lewy condition, 223
Crank-Nicolson method, 83, 303, 313
391


## Page 402

392 INDEX
Crank-Nicolson scheme, 225
curl, 380
curve ﬁtting, 2, 3
curve ﬁtting approach, 13
cylindrical coordinates, 366
diagonal dominance, 121, 152
difference equation, 24
differential form, 230
differential problem, 154
directed graph, 118
Dirichlet-Neumann method, 284
discrete ﬁve-point Laplacian, 99, 105, 129
discrete maximum principle, 101, 363
discrete minimum principle, 363
dispersion, 240
dispersion analysis, 240
dispersion relation, 240
dispersive equation, 240
divergence theorem, 180, 351, 380
divided differences, 5
dual problem, 177
duality argument, 177
eigenvalue locus theorem, 120
eigenvalue problem, 151
eikonal equation, 341
Einstein convention, 351
element stiffness matrix, 188
elliptic equation, 18
energy method, 70, 90
error analysis, 89
error equation, 64
error estimate for FEM, 174
essential boundary condition, 192
Euler equations, 227
Euler method, 34, 35
Euler’s equation, 354
explicit scheme, 59
explicit schemes, 214
extensive property, 349
FD schemes, central 2nd-order, 381
FD schemes, central 4th-order, 381
FD schemes, one-sided 2nd-order, 382
Fick’s law, 356
ﬁnite difference formulas, 381
ﬁnite difference method, 57, 92, 213
ﬁnite element method, 154
ﬁnite volume method, 193
ﬁrst-order ABC, 340
ﬂuid mechanics, 19
ﬂux conservation error, 288
ﬂux function, 227
forward difference operator, 9
forward Euler method, 59, 82, 303
forward-backward difference matching, 291
Fourier transform, 341, 359
Fourier’s law, 356
fourth-order Runge-Kutta method, 44
fractional-step method, 314
frequency, 240
fundamental period of the motion, 47
Galerkin method, 159, 163
Gauss elimination, 111
Gauss integration, 376
Gauss-Lobatto integration, 376
Gauss-Lobatto points, 170
Gauss-Seidel method, 123, 125
generalized solution, 236
generic transport equation, 355
ghost grid value, 94
ghost value, 344
Gibbs notation, 353
global error, 45
global point index, 106
Godunov theorem, 259
Godunov’s method, 250
gradient, 133
Green’s formula, 181
group marching method, 341
group velocity, 241
Hr(Ω)-norm, 172
Hs(R2)-norm, 360
harmonic average, 199
harmonic extension, 279
harmonic function, 361
heat equation, 16
Hessian, 133


## Page 403

INDEX 393
Heun’s method, 43
high-order Galerkin methods, 203, 347
higher-order FEMs, 162
Higher-order Taylor methods, 37
Hilbert space, 172
hyperbolic, 227
hyperbolic equation, 18
ILU, 140
image denoising, 21
image processing, 21
incomplete LU-factorization, 140
initial value problem, 31, 33
integral form, 228
integration by parts, 155
intensive property, 350
interior regularity estimate, 361
interpolation error theorem, 7
interpolation estimate, 175
irreducible matrix, 117
isothermal equations, 233
isothermal ﬂow, 233
Jacobi method, 123, 124
Jacobian, 190
kinematic viscosity coefﬁcient, 353
Krylov subspace method, 132
L2-norm, 172
Lagrange interpolating polynomial, 4
Lax-Friedrichs scheme, 214, 248
Lax-Milgram Lemma, 200
Lax-Milgram lemma, 158
Lax-Richtmyer Equivalence Theorem, 70,
222
Lax-Wendroff scheme, 239
leapfrog scheme, 214
least-square approach, 159
Legendre polynomials, 374
Legendre-Gauss formula, 377
Legendre-Gauss-Lobatto formula, 377
line relaxation methods, 129
line SOR method, 151
linear FEM, 161
linear Galerkin method, 164
linear iterative method, 115
linear space, 154
Lipschitz condition, 36
Lipschitz continuity, 249
local truncation error, 45
locally one-dimensional method, 314
LOD method, 314
LU factorization, 110
M-matrix, 122
m-step method, 50
mass conservation, 350
material derivative, 350
matrix splitting, 329
maximum principle, 77, 87, 101, 152, 306,
362, 363
mean value theorems, 361
mesh points, 33
minimization problem, 156
minimum principle, 362, 363
mixed derivatives, 98
modiﬁed equation, 239
modiﬁed Euler method, 43
momentum conservation, 351
momentum conservation equation, 351
monotone method, 258
monotonicity preserving method, 255
multi-step methods, 50
multiplicative Schwarz method, 270
natural boundary condition, 192
Navier-Stokes (NS) equations, 19
Navier-Stokes equations, 352
Neumann-Neumann method, 286
Newton polynomial, 5
Newtonian ﬂuid, 351
nodal point, 118, 169
non-dimensionalization, 354
nonlinear stability, 251
nonoverlapping DD method, 277
numerical ﬂux function, 246
one-sided 2nd-order FD schemes, 382
optimal step length, 134
order of accuracy, 224
orthogonal polynomials, 373


## Page 404

394 INDEX
outer bordering, 95, 294
overlapping Schwarz method, 269
parabolic equation, 16
Parseval’s identity, 72, 359
partial pivoting, 112
PCG, 139
PCG-ILU0, 321
Peclet number, 79
permutation matrix, 117
Petrov-Galerkin method, 159
phase velocity, 241
pivot, 112
Poincaré inequality, 202, 207
point relaxation method, 129
polar coordinates, 366
polytropic gas, 232
positive deﬁnite, 168
preconditioned CG method, 138, 139
Python code, 144, 203, 260
quadrature, 375
quasilinear elliptic equation, 359
Rayleigh-Ritz method, 159
red-black coloring, 284
reducible matrix, 117
reference element, 189
regular splitting, 122, 140
regularity estimate, 173, 361
relaxation methods, 122, 129
relaxation parameter, 126
Reynolds number, 355
Reynolds’s transport equation, 350
Ricker wavelet, 340
right-hand rule, 380
Robin method, 287
row-wise point ordering, 106
Runge-Kutta methods, 40
Runge-Kutta-Fehlberg method, 46
SAM, 266
Schur complement matrix, 280, 282
Schwarz alternating method, 266
search direction, 132
second-order Runge-Kutta method, 41, 43
semi-implicit method, 83, 303
SIP, 140
SOR method, 123, 126, 151
space-time slice, 57, 213
SPD, 275
speciﬁc heat, 232
spectral radius, 116
spectrum, 116
spherical coordinates, 367
spline, 159
spring-mass system, 47
stability, 27, 69, 220
stability condition, 74
stability theory, 27
state equations, 232
steepest descent method, 133
Steklov-Poincaré interface equation, 280
Steklov-Poincaré operator, 280
step length, 132
step-by-step methods, 32
stiffness matrix, 188
Stokes’s equations, 355
Stokes’s theorem, 380
strain tensor, 352
stress tensor, 351
strong maximum principle, 362
strong minimum principle, 362
strong stability, 27
strongly connected, 152
strongly connected directed graph, 119
strongly hyperbolic, 210
strongly implicit procedure, 140
subharmonic function, 361
successive over-relaxation method, 126
super-convergence, 203
superharmonic function, 361
symmetric positive deﬁnite, 132
symmetric positive deﬁnite matrix, 275
symmetrization, 95
Taylor method of orderm, 38
Taylor series approach, 10
Taylor’s theorem, 2
Taylor-series methods, 33
three-term recurrence relation, 373


## Page 405

INDEX 395
total variation, 252
total variation diminishing method, 254
total variation stability, 252
transmission conditions, 278
traveltime ABC, 341
trial functions, 163
trigonometric formulas, 379
truncation error, 62
TV model, 21
TV-stability, 252
TVD method, 254
unconditional stability, 226
unconditionally stable, 83
unconditionally unstable, 81
upwind scheme, 244, 248
vanishing-viscosity approach, 235
variational formulation, 154
variational problem, 155
vector identities, 379
von Neumann analysis, 70, 72, 222
wave equation, 18
wave number, 240
waveform ABC, 342
weak formulation, 154
weak maximum principle, 362
weak minimum principle, 362
weak solution, 236
weight function, 163
weighted residual approach, 159
well-posed equation, 16
