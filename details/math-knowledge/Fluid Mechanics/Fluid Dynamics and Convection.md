# 12.006J F2022 Lectures 17–18: Fluid Dynamics and Rayleigh-Benard Convection

Converted from: `Fluid Mechanics\Fluid Dynamics and Convection.pdf`


## Page 1

Lecture notes for 12.006J/18.353J/2.050J, Nonlinear Dynamics: Chaos
D. H. Rothman, MIT
October 24, 2022
Contents
1 Fluid dynamics and Rayleigh-B´ enard convection 1
1.1 The concept of a continuum . . . . . . . . . . . . . . . . . . . 2
1.2 Mass conservation . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.3 Momentum conservation . . . . . . . . . . . . . . . . . . . . . 5
1.3.1 Substantial derivative . . . . . . . . . . . . . . . . . . . 5
1.3.2 Forces on ﬂuid particle . . . . . . . . . . . . . . . . . . 7
1.4 Nondimensionalization of Navier-Stokes equations . . . . . . . 9
1.5 Rayleigh-B´ enard convection . . . . . . . . . . . . . . . . . . . 11
1.6 Rayleigh-B´ enard equations . . . . . . . . . . . . . . . . . . . . 16
1.6.1 Dimensional form . . . . . . . . . . . . . . . . . . . . . 16
1.6.2 Dimensionless equations . . . . . . . . . . . . . . . . . 16
1.6.3 Bifurcation diagram . . . . . . . . . . . . . . . . . . . 17
1.6.4 Convection in the Earth . . . . . . . . . . . . . . . . . 18
1 Fluid dynamics and Rayleigh-B´ enard convection
Reference: Tritton [1]
In these lectures we derive (mostly) the equations of ﬂuid dynamics. We
then show how they may be generalized to the problem of Rayleigh-B´ enard
convection—the problem of a ﬂuid heated from below. Later we show how
the RB problem itself may be reduced to the famous Lorenz equations.
Some topics to be discussed:
• The Navier-Stokes equations
• Reynolds number
1


## Page 2

• RB convection
• Rayleigh number
Thus far we have dealt almost exclusively with the temporal behavior of a
few variables.
In these lectures we digress, and discuss the evolution of a continous ﬁeld in
space and time.
Aside from the central role played by research in ﬂuid turbulence and RB
convection in the development of the theory of chaos, we have another mo-
tivation: an appreciation of a hierarchy of mathematical descriptions of dy-
namical systems, ranging from pde’s to ode’s to discrete maps.
1.1 The concept of a continuum
Real ﬂuids are made of atoms or molecules. We could in principle write ordi-
nary diﬀerential equations for the position and momentum of each particle.
But then we’d have∼1023 equations! The concept of a continuum allows us
to write a partial-diﬀerential equation instead.
We proceed to describe the essential assumption that makes this possible.
Consider the following macroscopic length scales in a ﬂow:
3
U
l
l
l
1 2
In adddition to the length scales li above, we deﬁne
• Lhydro: the smallest characteristic length scale of macroscopic motions.
2


## Page 3

• the mean free pathℓmfp: the characteristic length scale between molecular
collisions.
Fluids may be regarded as continuous ﬁelds if
Lhydro≫ℓmfp.
When this condition holds, the evolution of the macroscopic ﬁeld may be
described by continuum mechanics, i.e., partial diﬀerential equations.
To make this idea clearer, consider a thought experiment in which we measure
the density of a ﬂuid over a length scale ℓ using some particularly sensitive
device. We then move the device in thex-direction over a distance of roughly
10ℓ.
Suppose ℓ∼L1∼ℓmfp. Then we expect the density to vary greatly in space
as in Figure (a) below:
(a) (b) (c)
hydrox/L x/L x/L1
density
2
We expect that the ﬂuctuations in (a) should decrease asℓ increases. ( Statistics
tells us that these ﬂuctuations should decrease like 1/N1/2, where N∝ℓ3 is the average number of
molecules in a box of size ℓ. )
On the other hand, if ℓ∼Lhydro (see (c)), variations in density should reﬂect
density changes due to macroscopic motions (e.g., a rising hot plume), not
merely statistical ﬂuctuations.
Our assumption of a continuum implies that there is an intermediate scale,
ℓ∼ L2, over which ﬂuctuations are small. Thus the continuum hypothesis
3


## Page 4

