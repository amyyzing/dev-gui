# Vector Calculus University of Cambridge Part IA Mathematical Tripos

Converted from: `Calculus III\Vector Calculus Cambridge.pdf`


## Page 1

Vector Calculus
University of Cambridge Part IA Mathematical Tripos
David Tong
Department of Applied Mathematics and Theoretical Physics,
Centre for Mathematical Sciences,
Wilberforce Road,
Cambridge, CB3 OBA, UK
http://www.damtp.cam.ac.uk/user/tong/vc.html
d.tong@damtp.cam.ac.uk


## Page 2

Recommended Books and Resources
There are many good books on vector calculus that will get you up to speed on
the basic ideas, illustrated with an abundance of examples.
• H.M Schey, “Div, Grad, Curl, and all That ”
• Jerrold Marsden and Anthony Tromba, “Vector Calculus”
Schey develops vector calculus hand in hand with electromagnetism, using Maxwell’s
equations as a vehicle to build intuition for differential operators and integrals. Marsden
and Tromba is a meatier book but the extra weight is because it goes slower, not further.
Neither of these books cover much (if any) material that goes beyond what we do in
lectures. In large part this is because the point of vector calculus is to give us tools
that we can apply elsewhere and the next steps involve turning to other courses.
• Baxandall and Liebeck, “ Vector Calculus”
This book does things differently from us, taking a more rigorous and careful path
through the subject. For the most part, this involves being more careful from the off
about what spaces different objects live in. All of this will be treated in later courses,
but if you’re someone who likes all their i’s dotted, ϵ’s small, and ℏ’s uncrossed, then
this is an excellent place to look.


## Page 3

Contents
0 Introduction 3
1 Curves 6
1.1 Differentiating the Curve 7
1.1.1 Tangent Vectors 9
1.1.2 The Arc Length 10
1.1.3 Curvature and Torsion 12
1.2 Line Integrals 14
1.2.1 Scalar Fields 14
1.2.2 Vector Fields 16
1.3 Conservative Fields 19
1.3.1 The Gradient 19
1.3.2 Back to Conservative Fields 21
1.3.3 An Application: Work and Potential Energy 24
1.3.4 A Subtlety 25
2 Surfaces (and Volumes) 27
2.1 Multiple Integrals 27
2.1.1 Area Integrals 27
2.1.2 Changing Coordinates 31
2.1.3 Volume Integrals 34
2.1.4 Spherical Polar and Cylindrical Polar Coordinates 35
2.2 Surface Integrals 39
2.2.1 Surfaces 39
2.2.2 Surfaces with Boundaries 41
2.2.3 Orientability 43
2.2.4 Scalar Fields 44
2.2.5 Vector Fields and Flux 46
2.2.6 A Sniff of the Gauss-Bonnet Theorem 48
3 Grad, Div and Curl 52
3.1 The Gradient 52
3.2 Div and Curl 53
3.2.1 Some Basic Properties 56
3.2.2 Conservative is Irrotational 57
– i –


## Page 4

3.2.3 Solenoidal Fields 58
3.2.4 The Laplacian 60
3.2.5 Some Vector Calculus Equations in Physics 60
3.3 Orthogonal Curvilinear Coordinates 61
3.3.1 Grad 64
3.3.2 Div and Curl 64
3.3.3 The Laplacian 66
4 The Integral Theorems 67
4.1 The Divergence Theorem 67
4.1.1 A Proof of the Divergence Theorem 69
4.1.2 Carl Friedrich Gauss (1777-1855) 74
4.2 An Application: Conservation Laws 74
4.2.1 Conservation and Diffusion 76
4.2.2 Another Application: Predator-Prey Systems 77
4.3 Green’s Theorem in the Plane 80
4.3.1 George Green (1793-1841) 81
4.4 Stokes’ Theorem 82
4.4.1 A Proof of Stokes’ Theorem 86
4.4.2 George Gabriel Stokes (1819-1903) 88
4.4.3 An Application: Magnetic Fields 89
4.4.4 Changing Coordinates Revisited 90
5 The Poisson and Laplace Equations 92
5.1 Gravity and Electrostatics 92
5.1.1 Gauss’ Law 93
5.1.2 Potentials 96
5.2 The Poisson and Laplace Equations 97
5.2.1 Isotropic Solutions 98
5.2.2 Some General Results 100
5.2.3 Integral Solutions 104
6 Tensors 107
6.1 What it Takes to Make a Tensor 107
6.1.1 Tensors as Maps 111
6.1.2 Tensor Operations 113
6.1.3 Invariant Tensors 115
6.1.4 Tensor Fields 119
– ii –


## Page 5

6.2 Physical Examples 122
6.2.1 Electric Fields in Matter 122
6.2.2 The Inertia Tensor 123
6.2.3 Higher Rank Tensors 125
6.3 A Unification of Integration Theorems 126
6.3.1 Integrating in Higher Dimensions 126
6.3.2 Differentiating Anti-Symmetric Tensors 129
– 1 –


## Page 6

Acknowledgements
These lecture notes are far from novel. Large chunks of them have been copied wholesale
from the excellent lecture notes of Ben Allanach and Jonathan Evans who previously
taught this course. I’ve also benefitted from the detailed notes of Stephen Cowley. My
thanks to Jonathan Evans, Julia Gog and Maria Gutierrez for helpful discussions and
suggestions on the material in the course.
I am supported by a Royal Society Wolfson Merit award and by a Simons Investigator
award.
– 2 –


## Page 7

0 Introduction
The development of calculus was a watershed moment in the history of mathematics.
In its simplest form, we start with a function
f : R → R
Provided that the function is continuous and smooth, we can do some interesting things.
We can differentiate. And integrate. It’s hard to overstate the importance of these
operations. It’s no coincidence that the discovery of calculus went hand in hand with
the beginnings of modern science. It is, among other things, how we describe change.
The purpose of this course is to generalise the concepts of differentiation and inte-
gration to functions, or maps, of the form
f : Rm → Rn (0.1)
with m and n positive integers. Our goal is simply to understand the different ways
in which we can differentiate and integrate such functions. Because points in Rm and
Rn can be viewed as vectors, this subject is called vector calculus. It also goes by the
name of multivariable calculus.
The motivation for extending calculus to maps of the kind (0.1) is manifold. First,
given the remarkable depth and utility of ordinary calculus, it seems silly not to explore
such an obvious generalisation. As we will see, the effort is not wasted. There are
several beautiful mathematical theorems awaiting us, not least a number of important
generalisations of the fundamental theorem of calculus to these vector spaces. These
ideas provide the foundation for many subsequent developments in mathematics, most
notably in geometry. They also underlie every law of physics.
Examples of Maps
To highlight some of the possible applications, here are a few examples of maps (0.1)
that we will explore in greater detail as the course progresses. Of particular interest
are maps
f : R → Rn (0.2)
These define curves in Rn. A geometer might want to understand how these curves
twist and turn in the higher dimensional space or, for n = 3, how the curve ties itself
in knots. For a physicist, maps of this type are particularly important because they
describe the trajectory of a particle. Here the codomain Rn is identified as physical
space, an interpretation that is easiest to sell when n = 3 or, for a particle restricted
to move on a plane, n = 2.
– 3 –


## Page 8

Figure 1 . On the left, the temperature on the surface of the Earth is an example of a map
from R2 → R, also known as a scalar field. On the right, the wind on the surface of the Earth
blows more or less horizontally and so can be viewed as a map from R2 → R2, also known as
a vector field. (To avoid being co-opted by the flat Earth movement, I should mention that,
strictly speaking, each of these is a map from S2 rather than R2.)
Before we go on, it will be useful to introduce some notation. We’ll parameterise R
by the variable t. Meanwhile, we denote points in Rn as x. A curve (0.2) in Rn is then
written as
f : t → x(t)
Here x(t) is the image of the map. But, in many situations below, we’ll drop the f
and just refer to x(t) as the map. For a physicist, the parameter t is usually viewed as
time. In this case, repeated differentiation of the map with respect to t gives us first
velocity, and then acceleration.
Going one step further, we could consider maps f : R2 → Rn as defining a surface
in Rn. Again, a geometer might be interested in the curvature of this surface and
this, it turns out requires an understanding of how to differentiate the maps. There are
then obvious generalisations to higher dimensional surfaces living in higher dimensional
spaces.
From the physics perspective, in the map (0.2) that defines a curve the codomain
Rn is viewed as physical space. A conceptually different set of functions arise when we
think of the domain Rm as physical space. For example, we could consider maps of the
kind
f : R3 → R
– 4 –


## Page 9

where R3 is viewed as physical space. Physicists refer to this as a scalar field. (Math-
ematicians refer to it as a map from R3 to R.) A familiar example of such a map is
temperature: there exists a temperature at every point in this room and that gives
a map T (x). This is shown in Figure 1. A more fundamental, and ultimately more
interesting, example of a scalar field is the Higgs field in the Standard Model of particle
physics.
As one final example, consider maps of the form
f : R3 → R3
where, again, the domain R3 is identified with physical space. Physicists call these
vector fields. (By now, you can guess what mathematicians call them.) In fundamental
physics, two important examples are provided by the electric field E(x) and magnetic
field B(x), first postulated by Michael Faraday: each describes a three-dimensional
vector associated to each point in space.
– 5 –


## Page 10

1 Curves
In this section, we consider maps of the form
f : R → Rn
A map of this kind is called a parameterised curve, with R the parameter and the curve
the image of the map in Rn. In what follows, we will denote the curve as C.
Whenever we do explicit calculations, we need to introduce some coordinates. The
obvious ones are Cartesian coordinates, in which the vector x ∈ Rn is written as
x = (x1, . . . , xn) = xiei
where, in the second expression, we’re using summation convention and explicitly sum-
ming over i = 1, . . . , n. Here {ei} is a choice of orthonormal basis vectors, satisfying
ei · ej = δij. For Rn = R3, we’ll also write these as {ei} = {ˆx, ˆy, ˆz}. (The notation
{ei} = {i, j, k} is also standard, although we won’t adopt it in these lectures.)
The image of the function can then be written as x(t). In physics, we might think
of this as the trajectory of a particle evolving in time t. Here, we’ll mostly just view
the curve as an abstract mathematical map, with t nothing more than a parameter
labelling positions along the curve. In fact, one of themes of this section is that, for
many calculations, the choice of parameter t is irrelevant.
Examples
Here are two simple examples. Consider first
the map R → R3 that takes the form
x(t) = (at, bt2, 0)
The image of the map is the parabola a2y =
bx2, lying in the plane z = 0, and is shown on
the right.
This looks very similar to what you would
draw if asked to plot the graph y = bx2/a2,
with the additional requirement of z = 0 prompting the artistic flourish that results in
a curve suspended in 3d. Obviously, the curve x(t) and the functions y = bx2/a2 (with
z = 0) are related, but they’re not quite the same thing. The function y = bx2/a2
is usually thought of as a map R → R and in plotting a graph you include both the
domain and codomain. In contrast, on the right we’ve plotted only the image of the
curve x(t) in R3; the picture loses all information about the domain coordinate t.
– 6 –


## Page 11

Here is a second example that illustrates the
same point. Consider
x(t) = (cos t, sin t, t) (1.1)
The resulting curve is a helix, shown to the
right. Like any other curve, the choice of pa-
rameterisation is not unique. We could, for
example, consider the different map
x(t) = (cos λt, sin λt, λt)
This gives the same helix as (1.1) for any choice of λ ∈ R as long as λ ̸= 0. In
some contexts this matters. If, for example, t is time, and x(t) is the trajectory of a
rollercoaster then the fate of the contents of your stomach depends delicately on the
value of λ. However, there will be some properties of the curve that are independent
of the choice of parameterisation and, in this example, independent of λ. It is these
properties that will be our primary interest in this section.
Before we go on, a pedantic mathematical caveat. It may be that the domain of
the curve is not all of R. For example, we could have the map R → R2 given by
x(t) = (t,
√
1 − t2). This makes sense only for the interval t ∈ [−1, +1] and you should
proceed accordingly.
1.1 Differentiating the Curve
The vector function x(t) is differentiable at t if, as δt → 0, we can write
x(t + δt) − x(t) = ˙x(t) δt + O(δt2) (1.2)
You should think of this expression as defining the derivative ˙x(t). If the derivative ˙x
exists everywhere then the curve is said to be smooth. This means that it is continuous
and, as the name suggests, not egregiously jagged.
There are some notational issues to unpick in this expression. First, O(δt2) includes
all terms that scale as δt2 or smaller as δt → 0. This “big-O” notation is commonly
used in physics and applied mathematics. In pure maths you will also see the “little
o” notation o(δt) which means “strictly smaller than δt” as δt → 0. Roughly speaking
o(δt) is the same thing as O(δt2). (In other courses you may encounter situations where
this speaking is too rough to be accurate, but it will suffice for our needs.) We’ll stick
with big-O notation throughout these lectures.
– 7 –


## Page 12

We’ve denoted the derivative in (1.2) with a dot, ˙x(t). This was Newton’s original
notation for the derivative and, 350 years later, comes with some sociological baggage.
In physics, a dot is nearly always used to denote differentiation with respect to time, so
the velocity of a particle is ˙x and the acceleration is ¨x. Meanwhile a prime, like f ′(x),
is usually used to denote differentiation with respect to space. This is deeply ingrained
in the psyche of physicists, so much so that I get a little shudder if I see something
like x′(t), even though it’s perfectly obvious that it means dx/dt. Mathematicians,
meanwhile, seem to have no such cultural hang-ups on this issue. (They reserve their
cultural hang-ups for a 1000 other issues.)
We write the left-hand side of (1.2) as
δx(t) = x(t + δt) − x(t)
The derivative is then the vector
dx
dt = ˙x(t) = lim
δt→0
δx
δt
Here the familiar notation dx/dt for the derivative is due to Leibniz and works if we’re
differentiating with respect to time, space, or anything else. We’ll also sometimes use
the slightly sloppy notation and write
dx = ˙x dt
which, at least for now, really just means the same thing as (1.2) except we’ve dropped
the O(δt2) terms.
It’s not difficult to differentiate vectors and, at least in Cartesian coordinates with
the basis vectors ei, we can just do it component by component
x(t) = xi(t)ei ⇒ ˙x(t) = ˙xi(t)ei
The same is true if we work in any other choice of basis vectors{ei} provided that these
vectors themselves are independent of t. (In the lectures on Dynamics and Relativity
we encounter an example where the basis vectors do depend on time and you have to
be more careful. This arises in Section 6 on “Non-Inertial Frames”.)
More generally, given a function f(t) and two vector functions g(t) and h(t), it’s
simple to check that the following Leibniz identities hold
d
dt(fg) = d f
dtg + f dg
dt
d
dt(g · h) = dg
dt · h + g · dh
dt
– 8 –


## Page 13

Figure 2 . The derivative is the tangent vector to the curve.
Moreover, if g(t) and h(t) are vectors in R3, we also have the cross-product identity
d
dt(g × h) = dg
dt × h + g × dh
dt
As usual, we have to be careful with the ordering of terms in the cross product because
for example, dg/dt × h = −h × dg/dt.
1.1.1 Tangent Vectors
There is a nice geometric meaning to the derivative ˙x(t) of a parameterised curve C: it
gives the tangent to the curve and is called, quite reasonably, the tangent vector. This
is shown in Figure 2.
The direction of the tangent vector ˙x(t) is geometrical (at least up to a sign): it
depends only on the curve C itself, and not on the choice of parameterisation. In con-
trast, the magnitude of the tangent vector | ˙x(t)| does depend on the parameterisation.
This is obvious mathematically, since we’re differentiating with respect to t, and also
physically where ˙x is identified with the velocity of a particle.
Sometimes, you may find yourself with an unwise choice of parameterisation in which
the derivative vector ˙x vanishes at some point. For example, consider the curve in R2
given by
x(t) = (t3, t3)
The curve C is just the straight line x = y. The tangent vector ˙ x = 3 t2(1, 1) which
clearly points along the line x = y but with magnitude 3
√
2t2 and so vanishes at t = 0.
Clearly this is not a property of C itself, but of our choice of parameterisation. We get
the same curve C from the map x(t) = (t, t) but now the tangent vector is everywhere
non-vanishing.
– 9 –


## Page 14

A parameterisation is called regular if ˙x(t) ̸= 0 for any t. In what follows, we will
assume that we are dealing with regular parameterisations except, perhaps, at isolated
points. This means that we can divide the curve into segments, each of which is regular.
As a slightly technical aside, we will sometimes
have cause to consider curves that are piecewise
smooth curves of the form C = C1 + C2 + . . ., where
the end of one curve lines up with the beginning of
the next, as shown on the right. In this case, a tan-
gent vector exists everywhere except at the cusps
where two curves meet.
1.1.2 The Arc Length
We can use the tangent vectors to compute the length of the curve. From Figure 2, we
see that the distance between two nearby points is
δs = |δx| + O(|δx|2) = | ˙x δt| + O(δt2)
We then have
ds
dt = ±

dx
dt
 = ±| ˙x| (1.3)
where we get the plus sign for distances measured in the direction of increasing t, and
the minus sign in the direction of decreasing t.
If we pick some starting point t0 on the curve, then
the distance along the curve to any point t > t 0 is given
by
s =
Z t
t0
dt′ | ˙x(t′)|
This distance is called the arc length, s. Because | ˙x| > 0, this is a positive and strictly
increasing function as we move away in the direction t > t 0. It is a negative, and
strictly decreasing function in the direction t < t 0.
Although the tangent vector ˙x depends on the choice of parameterisation, the arc
length s does not. We can pick a different parameterisation of the curve τ(t), which we
will take to be an invertible and smooth function. We will also assume that dτ /dt > 0
– 10 –


## Page 15

so that they both measure “increasing time” in the same direction. The chain rule tells
us that
dx
dt = dx
dτ
dτ
dt (1.4)
We can then compute the arc length using the τ parameterisation: it is
s =
Z t
t0
dt′ | ˙x(t′)| =
Z τ
τ0
dτ ′ dt′
dτ ′

dx
dτ ′
dτ ′
dt′
 =
Z τ
τ0
dτ ′

dx
dτ ′
 (1.5)
In the second equality, we find the contribution from the chain rule (1.4) together with
a factor from the measure that comes from integrating overdτ instead of dt. These then
cancel in the third equality. The upshot is that we can compute the arc length using
any parameterisation that we wish. Or, said differently, the arc length is independent
of the choice of parameterisation of the curve.
We can now turn this on its head. All parameterisations of the curve give the same
arc length. But this means that the arc length itself is, in many ways, the only natural
parameterisation of the curve. We can then think of x(s) with the corresponding
tangent vector dx/ds. From (1.3), we see that this choice of the tangent vector always
has unit length: |dx/ds| = 1.
As an aside: these kind of issues raise their head in the physics of special relativity
where time means different things for people moving at different speeds. This means
that there is no universally agreed “absolute time” and so different people will parame-
terise the trajectory of a particle x(t) in different ways. There’s no right or wrong way,
but it’s annoying if someone does it differently to you. (Admittedly, this is only likely
to happen if they are travelling at an appreciable fraction of the speed of light relative
to you.) Happily there is something that everyone can agree on, which is the special
relativistic version of arc length. It’s known as proper time. You can read more about
this in the lectures on Dynamics and Relativity.
An Example
To illustrate these ideas, let’s return to our helix example of (1.1). We had x(t) =
(cos t, sin t, t) and so ˙x(t) = (− sin t, cos t, 1). Our defining equation (1.3) then becomes
(taking the positive sign)
ds
dt = | ˙x| =
√
2
– 11 –


## Page 16

If we take t0 = 0, then the arc length measured
from the point x = (1, 0, 0) is s =
√
2t. In particular,
after time t = 2π we’ve made a full rotation and sit at
x = (1, 0, 2π). These two points are shown as red dots
in the figure. Obviously the direct route between the
two has distance 2π. Our analysis above shows that the
distance along the helix is s =
√
8π.
1.1.3 Curvature and Torsion
There is a little bit of simple geometry associated to
these ideas. Given a curve C, parameterised by its arc length s, we have already seen
that the tangent vector
t = dx
ds
has unit length, |t| = 1. (Note: don’t confuse the bold faced tangent vector t with
our earlier parameterisation t: they’re different objects!) We can also consider the
“acceleration” of the curve with respect to the arc length, d2x/ds2. The magnitude of
this “acceleration” is called the curvature
κ(s) =

d2x
ds2
 (1.6)
To build some intuition, we can calculate the curvature of a circle of radius R. If
we start with a simple parameterisation x(t) = ( R cos t, R sin t) then you can check
using (1.3) that the arc length is s = Rt. We then pick the new parameterisation
x(s) = ( R cos(s/R), R sin(s/R)). We then find that a circle of radius R has constant
curvature
κ = 1
R
Note, in particular, that as R → ∞ , the circle becomes a straight line which has
vanishing curvature.
There is also a unit vector associated to this “acceleration”, defined as
n = 1
κ
d2x
ds2 = 1
κ
dt
ds
This is known as the principal normal. Note that the factor of 1 /κ ensures that |n| = 1.
– 12 –


## Page 17

Importantly, if κ ̸= 0 then n is perpendicular to the tangent vector t. This follows
from the fact that t · t = 1 and so d/ds(t · t) = 2κn · t = 0. This means that t and n
define a plane, associated to every point in the curve. This is known as the osculating
plane.
For any point s on the curve, there is an associ-
ated osculating plane. Now draw a circle in that plane
that touches the curve at the point s, whose curvature
matches κ(s). This is called the osculating circle and is
shown in green in the figure. This is the circle that just
kisses the curve at s
Next we can ask: how does the osculating plane vary
as we move along the curve? This is simplest to discuss
if we restrict to curves in R3. In this case, we have the cross product at our disposal
and we can define the unit normal to the osculating plane as
b = t × n
This is known as the binormal, to distinguish it from the normal n. The three vectors
t, n and b define an orthonormal basis for R3 at each point s along the curve (at least
as long as κ(s) ̸= 0.) This basis twists and turns along the curve.
Note that |b| = 1 which, using the same argument as for t above, tells us that
b · db/ds = 0. In addition, we have t · b = 0 which, after differentiating, tells us that
0 = dt
ds · b + t · db
ds = κn · b + t · db
ds
But, by definition, n · b = 0. So we learn that t · db/ds = 0. In other words, db/ds is
orthogonal to both b and to t. Which means that it must be parallel to n. We define
the torsion τ(s) as a measure of how the binormal changes
db
ds = −τ(s)n (1.7)
From the definition, you can see that the torsion is a measure of ...x . The minus sign
means that if the top of the green circle in the figure tilts towards us, then τ > 0; if
it tilts away from us then τ < 0. Heuristically, the curvature captures how much the
curve fails to be a straight line, while the torsion captures how much the curve fails to
be planar.
– 13 –


## Page 18

The Frenet-Serret Equations
There is a closed set of formulae describing curvature and torsion. These are the
Frenet-Serret equations,
dt
ds = κn (1.8)
db
ds = −τn (1.9)
dn
ds = τb − κt (1.10)
The first of these (1.8) is simply the definition of the normal n.
That leaves us with (1.10). We’ll again start with the definition b = t × n, and this
time take the cross product with t. The triple product formula then gives us
b × t = (t × n) × t = (t · t) n − (n · t) t = n
Now taking the derivative with respect to s, using (1.8) and (1.9) and noting that
b = t × n and t = n × b then gives us (1.10).
It’s useful to rewrite the first two equations (1.8) and (1.9) using n = b × t so that
we have
dt
ds = κ(b × t) and db
ds = −τ(b × t)
This is six first order equations for six unknowns, b(s) and t(s). If we are given κ(s)
and τ(s), together with initial conditions b(0) and t(0), then we can solve for b(s) and
t(s) and can subsequently solve for the curve x(s). The way to think about this is
that the curvature and torsion κ(s) and τ(s) specify the curve, up to translation and
orientation.
1.2 Line Integrals
Given a curve C in Rn and some function defined overRn, we may well wish to integrate
the function along the curve. There are different stories to tell for scalar and vector
fields and we deal with each in turn.
1.2.1 Scalar Fields
A scalar field is a map
ϕ : Rn → R
With coordinates x on Rn, we’ll denote this scalar field as ϕ(x).
– 14 –


## Page 19

Given a parameterised curve C in Rn, which we denote as x(t), it might be tempting
to put these together to get the function ϕ(x(t)) which is a composite map R → R.
We could then just integrate over t in the usual way.
However, there’s a catch. The result that you get will depend both on the function
ϕ, the curve C, and the choice of parameterisation of the curve. There’s nothing wrong
this per se, but it’s not what we want here. For many purposes, it turns out to be more
useful to have a definition of the integral that depends only on the function ϕ and the
curve C, but gives the same answer for any choice of parameterisation of the curve.
One way to achieve this is to work with the arc length s which, as we’ve seen, is the
natural parameterisation along the curve. We can integrate from point a to point b,
with x(sa) = a and x(sb) = b and sa < s b, by defining the line integral
Z
C
ϕ ds =
Z sb
sa
ϕ(x(s)) ds
where the right-hand side is now viewed as a usual one-dimensional integral.
This line integral is, by convention, defined so that
R
C ds gives the length of the
curve C and, in particular, is always positive. In other words, there’s no directional
information in this integral: it doesn’t matter what way you move along the curve.
Suppose that we’re given a parameterised curve C in terms of some other parameter
x(t), with x(ta) = a and x(tb) = b. The usual change of variables tells us that
Z
C
ϕ ds =
Z tb
ta
ϕ(x(t)) ds
dt dt
We can then use (1.3). If tb > t a then we have ds/dt = +| ˙x| and
Z
C
ϕ ds =
Z tb
ta
ϕ(x(t)) | ˙x(t)| dt (1.11)
Meanwhile, if tb < t a then we have ds/dt = −| ˙x| and
Z
C
ϕ ds =
Z ta
tb
ϕ(x(t)) | ˙x(t)| dt
We see that the line integral comes with the length of the tangent vector | ˙x| in the
integrand. This is what ensures that the line integral is actually independent of the
choice of parameterisation: the argument is the same as the one we used in (1.5) to
– 15 –


## Page 20

show that the arc length is invariant under reparameterisations: upon a change of
variables, the single derivative d/dt in ˙x cancels the Jacobian from the integral
R
dt.
Furthermore, the minus signs work out so that you’re always integrating from a smaller
value of t to a larger one, again ensuring that
R
C ds is positive and so can be interpreted
as the length of the curve.
1.2.2 Vector Fields
Vector fields are maps of the form
F : Rn → Rn
So that at each point x ∈ Rn we have a vector-valued object F(x). We would like to
understand how to integrate a vector field along a curve C.
There are two ways to do this. We could work component-wise, treating each compo-
nent like the scalar field example above. After doing the integration, this would leave
us with a vector.
However it turns out that, in many circumstances, it’s more useful to integrate the
vector field so that the integral gives us just a number. We do this integrating the
component of the vector field that lies tangent to the curve. Usually, this is what is
meant by the line integral of a vector field.
In more detail, suppose that our curve C has a parameterisation x(t) and we wish
to integrate from ta to tb, with x(ta) = a and x(tb) = b. The line integral of a vector
field F along C is defined to be
Z
C
F(x) · dx =
Z tb
ta
F(x(t)) · ˙x(t) dt (1.12)
Once again, this doesn’t depend on the choice of parameterisation t. This is manifest in
the expression on the left where the parameterisation isn’t mentioned. The right-hand
side is invariant for the same reason as (1.11).
This time, however, there’s a slightly different story to tell about minus signs. We
should think of each curveC as coming with an orientation, which is the direction along
the curve. Equivalently, it can be thought of as the direction of the tangent vector ˙x.
In the example above, the orientation of the curve is from a to b. This then determines
the limits of the integral, from ta to tb, since x(ta) = a and x(tb) = b. Note that the
limits are always this way round, regardless of whether our parameterisation hasta < t b
or whether tb > t a: the orientation determines the limits, not the parameterisation.
– 16 –


## Page 21

