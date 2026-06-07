# Projectile motion without calculus Joseph A Rizcallah

Converted from: `Classical Mechanics\Projectile Motion.pdf`


## Page 1

arXiv:1907.13458v1  [physics.gen-ph]  27 Jul 2019
Projectile motion without calculus
Joseph A Rizcallah
joeriz68@gmail.com
School of Education, Lebanese University, Beirut, Lebanon
Abstract
Projectile motion is a constant theme in introductory-physics cour ses. It is often used to illustrate
the application of diﬀerential and integral calculus. While most of the problems used for this purpose,
such as maximizing the range, are kept at a fairly elementary level, so me, such as determining the safe
domain, involve not so elementary techniques, which can hardly be as sumed of the targeted audience.
In the literature, several attempts have been undertaken to av oid calculus altogether and keep the
exposition entirely within the realm of algebra and/or geometry. In t his paper, we propose yet another
non-calculus approach which uses the projectile’s travel times to s hed new light on these problems and
provide instructors with an alternate method to address them with their students.
1 Introduction
Projectile motion is a common topic to all introductory mech anics courses, where students come to apply
the newly acquired methods of kinematics to explore motion i n a uniform gravitational ﬁeld. In most
introductory textbooks, algebra-based as well as calculus -based [1–5], the equations of projectile motion
are derived by making use of the superposition of uniform and uniformly accelerated rectilinear motions
in the horizontal and vertical directions respectively. In this respect, the algebra-based courses are no
diﬀerent from their calculus counterparts, which seem to sta ndout mainly by oﬀering the student some
calculus-oriented problems calling for the application of derivatives, particularly to ﬁnding minima and
maxima [3–5].
No doubt, calculus is an indispensable tool for any serious p hysics student and the aforementioned
problems do the students a great service in providing them wi th a familiar context within which the
elementary notions of calculus can be demonstrated and hone d. Their downside, however, is their inac-
cessibility virtually to all students in algebra-based cou rses. To bridge this gap and enrich the students’
experience in the latter courses, several authors have deve loped purely algebraic and/or geometric ap-
proaches to tackle these problems. Apart from the primary go al they are envisaged to serve, these alternate
approaches are often far more elegant and insightful than th e straightforward calculus-trodden path, that
they are welcome by instructors and appreciated by students in algebra-based and calculus-based courses
alike. Below is a review of some of these approaches.
In the elegant method of [6], the dot and cross product of velo city vectors are used to solve the
maximum range problem. Although it does not involve calculu s, this method may prove inappropriate for
an introductory course, as the students may not be familiar w ith these operations from vector algebra.
In this respect, the method of completing the squares, sugge sted in [7], seems to be more appropriate for
introductory algebra-based courses (see also [8]). Anothe r, more geometric, approach is suggested in [9].
Note, however, that all these methods were developed to solv e the level range problem and are not readily
applicable to the general range problem, e.g. on an inclined plane. A calculus-heavy solution of the latter,
in all its generality, can be found in [10].
1


## Page 2