implies a separation of scales between the molecular scale,L1∼ℓmfp, and the
hydrodynamic scale, Lhydro.
The motion of the continuum is expressed by partial diﬀerential equations for
evolution of conserved quantities. We begin with the conservation of mass.
1.2 Mass conservation
Let
ρ = density
⃗ u= velocity
}
of a macroscopic ﬂuid particle
Consider a volume V of ﬂuid, ﬁxed in space:
V
d
S
u
d⃗ sis an element of the surface, |d⃗ s|is its area, and it points in the outward
normal direction.
⃗ uis the velocity.
The outward mass ﬂux through the element d⃗ sis
ρ⃗ u· d⃗ s.
Therefore,
rate of mass loss from V =
∫
s
ρ⃗ u· d⃗ s.
The total mass in V is ∫
V
ρdv
Thus the rate of mass loss may be rewritten as
− d
dt
∫
V
ρdv =−
∫
V
∂ρ
∂t dv = +
∫
s
ρ⃗ u· d⃗ s
4


## Page 5

Shrinking the volume, we eliminate the volume integrals and obtain
∂ρ
∂t =− lim
V→0
[∫
ρ⃗ u· d⃗ s/V
]
.
Recall that the RHS above is the deﬁnition of the divergence operator. We
thus obtain ∂ρ
∂t =−⃗∇· (ρ⃗ u)
We see that to conserve mass, a net divergence creates a corresponding change
in density.
For incompressible ﬂuids,
ρ∼ constant.
(This result is not an assumption, but instead derives from the assumption that the Mach number,
the square of the ratio of the ﬂuid velocity to the speed of sound, is much less than unity. )
Then
⃗∇· ⃗ u= 0.
which is the equation of continuity for incompressible ﬂuids.
1.3 Momentum conservation
We seek an expression of Newton’s second law:
d
dt(momentum of ﬂuid particle) = force acting on ﬂuid particle (1)
1.3.1 Substantial derivative
We ﬁrst focus on the LHS of (1).
There is a conceptual problem: d
dt(particle momentum) cannot be given at a
ﬁxed location, because
• the momentum ﬁeld itself changes with respect to time; and
5


## Page 6

• ﬂuid particle can change its momentum by ﬂowing to a place where the
velocity is diﬀerent.
To better understand this problem physically, consider how a scalar property—
the temperature T —of a ﬂuid particle changes in time.
A small change δT is produced by small changes δt in time and δx,δy,δz in
the position of the ﬂuid particle:
δT = ∂T
∂tδt +∂T
∂xδx +∂T
∂yδy +∂T
∂zδz
Divide by δt to obtain the rate of change:
δT
δt = ∂T
∂t +∂T
∂x
δx
δt +∂T
∂y
δy
δt +∂T
∂z
δz
δt
In the limit δt→ 0,
δx
δt →ux, δy
δt→uy, δz
δt→uz
The rate of change of T of a ﬂuid particle is then
DT
Dt = ∂T
∂t +ux
∂T
∂x +uy
∂T
∂y +uz
∂T
∂z
= ∂T
∂t +⃗ u· ⃗∇T
where D
Dt = ∂
∂t +⃗ u· ⃗∇
is the substantial derivative or convective derivative operator.
Thus we see that the temperature of a ﬂuid particle can change because
• the temperature ﬁeld changes “in place” (via ∂/∂t); and
• the particle can ﬂow to a position where the temperature is diﬀerent (via
⃗ u·⃗∇).
6


## Page 7

Note that the same analysis applies to vector ﬁelds such as the velocity ⃗ u:
D⃗ u
Dt = ∂⃗ u
∂t + (⃗ u· ⃗∇)⃗ u
Therefore the velocity ⃗ uenters D⃗ u/Dtin 2 ways:
• ⃗ uchanges (in place) as the ﬂuid moves (∂/∂t)
• ⃗ ugoverns how fast that change occurs (⃗ u·⃗∇).
This dual role of velocity is the essential nonlinearity of ﬂuid dynamics and
thus the cause of turbulent instabilities.
We can now express the rate-of-change of momentum per unit volume (i.e.,
LHS of (1)):
ρD⃗ u
Dt =ρ∂⃗ u
∂t +ρ(⃗ u· ⃗∇)⃗ u
ρ is outside the diﬀerential because a ﬂuid particle does not lose mass. Density changes thus mean
volume changes, which are irrelevant to the momentum change of that particle. Above we have
written the (rate of change of momentum) per unit volume, which need not be equal to the rate of
change of (momentum per unit volume).
1.3.2 Forces on ﬂuid particle
To obtain the full dynamical equation, we need the RHS of
ρD⃗ u
Dt = Force acting on ﬂuid particle / unit volume .
These forces are
• body force (i.e., gravity)
• pressure
• viscous friction (internal stresses)
7