In summary, the line integral for a scalar field
R
C ϕ ds is independent of the orientation
and, if ϕ is positive, the integral will also be positive. In contrast, the integral of the
vector field
R
C F · ˙x dt depends on the orientation. Flip the orientation of the curve,
and the integral will change sign.
An Example
As a slightly baroque example, consider the vector field in R3,
F(x) = (xey, z2, xy)
To evaluate the line integral, we also need to
specify the curve C along which we perform
the integral. We’ll consider two options, both
of which evolve from x(t = 0) = (0 , 0, 0) to
x(t = 1) = (1, 1, 1). Our first curve is
C1 : x(t) = (t, t2, t3)
This is shown in the figure. Evaluated on C1,
we have F(x(t)) = (tet2
, t6, t3). Meanwhile ˙x = (1, 2t, 3t2) so we have
Z
C1
F · dx =
Z 1
0
dt F · ˙x
=
Z 1
0
dt

tet2
+ 2t7 + 3t5

= 1
4 (1 + 2e)
Our second curve is simply the straight line
C2 : x(t) = (t, t, t)
Evaluated on this curve, we have F(x(t)) = ( tet, t2, t2). Now the tangent vector is
˙x = (1, 1, 1) and the integral is
Z
C2
F · dx =
Z 1
0
dt F · ˙x =
Z 1
0
dt

tet + 2t2

= 5
3 (1.13)
(The first of these integrals is done by an integration by parts.)
The main lesson to take from this is the obvious one: the answers are different. The
result of a line integral generally depends on both the thing you’re integrating F and
the choice of curve C.
– 17 –


## Page 22

Figure 3 . Decomposing a curve by introducing new segments with opposite orientations.
More Curves, More Integrals
We’ll see plenty more examples of line integrals, both in this course and in later ones.
Here are some comments to set the scene.
First, there will be occasions when we want to perform a line integral around a
closed curve C, meaning that the starting and end points are the same, a = b. For
such curves, we introduce new notation and write the line integral as
I
C
F · dx
with the little circle on the integral sign there to remind us that we’re integrating
around a loop. This quantity is called the circulation of F around C. The name comes
from Fluid Mechanics where we might view F as the velocity field of a fluid, and the
circulation quantifies the swirling motion of the fluid.
In other occasions, we may find ourselves in a situation in which the curve C decom-
poses into a number of piecewise smooth curves Ci, joined up at their end points. We
write C = C1 + C2 + . . ., and the line integral is
Z
C
F · dx =
Z
C1
F · dx +
Z
C2
F · dx + . . .
It is also useful to think of the curve −C as the same as the curve C but with the
opposite orientation. This means that we have the expression
Z
−C
F(x) · dx = −
Z
C
F(x) · dx
For example, we could return to our previous baroque example and consider the closed
curve C = C1 − C2. This curve starts at x = (0, 0, 0), travels along C1 to x = (1, 1, 1)
– 18 –


## Page 23

and then returns back along C2 in the opposite direction to the arrow. From our
previous answers, we have
I
C
F · dx =
Z
C1
F · dx −
Z
C2
F · dx = 1
4(1 + 2e) − 5
3
There are lots of games that we can play like this. For example, it’s sometimes useful to
take a smooth closed curve C and decompose it into two piecewise smooth segments,.
An example is shown in Figure 3, where we’ve introduced two new segments, which
should be viewed as infinitesimally close to each other. These two new segments have
opposite orientation and so cancel out in any integral. In this way, we can think of the
original curve as C = C1 + C2. We’ll see other examples of these kinds of manipulations
as we progress.
1.3 Conservative Fields
Here’s an interesting question. In general the line integral of a vector field depends on
the path taken. But is this ever not the case? In other words, are there some vector
fields F for which the line integral depends only on the end points and not on the route
you choose to go between them?
Such a vector field F would obey
Z
C1
F · dx =
Z
C2
F · dx
for any C1 and C2 that share the same end points a and b and the same orientation.
Equivalently, we could consider the closed curve C = C1 − C2 and write this as
I
C
F · dx = 0
for all closed curves C. To answer this question about vector fields, we first need to
introduce a new concept for scalar fields.
1.3.1 The Gradient
Let’s return to the scalar field
ϕ : Rn → R
We want to ask: how can we differentiate such a function?
– 19 –


## Page 24

With Cartesian coordinates x = ( x1, . . . , xn) on Rn, the scalar field is a function
ϕ(x1, . . . , xn). Given such a function of several variables, we can always take partial
derivatives, which means that we differentiate with respect to one variable while keeping
all others fixed. For example,
∂ϕ
∂x1 = lim
ϵ→0
ϕ(x1 + ϵ, x2, . . . , xn) − ϕ(x1, x2, . . . , xn)
ϵ (1.14)
If all n partial derivatives exist then the function is said to be differentiable.
The partial derivatives offer n different ways to differentiate our scalar field. We will
sometimes write this as
∂iϕ = ∂ϕ
∂xi (1.15)
where the ∂i can be useful shorthand when doing long calculations. While the notation
of the partial derivative tells us what’s changing it’s just as important to remember
what’s kept fixed. If, at times, there’s any ambiguity this is sometimes highlighted by
writing
 ∂ϕ
∂x1

x2,...,xn
where the subscripts tell us what remains unchanged as we vary x1. We won’t use this
notation in these lectures since it should be obvious what variables are being held fixed.
The n different partial derivatives can be packaged together into a vector field. To do
this, we introduce the orthonormal basis of vectors {ei} associated to the coordinates
xi. The gradient of a scalar field is then a vector field, defined as
∇ϕ = ∂ϕ
∂xi ei (1.16)
where we’re using the summation convention in which we implicitly sum over the re-
peated i = 1, . . . , n index.
Because ∇ϕ is a vector field, it may be more notationally consistent to write it in
bold font as ∇ϕ. However, I’ll stick with ∇ϕ. There’s no ambiguity here because the
symbol ∇ only ever means the gradient, never anything else, and so is always a vector.
It’s one of the few symbols in mathematics and physics whose notational meaning is
fixed.
– 20 –


## Page 25

For scalar fields ϕ(x, y, z) in R3, the gradient is
∇ϕ = ∂ϕ
∂x ˆx + ∂ϕ
∂y ˆy + ∂ϕ
∂z ˆz
where we’ve written the orthonormal basis as {ei} = {ˆx, ˆy, ˆz}.
There’s a useful way to view the vector field ∇ϕ. To see this, note that if we want
to know how the function ϕ changes in a given direction ˆn, with |ˆn| = 1, then we just
need to take the inner product ˆn · ∇ϕ. This is known as the directional derivative and
sometimes denoted Dnϕ = ˆn · ∇ϕ. Obviously the directional derivative is maximal at
any point x when ˆn lies parallel to ∇ϕ(x). But this is telling us something important:
at each point in space, the vector ∇ϕ(x) is pointing in the direction in which ϕ(x)
changes most quickly.
1.3.2 Back to Conservative Fields
First a definition. A vector field F is called conservative if it can be written as
F = ∇ϕ
for some scalar field ϕ which, in this context, is referred to as a potential. (The odd
name “conservative” derives from the conservation of energy in Newtonian mechanics
we will see the connection to this below.) Finally, we can answer the question that we
introduced at the beginning of this section: when is a line integral independent of the
path?
Claim: The line integral around any closed curve vanishes if and only if F is con-
servative.
Proof: Consider a conservative vector field of the form F = ∇ϕ. We’ll integrate
this along a curve C that interpolates from point a to point b, with parameterisation
x(t). We have
Z
C
F · dx =
Z
C
∇ϕ · dx =
Z tb
ta
∂ϕ
∂xi
dxi
dt dt =
Z tb
ta
d
dt ϕ(x(t)) dt
where the last equality follows from the chain rule. But now we have the integral of a
total derivative, so
Z
C
F · dx =
h
ϕ(x(t))
itb
ta
= ϕ(b) − ϕ(a)
which depends only on the end points as promised.
– 21 –


## Page 26

Conversely, given the vector field F whose inte-
gral vanishes when taken around any closed curve,
it is always possible to construct a potential ϕ. We
first choose a value of ϕ at the origin. There’s no
unique choice here, reflecting the fact that the po-
tential ϕ is only defined up to an overall constant.
We can take ϕ(0) = 0. Then, at any other point
y, we define x = y
ϕ(y) =
Z
C(y)
F · dx
where C(y) is a curve that starts at the origin and ends at the point y as shown in
the figure above. Importantly, by assumption
H
F · dx = 0, so it doesn’t matter which
curve C we take: they all give the same answer.
It remains only to show that ∇ϕ = F. This is straightforward. Reverting to our
original definition of the partial derivative (1.14), we have
∂ϕ
∂xi (y) = lim
ϵ→0
1
ϵ
Z
C(y+ϵei)
F · dx −
Z
C(y)
F · dx

The first integral goes along C(y), and then
continues along the red line shown in the fig-
ure to the right. Meanwhile, the second inte-
gral goes back along C(y). The upshot is that
the difference between them involves only the
integral along the red line
∂ϕ
∂xi (y) = lim
ϵ→0
1
ϵ
Z
red line
F · dx
The red line is taken to be the straight line in the xi direction. This means that the
line integral projects onto the Fi component of the vector F. Since we’re integrating
this over a small segment of length ϵ, the integral gives
R
red line F · dx ≈ Fiϵ and, after
taking the limit ϵ → 0, we have
∂ϕ
∂xi (y) = Fi(y)
This is our desired result ∇ϕ = F. □
– 22 –


## Page 27

It’s clear that the result above is closely related to the fundamental theorem of
calculus: the line integral of a conservative vector field is the analog of the integral of
a total derivative and so is given by the end points. We’ll meet more analogies along
the same lines as we proceed.
Given a vector field F, how can we tell if there’s a corresponding potential so that
we can write F = ∇ϕ? There’s one straightforward way to check: for a conservative
vector field, the components F = Fiei are given by
Fi = ∂ϕ
∂xi
Differentiating again, we have
∂Fi
∂xj = ∂2ϕ
∂xixj = ∂Fj
∂xi (1.17)
where the second equality follows from the fact that the order of partial derivatives
doesn’t matter (at least for suitably well behaved functions). This means that a neces-
sary condition for F to be conservative if that ∂iFj = ∂jFi. Later in these lectures we
will see that (at least locally) this is actually a sufficient condition.
An Example
Consider the (totally made up) vector field
F = (3x2y sin z, x3 sin z, x3y cos z)
Is this conservative? We have ∂1F2 = 3x2 sin z = ∂2F1 and ∂1F3 = 3x2y cos z = ∂3F1
and, finally, ∂2F3 = x3 cos z = ∂3F2. So it passes the derivative test. Indeed, it’s not
then hard to check that
F = ∇ϕ with ϕ = x3y sin z
Knowing this makes it trivial to evaluate the line integral
R
C F · dx along any curve C
since it is given by ϕ(b) − ϕ(a) where a and b are the end points of C.
Exact Differentials
There is a slightly different and more abstract way of phrasing the idea of a conservative
vector field. First, given a function ϕ(x) on Rn, the differential is defined to be
dϕ = ∂ϕ
∂xi dxi = ∇ϕ · dx
It’s a slightly formal object, obviously closely related to the derivative. The differential
is itself a function of x and captures how much the function ϕ changes as we move in
any direction.
– 23 –


## Page 28

Next, consider a vector field F(x) on Rn. We can take the inner product with an
infinitesimal vector to get the object F · dx. In fancy maths language, this is called a
differential form. (Strictly it’s an object known as a differential one-form) It’s best to
think of F · dx as something that we should integrate along a curve.
A differential form is said to be exact if it can be written as
F · dx = dϕ
for some function ϕ. This is just a rewriting of our earlier idea: a differential is exact
if and only if the vector field is conservative. In this case, it takes the form F = ∇ϕ
and so the associated differential is
F · dx = ∂ϕ
∂xi dxi = dϕ
where the last equality follows from the chain rule.
1.3.3 An Application: Work and Potential Energy
There’s a useful application of these ideas in Newtonian mechanics. The trajectory
x(t) of a particle is governed by Newton’s second law which reads
m¨x = F(x)
where, in this context, F(x) can be thought of as a force field. An important concept
in Newtonian mechanics is the kinetic energy of a particle, K = 1
2 m ˙x2. (This is more
often denoted as T in theoretical physics.) As the particle’s position changes in time,
the kinetic energy changes as
K(t2) − K(t1) =
Z t2
t1
dK
dt dt =
Z t2
t1
m ˙x · ¨x dt =
Z t2
t1
˙x · F dt =
Z
C
F · dx
The line integral of the force F along the trajectory C of the particle is called the work
done.
Something special happens for conservative forces. These can be written as
F = −∇V (1.18)
for some choice of V . (Note: the minus sign is just convention.) From the result above,
for a conservative force the work done depends only on the end points, not on the path
taken. We then have
K(t2) − K(t1) =
Z
C
F · dx = −V (t2) + V (t1) ⇒ K(t) + V (t) = constant
– 24 –


## Page 29

We learn that a conservative force, one that can be written as (1.18), has a conserved
energy E = K + V . Indeed, it’s this conservation of energy that lends it’s name to the
more general idea of a “conservative” vector field. We’ll have use of these ideas in the
lectures on Dynamics and Relativity.
1.3.4 A Subtlety
Here’s a curious example. Consider the vector field on R2 given by
F =

− y
x2 + y2 , x
x2 + y2

Is this conservative? If we run our check (1.17), we find
∂Fx
∂y = ∂Fy
∂x = y2 − x2
(x2 + y2)2
which suggests that this is, indeed, a conservative field. Indeed, you can quickly check
that
F = ∇ϕ with ϕ(x, y) = tan−1
 y
x

(To see this, write tan ϕ = y/x and recall that ∂(tan ϕ)/∂x = (cos ϕ)−2∂ϕ/∂x = (1 +
tan2 ϕ)∂ϕ/∂x with a similar expression when you differentiate with respect to y. A
little algebra will then convince you that the above is true.)
Let’s now integrate F along a closed curve C that is a circle of radius R surrounding
the origin. We take x(t) = (R cos t, R sin t) with 0 ≤ t < 2π and the line integral is
I
C
F · dx =
Z 2π
0
F · dx
dt dt =
Z 2π
0

−sin t
R · (−R sin t) + cos t
R · R cos t

dt = 2π
Well, that’s annoying! We’ve just proven that the integral of any conservative vector
field around a close curve C necessarily vanishes, and yet one of our first examples
seems to show otherwise! What’s going on?
The deal is that ϕ(x, y) is not a well behaved function on R2. In particular, it’s not
continuous along the y-axis: as x → 0 the function ϕ approaches either +π/2 or −π/2
depending on whether y/x is positive or negative. Implicit in our previous proof was
the requirement that we have a continuous function ϕ, well defined everywhere on R2.
Strictly speaking, a conservative field should have F = ∇ϕ with ϕ continuous.
Relatedly, F itself isn’t defined everywhere on R2 because it is singular at the origin.
Strictly speaking, F is only defined on the planeR2 with the point at the origin removed.
We write this as R2 − {0, 0},
– 25 –


## Page 30

We learn that we should be careful. The line integral of a conservative vector field
around a closed curve C is only vanishing if the vector field is well defined everywhere
inside C.
Usually pathological examples like this are of interest only to the most self-loathing
of pure mathematicians. But not in this case. The subtlety that we’ve seen above
later blossoms into some of the most interesting ideas in both mathematics and physics
where it underlies key aspects in the study of topology. In the above example, the
space R2 − {0, 0} has a different topology from R2 because in the latter case all loops
are contractible, while in the former case there are non-contractible loops that circle
the origin. It turns out that one can characterise the topology of a space by studying
the kinds of functions that live on it. In particular, the functions that satisfy the
check (1.17) but cannot be written as F = ∇ϕ with a continuous ϕ play a particularly
important role, as they encode a lot of information about the topology of the underlying
space.
– 26 –


## Page 31

2 Surfaces (and Volumes)
The main purpose of this chapter is to understand how to generalise the idea of an
integral. Rather than integrating over a line, we will instead look at how to integrate
over a 2d surface. We’ll then see how to generalise to the integration over a 3d volume
or, more generally, an n-dimensional space.
2.1 Multiple Integrals
We’ll start by explaining what it means to integrate over a region inR2 or over a region
in R3. The former are called area, or surface, integrals; the latter volume integrals. By
the time we’ve understood volume integrals, the extension to Rn will be obvious.
2.1.1 Area Integrals
Consider a region D ⊂ R2. Given a scalar function ϕ : R2 → R, we want to find a way
to integrate ϕ over D. We write this as
Z
D
ϕ(x) dA (2.1)
You should think of the area element dA as representing an infinitesimally small area,
with the
R
sign telling us that we’re summing over many such small areas, in much
the same was as
R
dx should be thought of as summing over infinitesimally small line
elements dx. The area element is also written as dA = dx dy.
The rough idea underlying the integral is
straightforward. First, we find a way to tes-
selate D with some simple shape, say a rectan-
gle or other polygon. Each shape has common
area δA. Admittedly, there might be some dif-
ficulty in making this work around the edge,
but we’ll ignore this for now. Then we might
approximate the integral as
Z
D
ϕ(x) dA ≈
X
n
ϕ(xn) δA
where xn is a point in the middle of each shape. We can then consider making δA
smaller and smaller, so that we tesselate the region D with finer and finer shapes.
Intuitively, we might expect that as δA → 0, the sum converges on an answer and,
moreover, this answer is independent on any choices that we made along the way, such
– 27 –


## Page 32

as what shape we use and how we deal with the edges. When the limit exists – as it will
for any sensible choice of function ϕ and region D – then it converges to the integral.
If the function in the integrand is simply ϕ = 1 then the integral (2.1) calculates the
area of the region D.
Just as an ordinary, one-dimensional integral
can be viewed as the area under a curve, so too
can an area integral be viewed as the volume
under a function. This interpretation follows
simply by plotting z = ϕ(x, y) in 3d as shown
to the right.
Evaluating Area Integrals
In practice, we evaluate area integrals (or, in-
deed, higher dimensional integrals) by reducing
them to multiple ordinary integrals.
There are a number of different ways to do this, and some may be more convenient
than others, although all will give the same answer. For example, we could parcel our
region D into narrow horizontal strips of width δy like so:
For each value of y, we then do the x integral between the two limits x1(y) and x2(y).
We then subsequently sum over all such strips by doing the y integral between the two
outer limits of the shape which we call a and b. The net result is
Z
D
ϕ(x, y) dA =
Z b
a
dy
Z x2(y)
x1(y)
dx ϕ(x, y) (2.2)
In this approach, the information about the shapeD appears in the limits of the integral
x1(y) and x2(y) which trace the outline of D as y changes.
– 28 –


## Page 33

If your shape is suitably annoying, then one
or more of the integrals may have to be decom-
posed into disjoint sets. An example is shown
on the right. In this case, for some values of y
we need two further functions ˜x1(y) and ˜x2(y)
to trace the outline of D and the integral in
(2.2) is defined to be
Z x2(y)
x1(y)
dx =
Z ˜x1(y)
x1(y)
dx +
Z x2(y)
˜x2(y)
dx
with the obvious generalisation if more disjoint intervals are needed.
We should pause at this point to make a comment on notation. You may be used
to writing integrals as
R
(integrand) dx, with the thing you’re integrating sandwiched
between the
R
sign and the dx. Indeed, that’s the convention that we’ve been using
up until now. But, as you progress through mathematics, there is a time to dump this
notation and we have now reached that time. When performing multiple integrals, it
becomes annoying to remember where you should place all thosedx’s and dy’s, not least
because they’re not conveying any further information. So we instead write integrals
as
R
dx (integrand), with the dx placed next to the integral sign. There’s nothing deep
in this. It’s just a different convention, albeit one that holds your hand a little less.
Think of it like that time you took the training wheels off your bike.
Our new notation does, however, retain the idea of ordering. You should work from
right to left, first performing the
R
dx integration in (2.2) to get a function of y, and
subsequently performing the
R
dy integration.
Note also that the number of
R
signs is not conserved in (2.2). On the left,
R
dA is
an area integral and so requires us to do two normal integrals which are then written
explicitly on the right. Shortly we will meet volume integrals and denote them asR
dV . Some texts prefer a convention in which there is a conservation of integral signs
and so write area integrals as
RR
dA and volume integrals as
RRR
dV . The authors
of these texts aren’t string theorists and have never had to perform an integral in ten
dimensions. Here we refuse to adopt this notation on the grounds that it looks silly.
There is a different way to do the integral (2.2). We could just as well divide our
formula D into vertical strips of width δx, so that it looks like this:
– 29 –


## Page 34

For each value of x, we do the y integral between the two limits y1(x) and y2(x).
As before, these functions trace the shape of the region D. We then subsequently sum
over all strips by doing the x integral between the two outer limits of the shape which
we now call c and d. Now the result isZ
D
ϕ(x, y) dA =
Z d
c
dx
Z y2(x)
y1(x)
dy ϕ (x, y) (2.3)
There are other ways to divide up the region D, some of which we will meet below
when we discuss different coordinate choices. Fubini’s theorem, proven in 1907, states
that, for suitably well behaved functions ϕ(x, y) and regions D, all different ways of
decomposing the integral agree. We won’t prove this theorem here but it guarantees
that the result that you get from doing the integrals in (2.2) coincides with the result
from (2.3).
An Example
As a simple example, consider the function
ϕ(x, y) = x2y
integrated over the triangle D shown in the figure.
We’ll do the area integral in two different ways. If we
first do the
R
dx integration, as in (2.2), then we have
Z
D
ϕ dA =
Z 1
0
dy
Z 2−2y
0
dx x 2y =
Z 1
0
dy y
 x3
3
2−2y
0
= 8
3
Z 1
0
dy y (1 − y)3 = 2
15
Meanwhile, doing the
R
dy integration first, as in (2.3), we have
Z
D
ϕ dA =
Z 2
0
dx
Z 1−x/2
0
dy x 2y =
Z 2
0
dx x 2
 y2
2
1−x/2
0
= 1
2
Z 2
0
dx x 2

1 − x
2
2
= 2
15
The two calculations give the same answer as advertised.
– 30 –


## Page 35

Figure 4 . A change of coordinates from ( x, y) to ( u, v).
2.1.2 Changing Coordinates
Our discussion above was very much rooted in Cartesian coordinates. What if we
choose to work with a different set of coordinates on R2?
Consider a change of variables ( x, y) → (u, v). To be a good change of coordinates,
the map should be smooth and invertible and we will assume that this is the case. The
region D can then equally well be parameterised by coordinates ( u, v). An example is
shown in Figure 4, with lines of constant u and constant v plotted in green. We want
to know how to do the area integral in the ( u, v) coordinates.
Claim: The area integral can be written as
Z
D
dx dy ϕ(x, y) =
Z
D′
du dv |J(u, v)| ϕ(u, v) (2.4)
The region D in the (x, y) plane is mapped into a different region D′ in the (u, v) plane.
Here ϕ(u, v) is slightly sloppy shorthand: it means the function ϕ(x(u, v), y(u, v)). The
additional term J(u, v) is called the Jacobian and is given by the determinant
J(u, v) =

∂x/∂u ∂x/∂v
∂y/∂u ∂y/∂v

The Jacobian is an important enough object that it also gets its own notation and is
sometimes written as
J = ∂(x, y)
∂(u, v)
– 31 –


## Page 36

Proof(ish): Here is a sketch of the proof to give you some intuition for why this is the
right thing to do. We evaluate the integral by summing over small areas δA, formed
by lines of constant u and v as shown by the red shaded region in Figure 4. The sides
of this small region have length δu and δv respectively, but what is its area? It’s not
simply δu δv because the sides aren’t at necessarily right angles. Instead, the small
shaded region is approximately a parallelogram.
We think of the original coordinates as functions of the new, so x = x(u, v) and
y = y(u, v). If we make vary u and v slightly, then the change in the original x and y
coordinates is
δx = ∂x
∂u δu + ∂x
∂v δv + . . . and δy = ∂y
∂u δu + ∂y
∂v δv + . . .
where the + . . . hide second order terms O(δu2), O(δv 2) and O(δu δv). This means
that we have

δx
δy
!
=

∂x/∂u ∂x/∂v
∂y/∂u ∂y/∂v
!
δu
δv
!
The small parallelogram is then spanned by the two vectors a = ( ∂x
∂u , ∂y
∂u )δu and b =
( ∂x
∂v , ∂y
∂v )δv. Recall that the area of a parallelogram is |a × b|, so we have
δA =

∂(x, y)
∂(u, v)
 δu δv = |J| δu δv
which is the promised result □
An Example: 2d Polar Coordinates
There is one particular choice of coordinates that vies with Cartesian coordinates in
their usefulness. This is plane polar coordinates, defined by
x = ρ cos ϕ and y = ρ sin ϕ
where the radial coordinate ρ ≥ 0 and the angular coordinate takes values inϕ ∈ [0, 2π).
(Note: we used ϕ(x, y) to describe a general scalar field earlier in this section. This
shouldn’t be confused with the coordinate ϕ that we’ve introduced here.) We can easily
compute the Jacobian to find
J = ∂(x, y)
∂(ρ, θ) =

cos ϕ −ρ sin ϕ
sin ϕ ρ cos ϕ
 = ρ
– 32 –


## Page 37

So we learn that the area element is given by
dA = ρ dρdϕ
There is also a simple graphical explanation of
this result: it follows by looking at the area of
the rounded square shape in the figure to the
right (again, ignoring terms second order in δϕ
and δρ).
Let’s now use this to do an integral. Let D be a
the wedge in the ( x, y) plane defined by x ≥ 0, y ≥ 0
and x2 + y2 ≤ R2. This is shown to the left. In polar
coordinates, this region is given by
0 ≤ ρ ≤ R and 0 ≤ ϕ ≤ π
2
We’ll integrate the function f = e−(x2+y2)/2 = e−ρ2/2 over the region D. In polar
coordinates, we have
Z
D
f dA =
Z π/2
0
dϕ
Z R
0
dρ ρe −ρ2/2
where the extra power of ρ in the integrand comes from the Jacobian. The
R
dϕ integral
just gives us π/2, while the
R
dρ integral is easily done. We have
Z
D
f dA = π
2
h
− e−ρ2/2
iR
0
= π
2

1 − e−R2/2

As a final application, consider taking the limit R → ∞ , so that we’re integrating
over the quadrant x, y ≥ 0. Clearly the answer is
R
D f dA = π/2. Back in Cartesian
coordinates, this calculation becomes
Z
D
f dA =
Z ∞
0
dx
Z ∞
0
dy e −(x2+y2)/2 =
Z ∞
0
dx e −x2/2
Z ∞
0
dy e −y2/2

Comparing to our previous result, we find the well-known expression for a Gaussian
integral
Z ∞
0
dx e −x2/2 =
r π
2
– 33 –


## Page 38

Figure 5. Two different ways to do a volume integral. On the left: perform the
R
dz integral
first; on the right, perform the
R
D(z) dA area integral first.
2.1.3 Volume Integrals
Most of this chapter will be devoted to discussing surfaces, but this is as good a place
as any to introduce volume integrals because they are a straightforward generalisation
of area integrals.
The basic idea should by now be familiar. The integration of a scalar function
ϕ : R3 → R over a three-dimensional region V can be approximated by dividing the
region into many small 3d pieces, each with volume δV and located at some position
xn. You then find a way to take the limit
Z
V
ϕ(x) dV = lim
δV →0
X
n
ϕ(xn) δV
In practice, we evaluate volume integrals in the same way as we evaluate area integrals:
by performing successive integrations. If we use Cartesian coordinates ( x, y, z) we have
a number of ways to proceed. For example, we could choose to first do the
R
dz integral,
subsequently leaving us with an area integral over the ( x, y) plane.
Z
V
ϕ(x, y, z) dV =
Z
dA
Z z2(x,y)
z1(x,y)
dz ϕ (x, y, z)
This approach is shown on the left-hand side of Figure 5. Alternatively, we could first
do an area integral over some sliver of the region V and subsequently integrate over all
slivers. This is illustrated on the right-hand side of Figure 5 and results in an integral
of the form Z
V
ϕ(x, y, z) dV =
Z
dz
Z
D(z)
dxdy ϕ (x, y, z)
– 34 –


