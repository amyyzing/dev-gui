# Aircraft Trajectory Models

Source title: ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)

Converted from: `8.pdf`


## Page 1

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
[EN-023] Mathematical Models for Aircraft Trajectory
Design : A Survey.
+ D. Delahaye S. Puechmorel∗ E. Feron P. Tsiotras∗∗
∗ Applied Math Lab (MAIAA)
Ecole Nationale Aviation Civile(ENAC)
Toulouse, France
delahaye@recherche.enac.fr
∗∗ School of Aerospace Engineering
Georgia Institute of Technology
Atlanta, USA
feron@gatech.edu
Abstract Air traﬃc management ensure the safety of ﬂight by optimizing ﬂows and maintaining separation between
aircraft. After giving some deﬁnitions, some typical feature of aircraft trajectories are presented. Trajectories are ob-
jects belonging to spaces with inﬁnite dimensions. The naive way to address such problem is to sample trajectories at
some regular points and to create a big vector of positions (and or speeds). In order to manipulate such objects with
algorithms, one must reduce the dimension of the search space by using more e ﬃcient representations. Some dimen-
sion reduction tricks are then presented for which advantages and drawbacks are presented. Then, front propagation
approaches are introduced with a focus on Fast Marching Algorithms and Ordered upwind algorithms. An example
of application of such algorithm to a real instance of air tra ﬃc control problem is also given. When aircraft dynamics
have to be included in the model, optimal control approaches are really e ﬃcient. We present also some application
to aircraft trajectory design. Finally, we introduce some path planning techniques via natural language processing and
mathematical programming.
Keywords Air traﬃc conﬂict resolution, genetic algorithm, B-Spline approximation
1 Introduction
Aircraft trajectory is one of the most fundamen-
tal objects within the frame of ATM. However, partly
due to the fact that aircraft positions are most of the
time represented as radar plots, the time dependence
is generally overlooked so that many trajectory statis-
tics conducted in ATM are spatial only. Even in the
most favorable setting, with time explicitly taken into
account, trajectory data is expressed as an ordered list
of plots labeled with a time stamp, forgetting the un-
derlying aircraft dynamics. Furthermore, the collec-
tion of radar plots describing the same trajectory can
have tenths more samples, nearly all of them redun-
dant. From the trajectory design point of view, this
redundancy is real handicap for the optimization pro-
cess. In this survey, alternative trajectory represen-
tations are presented with a description of their ad-
vantages and limits. Such new approaches may be
applied in many areas :
Aircraft trajectories data compression. As it
has been previously mentioned, ATM system manage
aircraft trajectories and control them in order guaranty
safety and airspace capacity. Currently those trajecto-
ries are represented by the mean of plot lists which
are manipulated by ATM software. Every day, all
aircraft trajectories are registered into large database
for which huge capacity is needed. Based on this
new trajectory representation for which redundancy
has been removed, the trajectories database may be
strongly improved from the capacity point of view.
This compressed trajectory format may also be used
for improving the trajectories transmission between
ATM entities.
Aircraft trajectories Distance Computation.Al-
though trajectories are well understood and studied,
relatively little investigation on the precise compar-
ison of trajectories is presented in the literature. A
key issue in performance evaluation of ATM decision
support tools (DST) is the distance metric that deter-
mines the similarity of trajectories. Some proposed
representation may be used to enhance trajectory dis-
tance computation.
Aircraft model Inference. All aircraft models
are based on ODEs(Ordinary Di ﬀerential Equation),
including tabular ones. Control input includes con-
dition and model parameters. The model reﬁnement
(and computational complexity) ranges from tabular
to many degrees of freedom. The aircraft model in-
ference consists in answering the following question:
Given a parametrized model and a goal trajectory, can
we infer the best parameter values? A model can
be viewed as a mapping from the control space into
the trajectory space. The way to answer the previous
1


## Page 2

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
question is then given by the closest model to the goal
trajectory.
Trajectory prediction. Air tra ﬃc management
research and development has provided a substantial
collection of decision support tools that provide auto-
mated conﬂict detection and resolution [35, 22, 2],trial
planning [7], controller advisories for metering and
sequencing [28, 55],tra ﬃc load forecasting [19, 26],
weather impact assessment [25, 27, 24]. The ability to
properly forecast future aircraft trajectories is central
in many of those decision support tools. As a result,
trajectory prediction (TP) and the treatment of trajec-
tory prediction uncertainty continue as active areas of
research and development (eg [56, 63, 49, 61, 62]).
Accuracy of TP is generally deﬁned as point spatial
accuracy (goal attainment) or as trajectory following
accuracy. The last one can be rigorously deﬁned by
the mean of trajectory space. The ﬁrst one is a limit
case of the second by adding a weight function in the
energy functional. Since we may prescribe smooth-
ness accuracy of a simpliﬁed model relative to a ﬁner
one, may be computed.
Major ﬂows deﬁnition. When radar tracks are
observed over a long period of time in a dense area,
it is very easy to identify major ﬂows connecting ma-
jor airports. The expression ”major ﬂows” is often
used but never rigorously deﬁned. Based on an exact
trajectory distance and a learning classiﬁer, it is pos-
sible to answer the following questions: Given a set
of observed trajectories, can we split it into ”similar”
trajectory classes? If yes, classes with highest num-
ber of elements will rigorously deﬁne the major ﬂows.
Given those classes and a new trajectory, can we tell if
it belongs to a major ﬂow and which one? The princi-
ple of the major ﬂows deﬁnition is to use shape space
to represent trajectory shapes as points and to use a
shape distance (the shape of a trajectory is the path
followed by an aircraft, that is the projection in the
3D space of its 4D trajectory. The speed on the path
has no impact).
Trajectory planning. To improve Air Traﬃc Man-
agement, projects have been initialized in order to com-
pel the aircraft in position and in time (4D trajectory)
so as to avoid potential conﬂict and allow for some
optimality with respect to a given user cost index, en-
vironmental criteria (noise abatement, pollutant emis-
sion . . . ). Depending on the time horizon, several
kind of plannings can be designed:
• At a strategical level, only macroscopic indi-
cators like congestion, mean traﬃc complexity,
delays can be taken into account, considering
the high level of uncertainty;
• at a pre-tactical level, the accuracy of previous
indicators, specially congestion and complexity
increases while at the same time early conﬂict
detection can be performed;
• ﬁnally, at the tactical level, conﬂict resolution
is the major concern and optimality of the tra-
jectories is only marginally interesting.
As we can see, there many areas of ATM where
trajectories are the main objects that have to be ma-
nipulate.
The ﬁrst part of this survey presents some rele-
vant features of aircraft trajectories. The second part,
presents dimension reduction tricks for optimization
approaches. The third part describes approaches based
on wave front propagation in isotropic and anisotropic
environments. The fourth part presents automatic con-
trol approaches with some application to air tra ﬃc
control. Finally, the ﬁfth part introduces some path
planning techniques via natural language processing
and mathematical programming.
2 Some trajectories features
In the following all aircraft trajectories will be de-
scribed as mappings from a time interval [ a, b] to a
state space E with E either R3 or R6 depending on the
fact that speed is assumed to be part of aircraft state
or not. Extension to trajectories on a sphere (typically
long haul ﬂights) will be sketched only.
2.1 Notations and terminology
The reference for this section is [47]. Letγ[a, b]→
E be a trajectory. The origin of the trajectory is γ(a)
and the destination isγ(b). Those two points are called
the endpoints of the trajectory. All trajectories are as-
sumed to be at least continuously diﬀerentiable (class
C1) so that the length of a trajectory γ[a, b]→ E is
well deﬁned as:
l(γ) =
∫ b
a
∥γ
′
(t)∥dt
If∥γ
′
(t)∥ = 0 for some t ∈ (a, b) the point t is
said to be singular. A parametrized curve of class C p
(or more concisely a C p curve) will be a C p map-
ping from an open time interval ( a, b) to the state
space E with no singular points. Any C1 curve can be
parametrized by arclength. Let γ(a, b)→ E be such a
curve. Deﬁning the mapping s(a, b)→ (0, l(γ)) by:
s(t) =
∫ t
a
∥γ
′
(t)∥dt
we see that by the non singularity assumption on
γ, s
′
(t) =∥γ
′
(t)∥ > 0 for any t∈ (a, b), so that s is an
invertible mapping. Now, γ◦ s−1 is a mapping from
the open interval (0, l(γ)) to E satisfying:
∥(γ◦ s−1)
′
∥ =∥(γ
′
◦ s−1)◦ (s−1)
′
∥ = 1
In the following, we will simply write γ(s), s ∈
(0, l(γ)) for a curve parametrized by arclength, drop-
ping the variable t.
2