## Page 8

Body force: We represent the externally imposed body force (per unit volume)
by ⃗F .
Pressure: Fluid ﬂows from high to low pressure. Thus
pressure force
unit volume = −∂p
∂x in 1-D
= −⃗∇p in 3-D
Viscous friction: Viscous stresses are the source of dissipation in ﬂuids. They
resist relative movements between ﬂuid particles.
For example, the shear ﬂow
y
x
u
u
is resisted more by high viscosity ﬂuids than low viscosity ﬂuids.
This resistance derives from molecular motions. ( A nice analog is Reif’s picture of
two mail trains, one initially fast and the other initially slow, that trade mailbags.)
In the simple shear ﬂow above, random atomistic motions result in a ﬂux of
x-momentum in the y-direction.
In Newtonian ﬂuids, this ﬂux, which we call Pxy, is proportional to the ve-
locity gradient:
Pxy =−η∂ux
∂y
whereη is called the dynamic viscosity. η has units of mass/(length× time).
The shear stress can occur at any orientation. Analogous to the 1-D Newto-
8


## Page 9

nian condition above, we deﬁne the viscous momentum ﬂux
Pij =−η∂ui
∂xj
.
The conservation of momentum requires that the divergence of the momen-
tum ﬂux Pij be balanced by a change in the momentum of a ﬂuid particle.
Loosely stated,
∂(ρui)
∂t
⏐⏐
⏐
⏐
viscous
=−⃗∇· Pij =−
∑
j
∂
∂xj
Pij =η
∑
j
∂2
∂x2
j
ui
We thus ﬁnd that viscous force
unit volume =η∇2⃗ u.
(A careful derivation requires consideration of the tensorial relationship between viscous stress and
the rate of deformation.)
Newton’s second law then gives theNavier-Stokes equation for incompressible
ﬂuids:
ρ∂⃗ u
∂t +ρ(⃗ u· ⃗∇)⃗ u
  
(mass per unit vol) ×acceleration
= −⃗∇p +η∇2⃗ u  
stresses on ﬂuid element per unit vol
+ ⃗F
body force per unit vol
Incompressibility arose from our negelect of compressive forces on ﬂuid ele-
ments.
1.4 Nondimensionalization of Navier-Stokes equations
Deﬁne the characteristic length scale L and velocity scale U. We obtain the
non-dimensional quantities
x′ = x
L, y ′ = y
L, z ′ = z
L
⃗ u′ = ⃗ u
U, t ′ =tU
L, p ′ = p
ρU 2
9


## Page 10

The dynamical equations (without body force) become
⃗∇′·⃗ u′ = 0
∂⃗ u′
∂t′ + (⃗ u′·⃗∇′)⃗ u′ =−⃗∇′p′ + 1
Re∇′2⃗ u′
where
Re = Reynolds number = ρUL
η
is the dimensionless control parameter.
The Reynolds number quantiﬁes the relative importance of the nonlinear term
to the viscous term. To see why, note the following dimensional quantities:
|ρ⃗ u· ⃗∇⃗ u| ∼ρU 2
L nonlinearity
|η∇2⃗ u| ∼ηU
L2 dissipation
Their ratio is
|ρ⃗ u·⃗∇⃗ u|
|η∇2⃗ u|∼ ρUL
η = Reynolds number
High Re is associated with turbulence (i.e., nonlinearities). Low Re is asso-
ciated with laminar or creeping ﬂows dominated by viscous friction.
Note that as long as Re remains the same, the dimensional parameters like
U and L can change but the the ﬂow (i.e., the equation it solves) does not.
This is dynamical similarity.
An example is running vs. swimming:
(η
ρ
)⏐⏐
⏐
⏐
air
= 0.15 cm2/sec and
(η
ρ
)⏐
⏐
⏐
⏐
water
= 0.01 cm2/sec
On the other hand, comparing 100 meter world records,
Urun ∼ 104 cm
10 sec = 103 cm/sec
Uswim ∼ 104 cm
50 sec ∼ 2× 102 cm/sec
10


## Page 11