## Page 39

Figure 6 . Spherical polar coordinates on the left, and cylindrical polar coordinates on the
right.
As before, for suitably nice functions ϕ and regions V , the order of integration is
unimportant.
There are many reasons to do a volume integral. You might, for example, want to
know the volume of some object, in which case you just integrate the function ϕ = 1.
Alternatively, it’s common to integrate a density of something, which means stuff per
unit volume. Integrating the density over the region V tells you the amount of stuff in
V . Examples of stuff that we will meet in other courses include mass, electric charge
and probability.
2.1.4 Spherical Polar and Cylindrical Polar Coordinates
If your region V is some blocky shape, then Cartesian coordinates are probably the
right way forward. However, for many applications it is more convenient to use a
different choice of coordinates.
Given an invertible, smooth transformation ( x, y, z) → (u, v, w) then the volume
elements are mapped to
dV = dx dy dz = |J| du dv dw
with the Jacobian given by
J = ∂(x, y, z)
∂(u, v, w) =

∂x
∂u
∂x
∂v
∂x
∂w
∂y
∂u
∂y
∂v
∂y
∂w
∂z
∂u
∂z
∂v
∂z
∂w

– 35 –


## Page 40

The sketch of the proof is identical to the 2d case: the volume of the appropriate
parallelepiped is δV = |J|δuδvδw .
Two sets of coordinates are particularly useful. The first is spherical polar coordi-
nates, related to Cartesian coordinates by the map
x = r sin θ cos ϕ
y = r sin θ sin ϕ (2.5)
z = r cos θ
The range of the coordinates is r ∈ [0, ∞), θ ∈ [0, π] and ϕ ∈ [0, 2π). The Jacobian is
∂(x, y, z)
∂(u, v, w) = r2 sin θ ⇒ dV = r2 sin θ dr dθ dϕ (2.6)
The second is cylindrical polar coordinates, which coincides with plane polar coordinates
in the ( x, y) plane, leaving z untouched
x = ρ cos ϕ
y = ρ sin ϕ (2.7)
z = z
with ρ ∈ [0, ∞) and ϕ ∈ [0, 2π) and, of course, z ∈ (−∞, +∞). (Later in the course,
we will sometimes denote the radial coordinate in cylindrical polar coordinates as r
instead of ρ.) This time the Jacobian is
∂(x, y, z)
∂(u, v, w) = ρ ⇒ dV = ρ dρ dϕ dz
We can do some dimensional analysis to check that these results make sense. In spher-
ical polars we have one coordinate, r, with dimensions of length and two dimensionless
angular coordinates. Correspondingly, the Jacobian has dimension length 2 to ensure
that dV has the dimension of volume. In cylindrical polars, we have two coordinates
with dimension of length, ρ and z, and just a single angular coordinate. This is the
reason that the Jacobian now has dimension of length rather than length 2.
– 36 –


## Page 41

Example 1: The Volume of a Sphere
Consider a spherically symmetric function f(r). We can integrate it over a ball of
radius R using spherical polar coordinates, with dV = r2 sin θ drdθdϕ to get
Z
V
f dV =
Z R
0
dr
Z π
0
dθ
Z 2π
0
dϕ r 2f(r) sinθ
= 2π
h
− cos θ
iπ
0
Z R
0
dr r 2f(r)
= 4π
Z R
0
dr r 2f(r)
In particular, if we take f(r) = 1 then we get the volume of a sphere Vol = 4 πR3/3.
Example 2: A Cylinder Cut Out of a Sphere
Next consider a more convoluted example: we want the volume of a sphere of radius
R, with a cylinder of radius s < R removed from the middle. The region V is then
x2 + y2 + z2 ≤ R2, together with x2 + y2 ≥ s2. Note that we don’t just subtract the
volume of a cylinder from the that of a sphere because the top of the cylinder isn’t flat:
it stops where it intersects the sphere.
In cylindrical coordinates, the region V spans s ≤ ρ ≤ R and −
p
R2 − ρ2 ≤ z ≤p
R2 − ρ2. And, of course, 0 ≤ ϕ < 2π. We have dV = ρ dρdzdϕ and
Vol =
Z
V
dV =
Z 2π
0
dϕ
Z R
s
dρ ρ
Z √
R2−ρ2
−
√
R2−ρ2
dz = 4π
Z R
s
dρ ρ
p
R2 − ρ2
It is now straightforward to do the integral to find the volume
Vol = 4π
3 (R2 − s2)3/2
Example 3: Electric Charge On a Hemisphere
Consider a density of electric charge that increases linearly
in the z-direction, with f(z) = f0z/R, in a hemisphere H
of radius R, with z ≥ 0 and f0 a constant. What is the
total charge in H?
In spherical polar coordinates, the coordinates for the
hemisphere H are 0 ≤ r ≤ R and 0 ≤ ϕ < 2π and, finally,
0 ≤ θ ≤ π/2, which restricts us to the hemisphere with
– 37 –


## Page 42

z ≥ 0. We integrate the function f = f0r cos θ/R over H with dV = r2 sin θ drdθdϕ to
find
Z
H
f dV = f0
R
Z 2π
0
dϕ
Z π/2
0
dθ
Z R
0
dr r 2 sin θ r cos θ = 2πf0
R
 r4
4
R
0
1
2 sin2 θ
π/2
0
= 1
4 πR3f0
As a quick check on our answer, note that f0 is the charge density so the dimensions
of the final answer are correct: the total charge is equal to the charge density times a
volume.
Vector Valued Integrals
We can also integrate vector valued fields F : R3 → R3 over a volume V . There’s
nothing subtle here: we just do the integral component by component and the final
answer is also a vector.
A common example arises when we compute the centre of mass. Let ρ(x) be the
density of an object. (Note that this isn’t a great choice of notation if we’re working
in cylindrical polar coordinates.) The total mass is
M =
Z
V
ρ(x) dV
and the centre of mass is
X = 1
M
Z
V
xρ(x) dV
For example, consider again the solid hemisphereH from the previous example, covering
0 ≤ r ≤ R and z ≥ 0. We’ll take this object to have constant density ρ. The total
mass is
M =
Z
H
ρ dV = 2π
3 ρR3
Writing X = (X, Y, Z) for the centre of mass, we need to compute the three components
individually. We have
X = ρ
M
Z
H
x dV = ρ
M
Z 2π
0
dϕ
Z R
0
dr
Z π/2
0
dθ xr 2 sin θ
= ρ
M
Z 2π
0
dϕ
Z R
0
dr
Z π/2
0
dθ r 3 sin2 θ cos ϕ = 0
– 38 –


## Page 43

where the integral
R
dϕ cos ϕ = 0. A similar calculation shows that Y = 0. Indeed, the
fact that the centre of mass lies at (X, Y ) = (0, 0) follows on symmetry grounds. We’re
left only computing the centre of mass in the z-direction. This is
Z = ρ
M
Z
H
z dV = ρ
M
Z 2π
0
dϕ
Z R
0
dr
Z π/2
0
dθ r 3 cos θ sin θ = 3R
8
We learn that the centre of mass sits at X = (0, 0, 3R/8).
Generalisation to Rn
Finally, it is straightforward to generalise multiple integrals toRn. If we make a smooth,
invertible change of coordinates from Cartesian x1, . . . , xn to some other coordinates
u1, . . . , un then the integral over some n-dimensional region M is
Z
M
f(xi) dx1 . . . dxn =
Z
M ′
f(x(ui)) |J| du1 . . . dun
where the Jacobian
J = ∂(x1, . . . , xn)
∂(u1, . . . , un) = det
 ∂xi
∂ua

is the obvious generalisation of our previous results.
2.2 Surface Integrals
Our next task is to understand how to integrate over a surface that doesn’t lie flat in
R2, but is instead curved in some way in R3. We will start by looking at how we define
such surfaces in the first place.
2.2.1 Surfaces
There are (at least) two different ways to describe a surface in R3.
• A surface can be viewed as the level set of a function,
F (x, y, z) = 0
This is one condition on three variables, so results in a two-dimensional surface
in R3. (In general, a single constraint like this results in an ( n − 1)-dimensional
space in Rn. Alternatively we say that the space has codimension one.)
• We can consider a parameterised surface, defined by the map
x : R2 → R3
This is the extension of the parameterised curve that we discussed in Section 1.
This now defines a dimension two surface in any space R3.
– 39 –


## Page 44

At each point on the surface, we can define a normal vector, n which points per-
pendicularly away from the surface. When the surface is defined as the level set of
function F (x) = 0, the normal vector lies in the direction
n ∼ ∇F
To see this, note that m · ∇F describes the rate of change of F in the direction m.
If m lies tangent to the surface then we have, by definition, m · ∇F = 0. Conversely,
the normal to the surface n lies in the direction in which the function F changes most
quickly, and this is ∇F .
It’s traditional to normalise the normal vector, so we usually define
n = ± 1
|∇F | ∇F
where we’ll say more about the choice of minus sign below.
Meanwhile, for the parameterised surface x(u, v) ∈ R3, we can construct two tangent
vectors to the surface, namely
∂x
∂u and ∂x
∂v
where each partial derivative is taken holding the other coordinate fixed. Each of these
lies within the surface, so the normal direction is
n ∼ ∂x
∂u × ∂x
∂v
If n ̸= 0 anywhere on the surface then the parameterisation is said to be regular. Note
that, although a parameterised surface can be defined in any Rn, the normal direction
is only unique in R3 where we have the cross product at our disposal.
Examples
Here are a number of examples using the definition in-
volving a level set. A sphere of radius R is defined by
F (x, y, z) = x2 + y2 + z2 − R2 = 0
the normal direction is given by ∇F = 2( x, y, z) and
points radially outwards.
– 40 –


## Page 45

Figure 7 . When the hyperboloid degenerates to a cone, there is no well defined normal at
the origin.
A hyperboloid is defined by
F (x, y, z) = x2 + y2 − z2 − R2 = 0
with normal direction given by ∇F = 2(x, y, −z). Note that for both the sphere and
hyperboloid, the normal vector is nowhere vanishing because the originx = 0 doesn’t lie
on the surface. However, if we take the limit R → 0 then the hyperboloid degenerates
to two cones, meeting at the origin. In this case, ∇F = 0 at the origin, reflecting the
fact there is no unique direction away from the surface at this point. This is shown in
Figure 7
2.2.2 Surfaces with Boundaries
A surface S can have a boundary. This is a piecewise smooth closed curve. If there are
several boundaries, then this curve should be thought of as having several disconnected
pieces.
For example, we could define the surfaces above now restricted to the region z ≥ 0.
In this case both the sphere and hyperboloid are truncated and their boundary is the
circle x2 + y2 = R2 in the z = 0 plane.
The boundary of a surface S is denoted ∂S with ∂ the standard notation to denote
the boundary of any object. For example, later in the lectures we will denote the
boundary of a 3d volume V as ∂V . You might reasonably wonder why we use the
partial derivative symbol ∂ to denote the boundary of something. There are some deep
and beautiful reasons behind this that will only become apparent in later courses. But
there is also a simple, intuitive reason. Consider a collection of 3d objects, all the same
shape but each bigger than the last. We’ll denote these volumes as Vr. Then, roughly
– 41 –


## Page 46

Figure 8 . Two orientations of a sphere, with the unit normal pointing outwards or inwards.
speaking, you can view the boundary surface as
∂Vr = lim
ϵ→0
1
ϵ

Vr+ϵ \ Vr

where \ means that you remove the 3d object Vr from inside the slightly larger object
Vr+ϵ. This, of course, looks very much like the formula for a derivative.
This “derivative equals boundary” idea also shows up when we calculate volumes,
areas and lengths. For example, a disc of radius r has area πr2. The length of the
boundary is d
dr(πr2) = 2 πr. This relation continues to higher dimensional balls and
spheres.
There is something important lurking in the idea of a boundary. The boundary is
necessarily a closed curve C, meaning that it has no end points. Another way of saying
this is that a closed curve C itself has no boundary, or ∂C = 0. We see that if a curve
arises as the boundary of a surface, then the curve itself has no boundary. This is
captured in the slogan “the boundary of a boundary vanishes” or, in equation form,
∂2S = 0. It is a general and powerful principle that extends to higher dimensional
objects where ∂2(anything) = 0. The idea that the boundary of a boundary vanishes
is usually expressed simply as ∂2 = 0.
A couple of quick definitions. A surface is said to be bounded if it doesn’t stretch
off to infinity. More precisely, a bounded surface can be contained within some solid
sphere of fixed radius. A surface that does stretch off to infinity is said to beunbounded.
Obviously, the sphere is a bounded surface, while the hyperboloid is unbounded.
Finally, a bounded surface with no boundary is said to be closed.
– 42 –


## Page 47

Figure 9 . Two unorientable surfaces: the M¨ obius strip on the left, and the Klein bottle on
the right.
2.2.3 Orientability
As long as the normal vector n ̸= 0, we can always normalise it so that it has unit
length. But in general, there is no canonical way to fix the sign. This is a matter of
convention and determines what we mean by “outside the surface” and what we mean
by “inside”.
A surface is said to be orientable if there is a consistent choice of unit normaln which
varies smoothly over the surface. The sphere and hyperboloid above are both orientable,
with the two choices of an orientation for the sphere shown in Figure 8. Throughout
these lectures we will work only with orientable surfaces. For such surfaces, a choice of
sign fixes the unit normal everywhere and is said to determine the orientation of the
surface.
We note in passing that unorientable surfaces exist. You can easily make one of these
in the comfort of your own home. Take a strip of paper and glue the two ends together.
You’ve got two different ways to glue them as shown by the arrows below:
If you glue by aligning the arrows shown on the left, then you’re just left with a boring
strip of paper. But if you glue with the arrows aligned on the right, then you end up
with something new and exciting: an unorientable surface, known as a M¨ obius strip.
You can see one that I made earlier on the left of Figure 9. If you pick a normal vector
and evolve it smoothly around the strip then you’ll find that it comes back pointing
in the other direction. Relatedly, the M¨ obius strip has a single boundary, rather than
two.
– 43 –


## Page 48

We can also make closed, unorientable surfaces using a similar construction. This
time we glue together two edges, like so
Again, you have various choices. If you glue with the arrows aligned as shown on the
left, then you’ll end up with a torus which is very much orientable. If you glue with
the arrows aligned as shown on the right then you get an unorientable surface called a
Klein bottle. It’s a little tricky to draw embedded in 3d space (and, indeed, tricky to
make with paper and glue) as it appears to intersect itself, but an attempt is shown on
the right of Figure 9.
2.2.4 Scalar Fields
We’re now in a position to start integrating objects over surfaces. For this, we work
with parameterised surfaces x(u, v).
Sit at some point ( u, v) on the surface, and move in both directions by some small
amount δu and δv. This defines an approximate parallelogram on the surface, as shown
in the figure. The area of this parallelogram is
δS =

∂x
∂u × ∂x
∂v
 δu δv
where, as usual, we’ve dropped higher order
terms. This is called the scalar area. (We’ll
see the need for the adjective “scalar” below
when we introduce a variant known as the vec-
tor area.)
Now we’re in a position to define the surface
integral of a scalar field ϕ(x). Given a parameterised surface S, the surface integral is
given by
Z
S
ϕ(x) dS =
Z
D
dudv

∂x
∂u × ∂x
∂v
 ϕ(x(u, v)) (2.8)
– 44 –


## Page 49

where D is the appropriate region in the ( u, v) plane. This is now the same kind of
area integral that we learned to do in Section 2.1.
The area integral of a scalar field does not depend on the orientation of the surface.
It doesn’t matter what you choose as the inside of the surface S and what you choose
as the outside, the integral of a scalar field over S always gives the same answer. In
particular, if we integrate ϕ = 1 over a surface S then we get the area of that surface,
and this is always positive. This is entirely analogous to the line integral of a scalar
field that we met in Section 1.2 that was independent of the orientation of the curve.
Reparameterisation Invariance
Importantly, the surface integral (2.8) is independent of the choice of parameterisation
of the surface. To see this, suppose that we replace our original parameterisationx(u, v)
with an alternative parameterisation x(˜u, ˜v), both of which are assumed to be regular.
We then have
∂x
∂u = ∂x
∂˜u
∂˜u
∂u + ∂x
∂˜v
∂˜v
∂u and ∂x
∂v = ∂x
∂˜u
∂˜u
∂v + ∂x
∂˜v
∂˜v
∂v
Taking the cross-product, we have
∂x
∂u × ∂x
∂v = ∂(˜u, ˜v)
∂(u, v)
∂x
∂˜u × ∂x
∂˜v
This means that the scalar area element can equally well be written as
dS =

∂x
∂˜u × ∂x
∂˜v
 d˜u d˜v
where we’ve used the result (2.4) which, in the current context, is d˜u d˜v = ∂(˜u,˜v)
∂(u,v) du dv.
The essence of this calculation is the same as we saw for line integrals: the two
derivatives ∂/∂u and ∂/∂v in the integrand cancel the Jacobian factor under a change
of variables. The upshot is that we can write the surface integral (2.8) using any
parameterisation that we wish: the answer will be the same.
An Example
Consider a sphere of radius R. Let S be the subregion that sits at an angle θ ≤ α from
the vertical. This is the grey region shown in the figure. We want to compute the area
of this cap.
We start by constructing a parameterisation of the sphere. This is straightforward if
we use the spherical polar angles θ and ϕ defined in (2.5) as parameters. We have
x(θ, ϕ) = R(sin θ cos ϕ, sin θ sin ϕ, cos θ) := R er
– 45 –


## Page 50

Here er is the unit vector that points radially outwards.
(We will also use the notation er = ˆr later in these
lectures.) We can then easily calculate
∂x
∂θ = R(cos θ cos ϕ, cos θ sin ϕ, − sin θ) := R eθ
∂x
∂ϕ = R(− sin θ sin ϕ, sin θ cos ϕ, 0) := R sin θ eϕ
Here, by construction, eθ and eϕ are unit vectors pointing in the direction of increasing
θ and ϕ respectively. We’ll have more to say about the triplet of vectors er, eθ and eϕ
in Section 3.3. For now, we can compute
∂x
∂θ × ∂x
∂ϕ = R2 sin θ er
From this, we have the scalar area element
dS = R2 sin θ dθ dϕ (2.9)
We’ve seen a result very similar to this before. The volume element in spherical polar
coordinates (2.6) is dV = r2 sin θ dr dθ dϕ. Our area element over a sphere simply comes
from setting r = R and ignoring the dr piece of the volume element.
It is now straightforward to compute the area. We have
A =
Z 2π
0
dϕ
Z α
0
dθ R 2 sin θ = 2πR2(1 − cos α)
Note that if we set α = π then we get the area of a full sphere: A = 4πR2.
2.2.5 Vector Fields and Flux
Now we turn to vector fields. There is a particularly interesting and useful way to
integrate a vector field F(x) over a surface S so that we end up with a number. We do
this by taking the inner product of the vector field with the normal to the surface, n,
so that
Z
S
F(x) · n dS =
Z
D
dudv
 ∂x
∂u × ∂x
∂v

· F(x(u, v)) (2.10)
This is called the flux of F through S.
The definition of the flux is independent of our choice of parameterisation: the
argument is identical to the one we saw above for a scalar field.
– 46 –


## Page 51

It’s convenient to introduce some new notation. The vector area element is defined
as
dS = n dS =
 ∂x
∂u × ∂x
∂v

du dv
This has magnitude dS and points in the normal direction n.
The flux of a vector field depends on the orientation of the surface S. This can be
seen in the presence of the normal vector in (2.10). In the parameterised surfacex(u, v),
the choice of orientation can be traced to the parameterisation (u, v) and, in particular,
the order in which they appear in the cross product. Changing the orientation of the
surface flips the sign of the flux.
The physical importance of the flux can be seen by thinking about a fluid. Let F(x)
be the velocity field of a fluid. (Usually we would denote this as u(x) or v(x), but we’ve
already used u and v as the parameters of the surface so we’ll adopt the non-standard
name F for the velocity to avoid confusion.) In a small time δt, the amount of fluid
flowing through a small surface element δS is given by
Fluid Flow = F δt · n δS
where the dot product ensures that we don’t include the component of fluid that flows
parallel to the surface. Integrating over the whole surface, we see that the flux of fluid
Flux =
Z
S
F · dS
is the amount of fluid crossing S per unit time . In other words, the flux is the rate of
fluid flow.
We also talk of “flux” in other contexts, where there’s no underlying flow. For
example, in our course on Electromagnetism, we will spend some time computing the
flux of the electric field through various surfaces,
R
S E · dS.
An Example
Consider the vector field
F = (−x, 0, z)
This is plotted in the y = constant plane in the figure.
– 47 –


## Page 52

We want to integrate this vector field over
the hemispherical cap, subtended by the an-
gle α that we used as an example in Section
2.2.4. This is the region of a sphere of radius
R, spanned by the polar coordinates
0 ≤ θ ≤ α and 0 ≤ ϕ < 2π
We know from our previous work that
dS = R2 sin θ er dθ dϕ with er = (sin θ cos ϕ, sin θ sin ϕ, cos θ)
In particular, we have
F · er = −x sin θ cos ϕ + z cos θ = R(− sin2 θ cos2 ϕ + cos2 θ)
The flux through the hemispherical cap is then
Z
F · dS =
Z α
0
dθ
Z 2π
0
dϕ R 3 sin θ

− sin2 θ cos2 ϕ + cos2 θ

We use
R 2π
0 dϕ cos2 ϕ = π to get
Z
F · dS = πR3
Z α
0
dθ sin θ

− sin2 θ + 2 cos2 θ

= πR3
h
cos θ sin2 θ
iα
0
= πR3 cos α sin2 α (2.11)
2.2.6 A Sniff of the Gauss-Bonnet Theorem
The methods described in this section have many interesting applications to geometry.
Here we sketch two important ideas. We prove neither.
Consider a surface S and pick a point with normal n. We can construct a plane
containing n, as shown in the figure. The intersection of the original surface and the
plane describes a curve C that lies in S. Associated to this curve is a curvature κ,
defined in (1.6).
Now, we rotate the plane about n. As we do so, the curve C changes and so too
does the curvature. Of particular interest are the maximum and minimum curvatures
κmin ≤ κ ≤ κmax
– 48 –


## Page 53

These are referred to as principal curvatures.
The Gaussian curvature of the surface S at our
chosen point is then defined to be
K = κminκmax
As defined, the curvature K would appear to
have as much to do with the embedding of the
surface in R3 as the surface itself. The theo-
rem egregium (or “remarkable” theorem) due
to Gauss, is the statement that this is mislead-
ing: the curvature K is a property of the sur-
face alone, irrespective of any choice of embedding. We say that K is intrinsic to the
surface.
The idea that curved surfaces have a life of their own, independent of their em-
bedding, is an important one. It generalises to higher dimensional spaces, known as
manifolds, which are the subject of differential geometry. In physics, curved space
(or, more precisely, curved spacetime) provides the framework for our understanding
of gravity. Both Riemannian geometry and its application to gravity will be covered in
lectures on General Relativity.
The Gaussian curvature K has a number of interesting properties. Here’s one. Con-
sider a geodesic triangle drawn on the surface as shown in Figure 10. This means that
we connect three points with geodesics, which are lines of the shortest distance as mea-
sured using the arc length (1.5). Let θ1, θ2 and θ3 be the interior angles of the triangle,
defined by the inner product of tangent vectors of the geodesic curves. Then it turns
out that
θ1 + θ2 + θ3 = π +
Z
D
K dS (2.12)
where D is the interior region of the triangle. If the triangle is drawn on flat R2, then
K = 0 and this theorem reduces to the well known statement that the angles of a
triangle add up to π.
We can check this formula for the simple case of a triangle drawn on a sphere. If
the sphere has radius R then the geodesics are great circles and, as we saw in Section
1.1, they all have curvature κ = 1/R. Correspondingly, the Gaussian curvature for a
sphere is K = 1/R2. A geodesic triangle is shown in the figure to the below: it has two
right-angles π/2 sitting at the equator, and an angle α at the top.
– 49 –


## Page 54

Figure 10 . A geodesic triangle inscribed on a surface.
The area of the region inside the triangle is A = αR2
(so that A = 2 πR2 when α = 2 π which is the area of
the upper hemisphere.). We then have
Z
D
K dS = A
R2 = α
which agrees with the result (2.12).
Here’s another beautiful application of the Gaussian
curvature. Consider a closed surface S. Any such sur-
face can be characterised by the number of holes that it has. This number of holes is
known as the genus. Three examples are given in Figure 11: a sphere with g = 0, a
torus with g = 1 and some kind of baked-good with genus g = 3. It turns out that if
you integrate the Gaussian curvature over the entire surface then you get
Z
S
K dS = 4π(1 − g) (2.13)
This result is all kinds of wonderful. The genus g tells us about the topology of the
surface. It’s a number that only makes sense when you stand back and look at the
object as a whole. In contrast, the Gaussian curvature is a locally defined object: at
any given point it depends only on the neighbourhood of that point. But this result
tells us that integrating something local can result in something global.
The round sphere provides a particularly simple example of this result. As we’ve
seen above, the Gaussian curvature is K = 1 /R2 which, when integrated over the
– 50 –


## Page 55

Figure 11 . Three closed surfaces with different topologies. The sphere has genus g = 0, the
torus has genus g = 1 and the surface on the right has g = 3.
whole sphere, does indeed give 4 π as befits a surface of genus g = 0. However, this
simple calculation hides the magic of the formula (2.13). Suppose that we start to
deform the sphere. We might choose to pull it out in some places, push it inwards in
others. We could try to mould some likeness of our face in some part of it. Everything
that we do changes the local Gaussian curvature. It will increase in some parts and
decrease in others. But the formula (2.13) tells us that this must, at the end of the
day, cancel out. As long as we don’t tear the surface, so its topology remains that of a
sphere, the integral of K will always give 4π.
The results (2.12) and (2.13) are two sides of the wondrous Gauss-Bonnet theorem.
A proof of this theorem will have to wait for later courses. (You can find a somewhat
unconventional proof using methods from physics in the lectures on Supersymmetric
Quantum Mechanics. This proof also works for a more powerful generalisation to higher
dimensional spaces, known as the Chern-Gauss-Bonnet theorem.)
– 51 –


## Page 56

3 Grad, Div and Curl
In this section we’re going to further develop the ways in which we can differentiate.
We’ll be particularly interested in how we can differentiate scalar and vector fields. Our
definitions will be straightforward but, at least for the time being, we won’t be able to
offer the full intuition behind these ideas. Perhaps ironically, the full meaning of how to
differentiate will become clear only in Section 4 where we also learn the corresponding
different ways to integrate.
3.1 The Gradient
We’ve already seen how to differentiate a scalar field ϕ : Rn → R. Given Cartesian
coordinates xi with i = 1, . . . , n on Rn, the gradient of ϕ is defined as
∇ϕ = ∂ϕ
∂xi ei (3.1)
Note that differentiating a scalar field leaves us with a vector field.
The definition above relies on a choice of Cartesian coordinates. Later in this section,
we’ll find expressions for the gradient in different coordinate systems. But there is also
a definition of the gradient that does not rely on any coordinate choice at all. This
starts by considering a point x ∈ Rn. We don’t, yet, think of x as defined by a string of
n numbers: that comes only with a choice of coordinates. Instead, it should be viewed
as an abstract point in Rn.
The first principles, coordinate-free definition of the gradient ∇ϕ simply compares
the value of ϕ at some point x to the value at some neighbouring point x + h with
h = |h| ≪ 1. For a differentiable function ϕ, we can write
ϕ(x + h) = ϕ(x) + h · ∇ϕ + O(h2) (3.2)
where this should be thought of as the definition of the gradient ∇ϕ. Note that it’s
similar in spirit to our definition of the tangent to a curve ˙x given in (1.2). If we pick
a choice of coordinates, with x = (x1, . . . , xn), then we can take h = ϵ ei with ϵ ≪ 1.
The definition (3.2) then coincides with (3.1),
An Example
Consider the function on R3,
ϕ(x, y, z) = − 1p
x2 + y2 + z2
= −1
r
– 52 –


