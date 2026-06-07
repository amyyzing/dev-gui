# Vector Algebra

Source title: CHAPTER 13

Converted from: `9.pdf`


## Page 1

CHAPTER 13
Vector Algebra
/DC 13.1. Basic Concepts
A vector V in the plane or in space is an arrow: it is determined by its length, denoted /CY V/CY and its
direction. Two arrows represent the same vector if they have the same length and are parallel (see ﬁgure
13.1). We use vectors to represent entities which are described by magnitude and direction. For example,
a force applied at a point is a vector: it is completely determined by the magnitude of the force and the
direction in which it is applied. An object moving in space has, at any given time, a direction of motion,
and a speed. This is represented by the velocity vector of the motion. More precisely, the velocity vector
at a point is an arrow of length the speed ( ds
/BP dt), which lies on the tangent line to the trajectory. The
success and importance of vector algebra derives from the interplay between geometric interpretation
and algebraic calculation. In these notes, we will deﬁne the relevant concepts geometrically, and let this
lead us to the algebraic formulation.
Figure 13.1
/B7
Figure 13.2
V
V
W
W
V /B7 W
Newton did not write in terms of vectors, but through his diagrams we see that he clearly thought of
forces in these terms. For example, he postulated that two forces acting simultaneously can be treated
as acting sequentially. So suppose two forces, represented by vectors V and W, act on an object at a
particular point. What the object feels is the resultant of these two forces, which can be calculated by
placing the vectors end to end (as in ﬁgure 13.2). Then the resultant is the vector from the initial point
of the ﬁrst vector to the end point of the second. Clearly, this is the same if we reverse the order of the
vectors. We call this the sum of the two vectors, denoted V
/B7 W. For example, if an object is moving
in a ﬂuid in space with a velocity V, while the ﬂuid is moving with velocity W, then the object moves
(relative to a ﬁxed point) with velocityV /B7 W.
186


## Page 2

/DC 13.1 Basic Concepts 187
Deﬁnition 13.1
a) A vector represents the length and direction of a line segment. The length is denoted
/CY V/CY . A unit
vector U is a vector of length 1. Thedirection of a vctor V is the unit vectorU parallel to V: U /BP V/BP /CY V/CY .
b) Given two points P/BN Q, the vector from P to Q is denoted
/DI
PQ.
c) Addition. The sum, or resultant, V /B7 W of two vectors V and W is the diagonal of the parallelogram
with sides V,W.
d) Scalar Multiplication. To distinguish them from vectors, real numbers are called scalars. If c is a
positve real number, cV is the vector with the same direction as V and of length c/CY V/CY . If c negative, it is
the same, but directed in the opposite direction.
We note that the vectors V, cV are parallel, and conversely, if two vectors are parallel (that is, they
have the same direction), then one is a scalar multiple of the other.
Example 13.1 Let P
/BN /BN Q/BN R be three points in the plane not lying on a line. Then
(13.1)
/DI
PQ /B7
/DI
QR /B7
/DI
RP /BP 0 /BM
From ﬁgure 13.3, we see that the vector
/DI
RP is the same line segment as
/DI
PQ /B7
/DI
QR, but points in the
opposite direction. Thus
/DI
RP /BP /A0 /B4
/DI
PQ /B7
/DI
QR/B5 .
Figure 13.3
P
Q
R
˜PQ
˜RP ˜QR
Example 13.2 Using vectors, show that if two triangles have corresponding sides parallel, that the
lengths of corresponding sides are proportional.
Represent the sides of the two triangles by U/BN V/BN W and U
/BC
/BN V
/BC
/BN W
/BC
respectively. The hypothesis is
that there are scalars a/BN b/BN c such that U
/BC
/BP aU/BN V
/BC
/BP bU/BN W
/BC
/BP cW. The conclusion is that a /BP b /BP c.
To show this, we start with the result of example 1; since these are the sides of a triangle, we have
(13.2) U
/B7 V /B7 W /BP 0 /BN U
/BC
/B7 V
/BC
/B7 W
/BC
/BP 0 /BN or/BN what is the same/BN aU /B7 bV /B7 cW /BP 0
The ﬁrst equation gives us U /BP /A0 V /A0 W, which, when substituted in the last equation gives
(13.3) /B4 b /A0 a/B5 V /B7 /B4 c /A0 a/B5 W /BP 0
Now, if b /BI/BP a, this tells us that V and W are parallel, and so the triangle lies on a line: that is, there is no
triangle. Thus we must have b /BP a, and by the same reasoning, c /BP a also.


## Page 3

Chapter 13 Vector Algebra 188
/DC 13.2. Vectors in the Plane
The advantage gained in using vectors is that they are moveable, and not tied to any particular coordinate
system. As we have seen in the examples of the previous section, geometric facts can be easily derived
using vectors while working in coordinates may be cumbersome. However, it is often the case, that in
working with vectors we must do calculations in a particular coordinate system. It is important to realize
that it is the worker who gets to choose the coordinates; it is not necessarily inherent in the problem.
We now explain how to move back and forth between vectors and coordinates. Suppose, then, that a
coordinate system has been chosen: a pointO, the origin, and two perpendicular lines through the origin,
the x- and y-axes. A vector V is determined by its length,
/CY V/CY and its direction, which we can describe by
the angle θ that V makes with the horizontal (see ﬁgure 13.4). In this ﬁgure, we have realized V as the
vector
/DI
OP from the origin to P. Let /B4 a/BN b/B5 be the cartesian coordinates of P. Note that V can be realized
as the sum of a vector of length a along the x-axis, and a vector of length b along the y-axis. We express
this as follows.
Deﬁnition 13.2 We let I represent the vector from the origin to the point (1,0), and J the vector from
the origin to the point (0,1). These are the basic unit vectors (a unit vector is a vector of length 1). The
unit vector in the direction
θ is cosθI /B7 sinθJ.
If V is a vector of lengthr and angle θ, then V /BP r /B4 cosθI /B7 cosθJ/B5 . If V is the vector from the origin
to the point /B4 a/BN b/B5 ; r is the length of V, and cos θI /B7 cosθJ is its direction. If P/B4 a/BN b/B5 is the endpoint of
V, then V /BP
/DI
OP /BP aI /B7 bJ. a and b are called the components of V.
Figure 13.4
P /B4 a/BN b/B5
/CY V/CY
I
J
a
b
θ
Of course, r and θ are the usual polar coordinates, and we have these relations:
(13.4) /CY V/CY /BP
/D4
a2
/B7 b2
/BN θ /BP arctan b
a
/BN a /BP /CY V/CY cosθ /BN b /BP /CY V/CY sinθ /BM
We add vectors by adding their components, and multiply a vector by a scalar by multiplying the com-
ponents by the scalar.
Proposition 13.2 If V
/BP aI /B7 bJ and W /BP cI /B7 dJ, then V /B7 W /BP /B4 a /B7 c/B5 I /B7 /B4 b /B7 d /B5 J.
This is veriﬁed in ﬁgure 13.5.


