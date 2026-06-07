# 8.09(F14) Chapter 6: Fluid Mechanics

Converted from: `Fluid Mechanics\Fluid Mechanics.pdf`


## Page 1

Chapter 6
Fluid Mechanics
So far, our examples of mechanical systems have all been discrete, with some number of
masses acted upon by forces. Even our study of rigid bodies (with a continuous mass distri-
bution) treated those bodies as single objects. In this chapter, we will treat an important
continuous system, which is that of ﬂuids.
Fluids include both liquids and gases. (It also includes plasmas, but for them a proper
treatment requires the inclusion of electromagnetic eﬀects, which will not be discussed here.)
For our purposes, a ﬂuid is a material which can be treated as continuous, which has the
ability to ﬂow, and which has very little resistance to deformation (that is, it has only a
small support for shear stress, which refers to forces parallel to an applied area). Applica-
tions include meteorology, oceanography, astrophysics, biophysics, condensed matter physics,
geophysics, medicine, aerodynamics, plumbing, cosmology, heavy-ion collisions, and so on.
The treatment of ﬂuids is an example of classical ﬁeld theory, with continuous ﬁeld
variables as the generalized coordinates, as opposed to the discrete set of variables qi that we
have treated so far. Therefore the ﬁrst step we have to take is understanding how to make
the transition from discrete to continuum.
6.1 Transitioning from Discrete Particles to the Con-
tinuum
Rather than starting with ﬂuids, lets instead consider a somewhat simpler system, that of
an inﬁnite one dimensional chain of masses m connected by springs with spring constant k,
which we take as an approximation for an inﬁnite continuous elastic one-dimensional rod.
104


## Page 2

CHAPTER 6. FLUID MECHANICS
If the equilibrium separation of masses is a and the distance the i’th mass is translated
from equilibrium is ηi, then
kV = m(2
∑
ηi+1
i
− ηi)2 T = η˙2
2 i , (6.1)
i
where V is the potential energy from the springs, and T is the
∑
kinetic energy. It is convenient
to write the Lagrangian as
1L = T− V = ma2
∑
i
(
ηη˙2
a i− ka
(
i+1− ηi
2
a
) )
, (6.2)
and the corresponding equations of motion obtained from the Euler-Lagrange equations as
m ηη¨i
a − ka
(
i+1− ηi η+a2
)
ka
(
i− ηi−1 (6.3)a
)
= 0.2
Technically both the Lagrangian and the equations of motion are independent of a, but we
have introduced factors of a to facilitate taking the continuous limit a→ 0. In this limit
the masses become progressively more densely distributed along the line. The important
question when taking this limit is which quantities do we hold ﬁxed.
Lets deﬁne µ≡ m as the mass density and Y = ka as the Young’s modulus. Here Y isa
equivalent to the spring constant for a continuous rod. (For a rod, the force F = Y ξ where
ξ is the longitudinal extension per unit length, or in other words, the strain.) We intend to
hold µ and Y ﬁxed when taking the continuous limit.
The key change in the continuous limit is that the discrete position indexi becomes a con-
tinuous position label x, so instead of ηi = ηi(t), now ηx = ηx(t), or with more conventional
notation, η = η(x, t). This also means that
η(x + a, t)− η(x, t) ∂η
a → , (6.4)∂x
1 η
a
( (x + a, t)− η(x, t) η(x, t)− η(x− a, t)
a − ∂
a
) 2η→ , (6.5)∂x2
∑
a
i
→
∫
dx . (6.6)
Using these results in Eq. (6.2) gives L =
∫
L dx where
1L = ∂µ2
( ( η(x, t) 2
∂t
)
− Y
(∂η(x, t) 2
∂x
) )
(6.7)
is the Lagrangian density. Likewise, using them in Eq. (6.3) gives the equations of motion
∂2ηµ ∂2ηY∂t2− = 0 , (6.8)∂x2
which we recognize as the wave equation.
105


## Page 3

CHAPTER 6. FLUID MECHANICS
The results for the Lagrange density and Euler Lagrange equations are of course not
indepedent. We can also use
L =L
( ∂ηη, ∂η,∂x , x, t∂t
)
(6.9)
with Hamilton’s principle,
t2 ∞
δS = δ
t1
L dx dt = 0. (6.10)
−∞
to formulate the dynamics, and thus deriv
∫ ∫
e the Euler-Lagrange equations. Because η =
η(x, t) has two parameters, if we follow the standard procedure of varying the path η takes
between the two endpoints, we get variations from the dependence of the Lagrange density
on its ﬁrst three arguments. Integrating by parts in each of t and x, and setting the surface
terms to zero, then yields
∂ ∂
∂t
(
L
∂
(∂η
∂+
∂t
)
) ∂
∂x
(
L
∂
(∂η
∂
∂x
)
) L− = 0 (6.11)∂η
as the continuum Euler-Lagrange equation. Recall that for N particles we expect N E-L
equations for the time dependence, but here we have just one equation. However actually
by that counting, this result corresponds to an inﬁnite number of equations, one for each
value of x. From this point of view, the derivatives with respect to x are what couples these
equations together.
Example For the Lagrangian density of the elastic rod,
∂L
∂
(∂η
∂=
∂t
) ηµ ∂, L
∂t ∂
(∂η
∂=
∂x
) η−Y ∂, L
∂x = 0 . (6.12)∂η
Putting these results together in Eq. (6.11) gives the wave equation µ ∂2η 2
Y∂t2− ∂ η =∂x2 0 as
anticipated.
In our above analysis, η = η(x, t) is a continuum generalized coordinate called a classical
ﬁeld. Here t is a parameter and x is a continuous label as well.
Although we have been talking about one dimension so far, it is easy to generalize the
above discussion to a higher number of dimensions. For example, in three dimensions we
simply have dependence on three continuous label parameters, η = η(x, y, z, t) or η = η(r, t).
The ﬁeld η(r, t) is called a scalar ﬁeld because the output is a single number. With multiple
dimensions we also have vector ﬁelds η(r, t), where the output is a vectors. An example of
vector ﬁelds that you are familiar with are the electromagnetic ﬁelds E(r, t) and B(r, t). In
fact, classical ﬁelds of exactly this sort are also the starting point for formulating quantum
ﬁeld theory. One formulates a classical Lagrangian density L (that is most often Lorentz
invariant) which depends on ﬁelds like the electromagnetic scalar and vector potentialsφ(r, t)
and A(r, t). Then one quantizes these ﬁelds.
Our description of ﬂuids will make use of classical ﬁeld variables in 3-dimensions without
considering quantization.
106


## Page 4

CHAPTER 6. FLUID MECHANICS
Eulerian & Lagrangian Variables
Let us consider ﬂuid ﬂowing in a tube. A natural set
of variables would be to take some initial time t = 0
and label all ﬂuid elements by their coordinates at this
time: r0. We will often refer to ﬂuid element, which
is a point in the ﬂuid, or sometimes an inﬁnitesimally
small region of the ﬂuid. The motion of the ﬂuid could
then be described by r = r(r0, t), which determines the
subsequent coordinates of the ﬂuid element labeled by
r0 at the later time t.
If we continue in this direction it leads to the Lagrangian formulation of ﬂuid dynamics.
The advantage is that the usual laws of classical mechanics apply to ﬂuid particles. The
disadvantage is that it is more work to make the connection to measurable quantities that
characterize the ﬂuid.
Instead, we will explore an alternate formulation.
Pretend we sit at a ﬁxed point r in the ﬂuid and ask
what happens there as a function of the time t. We can
think of it like placing a measuring device atr and mea-
suring, at any time t, quantities like the ﬂuid velocity
v, density ρ, or pressure P. In fact, these 5 variables
(as density and pressure are scalars, while velocity is a
vector) are enough to describe the state of the moving
ﬂuid. This is the Eulerian formulation of ﬂuid dynam-
ics. Additionally, ρ andP are enough to determine
all thermodynamic quantities (assuming we know the
equation of state).
Example for an ideal gas at temperature T , we have PV = nR T, where V is volume, n
is the number of moles, R is contant, and T is temperature. Dividing by V we have that
pressure is simply proportional to density, P = ρR′T for a rescaled gas constant R′.
Pressure is isotropic in a ﬂuid. This means it is the same from all directions, so there is
only 1 number for each (r , t); thus, pressure is a scalar ﬁeld, P(r, t).
To prove this consider the inﬁnitesimal wedge-shaped ﬂuid element below, which we take
to be at rest in a gravitational ﬁeld. Recall that pressure is force per unit area, P = nˆ·F/A,
where nˆ is a unit vector perpendicular to the areaA that the forceF is acting on. In the ﬁgure
we label three pressuresP1,P1,P1 acting on three of the sides, that have corresponding force
components in the x and z directions. (There is also pressure on the other two faces with
forces in the y direction, but the above will suﬃce to argue why the pressure is isotropic.)
107