## Page 57

where r2 = x2 + y2 + z2 is the distance from
the origin. We have
∂ϕ
∂x = x
(x2 + y2 + z2)3/2 = x
r3
and similar for the others. The gradient is then
given by
∇ϕ = xˆx + yˆy + zˆz
r3 = ˆr
r2
where, in the final expression, we’ve introduced
the unit vector ˆr which points out radially outwards in each direction, like the spikes
on a hedgehog as shown in the figure. The vector field ∇ϕ points radially, decreasing as
1/r2. Vector fields of this kind are important in electromagnetism where they describe
the electric field E(x) arising from a charged particle.
An Application: Following a Curve
Suppose that we’re given a curve in Rn, defined by the map x : R → Rn, together
with a scalar field ϕ : Rn → R. Then we can combine these into the composite map
ϕ(x(t)) : R → R. This is simply the value of the scalar field evaluated on the curve. We
can then differentiate this map along the curve using the higher dimensional version of
the chain rule.
dϕ(x(t))
dt = ∂ϕ
∂xi
dxi
dt
This has a nice, compact expression in terms of the gradient,
dϕ(x(t))
dt = ∇ϕ · dx
dt
This tells us how the function ϕ(x) changes as we move along the curve.
3.2 Div and Curl
At this stage we take an interesting and bold mathematical step. We view ∇ as an
object in its own right. It is called the gradient operator.
∇ = ei
∂
∂xi (3.3)
This is both a vector and an operator. The fact that ∇ is an operator means that it’s
just waiting for a function to come along (from the right) and be differentiated.
– 53 –


## Page 58

The gradient operator ∇ sometimes goes by the names nabla or del, although usually
only when explaining to students in a first course on vector calculus that ∇ sometimes
goes by the names nabla or del. (Admittedly, the latex command for ∇ is \nabla which
helps keep the name alive.)
With ∇ divorced from the scalar field on which it originally acted, we can now think
creatively about how it may act on other fields. As we’ve seen, a vector field is defined
to be a map
F : Rn → Rn
Given two vectors, we all have a natural urge to dot them together. This gives a
derivative acting on vector fields known as the divergence
∇ · F =

ei
∂
∂xi

· (ejFj) = ∂Fi
∂xi
where we’ve used the orthonormality ei · ej = δij. Note that the gradient of a scalar
field gave a vector field. Now the divergence of a vector field gives a scalar field.
The divergence isn’t the only way to differentiate a vector field. If we’re in Rn,
a vector field has N components and we could differentiate each of these in one of N
different directions. This means that there are N 2 different meanings to the “derivative
of a vector field”. But the divergence turns out to be the combination that is most
useful.
Both the gradient and divergence operations can be applied to fields in Rn. In
contrast, our final operation holds only for vector fields that map
F : R3 → R3
In this case, we can take the cross product. This gives a derivative of a vector field
known as the curl,
∇ × F =

ei
∂
∂xi

× (ejFj) = ϵijk
∂Fj
∂xi ek
Or, written out in its full glory,
∇ × F =
 ∂F3
∂x2 − ∂F2
∂x3 , ∂F1
∂x3 − ∂F3
∂x1 , ∂F2
∂x1 − ∂F1
∂x2

(3.4)
– 54 –


## Page 59

The curl of a vector field is, again, a vector field. It can also be written as the deter-
minant
∇ × F =

e1 e2 e3
∂
∂x1
∂
∂x2
∂
∂x3
F1 F2 F3

As we proceed through these lectures, we’ll build intuition for the meaning of these
two derivatives. We will see, in particular, that the divergence ∇ · F measures the net
flow of the vector field F into, or out of, any given point. Meanwhile, the curl ∇ × F
measures the rotation of the vector field. A full understanding of this will come only
in Section 4 when we learn to undo the differentiation through integration. For now
we will content ourselves with some simple examples.
Simple Examples
Consider the vector field
F(x) = (x2, 0, 0)
Clearly this flows in a straight line, with increasing strength. It has∇·F = 2x, reflecting
the fact that the vector field gets stronger as x increases. It also has ∇ × F = 0.
Next, consider the vector field
F(x) = (y, −x, 0)
This swirls, as shown in the figure on the right. We
have ∇ · F = 0 and ∇ × F = (0 , 0, −2). The curl
points in the ˆz direction, perpendicular to the plane
of the swirling.
Finally, we can consider the hedgehog-like radial
vector field that we met previously,
F = ˆr
r2 = 1
(x2 + y2 + z2)3/2 (x, y, z) (3.5)
You can check that this obeys∇· F = 0 and ∇× F = 0. Or, to be more precise, it obeys
these equations almost everywhere. Clearly something fishy is going on at the origin
r = 0. In fact, we will later see that we can make this less fishy: a correct statement is
∇ · F = 4πδ 3(x)
where δ3(x) is the higher-dimensional version of the Dirac delta function. We’ll under-
stand this result better in Section 5 where we will wield the Gauss divergence theorem.
– 55 –


## Page 60

When evaluating the derivatives of radial fields, like the hedgehog (3.5), it’s best to
work with the radial distance r, given by r2 = xixi. Taking the derivative then gives
2r∂r/∂x i = 2xi and we have ∂r/∂x i = xi/r. You can then check that, for any integer
p,
∇rp = ei
∂(rp)
∂xi = prp−1ˆr
Meanwhile, the vector x = xiei can equally well be written as x = r = rˆr which
highlights that it points outwards in the radial direction. We have
∇ · r = ∂xi
∂xi = δii = n
where the n arises because we’re summing over all i = 1 , . . . , n. (Obviously, if we’re
working in R3 then n = 3.) We can also take the curl
∇ × r = ϵijk
∂xj
∂xi ek = 0
which, of course, as always holds only in R3.
3.2.1 Some Basic Properties
There are a number of straightforward properties obeyed by grad, div and curl. First,
each of these is a linear differential operator, meaning that
∇(αϕ + ψ) = α∇ϕ + ∇ψ
∇ · (αF + G) = α∇ · F + ∇ · G
∇ × (αF + G) = α∇ × F + ∇ × G
for any scalar fields ϕ and ψ, vector fields F and G, and any constant α.
Next, each of them has a Leibniz property, which means that they obey a generali-
sation of the product rule. These are
∇(ϕψ) = ϕ∇ψ + ψ∇ϕ
∇ · (ϕF) = ( ∇ϕ) · F + ϕ(∇ · F)
∇ × (ϕF) = ( ∇ϕ) × F + ϕ(∇ × F)
In the last of these, you need to be careful about the placing and ordering of ∇, just
like you need to be careful about the ordering of any other vector when dealing with
the cross product. The proof of any of these is simply an exercise in plugging in the
– 56 –


## Page 61

component definition of the operator and using the product rule. For example, we can
prove the second equality thus:
∇ · (ϕF) = ∂(ϕFi)
∂xi = ∂ϕ
∂xi Fi + ϕ ∂Fi
∂xi = (∇ϕ) · F + ϕ(∇ · F)
There are also a handful of further Leibnizian properties involving two vector fields.
The first of these is straightforward to state:
∇ · (F × G) = (∇ × F) · G − F · (∇ × G)
This is simplest to prove using index notation. Alternatively, it follows from the usual
scalar triple product formula for three vectors. To state the other properties, we need
one further small abstraction. Given a vector field F and the gradient operator ∇, we
can construct further differential operators. These are
F · ∇ = Fi
∂
∂xi and F × ∇ = ekϵijkFi
∂
∂xj
Note that the vector fieldF sits on the left, so isn’t acted upon by the partial derivative.
Instead, each of these objects is itself a differential operator, just waiting for something
to come along so that it can differentiate it. In particular, these constructions appear
in two further identities
∇(F · G) = F × (∇ × G) + G × (∇ × F) + (F · ∇)G + (G · ∇)F
∇ × (F × G) = ( ∇ · G)F − (∇ · F)G + (G · ∇)F − (F · ∇)G
Again, these are not difficult to prove: they follow from expanding out the left-hand
side in components.
3.2.2 Conservative is Irrotational
Recall that a conservative vector field F is one that can be written as
F = ∇ϕ
for some scalar field ϕ. We also say that F is irrotational if ∇ × F = 0. There is a
beautiful theorem that says these two concepts are actually equivalent:
Theorem: For fields defined everywhere on R3, conservative is the same as irrota-
tional.
∇ × F = 0 ⇐ ⇒ F = ∇ϕ
– 57 –


## Page 62

Half Proof: It is trivial to prove this in one direction, Suppose that F = ∇ϕ, so that
Fi = ∂iϕ. Then
∇ × F = ϵijk∂iFjek = ϵijk∂i∂jϕ ek = 0
which vanishes because the ϵijk symbol means that we’re anti-symmetrising over ij,
but the partial derivatives ∂i∂j are symmetric, so the terms like ∂1∂2 − ∂2∂1 cancel.
It is less obvious that the converse statement holds, i.e. that irrotational implies
conservative. We’ll show this only in Section 4.4 where it appears as a corollary of
Stokes’ theorem. □
Recall that in Section 1.3 we showed that the line integral of a conservative field was
independent of the path taken. Putting this together with the result above, we have
the following, equivalent statements:
∇ × F = 0 ⇐ ⇒ F = ∇ϕ ⇐ ⇒
I
C
F · dx = 0
where we’ve yet to see the proof of the first = ⇒. In fact, we will complete this step
through Stokes’ theorem which shows that the statement on the far-left is equivalent
to the statement on the far-right.
3.2.3 Solenoidal Fields
Here is another definition. A vector field F is called divergence free or solenoidal if
∇ · F = 0. (The latter name comes from electromagnetism, where a magnetic field B
is most easily generated by a tube with a bunch of wires wrapped around it known as
a “solenoid” and has the property ∇ · B = 0.)
There is a nice theorem about divergence free fields that is a counterpart to the one
above:
Theorem: Any divergence free field can be written as the curl of something else,
∇ · F = 0 ⇐ ⇒ F = ∇ × A
again, provided that F is defined everywhere on R3. Note that A is not unique. In
particular, if you find one A that does the job then any other A+ ∇ϕ will work equally
as well. In later courses, we will see that this theorem and the previous one both get
subsumed into a single theorem known as the Poincar´ e lemma.
– 58 –


## Page 63

Proof: It’s again straightforward to show this one way. If F = ∇ × A, then Fi =
ϵijk∂jAk and so
∇ · F = ∂i(ϵijk∂jAk) = 0
which again vanishes for the symmetry reasons.
This time, we will prove the converse statement by explicitly exhibiting a vector
potential A such that F = ∇ × A. We pick some arbitrary point x0 = (x0, y0, z0) and
then construct the following vector field
A(x) =
Z z
z0
Fy(x, y, z′) dz′ ,
Z x
x0
Fz(x′, y, z0) dx′ −
Z z
z0
Fx(x, y, z′) dz′ , 0

(3.6)
Since Az = 0, the definition of the curl (3.4) becomes
∇ × A =

− ∂Ay
∂z , ∂Ax
∂z , ∂Ay
∂x − ∂Ax
∂y

Using the ansatz (3.6), we find that the first two components of ∇ × A immediately
give what we want
(∇ × A)x = Fx(x, y, z) and ( ∇ × A)y = Fy(x, y, z)
both of which follow from the fundamental theorem of calculus. Meanwhile, we still
have a little work ahead of us for the final component
(∇ × A)z = Fz(x, y, z0) −
Z z
z0
∂Fx
∂x (x, y, z′) dz′ −
Z z
z0
∂Fy
∂y (x, y, z′) dz′
At this point we use the fact that F is solenoidal, so ∇ · F = 0 and so ∂Fz/∂z ′ =
−(∂Fx/∂x + ∂Fy/∂y). We then have
(∇ × A)z = Fz(x, y, z0) +
Z z
z0
∂Fz
∂z ′ (x, y, z′) dz′ = Fz(x, y, z)
This is the result we want. □
Note that both theorems above come with a caveat: the fields must be defined
everywhere on R3. This is important as counterexamples exist that do not satisfy this
requirement, similar to the one that we met in a previous context in Section 1.3.4.
These counterexamples will take on a life of their own in future courses where they
provide the foundations to think about topology, both in mathematics and physics.
– 59 –


## Page 64

We’ve seen two related results above. A vector field F = ∇ϕ obeys ∇ ×F = 0 and a
vector field F = ∇ ×A obeys ∇ ·F = 0. In fact, it can be shown that the most general
vector field on R3 can be decomposed a
F = ∇ϕ + ∇ × A
for some ϕ and A. This is known as the Helmholtz decomposition. We won’t prove this
statement here, although it follows from the result above if you can show that, for any
F, there always exists a potential ϕ such that F − ∇ϕ is solenoidal. (This ultimately
follows from properties of the Laplace equation that we describe in section 5.2.)
3.2.4 The Laplacian
The Laplacian is a second order differential operator defined by
∇2 = ∇ · ∇ = ∂2
∂xi∂xi
For example, in 3d the Laplacian takes the form
∇2 = ∂2
∂x2 + ∂2
∂y 2 + ∂2
∂z 2
This is a scalar differential operator meaning that, when acting on a scalar field ϕ, it
gives back another scalar field ∇2ϕ. Similarly, it acts component by component on a
vector field F, giving back another vector field ∇2F. If we use the vector triple product
formula, we find
∇ × (∇ × F) = ∇(∇ · F) − ∇2F
which we can rearrange to give an alternative expression for the Laplacian acting on
the components of a vector field
∇2F = ∇(∇ · F) − ∇ × (∇ × F)
We’ll devote Section 5 to solving various equations involving the Laplacian.
3.2.5 Some Vector Calculus Equations in Physics
I mentioned in the introduction that all laws of physics are written in the language
of vector calculus (or, in the case of general relativity, a version of vector calculus
extended to curved spaces, known as differential geometry). Here, for example, are the
four equations of electromagnetism, known collectively as the Maxwell equations
∇ · E = ρ
ϵ0
, ∇ × E = − ∂B
∂t (3.7)
∇ · B = 0 , ∇ × B = µ0

J + ϵ0
∂E
∂t

– 60 –


## Page 65

Here E and B are the electric and magnetic fields, while ρ(x) is a scalar field that
describes the distribution of electric charge in space and J(x) is a vector field that
describes the distribution of electric currents. The equations also include two constants
of nature, ϵ0 and µ0 which describe the strengths of the electric and magnetic forces
respectively.
This simple set of equations describes everything we know about electricity, mag-
netism and light. Extracting this information requires the tools that we will develop
in the rest of these lectures. Along the way, we will sometimes turn to the Maxwell
equations to illustrate new ideas.
You’ll find the Laplacian sitting in many other equations of physics. For example,
the Schr¨ odinger equation describing a quantum particle is written using the Laplacian.
A particularly important equation, that crops up in many places, is the heat equation,
∂T
∂t = D∇2T
This tells us, for example, how temperature T (x, t) evolves over time. Here D is called
the diffusion constant . This same equation also governs the spread of many other
substances when there is some random element in the process, such as the constant
bombardment from other atoms. For example, the smell of that guy who didn’t shower
before coming to lectures spreads through the room in manner described by the heat
equation.
3.3 Orthogonal Curvilinear Coordinates
The definition of all our differential operators relied heavily on using Cartesian co-
ordinates. The purpose of this section is simply to ask what these objects look like
in different coordinate systems. As usual, the spherical polar and cylindrical polar
coordinates in R3 will be of particular interest to us.
In general, we can describe a point x in R3 using some coordinates u, v, w, so x =
x(u, v, w). Changing either of these coordinates, leaving the others fixed, results in a
change in x. We have
dx = ∂x
∂u du + ∂x
∂v dv + ∂x
∂w dw (3.8)
Here ∂x/∂u is the tangent vector to the lines defined by v, w = constant, with similar
statements for the others. A given set of coordinates provides a good parameterisation
of some region provided that
∂x
∂u ·
 ∂x
∂v × ∂x
∂w

̸= 0
– 61 –


## Page 66

The coordinate (u, v, w) are said to beorthogonal curvilinear if the three tangent vectors
are mutually orthogonal. Here the slightly odd name “curvilinear” reflects the fact that
these tangent vectors are typically not constant, but instead depend on position. We’ll
see examples shortly.
For orthogonal curvilinear coordinates, we can always define orthonormal tangent
vectors simply by normalising them. We write
∂x
∂u = hueu , ∂x
∂v = hvev , ∂x
∂w = hwew
where we’ve introduced scale factors hu, hv, hw > 0 and eu, ev and ew form a right-
handed orthonormal basis so that eu ×ev = ew. This can always be achieved simply by
ordering the coordinates appropriately. Our original equation (3.8) can now be written
as
dx = hueudu + hvevdv + hwewdw (3.9)
Squaring this, we have
dx2 = h2
u du2 + h2
v dv2 + h2
w dw2
from which it’s clear that hu, hv and hw are scale factors that tell us the change in
length as we change each of the coordinates.
Throughout this section, we’ll illustrate everything with three coordinate systems.
Cartesian Coordinates
First, Cartesian coordinates are easy:
x = (x, y, z) = ⇒ hx = hy = hz = 1 and ex = ˆx, ey = ˆy, ez = ˆz
Cylindrical Polar Coordinates
Next, cylindrical polar coordinates are defined by (see also (2.7))
x = (ρ cos ϕ, ρsin ϕ, z)
with ρ ≥ 0 and ϕ ∈ [0, 2π) and z ∈ R. Inverting,
ρ =
p
x2 + y2 and tan ϕ = y
x
– 62 –


## Page 67

Figure 12 . Cylindrical polar coordinates, on the left, and spherical polar coordinates, on
the right.
It’s straightforward to calculate
eρ = ˆρ = (cos ϕ, sin ϕ, 0)
eϕ = ˆϕ = (− sin ϕ, cos ϕ, 0)
ez = ˆz
with
hρ = hz = 1 and hϕ = ρ
The three orthonormal vectors are shown on the left-hand side of Figure 12 in red.
Note, in particular, that the vectors depend on ϕ and rotate as you change the point
at which they’re evaluated.
Spherical Polar Coordinates
Spherical polar coordinates are defined by (see also (2.5).)
x = (r sin θ cos ϕ, r sin θ sin ϕ, r cos θ)
with r ≥ 0 and θ ∈ [0, π] and ϕ ∈ [0, 2π). Inverting,
r =
p
x2 + y2 + z2 , tan θ =
p
x2 + y2
z , tan ϕ = y
x
Again, we can easily calculate the basis vectors
er = ˆr = (sin θ cos ϕ, sin θ sin ϕ, cos θ)
eθ = ˆθ = (cos θ cos ϕ, cos θ sin ϕ, − sin θ)
eϕ = ˆϕ = (− sin ϕ, cos ϕ, 0)
– 63 –


## Page 68

These are shown in the right-hand side of Figure 12 in red. This time, the scaling
factors are
hr = 1 , h θ = r , h ϕ = r sin θ
We’ll now see how various vector operators appear when written in polar coordinates.
3.3.1 Grad
The gradient operator is straightforward. If we shift the position from x to x + δx,
then a scalar field f(x) changes by
d f= ∇f · dx (3.10)
This definition can now be used in any coordinate system. In a general coordinate
system we have
d f= ∂f
∂u du + ∂f
∂v dv + ∂f
∂w dw = ∇f · (hueudu + hvevdv + hwewdw)
Using the orthonormality of the basis elements vectors, and comparing the terms on
the left and right, this then gives us the gradient operator
∇f = 1
hu
∂f
∂u eu + 1
hv
∂f
∂v ev + 1
hw
∂f
∂w ew (3.11)
In cylindrical polar coordinates, the gradient of a function f(ρ, ϕ, z) is
∇f = ∂f
∂ρ ˆρ + 1
ρ
∂f
∂ϕ
ˆϕ + ∂f
∂z ˆz
In spherical polar coordinates, the gradient of a function f(r, θ, ϕ) is
∇f = ∂f
∂r ˆr + 1
r
∂f
∂θ
ˆθ + 1
r sin θ
∂f
∂ϕ
ˆϕ
Note, in particular, that when we differentiate with respect to an angle there is always
a compensating 1 /length prefactor to make sure that the dimensions are right.
3.3.2 Div and Curl
To construct the div and curl in a general coordinate system, we first extract the vector
differential operator
∇ = 1
hu
eu
∂
∂u + 1
hv
ev
∂
∂v + 1
hw
ew
∂
∂w (3.12)
– 64 –


## Page 69

where, importantly, we’ve placed the vectors to the left of the differentials because, as
we’ve seen, the basic vectors now typically depend on the coordinates. If we act on a
function f with this operator, we recover the gradient (3.11). But now we have this
abstract operator, we can also take it to act on a vector fieldF(u, v, w). We can expand
the vector field as
F(u, v, w) = Fueu + Fvev + Fwew
Each of the components depends on the coordinates u, v and w. But so too, in general,
do the basis vectors{eu, ev, ew}. This means that when the derivatives in the differential
operator (3.12) hit F, they also act on both the components and the basis vectors.
Given an explicit expression for the basis vectors, it’s not hard to see what happens
when they are differentiated. For example, in cylindrical polar coordinates we find
∇ · F = 1
ρ
∂(ρFρ)
∂ρ + 1
ρ
∂Fϕ
∂ϕ + ∂Fz
∂z
and
∇ × F =
1
ρ
∂Fz
∂ϕ − ∂Fϕ
∂z

ˆρ +
 ∂Fρ
∂z − ∂Fz
∂ρ

ˆϕ + 1
ρ
 ∂(ρFϕ)
∂ρ − ∂Fρ
∂ϕ

ˆz
There is a question on Examples Sheet 2 that asks you to explicitly verify this. Mean-
while, in spherical polar coordinates, we have
∇ · F = 1
r2
∂(r2Fr)
∂r + 1
r sin θ
∂(sin θFθ)
∂θ + 1
r sin θ
∂Fϕ
∂ϕ
and
∇ × F = 1
r sin θ
 ∂(sin θFϕ)
∂θ − ∂Fθ
∂ϕ

ˆr
+ 1
r
 1
sin θ
∂Fr
∂ϕ − ∂(rFϕ)
∂r

ˆθ
+ 1
r
 ∂(rFθ)
∂r − ∂Fr
∂θ

ˆϕ
For completeness, we also give the general results
Claim: Given a vector field F(u, v, w) in a general orthogonal, curvilinear coordinate
system, the divergence is given by
∇ · F = 1
huhvhw
 ∂
∂u (hvhwFu) + ∂
∂v (huhwFv) + ∂
∂w (huhvFw)

(3.13)
– 65 –


## Page 70

and the curl is given by the determinant
∇ × F = 1
huhvhw

hueu hvev hwew
∂
∂u
∂
∂v
∂
∂w
huFu hvFv hwFw

where the derivatives on the second line should now be thought of as acting on the
third line only, but not the first. This means that, in components, we have
∇ × F = 1
hvhw
 ∂
∂v (hwFw) − ∂
∂w (hvFv)

eu + two similar terms
Proof: Not now. Later. It turns out to be a little easier when we have some integral
technology in hand. For this reason, we’ll revisit this in Section 4.4.4.
3.3.3 The Laplacian
Finally, we have the Laplacian. From (3.11) and (3.13), this takes the general form
∇2f = ∇ · ∇f = 1
huhvhw
 ∂
∂u
 hvhw
hu
∂f
∂u

+ ∂
∂v
 huhw
hv
∂f
∂v

+ ∂
∂w
 huhv
hw
∂f
∂w

Obviously in Cartesian coordinates, the Laplacian is
∇2f = ∂2f
∂x2 + ∂2f
∂y 2 + ∂2f
∂z 2
In cylindrical polar coordinates it takes the form
∇2f = 1
ρ
∂
∂ρ

ρ ∂f
∂ρ

+ 1
ρ2
∂2f
∂ϕ2 + ∂2f
∂z 2 (3.14)
and in spherical polar coordinates
∇2f = 1
r2
∂
∂r

r2 ∂f
∂r

+ 1
r2 sin θ
∂
∂θ

sin θ ∂f
∂θ

+ 1
r2 sin2 θ
∂2f
∂ϕ2 (3.15)
The most canonical of canonical physics textbooks is J.D. Jackson’s “Classical Elec-
trodynamics”. I don’t know of any theoretical physicist who doesn’t have a copy on
their shelf. It’s an impressive book but I’m pretty sure that, for many, the main selling
point is that it has these expressions for div, grad and curl in cylindrical and polar
coordinates printed on the inside cover. You can also find these results collated on the
last pages of these lecture notes. We’ll return to the Laplacian in different coordinate
systems in Section 5.2 where we’ll explore the solutions to equations like ∇2f = 0.
– 66 –


## Page 71

4 The Integral Theorems
The fundamental theorem of calculus states that integration is the inverse of the dif-
ferentiation, in the sense that
Z b
a
dx d f
dx = f(b) − f(a)
In this section, we describe a number of generalisations of this result to higher dimen-
sional integrals. Along the way, we will also gain some intuition for the meaning of the
various vector derivative operators.
4.1 The Divergence Theorem
The divergence theorem, also known as Gauss’ theorem, states that, for a smooth vector
field F(x) over R3,
Z
V
∇ · F dV =
Z
S
F · dS (4.1)
where V is a bounded region whose boundary ∂V = S is a piecewise smooth closed
surface. The integral on the right-hand side is taken with the normal n pointing
outward.
The Meaning of the Divergence
We’ll prove the divergence theorem shortly. But first, let’s make good on our promise
to build some intuition for the divergence. To this end, integrate ∇ ·F over some region
of volume V centred at the point x. If the region is small enough, then ∇ · F will be
roughly constant, and so
Z
V
∇ · F dV ≈ V ∇ · F(x)
and this becomes exact as the region shrinks to zero size. The divergence theorem then
provides a coordinate independent definition of the divergence
∇ · F = lim
V →0
1
V
Z
S
F · dS (4.2)
This is the result that we advertised in Section 3: the right way to think about the
divergence of a vector field is as the net flow into, or out of, a region. If ∇ · F > 0 at
some point x, then there is a net flow out of that point; if ∇ · F < 0 at some point x
then there is a net flow inwards.
– 67 –


## Page 72

We can illustrate this by looking at a couple of
the Maxwell equations (3.7). The magnetic field B is
solenoidal, obeying
∇ · B = 0
This means that the magnetic vector field can’t pile up
anywhere: at any given point in space, there is as much magnetic field coming in as
there is going out. This leads us to draw the magnetic field as continuous, never ending
streamlines. For example, the magnetic field lines for solenoid, a long coil of wire
carrying a current, is shown in the figure (taken from the website hyperphysics).
Meanwhile, electric field E obeys
∇ · E = ρ
ϵ0
where ρ(x) is the electric charge density. In any region of
space where there’s no electric charge, so ρ(x) = 0, the
electric field lines act just like the magnetic field and can’t
pile up anywhere. However, the presence of electric charge
changes this, and causes the field lines to pile up or disap-
pear. In other words, the electric charge acts as a source or
a sink for electric field lines. The electric field lines arising from two pointlike, positive
charges which act as sources, are shown in the figure.
Example
Before proving the theorem, we first give an example. Take
the volume V to be the solid hemispherical ball, defined as
x2 + y2 + z2 ≤ R2 and z ≥ 0. Then boundary of V then
has two pieces
∂V = S1 + S2
where S1 is the hemisphere and S2 the disc in the z = 0
plane. We’ll integrate the vector field
F = (0, 0, z + R)
The +R doesn’t contribute in the volume integral since we have ∇ · F = 1. Then
Z
V
∇ · F dV =
Z
V
dV = 2
3 πR3 (4.3)
– 68 –


## Page 73

which is the volume of the hemispherical ball. For the surface integral, we work with
S1 and S2 separately. On the hemisphere S1, the unit normal vector is n = 1
R(x, y, z)
and so
F · n = z(z + R)
R = R cos θ(cos θ + 1)
where we’ve used polar coordinates z = R cos θ. The integral is then
Z
S1
F · dS =
Z 2π
0
dϕ
Z π/2
0
dθ (R2 sin θ) R cos θ(cos θ + 1)
= 2πR3

