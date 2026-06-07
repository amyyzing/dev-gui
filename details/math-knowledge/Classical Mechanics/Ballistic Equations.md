# Ballistic Equations

Source title: BALLISTIC EQUATIONS FOR ARTILLERY SHELLS

Converted from: `3.pdf`


## Page 1

UNCLASSIFIED
An 282 305
RepAoduced
luf Ute
ARMED SERVICES TECHNICAL INFORMATION AGENCY
ARLINGTON HALL STATION
ARLINGTON 12. VIRGINIA
UNCLASSIFIED


## Page 2

NOTICE: When government or other drawlngB, speci-
fications or other data are used for any purpose
other than In connection with a definitely related
government procurement operation, the U. S.
Government therehy Incurs no responsibility, nor any
obligation whatsoever; and the fact that the Govern-
ment may have formulated, furnished, or In any way
supplied the said drawings, specifications, or other
data is not to be regarded by implication or other-
wise as in any manner licensing the holder or any
other person or corporation, or conveying any rights
or permission to manufacture, use or sell any
patented Invention that may in any way be related
thereto.


## Page 3

o CO
CM
00
282 305
H-id- &'S
T.&A.M. REPORT NO. 620
OO
CQ        -
O
CD
r—
BALLISTIC EQUATIONS FOR
ARTILLERY SHELLS
by
E. V.  Wilms S T 1 A    :
Sponsored   by
DEPARTMENT  OF   THE   ARMY
Rock   Island   Arsenal
D A-l 1-022.508-0 RD-3505
DA   Proj.   NO.   5W01-01-034
CMS   CODE   5520.  11.  440
DEPARTMENT OF THEORETICAL AND APPLIED MECHANICS
UNIVERSITY OF ILLINOIS


## Page 4

Technical Report No. 620
on a research project entitled
Artillery Carriage Dynamics
Project Supervisor:   M. Stippes
BALLISTIC EQUATIONS FOR ARTILLERY SHELLS
by
E.V. Wilms
A Research Project of the
Department of Theoretical and Applied Mechanics
University of Illinois
Sponsored by
Department of the Army
Rock Island Arsenal
DA-il-022-508-ORD-3505
DA Proj. No.  5W01-01-034
CMS CODE 5520. 11. 440
University of Illinois
Urbana,  Illinois
July,  1962
The findings in this report are not to be construed as
an official Department of the Army position.


## Page 5

This is a part of the final report on University of Illinois Project
No. 46-22-60-311,  "Artillery Carriage Dynamics Study",  delivered by
the University of Illinois pursuant to Contract No. DA-11-022-508-ORD-3505.
Government's use controlled by Articles 26 and 27 of Title II of the contract,
which are ASPR 9-107. 2 and ASPR 9-203. 1 and 9-203. 4 respectively.
This report is concerned with ballistic equations for artillery shells.
The program is under the technical supervision of Rock Island Arsenal
(RIA), Rock Island, Illinois,  and the administrative supervision of Chicago
Ordnance District.
Respectfully submitted,
University of Illinois
M.  Stippes, Project Supervisor
Department of Theoretical and
Applied Mechanics


## Page 6

TABLE OF CONTENTS
I. INTRODUCTION
II. GENERAL CONSIDERATIONS
1. Equations of Motion
2. Coordinate Systems and Basic Assumptions
III. THE FORCE SYSTEM
i.    Gravitational Force
2.    Aerodynamic Forces and Moments
IV. SUMMARY
V. APPENDIX,   COORDINATE SYSTEMS
1
2
2
3
II
11
11
22
32


## Page 7

I.   INTRODUCTION
The purpose of this report is to derive a set of equations describing the
motion of artillery shells for convenient solution by computer.    The effect of
mass unbalance is taken into account.   The equations are set up in an inertial
coordinate system and the effect of the rotation of the earth is included.
The form of the ballistic equations for rockets as formulated in University
of Illinois TAM Report No.   166 is preserved whenever possible,  and the same
notation is used.
The method of treating the rotation of the earth is that used in University
of Illinois TAM Report No.  204.


## Page 8

II.    GENERAL CONSIDERATIONS
1.    Equations of Motion
The artillery shell is a rigid body,  and the somewhat complex theorems
of linear and angular momentum which must be used in rocket theory, take
the following elementary form:
The vector sum of all the exterior forces acting on a system of particles
is equal to the time rate of change of momentum of the system.
The vector sum of the moments of the exterior forces acting on a system
of particles,  taken about the centre of mass of the system,  is equal to the time
rate of change of the angular momentum of the system.     In equation form:
d n V
K - Fk " dT =   G  +   F
\x*x pk d t N
(1)
(2)
where v F,    and
k   k
r r     x   F       represent respectively the sum of
the exterior forces acting on the shell and the sum of the moments of these forces
taken about the mass centre,    Trf   ,  and      ^     are respectively the momentum
of the shell,  and the angular momentum of the shell about the mass centre.    G
is the resultant aerodynamic force,    F   the force due to gravity,  and   N    the
moment due to the aerodynamic forces.


## Page 9

2.    Coordinate Systems and Basic Assumptions
In establishing the equations of motion of an artillery shell, we must apply
Newton's laws of motion in an inertial coordinate system.   For purposes of this
discussion, we will consider an inertial system to be one which consists of the
normal,  tangent, and binormal to the path of the earth's centre    The particular
system to be used will be rectangular  Xo, Yoi Zo coordinates chosen in such
a way that:
(a) The origin will coincide with the mass centre of the shell at launch.
(b) The direction of aim of the shell will be in the plane   Y    =0  o
(c) The   Zo   axis will pass through the "centre" of the earth.
In order to obtain the location of the shell in a system fixed with respect to the
earth, we have to apply a transformation between two coordinate systems.    These
transformations are derived in the appendix.    Let us briefly describe the nature
of the two coordinate systems.    The coordinates (Xg,  Yg,  Z    ) (measured with
respect to the earth),   are defined in Eqs. (A-17) to be functions of (X ,  Y      Z   ) y   o'     o'     o'
(the inertial coordinates),  and also of (9^ c^,   P]j, ^ ),  the coordinates and
direction of the shell at launch measured in a system fixed in the earth.
It may further be convenient to express the (Xg,    Yg,  Z    ) coordinates in
terms of the longitude,  latitude,  and altitude.    In Eqs. (A-19) (p„,  «fr ,  6    ) are E      E      E
expressed as functions of (XE, Yg, Zg ) .   Here  ci>E   and   eE   are related to the
latitude and longitude as described in section iii of the appendix.
The wind velocities which are used in computing the aerodyn-imic forces
must be expressed in terms of the (X0,  Y ,  Zo ) system.   However,  they will
be given in terms of the earth coordinates (Sg,  «j^,  pE ) , and are specified by a
direction   $„ (azimuth) plus vertical and horizontal components P     and  O 11 w ^A w


## Page 10

