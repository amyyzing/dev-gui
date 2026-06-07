# Numerical Methods for Stochastic Diﬀerential Equations

Converted from: `Stochastic Processes\SDE Numerical Methods.pdf`


## Page 1

arXiv:quant-ph/0407039v1  5 Jul 2004
Numerical Methods for Stochastic Diﬀerential Equations
Joshua Wilkie
Department of Chemistry, Simon Fraser University, Burnaby , British Columbia V5A 1S6, Canada
Stochastic diﬀerential equations (sdes) play an important role in physics but existing numerical
methods for solving such equations are of low accuracy and po or stability. A general strategy for
developing accurate and eﬃcient schemes for solving stocha stic equations in outlined here. High
order numerical methods are developed for integration of st ochastic diﬀerential equations with strong
solutions. We demonstrate the accuracy of the resulting int egration schemes by computing the errors
in approximate solutions for sdes which have known exact sol utions.
PACS numbers: 03.65.-w, 02.50.-r, 02.70.-c
Stochastic diﬀerential equations (sdes) have a long his-
tory in physics[1] and play an important role in many
other areas of science, engineering and ﬁnance[1, 2, 3].
Recently a number of computational techniques have
been developed in which high dimensional determinis-
tic equations are decomposed into lower dimensional
stochastic equations. Gisin and Percival[4], for exam-
ple, reduced a deterministic master equation for the den-
sity matrix into stochastic equations for a wavefunction.
Similar approaches are being used to solve the quan-
tum many-body problem for bosons[5], fermions[6] and
vibrations[7]. These latter methods give rise to large sets
of coupled sdes which require fast and eﬃcient numerical
integration schemes. Unfortunately, and in spite of their
widespread use, the available numerical techniques[3] for
solving such equations are far less accurate than compa-
rable methods for solution of ordinary diﬀerential equa-
tions ( odes).
In this manuscript we show how classical methods for
solving odes, such as Runge-Kutta, can be adapted for
the solution of a class of sdes which should include many
of the equations which arise in physical problems.
Consider a ﬁnite set of sdes,
dX j
t = aj(Xt, t) dt +
m∑
k=1
bj
k(Xt, t) dW k
t , (1)
represented in Itˆ o[1, 2, 3] form, where j = 1, . . . , n. Here
Xt = ( X 1
t , . . . , Xn
t ) and the dW k
t are independent and
normally distributed stochastic diﬀerentials with zero
mean and variance dt (i.e. sampled N (0, dt)). The
stochastic variables W k
t are Wiener processes. Now as-
sume that the coeﬃcients aj and bj
k have regularity prop-
erties which guarantee strong solutions, i.e. that X j
t are
some ﬁxed functions of the Wiener processes, and that
they are diﬀerentiable to high order. [Suﬃcient con-
ditions for strong solutions are discussed in Ref. [3].]
We may then view the solutions of (1) as functions
X j
t = Xj(t, W 1
t , . . . , Wm
t ) of time and the Wiener pro-
cesses. The solutions can therefore be expanded in Taylor
series. Keeping terms of order dt or less then gives
X j
t+dt = X j
t + ∂X j
t
∂t dt +
m∑
k=1
∂X j
t
∂W k
t
dW k
t
+ 1
2
m∑
k,l=1
∂2X j
t
∂W k
t ∂W l
t
dW k
t dW l
t . (2)
In a mean square sense the product of diﬀerentials
dW k
t dW l
t is equivalent to δk,ldt in the Itˆ o[1, 2, 3] formu-
lation of stochastic calculus. Making this replacement
then yields
dX j
t+dt = X j
t+dt − X j
t = [ ∂X j
t
∂t + 1
2
m∑
k=1
∂2X j
t
∂W k2
t
] dt
+
m∑
k=1
∂X j
t
∂W k
t
dW k
t (3)
which when compared to (1) allows us to identify the ﬁrst
derivatives
∂X j
t
∂W k
t
= bj
k(Xt, t) (4)
∂X j
t
∂t = aj(Xt, t) − 1
2
m∑
k=1
∂2X j
t
∂W k2
t
= aj(Xt, t) − 1
2
m∑
k=1
n∑
i=1
bi
k(Xt, t) ∂bj
k(Xt, t)
∂X i
t
.(5)
Now that these ﬁrst order derivatives are expressed in
terms of aj and bj
k, higher order derivatives can be com-
puted. Thus a Taylor expansion of the solutions
X j
t+∆t = X j
t + ∂X j
t
∂t ∆t +
m∑
k=1
∂X j
t
∂W k
t
∆W k
t
+ 1
2
m∑
k,l=1
∂2X j
t
∂W k
t ∂W l
t
∆W k
t ∆W l
t + . . . (6)
can be obtained for ﬁnite displacements ∆ t and ∆ W k
t .
This Taylor expansion can then be employed to develop
Runge-Kutta algorithms and other integration schemes.
We illustrate the use of this approach by developing
a Runge-Kutta method for sdes which is closely related
to the classical Runge-Kutta scheme for odes. For given
displacements ∆ t and ∆ W k
t deﬁne
fj(Xt, t) = ∂X j
t
∂t ∆t +
m∑
k=1
∂X j
t
∂W k
t
∆W k
t