## Page 4

/DC 13.2 Vectors in the Plane 189
Figure 13.5
V /B7 W
V
W
a
b
c
d
Figure 13.6
/B7
α
2
5
current
Example 13.3 A boy can paddle a canoe at 5 mph. Suppose he wants to cross a river whose current
moving at 2 mph. At what angle to the perpendicular from one bank to the other should he direct his
canoe?
Draw a diagram so that the river is moving horizontally from left to right, and the direct crossing
is vertical (see ﬁgure 13.6). Place the origin on the lower bank of the river, and choose the x-axis in
the direction of ﬂow, and the y-axis perpendicularly across the river. TIn these coordinates, the velocity
vector of the current is 2I. Let V be the velocity vector of the canoe. We are given that
/CY V/CY /BP 5 and we
want the resultant of the two velocities to be vertical. If α is the desired angle, we see from the diagram
that sinα /BP 2/BP 5, so α /BP 23/BM 5
Æ
.
Example 13.4 An object on the plane is subject to the three forcesF /BP 2I /B7 J/BN G /BP /A0 8J/BN H. Assuming
the object doesn’t move, ﬁnd H. At what angle to the horizontal is H directed?
By Newton’s law, the sum of the forces must be zero. Thus
(13.5) H /BP /A0 F /A0 G /BP /A0 2I /A0 J /B7 8J /BP/BP /A0 2I /B7 7J /BM
If α is the angle from the positive x-axis to H, tan α /BP /A0 7/BP 2, so α /BP 105/BM 95
Æ
, since H points upward
and to the left.
Since vectors represent magnitude and length, we need a computationally straightforward way of
determining lengths and angles, given the components of a vector.
Deﬁnition 13.3 The dot product of two vectors V1 and V2 is deﬁned by the equation
(13.6) V1
/A1 V2
/BP /CY V1
/CY/CY V2
/CY cosβ /BN
where β is the angle between the two vectors.
Note that since the cosine is an even function, it does not matter if we takeβ from V 1 to V2, or in the
opposite sense. In particular, we see that V1
/A1 V2
/BP V2
/A1 V1. Now, we see how to write the dot product in
terms of the components of the two vectors.
Proposition 13.3 Let V1
/BP a1I /B7 b1J and V2
/BP a2I /B7 b2J. Then
(13.7) V1
/A1 V2
/BP a1a2
/B7 b1b2


## Page 5

Chapter 13 Vector Algebra 190
with equality holding only when the vectors are parallel.
To see this, we use the polar representation of the vectors:
(13.8) V1
/BP r1
/B4 cosθ1I /B7 sinθ1J/B5 /BN V2
/BP r2
/B4 cosθ2I /B7 sinθ2J/B5 /BM
Then
(13.9) V1
/A1 V2
/BP r1r2 cos/B4 θ1
/A0 θ2
/B5 /BP r1r2 cosθ1 cosθ2
/B7 r1r2 sinθ1 sinθ2
by the addition formula for the cosine. This is the same as
(13.10) V1
/A1 V2
/BP /B4 r1 cosθ1
/B5/B4 r2 cosθ2
/B5 /B7 /B4 r1 sinθ1
/B5/B4 r2 sinθ2
/B5
which is equation (13.7) in Cartesian coordinates. As for the last statement, we have strict inequality
unless cos
β /BP 1, that is β /BP 0 or π, in which case the vectors are parallel.
Proposition 13.4
a) Two vectors V and W are orthogonal if and only if V
/A1 W /BP 0.
b) If L and M are two unit vectors with L /A1 M /BP 0, then for any vector V, we can write
(13.11) V /BP aL /B7 bM /BN with a /BP V /A1 L/BN b /BP V /A1 M /BN and /CY V/CY /BP
/D4
a2
/B7 b2
/BM
We shall say that a pair of unit vectors L/BN M with L /A1 M /BP 0 form a base for the plane. This statement
just reiterates that we can put cartesian coordinates on the plane with any point as origin and coordinate
axes two orthogonal lines through the origin; that is the lines in the directions ofL and M. To show part
b) we start with ﬁgure 13.7.
Figure 13.7L
M V
a
b
From that ﬁgure, we see that we can write any vector as a sumV /BP aL /B7 bM with (by the Pythagorean
theorem) /CY V/CY /BP
/D4
a2
/B7 b2. We now show that a/BN b are as described;
(13.12) V /A1 L /BP /B4 aL /B7 bM/B5 /A1 L /BP aL /A1 L /B7 bM /A1 L /BP a /BM
Similarly V /A1 M /BP b.
Example 13.5 Find the angle β between the vectors V /BP 2I /A0 3J and W /BP I /B7 2J.
We have /CY V/CY /BP
/D4
22
/B7 32
/BP
/D4
13 /BN /CY W/CY /BP
/D4
12
/B7 22
/BP
/D4
5 and V /A1 W /BP 2/B4 1/B5 /B7 /B4 /A0 3/B5/B4 2/B5 /BP /A0 4. Thus
(13.13) cos β /BP
V /A1 W
/CY V/CY/CY W/CY
/BP
/A0 4
/D4
65
/BP /A0 /BM 496


## Page 6