4.
Let us now return to the inertial  Xo Y   Z     coordinate system and
talk about the equations of motion in detail.
Z
orientation of the X   Y    Z    system o    o    o   -^
given in terms of the angles   9   , <$>
^i.    measured relative to the (X*,  Y,,,,  Z#) \
system,  as described in the appendix.
X* . ^
(at launch)
X E
FIGURE   1
Y* =  YE (at launch)
COORDINATE SYSTEMS


## Page 11

Let R  be the vector from the origin of the X   Y   Z     system to the
mass centre of the shell, and let   R have components (X , Y , Z   ) in (X   Y   Z   ). O      0      o ooo
— d R Then the velocity of the mass centre is    v   =    -r—    and has components
dX d Y dZ at
d t      .   -g-jr .      d t       in (Xo Yo Zo ).    At the mass centre   c   , we construct
(X    Y   Z   ) which moves with   c   but remains always parallel to  X   Y   Z   . w     C-     w ooo
This is illustrated in Fig.   1.
We will use the subscripts 1, 2, 3 for the components of vectors in
(Xo Yo Zo ). Then, since the mass m of the shell is fixed, Eq. (1) may be
written
dX  c^
d t "I'M m -a-S    =   G, + F
d Y
m -ar - G2 + F2 (3)
dZ
m   ^F    =   G3 + F3
where
dXo
d t
•
=   X o
d Y o
dt
•
=   Y 0
dZ 0
dt
*
=   Z 0
Now, principal axes and moments of inertia for the shell may be computed.
The c-xyz   coordinate system may be constructed with the   y-axis along the
principal longitudinal axis of inertia (plai),  and the x   and   z   axes along the other
two (transverse) principal axes as shown in Fig.   1.   The orientation of c-xyz is


## Page 12

6.
defined by the three rotations    4»   ,    9   » ^   taken in the indicated order.    The
angular velocity vector of  c-xyz   will be denoted by     co   .    Let  1,1,1
denote the principal moments of inertia along the x, y,  and   z  axes.    It will also
^  /\  ^ be convenient to use   i, j, k   as unit vectors in the x,  y, z directions respectively.
We will use the subscripts   x, y,  z   for components of vectors in c-xyz   .   The
angular momentum of the shell (about   c ),  can now be written as:
X   ^   i I   w     + i I    oj     + k I    w (5) xxJyy zz
From F.ig.   1 it is apparent that the components of angular velocity are given by:
d 4» ,.       ,      d e OJ cos 9 sin ;/)   +     . cos $ , at d t     ~ r        d t
co      =  -3    sin   9   +   —f y d t d t
CO
d 4»   _„ ,   _._ ,      d e
z        d —   cos  9   cos ib  + -3    sin ib t a t T
which can be inverted to yield:
d 4>
d t
d 9
dt
d ^i
d t
sec    9     co   cos ^ - to   sin ^ 1
=    co   cos 0 + co   sin i/i , (6)
co    - tan  9     co   cos ^ - co   sin ih\ y i.    z r      x        rJ
(We assume that     9   is always within the bounds        I 9 | <    Tf/l ).
d* _      ^ Differentiating Eq. (5),  and recalling that  -r—    =     co  x   i,  etc. we obtain


## Page 13

