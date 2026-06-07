# Applied Stochastic Differential Equations

Converted from: `Stochastic Processes\Stochastic Differential Equations.pdf`


## Page 1

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Applied Stochastic Differential Equations
Simo Särkkä and Arno Solin
Applied Stochastic Differential Equations has been
published by Cambridge University Press, in the
IMS T extbooks series. It can be purchased directly
from Cambridge University Press.
Please cite this book as:
Simo Särkkä and Arno Solin (2019). Applied
Stochastic Differential Equations. Cambridge
University Press.
This PDF was compiled:
Friday 3rd May, 2019


## Page 2

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.


## Page 3

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Contents
Preface ix
1 Introduction 1
2 Some Background on Ordinary Differential Equations 4
2.1 What Is an Ordinary Differential Equation? 4
2.2 Solutions of Linear Time-Invariant Differential Equations 6
2.3 Solutions of General Linear Differential Equations 10
2.4 Fourier Transforms 11
2.5 Laplace Transforms 13
2.6 Numerical Solutions of Differential Equations 16
2.7 Picard–Lindelöf Theorem 19
2.8 Exercises 20
3 Pragmatic Introduction to Stochastic Differential Equations 23
3.1 Stochastic Processes in Physics, Engineering, and Other Fields 23
3.2 Differential Equations with Driving White Noise 33
3.3 Heuristic Solutions of Linear SDEs 36
3.4 Heuristic Solutions of Nonlinear SDEs 39
3.5 The Problem of Solution Existence and Uniqueness 40
3.6 Exercises 40
4 Itô Calculus and Stochastic Differential Equations 42
4.1 The Stochastic Integral of Itô 42
4.2 Itô Formula 46
4.3 Explicit Solutions to Linear SDEs 49
4.4 Finding Solutions to Nonlinear SDEs 52
4.5 Existence and Uniqueness of Solutions 54
4.6 Stratonovich Calculus 55
4.7 Exercises 56
v


## Page 4

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
vi Contents
5 Probability Distributions and Statistics of SDEs 59
5.1 Martingale Properties and Generators of SDEs 59
5.2 Fokker–Planck–Kolmogorov Equation 61
5.3 Operator Formulation of the FPK Equation 65
5.4 Markov Properties and Transition Densities of SDEs 67
5.5 Means and Covariances of SDEs 69
5.6 Higher-Order Moments of SDEs 72
5.7 Exercises 73
6 Statistics of Linear Stochastic Differential Equations 77
6.1 Means, Covariances, and Transition Densities of Linear SDEs 77
6.2 Linear Time-Invariant SDEs 80
6.3 Matrix Fraction Decomposition 83
6.4 Covariance Functions of Linear SDEs 87
6.5 Steady-State Solutions of Linear SDEs 90
6.6 Fourier Analysis of LTI SDEs 92
6.7 Exercises 96
7 Useful Theorems and Formulas for SDEs 98
7.1 Lamperti Transform 98
7.2 Constructions of Brownian Motion and the Wiener Measure 100
7.3 Girsanov Theorem 104
7.4 Some Intuition on the Girsanov Theorem 111
7.5 Doob’s h-Transform 113
7.6 Path Integrals 116
7.7 Feynman–Kac Formula 118
7.8 Exercises 124
8 Numerical Simulation of SDEs 126
8.1 Taylor Series of ODEs 126
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs 129
8.3 Weak Approximations of Itô–Taylor Series 137
8.4 Ordinary Runge–Kutta Methods 140
8.5 Strong Stochastic Runge–Kutta Methods 144
8.6 Weak Stochastic Runge–Kutta Methods 151
8.7 Stochastic Verlet Algorithm 155
8.8 Exact Algorithm 157
8.9 Exercises 161
9 Approximation of Nonlinear SDEs 165
9.1 Gaussian Assumed Density Approximations 165
9.2 Linearized Discretizations 174
9.3 Local Linearization Methods of Ozaki and Shoji 175


## Page 5

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Contents vii
9.4 Taylor Series Expansions of Moment Equations 179
9.5 Hermite Expansions of Transition Densities 183
9.6 Discretization of FPK 185
9.7 Simulated Likelihood Methods 192
9.8 Pathwise Series Expansions and the Wong–Zakai Theorem 193
9.9 Exercises 196
10 Filtering and Smoothing Theory 197
10.1 Statistical Inference on SDEs 198
10.2 Batch Trajectory Estimates 203
10.3 Kushner–Stratonovich and Zakai Equations 206
10.4 Linear and Extended Kalman–Bucy Filtering 208
10.5 Continuous-Discrete Bayesian Filtering Equations 211
10.6 Kalman Filtering 216
10.7 Approximate Continuous-Discrete Filtering 219
10.8 Smoothing in Continuous-Discrete and Continuous Time 223
10.9 Approximate Smoothing Algorithms 228
10.10 Exercises 231
11 Parameter Estimation in SDE Models 234
11.1 Overview of Parameter Estimation Methods 234
11.2 Computational Methods for Parameter Estimation 236
11.3 Parameter Estimation in Linear SDE Models 239
11.4 Approximated-Likelihood Methods 243
11.5 Likelihood Methods for Indirectly Observed SDEs 246
11.6 Expectation–Maximization, Variational Bayes, and Other
Methods 248
11.7 Exercises 249
12 Stochastic Differential Equations in Machine Learning 251
12.1 Gaussian Processes 252
12.2 Gaussian Process Regression 254
12.3 Converting between Covariance Functions and SDEs 257
12.4 GP Regression via Kalman Filtering and Smoothing 265
12.5 Spatiotemporal Gaussian Process Models 266
12.6 Gaussian Process Approximation of Drift Functions 268
12.7 SDEs with Gaussian Process Inputs 270
12.8 Gaussian Process Approximation of SDE Solutions 272
12.9 Exercises 274
13 Epilogue 277
13.1 Overview of the Covered Topics 277
13.2 Choice of SDE Solution Method 278


## Page 6

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
viii Contents
13.3 Beyond the Topics 279
References 281
Symbols and Abbreviations 293
List of Examples 305
List of Algorithms 309
Index 311


## Page 7

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Preface
This book is an outgrowth of a set of lecture notes that has been extended
with material from the doctoral theses of both authors and with a large
amount of completely new material. The main motivation for the book is
the application of stochastic differential equations (SDEs) in domains such
as target tracking and medical technology and, in particular, their use in
methodologies such as ﬁltering, smoothing, parameter estimation, and ma-
chine learning. We have also included a wide range of examples of appli-
cations of SDEs arising in physics and electrical engineering.
Because we are motivated by applications, much more emphasis is put
on solution methods than on analysis of the theoretical properties of equa-
tions. From the pedagogical point of view, one goal of this book is to pro-
vide an intuitive hands-on understanding of what SDEs are all about, and if
the reader wishes to learn the formal theory later, she can read, for example,
the brilliant books of Øksendal (2003) and Karatzas and Shreve (1991).
Another pedagogical aim is to overcome a slight disadvantage in many
SDE books (e.g., the aforementioned ones), which is that they lean heavily
on measure theory, rigorous probability theory, and the theory of martin-
gales. There is nothing wrong in these theories – they are very powerful
theories and everyone should indeed master them. However, when these
theories are explicitly used in explaining SDEs, they bring a ﬂurry of tech-
nical details that tend to obscure the basic ideas and intuition for the ﬁrst-
time reader. In this book, without shame, we trade rigor for readability by
treating SDEs completely without measure theory.
The book’s low learning curve only assumes prior knowledge of ordi-
nary differential equations and basic concepts of statistics, together with
understanding of linear algebra, vector calculus, and Bayesian inference.
The book is mainly intended for advanced undergraduate and graduate
students in applied mathematics, signal processing, control engineering,
ix


## Page 8

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
statistics, and computer science. However, the book is suitable also for re-
searchers and practitioners who need a concise introduction to the topic at
a level that enables them to implement or use the methods.
The worked examples and numerical simulation studies in each chapter
illustrate how the theory works in practice and can be implemented for
solving the problems. End-of-chapter exercises include application-driven
derivations and computational assignments. The M ATLAB
R
 source code
for reproducing the example results is available for download through the
book’s web page, promoting hands-on work with the methods.
We have attempted to write the book to be freestanding in the sense
that it can be read without consulting other material on the way. We have
also attempted to give pointers to work that either can be considered as
the original source of an idea or just contains more details on the topic
at hand. However, this book is not a survey, but a textbook, and therefore
we have preferred citations that serve a pedagogical purpose, which might
not always explicitly give credit to all or even the correct inventors of the
technical ideas. Therefore, we need to apologize to any authors who have
not been cited although their work is clearly related to the topics that we
cover. We hope you understand.
The authors would like to thank Aalto University for providing the
chance to write this book. We also would like to thank Robert Piché, Petteri
Piiroinen, Roland Hostettler, Filip Tronarp, Santiago Cortés, Johan Westö,
Joonas Govenius, Ángel García-Fernández, Toni Karvonen, Juha Sarma-
vuori, and Zheng Zhao for providing valuable comments on early versions
of the book.
Simo and Arno


## Page 9

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
1
Introduction
The topic of this book is stochastic differential equations (SDEs). As their
name suggests, they really are differential equations that produce a differ-
ent “answer” or solution trajectory each time they are solved. This peculiar
behaviour gives them properties that are useful in modeling of uncertain-
ties in a wide range of applications, but at the same time it complicates the
rigorous mathematical treatment of SDEs.
The emphasis of the book is on applied rather than theoretical aspects of
SDEs and, therefore, we have chosen to structure the book in a way that we
believe supports learning SDEs from an applied point of view. In the fol-
lowing, we brieﬂy outline the purposes of each of the remaining chapters
and explain how the chapters are connected to each other. In the chapters,
we have attempted to provide a wide selection of examples of the practical
application of theoretical and methodological results. Each chapter (except
for the Introduction and Epilogue) also contains a representative set of an-
alytic and hands-on exercises that can be used for testing and deepening
understanding of the topics.
Chapter 2 is a brief outline of concepts and solutions methods for deter-
ministic ordinary differential equations (ODEs). We especially emphasize
solution methods for linear ODEs, because the methods translate quite eas-
ily to SDEs. We also examine commonly used numerical methods such as
the Euler method and Runge–Kutta methods, which we extend to SDEs in
the later chapters.
Chapter 3 starts with a number of motivating examples of SDEs found
in physics, engineering, ﬁnance, and other applications. It turns out that in
a modeling sense, SDEs can be regarded as noise-driven ODEs, but this
notion should not be taken too far. The aim of the rest of the chapter is to
show where things start to go wrong. Roughly speaking, with linear SDEs
we are quite safe with this kind of thinking, but anything beyond them will
not work.
1


## Page 10

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2 Introduction
In Chapter 4, we reformulate SDEs properly as stochastic integral equa-
tions where one of the terms contains a new kind of integral called the Itô
integral. We then derive the change of variable formula, that is, the Itô for-
mula for the integral, and use it to ﬁnd complete solutions to linear SDEs.
We also discuss some methods to solve nonlinear SDEs and look brieﬂy at
Stratonovich integrals.
The aim of Chapter 5 is to analyze the statistics of SDEs as stochas-
tic processes. We discuss and derive their generators, the Fokker–Planck–
Kolmogorov equations, as well as Markov properties and transition densi-
ties of SDEs. We also derive the formal equations of the moments, such as
the mean and covariance, for the SDE solutions. It turns out, however, that
these equations cannot easily be solved for other than linear SDEs. This
challenge will be tackled later in the numerical methods chapters.
As linear SDEs are very important in applications, we have dedicated
Chapter 6 to solution methods for their statistics. Although explicit solu-
tions to linear SDEs and general moment equations for SDEs were already
given in Chapters 4 and 5, here we also discuss and derive explicit mean
and covariance equations, transition densities, and matrix fraction methods
for the numerical treatment of linear SDEs. We also discuss steady-state
solutions and Fourier analysis of linear time-invariant (LTI) SDEs as well
as temporal covariance functions of general linear SDEs.
In Chapter 7, we discuss some useful theorems, formulas, and results
that are typically required in more advanced analysis of SDEs as well as
in their numerical methods. In addition to the Lamperti transform, Gir-
sanov theorem, and Doob’s h-transform, we also show how to ﬁnd so-
lutions to partial differential equations with Feynman–Kac formulas and
discuss some connections to path integrals in physics. This chapter is not
strictly necessary for understanding the rest of the chapters and can be
skipped during a ﬁrst reading.
Although the Itô stochastic calculus that is derivable from the Itô for-
mula is theoretically enough for deﬁning SDEs, it does not help much in
practical solution of nonlinear SDEs. In Chapter 8, we present numerical
simulation-based solution methods for SDEs. The methods are based pri-
marily on Itô–Taylor series and stochastic Runge–Kutta methods, but we
also discuss the Verlet and exact algorithm methods.
In many applications we are interested in the statistics of SDEs rather
than their trajectories per se. In Chapter 9, we develop methods for ap-
proximate computation of statistics such as means and covariances or prob-
ability densities of SDEs – however, many of the methods are suitable for


## Page 11

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Introduction 3
numerical simulation of SDEs as well. We start with classical and mod-
ern Gaussian “assumed density” approximations and then proceed to other
linearization methods. We also discuss Taylor and Hermite series approx-
imations of transition densities and their moments, numerical solutions of
Fokker–Planck–Kolmogorov equations, simulation-based approximations,
and ﬁnally pathwise Wong–Zakai approximations of SDEs.
An important and historically one of the ﬁrst applications of SDEs is
the ﬁltering and smoothing theory. In Chapter 10, we describe the basic
ideas of ﬁltering and smoothing and then proceed to the classical Kushner–
Stratonovich and Zakai equations. We also present the linear and nonlin-
ear Kalman–Bucy and Kalman ﬁlters and discuss their modern variants.
Finally, we present formal equations and approximation methods for the
corresponding smoothing problems.
The aim of Chapter 11 is to give an overview of parameter estimation
methods for SDEs. The emphasis is on statistical likelihood-based methods
that aim at computing maximum likelihood (ML) or maximum a posteriori
(MAP) estimates or are targeted to full Bayesian inference on the parame-
ters. We start with brief descriptions of the ideas of ML and MAP estimates
as well as Markov chain Monte Carlo (MCMC) methods. Parameter esti-
mation in linear SDEs is then discussed, and ﬁnally we give approximate
likelihood methods for parameter estimation in nonlinear SDEs. We also
discuss some parameter estimation methods for indirectly observed SDEs.
Chapter 12 addresses the somewhat less traditional topic of connections
between machine learning and SDEs. The aim is to discuss links between
Gaussian process regression, Kalman ﬁltering, and SDEs, along with appli-
cations of the methods across the ﬁelds of signal processing and machine
learning.
Finally, Chapter 13 concludes the book with an overview and gives
some hints where to go next. We also discuss additional topics such as
fractional Brownian motions, Lévy process driven SDEs, and stochastic
control problems.


## Page 12

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2
Some Background on Ordinary Differential
Equations
The chapter provides background on deterministic (nonstochastic) ordi-
nary differential equations (ODEs) from points of view especially suited
to the context of stochastic differential equations (SDEs). As SDEs are in-
herently inhomogeneous differential equations (i.e., they have an input),
we will concentrate on solution methods suitable for them. Furthermore,
as linear and especially linear time-invariant (LTI) ODE systems are im-
portant in applications, we review the matrix exponential– and transition
matrix–based methods of solution. We also discuss Fourier– and Laplace
transform–based solution methods for LTI ODEs and for computing matrix
exponentials. For more details on ODE methods and theory, the reader is
referred to the books of Kreyszig (1993), Tenenbaum and Pollard (1985),
and Hairer et al. (2008), although the same information can be found in
many other books as well.
2.1 What Is an Ordinary Differential Equation?
An ODE is an equation in which the unknown quantity is a function, and
the equation involves derivatives of the unknown function. For example,
the second-order differential equation for a forced spring–mass system (or,
e.g., a resonator circuit in telecommunications) can be generally expressed
as
d2x.t/
dt2 C
 dx.t/
dt C2x.t/Dw.t/; (2.1)
where and
 are constants that determine the resonant angular velocity
and damping of the spring. The force w.t/ is some given function that
may or may not depend on time. In this equation, the position variablex is
called the dependent variable and timet is the independent variable. The
equation is of second order, because it contains the second derivative and
no higher-order terms are present. It islinear, becausex.t/ appears linearly
4


## Page 13

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.1 What Is an Ordinary Differential Equation? 5
in the equation. The equation is inhomogeneous, because it contains the
forcing termw.t/ . This inhomogeneous term will become essential in later
chapters, because replacing it with a random process leads to a stochastic
differential equation.
Here a solution to the differential equation is deﬁned as a particular
solution, a function that satisﬁes the equation and does not contain any ar-
bitrary constants. A general solution on the other hand contains every par-
ticular solution of the equation parameterized by some free constants. To
actually solve the differential equation, it is necessary to tie down the gen-
eral solution by some initial conditions. In the preceding case, this means
that we need to know the spring–mass positionx.t/ and velocity dx.t/=dt
at some ﬁxed initial timetDt0. Given these initial values, there is a unique
solution to the equation (provided that w.t/ is continuous). Instead of ini-
tial conditions, we could also ﬁx some other (boundary) conditions of the
differential equation to get a unique solution, but here we only consider
differential equations with given initial conditions.
Note that it is common not to write the dependencies of x andw ont
explicitly, and write the equation as
d2x
dt2C
 dx
dt C2xDw: (2.2)
Although it sometimes is misleading, this “ink saving” notation is very
commonly used, and we will also employ it here whenever there is no risk
of confusion. Furthermore, because in this section and in this whole book
we mainly consider ordinary differential equations, we often drop the word
“ordinary” and just talk about differential equations.
Time derivatives are also sometimes denoted with dots over the variable,
such asPxD dx=dt ,RxD d2x
ı
dt2 and so on. In this Newtonian notation,
the previous differential equation would be written as
RxC
PxC2xDw: (2.3)
Differential equations of an arbitrary order n can (almost) always be
converted into vector differential equations of order one. For example,
in the preceding spring model, if we deﬁne a state variable x.t/ D
.x1.t/;x 2.t// D .x.t/; dx.t/=dt/ , we can rewrite the previous differen-
tial equation as a ﬁrst-order vector differential equation:
dx1.t/= dt
dx2.t/= dt

„ ƒ‚ …
dx.t/=dt
D
 0 1
2
 x1.t/
x2.t/

„ ƒ‚ …
f.x.t//
C
0
1

„ƒ‚…
L
w.t/: (2.4)


## Page 14

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6 Some Background on Ordinary Differential Equations
The preceding equation can be seen to be a special case of models of the
form
dx.t/
dt D f.x.t/;t/ C L.x.t/;t/ w.t/; (2.5)
where the vector-valued function x.t/2 RD is generally called the state
of the system, f.;/ and L.;/ are arbitrary functions, and w.t/2 RS
is some (vector-valued) forcing function, driving function, or input to the
system. Note that we can absorb the second term on the right into the ﬁrst
term to yield
dx.t/
dt D f.x.t/;t/; (2.6)
and in that sense Equation (2.5) is slightly redundant. However, the
form (2.5) turns out to be useful in the context of stochastic differential
equations, and thus it is useful to consider it explicitly.
The ﬁrst-order vector differential equation representation of annth-order
differential equation is often called the state-space form of the differential
equation. Becausenth order differential equations can (almost) always be
converted into equivalentn-dimensional vector-valued ﬁrst-order differen-
tial equations, it is convenient to just consider such ﬁrst-order equations
instead of considering nth-order equations explicitly. Thus in this book,
we develop the theory and solution methods (mainly) for ﬁrst-order vector
differential equations and assume thatnth-order equations are always ﬁrst
converted into equations of this class.
The spring–mass model in Equation (2.4) is also a special case oflinear
differential equations of the form
dx.t/
dt D F.t/ x.t/C L.t/ w.t/; (2.7)
which is a very useful class of differential equations often arising in ap-
plications. The usefulness of linear equations is that we can actually solve
these equations, unlike general nonlinear differential equations. This kind
of equations will be analyzed in the next sections.
2.2 Solutions of Linear Time-Invariant Differential Equations
Consider the following scalar linear homogeneous differential equation
with a ﬁxed initial condition attD0:
dx
dt DF x; x.0/ D given; (2.8)


## Page 15

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.2 Solutions of Linear Time-Invariant Differential Equations 7
whereF is a constant. This equation can now be solved, for example, via
separation of variables, which in this case means that we formally multiply
by dt and divide byx to yield
dx
x DF dt: (2.9)
If we now integrate the left-hand side fromx.0/ tox.t/ and right-hand side
from0 tot, we get
logx.t/ logx.0/DF t; (2.10)
which can be solved forx.t/ to give the ﬁnal solution:
x.t/D exp.F t/x.0/: (2.11)
Another way of arriving at the same solution is by integrating both sides
of the original differential equation from 0 tot. Because
Rt
0 dx=dt dt D
x.t/x.0/, we can express the solutionx.t/ as
x.t/Dx.0/C
Z t
0
F x./d: (2.12)
We can now substitute the right-hand side of the equation for x./ inside
the integral, which gives
x.t/Dx.0/C
Z t
0
F

x.0/C
Z 
0
F x.0/ d0

d
Dx.0/CF x.0/
Z t
0
dC
Z t
0
Z 
0
F2x.0/ d0

d
Dx.0/CF x.0/tC
Z t
0
Z 
0
F2x.0/ d0 d: (2.13)
Doing the same substitution forx.0/ inside the last integral further yields
x.t/Dx.0/CF x.0/tC
Z t
0
Z 
0
F2
"
x.0/C
Z 0
0
F x.00/ d00
#
d0 d
Dx.0/CF x.0/tCF2x.0/
Z t
0
Z 
0
d0 d
C
Z t
0
Z 
0
Z 0
0
F3x.00/ d00 d0 d
Dx.0/CF x.0/tCF2x.0/t2
2C
Z t
0
Z 
0
Z 0
0
F3x.00/ d00 d0 d:
(2.14)


## Page 16

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8 Some Background on Ordinary Differential Equations
It is easy to see that repeating this procedure yields the solution of the form
x.t/Dx.0/CF x.0/tCF2x.0/t2
2CF3x.0/t3
6C
D

1CF tCF2t2
2Š CF3t3
3Š C

x.0/: (2.15)
The series in the parentheses can be recognized to be the Taylor series for
exp.F t/. Thus, provided that the series actually converges (it does), we
again arrive at the solution
x.t/D exp.F t/x.0/: (2.16)
The multidimensional generalization of the homogeneous linear differen-
tial equation (2.8) is an equation of the form
dx
dt D F x; x.0/D given; (2.17)
where F is a constant (i.e., time-independent) matrix. For this multidimen-
sional equation, we cannot use the separation of variables method, because
it only works for scalar equations. However, the series-based approach
works and yields a solution of the form
x.t/D

IC FtC F2t2
2Š C F3t3
3Š C

x.0/: (2.18)
The series in the parentheses can now be seen as a matrix generalization of
the exponential function. This series indeed is the deﬁnition of the matrix
exponential
exp.Ft/D IC FtC F2t2
2Š C F3t3
3Š C (2.19)
and thus the solution to Equation (2.17) can be written as
x.t/D exp.Ft/ x.0/: (2.20)
Note that the matrix exponential cannot be computed by computing scalar
exponentials of the individual elements in matrixFt. It is a completely dif-
ferent function. Sometimes the matrix exponential is written as expm.Ft/
to distinguish it from the elementwise computation, but here we use the
common convention to simply write it as exp.Ft/. The matrix exponential
function can be found as a built-in function in most commercial and open-
source mathematical software packages such as MATLAB
R
and Python. In
addition to this kind of numerical solution, the exponential can be evaluated


## Page 17

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.2 Solutions of Linear Time-Invariant Differential Equations 9
analytically, for example, by directly using the Taylor series expansion, by
using the Laplace or Fourier transform, or via the Cayley–Hamilton theo-
rem (Åström and Wittenmark, 1997).
Example 2.1 (Matrix exponential). To illustrate the difference between the
matrix exponential and the elementwise exponential, consider the equation
d2x
dt2 D0; x.0/ D given; . dx=dt/.0/D given; (2.21)
which in state-space form can be written as
dx
dt D
0 1
0 0

„ ƒ‚ …
F
x; x.0/D given; (2.22)
where xD.x; dx=dt/. Because FnD 0 forn>1 , the matrix exponential
is simply
exp.Ft/D IC FtD
1 t
0 1

(2.23)
which is completely different from the elementwise matrix exponential:
1 t
0 1

¤
exp.0/ exp.t/
exp.0/ exp.0/

D
1 e t
1 1

: (2.24)
Let us now consider the following linear differential equation with an
inhomogeneous term on the right-hand side:
dx.t/
dt D F x.t/C L w.t/; (2.25)
where x.t0/ is given and the matrices F and L are constant. For inhomo-
geneous equations, the solution methods are numerous, especially if we do
not want to restrict ourselves to speciﬁc kinds of forcing functions w.t/.
However, the following integrating factor method can be used for solving
general inhomogeneous equations.
If we move the term F x.t/ in Equation (2.25) to the left-hand side and
multiply with a term called integrating factor exp .Ft/, we get the fol-
lowing result:
exp.Ft/ dx.t/
dt  exp.Ft/ F x.t/D exp.Ft/ L w.t/: (2.26)
From the deﬁnition of the matrix exponential, we can derive the following
property:
d
dt Œexp.Ft/D exp.Ft/ F: (2.27)


## Page 18

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10 Some Background on Ordinary Differential Equations
The key thing is now to observe that
d
dt Œexp.Ft/ x.t/D exp.Ft/ dx.t/
dt  exp.Ft/ F x.t/; (2.28)
which is exactly the left-hand side of Equation (2.26). Thus we can rewrite
the equation as
d
dt Œexp.Ft/ x.t/D exp.Ft/ L w.t/: (2.29)
Integrating fromt0 tot then gives
exp.Ft/ x.t/ exp.Ft0/ x.t0/D
Z t
t0
exp.F/ L w./ d; (2.30)
which can be further rearranged to give the ﬁnal solution
x.t/D exp.F.tt0// x.t0/C
Z t
t0
exp.F.t// L w./ d: (2.31)
In the preceding solution, we have also used the identity
exp.Fs/ exp.Ft/ D exp.F.sC t//, which is true because the ma-
trices Fs and Ft commute. The expression (2.31) is the complete solution
to Equation (2.25).
2.3 Solutions of General Linear Differential Equations
In this section, we consider solutions to more general, time-varying linear
differential equations. The corresponding stochastic equations are a useful
class of equations, because they can be solved in (semi)closed form quite
analogously to the deterministic case considered in this section.
The solution presented in the previous section in terms of matrix expo-
nential only works if the matrix F is constant. Thus for the time-varying
homogeneous equation of the form
dx
dt D F.t/ x; x.t0/D given; (2.32)
the matrix exponential solution does not work. However, we can express
the solution in the form
x.t/D‰.t;t0/ x.t0/; (2.33)


## Page 19

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.4 Fourier Transforms 11
where‰.t;t0/ is the transition matrix which is deﬁned via the properties
@‰.;t/
@ D F./‰.;t/;
@‰.;t/
@t D‰.;t/ F.t/;
‰.;t/ D‰.;s/ ‰.s;t/;
‰.t;/ D‰1.;t/;
‰.t;t/ D I:
(2.34)
The transition matrix ‰.t;t0/ does not have a closed-form expression in
general. Nevertheless, given the transition matrix we can construct the so-
lution to the inhomogeneous equation
dx
dt D F.t/ xC L.t/ w.t/; x.t0/D given; (2.35)
analogously to the time-invariant case. This time the integrating factor is
‰.t0;t/ , and the resulting solution is
x.t/D‰.t;t0/ x.t0/C
Z t
t0
‰.t;/ L./ w./ d: (2.36)
2.4 Fourier Transforms
One very useful method to solve inhomogeneous linear time-invariant dif-
ferential equations is the Fourier transform. The Fourier transform of a
functiong.t/ is deﬁned as
G.i!/D FŒg.t/D
Z 1
1
g.t/ exp.i!t/ dt; (2.37)
where i is the imaginary unit. The correspondinginverse Fourier transform
is
g.t/D F1ŒG.i!/D 1
2
Z 1
1
G.i!/ exp.i!t/ d!: (2.38)
Multidimensional transforms are performed componentwise. Note that
there exist many conventions for writing the Fourier transform, but this pa-
rameterization will be used throughout in this book. The usefulness of the
Fourier transform for solving differential equations arises from the prop-
erty that for a nonnegative integern we have
FŒdng.t/=dtnD.i!/n FŒg.t/; (2.39)


## Page 20

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12 Some Background on Ordinary Differential Equations
which transforms differentiation into multiplication by i !. Furthermore,
the convolution theorem says that convolution gets transformed into multi-
plication,
FŒg.t/h.t/D FŒg.t/ FŒh.t/; (2.40)
where the convolution is deﬁned as
g.t/h.t/D
Z 1
1
g.t/h./ d: (2.41)
To apply the preceding properties to solving ODEs, it is required that the
initial conditions are zero. However, this is not a restriction in practice,
because it is possible to tweak the inhomogeneous term such that its effect
is equivalent to the given initial conditions.
Example 2.2 (Fourier transform solution to spring model). To demonstrate
the usefulness of Fourier transform, we consider the spring model
d2x.t/
dt2 C
 dx.t/
dt C2x.t/Dw.t/: (2.42)
Taking the Fourier transform of the equation and using the derivative rule,
we get
.i!/2X.i!/C
. i!/X. i!/C2X.i!/DW.i!/; (2.43)
whereX.i!/ is the Fourier transform of x.t/ , and W.i!/ is the Fourier
transform ofw.t/ . We can now solve forX.i!/, which gives
X.i!/D W.i!/
.i!/2C
. i!/C2: (2.44)
The solution to the equation is then given by the inverse Fourier transform
x.t/D F1
 W.i!/
.i!/2C
. i!/C2

: (2.45)
However, for generalw.t/ , it is useful to note that the term on the right-
hand side is actually a product of the (Fourier domain) transfer function
H.i!/D 1
.i!/2C
. i!/C2 (2.46)
andW.i!/. This product can now be converted into a convolution if we
start by computing the impulse response function
h.t/D F1
 1
.i!/2C
. i!/C2

Db1 exp.at/ sin.bt/u.t/; (2.47)


## Page 21

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.5 Laplace Transforms 13
whereaD
=2,bD
p
2
2=4, andu.t/ is the Heaviside step func-
tion, which is zero fort <0 and one fort0. Then the full solution can
be expressed as
x.t/D
Z 1
1
h.t/w./ d; (2.48)
which can be interpreted such that we constructx.t/ by feeding the signal
w.t/ through a linear system (ﬁlter) with impulse responseh.t/.
We can also use the Fourier transform to solve general linear time-
invariant nonhomogeneous equations
dx.t/
dt D F x.t/C L w.t/: (2.49)
Taking Fourier transforms componentwise gives
.i!/ X.i!/D F X.i!/C L W.i!/: (2.50)
Solving for X.i!/ then gives
X.i!/D..i!/ I F/1 L W.i!/: (2.51)
Comparing to Equation (2.31) and recalling x.0/D 0 now reveals that
actually we have
F1
..i!/ I F/1
D exp.Ft/u.t/; (2.52)
whereu.t/ is the Heaviside step function. This identity also provides one
way to compute matrix exponentials.
Example 2.3 (Matrix exponential via Fourier transform) . The matrix ex-
ponential considered in Example 2.1 can also be computed as
exp
0 1
0 0

t

D F1
".i!/ 0
0 . i!/


0 1
0 0
1#
D
1 t
0 1

:
(2.53)
2.5 Laplace Transforms
Another often encountered method for solving linear time-invariant differ-
ential equations is the Laplace transform (see, e.g., Kreyszig, 1993). The
Laplace transform of a functionf.t/ , deﬁned for allt0, is
F.s/D LŒf.t/ D
Z 1
0
f.t/ exp.st/ dt (2.54)


## Page 22

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
14 Some Background on Ordinary Differential Equations
and the inverse transform isf.t/ D L1ŒF.s/ .
Just as for the Fourier transform, the usefulness of the Laplace transform
comes from its property of reducing several often encountered “hard” dif-
ferential equations into a “simple” subsidiary form that can be solved by
algebraic manipulations. By inverse-transforming the solution of the sub-
sidiary equation, the solution to the original problem can be retrieved.
The Laplace transform also has a similar derivative property as the
Fourier transform (cf. Eq. 2.39), except that we can also take the initial
conditions into account. Ifx.0/D given, then
L
dx.t/
dt

DsX.s/x.0/; (2.55)
whereX.s/D LŒx.t/ . If we apply thisn times, we get
L
dnx.t/
dtn

DsnX.s/sn1x.0/ dxn1
dtn1.0/: (2.56)
The Laplace transform is especially useful with zero initial conditions, and
it leads to a very similar solution method as the Fourier transform.
Example 2.4 (Laplace transform solution to spring model) . We use the
Laplace transform to solve the following differential equation that we al-
ready considered in Example 2.2:
d2x.t/
dt2 C
 dx.t/
dt C2x.t/Dw.t/ (2.57)
with the initial conditions x.0/ D 0, .dx=dt/.0/ D 0. Taking Laplace
transforms of both sides gives
s2X.s/C
sX.s/ C2X.s/DW.s/; (2.58)
whereW.s/ D LŒw.t/ . The solution to the differential equation is given
as
X.s/D
 1
s2C
s C2

W.s/: (2.59)
We can also identify the Laplace domain transfer function as
H.s/D 1
s2C
s C2; (2.60)
and by using the convolution property
LŒh.t/x.t/D LŒh.t/ LŒx.t/ (2.61)


## Page 23

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.5 Laplace Transforms 15
of the Laplace transform, we can write down the solution to the differential
equation as
x.t/Dh.t/w.t/D
Z 1
1
h.t/w./ d; (2.62)
where
h.t/D L1ŒH.s/Db1 exp.at/ sin.bt/u.t/ (2.63)
is exactly the impulse response that we already obtained in Equa-
tion (2.47).
Let us now consider the vector differential equation
dx.t/
dt D F x.t/C L w.t/ (2.64)
with a nonzero initial condition x.0/ ¤ 0. Taking the vector-valued
Laplace transform of the equation and using the derivative property leads
to
s X.s/ x.0/D F X.s/C L W.s/; (2.65)
where W.s/D LŒw.t/. Solving for X.s/ gives
X.s/D.s I F/1 x.0/C.s I F/1 L W.s/; (2.66)
which can be seen to correspond to the solution in Equation (2.31) with
t0D0. We can now see that the matrix exponential has the representation
exp.Ft/D L1
.s I F/1
(2.67)
for t  0. As with the Fourier transform, this expression is sometimes
useful for computing matrix exponentials, as can be seen by the following
example.
Example 2.5 (Matrix exponential via Laplace transform). Consider again
solving the matrix exponential in Example 2.1. We can now compute
.s I F/1D
1=s 1
ı
s2
0 1 =s

; (2.68)
which should be the Laplace transform of the matrix exponential. Recalling
that LŒ1D
R1
0 exp.st/ dt D 1=s and LŒt D
R1
0 t exp.st/ dt D
1
ı
s2 , gives
exp.Ft/D
1 t
0 1

: (2.69)


## Page 24

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
16 Some Background on Ordinary Differential Equations
2.6 Numerical Solutions of Differential Equations
For a generic nonlinear differential equation of the form
dx.t/
dt D f.x.t/;t/; x.t0/D given; (2.70)
there is no general way to ﬁnd an analytic solution. However, it is possible
to approximate the solution numerically.
If we integrate the equation fromt totCt, we get
x.tCt/D x.t/C
Z tCt
t
f.x./;/ d: (2.71)
If we knew how to compute the integral on the right-hand side, we could
generate the solution at time stepst0,t1Dt0Ct,t2Dt0C2t iterating
the preceding equation, which would give a series of solutions:
x.t0Ct/D x.t0/C
Z t0Ct
t0
f.x./;/ d;
x.t0C2t/D x.t0Ct/C
Z tC2t
t0Ct
f.x./;/ d;
x.t0C3t/D x.t0C2t/C
Z tC3t
t0C2t
f.x./;/ d:
:::
(2.72)
It is now possible to derive various numerical methods by constructing
approximations to the integrals on the right-hand side. In the Euler method,
we use the approximation
Z tCt
t
f.x./;/ d f.x.t/;t/t; (2.73)
which leads to the following algorithm.
Algorithm 2.6 (Euler method). Start fromOx.t0/D x.t0/ and divide the
integration intervalŒt0;t intoM stepst0 <t 1 <t 2 <:::<t MDt such
thattDtkC1tk. At each stepk, approximate the solution as follows:
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/t: (2.74)
The (global) order of a numerical integration methods can be deﬁned to
be the largest exponent such that if we numerically solve an ODE using
MD1=t steps of lengtht, then there exists a constantK such that
jOx.tM/ x.tM/j Kt ; (2.75)


## Page 25

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.6 Numerical Solutions of Differential Equations 17
whereOx.tM/ is the approximation and x.tM/ is the true solution. Because
in the Euler method the ﬁrst discarded term of the Taylor series is of order
t2, the error of integrating over 1=t steps is proportional to t. Thus
the Euler method has orderD1.
We can also improve the approximation by using a trapezoidal approxi-
mation
Z tCt
t
f.x./;/ d t
2 Œf.x.t/;t/ C f.x.tCt/;t Ct/; (2.76)
which leads to the approximate integration rule
x.tkC1/ x.tk/Ct
2 Œf.x.tk/;tk/C f.x.tkC1/;tkC1/; (2.77)
which is an implicit rule in the sense that x.tkC1/ appears also on the right-
hand side. To actually use such an implicit rule, we would need to solve
a nonlinear equation at each integration step, which tends to be computa-
tionally too expensive when the dimensionality of x is high. Thus here we
consider explicit rules only, where the next value x.tkC1/ does not appear
on the right-hand side. If we now replace the term x.tkC1/ on the right-
hand side with its Euler approximation, we get the Heun method.
Algorithm 2.7 (Heun method). Start fromOx.t0/D x.t0/ and divide the
integration intervalŒt0;t intoM stepst0 <t 1 <t 2 <:::<t MDt such
thattDtkC1tk. At each stepk, approximate the solution as follows:
Qx.tkC1/DOx.tk/C f.Ox.tk/;tk/t;
Ox.tkC1/DOx.tk/Ct
2 Œf.Ox.tk/;tk/C f.Qx.tkC1/;tkC1/:
(2.78)
It can be shown that the Heun method has global orderD2.
Another useful class of methods are theRunge–Kuttamethods. The clas-
sical fourth-order Runge–Kutta methodis the following.
Algorithm 2.8 (Fourth-order Runge–Kutta method). Start fromOx.t0/D
x.t0/ and divide the integration intervalŒt0;t intoM stepst0<t 1<t 2<
::: < tMDt such thattDtkC1tk. At each step k, approximate the


## Page 26

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
18 Some Background on Ordinary Differential Equations
solution as follows:
x1
kD f.Ox.tk/;tk/t;
x2
kD f.Ox.tk/Cx1
k=2;tkCt=2/t;
x3
kD f.Ox.tk/Cx2
k=2;tkCt=2/t;
x4
kD f.Ox.tk/Cx3
k;tkCt/t;
Ox.tkC1/DOx.tk/C1
6.x1
kC2x2
kC2x3
kCx4
k/:
(2.79)
The preceding Runge–Kutta method can be derived by writing down the
Taylor series expansion for the solution and by selecting coefﬁcients such
that many of the lower-order terms cancel out. The order of this method is
D4.
In fact, all the preceding integration methods are based on the Taylor
series expansions of the solution. This is slightly problematic, because in
the case of SDEs the Taylor series expansion does not exist and all of the
methods need to be modiﬁed at least to some extent. However, it is possible
to replace the Taylor series with a so-called Itô–Taylor series and then work
out the analogous algorithms. The resulting algorithms are more compli-
cated than the deterministic counterparts, because the Itô–Taylor series is
considerably more complicated than the Taylor series. We will come back
to this issue in Chapter 8.
There exists a wide class of other numerical ODE solvers as well. For
example, all the aforementioned methods have a ﬁxed step length, but there
exist variable step size methods that automatically adapt the step size.
However, constructing variable step size methods for stochastic differen-
tial equations is much more involved than for deterministic equations, and
thus we shall not consider them here.
Example 2.9 (Numerical solution of ODEs) . Consider the spring–mass
model given in Equation (2.1). Let the parameters be D 2 and
D 1,
and the forcing term be zero. When we write this equation in state-space
form (2.4), we get a differential equation dx=dtD f.x;t/ , where
f.x;t/ D
 0 1
2

x: (2.80)
In the following, the solution is approximated numerically on the inter-
valt2 Œ0;10 . Figure 2.1a shows results for the Euler method, the Heun
method, and the fourth-order Runge–Kutta (RK4) method with step size
tD0:1, where the effect of a too long step size for the Euler method is


## Page 27

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
2.7 Picard–Lindelöf Theorem 19
0 2 4 6 8 10
/NUL0:5 0 0:5 1
Time, t
x1
Exact
Euler
Heun
RK4
(a) Simulated solution paths
10/NUL3 10/NUL2 10/NUL1
10/NUL12 10/NUL8 10/NUL4 100
/c129t
Absolute error,jOx/NULxj (b) Error plots for the methods
Figure 2.1 Comparison of the Euler, Heun, and fourth-order
Runge–Kutta method from Example 2.9. In (a), the step size of
tD0:1 is clearly too big for the Euler method. In (b), the effect
of the step size on the absolute error is visualized.
clearly visible. Figure 2.1b demonstrates in more detail the effect of step
size versus error in the simulated path.
2.7 Picard–Lindelöf Theorem
One important question in differential equations is whether the solution ex-
ists and is unique. To analyze these questions, consider a generic equation
of the form
dx.t/
dt D f.x.t/;t/; x.t0/D x0; (2.81)
where f.x;t/ is some given function. Integrating both sides from t0 tot
gives
x.t/D x0C
Z t
t0
f.x./;/ d: (2.82)
We can now use this identity to ﬁnd an approximate solution to the differ-
ential equation by the followingPicard iteration (see, e.g., Tenenbaum and
Pollard, 1985).
Algorithm 2.10 (Picard iteration). Start from the initial guess'0.t/D x0.


## Page 28

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
20 Some Background on Ordinary Differential Equations
Then compute approximations'1.t/;'2.t/;'3.t/;::: via the recursion
'nC1.t/D x0C
Z t
t0
f.'n./;/ d: (2.83)
The preceding recursion, which we already used for ﬁnding the solution
to linear differential equations in Section 2.2, can be shown to converge to
the unique solution
lim
n!1
'n.t/D x.t/; (2.84)
provided that f.x;t/ is continuous in both arguments and Lipschitz contin-
uous in the ﬁrst argument.
The implication of this recursion is the Picard–Lindelöf theorem, which
says that under the preceding continuity conditions the differential equation
has a solution and it is unique in a certain interval around t D t0. We
emphasize the innocent-looking but important issue in the theorem: the
function f.x;t/ needs to be continuous. This is important, because in the
case of stochastic differential equations the corresponding function will be
discontinuous everywhere and thus we need a completely new existence
theory for them.
2.8 Exercises
2.1 Consider the initial value problem
dx.t/
dt D1.2x.t//; x.0/ Dx0;
where1 and2 are constants.
(a) Derive the solution using the integrating factor method.
(b) Derive the solution using the Laplace transform.
2.2 One way of solving ODEs is to use an ansatz (an educated guess). Show that
x.t/Dc1 sin!t Cc2 cos!t is the solution to the second-order ODE
RxC!2xD0; ! >0: (2.85)
2.3 Solve the differential equation
dy
dt Dy21
with initial conditiony.0/D0 using the method of separation of variables.
2.4 In classical ODE literature, ODE systems are typically characterized by the
nature of their ﬁxed points (roots of the differential equation). Find out what
is meant by this, sketch the behavior of the following ODEs, and classify all
their ﬁxed points:


## Page 29

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 21
(a) PxD1C2 cosx.
(b) PxDxy andPyD1ex.
(c) PxDxy andPyDx24.
2.5 Study the behavior of the following differential equation
RxCPx.˛x2/xD0; ˛ 0;
as follows:
(a) Rewrite the problem in terms of a ﬁrst-order ODE.
(b) Find the ﬁxed points of the ODE.
(c) Characterize the nature of the ﬁxed points.
(d) Sketch the behavior of trajectories in the .x;Px/ plane.
2.6 We wish to ﬁnd the Laplace domain solution to the equation
a d2y
dt2Cb dy
dt Ccy Du;
wherey.t/ is an unknown time-varying function andu.t/ is a given function.
Solve the equation by following these steps:
(a) Calculate the Laplace transform of the equation.
(b) Solve the Laplace domain equation for Y.s/ .
(c) Take the inverse Laplace transform and provide a solution for y.t/ .
2.7 We wish to ﬁnd the matrix exponential exp .Ft/, wheret0 with
FD
0
@
0 1 0
0 0 1
0 0 0
1
A:
(a) Solve it using the series expansion deﬁnition of the matrix exponential
(note that the matrix is nilpotent).
(b) Solve it using the Laplace transform as in Example 2.5.
2.8 Use a computer algebra system (e.g., M ATLAB R
) to compute the matrix
exponential
exp
 0 1
2

t

:
How can you extract the impulse response (2.47) from the result?
2.9 Consider the initial value problem PxDx, wherex.0/D1.
(a) Solve the problem analytically. What is the exact value of x.1/?
(b) Implement the Euler method for this ODE. Using a step size of 1, es-
timate x.1/ numerically. Repeat this for step sizes 10n, where nD
1;2;3;4 .


## Page 30

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
22 Some Background on Ordinary Differential Equations
2.10 Implement the fourth-order Runge–Kutta (RK4) and Heun methods for solv-
ing the following second-order ODE:
RxCPx.˛x2/xD0; ˛ 0;
with˛D1. How does the choice oft affect the results obtained from the
methods?
2.11 Show that the Picard iteration converges for the linear system
dx.t/
dt DF x.t/
by showing that it is a contraction mapping. Assume thatjFj<1 .


## Page 31

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3
Pragmatic Introduction to Stochastic
Differential Equations
In this chapter, our aim is to look at SDEs as noise-driven ODEs. This is the
point of view usually encountered in applications. We start from a physical
construction of Brownian motion by Einstein (1905), which was also the
topic of his PhD thesis. We then proceed to give additional examples of
real-world phenomena leading to SDEs – or noise-driven differential equa-
tions. Based on the intuition in solution methods for inhomogeneous ODEs
in the previous chapter, we then derive “leap of faith” solutions to SDEs –
they are leaps of faith in the sense that the classical ODE theory does not
guarantee the existence of their solutions. And in fact, the leap-of-faith so-
lutions start to go awfully wrong at some point, which then motivates us to
look into proper stochastic calculus in the next chapter.
3.1 Stochastic Processes in Physics, Engineering, and Other Fields
The history of SDEs can be seen to have started from the classical pa-
per of Einstein (1905), where he presented a mathematical connection be-
tween microscopic random motion of particles and the macroscopic diffu-
sion equation. This is one of the results that proved the existence of the
atom. Einstein’s reasoning was roughly the following.
Example 3.1 (Microscopic motion of Brownian particles). Let be a small
time interval and considern particles suspended in liquid. During the time
interval, thex-coordinates of the particles will change by displacement
. The number of particles with a displacement between andC d is
then
dnDn./ d; (3.1)
where./ is the probability density of , which can be assumed to be
symmetric,./D./, and differ from zero only for very small values
of (see Figure 3.1).
23


## Page 32

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
24 Pragmatic Introduction to Stochastic Differential Equations
„ ƒ‚ …
/c129
/RS./c129/
Figure 3.1 Illustration of Einstein’s model of Brownian motion
from Example 3.1, where particles move by displacement
within small time intervals. The probability density./ is
shown by the curve.
Letu.x;t/ be the number of particles per unit volume. Then the number
of particles at timetC located betweenx andxC dx is given as
u.x;t C/ dxD
Z 1
1
u.xC;t/./ d

dx: (3.2)
Because is small, we can put
u.x;t C/Du.x;t/ C @u.x;t/
@t : (3.3)
We can expandu.xC;t/ in powers of as
u.xC;t/ Du.x;t/ C@u.x;t/
@x C2
2
@2u.x;t/
@x2 C (3.4)
Substituting (3.3) and (3.4) into (3.2) gives
u.x;t/ C @u.x;t/
@t Du.x;t/
Z 1
1
./ d
C@u.x;t/
@x
Z 1
1
./ d
C@2u.x;t/
@x2
Z 1
1
2
2 ./ dC ; (3.5)
where all the odd order terms vanish. Let us assume that the rest of the
terms with ordern3 vanish as well. If we recall that
R1
1./ dD1
and we put
1

Z 1
1
2
2 ./ dDD; (3.6)


## Page 33

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.1 Stochastic Processes in Physics, Engineering, and Other Fields 25
0 2 4 6 8 10
/NUL5 0 5
Time,t
ˇ.t/
Sample path of ˇ.t/
Mean
Upper 95% quantile
Lower 95% quantile
(a) A sample path
0
5
10 /NUL10
0
10
0
0:5
1
Time,t
ˇ.t/
p.ˇ.t// (b) Probability density
Figure 3.2 Two views of Brownian motion: (a) a sample path
and 95% quantiles, and (b) evolution of the probability density.
we get the diffusion equation
@u.x;t/
@t DD@2u.x;t/
@x2 : (3.7)
This connection was signiﬁcant during the time, because the diffusion
equation was only known as a macroscopic equation. Einstein was also
able to derive a formula for D in terms of microscopic quantities. From
this, Einstein was able to compute the prediction for mean squared dis-
placement of the particles as function of time:
z.t/D RT
N
1
3r t; (3.8)
where is the viscosity of the liquid,r is the diameter of the particles,T is
the temperature,R is the gas constant, andN is the Avogadro constant.
In modern terms, Brownian motion 1 (see Figure 3.2) is an abstraction
of a random walk process that has the property that each increment is in-
dependent. That is, direction and magnitude of each change of the process
are completely random and independent of the previous changes. One way
to think about Brownian motion is that it is the solution to the following
stochastic differential equation:
dˇ.t/
dt Dw.t/; (3.9)
1 In mathematics, Brownian motion is also often called the Wiener process.


## Page 34

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
26 Pragmatic Introduction to Stochastic Differential Equations
where w.t/ is a white random process. The term white here means that
each of the values w.t/ andw.t0/ are independent whenever t¤ t0. We
will later see that the probability density of the solution of this equation
will solve the diffusion equation. However, in Einstein’s time the theory of
stochastic differential equations did not exist and therefore the reasoning
was completely different.
A couple of years after Einstein’s contribution, Langevin (1908) pre-
sented an alternative construction of Brownian motion that leads to the
same macroscopic properties (see Figure 3.3). The reasoning in the article,
which is outlined in the following, was more mechanical than in Einstein’s
derivation.
Example 3.2 (Langevin’s model of Brownian motion). Consider a small
particle suspended in liquid. Assume that there are two kinds of forces act-
ing on the particle:
1. Friction force Ff, which by the Stoke’s law has the following form:
FfD6rv; (3.10)
where is the viscosity, r is the diameter of the particle, and v is its
velocity.
2. Random force Fr caused by random collisions of the particles.
Newton’s law then gives
m d2x
dt2 D6r dx
dt CFr; (3.11)
wherem is the mass of the particle. Recall that
1
2
d.x2/
dt D dx
dt x;
1
2
d2.x2/
dt2 D d2x
dt2 xC
dx
dt
2
:
(3.12)
Thus if we multiply Equation (3.11) withx, substitute the aforementioned
identities, and take expectations, we get
m
2 E
d2.x2/
dt2

m E
"dx
dt
2#
D3r E
d.x2/
dt

C EŒFrx:
(3.13)
From statistical physics, we know the relationship between the average


## Page 35

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.1 Stochastic Processes in Physics, Engineering, and Other Fields 27
Random force
from collisions
Movement
slowed down
by friction
Figure 3.3 Illustration of Langevin’s model of Brownian motion
from Example 3.2.
kinetic energy and temperature:
m E
"dx
dt
2#
D RT
N : (3.14)
If we then assume that the random force has zero mean EŒFrD 0, the
random force and the position are uncorrelated,EŒFrxD0, and we deﬁne
a new variablePzD d EŒx2
ı
dt , we get the differential equation
m
2
dPz
dtRT
N D3r Pz; (3.15)
which has the general solution
Pz.t/D RT
N
1
3r

1 exp
6r
m t

: (3.16)
The preceding exponential goes to zero very quickly, and thus the resulting
mean squared displacement is nominally just the resulting constant multi-
plied with time:
z.t/D RT
N
1
3r t; (3.17)
which is exactly the same as Einstein obtained.
In the preceding model, Brownian motion is not actually seen as a solu-
tion to the white noise driven differential equation
dˇ.t/
dt Dw.t/; (3.18)


## Page 36

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
28 Pragmatic Introduction to Stochastic Differential Equations
w.t /
R
C v.t /
A
B
Figure 3.4 Example resistor-capacitor (RC) circuit from
Example 3.3.
but instead as the solution to an equation of the form
d2Qˇ.t/
dt2 Dc dQˇ.t/
dt Cw.t/ (3.19)
in the limit of the vanishing time constant. The latter (Langevin’s version)
is sometimes called the physical Brownian motion and the former (Ein-
stein’s version) the mathematical Brownian motion. In this book the term
Brownian motion always means the mathematical Brownian motion.
Stochastic differential equations also arise in other contexts. For exam-
ple, the effect of thermal noise in electrical circuits and various kinds of
disturbances in telecommunications systems can be modeled as SDEs. This
is illustrated in the following example.
Example 3.3 (RC circuit). Consider the simple RC circuit shown in Fig-
ure 3.4. In Laplace domain, the output voltage V.s/ can be expressed in
terms of the input voltageW.s/ as follows:
V.s/D 1
1CRCs W.s/: (3.20)
An inverse Laplace transform gives the differential equation
dv.t/
dt D 1
RC v.t/C 1
RC w.t/: (3.21)
For the purposes of studying the response of the circuit to noise, we can
now replace the input voltage with a white noise processw.t/ and analyze
the properties of the resulting equation.
Stochastic differential equations can also be used for modeling dynamic
phenomena, where the exact dynamics of the system are uncertain. For ex-
ample, the motion model of a car cannot be exactly written down if we do
not know all the external forces affecting the car and the input from the


## Page 37

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.1 Stochastic Processes in Physics, Engineering, and Other Fields 29
w1.t/
w2.t/
Figure 3.5 Illustration of a car’s dynamic model from
Example 3.4.
driver. However, the unknown subphenomena can be modeled as stochas-
tic processes, which leads to stochastic differential equations. This kind
of modeling principle of representing uncertainties as random variables
is sometimes called Bayesian modeling . Stochastic differential equation
models of this kind are commonly used in navigation and control systems
(see, e.g., Jazwinski, 1970; Bar-Shalom et al., 2001; Grewal and Andrews,
2001). Stock prices can also be modeled using stochastic differential equa-
tions, and these kinds of models are indeed commonly used in analysis and
pricing of stocks and related quantities (Øksendal, 2003).
Example 3.4 (Dynamic model of a car) . The dynamics of a car in two
dimensions.x1;x2/ are governed by Newton’s law (see Figure 3.5):
f.t/Dm a.t/; (3.22)
where a.t/ is the acceleration,m is the mass of the car, andf.t/ is a vector
of (unknown) forces acting on the car. Let us now model f.t/=m as a two-
dimensional white random process w.t/D.w1.t/;w 2.t//:
d2x1
dt2 Dw1.t/ and d2x2
dt2 Dw2.t/: (3.23)
If we deﬁnex3D dx1=dt ,x4D dx2=dt , the model can be written as a


## Page 38

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
30 Pragmatic Introduction to Stochastic Differential Equations
xL
yL
zL
xW
yW
zW Gravitation
Figure 3.6 Tracking of the movement of a smartphone device in
local (L) and world coordinates (W) from Example 3.5.
ﬁrst-ordersystem of differential equations:
d
dt
0
BB@
x1
x2
x3
x4
1
CCAD
0
BB@
0 0 1 0
0 0 0 1
0 0 0 0
0 0 0 0
1
CCA
„ ƒ‚ …
F
0
BB@
x1
x2
x3
x4
1
CCAC
0
BB@
0 0
0 0
1 0
0 1
1
CCA
„ ƒ‚ …
L
w1
w2

: (3.24)
In shorter matrix form, this can be written as a linear differential equation
model:
dx
dt D F xC L w:
Example 3.5 (Smartphone tracking). Many modern smartphones contain
three-dimensional acceleration sensors (i.e., accelerometers) as well as
three-dimensional angular velocity sensors (i.e., gyroscopes). It turns out
that the nominal component seen by the accelerometer is the gravitation,
which from the sensor’s point of view points up from the ground. How-
ever, as the sensors are attached to the smartphone, “up” will not usually
correspond to the z-direction (or any other ﬁxed direction) of the sensor,
but points to a direction that depends on the orientation of the smartphone


## Page 39

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.1 Stochastic Processes in Physics, Engineering, and Other Fields 31
g
w.t/

Figure 3.7 An illustration of the noisy pendulum model from
Example 3.6, where the forces acting upon the pendulum are
gravity and a random noise processw.t/ .
(see Figure 3.6). These observations allow us to track the orientation of a
smartphone (Särkkä et al., 2015a).
In ideal conditions, we can write down the following differential equa-
tion for the relation between the locally seen gravitation gL and the angu-
lar velocity !L measured by the gyroscope given by the following cross-
product:
dgL
dt D!L gL: (3.25)
We can now take into account the inaccuracies in the sensors by adding a
white noise term w.t/ to the model, which leads to the SDE
dgL
dt D!L gLC w.t/: (3.26)
The acceleration sensors can now be modeled to produce observations of
the form aLD gLC noise, where the noise term models the local accel-
erations. A Kalman ﬁlter can then be used to track the orientation of the
smartphone (Särkkä et al., 2015a).
Example 3.6 (Noisy pendulum) . The differential equation for a simple
pendulum (see Figure 3.7) with unit length and mass can be written as
RDg sin./Cw.t/; (3.27)


## Page 40

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
32 Pragmatic Introduction to Stochastic Differential Equations
where is the angle,g is the gravitational acceleration, andw.t/ is a ran-
dom noise process. This model can be converted into the following state-
space model:
d
dt
1
2

D
 2
g sin.1/

C
0
1

w.t/: (3.28)
This can be seen to be a special case of an equation of the form
dx
dt D f.x/C L w.t/; (3.29)
where f.x/ is a nonlinear function.
Example 3.7 (Heart and breathing tracking in the brain). Functional mag-
netic resonance imaging (fMRI) is a noninvasive neuroimaging method that
is capable of capturing functional brain activity by measuring the variation
of blood ﬂow in the brain through excitation of nuclear spins and measur-
ing their relaxation times. Physiological signals related to heartbeats and
respiratory cycles cause structured temporal artifacts in the data. These
structured noise components can be modeled – and removed – by using
stochastic differential equations and Kalman ﬁlters (Särkkä et al., 2012).
Treating each three-dimensional pixel (voxel) as independent, we can
model the signal as a sum of a slowly moving brain activity (blood-oxygen-
level dependent, BOLD) signal, quasiperiodic (almost periodic) physio-
logical noise signals, and white noise. The quasiperiodic signals can be
modeled as a sum of stochastic oscillators (which are SDEs):
dxn
dt D
 0 2nf.t/
2nf.t/ 0

xnC
0
1

w.t/; (3.30)
wheref.t/ is the time-dependent frequency andw.t/ a white random pro-
cess. Figure 3.8 shows example realizations of quasiperiodic oscillations.
Example 3.8 (Black–Scholes model). In the Black–Scholes model, the as-
set (e.g., a stock price)x is assumed to follow geometric Brownian motion
dxDx dtCx dˇ; (3.31)
where dˇ is a Brownian motion increment,  is a drift constant, and 
is a volatility constant. If we formally divide by dt, this equation can be
heuristically interpreted as a differential equation
dx
dt DxCxw; (3.32)


## Page 41

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.2 Differential Equations with Driving White Noise 33
(a) Segmented brain surface
0 2 4 6 8 10
Time, t (b) Superpositions of stochastic oscillators
Figure 3.8 Quasiperiodic realizations of superpositions of
stochastic oscillators with time-varying frequencies from
Example 3.7. The trajectories share a common frequency
trajectory, but the amplitudes and phases are allowed to vary – a
good model for periodic noise confounds in the brain.
wherew.t/ is a white random process. This equation is an example of more
general multiplicative noise models of the form
dx
dt D f.x/C L.x/ w: (3.33)
3.2 Differential Equations with Driving White Noise
As discussed in the previous section, many time-varying phenomena in
various ﬁelds in science and engineering can be modeled as differential
equations of the form
dx
dt D f.x;t/C L.x;t/ w.t/; (3.34)
where w.t/ is a vector-valued forcing function that we often can model as
white noise.
We can indeed think of an SDE as an equation of the preceding form
where the forcing function is a stochastic process. A particularly useful
special case of a stochastic forcing function is the white noise process. As
we saw in the previous section, one motivation for studying such equations
is that various physical phenomena can be modeled as random processes
(e.g., thermal motion), and when such a phenomenon enters a physical sys-
tem, we get a model of the preceding SDE form. Another motivation is that


## Page 42

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
34 Pragmatic Introduction to Stochastic Differential Equations
0 2 4 6 8 10
/NUL0:5 0 0:5 1
Time, t
Displacement, x.t /
Deterministic solution
Realizations of the SDE
Figure 3.9 Solutions of the spring model in Equation (2.1) when
the input is white noise. The solution of the SDE is different for
each realization of the noise process and hence the solution can
be summarized in terms of its statistics such as the mean and
covariance. For example, the mean in the case of a linear SDE
corresponds to the deterministic solution with zero noise.
in Bayesian statistical modeling unknown forces are naturally modeled as
random forces, which again leads to SDE types of models. Because the
forcing function is random, the solution to the SDE is a random process
as well. With a different realization of the noise process, we get a differ-
ent solution. For this reason, the particular solutions of the equations are
not often of interest, but instead, we aim to determine the statistics of the
solutions over all realizations. An example of an SDE solution is given in
Figure 3.9.
In the context of SDEs, the term f.x;t/ in Equation (3.34) is called
the drift function, which determines the nominal dynamics of the system,
and L.x;t/ is the dispersion matrix, which determines how the noise w.t/
enters the system. This is the most general form of SDEs that we discuss
in this book. Although it would be tempting to generalize these equations
to d x=dt D f.x; w;t/ , it is not possible in the present theory. We shall
discuss the reason for this later.
The stochastic noise process w.t/ is usually modeled as Gaussian and
“white” in the sense that w.t/ and w.t0/ are uncorrelated (and independent)
for all t ¤ t0. The term white arises from the property that the power
spectrum (or actually, the spectral density) of white noise is constant (ﬂat)


## Page 43

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.2 Differential Equations with Driving White Noise 35
0 0:2 0:4 0:6 0:8 1
/NUL4 /NUL2 0 2 4
Time, t
w.t /
Figure 3.10 A sketch of a realization of white noise.
over all frequencies. White light is another phenomenon that has this same
property and hence the name.
In mathematical sense, a white noise process can be deﬁned as follows.
Deﬁnition 3.9 (White noise). A white noise process w.t/2 RS is a ran-
dom function with the following properties:
1. The two values w.t/ and w.t0/ are independent ift¤t0.
2. The mapping t7! w.t/ is a Gaussian process with zero mean and Dirac
delta correlation:
mw.t/D EŒw.t/D 0;
Cw.t;s/ D EŒw.t/ w T.s/Dı.ts/ Q;
(3.35)
where Q is the spectral density of the process.
From the preceding properties we can also deduce the following some-
what peculiar properties of white noise:
 The sample patht7! w.t/ is discontinuous almost everywhere.
 White noise is unbounded and it takes arbitrarily large positive and neg-
ative values at any ﬁnite interval.
An illustration of a scalar white noise process realization is shown in Fig-
ure 3.10.
It is also possible to use non-Gaussian driving functions in SDEs such as
Poisson processes or more general Lévy processes (see, e.g., Applebaum,


## Page 44

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
36 Pragmatic Introduction to Stochastic Differential Equations
2009), but here we will always assume that the driving function is Gaus-
sian. However, we brieﬂy discuss Lévy process-driven SDEs in Chapter 13.
3.3 Heuristic Solutions of Linear SDEs
Let us ﬁrst consider linear time-invariant stochastic differential equations
(LTI SDEs) of the form
dx.t/
dt D F x.t/C L w.t/; x.t0/ N.m0; P0/; (3.36)
where x.t/2 RD is the state, F2 RDD and L2 RDS are some con-
stant matrices, and the white noise processw.t/2 RS has zero mean and a
given spectral density matrixQ2 RSS. In Equation (3.36), we have spec-
iﬁed a random initial condition for the equation such that at initial time t0
the state x.t0/ should be Gaussian with a given mean m0 and covariance
P0. The white noise process and the initial condition are assumed to be
independent.
If we pretend for a while that the driving process w.t/ is deterministic
and continuous, we can form the general solution to the differential equa-
tion as follows:
x.t/D exp.F.tt0// x.t0/C
Z t
t0
exp.F.t// L w./ d; (3.37)
where exp./ is the matrix exponential function.
We can now take a “leap of faith” and hope that this solutions is valid
also when w.t/ is a white noise process. It turns out that it indeed is, but just
because the differential equation happens to be linear (we will come back
to this issue in the next chapter). However, it is enough for our purposes for
now. The solution also turns out to be Gaussian, because the noise process
is Gaussian and a linear differential equation can be considered as a linear
operator acting on the noise process (and the initial condition).
Because the white noise process has zero mean, taking expectations of
the both sides of Equation (3.37) gives
EŒx.t/D exp.F.tt0// m0; (3.38)
which is thus the expected value of the SDE solutions over all realizations
of noise. The mean function is here denoted as m.t/D EŒx.t/.
The covariance of the solution can be derived by substituting the solution
into the deﬁnition of covariance and by using the delta-correlation property


## Page 45

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.3 Heuristic Solutions of Linear SDEs 37
of white noise, which results in
E

.x.t/ m.t//. x.t/ m.t// T
D exp.F.tt0// P0 exp.F.tt0//T
C
Z t
t0
exp.F.t// L Q LT exp.F.t//T d: (3.39)
In this book, we will hereafter denote the covariance as P.t/ D
E

.x.t/ m.t//. x.t/ m.t// T
.
By differentiating the mean and covariance solutions and collecting the
terms, we can also derive the following differential equations for the mean
and covariance:
dm.t/
dt D F m.t/;
dP.t/
dt D F P.t/C P.t/ F TC L Q LT:
(3.40)
Example 3.10 (Stochastic spring model) . Consider the spring model in
Equation (2.4). If we replace the unknown input force with a white noise
with spectral densityq, we get the following LTI SDE:
d
dt
x1.t/
x2.t/

„ ƒ‚ …
dx.t/=dt
D
 0 1
2

„ ƒ‚ …
F
x1.t/
x2.t/

„ ƒ‚ …
x.t/
C
0
1

„ƒ‚…
L
w.t/: (3.41)
The equations for the mean and covariance are then given as
 dm1
dtdm2
dt

D
 0 1
2
m1
m2

;
 dP11
dt
dP12
dtdP21
dt
dP22
dt

D
 0 1
2
P11 P12
P21 P22

C
P11 P12
P21 P22
 0 1
2
T
C
0 0
0 q

:
(3.42)
Figure 3.11 shows the theoretical mean and the 95% quantiles computed
from the variancesP11.t/ along with trajectories from the stochastic spring
model.
Despite the heuristic derivation, Equations (3.40) are indeed the correct
differential equations for the mean and covariance. However, as we see in
the following, it is easy to demonstrate that one has to be extremely careful


## Page 46

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
38 Pragmatic Introduction to Stochastic Differential Equations
0 2 4 6 8 10
/NUL0:5 0 0:5 1
Time, t
Displacement, x.t /
Mean solution
95% quantiles
Realizations of the SDE
Figure 3.11 Solutions, exact mean, and the95% quantiles for the
spring model in Equation (2.1), when the input is white noise.
in extrapolating deterministic differential equation results to the stochastic
setting.
Note that we can indeed derive the ﬁrst of the preceding equations sim-
ply by taking the expectations of both sides of Equation (3.36):
E
dx.t/
dt

D EŒF x.t/C EŒL w.t/: (3.43)
Exchanging the order of expectation and differentiation, using the linearity
of expectation, and recalling that white noise has zero mean then results in
a correct mean differential equation. We can attempt to do the same for the
covariance. By the chain rule of ordinary calculus, we get
d
dt
h
.x m/. x m/T
i
D
dx
dt  dm
dt

.x m/TC.x m/
dx
dt  dm
dt
T
: (3.44)
Substituting the time derivatives on the right-hand side and taking expec-
tation results in
d
dt E
h
.x m/. x m/T
i
D F E
h
.x m/. x m/T
i
C E
h
.x m/. x m/T
i
F T; (3.45)


## Page 47

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
3.4 Heuristic Solutions of Nonlinear SDEs 39
which implies the covariance differential equation
dP.t/
dt D F P.t/C P.t/ F T: (3.46)
But this equation is wrong, because the term L Q LT is missing on the
right-hand side. Our mistake was to assume that we can use the product
rule in Equation (3.44), but in fact we cannot. This is one of the peculiar
features of stochastic calculus and it is also a warning sign that we should
not take our “leaps of faith” too far when analyzing solutions of SDEs via
formal extensions of deterministic ODE solutions.
3.4 Heuristic Solutions of Nonlinear SDEs
We can also attempt to analyze differential equations of the form
dx
dt D f.x;t/C L.x;t/ w.t/; (3.47)
where x.t/2 RD, f.x;t/ , and L.x;t/ are nonlinear functions, and w.t/2
RS is a white noise process with a spectral densityQ. Unfortunately, in the
nonlinear case we cannot take the same kind of “leap of faith” from deter-
ministic solutions as in the case of linear differential equations, because in
general, we cannot solve even the corresponding deterministic differential
equation.
An attempt to generalize the numerical methods for deterministic dif-
ferential equations discussed in the previous chapter will fail as well, be-
cause the basic requirement in almost all of those methods is continuity
of the right-hand side, and in fact, even differentiability of several orders.
Because white noise is discontinuous everywhere, the right-hand side is
discontinuous everywhere, and is certainly not differentiable anywhere ei-
ther.
We can, however, take a shortcut and generalize the Euler method (lead-
ing to the so-called Euler–Maruyama method) to the present stochastic set-
ting, because it does not explicitly require continuity. From that, we get an
iteration of the form
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC L.Ox.tk/;tk/ˇk; (3.48)
whereˇk is a Gaussian random variable with distribution N .0; Qt/.
Note that it is the variance that is proportional to t, not the standard
deviation as one might expect. This results from the peculiar properties
of stochastic differential equations. We can use the preceding method for


## Page 48

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
40 Pragmatic Introduction to Stochastic Differential Equations
simulating trajectories from stochastic differential equations and the result
converges to the true solution in the limit t! 0. However, the conver-
gence is quite slow, as the (strong) order of convergence is only
D 1=2.
In the case of SDEs, the convergence order deﬁnition is a bit more com-
plicated than in the deterministic case, because we have a couple of dif-
ferent types of convergence orders. We can talk about pathwise approxi-
mations, which correspond to approximating the solution with ﬁxed w.t/.
These are also called strong solutions and give rise to the strong order of
convergence
. However, we can also think of approximating the prob-
ability density or the moments of the solutions. These give rise to weak
solutions and weak order of convergence ˛. We will come back to these
and numerical solution methods in general later in Chapter 8.
3.5 The Problem of Solution Existence and Uniqueness
One can attempt to analyze the uniqueness and existence of the equation
dx
dt D f.x;t/C L.x;t/ w.t/ (3.49)
using the Picard–Lindelöf theorem presented in the previous chapter. The
basic assumption in the theorem for the right-hand side of the differential
equation consisted of the following:
 Continuity in both arguments
 Lipschitz continuity in the ﬁrst argument
Unfortunately, the ﬁrst of these fails miserably, because white noise is dis-
continuous everywhere. However, a small glimpse of hope is implied by
the fact that f.x;t/ might indeed be Lipschitz continuous in the ﬁrst argu-
ment, as well as L.x;t/ . However, without extending the Picard–Lindelöf
theorem, we cannot determine the existence or uniqueness of stochastic
differential equations.
It turns out that a stochastic analogue of the Picard iteration will indeed
lead to the solution to the existence and uniqueness question also in the
stochastic case. However, before going into that, we need to make the the-
ory of stochastic differential equations mathematically meaningful.
3.6 Exercises
3.1 Mean and covariance equations of linear SDEs:
(a) Complete the missing steps in the derivation of the covariance (3.39).


## Page 49

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 41
(b) Derive the mean and covariance differential equations (3.40) by differ-
entiating the equations (3.38) and (3.39).
3.2 Solution of an Ornstein–Uhlenbeck process:
(a) Find the complete solution x.t/ as well as the mean m.t/ and variance
P.t/ of the following scalar stochastic differential equation:
dx.t/
dt Dx.t/ Cw.t/; x.0/ Dx0; (3.50)
wherex0 and > 0are given constants and the white noise w.t/ has
spectral densityq.
(b) Compute the limit of the mean and variance when t!1 (i) directly
via limt!1m.t/, limt!1P.t/ , and (ii) by solving the stationary state
of the differential equations dm=dtD0 and dP=dtD0.
3.3 Simulate 1,000 trajectories on the time interval t2Œ0;1 from the Ornstein–
Uhlenbeck process in the previous exercise using the Euler–Maruyama
method with D 1=2 , q D 1, t D 1=100 , x0 D 1, and check that
the mean and covariance trajectories approximately agree with the theoreti-
cal values.
3.4 Simulate 1,000 trajectories from the Black–Scholes model (see Exam-
ple 3.8) on the time interval Œ0;1 using the Euler–Maruyama method with
D 1=10 andD1. By comparing to the exact solution given in Exam-
ple 4.7 (approximateˇ.t/ as sum ofˇk), study the scaling of the error as
a function oft.
3.5 The covariance function of the Ornstein–Uhlenbeck process is
C.t;t0/D q
2 exp.jtt0j/:
(a) Show that in the limit of  ! 1, the Ornstein–Uhlenbeck process
reverts to white noise.
(b) Show that the power spectral density of the Ornstein–Uhlenbeck process
becomes ﬂat in the limit.
3.6 Let us consider the rotation formula in (3.25) and assume that the angular
velocity!L is constant. Then it is useful to rewrite (3.25) as
dgL
dt DŒ!L gL;
whereŒ denotes the cross-product matrix. Show that the matrix exponen-
tial of the cross-product matrix is given by the Rodrigues formula
exp.Œ!L/D IC sin.k!Lk/Œ!L
k!Lk C.1 cos.k!Lk//Œ!L2

k!Lk2 :
Write down the solution of the differential equation (3.25) in terms of this.
What is the solution to the differential equation (3.26)?


## Page 50

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4
Itô Calculus and Stochastic Differential
Equations
Itô calculus or stochastic calculus (see, e.g., Karatzas and Shreve, 1991;
Øksendal, 2003, for full theory) is the theory of integration and differen-
tiation for stochastic processes. In fact, it is more a theory of integration
than differentiation and the theory of differentiation of stochastic processes
belongs to the domain of Malliavin calculus (Nualart, 2006), which is be-
yond the scope of this book. In this chapter, we ﬁrst see how SDEs can be
expressed as equivalent integral equations, which then leads to the require-
ment of deﬁning a stochastic integral with respect to a Brownian motion ap-
pearing in the equation. We proceed to demonstrate why this integral can-
not be deﬁned as a Riemann integral, Stieltjes integral, or even a Lebesgue
integral. Instead, we must study a completely new integral, which becomes
the Itô integral. Given the deﬁnition of this integral, we can derive the com-
putation rules for the resulting stochastic calculus. The cornerstone is the
Itô formula, the chain rule for stochastic processes, from which we can
derive almost all of the other results. With the formula, we can properly
derive the solutions for linear SDEs that we heuristically obtained in the
previous chapter. We also discuss the difﬁculty of solving nonlinear SDEs
even when we know how to deﬁne them and ﬁnally discuss other stochas-
tic calculi, of which the most famous one is the Stratonovich stochastic
calculus.
4.1 The Stochastic Integral of Itô
As discussed in the previous chapter, a stochastic differential equation can
be heuristically considered as a vector differential equation of the form
dx
dt D f.x;t/C L.x;t/ w.t/; (4.1)
where w.t/ is a zero mean white Gaussian process. Even though this is
somewhat true, it is not the whole truth. The aim in this section is to clarify
42


## Page 51

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.1 The Stochastic Integral of Itô 43
what really is going on behind stochastic differential equations and how
they should be treated.
The problem in the preceding equation is that it cannot be a differential
equation in the traditional sense, because the ordinary theory of differential
equations does not permit discontinuous functions such asw.t/ in differen-
tial equations (recall the problem with the Picard–Lindelöf theorem). This
problem is not purely theoretical, because the solution actually turns out to
depend on inﬁnitesimally small differences in mathematical deﬁnitions of
the noise, and thus without further restrictions the solution would not be
unique even with a given realization of white noise w.t/.
Fortunately, there is a solution to this problem, but in order to ﬁnd it we
need to reduce the problem to deﬁnition of a new kind of integral called
the Itô integral, which is an integral with respect to a stochastic process. In
order to do that, let us ﬁrst formally integrate the differential equation from
some initial timet0 to ﬁnal timet:
x.t/ x.t0/D
Z t
t0
f.x.t/;t/ dtC
Z t
t0
L.x.t/;t/ w.t/ dt: (4.2)
The ﬁrst integral on the right-hand side is just a normal integral with respect
to time and can be deﬁned as a Riemann integral oft7! f.x.t/;t/ , or as a
Lebesgue integral with respect to the Lebesgue measure, if more generality
is desired.
The second integral is the problematic one. First of all, it cannot be de-
ﬁned as a Riemann integral due to the unboundedness and discontinuity of
the white noise process. Recall that in the Riemannian sense the integral
would be deﬁned as the following kind of limit:
Z t
t0
L.x.t/;t/ w.t/ dtD lim
n!1
X
k
L.x.t
k/;t
k/ w.t
k/.tkC1tk/; (4.3)
where t0 < t1 < ::: < tn D t and t
k 2 Œtk;tkC1. In the context of
Riemann integrals, so-called upper and lower sums are deﬁned as the se-
lections oft
k such that the integrand L.x.t
k/;t
k/ w.t
k/ has its maximum
and minimum values, respectively. The Riemann integral is deﬁned if the
upper and lower sums converge to the same value, which is then deﬁned
to be the value of the integral. In the case of white noise, it happens that
w.t
k/ is not bounded and takes arbitrarily small and large values at every
ﬁnite interval, and thus the Riemann integral does not converge.
We could also attempt to deﬁne the second integral as a Stieltjes integral,
which is more general than the Riemann integral. For that deﬁnition, we
need to interpret the increment w.t/ dt as an increment of another process


## Page 52

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
44 Itô Calculus and Stochastic Differential Equations
ˇ.t/ such that the integral becomes
Z t
t0
L.x.t/;t/ w.t/ dtD
Z t
t0
L.x.t/;t/ dˇ.t/: (4.4)
It turns out that a suitable process for this purpose is Brownian motion,
which we already discussed in the previous chapter:
Deﬁnition 4.1(Brownian motion). Brownian motionˇ.t/2 RS is a con-
tinuous stochastic process with the following properties:
1. Any increment ˇkDˇ.tkC1/ˇ.tk/ is a zero mean Gaussian random
variable with covariance Qtk, where Q is the diffusion matrix of the
Brownian motion andtkDtkC1tk.
2. When the time spans of increments do not overlap, the increments are
independent.
3. The process starts at origin: ˇ.0/D 0.
When the Brownian motion is one-dimensional, we denote it asˇ.t/. In
the scalar case, we often refer to the corresponding diffusion matrix as the
diffusion constant or diffusion coefﬁcient, and denote it as q. An example
of a scalar Brownian motion realization is shown in Figure 4.1.
Some further properties of Brownian motion that result from the preced-
ing deﬁnition are the following:
1. Brownian motion t7!ˇ.t/ is nowhere differentiable.
2. White noise can be considered as the formal (or weak) derivative of
Brownian motion, w.t/D dˇ.t/=dt.
Unfortunately, the deﬁnition of the latter integral in Equation (4.2) in
terms of increments of Brownian motion as in Equation (4.4) does not
solve our existence problem. The problem is the everywhere discontinu-
ous derivative of ˇ.t/, which makes it too irregular for the deﬁning sum
of the Stieltjes integral to converge. Unfortunately, the same happens with
the Lebesgue integral. Recall that both Stieltjes and Lebesgue integrals are
essentially deﬁned as limits of the form
Z t
t0
L.x.t/;t/ dˇD lim
n!1
X
k
L.x.t
k/;t
k/Œˇ.tkC1/ˇ.tk/; (4.5)
wheret0 < t1 < ::: < tn andt
k 2 Œtk;tkC1. Both of these deﬁnitions
would require the limit to be independent of the position on the interval
t
k2Œtk;tkC1. However, for integration with respect to Brownian motion,


## Page 53

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.1 The Stochastic Integral of Itô 45
0 0:2 0:4 0:6 0:8 1
0 0:5 1
Time,t
ˇ.t/
Figure 4.1 A realization of trajectory of Brownian motion, where
the derivative is discontinuous everywhere. White noise can be
considered the formal derivative of Brownian motion.
this is not the case. Thus, the Stieltjes or Lebesgue integral deﬁnitions do
not work either.
A solution to the problem is the Itô stochastic integral, which is based on
the observation that if we ﬁx the choice tot
kDtk, then the limit becomes
unique. The Itô integral can thus be deﬁned as the limit (in theL2 sense)
Z t
t0
L.x.t/;t/ dˇ.t/D lim
n!1
X
k
L.x.tk/;tk/Œˇ.tkC1/ˇ.tk/; (4.6)
where t0 < t1 < ::: < tn D t, which is a sensible deﬁnition of the
stochastic integral required for the SDE.
The stochastic differential equation (3.34) can now be deﬁned to actually
refer to the corresponding (Itô) integral equation
x.t/ x.t0/D
Z t
t0
f.x.t/;t/ dtC
Z t
t0
L.x.t/;t/ dˇ.t/; (4.7)
which should be true for arbitraryt0 andt.
We can now take a step backward and return from this stochastic integral
equation to the differential equation as follows. If we choose the integration
limits in Equation (4.7) to bet andtCdt, where dt is “small”, we can write
the equation in the differential form
dxD f.x;t/ dtC L.x;t/ dˇ; (4.8)
which should be interpreted as shorthand for the integral equation. The


## Page 54

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
46 Itô Calculus and Stochastic Differential Equations
preceding is the form that is most often used in literature on SDEs (e.g.,
Øksendal, 2003; Karatzas and Shreve, 1991). We can now formally divide
by dt to obtain a differential equation
dx
dt D f.x;t/C L.x;t/ dˇ
dt; (4.9)
which shows that also here white noise can be interpreted as the formal
derivative of Brownian motion. However, due to non-classical transforma-
tion properties of the Itô differentials, one has to be very careful in working
with such formal manipulations.
Now we also see why we are not permitted to consider more general
differential equations of the form
dx.t/
dt D f.x.t/; w.t/;t/; (4.10)
where the white noise w.t/ enters the system through a nonlinear trans-
formation. There is no way to rewrite this equation as a stochastic integral
with respect to a Brownian motion, and thus we cannot deﬁne the mathe-
matical meaning of this equation. More generally, white noise should not
be thought of as an entity as such, but it only exists as the formal derivative
of Brownian motion. Therefore, only linear functions of white noise have
a meaning, whereas nonlinear functions do not.
4.2 Itô Formula
Consider the stochastic integral
Z t
0
ˇ.t/ dˇ.t/; (4.11)
whereˇ.t/ is a standard Brownian motion, that is, a scalar Brownian mo-
tion with diffusion constantqD1. Based on ordinary calculus, we would
expect the value of this integral to be ˇ2.t/=2, but this is a wrong answer.
If we select a partition 0Dt0 <t 1 <:::<t nDt, we can rearrange the
terms as follows:Z t
0
ˇ.t/ dˇ.t/D lim
n!1
X
k
ˇ.tk/Œˇ.tkC1/ˇ.tk/
D lim
n!1
X
k

1
2.ˇ.tkC1/ˇ.tk//2C1
2.ˇ2.tkC1/ˇ2.tk//

D 1
2tC1
2ˇ2.t/; (4.12)


## Page 55

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.2 Itô Formula 47
where we have used the result that the limit of the ﬁrst term is
limn!1
P
k.ˇ.tkC1/ˇ.tk//2Dt. The Itô differential ofˇ2.t/=2 is anal-
ogously
d
1
2ˇ2.t/

Dˇ.t/ dˇ.t/C1
2 dt; (4.13)
notˇ.t/ dˇ.t/ as we might expect. This is a consequence and also a draw-
back of the selection of the ﬁxedt
kDtk.
The general rule for calculating the Itô differentials and thus Itô integrals
can be summarized as the following Itô formula, which corresponds to
chain rule in ordinary calculus.
Theorem 4.2 (Itô formula). Assume that x.t/ is an Itô process, and con-
sider an arbitrary (scalar) function .x.t/;t/ of the process. Then the Itô
differential of, that is, the Itô SDE for is given as
dD @
@t dtC
X
i
@
@xi
dxiC1
2
X
i;j
 @2
@xi@xj

dxi dxj
D @
@t dtC.r/T dxC1
2 tr
˚
rr T

dx dxT
; (4.14)
provided that the required partial derivatives exist, where the mixed differ-
entials are combined according to the rules
dˇ dtD 0;
dt dˇD 0;
dˇ dˇTD Q dt:
(4.15)
Proof See, for example, Øksendal (2003) or Karatzas and Shreve (1991).
Although the preceding Itô formula is deﬁned only for scalar, it works
for each of the components of a vector-valued function separately and thus
also includes the vector case. Also note that every Itô process has a repre-
sentation as the solution of an SDE of the form
dxD f.x;t/ dtC L.x;t/ dˇ (4.16)
and an explicit expression for the differential in terms of the functions
f.x;t/ and L.x;t/ can be derived by substituting the preceding equation
for dx in the Itô formula.


## Page 56

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
48 Itô Calculus and Stochastic Differential Equations
The Itô formula can be conceptually derived by a Taylor series expan-
sion:
.xC dx;tC dt/D.x;t/C@. x;t/
@t dt
C
X
i
@. x;t/
@xi
dxiC1
2
X
i;j
 @2
@xi@xj

dxi dxjC:::: (4.17)
For the ﬁrst-order in dt and second-order in dx, we have
dD.xC dx;tC dt/.x;t/
 @. x;t/
@t dtC
X
i
@.x;t/
@xi
dxiC1
2
X
i;j
 @2
@xi@xj

dxi dxj: (4.18)
In the deterministic case, we could ignore the second-order and higher-
order terms, because d x dxT would already be of the order d t2. Thus the
deterministic counterpart is
dD @
@t dtC@
@x dx: (4.19)
In the stochastic case, we know that d x dxT is potentially of order dt, be-
cause dˇ dˇT is of the same order. This implies that we need to retain the
second-order term also.
Example 4.3 (Itô differential of ˇ2.t/=2). If we apply the Itô formula to
.x/D 1
2x2, withx.t/Dˇ.t/, whereˇ.t/ is a standard Brownian motion,
we get
dDˇ dˇC1
2 dˇ2Dˇ dˇC1
2 dt; (4.20)
as expected.
Example 4.4 (Itô differential of sin.!x/ ). Assume thatx.t/ is the solution
to the scalar SDE
dxDf.x/ dtC dˇ; (4.21)


## Page 57

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.3 Explicit Solutions to Linear SDEs 49
whereˇ.t/ is a Brownian motion with diffusion constantq. The Itô differ-
ential of sin.!x.t// , where! >0 is a constant, is then given as
dŒsin.!x/ D! cos.!x/ dx1
2!2 sin.!x/ dx2
D! cos.!x/Œf.x/ dtC dˇ1
2!2 sin.!x/Œf.x/ dtC dˇ2
D! cos.!x/Œf.x/ dtC dˇ1
2!2 sin.!x/q dt: (4.22)
4.3 Explicit Solutions to Linear SDEs
In this section, we derive the full solution to a general time-varying linear
SDE. The SDE is assumed to have the form
dxD F.t/ x dtC u.t/ dtC L.t/ dˇ; (4.23)
where x.t/2 RD is the state, u.t/2 RD is an input, and ˇ.t/2 RS is a
Brownian motion with diffusion matrixQ. The initial condition is assumed
to be given as a distribution or ﬁxed value forx.t0/, and it is assumed to be
independent ofˇ.
We can now proceed by deﬁning a transition matrix‰.;t/ in the same
way as we did in Equation (2.34). Multiplying the preceding SDE with the
integrating factor‰.t0;t/ and rearranging gives
‰.t0;t/ dx‰.t0;t/ F.t/ x dtD‰.t0;t/ u.t/ dtC‰.t0;t/ L.t/ dˇ:
(4.24)
Applying the Itô formula and the properties of the integrating factor gives
dŒ‰.t0;t/ xD‰.t0;t/ F.t/ x dtC‰.t0;t/ dx: (4.25)
Thus the SDE in Equation (4.24) can be rewritten as
dŒ‰.t0;t/ xD‰.t0;t/ u.t/ dtC‰.t0;t/ L.t/ dˇ; (4.26)
where the differential is an Itô differential. Integration (in the Itô sense)
fromt0 tot gives
‰.t0;t/ x.t/‰.t0;t0/ x.t0/
D
Z t
t0
‰.t0;/ u./ dC
Z t
t0
‰.t0;/ L./ dˇ./; (4.27)


## Page 58

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
50 Itô Calculus and Stochastic Differential Equations
which can be further written in the form
x.t/D‰.t;t0/ x.t0/C
Z t
t0
‰.t;/ u./ dC
Z t
t0
‰.t;/ L./ dˇ./:
(4.28)
This is the desired full solution of the linear SDE.
In the case of a linear time-invariant SDE
dxD F x dtC L dˇ; (4.29)
where F and L are constants, andˇ has a constant diffusion matrix Q, the
solution simpliﬁes to
x.t/D exp.F.tt0// x.t0/C
Z t
t0
exp.F.t// L dˇ./: (4.30)
By comparing this to Equation (3.37) in Section 3.3, this solution is exactly
what we would have expected – it is what we would obtain if we formally
replaced w./ d with dˇ./ in the deterministic solution. However, it is
just because the use of the Itô formula in Equation (4.25) happened to
result in the same result as a deterministic differentiation would. In the
nonlinear case, we cannot expect to get the right result with this kind of
formal replacement.
Example 4.5 (Solution of the Ornstein–Uhlenbeck process). The complete
solution to the scalar SDE
dxDx dtC dˇ; x.0/ Dx0; (4.31)
where>0 is a given constant andˇ.t/ is a Brownian motion, is
x.t/D exp.t/x 0C
Z t
0
exp..t// dˇ./: (4.32)
Let us choose the parameter values D 1=2 andx0D 4. The solution,
called the Ornstein–Uhlenbeck process, is illustrated in Figure 4.2.
It is also possible to extend the preceding results to linear SDEs with
multiplicative noise, which in general can be written as
dxD F.t/ x dtC u.t/ dtC L.t/ dˇC
X
i
Bi.t/x i dˇ: (4.33)
However, the solutions to these equations are no longer Gaussian pro-
cesses, and constructing the solutions is not as straightforward as with
additive noise. For that reason, in this book, we only brieﬂy discuss the
multiplicative noise case and guide the reader to the books of Karatzas and


## Page 59

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.3 Explicit Solutions to Linear SDEs 51
0 0:2 0:4 0:6 0:8 1
0 2 4
Time, t
x.t /
Realizations
Mean
95% quantiles
Figure 4.2 Simulated realizations, the mean, and 95% quantiles
of an Ornstein–Uhlenbeck process withD 1=2 andx0D4
from Example 4.5.
Shreve (1991), Kloeden and Platen (1999), and Gardiner (2004) for more
information.
In the linear time-invariant scalar case the solution to a multiplicative
noise SDE is quite simple, as is illustrated in the following example.
Example 4.6 (Linear time-invariant model with multiplicative noise). The
solution to the SDE
dxD.axCc/ dtC.bxCd/ dˇ; x.0/ Dx0; (4.34)
wherea,b,c, andd are constants andˇ is a standard Brownian motion,
is given as (see Kloeden and Platen, 1999)
x.t/D .t/

x0C.cbd/
Z t
0
1
 .s/ dsCd
Z t
0
1
 .s/ dˇ.s/

;
(4.35)
where
 .t/D exp

a1
2b2

tCbˇ.t/

: (4.36)
In ﬁnancial applications, scalar linear SDEs with multiplicative noise are
quite typical, because they can be used to model processes that are strictly
positive. An example of such an SDE is the Black–Scholes model.


## Page 60

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
52 Itô Calculus and Stochastic Differential Equations
Example 4.7 (Black–Scholes solution). Following the results from the pre-
vious example (Example 4.6), the Black–Scholes model considered in Ex-
ample 3.8 has the solution
x.t/D exp

1
22

tCˇ.t/

x0: (4.37)
4.4 Finding Solutions to Nonlinear SDEs
Let us now turn our attention to nonlinear SDEs of the form
dxD f.x;t/ dtC L.x;t/ dˇ; (4.38)
where x.t/ 2 RD is the state, f.x;t/ is a given vector-valued nonlinear
function, L.x;t/ a given matrix-valued function, andˇ.t/2 RS is a Brow-
nian motion with diffusion matrix Q. The initial condition is assumed to
be given for x.t0/ as a distribution or ﬁxed value, and it is assumed to be
independent of the Brownian motionˇ.
For this kind of nonlinear SDEs, we do not have any general method for
ﬁnding the exact solution. However, one way to proceed is to try to deter-
mine the solution to the corresponding deterministic ODE ﬁrst. Then one
can attempt to apply the Itô formula to the deterministic solution to check
if the solution also applies to the stochastic case. This approach indeed
works for linear SDEs, and this is why we were able to correctly determine
the solutions to linear SDEs in Chapter 3 even before we had the proper
theory of SDEs at hand. However, more generally, it is hard to even solve
nonhomogeneous deterministic ODEs in the nonlinear case, and hence this
approach is hard to apply in practice.
The preceding approach is also a special case of an ansatz or educated
guess–based approaches. That is, one way to solve a nonlinear SDE is to
guess the solution and then use the Itô formula to check it. It is easy to
see that this approach is quite limited. However, this approach can be used
to determine solvable classes of the SDEs by applying the Itô formula to
arbitrary functions of Brownian motions, but using the approach to solve
a given SDE is hard. For a list of solution–SDE pairs, see, for example,
Kloeden and Platen (1999).
Example 4.8 (Matching a nonlinear SDE to a solution). Let us say that the
solution to our SDE is
x.t/D sin.!ˇ.t//; (4.39)
where! > 0is a constant and ˇ.t/ has the diffusion constant q. The Itô


## Page 61

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.4 Finding Solutions to Nonlinear SDEs 53
formula then gives
dxD! cos.!ˇ/ dˇ1
2q! 2 sin.!ˇ/
D!
p
1x2.t/ dˇ1
2q! 2x.t/ dt: (4.40)
That is, if we had been given an SDE of the form
dxD 1
2q! 2x.t/ dtC!
p
1x2.t/ dˇ; x.0/ D0; (4.41)
we could start our solution attempt by using an ansatzx.t/D sin.!ˇ.t// .
Further examples of solvable SDEs constructed this way can be found in
the book of Kloeden and Platen (1999).
One quite generic approach for solving nonlinear SDEs is by change of
variables. In that approach, we do a change of variables such thatyD h.x/
for some nonlinear function h. The goal is that the SDE in terms of y
should be easier to solve than the SDE in x. In practice, this usually means
that we aim to transform the SDE into a linear SDE, which we then are
able to solve. Furthermore, this approach mainly works for scalar SDEs.
As a generic class of scalar SDEs where the preceding approach can be
used, Kloeden and Platen (1999) give
dxD

˛b.x/h.x/ C1
2qb.x/ db
dx

dtCb.x/ dˇ; x.0/ Dx0; (4.42)
where˛ is a constant,b.x/ is a given function,ˇ.t/ is a Brownian motion
with the diffusion coefﬁcientq, and
h.x/D
Z x

1
b.u/ du; (4.43)
where is an arbitrary point. The equation can now be solved by the change
of variableyDh.x/. By using the Itô formula, we get thaty should solve
dyD˛y dtC dˇ; (4.44)
and hence the ﬁnal solution is
x.t/Dh1

exp.˛t/h.x 0/C
Z t
0
exp.˛.t s// dˇ.s/

: (4.45)
Example 4.9 (Nonlinear scalar SDE). The SDE
dxD

˛x logxC1
2x

dtCx dˇ; x.0/ Dx0; (4.46)


## Page 62

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
54 Itô Calculus and Stochastic Differential Equations
whereˇ.t/ is a standard Brownian motion, is a special case of the previous
equation withb.x/Dx, and hence we geth.x/D logx and thus
x.t/D exp

exp.˛t/ logx0C
Z t
0
exp.˛.t s// dˇ.s/

: (4.47)
It is also possible to use the integrating factor method to solve certain
classes of nonlinear equations with multiplicative linear drift. For details
of this approach, see Henderson and Plaschko (2006). Furthermore, some
additional special cases of solvable SDEs can also be found, for example,
in the books of Kloeden and Platen (1999) and Iacus (2008).
4.5 Existence and Uniqueness of Solutions
A solution to a stochastic differential equation is calledstrong if for a given
Brownian motionˇ.t/, it is possible to construct a solution x.t/, which is
driven by the given Brownian motion. A solution is called weak if it is
possible to construct some Brownian motionQˇ.t/ and a stochastic process
Qx.t/ such that the pair is a solution to the stochastic differential equation.
The existence of a strong solution always implies the existence of a weak
solution (every strong solution is also a weak solution), but the converse is
not true.
The solution is strongly unique if the whole path of the process is unique
for a given Brownian motion. Hence strong uniqueness is also called path-
wise uniqueness. Weak uniqueness means that the probability law of the
solution is unique, that is, there cannot be two solutions with different
ﬁnite-dimensional distributions. Determining if an equation has a unique
weak solution when it does not have a unique strong solution is consider-
ably harder than the criterion for the strong solution (see, e.g., Ikeda and
Watanabe, 1981).
The strong uniqueness of a solution to an SDE of the general form
dxD f.x;t/ dtC L.x;t/ dˇ; x.t0/D x0; (4.48)
can be determined using the stochastic Picard iteration, which is a direct
extension of the deterministic Picard iteration. Thus we ﬁrst rewrite the
equation in integral form
x.t/D x0C
Z t
t0
f.x./;/ dC
Z t
t0
L.x./;/ dˇ./: (4.49)
Then the solution can be approximated with the following iteration.


## Page 63

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
4.6 Stratonovich Calculus 55
Algorithm 4.10 (Stochastic Picard iteration). Start from the initial guess
'0.t/D x0. With a givenˇ, compute approximations'1.t/;'2.t/;::: via
the following recursion:
'nC1.t/D x0C
Z t
t0
f.'n./;/ dC
Z t
t0
L.'n./;/ dˇ./: (4.50)
It can be shown that this iteration converges to the exact solution in a
mean squared sense if both of the functions f and L grow at most lin-
early in x and they are Lipschitz continuous in the same variable (see, e.g.,
Øksendal, 2003). If these conditions are met, there exists a unique strong
solution to the SDE.
4.6 Stratonovich Calculus
It is also possible to deﬁne a stochastic integral in such a way that the chain
rule from ordinary calculus is valid. The symmetrized stochastic integral
or the Stratonovich integral (Stratonovich, 1968) can be deﬁned as follows
(Protter, 2013):
Z t
t0
L.x.t/;t/ ıdˇ.t/D lim
n!1
X
k
L.x.t
k/;t
k/Œˇ.tkC1/ˇ.tk/; (4.51)
wheret0 <t 1 <:::<t nDt andt
kD .tkCtkC1/=2. The difference to
the Itô integral is that we do not select the starting point of the interval as
the evaluation point but the middle point. This ensures that the calculation
rules of ordinary calculus apply. The disadvantage of the Stratonovich inte-
gral over the Itô integral is that the Stratonovich integral is not a martingale
(we brieﬂy discuss them later), which makes its theoretical analysis harder.
Stratonovich stochastic differential equations (Stratonovich, 1968; Øk-
sendal, 2003; Protter, 2013) are similar to Itô differential equations, but
instead of Itô integrals they involve stochastic integrals in the Stratonovich
sense. To distinguish between Itô and Stratonovich stochastic differential
equations, the Stratonovich integral is denoted by a small circle before the
Brownian differential as follows:
dxD f.x;t/ dtC L.x;t/ ı dˇ: (4.52)
The white noise interpretation of SDEs naturally leads to stochastic dif-
ferential equations in the Stratonovich sense. This is because, broadly
speaking, discrete-time and smooth approximations of white noise–driven
differential equations converge to stochastic differential equations in the
Stratonovich sense, not in the Itô sense. However, this result of Wong and


## Page 64

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
56 Itô Calculus and Stochastic Differential Equations
Zakai (1965) is strictly true only for scalar SDEs, and thus this result should
not be extrapolated too far.
A Stratonovich SDE can be converted into an equivalent Itô equation
by using simple transformation formulas (Stratonovich, 1968; Øksendal,
2003). If the dispersion term is independent of the state L.x;t/ D L.t/,
then the Itô and Stratonovich interpretations of the SDE are the same.
Algorithm 4.11 (Conversion of Stratonovich SDEs to Itô SDEs). The fol-
lowing SDE in the Stratonovich sense
dxD f.x;t/ dtC L.x;t/ ı dˇ; (4.53)
is equivalent to the following SDE in the Itô sense
dxDQf.x;t/ dtC L.x;t/ dˇ; (4.54)
where
Qfi.x;t/ Dfi.x;t/C1
2
X
j;l
@Lij.x;t/
@xl
Llj.x;t/: (4.55)
It is also possible to deﬁne other forms of stochastic integrals and calculi
by evaluating the integrand at a point t
k D .1˛/tkC˛tkC1, where
˛2 Œ0;1 . With the selection ˛D 0, we get the Itô calculus, and with
˛D 1=2, we get the Stratonovich calculus as special cases. More details
can be found, for example, in Protter (2013).
4.7 Exercises
4.1 The Itô formula:
(a) Compute the Itô differential of .ˇ;t/ D tC exp.ˇ/, where ˇ.t/ is a
Brownian motion with diffusion constantq.
(b) Compute the Itô differential of .x/ D x2, where x solves the scalar
SDE
dxDf.x/ dtCL dˇ;
the parameterL is a constant, and ˇ.t/ is a standard Brownian motion
(qD1).
(c) Compute the Itô differential of .x/D xT x, where
dxD F x dtC dˇ;
where F is a constant matrix and the diffusion matrix ofˇ is Q.


## Page 65

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 57
4.2 Check that
x.t/D exp.ˇ.t//
solves the SDE
dxD 1
2x dtCx dˇ;
whereˇ.t/ is a standard Brownian motion (qD1).
4.3 Consider the Black–Scholes model
dxDx dtCx dˇ;
where and >0 are constants, andˇ.t/ is a standard Brownian motion.
(a) Solve x.t/ by changing the variable to y D logx and transforming
back.
(b) Notice that the solution is log-normal and compute its mean m.t/ and
varianceP.t/ .
(c) Compare (and check) your expressions for the mean and variance
against the numerical results obtained by the Euler–Maruyama method
(cf. Exercise 3.4).
4.4 Find the solution to the mean-reverting Ornstein–Uhlenbeck process given in
a parameterization favoured in ﬁnancial applications (in ﬁnance, the model
is known as the Vasicek model):
dxD.x/ dtC dˇ.t/; x.0/ Dx0; (4.56)
where gives the speed of reversion, is the long-run equlibrium, stands
for the volatility, and ˇ.t/ is a standard Brownian motion with diffusion
coefﬁcientqD1.
4.5 Derive the Black–Scholes solution given in Example 4.7 from the solution
given for linear time-invariant models with multiplicative noise in Exam-
ple 4.6.
4.6 Consider the nonlinear SDE:
dxD tanh.x/

aC1
2b2 sech2.x/

dtCb sech.x/ dˇ;
whereˇ.t/ is a standard Brownian motion. Solve it using the methods given
for one-dimensional nonlinear SDEs in Section 4.4.
Hint: Tryh.x/D sinh.x/.
4.7 It is also possible to derive an integration by parts formula for Itô processes.
Letˇ.t/ be a standard Brownian motion.
(a) By computing the Itô differential of.ˇ/.ˇ/ and integrating the result,


## Page 66

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
58 Itô Calculus and Stochastic Differential Equations
show that the following holds:
Z t
0
@.x/
@x .x/

xDˇ./
dˇ./
D.ˇ.t//.ˇ.t// .0/.0/
Z t
0

.x/ @.x/
@x

xDˇ./
dˇ./
1
2
Z t
0
@2.x/
@x2 .x/C2@.x/
@x
@.x/
@x C.x/ @2.x/
@x2

xDˇ./
dt:
(b) Use this result to express the following integral in terms of ordinary
integrals (hint: put.x/D1):
Z t
0
tanh.ˇ/ dˇ:
4.8 Convert the following Stratonovich SDE into the equivalent Itô SDE:
dxD tanh.x/ dtCxı dˇ;
whereˇ.t/ is a scalar Brownian motion.
4.9 Convert the following Stratonovich SDE into the equivalent Itô SDE:
dx1Dx2ı dˇ;
dx2D x1ı dˇ;
whereˇ.t/ is a scalar Brownian motion.


## Page 67

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5
Probability Distributions and Statistics of
SDEs
The solutions of SDEs are stochastic processes, and therefore their solu-
tions have certain probability distributions and statistics. In this chapter,
we start by brieﬂy discussing martingale properties of Itô processes (see,
e.g., Rogers and Williams, 2000a,b, for the full theory) and discuss gen-
erators of SDEs that are related to statistics of SDEs. We then proceed to
deriving the Fokker–Planck–Kolmogorov equation, which is a partial dif-
ferential equation for the evolution of the probability density of the SDE
solution. We also discuss the Markov properties and the transition densities
of SDEs as well as derive the general equations for the means, covariances,
and other moments of SDEs.
5.1 Martingale Properties and Generators of SDEs
In this section, we discuss martingale properties and generators of Itô pro-
cesses, which are important concepts in theoretical analysis of SDEs. We
denote the history of the Itô process x.t/ up to the timet as
XtDf x./j0tg: (5.1)
More formally, the history of an Itô process should not be deﬁned through
its explicit path, but via the sigma-algebra generated by it (see, e.g., Øk-
sendal, 2003). The history as a function of increasing t is then an ob-
ject called ﬁltration, which means an increasing family of sigma-algebras.
However, for pedagogical reasons we simply talk about the history of an
Itô process.
The deﬁnition of a martingale is the following.
Deﬁnition 5.1 (Martingale). A stochastic process x.t/ with bounded ex-
pectation EŒjx.t/j< 1 is called a martingale if
EŒx.t/j XsD x.s/; for allts: (5.2)
59


## Page 68

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
60 Probability Distributions and Statistics of SDEs
It turns out that all Itô integrals are martingales, and this follows from the
fact that Brownian motion is a martingale as well. However, solutions to Itô
SDEs are martingales only if the drift f.x;t/ D 0. For more information
on martingales and their role in stochastic calculus, the reader is referred
to the books of Øksendal (2003), Karatzas and Shreve (1991), and Rogers
and Williams (2000a,b).
Another useful concept in the theory of Itô processes and more general
stochastic processes is the (inﬁnitesimal) generator, which in the case of
Itô processes is the following.
Deﬁnition 5.2 (Generator). The (inﬁnitesimal) generator of a stochastic
process x.t/ for a function.x/ can be deﬁned as
A.x/D lim
s#0
EŒ.x.tCs//.x.t//
s ; (5.3)
where./ is a suitably regular function. For an Itô process deﬁned as the
solution to the SDE
dxD f.x;t/ dtC L.x;t/ dˇ; (5.4)
the generator (operating on some function) is given as
A./D
X
i
@./
@xi
fi.x;t/
C1
2
X
i;j
 @2./
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij: (5.5)
For a time-invariant stochastic process (such as a time-invariant SDE), we
can also equivalently deﬁne
A.x/D lim
t#0
EŒ.x.t//.x.0//
t ; (5.6)
which is the classical deﬁnition and equivalent when the SDE does not
explicitly depend on time (i.e., when f.x/ and L.x/ only depend on x).
We can also deﬁne a similar operator for time-dependent functions
.x;t/ as follows. Because generators are not classically deﬁned this way,
we call the operator the generalized generator.
Deﬁnition 5.3 (Generalized generator) . The generalized (inﬁnitesimal)
generator for a time-dependent process for a time-dependent function


## Page 69

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.2 Fokker–Planck–Kolmogorov Equation 61
.x;t/ can be deﬁned as
At.x;t/ D lim
s#0
EŒ.x.tCs/;t Cs/.x.t/;t/
s ; (5.7)
which for the solution of the time-dependent SDE
dxD f.x;t/ dtC L.x;t/ dˇ (5.8)
is given as (note the appearance of the time derivative in the beginning)
At./D @./
@t C
X
i
@./
@xi
fi.x;t/
C1
2
X
i;j
 @2./
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij: (5.9)
5.2 Fokker–Planck–Kolmogorov Equation
In this section, we derive the equation for the probability density of an Itô
process x.t/, when the process is deﬁned as the solution to the SDE
dxD f.x;t/ dtC L.x;t/ dˇ; (5.10)
where x.t/ 2 RD is the state, f.x;t/ is a given vector-valued function,
L.x;t/ is a given matrix-valued function, and ˇ.t/ 2 RS is a Brownian
motion with diffusion matrix Q. The initial condition is x.t0/p.x.t0//,
and it is assumed to be independent of the Brownian motion.
The corresponding probability density is usually denoted asp.x.t//, but
in this section, to emphasize that the density is actually a function of both
x andt, we will occasionally write it asp.x;t/ .
Theorem 5.4 (Fokker–Planck–Kolmogorov equation). The probability
density p.x;t/ of the solution of the SDE in Equation (5.10) solves the
partial differential equation (PDE):
@p.x;t/
@t D
X
i
@
@xi
Œfi.x;t/p. x;t/
C1
2
X
i;j
@2
@xi@xj
˚
ŒL.x;t/ Q LT.x;t/ ijp.x;t/

: (5.11)
This PDE is here called the Fokker–Planck–Kolmogorov (FPK) equation.
In physics literature, it is often called the Fokker–Planck equation, and in
stochastics it is the forward Kolmogorov equation, hence the name. With


## Page 70

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
62 Probability Distributions and Statistics of SDEs
the probability densityp.x.t0// ,p.x;t0/ on the state initial state x.t0/,
the PDE is an initial value problem with the given initial conditionp.x;t0/
at timetDt0.
Proof Let.x/ be an arbitrary twice differentiable function. The Itô dif-
ferential of.x.t// is, by the Itô formula, given as follows:
dD
X
i
@
@xi
dxiC1
2
X
i;j
 @2
@xi@xj

dxi dxj
D
X
i
@
@xi
fi.x;t/ dtC
X
i
@
@xi
ŒL.x;t/ dˇi
C1
2
X
i;j
 @2
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij dt: (5.12)
Taking the expectation of both sides with respect tox and formally dividing
by dt gives the following:
d EŒ
dt D
X
i
E
@
@xi
fi.x;t/

C1
2
X
i;j
E
 @2
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij

: (5.13)
The left-hand side can now be written as
d EŒ
dt D d
dt
Z
.x/p. x;t/ dx
D
Z
.x/@p.x;t/
@t dx: (5.14)
Recall the multidimensional integration by parts formula
Z

@u.x/
@xi
v.x/ dxD
Z
@
u.x/v. x/ni dS
Z

u.x/@v.x/
@xi
dx; (5.15)
where n is the outer normal of the boundary @ of integration domain
and dS is its area element. As the integration area is wholeRD, the bound-
ary term on the right-hand side should vanish and the formula becomes
Z @u.x/
@xi
v.x/ dxD
Z
u.x/@v.x/
@xi
dx: (5.16)


## Page 71

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.2 Fokker–Planck–Kolmogorov Equation 63
For the ﬁrst term on the right-hand side of Equation (5.13), we now get
E
@
@xi
fi.x;t/

D
Z @
@xi
fi.x;t/p. x;t/ dx
D
Z
.x/ @
@xi
Œfi.x;t/p. x;t/ dx; (5.17)
where we have used the integration by parts formula with u.x/D .x/
andv.x/Dfi.x;t/p. x;t/ . For the second term, we get the following:
E
 @2
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij

D
Z  @2
@xi@xj

ŒL.x;t/ Q LT.x;t/ ijp.x;t/ dx
D
Z @
@xj
 @
@xi
˚
ŒL.x;t/ Q LT.x;t/ ijp.x;t/

dx
D
Z
.x/ @2
@xi@xj
˚
ŒL.x;t/ Q LT.x;t/ ijp.x;t/

dx; (5.18)
where we have ﬁrst used the integration by parts formula with u.x/D
@. x/=@xj andv.x/DŒL.x;t/ Q LT.x;t/ ijp.x;t/ , and then again with
u.x/D.x/ andv.x/D @
@xi
fŒL.x;t/ Q LT.x;t/ ijp.x;t/g.
If we substitute Equations (5.14), (5.17), and (5.18) into (5.13), we get
Z
.x/@p.x;t/
@t dxD
X
i
Z
.x/ @
@xi
Œfi.x;t/p. x;t/ dx
C1
2
X
i;j
Z
.x/ @2
@xi@xj
fŒL.x;t/ Q LT.x;t/ ijp.x;t/g dx; (5.19)
which can also be written as
Z
.x/
@p.x;t/
@t C
X
i
@
@xi
Œfi.x;t/p. x;t/
1
2
X
i;j
@2
@xi@xj
fŒL.x;t/ Q LT.x;t/ ijp.x;t/g

dxD0: (5.20)
The only way this equation can be true for an arbitrary .x/ is if the term
in the brackets vanishes, which gives the FPK equation.
Example 5.5 (Diffusion equation). In Example 3.1, we derived the diffu-
sion equation by considering random Brownian movement occurring dur-
ing small time intervals. Note that Brownian motion can be deﬁned as a


## Page 72

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
64 Probability Distributions and Statistics of SDEs
solution to the SDE
dxD dˇ: (5.21)
If we set the diffusion constant of the Brownian motion to beqD2D , then
the FPK reduces to
@p
@t DD@2p
@x2; (5.22)
which is the same result as in Equation (3.7).
When the SDE is time independent, that is, has the form
dxD f.x/ dtC L.x/ dˇ; (5.23)
the solution to the FPK often converges to a stationary solution that satisﬁes
@p.x;t/=@t D 0. If we denote this stationary solution as p.x/, then it
should be the solution to the stationary FPK equation

X
i
@
@xi
Œfi.x/p. x/
C1
2
X
i;j
@2
@xi@xj
˚
ŒL.x/ Q LT.x/ijp.x/

D0: (5.24)
Even though in general solving this equation is hard, solving the stationary
probability densityp.x/ is tractable if the SDE happens to have the special
form
dxD 1
2rv.x/ dtC dˇ; (5.25)
where v.x/ is a potential function such that the drift function f.x/ D
rv.x/ andˇ.t/ is a Brownian motion with diffusion matrix QD q I
for someq>0 . We have the following theorem.
Theorem 5.6 (Stationary solution to FPK). The stationary solution to the
FPK equation corresponding to (5.25) is given as
p.x/D 1
Z exp.v.x/=q/; (5.26)
where the normalization constant is
ZD
Z
exp.v.x/=q/ dx: (5.27)
For more general stationary FPK solutions the reader is referred to the
book by Gardiner (2004).


## Page 73

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.3 Operator Formulation of the FPK Equation 65
Example 5.7 (Stationary distribution of the Ornstein–Uhlenbeck process).
The Ornstein–Uhlenbeck process (see Example 4.5) has the form (5.25)
withv.x/Dx2. Hence the stationary solution should have the form
p.x// exp

x2
q

; (5.28)
which is the probability density of a normal distribution with zero mean
and variance q=2.
5.3 Operator Formulation of the FPK Equation
In this section, we discuss the derivation and interpretation of the FPK
equation using operator theory. This operator point of view allows us to
gain insight on what actually happened in the FPK derivation in the previ-
ous section. Let us deﬁne the L2 inner product between two functions 
and' as follows:
h;'iD
Z
.x/'. x/ dx: (5.29)
The expectation of a function .x.t// can now be written in terms of the
inner product as
EŒ.x.t//Dh;pi; (5.30)
wherepD p.x;t/ . This also means that Equation (5.13), which was de-
rived from the Itô formula, can be compactly written as
d
dth;piDh A;pi; (5.31)
where A is the generator deﬁned in Equation (5.5).
Recall that the (formal) adjoint of an operator A – with respect to the
given inner product – is deﬁned to be an operator A such that for all 
and' we have
hA;'iDh ; A'i: (5.32)
Using the adjoint operator, we can now write Equation (5.31) as
d
dth;piDh ; Api: (5.33)
As is independent of time, this can also be written as
h;@p
@tiDh ; Api: (5.34)


## Page 74

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
66 Probability Distributions and Statistics of SDEs
Because can be arbitrary, the preceding can only be true if in fact
@p
@t D Ap: (5.35)
It now turns out that the adjoint operator A is
A./D
X
i
@
@xi
Œfi.x;t/./
C1
2
X
i;j
@2
@xi@xj
fŒL.x;t/ Q LT.x;t/ ij./g; (5.36)
which is exactly the operator appearing in the Fokker–Planck–Kolmogorov
equation in Theorem 5.4 and hence Equation (5.35) is in fact the Fokker–
Planck–Kolmogorov equation. In the previous section, we used brute-force
integration by parts to derive the adjoint of the operator A. We could also
have used the properties of the adjoints directly as is illustrated in the fol-
lowing example.
Example 5.8 (Operator adjoint derivation of FPK). Let us consider a one-
dimensional SDE
dxDf.x/ dtCL.x/ dˇ; (5.37)
in which case the operator A takes the form
ADf.x/ @
@xC1
2L2.x/q @2
@x2: (5.38)
Now recall the followingL2 adjoint computation rules:
 The operation of multiplication with a function f.x/ is its own adjoint
(i.e., the operator is self-adjoint).
 The operation of differentiation obeys
 @
@x

D @
@x and hence the sec-
ond derivative operator is self-adjoint

@2
@x2

D @2
@x2 .
 The adjoint of a sum is.A1C A2/D A
1C A
2 and the product of two
operators is.A1 A2/D A
2 A
1.


## Page 75

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.4 Markov Properties and Transition Densities of SDEs 67
Thus we get
hA;piDh

f.x/ @
@xC1
2L2.x/q @2
@x2

;pi
Dhf.x/ @
@x;piC 1
2qhL2.x/ @2
@x2;pi
Dh @
@x;f.x/p iC 1
2qh @2
@x2;L2.x/pi
Dh; @
@xf.x/piC 1
2qh; @2
@x2L2.x/pi
Dh; @
@xf.x/p C1
2q @2
@x2L2.x/pi; (5.39)
where we can thus recover the adjoint operator
A./D @
@x Œf.x/./C1
2q @2
@x2

L2.x/./

: (5.40)
Note that Equation (5.35) resembles a linear differential equation of the
form dx.t/=dtD A x.t/, which we can easily solve asx.t/D exp.A.t
t0// x.t0/, where exp./ is the matrix exponential. Analogously, when A
does not explicitly depend on time we can (at least formally) express the
solution to the FPK as
p.;t/ D exp.A.tt0//p.;t0/; (5.41)
where exp./ is now the exponential of an operator. The operator exp.At/
is actually the semigroup generated by the operator A, which can be rig-
orously deﬁned. The kernel of the semigroup operator is sometimes called
the propagator in physics.
5.4 Markov Properties and Transition Densities of SDEs
In this section, we cover the Markov property of Itô processes and the
corresponding transition kernels. The deﬁnition of aMarkov process is the
following.
Deﬁnition 5.9 (Markov process). A stochastic process x.t/ is a Markov
process if its future is independent of its past given the present:
p.x.t/j Xs/Dp.x.t/j x.s//; for allts: (5.42)
It turns out that all Itô processes, that is, solutions to Itô stochastic differ-
ential equations, are Markov processes. The proof of this can be found, for


## Page 76

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
68 Probability Distributions and Statistics of SDEs
example, in Øksendal (2003, theorem 7.1.2). This means that all Itô pro-
cesses are, in a probabilistic sense, completely characterized by the tran-
sition densitiesp.x.t/j x.s//. The transition density is also a solution to
the Fokker–Planck–Kolmogorov equation with a degenerate (Dirac delta)
initial density concentrated on x.s/ at times.
Theorem 5.10 (Transition density of an SDE) . The transition density
p.x.t/ j x.s// of the SDE (5.10), where t  s, is the solution to
the Fokker–Planck–Kolmogorov equation(5.11) with the initial condition
p.x.t/j x.s//Dı.x.t/ x.s// attDs. More explicitly, if we denote the
transition density from y.s/ to x.t/ asp.x;t j y;s/ , then it solves
@p.x;t j y;s/
@t D Ap.x;t j y;s/; p. x;sj y;s/Dı.x y/; (5.43)
where A was deﬁned in Equation(5.36).
The transition density also satisﬁes another equation, the backward Kol-
mogorov equation (recall that FPK is also called the forward Kolmogorov
equation).
Theorem 5.11 (Backward Kolmogorov equation). If we denote the transi-
tion density from x.s/ to y.t/ asp.y;t j x;s/ , then it solves the backward
Kolmogorov equation
@p.y;t j x;s/
@s D Ap.y;t j x;s/; p. y;sj x;s/Dı.y x/; (5.44)
where A is the generator deﬁned in Equation(5.5).
Once we know the transition densities of an SDE, we can also use
Markov properties to form an explicit formula for the ﬁnite-dimensional
distributions of the SDE.
Remark 5.12 (Finite-dimensional distributions of SDEs). For an arbitrary
ﬁnite set of time indicest0<t 1<:::<t T , the joint distribution of the val-
ues of the process (i.e., the ﬁnite-dimensional distribution) is characterized
by the probability density
p.x.t0/; x.t1/;:::; x.tT//Dp.x.t0//
TY
kD1
p.x.tk/j x.tk1//: (5.45)
The preceding result is important in Bayesian ﬁltering theory (Särkkä,
2013), because it states that a Bayesian ﬁltering problem on an SDE model


## Page 77

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.5 Means and Covariances of SDEs 69
with discrete time measurements can always be converted into an equiva-
lent discrete-time Bayesian ﬁltering problem. We will return to this in the
later chapters.
Remark 5.13 (Chapman–Kolmogorov equation). The Markov property
also implies that the transition densities have the following group prop-
erty. For any three time instants t1 < t2 < t3, we have the Chapman–
Kolmogorov equation
p.x.t3/j x.t1//D
Z
p.x.t3/j x.t2//p. x.t2/j x.t1// dx.t2/: (5.46)
Although the Chapman–Kolmogorov equation follows from the FPK
equation, it is also possible to derive the FPK equation from it as was done,
for example, in Jazwinski (1970). Thus, in that sense, they are equivalent.
5.5 Means and Covariances of SDEs
In Section 5.2, we derived the FPK equation, which, in principle, is the
complete probabilistic description of the state. The mean, covariance, and
other moments of the state distribution can be derived from its solution.
However, we are often primarily interested in the mean and covariance of
the distribution and would like to avoid solving the FPK equation as an
intermediate step.
If we take a look at Equation (5.13) in Section 5.2, we can see that
it can be interpreted as an equation for the general moments of the state
distribution. This equation can be generalized to time-dependent .x;t/
by including the time derivative (i.e., by replacing the generator on the
right-hand side with generalized generator in Deﬁnition 5.3):
d EŒ
dt D E
@
@t

C
X
i
E
@
@xi
fi.x;t/

C1
2
X
i;j
E
 @2
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij

: (5.47)
If we select the function as .x;t/ D xu (theuth component of x), then
the Equation (5.47) reduces to
d EŒxu
dt D EŒfu.x;t/; (5.48)
which can be seen as the differential equation for the components of the
mean of the state. If we denote the mean function as m.t/D EŒx.t/ and


## Page 78

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
70 Probability Distributions and Statistics of SDEs
select the function as.x;t/ Dxuxvmu.t/m v.t/, then Equation (5.47)
gives
d EŒxuxvmu.t/m v.t/
dt
D EŒ.xvmv.t//f u.x;t/C EŒ.xumu.v//fv.x;t/
CŒL.x;t/ Q LT.x;t/ uv: (5.49)
If we denote the covariance as P.t/D EŒ.x.t/ m.t//. x.t/ m.t// T,
then Equations (5.48) and (5.49) can be written in the following matrix
form:
dm
dt D EŒf.x;t/; (5.50)
dP
dt D E

f.x;t/. x m/T
C E

.x m/ f T.x;t/

C E

L.x;t/ Q LT.x;t/

; (5.51)
which are the differential equations for the mean and covariance of the
state. However, these equations cannot be used in practice as such, because
the expectations should be taken with respect to the actual distribution of
the state – which is given by the solution to the FPK equation. Only in the
Gaussian case do the ﬁrst two moments actually characterize the solution.
Even though we cannot use these equations as such in the nonlinear case,
they provide a useful starting point for forming Gaussian approximations
to SDEs.
It is worth noting that because E ŒEŒf.x;t/. x m/TD 0, it follows
that
E

f.x;t/. x m/T
D E

.f.x;t/ EŒf.x;t//. x m/T
; (5.52)
and hence the covariance equation can be equivalently written as
dP
dt D E

.f.x;t/ EŒf.x;t//. x m/T
C E

.x m/. f.x;t/ EŒf.x;t// T
C E

L.x;t/ Q LT.x;t/

; (5.53)
which is useful, for example, when deriving the equations for linear SDEs.
Example 5.14 (Moments of the Ornstein–Uhlenbeck process) . Let us


## Page 79

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.5 Means and Covariances of SDEs 71
again consider the Ornstein–Uhlenbeck process, which we solved in Ex-
ample 4.5:
dxDx dtC dˇ; x.0/ Dx0; (5.54)
where>0 andˇ.t/ is a Brownian motion with diffusion constantq. We
havef.x/Dx and thus
EŒf.x/D EŒxDm;
EŒf.x/.x m/D EŒx.x m/D EŒ.xm/2DP:
(5.55)
The differential equations for the mean and variance are thus given as
dm
dt Dm;
dP
dt D2P Cq;
(5.56)
with the initial conditions m.0/D x0, P.0/ D 0. Because the solution
of the Ornstein–Uhlenbeck process is a Gaussian process, these ﬁrst two
moments characterize the whole state distribution, which has the density
p.x;t/ ,p.x.t//D N.x.t/jm.t/;P.t//: (5.57)
As discussed previously, in the case of a nonlinear SDE it often happens
that the mean and covariance differential equations are not closed in the
sense that only with knowledge of the mean and covariance it is not possi-
ble to compute the expectations on the right-hand side of the equations. An
example of that kind of SDE is given in the following example.
Example 5.15 (Moments of the sine diffusion model) . An example of a
nonlinear SDE, which is often used for demonstrating numerical methods
for SDEs, is
dxD sin.x/ dtC dˇ; (5.58)
whereˇ.t/ is a Brownian motion with diffusion constantq. The mean and
variance equations are now given as
dm
dt D EŒsin.x/;
dP
dt D2 EŒsin.x/.xm/Cq:
(5.59)
With knowledge of only the mean and variance of x, it is impossible to


## Page 80

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
72 Probability Distributions and Statistics of SDEs
compute the expectations on the right-hand side. This is because the ex-
pectation of sin.x/ depends on the higher-order moments of x, which we
cannot know without knowing the full distribution ofx:
sin.x/Dxx3
3ŠCx5
5ŠC : (5.60)
It also sometimes happens that even though the process is non-Gaussian,
it is still possible to solve the mean and covariance from a closed set of dif-
ferential equations. This happens, for example, in the case of linear SDEs
with multiplicative noise.
Example 5.16 (Statistics of the Black–Scholes model). Consider the fol-
lowing linear Black–Scholes SDE(3.31), which has multiplicative noise:
dxDx dtCx dˇ; (5.61)
whereˇ is a standard Brownian motion. We can now write down the mean
and variance equations as
dm
dt Dm;
dP
dt D2P C2PC2m2;
(5.62)
which can be solved to give the mean and variance of the solution at each
time step. However, unlike additive noise linear equations, the solution to
this SDE is not Gaussian.
5.6 Higher-Order Moments of SDEs
It is also possible to derive differential equations for the higher-order mo-
ments of SDEs. However, the required number of equations quickly be-
comes large, because if the state dimension is D, the number of indepen-
dent third moments is cubic, D3, in the number of state dimensions. The
number of fourth-order moments is quartic, D4, and so on. The general
moment equations can be found, for example, in the book of Socha (2008).
To illustrate the idea, let us consider the scalar SDE
dxDf.x/ dtCL.x/ dˇ: (5.63)
Recall that the expectation of an arbitrary twice differentiable function
.x/ satisﬁes
d EŒ.x/
dt D E
@.x/
@x f.x/

Cq
2 E
@2.x/
@x2 L2.x/

: (5.64)


## Page 81

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
5.7 Exercises 73
If we apply this to.x/Dxn, wheren2, we get
d EŒxn
dt Dn EŒxn1f.x;t/ Cq
2n.n1/ EŒxn2L2.x/; (5.65)
which, in principle, gives the equations for the third-order moments,
fourth-order moments, and so on. It is also possible to derive similar dif-
ferential equations for the central moments, cumulants, or quasimoments.
However, unlessf.x/ andL.x/ are linear (or afﬁne) functions, the equa-
tion for the nth-order moment depends on the moments of higher-order
(greater than n). Thus in order to actually compute the required expecta-
tions, we would need to integrate an inﬁnite number of moment equations,
which is impossible in practice. This problem can be approximately solved
by using moment closure methods, which typically are based on replac-
ing the higher-order moments (or cumulants or quasimoments) with suit-
able approximations. For example, it is possible to set the cumulants above
a certain order to zero, or to approximate the moments, cumulants, and
quasimoments with their steady-state values (Socha, 2008).
In the scalar case, given a set of moments, cumulants, or quasimoments,
it is possible to form a distribution that has these moments, cumulants, and
quasimoments, for example, as the maximum entropy distribution (Cover
and Thomas, 2006). Unfortunately, in the multidimensional case the situa-
tion is much more complicated.
5.7 Exercises
5.1 Write the generator A for the Beneš SDE
dxD tanh.x/ dtC dˇ; x.0/ D0; (5.66)
whereˇ.t/ is a standard Brownian motion.
5.2 FPK equation:
(a) Write down the FPK for the Beneš Equation (5.66), and check that the
following probability density solves it:
p.x;t/ D 1p
2t
cosh.x/ exp

1
2t

exp

1
2t x2

:
(b) Plot the evolution of the probability density when t2Œ0;5 .
(c) Simulate 1,000 trajectories from the SDE using the Euler–Maruyama
method and check visually that the histogram matches the correct den-
sity at timetD5.
5.3 Numerical solution of the FPK equation: Use a ﬁnite-differences method to
solve the FPK for the Beneš SDE in Equation (5.66). For simplicity, you can


## Page 82

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
74 Probability Distributions and Statistics of SDEs
select a ﬁnite rangex2ŒL;L and use the Dirichlet boundary conditions
p.L;t/ Dp.L;t/ D0.
(a) Divide the range to n grid points and lethD 2L=.nC1/ . On the grid,
approximate the partial derivatives ofp.x;t/ via
@p.x;t/
@x  p.xCh;t/p.xh;t/
2h ;
@2p.x;t/
@x2  p.xCh;t/2p.x;t/ Cp.xh;t/
h2 :
(b) Let p.t/D.p.hL;t/p.2h L;t/  p.nhL;t// T and from the
preceding, form an equation of the form
dp
dt D F p:
(c) Solve the preceding equation using (i) the implicit backward Euler
method, (ii) by numerical computation of exp.Ft/, and (iii) by the for-
ward Euler method. Check that the results match the solution in the
previous exercise.
5.4 Consider the Langevin model of Brownian motion (with mD1), which we
already considered in Example 3.2:
d2x
dt2 Dc dx
dt Cw; x.0/ D.dx=dt/.0/D0; (5.67)
wherecD6r and the white noisew.t/ has some spectral densityq.
(a) Interpret the preceding model as an Itô SDE and write it as a two-
dimensional state-space form SDE.
(b) Write down the differential equations for the elements of the mean m.t/
and covariance P.t/. Conclude that the mean is zero and ﬁnd the closed-
form solutions for the elements P11.t/,P12.t/,P21.t/, and P22.t/ of
the covariance matrix P.t/.
Hint: Start by solving P22.t/, then use it to ﬁnd the solutions for
P12.t/DP21.t/, and ﬁnally solveP11.t/.
(c) Find the limiting solution P22.t/ whent!1 , and use the following
to determine the diffusion coefﬁcient (spectral density)q:
E
" dx
dt
2#
D RT
N :
(d) Plot the solution P11.t/ and conclude that it asymptotically approaches
a straight line. Compute the asymptotic solution P11.t/ whent!1 ,
and conclude that it gives Langevin’s result.
5.5 Stationary FPK equation: Show that Equation (5.26) solves the correspond-
ing stationary FPK (Eq. 5.24).


## Page 83

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 75
5.6 In so-called Metropolis-adjusted Langevin Monte Carlo methods (see, e.g.,
Girolami and Calderhead, 2011), the idea is to construct an SDE whose sta-
tionary solution is a given probability distribution.x/.
(a) Construct an SDE of the form (5.25) such that the stationary solution is
the Gamma distribution with the probability density
.x/D ba
.a/ xa1 exp.bx/;
wherea;b>0 are constants and the gamma function is deﬁned as
.a/D
Z 1
0
xa1 exp.x/ dx:
(b) Simulate the SDE using the Euler–Maruyama method and check that
the solution indeed stabilizes to this distribution.
5.7 Show that the operator A in Exercise 5.1 is the adjoint of the operatorA in
the FPK equation in Exercise 5.2.
5.8 Recall the mean-reverting Ornstein–Uhlenbeck process is
dxD.x/ dtC dˇ.t/; x.0/ Dx0;
where gives the speed of reversion,  is the long-run equlibrium, and 
stands for the volatility.
(a) Recall (from Exercise 4.4) or ﬁnd the complete solution x.t/ .
(b) Derive the expressions for the mean m.t/ and varianceP.t/ of the so-
lution.
5.9 The Cox–Ingersoll–Ross (CIR) model is used in ﬁnance for modeling inter-
est rates. The model is given by
dxD.12x/ dtC3
px dˇ.t/; x.0/ Dx0>0;
where 1;2;3 > 0. The transition density for the Cox–Ingersoll–Ross
model can be written down in closed form: Consider the transformed process
y.t/ D 2cx.t/ withcD 22=.2
3.1e2t//. Its transition density is a
noncentral2 probability density
1
2 exp

yC
2
y

=41=2
I=21
p
y

(5.68)
with  D 41=2
3 degrees of freedom, and a noncentrality of  D
y0 exp.2t/. I˛ denotes the modiﬁed Bessel function of the ﬁrst kind. De-
rive the expression for the transition density of the original processx.t/ .
5.10 Show that the modiﬁed CIR model
dxD1x dtC2
p
1Cx2 dˇ; (5.69)


## Page 84

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
76 Probability Distributions and Statistics of SDEs
where21> 2
2 , has a stationary distribution with a density proportional to
1
.1Cx2/1C1= 2
2
:
Reparametrize this density to show that it is in fact the probability density of
a Student’st distribution.
5.11 Statistics of the Black–Scholes model:
(a) Solve the differential equation (5.62) for the mean m.t/ and variance
P.t/ with given initial conditionsm.0/Dm0 andP.0/DP0.
(b) Verify using the Euler–Maruyama method that your solutions are cor-
rect.
5.12 Derive the moments up to the order four for the Ornstein–Uhlenbeck process
(a) by solving the moment differential equations, and
(b) by expressing the moments of the Gaussian process in terms of the mean
and variance.


## Page 85

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6
Statistics of Linear Stochastic Differential
Equations
Linear SDEs are useful in applications as surprisingly many physical and
electrical systems can be modeled as linear SDEs. We already derived the
full solutions to linear SDEs in Section 4.3. However, we did not fully char-
acterize their statistics, transition densities, and computational methods. In
this chapter, we aim to ﬁrst compute the means and covariances of linear
SDEs – which completely characterize the solutions of linear SDEs as they
are Gaussian processes. We also discuss equivalent discretizations, which
are related to the transition densities of linear SDEs. We also encounter
the matrix fraction decomposition, which is a useful numerical method for
ﬁnding solutions and equivalent discretizations of LTI SDEs. Finally, we
discuss covariance functions and stationary solutions of LTI SDEs in terms
of Lyapunov equations and Fourier analysis. For more details, the reader is
referred to various books on Kalman ﬁltering (e.g., Grewal and Andrews,
2001) – linear SDEs tend to be of more interest in target tracking appli-
cations than in mathematical books on SDEs, and therefore they are more
thoroughly treated in Kalman ﬁltering books.
6.1 Means, Covariances, and Transition Densities of Linear SDEs
Consider a linear stochastic differential equation of the general form
dxD F.t/ x dtC u.t/ dtC L.t/ dˇ; (6.1)
where x.t/2 RD is the state, the initial conditions arex.t0/ N.m0; P0/,
F.t/ and L.t/ are matrix valued functions of time, u.t/2 RD is a vector
valued function of time, and ˇ.t/2 RS is a Brownian motion with diffu-
sion matrix Q. The initial conditions are assumed to be independent of the
Brownian motion.
The mean and covariance can be solved from Equations (5.50) and
77


## Page 86

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
78 Statistics of Linear Stochastic Differential Equations
(5.51), which in this case reduce to
dm
dt D F.t/ mC u.t/;
dP
dt D F.t/ PC P F T.t/C L.t/ Q LT.t/
(6.2)
with the initial conditions m.t0/D m0 and P.t0/D P0. The general solu-
tions to these differential equations are (recall the deﬁnition of the transi-
tion matrix‰.;t/ in Eq. 2.34):
m.t/D‰.t;t0/ m.t0/C
Z t
t0
‰.t;/ u./ d; (6.3)
P.t/D‰.t;t0/ P.t0/‰ T.t;t0/
C
Z t
t0
‰.t;/ L./ Q LT./‰ T.t;/ d; (6.4)
which could also be obtained by computing the mean and covariance of the
explicit solution in Equation (4.28).
Because the solution is a linear transformation of Brownian motion,
which is a Gaussian process, the solution is Gaussian
p.x;t/ ,p.x.t//D N.x.t/j m.t/; P.t//; (6.5)
which can be veriﬁed by checking that this density indeed solves the cor-
responding FPK equation (5.11). Furthermore, the transition density can
be recovered by formally using the initial conditions m.s/ D x.s/ and
P.s/D 0, which gives
p.x.t/j x.s//D N.x.t/j m.tjs/; P.tjs//; (6.6)
where
m.tjs/D‰.t;s/ x.s/C
Z t
s
‰.t;/ u./ d;
P.tjs/D
Z t
s
‰.t;/ L./ Q LT./‰ T.t;/ d:
(6.7)
It is now useful to note that the preceding implies that the original linear
SDE is (weakly, in distribution) equivalent to the following discrete-time
system:
x.tkC1/D Ak x.tk/C ukC qk; qk N.0;†k/; (6.8)


## Page 87

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.1 Means, Covariances, and Transition Densities of Linear SDEs 79
where
Ak ,‰.tkC1;tk/; (6.9)
uk ,
Z tkC1
tk
‰.tkC1;/ u./ d; (6.10)
†k ,†.tkC1;tk/D
Z tkC1
tk
‰.tkC1;/ L./ Q LT./‰ T.tkC1;/ d;
(6.11)
which is sometimes called theequivalent discretization of SDEs in Kalman
ﬁltering context (cf. Grewal and Andrews, 2001; Särkkä, 2006, 2013). This
system is equivalent in the sense that the distributions of the two systems
coincide at the pointsftkg.
Example 6.1 (Time-varying Ornstein–Uhlenbeck process) . Let us con-
sider the following time-varying Ornstein–Uhlenback process, where.t/
is a given function of time and the diffusion constant of the Brownian mo-
tion isq:
dxD.t/x dtC dˇ: (6.12)
In this one-dimensional case, we can solve the transition matrix (which is
scalar in this case) explicitly using the properties in Equation (2.34):
@ .;t/
@ D./ .;t/;
@ .;t/
@t D.t/ .;t/;
 .t;t/ D1:
(6.13)
The solution is
 .s;t/ D exp


Z s
t
./ d

: (6.14)
It is worth noting that this expression does not generalize to the multivari-
ate case simply by replacing the parameter.t/ with a matrix, because the
matrix product does not commute as the scalar product does. The equiva-
lent discretization matrices (scalars in this case) are now given as
akD exp


Z tkC1
tk
./ d

;
†kDq
Z tkC1
tk
exp

2
Z tkC1

.0/ d0

d;
(6.15)


## Page 88

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
80 Statistics of Linear Stochastic Differential Equations
together with ukD 0. These quantities give the (weak) solution at given
discretization pointst1;t2;::: as
x.tkC1/Dakx.tk/Cqk; q k N.0;†k/: (6.16)
6.2 Linear Time-Invariant SDEs
In the case of a linear time-invariant (LTI) SDE
dxD F x dtC L dˇ; (6.17)
where F and L are constant, the mean and covariance are also given by
Equation (6.2), which now takes the form
dm
dt D F m;
dP
dt D F PC P F TC L Q LT:
(6.18)
Thus the only differences are that the matrices F and L are constant, and
there is no input. In this LTI SDE case, the transition matrix is the matrix
exponential function‰.t;/ D exp.F.t// and the solutions to the dif-
ferential equations can be obtained by a substitution of it to Equations (6.3)
and (6.4):
m.t/D exp.F.tt0// m.t0/; (6.19)
P.t/D exp.F.tt0// P.t0/ exp.F.tt0//T
C
Z t
t0
exp.F.t// L Q LT exp.F.t// T d: (6.20)
The transition density is then given as
p.x.t/j x.s//D N.x.t/j m.tjs/; P.tjs//; (6.21)
where
m.tjs/D exp.F.ts// x.s/;
P.tjs/D
Z t
s
exp.F.t// L Q LT exp.F.t// T d:
(6.22)
The corresponding equivalent discrete system now takes the form
x.tkC1/D Ak x.tk/C qk; qk N.0;†k/; (6.23)


## Page 89

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.2 Linear Time-Invariant SDEs 81
wheretkDtkC1tk and
Ak , A.tk/D exp.Ftk/; (6.24)
†k ,†.tk/D
Z tk
0
exp.F.tk// L Q LT exp.F.tk// T d:
(6.25)
These expressions can sometimes (actually quite often) be evaluated in
closed form. There also exists a number of computational methods that
can be used for computing them numerically. A review of available meth-
ods can be found in Axelsson and Gustafsson (2015). In the next section,
we discuss one particularly useful method for the computation of the pre-
ceding covariance using the matrix fraction decomposition.
In terms of the preceding quantities, the transition density has the repre-
sentation
p.x.t/j x.s//D N.x.t/j A.ts/ x.s/;†.ts//: (6.26)
An example of computing these quantities is shown in the next example.
Example 6.2 (Discretized Ornstein–Uhlenbeck process) . For the (LTI)
Ornstein–Uhlenbeck process
dxDx dtC dˇ; (6.27)
with>0 , and with the Brownian motion having the diffusion constantq,
we get the transition density
p.x.t/jx.s//D N.x.t/jm.tjs/;P.t js//; (6.28)
where
m.tjs/D exp..ts//x.s/;
P.tjs/D q
2Œ1 exp.2.ts//: (6.29)
The corresponding discretization matrices (scalars) are then given by
akD exp.tk/;
†kD q
2Œ1 exp.2tk/; (6.30)
wheretk D tkC1tk, which indeed agree with Equation (6.15), and
the equivalently discretized system again has the form shown in Equa-
tion (6.16).


## Page 90

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
82 Statistics of Linear Stochastic Differential Equations
Equations (6.24) and (6.25) can often be found in tracking literature
(Bar-Shalom et al., 2001; Grewal and Andrews, 2001; Särkkä, 2006, 2013),
because they are useful in converting continuous-discrete Kalman ﬁltering
problems into equivalent discrete-time Kalman ﬁltering problems. A typi-
cal example of a model in that context is the following.
Example 6.3 (Discretized Wiener velocity model) . The Wiener velocity
model (see, e.g., Bar-Shalom et al., 2001; Särkkä, 2006) is a typical model
found in target tracking, where the velocity (the ﬁrst derivative of the pro-
cess) is modeled as a Wiener process, that is, as a Brownian motion. In
white noise interpretation, this means that the acceleration (i.e., the sec-
ond derivative) is a white noise process with spectral densityq:
d2x.t/
dt2 Dw.t/: (6.31)
In more rigorous Itô SDE form, this model can be written as
dx1
dx2

D
0 1
0 0

„ ƒ‚ …
F
x1
x2

dtC
0
1

„ƒ‚…
L
dˇ; (6.32)
whereˇ.t/ is a Brownian motion with diffusion coefﬁcientq,x1.t/ ,x.t/
is the actual process, andx2.t/ is its derivative.
Now the matrices of the equivalent discrete-time model are given as fol-
lows (notice that F is a nilpotent matrix such that FnD 0 forn>1 ):
A.t/D exp.Ft/D IC FC 1
2Š F2t2C
„ ƒ‚ …
D0
D
1 t
0 1

;
†.t/D
Z t
0
1 t 
0 1
 0 0
0 q
 1 t 
0 1
T
d
D
1
3t3 1
2t2
1
2t2 t

q: (6.33)
The transition density of the Wiener velocity model is thus given as
p.x.t/j x.s//
D N
x1.t/
x2.t/
ˇˇˇˇ
x1.s/Cx2.s/.t s/
x2.s/

;
q
3.ts/3 q
2.ts/2
q
2.ts/2 q.t s/

:
(6.34)
Example 6.4 (Discretized car model) . A two-dimensional version of the


## Page 91

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.3 Matrix Fraction Decomposition 83
above Wiener velocity model was already presented in Example 3.4 for
the purpose of modeling the movement of a car. The same model was also
used in a Kalman ﬁltering and smoothing context, for example, in Särkkä
(2013). The corresponding discrete-time model matrices now become the
following:
A.t/D
0
BB@
1 0 t 0
0 1 0 t
0 0 1 0
0 0 0 1
1
CCA; †.t/D
0
BBB@
q1t 3
3 0 q1t 2
2 0
0 q2t 3
3 0 q2t 2
2
q1t 2
2 0 q 1t 0
0 q2t 2
2 0 q 2t
1
CCCA;
(6.35)
whereq1 andq2 are the diffusion coefﬁcients of the driving Brownian mo-
tions.
6.3 Matrix Fraction Decomposition
A convenient numerical method for solving the covariance P.t/ from
Equation (6.2) or (6.18) is by using matrix fractions (see, e.g., Stengel,
1994; Grewal and Andrews, 2001; Särkkä, 2006; Axelsson and Gustafsson,
2015). If we deﬁne matricesC.t/ and D.t/ such that P.t/D C.t/ D1.t/,
then P.t/ solves the matrix Lyapunov differential equation
dP
dt D F.t/ PC P F T.t/C L.t/ Q LT.t/; (6.36)
if the matrices C.t/ and D.t/ solve the differential equation
dC=dt
dD=dt

D
F.t/ L.t/ Q LT.t/
0 F T.t/
 C
D

; (6.37)
and P.t0/D C.t0/ D1.t0/. We can select, for example,
C.t0/D P.t0/ and D.t0/D I: (6.38)
The convenience of the matrix fraction decomposition comes from the fact
that Equation (6.37) is a “normal” linear differential equation in the sense
that we have a matrix multiplying the unknown from the left, whereas
the Lyapunov differential equation (6.36) has a matrix multiplication from
right. For this reason, the covariance solutions in Equations (6.4) and (6.20)
have more complicated forms than the mean solutions in Equations (6.3)
and (6.19).
The matrix fraction decomposition is especially useful in the case of


## Page 92

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
84 Statistics of Linear Stochastic Differential Equations
linear time-variant systems. If the differential equation (6.37) is time-
invariant, that is, if F and L are constant, then it can be solved using the
matrix exponential function:
C.t/
D.t/

D exp
F L Q L T
0 F T

.tt0/
 C.t0/
D.t0/

: (6.39)
The ﬁnal solution is then given as P.t/ D C.t/ D1.t/. This is useful,
because now both the mean and covariance can be solved via a simple
matrix exponential function computation, which allows for easy numerical
treatment. These matrix exponentials can often also be computed in closed
form using, for example, Laplace transforms.
In ﬁltering and smoothing (see Chapter 10), we are often interested in
forming the matrices A.t/ and †.t/ in Equations (6.24) and (6.25)
by numerical means. This is because these numerical matrices can then be
directly used in a discrete-time Kalman ﬁlter to infer the state of the SDE at
a discrete set of time instants. The matrix fraction decomposition is useful
for this task as well. First note that the numerical computation of A.t/
is easy, because it is just a matrix exponential for which good numerical
computation methods are available. However, the integral expression for
†.t/ is more problematic from a numerical point of view.
It turns out that the matrix fractions can also be used for reducing the
computations of the matrix †.t/ to a simple matrix exponential (see,
e.g., Särkkä, 2006; Axelsson and Gustafsson, 2015). The trick is that the
matrix is also the solution to the differential equation
d†.t/
dt D F†.t/C†.t/ F TC L Q LT; †.0/D 0: (6.40)
Thus we can now use the matrix fractions to solve †.t/ D
C†.t/ D1
† .t/, where
C†.t/
D†.t/

D exp
F L Q L T
0 F T

t

„ ƒ‚ …
ˆ.t/
0
I

: (6.41)
It is also useful to remark (see, e.g., Axelsson and Gustafsson, 2015) that
the preceding matrix exponentialˆ.t/ always has the form
ˆ.t/D
A.t/ †.t/ A.t/T
0 A.t/T

; (6.42)
where A.t/ D exp.Ft/. This also implies that we always have


## Page 93

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.3 Matrix Fraction Decomposition 85
D1
† .t/D AT.t/ and thus the matrix inversion does not actually need
to be computed.
Example 6.5 (Matrix fractions solution to the Wiener velocity model). For
the Wiener velocity model (6.32), we get
C†.t/
D†.t/

D exp
2
664
0
BB@
0 1 0 0
0 0 0 q
0 0 0 0
0 0 1 0
1
CCA
„ ƒ‚ …
G
t
3
775
0
I

: (6.43)
By manual or symbolic computation, we can ﬁnd out that the matrix is
nilpotent of degree4, that is, GnD 0 whenn4. Hence we have
exp.Gt/D IC GtC G2t2
2 C G3t3
6
D
0
BBB@
1 t t 3q
6
t 2q
2
0 1 t 2q
2 tq
0 0 1 0
0 0 t 1
1
CCCA: (6.44)
This then leads to
C†.t/D

t 3q
6
t 2q
2
t 2q
2 tq
!
and D1
† .t/D
 1 0
t 1

; (6.45)
and further
†./D C†.t/ D1
† .t/D
1
3t3 1
2t2
1
2t2 t

q; (6.46)
which agrees with the solution obtained in (6.33).
Obviously, the matrix G is not always nilpotent, and often a symbolic
computation of the matrix exponential is not feasible by other means ei-
ther. However, fortunately, commonly used software packages such as
MATLAB
R
or Python already provide functions for efﬁcient numerical
computation of matrix exponentials. These functions can be easily used
for computing the matrix fraction decompositions and hence equivalent
discretizations numerically. This is illustrated in the next example.
Example 6.6 (Discretization of the spring model). Recall the spring model


## Page 94

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
86 Statistics of Linear Stochastic Differential Equations
in Example 3.10, which in proper SDE interpretation has the form
dx1
dx2

„ƒ‚…
dx
D
 0 1
2

„ ƒ‚ …
F
x1
x2

„ƒ‚…
x
dtC
0
1

„ƒ‚…
L
dˇ: (6.47)
If we now wish to discretize this model, we encounter the problem that al-
ready the matrix exponential for A.t/ is fairly complicated and we can-
not hope to compute the integral for †.t/ in Equation (6.33) in closed
form. Hence, numerical integration would be needed, which can be cum-
bersome. However, for given values of the parameters, we can numerically
use the matrix fraction decomposition and do the discretization as follows.
Assume, for example, that we the parameters D 1,
 D 1=10, and
t D 1=2. Then the numerical G matrix and the matrix exponential of
Gt are given as
GD
0
BB@
0 1:0000 0 0
1:0000 0:1000 0 1:0000
0 0 0 1:0000
0 0 1:0000 0:1000
1
CCA;
exp.Gt/
0
BB@
0:8796 0:4676 0:0203 0:1199
0:4676 0:8328 0:1199 0:4593
0 0 0:8755 0:4916
0 0 0:4916 0:9247
1
CCA:
(6.48)
The preceding matrix exponential was computed using MATLAB
R
’s built-
in expm function. The matrix exponential
A.t/D exp.Ft/
 0:8796 0:4676
0:4676 0:8328

(6.49)
can be found in the top-left corner of the second matrix in Equation(6.48).
The discretized covariance is then given as
†.t/
0:0203 0:1199
0:1199 0:4593

„ ƒ‚ …
C†.t/
0:8796 0:4676
0:4676 0:8328

„ ƒ‚ …
D1
† .t/DAT.t/

0:0382 0:1093
0:1093 0:4386

; (6.50)
where we have truncated the display of the intermediate quantities to four
decimals although the result was computed by directly extracting the blocks
numerically from the matrix exponential in the second equation in (6.48).


## Page 95

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.4 Covariance Functions of Linear SDEs 87
Remark 6.7 (LTI SDE with constant input). Note that by the ﬁrst glance
the preceding method does not seem to directly work for discretization of
LTI SDEs with a constant input u:
dxD F x dtC u dtC L dˇ; (6.51)
but it turns out that it actually does. This is because we can rewrite the
equation as
dxD F x dtC u dtC L dˇ;
duD 0: (6.52)
The discretization can now be done to the joint state-space .x; u/, which
then gives one additional coefﬁcientB.t/ for the discretization:
x.tkC1/D A.tk/ x.tk/C B.tk/ uC qk: (6.53)
If the input is some time-dependentu.t/, we can also directly use this result
to form a zeroth-order-hold (ZOH) approximation to the input contribu-
tion. However, with additional augmentation tricks, we can also construct
higher-order approximations (nth order holds) with respect to the input.
6.4 Covariance Functions of Linear SDEs
So far, we have only considered the computation of time-marginal statistics
of the state, that is, the statistics of x.t/ for single t at a time. However,
sometimes we are interested in the interaction of states at different times t
ands. This kind of interaction (up to the second order) is characterized by
the covariance function
C.t;s/ D EŒ.x.t/ m.t//. x.s/ m.s//T; (6.54)
where m.t/D EŒx.t/ and m.s/D EŒx.s/. The covariance function is a
matrix-valued function that gives the cross-covariance matrix between the
vectors x.t/ and x.s/. By evaluating the covariance function attDs, we
get P.t/D C.t;t/ , which is the marginal covariance of x.t/.
Let us now compute the covariance function of
dxD F.t/ x dtC L.t/ dˇ; x.t0/ N.m.t0/; P.t0//; (6.55)
where again the initial condition is assumed to be independent of the Brow-
nian motion. It is worth noting at this point that we have left out the input
u.t/ for notational convenience. However, the covariance function that we


## Page 96

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
88 Statistics of Linear Stochastic Differential Equations
derive will be valid also for a linear SDE with deterministic input (6.1),
because a deterministic input does not affect the covariance function.
The solution to the SDE can be expressed as (by (4.28))
x.t/D‰.t;t0/ x.t0/C
Z t
t0
‰.t;/ L./ dˇ./; (6.56)
where‰ is the transition matrix deﬁned in Equation (2.34). Taking the
expectation gives the mean
m.t/D EŒ‰.t;t0/ x.t0/D‰.t;t0/ m.t0/: (6.57)
By using the independence of initial conditions from the Brownian motion,
we now get for the covariance function
C.t;s/ D EŒ.x.t/ m.t//. x.s/ m.s//T
D E

‰.t;t0/ x.t0/C
Z t
t0
‰.t;/ L./ dˇ./‰.t;t0/ m.t0/



‰.s;t0/ x.t0/C
Z s
t0
‰.s;/ L./ dˇ./‰.s;t0/ m.t0/
T
D E

‰.t;t0/. x.t0/ m.t0//. x.t0/ m.t0//T‰ T.s;t0/

C E
Z t
t0
‰.t;/ L./ dˇ./
 Z s
t0
‰.s;/ L./ dˇ./
T
:
(6.58)
It is now convenient to split the evaluation into two parts:
 Ift <s, then for the ﬁrst term we get the following:
EŒ‰.t;t0/. x.t0/ m.t0//. x.t0/ m.t0//T‰ T.s;t0/
D‰.t;t0/ P.t0/‰ T.s;t0/
D‰.t;t0/ P.t0/‰ T.t;t0/‰ T.s;t/: (6.59)


## Page 97

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.4 Covariance Functions of Linear SDEs 89
The second term then gives the following:
E
Z t
t0
‰.t;/ L./ dˇ./
 Z s
t0
‰.s;/ L./ dˇ./
T
D
Z t
t0
‰.t;/ L./ Q LT./‰ T.s;/ d
D
Z t
t0
‰.t;/ L./ Q LT./Œ‰.s;t/ ‰.t;/ T d
D
Z t
t0
‰.t;/ L./ Q LT./‰ T.t;/ d

‰ T.s;t/; (6.60)
where P.t/ is the marginal covariance. Thus whent <s, we have
C.t;s/ D

‰.t;t0/ P.t0/‰ T.t;t0/
C
Z t
t0
‰.t;/ L./ Q LT./‰ T.t;/ d

‰ T.s;t/
D P.t/‰ T.s;t/; (6.61)
where we have recalled the expression of P.t/ given in Equation (6.4).
 Ifts, then we similarly get
EŒ‰.t;t0/. x.t0/ m.t0//. x.t0/ m.t0//T‰ T.s;t0/
D‰.t;s/ ‰.s;t0/ P.t0/‰ T.s;t0/; (6.62)
and
E
Z t
t0
‰.t;/ L./ dˇ./
 Z s
t0
‰.s;/ L./ dˇ./
T
D‰.t;s/
Z s
t0
‰.s;/ L./ Q LT./‰ T.s;/ d: (6.63)
Thus whents, we get the covariance
C.t;s/ D‰.t;s/ P.s/: (6.64)
From the preceding derivation, we get that the covariance function can be
written as
C.t;s/ D
(
P.t/‰ T.s;t/; ift <s;
‰.t;s/ P.s/; ifts: (6.65)


## Page 98

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
90 Statistics of Linear Stochastic Differential Equations
In the LTI case, we have‰.t;s/ D exp..ts/ F/ and thus
C.t;s/ D
(
P.t/ exp..st/ F/T; ift <s;
exp..ts/ F/ P.s/; ifts: (6.66)
6.5 Steady-State Solutions of Linear SDEs
In this section, we consider the steady-state solutions of SDEs. When
the SDE is time-invariant and stable in a suitable sense, the solution ap-
proaches a steady state when t!1 . Alternatively, we can think that the
process has been started fromt0!1 and thus the solution has reached
its steady state already at time t. We already saw in Section 5.2 that the
steady state can be solved easily from the FPK if the drift has a special
gradient-of-potential form. Here the aim is to consider the steady-state so-
lutions of LTI SDEs of the form
dxD F x dtC L dˇ; (6.67)
where the gradient condition does not need to hold. It turns out that such
(nonsingular) stationary solution can only exist if the matrix F is stable
(i.e., a Hurwitz matrix), that is, if the real parts of its eigenvalues are strictly
negative.
As the solution to a linear SDE is characterized by the mean and covari-
ance, our aim is now to solve the stationary mean and covariance. We now
notice that at the steady state, the time derivatives of mean and covariance
should be zero:
dm
dt D F mD 0;
dP
dt D F PC P F TC L Q LTD 0:
(6.68)
The ﬁrst equation implies that the stationary mean should be identically
zero m1D 0. Here we use the subscript1 to mean the steady-state value,
which in a sense corresponds to the value after an inﬁnite duration of time.
The second equation leads to the so-called Lyapunov equation, which is a
special case of the so-called algebraic Riccati equations (AREs):
F P1C P1 F TC L Q LTD 0: (6.69)
The steady-state covariance P1 can be algebraically solved from the pre-
ceding equation. Note that although the equation is linear in P1, it cannot
be solved via simple matrix inversion, because the matrixF appears on the


## Page 99

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.5 Steady-State Solutions of Linear SDEs 91
left- and right-hand sides of the covariance. However, most mathematical
software packages (e.g., MATLAB
R
) have built-in routines for solving this
type of equation numerically.
It is worth noting that provided that we have computed the matrix P1
for an LTI SDE, forming the equivalent discretization becomes a bit easier.
Note that the equivalent discrete-time version of the Lyapunov equation is
P1D A.t/ P1 AT.t/C†.t/; (6.70)
where A.t/ and†.t/ are given by Equations (6.24) and (6.25), respec-
tively. This implies that once we have computed P1 and A.t/, we can
easily compute
†.t/D P1 A.t/ P1 AT.t/; (6.71)
and the use of matrix fractions for computing†.t/ is not necessary.
By substituting the steady-state covariance function P.t/ D P1 to
Equation (6.66), we can readily derive the covariance function at the steady
state. It now turns out that the covariance function does not explicitly de-
pend on times t ands, but instead only on the difference st. Thus, by
lettingDst, the steady-state covariance function becomes
C./D
(
P1 exp. F/T; if >0;
exp. F/ P1; if0; (6.72)
which we have written as function of a single variable  only. We will
continue to use this slight abuse of notation in the next sections. We also
refer this function, which is sometimes called theautocovariance function,
simply as the covariance function.
Example 6.8 (Steady-state solution of the Ornstein–Uhlenbeck model) .
Consider the steady-state solution of the Ornstein–Uhlenbeck SDE
dxDx dtC dˇ; (6.73)
where > 0and the Brownian motion ˇ has a diffusion constant q > 0.
The steady-state variance can be obtained from
dP
dt D2P CqD0; (6.74)
which givesPD q
2, and the covariance function is given as
C./D
(
q
2 exp./; if0;
exp./ q
2; if <0; (6.75)


## Page 100

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
92 Statistics of Linear Stochastic Differential Equations
which can also be written simply as
C./D q
2 exp.jj/: (6.76)
6.6 Fourier Analysis of LTI SDEs
Another way to study the steady-state solutions of LTI SDEs is to use the
Fourier domain. In that case, a useful quantity is the spectral density, which
is the expectation of the squared absolute value of the Fourier transform of
the process. For example, if the Fourier transform of a (real-valued) scalar
processx.t/ isX.i!/, then its spectral density is
Sx.!/D E

jX.i!/j2
D EŒX.i!/X.i!/: (6.77)
In the case of a vector process x.t/, we have the spectral density matrix
Sx.!/D E

X.i!/ XT.i!/

: (6.78)
Now if w.t/ is a white noise process with spectral density Q, it really
means that the expected squared absolute value of the Fourier transform is
Q:
Sw.!/D E

W.i!/ W T.i!/

D Q: (6.79)
However, one needs to be extra careful when using this, because the Fourier
transform of a white noise process is deﬁned only as a kind of limit of
smooth processes. Fortunately, as long as we only work with linear sys-
tems, this deﬁnition indeed works. It also provides a useful tool for deter-
mining covariance functions of stochastic differential equations.
As we already saw in the previous section, the covariance function of a
zero mean stationary stochastic process x.t/ can be deﬁned as
Cx./D EŒx.t/ xT.tC/: (6.80)
This function is independent of t, because we have assumed that the pro-
cess is stationary. This means that formally we think that the process has
been started at time t0D1 and it has reached its stationary state such
that its statistics no longer depend on the absolute time t, but only the dif-
ference of time steps.
The Wiener–Khinchin theorem says that the covariance function is the
inverse Fourier transform of the spectral density:
Cx./D F1ŒSx.!/: (6.81)


## Page 101

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.6 Fourier Analysis of LTI SDEs 93
For the white noise process, we get
Cw./D F1ŒQD Q F1Œ1D Qı./; (6.82)
as expected.
Now consider the stochastic differential equation
dx
dt D F xC L w; (6.83)
and assume that it has already reached its stationary state and hence it also
has zero mean. Recall from the previous section that the stationary stage
can only exist of the matrixF corresponds to a stable system, which means
that all its eigenvalues have negative real parts. Let us now assume that it
is indeed the case.
Similarly, as in Section 2.4 we get the following solution for the Fourier
transform X.i!/ of x.t/:
X.i!/D..i!/ I F/1 L W.i!/; (6.84)
where W.i!/ is the formal Fourier transform of white noise w.t/. Note
that this transform does not strictly exist, because a white noise process is
not square-integrable, but let us now pretend that it does.
The spectral density of x.t/ is now given by the matrix
Sx.!/D.F.i!/ I/1 L E

W.i!/ W T.i!/

LT .FC.i!/ I/T
D.F.i!/ I/1 L Q LT .FC.i!/ I/T: (6.85)
Thus the covariance function is
Cx./D F1Œ.F.i!/ I/1 L Q LT .FC.i!/ I/T: (6.86)
Even though this looks complicated, it provides useful means of comput-
ing the covariance function of a solution to stochastic differential equation
without ﬁrst explicitly solving the equation.
Note that because
Cx.0/D P1; (6.87)
by Equation (6.72), where P1 is the stationary solution considered in the
previous section, we also get the following identity:
P1D 1
2
Z 1
1
.F.i!/ I/1 L Q LT .FC.i!/ I/T d!; (6.88)
which can sometimes be used for computing solutions to stationary (alge-
braic) Lyapunov equations.


## Page 102

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
94 Statistics of Linear Stochastic Differential Equations
From the covariance function, we can also extract the discretization ma-
trices as follows using Equation (6.72):
A.t/D CT
x.t/ P1
1; (6.89)
and†.t/ can be further computed from (6.71). Thus, provided that we
know the full covariance function of a linear time-invariant Itô process, we
can form its equivalent discretization without forming its continuous-time
state-space form.
Example 6.9 (Spectrum and covariance of the Ornstein–Uhlenbeck pro-
cess). Consider the Ornstein–Uhlenbeck SDE in its white noise form:
dx
dt DxCw; (6.90)
where > 0and the spectral density of white noise w.t/ is q. Taking
formal Fourier transform from both sides yields
.i!/X. i!/DX. i!/CW.i!/; (6.91)
and solving forX.i!/ gives
X.i!/D W.i!/
.i!/C: (6.92)
Thus we get the following spectral density:
Sx.!/D E

jW.i!/j2
j.i!/Cj2 D q
!2C2; (6.93)
whereq is the spectral density of the white noise input process w.t/ . The
Fourier transform then leads to the covariance function
Cx./D q
2 exp.jj/; (6.94)
which agrees with the result in (6.76). Furthermore, we get
P1D 1
2
Z 1
1
q
2C!2 d!D q
2; (6.95)
which is the solution to the stationary Lyapunov equation in (6.74).
As pointed out previously, the analysis in this section has not been en-
tirely rigorous, because we had to resort to computation of the Fourier
transform of white noise
W.i!/D
Z 1
1
w.t/ exp.i!t/ dt; (6.96)


## Page 103

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
6.6 Fourier Analysis of LTI SDEs 95
which is not well deﬁned as an ordinary integral. The obvious substitution
dˇDw.t/ dt will not help us either, because we would still have trouble
in deﬁning what is meant by this resulting highly oscillatory stochastic
process.
The problem can be solved by using the integrated Fourier transform as
follows. It can be shown (see, e.g., Van Trees, 1968) that every stationary
Gaussian processx.t/ has a representation of the form
x.t/D
Z 1
1
exp.i!t/ d.i!/; (6.97)
where ! 7! .i!/ is some complex-valued Gaussian process with in-
dependent increments. Then the mean squared difference E Œj.!kC1/
.!k/j2 roughly corresponds to the mean power on the intervalŒ!k;!kC1.
The spectral density then corresponds to a functionS.!/ such that
EŒj.!kC1/.!k/j2D 1

Z !kC1
!k
S.!/ d!; (6.98)
where the constant factor results from two-sidedness ofS.!/ and from the
constant factor.2/1 in the inverse Fourier transform.
By replacing the Fourier transform in the preceding analysis with the
integrated Fourier transform, it is possible derive the spectral densities of
covariance functions of LTI SDEs without resorting to the formal Fourier
transform of white noise. However, the results remain exactly the same. For
more information on this procedure, see, for example, Van Trees (1968).
Another way to treat the problem is to recall that the solution of a LTI
ODE of the form
dx
dt D F xC L u; (6.99)
where u.t/ is a smooth process, approaches the solution of the correspond-
ing LTI SDE in the Stratonovich sense when the correlation length of u.t/
goes to zero. Thus we can start by replacing the formal white noise process
with a Gaussian process with covariance function
Cu.It/D Q 1p
2t 2
exp

 1
2t 22

; (6.100)
which in the limitt!0 gives the white noise:
lim
t#0
Cu.It/D Qı./: (6.101)
If we now carry out the derivation in the beginning of this section, we end


## Page 104

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
96 Statistics of Linear Stochastic Differential Equations
up with the following spectral density:
Sx.!It/D.F.i!/ I/1 L Q exp

t2
2 !2

LT .FC.i!/ I/T:
(6.102)
We can now compute the limit t! 0 to get the spectral density corre-
sponding to the white noise input:
Sx.!/D lim
t!0
Sx.!It/D.F.i!/ I/1 L Q LT .FC.i!/ I/T;
(6.103)
which agrees with the result obtained in Section 6.6. This also implies that
the covariance function of x is indeed
Cx./D F1Œ.F.i!/ I/1 L Q LT .FC.i!/ I/T: (6.104)
6.7 Exercises
6.1 Consider a “Wiener acceleration model”, where the model matrices of the
linear time-invariant SDE are
FD
0
@
0 1 0
0 0 1
0 0 0
1
A and LD
0
@
0
0
1
1
A;
which corresponds to d3x.t/
ı
dt3 Dw.t/ . Provide the discrete-time solu-
tion in terms of A.t/ and†.t/.
6.2 Provide the discrete-time solution in terms of A.t/ and†.t/ to the linear
SDE given for smartphone orientation tracking in Example 3.5:
dgLD!L gL dtC dˇ;
where gL represents the locally seen gravitation, !L angular velocity (here
assumed to be constant), andˇ.t/ is a Brownian motion with diffusion ma-
trixq I. Recall that the matrix exponential was already solved in Exercise 3.6
using the Rodrigues formula.
6.3 Calculate the matrix fraction decomposition for the Ornstein–Uhlenbeck
process
dxDx dtC dˇ;
whereˇ.t/ is a Brownian motion with diffusion constantq.
6.4 Derive the expression for B.tk/ based on Remark 6.7.
6.5 Derive the covariance function for the Wiener velocity model
dxD
0 1
0 0

x dtC
0
1

dˇ;


## Page 105

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 97
where  > 0, ˇ.t/ is a Brownian motion with diffusion q and the initial
condition is x.0/D 0.
6.6 Derive the covariance function of the nonstationary model
dxD
0 1
0 0

x dt;
where x.0/ N.0; diag.0;2//.
6.7 Theorem 5.6 tells that we can form a stationary solution to the FPK equation
in form of Equation (5.26) when the drift can be written as a gradient of a
potential function. In case of a linear SDE
dxD F x dtC L dˇ;
what kinds of conditions does this imply for the matrix F? Can you use this
result to obtain a class of solutions to Equation (6.69)?
6.8 Derive the steady-state mean m1 and covariance P1 of the Matérn (D
3=2 ) model
dxD
 0 1
2 2

x dtC
0
1

dˇ; (6.105)
by solving the stationary states of the mean and covariance differential equa-
tions. The parameter>0 andˇ.t/ is a Brownian motion with diffusionq.
Also derive the covariance function of the process.
6.9 Derive the steady-state solution and covariance function of the Matérn ( D
3=2 ) model (6.105) using the Fourier transform similarly as in Example 6.9.


## Page 106

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7
Useful Theorems and Formulas for SDEs
This chapter contains a set of useful results and theorems that are somewhat
on the edge of more advanced analysis and methods for SDEs. Although
the chapter contains important topics, it can be safely skipped during the
ﬁrst reading, because it is a bit of a detour from the main storyline of the
book. We start with Lamperti transforms for solving multiplicative noise
SDEs and then proceed to different constructions and characteristics of
Brownian motion, including the deﬁnition of the Wiener measure. We then
introduce and discuss the Girsanov theorem that can be used for transform-
ing measures and ﬁnding weak solutions to SDEs. The Doob’sh-transform
is then introduced as a method for conditioning SDEs on their end point,
and ﬁnally we discuss path integrals and the Feynman–Kac formulae that
connect SDEs to quantum mechanics and partial differential equations.
7.1 Lamperti Transform
The Lamperti transform (see, e.g., Iacus, 2008; Møller and Madsen, 2010)
is a change of variables yD h.x;t/ in an SDE
dxD f.x;t/ dtC L.x;t/ dˇ; (7.1)
such that it transforms into
dyD g.y;t/ dtC dˇ: (7.2)
That is, the multiplicative noise is transformed into additive noise. This
transformation is useful, for example, for numerical treatment of SDEs,
because numerically solving an additive-noise SDE (7.2) is usually easier
than solving a general SDE of the form (7.1). Even though the Lamperti
transform can be, in a sense, extended to a multivariate setting, it is essen-
tially a one-dimensional transform (Møller and Madsen, 2010).
To illustrate the idea of the Lamperti transform, let us consider a scalar
98


## Page 107

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.1 Lamperti Transform 99
SDE
dxDf.x;t/ dtCL.x;t/ dˇ; (7.3)
whereˇ.t/ is a standard Brownian motion. We can then deﬁne a transform
as follows:
yDh.x;t/ D
Z x

1
L.u;t/ du; (7.4)
where is an arbitrary point. Applying the Itô formula onh gives
dyD @h.x;t/
@t dtC
 1
L.x;t/

dxC1
2

@L.x;t/=@x/
L2.x;t/

dx2
D
@
@t
Z x

1
L.u;t/ du

dtC
 1
L.x;t/

.f.x;t/ dtCL.x;t/ dˇ/
C1
2

@L.x;t/=@x/
L2.x;t/

L2.x;t/ dt
D
@
@t
Z x

1
L.u;t/ duCf.x;t/
L.x;t/ 1
2
@L.x;t/
@x

dtC dˇ: (7.5)
Provided thatxDh1.y;t/ exists, we can express the SDE in terms of y
by
dyD
@
@t
Z x

1
L.u;t/ duCf.x;t/
L.x;t/ 1
2
@L.x;t/
@x
ˇˇˇˇ
xDh1.y;t/
„ ƒ‚ …
g.y;t/
dtC dˇ:
(7.6)
The transformation generalizes to a multivariate setting if L.x;t/ is di-
agonal such that each Lii.x;t/ only depends on the component xi. Then
we can apply the Lamperti transform to each component separately. More
generally the transformation does not have a simple formula, but instead
the transformation can only be deﬁned as a solution to a system of partial
differential equations (Møller and Madsen, 2010).
Example 7.1 (Lamperti transform). Let us consider again the SDE in Ex-
ample 4.9, which was given as
dxD

˛x logxC1
2x

dtCx dˇ: (7.7)
The corresponding Lamperti transform is
h.x/D
Z x

1
x dxD logx log; (7.8)


## Page 108

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
100 Useful Theorems and Formulas for SDEs
where we can, for example, choose  D 1, which then gives h1.y/ D
exp.y/. The transformed SDE is then given as
dyD

˛x logxC 1
2x
x 1
2
!ˇˇˇˇˇ
xDexp.y/
dtC dˇ
D˛y dtC dˇ; (7.9)
which is a linear SDE and thus easily solvable. Solving this equation and
transforming back leads to the result (4.47) that we obtained earlier.
7.2 Constructions of Brownian Motion and the Wiener Measure
In this section, we discuss some constructions of Brownian motion. We
only consider one-dimensional standard Brownian motion with qD 1 –
which is also often referred to as the Wiener process – but all the ideas
generalize to multivariate and nonstandard Brownian motions with other
initial conditions. We can already see as a special case of Deﬁnition 4.1
that a standard Brownian motion is a process with independent Gaussian
increments of the form
ˇ.tkC1/ˇ.tk/ N.0;tkC1tk/; t kC1>t k: (7.10)
From the preceding we can also deduce that Brownian motion is nowhere
differentiable and that the quadratic variation of Brownian motion is
Œb;b tDt, where the quadratic variation is deﬁned as the limit
Œˇ;ˇtD lim
tkC1tk!0
X
tkt
jˇ.tkC1/ˇ.tk/j2: (7.11)
It turns out that the preceding already characterizes the Brownian motion
provided that we also demand that it is a continuous process with this prop-
erty. This is called the Lévy characterization theorem, which states the fol-
lowing (see, e.g., Karatzas and Shreve, 1991).
Theorem 7.2 (Lévy’s characterization of Brownian motion) . Letfˇ.t/ j
t2 Œ0;1/g be a continuous martingale with ˇ.0/D 0 andŒˇ;ˇtD t,
thenˇ.t/ is a standard Brownian motion.
Based on Equation (7.10), we can also proceed to write down
the probability density of an arbitrary ﬁnite-dimensional distribution
p.ˇ.t1/;:::;ˇ.t T// as follows:
p.ˇ.t1/;:::;ˇ.t T//D
T1Y
kD0
N.ˇ.tkC1/jˇ.tk/;tkC1tk/: (7.12)


## Page 109

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.2 Constructions of Brownian Motion and the Wiener Measure 101
Because this is valid for any collection of time points, it deﬁnes a proba-
bility measure for the whole process. The probability measure is called the
Wiener measure (Wiener, 1923). Nowadays, the Wiener measure is typi-
cally deﬁned implicitly as the probability measure of the process that has
the preceding ﬁnite-dimensional distributions. The corresponding measure
can be shown to be unique, have a continuous version, and other useful
properties (see, e.g., Karatzas and Shreve, 1991; Rogers and Williams,
2000a).
In physics literature (see, e.g., Chaichian and Demichev, 2001a), the
Wiener measure is often not deﬁned via its ﬁnite-dimensional distributions,
but in connection with path integrals, which is also close to the original
exposition by Wiener (1923). If we plug in the density of the normal dis-
tribution to the preceding equation, we get
p.ˇ.t1/;:::;ˇ.t T//
D
T1Y
kD0
1p
2.tkC1tk/
exp

 1
2.tkC1tk/.ˇ.tkC1/ˇ.tk//2

D exp

1
2
T1X
kD0
.ˇ.tkC1/ˇ.tk//2
.tkC1tk/2 .tkC1tk/
 T1Y
kD0
1p
2.tkC1tk/
:
(7.13)
The probability of a set BT of discrete paths is then given as
P..ˇ.t1/;:::;ˇ.t T//2 BT/
D
Z
BT
p.ˇ.t1/;:::;ˇ.t T// dˇ.t1/ dˇ.tT/
D
Z
BT
exp

1
2
T1X
kD0
.ˇ.tkC1/ˇ.tk//2
.tkC1tk/2 .tkC1tk/


T1Y
kD0
dˇ.tkC1/p
2.tkC1tk/
: (7.14)
We can now formally take the limit .ˇ.tkC1/ˇ.tk//2ı
.tkC1tk/2 !
Pˇ2.t/, wherePˇ , dˇ=dt and thus formally deﬁne the Wiener measurePW
of a set of functionsˇ2 B on intervalŒ0;t as
PW.ˇ2 B/D
Z
B
exp

1
2
Z t
0
Pˇ2./ d
 tY
D0
dˇ./p
2 d
; (7.15)


## Page 110

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
102 Useful Theorems and Formulas for SDEs
which is a “path integral” in physics terms, that is, an integral over the
paths ofˇ.t/. Note that the product the end of the expression is actually a
notational shorthand for a “continuous product” over the span Œ;t .
This representation of the Wiener measure should be considered a for-
mal expression, because Brownian motion is not differentiable and thus the
derivativePˇ.t/ is not well deﬁned. However, this representation still works
well in practice in physics.
It is also possible to construct Brownian motion as a limit of a random
walk, which is taking integer steps up and down. Note that the construction
(7.10) can also be seen as a random walk
ˇkC1DˇkCqk; (7.16)
whereqk is a zero-mean Gaussian random variable with variance 2
k D
tkC1tk. Now the central limit theorem states that the limit of a sum of
identically distributed random variablesi with zero mean and variance2
tends to a Gaussian random variable in the following sense:
1C2CC n
pn ! N.0; 2/; (7.17)
whenn!1 . Let us write
skD
kX
iD1
i (7.18)
and select the random variable i such that it takes values f1;1g with
equal probabilities. Now consider the process
Sn.t/D sŒnt
pn; (7.19)
whereŒ denotes the integer part of its argument. Then it turns out that
Sn.tkC1/Sn.tk/D sŒntkC1
pn sŒntk
pn ! N.0;tkC1tk/; (7.20)
whenn!1 . Thus we can construct Brownian motion as the limit of the
integer-step random walk:
ˇ.t/D lim
n!1
Sn.t/: (7.21)
Yet another way of looking at Brownian motion is to see it as a zero-mean
Gaussian process with the covariance function
C.t;t 0/D min.t;t0/: (7.22)


## Page 111

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.2 Constructions of Brownian Motion and the Wiener Measure 103
This also directly results from the property (7.10).
Let us consider a certain ﬁnite interval t 2 Œ0;T . The so-called Mer-
cer’s theorem (Mercer, 1909; Loève, 1963) tells that we can expand the
preceding covariance function as
C.t;t 0/D
1X
nD1
nn.t/ n.t0/; (7.23)
wheren andn are the eigenvalues and eigenfunctions of the covariance
function, respectively, in this case deﬁned as follows:
Z T
0
C.t;t 0/n.t0/ dt0Dnn.t/: (7.24)
It turns out that the eigenvalues and eigenfunctions of standard Brownian
motion are given as
nD
 2T
.2n1/
2
;
n.t/D
2
T
1=2
sin
.2n1/
2T t

:
(7.25)
We can then construct Brownian motion through its Karhunen–Loeve ex-
pansion (Loève, 1963):
ˇ.t/D
1X
nD1
znn.t/; (7.26)
wherezn N.0;n/ are independent Gaussian random variables.
Example 7.3 (Karhunen–Loeve series of Brownian motion) . It is possi-
ble to approximate Brownian motion by using a ﬁnite truncation of its
Karhunen–Loeve series. The convergence of the series to Brownian mo-
tion is illustrated in Figure 7.1.
We can also take any orthonormal basisf'n.t/g of the Hilbert space with
the inner product
hf;giD
Z T
0
f./g./ d (7.27)
and expand Brownian motion ont2Œ0;T as
ˇ.t/D
1X
nD1
zn
Z t
0
'n./ d; (7.28)


## Page 112

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
104 Useful Theorems and Formulas for SDEs
0 2 4 6 8 10
/NUL40 /NUL20 0
Time,t
ˇ.t/
ND10
ND100
ND1000
Figure 7.1 Illustration of the Karhunen–Loeve expansion of
Brownian motion with10,100, and1000 terms in the truncated
series. With increasingN the process becomes rougher and
eventually non-differentiable in the limit.
wherezn N.0;1/ are independent (see, e.g., Luo, 2006). An interest-
ing choice is, for example, to use Haar functions, which correspond to the
Lévy–Ciesielski construction of Brownian motion (see, e.g., Rogers and
Williams, 2000a).
Note that the Karhunen–Loeve expansion corresponds to the selection
'n.t/D
2
T
1=2
cos
.2n1/
2T t

(7.29)
in the preceding representation.
7.3 Girsanov Theorem
The Girsanov theorem is an important theorem in stochastics that can be
used for transforming the probability measures of SDEs. It is often used
for removing or transforming drift functions of SDEs, and it can also be
used for ﬁnding weak solutions to SDEs. The original Girsanov theorem is
given as Theorem 7.8, and it is due to Girsanov (1960). In addition to the
original article, its derivation can be found, for example, in Karatzas and
Shreve (1991) (see also Øksendal, 2003). The derivation of Theorem 7.4
from the Girsanov theorem can be found, for example, in Särkkä and Sotti-
nen (2008). Here we proceed backward from Theorem 7.4 to Theorem 7.8.
Some intuition behind the theorem is provided in the next section.


## Page 113

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.3 Girsanov Theorem 105
As in Chapter 5, we denote the whole path of the Itô process x.t/ on a
time intervalŒ0;t as follows:
XtDf x./j0tg: (7.30)
Let x.t/ be the solution to
dxD f.x;t/ dtC dˇ: (7.31)
Here we have set L.x;t/ D I for notational simplicity. In fact, the Gir-
sanov theorem can be used for general time-varying L.t/ provided that
L.t/ is invertible for eacht. This invertibility requirement can also be re-
laxed in some situations (cf. Särkkä and Sottinen, 2008).
For any ﬁniten, the joint probability density p.x.t1/; x.t2/;:::; x.tn//
exists (provided that certain technical conditions are met) for an arbitrary
ﬁnite collection of times t1;t2;:::;t n. We will now formally deﬁne the
probability density of the whole path as
p.Xt/D lim
n!1
p.x.t1/; x.t2/;:::; x.tn//; (7.32)
where the times t1;t2;:::;t n need to be selected such that they become
dense in the limit. In fact, this density is not normalizable, but we can still
deﬁne the density through the ratio between the joint probability density of
x and another process y:
p.Xt/
p.Yt/D lim
n!1
p.x.t1/; x.t2/;:::; x.tn//
p.y.t1/; y.t2/;:::; y.tn//: (7.33)
This is a ﬁnite quantity with a suitable choice ofy. We can also denote the
expectation of a functionalh.Xt/ of the path as follows:
EŒh.Xt/D
Z
h.Xt/p. Xt/ dXt: (7.34)
In physics these kinds of integrals are called path integrals (Chaichian and
Demichev, 2001a,b, see also Section 7.6). Note that this notation is purely
formal, because the densityp.Xt/ is actually an inﬁnite quantity. However,
the expectation is indeed ﬁnite. Let us now compute the ratio of probability
densities for a pair of processes.
Theorem 7.4 (Likelihood ratio of Itô processes) . Consider the Itô pro-
cesses
dxD f.x;t/ dtC dˇ; x.0/D x0;
dyD g.y;t/ dtC dˇ; y.0/D x0; (7.35)


## Page 114

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
106 Useful Theorems and Formulas for SDEs
where x.t/; y.t/2 RD and the Brownian motion ˇ.t/2 RD has a non-
singular diffusion matrix Q. Then the ratio of the probability laws of Xt
and Yt is given as
p.Xt/
p.Yt/DZ.t/; (7.36)
where
Z.t/D exp

1
2
Z t
0
Œf.y;/ g.y;/ T Q1Œf.y;/ g.y;/ d
C
Z t
0
Œf.y;/ g.y;/ T Q1 dˇ./

(7.37)
in the sense that for an arbitrary functionalh./ of the path from0 tot, we
have
EŒh.Xt/D EŒZ.t/h. Yt/; (7.38)
where the expectation is over the randomness induced by the Brownian
motion. Furthermore, under the probability measure deﬁned through the
transformed probability density
Qp.Xt/DZ.t/p. Xt/; (7.39)
the process
QˇDˇ
Z t
0
Œf.y;/ g.y;/ d (7.40)
is a Brownian motion with diffusion matrix Q.
Note that in the preceding theorem, we have required that the states and
the Brownian motion have the same dimensionality (i.e., SD D), but as
discussed in Särkkä and Sottinen (2008), it can be easily relaxed.
Remark 7.5. We need to have
E

exp
Z t
0
f.y;/ T Q1 f.y;/ d

<1;
E

exp
Z t
0
g.y;/ T Q1 g.y;/ d

<1;
(7.41)
because otherwiseZ.t/ will be zero.
From Theorem 7.4, we also get the following useful special case by
setting gD 0.


## Page 115

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.3 Girsanov Theorem 107
Corollary 7.6 (Likelihood ratio of Itô process and Brownian motion). The
likelihood ratio of the law of the process Xt as deﬁned in Equation(7.35),
to the law of the driving Brownian motion is
Z.t/D exp

1
2
Z t
0
f T.ˇ;/ Q1 f.ˇ;/ d
C
Z t
0
f T.ˇ;/ Q1 dˇ./

: (7.42)
Now we write a slightly more abstract version of Theorem 7.4, which
is roughly equivalent to the actual Girsanov theorem in the form that it is
usually found in stochastics literature.
Theorem 7.7 (Girsanov I). Let.t/ be a process that is driven by a stan-
dard Brownian motionˇ.t/ such that
E
Z t
0
 T././ d

<1; (7.43)
then under the measure deﬁned by the formal probability density
Qp.‚t/DZ.t/p.‚ t/; (7.44)
where‚tDf./j0tg and
Z.t/D exp
Z t
0
 T./ dˇ1
2
Z t
0
 T././ d

; (7.45)
the following process is a standard Brownian motion:
Qˇ.t/Dˇ.t/
Z t
0
./ d: (7.46)
Derivation Select.t/D f.y;t/ g.y;t/ and QD I in Theorem 7.4.
In fact, the preceding derivation does not yet guarantee that any selected
.t/ can be constructed like this. But still, it reveals the link between the
likelihood ratio and the Girsanov theorem. Despite the limited derivation,
Theorem 7.7 is generally true. The detailed technical conditions can be
found in the original article of Girsanov (1960).
However, Theorem 7.7 is still in the heuristic notation in terms of the for-
mal probability densities of paths. In the proper formulation of the theorem
 being “driven” by Brownian motion actually means that the process  is
adapted to the Brownian motion. To be more explicit in notation, it is also
common to write down the event space element!2 as the argument of


## Page 116

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
108 Useful Theorems and Formulas for SDEs
ˇ.t;!/ . The processes.t;!/ andZ.t;!/ should then be functions of the
event space element as well. In fact,.t;!/ should be nonanticipative (not
looking into the future) functional of Brownian motion, that is, adapted
to the natural ﬁltration Ft (Øksendal, 2003) of the Brownian motion. Fur-
thermore, the ratio of probability densities is in fact the Radon–Nikodym
derivative of the measure QP.!/ with respect to the other measure P.!/.
With these notations the Girsanov theorem looks like the following, which
is roughly the format found in stochastics books.
Theorem 7.8 (Girsanov II) . Let ˇ.t;!/ be a standard S-dimensional
Brownian motion under the probability measureP. LetW RC7! RS
be an adapted process such that the processZ deﬁned as
Z.t;!/ D exp
Z t
0
 T.t;!/ dˇ.t;!/1
2
Z t
0
 T.t;!/ .t;!/ dt

(7.47)
satisﬁesEŒZ.t;!/ D1. Then the process
Qˇ.t;!/ Dˇ.t;!/
Z t
0
.!;/ d (7.48)
is a standard Brownian motion under the probability measureQP deﬁned via
the relation
E
dQP
dP.!/
ˇˇˇˇ Ft

DZ.t;!/; (7.49)
where Ft is the natural ﬁltration of the Brownian motionˇ.!;t/ .
The Girsanov theorem can be used for eliminating the drift functions by
changing the measure suitably (see, e.g., Øksendal, 2003). The basic idea
in drift removal is to deﬁne.t/ in terms of the drift function suitably such
that in the transformed SDE the drift cancels out.
A useful application of the theorem is in ﬁnding weak solutions to SDEs.
Construction of weak solutions is based on the result that the process Qˇ.t/
is a Brownian motion under the transformed measure. We can select .t/
such that there is another easily constructed process which then serves as
the correspondingQx.t/ that solves the SDE driven by this new Brownian
motion. This is illustrated in the following corollary.
Corollary 7.9 (Weak solution of SDE) . Assume that the process x.t/
solves the stochastic differential equation
dxD f.x;t/ dtC dˇ; x.0/D x0: (7.50)


## Page 117

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.3 Girsanov Theorem 109
If we now deﬁne
Z.t/D exp

1
2
Z t
0
f T.x0Cˇ./;/ Q1 f.x0Cˇ./;/ d
C
Z t
0
f T.x0Cˇ./;/ Q1 dˇ./

; (7.51)
then the expectation of any function h./ over the SDE solution can be
expressed as
EŒh.x.t//D EŒZ.t/ h.x0Cˇ.t//: (7.52)
Furthermore, the pair.Qx;Qˇ/, where
Qx.t/D x0Cˇ.t/;
Qˇ.t/Dˇ.t/
Z t
0
f.x0Cˇ.// d;
(7.53)
is a weak solution to the SDE under the transformed probability density
Qp.Xt/DZ.t/p. Xt/.
Proof If we selectgD 0, then by Theorem 7.4Qˇ.t/ is a Brownian motion
under the transformed measure. Substituting Qx.t/ to the equation of Qˇ.t/
and rearranging then gives
Qx.t/D x0C
Z t
0
f.Qx.t// dCQˇ.t/; (7.54)
which indeed shows that the pair .Qx;Qˇ/ is a weak solution to the original
SDE.
The use of the preceding result is illustrated in the following example,
where we ﬁnd the transition density of the SDE.
Example 7.10 (Weak solution of the Beneš SDE). Consider the Itô process
dxD tanh.x/ dtC dˇ; x.0/ Dx0; (7.55)
whereˇ.t/ is a standard Brownian motion. The likelihood ratio is now
Z.t/D exp
Z t
0
tanh.x0Cˇ.t// dˇ.t/1
2
Z t
0
tanh2.x0Cˇ.t// dt

:
(7.56)


## Page 118

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
110 Useful Theorems and Formulas for SDEs
The ﬁrst integral can be evaluated by applying the Itô formula:
d.log.cosh.x0Cˇ.t////
D tanh.x0Cˇ.t// dˇ.t/C1
2.1 tanh2.x0Cˇ.t/// dt; (7.57)
that is,
Z t
0
tanh.x0Cˇ.t// dˇ.t/1
2
Z t
0
tanh2.x0Cˇ.t/// dt
D log.cosh.x0Cˇ.t/// log.cosh.x0//
Z t
0
1
2 dt; (7.58)
which gives
Z.t/D exp

log.cosh.x0Cˇ.t/// log.cosh.x0//
Z t
0
1
2 dt

D cosh.x0Cˇ.t//
cosh.x0/ exp

1
2t

: (7.59)
Because this term depends only on the state of Brownian motion at time t,
the probability density can be computed explicitly. The probability density
ofQx.t/Dx0Cˇ.t/ is
N.Qx.t/j0;t/ D 1p
2t
exp

1
2t.Qx.t/x0/2

(7.60)
and thus the probability density ofx.t/ is
p.x.t//D 1p
2t
cosh.x.t//
cosh.x0/ exp

1
2t

exp

1
2t.x.t/x0/2

:
(7.61)
Because this is true for any initial condition, it implies that the transition
density is given as
p.x.tkC1/jx.tk//D 1p2tk
cosh.x.tkC1//
cosh.x.tk// exp

1
2tk

 exp

 1
2tk
.x.tkC1/x.tk//2

; (7.62)
wheretkDtkC1tk.
The Girsanov theorem is also important in stochastic ﬁltering theory


## Page 119

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.4 Some Intuition on the Girsanov Theorem 111
(see Chapter 10). The theorem can be used as the starting point of de-
riving the so-called Kallianpur–Striebel formula (Bayes’ rule in contin-
uous time). From this, we can derive the whole stochastic ﬁltering the-
ory. The formula can also be used to form Monte Carlo (particle) methods
for approximating ﬁltering solutions. For details, see Crisan and Rozovskiˇı
(2011). In so-called continuous-discrete ﬁltering (continuous-time dynam-
ics, discrete-time measurements), the theorem has turned out to be useful
in constructing importance sampling and exact sampling methods for con-
ditioned SDEs (Beskos et al., 2006a; Särkkä and Sottinen, 2008).
7.4 Some Intuition on the Girsanov Theorem
The purpose of this section is to give some intuition to the Girsanov the-
orem presented in the previous section. We will not attempt to derive the
general theorem, but sketch a derivation of a discrete-time analogue of the
theorem. Let us start by considering the ratio of the probability densities
of a discrete-time Brownian motion and Brownian motion with a drift. Let
ˇ.tk/ be a Brownian motion with diffusion coefﬁcient q, which has been
sampled at timest0D0;t1Dt;t2D2t;::: . The sampled Brownian
motion is then a discrete-time process of the form
ˇ.tk/Dˇ.tk1/Cˇk; ˇ k N.0;tq/; (7.63)
and its joint probability density can be expressed as
p.ˇ.t1/;:::;ˇ.t n//
D
nY
kD1
 1p2tq exp

.ˇ.tk/ˇ.tk1//2
2tq

D
nY
kD1
 1p2tq exp

 ˇ2
k
2tq

D 1p2tq
n exp

 1
2tq
nX
kD1
ˇ2
k

: (7.64)
Let us now assume that we have another process deﬁned as
x.tk/Dx.tk1/CfktCˇk; ˇ k N.0;tq/; (7.65)
wherefk is some given mean sequence. We have included the factor t
so that this can be seen as a discrete-time analogue of the equation d xD
f.t/ dtC dˇ. The processx is thus a drifted version of the processˇ.


## Page 120

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
112 Useful Theorems and Formulas for SDEs
The probability density of the latter process is
p.x.t1/;x.t2/;:::;x.t n//
D
nY
kD1
 1p2tq exp

.x.tk/x.tk1/fkt/2
2tq

D
nY
kD1
"
1p2tq exp

.ˇkfkt/2
2tq
!#
D 1p2tq
n exp

 1
2tq
nX
kD1
ˇ2
kC 1
q
nX
kD1
fkˇk
 1
2q
nX
kD1
f2
k t

: (7.66)
The ratio of the probability densities now has the interesting form
p.x.t1/;:::;x.t k//
p.ˇ.t1/;:::;ˇ.t n//D exp
1
q
nX
kD1
fkˇk 1
2q
nX
kD1
f2
k t

,Zn.ˇ.t1/;:::;ˇ.t n//; (7.67)
which explicitly is only a function of the driving random variablesˇk (or
equivalentlyˇ.tk/) and the biases fk, not of the values, of x.tk/. Another
interesting thing is that the expression seems to stay meaningful even when
we take the limitn!1 . In fact, we would expect that
exp
1
q
nX
kD1
fkˇk 1
2q
nX
kD1
f2
k t

! exp
1
q
Z t
0
f.t/ dˇ 1
2q
Z t
0
f2.t/ dt

; (7.68)
which in factis true and is the essence of the Girsanov theorem. It also turns
out that we can indeed let f to depend on the process ˇ and the formula
still works. This corresponds to the results of Corollary 7.6. Similarly, we
could also derive a likelihood ratio of processes with driftsg andf, which
would lead to a result corresponding to Theorem 7.4.
BecauseZn is just the ratio of the densities, we have the following prop-
erty for expectations of an arbitrary functionh:
EŒh.x.t1/;:::;x.t n//D EŒZk.ˇ.t1/;:::;ˇ.t n//h.ˇ.t1/;:::;ˇ.t n//:
(7.69)


## Page 121

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.5 Doob’s h-Transform 113
We can now think that Zn deﬁnes a transformed probability distribution
(or measure) via
Qp.ˇ.t1/;:::;ˇ.t n//DZn.ˇ.t1/;:::;ˇ.t k//p.ˇ.t1/;:::;ˇ.t n//: (7.70)
There is yet another interesting process that can be deﬁned by
Qˇ.tk/Dˇ.tk/
X
k
fkt: (7.71)
It turns out that this process is a Brownian motion under the distribution
deﬁned byQp in the sense that
EŒZk.ˇ.t1/;:::;ˇ.t n//h.Qˇ.t1/;:::; Qˇ.tn//D EŒh.ˇ.t1/;:::;ˇ.t n//
(7.72)
for an arbitrary functionh.
7.5 Doob’s h-Transform
The Doob’sh-transform (e.g., Rogers and Williams, 2000a,b) is a method
that can be used, for example, for deriving the SDE, which is obtained by
conditioning another SDE at its end point. It can also be used for removing
the drift from an SDE as well as for analyzing hitting times (the time when
the process reaches a certain subset of the state space) and excursions of
SDEs (Rogers and Williams, 2000b). The main idea in the h-transform is
that we multiply the transition density of the original SDE with a suitable
term (involving theh-function) such that we can construct an SDE corre-
sponding to the transformed transition density.
Let p.y;t0 j x;t/ , p.y.t0/ j x.t// denote a transition density of
an SDE. Let a function h.t; x/ be deﬁned via the space–time regularity
property
h.t; x/D
Z
p.y;tCsj x;t/h.t Cs; y/ dy: (7.73)
We can now deﬁne another Markov process with the transition kernel
ph.y;t0j x;t/ ,p.y.t0/j x.t// via
ph.y;tCsj x;t/ Dp.y;tCsj x;t/ h.tCs; y/
h.t; x/ : (7.74)
Due to the property (7.73), this is a genuine probability density and thus


## Page 122

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
114 Useful Theorems and Formulas for SDEs
deﬁnes a Markov process:
Z
ph.y;tCsj x;t/ dy
D
Z
p.y;tCsj x;t/ h.tCs; y/
h.t; x/ dyD h.t; x/
h.t; x/D1: (7.75)
Assume that our SDE has the form
dxD f.x;t/ dtC L.x;t/ dˇ: (7.76)
Note that (7.73) implies thath.t; x/ obeys AthD0, where At is the gen-
eralized generator (Deﬁnition 5.3) of the SDE at hand. Using this property,
the generator ofph can be computed as
AhD lim
s#0
EhŒ.x.tCs//.x.t//
s
D lim
s#0
EŒ.x.tCs//h.t Cs; y/.x.t//h. x;t/
sh.t; x/
D 1
h.t; x/ Atfh.t; x/. x/g
D 1
h.t; x/
@h.t; x/
@t C
X
i
@h.t; x/
@xi
.x/Ch.t; x/@. x/
@xi

fi.x;t/
C1
2
X
i;j
@2Œh.t; x/. x/
@xi@xj
ŒL.x;t/ Q LT.x;t/ ij

D 1
h.t; x/
@h.t; x/
@t C
X
i
@h.t; x/
@xi
fi.x;t/
„
C1
2
X
i;j
@2h.t; x/
@xi@xj
ŒL.x;t/ Q LT.x;t/ ij

ƒ‚ …
AthD0
.x/
C
X
i
h.t; x/@. x/
@xi
fi.x;t/C1
2
X
i;j
@h.t; x/
@xj
@. x/
@xi
C@h.t; x/
@xi
@. x/
@xj
Ch.t; x/@2.x/
@xi@xj

ŒL.x;t/ Q LT.x;t/ ij



## Page 123

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.5 Doob’s h-Transform 115
D
X
i

fi.x;t/C L.x;t/ Q LT.x;t/ rh.t; x/
h.t; x/
@. x/
@xi
C1
2
X
i;j
@2.x/
@xi@xj
ŒL.x;t/ Q LT.x;t/ ij; (7.77)
which shows that the new,h-transformed, SDE is
dxD

f.x;t/C L.x;t/ Q LT.x;t/ rh.t; x/
h.t; x/

dtC L dˇ
D

f.x;t/C L.x;t/ Q LT.x;t/r logh.t; x/

dtC L dˇ: (7.78)
We can use the preceding result to condition an SDE on its end point.
Theorem 7.11. Assume that we have an SDE of form (7.76) and we wish
to condition its solution to hit x.T/ at timetD T . Theh-transform now
gives the following SDE for the end-point-conditioned process:
dxD

f.x;t/C L.x;t/ Q LT.x;t/r logp.x.T/j x.t//

dt
C L.x;t/ dˇ; (7.79)
wherer is understood to act on the variable x.t/.
Proof The conditioning of an SDE on an end point can be achieved by
Bayes’ rule:
p.x.tCs/j x.t/; x.T//D p.x.T/j x.tCs/; x.t//p. x.tCs/j x.t//
p.x.T/j x.t//
D p.x.T/j x.tCs//p. x.tCs/j x.t//
p.x.T/j x.t// :
(7.80)
We can now put
h.t; x/Dp.x.T/j x.t//: (7.81)
We can now check that thish is also valid in the sense that the space–time
regularity property (7.73) is satisﬁed:
p.x.T/j x.t//D
Z
p.x.tCs/j x.t//p. x.T/j x.tCs// dx.tCs/:
(7.82)
Substituting (7.81) to (7.78) then leads to the result in the theorem.


## Page 124

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
116 Useful Theorems and Formulas for SDEs
Example 7.12 (Conditioned Ornstein–Uhlenbeck process) . Assume that
the original process is an Ornstein–Uhlenbeck process:
dxDx dtC dˇ; x.0/ D0; (7.83)
and we wish to condition onx.T/ DxT withxTD5 andTD1. Then we
have
h.t;x/ D N.xTja.t/x; 2.t//; (7.84)
where
a.t/D exp..T t//;
2.t/D q
2 Œ1 exp.2.T t//: (7.85)
Theh-transform now gives
@
@x logh.t;x/ D @
@x

1
2 log.2 2.t// 1
22.t/ .xTa.t/x/ 2

D a.t/
2.t/ .xTa.t/x/; (7.86)
which leads to
dxD

xCqa.t/
2.t/ .xTa.t/x/

dtC dˇ: (7.87)
The solution of this SDE is illustrated in Figure 7.2.
We can also use the h-transform to remove a drift from an SDE. This
can be done by constructing a space–time regularh such that
L.x;t/ Q LT.x;t/r logh.t; x/D f.x;t/; (7.88)
which then cancels out the drift. For more applications of the transform,
see Rogers and Williams (2000b).
7.6 Path Integrals
Given the Wiener measure in the path integral form (7.15), we can also de-
ﬁne the integral (i.e., expectation) of a functionalFŒˇ with respect to this
measure. The expectation can then be formally written as a path integral
EŒFD
Z
FŒˇ exp

1
2
Z t
0
Pˇ2./ d
 tY
D0
dˇ./p
2 d
: (7.89)


## Page 125

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.6 Path Integrals 117
0 0:2 0:4 0:6 0:8 1
0 2 4 xT
Time, t
x.t /
Figure 7.2 Sample trajectories drawn from the conditioned
Ornstein–Uhlenbeck model using the Euler–Maruyama method
(see Example 7.12).
Methods for directly computing this kind of integrals and their connec-
tion with SDEs can be found, for example, in the books by Chaichian and
Demichev (2001a) and Zinn-Justin (2002). Quantum mechanics can also
be formulated in terms of special kinds of path integrals, not with respect
to a Wiener measure, but with respect to suitable oscillating measures (see,
e.g., Feynman and Hibbs, 2010; Chaichian and Demichev, 2001a; Zinn-
Justin, 2002).
As the (Wiener) path integral is just the expectation of the functional, we
can sometimes compute or approximate its value by using SDE methods.
It is possible when we can construct an SDE such that the functional can
be expressed as a function (not functional) of its solution at a certain time
point. The path integral then reduces to computing an expectation of the
SDE solution, which can be done numerically using the methods presented
in this book. This is illustrated in the following example.
Example 7.13 (Path integral). Let us compute path integral of the func-
tional
FŒˇD exp
Z t
0
ˇ.s/ ds

: (7.90)
Nowx1.t/D
Rt
0ˇ.s/ ds can be constructed as the solution to
dx1Dx2 dt;
dx2D dˇ; (7.91)


## Page 126

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
118 Useful Theorems and Formulas for SDEs
which gives x1D
Rt
0ˇ.s/ dt N.0;t 3=3/. Thus the path integral of the
functional has the value
EŒFD
Z
exp.x1/ N.x1j0;t 3=3/ dx1D exp
t3
6

: (7.92)
In practice, path integrals are often computed with respect to more gen-
eral measures than the Wiener measure. As already mentioned, the whole
quantum mechanics can be formulated in terms of path integrals with re-
spect to suitably deﬁned measures. Path integral methods for computing the
moments of SDEs are discussed, for example, in Chow and Buice (2015).
7.7 Feynman–Kac Formula
The Feynman–Kac formula (see, e.g., Øksendal, 2003; Pardoux and R ˘a¸ s-
canu, 2014) gives a link between solutions of partial differential equations
(PDEs) and certain expected values of SDE solutions. In this section, we
present the general idea by deriving the scalar Feynman–Kac formulae and
give the more general multidimensional results in the algorithms. Some re-
cent generalizations to the formulae can be found, for example, in Simon
(2015) and Piiroinen and Simon (2016).
Let us start by considering the following PDE for a functionu.x;t/ :
@u
@t Cf.x/ @u
@xC1
2L2.x/@2u
@x2D0;
u.x;T/ D‰.x/;
(7.93)
wheref.x/ ,L.x/, and ‰.x/ are some given functions and T is a ﬁxed
time instant. We deﬁne a processx.t/ on the intervalŒt0;T as follows:
dxDf.x/ dtCL.x/ dˇ; x.t 0/Dx0; (7.94)
that is, the process starts from a given x0 at timet0. Using the Itô formula


## Page 127

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.7 Feynman–Kac Formula 119
foru.x;t/ and recalling that it solves the PDE (7.93) gives
duD @u
@t dtC@u
@x dxC1
2
@2u
@x2 dx2
D @u
@t dtC@u
@xf.x/ dtC@u
@xL.x/ dˇC1
2
@2u
@x2L2.x/ dt
D
@u
@t Cf.x/ @u
@xC1
2L2.x/@2u
@x2

„ ƒ‚ …
D0
dtC@u
@xL.x/ dˇ
D @u
@xL.x/ dˇ: (7.95)
Integrating fromt0 toT now gives
u.x.T/;T/ u.x.t0/;t0/D
Z T
t0
@u
@xL.x/ dˇ; (7.96)
and by substituting the initial and terminal terms, we get the following:
‰.x.T//u.x0;t0/D
Z T
t0
@u
@xL.x/ dˇ: (7.97)
We can now take expectations of both sides and recall that the expectation
of any Itô integral is zero. Thus after rearranging, we get
u.x0;t0/D EŒ‰.x.T//: (7.98)
This means that we can solve the value of u.x0;t0/ for arbitrary x0 andt0
by starting the process in Equation (7.94) fromx0 and timet0, and letting it
run until timeT . The solution is then the expected value of‰.x.T// over
the process realizations.
This idea can also be generalized to equations of the form
@u
@t Cf.x/ @u
@xC1
2L2.x/@2u
@x2ru D0;
u.x;T/ D‰.x/;
(7.99)
wherer is a positive constant. The corresponding SDE will be the same,
but we need to apply the Itô formula to exp.rt/u.x;t/ instead ofu.x;t/ .
The resulting Feynman–Kac equationis
u.x0;t0/D exp.r.T t0// EŒ‰.x.T//: (7.100)
In practice, this result means that we can solve the PDE (7.99) by sim-
ulating paths from the SDE (7.94) and computing the empirical average


## Page 128

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
120 Useful Theorems and Formulas for SDEs
(7.100). We can generalize the result a lot, but here we restrict the gen-
eralization to the multivariate case in order to keep the result quite clean
but useful. For more general results, the reader is referred to Pardoux and
R˘a¸ scanu (2014), Simon (2015), and Piiroinen and Simon (2016). We get
the following algorithm.
Algorithm 7.14 (Solving backward PDEs with SDE simulation) . An ap-
proximation of the solutionu.x;t/ to the following backward PDE
@u.x;t/
@t C
X
i
@u.x;t/
@xi
fi.x;t/
C1
2
X
i;j
@2u.x;t/
@xi@xj

ŒL.x;t/ Q LT.x;t/ ijru. x;t/ D0;
(7.101)
where x2 RD and Q2 RSS, with the boundary condition
u.x;T/ D‰.x/ (7.102)
for any ﬁxed.x0;t0/ can be computed as follows:
1. Simulate N solutions to the following SDE from timet0 to timeT :
dxD f.x;t/ dtC L.x;t/ dˇ; x.t0/D x0; (7.103)
where x.t/2 RD and the Brownian motionˇ.t/2 RS has the diffusion
matrix Q.
2. Estimate the following expected value from the simulations:
u.x0;t0/D exp.r.T t0// EŒ‰.x.T//: (7.104)
When the system is time-invariant, we can put u.x;t/  u.x;T t/,
and we get the following algorithm for forward PDEs (see, e.g., Pardoux
and R˘a¸ scanu, 2014, for details and generalizations).
Algorithm 7.15 (Solving forward PDEs with SDE simulation). The solu-
tionu.x;t/ to the following forward PDE with x2 RD, Q2 RSS
@u.x;t/
@t D
X
i
@u.x;t/
@xi
fi.x;t/
C1
2
X
i;j
@2u.x;t/
@xi@xj

ŒL.x;t/ Q LT.x;t/ ijru. x;t/
(7.105)


## Page 129

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.7 Feynman–Kac Formula 121
with the boundary condition
u.x;0/D‰.x/ (7.106)
for any ﬁxed.x0;t0/ can be computed as follows:
1. Simulate N solutions to the following SDE from time0 to timet0:
dxD f.x/ dtC L.x/ dˇ; x.0/D x0; (7.107)
where x.t/2 RD andˇ.t/2 RS has the diffusion matrix Q.
2. Estimate the following expected value from the simulations:
u.x0;t0/D exp.rt0/ EŒ‰.x.t0//: (7.108)
The Feynman–Kac equation can also be used for computing solutions to
boundary value problems, which do not include time variables at all (see,
e.g., Øksendal, 2003; Pardoux and R˘a¸ scanu, 2014; Simon, 2015; Piiroinen
and Simon, 2016). In the following derivation, we only consider the scalar
case, but analogous derivation works for the multidimensional case as well.
Furthermore, proper derivation of the results in this section would need us
to deﬁne the concept of random stopping time, which we have not done
and thus in this sense the derivation is quite heuristic.
Consider the following boundary value problem for a functionu.x/ de-
ﬁned on some ﬁnite domain with boundary@:
f.x/ @u
@xC1
2L2.x/@2u
@x2D0;
u.x/D‰.x/; x 2@:
(7.109)
Again, let us deﬁne a processx.t/ in the same way as in Equation (7.94).
Further, the application of the Itô formula tou.x/ gives
duD @u
@x dxC1
2
@2u
@x2 dx2
D @u
@xf.x/ dtC@u
@xL.x/ dˇC1
2
@2u
@x2L2.x/ dt
D

f.x/ @u
@xC1
2L2.x/@2u
@x2

„ ƒ‚ …
D0
dtC@u
@xL.x/ dˇ
D @u
@xL.x/ dˇ: (7.110)


## Page 130

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
122 Useful Theorems and Formulas for SDEs
LetTe be the ﬁrst exit time of the process x.t/ from the domain . Inte-
gration fromt0 toTe gives
u.x.Te//u.x.t0//D
Z Te
t0
@u
@xL.x/ dˇ: (7.111)
The value of u.x/ on the boundary is ‰.x/ andx.t0/D x0, and thus we
have
‰.x.T e//u.x0/D
Z Te
t0
@u
@xL.x/ dˇ: (7.112)
Taking expectation and rearranging then gives
u.x0/D EŒ‰.x.T e//: (7.113)
That is, the value u.x0/ with arbitrary x0 can be obtained by starting the
processx.t/ fromx.t0/D x0 in Equation (7.94) at arbitrary time t0 and
computing the expectation of‰.x.T e// over the ﬁrst exit points of the pro-
cessx.t/ from the domain.
Again, we can generalize the derivation to equations of the form
f.x/ @u
@xC1
2L2.x/@2u
@x2ru D0;
u.x/D‰.x/; x 2@;
(7.114)
which gives
u.x0/D exp.r.T et0// EŒ‰.x.T e//: (7.115)
By extending this to multiple dimensions we get the following algorithm
(see Pardoux and R˘a¸ scanu, 2014, for further generalizations).
Algorithm 7.16 (Solving boundary value problems with SDE simulation).
An approximation of the solutionu.x/ to the following elliptic PDE deﬁned
on some domain x2 RD
X
i
@u.x/
@xi
fi.x/
C1
2
X
i;j
@2u.x/
@xi@xj

ŒL.x/ Q LT.x/ijru. x;t/ D0; (7.116)
where Q2 RSS, with the boundary condition
u.x/D‰.x/; x2@; (7.117)
on the edge @ of the domain , for any ﬁxed x0, can be computed as
follows:


## Page 131

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
7.7 Feynman–Kac Formula 123
0:2 0:4 0:6 0:8
0:2 0:4 0:6 0:8
/NUL1 /NUL0:5 0 0:5 1
(a) Feynman–Kac Monte Carlo
0:2 0:4 0:6 0:8
0:2 0:4 0:6 0:8
/NUL1 /NUL0:5 0 0:5 1 (b) Finite differences
0:2 0:4 0:6 0:8
0:2 0:4 0:6 0:8
0 0:1 0:2 0:3
(c) Approximation error
0 0:5 1
0 0:5 1 (d) Illustration of the method
Figure 7.3 Subﬁgure (a) shows the Monte Carlo solution to the
elliptic PDE in Example 7.17, (b) is the ﬁnite-differences
solution, and (c) shows the error between ﬁnite-differences and
Monte Carlo solutions. Subﬁgure (d) illustrates the method: a set
of Ornstein–Uhlenbeck processes is simulated until they exit the
rectangle.
1. Simulate N solutions to the following SDE from time t0 (e.g.t0D0) to
the ﬁrst exit timeTe from the domain:
dxD f.x/ dtC L.x/ dˇ; x.t0/D x0: (7.118)
In the SDE, x.t/ 2 RD and the Brownian motion ˇ.t/ 2 RS has the
diffusion matrix Q.
2. Estimate the following expected value from the simulations:
u.x0/D exp.r.T et0// EŒ‰.x.Te//: (7.119)
The use of Algorithm 7.16 is illustrated in the following example.


## Page 132

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
124 Useful Theorems and Formulas for SDEs
Example 7.17 (Solution of an elliptic PDE using SDE simulation) . We
consider the following PDE
f1.x;y/ @u.x;y/
@x Cf2.x;y/ @u.x;y/
@y
Cq
2
@2u.x;y/
@x2 C@2u.x;y/
@y2

ru.x;y/ D0 (7.120)
withf1.x;y/ D x=10,f2.x;y/ D y=10 and the following boundary
conditions on the squareŒ0;L2:
u.x;0/D sin.2x/; u.x;L/ D1x;
u.0;y/Dy; u.L;y/ D sin.2y/: (7.121)
The parameter values were selected asLD1,qD1=10, andrD1. The
result of the Feynman–Kac–based Monte Carlo solution is compared to a
ﬁnite-differences approximation in Figure 7.3. The Monte Carlo solution
was computed by starting an Ornstein–Uhlenbeck process 100 from each
point on a5050 grid and simulating it using the exact transition density
until it hit one of the boundaries.
7.8 Exercises
7.1 Consider the modiﬁed Cox–Ingersoll–Ross model (5.69) being transformed
byy.t/Dh.x.t// using the Lamperti transform
h.x/D
Z x
0
1
L.u/ duD
Z x
0
1
2
p
1Cu2 du: (7.122)
Rewrite the original process in terms of they.t/ process.
7.2 Derive the weak solution to the Ornstein–Uhlenbeck process following the
techniques in Example 7.10.
7.3 Derive the weak solution to the SDE model
dxD sin.x/ dtC dˇ;
whereˇ.t/ is a standard Brownian motion, by using the Girsanov theorem.
7.4 Consider the solution given in Example 7.12:
(a) Write down the mean and variance expressions for the solution as a
function oft.
(b) Check numerically using the Euler–Maruyama method that the solution
matches your mean and variance expressions.
7.5 Derive the conditioned SDE (similar to Example 7.12) for the Beneš model
dxD tanh.x/ dtC dˇ conditioned onx.T/ DxT .


## Page 133

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 125
7.6 Solve the following PDE by using ﬁnite differences and SDE simulation and
check that the results match. The PDE is
@2u.x;y/
@x2 C@2u.x;y/
@y2 D0
with boundary conditions
u.x;1/D cos.x=2/; u.x;1/ D cos.x=2/;
u.1;y/D cos.y=2/; u.1;y/ D cos.y=2/:


## Page 134

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8
Numerical Simulation of SDEs
This chapter is concerned with solving – or simulating from – stochas-
tic differential equations by numerical approximations. The presentation in
this chapter tries to link numerical solution concepts familiar from ordinary
differential equations to their stochastic equivalents for SDEs. We start by
going through Taylor series approximations of ODEs and then extend them
to strong and weak Itô–Taylor series approximations of SDEs. After that,
our focus will be on deterministic Runge–Kutta methods, which are an im-
portant family of explicit and implicit methods for numerical solving of dif-
ferential equations. Then we discuss strong stochastic Runge–Kutta meth-
ods and thereafter weak methods. We will try to provide general tools, but
it is worth noting that often in the case of stochastic differential equations
special structure of the problem can have a large impact on the complexity
of the solution method. In the end of the chapter, we brieﬂy discuss Verlet
methods and the Exact algorithm, of which neither strictly ﬁts under the
frameworks of Itô–Taylor and Runge–Kutta schemes. Some of the meth-
ods presented in the next chapter can also be used for numerical simulation
and hence numerical solving of SDEs.
8.1 Taylor Series of ODEs
One way to ﬁnd approximate solutions of ODEs is by using Taylor series
expansions in time direction. Even though this method as a practical ODE
numerical approximation method is quite much superseded by the Runge–
Kutta type of derivative-free methods, it still is an important theoretical tool
for ﬁnding and analyzing numerical schemes (e.g., the theory of Runge–
Kutta methods is based on the Taylor series). In the case of SDEs, the cor-
responding Itô–Taylor series solutions provide a useful basis for numerical
methods for SDEs. However, we cannot simply apply the ODE-based nu-
merical schemes to SDEs. An inconvenient fact is that in the stochastic
case, Runge–Kutta methods are not as easy to use as in the case of ODEs.
126


## Page 135

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.1 Taylor Series of ODEs 127
In this section, we derive the Taylor series–based solutions of ODEs
in detail, because the derivation of the Itô–Taylor series can be done in
an analogous way. As the idea is the same, by ﬁrst going through the de-
terministic case, it is easy to see the essential things behind the technical
details in the stochastic case.
We start by considering the following differential equation:
dx.t/
dt D f.x.t/;t/; x.t0/D given; (8.1)
which can be integrated to give
x.t/D x.t0/C
Z t
t0
f.x./;/ d: (8.2)
If the function f is differentiable, we can also write t7! f.x.t/;t/ as the
solution to the differential equation
df.x.t/;t/
dt D @
@t f.x.t/;t/ C
X
i
fi.x.t/;t/ @
@xi
f.x.t/;t/; (8.3)
where f.x.t0/;t0/ is the given initial condition. The integral form of this is
f.x.t/;t/ D f.x.t0/;t0/
C
Z t
t0
@
@t f.x./;/ C
X
i
fi.x./;/ @
@xi
f.x./;/

d: (8.4)
At this point, it is convenient to deﬁne the linear operator
L./D @
@t./C
X
i
fi
@
@xi
./ (8.5)
and rewrite the integral equation as
f.x.t/;t/ D f.x.t0/;t0/C
Z t
t0
L f.x./;/ d: (8.6)
Substituting this into Equation (8.2) gives
x.t/D x.t0/C
Z t
t0

f.x.t0/;t0/C
Z 
t0
L f.x.0/;0/ d0

d
D x.t0/C f.x.t0/;t0/.tt0/C
Z t
t0
Z 
t0
L f.x.0/;0/ d0 d:
(8.7)


## Page 136

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
128 Numerical Simulation of SDEs
The term in the integrand on the right can again be deﬁned as the solution
to the differential equation
dŒL f.x.t/;t/
dt D @ŒL f.x.t/;t/
@t C
X
i
fi.x.t/;t/ @ŒL f.x.t/;t/
@xi
D L2 f.x.t/;t/; (8.8)
which in integral form is
L f.x.t/;t/ D L f.x.t0/;t0/C
Z t
t0
L2 f.x./;/ d: (8.9)
Substituting into the equation of x.t/ then gives
x.t/D x.t0/C f.x.t0/;t/.t t0/
C
Z t
t0
Z 
t0

L f.x.t0/;t0/C
Z 0
t0
L2 f.x.00/;00/ d00

d0 d
D x.t0/C f.x.t0/;t0/.tt0/C1
2 L f.x.t0/;t0/.tt0/2
C
Z t
t0
Z 
t0
Z 0
t0
L2 f.x.00/;00/ d00 d0 d: (8.10)
If we continue this procedure ad inﬁnitum, we obtain the following Taylor
series expansion for the solution of the ODE:
x.t/D x.t0/C f.x.t0/;t0/.tt0/C 1
2Š L f.x.t0/;t0/.tt0/2
C 1
3Š L2 f.x.t0/;t0/.tt0/3C (8.11)
From the preceding derivation, we also get the result that if we truncate the
series at thenth term, the residual error is
rn.t/D
Z t
t0

Z 
t0
Ln f.x./;/ dnC1; (8.12)
which could be further simpliﬁed via integration by parts and by using
the mean value theorem. To derive the series expansion for an arbitrary
function x.t/, we can deﬁne it as the solution to the trivial differential
equation
dx.t/
dt D f.t/; x.t0/D given; (8.13)


## Page 137

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs 129
where f.t/D dx.t/=dt. Because f is independent of x, we have
Lnf.t/D dnC1x.t/
dtnC1 : (8.14)
Thus the corresponding series becomes the classical Taylor series:
x.t/D x.t0/C dx
dt.t0/.tt0/C 1
2Š
d2x
dt2.t0/.tt0/2
C 1
3Š
d3x
dt3.t0/.tt0/3C (8.15)
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs
Itô–Taylor series (see Kloeden et al., 1994; Kloeden and Platen, 1999) are
an extension of the Taylor series of ODEs to SDEs. The derivation is ba-
sically identical to the Taylor series solution in the previous section except
that we replace the time derivative computations with application of the Itô
formula.
Let us consider the following SDE:
dxD f.x;t/ dtC L.x;t/ dˇ; x.t0/p.x.t0//; (8.16)
where x.t/2 RD and the Brownian motion ˇ.t/2 RS has the diffusion
matrix Q. We also assume that the initial condition is independent of the
Brownian motion. In integral form, this SDE can be expressed as
x.t/D x.t0/C
Z t
t0
f.x./;/ dC
Z t
t0
L.x./;/ dˇ./: (8.17)
Applying the Itô formula to terms f.x.t/;t/ and L.x.t/;t/ gives the fol-
lowing for the drift:
df.x.t/;t/ D @f.x.t/;t/
@t dtC
X
i
@f.x.t/;t/
@xi
fi.x.t/;t/ dt
C
X
i
@f.x.t/;t/
@xi
ŒL.x.t/;t/ dˇ./i
C1
2
X
i;j
@2f.x.t/;t/
@xi@xj
ŒL.x.t/;t/ Q LT.x.t/;t/ ij dt; (8.18)


## Page 138

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
130 Numerical Simulation of SDEs
and the following for the dispersion matrix:
dL.x.t/;t/ D @L.x.t/;t/
@t dtC
X
i
@L.x.t/;t/
@xi
fi.x.t/;t/ dt
C
X
i
@L.x.t/;t/
@xi
ŒL.x.t/;t/ dˇ./i
C1
2
X
i;j
@2L.x.t/;t/
@xi@xj
ŒL.x.t/;t/ Q LT.x.t/;t/ ij dt: (8.19)
In integral form, these can be written as
f.x.t/;t/ D f.x.t0/;t0/C
Z t
t0
@f.x./;/
@t d
C
Z t
t0
X
i
@f.x./;/
@xi
fi.x./;/ d
C
Z t
t0
X
i
@f.x./;/
@xi
ŒL.x./;/ dˇ./i
C
Z t
t0
1
2
X
i;j
@2f.x./;/
@xi@xj
ŒL.x./;/ Q LT.x./;/ ij d;
(8.20)
and
L.x.t/;t/ D L.x.t0/;t0/C
Z t
t0
@L.x./;/
@t d
C
Z t
t0
X
i
@L.x./;/
@xi
fi.x./;/ d
C
Z t
t0
X
i
@L.x./;/
@xi
ŒL.x./;/ dˇ./i
C
Z t
t0
1
2
X
i;j
@2L.x./;/
@xi@xj
ŒL.x./;/ Q LT.x./;/ ij d: (8.21)
If we deﬁne the following two operators
Lt./D @./
@t C
X
i
@./
@xi
fiC1
2
X
i;j
@2./
@xi@xj
ŒL Q LTij;
Lˇ;j ./D
X
i
@./
@xi
Lij; forjD1;2;:::;S;
(8.22)


## Page 139

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs 131
then we can conveniently write
f.x.t/;t/ D f.x.t0/;t0/C
Z t
t0
Lt f.x./;/ d
C
X
j
Z t
t0
Lˇ;j f.x./;/ dˇj./; (8.23)
L.x.t/;t/ D L.x.t0/;t0/C
Z t
t0
Lt L.x./;/ d
C
X
j
Z t
t0
Lˇ;j L.x./;/ dˇj./: (8.24)
If we now substitute these into the expression of x.t/ in Equation (8.17),
we get
x.t/D x.t0/C f.x.t0/;t0/.tt0/C L.x.t0/;t0/.ˇ.t/ˇ.t0//
C
Z t
t0
Z 
t0
Lt f.x./;/ d dC
X
j
Z t
t0
Z 
t0
Lˇ;j f.x./;/ dˇj./ d
C
Z t
t0
Z 
t0
Lt L.x./;/ d dˇ./
C
X
j
Z t
t0
Z 
t0
Lˇ;j L.x./;/ dˇj./ dˇ./: (8.25)
This can be seen to have the form
x.t/D x.t0/C f.x.t0/;t0/.tt0/
C L.x.t0/;t0/.ˇ.t/ˇ.t0//C r.t/; (8.26)
where the remainder r.t/ consists of higher-order multiple stochastic inte-
grals involving the function itself, the drift and diffusion, and their deriva-
tives such that
r.t/D
Z t
t0
Z 
t0
Lt f.x./;/ d dC
X
j
Z t
t0
Z 
t0
Lˇ;j f.x.t/;t/ dˇj./ d
C
Z t
t0
Z 
t0
Lt L.x./;/ d dˇ./
C
X
j
Z t
t0
Z 
t0
Lˇ;j L.x./;/ dˇj./ dˇ./: (8.27)


## Page 140

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
132 Numerical Simulation of SDEs
We can now form a ﬁrst-order approximation to the solution by discarding
the remainder term:
x.t/ x.t0/C f.x.t0/;t0/.tt0/C L.x.t0/;t0/.ˇ.t/ˇ.t0//: (8.28)
This leads to the Euler–Maruyama method already discussed in Sec-
tion 3.4.
Algorithm 8.1 (Euler–Maruyama method). DrawOx.t0/ p.x.t0// and
the divide time intervalŒt0;t intoM steps of lengtht. At each stepk, do
the following:
1. Draw random variable ˇk from the distribution
ˇk N.0; Qt/: (8.29)
2. Compute
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC L.Ox.tk/;tk/ˇk: (8.30)
The strong order of convergence of a stochastic numerical integration
method can be roughly deﬁned to be the largest exponent
 such that if we
numerically solve an SDE usingMD 1=t steps of lengtht, then there
exists a constantK such that
EŒjx.tM/Ox.tM/jKt
: (8.31)
For stochastic methods, there also exists a second type of convergence,
namely weak order of convergence. This will be discussed in more detail
in the next section.
It can be shown (Kloeden and Platen, 1999) that in the case of the Euler–
Maruyama method (under assumptions of sufﬁcient regularity), the strong
order of convergence is
 D 1=2. However, as will be shown later on,
it has the weak order of convergence ˛D 1. The reason that the strong
order of convergence is just 1=2 is that the term with dˇj./ dˇ./ in the
residual, when integrated, leaves us with a term with dˇ./, which is only
of order dt1=2 . Thus we can increase the strong order to one by expanding
that term.
We can now do the same kind of expansion for the termLˇ;j L.x./;/
as we did in Equation (8.24), which leads to
Lˇ;j L.x.t/;t/ D Lˇ;j L.x.t0/;t0/C
Z t
t0
Lt Lˇ;j L.x.t/;t/ dt
C
X
j
Z t
t0
L2
ˇ;j L.x.t/;t/ dˇj./: (8.32)


## Page 141

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs 133
Substituting this into the Equation (8.25) gives
x.t/D x.t0/C f.x.t0/;t0/.tt0/C L.x.t0/;t0/.ˇ.t/ˇ.t0//
C
X
j
Lˇ;j L.x.t0/;t0/
Z t
t0
Z 
t0
dˇj./ dˇ./C remainder:
(8.33)
Now the important thing is to notice the iterated Itô integral appearing in
the equation:
Z t
t0
Z 
t0
dˇj./ dˇ./: (8.34)
Computation of this kind of integrals and more general iterated Itô inte-
grals turns out to be quite nontrivial. However, assuming that we can indeed
compute the integral, as well as draw the corresponding Brownian incre-
ment (recall that the terms are not independent), we can form the following
scheme known as the Milstein method.
Algorithm 8.2 (Milstein method). DrawOx.t0/p.x.t0// and divide the
time interval Œt0;t intoM steps of length t. At each step k, do the fol-
lowing:
1. Jointly draw a Brownian motion increment and the iterated Itô integral
of it:
ˇkDˇ.tkC1/ˇ.tk/;
v;kD
Z tkC1
tk
Z 
tk
dˇj./ dˇ./:
(8.35)
2. Compute
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC L.Ox.tk/;tk/ˇk
C
X
j
"X
i
@L
@xi
.Ox.tk/;tk/ Li;j.Ox.tk/;tk/
#
v;k: (8.36)
The strong and weak orders of the preceding method are both one
(
D˛D1). However, the difﬁculty is that drawing the iterated stochastic
integral jointly with the Brownian motion is hard (cf. Kloeden and Platen,
1999). But if the noise is additive, that is,L.x;t/ D L.t/, then the Milstein
method reduces to the Euler–Maruyama method. Thus in the additive noise
case, the strong order of Euler–Maruyama is
D1 as well.


## Page 142

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
134 Numerical Simulation of SDEs
In the scalar case, we can compute the iterated stochastic integral:
Z t
t0
Z 
t0
dˇ./ dˇ./D 1
2

.ˇ.t/ˇ.t0//2q.t t0/

: (8.37)
Thus in the scalar case, we can write down the Milstein method explicitly
as follows.
Algorithm 8.3 (Scalar Milstein method). DrawOx.t0/p.x.t0// and di-
vide the time interval Œt0;t intoM steps of length t. At each step k, do
the following:
1. Draw random variable ˇk from the distribution
ˇk N.0;qt/: (8.38)
2. Compute
Ox.tkC1/DOx.tk/Cf.Ox.tk/;tk/tCL.Ox.tk/;tk/ˇk
C1
2
@L.Ox.tk/;tk/
@x L.Ox.tk/;tk/.ˇ2
kqt/: (8.39)
We could now form even higher-order Itô–Taylor series expansions by
including more terms into the series. However, if we try to derive higher-
order methods than the Milstein method, we encounter higher-order iter-
ated Itô integrals, which will turn out to be very difﬁcult to compute. For-
tunately, the additive noise case is much easier and often useful as well.
Now consider the case that L is in fact constant, which implies that
Lt LD Lˇ;j LD0. In that case, Equation (8.25) gives
x.t/D x.t0/C f.x.t0/;t0/.tt0/C L.ˇ.t/ˇ.t0//
C
Z t
t0
Z 
t0
Lt f.x./;/ d dC
X
j
Z t
t0
Z 
t0
Lˇ;j f.x.t/;t/ dˇj d:
(8.40)
As the identities in Equation (8.24) are completely general, we can also


## Page 143

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.2 Itô–Taylor Series–Based Strong Approximations of SDEs 135
apply them to Lt f.x.t/;t/ and Lˇ;j f.x.t/;t/ , which gives
Lt f.x.t/;t/ D Lt f.x.t0/;t0/C
Z t
t0
L2
t f.x.t/;t/ dt
C
X
j
Z t
t0
Lˇ;j Lt f.x.t/;t/ dˇj; (8.41)
Lˇ;j f.x.t/;t/ D Lˇ;j f.x.t0/;t0/C
Z t
t0
Lt Lˇ;j f.x.t/;t/ dt
C
X
j
Z t
t0
L2
ˇ;j f.x.t/;t/ dˇj: (8.42)
Substituting these identities into Equation (8.40) gives
x.t/D x.t0/C f.x.t0/;t0/.tt0/C L.ˇ.t/ˇ.t0//
C Lt f.x.t0/;t0/.tt0/2
2
C
X
j
Lˇ;j f.x.t0/;t0/
Z t
t0
Œˇj./ˇj.t0/ dC remainder: (8.43)
Thus the resulting approximation is
x.t/ x.t0/C f.x.t0/;t0/.tt0/
C L.ˇ.t/ˇ.t0//C Lt f.x.t0/;t0/.tt0/2
2
C
X
j
Lˇ;j f.x.t0/;t0/
Z t
t0
Œˇj./ˇj.t0/ d: (8.44)
Note that the termˇ.t/ˇ.t0/ and the integral
Rt
t0
Œˇj./ˇj.t0/ d really
refer to the same Brownian motion and thus the terms are correlated. For-
tunately, in this case both the terms are Gaussian and it is easy to compute
their joint distribution:
Rt
t0
Œˇ./ˇ.t0/ d
ˇ.t/ˇ.t0/

 N
0
0

;
Q.tt0/3=3 Q.tt0/2=2
Q.tt0/2=2 Q.tt0/

:
(8.45)
From the resulting approximation, we get a strong order 1.5 Itô–Taylor
expansion method, which has also been recently studied in the context of
ﬁltering theory (Arasaratnam et al., 2010; Särkkä and Solin, 2012).


## Page 144

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
136 Numerical Simulation of SDEs
Algorithm 8.4 (Strong order 1.5 Itô–Taylor for constant dispersion ma-
trix). DrawOx.t0/p.x.t0// and divide time intervalŒt0;t intoM steps
of lengtht. At each stepk, do the following:
1. Draw random variables k andˇk from the joint distribution
k
ˇk

 N
0
0

;
Qt3=3 Qt2=2
Qt2=2 Qt

: (8.46)
2. Compute
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC Lˇk
C ak.Ox.tk//t2
2 C
X
j
bk;j.Ox.tk//k; (8.47)
where
ak.Ox.tk//D @f.Ox.tk/;tk/
@t C
X
i
@f.Ox.tk/;tk/
@xi
fi.Ox.tk/;tk/
C1
2
X
i;j
@2f.Ox.tk/;tk/
@xi@xj
ŒL Q LTij;
bk;j.Ox.tk//D
X
i
@f.Ox.tk/;tk/
@xi
Lij:
(8.48)
As an interesting note on higher-order iterated Itô integrals, we point
out a relation for the scalar case originally published by Itô himself (Itô,
1951). Applying the Itô formula for n times iterated Itô integrals leads to
the following equation:
nŠ
Z t
t0
Z n
t0

Z 2
t0
dˇ.1/ dˇ.2/::: dˇ.n/
Dqn=2.tt0/n=2 Hn
ˇ.t/ˇ.t0/p
q.t t0/

; (8.49)
where Hn.t/ denotes the probabilists’ Hermite polynomials (H 0.t/ D
1; H1.t/ D t; H2.t/ D t21; H3.t/ D t33t;::: ). They are deﬁned
through the recursion HnC1.t/Dt Hn.t/ d=dt Hn.t/. The result in Equa-
tion (8.37) can easily be veriﬁed from the preceding formula.


## Page 145

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.3 Weak Approximations of Itô–Taylor Series 137
8.3 Weak Approximations of Itô–Taylor Series
The interest in solving SDEs is not always in the solution trajectories. Of-
ten, more interest is put into the distribution of the trajectories at a given
time point rather than their paths. Thus we might be interested in forming
approximations that describe accurately enough the probability distribution
of the state trajectories. Weak approximations of Itô processes, that is, pro-
cesses with approximately the same probability distribution, provide much
more freedom in forming the approximations.
For instance, we can replace the distribution of x.t0/ with some other
appropriate probability distribution, or more importantly we can replace
the random increments ˇk with more convenient approximations Oˇk
with similar moment properties.
The kind of approximations required here are much weaker than those
required by the strong convergence criterion. The weak order of conver-
gence can be deﬁned to be the largest exponent˛ such that
j EŒg.x.tM// EŒg.Ox.tM//j Kt ˛ (8.50)
for any polynomial function g. When the diffusion coefﬁcient vanishes
(L.x;t/ D 0), this weak convergence criterion with g.x/D x reduces
to the usual deterministic convergence criterion for ordinary differential
equations – as does the criterion for strong convergence.
For weak convergence, we only need to approximate the distribution of
the Itô process x.t/, so we can replace the Gaussian increments by other
random variables with similar moment properties. Considering this, we
can replace the increments in Algorithm 8.1 with approximate increments
Oˇk. This leads to the simpliﬁed weak Euler–Maruyama scheme
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC L.Ox.tk/;tk/Oˇk; (8.51)
where theOˇ.j/
k ;j D1;2;:::;S; must be independent random variables
fulﬁlling suitable moment conditions. For example, we could use the fol-
lowing two-point distributed random variables (Kloeden and Platen, 1999)
P.Oˇ.j/
k D˙
p
t/D 1
2: (8.52)
As we noticed in the previous section, multidimensional and higher-
order Itô–Taylor approximations also involve additional random variables
and iterated Itô integrals, which make them difﬁcult to use in practice.
The same applies to weak Itô–Taylor approximations, but handling them
is much simpler than in the case of strong approximations. As a rule of
thumb, Kloeden and Platen (1999) state that an Itô–Taylor approximation


## Page 146

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
138 Numerical Simulation of SDEs
converges with any desired weak order˛D1:0;2:0;::: , when the number
of stochastic integrals up to multiplicity ˛ are included in the expansion.
As an example, they give the following scalar time-invariant weak order
˛D2:0 scheme:
Algorithm 8.5 (Scalar weak order 2.0 Itô–Taylor method). DrawOx.t0/
p.x.t0// and divide the time interval Œt0;t intoM steps of length t. At
each stepk, do the following:
Ox.tkC1/DOx.tk/Cf.Ox.tk//tCL.Ox.tk//Oˇk
C1
2L.Ox.tk//@L.Ox.tk//
@x ..Oˇk/2t/
C@f.Ox.tk//
@x L.Ox.tk//Ok
C1
2

f.Ox.tk//@f.Ox.tk//
@x C1
2
@2f.Ox.tk//
@x2 L2.Ox.tk//

.t/2
C

f.Ox.tk//@L.Ox.tk//
@x C1
2
@2L.Ox.tk//
@x2 L2.Ox.tk//

OˇktOk

:
(8.53)
We can choose (see section 14.2 in Kloeden and Platen, 1999, and Eqs. 29–
32)
OˇkDˇk and OkD 1
2ˇkt (8.54)
withˇk N.0;t/ , or instead of considering the normal increments,
we could use
OˇkD.t/1=2k and OkD 1
2.t/3=2k; (8.55)
whereks are independent three-point distributed random variables with
P.kD˙
p
3/D 1
6 and P.kD0/D 2
3: (8.56)
As an example of an application of the preceding algorithm, we provide
the following.
Example 8.6 (Simulating from a trigonometric nonlinear SDE). Consider
the nonlinear Itô stochastic differential equation model:
dxD
 1
10
2
sin.x/ cos3.x/ dtC 1
10 cos2.x/ dˇ; x.0/ Dx0:
(8.57)


## Page 147

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.3 Weak Approximations of Itô–Taylor Series 139
0:4 0:6 0:8 1 1:2
x
(a) Three-point increments
0:4 0:6 0:8 1 1:2
x
Exact
Weak order 2:0 (b) Gaussian increments
Figure 8.1 The exact probability density attD10, and
histograms of the 10,000 samples simulated by the weak order 2.0
scheme from Example 8.6 both using the three-point distributed
and Gaussian increments. Both solutions (a) and (b) have similar
moment properties.
This model has the solutionx.t/D arctan.1=10ˇ.t/ C tan.x0// which we
will use as ground truth, where ˇ.t/ is a standard Brownian motion. The
ﬁrst and second derivatives of the driftf.x/ and diffusionL.x/ functions
are:
df.x/
dx D 1
100 cos2.x/.2 cos.2x/1/; dL.x/
dx D 1
5 sin.x/ cos.x/;
d2f.x/
dx2 D 1
100.sin.2x/C2 sin.4x//; d2L.x/
dx2 D 1
5 cos.2x/:
We apply the weak order 2.0 scheme in Algorithm 8.5 to this problem, and
characterize the solution at tD10. We use a large step size tD1 and
simulate 10,000 trajectories. Figure 8.1 shows histograms of the values
atOx.10/ both using the three-point distributed increments and Gaussian
increments. Even though both solutions have similar moment properties
(mean, variance, skewness, kurtosis, . . . ), the Gaussian increments appear
neater in the visualization.


## Page 148

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
140 Numerical Simulation of SDEs
8.4 Ordinary Runge–Kutta Methods
Runge–Kutta (RK) methods are an important family of iterative methods
for approximation of solutions of ordinary differential equations. The name
stems from the German mathematicians Carl Runge and Martin Wilhelm
Kutta, upon whose work many of the modern-day methods have been built.
The simplest Runge–Kutta method is the (forward) Euler scheme (see
Algorithm 2.6), which is based on sequential linearization of the ODE sys-
tem. This method is easy to understand and implement, but the global error
of the method depends linearly on the step sizet. The innovation Runge
came up with was that subdivision of the integration interval into interme-
diate steps (as had earlier been done in quadrature methods, e.g., the mid-
point rule, where the integrand was independent oft), can help build more
efﬁcient methods. Such higher-order methods can reach the same precision
with fewer steps, which makes them appealing.
Consider the ﬁrst-order nonlinear ODE from Chapter 2
dx.t/
dt D f.x.t/;t/; x.t0/D given; (8.58)
which can be integrated to give
x.t/D x.t0/C
Z t
t0
f.x./;/ d: (8.59)
Recall from the previous chapter that we used aTaylor series expansionfor
the solution of the ODE
x.t/D x.t0/C f.x.t0/;t0/.tt0/
C 1
2Š L f.x.t0/;t0/.tt0/2
C 1
3Š L2 f.x.t0/;t0/.tt0/3
C ; (8.60)
where we used the linear operator
L./D @
@t./C
X
i
fi
@
@xi
./ (8.61)
to come up with the convenient formulation of the series. Thus the series


## Page 149

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.4 Ordinary Runge–Kutta Methods 141
expansion is equal to
x.t/D x.t0/C f.x.t0/;t0/.tt0/
C 1
2Š
@
@t f.x.t0/;t0/C
X
i
fi.x.t0/;t0/ @
@xi
f.x.t0/;t0/

.tt0/2
C 1
3Š
@ŒL f.x.t0/;t0/
@t C
X
i
fi.x.t0/;t0/@ŒL f.x.t0/;t0/
@xi

.tt0/3
C (8.62)
If we were only to consider the terms up tot, we would recover the Euler
method, which is a derivative-free Runge–Kutta scheme. However, here we
wish to get hold of higher-order methods. For the sake of simplicity, we
now stop at the term.tt0/2D.t/2 and write
x.t0Ct/ x.t0/C f.x.t0/;t0/t
C1
2
@
@t f.x.t0/;t0/C
X
i
fi.x.t0/;t0/ @
@xi
f.x.t0/;t0/

.t/2: (8.63)
This equation still contains derivatives, and we aim to get rid of them by
writing the expression in terms of the function f.;/ evaluated at various
points. That is, we seek the following form:
x.t0Ct/ x.t0/Ca f.x.t0/;t0/t
Cb f.x.t0/Cc f.x.t0/;t0/t;t 0Cdt/t; (8.64)
wherea;b;c; andd are unknown. The last term can be approximated with
a truncated Taylor expansion (linearization) around f.x.t0/;t0/ with the
increments chosen as follows:
f.x.t0/Cc f.x.t0/;t0/t;t 0Cdt/  f.x.t0/;t0/
Cc
X
i
fi.x.t0/;t0/ @
@xi
f.x.t0/;t0/

tCd @f.x.t0/;t0/
@t t:
(8.65)
Combining the preceding two equations gives the following:
x.t0Ct/ x.t0/C.aCb/ f.x.t0/;t0/t
Cb

c
X
i
fi.x.t0/;t0/ @
@xi
f.x.t0/;t0/Cd @f.x.t0/;t0/
@t

.t/2:
(8.66)


## Page 150

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
142 Numerical Simulation of SDEs
If we now compare the preceding equation to the original truncated Tay-
lor expansion in Equation (8.63), we get the following conditions for our
coefﬁcients:
aD 1
2; b D 1
2; c D1; and dD1: (8.67)
Thus the approximative step given by this method can be written as
Ox.t0Ct/D x.t0/C1
2

f.Qx1;t0/C f.Qx2;t0Ct/

t; (8.68)
where the supporting values are given by
Qx1D x.t0/;
Qx2D x.t0/C f.Qx1;t0/t: (8.69)
What we derived here is a two-stage method (actually the Heun method
presented in Algorithm 2.7) with the ﬁnite differences determined by the
choices we made in truncating the series expansion. The choices of how
and what to truncate determine the number of terms in the expansion
and thus also affect the number of equations to solve. Coming up with
higher-order methods becomes increasingly complicated with the number
of terms. The general principle, however, remains the same, and Runge–
Kutta methods are constructed by evaluating the function f.;/ at a num-
ber of points and weighting these evaluations.
We can write down a general s-stage algorithm for ordinary Runge–
Kutta methods as follows:
Algorithm 8.7 (Runge–Kutta methods). Start fromOx.t0/D x.t0/ and di-
vide the integration interval Œt0;t into M steps t0 < t1 < t2 < ::: <
tMDt such thattDtkC1tk. The integration method is deﬁned by its
Butcher tableau:
c A
˛T
: (8.70)
On each stepk, approximate the solution as follows:
Ox.tkC1/DOx.tk/C
sX
iD1
˛i f.Qxi;Qti/t; (8.71)
whereQtiDtkCcit andQxiDOx.tk/CPs
jD1Ai;j f.Qxj;Qtj/t .


## Page 151

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.4 Ordinary Runge–Kutta Methods 143
As implied by the preceding algorithm, the ordinary Runge–Kutta meth-
ods are commonly expressed in terms of a table called theButcher tableau:
c1 A1;1
c2 A2;1 A2;2
::: ::: :::
cs As;1 As;2 ::: A s;s
˛1 ˛2 ::: ˛ s
: (8.72)
An explicit Runge–Kutta method is said to be consistent if Pi1
jD1Ai;j D
ci, foriD2;3;:::;s .
We present the Butcher tableau for two common Runge–Kutta meth-
ods. The ﬁrst method is the forward Euler method (see Algorithm 2.6)
and the second the classical fourth-order Runge–Kutta method (see Algo-
rithm 2.8):
Example 8.8 (Forward Euler). The forward Euler scheme in Algorithm 2.6
has the Butcher tableau:
0 0
1 ; (8.73)
which gives the recursionOx.tkC1/DOx.tk/C f.Ox.tk/;tk/t .
Example 8.9 (Fourth-order Runge–Kutta method) . The classical RK4
method in Algorithm 2.8 has the following Butcher tableau:
0
1
2
1
21
2 0 1
2
1 0 0 1
1
6
1
3
1
3
1
6
: (8.74)
The preceding Runge–Kutta schemes are all so-called explicit schemes.
Explicit schemes can suffer from numerical instability, when the solution
includes rapidly varying terms. Such problems are called stiff equations.
Stiff equations require explicit schemes to use small step sizes in order to
not diverge from the solution path.
A better-suited family of solvers for stiff problems are the so-called im-
plicit Runge–Kutta methods, which provide additional stability to the iter-
ative solution. For implicit methods, the Buther tableau is no longer lower-
triangular, but the tableau can be full. The consequence of using a full table
is that at every step, a system of algebraic equations has to be solved. This
increases the computational cost considerably. The advantage of implicit


## Page 152

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
144 Numerical Simulation of SDEs
Runge–Kutta methods over explicit ones is their greater stability, especially
when applied to stiff equations.
The simplest example of an implicit method is the backward Euler
scheme.
Example 8.10 (Backward Euler). The implicit backward Euler scheme has
the Butcher tableau:
1 1
1 ; (8.75)
which gives the recursionOx.tkC1/DOx.tk/C f.Ox.tkC1/;tkCt/t .
There are a lot of further topics to consider in Runge–Kutta methods,
such as stability analysis and adaptive step size methods. We, however,
will not discuss these issues here.
Example 8.11 (Comparison of ODE solvers) . We study the two-
dimensional nonlinear ordinary differential equation system:
Px1Dx1x2x3
1;
Px2Dx1Cx2x3
2: (8.76)
This system has only one ﬁxed point, xD .0;0/ (an unstable spiral), but
it also has a limit cycle. We aim to test various Runge–Kutta methods by
simulating trajectories of this problem.
We use a time-span of Œ0;10 , with a step size of t D 24. The
methods demonstrated are the forward (explicit) Euler method, the Heun
method, the backward (implicit) Euler method, and the classical fourth-
order Runge–Kutta method. Figure 8.2 shows six trajectories for each
method, starting from respective quadrants. Ideally, the results should be
symmetrical, but especially the forward Euler results do not match the rest.
8.5 Strong Stochastic Runge–Kutta Methods
A practical disadvantage of the Itô–Taylor approximations considered ear-
lier in this chapter is that the derivatives of various orders of the drift and
diffusion functions must be determined and evaluated at each step. How-
ever, there are discrete time approximations that avoid the use of deriva-
tives. They are in general referred to as stochastic Runge–Kutta methods.
Stochastic versions of the Runge–Kutta methods are not as simple as the
deterministic methods.
As has been discussed earlier, the Euler–Maruyamascheme can easily


## Page 153

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.5 Strong Stochastic Runge–Kutta Methods 145
Forward EulerHeun
Backward Euler RK4
/NUL2 2
/NUL2
2
x1
x2
Figure 8.2 Demonstration of four Runge–Kutta schemes for the
same problem with a step size oftD24 (see Example 8.11).
be constructed by discretizing the time interval and formulating the solver
SDE as a recursive algorithm. Thus, the Euler–Maruyama scheme can be
seen as the simplest stochastic Runge–Kutta method – similar to how we
interpreted the Euler method as a simple ordinary Runge–Kutta scheme.
In practice, a higher-order stochastic Runge–Kutta method can be de-
rived, for example, by replacing the closed-form derivatives in the Milstein
method (Algorithm 8.2 or 8.3) with suitable ﬁnite differences (see Kloe-
den et al., 1994; Kloeden and Platen, 1999). If we heuristically replace the
partial differential in Algorithm 8.3 with a ﬁnite difference, we can write a
method for scalar time-invariant models:
Ox.tkC1/DOx.tk/Cf.Ox.tk//tCL.Ox.tk//ˇk
C 1
2
p
t

L.Qx/L.Ox.tk//

.ˇk/2qt

(8.77)
with supporting valueQxDOx.tk/CL.Ox.tk//
p
t. This method is of strong
order 1.0.
However, we still cannot get rid of the iterated Itô integral occurring in
the Milstein method. An important thing to note is that stochastic versions
of Runge–Kutta methods cannot be derived as simple extensions of the
deterministic Runge–Kutta methods – see Burrage et al. (2006), which is a
response to the article by Wilkie (2004).
To provide a more widely applicable perspective on the methods, we fol-
low a similar derivation as we did for the ordinary Runge–Kutta methods.


## Page 154

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
146 Numerical Simulation of SDEs
Recall the following multidimensional SDE formulation
dxD f.x.t/;t/ dtC L.x.t/;t/ dˇ; x.t0/p.x.t0//; (8.78)
where x.t/ 2 RD is the state, ˇ.t/ 2 RS is a Brownian motion with
diffusion matrix Q, and f.x;t/ and L.x;t/ are some given functions. In
integral form, the equation can be expressed as
x.t/D x.t0/C
Z t
t0
f.x./;/ dC
Z t
t0
L.x./;/ dˇ./: (8.79)
As we saw in the previous chapter, applying the Itô formula to the terms
f.x.t/;t/ and L.x.t/;t/ and collecting the terms gives an Itô–Taylor series
expansion of the solution:
x.t/D x.t0/C f.x.t0/;t0/.tt0/C L.x.t0/;t0/.ˇ.t/ˇ.t0//
C
Z t
t0
Z 
t0
Lt f.x./;/ d d
C
X
i
Z t
t0
Z 
t0
Lˇ;i f.x./;/ dˇi./ d
C
Z t
t0
Z 
t0
Lt L.x./;/ d dˇ./
C
X
i
Z t
t0
Z 
t0
Lˇ;i L.x./;/ dˇi./ dˇ./: (8.80)
Similarly, as we did in the previous section, we can consider truncated
series expansions of various degrees for each of these terms. Collecting the
terms can give a similar kind of formulation in terms of tabulated values as
we did for the ordinary RK schemes. The extra terms involving the iterated
and cross-term Itô integrals complicate the formulation.
Rößler (2010) considers a general class of multidimensional strong order
1.0 stochastic Runge–Kutta schemes, where iterated integrals are avoided
in the scheme and they only appear in the supporting values. A more gen-
eral formulation is given in the next section, where weak order methods
are considered. The general multidimensional schemes by Rößler can be
summarized as the following algorithm.
Algorithm 8.12 (Stochastic Runge–Kutta method of strong order 1.0) .
Start fromOx.t0/p.x.t0// and divide the integration interval Œt0;t into


## Page 155

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.5 Strong Stochastic Runge–Kutta Methods 147
M steps of length t. The integration method is characterized by its ex-
tended Butcher tableau:
c.0/ A.0/ B.0/
c.1/ A.1/ B.1/
˛T 

.1/T 

.2/T
: (8.81)
On each stepk, approximate the solution trajectory as follows:
Ox.tkC1/DOx.tk/C
X
i
˛i f.Qx.0/
i ;tkCc.0/
i t/t
C
X
i;n
.
.1/
i ˇ.n/
k C
.2/
i
p
t/ Ln.Qx.n/
i ;tkCc.1/
i t/
(8.82)
with the supporting values
Qx.0/
i DOx.tk/C
X
j
A.0/
i;j f.Qx.0/
j ;tkCc.0/
j t/t
C
X
j;l
B.0/
i;j Ll.Qx.l/
j ;tkCc.1/
j t/ˇ .l/
k ; (8.83)
Qx.n/
i DOx.tk/C
X
j
A.1/
i;j f.Qx.0/
j ;tkCc.0/
j t/t
C
X
j;l
B.1/
i;j Ll.Qx.l/
j ;tkCc.1/
j t/ .l;n/
kp
t
; (8.84)
foriD1;2;:::;s andnD1;2;:::;S .
The increments in Algorithm 8.12 are given by the Itô integrals:
ˇ.i/
k D
Z tkC1
tk
dˇi./ and (8.85)
.i;j/
k D
Z tkC1
tk
Z 2
tk
dˇi.1/ dˇj.2/; (8.86)
fori;j D1;2;:::;S . The incrementsˇ.i/
k are normally distributed ran-
dom variables such that jointlyˇk N.0; Qt/. The iterated stochastic
Itô integrals.i;j/
k are trickier. For these methods, wheniDj the multi-
ple Itô integrals can be rewritten as
.i;i/
k D 1
2

ˇ.i/
k
2
Qi;it

; (8.87)


## Page 156

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
148 Numerical Simulation of SDEs
which follows from the results given in Equation (8.49). This also general-
izes to higher orders. Exact simulation of the integrals.i;j/
k , wheni¤j ,
is not possible, but can be approximated. See Wiktorsson (2001) for an ap-
proximative scheme, and Gilsing and Shardlow (2007) for implementation
details.
Example 8.13 (Euler–Maruyama Butcher tableau). The Euler–Maruyama
method has the extended Butcher tableau:
0 0 0
0 0 0
1 1 0
(8.88)
and as we recall from earlier, it is of strong order0:5.
Coming up with useful and valid stochastic Runge–Kutta schemes is a
delicate process, which we will not consider here. Instead, we go through a
rather efﬁcient and general scheme proposed by Rößler (2010), which can
be formulated as the following algorithm.
Algorithm 8.14 (Strong order 1.0 stochastic Runge–Kutta due to Rößler).
Consider a stochastic Runge–Kutta method with the following extended
Butcher tableau:
0
1 1 0
0 0 0 0 0
0
1 1 1
1 1 0 1 0
1
2
1
2 0 1 0 0 0 1
2 1
2
(8.89)
which corresponds to the following iterative scheme
Ox.tkC1/DOx.tk/C1
2
˚
f.Ox.tk/;tk/C f.Qx.0/
2 ;tkCt/

t
C
X
n
˚
ˇ.n/
k Ln.Ox.tk/;tk/
C1
2
p
t

Ln.Qx.n/
2 ;tkCt/ Ln.Qx.n/
3 ;tkCt/

(8.90)


## Page 157

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.5 Strong Stochastic Runge–Kutta Methods 149
/NUL4 /NUL2 0 2 4
0 5 10
x1
x2
(a) Deterministic
/NUL4 /NUL2 0 2 4
0 5 10
x1
x2 (b) Stochastic
Figure 8.3 Trajectories simulated from the Dufﬁng van der Pol
oscillator model in Example 8.15. The deterministic solutions
(qD0) converge to either of the two steady states. The
realizations of the noise are identical for each of the stochastic
(qD0:52) trajectories.
with the supporting valuesQx.0/
2 DOx.tk/C f.Ox.tk/;tk/t , and
Qx.n/
2 DOx.tk/C f.Ox.tk/;tk/tC
X
l
Ll.Ox.tk/;tk/.l;n/
kp
t
; (8.91)
Qx.n/
3 DOx.tk/C f.Ox.tk/;tk/t
X
l
Ll.Ox.tk/;tk/.l;n/
kp
t
: (8.92)
Example 8.15 (Dufﬁng van der Pol oscillator). Consider a simpliﬁed ver-
sion of a Dufﬁng van der Pol oscillator
RxCPx.˛x2/xDxw.t/; ˛ 0; (8.93)
driven by multiplicative white noisew.t/ with spectral densityq. The cor-
responding two-dimensional Itô stochastic differential equation with the
state x.t/D.x;Px/ is
dx1
dx2

D
 x2
x1.˛x2
1/x2

dtC
0
x1

dˇ; (8.94)
whereˇ.t/ is a one-dimensional Brownian motion. The deterministic ver-
sion (when qD 0) has the steady states xD .0;0/ and xD .˙p˛;0/ ,


## Page 158

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
150 Numerical Simulation of SDEs
0 5 10 15 20
/NUL5 0 5 10
Time, t
x
x1.t /
x2.t /
Figure 8.4 Evolution of the trajectories in the stochastic Dufﬁng
van der Pol oscillator model in Figure 8.3.
the ﬁrst of which is also a degenerate stationary state of the stochastic
differential equation.
Let˛D 1. First we study the deterministic solution with no diffusion
(qD0). Figure 8.3 shows 10 trajectories, each with different initial values
x1.0/. We use a step size of t D 25 and a time span of Œ0;20 . We
then replicate the result, but using the SDE model with q D 0:52 and
identical realizations of noise in each trajectory. We use the strong order
1.0 method in Algorithm 8.14 for simulating the trajectories. Figure 8.4
shows the evolution of the trajectories.
Higher-order methods can be formulated by considering more terms in
the Itô–Taylor expansion. This, however, might not be very practical, as
the number of required function evaluations grows, as does the complex-
ity of the scheme. However, for models with some special structure this
might still be feasible. Examples of such cases are models with commuta-
tive noise, additive noise models, where L.x;t/  L.t/, or diagonal noise
models.
A number of stochastic Runge–Kutta methods have also been presented
by Kloeden et al. (1994) and Kloeden and Platen (1999) as well as by
Rößler (2006). If the noise is additive, then it is possible to derive a Runge–
Kutta counterpart of the method in Algorithm 8.4, which uses ﬁnite differ-
ence approximations instead of the closed-form derivatives (Kloeden and
Platen, 1999). When L is constant, we get the following algorithm.
Algorithm 8.16 (Strong order 1.5 SRK method for constant diffusion) .


## Page 159

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.6 Weak Stochastic Runge–Kutta Methods 151
DrawOx.t0/p.x.t0// and divide the time intervalŒt0;t intoM steps of
lengtht. At each stepk, do the following:
1. Draw random variables k andˇk from the joint distribution
k
ˇk

 N
0
0

;
Qt3=3 Qt2=2
Qt2=2 Qt

: (8.95)
2. Compute
Ox.tkC1/DOx.tk/C f.Ox.tk/;tk/tC Lˇk
C1
4
X
j

f.QxC
j ;tkC1/2 f.Ox.tk/;tk/C f.Qx
j;tkC1/

t
C 1
2
p
t
X
j

f.QxC
j ;tkC1/ f.Qx
j;tkC1/

k;j; (8.96)
where the supporting values are given by
Qx˙
j DOx.tk/C 1
S f.Ox.tk/;tk/t˙ Lj
p
t; (8.97)
forjD1;2;:::;S .
8.6 Weak Stochastic Runge–Kutta Methods
Earlier in this chapter, we saw that it is possible to form weak approxi-
mations to SDEs, where the interest is not in the solution trajectories, but
the distributions of them. It is often computationally convenient to replace
the weak Itô–Taylor approximations by Runge–Kutta style approximations
that avoid the use of derivatives of the drift and diffusion coefﬁcients.
As an example of such a weak scheme, we consider the following scalar
weak order 2.0 Runge–Kutta scheme for time-invariant SDEs due to Platen
(see Kloeden and Platen, 1999). The iteration takes the following form:
Ox.tkC1/DOx.tk/C1
2

f.Ox.tk//Cf.Qx/

t
C1
4

L.QxC/C2L.Ox.tk//CL.Qx/

Oˇk
C 1
4
p
t

L.QxC/L.Qx/

.Oˇk/2qt

(8.98)
with supporting values Qx D Ox.tk/Cf.Ox.tk//t CL.Ox.tk//Oˇk and
Qx˙DOx.tk/Cf.Ox.tk//t˙L.Ox.tk//
p
t.
Rößler (2009) considers a general class of multidimensional weak order


## Page 160

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
152 Numerical Simulation of SDEs
2.0 stochastic Runge–Kutta schemes. For simplicity, in the following we
will restrict our interest to models driven by standard Brownian motion
only. For models with nonidentity diffusion matrices Q, a straightforward
approach is to include this scaling into the dispersion matrix. The general
multidimensional schemes by Rößler are as follows.
Algorithm 8.17 (Stochastic Runge–Kutta methods of weak order 2.0) .
Start fromOx.t0/p.x.t0// and divide the integration interval Œt0;t into
M steps t0 < t1 < t2 < ::: < tM D t such that t D tkC1tk.
The integration method is characterized by the following extended Butcher
tableau:
c.0/ A.0/ B.0/
c.1/ A.1/ B.1/
c.2/ A.2/ B.2/
˛T 

.1/T 

.2/T


.3/T 

.4/T
: (8.99)
On each stepk, approximate the solution by the following:
Ox.tkC1/DOx.tk/C
X
i
˛i f.Qx.0/
i ;tkCc.0/
i t/t
C
X
i;n

.1/
i Ln.Qx.n/
i ;tkCc.1/
i t/ Oˇ.n/
k
C
X
i;n

.2/
i Ln.Qx.n/
i ;tkCc.1/
i t/ O.n;n/
kp
t
C
X
i;n

.3/
i Ln.Nx.n/
i ;tkCc.2/
i t/ Oˇ.n/
k
C
X
i;n

.4/
i Ln.Nx.n/
i ;tkCc.2/
i t/
p
t; (8.100)
with supporting values
Qx.0/
i DOx.tk/C
X
j
A.0/
i;j f.Qx.0/
j ;tkCc.0/
j t/t
C
X
j;l
B.0/
i;j Ll.Qx.l/
j ;tkCc.1/
j t/ Oˇ.l/
k ; (8.101)


## Page 161

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.6 Weak Stochastic Runge–Kutta Methods 153
Qx.n/
i DOx.tk/C
X
j
A.1/
i;j f.Qx.0/
j ;tkCc.0/
j t/t
C
X
j;l
B.1/
i;j Ll.Qx.l/
j ;tkCc.1/
j t/O.l;n/
k ; (8.102)
Nx.n/
i DOx.tk/C
X
j
A.2/
i;j f.Qx.0/
j ;tkCc.0/
j t/t
C
X
j;l
l¤n
B.2/
i;j Ll.Qx.l/
j ;tkCc.1/
j t/ O.l;n/
kp
t
; (8.103)
foriD1;2;:::;S andnD1;2;:::;S .
The increments in Algorithm 8.17 are given by the double Itô integrals
(exactly as in the case of the strong stochastic Runge–Kutta schemes), but
in the weak schemes we can use the following approximations (see, e.g.,
Kloeden and Platen, 1999; Rößler, 2009):
O.i;j/
k D
8
ˆˆˆˆˆˆ<
ˆˆˆˆˆˆ:
1
2

Oˇ.i/
k Oˇ.j/
k
p
tO.i/
k

; ifi <j;
1
2

Oˇ.i/
k Oˇ.j/
k C
p
tO.j/
k

; ifi >j;
1
2

ŒOˇ.i/
k 2t

; ifiDj;
(8.104)
fori;j D 1;2;:::;S . Here only 2S1 independent random variables
are needed, and we do not anymore run into problems with the cross-term
integrals as we did in the strong stochastic Runge–Kutta schemes. For ex-
ample, we can choose Oˇ.i/
k such that they are independent three-point
distributed random variables
P

Oˇ.i/
k D˙
p
3t

D 1
6 and P

Oˇ.i/
k D0

D 2
3; (8.105)
and the supporting variablesO.i/
k such that they are independent two-point
distributed random variables
P
O.i/
k D˙
p
t

D 1
2: (8.106)
Rößler (2009) proposes, for example, the following multidimensional
weak order 2.0 stochastic Runge–Kutta scheme, which only requires two
evaluations of f.;/ and only ﬁve evaluations of eachLi.;/.
Algorithm 8.18 (Weak order 2.0 stochastic Runge–Kutta due to Rößler) .


## Page 162

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
154 Numerical Simulation of SDEs
Consider a stochastic Runge–Kutta method with the following extended
Butcher tableau:
0
1 1 1
0 0 0 0 0
0
1 1 1
1 1 0 1 0
0
1 1 1
1 1 0 1 0
1
2
1
2 0 1
2
1
4
1
4 0 1
2 1
2
1
2
1
4
1
4 0 1
2 1
2
; (8.107)
which corresponds to the following iterative scheme:
Ox.tkC1/DOx.tk/Ct
2

f.Ox.tk/;tk/C f.Qx.0/
2 ;tkCt/

C
X
n
1
2 Ln.Ox.tk/;tk/C1
4 Ln.Qx.n/
2 ;tkCt/C1
4 Ln.Qx.n/
3 ;tkCt/

Oˇ.n/
k
C
X
n
1
2 Ln.Qx.n/
2 ;tkCt/1
2 Ln.Qx.n/
3 ;tkCt/
O.n;n/
kp
t
C
X
n
1
4 Ln.Nx.n/
2 ;tkCt/C1
4 Ln.Nx.n/
3 ;tkCt/1
2 Ln.Ox.tk/;tk/

Oˇ.n/
k
C
X
n
1
2 Ln.Nx.n/
2 ;tkCt/1
2 Ln.Nx.n/
3 ;tkCt/
p
t (8.108)
with supporting values (note thatQx.0/
1 DQx.n/
1 DNx.n/
1 DOx.tk/)
Qx.0/
2 DOx.tk/C f.Ox.tk/;tk/tC
X
l
Ll.Ox.tk/;tk/Oˇ.l/
k ; (8.109)
Qx.n/
2 DOx.tk/C f.Ox.tk/;tk/tC
X
l
Ll.Ox.tk/;tk/O.l;n/
k ; (8.110)
Qx.n/
3 DOx.tk/C f.Ox.tk/;tk/t
X
l
Ll.Ox.tk/;tk/O.l;n/
k ; (8.111)
Nx.n/
2 DOx.tk/C f.Ox.tk/;tk/tC
X
l
l¤n
Ll.Ox.tk/;tk/O.l;n/
kp
t
; (8.112)


## Page 163

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.7 Stochastic Verlet Algorithm 155
/NUL2 /NUL1 0 1 2
x1
Figure 8.5 A histogram of the state of the Dufﬁng van der Pol
oscillator valuesx1.t/ attD20 with 10,000 samples simulated
by the weak order 2.0 stochastic Runge–Kutta scheme (see
Example 8.19).
Nx.n/
3 DOx.tk/C f.Ox.tk/;tk/t
X
l
l¤n
Ll.Ox.tk/;tk/O.l;n/
kp
t
: (8.113)
Example 8.19 (Weak approximation of the Dufﬁng van der Pol problem).
In Example 8.15, we considered a van der Pol oscillator with two steady
states for the zero-diffusion model. Now we are interested in characterizing
the solution at tD20 for the initial condition of x.0/D.3;0/ . We use
the stochastic Runge–Kutta method in Algorithm 8.18 that is of weak order
2.0. We consider a time span Œ0;20 and a discretization interval t D
24. With a t this large, the Euler–Maruyama method does not provide
plausible results. Figure 8.5 shows the histogram of the valuesx1.20/.
8.7 Stochastic Verlet Algorithm
The stochastic Verlet algorithm (see Burrage et al., 2007) is a scheme
for simulating numerical solutions to second-order stochastic differential
equations. It is best known for its use in integrating Newton’s equations
of motion, primarily in molecular dynamics, computer graphics, and other
engineering applications.
Consider a second-order SDE of the following form:
RxDf.x/b2.x/PxCb.x/w.t/; (8.114)


## Page 164

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
156 Numerical Simulation of SDEs
where is a damping parameter,w.t/ a white noise process with spectral
densityq, andb.x/ is a given function. If b.x/ is not constant, the model
has multiplicative noise. We can rewrite this equation as a pair of ﬁrst-order
equations:
dx.t/D dv.t/ dt;
dv.t/Db2.x.t//v.t/ dtCf.x.t// dtCb.x.t// dˇ.t/: (8.115)
The Verlet methods are based on the idea of considering the central
difference between discretized time steps tk1 and tkC1 obtained by the
summation of the corresponding two Itô–Taylor expansions. We consider a
variant of the Verlet algorithm family known as theleapfrog method, which
includes a supporting half-step. Under leapfrog methods, the velocity and
position are updated successively rather than together. In its simplest form,
the leapfrog algorithm is the following.
Algorithm 8.20 (Leapfrog Verlet). Start fromOx.t0/ andOv.t0/ drawn from
the initial distribution, and divide the time interval Œt0;t intoM steps of
lengtht. At each stepk, do the following:
1. Draw random variable ˇk from the distribution
ˇk N.0;qt/: (8.116)
2. Compute the half-step supporting value:
QxDOx.tk/C1
2v.tk/t: (8.117)
3. Update the velocity and position
Ov.tkC1/DOv.tk/b2.Qx/Ov.tk/tCf.Qx/t Cb.Qx/ˇk; (8.118)
Ox.tkC1/DQxC1
2Ov.tkC1/t: (8.119)
The method becomes the canonical ordinary leapfrog scheme (see, e.g.,
Allen and Tildesley, 1991) for models withb.x/D0.
The strength of the leapfrog Verlet algorithm is that it maintains the
independence of position and velocity. Furthermore, it is time-reversible
meaning that its behavior remains the same both in integrating forward and
backward. The algorithm does not, however, require any more function
evaluations than the Euler–Maruyama method, which makes it appealing
for this type of second-order SDEs.


## Page 165

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.8 Exact Algorithm 157
0.01 0.1 1
10/NUL2 10/NUL1 100 101
Time step length, /c129t
Mean absolute error in /ESC2
x
Leapfrog Verlet
Euler–Maruyama
Figure 8.6 Comparison of the mean absolute error given by the
leapfrog Verlet and Euler–Maruyama methods in estimating
Px.t/ for the spring model (see Example 8.21).
Example 8.21 (Leapfrog solution to the spring model). Recall the stochas-
tic spring model from Example 3.10. The model is an LTI SDE and we can
solve it in closed form as was shown earlier. The model can be rewritten
in terms of the second-order formulation in Equation (8.114) by choosing
b.x/D1,D
, andf.x/D2x.
Figure 8.6 shows the mean absolute error of the estimated variance of
Px.t/ as a function the time step lengtht. All other parameters were ﬁxed
to values of
D 1,D 1, and qD 1. The leapfrog Verlet algorithm is
compared against the Euler–Maruyama method, which is of similar com-
putational complexity, but performs worse for this type of second-order
SDEs.
8.8 Exact Algorithm
The exact algorithm (Beskos and Roberts, 2005; Beskos et al., 2006a,b,
2008; Iacus, 2008) is an algorithm that can be used for simulating exact
samples (without a discretization error) from SDEs of the form
dxD f.x/ dtC dˇ; (8.120)
where f can be expressed as a gradient of a scalar function such that
f.x/Dr  .x/ andˇ is a vector of standard Brownian motions. By using


## Page 166

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
158 Numerical Simulation of SDEs
the Lamperti transform from Section 7.1 (while recalling its limitations)
the method can be generalized to other types of SDEs.
First recall that rejection sampling is a method that can be used for sam-
pling from some probability distributionq1 by using samples from another
probability distributionq2. The method requires that q1.x/ "q2.x/ for
some">0 . Rejection sampling works as follows:
1. Sample xq2.x/.
2. Sample uniform random variable u U.0;1/ .
3. If u<" q1.x/
q2.x/, accept x, otherwise go back to step 1.
However, it turns out that we can also construct a rejection sampling
method alternatively as follows, which is more useful for the exact algo-
rithm:
1. Sample .x;I/ such that xq2.x/ andp.ID1j x/D" q1.x/
q2.x/.
2. If ID1, accept x, otherwise go back to step 1.
In the case of SDEs, we need to replace the ratio of likelihoods
q1.x/=q2.x/ with the Radon–Nikodym derivative. Let us now consider
sampling from an SDE by using a Brownian motion as the sampled dis-
tribution. Let Px and Pˇ be the measures of the process x and of the
Brownian motion. Then according to the Girsanov theorem, we have the
likelihood ratio
dPx
dPˇ
D exp
(Z T
0
f T.ˇ/ dˇ1
2
Z T
0
kf.ˇ/k2 dt
)
: (8.121)
Assume that there exists a scalar function such that
f.x/Dr .x/: (8.122)
Applying the Itô formula to .ˇ/ gives
d D
X
i
@ .ˇ/
@ˇi
dˇiC1
2
X
i;j
@2 .ˇ/
@ˇi@ˇj
ıi;j dt
D f T.ˇ/ dˇC1
2.r f.ˇ// dt; (8.123)


## Page 167

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.8 Exact Algorithm 159
that is,
Z T
0
f T.ˇ/ dˇ1
2
Z T
0
kf.ˇ/k2 dt
D
Z T
0
Œf T.ˇ/ dˇC1
2r f.ˇ/ dt1
2
Z T
0
Œkf.ˇ/k2Cr f.ˇ/ dt
D
Z T
0
d .t/1
2
Z T
0
Œkf.ˇ/k2Cr f.ˇ/ dt
D .ˇ.T// .ˇ.0//1
2
Z T
0
Œkf.ˇ/k2Cr f.ˇ/ dt: (8.124)
Thus
dPx
dPˇ
D exp

 .ˇ.T// .ˇ.0//1
2
Z T
0

kf.ˇ/k2C.r f.ˇ//

dt
!
:
(8.125)
Let us now deﬁne a biased Brownian motionQˇ such the ﬁnal point has the
distribution with a density
h.Qˇ.T/// exp

 .Qˇ.T// 1
2TkQˇ.T/k2

: (8.126)
It then turns out that
dPx
dPQˇ
/ exp

1
2
Z T
0

kf.ˇ/k2C.r f.ˇ//

dt
!
: (8.127)
Provided thatkf.ˇ/k2Cr f.ˇ/ is bounded from below, we can now ﬁnd
a nonnegative function such that
dPx
dPQˇ
/ exp


Z T
0
.ˇ/ dt
!
1: (8.128)
That function has the form
.ˇ/D 1
2Œkf.ˇ/k2C.r f.ˇ//c; (8.129)
wherec is a suitable constant. Let us also assume that .ˇ/ M . Then
we get the following theorem.
Theorem 8.22. Letˆ be a homogeneous Poisson process with unit inten-
sity on Œ0;T Œ0;M and let N be the number of points of the process


## Page 168

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
160 Numerical Simulation of SDEs
found below the graph.t;.t// . Then we have
p.ND0/D exp


Z T
0
.t/ dt
!
: (8.130)
We can now take the eventND0 to be the eventID1 in our rejection
sampling. The key observation is now that we do not need to sample the
whole path ofˇ to be able to determine ifND0 – we only need to know
the values of .ˇ.t// at the time points of the sampled Poisson process,
and for that, being able sample those points (i.e., a skeleton of the process)
is enough.
The basic algorithm now takes the following form (called EA1 in Beskos
et al., 2006b).
Algorithm 8.23 (Exact algorithm). The exact algorithm (EA) consists of
the following steps:
1. Simulate  from the Poisson distribution with intensityDT M.
2. Simulate  samples.ti;xi/ uniformly onŒ0;T Œ0;M .
3. Simulate the skeleton of biased Brownian motion Qˇ at the time points
ftig, such thatQˇ.T/h andQˇ.0/D0.
4. Evaluate N , by checking how many timesxi <. Qˇ.ti//.
5. If ND0, go to step 6 and otherwise go to step 1.
6. Simulate Brownian bridges between all the pairs of points .tiC1;ti/.
Various extensions to unbounded  are presented in articles of Beskos
and Roberts (2005) and Beskos et al. (2006a,b, 2008).
Example 8.24 (Exact simulation of sine diffusion). Consider the sine dif-
fusion model
dxD sin.x/ dtC dˇ; x.0/ D0; (8.131)
whereˇ.t/ is a standard Brownian motion. We can choose  .x/ D 1
cos.x/, which gives
.ˇ/D 1
2

sin2.ˇ/C cos.ˇ/C1

: (8.132)
We simulate from this SDE using the Exact algorithm by choosingTD1:5,
and plot the histogram of the solutions at time T . The histogram of the
sample distribution is shown in Figure 8.7.


## Page 169

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
8.9 Exercises 161
/NUL4 /NUL2 0 2 4
x
Figure 8.7 Histogram ofND 100,000 sample paths of the sine
diffusion model atTD1:5 simulated by the Exact algorithm (see
Example 8.24).
8.9 Exercises
8.1 Consider the following scalar SDE:
dxDcx dtCgx dˇ; x.0/ Dx0; (8.133)
wherec,g, and x0 are positive constants and ˇ.t/ is a standard Brownian
motion.
(a) Check using the Itô formula that the solution to this equation is
x.t/Dx0 exp

.cg2=2/tCgˇ.t/

:
(b) Simulate trajectories from the equation using the Milstein method with
parametersx0D1,cD 1=10 ,gD 1=10 , and check that the histogram
att D 1 looks the same as obtained by sampling from the preceding
exact solution.
8.2 Consider the following Beneš SDE:
dxD tanh.x/ dtC dˇ; x.0/ D0; (8.134)
whereˇ.t/ is a standard Brownian motion. Recall that it has the probability
density
p.x;t/ D 1p
2t
cosh.x/ exp

1
2t

exp

1
2t x2

:
Use the following numerical methods for simulating from the model:


## Page 170

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
162 Numerical Simulation of SDEs
(a) Simulate 1,000 trajectories from the SDE with the strong order 1.5 Itô–
Taylor series–based method presented earlier. Compare the histogram to
the exact solution attD5.
(b) Simulate 1,000 trajectories from the SDE with the weak order 2.0 Itô–
Taylor series–based method presented earlier using both (i) Gaussian
increments and (ii) the three-point distributed random variables. Com-
pare the histograms to the exact distribution attD5.
(c) What can you say about the simulated trajectories when t2 Œ0;5 for
the different methods?
8.3 Consider a simple strong order 1.0 stochastic Runge–Kutta method with the
following extended Butcher tableau:
0
0 0 0
0 0 0 0 0
0
0 0 1
0 0 0 1 0
1 0 0 1 0 0 0 1
2 1
2
(8.135)
(a) Write down the iteration equations required for evaluating the method
corresponding to the table in Equation (8.135).
(b) Consider the Dufﬁng van der Pol oscillator model:
dx1
dx2

D
 x2
x1.˛x2
1/x2

dtC
0
x1

dˇ;
whereˇ.t/ is a one-dimensional Brownian motion (qD0:52) and˛D
1. Use the method you just constructed for drawing trajectories starting
fromx2.0/D0 andx1.0/D4;3:9;:::; 2. Use a time spanŒ0;10 .
Plot the results in the.x1;x2/ plane.
(c) Experiment with different step sizes tD 2k;k D 0;2;4;6 and vi-
sually compare the trajectories produced by the method implemented in
(b) to the Euler–Maruyama scheme.
8.4 Consider the following two-dimensional SDE:
dx1
dx2

D
3
2x1
3
2x2

dtC
 1
10x1 0
0 1
10x2

dˇ;
whereˇ.t/ D .ˇ1.t/;ˇ2.t// such that each ˇi.t/ is a standard Brownian
motion. The initial value is x.0/D.1=10;1 =10/ .
(a) Implement the Euler–Maruyama scheme for this problem.


## Page 171

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 163
(b) Implement the following weak order 2.0 Runge–Kutta method for this
problem (following Algorithm 8.17):
0
2
3
2
3 1
2
3 1
3 1 0 0
0
1 1 1
1 1 0 1 0
0
0 0 1
0 0 0 1 0
1
4
1
2
1
4
1
2
1
4
1
4 0 1
2 1
2
1
2
1
4
1
4 0 1
2 1
2
:
(c) Simulate 1,000 trajectories from the SDE with Euler–Maruyama and the
weak order 2.0 Runge–Kutta method. Use step sizes t D 2k;k D
0;1;:::;6 . Compare your results to the expected value given by
EŒxi.t/D 1
10 exp
3
2t

foriD1;2 , and plot the absolute errors as a function of step size.
8.5 Consider the following SDE ( DD2;S D4) describing stochastic ﬂow on
a torus:
dxD L.x/ dˇ;
whereˇ.t/D.ˇ1.t/;ˇ2.t/;ˇ3.t/;ˇ4.t// such that eachˇi.t/ is a standard
Brownian motion. The diffusion is given such that the columns in L.x/ are
(use˛D1):
L1.x/D
cos˛
sin˛

sin.x1/; L2.x/D
cos˛
sin˛

cos.x1/;
L3.x/D
 sin˛
cos˛

sin.x2/; L4.x/D
 sin˛
cos˛

cos.x2/:
(a) Consider a set of initial points x.0/ on a uniform 15 15 grid on
Œ0;2Œ0;2 . Use the Euler–Maruyama method with the same real-
ization of Brownian motion (reset the random seed) for each trajectory
and a step size of t D 24. Plot what the distribution looks like at
tD0:5;1:0;2:0;4:0 (considerxi modulo2 for staying on the torus).
(b) Implement the weak order 2.0 Runge–Kutta scheme presented in Algo-
rithm 8.18, and repeat the preceding experiment.


## Page 172

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
164 Numerical Simulation of SDEs
8.6 Consider the double-well potential model
dxD.xx3/ dtC1
2
p
1Cx2 dˇ;
whereˇ.t/ is a standard Brownian motion. Simulate trajectories from the
stochatic differential equation to characterize the solution at x.10/ starting
fromx.0/D1:
(a) Use the Euler–Maruyama scheme.
(b) Use the weak order 2.0 stochastic Runge–Kutta scheme in Algo-
rithm 8.18.
(c) Study the effect of step size t.
8.7 Consider the second-order SDE model that ﬁts under the family of models
suitable for the Verlet integration scheme with f.x/ Dxx3,b.x/Dx,
D1, andqD1.
(a) Write the Itô SDE corresponding to the given model.
(b) Simulate 10,000 trajectories on the interval Œ0;10 from the model using
(i) the Leapfrog Verlet algorithm and (ii) the Euler–Maruyama method.
Use a step size oftD 1=10 and the initial value xD.1;0/ . Compare
the results.
(c) Study the behavior of the two methods as t increases.
8.8 Consider the use of the Exact algorithm for sampling from the Beneš SDE
dxD tanh.x/ dtC dˇ. What happens to the likelihood ratio in this case?
Implement the resulting algorithm and compare the result to the exact den-
sity.


## Page 173

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9
Approximation of Nonlinear SDEs
This chapter is concerned with approximations of nonlinear SDEs aim-
ing for computing statistics of SDEs and for forming approximations to
the transition densities. However, many of them can also be used for nu-
merical simulation of SDEs. These approximations will also turn out to
be useful in ﬁltering and smoothing theory as well as in SDE parameter
estimation, which we consider in the subsequent chapters. In this chapter,
we start with Gaussian approximations, which are especially common in
ﬁltering and smoothing applications (such as target tracking). These ap-
proximations include various linearization, Taylor series, and sigma-point
approximations. We then proceed to temporal Taylor series approximations
of the moments, Hermite expansions of the transition densities, discretiza-
tion approximations to the Fokker–Planck–Kolmogorov equation, and ﬁ-
nally pathwise series expansions of Brownian motions, which are related
to the Wong–Zakai theorem and Wiener chaos expansions.
9.1 Gaussian Assumed Density Approximations
In Section 5.5, we saw that the differential equations for the mean and
covariance of the solution to the SDE
dxD f.x;t/ dtC L.x;t/ dˇ (9.1)
are
dm
dt D EŒf.x;t/; (9.2)
dP
dt D E

f.x;t/. x m/T
C E

.x m/ f T.x;t/

C E

L.x;t/ Q LT.x;t/

: (9.3)
165


## Page 174

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
166 Approximation of Nonlinear SDEs
If we write down the expectation integrals explicitly, these equations can
be seen to have the form
dm
dt D
Z
f.x;t/p. x;t/ dx; (9.4)
dP
dt D
Z
f.x;t/. x m/Tp.x;t/ dx
C
Z
.x m/ f T.x;t/p. x;t/ dx
C
Z
L.x;t/ Q LT.x;t/p. x;t/ dx: (9.5)
Becausep.x;t/ is the solution of the Fokker–Planck–Kolmogorov equa-
tion (5.11), these equations cannot usually be solved in practice. However,
one very useful class of approximations can be obtained by replacing the
FPK solution with a Gaussian approximation as follows:
p.x;t/  N.xj m.t/; P.t//; (9.6)
where m.t/ and P.t/ are the mean and covariance of the state, respec-
tively. This approximation is referred to as the Gaussian assumed density
approximation (Kushner, 1967; Särkkä and Sarmavuori, 2013), because
we do the computations under the assumption that the state distribution is
indeed Gaussian. It is also related to a Gaussian process approximation
(Archambeau and Opper, 2011; Ala-Luhtala et al., 2015) of the SDE. The
approximation method (as it is presented in Särkkä and Sarmavuori, 2013)
can be written as the following algorithm.
Algorithm 9.1 (Gaussian assumed density approximation I) . A Gaussian
process approximation to the SDE (9.1) can be obtained by integrating
the following differential equations from the initial conditions m.t0/ D
EŒx.t0/ and P.t0/D CovŒx.t0/ to the target timet:
dm
dt D
Z
f.x;t/ N.xj m; P/ dx;
dP
dt D
Z
f.x;t/. x m/T N.xj m; P/ dx
C
Z
.x m/ f T.x;t/ N.xj m; P/ dx
C
Z
L.x;t/ Q LT.x;t/ N.xj m; P/ dx:
(9.7)


## Page 175

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.1 Gaussian Assumed Density Approximations 167
If we denote the Gaussian expectation as
ENŒg.x/D
Z
g.x/ N.xj m; P/ dx; (9.8)
then the equations can also be written as
dm
dt D ENŒf.x;t/;
dP
dt D ENŒ.x m/ f T.x;t/C ENŒf.x;t/. x m/T
C ENŒL.x;t/ Q LT.x;t/:
(9.9)
If the function x7! f.x;t/ is differentiable, the covariance differential
equation can be simpliﬁed by using the following well-known property of
Gaussian random variables (also known as Stein’s lemma).
Theorem 9.2. Let f.x;t/ be differentiable with respect to x and let
x N.m; P/. Then the following identity holds (see, e.g., Papoulis, 1984;
Särkkä and Sarmavuori, 2013):
Z
f.x;t/. x m/T N.xj m; P/ dx
D
Z
Fx.x;t/ N.xj m; P/ dx

P; (9.10)
where Fx.x;t/ is the Jacobian matrix of f.x;t/ with respect to x.
Using the theorem, the mean and covariance Equations (9.9) can be
equivalently written as follows.
Algorithm 9.3 (Gaussian assumed density approximation II). A Gaussian
process approximation to the SDE (9.1) can be obtained by integrating
the following differential equations from the initial conditions m.t0/ D
EŒx.t0/ and P.t0/D CovŒx.t0/ to the target timet:
dm
dt D ENŒf.x;t/;
dP
dt D P ENŒFx.x;t/ TC ENŒFx.x;t/ PC ENŒL.x;t/ Q LT.x;t/;
(9.11)
where ENŒ denotes the expectation with respect to x N.m; P/.
The approximations presented in this section are formally equivalent
to so-called statistical linearization approximations (Gelb, 1974; Socha,


## Page 176

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
168 Approximation of Nonlinear SDEs
2008), and they are also closely related to the variational approximations
of Archambeau and Opper (2011).
Although the preceding algorithms provide a generic Gaussian assumed
density approximation framework for SDEs, to implement the methods,
one is required to compute the following kind of n-dimensional Gaussian
integrals:
ENŒg.x;t/ D
Z
g.x;t/ N.xj m; P/ dx: (9.12)
A classical approach that is very common in ﬁltering theory (Jazwinski,
1970; Maybeck, 1982a) is to linearize (via Taylor series) the drift f.x;t/
around the mean m as
f.x;t/  f.m;t/C Fx.m;t/. x m/ (9.13)
and to approximate the expectation of the diffusion part as
L.x;t/  L.m;t/: (9.14)
This leads to the following approximation, which is commonly used in
extended Kalman ﬁlters (EKF).
Algorithm 9.4 (Linearization approximation of SDE) . A linearization-
based approximation to the SDE (9.1) can be obtained by integrating
the following differential equations from the initial conditions m.t0/ D
EŒx.t0/ and P.t0/D CovŒx.t0/ to the target timet:
dm
dt D f.m;t/;
dP
dt D P F T
x.m;t/C Fx.m;t/ PC L.m;t/ Q LT.m;t/:
(9.15)
Another general class of approximations is the Gauss–Hermite cubature
type of approximations, where the integrals are approximated as weighted
sums Z
f.x;t/ N.xj m; P/ dx
X
i
W.i/ f.x.i/;t/; (9.16)
where x.i/ andW.i/ are the sigma points (abscissas) and their accompany-
ing weights, which have been selected using a method-speciﬁc determinis-
tic rule. These kinds of rules are nowadays commonly used in the context
of ﬁltering theory (cf. Särkkä and Sarmavuori, 2013; Särkkä, 2013). In
n-dimensional Gauss–Hermite integration, the unscented transform, and


## Page 177

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.1 Gaussian Assumed Density Approximations 169
cubature integration, the sigma points are selected as follows:
x.i/D mC
p
Pi; (9.17)
where the matrix square root is deﬁned by P D
p
P
p
P
T
(typically
Cholesky factorization), and the pointsi and the weightsW.i/ are selected
as follows:
Gauss–Hermite integration: This product rule–based method uses a set
ofmn vectorsi, which have been formed as a Cartesian product of ze-
ros of the Hermite polynomials of orderm. The weightsW.i/ are formed
as products of the corresponding one-dimensional Gauss–Hermite inte-
gration weights (for details, see Ito and Xiong, 2000; Wu et al., 2006).
Unscented transform: This method uses a zero vector (origin) and 2n
unit coordinate vectorsei as follows (the method can also be generalized
a bit):
0D 0;
iD
 p
Cn ei; i D1;2;:::;n;

p
Cn ein; i DnC1;nC2;:::;2n;
(9.18)
and the weights are deﬁned as follows:
W.0/D 
nC;
W.i/D 1
2.nC/; i D1;2;:::;2n;
(9.19)
where and are parameters of the method andn is the dimensionality
of x (see, e.g., Julier et al., 1995; Wan and van der Merwe, 2001; Julier
and Uhlmann, 2004; Särkkä, 2013). This rule is a special case of more
general symmetric integrations rules that can be constructed up to an
arbitrary order (McNamee and Stenger, 1967).
Cubature method: This spherical third-degree method uses only2n vec-
tors as follows:
iD
 pn ei; i D1;2;:::;n;
pn ein; i DnC1;nC2;:::;2n; (9.20)
and the weights are deﬁned as W.i/ D 1=.2n/, for i D 1;2;:::;2n .
This rule is in fact a special case of the preceding rule, but has turned out
to be useful in ﬁltering theory (Arasaratnam and Haykin, 2009; Arasarat-
nam et al., 2010; Särkkä and Solin, 2012; Särkkä, 2013).


## Page 178

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
170 Approximation of Nonlinear SDEs
The sigma-point methods lead to the following approximations to the mean
and covariance differential equations.
Algorithm 9.5 (Sigma-point approximation of SDEs) . A sigma point–
based approximation to the SDE (9.1) can be obtained by integrating
the following differential equations from the initial conditions m.t0/ D
EŒx.t0/ and P.t0/D CovŒx.t0/ to the target timet:
dm
dt D
X
i
W.i/ f.mC
p
Pi;t/;
dP
dt D
X
i
W.i/ f.mC
p
Pi;t/ T
i
p
P
T
C
X
i
W.i/p
Pi f T.mC
p
Pi;t/
C
X
i
W.i/ L.mC
p
Pi;t/ Q LT.mC
p
Pi;t/:
(9.21)
Once the Gaussian integral approximation has been selected, the solu-
tions to the resulting ordinary differential equations can be computed, for
example, by the fourth-order Runge–Kutta method or some similar nu-
merical ODE solution method. It would also be possible to approximate
the integrals using various other methods from ﬁltering theory (see, e.g.,
Jazwinski, 1970; Wu et al., 2006; Särkkä and Sarmavuori, 2013).
Example 9.6 (Linearization and Gauss–Hermite approximations) . The
linearization-based and sigma-point approximations of the Beneš SDE
dxD tanh.x/ dtC dˇ; x.0/ Dx0; (9.22)
whereˇ.t/ is a standard Brownian motion, which we already considered
in Example 7.10, look like the following:
 The linearization approximation is
dm
dt D tanh.m/;
dP
dt D2.1 tanh2.m//P C1:
(9.23)


## Page 179

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.1 Gaussian Assumed Density Approximations 171
/NUL15 /NUL10 /NUL5 0 5 10 15
x
Exact density
Exact Gaussian
Gauss–Hermite
Linearization
Figure 9.1 Comparison of the Gaussian approximations in
Example 9.6 to the exact density and to the exact Gaussian ﬁt.
 A generic sigma-point approximation is given as
dm
dt D
X
i
W.i/ tanh.mC
p
P i/;
dP
dt D1C2
X
i
W.i/p
P i tanh.mC
p
P i/:
(9.24)
The comparison of these approximations to the exact solutions is shown
in Figure 9.1. The approximations are compared to the exact density and
to the exact Gaussian ﬁt formed by moment-matching to the exact density.
The starting point wasx.0/D1=2 and the solution was computed at time
t D 5. The sigma-point method was a 10-point Gauss–Hermite quadra-
ture approximation. As can be seen in the ﬁgure, the sigma-point method
produces a more accurate match to the moment-matched Gaussian than
the linearization approximation. However, it is apparent that a Gaussian
approximation poorly approximates the true multi-modal distribution.
Example 9.7 (Gaussian approximation of a nonlinear trigonometric SDE).
Consider the nonlinear Itô stochastic differential equation model that was
already covered in Example 8.6:
dxD
 1
10
2
sin.x/ cos3.x/ dtC 1
10 cos2.x/ dˇ; x.0/ Dx0;
(9.25)
where ˇ.t/ is a standard Brownian motion. The SDE has the solution


## Page 180

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
172 Approximation of Nonlinear SDEs
0:4 0:6 0:8 1 1:2 1:4
x
Exact
Exact Gaussian
Approximate Gaussian
Figure 9.2 An example of a sigma point–based Gaussian
approximation to a nonlinear SDE in Example 9.7. The exact
solution attD10 is shown by the patch, and the solid line
illustrates the Gaussian ﬁt to it. The approximation is shown by
the dashed line.
x.t/D arctan.1=10ˇ.t/ C tan.x0//. In this example, letx0D1. The goal
is to characterize the solution at tD10 using a Gaussian approximation
p.x.t// N.x.t/jm.t/;P.t// of the exact solution.
In the model, we have the drift f.x/ D .1=10/2 sin.x/ cos3.x/ and
dispersion coefﬁcientL.x/D 1=10 cos2.x/. Applying the cubature inte-
gration sigma-point scheme (D˙ 1;W .i/ D 1=2;i D 1;2 ) gives the
following mean and covariance differential equations:
dm
dt D 1
2f.m
p
P/C1
2f.mC
p
P/; (9.26)
dP
dt D
p
Pf.m
p
P/
p
Pf.m C
p
P/
C1
2
h
L.m
p
P/
i2
C1
2
h
L.mC
p
P/
i2
; (9.27)
wherem.0/Dx0,P.0/D0. We use the fourth-order Runge–Kutta scheme
for solving m.10/ and P.10/ with a step size of t D 26. Figure 9.2
illustrates the exact solution of x.10/ and shows the moment-matched
Gaussian ﬁt to it by a solid line. The ODE-based approximative solution
N.x.10/jm.10/;P.10// is shown by a dashed line, and it coincides well
with the Gaussian ﬁt.
It is worth noting that all the Gaussian assumed density approximations,


## Page 181

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.1 Gaussian Assumed Density Approximations 173
including the linearization and sigma-point methods discussed in this sec-
tion (Algorithms 9.1–9.5), also provide Gaussian approximations for the
transition densities.
Algorithm 9.8 (Gaussian assumed density transition density approxima-
tion). The Gaussian assumed density approximation for transition density
p.x.t/j x.s// wheret >s can be constructed by starting from the initial
conditions m.s/D x.s/, P.s/D 0 in any of the Algorithms 9.1–9.5 and
solving the equations at time t. If we denote the resulting mean and co-
variance as m.tjs/ and P.tjs/, respectively, then the transition density
approximation is given as
p.x.t/j x.s// N.x.t/j m.tjs/; P.tjs//: (9.28)
Because all the Gaussian assumed density approximations produce a lo-
cal approximation to the transition density, they can also be used as SDE
simulation methods. The basic idea is to ﬁx a small t and sequentially
simulate transitions over t intervals by using the transition density ap-
proximation. This can be written as the following algorithm.
Algorithm 9.9 (SDE simulation by Gaussian assumed density approxima-
tion). Gaussian assumed density approximation–based numerical simula-
tion of an SDE solution over an intervalŒt0;t can be performed as follows:
 Divide the interval to M subintervals of length t. These interval
lengths can also vary if required.
 Starting fromOx.t0/ p.x.t0//, sequentially at each of the M subin-
tervals k perform a draw from the approximate transition density as
follows:
Ox.tkC1/ N.m.tkC1jtk/; P.tkC1jtk//; (9.29)
where the transition density approximation of the right is computed with
Algorithm 9.8 withOx.tk/ as the starting point.
Algorithm 9.9 has the property that unlike, for example, the Euler–
Maruyama method, it is exact for linear systems. The convergence prop-
erties are still to be investigated, but they could be expected to be similar to
the methods of Ozaki (1992, 1993) and Shoji and Ozaki (1998). Numerical
comparison of the Gaussian assumed density approximation–based simu-
lation method to local linearization is provided in Example 9.14.
The Gaussian assumed density approximations can be generalized to the
exponential family of distributions by considering the projections of SDEs
on manifolds of exponential densities (Brigo et al., 1999). The linearization


## Page 182

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
174 Approximation of Nonlinear SDEs
approximations can also be formed along a nominal trajectory instead of
the approximated mean trajectory (Maybeck, 1982a). Yet another possibil-
ity is to use a sigma-point version of the nominal trajectory methodology
(García-Fernández et al., 2015, 2017).
9.2 Linearized Discretizations
One way to approximate the solutions of SDEs using Gaussian distribu-
tions is to ﬁrst use methods such as Itô–Taylor series expansions or stochas-
tic Runge–Kutta methods for forming a discrete-time approximation to the
SDE, and then approximate it using Gaussian assumed density approxima-
tions. That is, if we originally have an SDE
dxD f.x;t/ dtC L.x;t/ dˇ; (9.30)
we then form an approximation as
x.tkC1/D ft
k .x.tk/; ek/; (9.31)
where ft
k is deﬁned by the discretization method andek is a noise process
related to the discretization. We can then step over t1;t2;::: such that we
always compute the mean and covariance of the next SDE state x.tkC1/
assuming that the previous state x.tk/ was Gaussian with the mean and
covariance that we calculated for it.
As we assume Gaussianity, the integrals to be recursively computed for
kD1;2;::: are the following:
mkC1D
“
ft
k .x.tk/; ek/ N.x.tk/j mk; Pk/p. ek/ dx.tk/ dek; (9.32)
PkC1D
“ 
ft
k .x.tk/; ek/ mkC1

ft
k .x.tk/; ek/ mkC1
T
 N.x.tk/j mk; Pk/p. ek/ dx.tk/ dek: (9.33)
If the noises ek are Gaussian as well, then the joint distribution of
.x.tk/; ek/ is Gaussian and we can use the numerical integration methods
outlined in the previous section, because the integrals have the Gaussian
form (9.12). Because ek is independent of .x.tk/; ek/, we can also often
integrate the noise out in closed form.
Example 9.10 (Approximative Itô–Taylor method) . In the Itô–Taylor


## Page 183

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.3 Local Linearization Methods of Ozaki and Shoji 175
method in Algorithm 8.4, we have
ft
k .x.tk/; ek/DOx.tk/C f.Ox.tk/;tk/tC Lˇk
C ak.Ox.tk//t2
2 C
X
j
bk;j.Ox.tk//k; (9.34)
where the terms ak.Ox.tk// and bk;j.Ox.tk// are given by Equation (8.48)
and the terms ˇk;k are jointly Gaussian as deﬁned in Equa-
tion (8.46). If we put ek D .ˇk;k/, then the mean and covariance
recursions can be written in form (9.33), where the integrations can be ap-
proximated, for example, using cubature type of approximations discussed
in the previous section.
The preceding kind of approximation has been used in ﬁltering context,
for example, by Särkkä and Solin (2012), where the authors also compared
it with the approximations described in the previous section.
9.3 Local Linearization Methods of Ozaki and Shoji
The local linearization methods of Ozaki (1992, 1993) and Shoji and Ozaki
(1998) (see also Rao, 1999; Iacus, 2008) can be seen as instances of lin-
earization methods, where the linearization is chosen in a speciﬁc way. The
basic idea of the method of Ozaki (1993) can be described as follows. We
aim to approximate the solution of the following scalar SDE:
dxDf.x/ dtC dˇ: (9.35)
The idea is to approximate the solution on intervalŒt;t Ct, conditioned
onx.t/ as a linear SDE
dxDF xdtC dˇ: (9.36)
The reason why this is useful is that the discretization for linear equation
is then readily given by Equations (6.24) and (6.25) as
A.t/D exp.F t/;
†.t/D
Z t
0
exp.2F .t//q d
D q
2F Œexp.2F t/1;
(9.37)
giving the Gaussian approximation
p.x.tCt/jx.t// N.x.tCt/jA.t/x.t/;†.t//: (9.38)


## Page 184

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
176 Approximation of Nonlinear SDEs
To derive the method, let us now consider the noise-free equation
d.t/
dt Df./; .t/ Dx.t/: (9.39)
Differentiating once gives
d2
dt2Df0./ d
dt; (9.40)
where f0 is the derivative of f . Let us now assume that the derivative
is constant with the value of f0.x.t// . Then, by solving the differential
equation (9.40), we get
d
dt.tCt/D exp.f0.x.t//t/ d.t/
dt D exp.f0.x.t//t/f.x.t//:
(9.41)
Integrating from0 tot then gives
.tCt/Dx.t/C
Z t
0
exp.f0.x.t///f.x.t// d
Dx.t/C 1
f0.x.t//Œexp.f0.x.t//t/ 1f.x.t//
D

1C f.x.t//
x.t/f 0.x.t//Œexp.f0.x.t//t/ 1

x.t/: (9.42)
We then ﬁnally wish to determineF such that exp.f0.x.t//t/ matches
the coefﬁcient ofx.t/ in the preceding, that is,
exp.F t/D1C f.x.t//
x.t/f 0.x.t//Œexp.f0.x.t//t/ 1; (9.43)
which gives
FD 1
t log

1C f.x.t//
x.t/f 0.x.t//Œexp.f0.x.t//t/ 1

: (9.44)
This method can also be extended to multivariate SDEs, but it becomes
more complicated and less useful.
In the scalar case, we get the following algorithm.
Algorithm 9.11 (Local linearization of Ozaki). Given a scalar SDE of the
form
dxDf.x/ dtC dˇ; (9.45)


## Page 185

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.3 Local Linearization Methods of Ozaki and Shoji 177
we approximate its solution on intervalŒt;tCt by a linear time-invariant
SDE
dxDF xdtC dˇ; (9.46)
where
FD 1
t log

1C f.x.t//
x.t/f 0.x.t//Œexp.f0.x.t//t/ 1

: (9.47)
The method of Shoji and Ozaki (1998) is a modiﬁcation to the local
linearization method of Ozaki (1992, 1993), which extends more easily to
multivariate case. We aim to approximate the solution of a scalar SDE
dxDf.x;t/ dtC dˇ (9.48)
with a linear SDE
dxDGx dtCat dtCb dtC dˇ: (9.49)
Recall that the Itô formula forf gives
df.x;t/ D @f.x;t/
@t dtC@f.x;t/
@x dxC1
2
@2f.x;t/
@x2 dx2
D
@f.x;t/
@t Cq
2
@2f.x;t/
@x2

dtC@f.x;t/
dx dx: (9.50)
Let us now assume that@f=@x,@2f=@x2, and@f=@t are constant. Then on
the intervalŒt;u , this gives
f.x.u/;u/ f.x.t/;t/ D
@f.x;t/
@t Cq
2
@2f.x;t/
@x2

.ut/
C@f.x;t/
@x .x.u/x.t//: (9.51)
We get the approximation
f.x.u/;u/ DG.t/x.u/ Ca.t/uCb.t/; (9.52)
where the terms are given by
G.t/D @f.x;t/
@x ;
a.t/D @f.x;t/
@t Cq
2
@2f.x;t/
@x2 ;
b.t/Df.x.t/;t/ @f.x;t/
@x x.t/
@f.x;t/
@t Cq
2
@2f.x;t/
@x2

t:
(9.53)


## Page 186

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
178 Approximation of Nonlinear SDEs
Here we can now pick up the coefﬁcients for the approximation. In algo-
rithmic form the method is the following.
Algorithm 9.12 (Local linearization of Shoji and Ozaki) . Given a scalar
SDE of the form
dxDf.x;t/ dtC dˇ; (9.54)
we approximate it onŒt;t Ct is as a linear SDE
dxDGx dtCat dtCb dtC dˇ; (9.55)
where
GD @f.x.t/;t/
@x ;
aD @f.x.t/;t/
@t Cq
2
@2f.x.t/;t/
@x2 ;
bDf.x.t/;t/ @f.x.t/;t/
@x x.t/
@f.x.t/;t/
@t Cq
2
@2f.x.t/;t/
@x2

t:
(9.56)
Due to the appearance of x.t/ in the linearization coefﬁcients, local
linearization methods are not suitable for forming Gaussian (process) ap-
proximations to SDEs in the same sense as Gaussian assumed density ap-
proximations are. However, they were originally developed for numerical
simulation of SDEs as well as for one-step approximation of SDEs for pa-
rameter estimation. Numerical simulation with local linearization can be
done analogously to Algorithm 9.9 – at each small subinterval of length
t, we draw from the local linearization approximation instead of the true
transition density. This can be written in the following algorithmic form.
Algorithm 9.13 (SDE simulation by local linearization). Local lineariza-
tion methods can be used for simulating trajectories from an SDE as fol-
lows:
1. Divide the simulation interval Œt0;t intoM subintervals of lengtht.
2. At each subinterval, sequentially draw a new sample from the linear
SDE corresponding to the local linearization approximation.
The following example provides a comparison of the local linearization
methods with the Gaussian assumed density approximations outlined in
Section 9.1.


## Page 187

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.4 Taylor Series Expansions of Moment Equations 179
Example 9.14 (Local linearization vs. Gaussian approximations). For ex-
ample, consider the Beneš SDE
dxD tanh.x/ dtC dˇ; x.0/ Dx0: (9.57)
The ﬁrst local linearization in Algorithm 9.11 gives
dxDF xdtC dˇ; (9.58)
where
FD 1
t log

1C tanh.x0/
x0Œ1 tanh2.x0/
 Œexp.Œ1 tanh2.x0/t/1
!
: (9.59)
The coefﬁcients for the second linearization are
GD1 tanh2.x0/;
aDq tanh.x0/. tanh2.x0/1/;
bD tanh.x0/x0.tanh2.x0/1/:
(9.60)
Also recall that the corresponding (classical) linearization and sigma-
point approximations are given by Equations (9.23) and (9.24) with initial
conditionsm.0/Dx0 andP.0/D0.
Figure 9.3 shows simulation results computed with the local lineariza-
tion methods, the sigma point–based simulation method (cf. Example 9.6),
and the strong Itô–Taylor method of order1:5. In order to test the differ-
ences between the methods, we computed the histograms of the simulation
results at time t D 5 with initial condition x.0/ D 1=2 and by using a
relatively larget D 1 in each method. The sigma-point method was a
Gauss–Hermite–based method with 10 points. As can be seen, in this case
the sigma-point method produces a more accurate histogram than the local
linearization methods.
9.4 Taylor Series Expansions of Moment Equations
One way to approximate the moments of an SDEs on an intervalŒt;tCt
is to use the Taylor series expansion of the function (Kessler, 1997; Aït-
Sahalia, 2002, 2008)
t7! EŒ.x.tCt//j x.t/: (9.61)


## Page 188

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
180 Approximation of Nonlinear SDEs
/NUL10 0 10
x
(a) Gauss–Hermite
/NUL10 0 10
x (b) Local linearization I
/NUL10 0 10
x
(c) Local linearization II
/NUL10 0 10
x (d) Itô–Taylor
Figure 9.3 Comparison of numerical simulation of SDEs with
local linearization methods in Example 9.14, the
Gauss–Hermite–based simulation method, and the strong
Itô–Taylor method of order1:5. The solid density represents the
ground-truth reference.
The Taylor series expansion centered attD0, is now given as
EŒ.x.tCt//D
1X
kD0
1
kŠ
dk EŒ.x.t//
dtk tk; (9.62)
for which we need the time derivatives of EŒ.x.t//. Fortunately, we know
that the time derivative of this kind of expectation is given by the formula
(5.13), which says that
d EŒ.x.t//
dt D EŒA.x.t//; (9.63)
where A is the generator of the diffusion. Applying Equation (9.63) again
to the time derivative of A then gives
d EŒA.x.t//
dt D EŒA2.x.t//; (9.64)


## Page 189

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.4 Taylor Series Expansions of Moment Equations 181
and by using EŒA.x.t//D d EŒ.x.t//=dt on the left-hand side, we get
d2 EŒ.x.t//
dt2 D EŒA2.x.t//: (9.65)
Applying this further to A2.x.t//; A3.x.t//;::: then gives the general
formula
dn EŒ.x.t//
dtn D EŒAn.x.t//: (9.66)
By using this, we can form the Taylor series expansion of EŒ as
EŒ.x.tCt//D
1X
kD0
1
kŠ
dk EŒ.x.t//
dtk tk
D
1X
kD0
1
kŠ EŒAk.x.t//t k: (9.67)
However, if we now condition onx.t/, the expectations in the series disap-
pear and we get the following algorithm.
Algorithm 9.15 (Taylor series expansion of moments). Given an SDE
dxD f.x;t/ dtC L.x;t/ dˇ; (9.68)
the conditional expectation of a function .x/ on intervalŒt;t Ct can
be approximated by truncating the Taylor series expansion
EŒ.x.tCt//j x.t/D
1X
kD0
1
kŠ Ak.x.t//t k; (9.69)
where A is the generator of the diffusion in Deﬁnition 5.2.
The Taylor series approximation can be used to form Gaussian approx-
imations in the same way as we did in Section 9.2. The Taylor series pro-
vides asymptotically exact expressions for the mean and covariance, and
hence they can be used to replace the discretization-based approximations
that we used in Equation (9.33). These kinds of methods have been pro-
posed, for example, in Kessler (1997), Rao (1999), and Iacus (2008).
The moment computation is illustrated in the following example, where
the series expansion turns out to be ﬁnite and hence the moments can be
computed exactly from the Taylor series.
Example 9.16 (Moments of the Beneš SDE). Let
dxD tanh.x/ dtC dˇ; (9.70)


## Page 190

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
182 Approximation of Nonlinear SDEs
whereˇ.t/ is a standard Brownian motion. In this case, we have
AD tanh.x/ @
@xC1
2
@2
@x2: (9.71)
Applying this to function.x/Dx, then gives
A0.x/Dx;
A1.x/D tanh.x/;
An.x/D0; forn2;
(9.72)
and to function.x/Dx2:
A0.x/Dx2;
A1.x/D2x tanh.x/C1;
A2.x/D2;
An.x/D0; forn3:
(9.73)
For function.x/Dx3, we get:
A0.x/Dx3;
A1.x/D3xC3x2 tanh.x/;
A2.x/D6xC6 tanh.x/;
A3.x/D6 tanh.x/;
An.x/D0; forn4:
(9.74)
Thus we get that Taylor series expansions for the ﬁrst three noncentral
moments of the SDE on intervalŒt;t Ct, conditioned onx.t/ , are
EŒx.tCt/jx.t/Dx.t/C tanh.x.t//t;
EŒx2.tCt/jx.t/Dx2.t/C2x.t/ tanh.x.t//t CtCt2;
EŒx3.tCt/jx.t/Dx3.t/C3x.t/t C3x2.t/ tanh.x.t//t
C3x.t/t 2C3 tanh.x.t//t 2C tanh.x.t//t 3;
(9.75)
which are indeed exact. If we used the ﬁrst two moments in the preceding
to form a Gaussian approximation as in Example 9.6, we would recover
the exact Gaussian ﬁt shown in Figure 9.1. However, this approximation
could be improved by using higher-order moments to form a non-Gaussian
density approximation.
Similarly to Gaussian assumed density approximations in Section 9.1
and local linearization methods in Section 9.3, the local transition density


## Page 191

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.5 Hermite Expansions of Transition Densities 183
approximation implied by the Taylor series expansion can be used to con-
struct SDE simulation methods (cf. Algorithms 9.9 and 9.13).
9.5 Hermite Expansions of Transition Densities
Provided that the transition density of the SDE is close to a normal distri-
bution, we can use a Fourier–Hermite series to approximate it. This idea is
presented by Aït-Sahalia (2002, 2008) and can also be found, for example,
in Rao (1999) and Iacus (2008).
Consider the following SDE:
dxD f.x/ dtC L dˇ; (9.76)
where ˇ is a vector of Brownian motions with diffusion matrix Q. We
also need to assume that L Q LT is invertible. In the articles of Aït-Sahalia
(2002, 2008), it was assumed that the equation had already been trans-
formed into unit diffusion by the Lamperti transform, but here we will di-
rectly apply the method to the preceding SDE with nonunit diffusion.
We now aim to form an approximation to the transition density
px.x.tCt/j x.t//; (9.77)
wheret >0. Let us now deﬁne a “pseudonormalized” increment
zDŒL Q LTt1=2Œx.tCt/ x.t/; (9.78)
which should be quite close to a N .0; I/ random variable. If we denote
the probability density of z given x.t/ asq.zj x.t//, then the transition
density of the original process can be rewritten as
p.x.tCt/j x.t//
Dj L Q LTtj1=2q.ŒL Q LTt1=2Œx.tCt/ x.t/j x.t//:
(9.79)
Let H˛.z/ be the multivariate probabilists’ Hermite polynomials with
multi-indexing˛D.˛1;˛2;:::;˛ n/, which can be deﬁned as follows:
H˛.z/D H˛1.z1/ H˛2.z1/ H˛n.zn/; (9.80)
where Hj are univariate Hermite polynomials deﬁned as
Hj.z/D.1/j exp.z2=2/ dj
dzj exp.z2=2/: (9.81)


## Page 192

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
184 Approximation of Nonlinear SDEs
We can now form theJ th order Fourier–Hermite series expansion ofq=N
as follows:
q.zj x.t//
N.zj 0; I/
X
j˛jJ
c˛
˛Š H˛.z/; (9.82)
where
c˛D
Z
H˛.z/q. zj x.t// dz
D E
h
H˛.ŒL Q LTt1=2Œx.tCt/ x.t//j x.t/
i
: (9.83)
This series will converge provided that the tails of q.zj x.t// are “thin”
enough (see Aït-Sahalia, 2002, 2008, for mathematical details). We can
then recover the transition density approximation from Equation (9.79) as
p.x.tCt/j x.t//
D N.zj 0; I/
jL Q LTtj1=2q.ŒL Q LTt1=2Œx.tCt/ x.t/j x.t//
 N.zj 0; I/
jL Q LTtj1=2
X
j˛jJ
c˛
˛Š H˛.ŒL Q LTt1=2Œx.tCt/ x.t//;
(9.84)
In order to implement the method, we also need a way to compute the
expectations appearing in Equation (9.83). For that purpose Aït-Sahalia
(2002, 2008) suggests to use the moment Taylor series expansion that was
discussed in Section 9.4. By selecting the orders of the Taylor series and
Hermite series suitably, we can control the approximation accuracy. The
resulting expansion is “closed form” in the sense that it is possible to tab-
ulate expansions such that we only need to plug in the derivatives of the
drift. Such expansions with Taylor series of order three and Hermite poly-
nomials of order six, for scalar SDEs, have been tabulated in Aït-Sahalia
(2002).
The algorithm is thus the following.
Algorithm 9.17 (Hermite expansion of transition density) . The Hermite
expansion approximation of the transition density of an SDE
dxD f.x/ dtC L dˇ (9.85)
can be formed as follows:
1. Compute the coefﬁcientsc˛ in Equation (9.83) by using a truncated mo-
ment Taylor series expansion introduced in Section 9.4.


## Page 193

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.6 Discretization of FPK 185
/NUL10 0 10
x
Exact density
Series approximation
(a) Hermite expansion attD2
/NUL10 0 10
x (b) Hermite expansion attD5
Figure 9.4 Illustration of the Hermite expansion approximation
in Example 9.18 for the Beneš SDE.
2. Approximate the transition density of the SDE using a truncated Hermite
expansion in Equation (9.84).
The expansion is illustrated in the following example.
Example 9.18 (Hermite expansion of Beneš SDE) . We used the coefﬁ-
cients tabulated in Aït-Sahalia (2002) to approximate the solution to the
Beneš SDE
dxD tanh.x/ dtC dˇ; x.0/ Dx0: (9.86)
Figure 9.4 shows the approximation at tD 2 andtD 5 withx0D 1=2.
The approximation attD 2 is still quite accurate, but the approximation
attD5 is already quite inaccurate.
9.6 Discretization of FPK
We can also use partial differential equation (PDE) approximations to ob-
tain approximate solutions to the Fokker–Planck–Kolmogorov PDE or its
transition density. The Hermite-expansion and Gaussian approximations
can indeed be seen as methods in this class, but here we consider the ﬁnite
differences and basis function type of (Galerkin) approaches that can be
seen as methods to discretize the FPK, that is, to approximate it as a ﬁnite-
dimensional equation. More details on PDE methodology can be found, for
example, in the books of Kreyszig (1993) and Brenner and Scott (2002).


## Page 194

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
186 Approximation of Nonlinear SDEs
Recall that the Fokker–Planck–Kolmorogov equation has the form
@p.x;t/
@t D Ap.x;t/; (9.87)
where A is the operator deﬁned in Equation (5.36). It turns out that we
can approximate this equation as a ﬁnite-dimensional system, which is just
a homogeneous linear system that we can easily numerically solve. How to
obtain this ﬁnite-dimensional system is, though, the key question, and here
we take a look at two methods to do that: the ﬁnite-differences and basis
function approximations.
We already saw in Exercise 5.3 that we can use ﬁnite differences to
approximate the PDE. For that purpose, we need to discretize the state
space to a ﬁnite grid fxi W i D 1;2;:::;N g and then approximate the
derivatives as ﬁnite differences. A similar ﬁnite-differences approximation
was also used to generate the reference result in Figure 7.3. In the one-
dimensional case, the approximation could be given as
@p.x;t/
@x  p.xCh;t/p.xh;t/
2h ;
@2p.x;t/
@x2  p.xCh;t/2p.x;t/ Cp.xh;t/
h2 ;
(9.88)
and analogously in the multivariate case. If we collect the grid point evalua-
tionsp.xi;t/ into a vector p.t/, this kind of approximation corresponds to
certain matrix multiplication of p.t/. Thus the whole FPK can be rewritten
as a linear system
dp
dt D Ffd.t/ p; (9.89)
where Ffd.t/ is the ﬁnite-difference approximation matrix for the operator
A. An advantage of ﬁnite-difference approximations is that the matrix
Ffd.t/ tends to be very sparse and hence sparse matrix routines can be used
to make the computations faster.
Given the grid evaluations of the initial conditions p.xi;t0/ collected
into a vector p.t0/, this equation can now be solved as
p.t/D‰fd.t;t0/ p.t0/; (9.90)
where ‰fd is the transition matrix corresponding to Ffd.t/. In a time-
invariant case, we thus simply have
p.t/D exp..tt0/ Ffd/ p.t0/: (9.91)


## Page 195

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.6 Discretization of FPK 187
However, in practice we often use methods like backward Euler or Runge–
Kutta for the temporal integration, because the computation of the transi-
tion matrix or the matrix exponential can be computationally heavy or even
intractable. In particular, the matrix exponential tends to be a dense matrix
even when Ffd is a sparse matrix, and hence the speedup provided by sparse
routines is lost. It is also possible to jointly discretize the time direction to
get a single equation for the full space–time solution.
Another useful approach for the FPK solution is to ﬁx a set of basis
functionsfi.x/WiD1;2;::: g and then approximate the PDE solution as
p.x;t/ 
NX
iD1
pi.t/ i.x/; (9.92)
where the time evolution of the coefﬁcientspi.t/ is to be determined – note
that the coefﬁcients are not usually the same as with the ﬁnite-difference
approximation, although the ﬁnite-difference approximation is a special
case of this kind of expansions.
It now turns out that we can approximate the operator A on the basis
fig with a matrix Fbf.t/ that operates on the coefﬁcients. The operation
Ap then corresponds to multiplication of the coefﬁcients in the expansion
(9.92) with this matrix:
Ap$ Fbf.t/ p; (9.93)
where pD

p1;p2;:::

is a vector formed from the series expansion co-
efﬁcients. Because the basis functionsi are independent of time, we also
have the correspondence
@p
@t $ dp
dt: (9.94)
Thus we can express the FPK PDE on the basisfig as follows:
dp
dt D Fbf.t/ p: (9.95)
Note that this equation has the same form as Equation (9.89), and we can
use either matrix exponential (in the time-independent case) or the transi-
tion matrix corresponding to Fbf.t/ to express the solution as
p.t/D‰bf.t;t0/ p.t0/; (9.96)
where p.t0/ is the vector of projection coefﬁcients ofp.x;t0/.


## Page 196

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
188 Approximation of Nonlinear SDEs
How can we obtain the matrix Fbf.t/ then? Let us put
g.x/D
NX
iD1
gii.x/ and f. x/D
NX
iD1
fii.x/; (9.97)
and consider the transformationgD Af, which now looks like this:
NX
iD1
gii.x/D
NX
iD1
fi Ai.x/: (9.98)
Assume that we know ffig and wish to determine fgig, and denote the
corresponding vectors as f and g. We now have a few options to determine
the required matrix:
Point collocation: One way is to select N pointsfxjg in the state space
and insist that the equation must hold on each of them:
NX
iD1
gii.x1/D
NX
iD1
fi Ai.x1/;
:::
NX
iD1
gii.xN/D
NX
iD1
fi Ai.xN/:
(9.99)
If we deﬁne matricesˆ and such thatˆijDj.xi/,ijD Aj.xi/,
then this equation has the form
ˆ gD f; which gives gDˆ1 f (9.100)
and thus the matrix is determined via Fbf.t/Dˆ1.
Ritz–Galerkin method: We can also ﬁx an inner product h;i and
choose another set of N functionsf'ig. We can now take inner prod-
ucts of Equations (9.98) with each of these functions to give
NX
iD1
gihi;'1iD
NX
iD1
fihAi;'1i;
:::
NX
iD1
gihi;'NiD
NX
iD1
fihAi;'Ni:
(9.101)


## Page 197

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.6 Discretization of FPK 189
Deﬁning matricesˆ and viaˆijDh j;'ii andijDh Aj;'ii,
this again leads to the matrix
Fbf.t/Dˆ1: (9.102)
Other basis function methods: We can also get several other methods as
special cases of the Ritz–Galerkin method:
1. A very common choice of basis functions is to put 'iDi and select
the basis functions to be orthonormal hi;jiD ıij. This class of
methods is often called spectral methods. An example of such basis
is the canonical Fourier basis consisting of sines and cosines. Due to
the orthonormality, the matrix Fbf.t/ directly consists of the elements
hAj;ii.
2. Using basis functions or “elements” that have a ﬁnite support leads to
ﬁnite-element methods (FEM), which are very popular in engineering
applications. However, in order to allow for simpler (typically piece-
wise linear) basis functions, we need to integratehAj;'ii by parts
to have only single differentiation on both j and'i, which compli-
cates the equations a bit. For details, see Brenner and Scott (2002).
The advantage of FEM is that it is suitable for sparse matrix routines,
as the ﬁnite support of the elements induces sparseness in the matri-
ces.
3. The point collocation corresponds to the selection 'i.x/Dı.x xi/
with anL2 inner product.
We can now formulate the following generic algorithm.
Algorithm 9.19 (Discretization approximation of FPK) . The following is
a generic algorithm for discretization approximation of FPK targeted for
solvingp.x;t/ givenp.x;t0/ wheret >t0:
1. Construct a ﬁnite-dimensional vector p.t0/ D

p1.t0/;:::;p N.t0/

such that we can represent the initial p.x;t0/ approximately as a se-
ries expansion
p.x;t0/
NX
iD1
pi.t0/i.x/: (9.103)
The basis functions can be piecewise constant (as in ﬁnite differences),
Fourier basis functions, or any of the other Galerkin or ﬁnite-element
type of basis functions discussed previously.


## Page 198

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
190 Approximation of Nonlinear SDEs
/NUL15 /NUL10 /NUL5 0 5 10 15
x
Exact density
Series approximation
Figure 9.5 Illustration of the series expansion of FPK equation
for the Beneš SDE in Example 9.20.
2. Construct a discretization matrix F.t/ by projecting or otherwise ap-
proximating the operator on the basis using the previously described
methods.
3. Solve the linear system
dp
dt D F.t/ p; p.t0/D given; (9.104)
at time t using backward Euler or Runge–Kutta or by computing the
matrix exponential in the case of a time-invariant system (and if the
nonsparseness is not an issue).
4. Approximate the probability density at t as
p.x;t/ 
NX
iD1
pi.t/ i.x/: (9.105)
If we are interested in the transition density, then the initial coefﬁcients
p.t0/ should be selected to approximate the Dirac delta function.
An example of FPK approximation using an orthonormal basis is pre-
sented in the following.
Example 9.20 (Discretized FPK for the Beneš SDE). Consider the model
dxD tanh.x/ dtC dˇ; (9.106)


## Page 199

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.6 Discretization of FPK 191
which gives the FPK
@p.x;t/
@t D @
@xŒtanh.x/p.x;t/ C1
2
@2p.x;t/
@x2 : (9.107)
Let us select the basis
i.x/D 1p
L
sin.i.xCL//; (9.108)
whereiD i
2L, which is also the eigenbasis of the operator @2ı
@x2 with
Dirichlet boundary conditions atxDL andxDL. If we deﬁne
hf;giD
Z L
L
f.x/g.x/ dx; (9.109)
thenhi;jiD ıij and the matrix elements are given by
ŒFbfijD
Z L
L

 @
@x

tanh.x/j.x/

C1
2
@2j.x/
@x2

i.x/ dx
D
Z L
L

Œtanh2.x/1j.x/ tanh.x/@j.x/
@x

i.x/ dx1
22
i ıij
D 1
L
Z L
L

Œtanh2.x/1 sin.j.xCL//
 tanh.x/j cos.j.xCL//

sin.i.xCL// dx
1
22
i ıij; (9.110)
where we have usedh@2j
ı
@x2;iiD 2
iıij and the remaining integral
can be evaluated with numerical integration.
The series expansion approximation with 20 terms is shown in Fig-
ure 9.5. The linear system resulting from the discretization was solved us-
ing a matrix exponential. As can be seen in the ﬁgure, the approximation
is already quite close to the exact density. However, there is one disadvan-
tage: the approximation becomes negative at some points and hence the
interpretation of it directly as a probability density approximation can be
hard.


## Page 200

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
192 Approximation of Nonlinear SDEs
9.7 Simulated Likelihood Methods
The basic idea in simulated likelihood methods (Pedersen, 1995; Brandt
and Santa-Clara, 2002; Iacus, 2008) is to use a simple simulation to ap-
proximate the transition density p.x.t/ j x.t0//. We ﬁrst divide the in-
tervalŒt0;t intoM steps of length .tt0/=M . Then we use an Euler–
Maruyama approximation on each subinterval. Instead of running Euler–
Maruyama over all the intervals, we stop at step mD M1. We then
compute the expectation of the Euler–Maruyama induced transition den-
sity approximation over that last subinterval. That is, we replace the last
step in the Euler–Maruyama approximation with the transition density im-
plied by the Euler approximation. This simple trick allows us to obtain a
continuous approximation to the transition density which can be shown to
converge to the true density (Pedersen, 1995).
The algorithm is the following.
Algorithm 9.21 (Simulated likelihood method). The transition density ap-
proximation in the simulated likelihood method is formed as follows:
1. Divide the interval Œt0;t toM subintervals of lengtht.
2. Run Euler–Maruyama overM1 steps, that is, until the second-to-last
steptM1Dtt.
3. Perform the preceding simulation N times, which results in the samples
Ox.n/.tM1/ for the second-to-last step, wherenD1;:::;N .
4. The transition density is then approximated as
p.x.t/j x.t0//
 1
N
NX
nD1
N.x.t/jOx.n/.tM1/C f.Ox.n/.tM1/;tM1/t;
L.Ox.n/.tM1/;tM1/ Q LT.Ox.n/.tM1/;tM1/t/: (9.111)
Instead of the applying Euler–Maruyama approximation, we can also
use any of the other SDE discretization methods from Chapter 8 that al-
low for closed-form transition density approximation. The approach can
also be seen as a kernel density estimator, and we can replace the transi-
tion density–based kernel with some other kernel while still getting con-
vergence of the approximation.


## Page 201

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.8 Pathwise Series Expansions and the Wong–Zakai Theorem 193
9.8 Pathwise Series Expansions and the Wong–Zakai Theorem
As discussed in Section 7.2, if we ﬁx the time intervalŒ0;T , then on that
interval standard Brownian motion has a series expansion of the form (see,
e.g., Luo, 2006, and Section 7.2)
ˇ.t/D
1X
nD1
zn
Z t
0
'n./ d; (9.112)
wherezn N.0;1/ fornD 1;2;::: are independent Gaussian random
variables andf'n.t/g are a suitable set of basis functions. One possible
choice is the set of functions corresponding to the Karhunen–Loeve ex-
pansion given in Equation (7.29). The series expansion can be interpreted
as the following representation for the differential of standard Brownian
motion:
dˇ.t/D
1X
nD1
zn'n.t/ dt: (9.113)
We can now consider approximating the following equation by substituting
a ﬁnite numberN of terms from the preceding sum for the term d ˇ.t/ in
the scalar SDE
dxDf.x;t/ dtCL.x;t/ dˇ: (9.114)
In the limitN!1 , we could then expect to get the exact solution. How-
ever, it has been shown by Wong and Zakai (1965) that this approximation
actually converges to the Stratonovich SDE
dxDf.x;t/ dtCL.x;t/ ı dˇ: (9.115)
That is, we can approximate the preceding Stratonovich SDE with an equa-
tion of the form
dxDf.x;t/ dtCL.x;t/
NX
nD1
zn'n.t/ dt; (9.116)
which actually is just an ordinary differential equation
dx
dt Df.x;t/ CL.x;t/
NX
nD1
zn'n.t/; (9.117)
and the solution converges to the exact solution, when N !1 . The so-
lution of an Itô SDE can be approximated by ﬁrst converting it into the
corresponding Stratonovich equation and then approximating the resulting
equation.


## Page 202

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
194 Approximation of Nonlinear SDEs
Now an obvious extension is to consider a multivariate version of this
approximation. Because any multivariate Brownian motion can be formed
as a linear combination of independent standard Brownian motions, it is
possible to form analogous multivariate approximations. Unfortunately, in
the multivariate case the approximation does not generally converge to the
Stratonovich solution. There exists basis functions for which this is true
(e.g., Haar wavelets), but the convergence is not generally guaranteed. Any-
way, we get the following algorithm (cf. Lyons et al., 2012, 2014).
Algorithm 9.22 (Pathwise series expansion of SDEs) . An approximation
to a Stratonovich SDE
dxD f.x;t/ dtC L.x;t/ı dˇ; (9.118)
via a series expansion of the Brownian motion can be formed as follows:
1. Approximate the vector of Brownian motions with a series expansion of
the form
ˇ.t/D
p
Q
NX
nD1
zn
Z t
0
'n./ d; (9.119)
where zn N.0; I/ are independent Gaussian random variables. For
example, we can select'n.t/ to be the Fourier cosine basis in (7.29).
2. The corresponding approximation to the SDE is then given by the ordi-
nary differential equation
dx
dt D f.x;t/C L.x;t/
p
Q
NX
nD1
zn'n.t/: (9.120)
However, the convergence of the preceding algorithm with N ! 1
needs to be carefully investigated case-by-case (Lyons et al., 2014). Also
recall that in the additive noise case the Itô and Stratonovich SDEs are
equivalent, and hence in that case, if the approximation converges, it con-
verges to the corresponding Itô SDE.
The series expansion approximation can be used both for forming para-
metric approximations to SDE solutions as well as for simulating trajecto-
ries from SDEs.
Another type of series expansion is the so-called Wiener chaos expan-
sion (see, e.g., Cameron and Martin, 1947; Luo, 2006). Assume that we
indeed are able to solve the Equation (9.120) with any given countably
inﬁnite number of valuesfz1;z2;:::g. Then we can see the solution as a


## Page 203

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
9.8 Pathwise Series Expansions and the Wong–Zakai Theorem 195
/NUL10 0 10
x
(a) Approximation with10 terms
/NUL10 0 10
x (b) Approximation with100 terms
0 2 4
0 1 2
Time, t
x.t /
(c) Trajectories with10 and100 terms
100 101 102
0 0:2 0:4 0:6
Number of terms, N
Absolute error
Error in mean
Error in STD (d) Approximation error
Figure 9.6 The subﬁgures (a) and (b) show the probability
density approximations resulting from the series expansions in
the Beneš SDE in Example 9.23 withND10 andND100
terms. The subﬁgure (c) shows the corresponding trajectory
approximations and (d) illustrates the accuracy of the
approximation by showing the errors in the empirical
approximations of the mean and standard deviation (STD).
function (or functional) of the form
x.t/DU.tIz1;z2;:::/: (9.121)
The Wiener chaos expansion is the multivariate Fourier–Hermite series for
the right-hand side. That is, it is a polynomial expansion of a generic func-
tional of Brownian motion in terms of Gaussian random variables. Hence
the expansion is also called polynomial chaos.
Example 9.23 (Pathwise series expansion of Beneš SDE) . The series ex-
pansion approximation of the Beneš SDE
dxD tanh.x/ dtC dˇ; x.0/ Dx0; (9.122)
withx0D1=2 at timetD5, is shown in Figure 9.6. The series expansion


## Page 204

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
196 Approximation of Nonlinear SDEs
was the cosine series given in Equation (7.29) with T D 5, which thus
corresponds to the approximation
dx
dt D tanh.x/C
NX
nD1
zn
2
T
1=2
cos
.2n1/
2T t

; (9.123)
wherezn N.0;1/ . As can be seen from the ﬁgure, the distribution of the
SDE is already well approximated withND10 basis functions, although
the trajectories themselves are much smoother than actual Brownian paths.
9.9 Exercises
9.1 Gaussian approximation of SDEs:
(a) Form a Gaussian assumed density approximation to the SDE in Equa-
tion (8.134) in the time interval t2 Œ0;5 and compare it to the exact
solution. Compute the Gaussian integrals numerically on a uniform grid.
(b) Form a Gaussian assumed density approximation to Equation (8.133)
and numerically compare it to the histogram obtained in Exercise 8.1.
9.2 Derive a similar series of moments as in Example 9.16 for the sine diffusion
model
dxD sin.x/ dtC dˇ; (9.124)
whereˇ.t/ is a standard Brownian motion, and compare it to moments com-
puted from the Euler–Maruyama method.
9.3 Derive the local linearization for the model given in Equation (9.124) and
numerically compare it to a cubature-based sigma-point approximation.
9.4 Use a ﬁnite-differences approximation to the FPK equation for the model
given in Equation (9.124):
(a) Select the same basis as in Example 9.20 and write out the evolution
equation.
(b) Solve it numerically and sketch the evolution of the probability density
with a suitably chosen initial condition. Compare the result to the Euler–
Maruyama method.
9.5 Implement a pathwise series approximation to the model (9.124) using the
same basis as in Example 9.23.


## Page 205

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10
Filtering and Smoothing Theory
In this chapter, we consider a solution to the following problem. Assume
that we have a pair of processes .x.t/; y.t// such that y.t/ is observed
and x.t/ is hidden. Now the question is as follows: Given that we have
observed y.t/ on some in interval, what can we say (in statistical sense)
about the hidden process x.t/? This problem is a classical one and has
been throughly treated – from different points of view – for example, in
the books of Stratonovich (1968), Jazwinski (1970), Maybeck (1979 and
1982a), Särkkä (2006 and 2013), and Crisan and Rozovskiˇı (2011).
The most fruitful statistical approach to the problem is the so-called
probabilistic or Bayesian approach, which is used in the aforementioned
references and which we also follow here. The main question in a statis-
tical sense is that of the conditional probability distribution of the hidden
process x.t/ given the observed process y.t/. This distribution contains
all statistical information that can be known about the processes given the
model and the observations. It is important to understand that from the
modeling point of view, randomness does not “exist”, but it is merely used
as a representation of uncertainty.
Although in the context of this book it is most natural to model both the
processes x.t/ and y.t/ as continuous-time processes deﬁned as solutions
to SDEs, this is not always the case in the real world. In the real world, the
process x.t/ is indeed often a continuous-time process, but the observa-
tions are not; due to the sampling process, we only get to see samples yk,
which are connected to discrete-time samples x.tk/ of the hidden process.
The time points t1;t2;::: are sometimes uniformly spaced, that is, some-
timestkDtkC1tk is constant, but more often in multisensor applica-
tions they are not due to asynchrony of the sensors. This asynchronous case
is where the SDE-based models have the most advantages; we can evalu-
ate them at arbitrary time points and thus form arbitrary discretizations and
sampling schemes without changing the underlying continuous time (SDE)
197


## Page 206

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
198 Filtering and Smoothing Theory
model. This property is sometimes called “discretization invariance” and is
extremely useful in multisensor systems.
10.1 Statistical Inference on SDEs
Let us now assume that we have a physical system whose dynamics are
governed by the differential equation
dx.t/
dt D f.x.t/;t/: (10.1)
We then model the uncertainty in the physical system by including a noise
process w.t/ to the system, which leads to a white noise–driven differential
equation:
dx.t/
dt D f.x.t/;t/ C L.x;t/ w.t/; (10.2)
which we now, based on the learnings from the previous chapters, rather
reinterpret as an Itô stochastic differential equation
dx.t/D f.x.t/;t/ dtC L.x;t/ dˇ.t/: (10.3)
When it comes to the measurements, we can model our ideal measure-
ments as functions of the state
y.t/D h.x.t/;t/; (10.4)
where h.;/ models the sensor that we have. If we directly measure the
state, then h is an identity function, but for example, in the case of distance
measurement, the function can be a nonlinear function of the position coor-
dinates in the state x.t/. To account for the uncertainties and inaccuracies
in the sensor measurements, we can assume that they are corrupted by some
white noise".t/:
y.t/D h.x.t/;t/ C".t/: (10.5)
In order to interpret this as an SDE, we need to deﬁne a process z.t/ such
that formally y.t/D dz.t/=dt , which enables us to write the measurement
model as a stochastic differential equation
dz.t/D h.x.t/;t/ dtC d.t/; (10.6)
with".t/ D d.t/=dt . The resulting model is called a continuous-time
state-space model, which we can now deﬁne as follows.


## Page 207

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.1 Statistical Inference on SDEs 199
Deﬁnition 10.1 (Continuous-time state-space model) . A continuous time
state-space model is a model of the form
dxD f.x;t/ dtC L.x;t/ dˇ;
dzD h.x;t/ dtC d; (10.7)
where the ﬁrst equation is the dynamic model and the second the measure-
ment model. In the equation, x.t/2 RD is the state process, z.t/2 RM is
the (integrated) measurement process, f is the drift function, h is the mea-
surement model function, L.x;t/ is the dispersion matrix, andˇ.t/2 RS
and.t/2 RM are independent Brownian motions with diffusion matrices
Q and R, respectively.
This model can also be interpreted as a white noise–driven model
dx
dt D f.x;t/C L.x;t/ w;
yD h.x;t/C";
(10.8)
where we formally have w.t/D dˇ.t/=dt , y.t/D dz.t/=dt , and".t/D
d.t/=dt .
As discussed previously, in the real world we often obtain the measure-
ments at discrete time instants rather than continuously as in the preceding
model. In that case, we can model our measurements as
ykD hk.x.tk//C rk; (10.9)
wheretk2f t1;t2;:::g is some sequence of measurement times and rk is
a discrete-time sequence of independent Gaussian noises N.0; Rk/. This is
the most important class of models that we encounter in practical applica-
tions.
However, the model essentially says that
p.ykj x.tk//D N.ykj hk.x.tk//; Rk/; (10.10)
which has the limitation that it assumes that the noise is Gaussian. We can
get rid of this limitation by letting our measurement model have a more
general form
ykp.ykj x.tk//; (10.11)
which means that the measurement model is constructed by deﬁning the
conditional distribution of measurements p.ykj x.tk//. This distribution
can also be non-Gaussian. The resulting model is the continuous-discrete
state-space model.


## Page 208

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
200 Filtering and Smoothing Theory
w1.t/
w2.t/
(a) Dynamic model
.y1;y2/
(b) Measurement model
Figure 10.1 Illustration of (a) a dynamic and (b) a measurement
model of a car from Example 10.3. In the dynamic model, the
unknown forcesw1.t/ andw2.t/ are modeled as white noise
processes. The measurements.y1;y2/ are modeled as noise
corrupted observations of the car’s position.
Deﬁnition 10.2 (Continuous-discrete state-space model) . A general
continuous-discrete state-space model can be formulated as
dxD f.x;t/ dtC L.x;t/ dˇ;
ykp.ykj x.tk//; (10.12)
where x.t/2 RD is the state, and yk2 RM is the measurement obtained
at time instant tk. f is the drift function, L is the dispersion matrix, and
ˇ.t/ 2 RS is Brownian motion with diffusion matrix Q. Furthermore,
p.ykj x.tk// is the measurement model, which deﬁnes the distribution (or
likelihood) of the measurement yk given the state x.tk/. The measurements
are assumed to be conditionally independent of the state.
In practice, we often construct the measurement modelp.ykj x.tk// as
a noise-corrupted measurement of the form
ykD hk.x.tk//C rk; (10.13)
where rk N.0; Rk/ is a Gaussian measurement noise. This thus implies
that our measurement model is given as
p.ykj x.tk//D N.ykj hk.x.tk//; Rk/: (10.14)
Example 10.3 describes a typical statistical inference problem.


## Page 209

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.1 Statistical Inference on SDEs 201
Example 10.3 (Car tracking model). Recall that in Example 3.4 we mod-
eled the dynamics of a car via the white noise–force Newton’s law
d2x1
dt2 Dw1.t/ and d2x2
dt2 Dw2.t/
(see Figure 10.1a), which then resulted in an SDE model of the following
form (in white noise interpretation):
dx
dt D F xC L w:
Let us now assume that we use a radar to obtain noisy measurements
.y1;y2/ of the car’s position, which thus can be modeled as
y1.t/Dx1.t/C"1.t/;
y2.t/Dx2.t/C"2.t/;
where"1.t/ and"2.t/ are white noise processes (see Figure 10.1b). The
measurement model can now be written as
y.t/D H x.t/C".t/; HD
1 0 0 0
0 1 0 0

; (10.15)
where"D

"1;"2

.
If we now interpret both the dynamic model and measurement model as
proper SDEs, the resulting model can be written as
dxD F x dtC L dˇ;
dzD H x dtC d; (10.16)
where formally yD dz=dt and"D d=dt .
The corresponding continuous-discrete model is obtained by assuming
that we measure
y1;kDx1.tk/Cr1;k;
y2;kDx2.tk/Cr2;k; (10.17)
with rkD.r1;k;r2;k/ N.0; Rk/. The resulting model then has the form
dxD F x dtC L dˇ;
ykD H x.tk/C rk: (10.18)
The models in Equations (10.16) and (10.18) are canonical examples of
state-space models, where our interest is to infer the state (the position and
velocity of the car) from the noisy measurements z.t/ or yk. In a statistical
sense, this corresponds to computation of the conditional distribution or


## Page 210

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
202 Filtering and Smoothing Theory
the posterior distribution of the state x.t/ given the measurements. Given
the conditional distribution, we can, for example, compute the conditional
mean of the state, which is also its minimum mean squared estimate, as
well as its covariance, which measures the accuracy of the estimate.
We can now consider different kinds of statistical estimation problems
on the model (for the discrete-time analogues, see Särkkä, 2013):
Batch estimation problem: Reconstruct the whole state trajectory, say,
XtTDf x./j0tTg, from the measurementsZtTDf z./j0
tTg or in the continuous-discrete case fromy1WTDf y1; y2;:::; yTg.
The solution involves computing the posterior distributionp.XtTj ZtT/
orp.XtTj y1WT/, which turns out to be intractable in general. Therefore,
it is convenient to consider the so-called ﬁltering and smoothing prob-
lems that follow. In the previous car example, the batch estimate cor-
responds to determining the joint conditional distribution of the whole
state trajectory given all the measurements.
Filtering problem: Determine the state x.t/ at timet given the history of
measurements obtained so far, that is, ZtDf z./j 0  tg or in
continuous-discrete time given y1Wk such thattkt. The corresponding
posterior distribution is called the ﬁltering distribution, and it is the dis-
tributionp.x.t/j Zt/ orp.x.t/j y1Wk/. Strictly speaking, whent >tk,
the latter distribution is a predicted or prediction distribution, but we of-
ten call it simply ﬁltering distribution as well. In the aforementioned car
example, this corresponds to determining the conditional distribution of
the car position and velocity given the history of measurements obtained
so far. These kinds of estimates are useful in all kinds of target tracking
applications where we are interested in the current state of the system
given the measurements that we have already seen (without looking into
the future).
Smoothing problem: Determine the states x./ for each2Œ0;tT given
the history of measurements ZtT D fz./ j 0    tTg or in
continuous-discrete time given y1WT . The posterior distributions to be
computed are p.x./j ZtT/ orp.x./j y1WT/ for all 2 Œ0;tT. The
difference to the batch estimate is that we only compute the distributions
for each  separately and do not attempt to reconstruct the joint distri-
bution over all times. In the car tracking example, this corresponds to
determining the conditional distributions of the history of the states at
each time during the measurement interval. These kinds of smoothing
solutions are useful in reﬁning the state estimates of tracking problems
by also using information “from the future”.


## Page 211

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.2 Batch Trajectory Estimates 203
10.2 Batch Trajectory Estimates
Let us now take a brief look at batch estimation problem and see why it
is computationally inconvenient. It is easiest to start by considering the
continuous-discrete problem in Deﬁnition 10.2. If we denote the transition
density of the SDE in Equation (10.12) asp.x.tkC1/j x.tk//, then we can
form the distribution of the states at the measurement times t1;t2;:::;t T
and the initial statet0 as follows:
p.x.t0/;:::; x.tT//Dp.x0/
T1Y
kD0
p.x.tkC1/j x.tk//: (10.19)
Similarly, we could form any other ﬁnite-dimensional distribution of the
process, but let us keep with the measurement times for notational simplic-
ity. Due to conditional independence of the measurements, we can write
p.y1;:::; yTj x.t0/;:::; x.tT//D
TY
kD1
p.ykj x.tk//: (10.20)
In principle, for a givenT we could simply compute the posterior distribu-
tion of the states by Bayes’ rule:
p.x.t0/;:::; x.tT/j y1;:::; yT/
D p.y1;:::; yTj x.t0/;:::; x.tT//p. x.t0/;:::; x.tT//
p.y1;:::; yT/
/p.y1;:::; yTj x.t0/;:::; x.tT//p. x.t0/;:::; x.tT//: (10.21)
This problem is now equivalent to a discrete-time batch state estimation
problem whose shortcomings are discussed, for example, in Särkkä (2013).
The challenge with this formulation is that the computational complexity
scales at least cubically with the number of measurements, and another
problem is that there is no way to include more measurements to the poste-
rior distribution without recomputing the whole state posterior distribution.
Thus even with a ﬁnite number of time points, as in the preceding
discrete-time formulation, the explicit batch estimation problem quickly
becomes computationally heavy and even intractable. In the current case,
the problem is even worse – we have the whole state trajectory XtT to
estimate, not only some of its ﬁnite-dimensional distributions.
Another problem in the batch formulation is that the joint distribution
p.XtT/ is not as simply deﬁned as in the ﬁnite-dimensional case. The joint
distribution is actually a measure in the same sense as the Wiener measure
that we discussed in Section 7.2. In principle, Equation (10.19) does indeed


## Page 212

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
204 Filtering and Smoothing Theory
deﬁne the measure provided that we let the time points be arbitrary, but this
deﬁnition is not computationally very helpful.
It is, however, possible to compute maximum a posteriori (MAP) esti-
mates of the whole state trajectory by using the Onsager–Machlup func-
tional (Ikeda and Watanabe, 1981; Dutra et al., 2014), which has the form
JŒD 1
2
Z T
0
"d
dt  f.;t/
T
W1
d
dt  f.;t/

Cr f.;t/
#
dt; (10.22)
where W D L Q LT is assumed to be invertible and independent of the
state and time. The functional can be extended to noninvertible and time-
dependent cases, but here we use the restricted version of a notational con-
venience.
The interpretation of this functional is that it is the limit of log-
probabilities of"-tubes around. That is, if we deﬁne
B"
D
(
sup
t2Œ0;T
kx.t/.t/k "
)
; (10.23)
then we have
lim
"#0
P.B"
/
P.B"
'/D exp.JŒ/p..0//
exp.JŒ'/p.'.0//; (10.24)
wherep.'.0// denotes the distributionp.x.0// evaluated at x.0/D'.0/.
It turns out (Dutra et al., 2014) that we can combine the measurement
model to the functional and compute the MAP path for a continuous-
discrete model as shown in Algorithm 10.4.
Algorithm 10.4 (Continuous-discrete MAP path estimate) . The
continuous-discrete MAP path can be computed by maximizing the


## Page 213

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.2 Batch Trajectory Estimates 205
functional
HŒDJŒC logp..0//C
KX
kD1
logp.ykj.tk//
D 1
2
Z T
0
"d
dt  f.;t/
T
W1
d
dt  f.;t/

Cr f.;t/
#
dt
C logp..0//C
KX
kD1
logp.ykj.tk//: (10.25)
The Onsager–Machlup functional is also closely related to negative en-
ergy functional, which is given as
JeŒD 1
2
Z T
0
"d
dt  f.;t/
T
W1
d
dt  f.;t/
#
dt:
(10.26)
The difference is thus the lack of the divergence term r f.;t/ . In clas-
sical state-estimation literature (Jazwinski, 1970), this seems to be a more
common formulation, although it corresponds to the MAP estimate of the
noise instead of the MAP estimate of the path (Dutra et al., 2014). The min-
imum energy path can indeed be solved by replacingJŒ in the preceding
algorithm withJeŒ.
The continuous-time measurement model version of the MAP path es-
timator has been discussed, for example, in Aihara and Bagchi (1999) and
Zeitouni (1989). Continuous-time minimum energy functionals and prob-
ability density functionals are discussed in Jazwinski (1970). However, it
appears that a continuous-time version of the MAP estimate takes the form
shown in Algorithm 10.5.


## Page 214

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
206 Filtering and Smoothing Theory
Algorithm 10.5 (Continuous-time MAP path estimate) . The continuous-
time MAP path can be computed by maximizing the following functional:
HŒDJŒ1
2
Z T
0
hT..t/;t/ R1 h..t/;t/ dt
C
Z T
0
hT..t/;t/ R1 dz
D 1
2
Z T
0
"d
dt  f.;t/
T
W1
d
dt  f.;t/

Cr f.;t/
#
dt
1
2
Z T
0
hT..t/;t/ R1 h..t/;t/ dtC
Z T
0
hT..t/;t/ R1 dz:
(10.27)
10.3 Kushner–Stratonovich and Zakai Equations
In this section, we present the classical continuous-time ﬁltering equations
that provide the formal (Bayesian) solution to the ﬁltering problem. Re-
call that in Section 5.3 we concluded that the Fokker–Planck–Kolmogorov
equation (5.11) can be compactly written as follows:
@p
@t D Ap; (10.28)
where A is the operator deﬁned in Equation (5.36).
The continuous-time optimal ﬁltering equation, which computes
p.x.t/ j Zt/, is called the Kushner–Stratonovich (KS) equation (Kush-
ner, 1964; Bucy, 1965) and can be derived as the continuous-time limits
of the so-called Bayesian ﬁltering equations (see, e.g., Särkkä, 2013). A
Stratonovich calculus version of the equation was studied by Stratonovich
already in the late 1950’s (cf. Stratonovich, 1968).
Algorithm 10.6 (Kushner–Stratonovich equation). The stochastic partial
differential equation for the ﬁltering densityp.x;t j Zt/ ,p.x.t/j Zt/
is
dp.x;t j Zt/D Ap.x;t j Zt/ dt
C.h.x;t/ EŒh.x;t/ j Zt/T R1
.dz EŒh.x;t/ j Zt dt/p. x;t j Zt/; (10.29)


## Page 215

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.3 Kushner–Stratonovich and Zakai Equations 207
where dp.x;t j Zt/Dp.x;tC dtj ZtCdt/p.x;t j Zt/ and
EŒh.x;t/ j ZtD
Z
h.x;t/p. x;t j Zt/ dx: (10.30)
This equation is only formal in the sense that as such it is quite impossi-
ble to work with. However, it is possible derive moment equations from it,
as well as form approximations to the solutions. What makes the equation
difﬁcult is that it is a stochastic partial differential equation – recall that
the operator A contains partial derivatives. Furthermore, the equation is
nonlinear, as could be seen by expanding the expectation integrals in the
equation (recall that they are integrals overp.x;t j Zt/). The stochasticity
is generated by the observation process z.t/.
The nonlinearity in the KS equation can be eliminated by deriving an
equation for an unnormalized ﬁltering distribution instead of the normal-
ized one. This leads to the so-called Zakai equation (Zakai, 1969).
Algorithm 10.7 (Zakai equation). Letq.x;t j Zt/ ,q.x.t/j Zt/ be the
solution to Zakai’s stochastic partial differential equation
dq.x;t j Zt/D Aq.x;t j Zt/ dtC hT.x;t/ R1 dzq.x;t j Zt/;
(10.31)
where dq.x;t j Zt/Dq.x;tC dtj ZtCdt/q.x;t j Zt/ and A is the
Fokker–Planck–Kolmogorov operator deﬁned in Equation(5.36). Then we
have the following:
p.x.t/j Zt/D q.x.t/j Zt/R
q.x.t/j Zt/ dx.t/: (10.32)
Closed-form solutions to the KS and Zakai equations can only be found
in isolated special cases. In Section 10.4, we consider the solution of the
linear ﬁltering problem, which is called the Kalman–Bucy ﬁlter. However,
there are some non-Gaussian closed-form solutions as well, and one of
them is given in the following example.
Example 10.8 (Beneš ﬁlter). The Beneš ﬁlter (Beneš, 1981) is the exact
solution to the Kushner–Stratonovich and Zakai equations for the following
model:
dxD tanh.x/ dtC dˇ; (10.33)
dzDx dtC d; (10.34)
where ˇ.t/ and .t/ are standard Brownian motions, x.0/ D 0, and


## Page 216

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
208 Filtering and Smoothing Theory
z.0/D 0. The equations for the sufﬁcient statistics .t/ andP.t/ of the
posterior distribution are
d.t/DP.t/ dzP.t/.t/ dt;
dP.t/
dt D1P2.t/;
(10.35)
with.0/D0 andP.0/D0. The posterior distribution is then of the form
p.x.t/j Zt// cosh.x.t// exp

.x.t/.t//2
2P.t/

: (10.36)
10.4 Linear and Extended Kalman–Bucy Filtering
The car model in Example 10.3 was actually a linear Gaussian ﬁltering
problem, which refers to a problem where the functions f and h are lin-
ear in x. In that case, the ﬁltering solution is Gaussian, and we can solve
the ﬁltering equations in closed form. The general ﬁltering solution to all
continuous-time linear Gaussian problems can be computed in closed form
as well, and it is given in the following.
The Kalman–Bucy ﬁlter(Kalman and Bucy, 1961) is the exact solution
to the continuous-time linear Gaussian ﬁltering problem
dxD F.t/ x dtC L.t/ dˇ;
dzD H.t/ x dtC d; (10.37)
where x.t/2 RD is the state process, z.t/2 RM is the (integrated) mea-
surement process; F.t/ is the dynamic model matrix; H.t/ is the measure-
ment model matrix; L.t/ is an arbitrary time-varying matrix, independent
of x.t/ and y.t/; andˇ.t/2 RS and.t/2 RM are independent Brown-
ian motions with diffusion matrices Q and R, respectively. The solution is
given as follows.
Algorithm 10.9 (Kalman–Bucy ﬁlter). The Bayesian ﬁlter, which com-
putes the posterior distribution p.x.t/j Zt/D N.x.t/j m.t/; P.t// for
the system (10.37), is as follows:
KD P H T.t/ R1;
dmD F.t/ m dtC KŒdz H.t/ m dt;
dP
dt D F.t/ PC P F T.t/C L.t/ Q LT.t/ K R KT:
(10.38)
An example of a linear Gaussian model and the corresponding Kalman–
Bucy ﬁlter is given in Example 10.10.


## Page 217

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.4 Linear and Extended Kalman–Bucy Filtering 209
Example 10.10 (Kalman–Bucy ﬁlter for the Ornstein–Uhlenbeck model).
Let us consider the following continuous-time state estimation problem:
dxDx dtC dˇ;
dzDx dtC d; (10.39)
where > 0, and ˇ.t/ and.t/ are independent Brownian motions with
diffusion coefﬁcientsq>0 andr >0, respectively. The model thus corre-
sponds to an Ornstein–Uhlenbeck process, whose measurements are cor-
rupted with Gaussian noise.
The Kalman–Bucy ﬁlter for computing the meanm.t/ and varianceP.t/
such thatp.x.t/j Zt/D N.x.t/jm.t/;P.t// is the following:
dmDm dtCP
r .dzm dt/;
dP
dt D2P CqP2
r :
(10.40)
The Kalman–Bucy ﬁlter also provides a useful basis for approximating
(intractable) solutions to nonlinear ﬁltering problems. There exists vari-
ous approximation methods to cope with nonlinear models, for example,
based on Monte Carlo approximations, series expansions of processes and
densities, Gaussian (process) approximations, and many others (see, e.g.,
Crisan and Rozovski ˇı, 2011). Still, the most common approach is to use
Gaussian approximations outlined in the beginning of Chapter 9 in order
to transform the nonlinear ﬁltering problem into an approximate Kalman–
Bucy ﬁltering problem. The classical ﬁltering theory is very much based on
this idea, and a typical approach is to use Taylor series expansions of the
drift function (Jazwinski, 1970). The use of Gaussian sigma-point types
of approximations in this context has been studied in Särkkä (2007) and
Särkkä and Sarmavuori (2013). In this section, we only outline Gaussian
approximation–based approximate ﬁltering; for other methods, the reader
is referred to Crisan and Rozovskiˇı (2011).
The extended Kalman–Bucy ﬁlter (see, e.g., Gelb, 1974) is perhaps the
most common and the simplest possible extension of the Kalman–Bucy
ﬁlter to nonlinear models of the form (10.7). It can be derived by using
ﬁrst-order Taylor series expansions on the functions f and h around the
current mean estimate.
Algorithm 10.11 (Extended Kalman–Bucy ﬁlter). The equations of the


## Page 218

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
210 Filtering and Smoothing Theory
extended Kalman–Bucy ﬁlter (EKBF) are as follows:
KD P H T
x.m;t/ R1;
dmD f.m;t/ dtC KŒdz h.m;t/ dt;
dP
dt D Fx.m;t/ PC P F T
x.m;t/
C L.m;t/ Q LT.m;t/ K R KT;
(10.41)
where Fx is the Jacobian matrix of f with elementsŒFxijD@fi=@xj , and
Hx is the Jacobian matrix of h with elementsŒHxijD@hi=@xj .
Example 10.12 describes an EKBF.
Example 10.12 (Extended Kalman–Bucy ﬁlter). The extended Kalman–
Bucy ﬁlter for the Beneš ﬁltering problem in Example 10.8 is the following:
dmD tanh.m/ dtCP. dzm dt/;
dP
dt D2.1 tanh2.m//P C1P2:
(10.42)
It is now easy to see that in Algorithm 10.11 we have actually em-
ployed the linearization approximation from Algorithm 9.4. Taking a step
backward lets us now use Algorithm 9.1 to formulate the following gen-
eral Gaussian approximation to the nonlinear ﬁltering problem (see, e.g.,
Särkkä and Sarmavuori, 2013).
Algorithm 10.13 (Continuous-time Gaussian assumed density ﬁlter). The
equations of the continuous-time Gaussian assumed density ﬁlter are as
follows:
KD ENŒ.x m/ hT.x.t/;t/ R1; (10.43)
dmD ENŒf.x;t/ dtC K.dz ENŒh.x;t/ dt/; (10.44)
dP
dt D ENŒ.x m/ f T.x;t/C ENŒf.x;t/. x m/T
C ENŒL.x;t/ Q LT.x;t/ K R KT; (10.45)
where the expectations are taken with respect to x.t/ N.m.t/; P.t//.
Various sigma-point approximations to the continuous-time ﬁltering
problem can now be generated by replacing the preceding Gaussian ex-
pectations with sigma-point approximations analogously to Algorithm 9.5.
The generic form resulting from approximating Equations (10.45) is de-
scribed in Algorithm 10.14.


## Page 219

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.5 Continuous-Discrete Bayesian Filtering Equations 211
Algorithm 10.14 (Continuous-time sigma-point ﬁlter). The equations of a
generic continuous-time sigma-point ﬁlter are as follows:
KD
X
i
W.i/p
Pi hT.mC
p
Pi;t/ R1; (10.46)
dmD
X
i
W.i/ f.mC
p
Pi;t/ dt
C K

dz
X
i
W.i/ h.mC
p
Pi;t/ dt

; (10.47)
dP
dt D
X
i
W.i/ f.mC
p
Pi;t/ T
i
p
P
T
C
X
i
W.i/p
Pi f T.mC
p
Pi;t/
C
X
i
W.i/ L.mC
p
Pi;t/ Q LT.mC
p
Pi;t/
 K R KT: (10.48)
For details on selection of sigma points i and weights W.i/, see Sec-
tion 9.1. For example, by selecting the unscented transform sigma points
and weights we get the unscented Kalman–Bucy ﬁlter (Särkkä, 2007).
10.5 Continuous-Discrete Bayesian Filtering Equations
In applications involving digital computers and computer controlled sen-
sors, we do not usually obtain measurements in continuous time, but we
are only able to get samples from the underlying process at discrete instants
of time. For these kinds of models, the continuous-discrete formulation of
the problem is more appropriate. A general continuous-discrete ﬁltering
problem was formulated in Deﬁnition 10.2.
The ﬁltering problem is now to determine the distributions
p.x.tk/j y1Wk/; (10.49)
which are thus the posterior distributions of the states at the measurements
timestk given the measurements obtained so far. A bit more generally, we
might be interested in determining the probability densities
p.x.t/j y1Wk/; t 2Œtk;tkC1/; (10.50)
which also give the distributions of the state between the last and the next


## Page 220

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
212 Filtering and Smoothing Theory
measurement. Although these distributions are often called predicted distri-
butions (e.g., Särkkä, 2013), as we already discussed earlier in this chapter,
we often call them ﬁltering distributions as well to keep the terminology
consistent with the continuous-time case.
A conceptually simple way of dealing with the continuous-discrete-time
ﬁltering problem is to solve the transition densities p.x.tkC1/ j x.tk//
from the Fokker–Planck–Kolmogorov forward partial differential equation
(see Section 5.4, Theorem 5.10). The ﬁltering problem then takes the form
x.tkC1/p.x.tkC1/j x.tk//;
ykp.ykj x.tk//; (10.51)
which is a canonical discrete-time ﬁltering problem (Särkkä, 2013) – pro-
vided that we introduce the notation xk , x.tk/.
The ﬁltering distributions at times t1;t2;::: can now be computed by
starting from a prior distribution p.x.t0// and by using the following
Bayesian ﬁlter recursions (see Särkkä, 2013).
Algorithm 10.15 (Bayesian ﬁlter). The Bayesian ﬁlter recursion starts
from the prior distribution p.x.t0//. Then for each k D 1;2;::: we do
the following:
 Prediction step: The predictive distribution of the state x.tk/ at the
timetk, given the dynamic model, can be computed by the Chapman–
Kolmogorov equation:
p.x.tk/j y1Wk1/DZ
p.x.tk/j x.tk1//p. x.tk1/j y1Wk1/ dx.tk1/: (10.52)
 Update step: Given the measurement yk at timetk, the posterior distri-
bution of the state x.tk/ can be computed by Bayes’ rule
p.x.tk/j y1Wk/D 1
Zk
p.ykj x.tk//p. x.tk/j y1Wk1/; (10.53)
where the normalization constantZk is given by the following:
ZkD
Z
p.ykj x.tk//p. x.tk/j y1Wk1/ dx.tk/: (10.54)
Note that given p.x.tk/ j y1Wk/, we can then reapply the Chapman–
Kolmogorov equation to get the predicted (or ﬁltering) distribution


## Page 221

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.5 Continuous-Discrete Bayesian Filtering Equations 213
p.x.t/j y1Wk/ fort >tk as follows:
p.x.t/ j y1Wk/D
Z
p.x.t/ j x.tk//p. x.tk/j y1Wk/ dx.tk/: (10.55)
It is also useful to notice that we can cope with the case of a missing mea-
surement just by skipping the update step.
The equations in Algorithm 10.15 are exactly the discrete-time Bayesian
ﬁltering equations, and thus all the methods in Särkkä (2013) are directly
applicable. However, to use these equations we need to compute or approx-
imate the transition density of the SDE. This can be done using the various
numerical methods introduced in Chapter 9.
Instead of ﬁrst forming the equivalent discrete-time system, it is also
possible to derive a Bayesian ﬁlter directly for the continuous-discrete ﬁl-
tering problem (10.12). The result is the following algorithm.
Algorithm 10.16 (Continuous-discrete Bayesian ﬁlter). The continuous-
discrete Bayesian ﬁlter recursion starts from the prior distribution
p.x.t0//. Then for eachkD1;2;::: we do the following:
 Prediction step: Solve the predicted probability density at time of the
measurement p.x.tk/ j y1Wk1/ by integrating the Fokker–Planck–
Kolmogorov equation (see Theorem 5.4) from the ﬁltering density at the
previous measurement time steptk1 to the current timetk:
@p.x;t/
@t D
X
i
@
@xi
Œfi.x;t/p. x;t/
C1
2
X
i;j
@2
@xi@xj
˚
ŒL.x;t/ Q LT.x;t/ ijp.x;t/

; (10.56)
where we have denotedp.x;t/ ,p.x.t/j y1Wk1/ and the initial con-
dition isp.x;tk1/ ,p.x.tk1/ j y1Wk1/.
 Update step: Use Bayes’ rule (10.53) for calculating the conditional
densityp.x.tk/ j y1Wk/, given the new measurement yk.
Again, if we are interested in solving p.x.t/ j y1Wk/ fort > tk given
p.x.tk/j y1Wk/, we can reapply the prediction step for integrating the solu-
tion fromtk up tot.
As in the continuous-time case, the Bayesian ﬁltering equations have
closed-form solutions only in isolated special cases. Before going to the


## Page 222

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
214 Filtering and Smoothing Theory
linear Gaussian special case, let us consider the following nonlinear ﬁlter-
ing problem, which is a continuous-discrete version of the Beneš ﬁlter in
Example 10.8.
Example 10.17 (Beneš–Daum ﬁlter). By Equation (7.62) in Example 7.10,
the transition density of the Beneš SDE
dxD tanh.x/ dtC dˇ (10.57)
is
p.x.tk/jx.tk1//D 1p2tk1
cosh.x.tk//
cosh.x.tk1// exp

1
2tk1

 exp

 1
2tk1
.x.tk/x.tk1//2

; (10.58)
wheretk1Dtktk1. This is also the solution to the associated FPK
equation. Assume that the measurements are obtained from the model
p.ykjx.tk//D N.ykjx.tk/; 2/: (10.59)
If we assume that the ﬁltering solution at timetk1 is of the form
p.x.tk1/jy1Wk1// cosh.x.tk1// exp

 1
2Pk1
.x.tk1/mk1/2

;
(10.60)
for some known mk1, Pk1, then the Chapman–Kolmogorov equation
gives
p.x.tk/jy1Wk1// cosh.x.tk// exp

 1
2P
k
.x.tk/m
k/2

; (10.61)
where
m
kDmk1;
P
k DPk1Ctk1: (10.62)
The Bayes’ rule gives
p.x.tk/jy1Wk// cosh.x.tk// exp

 1
2Pk
.x.tk/mk/2

; (10.63)
where the equations for the parameters (sufﬁcient statistics) can be written


## Page 223

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.5 Continuous-Discrete Bayesian Filtering Equations 215
0 1 2 3 4 5
/NUL4 /NUL2 0 2 4
Time, t
Signal, x.t /
BD mean
BD 95% quantiles
Signal
Observations
Figure 10.2 Illustration of the result of the Beneš–Daum ﬁlter in
Example 10.17. The evolution of the predicted distribution
between the observation is shown as well. The characteristic
discontinuous nature of a continuous discrete ﬁlter can be seen
here quite well – the uncertainty in predictions grows until the
next observation and conditioning of observation with Bayes’ rule
cause the ﬁltering distribution to jump.
as follows:
mkDm
kC
 P
k
P
k C2

Œykm
k;
PkDP
k  .P
k/2
P
k C2:
(10.64)
This result can be easily obtained by completing the squares in the ex-
ponent. These prediction and update equations of the Beneš–Daum ﬁlter
(Daum, 1984) are functionally exactly the same as the equations for a dis-
cretely observed Brownian motion, but now the probability density is given
by the Equation (10.63). Particularly, the conditional mean and variance
are given as
EŒx.tk/jy1WkDmkCPk tanh.mk/;
VarŒx.tk/jy1WkDPkC.1 tanh2.mk//P 2
k:
(10.65)
Figure 10.2 shows an example of the ﬁltering result. The predicted distri-
butions between the measurements have been obtained by replacingtk in
Equation (10.62) with a valuet? running over the rangeŒ0;tk.


## Page 224

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
216 Filtering and Smoothing Theory
10.6 Kalman Filtering
As in the continuous-time case the solution to the continuous-discrete lin-
ear Gaussian ﬁltering problem is solvable in closed form. A linear Gaussian
special case of the continuous-discrete state-space model in Deﬁnition 10.2
has the general form
dxD F.t/ x dtC L.t/ dˇ;
ykD Hk x.tk/C rk; (10.66)
where rk N.0; Rk/ andˇ is a Brownian motion with diffusion matrix
Q. This model is of the type that we already encountered in Example 10.3.
From Sections 6.1 and 6.2, we now deduce that the corresponding discrete-
time model has the form
x.tkC1/D Ak x.tk/C qk;
ykD Hk x.tk/C rk; (10.67)
where qk N.0;†k/ with Ak and†k given by Equations (6.9) and (6.11),
or in the linear time-invariant (LTI) case by Equations (6.24) and (6.25).
This model is thus a discrete-time version of the linear Gaussian model
analogously to Equation (10.51).
Assuming thatp.x.t0//D N.x.t0/j m0; P0/, the ﬁltering solution cor-
responding to Algorithm 10.15 is now given by the following Kalman ﬁlter
(Kalman, 1960; Särkkä, 2013).
Algorithm 10.18 (Kalman ﬁlter). The Kalman ﬁlter recursion is started
from the prior mean m0 and covariance P0. For k D 1;2;::: , we then
perform the following steps:
 Prediction step:
m
kD Ak1 mk1;
P
k D Ak1 Pk1 AT
k1C†k1:
(10.68)
 Update step:
vkD yk Hk m
k;
SkD Hk P
k HT
kC Rk;
KkD P
k HT
k S1
k ;
mkD m
kC Kk vk;
PkD P
k Kk Sk KT
k:
(10.69)


## Page 225

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.6 Kalman Filtering 217
The Kalman ﬁlter gives the following distributions:
p.x.tk/j y1;:::; yk1/D N.x.tk/j m
k; P
k/;
p.x.tk/j y1;:::; yk/D N.x.tk/j mk; Pk/;
p.ykj y1;:::; yk1/D N.ykj Hkm
k; Sk/:
(10.70)
If we wish to predict the state from time tk to some time t D tkC
t, then we just need to form the discretization matrices for the time step
tk ! tkCt and then perform the previous prediction step. Missing
measurements can be handled just by skipping the update step. The Kalman
ﬁlter equations are illustrated in a one-dimensional example presented as
Example 10.19.
Example 10.19 (Kalman ﬁlter for the Ornstein–Uhlenbeck model) . Re-
call from Example 6.2 that the equivalent discretization of the Ornstein–
Uhlenbeck model is
x.tkC1/Dakx.tk/Cqk;
ykDx.tk/Crk; (10.71)
withqk N.0;†k/,rk N.0;R/ ,akD exp.tk/, and†kD q
2Œ1
exp.2tk/. The Kalman ﬁlter for this model is then the following:
1. Start from the initial mean m0 and varianceP0.
2. For each kD 1;2;::: , compute the following using the measurement
sequencey1;y2;::: as the input:
m
kD exp.tk1/mk1;
P
k D exp.2tk1/Pk1C q
2Œ1 exp.2tk1/;
mkDm
kC
 P
k
P
k CR

.ykm
k/;
PkDP
k  ŒP
k2
P
k CR:
(10.72)
To obtain predicted distributions between the measurements, we can re-
place the measurement-time grid with a denser grid of times and perform
only prediction steps (the ﬁrst two equations) at the times where we have
no measurement. Figure 10.3 shows the result of this kind of Kalman ﬁlter
when run on simulated data.
It is also possible to form the Kalman ﬁlter corresponding to the
continuous-discrete Bayesian ﬁlter formulation in Algorithm 10.16. The
result is the following.


## Page 226

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
218 Filtering and Smoothing Theory
0 0:5 1 1:5 2 2:5 3
/NUL2 /NUL1 0 1 2
Time, t
Signal, x.t /
KF mean
KF 95% quantiles
Signal
Observations
Figure 10.3 Results of the Kalman ﬁlters in Examples 10.19 and
10.21.
Algorithm 10.20 (Continuous-discrete Kalman ﬁlter) . The continuous-
discrete Kalman ﬁlter recursion is started from the prior mean m0 and
covariance P0. ForkD1;2;::: we then perform the following steps:
 Prediction step: The differential equations
dm
dt D F.t/ m;
dP
dt D F.t/ PC P F T.t/C L.t/ Q.t/ LT.t/;
(10.73)
are integrated from the initial conditions m.tk1/D mk1, P.tk1/D
Pk1 to time instanttk. The predicted mean and covariance are given as
m
kD m.tk/ and P
k D P.tk/, respectively.
 Update step: The update step is the same as the discrete-time Kalman
ﬁlter update step given in Equations(10.69).
Example 10.21 (Continuous-discrete Kalman ﬁlter for the Ornstein–Uh-
lenbeck model). The continuous-discrete Kalman ﬁlter for the Ornstein–
Uhlenbeck model in Example 10.19 is now the same as before except that
m
k andP
k are computed by solving the differential equations
dm
dt Dm;
dP
dt D2P Cq;
(10.74)
from initial conditions m.tk1/D mk1,P.tk1/D Pk1 up to time tk.


## Page 227

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.7 Approximate Continuous-Discrete Filtering 219
This ﬁlter produces the same result as the ﬁlter in Example 10.19 (see Fig-
ure 10.3).
10.7 Approximate Continuous-Discrete Filtering
For nonlinear ﬁltering problems, there exists various approximations (see,
e.g., Jazwinski, 1970; Maybeck, 1982a; Särkkä, 2006, 2013). One ap-
proach to approximate nonlinear continuous-discrete ﬁltering is to approx-
imate the transition density using Itô–Taylor or stochastic Runge–Kutta
approximations or some of the other approximations discussed in the pre-
vious chapters (see Section 9.2 especially). For example, from the Euler–
Maruyama discretization in the model (10.12), we get the approximate
model
x.tkC1/D x.tk/C f.x.tk/;tk/tC L.x.tk/;tk/ˇk;
ykp.ykj x.tk//; (10.75)
which corresponds to a discrete-time model (10.51) with
p.x.tkC1/j x.tk//D N.x.tkC1/j x.tk/C f.x.tk/;tk/t;
L.x.tk/;tk/ Q LT.x.tk/;tk/t/: (10.76)
Weak Itô–Taylor series and Runge–Kutta approximations similarly corre-
spond to transition density approximations with either Gaussian or bino-
mial/trinomial noises. Once we have the transition density approximation,
then we can use standard discrete-time Bayesian ﬁlter approximations such
as extended Kalman ﬁlters, unscented Kalman ﬁlters, or particle ﬁlters re-
viewed in Särkkä (2013).
To illustrate what the algorithms look like, let us take a look at the ex-
tended Kalman ﬁlter (EKF) solution to the problem. It requires the mea-
surement model to have the speciﬁc form yk D h.xk/C rk (although
extensions are possible; see Särkkä, 2013). Assuming that the approximate
discrete-time model has the form
xkD ft
k1.xk1/C qk1;
ykD h.xk/C rk; (10.77)
where xk , x.tk/, qk1 N.0;†k1.xk1//, and rk N.0; Rk/, then
the EKF has the form indicated in Algorithm 10.22. The matrices Ft
x ./
and Hx./ denote the Jacobians of ft
k1./ and h./, respectively.
Algorithm 10.22 (EKF). The prediction and update steps of the EKF are
as follows:


## Page 228

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
220 Filtering and Smoothing Theory
 Prediction step:
m
kD ft
k1.mk1/;
P
k D Ft
x .mk1/ Pk1

Ft
x
T
.mk1/C†k1.mk1/:
(10.78)
 Update step:
vkD yk h.m
k/;
SkD Hx.m
k/ P
k HT
x.m
k/C Rk;
KkD P
k HT
x.m
k/ S1
k ;
mkD m
kC Kk vk;
PkD P
k Kk Sk KT
k:
(10.79)
A more general Gaussian assumed density ﬁlter or Gaussian ﬁlter has
the following form.
Algorithm 10.23 (Gaussian assumed density ﬁlter) . The prediction and
update steps of the assumed density Gaussian (Kalman) ﬁlter are as fol-
lows:
 Prediction step:
m
kD
Z
ft
k1.xk1/ N.xk1j mk1; Pk1/ dxk1;
P
k D
Z 
.ft
k1.xk1/ m
k/. ft
k1.xk1/ m
k/T
 N.xk1j mk1; Pk1/C†k1.xk1/

dxk1:
(10.80)
 Update step:
kD
Z
h.xk/ N.xkj m
k; P
k/ dxk;
SkD
Z
.h.xk/k/. h.xk/k/T N.xkj m
k; P
k/ dxkC Rk;
CkD
Z
.xk m
k/. h.xk/k/T N.xkj m
k; P
k/ dxk;
KkD Ck S1
k ;
mkD m
kC Kk.ykk/;
PkD P
k Kk Sk KT
k:
(10.81)


## Page 229

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.7 Approximate Continuous-Discrete Filtering 221
In implementation of the preceding ﬁlter, we can numerically compute the
Gaussian integrals by using sigma-point methods of the form given in
Equation (9.16). This leads to a large class of ﬁlters called sigma-point
ﬁlters (e.g., Särkkä, 2013).
The preceding algorithms correspond to the Bayesian ﬁlter formulation
in Algorithm 10.15. As the algorithm is just a discrete-time ﬁlter, we do
not give more examples of algorithms here, but the reader is referred to
Särkkä (2013) for various algorithms for the problem. Algorithm 10.23 also
corresponds to something called prior linearization, but it is also possible
to use linearization with respect to other distributions as well. For further
details, see García-Fernández et al. (2015), García-Fernández et al. (2017),
and Tronarp et al. (2018). The choice of linearization is also closely related
to Gauss–Newton interpretations of the iterated extended Kalman ﬁlters
and smoothers (Bell and Cathey, 1993; Bell, 1994).
It is further possible to formulate a continuous-discrete version of the
ﬁlter as in Algorithm 10.16, which is no longer equivalent to a discrete-
time ﬁltering problem.
Algorithm 10.24 (Continuous-discrete extended Kalman ﬁlter). The pre-
diction and update steps of the continuous-discrete extended Kalman ﬁlter
(CDEKF) are as follows:
 Prediction step: Integrate the following differential equations from initial
conditions m.tk1/D mk1, P.tk1/D Pk1 to time instanttk:
dm
dt D f.m;t/;
dP
dt D P F T
x.m;t/C Fx.m;t/ PC L.m;t/ Q LT.m;t/:
(10.82)
The predicted mean and covariance are then given as m
k D m.tk/,
P
k D P.tk/, respectively.
 Update step: The update step is the same as in Equation (10.79).
We can also replace the Taylor series expansion behind Algorithm 10.24
with a more general Gaussian assumed density approximation (cf. Särkkä,
2013; Särkkä and Sarmavuori, 2013), which results in the following algo-
rithm.
Algorithm 10.25 (Continuous-discrete Gaussian assumed density ﬁlter) .
The prediction and update steps of the continuous-discrete assumed density
Gaussian (Kalman) ﬁlter are as follows:


## Page 230

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
222 Filtering and Smoothing Theory
 Prediction step: Integrate the following differential equations from initial
conditions m.tk1/D mk1, P.tk1/D Pk1 to time instanttk:
dm
dt D
Z
f.x;t/ N.xj m; P/ dx; (10.83)
dP
dt D
Z
f.x;t/. x m/T N.xj m; P/ dx
C
Z
.x m/ f T.x;t/ N.xj m; P/ dx
C
Z
L.x;t/ Q LT.x;t/ N.xj m; P/ dx: (10.84)
The predicted mean and covariance are then given as m
k D m.tk/,
P
k D P.tk/, respectively.
 Update step: The update step is the same as in Equation (10.81).
If we use a sigma-point approximation to the mean and covariance differ-
ential equations, we end up to the sigma-point SDE approximation used in
Algorithm 9.5.
For additional approximate Bayesian ﬁlters, the reader is referred to
Jazwinski (1970), Gelb (1974), Maybeck (1982a), Särkkä (2006), Särkkä
(2007), Särkkä and Sottinen (2008), Särkkä and Sarmavuori (2013), Särkkä
(2013), and the references therein.
Example 10.26 (Continuous-discrete EKF solution to the Beneš–Daum
problem). The continuous-discrete extended Kalman ﬁlter to the Beneš–
Daum ﬁltering problem presented in Example 10.17 is the following.
 Prediction step:
dm
dt D tanh.m/;
dP
dt D2.1 tanh2.m//P C1:
(10.85)
 Update step:
mkDm
kC P
k
.2CP
k/.ykm
k/;
PkDP
k  .P
k/2
.2CP
k/:
(10.86)
An example of a ﬁltering result using this EKF is shown in Figure 10.4.


## Page 231

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.8 Smoothing in Continuous-Discrete and Continuous Time 223
0 1 2 3 4 5
/NUL4 /NUL2 0 2 4
Time, t
Signal, x.t /
BD mean
EKF mean
BD 95% quantiles
EKF 95% quantiles
Figure 10.4 Illustration of the EKF approximation to the
Beneš–Daum ﬁltering problem given in Example 10.26. In this
case, the EKF produces very accurate approximation to the exact
Beneš–Daum ﬁlter (marked as “BD”).
10.8 Smoothing in Continuous-Discrete and Continuous Time
The smoothing problem is concerned with computation of
p.x.t/j y1;:::; yT/; t 2Œt0;tT; (10.87)
or in the continuous case
p.x.t/j ZT/; t 2Œt0;T: (10.88)
That is, smoothing is concerned with computation of the posterior distri-
butions of the states within the range of all measurements. For example, in
the car tracking problem, this corresponds to determination of the position
and velocity of the car during some past points of time, but still by using
information from all the measurements. That is, the smoothing problem is
roughly equivalent to batch estimation of the state, although the algorithm
is formulated a bit differently to gain better computational scaling. How-
ever, from smoothing algorithms we can only get the posterior distribution
of single time instant x.t/ at a time, whereas a full batch solution would
correspond to a joint distribution of all times.
For mathematical simplicity, let us start with the continuous-discrete


## Page 232

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
224 Filtering and Smoothing Theory
problem. Analogously to Section 10.5 we can, in principle, solve the tran-
sition density of the SDE to form a discrete-time model:
x.tkC1/p.x.tkC1/j x.tk//;
ykp.ykj x.tk//: (10.89)
The smoothing solution for the time instantstk can now be computed with
the following discrete-time smoothing recursion (e.g., Särkkä, 2013).
Algorithm 10.27 (Bayesian smoother) . The backward recursive equa-
tions (the Bayesian smoother ) for computing the smoothed distributions
p.x.tk/j y1WT/ for anyk <T are given by the following Bayesian (ﬁxed-
interval) smoothing equations:
p.x.tkC1/j y1Wk/
D
Z
p.x.tkC1/j x.tk//p. x.tk/j y1Wk/ dx.tk/;
p.x.tk/j y1WT/
Dp.x.tk/j y1Wk/
Z p.x.tkC1/j x.tk//p. x.tkC1/j y1WT/
p.x.tkC1/j y1Wk/

dx.tkC1/;
(10.90)
wherep.x.tk/j y1Wk/ is the ﬁltering density of the distribution of the time
stepk. Note that the termp.x.tkC1/j y1Wk/ is simply the predicted distribu-
tion of time stepkC1 as in Algorithm 10.15. The recursion is started from
the ﬁnal step, where the ﬁltering and smoothing densities are the same:
p.x.tT/j y1WT/.
Algorithm 10.27 can be used to compute the smoothing solution at any
given time t by including an extra measurement-free time instant to the
ﬁlter (e.g., Särkkä, 2006).
The Rauch–Tung–Striebel (RTS) smoother is the closed-form solution
to the linear Gaussian smoothing problem. Assuming that we have formed
an equivalent discrete-time model of the form (10.67), then we can use
the following RTS smoother to compute the means and covariances of the
smoothing distributions.
Algorithm 10.28 (RTS smoother). The backward recursion equations for


## Page 233

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.8 Smoothing in Continuous-Discrete and Continuous Time 225
the RTS smoother are given as
m
kC1D Ak mk;
P
kC1D Ak Pk AT
kC†k;
GkD Pk AT
kŒP
kC11;
ms
kD mkC GkŒms
kC1 m
kC1;
P s
kD PkC GkŒP s
kC1 P
kC1 GT
k;
(10.91)
where mk and Pk are the mean and covariance computed by the Kalman
ﬁlter. The recursion is started from the last time stepT , with ms
TD mT and
P s
T D PT . Note that the ﬁrst two of the equations are simply the Kalman
ﬁlter prediction equations.
The algorithm computes
p.x.tk/j y1WT/D N.x.tk/j ms
k; P s
k/ (10.92)
for allkD1;2;:::;T .
Example 10.29 (RTS smoother for the Ornstein–Uhlenbeck model) . The
RTS smoother for the Ornstein–Uhlenbeck model in Example 10.19 is the
following:
1. Start from the ﬁlter meanms
TDmT and varianceP s
TDPT .
2. For each kDT1;T 2;::: , compute the following using the means
mk and variancesPk computed by the Kalman ﬁlter in Example 10.19:
m
kC1D exp.tk/mk;
P
kC1D exp.2tk/PkC q
2Œ1 exp.2tk/;
ms
kDmkC

Pk exp.tk/
P
kC1
!
Œms
kC1m
kC1;
P s
kDPkC

Pk exp.tk/
P
kC1
!2
ŒP s
kC1P
kC1:
(10.93)
The result of this smoother when run on the same data as in Example 10.19
is shown in Figure 10.5. For visualization, we have run the smoother in a
denser grid than the measurements to obtain intermediate smoothing re-
sults between the measurements.
It is also possible to formulate the smoothing solution directly in contin-
uous time. The following smoothing solution by Leondes et al. (1970) is a
backward partial differential equation that can be seen as a continuous time


## Page 234

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
226 Filtering and Smoothing Theory
0 0:5 1 1:5 2 2:5 3
/NUL1 0 1
Time, t
Signal, x.t /
RTS mean
RTS 95% quantiles
Signal
Observations
Figure 10.5 Result of the Rauch–Tung–Striebel smoother in
Example 10.29.
version of Equation (10.90). It turns out the same equation works for both
continuous-discrete and continuous-time problems. All we need to do is to
use the correct ﬁltering/predicted density in the equations – the smoother
itself does not depend on the measurement model at all.
Algorithm 10.30 (Continuous-discrete/continuous Bayesian smoother) .
Let us denote the ﬁltering density as
q.x;t/ ,p.x.t/j y1Wk/; (in the continuous-discrete case);
q.x;t/ ,p.x.t/j Zt/; (in the continuous-time case);
(10.94)
wherek is the largest integer such thattkt. Also denote the smoothing
density as
s.x;t/ ,p.x.t/j y1WT/; (in the continuous-discrete case);
s.x;t/ ,p.x.t/j ZT/; (in the continuous-time case):
(10.95)
The smoothing solution is then given by solution to the following backward


## Page 235

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.8 Smoothing in Continuous-Discrete and Continuous Time 227
partial differential equation
@s.x;t/
@t Ds.x;t/
X
j
@fj.x;t/
@xj

X
j
fj.x;t/ @s.x;t/
@xj
C1
2s.x;t/
X
j;k
@2
L.x;t/ Q LT.x;t/

jk
@xj@xk
1
2
X
j;k

L.x;t/ Q LT.x;t/

jk
@2s.x;t/
@xj@xk
C 1
q.x;t/
X
j;k

L.x;t/ Q LT.x;t/

jk
@s.x;t/
@xj
@q.x;t/
@xk
 s.x;t/
q2.x;t/
X
j;k

L.x;t/ Q LT.x;t/

jk
@q.x;t/
@xj
@q.x;t/
@xk
C s.x;t/
q.x;t/
X
j;k
@

L.x;t/ Q LT.x;t/

jk
@xj
@q.x;t/
@xk
C s.x;t/
q.x;t/
X
j;k

L.x;t/ Q LT.x;t/

jk
@2q.x;t/
@xj@xk
(10.96)
with the terminal conditionq.x;tT/Ds.x;tT/ at the ﬁnal step.
Remark 10.31. As pointed out by Anderson (1972), the smoothing equa-
tions in Algorithm 10.30 can also be written in simpler form as
@s.x;t/
@t D AŒq.x;t/ s.x;t/
q.x;t/ q.x;t/ A
s.x;t/
q.x;t/

: (10.97)
The RTS smoother for the linear Gaussian models corresponding to the
preceding formulation is as follows.
Algorithm 10.32 (Continuous-discrete/continuous RTS smoother) . The
differential backward equations of the smoothing solution (characterized
by the mean ms and covariance P s) for linear Gaussian models are
dms
dt D F.t/ msC L.t/ Q.t/ LT.t/ P1 Œms m;
dP s
dt D

F.t/C L.t/ Q.t/ L.t/ P1
P s
C P s 
F.t/C L.t/ Q.t/ LT.t/ P1T
 L.t/ Q.t/ LT.t/:
(10.98)


## Page 236

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
228 Filtering and Smoothing Theory
The means m.t/ and covariances P.t/ can be from either the Kalman–
Bucy ﬁlter in Algorithm 10.9 or one of the continuous-discrete Kalman
ﬁlters in Algorithms 10.18 and 10.20. In the latter case, the means and
covariances between the measurements should be their predicted values.
Example 10.33 (Continuous-discrete/continuous RTS smoother for the
Ornstein–Uhlenbeck model). The continuous-time version of the smoother
in Example 10.29 is deﬁned via the differential equations
dms
dt Dm sC
q
P

.msm/;
dP s
dt D2

C q
P

P sq:
(10.99)
The result produced by this smoother is the same as of the RTS smoother
in Example 10.29 and Figure 10.5.
10.9 Approximate Smoothing Algorithms
We can form approximate smoothing algorithms corresponding to both the
discretized and continuous smoothers in Algorithms 10.27 and 10.30. Pro-
vided that we have discretized the model into form (10.77), then we can
directly apply off-the-shelf nonlinear smoothers (e.g., Särkkä, 2013). For
example, the extended RTS smoother looks like the following.
Algorithm 10.34 (Discrete-time extended RTS smoother). The equations
for the discrete-time extended RTS (ERTS) smoother are
m
kC1D ft
k .mk/;
P
kC1D Ft
x .mk/ Pk

Ft
x
T
.mk/C†k.mk/;
GkD Pk F T
x.mk/Œ P
kC11;
ms
kD mkC GkŒms
kC1 m
kC1;
P s
kD PkC GkŒP s
kC1 P
kC1 GT
k;
(10.100)
where the matrix Fx.mk/ is the Jacobian matrix of f.x/ evaluated at mk.
The preceding procedure is a recursion that can be used for computing
the smoothing distribution of time step k from the smoothing distribution
of time step kC1. Because the smoothing distribution and ﬁltering dis-
tribution of the last time step T are the same, we have ms
T D mT and
P s
T D PT , and thus the recursion can be used for computing the smooth-
ing distributions of all time steps by starting from the last stepkDT and
proceeding backward to the initial stepkD0.


## Page 237

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.9 Approximate Smoothing Algorithms 229
Various other discrete-time smoother approximations based on, for ex-
ample, sigma-point approximations and Monte Carlo can be found in the
book of Särkkä (2013). Some iterated sigma-point smoothers have also
been introduced by García-Fernández et al. (2017) and Tronarp et al.
(2018), which in turn are based on the Gauss–Newton method interpre-
tation of extended Kalman smoothers discussed in Bell (1994).
A review of Gaussian approximation–based nonlinear smoothers corre-
sponding to the smoother formulation in Algorithm 10.30 can be found in
the article of Särkkä and Sarmavuori (2013). In the following, we brieﬂy
express the ideas of the Type I, II, and III smoothers introduced in Särkkä
and Sarmavuori (2013) and give Taylor series–based implementation ex-
amples of them. In the following, for notational convenience, we assume
that L.t/ does not depend on the state.
A “Type I” smoother refers to a smoother that is derived as a Gaussian
approximation to the smoothing equations of Leondes et al. (1970) given
in Algorithm 10.30. The ﬁrst-order Taylor series–based smoother of this
type is the following.
Algorithm 10.35 (Type I extended RTS smoother). The smoother consists
of the following equations which are integrated backward starting from the
ﬁltering solutionms.tT/D m.tT/, P s.tT/D P.tT/ at the end point:
dms
dt D f.ms;t/C L.t/ Q LT.t/ P1Œms m;
dP s
dt D Fx.ms;t/ P sC P s F T
x.ms;t/ L.t/ Q LT.t/
C L.t/ Q LT.t/ P1 P sC P s P1 L.t/ Q LT.t/:
(10.101)
A “Type II” smoother refers to a smoother that can be derived by taking
the formal limit of the corresponding discrete-time smoother (cf. Särkkä,
2013). A characteristic of these kinds of smoothers is that they are linear in
the smoothing solution. The ﬁrst-order Taylor series–based approximation
of it is the following.
Algorithm 10.36 (Type II extended RTS smoother). In the smoother, we


## Page 238

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
230 Filtering and Smoothing Theory
integrate the following equations backward starting from the ﬁltering solu-
tion ms.tT/D m.tT/, P s.tT/D P.tT/ at the end point:
dms
dt D f.m;t/
C

Fx.m;t/C L.t/ Q LT.t/ P1
Œms m;
dP s
dt D Fx.m;t/ P sC P s F T
x.m;t/ L.t/ Q LT.t/
C L.t/ Q LT.t/ P1 P sC P s P1 L.t/ Q LT.t/:
(10.102)
“Type III” refers to a smoother that is mathematically equivalent to the
Type II smoother, but the backward differential equation is rewritten as
two forward differential equations and a discrete-time backward recursion.
This formulation is advantageous from a numerical point of view. The al-
gorithm resulting from a ﬁrst-order Taylor series expansion is given in Al-
gorithm 10.37.
Algorithm 10.37 (Type III extended RTS smoother). The smoother con-
sists of three forward differential equations along with a discrete-time
backward recursion:
dm
dt D f.m;t/;
dP
dt D Fx.m;t/ PC P F T
x.m;t/C L.t/ Q LT.t/;
dCk.t/
dt D Ck.t/ F T
x.m;t/;
GkC1D Ck.t
kC1/ P1.t
kC1/;
ms.tk/D m.tk/C GkC1Œms.tkC1/ m.t
kC1/;
P s.tk/D P.tk/C GkC1ŒP s.tkC1/ P.t
kC1/ GT
kC1:
(10.103)
The smoother is started from the ﬁltering solution ms.tT/ D m.tT/,
P s.tT/D P.tT/. We also need to put Ck.tk/D P.tk/ always before solv-
ing the differential equation of Ck.t/ fort2Œtk;tkC1.
The following example shows a Type II smoother.
Example 10.38 (Extended RTS solution to Beneš and Beneš–Daum ﬁlter-
ing problems). The equations of the Type II extended RTS smoother that
can be used both for the Beneš ﬁltering problem in Example 10.8 as well


## Page 239

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
10.10 Exercises 231
0 1 2 3 4 5
/NUL4 /NUL2 0
Time, t
Signal, x.t /
ERTS mean
ERTS 95% quantiles
Signal
Observations
Figure 10.6 Illustration of the result of the ERTS solution to the
Beneš–Daum (smoothing) problem in Example 10.38. The
estimate and the uncertainty estimates are now conditioned on all
the data, which makes the discontinuities seen in Figures 10.2 and
10.4 disappear.
as for the Beneš–Daum ﬁltering problem in the Example 10.17 are
dms
dt D tanh.m/C
.1 tanh2.m//P C1
P

.msm/;
dP s
dt D2
.1 tanh2.m//P C1
P

P s1;
(10.104)
where m.t/ and P.t/ are the mean and covariance from the extended
Kalman ﬁlter. Figure 10.6 shows the result of this smoother.
10.10 Exercises
10.1 Consider the Beneš ﬁltering problem in Example 10.8:
(a) Compute the normalized posterior distribution by evaluating the nor-
malization constant in Equation (10.36).
(b) Show that the normalized posterior distribution solves the Kushner–
Stratonovich equation.
(c) Form the corresponding unnormalized distributionq.x;t/ and show that
it solves the Zakai equation.
10.2 Consider the Kushner–Stratonovich equation for the Ornstein–Uhlenbeck
model:


## Page 240

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
232 Filtering and Smoothing Theory
(a) Write down the Kushner–Stratonovich equation for the model
dxDx dtC dˇ;
dzDx dtC d;
whereˇ and are independent standard Brownian motions with diffu-
sion coefﬁcientsq andr.
(b) Show that the Kalman–Bucy ﬁlter to the Ornstein–Uhlenbeck model in
Example 10.10 solves the Kushner–Stratonovich equation.
10.3 Write down the equations of the Kalman–Bucy ﬁlter for the car tracking
model in Example 10.3.
10.4 Continuous-time approximate nonlinear ﬁltering: Consider the model
dxD tanh.x/ dtC dˇ;
dzD sin.x/ dtC d;
whereˇ and are independent Brownian motions with diffusion coefﬁcients
qD1 andrD0:01, respectively.
(a) Write down the extended Kalman–Bucy ﬁlter for this model.
(b) Simulate data from the model over a time spanŒ0;5 withtD 1=100 ,
and implement the ﬁltering method numerically. How does it work, and
how could you improve the ﬁlter?
10.5 Show that the Kalman ﬁlters in Examples 10.19 and 10.21 are equivalent.
10.6 Find the Kalman ﬁlter for the car tracking model in the resources of the book
Särkkä (2013). Implement the continuous-discrete Kalman ﬁlter for the same
problem and check that the results match.
10.7 Recall the smartphone tracking Example 3.5, where the three-dimensional
orientation of the device was modeled with the help of observations of ac-
celeration and angular velocity in the local coordinate frame of the device.
Consider that you have (noisy) observations provided by a gyroscope and
accelerometer at 100 Hz (you can assumet to be constant).
(a) Write the corresponding state-space model for the smartphone tracking
problem. How would you formulate the model in terms of the two data
sources. Also recall that the SDE model was solved in Exercise 6.2.
(b) Formulate the ﬁltering problem that provides a solution to the tracking
problem.
(c) Implement the ﬁlter numerically and check your solution by simulating
data (you can assume the device to rotate with a constant speed around
one axis in your simulation).
10.8 Consider the Black–Scholes model from Example 3.8:
(a) Formulate the corresponding state-space model, where the state is ob-
served through a log-normal measurement model.
(b) Formulate the ﬁltering solution to the state-space model.


## Page 241

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 233
(c) Derive the corresponding smoother.
10.9 Show that the Rauch–Tung–Striebel smoothers in Examples 10.29 and 10.33
are equivalent.
10.10 Show that the smoother for the Ornstein–Uhlenbeck model given in Exam-
ple 10.33 solves the Leondes equation (Algorithm 10.30).
10.11 Write down the Type I and Type III smoothers for Example 10.38.


## Page 242

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11
Parameter Estimation in SDE Models
An issue that often arises in the context of practical modeling with SDEs
is the problem of parameter estimation. In that context, we might know the
parametric form of the SDE, but the parameters of the SDE have unknown
values. However, we might have a set of experimental data that we wish to
use for determining the values of the parameters. The aim of this chapter is
to give an overview of solutions to these kinds of problems. We speciﬁcally
consider statistical likelihood-based inference methods, but we also give
pointers to other types of methods.
The problem of parameter estimation in SDE models has a long his-
tory, and overviews of parameter estimation methods in different types of
models can be found, for example, in the articles of Nielsen et al. (2000),
Sørensen (2004), and Särkkä et al. (2015b) and in the theses of Jeisman
(2005) and Mbalawata (2014) as well as in the books of Rao (1999) and Ia-
cus (2008). In the case of partially observed systems, the problem is closely
related to parameter estimation in (discrete-time) state-space models (or
hidden Markov models), and parameter estimation methods for these kinds
of models have been summarized in the books of Särkkä (2013) and Cappé
et al. (2005).
11.1 Overview of Parameter Estimation Methods
In the typical setting that we consider here, we have an SDE with a vector
of (unknown) parametersD

1;2;:::; d

:
dxD f.x;tI/ dtC L.x;tI/ dˇ; x.t0/D x0: (11.1)
The diffusion matrix of the Brownian motion Q./ might also depend on
the parameters. Additionally, we have a set of observations of the SDE. For
example, we might have a set of known values of the statex.t/ at a certain
234


## Page 243

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.1 Overview of Parameter Estimation Methods 235
ﬁnite number of time points. Alternatively, we might only have partial ob-
servations of the state, and these observations might also be corrupted by
noise.
Example 11.1 (Parameters in the Ornstein–Uhlenbeck model). Consider,
for example, the Ornstein–Uhlenbeck process
dxDx dtC dˇ; x.0/ Dx0: (11.2)
For the sake of parameter estimation, we can assume that the parameters
 andq are unknown, that is, we have the unknown parameter vectorD
.;q/ . Furthermore, we could assume that we know the values of the SDE
at timesx.t/;x.2t/;:::;x.T t/ which forms the data that are used
for estimating the parameters.
In the case that we observe a ﬁnite number of values of the SDE, say,
x.t1/; x.t2/;:::; x.tT/, a classical method for SDE parameter estimation
is the maximum likelihood (ML) method. Due to the Markov properties of
SDEs (cf. Section 5.4), we can write down the likelihood of the observed
values given the parameters as follows:
p.x.t1/;:::; x.tT/j/D
T1Y
kD0
p.x.tkC1/j x.tk/;/; (11.3)
wherep.x.tkC1/j x.tk/;/ are the transition densities of the SDE that we
discussed in Section 5.4. In the ML method, we wish to maximize the pre-
ceding likelihood expression or, equivalently, minimize the negative log-
likelihood:
`./D logp.x.t1/;:::; x.tT/j/
D
TX
kD0
logp.x.tkC1/j x.tk/;/: (11.4)
Alternately, given the likelihood we can use Bayesian methods that directly
perform inference on the posterior distribution,
p.j x.t1/;:::; x.tT//D p.x.t1/;:::; x.tT/j/p./
p.x.t1/;:::; x.tT//
/p./
T1Y
kD0
p.x.tkC1/j x.tk/;/; (11.5)


## Page 244

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
236 Parameter Estimation in SDE Models
wherep./ is the prior distribution and/ denotes a constant proportion-
ality. Typical Bayesian methods include maximum a posteriori (MAP) es-
timation, Laplace approximations, Markov chain Monte Carlo, and other
Monte Carlo methods.
In order to use ML methods or Bayesian methods, we need to be able
to evaluate the likelihood, which in general is hard. This is because the
likelihood depends on the transition densities, which are solutions to the
Fokker–Planck–Kolmogorov (FPK) equation (see Section 5.4) and are thus
hard to compute. If we know the transition densities, then we can explicitly
evaluate the likelihood, which is indeed the case for linear SDEs. Parameter
estimation in these kinds of models is considered in Section 11.3.
In the case of general multivariate nonlinear SDEs, we cannot solve the
FPK and thus the transition density is unknown. In that case, the typical
approach is to replace the SDE or its transition density in the likelihood
with a tractable approximation. We can, for example, use the various SDE
discretization methods that we have already covered (Itô–Taylor, stochastic
Runge–Kutta, linearization) for forming a discrete-time SDE approxima-
tion whose transition density we can evaluate. Another way is to directly
approximate the transition density of the SDE using Gaussian approxima-
tions, Hermite expansions, or other approximations that we saw in the pre-
vious chapters.
In this chapter, we also discuss partially and noisily observed SDE mod-
els. In those models, we do not observe the values x.t1/; x.t2/;:::; x.tT/
directly, but instead we only observe noisy versions of them, such as ykD
H x.tk/Crk, where H is some (possibly singular) matrix andrk N.0; R/
is a Gaussian noise. More generally, as in the previous chapter, the obser-
vations might come from a conditional distributionp.ykj x.tk//. In these
models, we cannot use the previous likelihood expressions, but instead we
need to compute the marginal likelihood of the measurements given the pa-
rametersp.y1; y2;:::; yTj/ or the corresponding posterior distributions
p.j y1; y2;:::; yT/ at least up to an unknown constant factor. In order
to do parameter estimation in these models, we need to use the ﬁltering
and smoothing methods from the previous chapter as parts of the parame-
ter estimation methods for evaluating the marginal likelihood or posterior
distribution.
11.2 Computational Methods for Parameter Estimation
As discussed in the previous section, provided that we can evaluate the
likelihoodp.x.t1/; x.t2/;:::; x.tT/j/ or its negative logarithm`./D


## Page 245

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.2 Computational Methods for Parameter Estimation 237
 logp.x.t1/; x.t2/;:::; x.tT/j/, we have a wide range of off-the-shelf
computational methods that we can use for estimating the parameters .
The aim of this section is to discuss a couple of them, optimization-based
methods and Markov chain Monte Carlo (MCMC) methods. For more de-
tails and more advanced computational methods, the reader is referred to
the books of Luenberger and Ye (2008), Liu (2001), Brooks et al. (2011),
and Gelman et al. (2013), along with Särkkä (2013).
The simplest approach to estimate parameters is to maximize the like-
lihood of the measured values with respect to the parameter values. This
can be seen as a method that ﬁnds the parameters that best ﬁt the data. The
method can be written in algorithmic form as follows.
Algorithm 11.2 (ML estimate). The maximum likelihood estimate of SDE
parameters can be obtained by ﬁnding the vector of parameters ML that
minimizes the negative log-likelihood`./ deﬁned in Equation(11.4):
MLD arg min

`./: (11.6)
In practice, the minimum can be computed either analytically by setting
derivatives to zero or by using numerical optimization methods (see, e.g.,
Luenberger and Ye, 2008).
In the Bayesian setting, we might also have a prior distribution p./,
which restricts or weights the possible parameter values. Then we can de-
ﬁne the unnormalized negative log-posterior by using the following:
`p./D`./ logp./: (11.7)
With this prior information, the ML estimate is generalized to the maxi-
mum a posteriori estimate shown in Algorithm 11.3.
Algorithm 11.3 (MAP estimate) . The MAP estimate MAP of the SDE
parameters can be found by minimizing the unnormalized negative log-
posterior deﬁned in Equation(11.7):
MAPD arg min

`p./: (11.8)
A completely different class of algorithms for likelihood-based infer-
ence are MCMC methods. These kinds of methods are particularly com-
monly used in Bayesian analysis (Gelman et al., 2013; Särkkä, 2013), but
MCMC methods have a multitude of other applications as well (Liu, 2001;
Brooks et al., 2011).
The aim of MCMC in the SDE context is to generate samples from the
posterior distribution (11.5). That is, instead of summarizing the posterior


## Page 246

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
238 Parameter Estimation in SDE Models
distribution via its single maximum (the MAP estimate), we generate a
set of samples from the distribution. These samples can then be used for
computing the best parameter estimates (e.g., the posterior mean) as well
as uncertainty in the parameter estimates (e.g., the posterior covariance).
The most common MCMC method is the Metropolis–Hastings algo-
rithm in Algorithm 11.4. In order to implement it, we only need to be able
to evaluate the unnormalized negative log-posterior (11.7).
Algorithm 11.4 (Metropolis–Hastings). The Metropolis–Hastings (MH)
algorithm for generating samples from a distributionp.// exp.`p.//
is the following.
1. Draw the starting point, .0/ from an arbitrary initial distribution.
2. For each iteration iD1;2;:::;N , do the following steps:
a. Sample a candidate point  from the proposal distribution:
q.j.i1//: (11.9)
b. Evaluate the acceptance probability:
˛iD min

1; exp.`p..i1//`p.//q..i1/j/
q.j.i1//

: (11.10)
c. Generate a uniform random variable u U.0;1/ and set the follow-
ing:
.i/D
(
; ifu˛i;
.i1/; otherwise: (11.11)
The Metropolis algorithm is a commonly used special case of MH,
where the proposal distribution is symmetric, q..i1/j .i//D q..i/j
.i1//. In this case, the acceptance probability reduces to the following:
˛iD min
n
1; exp.`p..i1//`p.//
o
: (11.12)
The MH algorithm basically has a single design parameter, the proposal
distributionq.j /. However, this distribution almost completely de-
ﬁnes the algorithm operation, and by selecting it in speciﬁc ways we get
different brands of MCMC methods. For details, the reader is referred to
Brooks et al. (2011).


## Page 247

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.3 Parameter Estimation in Linear SDE Models 239
11.3 Parameter Estimation in Linear SDE Models
In this section, the aim is to consider ML and Bayesian inference in linear
SDEs. What makes linear SDEs special is that their transition densities are
Gaussian and hence can be efﬁciently evaluated. In certain simple cases,
we can also compute the ML estimates (or MAP estimates) of the param-
eters in closed form. However, more generally we need to resort to the
computational methods outlined in the previous section.
Let us start by a considering the Ornstein–Uhlenbeck process which we
already saw in Example 11.1:
dxDx dtC dˇ; x.0/ Dx0; (11.13)
where is unknown andˇ has an unknown diffusion constantq. The vector
of unknown parameters is thus D .;q/ , and we assume that we have
observed the SDE trajectory atx.t/;x.2t/;:::;x.T t/ .
The transition density of the SDE is now given as (recall Example 6.2)
p.x.tCt/jx.t//
D N

x.tCt/j exp.t/x.t/; q
2 Œ1 exp.2t/

: (11.14)
Thus the negative log-likelihood can be written as
`.;q/ D
T1X
kD0
1
2 log

2 q
2 Œ1 exp.2t/

C 
qŒ1 exp.2t/ .x.tkC1/ exp.t/x.t k//2

: (11.15)
However, for practical computation of the ML estimate it is more conve-
nient to reparametrize the negative log-likelihood in terms of
aD exp.t/;
†D q
2 Œ1 exp.2t/; (11.16)
which thus gives
`.a;†/D
T1X
kD0
1
2 log.2†/C 1
2†.x.tkC1/ax.tk//2

: (11.17)


## Page 248

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
240 Parameter Estimation in SDE Models
Setting derivatives with respect toa and† to zero then gives
aMLD
PT1
kD0x.tk/x.tkC1/
PT1
kD0x.tk/x.tk/
;
†MLD 1
T
T1X
kD0
.x.tkC1/aMLx.tk//2;
(11.18)
which in terms of original  and q gives the ﬁnal ML estimates of the
parameters:
MLD 1
t log
"PT1
kD0x.tk/x.tkC1/
PT1
kD0x.tk/x.tk/
#
;
qMLD 1
T
 2 ML
1 exp.2 MLt/
 T1X
kD0
.x.tkC1/ exp.MLt/x.t k//2:
(11.19)
We can also, in principle, do the similar inference for a more general LTI
SDE
dxD F./ x dtC L./ dˇ; x.0/D x0; (11.20)
where the vector of Brownian motions ˇ has the diffusion matrix Q./.
With sampling at x.t/; x.2t/;:::; x.T t/, we get the negative log-
likelihood
`.A;†/D
T1X
kD0
1
2 logj2†j
C1
2.x.tkC1/ A x.tk//T†1.x.tkC1/ A x.tk//

; (11.21)
which we have already written in terms of
AD exp.F./t/;
†D
Z t
0
exp.F./.t// L./ Q./ LT./ exp.F./.t// T d:
(11.22)


## Page 249

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.3 Parameter Estimation in Linear SDE Models 241
When we set the derivatives with respect to A and† to zero, we get
†MLD 1
T
T1X
kD0
.x.tkC1/ A x.tk//. x.tkC1/ A x.tk//T;
AMLD
T1X
kD0
x.tkC1/ xT.tk/
 T1X
kD0
x.tk/ xT.tk/
1
;
(11.23)
after which we still need to solve from Equation (11.23). Unfortunately,
this solution is rarely possible and seldom even exists when the parameters
theta appear nontrivially in A and Q.
In the preceding derivation for general A and Q, we have failed to take
into account that  might have signiﬁcantly lower dimensionality than
A and Q – thus it does not lead to the correct ML estimate unless we
can uniquely solve the parameters given A and Q. Furthermore, we often
do not have a constant sampling period t, and the SDE might be time-
varying – and we might also have an unknown offset function in the SDE.
For general linear SDEs of the general form
dxD F.tI/ x dtC u.tI/ dtC L.tI/ dˇ; (11.24)
it is advisable to directly consider the negative log-likelihood, which is
more generally given as
`./D
T1X
kD0
1
2 logj2†k./j
C1
2.x.tkC1/ Ak./ x.tk/ uk.//T†1
k ./
.x.tkC1/ Ak./ x.tk/ uk.//

; (11.25)
where Ak./, uk./, and†k./ are given by Equations (6.9), (6.10), and
(6.11), respectively. We can now numerically ﬁnd the minimum of the neg-
ative log-likelihood by using numerical optimization methods (e.g., Luen-
berger and Ye, 2008). In order to do that, we also need to compute the
derivatives with respect to the parameters, where the difﬁculty arises from
deriving the partial derivatives@Ak./=@i,@uk./=@i, and@†k./=@i.
However, this can be done by using the matrix fraction decomposition (see,
e.g., Mbalawata et al., 2013).
The negative log-likelihood expression in Equation (11.25) also allows
for the use of Bayesian methods for parameter estimation. This is because


## Page 250

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
242 Parameter Estimation in SDE Models
0 1 2 3 4 5 6 7 8 9 10
/NUL2 /NUL1 0 1
Time, t
x.t /
(a) Sample path used for posterior computation
0 0:5 1 1:5 2 2:5
0 0:5 1 1:5 2 2:5
/NAK
q
(b) Posterior distribution
0 0:5 1 1:5 2 2:5
0 0:5 1 1:5 2 2:5
/NAK
q (c) MCMC samples from posterior
Figure 11.1 Illustration of the posterior computation for the
Ornstein–Uhlenbeck model in Example 11.5. Subﬁgure (a) shows
the simulated data (withD1=2,qD1), (b) shows the posterior
distribution along with the ML/MAP estimatesMAPD0:80 and
qMAPD0:99, and (c) shows MCMC samples from the posterior
generated with Metropolis–Hastings.
by Equation (11.7), the posterior distribution of the parameters can be writ-
ten as
p.j x.t1/; x.t2/;:::; x.tT///p./ exp.`.//
D exp.`p.//; (11.26)
wherep./ is the prior distribution. This unnormalized posterior distribu-
tion can now be plugged into various MCMC methods (see, e.g., Brooks
et al., 2011), or we can compute MAP estimates (or Laplace approxima-
tions; see Gelman et al., 2013) by minimizing the negative logarithm of it
by numerical optimization (e.g., Luenberger and Ye, 2008).
Example 11.5 (Exact parameter estimation in the Ornstein–Uhlenbeck
model). The posterior distribution of the parameters  and q of the


## Page 251

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.4 Approximated-Likelihood Methods 243
Ornstein–Uhlenbeck model
dxDx dtC dˇ; x.0/ D0; (11.27)
using the exact negative log-likelihood (11.15) and a uniform prior, is
shown in Figure 11.1. The data used for the posterior distribution are
shown as well. The data were generated using the parameter values D
1=2,qD 1, and the sampling period in the data was tD 1=10 with a
total of100 points.
11.4 Approximated-Likelihood Methods
With nonlinear SDEs of the generic form given in Equation (11.1), we have
an additional challenge that the evaluation of the transition density is in-
tractable. This also makes parameter estimation harder, because we cannot
evaluate the likelihood term in Equation (11.3) nor its negative logarithm
in Equation (11.4).
In approximated-likelihood methods, we replace the likelihood, or more
speciﬁcally the transition densities used for computing the likelihood,
with approximations. One approach is to approximate the SDE with a
continuous- or discrete-time system whose transition density we can eval-
uate. For that purpose, we can use the various SDE simulation and dis-
cretization methods that we discussed in Chapter 8.
For example, recall that one step of the Euler–Maruyama method in Al-
gorithm 8.1 is
Ox.tkC1/DOx.tk/C f.Ox.tk/;tkI/t C L.Ox.tk/;tkI/ˇk; (11.28)
for whichˇk N.0; Q./t/ . It has a Gaussian transition density and
hence leads to the approximation
p.x.tkC1/j x.tk/;/
 N.x.tkC1/j x.tk/C f.x.tk/;tkI/t;
L.x.tk/;tkI/ Q./ LT.x.tk/;tkI/t/: (11.29)
The approximation to the likelihood in Equation (11.3) is then given as
p.x.t1/;:::; x.tT/j/
D
T1Y
kD0
N.x.tkC1/j x.tk/C f.x.tk/;tkI/t;
L.x.tk/;tkI/ Q./ LT.x.tk/;tkI/t/; (11.30)


## Page 252

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
244 Parameter Estimation in SDE Models
and the approximation to the negative log-likelihood (11.4) will be
`./D
T1X
kD0
1
2 logj2 L.x.tk/;tkI/ Q./ LT.x.tk/;tkI/tj
C1
2.x.tkC1/ x.tk/ f.x.tk/;tkI/t/ T
.L.x.tk/;tkI/ Q./ LT.x.tk/;tkI/t/1
.x.tkC1/ x.tk/ f.x.tk/;tkI/t/

; (11.31)
which is going to be as (in)accurate as the Euler–Maruyama method is –
thus we expect this approximation to work only with small t. Similarly,
we can approximate the SDE with a step of the Milstein method or higher-
order Itô–Taylor expansion-based methods. We can also use strong or weak
Runge–Kutta and related methods. The only limitation is that we need to
be able to evaluate the transition density corresponding to the discrete-time
approximation. In algorithm form, we have the following.
Algorithm 11.6 (Discretization-based approximated-likelihood estima-
tion). SDE discretization-based approximated-likelihood parameter esti-
mation can be done as follows.
1. Use an SDE discretization such as Euler–Maruyama, Itô–Taylor expan-
sions, or stochastic Runge–Kutta to form a discrete-time approximation
to the SDE.
2. Let Op.x.tkC1/j x.tk/;/ be the transition density of the discrete-time
approximation. Approximate the negative log-likelihood as
O`./D
T1X
kD0
logOp.x.tkC1/j x.tk/;/: (11.32)
3. Perform maximum likelihood estimation or any form of Bayesian esti-
mation by replacing the exact likelihood ` with the preceding approxi-
mationO`.
Instead of approximating the SDE as such, we can also approximate its
transition density. One general approach to transition density approxima-
tion is to approximate is as Gaussian. For this, we can use, for example, the
Gaussian and linearization approximations considered in Sections 9.1, 9.2,
and 9.3 or alternatively using the Taylor series expansions for the ﬁrst two
moments as described in Section 9.4. Even the Euler–Maruyama happens


## Page 253

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.4 Approximated-Likelihood Methods 245
to have this form, although higher-order Ito–Taylor based methods typi-
cally do not. Thus in the end we get a transition density approximation of
the form
p.x.tkC1/j x.tk/;/ N.x.tkC1/j.x.tk/;tI/;†.x.tk/;tI//;
(11.33)
which can be then further plugged into the likelihood expression. Thus we
get the following algorithm.
Algorithm 11.7 (Gaussian approximated-likelihood parameter estima-
tion). Gaussian approximation-based approximated-likelihood parameter
estimation can be done as follows:
1. Use linearization, moment approximation, or any other methods to
form the approximations to the mean .x.tk/;tI/ and covari-
ance †.x.tk/;tI/ of the Gaussian approximation on p.x.tkC1/ j
x.tk/;/.
2. Approximate the negative log likelihood as
O`./D
T1X
kD0
log N.x.tkC1/j.x.tk/;tI/;†.x.tk/;tI//
D
T1X
kD0
1
2 logj2†.x.tk/;tI/j
C1
2.x.tkC1/.x.tk/;tI//T†1.x.tk/;tI/
.x.tkC1/.x.tk/;tI//

: (11.34)
3. Perform maximum likelihood estimation or any form of Bayesian estima-
tion by replacing the exact likelihood with the preceding approximation.
Note that one way to approximate the mean and covariance of the pre-
ceding Gaussian approximation is as the conditional mean E Œx.tkC1/ j
x.tk/ and covariance CovŒx.tkC1/j x.tk/ of the SDE, that is, by moment
matching. However, this might not always lead to the best possible ap-
proximation on the likelihood as whole (cf. Archambeau and Opper, 2011;
García-Fernández et al., 2017; Tronarp et al., 2018).
Not all transition densities can be approximated as Gaussian, for exam-
ple, when they are multimodal. Then we can use non-Gaussian approx-
imations such as the Hermite expansions considered in Section 9.5. We


## Page 254

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
246 Parameter Estimation in SDE Models
can also numerically solve the Fokker–Planck–Kolmogorov partial differ-
ential equation as described in Section 9.6 using methods such as ﬁnite-
differences or Galerkin methods, which also leads to approximations to the
transition density. The Taylor series expansion considered in Section 9.4
can also be used to approximate the moments of the transition density, and
given the moments we can, for example, form maximum entropy approxi-
mation to the density (Cover and Thomas, 2006). The simulated likelihood
method in Section 9.7 was also originally proposed exactly for this pur-
pose.
We get the following algorithm.
Algorithm 11.8 (Non-Gaussian approximated-likelihood estimation) .
Transition density approximation-based non-Gaussian approximated-
likelihood parameter estimation can be done as follows:
1. Use a suitable method to form a parametric approximation Op.x.tkC1/j
x.tk/;/ to the transition density using some of the previously discussed
methods. Then approximate the negative log-likelihood as
O`./D
T1X
kD0
logOp.x.tkC1/j x.tk/;/: (11.35)
2. Perform maximum likelihood estimation or any form of Bayesian esti-
mation by replacing the exact likelihood ` with the preceding approxi-
mationO`.
Example 11.9 (Approximate parameter estimation in the Ornstein–Uh-
lenbeck model) . The parameter estimation problem in Example 11.5
was repeated using an approximated likelihood method using the Euler–
Maruyama transition density approximation. Figure 11.2 shows a compar-
ison of the exact and approximate posteriors. As can be seen in the ﬁgure,
the effect of the approximation is the loss of the correlation between the
parameters.
11.5 Likelihood Methods for Indirectly Observed SDEs
So far in this chapter, we have assumed that the states
x.t1/; x.t2/; x.t3/;::: have been perfectly measured. However, as we
saw in Chapter 10, in many real-world problems we do not directly
observe the states, but we only get to see measurements y1; y2;::: , which
are indirectly related to the state and contain noise. However, it turns out


## Page 255

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.5 Likelihood Methods for Indirectly Observed SDEs 247
0 0:5 1 1:5 2 2:5
0 0:5 1 1:5 2 2:5
/NAK
q
(a) Exact posterior
0 0:5 1 1:5 2 2:5
0 0:5 1 1:5 2 2:5
/NAK
q (b) MCMC with exact posterior
0:5 1 1:5 2
0:5 1 1:5 2
/NAK
q
(c) Approximate posterior
0:5 1 1:5 2
0:5 1 1:5 2
/NAK
q (d) MCMC with approximate posterior
Figure 11.2 Illustration of the effect of the Euler–Maruyama
approximation to the posterior distribution of
Ornstein–Uhlenbeck model parameters from Example 11.9. The
exact posterior and its MCMC samples are shown in subﬁgures
(a) and (b), and the approximations in (c) and (d), respectively.
The point estimates of the parameters with Euler–Maryuama
approximation areOMAPD0:77 andOqMAPD0:91 when with the
exact posterior they wereMAPD0:80 andqMAPD0:99.
that the ﬁltering and smoothing methods can be combined with parameter
estimation methods to allow for parameter estimation from such indirect,
noisy measurements. These kinds of methods for SDE models have been
presented, for example, in Singer (2002), Mbalawata et al. (2013), and
Särkkä et al. (2015b) and their discrete-time analogs in Cappé et al.
(2005) and Särkkä (2013). However, the idea itself dates back at least to
Schweppe (1965) and Jazwinski (1970).
Let us assume that our model has the form
dxD f.x;tI/ dtC L.x;tI/ dˇ.t/;
ykp.ykj x.tk/I/; (11.36)


## Page 256

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
248 Parameter Estimation in SDE Models
where is a vector of unknown parameters of the system. This model is a
continuous-discrete model for which we developed two types of Bayesian
ﬁlters in Section 10.5. The key to the solution is to notice that the nor-
malization constant Zk in Equation (10.54), which is a byproduct of the
Bayesian ﬁltering equations, is actually
Zk./D
Z
p.ykj x.tk/I/p. x.tk/j y1;:::; yk1I/ dx.tk/
Dp.ykj y1;:::; yk1I/: (11.37)
We can now express the marginal likelihood by using the prediction error
decomposition
p.y1;:::; yTj/D
TY
kD1
p.ykj y1;:::; yk1I/D
TY
kD1
Zk./: (11.38)
Thus, provided that we can compute the termsZk./ or approximate them
accurately, we can obtain the expression for the (negative logarithm of
marginal) likelihood as
`./D logp.y1;:::; yTj/D
TX
kD1
logZk./: (11.39)
For linear Gaussian models, we can compute these likelihoods exactly with
Kalman ﬁlters, whereas for nonlinear and non-Gaussian models we need to
approximate them. Fortunately, the same approximations that can be used
for approximate continuous-discrete ﬁltering also provide approximations
to the termsZk./.
The resulting likelihood expressions or approximations can be further
optimized or sampled using methods such as MCMC. For more informa-
tion on these kinds of methods, the reader is referred to Särkkä (2013),
Mbalawata et al. (2013), and Särkkä et al. (2015b).
11.6 Expectation–Maximization, Variational Bayes, and Other
Methods
There is also a wide range of other parameter estimation methods that we
have not discussed here. We have not considered, for example, estimat-
ing function methods, generalized method of moments, nor methods based
on approximating the continuous-time estimators. For more details about
these methods, the reader is referred to the books of Rao (1999) and Iacus


## Page 257

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
11.7 Exercises 249
(2008). We also have only considered parametric models, although non-
parametric estimation of, for example, drift functions is possible as well
(see Section 12.6 and Rao, 1999; Ruttor et al., 2013).
The indirectly observed case in the previous section has also spanned
many other families of methods for parameter estimation in SDEs. For
example, expectation–maximization methods can be used to approximate
the maximum likelihood methods of discrete-time state-space models (e.g.,
Shumway and Stoffer, 1982; Särkkä, 2013; Kokkala et al., 2016). However,
provided that we discretize the model ﬁrst, these methods are directly ap-
plicable to continuous-discrete SDE models as well. So-called variational
Bayes methods (e.g., Šmídl and Quinn, 2006) can also be used in the con-
text of SDEs after the SDE has been discretized. Archambeau and Opper
(2011) have also developed variational Bayes methods that can directly be
used to estimate parameters in SDEs.
11.7 Exercises
11.1 Consider the following problem with unknown parameter :
xkDCrk; k D1;2;:::;T; (11.40)
whererk N.0;2/ are independent. Then accomplish the following:
(a) Derive the ML estimate of  given the measurementsx1;x2;:::;x T .
(b) Fix D1,D1 and simulate a set of data from the preceding model.
Then compute the ML estimate. How close is it to the truth?
(c) Plot the negative log-likelihood as function of the parameter . Is the
maximum close to the true value?
11.2 Assume that in Equation (11.40) we have a Gaussian prior density p./D
N.j0;2/. Then accomplish the following:
(a) Derive the MAP estimate of .
(b) How does the estimate behave as function of ?
(c) Fix D1,D1,D2, and simulate a set of data from the preceding
model. Then compute the MAP estimate. How close is it to the truth?
(d) Plot the posterior distribution of the parameter. Is the true parameter
value well within the support of the distribution?
11.3 Estimate the parameter  in Equation (11.40) using MCMC:
(a) Fix D1,D1,D2, and simulate a set of data from Equation 11.40
(with the prior).
(b) Implement an MH algorithm for sampling the parameter . Use a Gaus-
sian proposal distribution q.j / D N.j ;
 2/, and select the
parameter
 such that about1=4 of the proposals are accepted.


## Page 258

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
250 Parameter Estimation in SDE Models
(c) Plot the true posterior distribution and the histogram of samples. Do the
results match?
11.4 Fill in the details in the derivation of the Ornstein–Uhlenbeck ML estimate:
(a) Derive Equations (11.18) from (11.17).
(b) Derive Equation (11.19).
11.5 Consider the parameter estimates (11.23) in the context of the Wiener veloc-
ity model. Assume that the only unknown isq:
(a) Recall the expressions for A.t/ and†.t/ from Example 6.3.
(b) Choose some t andq, and simulate some data from the exact discrete-
time model in the example.
(c) Compute estimates AML and†ML using Equations 11.23.
(d) Does the estimate of A match the correct one? Could you determine the
parameterq from the estimate of†?
11.6 Using the data from the preceding exercise, estimate q by numerically ﬁnd-
ing the ML estimate using the negative log-likelihood expression (11.25).
11.7 Still using the same data, estimate the posterior distribution of the parameter
q by generating samples from the posterior distribution with uniform prior
p.q//1 forq>0 using the MH algorithm. Use a log transformD logq,
which transforms the uniform prior top.// exp./.
11.8 Derive the derivatives of Equation (11.25) using the matrix fraction decom-
position (see, e.g., Mbalawata et al., 2013). Check numerically using the
Wiener velocity model that they are correct.
11.9 Consider the following model, where the parameters 1 and2 are unknown:
dxD1 sin.x2/ dtC dˇ; x.0/ D0;
whereˇ is a standard Brownian motion.
(a) Simulate data from the model using the Euler–Maruyama method.
(b) Compute the maximum likelihood estimates of the parameters by using
Euler–Maruyama approximation to the transition density.
(c) Compute the MAP estimates of the parameters with independent N.0;1/
priors on them both.
(d) Simulate samples from the posterior distribution of parameters using the
MH algorithm.
11.10 Repeat Exercise 11.9 with the Itô–Taylor method in Algorithm 8.4.
11.11 Repeat Exercise 11.9 by replacing the transition density with a linearization
approximation given in Algorithm 9.4.
11.12 Extend the Kalman ﬁlter equations in Example 10.19 so that they can be used
to compute the marginal likelihood of parameters andq. Using simulated
data, estimate the parameters from noisy observations by maximizing the
marginal likelihood.


## Page 259

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12
Stochastic Differential Equations in Machine
Learning
In this chapter, we aim to present an overview of how the topics in the
previous chapters are related to concepts in probabilistic machine learn-
ing. This link is presented with the focus on Gaussian processes, which are
stochastic processes already familiar from the previous chapters. In partic-
ular, it is useful to notice that solutions of linear SDEs are always Gaussian
processes. An interesting question to ask is whether all Gaussian processes
can be constructed as solutions to SDEs – the answer is negative, but we
can get quite close to that.
In probabilistic machine learning, Gaussian process (GP) regression
(O’Hagan, 1978; MacKay, 1998; Rasmussen and Williams, 2006) is a
probabilistic paradigm where instead of using a ﬁxed-form parametric
model for regression such as a multi layer perceptron (MLP) neural net-
work (Bishop, 2006), one postulates a Gaussian process prior over the
model functions. Learning in Gaussian process regression means com-
puting the posterior Gaussian process, which is conditioned to observed
measurements. The prediction of unobserved values amounts to comput-
ing predictive distributions and their statistics. Although here we restrict
our discussion to regression problems, we can similarly do Gaussian pro-
cess classiﬁcation (Rasmussen and Williams, 2006), provided that we use
a logit or probit transformation in the measurement model (for further con-
nections to general non-Gaussian likelihoods, see Nickisch et al., 2018).
It turns out that ﬁltering and smoothing on linear stochastic differential
equations are more or less equivalent to Gaussian process regression. The
presentation in this chapter summarizes the presentation in Solin (2016) on
the connections between (inﬁnite-dimensional) Kalman ﬁltering and GP
regression (see also Hartikainen and Särkkä, 2010, 2011; Särkkä and Har-
tikainen, 2012; Särkkä et al., 2013, for further results and analysis). Addi-
tionally, we discuss learning of drift functions by using GP regression as
well as latent force models and GP regression on SDE trajectories.
251


## Page 260

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
252 Stochastic Differential Equations in Machine Learning
12.1 Gaussian Processes
A Gaussian process x./ is a random function on a d-dimensional input
space. Note that in the previous chapters we have always assumed that the
input is one-dimensional time t, but here we allow for multiple input
dimensions.
Deﬁnition 12.1 (Gaussian process (GP)) . A Gaussian process x./ is
a random function x./ with d-dimensional input  such that any ﬁ-
nite collection of random variables x.1/; x.2/;:::; x.n/ has a multi-
dimensional Gaussian distribution.
As we already saw in Chapter 6, solutions of linear SDEs are Markov
processes with Gaussian transition densities. Thus their ﬁnite-dimensional
distributions are Gaussian and they are Gaussian processes by the preced-
ing deﬁnition. Gaussian processes with d > 1are also sometimes called
Gaussian ﬁelds, but here we just call them processes as is commonly done
in machine learning (Rasmussen and Williams, 2006).
A GP is commonly deﬁned through the following kernel (covariance
function) formalism (Rasmussen and Williams, 2006) denoted by
x./ GP.m./; C.;0//; (12.1)
which means that x./ is a Gaussian process with mean and covariance
functions m./ and C.;0/, respectively. The mean and covariance func-
tions also completely characterize a Gaussian process.
Deﬁnition 12.2(Mean and covariance functions of GPs). A Gaussian pro-
cess can be deﬁned in terms of amean m./ and covariance function (ker-
nel) C.;0/:
m./D EŒx./;
C.;0/D EŒ.x./ m.//. x.0/ m.0//T:
(12.2)
The joint distribution of an arbitrary ﬁnite collection of random variables
x.1/; x.2/;:::; x.n/ is then multidimensional Gaussian:
0
B@
x.1/
:::
x.n/
1
CA N
0
B@
0
B@
m.1/
:::
m.n/
1
CA;
0
B@
C.1;1/ ::: C.1;n/
::: ::: :::
C.n;1/ ::: C.n;n/
1
CA
1
CA: (12.3)
Even though the model is built upon functions depending on continu-
ously deﬁned inputs, data are always ﬁnite and allow the computations to


## Page 261

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.1 Gaussian Processes 253
be performed on ﬁnite index sets. In machine learning, GP models are of-
ten referred to as nonparametric because the number of parameters in the
model is not ﬁxed but rather spanned by the number of data points.
Special structure in data or the covariance function leads to useful spe-
cial cases and formulations that bridge concepts across stochastic differen-
tial equations and GP regression.
Deﬁnition 12.3(Stationary Gaussian process). A process is said to be sta-
tionary or homogeneous if its mean is constant and the covariance function
is of the form
C.;0/D C.0/: (12.4)
The covariance functions of stationary processes are often written as func-
tions of variable  only, that is, C./. Here we have formally made the
substitution!0.
GP models with a stationary covariance function can be represented in
terms of their spectral density. This stems from Bochner’s theorem (see,
e.g., Akhiezer and Glazman, 1993; Da Prato and Zabczyk, 2014), which
states that an arbitrary positive deﬁnite function can be represented as a
Fourier transform of a positive measure. If the measure has a density, it
is called the spectral density of the process. This relation is the Fourier
duality of covariance and spectral density, which is known as the Wiener–
Khinchin theorem (we saw it already in Section 6.6). In its matrix form, it
can be written as
S.!/D FŒC./
D
Z
C./ exp.i!T/ d: (12.5)
Deﬁnition 12.4 (Isotropic Gaussian process) . An isotropic covariance
function has the form
C.;0/D C.k0k/: (12.6)
That is, it is only a function of the distance of two input vectors, which
means that the covariance is both translation and rotation invariant.
Deﬁnition 12.5 (Separable Gaussian process) . A separable covariance
function can be rewritten as a product of two covariance functions with
no shared inputs. For example, if  D .1;2/, the covariance function
C.;0/D C1.1;0
1/ C2.2;0
2/ is separable.


## Page 262

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
254 Stochastic Differential Equations in Machine Learning
12.2 Gaussian Process Regression
In its simplest form, Gaussian process regression (Rasmussen and
Williams, 2006) considers predicting values of an unknown scalar func-
tion
yDx./ (12.7)
at certain test points f.?;i;y?;i/ j i D 1;2;:::;m g, based on a ﬁnite
number of samplesf.k;yk/jkD1;2;:::;n g observed from it. Instead
of postulating a parametric form of the function x.I/ as in parametric
regression and estimating the parameters , it is assumed that the func-
tionx./ is a sample from a zero mean Gaussian process with a given co-
variance functionC.;0/. A typical choice for the covariance function is
the squared exponential (Rasmussen and Williams, 2006) orexponentiated
quadratic (Álvarez et al., 2012) covariance function
C.;0/D2 exp

 1
2`2k0k2

: (12.8)
Note that although the common name for the covariance function is
the squared exponential covariance function, the exponentiated quadratic
covariance function is a far more descriptive name for it – anyway,
exp.x/2D exp.2x/, which not equal to exp.x2/.
If the vector of observed points is denoted asyoD.y1;:::;y n/T and the
vector of test points as y?D.y?;1;:::;y ?;m/T, then based on the Gaussian
assumption their joint distribution is
yo
y?

D N
0
0

;
Coo CT
?o
C?o C??

; (12.9)
whereŒCooijDC.i;j/ is the joint covariance matrix of observed points,
ŒC?oij D C.?;i;j/ is the cross-covariance of the test and observed
points, andŒC??ijDC.?;i;?;j/ is the joint covariance of test points.
The conditional distribution of test points given the observed values is
now Gaussian, and by using the computation rules of Gaussian distribution,
we can compute the minimum mean squared estimate of the test points,
which is given by the conditional mean
EŒy?j yoD C?o C1
oo yo: (12.10)
The covariance of the corresponding Gaussian posterior distribution is
CovŒy?j yoD C?? C?o C1
oo CT
?o: (12.11)


## Page 263

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.2 Gaussian Process Regression 255
Equations (12.10) and (12.11) are useful in applications where we can as-
sume that the observed values are error-free and we want to interpolate the
test point values using the observed values.
In statistical estimation problems, it is often assumed that the measure-
ments are not perfect, but corrupted by additive Gaussian noise. That is,
the measurements are modeled as
ykDx.k/C"k; " k N.0; 2
n/; (12.12)
where "k are independent random variables, a priori independent of the
Gaussian process x./. Now we are interested in computing the mean
squared estimate of the values of the “clean” function x./ at a set of test
points?Df ?;i j iD 1;2;:::;m g given the measurements at the ob-
served pointsoDfijiD1;2;:::;n g. If we denote the vector of values
of the function at the test points as x? D .x.?;1/;:::;x. ?;m//T, then
the joint distribution of observed measurement and function values at test
points is
 yo
x?

D N
0
0

;
CooC2
n I C T
?o
C?o C??

; (12.13)
and the conditional mean and covariance are given as
EŒx?j yoD C?o.CooC2
n I/1 yo;
CovŒx?j yoD C?? C?o.CooC2
n I/1 CT
?o:
(12.14)
The model can be easily generalized to vector processes and processes,
including a prior mean function in the GP such as
ykD x.k/C"k; "k N.0;†/;
m./D EŒx./;
C.;0/D EŒ.x./ m.//. x./ m.//T:
(12.15)
The joint distribution still has a quite familiar form
 yo
x?

D N
mo
m?

;

CooCO† CT
?o
C?o C??

; (12.16)
where matrices have been formed from the blocks ŒCooij D C.i;j/,
ŒC?oijD C.?;i;j/, andŒC??ijD C.?;i;?;j/ analogously to the one-
dimensional case. The mean vectors have been formed by similar stacking,
mo;iD m.i/ and m?;iD m.?;i/. The matrix O†D I˝†, is a block-
diagonal matrix containing matrices† as the diagonal blocks.


## Page 264

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
256 Stochastic Differential Equations in Machine Learning
The conditional mean and covariance then have almost the same func-
tional form as before:
EŒx?j yoD m?C C?o.CooCO†/1.yo mo/;
CovŒx?j yoD C?? C?o.CooCO†/1 CT
?o:
(12.17)
A useful way of interpreting the preceding equations is that they actu-
ally deﬁne a posterior Gaussian process that has the mean and covariance
functions
Om.j yo/D m./C C.;0
o/. C.o;0
o/CO†/1.yo m.o//;
OC.;0j yo/D C.;0/ C.;0
o/. C.o;0
o/CO†/1 CT.0;0
o/:
(12.18)
Here the apostrophe is used for emphasizing that the index sets such as o
and0
o are independent such that the matrix is formed from all the pairs
of indexes. In particular, the posterior distribution of an arbitrary function
value x./ is
p.x./j yo/D N.x./j Om.j yo/;OC.;j yo//: (12.19)
We can also deﬁne the observation model through a linear operator H
that evaluates the latent function valuesx./ at the observation inputs such
that.x.1/;:::; x.n//TD H x./. Similarly, we can consider more gen-
eral measurement operators and allow H to be a more general linear op-
erator, such as a differential or pseudodifferential operator (e.g., Särkkä,
2011; Särkkä et al., 2013).
The generalized GP regression problem thus takes the following form:
x./ GP.m./; C.;0//;
yoD H x./C"; (12.20)
for which the solution is given by
Om.j yo/D
m./CŒC.;0/ HŒ H C.;0/ HCO†1Œyo H m./;
OC.;0j yo/D
C.;0/ŒC.;0/ HŒ H C.;0/ HCO†1 H C.;0/;
(12.21)
where H denotes the adjoint of H, effectively reversing the direction of
the operation (cf. Särkkä, 2011; Särkkä et al., 2013).


## Page 265

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.3 Converting between Covariance Functions and SDEs 257
0 0:2 0:4 0:6 0:8 1
/NUL2 0 2 4
Input,/CAN
Output,x./CAN/
Mean
95% quantiles
Samples
Observations
Figure 12.1 Batch GP regression solution from Example 12.6
with the data shown by black crosses, and the posterior mean and
marginal variance visualized together with random realizations of
the posterior process.
Example 12.6 (Batch GP regression) . Consider the following one-
dimensional GP regression model:
x./ GP.0;C.; 0//;
ykDx.k/C"k; " k N.0; 2
n/; (12.22)
where the ﬁrst equation deﬁnes the GP prior and second the observation
model. Let the a priori covariance function be a Matérn covariance func-
tion:
CMat:.;0/D2

1C
p
3j0j
`

exp


p
3j0j
`
!
; (12.23)
where` now stands for a characteristic “length scale” and 2 for a mag-
nitude scale (hyper) parameter of the model.
Figure 12.1 shows an example where the dataf.k;yk/jkD1;2;::: g
are shown with black crosses, and the predicted marginal posterior process
on the entire interval is visualized by the shaded patch.
12.3 Converting between Covariance Functions and SDEs
Consider now a special case of Gaussian process regression, where the
input is one-dimensional and denoted asDt. Thus we have a relationship


## Page 266

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
258 Stochastic Differential Equations in Machine Learning
of the form
yDx.t/; (12.24)
and the a priori mean and covariance functions are given functions m.t/
andC.t;t 0/. In practice, we usually observe the process only at discrete
points of time, and the measurements are corrupted by some noise, for
example,
ykDx.tk/C"k; " k N.0; 2/: (12.25)
The aim of Gaussian process regression is (in a simple case) to infer the
posterior distribution
p.x.t/j yo/D N.x.t/j Om.tj yo/;OC.t;t j yo//: (12.26)
for an arbitrary t. It is now easy to see that if the process x.t/ was rep-
resented in terms of an SDE (i.e., state-space model), this would exactly
correspond to the smoothing distribution discussed in Section 10.8. It turns
out that this is indeed the case provided that we can ﬁnd an SDE that “gen-
erates” the mean and covariance functions m.t/ andC.t;t 0/, respectively.
In the following, we takem.t/D0 without loss of generality.
To illustrate the main idea, assume that the a priori GP has zero mean
and the covariance function
C.t;t 0/D q
2 exp.jtt0j/; (12.27)
which is the covariance function of the Ornstein–Uhlenbeck process (see
Example 6.8). Thus the SDE having this covariance function is
dxDx dtC dˇ: (12.28)
In machine learning, this covariance function is also known as the ex-
ponential covariance function. This implies that the smoothers in Exam-
ples 10.29 and 10.33 actually compute the Gaussian process regression
solution (12.26) for the covariance function (12.27).
Many other widely used covariance functions can also be converted to
SDE models. When the spectral density of the covariance function is a
rational function, this conversion can be done exactly. For many other co-
variance functions, we can also form SDE representations that accurately
approximate the covariance function, for example, by approximating the
spectral density as a rational function.
In the following sections, the interest will be in classes of Gaussian pro-
cess regression problems, which can be represented in terms of a linear


## Page 267

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.3 Converting between Covariance Functions and SDEs 259
time-invariant SDE model and a linear measurement model of the follow-
ing form:
dxD F x dtC L dˇ;
ykD H x.tk/C"k; (12.29)
where x.t/D .x1.t/; x2.t/; :::; xD.t// contains the D stochastic pro-
cesses, and the multidimensional Brownian motion ˇ has a diffusion ma-
trix Q2 RSS. The model is deﬁned by the matrices F 2 RDD and
L 2 RDS, and the initial state covariance P0. The observation model
is deﬁned by the measurement model matrix H 2 R1D. The mea-
surements are assumed to be corrupted by independent Gaussian noises,
"k N.0; 2
n/.
The basic idea is to construct F, L, and P0 such that the process
x.t/D H x.t/ (12.30)
has a given covariance function C.t;t 0/ that we prescribed for the GP re-
gression problem. Then a smoothing algorithm will produce the distribu-
tionsp.x.t/j yo/, where we can recoverp.x.t/j yo/ in Equation (12.26)
by a marginalization.
Some examples of widely used covariance functions of the LTI SDE
kind include the ones listed in the following. Rasmussen and Williams
(2006) provide a detailed presentation of most of the covariance functions
in the GP context. For the details of the corresponding state-space repre-
sentations, see, for example, Solin (2016). At the end of this section, we
also show how state-space models can be combined to produce sums and
products of the corresponding covariance functions.
Exponential: The exponential (or Ornstein–Uhlenbeck) covariance func-
tion deﬁnes a stationary process, where the model functions are contin-
uous but not differentiable:
Cexp.t;t0/D2 exp

jtt0j
`

; (12.31)
where2 is a magnitude scale parameter and` the characteristic length-
scale parameter. The exponential covariance function is the covariance
function of the Ornstein–Uhlenbeck process, which was already pre-
sented earlier with the parameterizationD 1=` andqD 22ı
`.
Thus the exponential covariance function has the following LTI SDE


## Page 268

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
260 Stochastic Differential Equations in Machine Learning
representation:
FD 1
`; L D1; q D 22
` ; and HD1: (12.32)
The initial variance is given by the stationary state covariance P0 D
P1D2.
Matérn: A wide class of covariance functions can be deﬁned by the
Matérn class, which is given in its general form as
CMat:.t;t0/D2 21
./
 p
2jtt0j
`
!
K
p
2jtt0j
`

; (12.33)
where 2 is a magnitude scale hyperparameter, ` the characteristic
length scale, and  a smoothness parameter. K./ denotes the modi-
ﬁed Bessel function of the second kind. For this class, the corresponding
process isk-times differentiable if > k. For half-integer values of ,
the expression simpliﬁes and it has an exact representation in terms of a
LTI SDE. For example, ifD 1=2, the exponential covariance function
is recovered. For higher-order half-integer Matérn covariance functions,
the LTI SDE representation is given as follows (Hartikainen and Särkkä,
2010): letD
p
2=` and the state dimensionalityDDC1=2, then
the model is given in the so-called companion form as
FD
0
BBBB@
0 1
::: 0 1
::: :::
a1p a2D1  aD
1
CCCCA
; LD
0
BBB@
0
:::
0
1
1
CCCA; (12.34)
whereaiD
 D
i1

are the binomial coefﬁcients. The measurement model
matrix is HD

1 0 ::: 0

, the diffusion coefﬁcient is
qD2Œ.D1/Š2
.2D2/Š .2/2D1; (12.35)
and the initial state covariance is the steady-state covariance P1 of the
model. For arbitrary values of the smoothness parameter , the spec-
tral density can be approximated by series expansions giving a rational
representation.
Squared exponential: The squared exponential (also known as the Gaus-
sian, radial basis function, RBF, or exponentiated quadratic) covariance


## Page 269

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.3 Converting between Covariance Functions and SDEs 261
function is given by
Cse.t;t0/D2 exp

jtt0j2
2`2

; (12.36)
where2 is a magnitude scale hyperparameter and ` is the characteris-
tic length scale. It can be recovered in the limit of the Matérn smooth-
ness parameter  going to inﬁnity. The model functions are thus in-
ﬁnitely smooth (inﬁnitely differentiable), which would require an inﬁ-
nite number of derivatives stacked in the state for an exact SDE repre-
sentation. However, the spectral density of the squared exponential can
be efﬁciently approximated by a Taylor expansion (see Hartikainen and
Särkkä, 2010; Särkkä et al., 2013) or Padé approximants (Särkkä and
Piché, 2014) which leads to a ﬁnite-dimensional SDE representation.
In particular, as discussed in Särkkä and Piché (2014), a general class
of approximations can be constructed as
Sse.!/D2p
2` exp

`2!2
2

2p
2`
0
B@
1Cb1

`2!2
2

CC bL

`2!2
2
L
1Ca1

`2!2
2

CC aM

`2!2
2
M
1
CA; (12.37)
whereai foriD1;:::;M andbj forjD1;:::;L are the coefﬁcients
of a Padé approximant for the exponential function exp.x/ forx0
such that L < M. The corresponding SDE can constructed by using
spectral factorization.
Rational quadratic: The rational quadratic (RQ) covariance function
Crq.t;t0/D2

1Cjtt0j2
2˛`2
˛
; (12.38)
where˛>0 is a shape parameter that deﬁnes the decay of the tail. The
RQ covariance function corresponds to a scale-mixture model of squared
exponential covariance functions with a gamma prior distribution on the
inverse squared length scale. The Cauchy covariance is a special case
for˛D1. As˛!1 , the covariance function converges to the squared
exponential.
The scale-mixture representation of the rational quadratic covariance


## Page 270

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
262 Stochastic Differential Equations in Machine Learning
function can be approximated in terms of (Solin and Särkkä, 2014b)
Crq.tt0/
nX
iD1
Cse.t;t0j2
i;`i/; (12.39)
where the squared exponentials are evaluated with magnitudes 2
i D
2
rqwi=.˛/ and length scales`2
iD`2
rq˛=xi. The pointsxi and weights
wi are given such thatxi;i D1;2;:::;n , are the roots of the generalized
Laguerre polynomial L˛1
n .x/, and the weightswi are given as follows:
wiD .nC˛/xi
nŠ.nC1/2
L˛1
nC1.xi/
2: (12.40)
The state-space representation of the RQ covariance function can then
be constructed as the sum of squared-exponential SDE models with hy-
perparameters2
i and`2
i .
Periodic: The canonical periodic covariance function often encountered
in machine learning applications can be given as
Cperiodic.t;t0/D2 exp
0
@
2 sin2

!0jtt0j
2

`2
1
A; (12.41)
where2 is the magnitude scale and ` the characteristic length scale.
The period length is determined by !0D 2=t period. The periodic co-
variance function has a spectrum with a set of delta peaks appearing at
the harmonic frequencies.
An approximative SDE model can be given in terms of a sum of n
two-dimensional oscillatory SDE models of the following form. The
feedback matrices are (Solin and Särkkä, 2014a)
FjD
 0 !0j
!0j 0

; (12.42)
dispersion matrix LjD I, and the stationary covariances P1;jDq2
j I2.
The process does not have a diffusion term, so QD 0. The measure-
ment models are Hj D

1 0

. The coefﬁcients are given by q2
j D
2 Ij.`2/= exp.`2/, forjD 1;2;:::;n , andq2
0D I0.`2/= exp.`2/,
where I˛.z/ is the modiﬁed Bessel function of the ﬁrst kind of order˛.
In practical modeling, it is common to allow for seasonable varia-
tion (quasiperiodicity) by considering a product of a long length scale
stationary covariance function and a periodic covariance function. This
allows the model to decay away from exact periodicity. Forming the


## Page 271

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.3 Converting between Covariance Functions and SDEs 263
product of covariance functions in SDE formulation is explained in Al-
gorithm 12.10. For the product formulation in Algorithm 12.10 to hold,
the process noise spectral density of the periodic SDE needs to be rede-
ﬁned asQjDq2
j I2 (see Solin and Särkkä, 2014a).
Wiener process: As already discussed in Section 7.2, the Wiener process
(Brownian motion) with a diffusion constantq has the covariance func-
tion
CWP.t;t0/Dq min.t;t0/; (12.43)
which is valid on the domaint;t00.
Wiener velocity: The Wiener velocity model is a commonly used model
in tracking applications (see Example 6.3). It corresponds to a once in-
tegrated Wiener process, where the derivative (velocity) is modeled as a
Wiener process. The covariance function is (fort;t00)
CWV.t;t0/Dq
min3.t;t0/
3 Cjtt0jmin2.t;t0/
2

: (12.44)
Polynomial: The polynomial covariance function deﬁnes a nonstationary
kernel that produces polynomials
Cpoly.t;t0/D2.tt0/p; (12.45)
where2 is a magnitude scale hyperparameter and p is a positive in-
teger. Example 12.8 and Exercise 12.6 show examples of state-space
models for this class of covariance functions.
Constant: Constant bias in the outputs can be modeled by including a
constant covariance function in the covariance structure of the model.
The constant covariance function is given as
Cconst:.t;t0/D2; (12.46)
where2 is a magnitude scale hyperparameter. The covariance function
is degenerate, it has a rank one. The corresponding degenerate state-
space model has the feedback F D 0, dispersion L D 1, diffusion
coefﬁcientqD0, observation modelHD1, and initial state variance
P0D2.
Noise: The (white) noise covariance function is
Cnoise.t;t0/D2ı.tt0/; (12.47)
where2 is a magnitude scale hyperparameter and ı.tt0/ represents


## Page 272

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
264 Stochastic Differential Equations in Machine Learning
the Dirac delta function. For an indexed set of inputs, the covariance is
given by C.ti;tj/D 2ıij, where ıij is the Kronecker delta function.
This covariance function has a ﬂat frequency spectrum. It can be seen as
the limit of other stationary kernels, when the characteristic length scale
tends to zero,`!0 (see Exercise 3.5).
Example 12.7 (Matérn SDE model) . For covariance functions of the
Matérn family for whichD 3=2, the processes are continuous and once
differentiable. The covariance function becomes
CMat:.t;t0/D2

1C
p
3jtt0j
`

exp


p
3jtt0j
`

: (12.48)
This model has the SDE representation
FD
 0 1
2 2

; LD
0
1

; and P1D
2 0
0  22

;
(12.49)
whereD
p
3=`. The diffusion constant of the Brownian motion is qD
432. The measurement model matrix is HD.10/ .
Example 12.8 (Linear covariance function). In the polynomial covariance
function, whenpD1, it becomes the linear covariance function
Clinear.t;t0/D2tt0; (12.50)
where2 is a magnitude scale hyperparameter. This is a degenerate co-
variance function, whose corresponding LTI SDE model is derived through
the corresponding ODE model deﬁning the evolution of the linear basis
functions and the covariance of the Gaussian initial state. Thus the SDE is
FD
0 1
0 0

; LD
0
1

; and P0D2
t2
0 t0
t0 1

; (12.51)
wheret0 is the time at the initial point. The spectral density of the Brownian
motion isQD0 (zero diffusion) and observation model HD.10/ .
In GP modeling, common practice of encoding prior beliefs is to build
more complicated covariance functions from sums and products of simpler
ones. Given the SDE representations for the covariance functionsC1.t;t0/
andC2.t;t0/, we can form the SDE representations of the sums and prod-
ucts, as we see in the following.
The sumC.t;t 0/DC1.t;t0/CC2.t;t0/ of two covariance functions is a
valid covariance function (see, e.g., Rasmussen and Williams, 2006).


## Page 273

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.4 GP Regression via Kalman Filtering and Smoothing 265
Algorithm 12.9 (Sums of stationary covariance functions as SDEs) . In
terms of the state-space SDE model, this corresponds to a stacked model
x.t/D.x1.t/; x2.t// of the two SDE models:
FD blkdiag.F1; F2/; LD blkdiag.L1; L2/;
QD blkdiag.Q1; Q2/; P0D blkdiag.P0;1; P0;2/; (12.52)
where the indices 1 and 2 refer toC1.t;t0/ andC2.t;t0/, respectively. The
dynamics of the two state-space models are independent, but coupled by
the measurement model HD.H1 H2/. The state dimension becomesDD
D1CD2.
The productC.t;t 0/DC1.t;t0/C2.t;t0/ of two covariance functions is
also a valid covariance function (see, e.g., Rasmussen and Williams, 2006).
The corresponding product of two state-space SDEs must preserve the dy-
namics of both the models. The SDE corresponding to the product of two
covariance functions is given by the following algorithm.
Algorithm 12.10 (Products of stationary covariance functions as SDEs) .
The feedback matrix is given by
FD F1˝ IC I˝ F2; (12.53)
where˝ denotes the Kronecker product. The dispersion, spectral density,
initial state covariance, and measurement model matrices are then given
as follows:
LD L1˝ L2; QD Q1˝ Q2;
P0D P0;1˝ P0;2; HD H1˝ H2: (12.54)
The state dimension becomesDDD1D2.
Equation (12.53) is known as the Kronecker sum of matrices F1 and F2,
which makes the matrix exponential factor into the Kronecker product of
the corresponding two matrix exponentials (see Higham, 2008; Solin and
Särkkä, 2014a).
12.4 GP Regression via Kalman Filtering and Smoothing
In Chapter 6, we saw that linear stochastic differential equations can be
solved for discrete time instants, which corresponds to conversion to an
equivalent discrete-time state-space model. If the observations are linear
and corrupted by additive Gaussian noise, the state-space inference prob-
lem can be solved by the Kalman ﬁlter (Algorithms 10.18 and 10.20) and


## Page 274

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
266 Stochastic Differential Equations in Machine Learning
Rauch–Tung–Striebel smoother (Algorithms 10.28 and 10.32). This im-
plies that if the GP covariance function has an equivalent representation in
terms of a linear stochastic differential equation, then the batch GP regres-
sion problem can be solved using a Kalman ﬁlter and Rauch–Tung–Striebel
smoother (Hartikainen and Särkkä, 2010, 2011; Särkkä and Hartikainen,
2012; Särkkä et al., 2013; Solin, 2016).
While a naïve implementation of solving the batch GP regression prob-
lem in Equation (12.18) scales cubically with respect to the number of ob-
servations, solving the inference problem sequentially with a Kalman ﬁlter
and RTS smoother scales linearly. This makes the sequential approach for
GP regression appealing for long (or even unbounded) temporal datasets.
The Kalman ﬁlter and RTS smoother only return the marginal means and
variances. For recovering the full posterior GP covariance CovŒx?j yo, the
smoother outcome can be used as follows. The diagonal elements (marginal
variances) are given by †k;k D H P s
k HT, for k D 1;2;:::;n , and the
lower triangle of the symmetric covariance matrix is given by
†i;jD H
 i1Y
kDj
Gk

P s
i HT; for i >j; (12.55)
where P s
k is the smoother covariance of the state and Gk the smoother
gain in Equation (10.91). However, for drawing posterior samples from the
latent process, the full covariance does not have to be formed. This can be
done directly by using the smoother solution as explained in Doucet (2010)
(cf. also Särkkä et al., 2015b).
For training the hyperparameters, the parameter estimation methods dis-
cussed in Sections 11.5 and 11.6 apply as such.
Example 12.11 (Sequential solution to GP regression) . Figure 12.2
demonstrates the Kalman ﬁltering and RTS smoothing approach to solv-
ing the GP regression problem from Example 12.6. The ﬁltering outcome
shows the sequential nature of the ﬁlter, where the marginal variance drops
as new data points are encountered. The smoother outcomes on the right
side correspond exactly (up to ﬂoating point inaccuracy) to the batch solu-
tion given in Example 12.6.
12.5 Spatiotemporal Gaussian Process Models
The connection between batch GP regression models and SDEs can be
extended from purely temporal models to spatiotemporal models. Mod-
eling of spatiotemporal data is straightforward under the GP regression


## Page 275

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.5 Spatiotemporal Gaussian Process Models 267
0 0:2 0:4 0:6 0:8 1
/NUL2 0 2 4
Input, t
Output, x.t /
(a) Filtering solution
0 0:2 0:4 0:6 0:8 1
/NUL2 0 2 4
Input, t
Output, x.t /
Mean
95% quantiles
Observations
Batch solution (b) Smoothing solution
Figure 12.2 Sequential solution to GP regression from
Example 12.11: (a) the result after the (forward) ﬁltering step, and
(b) the (backward) smoother outcome that corresponds to the
batch GP regression solution.
paradigm. The space r 2 Rd and time t 2 R variables jointly take the
roles of input variables of the regression function: D .r;t/ . While the
batch GP regression formalism in Section 12.2 can be employed for solv-
ing models of this type, in practical applications the cubic computational
scaling easily becomes an issue.
Kalman ﬁltering and smoothing solutions to spatiotemporal GP regres-
sion problems were introduced in the article by Särkkä et al. (2013). The
idea is to let the state be a function in an inﬁnite-dimensional Hilbert space.
The rationale is that similarly as for the ﬁnite-dimensional state variables in
Equation (12.29), the evolution of the inﬁnite-dimensional quantities can
be encoded into a state-space model. For spatiotemporal models, this is in-
terpreted as a Gaussian process (Gaussian random ﬁeld) that evolves over
time. The GP regression problem can be reformulated into a stochastic
partial differential equation (SPDE; see Da Prato and Zabczyk, 2014) de-
scribing the temporal dynamics of the spatial process:
@x.r;t/
@t D F x.r;t/C L w.r;t/;
ykD Hk x.r;tk/C"k;
(12.56)
where the process is driven by a spatiotemporal white noise processw.r;t/
with a spectral density function Q.r; r0/.
The dynamical model in Equation (12.56) is an inﬁnite-dimensional,


## Page 276

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
268 Stochastic Differential Equations in Machine Learning
time-invariant linear stochastic partial differential equation. If the opera-
tor F is a differential operator, the dynamic model is an evolution type
SPDE (see, e.g., Chow, 2007). The model formulation generalizes to a
setup, where the operators are integrodifferential operators or pseudodif-
ferential operators (Shubin, 1987). A pseudodifferential operator refers to
an operator that is not a ﬁnite linear combination of differential operators,
but instead can be deﬁned as an inﬁnite series of them.
Analogously to the one-dimensional SDE case, the inﬁnite-dimensional
SPDE model can be solved by a Kalman ﬁlter and RTS smoother, though
now by using their inﬁnite-dimensionalcounterparts. We point the reader
to Särkkä et al. (2013) and Solin (2016) for a more detailed overview and
examples of this approach.
12.6 Gaussian Process Approximation of Drift Functions
Gaussian processes can also be used as nonparametric priors in inferring
the unknown drift function in an SDE by observing a realization path of
the process. Ruttor et al. (2013) present an approach that we simplify here
to one-dimensional problems:
dxDf.x/ dtC dˇ; (12.57)
whereˇ.t/ is a Brownian motion with diffusion constantq. We assume that
f.x/  GP.0;C.x;x 0// is given a Gaussian process prior with a known
covariance function, and we have observed a realization of the SDE.
The general construction for the GP approximation is as follows. Con-
sider approximating an observed path by the Euler–Maruyama method:
Ox.tkC1/Ox.tk/Df.Ox.tk//tCˇk; (12.58)
whereˇk  N.0;qt/ andOx.t/ stands for the observed path seen at
discrete time instants. As in Section 11.4, we now discretize the solution
trajectory using Euler–Maruyama and use it to approximate the distribu-
tion of the trajectory. Since the transition probabilities in the model are
Gaussian, the preceding model can be read as
p.Ox.t1/;:::; Ox.tT/jf/
/ exp

 1
2qt
T1X
kD0
jOx.tkC1/Ox.tk/f.Ox.tk//tj2
!
: (12.59)
We can now consider a Gaussian process model as the conjugate prior for
the drift functionf .


## Page 277

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.6 Gaussian Process Approximation of Drift Functions 269
0 50 100 150 200
/NUL2 /NUL1 0 1 2
Time, t
x.t /
(a) Observed stochastic process
/NUL2 /NUL1 0 1 2
/NUL4 /NUL2 0 2 4
Input, x
f .x/
Mean
95% quantiles
Ground-truth drift (b) GP approximation of the drift
Figure 12.3 An example (see Example 12.12) of learning the
double-well drift model from an observed stochastic process
shown in (a) using a Gaussian process prior. The resulting drift
estimate is shown in (b).
By directly applying the GP regression formulation from Section 12.2,
we get that the posterior process over drift functionsf has a posterior mean
and covariance:
EŒf.x?/jOx.t1/;:::; Ox.tT/D C?o

CooC q
t I
1
d;
CovŒf.x?/jOx.t1/;:::; Ox.tT/D C?? C?o

CooC q
t I
1
Co?;
(12.60)
where the elements of d are dk D .Ox.tkC1/Ox.tk//=t , for k D
1;2;:::;T 1. However, in practice this approach becomes computation-
ally heavy for larger datasets and multidimensional models, and more com-
plicated if the data are not uniformly sampled. For more details, the reader
is directed to Ruttor et al. (2013).
Methods for inferring the nonlinear dynamics in discrete-time models –
so-called Gaussian process state-space (GPSS) models – have been con-
sidered, for example, by Turner et al. (2010), Frigola et al. (2013), and
Svensson et al. (2016).
Example 12.12 (GP approximation of the double-well model) . Consider
the following double-well model
dxD4.xx3/ dtC dˇ; (12.61)
whereˇ.t/ is a standard Brownian motion (qD 1). We simulate 20,000


## Page 278

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
270 Stochastic Differential Equations in Machine Learning
samples using Euler–Maruyama withtD0:01 and keep every 20th sam-
ple point as observation, which leads to nD1;000 observations. We aim
to infer the drift function by using a GP prior with the following covariance
function
C.x;x0/D102xx0C202 exp

jxx0j2
; (12.62)
which corresponds to a sum of a linear and squared-exponential covari-
ance function with ﬁxed hyperparameters. Figure 12.3 shows the original
data, the GP solution, and the ground-truth drift function.
12.7 SDEs with Gaussian Process Inputs
In this book so far we have assumed that the SDEs are driven with Brow-
nian motions (or equivalently white noises). However, from a modeling
point of view, it is sometimes convenient to assume a correlation structure
in the driving noise. In machine learning, these kinds of models are called
latent force models (LFMs; Álvarez et al., 2009, 2013; Hartikainen and
Särkkä, 2011; Hartikainen et al., 2012). To illustrate the main principles,
consider the following spring model (cf. Equation 2.1) with a Gaussian
processg.t/ as its input:
d2x
dt2C
 dx
dt C2xDg.t/; (12.63)
which is equivalent to the state-space model (cf. Equation 2.4)
dx
dt D F xC Lg.t/; (12.64)
where
xD
x
dx
dt

; FD
 0 1
2

; and LD
0
1

: (12.65)
Recall from Chapter 2 that the solution is (assuming zero initial conditions)
as follows:
x.t/D
Z t
0
exp.F.t// Lg./ d: (12.66)
Now assume that g.t/ is a zero-mean Gaussian process with a given co-
variance function
Cg.t;t0/D EŒg.t/g.t 0/: (12.67)


## Page 279

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.7 SDEs with Gaussian Process Inputs 271
Then x.t/ is a zero-mean Gaussian process as well, and we can compute
its covariance function as
Cx.t;t0/D
Z t
0
Z t0
0
exp.F.t// LCg.;0/ LT exp.F.t00//T d d0:
(12.68)
That is, the Gaussian process–driven spring model is equivalent to a Gaus-
sian process model with the preceding modiﬁed covariance function. In
the LFM framework of Álvarez et al. (2009) and Álvarez et al. (2013) (see
also Hartikainen and Särkkä, 2011; Hartikainen et al., 2012), methods
from Gaussian process regression are then used to infer the parameters of
both the ODE and driving Gaussian process as well as to do predictions of
x.t/ given (noisy) observations of it.
As pointed out by Hartikainen and Särkkä (2011), it is also possible to
use state-space representations discussed in the previous sections to reduce
a Gaussian process driven ODE such as (12.64) into a larger dimensional
ODE driven by white noise, that is, to a linear Itô SDE. This is possible
when the driving Gaussian process has a state-space representation as well.
For example, assume thatg.t/ has a covariance function
Cg.t;t0/D q
2 exp.jtt0j/; (12.69)
which can be recognized as the steady-state covariance function of the
Ornstein–Uhlenbeck process (see Example 6.8). In SDE representation, it
thus corresponds to
dgDg dtC dˇ; g.0/  N.0;P1/; (12.70)
where P1 D Cg.0;0/ D q=.2/ is the steady-state variance of x.t/ .
Thus the following system has the same covariance function in its.x1;x2/
components as the GP-driven spring model (12.64), with g.t/ having the
covarianceCg.t;t0/ as in Equation (12.69):
dx1Dx2 dt;
dx2D2x1 dt
x 2 dtCg dt;
dgDg dtC dˇ;
(12.71)
wherex1.0/D0,x2.0/D0, andg.0/ N.0;P1/.
The preceding system can be written as a state-space SDE as follows:
dQxDQFQx dtCQL dˇ; (12.72)


## Page 280

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
272 Stochastic Differential Equations in Machine Learning
where
QxD
0
@
x1
x2
g
1
A; QFD
0
@
0 1 0
2
 1
 0 0
1
A; and QLD
0
@
0
0
1
1
A: (12.73)
Clearly, the preceding procedure can be applied to any Gaussian process–
driven ODE model, where we can represent the GP in state-space form.
After this conversion, all the SDE methods presented in this book as well
as the Kalman ﬁltering and smoothing solutions are directly applicable.
In particular, the computational methods for linear SDE given in Chapter 6
provide easy computational means to compute the exact discretizations and
covariance functions.
The preceding state-space conversion also works for nonlinear ODE
models, which then turns the GP-driven ODE model into a nonlinear SDE.
Although we no longer get closed form solutions in the same sense as
for linear SDE, we can still apply the various approximation methods dis-
cussed in the previous chapters for approximate inference and covariance
function computation.
In mathematical sense, the LFMs are related to stochastic integrals with
respect to fractional Brownian motions and more general Gaussian pro-
cesses. For more information on the mathematical theory, the reader is re-
ferred to Nualart (2006) and the references therein. These kinds of driving
processes might not have a state-space representation and often they cannot
even sensibly be approximated with a state-space model.
12.8 Gaussian Process Approximation of SDE Solutions
Consider the following continuous-discrete system
dxD f.x;t/ dtC L.t/ dˇ;
ykD h.x.tk//C rk; (12.74)
whereˇ.t/ is a Brownian motion with diffusion Q and rk N.0; R/. The
smoothing solution to problems of this kind was presented in Section 10.8.
Archambeau et al. (2007) present an alternative approach for assessing the
smoothing solution through a variational approximation to the problem.
The method is based on approximating the model by a linear process
dQxDŒA.t/QxC b.t/ dtC L.t/ dˇ; (12.75)


## Page 281

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
12.8 Gaussian Process Approximation of SDE Solutions 273
that is, the actual drift function is replaced by an approximationQf.x;t/ D
A.t/ xC b.t/, where the time-dependent matrix A.t/ and vector b.t/ are
parameters of the approximation.
As we saw in Chapter 6, the solutions to linear SDEs are Gaussian pro-
cesses, and the marginal density given by the approximation is Gaussian
q.x.t//D N.x.t/j m.t/; P.t//. The mean and covariance obey the dif-
ferential equations
dm.t/
dt D A.t/ m.t/C b.t/;
dP.t/
dt D A.t/ P.t/ P.t/ A.t/ TC L.t/ Q LT.t/:
(12.76)
The parameters A.t/ and b.t/ can be estimated by minimizing the
Kullback–Leibler (KL) divergence as follows (Archambeau et al., 2007)
KLŒqkpD
Z T
t0
Eq

e.x.t/;t/ C
X
k
uk.x.t//ı.t tk/

dt; (12.77)
where the expectation is taken with respect to the marginal distribution q,
ı./ denotes the Dirac delta function, and
e.x.t/;t/ D 1
2Œf.x.t/;t/ C A.t/ x.t/ b.t/T ŒL.t/ Q LT.t/1
 Œf.x.t/;t/ C A.t/ x.t/ b.t/;
uk.x.t//D 1
2Œyk h.x.t//T R1 Œyk h.x.t//:
(12.78)
In order to ﬁnd the parameters and the moments, the KL divergence (12.77)
is minimized subject to the constraints given by Equation (12.76). This
problem can be formulated through Lagrange multipliers .t/ and‰.t/,
which gives (see Ala-Luhtala et al., 2015, for a detailed explanation)
d.t/
dt D A.t/.t/r m EqŒe.x.t/;t/;
d‰.t/
dt D‰.t/ A.t/C A.t/ T‰.t/r P EqŒe.x.t/;t/;
(12.79)
A.t/D EqŒFx.x.t/;t/ C2 L.t/ Q LT.t/‰.t/;
b.t/D EqŒf.x.t/;t/ C A.t/ m.t/C L.t/ Q LT.t/.t/;
(12.80)


## Page 282

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
274 Stochastic Differential Equations in Machine Learning
The variational Gaussian process approximation to the smoothing prob-
lem can thus be given in the form of the following algorithm (Archambeau
et al., 2007).
Algorithm 12.13 (Variational approximation of continuous-discrete
smoothing). Initialize A.0/.t/ and b.0/.t/ suitably. ForiD1;2;::: iterate
the following until convergence:
1. Given A.i/.t/ and b.i/.t/, solve the mean and covariance equations
(12.76) forward in time to get m.iC1/.t/ and P.iC1/.t/.
2. Use m.iC1/.t/ and P.iC1/.t/ to solve the Lagrange differential equations
(12.79) backward in time to get.iC1/.t/ and‰.iC1/.t/.
3. The new parameters estimates for the linearized model are given by
A.iC1/.t/D A.i/.t/C
h
A.t/ A.i/.t/
i
;
b.iC1/.t/D b.i/.t/C
h
b.t/ b.i/.t/
i
;
(12.81)
where A.t/ and b.t/ are solved from Equations (12.80) and
2 Œ0;1
is a damping coefﬁcient preventing instability from possibly too large
update steps.
It is worth noting that although the preceding method is based on vari-
ational Bayesian methodology, the resulting approximation is a Gaussian
approximation to the SDE. The relationship with Gaussian assumed den-
sity approximations is discussed in Ala-Luhtala et al. (2015).
12.9 Exercises
12.1 Consider the operator formulation of batch GP regression (12.21), with the
linear operator deﬁned as
Hx.t/D

dx.t/
dt
ˇˇ
tDt1
::: dx.t/
dt
ˇˇ
tDtn

and the covariance functions being of the Matérn class as given in Equa-
tion (12.48) (forD 3=2 ). Derive the covariance function corresponding to
the “derivative observations” model deﬁned by the operator.
12.2 The SDE corresponding to the Matérn covariance function with D 3=2
was given in Example 12.7. Derive (starting from the spectral density
function) the corresponding expression for the Matérn covariance function
(12.33) withD 5=2 .
12.3 The squared exponential covariance function:
(a) Why is it not possible to write an exact ﬁnite-dimensional SDE model
for the squared exponential covariance function?


## Page 283

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Exercises 275
(b) The squared exponential covariance function has the spectral density
function
S.!/D2p
2` exp

`2!2
2

:
Approximate this function by a rational function by forming a Taylor
series expansion in the denominator.
(c) Factor the rational function into an unstable and stable part correspond-
ing to the transfer function (see, e.g., Särkkä et al., 2013).
(d) Form the so-called companion matrix corresponding to the linear SDE
drift function by truncating the series and collecting the coefﬁcients.
Truncate your model so that you end up with a six-dimensional SDE
model.
(e) Compare numerically the covariance function of the state-space model
to the original squared exponential covariance function.
12.4 The periodic covariance function:
(a) Derive an expression for the spectral density of the canonical periodic
covariance function given in Equation (12.41).
(b) Consider approximating the behavior of the periodic covariance func-
tion with a superposition of n stochastic oscillators with feedback ma-
trices
FjD
 0 !0j
!0j 0

; (12.82)
zero diffusion, and a stationary covariances P1;j D q2
j I2. Derive the
expression for q2
j for matching the spectral densities of the oscillators
and the original covariance function.
(c) Simulate from the SDE you obtained by solving the LTI SDE model
and compare to realizations directly simulated from a Gaussian with a
covariance matrix formed by evaluating the original periodic covariance
function.
12.5 Expand the model obtained in the previous exercise to produce quasiperiodic
realizations such as what you would obtain by considering the covariance
function given by
Cquasiperiodic.t;t0/DCperiodic.t;t0/C exp.t;t0/: (12.83)
Derive a truncated LTI SDE approximation for the quasiperiodic covari-
ance function. Simulate trajectories from the model that demonstrate the
quasiperiodic behavior.
12.6 Consider the polynomial covariance function for pD 2. Derive the SDE
model corresponding to this covariance function.
12.7 Gaussian process regression:


## Page 284

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
276 Stochastic Differential Equations in Machine Learning
(a) Draw 10 random points from a Gaussian with an exponential (Ornstein–
Uhlenbeck) covariance structure. Choose your parameters for the mag-
nitude, length scale, and measurement noise variance as you see ﬁt, and
start by ﬁrst drawing the 10 input locations uniformly from the interval
Œ0;1 . Add independent Gaussian measurement noise to your realization
trajectory.
(b) Implement batch Gaussian process regression for an exponential covari-
ance function model, where you use the data you just simulated. Visu-
alize your result by plotting the mean and marginal variance over Œ01
with 100 discretization points.
(c) The corresponding SDE model was given in Example 12.7. Write the
closed-form discrete-time state-space model for this SDE.
(d) Implement the sequential way of solving the GP regression problem by
Kalman ﬁltering and Rauch–Tung–Striebel smoothing (refer to Chap-
ter 10 for implementation details). Check numerically that you get the
same solution (up to minor numerical errors) as in the batch solution.


## Page 285

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
13
Epilogue
We are now reaching the end of this book and it is time to summarize
and discuss what is there beyond this book. In this chapter, we ﬁrst take a
brief outlook to each of the topics, then discuss the selection of numerical
methods, and ﬁnally discuss some more advanced aspects that we have not
discussed here.
13.1 Overview of the Covered Topics
First of all, let us take another look at a generic form of SDEs that we have
studied for the whole book:
dxD f.x;t/ dtC L.x;t/ dˇ: (13.1)
In the early chapters of the book, we started by interpreting SDEs as white
noise–driven differential equations, which corresponds to formally divid-
ing the preceding equation with the differential dt:
dx
dt D f.x;t/C L.x;t/ dˇ
dt; (13.2)
and interpreting w.t/ D dˇ.t/=dt as white noise. It did work up to a
point, but in the end we had to redeﬁne SDEs as Itô integral equations, for
which Equation (13.1) is a shorthand notation. However, until the end we
were still allowed to build models of real-world phenomena by thinking of
white noise–driven differential equations such as Equation (13.2), which is
ﬁne, provided that we realize that mathematically it means Equation (13.1).
After deﬁning what we mean by an SDE, we then took a look at prob-
ability distributions, moments, Markov properties, and many other aspects
of SDEs. One of the most important tools was the Itô formula that we could
use to derive many of the results. We also took a more careful look at lin-
ear SDEs (with f.x;t/ D F.t/ xC u.t/ and L.x;t/ D L.t/), which we
can solve explicitly and whose statistics and probability distribution can be
277


## Page 286

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
278 Epilogue
computed easily. Additionally, we discussed more advanced concepts re-
lated to transformations, construction, and advanced applications of SDEs.
For nonlinear SDEs, we had to conclude that they do not allow for any
general solution methods and the only way to go is to numerically ap-
proximate them. We took a look at Itô–Taylor and stochastic Runge–Kutta
methods for numerically simulating SDE solutions along with a few more
speciﬁc methods (the Exact algorithm and Verlet methods). After that, we
discussed various methods that can be used to approximate the statistics
of SDE solutions. Especially Gaussian and linearization approximations
turned out to be common in this context, but various series expansion meth-
ods are available as well.
In the ﬁnal chapters, we discussed applications aspects of SDEs, which
included ﬁltering and smoothing theory, parameter estimation, and ma-
chine learning. These chapters very strongly leaned on the theory and meth-
ods that we discussed in the preceding chapters. Especially the numerical
methods were in very intensive use, and we could even say that it is the
performance of the SDE numerical methods that determines the success of
these applications.
13.2 Choice of SDE Solution Method
We could now ask the important question, “Which numerical method
should I choose to solve a given SDE?” but it is hard to answer. It not only
depends on the SDE, but also on the application, that is, on what you want
to do with the SDE. If the interest is in sample paths and their statistics
as such, then one should use the numerical simulation methods. Probably
the ﬁrst attempt should always be the Euler–Maruyama method – it scales
badly, but is easy to implement and provides a useful reference solution.
With more sophisticated methods, it makes a huge difference whether the
dispersion matrix L.x;t/ depends on the state x or not. Attempting to sim-
ulate strong solutions with state-dependent dispersion matrix is hard, be-
cause we encounter problematic iterated Itô integrals already in low-order
numerical methods. However, if weak solutions are enough, then we have
a selection of methods to apply even in the state-dependent case.
If we are only interested in approximating the statistics of SDEs, then
the state dependence of the dispersion matrix is not so much of a prob-
lem. In many applications, (local) Gaussian approximations are enough,
and we have a wide selection of them to choose from. A Gaussian approx-
imation should indeed be the ﬁrst attempt for this purpose – recall that
Euler–Maruyama is a Gaussian approximation as well, and even that can


## Page 287

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
13.3 Beyond the Topics 279
be tried. However, for example, linearization methods are likely to perform
better if we are only interested in the statistics, not sample paths of SDEs. If
higher-order approximations are needed, then we can use Fourier–Hermite
or Wong–Zakai series, or approximate the Fokker–Planck–Kolmogorov
PDE using numerical methods for PDEs. But everything depends on the
application.
13.3 Beyond the Topics
One important direction that we have not touched are jump process–driven
SDEs. They result from replacing the Brownian motion in (13.1) with some
other stochastic process.t/, which is not continuous, but has jumps:
dxD f.x;t/ dtC L.x;t/ d: (13.3)
We can, for example, model the process .t/ as a Lévy process, which
then leads to Lévy process–driven SDEs and the related stochastic calculus.
More information on this kind of processes and their numerical treatment
can be found, for example, in the books of Applebaum (2009) and Platen
and Bruti-Liberati (2010).
Instead of replacing the Brownian motion with a Lévy process, we can
also replace it with, for example, fractional Brownian motion or some more
general Gaussian process, as we already discussed in Section 12.7. For
the related mathematical theory, the reader is referred to Nualart (2006).
However, as discussed in Section 12.7, when the driving Gaussian process
has a rational spectrum, then such an SDE is equivalent to an SDE with a
few additional augmented states.
Another extension that we already considered in Section 12.5 is the ex-
tension to spatiotemporal models. One way to think about them is to as-
sume that the state depends on a space location r as in the model (12.56).
However, we can also directly consider abstract equations of the form
dXD FŒX;t dtC LŒX;t dB; (13.4)
where the state X and the inﬁnite-dimensional Brownian motionB live in
a suitable Hilbert space. For the theory of this type of process, the reader is
referred to Da Prato and Zabczyk (2014).
Finally, one possible extension is to consider stochastic control prob-
lems (e.g., Maybeck, 1982b; Stengel, 1994; Øksendal, 2003; Øksendal and
Sulem, 2007) related to SDEs. Certainly, this can also be seen as applica-
tion of SDEs, but stochastic control theory is an independent ﬁeld as such.


## Page 288

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
280 Epilogue
The idea is to include control signal u.t/ to the SDE
dxD f.x; u;t/ dtC L.x;t/ dˇ; (13.5)
which we can then “connect” back to x directly or via noisy observations
to yield a close-loop control for the process. The control can be chosen
to, for example, make the SDE follow a given trajectory or hit a certain
target stage while minimizing a cost function. These kinds of models have
applications both in navigation and ﬁnance – in navigation, we might be at-
tempting to steer a rocket to hit the moon with minimum fuel or to keep an
autonomous car on the road, while in ﬁnance we might steer our portfolio
to the maximum proﬁtable stage.


## Page 289

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References
Aihara, S. I. and Bagchi, A. 1999. On the Mortensen equation for maximum likelihood
state estimate. IEEE Transactions on Automatic Control, 44(10), 1955–1961. (Cited
on page 205.)
Aït-Sahalia, Y . 2002. Maximum likelihood estimation of discretely sampled diffusions:
A closed-form approximation approach. Econometrica, 70(1), 223–262. (Cited on
pages 179, 183, 184, and 185.)
Aït-Sahalia, Y . 2008. Closed-form likelihood expansions for multivariate diffusions.
Annals of Statistics, 36(2), 906–937. (Cited on pages 179, 183, and 184.)
Akhiezer, N. I. and Glazman, I. M. 1993. Theory of Linear Operators in Hilbert Space.
New York, NY: Dover. (Cited on page 253.)
Ala-Luhtala, J., Särkkä, S., and Piché, R. 2015. Gaussian ﬁltering and variational ap-
proximations for Bayesian smoothing in continuous-discrete stochastic dynamic sys-
tems. Signal Processing, 111, 124–136. (Cited on pages 166, 273, and 274.)
Allen, M. P. and Tildesley, D. J. 1991. Computer Simulation of Liquids . New York,
NY: Oxford University Press. (Cited on page 156.)
Álvarez, M., Luengo, D., and Lawrence, N. 2009. Latent force models. Pages 9–16 of:
van Dyk, D. and Welling, M. (eds.), Proceedings of the Twelth International Con-
ference on Artiﬁcial Intelligence and Statistics. Proceedings of Machine Learning
Research, vol. 5. Clearwater Beach, FL: PMLR. (Cited on pages 270 and 271.)
Álvarez, M. A., Rosasco, L., and Lawrence, N. D. 2012. Kernels for vector-valued
functions: a review.Foundations and TrendsR
 in Machine Learning, 4(3), 195–266.
(Cited on page 254.)
Álvarez, M. A., Luengo, D., and Lawrence, N. D. 2013. Linear latent force models
using Gaussian processes. IEEE Transactions on Pattern Analysis and Machine
Intelligence, 35(11), 2693–2705. (Cited on pages 270 and 271.)
Anderson, B. D. O. 1972. Fixed interval smoothing for nonlinear continuous time
systems. Information and Control, 20(3), 294–300. (Cited on page 227.)
Applebaum, D. 2009. Lévy Processes and Stochastic Calculus . Second edn. Cam-
bridge: Cambridge University Press. (Cited on pages 35 and 279.)
Arasaratnam, I. and Haykin, S. 2009. Cubature Kalman ﬁlters. IEEE Transactions on
Automatic Control, 54(6), 1254–1269. (Cited on page 169.)
Arasaratnam, I., Haykin, S., and Hurd, T. R. 2010. Cubature Kalman ﬁltering for
continuous-discrete systems: theory and simulations. IEEE Transactions on Signal
Processing, 58(10), 4977–4993. (Cited on pages 135 and 169.)
281


## Page 290

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
282 References
Archambeau, C. and Opper, M. 2011. Approximate inference for continuous-time
Markov processes. Pages 125–140 of: Bayesian Time Series Models . New York,
NY: Cambridge University Press. (Cited on pages 166, 168, 245, and 249.)
Archambeau, C., Cornford, D., Opper, M., and Shawe-Taylor, J. 2007. Gaussian pro-
cess approximations of stochastic differential equations. Pages 1–16 of: Lawrence,
N. D., Schwaighofer, A., and Quiñonero Candela, J. (eds.), Gaussian Processes in
Practice. Proceedings of Machine Learning Research, vol. 1. Bletchley Park, UK:
PMLR. (Cited on pages 272, 273, and 274.)
Åström, K. J. and Wittenmark, B. 1997. Computer-Controlled Systems: Theory and
Design. Third edn. Upper Saddle River, NJ: Prentice Hall. (Cited on page 9.)
Axelsson, P. and Gustafsson, F. 2015. Discrete-time solutions to the continuous-time
differential Lyapunov equation with applications to Kalman ﬁltering. IEEE Trans-
actions on Automatic Control, 60(3), 632–643. (Cited on pages 81, 83, and 84.)
Bar-Shalom, Y ., Li, X.-R., and Kirubarajan, T. 2001. Estimation with Applications to
Tracking and Navigation. New York, NY: Wiley. (Cited on pages 29 and 82.)
Bell, B. M. 1994. The iterated Kalman smoother as a Gauss–Newton method. SIAM
Journal on Optimization, 4(3), 626–636. (Cited on pages 221 and 229.)
Bell, B. M. and Cathey, F. W. 1993. The iterated Kalman ﬁlter update as a Gauss–
Newton method. IEEE Transactions on Automatic Control, 38(2), 294–297. (Cited
on page 221.)
Beneš, V . E. 1981. Exact ﬁnite-dimensional ﬁlters for certain diffusions with nonlinear
drift. Stochastics, 5(1–2), 65–92. (Cited on page 207.)
Beskos, A. and Roberts, G. O. 2005. Exact simulation of diffusions. Annals of Applied
Probability, 15(4), 2422–2444. (Cited on pages 157 and 160.)
Beskos, A., Papaspiliopoulos, O., Roberts, G., and Fearnhead, P. 2006a. Exact and
computationally efﬁcient likelihood-based estimation for discretely observed diffu-
sion processes (with discussion). Journal of the Royal Statistical Society: Series B
(Statistical Methodology), 68(3), 333–382. (Cited on pages 111, 157, and 160.)
Beskos, A., Papaspiliopoulos, O., and Roberts, G. O. 2006b. Retrospective exact sim-
ulation of diffusion sample paths with applications. Bernoulli, 12(6), 1077–1098.
(Cited on pages 157 and 160.)
Beskos, A., Papaspiliopoulos, O., and Roberts, G. O. 2008. A factorisation of diffusion
measure and ﬁnite sample path.Methodology and Computing in Applied Probability,
10(1), 85–104. (Cited on pages 157 and 160.)
Bishop, C. M. 2006. Pattern Recognition and Machine Learning . New York, NY:
Springer. (Cited on page 251.)
Brandt, M. W. and Santa-Clara, P. 2002. Simulated likelihood estimation of diffusions
with an application to exchange rate dynamics in incomplete markets. Journal of
Financial Economics, 63(2), 161–210. (Cited on page 192.)
Brenner, S. and Scott, R. 2002. The Mathematical Theory of Finite Element Methods .
Second edn. Texts in Applied Mathematics, vol. 15. New York, NY: Springer. (Cited
on pages 185 and 189.)
Brigo, D., Hanzon, B., and Le Gland, F. 1999. Approximate nonlinear ﬁltering by
projection on exponential manifolds of densities. Bernoulli, 5(3), 495–534. (Cited
on page 173.)


## Page 291

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References 283
Brooks, S., Gelman, A., Jones, G. L., and Meng, X.-L. 2011. Handbook of Markov
Chain Monte Carlo. Boca Raton, FL: Chapman & Hall/CRC. (Cited on pages 237,
238, and 242.)
Bucy, R. S. 1965. Nonlinear ﬁltering theory.IEEE Transactions on Automatic Control,
10(2), 198–198. (Cited on page 206.)
Burrage, K., Burrage, P., Higham, D. J., Kloeden, P. E., and Platen, E. 2006. Comment
on “Numerical methods for stochastic differential equations”. Physical Review E,
74(6), 068701. (Cited on page 145.)
Burrage, K., Lenane, I., and Lythe, G. 2007. Numerical methods for second-order
stochastic differential equations. SIAM Journal on Scientiﬁc Computing, 29(1), 245–
264. (Cited on page 155.)
Cameron, R. H. and Martin, W. T. 1947. The orthogonal development of non-linear
functionals in series of Fourier–Hermite functionals. Annals of Mathematics, 48(2),
385–392. (Cited on page 194.)
Cappé, O., Moulines, E., and Rydén, T. 2005. Inference in Hidden Markov Models .
Springer Series in Statistics. New York, NY: Springer-Verlag. (Cited on pages 234
and 247.)
Chaichian, M. and Demichev, A. 2001a. Path Integrals in Physics, Volume 1: Stochas-
tic Processes and Quantum Mechanics . Bristol, UK: IOP Publishing. (Cited on
pages 101, 105, and 117.)
Chaichian, M. and Demichev, A. 2001b.Path Integrals in Physics, Volume 2: Quantum
Field Theory, Statistical Physics & Other Modern Applications . Bristol, UK: IOP
Publishing. (Cited on page 105.)
Chow, C. C. and Buice, M. A. 2015. Path integral methods for stochastic differential
equations. Journal of Mathematical Neuroscience, 5(1), 8. (Cited on page 118.)
Chow, P.-L. 2007. Stochastic Partial Differential Equations. Chapman & Hall/CRC
Applied Mathematics and Nonlinear Science Series, vol. 11. Boca Raton, FL, and
London: Chapman & Hall/CRC Press. (Cited on page 268.)
Cover, T. M. and Thomas, J. A. 2006. Elements of Information Theory . Second edn.
Hoboken, NJ: John Wiley & Sons. (Cited on pages 73 and 246.)
Crisan, D. and Rozovskiˇı, B. L. (eds.). 2011. The Oxford Handbook of Nonlinear Fil-
tering. Oxford and New York, NY: Oxford University Press. (Cited on pages 111,
197, and 209.)
Da Prato, G. and Zabczyk, J. 2014. Stochastic Equations in Inﬁnite Dimensions. Sec-
ond edn. Encyclopedia of Mathematics and its Applications, vol. 152. Cambridge:
Cambridge University Press. (Cited on pages 253, 267, and 279.)
Daum, F. E. 1984. Exact ﬁnite-dimensional nonlinear ﬁlters for continuous time pro-
cesses with discrete time measurements. Pages 16–22 of: Proceedings of the 23rd
Conference on Decision and Control. Piscataway, NJ: IEEE. (Cited on page 215.)
Doucet, A. 2010. A Note on Efﬁcient Conditional Simulation of Gaussian Distribu-
tions. Technical note. Departments of Computer Science and Statistics, University
of British Columbia, Canada. (Cited on page 266.)
Dutra, D. A., Teixeira, B. O. S., and Aguirre, L. A. 2014. Maximum a posteriori state
path estimation: Discretization limits and their interpretation. Automatica, 50(5),
1360–1368. (Cited on pages 204 and 205.)


## Page 292

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
284 References
Einstein, A. 1905. Über die von molekularkinetischen Theorie der Wärme geforderte
Bewegung von in ruhenden Flüssigkeiten suspendierten Teilchen. Annalen der
Physik, 17, 549–560. (Cited on page 23.)
Feynman, R. P. and Hibbs, A. R. 2010. Quantum Mechanics and Path Integrals .
Emended by Daniel F. Styer edn. New York, NY: Dover. (Cited on page 117.)
Frigola, R., Lindsten, F., Schön, T. B., and Rasmussen, C. E. 2013. Bayesian inference
and learning in Gaussian process state-space models with particle MCMC. Pages
3156–3164 of: Burges, C. J. C., Bottou, L., Welling, M., Ghahramani, Z., and Wein-
berger, K. Q. (eds.), Advances in Neural Information Processing Systems 26 . Red
Hook, NY: Curran Associates, Inc. (Cited on page 269.)
García-Fernández, Á. F., Svensson, L., Morelande, M. R., and Särkkä, S. 2015. Poste-
rior linearization ﬁlter: principles and implementation using sigma points. IEEE
Transactions on Signal Processing , 63(20), 5561–5573. (Cited on pages 174
and 221.)
García-Fernández, Á. F., Svensson, L., and Särkkä, S. 2017. Iterated posterior lineariza-
tion smoother. IEEE Transactions on Automatic Control, 62(4), 2056–2063. (Cited
on pages 174, 221, 229, and 245.)
Gardiner, C. W. 2004. Handbook of Stochastic Methods. Third edn. Berlin: Springer.
(Cited on pages 51 and 64.)
Gelb, A. (ed.). 1974. Applied Optimal Estimation. Cambridge, MA: MIT Press. (Cited
on pages 167, 209, and 222.)
Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., and Rubin, D. B.
2013. Bayesian Data Analysis. Third edn. Boca Raton, FL: Chapman and Hall/CRC.
(Cited on pages 237 and 242.)
Gilsing, H. and Shardlow, T. 2007. SDELab: A package for solving stochastic differ-
ential equations in MATLAB. Journal of Computational and Applied Mathematics,
205(2), 1002–1018. (Cited on page 148.)
Girolami, M. and Calderhead, B. 2011. Riemann manifold Langevin and Hamiltonian
Monte Carlo methods. Journal of the Royal Statistical Society: Series B (Statistical
Methodology), 73(2), 123–214. (Cited on page 75.)
Girsanov, I. V . 1960. On transforming a certain class of stochastic processes by abso-
lutely continuous substitution of measures. Theory of Probability and Its Applica-
tions, 5(3), 285–301. (Cited on pages 104 and 107.)
Grewal, M. S. and Andrews, A. P. 2001. Kalman Filtering, Theory and Practice Using
MATLAB. New York, NY: Wiley. (Cited on pages 29, 77, 79, 82, and 83.)
Hairer, E., Nørsett, S. P., and Wanner, G. 2008. Solving Ordinary Differential Equa-
tions I: Nonstiff Problems . Springer Series in Computational Mathematics, vol. 1.
Berlin: Springer Science & Business. (Cited on page 4.)
Hartikainen, J. and Särkkä, S. 2010. Kalman ﬁltering and smoothing solutions to tem-
poral Gaussian process regression models. Pages 379–384 of: Proceedings of the
IEEE International Workshop on Machine Learning for Signal Processing (MLSP).
Piscataway, NJ: IEEE. (Cited on pages 251, 260, 261, and 266.)
Hartikainen, J. and Särkkä, S. 2011. Sequential inference for latent force models. Pages
311–318 of: Proceedings of the 27th Conference on Uncertainty in Artiﬁcial Intelli-
gence (UAI). Corvallis, OR: AUAI Press. (Cited on pages 251, 266, 270, and 271.)


## Page 293

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References 285
Hartikainen, J., Seppänen, M., and Särkkä, S. 2012. State-space inference for non-linear
latent force models with application to satellite orbit prediction. Pages 903–910 of:
Langford, J. and Pineau, J. (eds.), Proceedings of the 29th International Conference
on Machine Learning (ICML) . New York, NY: Omnipress. (Cited on pages 270
and 271.)
Henderson, D. and Plaschko, P. 2006. Stochastic Differential Equations in Science and
Engineering. Singapore: World Scientiﬁc Publishing Company. (Cited on page 54.)
Higham, N. J. 2008. Functions of Matrices: Theory and Computation . Philadelphia,
PA: Society for Industrial and Applied Mathematics. (Cited on page 265.)
Iacus, S. M. 2008. Simulation and Inference for Stochastic Differential Equations. New
York, NY: Springer. (Cited on pages 54, 98, 157, 175, 181, 183, 192, 234, and 248.)
Ikeda, N. and Watanabe, S. 1981. Stochastic Differential Equations and Diffusion
Processes. Amsterdam: North-Holland Publishing Company. (Cited on pages 54
and 204.)
Itô, K. 1951. Multiple Wiener integral. Journal of the Mathematical Society of Japan,
3(1), 157–169. (Cited on page 136.)
Ito, K. and Xiong, K. 2000. Gaussian ﬁlters for nonlinear ﬁltering problems. IEEE
Transactions on Automatic Control, 45(5), 910–927. (Cited on page 169.)
Jazwinski, A. H. 1970. Stochastic Processes and Filtering Theory . New York, NY:
Academic Press. (Cited on pages 29, 69, 168, 170, 197, 205, 209, 219, 222, and 247.)
Jeisman, J. 2005. Estimation of the Parameters of Stochastic Differential Equations .
Ph.D. thesis, Queensland University of Technology, Brisbane, Australia. (Cited on
page 234.)
Julier, S. J. and Uhlmann, J. K. 2004. Unscented ﬁltering and nonlinear estimation.
Proceedings of the IEEE, 92(3), 401–422. (Cited on page 169.)
Julier, S. J., Uhlmann, J. K., and Durrant-Whyte, H. F. 1995. A new approach for
ﬁltering nonlinear systems. Pages 1628–1632 of:Proceedings of the 1995 American
Control Conference. Piscataway, NJ: IEEE. (Cited on page 169.)
Kalman, R. E. 1960. A new approach to linear ﬁltering and prediction problems.
Transactions of the ASME, Journal of Basic Engineering , 82(3), 35–45. (Cited on
page 216.)
Kalman, R. E. and Bucy, R. S. 1961. New results in linear ﬁltering and prediction
theory. Transactions of the ASME, Journal of Basic Engineering , 83(3), 95–108.
(Cited on page 208.)
Karatzas, I. and Shreve, S. E. 1991. Brownian Motion and Stochastic Calculus. New
York, NY: Springer-Verlag. (Cited on pages ix, 42, 46, 47, 50, 60, 100, 101, and 104.)
Kessler, M. 1997. Estimation of an ergodic diffusion from discrete observations. Scan-
dinavian Journal of Statistics, 24(2), 211–229. (Cited on pages 179 and 181.)
Kloeden, P. E. and Platen, E. 1999.Numerical Solution to Stochastic Differential Equa-
tions. Applications of mathematics, vol. 23. New York, NY: Springer. (Cited on
pages 51, 52, 53, 54, 129, 132, 133, 137, 138, 145, 150, 151, and 153.)
Kloeden, P. E., Platen, E., and Schurz, H. 1994. Numerical Solution of SDE Through
Computer Experiments. Berlin: Springer. (Cited on pages 129, 145, and 150.)
Kokkala, J., Solin, A., and Särkkä, S. 2016. Sigma-point ﬁltering and smoothing based
parameter estimation in nonlinear dynamic systems. Journal of Advances in Infor-
mation Fusion, 11(1), 15–30. (Cited on page 249.)


## Page 294

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
286 References
Kreyszig, E. 1993. Advanced Engineering Mathematics. New York, NY: John Wiley
& Sons, Inc. (Cited on pages 4, 13, and 185.)
Kushner, H. J. 1964. On the differential equations satisﬁed by conditional probabil-
ity densities of Markov processes, with applications. Journal of the Society for
Industrial and Applied Mathematics, Series A: Control , 2(1), 106–119. (Cited on
page 206.)
Kushner, H. J. 1967. Approximations to optimal nonlinear ﬁlters. IEEE Transactions
on Automatic Control, 12(5), 546–556. (Cited on page 166.)
Langevin, P. 1908. Sur la théorie du mouvement brownien (Engl. On the Theory of
Brownian Motion). Comptes-rendus de l’Académie des sciences (Paris), 146, 530–
533. (Cited on page 26.)
Leondes, C. T., Peller, J. B., and Stear, E. B. 1970. Nonlinear smoothing theory. IEEE
Transactions on Systems Science and Cybernetics, 6(1), 63–71. (Cited on pages 225
and 229.)
Liu, J. S. 2001. Monte Carlo Strategies in Scientiﬁc Computing . Springer Series in
Statistics. New York, NY: Springer. (Cited on page 237.)
Loève, M. 1963. Probability Theory II. Springer-Verlag. (Cited on page 103.)
Luenberger, D. G. and Ye, Y . 2008. Linear and Nonlinear Programming . Third edn.
New York, NY: Springer. (Cited on pages 237, 241, and 242.)
Luo, W. 2006. Wiener Chaos Expansion and Numerical Solutions of Stochastic Partial
Differential Equations. Ph.D. thesis, California Institute of Technology, Pasadena,
CA. (Cited on pages 104, 193, and 194.)
Lyons, S. M. J., Särkkä, S., and Storkey, A. J. 2014. Series expansion approximations
of Brownian motion for non-linear Kalman ﬁltering of diffusion processes. IEEE
Transactions on Signal Processing, 62(6), 1514–1524. (Cited on page 194.)
Lyons, S. M., Storkey, A. J., and Särkkä, S. 2012. The coloured noise expansion and pa-
rameter estimation of diffusion processes. Pages 1952–1960 of: Pereira, F., Burges,
C. J. C., Bottou, L., and Weinberger, K. Q. (eds.), Advances in Neural Information
Processing Systems 25. Red Hook, NY: Curran Associates, Inc. (Cited on page 194.)
MacKay, D. J. 1998. Introduction to Gaussian processes. Pages 133–166 of: Bishop,
C. M. (ed.), Neural Networks and Machine Learning. NATO ASI Series F Computer
and Systems Sciences, vol. 168. Berlin: Springer. (Cited on page 251.)
Maybeck, P. S. 1979. Stochastic Models, Estimation and Control. V ol. 1. New York,
NY: Academic Press. (Cited on page 197.)
Maybeck, P. S. 1982a. Stochastic Models, Estimation and Control. V ol. 2. New York,
NY: Academic Press. (Cited on pages 168, 174, 197, 219, and 222.)
Maybeck, P. S. 1982b. Stochastic Models, Estimation and Control. V ol. 3. New York,
NY: Academic Press. (Cited on page 279.)
Mbalawata, I. S. 2014.Adaptive Markov Chain Monte Carlo and Bayesian Filtering for
State Space Models. Doctoral dissertation, Lappeenranta University of Technology,
Lappeenranta, Finland. (Cited on page 234.)
Mbalawata, I. S., Särkkä, S., and Haario, H. 2013. Parameter estimation in stochastic
differential equations with Markov chain Monte Carlo and non-linear Kalman ﬁlter-
ing. Computational Statistics, 28(3), 1195–1223. (Cited on pages 241, 247, 248,
and 250.)
McNamee, J. and Stenger, F. 1967. Construction of fully symmetric numerical integra-
tion formulas. Numerische Mathematik, 10(4), 327–344. (Cited on page 169.)


## Page 295

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References 287
Mercer, J. 1909. Functions of positive and negative type, and their connection with
the theory of integral equations. Philosophical Transactions of the Royal Society of
London A: Mathematical, Physical and Engineering Sciences , 209(441–458), 415–
446. (Cited on page 103.)
Møller, J. K. and Madsen, H. 2010. From State Dependent Diffusion to Constant Dif-
fusion in Stochastic Differential Equations by the Lamperti Transform . Tech. rept.
Technical University of Denmark, Lyngby, Denmark. (Cited on pages 98 and 99.)
Nickisch, H., Solin, A., and Grigorevskiy, A. 2018. State space Gaussian processes
with non-Gaussian likelihood. Pages 3789–3798 of: Dy, J. and Krause, A. (eds.),
Proceedings of the 35th International Conference on Machine Learning (ICML) .
Proceedings of Machine Learning Research, vol. 80. Stockholm, Sweden: PMLR.
(Cited on page 251.)
Nielsen, J. N., Madsen, H., and Young, P. C. 2000. Parameter estimation in stochastic
differential equations: an overview. Annual Reviews in Control, 24, 83–94. (Cited
on page 234.)
Nualart, D. 2006. The Malliavin Calculus and Related Topics . Probability and Its
Applications. Berlin and New York, NY: Springer. (Cited on pages 42, 272, and 279.)
O’Hagan, A. 1978. Curve ﬁtting and optimal design for prediction (with discussion).
Journal of the Royal Statistical Society. Series B (Methodological) , 40(1), 1–42.
(Cited on page 251.)
Øksendal, B. 2003. Stochastic Differential Equations: An Introduction with Applica-
tions. Sixth edn. New York, NY: Springer. (Cited on pages ix, 29, 42, 46, 47, 55, 56,
59, 60, 68, 104, 108, 118, 121, and 279.)
Øksendal, B. and Sulem, A. 2007. Applied Stochastic Control of Jump Diffusions .
Second edn. Berlin: Springer. (Cited on page 279.)
Ozaki, T. 1992. A bridge between nonlinear time series models and nonlinear stochastic
dynamical systems: a local linearization approach. Statistica Sinica, 2(1), 113–135.
(Cited on pages 173, 175, and 177.)
Ozaki, T. 1993. A local linearization approach to nonlinear ﬁltering. International
Journal of Control, 57(1), 75–96. (Cited on pages 173, 175, and 177.)
Papoulis, A. 1984. Probability, Random Variables, and Stochastic Processes. Singa-
pore: McGraw-Hill. (Cited on page 167.)
Pardoux, E. and R˘a¸ scanu, A. 2014.Stochastic Differential Equations, Backward SDEs,
Partial Differential Equations. Stochastic Modelling and Applied Probability, vol.
69. Berlin: Springer. (Cited on pages 118, 120, 121, and 122.)
Pedersen, A. R. 1995. New approach to maximum likelihood estimation for stochas-
tic differential equations based on discrete observations. Scandinavian Journal of
Statistics, 22(1), 55–71. (Cited on page 192.)
Piiroinen, P. and Simon, M. 2016. From Feynman–Kac formulae to numerical stochas-
tic homogenization in electrical impedance tomography. Annals of Applied Proba-
bility, 26(5), 3001–3043. (Cited on pages 118, 120, and 121.)
Platen, E. and Bruti-Liberati, N. 2010. Numerical Solution of Stochastic Differential
Equations with Jumps in Finance . Stochastic Modelling and Applied Probability,
vol. 64. Berlin: Springer. (Cited on page 279.)
Protter, P. E. 2013. Stochastic Integration and Differential Equations . Second edn.
Berlin: Springer. (Cited on pages 55 and 56.)


## Page 296

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
288 References
Rao, B. L. S. P. 1999. Statistical Inference for Diffusion Type Processes . Kendall’s
Library of Statistics, vol. 8. Chichester: Wiley. (Cited on pages 175, 181, 183, 234,
248, and 249.)
Rasmussen, C. E. and Williams, C. K. 2006.Gaussian Processes for Machine Learning.
Cambridge, MA: MIT Press. (Cited on pages 251, 252, 254, 259, 264, and 265.)
Rogers, L. C. G. and Williams, D. 2000a. Diffusions, Markov Processes and Mar-
tingales, Volume 1: Foundations. Cambridge Mathematical Library. Cambridge:
Cambridge University Press. (Cited on pages 59, 60, 101, 104, and 113.)
Rogers, L. C. G. and Williams, D. 2000b. Diffusions, Markov Processes and Mar-
tingales, Volume 2: Itô Calculus . Cambridge Mathematical Library. Cambridge:
Cambridge University Press. (Cited on pages 59, 60, 113, and 116.)
Rößler, A. 2006. Runge–Kutta methods for Itô stochastic differential equations with
scalar noise. BIT Numerical Mathematics, 46(1), 97–110. (Cited on page 150.)
Rößler, A. 2009. Second order Runge–Kutta methods for Itô stochastic differential
equations. SIAM Journal on Numerical Analysis , 47(3), 1713–1738. (Cited on
pages 151 and 153.)
Rößler, A. 2010. Runge–Kutta methods for the strong approximation of solutions of
stochastic differential equations. SIAM Journal on Numerical Analysis, 48(3), 922–
952. (Cited on pages 146 and 148.)
Ruttor, A., Batz, P., and Opper, M. 2013. Approximate Gaussian process inference for
the drift function in stochastic differential equations. Pages 2040–2048 of: Burges,
C. J. C., Bottou, L., Welling, M., Ghahramani, Z., and Weinberger, K. Q. (eds.),
Advances in Neural Information Processing Systems 26 . Red Hook, NY: Curran
Associates, Inc. (Cited on pages 249, 268, and 269.)
Särkkä, S. 2006. Recursive Bayesian Inference on Stochastic Differential Equations .
Doctoral dissertation, Helsinki University of Technology, Espoo, Finland. (Cited on
pages 79, 82, 83, 84, 197, 219, 222, and 224.)
Särkkä, S. 2007. On unscented Kalman ﬁltering for state estimation of continuous-time
nonlinear systems. IEEE Transactions on Automatic Control , 52(9), 1631–1641.
(Cited on pages 209, 211, and 222.)
Särkkä, S. 2011. Linear operators and stochastic partial differential equations in Gaus-
sian process regression. Pages 151–158 of: Honkela, T., Duch, W., Girolami, M., and
Kaski, S. (eds.), Artiﬁcial Neural Networks and Machine Learning – ICANN 2011.
Lecture Notes in Computer Science, vol. 6792. Berlin and Heidelberg: Springer.
(Cited on page 256.)
Särkkä, S. 2013. Bayesian Filtering and Smoothing. Institute of Mathematical Statistics
Textbooks, vol. 3. Cambridge: Cambridge University Press. (Cited on pages 68, 79,
82, 83, 168, 169, 197, 202, 203, 206, 212, 213, 216, 219, 221, 222, 224, 228, 229,
232, 234, 237, 247, 248, and 249.)
Särkkä, S. and Hartikainen, J. 2012. Inﬁnite-dimensional Kalman ﬁltering approach to
spatio-temporal Gaussian process regression. Pages 993–1001 of: Lawrence, N. D.
and Girolami, M. (eds.), Proceedings of the Fifteenth International Conference on
Artiﬁcial Intelligence and Statistics. Proceedings of Machine Learning Research,
vol. 22. La Palma, Canary Islands: PMLR. (Cited on pages 251 and 266.)
Särkkä, S. and Piché, R. 2014. On convergence and accuracy of state-space approxima-
tions of squared exponential covariance functions. Pages 1–6 of: Proceedings of the


## Page 297

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References 289
IEEE International Workshop on Machine Learning for Signal Processing (MLSP).
Piscataway, NJ: IEEE. (Cited on page 261.)
Särkkä, S. and Sarmavuori, J. 2013. Gaussian ﬁltering and smoothing for continuous-
discrete dynamic systems. Signal Processing, 93(2), 500–510. (Cited on pages 166,
167, 168, 170, 209, 210, 221, 222, and 229.)
Särkkä, S. and Solin, A. 2012. On continuous-discrete cubature Kalman ﬁltering. Pages
1221–1226 of: 16th IFAC Symposium on System Identiﬁcation (SYSID). IFAC Pro-
ceedings V olumes, vol. 45. Elsevier. (Cited on pages 135, 169, and 175.)
Särkkä, S. and Sottinen, T. 2008. Application of Girsanov theorem to particle ﬁltering
of discretely observed continuous-time non-linear systems. Bayesian Analysis, 3(3),
555–584. (Cited on pages 104, 105, 106, 111, and 222.)
Särkkä, S., Solin, A., Nummenmaa, A., Vehtari, A., Auranen, T., Vanni, S., and Lin,
F.-H. 2012. Dynamic retrospective ﬁltering of physiological noise in BOLD fMRI:
DRIFTER. NeuroImage, 60(2), 1517–1527. (Cited on page 32.)
Särkkä, S., Solin, A., and Hartikainen, J. 2013. Spatiotemporal learning via inﬁnite-
dimensional Bayesian ﬁltering and smoothing. IEEE Signal Processing Magazine,
30(4), 51–61. (Cited on pages 251, 256, 261, 266, 267, 268, and 275.)
Särkkä, S., Tolvanen, V ., Kannala, J., and Rahtu, E. 2015a. Adaptive Kalman ﬁltering
and smoothing for gravitation tracking in mobile systems. Pages 1–7 of:Proceedings
of Indoor Positioning and Indoor Navigation (IPIN). Piscataway, NJ: IEEE. (Cited
on page 31.)
Särkkä, S., Hartikainen, J., Mbalawata, I. S., and Haario, H. 2015b. Posterior infer-
ence on parameters of stochastic differential equations via non-linear Gaussian ﬁl-
tering and adaptive MCMC. Statistics and Computing, 25(2), 427–437. (Cited on
pages 234, 247, 248, and 266.)
Schweppe, F. 1965. Evaluation of likelihood functions for Gaussian signals. IEEE
Transactions on Information Theory, 11(1), 61–70. (Cited on page 247.)
Shoji, I. and Ozaki, T. 1998. Estimation for nonlinear stochastic differential equations
by a local linearization method. Stochastic Analysis and Applications, 16(4), 733–
752. (Cited on pages 173, 175, and 177.)
Shubin, M. A. 1987.Pseudodifferential Operators and Spectral Theory. Springer Series
in Soviet Mathematics. Berlin: Springer. (Cited on page 268.)
Shumway, R. H. and Stoffer, D. S. 1982. An approach to time series smoothing and
forecasting using the EM algorithm. Journal of Time Series Analysis, 3(4), 253–264.
(Cited on page 249.)
Simon, M. 2015. Anomaly Detection in Random Heterogeneous Media . Wiesbaden:
Springer Spektrum. (Cited on pages 118, 120, and 121.)
Singer, H. 2002. Parameter estimation of nonlinear stochastic differential equations:
simulated maximum likelihood versus extended Kalman ﬁlter and Itô-Taylor expan-
sion. Journal of Computational and Graphical Statistics, 11(4), 972–995. (Cited on
page 247.)
Šmídl, V . and Quinn, A. 2006. The Variational Bayes Method in Signal Processing .
Berlin: Springer. (Cited on page 249.)
Socha, L. 2008. Linearization Methods for Stochastic Dynamic Systems. Lecture Notes
in Physics, vol. 730. Berlin: Springer. (Cited on pages 72, 73, and 167.)


## Page 298

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
290 References
Solin, A. 2016. Stochastic Differential Equation Methods for Spatio-Temporal Gaus-
sian Process Regression. Doctoral dissertation, Aalto University, Helsinki, Finland.
(Cited on pages 251, 259, 266, and 268.)
Solin, A. and Särkkä, S. 2014a. Explicit link between periodic covariance functions and
state space models. Pages 904–912 of: Kaski, S. and Corander, J. (eds.),Proceedings
of the Seventeenth International Conference on Artiﬁcial Intelligence and Statistics.
Proceedings of Machine Learning Research, vol. 33. Reykjavik, Iceland: PMLR.
(Cited on pages 262, 263, and 265.)
Solin, A. and Särkkä, S. 2014b. Gaussian quadratures for state space approximation of
scale mixtures of squared exponential covariance functions. Pages 1–6 of: Proceed-
ings of the IEEE International Workshop on Machine Learning for Signal Processing
(MLSP). Piscataway, NJ: IEEE. (Cited on page 262.)
Sørensen, H. 2004. Parametric inference for diffusion processes observed at discrete
points in time: a survey. International Statistical Review, 72(3), 337–354. (Cited on
page 234.)
Stengel, R. F. 1994. Optimal Control and Estimation. New York, NY: Dover. (Cited
on pages 83 and 279.)
Stratonovich, R. L. 1968. Conditional Markov Processes and Their Application to the
Theory of Optimal Control. New York, NY: American Elsevier. (Cited on pages 55,
56, 197, and 206.)
Svensson, A., Solin, A., Särkkä, S., and Schön, T. 2016. Computationally efﬁcient
Bayesian learning of Gaussian process state space models. Pages 213–221 of: Gret-
ton, A. and Robert, C. C. (eds.), Proceedings of the 19th International Conference
on Artiﬁcial Intelligence and Statistics. Proceedings of Machine Learning Research,
vol. 51. Cadiz, Spain: PMLR. (Cited on page 269.)
Tenenbaum, M. and Pollard, H. 1985.Ordinary Differential Equations. New York, NY:
Dover. (Cited on pages 4 and 19.)
Tronarp, F., García-Fernández, Á. F., and Särkkä, S. 2018. Iterative ﬁltering and
smoothing in nonlinear and non-Gaussian systems using conditional moments.IEEE
Signal Processing Letters, 25(3), 408–412. (Cited on pages 221, 229, and 245.)
Turner, R., Deisenroth, M., and Rasmussen, C. 2010. State-space inference and learn-
ing with Gaussian processes. Pages 868–875 of: Teh, Y . W. and Titterington, M.
(eds.), Proceedings of the Thirteenth International Conference on Artiﬁcial Intelli-
gence and Statistics. Proceedings of Machine Learning Research, vol. 9. Sardinia,
Italy: PMLR. (Cited on page 269.)
Van Trees, H. L. 1968. Detection, Estimation, and Modulation Theory, Part I: De-
tection, Estimation, and Linear Modulation Theory . New York, NY: John Wiley &
Sons. (Cited on page 95.)
Wan, E. A. and van der Merwe, R. 2001. The unscented Kalman ﬁlter. Chapter 7 of:
Haykin, S. (ed.), Kalman Filtering and Neural Networks . New York, NY: Wiley.
(Cited on page 169.)
Wiener, N. 1923. Differential-space. Journal of Mathematics and Physics , 2(1–4),
131–174. (Cited on page 101.)
Wiktorsson, M. 2001. Joint characteristic function and simultaneous simulation of it-
erated Itô integrals for multiple independent Brownian motions. Annals of Applied
Probability, 11(2), 470–487. (Cited on page 148.)


## Page 299

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
References 291
Wilkie, J. 2004. Numerical methods for stochastic differential equations. Physical
Review E, 70(1), 017701. (Cited on page 145.)
Wong, E. and Zakai, M. 1965. On the convergence of ordinary integrals to stochastic
integrals. Annals of Mathematical Statistics, 36(5), 1560–1564. (Cited on pages 55
and 193.)
Wu, Y ., Hu, D., Wu, M., and Hu, X. 2006. A numerical-integration perspective on
Gaussian ﬁlters.IEEE Transactions on Signal Processing, 54(8), 2910–2921. (Cited
on pages 169 and 170.)
Zakai, M. 1969. On the optimal ﬁltering of diffusion processes.Probability Theory and
Related Fields, 11(3), 230–243. (Cited on page 207.)
Zeitouni, O. 1989. On the Onsager–Machlup functional of diffusion processes around
non C2 curves. Annals of Probability, 17(3), 1037–1054. (Cited on page 205.)
Zinn-Justin, J. 2002. Quantum Field Theory and Critical Phenomena . Fourth edn.
International Series of Monographs on Physics, vol. 113. Oxford: Clarendon Press.
(Cited on page 117.)


## Page 300

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.


## Page 301

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations
Notational Conventions
 Arbitrary argument
Œ Integer part of the argument
a;b;c;::: Scalars
˛;ˇ;
;::: Scalars
a; b; c;::: Vectors
˛;ˇ;
;::: Vectors
A; B; C;::: Matrices
Œai ith element of vector a
Œa Cross-product matrix such that a bDŒa b
a$b a andb are the same objects or operations in a different
basis
AT Transpose of matrix A
A1 Inverse of matrix A
AT Inverse of transpose of matrix A
tr A Trace of matrix A
jAj Determinant of matrix A
ŒAi ith column of matrix A
ŒAij Element atith row andj th column of matrix A
A˝ B Kronecker product of matrices A and B
A Adjoint of operator A
CovŒx Covariance of x
CovŒxj y Conditional covariance of x given y
EŒx Expectation of x
EŒxj y Conditional expectation of x given y
ENŒ Expectation with respect to moment-matched Gaussian
exp.F/ Matrix exponential exp.F/D IC FC 1
2Š F2C
exp.A/ Operator exponential of operator A
hf;gi Inner product of functionsf andg
293


## Page 302

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
294 Symbols and Abbreviations
lims#0f.s/ Limit off.s/ thens approaches zero from positive sideRt
t0
f./ d Lebesgue integral off.t/ over the rangeŒt0;tR
f. x/ dx Lebesgue integral off. x/ over the space RD (assuming
that x2 RD)Rt
t0
f./ dˇ./ Itô integral of f.t/ over Brownian motion ˇ.t/ on the
rangeŒt0;t
g0.x/ Derivativeg0.x/D dg.x/=dx
@g.x;t/
@t Partial derivative ofg with respect tot
@g.x;t/
@xi
Partial derivative ofg with respect to theith component
of x
@2g.x/
@xi@xj
Second partial derivative ofg with respect to theith and
j th components of x
rg Gradient (column vector of partial derivatives) of scalar
functiong.x/ with input x2 RD
rr Tg Hessian matrix (matrix of second derivatives) of scalar
functiong.x/ with input x2 RD
Rt
t0
L./ dˇ./ Itô integral of L.t/ over vector of Brownian motions
ˇ.t/ on the rangeŒt0;tRt
t0
L./ı dˇ./ Stratonovich integral of L.t/ over vector of Brownian
motionsˇ.t/ on the rangeŒt0;t
m.tjs/ Mean of the transition densityp.x.t/j x.s//
nŠ Factorial ofn, that is,nŠD12 .n1/n
N.xjm;P/ Univariate Gaussian probability density with mean m
and varianceP
N.xj m; P/ Multivariate Gaussian probability density with mean m
and covariance P
p.x.t// Probability density of x.t/
p.x;t/ Probability density of x.t/
p.x;t/ ,p.x.t// p. x;t/ is deﬁned to be equal to p.x.t// (i.e., it is just
an alternative notation)
p.x.t/j x.s// Conditional (transition) probability density of x.t/
given x.s/
p.x;t j y;s/ Conditional (transition) probability density of x.t/
given x.s/D y.s/
P.tjs/ Covariance of the transition densityp.x.t/j x.s//p
P Matrix such that PD
p
P
p
P
T
u U.0;1/ Random variableu has a uniform distribution on range
Œ0;1
dx
dt Time derivative of x.t/


## Page 303

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations 295
d2x
dt 2 Second time derivative of x.t/
x N.m;P/ Random variablex has univariate Gaussian distribution
with meanm and varianceP
x N.m; P/ Random variable x has a multivariate Gaussian distribu-
tion with mean m and covariance P
Px Time derivative of x.t/
Rx Second time derivative of x.t/
y1Wk Collection of vectorsfy1; y2;:::; ykg
@ Boundary of domain RD
Symbols
˛ Scalar constant, weak order of convergence
˛i Scalar constant (iD1;2;::: ), acceptance probability
˛ Constant vector in SRK, multi-index
ˇ Brownian motion (with diffusion coefﬁcientq)
Qˇ Physical Brownian motion (in Langevin’s model)
Qˇ Brownian motion of a weak solution of SDE, biased Brownian mo-
tion
ˇ Vector of Brownian motions (with diffusion matrixQ)

 Damping parameter, strong order of convergence

 A constant vector in SRK
 Gamma function
ij Element at rowi and columnj of matrix
 Matrix of operator-transformed basis function evaluations or inner
products
ı Dirac’s delta function, positive scalar
ıij Kronecker’s delta
 Spatial displacement
t Length of a time interval
tk Length of the time intervaltkDtkC1tk
ˇk Increment of scalar Brownian motionˇkDˇ.tkC1/ˇ.tk/
ˇk Increment of vector of Brownian motionsˇkDˇ.tkC1/ˇ.tk/
ˇ.i/
k Elementˇ.i/
k ,Œˇki
Oˇk Random variable in weak SDE solution method
Oˇ.i/
k ElementOˇ.i/
k ,ŒOˇki
k Gaussian increment in Itô–Taylor method
Ok Random variable in weak SDE solution method


## Page 304

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
296 Symbols and Abbreviations
j;k Vector of iterated Itô integrals
.i/
j;k Element.i/
j;k ,Œj;ki
" Positive constant
"k Gaussian noise
" White noise in measurement noise
"k Gaussian noise vector
 An arbitrary scalar function, a complex Gaussian process
 Viscosity of liquid, a damping parameter
 Brownian motion in measurement model
 Angle, a scalar constant
n Scalar constant, angle, random variable, parameter (nD1;2;::: )
 Arbitrary Itô process, vector of parameters
ML Maximum likelihood estimate of
MAP Maximum a posteriori estimate of
 Proposal sample
.i/ MCMC sample from roundi
‚ Arbitrary Itô process
 Parameter of unscented transform
 Positive constant, parameter of unscented transform
n nth eigenvalue
 Lagrange multiplier
 Drift constant, mean of mean-reverting process, sufﬁcient statistic
 Mean function
k Measurement mean
 Angular velocity parameter of spring model, parameter of Matérn
covariance function
 Arbitrary scalar, a random variable, noise-free solution
 Gaussian process input
0 Other Gaussian process input
i Unit sigma point in a sigma-point method (iD0;1;::: )
 The constant3:14159265359
 Order of integration method
 V olatility constant, standard deviation, scale parameter
† Scalar discrete-time variance
†k Scalar discrete-time variance at time stepk
† Discretization covariance of LTI SDE, covariance matrix
†k Stepk discretization covariance of linear SDE
 Time, time interval, dummy integration variable
 Probability density function of displacements, a scalar function


## Page 305

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations 297
n nth eigen/basis function
 Test function in Onsager–Machlup functional
ˆ Poisson process
ˆij Element at rowi and columnj of matrixˆ
ˆ Matrix exponential in matrix fraction decomposition, matrix of ba-
sis function evaluations or inner products in PDE solver
' Arbitrary scalar function
'n nth orthonormal basis function, other basis function
' Other function in Onsager–Machlup functional
'n Approximating function in the Picard iteration (nD0;1;::: )
 Scalar function, scalar transition matrix, potential function
‰ Boundary value
‰ Transition matrix of a linear differential equation (ODE or SDE),
Lagrange multiplier
! Angular velocity (e.g., in Fourier transform), event space element,
scalar parameter
!0 Period length
! Angular velocity vector
 Integration domain RD, domain of PDE
a Scalar constant, scalar discretization coefﬁcient, scalar function
ak Scalar constant at stepk of with indexk
A Scalar constant
a Acceleration vector
ak Function in Itô–Taylor method
A Discretization matrix of LTI SDE, feedback matrix in variational
approximation
Ak Stepk discretization matrix in linear SDE
A Generator of diffusion
At Generalized generator of diffusion
A Fokker–Planck–Kolmogorov operator
b Scalar constant, a scalar function
b Bias vector in variational approximation
bj;k Function in Itô–Taylor method
B Scalar constant,"-tube
B Input coefﬁcient matrix
B Space of Brownian paths
c Scalar constant
cn Scalar constant (nD1;2;::: )
c˛ Scalar constant with multi-index˛
C Capacitance, covariance function (scalar), a scalar constant


## Page 306

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
298 Symbols and Abbreviations
C Covariance function (matrix), a matrix in the matrix fraction de-
composition
C† Matrix in the LTI matrix fraction decomposition
Cw Covariance function of w
Cx Covariance function of x
Ck Cross-covariance matrix
d Scalar constant, GP input dimension
D Scalar constant, dimensionality of state
D Matrix in the matrix fraction decomposition
D† Matrix in the LTI matrix fraction decomposition
ek Gaussian random variable
f Arbitrary function, a scalar drift function, frequency
fi Theith element of f (iD1;2;::: )
f State feedback function (in ODE), the drift function (in SDE), or a
force vector
Qfi ith element ofQf (iD1;2;::: )
Qf Modiﬁed drift function (in Itô–Stratonovich conversion)
F Laplace transform of function f , force in Langevin model, func-
tional, coefﬁcient in LTI system
F Feedback matrix in linear differential equation (ODE or SDE)
Fx Jacobian matrix of function f
F Fourier transform operator
F1 Inverse Fourier transform operator
g Arbitrary time-dependent function, gravitational acceleration, a
constant, Gaussian process input function
g Local gravitation vector, arbitrary vector function, a drift function
G Fourier transform of functiong, a scalar function
G Matrix in the matrix fraction decomposition
Gk Smoother gain
F Feedback operator in spatiotemporal model
h Impulse response of linear system, change-of-variable function,
function in Doob’s h-transform, bias distribution, discretization
step length
h Measurement model function, change of variables function
hk Measurement model function at stepk
H Fourier or Laplace transform of h, the transfer function of a linear
system with the impulse response h, MAP path functional, scalar
measurement model parameter
Hi ith Hermite polynomial (iD0;1;::: )


## Page 307

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations 299
H˛ Multivariate Hermite polynomial with multi-index˛
H Measurement model matrix
Hx Jacobian matrix of function h
H Measurement operator
i Nonnegative integer, generic index
i Imaginary unit with the property i 2D1
I Binary random variable
I˛ Modiﬁed Bessel function of the ﬁrst kind
I Identity matrix
j Nonnegative integer, generic index
J Nonnegative integer, Onsager–Machlup functional
Je Minimum energy functional
k Time step number, nonnegative integer
K Constant, number of time steps
K Modiﬁed Bessel function of second kind
Kk Kalman gain at stepk
` Negative log-likelihood, length scale
O` Approximation of negative log-likelihood
`p Unnormalized negative log-posterior
`i Length scale of indexi
L Dispersion coefﬁcient of scalar SDE, (half) length of interval
Lij Element at rowi and columnj in matrix L (i;j D1;2;::: )
L Laguerre polynomial
L Input feedback matrix (in ODE) or dispersion matrix (in SDE)
Li ith column of matrixL (in stochastic Runge–Kutta methods)
L Linear operator in Taylor series for ODEs or dispersion operator
Lt Linear operator in Itô–Taylor series for SDEs
Lˇ;v Linear operator in Itô–Taylor series for SDEs
L Laplace transform operator
L1 Inverse Laplace transform operator
m Mass of a particle or car, scalar mean, nonnegative integer
mi ith element of vector m (iD1;2;::: )
m0 Initial mean
mk Updated mean or sufﬁcient statistic at time stepk
m
k Predicted mean or sufﬁcient statistic at time stepk
m Mean vector
ms Smoother mean vector
m0 Initial mean vector
mk Updated mean vector at time stepk


## Page 308

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
300 Symbols and Abbreviations
m
k Predicted mean vector at time stepk
ms
k Smoother mean at time stepk
M Constant, number of subintervals, measurement dimensionality
n Nonnegative integer with many meanings
ni ith component of n (iD1;2;::: )
n Normal of a boundary
N Avogardo constant, number of series terms, number of particles
q Spectral density of white noise, diffusion constant/coefﬁcient of
Brownian motion, probability density, unnormalized probability
density
qk Discrete-time Gaussian noise, probability distribution
qk Discrete-time Gaussian noise
Q Spectral density (matrix) of white noise, diffusion matrix of Brow-
nian motion
p Probability density function, probability distribution
Op Approximation ofp
P Discrete probability distribution
p Vector of values ofp.xi;t/ whereiD1;2;:::
P Variance of an SDE solution, probability measure, sufﬁcient statis-
tic
Pij Element at rowi and columnj in matrix P (i;j D1;2;::: )
P0 Initial variance
Pk Updated variance or sufﬁcient statistic at time stepk
P
k Predicted variance or sufﬁcient statistic at time stepk
P Covariance matrix
P s Smoother covariance matrix
P0 Initial covariance matrix
Pk Updated covariance matrix at time stepk
P
k Predicted covariance matrix at time stepk
P s
k Smoother covariance matrix at time stepk
P1 Stationary stage covariance matrix
r Diameter of particle, a constant, diffusion constant/coefﬁcient of
Brownian motion
r Remainder term, space location
rk Discrete-time measurement noise
R Space of real numbers
Rn n-dimensional space of real vectors
R Gas constant, resistance, variance
R Spectral density or diffusion matrix of measurement noise
Rk Measurement noise covariance


## Page 309

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations 301
s Laplace transform input variable, dummy integration variable, time,
number of RK stages, smoothing density, discrete-time system vari-
ance
sk Sum ofk random variables
S Dimensionality of (white noise) input or Brownian motion, area of
domain
Sn Process deﬁned as via a sum ofn random variables
Sx Spectral density ofx
S Spectral density (matrix)
Sw Spectral density (matrix) of w (which should equal to Q)
Sx Spectral density (matrix) of x
Sk Kalman ﬁlter innovation covariance
t Time
t0 Time (typicallyt¤t0)
t0 Initial time
tk Time of the step or measurementk
t
k Time in the intervalŒtk;tkC1
T End of time interval, number of time steps, number of measure-
ments
Te Exit time
u Heaviside step function, number of particles per volume, dummy
integration variable, an arbitrary function, dummy index, uniform
random variable
u Input function
v Velocity of a particle, voltage, an arbitrary function, potential func-
tion, dummy index
vk Kalman ﬁlter innovation
w Scalar-valued time-dependent differential equation input, white
noise
wi Laguerre weight
W Fourier or Laplace transform ofw, sigma-point weight
w Differential equation input, vector of white noises
W The matrix WD L Q LT
x Differential equation solution (scalar), scalar Itô process
x0 Arbitrary (scalar) state
x0 Initial value ofx
xi ith element of vector x
x Differential equation solution (vector), state of a ﬁrst-order differ-
ential equation (ODE or SDE), vector-valued Itô process
x0 Arbitrary (vector) state


## Page 310

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
302 Symbols and Abbreviations
x0 Initial value of x
xn nth subcomponent of state (nD1;2;::: )
Ox Approximation of x
Qx Weak solution of SDE
X Fourier or Laplace transform ofx
X Fourier or Laplace transform of x
Xt History of x up to timet
y Differential equation solution (scalar), transformed SDE solution
y State of an SDE, continuous-time measurement, Gaussian process
measurement
yk Discrete-time measurement
Y Laplace transform ofy
Yt History of y up to timet
z Displacement of particle, a real number
zn Gaussian random variable, element of pseudonormalized increment
z Pseudonormalized increment, integrated measurement
Z Likelihood ratio
Zk Discretized likelihood ratio, normalization constant
Zt History of z up to timet
1 Inﬁnity
Abbreviations
ARE Algebraic Riccati equation
BOLD Blood-oxygen-level dependent
CIR Cox–Ingersoll–Ross
EA Exact algorithm
EKBF Extended Kalman–Bucy ﬁlter
EKF Extended Kalman ﬁlter
FEM Finite-element method
fMRI Functional magnetic resonance imaging
FPK Fokker–Planck–Kolmogorov
GP Gaussian process
GPSS Gaussian process state-space
KL Kullback–Leibler
KS Kushner–Stratonovich
LFM Latent force model
LTI Linear time-invariant
MAP Maximum a posteriori
MCMC Markov chain Monte Carlo


## Page 311

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Symbols and Abbreviations 303
MH Metropolis–Hastings
ML Maximum likelihood
MLP Multi-layer perceptron
ODE Ordinary differential equation
PDE Partial differential equation
PLL Phase locked loop
RBF Radial basis function
RC Resistor–capacitor
RK Runge–Kutta
RK4 Fourth-order Runge–Kutta
RQ Rational quadratic
RTS Rauch–Tung–Striebel
SDE Stochastic differential equation
SPDE Stochastic partial differential equation
STD Standard deviation
ZOH Zeroth-order-hold


## Page 312

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.


## Page 313

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
List of Examples
2.1 Matrix exponential 9
2.2 Fourier transform solution to spring model 12
2.3 Matrix exponential via Fourier transform 13
2.4 Laplace transform solution to spring model 14
2.5 Matrix exponential via Laplace transform 15
2.9 Numerical solution of ODEs 18
3.1 Microscopic motion of Brownian particles 23
3.2 Langevin’s model of Brownian motion 26
3.3 RC circuit 28
3.4 Dynamic model of a car 29
3.5 Smartphone tracking 30
3.6 Noisy pendulum 31
3.7 Heart and breathing tracking in the brain 32
3.8 Black–Scholes model 32
3.10 Stochastic spring model 37
4.3 Itô differential of ˇ2.t/=2 48
4.4 Itô differential of sin .!x/ 48
4.5 Solution of the Ornstein–Uhlenbeck process 50
4.6 Linear time-invariant model with multiplicative noise 51
4.7 Black–Scholes solution 51
4.8 Matching a nonlinear SDE to a solution 52
4.9 Nonlinear scalar SDE 53
5.5 Diffusion equation 63
5.7 Stationary distribution of the Ornstein–Uhlenbeck process 65
5.8 Operator adjoint derivation of FPK 66
5.14 Moments of the Ornstein–Uhlenbeck process 70
5.15 Moments of the sine diffusion model 71
5.16 Statistics of the Black–Scholes model 72
6.1 Time-varying Ornstein–Uhlenbeck process 79
305


## Page 314

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
306 List of Examples
6.2 Discretized Ornstein–Uhlenbeck process 81
6.3 Discretized Wiener velocity model 82
6.4 Discretized car model 82
6.5 Matrix fractions solution to the Wiener velocity model 85
6.6 Discretization of the spring model 85
6.8 Steady-state solution of the Ornstein–Uhlenbeck model 91
6.9 Spectrum and covariance of the Ornstein–Uhlenbeck process 94
7.1 Lamperti transform 99
7.3 Karhunen–Loeve series of Brownian motion 103
7.10 Weak solution of the Beneš SDE 109
7.12 Conditioned Ornstein–Uhlenbeck process 115
7.13 Path integral 117
7.17 Solution of an elliptic PDE using SDE simulation 124
8.6 Simulating from a trigonometric nonlinear SDE 138
8.8 Forward Euler 143
8.9 Fourth-order Runge–Kutta method 143
8.10 Backward Euler 144
8.11 Comparison of ODE solvers 144
8.13 Euler–Maruyama Butcher tableau 148
8.15 Dufﬁng van der Pol oscillator 149
8.19 Weak approximation of the Dufﬁng van der Pol problem 155
8.21 Leapfrog solution to the spring model 157
8.24 Exact simulation of sine diffusion 160
9.6 Linearization and Gauss–Hermite approximations 170
9.7 Gaussian approximation of a nonlinear trigonometric SDE 171
9.10 Approximative Itô–Taylor method 174
9.14 Local linearization vs. Gaussian approximations 179
9.16 Moments of the Beneš SDE 181
9.18 Hermite expansion of Beneš SDE 185
9.20 Discretized FPK for the Beneš SDE 190
9.23 Pathwise series expansion of Beneš SDE 195
10.3 Car tracking model 200
10.8 Beneš ﬁlter 207
10.10 Kalman–Bucy ﬁlter for the Ornstein–Uhlenbeck model 209
10.12 Extended Kalman–Bucy ﬁlter 210
10.17 Beneš–Daum ﬁlter 214
10.19 Kalman ﬁlter for the Ornstein–Uhlenbeck model 217
10.21 Continuous-discrete Kalman ﬁlter for the Ornstein–
Uhlenbeck model 218


## Page 315

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
List of Examples 307
10.26 Continuous-discrete EKF solution to the Beneš–Daum
problem 222
10.29 RTS smoother for the Ornstein–Uhlenbeck model 225
10.33 Continuous-discrete/continuous RTS smoother for the
Ornstein–Uhlenbeck model 228
10.38 Extended RTS solution to Beneš and Beneš–Daum
ﬁltering problems 230
11.1 Parameters in the Ornstein–Uhlenbeck model 235
11.5 Exact parameter estimation in the Ornstein–Uhlenbeck
model 242
11.9 Approximate parameter estimation in the Ornstein–
Uhlenbeck model 246
12.6 Batch GP regression 257
12.7 Matérn SDE model 264
12.8 Linear covariance function 264
12.11 Sequential solution to GP regression 266
12.12 GP approximation of the double-well model 269


## Page 316

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.


## Page 317

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
List of Algorithms
2.6 Euler method 16
2.7 Heun method 17
2.8 Fourth-order Runge–Kutta method 17
2.10 Picard iteration 19
4.10 Stochastic Picard iteration 55
4.11 Conversion of Stratonovich SDEs to Itô SDEs 56
7.14 Solving backward PDEs with SDE simulation 120
7.15 Solving forward PDEs with SDE simulation 120
7.16 Solving boundary value problems with SDE simulation 122
8.1 Euler–Maruyama method 132
8.2 Milstein method 133
8.3 Scalar Milstein method 134
8.4 Strong order 1.5 Itô–Taylor for constant dispersion matrix 136
8.5 Scalar weak order 2.0 Itô–Taylor method 138
8.7 Runge–Kutta methods 142
8.12 Stochastic Runge–Kutta method of strong order 1.0 146
8.14 Strong order 1.0 stochastic Runge–Kutta due to Rößler 148
8.16 Strong order 1.5 SRK method for constant diffusion 150
8.17 Stochastic Runge–Kutta methods of weak order 2.0 152
8.18 Weak order 2.0 stochastic Runge–Kutta due to Rößler 153
8.20 Leapfrog Verlet 156
8.23 Exact algorithm 160
9.1 Gaussian assumed density approximation I 166
9.3 Gaussian assumed density approximation II 167
9.4 Linearization approximation of SDE 168
9.5 Sigma-point approximation of SDEs 170
9.8 Gaussian assumed density transition density approximation 173
9.9 SDE simulation by Gaussian assumed density approximation 173
9.11 Local linearization of Ozaki 176
309


## Page 318

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
310 List of Algorithms
9.12 Local linearization of Shoji and Ozaki 178
9.13 SDE simulation by local linearization 178
9.15 Taylor series expansion of moments 181
9.17 Hermite expansion of transition density 184
9.19 Discretization approximation of FPK 189
9.21 Simulated likelihood method 192
9.22 Pathwise series expansion of SDEs 194
10.4 Continuous-discrete MAP path estimate 204
10.5 Continuous-time MAP path estimate 205
10.6 Kushner–Stratonovich equation 206
10.7 Zakai equation 207
10.9 Kalman–Bucy ﬁlter 208
10.11 Extended Kalman–Bucy ﬁlter 209
10.13 Continuous-time Gaussian assumed density ﬁlter 210
10.14 Continuous-time sigma-point ﬁlter 211
10.15 Bayesian ﬁlter 212
10.16 Continuous-discrete Bayesian ﬁlter 213
10.18 Kalman ﬁlter 216
10.20 Continuous-discrete Kalman ﬁlter 218
10.22 EKF 219
10.23 Gaussian assumed density ﬁlter 220
10.24 Continuous-discrete extended Kalman ﬁlter 221
10.25 Continuous-discrete Gaussian assumed density ﬁlter 221
10.27 Bayesian smoother 224
10.28 RTS smoother 224
10.30 Continuous-discrete/continuous Bayesian smoother 226
10.32 Continuous-discrete/continuous RTS smoother 227
10.34 Discrete-time extended RTS smoother 228
10.35 Type I extended RTS smoother 229
10.36 Type II extended RTS smoother 229
10.37 Type III extended RTS smoother 230
11.2 ML estimate 237
11.3 MAP estimate 237
11.4 Metropolis–Hastings 238
11.6 Discretization-based approximated-likelihood estimation 244
11.7 Gaussian approximated-likelihood parameter estimation 245
11.8 Non-Gaussian approximated-likelihood estimation 246
12.9 Sums of stationary covariance functions as SDEs 265
12.10 Products of stationary covariance functions as SDEs 265
12.13 Variational approximation of continuous-discrete smoothing 274


## Page 319

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
Index
acceleration, 82
accelerometer, 30, 232
adaptive step size, 144
adjoint operator, 65
afﬁne function, 73
angular velocity, 96
ansatz, 20, 52, 53
assumed density, 166
continuous-time ﬁlter, 210
Gaussian approximation, 166, 167,
172, 173, 178, 196
assumed density ﬁlter, 220
continuous-discrete, 221
asynchrony, 197
Avogadro constant, 25
backward Euler method, see Euler
method
backward Kolmogorov equation, 68
basis function methods, 189
batch estimation problem, 202, 203
Bayes’ rule, 111, 115, 203, 212–214
Bayesian ﬁlter, 212, 221
continuous-discrete, 213, 217
discrete-time, 213
Bayesian ﬁltering, 206, 248
Bayesian ﬁltering theory, 68
Bayesian modeling, 29, 34, 197, 236, 241
Bayesian smoother, 224, 226
continuous, 226
continuous-discrete, 226
Beneš ﬁlter, 207, 210
Beneš model, 73, 109, 124, 170, 181,
185, 190, 195, 207, 214, 231
Beneš–Daum ﬁlter, 214, 215, 230
Bessel function, 260, 262
binomial coefﬁcient, 260
Black–Scholes model, 32, 41, 52, 57, 72,
76, 232
blood-oxygen-level dependent signal, 32
Bochner’s theorem, 253
boundary condition, 5
boundary value problem, 121
Brownian motion, 24, 25, 44, 46, 100,
102, 107, 263
deﬁnition, 44
discrete-time, 111
fractional, 272
brute-force integration, 66
Butcher tableau, 143
extended, 147, 148
car tracking model, 29, 83, 201, 202, 208,
232
Cartesian product, 169
Cayley–Hamilton theorem, 9
central limit theorem, 102
central moment, 73
Chapman–Kolmogorov equation, 69,
212, 214
Cholesky factorization, 169
companion matrix, 260, 275
computer graphics, 155
conditional independence, 203
continuous-discrete ﬁltering, 111
continuous-discrete model, 82
continuous-discrete state-space model
deﬁnition, 200
continuous-time state-space model
deﬁnition, 199
contraction mapping, 22
control systems, 29
convolution, 12
covariance function, 41, 70, 87, 92–94,
96, 252, 271
constant, 263
exponential, 259
exponentiated quadratic, 260
311


## Page 320

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
312 INDEX
linear, 264
Matérn, 260
noise, 263
periodic, 262
polynomial, 263
products, 265
rational quadratic, 261
RBF, 260
squared exponential, 260
sums, 265
Wiener process, 102, 263
Wiener velocity, 263
Cox–Ingersoll–Ross model, 75, 124
cross-covariance, 87
cross-product matrix, 41
cubature integration, 169
cumulant, 73
delta-correlation property, 36
differential equation
ﬁrst-order, 6
homogeneous, 6
inhomogeneous, 9
linear, 6
linear time-invariant, 13
nonlinear, 16
time-varying, 10
diffusion equation, 23, 25
diffusion matrix, 106
Dirac delta function, 35, 190
Dirichlet boundary condition, 191
discrete-time ﬁltering, 69
discrete-time model, 78, 80, 82–84
discrete-time samples, 197
discretization invariance, 198
dispersion matrix, 34, 199
Doob’sh-transform, 98, 113
drift function, 34, 199
drift removal, 108
Dufﬁng van der Pol oscillator, 149, 150,
155, 162
educated guess approach, 20, 52
eigenbasis, 191
equivalent discretization, 79
Euler method, 16, 17, 140
backward, 74, 144, 187
forward, 74, 143, 144
Euler–Maruyama method, 39, 41, 57, 73,
124, 132, 133, 144, 192, 244
weak, 137
event space element, 107
exact algorithm, 157
existence, 40
expectation–maximization method, 249
explicit rule, 17
explicit scheme, 143
exponentiated quadratic, 254
extended Kalman ﬁlter, 168, 219
continuous-discrete, 221
extended Rauch–Tung–Striebel
smoother, 228
type I, 229
type II, 229
type III, 230
Feynman–Kac equation, 119, 121
Feynman–Kac formula, 98, 118
ﬁltering problem, 202, 247
continuous-discrete linear Gaussian,
216
continuous-time, 206
continuous-time linear Gaussian, 208
continuous-time nonlinear, 209, 210
discrete-time, 221
discrete-time linear, 216
ﬁltering theory, 168, 170
ﬁnite-element method, 189
ﬁxed point, 20, 21
Fokker–Planck equation, see
Fokker–Planck–Kolmogorov
equation
Fokker–Planck–Kolmogorov, 189, 212
discretization, 185
Fokker–Planck–Kolmogorov equation,
59, 61, 68, 69, 73, 78, 166, 213,
236, 246
forward Euler method, see Euler method
forward Kolmogorov equation, see
Fokker–Planck–Kolmogorov
equation
Fourier basis, 189
Fourier domain, 92
Fourier duality of covariance and spectral
density, 253
Fourier transform, 11–13, 92–95, 97, 253
integrated, 95
Fourier–Hermite series, 183, 184, 195
functional magnetic resonance imaging,
32
Galerkin method, 246


## Page 321

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
INDEX 313
gamma distribution, 261
gamma function, 75
Gauss–Hermite integration, 168, 169
Gaussian approximation, 70, 175
Gaussian assumed density ﬁlter, 220
Gaussian distribution, 70
Gaussian ﬁeld,see Gaussian process
Gaussian ﬁlter, 220
Gaussian integral, 168, 170
Gaussian process, 71, 77, 78, 95, 102,
166, 167, 271, 272
deﬁnition, 252
regression, 251, 254, 266, 271
generator, 114, 180
deﬁnition, 60
generalized, 60
geometric Brownian motion, see
Black–Scholes model
Girsanov theorem, 98, 104, 107, 108,
112, 158
discrete analogue, 111
global order, 17
gyroscope, 30, 232
Haar function, 104
Haar wavelet, 194
heaviside step function, 13
Hermite expansion, 183–185, 236
Hermite polynomial, 136, 169, 183
Heun method, 17, 22, 142, 144
hidden Markov model, 234
hidden process, 197
Hilbert space, 103
hitting time, 113
homogeneous process, 253
Hurwitz matrix, 90
hyperparameter, 266
implicit rule, 17
implicit scheme, 143
importance sampling, 111
impulse response, 12, 13, 15
initial condition, 5, 14, 77, 78
integrating factor, 9, 20
isotropic process
deﬁnition, 253
Itô calculus, 42
Itô differential, 56
Itô formula, 47, 48, 99, 118, 129, 136
Itô integral, 42, 43, 45, 60, 119, 147
approximation, 153
cross-term, 146
iterated, 133, 134, 136, 137, 146
Itô process, 47, 59, 67, 94, 105, 107
Itô–Taylor method
approximative, 174
Milstein, 133, 134
scalar weak order 2.0, 138
strong order 1.5, 136
Itô–Taylor series, 18, 126, 129, 134, 146,
174, 219, 244
Jacobian matrix, 167
Kallianpur–Striebel formula, 111
Kalman ﬁlter, 31, 77, 79, 82–84,
216–218, 225, 228, 232, 250, 265,
272
continuous-time, 208
Kalman–Bucy ﬁlter, 207–209, 228, 232
extended, 210, 232
unscented, 211
Karhunen–Loeve expansion, 103, 193
kernel density estimator, 192
kinetic energy, 27
Kronecker product, 265
Kronecker sum, 265
Kushner–Stratonovich equation, 206, 231
Lévy characterization theorem, 100
Lévy process, 35
Lévy–Ciesielski construction of
Brownian motion, 104
Lagrange multiplier, 273
Laguerre polynomial, 262
Lamperti transform, 98, 99, 124, 158, 183
Langevin model of Brownian motion, 26,
74
Laplace approximation, 236
Laplace domain, 21, 28
Laplace transform, 13–15, 20, 21, 84
latent force model, 270
leap of faith, 36, 39
leapfrog integration, 156
Lebesgue integral, 42–44
likelihood, 235, 236
Lipschitz continuity, 40, 55
Lyapunov equation, 83, 90, 91, 93, 94
Malliavin calculus, 42
Markov chain Monte Carlo, 236, 237,
248


## Page 322

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
314 INDEX
Markov process, 113
deﬁnition, 67
Markov property, 59, 67
martingale, 55, 59, 100
deﬁnition, 59
Matérn model, 97
MATLAB R
, 85, 86, 91
matrix exponential, 8, 9, 13, 15, 21, 36,
67, 80, 84, 86, 187, 191
matrix fraction decomposition, 77, 83,
85, 86, 91, 96, 241, 250
matrix inversion, 85
maximum a posteriori, 204, 236, 237,
249, 250
continuous-discrete paths, 204
continuous-time paths, 206
maximum entropy approximation, 246
maximum entropy distribution, 73
maximum likelihood, 250
maximum likelihood method, 235–237,
244, 249
mean function, 69
mean value theorem, 128
mean-reverting process, 57, 75
Mercer’s theorem, 103
Metropolis algorithm, 238
Metropolis-adjusted Langevin method,
75
Metropolis–Hastings algorithm, 238, 250
Milstein method, 133, 145, 244
scalar, 134
minimum energy
functional, 205
path, 205
MLP neural network, 251
molecular dynamics, 155
moment matching, 171, 245
moments, 69, 71–73, 137
noncentral, 182
Monte Carlo method, 75, 111, 209, 229,
236
multisensor application, 197
neuroimaging, 32
Newton’s law, 26, 29, 201
nilpotent matrix, 21, 82, 85
nonanticipative functional, 108
nonparametric model, 249, 253
Onsager–Machlup functional, 204, 205
operator exponential, 67
optimal ﬁltering
continuous-time, see
Kushner–Stratonovich equation
discrete-time, see Kalman ﬁlter
ordinary differential equation, 4, 126
Ornstein–Uhlenbeck process, 41, 50, 57,
65, 71, 75, 81, 91, 94, 96, 124, 209,
217, 218, 225, 228, 231, 235, 239,
250, 259
conditioned, 116
time-varying, 79
orthonormality, 189
oscillating measure, 117
Padé approximant, 261
partial differential equation, 185
basis function approximation, 186
ﬁnite-difference approximation, 186
particle ﬁlter, 219
path integral, 101, 102, 105, 116
pathwise uniqueness, 54
physiological signals, 32
Picard iteration, 19, 22, 40
stochastic, 54
Picard–Lindelöf theorem, 20, 40, 43
point collocation, 188
Poisson process, 35, 159
polynomial chaos, see Wiener chaos
expansion
posterior distribution
joint distribution of states, 203
probability density, 61, 105
functionals, 205
probability measure, 101, 104, 106, 108
product rule, 169
propagator, 67
Python, 85
quadratic variation, 100
quantum mechanics, 98, 117, 118
quasimoment, 73
quasiperiodic, 32, 262, 275
Radon–Nikodym derivative, 108, 158
random walk, 25, 102
Rauch–Tung–Striebel smoother, 224,
227, 233, 266
rejection sampling, 158
resistor-capacitor circuit, 28
resonator circuit, 4
Riccati equation, 90


## Page 323

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
INDEX 315
Riemann integral, 42, 43
Ritz–Galerkin method, 188
Rodrigues formula, 41, 96
Runge–Kutta method, 17, 126, 142, 145,
187
Euler, 16, 140, 143
fourth-order, 17, 22, 143, 144, 170,
172
Heun, 17
implicit, 143
scale-mixture, 261
self-adjoint operator, 66
semigroup, 67
sensor measurement, 198
separable process
deﬁnition, 253
sigma point, 168
sigma-algebra, 59
sigma-point, 209–211, 221, 229
continuous-time ﬁlter, 211
sigma-point ﬁlters, 221
sigma-point method, 170
simulated likelihood method, 192
sine diffusion model, 71, 160, 196
skeleton process, 160
smartphone, 30, 96, 232
smoothing problem, 202, 223, 247
approximate algorithm, 228
continuous-discrete, 223
discrete-time linear, 224
solution
general, 5, 78
particular, 5, 34
strong, 54
weak, 54, 108
space–time regularity property, 113, 115
spectral density, 34, 35, 92, 94, 96, 253
spectral method, 189
spring model, 4, 6, 18, 37, 85, 157
square-integrable process, 93
squared exponential, 254
stable system, 93
state-space model, 32, 94, 249, 270
continuous-discrete, 200, 201, 203
continuous-discrete linear, 216
continuous-time, 198
discrete-time, 213, 224
discrete-time linear, 216
dynamic model, 199
measurement model, 199
stationary distribution, 76
stationary process, 92, 253
stationary solution, 64, 77, 90
stationary solution to the FPK, 64
stationary state, 41
statistical estimation problem, 202
statistical linearization, 167
steady-state, 90, 92, 97
Stein’s lemma, 167
Stieltjes integral, 42–44
stiff equation, 143
stochastic differential equation, 23, 33
additive noise, 98
approximate moments, 179
conditioning, 113
constant input, 87
discrete-time approximation, 174
Itô form, 47, 56
linear, 49, 77, 88
linear time-invariant, 36, 37, 50, 51,
80, 90, 92, 94
linear time-variant, 84
linearization approximation, 168
local linearization, 175, 177
multiplicative noise, 51, 72, 98, 156
nonlinear, 52
parameter estimation, 234
sigma-point approximation, 170
Stratonovich form, 55, 56, 58, 95, 193
strong solution, 55
time independent, 64
time-dependent, 61
transition density, 68
weak solution, 54
stochastic Picard iteration, 55
stochastic Runge–Kutta method, 144,
219, 244
Euler–Maruyama, 132, 144
scalar weak order 2.0, 151
strong order 1.0, 146
strong order 1.0 Rößler, 148
strong order 1.5 additive noise, 150
weak order 2.0, 152
weak order 2.0 Rößler, 153
stochastic Runge–Kutta methods, 174
stock price, 29, 32
Stoke’s law, 26
Stratonovich calculus, 42, 206
Stratonovich integral, 55
Stratonovich stochastic differential
equation, 58


## Page 324

c
Simo Särkkä and Arno Solin 2019. This copy is made available for
personal use only and must not be adapted, sold or re-distributed.
316 INDEX
strong convergence, 137
strong order of convergence, 40, 132
strong uniqueness, 54
target tracking, 82
Taylor series, 8, 9, 18, 48, 127, 129, 140,
179–182, 209, 221, 229, 230, 244
time-marginal statistic, 87
time-reversibility, 156
time-varying phenomena, 33
transition density, 59, 68, 75, 78, 80–82,
109, 113, 185, 192, 203, 219, 235,
243, 245
approximation, 173, 182–184
transition kernel, 113
transition matrix, 78–80, 88
trapezoidal approximation, 17
uniqueness, 40
unscented Kalman ﬁlter, 219
unscented transform, 168, 169
variational approximation, 168
variational Bayes method, 249
Vasicek model, 57
Verlet integration, 155
volatility, 32
weak convergence, 137
weak equivalence, 78
weak order of convergence, 132, 137
weak solution, 80, 104, 108, 109, 124
weak uniqueness, 54
white noise, 34, 92
deﬁnition, 35
Wiener acceleration model, 96
Wiener chaos expansion, 194, 195
Wiener measure, 98, 101, 102, 116, 117,
203
Wiener process, 25, 82, 100, 263
Wiener velocity model, 82, 83, 85, 96,
250, 263
Wiener–Khinchin theorem, 92, 253
Zakai equation, 207, 231
zeroth-order-hold, 87