/DC 13.2 Vectors in the Plane 191
so β /BP /A0 119/BM 7
Æ
.
Example 13.6 Suppose we have put cartesian coordinates on the plane, withI/BN J the standard base. Let
(13.14) L /BP
I /B7 J
/D4
2
/BN M /BP
/A0 I /B7 J
/D4
2
be a new base. Given the point P/B4 5/BN 2/B5 , write
/DI
OP in terms of L and M.
By the preceding proposition,
(13.15)
/DI
OP /A1 L /BP /B4 5I /B7 2J/B5 /A1
/A0
I /B7 J
/D4
2
/A1
/BP
7
/D4
2
/BN
/DI
OP /A1 M /BP /B4 5I /B7 2J/B5 /A1
/A0
/A0 I /B7 J
/D4
2
/A1
/BP /A0
3
/D4
2
/BN
so
/DI
OP /BP /B4 7L /A0 3M/B5 /BP
/D4
2.
Example 13.7 Show, using vectors, that the interior angles of an isosceles triangle are equal.
Figure 13.8
V W
V /B7 Wβ β
/BC
In ﬁgure 13.8 we have labelled the sides of equal length as V and W. Thus, the base of the triangle is
V /B7 W. First of all, since /CY V/CY /BP /CY W/CY , we have /B4 V /B7 W/B5 /A1 V /BP V /A1 V /B7 W /A1 V /BP W /A1 W /B7 V /A1 W /BP /B4 V /B7 W/B5 /A1 W.
Thus, by (2),
(13.16) cos
β /BP
/B4 V /B7 W/B5 /A1 V
/CY V /B7 W/CY/CY V/CY
/BP
/B4 V /B7 W/B5 /A1 W
/CY V /B7 W/CY /CY W/CY
/BP cosβ
/BC
/BM
Since both angles are acute, β /BP β
/BC
.
Example 13.8 Find a vector orthogonal to V /BP 3I /B7 4J and of the same length.
The vectors V /BP aI /B7 bJ/BN W /BP cI /B7 dJ/BN are orthogonal precisely when ac /B7 bd /BP 0. Thus, if we
are given a/BN b, we take c /BP /A0 b/BN d /BP a to get an orthogonal vector. So for this example, we can take
W /BP /A0 4I /B7 3J. Clearly, since the coefﬁcients are the same but for sign, /CY W/CY /BP /CY V/CY . We could also take
the vector in the opposite direction: /A0 W /BP 4I /A0 3J
In general, if V /BP cI /B7 dJ then both /A0 dI /B7 cJ and dI /A0 cJ are orthogonal toV and of the same length.
The ﬁrst is counterclockwise to V, and the second, clockwise.
Deﬁnition 13.4 Given the vector V, we shall denote by V
/BR
that vector which is orthogonal to, of the
same length as, and counterclockwise toV. In components, we have:
(13.17) If V /BP aI /B7 bJ /BN then V
/BR
/BP /A0 bI /B7 aJ


## Page 7

Chapter 13 Vector Algebra 192
See ﬁgure 13.8 to see that V
/BR
is counterclockwise to V (at least in the case where both a and b are
positive).
Figure 13.9
a
a b
/A0 b
V
/BR
V
Deﬁnition 13.5 Given two vectors V and W, we deﬁne the determinant det/B4 V/BN W/B5 of the two vec-
tors as the signed area of the parallelogram spanned by the two vectors. The sign is positive if W is
counterclockwise fromV; otherwise negative.
In ﬁgure 13.10, α is the angle from V to W. Thus
(13.18) det /B4 V/BN W/B5 /BP /CY V/CY/CY W/CY sinα /BM
Figure 13.10
V
/BR
α
β
/CY W/CY sinα
V
W
Now, let β be the angle from W to V
/BR
so that (in ﬁgure 13.10), α /B7 β /BP π /BP 2, and we have sin α /BP
cosβ. Since /CY V/CY /BP /CY V
/BR
/CY , we can rewrite (13.18) as
(13.19) det /B4 V/BN W/B5 /BP /CY V
/BR
/CY/CY W/CY cosβ /BP V
/BR
/A1 W
This gives us the following.
Proposition 13.5 The determinant of the two vectors V
/BP aI /B7 bJ and W /BP cI /B7 dJ is the determinant
of the matrix whose rows are the vectors V and W:
(13.20) det /B4 V/BN W/B5 /BP ad /A0 bc
For,V
/BR
/BP /A0 bI /B7 aJ, and from (13.19), det/B4 V/BN W/B5 /BP V /A1 W
/BR
/BP /A0 bc /B7 ad /BP ad /A0 bc.


## Page 8

/DC 13.2 Vectors in the Plane 193
The vectors V and Ware parallel (or collinear) if and only if det /B4 V/BN W/B5 /BP 0, for in this case there is
no parallelogram. We also have the inequality
(13.21)
/CY det/B4 V/BN W/B5 /CY /AK /CY V/CY/CY W/CY /BN
with equality holding if and only if V and W are orthogonal.
Deﬁnition 13.6 Given two vectors V and W, the projection of V in the direction of W is that vector V
/BC
parallel to W such that V /A0 V
/BC
is orthogonal to V
/BC
(see ﬁgure 13.11).
Figure 13.11
V
V
/BC
V /A0 V
/BC
W
Proposition 13.6 The projection V
/BC
of V in the direction of W is given by the formula
(13.22) V
/BC
/BP prW
/B4 V/B5 /BP
V /A1 W
W /A1 WW /BM
If U is a unit vector in the direction of W, then
(13.23) V
/BC
/BP /B4 V /A1 U/B5 U /BN and V /BP /B4 V /A1 U/B5 U /B7 /B4 V /A1 U
/BR
/B5 U
/BR
/BM
To show this we start with the equation /B4 V /A0 V
/BC
/B5 /A1 V
/BC
/BP 0. Since V
/BC
/BP aW for some a, this gives us
(13.24) /B4 V /A0 aW/B5 /A1 aW /BP 0 /BN or a2W /A1 W /BP aV /A1 W
If a /BP 0, then V
/BC
/BP 0 and V and W are orthogonal. Otherwise
(13.25) a /BP
V /A1 W
W /A1 W
/BN
giving us (13.22). The rest of the proposition follows by replacing W by the unit vector U, and should
be viewed as a restatement of Proposition 13.6.
Example 13.9 Find the area of the parallelogram whose vertices are atO
/B4 0/BN 0/B5 /BN P/B4 4/BN /A0 2/B5 , Q/B4 5/BN 8/B5 /BN R/B4 9/BN 6/B5 .
This is the parallelogram determined by the vectors from the origin O to the points P and Q:
/DI
OP /BP
4I /A0 2J/BN
/DI
OQ /BP 5I /A0 8J, so has signed area 4 /B4 /A0 8/B5 /A0 /B4 /A0 2/B5/B4 5/B5 /BP /A0 22. We verify these are the vertices of
a parallelogram by calculating
/DI
OP /B7
/DI
OQ /BP 9I /B7 6J /BP
/DI
OR.
In order to discuss geometric objects in the coordinate plane, it is useful to represent a point X /B4 x/BN y/B5
by the vector X /BP
/DI
OX /BP xI /B7 yJ from the origin to X. For Y another point, the vector fromX to Y is thus
represented by Y /A0 X (see ﬁgure 13.12).