dt
7.
d £■ ^ r   d =    1 f   -£-  (I    co   )  +  (I    - I   ) w   co   ] Ldt^xx'       vz      yzyj
+   ?  f -f~ (I    co   ) + (I    - I   ) co   w   1 JLdt      yy x     z'   xzj
+ k  f -rr- (I   w  ) + (I   - I   ) Ldt    xzz ^v      x CO      CO
y x
We now assume that the shell is rotationally symmetric so that we can
set I    =1     =1, 1    =   I'.   Then Eq. (2) can be written in the scalar form: x        z y
d co
d t (I - I") co   co     +  N y   z x
d co
d co
I d t
N
(1 - I') w   co     +  N '   y   x z
(7)
When we consider the aerodynamic forces and moments it will be
convenient to have the velocities relative to the undisturbed air in the neighborhood
of the shell rather than the fixed  X    Y   Z     coordinate system.    Therefore o    o    o '
in the neighborhood of the shell the undisturbed air flow would have had a linear
velocity  W  .    The velocity of the shell relative to air can then be defined by:
so that
V
X
- w
v1 +w1
v2+w2 (8)
V    + W 3 3


## Page 14

8.
where  W    , W   , W     are known functions of time and position.   We can now
substitute Eq. (8) into Eq. (3) and (4) to obtain
dX
V. + W, dt '1 '  "1
d Y
-d^-=V2 + W2 (9)
d Z
':  = v0 + w.
and
d t Y3T     3
d V
m     . =   -mW.+F.+G. d t ill
d V2
m -3-^-     =   -mW2 + F2 + G2 (10)
d V
m—,      =-   mW3+F3 + G3
dW
where we have set W.  = ,  etc.
The wind velocities will be specified in a coordinate system fixed in
the earth.    As mentioned previously,  they are specified by a direction   ip
(azimuth),  plus vertical and horizontal components   P,..   and  Q,,, .    Let us use w w
the transformation of a vector from earth to fixed coordinates as indicated in the
appendix (A-23,  A-24),
Then,  the wind velocities become:


## Page 15

9.
Wl =   PW ^AE(A L C0S nt + D,L sin 12 t) + BE (-A'L sin fi t+ D'    cos n t)
+ CE G L >
+ QW (GE(A'L cos ß t + D'L sin n t) + Hg ("A^ sin n t + D'     cos n t)
W2 = PW ^AE ^B l! cos n t + E'L sin ß t ) + BE (-B'L sin n t + E'    cos 12 t )
+ CEA'L)
+ QW (GE (B'L cos 12 t+ E'L sin 12 t ) + HE (-B'L sin 121 + E'     cos 12 t )
+ JEH'L) (11)
W3 = PW (AE ^C'L cos n t + F,L sin ^ t ) + BE ("CV sin 121 -h F'     cos 12 t )
^EJ'L)
+ Qw (GE (C^ cos 12 t + F^ sin 12 t ) + Hg (-C*     sin 12 t + F'    cos 12 t )
^EJ'L)
The quantities   AE ... JE>    A'    ... J'      arise due to the transformation
as discussed in the appendix,  and are defined there.
Eqs. (6), (7), (9) and (10) constitute a system of twelve first order
differential equations in the twelve dependent variables   X,Y,Z,V1,V2, V^,
<t>   ,   9   ,   i/i ,  wx , w . wz ,  and the independent variable   t (time ).    It remains
now to express the other terms in this set of equations in terms of these twelve
generalized coordinates and the time.


## Page 16

10.
We will need expressions for the direction cosines of the  X   Y   Z o    o    o
and   c-xyz axes with respect to each other.    From Fig.   1 to within first order
terms (in <t>) we have:
a , =  cos i/) - 4> sin 9 sin ip ,
a „ = «t» cos i/i + sin 9 sin ip ,
a „ =   -cos 9 sin ip ,
a ,  =  -<t>cos 9 ,
a      =  cos 9 , (12)
y2 •
a „ =  sin 9 , y3
a  .  =  sin ip + $ sin 9 cos ip , zl
a „ = 4" sin ip - sin 9 cos ip ,
a „ =  cos 9 cos ip   .
Then if  u   is a vector we have
ux = axl ul + ax2 u2 + ax3 u3   '    etC-
u.^a.u    +a1u+a1u     ,  etc. 1        xl   x        yl    y        zl    z


## Page 17

11.
III.    THE FORCE SYSTEM
1.    Gravitational Force
We will consider the gravitational force to be given by :
F =   - m g   ( —S_) " <? 6o v PE   '      e
where    g     is a unit vector along the line joining the centre of mass of the
shell, and the centre of the earth,    pE   is the distance from the shell to the
earth's centre,  and   p     is the radius of the earth.    The components of    g
must be expressed in the   X   Y   Z     system.   To this end, we utilize the
transformation of a vector derived in the appendix, (Eqs.  A-23,  A-24), with
P = 0, Q = 1 .
Then the components of the gravitational force are:
Fl = " m go (72_)      ( GE (A,L COS  n t + D'L sin n t )
+ HE (-A'L sin fi t   + D^ cos fj t ) + J    G'     )
0o.2 m gn( -—)     ( GIT(B'T   cos S2 t+ E'.   sin fit) o     pp. t,       L L
+ HE (-B'L sin J2 t + E^ cos 12 t ) + JE H^ ) (13)
p      2
F3 = " m g0( -^ )      ( GE (C^ cos fi t + F'L sin n t)
+ HE (C'L sin ^ t + F'L COS " ' ) + JE J,L)
2.    Aerodynamic Forces and Moments
The aerodynamic forces and moments are classified in three categories:


## Page 18

12.
a) Those independent of angular velocity (Drag Force,  Lift Force
or Force due to cross velocity, Restoring Moment or Moment due
to cross velocity),
b) Those depending on transverse angular velocity of the shell
(Force due to cross spin, Damping Moment or Moment due to cross
spin),
c) Those depending on the axial spin of the shell (Roll Moment or Moment
due to spin, Magnus force and moment due to cross velocity and cross
spin).
Although these forces and moments interact with each other,  they are traditionally
treated separately.
It is also customary to describe the aerodynamic forces and moments by
means of dimensionless aerodynamic coefficients.    For this purpose we introduce
the average mass density of the air surrounding the shell and denote this density
by    p   ; we also need a length characteristic of the shell and therefore introduce
the diameter  d   of the shell.   Also we use the linear and angular velocities of
the shell where appropriate.    Since we wish to base our computation on motion
of the shell in undisturbed air we must account for winds by using  V   as the
velocity of the mass centre of the shell with respect to the air.
Drag Force and Lift Force.   The aerodynamic force which acts on the shell when
there is no angular velocity  (w   = 0 ) is resolved into two components; the drag
force  D    which is taken parallel to   V ,  and the lift force   L   perpendicular to
V .    We define the drag coefficient   Kn  and the lift coefficient   IC,   by
D = KD p d2 V2   ,
L = KN p d2 V2  .


## Page 19

13.
From physical considerations we can argue that there must be at least three
principal directions such that if V  is parallel to one of them the lift force is
zero.    The principal direction most nearly parallel to the  plai  of the shell is
called the aerodynamic axis and the angle between the aerodynamic axis and V
is called the angle of attack (denoted by o).    Let ^ be a unit vector along the
aerodynamic axis.   "We assume that  a   is a first order quantity and use the
angles   |x  and  £z   to orient   e   in the c-xyz   coordinate system as shown
in Fig,   2.    Then to first order terms
e   = -£   , e X bZ  ' V Z ^X
and
e1  = - <)) cos © - ^z cos ;/) +   ^    sin   tp ,
e2 = cos 6 - sin 9 (£    cos ^ +   ^    sin   ip ) , (14)
e3 = sin 9 + cos 6 (^ cos ^ +   |    sin   ip ).
B—   y
FIGURE   2
AERODYNAMIC AXI«;


## Page 20

• 14.
'
Also o
2        .2        „2
•
We assume that the lift force vector lies in the plane defined by  e  and
V ,  and since we have specified   L  perpendicular to   V  we could write
L   =   KLpd     Vx(exV)
-   v        ^2   f      2 A        —     s^    — "] =   KLpd         Ve-V-eV
where
•
KN =   KL Sin a  =  KL   a
to first order terms.   We could also write  V - g" = V cos a = V   to first order
* terms so that
Ll =   KL p d2 V [ V (- 4. cos © + £    sin ^ - e    cos ^ ) - V.  1     ,
L2   = KL p d2 V  [ (V cos 6  - v2) - V (ex cos  ^ +^z sin ^ ) sin   e]       (15)
L3 = kLpd2V ^ (V sin 9 - v3 ) + V (ex cos  ^ + ez sin ^ ) cos e]
The drag force is written as
D   = -KD p d2 V   V .
so that
D1 = -KDPd2VV1,
* D2 = -KDpd2   VV2(                                                                                              (16)
1
- D3--KDPd2   V V3   •


## Page 21

15.
For small angles of attack both   K.    and   KD can be taken as independent
of  a  since both must be (approximately) even functions of   a  and therefore the
dependence will be second order.    The other significant variables,  chief among
which is the velocity,  are assumed to enter only by way of the Mach number
related to  V   and we therefore allow   K,    and   Kp.   to be functions of Mach
number.   If we further assume that both the sonic velocity and the mass density
p   depend only on altitude,   the drag and lift forces can be determined from the
generalized coordinates and the time.
Restoring Moment.      The aerodynamic moment which acts on the shell when there
is no angular velocity has a component perpendicular to the aerodynamic axis.
Since this moment is due to the same forces as the Lift and Drag force,  it follows
that the restoring moment must be perpendicular to   V   also.   We use  P  for the
restoring moment and write
P = Kp p d3 V2    ,
where   Kp   is the restoring moment coefficient,  positive if  P • "e   x  V   ^    0.    It
is usually more convenient to define a centre of lift by the vector   lp      from the
mass centre.
such that
I   = -£   "e ap      üp e
P = £p   x   L   ,
so that  £p   has the same sign as   Kp ,    It follows then that
P =   KL  p   d2 Ip   x     [ V   x  (e   x  V ) ]
KL  p   d2 £p (e •  V ) (e   x  V   )   .


## Page 22

16.
and to first order terms
e
Px = KL p dZ -^P V   [ <Vl + V2 <|>  ) sin ^ - (V2 sin 6 - V3 cos 9 ) cos ^
- ix (v2 cos e + v3 sin e )]
Py^' (17)
Pz =   -KL   p   d   £p V   [   (V1 + V2   <j> ) cos ^ + (V2 sin  6   - Vg cos   9 ) sin tp
+  iz (V2cos 6 +V3 sin   6 )]
It is presumed that  £p   is a known function of time and the Mach number associated
with  V .   Dependence on all other parameters, including angle of attack,is
ignored.    Generally,  the location of the centre of lift is taken as a function of
Mach number only, while the location of the mass centre is a function of time only.
Force and Moment Due to Cross Spin.       If the shell has an angular velocity  Ü
the resultant aerodynamic force and moment will,   in general,  be different from the
case when angular velocity is absent.    For if     p    is a vector from the mass centre
to some point on the surface of the shell,  the velocity of this point will be   V +    13     x   p
with respect to the air.  and among other things,  the aerodynamic force exerted on
a small part of the surface depends on the velocity of that surface with respect to
the nearby undisturbed air.    The component of the angular velocity which is
perpendicular to the aerodynamic axis,   Ü,   ,  is called the cross spin.    Clearly
ws=ex(wxe)-w-(^.w)a.
The additional aerodynamic force due to cross spin is denoted by  S   and is assumed
to be perpendicular to both   e   and


## Page 23

17.
S   =   K0pd   Vex~ s r s
=   K„pd   Ve"xco
where   Ks   is the cross spin force coefficient.    To within first order terms,
S1 =   - Ks p d   V   L (wx + ez wy ) sin ^  - (a)z - t   u   ) cos  tp
3 r
s2 = KS p d v   [ (Wx + ez co ) cos ^ + (coz - ex w > z     3x   y sin ^i
S3 =   "Ks p d   V    [ <ux + ^z "y ) cos ^  +  (wz " ^x wv ) si in ^
sin 9   (18)
cos 6 y' T ^  z     ^x "y
A similar argument can be advanced for the existence of a moment due to
cross spin,   H , which must be parallel to the cross spin.   We therefore write
H =  -K„ p d4 V w H r s
-KH p d   V e  x  (w  x   e )
so that,  to first order terms,
Hx=-KHpd4v [Wx+e CO
z   yj
H    = 0 , y
H    =  -K    p d4 V    f co    - e    oo   1 z H r L    z     sx   yj
(19)
where   KH , the cross spin moment coefficient is also called the damping moment
coefficient.   This name follows from the fact that for   K,,    ^    0, the moment  H
is proportional to the cross spin and tends to damp it out.
The coefficients   Ks   and  KH   are usually taken to equal zero   since their
effect is generally smaU compared to the effects of other causes.    In any event.


## Page 24

18.
we presume that  Ks   and  KH   are at most known functions of the Mach
number associated with V .   Sometimes it is convenient to define a cross spin
centre of pressure by the vector I     from the mass centre,   £    =    -£  ^ where ö s s
KH = Ks £s .    Note that  £s   can now be a function of Mach number and time.
Also,  if the cross spin centre of pressure is behind the mass centre (£    >  0 ) s
the damping moment does indeed oppose the cross spin.
Roll Moment.      To this point we have accounted for the aerodynamic force and
moment due to the linear and angular velocity of the shell in still air, except for
the component of moment along the aerodynamic axis due to linear velocity, and
the force and moment due to the component of angular velocity along the aero-
dynamic axis.    Aerodynamically, we assume that the shell is a surface of
revolution about the aerodynamic axis.   Due to skin friction,  the component
of angular velocity along the aerodynamic axis causes a friction moment about
this axis.   If   R   denotes this moment, then we can write
R =   -KF p   d4 V ( Ü • e ) e   ,
or to first order terms,
R    = K- p d4 V cü   ^     , x        F y   z
Ry = "KF P d4 V wy       ' (20)
R    = -Kp p d4 V co   e       • z F r y   x
We suppose that   Kp , the roll friction coefficient, is at most a function of the
Mach numbers associated with  V   and   -~   w .


## Page 25

19.
Magnus Force and Moment.      We have finally to consider the Magnus force and
moment.    These are significant only when there is appreciable angular velocity
along the aerodynamic axis.    Then there will be a force perpendicular to both
V and  e  (if they are not parallel ) which can be represented by
M       M r e
where   w^ = ( w « e )   e   is the component of angular velocity along the aero-
dynamic axis,  and KM   is the Magnus force coefficient due to cross velocity,
assumed to be at most a function of the Mach number associated with -   w    and 2      e
V .   To first order terms
FM   =   KMPdSe   XV
so that *
FM1 =   "KM p d   wy  [   V (^x cos   ^ + ^z sin ^) + V2 sin 9  - V3 cos   e]      ,
3 r
FM2 " ^ p d   wy    [ Vi «in 6   + Vg ( (J) cos  6 - ^ sin ^  +   ^z cos ^ ) 1      (21)
FM3 S ^M p d   wy    LV1 COS e   +   V2 ( * cos e   ■ ^x Sin   *   + ^z C0S ^ >]       '
Now because the cross spin adds a cross velocity to pouts away from
the mass centre (in the amount  we   x  7   where   p   is the position vector from
the mass centre) we might expect the cross velocity to affect the Magnus force.
We therefore suppose  KM  to be measured at zero cross spin and consider a
Magnus force due to cross spin,    F   ' with coefficient   K   ' .   We therefore
write


## Page 26

20.
F'», -   K',, pd   a)   ex(exco) M M r y v s '
=   -K\, p d4co   w ^21) M K        y   s
4        r ^ '/s i
M r        y    L       x       y *z'        s z      y   x'.
so that
F'    . = -K'., p d   co     [ (co    +co   £;    ) cos  iZ» + (w    - w   £    ) sin  iil Mi M r y   L     x       y   z r      v  z       y bx' ^J
F,M2 =   "K'M P d   wy   [(ax + wy ^z ) sin   * " K " "y ^x ) COS *] Sin e '   (22)
F,M3 =     K,Mpd   wy    [(wx + wy ^z ) Sin   *  '  (wz " wy ^x ) cos  ^J  cos 6   .
We should also expect a Magnus moment due to cross velocity and one due
to cross spin.     We define a Magnus cross velocity centre of pressure by the vector
1M = -iM e    from the mass centre and allow  £M   to be a function of the Mach
number associated with  V,   "ö we   and Possibly tiie time.    Then we write
^M = ^  X   FM .
■      =   -KMP^M'V X ^x V )
=   KM   Pd3^MWy     [v-(e- V   )e]
so that
^x  =KMpd3£MWy   [V^z+(Vi+V2<{)> ^^  +   (V2 sin e-V3 cose) sin,/,]
^y  = 0   ' (23)
^z  =KMpd3jeMWy   [-v^x+<v1+v2<,)) ^^ ■ <V2sine" V3cos 9> cos *]


## Page 27

21.
Similarly,   we define a Magnus cross spin centre of pressure by
i\. = -£'     e   and write M M
MMS1,    X     F'M
= K'., p d   £•       u   e    x    w , M M     y s
= K\. pd4Je•..   u      ll(M   -w   g    ) - k(a)    +w   ^    )] M M     yL^z       y^x' vx        yzJ
so that
M,Mx =     K'MPd4£,MwyH-wy^x>   '
M'My =0' (24)
M,Mz =-K'MPd4£'MVwx+aV^z)-


