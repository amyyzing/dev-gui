# Navigation Math

Source title: Chapter 2

Converted from: `4.pdf`


## Page 1

Chapter 2
Basic Navigational Mathematics,
Reference Frames and the Earth’s
Geometry
Navigation algorithms involve various coordinate frames and the transformation of
coordinates between them. For example, inertial sensors measure motion with
respect to an inertial frame which is resolved in the host platform’s body frame.
This information is further transformed to a navigation frame. A GPS receiver
initially estimates the position and velocity of the satellite in an inertial orbital
frame. Since the user wants the navigational information with respect to the Earth,
the satellite’s position and velocity are transformed to an appropriate Earth-ﬁxed
frame. Since measured quantities are required to be transformed between various
reference frames during the solution of navigation equations, it is important to
know about the reference frames and the transformation of coordinates between
them. But ﬁrst we will review some of the basic mathematical techniques.
2.1 Basic Navigation Mathematical Techniques
This section will review some of the basic mathematical techniques encountered in
navigational computations and derivations. However, the reader is referred to
(Chatﬁeld 1997; Rogers 2007 and Farrell 2008) for advanced mathematics and
derivations. This section will also introduce the various notations used later in the
book.
2.1.1 Vector Notation
In this text, a vector is depicted in bold lowercase letters with a superscript that
indicates the coordinate frame in which the components of the vector are given.
The vector components do not appear in bold, but they retain the superscript. For
example, the three-dimensional vector r for a point in an arbitrary frame k is
depicted as
A. Noureldin et al., Fundamentals of Inertial Navigation, Satellite-based
Positioning and their Integration , DOI: 10.1007/978-3-642-30466-8_2,
/C211 Springer-Verlag Berlin Heidelberg 2013
21


## Page 2

rk ¼
xk
yk
zk
2
4
3
5 ð2:1Þ
In this notation, the superscript k represents the k-frame, and the elements
ðxk; yk; zkÞ denote the coordinate components in the k-frame. For simplicity, the
superscript is omitted from the elements of the vector where the frame is obvious
from the context.
2.1.2 Vector Coordinate Transformation
Vector transformation from one reference frame to another is frequently needed in
inertial navigation computations. This is achieved by a transformation matrix.
A matrix is represented by a capital letter which is not written in bold. A vector of
any coordinate frame can be represented into any other frame by making a suitable
transformation. The transformation of a general k-frame vector r
k into frame m is
given as
rm ¼ Rm
k rk ð2:2Þ
where Rm
k represents the matrix that transforms vector r from the k-frame to the
m-frame. For a valid transformation, the superscript of the vector that is to be
transformed must match the subscript of the transformation matrix (in effect they
cancel each other during the transformation).
The inverse of a transformation matrix R
m
k describes a transformation from the
m-frame to the k-frame
rk ¼ Rm
k
/C0/C1 /C0 1
rm ¼ Rk
mrm ð2:3Þ
If the two coordinate frames are mutually orthogonal, their transformation
matrix will also be orthogonal and its inverse is equivalent to its transpose. As all
the computational frames are orthogonal frames of references, the inverse and the
transpose of their transformation matrices are equal. Hence for a transformation
matrix R
m
k we see that
Rm
k ¼ Rk
m
/C0/C1 T
¼ Rk
m
/C0/C1 /C0 1
ð2:4Þ
A square matrix (like any transformation matrix) is orthogonal if all of its
vectors are mutually orthogonal. This means that if
R ¼
r11 r12 r13
r21 r22 r23
r31 r32 r33
2
4
3
5 ð2:5Þ
22 2 Basic Navigational Mathematics, Reference Frames


## Page 3

where
r1 ¼
r11
r21
r31
2
4
3
5; r2 ¼
r12
r22
r33
2
4
3
5; r3 ¼
r13
r23
r33
2
4
3
5 ð2:6Þ
then for matrix R to be orthogonal the following should be true
r1 /C1 r2 ¼ 0; r1 /C1 r3 ¼ 0; r2 /C1 r3 ¼ 0 ð2:7Þ
2.1.3 Angular Velocity Vectors
The angular velocity of the rotation of one computational frame about another is
represented by a three component vector x: The angular velocity of the k-frame
relative to the m-frame, as resolved in the p-frame, is represented by xp
mk as
xp
mk ¼
xx
xy
xz
2
4
3
5 ð2:8Þ
where the subscripts of x denote the direction of rotation (the k-frame with respect
to the m-frame) and the superscripts denote the coordinate frame in which the
components of the angular velocities xx; xy; xz
/C0/C1
are given.
The rotation between two coordinate frames can be performed in two steps and
expressed as the sum of the rotations between two different coordinate frames, as
shown in Eq. ( 2.9). The rotation of the k-frame with respect to the p-frame can be
performed in two steps: ﬁrstly a rotation of the m-frame with respect to the
p-frame and then a rotation of the k-frame with respect to the m-frame
x
k
pk ¼ xk
pm þ xk
mk ð2:9Þ
For the above summation to be valid, the inner indices must be the same (to
cancel each other) and the vectors to be added or subtracted must be in the same
reference frame (i.e. their superscripts must be the same).
2.1.4 Skew-Symmetric Matrix
The angular rotation between two reference frames can also be expressed by a
skew-symmetric matrix instead of a vector. In fact this is sometimes desired in
order to change the cross product of two vectors into the simpler case of matrix
multiplication. A vector and the corresponding skew-symmetric matrix forms of an
angular velocity vector x
p
mk are denoted as
2.1 Basic Navigation Mathematical Techniques 23


## Page 4

xp
mk ¼
xx
xy
xz
2
4
3
5
|ﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ{zﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ}
Angular velocity vector
) Xp
mk ¼
0 /C0 xz xy
xz 0 /C0 xx
/C0 xy xx 0
2
4
3
5
|ﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ{zﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ}
Skew/C0 symmetric form of angular the velocity vector
ð2:10Þ
Similarly, a velocity vector vp can be represented in skew-symmetric form V p
as
vp ¼
vx
vy
vz
2
4
3
5
|ﬄﬄﬄﬄﬄﬄﬄ{zﬄﬄﬄﬄﬄﬄﬄ}
Velocity vector
) Vp ¼
0 /C0 vz vy
vz 0 /C0 vx
/C0 vy vx 0
2
4
3
5
|ﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ{zﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ}
Skew/C0 symmetric form of the velocity vector
ð2:11Þ
Note that the skew-symmetric matrix is denoted by a non-italicized capital
letter of the corresponding vector.
2.1.5 Basic Operations with Skew-Symmetric Matrices
Since a vector can be expressed as a corresponding skew-symmetric matrix, the
rules of matrix operations can be applied to most vector operations. Ifa, b and c are
three-dimensional vectors with corresponding skew-symmetric matrices A, B and
C, then following relationships hold
a /C1 b ¼ a
T b ¼ bT a ð2:12Þ
a /C2 b ¼ Ab ¼ BT a ¼/C0 Ba ð2:13Þ
Ab½/C138½/C138 ¼ AB /C0 BA ð2:14Þ
a /C2 bðÞ /C1 c ¼ a /C1 b /C2 cðÞ ¼ aT Bc ð2:15Þ
a /C2 b /C2 cðÞ ¼ ABc ð2:16Þ
a /C2 bðÞ /C2 c ¼ ABc /C0 BAc ð2:17Þ
where A b½/C138½/C138 in Eq. ( 2.14) depicts the skew-symmetric matrix of vector A b:
2.1.6 Angular Velocity Coordinate Transformations
Just like any other vector, the coordinates of an angular velocity vector can be
transformed from one frame to another. Hence the transformation of an angular
velocity vector xmk from the k-frame to the p-frame can be expressed as
24 2 Basic Navigational Mathematics, Reference Frames


## Page 5