## Page 9

Chapter 13 Vector Algebra 194
Figure 13.12
Y /A0 X
Y
O
X
/A0
/BR
/A0
/A0
/A1
Figure 13.13
/A0
X0 XX /A0 X0L
prL
/BR
/A0
X /A0 X0
/A1
A line L is determined by its direction and a point on the line. let X 0 be a point on L, and L a vector
parallel to the line L. Then, for any point X, it is on the line if and only if X /A0 X 0 is parallel to L, or,
what is the same, orthogonal to L
/BR
. This leads to these two equations, called the equation of the line:
(13.26) /B4 X /A0 X0
/B5 /A1 L
/BR
/BP 0 or det /B4 X /A0 X0
/BN L /B5 /BP 0 /BM
Also, since X /A0 X0 is parallel to L if and only if X /A0 X0 is a scalar multiple of L, we have theparametric
form of the equation of the line:
(13.27) L : X /BP X0
/B7 tL /BM
A line is also determined by two pointsX0
/BN X1 on the line. Given that information, we ﬁnd the equations
of the line by taking L /BP X1
/A0 X0.
Now, suppose L is a line and X is a point not on the line. We seek a formula for the distance from
the point X to the line. We see from ﬁgure 13.13 that this is the length of the projection in the direction
perpendicular to L of a vector from X to any point X 0 on L. This leads to the formula for the distance
from X to L
(13.28) d /B4 X/BN L/B5 /BP /CY prL
/BR
/B4 X /A0 X0
/B5 /CY
Example 13.10 Let L be the line given by the equation 3x /A0 y /BP 7. Find the distance from (2,4) to L.
By comparison with equation (13.26) we see thatL
/BR
/BP 3I /A0 J. To use (13.28) we need a point on the
line; any solution of the equation 3x /A0 y /BP 7 will do. (3,2) is a solution, so we take X 0
/BP 3I /B7 2J. Thus,
for our point, X /BP 2I /B7 4J, the distance is
(13.29) /CY prL
/BR
/B4 X /A0 X0
/B5 /CY /BP
/CY /B4 X /A0 X0
/B5 /A1 L
/BR
/CY
/CY L
/BR
/CY
/BP
/CY /B4 /A0 I /B7 2J/B5 /A1 /B4 3I /A0 J/B5 /CY
/CY 3I /A0 J/CY
/BP
5
/D4
10
Example 13.11 Find the distance from X(3,1) to the line through X 0(2,-3) and parallel to V /BP /A0 I /B7 4J.
The vector L
/BR
/BP /A0 4I /A0 J is orthogonal to the line. Thus the distance is
(13.30) /CY prL
/BR
/B4 X /A0 X0
/B5 /CY /BP
/CY /B4 I /B7 4J/B5 /A1 /B4 /A0 4I /A0 J/B5 /CY
/CY /A0 4I /A0 J/CY
/BP
8
/D4
17
Example 13.12 Find the point on the line L : 2 x /A0 3y /BP 17 which is closest to the origin.
Let X be the vector from the origin to the desired point. ThenX is orthogonal to the line, so is parallel
to the vectorL
/BR
/BP 2I /A0 3J. Writing X /BP t /B4 2I /A0 3J/B5 , sinceX ends on the line we have 2/B4 2t /B5 /A0 3/B4 /A0 3t /B5 /BP 17,
so t /BP 17/BP 13, and X /BP /B4 34/BP 13/B5 I /A0 /B4 51/BP 13/B5 J .


## Page 10

/DC 13.3 Vectors in Space 195
/DC 13.3. Vectors in Space
In a Cartesian coordinate system for space, the vectors I, J, K are the vectors from the origin to the
points /B4 1/BN 0/BN 0/B5 /BN /B4 0/BN 1/BN 0/B5 /BN /B4 0/BN 0/BN 1/B5 respectively. These are unit vectors, mutually orthogonal, and form the
standard base for space. We always take a coordinatization so that /CU I/BN J/BN K/CV is a right-handed system.
More precisely, if we situate I and J on the horizontal plane, then I is a unit vector, J is a unit vector
perpendicular to I and counterclockwise fromI, and K is a unit vector orthogonal to the horizontal plane,
pointing upwards (see ﬁgure 13.14).
Figure 13.14
I J
K
Any vector V can be written uniquely as
(13.31) V /BP aI /B7 bJ /B7 cK/BN
where a/BN b/BN c are called the components of V. To add two vectors, add the components; to multiply a
vector by a scalar, multiply the components by the scalar. IfV is given as in (13.31), its length is
(13.32) /CY V/CY /BP
/D4
a2
/B7 b2
/B7 c2
/BM
The direction of V is determined by the cosines of the angles betweenV and the coordinate axes. Thus,
for any vector V we can write
(13.33) V /BP /CY V/CY /B4 cosαI /B7 cosβJ /B7 cosγK/B5
where α /BN β /BN γ are those angles. The components of the unit vector in (13.33) are called the direction
cosines of the vector V. Note that cos2 α /B7 cos2 β /B7 cos2 γ /BP 1.
Deﬁnition 13.7 The dot product of two vectors V/BN W is deﬁned as
(13.34) V /A1 W /BP /CY V/CY/CY W/CY cosθ /BN
where θ is the angle between V and W.
As for plane vectors, this has an easy formulation in terms of the components of the vectors.
Proposition 13.7 Let
(13.35) V /BP a1I /B7 b1J /B7 c1K/BN W /BP a2I /B7 b2J /B7 c2K