In the paper, we present a diﬀerent approach to the maximum ran ge problem. We use displacement
triangles (referred to as diagrams in [11]) together with tr avel times to gain a diﬀerent perspective on the
problem. Throughout the paper, we assume a uniform gravitat ional ﬁeld and neglect air resistance.
2 Level range
In this section we consider the maximum range problem on a lev el ground. Its well-known non-calculus
solution can be found in any introductory text [1–5], and as s hown in [12], the problem can be solved
even without recourse to trigonometry. Nevertheless, we ch oose to include this problem here to introduce
our notation and illustrate our approach within a familiar s etting.
The displacement ⃗ rof the projectile at any instant of time t is given by ⃗ r= 1/ 2⃗ gt2 + ⃗ vt, where ⃗ gand
⃗ vdenote the acceleration due to gravity and the projectile’s initial velocity respectively. Graphically, this
vector sum is represented by a displacement triangle with on e vertical side. On a level ground, the range
occurs when ⃗ r·⃗ g= 0. So the corresponding displacement triangle is right of h ypotenuse vt. We thus have
1
4 g2t4 − v2t2 + R2 = 0, (1)
where R denotes the range, i.e. the value of r when ⃗ r· ⃗ g= 0 . Viewed as an equation in t, with given
parameters R and v, (1) admits two positive roots, t1 and t2, which satisfy the following (Vieta’s) relations
t2
1t2
2 = 4 R2
g2 , (2)
and
t2
1 + t2
2 = 4 v2
g2 . (3)
Hence, for a given pair R and v two travel times are generally possible. Clearly, the diﬀere nt travel
times, t1 and t2, correspond to diﬀerent launch angles, θ1 and θ2, correlated with t1 and t2 through
ti = 2v sin θi/g , for i = 1, 2.
Equation (3) is truly remarkable. It tells us that the sum of t he squares of the travel times is
independent of the range R. In particular, using (3) together with the above relations between ti and
θi yields sin 2 θ1 + sin 2 θ2 = 1, which implies the well-known complementarity of the lau nch angles, i.e.
θ1 + θ2 = π/ 2, for a given pair R and v. Besides, combining (2) and (3), one obtains
R = v2
g − 1
4 g(t1 − t2)2, (4)
Figure 1: The displacement triangles (one
ﬂipped upside down) of two projectiles with
the same range R but diﬀerent launch angles.
from which it readily appears that the range admits a max-
imum when t1 = t2. By the aforementioned complemen-
tarity, this implies that the maximum range is attained at
θ1 = θ2 = π/ 4.
Equations (2) and (3) allow a nice geometric interpre-
tation. Figure 1 shows the two displacement triangles, for
a range R and of travel times t1 and t2, with the trian-
gle corresponding to t2 ﬂipped upside down to form a big-
ger triangle with that corresponding to t1. The comple-
mentarity condition is equivalent to the big triangle be-
ing right. The latter is established using (3) twice as fol-
lows: 1 / 2g(t2
1 + t2
2) = 2 v2/g =
√
v2t2
1 + v2t2
2, so by the
Pythagorean theorem the side 1 / 2g(t2
1 + t2
2) is the hy-
potenuse and the big triangle is therefore right-angled at
the opposite vertex, i.e. θ1 + θ2 = π/ 2, independently of R.
2


## Page 3

Moreover, using (2) we readily see that the area A = 1 / 2v2t1t2 of this triangle and the range R are
related through the proportionality R = (g/v 2)A. Now, the independence of the big triangle’s hypotenuse
and right angle of R, means that, as R varies, the triangle’s right-angled vertex describes a cir cular arc
(outlined in ﬁgure 1) of diameter 2 v2/g , i.e. congruent to the hypotenuse. It now becomes clear, tha t the
area of the big triangle, and consequently the range, attain s a maximum when the right-angled vertex is
at its farthest from the diameter. This, of course, happens w hen this vertex is a radius v2/g away from
the diameter and the big triangle is right isosceles with equ al legs vt1 = vt2, or equivalently θ1 = θ2.
In passing, let us note that the projectile’s travel time is p roportional to the length of the chord
drawn from the vertical diameter’s ends. In particular, the longest travel time (2 v/g ), for a vertically
shot projectile, corresponds to the circle’s vertical diam eter, while the shortest travel time (zero), for a
horizontally shot projectile, corresponds to a tangent to t he circle drawn at that diameter.
3 Inclined range and safe domain
We now turn to the problem of maximum range on a slope of elevat ion α . The vector equation ⃗ r=
1/ 2⃗ gt2 + ⃗ vtstill holds, but the condition for the range now reads ⃗ r· ⃗ g= rg cos ϕ , where ϕ = π/ 2 + α .
Rearranging terms in the last equation and squaring, we ﬁnd
1
4 g2t4 − (v2 + Rg cos ϕ )t2 + R2 = 0, (5)
where, as before, R denotes the projectile’s range. The positive roots t1 and t2 of this equation, corre-
sponding to launch angles θ1 and θ2 with the slope, have a product as in (2) and a sum of squares giv en
by
t2
1 + t2
2 = 4 v2 + Rg cos ϕ
g2 , (6)
which upon using (2) can be recast into
t2
1 + t2
2 − 2t1t2 cos ϕ = 4 v2
g2 . (7)
Figure 2: The displacement triangles
for the inclined range problem. The big
triangle’s vertical side and opposite an-
gle are independent of R.
We are interested in the geometric interpretation of (7). To
this end, consider the displacement triangles associated w ith t1
and t2, with the latter ﬂipped upside down, so as to form a wedge
of angle 2 α as illustrated in ﬁgure 2. Our goal is to show that,
in the big triangle of sides vt1 and vt2, the vertical side, let’s call
it a, is independent of the range R and that the opposite angle,
i.e. θ1 + θ2 + 2α , is equal to ϕ . From ﬁgure 2, we see that a =
1/ 2g(t2
1 + t2
2) − 2R cos ϕ . Squaring this and using (6), after some
algebra, we obtain a2 = 4 v4/g 2, which proves the independence
of a and R. Moreover, by (7) we have a2 = v2(t2
1+t2
2−2t1t2 cos ϕ ),
which implies that the angle included between the sides vt1 and
vt2 is ϕ , leading to θ1 + θ2 = π/ 2 − α , a generalization of the
complementarity condition to the present case of inclined r ange.
It is now easy to see that, as the launch angle varies, the
vertex of the big triangle moves on a circle. This is so, becau se
the angle at the vertex and the opposite side are both constan t.
It is straightforward to show that the radius of this circle e quals v2/ (g cos α ). On the other hand, from
(2) it follows that the area A = 1 / 2v2t1t2 sin ϕ of the big triangle is proportional to the range, i.e.
A = ( v2/g )R sin ϕ . Therefore, the maximum range is attained when the vertex is farthest away from a.
3