## Page 28

22.
IV.    SUMMARY
The equations of motion along with the necessary notation are collected
in this chapter for easy reference.    The independent variable is time denoted by  t .
The equations of motion are in the form of a system of twelve first order differential
equations in twelve coordinates:
X   Y   Z o    o    o
V1V2V3
<t>, e, jp
CO      ,    W   ,    GO
x       y     z
components of the displacement vector of the mass centre of the
shell from the launching site (measured in inertial coordinates)
inertial components of the velocity vector of the mass centre
relative to the air
angles orientating the shell
components of the angular velocity vector of the shell
The twelve equations of motion are
dX
-arr - vi = v, +w,
d Y
-df   =   V2+W2 (9)
d Z
-TT    =  V3 + W3
d V
m
m
m
1
d t
dV.  ^
d t
dVc
"dT
-m W1 + F1 + G1
-mW2 + F2 + G2
-m W3 + F3 + G3
(10)


## Page 29

d<))
dt
d e
dt
d^
= sec   0   I    co   cos ip - u   sin $    j
co   cos ^ + co_ sin ib
.   -    = w    - tan 9 d t y I w   cos 0 - to   sin e/)
23.
(6)
d co  x
d t =   (r-i)"yWz+Nx
/d co
■'if =    N (7)
d t =    (I - I") co   co    +N y  x        z
We now define the individual terms in the above equations:
Wl   =  PW (AE (A'L cosiit + D'L sin ß t ) + BE C-A'L sin n t + D'L cos n t)
+ CEG,L>
+ QW(GE (A'L cos fit + D'L sinnt) + HE (-A'L sin 12 t + D'    cos n t )
+ JEGL>
W2   =Pw(AE(B'LCOSnt + E'LSinnt)+BE("B'l  «innt + E'j   cos n t )
+ CEAL) (11)
+ QW(GE(B'L COS "t + E'LSin 8 t)-♦-Hg (-B'L sin a t + E'    cos fit)
+ JEH,L)


## Page 30

23.
= sec   6       u   cos ^ - co   sin ^    ]
= w   cos ip +u   sin ip
^&~ = Wy - tan 9 [ Wz cos ^ - w sin ^ ]
d4>
dt
d e
d t
d iji
(6)
d t
/d w
1V-
=   (r - i)w„« + N y  z      x
=    N (7)
d t = (i - r) co co +N y  x        z
We now define the individual terms in the above equations:
Wl   "  PW(AE(A,LCOsnt + D'LSinRt)+BE<-A'LSinßt + D'LCOsnt>
+ CEG,L>
+ QW (GE (A'L cos n t + D'L sin ß t ) + HE (-A'L sin J21 + D'L cos 8 t )
+ JEG,L)
W2   = PW (AE (B'L cos « t + E'L sin n t ) +BE (-B'L sin ß t + B^ cos fl t )
+ CEA'L> (11)
+ Qw (GE (B'L cos fi t + E'L sin Ö t > + H    (-B1    sin fi t + E'    cos n t )
+ JEHL)


## Page 31

24.
W3   =PW(AE(C'LCOS nt + F'L Sinnt)+BE(-C,L sinnt + F'    cos ß t)
+ CE J'L >
+ QW (GE(c'Lcos nt + F^ sinfl t) +H    (-C'L sinfit + F'    cos n t)
+ JE J'L)
'o   .2
Fl = "m go ( 7~ ^    (   GE (A'L cosnt + D'L sin n t ) E
+ HE (-A'L sin nt + D'L cos nt)+JE G'     )
po     2
F2 = ■m go ( ~ >    < GE (B'L cos fi t + E'L sin J2 t )
+ HE ("B'L sin n t + E'L cos n t ) + JE H^ )
^)2
PE
+ HE(-C'L sin ßt + F'L cos n t ) +JE J'L)
F3 = -m g0    (-r~ )    ( GE (C^ cos ß t + F'L sin ßt)
E
AE = C0S   eF COS ^F COS ^P + sin eT7 sin ^l
BE  = Sin eE COS ^E COS ^E " C0S eF Sin ^T
CE =  -sin ^ cos ^E
(11)
(13)
(A-25)
GE = cos 9    sin <j)
HE = sin eE sin ^_
JE   = cos ^j


## Page 32

25.
PE2 = XE2 + YE2 + ZE2
<t>E  ^os-1   ZE/     /xE2-fYE2+ZE2 (A.19)
0E  =Sin'i   YE/     /XE2+YT
2
XE =Xo (AL cos ß t + BL sin n t) + Yo (DL cos n t + EL sin fi t)
+ (z0 + P ) (C'L cos ß t + HL sin fi t )
YE = Xo ("AL sin ß t + BL cos J2 t ) + Yo (-DL sin fl t + EL cos fi t)
+ (z0 + P ) (-GL sin n t + HL cos ßt) (A-17)
ZE=CLXO + FLYO+JL<ZO + PE)
AL  = cos eL cos 4»L cos ijj    + sin 6    sin ip
BL   =sin GL cos ^ cos ^    - cos 8    sin ip
CL = - sin <j>    cos ip
DL = cos eL cos 4>L sin 41    - sin 6    cos $
EL = sin eL cos fL sin ^ + cos eL cos ^ (A.18)
FL = - sin <t,L sin ^
G.   = cos 0    sin <}) ■L' Li L,
H.   = sin 9    sin $
JL   =cos4>L


## Page 33

A'    = cos ip    cos A    cos 9    + sin ip    sin 9
B'    = sin ip    cos <\>    cos 9    - cos $    sin 9
C'    =   sin $.  cos 9
26.
D'L =  cos ip    cos cj).  sin 9    - sin ip    cos 9
E'L=   sin ^ cos 4)L sin 9    + cos ^i    cos 9 (A-13)
F'    =   sin <>    sin 9 Li LI LI
G'J -   -cos jp    sin <J)
H'    =   -sin ip    sin 6
J'L = COS ^L
G1 = D1+L1 + S1 + FMi+FM1       etc.
D1 =  -KD p d2  V V,1   ,
D2=-KDpd2VV2       . (16)
D3=-KDpd2VV3      .
2
Lj^ = KL p d   V ( V (-(> cos 9   +   ^x sin i/i -    g       cos ;/) ) - V.   )
2
L2 = KL p d   V (  (V cos 9 - V2 ) - V (^x cos ip +  ^z sin ^ ) si n 9 )     (15)
2
L3 =: KL p d   V(   (v sin 9 - V3 ) + V (^x cos ^  + ^    sin ^ ) cos 9 )


## Page 34

27.
3
51 =   -Ks p d   V (   (Wx +ez "y ) sin ip - (Wz ■- ^x coy ) cos ^ )
3
52 =   Ks p d   V ( (^ + ez ^y ) cos ^  + (coz - ex o^ ) sin  0  )    sin  9
3
53 =   "Ks P d   V <  K  +^z wy > cos  ^  + (coz - ex w   ) sin ^ )     cos 6      (ig)
3
FM1 =  ^M p d   ^y ( V ^x COS   ^ + ^z sin  ^) + v9 sin e - V, cos   6 )
y
2 H*"  ' '3
3
FM2 = KM p d   wy ( Vi sin 6 +  Vg (  4» cos 9 - ^ sin ^   + ^ cos ^ )) (21)
FM3 =  ^M p d   "y (  Vl cos   e + V2 ( 4> cos 9 - §    sto   ^ +§    cos  ^ ) )     .
F'M1 -  "K M P d' wy (  (wx + wv ^z ) cos ^  + K - oo   eY ) sin    ^)    ,
A
^y '   ^-x  '  "y *2 ' v'"0 ^   '   ^z ' "V 5x
F,M2 =  ^M p d   wy   ^ K + wy ^z > sil1 * " (wz " "y ^x ) cos ^    )   sin   9   (22)
4
F MS = K'M p d   wy < (wx + wy ^z ) sin  ^ ' (wz ' "y £x ) cos ^ )      cos 9
Nx=Px+Hx+Rx+MMx+MMx'     etc-
Px = KL p d      ip   V ( (V1 + V2 4>) sin  ^ - (V2 sin  9 - V3 cos 9 ) cos tj)
-gx (V2 cos   9  + V3 sin 9 )  )
py=0- (IT)
2
Pz = "KL p d     £P  V ( <V1  + V2 <(> ) cos  ^  + (V2 sin 9 - V3 cos 9 ) Sin   ^
+ ^z (V2 cos   9 +  V3 sin 9 ) )
4
H Hv =  "KH P d4 V (   w   + e    co   ) H x       z   y
Hy = 0' (19)
HZ =   ^H P ^ V   < w    " ^     w      > . z M z       x    y


## Page 35

28.
R    = K^ p cT V co   6 x F r y    z
R    = -K_ p d   V w y       F y (20)
R    = -KD p d* V a)   g z F r y   x
MMx = KM P d     £M wy (  V ^z + (V1 + V2 ^ ) C0S   ^ + (V2 Sin e  " V3 cos e) s^)
MMy=  Ü (23)
MMz = KM P d     ^M wy ( "V ex+ (V1 + V2 * > sin ^ " (V2 sin e ' V3 C0SV> ** if)
M\^-; +K\. pd4^^,^  H,e, ) , Mx M y     z      y Jx
MMy=  0' (24)
M,M7.= -K'MPd J^'^^K+HJ,)      • Mz M y     x        y    z


## Page 36

29.
Notation
2 9 9 o
I V=V1+V2+V3
W1, W2, W3 - components of the wind velocity in the neighborhood of the shell,
relative to the inertial reference system
mass of the shell (constant)
principal transverse moment of inertia of the shell (constant)
principal longitudinal moment of inertia of the shell (constant)
aerodynamic malalignment angles (constant)
density of the air (function of position),  i. e,  B„,  p      4> CJ       rtt       Ct
shell diameter
aerodynamic drag force
aerodynamic lift force
aerodynamic cross spin force
FMr  FM2'   FM3 Magnus force due to cross velocity
F Ml'  F M2'   F'M3        Ma§:nus force due to cross spin
P      P     P „. x'     y     z aerodynamic restoring moment (due to cross velocity)
Hx'  Hy'  Hz aerodynamic damping moment (due to cross spin)
Rx'  ^  Rz aerodynamic roll moment
MMx'  ^^My'   MMz Magnus moment due to cross velocity
^Mx'  M,My,   M'MZ Magnus moment due to cross spin
KD aerodynamic drag coefficient (function of Mach number)
KL aerodynamic lift coefficient (function, of Mach number)
KS aerodynamic cross spin force coefficient (function of Mach number)
KM Magnus force coefficient due to cross velocity (function of Mach
number)
m
I
I'
**' h
P
d
Dl- D2. D3
Lv L2,   L3
Sl' S2-S3


## Page 37

30.
aerodynamic damping moment coefficient (function of
Mach number)
aerodynamic roll fricticn coefficient (function of Mach number)
distance between mass centre and centre of lift (function of
Mach number)
distance between mass centre and Magnus cross spin centre
of pressure (function of Mach number)
horizontal and vertical components of wind velocity
ipr, direction of wind velocity as given in coordinates fixed in
the earth
9-,, <!>_,, pg coordinates of a point measured in earth coordinates
9^, <t>j   >   p, coordinates of the shell at time of launch (fixed with respect
to the earth)
ß angular velocity of the earth    - 2 IT radians/day
KH o
KF
£P
£M
Pw' Qw


## Page 38

30.
K H
K,
£M
P . Q
8B'*E' PE
eL' ^L ■   PL
Q
aerodynamic damping moment coefficient (function of
Mach number)
aerodynamic roll friction coefficient (function of Mach number)
distance between mass centre and centre of lift (function of
Mach number)
distance between mass centre and Magnus cross spin centre
of pressure (function of Mach number)
horizontal and vertical components of wind velocity
direction of wind velocity as given in coordinates fixed in
the earth
coordinates of a point measured in earth coordinates
coordinates of the shell at time of launch (fixed with respect
to the earth)
angular velocity of the earth    = 2 TT radians/day


## Page 39

32.
V.       APPENDIX
COORDINATE SYSTEMS
i We will first derive some general transformations, and then apply them
to specific applications.   Let us consider 4 such transformations.
ii     General Transformations
ii-1   Rotation of Coordinate. Axes
Let us successively make rotations about the  X,  Y, and   Z   axes res-
pectively; through the angles    9,  $, and  tp .   Then we will obtain the following
relations between unit vectors:
A A A y<
i'= iA+jB+kC
^ A, A A
j' = i D+ j E+ k F
^ A A *-
k'=   i G+ j H +k J
/•^     y~ A A
I = i' A' + j' B' +k' C
j = i' D' +y E' + k' F'
k=   i' G' + j' H' + k'J'
A-l
A       A    A. >^        ^^        /^
Here i, j, k,  and   i', j', k',  are unit vectors along the X,  Y,  Z,  and  X', Y',  Z'
axes respectively.


## Page 40

Also: Figure   A-l
A = cos 6 cos «J» cos i/i + sin 6 sin y      A'  ■ cos 4J cos ^ cos 6  + sin ip sin 6
B = sin 6   cos $  cos ip - cos 6   sin ip
C = -sin <t> cos ip
D = cos 6   cos <p  sin ip - sin 6 ccs tjj
B' = sin ip cos 4»   cos 6   - cos !p sin 6
C = sm <J) cos  6
D' = cos ip cos <p sin 6   - sin ^ cos 6
33.
A-2
E = sin 9 cos <p sin i/i + cos 6 cos tp      E' = sin j/, cos a> sin 6   + cos ip cos 6
F = -sin«})  sin ip
G = cos Ö   sin<j)
H = sin 8 sin <}>
J = cos <j)
F' = sin 6  sin 9
G' = -cos ip sin <j)
H' = -sin ^i sin <)>
J'   = cos 4)
Then any point may be located by the vector:
r = iX + j Y + kZ = i' X' + j' Y' +k' Z'


## Page 41

where:
X = AX' +DY, + GZ'
Y = BX' + EY'+ HZ'
Z = CX* + FY'+JZ1
ii-2   Translation of Coordinate Axes:
Z„
X' = A,X+ D'Y+ G'Z
Y' = B,X+ E'Y+ H'Z
Z' - C,X+ F'Y + J'Z
A-3
It will frequently be convenient
to consider the translation of
coordinates given by:
xs = x
xc
Ys^Y
's  Zs = z-Ps
A-4
PS
Figure   A-2
ii-3   Rotation of the Earth
Consider X Y Z to be a rectangular system of coordinates fixed in the earth,
with the   Z   axis along the axis of rotation of the earth.    Let X*,   Y.,.,  Z^  be an
inertial system such that   Z*   will coincide with Z .    The X,  Y,  Z system then rotates
with a constant angular velocity   k   n  with respect to the XÄ Y^ Z^ system.


## Page 42

X
From Figure 3:
Z,  Z,
o n
*k' K
Figure A-3
i = ^ cos n t + ^ sin J2 r;
j = -i* sin fi t + j^ cos n t
k = k
Q = 2'7r   rafians
day
i., = i cos ß t - j sin ß t
j^ ^ i sin ß t + j cos ß t
k.   = k
35.
A-5
Then,  any vector may be represented by:
A
r = i>X+jY+kZ = rX   + T Y   +k,  Z
where:
X = X   cos ß t + Y   sin ß t;
Y = -X    sin Q t + Y   cos ß t; * *
X    = X cos ß t - Y sin ß t
Y    = X sin ß t + Y cos ß t
A-6
ii-4     Spherical Coordinates:
It will be convenient to use spherical coordinates in addition to the rectangular
coordinates.


## Page 43

36.
p sin <)) cos 9
Figure A-4
We have:
X = p sin «J» cos 6
Y = p sin <}> sin 6
Z = p cos «f
2   v2     „2     ,,2 p = X   -t- Y    + Z
* = cos"1 Z/,/x2+ Y2 + Z2
- 1 /    5 9
sin      Y//X   +Y
A-7
iü   Location of Points; and Direction of Vectors in Space
Pertinent quantities,  such as air densities,  wind velocities,  and gravity forces
are available in a reference system fixed with respect to the earth.   Any point in this
system may be located by specifying two angles   9^ (^ ,  and a length   p    .    These
quantities are the longitude,  latitude,  and distance from the center of the earth
respectively.
We may also determine a direction at the point (9    , <)>        p    ), ■iZf JQ JQ


## Page 44

JES' 37
vector
plane   Zgg, = 0
Figure A-5
Consider an additional rotation   ^      as performed in section II- I.    Then if
^E   is chosen so that the direction (or vector) lies in the plane Y*      = 0,  the vector ES
may be represented by 2 components; one along the  X'        axis,   and one alone the Z'
axis.    The angle   ^ + 180°   is referred to as the azimuth of the vector; and the angle   a
between the vector and the  X^g axis is called its elevation.
The angle   Gg   varies from 0 to 360°,    As eE   goes through the variations:
0—-90  -—180 —*- 270 -*-360     longitude goes through the variations:
0-^90OE^180OE ^90^-^0° .
The angle  ^   varies from 0 to 180°.    As   (fg   goes through the variations:
0'^*45 ~^"90 "-*"• 135 —*-180     latitude goes through the variations:
90oN—450N—^0O-^45oS-^-90OS   .


## Page 45

38.
The angle  ipE   varies from 0° to 360° .    As   ^   goes through the variation:
0-^90?—^180^—^270°—*-360O , azimuth goes through
180—*-270 —»-360 —*-90 —*-180    , and the more familiar directions go
through       S —*-W -*-N -*-E  —^S.
iv   Transformation of the Coordinates of a Point From a System Fixed in the Earth
to the X'oS . Y'oS .  Z-oS  (or Xo Y^) System
The transformation of coordinates from the system fixed in the earth to the
inertial system may be carried out using 4 successive transformations,    (We will
assume that the location of a point is specified by   <)),   9 ,  p ).
1. From the (pE , *E,  eE ) system to the  XE , YE , ZE   system (both fixed
in the earth),  using   ii-4,
XE =  PE Sin ^E COS eE
YE =  pE sin<j)E sin eE A_8
ZE =  pE cos *E
2. From the Xg-Yg ZE   system fixed in the earth to the  X+Y Z    inertial
system using   ii-3
X^   = XE cos n t - YE sin n t
Y^   = XE sin n t +  YE cos ü t A-9
* E
3. From the   X^YJZ^   inertial system to the   X'o Y'     Z'    inertial system
using ii-1
X'o=  ALX.+  D'LY*   +GLZ*
Y'O^BLX. +E'LY^   +H,LZ* A-10
^o^'L^^'L^^'L2*