## Page 5

CHAPTER 6. FLUID MECHANICS
P
P
P
Next we balance forces for the wedge at rest. Gravity pulls down, and the volume of the
wedge is dxdydz/2 so the force of gravity is
dx dy dzFg = ρg . (6.13)2
Also by simple trigonometry the area dA of the slanted face can be written in two diﬀerent
ways
dzdA = dy dx= dysin(θ) .cos(θ)
Balancing forces in the x and z directions then means
0 = dFx =P2 dy dz−P 1 sin(θ) dA = (P2−P 1) dy dz, (6.14)
10 = dFz =P3 dx dy−P 1 cos(θ) dA− ρg dx dy dz.2
The ﬁrst equation impliesP1 =P2. In the second equation we can pull out a common dxdy
to give
1P3 =P1 + ρg dz, (6.15)2
then as the inﬁnitesimal distance dz→ 0 we have
P1 =P3. (6.16)
Thus, pressure is the same in all directions. Even if the ﬂuid is moving or even accelerating
we would come to the same conclusion. For example, if we had to balance the force against
acceleration this would lead to adding term
ρa dx dy dz (6.17)
108


## Page 6

CHAPTER 6. FLUID MECHANICS
for acceleration a, which again drops out for an inﬁnitesimal ﬂuid element just like the
gravitational force did.
Time Derivatives:
The total time derivative d tells us the rate at which a quantity changes as we movedt
with a ﬂuid element. The partial time derivative ∂ tells us the rate of change of a quantity∂t
at a ﬁxed position r. We can work out a relation between them.
Example ForP
dP ∂= P
dt
∂+ P
∂t
∂x˙ + P
∂x
∂y˙ + P
∂y z˙ (6.18)∂z
∂= P + v∂t ·∇P .
In general, the time derivative acts as
d ∂=dt + v∂t ·∇ (6.19)
on any ﬂuid ﬁeld (scalar, vector, or tensor) that is a function of ( x, y, z, t).
6.2 Fluid Equations of Motion
6.2.1 Continuity Equations
Let us consider a volume V of ﬂuid. Then from Gauss’
divergence theorem (which you may recall from elec-
tomagnetism, but which is a general result of vector
calculus for any vector ﬁeld):
∫
dV∇· v =
∫
d
S nˆ· v =
∫
dS· v, (6.20)
V ∂V ∂V
where ∂V is the
closed area that bounds the volume V ,
nˆ is unit vector orthogonal to the surface element dS,
and dS≡ dSnˆ.
Lets ask: As the ﬂuid moves, how does V change?
The quantity nˆ·v is the outward velocity of the surface
dS, so nˆ· v dS dt is the volume added in a time interval
dt, as illustrated on the right.
109


## Page 7