## Page 2

2
= [ aj(Xt, t) − 1
2
m∑
k=1
n∑
i=1
bi
k(Xt, t) ∂bj
k(Xt, t)
∂X i
t
]∆t
+
m∑
k=1
bj
k(Xt, t)∆W k
t (7)
and consider the following four stage approximation
K 1
j = fj(Xti , ti)
K 2
j = fj(Xti + 1
2 K1, ti + 1
2 ∆t)
K 3
j = fj(Xti + 1
2 K2, ti + 1
2 ∆t)
K 4
j = fj(Xti + K3, ti+1)
Xti+1 = Xti + 1
6 (K1 + 2K2 + 2K3 + K4) (8)
where ti is the initial time and ti+1 = ti + ∆t. Taylor
expansion of this scheme shows that Xti+1 diﬀers from
the exact solution by terms of order higher than ∆ t2 (i.e.
terms of higher order than ∆ t2, ∆ t(∆W k
t )2, (∆ W k
t )4,
(∆W k
t )2(∆W l
t )2, and (∆ W k
t )2∆W l
t ∆W i
t ). Thus, this
stochastic Runge-Kutta algorithm plays a role very sim-
ilar to its classical counterpart except that its order is
reduced from four to two. Generalizations to higher or-
der Runge-Kutta schemes are straightforward, and we
will employ one such scheme in example calculations, but
details will not be presented here.
While this approach is not completely general, since it
will fail for sdes with weak solutions or non-diﬀerentiable
aj and bj
k, it should be applicable to a wide range of prob-
lems. It can for example be used to solve every one of the
equations with known solutions tabulated in section 4.4
of Ref. [3]. To illustrate the accuracy of the method and
its improvement over other known techniques for solv-
ing sdes we now consider a number of these examples.
We compare known exact solutions with numerical so-
lutions obtained using the Euler-Maruyama scheme[8],
a derivative free version of the Milstein scheme due to
Kloeden and Platen[9], the classical Runge-Kutta scheme
(8), and another Runge-Kutta scheme obtained in the
manner outlined above from an eighth order twelve step
method for odes due to Hairer and Wanner[10] (this re-
produces the stochastic Taylor expansion up to and in-
cluding terms of order ∆ t4). Stochastic diﬀerentials were
sampled using the routines gasdev and ran2[11].
As a ﬁrst test of these methods consider an au-
tonomous nonlinear scalar equation
dXt = (1 + Xt)(1 + X 2
t )dt + (1 + X 2
t )dWt (9)
with just one Wiener process. In this example and in all
subsequent examples we assume all Wiener processes are
initially zero. The exact solution to this equation is[3]
Xt = tan(t + Wt + arctan(X0)) (10)
as can be readily veriﬁed using Itˆ o[1, 2, 3] calculus. In
Fig. 1 we plot the error log 10 |Xt − X approximate
t | vs
Figure 1: log 10 |Xt − X approximate
t | vs time t for Eq. (9)
-14
-12
-10
-8
-6
-4
-2
0
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
t
Figure 2: log 10 |Xt − X approximate
t | vs time t for Eq. (11)
-14
-12
-10
-8
-6
-4
-2
0
2
0 20 40 60 80 100 120 140 160 180 200
t
time computed with a time step of 2 .5 × 10−5 for a sin-
gle stochastic trajectory with initial condition X0 = 1
for the four diﬀerent approximation schemes. The Mil-
stein scheme (long-dashed curve) shows some improve-
ment over the primitive Euler-Maruyama method (solid
curve) but the order two Runge-Kutta scheme (short-
dashed curve) and order four Runge-Kutta scheme (dot-
ted curve) perform very much better.
The second example equation, also from Ref. [3], is
an autonomous linear scalar equation in two Wiener pro-
cesses
dXt = a0Xtdt + b1XtdW 1
t + b2XtdW 2
t (11)
which has an exact solution
Xt = X0 exp{[a0 − 1
2 (b2
1 + b2
2)]t + b1W 1
t + b2W 2
t }. (12)
The logarithm base ten of the error for the diﬀerent
schemes, calculated for initial condition X0 = 1 and time


