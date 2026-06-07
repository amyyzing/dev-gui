# Vortex Dynamics and Turbulence

Source title: October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book

Converted from: `25.pdf`


## Page 1

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
A BRIEF INTRODUCTION TO VOR TEX DYNAMICS
AND TURBULENCE
H. K. Mo ﬀatt
Department of Applied Mathematics and Theoretical Physics
University of Cambridge
Wilberforce Road, Cambridge, UK
h.k.moﬀatt@cam.ac.uk
The emphasis in this short introductory chapter is on those ﬂuid dynam-
ical phenomena that are best understood in terms of convection and dif-
fusion of vorticity, the curl of the velocity ﬁeld. Vorticity is generated at
ﬂuid boundaries, and di ﬀuses into the ﬂuid where it is subject to convec-
tion, stretching and associated intensiﬁcation. Far from boundaries, vis-
cous eﬀects may be negligible, and then vortex lines are transported with
the ﬂuid. Vortex rings, which propagate under their own self-induced
velocity, are a widely observed phenomenon, and a fundamental ingre-
dient of ﬂuid ﬂow. Stretching and intensiﬁcation is best illustrated by
the ‘Burgers vortex’ (the simplest model for a hurricane) in which these
process are in equilibrium with viscous di ﬀusion. Instabilities of Kelvin-
Helmholtz type are all-pervasive in highly sheared ﬂow, and inexorably
lead to transition to turbulence. In turbulent ﬂow, the vorticity is ran-
dom, but these fundamental processes still dictate many features of the
ﬂow. Fully three-dimensional turbulence is characterised by a cascade of
energy through a broad spectrum from large scales to very small scales
at which kinetic energy is dissipated by viscosity, a scenario that leads to
the famous (-5/3) Kolmogorov spectrum. These topics are reviewed and
discussed with a view to geophysical applications. The phenomena of
intermittency and concentrated vortices as revealed by direct numerical
simulation are also brieﬂy discussed.
1. Introduction
Vortex (or vorticity) dynamics is concerned with the manner in which
swirling ﬂows evolve in ﬂuids when viscous (i.e. internal friction) e ﬀects
are relatively weak, and can be neglected in a ﬁrst approximation. Such
1


## Page 2

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
2 H. K. Mo ﬀatt
ﬂows are controlled largely by inertial e ﬀects. An understanding of vortex
dynamics is an essential preliminary to a consideration of turbulent ﬂows
in which the vorticity distribution is a highly complex function of position.
Its time evolution is most easily understood through the statement that
“vortex lines are frozen in the ﬂuid”, i.e. they are transported with the
ﬂow like material curves of ﬂuid particles. This is not quite the whole story
however, because, insofar as the ﬂow may be treated as incompressible, the
vorticity is intensiﬁed as the vortex lines are transported, in proportion to
the stretching of vortex line elements. This stretching is very persistent in
a turbulent ﬂow, leading to very strong intensiﬁcation of vorticity coupled
with progressive decrease of the scale of variation of the ﬂow, an e ﬀect
usually described in terms of an ‘energy cascade’. This cascade to small
scales is ultimately controlled by viscosity, no matter how weak this phys-
ical property of the ﬂuid may be; and one of the remarkable properties of
turbulent ﬂow is that the rate of dissipation of energy by viscosity is in-
dependent of the value of viscosity even in the limit as this tends to zero,
and this because the smallest scales of the ﬂow adjust in just such a way as
to dissipate the kinetic energy at the very rate at which it cascades down
from larger scales.
The central role of vorticity in describing ﬂuid motion was recognised
by Hermann von Helmholtz (1858), who ﬁrst recognised the above cru-
cial ‘frozen-in’ property. The 150th anniversary of the publication of this
seminal paper was marked by the IUTAM Symposium 150 years of Vor-
tex Dynamics , recently held at the Technical University of Denmark (Aref
2010; the 50 papers contained in this volume provide an indication of the
huge current scope and applications of the subject). The theory of vortic-
ity was taken up and enthusiastically developed by William Thomson (later
Lord Kelvin) (1867; 1869 and many subsequent papers), who proposed that
the atomic structure of the various elements might be explained in terms
of knotted vortex tubes, whose ‘knottedness’ would be conserved under
frozen ﬁeld evolution. Such structures turn out to be dynamically unstable,
and Kelvin was ultimately obliged to abandon his theory of ‘vortex-atoms’;
nevertheless, his pioneering investigations opened up the new ﬁeld of hy-
drodynamic instability, providing important clues concerning the ubiquity
of turbulent, as opposed to laminar, ﬂows in all large-scale natural systems.
Figure 1 shows Helmholtz and Kelvin around 1870, when both were at the
height of their powers and creativity.


## Page 3

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 3
Fig. 1. Hermann von Helmholtz (left) and William Thomson (Lord Kelvin): the early
pioneers of vortex dynamics.
2. V orticity and the Biot-Savart law
Letu(x,t) be the velocity ﬁeld in a ﬂuid which ﬁlls all space. This is of
course an idealisation, relevant when we consider ﬂuid behaviour that is
uninﬂuenced by remote ﬂuid boundaries. We shall suppose further, for sim-
plicity, that the ﬂuid has uniform density ρ, and that it (or rather the ﬂow)
is incompressible, i.e. ∇·u= 0. Under this approximation, sound waves
are ﬁltered out of the governing Navier-Stokes equations. The vorticity ﬁeld
ω(x,t) is deﬁned by
ω=∇×u(x,t), (2.1)
so that immediately ∇·ω= 0. We can conveniently think of ‘vortex tubes’
in the ﬂow, i.e. the set of vortex lines passing through any small material
surface element δA. The ‘circulation’ round such a tube is
Γ=
∮
C
u·dx=
∫∫
δA
ω·ndA , (2.2)
where Cis a closed curve circling the tube once, and this is evidently
constant, independent of the particular cross-section of the tube that is
chosen (ﬁgure 2a). It is frequently stated that vortex lines must either be
closed curves or end on a ﬂuid boundary, but this is incorrect: it is now


## Page 4

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
4 H. K. Mo ﬀatt
known that in a general three-dimensional ﬂow, the vortex lines are chaotic,
and any two neighbouring vortex lines will in general diverge exponentially
(a good example may be found in the ‘ABC’–ﬂow studied by Dombre et al.
(1986)). For this reason, the concept of a vortex tube must be treated with
caution, particularly in a turbulent ﬂow in which the cross-section of any
instantaneous vortex tube will become seriously deformed if followed far
enough along its length.
!
! !
!
!
!!!" # " $ "
Fig. 2. Vorticity conﬁgurations and induced velocity ﬁelds. (a) Vortex tub e with circu-
lation Γ. (b) Localised vorticity ﬁeld, and induced velocity, dipolar at a large distan ce.
(c) Vortex ring and its induced velocity.
By virtue of the incompressibility condition ∇·u= 0, we may introduce
a vector potential A(x,t) foru, such that u=∇×A,∇·A= 0. Then we
have immediately ω=∇×(∇×A)=−∇2A. If the vorticity distribution
is localised (and by this, we usually mean that |ω|decreases exponentially
rapidly outside some bounded region), then the appropriate solution of this
Poisson equation is
A(x,t)=
1
4π
∫
ω(x′,t)
|x−x′|
dV′. (2.3)
The corresponding velocity ﬁeld is then
u(x,t)=∇×A=−
1
4π
∫
(x−x′)×ω(x′,t)
|x−x′|3 dV′. (2.4)
This is the ‘Biot-Savart law’, giving the velocity ﬁeld u(x,t) ‘induced’ by the
vorticity ﬁeld ω(x,t). It is this velocity ﬁeld that transports the vorticity
ﬁeld, a nonlinear feedback that encapsulates the central di ﬃculty of the
dynamics of ﬂuids.
If, as supposed, the vorticity ﬁeld is localised, then for |x|>>|x′|,
(where x′is any point within the vortical region), equation (2.3) may be