## Page 11

Chapter 13 Vector Algebra 196
in components. Then
(13.36) V
/A1 W /BP a1a2
/B7 b1b2
/B7 c1c2
To see this, we start with the Law of Cosines for the triangle whose sides are the vectorsV/BN W/BN W /A0 V
(see ﬁgure 13.15):
Figure 13.15
V
W /A0 V
W
β
/CY W /A0 V/CY
2
/BP /CY V/CY
2
/B7 /CY W/CY
2
/A0 2/CY V/CY/CY W/CY cosβ
(13.37) /CY W /A0 V/CY
2
/BP /CY W/CY
2
/B7 /CY V/CY
2
/A0 2/CY V/CY/CY W/CY cosβ /BP /CY W/CY
2
/B7 /CY V/CY
2
/A0 2/B4 W /A1 V/B5 /BN
so that
(13.38) W
/A1 V /BP
1
2
/B4 /CY W/CY
2
/B7 /CY V/CY
2
/A0 /CY W /A0 V/CY
2
/B5 /BM
Now, writing the right hand side in terms of components, using (13.31) and (13.32), we get (13.36),
after some cancellation. In particular, just as in two dimensions, two vectors V
/BN W are orthogonal if
V /A1 W /BP 0.
Example 13.13 Find the angle between the vectors V /BP 2I /A0 3J /B7 K/BN W /BP 6I /B7 J /A0 2K.
We haveV /A1 W /BP 12 /A0 3 /A0 2 /BP 7 and /CY V/CY /BP
/D4
22
/B7 32
/B7 12
/BP 3/BM 74/BN /CY W/CY /BP
/D4
62
/B7 12
/B7 22
/BP 6/BM 40. Thus
(13.39) cos α /BP
7
/B4 3/BM 74/B5/B4 6/BM 40/B5
/BP /BM 2923
so α /BP 73
Æ
.
Example 13.14 Find a vector orthogonal to both the vectorsV and W of example 13.13.
Let X /BP xI /B7 yJ /B7 zK be the desired vector. We have the conditions
(13.40) X /A1 V /BP 2x /A0 3y /B7 z /BP 0 /BN X /A1 W /BP 6x /B7 y /A0 2z /BP 0 /BM
We can solve these equations by replacing z by any nonzero value, say z /BP 1, and solving the resulting
equations for x and y:
(13.41) 2 x /A0 3y /B7 1 /BP 0 /BN 6x /B7 y /A0 2 /BP 0 /BM


## Page 12

/DC 13.3 Vectors in Space 197
These have the solution x /BP 1/BP 4/BN y /BP 1/BP 2. Thus we can take
(13.42) X0
/BP
1
4I /B7
1
2 J /B7 K
as our answer. Of course there is a line of such vectors, corresponding to all possible values for z. Thus
the set of all vectors orthogonal to V and W is the set /CU tX0
/CV .
Given vectorsV and W, the projection of V (denoted pr W
/B4 V/B5 ) in the direction ofW is the vector V
/BC
parallel to W such that V and V /A0 V
/BC
are orthogonal. If β is the angle between V and W, this projection
is the vector of length /CY V/CY cosβ in the direction of W. The formula for the projection is (as in the plane):
(13.43) prW
/B4 V/B5 /BP /B4
V /A1 W
W /A1 W
/B5 W /BM
Again, just as in the plane, if U is the unit vector in the direction of W, then pr W
/B4 V/B5 /BP /B4 V /A1 U/B5 U. We
note that for two vectors V1
/BN V2,
(13.44) prW
/B4 V1
/B7 V2
/B5 /BP prW
/B4 V1
/B5 /B7 prW
/B4 V2
/B5 /BM
Deﬁnition 13.8 The cross product of two vectors V/BN W, denoted V /A2 W, is that vector
a) of length the area of the parallelogram spanned byV/BN W,
b) perpendicular to the plane of V/BN W so that the system /CU V/BN W/BN V /A2 W/CV is right-handed.
Now, since the area of the parallelogram spanned by the vectorsV/BN W is /CY V/CY/CY W/CY sinβ, where β is the
angle between the two vectors, we have
(13.45)
/CY V /A2 W/CY
2
/BP /CY V/CY
2
/CY W/CY
2
/A0 /B4 V /A1 W/B5
2
since
(13.46)
/CY V /A2 W/CY
2
/BP /CY V/CY
2
/CY W/CY
2 sin2 β /BP /CY V/CY
2
/CY W/CY
2
/B4 1 /A0 cos2 β /B5 /BP /CY V/CY
2
/CY W/CY
2
/A0 /B4 /CY V1
/CY/CY V2
/CY cosβ /B5
2
which is the right side of (13.45), from (13.34). Note that interchangingV and W changes the sign of the
cross product, for if the system /CU V/BN W/BN L/CV is right-handed, then the system /CU W/BN V/BN L /CV is left-handed,
and thus /CU W/BN V/BN /A0 L/CV is right handed. This gives us the ﬁrst of the following identities:
(13.47) V /A2 W /BP /A0 W /A2 V
(13.48) V /A2 V /BP 0/BN
(13.49) /B4 aV/B5 /A2 W/B5 /BP a/B4 V /A2 W/B5 /BN
We now determine a formula for the cross product in components. It is useful to start with the determinant
of three vectors in space, sometimes called the triple scalar product.
Deﬁnition 13.9 Given three vectors in space U
/BN V/BN W, we deﬁne the determinant det/B4 U/BN V/BN W /B5 as the
signed volume of the parallelepiped spanned by the vectors. This is zero if the vectors all lie in the same


## Page 13