−1
3 cos3 θ − 1
2 cos2 θ
π/2
0
= = 2πR3
1
3 + 1
2

= 5πR3
3 (4.4)
where the R2 sin θ factor in the first line is the Jacobian that we previously saw in (2.9).
Meanwhile, for the integral over the disc S2, we have the normal vector n = (0, 0, −1),
and so (remembering that the disc sits at z = 0),
F · n = −R ⇒
Z
S2
F · dS = (−R) × πR2
with πR2 the area of the disc. Adding these together, we have
Z
S1+S2
F · dS = 2
3 πR3
which reproduces the volume integral as promised.
It’s worth tracking what became of the + R term in the vector field F. Obviously
it didn’t contribute to the volume integral. For the surface integral over S1, it gave
the +1/2 term in the penultimate expression in (4.4). This was then cancelled by the
surface integral over S2, which only received a contribution from the + R term. We see
that this constant vector field when in the top surface, and out the bottom surface,
giving no contribution to the overall surface integral. This is how we get agreement
with the volume integral which, due to the derivative, is oblivious to any constant (or,
indeed, divergent free) components of F.
4.1.1 A Proof of the Divergence Theorem
We start by giving an informal sketch of the basic idea underlying the divergence
theorem. We’ll then proceed with a more rigorous proof.
– 69 –


## Page 74

To get some intuition for the divergence theorem,
take the volume V and divide it up into a bunch of
small cubes. A given cube Vx has one corner of the
cube sitting at x = ( x, y, z) and sides of lengths δx,
δy and δz.
For a small enough cube, we can think of F · n as
being approximately constant on any given side. To
start, we look at the flux of F through the two sides that lie in the ( y, z) plane is given
by
[Fx(x + δx, y, z) − Fx(x, y, z)] δy δz ≈ ∂Fx
∂x δx δy δz (4.5)
where the minus sign comes because the flux is calculated using the outward pointing
normal and the right-hand side comes from Taylor expanding Fx(x + δx, y, z). We get
similar expressions for the integrals over the sides that lie in the ( x, y) plane and in
the (x, z) plane. Summing over six sides, the total flux through the surface of this tiny
cube is then
Z
tiny 
F · dS =
 ∂Fx
∂x + ∂Fy
∂y + ∂Fz
∂z

δx δy δz = ∇ · F δx δy δz
But now we’ve tiled our volume V with a whole
bunch of these cubes, we can apply the formulae above
to each of them. On the right-hand side, we add up
the value of ∇ · F in each cube. This, of course, is
the volume integral that we’re after. On the left-hand
side, something more interesting happens. Now we get
a term like the left-hand side of (4.5) for each box, and
we sum over all boxes. But this means that all contributions from interior faces cancel
out because the outward normal of one box is in the opposite direction to the outward
normal from the other box. The upshot is that any interior contribution to the flux
vanishes, and we are left only with the contribution from the boundary S = ∂V . This
then gives us the claimed result
Z
S
F · dS =
Z
V
∇ · F dV
– 70 –


## Page 75

The derivation above is simple and intuitive, but it might
leave you a little nervous. The essence of the divergence the-
orem is to relate a bulk integral to a boundary integral. But
it’s not obvious that the boundary can be well approximated
by stacking cubes together. To give an analogy, if you try to
approximate a 45 ◦ line by a series of horizontal and vertical
lines, as shown on the right, then the total length of the steps is always going to be
√
2
larger than the length of the horizontal line, no matter how fine you make them. You
might worry that these kind of issues afflict the proof above. For that reason, we now
give a more careful derivation of the divergence theorem.
Before we proceed, first note that, suitably interpreted, the divergence theorem holds
in arbitrary dimension Rn, where a “surface” now means a codimension one subspace.
In particular, the divergence theorem holds in R2, where a surface is a curve. This
result, which is interesting in its own right, will serve as a warm-up exercise to proving
the general divergence theorem.
The 2d Divergence Theorem: Let F be a vector field in R2. Then
Z
D
∇ · F dA =
Z
C
F · n ds (4.6)
where D is a region in R2, bounded by the closed curve C and n is the outward normal
to C.
Proof of the 2d Divergence Theorem: For simplicity, we’ll assume that F =
F (x, y) ˆy. The proof that we’re about to give also works if F points solely in the ˆx
direction, but a general F is just a linear sum of the two.
We then have
Z
D
∇ · F dA =
Z
X
dx
Z y+(x)
y−(x)
dy ∂F
∂y
where, as the notation shows, we’ve chosen to do
the area integral by first integrating over y, and
then over x. We’ll assume, for now, that the region
D is convex, as shown in the figure, so that eachR
dy is over just a single interval with limitsy±(x).
These limits trace out an upper curve C+, shown
– 71 –


## Page 76

in red in the figure, and a lower curve C− shown in blue. We then have
Z
D
∇ · F dA =
Z
X
dx

F (x, y+(x)) − F (x, y−(x))

We’ve succeeded in converting the area integral into an
ordinary integral, but it’s not quite of the line integral form
that we need. The next part of the proof is to massage the
integral over
R
dx into a line integral over
R
ds. This is
easily achieved if we look at the zoomed-in figure to the
right. Along the upper curve C+, the normal n points
upwards and makes an angle cos θ = ˆy · n with the vertical. Moving a small distance
δs along the curve is equivalent to moving
δx = cos θ δs = ˆy · n δs along C+
Along the lower curve, C−, the normal n points downwards and so ˆy · n is negative.
We then have
δx = −ˆy · n δs along C−
The upshot is that we can write the area integral as
Z
D
∇ · F dA =
Z
X
ds

n · F(x, y+(x)) + n · F(x, y−(x))

=
Z
C+
F · n ds +
Z
C−
F · n ds
=
Z
C
F · n ds
with C = C+ + C− = ∂D the boundary of the region.
We’re left with one small loophole to close: if the
region D is not convex, then the range of the inte-
gral
R
dy may be over two or more disconnected in-
tervals, as shown in the figure. In this case, the bound-
ary curve decomposes into more pieces, but the basic
strategy still holds. □
– 72 –


## Page 77

Figure 13 . Performing the
R
dz integral for the proof of the 3d divergence theorem.
Proof of the 3d Divergence Theorem
The proof of the 3d (or, indeed, higher dimensional) divergence theorem follows using
the same strategy. If we focus on F = F (x, y, z) ˆz we have
Z
V
∇ · F dV =
Z
D
dA
Z z+(x,y)
z−(x,y)
dz ∂F
∂z
=
Z
D
dA

F (x, y, z+(x, y)) − F (x, y, z−(x, y))

where the limits of the integral z±(x, y) are the upper and lower surfaces of the volume
V . The area integral over D is an integral in the ( x, y) plane, while to prove Gauss’
theorem we need to convert this into a surface integral over S = ∂V . This step of the
argument is the same as before: at any given point, the different between dA = dxdy
and dS is the angle cos θ = n · ˆz (up to a sign). This then gives the promised result
(4.1). □
The Divergence Theorem for Scalar Fields
There is a straightforward extension of the divergence theorem for scalar fields ϕ:
Claim: For S = ∂V , we have
Z
V
∇ϕ dV =
Z
S
ϕ dS
Proof: Consider the divergence theorem (4.1) with F = ϕa where a is a constant
vector. We haveZ
V
∇ · (ϕa)dV =
Z
S
(ϕa) · dS ⇒ a ·
Z
V
∇ϕ dV −
Z
S
ϕ dS

= 0
– 73 –


## Page 78

This is true for any constant vector a, and so the expression in the brackets must itself
vanish. □
4.1.2 Carl Friedrich Gauss (1777-1855)
Gauss is regarded by many as the greatest mathematician of all time. He made seminal
contributions to number theory, algebra, geometry, and physics.
Gauss was born to working class parents in what is now Lower Saxony, Germany. In
1795 he went to study at the university of G¨ ottingen and remained there for the next
60 years.
There are remarkably few stories about Gauss that do not, at the end of the day,
boil down to the observation that he was just really good at maths. There is even a
website that has collected well over 100 retellings of how Gauss performed the sumP100
1 n when still a foetus. (You can find an interesting dissection of this story here.)
4.2 An Application: Conservation Laws
Of the many important applications of the divergence theorem, one stands out. In
many situations, we have the concept of a conservation law: some quantity that doesn’t
change over time. There are conservation laws in fundamental physics, including energy,
momentum, angular momentum and electric charge and several more that emerge when
we look to more sophisticated theories. There are also approximate conservation laws
at play when we model more complicated systems. For example, if you’re interested in
how the population distribution of some species evolves over time then it might well
serve you to ignore birth rates and traffic accidents and consider the total number of
animals to be fixed.
In all these cases, the quantity is conserved. But we can say something stronger
than that: it is conserved locally. For example, an electric charge sitting in the palm
of your hand can’t disappear and turn up on Jupiter. That would satisfy a “global”
conservation of charge, but that’s not the way the universe works. If the electric charge
disappears from your hand, then most likely it has fallen off and is now sitting on the
floor. Or, said more precisely, it must have moved to a nearby region of space.
The divergence theorem provides the technology to describe local conservation laws
of this type. First, we introduce the density ρ(x, t) of the conserved object. For
the purposes of this discussion, we will take this to be the density of electric charge,
although it could equally well be the density of any of the other conserved quantities
– 74 –


## Page 79

described above. The total electric charge in some region V is then given by the integral
Q =
Z
V
ρ dV
The conservation of charge is captured by the following statement: there exists a vector
field J(x, t) such that
∂ρ
∂t + ∇ · J = 0
This is known as the continuity equation and J is called the current density.
The continuity equation doesn’t tell us that the density ρ can’t change in time; that
would be overly prohibitive. But it does tell us that ρ must change only in a certain
way. This ensures that the change in the charge Q in a fixed region V is given by
dQ
dt =
Z
V
∂ρ
∂t dV = −
Z
V
∇ · J dV = −
Z
S
J · dS
where the second equality follows from the continuity
equation and the third from the divergence theorem
at some fixed time t. We learn that the charge inside
a region can only change if there is a current flowing
through the surface of that region. This is how the
conservation of charge is enforced locally.
The intuition behind this idea is straightforward. If you want to keep tabs on the
number of people in a nightclub, you don’t continuously count them. Instead you
measure the number of people entering and leaving through the door.
If the current is known to vanish outside some region, so J(x) = 0 for |x| > R ,
then the total charge contained inside that region must be unchanging. Often, in such
situations, we ask only that J(x, t) → 0 suitably quickly as |x| → ∞ , in which case the
total charge is unchanging
Qtotal =
Z
R3
ρ dV and dQtotal
dt = 0
In later courses, we’ll see many examples of the continuity equation. The example of
electric charge discussed above will be covered in the lectures on Electromagnetism,
where the flux of J through a surface S is
I =
Z
S
J · dS
and is what we usually call the electric current.
– 75 –


## Page 80

We will also see the same equation in the lectures on Quantum Mechanics whereρ(x)
has the interpretation of the probability density for a particle to be at some point x
and Q =
R
V ρ dV is the probability that the particle sits in some region V . Obviously,
in this example we must have Qtotal = 1 which is the statement that particle definitely
sits somewhere.
Finally, the continuity equation also plays an important role in Fluid Mechanics
where the mass of the fluid is conserved. In that case, ρ(x, t) is the density of the fluid
and the current is J = ρu where u(x, t) is the velocity field. The continuity equation
then reads
∂ρ
∂t + ∇ · (ρu) = 0
In this case the flux is the mass of fluid that passes through a surface S in time t.
In many circumstances, liquids can be modelled as incompressible, meaning that
ρ(x, t) is a constant in both space and time. In these circumstances, we have ˙ρ = ∇ρ = 0
and the continuity equation tells us that the velocity field is necessarily solenoidal:
∇ · u = 0 (4.7)
This makes sense: for a solenoidal vector field, the flow into any region must be accom-
panied by an equal outgoing flow, telling us that the fluid can’t pile up anywhere, as
expected for an incompressible fluid. The statement that fluids are incompressible is a
fairly good approximation until we come to think about sound, which arises because of
changes in the density which propagate as waves.
4.2.1 Conservation and Diffusion
There is a close connection between conserved quantities and the idea of diffusion. We’ll
illustrate this with the idea of energy conservation. The story takes a slightly different
form depending on the context, but here we’ll think of the energy contained in a hot
gas. First, since energy is conserved there is necessarily a corresponding continuity
equation
∂E
∂t + ∇ · J = 0 (4.8)
where E(x, t) is the energy density of the gas, and J is the heat current which tells us
how energy is transported from one region of space to another.
– 76 –


## Page 81

At this point we need to invoke a couple of physical principles. First, the energy
density in a gas is proportional to the temperature of the gas,
E(x, t) = c T(x, t) (4.9)
where cV is the specific heat capacity. Next comes a key step: in hot systems, where
everything is jiggling around randomly, the heat flow is due to temperature differences
between different parts of the system. The relation between the two is captured by the
equation
J = −κ∇T (4.10)
where κ is called the thermal conductivity and the minus sign ensures that heat flows
from hot to cold. This relation is known as Fick’s law . Neither (4.9) nor (4.10) are
fundamental equations of physics and both can be derived from first principles by
thinking about the motion of the underlying atoms. (This will be described in the
lectures on Statistical Physics and, for Fick’s law, the lectures on Kinetic Theory.)
Combining the continuity equation (4.8) with the definition of temperature (4.9) and
Fick’s law (4.10), we find the heat equation
∂T
∂t = D∇2T
where the diffusion constant is given by D = κ/c. This tells us how the temperature
of a system evolves. As we mentioned previously, the same heat equation describes the
diffusive motion of any conserved quantity.
4.2.2 Another Application: Predator-Prey Systems
We’ll see more applications of the divergence theorem in Section 5, mainly in the con-
text of the gravitational and electrostatic forces. However, the uses of the theorem are
many and varied and stretch far beyond applications to the laws of physics. Here we
give an example in the world of ecology which is modelled mathematically by differ-
ential equations. As we’ll see, the use of ∇ here is somewhat novel because we’re not
differentiating with respect to space but with respect to some more abstract variables.
First some background. Predator-prey systems describe the interaction between two
species. We will take our predators to be wolves. (Because they’re cool.) We will denote
the population of wolves at a given time t as w(t). The wolves prey upon something
cute and furry. We will denote the population of this cute, furry thing as c(t).
– 77 –


## Page 82

We want to write down a system of differential equations to describe the interaction
between wolves and cute furry things. The simplest equations were first written down
by Lotka and Volterra and (after some rescaling) take the form
dw
dt = w(−α + c)
dc
dt = c(β − w)
with α, β > 0 are some constants. There is a clear meaning to the different terms in
these equations. Without food, the wolves die out. That is what the −αw term in
the first equation is telling us which, if c = 0, will cause the wolf population to decay
exponentially quickly. In contrast, without wolves the cute furry things eat grass and
prosper. That’s what the + βc term in the second equation is telling us which, if w = 0,
ensures that the population of cute furry things grows exponentially. The second term
in each equation, ±wc, tells us what happens when the wolves and cute furry things
meet. The ± sign means that it’s good news for one, less good for the other.
The Lotka-Volterra equations are straightforward to
solve. There is a fixed point at c = α and w = β at which
the two populations are in equilibrium. Away from this, we
find periodic orbits as the two populations wax and wane.
To see this, we think of w = w(c) and write the pair of
equations as
dw
dc = w(c − α)
c(β − w)
This equation is separable and we have
Z β − w
w dw =
Z c − α
c dc ⇒ β log ω − ω + α log c − c = constant
These orbits are plotted in the (c, w) plane, also known as the phase plane, for different
constants in the figure.
So much for the Lotka-Volterra equations. Let’s now look at something more com-
plicated. Suppose that there is some intra-species competition: a little wolfy bickering
that sometimes gets out of hand, and some cute, furry in-fighting. We can model this
by adding extra terms to the original equations:
dw
dt = w(−α + c − µw)
dc
dt = c(β − w − νc) (4.11)
– 78 –


## Page 83

where the two new constants are also positive, µ, ν > 0. Both new terms come with
minus signs, which is appropriate because fighting is bad.
What do we do now? There is still a fixed point, now given by (1 + µν)w = β − να
and (1+ µν)c = α+µβ. But what happens away from this fixed point? Do the periodic
orbits that we saw earlier persist? Or does something different happen?
Sadly, we can’t just solve the differential equation like we did before because it’s no
longer separable. Instead, we’re going to need a more creative method to understand
what’s going on. This is where the divergence theorem comes in. We will use it to
show that, provided µ ̸= 0 or ν ̸= 0, the periodic orbits of the Lotka-Volterra equation
no longer exist.
We first change notation a little. We write the pair of predator-prey equations (4.11)
in vector form
da
dt = p with a =

w
c
!
and p =

w(−α + c − µw)
c(β − w − νc)
!
Any solution to these equations traces out a path a(t) in the animal phase plane. The
re-writing above makes it clear that p is the tangent to this path. The question that
we wish to answer is: does this path close? In other words, is there a periodic orbit?
It turns out that there are no periodic orbits. To show
this, we will suppose that periodic orbits exist and then
argue by contradiction. The normal n to the path a(t)
obeys n · p = 0, as shown in the figure. This means that if
we integrate any function b(w, c) around the periodic orbit
we have I
b(w, c) p · n dt = 0
By the 2d divergence theorem, this in turn means that the following integral over the
area enclosed by the periodic orbit must also vanish:
Z
D
∇ · [b(w, c)p] dA = 0
where, in this context, the gradient operator is ∇ = (∂/∂w, ∂/∂c ). At this juncture,
the trick is to find a cunning choice of function b(w, c). The one that works for us is
b = 1/wc. This is because we have
∇ · p
wc = − µ
c − ν
w
– 79 –


## Page 84

Both of these terms are strictly negative. (For this it is important to remember that
populations w and c are strictly positive!) But if ∇ · (p/wc) is always negative then
there’s no way to integrate it over a region and get zero. Something has gone wrong.
And what’s gone wrong was our original assumption of closed orbits. We learn that the
nice periodic solutions of the Lotka-Volterra equations are spoiled by any intra-species
competition. We’re left just with the fixed point which is now stable. All of which is
telling us that a little in-fighting may not be so bad after all. It keeps things stable.
The general version of the story above goes by the name of the Bendixson-Dulac
theorem and is a powerful tool in the study of dynamical systems.
4.3 Green’s Theorem in the Plane
Let P (x, y) and Q(x, y) be smooth functions on R2. Then
Z
A
 ∂Q
∂x − ∂P
∂y

dA =
I
C
P dx + Qdy (4.12)
where A is a bounded region in the plane and C = ∂A is a piecewise smooth, non-
intersecting closed curve which is traversed anti-clockwise.
Proof: Green’s theorem is equivalent to the 2d divergence theorem (4.6). Let F =
(Q, −P ) be a vector field in R2. We then have
Z
A
∇ · F dA =
Z
A
 ∂Q
∂x − ∂P
∂y

dA (4.13)
If x(s) = ( x(s), y(s)) is the parameterised curve C, then the tangent vector is t(s) =
(x′(s), y′(s)) and the normal vector n = (y′(s), −x′(s)) obeys n · t = 0.
You’ll need to do a little sketch to convince yourself
that, as shown on the right, n is the outward pointing nor-
mal provided that the arc length s increases in the anti-
clockwise direction. We then have
F · n = Q dy
ds + P dx
ds
and so the integral around C is
Z
C
F · n ds =
Z
C
P dx + Qdy (4.14)
The 2d divergence theorem is the statement that the left-hand sides of (4.13) and (4.14)
are equal; Green’s theorem in the plane is the statement that the right-hand sides are
equal. □
– 80 –


## Page 85

Applied to a rectangular region, Green’s theorem in the
plane reduces to the fundamental theorem of calculus. We
take the rectangular region to be 0 ≤ x ≤ a and 0 ≤ y ≤ b.
ThenZ
A
− ∂P
∂y dA = −
Z a
0
dx
Z b
0
dy ∂P
∂y
=
Z a
0
dx

− P (x, b) + P (x, 0)

=
Z
C
P dx
where only the horizontal segments contribute, and the minus signs are such that C is
traversed anti-clockwise. Meanwhile, we also have
Z
A
∂Q
∂x dA =
Z b
0
dy
Z a
0
dx ∂Q
∂x
=
Z b
0
dy

Q(a, y) − Q(0, y)

=
Z
C
Q dy
where, this time, only the vertical segments contribute.
Green’s theorem also holds if the area A has a number of disconnected components,
as shown in Figure 14. In this case, the integral should be done in an anti-clockwise
direction around the exterior boundary, and in a clockwise direction on any interior
boundary. The quickest way to see this is to do the integration around a continu-
ous boundary, as shown in the right-hand figure, with an infinitesimal gap. The two
contributions across the gap then cancel.
An Example
Let P = x2y and Q = xy2. We’ll take A to be the region bounded by the parabola
y2 = 4ax and the line x = a, both with −2a ≤ y ≤ 2a. Then Green’s theorem in the
plane tells us that Z
A
(y2 − x2) dA =
Z
C
x2y dx + xy2 dy
But this was a problem on the examples sheet, where you found that both give the
answer 104
105 a4.
4.3.1 George Green (1793-1841)
George Green was born in Nottingham, England, the son of a miller. If you were born
to a family of millers in the 18 th century, they didn’t send you to a careers officer at
school to see what you want to be when you grow up. You’d be lucky just to be sent to
school. Green got lucky. He attended school for an entire year before joining his father
baking and running the mill.
– 81 –


## Page 86

Figure 14 . Don’t mind the gap. Green’s theorem for an area with disconnected boundaries.
It is not known where Green learned his mathematics. The Nottingham subscription
library held some volumes, but not enough to provide Green with the background
that he clearly gained. Yet, from his mill, Green produced some of the most striking
mathematics of his time, including the development of potential theory and, most
importantly, the formalism of Green’s functions that you will meet in Section 5, as
well as in later courses. Much of this was contained in a self-published pamphlet, from
1828, entitled “An Essay on the Application of Mathematical Analysis to the Theories
of Electricity and Magnetism”. 51 copies were printed.
Green’s reputation spread and, at the age of 40, with no formal education, and
certainly no Latin or Greek, Green the miller came to Cambridge as a mathematics
undergraduate, clothes covered in flour and pretending it was chalk. (University motto:
nurturing imposter syndrome since 1209.) With hindsight, this may not have been the
best move. Green did well in his exams, but his published papers did not reach the
revolutionary heights of his work in the mill. He got a fellowship at Caius, developed
a taste for port, then gout, and died before he reached his 50th birthday.
There are parallels between Green’s story and that of Ramanujan who came to
Cambridge several decades later. To lose one self-taught genius might be regarded as
a misfortune. To lose two begins to look like carelessness.
4.4 Stokes’ Theorem
Stokes’ theorem is an extension of Green’s theorem, but where the surface is no longer
restricted to lie in a plane.
Let S be a smooth surface in R3 with boundary C = ∂S a piecewise smooth curve.
Stokes’ theorem states that, for any smooth vector field F(x), we have
Z
S
∇ × F · dS =
Z
C
F · dx
– 82 –


## Page 87

Figure 15 . The surface S and bounding curve C for Stokes’ theorem. The normal to the
surface is shown (at one point) by the red arrow. The theorem invites us to compute the flux
of a vector field F, shown by the green arrows, through the surface, and compare it to the
line integral around the boundary.
The orientations of S and C should be compatible. The former is determined by the
choice of normal vector n to S; the latter by the choice of tangent vector t to C. The
two are said to be compatible if t × n points out of S. In practice, this means that if
you orient the open surface so that n points towards you, then the orientation of C is
anti-clockwise. The general set-up is shown in Figure 15.
Note that there will typically be many surfaces S that share the same boundary
C. By Stokes’ theorem, the integral of ∇ × F over S must give the same answer for
all such surfaces. The theorem also holds if the boundary ∂S consists of a number of
disconnected components, again with their orientation determined by that of S.
We’ll give a proof of Stokes’ theorem shortly. But first we put it to some use.
The Meaning of the Curl
Stokes’ theorem gives us some new intuition for the curl of a vector field. If we integrate
∇ × F over a small enough surface such that ∇ × F is approximately constant, then
we will have
Z
S
∇ × F · dS ≈ A n · (∇ × F)
– 83 –


## Page 88

where A is the area and n the normal of the surface. Taking the limit in which this
area shrinks to zero, Stokes’ theorem then tell us that
n · (∇ × F) = lim
A→0
1
A
Z
C
F · dx (4.15)
In other words, at any given point, the value of ∇ ×F in the direction n tells us about
the circulation of F in the plane normal to n
A useful benchmark comes from considering the vector field u = ω × x, which
describes a rigid rotation with angular velocity ω. (See, for example, the lectures on
Dynamics and Relativity.) In that case, we have ∇ × u = 2 ω, so twice the angular
velocity.
Turning this on its head, we can get some in-
tuition for Stokes’ theorem itself. The curl of the
vector field tells us about the local circulation of
F. When you integrate this circulation over some
surface S, most of it cancels out because the cir-
culation going one way is always cancelled by a
neighbouring circulation going the other, as shown
in the figure. The only thing that’s left when you
integrate over the whole surface is the circulation around the edge.
A Corollary: Irrotational Implies Conservative
Before we prove Stokes’ theorem, we can use it to tie off a thread that we previously
left hanging. Recall that in Section 3.2, we proved that F = ∇ϕ =⇒ ∇ × F = 0,
but we didn’t then have the tools to prove the converse. Now we do. It follows
straightforwardly from Stokes’ theorem because an irrotational vector field, obeying
∇ × F = 0, necessarily has
I
C
F · dx = 0
around any closed curve C. But we showed in Section 1.2 that any such conservative
field can be written as F = ∇ϕ for some potential ϕ.
– 84 –


## Page 89

An Example
Let S be the cap of a sphere of radius R that is
covered by the angle 0 ≤ θ ≤ α, as shown in the
figure. We’ll take
F = (0, xz, 0) ⇒ ∇ × F = (−x, 0, z) (4.16)
This is the example that we discussed in Section
2.2.5, where we computed (see (2.11))
Z
S
∇ × F · dS = πR3 cos α sin2 α (4.17)
That leaves us with the line integral around the rim. This curve C is parameterised by
the angle ϕ and is given by
x(ϕ) = R(sin α cos ϕ, sin α sin ϕ, cos α) ⇒ dx = R(− sin α sin ϕ, sin α cos ϕ, 0) dϕ
We then have
Z
C
F · dx =
Z 2π
0
dϕ Rxz sin α cos ϕ = R3 sin2 α cos α
Z 2π
0
dϕ cos2 ϕ = πR3 sin2 α cos α
in agreement with the surface integral (4.17).
Another Example
As a second example, consider the conical surface S defined by z2 = x2 + y2 with
0 < a ≤ z ≤ b. This surface is parameterised, in cylindrical polar coordinates, by
x(ρ, ϕ) = (ρ cos ϕ, ρsin ϕ, ρ) (4.18)
with a ≤ ρ ≤ b and 0 ≤ ϕ < 2π. We can compute
two tangent vectors
∂x
∂ρ = (cos ϕ, sin ϕ, 1) and ∂x
∂ϕ = ρ(− sin ϕ, cos ϕ, 0)
and take their cross product to get the normal
n = ∂x
∂ρ × ∂x
∂ϕ = (−ρ cos ϕ, −ρ sin ϕ, ρ)
This points inwards, as shown in the figure. The
associated vector area element is
dS = (− cos ϕ, − sin ϕ, 1)ρdρ dϕ
– 85 –


## Page 90