CHAPTER 6. FLUID MECHANICS
This means that the change in volume can be determined by adding up all the changes
from integrating over the entire surface
dV = v d = v dV . (6.21)dt
∫
∂V
· S
∫
V
∇·
This result becomes even simpler if we consider an inﬁnitesimal volume δV over which∇· v
does not vary, then we can pull ∇· v outside the integral to obtain simply
dδV = δV∇· v. (6.22)dt
Thus the divergence of the velocity,∇· v, controls how the ﬂuid volume expands with time.
If∇· v = 0 everywhere then we say the ﬂuid is incompressible because for every volume
element dV = 0.dt
Even if the volume changes, the mass of the ﬂuid element will not,
dδm d=dt (ρδV ) = 0. (6.23)dt
This implies that
dρ0 = δV dδV+ ρdt
dρ= δVdt
(
+ ρdt ∇· v
)
, (6.24)
so
dρ + ρdt ∇· v = 0. (6.25)
Expanding out the time derivative into partial derivatives this yields
∂ρ + v∂t ·∇ρ + ρ∇· v = 0, (6.26)
and simplifying the result gives
∂ρ + )t ∇· (ρv = 0 . (6.27)∂
This is an important result the continuity equation for mass of the ﬂuid, which is a partial
diﬀerential equation in the ﬂuid variables.
Here ρv is the mass density ﬂux (the ﬂow of mass density), and this equation says that
nowhere is the matter making up the ﬂuid created or destroyed. If the density changes, then
there must be an incoming or outgoing ﬂux. This is easier to see if we use the divergence
theorem for the vector ( ρv) to write this result in integral form,
110


## Page 8

CHAPTER 6. FLUID MECHANICS
∂ dV ρ =∂t V
− dS nˆ
∂V
· (ρv) .
∫ ∫
(6.28)
Here ∂ dV ρ is the increase of mass in the volume V , while dSnˆ·(ρv) is the outﬂow of∂t V ∂V
mass
through the surface surrounding this volume (which becomes an inﬂow with the minus
sign).
∫ ∫
We’ve talked about∇· v thus far, so it’s natural to ask: is there a physical interpretation
to∇× v? There is indeed.
The quantity Ω =∇× v is the vorticity. If the velocity
is constant or uniform in a single direction ⃗ v= vx(x)xˆ,
then its ob
vious that Ω = 0. To consider what it mea-
sures we can use Stoke’s theorem for the velocity vector
ﬁeld, ∫
(∇× v)· nˆ dS = v
S ∂
· dl, (6.29)
S
whereS is now
an open surface
∮
and ∂S is its closed
boundary curve. We can use this result to determine
when Ω =∇× v is non-zero.
Consider a rotating ﬂuid and the circular curve shown.
When we integrate the velocity along this circular curve
the terms always add up, so Ω̸
= 0. It thus provides a
measures of the rate of rotation of the ﬂuid.
If we consider ﬂow in one direction with a velocity gra-
dient, again Ω̸
= 0. Here a larger positive contribution
to the integral is obtained from the right side of the cir-
cle, relative to the negative contribution from the left
side.
If∇× v = 0 everywhere in a moving ﬂuid, we say the ﬂow is irrotational.
We can determine more precisely what Ω is as follows. Consider a rotating coordinate
111


## Page 9

CHAPTER 6. FLUID MECHANICS
system with constant angular velocity ω, so v = v′ +ω× r. Then
∇× v =∇× v′ +∇× (ω× r)
=∇× v′ +ω∇· r−ω·∇r
=∇× v′ + 2ω .
Nowω was constant, but we have not yet speciﬁed its value. If we pick ω = 1 v2∇× at
a point r, then ∇× v′ = 0 and the ﬂuid is irrotational at r in the rotating frame. This
argument can be repeated for other points r. Considering this from the point of view of the
origianl frame we thus see that Ω/2 is the angular velocity of the ﬂuid at position r.
6.2.2 Ideal Fluid: Euler’s Equation and Entropy Conservation
Let us consider an ideal ﬂuid which has no energy dissipation due to internal friction (mean-
ing no viscosity) and no heat exchange between diﬀerent parts of the ﬂuid (meaning no
thermal conductivity).
The force on a ﬂuid element δV from pressure in the xˆ
direction is
δFx = Fx(x)− Fx(x + δx) =
=P(x)−P (x + δx) ∂δy δz δx = P
δx − δV . (6.30)∂x
More generally accounting for all directions we have
δF =−∇P δV. (6.31)
From external forces δF it is useful to deﬁne the force density f by δF = f δV . This means
that Newton’s law, ma = F becomes
dvρδV = (dt −∇P + f)δV. (6.32)
Writing out the total time derivatives this becomes
∂v + v∂t ·∇v +∇P f=ρ (6.33)ρ
which is the Euler equation for ﬂuid dynamics. There are two special cases which are useful
to consider.
1. Often f can be derived from a potential: f =−ρ∇Φ. Note that Φ here is a potential
energy per unit mass. For example, with gravity, Φ = gz, so f =−ρgzˆ. In general,
then ∂v + v∂t ·∇v +∇P +ρ ∇Φ = 0 (6.34)
is a rewriting of the Euler equation.
112


## Page 10

CHAPTER 6. FLUID MECHANICS
2
2. We can use v× Ω = v× (∇× v) =∇
(
v v2
)
− ·∇v . This gives
∂v v+∂t ∇
( 2
+ Φ2
)
+∇P (6.35)ρ − v× Ω = 0
as another rewriting of the Euler equation. For constant ρ, we can take the curl and
use the fact that∇× (∇h) = 0 for any h to obtain
∂Ω = .t ∇× v× Ω (6.36)∂
We will have occasion to use this result later
(
on.
)
To solve the Euler and continuity partial diﬀerential equations we need boundary condi-
tions. The boundary conditions for ideal ﬂuids are simply that they cannot penetrate solid
surfaces, so if a surface with normal vector nˆ is stationary then
v· nˆ
then
⏐
= 0 . (6.37)surface
If the surface does move
v nˆ
⏐
· = vsurface. (6.38)surface
So far we have four equations (continuit
⏐
y for the scalar density ρ, and the Euler equation
for the vector velocity v) for ﬁve unknowns.
⏐
For an ideal ﬂuid the 5 th equation,
dS = 0, (6.39)dt
is the statement that the entropy S is conserved, so there is no heat exchange. Eﬀectively,
this provides a relationship between pressure and density through P =P(ρ, S). A simple
example is an ideal gas at constant temperature, where P = ρ R′T .
6.2.3 Conservation of Momentum and Energy
Due to the term (v ·∇ )v which has a vivj, the Euler equation is nonlinear. For simpler
situations it is therefore very useful to consider conservation laws.
Let us start by considering Momentum Conservation. The quantity ρv is the ﬂux of mass
density, which is also the density of momentum (in direct analogy to p = mv). Consider
∂ (ρvi) = ∂ρ
∂t vi + ρ ∂vi
∂t . Using the continuity and Euler equations to replace these two partial∂t
derivatives, and once again implicitly summing over repeated indices until further notice,
this becomes
∂ ∂(ρvi) =∂t −vi
∂(ρvj) + ρ∂xj
( v− ivj
1
∂xj
− ρ
∂P +∂xi
)
fi. (6.40)
This is rearranged to give
∂ ∂(ρvi) + P
∂t
∂+∂xi
(ρvivj) = fi. (6.41)∂xj
113


## Page 11

CHAPTER 6. FLUID MECHANICS
We deﬁne the stress tensor for an ideal ﬂuid as
Tij =Pδij + ρvivj (6.42)
which gives the momentum ﬂux density (which is to say, the density of momentum in the
direction ei ﬂowing in the direction of ej). Note that Tij is symmetric. Then, in vector form,
the equation above becomes
∂ (ρv) + =t ∇· T f . (6.43)∂
This describes the conservation of linear momentum density with sources given by the exter-
nal force densities f. Comparing to the continuity equation where the density ρ is a scalar
so its ﬂux ρv is a vector, here the momentum density ρv is a vector so its ﬂux T is a tensor.
Next consider Conservation of Energy. Conservation of energy can be said to arise from
the Euler equation dv/dt +∇P/ρ +∇Φ = 0. Note that here we are switching back to the
total time derivative since this is more useful for our discussion of energy. For a volume
element δV , we take the inner product of the Euler equation with ρvδV to obtain
dvδV ρ v·
+ δV vdt ·∇P + δV ρ v·∇Φ = 0 . (6.44)
Given that d (ρδV ) = 0 by the conservation of mass we can move this combination inside ofdt
total time derivatives. Also recall that v·∇ = d/dt− ∂/∂t. Using these two facts we obtain
d 1
dt
( dρv2δV2
)
+ (v·∇P )δV + ∂Φ(ρΦδV )dt − ρ δV = 0. (6.45)∂t
Next we try to convert the second term to time derivatives. Consider using
d ∂(dt PδV ) = P δV + (v +t ·∇P )δV∂ P(∇· v)δV, (6.46)
where we recalled that dδV /dt = (∇· v)δV . Using this to eliminate (v ·∇P )δV gives
d 1
dt
( ∂ρv2δV + ρΦδV +2 PδV
)
=
( P ∂Φ+ ρ∂t δ∂t
)
V +P∇· vδV, (6.47)
where 1 ρv2δV is the kinetic energy, ρΦδV is the external potential energy, and PδV is the2
internal potential energy due to pressure. The terms with partial time derivatives act like
sources. Unfortunately there is still a term without a total or partial time derivative, however
this term is easier to interpret. It is related to the work Wu done by δV when it expands
and exerts pressure on the surrounding ﬂuid. In particular
dWu
d(δV )=dt P d=dt P∇· v δV ≡− (U δm) (6.48)dt
114


## Page 12

CHAPTER 6. FLUID MECHANICS
where in the last step we have deﬁned the work as a negative potential energy U (per unit
mass). If the equation of state is given, this U can be calculated either as an integral in
density or pressure,
U =
∫
d(δV ) P ρ
=δm
∫
dρ′P(ρ′)
ρ0
P
=ρ′ 2
∫
P0
P′
(1 dρ
ρ2 (d
)
P′) dP′ P′ (6.49)
where we used the ﬁxed δm = δV ρ to switch variables between δV and ρ. Using Eq. (6.48)
means we can now
write everything in terms of time derivatives,
d 1
dt
((
2 ∂ρv + ρΦ +2 P + ρU
)
δV
)
=
( P ∂Φ+ ρ∂t
)
δV (6.50)∂t
This is the equation for energy conservation in an ideal ﬂuid. If P and Φ are not explicitly
dependent on time at any point in space (which is often the case), then any ﬂuid element
has a constant total energy as it moves along (recall that this is the meaning of d/dt). For
applications to ﬂuids it is more convenient to divide this result by δm = ρδV to give
d v
dt
( 2
+ Φ +P
2
1+ Uρ
)
= ∂ρ
ρ
∂Φ+∂t . (6.51)∂t
This is Bernoulli’s equation.
6.3 Static Fluids & Steady Flows
Having derived the equations of motion and conservation laws for ideal ﬂuids, let us now
consider some important special cases.
Static Fluids
Static ﬂuids have v = 0 everywhere, so the ﬂuid is at rest (implying mechanical equi-
librium). Continuity then says ∂ρ = 0, so ρ and∂t P are independent of time. If Φ = gz for
gravity, the Euler equation says
∇P =ρ −gzˆ, (6.52)
soP and ρ can each only be functions of z, while in fact 1 ∂
ρ
P is independent of z.∂z
Example if the density ρ is constant, then if Φ = gz,
then
P(z) =P0− ρgz, (6.53)
so the pressure decreases with height.
115


## Page 13

CHAPTER 6. FLUID MECHANICS
Example let us pretend the atmosphere is an ideal gas at a uniform constant temperature
T . AsP = ρR′T , then
∂P g=∂z − ,R′TP (6.54)
so
P(z) =P0e− gz
R′T , (6.55)
and the pressure falls exponentially.
Example the Archimedes principle says that the pres-
sure balances the weight of any displaced ﬂuid. This
follows from our ﬁrst example above. The pressure on
the bottom of the object displacing the ﬂuid is ρgz,
where z is the distance from the surface. The force
is pressure times area, so that is the volume displaced
times ρg, or the mass displaced times g.
Note that if the temperature is not uniform, then the mechanical equilibrium is not stable,
as the temperature gradients result in convection currents which mix the ﬂuid. Therefore
we have used the fact that we are discussing an ideal ﬂuid.
Steady Flows
Steady ﬂows are ones in which ∂ρ = 0, ∂
∂t
P = 0, and∂t∂v = 0 at every position r.∂t
In this case, the continuity equation becomes ∇·
(ρv) = 0, so what ﬂows in must ﬂow out. This is most
easily implemented by using the integral form, where
for any closed surface S we have
∫
dS
S
· (ρv) = 0 . (6.56)
For a steady ﬂow the Bernoulli equation becomes the statement that
v2
+ Φ +P
2 + U = B (6.57)ρ
where B is a constant along the paths of ﬂuid elements. Most often we will consider gravity
where Φ = gz.
A steady incompressible ﬂuid is one where∇· v = 0 and U is constant. Continuity now
says∇ρ = 0 so ρ is constant as well. Moreover, the Bernoulli equation now says
v2
+ Φ +P
2 = B′ (6.58)ρ
is also constant.
116


## Page 14

CHAPTER 6. FLUID MECHANICS
Example for a horizontal pipe ﬁlled with an incompressible ﬂuid (which is approximately
true of water at room temperature) of constant density ρ.
Lets consider the two ends to be at approximately at the same height so we can drop the
term Φ = gz. At the hatched areas shown we know that the ﬂow must be tangential to the
edge of the pipe, so a valid solution is to simply consider the velocities to be uniform and
tangential to the enclosing pipe across each of these areas. Using Bernoulli this implies that
ρv2
1 ρv2
+2 P1 = 2 +2 P2. (6.59)
Furthermore, the continuity equation for the enclosed areas shown (some sides being those of
the pipe) implies that the ﬂux in at one end must equal the ﬂux out at the otherA1v1 = A2v2.
Together this gives
1P1 =P2 +
Aρv2
2 2
(
1−
(
2 (6.60)A
)2
.
1
)
Since A1 > A2 we have v2 > v1, and this impliesP1 >P2.
Example let us consider a water tank ﬁlled to a height z1 with a hole at height z2 < z1 that
produces a jet of water.
Let us assume v1≈ 0 (so the tank is much larger than
the hole). Then
1 ρv2
2 +P2 + ρgz2 =P1 + ρgz1. (6.61)2
Additionally,P2 = P1 = Patmosphere, so the pressure
terms cancel out, and we can solve for the v2 velocity
to give
v2 =
√
2g(z1− z2) . (6.62)
This is the same velocity as that for any mass falling
from rest through a height z1− z2. Of course a key
diﬀerence for the jet of water is that this velocity is
horizontal rather than vertical.
117


## Page 15

CHAPTER 6. FLUID MECHANICS
Lets discuss two common ways to picture ﬂows. One is through stream lines, which are
lines that are everywhere tangent to the instantaneous velocity, meaning
dx(s)
ds × v = 0 (6.63)
for some parameter s that determines the distance along the streamline. These lines are
drawn at some ﬁxed time and never cross since there is a unique velocity at every point.
Writing out the cross product we ﬁnd 0 = dx/ds× v = zˆ
(
v dx
y vds− dy
x +ds
)
. . . implying that
we have
dy vy=dx
dz,vx
vz=dx
dz,vx
(
or vz=dy .vy
)
(6.64)
When we use the equations in this form we would need to be able to switch from s to the
variable x to uniquely parameterize the curve.
Another method of picturing the ﬂow is through ﬂow lines, which are paths that are
followed by ﬂuid elements, meaning
dx = v(x, t). (6.65)dt
Since ﬂow lines are time dependent, they can in general cross since the path a ﬂuid element
takes through a point may diﬀer at a later time.
For a steady ﬂow, the lines are time independent, and stream lines and ﬂow lines are
identical. To prove this we consider the ﬂow line equations dx/dt = vx, dy/dt = vy, and note
that since the velocities are time independent that we can eliminate time through the ratio
118


## Page 16

CHAPTER 6. FLUID MECHANICS
dy/dx = vy/vx (and similar for other directions), which is the equation for the stream lines.
To go the opposite direction we simply pick s = t to parameterize the streamline, and note
that v× v = 0. Furthermore, for a steady ﬂuid we have Bernoulli’s law
v2
+ Φ +P
2 + U = B (6.66)ρ
which we now understand is constant along stream lines.
Stagnation Points and a Pitot Tube
Consider an ideal incompressible ﬂuid in a steady ﬂow which ﬂows in an almost uniform
manner, and then hits a wall.
Since the velocity must be tangential at the sur-
face, the ﬂow can either curve left or right, and
it is often the case that parts of the ﬂow will go
in both directions. In this case there is a stag-
nation point o, where vo = 0. If we consider the
streamline that hits the stagnation point then
Po =P + 1
∞
ρv2 , where v and2 ∞ ∞ P are, re-∞
spectively, the velocity and pressure inﬁnitely
far away. Thus the largest pressure in the en-
tire ﬂow occurs at the stagnation point where
there is only pressure and no kinetic energy.
Now let us consider a Pitot tube, which is a device used to measure velocity (for example
on airplanes).
119


## Page 17

CHAPTER 6. FLUID MECHANICS
a O
l
τ
If the density is ρa in the air and ρl in the liquid, we can write down the Bernoulli equations
obtained by comparing the air and liquid ﬂows at ∞, the stagnation point o, at the point
s near the surface (where the air velocity is the same as at ∞ and liquid is at rest), and at
the point m at the top of the liquid inside the column. This gives:
1Po =P +∞ ρav2
2 ∞
1Ps =P +∞ ρag(zo + zs)2
Pm =Po + ρag(z0 + zs + ∆h)
=Ps + ρlg∆h
Subtracting the 2 nd equation from the 1 st, subtracting the 4 th equation from the 3 rd, and
then adding these two results cancels all the pressure terms, and leaves
1 ρav2 = g(ρl ρa)∆h. (6.67)2 ∞ −
This can be rearranged to write
v2 = 2g∞
( ρl ρ1ρa
−
)
∆h≈ l2g ∆h (6.68)ρa
allowing us to determine the velocity of the air v in terms of the known ratio of densities
ρl
∞
theρ ≫ 1 and simply the measured height between liquid on each side, ∆h.
a
6.4 Potential Flow
When a ﬂow is everywhere both irrotational and incompressible it is known as potential
ﬂow. Such ﬂows may be steady or not steady. Since Ω =∇× v = 0 the velocity ﬁeld is
conservative. This means there exists a velocity potential
φ(r) =
∫ r
v(r′, t)
r0
· dr′ (6.69)
120


## Page 18

CHAPTER 6. FLUID MECHANICS
which depends only on the endpoints of the integration, and not the path taken between
them, such that
v =∇φ (6.70)
Since∇· v = 0 for an incompressible ﬂuid, then φ must solve Laplace’s equation
∇2φ = 0 . (6.71)
Solving for the scalar φ (with suitable boundary conditions), then immediately gives v.
We can then use the Euler equation to immediately get the pressure. For Ω = 0 one
form of the Euler equation was
∂v v+∂t ∇
( 2
+ Φ2
)
+∇P = 0 . (6.72)ρ
If ρ is constant, then
∇
(∂φ v2
+∂t + Φ +P
2 =ρ
)
0, (6.73)
so
∂φ v2
+∂t + Φ +P
2 = b(t) (6.74)ρ
for some function b. For each t∫we can pick the zero of φ so that b(t) is constant. (This is
t
equivalent to shifting φ→ φ + b(t′) dt′, where adding this constant that is independent of
x gives a solution that is equally valid.) The remaining constant b be ﬁxed by a boundary
condition on the pressure. Thus the full pressure as a function of x and t is determined by
P ∂φ=ρ − v2
∂t− 2 − Φ + b , (6.75)
where in principal the ﬁrst three terms on the right hand side carry both spatial and time
dependence. Often we are interested in a steady ﬂow, in which case the term ∂φ/∂t = 0.
Example if φ = v0x, then v = v0xˆ, which is a speciﬁc case of a uniform ﬂow.
Example if φ = A ln(r) in 2 dimensions, then for all r > 0
∂φv =
1rˆ +∂r r
∂φ Aˆθ =∂θ rˆ, (6.76)r
which is a point source. An analogous point source in 3 dimensions would arise fromφ =− A
r ,
which gives v = A
2 rˆ for all r > 0. (At r = 0 there would be a delta function source, so wer
do not satisfy Laplace’s equation at this point.)
Example Consider φ = Γ θ in polar coordinates in the 2 dimensional plane. Then vr =2π
∂φ
∂r = 0 and vθ = 1
r
∂φ
∂θ = Γ for all r > 0. This corresponds to a potential vortex about the2πr
point r = 0.
121


## Page 19

CHAPTER 6. FLUID MECHANICS
Example Consider a sphere of radius R moving with constant velocity u through an incom-
pressible ideal ﬂuid and ﬁnd its velocity by solving for its velocity potential. Equivalently we
can consider the problem of ﬁnding the velocity when a sphere is held at rest and the ﬂuid
ﬂows in from far away with uniform velocity −u at inﬁnity. The ﬁrst situation is shown in
ﬁgure a) and the second as ﬁgure b).
a) b)
We use coordinates centered on the sphere, and deﬁne the axes so that u = uxˆ. The
problem is spherically symmetric other than the directionality fromu, so its natural to expect
v∝ u. Since∇φ = v this means that w e expect φ∝ u. (Eﬀectively the boundary condition
is linear in u and the equation∇2φ =
0 is linear. We could also explicitly demonstrate the
proportionality v∝ u using dimensional analysis, as we will discuss in more detail later in
this chapter.)
It is actually easier to consider the sphere being at rest with the ﬂuid moving past it as
in b), so lets start with this case. Since ∇2φ = 0 is linear, we can solve using superposition.
The velocity potential
φ(x) =−ux + φ′(x) (6.77)
has a term −ux giving the correct uniform ﬂow far away from the sphere. Therefore, with
r the distance from the center of the sphere, we have
lim φ′(x) = 0. (6.78)
r→∞
Another way to see this is that taking the gradient of Eq. (6.77) gives
v =−uxˆ + v′, (6.79)
which is simply the translation between the velocity ﬁeld v for b) and the velocity ﬁeld v′ for
a). For the situation a) we would anticipate Eq. (6.78) as the correct boundary condition,
since the ﬂuid is at rest at inﬁnity when it is inﬁnitely far away from the disturbance caused
by dragging the sphere. We can look for a solution for φ′.
As∇2φ′ = 0 with lim r φ′ = 0, one option could be φ′ = 1
→∞
in 3 dimensions, but thisr
would give a point source solution with velocity moving radially outward from our sphere
and hence make it impossible to satisfy the appropriate boundary condition on the sphere
(its also not∝ u). Instead, let us consider a dipole source
1φ′ = Au·∇
(
(6.80)r
)
122