Chapter 13 Vector Algebra 198
plane. Otherwise, the sign is positive if the vectors
/CU U/BN V/BN W/CV form a right-handed system, and negative
if a left-handed system.
Proposition 13.8 Given two vectors V
/BN W, then, for any third vector U,
(13.50) det /B4 U/BN V/BN W/B5 /BP U /A1 /B4 V /A2 W/B5
For any two vectorsU1
/BN U2
(13.51) det /B4 U1
/B7 U2
/BN V/BN W/B5 /BP det/B4 U1
/BN V/BN W/B5 /B7 det/B4 U2
/BN V/BN W /B5
We now show (13.50) using a geometric argument similar to that used for proposition 13.4. IfV and
W lie on a line, then all terms are zero, and there is nothing to show. Otherwise, V and W determine
a plane; let L be the unit vector orthogonal to that plane so that the triple V/BN W/BN L is right-handed. For
any vector U, let U
/BC
be the projection of U in the direction of L. Then, we see geometrically that the
volume of the parallelepiped spanned byU/BN V/BN W is the product of the area of the parallelogram spanned
by V/BN W and the length of U
/BC
(see ﬁgure 13.16).
Figure 13.16
U
/BC
U
L
V
W
Since V /A2 W has the same direction as L, this volume is
(13.52) /CY U
/BC
/CY/CY V /A2 W/CY /BP /CY U/CY/CY V /A2 W/CY cosβ /BP U /A1 /B4 V /A2 W/B5
where β is the angle between U and L. The signs are right in (21), for on both sides they are determined
by whether or not the system U/BN V/BN W is right-handed. 2 now follows directly from (21), since the right
hand side is linear in U:
(13.53) det /B4 U1
/B7 U2
/BN V/BN W/B5 /BP /B4 U1
/B7 U2
/B5 /A1 /B4 V /A2 W/B5
(13.54) /BP U1
/A1 /B4 V /A2 W/B5 /B7 U2
/A1 /B4 V /A2 W/B5 /BP det/B4 U1
/BN V/BN W /B5 /B7 det/B4 U2
/BN V/BN W/B5
Now, if we permute the three vectors U/BM V/BN W, we just change the sign of the determinant, since it is
always the parallelepiped spanned by the same vectors:
(13.55) det
/B4 U/BN V/BN W /B5 /BP /A0 det/B4 V/BN U/BN W/B5 /BP det/B4 V/BN W/BN U /B5 /BM
So, since, but for sign, we can move any of the vectors in det/B4 U/BN V/BN W /B5 to the ﬁrst position, we conclude
that the determinant is linear in all three variables. In particular, the cross product is linear in its variables.


## Page 14

/DC 13.3 Vectors in Space 199
This allows us to calculate the determinant and cross product from the components of the given vectors.
We ﬁrst observe that the calculations for the basis vectors are immediate, since the area of the unit square
is 1:
(13.56) I
/A2 J /BP K/BN J /A2 K /BP I/BN K /A2 I /BP J/BN I /A2 I /BP J /A2 J /BP K /A2 K /BP 0
Finally, from (21) J /A2 I /BP /A0 I /A2 J /BP /A0 K, etc. After a long computation, we ﬁnd:
Proposition 13.9 If V1
/BP a1I /B7 b1J /B7 c1K/BN V2
/BP a2I /B7 b2J /B7 c2K, then
(13.57) V1
/A2 V2
/BP /B4 b1c2
/A0 c1b2
/B5 I /B7 /B4 c1a2
/A0 a1c2
/B5 J /B7 /B4 a1b2
/A0 b1a2
/B5 K/BM
Now we see that the determinant of three vectors, or, what is the same, the triple scalar product:
V1
/A1 /B4 V2
/A2 V3
/B5 /BP /B4 V1
/A2 V2
/B5 /A1 V3 is, in fact, the determinant of the matrix whose rows are the components
of the vectors V1
/BN V2
/BN V3, just by taking the dot product of V3 with the expression (13.57) for V1
/A2 V2:
Proposition 13.10 If, in addition, V3
/BP a3I /B7 b3J /B7 c3K, then
(13.58) det /B4 V1
/BN V2
/BN V3
/B5 /BP /B4 V1
/A2 V2
/B5 /A1 V3
/BP a3
/B4 b1c2
/A0 c1b2
/B5 /B7 b3
/B4 c1a2
/A0 a1c2
/B5 /B7 c3
/B4 a1b2
/A0 b1a2
/B5 /BM
This is just the expansion of the determinant by minors of the third row. An easy way to remember the
formula for the cross product is as this determinant:
(13.59) V1
/A2 V2
/BP det
/BC
/BS
I J K
a1 b1 c1
a2 b2 c2
/BD
/BT
Example 13.15 Find V1
/A1 /B4 V2
/A2 V3
/B5 where
(13.60) V1
/BP /A0 I /B7 2J /B7 K/BM V2
/BP 2I /A0 2J /B7 3K/BN V3
/BP I /A0 2K /BM
By proposition 13.9, this is the determinant
(13.61) V1
/A1 /B4 V2
/A2 V3
/B5 /BP det
/BC
/BS
/A0 1 2 1
2
/A0 2 3
1 0 /A0 2
/BD
/BT
/BP 1/B4 6 /B7 2/B5 /B7 0 /B7 /B4 /A0 2/B5/B4 2 /A0 4/B5 /BP 12
where we calculate by minors of the third row.
Example 13.16 Find a vector W of length
/CY W/CY /BP 5 which is orthogonal to both V 1 and V2, so that the
system /CU V1
/BN V2
/BN W/CV is right-handed.
W is a positive multiple ofV1
/A2 V2, which is
(13.62) V1
/A2 V2
/BP det
/BC
/BS
I J K
/A0 1 2 1
2 /A0 2 3
/BD
/BT
/BP 8I /B7 5J /A0 2K /BM
This vector has length
/D4
64 /B7 25 /B7 4 /BP
/D4
93, so
(13.63) W /BP
5
/D4
93
/B4 8I /B7 5J /A0 2K/B5 /BM


## Page 15