We’ll integrate the same vector field (4.16) over this surface. We have
∇ × F · dS = (x cos ϕ + z)ρ dρ dϕ = ρ2(cos2 ϕ + 1)dρ dϕ
where we’ve substituted in the parametric expressions for x and z from (4.18). The
integral is then
Z
S
∇ × F · dS =
Z b
a
dρ
Z 2π
0
dϕ ρ 2(1 + cos2 ϕ) = π(b3 − a3) (4.19)
Now the surface has two boundaries, and we must integrate over both of them. We
write ∂S = Cb − Ca where Cb has radius b and Ca radius a. Note the minus sign,
reflecting the fact that the orientation of the two circles is opposite.
For a circle of radiusR, we havex(ϕ) = R(cos ϕ, sin ϕ, 1), and so dx = R(− sin ϕ, cos ϕ, 0) dϕ
and
Z
CR
F · dx =
Z 2π
0
dϕ R 3 cos2 ϕ = πR3
Remembering that the orientation of Ca in the opposite direction, we reproduce the
surface integral (4.19).
4.4.1 A Proof of Stokes’ Theorem
It’s clear that Stokes’ theorem is a version of Green’s theorem in the plane, but
viewed through 3d glasses. Indeed, it’s trivial to show that the latter follows from
the former. Consider the vector field F = ( P, Q, 0) in R3 and a surface S that
lies flat in the z = 0 plane. The normal to this surface is n = ˆz, and we have
Z
S
∇ × F · dS =
Z
S
 ∂Q
∂x − ∂P
∂y

dS
But Stokes’ theorem then tells us that this can also
be written as
Z
C
F · dx =
Z
C
P dx + Qdy
However, with a little more work we can also show that the converse is true. In other
words, we can lift Green’s theorem out of the plane to find Stokes’ theorem.
– 86 –


## Page 91

Consider a parameterised surface S defined by x(u, v) and denote the associated area
in the ( u, v) plane as A. We parameterise the boundary C = ∂S as x(u(t), v(t)) and
the corresponding boundary ∂A as (u(t), v(t)). The key idea is to use Green’s theorem
in the ( u, v) plane for the area A and then uplift this to prove Stokes theorem for the
surface S.
We start by looking at the integral around the boundary. It is
Z
C
F · dx =
Z
C
F ·
 ∂x
∂u du + ∂x
∂v dv

=
Z
∂A
Fu du + Fv dv
where Fu = F · ∂x/∂u and Fv = F · ∂x/∂v. Now we’re in a position to invoke Green’s
theorem, in the form
Z
∂A
Fu du + Fv dv =
Z
A
 ∂Fv
∂u − ∂Fu
∂v

dA
Now our task is clear. We should look at the partial derivatives on the right hand side.
We just need to be careful about what thing depends on what thing:
∂Fv
∂u = ∂
∂u

F · ∂x
∂v

= ∂
∂u

Fi
∂xi
∂v

=
 ∂Fi
∂xj
∂xj
∂u
 ∂xi
∂v + Fi
∂2xi
∂u∂v
Meanwhile, we have
∂Fu
∂v = ∂
∂v

F · ∂x
∂u

= ∂
∂v

Fi
∂xi
∂u

=
 ∂Fi
∂xj
∂xj
∂v
 ∂xi
∂u + Fi
∂2xi
∂v∂u
Subtracting the second expression from the first, the second derivative terms cancel,
leaving us with
∂Fv
∂u − ∂Fu
∂v = ∂xj
∂u
∂xi
∂v
 ∂Fi
∂xj − ∂Fj
∂xi

= (δjkδil − δjlδik) ∂xk
∂u
∂xl
∂v
∂Fi
∂xj
At this point we wield everyone’s favourite index notation identity
ϵjipϵpkl = δjkδil − δjlδik
We then have
∂Fv
∂u − ∂Fu
∂v = ϵjipϵpkl
∂xk
∂u
∂xl
∂v
∂Fi
∂xj = (∇ × F) ·
 ∂x
∂u × ∂x
∂v

– 87 –


## Page 92

Figure 16 . You may now turn the page. . . the original version of Stokes’ theorem, set as an
exam question.
Now we’re done. Following through the chain of identities above, we have
Z
C
F · dx =
Z
A
 ∂Fv
∂u − ∂Fu
∂v

dudv
=
Z
A
(∇ × F) ·
 ∂x
∂u × ∂x
∂v

dudv
=
Z
S
(∇ × F) · dS
This is Stokes’ theorem. □
4.4.2 George Gabriel Stokes (1819-1903)
Stokes was born in County Sligo, Ireland, but moved to
Cambridge shortly after his 19 th birthday and remained
there for the next 66 years, much of it as Lucasian professor.
He contributed widely to different area of mathematics and
physics, with the Navier-Stokes equation, describing fluid
flow, a particular highlight.
What we now call Stokes’ theorem was communicated
to Stokes by his friend William Thomson, better known by
his later name Lord Kelvin. The theorem first appeared
in print in 1854 as part of the Smith’s prize examination
competition, a second set of exams aimed at those students
who felt the Tripos wasn’t brutal enough.
– 88 –


## Page 93

If you’re in Cambridge and looking for a tranquil place away from the tourists to
sit, drink coffee, and ponder the wider universe, then you could do worse than the Mill
Road cemetery, large parts of which are overgrown, derelict, and beautiful. Stokes is
buried there, as is Cayley, although both gravestones were destroyed long ago. You can
find Stokes’ resting place nestled between the graves of his wife and daughter 1.
4.4.3 An Application: Magnetic Fields
Consider an infinitely long wire carrying a current. What is the magnetic field that is
produced? We can answer this by turning to the Maxwell equations (3.7). For time
independent situations, like this, one of the equations reads
∇ × B = µ0J (4.20)
where J is the current density and µ0 is a constant of nature that determines the
strength of the magnetic field and has some pretentious name that I can never remem-
ber. Another of the Maxwell equations reads ∇·B = 0 and in most situations we should
solve this in conjunction with (4.20) but here it will turn out, somewhat fortuitously,
that if we just find the obvious solution to (4.20) then it solves ∇ ·B = 0 automatically.
The equation (4.20) provides a simple opportunity to use Stokes’ theorem. We inte-
grate both sides over a surface S that cuts through the wire, as shown in the figure to
the right. We then have
Z
S
∇ × B · dS =
Z
C
B · dx = µ0
Z
S
J · dS = µ0I
where the integral of the current density gives I,
the total current through the wire. This equa-
tion tells us that there must be a circulation of
the magnetic field around the wire. In particular,
there must be a component of B that lies tangent
to any curve C that bounds a surface S.
Let’s suppose that the wire lies in the z-
direction. (Rotate your head or your screen if you
1A long, tree lined avenue runs north off Mill Road. At the end, turn right to enter the cemetery.
There is a gravel path immediately off to your left, which you should ignore, but take the first mud
track that runs parallel to it. Just after the gravestone bearing the name “Frederick Cooper” you will
find the Stokes’ family plot.
– 89 –


## Page 94

don’t like the z direction to be horizontal.) Then if S is a disc of radius ρ, then the
boundary C = ∂S is paramterised by the curve
x = ρ(cos ϕ, sin ϕ, 0) = ⇒ t = ∂x
∂ϕ = ρ(− sin ϕ, cos ϕ, 0)
We’ll make the obvious guess that B lies in the same direction as t and work with the
ansatz
B(x) = b(ρ)(− sin ϕ, cos ϕ, 0)
Then B · t = ρb(ρ). Provided that ρ is bigger than the radius of the wire, Maxwell’s
equation tells us that
µ0I =
Z
C
B · dx =
Z 2π
0
dϕ ρb(ρ) = ⇒ B(x) = µ0I
2πρ (− sin ϕ, cos ϕ, 0)
You can check that this answer also satisfies the other Maxwell equation ∇ · B = 0.
We learn that the magnetic field circulates around the wire, and drops off as 1 /ρ with
ρ the distance from the wire.
4.4.4 Changing Coordinates Revisited
Back in Section 3.3, we wrote down the expressions for the divergence and curl in a
general orthonormal curvilinear coordinate system. Now we can offer a proof using the
integral theorems above.
Claim: The divergence of a vector field F(u, v, w) in a general orthogonal, curvilinear
coordinate system is given by
∇ · F = 1
huhvhw
 ∂
∂u (hvhwFu) + ∂
∂v (huhwFv) + ∂
∂w (huhvFw)

(4.21)
Proof: We sketch a proof that works with the integral definition of the divergence
(4.2),
∇ · F = lim
V →0
1
V
Z
S
F · dS
We can take the volume V to consist of a small
cuboid at point ( u, v, w) with sides parallel to the ba-
sis vectors eu, ev and ew. The volume of the cube
is huhvhwδu δv δw. Meanwhile, the area of, say, the
– 90 –


## Page 95

upper face in the figure is roughly huhvδu δv. Since hu and hv may depend on the
coordinates, this could differ from the area of the lower face, albeit only by a small
amount δw. Then, assuming that F is roughly constant on each face, we have
Z
S
F · dS ≈
h
huhvFw(u, v, w + δw) − huhvFw(u, v, w)
i
δu δv + two more terms
≈ ∂
∂w (huhvFw)δu δv δw + two more terms
Dividing through by the volume then gives us the advertised expression for ∇ · F. □
Claim: The curl of a vector field F(u, v, w) in a general orthogonal, curvilinear coor-
dinate system is given by
∇ × F = 1
huhvhw

hueu hvev hwew
∂
∂u
∂
∂v
∂
∂w
huFu hvFv hwFw

= 1
hvhw
 ∂
∂v (hwFw) − ∂
∂w (hvFv)

eu + two similar terms
Proof: This time we use the integral definition of curl
(4.15)
n · (∇ × F) = lim
A→0
1
A
Z
C
F · dx
We’ll take a surface S with normal n = ew and in-
tegrate over a small region, bounded by one of the
squares in the figure on the right. The area of the
square huhvδu δv while the length of each side is huδu and hvδv. Assuming that the
square is small enough so that F is roughly constant along any given side, we have
Z
C
F · dx ≈ huFu(u, v)δu + hvFv(u + δu, v)δv − huFu(u, v + δv)δu − hvFv(u, v)δv
≈
h ∂
∂u (hvFv) − ∂
∂v (huFu)
i
δu δv
Dividing by the area, this gives
ew · ∇ × F = 1
huhv
h ∂
∂u (hvFv) − ∂
∂v (huFu)
i
which is one of the three promised terms in the expression for ∇ × F. □
– 91 –


## Page 96

5 The Poisson and Laplace Equations
Until now, our focus has been very much on understanding how to differentiate and
integrate functions of various types. But, with this under our belts, we can now take
the next step and explore various differential equations that are written in the language
of vector calculus. Our goal in this section is to find solutions to the Poisson equation
and the related Laplace equation. This we will do in Section 5.2. But first we will
explain why these equations underly two of the most important forces in the universe.
5.1 Gravity and Electrostatics
The first two fundamental forces to be discovered are also the simplest to describe
mathematically. Newton’s law of gravity states that two masses, m and M, separated
by a distance r will experience a force
F(r) = − GM m
r2 ˆr (5.1)
with G Newton’s constant, a fundamental constant of nature that determines the
strength of the gravitational force. Meanwhile, Coulomb’s law states that two elec-
tric charges, q and Q, separated by a distance r will experience a force
F(r) = Qq
4πϵ0r2ˆr (5.2)
with the electric constant ϵ0 a fundamental constant of nature that determines the
inverse strength of the electrostatic force. The extra factor 4 π reflects the fact that in
the century between the Newton and Coulomb people had figured out where factors of
4π should sit in equations.
Most likely it will not have escaped your attention that these two equations are
essentially the same. The only real difference is that overall minus sign which tells
us that two masses always attract while two like charges repel. The question that we
would like to ask is: why are the forces so similar?
Certainly it’s not true that there is a deep connection between gravity and the elec-
trostatic force, at least not one that we’ve uncovered to date. In particular, when
masses and charges start to move, both the forces described above are replaced by
something different and more complicated – general relativity in the case of gravity,
the full Maxwell equations (3.7) in the case of the Coulomb force – and the equations
of these theories are very different from each other. Yet, when we restrict to the simple,
static set-up, the forces take the same form.
– 92 –


## Page 97

The reason for this is twofold. First, both forces are described by fields. Second,
space has three dimensions. The purpose of this section is to explain this in more
detail. And, for this, we need the tools of vector calculus.
5.1.1 Gauss’ Law
Each of the force equations (5.1) and (5.2) contains some property that characterises
the force: mass for gravity and electric charge for the electrostatic force. For our
purposes, it will be useful to focus on one of the particles that carries mass m and
charge q. We call this a test particle, meaning that we’ll look at how this particle is
buffeted by various forces but won’t, in turn, consider its effect on any other particle.
Physically, this is appropriate if m ≪ M and q ≪ Q. Then it is useful to write the
equation in a way that separates the properties of the test particle from the other. The
force experienced by the test particle is
F(x) = mg(x) + qE(x)
where g(x) is the gravitational and E(x) is the electric field. Clearly Newton’s law is
telling us that a particle of mass M sets up a gravitational field
g(x) = − GM
r2 ˆr (5.3)
while a particle with electric charge Q sets up an electric field
E(x) = Q
4πϵ0r2ˆr (5.4)
So far this is just a trivial rewriting of the force laws. However, we will now reframe
these force laws in the language of vector calculus. Instead of postulating the 1/r2 force
laws (5.3) and (5.4), we will replace them by two properties of the fields from which
everything else follows. Here we specify the first property; the second will be explained
in Section 5.1.2.
The first property is that if you integrate the relevant field over a closed surface, then
it captures the amount of “stuff” inside this surface. For the gravitational field, this
stuff is mass
Z
S
g · dS = −4πGM (5.5)
while for the electric field it is charge
Z
S
E · dS = Q
ϵ0
(5.6)
– 93 –


## Page 98

Again, the difference in minus sign signals the important attractive/repulsive difference
between the two forces. In contrast, the factors of 4 πG and 1/ϵ0 are simply convention
for how we characterise the strength of the fields. These two equations are known as
Gauss’ law . Or, more precisely, “Gauss’ law in integrated form”. We’ll see the other
form below.
Examples
For concreteness, let’s focus on the gravitational field. We will take a sphere of radius
R and total mass M. We will require that the density of the sphere is spherically
symmetric, but not necessarily constant. The spherical symmetry of the problem then
ensures that the gravitational field itself is spherically symmetric, with g(x) = g(r)ˆr.
If we then integrate the gravitational field over any spherical surface S of radius r > R ,
we have
Z
S
g · dS =
Z
S
g(r)dS = 4πr2g(r)
where we recognise 4 πr2 as the area of the sphere. From
Gauss’ law (5.5) we then have
g(r) = − GM
r2 ˆr (5.7)
This reproduces Newton’s force law (5.1). Note, however,
that we’ve extended Newton’s law beyond the original re-
mit of point particles: the gravitational field (5.7) holds for
any spherically symmetric distribution of mass, provided that we’re outside this mass.
For example, it tells us that the gravitational field of the Earth (at least assuming
spherical symmetry) is indistinguishable from the gravitational field of a point-like par-
ticle with the same mass, sitting at the origin. This way of solving for the vector field
is known as the Gauss flux method .
Another rather cute consequence of this is that, at least for spherically symmetric
mass distributions, you don’t feel the mass outside you. According to Gauss’ law, the
gravitational field at any point is determined only by what lies inside a sphere of a
given radius. So if, for example, you were able to hollow out the centre of a planet
(unlikely, admittedly) then anyone living there would feel no gravitational force from
the mass that surrounds them.
– 94 –


## Page 99

For our second example, we turn to the electric field. Consider an infinite line of
charge, with charge per unit length σ. This situation is crying out for cylindrical polar
coordinates. Until now, we’ve always called the radial direction in cylindrical polar
coordinates ρ but, for reasons that will become clear shortly, for this example alone
we will instead call the radial direction r as shown in the figure. The symmetry of
the problem shows that the electric field is radial so takes the form E(r) = E(r)ˆr.
Integrating over cylinder S of radius r and length L we have
Z
S
E · dS = 2πrLE(r)
where there is no contribution from the end caps because
n ·E = 0 there, with n the normal vector. The total charge
inside this surface is Q = σL. From Gauss’ law (5.6), we
then have the electric field
E(r) = σ
2πϵ0rˆr
Note that the 1 /r behaviour arises because the symmetry
of the problem ensures that the electric field lies in a plane.
Said differently, the electric field from an infinite charged
line is the same as we would get from a point particle in a
flatland world of two dimensions.
More generally, if space wereRn, then the Gauss’ law equations (5.5) and (5.6) would
still be the correct description of the gravitational and electric fields. Repeating the
calculations above would then tell us that a point charge gives rise to an electric field
E(r) = 1
An−1ϵ0rn−1ˆr
where Anrn is the “surface area” of an n-dimensional sphere Sn of radius r. (For what
it’s worth, the prefactor is An−1 = 2 πn/2/Γ(n/2) where Γ( x) is the gamma function
which coincides with the factorial function Γ( x) = (x − 1)! when x is integer.) For the
rest of this section, we’ll keep our feet firmly in R3.
Gauss’ Law Again
There’s a useful way to rewrite the Gauss’ law equations (5.5) and (5.6). For the
gravitational field, we introduce the density, or mass per unit volume, ρ(x). Invoking
the divergence theorem then, for any volume V bounded by S, we have
Z
V
∇ · g dV =
Z
S
g · dS = −4πGM = −4πG
Z
V
ρ(x) dV
– 95 –


## Page 100

But, rearranging, we have
Z
V

∇ · g + 4πGρ(x)

dV = 0
for any volume V . This can only hold if the integrand itself vanishes, so we must have
∇ · g = −4πGρ(x) (5.8)
This is also known asGauss’ law for the gravitational field, now in differential form. The
equivalence with the earlier integrated form (5.5) follows, as above, from the divergence
theorem.
We can apply the same manipulations to the electric field. This time we introduce
the charge density ρe(x). We then get Gauss’ law in the form
∇ · E = ρe(x)
ϵ0
(5.9)
This is the first of the Maxwell equations (3.7). (In our earlier expression, we denoted
the charge density as ρ(x). Here we’ve added the subscript ρe to distinguish it from
mass density.) The manipulations that we’ve described above show that Gauss’ law is
a grown-up version of the Coulomb force law (5.2).
5.1.2 Potentials
In our examples above, we used symmetry arguments to figure out the direction in
which the gravitational and electric fields are pointing. But in many situations we
don’t have that luxury. In that case, we need to invoke the second important property
of these vector fields: they are both conservative.
Recall that, by now, we have a number of different ways to talk about conservative
vector fields. Such fields are necessarily irrotational ∇ ×g = ∇ ×E = 0. Furthermore,
their integral vanishes when integrated around any closed curve C,
I
C
g · dx =
I
C
E · dx = 0
You can check that both of these hold for the examples, such as the 1 /r2 field, that we
discussed above (as long as the path C avoids the singular point at the origin).
– 96 –


## Page 101

Here the key property of a conservative vector field is that it can be written in terms
of an underlying scalar field,
g = −∇Φ and E = −∇ϕ (5.10)
where Φ(x) is the gravitational potential and ϕ(x) the electrostatic potential. Note
the additional minus signs in these definitions. We saw in the discussion around (1.18)
that the existence of such potentials ensures that test particles experiencing these forces
have a conserved energy:
energy = 1
2 m ˙x2 + mΦ(x) + qϕ(x)
Combining the differential form of the Gauss’ law (5.8) and (5.9) with the existence of
the potentials (5.10), we find that the gravitational and electric fields are determined,
in general, by solutions to the following equations
∇2Φ = 4πGρ(x) and ∇2ϕ = − ρe(x)
ϵ0
Equations of this type are known as the Poisson equation. In the special case where
the “source” ρ(x) on the right-hand side vanishes, this reduces to the Laplace equation,
for example
∇2Φ = 0
These two equations are commonplace in mathematics and physics. Here we have
derived them in the context of gravity and electrostatics, but their applications spread
much further.
To give just one further example, in Fluid Mechanics the motion of the fluid is
described by a velocity field u(x). If the flow is irrotational, then ∇ × u = 0 and the
velocity can be described by a potential function u = ∇ϕ. If, in addition, the fluid
is incompressible then ∇ · u = 0 and we once again find ourselves solving the Laplace
equation ∇2ϕ = 0.
5.2 The Poisson and Laplace Equations
In the rest of this section we will develop some methods to solve the Poisson equation.
We change notation and call the potentialψ(x) (to avoid confusion with the polar angle
ϕ). We are then looking for solutions to
∇2ψ(x) = −ρ(x)
The goal is to solve for ψ(x) given a “source” ρ(x). As we will see, the domain in which
ψ(x) lives, together with associated boundary conditions, also plays an important role
in determining ψ(x).
– 97 –


## Page 102

The Laplace equation ∇2ψ = 0 is linear. This means that if ψ1(x) is a solution
and ψ2(x) is a solution, then so too is ψ1(x) + ψ2(x). Any solution to the Laplace
equation acts as a complementary solution to the Poisson equation. This should then
be accompanied by a particular solution for a given source ρ(x) on the right-hand side.
5.2.1 Isotropic Solutions
Both the Laplace and Poisson equations are partial differential equation. Life is gen-
erally much easier if we’re asked to solve ordinary differential equations rather than
partial differential equations. For the Poisson equation, this is what we get if we have
some kind of symmetry, typically one aligned to some polar coordinates.
For example, if we have spherical symmetry then we can look for solutions of the
form ψ(x) = ψ(r). Using the form of the Laplacian (3.15), Laplace equation becomes
∇2ψ = 0 ⇒ d2ψ
dr2 + 2
r
dψ
dr = 1
r2
d
dr

r2 dψ
dr

= 0
⇒ ψ(r) = A
r + B (5.11)
for some constants A and B. Clearly the A/r solution diverges as r → 0 so we should
be cautious in claiming that this solves the Laplace equation at r = 0. (We will shortly
see that it doesn’t, but it does solve a related Poisson equation.) Note that the solution
A/r is relevant in gravity or in electrostatics, where ψ(r) has the interpretation as the
potential for a point charge.
Meanwhile, in cylindrical polar coordinates we will also denote the radial direction as
r to avoid confusion with the source ρ in the Poisson equation. The Laplace equation
becomes
∇2ψ = 0 ⇒ d2ψ
dr2 + 1
r
dψ
dr = 1
r
d
dr

r dψ
dr

= 0
⇒ ψ(r) = A log r + B (5.12)
This again diverges at r = 0, this time corresponding to the entire z axis.
Note that if we ignore the z direction, as we have above, then cylindrical polar coor-
dinates are the same thing as 2d polar coordinates, and the log form is the rotationally
invariant solution to the Laplace equation in R2. In general, in Rn, the non-constant
solution to the Laplace equation is 1/rn−2. The low dimensions of R2 and R are special
because the solution grows asymptotically as r → ∞ , while for Rn with n ≥ 3, the
rotationally invariant solution to the Laplace equation decays to a constant asymptot-
ically.
– 98 –


## Page 103

If ψ(r) is a solution to the Laplace equation, then so too is any derivative of ψ(r).
For example, if we take the spherically symmetric solution ψ(r) = 1 /r, then we can
construct a new solution
ψdipole(x) = d · ∇
1
r