## Page 20

CHAPTER 6. FLUID MECHANICS
for some constant A. This proposal is linear in u, and satisﬁes ∇2φ′ = 0 for r > 0 since
the derivatives commute: ∇2φ′ = A(u·∇ )∇2(1/r) = 0. It remains to compute φ′ and v
explicitly and check that we can satisfy the boundary conditions (and proper dimensions)
with this solution. Since
∇
(1 r=r
)
− , (6.81)r3
we have Auφ′ = · r− . (6.82)r3
Moreover,
∇(u· r) = u, ∇r−n =−nr− (n+2)r, (6.83)
so the solution for v′ is
Av′ =∇φ′ = 3(ur3
( u− + · r)r (6.84)r2
)
and we then also have obtained v =−u + v′. The boundary condition on the surface of the
sphere (which is r = R for case b) where the sphere is at rest) is v· rˆ = 0. This means
Au r0 =−u rˆ · ˆ· − 3Au+R3
· rˆ, (6.85)R3
which has the solution A = R3
. Thus,2
R3
v =−u + 3(
2r3
( u· r)r− ur2
)
. (6.86)
This solution has the right dimensions and satisﬁes the boundary conditions on the sphere
and at inﬁnity.
For steady ﬂow, we can then use Bernoulli’s equation to get the pressure on the sphere,
constant = (P + 1
ρv2)r=R = (2 P + 1 ρv2)r= . Squaring our result for the velocity on the2 ∞
sphere, setting u· r = ur cos θ, and simplifying we ﬁnd
ρu2
P =P +∞ 9 cos2 θ8 − 5 . (6.87)
This result for the pressure says that it is the same
(
on the fron
)
t and back of the sphere, since
its unchanged by taking θ→ π/2− θ. This is quite counterintuitive, since we expect a force
on the sphere in b) that would try to push it downstream. This actually results from our
approximation that the ﬂuid is ideal (viscosity can not be neglected when trying to answer
questions near surfaces).
Another possibility is that our approximation of potential ﬂow is suspect. To explore
this, lets ask how common is potential ﬂow? Consider
d
dv(dt ∇× v) =∇× ∂=dt ∇×
( v + v∂t ·∇v
)
, (6.88)
123