## Page 5

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 5
manipulated to give
A(x)∼−(µ×∇)
1
r
, (2.5)
where
µ=
1
8π
∫
x×ωdV , (2.6)
andr=|x|. The corresponding asymptotic behaviour of uis
u∼∇(µ·∇)
1
r
, (2.7)
an irrotational velocity ﬁeld associated with an (apparent) dipole µlocated
atr= 0. (The result is independent of the origin chosen for x; proof: an
exercise for the reader!) The situation is as sketched in ﬁgure 2b. Equation
(2.7) shows that the velocity ﬁeld associated with an arbitrary localised
vorticity distribution is dipolar at a large distance, of order r−3asr→∞ .
The most familiar example of a localised vorticity distribution is pro-
vided by the ‘vortex ring’ for which the vorticity ﬁeld is axisymmetric and
conﬁned to a torus, the vortex lines being circles around the axis of the torus
(ﬁgure 2c). Such vortex rings may be produced and visualised by tapping a
smoke-ﬁlled box so that air is ejected impulsively through a suitably shaped
oriﬁce; both the vortex ring and the smoke are then transported together
by the self-induced velocity ﬁeld. This was the basis of Tait’s (1867) demon-
stration which so impressed Kelvin, who proceeded to calculate the speed
of propagation Vof a vortex ring of radius R, starting from the Biot-Savart
law (2.4), and on the assumption that the vorticity is uniformly distributed
across the ‘core’ of the vortex of small core radius a; his result, recorded in
an appendix to Tait (1867), was
V=
ωa2
2R
(
log
8R
a
−
1
4
)
. (2.8)
Vortex rings generated by the method of Tait (exploiting the re-
tarding e ﬀect of viscosity in the boundary layer inside the oriﬁce)
can travel a considerable distance before being dispersed as a result
of instability or through the direct action of viscosity. Vortex rings
appear to be ubiquitous in nature, the most striking example being
the vortex/steam rings emitted in volcanic eruptions (see, for exam-
ple, the beautiful photographs by Marco Fulle of this phenomenon at
http://www.swisseduc.ch/stromboli/etna/etna00 . A ﬁne example of
the persistence of vortex rings (visualised with bubbles at their core), and


## Page 6

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
6 H. K. Mo ﬀatt
the playful manner in which dolphins can interact with them can be found at
http://www.metacafe.com/watch/1041454/dolphinplaybubblerings .
3. The Euler equation and its invariants
We take as a starting point the Navier-Stokes equations for a viscous in-
compressible ﬂuid in their familiar form
∂u
∂t
+u·∇u=−
1
ρ
∇p+ν∇2u, (3.1)
∇·u=0, (3.2)
whereρis the ﬂuid density (here assumed constant), and νis the kinematic
viscosity of the ﬂuid. If, for the moment, we neglect viscous e ﬀects entirely,
we simply set ν= 0, giving the equations obtained by Euler (1755).
∂u
∂t
+u·∇u=−
1
ρ
∇p, (3.3)
∇·u=0. (3.4)
It is remarkable that, despite the fact that these Euler equations were dis-
covered more that 250 years ago (Eyink et al., 2008), we still do not know
whether the solutions that evolve from smooth initial conditions of ﬁnite
energy remain smooth for all time; or conversely, whether there exist any
smooth ﬁnite-energy initial conditions for which the solution of the Eu-
ler equations becomes singular at ﬁnite time. This ‘ﬁnite-time singularity
problem’ may seem a rather esoteric issue, of more interest to mathemati-
cians than to geophysicists or engineers; but in fact it lies at the heart of
the problem of turbulence, having an obvious bearing on the mechanism of
dissipation of energy at the smallest scales of motion, and it is therefore a
problem that merits serious study. It is known that, if a singularity occurs
at some ﬁnite time tc, say, then the time-integral of the maximum value of
the vorticity must diverge as t→tc(Bealeet al., 1984). This result places
the focus of investigation ﬁrmly on the behaviour of the vorticity ﬁeld in
general three-dimensional situations. We shall suppose in what follows, that
the velocity and vorticity ﬁelds do in fact remain smooth for all time, unless
otherwise stated.
The Euler equation (3.3) may be written in the equivalent form
∂u
∂t
=u×ω−∇
(
p
ρ
+
1
2
u2
)
, (3.5)


## Page 7

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 7
from which, taking the curl, we immediately obtain the ‘vorticity equation’
∂ω
∂t
=∇×(u×ω). (3.6)
This is the equation that implies that the vortex lines behave like material
lines, and are therefore transported with the ﬂuid. Kelvin proved, on the
basis of this equation, that the circulation, deﬁned as in (2.2),
K=
∮
C
u·dx, (3.7)
but now for any material (i.e. ‘Lagrangian’) circuit Cthat moves with the
ﬂuid, is constant. By virtue of (2.2), Kis also the ﬂux of vorticity through
C; hence any ﬂow that stretches a vortex tube and (by incompressibility)
decreases its cross-section must proportionately intensify the vorticity in
the tube. In fact, if δxis an element of a vortex line which moves with the
ﬂuid, then |ω|∝|δx|. [The corresponding result for compressible ﬂow is
that|ω|∝ρ|δx|.]
There are four known invariants of the Euler equations, namely mo-
mentum P, angular momentum M, (kinetic) energy E, and helicity H. One
might naively suppose that the momentum should be given by P=
∫
ρudV,
the integral being over the whole ﬂuid domain. This integral is however, at
best only conditionally convergent, due to the slow O(r−3) decrease of uat
inﬁnity. One may calculate the momentum of any given ﬂow by supposing
that the corresponding vorticity distribution is established from a state of
rest by an impulsive force distribution at the moment under consideration
(Saﬀman, 1995); the result is that
P=
1
2
∫
ρx×ωdV , (3.8)
an integral that is certainly convergent for any localised vorticity distribu-
tion. It may also be veriﬁed directly from (3.6) that Pis indeed constant.
Note that P=4πµ, so that the dipole moment of a localised vorticity dis-
tribution is constant in time. This result is true also for viscous evolution
under the Navier-Stokes equations, the reason being that under the inﬂu-
ence of viscosity, momentum is neither created nor destroyed, but merely
redistributed by the process of di ﬀusion.
Similarly, the correct expression for angular momentum may be ob-
tained in the form
M=
1
3
∫
ρx×(x×ω)dV , (3.9)


## Page 8

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
8 H. K. Mo ﬀatt
and this integral is also constant under either Euler or Navier-Stokes evo-
lution.
The kinetic energy (divided by density ρ) is given by the convergent
integral
E=
1
2
∫
u2dV , (3.10)
and this is constant under Euler evolution. However, under Navier-Stokes
evolution, we have
dE
dt
=−ν
∫
ω2dV , (3.11)
the right-hand side representing the rate of dissipation of energy by viscos-
ity. The integral on the right is called the ‘enstrophy’ of the ﬂow, and is
usually denoted by the symbol Ω:
Ω=
∫
ω2dV ,
dE
dt
=−νΩ. (3.12)
Like vorticity itself, the enstrophy has a persistent tendency to increase in
turbulent ﬂow, a process ultimately controlled by viscosity.
Finally, the helicity His given by
H=
∫
u·ωdV , (3.13)
and this also is an invariant of the Euler equations (Moreau, 1961; Mo ﬀatt,
1969). Like energy, it is a quadratic functional of the velocity ﬁeld, but,
unlike energy, it is not sign-deﬁnite; actually it is a ‘pseudo -scalar’, changing
sign under change from a right - to left-handed frame of reference; this is why
we use the non-mirror-symmetric symbol Hto denote it. By the Schwartz
inequality, it is bounded in magnitude:
|H|≤EΩ, (3.14)
with equality only if ωis everywhere parallel to u. Such ‘Beltrami’ ﬂows
are evidently ﬂows of maximal helicity. The helicity is conserved even in
compressible ﬂows provided these satisfy the barotropic condition that pres-
sure is a function only of density (and not for example of temperature), i.e.
p=p(ρ). In fact, helicity is conserved under precisely the same conditions
under which Kelvin’s circulation theorem is satisﬁed and vortex lines are
frozen in the ﬂuid. The physical interpretation of helicity is topological in
character: this integral represents the ‘degree of linkage’ of the vortex lines
of the ﬂow, a quantity that should certainly be preserved under frozen-ﬁeld


## Page 9

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 9
evolution . The interpretation is most transparent for the case of two sim-
ply linked vortex tubes of circulations Γ1andΓ2; for this conﬁguration, it
emerges that
H=±2nΓ1Γ2, (3.15)
where nis the (Gauss) linking number of the two tubes, and the plus
or minus sign is chosen according as the linkage is right- or left-handed
(assuming of course, as is conventional, that we use a right-handed frame
of reference). This topological interpretation has been extended to ﬂows for
which the vortex lines are chaotic (the generic situation) by Arnol’d (1974).
4. The stretched vortex of Burgers (1948)
In a turbulent ﬂow, each constituent vortex tube (or portion of a vortex
tube) is subject to the stretching associated with all other vortices in the
ﬂow. It is natural therefore to consider an idealised situation in which this
stretching is as simple as possible, i.e. axisymmetric, uniform and steady.
We consider a vorticity distribution with just one component
ω= (0,0,ω(r)), (4.1)
where we use cylindrical polar coordinates ( r,φ,z) with r2=x2+y2, and
we suppose this subjected to the action of ‘uniform axisymmetric straining
ﬂow’ with constant rate of strain γ(>0):
U=(−2γr,0,γz). (4.2)
In the absence of this strain, the vortex would di ﬀuse under the action of
viscosity; the strain and associated vortex stretching counteracts this e ﬀect
and a steady state is possible. Note that the additional velocity induced by
the vortex is given, from (2.1), by
u= (0,v(r),0), (4.3)
where
v(r)=
1
r
∫r
0
ω(r′)r′dr′, (4.4)
and that this additional velocity has no e ﬀect on the vorticity distribution
(because ∇×(u×ω) = 0).
The vortex therefore evolves according to the equation
∂ω
∂t
=∇×(U×ω)+ν∇2ω; (4.5)


## Page 10

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
10 H. K. Mo ﬀatt
this equation has only a φ-component, which reduces to
∂ω
∂t
=
γ
2r
∂(r2ω)
∂r
+
ν
r
∂
∂r
r
∂ω
∂r
. (4.6)
The steady solution, with boundary conditions ω(0) =ω0,ω→0 asr→∞ ,
is
ω(r)=ω0exp−(γr2/4ν), (4.7)
a gaussian vorticity distribution, with total ﬂux of vorticity
Γ=2π
∫∞
0
ω(r)r dr=4πω0ν/γ. (4.8)
The associated velocity component v(r) is given, from (4.4), by
v(r)=
Γ
2πr
(
1−exp
(
−
γr2
4ν
))
. (4.9)
The circulation round a circle of radius ris 2πrv(r), and this tends to the
constant Γforr> δwhereδ=ν/γis a measure of the radius of the tube.
The structure of this vortex is sketched in ﬁgure 3.
!
!
"
"#$! %
Fig. 3. The stretched Burgers vortex with circulation Γand gaussian vorticity proﬁle.
A remarkable feature of this vortex, as noted by Burgers (1948), is that
the corresponding rate of dissipation of energy per unit length of vortex,
namely
Φ=2πν
∫∞
0
ω2r dr=Γ2γ/8π, (4.10)


## Page 11

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 11
is independent of ν(for ﬁxed circulation Γ) even in the limit as ν→0. In
this limit, δ→0,ω0=O(δ−2) , and the gaussian distribution of vorticity
tends to a delta-function. Thus, the vorticity is indeed singular in the limit,
yet the rate of dissipation of energy per unit length of vortex remains ﬁnite.
If the strain ﬁeld is non-axisymmetric, of the form
U(x, y, z)=(αx,βy,γz),withα<β≤0<γ,α+β+γ=0, (4.11)
the problem becomes much more complicated, and the behaviour is strongly
inﬂuenced by the value of the appropriate Reynolds number, here ReΓ=
Γ/ν. When ReΓ≫1, as relevant in the context of turbulence, and when
β<0, the rapid spin within the vortex is su ﬃcient to minimise departures
from axisymmetry, and the solution (4.7) is still valid at leading order, the
small departures from axisymmetry in the contours of constant ωhaving
an interesting topological structure (Mo ﬀattet al., 1994).
The particular situation when β= 0 provides a stretched vortex sheet
localised near the plane x= 0, also with gaussian structure. This two-
dimensional solution has been generalised by conformal mapping techniques
to provide a wide class of exact solutions of the Navier-Stokes equations ex-
hibiting a fascinating range of ‘ﬂoral’ vortical patterns (Bazant and Mo ﬀatt,
2005). For such two-dimensional solutions however, the maximum vorticity
in each sheet increases in proportion to ν−1/2asν→0, and the rate of
dissipation of energy per unit area of the vortex sheets is O(ν1/2), thus
vanishing in the limit ν= 0, in striking contrast to the axisymmetric case.
This is one reason why vortex tubes, rather than vortex sheets, are the more
promising candidates for the role of typical structures within a turbulent
ﬂow.
5. Kelvin-Helmholtz instability
In consideration of the instabilities to which ﬂuid ﬂows are subject, we
should distinguish between ‘fast’ instabilities, i.e. those that are of purely
inertial origin and have growth rates that do not depend on viscosity, and
‘slow instabilities’, which are essentially of viscous origin, and whose growth
rates therefore tend to zero as the viscosity νtends to zero, or equivalently
as the Reynolds number Re=U L/νtends to inﬁnity. Examples of fast
instabilities are the ‘Rayleigh-Taylor instability’ that occurs when a heavy
layer of ﬂuid lies over a lighter layer, the ‘centrifugal instability’ (leading to
‘Taylor vortices’) that occurs in a ﬂuid undergoing di ﬀerential rotation when
the circulation about the axis of rotation decreases with radius, and the


## Page 12

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
12 H. K. Mo ﬀatt
‘Kelvin-Helmholtz instability’ that occurs in any region of rapid shearing
of the ﬂuid. The best known example of a slow instability is the instability of
pressure-driven ‘Poiseuille ﬂow’ between parallel planes, which is associated
with subtle e ﬀects of viscosity in ‘critical layers’ near the boundaries; the
‘dynamo instability’ of magnetic ﬁelds in electrically conducting ﬂuids is
also diﬀusive in origin (through magnetic di ﬀusivity rather than viscosity),
and may therefore also be classed as a slow instability.
Here, we shall focus on the Kelvin-Helmholtz instability, idealised as the
instability of a tangential discontinuity of velocity, which we may take to
be
U=(∓U/2,0,0) for y>or<0. (5.1)
The vorticity is then concentrated on the sheet y= 0, and given by the
delta-function
ω= (0,0,Uδ(y)). (5.2)
We suppose that this sheet is subjected to the sinusoidal perturbation
y=η(x, t)=η(t) expikx , (5.3)
withk>0, the real part of (5.3) being understood. All perturbations may
similarly be supposed proportional to exp ikx. The ﬂow is assumed to be
irrotational everywhere except on this disturbed sheet; the perturbation is
thus ‘isovortical’ in the sense that the disturbed vorticity is obtained by a
virtual ﬂux-conserving displacement of the undisturbed vorticity ﬁeld. The
velocity above and below the interface then takes the form
u=(−U/2,0,0) +∇φ1 fory>η, (5.4)
u= (+U/2,0,0) +∇φ2 fory<η, (5.5)
where, by virtue of incompressibility,
∇2φ1= 0 and ∇2φ2=0. (5.6)
Since moreover the perturbation velocity must vanish as y→±∞, it follows
that
φ1=Φ1(t)e−ky+ikx, φ2=Φ2(t)eky+ikx, (5.7)
whereΦ1(t) andΦ2(t) are to be found.
There are now two important conditions that must be satisﬁed on the
vortex sheet y=η(x, t). First, since this sheet moves with the ﬂuid, its
Lagrangian derivative must vanish, i.e.
D
Dt
(y−η(x, t))≡(
∂
∂t
+u·∇)(y−η(x, t)) = 0 on y=η. (5.8)


## Page 13

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 13
NowDy/Dt ≡u·∇y=∂φ1,2/∂yaccording as we approach the sheet from
above or below. Also, for so long as the disturbance remains small, the
problem may be linearised, i.e. squares and products of the small quantities
η,Φ1andΦ2may be neglected and the jump conditions may be applied on
y= 0 instead of y=η. It follows that
∂φ1
∂y
=
∂η
∂t
−
1
2
U
∂η
∂x
and
∂φ2
∂y
=
∂η
∂t
+
1
2
U
∂η
∂x
ony=0. (5.9)
Second, the pressure p= cst−ρ∂φ/∂t+ρu2/2 must be continuous across
y=η, so that on linearising,
∂φ2
∂t
−
∂φ1
∂t
+
1
2
U
(
∂φ2
∂x
+
∂φ1
∂x
)
= 0 on y=0. (5.10)
Equations (5.9) and (5.10) may now be combined to give, after some
simple algebra, the amplitude equation
∂2η
∂t2=
1
4
k2U2η, (5.11)
with exponential solutions η∝eσtwhereσ=±kU/2.Thus the mode for
which
σ=+kU/2 (5.12)
grows exponentially until the linearised theory ceases to be valid. These
modes (for varying wave-number k) are unstable, and the growth rate is
proportional to k, increasing as the wave-length 2 π/kof the disturbance
decreases.
The physical mechanism of this instability is that the local strength of
the perturbed vortex sheet, given for the unstable mode by
Γ(x, t)=U+
∂φ2
∂x
−
∂φ1
∂x
=U+2i
∂η
∂t
=U+ikUη, (5.13)
isπ/2 out of phase with η; the perturbation vorticity is maximal at the
points of inﬂexion where the slope of ηis positive, and the induced velocity
is such as to amplify the perturbation (ﬁgure 4).
This interpretation of the instability mechanism actually continues into
the nonlinear regime, investigated by Moore (1979). Moore noted ﬁrst that,
even on linear theory, some kind of singular behaviour is to be expected after
a ﬁnite time. For, by way of example, suppose that the initial disturbance
is periodic in xwith period λ, with convergent Fourier series of the form
η(x,0) =
∞∑
n=1
Ansin
nπx
λ
, (5.14)


## Page 14

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
14 H. K. Mo ﬀatt
!!
"! !!
"!
!!
"! !!
"!
!"# !$#
%&’ ( ) * " + &, - . " / / 0 " + %.
10+ 0
!
Fig. 4. The Kelvin-Helmholtz instability of a vortex sheet. (a) Vorticity accu mulates
in the sheet at the upward sloping inﬂexion points. (b) Spiral wind-up after t he Moore
singularity.
where
An=e−nn−p, (5.15)
withp>0. Thus η(x, t) and all its x-derivatives exist at time t= 0. How-
ever, by virtue of (5.12), selecting only the unstable modes, the disturbance
at time tis given by
η(x, t)=
∞∑
n=1
Anexp
nπUt
2λ
sin
nπx
λ
, (5.16)
and this series diverges for t>tc=2λ/πU, because the exponential growth
of the coe ﬃcients then defeats the power-law decay for large n.
Now nonlinear e ﬀects generate harmonics of the initial disturbance even
when this consists of a single Fourier mode, so that a series of the form (5.14)
is soon established. Moore’s achievement was to show that the exact non-
linear solution for η(x, t) becomes singular at a ﬁnite time of order λ/Uat
the upward-sloping inﬂexion points where, as indicated above, the accumu-
lation of vorticity becomes more and more concentrated. This singularity
appears as a discontinuity of curvature, and the vortex sheet strength is cus-
pidal in form. Beyond the singularity time, observation suggests that the
sheet rolls up in a periodic sequence of spiral vortices (ﬁgure 4b), although
no analytical solution is as yet available to describe this behaviour.
What is important here is that any vortex sheet is absolutely unstable,
with a tendency to break up into a series of concentrations of vorticity, more
like vortex tubes than a vortex sheet. The vortex tube appears in general
to be a much more robust structure than the vortex sheet which has at best
a transitory existence, even in turbulent ﬂows.


## Page 15

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 15
The Kelvin-Helmholtz instability, as described above, occurs not only
for vortex sheets, but also for parallel shear ﬂows having an inﬂexion point
in the velocity proﬁle; the ‘tanh’ proﬁle
U=(−U/2 tanhy/δ,0,0), (5.17)
for which vorticity is distributed in a layer of thickness O(δ), is a useful
prototype. Such a velocity ﬁeld is unstable to sinusoidal perturbations of
wavelength large compared with δ; on such scales, the velocity proﬁle ‘looks
like’ the discontinuous proﬁle (5.1), so it is not surprising that it exhibits
the same type of instability leading to spiral wind-up of the whole vortical
layer.
In fact, the existence of at least one inﬂexion point in the proﬁle of a
parallel shear ﬂow of an inviscid ﬂuid is known to be a necessary condition
for (linearised) instability of the ﬂow (see, for example, Drazin and Reid
(2005)). Plane Poiseuille ﬂow, with its parabolic proﬁle, is therefore stable
in the limit of inﬁnite Reynolds number ( ν= 0). The source of the (slow)
instability of this and similar ﬂows must therefore be sought in the dual
role of viscosity, usually thought to be merely stabilising!
6. T ransient instability and streamwise vortices
There is however another, potentially more potent, mechanism by which
plane parallel non-inﬂexional ﬂows may be destabilised; this arises through
consideration of the shearing of disturbances of ﬁnite (rather than inﬁnites-
imal) amplitude. Such disturbances, as might be anticipated, can be drawn
out into long structures parallel to the ﬂow (or ‘streamwise vortices’) which,
when superposed on the underlying shear ﬂow, provide locally inﬂexional
proﬁles, which are then subject to the Kelvin-Helmholtz instability. We
shall illustrate this behaviour by considering the simplest case of uniform
shear ﬂow
U=(αy,0,0), (6.1)
on which, at time t= 0, we superpose a sinusoidal disturbance of the form
u(x,t)=A0exp (ik0·x), (6.2)
withk0·A0= 0 (by incompressibility). For the moment, we retain the ef-
fects of viscosity. The analysis that follows was presented by Mo ﬀatt (1967),
and developed in the context of turbulent shear ﬂow by Townsend (1976).


## Page 16

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
16 H. K. Mo ﬀatt
We suppose that the perturbation, although ﬁnite, is still su ﬃciently
weak to allow linearisation of the Navier-Stokes equation:
∂u
∂t
+U·∇u+u·∇U=−
1
ρ
∇p+ν∇2u, (6.3)
wherepis the perturbation pressure associated with the disturbance. This
equation admits a solution of the form
u=A(t) exp (ik(t)·x), p/ ρ=P(t) exp (ik(t)·x), (6.4)
in which both wave-vector k(t) and amplitudes A(t) andP(t) are allowed to
vary with time. Such disturbances, ﬁrst recognised by Lord Kelvin (1887),
are known as ‘Kelvin modes’. We may note that for a single mode of this
kind, the omitted nonlinear term u·∇uin (6.3) is in fact identically zero,
so that (6.4) can provide an exact solution of the Navier-Stokes equation.
However, a superposition of modes of di ﬀerent wave-vectors do involve sig-
niﬁcant nonlinear interactions, which we do not consider here.
Substituting (6.4) in (6.3) gives
˙A+i(˙k·x)A+αA2(1,0,0) +iαyk1A=−ikP−νk2A, (6.5)
and we have also, by incompressibility,
k(t)·A(t)=0 . (6.6)
The coeﬃcients of x, yandzin (6.5) must vanish; hence ˙k1=0,
˙k2=−αk1,˙k3= 0, so that
k1=k01,k 2(t)=k02−αk1t, k 3=k03. (6.7)
This simply describes the shearing of the wave fronts, which become more
and more aligned parallel to the plane y= 0. If k1= 0, then the wave
vector (0,k2,k3) remains constant, whereas if k1̸= 0, then the e ﬀect of the
shear is asymptotically to align the wave vector in the (0, 1, 0) direction
and to increase its magnitude linearly with time.
Here we may note immediately that the e ﬀect of the viscous term is
simply to introduce a factor
exp
[
−ν
∫t
0
(k(t))2dt
]
= exp
[
−ν(k2
0t−k1k02αt2+k2
1α2t3/3)
]
, (6.8)
where k0=|k0|, so that, provided k1̸= 0, this Kelvin mode experiences
‘accelerated decay’ on a time-scale
αt=O(α/νk2
1)1/3. (6.9)


## Page 17

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 17
Modes for which k1/k0is small survive for a long time (when νis small);
the exceptional modes for which k1= 0 survive for the much longer time-
scaleO(1/νk2
0), unaﬀected by the shear. It is the decay of all modes as
described by (6.8) that accounts for the stability of the ﬂow Uon linearised
analysis. However, before this ultimate decay sets in, the amplitude |A(t)|
may increase by an arbitrarily large factor, as we shall now show.
Noting ﬁrst, from (6.6), that ˙k·A+˙A·k= 0, we have, from (6.5),
−ik2P=−˙k·A+αA2k1=2αA2k1, (6.10)
and the part of (6.5) not involving x, yandzis then satisﬁed provided
˙A+αA2(1,0,0) =−ikP=2αA2k1k/k2. (6.11)
Integration of the second component of this equation, then of the ﬁrst and
third components, is straightforward; with the notation
l2=k2
1+k2
3, tanθ=l/k2(t), [ψ]=ψ(t)−ψ(0), (6.12)
the solution is
A1(t)=A01−A02
{
k2
0k2
3
k1l3[θ]+
k1k2
0
l2
[
k2
k2
]}
, (6.13)
A2(t)=A02k2
0/k2, (6.14)
A3(t)=A03+A02
k3k2
0
l3
{
[θ]+l
[
k2
k2
]}
. (6.15)
These three components are plotted in ﬁgure 5 for the initial conditions
k0= (0.1,1,1) andA0= (1,1,−1.1), for which k1/k0≈0.07, small enough
for there to be a relatively long period of approximately linear growth of
|A1(t)|. This period of linear growth increases as k1/k0decreases. The linear
growth, or ‘transient instability’, results from the ( u·∇)U=u2∂U/∂yterm
in equation 6.3, which corresponds to persistent transport of mean-ﬂow x-
momentum in the y-direction.
If a random superposition of modes with isotropically distributed initial
wave-vectors k0is subjected to the above shearing, then the dominant
contribution to the disturbance energy will ultimately come from modes
with wave-vectors in an increasingly narrow neighbourhood of the plane
(in wave-number space) k1= 0, i.e. from modes for which k0·U≈0.
Physically this corresponds to the emergence of structures having little or
no variation in the streamwise direction. Such structures are known, for
obvious reasons, as ‘streamwise vortices’; they grow in strength, under the
action of the mean shear, until the appearance of inﬂexion points in the


## Page 18

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
18 H. K. Mo ﬀatt
Fig. 5. Evolution of A1(t) (solid curve), A2(t) (dashed), and A3(t) (dotted), as given by
(6.13)-(6.15), with initial conditions k0= (0.1,1,1) and A0= (1,1,−1.1) (so k0·A0=
0); note the relatively long period of linear growth of A1(t), a symptom of transient
instability.
proﬁle of the total x-component of velocity is inevitable. At that stage the
ﬂow is prone to ‘secondary instability’ of Kelvin-Helmholtz (K-H) origin;
the ﬂow becomes fully three-dimensional, and the transition to turbulence
is well underway. All this applies of course only if the viscosity parameter
νis suﬃciently weak.
The theory described above is a particular case of what is known as
‘Rapid Distortion Theory’ (RDT), which more generally describes the lin-
earised uniform distortion of a ﬁeld of turbulence by a mean velocity ﬁeld
of the form
Ui(x)=cijxj, (6.16)
of which (6.1) is obviously a special case. Such ﬂows may be either elliptic or
hyperbolic in character. It is possible to incorporate additional e ﬀects rele-
vant in geophysical applications, e.g. uniform density stratiﬁcation and/or
coriolis eﬀects associated with the Earth’s rotation. Such e ﬀects have been
explored in detail by Sagaut and Cambon (2008), where extensive references
to previous work on RDT may be found.
It is also worth noting that transient instabilities, as described above,
and as greatly developed by Schmid and Henningson (1994), play an im-
portant part in more recent work in which new steady and travelling-wave
solutions of the classical problems of Couette ﬂow and Poiseuille ﬂow in a


## Page 19

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 19
pipe have been found. The essential idea (see, for example, Wale ﬀe (2003);
Pringle and Kerswell (2007)) is that coherent structures formed by transient
instability are unstable to K-H–type instability, and that these (secondary)
instabilities interact coherently in such a way as to regenerate the original
ﬁnite-amplitude perturbations to the ﬂow. The highly original new ideas
and results in this area, which have a bearing on the important problem of
transition to turbulence, are among the most exciting to emerge in recent
years.
7. T urbulence, viewed as a random ﬁeld of vorticity
Over the last twenty years, turbulence has been increasingly subjected to
Direct Numerical Simulation (DNS), i.e. computational treatment of the
Navier-Stokes equations without approximation, by either ﬁnite-di ﬀerence
or spectral techniques, and ‘post-processing’ of the numerical output. Fig-
ure 6 shows the vorticity distribution in high vorticity regions of a ﬁeld
of turbulence, from a ‘state-of-the-art’ simulation on the Earth Simulator
(Yokokawa et al., 2002); what is important to note here is the apparent
‘tube-like’ structure of this random ﬁeld. We referred in the introduction to
the persistent stretching of vortex lines in a turbulent ﬂow. Figure 6 gives
some substance to this description: each vortex tube is subject to stretch-
ing associated with the induced velocity of the whole vorticity distribution
(possibly dominated by that of neighbouring vortices), in a manner remi-
niscent of the Burgers’ vortex model of §4 above.
Of course such a description presupposes that there is indeed a system-
atic stretching e ﬀect (rather than the opposite – a systematic contraction).
This stretching arises from a natural tendency for any two ﬂuid particles,
initially close together, to move apart under the action of a random incom-
pressible velocity ﬁeld. Indeed, if δx(t)is the separation of two particles,
withδx(0) = δaassumed inﬁnitesimally small and non-random, then it
can be shown (Orszag, 1977) that in homogeneous, isotropic turbulence
(i.e. turbulence whose statistical properties are invariant under translation
and rotation)
⟨
δx2⟩
≥δa2. (7.1)
When coupled with an assumption concerning the ‘ﬁnite memory’ of tur-
bulence (which amounts to assuming that the turbulence ﬁeld for times
greater than t+tcis uncorrelated with that at time t), this is su ﬃcient
to establish that
⟨
δx2
⟩
increases systematically in time (Davidson, 2004)


## Page 20

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
20 H. K. Mo ﬀatt
Fig. 6. Intense-vorticity iso-surfaces ( |ω|><ω>+4σ, where σis the standard deviation
of|ω|), in a direct numerical simulation of homogeneous turbulence [from Yokokawa et al.
(2002), by permission]; this simulation was carried out in a periodic box with 4096 3grid
points, and at a Reynolds number Reλ= 732; this Reynolds number is O(Re1/2), where
Re=u0L/ν. This ﬁgure shows a ‘zoomed-in’ high vorticity region of size (748 2×1496)lv,
where lvis the ‘inner’ Kolmogorov scale. Vorticity ﬂuctuations down to this scale are
reasonably well resolved.
In particular, if δxis aligned with a vortex line, this element of the vortex
line will be systematically stretched by the ﬂow (and this applies to every
element of every vortex line!).
The essential ingredients of the dynamics of turbulence may thus be
thought of as a combination of three elements: formation of sheet-like
structures by shearing of random vorticity (the transient instability mecha-
nism); all-pervasive Kelvin-Helmholtz instability of such structures leading
to tube-like structures with possibly some remnants of spiral wind-up; and
persistent stretching of such vortices by the strain induced by the surround-
ing vorticity ﬁeld. Each of these ingredients has a tendency to decrease the
scale of the velocity ﬁeld, i.e. to contribute to the energy cascade towards
the smallest scales of the turbulence, a fundamental aspect of the problem
to which we now turn.
8. The Kolmogorov-Obukhov energy-cascade theory
The random character of a turbulent velocity ﬁeld necessitates a statistical
treatment in which an ‘ensemble average’ ⟨...⟩can be deﬁned. By ‘homo-
geneous’ turbulence, as indicated above, we mean turbulence for which all


## Page 21

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 21
such averages are invariant under translation, i.e. independent of the ori-
gin of the coordinate system adopted. By ‘isotropic’ turbulence, we mean
turbulence that is homogeneous and, in addition, invariant under rotation
of the frame of reference, i.e. statistically ‘the same in every direction’.
We note that, if homogeneous turbulence is subjected to uniform strain of
the form (6.16), then it remains homogeneous, but develops increasingly
marked anisotropy, even if isotropic initially. Homogeneous turbulence has
been intensively studied since the pioneering investigations recorded by
Batchelor (1953). A modern treatment of the subject, with emphasis on
the Kolmogorov (1941) theory and its later modiﬁcations, is provided by
Frisch (1995).
We restrict attention here to the situation when the mean velocity van-
ishes:⟨u⟩= 0. Then attention must be focussed on correlations such as
Rij(r)=⟨ui(x)uj(x+r)⟩,S ijk(r)=⟨ui(x)uj(x)uk(x+r)⟩,..., (8.1)
in standard su ﬃx notation. Equations for such correlation tensors can be
obtained from the Navier Stokes equations in a straightforward way; the
trouble is that, due to the nonlinearity of these equations, the equation for
∂Rij/∂tinvolves terms like Sijk(r); more generally, the time derivative of
anynth-order correlation inevitably involves the current value of ( n+ 1)th
order correlations. This is the famous ‘closure problem’ that bedevils the
subject. No completely satisfactory ‘closure’ hypothesis (providing an in-
stantaneous relationship between nth-order correlations and those of lower
order) has yet been found.
There is however one equation for a second-order quantity that does not
involve higher-order quantities a: this is the energy equation, easily derived
from (3.1):
d
dt
1
2
⟨
u2⟩
=−ν
⟨
ω2⟩
+ϵ. (8.2)
The nonlinear term of (3.1) makes no contribution to this energy equa-
tion, because it simply redistributes energy over an ever-increasing range
of length-scales (as if through the generation of harmonics and sub-
harmonics). We include a term ϵin (8.2), representing the rate of input
aThere is also a similar equation for the mean helicity which invol ves a dissipative term
−ν<ω·∇×ω>; however, since helicity is not sign-deﬁnite, positive helicity generation
at one scale can be compensated by negative helicity generation at another, even ne-
glecting the e ﬀect of viscosity. This means that the concept of a ‘helicity cascade’ must
be treated with caution.


## Page 22

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
22 H. K. Mo ﬀatt
of energy to the turbulence by some stirring mechanism on a scale L; on
dimensional grounds, the level of turbulent energy generated is then of order
u2
0≡
⟨
u2⟩
∼(ϵL)2/3, (8.3)
and we assume that
Re=u0L/ν>>1. (8.4)
Under statistically steady conditions, from (8.2),
⟨
ω2⟩
=ϵ/ν, (8.5)
from which we note immediately that the enstrophy
⟨
ω2
⟩
→∞ asν→0.
The picture then, as conceived by Richardson (1926) and formalised by
Kolmogorov (1941), is that energy cascades at a rate ϵfrom scales of order
Ldown to scales of order lv(<< L) at which viscous e ﬀects can dissipate
the energy (to heat). The only dimensional parameters on which the scale
lvcan depend are ϵandν, and it therefore follows on dimensional grounds
that
lv∼(ν3/ϵ)1/4. (8.6)
It then follows that
lv/L∼Re−3/4, (8.7)
so that there is indeed a wide range of scales between the ‘energy injection
scale’Land the ‘dissipation scale’ lv. It is over this range that the energy
cascade can proceed.
Kolmogorov (1941) theory is concerned with the statistical properties
of turbulence on scales small compared with L, and he assumed that on
such scales, these statistical properties are isotropic and depend only on
the parameters ϵandν, as well as on the separation variable r. Moreover, if
L> >r> >l v(the ‘inertial range’ of scales), then the statistical properties
do not depend on ν. Thus, for example, the ‘second-order structure function’⟨
(u(x+r)−u(x))2
⟩
must, on dimensional grounds, have the behaviour
⟨
(u(x+r)−u(x))2⟩
∼(ϵr)2/3. (8.8)
Similarly, the mean-square separation of two ﬂuid particles
⟨
(∆x)2
⟩
must
increase like
⟨
(∆x)2⟩
∼ϵt3, (8.9)
for so long as this quantity remains within the inertial range, a result fore-
shadowed by Richardson (1926) in an early study of atmospheric di ﬀusion.


## Page 23

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 23
This is more rapid than conventional di ﬀusion in three dimensions with
diﬀusivity D, namely
⟨
(∆x)2
⟩
∼6Dt, because, as the particles separate,
eddies on progressively larger scales contribute to the di ﬀusive process.
An equivalent formulation of the energy cascade in wave-number space
(Obukhov, 1941) gives a result for the energy spectrum function E(k) equiv-
alent to (8.8), namely
E(k)=Cϵ2/3k−5/3 (L−1≪k≪kv=l−1
v ). (8.10)
This function E(k) is deﬁned in such a way that
⟨
(u(x)2⟩
=2
∫∞
0
E(k)dk , (8.11)
so that E(k)dkis the contribution to the mean kinetic energy from wave-
numbers in the spherical shell {k, k+dk}in wave-number space. According
to the theory, the dimensionless constant Cshould be the same in all ﬁelds
of turbulence, irrespective of the nature of the source of energy on scales of
orderL, and irrespective of the context, whether environmental, meteoro-
logical, astrophysical, or whatever. The ﬁrst convincing evidence for a k−5/3
spectral range came from measurements of turbulence at a Reynolds num-
ber of order 10 8in the tidal channel to the east of Vancouver Island by Grant
et al.(1962). Since then, the Kolmogorov theory (sketched schematically in
ﬁgure 7 has provided the bedrock of our understanding of turbulence.
Yet all was not well with the theory, as Kolmogorov (1962) himself rec-
ognized; for the rate of dissipation of energy is itself a function of position
and time: ϵ=ϵ(x,t), and in regions where ϵ>⟨ϵ⟩, the energy cascade
presumably proceeds more vigorously, a runaway e ﬀect that is now known
to generate ‘intermittency’ in a ﬁeld of turbulence, i.e. regions of relatively
intense vorticity imbedded in more quiescent regions, very much as re-
vealed by DNS. Although intermittency has at most a weak e ﬀect on the
second-order structure function and on the energy spectrum function (the
k−5/3-law being apparently quite robust), higher-order statistics are more
seriously a ﬀected, and the conceptual basis for the Kolmogorov theory is
seriously undermined. Huge research e ﬀort has been devoted to the problem
of intermittency (see, for example, Frisch (1995)), but it seems fair to say
that the phenomenon still poses a great challenge to theoreticians.
A further great challenge that remains concerns the behaviour in the
‘dissipation range’ of wave-numbers k∼kvand greater, where kv=l−1
v =
(ϵ/ν3)1/4. Here the experimental evidence is that E(k) decays exponentially
fork>k v, implying smoothness of the velocity ﬁeld at the smallest scales
(always of course within the limits of a continuum description). On the other


## Page 24

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
24 H. K. Mo ﬀatt
!" #$%
& !’( ) $’*
+!’ ’ !#, % !) "
!" - . % !, /* . , " 0-
+!’ ’ !#, % !) " * . , " 0-
(,’(,+ -
!
!
!"!!!
!"!"
!"!!!"
Fig. 7. Energy cascade according to the Kolmogorov-Obukhov scenario; en ergy is sup-
plied to the turbulence at a rate ϵon scales of order L, and is dissipated at wave-numbers
of order kv=(ϵ/ν3)1/4; for wave-numbers in the inertial range L−1≪k≪kv, the en-
ergy spectrum function follows a k−5/3power law.
hand, we have the result (8.5) implying the divergence of enstrophy as ν→
0. This brings us back to the problem posed at the outset of precisely how
the energy of turbulence is dissipated at the smallest scales. The Burgers
model of section 4 provides an important clue and starting point, but the
crucial problem of the interaction of skewed vortices , as detected in DNS,
remains of central importance at these smallest scales. We may note that,
at a Reynolds number of order 10 8as in the Vancouver tidal channel, if
L∼1 km, then lv∼Re−3/4L∼1 mm; this range of scales from kilometres
down to millimetres in a 3 Dﬁeld of turbulence is far beyond what can be
simulated in even the most powerful supercomputers of the current era;
hence the continuing need for theoretical analysis of turbulence in parallel
with experimental observation and carefully crafted numerical simulation.
In this brief introduction to the huge subject of vortex dynamics and
turbulence, we have only been able to scrape the surface. Many books are
now available for students wishing to pursue the subject in depth. Notable
among these is the two-volume encyclopedic work of Monin and Yaglom
(1975). The more recent volumes of Davidson (2004) and Sagaut and Cam-
bon (2008) bear testimony to the continuing vitality of the subject. These
and other books are distinguished by two asterisks (**) in the list of refer-
ences that follows.


## Page 25

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 25
I thank Mark Hallworth for help with preparation of the ﬁgures.
References
Arnol’d, V. (1974). The asymptotic Hopf invariant and its applications, Sel.
Math. Sov. 5, pp. 327–345, [in Russian; English translation (1986)].
Batchelor, G. K. (1953). Homogeneous Turbulence (Cambridge Univ.
Press**).
Bazant, M. Z. and Mo ﬀatt, H. K. (2005). Exact solutions of the Navier-
Stokes equations having steady vortex structures, J. Fluid Mech. 541, 55,
pp. 226–264.
Beale, J., Kato, T. and Majda, A. (1984). Remarks on the breakdown of
smooth solutions for the 3-D Euler equations, Comm. Math. Phy. 94, pp.
61–66.
Burgers, J. M. (1948). A mathematical model illustrating the theory of
turbulence, Adv. Appl. Mech. 1, pp. 171–199.
Davidson, P. A. (2004). Turbulence: an Introduction for Scientists and En-
gineers (Oxford Univ. Press**).
Dombre, T., Frisch, U., Greene, J., H´ enon, M., Mehr, A. and Soward, A.
(1986). Chaotic streamlines in the ABC ﬂow, J.Fluid Mech. 167, pp. 353–
391.
Drazin, P. and Reid, W. (2005). Hydrodynamic Stability , 2nd edn. (Cam-
bridge Univ. Press**).
Euler, L. (1755). Principes g´ en´ eraux du mouvement des ﬂuides, Opera Om-
nia, ser. 2 12, pp. 54–91, [Reproduced in English translation in: Physica
D237(2008), 1825–1839].
Eyink, G., Frisch, U., Moreau, R. and Sobolevskii, A. (2008). Euler equa-
tions: 250 years on, Physica D 237.
Frisch, U. (1995). Turbulence – the Legacy of A.N. Kolmogorov (Cambridge
Univ. Press**).
Grant, H., Stewart, R. and Moilliet, A. (1962). Turbulence spectra from a
tidal channel, J.Fluid Mech. 12, pp. 241–268.
Helmholtz, H. (1858). Uber integrale der hydrodynamischen gleichungen,
welche den wirbelbewegungen entsprechen, Crelle’s Journal 55, pp. 25–55,
[English version: On integrals of the hydrodynamic equations, which express
vortex motion, see Tait (1867), below].
Kelvin, Lord (William Thomson) (1867). On vortex atoms, Phil. Mag. 34,
pp. 15–24.


## Page 26

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
26 H. K. Mo ﬀatt
Kelvin, Lord (William Thomson) (1869). On vortex motion, Trans. Roy.
Soc. Edin. 25, pp. 217–260.
Kelvin, Lord (William Thomson) (1887). Stability of ﬂuid motion: rectilin-
ear motion of viscous ﬂuid between two parallel plates, Phil. Mag. 24, 5,
pp. 188–196.
Kolmogorov, A. . (1962). A reﬁnement of previous hypotheses concerning
the local structure of turbulence in a viscous incompressible ﬂuid at high
Reynolds number, J.Fluid Mech. 13, pp. 82–85.
Kolmogorov, A. (1941). The local structure of turbulence in incompressible
viscous ﬂuid for very large Reynolds number, Dokl. Akad. Nauk. SSSR 30,
pp. 9–13.
Moﬀatt, H. (1967). Interaction of turbulence with strong wind shear, in
A. Yaglom and V. Tatarski (eds.), Atmosphere Turbulence and Radio Wave
Propagation (Nauka, Moscow), pp. 139–156.
Moﬀatt, H. (1969). The degree of knottedness of tangled vortex lines, J.
Fluid Mech. 36, pp. 117–129.
Moﬀatt, H., Kida, S. and Ohkitani, K. (1994). Stretched vortices - the
sinews of turbulence; high Reynolds number asymptotics, J. Fluid Mech.
259, pp. 241–264.
Monin, A. and Yaglom, A. (1975). Statistical Fluid Mechanics, I and II
(MIT Press**).
Moore, D. (1979). The spontaneous appearance of a singularity in the shape
of an evolving vortex sheet, Proc. Roy. Soc. London. A 365, pp. 105–119.
Moreau, J.-J. (1961). Constants d’un ilot tourbillonnaire en ﬂuide parfait
barotrope, CR Acad. Sci. Paris .
Obukhov, A. (1941). On the distribution of energy in the spectrum of tur-
bulent ﬂow, Dokl. Akad. Nauk. SSSR 32, pp. 22–24.
Orszag, S. (1977). Lectures on the statistical theory of turbulence, in
R. Balian and J.-L. Peube (eds.), Fluid Dynamics (Gordon and Breach),
pp. 237–374.
Pringle, C. and Kerswell, R. (2007). Asymmetric, helical and mirror-
symmetric travelling waves in pipe ﬂow, Phys. Rev. Lett. 99, p. 074502
[4 pages].
Richardson, L. (1926). Atmospheric di ﬀusion shown on a distance-
neighbour graph, Proc. Roy. Soc. London A 110, pp. 709–737.
Saﬀman, P. (1995). Vortex dynamics (Cambridge Univ. Press**).
Sagaut, P. and Cambon, C. (2008). Homogeneous Turbulence Dynamics
(Cambridge Univ. Press**).


## Page 27

October 6, 2010 Lecture Note Series, IMS, NUS — Review Vol. 9in x 6in singapore˙book
Vortex dynamics and turbulence 27
Schmid, P. and Henningson, D. (1994). Optimal energy density growth in
Hagen-Poiseuille ﬂow, J. Fluid Mech. 277, pp. 197–225.
Tait, P. (1867). Translation of Helmholtz’s memoir on vortex motion. Phil.
Mag.33, pp. 485–510.
Townsend, A. (1976). The Structure of Turbulent Shear Flow , 2nd edn.
(Cambridge Univ. Press**).
Waleﬀe, F. (2003). Homotopy of exact coherent structures in plane shear
ﬂows,Phys. Fluids 15, pp. 1517–1534.
Yokokawa, M., Itakura, K., Uno, A., Ishihara, T. and Kaneda,
Y. (2002). 16.4-tﬂops direct numerical simulation of turbulence by
a Fourier spectral method on the earth simulator, URL http://
www.sc-2002.org/paperpdfs/pap273.pdf .