Chapter 13 Vector Algebra 200
/DC 13.4. Lines and Planes in Space
A coordinate system in space consists of a choice of a particular point O as origin, and a right-handed
system of mutually orthogonal unit vectors I/BN J/BN K. Once a coordinate system is selected, we can rep-
resent a point P : /B4 x/BN y/BN z/B5 by the vector
/DI
OP /BP xI /B7 yJ /B7 zK from the origin to P. Given another point
Q /BP /B4 x
/BC
/BN y
/BC
/BN z
/BC
/B5 , the vector from P to Q is denoted
/DI
PQ /BP /B4 x
/BC
/A0 x/B5 I /B7 /B4 y
/BC
/A0 y/B5 J /B7 /B4 z
/BC
/A0 z/B5 K. We shall often
write the vector
/DI
OP as P for consistency of notation in formaluas. The line through a given point P and
in the direction of a given vectorL is the set of all points X of the form
(13.64) X /BP P /B7 tL
where t runs over all real numbers. This is called the parametric form of the equation of the line. This
says that the vector X /A0 P is collinear with the vector L, and thus the components are proportional. In
coordinates, writing X /BP xI /B7 yJ /B7 zK, P /BP x0I /B7 y0J /B7 z0K, and L /BP aI /B7 bJ /B7 cK, we get thesymmetric
form of the equation of a line:
(13.65) x /A0 x0
a
/BP
y /A0 y0
b
/BP
z /A0 z0
c
/BM
Example 13.17 Find the symmetric equations of the line through the pointsP(2,-1,4) and Q(6, 2, -3).
The vector
/DI
PQ /BP 4I /B7 3J /A0 7K is on the line, soX /BP xI /B7 yJ /B7 zK is on the line precisely whenX /A0 P
is parallel to
/DI
PQ. This gives us the symmetric equations
(13.66) x /A0 2
4
/BP
y /B7 1
3
/BP
z /A0 4
/A0 7
/BM
The plane through a point P, spanned by the vectors V and W is the set of all points X of the form
(13.67) X /BP P /B7 sV /B7 tW
where s/BN t range over all real numbers. This is the parametric form of a plane. We note that a point X
is on the plane if and only if the parallelipiped formed fromX /A0 P/BN V/BN W has zero volume, that is
(13.68) det /B4 X /A0 P/BN V/BN W/B5 /BP 0 /BM
This is the equation of the plane. The vector N /BP V /A2 W is called the normal to the plane, since it is
orthogonal to all vectors lying on the plane. In terms of the normal, we have this as the equation of the
plane:
(13.69)
/B4 X /A0 P/B5 /A1 N /BP 0 /BN
since det /B4 X /A0 P/BN V/BN W /B5 /BP /B4 X /A0 P/B5 /A1 N. Turning to coordinates, let P be the point /B4 x 0
/BN y0
/BN z0
/B5 , and N /BP
aI /B7 bJ /B7 cK. Then for /B4 x/BN y/BN z/B5 the coordinates for the point X, (13.69) becomes
(13.70) a/B4 x /A0 x0
/B5 /B7 b/B4 y /A0 y0
/B5 /B7 c/B4 z /A0 z0
/B5 /BP 0 or ax /B7 by /B7 cz /BP d /BM
where
(13.71) d
/BP ax0
/B7 by0
/B7 cz0
/BM


## Page 16

/DC 13.4 Lines and Planes in Space 201
We can summarize this discussion with
Proposition 13.11 a) Given a point P and a vectorN, the plane through P and orthogonal toN is given
by the equation
(13.72) X
/A1 N /BP P /A1 N /BM
b) The plane through P spanned byV and W has as normal N /BP V /A2 W.
c) The coefﬁcients of the cartesian equation (13.70) for a plane are the components of the normal vector.
Example 13.18 Find the equation of the plane through the point P(5,3,-1) perpendicular to the line in
space whose symmetric equations are
(13.73) x
/A0 2
3
/BP
y /B7 1
4
/BP
z /A0 1
/A0 2
The vector 3I /B7 4J /A0 2K has the direction of the line, so is normal to the plane, and can be taken to
be N. We know that the equation of the plane has the form /B4 X /A0 P/B5 /A1 N /BP 0, for P : /B4 5/BN 3/BN /A0 1/B5 is a point
on the plane. This gives the equation
(13.74) X
/A1 N /BP P /A1 N or 3 x /B7 4y /A0 2z /BP 15 /B7 12 /B7 2 /BP 29 /BM
Example 13.19 Find the equation of the plane containing the pointsP/B4 2/BN 5/BN /A0 1/B5 , Q/B4 6/BN /A0 1/BN 0/B5 , R/B4 3/BN 1/BN 4/B5 .
The vectors
/DI
PQ /BP 4I /A0 6J /B7 K/BN
/DI
PR /BP I /A0 4J /B7 5K lie on the plane, so the normal is
(13.75) N /BP
/DI
PQ /A2
/DI
PR /BP /B4 /A0 30 /B7 4/B5 I /B7 /B4 1 /A0 20/B5 J /B7 /B4 /A0 16 /B7 6/B5 K /BP /A0 26I /A0 19J /A0 10K /BM
The equation of the plane then is X /A1 N /BP P /A1 N, which comes to 26x /B7 19y /B7 10z /BP 137.
Example 13.20 Find the equation of the line through the origin and orthogonal to the plane 2x /A0 y /B7 3z /BP
1.
The vector 2I /A0 J /B7 3K is normal to the plane, so lies in the direction of the line.Thus the symmetric
equations of the line are
(13.76) x
2
/BP
y
/A0 1
/BP
z
3
Now, given two planes with equationsX /A1 N1
/BP d1
/BN X /A1 N2
/BP d2, the vectorN1
/A2 N2 has the direction of
the line of intersection of the two planes. Thus ifP is a point on that line (found by ﬁnding a simultaneous
solution of the equations of the planes), the equation of the line is
(13.77) X
/BP P /B7 t /B4 N1
/A2 N2
/B5 /BM
Example 13.21 Find the parametric form of the line given by the equations 2x /A0 y /B7 3z /BP 1/BN x /B7 5y /A0 2z /BP
0.


## Page 17