## Page 21

CHAPTER 6. FLUID MECHANICS
which expands into
∂ v(∂t ∇× v) +∇×
(
∇
( 2 ∂v2
)
− × (∇× v)
) Ω= )∂ − Ωt ∇× (v× = 0 (6.89)
where in the last step we used our result in Eq. (6.36) that we derived from the Euler
equation. Thus, ∇× v is conserved along ﬂow lines. If we consider a steady ﬂow which
starts out as uniform inﬁnitely far away, then there is no vorticity at inﬁnity, and
∇× v = 0 (6.90)
on every stream line, and remains that way for the entire ﬂow. Thus we have a potential
ﬂow with no vorticity.
If we wanted to get around the counterintuitive behavior we have found in our ideal
ﬂuid solution, but stick with the ideal ﬂuid framework, then we would have to allow for
the existence of discontinuous solutions. For an ideal ﬂuid ﬂowing past a sphere, we could
propose that stream lines exist that start tangential to the spherical surface, and hence
satisfy the boundary conditions, and can have ∇× v̸
= 0 since they are not connected to
inﬁnity. Behind the sphere we could then imagine having ﬂuid at rest.
The correct treatment of boundary layers near objects and of wakes, does not require
discontinuous solutions of this sort, but instead simply requires the inclusion of viscosity,
which we will turn to shortly, after treating one ﬁnal important example from ideal ﬂuids.
6.5 Sound Waves
In this section we will explore an example where ∇· v̸
= 0 plays an important role. To set
things up, consider a compressible ﬂuid at rest with pressureP0 and density ρ0 in equilibrium
with an external force density f0. IfP0 and ρ0 are constant and uniform, then
∇P0 f0=ρ0
(6.91)ρ0
124


## Page 22

CHAPTER 6. FLUID MECHANICS
from the Euler equation. Now lets add disturbances P′ and ρ′ to this system
P =P0 +P′, (6.92)
ρ = ρ0 + ρ′ , (6.93)
withP′≪P 0 and ρ′≪ ρ0. These disturbances will induce a velocity ﬁeld as well, v(r, t),
which we will also assume is small, so that perturbation theory applies. We will therefore
drop terms that are second order or higher in any of {P′, ρ′, v}. Using perturbation theory
on the Euler equation, that is
∂v0 = ρ ∂v+ ρ(v∂t ·∇)v +∇p− f0 =∇P0− f0 + ρ0 + .t ∇P′ + . . (6.94)∂
where we have dropped terms ρv·∇v =O(ρ0v2) andO(ρ′v). Using f0 =∇P0 then gives
∂v ′
= ∇P
∂t − (6.95)ρ0
as the Euler equation to 1 st order in perturbations. To the same order, continuity says
∂ρ′
= (∂t −∇· ρv) =−ρ0∇· v. (6.96)
where we have again dropped second order terms. Finally the appropriate thermodynamic
equation of state is ρρ′ 0=
′
BP (6.97)
where B is a constant known as the bulk modulus. The bulk modulus describes a substance’s
resistance to compression, and this formula arises from B = ρ ∂P ′
ρ∂ρ ≈ 0
P . Using this resultρ′
we can eliminate density ρ′ to get a second equation involving only the pressure and velocity
disturbances,
∂P′ B=∂t
∂ρ′
ρ0
=∂t −B∇· v (6.98)
Combining Eq. (6.95) and Eq. (6.98) we can derive a diﬀerential equation for the pressure
disturbance
∂2P′ ∂v=∂t2 −B∇· B=∂t
2
ρ0
∇P ′, (6.99)
which can be written more simply as
∂2P′
P =t − c2 2 ′
∂ 2 S∇ 0 (6.100)
which is a wave equation forP′, whose solutions move at a velocity cS =
√
B which is knownρ0
as the speed of sound. Due to the simple proportionality from the equation of state we also
immediately know that
∂2ρ′
c∂t2 − 2
S∇2ρ′ = 0 (6.101)
125


## Page 23

CHAPTER 6. FLUID MECHANICS
so the same wave equation also holds for the density.
It remains to derive a diﬀerential equation for the velocity. Taking the curl of Eq. (6.95)
yields
∂ 1(∂t ∇× v) =− (6.102)ρ∇ .
0
×∇P′ = 0
This means∇× v does not explicitly depend on time, so we can conveniently take∇× v = 0
initially everywhere, and hence for all times. Using Eq. (6.95) and Eq. (6.98) now gives
∂2v 1=∂t2 − ∂
ρ0
∇
( P′ B=∂t
)
(ρ0
∇∇· v) (6.103)
B=
B
(
2
ρ0
∇ v−∇× (∇× v)
)
= ∇2v ,ρ0
since (∇× v) = 0. This yields
∂2v =t − c2 2 v∂ 2 S∇ 0 (6.104)
which means that the velocity of the ﬂuid disturbance also satisﬁes the same wave equation.
The solutions are thus sound waves in pressure, density, and velocity, with speed cS. An
example of a solution is a plane wave (here written for pressure) which looks like
P′ =P′(r· nˆ− cSt) (6.105)
when traveling in the direction of nˆ.
Note that∇· v̸= 0 was important for this derivation. It is reasonable to ask if there is
a way that
we can determine when the approximation∇· v = 0 may be justiﬁed. For a ﬂow
with characteristic velocity v0 this can be done by deﬁning the Mach number
v0M = , (6.106)cS
since the scaling of terms involving ∇· v will be determined by this ratio. If M≪ 1 then
we can treat ﬂow as approximately incompressible, with ∇· v = 0.
Considering ﬂows with large values of M leads to the concept of shock waves. Consider a
ﬂow with initial velocity v0 in which there is a disturbance. If M < 1 then the ﬂow is said to
be subsonic, and the perturbation spreads everywhere, because the speed of the perturbation
is larger than that of the ﬂow.
126


## Page 24

CHAPTER 6. FLUID MECHANICS
On the other hand if M > 1, then the disturbance is swept downstream to the right by
the ﬂow, and actually propagates downstream within a cone of angle γ deﬁned by sin(γ ) =
cs/v0 = 1 , as shown below.M
If we consider a supersonic plane, then we should view this picture the other way around,
where the ﬂuid is static and the disturbance (plane) moves through it, traveling to the left
at faster than the speed of sound. This causes a sonic boom, which is the air pressure wave
given by the dashed lines trailing the plane, which moves at speed cS. (Another example is
thunder, where the rapid increase in temperature of plasma of ions causes rapid air expansion,
making a shockwave.)
6.6 Viscous Fluid Equations
Internal friction occurs in a ﬂuid when neighboring ﬂuid particles move with diﬀerent veloc-
ities, which means that ∂vi =∂xj
̸ 0. Viscous stresses oppose such relative motion. Adding these
127


## Page 25

CHAPTER 6. FLUID MECHANICS
friction terms changes some of our ﬂuid equations. In particular, the continuity equation re-
mains unchanged, while the Euler equations along with the conservation laws for momentum,
energy, and entropy must be modiﬁed.
To consider this friction we will work to ﬁrst order in the ∂vi partial derivatives, treating∂xj
these as the most important terms. These derivatives can be arranged into
σij = η
( ∂vi ∂vj+∂xj
2
∂xi
− δij∇· v
)
+ ζδ ij
3 ∇· v (6.107)
to deﬁne the viscous stress tensor with elements σij. The constant coeﬃcients of the two
terms are the shear viscosity η and the bulk viscosity ζ, where η > 0 & ζ > 0. The form of
the viscous stress tensor σij is dictated by the fact that it must vanish for constant v and for
uniform rotation v =ω× r where there is no friction. Writing out v = ωx(yzˆ− zyˆ) +. . . we
see that∇· v = 0 and ∂vz + ∂vy
∂y = 0, etc., for the uniform rotation, dictating the symmetric∂z
form of the terms in σij. The remaining organizational choice is to let η multiply a traceless
tensor.
Momentum conservation still comes from
∂ (ρv) + (6.108)t ∇· T = f∂
where now we include a friction term in the stress tensor to account for the viscous transfer
of momentum. Thus
Tij =Pδij + ρvivj− σij (6.109)
is the new total stress tensor.
A simple rule for incorporating σij is simply to replace Pδij→P δij− σij. With this we
can add friction to the Euler equation. In particular we have
∂(∇P)i = ∂δki
∂xk
P→ δ∂xk
(
kiP− σki
)
, (6.110)
where we can compute that
∂ ∂σki = η∂xk
( 2vi ∂+∂xk∂xk
2v∂xi
∇· − ∂
3
∂v∂xi
∇·
)
+ ζ v∂xi
∇·
= η∇2vi +
( ηζ + ∂
3
)
v∂xi
∇· . (6.111)
Plugging this into the Euler equation yields
∂v + (v∂t ·∇)v +∇P η
ρ − 2 1
ρ∇ v− ηζρ
(
+ f(3
)
∇∇· v) = (6.112)ρ
which is the Navier-Stokes equation.
128


## Page 26

CHAPTER 6. FLUID MECHANICS
A common case we will study is when f = 0 &∇· v = 0, which reduces the Navier-Stokes
equation to
∂v + v∂t ·∇v = ∇P− + νρ ∇2v (6.113)
where
ην≡ (6.114)ρ
is the kinematic viscosity, and the bulk viscosity term has dropped out. The dimensions of
the kinematic viscosity are [ ν] = m2/s, which is simpler than [ η] = kg/(ms).
Other useful equations can be derived for the situation where ∇· v = 0 & ρ is constant.
Taking the divergence of the Navier-Stokes equation removes both the ∂v/∂t term, and the
ν∇2v term, leaving ρ∇· [(v·∇)v ] =−∇2P. Writing this out in components we ﬁnd
∇2 ∂P =−ρ ∂vi
∂xj
∂vvj =∂xi
− iρ ∂vj
∂xj
, (6.115)∂xi
since ∂vj/∂xj =∇· v = 0. This equation can be used to compute the pressure if the velocity
is determined, since it simply acts like a source term. Taking the curl of the Navier-Stokes
equation, and recalling that Ω =∇× v we ﬁnd
∂Ω (t − Ω =∂ ∇× v× ) ν∇2Ω , (6.116)
where the algebra to arrive at the terms on the LHS was consider earlier in our discussion
of the Euler equation, and the new pieces is the term on the RHS.
In the presence of viscosity the boundary conditions change from what we had previously.
Molecular forces between the viscous ﬂuid & any surface mean that the ﬂuid adheres to the
surface, and hence that the velocity of the ﬂuid and surface must be the same for both the
tangential and longitudinal components. Therefore the boundary condition for a moving
wall is v = vwall, which also covers the case v = 0 for a wall at rest.
Another important concept is the force exerted by the ﬂuid on a surface. This has a
contribution both from the pressure as well as from the friction. The force per unit area Fi
is given by
Fi =−nj(Pδji− σji) =−Pni + σijnj , (6.117)
where nˆ is the normal vector pointing out of the surface, and the ﬁrst term is the pres-
sure acting along this normal vector, while the second is the friction that has tangential
components.
Starting with the Navier-Stokes equation we can also derive a modiﬁed form for energy
conservation. Rather than carrying out this derivation explicitly, we will just examine the
ﬁnal result in integral form, which is a bit more intuitive:
∂
1
∂t
∫
V
( 2
2 vρv2
)
dV =−
∮
∂V
(
ρ
(
+P
2
∂vρ
)
i− vjσji
)
dSi−
∫ viσij
V
dV . (6.118)∂xj
129


## Page 27

CHAPTER 6. FLUID MECHANICS
Here the term on the LHS is the change of the kinetic energy in the volume V with time.
The ﬁrst integral on the RHS is the energy ﬂux through the closed bounding surface ∂V ,
and the second integral is the decrease in energy that is caused by dissipation. To see this
even more clearly we can consider integrating over the whole ﬂuid with v = 0 at∞ (or on
∂V ). This removes the ﬂux term and leaves
∂E ∂=∂t −
∫
η
V
( vi ∂vj+∂xj
) ∂vi
∂xi
ηdV =∂xj
− ∂
2
∫
V
( vi ∂vj+∂xj
<∂
)2
dV 0 . (6.119)xi
where we can check the second equality by squaring and manipulating the summed over
dummy indices i and j. Thus we see that friction causes energy to dissipate just as we would
expect (and this also justiﬁes our sign choice of η > 0).
˙Entropy conservation is modiﬁed at temperature T to ρT S = σ ∂vi
ij
, where the left-hand∂xj
side of the equation is the heat gain per unit volume, and the right-hand side of the equation
is the energy dissipated by viscosity. (If we allow thermal conduction (from temperature
gradients) in the ﬂuid, then there is another term on the right-hand side that appears as
∇· (κ∇T ) for conductivity κ.)
6.7 Viscous Flows in Pipes and Reynolds Number
We start our investigation of ﬂuid ﬂow with viscosity, by studying steady ﬂows in pipes,
typically caused by a pressure gradient. This type of steady viscous ﬂow is also called
Poiseuille ﬂow, after Jean Poiseuille who ﬁrst studied them experimentally. We take the ﬂow
to be incompressible,∇· v = 0, and hence the continuity equation implies that ρ is constant
(just as it did in the ideal ﬂuid case). Thus the Navier-Stokes equation for such ﬂows reduces
to
v·∇v = ∇P−
+ νρ ∇2v (6.120)
Example Lets start by considering ﬂow in a long rectangular duct, aligned with the x-axis,
with height h and width w. We also take it be a thin duct with h≪ w, and with a pressure
gradient along the pipe in the x-direction.
130


## Page 28

CHAPTER 6. FLUID MECHANICS
This can be approximated by inﬁnite parallel plates, taking w→∞ and holding h ﬁxed.
Here
v = vx(y) x,ˆ (6.121)
since there is no dependence on x or z by the translational symmetry in the plane, and we
equally well can not develop velocity components vy or vz due to this symmetry. This implies
that the term v·∇v = v ∂v
x = 0 Taking the inner product of Eq.(6.120) with yˆ and zˆ then∂x
remov
es all the terms that depends on the velocity (which is only in the xˆ direction), giving
∂P ∂= P
∂y = 0 . (6.122)∂z
Thus the pressure P =P(x) and can have a gradient only in the xˆ direction. Taking the
inner product of Eq.(6.120) with xˆ gives
∂P ∂2
= ρν∂x ∇2 vxvx = η = k , (6.123)∂y2
where we have introduced a constant k. Since ∂P 2
only depends on x, while η ∂ v x
∂x only∂y2
depends on y, they must both be equal to a constant. Let us say ∂P = k < 0, so that the∂x
pressure drops as we move in the xˆ direction. (In the Navier-Stokes equation, this pressure
drop balances the viscous stress term.) Then integrating the equation for vx(y) gives
kvx(y) = y2 + ay + b , (6.124)2η
where we have introduced two integration constants a and b. To solve for a and b we impose
the boundary conditions that the velocity must vanish at y = 0 and y = h, giving
( )
x(y) = −kv y(h2η − y) . (6.125)
Recalling that k < 0 we see that vx(y) > 0, ﬂowing down the pipe. (If we had reversed k
the ﬂow would be in the opposite direction.) The velocity ﬁeld we have derived ﬂows in the
pipe with a parabolic proﬁle with its maximum in the center:
131


## Page 29

CHAPTER 6. FLUID MECHANICS
Lets also calculate the friction force per unit area that the ﬂuid exerts on the pipe wall.
The bottom plate at y = 0 has a unit vector nˆ = yˆ, so from Eq. (6.117) the force along xˆ is
∂vF x
x = σyx = η hk
y
∂y| =0 =− > 0. (6.126)2
Intuitively this is the direction we expect, the ﬂuid tries to drag the pipe along with it.
Example Lets now consider the same example of ﬂuid between inﬁnite parallel plates, but
now with no pressure gradient. Instead we take the top plate to move with velocity u = uxˆ.
HereP =P0 is constant and uniform with k = 0, so the second derivative of vx(y) is zero,
∇2vx = 0, and the solution for vx(y) can at most be linear. The solution for this case is
vx(y) = uy, which satisﬁes the boundary conditions vx(0) = 0 and vx(h) = u. Thus theh
ﬂuids velocity ﬁeld is linear for this case:
Example Next consider a long cylindrical pipe of radius L, oriented along xˆ, again with a
pressure gradient along the pipe. We will approximate the pipe as being inﬁnitely long so
there is a translational symmetry along x.
Due to the translational symmetry we know that v = v(y, z). To fully exploit the conse-
quences of the symmetry it is useful to use cylindrical coordinates (x, r, θ ) so we can also
easily impose the rotational symmetry about xˆ to conclude v = v(r). The fact that there is
132


## Page 30

CHAPTER 6. FLUID MECHANICS
r dependence makes sense since we know that v must vanish at the edge of the pipe, r = L,
but we do not want it to vanish everywhere. Continuity and symmetry also imply that the
velocity is only in the xˆ direction, so in fact
v = vx(r)xˆ . (6.127)
For example, consider an annulus shaped closed surface formed by the region between two
cylinders cocentric with the pipe. The ﬂow into and out of this surface must be balanced
by continuity. The ﬂow on the ends of the surface automatically balance each other since v
is independent of x. But since v is r dependent, the only way the ﬂow through the circular
sides can balance each other is if there is no ﬂow in the rˆ direction.
With this setup we can again conﬁrm that (v ·∇ )v = vx(r) ∂
vx(r)xˆ = 0, leaving∂x
∇P = η∇2v from the Navier-Stokes equation. Taking the inner product with yˆ and zˆ
we see that ∂P = ∂
∂y
P = 0, so∂z P =P(x). Taking the inner product with xˆ gives
∂P(x) = η∂x ∇2vx(r) = k (6.128)
where since ∂P depends only on x while η∇2vx(r) is independent of x, the two must be equal∂x
to a constant k. Again we choose k < 0 to have a pressure gradient that pushes the ﬂuid
down the pipe in the xˆ direction (k > 0 would simply reverse the ﬂow). For the velocity this
gives
1 ∂
r
∂r∂r
( vx k=∂r
)
, (6.129)η
and integrating this gives
kvx(r) = rr2 + a ln4η
(
+r0
)
b (6.130)
for some constants a and b. (The constant r0 is introduced to make the equation dimension-
fully correct, but is not independent, since any change to r0 can be compensated by a change
to b). Since vx(r) has to be ﬁnite at r = 0 we must have a = 0 (if the geometry excluded
the region at the middle ). The condition vx = 0 at r = L ﬁxes b so that
( )vx r) = −k( .4
(
L2 2
η − r
)
(6.131)
Lets calculate the discharge rate of ﬂuid in such a pipe, as mass per unit time. This is given
by
discharge rate = ρ
∫ L πkL4
2πrvx(r) dr =
0
−
> 0 . (6.132)8ν
Note that this rate is quite sensitive to the radius, being proportional to L4. This is why
you don’t want narrow blood vessels.
133


## Page 31

CHAPTER 6. FLUID MECHANICS
Reynolds Number and Similarity
How do we quantify the importance of viscosity? Let us consider a ﬂow and identify a
characteristic length L (examples of which might be the radius of a pipe or the size of a
sphere inserted in a ﬂow) and a characteristic speed u (examples of which might be the ﬂuid
velocity in the middle of a pipe or the ﬂuid velocity upstream from ﬂow around a sphere).
The quantity
uLR = ρuL=ν (6.133)η
is the dimensionless Reynolds number. A large R means viscosity is not as important com-
pared to the characteristic u and L of the system, while small R means that viscosity plays
an important role. It is important to note that viscosity is always important near a surface
where it modiﬁes the boundary condition on v. (The above examples of Poiseuille ﬂow have
R ≲ 2000.)
The introduction of R leads nicely into a discussion of the utility of exploiting dimensional
analysis in ﬂuid dynamics problems. This is best explained by way of examples.
Example Consider a steady incompressible ﬂow in a system that is characterized by a single
length scale L and initial velocity u. What could the possible functional form be for the
velocity and pressure in such a system? Considering the coordinates and ﬂuid ﬁeld variables
we can only have
v
r= hu
(
, RL
)
, P r= gρu2
(
, RL
)
. (6.134)
Here h and g are a dimensionless vector and scalar function respectively. The ratio r/L
is dimensionless, as is R, and the dimensions of u andP are compensated by u and ρu2
respectively. Note that if we consider ﬂows that have the same R, then the properties of
those ﬂows are related by changes to the scales associated with v, r, orP. Such ﬂows are
called similar.
Example Consider a viscous ﬂow past a sphere of radius a with initial velocity given by
lim u
x v = uxˆ. Here the Reynolds number is R =→−∞ ν. If we double ν and double u then Ra
is unchanged. Due to the relations in Eq. (6.134) we thus can predict that we will have the
exact same form for the solutions with v twice as large as before, andP being four times as
large as before.
Note that in general other dimensionless ratios, like the ratio of two length scales, or the
Mach number M = u could also appear. (For M e
S
≪ 1 w treat the ﬂuid as incompressiblec
and neglect M for the dimensional analysis.) To determine how many independent dimen-
sionless ratios can be formed for the analysis of a general dimensional analysis problem, one
counts the number of variables and subtracts the number of unrelated types of dimensions
that appear in these variables. For most ﬂuid problems this will mean subtracting three for
kg, meters, and seconds.
134


## Page 32

CHAPTER 6. FLUID MECHANICS
6.8 Viscous Flow Past a Sphere (Stokes Flow)
Lets consider a steady, incompressible, viscous ﬂuid with small R ﬂowing past a sphere of
radius a. The ﬂuid has velocity u when it is far away from the sphere. This is the same
problem we treated for an ideal ﬂuid with potential ﬂow, but now we want to consider the
impact of viscosity, and resolve the puzzle we found in our solution for an ideal ﬂuid. To
make the problem solvable we work in the limit R≪ 1.
Here the Navier-Stokes equation is
v·∇v = ∇P− ρ + η 2
ρ∇ v . (6.135)
Lets determine the relative importance of the two velocity terms in the R≪ 1 limit. Using
a to characterize spatial variations, and u to characterize velocity we ﬁnd
2
v ∇v =O
(u· η,a
)
2
ρ∇ v =O
(ηu u=ρa2
)
O
( 2
. (6.136)aR
Therefore the viscosity term, which is enhaced by a factor of 1/R , domina
)
tes. Neglecting
the v·∇v term, the Navier-Stokes equation reduces to
∇P = η∇2v . (6.137)
Note that when written in terms of the shear viscosity η, that the density ρ has dropped out
of this equation, and hence the constant ρ will not play a part in the solution. Taking the
divergence of this equation we ﬁnd ∇2P = η∇2∇· v = 0, so the pressure satisﬁes Laplace’s
equation. Using dimensional analysis for the pressure we expect a solution of the form
ηuP = · r rga2
(
,a
)
(6.138)
where the dimensional analysis requirement of having only a single factor of the velocity u
and a scalar result, leads to including the factor of u· r. Note that we have not included R
as a possible argument since we are expanding with R≪ 1. Due to the fact that P must
satisfy Laplace’s equation and is proportional to u· r, we can immediately recognize the
dipole solution (which we met earlier for the potential φ in the ideal ﬂuid case):
ηau rP =P0 + k · . (6.139)r3
Here we have included an overall constant pressureP0 to satisfy any boundary condition on
the pressure at r→∞, and a dimensionless constant k which is still to be determined.
Next we note that the vorticity of the ﬂuid satisﬁes
1∇× Ω =∇× (∇× v) =∇(∇ · v)−∇ 2v =−∇2v =− η∇P
ka=− 3(ur3
( u· r)r− .r2
)
(6.140)
135


## Page 33

CHAPTER 6. FLUID MECHANICS
Enforcing that Ω vanishes as r→∞, the solution for this equation is
uΩ = ka × r . (6.141)r3
Thus we see that unlike the ideal ﬂuid case, there is now a non-zero vorticity in the ﬂuid
here.
Next we turn to determining the velocity, which can only depend onv = v(r, u, a). Again
we do not
include R as an argument since we are expanding for R≪ 1. By dimensional
analysis the velocity must be linear in u so the most general possible solution takes the form
v = u f
(r r+a
) (u· r) rga2
(
,a
)
(6.142)
where the functions f and g are dimensionless. The gradient of one of these dimensionless
functions gives∇f(r/a) = (r/(ar))f′(r/a). Computing the divergence of the velocity with
this form we have
u r0 =∇· v = · rf′
ar
( (+a
) u· r)r rg′
a3
( 4(+a
) u· r) rga2
(
.a
)
(6.143)
Therefore we ﬁnd that the scalar functions must satisfy
f′
(r r=a
) 2
− rg′
a2
( 4
a
) r− rga
(
.a
)
(6.144)
Next we equate the Laplacian of the velocity and gradient of the pressure, which can be
simpliﬁed to give
2 g∇ v =
(
2 2∇ f + 4ua2
)
+
(
∇2 g′
g + (
ar
) u· r)r
a2
1= ka=η∇P 3u +r3
( ka3
− (
r5
) u· r)r . (6.145)a2
Note that here∇2g(r/a) = (1/r2)(d/dr)r2(d/dr)g(r/a). Equating the coeﬃcients of the two
structures we ﬁnd
2 4g′
∇ g + g′′
=ar
6g′
+a2
3ka3
=ar − ,r5
f′′ 2f′
+a2
2g+ar
ka=a2 . (6.146)r3
To solve the equation for g we try a polynomial solution of the form g(x) = Cnxn giving
Cn
[
n(n− 1) + 6n
]
xn−2 =−3kx−5 . (6.147)
Here n =−3 is a particular solution to the full inhomogeneous equation with C 3 = k/2.−
Also n = 0 and n = −5 are homogeneous solutions where the LHS vanishes, and the
136


## Page 34

CHAPTER 6. FLUID MECHANICS
corresponding coeﬃcients C0 and C5 must be ﬁxed by boundary conditions. Looking back
at our starting point in Eq. (6.142) we see that the full set of boundary conditions are
v = u at r =∞ : lim r2g(r/a) lim
→∞
→ 0 , f(r/a)
r r→∞
→ 1 ,
v = 0 at r = a : g(1) = 0 , f(1) = 0 , (6.148)
This ﬁxes C0 = 0 and C−5 =−k/2 so that
ka3
g(r/a) = a12r3
( 2
− .r2
)
(6.149)
Using Eq. (6.144) and integrating once we ﬁnd that
kaf(r/a) = ka3
+2r , (6.150)6r3
where we have set the integration constant to zero to satisfy the boundary condition at
r =∞. The ﬁnal boundary condition, f(1) = 1 then requires us to take the constant
k =−3/2. Note that this ﬁxes the constant k that appeared in the vorticity Ω and in the
pressureP. All together we have that the ﬁnal solution for the velocity is
av u
( 3= 1 − a3
4r− 3
4r3
) a3
− r(u
4r3
· r) a1a2
( 2
− .r2
)
(6.151)
The ﬂow looks like:
Next we turn to determining the drag force on the sphere. In general the drag force on
an object in the direction j is given by an integral of the force per unit area over the surface,
FDj =
∫
d
∂V
Si (Pδij− σij) . (6.152)
Lets take the inﬂowing velocity to be in the xˆ direction, v(r→∞) = uxˆ. Then FD· xˆ
will be the drag force on our sphere in the direction of the bulk ﬂuid ﬂow. With spherical
coordinates (r, θ, φ) where θ is the polar angle, we have dS = rˆa2d cos θdφ with r = a, as
ˆwell as rˆ· xˆ = cos θ and θ· xˆ =− sin θ. Thus
xˆ· F = a2
D
∫
dcos θ dφ
(
−P cos θ + σrr cos θ− σrθ sin θ
)
. (6.153)
137


## Page 35

CHAPTER 6. FLUID MECHANICS
Computing the needed components on the sphere r = a we ﬁnd
∂vrσrr = 2η 1=∂r
⏐⏐
⏐⏐ 0 , σ rθ = η
r=a
(
∂vr
r
∂vθ+∂θ
v
∂r − θ 3=r
)
r=a
−
( η
3
)
u sin θ ,2a
P =P0−
( η
2
)
u cos θ . (6.154)a
Thus the drag force on the sphere is
xˆ· FD =
(3ηu dcos θ dφ a2 = (6πηa)u , (6.155)2a
)∫
which is the famous Stoke’s formula for the viscous (friction) drag force on a sphere. (Note
that we could have obtained the factor of ηau by dimensional analysis.)
In addition to drag forces like this, that point in the direction of the ﬂuid ﬂow, objects
may also experience lift forces that are tangential to direction of the ﬂuid ﬂow. Such forces
occur for wing-shaped objects and are important for many physical phenomena, including
lift on airplanes.
Dynamic Vortices and Turbulence
For our ﬂow about the ﬁxed sphere, lets consider what happens as we increase R. From
our analysis above it is clear that at some point the non-linear v·∇v term we dropped
will become important. The ∂v/∂t will also become important, with ﬂows that are more
dynamical, changing with time. Lets consider how the ﬂow appears for various values of R:
• For R≪ 1, the ﬂow is symmetric and is (somewhat counter intuitively) qualitatively
like the case of η→ 0. This is also called “Stokes ﬂow” or a “laminar ﬂow”.
• For R≈ 1, the ﬂow is still like Stokes ﬂow, but the stream lines are no longer as
symmetric, with a more clear wake developing behind the sphere.
138


## Page 36

CHAPTER 6. FLUID MECHANICS
• For 10 ≲ R ≲ 100, detached vortices called eddies form behind the sphere, though
the ﬂow is still steady. Note that directly behind the sphere between the vortices
that the ﬂuid is now ﬂowing in the opposite direction to the asymptotic inﬂow u.
As R increases, the ﬂo
w becomes looses its steady nature, with the time dependence
emerging by having through oscillations of the vortices.
• For 150 ≲ R ≲ 1000, vortices start to be cyclically shed and drift downstream in a
wake behind the sphere. This time dependent solution appears like it has interaction
between the eddies, where one pair pushes the next downstream.
• For 103 ≲ R ≲ 2× 105, the wake becomes highly irregular, exhibiting a phenom-
ena known as turbulence which we will discuss in more detail below. Here there are
unsteady, interacting vortices at all length scales.
139


## Page 37

CHAPTER 6. FLUID MECHANICS
• For R ≳ 2×105, the turbulent wake narrows and the boundary layer around the sphere
is no longer laminar, also becoming turbulent.
Turbulence is characterized by a ﬂow that: i) is highly irregular (technically chaotic) in
x and/or t, ii) has nonzero vorticity, iii) has much greater dissipation of energy compared
to more uniform laminar
viscous ﬂows, and iv) has eddies and vortices forming over many
length scales with energy that in a three dimensional ﬂow cascades from the largest eddies
down to the smallest eddies where it dissipates into heat due to viscous friction. Turbulent
mixing is a very eﬀect mechanism of transport for energy, momentum, temperature, and so
on. Examples of turbulence include many familiar phenomena: the circulation of air in the
atmosphere, the water ﬂow from a faucet which becomes white at a certain point when the
ﬂow rate is increased, water in rapids, dust kicked up by wind, water beside a ship moving
in an otherwise smooth lake, clear air turbulence causing a drop in lift for airplanes, and so
on.
In the last value of R discussed for ﬂow around our shere, a turbulent boundary layer
appeared. This causes an abrupt drop in drag in the ﬂow over objects, and is a very
useful phenomena. In particular, by introducing imperfections we can cause this turbulent
boundary layer to form at smaller values R, meaning smaller velocities. This is why golf
balls have dimples and baseballs and tennis balls have visible seams.
We also get turbulence in ﬂow through pipes at large R. The viscous ﬂow in pipes we
previously considered were laminar ﬂow at smaller R values and had velocity distributions
140


## Page 38

CHAPTER 6. FLUID MECHANICS
that were parabolic, while in contrast a turbulent ﬂow will be non-uniform at small scales,
but when averaged causes a more uniform ﬂow down the pipe at larger length scales.
In general the chaotic and irregular nature of turbulence makes it diﬃcult to treat with
analytic methods, and a complete description of turbulence remains an unsolved problem.
141


## Page 39

MIT OpenCourseWare
https://ocw.mit.edu
8.09 Classical Mechanics III
Fall 2014
For information about citing these materials or our Terms of Use, visit: https://ocw.mit.edu/terms.