## Page 3

3
Figure 3: log 10 |X 1
t − X 1 approximate
t | vs time t for Eq. (13)
-14
-12
-10
-8
-6
-4
-2
0
0 1 2 3 4 5 6 7 8 9 10
t
step .01, is plotted in Fig. 2. Here the Milstein scheme
(long-dashed curve) performs no better than the Euler-
Maruyama method (solid curve) but again the order two
Runge-Kutta scheme (short-dashed curve) and order four
Runge-Kutta scheme (dotted curve) show greatly im-
proved accuracy. [Note that the apparent improvement
in performance of all schemes at long time is a result of
the fact that the solution decays to zero.]
Example 3 is a set of two coupled linear autonomous
sdes
dX 1
t = − 3
2 X 1
t dt + X 1
t dW 1
t − X 1
t dW 2
t − X 2
t dW 3
t
dX 2
t = − 3
2 X 2
t dt + X 2
t dW 1
t − X 2
t dW 2
t + X 1
t dW 3
t(13)
with three Wiener processes. Here the solutions are
X 1
t = exp {− 2t + W 1
t − W 2
t } cos W 3
t
X 2
t = exp {− 2t + W 1
t − W 2
t } sin W 3
t . (14)
Numerical solutions were calculated with a time step of
.01 and errors in X 1
t are represented in Fig. 3. The order
two Runge-Kutta scheme (long-dashed curve) and order
four Runge-Kutta scheme (short-dashed curve) show im-
provement over the Milstein scheme (solid curve). Simi-
lar results were obtained for X 2
t .
The examples we have considered so far have not had
explicitly time dependent aj and bj
k. Example 4 is a
scalar non-autonomous sde
dXt = [ 2
1 + t Xt + 1
2 (1 + t)2]dt + 1
2 (1 + t)2dWt (15)
with known solution[3]
Xt =
( 1 + t
1 + t0
) 2
X0 + 1
2 (1 + t)2(Wt + t − t0). (16)
Numerical solutions were calculated using the order two
Runge-Kutta scheme and a time step of .001, t0 = 0
Figure 4: log 10 |Xt − X approximate
t | vs time t for Eq. (15)
-14
-13
-12
-11
-10
-9
-8
-7
-6
-5
-4
0 20 40 60 80 100 120 140 160 180 200
t
Figure 5: log 10 |Xt − X approximate
t | vs time t for Eq. (17)
-18
-16
-14
-12
-10
-8
-6
-4
-2
0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5
t
and X0 = 1. The error is represented in Fig. 4. As in
previous examples a high accuracy is achieved in spite
of the rapid growth of the solution. The comparative
smoothness of the error curve reﬂects the fact the the
deterministic part of the solution dominates.
We now consider an example for which an exact solu-
tion is known but which is expressed in terms a stochastic
integral. Consider the stochastic Ginzburg-Landau equa-
tion
dXt = [− X 3
t + (α + 1
2 σ2)Xt]dt + σXtdWt (17)
with solution[3]
Xt = X0
exp{αt + σWt}√
1 + 2X 2
0
∫ t
0 exp{2αs + 2σWs}ds
. (18)
We chose α = .01, σ = 4, X0 = 1 and dt = 5 × 10−6. The
stochastic integral was computed using a Riemann sum


## Page 4