Chapter 13 Vector Algebra 202
To ﬁnd a point P on the line we solve the simultaneous equations, taking z /BP 0. This gives the equa-
tions forx and y: 2x /A0 y /BP 1/BN x /B7 5y /BP 0. The solution isx /BP 20/BP 11/BN y /BP /A0 4/BP 11. Thus P/B4 20/BP 11/BN /A0 4/BP 11/BN 0/B5
is on the line. The cross product of the two normals is
(13.78)
/B4 2I /A0 1J /B7 3K/B5 /A2 /B4 I /B7 5J /A0 2K/B5 /BP /A0 13I /B7 7J /B7 12K
giving the parametric equation of the line
(13.79) X
/BP
/AI
20
11
/A0 13t
/AJ
I /B7
/AI
/A0 4
11
/B7 7t
/AJ
J /B7 12tK
Now, suppose we are given two lines in parametric form:
(13.80) X /BP P1
/B7 tL1
/BN X /BP P2
/B7 tL2
/BN
and a point Q, and are asked to ﬁnd the equation of the plane through Q and parallel to the lines. Then
the normal to this plane is perpendicular to the two lines, so can be taken to be L 1
/A2 L2, and then the
equation of the desired plane is
(13.81)
/B4 X /A0 Q/B5 /A1 /B4 L1
/A2 L2
/B5 /BP 0 /BM
Example 13.22 Find the equation of the plane through a (2,0,-1) parallel to the vectorsV /BP 2I /A0 J/BN W /BP
6I /B7 K.
V /A2 W is perpendicular to the vectors V/BN W, so can be taken as the normal N to the plane. We get
(13.82) N /BP /B4 2I /A0 J/B5 /A2 /B4 6I /B7 K/B5 /BP 2I /A2 K /A0 6J /A2 I /A0 J /A2 K /BP /A0 2J /B7 6K /A0 I /BM
Taking X0
/BP 2I /A0 K as a given point on the plane, the equationX /A1 N /BP X 0
/A1 N is
(13.83) /A0 x /A0 2y /B7 6z /BP 2/B4 /A0 1/B5 /B7 /B4 /A0 1/B5 6 /BP /A0 8
We can summarize this discussion in the form of two assertions.
Proposition 13.12 a) Given a line X /BP P /B7 tL, the plane through a given point Q and perpendicular to
the line has the equation /B4 X /A0 Q/B5 /A1 L /BP 0.
b) Given the equation of a plane X /A1 N /BP d, a point P. the line through P and perpendicular to the plane
has the equation X /BP P /B7 tN.
Now, suppose we want to ﬁnd the distance of a point Q to a plane Π. We know from elementary
geometry that the this distance is the length of the line segment from Q to Π which is perpendicular to
Π. This line segment is thus in the direction of the normal to Π, and is seen (see ﬁgure 13.16) to be the
projection of any vector from Q to Π in the normal direction. This demonstrates the ﬁrst part of
Proposition 13.13 a) The distance from a point Q to a planeΠ with normal N is
(13.84) d /B4 Q/BN Π/B5 /BP
/CY
/DI
PQ /A1 N/CY
/CY N/CY
/BN


## Page 18

/DC 13.4 Lines and Planes in Space 203
where P is any point on the plane. b) The distance from a point Q to a line L in the directionL is
(13.85) d /B4 Q/BN L/B5 /BP
/CY
/DI
PQ /A2 L/CY
/CY L/CY
/BN
where P is any point on the line.
To show b), start with ﬁgure 13.17. We have
(13.86) d
/B4 Q/BN L/B5 /BP /CY
/DI
PQ/CY sinθ /BP
/CY
/DI
PQ/CY/CY L/CY sinθ
/CY L/CY
/BP
/CY
/DI
PQ /A2 L/CY
/CY L/CY
/BM
Figure 13.17
N
Π
Q
/B4 /BN /B5
Figure 13.18
L
θ
P
Q
d /B4 Q/BN L/B5
Example 13.23 Find the distance of the point /B4 2/BN 0/BN 4/B5 from the plane whose equation is x /B7 y /A0 2z /BP 0.
Let Q : /B4 2/BN 0/BN 4/B5 . Pick a point P on the plane, for example, P /BP /B4 1/BN 1/BN 1/B5 . N /BP I /B7 J /A0 2K is normal to
the plane, so the distance is the length of the projection of the vector fromP to Q in the direction of N:
(13.87)
/DI
PQ /A1 N /BP /B4 I /A0 J /B7 3K/B5 /A1 /B4 I /B7 J /A0 2K/B5 /BP /A0 6 /BN /CY N/CY /BP
/D4
6
so the distance is /CY
/DI
PQ /A1 N/CY /BP /CY N/CY /BP
/D4
6.
Example 13.24 Find the distance of the point /B4 2/BN 0/BN 1/B5 from the line whose symmetric equations are
(13.88) x /A0 2
3
/BP
y /B7 1
4
/BP
z /A0 1
/A0 2
Let
/DI
OQ /BP 2I /B7 K be the vector to the given point, and
/DI
OP /BP 2I /A0 J /B7 K the vector to a point on the
line, and L /BP 3I /B7 4J /A0 2K, a vector in the direction of the line. The distance is
(13.89)
/CY
/DI
PQ /A2 L/CY
/CY L/CY
/BP
/CY /A0 J /A2 /B4 3I /B7 4J /A0 2K/B5 /CY
/CY 3I /B7 4J /A0 2K/CY
/BP
/D6
13
29
/BM
Example 13.25 Find the distance between the two parallel planes
(13.90) Π1 : x /B7 2y /A0 5z /BP 2 /BN Π2 : x /B7 2y /A0 5z /BP 11 /BM


## Page 19

Chapter 13 Vector Algebra 204
The distance between the two planes is the length of any line segment perpendicular to both planes. Thus
we need only ﬁnd the length of the projection of
/DI
P1P2 on the common normal N /BP I /B7 2J /A0 5K, where
P1 is a point on Π1 and P2 is a point on Π2. Since P1
/A1 N /BP 2, and P2
/A1 N /BP 11 for these points we get, for
the distance:
(13.91)
/CY /B4 P2
/A0 P1
/B5 /A1 N/CY
/CY N/CY
/BP
11 /A0 2
/D4
1 /B7 4 /B7 25
/BP
9
/D4
30
/BM