TakingL∼ 100 cm,
Re(swim)∼ 2× 104 and Re(run) ∼ 6× 103
Thus for both swimming and running, Re ∼ 104, well into the turbulent
regime. Surprisingly, despite the slower speed of swimming, Re(swim) is
somewhat greater.
Another example: bacteria swimming in water is roughly like us swimming in
molasses, since the the small size and slow speed of bacteria would correspond
to a larger and faster body in a more viscous ﬂuid.
1.5 Rayleigh-B´ enard convection
In a thermally expansive ﬂuid, hot ﬂuid rises.
R-B convection concerns the study of the instabilities caused by rising hot
ﬂuid and falling cold ﬂuid.
Typically, ﬂuid is conﬁned between two horizontal, heat-conducting plates:
T=T 0 + δ T T=T 0 + δ T
dg
T=T 0 (cold)
fluid
temperature
pure
conduction
T0
(hot)
In the absence of convection—the transport of hot ﬂuid up and cold ﬂuid
down—the temperature gradient is constant.
Two cases of interest:
• δT small: no convective motion, due to stabilizing eﬀects of viscous
friction.
11


## Page 12

• δT large: convective motion occurs.
How large is a “large δT ” ? We seek a non-dimensional formulation.
The following ﬂuid properties are important:
• viscosity
• density
• thermal expansivity
• thermal diﬀusivity (heat conductivity)
Convection is also determined by
• d, the box size
• δT (of course)
Consider a small displacement of a cold blob downwards and a hot blob
upwards:
T=T 0 + δ T
T=T 0
Left undisturbed, buoyancy forces would allow the hot blob to continue rising
and cold blob to continue falling.
There are however damping (dissipation) mechanisms:
• diﬀusion of heat
12


## Page 13

• viscous friction
Let DT = thermal diﬀusivity, which has units
[DT] = length2
time
The temperature diﬀerence between the two blobs can therefore be main-
tained at a characteristic time scale
τth∼ d2
DT
We also seek a characteristic time scale for buoyant displacement over the
length scale d.
Let
ρ0 = mean density
∆ρ = −αρ0∆T, α = expansion coeﬃcient
Setting ∆T =δT ,
buoyancy force density = |⃗ g∆ρ|
= gαρ0δT.
Note units:
[gαρ0δT ] = mass
(length)2(time)2
The buoyancy force is resisted by viscous friction between the two blobs
separated by∼d.
The viscous friction between the two blobs diminishes like 1/d (since viscous
stresses∝ velocity gradients). The rescaled viscosity has units
[η
d
]
= mass
(length)2(time)
Dividing the rescaled viscosity by the buoyancy force, we obtain the charac-
teristic time τm for convective motion:
τm∼ η/d
buoyancy force = η
gαρ0dδT .
13


## Page 14

Convection (sustained motion) occurs if
time for motion < diﬀusion time for temperature diﬀerence
τm < τth
Thus convection requires τth
τm
> constant
or
ρ0gαd3
ηDT
δT≡ Ra> constant
Ra is the Rayleigh number. A detailed stability calculation reveals that the
critical constant is 1708.
Our derivation of the Rayleigh number shows that the convective instability
is favored by
• large δT , α, d, ρ0.
• small η, DT.
In other words, convection occurs when the buoyancy forceρ0gαd3δT exceeds
the dissipative eﬀects of viscous drag and heat diﬀusion.
Note that box height enters Ra asd3. This means that small increases in box
size can have a dramatic eﬀect on Ra.
For Ra suﬃciently large, the ﬂow becomes turbulent. Some examples (from
Prof. Jun Zhang, NYU):
Here the gray scale is related to the thermal
gradient.
14
Image courtesy of Prof. Jun Zhang, NYU. Used with permission.


## Page 15

Here the viscous ﬂow moves the ﬂoating
boundary and the the boundary aﬀects the
ﬂow, an interplay roughly analogous to ﬂuid
motions beneath tectonic plates.
A close-up (red is cool,
blue is warm).
And here’s a picture of downgoing cold plumes (red) plunging from the upper
thermal boundary layer into the warm (blue) ﬂuid below:
Zocchi et al. [2]
15
Image courtesy of Prof. Jun Zhang, NYU. Used with permission.
Image courtesy of Prof. Jun Zhang,
NYU. Used with permission.
Courtesy Elsevier, Inc., http://www.sciencedirect.com. Used with permission.


## Page 16