## Page 3

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
Remark 1. One must be careful with the respec-
tive deﬁnitions of trajectories and curves: a curve is
deﬁned on an open interval and thus has no endpoints.
Nevertheless, any trajectory γ[a, b]→ E has an as-
sociated curve, namely γ(a, b)→ E. It is generally
more convenient to deal with curves to avoid special
treatment of the endpoints.
Remark 2. The non singularity assumption on the
underlying curve is very natural when dealing with
aircraft trajectories in R3 since it is not possible for an
aircraft to stop except at the endpoints of the trajec-
tory.
Remark 3. While the case E = R3 is very natural
and intuitive, care must be taken when E = R6 since
all the preceding deﬁnitions apply in a completely dif-
ferent setting: for example, the non singularity as-
sumption does not implies nowhere zero speed, but
only that speed and acceleration cannot both vanish
at the same time. The arclength parametrization al-
lows to deﬁne very important geometrical quantities
when E = R3 .
Deﬁnition 1. Let:
γ(0, l)→ R3
be a C1 curve parametrized by arclength. The unit
tangent vector to γ at s∈ (0, l) is :
τ(s) = γ
′
(s)
It is clear from the deﬁnition of parametrization
by arclength that τ(s) is a unit vector.
Deﬁnition 2.Let:
γ(0, l)→ R3
be a C2 curve parametrized by arclength. The cur-
vature of γ at s∈ (0, l) is :
K(s) =∥γ
′′
(s)∥
The curvature can be explicitly computed even if
the curve γ is not parametrized by arclength. The gen-
eral formula is:
K(t) =∥γ
′
(t)∧ γ
′′
(t)∥
∥γ
′
(t)∥3
with∧ the vector cross product. Curvature is of
primary importance for ATM related studies since as
mentioned before aircraft trajectories are mainly made
of straight lines and arcs of circle and so have piece-
wise constant curvature. If at point t the curvature is
not zero, the curve is said to be biregular at t. For
a curve γ parametrized by arclength, the unit normal
vector ν(s) is deﬁned at all biregular points by :
ν(s) = γ
′′
(s)
K(s)
Remark 4. A straight line has everywhere zero
curvature. However, it is clearly possible to deﬁne
a unit normal vector. At a biregular point, τ(s) and
ν(s) are well deﬁned. Taking their cross product gives
a new vector β(s) = τ(s)∧ ν(s). If the curve γ is
assumed to be C3, it can be shown that ˙β(s) and ν(s)
are collinear :
β(s) = T(s).ν(s)
The real number T(s) is called the torsion of the
curve at s and represents an obstruction for the curve
to be planar. As for the curvature, it is possible to
compute the torsion even if the curve is not parametrized
by arclength :
T(t) =−det(⃗γ
′
(t), ⃗γ
′′
(t), ⃗γ
′′′
(t))
∥⃗γ
′
(t)∧ ⃗γ
′′
(t)∥2
Torsion is not so useful as curvature for en-route
data analysis since only a few number of trajectories
have non zero torsion. However, it is very relevant in
terminal areas.
Remark 5. The E = R6 case is again very dif-
ferent, since the geometric meaning of curvature and
torsion is not obvious in this setting. Furthermore,
the extra degrees of freedom will impose using higher
order derivatives in order to build up an equivalent
description. A complete treatment goes beyond the
scope of the present paper and has little interest for
our purpose (in practical applications, the speed infor-
mation, when available, is used to improve estimates
of curvature and torsion and not to study a trajectory
in R6).
3 Trajectory Models for Optimization
This section presents some dimension reduction
tricks in order to reduce the dimension of the state
space for which an optimization process is searching
for an optimal vector of parameter.
This approach is summarized by the ﬁgure 1.
The optimization process controls the parameter
vector which is then used to build the trajectory γ for
evaluation.
Each coordinate can be considered separatly in or-
der to build a given trajectory:⃗γ(t) = [x(t), y(t), z(t)]T .
In this section, several trajectory models are pre-
sented and compared. Simple models are ﬁrst pre-
sented.
3.1 Straight line segments
One of the easiest way to design trajectory is to
use waypoints connected by straight lines (see ﬁg-
ure 2. This easy principle ensure continuity for the
trajectory but not for its derivatives. If one want to ap-
proximate trajectory with many shape turns, one have
to increase the number of waypoints in order to reduce
the error between the model of the real trajectory.
In order to improve concept Lagrange interpola-
tion process adjust a polynomial function to a given
set of waypoints.
3


## Page 4

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
Figure 3 Ln(x) is represented by the black curve. The
others curves are the polynomials li(x).
Reconstruction
Trajectory
Trajectory
Evaluation
Optimization
γ
X (parameters)
y=f(X)
Figure 1 .The oprimization process control the X vec-
tor in order to build a trajectory γ for evaluation.
WP1
WP2
WP3
WP4
Figure 2 Trajectory deﬁned by four waypoints con-
nected by straight lines.
3.2 Lagrange interpolation
Given n + 1 real numbers yi,0≤ i≤ n, and n + 1
distinct real numbers x0 < x1 < ... < xn, Lagrange
polynomial [43] of degree n (Ln(x)) associated with
{xi} and{yi} is a polynomial of degree n solving the
interpolation problem :
pn(xi) = yi, 0≤ i≤ n
Ln(x) =
n∑
i=0
f (xi)li(x)
where
li(x) =
∏
j,i
(x− x j)
(xi− x j)
When derivatives have also to be interpolated, Her-
mite interpolation has to be used.
3.3 Hermite interpolation
Hermite interpolation [6] generalizes Lagrange in-
terpolation by ﬁtting a polynomial to a functionf that
not only interpolates f at each knot but also interpo-
lates a given number of consecutive derivatives of f
at each knot.
[ ∂ jH(x)
∂x j
]
x=xi
=
[ ∂ j f (x)
∂x j
]
x=xi
for all j = 0, 1, ..., m and i = 1, 2, ..., k
This means that n(m + 1) values
(x0, y0), (x1, y1), . . . , (xn−1, yn−1),
(x0, y′
0), (x1, y′
1), . . . , (xn−1, y′
n−1),
... ... ...
(x0, y(m)
0 ), (x1, y(m)
1 ), . . . , (xn−1, y(m)
n−1)
must be known, rather than just the ﬁrst n values re-
quired for Lagrange interpolation. The resulting poly-
nomial may have degree at most n(m + 1)1, whereas
the Lagrange polynomial has maximum degree n1.
These interpolation polynomials seem attractive
but they both induce oscillations between interpola-
tion points (Runge ’s phenomenon. Runge’s phenomenon
is a problem of oscillation at the edges of an inter-
val that occurs when using polynomial interpolation
with polynomials of high degree (which is the case
for Lagrange and Hermite interpolation). An exam-
ple of such Runge’s phenomenon is given on ﬁgure 4
for which Lagrange interpolation has been used.
Figure 4 Lagrange interpolation result for a set of
aligned points.
We can conclude that interpolation with high de-
gree polynomial is risky. In order to avoid this draw-
back of high degree polynomial interpolation one must
use piecewise interpolation.
4


## Page 5

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
x0 xi xi+1xi−1 xn
Initial slope
Figure 6 Piecewise quadratic interpolation.
3.4 Piecewise Linear Interpolation
This is the simplest piecewise interpolation method.
Given n + 1 real numbers yi,0≤ i≤ n, and n + 1
distinct real numbers x0 < x1 < ... < xn, we consider
the n linear curves li(x) = aix + bi on the intervals
[xi, xi+1] for i = 0, ...n− 1.
Each li(x) has to connect two points ((xi, yi),(xi+1, yi+1)
yi = aixi + bixi yi+1 = aixi+1 + bixi+1
In order to associate a piecewise formulation of
this interpolation method, the following “tent” func-
tions are deﬁned :
ψi(x) =

x−xi−1
xi−xi−1
i f x∈ [xi−1, xi]
xi+1−x
xi+1−xi
i f x∈ [xi, xi+1]
0 elsewhere
Then,
f (x) =
i=n∑
i=0
yi.ψi(x)
An example of such a linear piecewise interpola-
tion is given on ﬁgure 5
x0 xi xi+1xi−1 xn
Figure 5 Piecewise linear interpolation.
The derivative of the resulting curve is not con-
tinuous. In order to ﬁx this drawback, one can use
piecewise quadratic interpolation
3.5 Piecewise Quadratic Interpolation
We consider then quadratic curves ψi(x) = qi(x) =
aix2 + bix + ci on the intervals [xi, xi+1] for i = 0, ...n−
1.Each qi(x) has to connect two points ((xi, yi),(xi+1, yi+1);
⇒ yi = aix2
i + bixi + ci and yi+1 = aix2
i+1 + bixi+1 + ci.
Furthermore, on each point, the derivative of the pre-
vious quadratic has to be equal to the derivative of the
next one; ⇒ 2ai + bi = 2ai−1 + bi−1. For the ﬁrst
segment the term 2 ai−1 + bi−1 is arbitrarily chosen
(this will a ﬀects the rest of the curve). An example
of piecewise quadratic interpolation is given on ﬁg-
ure 6. The main drawback of piecewise quadratic in-
terpolation is linked to the eﬀect induced on the curve
by moving on point. As a matter of fact moving one
point may totally change the shape of the interpolat-
ing curve. The piecewise cubic interpolation avoid
this drawback.
3.6 Piecewise cubic interpolation
This interpolation is also called Hermite cubic in-
terpolation [37]. For this interpolation :
ψi(x) = Ci(x) = aix3 + bix2 + cix + di
and we have the following constraints :
Ci(xi) = yi Ci(xi+1) = yi+1
C′
i(xi) = y′
i = yi+1−yi−1
xi+1−xi−1
C′
i(xi+1) = y′
i+1 = yi+2−yi
xi+2−xi
An example of piecewise cubic interpolation is given
on ﬁgure 7.
xi xi+1xi−1
iyyi−1
yi+1
yi+2
xi+2
h
slope in i
slope in i+1
Figure 7 Piecewise cubic interpolation.
Moving a point do not aﬀect all the curve which is
the main advantage of this interpolation.The resulting
curve is C1 but not C2 (the second derivative is not
continuous). The curvature radius of a curve may be
expressed by the following expression :
R =
1 +
( d f(x)
dx
)3
2
|
( d2 f (x)
dx2
)
|
The piecewise cubic interpolation do not insure that
trajectory curvature is continuous which is not adapted
for aircraft trajectory mainly if TMA areas and cubic
spline interpolation has to be used.
5


## Page 6

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
3.7 Cubic Spline Interpolation
This method has been developed by General Mo-
tor in 1964 [15]. For this piecewise interpolation
psii(x) = S i(x) with the following constraints :
S i(xi) = yi S i(xi+1) = yi+1
S
′
i(xi) = S
′
i−1(xi+1) S
′
i(xi+1) = S
′
i+1(xi+1)
S
′′
i (xi) = S
′′
i−1(xi+1) S
′′
i (xi+1) = S
′′
i+1(xi+1)
One can show that S i(x) for x∈ [xi, xi+1] is given
by :
S i(x) = σi
6 . (xi+1−x)3
xi+1−xi
+ σi+1
6 . (x−xi)3
xi+1−xi
+ yi. xi+1−x
xi+1−xi
− σi
6 .(xi+1− xi)(xi+1− x)
+ yi+1. x−xi
xi+1−xi
− σi+1
6 .(xi+1− xi)(x− xi)
where
σi = d2S i(x)
dx2
An example of such interpolation is given on ﬁg-
ure 8.
xi−1
yi−1 yi+2
xi+1
iy
xi
yi+1
S i (t)
xi+2
Figure 8 Cubic Spline Interpolation.
Such spline is also called natural spline because it
represents the curve of a metal spline constrained to
interpolate some given points.
When interpolation is not a hard constraint, one
can use some control points which change the shape
of a given trajectory without forcing this trajectory to
go through such control point; such approach is called
approximation for which one of the famous methods
is the B´ezier curve.
3.8 B ´ezier Approximation Curve
B´ezier curves[30] were widely publicized in 1962
by the French engineer Pierre B ´ezier, who used them
to design automobile bodies. But the study of these
curves was ﬁrst developed in 1959 by mathematician
Paul de Casteljau using de Casteljau’s algorithm [31],
a numerically stable method to evaluate B´ezier curves.
A B´ezier curve is deﬁned by a set of control points⃗P0
through ⃗Pn, where n is called its order (n = 1 for lin-
ear, 2 for quadratic, etc.). The ﬁrst and last control
points are always the end points of the curve; how-
ever, the intermediate control points (if any) generally
do not lie on the curve. Given points ⃗P0 and ⃗P1, a lin-
ear B´ezier curve ⃗B(t) is simply a straight line between
those two points (see ﬁgure 9). The curve is given by :
⃗B(t) = ⃗P0 + t(⃗P1− ⃗P0) = (1− t)⃗P0 + t⃗P1 , t∈ [0, 1]
P0
P1
Figure 9 B´ezier Curve with 2 points.
With four points ( ⃗P0, ⃗P1, ⃗P2, ⃗P3), a B ´ezier curve
of degree three can be built. The curve starts at ⃗P0
going towards ⃗P1 and arrives at ⃗P3 coming from the
direction of ⃗P2. Usually, it will not pass through ⃗P1 or
⃗P2; these points are only there to provide directional
information (see ﬁgure??).
BÉZIER CURVE
P3
P2
P1
P0
P0
P1
P2
Figure 10 Cubic B´ezier curve.
Properties
• The polygon formed by connecting the B ´ezier
points with lines, starting with ⃗P0 and ﬁnishing
with ⃗Pn , is called the B ´ezier polygon (or con-
trol polygon).
• The convex hull of the B´ezier polygon contains
the B´ezier curve.
• The start (end) of the curve is tangent to the ﬁrst
(last) section of the B´ezier polygon.
The explicit form of the curve is given by :
⃗B(t) = (1−t)3 ⃗P0+3(1−t)2t⃗P1+3(1−t)t2 ⃗P2+t3 ⃗P3 , t∈ [0, 1].
⃗B(t) =
n∑
i=0
bi,n(t)⃗Pi, t∈ [0, 1]
6


## Page 7

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
it =4
t i+1t i
B    (t)i,0
X   (t)0
0 1 2 3 5 6 7 8
Pi
9
1
Figure 11 Uniform B-Splines of Degree Zero
where the polynomials
bi,n(t) =
(n
i
)
ti(1− t)n−i, i = 0, . . .n
are known as Bernstein basis polynomials of degree
n. So, if there are many points, one has to manipulate
polynoms with high degree. In order to circumvent
this weak point one must use Basis-Splines.
3.9 Basis Splines
A B-spline [21] is a spline function that has min-
imal support with respect to a given degree, smooth-
ness, and domain partition. B-splines were investi-
gated as early as the nineteenth century by Nikolai
Lobachevsky. A fundamental theorem states that ev-
ery spline function of a given degree, smoothness,
and domain partition, can be uniquely represented as
a linear combination of B-splines of that same de-
gree and smoothness, and over that same partition. It
is a powerful tool for generating curves with many
control points, B stands for basis.A single B-spline
can specify a long complicated curve and B-splines
can be designed with sharp bends and even “corners”.
B-Spline interpolation is preferred over polynomial
interpolation because the interpolation error can be
made small even when using low degree polynomi-
als for the spline. Furthermore, spline interpolation
avoids the problem of Runge’s phenomenon which
occurs when interpolating between equidistant points
with high degree polynomials.
3.9.1 Uniform B-Splines of Degree Zero
We consider a node vector ⃗T ={t0, t1, ..., tn} with
t0≤ t1≤, ...,≤ tn and n points ⃗Pi. One want to build a
curve ⃗X0(t) such that :
⃗X0(ti) = ⃗Pi
⇒ ⃗X0(t) = ⃗Pi∀t∈ [ti, ti+1].
⃗X0(t) =
∑
i
Bi,0(t).⃗Pi
where
Bi,0(t) =
{ 1 i f t∈ [ti, ti+1]
0 elsewhere
The shape of the ⃗X0(t) function in one dimension is
given on ﬁgure 11.
3.9.2 Uniform B-Splines of Degree One
We are searching for a piecewise linear approxi-
mation ⃗X1(t) for which :
⃗X1(t) =
(
1− t− ti
ti+1− ti
)
⃗Pi−1+
(
1− t− ti
ti+1− ti
)
⃗Pi ∀t∈ [ti, ti+1]
One can write ⃗X1(t) :
⃗X1(t) =
∑
i
Bi,1(t).⃗Pi
where
Bi,1(t) =

t−ti−1
ti−ti−1
i f t∈ [ti−1, ti]
ti+1−t
ti+1−ti
i f t∈ [ti, ti+1]
0 elsewhere
The shape of the ⃗X1(t) function in one dimension
is given on ﬁgure 12.
it =4
t i+1t i
0 1 2 3 5 6 7 8
Pi
9
X   (t)1
t i−1
i−1,1B      (t)1
Figure 12 Uniform B-Splines of Degree One
7


## Page 8

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
3.9.3 Uniform B-Splines of Degree Three
Those B-Splines have been developed at Boeing
in the 70s and represent one of the simplest and most
useful cases of B-splines. Degree 3 B-Spline with n +
1 control points is given by :
⃗X3(t) =
n∑
i=0
Bi,3(t).⃗Pi 3≤ t≤ n + 1
where Bi,3(t) = 0 if t≤ ti or t≥ ti+4.
⃗X3(t) =
j∑
i= j−3
Pi.Bi,3(t) t∈ [ j, j + 1], 3≤ j≤ n
When a single control point ⃗Pi is moved, only the
portion of the curve ⃗X3(t) with ti < t < ti+4 is changed
⇒ local control. The basis functions have the follow-
ing properties :
• They are translates of each other i.e Bi,3(t) =
B0,3(t− i)
• They are piecewise degree three polynomial
• Partition of unity ∑
i Bi(t) = 1 for 3≤ t≤ n + 1
• The function ⃗Xi(t) are of degree 3 for any set of
control points
Bi−2,3(t) = 1
h

(t− ti−2)3 if t∈ [ti−2, ti−1]
h3 + 3h2(t− ti−1) + 3h(t− ti−1)2− 3(t− ti−1)3
if t∈ [ti−1, ti]
h3 + 3h2(ti+1− t) + 3h(ti+1− t)2− 3(ti+1− t)3
if t∈ [ti, ti+1]
(ti+2− t)3 if t∈ [ti+1, ti+2]
0 otherwise
Those basis functions are shown on ﬁgure 13.
B    (t)2,3 3,3B    (t)B    (t)1,3
1 2 3 5 4 6 7 8
B    (t)4,3
2/3
Figure 13 Order 3 basis function
3.9.4 Principal Component Analysis
When trajectories samples are available (from radar
for instance), one can build a dedicated bases which
will minimize the number of coeﬃcient for trajectory
reconstruction. Principal component analysis (PCA)
is a mathematical procedure that uses an orthogonal
transformation to convert a set of observations of pos-
sibly correlated variables into a set of values of lin-
early uncorrelated variables called principal compo-
nents. The number of principal components is less
than or equal to the number of original variables.
γ
ψ
Figure 14 The black trajectories represent registered
samples for which 4 principal components are ex-
tracted (in this artiﬁcial example) for minimum error
reconstruction process.
In the example presented in ﬁgure 14 a set of tra-
jectories γi(t), i = 1..n are used to build K = 4 prin-
cipal components (ψk(t)) which can be used to recon-
struct the initial trajectories.
γi(t) =
k=K∑
k=1
aikψk(t)
When probability density functions of the coe ﬃ-
cient aik can be identiﬁed, one can use this trick to
plug a stochastic optimization process which gener-
ates random coeﬃcients in order to produce relevant
random trajectory. More information about PCA can
be found in the reference [3].
3.9.5 Homotopy trajectory design
An easy way to build trajectory is to used refer-
ence trajectory (regular trajectories used by aircraft)
and to compute a weighted sum of such reference tra-
jectories to build a new one. If we consider two (or
more) references trajectories joining the same origin
destination pair (see ﬁgure 15) (past ﬂown trajectories
may be considered) :
γ1, γ2
One can create a new trajectoryγα by using an homo-
topy :
8


## Page 9

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
γ2
γ1
γα
B
A
Figure 15 One new trajectory is built by using a
weighted sum of two reference trajectories.
γα = (1− α)γ1 + αγ2
In this example only one coe ﬃcient α has been
used but one can extend this principle to several pa-
rameters.
After having review algorithms based on optimiza-
tion, the next section presents wave front propagation
approaches.
4 Wavefront algorithms
4.1 Generalities
It is a well known fact in physics that waves of
very high frequencies tend to propagate along lines
that are geodetic with respect to the metric that yields
as the length of a curve the propagation time. The
knowledge of the wave velocity at each point of space
allows for the computation of wave fronts that are the
set of all points reached by the wave at a given time,
assuming it has started at a point source. The prin-
ciple of the wavefront propagation algorithms is to
transpose the previous physical model by assuming
a velocity directly related to the criterion to be opti-
mized. As an example, congestion will be taken into
account by velocity reduction, so that paths crossing
congested areas will be penalized. Dependind on the
fact that the metric is or not isotropic (the later case
being the one to be investigated when the wind is used
into the criterion and has a non negligible velocity),
two classes of algorithms are used.
4.2 Fast Marching Algorithms
The Fast Marchingmethod, presented by Sethian [68]
is a part of the more general methods called Level
Set [52]. These techniques are designed to track the
evolution of interfaces. The evolution of the wave-
front can be compared to deform a curve or a surface
from a partial diﬀerential equation. The Fast March-
ing method is used in the particular case where the
wavefront speed is isotropic. It can still be applied if
the anisotropy is low enough. For air traﬁc applica-
tions, this last assumption is valid in some areas of
the airspace (of course it is not the case in the vicinity
of jet streams).
In the particular case where the Fast Marching
method is applicable, the calculus of the minimum
time T to reach any points of the environment from
the initial point is equivalent to solve the Eikonal equa-
tion of the form :
|∇T(x)| = 1
F(x) , F(x) > 0, et T(xinitial) = 0
(1)
where x∈ R2 represents the position in space, T∈ R
the minimum time and F∈ R the speed of propaga-
tion.
In free space, the wave speed F is equivalent to
the aircraft speed. When we have forbidden areas,
we force the propagation speed at zero in order to
get a barrier value since the time to reach this point
will be equal to inﬁnity. Thereby, we have guaran-
teed avoidance property for those areas. For the con-
gestion, the method is di ﬀerent, we want to penalize
some areas where the congestion is high but we do not
want to ban aircrafts from driving through these areas.
We just need to reduce the propagation speed. Thus,
the time is increased proportionnaly to the congestion
value, penalizing the crossing.
To design the optimal path between the arrival point
and the departure point, we can then perform a gradi-
ent descent using the calculated values of T on the
space, from the arrival point to the initial point. There
is no risk to get stuck on a local minimum since the
function T has only one optimum which is global.
The numerical resolution is like the graph search
algorithms. However, in opposition to these graph
search algorithms, the Fast Marching method is con-
sistent since when the grid is reﬁned, the obtained so-
lution converges on the exact solution of the Eikonal
equation [68] that is a geodetic line.
4.3 Ordered upwind algorithm
When wind is to be taken into account and has
a non negligible speed with respect to the one of the
aircraft, the propagation is no longer isotropic. The
speed of the wavefront depends on the position and
the directions of wind. A speciﬁc algorithm, called
Ordered Upwind, has been developed to overcome
this problem in [69], at the expense of a higher algo-
rithmic complexity. Basically, an extra parameter, the
anisotropy ratio, is considered: it is the ratio of the
fastest to slowest propagation speed for each points.
Given a point in space, the algorithm ﬁrst considers
the points on the current wavefront that are closest to
it: it gives a time to travel when taking as propagation
9


## Page 10

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
speed the slowest. Now, the other points to be consid-
ered at located no farther than the anistropy ratio time
the minimal distance. By maintaining a list of poten-
tial points contributing to the information at the point
of interest, the ordered upwind algorithm can still be
implemented in a single pass.
In order to keep the eﬃciency of the Fast March-
ing algorithm, Petres proposed an extension of the al-
gorithm Fast Marching in [54], he assumed the ﬁeld
is smooth. He applied this extension to plan a path
for autonomous underwater vehicles taking underwa-
ter currents into account. We propose here a simi-
lar extension to Petres’s method of theFast Marching
method, our extension is speciﬁc to aircraft trajecto-
ries.
In the next section, we present an example of ap-
plication of such wave propagation algorithm for air
traﬃc management problem.
4.4 Light Propagation Algorithm for Air Tra ﬃc
Management
In geometric optics, light behavior is modeled us-
ing rays. Light emitted from a point is assumed to
travel along such a ray through space. In an e ﬀort
to explain the motion through space taken by rays as
they pass through various media, Fermat (1601-1665)
developed his principle of least action [32]:
The path of a light ray connecting two points is the
one for which the time of transit, not the length, is a
minimum.
We can make several observations as a result of
Fermat’s principle :
• In a homogeneous medium, light rays are rec-
tilinear. That is, within any medium where the
index of refraction is constant, light travels in a
straight line.
• In an inhomogeneous medium, light rays fol-
low smooth geodesic curves with minimum tran-
sit time.
Light therefore tends to avoid high index areas where
rays are slowed down. Light reaches lowest speed for
the highest encountered index.
Based on this principle of least action, we intro-
duce an optimal path planning algorithm which com-
putes smooth geodesic trajectories in environments
with static or dynamic obstacles. This algorithm mim-
ics light propagation between a starting point towards
a destination point, with obstacles modeled by high-
index areas. By controlling the index landscape, it
is possible to ensure that the computed trajectories
meet the speed constraints and remain at a speciﬁed
minimum distance from obstacles. Congestion and
the protection zone (volume surrounding the aircraft
where no other aircraft may enter) of other aircraft
will be modeled as high-index areas. Our light propa-
gation algorithm (LPA) is designed from a particular
aircraft point of view. It is assumed that the aircraft
knows the surrounding aircraft trajectories (the set of
trajectories of the other aircraft is a given input of the
algorithm).
We have applied successfully this algorithm to the
aircraft conﬂict resolution problem. To address this
conﬂict resolution problem, aircraft are sequentially
resolved using LPA. We assign a trajectory to the ﬁrst
aircraft disregarding the other aircraft (without con-
sidering any constraints). Then, LPA looks for a tra-
jectory for the subsequent aircraft by considering the
trajectory of the ﬁrst aircraft as a constraint, and so on,
up to the mth aircraft which considers the m− 1 previ-
ous aircraft trajectories as constraints. The trajectory
assigned to an aircraft in each resolution step must
avoid other aircraft trajectories that are considered as
ﬁxed constraints (known data). In our case, the air-
craft ordering is chosen at random. In practice, some
operational criteria may also be used in order to se-
lect a speciﬁc sequence (for instance: ﬁrst-come ﬁrst-
served rule, some aircraft may have higher priority,
trajectory length, etc.). LPA has been applied on a day
of traﬃc (August 12, 2008) with about 8000 ﬂights.
The initial trajectories (before conﬂict resolution) in-
duce a total number of clusters, with some aircraft
in real conﬂict, equal to 3344. The algorithm nearly
solves all conﬂicts, with only 28 situations for which
conﬂict-free trajectories have not been found. How-
ever, these situations correspond to some aircraft be-
ing already in conﬂict at the beginning of the simula-
tion, for instance at their starting point.Only 1501 tra-
jectories have been modiﬁed to reach such a conﬂict-
free planning. In many cases, the new computed tra-
jectories are shorter than the initial ones (those that
follow waypoints), due to the fact that LPA is search-
ing for the shortest path trajectories and proposes di-
rect routes when possible.
5 Optimal Control for Trajectory
Generation
5.1 Optimal Trajectory Generation
In the physical space, a trajectory is occasionally
represented as a four-dimensional ﬂight path, follow-
ing the tradition of air tra ﬃc control [20], with time
10


## Page 11

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
as the fourth dimension, in addition to the normally
used three-dimensional representation of a path. Gen-
erating time-parameterized paths necessitates the in-
corporation of the aircraft dynamics and /or kinemat-
ics, which makes the problem much more di ﬃcult
than simply ﬁnding a path that avoids obstacles in the
physical three-dimensional space. Path-planning is a
term commonly used in the robotics and artiﬁcial in-
telligence communities to refer to the problem of gen-
erating an obstacle-free path to be followed by a ve-
hicle (robot, aircraft, vehicle, etc) in a two or three
dimensional space containing obstacles [44].
Because the vehicle dynamics are not taken into
account in these path-planning methods (the solution
of which only considers the geometric constraints of
the problem) it is often the case that the resulting path
is infeasible, that is, it cannot be followed exactly or
even closely by the vehicle. One way to ensure that
the resulting paths correspond to feasible trajectories
satisfying the vehicle dynamics, is to use optimal con-
trol theory. The objective of optimal control theory is
to determine the control input(s) that will cause a pro-
cess (i.e., the response of a dynamical system) to sat-
isfy the physical constraints, while, at the same time,
minimize (or maximize) some performance criterion.
Feasibility of the trajectories is automatically ensured
using this approach. The typical optimal control prob-
lem (OCP) can be stated as follows:
Given initial conditions x0, ﬁnal conditions x f ∈
X, and an initial time t0≥ 0, determine the ﬁnal time
t f > t0, the control inputu(t)∈U and the correspond-
ing state history x(t) for t∈ [t0, t f ] which minimize
the cost function
J(x, u) =
∫t f
t0
L(x(t), u(t)) dt, (2)
where x(t) and u(t) satisfy, for all t∈ [t0, t f ] the dif-
ferential and algebraic constraints
˙x(t)− f (x(t), u(t)) = 0,
C(x(t), u(t))≤ 0. (3)
Optimal control has its roots in the theory of cal-
culus of variations, which originated in the 17th cen-
tury by Fermat, Newton, Liebniz, and the Bernoullis,
and was subsequently further developed by Lagrange,
Weirstrass, Legendre, Clebsch and Jacobi and others
in the 18th and 19th centuries [29]. Calculus of vari-
ations deals with the problem of minimizing (2) sub-
ject to the simple diﬀerential equality constraint of the
form ˙x(t)− u(t) = 0, and is not able to handle more
complicated diﬀerential equality constraints such as
(3) or algebraic constraints such as (3). It was not
until the middle of the 20th century when the Soviet
mathematician L. S. Pontryagin developed a complete
theory that could handle constraints such as (3) and
(3). Simply put, Pontryagin’s celebrated Maximum
Principle [53] states that the optimal control for the
solution of the problem (2)-(3) is given as the point-
wise minimum of the so-called Hamiltonian function,
that is,
uopt = argminu∈UH(t, x, λ, u), (4)
where H(t, x, λ, u) = L(x, u) + λT f (x, u) is the Hamil-
tonian, and λ are the co-states, computed from
˙λ(t) =− ∂H
∂x (x(t), λ(t), u(t)). (5)
subject to certain boundary (transversality) conditions
on λ(t f ). Unfortunately, an analytic solution to the
previous problem is diﬃcult. The optimal control for-
mulation of a trajectory optimization problem using
Pontryagin’s Maximum Principle (PMP) leads to a
Two-point Boundary Value Problem (TBVP), or a Multi-
point Boundary Value Problem (MBVP) when the op-
timal trajectory is composed of multiple phases. Nu-
merical techniques such as shooting and multiple shoot-
ing methods can be applied to solve accurately these
TBVP and MBVP, but their convergence is very sen-
sitive to the choice of an initial guess for the solution.
A software that solves the optimal control problem us-
ing this approach is BNDSCO [50]. BNDSCO is an
example of a class of numerical optimization methods
which are often referred to as indirect methods. The
term indirect reﬂects the fact that in these methods a
solution is sought not by maximizing (or minimizing)
the cost (2) but, rather, by computing potential opti-
mizers by solving the corresponding necessary opti-
mality conditions (4)-(5).
In recent years, direct methods have become in-
creasingly popular for solving trajectory optimization
problems, the major reason being that direct methods
do not require an analytic expression for the necessary
conditions, which for complicated nonlinear dynam-
ics can be intimidating. Moreover, direct methods do
not need an initial guess for the co-states whose time
histories are diﬃcult to predict a priori. As mentioned
earlier, direct methods, do not try to satisfy the neces-
sary conditions of optimality from PMP, instead, they
minimize directly (2) subject to (3)-(3).
The main idea behind direct methods is to dis-
cretize the states and controls of the original continuous-
time optimal control problem in order to obtain a ﬁnite-
dimensional nonlinear programming problem (NLP).
The solution of this NLP, which consists of discrete
11


## Page 12

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
variables, is used to approximate the continuous con-
trol and state time histories. Typical direct methods
are collocation methods, which discretize the ordi-
nary diﬀerential equations (ODEs) of the problem us-
ing collocation or interpolation schemes [60, 77, 23,
36]. They introduce the collocation conditions as NLP
constraints together with the initial and terminal con-
ditions. The so-called “pseudospectral” methods use
orthogonal polynomials to choose the collocation points
and are very e ﬃcient, exhibiting superlinear conver-
gence when the solution is smooth. Numerical opti-
mal control software packages that implement direct
methods for the solution of OCPs include SOCS [12],
RIOTS [67], DIDO [59], PSOPT [8], GPOPS [57],
MTOA [40] and DENMRA [81] among many oth-
ers. A recent survey of numerical optimal control
techniques for trajectory optimization can be found
in [10].
In all these direct methods, the convergence rate
and the quality of solution depends on the grid used
to discretize the equations, the cost and the problem
constraints. Uniform or ﬁxed grid methods tend to
perform poorly, especially when the problem has sev-
eral discontinuities or irregularities. Not surprisingly,
adaptive grid methods have been developed to accu-
rately capture any discontinuities or switchings in the
state or control variables. The main idea behind all
these adaptive grid methods is to use a high resolution
(dense) grid only in the vicinity of control switches,
constraint boundaries etc, and a coarse grid elsewhere.
Examples of such adaptive gridding techniques for
the solution of optimal control problems are [11, 14,
67, 13, 41, 33].
A major issue with almost all current trajectory
optimization solvers (direct or indirect) is the fact that
their computational complexity is high and their con-
vergence dependents strongly on the initial conditions,
unless certain rather stringent convexity conditions hold.
As a result, the solution of trajectory optimization prob-
lem in real-time is still elusive. A common line of at-
tack for solving trajectory optimization problems in
real time (or near real time) is to divide the prob-
lem into two phases: an o ﬄine phase and an online
phase [71, 46, 42, 79]. The o ﬄine phase consists of
solving the optimal control problem for various refer-
ence trajectories and storing these reference trajecto-
ries onboard for later online use. These reference tra-
jectories are used to compute the actual trajectory on-
line via a neighboring optimal feedback control strat-
egy typically based on the linearized dynamics. An-
other strategy for computing near-optimal trajectories
in real-time is to use a receding horizon (RH) ap-
proach [51, 9, 78]. In a receding horizon approach
a trajectory that optimizes the cost function over a
period of time, called the planning horizon , is de-
signed ﬁrst. The trajectory is implemented over the
shorter execution time and the optimization is per-
formed again starting from the state that is reached at
the end of the execution time. A third approach is to
use a two-layer architecture, where ﬁrst an acceptable
(in terms of length, safety, etc) path is computed using
common path-planning techniques, and then an opti-
mal time-parameterization is imposed on this path to
yield a feasible trajectory. As mentioned earlier such
an approach needs to be carefully designed to ensure
compatibility of the resulting path with the vehicle dy-
namics. However, when successful, such an approach
is numerically very eﬃcient and can be implemented
in real-time with current computer hardware. Even
if the resulting trajectory is not exactly feasible, it is
often close to a feasible trajectory, or it can be made
as such using smoothing techniques [83]. As a re-
sult, alternatively, the ﬁnal trajectory can be used as
a good initial guess for a follow-up optimal trajectory
generator. The next section summarizes this approach
for applications related to aircraft maneuvering under
strict time and fuel constraints. For more details the
interested reader is referred to [82, 5, 80].
6 Trajectory Optimization Methods in
ATM
Aircraft maneuvering was one of the ﬁrst areas
where optimal control theory was used to generate op-
timal trajectories. Not surprisingly, traditionally, most
work has been focused on military aircraft. Relevant
references on this subject are too many to enumerate
here. We just mention the work on fuel and range op-
timization studied in [34, 72, 70], and the minimum-
time, three-dimensional aircraft trajectory optimiza-
tion problem considered in [66]. In the latter, an ap-
proximation of the aircraft dynamics using an energy
state was used to reduce the dimension of the problem
for better convergence. This type of model reduction
technique is commonly used for aircraft trajectory op-
timization [1].
Some of these results have been extended to com-
mercial airline operations. For example, the work of
[18] deals with the problem of minimum-fuel trajecto-
ries with ﬁxed time-of-arrival (TOA) for several civil
aviation aircraft including B737, B747 and B767. Tra-
jectory planning problems have also been studied in
the context of air tra ﬃc management (ATM) and au-
tomation. Reference [38] performed a sensitivity anal-
12


## Page 13

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
ysis of trajectory prediction for ATM. The aircraft tra-
jectory synthesis problem is studied in [73] to provide
some basic tools for air traﬃc automation. Somewhat
related is the recent work of Sridhar [74], in which
he considered the generation of wind-optimal trajec-
tories for cruising aircraft while avoiding the regions
of airspace that facilitate persistent contrails forma-
tion. A shooting method was employed to solve the
associated optimal control problem by minimizing a
weighted sum of ﬂight time, fuel consumption, and a
term penalizing the contrail formation. The airspace
avoidance problem has also been considered in Ref. [39].
In that reference, the avoidance of restricted airspace
is formulated as a non-convex constrained trajectory
optimization problem; it is claimed that with a fea-
sible starting guess, the e ﬃciency of the optimiza-
tion algorithm is not degraded too much by the non-
convex airspace constraints. Finally, some researchers
have used ideas from stochastic optimal control to
deal with issues related to the unpredictability of fu-
ture trajectory, wind e ﬀects, presence of additional
aircraft in the ATM airspace etc [45, 76].
In this work we deal with the problem ofeﬃciently
generating minimum-time and minimum-fuel (with ﬁxed TOA)
landing trajectories for commercial aircraft. The for-
mer problem is of relevance in case of an on-board
emergency where the pilot has to land the airplane
quickly and safely to the closest airport or airﬁeld; the
latter problem is of interest for typical terminal ATC
phase applications. Prior work in emergency land-
ing includes the abort landing problem in the pres-
ence of windshear [16, 17, 48], and emergency land-
ing during loss of thrust [75]. The latter references
generate feasible trajectories using segments of tra-
jectories corresponding to selected trim condition ma-
neuvers. The search results are however limited to
those that can be generated by connecting trim state
trajectory segments with stable transitions. Because
the unstable ﬂight conditions are not considered in
the search, the algorithm cannot identify any feasi-
ble trajectories containing unstable ﬂight modes. Fur-
thermore, the path length is used as the search cri-
terion, which is less appropriate when compared to
ﬂight time for emergency landing, or fuel consump-
tion for normal ﬂight. Related work includes the in-
vestigation of Atkins et al [4], where the problem of
emergency landing due to the loss-of-thrust was stud-
ied using a hybrid approach. A two-step landing-site
selection/trajectory generation process was adopted
to generate safe emergency plans in real time under
situations that require landing at an alternate airport.
In the trajectory generation routine, a heuristic path
planner was used to generate a three-dimensional tra-
jectory connecting the current position of the aircraft
to the runway, which consists of straight lines and cir-
cular arcs. This method is fast and simple. However,
it is limited to conservative aircraft maneuvers (typi-
cally Dubins paths) in order to reduce the chance of
obtaining an infeasible trajectory. As a result, the op-
timality of the generated trajectory could be unaccept-
able for emergency landing, and further research is
necessary to reduce such a conservatism.
In our approach, we start with the assumption that
the path to be followed by the aircraft is given. Note
that this does not mean that the trajectory to be fol-
lowed is given. A trajectory requires a time-parameterized
path and it is, indeed, the main goal of this approach
to provide such a time parameterization so as to meet
feasibility along with certain optimality speciﬁcations.
The assumption that the path is given is not as un-
usual or atypical as one may initially think. Com-
mercial airliners during the terminal landing phase,
are required to follow strict Air Traﬃc Control (ATC)
rules, which guide the airplanes to follow “virtual”
three-dimensional corridors all the way to the landing
strip. Furthermore, since our approach leads to very
fast computation of feasible trajectories, one can use
the approach over new, locally modiﬁed paths repeat-
edly till a satisfactory path is found.
To this end, let a path in the three-dimensional
space, parameterized by the path coordinates, be given
as follows: x = x(s), y = y(s), z = z(s), where
s ∈ [s0, s f ]. The main objective is to ﬁnd a time-
parameterization along the path, i.e., a function s(t),
where t ∈ [0, t f ] such that the corresponding time-
parameterized trajectory ( x(s(t)), y(s(t)), z(s(t))) min-
imizes either the ﬂight time t f (emergency landing
case) or fuel (terminal landing operation). As shown
in [80] all control (thrust, angle of attack, load fac-
tor, etc) constraints can be mapped into constraints
involving the speciﬁc kinetic energy of the aircraft,
E = v2/2 where v is the aircraft velocity of the form
gw(s)≤ E(s)≤ gw(s),
for some path-dependent functions gw(s) and gw(s).
The original problems therefore reduce to the follow-
ing simpliﬁed problems:
For the Minimum-Time Problem we have
min
T
∫ s f
s0
ds√2E(s)
(6a)
subject to E′(s) = T(s)
m − D(E(s), s)− g sin γ(s),(6b)
13


## Page 14

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
gw(s)≤ E(s)≤ gw(s), (6c)
Tmin≤ T(s)≤ Tmax, (6d)
and for the Minimum-fuel Problem with ﬁxed TOA
we have
min
T
∫ s f
s0
T(s) ds, (7a)
subject to E′(s) = T(s)
m − D(E(s), s)− g sin γ(s),(7b)
t′(s) = 1√2E(s)
, (7c)
gw(s)≤ E(s)≤ gw(s) (7d)
Tmin(s)≤ T(s)≤ Tmax(s), (7e)
where D(E(s), s) is the drag, T is the thrust, γ is the
ﬂight-path angle, and where prime denotes di ﬀerenti-
ation with respect to path length s. The main advan-
tage of these problem formulations is the dimension-
ality reduction of the problem that can be leveraged to
solve both of these problems very e ﬃciently and re-
liably. In fact, these OCPs are simple enough so that
the optimal switching structure of the optimal solution
can be unraveled using the necessary conditions from
PMP. For the minimum-fuel problem the switching
structure varies depending on the given TOA. How-
ever, for a given path and a ﬁxed TOA, the structure
is uniquely determined. This helps tremendously the
convergence properties of the algorithm.
The overall architecture for optimal on-line tra-
jectory generation is shown in Fig. 16. As shown in

Landing
Task
Geometric
Path Planner
Feasible?
Back-up
Trajectory
Numerical
Optimal Control
Optimal
Trajectory
No
Yes
Time
Parameterization
Path
Smoothing
Figure 16 Schematic of landing trajectory optimiza-
tion.
this ﬁgure, the method ﬁrst generates a trajectory by
assigning an optimal time parameterization along the
path given by the geometric path planner via the so-
lution of one of the previous two optimization prob-
lems. If the trajectory is feasible, then it is used as an
initial guess for the numerical optimal control solver.
Meanwhile, such a feasible trajectory is also stored
as a back-up plan in case of the failure of the NLP
solver. If the trajectory generated by the time-optimal
path tracking method is not feasible, then the path is
revised using the path smoothing method described
in [83], and the optimization is applied again to the
smoothed path. The process is repeated until either
the trajectory is feasible, or the maximum number of
iterations is reached. If no feasible trajectory can be
obtained after reaching the iteration limit, the infeasi-
ble trajectory is passed to the numerical optimal con-
trol algorithm, which makes a last attempt to produce
a feasible trajectory. If this last attempt is not suc-
cessful, then it does not exist a feasible trajectory that
solves the problem.
7 Path planning techniques via natural
language processing and
mathematical programming: A
paradigm for future aircraft
trajectory management
Aircraft trajectory planning has reached enough
maturity to shift the trajectory planning problem from
the mathematical optimization of the aircraft trajec-
tory to the automated parsing and understanding of
desired trajectory goals, followed by their re-formulation
in terms of a mathematical optimization program. To
a large extent, we propose a possible evolution of the
Flight Management System currently used on all trans-
port aircraft to become a full-ﬂedged autonomous logic
that may also be used on unmanned aerial vehicles
as an alternative to the current -and bulky- Remotely-
Piloted Vehicle (RPV) paradigm. What follows is a
direct extension of work originally presented in [65].
The overall proposed architecture is shown in Fig. 17.
It consists of several nested feedback loops. At the
operator level, the information is presented to the op-
erator in the form of sentences expressed in natural
language (eg that used by air tra ﬃc control phrase-
ology). At the level of trajectory planning automa-
tion, the information is presented as a mix of continu-
ous parameters (aircraft position and speed), and dis-
crete parameters describing mission status (completed
tasks, tasks remaining to be completed). The operator
14


## Page 15

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
Figure 17 Basic Autonomous Mission Management
Loop for future Aircraft and UA Vs
formulates the vehicles’s goals (eg ﬂight plans) us-
ing natural language. A natural language interpreter
and task scheduler transforms the operator’s require-
ments into tractable mathematical optimization pro-
grams that may be executed by the the vehicle through
its ﬂight control computer. The vehicle’s innermost
dynamics (that consist of raw vehicle dynamics and
stability augmentation system), although critical to ve-
hicle stability, are not shown.
7.1 Natural language parsing and generation
The main goal of using a Natural Language Inter-
face (NLI) for interacting with a computer-based sys-
tem is to minimize the workload on the operator. Us-
ing normal English sentence commands and reports
indeed allows an operator to communicate eﬃciently
and e ﬀectively with the an aircraft, as if it were a
human pilot. The NLI module that we have devel-
oped for demonstration purposes consists of two ma-
jor components. The ﬁrst one takes sentence com-
mands from the operator (presumably an air tra ﬃc
controller) and turns them into a formally coded com-
mand that looks like the formulation of an optimiza-
tion problem. The second component takes a coded
command set from the aircraft and generates natural
language responses for the air tra ﬃc controller to in-
terpret. A sample dialog between the human operator
and the machine could be as follows:
Controller: Flight AA1234, this is Air Tra ﬃc Con-
trol.
Aircraft: Go ahead, Air Traﬃc Control.
Controller: Add new waypoint. Proceed to waypoint
Echo-Charlie 5 in minimum time. and wait for further
instructions after the task is completed
Aircraft: Roger. Acknowledge task information - pro-
ceeding to waypoint Echo-Charlie 5.
Controller: AA1234, out.
The NLI module analyzes the natural sentences
produced by the air tra ﬃc controller using parsing,
which is the process of converting an input sentence,
e.g. “Proceed to waypoint Echo-Charlie 5 in mini-
mum time,” into a formal representation. The lat-
ter is typically a tree structure which can in turn be
translated into an explicit formal command. In our
system, parsing consists of ﬁrst applying entity ex-
traction to all the individual concepts (e.g. “Flight
AA1234” or “Echo-Charlie 5”) and then combining
these concepts through cascades of ﬁnite-state trans-
ducers using techniques derived from those described
in [58]. While natural language processing represents
our progress so far, it is easy to imagine that it could
now be completed by a voice recognition device to
further ease the level of communication between con-
troller (or operator) and aircraft.
7.2 Task Scheduling and Communications Inter-
facing
The task scheduling and communications process-
ing components are designed to centralize all of the
aircraft mission processing in one module. Together
with the Natural Language Interface, it provides ﬂex-
ibility for an operator to insert and change ﬂight plan
during the ﬂight. The aircraft software keeps track of
the ﬂight tasks, waypoint locations and known obsta-
cles to pass on to the guidance algorithm. The com-
munications processing component provides the air
traﬁc controller or operator with the authority to send
commands and receive status updates, threat or ob-
stacle avoidance information and acknowledgement
messages. It also provides remote pilots monitoring
the ﬂight with the ability to override the guidance sys-
tem in the event of an emergency or error. The system
sends threat and override information to the air traﬃc
controller before any status or update information in
an eﬀort to send the most important data relevant to
the demonstration before any auxiliary information.
Input/Output data are processed every 1 Hz frame be-
fore the task planner and guidance step to ensure that
the most up-to-date information is used by the aircraft
trajectory planner. The task scheduling component
operates like a Flight Management System and allows
the aircraft operator or the air traﬃc manager to enter
a ﬂight plan using a pre-deﬁned list or as programmed
during a mission. Many additional features may be
added to such a task scheduler, such as orders to fol-
low loiter patterns, ‘take me home’ or low-emission
approaches functionalities. In addition, he or she has
the option of providing (in real- time via the NLI) the
optimization metric used by the trajectory generation
15


## Page 16

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
algorithm (i.e. minimum time, minimum fuel, or the
amount of time to ﬁnish the ﬂight). Next, the opera-
tor can either give the aircraft a new plan or change
the current plan it is performing. A “New Plan” com-
mand is added to the end of the aircraft task list and
is executed after all of the tasks currently scheduled
have been completed. A “Change Plan” command, on
the other hand, modiﬁes the current task performed by
the aircraft. Once a task is completed, it is removed
from the list. After each of these actions, an acknowl-
edgement is sent to the air tra ﬃc controller and the
updated task information is included in the data sent
to the Trajectory Generation Module.
7.3 Trajectory planning
After the Natural Language Interface and Flight
Planning and Scheduling components have converted
the ﬂight plan into a series of tasks for the aircraft
to perform, the Trajectory Generation Module guides
the vehicle from one task to the next, i.e. from an ini-
tial state to a desired one, through an obstacle ﬁeld
while optimizing a certain objective. The latter can
be to minimize time, fuel or a combination of both.
Much of the functionality described below becomes
increasingly available in today’s avionics systems, and
also include such real-world factors as weather and
wind conditions. For our purposes, 2D scenarios were
considered in which special-use airspace and other
no-ﬂy zones are viewed as obstacles and detected while
the ﬂight proceeds. The environment is always fully
characterized inside a certain detection region D around
the aircraft. The resulting formulation can, however,
be easily generalized to account for any detection shape,
such as a radar cone, and for unknown areas within
that shape. Since trajectories must be dynamically
feasible, the aircraft dynamics and kinematics should
be accounted for in the planning problem. For opti-
mization purposes, the vehicle is characterized by a
discrete time, linear state space model (A, B) in an in-
ertial 2D coordinate frame (east-north). As such, the
state vector x consists of the east-north position (x, y)
and corresponding inertial velocity ( ˙x, ˙y). Depending
on the particular model, the input vector u is an iner-
tial acceleration or reference velocity vector. In both
cases, however, combined with additional linear in-
equalities in x and u, the state space model must cap-
ture the closed-loop dynamics that result from aug-
menting the aircraft with a waypoint tracking con-
troller. Since the environment is only partially-known
and further explored in real-time, a receding horizon
planning strategy is used to guide the vehicle towards
the desired destination.
The latter is denoted byx f and is an ingress/egress
state of a waypoint with a corresponding inertial ve-
locity vector. At each time step, a partial trajectory
from the current state towards the goal is computed
by solving the trajectory optimization problem over a
limited horizon of length T. Because of the computa-
tion delay, the initial state x0 = (x0, y0, ˙x0, ˙y0) in the
optimization problem should be an estimate xestim of
the position and inertial velocity of the aircraft when
the plan is actually implemented. The solution to the
optimization problem provides a sequence of way-
points (xi, yi) and corresponding inertial reference ve-
locities ( ˙xi, ˙yi) to the aircraft for the nextT time steps.
Typically, however, only the ﬁrst waypoint and refer-
ence velocity of this sequence are given to the way-
point follower, and the process is repeated at the next
time step. As such, new information about the state
of the vehicle and the environment can be taken into
account at each time step. By introducing a cost func-
tion JT over the T time steps, the general trajectory
optimization problem can be formulated as to
Minimizexi,ui JT =
T∑
i=1
fi(xi, ui, x f ) + fT (xT , x f )
Subject to

xi+1 = A xi + Bui, i = 0, . . . ,T− 1
x0 = xestim
xi∈X 0, i = 1, . . . ,T
ui∈U 0, i = 0, . . . ,T− 1
(xi, yi)∈D 0, i = 1, . . . ,T
(xi, yi)\ ∈O0, i = 1, . . . ,T
The objective function consists of stage costsfi(xi, ui, x f )
corresponding to each time step i, and a terminal cost
term fT (xT , x f ) that accounts for an estimate of the
cost-to-go from the last state xT in the planning hori-
zon to the goal statex f . The setsX0 andU0 represent
the (possibly non-convex) constraints on the vehicle
dynamics and kinematics,such as bounds on velocity,
acceleration and turn rate. Here, the 0-subscript de-
notes the fact that these constraints can be dependent
on the initial state. Lastly, the expressions ( xi, yi)∈
D0 and ( xi, yi)\ ∈O0 capture the requirement that the
planned trajectory points should lie inside the known
regionD0, but outside the obstaclesO0 as given at the
current time step i = 0. Note that they are assumed
to hold for x0; if not, the trajectory optimization prob-
lem would be infeasible from the start. As demon-
strated in [64], however, despite the detection region
and avoidance constraints, the above receding hori-
zon strategy has no safety guarantees regarding avoid-
ance of obstacles in the future. Namely, the algorithm
may fail to provide a solution in future time steps
16


## Page 17

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
due to obstacles that are located beyond the surveil-
lance and planning radius of the vehicle. For instance,
when the planning horizon is too short and the maxi-
mum turn rate relatively small, the aircraft might ap-
proach a no-ﬂy zone too closely before accounting for
it in the trajectory planning problem. As a result, it
might not be able to turn away in time, which trans-
lates into the optimization problem becoming infea-
sible at a future receding horizon iteration. In [64],
a safe receding horizon scheme was therefore pro-
posed based on maintaining a known feasible trajec-
tory from the ﬁnal state xT in the current planning
horizon towards an obstacle-free holding pattern. The
latter must lie in the region D0 of the environment
that is fully characterized at the current time step, and
is computed and updated online. Assuming that the
planned trajectories can be accurately tracked, at each
time step, the remaining part of the previous plan to-
gether with the holding pattern can then always serve
as an a priori safe backup or “rescue” plan. In prac-
tice, we have found that formulating the problem of
ﬁnding the nominal and rescue trajectories optimiza-
tion as mixed-integer programs (MIP) works very well
in practice, though such choices are not mandatory
and may be replaced by the other techniques discussed
in this paper.
8 Conclusion
This survey has shown several approaches for tra-
jectory modeling. As it has been mentioned, trajec-
tories are belonging to inﬁnite dimension space for
which dimension reduction has to be implemented.
Using trajectory samples vectors is really redundant
and ineﬃcient. After having presented some deﬁni-
tions and some features of aircraft trajectories, some
dimension reductions methods have been presented in
order to be included in an optimization process. In-
terpolation and approximation technique have been
presented and some information have also been given
about Principal Component Analysis and Homotopy.
The next section has presented wave front propaga-
tion approaches and gives some details on Fast March-
ing Algorithms and Ordered upwind algorithm. An
application to real problem coming from air tra ﬃc
management has also been given with the descrip-
tion of the light propagation algorithm (LPA). The
fourth part has focused on methods coming automatic
control for which vehicle dynamics are explicitly in-
cluded in the models. Some applications to air tra ﬃc
management have also been presented. Finally, the
ﬁfth part has presented an original path planning tech-
niques mixing natural language processing and math-
ematical programming.
References
[1] Control and dynamic systems: Advances in the-
ory and applications, Academic Press, 1973.
[2] Vink A., Eatchip medium term conﬂict de-
tection: Part 1 eatchip context , Proceed-
ing of the Air Tra ﬃc Management Seminar,
FAA/Eurocontrol, 1997.
[3] H. Abdi and L.J. Williams, Principal component
analysis, Interdisciplinary Reviews: Computa-
tional Statistics 2, (2010), 433–459.
[4] E.M Atkins, I.A Portillo, and M.J Strube, Emer-
gency ﬂight planning applied to total loss of
thrust, Journal of Guidance, Control, and Dy-
namics 43 (2006), no. 4, 1205–1216.
[5] E. Bakolas, Y . Zhao, and P. Tsiotras, Initial
guess generation for aircraft landing trajectory
optimization, AIAA Guidance, Navigation, and
Control Conference, AIAA, 2011.
[6] R.H Bartels, J.C Beatty, and B.A Barskyn,
An introduction to splines for use in computer
graphics and geometric modeling , Computer
graphics, Morgan Kaufmann, 1998.
[7] McNally B.D., Bach R.E., and Chan W., Field
test evaluation of the ctas conﬂict prediction
and trial planning capability , Proceeding of
the AIAA-1998-4480 AIAA GNC Conference,
AIAA GNC, 1998.
[8] V .M. Becerra,Psopt optimal control solver user
manual, Tech. report, 2011.
[9] J Bellingham, Y Kuwata, and J How, Stable re-
ceding horizon trajectory control for complex
environment, AIAA Guidance, Navigation, and
Control Conference and Exhibit, AIAA, 2003.
[10] J.T. Betts, Survey of numerical methods for tra-
jectory optimization, Journal of Guidance, Con-
trol, and Dynamics 21 (1998), no. 2, 193–207.
[11] J.T. Betts, N. Biehn, S.L. Campbell, and W.P.
Huﬀman, Compensating for order variation in
mesh reﬁnement for direct transcription meth-
ods, Journal of Computational and Applied
Mathematics 125 (2000), 147–158.
17


## Page 18

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
[12] J.T. Betts and W.P Hu ﬀman, Sparse optimal
control software SOCS, Tech. report, Mathemat-
ics and Engineering Analysis Technical Doc-
ument MEALR-085, Boeing Information and
Support Services,The Boeing Compan, 1997.
[13] J.T Betts and W.P. Huﬀman, Mesh reﬁnement in
direct transcription methods for optimal control,
Optimal Control Applications and Methods 19
(1998), no. 1, 1–21.
[14] T. Binder, L. Blank, W. Dahmen, , and W Mar-
quardt, Grid reﬁnement in multiscale dynamic
optimization, Tech. report, RWTH Aachen,
2000.
[15] Birkho ﬀ and C de Boor, Piecewise polynomial
interpolation and approximation, Proceeding of
the General Motors Symposium of 1964, Gen-
eral Motors, 1964.
[16] R Bulirsch, F. Montrone, and H.J. Pesch, Abort
landing in the presence of windshear as a min-
imax optimal control problem Part I: Necessary
conditions, Journal of Optimization Theory and
Applications 70 (1991), no. 1, 1–23.
[17] , Abort landing in the presence of wind-
shear as a minimax optimal control problem
Part II: Multiple shooting and homotopy , Jour-
nal of Optimization Theory and Applications 70
(1991), no. 2, 223–254.
[18] J.W. Burrows, Fuel-optimal aircraft trajectories
with ﬁxed arrival times , Journal of Guidance,
Control, and Dynamics 6 (1983), no. 1, 14–19.
[19] Mecki ﬀ C., Chone R., and Nicolaon J.P., The
tactical load smoother for multi-sector plan-
ning, Proceeding of the Air Traﬃc Management
Seminar, FAA/Eurocontrol, 1998.
[20] A Chakravarty, Four-dimensional fuel-optimal
guidance in the presence of winds , Journal of
Guidance, Control, and Dynamics 8 (1985),
no. 1, 16–22.
[21] C de Boor, A practical guide to splines ,
Springer-Verlag, 1978.
[22] Brudnicki D.J. and McFarland A.L., User re-
quest evaluation tool (uret) conﬂict probe per-
formance and beneﬁts assessment , Proceed-
ing of the Air Tra ﬃc Management Seminar,
FAA/Eurocontrol, 1997.
[23] P.J. Enright and B.A. Conway,Discrete approxi-
mation to optimal trajectories using direct tran-
scription and nonlinear programming , Journal
of Guidance, Control, and Dynamics 15 (1992),
994–1002.
[24] Evans J. et al, Reducing severe weather de-
lays in congested airspace with weather sup-
port for tactical air tra ﬃc management , Pro-
ceeding of the Air Traﬃc Management Seminar,
FAA/Eurocontrol, 2003.
[25] Kirk D.B. et al, Problem analysis resolution
and ranking (parr) development and assess-
ment, Proceeding of the Air Traﬃc Management
Seminar, FAA/Eurocontrol, 2001.
[26] Masalonis A. et al, Using probabilistic demand
prediction for traﬃc ﬂow management decision
support, Proceeding of the AIAA-2004-4875
AIAA GNC Conference, AIAA GNC, 2004.
[27] Sud V . et al, Air traﬃc ﬂow management col-
laborative routing coordination tools, Proceed-
ing of the AIAA-2001-4112 AIAA GNC Con-
ference, AIAA GNC, 2001.
[28] Swensen H.N. et al, Design and operational
evaluation of the traﬃc management advisor at
the forth worth air route tra ﬃc control center ,
Proceeding of the Air Traﬃc Management Sem-
inar, FAA/Eurocontrol, 1997.
[29] G.M. Ewing, Calculus of variations with appli-
cations, Norton, New York 1969, reprinted by
Dover, 1985.
[30] Farin, Gerald, and Hansfordand Dianne, The es-
sentials of cagd, A K Peters, Ltd, 2000.
[31] G Farin, Curves and surfaces for computer
aided geometric design. a practical guide, Aca-
demic Press, 1993.
[32] Douglas C. Giancoli, Physics for scientists and
engineers with modern physics , second ed.,
Prentice-Hall, 1989.
[33] Q Gong, F. Fahroo, and I.M. Ross, Spectral al-
gorithm for pseudospectral methods in optimal
control, Journal of Guidance, Control, and Dy-
namics 31 (2008), no. 3, 460–471.
[34] W. Grimm, K. Well, and H. Oberle, Periodic
control for minimum-fuel aircraft trajectories ,
Journal of Guidance, Control, and Dynamics 9
(1986), no. 2, 169–174.
18


## Page 19

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
[35] Erzberger H., Paielli R.A., Isaacson D.R., and
Eshowl M.M., Conﬂict detection in the presence
of prediction error, Proceeding of the Air Traﬃc
Management Seminar, FAA/Eurocontrol, 1997.
[36] C.R. Hargraves and S.W. Paris, Direct trajectory
optimization using nonlinear programming and
collocation, Journal of Guidance, Control, and
Dynamics 15 (1992), 994–1002.
[37] T Hearth, M, Scientiﬁc computing, an introduc-
tory survey, Computer graphics, McGraw-Hill,
2002.
[38] M.R. Jackson, Y . Zhao, and R.A. Slattery,Sensi-
tivity of trajectory prediction in air tra ﬃc man-
agement, Journal of Guidance, Control, and Dy-
namics 22 (1999), no. 2, 219–228.
[39] M Jacobson and U.T. Ringertz, Airspace con-
straints in aircraft emission trajectory optimiza-
tion, Journal of Aircraft 47 (2010), 1256–1265.
[40] S Jain and P. Tsiotras, Multiresolution-based di-
rect trajectory optimization , Journal of Guid-
ance, Control, and Dynamics 31 (2008), no. 5,
1424–1436.
[41] S. Jain and P Tsiotras, Trajectory optimiza-
tion using multiresolution techniques, Journal of
Guidance, Control, and Dynamics 31 (2008),
no. 5, 1424–1436.
[42] M.R. Jardin and A.E. Bryson, Neighboring opti-
mal aircraft guidance in winds, Journal of Guid-
ance, Control, and Dynamics 24 (2001), 710–
715.
[43] H. Je ﬀreys and B. S. Jeﬀreys, Methods of math-
ematical physics , Cambridge University Press,
1988.
[44] S.M LaValle, Planning algorithms, Cambridge
University Press, 2006.
[45] W. Liu and I Hwang, Probabilistic aircraft mid-
air conﬂict resolution using stochastic optimal
control, IEEE Intelligent Transportation Sys-
tems Transactions and Magazine (2012).
[46] P. LU, Regulation about time-varying trajecto-
ries: Precision entry guidance illustrated, Jour-
nal of Guidance, Control, and Dynamics 22
(1999), 784–790.
[47] Berger M. and Gostiaux B., Diﬀerential geom-
etry: Manifolds, curves and surfaces , Springer-
Verlag, 1988.
[48] A. Miele, Optimal trajectories and guidance
trajectories for aircraft ﬂight through winds-
hears, Proceedings of the 29th IEEE Conference
on Decision and Control, IEEE, 1990.
[49] S. Mondoloni, Pagli S.M., and Green S., Trajec-
tory modeling accuracy for air tra ﬃc manage-
ment decision support tools , Proceeding of the
ICAS Conference, ICAS, 2002.
[50] H.J. Oberle and W. Grimm, BNDSCO - A pro-
gram for the numerical solution of optimal con-
trol problems, Tech. report, Institute for Flight
System Dynamics, German Aerospace Research
Establishment Oberpfaﬀenhofen, 1989.
[51] T. Ohtsuka, Quasi-Newton-type continuation
method for nonlinear receding horizon control ,
Journal of Guidance, Control, and Dynamics 24
(2002), 685–692.
[52] S. Osher and J.A. Sethian, Fronts propagating
with curvature-dependent speed: Algorithms
based on Hamilton-Jacobi formulations , Jour-
nal of computational physics 79 (1988), no. 1,
12–49.
[53] L.S. Pontryagin, V .G. Boltyanski, R.V . Gamkre-
lidze, and E.F. Mischenko, The mathematical
theory of optimal processes, New York, NY: In-
terscience, 1962.
[54] C. Ptrs, Y . Pailhas, P. Patron, Y . Petillot,
J. Evans, and D. Lane, Path planning for au-
tonomous underwater vehicles , IEEE Transac-
tions on Robotics, 23 (2007), no. 2, 331–341.
[55] Coppenbarger R., Lanier R., Sweet D., and
Dorsky S., Design and development of the en-
route descent advisor (eda) for conﬂict-free ar-
rival metering, Proceeding of the AIAA-2004-
4875 AIAA GNC Conference, AIAA GNC,
2004.
[56] Slattery R. and Zhao Y .,Trajectory synthesis for
air traﬃc automation, AIAA Journal Guidance
Control and Dynamics 20-2, (1997), 232–238.
[57] A.V Rao, D Benson, and G.T. Huntington,
User’s manual for GPOPS version 4.x: A mat-
lab package for software for solving multiple-
phase optimal control problems using hp-
adaptive pseudospectral methods, Tech. report,
2011.
19


## Page 20

D. Delahaye, S. Puechmorel, E. Feron, P. Tsiotras
[58] E. Roche, Parsing with ﬁnite-state transducers,
Finite-State Language Processing (E. Roche and
Y . Schabes, eds.), MIT Press, 1997.
[59] I.M. Ross, ‘user’s manual for DIDO: A MAT-
LAB application package for solving optimal
control problems, Tech. report, Naval Postgrad-
uate School, 2005.
[60] R.D. Russell and L.F Shampine, A colloca-
tion method for boundary value problems , Nu-
merische Mathematik 19 (1972), 13–36.
[61] H.F. Ryan, Paglione M., and Green S., Review
of trajectory accuracy methodology and com-
parison of error measure metrics , Proceding of
the AIAA-2004-4787 AIAA GNC Conference,
AIAA GNC, 2004.
[62] Mondoloni S. and Bayraktuta I., Impact of fac-
tors, conditions and metrics on trajectory pre-
diction accuracy, Proceeding of the Air Tra ﬃc
Management Seminar, FAA/Eurocontrol, 2005.
[63] Swierstra S. and Green S., Common trajectory
prediction capability for decision support tools,
Proceeding of the Air Traﬃc Management Sem-
inar, FAA/Eurocontrol, 2003.
[64] T. Schouwenaars, J. How, and E. Feron, Re-
ceding horizon path planning with implicit
safety guarantees , American Control Confer-
ence (Boston, MA), June 2004, pp. 5576–5581.
[65] T. Schouwenaars, M. Valenti, E. Feron, J. How,
and E. Roche, Linear programming and lan-
guage processing for human /unmanned-aerial-
vehicle team missions, journal of guidance, con-
trol, and dynamics, AIAA Journal of Guidance,
Control, and Dynamics 29 (2006), no. 2, 303–
313.
[66] R.L. Schultz, Three-dimensional trajectory opti-
mization for aircraft, Journal of Guidance, Con-
trol, and Dynamics 13 (1990), no. 6, 936–943.
[67] A Schwartz, Theory and implementation of nu-
merical methods based on runge-kutta integra-
tion for solving optimal control problems, Ph.D.
thesis, Universit´e Montpellier II (France), 1996.
[68] J.A. Sethian, Fast marching methods, SIAM re-
view 41 (1999), no. 2, 199–235.
[69] J.A. Sethian and A. Vladimirsky, Ordered up-
wind methods for static Hamilton-Jacobi equa-
tions: Theory and algorithms, SIAM Journal on
Numerical Analysis 41 (2003), 325–363.
[70] H. Seywald, Long ﬂight-time range-optimal air-
craft trajectories, Journal of Guidance, Control,
and Dynamics 19 (1994), no. 1, 242–244.
[71] H. Seywald and E.M. Cliﬀ, Neighboring optimal
control based feedback law for the advanced
launch system , Journal of Guidance, Control,
and Dynamics 17 (1994), 1154–1162.
[72] H. Seywald, E.M. Cli ﬀ, and K. Well, Range op-
timal trajectories for an aircraft ﬂying in the ver-
tical plane, Journal of Guidance, Control, and
Dynamics 17 (1994), no. 2, 389–398.
[73] R.A. Slattery and Y . Zhao, Trajectory synthesis
for air traﬃc automation, Journal of Guidance,
Control, and Dynamics 20 (1997), no. 2, 232–
238.
[74] B Sridhar and N.Y . Ng, H.K.and Chen, Aircraft
trajectory optimization and contrails avoidance
in the presence of winds , Journal of Guidance,
Control, and Dynamics 34 (2011), 1577–1583.
[75] M.J. Strube, R.M. Sanner, and E.M Atkins, Dy-
namic ﬂight guidance recalibration after actua-
tor failure, AIAA 1st Intelligent Systems Tech-
nical Conference, AIAA, 2004.
[76] C Tomlin, G.J. Pappas, and S. Sastry, Conﬂict
resolution for air tra ﬃc management: A study
in multi-agent hybrid systems , IEEE Trans. on
Automatic Control 43 (1998).
[77] R Weiss, The application of implicit Runge-
Kutta and collocation methods to boundary
value problems , Mathematics of Computation
28 (1974), 449–464.
[78] P. Williams, Application of pseudospectral
methods for receding horizon control , Journal
of Guidance, Control, and Dynamics 27 (2004),
310–314.
[79] H. Yan, F Fahroo, and I.M. Ross, Real-time
computation of neighboring optimal control
laws, AIAA Guidance, Navigation, and Control
Conference and Exhibit, AIAA, 2002.
[80] Y . Zhao, Eﬃcient and robust aircraft landing
trajectory optimization , Ph.D. thesis, School
of Aerospace Engineering, Georgia Institute of
Technology, 2011.
20


## Page 21

ENRI Int. Workshop on ATM/CNS. Tokyo, Japan (EIW AC2013)
[81] Y . Zhao and P. Tsiotras, Density functions for
mesh reﬁnement in numerical optimal control ,
Journal of Guidance, Control, and Dynamics 34
(2010), no. 1, 271–277.
[82] , Time-optimal parameterization of ge-
ometric path for ﬁxed-wing aircraft , In-
fotech@Aerospace, AIAA, 2010.
[83] , Stable receding horizon trajectory con-
trol for complex environment, American Control
Conference, ACC, 2011.
Acknowledgements
Copyright
The authors conﬁrm that they, and /or their com-
pany or institution, hold copyright of all original ma-
terial included in their paper. They also conﬁrm they
have obtained permission, from the copyright holder
of any third party material included in their paper, to
publish it as part of their paper. The authors grant
full permission for the publication and distribution of
their paper as part of the EIW AC 2013 proceedings or
as individual oﬀ-prints from the proceedings.
21