4
Figure 6: log 10 |Xt − X approximate
t | vs time t for Eq. (19)
-11.5
-11
-10.5
-10
-9.5
-9
-8.5
-8
-7.5
-7
-6.5
0 10 20 30 40 50 60 70 80 90 100
t
Figure 7: log 10 |nt − napproximate
t | vs time t for Eq. (21)
-4
-3.5
-3
-2.5
-2
-1.5
0 50 100 150 200
with the same time step. Error in the solution calculated
with the order two Runge-Kutta scheme is plotted in Fig.
5. Good accuracy is again obtained.
Finally, we consider an example in which the exact
solution is expressed in terms of a Itˆ o[1, 2, 3] stochastic
integral. Consider the sde
dXt = − tanh Xt(a + 1
2 b2sech2Xt)dt + bsechXtdWt (19)
with exact solution[3]
Xt = arcsinh
(
e−at sinh X0 + e−at
∫ t
0
easdWs
)
. (20)
We set a = .02, b = 1, X0 = 1 and dt = 1 × 10−5. The
stochastic integral in the exact solution was calculated
using the Itˆ o[1, 2, 3] integral formula with the same time
step. The error in the solution calculated with the order
two Runge-Kutta scheme is plotted in Fig. 6. As in all
previous cases considered the accuracy is very good.
Thus, the approach to solving sdes advocated here
works very well for the wide range of examples we
have considered. The order 4 Runge-Kutta method is
clearly much more accurate than the order 2 Runge-
Kutta scheme. It also has an embedded lower order
Runge-Kutta scheme which can be employed to obtain
an error estimate suitable for stepsize control[10]. Hence
is should be possible to use variable stepsizes to ensure
the accuracy of the solution. This sort of implementa-
tion is essential for solving equations which do not have
known exact solutions. The only subtlety in developing
such a method is ensuring that the correct Wiener path
is maintained even when a step must be rejected. This is
achieved[12] by dividing the rejected diﬀerentials dt and
dW k
t in two segments; dt/2 and dW k
t /2 − y followed by
dt/2 and dW k
t /2 + y where y is sampled N (0, dt/2). To
illustrate the accuracy of the resulting variable stepsize
algorithm we solve the Gisin-Percival[4] stochastic wave
equation for the nonlinear absorber (Eq. 4.2 of Ref. [4])
d|ψ⟩ = .1(a† − a)|ψ⟩dt + (2
a†2a2 − a†2a2 − a†2 a2)|ψ⟩dt
+
√
2(a2 − a2)|ψ⟩dWt (21)
with initial state |ψ(0) >= |0⟩. In Fig. 7 we plot the
error in mean occupation number nt = M [⟨ψ|a†a|ψ⟩] vs
time (Fig. 5 of Ref. [4]) where M [·] denotes an average
over stochastic realisations. 1000, 10000, and 20000 tra-
jectories were used to calculate the solid curve, dashed
curve and dotted curve, respectively. Convergence to the
exact result is good.
The author acknowledges the support of the Natural
Sciences and Engineering Research Council of Canada.
[1] C.W. Gardiner, Handbook of stochastic methods ,
(Springer, Berlin, 1983).
[2] H. Hasegawa, H. Ezawa, Suppl. Prog. Theor. Phys. 69,
11 (1980).
[3] P.E. Kloeden and E. Platen, Numerical solution of
stochastic diﬀerential equations, (Springer, Berlin, 1995).
[4] N. Gisin and I.C. Percival, J. Phys. A 25, 5677 (1992).
[5] I. Carusotto and Y. Castin, Laser Physics 13, 509 (2003);
I. Carusotto, Y. Castin, and J. Dalibard, Phys. Rev. A
63, 023606 (2001).
[6] O. Juillet, Ph. Chomaz, Phys. Rev. Lett. 88, 142503
(2002).
[7] J. Wilkie, Phys. Rev. E 67, 017102 (2003).
[8] See for example section 1 of chapter 9 in Ref. [3].
[9] See Eq. (1.7) of chapter 11 in Ref. [3].
[10] E. Hairer and G. Wanner, DOP853.f available at


## Page 5

5
http://elib.zib.de/pub/elib/hairer-wanner/nonstiﬀ/.
[11] W.H. Press, S.A. Teukolsky, W.T. Vetterling and B.P.
Flannery, Numerical recipes , (Cambridge University
Press, Cambridge, 1992).
[12] J.G. Gaines and T.J. Lyons, SIAM J. Appl. Math. 57,
1455 (1997).