## Page 4

This occurs at the perpendicular bisector of a, i.e. when vt1 = vt2, with the corresponding launch angles
being equal θ1 = θ2 = π/ 4 − α/ 2.
Note that ﬁgure 2 depicts the case of α > 0. However, one can easily convince oneself that the same
construction works for α < 0; all one must do is place the vertex of the big triangle on the complementary
arc, i.e. the large arc in ﬁgure 2. It is worth noting though, t hat in this case the projectile’s travel time
(proportional to the length of a chord) may exceed that of the vertically shot projectile (proportional to
a). In particular the longest travel time, corresponding to t he circle’s diameter, is 2 v/ (g cos α ) and occurs
when the projectile is shot perpendicularly to the slope.
Finally, combining (2) and (6), one has
R = 1
1 + sin α
[
v2
g − 1
4 g(t1 − t2)2
]
,
from which we ﬁnd
Rm = v2
g
1
1 + sin α = v2
g
1
1 + cos(π/ 2 − α ) , (8)
Figure 3: The enveloping parabola together
with its directrix and focus at the launching
point, taken as the origin.
for the maximum range Rm. Alternatively, (8) can be ar-
rived at using the geometry of ﬁgure 2 in the special case
when the bisector of the wedge coincides with the perpen-
dicular bisector of the chord a.
Equation (8) deﬁnes a parabola (the so called envelop-
ing parabola) in polar coordinates, Rm and α , with a focus
at the launching point and a horizontal directrix a distance
v2/g above it (see ﬁgure 3). Since Rm is the maximum
range, the projectile can never reach beyond the enveloping
parabola in any given direction α . Therefore, the envelop-
ing parabola delimits the region of the plane inaccessible
to any projectile launched from the origin with speed v. In
the literature this region is known as the safe domain [13].
In passing, we note that students who are not famil-
iar with the equation of parabola in polar coordinates may
further transform (8) into the more familiar quadratic func -
tion as follows: rewrite (8) as Rm(1 + sin α ) = v2/g , then
transpose the term Rm sin α = ym and square both sides to
ﬁnd x2
m + y2
m = v4/g 2 + 2ymv2/g + y2
m, where use has been made of R2
m = x2
m + y2
m. Solving the resulting
equation for ym, yields
ym = − g
2v2 x2
m + v2
g . (9)
This is the equation of the enveloping parabola (see ﬁgure 3) in rectangular coordinates.
4 Horizontal range with initial height
Let us now consider the problem of maximizing the range of a pr ojectile launched from a height h above
level ground (see ﬁgure 4). In principle, we have already sol ved this problem! Using (9), one sets ym = −h
and solves for xm, which is the sought for maximum range. However, the instruc tor may choose to avoid
mention of the enveloping parabola altogether. In this case , as we discuss below, travel times again provide
a straightforward algebraic solution.
4