1.6 Rayleigh-B´ enard equations
1.6.1 Dimensional form
We employ the Boussinesq approximation: density perturbations aﬀect only
the gravitational force.
The momentum equation is therefore the Navier-Stokes equation augmented
by the buoyancy force:
∂⃗ u
∂t +⃗ u·⃗∇⃗ u=− 1
ρ0
⃗∇p +ν∇2⃗ u−⃗ gα(T−T0)
Here we have written the kinematic viscosity
ν =η/ρ0
The mass conservation equation is again
⃗∇· ⃗ u= 0.
We now additionally require an equation for the convection and diﬀusion of
heat: ∂T
∂t + (⃗ u·∇)T =DT∇2T.
1.6.2 Dimensionless equations
The equations are nondimensionalized using
length scale = d
time scale = d2/DT
temperature scale = δT/ Ra.
An additional dimensionless parameter arises:
Pr = Prandtl number = ν/DT,
which is essentially the ratio of momentum diﬀusion to thermal diﬀusion.
16


## Page 17

We also use the dimensionless temperature ﬂuctuation
θ = deviation of dimensionless T from the simple conductive gradient
Dropping primes, the mass conservation equation is
⃗∇· ⃗ u= 0.
Momentum conservation yields (ˆz is the unit vector pointing up)
1
Pr
[∂⃗ u
∂t +⃗ u· ⃗∇⃗ u
]
=−⃗∇p +θˆz +∇2⃗ u.
The heat equation becomes
∂θ
∂t +⃗ u·⃗∇θ = Ra(⃗ u· ˆz) +∇2θ
Note that there are two nonlinear terms:
• ⃗ u·⃗∇⃗ u
• ⃗ u·⃗∇θ
Their relative importance depends on Pr:
• small Pr⇒⃗ u· ⃗∇⃗ udominates. Instabilities are “hydrodynamic.”
• large Pr⇒⃗ u· ⃗∇θ dominates. Instabilities are thermally induced.
1.6.3 Bifurcation diagram
For Ra< Rac, there is no convection.
For Ra > Rac, but not too large, a regular structure of convection “rolls”
forms, with hot ﬂuid rising and cold ﬂuid falling:
17


## Page 18

T = T0
T = T0 + δ
d
d
Now imagine placing a probe that measures the vertical component v of
velocity, somewhere in the box midway between the top and bottom. A plot
of v(Ra) looks like
v
0 conduction
rest
v+
v−
convection (stable)
conduction
(unstable)
Ra
Rac
The transition from conduction to convection is therefore a supercritical
pitchfork bifurcation.
Note that at any particular location we cannot know in advance whether the
symmetry is broken by an upgoing or downgoing velocity.
1.6.4 Convection in the Earth
The Earth’s radius is about 6378 km. It is layered, with the main divisions
being the inner core, outer core, mantle, and crust.
The Earth’s crust—the outermost layer—is about 30 km thick.
The mantle ranges from about 30–2900 km.
The mantle is widely thought to be in a state of thermal convection. The
18


## Page 19

source of heat is thought to be the radioactive decay of isotopes of uranium,
thorium, and potassium. Another heat source is related to the heat deriv-
ing from the gravitational energy dissipated by the formation of the Earth
roughly 4.5 Ga.
At long time scales mantle rock is thought to ﬂow like a ﬂuid. However its
eﬀective viscosity is the subject of much debate.
One might naively think that the huge viscosity would make the Rayleigh
number quite small. Recall, however, that Ra scales like d3, where d is the
“box size”. For the mantle, d is nearly 3000 km!!!
Consequently Ra is probably quite high. Current estimates suggest that
3× 106 ≲ Ramantle ≲ 109
which corresponds to roughly
103× Rac ≲ Ramantle ≲ 106Rac
The uncertainty derives principally from the viscosity, and its presumed vari-
ation by a factor of about 300 with depth.
Regardless of the uncertainty, we can conclude that Ra for the mantle is
more than suﬃcient for convection, and therefore that convection is likely
the driving force of plate tectonics and volcanism.
It turns out that volcanism is, over the long-term, responsible for the CO 2
in the atmosphere, and thus the source of carbon that is ﬁxed by plants.
(Weathering reactions remove C from the atmosphere.)
Thus in some sense thermal convection may be said to also sustain life.
That is, without convection, there probably would be no CO 2 in the atmo-
sphere, and therefore we wouldn’t be around to discuss it...
19


## Page 20

References
1. Tritton, D. J. Physical Fluid Dynamics, 2nd edition (Clarendon Press,
Oxford, 1988).
2. Zocchi, G., Moses, E. & Libchaber, A. Coherent structures in turbulent
convection, an experimental study. Physica A: Statistical Mechanics and
its Applications 166, 387–407 (1990).
20


## Page 21

MIT OpenCourseWare
https://ocw.mit.edu
12.006J/18.353J/2.050J Nonlinear Dynamics: Chaos
Fall 2022
For information about citing these materials or our Terms of Use, visit: https://ocw.mit.edu/terms.