## Page 46

39.
Here the angles  ^ ,   9^  ^   appearing in    A'L J'L are the angles
giving initial position and orientation of the missile at launch.
4.   From the X'     Y'      Z'     inertial system to the   X'        Y*        Z"      (or X , u       u       u öS öS       oS o
Yo, Z ) inertial system using   ii-2.
X   = X'      = X' o        oS o
Y   = Y'       = Y' •     o oS o
z   = z ^c  = z' oS o
A-ll
Figure   A-6
Then the transformation becomes:


## Page 47

40.
x/pE -- sin ^ (A'L (cos eE cos n t - sin eE sin ß t) + D'    (cos e_ sin ß t + sin et 3E sm u t + sm eE cos ß t))
+ G'L cos 4>E
y/pE -- sin 4,E (B'L (cos eE cos ß t - sin eE sin ß t) + E'Jcos ^ sin ß t + sin ^ cos ß t) )
+ H,L COS <t)E A-12
z/pE = sin «t,E(C'L (cos eE cos ß t - sin eE sin ß t) + F'L (cos eE sin ß t + sin eE cos ß t) )
H-J'j^ cos 4>E  - 1
where:
A'L  = cos i/)L cos *L cos eL + sin ^    sin 9
B'L =  sin ^L cos (^ cos 6    - cos ^    sin 0
C'L=   sin <!>,   cos 9
D'L =   cos i/jL cos <j)L sin,eL - sin 0    cos 9 A_13
E'j^ =   sin ^L cos 4»L sin G^ +  cos 0    cos 9
F'L=   sin ^i   sin ei
G'    =   -cos 0    sin <j)I
H',  =    -sin 0    sin 4» ^ L L
J'L  = cos $
Similarly,  by reversing the order of the transformations, we may express the
coordinates   pE,  9^ ci>E   in terms of X0Yoand z    .
5.    Applying   ii-2
X'    =  X'  „ = X o oS o
Y'   = Y'    = v o öS       I0 A-14
Z,o=Z,oS+PE=ZoH-   P E