## Page 5

Figure 4: A projectile launched from height h above level ground.
For a given range R, the launch angles are related as in the previous section, i. e. θ1 + θ2 = π/ 2 − α ,
where α (here negative) is such that tan α = −h/R . As to the travel times, t1 and t2, they are the positive
roots of 1
4 g2t4 − (v2 + gh)t2 + R2 + h2 = 0, and so satisfy the following relations
t2
1t2
2 = 4 R2 + h2
g2 , (10)
and
t2
1 + t2
2 = 4 v2 + gh
g2 . (11)
Combining (10) and (11) gives
√
R2 + h2 = v2 + gh
g − 1
4 g(t1 − t2)2, (12)
from which it readily follows that the maximum range Rm, corresponding to t1 = t2, is given by
Rm = v2
g
√
1 + 2gh
v2 . (13)
Although equations (10) and (11) easily lend themselves to a simple geometric interpretation, unlike the
above cases, such an interpretation seems to be somewhat con trived as it involves the times t1 and t2
rather than the displacements.
5 Conclusion
We present a simple approach that employs travel times, and n o calculus, to provide a simple solution to
the maximum range problem for a projectile launched on level ground, with or without initial height, as
well as a sloping ground with no initial height. For zero init ial heights, our approach allows a transparent
geometric interpretation within which the problem of maxim izing the range receives an elegant geometric
solution and the relation between the launch angles, for a gi ven range R, obtains in a natural and visual
way.
Moreover, our method can be used to devise simple constructi ve solutions to the range R and travel
time t for any given initial speed v and launch angle θ. For example, using the given v, one calculates
the diameter 2 v2/g and constructs the circle of ﬁgure 1. Then using the given θ, one locates on this circle
the missing vertex and constructs a right-angled triangle w ith the diameter as hypotenuse and θ as an
adjacent angle. Now R and vt are just the distance from the located vertex to the diameter and the
side of the triangle opposite to θ respectively. Guided by ﬁgure 2, one can easily conceive of a similar
construction for the case of a sloping ground. The reader is i nvited to ﬁll in the details.
In the paper we try to promote the non-calculus approach to ta ckle a set of problems on projectile
motion, traditionally considered to be the privilege of cal culus-based courses. It is hoped that this paper
will make these issues, together with their non-calculus so lutions, accessible to all introductory mechanics
students regardless of their calculus erudition.
5


## Page 6

References
[1] Giancoli D C 2014 Physics: Principles with Applications 7th edn (Boston MA: Pearson)
[2] Giambattista A, Richardson B M, Richardson R 2010 Colleg e Physics 3rd edn (New York: McGraw-
Hill).
[3] Young H D and Freedman R A 2008 Sears and Zemanskys Univers ity Physics: with Modern Physics
12th ed. (San Francisco: Addison-Wesley) pp 79-87
[4] Tipler P A and Mosca G 2008 Physics for Scientists and Engi neers 6th edn (New York: W. H.
Freeman) pp 71-79
[5] Serway R A and Jewet J W 2004 Physics for Scientists and Eng ineers 6th ed. (Belmont: Thomson
Brooks/Cole,) pp 83-91
[6] Palﬀy-Muhoray R and Balzarini D 1982 Maximizing the range of the shot put without calculus Am.
J. Phys. 50 181
[7] Bose S K 1983 Maximizing the range of the shot put without c alculus Am. J. Phys. 51 458
[8] Bace M et al 2002 Maximizing the range of a projectile Eur. J. Phys. 23 409
[9] Ganci S and Lagomarsino D 2014 Maximum range of a projecti le launched from a height h: a
non-calculus treatment Eur. J. Phys. 35 045026
[10] Bajc D 1990 Maximum range of a projectile motion - a gener alization Am. J. Phys. 58 408
[11] Noll E D 1978 Simple projectile motion made simple Phys. Teach. 16 566
[12] Mohazzabi P and Kohken Z A 2005 Projectile motion withou t trigonometric functions Phys. Teach.
43 114
[13] Richard J-M 2004 Safe domain and elementary geometry Eur. J. Phys. 25 835
6