xp
mk ¼ Rp
kxk
mk ð2:18Þ
The equivalent transformation between two skew-symmetric matrices has the
special form
Xp
mk ¼ Rp
kXk
mkRk
p ð2:19Þ
2.1.7 Least Squares Method
The method of least squares is used to solve a set of equations where there are
more equations than the unknowns. The solution minimizes the sum of the squares
of the residual vector. Suppose we want to estimate a vector x of n parameters
ðx
1; x2; ... ; xnÞ from vector z of m noisy measurements ðz1; z2; ... ; zmÞ such that
m [ n: The measurement vector is linearly related to parameter x with additive
error vector e such that
z ¼ Hx þ e ð2:20Þ
where H is a known matrix of dimension m /C2 n; called the design matrix, and it is
of rank n (linearly independent row or columns).
In the method of least square, the sum of the squares of the components of the
residual vector ðz /C0 HxÞ is minimized in estimating vector x, and is denoted by ^x:
Hence
minimize z /C0 H^xkk 2¼ð z /C0 H^xÞT
1/C2 mðz /C0 H^xÞm/C2 1 ð2:21Þ
This minimization is achieved by differentiating the above equation with
respect to ^x and setting it to zero. Expanding the above equation gives
z /C0 H^xkk 2¼ zT z /C0 zT H^x /C0 ^xT HT z þ ^xT HT H^x ð2:22Þ
Using the following relationships
oðxT aÞ
ox ¼ oðaT xÞ
ox ¼ aT ð2:23Þ
and
oðxT AxÞ
ox ¼ð AxÞT þ xT A ð2:24Þ
the derivative of the scalar quantity represented by Eq. ( 2.22) is obtained as
follows
2.1 Basic Navigation Mathematical Techniques 25


## Page 6

o z /C0 H^xkk 2
/C16/C17
o^x ¼ 0 /C0 zT H /C0ð HT zÞT þð HT H^xÞT þ ^xT HT H
o z /C0 H^xkk 2
/C16/C17
o^x ¼/C0 zT H /C0 zT H þ ^xT HT H þ ^xT HT H
o z /C0 H^xkk 2
/C16/C17
o^x ¼/C0 2ðzT H þ ^xT HT HÞ
ð2:25Þ
To obtain the maximum, the derivative is set to zero and solved for ^x
/C0 2ðzT H /C0 ^xT HT HÞ¼ 0 ð2:26Þ
^xT HT H ¼ zT H
ð^xT HT HÞT ¼ð zT HÞT
HT H^x ¼ HT z
ð2:27Þ
and ﬁnally
^x ¼ð HT HÞ/C0 1HT z ð2:28Þ
We can conﬁrm that the above value of ^x produces the minimum value of the
cost function ( 2.22) by differentiating Eq. ( 2.25) once more that results in 2 HT H
which is positive deﬁnite.
2.1.8 Linearization of Non-Linear Equations
The non-linear differential equations of navigation must be linearized in order to
be usable by linear estimation methods such as Kalman ﬁltering. The non-linear
system is transformed to a linear system whose states are the deviations from the
nominal value of the non-linear system. This provides the estimates of the errors in
the states which are added to the estimated state.
Suppose we have a non-linear differential equation
_x ¼ f ðx; tÞð 2:29Þ
and that we know the nominal solution to this equation is ~x and we let dx be the
error in the nominal solution, then the new estimated value can be written as
x ¼ ~x þ dx ð2:30Þ
The time derivative of the above equation provides
_x ¼ _~x þ d _x ð2:31Þ
Substituting the above value of _x in the original Eq. ( 2.29) gives
26 2 Basic Navigational Mathematics, Reference Frames


## Page 7

_~x þ d _x ¼ f ð~x þ dx; tÞð 2:32Þ
Applying the Taylor series expansion to the right-hand side about the nominal
value ~x yields
f ð~x þ dx; tÞ¼ f ð~x; tÞþ of ðx; tÞ
ox
/C12/C12/C12
/C12
x¼~x
dx þ HOT ð2:33Þ
where the HOT refers to the higher order terms that have not been considered.
Substituting Eq. ( 2.32) for the left-hand side gives
_~x þ d _x /C25 f ð~x; tÞþ of ðx; tÞ
ox
/C12/C12/C12/C12
x¼~x
dx ð2:34Þ
and since ~x also satisﬁes Eq. ( 2.29)
_~x ¼ f ð~x; tÞð 2:35Þ
substituting this in Eq. ( 2.34) gives
_~x þ d _x /C25 _~x þ of ðx; tÞ
ox
/C12/C12
/C12/C12
x¼~x
dx ð2:36Þ
The linear differential equations whose states are the errors in the original states
is give as
d _x /C25 of ðx; tÞ
ox
/C12/C12
/C12/C12
x¼~x
dx ð2:37Þ
After solving this, we get the estimated errors that are added to the estimated
state in order to get the new estimate of the state.
2.2 Coordinate Frames
Coordinate frames are used to express the position of a point in relation to some
reference. Some useful coordinate frames relevant to navigation and their mutual
transformations are discussed next.
2.2.1 Earth-Centered Inertial Frame
An inertial frame is deﬁned to be either stationary in space or moving at constant
velocity (i.e. no acceleration). All inertial sensors produce measurements relative
to an inertial frame resolved along the instrument’s sensitive axis. Furthermore,
2.1 Basic Navigation Mathematical Techniques 27


## Page 8

we require an inertial frame for the calculation of a satellite’s position and velocity
in its orbit around the Earth. The frame of choice for near-Earth environments is
the Earth-centered inertial (ECI) frame. This is shown in Fig. 2.1 and deﬁned
1 by
(Grewal et al. 2007; Farrell 1998)a s
a. The origin is at the center of mass of the Earth.
b. The z-axis is along axis of the Earth’s rotation through the conventional
terrestrial pole (CTP).
c. The x-axis is in the equatorial plane pointing towards the vernal equinox. 2
d. The y-axis completes a right-handed system.
In Fig. 2.1, the axes of the ECI frame are depicted with superscript i as xi; yi; zi;
and in this book the ECI frame will be referred to as the i-frame.
2.2.2 Earth-Centered Earth-Fixed Frame
This frame is similar to the i-frame because it shares the same origin and z-axis as
the i-frame, but it rotates along with the Earth (hence the name Earth-ﬁxed). It is
depicted in Fig. 2.1 along with the i-frame and can be deﬁned as
a. The origin is at the center of mass of the Earth.
b. The z-axis is through the CTP.
c. The x-axis passes through the intersection of the equatorial plane and the
reference meridian (i.e. the Greenwich meridian).
d. The y-axis completes the right-hand coordinate system in the equatorial plane.
In Fig. 2.1 the axes of the Earth-Centered Earth-Fixed Frame (ECEF) are shown
as X
e; Ye; Ze and ðt /C0 t0Þ represents the elapsed time since reference epoch t0: The
termxe
ie represents the Earth’s rotation rate with respect to the inertial frame resolved
in the ECEF frame. In this book the ECEF frame will be referred to as the e-frame.
2.2.3 Local-Level Frame
A local-level frame (LLF) serves to represent a vehicle’s attitude and velocity
when on or near the surface of the Earth. This frame is also known as the local
geodetic or navigation frame. A commonly used LLF is deﬁned as follows
1 Strictly speaking this deﬁnition does not satisfy the requirement deﬁned earlier for an inertial
frame because, in accordance with Kepler’s second law of planetary motion, the Earth does not
orbit around the sun at a ﬁxed speed; however, for short periods of time it is satisfactory.
2 The vernal equinox is the direction of intersection of the equatorial plane of the Earth with the
ecliptic (the plane of Earth’s orbit around the sun).
28 2 Basic Navigational Mathematics, Reference Frames


## Page 9

a. The origin coincides with the center of the sensor frame (origin of inertial
sensor triad).
b. The y-axis points to true north.
c. The x-axis points to east.
d. The z-axis completes the right-handed coordinate systems by pointing up,
perpendicular to reference ellipsoid.
This frame is referred to as ENU since its axes are aligned with the east, north and
up directions. This frame is shown in Fig.2.2. There is another commonly used LLF
that differs from the ENU only in that the z axis completes a left-handed coordinate
system and therefore points downwards, perpendicular to the reference ellipsoid.
This is therefore known as the NED (north, east and down) frame. This book will use
the ENU convention, and the LLF frame will be referred to as the l-frame.
2.2.4 Wander Frame
In the l-frame the y-axis always points towards true north, so higher rotation rates
about the z-axis are required in order to maintain the orientation of the l-frame in
the polar regions (higher latitudes) than near the equator (lower latitudes). As is
apparent in Fig. 2.3b, the l-frame must rotate at higher rates to maintain its ori-
entation when moving towards the pole, reaching its maximum when it crosses the
north pole. This rate can even become inﬁnite (a singularity condition) if the
l-frame passes directly over the pole. The wander frame avoids higher rotation
rates and singularity problems. Instead of always pointing northward, this rotates
Fig. 2.1 An illustration of the ECI and ECEF coordinate frames
2.2 Coordinate Frames 29


## Page 10

about the z-axis with respect to the l-frame. The angle between the y-axis of the
wander frame and north is known as the wander angle a: The rotation rate of this
angle is given as
_a ¼/C0 _k sin u ð2:38Þ
The wander frame (in relation to the l-frame) is shown in Fig. 2.3a, and is
deﬁned as
a. The origin coincides with the center of the sensor frame (origin of inertial
sensor triad).
Fig. 2.2 The local-level ENU reference frame in relation to the ECI and ECEF frames
Fig. 2.3 a The wander frame shown with respect to the local-level frame. b Rotation of the
y-axis of the local-level frame (shown with red/dark arrows) for a near polar crossing trajectory
at various latitudes
30 2 Basic Navigational Mathematics, Reference Frames


## Page 11

b. The z-axis is orthogonal to the reference ellipsoid pointing upward.
c. The y-axis rotates by an angle a anticlockwise from north.
d. The x-axis is orthogonal to the y and z axes and forms a right-handed coor-
dinate frame.
In this book the wander frame is referred to as the w-frame.
2.2.5 Computational Frame
For the ensuing discussion, the computational frame is deﬁned to be any reference
frame used in the implementation of the equations of motion. It can be any of the
abovementioned coordinate frames, and is referred to as the k-frame.
2.2.6 Body Frame
In most applications, the sensitive axes of the accelerometer sensors are made to
coincide with the axes of the moving platform in which the sensors are mounted.
These axes are usually known as the body frame.
The body frame used in this book is shown in Fig. 2.4, and is deﬁned as
a. The origin usually coincides with the center of gravity of the vehicle (this
simpliﬁes derivation of kinematic equations).
b. The y-axis points towards the forward direction. It is also called the roll axis as
the roll angle is deﬁned around this axis using the right-hand rule.
c. The x-axis points towards the transverse direction. It is also called the pitch
axis, as the pitch angle corresponds to rotations around this axis using the right-
hand rule.
d. The z-axis points towards the vertical direction completing a right-handed
coordinate system. It is also called the yaw axis as the yaw angle corresponds to
rotations around this axis using the right-hand rule.
In this book the body frame is referred to as b-frame.
Fig. 2.4 The body frame
of a moving platform
2.2 Coordinate Frames 31


## Page 12

2.2.6.1 Vehicle Attitude Description
Apart from a vehicle’s position, we are also interested in its orientation in order to
describe its heading and tilt angles. This involves specifying its rotation about the
vertical (z), transversal (x) and forward (y) axes of the b-frame with respect to
the l-frame. In general, the rotation angles about the axes of the b-frame are called
the Euler angles. For the purpose of this book, the following convention is applied
to vehicle attitude angles (Fig. 2.5)
a. Azimuth (or yaw): Azimuth is the deviation of the vehicle’s forward (y) axis
from north, measured clockwise in the E-N plane. The yaw angle is similar, but
is measured counter clockwise from north. In this book, the azimuth angle is
denoted by ‘ A’ and the yaw angle by ‘ y’. Owing to this deﬁnition, the vertical
axis of the b-frame is also known as the yaw axis (Fig. 2.4).
b. Pitch: This is the angle that the forward (y) axis of the b-frame makes with the
E-N plane (i.e. local horizontal) owing to a rotation around its transversal (x)
axis. This axis is also called the pitch axis, the pitch angle is denoted by ‘ p’ and
follows the right-hand rule (Fig. 2.5).
c. Roll: This is the rotation of the b-frame about its forward (y) axis, so the
forward axis is also called the roll axis and the roll angle is denoted by ‘ r’ and
follows the right-hand rule.
2.2.7 Orbital Coordinate System
This is a system of coordinates with Keplerian elements to locate a satellite in
inertial space. It is deﬁned as follows
a. The origin is located at the focus of an elliptical orbit that coincides with the
center of the mass of the Earth.
Fig. 2.5 A depiction of a vehicle’s azimuth, pitch and roll angles. The body axes are shown in
red
32 2 Basic Navigational Mathematics, Reference Frames


## Page 13

b. The y-axis points towards the descending node, parallel to the minor axis of the
orbital ellipse.
c. The x-axis points to the perigee (the point in the orbit nearest the Earth’s center)
and along the major axis of the elliptical orbit of the satellite.
d. The z-axis is orthogonal to the orbital plane.
The orbital coordinate system is illustrated in Fig. 2.6. It is mentioned here to
complete the discussion of the frames used in navigation (it will be discussed in
greater detail in Chap. 3).
2.3 Coordinate Transformations
The techniques for transforming a vector from one coordinate frame into another
can use direction cosines, rotation (Euler) angles or quaternions. They all involve a
rotation matrix which is called either the transformation matrix or the direction
cosine matrices (DCM), and is represented as R
l
k where the subscript represents the
frame from which the vector originates and the superscript is the target frame. For
example, a vector rk in a coordinate frame k can be represented by another vector
rl in a coordinate frame l by applying a rotation matrix Rl
k as follows
Fig. 2.6 The orbital coordinate system for a satellite
2.2 Coordinate Frames 33


## Page 14

rl ¼ Rl
krk ð2:39Þ
If Euler angles are used, these readily yield the elementary matrices required to
construct the DCM.
2.3.1 Euler Angles and Elementary Rotational Matrices
A transformation between two coordinate frames can be accomplished by carrying
out a rotation about each of the three axes. For example, a transformation from the
reference frame a to the new coordinate frame b involves ﬁrst making a rotation of
angle c about the z-axis, then a rotation of an angle b about the new x-axis, and
ﬁnally a rotation of an angle a about the new y-axis. In these rotations, a; b and c
are the Euler angles.
To transform a vector r
a ¼ xa; ya; za½/C138 from frame a to frame d where the two
frames are orientated differently in space, we align frame a with frame d using the
three rotations speciﬁed above, each applying a suitable direction cosine matrix.
The individual matrices can be obtained by considering each rotation, one by one.
First we consider the x-y plane of frame a in which the projection of vector r
(represented by r
1) makes an angle h1 with the x-axis. We therefore rotate frame a
around its z-axis through an angle c to obtain the intermediate frame b; as illus-
trated in Fig. 2.7.
According to this ﬁgure, the new coordinates are represented by xb; yb; zb and
can be expressed as
xb ¼ r1 cos h1 /C0 cðÞ ð 2:40Þ
yb ¼ r1 sin h1 /C0 cðÞ ð 2:41Þ
Since the rotation was performed around the z-axis, this remains unchanged
zb ¼ za ð2:42Þ
Using the following trigonometric identities
sinðA /C6 BÞ¼ sin A cos B /C6 cos A sin B
cosðA /C6 BÞ¼ cos A cos B /C7 sin A sin B ð2:43Þ
Equations (2.40) and ( 2.41) can be written as
xb ¼ r1 cos h1 cos c þ r1 sin h1 sinc ð2:44Þ
yb ¼ r1 sin h1 cos c /C0 r1 cos h1 sinc ð2:45Þ
The original coordinates of vector r1 in the x-y plane can be expressed in terms
of angle h1 as
34 2 Basic Navigational Mathematics, Reference Frames


## Page 15

xa ¼ r1 cos h1 ð2:46Þ
ya ¼ r1 sinh1 ð2:47Þ
Substituting the above values in Eqs. ( 2.44) and ( 2.45) produces
xb ¼ xa cos c þ ya sin c ð2:48Þ
yb ¼/C0 xa sin c þ ya cos c ð2:49Þ
and we have shown that
zb ¼ za ð2:50Þ
In matrix form, the three equations above can be written as
xb
yb
zb
2
4
3
5 ¼
cos c sin c 0
/C0 sin c cos c 0
00 1
2
4
3
5
xa
ya
za
2
4
3
5 ð2:51Þ
xb
yb
zb
2
4
3
5 ¼ Rb
a
xa
ya
za
2
4
3
5 ð2:52Þ
where Rb
a is the elementary DCM which transforms the coordinates xa; ya; za to
xb; yb; zb in a frame rotated by an angle c around the z-axis of frame a:
Fig. 2.7 The ﬁrst rotation of
frame ‘a’ about its z a-axis
2.3 Coordinate Transformations 35


## Page 16

For the second rotation, we consider the y-z plane of the new coordinate frameb,
and rotate it by an angle b around its x-axis to an intermediate frame c as shown in
Fig. 2.8.
In a similar fashion it can be shown that the new coordinates xc; yc; zc can be
expressed in terms of xb; yb; zb as follows
xc
yc
zc
2
4
3
5 ¼
10 0
0 cos b sinb
0 /C0 sin b cos b
2
4
3
5
xb
yb
zb
2
4
3
5 ð2:53Þ
xc
yc
zc
2
4
3
5 ¼ Rc
b
xb
yb
zb
2
4
3
5 ð2:54Þ
where Rc
b is the elementary DCM which transforms the coordinates xb; yb; zb to
xc; yc; zc in a frame rotated by an angle b around the x-axis of frame b:
For the third rotation, we consider the x-z plane of new coordinate frame c; and
rotate it by an angle a about its y-axis to align it with coordinate frame d as shown
in Fig. 2.9.
The ﬁnal coordinates xd ; yd ; zd can be expressed in terms of xc; yc; zc as follows
xd
yd
zd
2
4
3
5 ¼
cos a 0 /C0 sina
01 0
sina 0 cos a
2
4
3
5
xc
yc
zc
2
4
3
5 ð2:55Þ
Fig. 2.8 The second rotation
of rotated frame ‘b’ about
x
b-axis
36 2 Basic Navigational Mathematics, Reference Frames


## Page 17

xd
yd
zd
2
4
3
5 ¼ Rd
c
xc
yc
zc
2
4
3
5 ð2:56Þ
where Rd
c is the elementary DCM which transforms the coordinates xc; yc; zc to
xd ; yd ; zd in the ﬁnal desired frame d rotated by an angle a around the y-axis of
frame c:
We can combine all three rotations by multiplying the cosine matrices into a
single transformation matrix as
Rd
a ¼ Rd
c Rc
b
Rb
a
ð2:57Þ
The ﬁnal DCM for these particular set of rotations can be given as
Rd
a ¼
cos a 0 /C0 sin a
01 0
sin a 0 cos a
2
4
3
5
10 0
0 cos b sin b
0 /C0 sin b cos b
2
4
3
5
cos c sinc 0
/C0 sinc cos c 0
00 1
2
4
3
5 ð2:58Þ
Rd
a ¼
cos a cos c /C0 sinb sin a sin c cos a sinc þ cos c sinb sin a /C0 cos b sin a
/C0 cos b sin c cos b cos c sinb
cos c sin a þ cos a sinb sin c sin a sin c /C0 cos a cos c sinb cos b cos a
2
4
3
5
ð2:59Þ
The inverse transformation from frame d to a is therefore
Fig. 2.9 The third rotation of
rotated frame ‘c’ about
y
c-axis
2.3 Coordinate Transformations 37


## Page 18

Ra
d ¼ Rd
a
/C0/C1 /C0 1
¼ Rd
a
/C0/C1 T
¼ Rd
c Rc
b
Rb
a
/C0/C1 T
¼ Rb
a
/C0/C1 T
Rc
b
/C0/C1 T
Rd
c
/C0/C1 T ð2:60Þ
It should be noted that the ﬁnal transformation matrix is contingent upon the
order of the applied rotations, as is evident from the fact that Rc
bRb
a
6¼ Rb
aRc
b
: The
order of rotations is dictated by the speciﬁc application. We will see in Sect. 2.3.6
that a different order of rotation is required and the elementary matrices are
multiplied in a different order to yield a different ﬁnal transformation matrix.
For small values of a; b and c we can use the following approximations
cos h /C25 1 ; sin h /C25 h ð2:61Þ
Using these approximations and ignoring the product of the small angles, we
can reduce the DCM to
R
d
a /C25
1 c /C0 a
/C0 c 1 b
a /C0 b 1
2
64
3
75
Rd
a ¼
100
010
001
2
64
3
75 /C0
0 /C0 ca
c 0 /C0 b
/C0 ab 0
2
64
3
75
Rd
a ¼ I /C0 W
ð2:62Þ
where W is the skew-symmetric matrix for the small Euler angles. For the small-
angle approximation, the order of rotation is no longer important since in all cases
the ﬁnal result will always be the matrix of the Eq. ( 2.62). Similarly, it can be
veriﬁed that
Ra
d /C25
1 c /C0 a
/C0 c 1 b
a /C0 b 1
2
64
3
75
T
Ra
d ¼ I /C0 WT
ð2:63Þ
2.3.2 Transformation Between ECI and ECEF
The angular velocity vector between the i-frame and the e-frame as a result of the
rotation of the Earth is
xe
ie ¼ 0; 0; xeðÞ T ð2:64Þ
38 2 Basic Navigational Mathematics, Reference Frames


## Page 19

where xe denotes the magnitude of the Earth’s rotation rate. The transformation
from the i-frame to the e-frame is a simple rotation of the i-frame about the z-axis
by an angle x
et where t is the time since the reference epoch (Fig. 2.10). The
rotation matrix corresponds to the elementary matrix Rb
a; and when denoted Re
i
which can be expressed as
Re
i ¼
cos xet sin xet 0
/C0 sinxet cos xet 0
00 1
2
4
3
5 ð2:65Þ
Transformation from the e-frame to the i-frame can be achieved through Ri
e; the
inverse of Re
i : Since rotation matrices are orthogonal
Ri
e ¼ Re
i
/C0/C1 /C0 1
¼ Re
i
/C0/C1 T
ð2:66Þ
2.3.3 Transformation Between LLF and ECEF
From Fig. 2.11 it can be observed that to align the l-frame with the e-frame, the
l-frame must be rotated by u /C0 90 degrees around its x-axis (east direction) and
then by /C0 90 /C0 k degrees about its z-axis (up direction).
For the deﬁnition of elementary direction cosine matrices, the transformation
from the l-frame to the e-frame is
Re
l ¼ Rb
a /C0 k /C0 90ðÞ Rc
b u /C0 90ðÞ ð 2:67Þ
Fig. 2.10 Transformation
between the e-frame and the
i-frame
2.3 Coordinate Transformations 39


## Page 20

Re
l ¼
cos /C0 k /C0 90ðÞ sin /C0 k /C0 90ðÞ 0
/C0 sin /C0 k /C0 90ðÞ cos /C0 k /C0 90ðÞ 0
00 1
2
4
3
5
10 0
0 cos u /C0 90ðÞ sin u /C0 90ðÞ
0 /C0 sin u /C0 90ðÞ cos u /C0 90ðÞ
2
4
3
5
ð2:68Þ
Re
l ¼
/C0 sin k /C0 cos k 0
cos k /C0 sin k 0
00 1
2
4
3
5
10 0
0 sinu /C0 cos u
0 cos u sin u
2
4
3
5 ð2:69Þ
Re
l ¼
/C0 sink /C0 sin u cos k cos u cos k
cos k /C0 sinu sin k cos u sink
0 cos u sinu
2
4
3
5 ð2:70Þ
The reverse transformation is
Rl
e ¼ Re
l
/C0/C1 /C0 1
¼ Re
l
/C0/C1 T
ð2:71Þ
2.3.4 Transformation Between LLF and Wander Frame
The wander frame has a rotation about the z-axis of the l-frame by a wander angle
a; as depicted in Fig. 2.12. Thus the transformation matrix from the w-frame frame
to the l-frame corresponds to the elementary matrix Rb
a with an angle /C0 a; and is
expressed as
Fig. 2.11 The LLF in
relation to the ECEF frame
40 2 Basic Navigational Mathematics, Reference Frames


## Page 21

Rl
w ¼
cos /C0 aðÞ sin /C0 aðÞ 0
/C0 sin /C0 aðÞ cos /C0 aðÞ 0
00 1
2
4
3
5 ð2:72Þ
Rl
w ¼
cos a /C0 sin a 0
sin a cos a 0
00 1
2
4
3
5 ð2:73Þ
and
Rw
l ¼ Rl
w
/C0/C1 /C0 1
¼ Rl
w
/C0/C1 T
ð2:74Þ
2.3.5 Transformation Between ECEF and Wander Frame
This transformation is obtained by ﬁrst going from the w-frame to the l-frame and
then from the l-frame to the e-frame
Re
w ¼ Re
l Rl
w
ð2:75Þ
Re
w ¼
/C0 sink /C0 sin u cos k cos u cos k
cos k /C0 sin u sin k cos u sin k
0 cos u sinu
2
4
3
5
cos a /C0 sina 0
sina cos a 0
00 1
2
4
3
5 ð2:76Þ
Fig. 2.12 The relationship
between the l-frame and the
w-frame (the third axes of
these the frames are not
shown because they coincide
and point out of the page
towards the reader)
2.3 Coordinate Transformations 41


## Page 22

Re
w ¼
/C0 sinkcosa /C0 cosksinusina sinksina /C0 cosksinucosa coskcosu
coskcosa /C0 sinksinusina /C0 cosksina /C0 sinksinucosa sinkcosu
cosusina cosucosa sinu
2
4
3
5
ð2:77Þ
The inverse is
Rw
e ¼ Re
w
/C0/C1 /C0 1
¼ Re
w
/C0/C1 T
ð2:78Þ
2.3.6 Transformation Between Body Frame and LLF
One of the important direction cosine matrices is Rl
b; which transforms a vector
from the b-frame to the l-frame, a requirement during the mechanization process.
This is expressed in terms of yaw, pitch and roll Euler angles. According to the
deﬁnitions of these speciﬁc angles and the elementary direction cosine matrices,
Rl
b can be expressed as
Rl
b ¼ Rb
l
/C0/C1 /C0 1
¼ Rb
l
/C0/C1 T
¼ Rd
c Rc
b
Rb
a
/C0/C1 T
¼ Rb
a
/C0/C1 T
Rc
b
/C0/C1 T
Rd
c
/C0/C1 T ð2:79Þ
Substituting the elementary matrices into this equation gives
Rl
b ¼
cos y sin y 0
/C0 sin y cos y 0
00 1
2
4
3
5
T 10 0
0 cos p sin p
0 /C0 sin p cos p
2
4
3
5
T cos r 0 /C0 sin r
01 0
sin r 0 cos r
2
4
3
5
T
ð2:80Þ
Rl
b ¼
cos y /C0 sin y 0
sin y cos y 0
00 1
2
4
3
5
10 0
0 cos p /C0 sin p
0 sin p cos p
2
4
3
5
cos r 0 sin r
01 0
/C0 sin r 0 cos r
2
4
3
5 ð2:81Þ
Rl
b ¼
cos y cos r /C0 sin y sin p sin r /C0 sin y cos p cos y sin r þ sin y sin p cos r
sin y cos r þ cos y sin p sin r cos y cos p sin y sin r /C0 cos y sin p cos r
/C0 cos p sin r sin p cos p cos r
2
4
3
5
ð2:82Þ
where ‘p’, ‘r’ and ‘ y’ are the pitch, roll and yaw angles. With a known Rl
b; these
angles can be calculated as
42 2 Basic Navigational Mathematics, Reference Frames


## Page 23

p ¼ tan/C0 1 Rl
b 3; 2ðÞﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
Rl
b 1; 2ðÞ
/C2/C3 2
þ Rl
b 2; 2ðÞ
/C2/C3 2
q
8
><
>:
9
>=
>;
ð2:83Þ
y ¼/C0 tan/C0 1 Rl
b 1; 2ðÞ
Rl
b 2; 2ðÞ
/C20/C21
ð2:84Þ
r ¼/C0 tan/C0 1 Rl
b 3; 1ðÞ
Rl
b 3; 3ðÞ
/C20/C21
ð2:85Þ
A transformation from the l-frame to the b-frame can be achieved by the inverse
rotation matrix, Rl
b; as follows
Rb
l ¼ Rl
b
/C0/C1 /C0 1
¼ Rl
b
/C0/C1 T
ð2:86Þ
2.3.7 Transformation From Body Frame to ECEF and ECI Frame
Two other important transformations are from the b-frame to the e-frame and the
i-frames. Their rotation matrices can be computed from those already deﬁned as
follows.
For the body frame to the e-frame
R
e
b ¼ Re
l Rl
b
ð2:87Þ
For the body frame to the i-frame
Ri
b ¼ Ri
eRe
b
ð2:88Þ
Their inverses are
Rb
e ¼ Re
b
/C0/C1 /C0 1
¼ Re
b
/C0/C1 T
ð2:89Þ
Rb
i ¼ Ri
b
/C0/C1 /C0 1
¼ Ri
b
/C0/C1 T
ð2:90Þ
2.3.8 Time Derivative of the Transformation Matrix
If a coordinate reference frame k rotates with angular velocity x relative to another
frame m, the transformation matrix between the two is composed of a set of time
variable functions. The time rate of change of the transformation matrix _Rm
k can be
described using a set of differential equations. The frame in which the time dif-
ferentiation occurs is usually identiﬁed by the superscript of the variable.
2.3 Coordinate Transformations 43


## Page 24

At time t, the two frames m and k are related by a DCM Rm
k ðtÞ: After a short
time dt; frame k rotates to a new orientation and the new DCM at time t þ dt is
Rm
k ðt þ dtÞ: The time derivative of the DCM Rm
k is therefore
_Rm
k ¼ lim
dt!0
dRm
k
dt
_Rm
k ¼ lim
dt!0
Rm
k ðt þ dtÞ/C0 Rm
k ðtÞ
dt
ð2:91Þ
The transformation at time t þ dt is the outcome of the transformation up to
time t followed by the small change of the m frame that occurs during the brief
interval dt: Hence Rm
k ðt þ dtÞ can be written as the product of two matrices
Rm
k ðt þ dtÞ¼ dRmRm
k ðtÞð 2:92Þ
From Eq. ( 2.62), the small angle transformation can be given as
dRm ¼ I /C0 Wm ð2:93Þ
Substituting Eq. ( 2.93) into ( 2.92) gives
Rm
k ðt þ dtÞ¼ð I /C0 WmÞRm
k ðtÞð 2:94Þ
and substituting this back into Eq. ( 2.91) produces
_Rm
k ¼ lim
dt!0
ðI /C0 WmÞRm
k ðtÞ/C0 Rm
k ðtÞ
dt
_Rm
k ¼ lim
dt!0
ðI /C0 Wm /C0 IÞRm
k ðtÞ
dt
_Rm
k ¼ lim
dt!0
/C0 WmRm
k ðtÞ
dt
_Rm
k ¼/C0 lim
dt!0
Wm
dt
/C18/C19
Rm
k ðtÞ
ð2:95Þ
When dt ! 0; Wm=dt is the skew-symmetric form of the angular velocity
vector of the m frame with respect to the k frame during the time increment dt: Due
to the limiting process, the angular velocity can also be referenced to the k frame
lim
dt!0
Wm
dt ¼ Xm
km ð2:96Þ
Substituting Eq. ( 2.96) into ( 2.95) gives
_Rm
k ¼/C0 Xm
kmRm
k ð2:97Þ
From the relation Xm
km ¼/C0 Xm
mk; this becomes
_Rm
k ¼ Xm
mkRm
k ð2:98Þ
44 2 Basic Navigational Mathematics, Reference Frames


## Page 25

From Eq. ( 2.19)
Xm
mk ¼ Rm
k Xk
mkRk
m ð2:99Þ
Substituting this into ( 2.98) gives
_Rm
k ¼ Rm
k Xk
mkRk
mRm
k
ð2:100Þ
Finally we get the important equation for the rate of change of the DCM as
_Rm
k ¼ Rm
k Xk
mk ð2:101Þ
This implies that the time derivative of the rotation matrix is related to the
angular velocity vector x of the relative rotation between the two coordinate
frames. If we have the initial transformation matrix between the body and inertial
frames Ri
b; then we can update the change of the rotation matrix using gyroscope
output Xb
ib:
2.3.9 Time Derivative of the Position Vector in the Inertial Frame
For a position vector rb; the transformation of its coordinates from the b-frame to
the inertial frame is
ri ¼ Ri
brb ð2:102Þ
Differentiating both sides with respect to time leads to
_ri ¼ _Ri
brb þ Ri
b _rb ð2:103Þ
Substituting the value of _Ri
b from Eq. ( 2.101) into ( 2.103) gives
_ri ¼ Ri
bXb
ib
/C0/C1
rb þ Ri
b _rb ð2:104Þ
A rearrangement of the terms gives
_ri ¼ Ri
b _rb þ Xb
ibrb/C0/C1
ð2:105Þ
which describes the transformation of the velocity vector from the b-frame to the
inertial frame. This is often called the Coriolis equation.
2.3.10 Time Derivative of the Velocity Vector in the Inertial Frame
The time derivative of the velocity vector is obtained by differentiating Eq. (2.105)
as follows
2.3 Coordinate Transformations 45


## Page 26

€ri ¼ _Ri
b _rb þ Ri
b€rb þ _Ri
bXb
ibrb þ _Xb
ibrb þ Xb
ib _rb/C0/C1
Ri
b
€ri ¼ _Ri
b _rb þ Ri
b€rb þ _Ri
bXb
ibrb þ Ri
b _Xb
ibrb þ Ri
bXb
ib _rb ð2:106Þ
Substituting the value of _Ri
b from Eq. ( 2.101) yields
€ri ¼ Ri
bXb
ib _rb þ Ri
b€rb þ Ri
bXb
ibXb
ib
rb þ Ri
b _Xb
ibrb þ Ri
bXb
ib _rb
€ri ¼ Ri
b Xb
ib _rb þ €rb þ Xb
ibXb
ib
rb þ _Xb
ibrb þ Xb
ib _rb/C0/C1
€ri ¼ Ri
b 2Xb
ib _rb þ €rb þ Xb
ibXb
ib
rb þ _Xb
ibrb/C0/C1
ð2:107Þ
and rearrangement gives
€ri ¼ Ri
b €rb þ 2Xb
ib _rb þ _Xb
ibrb þ Xb
ibXb
ib
rb/C0/C1
ð2:108Þ
where
€rb is the acceleration of the moving object in the b-frame
Xb
ib is the angular velocity of the moving object measured by a
gyroscope
2Xb
ib _rb is the Coriolis acceleration
_Xb
ibrb is the tangential acceleration
Xb
ibXb
ib
rb is the centripetal acceleration
2.4 The Geometry of the Earth
Although the Earth is neither a sphere nor a perfect ellipsoid, it is approximated by
an ellipsoid for computational convenience. The ellipsoid and various surfaces that
are useful for understanding the geometry of the Earth’s shape are depicted in
Fig. 2.13.
Fig. 2.13 A depiction of various surfaces of the Earth
46 2 Basic Navigational Mathematics, Reference Frames


## Page 27

2.4.1 Important Deﬁnitions
At this point, it will be useful to describe some of the important deﬁnitions which
will assist in understanding the ensuing analysis. For further details, the reader is
referred to (Titterton and Weston 2005; Vanícek and Krakiwsky 1986).
• Physical Surface—Terrain’’: This is deﬁned as the interface between the solid
and ﬂuid masses of the Earth and its atmosphere. It is the actual surface that we
walk or ﬂoat on.
• Geometric Figure —Geoid’’: This is the equipotential surface (surface of
constant gravity) best ﬁtting the average sea level in the least squares sense
(ignoring tides and other dynamical effects in the oceans). It can be thought of
as the idealized mean sea level extended over the land portion of the globe.
The geoid is a smooth surface but its shape is irregular and it does not provide
the simple analytic expression needed for navigational computations.
• Reference Ellipsoid —Ellipsoid’’: This mathematically deﬁned surface
approximates the geoid by an ellipsoid that is made by rotating an ellipse about
its minor axis, which is coincident with the mean rotational axis of the Earth.
The center of the ellipsoid is coincident with the Earth’s center of mass.
The ellipsoid is the most analytically convenient surface to work with for
navigational purposes. Its shape is deﬁned by two geometric parameters called the
semimajor axis and the semiminor axis. These are typically represented by a and b
respectively, as in Fig. 2.14. The geoid height N is the distance along the ellip-
soidal normal from the surface of the ellipsoid to the geoid. The orthometric height
H is the distance from the geoid to the point of interest. The geodetic height h (also
known as altitude) is the sum of the geoid and orthometric heights ( h ¼ H þ N).
Various parameter sets have been deﬁned to model the ellipsoid. This book uses
the world geodetic system (WGS)-84 whose deﬁning parameters (Torge 1980;
Vanícek and Krakiwsky 1986) are
Semimajor axis (equatorial radius) a ¼ 6; 378; 137:0m
Reciprocal ﬂattening
1
f ¼ 298:257223563
Earth’s rotation rate xe ¼ 7:292115 /C2 10/C0 5 rad/s
Gravitational constant GM ¼ 3:986004418 /C2 1014 m3=s2
Other derived parameters of interest are
Flatness f ¼ a/C0 b
a ¼ 0:00335281
Semiminor axis b ¼ að1 /C0 f Þ¼ 6356752.3142 m
Eccentricity e ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃ
a2 /C0 b2
a2
q
¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
f ð2 /C0 f Þ
p
¼ 0:08181919
2.4 The Geometry of the Earth 47


## Page 28

2.4.2 Normal and Meridian Radii
In navigation two radii of curvature are of particular interest, the normal radius and
the meridian radius. These govern the rates at which the latitude and longitude
change as a navigating platform moves on or near the surface of the Earth.
The normal radius RN is deﬁned for the east-west direction, and is also known
as the great normal or the radius of curvature of the prime vertical
RN ¼ a
1 /C0 e2 sin2 u
/C0/C1 1
2
ð2:109Þ
The meridian radius of curvature is deﬁned for the north-south direction and is
the radius of the ellipse
RM ¼ a 1 /C0 e2ðÞ
1 /C0 e2 sin2 u
/C0/C1 3
2
ð2:110Þ
A derivation of these radii can be found in Appendix A, and for further insight
the reader is referred to (Grewal et al. 2007; Rogers 2007).
Fig. 2.14 The relationship between various Earth surfaces (highly exaggerated) and a depiction
of the ellipsoidal parameters
48 2 Basic Navigational Mathematics, Reference Frames


## Page 29

2.5 Types of Coordinates in the ECEF Frame
It is important to distinguish between the two common coordinate systems of the
e-frame, known as the ‘rectangular’ and ‘geodetic’ systems.
2.5.1 Rectangular Coordinates in the ECEF Frame
Rectangular coordinates are like traditional Cartesian coordinates, and represent
the position of a point with its x, y and z vector components aligned parallel to the
corresponding e-frame axes (Fig. 2.15).
2.5.2 Geodetic Coordinates in the ECEF Frame
Geodetic (also referred to as ellipsoidal or curvilinear) coordinates are deﬁned in a
way that is more intuitive for positioning applications on or near the Earth. These
coordinates are deﬁned (Farrell 2008)a s
a. Latitude ðuÞ is the angle in the meridian plane from the equatorial plane to the
ellipsoidal normal at the point of interest.
b. Longitude ðkÞ is the angle in the equatorial plane from the prime meridian to
the projection of the point of interest onto the equatorial plane.
Fig. 2.15 Two types of
ECEF coordinates and their
interrelationship
2.5 Types of Coordinates in the ECEF Frame 49


## Page 30

c. Altitude h is the distance along the ellipsoidal normal between the surface of the
ellipsoid and the point of interest.
The two types of e-frame coordinates and their interrelationship are illustrated
in Fig. 2.15.
2.5.3 Conversion From Geodetic to Rectangular Coordinates
in the ECEF Frame
In navigation, it is often necessary to convert from geodetic e-frame coordinates to
rectangular e-frame coordinates. The following relationship (see Appendix B for a
derivation) accomplishes this
x
e
ye
ze
2
64
3
75 ¼
RN þ hðÞ cos u cos k
RN þ hðÞ cos u sink
RN 1 /C0 e2ðÞ þ h
/C8/C9
sin u
2
4
3
5 ð2:111Þ
where
ðxe; ye; zeÞ are the e-frame rectangular coordinates
RN is the normal radius
h is the ellipsoidal height
k is the longitude
u is the latitude
e is the eccentricity.
2.5.4 Conversion From Rectangular to Geodetic Coordinates
in the ECEF Frame
Converting rectangular to geodetic coordinates is not straightforward, because the
analytical solution results in a fourth-order equation. There are approximate closed
form solutions but an iterative scheme is usually employed.
2.5.4.1 Closed-Form Algorithm
This section will describe a closed form algorithm to calculate e-frame geodetic
coordinates directly from e-frame rectangular coordinates though series expansion
(Hofmann-Wellenhof et al. 2008). An alternate method is detailed in Appendix C.
50 2 Basic Navigational Mathematics, Reference Frames


## Page 31

Longitude is
k ¼ 2 arctan ye
xe þ
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q ð2:112Þ
latitude is
u ¼ arctan ze þ e0ðÞ 2b sin3 h
p /C0 e2a cos3 h ð2:113Þ
where
h ¼ arctan zea
pb
e0 ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
a2 /C0 b2
b2
r
p ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
and height is
h ¼ p
cos u /C0 N ð2:114Þ
where
N ¼ a2
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
a2 cos2 u þ b2 sin2 u
p
2.5.4.2 Iterative Algorithm
The iterative algorithm is derived in Appendix D and implemented by taking the
following steps
a. Initialize the altitude as
h0 ¼ 0 ð2:115Þ
b. Choose an arbitrary value of latitude either from a previous measurement (if one
is available) or by using the approximation
u0 ¼ tan/C0 1 ze
Pe 1 /C0 e2ðÞ
/C20/C21
ð2:116Þ
2.5 Types of Coordinates in the ECEF Frame 51


## Page 32

c. The geodetic longitude is calculated as
k ¼ tan/C0 1 ye
xe
/C18/C19
ð2:117Þ
d. Starting from i ¼ 1; iterate as follows
RNi ¼ a
1 /C0 e2 sin2 ui/C0 1
/C0/C1 1=2 ð2:118Þ
hi ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
cos ui/C0 1
/C0 RNi ð2:119Þ
ui ¼ tan/C0 1 ze
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q /C1 RNi þ hiðÞ
RNi 1 /C0 e2ðÞ þ hi
8
><
>:
9
>=
>;
ð2:120Þ
e. Compare ui; ui/C0 1 and hi; hi/C0 1; if convergence has been achieved then stop,
otherwise repeat step d using the new values.
2.6 Earth Gravity
The gravity ﬁeld vector is different from the gravitational ﬁeld vector. Due to the
Earth’s rotation, the gravity ﬁeld is used more frequently and is deﬁned as
g ¼ /C22g /C0 X
ieXier ð2:121Þ
where /C22g is the gravitational vector, Xie is the skew-symmetric representation of the
Earth’s rotation vector xie with respect to the i-frame, and r is the geocentric
position vector. The second term in the above equation denotes the centripetal
acceleration due to the rotation of the Earth around its axis. Usually, the gravity
vector is given in the l-frame. Because the normal gravity vector on the ellipsoid
coincides with the ellipsoidal normal, the east and the north components of the
normal gravity vector are zero and only third component is non-zero
g
l ¼ 00 /C0 g½/C138 T ð2:122Þ
52 2 Basic Navigational Mathematics, Reference Frames


## Page 33

The magnitude of the normal gravity vector over the surface of the ellipsoid can
be computed as a function of latitude and height by a closed form expression
known as the Somigliana formula (Schwarz and Wei Jan 1999), which is
c ¼ a
1 1 þ a2 sin2 u þ a3 sin4 u
/C0/C1
þ a4 þ a5 sin2 u
/C0/C1
h þ a6h2 ð2:123Þ
where h is the height above the Earth’s surface and the coefﬁcients a1 through a6
for the 1980 geographic reference system (GRS) are deﬁned as
a1¼ 9:7803267714 m/s2; a4¼/C0 0:0000030876910891=s2;
a2¼0:0052790414; a5¼0:0000000043977311=s2;
a3¼0:0000232718; a6 ¼ 0:0000000000007211=ms2
Appendix A
Derivation of Meridian Radius and Normal Radius
For Earth ellipsoids, every meridian is an ellipse with equatorial radius a (called
the semimajor axis) and polar radius b (called the semiminor axis). Figure 2.16
shows a meridian cross section of one such ellipse (Rogers 2007).
This ellipse can be described by the equation
w2
a2 þ z2
b2 ¼ 1 ð2:124Þ
and the slope of the tangent to point P can be derived by differentiation
Fig. 2.16 A meridian cross section of the reference ellipsoid containing the projection of the
point of interest P
2.6 Earth Gravity 53


## Page 34

2wdw
a2 þ 2zdz
b2 ¼ 0 ð2:125Þ
dz
dw ¼/C0 b2w
a2z ð2:126Þ
An inspection of the Fig. 2.16 shows that the derivative of the curve at point P,
which is equal to the slope of the tangent to the curve at that point, is
dz
dw ¼ tan p
2 þ u
/C16/C17
ð2:127Þ
dz
dw ¼ sin p
2 þ u
/C0/C1
cos p
2 þ u
/C0/C1 ¼ cos u
/C0 sinu ¼/C0 1
tan u ð2:128Þ
Therefore
1
tan u ¼ b2w
a2z ð2:129Þ
From the deﬁnition of eccentricity, we have
e2 ¼ 1 /C0 b2
a2
b2
a2 ¼ 1 /C0 e2
ð2:130Þ
and Eq. ( 2.129) becomes
z ¼ w 1 /C0 e2/C0/C1
tan u ð2:131Þ
The ellipse described by Eq. ( 2.124) gives
w2 ¼ a2 1 /C0 z2
b2
/C18/C19
ð2:132Þ
Substituting the value of z from Eq. ( 2.131) yields
w2 ¼ a2 /C0 a2w2 1 /C0 e2ðÞ 2tan2 u
b2
 !
w2 þ a2w2 1 /C0 e2ðÞ 2tan2 u
b2 ¼ a2
w2 b2 þ a2 1 /C0 e2ðÞ 2tan2 u
b2
 !
¼ a2
54 2 Basic Navigational Mathematics, Reference Frames


## Page 35

w2 ¼ a2b2
b2 þ a2 1 /C0 e2ðÞ 2tan2 u
w2 ¼ a2 a2 1 /C0 e2ðÞ½/C138
a2 1 /C0 e2ðÞ þ a2 1 /C0 e2ðÞ 2tan2 u
w2 ¼ a2
1 þ 1 /C0 e2ðÞ tan2 u
w2 ¼ a2
1 þ 1 /C0 e2ðÞ sin2 u
cos2 u
w2 ¼ a2 cos2 u
cos2 u þ 1 /C0 e2ðÞ sin2 u
w2 ¼ a2 cos2 u
1 /C0 e2 sin2 u
ð2:133Þ
w ¼ a cos u
1 /C0 e2 sin2 u
/C0/C1 1
2
ð2:134Þ
Substituting this expression for w in Eq. ( 2.131) produces
z ¼ a 1 /C0 e2ðÞ sinu
1 /C0 e2 sin2 u
/C0/C1 1
2
ð2:135Þ
which will be used later to derive the meridian radius.
It can easily be proved from Fig. 2.16 that
w ¼ RN cos u ð2:136Þ
From this and Eq. ( 2.134) we have the expression for the normal radius, RN ;
also known as the radius of curvature in the prime vertical
RN ¼ a
1 /C0 e2 sin2 u
/C0/C1 1
2
ð2:137Þ
The radius of curvature of an arc of constant longitude is
RM ¼
1 þ dz
dw
/C0/C12hi
/C6 d2z
dw2
3
2
ð2:138Þ
2.6 Earth Gravity 55


## Page 36

The second derivative of Eq. ( 2.126) provides
dz
dw ¼/C0 b2w
a2z ¼/C0 b2w
a2 b2 /C0 b2w2
a2
/C18/C19 /C0 1=2
d2z
dw2 ¼/C0 b2
a2 b2 /C0 b2w2
a2
/C18/C19 /C0 1=2
/C0 b2w
a2 /C0 1
2
/C18/C19
b
2 /C0 b2w2
a2
/C18/C19 /C0 3=2
/C0 b2
a2
/C18/C19
2w
d2z
dw2 ¼/C0 b2
a2z /C0 b4w2
a4z3
d2z
dw2 ¼ /C0 b2a2z2 /C0 b4w2
a4z3 ¼
/C0 b2a2 b2 /C0 b2w2
a2
/C16/C17
/C0 b4w2
a4z3
d2z
dw2 ¼ /C0 b4a2 þ b4w2 /C0 b4w2
a4z3
which simpliﬁes to
d2z
dw2 ¼/C0 b4
a2z3 ð2:139Þ
Substituting Eqs. ( 2.139) and ( 2.126) into ( 2.138) yields
RM ¼
1 þ b4w2
a4z2
hi
b4
a2z3
3
2
ð2:140Þ
and since b2
a2 ¼ 1 /C0 e2
RM ¼
1 þ
1 /C0 e2ðÞ
2
w2
z2
/C20/C21
b2 1 /C0 e2ðÞ
z3
3
2
RM ¼
z2þ 1 /C0 e2ðÞ
2
w2
z2
/C20/C21
b2 1 /C0 e2ðÞ
z3
3
2
RM ¼
z2 þ 1 /C0 e2ðÞ
2
w2
hi
b2 1 /C0 e2ðÞ
3
2
ð2:141Þ
56 2 Basic Navigational Mathematics, Reference Frames


## Page 37

Substituting the value of w from Eq. ( 2.134) and z from (2.135) gives
RM ¼
a2 1 /C0 e2ðÞ
2
sin2 u
1 /C0 e2 sin2 u þ 1 /C0 e2ðÞ
2 a2 cos2 u
1 /C0 e2 sin2 u
/C20/C21
b2 1 /C0 e2ðÞ
3
2
RM ¼
a2 1 /C0 e2ðÞ
2
sin2 uþ 1 /C0 e2ðÞ
2
a2 cos2 u
1 /C0 e2 sin2 u
/C20/C21
b2 1 /C0 e2ðÞ
3
2
RM ¼
a2 1 /C0 e2ðÞ 2 sin2 u þ cos2 u
/C0/C1hi
b2 1 /C0 e2ðÞ 1 /C0 e2 sin2 u
/C0/C1 3
2
3
2
RM ¼ a3 1 /C0 e2ðÞ 3
b2 1 /C0 e2ðÞ 1 /C0 e2 sin2 u
/C0/C1 3
2
RM ¼ a 1 /C0 e2ðÞ
3
1 /C0 e2ðÞ 1 /C0 e2ðÞ 1 /C0 e2 sin2 u
/C0/C1 3
2
leading to the meridian radius of curvature
RM ¼ a 1 /C0 e2ðÞ
1 /C0 e2 sin2 u
/C0/C1 3
2
ð2:142Þ
Appendix B
Derivation of the Conversion Equations From Geodetic
to Rectangular Coordinates in the ECEF Frame
Figure 2.17 shows the relationship between geodetic and rectangular coordinates
in the ECEF frame.
It is evident that
rP ¼ rQ þ hn ð2:143Þ
where
rQ ¼
RN cos u cos k
RN cos u sink
RN sin u /C0 RN e2 sin u
2
4
3
5 ¼ RN
cos u cos k
cos u sin k
sin u /C0 RN e2 sin u
2
4
3
5 ð2:144Þ
2.6 Earth Gravity 57


## Page 38

Also, the unit vector along the ellipsoidal normal is
n ¼
cos u cos k
cos u sin k
sin u
2
4
3
5 ð2:145Þ
Substituting Eqs. ( 2.144) and ( 2.145) into ( 2.143) gives
rP ¼ RN
cos u cos k
cos u sink
sin u /C0 RN e2 sin u
2
4
3
5 þ h
cos u cos k
cos u sin k
sin u
2
4
3
5 ð2:146Þ
rP ¼
RN þ hðÞ cos u cos k
RN þ hðÞ cos u sin k
RN 1 /C0 e2ðÞ þ h
/C8/C9
sinu
2
4
3
5 ð2:147Þ
Fig. 2.17 The relationship between geodetic and rectangular coordinates in the ECEF frame
58 2 Basic Navigational Mathematics, Reference Frames


## Page 39

xe
ye
ze
2
64
3
75 ¼
RN þ hðÞ cos u cos k
RN þ hðÞ cos u sink
RN 1 /C0 e2ðÞ þ h
/C8/C9
sin u
2
4
3
5 ð2:148Þ
Appendix C
Derivation of Closed Form Equations From Rectangular
to Geodetic Coordinates in the ECEF Frame
Here we derive a closed form algorithm which uses a series expansion (Schwarz
and Wei Jan 1999) to compute e-frame geodetic coordinates directly from e-frame
rectangular coordinates.
From Fig. 2.18a it can is evident that, for given rectangular coordinates, the
calculation of geocentric coordinates k; u0; rðÞ is simply
r ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2þ zeðÞ 2
q
ð2:149Þ
Fig. 2.18 Reference diagram for conversion of rectangular coordinates to geodetic coordinates
in the ECEF frame through a closed-form method
2.6 Earth Gravity 59


## Page 40

k ¼ tan/C0 1 ye
xe
/C18/C19
ð2:150Þ
u0 ¼ sin/C0 1 ze
r
/C18/C19
ð2:151Þ
From the triangle POC (elaborated in Fig. 2.18b) it is apparent that the dif-
ference between the geocentric latitude u0 and the geodetic latitude u is
D þ u0 þ p
2 þ p
2 /C0 u
/C16/C17
¼ p
D þ u0 þ p /C0 u ¼ p
D ¼ u /C0 u0
ð2:152Þ
where D is the angle between the ellipsoidal normal at Q and the normal to the
sphere at P:
Applying the law of sines to the triangle in Fig. 2.18b provides
sin D
RN e2 sinu ¼ sin p
2 /C0 u
/C0/C1
r
sin D
RN e2 sinu ¼ cos u
r
sin D ¼ RN e2 sin u cos u
r
D ¼ sin/C0 1 RN e2 sinu cos u
r
/C18/C19
ð2:153Þ
D ¼ sin/C0 1 RN e2 1
2 sin 2u
r
/C18/C19
ð2:154Þ
Substituting the deﬁnition of the normal radius RN given in Eq. ( 2.137)
RN ¼ a
1 /C0 e2 sin2 u
/C0/C1 1=2 ð2:155Þ
into Eq. ( 2.154) gives
D ¼ sin/C0 1
a
1/C0 e2 sin2 uðÞ
1=2 e2 1
2 sin 2u
r
0
@
1
A ð2:156Þ
D ¼ sin/C0 1 k sin 2u
1 /C0 e2 sin2 u
/C0/C1 1=2
 !
ð2:157Þ
where
60 2 Basic Navigational Mathematics, Reference Frames


## Page 41

k ¼ e2a
2 ð2:158Þ
To achieve a ﬁrst approximation, if u ¼ u0 then D can be computed by using
the geocentric latitude
Dc ¼ sin/C0 1 k sin 2u0
1 /C0 e2 sin2 u0/C0/C1 1=2
 !
ð2:159Þ
Expanding Eq. ( 2.157) for this approximation, Dc; gives
D ¼ D u ¼ u0ðÞ þ D0 uðÞ j u¼u0 u /C0 u0ðÞ þ D00 uðÞ j u¼u0
u /C0 u0ðÞ 2
2!
þ D000 uðÞ j u¼u0
u /C0 u0ðÞ 3
3! þ ... ð2:160Þ
D ¼ Dc þ D0 u0ðÞ D þ 1
2! D00 u0ðÞ D2 þ 1
3! D000 u0ðÞ D3 þ ... ð2:161Þ
For a very small value of D (less than 0.005), it can be assumed that RN ’ r;
and hence
D ¼ e2
2 sin 2u ð2:162Þ
So for this situation, let k ¼ e2
2 so that
D ¼ k sin 2u ð2:163Þ
The series used above can therefore be truncated after the fourth-order term and
be considered as a polynomial equation. Solving this polynomial provides
D ¼ Dc
1 /C0 2k cos 2u0 þ 2k2 sin2 u0 ð2:164Þ
The geodetic latitude can be given as
u ¼ u0 þ D ¼ sin/C0 1 ze
r þ D ð2:165Þ
The geodetic longitude is the same as shown earlier
k ¼ tan/C0 1 ye
xe
/C18/C19
ð2:166Þ
The ellipsoidal height is calculated from the triangle PRC of Fig. 2.18a
Pe ¼ RN þ hðÞ cos u ð2:167Þ
2.6 Earth Gravity 61


## Page 42

h ¼ Pe
cos u /C0 RN ð2:168Þ
h ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
cos u /C0 RN ð2:169Þ
Equations (2.165), (2.166) and (2.169) are therefore closed-form expressions to
convert from rectangular coordinates to geodetic coordinates in the e-frame.
Appendix D
Derivation of the Iterative Equations From Rectangular
to Geodetic Coordinates in the ECEF Frame
From Eq. ( 2.148), which relates geodetic and rectangular coordinates in the
e-frame, we see that
xe ¼ RN þ hðÞ cos u cos k ð2:170Þ
ye ¼ RN þ hðÞ cos u sin k ð2:171Þ
ze ¼ RN 1 /C0 e2/C0/C1
þ h
/C8/C9
sin u ð2:172Þ
Given the rectangular coordinates and these equations, the geodetic longitude is
k ¼ tan/C0 1 ye
xe
/C18/C19
ð2:173Þ
Equation (2.169) speciﬁes the relationship for the altitude as
h ¼
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
cos u /C0 RN ð2:174Þ
Also, from Eqs. ( 2.170) and ( 2.171) it can be shown that
xeðÞ 2þ yeðÞ 2¼ RN þ hðÞ 2cos u2 cos2 k þ sin2 k
/C2/C3
ð2:175Þ
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
¼ RN þ hðÞ cos u ð2:176Þ
And ﬁnally, dividing Eq. ( 2.172) by Eq. ( 2.176) yields
ze
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q ¼ RN 1 /C0 e2ðÞ þ h½/C138
RN þ hðÞ tan u
62 2 Basic Navigational Mathematics, Reference Frames


## Page 43

u ¼ tan/C0 1 ze RN þ hðÞ
RN 1 /C0 e2ðÞ þ h½/C138
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
xeðÞ 2þ yeðÞ 2
q
8
><
>:
9
>=
>;
ð2:177Þ
References
Chatﬁeld AB (1997) Fundamentals of high accuracy inertial navigation. American Institute of
Aeronautics and Astronautics, Reston
Farrell JA (1998) The global positioning system and inertial navigation. McGraw-Hill, New York
Farrell JA (2008) Aided navigation : GPS with high rate sensors. McGraw-Hill, New York
Grewal MS, Weill LR, Andrews AP (2007) Global positioning systems, inertial navigation, and
integration, 2nd edn. Wiley, New York
Hofmann-Wellenhof B, Lichtenegger H, Wasle E (2008) GNSS-global navigation satellite
systems : GPS, GLONASS, Galileo, and more. Springer, New York
Rogers RM (2007) Applied mathematics in integrated navigation systems, 3rd edn. American
Institute of Aeronautics and Astronautics, Reston
Schwarz KP, Wei M (Jan 1999) ENGO 623: Partial lecture on INS/GPS integration for geodetic
applications University of Calgary, Department of Geomatics Engineering
Titterton D, Weston J (2005) Strapdown inertial navigation technology IEE radar, sonar,
navigation and avionics series, 2nd edn. AIAA
Torge W (1980) Geodesy: an introduction. De Gruyter, Berlin
Vanícek P, Krakiwsky EJ (1986) Geodesy, the concepts. North Holland; Sole distributors for the
U.S.A. and Canada. Elsevier Science Pub. Co., Amsterdam
2.6 Earth Gravity 63


## Page 44

http://www.springer.com/978-3-642-30465-1