## Page 48

41
6.    Applying   il-1
X       A.  X'  + D.  Y'   + G.  Z' * L    o        L     o        L     o
Y    = B,  X'   + E,  Y   + Hr  Z' * L      o        L     o        L      o
Z    = C,  X'   + F,  Y'   + J.  Z' * Lo        LoJLo
A-15
7.    Applying   ii-3
X,-. * X,   cos fl t + Y^ sin n t
YE = -X^ sin Qt+ Y* cos ü t
ZE = Z*
A-16
Or,  we may write:
where:
X- = X (A.   cos n t + B,  sin n t) +Y (DT   cos fi t + E.   sin fit) E       o    L L '       o    L Is '
+ (Z + p) (G,   cos fi t +- Hr   sin ß t )
Y„ =X (-A.   sin 12 t + B.   cos n t) +Y (-D.   sin ß t + ET   cos ß t ) t 0 i-1 *t O        L i_,
+ (Z + p) (-Gj   sinnt+H,   cos 12 t )
A = cos 0    cos <|)    cos ;/) +   sin 9 sin ip
B. = sin 0    cos $    cos ffij - cos 6 sin ^j
Cj =  -sin (j).   cos ip
DT = cos Ö    cos <(>    sin tp - sin 9 cos -
E, = sin 9    cos <t)    sin m    + cos 9    cos ip
m
F, =  -sin <t>    sin ip
G, = cos 9 sin <)>,
HL = sin 9 sin <t>L
JL   =  cos 4>L
A-17
A-18