= −d · x
r3
for any constant vector d and, again, with r ̸= 0. This kind of solution in important in
electrostatics where it arises as the large distance solution for a dipole, two equal and
opposite charges at a fixed distance apart.
Discontinuities and Boundary Conditions
In many situations, we must specify some further data when solving the Poisson equa-
tions. Typically this is some kind of boundary condition and, in some circumstances,
a requirement of continuity and smoothness on the solution.
This can be illustrated with a simple example. Suppose that we are looking for a
spherically symmetric solution to:
∇2ψ =
(
−ρ0 r ≤ R
0 r > R
with ρ0 constant. We will further ask that ψ(r = 0) is non-singular, that ψ(r) → 0
as r → ∞, and that ψ(x) and ψ′(x) are continuous. We will now see that all of these
conditions give us a unique solution.
First look inside r ≤ R. As we mentioned above, a solution to the Poisson equation
can be found by adding a complementary solution and a particular solution. Since
we’re looking for a spherically symmetric particular solution, we can restrict our ansatz
to ψ(r) = rp for some p. It’s simple to check that ∇2rp = p(p + 1)rp−2. This then gives
us the general solution
ψ(r) = A
r + B − 1
6 ρ0r2 r ≤ R
But now we can start killing some terms by invoking the boundary conditions. In
particular, the requirement that ψ(r) is non-singular at r = 0 tells us that we must
have A = 0. Meanwhile, outside r > R the most general solution is
ψ(r) = C
r + D
– 99 –


## Page 104

Figure 17 . The plot of Φ = −4πGψ on the left, with the radius R = 1 the cross over point.
This is more apparent in the gravitational field g = −Φ′ shown on the right.
Now we must have D = 0 if ψ(r) → 0 as r → ∞. To finish, we must patch these two
solutions at r = R, invoking continuity
ψ(r = R) = B − 1
6 ρ0R2 = C
R
and smoothness
ψ′(r = R) = −1
3 ρ0R = − C
R2
These determine our last two unknown constants, B and C. Putting this together, we
have a unique solution
ψ(r) =
(
1
6 ρ0(3R2 − r2) r ≤ R
1
3 ρ0R3/r r > R
This example has application for the gravitational potential Φ = −4πGψ of a planet
of radius R and density ρ0. The plot of Φ is shown on the left of Figure 17; the plot of
the gravitational field g = −dΦ/dr is on the right, where we see a linear increase inside
the planet, before we get to the more familiar 1 /r2 fall-off.
5.2.2 Some General Results
So far our solutions to the Poisson equation take place in R3. (Or, more precisely,
R3 − {0, 0} for the 1 /r solution (5.11) and R3 − R for the log r solution (5.12).) In
general, we may want to solve the Poisson or Laplace equations ∇2ψ = −ρ in some
bounded region V . In that case, we must specify boundary conditions on ∂V .
There are two common boundary conditions:
• Dirichlet condition: We fix ψ(x) = f(x) for some specific f(x) on ∂V .
– 100 –


## Page 105

• Neumann condition: We fix n · ∇ψ(x) = g(x) for some specific g(x) on ∂V , where
n is the outwardly pointing normal of ∂V .
The Neumann boundary condition is sometimes specified using the slightly peculiar
notation ∂ψ/∂n := n · ∇ψ. Or even, sometimes, ∂ψ/∂n . We have the following state-
ment of uniqueness:
Claim: Consider the Poisson equation on a bounded region V , with either Dirich-
let or Neumann boundary conditions specified on each boundary ∂V . If a solution
exists, then it is unique. (In the case of Neumann boundary conditions everywhere, the
solution is only unique up to a constant.)
Proof: Let ψ1(x) and ψ2(x) both satisfy the Poisson equation with the specified
boundary conditions. Then ψ(x) = ψ1 − ψ2 obeys ∇2ψ = 0 and either ψ = 0 or
n · ∇ψ = 0 on ∂V . Then consider
Z
V
∇ · (ψ∇ψ) dV =
Z
V

∇ψ · ∇ψ + ψ∇2ψ

dV =
Z
V
|∇ψ|2dV
But by the divergence theorem, we have
Z
V
∇ · (ψ∇ψ) dV =
Z
∂V
ψ∇ψ · dS =
Z
∂V
ψ(n · ∇ψ) dS = 0
where either Dirichlet or Neumann boundary conditions set the boundary term to zero.
Because |∇ψ|2 ≥ 0, the integral can only vanish is ∇ψ = 0 everywhere in V , so ψ must
be constant. If Dirichlet boundary conditions are imposed anywhere, then that constant
must be zero. □
This result means that if we can find any solution – say an isotropic solution, or
perhaps a separable solution of the form ψ(x) = Φ( r)Y (θ) – then this must be the
unique solution. By considering the limit of large spheres, it is also possible to extend
the proof to solutions on R3, with the boundary condition ψ(x) → 0 suitably quickly
as r → ∞.
Note, however, that this doesn’t necessarily tell us that a solution exists. For ex-
ample, suppose that we wish to solve the Poisson equation ∇2ψ = ρ(x) with a fixed
Neumann boundary condition n · ∇ψ = g(x) on ∂V . Then there can only be a solution
provided that there is a particular relationship between ρ and g,
Z
V
∇2ψ dV =
Z
∂V
∇ψ · dS ⇐ ⇒
Z
V
ρ dV =
Z
S
g dS
In other situations, there may well be other requirements.
– 101 –


## Page 106

If the region V has several boundaries, it’s quite possible to specify a different type
of boundary condition on each, and the uniqueness statement still holds. This kind of
problem arises in electromagnetism where you solve for the electric field in the presence
of a bunch of “conductors” (for now, conductors just means a chunk of metal). The
electric field vanishes inside a conductor because, if it didn’t, then the electric charges
inside would move around until they created a counterbalancing field. So any attempt
to solve for the electric field outside the conductors must take this into account by
imposing certain boundary conditions on the surface of the conductor. It turns out
that both Dirichlet and Neumann boundary conditions are important here. If the
conductor is “grounded”, meaning that it is attached to some huge reservoir of charge
like the Earth, then it sits at some fixed potential, typically ψ = 0. This is a Dirichlet
boundary condition. In contrast, if the conductor is isolated and carries some non-
vanishing charge then it will act as a source of electric field, but this field is always
emitted perpendicular to the boundary. This, then, specifies n · E = −n · ∇ψ, giving
Neumann boundary conditions. You can learn more about this in the lectures on
Electromagnetism.
Green’s Identities
The proof of the uniqueness theorem used a trick known as Green’s (first) identity,
namely
Z
V
ϕ∇2ψ dV = −
Z
V
∇ϕ · ∇ψ dV +
Z
S
ϕ∇ψ · dS
This is essentially a 3d version of integration by parts and it follows simply by applying
the divergence theorem to ϕ∇ψ. We used it in the above proof with ϕ = ψ, but the
more general form given above is sometimes useful, as is a related formula that follows
simply by anti-symmetrisation,
Z
V

ϕ∇2ψ − ψ∇2ϕ

dV =
Z
S
(ϕ∇ψ − ψ∇ϕ) · dS
This is known as Green’s second identity.
Harmonic Functions
Solutions to the Laplace equation
∇2ψ = 0
arise in many places in mathematics and physics. These solutions are so special that
they get their own name: they are called harmonic functions. Here are two properties
– 102 –


## Page 107

of these functions
Claim: Suppose that ψ is harmonic in a region V that includes the solid sphere
with boundary SR : |x − a| = R. Then the value of ψ at a, the centre of the sphere, is
given by ψ(a) = ¯ψ(R) where
¯ψ(R) = 1
4πR2
Z
SR
ψ(x) dS
is the average of ψ over SR. This is known as the mean value property.
Proof: In spherical polar coordinates centred ona, the area element isdS = r2 sin θdθ dϕ,
so
¯ψ(r) = 1
4π
Z
dϕ
Z
dθ sin θ ψ(r, θ, ϕ)
and
d ¯ψ(R)
dr = 1
4π
Z
dϕ
Z
dθ sin θ ∂ψ(R)
∂r = 1
4πR2
Z
SR
∂ψ(R)
∂r dS
= 1
4πR2
Z
SR
∇ψ · dS =
Z
Ball
∇2ψ dV = 0
But clearly ¯ψ(R) → ψ(a) as R → 0 so we must have ¯ψ(R) = ψ(a) for all R. □
Claim: A harmonic function can have neither a maximum nor minimum in the in-
terior of a region V . Any maximum of minimum must lie on the boundary ∂V .
Proof: If ψ has a local maximum ata in V then there exists an ϵ such that ψ(x) < ψ(a)
for all |x −a| < ϵ. But, we know that ¯ψ(R) = ψ(a) and this contradicts the assumption
for any 0 < R < ϵ . □
This is consistent with our standard analysis of maxima and minima. Usually we
would compute the eigenvalues λi of the Hessian ∂2ψ/∂x i∂xj. For a harmonic function
∇2ψ = ∂2ψ/∂x i∂xi = 0. Since the trace of the Hessian vanishes, we must have eigen-
values of opposite sign since P
i λi = 0. Hence, any stationary point must be a saddle.
Note that this standard analysis is inconclusive when λi = 0, but the argument using
the mean value property closes this loophole.
– 103 –


## Page 108

5.2.3 Integral Solutions
There is a particularly nice way to write down an expression for the general solution
to the Poisson equation in R3, with
∇2ψ = −ρ(x) (
 )
at least for a localised source ρ(x) that drops off suitably fast, so ρ(x) → 0 as r → ∞.
To this end, let’s look back to what is, perhaps, our simplest “solution”,
ψ(x) = λ
4πr (5.13)
for some constant λ. The question we want to ask is: what equation does this actually
solve?! We’ve seen in (5.11) that it solves the Laplace equation ∇2ψ = 0 when r ̸= 0.
But clearly something’s going on at r = 0 because the function diverges there. In the
language of physics, we would say that there is a point particle sitting atr = 0, carrying
some mass or charge, giving rise to this potential. What is the correct mathematical
way of capturing this?
To see that there must be something going on at r = 0, let’s replay the kind of Gauss
flux games that we met in Section 5.1. We integrate ∇2ψ, with ψ given by (5.13), over
a volume V which we take to be a spherical region of radius R, to find
Z
V
∇2ψ dV =
Z
S
∇ψ · dS = −λ
Comparing to (
 ), we see that the function (5.13) must solve the Poisson equation
with a source and this source must obey
Z
V
ρ(x) dV = λ
This makes sense physically, since
R
ρdV is the total mass, or total charge, which does
indeed determine the overall scalingλ of the potential. But what mathematical function
obeys ρ(x) = 0 for all x ̸= 0 yet, when integrated over all space, gives a non-vanishing
constant λ?
The answer is that ρ(x) must be proportional to the 3d Dirac delta function ,
ρ(x) = λ δ3(x)
– 104 –


## Page 109

The Dirac delta function should be thought of as an infinitely narrow spike, located at
the origin. It has the properties
δ3(x) = 0 for x ̸= 0
and, when integrated against any function f(x) over any volume V that includes the
origin, it gives
Z
V
f(x) δ3(x) dV = f(x = 0)
The superscript in δ3(x) is there to remind us that the delta function should be in-
tegrated over a 3-dimensional volume before it yields something finite. In particular,
when integrated against a constant function, we get a measure of the height of the
spike,
Z
V
δ3(x) dV = 1
The Dirac delta function is an example of a generalised function, also known as a
distribution. And it is exactly what we need to source the solution ψ ∼ 1/r. We learn
that the function (5.13) is not a solution to the Laplace equation, but rather a solution
to the Poisson equation with a delta function source
∇2ψ = −λ δ3(x) ⇒ ψ(x) = λ
4πr (5.14)
With this important idea in hand, we can now do something quite spectacular: we can
use it to write down an expression for a solution to the general Poisson equation.
Claim: The Poisson equation (
 ) has the integral solution
ψ(x) = 1
4π
Z
V ′
ρ(x′)
|x − x′| dV ′ (5.15)
where the integral is over a region V ′ parameterised by x′.
Proof: First, some simple intuition behind this formula. A point particle at x′ gives
rise to a potential of the form ψ(x) = ρ(x′)/4π|x −x′|, which is just our solution (5.14),
translated from the origin to point x′. The integral solution (5.15) then just takes ad-
vantage of the linear nature of the Poisson equation and sums a whole bunch of these
solutions.
– 105 –


## Page 110

The technology of the delta function allows us to make this precise. We can evaluate
∇2ψ = 1
4π
Z
V ′
ρ(x′) ∇2
 1
|x − x′|

dV ′
where you have to remember that ∇2 differentiates x and cares nothing for x′. We then
have the result
∇2 1
|x − x′| = −4πδ 3(x − x′)
which is just a repeat of (5.14), but with the location of the source translated from the
origin to the new point x′. Using this, we can continue our proof
∇2ψ = −
Z
V ′
ρ(x′) δ3(x − x′) dV ′ = −ρ(x)
which is what we wanted to show. □
The technique of first solving an equation with a delta function source and sub-
sequently integrating to find the general solution is known as the Green’s function
approach. It is a powerful method to solve differential equations and we will meet it
again in many further courses.
– 106 –


## Page 111

6 Tensors
A famously annoying definition of a tensor is:
A tensor is something whose components transform like a tensor
This becomes even more annoying when you appreciate that this is, in fact, one of
the better definitions of a tensor. The purpose of this section is to explain why this
definition is not as dumb as it sounds and to give some insight into what it means to
be a tensor.
Very roughly speaking, tensors are generalisations of objects like vectors and matri-
ces. In index notation, a vector has a single index while a matrix has two indices. A
tensor is an object with any number of indices, something like Tij...k.
However, this simplistic description hides the most important property of a tensor.
Vectors, matrices and, more generally, tensors are more than just a list of numbers.
Instead, those numbers should be thought of as a useful way of characterising the un-
derlying object and, because of this, inherit some properties of that underlying object.
As we will see, the key property is how the list of numbers transform under a change
of basis.
We will start by explaining this in more detail, firstly with vectors and then building
up to the definition of a tensor. Initially we will keep the discussion restricted to some
(admittedly rather dry) mathematical formalism. Then, in Section 6.2 we will describe
some physical examples.
6.1 What it Takes to Make a Tensor
Not any list of n numbers constitutes a vector in Rn. Or, said more precisely, not any
list of n numbers constitutes the components of a vector in Rn. For example, if you
write down the heights of the first three people you met this morning, that doesn’t make
a vector in R3. Instead, a vector comes with certain responsibilities. In particular, the
components describe an underlying object which should be independent of the choice
of basis. As we now explain, that means that the components should transform in the
right way under rotations.
We consider a point x ∈ Rn. If we wish to attach some coordinates to this point, we
first need to introduce a set of basis vectors {ei} with i = 1, . . . , n. We will take these
to be orthonormal, meaning that ei · ej = δij. Any vector can then be expressed as
x = xiei (6.1)
– 107 –


## Page 112

Usually we conflate the components xi = (x1, . . . , xn) with the “vector”. But, for our
purposes, we should remember that these are just a useful way of representing the more
abstract object x. In particular, we’re entirely at liberty to take a different set of basis
vectors,
e′
i = Rijej
If we ask that e′
i are also orthonormal, so e′
i · e′
j = δij, then we have
e′
i · e′
j = RikRjl ek · el = RikRjk = δij
or, in matrix notation,
RRT = 1
Matrices of this kind are said to be orthogonal. We write R ∈ O(n). Taking the
determinant, we have det R = ±1. Those matrices with det R = +1 correspond to
rotations and are said to be special orthogonal. We write R ∈ SO(n). In R3, a
rotation R ∈ SO(3) takes a right-handed orthonormal basis into another right-handed
orthonormal basis. Those matrices with det R = −1 correspond to a rotation together
with a reflection and take a right-handed basis to a left-handed basis.
Under a change of basis, the vector x itself doesn’t change. But its components do.
We have
x = xiei = x′
ie′
i = x′
iRijej
So the components transform under the same rotation matrix R,
xj = Rijx′
i ⇒ x′
i = Rijxj (6.2)
A tensor T is a generalisation of these ideas to an object with more indices. Just as
the vector x has an identity independent of any choice of basis, so too does the tensor
T . But when measured with respect to a chosen basis {ei}, a tensor of rank p has
components Ti1...ip. When we change the basis using (6.1), the tensor transforms as
T ′
i1...ip = Ri1j1 . . . RipjpTj1...jp (6.3)
This is known as the tensor transformation rule . A tensor of rank p is sometimes
referred to simply as a p-tensor.
– 108 –


## Page 113

The simplest examples of tensors are very familiar. A tensor of rank 0 is just a
number, or scalar, T . Here there’s no requirement because a number doesn’t change if
you do a rotation: T ′ = T . So any single number can be said to be a tensor, although
it isn’t a particularly helpful designation.
A tensor of rank 1 is a vector. Here, however, it’s important that the components of
the vector transform as T ′
j = RijTj. If they don’t transform in this way, then you don’t
have a tensor on your hands. You just have a bunch of numbers.
A tensor of rank 2 is a matrix that transforms as T ′
ij = RikRjlTkl. Again, the trans-
formation property is key. Just because you have an array of numbers Aij, arranged
in an n × n grid, doesn’t mean that you have a 2-tensor. You have to check the trans-
formation property holds. Otherwise, as with a vector, the array of numbers isn’t a
tensor; it’s just a bunch of numbers.
What’s a Tensor and What’s Not?
It’s worth elaborating on the definition of a tensor. For example, suppose that someone
hands you a matrix, say
Tij =


3 8 0
5 −4 3
1 1 3


and asks you: “is this a tensor?”. It’s natural to answer yes. After all, it’s written as
Tij which is the name we’ve given to a tensor. And it looks for all the world like a
matrix. So is it a tensor? The answer is: we don’t know. We haven’t been given enough
information2. As we’ve stressed several times, a tensor isn’t just a bunch of numbers
arranged in some pattern. This sometimes goes by the name of an array of numbers.
Instead, we only know that a given array of numbers is a tensor if it transforms as
(6.3). That means that we need to firstly know what basis the array of numbers above
has been measured in. And then we need to know what the array looks like when
measured in other bases. Only then do we have enough information to say whether
this is a tensor or not. It’s a tensor only if transforms as (6.3): this transformation law
is the definition of a tensor.
2When I gave these lectures on 6th March 2023, I used the example of

7
0

which, at least on
that day, most certainly wasn’t a tensor. It was a football score. A glorious, wonderful, humiliating,
shameful football score.
– 109 –


## Page 114

Here’s another example. In a given basis, the position of a point is given by xi. We
write this as the components of a vector
xi =


x
y
z


This is a tensor. Indeed, our starting point is that the components of this simple vector
transforms in the tensorial way (6.2). This is just the statement that the components
of this vector transform in the familiar way under rotation.
Suppose that you now square each of these elements and decide to write them as a
column vector. We’ll give it a fancy name Λ i, complete with that hanging i index,
Λi =


x2
y2
z2


That i index makes this look for all the world like it’s a tensor. But it’s not. We know
that after a rotation, xi → x′
i = Rijxj. This means that if we do a rotation and then
measure the components of the array Λ ′
i we get
Λ′
i =


(R11x + R12y + R13z)2
(R21x + R22y + R33z)2
(R31x + R32y + R33z)2


But that’s most definitely not how a tensor transforms! It’s not the rule (6.3) that we
wanted. The upshot is that Λ i is not a tensor and it was a little bit naughty to write
it as Λ i because it suggests that it has some property that it doesn’t.
Relatedly, this explains something that you may have wondered about in school.
Suppose that you’re given two vectors. You know that you can take an inner product
to get a scalar, or you can take the cross-product to get another vector. But what stops
you from doing something much simpler, just multiplying the component of one vector
with the corresponding component of another vector to get a third vector. It seems
like such an obvious thing to do. But it’s a bad thing to do, precisely because the thing
you end up with is not a tensor. It does not transform in the way (6.2), which is how
components of a vector should transform.
– 110 –


## Page 115

There is a similar story for matrices. If you have two matrices, then there’s a ridicu-
lously complicated way to multiply them, multiplying rows with columns. Why don’t
we just do something much simpler and multiply entries together component by compo-
nent? You’ve probably guessed the answer by now. If we started with genuine matrices,
meaning that they transform (6.3), then the object that you get if you do proper matrix
multiplication will also transform as (6.3), but the simpler, stupid way to multiplying
will not.
Why are we making such a big deal about this? What is so special about things
that transform nicely as (6.3) under rotations? Well, there are several answers to this,
depending on taste. At the most basic level, if you’re a physicist, then you might
genuinely want to know how something looks in different, rotated frames of reference.
Moreover, once you realise that there’s a preferred way for things to transform —
the tensor way (6.3) – this brings some extra power to the calculations, a little like
dimensional analysis. Suppose that you have an equation of the form “left-hand side”
= “right-hand side”. If the thing on the left is a tensor then the thing on the right
better also be a tensor. And sometimes there’s not many tensors available, which limits
your options for what the thing on the right can actually be. We’ll see an example of
this in Section 6.1.3 when we’ll use tensors to make some scary looking integrals a little
more palatable.
The discussion above is very much from a physics perspective. But what about a
pure maths perspective? This gives a more formal, but arguably cleaner, definition of
a tensor. We’ll explain this imminently in Section 6.1.1.
We’ll meet a number of tensors as we proceed. But there is a one that is special:
this is the rank 2 tensor δij or, equivalently, the unit matrix. Importantly, it has the
same 0 and 1 entries in any basis because, under the transformation (6.3), it becomes
δ′
ij = RikRjlδkl = δij
We will devote Section 6.1.3 to “invariant tensors” which, like δij, take the same form
in any basis.
6.1.1 Tensors as Maps
There is something a little strange about the definition of a tensor given above. We
first pick a set of coordinates, and the transformation law (6.3) then requires that the
tensor transforms nicely so that, ultimately, nothing depends on these coordinates.
But, if that’s the case, surely there should be a definition of a tensor that doesn’t rely
on coordinates at all!
– 111 –


## Page 116

There is. A tensor T of rank p is a multi-linear map that takes p vectors, a, b, . . . ,c
and spits out a number in R,
T (a, b, . . . ,c) = Ti1i2...ipai1bi2 . . . cip (6.4)
Here “multi-linear” means that T is linear in each of the entries a, b, . . . ,c individually.
By evaluating T on a all possible vectors a, b, . . . ,c, we get the components Ti1i2...ip.
The transformation rule (6.3) is simply the statement that the map T is independent
of the choice of basis, and we can equally well write
T (a, b, . . . ,c) = T ′
i1i2...ipa′
i1b′
i2 . . . c′
ip
= (Ri1j1Ri2j2 . . . RipjpTj1j2...jp)(Ri1k1ak1)(Ri2k2bk2) . . .(Ripkpckp)
= Tj1j2...jpaj1bj2 . . . cjp
which follows because RT R = 1 or, in components, RijRik = δjk. The key is that this
formula takes the same form in any basis.
Tensors as Maps Between Vectors
Rather than thinking of a tensor as a map from many vectors toR, you can equivalently
think of it as a map from some lower-rank tensor to another. For example, in (6.4),
if you don’t fill in the first entry, then a rank p tensor can equally well be viewed as
taking (p − 1) vectors and spitting out a single vector
ai = Ti j1...jp−1bj1 . . . cjp−1
This is the way that tensors typically arise in physics or applied mathematics, where
the most common example is simply a rank 2 tensor, defined as a map from one vector
to another
u = Tv ⇒ ui = Tijvj
Until now, we’ve simply called T a matrix but for the equation u = Tv to make sense,
T must transform as a tensor (6.3). This is inherited from the transformation rules of
the vectors, u′
i = Rijuj and v′
i = Rijvj, giving
u′
i = T ′
ijv′
j with T ′
ij = RikRjlTkl
Written as a matrix equation, this is T ′ = RT RT .
– 112 –


## Page 117

6.1.2 Tensor Operations
Given a bunch of tensors, there are some manipulations that leave you with another
tensor. Here we describe these operations.
• We can add and subtract tensors of the same rank, so if S and T are both tensors
of rank p then so too is S + T . We can also multiply a tensor by a constant α
and it remains a tensor.
• If S is a tensor of rank p and T a tensor of rank q, then the tensor product S ⊗ T
is a tensor of rank p + q, defined by
(S ⊗ T )i1...ipj1...jq = Si1...ipTj1...jq
You can check that the components of (S⊗T ) do indeed satisfy the transformation
rule (6.3). In particular, if we have p different vectors a, b, . . . , c then we can
construct a tensor
T = a ⊗ b ⊗ . . . ⊗ c with Ti1...ip = ai1bi2 . . . cip
• Given a tensor T of rank p, we can construct a new tensor S of rank ( p − 2) by
contracting on two indices using δij,
Sk1...kp−2 = δijTijk1...kp−2
For a rank 2 tensor, the contraction is what we call the trace, Tr T = Tii. It’s a
valid tensor operation because the end result is a scalar that does not transform
under rotations
T ′
ii = RijRikTjk = δjkTjk = Tjj
The same derivation shows that higher rank tensors can also be contracted, with
the additional indices unaffected by the contraction.
Combining a contraction with a tensor product gives a way to contract two
different tensors together. For example, given a p-tensor P and q-tensor Q, we
can form a p + q − 2 tensor by contracting, say, the first index on each to get
P ik1...kp−1Qi l1...lq−1. This may sound abstract, but it’s very much something you’ve
seen before: given a pair of 1-tensors a and b, also known as vectors, we can
combine them to get a 0-tensor, also known as a number
a · b = aibi
This, of course, is just the inner-product. It is a useful operation precisely because
the 0-tensor on the right-hand side is, like all 0-tensors, independent of the choice
of basis that we choose to express the vectors.
– 113 –


## Page 118

The Quotient Rule
In practice, it’s not hard to recognise a tensor when you see one. In any setting, they’re
usually just objects with a bunch of i and j indices, each of which clearly transforms as
a vector. If in doubt, you can just check explicitly how the thing transforms. (There
are cases where this check is needed. In later courses, you’ll meet an object called the
Levi-Civita connection Γ i
jk which looks for all the world like a tensor but turns out, on
closer inspection, to be something more subtle.)
There is a more formal way to say this. Let Ti1...ip+q be a bunch of numbers that you
think might comprise a tensor of rank p + q in some coordinate basis. If Ti1...ip+q are
indeed the components of a tensor then you can feed it a rank q tensor uj1...jq and it
will spit back a rank p tensor
vi1...ip = Tii...ipj1...jq uj1...jq (6.5)
There is a converse to this statement. If for every tensor uj1...jq, the output vi1...ip
defined in (6.5) is a tensor, then Tii...ipj1...jq are the components of a tensor. This is
called the quotient rule.
It is straightforward, if a little fiddly, to prove the quotient rule. It’s sufficient to
restrict attention to tensors u formed from the tensor product of vectors uj1...jq =
cj1 . . . djq. Then, by assumption, vi1...ip = Tii...ipj1...jq uj1...jq is a tensor. If we then con-
tract with p further vectors a, . . . ,b then vi1...ipai1 . . . bip = Ti1...ipj1...jq ai1 . . . bipcj1 . . . djq
is necessarily a scalar. This is then enough to ensure the correct transformation rule
(6.3) for the components Ti1...ipj1...jq.
Symmetry and Anti-Symmetry
The symmetrisation properties of tensors are worthy of comment. A tensor that obeys
Tijp...q = ±Tjip...q
is said to be symmetric (for +) or anti-symmetric (for −) in the indices i and j. If a
tensor is (anti)-symmetric in one coordinate system then it is (anti)-symmetric in any
coordinate system
T ′
ijp...q = RikRjlRpr . . . RqsTklr...s = ±RikRjlRpr . . . RqsTlkr...s = ±T ′
jip...q
A tensor that is (anti)-symmetric in all pairs of indices is said to be totally (anti)-
symmetric. Note that for tensors in Rn, there are no totally anti-symmetric tensors of
rank p > n because at least one of the indices must take the same value and so the
tensor necessarily vanishes. A totally anti-symmetric tensor of rank p in Rn has
n
p

independent components.
– 114 –


## Page 119

Let’s now restrict our attention to R3. A tensor of rank 2 is our new fancy name
for a 3 × 3 matrix Tij. In general, it has 9 independent components. We can always
decompose it into the symmetric and anti-symmetric pieces
Sij = 1
2(Tij + Tji) and Aij = 1
2(Tij − Tji)
which have 6 and 3 independent components respectively. Our discussion above shows
that S and A are each, themselves, tensors. In fact, the symmetric piece can be
decomposed further,
Sij = Pij + Q
3 δij
where Q = Sii is the trace of S and carries a single degree of freedom, while Pij is the
traceless part of S and carries 5. The importance of this decomposition is that A, P
and Q are individually tensors. In contrast, if you were to take, say, the upper-left-hand
component of the original matrix Tij then that doesn’t form a tensor.
In R3, we can also rewrite an anti-symmetric matrix in terms of a vector,
Aij = ϵijkBk ⇐ ⇒ Bk = 1
2 ϵijkAij
The upshot is that in any 3 × 3 matrix can be decomposed as
Tij = Pij + ϵijkBk + 1
3 δijQ (6.6)
where Pii = 0.
6.1.3 Invariant Tensors
There are two important invariant tensors in Rn.
• We’ve met the first already: it is the rank 2 tensor δij. As we noted previously,
this is invariant because
δ′
ij = RikRjlδkl = δij
Note that δij is invariant under any R ∈ O(n).
• The rank n totally anti-symmetric tensor ϵi1...in. This is defined by ϵ12...n = +1.
If you swap any two indices you get a minus sign. In particular, if any two indices
are repeated, the epsilon symbol vanishes. This is invariant because
ϵ′
i1...in = Ri1j1 . . . Rinjnϵj1...jn = detR ϵi1...in = ϵi1...in
– 115 –


## Page 120

Note that the epsilon symbol is only invariant under R ∈ SO(n) but it is not
invariant under R ∈ O(n) with det R = −1. It picks up a minus sign under
reflections. The invariance of ϵijk in R3 is the reason why the cross-product
(a × b)i = ϵijkajbk is itself a vector. Or, said differently, why the triple product
a · (b × c) = ϵijkaibjck is independent of the choice of basis.
In general, a tensor is said to be invariant under a given rotation R if
T ′
i1...in = Ri1j1 . . . RinjnTj1...jn = Ti1...in
A tensor that is invariant under all rotations R is said to be isotropic. Obviously all
tensors of rank 0 are isotropic. What about higher rank tensors?
Claim: The only non-zero isotropic tensors in R3 of rank p = 1, 2 or 3 are Tij = αδij
and Tijk = βϵijk with α and β constant. In particular, there are no isotropic tensors of
rank 1 (essentially because a vector always points in a preferred direction).
Proof: The idea is simply to look at how tensors transform under a bunch of spe-
cific rotations by π or π/2 about certain axes.
For example, consider a tensor of rank 1, so that
T ′
i = RijTj with Rij =


−1 0 0
0 −1 0
0 0 +1

 (6.7)
Requiring T ′
i = Ti gives T1 = T2 = 0. Clearly a similar argument, using a different R,
also gives T3 = 0.
For a tensor of rank 2, consider the transformation
T ′
ij = ˜Rik ˜RjlTkl with ˜Rij =


0 1 0
−1 0 0
0 0 +1

 (6.8)
which is a rotation by π/2 about the z-axis. The rotation gives T ′
13 = T23 and T ′
23 =
−T13 so if T ′
ij = Tij, we must have T13 = T23 = 0. Meanwhile T ′
11 = T22. Similar
arguments tell us that all off-diagonal elements must vanish and all diagonal elements
must be equal: T11 = T22 = T33 = α for some α. Hence Tij = αδij.
– 116 –


## Page 121

Finally, for a rank 3 tensor we have
T ′
ijk = RilRjpRkqTlpq
If we pick R given in (6.7), then we find T ′
133 = −T133 and T ′
111 = −T111. Similar
arguments show that an isotropic tensor must have Tijk = 0 unless i, j and k are all
distinct. Meanwhile, if we pick R = ˜R given in (6.8), then we get T ′
123 = −T213. We
end up with the result we wanted: Tijk is isotropic if and only if Tijk = βϵijk for some
constant β. □
Although we won’t prove it here, all other isotropic tensors can be formed from δij
and ϵijk. For example, the only isotropic 4-tensor in R3 is
Tijkl = αδijδkl + βδikδjl + γδilδjk
with α, β and γ constants. You could try to cook up something involving ϵijk but it
doesn’t give anything new. In particular, ϵijkϵilp = δjlδkp − δjpδkl.
There is also an analogous result in Rn: all isotropic tensors can be constructed from
the symmetric 2-tensor δij and the totally anti-symmetric n-tensor ϵi1...in.
Invariant Integrals
It is sometimes possible to use invariance properties to immediately write down the
index structure of an integral, without doing the hard work of evaluating everything
term by term. Suppose that we have some integral of the form
Tij...k =
Z
V
f(r)xixj . . . xk dV
with r = |x|. Then under a rotation, we have
T ′
ij...k = RipRjq . . . RkrTpq...r =
Z
V
f(r)x′
ix′
j . . . x′
k dV
with, as usual, x′
i = Rijxj. But if we now change the integration variables to x′,
both r = |x| = |x′| and dV = dV ′ are invariant. (The latter because the Jacobian is
detR = 1). If the domain of integration is also rotationally invariant, so V = V ′, then
the final result must itself be an invariant tensor, T ′
ij...k = Tij...k.
– 117 –


## Page 122

Here are some examples. First, suppose that we have a 3d integral over the interior
of a sphere of radius R, given by
Ti =
Z
V
ρ(r)xi dV (6.9)
This must be equal to some invariant 1-tensor (i.e. a vector), but there are no such
objects. In other words, we can say immediately that Ti = 0. You can check this
straightforwardly by doing the integral in, say, spherical polar coordinates.
Things change if we look at an integral with two hanging indices,
Tij =
Z
V
ρ(r)xixj dV (6.10)
(In Section 6.2, we will find integrals of this form arising when we compute the inertia
tensor of a sphere.) By the argument above Tij must be an isotropic tensor and hence
proportional to δij,
Tij =
Z
V
ρ(r)xixj dV = αδij
for some α. If we take the trace, we get
Z
V
ρ(r)r2 dV = 3α
Hence,
Tij = 1
3 δij
Z
V
ρ(r)r2 dV = 4π
3 δij
Z R
0
dr ρ (r)r4 (6.11)
For example, if ρ(r) = ρ0 is constant, then Tij = 4
15 πρ0R5δij.
Here’s a slightly more complicated example (taken from the calculation of Stokes
flow around a sphere in Fluid Mechanics). Consider the surface integral over a sphere
of radius R,
˜Tk = aj
Z
S2
dSi
xixjxk
r5
This time we have a vector a in the game, so it must be the case that ˜Tk = βak for
some constant β. One way to compute β is to strip off the vector a and instead look at
˜Tjk =
Z
S2
dSi
xixjxk
r5 = βδjk
– 118 –


## Page 123

which now should be proportional to the invariant tensor δjk as shown, with the same
coefficient β since ˜Tk = Tjkaj = βak. At this point, we again take the trace over the j
and k indices to get
Z
S2
dSi
xixjxj
r5 = 3β
But this integral is given by
Z
S2
dSi
xi
r3 =
Z
S2
dS · n
r2 = 4π
and so we get β = 4π/3.
6.1.4 Tensor Fields
A tensor field over R3 is the assignment of a tensor Ti...k(x) to every point x ∈ R3.
This is the generalisation of a vector field
F : R3 → R3
to a map of the kind
T : R3 → Rm
with m the number of components of the tensor. So, for example, a map that assigns
a symmetric, traceless rank 2 tensor Pij(x) to every point has m = 5.
The tensor field Ti...k(x) is sometimes denoted as Ti...k(xl) which is supposed to show
that the field depends on all coordinates x1, . . . , x3. It’s not great notation because the
indices as subscripts are supposed to take some definite values, while the index l in the
argument is supposed to denote the whole set of indices. It’s especially bad notation
when combined with the summation convention and we won’t adopt it here.
There is one very famous example of a tensor field. Einstein’s theory of general rela-
tivity is described by a rank 2 tensor at every point in space. This is called the metric.
The dynamics of this rank 2 tensor field describe gravity. (I’ve brushed something
rather important under the rug here. Einstein’s theory is a rank 2 tensor in spacetime,
not just in space. Which means that the rank 2 tensor is a 4 × 4 matrix, rather than a
3 × 3 matrix.)
Before we move on, it’s worth pausing to mention a slightly subtle point. Not all
maps R3 → R3 qualify as “vector fields”. The point x in the codomain R3 is a vector
and so its components transform in the appropriate way under rotation. To be a vector
field, the components of the map must transform under the same rotation. Similar
comments hold for a tensor field.
– 119 –


## Page 124

To illustrate this, the electric field E(x) is an example of a vector field. If you rotate
in space, and so change x, then the direction E also changes: the rotation acts on both
the argument x and the function itself E.
In contrast, there are maps R3 → R3 where, although the domain and codomain have
the same dimension, vectors in them transform under different rotations. For example,
in particle physics there exists an object called a quark field which, for our (admittedly,
slightly dumbed down) purposes, can be thought of as a map R3 → R3. This is a
quantum field whose ripples are the particles that we call quarks, but these details can
be safely ignored for the next couple of years of your life. We will write this field as
qa(x) where the a = 1 , 2, 3 label is the “colour” of the quark. If we rotate in space,
then x changes but the colour of the quark does not. There is then an independent
rotation that acts on the codomain and rotates the colour, but leaves the point in space
unchanged. Because the rotations that act on the domain and codomain are unrelated,
the quark field is usually not referred to as a vector field.
Taking Derivatives
Given a tensor field, we can always construct higher rank tensors by taking derivatives.
In fact, we’ve already seen a prominent example of this earlier in these lectures. There,
we started with a scalar field ϕ(x) and differentiated to get the gradient ∇ϕ. This
means that we start with a rank 0 tensor and differentiate to get a rank 1 tensor.
Strictly speaking, we didn’t previously prove that ∇ϕ is a vector field. But it’s
straightforward to do so. As we’ve seen above, we need to show that it transforms
correctly under rotations. Any vector v can be decomposed in two different ways,
v = viei = v′ ie′
i
where {ei} and {e′
i} are two orthonormal bases, each obeying ei · ej = e′
i · e′
j = δij, and
vi and v′ i are the two different coordinates for v. If we expand x in this way
x = xiei = x′
ie′
i =⇒ xi = (ei · e′
j)x′
j =⇒ ∂xi
∂x′
j
= ei · e′
j
Here ei ·e′
j is the rotation matrix that takes us from one basis to the other. Meanwhile,
we can always expand one set of basis vectors in terms of the other,
ei = (ei · e′
j)e′
j = ∂xi
∂x′ j e′
j
This tells us that we could equally as well write the gradient as
∇ϕ = ∂ϕ
∂xiei = ∂ϕ
∂xi
∂xi
∂x′ j e′
j = ∂ϕ
∂x′ j e′
j
– 120 –


## Page 125

This is the expected result: if you work in a different primed basis, then you have the
same definition of ∇ϕ, but just with primes on both e′
i and ∂/∂x ′ i. This means that
the components ∂iϕ transform correctly under a rotation, so ∇ϕ is indeed a vector.
We can extend the result above to any, suitably smooth, tensor field T (x) of rank
p. We can differentiate this any number of times to get a new tensor field of rank, say,
p + q,
Xi1...iqj1...jp = ∂
∂xi1
. . . ∂
∂xiq
Tj1...jp(x) (6.12)
To verify that this is indeed a tensor, we need to check how it changes under a rotation.
In a new basis, we have x′
i = Rijxj (where Rij = e′
i · ej in the notation above) and so
∂x′
i
∂xj
= Rij =⇒ ∂
∂x′
i
= ∂xj
∂x′
i
∂
∂xj
= Rij
∂
∂xj
which is the result we need for X in (6.12) to qualify as a tensor field.
We can implement any of the tensorial manipulations that we met previously for
tensor fields. For example, if we start with a vector field F(x), we can form a rank 2
tensor field
Tij(x) = ∂Fi
∂xj
But we saw in (6.6) that any rank 2 tensor field can be decomposed into various pieces.
There is an anti-symmetric piece
Aij(x) = ϵijkBk(x) with Bk = 1
2 ϵijk
∂Fi
∂xj
= −1
2 (∇ × F)k
and a trace piece
Q = ∂Fi
∂xi
= ∇ · F
and, finally, a symmetric, traceless piece
Pij(x) = 1
2
 ∂Fi
∂xj
+ ∂Fj
∂xi

− 1
3 ∇ · F
Obviously, the first two of these are familiar tensors (in this case a scalar and vector)
from earlier sections.
– 121 –


## Page 126

6.2 Physical Examples
Our discussion above was rooted firmly in mathematics. There are many places in
physics where tensors appear. Here we give a handful of examples.
6.2.1 Electric Fields in Matter
Apply an electric field E to a lump of stuff. A number of things can happen.
If the lump of stuff is an insulator then the material will become polarised. This
means that the positive electric charge will be pushed in one direction, the negative
in another until the lump of stuff acts like a dipole. (This is described in some detail
in Section 7 of the lectures on Electromagnetism.) One might think that the resulting
polarisation vector P points in the same direction as the electric field E, but that’s too
simplistic. For many lumps of stuff, the underlying crystal structure allows the electric
charges to shift more freely in some directions than others. The upshot is that the
relation between polarisation P and applied electric field E is given by
P = αE
where α is a matrix known as the polarisation tensor. In a given basis, it has compo-
nents αij.
There is a similar story if the lump of stuff is a conductor. This time an applied
electric field gives rise to a current density J. Again, the current is not necessarily
parallel to the electric field. The relationship between them is now
J = σE
This is known as Ohm’s law. In general σ is a 3 × 3 matrix known as the conductivity
tensor; in a given basis, it has components σij.
What can we say about σ when the material is isotropic, meaning that it looks the
same in all directions? In this case, no direction is any different from any other. With
no preferred direction, the conductivity tensor must be proportional to an invariant
tensor, so that it looks the same in all coordinate systems. What are our options?
For 3d materials, the only option is σij = σδij, which ensures that the current
does indeed run parallel to the electric field. In this case σ is just referred to as the
conductivity.
– 122 –


## Page 127

However, suppose that we’re dealing with a thin wafer of material in which both the
current and electric field are restricted to lie in a plane. This changes the story because
now we’re dealing with vectors in R2 rather than R3 and R2 is special because there
are two invariant 2-tensors in this dimension: δij and ϵij. This means that the most
general conductivity tensor for an isotropic 2d material takes the form
σij = σxxδij + σxyϵij =

σxx σxy
−σxy σxx
!
Here σxx is called the longitudinal conductivity while σxy is called the Hall conductivity.
If σxy ̸= 0 then an electric field in the x-direction induces a current in the y-direction.
As an aside, it turn out that the seemingly mundane question of understanding
σxy in real materials is closely tied to some of the most interesting breakthroughs in
mathematics in recent decades! This is the subject of the Quantum Hall Effect.
6.2.2 The Inertia Tensor
Another simple example of a tensor arises in Newtonian mechanics. A rigid body ro-
tating about the origin can be modelled by some number of masses ma at positions xa,
all moving with velocity ˙xa = ω × xa. Here ω is known as the angular velocity. The
angular velocity ω is related to the angular momentum L by
L = Iω (6.13)
with I the inertia tensor. The angular momentum does not necessarily lie parallel to
the angular velocity and, correspondingly, I is in general a matrix, rather than a single
number. In fact, we can easily derive an expression for the inertia tensor. The angular
momentum is
L =
X
a
maxa × ˙xa =
X
a
maxa × (ω × xa) =
X
a
ma

|xa|2ω − (xa · ω)xa

In components, Li = Iijωj, where
Iij =
X
a
ma

|xa|2δij − (xa)i(xa)j

For a continuous object with density ρ(x), we can replace the sum with a volume
integral
Iij =
Z
V
ρ(x)

|x|2δij − xixj

dV (6.14)
So, for example, I33 =
R
ρ(x2
1 + x2
2) dV and I12 = −
R
ρx1x2 dV .
– 123 –


## Page 128

An Example: A Sphere
For a ball of radius R and density ρ(r), the inertia tensor is
Iij =
Z
V
ρ(r)(r2δij − xixj) dV
The second of these terms is the integral (6.10) that we simplified in Section 6.1.3 using
isotropy arguments. Using (6.11), we have
Iij = 2
3 δij
Z
V
ρ(r)r2 dV = 8π
3 δij
Z R
0
dr ρ (r)r4
For example, if ρ(r) = ρ0 is constant, then Iij = 8
15 πρ0R5δij = 2
5 M R2δij where M is
the mass of the sphere.
Another Example: A Cylinder
The sphere is rather special because the inertia tensor is proportional to δij. That’s
not the case more generally. Consider, for example, a solid 3d cylinder of radius a and
height 2L, with uniform density ρ. The mass is M = 2πa2Lρ. We align the cylinder
with the z-axis and work in cylindrical polar coordinates x = r cos ϕ and y = r sin ϕ.
The components of the inertia tensor are then
I33 =
Z
V
ρ(x2 + y2) dV = ρ
Z 2π
0
dϕ
Z a
0
dr
Z +L
−L
dz r r 2 = ρπLa4
I11 =
Z
V
ρ(y2 + z2) dV = ρ
Z 2π
0
dϕ
Z a
0
dr
Z +L
−L
dz r (r2 sin2 ϕ + z2) = ρπa2L
 a2
2 + 2L2
3

By symmetry, I22 = I11. For the off-diagonal elements, we have
I13 = −
Z
V
ρx1x3 dV = −ρ
Z 2π
0
dϕ
Z a
0
dr
Z L
−L
dz r 2z cos ϕ = 0
where the integral vanishes due to the ϕ integration. Similarly, I12 = I13 = 0. We find
that the inertia tensor for the cylinder is
I = diag

M
 a2
4 + L2
3

, M
 a2
4 + L2
3

, 1
2 M a2

(6.15)
Note that the inertia tensor is diagonal in our chosen coordinates.
– 124 –


## Page 129

The Eigenvectors of the Inertia Tensor
The inertia tensor I defined in (6.14) has a special property: it is symmetric
Iij = Iji
Any symmetric matrix I can always be diagonalised by an appropriate rotation. This
means that there exists an R ∈ SO(n) such that
I ′ = RIR T = diag(I1, I2, I3)
Another way of saying this is that any symmetric rank 2 tensor has a basis of orthonor-
mal eigenvectors {ei}, with Ii the corresponding eigenvalues.
In the case of the inertia tensor, the eigenvectorse1, e2 and e3 are called the principal
axes of the solid. It means that any object, no matter how complicated, has its own
preferred set of orthonormal axes embedded within it. If the object has some symmetry,
then the principal axes will always be aligned with this symmetry. This, for example,
was the case for the cylinder that we computed above where aligning the cylinder with
the z-axis automatically gave us a diagonal inertia tensor (6.15).
In general, it will be less obvious where the principal
axes lie. For example, the figure on the right shows the
asteroid Toutatis, which is notable for its lumpy shape.
The principal axes are shown embedded in the asteroid.
From (6.13), the angular momentum L is aligned
with the angular velocity ω only if a body spins about
one of its principal axes. It turns out that, in this
case, nice things happen and the body spins smoothly.
However, if L and ω are misaligned, the body exhibits more complicated tumbling,
wobbling motion as it spins. You can learn all about this in the lectures on Classical
Dynamics. (For what it’s worth, Toutatis does not spin about a principal axes.)
6.2.3 Higher Rank Tensors
You might reasonably complain that, after all that work defining tensors, the examples
that we’ve given here are nothing more exotic than matrices, mapping one vector to
another. And you would be right. However, as we get to more sophisticated theories of
physics, tensors of higher rank do make an appearance. Here we don’t give full details,
but just say a few words to give you a flavour of things to come.
– 125 –


## Page 130

Perhaps the simplest example arises in the theory of elastic materials. These mate-
rials can be subjected to strain, which describes the displacement of the material at
each point, and stress, which describes the forces acting on the material at each point.
But each of these is itself a 2-tensor (strictly a tensor field). The strain tensor eij is
a symmetric tensor that describes the way the displacement in the xi direction varies
in the xj. The stress tensor σij describes the component of the force Fi across a plane
normal to xj. These two tensors are related by
σij = Cijkl ekl
This is the grown up version of Hooke’s law. In general an elastic material is charac-
terised by the elasticity tensor, also known as the stiffness tensor, Cijkl.
Higher rank tensors also appear prominently in more advanced descriptions of ge-
ometry. In higher dimensions, the simple Gaussian curvature that we met in Section 2
isn’t enough to capture all the interesting ways in which spaces can curve in different
directions. Instead, it is replaced by a 4-tensor Rijkl known as the Riemann curvature.
In the context of physics, this 4-tensor describes the bending of space and time and is
needed for the grown-up version of Newton’s law of gravity.
6.3 A Unification of Integration Theorems
In this final section, we turn back to matters of mathematics. The three integral
theorems that we met in Section 4 are obviously closely related. To end these lectures,
we show how they can be presented in a unified framework. This requires us to introduce
some novel and slightly formal ideas. These go quite a bit beyond what is usually
covered in an introductory course on vector calculus, but we will meet these objects
again in later courses on Differential Geometry and General Relativity. View this
section as a taste of things to come.
6.3.1 Integrating in Higher Dimensions
Our unified framework will give us integral theorems in any dimension Rn. If you look
back at Section 4, you’ll notice that the divergence theorem already holds in any Rn.
Meanwhile, Stokes’ theorem is restricted to surfaces in R3 for the very simple reason
that the cross-product is only defined in R3. This suggests that before we can extend
our integral theorems to higher dimensions, we should first ask a more basic question:
how do we extend the cross product to higher dimensions?
– 126 –


## Page 131

The introduction of tensors gives us a way to do this. Given two vectors a and b in
R3, the cross-product is
(a × b)i = ϵijkajbk
From this perspective, the reason that the cross product can only be employed in R3
is because it’s only there that the ϵijk symbol has three entries. If, in contrast, we’re in
R4 then we have ϵijkl and so if we feed it two vectors a and b, then we find ourselves
with a tensor of rank 2, Tij = ϵijkl akbl.
The tensors that we get from an epsilon symbol are always special, in the sense
that they are totally anti-symmetric. The anti-symmetry condition doesn’t impose any
extra constraint on a 0-tensor ϕ or a 1-tensor ai as these are just scalar fields and vector
fields respectively. It only kicks in when we get to tensors of rank 2 or higher.
With this in mind, we can revisit the cross product. We can define the cross product
in any dimension Rn: it is a map that eats two vectors a and b and spits back an
anti-symmetric (n − 2)-tensor
(a × b)i1...in−2 = ϵi1...inain−1bin
The only thing that’s special about R3 is that we get back another vector, rather than
a higher dimensional tensor.
There is also a slightly different role played by the epsilon symbol ϵi1,...,in: it provides
a map from anti-symmetric p-tensors to anti-symmetric ( n − p)-tensors, simply by
contracting indices,
ϵ : Ti1...ip 7→ 1
(n − p)! ϵi1...inTin−p+1...in (6.16)
This map goes by the fancy name of the Hodge dual. (Actually, it’s an entirely trivial
version of the Hodge dual. The proper Hodge dual is a generalisation of this idea to
curved spaces.)
Our next step is to think about what this has to do with integration. Recall that
earlier in these lectures we found two natural ways to integrate vector fields in R3. The
first is along a line
Z
C
F · dx (6.17)
– 127 –


## Page 132

which captures the component vector field tangent to the line. We can perform this
procedure in any dimension Rn. The second operation is to integrate a vector field over
a surface
Z
S
F · dS (6.18)
where dS points in the direction normal to the surface. This integration captures the
component of the vector field normal to the surface and only makes sense in R3. This
is because it’s only in R3 that a two-dimensional surface has a unique normal. More
operationally, this normal, which is buried in the definition of dS, requires us to use
the cross product. For a parameterised surface x(u, v), the vector area element is
dS = ∂x
∂u × ∂x
∂v du dv
or, in components,
dSi = ϵijk
∂xj
∂u
∂xk
∂v du dv
Now comes a mathematical sleight of hand. Rather than thinking of (6.18) as the
integral of a vector field projected normal to the surface, instead think of it as the
integral of an anti-symmetric 2-tensor Fij = ϵijkFk integrated tangent to the surface.
We then have
Z
S
F · dS =
Z
S
Fij dSij with dSij = 1
2
 ∂xj
∂u
∂xk
∂v − ∂xj
∂v
∂xk
∂u

du dv (6.19)
This is the same equation as before, just with the epsilon symbol viewed as part of
the integrand Fij rather than as part of the measure dSi. Note that we’ve retained the
anti-symmetry of the area element dSij that was inherent in our original cross product
definition of dS. Strictly speaking this isn’t necessary because we’re contracting with
anti-symmetric indices in Fij, but it turns out that it’s best to think of both objects
Fij and dSij as individually anti-symmetric.
This new perspective suggests a way to generalise to higher dimensions. In the line
integral (6.17) we’re integrating a vector field over a line. In the surface integral (6.19),
we’re really integrating an anti-symmetric 2-tensor over a surface. The key idea is that
one can integrate a totally anti-symmetric p-tensor over a p-dimensional subspace.
– 128 –


## Page 133

Specifically, given an anti-symmetric p-tensor, the generalisation of the line integral
(6.17) is the integration over a p-dimensional subspace,
Z
M
Ti1...ip dSi1...ip (6.20)
where dim(M) = p. Here dSi1...ip is a higher dimensional version of the “area element”
defined in (6.19).
Alternatively, the higher dimensional version of the surface integral (6.18) involves
first mapping the p-tensor to an ( n − p)-tensor using the Hodge dual. This can subse-
quently be integrated over an ( n − p)-dimensional subspace
Z
˜M
Ti1...ipϵi1...ipj1...jn−p d ˜Sj1...jn−p (6.21)
with dim( ˜M) = n − p.
In fact, we’ve already met an integral of the form (6.21) elsewhere in these lectures,
since this is what we’re implicitly doing when we integrate a scalar field over a volume.
In this case the “area element” is justdSi1...in = 1
n! ϵi1...in dV and the two epsilon symbols
just multiply to a constant.. When actually computing a volume integral, this extra
machinery is more of a distraction than a help.. But if we want to know how to think
about things more generally then it’s extremely useful.
6.3.2 Differentiating Anti-Symmetric Tensors
We’ve now learned how to integrate anti-symmetric tensors. Our next step is to learn
how to differentiate them. We’ve already noted in (6.12) that we can differentiate a p
tensor once to get a tensor of rank p + 1, but in general differentiating loses the anti-
symmetry property. As we now explain, there is a way to restore it so that when we
differentiate a totally anti-symmetric p tensor, we end up with a totally anti-symmetric
(p + 1)-tensor.
For a scalar field, things are trivial. We can construct a vector field ∇ϕ and this is
automatically “anti-symmetric” because there’s nothing to anti-symmetrise.
If we’re given a vector field Fi, we can differentiate and then anti-symmetrise by
hand. I will introduce a new symbol for “differentiation and anti-symmetrisation” and
write
(DF )ij := 1
2
 ∂Fi
∂xj − ∂Fj
∂xi

– 129 –


## Page 134

where the anti-symmetry is manifest on the right-hand side. I should confess that the
notation DF is not at all standard. In subsequent courses, this object is usually viewed
as something called a “differential form” and written simply as dF but the notation
dF is loaded with all sorts of other connotations which are best ignored at this stage.
Hence the made-up notation DF .
In R3, this anti-symmetric differentiation is equivalent to the curl using the Hodge
map (6.16),
(∇ × F)i = ϵijk(DF )jk
But now we can extend this definition to any anti-symmetric p-tensor. We can always
differentiate and anti-symmetrise to get a ( p + 1)-tensor defined by
(DT )i1...ip+1 = 1
p + 1
 ∂Ti1...ip
∂xip+1
+ p further terms

where the further terms involve replacing the derivative ∂/∂x ip+1 with one of the other
coordinates ∂/∂x j so that the whole shebang is fully anti-symmetric.
Note that, with this definition of D, if we differentiate twice then we take a p-tensor
to a ( p + 2)-tensor. But this ( p + 2)-tensor always vanishes!
(DDT )i1...ip+2 = 0
for any tensor T . This is because we’ll have two derivatives contracted with an epsilon
and is the higher dimensional generalisation of the statements that ∇ × ∇ ϕ = 0 or
∇ · (∇ × F) = 0.
As an aside: this is actually the second time in these lectures that we’ve seen some-
thing vanish when you act twice, although you’d be forgiven for failing to notice the
connection. Here our new anti-symmetric derivative obeys D2(anything) = 0. But we
previously saw that the “boundary of a boundary” is always zero. This means that if
a higher dimensional space (really a manifold) M has boundary ∂M then ∂(∂M ) = 0.
Conceptually, these two ideas are very different but one can’t help but be struck by
the similarity of the equations D2(anything) = 0 and ∂2(anything) = 0, even though
the “anything”’s are very different objects in the two formulae. It turns out that this
similarity is pointing at a deep connection between the topology of spaces and the
kinds of tensors that one can put on these spaces. In fancy maths words, this is the
link between homology and cohomology.
– 130 –


## Page 135

Finally, we can now state the general integration theorem. Given an anti-symmetric
p-tensor T , then
Z
M
(DT )i1...ip+1 dSi1...ip+1 =
Z
∂M
Ti1...ip dSi1...ip (6.22)
Here dim( M) = p + 1 and, therefore the boundary has dim( ∂M ) = p. Note that we
don’t use a different letter to distinguish the integration measure over these various
spaces: everything is simply dS and you have to look closer at the indices to see what
kind of space you’re integrating over.
The equation (6.22) is a unification of all integration theorems. It contains the
fundamental theorem of calculus (whenp = 0), the divergence theorem (whenp = n−1)
and Stokes’ theorem (when p = 1 and Rn = R3). Geometers refer to this generalised
theorem simply as Stokes’ theorem since that is the original result that it resembles
most. The proof is simply a higher dimensional version of the proofs that we sketched
previously.
There is, to put it mildly, quite a lot that I’m sweeping under the rug in the discussion
above. In particular, the full Stokes’ theorem does not hold only in Rn but in a general
curved space known as a manifold. In that context, one has to be a lot more careful
about what kind of tensors we’re dealing with and, as I mentioned above, Stokes’
theorem should be written using a kind of anti-symmetric tensor known as adifferential
form. None of this really matters when working in flat space, but the differences become
crucial when thinking about curved spaces. If you want to learn more, these topics will
be covered in glorious detail in later courses on Differential Geometry or, for physicists,
General Relativity.
– 131 –


## Page 136

What You Really Need
Here are expressions for div, grad, curl and the Laplacian in various coordinate systems.
Cartesian: x = (x, y, z)
∇f = ∂f
∂x ˆx + ∂f
∂y ˆy + ∂f
∂z ˆz
∇ · F = ∂Fx
∂x + ∂Fy
∂y + ∂Fz
∂z
∇ × F =
 ∂Fz
∂y − ∂Fy
∂z

ˆx +
 ∂Fx
∂z − ∂Fz
∂x

ˆy +
 ∂Fy
∂x − ∂Fx
∂y

ˆz
∇2f = ∂2f
∂x2 + ∂2f
∂y 2 + ∂2f
∂z 2
Cylindrical Polars: x = (ρ cos ϕ, ρsin ϕ, z)
∇f = ∂f
∂ρ ˆρ + 1
ρ
∂f
∂ϕ
ˆϕ + ∂f
∂z ˆz
∇ · F = 1
ρ
∂(ρFρ)
∂ρ + 1
ρ
∂Fϕ
∂ϕ + ∂Fz
∂z
∇ × F =
1
ρ
∂Fz
∂ϕ − ∂Fϕ
∂z

ˆρ +
 ∂Fρ
∂z − ∂Fz
∂ρ

ˆϕ + 1
ρ
 ∂(ρFϕ)
∂ρ − ∂Fρ
∂ϕ

ˆz
∇2f = 1
ρ
∂
∂ρ

ρ ∂f
∂ρ

+ 1
ρ2
∂2f
∂ϕ2 + ∂2f
∂z 2
– 132 –


## Page 137

Spherical Polars: x = (r sin θ cos ϕ, r sin θ sin ϕ, r cos θ)
∇f = ∂f
∂r ˆr + 1
r
∂f
∂θ
ˆθ + 1
r sin θ
∂f
∂ϕ
ˆϕ
∇ · F = 1
r2
∂(r2Fr)
∂r + 1
r sin θ
∂(sin θFθ)
∂θ + 1
r sin θ
∂Fϕ
∂ϕ
∇ × F = 1
r sin θ
 ∂(sin θFϕ)
∂θ − ∂Fθ
∂ϕ

ˆr + 1
r
 1
sin θ
∂Fr
∂ϕ − ∂(rFϕ)
∂r

ˆθ + 1
r
 ∂(rFθ)
∂r − ∂Fr
∂θ

ˆϕ
∇2f = 1
r2
∂
∂r

r2 ∂f
∂r

+ 1
r2 sin θ
∂
∂θ

sin θ ∂f
∂θ

+ 1
r2 sin2 θ
∂2f
∂ϕ2
– 133 –