## Page 49

42. 8.   And applying  ii-4:
PE-XE  +YE  +ZE
«j)    = cos '1 ZE //XF Ä + Yt," + Z p - A -19 2 2 2
■E   +YE   +ZE
'   ^fl 0     - sin   i   Y,./l/XE2+YE2
v  Transformation of a Vector From the System Fixed in the Earth to the Inertial
System (x, y, z)
From Fig.  5, we see that a vector may be expressed as:
7 = PT,ES + Q^ES
We wish to express this vector in terms of its components in the   i' „ ,
^'oS ' ^'oS  (or  ^ h>^) directions.
This may be done by 3 successive transformations:
1.   From the   I'gg, j'gg, k'ES  (or   i'E , J*    , k'E ) to the iE , JE , kE componaits.
Applying ii-i
^E=^EAE + JEBE + i^CE
^E = rEGE+J"EHE+^EJE A-20
•%        /\ ^ /s»        >N      A
iE,  h ' kE 2.    From the   i^,,  jj-, , k^,   to the   i+    j+   k^  components.   Applying ii-3:
i„ = L  cos J21 + L sin S2 t
i^ = -i   sin 12 t + j    cos Ü t A-21
E       *.


## Page 50

43. ^       A       /S s\        S\       'S
3.    From the   i^,, j,,,, 1^   to the   i' ,  j' , k'     components.   Applying ii-1:
i*=  ^oA'L+^oB,L+k,oC,L
h  -  roD,L+j0oE'L+   ^oF'L A-22
A, A /V yv
k   =   i'    G'. +   j'    H'.-h   k'    T^ * oLJoL oJL
But
^oS = ^o = V      -"'öS =  j'o = jo ;     k'oS = k,o = ko
Then the vector   v  may be written:
«"S
v=Pi-E+Qk-E
= Rr,0S+  S^oS+T^oS A-23
= R i + S j + Tkn o       Jo o
where:
R = P(AE (A^ cos n t + D'L sin n t) + BE ("A'    sin n t + D'     cos Q t)
+ CEG'L>
+ Q (GE (A^ cos J2 t + D^ sin n t ) + HE (-A'L sin fi t + D^ cos 12 t)
+ JEG'L>
S = P (AE (B'j^ cos n t + E'L sin J2 t ) + BE ("B*    sin ß t + E'     cos n t )
+ CEA,L>
+ Q (GE (B'j^ cos J2 t + E'L sin J2 t ) + HE (-B^ Sim ß t + E',  COS ß t )
+ JEH'L) A-24


## Page 51

and:
44,
T = P(AE(C,L cos n t+ F'L sin nt) + BE(-C'L sin n t + F'    cos üt)
+ CEJL)
+ Q(GE (C^ cos nt+ F'L sin nt) + HE (-C^ sin ß t + F'L cos fi t)
AE = cos eE cos 4)E cos ip   + sin 6    sin ip
B     = sin 0E cos (J)    cos tp    - cos 9    sin ip
CE =  -sin 4»E cos !PE A-25
GE = cos eE sin (t)E
HE =  sin eE sin ^
JE   ^os^
A' J'     have been defined in (13 ).


## Page 52

DISTRIBUTION LIST
FOR TECHNICAL REPORTS UNDER
CARRIAGE DYNAMICS CONTRACT
Commanding Officer
Rock Island Arsenal
Rock Island, Illinois
ATTN:   ORDBE   3110 1
9310-AR 3
93iO-TS 38
Commanding General
Ordnance Weapons Command
Rock Island,  Illinois
ATTN:   ORDOW-TR l
Chief of Ordnance
Department of the Army
Washington 25,  D. C.
ATTN:   ORDTW 1
Commanding Officer
Chicago Ordnance District
623 S. Wabash Avenue
Chicago 5, Illinois l
Commander
Armed Services Technical
Information Agency
Arlington Hall Station
Arlington 12, Virginia
ATTN:   TIPDR 10


## Page 53

p <
Q <
t»
CO    (U
01   u
^   Ö   ^
o o .S m si u » u
us
o e c - <u 3 S > o
1^8
CD    +-i
cd   4-j
3   O
a* a» as sä u
5
o
6
d)
tta 4» _.
bO D   CD
o
o.2
6 <u 4->
CO
>s CO      .
II 11 o H
O   CO
U ■'3 CO    >»^-<
X    O   CO
III <• S o
O
äÄÖ
3 '».5
0)
Ü
.-, d
§| <J   3
M   0)
d (U
•a is
d "
B d
a.2
4-J    4-)
a> o CO   (H
0)
co
CD   (U
£   M 43
u
>4-l
>4-l
QJ
(U
43
•a
d d 53 a
> o ■r1 Ö
0) cö
J3 t-i .3
-   0)   rt
4-j d
M 3   <U
Hi V<    fj    CD
CD    t^rt
a) ja rr?
^   d 43 OT    O    CD
d "rt
Hi j_i "T;  4->
^   CD
6 0) 4-)
>^ co    .
Si
•a
s* d  a) 0)   u
>   cd
s| O   3
H
o o o — —i 43
.2   tJ
0)
d <u ' 43
•S d
a.2
M
d  ^ t3
CD    U
M
to 43 •i-i
I a
CÜ   ^^
IS D W
< H
JO
w O
o r-1
.S<
in
o to
CO
I
Q
I
00
s I
CN
CN
o
Q <
■« S3 •*   .
.3    f-H    VO     tJ
0) J l-i
•S -) >, d
,_, ra <U
b a» s .2 n) ca
s ob
^3 o 43  w 03   Ü
CD 43
6. Ö o
Cd    4-1
3   U
i-1 'S»  ä5 Ö
01 .73 '^   _;  ^  d
S S 5   -
•2-ö,8 o
S
43
bO 3
nj i
to    .
«u'S
d CL.M a JB
a u a
*-> "O
■2 2
Ü    G
CD   >% -^  5
D 4a -' u
O   CO
0) -H 43
d .d cd tj
.2 t0 -g Jd
tJ ^ « .3 ^
CD
d o
cd
3 Q* 4-J
OJ d 0) <4-l
o
> cd
d 43 o d
U 3
.2 d
a-2
cd 4-»
o u
^   CD (U
O   W M
•S 2 "* m w c co x: —' <4-( d "
'S o.2-s 43   4_i *-■
a, <L>
D ai >—i Hi  «
-^ £ ^
o ö ö s
g|i . •2 -Bb 8 6 O   (u   cd  B
S Ö o 2. <u ,_,  d co   .
+3   (U   ^   (U   ni
bO 3   Hi cd ^
^ E S-a " •^   O M   d
S ° .2 o -
a   d 43   cd  « m o w -ri ä
0)
+3 ^ ti d <u
3 § d '- 5
^ a) o d ^ o -3 d -^ S
42 a.2 0)   > cd => ^
m  d fl 4-i ö o d <u o <1 o D w M


## Page 54

p <
D <
.2<!
03 .o
o.
u  »   4* r  to   >-i
11 o JO ut (D   Ü
0) CO JIl
Ö « O IM •1-4 Q
Cti 4-1
3 O
0)
0)
4-H
0)
ES 5 rt T3 4H       o 4-)
^ o d a rH     B 3
O     >
O .
'Ü '?> U f) s o S rt 4-J
0)   ^   K
^      4-1     C b0 3   OJ
d • f-l
ü CO
in    o
cö ^
G 2 -a " O    r«     ^ S u 2 o o CO -    ^^^    O ■'
^ e .c « f: mom
III «  TT   4-J
«i    S    r-i 3   en   C MS
33  d
ir r2  ^i 4J
d i»
d
§| tJ   3
CO
*-• C
to
CO   o
O   Ö
o.2
•j3 Mi
O   m
6^
M
d ö O «4-1
_ o
cti w 3 Ü
-d D
4-1
. -a
|S o ..
8 6 c3 a
bO 3
d a
S c o o
W d CO o d •"'
i% 3   CO
33  d
o   d 4J     i 0)   >
M  d
o m 4-1     >^
d  co    .
öS| (U   cö ^
^Q    id      U 4-1  T3     S
1-4      P
2 o -
o  m i—I   u -^
o
d • cd
§  <" d  <u
d 2
^   -^   rt 43 *J
d  0) 3   CO
Q <
M 43
I a a si d «I
IS D M _ J
Ä   i—I
< H
0a5
4J   O
Q-tL,
D7
«Q
<ö B ■♦   .
FES «
•--)>. d
^<  3
in o ID
CO
i
D
I
OO
s? I
CN
CN
o
o
U
d V}
a s-
D w
2d < H
0CrS
4JO
u ^
Q to
CO
CO   0)
w u ni  o)  ,„
w £
4-4     0^
O   ^ "4-i
CO    4-1
3 u
33 iM
—    d   r^   <"
0) o
Ä 4J
CO u
0) <u
1-H (U
CO
d as
>
•a d oi
•S-5b8
0) CO    J-»
N.S (I)
6 0) 4-4
CO
CO
OJ ■a
LO
o 10
CO
t
Q
cd,
O I
OO
s? I
CN
CN
o
o
^ ca -* .
.1= [_, ^o 4J
VH )-H   »-H 03
> 1       " ■"
W» 3   <U 03 U
d a.^ d ,2
CO      >,^H fj
0) 43 -1 u
CO
" d -d 03 tj OT   O   CO -r! 2
■2   3   S   0) ^ ■C 7- ±! c aj
d _ 73
CT1 4-1  '      S  "4-1
33 d a; ra o a» o
>   cfl
d 43 o c <  o  D
S d
0.-2
3 § o
3 CO    N
H   <4_|
a» o x: .M x u
^1 =1 a»
4-< r-
u h -.a »4-4        o
o d
s u •2-&
s « s!3
« a; 03 JB
d B
O <4H
C o cd 4-1
3 u
f-1 -f!
o
-d
bo 3 d  p.
I E ■ o
o 0 m  >. <U 43
^   d co   o
d rj
1S O     -
8 6
0 W +J >■.
dm.
<ü  cd ^
w^  d
.2 o - 5 ä u
a» — 4: X!   03
m ö 01 H
o! to d
CO
u
(U
4:
CT1 4-i
JJ  d
s fS d -^  c!
2 §^a.2 (U       >      ~!        -1 -
co   d
-  o <  u
t« 3 rt
■Q - c <u 3   «3
O
