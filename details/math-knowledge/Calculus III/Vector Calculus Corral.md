# Corral's Vector Calculus

Converted from: `Calculus III\Vector Calculus Corral.pdf`


## Page 1

-10
-5
0
5
10
-10 -5 0 5 10
-0.4
-0.2
0
0.2
0.4
0.6
0.8
1
z
x
y
z
CORRAL ’S
VECTOR
CALCULUS
Michael Corral
and Anton Petrunin


## Page 2

[No extractable text on this page]


## Page 3

Corral’s Vector Calculus
Michael Corral and Anton Petrunin


## Page 4

About the author :
Michael Corral is an Adjunct Faculty member of the Department of Mathematics at
Schoolcraft College. He received a B.A. in Mathematics from t he University of California
at Berkeley , and received an M.A. in Mathematics and an M.S. i n Industrial & Operations
Engineering from the University of Michigan.
This text was typeset in LATEX 2ε with the KOMA-Script bundle, using the GNU Emacs text
editor on a Fedora Linux system. The graphics were created using M etaPost, PGF , and
Gnuplot.
Copyright ©2016 Anton Petrunin.
Permission is granted to copy , distribute and/or modify this document under the terms of the
GNU Free Documentation License, Version 1.2 or any later versi on published by the Free
Software Foundation; with no Invariant Sections, no Front-Co ver Texts, and no Back-Cover
Texts. A copy of the license is included in the section entitled “GNU Free Documentation
License”.


## Page 5

Preface
This book covers calculus in two and three variables. It is sui table for a one-semester course,
normally known as “Vector Calculus”, “Multivariable Calcul us”, or simply “Calculus III”.
The prerequisites are the standard courses in single-variabl e calculus (also known as Cal-
culus I and II).
The exercises are divided into three categories: A, B and C. The A exercises are mostly
of a routine computational nature, the B exercises are slight ly more involved, and the C
exercises usually require some effort or insight to solve. A crude way of describing A, B and
C would be “Easy”, “Moderate” and “Challenging”, respectively . However , many of the B
exercises are easy and not all the C exercises are difﬁcult.
Answers and hints to most odd-numbered and some even-numbered e xercises are provided
in Appendix A.
There are a few exercises that require the student to write a com puter program, for ex-
ample, the Monte Carlo method for approximating multiple integr als, in Section 4.4. The
code samples in the text are in the Java programming language, ho pefully with enough
comments so that the reader can ﬁgure out what is being done even wi thout knowing Java.
Those exercises do not mandate the use of Java, so students are fr ee to implement the solu-
tions using the language of their choice. While it would have b een simple to use a scripting
language like Python, and perhaps even easier with a functional programming language
(such as Haskell or Scheme), Java was chosen due to its ubiquity , relatively clear syntax,
and easy availability for multiple platforms.
This book is released under the GNU Free Documentation License ( GFDL), which allows
others to not only copy and distribute the book but also to modify it. For more details, see
the included copy of the GFDL. So that there is no ambiguity on this matter , anyone can
make as many copies of this book as desired and distribute it as des ired, without needing a
permission.
This book can be downloaded at https://github.com/anton-petrunin/calc3book; the older ,
original version by Michael Corral, can be also obtained fro m http://www.mecmath.net.
iii


## Page 6

Contents
Preface iii
1 Vectors in Euclidean Space 1
1.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.2 Vector Algebra . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
1.3 Dot Product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
1.4 Cross Product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
1.5 Lines and Planes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
1.6 Elementary surfaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 43
1.7 Curvilinear Coordinates . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
2 Curves 56
2.1 Vector-Valued Functions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
2.2 Arc Length . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 66
2.3 Curvature . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 70
3 Functions of Several Variables 74
3.1 Functions of Two or Three Variables . . . . . . . . . . . . . . . . . . . . . . . . . . 74
3.2 Partial Derivatives . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
3.3 Tangent Plane to a Surface . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
3.4 Directional Derivatives and the Gradient . . . . . . . . . . . . . . . . . . . . . . . 87
3.5 Maxima and Minima . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 93
3.6 Numerical Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 100
3.7 Lagrange Multipliers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 107
4 Multiple Integrals 114
4.1 Double Integrals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 114
4.2 Double Integrals Over a General Region . . . . . . . . . . . . . . . . . . . . . . . . 119
4.3 Triple Integrals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 126
4.4 Numerical Approximation of Multiple Integrals . . . . . . . . . . . . . . . . . . . 130
4.5 Change of Variables in Multiple Integrals . . . . . . . . . . . . . . . . . . . . . . . 135
4.6 Application: Center of Mass . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
4.7 Application: Probability and Expected Value . . . . . . . . . . . . . . . . . . . . . 147
5 Line and Surface Integrals 155
5.1 Line Integrals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 155
iv


## Page 7

Contents v
5.2 Properties of Line Integrals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 164
5.3 Green’s Theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 172
5.4 Surface Integrals and the Divergence Theorem . . . . . . . . . . . . . . . . . . . . 179
5.5 Stokes’ Theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 189
5.6 Gradient, Divergence, Curl and Laplacian . . . . . . . . . . . . . . . . . . . . . . . 202
5.7 Other coordinate systems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 207
Bibliography 213
Appendix A: Answers and Hints to Selected Exercises 215
GNU Free Documentation License 218
History 226
Index 227


## Page 8

[No extractable text on this page]


## Page 9

1 Vectors in Euclidean Space
1.1 Introduction
In single-variable calculus, the functions that one encoun ters are functions of a variable
(usually x or t) that varies over some subset of the real number line (which we de note by R).
For such a function, say , y = f (x), the graph of the function f consists of the points ( x, y) =
(x, f (x)). These points lie in the Euclidean plane, which, in the Cartesian or rectangular
coordinate system, consists of all ordered pairs of real number s ( a, b). We use the word
“Euclidean” to denote a system in which all the usual rules of Euc lidean geometry hold. We
denote the Euclidean plane by R2; the “2” represents the number of dimensions of the plane.
The Euclidean plane has two perpendicular coordinate axes: the x-axis and the y-axis.
In vector (or multivariable) calculus, we will deal with functio ns of two or three variables
(usually x, y or x, y, z, respectively). The graph of a function of two variables, say , z = f (x, y),
lies in Euclidean space , which in the Cartesian coordinate system consists of all order ed
triples of real numbers ( a, b, c). Since Euclidean space is 3-dimensional, we denote it by R3.
The graph of f consists of the points ( x, y, z) = (x, y, f (x, y)). The 3-dimensional coordinate
system of Euclidean space can be represented on a ﬂat surface, su ch as this page or a black-
board, only by giving the illusion of three dimensions, in the m anner shown in Figure 1.1.1.
Euclidean space has three mutually perpendicular coordinate axes (x, y and z), and three
mutually perpendicular coordinate planes: the x y-plane, yz-plane and xz-plane (see Figure
1.1.2).
x
y
z
0
P(a, b, c)
a
b
c
Figure 1.1.1
x
y
z
0
yz-plane
x y-plane
xz-plane
Figure 1.1.2
The coordinate system shown in Figure 1.1.1 is known as a right-handed coordinate
system, because it is possible, using the right hand, to point the index ﬁ nger in the positive
1


## Page 10

2 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
direction of the x-axis, the middle ﬁnger in the positive direction of the y-axis, and the thumb
in the positive direction of the z-axis, as in Figure 1.1.3.
x
z
y
0
Figure 1.1.3 Right-handed coordinate system.
An equivalent way of deﬁning a right-handed system is if you can point your thumb up-
wards in the positive z-axis direction while using the remaining four ﬁngers to rotat e the
x-axis towards the y-axis. Doing the same thing with the left hand is what deﬁnes a left-
handed coordinate system . Notice that switching the x- and y-axes in a right-handed
system results in a left-handed system, and that rotating eit her type of system does not
change its “handedness”. Throughout the book we will use a right- handed system.
For functions of three variables, the graphs exist in 4-dimens ional space ( R4), which we
can not see in our 3-dimensional space, let alone simulate in 2- dimensional space. So we can
only think of 4-dimensional space abstractly . For an entertai ning discussion of this subject,
see the book by A BBOTT .1
So far , we have discussed theposition of an object in 2-dimensional or 3-dimensional space.
But what about something such as the velocity of the object, or its acceleration? Or the
gravitational force acting on the object? These phenomena al l seem to involve motion and
direction in some way . This is where the idea of a vector comes in.
Y ou have already dealt with velocity and acceleration in single -variable calculus. For
example, for motion along a straight line, if y = f (t) gives the displacement of an object after
time t, then d y/dt = f ′(t) is the velocity of the object at time t. The derivative f ′(t) is just a
1One thing you will learn is why a 4-dimensional creature would be able to reach inside an egg and remove the
yolk without cracking the shell!


## Page 11

1.1 Introduction 3
number , which is positive if the object is moving in an agreed-upo n “positive” direction, and
negative if it moves in the opposite of that direction. So you can think of that number , which
was called the velocity of the object, as having two components : a magnitude, indicated
by a nonnegative number , preceded by a direction, indicated by a plus or minus symbol
(representing motion in the positive direction or the negative direction, respectively); that
is, f ′(t) = ± a for some number a ≥ 0. Then a is the magnitude of the velocity (normally called
the speed of the object), and the ± represents the direction of the velocity (though the + is
usually omitted for the positive direction).
For motion along a straight line (which is a 1-dimensional space ) the velocities are also
contained in that 1-dimensional space, since they are just num bers. For general motion
along a curve in 2- or 3-dimensional space, however , velocity wil l need to be represented by
a multidimensional object which should have both a magnitude an d a direction. A geomet-
ric object which has those features is an arrow , which in elemen tary geometry is called a
“directed line segment”. This is the motivation for how we will de ﬁne a vector.
Deﬁnition 1.1. A (nonzero) vector is a directed line segment drawn from a point P (called
its initial point ) to a point Q (called its terminal point ), with P and Q being distinct
points. The vector is denoted by − − →PQ . Its magnitude is the length of the line segment,
denoted by

− − →PQ

, and its direction is the same as that of the directed line segment. The
zero vector is just a point, and it is denoted by 0.
To indicate the direction of a vector , we draw an arrow from its ini tial point to its terminal
point. We will often denote a vector by a single bold-faced letter (for instance, v) and use
the terms “magnitude” and “length” interchangeably . Note th at our deﬁnition could apply to
systems with any number of dimensions (see Figure 1.1.4 (a)–(c )).
0 xP QRS
− − →PQ− − →RS
(a) One dimension
x
y
0
P
Q
R
S
− − →PQ
− − →RS
v
(b) Two dimensions
x
y
z
0
P
QR
S
− − →PQ
− − →RS
v
(c) Three dimensions
Figure 1.1.4 Vectors in different dimensions.
A few things need to be noted about the zero vector. Our motivat ion for what a vector is
included the notions of magnitude and direction. What is the mag nitude of the zero vector?
We deﬁne it to be zero; that is, ∥0∥ = 0. This agrees with the deﬁnition of the zero vector as
just a point, which has zero length. What about the direction of t he zero vector? A single
point really has no well-deﬁned direction. Notice that we were care ful to only deﬁne the


## Page 12

4 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
direction of a nonzero vector , which is well-deﬁned since the initial and terminal poin ts are
distinct. Not everyone agrees on the direction of the zero vect or . Some contend that the
zero vector has arbitrary direction, some say that it has indeterminate direction (that is, the
direction can not be determined), while others say that it has no direction. Our deﬁnition of
the zero vector , however , does not require it to have a direction, and we will leave it at that. 2
Now that we know what a vector is, we need a way of determining when two vectors are
equal. This leads us to the following deﬁnition.
Deﬁnition 1.2. Two nonzero vectors are equal if they have the same magnitude and the
same direction. Any vector with zero magnitude is equal to the ze ro vector .
By this deﬁnition, vectors with the same magnitude and direction but with different initial
points would be equal. For example, in Figure 1.1.5 the vectors u, v and w all have the same
magnitude
/∇adicallow
5 (by the Pythagorean Theorem). And we see that u and w are parallel, since
they lie on lines having the same slope 1
2 , and they point in the same direction. So u = w,
even though they have different initial points. We also see tha t v is parallel to u but points
in the opposite direction. So u ̸= v.
1
2
3
4
1 2 3 4
x
y
0
u
v
w
Figure 1.1.5
So we can see that there are an inﬁnite number of vectors for a gi ven magnitude and
direction, those vectors all being equal and differing only by their initial and terminal points.
Is there a single vector which we can choose to represent all thos e equal vectors? The answer
is yes, and is suggested by the vector w in Figure 1.1.5.
Unless otherwise indicated, when speaking of “the vector” with a gi ven magnitude and
direction, we will mean the one whose initial point is at the origin of the coordinate
system.
Thinking of vectors as starting from the origin provides a way o f dealing with vectors in
a standard way , since every coordinate system has an origin. Bu t there will be times when
2In the subject of linear algebra there is a more abstract way of d eﬁning a vector where the concept of “direction”
is not really used. See A NTON and R ORRES .


## Page 13

1.1 Introduction 5
it is convenient to consider a different initial point for a vect or (for example, when adding
vectors, which we will do in the next section).
Another advantage of using the origin as the initial point is th at it provides an natural
correspondence between a vector and its terminal point.
Example 1.1. Let v be the vector in R3 whose initial point is at the origin and whose ter-
minal point is (3 , 4, 5). Though the point (3, 4, 5) and the vector v are different objects, it is
convenient to write v = (3, 4, 5). When doing this, it is understood that the initial point of v
is at the origin (0 , 0, 0) and the terminal point is (3 , 4, 5).
x
y
z
0
P(3, 4, 5)
(a) The point (3,4,5)
x
y
z
0
v = (3, 4, 5)
(b) The vector (3,4,5)
Figure 1.1.6 Correspondence between points and vectors.
Unless otherwise stated, when we refer to vectors as v = (a, b) in R2 or v = (a, b, c) in R3,
we mean vectors in Cartesian coordinates starting at the origi n. Also, we will write the zero
vector 0 in R2 and R3 as (0, 0) and (0 , 0, 0), respectively .
The point-vector correspondence provides a way to check if two vect ors are equal, without
having to determine their magnitude and direction. Similar to s eeing if two points are the
same, you are now seeing if the terminal points of vectors star ting at the origin are the same.
For each vector , ﬁnd the (unique!) vector it equals whose init ial point is the origin. Then
compare the coordinates of the terminal points of these “new” vec tors: if those coordinates
are the same, then the original vectors are equal. To get the “ new” vectors starting at the
origin, you translate each vector to start at the origin by subtracting the coordina tes of
the original initial point from the original terminal point. T he resulting point will be the
terminal point of the “new” vector whose initial point is the orig in. Do this for each original
vector then compare.
Example 1.2. Consider the vectors − − →PQ and − − →RS in R3, where P = (2, 1, 5),Q = (3, 5, 7), R =
(1, − 3, − 2) and S = (2, 1, 0). Does − − →PQ = − − →RS ?
Solution: The vector − − →PQ is equal to the vector v with initial point (0 , 0, 0) and terminal point
Q − P = (3, 5, 7) − (2, 1, 5) = (3 − 2, 5 − 1, 7 − 5) = (1, 4, 2).
Similarly ,− − →RS is equal to the vector w with initial point (0 , 0, 0) and terminal point S − R =
(2, 1, 0) − (1, − 3, − 2) = (2 − 1, 1 − (− 3), 0 − (− 2)) = (1, 4, 2).


## Page 14

6 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
So − − →PQ = v = (1, 4, 2) and − − →RS = w = (1, 4, 2).
∴ − − →PQ = − − →RS
y
z
x
0
− − →PQ
− − →RS
Translate − − →PQ to v
Translate − − →RS to w
P
(2, 1, 5)
Q
(3, 5, 7)
R
(1, − 3, − 2)
S
(2, 1, 0)
(1, 4, 2)
v = w
Figure 1.1.7
Recall the distance formula for points in the Euclidean plane:
For points P = (x1, y1), Q = (x2, y2) in R2, the distance d between P and Q is:
d =
√
(x2 − x1)2 + (y2 − y1)2. (1.1)
By this formula, we have the following result:
For a vector − − →PQ in R2 with initial point P = (x1, y1) and terminal point
Q = (x2, y2), the magnitude of − − →PQ is:

− − →PQ

 =
√
(x2 − x1)2 + (y2 − y1)2. (1.2)
Finding the magnitude of a vector v = (a, b) in R2 is a special case of formula (1.2) with
P = (0, 0) and Q = (a, b) :
For a vector v = (a, b) in R2, the magnitude of v is:
∥v∥ =
√
a2 + b2. (1.3)
To calculate the magnitude of vectors in R3, we need a distance formula for points in
Euclidean space (we will postpone the proof until the next section):


## Page 15

1.1 Introduction 7
Theorem 1.1. The distance d between points P = (x1, y1, z1) and Q = (x2, y2, z2) in R3 is:
d =
√
(x2 − x1)2 + (y2 − y1)2 + (z2 − z1)2. (1.4)
The proof will use the following result:
Theorem 1.2. For a vector v = (a, b, c) in R3, the magnitude of v is:
∥v∥ =
√
a2 + b2 + c2. (1.5)
Proof: There are four cases to consider:
Case 1: a = b = c = 0. Then v = 0, so ∥v∥ = 0 =
/∇adicallow
02 + 02 + 02 =
/∇adicallow
a2 + b2 + c2.
Case 2: exactly two of a, b, c are 0. Without loss of generality , we assume that a = b = 0 and
c ̸= 0 (the other two possibilities are handled in a similar manner). Then v = (0, 0, c), which
is a vector of length | c| along the z-axis. So ∥v∥ = | c| =
/∇adicallow
c2 =
/∇adicallow
02 + 02 + c2 =
/∇adicallow
a2 + b2 + c2.
Case 3: exactly one of a, b, c is 0. Without loss of generality , we assume that a = 0, b ̸= 0
and c ̸= 0 (the other two possibilities are handled in a similar manner). Then v = (0, b, c),
which is a vector in the yz-plane, so by the Pythagorean Theorem we have ∥v∥ =
/∇adicallow
b2 + c2 =/∇adicallow
02 + b2 + c2 =
/∇adicallow
a2 + b2 + c2.
x
y
z
0a
Q(a, b, c)
S
P
Rb
cv
Figure 1.1.8
Case 4: none of a, b, c are 0. Without loss of generality , we can as-
sume that a, b, c are all positive (the other seven possibilities are
handled in a similar manner). Consider the points P = (0, 0, 0),
Q = (a, b, c), R = (a, b, 0), and S = (a, 0, 0), as shown in Figure
1.1.8. Applying the Pythagorean Theorem to the right trian-
gle △ P SR gives | P R| 2 = a2 + b2. A second application of the
Pythagorean Theorem, this time to the right triangle △ PQR ,
gives ∥v∥ = | PQ | =
√
| P R| 2 + | QR | 2 =
/∇adicallow
a2 + b2 + c2.
This proves the theorem. QED
Example 1.3. Calculate the following:
(a) The magnitude of the vector − − →PQ in R2 with P = (− 1, 2) and Q = (5, 5).
Solution: By formula (1.2),

− − →PQ

 =
√
(5 − (− 1))2 + (5 − 2)2 =
/∇adicallow
36 + 9 =
/∇adicallow
45 = 3
/∇adicallow
5.
(b) The magnitude of the vector v = (8, 3) in R2.
Solution: By formula (1.3), ∥v∥ =
/∇adicallow
82 + 32 =
/∇adicallow
73.
(c) The distance between the points P = (2, − 1, 4) and Q = (4, 2, − 3) in R2.
Solution: By formula (1.4), the distance d =
√
(4 − 2)2 + (2 − (− 1))2 + (− 3 − 4)2 =/∇adicallow
4 + 9 + 49 =
/∇adicallow
62.


## Page 16

8 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
(d) The magnitude of the vector v = (5, 8, − 2) in R3.
Solution: By formula (1.5), ∥v∥ =
√
52 + 82 + (− 2)2 =
/∇adicallow
25 + 64 + 4 =
/∇adicallow
93.
Exercises
A
1. Calculate the magnitudes of the following vectors:
(a) v = (2, − 1); (b) v = (2, − 1, 0); (c) v = (3, 2, − 2); (d) v = (0, 0, 1); (e) v = (6, 4, − 4).
2. For the points P = (1, − 1, 1), Q = (2, − 2, 2), R = (2, 0, 1), S = (3, − 1, 2), does − − →PQ = − − →RS ?
3. For the points P = (0, 0, 0), Q = (1, 3, 2), R = (1, 0, 1), S = (2, 3, 4), does − − →PQ = − − →RS ?
B
4. Let v = (1, 0, 0) and w = (a, 0, 0) be vectors in R3. Show that ∥w∥ = | a| ∥ v∥.
5. Let v = (a, b, c) and w = (3a, 3b, 3c) be vectors in R3. Show that ∥w∥ = 3 ∥v∥.
C
x
y
z
0
P(x1, y1, z1)
Q(x2, y2, z2)
R(x2, y2, z1)
S(x1, y1, 0)
T(x2, y2, 0)U(x2, y1, 0)
Figure 1.1.9
6. Though we will see a simple proof of Theorem 1.1
in the next section, it is possible to prove it using
methods similar to those in the proof of Theorem
1.2. Prove the special case of Theorem 1.1 where the
points P = (x1, y1, z1) and Q = (x2, y2, z2) satisfy the fol-
lowing conditions:
x2 > x1 > 0, y2 > y1 > 0, and z2 > z1 > 0.
(Hint: Think of Case 4 in the proof of Theorem 1.2,
and consider Figure 1.1.9. )


## Page 17

1.2 Vector Algebra 9
1.2 Vector Algebra
Now that we know what vectors are, we can start to perform some of th e usual algebraic
operations on them including addition and subtraction. Before do ing that, we will introduce
the notion of a scalar.
Deﬁnition 1.3. A scalar is a quantity that can be represented by a single number .
For our purposes, scalars will always be real numbers. 3 Examples of scalar quantities are
mass, electric charge, and speed (not velocity). 4 We can now deﬁne scalar multiplication of
a vector.
Deﬁnition 1.4. For a scalar k and a nonzero vector v, the scalar multiple of v by k,
denoted by kv, is the vector whose magnitude is | k| ∥ v∥, points in the same direction as v if
k > 0, points in the opposite direction as v if k < 0, and is the zero vector 0 if k = 0. For the
zero vector 0, we deﬁne k0 = 0 for any scalar k.
Two vectors v and w are parallel (denoted by v ∥ w) if one is a scalar multiple of the other .
Y ou can think of scalar multiplication of a vector as stretchi ng or shrinking the vector , and
as ﬂipping the vector in the opposite direction if the scalar is a ne gative number (see Figure
1.2.1).
v 2v 3v 0.5v − v − 2v
Figure 1.2.1
Recall that translating a nonzero vector means that the initial point of the vector is
changed but the magnitude and direction are preserved. We are now ready to deﬁne the
sum of two vectors.
Deﬁnition 1.5. The sum of vectors v and w, denoted by v + w, is obtained by translating
w so that its initial point is at the terminal point of v; the initial point of v + w is the initial
point of v, and its terminal point is the new terminal point of w.
3The term scalar was invented by 19 th century Irish mathematician, physicist and astronomer William Rowan
Hamilton, to convey the sense of something that could be represen ted by a point on a scale or graduated ruler .
The word vector comes from Latin, where it means “carrier”.
4An alternate deﬁnition of scalars and vectors, used in physics, i s that under certain types of coordinate trans-
formations (for example rotations), a quantity that is not af fected is a scalar , while a quantity that is affected
(in a certain way) is a vector . See M ARION for details.


## Page 18

10 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Intuitively , addingw to v means tacking on w to the end of v (see Figure 1.2.2).
v
w
(a) Vectors v and w
v
w
(b) Translate w to the end of v
v
w
v + w
(c) The sum v + w
Figure 1.2.2 Adding vectors v and w.
Notice that our deﬁnition is valid for the zero vector (which is just a point, and hence can
be translated), and so we see that v + 0 = v = 0 + v for any vector v. In particular , 0 + 0 = 0.
Also, it is easy to see that v + (− v) = 0, as we would expect. In general, since the scalar
multiple − v = − 1 v is a well-deﬁned vector , we can deﬁne vector subtraction as follows:
v − w = v + (− w). See Figure 1.2.3.
v
w
(a) Vectors v and w
v
− w
(b) Translate − w to the end of v
v
− w
v − w
(c) The difference v − w
Figure 1.2.3 Subtracting vectors v and w.
Figure 1.2.4 shows the use of “geometric proofs” of various laws of vector algebra, that is,
it uses laws from elementary geometry to prove statements abou t vectors. For example, (a)
shows that v + w = w + v for any vectors v, w. And (c) shows how you can think of v − w as
the vector that is tacked on to the end of w to add up to v.
v
v
w w w + v
v + w
(a) Add vectors
− w
w
v − w
v − wv
(b) Subtract vectors
v
w
v + w
v − w
(c) Combined add/subtract
Figure 1.2.4 “Geometric” vector algebra.
Notice that we have temporarily abandoned the practice of starti ng vectors at the origin.
In fact, we have not even mentioned coordinates in this section so far . Since we will deal
mostly with Cartesian coordinates in this book, the following t wo theorems are useful for
performing vector algebra on vectors in R2 and R3 starting at the origin.


## Page 19

1.2 Vector Algebra 11
Theorem 1.3. Let v = (v1, v2), w = (w1, w2) be vectors in R2, and let k be a scalar . Then
(a) kv = (kv1, kv2);
(b) v + w = (v1 + w1, v2 + w2).
Proof: (a) Without loss of generality , we assume that v1, v2 > 0 (the other possibilities are
handled in a similar manner). If k = 0 then kv = 0v = 0 = (0, 0) = (0v1, 0v2) = (kv1, kv2), which
is what we needed to show . If k ̸= 0, then ( kv1, kv2) lies on a line with slope kv2
kv1
= v2
v1
, which
is the same as the slope of the line on which v (and hence kv) lies, and ( kv1, kv2) points in
the same direction on that line as kv. Also, by formula (1.3) the magnitude of ( kv1, kv2) is√
(kv1)2 + (kv2)2 =
√
k2v2
1 + k2v2
2 =
√
k2(v2
1 + v2
2 ) = | k|
√
v2
1 + v2
2 = | k| ∥ v∥. So kv and ( kv1, kv2)
have the same magnitude and direction. This proves (a).
x
y
0
w2
v2
w1 v1 v1 + w1
v2 + w2
w2
w1v
v
w
w
v + w
Figure 1.2.5
(b) Without loss of generality , we assume that
v1, v2, w1, w2 > 0 (the other possibilities are han-
dled in a similar manner). From Figure 1.2.5, we
see that when translating w to start at the end of
v, the new terminal point of w is (v1 + w1, v2 + w2),
so by the deﬁnition of v + w this must be the ter-
minal point of v + w. This proves (b). QED
Theorem 1.4. Let v = (v1, v2, v3), w = (w1, w2, w3) be vectors in R3, let k be a scalar . Then
(a) kv = (kv1, kv2, kv3);
(b) v + w = (v1 + w1, v2 + w2, v3 + w3).
The following theorem summarizes the basic laws of vector alge bra.
Theorem 1.5. For any vectors u, v, w, and scalars k, l, we have
(a) v + w = w + v Commutative Law;
(b) u + (v + w) = (u + v) + w Associative Law;
(c) v + 0 = v = 0 + v Additive Identity;
(d) v + (− v) = 0 Additive Inverse;
(e) k(lv) = (kl )v Associative Law;
(f) k(v + w) = kv + kw Distributive Law;
(g) ( k + l)v = kv + lv Distributive Law .
Proof: (a) We already presented a geometric proof of this in Figure 1.2. 4(a).
(b) To illustrate the difference between analytic proofs and ge ometric proofs in vector alge-
bra, we will present both types here. For the analytic proof, we will u se vectors in R3 (the
proof for R2 is similar).


## Page 20

12 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Let u = (u1, u2, u3), v = (v1, v2, v3), w = (w1, w2, w3) be vectors in R3. Then
u + (v + w) = (u1, u2, u3) + ((v1, v2, v3) + (w1, w2, w3))
= (u1, u2, u3) + (v1 + w1, v2 + w2, v3 + w3) by Theorem 1.4(b)
= (u1 + (v1 + w1), u2 + (v2 + w2), u3 + (v3 + w3)) by Theorem 1.4(b)
= ((u1 + v1) + w1, (u2 + v2) + w2, (u3 + v3) + w3) by properties of real numbers
= (u1 + v1, u2 + v2, u3 + v3) + (w1, w2, w3) by Theorem 1.4(b)
= (u + v) + w
This completes the analytic proof of (b). Figure 1.2.6 provides t he geometric proof.
u
v
w
u + v
v + w
u + (v + w) = (u + v) + w
Figure 1.2.6 Associative Law for vector addition
(c) We already discussed this on p.10.
(d) We already discussed this on p.10.
(e) We will prove this for a vector v = (v1, v2, v3) in R3 (the proof for R2 is similar):
k(lv) = k(lv 1, lv 2, lv 3) by Theorem 1.4(a)
= (klv 1, klv 2, klv 3) by Theorem 1.4(a)
= (kl )(v1, v2, v3) by Theorem 1.4(a)
= (kl )v
(f) and (g): Left as exercises for the reader . QED
A unit vector is a vector with magnitude 1. Notice that for any nonzero vector v, the
vector v
∥v∥ is a unit vector which points in the same direction as v, since 1
∥v∥ > 0 and

 v
∥v∥

 =
∥v∥
∥v∥ = 1. Dividing a nonzero vector v by ∥v∥ is often called normalizing v.
There are speciﬁc unit vectors which we will often use, called the basis vectors:
i = (1, 0, 0), j = (0, 1, 0), and k = (0, 0, 1) in R3; i = (1, 0) and j = (0, 1) in R2.
These are useful for several reasons: they are mutually perpen dicular , since they lie on
distinct coordinate axes; they are all unit vectors: ∥i∥ = ∥ j∥ = ∥ k∥ = 1; every vector can
be written as a unique scalar combination of the basis vectors : v = (a, b) = a i + b j in R2,


## Page 21

1.2 Vector Algebra 13
v = (a, b, c) = a i + b j + c k in R3. See Figure 1.2.7.
1
2
1 2
x
y
0 i
j
(a) R2
x
y
0 ai
bj
v = (a, b)
(b) v = a i + b j
1
2
1 21
2x
y
z
0i j
k
(c) R3
x
y
z
0ai
bj
ck
v = (a, b, c)
(d) v = a i + b j + c k
Figure 1.2.7 Basis vectors in different dimensions.
When a vector v = (a, b, c) is written as v = a i + b j + c k, we say that v is in component
form, and that a, b, and c are the i, j, and k components, respectively , of v. We have:
v = v1 i + v2 j + v3 k, k a scalar = ⇒ kv = kv1 i + kv2 j + kv3 k;
v = v1 i + v2 j + v3 k, w = w1 i + w2 j + w3 k = ⇒ v + w = (v1 + w1)i + (v2 + w2)j + (v3 + w3)k;
v = v1 i + v2 j + v3 k = ⇒ ∥ v∥ =
√
v2
1 + v2
2 + v2
3 .
Example 1.4. Let v = (2, 1, − 1) and w = (3, − 4, 2) in R3.
(a) Find v − w.
Solution: v − w = (2 − 3, 1 − (− 4), − 1 − 2) = (− 1, 5, − 3).
(b) Find 3 v + 2w.
Solution: 3v + 2w = (6, 3, − 3) + (6, − 8, 4) = (12, − 5, 1).
(c) Write v and w in component form.
Solution: v = 2 i + j − k, w = 3 i − 4 j + 2 k.
(d) Find the vector u such that u + v = w.
Solution: By Theorem 1.5, u = w − v = − (v − w) = − (− 1, 5, − 3) = (1, − 5, 3), by part(a).
(e) Find the vector u such that u + v + w = 0.
Solution: By Theorem 1.5, u = − w − v = − (3, − 4, 2) − (2, 1, − 1) = (− 5, 3, − 1).
(f) Find the vector u such that 2 u + i − 2 j = k.
Solution: 2u = − i + 2 j + k = ⇒ u = − 1
2 i + j + 1
2 k.
(g) Find the unit vector v
∥v∥ .
Solution: v
∥v∥ = 1/∇adicallow
22+ 12+ (− 1)2
(2, 1, − 1) =
(
2/∇adicallow
6 , 1/∇adicallow
6 , − 1/∇adicallow
6
)
.


## Page 22

14 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
We can now easily prove Theorem 1.1 from the previous section. T he distance d between
two points P = (x1, y1, z1) and Q = (x2, y2, z2) in R3 is the same as the length of the vector w− v,
where the vectors v and w are deﬁned as v = (x1, y1, z1) and w = (x2, y2, z2) (see Figure 1.2.8).
So since w− v = (x2 − x1, y2 − y1, z2 − z1), then d = ∥ w− v∥ =
√
(x2 − x1)2 + (y2 − y1)2 + (z2 − z1)2 by
Theorem 1.2.
x
y
z
0
P(x1, y1, z1)
Q(x2, y2, z2)v
w
w − v
Figure 1.2.8 Proof of Theorem 1.2: d = ∥ w − v∥.
Exercises
A
1. Let v = (− 1, 5, − 2) and w = (3, 1, 1).
(a) Find v − w. (b) Find v + w. (c) Find v
∥v∥ . (d) Find

 1
2 (v − w)

.
(e) Find

 1
2 (v + w)

. (f) Find − 2 v + 4 w. (g) Find v − 2 w.
(h) Find the vector u such that u + v + w = i.
(i) Find the vector u such that u + v + w = 2 j + k.
(j) Is there a scalar m such that m(v + 2 w) = k? If so, ﬁnd it.
2. For the vectors v and w from Exercise 1, is ∥v − w∥ = ∥ v∥ − ∥ w∥? If not, which quantity
is larger?
3. For the vectors v and w from Exercise 1, is ∥v + w∥ = ∥ v∥ + ∥ w∥? If not, which quantity
is larger?
B
4. Prove Theorem 1.5(f) for R3. 5. Prove Theorem 1.5(g) for R3.
C
6. We know that every vector in R3 can be written as a scalar combination of the vectors i,
j, and k. Can every vector in R3 be written as a scalar combination of just i and j; that is
for any vector v in R3, are there scalars m, n such that v = m i + n j? Justify your answer .


## Page 23

1.3 Dot Product 15
1.3 Dot Product
Y ou may have noticed that while we did deﬁne multiplication of a vec tor by a scalar in the
previous section on vector algebra, we did not deﬁne multiplicati on of a vector by a vector .
We will now see one type of multiplication of vectors, called the dot product.
Deﬁnition 1.6. Let v = (v1, v2, v3) and w = (w1, w2, w3) be vectors in R3.
The dot product of v and w, denoted by v ···w, is given by:
v ···w = v1w1 + v2w2 + v3w3. (1.6)
Similarly , for vectors v = (v1, v2) and w = (w1, w2) in R2, the dot product is:
v ···w = v1w1 + v2w2. (1.7)
Notice that the dot product of two vectors is a scalar , not a vector . So the associative law
that holds for multiplication of numbers and for addition of vect ors (see Theorem 1.5(b),(e)),
does not hold for the dot product of vectors. Why? Because for vectors u, v, w, the dot
product u ···v is a scalar , and so ( u ···v) ···w is not deﬁned since the left side of that dot product
(the part in parentheses) is a scalar and not a vector .
For vectors v = v1 i + v2 j + v3 k and w = w1 i + w2 j + w3 k in component form, the dot product
is still v ···w = v1w1 + v2w2 + v3w3.
Also notice that we deﬁned the dot product in an analytic way , that i s, by referencing
vector coordinates. There is a geometric way of deﬁning the dot pr oduct, which we will now
develop as a consequence of the analytic deﬁnition.
Deﬁnition 1.7. The angle between two nonzero vectors with the same initial point is the
smallest angle between them.
We do not deﬁne the angle between the zero vector and any other vec tor . Any two nonzero
vectors with the same initial point have two angles between them: θ and 360 ◦ − θ. We will
always choose the smallest nonnegative angle θ between them, so that 0 ◦ ≤ θ ≤ 180◦. See
Figure 1.3.1.
θ
360◦ − θ
(a) 0◦ < θ < 180◦
θ
360◦ − θ
(b) θ = 180◦
θ
360◦ − θ
(c) θ = 0◦
Figure 1.3.1 Angle between vectors.
We can now take a more geometric view of the dot product by establi shing a relationship
between the dot product of two vectors and the angle between them.


## Page 24

16 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Theorem 1.6. Let v, w be nonzero vectors, and let θ be the angle between them. Then
cos θ = v ···w
∥v∥ ∥w∥ (1.8)
We will prove the theorem, assuming that the notion of angle as we ll as the Law of Cosines
are known. In a more rigorous approach, one could deﬁne the angles between the vectors
using the statement of the theorem above.
Proof: We will prove the theorem for vectors in R3 (the proof for R2 is similar). Let v =
(v1, v2, v3) and w = (w1, w2, w3). By the Law of Cosines (see Figure 1.3.2), we have
∥v − w∥2 = ∥ v∥2 + ∥ w∥2 − 2 ∥v∥ ∥w∥ cos θ. (1.9)
(note that equation (1.9) holds even for the “degenerate” case s θ = 0◦ and 180 ◦).
θ
x
y
z
0
v
w
v − w
Figure 1.3.2
Since v − w = (v1 − w1, v2 − w2, v3 − w3), expanding ∥v − w∥2 in equation (1.9) gives
∥v∥2 + ∥ w∥2 − 2 ∥v∥ ∥w∥ cos θ = (v1 − w1)2 + (v2 − w2)2 + (v3 − w3)2
= (v2
1 − 2v1w1 + w2
1 ) + (v2
2 − 2v2w2 + w2
2 ) + (v2
3 − 2v3w3 + w2
3 )
= (v2
1 + v2
2 + v2
3 ) + (w2
1 + w2
2 + w2
3 ) − 2(v1w1 + v2w2 + v3w3)
= ∥ v∥2 + ∥ w∥2 − 2(v ···w) , so
− 2 ∥v∥ ∥w∥ cos θ = − 2(v ···w) , so since v ̸= 0 and w ̸= 0,
cos θ = v ···w
∥v∥ ∥w∥ . QED
Example 1.5. Find the angle θ between the vectors v = (2, 1, − 1) and w = (3, − 4, 1).
Solution: Since v ···w = (2)(3) + (1)(− 4) + (− 1)(1) = 1, ∥v∥ =
/∇adicallow
6, and ∥w∥ =
/∇adicallow
26, then
cos θ = v ···w
∥v∥ ∥w∥ = 1/∇adicallow
6
/∇adicallow
26
= 1
2
/∇adicallow
39
≈ 0.08 = ⇒ θ ≈ 85.41◦.
Two nonzero vectors are perpendicular if the angle between them is 90 ◦. Since cos 90 ◦ =
0, we have the following important corollary to Theorem 1.6:


## Page 25

1.3 Dot Product 17
Corollary 1.7. Two nonzero vectors v and w are perpendicular if and only if v ···w = 0.
We will write v ⊥ w to indicate that v and w are perpendicular .
Since 0 ···w = 0, it is convenient to assume that zero vector 0 is perpendicular to any other
vector . So we can write 0 ⊥ w despite that the angle between 0 and w is undeﬁned.
Since cos θ > 0 for 0 ◦ ≤ θ < 90◦ and cos θ < 0 for 90 ◦ < θ ≤ 180◦, we also have:
Corollary 1.8. If θ is the angle between nonzero vectors v and w, then
v ···w is







> 0 for 0 ◦ ≤ θ < 90◦,
0 for θ = 90◦,
< 0 for 90 ◦ < θ ≤ 180◦.
By Corollary 1.8, the dot product can be thought of as a way of tell ing if the angle be-
tween two vectors is acute, obtuse, or a right angle, depending on wh ether the dot product
is positive, negative, or zero, respectively . See Figure 1.3. 3.
0◦ ≤ θ < 90◦
v
w
(a) v ···w > 0
90◦ < θ ≤ 180◦
v
w
(b) v ···w < 0
θ = 90◦
v
w
(c) v ···w = 0
Figure 1.3.3 Sign of the dot product & angle between vectors.
Example 1.6. Are the vectors v = (− 1, 5, − 2) and w = (3, 1, 1) perpendicular?
Solution: Y es,v ⊥ w since v ···w = (− 1)(3) + (5)(1) + (− 2)(1) = 0.
The following theorem summarizes the basic properties of the dot product.
Theorem 1.9. For any vectors u, v, w, and scalar k, we have
(a) v ···w = w ···v Commutative Law;
(b) ( kv) ···w = v ···(kw) = k(v ···w) Associative Law;
(c) v ···0 = 0 = 0 ···v;
(d) u ···(v + w) = u ···v + u ···w Distributive Law;
(e) (u + v) ···w = u ···w + v ···w Distributive Law;
(f) | v ···w| ≤ ∥ v∥ ∥w∥ Cauchy–Schwarz Inequality .5
5Also known as the Cauchy–Schwarz–Buniakovski Inequality .


## Page 26

18 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Proof: The proofs of parts (a)–(e) are straightforward applications of the deﬁnition of the
dot product, and are left to the reader as exercises. We will prove par t (f).
(f) If either v = 0 or w = 0, then v···w = 0 by part (c), and so the inequality holds trivially . So
assume that v and w are nonzero vectors. Then by Theorem 1.6,
v ···w = cos θ∥v∥ ∥w∥ , so
| v ···w| = | cos θ| ∥ v∥ ∥w∥ , so
| v ···w| ≤ ∥ v∥ ∥w∥ since | cos θ| ≤ 1. QED
Using Theorem 1.9, we see that if u ···v = 0 and u ···w = 0, then
u ···(kv + lw) = k(u ···v) + l(u ···w) = k(0) + l(0) = 0
for all scalars k, l. Thus, we have the following fact:
If u ⊥ v and u ⊥ w, then u ⊥ (kv + lw) for all scalars k, l.
For vectors v and w, the collection of all scalar combinations kv + lw is called the span
of v and w. If nonzero vectors v and w are parallel, then their span is a line; if they are
not parallel, then their span is a plane. So what we showed above is th at a vector which is
perpendicular to two other vectors is also perpendicular to their spa n.
The dot product can be used to derive properties of the magnitudes of v ectors, the most
important of which is the Triangle Inequality, as given in the following theorem:
Theorem 1.10. For any vectors v, w, we have
(a) ∥v∥2 = v ···v;
(b) ∥v + w∥ ≤ ∥ v∥ + ∥ w∥ Triangle Inequality;
(c) ∥v − w∥ ≥ ∥ v∥ − ∥ w∥.
Proof: (a) Left as an exercise for the reader .
(b) By part (a) and Theorem 1.9, we have
∥v + w∥2 = (v + w) ···(v + w) = v ···v + v ···w + w ···v + w ···w
= ∥ v∥2 + 2(v ···w) + ∥ w∥2 , so since a ≤ | a| for any real number a, we have
≤ ∥ v∥2 + 2 | v ···w| + ∥ w∥2 , so by Theorem 1.9(f) we have
≤ ∥ v∥2 + 2 ∥v∥ ∥w∥ + ∥ w∥2 = (∥v∥ + ∥ w∥)2 and so
∥v + w∥ ≤ ∥ v∥ + ∥ w∥ after taking square roots of both sides, which proves (b).
(c) Since v = w+ (v− w), then ∥v∥ = ∥ w+ (v− w)∥ ≤ ∥ w∥+∥ v− w∥ by the Triangle Inequality ,
so subtracting ∥w∥ from both sides gives ∥v∥ − ∥ w∥ ≤ ∥ v − w∥. QED


## Page 27

1.3 Dot Product 19
v
w
v + w
Figure 1.3.4
The Triangle Inequality gets its name from the fact that in an y triangle,
no one side is longer than the sum of the lengths of the other two s ides (see
Figure 1.3.4). Another way of saying this is with the familiar statement “the
shortest distance between two points is a straight line.”
Exercises
A
1. Let v = (5, 1, − 2) and w = (4, − 4, 3). Calculate v ···w.
2. Let v = − 3 i − 2 j − k and w = 6 i + 4 j + 2 k. Calculate v ···w.
For Exercises 3–8, ﬁnd the angle θ between the vectors v and w.
3. v = (5, 1, − 2), w = (4, − 4, 3); 4. v = (7, 2, − 10), w = (2, 6, 4);
5. v = (2, 1, 4), w = (1, − 2, 0); 6. v = (4, 2, − 1), w = (8, 4, − 2);
7. v = − i + 2 j + k, w = − 3 i + 6 j + 3 k; 8. v = i, w = 3 i + 2 j + 4k.
9. Let v = (8, 4, 3) and w = (− 2, 1, 4). Is v ⊥ w? Justify your answer .
10. Let v = (6, 0, 4) and w = (0, 2, − 1). Is v ⊥ w? Justify your answer .
11. For v, w from Exercise 5, verify the Cauchy–Schwarz Inequality | v ···w| ≤ ∥ v∥ ∥w∥.
12. For v, w from Exercise 6, verify the Cauchy–Schwarz Inequality | v ···w| ≤ ∥ v∥ ∥w∥.
13. For v, w from Exercise 5, verify the Triangle Inequality ∥v + w∥ ≤ ∥ v∥ + ∥ w∥.
14. For v, w from Exercise 6, verify the Triangle Inequality ∥v + w∥ ≤ ∥ v∥ + ∥ w∥.
B
15. Prove Theorem 1.9(a). 16. Prove Theorem 1.9(b).
17. Prove Theorem 1.9(c). 18. Prove Theorem 1.9(d).
19. Prove Theorem 1.9(e). 20. Prove Theorem 1.10(a).
21. Prove or give a counterexample: If u ···v = u ···w, then v = w.
C
22. Prove or give a counterexample: If v ···w = 0 for all v, then w = 0.
23. Prove or give a counterexample: If u ···v = u ···w for all u, then v = w.
24. Prove that | ∥v∥ − ∥ w∥| ≤ ∥ v − w∥ for all v, w.


## Page 28

20 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
L
w
v
u
Figure 1.3.5
25. For nonzero vectors v and w, the projection of v onto w (some-
times written as pro j wv) is the vector u along the same line L as
w whose terminal point is obtained by dropping a perpendicular
line from the terminal point of v to L (see Figure 1.3.5). Show
that
∥u∥ = | v ···w|
∥w∥ .
(Hint: Consider the angle between v and w.)
26. Assume ∥v∥ = ∥ w∥. Show that ( v + w) ⊥ (v − w).
27. Let α, β, and γ be the angles between a nonzero vector v in R3 and the vectors i, j, and k,
respectively . Show that cos 2 α + cos2 β + cos2 γ = 1. (The angles α, β, γ are often called the
direction angles of v, and cos α, cos β, cos γ are called the direction cosines.)


## Page 29

1.4 Cross Product 21
1.4 Cross Product
In Section 1.3 we deﬁned the dot product, which gave a way of multiplyi ng two vectors. The
resulting product, however , was a scalar , not a vector . In this section we will deﬁne a product
of two vectors that does result in another vector . This product, c alled the cross product , is
only deﬁned for vectors in R3. The deﬁnition may appear strange and lacking motivation,
but we will see the geometric basis for it shortly .
Deﬁnition 1.8. Let v = (v1, v2, v3) and w = (w1, w2, w3) be vectors in R3. The cross product
of v and w, denoted by v ××× w, is the vector in R3 given by:
v ××× w = (v2w3 − v3w2, v3w1 − v1w3, v1w2 − v2w1). (1.10)
1
11
x
y
z
0i j
k = i××× j
Figure 1.4.1
Example 1.7. Find i ××× j.
Solution: Since i = (1, 0, 0) and j = (0, 1, 0), then
i ××× j = ((0)(0) − (0)(1), (0)(0) − (1)(0), (1)(1) − (0)(0))
= (0, 0, 1)
= k.
Similarly it can be shown that j ××× k = i and k ××× i = j.
In the above example, the cross product of the given vectors was pe rpendicular to both
those vectors. It turns out that this will always be the case.
Theorem 1.11. If the cross product v ××× w of two nonzero vectors v and w is also a nonzero
vector , then it is perpendicular to both v and w.
Proof: We will show that ( v ××× w) ···v = 0:
(v ××× w) ···v = (v2w3 − v3w2, v3w1 − v1w3, v1w2 − v2w1) ···(v1, v2, v3)
= v2w3v1 − v3w2v1 + v3w1v2 − v1w3v2 + v1w2v3 − v2w1v3
= v1v2w3 − v1v2w3 + w1v2v3 − w1v2v3 + v1w2v3 − v1w2v3
= 0 , after rearranging the terms.
∴ v ××× w ⊥ v by Corollary 1.7.
The proof that v ××× w ⊥ w is similar . QED
As a consequence of the above theorem and Theorem 1.9, we have t he following:
Corollary 1.12. If the cross product v ××× w of two nonzero vectors v and w is also a nonzero
vector , then it is perpendicular to the span of v and w.


## Page 30

22 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
The span of any two nonzero, nonparallel vectors v, w in R3 is a plane P, so the above
corollary shows that v ××× w is perpendicular to that plane. As shown in Figure 1.4.2, there
are two possible directions for v ××× w, one the opposite of the other . The choice of direction
of v ××× w can be visualized using the right-hand rule , that is, the vectors v, w, v ××× w form
a right-handed system. Recall from Section 1.1 that this mean s that you can point your
thumb upwards in the direction of v××× w while rotating v towards w with the remaining four
ﬁngers.
x
y
z
0
θ
v
w
v××× w
− v××× w
P
Figure 1.4.2 Direction of v ××× w.
We will now derive a formula for the magnitude of v ××× w, for nonzero vectors v, w:
∥v ××× w∥2 = (v2w3 − v3w2)2 + (v3w1 − v1w3)2 + (v1w2 − v2w1)2
= v2
2 w2
3 − 2v2w2v3w3 + v2
3 w2
2 + v2
3 w2
1 − 2v1w1v3w3 + v2
1 w2
3 + v2
1 w2
2 − 2v1w1v2w2 + v2
2 w2
1
= v2
1 (w2
2 + w2
3 ) + v2
2 (w2
1 + w2
3 ) + v2
3 (w2
1 + w2
2 ) − 2(v1w1v2w2 + v1w1v3w3 + v2w2v3w3)
and now adding and subtracting v2
1 w2
1 , v2
2 w2
2 , and v2
3 w2
3 on the right side gives
= v2
1 (w2
1 + w2
2 + w2
3 ) + v2
2 (w2
1 + w2
2 + w2
3 ) + v2
3 (w2
1 + w2
2 + w2
3 )
− (v2
1 w2
1 + v2
2 w2
2 + v2
3 w2
3 + 2(v1w1v2w2 + v1w1v3w3 + v2w2v3w3))
= (v2
1 + v2
2 + v2
3 )(w2
1 + w2
2 + w2
3 )
− ((v1w1)2 + (v2w2)2 + (v3w3)2 + 2(v1w1)(v2w2) + 2(v1w1)(v3w3) + 2(v2w2)(v3w3))
so using ( a + b + c)2 = a2 + b2 + c2 + 2ab + 2ac + 2bc for the subtracted term gives
= (v2
1 + v2
2 + v2
3 )(w2
1 + w2
2 + w2
3 ) − (v1w1 + v2w2 + v3w3)2
= ∥ v∥2 ∥w∥2 − (v ···w)2
= ∥ v∥2 ∥w∥2
(
1 − (v ···w)2
∥v∥2 ∥w∥2
)
, since ∥v∥ > 0 and ∥w∥ > 0, so by Theorem 1.6
= ∥ v∥2 ∥w∥2(1 − cos2 θ) , where θ is the angle between v and w, so
∥v ××× w∥2 = ∥ v∥2 ∥w∥2 sin2 θ , and since 0 ◦ ≤ θ ≤ 180◦, then sin θ ≥ 0, so we have:


## Page 31

1.4 Cross Product 23
If θ is the angle between nonzero vectors v and w in R3, then
∥v ××× w∥ = ∥ v∥ ∥w∥ sin θ. (1.11)
It may seem strange to bother with the above formula, when the ma gnitude of the cross
product can be calculated directly , like for any other vector . T he formula is more useful for
its applications in geometry , as in the following example.
Example 1.8. Let △ PQR and PQRS be a triangle and parallelogram, respectively , as shown
in Figure 1.4.3.
b
h h
θ θ
P P
Q Q R R
S S
v
w
Figure 1.4.3
Think of the triangle as existing in R3, and identify the sides QR and QP with vectors v
and w, respectively , inR3. Let θ be the angle between v and w. The area APQR of △ PQR is
1
2 bh, where b is the base of the triangle and h is the height. So we see that
b = ∥ v∥ and h = ∥ w∥ sin θ,
APQR = 1
2 ∥v∥ ∥w∥ sin θ
= 1
2 ∥v ××× w∥.
So since the area APQRS of the parallelogram PQRS is twice the area of the triangle △ PQR ,
then
APQRS = ∥ v∥ ∥w∥ sin θ.
By the discussion in Example 1.8, we have proved the following theo rem:
Theorem 1.13. Area of triangles and parallelograms
(a) The area A of a triangle with adjacent sides v, w (as vectors in R3) is:
A = 1
2 ∥v ××× w∥;
(b) The area A of a parallelogram with adjacent sides v, w (as vectors in R3) is:
A = ∥ v ××× w∥.


## Page 32

24 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
It may seem at ﬁrst glance that since the formulas derived in Ex ample 1.8 were for the
adjacent sides QP and QR only , then the more general statements in Theorem 1.13 that t he
formulas hold for any adjacent sides are not justiﬁed. We would get a different formula for
the area if we had picked PQ and P R as the adjacent sides, but it can be shown (see Exercise
26) that the different formulas would yield the same value, so t he choice of adjacent sides
indeed does not matter , and Theorem 1.13 is valid.
Theorem 1.13 makes it simpler to calculate the area of a triang le in 3-dimensional space
than by using traditional geometric methods.
Example 1.9. Calculate the area of the triangle △ PQR , where P = (2, 4, − 7), Q = (3, 7, 18),
and R = (− 5, 12, 8).
y
z
x
0
v
w
R(− 5, 12, 8)
Q(3, 7, 18)
P(2, 4,− 7)
Figure 1.4.4
Solution: Let v = − − →PQ and w = − − →P R, as in Figure 1.4.4. Then
v = (3, 7, 18) − (2, 4, − 7) = (1, 3, 25)
and
w = (− 5, 12, 8) − (2, 4, − 7) = (− 7, 8, 15),
so the area A of the triangle △ PQR is
A = 1
2 ∥v ××× w∥ = 1
2 ∥(1, 3, 25) ××× (− 7, 8, 15)∥
= 1
2

((3)(15) − (25)(8), (25)(− 7) − (1)(15), (1)(8) − (3)(− 7))


= 1
2

(− 155, − 190, 29)


= 1
2
√
(− 155)2 + (− 190)2 + 292 = 1
2
/∇adicallow
60966.
A ≈ 123.46.
Example 1.10. Calculate the area of the parallelogram PQRS , where P = (1, 1), Q = (2, 3),
R = (5, 4), and S = (4, 2).


## Page 33

1.4 Cross Product 25
x
y
0
1
2
3
4
1 2 3 4 5
P
Q
R
S
v
w
Figure 1.4.5
Solution: Let v = − − →SP and w = − − →SR , as in Figure 1.4.5. Then
v = (1, 1) − (4, 2) = (− 3, − 1) and w = (5, 4) − (4, 2) = (1, 2).
But these are vectors in R2, and the cross product is only de-
ﬁned for vectors in R3. However , R2 can be thought of as the
subset of R3 such that the z-coordinate is always 0. So we can
write v = (− 3, − 1, 0) and w = (1, 2, 0). Then the area A of the
parallelogram PQRS is
A = ∥ v ××× w∥ =

(− 3, − 1, 0) ××× (1, 2, 0)


=

((− 1)(0) − (0)(2), (0)(1) − (− 3)(0), (− 3)(2) − (− 1)(1))


=

(0, 0, − 5)

.
A = 5.
The following theorem summarizes the basic properties of the cr oss product.
Theorem 1.14. For any vectors u, v, w in R3, and scalar k, we have
(a) v ××× w = − w ××× v Anticommutative Law
(b) u ××× (v + w) = u ××× v + u ××× w Distributive Law
(c) (u + v) ××× w = u ××× w + v ××× w Distributive Law
(d) ( kv) ××× w = v ××× (kw) = k(v ××× w) Associative Law
(e) v ××× 0 = 0 = 0 ××× v
(f) v ××× v = 0
(g) v ××× w = 0 if and only if v ∥ w
Proof: The proofs of properties (b)–(f) are straightforward. We will prov e parts (a) and (g)
and leave the rest to the reader as exercises.
x
y
z
0
v
w
v××× w
w××× v
Figure 1.4.6
(a) By the deﬁnition of the cross product and scalar multiplica-
tion, we have:
v ××× w = (v2w3 − v3w2, v3w1 − v1w3, v1w2 − v2w1)
= − (v3w2 − v2w3, v1w3 − v3w1, v2w1 − v1w2)
= − (w2v3 − w3v2, w3v1 − w1v3, w1v2 − w2v1)
= − w ××× v


## Page 34

26 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Note that this says that v ××× w and w ××× v have the same mag-
nitude but opposite direction (see Figure 1.4.6).
(g) If either v or w is 0 then v ××× w = 0 by part (e), and either v = 0 = 0w or w = 0 = 0v, so v
and w are scalar multiples, in which case they are parallel.
If both v and w are nonzero, and θ is the angle between them, then by formula (1.11),
v ××× w = 0 if and only if ∥v∥ ∥w∥ sin θ = 0, which is true if and only if sin θ = 0 (since ∥v∥ > 0
and ∥w∥ > 0). So since 0 ◦ ≤ θ ≤ 180◦, then sin θ = 0 if and only if θ = 0◦ or 180 ◦. But the
angle between v and w is 0 ◦ or 180 ◦ if and only if v ∥ w. QED
Example 1.11. Adding to Example 1.7, we have
i ××× j = k j ××× k = i, k ××× i = j
j ××× i = − k, k ××× j = − i, i ××× k = − j,
i ××× i = j ××× j = k ××× k = 0.
Recall that a parallelepiped is a 3-dimensional solid with 6 faces, all of which are parallel-
ograms.6
Example 1.12. Volume of a parallelepiped: Let the vectors u, v, w in R3 represent adjacent
sides of a parallelepiped P, with u, v, w forming a right-handed system, as in Figure 1.4.7.
Show that the volume of P is the scalar triple product u ···(v ××× w).
h
θ
u
w
v
v××× w
Figure 1.4.7 Parallelepiped P
Solution: Recall that the volume vol( P) of a par-
allelepiped P is the area A of the base parallel-
ogram times the height h. By Theorem 1.13(b),
the area A of the base parallelogram is ∥v ××× w∥.
And we can see that since v××× w is perpendicular
to the base parallelogram determined by v and
w, then the height h is ∥u∥ cos θ, where θ is the
angle between u and v ××× w. By Theorem 1.6 we
know that
cos θ = u ···(v ××× w)
∥u∥ ∥v ××× w∥ .
6An equivalent deﬁnition of a parallelepiped is: the collectio n of all scalar combinations k1v1 + k2v2 + k3v3 of
some vectors v1, v2, v3 in R3, where 0 ≤ k1, k2, k3 ≤ 1.


## Page 35

1.4 Cross Product 27
Hence,
vol(P) = A h
= ∥ v ××× w∥ ∥u∥ u ···(v ××× w)
∥u∥ ∥v ××× w∥
= u ···(v ××× w).
In Example 1.12 the height h of the parallelepiped is ∥u∥ cos θ, and not −∥ u∥ cos θ, because
the vector u is on the same side of the base parallelogram’s plane as the vecto r v××× w (so that
cos θ > 0). Since the volume is the same no matter which base and height we use, then
repeating the same steps using the base determined by u and v (since w is on the same
side of that base’s plane as u ××× v), the volume is w ···(u ××× v). Repeating this with the base
determined by w and u, we have the following result:
For any vectors u, v, w in R3,
u ···(v ××× w) = w ···(u ××× v) = v ···(w ××× u). (1.12)
(Note that the equalities hold trivially if any of the vector s are 0.)
Since v××× w = − w××× v for any vectors v, w in R3, then picking the wrong order for the three
adjacent sides in the scalar triple product in formula (1.12) will g ive you the negative of the
volume of the parallelepiped. So taking the absolute value of the scalar triple product for
any order of the three adjacent sides will always give the volume:
Theorem 1.15. If vectors u, v, w in R3 represent any three adjacent sides of a paral-
lelepiped, then the volume of the parallelepiped is | u ···(v ××× w)| .
Another type of triple product is the vector triple product u ××× (v ××× w). The proof of the
following theorem is left as an exercise for the reader:
Theorem 1.16. For any vectors u, v, w in R3,
u ××× (v ××× w) = (u ···w)v − (u ···v)w. (1.13)
An examination of the formula in Theorem 1.16 gives some idea o f the geometry of the
vector triple product. By the right side of formula (1.13), we see t hat u ××× (v ××× w) is a scalar
combination of v and w, and hence lies in the plane containing v and w (that is, the vectors
u ××× (v ××× w), v and w are coplanar). This makes sense since, by Theorem 1.11, u ××× (v ××× w) is
perpendicular to both u and v ××× w. In particular , being perpendicular to v ××× w means that
u ××× (v ××× w) lies in the plane containing v and w, since that plane is itself perpendicular to
v ××× w. But then how is u ××× (v ××× w) also perpendicular to u, which could be any vector? The
following example may help to see how this works.


## Page 36

28 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Example 1.13. Find u ××× (v ××× w) for u = (1, 2, 4), v = (2, 2, 0), w = (1, 3, 0).
Solution: Since u ···v = 6 and u ···w = 7, then
u ××× (v ××× w) = (u ···w)v − (u ···v)w
= 7 (2, 2, 0) − 6 (1, 3, 0) = (14, 14, 0) − (6, 18, 0)
= (8, − 4, 0).
Note that v and w lie in the x y-plane, and that u ××× (v ××× w) also lies in that plane. Also,
u ××× (v ××× w) is perpendicular to both u and v ××× w = (0, 0, 4) (see Figure 1.4.8).
y
z
x
0
u
v w
v ××× w
u ××× (v ××× w)
Figure 1.4.8
For vectors v = v1 i+ v2 j+ v3 k and w = w1 i+ w2 j+ w3 k in component form, the cross product
is written as: v××× w = (v2w3 − v3w2)i+ (v3w1 − v1w3)j+ (v1w2 − v2w1)k. It is often easier to use the
component form for the cross product, because it can be represent ed as a determinant. We
will not go too deeply into the theory of determinants 7; we will just cover what is essential
for our purposes.
A 2 ××× 2 matrix is an array of two rows and two columns of scalars, written as
[a b
c d
]
or
(a b
c d
)
where a, b, c, d are scalars. The determinant of such a matrix, written as
⏐
⏐
⏐
⏐
a b
c d
⏐
⏐
⏐
⏐ or det
[a b
c d
]
,
is the scalar deﬁned by the following formula:
⏐
⏐
⏐
⏐
a b
c d
⏐
⏐
⏐
⏐ = ad − bc.
It may help to remember this formula as being the product of the s calars on the downward
diagonal minus the product of the scalars on the upward diagonal.
7See A NTON and R ORRES for a fuller development.


## Page 37

1.4 Cross Product 29
Example 1.14. ⏐
⏐
⏐
⏐
1 2
3 4
⏐
⏐
⏐
⏐ = (1)(4) − (2)(3) = 4 − 6 = − 2.
A 3 ××× 3 matrix is an array of three rows and three columns of scalars, written a s


a1 a2 a3
b1 b2 b3
c1 c2 c3

 or


a1 a2 a3
b1 b2 b3
c1 c2 c3

 ,
and its determinant is given by the formula:
⏐
⏐
⏐
⏐
⏐
⏐
a1 a2 a3
b1 b2 b3
c1 c2 c3
⏐
⏐
⏐
⏐
⏐
⏐
= a1
⏐
⏐
⏐
⏐
b2 b3
c2 c3
⏐
⏐
⏐
⏐ − a2
⏐
⏐
⏐
⏐
b1 b3
c1 c3
⏐
⏐
⏐
⏐ + a3
⏐
⏐
⏐
⏐
b1 b2
c1 c2
⏐
⏐
⏐
⏐ . (1.14)
One way to remember the above formula is the following: multiply each scalar in the ﬁrst
row by the determinant of the 2 × 2 matrix that remains after removing the row and column
that contain that scalar , then sum those products up, putting al ternating plus and minus
signs in front of each (starting with a plus).
Example 1.15.
⏐
⏐
⏐
⏐
⏐
⏐
1 0 2
4 − 1 3
1 0 2
⏐
⏐
⏐
⏐
⏐
⏐
= 1
⏐
⏐
⏐
⏐
− 1 3
0 2
⏐
⏐
⏐
⏐ − 0
⏐
⏐
⏐
⏐
4 3
1 2
⏐
⏐
⏐
⏐ + 2
⏐
⏐
⏐
⏐
4 − 1
1 0
⏐
⏐
⏐
⏐ = 1(− 2 − 0) − 0(8 − 3) + 2(0 + 1) = 0.
We deﬁned the determinant as a scalar , derived from algebraic operations on scalar entries
in a matrix. However , if we put three vectors in the ﬁrst row of a 3 × 3 matrix, then the
deﬁnition still makes sense, since we would be performing scalar multiplication on those
three vectors (they would be multiplied by the 2 × 2 scalar determinants as before). This gives
us a determinant that is now a vector , and lets us write the cross product of v = v1 i+ v2 j+ v3 k
and w = w1 i + w2 j + w3 k as a determinant:
v ××× w =
⏐
⏐
⏐
⏐
⏐
⏐
i j k
v1 v2 v3
w1 w2 w3
⏐
⏐
⏐
⏐
⏐
⏐
=
⏐
⏐
⏐
⏐
v2 v3
w2 w3
⏐
⏐
⏐
⏐ i −
⏐
⏐
⏐
⏐
v1 v3
w1 w3
⏐
⏐
⏐
⏐ j +
⏐
⏐
⏐
⏐
v1 v2
w1 w2
⏐
⏐
⏐
⏐ k
= (v2w3 − v3w2)i + (v3w1 − v1w3)j + (v1w2 − v2w1)k .
Example 1.16. Let v = 4 i − j + 3 k and w = i + 2 k. Then
v ××× w =
⏐
⏐
⏐
⏐
⏐
⏐
i j k
4 − 1 3
1 0 2
⏐
⏐
⏐
⏐
⏐
⏐
=
⏐
⏐
⏐
⏐
− 1 3
0 2
⏐
⏐
⏐
⏐ i −
⏐
⏐
⏐
⏐
4 3
1 2
⏐
⏐
⏐
⏐ j +
⏐
⏐
⏐
⏐
4 − 1
1 0
⏐
⏐
⏐
⏐ k = − 2 i − 5 j + k .


## Page 38

30 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
The scalar triple product can also be written as a determinant. In f act, by Example 1.12,
the following theorem provides an alternate deﬁnition of the dete rminant of a 3 × 3 matrix
as the volume of a parallelepiped whose adjacent sides are the rows of the matrix and form
a right-handed system (a left-handed system would give the nega tive volume).
Theorem 1.17. For any vectors u = (u1, u2, u3), v = (v1, v2, v3), w = (w1, w2, w3) in R3:
u ···(v ××× w) =
⏐
⏐
⏐
⏐
⏐
⏐
u1 u2 u3
v1 v2 v3
w1 w2 w3
⏐
⏐
⏐
⏐
⏐
⏐
. (1.15)
Example 1.17. Find the volume of the parallelepiped with adjacent sides u = (2, 1, 3), v =
(− 1, 3, 2), w = (1, 1, − 2) (see Figure 1.4.9).
y
z
x
0
u
v
w
Figure 1.4.9 P
Solution: By Theorem 1.15, the volume vol( P) of the parallelepiped
P is the absolute value of the scalar triple product of the three
adjacent sides (in any order). By Theorem 1.17,
u ···(v ××× w) =
⏐
⏐
⏐
⏐
⏐
⏐
2 1 3
− 1 3 2
1 1 − 2
⏐
⏐
⏐
⏐
⏐
⏐
= 2
⏐
⏐
⏐
⏐
3 2
1 − 2
⏐
⏐
⏐
⏐ − 1
⏐
⏐
⏐
⏐
− 1 2
1 − 2
⏐
⏐
⏐
⏐ + 3
⏐
⏐
⏐
⏐
− 1 3
1 1
⏐
⏐
⏐
⏐
= 2(− 8) − 1(0) + 3(− 4) = − 28, so
vol(P) = |− 28| = 28.
Interchanging the dot and cross products can be useful in proving vector identities:
Example 1.18. Prove: ( u ××× v) ···(w ××× z) =
⏐
⏐
⏐
⏐
u ···w u ···z
v ···w v ···z
⏐
⏐
⏐
⏐ for all vectors u, v, w, z in R3.
Solution: Let x = u ××× v. Then
(u ××× v) ···(w ××× z) = x ···(w ××× z)
= w ···(z ××× x) (by formula (1.12))
= w ···(z ××× (u ××× v))
= w ···((z ···v)u − (z ···u)v) (by Theorem 1.16)
= (z ···v)(w ···u) − (z ···u)(w ···v)
= (u ···w)(v ···z) − (u ···z)(v ···w) (by commutativity of the dot product).
=
⏐
⏐
⏐
⏐
u ···w u ···z
v ···w v ···z
⏐
⏐
⏐
⏐ .


## Page 39

1.4 Cross Product 31
Exercises
A
For Exercises 1–6, calculate v ××× w.
1. v = (5, 1, − 2), w = (4, − 4, 3); 2. v = (7, 2, − 10), w = (2, 6, 4);
3. v = (2, 1, 4), w = (1, − 2, 0); 4. v = (1, 3, 2), w = (7, 2, − 10);
5. v = − i + 2 j + k, w = − 3 i + 6 j + 3 k; 6. v = i, w = 3 i + 2 j + 4k.
For Exercises 7–8, calculate the area of the triangle △ PQR .
7. P = (5, 1, − 2), Q = (4, − 4, 3), R = (2, 4, 0); 8. P = (4, 0, 2), Q = (2, 1, 5), R = (− 1, 0, − 1).
For Exercises 9–10, calculate the area of the parallelogram PQRS .
9. P = (2, 1, 3), Q = (1, 4, 5), R = (2, 5, 3), S = (3, 2, 1);
10. P = (− 2, − 2), Q = (1, 4), R = (6, 6), S = (3, 0).
For Exercises 11–12, ﬁnd the volume of the parallelepiped with adj acent sides u, v, w.
11. u = (1, 1, 3), v = (2, 1, 4), w = (5, 1, − 2); 12. u = (1, 3, 2), v = (7, 2, − 10), w = (1, 0, 1).
For Exercises 13–14, calculate u ···(v ××× w) and u ××× (v ××× w).
13. u = (1, 1, 1), v = (3, 0, 2), w = (2, 2, 2); 14. u = (1, 0, 2), v = (− 1, 0, 3), w = (2, 0, − 2).
15. Calculate (u ××× v) ···(w ××× z) for u = (1, 1, 1), v = (3, 0, 2), w = (2, 2, 2), z = (2, 1, 4).
B
16. If v and w are unit vectors in R3, under what condition(s) would v ××× w also be a unit
vector in R3 ? Justify your answer .
17. Show that if v ××× w = 0 for all w in R3, then v = 0.
18. Prove Theorem 1.14(b). 19. Prove Theorem 1.14(c).
20. Prove Theorem 1.14(d). 21. Prove Theorem 1.14(e).
22. Prove Theorem 1.14(f). 23. Prove Theorem 1.16.
24. Prove Theorem 1.17. ( Hint: Expand both sides of the equation. )
25. Prove the following for all vectors v, w in R3:
(a) ∥v ××× w∥2 + | v ···w| 2 = ∥ v∥2 ∥w∥2


## Page 40

32 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
(b) If v ···w = 0 and v ××× w = 0, then v = 0 or w = 0.
C
26. Prove that in Example 1.8 the formula for the area of the triang le △ PQR yields the
same value no matter which two adjacent sides are chosen. To do this , show that
1
2 ∥u ××× (− w)∥ = 1
2 ∥v ××× w∥,
where u = − − →P R, − w = − − →PQ , and v = − − →QR , w = − − →QP as before. Similarly , show that
1
2 ∥(− u) ××× (− v)∥ = 1
2 ∥v ××× w∥,
where − u = − − →RP and − v = − − →RQ.
27. Assume that the vector equation a ××× x = b in R3, with unknown x and a ̸= 0 has a
solution. Show that:
(a) a ···b = 0.
(b) x = b ××× a
∥a∥2 + ka is a solution to the equation, for any scalar k.
28. Prove the Jacobi identity:
u ××× (v ××× w) + v ××× (w ××× u) + w ××× (u ××× v) = 0.
29. Show that u, v, w lie in the same plane in R3 if and only if u ···(v ××× w) = 0.
30. For all vectors u, v, w, z in R3, show that
(u ××× v) ××× (w ××× z) = (z ···(u ××× v))w − (w ···(u ××× v))z
and that
(u ××× v) ××× (w ××× z) = (u ···(w ××× z))v − (v ···(w ××× z))u
Why do both equations make sense geometrically?
31. Describe geometrically the set of points with position vector x satisfying the equation
(v ××× x) ××× x = v
for given vector v ̸= 0


## Page 41

1.5 Lines and Planes 33
1.5 Lines and Planes
Now that we know how to perform some operations on vectors, we can s tart to deal with
some familiar geometric objects, like lines and planes, in th e language of vectors. As you
will see, using vectors makes it easier to study objects in 3-dim ensional Euclidean space.
We will ﬁrst consider lines.
Line through a point, parallel to a vector
Let P = (x0, y0, z0) be a point in R3, let v = (a, b, c) be a nonzero vector , and let L be the line
through P which is parallel to v (see Figure 1.5.1).
x
y
z
0
L
t > 0
t < 0
P(x0, y0, z0)
r
v
tv
r + tv
r + tv
Figure 1.5.1
Let r = (x0, y0, z0) be the vector pointing from the origin to P. Since multiplying the vector
v by a scalar t lengthens or shrinks v while preserving its direction if t > 0, and reversing
its direction if t < 0, then we see from Figure 1.5.1 that every point on the line L can be
obtained by adding the vector tv to the vector r for some scalar t. That is, as t varies over all
real numbers, the vector r + tv will point to every point on L. We can summarize the vector
representation of L as follows:
For a point P = (x0, y0, z0) and nonzero vector v in R3, the line L through P parallel to v
is given by
r + tv, for − ∞ < t < ∞ , (1.16)
where r = (x0, y0, z0) is the vector pointing to P.
Note that we used the correspondence between a vector and its term inal point. Since
v = (a, b, c), then the terminal point of the vector r + tv is ( x0 + at, y0 + bt, z0 + ct). We then get
the parametric representation of L with the parameter t:
For a point P = (x0, y0, z0) and nonzero vector v = (a, b, c) in R3, the line L through P
parallel to v consists of all points ( x, y, z) given by
x = x0 + at, y = y0 + bt, z = z0 + ct, for − ∞ < t < ∞ . (1.17)
Note that in both representations we get the point P on L by letting t = 0.


## Page 42

34 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
In formula (1.17), if a ̸= 0, then we can solve for the parameter t: t = (x − x0)/a. We can also
solve for t in terms of y and in terms of z if neither b nor c, respectively , is zero: t = (y − y0)/b
and t = (z− z0)/c. These three values all equal the same value t, so we can write the following
system of equalities, called the symmetric representation of L:
For a point P = (x0, y0, z0) and vector v = (a, b, c) in R3 with a, b and c all nonzero, the line
L through P parallel to v consists of all points ( x, y, z) given by the equations
x − x0
a = y − y0
b = z − z0
c . (1.18)
x
y
z
0 x = x0x0
L
Figure 1.5.2
What if, say , a = 0 in the above scenario? We can not divide by
zero, but we do know that x = x0 + at, and so x = x0 + 0t = x0. Then the
symmetric representation of L would be:
x = x0, y − y0
b = z − z0
c . (1.19)
Note that this says that the line L lies in the plane x = x0, which is
parallel to the yz-plane (see Figure 1.5.2). Similar equations can be
derived for the cases when b = 0 or c = 0.
Y ou may have noticed that the vector representation ofL in formula (1.16) is more compact
than the parametric and symmetric formulas. That is an advanta ge of using vector notation.
Technically , though, the vector representation gives us the vectors whose terminal points
make up the line L, not just L itself. So you have to remember to identify the vectors r + tv
with their terminal points. On the other hand, the parametric repre sentation always gives
just the points on L and nothing else.
Example 1.19. Write the line L through the point P = (2, 3, 5) and parallel to the vector
v = (4, − 1, 6), in the following forms: (a) vector , (b) parametric, (c) sym metric. Lastly: (d) ﬁnd
two points on L distinct from P.
Solution: (a) Let r = (2, 3, 5). Then by formula (1.16), L is given by:
r + tv = (2, 3, 5) + t(4, − 1, 6), for − ∞ < t < ∞ .
(b) L consists of the points ( x, y, z) such that
x = 2 + 4t, y = 3 − t, z = 5 + 6t, for − ∞ < t < ∞ .
(c) L consists of the points ( x, y, z) such that
x − 2
4 = y − 3
− 1 = z − 5
6 .
(d) Letting t = 1 and t = 2 in part(b) yields the points (6 , 2, 11) and (10 , 1, 17) on L.


## Page 43

1.5 Lines and Planes 35
Line through two points
x
y
z
0
L
P1(x1, y1, z1)
P2(x2, y2, z2)
r1
r2
r2 − r1
r1 + t(r2 − r1)
Figure 1.5.3
Let P1 = (x1, y1, z1) and P2 = (x2, y2, z2) be distinct points
in R3, and let L be the line through P1 and P2. Let r1 =
(x1, y1, z1) and r2 = (x2, y2, z2) be the vectors pointing to P1
and P2, respectively . Then as we can see from Figure
1.5.3, r2 − r1 is the vector from P1 to P2. So if we multiply
the vector r2 − r1 by a scalar t and add it to the vector
r1, we will get the entire line L as t varies over all real
numbers. The following is a summary of the vector , para-
metric, and symmetric forms for the line L:
Let P1 = (x1, y1, z1), P2 = (x2, y2, z2) be distinct points in R3, and let r1 = (x1, y1, z1), r2 =
(x2, y2, z2). Then the line L through P1 and P2 has the following representations:
Vector:
r1 + t(r2 − r1) , for − ∞ < t < ∞ . (1.20)
Parametric:
x = x1 + (x2 − x1)t, y = y1 + (y2 − y1)t, z = z1 + (z2 − z1)t, for − ∞ < t < ∞ . (1.21)
Symmetric: x − x1
x2 − x1
= y − y1
y2 − y1
= z − z1
z2 − z1
(if x1 ̸= x2, y1 ̸= y2, and z1 ̸= z2). (1.22)
Example 1.20. Write the line L through the points P1 = (− 3, 1, − 4) and P2 = (4, 4, − 6) in
parametric form.
Solution: By formula (1.21), L consists of the points ( x, y, z) such that
x = − 3 + 7t, y = 1 + 3t, z = − 4 − 2t, for − ∞ < t < ∞ .
Distance from a point to a line
θ L
v
w d
Q
P
Figure 1.5.4
Let L be a line in R3 in vector form as r + tv (for −∞ < t < ∞ ),
and let P be a point not on L. The distance d from P to L is the
length of the line segment from P to L which is perpendicular to L
(see Figure 1.5.4). Pick a point Q on L, and let w be the vector from
Q to P. If θ is the angle between w and v, then d = ∥ w∥ sin θ. So
since ∥v ××× w∥ = ∥ v∥ ∥w∥ sin θ and v ̸= 0, then:
d = ∥v ××× w∥
∥v∥ . (1.23)
In other words, d is the hight of the parallelogram with adjacent sides v and w. Since its
area is ∥v ××× w∥ and its base ∥v∥, we get the expression (1.23).


## Page 44

36 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Example 1.21. Find the distance d from the point P = (1, 1, 1) to the line L in Example 1.20.
Solution: From Example 1.20, we see that we can represent L in vector form as: r + tv, for
r = (− 3, 1, − 4) and v = (7, 3, − 2). Since the point Q = (− 3, 1, − 4) is on L, then for w = − − →QP =
(1, 1, 1) − (− 3, 1, − 4) = (4, 0, 5), we have:
v ××× w =
⏐
⏐
⏐
⏐
⏐
⏐
i j k
7 3 − 2
4 0 5
⏐
⏐
⏐
⏐
⏐
⏐
=
⏐
⏐
⏐
⏐
3 − 2
0 5
⏐
⏐
⏐
⏐ i −
⏐
⏐
⏐
⏐
7 − 2
4 5
⏐
⏐
⏐
⏐ j +
⏐
⏐
⏐
⏐
7 3
4 0
⏐
⏐
⏐
⏐ k = 15 i − 43 j − 12 k , so
d = ∥v ××× w∥
∥v∥ =

15 i − 43 j − 12 k



(7, 3, − 2)

 =
√
152 + (− 43)2 + (− 12)2
√
72 + 32 + (− 2)2
=
/∇adicallow
2218/∇adicallow
62
≈ 5.98.
Two lines
It is clear that two lines L1 and L2, represented in vector form as r1 + sv1 and r2 + tv2,
respectively , are parallel (denoted as L1 ∥ L2) if v1 and v2 are parallel. Also, L1 and L2 are
perpendicular (denoted as L1 ⊥ L2) if v1 and v2 are perpendicular .
x
y
z
0
L1
L2
Figure 1.5.5
In 2-dimensional space, two lines are either identical, parallel , or they
intersect. In 3-dimensional space, there is an additional possib ility: two
lines can be skew, that is, they do not intersect but they are not parallel.
However , even though they are not parallel, skew lines are on para llel
planes (see Figure 1.5.5).
To determine whether two lines in R3 intersect, it is often easier to use
the parametric representation of the lines. In this case, you s hould use dif-
ferent parameter variables (usually s and t) for the lines, since the values of the parameters
may not be the same at the point of intersection. Setting the two (x, y, z) triples equal will
result in a system of 3 equations in 2 unknowns ( s and t).
Example 1.22. Find the point of intersection (if any) of the following lines:
x + 1
3 = y − 2
2 = z − 1
− 1 and x + 3 = y − 8
− 3 = z + 3
2 .
Solution: First we write the lines in parametric form, with parameters s and t:
x = − 1 + 3s, y = 2 + 2s, z = 1 − s and x = − 3 + t, y = 8 − 3t, z = − 3 + 2t.
The lines intersect when ( − 1 + 3s, 2 + 2s, 1 − s) = (− 3 + t, 8 − 3t, − 3 + 2t) for some s, t:
− 1 + 3s = − 3 + t : ⇒ t = 2 + 3s,
2 + 2s = 8 − 3t : ⇒ 2 + 2s = 8 − 3(2 + 3s) = 2 − 9s ⇒ 2s = − 9s ⇒ s = 0 ⇒ t = 2 + 3(0) = 2,
1 − s = − 3 + 2t : 1 − 0 = − 3 + 2(2) ⇒ 1 = 1. ✓ (Note that we had to check this.)
Letting s = 0 in the equations for the ﬁrst line, or letting t = 2 in the equations for the second
line, gives the point of intersection ( − 1, 2, 1).


## Page 45

1.5 Lines and Planes 37
Plane through a point, perpendicular to a vector
Let P be a plane in R3, and suppose it contains a point P0 = (x0, y0, z0). Let n = (a, b, c) be
a nonzero vector which is perpendicular to the plane P. Such a vector is called a normal
vector (or just a normal) to the plane. Now let ( x, y, z) be any point in the plane P. Then
the vector r = (x − x0, y − y0, z − z0) lies in the plane P (see Figure 1.5.6). So if r ̸= 0, then r ⊥ n
and hence n ···r = 0. And if r = 0 then we still have n ···r = 0.
(x0, y0, z0)(x, y, z)
n
r
Figure 1.5.6 The plane P.
Conversely , if (x, y, z) is any point in R3 such that r = (x − x0, y − y0, z − z0) ̸= 0 and n ···r = 0,
then r ⊥ n and so ( x, y, z) lies in P. This proves the following theorem:
Theorem 1.18. Let P be a plane in R3, let ( x0, y0, z0) be a point in P, and let n = (a, b, c) be a
nonzero vector which is perpendicular to P. Then P consists of the points ( x, y, z) satisfying
the vector equation:
n ···r = 0, (1.24)
where r = (x − x0, y − y0, z − z0), or equivalently:
a(x − x0) + b(y − y0) + c(z − z0) = 0. (1.25)
The above equation is called the point-normal form of the plane P.
Example 1.23. Find the equation of the plane P containing the point ( − 3, 1, 3) and perpen-
dicular to the vector n = (2, 4, 8).
Solution: By formula (1.25), the plane P consists of all points ( x, y, z) such that:
2(x + 3) + 4(y − 1) + 8(z − 3) = 0.
If we multiply out the terms in formula (1.25) and combine the co nstant terms, we get an
equation of the plane in normal form:
ax + b y+ cz + d = 0. (1.26)
For example, the normal form of the plane in Example 1.23 is 2 x + 4y + 8z − 22 = 0.


## Page 46

38 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Plane containing three noncollinear points
In 2-dimensional and 3-dimensional space, two points determine a l ine. Two points do not
determine a plane in R3. In fact, three collinear points (that is, all three on the same line) do
not determine a plane; an inﬁnite number of planes would contain t he line on which those
three points lie. However , three noncollinear points do determine a plane. For if Q, R and
S are noncollinear points in R3, then − − →QR and − − →QS are nonzero vectors which are not parallel
(by noncollinearity), and so their cross product − − →QR ××× − − →QS is perpendicular to both − − →QR and− − →QS . So − − →QR and − − →QS (and hence Q, R and S) lie in the plane through the point Q with normal
vector n = − − →QR ××× − − →QS (see Figure 1.5.7).
QR
S
n = − − →QR ××× − − →QS
− − →QR
− − →QS
Figure 1.5.7 Noncollinear points Q, R, S.
Example 1.24. Find the equation of the plane P containing the points (2 , 1, 3), (1, − 1, 2) and
(3, 2, 1).
Solution: Let Q = (2, 1, 3), R = (1, − 1, 2) and S = (3, 2, 1). Then for the vectors − − →QR = (− 1, − 2, − 1)
and − − →QS = (1, 1, − 2), the plane P has a normal vector
n = − − →QR ××× − − →QS = (− 1, − 2, − 1) ××× (1, 1, − 2) = (5, − 3, 1).
So using formula (1.25) with the point Q (we could also use R or S), the plane P consists of
all points ( x, y, z) such that:
5(x − 2) − 3(y − 1) + (z − 3) = 0,
or in normal form,
5x − 3y + z − 10 = 0.
We mentioned earlier that skew lines in R3 lie on separate, parallel planes. So two skew
lines do not determine a plane. But two (nonidentical) lines which e ither intersect or are
parallel do determine a plane. In both cases, to ﬁnd the equation o f the plane that contains
those two lines, simply pick from the two lines a total of three non collinear points (one point
from one line and two points from the other), then use the techni que above, as in Example
1.24, to write the equation. We will leave examples of this as exe rcises for the reader .


## Page 47

1.5 Lines and Planes 39
Distance between a point and a plane
The distance between a point in R3 and a plane is the length of the line segment from
that point to the plane which is perpendicular to the plane. The follo wing theorem gives a
formula for that distance.
Theorem 1.19. Let Q = (x0, y0, z0) be a point in R3, and let P be a plane with normal form
ax + b y+ cz + d = 0 that does not contain Q. Then the distance D from Q to P is:
D = | ax0 + b y0 + cz 0 + d|/∇adicallow
a2 + b2 + c2
. (1.27)
Proof: Let R = (x, y, z) be any point in the plane P (so that ax + b y+ cz + d = 0) and let
r = − − →RQ = (x0 − x, y0 − y, z0 − z). Then r ̸= 0 since Q does not lie in P. From the normal form
equation for P, we know that n = (a, b, c) is a normal vector for P. Now , any plane divides
R3 into two disjoint parts. Assume that n points toward the side of P where the point Q
is located. Place n so that its initial point is at R, and let θ be the angle between r and
n. Then 0 ◦ < θ < 90◦, so cos θ > 0. Thus, the distance D is cos θ∥r∥ = | cos θ| ∥ r∥ (see Figure
1.5.8).
Q
R
n
r D
θD
P
Figure 1.5.8
By Theorem 1.6 in Section 1.3, we know that cos θ = n ···r
∥n∥ ∥r∥ , so
D = | cos θ| ∥ r∥ = | n ···r|
∥n∥ ∥r∥ ∥r∥ = | n ···r|
∥n∥ = | a(x0 − x) + b(y0 − y) + c(z0 − z)|/∇adicallow
a2 + b2 + c2
= | ax0 + b y0 + cz 0 − (ax + b y+ cz)|/∇adicallow
a2 + b2 + c2
= | ax0 + b y0 + cz 0 − (− d)|/∇adicallow
a2 + b2 + c2
= | ax0 + b y0 + cz 0 + d|/∇adicallow
a2 + b2 + c2
.
If n points away from the side of P where the point Q is located, then 90 ◦ < θ < 180◦ and
so cos θ < 0. The distance D is then | cos θ| ∥ r∥, and thus repeating the same argument as
above still gives the same result. QED
Example 1.25. Find the distance D from (2, 4, − 5) to the plane from Example 1.24.
Solution: Recall that the plane is given by 5 x − 3y + z − 10 = 0. So
D = | 5(2) − 3(4) + 1(− 5) − 10|√
52 + (− 3)2 + 12
= |− 17|/∇adicallow
35
= 17/∇adicallow
35
≈ 2.87.


## Page 48

40 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Line of intersection of two planes
L
Figure 1.5.9
Note that two planes are parallel if they have normal vectors tha t are
parallel, and the planes are perpendicular if their normal vector s are
perpendicular .
Suppose that two planes P1 and P2 with normal vectors n1 and n2,
respectively , intersect in a line L (see Figure 1.5.9). Since n1 ××× n2 ⊥ n1,
then n1××× n2 is parallel to the plane P1. Likewise, n1××× n2 ⊥ n2 means that
n1 ××× n2 is also parallel to P2. Thus, n1 ××× n2 is parallel to the intersection
of P1 and P2, which is L. Thus, we can write L in the following vector form:
L : r + t(n1 ××× n2) , for − ∞ < t < ∞ (1.28)
where r is any vector pointing to a point belonging to both planes. To ﬁnd a point in both
planes, ﬁnd a common solution ( x, y, z) to the two normal form equations of the planes. This
can often be made easier by setting one of the coordinate variab les to zero, which leaves you
to solve two equations in just two unknowns.
Example 1.26. Find the line of intersection L of the planes 5 x − 3y + z − 10 = 0 and 2 x + 4y −
z + 3 = 0.
Solution: The plane 5 x − 3y + z − 10 = 0 has normal vector n1 = (5, − 3, 1) and the plane 2 x +
4y − z + 3 = 0 has normal vector n2 = (2, 4, − 1). Since n1 and n2 are not scalar multiples, then
the two planes are not parallel and hence will intersect. A point ( x, y, z) on both planes will
satisfy the following system of two equations in three unknowns :
5x − 3y + z − 10 = 0,
2x + 4y − z + 3 = 0.
Set x = 0 (why is that a good choice?). Then the above equations are redu ced to:
− 3y + z − 10 = 0,
4y − z + 3 = 0.
The second equation gives z = 4y + 3, substituting that into the ﬁrst equation gives y = 7.
Then z = 31, and so the point (0 , 7, 31) is on L. Since n1 ××× n2 = (− 1, 7, 26), then L is given by:
r + t(n1 ××× n2) = (0, 7, 31) + t(− 1, 7, 26), for − ∞ < t < ∞
or in parametric form:
x = − t, y = 7 + 7t, z = 31 + 26t, for − ∞ < t < ∞
Projections


## Page 49

1.5 Lines and Planes 41
Assume we need to ﬁnd the orthogonal projection S of the given point Q with the position
vector q to the line L given by parametric equation r + tv.
Note that S is the point of intersection of line L and the plane P thru Q perpendicular to
v. This plane P is given by the equation ( x − q) ···v = 0 with unknown x.
Since S belongs to L, its position vector is r + tv some t. Since it lies on the plane, we get
(r + tv − q) ···v = 0.
Solving for t, we get
t = (q − r) ···v
v ···v .
Therefore,
r + (q − r) ···v
v ···v v
is the position vector of the projection of P on L.
Note that S is also the projecction of point R with the position vector r to the plane P.
Therefore, the same formula can be used to ﬁnd the projection o f to the plane.
Example 1.27. Find the projections of the point Q = (1, 1, 1) to the line x = 1+ 4t, y = 2+ 5t, z =
3 + 6t.
Solution: The vector form of the parametric equation is (1 , 2, 3) + t(4, 5, 6). Applying the
formula above, we get
(1, 2, 3) + (1 − 1)4 + (1 − 2)5 + (1 − 3)6
42 + 52 + 62 (4, 5, 6) = (1, 2, 3) + 17
77 (4, 5, 6)
= ( 145
77 , 239
77 , 333
77 )
≈ (1.88, 3.1, 4.32)
is the position vector of the projection.
Exercises
A
For Exercises 1–4, write the line L through the point P and parallel to the vector v in the
following forms: (a) vector , (b) parametric, and (c) symmetri c.
1. P = (2, 3, − 2), v = (5, 4, − 3); 2. P = (3, − 1, 2), v = (2, 8, 1);
3. P = (2, 1, 3), v = (1, 0, 1); 4. P = (0, 0, 0), v = (7, 2, − 10).
For Exercises 5–6, write the line L through the points P1 and P2 in parametric form.
5. P1 = (1, − 2, − 3), P2 = (3, 5, 5); 6. P1 = (4, 1, 5), P2 = (− 2, 1, 3).
For Exercises 7–8, (a) ﬁnd the distance d from the point P to the line L (b) ﬁnd the orthogonal
projection of P to L


## Page 50

42 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
7. P = (1, − 1, − 1), L : x = − 2 − 2t, y = 4t, z = 7 + t;
8. P = (0, 0, 0), L : x = 3 + 2t, y = 4 + 3t, z = 5 + 4t.
For Exercises 9–10, ﬁnd the point of intersection (if any) of t he given lines.
9. x = 7 + 3s, y = − 4 − 3s, z = − 7 − 5s and x = 1 + 6t, y = 2 + t, z = 3 − 2t;
10. x − 6
4 = y + 3 = z and x − 11
3 = y − 14
− 6 = z + 9
2 .
For Exercises 11–12, write the normal form of the plane P containing the point Q and per-
pendicular to the vector n.
11. Q = (5, 1, − 2), n = (4, − 4, 3); 12. Q = (6, − 2, 0), n = (2, 6, 4).
For Exercises 13–14, write the normal form of the plane contain ing the given points.
13. (1, 0, 3), (1, 2, − 1), (6, 1, 6); 14. (− 3, 1, − 3), (4, − 4, 3), (0, 0, 1).
15. Write the normal form of the plane containing the lines from Ex ercise 9.
16. Write the normal form of the plane containing the lines from Ex ercise 10.
For Exercises 17–18, (a) ﬁnd the distance D from the point Q to the plane P and (b) ﬁnd the
projection of Q to the plane P
17. Q = (4, 1, 2), P : 3x − y − 5z + 8 = 0; 18. Q = (0, 2, 0), P : − 5x + 2y − 7z + 1 = 0.
For Exercises 19–20, ﬁnd the line of intersection (if any) of the given planes.
19. x + 3y + 2z − 6 = 0, 2 x − y + z + 2 = 0; 20. 3x + y − 5z = 0, x + 2y + z + 4 = 0.
B
21. Find the point(s) of intersection (if any) of the line x − 6
4 = y + 3 = z with the plane
x + 3y + 2z − 6 = 0. ( Hint: Put the equations of the line into the equation of the plane. )
22. Explain why the following formula
| − − →P A ···(− − →PQ ××× − − →AB)|
| − − →PQ ××× − − →AB|
gives the distance between the skew lines AB and PQ .


## Page 51

1.6 Elementary surfaces 43
1.6 Elementary surfaces
In the previous section we discussed planes in Euclidean space. A pla ne is an example of
a surface, which we will deﬁne informally 8 as the solution set of the equation F(x, y, z) = 0
in R3, for some real-valued function F. For example, a plane given by ax + b y+ cz + d = 0
is the solution set of F(x, y, z) = 0 for the function F(x, y, z) = ax + b y+ cz + d. Surfaces are
2-dimensional. The plane is the simplest surface, since it is “ﬂ at”. In this section we will
look at some surfaces that are more complex, the most important of which are the sphere
and the cylinder .
Deﬁnition 1.9. A sphere S is the set of all points ( x, y, z) in R3 which are a ﬁxed distance r
(called the radius) from a ﬁxed point P0 = (x0, y0, z0) (called the center of the sphere):
S = { (x, y, z) : ( x − x0)2 + (y − y0)2 + (z − z0)2 = r2 }. (1.29)
Using vector notation, this can be written in the equivalent f orm:
S = { x : ∥x − x0 ∥ = r }, (1.30)
where x = (x, y, z) and x0 = (x0, y0, z0) are vectors.
Figure 1.6.1 illustrates the vectorial approach to spheres.
y
z
x
0
∥x∥ = r
x
(a) radius r, center (0 , 0, 0)
y
z
x
0
∥x − x0 ∥ = r
x
x0
x − x0
(x0, y0, z0)
(b) radius r, center ( x0, y0, z0)
Figure 1.6.1 Spheres in R3.
Note in Figure 1.6.1(a) that the intersection of the sphere wit h the x y-plane is a circle of
radius r (that is, a great circle , given by x2 + y2 = r2 as a subset of R2). Similarly for the
intersections with the xz-plane and the yz-plane. In general, a plane intersects a sphere
either at a single point or in a circle.
8See O’N EILL for a deeper and more rigorous discussion of surfaces.


## Page 52

44 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Example 1.28. Find the intersection of the sphere x2 + y2 + z2 = 169 with the plane z = 12.
y
z
x
0
z = 12
Figure 1.6.2
Solution: The sphere is centered at the origin and has radius
13 =
/∇adicallow
169, so it does intersect the plane z = 12. Putting
z = 12 into the equation of the sphere gives
x2 + y2 + 122 = 169,
x2 + y2 = 169 − 144 = 25 = 52
which is a circle of radius 5 centered at (0 , 0, 12), parallel to
the x y-plane (see Figure 1.6.2).
If the equation in formula (1.29) is multiplied out, we get an eq uation of the form:
x2 + y2 + z2 + ax + b y+ cz + d = 0 (1.31)
for some constants a, b, c and d. Conversely , an equation of this form may describe a sphere,
which can be determined by completing the square for the x, y and z variables.
Note that the equation (1.31) could be written as
∥x∥2 + v ···x + d = 0,
where x = (x, y, z) and v = (a, b, c).
Example 1.29. Is 2 x2 + 2y2 + 2z2 − 8x + 4y − 16z + 10 = 0 the equation of a sphere?
Solution: Dividing both sides of the equation by 2 gives
x2 + y2 + z2 − 4x + 2y − 8z + 5 = 0,
(x2 − 4x + 4) + (y2 + 2y + 1) + (z2 − 8z + 16) + 5 − 4 − 1 − 16 = 0,
(x − 2)2 + (y + 1)2 + (z − 4)2 = 16
which is a sphere of radius 4 centered at (2 , − 1, 4).
Example 1.30. Find the points(s) of intersection (if any) of the sphere from E xample 1.29
and the line x = 3 + t, y = 1 + 2t, z = 3 − t.
Solution: Put the equations of the line into the equation of the sphere, wh ich was ( x − 2)2 +
(y + 1)2 + (z − 4)2 = 16, and solve for t:
(3 + t − 2)2 + (1 + 2t + 1)2 + (3 − t − 4)2 = 16,
(t + 1)2 + (2t + 2)2 + (− t − 1)2 = 16,
6t2 + 12t − 10 = 0.
The quadratic formula gives the solutions t = − 1 ± 4/∇adicallow
6
. Putting those two values into the
equations of the line gives the following two points of intersec tion:
(
2 + 4/∇adicallow
6
, − 1 + 8/∇adicallow
6
, 4 − 4/∇adicallow
6
)
and
(
2 − 4/∇adicallow
6
, − 1 − 8/∇adicallow
6
, 4 + 4/∇adicallow
6
)
.


## Page 53

1.6 Elementary surfaces 45
If two spheres intersect, they do so either at a single point or in a circle.
Example 1.31. Find the intersection (if any) of the spheres x2 + y2 + z2 = 25 and x2 + y2 + (z −
2)2 = 16.
Solution: For any point ( x, y, z) on both spheres, we see that
x2 + y2 + z2 = 25 ⇒ x2 + y2 = 25 − z2, and
x2 + y2 + (z − 2)2 = 16 ⇒ x2 + y2 = 16 − (z − 2)2, so
16 − (z − 2)2 = 25 − z2 ⇒ 4z − 4 = 9 ⇒ z = 13/4
⇒ x2 + y2 = 25 − (13/4)2 = 231/16.
∴ The intersection is the circle x2 + y2 = 231
16 in the plane z = 13/4. It has radius
/∇adicallow
231
4 ≈ 3.8
and centered at (0 , 0, 13
4 ).
The cylinders that we will consider are right circular cylinders . These are cylinders ob-
tained by moving a line L along a circle C in R3 in a way so that L is always perpendicular
to the plane containing C. We will only consider the cases where the plane containing C is
parallel to one of the three coordinate planes (see Figure 1.6.3 ).
y
z
x
0
r
(a) x2 + y2 = r2, any z
y
z
x
0
r
(b) x2 + z2 = r2, any y
y
z
x
0
r
(c) y2 + z2 = r2, any x
Figure 1.6.3 Cylinders in R3.
For example, the equation of a cylinder whose base circle C lies in the x y-plane and is
centered at ( a, b, 0) and has radius r is
(x − a)2 + (y − b)2 = r2, (1.32)
where the value of the z coordinate is unrestricted. Similar equations can be written wh en
the base circle lies in one of the other coordinate planes. A plan e intersects a right circular
cylinder in a circle, ellipse, or one or two lines, depending on wheth er that plane is parallel,
oblique9, or perpendicular , respectively , to the plane containing C. The intersection of a
surface with a plane is called the trace of the surface.
9That is, at an angle strictly between 0 ◦ and 90◦.


## Page 54

46 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
The equations of spheres and cylinders are examples of second-degree equations in R3;
that is, equations of the form
Ax 2 + B y2 + C z2 + D x y+ Exz + F yz + G x+ H y+ I z+ J = 0 (1.33)
for some constants A, B, . . ., J. If the above equation is not that of a sphere, cylinder , plane,
line or point, then the resulting surface is called a quadric surface.
y
z
x
0
a b
c
Figure 1.6.4 Ellipsoid
One type of quadric surface is the ellipsoid, given
by an equation of the form:
x2
a2 + y2
b2 + z2
c2 = 1. (1.34)
In the case where a = b = c, this is just a sphere.
In general, an ellipsoid is egg-shaped (think of an
ellipse rotated around its major axis). Its traces in
the coordinate planes are ellipses.
Two other types of quadric surfaces are the hyperboloid of one sheet , given by an
equation of the form:
x2
a2 + y2
b2 − z2
c2 = 1 (1.35)
and the hyperboloid of two sheets , whose equation has the form:
x2
a2 − y2
b2 − z2
c2 = 1. (1.36)
y
z
x
0
Figure 1.6.5 Hyperboloid of one sheet.
y
z
x
0
Figure 1.6.6 Hyperboloid of two sheets.


## Page 55

1.6 Elementary surfaces 47
For the hyperboloid of one sheet, the trace in any plane parallel to the x y-plane is an
ellipse. The traces in the planes parallel to the xz- or yz-planes are hyperbolas (see Figure
1.6.5), except for the special cases x = ± a and y = ± b; in those planes the traces are pairs of
intersecting lines (see Exercise 8).
For the hyperboloid of two sheets, the trace in any plane parallel to the x y- or xz-plane is
a hyperbola (see Figure 1.6.6). There is no trace in the yz-plane. In any plane parallel to the
yz-plane for which | x| > | a| , the trace is an ellipse.
y
z
x
0
Figure 1.6.7 Paraboloid
The elliptic paraboloid is another type of quadric surface,
whose equation has the form:
x2
a2 + y2
b2 = z
c . (1.37)
The traces in planes parallel to the x y-plane are ellipses, though
in the x y-plane itself the trace is a single point. The traces in
planes parallel to the xz- or yz-planes are parabolas. Figure
1.6.7 shows the case where c > 0. When c < 0 the surface is
turned downward. In the case where a = b, the surface is called
a paraboloid of revolution, which is often used as a reﬂecting sur-
face in vehicle headlights. 10
A more complicated quadric surface is the hyperbolic paraboloid, given by:
x2
a2 − y2
b2 = z
c . (1.38)
The hyperbolic paraboloid can be tricky to draw; using graphing so ftware on a computer
can make it easier . For example, Figure 1.6.8 was created usin g the free Gnuplot package.
It shows the graph of the hyperbolic paraboloid z = y2 − x2, which is the special case where
a = b = 1 and c = − 1 in equation (1.38). The mesh lines on the surface are the tra ces in
planes parallel to the coordinate planes. So we see that the traces in planes parallel to the
xz-plane are parabolas pointing upward, while the traces in planes para llel to the yz-plane
are parabolas pointing downward. Also, notice that the traces in pl anes parallel to the x y-
plane are hyperbolas, though in the x y-plane itself the trace is a pair of intersecting lines
through the origin. This is true in general when c < 0 in equation (1.38). When c > 0, the
surface would be similar to that in Figure 1.6.8, only rotated 90◦ around the z-axis and the
nature of the traces in planes parallel to the xz- or yz-planes would be reversed.
10For a discussion of this see pp. 157–158 in H ECHT .


## Page 56

48 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
-10
-5
0
5
10
-10
-5
0
5
10
-100
-50
0
50
100
z
x
y
z
Figure 1.6.8 Hyperbolic paraboloid.
y
z
x
0
Figure 1.6.9 Elliptic cone
The last type of quadric surface that we will consider is the
elliptic cone, which has an equation of the form:
x2
a2 + y2
b2 − z2
c2 = 0. (1.39)
The traces in planes parallel to the x y-plane are ellipses, ex-
cept in the x y-plane itself where the trace is a single point.
The traces in planes parallel to the xz- or yz-planes are hyper-
bolas, except in the xz- and yz-planes themselves where the
traces are pairs of intersecting lines.
Notice that every point on the elliptic cone is on a line which
lies entirely on the surface; in Figure 1.6.9 these lines all go
through the origin. This makes the elliptic cone an example of
a ruled surface. The cylinder is also a ruled surface.
What may not be as obvious is that both the hyperboloid of one sh eet and the hyperbolic
paraboloid are ruled surfaces. In fact, on both surfaces ther e are two lines through each
point on the surface (see Exercises 11–12). Such surfaces are called doubly ruled surfaces ,
and the pairs of lines are called a regulus.


## Page 57

1.6 Elementary surfaces 49
It is clear that for each of the six types of quadric surfaces tha t we discussed, the surface
can be translated away from the origin (say , by replacing x2 by (x− x0)2 in its equation). It can
be proved 11 that every quadric surface can be translated and/or rotated so that its eq uation
matches one of the six types that we described.
For example, z = kx y is a case of equation (1.33) with “mixed” variables; namely D ̸= 0,
so that we get an x y term. This equation does not match any of the types we considered.
However , by rotating the x- and y-axes by 45 ◦ in the x y-plane by means of the coordinate
transformation x = (x′− y′)/
/∇adicallow
2, y = (x′+ y′)/
/∇adicallow
2, z = z′, then z = kx y becomes the hyperbolic
paraboloid z′= k(x′)2 − k(y′)2 in the ( x′, y′, z′) coordinate system.
That is, the equation
z = kx y (1.40)
describes a hyperbolic paraboloid as in equation (1.38), but ro tated 45 ◦ in the x y-plane.
Exercises
A
For Exercises 1–4, determine if the given equation describes a sphere. If so, ﬁnd its radius
and center .
1. x2 + y2 + z2 − 4x − 6y − 10z + 37 = 0; 2. x2 + y2 + z2 + 2x − 2y − 8z + 19 = 0;
3. 2x2 + 2y2 + 2z2 + 4x + 4y + 4z − 44 = 0; 4. x2 + y2 − z2 + 12x + 2y − 4z + 32 = 0.
5. Find the point(s) of intersection of the sphere ( x − 3)2 + (y + 1)2 + (z − 3)2 = 9 and the line
x = − 1 + 2t, y = − 2 − 3t, z = 3 + t.
B
6. Find the intersection of the spheres x2 + y2 + z2 = 9 and ( x − 4)2 + (y + 2)2 + (z − 4)2 = 9.
7. Find the intersection of the sphere x2 + y2 + z2 = 9 and the cylinder x2 + y2 = 4.
8. Find the trace of the hyperboloid of one sheet x2
a2 + y2
b2 − z2
c2 = 1 in the plane x = a, and the
trace in the plane y = b.
9. Find the trace of the hyperbolic paraboloid x2
a2 − y2
b2 = z
c in the x y-plane.
C
10. It can be shown that any four noncoplanar points (that is, points that do not lie in the
same plane) determine a sphere. 12 Find the equation of the sphere that passes through
the points (0 , 0, 0), (0, 0, 2), (1, − 4, 3) and (0 , − 1, 3). (Hint: Equation (1.31))
11See Ch. 7 in P OGORELOV .
12See W ELCHONS and K RICKENBERGER , p. 160, for a proof.


## Page 58

50 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
11. Show that the hyperboloid of one sheet is a doubly ruled surface ; that is, each point on
the surface is on two lines lying entirely on the surface. (Hint: Write equation (1.35) as
x2
a2 − z2
c2 = 1 − y2
b2 , factor each side. Recall that two planes intersect in a line.)
12. Show that the hyperbolic paraboloid is a doubly ruled surface. (Hint: Exercise 11)
y
z
x
0
(0, 0, 2)
(x, y, 0)
(a, b, c)
1 S
Figure 1.6.10
13. Let S be the sphere with radius 1 centered at (0 , 0, 1),
and let S∗ be S without the “north pole” point (0 , 0, 2). Let
(a, b, c) be an arbitrary point on S∗ . Then the line passing
through (0, 0, 2) and ( a, b, c) intersects the x y-plane at some
point ( x, y, 0), as in Figure 1.6.10. Find this point ( x, y, 0) in
terms of a, b and c.
(Note: Every point in the x y-plane can be matched with a
point on S∗ , and vice versa, in this manner . This method is
called stereographic projection, which essentially identiﬁes
all of R2 with a “punctured” sphere.)
14. Given two points P and Q in the space consider the set of points X such that the distance
from X to P is twice larger than the distance from X to Q. Show that this set is a sphere.
Find its radius and center if P = (1, 2, 3) and Q = (2, 4, 5).
15. Show that the equidistant set from a plane and a point not on the pla ne is formed by a
elliptic paraboloid. (Hint:Use the coordinate system with the given pane as the x y-plane.)


## Page 59

1.7 Curvilinear Coordinates 51
1.7 Curvilinear Coordinates
x
y
z
0
(x, y, z)
x
y
z
Figure 1.7.1
The Cartesian coordinates of a point ( x, y, z) are determined by
following straight paths starting from the origin: ﬁrst along the
x-axis, then parallel to the y-axis, then parallel to the z-axis, as
in Figure 1.7.1. In curvilinear coordinate systems , these paths can
be curved. The two types of curvilinear coordinates which we will
consider are cylindrical and spherical coordinates. Instead of ref-
erencing a point in terms of sides of a rectangular parallelepiped,
as with Cartesian coordinates, we will think of the point as ly-
ing on a cylinder or sphere. Cylindrical coordinates are often us ed when there is symmetry
around the z-axis; spherical coordinates are useful when there is symmetry about the origin.
If a problem is given in curvilinear coordinates, the typical so lution consist of (1) convert-
ing the data in Cartesian coordinates, (2) solving it in the Car tesian coordinates and (3)
converting the results back to the original curvilinear coo rdinates if necessarily . Unless you
know what you are doing, we suggest to follow this procedure.
Let P = (x, y, z) be a point in Cartesian coordinates in R3. Then the cylindrical coordi-
nates (r, θ, z) and the spherical coordinates (ρ, θ, φ) of P(x, y, z) are deﬁned as follows: 13
x
y
z
0
P(x, y, z)
P0(x, y, 0)
θx
y
z
r
Figure 1.7.2
Cylindrical coordinates
Cylindrical coordinates (r, θ, z):
x = r cos θ, r =
√
x2 + y2,
y = r sin θ, θ = tan− 1 ( y
x
)
,
z = z, z = z,
where 0 ≤ θ ≤ π if y ≥ 0 and π < θ < 2π if y < 0.
x
y
z
0
P(x, y, z)
P0(x, y, 0)
θx
y
z
ρ
φ
Figure 1.7.3
Spherical coordinates
Spherical coordinates (ρ, θ, φ):
x = ρ sin φ cos θ, ρ =
√
x2 + y2 + z2,
y = ρ sin φ sin θ, θ = tan− 1 ( y
x
)
,
z = ρ cos φ, φ = cos− 1
(
z/∇adicallow
x2+ y2+ z2
)
,
where 0 ≤ θ ≤ π if y ≥ 0 and π < θ < 2π if y < 0.
Both θ and φ are measured in radians. Note that r ≥ 0, 0 ≤ θ < 2π, ρ ≥ 0 and 0 ≤ φ ≤ π.
Also, θ is undeﬁned when ( x, y) = (0, 0), and φ is undeﬁned when ( x, y, z) = (0, 0, 0).
13This “standard” deﬁnition of spherical coordinates used by math ematicians results in a left-handed system.
For this reason, physicists usually switch the deﬁnitions of θ and φ to make ( ρ, θ, φ) a right-handed system.


## Page 60

52 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
Assume P0 = (x, y, 0) is the projection of P upon the x y-plane and ( r, θ, z) are cylindrical
coordinates of P = (x, y, z). Then ( r, θ) are the polar coordinates of P0 (see Figure 1.7.2).
In the spherical coordinates ρ is length of the line segment from the origin to P, and φ be
the angle between that line segment and the positive z-axis (see Figure 1.7.3). The angle φ
is called the zenith angle.
Example 1.32. Convert the point ( − 2, − 2, 1) from Cartesian coordinates to (a) cylindrical
and (b) spherical coordinates.
Solution: (a) r =
√
(− 2)2 + (− 2)2 = 2
/∇adicallow
2, θ = tan− 1 (− 2
− 2
)
= tan− 1(1) = 5π
4 , since y = − 2 < 0.
∴ (r, θ, z) =
(
2
/∇adicallow
2, 5π
4 , 1
)
.
(b) ρ =
√
(− 2)2 + (− 2)2 + 12 =
/∇adicallow
9 = 3, φ = cos− 1 (1
3
)
≈ 1.23 radians.
∴ (ρ, θ, φ) =
(
3, 5π
4 , 1.23
)
.
For cylindrical coordinates ( r, θ, z), and constants r0, θ0 and z0, we see from Figure 1.7.4
that the surface r = r0 is a cylinder of radius r0 centered along the z-axis, the surface θ = θ0
is a half-plane emanating from the z-axis, and the surface z = z0 is a plane parallel to the
x y-plane.
y
z
x
0
r0
(a) r = r0
y
z
x
0
θ0
(b) θ = θ0
y
z
x
0
z0
(c) z = z0
Figure 1.7.4 Cylindrical coordinate surfaces.
For spherical coordinates ( ρ, θ, φ), and constants ρ0, θ0 and φ 0, we see from Figure 1.7.5
that the surface ρ = ρ0 is a sphere of radius ρ0 centered at the origin, the surface θ = θ0 is a
half-plane emanating from the z-axis, and the surface φ = φ 0 is a circular cone whose vertex
is at the origin.
Figures 1.7.4(a) and 1.7.5(a) show how these coordinate syst ems got their names.
Sometimes the equation of a surface in Cartesian coordinates can be transformed into a
simpler equation in some other coordinate system, as in the fol lowing example.
Example 1.33. Write the equation of the cylinder x2 + y2 = 4 in cylindrical coordinates.
Solution: Since r =
√
x2 + y2, then the equation in cylindrical coordinates is r = 2.
Using spherical coordinates to write the equation of a sphere does not necessarily make
the equation simpler , if the sphere is not centered at the origi n.


## Page 61

1.7 Curvilinear Coordinates 53
y
z
x
0
ρ0
(a) ρ = ρ0
y
z
x
0
θ0
(b) θ = θ0
y
z
x
0
φ 0
(c) φ = φ 0
Figure 1.7.5 Spherical coordinate surfaces.
Example 1.34. Write the equation ( x − 2)2 + (y − 1)2 + z2 = 9 in spherical coordinates.
Solution: Multiplying the equation out gives
x2 + y2 + z2 − 4x − 2y + 5 = 9 , so we get
ρ2 − 4ρ sin φ cos θ − 2ρ sin φ sin θ − 4 = 0 , or
ρ2 − 2 sinφ (2 cosθ − sin θ) ρ − 4 = 0 after combining terms.
Note that this actually makes it more difﬁcult to ﬁgure out what the surface is, as opposed
to the Cartesian equation where you could immediately identify the surface as a sphere of
radius 3 centered at (2 , 1, 0).
Example 1.35. Describe the surface given by θ = z in cylindrical coordinates.
Solution: This surface is called a helicoid. As the (vertical) z coordinate increases, so does
the angle θ, while the radius r is unrestricted. So this sweeps out a (ruled!) surface shaped
like a spiral staircase, where the spiral has an inﬁnite radius. F igure 1.7.6 shows a section
of this surface restricted to 0 ≤ z ≤ 4π and 0 ≤ r ≤ 2.
Exercises
A
For Exercises 1–4, ﬁnd the (a) cylindrical and (b) spherical co ordinates of the point whose
Cartesian coordinates are given.
1. (2, 2
/∇adicallow
3, − 1); 2. (− 5, 5, 6); 3. (
/∇adicallow
21, −
/∇adicallow
7, 0); 4. (0,
/∇adicallow
2, 2).
For Exercises 5–7, write the given equation in (a) cylindrical and (b) spherical coordinates.
5. x2 + y2 + z2 = 25; 6. x2 + y2 = 2y; 7. x2 + y2 + 9z2 = 36.
B
8. Describe the intersection of the surfaces whose equations in s pherical coordinates are
θ = π
2 and φ = π
4 .


## Page 62

54 CHAPTER 1. VECTORS IN EUCLIDEAN SP ACE
-2-1.5-1-0.500.511.52
-2 -1.5 -1 -0.5 0 0.5 1 1.5 2
0
2
4
6
8
10
12
14
z
x
y
z
Figure 1.7.6 Helicoid θ = z.
9. Show that for a ̸= 0, the equation ρ = 2a sin φ cos θ in spherical coordinates describes a
sphere centered at ( a, 0, 0) with radius | a| .
C
10. Let P = (a, θ, φ) be a point in spherical coordinates, with a > 0 and 0 < φ < π. Then P
lies on the sphere ρ = a. Since 0 < φ < π, the line segment from the origin to P can be
extended to intersect the cylinder given by r = a (in cylindrical coordinates). Find the
cylindrical coordinates of that point of intersection.
11. Let P1 and P2 be points whose spherical coordinates are ( ρ1, θ1, φ 1) and (ρ2, θ2, φ 2), respec-
tively . Let v1 be the vector from the origin to P1, and let v2 be the vector from the origin
to P2. For the angle γ between v1 and v2, show that
cos γ = cos φ 1 cos φ 2 + sin φ 1 sin φ 2 cos( θ2 − θ1 ).
This formula is used in electrodynamics to prove the addition the orem for spherical har-
monics, which provides a general expression for the electrostat ic potential at a point due
to a unit charge. See pp. 100–102 in J ACKSON .
12. Show that the distance d between the points P1 and P2 with cylindrical coordinates


## Page 63

1.7 Curvilinear Coordinates 55
(r1, θ1, z1) and ( r2, θ2, z2), respectively , is
d =
√
r2
1 + r2
2 − 2r1 r2 cos( θ2 − θ1 ) + (z2 − z1)2 .
13. Show that the distance d between the points P1 and P2 with spherical coordinates
(ρ1, θ1, φ 1) and ( ρ2, θ2, φ 2), respectively , is
d =
√
ρ2
1 + ρ2
2 − 2ρ1 ρ2[sin φ 1 sin φ 2 cos( θ2 − θ1 ) + cos φ 1 cos φ 2] .


## Page 64

2 Curves
2.1 Vector-Valued Functions
Now that we are familiar with vectors and their operations, we can begin discussing func-
tions whose values are vectors.
Deﬁnition 2.1. A vector-valued function of a real variable is a rule that associates a
vector f(t) with a real number t, where t is in R or its interval (called the domain of f). We
write f : D → R3 to denote that f is a mapping of D into R3.
For example, f(t) = ti + t2j + t3k is a vector-valued function in R3, deﬁned for all real num-
bers t. We would write f : R → R3. At t = 1 the value of the function is the vector i + j + k,
which in Cartesian coordinates has the terminal point (1 , 1, 1).
A vector-valued function of a real variable can be written in c omponent form as
f(t) = f1(t)i + f2(t)j + f3(t)k or f(t) = ( f1(t), f2(t), f3(t))
for some real-valued functions f1(t), f2(t), f3(t), called the component functions of f. The ﬁrst
form is often used when emphasizing that f(t) is a vector , and the second form is useful when
considering just the terminal points of the vectors.
y
z
x
0
f(0)
f(2π)
Figure 2.1.1
Example 2.1. Deﬁne f : R → R3 by f(t) = (cos t, sin t, t).
This is a parametric equation of a helix (see Figure 1.8.1). As the
value of t increases, the terminal points of f(t) is spiraling upward.
For each t, the x- and y-coordinates of f(t) are x = cos t and y = sin t,
so
x2 + y2 = cos2 t + sin2 t = 1.
Thus, f(t) lies on the surface of the right circular cylinder x2+ y2 = 1
for any t.
Since each of the three component functions are real-valued, i t will sometimes be the case
that results from single-variable calculus can simply be appli ed to each of the component
functions to yield a similar result for the vector-valued fu nction. However , there are times
when such generalizations do not hold (see Exercise 13). The co ncept of a limit, though, can
be extended naturally to vector-valued functions, as in the f ollowing deﬁnition.
56


## Page 65

2.1 Vector-Valued Functions 57
Deﬁnition 2.2. Let f(t) be a vector-valued function, let a be a real number and let c be a
vector . Then we say that the limit of f(t) as t approaches a equals c, written as lim
t→ a
f(t) = c,
if lim
t→ a
∥f(t) − c∥ = 0.
Equivalently , iff(t) = ( f1(t), f2(t), f3(t)), then
lim
t→ a
f(t) =
(
lim
t→ a
f1(t), lim
t→ a
f2(t), lim
t→ a
f3(t)
)
,
provided that all three limits on the right side exist.
The above deﬁnition shows that continuity and the derivative of vector-valued functions
can also be deﬁned in terms of its component functions.
Deﬁnition 2.3. Let f(t) = ( f1(t), f2(t), f3(t)) be a vector-valued function, and let a be a real
number in its domain. Then f(t) is continuous at a if lim
t→ a
f(t) = f(a). Equivalently , f(t) is
continuous at a if and only if f1(t), f2(t), and f3(t) are continuous at a.
The derivative of f(t) at a, denoted by f′(a) or df
dt (a), is the limit
f′(a) = lim
h→ 0
f(a + h) − f(a)
h
if that limit exists. Equivalently ,f′(a) = ( f ′
1 (a), f ′
2 (a), f ′
3 (a)), if the component derivatives exist.
We say that f(t) is differentiable at a if f′(a) exists.
A real-valued function whose ﬁrst derivative is continuous is called continuously differ-
entiable (or a C1 function), and a function whose derivatives of all orders are co ntinuous is
called smooth (or a C∞ function). All the functions we will consider will be smooth.
Continuous vector valued functions are also called curves; in this
case the vector f(t) is usually regarded as its terminal point. A regular
curve f(t) is one whose derivative f′(t) is never the zero vector .
For example consider the plane curve f(t) = (t2, t3); it is so called
semicubical parabola shown on the picture. The curve has smooth
components but it is not regular since f′(t) = (2t, 3t2) vanish at t = 0. In
fact this curve does not look “smooth” at t = 0; it has so called cusp at
this point.
Recall that the derivative of a real-valued function of a sing le vari-
able is a real number , representing the slope of the tangent lin e to the
graph of the function at a point. Similarly , the derivative of a v ector-
valued function is a tangent vector to the curve in space which the
function represents, and it lies on the tangent line to the curve (see
Figure 2.1.2).
Example 2.2. Let f(t) = (cos t, sin t, t). Then f′(t) = (− sin t, cos t, 1) for all t. The tangent line
L to the curve at f(2π) = (1, 0, 2π) is L = f(2π) + s f′(2π) = (1, 0, 2π) + s(0, 1, 1), or in parametric
form: x = 1, y = s, z = 2π + s for −∞ < s < ∞ .


## Page 66

58 CHAPTER 2. CURVES
y
z
x
0
L
f(t)
f′(a)
f(a)
f(a + h)
f(a+ h)− f(a)
Figure 2.1.2 Tangent vector f′(a) and tangent line L = f(a) + sf′(a).
A scalar function is a real-valued function. Note that if u(t) is a scalar function and
f(t) is a vector-valued function, then their product, deﬁned by ( u f)(t) = u(t) f(t) for all t, is a
vector-valued function (since the product of a scalar with a vec tor is a vector).
The basic properties of derivatives of vector-valued function s are summarized in the fol-
lowing theorem.
Theorem 2.1. Let f(t) and g(t) be differentiable vector-valued functions, let u(t) be a
differentiable scalar function, let k be a scalar , and let c be a constant vector . Then
(a) d
dt (c) = 0;
(b) d
dt (kf) = k df
dt ;
(c) d
dt (f + g) = df
dt + dg
dt ;
(d) d
dt (f − g) = df
dt − dg
dt ;
(e) d
dt (u f) = du
dt f + u df
dt ;
(f) d
dt (f ···g) = df
dt ···g + f ···dg
dt ;
(g) d
dt (f ××× g) = df
dt ××× g + f ××× dg
dt .
Proof: The proofs of parts (a)–(e) follow easily by differentiating th e component functions
and using the rules for derivatives from single-variable cal culus. We will prove part (f),
and leave the proof of part (g) as an exercise for the reader .
(f) Write f(t) = ( f1(t), f2(t), f3(t)) and g(t) = (g1(t), g2(t), g3(t)), where the component functions


## Page 67

2.1 Vector-Valued Functions 59
f1(t), f2(t), f3(t), g1(t), g2(t), g3(t) are all differentiable real-valued functions. Then
d
dt (f(t) ···g(t)) = d
dt ( f1(t) g1(t) + f2(t) g2(t) + f3(t) g3(t))
= d
dt ( f1(t) g1(t)) + d
dt ( f2(t) g2(t)) + d
dt ( f3(t) g3(t))
= d f1
dt (t) g1(t) + f1(t) d g1
dt (t) + d f2
dt (t) g2(t) + f2(t) d g2
dt (t) + d f3
dt (t) g3(t) + f3(t) d g3
dt (t)
=
(d f1
dt (t), d f2
dt (t), d f3
dt (t)
)
···(g1(t), g2(t), g3(t))
+ ( f1(t), f2(t), f3(t)) ···
(d g1
dt (t), d g2
dt (t), d g3
dt (t)
)
= df
dt (t) ···g(t) + f(t) ···dg
dt (t) for all t. QED
Example 2.3. Suppose f(t) is differentiable. Find the derivative of ∥f(t)∥.
Solution: Since ∥f(t)∥ is a real-valued function of t, then by the Chain Rule for real-valued
functions, we know that d
dt ∥f(t)∥2 = 2∥f(t)∥ d
dt ∥f(t)∥.
But ∥f(t)∥2 = f(t) ···f(t), so d
dt ∥f(t)∥2 = d
dt (f(t) ···f(t)). Hence, we have
2∥f(t)∥ d
dt ∥f(t)∥ = d
dt (f(t) ···f(t)) = f′(t) ···f(t) + f(t) ···f′(t) by Theorem 2.1(f), so
= 2f′(t) ···f(t) , so if ∥f(t)∥ ̸= 0 then
d
dt ∥f(t)∥ = f′(t) ···f(t)
∥f(t)∥ .
We know that ∥f(t)∥ is constant if and only if d
dt ∥f(t)∥ = 0 for all t. Also, f(t) ⊥ f′(t) if and
only if f′(t) ···f(t) = 0. Thus, the above example shows this important fact:
If ∥f(t)∥ ̸= 0, then ∥f(t)∥ is constant if and only if f(t) ⊥ f′(t) for all t.
This means that if a curve lies completely on a sphere (or circle ) centered at the origin, then
the tangent vector f′(t) is always perpendicular to the position vector f(t).
Example 2.4. The spherical spiral f(t) =
( cos t/∇adicallow
1 + a2t2
, sin t/∇adicallow
1 + a2t2
, − at/∇adicallow
1 + a2t2
)
, for a ̸= 0.
Figure 2.1.3 shows the graph of the curve when a = 0.2. In the exercises, the reader will be
asked to show that this curve lies on the sphere x2 + y2 + z2 = 1 and to verify directly that
f′(t) ···f(t) = 0 for all t.


## Page 68

60 CHAPTER 2. CURVES
-1-0.8-0.6-0.4-0.200.20.40.60.81
-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1
-1
-0.8
-0.6
-0.4
-0.2
0
0.2
0.4
0.6
0.8
1
z
x
y
z
Figure 2.1.3 Spherical spiral with a = 0.2.
Just as in single-variable calculus, higher-order derivativ es of vector-valued functions are
obtained by repeatedly differentiating the (ﬁrst) derivative o f the function:
f′′(t) = d
dt f′(t) , f′′′(t) = d
dt f′′(t) , . . . , dnf
dt n = d
dt
(dn− 1f
dt n− 1
)
(for n = 2, 3, 4, . . .).
We can use vector-valued functions to represent physical quan tities, such as velocity , ac-
celeration, force, momentum, etc. For example, let the real v ariable t represent time elapsed
from some initial time ( t = 0), and suppose that an object of constant mass m is subjected
to some force so that it moves in space, with its position ( x, y, z) at time t a function of
t. That is, x = x(t), y = y(t), z = z(t) for some real-valued functions x(t), y(t), z(t). Call
r(t) = (x(t), y(t), z(t)) the position vector of the object. We can deﬁne various physical quan-
tities associated with the object as follows: 1
position: r(t) = (x(t), y(t), z(t));
velocity: v(t) = ˙r(t) = r′(t) = dr
dt
= (x′(t), y′(t), z′(t));
1We will often use the older dot notation for derivatives when p hysics is involved.


## Page 69

2.1 Vector-Valued Functions 61
acceleration: a(t) = ˙v(t) = v′(t) = dv
dt
= ¨r(t) = r′′(t) = d2r
dt 2
= (x′′(t), y′′(t), z′′(t));
momentum: p(t) = mv(t);
force: F(t) = ˙p(t) = p′(t) = dp
dt (Newton’s Second Law of Motion).
The magnitude ∥v(t)∥ of the velocity vector is called the speed of the object. Note that since
the mass m is a constant, the force equation becomes the familiar F(t) = ma(t).
Example 2.5. Let r(t) = (5 cost, 3 sint, 4 sint) be the position vector of an object at time t ≥ 0.
Find its (a) velocity and (b) acceleration vectors.
Solution: (a) v(t) = ˙r(t) = (− 5 sint, 3 cost, 4 cost).
(b) a(t) = ˙v(t) = (− 5 cost, − 3 sint, − 4 sint).
Note that ∥r(t)∥ =
√
25 cos2 t + 25 sin2 t = 5 for all t, so by Example 2.3 we know that r(t) ···
˙r(t) = 0 for all t (which we can verify from part (a)). In fact, ∥v(t)∥ = 5 for all t also. And not
only does r(t) lie on the sphere of radius 5 centered at the origin, but perhaps n ot so obvious
is that it lies completely within a circle of radius 5 centered at the origin. Also, note that
a(t) = − r(t). It turns out (see Exercise 16) that whenever an object moves in a circle with
constant speed, the acceleration vector will point towards the ce nter of the circle.
Recall from Section 1.5 that if r1, r2 are position vectors to distinct points then r1 + t(r2 − r1)
represents a line through those two points as t varies over all real numbers. That vector
sum can be written as (1 − t)r1 + tr2. So the function l(t) = (1 − t)r1 + tr2 is a line through
the terminal points of r1 and r2, and when t is restricted to the interval [0, 1] it is the line
segment between the points, with l(0) = r1 and l(1) = r2.
In general, a function of the form f(t) = (a1t + b1, a2t + b2, a3t + b3) represents a line in R3. A
function of the form f(t) = (a1t2 + b1t + c1, a2t2 + b2t + c2, a3t2 + b3t + c3) represents a (possibly
degenerate) parabola in R3.
Example 2.6. Bézier curves are used in Computer Aided Design to approximate the shape of
a polygonal path in space (called the Bézier polygon or control polygon). For instance, given
three points (or position vectors) b0, b1, b2 in R3, deﬁne
b
1
0(t) = (1 − t)b0 + tb1,
b
1
1(t) = (1 − t)b1 + tb2,
b
2
0(t) = (1 − t)b
1
0(t) + tb
1
1(t)
= (1 − t)2b0 + 2t(1 − t)b1 + t2b2
for all real t. For t in the interval [0 , 1], we see that b1
0(t) is the line segment between b0 and
b1, and b1
1(t) is the line segment between b1 and b2. The function b2
0(t) is the Bézier curve


## Page 70

62 CHAPTER 2. CURVES
for the points b0, b1, b2. Note from the last formula that the curve is a parabola that go es
through b0 (when t = 0) and b2 (when t = 1).
As an example, let b0 = (0, 0, 0), b1 = (1, 2, 3), and b2 = (4, 5, 2). Then the explicit formula for
the Bézier curve is b2
0(t) = (2t + 2t2, 4t + t2, 6t − 4t2), as shown in Figure 2.1.4, where the line
segments are b1
0(t) and b1
1(t), and the curve is b2
0(t).
00.511.522.533.54
0 1 2 3 4 5
0
0.5
1
1.5
2
2.5
3
z
x
y
z
(0, 0, 0)
(1, 2, 3)
(4, 5, 2)
Figure 2.1.4 Bézier curve approximation for three points.
In general, the polygonal path determined by n ≥ 3 noncollinear points in R3 can be used
to deﬁne the Bézier curve recursively by a process called repeated linear interpolation . This
curve will be a vector-valued function whose components are poly nomials of degree n − 1,
and its formula is given by de Casteljau’s algorithm .2 In the exercises, the reader will be
given the algorithm for the case of n = 4 points and asked to write the explicit formula for
the Bézier curve for the four points shown in Figure 2.1.5.
Example 2.7. The pedal curve is traced by the orthogonal projection of a ﬁxed point P on
the tangent lines of a given curve f(t).
Write a parametric expression h(t) for the pedal curve for the unit circle f(t) = (cos(t), sin t)
and the point P = (1, 0), so its position vector is i. (This curve is called cardioid.)
2See pp. 27–30 in F ARIN .


## Page 71

2.1 Vector-Valued Functions 63
P
Denote by w(t) the projection of v(t) = i − f(t) to the tangent line at
f(t), so h(t) = f(t) + w(t).
The velocity vector f′(t) = (− sin t, cos t) is parallel to the tangent line
at f(t).
Note that ∥f′(t)∥ = 1 for any t. Therefore the vector w(t) can be
found useing the following formula (compare to Example 1.27 and Ex-
ercise 25, on page 20)
w(t) = (f′(t) ·v(t)) f′(t)
= (f′(t) ·(i − f(t))) f′(t)
= (sin2 t, − sin t cos t).
and
h(t) = f(t) + w(t)
= (cos t + sin2 t, sin t − sin t cos t).
Exercises
A
For Exercises 1–4, calculate f′(t) and ﬁnd the tangent line at f(0).
1. f (t) = (t + 1, t2 + 1, t3 + 1); 2. f (t) = (et + 1, e2t + 1, et2
+ 1);
3. f (t) = (cos 2t, sin 2t, t); 4. f (t) = (sin 2t, 2 sin2 t, 2 cost).
For Exercises 5–6, ﬁnd the velocity v(t) and acceleration a(t) of an object with the given
position vector r(t).
5. r (t) = (t, t − sin t, 1 − cos t); 6. r (t) = (3 cost, 2 sint, 1).
B
7. Let f(t) =
( cos t
/∇adicallow
1 + a2t2
, sin t/∇adicallow
1 + a2t2
, − at/∇adicallow
1 + a2t2
)
, with a ̸= 0.
(a) Show that ∥f(t)∥ = 1 for all t.
(b) Show directly that f′(t) ···f(t) = 0 for all t.
8. If f′(t) = 0 for all t in some interval ( a, b), show that f(t) is a constant vector in ( a, b).
9. For a constant vector c ̸= 0, the function f(t) = tc represents a line parallel to c.
(a) What kind of curve does g(t) = t3c represent? Explain.
(b) What kind of curve does h(t) = etc represent? Explain.


## Page 72

64 CHAPTER 2. CURVES
(c) Compare f′(0) and g′(0). Given your answer to part (a), how do you explain the differ-
ence in the two derivatives?
10. Show that
d
dt
(
f ××× df
dt
)
= f ××× d2f
dt 2 .
11. Let a particle of (constant) mass m have position vector r(t), velocity v(t), acceleration
a(t) and momentum p(t) at time t. The angular momentum L(t) of the particle with
respect to the origin at time t is deﬁned as L(t) = r(t) ××× p(t). If F(t) is the force acting on
the particle at time t, then deﬁne the torque N(t) acting on the particle with respect to
the origin as N(t) = r(t) ××× F(t). Show that L′(t) = N(t).
12. Show that d
dt (f ···(g ××× h)) = df
dt ···(g ××× h) + f ···
(dg
dt ××× h
)
+ f ···
(
g ××× dh
dt
)
.
13. The Mean Value Theorem does not hold for vector-valued functi ons: Show that for f(t) =
(cos t, sin t, t), there is no t in the interval (0 , 2π) such that
f′(t) = f(2π) − f(0)
2π − 0 .
14. Wrie a parametric equation for the pedal curve to f(t) = (t, t2, t3) with respect to the
origin.
C
15. The Bézier curve b3
0(t) for four noncollinear points b0, b1, b2, b3 in R3 is deﬁned by the
following algorithm (going from the left column to the right) :
b
1
0(t) = (1 − t)b0 + tb1,
b
1
1(t) = (1 − t)b1 + tb2, b
2
0(t) = (1 − t)b
1
0(t) + tb
1
1(t),
b
1
2(t) = (1 − t)b2 + tb3. b
2
1(t) = (1 − t)b
1
1(t) + tb
1
2(t), b
3
0(t) = (1 − t)b
2
0(t) + tb
2
1(t).
(a) Show that b3
0(t) = (1 − t)3b0 + 3t(1 − t)2b1 + 3t2(1 − t)b2 + t3b3.
(b) Write the explicit formula (as in Example 2.6) for the Bézie r curve for the points
b0 = (0, 0, 0), b1 = (0, 1, 1), b2 = (2, 3, 0), b3 = (4, 5, 2).
16. Let r(t) be the position vector for a particle moving in R3, v(t) be its velocity and a(t) be
its acceleration. Show that
d
dt (r ××× (v ××× r)) = ∥ r∥2a + (r ···v)v − (∥v∥2 + r ···a)r.
17. Let r(t) be the position vector in R3 for a particle that moves with constant speed c > 0 in
a circle of radius a > 0 centered at the origin in the x y-plane. Show that its acceleration
a(t) points in the opposite direction as r(t) for all t. ( Hint: Use Example 2.3 to show that
r(t) ⊥ v(t) and a(t) ⊥ v(t), and hence a(t) ∥ r(t).)


## Page 73

2.1 Vector-Valued Functions 65
18. Prove Theorem 2.1(g).
19. Show that there is no plane which is tangent3 to the curve f(t) = (t, t2, t3) at two distinct
points.
00.511.522.533.54
0 1 2 3 4 5
0
0.5
1
1.5
2
z
x
y
z
(0, 0, 0)
(0, 1, 1)
(2, 3, 0)
(4, 5, 2)
Figure 2.1.5 Bézier curve approximation for four points.
3A plane is called tangent to a curve f(t) at point f(t0) it it contains the tangent line at f(t0).


## Page 74

66 CHAPTER 2. CURVES
2.2 Arc Length
Deﬁnition 2.4. Let f(t) = (x(t), y(t), z(t)) be a curve in R3 whose domain includes the interval
[a, b]. Suppose that in the interval ( a, b) the ﬁrst derivative of each component function x(t),
y(t) and z(t) exists and is continuous. Then the arc length L of the curve from t = a to t = b
is
L =
b/dispvarint
a
∥f′(t)∥ dt =
b/dispvarint
a
√
x ′(t)2 + y ′(t)2 + z ′(t)2 dt. (2.1)
If f(t) = (x(t), y(t), z(t)) is the position vector of an object moving in R3 then its speed at time
t is ∥f′(t)∥, that is the magnitude of the velocity vector . Therefore it se ems natural to deﬁne
the distance s traveled by as the deﬁnite integral of its speed in the time inte rval (2.1).
Example 2.8. Find the length L of the helix f(t) = (cos t, sin t, t) from t = 0 to t = 2π.
Solution: By formula (2.1), we have
L =
2π/dispvarint
0
√
(− sin t)2 + (cos t)2 + 12 dt =
2π/dispvarint
0
√
sin2 t + cos2 t + 1 dt =
2π/dispvarint
0
/∇adicallow
2 dt
=
/∇adicallow
2(2π − 0) = 2
/∇adicallow
2π.
Notice that the set traced out by the curve f(t) = (cos t, sin t, t) from Example 2.8 is also
traced out by the function g(t) = (cos 2t, sin 2t, 2t). For example, over the interval [0 , π], g(t)
traces out the same section of the curve as f(t) does over the interval [0 , 2π]. Intuitively ,
this says that g(t) traces the curve twice as fast as f(t). This makes sense since, viewing the
functions as position vectors and their derivatives as veloci ty vectors, the speeds of f(t) and
g(t) are ∥f′(t)∥ =
/∇adicallow
2 and ∥g′(t)∥ = 2
/∇adicallow
2, respectively . We say that g(t) is a reparametrization
of curve f(t).
Deﬁnition 2.5. Let f(t) be a smooth curve in R3 deﬁned on an interval [ a, b], and let
α : [c, d] → [a, b] be a smooth one-to-one mapping of an interval [ c, d] onto [ a, b]. Then the
function g : [c, d] → R3 deﬁned by g(s) = f(α(s)) is a reparametrization of f(t) with param-
eter s. If the derivative of α does not vanish, we say that the reparametrization is regular
and g(s) is equivalent to f(t).
s t f(t)
[c, d] [ a, b] R3α f
g(s) = f(α(s)) = f(t)
Note that the differentiability of g(s) follows from a version of the Chain Rule for vector-
valued functions (the proof is left as an exercise):


## Page 75

2.2 Arc Length 67
Theorem 2.2. Chain Rule : If f(t) is a differentiable vector-valued function of t, and t =
α(s) is a differentiable scalar function of s, then g(s) = f(α(s)) is a differentiable vector-valued
function of s, and
dg
ds = df
dt
dt
ds or equivalently g′(s) = f′(α(s)) α ′(s) (2.2)
for any s where the composite function f(α(s)) is deﬁned.
Example 2.9. The following are all regular reparametrizations of one curve :
f(t) = (cos t, sin t, t) for t in [0, 2π],
g(s) = (cos 2s, sin 2s, 2s) for s in [0, π],
h(s) = (cos 2πs, sin 2πs, 2πs) for s in [0, 1].
To see that g(s) is regular reparametrization of f(t), deﬁne α : [0, π] → [0, 2π] by α(s) = 2s.
Then α is smooth, one-to-one, maps [0 , π] onto [0 , 2π], and is strictly increasing (since α ′(s) =
2 > 0 for all s). Likewise, deﬁning α : [0, 1] → [0, 2π] by α(s) = 2πs shows that h(s) is regular
reparametrization of f(t).
A curve can be reparametrized, with different speeds, so which one is the best to use? In
some situations the arc length parametrization can be useful. The idea behind this is to
replace the parameter t, for any given smooth parametrization f(t) deﬁned on [ a, b], by the
parameter s given by
s = s(t) =
t/dispvarint
a
∥f′(u)∥ du. (2.3)
In terms of motion along a curve, s is the distance traveled along the curve after time t
has elapsed. So the new parameter will be distance instead of time. There is a natural
correspondence between s and t: from a starting point on the curve, the distance traveled
along the curve (in one direction) is uniquely determined by th e amount of time elapsed, and
vice versa.
Since s is the arc length of the curve over the interval [ a, t] for each t in [ a, b], then it is a
function of t. By the Fundamental Theorem of Calculus, its derivative is
s ′(t) = ds
dt = d
dt
t/dispvarint
a
∥f′(u)∥ du = ∥ f′(t)∥ for all t in [a, b].
Since f(t) is smooth, then ∥f′(t)∥ > 0 for all t in [ a, b]. Thus s ′(t) > 0 and hence s(t) is strictly
increasing on the interval [ a, b]. Recall that this means that s is a one-to-one mapping of the
interval [a, b] onto the interval [ s(a), s(b)]. But we see that
s(a) =
a/dispvarint
a
∥f′(u)∥ du = 0 and s(b) =
b/dispvarint
a
∥f′(u)∥ du = L = arc length from t = a to t = b.


## Page 76

68 CHAPTER 2. CURVES
s t
[0, L] [a, b]
α(s)
s(t)
Figure 2.2.1 t = α(s)
So the function s : [a, b] → [0, L] is a one-to-one, differentiable
mapping onto the interval [0 , L]. From single-variable calculus,
we know that this means that there exists an inverse function
α : [0, L] → [a, b] that is differentiable and the inverse of s : [a, b] →
[0, L]. That is, for each t in [ a, b] there is a unique s in [0, L] such
that s = s(t) and t = α(s). And we know that the derivative of α is
α ′(s) = 1
s ′(α(s)) = 1
∥f′(α(s))∥ .
So deﬁne the arc length parametrization g : [0, L] → R3 by
g(s) = f(α(s)) for all s in [0, L].
Then g(s) is smooth, by the Chain Rule. In fact, g(s) has unit speed:
g′(s) = f′(α(s)) α ′(s) by the Chain Rule, so
= f′(α(s)) 1
∥f′(α(s))∥ , so
∥g′(s)∥ = 1 for all s in [0, L].
So the arc length parametrization traverses the curve at a “no rmal” rate.
In practice, parametrizing a curve f(t) by arc length requires you to evaluate the integral
s =
/varintt
a ∥f′(u)∥ du explicitly as a function of t, so that you could then solve for t in terms of s.
If that can be done, you would then substitute the expression for t in terms of s (which we
called α(s)) into the formula for f(t) to get g(s) = f(α(s)).
Example 2.10. Parametrize the helix f(t) = (cos t, sin t, t), for t in [0, 2π], by arc length.
Solution: By Example 2.8 and formula (2.3), we have
s =
t/dispvarint
0
∥f′(u)∥ du =
t/dispvarint
0
/∇adicallow
2 du =
/∇adicallow
2 t for all t in [0, 2π].
So we can solve for t in terms of s: t = α(s) = s/∇adicallow
2
.
∴ g(s) =
(
cos s/∇adicallow
2
, sin s/∇adicallow
2
, s/∇adicallow
2
)
for all s in [0, 2
/∇adicallow
2π]. Note that ∥g′(s)∥ = 1.
Exercises
A
For Exercises 1–3, calculate the arc length of f(t) over the given interval.
1. f (t) = (3 cos 2t, 3 sin 2t, 3t) on [0 , π/2];


## Page 77

2.2 Arc Length 69
2. f (t) = ((t2 + 1) cost, (t2 + 1) sint, 2
/∇adicallow
2t) on [0 , 1];
3. f (t) = (2 cos 3t, 2 sin 3t, 2t3/2) on [0 , 1].
4. Parametrize the curve from Exercise 1 by arc length.
5. Parametrize the curve from Exercise 3 by arc length.
B
6. Assume that g(s) is a regular reparametrization of f(t). Show that both curves have the
same length.
7. Let f(t) be a differentiable curve such that f(t) ̸= 0 for all t. Show that
d
dt
( f(t)
f(t)


)
= f(t) ××× (f′(t) ××× f(t))
∥f(t)∥3 .
8. Show that the arc length L of a curve whose spherical coordinates are ρ = ρ(t), θ = θ(t)
and φ = φ(t) for t in an interval [ a, b] is
L =
b/dispvarint
a
√
ρ ′(t)2 + (ρ(t)2 sin2 φ(t)) θ ′(t)2 + ρ(t)2φ ′(t)2 dt.
(Hint: Convert the data in Cartesian coordinates.)
9. Let f(t) be a smooth curve. The pedal curve of f(t) is traced by the orthogonal projections
of the origin on the tangent lines to f. Write a parametric equation for the pedal curve
h(t) for the given smooth curve f(t).
C
10. Assume that the trajectory of the back wheel of an ideal bicycle is given by smooth plane
curve b(t), here t denotes time. We assume that in the ideal bicycle the distance fr om back
wheel and front wheel is ﬁxed, let us denote it by R and the back wheel always moves in
the direction to the front wheel.
(a) Write an expression for the trajectory of the front wheel f(t).
(b) Show that the speed of the back wheel can not exceed the speed o f the front wheel.


## Page 78

70 CHAPTER 2. CURVES
2.3 Curvature
In the ﬁeld of mathematics known as differential geometry 4 special attention is given to the
parametrization-independent constructions. For example, dependi ng on the parametriza-
tion, the velocity vector of the curve at given point can be mul tiplied by a scalar , so it
is not parametrization-independent; on the other hand the tange nt line at given point is
parametrization-independent — although it is deﬁned using parame trization the resulting
line is the same.
An other example is so called osculating plane . Given a smooth regular curve f, its oscu-
lating plane at f(t) is the plane passing thru f(t) and containing the velocity vector f′(t) and
the acceleration f′′(t). The osculating plane is deﬁned if f′(t) is not parallel to f′′(t). Note that
in this case the cross product f′(t) ××× f′′(t) is perpendicular to the osculating plane. Therefore
the equation of the osculating plane at f(t) can be written as
(x − f(t)) ···(f′(t) ××× f′′(t)) = 0
with the unknown x.
Example 2.11. Let us show that osculating plane does at given point does not depend on the
parametrization. That is, if g(s) = f(α(s)) is a regular reparametrization then the plane thru
g(s) and containing the velocity vector g′(s) and the acceleration g′′(s) is the same as the
plane thru f(t) and containing the velocity vector f′(t) and the acceleration f′′(t) for t = α(s).
Since f(t) = g(s), we only need to show that f′(t) ××× f′′(t) ∥ g′(s) ××× g′′(s).
By chain rule
g′(s) = f′(α(s))α ′(s)
and by chain rule again
g′′(s) = f′′(α(s))α ′(s)2 + f′(α(s))α ′′(s).
Since f′××× f′= 0 and t = α(s) we get
g′(s) ××× g′′(s) = f′(t)α ′(s) ××× (f′′(t)α ′(s)2 + f′(t)α ′′(s))
= α ′(s)3f′(t) ××× f′′(t).
Since the reparametrization is regular , α ′(s) ̸= 0. Therefore f′(t) ××× f′′(t) ∥ g′(s) ××× g′′(s) as re-
qured.
Y et an other example is so called curvature. Assume a smooth regular curve g has arc
length parametrization. Note that if g parametrize a straight line then g′(s) is a constant
unit vector and therefore g′′(s) = 0 at all points. Therefore the value κ(s) = ∥ g′′(s)∥ can be
used to measure how fast the curve deviates from the straight l ine. The value κ(s) and the
vector g′′(s) are called curvature and curvature vector of the curve g at the point g(s).
4See O’N EILL for an introduction to elementary differential geometry .


## Page 79

2.3 Curvature 71
If κ(s) ̸= 0 then the value R(s) = 1
κ(s) is called curvature radius of g at the point g(s). It
is called this way since the best approximation of the curve g at the point g(s) by a circle,
so called osculating circle , has radius R(s). This circle is lying in the osculating plane, its
center lies in the direction of curvature vector g′′(s) from g(s) on the distance R(s). If κ(s) = 0
then the osculating circle degenerates to the tangent line.
The osculating circle to the sinusoid at two points.
Assume you want to ﬁnd the curvature of the given curve using t he deﬁnition above. Then
you ﬁrst have to ﬁnd the arc length parametrization and then appl y the formula above at the
given point. Finding this parametrization often leads to an inte gral that is either difﬁcult or
impossible to evaluate explicitly . The simple integral in Exam ple 2.10 is the exception, not
the norm. In general, arc length parametrizations are more us eful for theoretical purposes
than for practical computations. 5
The following theorem provides a direct way to calculate the curv ature, without passing
to the reparametrization. Exercises 9 guides you through simi lar calculations.
Theorem 2.3. The curvature κ of a smooth curve f at the point f(t) can be found using the
following formula:
κ = ∥f′′(t) ××× f′(t)∥
∥f′(t)∥3 . (2.4)
Proof: Let g(s) be the arc length parametrization of f(t); in particular ∥g′(s)∥ = 1 for any s.
As above, we assume t = α(s) and therefore g(s) = f(α(s)) and α ′(s) = 1
∥f′(t)∥ .
5For example, the usual parametrizations of Bézier curves, whi ch we discussed in Section 1.8, are polynomial
functions in R3. This makes their computation relatively simple, which, in Com puter-aided design, is desir-
able. But their arc length parametrizations are not only not polynomials, they are in fact usually impossible to
calculate at all.


## Page 80

72 CHAPTER 2. CURVES
Applying Chain and Product Rules, we get
g′′(s) = f (α(s))′′
=
(
f′(α(s))α ′(s)
)′
= f′′(α(s))(α ′(s))2 + f′(α(s))α ′′(s)
= f′′(t)
∥f′(t)∥2 + f′(t)α ′′(s),
Since f′(t) ××× f′(t) = 0, we get
f′′(t) ××× f′(t)
∥f′(t)∥3 =
( f′′(t)
∥f′(t)∥2 + f′(t)α ′′(s)
)
××× f′(t)
∥f′(t)∥
= g′′(s) ××× g′(s).
Since ∥g′(s)∥ = 1, we have
0 = (g′(s) ···g′(s))′= 2 g′′(s) ···g′(s).
That is, g′′(s) ⊥ g′(s) for any s. Since ∥g′(s)∥ = 1, we can continue
∥f′′(t) ××× f′(t)∥
∥f′(t)∥3 = ∥ g′′(s) ××× g′(s)∥
= ∥ g′′(s)∥ ∥g′(s)∥
= κ.
QED
Exercises
A
For Exercises 1–4, ﬁnd the tangent line, the osculating plane and the curvature at each point
of the curve f(t).
1. f (t) = (cos t, sin t, t); 2. f (t) = (t, t2, t3);
3. f (t) = (t sin t, t cos t); 4. f (t) = (et sin t, et cos t).
B
5. Let f(t) be a smooth regular curve and g(s) = f(α(s)) be its regular reparametrization.
Show that the osculating plane of f at f(t) coinsides with the osculating plane of g at g(s)
if t = α(s).


## Page 81

2.3 Curvature 73
6. Let f(t) be a smooth regular curve; in particular , f′(t) ̸= 0 for all t. Then we can deﬁne the
unit tangent vector T by
T(t) = f′(t)
∥f′(t)∥ .
(a) Show that
T′(t) = f′(t) ××× (f′′(t) ××× f′(t))
∥f′(t)∥3 .
(b) Use this formula to get an other proof of Theorem 2.3.
7. Let g(s) be a smooth curve with arc length parametrization and κ(s) be its curvature.
Show that
g′′′(s) ···g′(s) = − κ(s)2.
8. Let g be a smooth plane curve with arc length parametrization. The cur ve
h(s) = g(s) − sg′(s)
is called involute of g(s).
(a) Show that
∥h′(s)∥ = s κ(s)
where κ(s) is curvature of g at g(s)
(b) Show that the curvature of h at h(s) equals to 1
s for s > 0. ( Hint: Use Exercise 7. )
C
9. Let f(t) be a smooth curve in the plane. Assume its curvature κ(t) is increasing in t. Show
that the curve has no self-intersections; that is, if t0 ̸= t1 then f(t0) ̸= f(t1). ( Hint: Write an
expression for the center and radius of the osculating circles and use it to show that they
do not intersect each other .


## Page 82

3 Functions of Several Variables
3.1 Functions of Two or Three Variables
In Section 1.8 we discussed vector-valued functions of a singl e real variable. We will now
examine real-valued functions of a point (or vector) in R2 or R3. For the most part these
functions will be deﬁned on sets of points in R2, but there will be times when we will use
points in R3, and there will also be times when it will be convenient to think o f the points as
vectors (or terminal points of vectors).
A real-valued function f deﬁned on a subset D of R2 is a rule that assigns to each point
(x, y) in D a real number f (x, y). The largest possible set D in R2 on which f is deﬁned is
called the domain of f , and the range of f is the set of all real numbers f (x, y) as ( x, y)
varies over the domain D. A similar deﬁnition holds for functions f (x, y, z) deﬁned on points
(x, y, z) in R3.
Example 3.1. The domain of the function
f (x, y) = x y
is all of R2, and the range of f is all of R.
Example 3.2. The domain of the function
f (x, y) = 1
x − y
is all of R2 except the points ( x, y) for which x = y. That is, the domain is the set D = {(x, y) :
x ̸= y}. The range of f is all real numbers except 0.
Example 3.3. The domain of the function
f (x, y) =
√
1 − x2 − y2
is the set D = {(x, y) : x2 + y2 ≤ 1}, since the quantity inside the square root is nonnegative if
and only if 1 − (x2 + y2) ≥ 0. We see that D consists of all points on and inside the unit circle
in R2 (D is sometimes called the closed unit disk ). The range of f is the interval [0 , 1] in R.
74


## Page 83

3.1 Functions of Two or Three Variables 75
Example 3.4. The domain of the function
f (x, y, z) = ex+ y− z
is all of R3, and the range of f is all positive real numbers.
A function f (x, y) deﬁned in R2 is often written as z = f (x, y), as was mentioned in Section
1.1, so that the graph of f (x, y) is the set {(x, y, z) : z = f (x, y)} in R3. So we see that this
graph is a surface in R3, since it satisﬁes an equation of the form F(x, y, z) = 0 (namely ,
F(x, y, z) = f (x, y) − z). The traces of this surface in the planes z = c, where c varies over R,
are called the level curves of the function. Equivalently , the level curves are the solu tion
sets of the equations f (x, y) = c, for c in R. Level curves are often projected onto the x y-plane
to give an idea of the various “elevation” levels of the surfac e (as is done in topography).
Example 3.5. The graph of the function
f (x, y) = sin
√
x2 + y2
√
x2 + y2
is shown below . Note that the level curves (shown both on the sur face and projected onto the
x y-plane) are groups of concentric circles.
Y ou may be wondering what happens to the function in Example 3.5 at th e point ( x, y) =
(0, 0), since both the numerator and denominator are 0 at that point . The function is not
deﬁned at (0 , 0), but the limit of the function exists (and equals 1) as ( x, y) approaches (0, 0).
We will now state explicitly what is meant by the limit of a functi on of two variables.
Deﬁnition 3.1. Let ( a, b) be a point in R2, and let f (x, y) be a real-valued function deﬁned
on some set containing ( a, b) (but not necessarily deﬁned at ( a, b) itself). Then we say that
the limit of f (x, y) equals L as ( x, y) approaches ( a, b), written as
lim
(x,y)→ (a,b)
f (x, y) = L , (3.1)
if given any ǫ> 0, there exists a δ > 0 such that
| f (x, y) − L| < ǫ whenever 0 <
√
(x − a)2 + (y − b)2 < δ.
A similar deﬁnition can be made for functions of three variable s. The idea behind the
above deﬁnition is that the values of f (x, y) can get arbitrarily close to L (that is, within ǫ
of L) if we pick ( x, y) sufﬁciently close to ( a, b) (that is, inside a circle centered at ( a, b) with
some sufﬁciently small radius δ).
If you recall the “epsilon-delta” proofs of limits of real-valu ed functions of a single variable,
you may remember how awkward they can be, and how they can usual ly only be done easily


## Page 84

76 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
-10
-5
0
5
10
-10
-5
0
5
10
-0.4
-0.2
0
0.2
0.4
0.6
0.8
1
z
x
y
z
Figure 3.1.1 The function f (x, y) = sin
/∇adicallow
x2+ y2
/∇adicallow
x2+ y2 .
for simple functions. In general, the multivariable cases ar e at least equally awkward to go
through, so we will not bother with such proofs. Instead, we will simpl y state that when the
function f (x, y) is given by a single formula and is deﬁned at the point ( a, b) (for example,
is not some indeterminate form like 0/0) then you can just subs titute ( x, y) = (a, b) into the
formula for f (x, y) to ﬁnd the limit.
Example 3.6.
lim
(x,y)→ (1,2)
x y
x2 + y2 = (1)(2)
12 + 22 = 2
5
since f (x, y) = x y
x2+ y2 is properly deﬁned at the point (1 , 2).
The major difference between limits in one variable and limits in two or more variables
has to do with how a point is approached. In the single-variable case , the statement “ x → a”
means that x gets closer to the value a from two possible directions along the real number
line (see Figure 3.1.2(a)). In two dimensions, however , ( x, y) can approach a point ( a, b) along
an inﬁnite number of paths (see Figure 3.1.2(b)).
Example 3.7.
lim
(x,y)→ (0,0)
x y
x2 + y2 does not exist


## Page 85

3.1 Functions of Two or Three Variables 77
0 xa
x x
(a) x → a in R
x
y
0
(a, b)
(b) (x, y) → (a, b) in R2
Figure 3.1.2 “Approaching” a point in different dimensions.
Note that we can not simply substitute ( x, y) = (0, 0) into the function, since doing so gives an
indeterminate form 0/0. To show that the limit does not exist, we will show that the function
approaches different values as ( x, y) approaches (0, 0) along different paths in R2. To see this,
suppose that ( x, y) → (0, 0) along the positive x-axis, so that y = 0 along that path. Then
f (x, y) = x y
x2 + y2 = x0
x2 + 02 = 0
along that path (since x > 0 in the denominator). But if ( x, y) → (0, 0) along the straight line
y = x through the origin, for x > 0, then we see that
f (x, y) = x y
x2 + y2 = x2
x2 + x2 = 1
2 ,
which means that f (x, y) approaches different values as ( x, y) → (0, 0) along different paths.
Hence the limit does not exist.
Limits of real-valued multivariable functions obey the sam e algebraic rules as in the
single-variable case, as shown in the following theorem, which we state without proof.
Theorem 3.1. Suppose that lim
(x,y)→ (a,b)
f (x, y) and lim
(x,y)→ (a,b)
g(x, y) both exist, and that k is
some scalar . Then:
(a) lim
(x,y)→ (a,b)
[ f (x, y) ± g(x, y)] =
[
lim
(x,y)→ (a,b)
f (x, y)
]
±
[
lim
(x,y)→ (a,b)
g(x, y)
]
;
(b) lim
(x,y)→ (a,b)
k f (x, y) = k
[
lim
(x,y)→ (a,b)
f (x, y)
]
;
(c) lim
(x,y)→ (a,b)
[ f (x, y)g(x, y)] =
[
lim
(x,y)→ (a,b)
f (x, y)
][
lim
(x,y)→ (a,b)
g(x, y)
]
;
(d) lim
(x,y)→ (a,b)
f (x, y)
g(x, y) =
lim
(x,y)→ (a,b)
f (x, y)
lim
(x,y)→ (a,b)
g(x, y) if lim
(x,y)→ (a,b)
g(x, y) ̸= 0;
(e) If | f (x, y) − L| ≤ g(x, y) for all ( x, y) and if lim
(x,y)→ (a,b)
g(x, y) = 0, then lim
(x,y)→ (a,b)
f (x, y) = L.


## Page 86

78 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Note that in part (e), it sufﬁces to have | f (x, y) − L| ≤ g(x, y) for all ( x, y) “sufﬁciently close”
to (a, b) (but excluding ( a, b) itself).
Example 3.8. Show that
lim
(x,y)→ (0,0)
y4
x2 + y2 = 0.
Since substituting ( x, y) = (0, 0) into the function gives the indeterminate form 0/0, we need
an alternate method for evaluating this limit. We will use The orem 3.1(e). First, notice that
y4 =
(√
y2)4 and so 0 ≤ y4 ≤
(√
x2 + y2)4 for all ( x, y). But
(√
x2 + y2)4 = (x2 + y2)2. Thus, for
all ( x, y) ̸= (0, 0) we have
⏐
⏐
⏐
⏐
y4
x2 + y2
⏐
⏐
⏐
⏐ ≤ (x2 + y2)2
x2 + y2 = x2 + y2 → 0 as ( x, y) → (0, 0).
Therefore, lim
(x,y)→ (0,0)
y4
x2 + y2 = 0.
Continuity can be deﬁned similarly as in the single-variable case.
Deﬁnition 3.2. A real-valued function f (x, y) with domain D in R2 is continuous at the
point ( a, b) in D if lim
(x,y)→ (a,b)
f (x, y) = f (a, b). We say that f (x, y) is a continuous function if
it is continuous at every point in its domain D.
Unless indicated otherwise, you can assume that all the functi ons we deal with are con-
tinuous. In fact, we can modify the function from Example 3.8 so t hat it is continuous on all
of R2.
Example 3.9. Deﬁne a function f (x, y) on all of R2 as follows:
f (x, y) =





0 if ( x, y) = (0, 0)
y4
x2 + y2 if ( x, y) ̸= (0, 0)
Then f (x, y) is well-deﬁned for all ( x, y) in R2 (that is, there are no indeterminate forms for
any ( x, y)), and we see that
lim
(x,y)→ (a,b)
f (x, y) = b4
a2 + b2 = f (a, b) for ( a, b) ̸= (0, 0).
So since
lim
(x,y)→ (0,0)
f (x, y) = 0 = f (0, 0) by Example 3.8,
then f (x, y) is continuous on all of R2.
Exercises
A
For Exercises 1–6, state the domain and range of the given func tion.


## Page 87

3.1 Functions of Two or Three Variables 79
1. f (x, y) = x2 + y2 − 1; 2. f (x, y) = 1
x2 + y2 ;
3. f (x, y) =
√
x2 + y2 − 4; 4. f (x, y) = x2 + 1
y ;
5. f (x, y, z) = sin(x yz); 6. f (x, y, z) =
√
(x − 1)(yz − 1).
For Exercises 7–18, evaluate the given limit.
7. lim
(x,y)→ (0,0)
cos(x y); 8. lim
(x,y)→ (0,0)
ex y;
9. lim
(x,y)→ (0,0)
x2 − y2
x2 + y2 ; 10. lim
(x,y)→ (0,0)
x y2
x2 + y4 ;
11. lim
(x,y)→ (1,− 1)
x2 − 2x y+ y2
x − y ; 12. lim
(x,y)→ (0,0)
x y2
x2 + y2 ;
13. lim
(x,y)→ (1,1)
x2 − y2
x − y ; 14. lim
(x,y)→ (0,0)
x2 − 2x y+ y2
x − y ;
15. lim
(x,y)→ (0,0)
y4 sin(x y)
x2 + y2 ; 16. lim
(x,y)→ (0,0)
(x2 + y2) cos
( 1
x y
)
;
17. lim
(x,y)→ (0,0)
x
y ; 18. lim
(x,y)→ (0,0)
cos
( 1
x y
)
.
B
19. Show that f (x, y) = 1
2πσ 2 e− (x2+ y2)/2σ 2
, for σ > 0, is constant on the circle of radius r > 0
centered at the origin. This function is called a Gaussian blur , and is used as a ﬁlter in
image processing software to produce a “blurred” effect.
20. Suppose that f (x, y) ≤ f (y, x) for all ( x, y) in R2. Show that f (x, y) = f (y, x) for all ( x, y) in
R2.
21. Use the substitution r =
√
x2 + y2 to show that
lim
(x,y)→ (0,0)
sin
√
x2 + y2
√
x2 + y2
= 1 .
(Hint: Y ou will need to use L ’Hôpital’s Rule for single-variable limits .)
C
22. Prove Theorem 3.1(a) in the case of addition. ( Hint: Use Deﬁnition 3.1. )
23. Prove Theorem 3.1(b).


## Page 88

80 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
3.2 Partial Derivatives
Now that we have an idea of what functions of several variables ar e, and what a limit of
such a function is, we can start to develop an idea of a derivative o f a function of two or more
variables. We will start with the notion of a partial derivative.
Deﬁnition 3.3. Let f (x, y) be a real-valued function with domain D in R2, and let ( a, b) be
a point in D. Then the partial derivative of f at ( a, b) with respect to x, denoted by
∂f
∂x (a, b), is deﬁned as
∂f
∂x (a, b) = lim
h→ 0
f (a + h, b) − f (a, b)
h (3.2)
and the partial derivative of f at (a, b) with respect to y, denoted by ∂f
∂y (a, b), is deﬁned
as
∂f
∂y (a, b) = lim
h→ 0
f (a, b + h) − f (a, b)
h . (3.3)
Note: The symbol ∂ is pronounced “del”. 1
Recall that the derivative of a function f (x) can be interpreted as the rate of change of
that function in the (positive) x direction. From the deﬁnitions above, we can see that the
partial derivative of a function f (x, y) with respect to x or y is the rate of change of f (x, y) in
the (positive) x or y direction, respectively . What this means is that the partial der ivative of
a function f (x, y) with respect to x can be calculated by treating the y variable as a constant,
and then simply differentiating f (x, y) as if it were a function of x alone, using the usual
rules from single-variable calculus. Likewise, the partial de rivative of f (x, y) with respect to
y is obtained by treating the x variable as a constant and then differentiating f (x, y) as if it
were a function of y alone.
Example 3.10. Find ∂f
∂x (x, y) and ∂f
∂y (x, y) for the function f (x, y) = x2 y + y3.
Solution: Treating y as a constant and differentiating f (x, y) with respect to x gives
∂f
∂x (x, y) = 2x y
and treating x as a constant and differentiating f (x, y) with respect to y gives
∂f
∂y (x, y) = x2 + 3y2 .
We will often simply write ∂f
∂x and ∂f
∂y instead of ∂f
∂x (x, y) and ∂f
∂y (x, y).
1It is not a Greek letter . The symbol was ﬁrst used by the mathematic ians A. Clairaut and L. Euler around
1740, to distinguish it from the letter d used for the “usual” derivative.


## Page 89

3.2 Partial Derivatives 81
Example 3.11. Find ∂f
∂x and ∂f
∂y for the function f (x, y) = sin(x y2)
x2 + 1 .
Solution: Treating y as a constant and differentiating f (x, y) with respect to x gives
∂f
∂x = (x2 + 1)(y2 cos(x y2)) − (2x) sin(x y2)
(x2 + 1)2
and treating x as a constant and differentiating f (x, y) with respect to y gives
∂f
∂y = 2x y cos(x y2)
x2 + 1 .
Since both ∂f
∂x and ∂f
∂y are themselves functions of x and y, we can take their partial
derivatives with respect to x and y. This yields the higher-order partial derivatives:
∂2 f
∂x2 = ∂
∂x
(∂f
∂x
)
, ∂2 f
∂y2 = ∂
∂y
(∂f
∂y
)
,
∂2 f
∂y ∂x = ∂
∂y
(∂f
∂x
)
, ∂2 f
∂x ∂y = ∂
∂x
(∂f
∂y
)
,
∂3 f
∂x3 = ∂
∂x
(∂2 f
∂x2
)
, ∂3 f
∂y3 = ∂
∂y
(∂2 f
∂y2
)
,
∂3 f
∂y ∂x2 = ∂
∂y
(∂2 f
∂x2
)
, ∂3 f
∂x ∂y2 = ∂
∂x
(∂2 f
∂y2
)
,
∂3 f
∂y2 ∂x = ∂
∂y
( ∂2 f
∂y ∂x
)
, ∂3 f
∂x2 ∂y = ∂
∂x
( ∂2 f
∂x ∂y
)
,
∂3 f
∂x ∂y ∂x = ∂
∂x
( ∂2 f
∂y ∂x
)
, ∂3 f
∂y ∂x ∂y = ∂
∂y
( ∂2 f
∂x ∂y
)
,
.
.
.Example 3.12. Find the partial derivatives ∂f
∂x , ∂f
∂y , ∂2 f
∂x2 , ∂2 f
∂y2 , ∂2 f
∂y ∂x and ∂2 f
∂x ∂y for the
function f (x, y) = ex2 y + x y3.


## Page 90

82 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Solution: Proceeding as before, we have
∂f
∂x = 2x yex2 y + y3, ∂f
∂y = x2 ex2 y + 3x y2,
∂2 f
∂x2 = ∂
∂x (2x yex2 y + y3) ∂2 f
∂y2 = ∂
∂y (x2 ex2 y + 3x y2)
= 2ye x2 y + 4x2 y2 ex2 y, = x4 ex2 y + 6x y,
∂2 f
∂y ∂x = ∂
∂y (2x yex2 y + y3) ∂2 f
∂x ∂y = ∂
∂x (x2 ex2 y + 3x y2)
= 2xe x2 y + 2x3 ye x2 y + 3y2, = 2xe x2 y + 2x3 ye x2 y + 3y2.
Higher-order partial derivatives that are taken with respect to dif ferent variables, such
as ∂2 f
∂y ∂x and ∂2 f
∂x ∂y , are called mixed partial derivatives . Notice in the above example that
∂2 f
∂y ∂x = ∂2 f
∂x ∂y . It turns that this will usually be the case. Speciﬁcally , whene ver both ∂2 f
∂y ∂x and
∂2 f
∂x ∂y are continuous at a point ( a, b), then they are equal at that point. 2 All the functions
we will deal with will have continuous partial derivatives of all orde rs, so you can assume in
the remainder of the text that
∂2 f
∂y ∂x = ∂2 f
∂x ∂y for all ( x, y) in the domain of f .
In other words, it doesn’t matter in which order you take partial deriv atives. This applies
even to mixed partial derivatives of order 3 or higher .
The notation for partial derivatives varies. All of the followi ng are equivalent:
∂f
∂x : f x(x, y) , f1(x, y) , D x(x, y) , D1(x, y) ;
∂f
∂y : f y(x, y) , f2(x, y) , D y(x, y) , D2(x, y) ;
∂2 f
∂x2 : f xx(x, y) , f11(x, y) , D xx(x, y) , D11(x, y) ;
∂2 f
∂y2 : f y y(x, y) , f22(x, y) , D y y(x, y) , D22(x, y) ;
∂2 f
∂y ∂x : f x y(x, y) , f12(x, y) , D x y(x, y) , D12(x, y) ;
∂2 f
∂x ∂y : f yx(x, y) , f21(x, y) , D yx(x, y) , D21(x, y) .
2See pp. 214–216 in T AYLOR and M ANN for a proof.


## Page 91

3.2 Partial Derivatives 83
Exercises
A
For Exercises 1–16, ﬁnd ∂f
∂x and ∂f
∂y .
1. f (x, y) = x2 + y2; 2. f (x, y) = cos(x + y);
3. f (x, y) =
√
x2 + y + 4; 4. f (x, y) = x + 1
y + 1 ;
5. f (x, y) = ex y + x y; 6. f (x, y) = x2 − y2 + 6x y+ 4x − 8y + 2;
7. f (x, y) = x4; 8. f (x, y) = x + 2y;
9. f (x, y) =
√
x2 + y2; 10. f (x, y) = sin(x + y);
11. f (x, y) =
3√
x2 + y + 4; 12. f (x, y) = x y+ 1
x + y ;
13. f (x, y) = e− (x2+ y2); 14. f (x, y) = ln(x y);
15. f (x, y) = sin(x y); 16. f (x, y) = tan(x + y).
For Exercises 17–26, ﬁnd ∂2 f
∂x2 , ∂2 f
∂y2 and ∂2 f
∂y ∂x (use Exercises 1–8, 14, 15).
17. f (x, y) = x2 + y2; 18. f (x, y) = cos(x + y);
19. f (x, y) =
√
x2 + y + 4; 20. f (x, y) = x + 1
y + 1 ;
21. f (x, y) = ex y + x y; 22. f (x, y) = x2 − y2 + 6x y+ 4x − 8y + 2;
23. f (x, y) = x4; 24. f (x, y) = x + 2y;
25. f (x, y) = ln(x y); 26. f (x, y) = sin(x y).
B
27. Show that the function f (x, y) = sin(x + y) + cos(x − y) satisﬁes the wave equation
∂2 f
∂x2 − ∂2 f
∂y2 = 0 .
The wave equation is an example of a partial differential equation .
28. Let u and v be twice-differentiable functions of a single variable, and l et c ̸= 0 be a con-
stant. Show that f (x, y) = u(x + c y) + v(x − c y) is a solution of the general one-dimensional
wave equation 3
∂2 f
∂x2 − 1
c2
∂2 f
∂y2 = 0 .
3Conversely , it turns out that any solution must be of this form. See Ch. 1 in W EINBERGER .


## Page 92

84 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
3.3 Tangent Plane to a Surface
In the previous section we mentioned that the partial derivative s ∂f
∂x and ∂f
∂y can be thought
of as the rate of change of a function z = f (x, y) in the positive x and y directions, respectively .
Recall that the derivative d y
dx of a function y = f (x) has a geometric meaning, namely as the
slope of the tangent line to the graph of f at the point ( x, f (x)) in R2. There is a similar
geometric meaning to the partial derivatives ∂f
∂x and ∂f
∂y of a function z = f (x, y): given a
point ( a, b) in the domain D of f (x, y), the trace of the surface described by z = f (x, y) in the
plane y = b is a curve in R3 through the point ( a, b, f (a, b)), and the slope of the tangent line
L x to that curve at that point is ∂f
∂x (a, b). Similarly , ∂f
∂y (a, b) is the slope of the tangent line
L y to the trace of the surface z = f (x, y) in the plane x = a (see Figure 3.3.1).
y
z
x
0
(a, b)
D
L x
b
(a, b, f (a, b)) slope = ∂f
∂x (a, b)
z = f (x, y)
(a) Tangent line L x in the plane y = b
y
z
x
0
(a, b)
D
L y
a
(a, b, f (a, b))
slope = ∂f
∂y (a, b)
z = f (x, y)
(b) Tangent line L y in the plane x = a
Figure 3.3.1 Partial derivatives as slopes.
Since the derivative d y
dx of a function y = f (x) is used to ﬁnd the tangent line to the graph
of f (which is a curve in R2), you might expect that partial derivatives can be used to deﬁne
a tangent plane to the graph of a surface z = f (x, y). This indeed turns out to be the case.
First, we need a deﬁnition of a tangent plane. The intuitive idea i s that a tangent plane “just
touches” a surface at a point. The formal deﬁnition mimics the i ntuitive notion of a tangent
line to a curve.
Deﬁnition 3.4. Let z = f (x, y) be the equation of a surface S in R3, and let P = (a, b, c) be
a point on S. Let T be a plane which contains the point P, and let Q = (x, y, z) represent a
generic point on the surface S. If the (acute) angle between the vector − − →PQ and the plane
T approaches zero as the point Q approaches P along the surface S, then we call T the
tangent plane to S at P.
Note that since two lines in R3 determine a plane, then the two tangent lines to the surface
z = f (x, y) in the x and y directions described in Figure 3.3.1 are contained in the tang ent
plane at that point, if the tangent plane exists at that point . The existence of those two


## Page 93

3.3 Tangent Plane to a Surface 85
tangent lines does not by itself guarantee the existence of th e tangent plane. It is possible
that if we take the trace of the surface in the plane x − y = 0 (which makes a 45 ◦ angle with
the positive x-axis), the resulting curve in that plane may have a tangent li ne which is not
in the plane determined by the other two tangent lines, or it may n ot have a tangent line
at all at that point. Luckily , it turns out 4 that if ∂f
∂x and ∂f
∂y exist in a region around a point
(a, b) and are continuous at ( a, b) then the tangent plane to the surface z = f (x, y) will exist
at the point ( a, b, f (a, b)). In this text, those conditions will always hold.
y
z
x
0
(a, b, f (a, b))
z = f (x, y)
T
L x
L y
Figure 3.3.2 Tangent plane
Suppose that we want an equation of the tangent plane T
to the surface z = f (x, y) at a point ( a, b, f (a, b)). Let L x and
L y be the tangent lines to the traces of the surface in the
planes y = b and x = a, respectively (as in Figure 2.3.2), and
suppose that the conditions for T to exist do hold. Then the
equation for T is
A(x − a) + B(y − b) + C(z − f (a, b)) = 0 (3.4)
where n = (A, B, C) is a normal vector to the plane T. Since
T contains the lines L x and L y, then all we need are vectors vx and vy that are parallel to L x
and L y, respectively , and then let n = vx ××× vy.
x
z
0
vx = (1, 0, ∂f
∂x (a, b))
∂f
∂x (a, b)
1
Figure 3.3.3
Since the slope of L x is ∂f
∂x (a, b), then the vector vx = (1, 0, ∂f
∂x (a, b)) is
parallel to L x (since vx lies in the xz-plane and lies in a line with slope
∂f
∂x (a,b)
1 = ∂f
∂x (a, b). See Figure 2.3.3). Similarly , the vector
vy = (0, 1, ∂f
∂y (a, b)) is parallel to L y. Hence, the vector
n = vx ××× vy =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
i j k
1 0 ∂f
∂x (a, b)
0 1 ∂f
∂y (a, b)
⏐
⏐
⏐
⏐
⏐
⏐
⏐
= − ∂f
∂x (a, b) i − ∂f
∂y (a, b) j + k
is normal to the plane T. Thus the equation of T is
− ∂f
∂x (a, b) (x − a) − ∂f
∂y (a, b) (y − b) + z − f (a, b) = 0 . (3.5)
Multiplying both sides by − 1, we have the following result:
The equation of the tangent plane to the surface z = f (x, y) at the point ( a, b, f (a, b)) is
∂f
∂x (a, b) (x − a) + ∂f
∂y (a, b) (y − b) − z + f (a, b) = 0 (3.6)
Example 3.13. Find the equation of the tangent plane to the surface z = x2 + y2 at the point
(1, 2, 5).
4See T AYLOR and M ANN , § 6.4.


## Page 94

86 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Solution: For the function f (x, y) = x2 + y2, we have ∂f
∂x = 2x and ∂f
∂y = 2y, so the equation of
the tangent plane at the point (1 , 2, 5) is
2(1)(x − 1) + 2(2)(y − 2) − z + 5 = 0 , or
2x + 4y − z − 5 = 0 .
In a similar fashion, it can be shown that if a surface is deﬁned i mplicitly by an equation
of the form F(x, y, z) = 0, then the tangent plane to the surface at a point ( a, b, c) is given by
the equation
∂F
∂x (a, b, c) (x − a) + ∂F
∂y (a, b, c) (y − b) + ∂F
∂z (a, b, c) (z − c) = 0 . (3.7)
Note that formula (3.6) is the special case of formula (3.7) whe re F(x, y, z) = f (x, y) − z.
Example 3.14. Find the equation of the tangent plane to the surface x2 + y2 + z2 = 9 at the
point (2, 2, − 1).
Solution: For the function F(x, y, z) = x2 + y2 + z2 − 9, we have ∂F
∂x = 2x, ∂F
∂y = 2y, and ∂F
∂z = 2z,
so the equation of the tangent plane at (2 , 2, − 1) is
2(2)(x − 2) + 2(2)(y − 2) + 2(− 1)(z + 1) = 0 , or
2x + 2y − z − 9 = 0 .
Exercises
A
For Exercises 1–6, ﬁnd the equation of the tangent plane to the surface z = f (x, y) at the
point P.
1. f (x, y) = x2 + y3, P = (1, 1, 2); 2. f (x, y) = x y, P = (1, − 1, − 1);
3. f (x, y) = x2 y, P = (− 1, 1, 1); 4. f (x, y) = xe y, P = (1, 0, 1);
5. f (x, y) = x + 2y, P = (2, 1, 4); 6. f (x, y) =
√
x2 + y2, P = (3, 4, 5).
For Exercises 7–10, ﬁnd the equation of the tangent plane to th e given surface at the point
P.
7. x2
4 + y2
9 + z2
16 = 1, P =
(
1, 2, 2
/∇adicallow
11
3
)
; 8. x2 + y2 + z2 = 9, P = (0, 0, 3);
9. x2 + y2 − z2 = 0, P = (3, 4, 5); 10. x2 + y2 = 4, P = (
/∇adicallow
3, 1, 0).
B
11. Find the angles between the curve f(t) = (t, t2, t3) and the surface x6 + y3 + z2 = 3 at their
intersections.


## Page 95

3.4 Directional Derivatives and the Gradient 87
3.4 Directional Derivatives and the Gradient
For a function z = f (x, y), we learned that the partial derivatives ∂f
∂x and ∂f
∂y represent the
(instantaneous) rate of change of f in the positive x and y directions, respectively . What
about other directions? It turns out that we can ﬁnd the rate of c hange in any direction
using a more general type of derivative called a directional derivative.
Deﬁnition 3.5. Let f (x, y) be a real-valued function with domain D in R2, and let ( a, b) be a
point in D. Let v be a vector in R2. Then the directional derivative of f at ( a, b) in the
direction of v , denoted by Dv f (a, b), is deﬁned as
Dv f (a, b) = lim
h→ 0
f ((a, b) + hv) − f (a, b)
h . (3.8)
Notice in the deﬁnition that we seem to be treating the point ( a, b) as a vector , since we
are adding the vector hv to it. But this is just the usual idea of identifying vectors with their
terminal points, which the reader should be used to by now . If we wer e to write the vector v
as v = (v1, v2), then
Dv f (a, b) = lim
h→ 0
f (a + hv1, b + hv2) − f (a, b)
h . (3.9)
From this we can immediately recognize that the partial derivati ves ∂f
∂x and ∂f
∂y are special
cases of the directional derivative with v = i = (1, 0) and v = j = (0, 1), respectively . That is,
∂f
∂x = Di f and ∂f
∂y = Dj f .
If f (x, y) has continuous partial derivatives ∂f
∂x and ∂f
∂y (which will always be the case in
this text), then there is a simple formula for the directional de rivative:
Theorem 3.2. Let f (x, y) be a real-valued function with domain D in R2 such that the partial
derivatives ∂f
∂x and ∂f
∂y exist and are continuous in D. Let ( a, b) be a point in D. Then
Dv f (a, b) = v1
∂f
∂x (a, b) + v2
∂f
∂y (a, b) . (3.10)
for any vector v = (v1, v2) in R2
Proof: Note that if v = i = (1, 0) then the above formula reduces to Dv f (a, b) = ∂f
∂x (a, b),
which we know is true since Di f = ∂f
∂x , as we noted earlier . Similarly , for v = j = (0, 1) the
formula reduces to Dv f (a, b) = ∂f
∂y (a, b), which is true since Dj f = ∂f
∂y . Fix such a vector
v = (v1, v2) and ﬁx a number h ̸= 0. Then
f (a + hv1, b + hv2) − f (a, b) = f (a + hv1, b + hv2) − f (a + hv1, b) + f (a + hv1, b) − f (a, b) . (3.11)


## Page 96

88 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Since g(α) = f (a + hv1, y + α hv2) is a real-valued function, we can apply the Mean Value
Theorem from single-variable calculus on the interval [0 , 1]. It provides a number 0 < α < 1
such that
g ′(α) = g(1) − g(0)
1 − 0
= f (a + hv1, b + hv2) − f (a + hv1, b).
By chain rule
g ′(α) = ∂f
∂y (a + hv1, b + α hv2)hv2.
Therefore,
f (a + hv1, b + hv2) − f (a + hv1, b) = hv2
∂f
∂x (a + hv1, b + α hv2).
By a similar argument, there exists a number 0 < β < 1 such that
f (a + hv1, b) − f (a, b) = hv1
∂f
∂x (a + βhv1, b) .
Thus, by equation (3.11), we have
f (a + hv1, b + hv2) − f (a, b)
h =
hv2
∂f
∂y (a + hv1, b + α hv2) + hv1
∂f
∂x (a + βhv1, b)
h
= v2
∂f
∂y (a + hv1, b + α hv2) + v1
∂f
∂x (a + βhv1, b)
so by formula (3.9) we have
Dv f (a, b) = lim
h→ 0
f (a + hv1, b + hv2) − f (a, b)
h
= lim
h→ 0
[
v2
∂f
∂y (a + hv1, b + α hv2) + v1
∂f
∂x (a + βhv1, b)
]
= v2
∂f
∂y (a, b) + v1
∂f
∂x (a, b) by the continuity of ∂f
∂x and ∂f
∂y , so
Dv f (a, b) = v1
∂f
∂x (a, b) + v2
∂f
∂y (a, b)
after reversing the order of summation. QED
Along the same lines one can prove the following generalizatio n of the chain rule.


## Page 97

3.4 Directional Derivatives and the Gradient 89
Theorem 3.3. Let f (x, y) be a real-valued function with domain D in R2 such that the
partial derivatives ∂f
∂x and ∂f
∂y exist and are continuous in D and h(t) = (h1(t), h2(t)) be a
smooth function with values in D. Then
f (h(t))′= Dh′(t) f (h(t))
= h′
1(t) ∂f
∂x (h1(t), h2(t)) + h′
2(t) ∂f
∂y (h1(t), h2(t)).
(3.12)
Note that Dv f (a, b) = v ···
(
∂f
∂x (a, b), ∂f
∂y (a, b)
)
. The second vector has a special name:
Deﬁnition 3.6. For a real-valued function f (x, y), the gradient of f , denoted by ∇ f , is the
vector
∇ f =
(∂f
∂x , ∂f
∂y
)
(3.13)
in R2. For a real-valued function f (x, y, z), the gradient is the vector
∇ f =
(∂f
∂x , ∂f
∂y , ∂f
∂z
)
(3.14)
in R3. The symbol ∇ is pronounced “del” or “nabla”. 5
Corollary 3.4. In the assumptions of the theorems 3.2 and 3.3 we have
(a) Dv f = v ··· ∇f ;
(b) f (h(t))′= h′(t) ··· ∇f
Example 3.15. Find the directional derivative of f (x, y) = x y2 + x3 y at the point (1 , 2) in the
direction of v =
(
1/∇adicallow
2 , 1/∇adicallow
2
)
.
Solution: We see that ∇ f = (y2 + 3x2 y, 2x y+ x3), so
Dv f (1, 2) = v ··· ∇f (1, 2) =
(
1/∇adicallow
2 , 1/∇adicallow
2
)
···(22 + 3(1)2(2), 2(1)(2) + 13) = 15/∇adicallow
2
A real-valued function z = f (x, y) whose partial derivatives ∂f
∂x and ∂f
∂y exist and are con-
tinuous is called continuously differentiable. Assume that f (x, y) is such a function and that
∇ f ̸= 0. Let c be a real number in the range of f and let v be a vector in R2 which is tangent
to the level curve f (x, y) = c (see Figure 3.4.1).
5Sometimes the notation grad( f ) is used instead of ∇ f .


## Page 98

90 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
x
y
0
v ∇ f
f (x, y) = c
Figure 3.4.1
The value of f (x, y) is constant along a level curve, so since v is a tangent vector to this
curve, then the rate of change of f in the direction of v is 0; that is, Dv f = 0. But we know
that Dv f = v ··· ∇f . In other words, ∇ f ⊥ v, which means that ∇ f is normal to the level curve.
In general, for any unit vector v in R2, we have Dv f = ∥∇ f ∥ cos θ, where θ is the angle
between v and ∇ f . At a ﬁxed point ( x, y) the length ∥∇ f ∥ is ﬁxed, and the value of Dv f then
varies as θ varies. The largest value that Dv f can take is when cos θ = 1 ( θ = 0◦), while the
smallest value occurs when cos θ = − 1 ( θ = 180◦). In other words, the value of the function
f increases the fastest in the direction of ∇ f (since θ = 0◦ in that case), and the value of
f decreases the fastest in the direction of −∇ f (since θ = 180◦ in that case). We have thus
proved the following theorem:
Theorem 3.5. Let f (x, y) be a continuously differentiable real-valued function, wit h ∇ f ̸= 0.
Then:
(a) The gradient ∇ f is normal to any level curve f (x, y) = c.
(b) The value of f (x, y) increases the fastest in the direction of ∇ f .
(c) The value of f (x, y) decreases the fastest in the direction of −∇ f .
Example 3.16. In which direction does the function f (x, y) = x y2 + x3 y increase the fastest
from the point (1 , 2)? In which direction does it decrease the fastest?
Solution: Since ∇ f = (y2 + 3x2 y, 2x y+ x3), then ∇ f (1, 2) = (10, 5) ̸= 0. A unit vector in that
direction is v = ∇ f
∥∇ f ∥ =
(
2/∇adicallow
5 , 1/∇adicallow
5
)
. Thus, f increases the fastest in the direction of
(
2/∇adicallow
5 , 1/∇adicallow
5
)
and
decreases the fastest in the direction of
(
− 2/∇adicallow
5 , − 1/∇adicallow
5
)
.


## Page 99

3.4 Directional Derivatives and the Gradient 91
Though we proved Theorem 3.5 for functions of two variables, a si milar argument can
be used to show that it also applies to functions of three or more variables. Likewise, the
directional derivative in the three-dimensional case can also be deﬁned by the formula Dv f =
v ··· ∇f .
Example 3.17. The temperature T of a solid is given by the function
T(x, y, z) = e− x + e− 2y + e4z,
where x, y, z are space coordinates relative to the center of the solid. In whic h direction from
the point (1 , 1, 1) will the temperature decrease the fastest?
Solution: Since ∇ f = (− e− x, − 2e− 2y, 4e4z), then the temperature will decrease the fastest in
the direction of −∇ f (1, 1, 1) = (e− 1, 2e− 2, − 4e4).
Exercises
A
For Exercises 1–10, compute the gradient ∇ f .
1. f (x, y) = x2 + y2 − 1; 2. f (x, y) = 1
x2 + y2 ;
3. f (x, y) =
√
x2 + y2 + 4; 4. f (x, y) = x2 e y;
5. f (x, y) = ln(x y); 6. f (x, y) = 2x + 5y;
7. f (x, y, z) = sin(x yz); 8. f (x, y, z) = x2 e yz ;
9. f (x, y, z) = x2 + y2 + z2; 10. f (x, y, z) =
√
x2 + y2 + z2.
For Exercises 11–14, ﬁnd the directional derivative of f at the point P in the direction of
v =
(
1/∇adicallow
2 , 1/∇adicallow
2
)
.
11. f (x, y) = x2 + y2 − 1, P = (1, 1); 12. f (x, y) = 1
x2 + y2 , P = (1, 1);
13. f (x, y) =
√
x2 + y2 + 4, P = (1, 1); 14. f (x, y) = x2 e y, P = (1, 1).
For Exercises 15–16, ﬁnd the directional derivative of f at the point P in the direction of
v =
(
1/∇adicallow
3 , 1/∇adicallow
3 , 1/∇adicallow
3
)
.
15. f (x, y, z) = sin(x yz), P = (1, 1, 1); 16. f (x, y, z) = x2 e yz , P = (1, 1, 1).
17. Repeat Example 2.16 at the point (2 , 3).
18. Repeat Example 2.17 at the point (3 , 1, 2).
B
For Exercises 19–26, let f (x, y) and g(x, y) be continuously differentiable real-valued func-
tions, let c be a constant, and let v be a unit vector in R2. Show that:


## Page 100

92 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
19. ∇ (c f ) = c ∇ f ; 20. ∇ ( f + g) = ∇ f + ∇ g;
21. ∇ ( f g) = f ∇ g + g ∇ f ; 22. ∇ ( f /g) = g ∇ f − f ∇ g
g2 if g(x, y) ̸= 0;
23. D− v f = − Dv f ; 24. Dv(c f ) = c Dv f ;
25. Dv( f + g) = Dv f + Dv g; 26. Dv( f g) = f D v g + g Dv f .
27. The function r(x, y) =
√
x2 + y2 is the length of the position vector r = x i + y j for each
point ( x, y) in R2. Show that ∇ r = 1
r r when ( x, y) ̸= (0, 0), and that ∇ (r2) = 2 r.
C
28. Let g(x) and f (x, y) be smooth function such that
f (x, g(x)) = 0.
Show that
∂f
∂x (x, g(x)) + g′(x) ∂f
∂y (x, g(x)) = 0.
(Hint: Apply Theorem 3.3 for the curve h(t) = (t, g(t)).)


## Page 101

3.5 Maxima and Minima 93
3.5 Maxima and Minima
The gradient can be used to ﬁnd extreme points of real-valued functions of several variables,
that is, points where the function has a local maximum or local minimum. We will consider
only functions of two variables; functions of three or more va riables require methods using
linear algebra.
Deﬁnition 3.7. Let f (x, y) be a real-valued function, and let ( x0, y0) be a point in the domain
of f . We say that f has a local maximum at ( x0, y0) if f (x, y) ≤ f (x0, y0) for all ( x, y) inside
some disk of positive radius centered at ( x0, y0); that is, there is some sufﬁciently small r > 0
such that f (x, y) ≤ f (x0, y0) for all ( x, y) for which ( x − x0)2 + (y − y0)2 < r2.
Likewise, we say that f has a local minimum at (x0, y0) if f (x, y) ≥ f (x0, y0) for all ( x, y)
inside some disk of positive radius centered at ( x0, y0).
If f (x, y) ≤ f (x0, y0) for all ( x, y) in the domain of f , then f has a global maximum at
(x0, y0). If f (x, y) ≥ f (x0, y0) for all ( x, y) in the domain of f , then f has a global minimum
at ( x0, y0).
Suppose that ( x0, y0) is a local maximum point for f (x, y), and that the ﬁrst-order partial
derivatives of f exist at ( x0, y0). We know that f (x0, y0) is the largest value of f (x, y) as
(x, y) goes in all directions from the point ( x0, y0), in some sufﬁciently small disk centered at
(x0, y0). In particular , f (x0, y0) is the largest value of f in the x direction (around the point
(x0, y0)), that is, the single-variable function g(x) = f (x, b) has a local maximum at x = a. So
we know that g ′(a) = 0. Since g ′(x) = ∂f
∂x (x, b), then ∂f
∂x (x0, y0) = 0. Similarly , f (x0, y0) is the
largest value of f near ( x0, y0) in the y direction and so ∂f
∂y (x0, y0) = 0. We thus have the
following theorem:
Theorem 3.6. Let f (x, y) be a real-valued function such that both ∂f
∂x (x0, y0) and ∂f
∂y (x0, y0)
exist. Then a necessary condition for f (x, y) to have a local maximum or minimum at ( x0, y0)
is that ∇ f (x0, y0) = 0.
Note: Theorem 3.6 can be extended to apply to functions of three o r more variables.
A point ( x0, y0) where ∇ f (x0, y0) = 0 is called a critical point for the function f (x, y).
So given a function f (x, y), to ﬁnd the critical points of f you have to solve the equations
∂f
∂x (x, y) = 0 and ∂f
∂y (x, y) = 0 simultaneously for ( x, y). Similar to the single-variable case, the
necessary condition that ∇ f (x0, y0) = 0 is not always sufﬁcient to guarantee that a critical
point is a local maximum or minimum.
Example 3.18. The function f (x, y) = x y has a critical point at (0 , 0): ∂f
∂x = y = 0 ⇒ y = 0, and
∂f
∂y = x = 0 ⇒ x = 0, so (0 , 0) is the only critical point. But clearly f does not have a local
maximum or minimum at (0 , 0) since any disk around (0 , 0) contains points ( x, y) where the
values of x and y have the same sign (so that f (x, y) = x y> 0 = f (0, 0)) and different signs (so
that f (x, y) = x y< 0 = f (0, 0)). In fact, along the path y = x in R2, f (x, y) = x2, which has a


## Page 102

94 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
local minimum at (0 , 0), while along the path y = − x we have f (x, y) = − x2, which has a local
maximum at (0 , 0). So (0 , 0) is an example of a saddle point ; that is, it is a local maximum
in one direction and a local minimum in another direction. The g raph of f (x, y) is shown in
Figure 3.5.1, which is a hyperbolic paraboloid.
-10-505
10
-10 -5 0 5 10
-100
-50
0
50
100
z
x
y
z
Figure 3.5.1 f (x, y) = x y, saddle point at (0, 0).
From the course of single-variable calculus, you may rememb er second derivative test .
If f ′(x0) = 0 and f ′′(0) > 0 then the real-to-real function f has a local minimum at x0.
In order to explain the multi-variable analog of this test, let us introduce second direc-
tional derivative . Fix a vector v ∈ R2 and a smooth function of two variables f (x, y). The
directional derivative h(x, y) = Dv f (x, y) is an other smooth function of two variables, so we
can take its directional derivative again Dvh(x, y); it is called second directional derivative
and denoted as D2
v f (x, y).
If Dv f (x0, y0) = 0 and D2
v f (x0, y0) > 0 for any vector v ̸= 0 then the the smooth function
f (x, y) of two variables, has a local minimum at ( x0, y0).
In this form the second derivative test is not useful since it r equires to check inequality
D2
v f (x0, y0) > 0 for inﬁnite number of vectors v. Let us try to remove this weak point.


## Page 103

3.5 Maxima and Minima 95
Note that if v = (a, b) then
Dv f (x0, y0) = a ∂f
∂x + b ∂f
∂y .
and
D2
v f (x0, y0) = Dv(a ∂f
∂x + b ∂f
∂y )
= a2 ∂2 f
∂x2 + ab ∂2 f
∂x∂y + ab ∂2 f
∂y∂x + b2 ∂2 f
∂y2
= a2 ∂2 f
∂x2 + 2ab ∂2 f
∂y∂x + b2 ∂2 f
∂y2 ,
the last equality holds since the function f is smooth and, therefore, ∂2 f
∂x∂y = ∂2 f
∂y∂x
Therefore, the condition D2
v f (x0, y0) > 0 for any v ̸= 0 means that
a2 ∂2 f
∂x2 + 2ab ∂2 f
∂y∂x + b2 ∂2 f
∂y2 > 0
for any pair of real numbers ( a, b) at least one of which is not zero.
Analyzing the last inequality for all possible pairs ( a, b) leads to the following theorem
which is true analog of second derivative test for smooth funct ions of two variables; it gives
sufﬁcient conditions for a critical point to be a local maximum or minimum of a smooth
function (that is, a function whose partial derivatives of all orders exis t and are continuous).
The theorem will not be proved here. 6
Theorem 3.7. Let f (x, y) be a smooth real-valued function, with a critical point at ( x0, y0)
(that is, ∇ f (x0, y0) = 0). Deﬁne
D = ∂2 f
∂x2 (x0, y0) ∂2 f
∂y2 (x0, y0) −
( ∂2 f
∂y ∂x (x0, y0)
)2
Then
(a) if D > 0 and ∂2 f
∂x2 (x0, y0) > 0, then f has a local minimum at ( x0, y0)
(b) if D > 0 and ∂2 f
∂x2 (x0, y0) < 0, then f has a local maximum at ( x0, y0)
(c) if D < 0, then f has neither a local minimum nor a local maximum at ( x0, y0)
(d) if D = 0, then the test fails.
If condition (c) holds, then ( x0, y0) is a saddle point; that is, the second directional deriva-
tive D2
v f (x0, y0) can be positive and negative for different vectors v.
6See T AYLOR and M ANN , § 7.6.


## Page 104

96 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Recall that the assumption that f (x, y) is smooth implies that ∂2 f
∂y ∂x = ∂2 f
∂x ∂y . Therefore
D =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
∂2 f
∂x2 (x0, y0) ∂2 f
∂y ∂x (x0, y0)
∂2 f
∂x ∂y (x0, y0) ∂2 f
∂y2 (x0, y0)
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
.
Also, if D > 0 then ∂2 f
∂x2 (x0, y0) ∂2 f
∂y2 (x0, y0) = D+
(
∂2 f
∂y ∂x (x0, y0)
)2
> 0, and so ∂2 f
∂x2 (x0, y0) and ∂2 f
∂y2 (x0, y0)
have the same sign. This means that in parts (a) and (b) of the th eorem one can replace
∂2 f
∂x2 (x0, y0) by ∂2 f
∂y2 (x0, y0) if desired.
Example 3.19. Find all local maxima and minima of f (x, y) = x2 + x y+ y2 − 3x.
Solution: First ﬁnd the critical points; that is, solve ∇ f = 0. Since
∂f
∂x = 2x + y − 3 and ∂f
∂y = x + 2y
then the critical points ( x, y) are the common solutions of the equations
2x + y − 3 = 0
x + 2y = 0
which has the unique solution ( x, y) = (2, − 1). So (2 , − 1) is the only critical point.
To use Theorem 3.7, we need the second-order partial derivatives:
∂2 f
∂x2 = 2 , ∂2 f
∂y2 = 2 , ∂2 f
∂y ∂x = 1
and so
D = ∂2 f
∂x2 (2, − 1) ∂2 f
∂y2 (2, − 1) −
( ∂2 f
∂y ∂x (2, − 1)
)2
= (2)(2) − 12 = 3 > 0
and ∂2 f
∂x2 (2, − 1) = 2 > 0. Thus, (2 , − 1) is a local minimum.
Example 3.20. Find all local maxima and minima of f (x, y) = x y− x3 − y2.
Solution: First ﬁnd the critical points; that is, solve ∇ f = 0. Since
∂f
∂x = y − 3x2 and ∂f
∂y = x − 2y
then the critical points ( x, y) are the common solutions of the equations
y − 3x2 = 0
x − 2y = 0


## Page 105

3.5 Maxima and Minima 97
The ﬁrst equation yields y = 3x2, substituting that into the second equation yields x− 6x2 = 0,
which has the solutions x = 0 and x = 1
6 . So x = 0 ⇒ y = 3(0) = 0 and x = 1
6 ⇒ y = 3
(1
6
)2 = 1
12 .
So the critical points are ( x, y) = (0, 0) and ( x, y) =
(1
6 , 1
12
)
.
To use Theorem 3.7, we need the second-order partial derivatives:
∂2 f
∂x2 = − 6x , ∂2 f
∂y2 = − 2 , ∂2 f
∂y ∂x = 1
So
D = ∂2 f
∂x2 (0, 0) ∂2 f
∂y2 (0, 0) −
( ∂2 f
∂y ∂x (0, 0)
)2
= (− 6(0))(− 2) − 12 = − 1 < 0
and thus (0 , 0) is a saddle point. Also,
D = ∂2 f
∂x2
(1
6 , 1
12
) ∂2 f
∂y2
(1
6 , 1
12
)
−
( ∂2 f
∂y ∂x
(1
6 , 1
12
))2
= (− 6
(1
6
)
)(− 2) − 12 = 1 > 0
and ∂2 f
∂x2
(1
6 , 1
12
)
= − 1 < 0. Thus,
(1
6 , 1
12
)
is a local maximum.
Example 3.21. Find all local maxima and minima of f (x, y) = (x − 2)4 + (x − 2y)2.
Solution: First ﬁnd the critical points; that is, solve ∇ f = 0. Since
∂f
∂x = 4(x − 2)3 + 2(x − 2y) and ∂f
∂y = − 4(x − 2y)
then the critical points ( x, y) are the common solutions of the equations
4(x − 2)3 + 2(x − 2y) = 0
− 4(x − 2y) = 0
The second equation yields x = 2y, substituting that into the ﬁrst equation yields 4(2 y− 2)3 =
0, which has the solution y = 1, and so x = 2(1) = 2. Thus, (2 , 1) is the only critical point.
To use Theorem 3.7, we need the second-order partial derivatives:
∂2 f
∂x2 = 12(x − 2)2 + 2 , ∂2 f
∂y2 = 8 , ∂2 f
∂y ∂x = − 4
So
D = ∂2 f
∂x2 (2, 1) ∂2 f
∂y2 (2, 1) −
( ∂2 f
∂y ∂x (2, 1)
)2
= (2)(8) − (− 4)2 = 0
and so the test fails. What can be done in this situation? Somet imes it is possible to examine
the function to see directly the nature of a critical point. In o ur case, we see that f (x, y) ≥ 0
for all ( x, y), since f (x, y) is the sum of fourth and second powers of numbers and hence must
be nonnegative. But we also see that f (2, 1) = 0. Thus f (x, y) ≥ 0 = f (2, 1) for all ( x, y), and
hence (2, 1) is, in fact, a global minimum for f .


## Page 106

98 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Example 3.22. Find all local maxima and minima of f (x, y) = (x2 + y2)e− (x2+ y2).
Solution: First ﬁnd the critical points; that is, solve ∇ f = 0. Since
∂f
∂x = 2x(1 − (x2 + y2))e− (x2+ y2)
∂f
∂y = 2y(1 − (x2 + y2))e− (x2+ y2)
then the critical points are (0 , 0) and all points ( x, y) on the unit circle x2 + y2 = 1.
To use Theorem 3.7, we need the second-order partial derivatives:
∂2 f
∂x2 = 2[1 − (x2 + y2) − 2x2 − 2x2(1 − (x2 + y2))]e− (x2+ y2)
∂2 f
∂y2 = 2[1 − (x2 + y2) − 2y2 − 2y2(1 − (x2 + y2))]e− (x2+ y2)
∂2 f
∂y ∂x = − 4x y[2 − (x2 + y2)]e− (x2+ y2)
At (0 , 0), we have D = 4 > 0 and ∂2 f
∂x2 (0, 0) = 2 > 0, so (0 , 0) is a local minimum. However , for
points ( x, y) on the unit circle x2 + y2 = 1, we have
D = (− 4x2 e− 1)(− 4y2 e− 1) − (− 4x ye− 1)2 = 0
and so the test fails. If we look at the graph of f (x, y), as shown in Figure 3.5.2, it looks like
we might have a local maximum for ( x, y) on the unit circle x2 + y2 = 1. If we switch to using
polar coordinates (r, θ) instead of ( x, y) in R2, where r2 = x2+ y2, then we see that we can write
f (x, y) as a function g(r) of the variable r alone: g(r) = r2 e− r2
. Then g ′(r) = 2r(1 − r2)e− r2
,
so it has a critical point at r = 1, and we can check that g ′′(1) = − 4e− 1 < 0, so the Second
Derivative Test from single-variable calculus says that r = 1 is a local maximum. But r = 1
corresponds to the unit circle x2 + y2 = 1. Thus, the points ( x, y) on the unit circle x2 + y2 = 1
are local maximum points for f .
Exercises
A
For Exercises 1–10, ﬁnd all local maxima and minima of the fun ction f (x, y).


## Page 107

3.5 Maxima and Minima 99
-3
-2
-1
0
1
2
3
-3
-2
-1
0
1
2
3
0
0.05
0.1
0.15
0.2
0.25
0.3
0.35
0.4
z
x
y
z
Figure 3.5.2 f (x, y) = (x2 + y2)e− (x2+ y2).
1. f (x, y) = x3 − 3x + y2; 2. f (x, y) = x3 − 12x + y2 + 8y;
3. f (x, y) = x3 − 3x + y3 − 3y; 4. f (x, y) = x3 + 3x2 + y3 − 3y2;
5. f (x, y) = 2x3 + 6x y+ 3y2; 6. f (x, y) = 2x3 − 6x y+ y2;
7. f (x, y) =
√
x2 + y2; 8. f (x, y) = x + 2y;
9. f (x, y) = 4x2 − 4x y+ 2y2 + 10x − 6y; 10. f (x, y) = − 4x2 + 4x y− 2y2 + 16x − 12y.
B
11. For a rectangular solid of volume 1000 cubic meters, ﬁnd the di mensions that will min-
imize the surface area. ( Hint: Use the volume condition to write the surface area as a
function of just two variables. )
12. Prove that if ( x0, y0) is a local maximum or local minimum point for a smooth functio n
f (x, y), then the tangent plane to the surface z = f (x, y) at the point ( x0, y0, f (x0, y0)) is
parallel to the x y-plane. ( Hint: Use Theorem 3.6. )
C
13. Find three positive numbers x, y, z whose sum is 10 such that x2 y2 z is a maximum.


## Page 108

100 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
3.6 Numerical Methods
The types of problems that we solved in the previous section were ex amples of unconstrained
optimization problems. That is, we tried to ﬁnd local (and perhaps even global) maximum
and minimum points of real-valued functions f (x, y), where the points ( x, y) could be any
points in the domain of f . The method we used required us to ﬁnd the critical points of
f , which meant having to solve the equation ∇ f = 0, which in general is a system of two
equations in two unknowns ( x and y). While this was relatively simple for the examples we
did, in general this will not be the case. It might be impossible to solve these equations by
elementary means.7
In a situation such as this, the only choice may be to ﬁnd a solu tion using some numer-
ical method which gives a sequence of numbers which converge to the actual solution. For
example, Newton’s method for solving equations f (x) = 0, which you probably learned in
single-variable calculus. In this section we will describe ano ther method of Newton for ﬁnd-
ing critical points of real-valued functions of two variables .
Let f (x, y) be a smooth real-valued function, and deﬁne
D(x, y) = ∂2 f
∂x2 (x, y) ∂2 f
∂y2 (x, y) −
( ∂2 f
∂y ∂x (x, y)
)2
.
Newton’s algorithm : Pick an initial point ( x0, y0). For n = 0, 1, 2, 3, . . ., deﬁne:
xn+ 1 = xn −
⏐
⏐
⏐
⏐
⏐
⏐
∂2 f
∂y2 (xn, yn) ∂2 f
∂x ∂y (xn, yn)
∂f
∂y (xn, yn) ∂f
∂x (xn, yn)
⏐
⏐
⏐
⏐
⏐
⏐
D(xn, yn) ,
yn+ 1 = yn −
⏐
⏐
⏐
⏐
⏐
⏐
∂2 f
∂x2 (xn, yn) ∂2 f
∂x ∂y (xn, yn)
∂f
∂x (xn, yn) ∂f
∂y (xn, yn)
⏐
⏐
⏐
⏐
⏐
⏐
D(xn, yn) .
(3.15)
Then the sequence of points ( xn, yn)∞
n= 1 typically converges to a critical point. If there are
several critical points, then you will have to try different ini tial points to ﬁnd them.
The choice of the formulas in (3.15) is motivated by the follo wing fact, which can be
checked by direct calculations. Assume that the partial deriva tives ∂2 f
∂x2 (x, y), ∂2 f
∂x∂y (x, y) and
∂2 f
∂y2 (x, y) are constants; in other words, the function f (x, y) can be expressed as a quadratic
polynomial in x and y, say
f (x, y) = a + bx + c y+ l x2 + mx y+ n y2
for some constants a, b, c, l, m, n. Then for any choice ( x0, y0) the formulas (3.15) returns a
critical point ( x1, y1), which is unique in this case.
7This is also a problem for the equivalent method (the Second Der ivative Test) in single-variable calculus,
though one that is not usually emphasized.


## Page 109

3.6 Numerical Methods 101
Example 3.23. Find all local maxima and minima of f (x, y) = x3 − x y− x + x y3 − y4.
Solution: First calculate the necessary partial derivatives:
∂f
∂x = 3x2 − y − 1 + y3 , ∂f
∂y = − x + 3x y2 − 4y3
∂2 f
∂x2 = 6x , ∂2 f
∂y2 = 6x y− 12y2 , ∂2 f
∂y ∂x = − 1 + 3y2
Notice that solving ∇ f = 0 would involve solving two third-degree polynomial equations in x
and y, which in this case can not be done easily .
We need to pick an initial point ( x0, y0) for our algorithm. Looking at the graph of z = f (x, y)
over a large region may help (see Figure 3.6.1 below), though i t may be hard to tell where
the critical points are.
-20
-15
-10
-5
0
5
10
15
20
-20 -15 -10 -5 0 5 10 15 20
-350000
-300000
-250000
-200000
-150000
-100000
-50000
0
50000
z
x
y
z
Figure 3.6.1 f (x, y) = x3 − x y− x + x y3 − y4 for − 20 ≤ x ≤ 20 and − 20 ≤ y ≤ 20.
Notice in the formulas (3.15) that we divide by D, so we should pick an initial point where
D is not zero. And we can see that D(0, 0) = (0)(0) − (− 1)2 = − 1 ̸= 0, so take (0 , 0) as our initial
point. Since it may take a large number of iterations of Newton’ s algorithm to be sure that
we are close enough to the actual critical point, and since the c omputations are quite tedious,
we will let a computer do the computing. For this, we will write a simple pr ogram, using
the Java programming language, which will take a given initial po int as a parameter and


## Page 110

102 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
then perform 100 iterations of Newton’s algorithm. In each ite ration the new point will be
printed, so that we can see if there is convergence. The full code i s shown in Listing 3.1.
//Program to find the critical points of f(x,y)=x^3-xy-x+x y^3-y^4
public class newton {
public static void main(String[] args) {
//Get the initial point (x,y) as command-line parameters
double x = Double.parseDouble(args[0]); //Initial x value
double y = Double.parseDouble(args[1]); //Initial y value
System.out.println("Initial point: (" + x + "," + y + ")");
//Go through 100 iterations of Newton’s algorithm
for (int n=1; n<=100; n++) {
double D = fxx(x,y) *fyy(x,y) - Math.pow(fxy(x,y),2);
double xn = x; double yn = y; //The current x and y values
if (D == 0) { //We can not divide by 0
System.out.println("Error: D = 0 at iteration n = " + n);
System.exit(0); //End the program
} else { //Calculate the new values for x and y
x = xn - (fyy(xn,yn) *fx(xn,yn) - fxy(xn,yn) *fy(xn,yn))/D;
y = yn - (fxx(xn,yn) *fy(xn,yn) - fxy(xn,yn) *fx(xn,yn))/D;
System.out.println("n = " + n + ": (" + x + "," + y + ")");
}
}
}
//Below are the parts specific to the function f
//The first partial derivative of f wrt x: 3x^2-y-1+y^3
public static double fx(double x, double y) {
return 3*Math.pow(x,2) - y - 1 + Math.pow(y,3);
}
//The first partial derivative of f wrt y: -x+3xy^2-4y^3
public static double fy(double x, double y) {
return -x + 3 *x*Math.pow(y,2) - 4 *Math.pow(y,3);
}
//The second partial derivative of f wrt x: 6x
public static double fxx(double x, double y) {
return 6*x;
}
//The second partial derivative of f wrt y: 6xy-12y^2
public static double fyy(double x, double y) {
return 6*x*y - 12 *Math.pow(y,2);
}
//The mixed second partial derivative of f wrt x and y: -1+3y^ 2
public static double fxy(double x, double y) {
return -1 + 3 *Math.pow(y,2);
}
}
Listing 3.1 Program listing for newton.java


## Page 111

3.6 Numerical Methods 103
To use this program, you should ﬁrst save the code in Listing 3.1 in a plain text ﬁle called
newton.java. Y ou will need the Java Development Kit 8 to compile the code. In the directory
where newton.java is saved, run this command at a command prompt to compile the code:
javac newton.java
Then run the program with the initial point (0 , 0) with this command:
java newton 0 0
Below is the output of the program using (0 , 0) as the initial point, truncated to show the
ﬁrst 10 lines and the last 5 lines:
java newton 0 0
Initial point: (0.0,0.0)
n = 1: (0.0,-1.0)
n = 2: (1.0,-0.5)
n = 3: (0.6065857885615251,-0.44194107452339687)
n = 4: (0.484506572966545,-0.405341511995805)
n = 5: (0.47123972682634485,-0.3966334583092305)
n = 6: (0.47113558510349535,-0.39636450001936047)
n = 7: (0.4711356343449705,-0.3963643379632247)
n = 8: (0.4711356343449874,-0.39636433796318005)
n = 9: (0.4711356343449874,-0.39636433796318005)
n = 10: (0.4711356343449874,-0.39636433796318005)
...
n = 96: (0.4711356343449874,-0.39636433796318005)
n = 97: (0.4711356343449874,-0.39636433796318005)
n = 98: (0.4711356343449874,-0.39636433796318005)
n = 99: (0.4711356343449874,-0.39636433796318005)
n = 100: (0.4711356343449874,-0.39636433796318005)
As you can see, we appear to have converged fairly quickly (after only 8 iterations) to
what appears to be an actual critical point (up to Java’s level of pr ecision), namely the point
(0.4711356343449874, − 0.39636433796318005). It is easy to conﬁrm that ∇ f = 0 at this
point, either by evaluating ∂f
∂x and ∂f
∂y at the point ourselves or by modifying our program to
also print the values of the partial derivatives at the point. It t urns out that both partial
derivatives are indeed close enough to zero to be considered zer o:
∂f
∂x (0.4711356343449874, − 0.39636433796318005) = 4.85722573273506 × 10− 17
∂f
∂y (0.4711356343449874, − 0.39636433796318005) = − 8.326672684688674 × 10− 17
We also have D(0.4711356343449874, − 0.39636433796318005) = − 8.776075636032301 < 0,
so by Theorem 3.7 we know that (0 .4711356343449874, − 0.39636433796318005) is a saddle
point.
8Available for free at http://www.oracle.com/technetwork/java/javase/downloads/


## Page 112

104 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Since ∇ f consists of cubic polynomials, it seems likely that there may be three critical
points. The computer program makes experimenting with other init ial points easy , and
trying different values does indeed lead to different sequences which converge:
java newton -1 -1
Initial point: (-1.0,-1.0)
n = 1: (-0.5,-0.5)
n = 2: (-0.49295774647887325,-0.08450704225352113)
n = 3: (-0.1855674752461383,-1.2047647348546167)
n = 4: (-0.4540060574531383,-0.8643989895639324)
n = 5: (-0.3672160534444,-0.5426077421319053)
n = 6: (-0.4794622222856417,-0.24529117721011612)
n = 7: (0.11570743992954591,-2.4319791238981274)
n = 8: (-0.05837851765533317,-1.6536079835854451)
n = 9: (-0.129841298650007,-1.121516233310142)
n = 10: (-1.004453014967208,-0.9206128022529645)
n = 11: (-0.5161209914612475,-0.4176293491131443)
n = 12: (-0.5788664043863884,0.2918236503332734)
n = 13: (-0.6985177124230715,0.49848120123515316)
n = 14: (-0.6733618916578702,0.4345777963475479)
n = 15: (-0.6704392913413444,0.4252025996474051)
n = 16: (-0.6703832679150286,0.4250147307973365)
n = 17: (-0.6703832459238701,0.42501465652421205)
n = 18: (-0.6703832459238667,0.4250146565242004)
n = 19: (-0.6703832459238667,0.42501465652420045)
n = 20: (-0.6703832459238667,0.42501465652420045)
...
n = 98: (-0.6703832459238667,0.42501465652420045)
n = 99: (-0.6703832459238667,0.42501465652420045)
n = 100: (-0.6703832459238667,0.42501465652420045)
Again, it is easy to conﬁrm that both ∂f
∂x and ∂f
∂y vanish at the point
(− 0.6703832459238667, 0.42501465652420045), which means it is a critical point. And
D(− 0.6703832459238667, 0.42501465652420045) = 15.3853578526055 > 0
∂2 f
∂x2 (− 0.6703832459238667, 0.42501465652420045) = − 4.0222994755432 < 0
so we know that ( − 0.6703832459238667, 0.42501465652420045) is a local maximum. An
idea of what the graph of f looks like near that point is shown in Figure 3.6.2, which does
suggest a local maximum around that point.
Finally , running the computer program with the initial point ( − 5, − 5) yields the critical
point ( − 7.540962756992551, − 5.595509445899435), with D < 0 at that point, which makes
it a saddle point.


## Page 113

3.6 Numerical Methods 105
-1
-0.8
-0.6
-0.4
-0.2
0
0
0.2
0.4
0.6
0.8
1
-1
-0.8
-0.6
-0.4
-0.2
0
0.2
0.4
0.6
z
x
y
z
(− 0.67, 0.42, 0.57)
Figure 3.6.2 f (x, y) = x3 − x y− x + x y3 − y4 for − 1 ≤ x ≤ 0 and 0 ≤ y ≤ 1.
We can summarize our ﬁndings for the function f (x, y) = x3 − x y− x + x y3 − y4:
(0.4711356343449874, − 0.39636433796318005) : saddle point
(− 0.6703832459238667, 0.42501465652420045) : local maximum
(− 7.540962756992551, − 5.595509445899435) : saddle point
The derivation of Newton’s algorithm, and the proof that it conv erges (given a “reason-
able” choice for the initial point) requires techniques beyo nd the scope of this text. See
RALSTON and R ABINOWITZ for more detail and for discussion of other numerical methods.
Our description of Newton’s algorithm is the special two-variable case of a more general
algorithm that can be applied to functions of n ≥ 2 variables.
In the case of functions which have a global maximum or minimum , Newton’s algorithm
can be used to ﬁnd those points. In general, global maxima and m inima tend to be more
interesting than local versions, at least in practical applica tions. A maximization problem
can always be turned into a minimization problem (why?), so a la rge number of methods
have been developed to ﬁnd the global minimum of functions of an y number of variables.
This ﬁeld of study is called nonlinear programming.
Many of these methods are based on the steepest descent technique, which is based on
an idea that we discussed in Section 2.4. Recall that the negativ e gradient −∇ f gives the


## Page 114

106 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
direction of the fastest rate of decrease of a function f . The crux of the steepest descent idea,
then, is that starting from some initial point, you move a cert ain amount in the direction
of −∇ f at that point. Wherever that takes you becomes your new point, a nd you then just
keep repeating that procedure until eventually (hopefully) you reach the point where f has
its smallest value. There is a “pure” steepest descent method, an d a multitude of variations
on it that improve the rate of convergence, ease of calculatio n, etc. For more discussion of
this, and of nonlinear programming in general, see B AZARAA , S HERALI and S HETTY .
Exercises
C
1. Recall Example 3.21 from the previous section, where we showed tha t the point (2 , 1) was
a global minimum for the function f (x, y) = (x − 2)4 + (x − 2y)2. Notice that our computer
program can be modiﬁed fairly easily to use this function (just change the return values
in the fx, fy , fxx, fyy and fxy function deﬁnitions to use the appropriate partial derivative).
Either modify that program or write one of your own in a programming language of your
choice to show that Newton’s algorithm does lead to the point (2 , 1). First use the initial
point (0, 3), then use the initial point (3 , 2), and compare the results. Make sure that your
program attempts to do 100 iterations of the algorithm. Did anyth ing strange happen
when your program ran? If so, how do you explain it? ( Hint: Something strange should
happen.)
2. There is a version of Newton’s algorithm for solving a system o f two equations
f1(x, y) = 0 and f2(x, y) = 0 ,
where f1(x, y) and f2(x, y) are smooth real-valued functions:
Pick an initial point ( x0, y0). For n = 0, 1, 2, 3, . . ., deﬁne:
xn+ 1 = xn −
⏐
⏐
⏐
⏐
⏐
f1(xn, yn) f2(xn, yn)
∂f1
∂y (xn, yn) ∂f2
∂y (xn, yn)
⏐
⏐
⏐
⏐
⏐
D(xn, yn) , yn+ 1 = yn +
⏐
⏐
⏐
⏐
⏐
f1(xn, yn) f2(xn, yn)
∂f1
∂x (xn, yn) ∂f2
∂x (xn, yn)
⏐
⏐
⏐
⏐
⏐
D(xn, yn) , where
D(xn, yn) = ∂f1
∂x (xn, yn) ∂f2
∂y (xn, yn) − ∂f1
∂y (xn, yn) ∂f2
∂x (xn, yn) .
Then the sequence of points ( xn, yn)∞
n= 1 converges to a solution. Write a computer program
that uses this algorithm to ﬁnd approximate solutions to the sy stem of equations
f1(x, y) = sin(x y) − x − y = 0 and f2(x, y) = e2x − 2x + 3y = 0 .
Show that you get two different solutions when using (0 , 0) and (1 , 1) for the initial point
(x0, y0).


## Page 115

3.7 Lagrange Multipliers 107
3.7 Lagrange Multipliers
In Sections 2.5 and 2.6 we were concerned with ﬁnding maxima and mi nima of functions
without any constraints on the variables (other than being in the domain of the function).
What would we do if there were constraints on the variables? The fo llowing example illus-
trates a simple case of this type of problem.
Example 3.24. For a rectangle whose perimeter is 20 m, ﬁnd the dimensions that wi ll max-
imize the area.
Solution: The area A of a rectangle with width x and height y is A = x y. The perimeter P of
the rectangle is then given by the formula P = 2x+ 2y. Since we are given that the perimeter
P = 20, this problem can be stated as:
Maximize : f (x, y) = x y
given : 2 x + 2y = 20
The reader is probably familiar with a simple method, using single -variable calculus, for
solving this problem. Since we must have 2 x + 2y = 20, then we can solve for , say , y in
terms of x using that equation. This gives y = 10 − x, which we then substitute into f to get
f (x, y) = x y = x(10 − x) = 10x − x2. This is now a function of x alone, so we now just have to
maximize the function f (x) = 10x − x2 on the interval [0 , 10]. Since f ′(x) = 10 − 2x = 0 ⇒ x = 5
and f ′′(5) = − 2 < 0, then the Second Derivative Test tells us that x = 5 is a local maximum
for f , and hence x = 5 must be the global maximum on the interval [0 , 10] (since f = 0 at
the endpoints of the interval). So since y = 10 − x = 5, then the maximum area occurs for a
rectangle whose width and height both are 5 m.
Notice in the above example that the ease of the solution depended on being able to solve
for one variable in terms of the other in the equation 2 x + 2y = 20. But what if that were not
possible (which is often the case)? In this section we will use a ge neral method, called the
Lagrange multiplier method 9, for solving constrained optimization problems:
Maximize (or minimize) : f (x, y) (or f (x, y, z))
given : g(x, y) = c (or g(x, y, z) = c) for some constant c
The equation g(x, y) = c is called the constraint equation , and we say that x and y are con-
strained by g(x, y) = c. Points ( x, y) which are maxima or minima of f (x, y) with the con-
dition that they satisfy the constraint equation g(x, y) = c are called constrained maximum
or constrained minimum points, respectively . Similar deﬁnitions hold for functions o f three
variables.
The Lagrange multiplier method for solving such problems can n ow be stated:
9Named after the French mathematician Joseph Louis Lagrange (17 36–1813).


## Page 116

108 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Theorem 3.8. Let f (x, y) and g(x, y) be smooth functions, and suppose that c is a scalar
constant such that ∇ g(x, y) ̸= 0 for all ( x, y) that satisfy the equation g(x, y) = c. Then to
solve the constrained optimization problem
Maximize (or minimize) : f (x, y)
given : g(x, y) = c ,
ﬁnd the points ( x, y) that solve the equation ∇ f (x, y) = λ∇ g(x, y) for some constant λ. The
number λ is called the Lagrange multiplier and the point ( x, y) is called critical point of
f (x, y) constrained by g(x, y) = c.
If there is a constrained maximum or minimum, then it must be s uch a critical point of
f (x, y) constrained by g(x, y) = c.
Recall that ∇ g(x, y) is perpendicular to tangent line of the curve g(x, y) = c at the point
(x, y). Therefore, the condition ∇ f (x, y) = λ∇ g(x, y) simply means that ∇ f (x, y) is perpen-
dicular to tangent line of the curve g(x, y) = c at the point ( x, y). It should be intuitively
clear that if ∇ f (x, y) is not perpendicular to the tangent line then slight movement a long
the curve g(x, y) = c can increase and decrease the value f (x, y); in particular , ( x, y) is nei-
ther minimum nor maximum point. A rigorous proof, however , requ ires use of the Implicit
Function Theorem, which is beyond the scope of this text. 10
Note that the theorem only gives a necessary condition for a point to be a constrained
maximum or minimum. That is, if that minimum or maximum is ach ieved at some point
then this point must be critical, but the theorem says nothing about existence of minimum
and maximum points.
Let us discuss two important cases when existence of minima and ma xima is guaranteed;
both of them follow from so called Extreme value theorem which is also beyond the scope of
this text.
Recall that a set is called bounded if it completely lies in a ball of sufﬁciently large radius.
The following condition guarantees existence of maximum and m inimum; a proof is given in
TAYLOR and M ANN .
If the constraint equation g(x, y) = c as above describes a bounded set in R2, then the
constrained maximum and minimum of f (x, y) will occur at some points.
If the condition holds then by theorem above the maximum and min imum points have to be
one of the critical. It remains to ﬁnd all the critical points ( x, y) and compare their values
f (x, y); the maximum of these values is the global maximum of f (x, y) with the constraint
g(x, y) = c; analogously , the minimal value if the global minimum.
Let us formulate a more general condition which guarantees exi stance of minimum, but
not maximum.
10See T AYLOR and M ANN , § 6.8 for more detail.


## Page 117

3.7 Lagrange Multipliers 109
If the set described by system g(x, y) = c, f (x, y) ≤ d is not empty and bounded for some
d then the constrained minimum of f (x, y) will occur at some points.
Again, to ﬁnd the minimum we can ﬁnd all the values f (x, y) at the critical points ( x, y); the
minimal value is the global minimum of f (x, y) with the constraint g(x, y) = c.
For example if f (x, y) = x2 + y2 then the set described by f (x, y) ≤ d is bounded for any d.
Therefore the above condition guarantees existence of minim um for any constrain g(x, y) = c.
Here is an analogous condition for maximum.
If the set described by system g(x, y) = c, f (x, y) ≥ d is not empty and bounded for some
d then the constrained maximum of f (x, y) will occur at some points.
x+ y= 2
x+ y= 6
x+ y= −
2
x y= 1
Sometimes the answer depend on the hidden constants. For example, c onsider the func-
tion f (x, y) = x+ y and the constraint x y= 1. The equation ∇ f = λ∇ g from Theorem 3.8 takes
form
(1, 1) = λ(y, x).
Since yx = 1, we have two critical points: (1 , 1) with the multiplier 1 and ( − 1, − 1) with the
multiplier − 1. Non of these points is maximum, nor minimum; in fact, f can positive and
negative values with arbitrary large absolute value. On the ot her hand, it might happen that
by the nature of the problem, x and y have to be positive (it is called implicit constraints)
then only one point (1 , 1) satisﬁes is the constrained minimum point and the minimum i s 2.
In a general case of that type the maximum or minimum of f (x, y) will occur either at a
point ( x, y) satisfying ∇ f (x, y) = λ∇ g(x, y) or at a “boundary” point of the set described by the
hidden constraints.
Similar thing happens in the Example 3.24 the constraint equati on 2 x + 2y = 20 describes
a line in R2, which by itself is not bounded. However , there are “hidden” constra ints, due


## Page 118

110 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
to the nature of the problem, namely 0 ≤ x, y ≤ 10, which cause that line to be restricted
to a line segment in R2, which is bounded; the the endpoints of that line segment form the
“boundary”.
Example 3.25. For a rectangle whose perimeter is 20 m, use the Lagrange multiplier method
to ﬁnd the dimensions that will maximize the area.
Solution: As we saw in Example 3.24, with x and y representing the width and height,
respectively , of the rectangle, this problem can be stated as:
Maximize : f (x, y) = x y
given : g(x, y) = 2x + 2y = 20
Then solving the system of scalar and vector equations
g(x, y) = 20,
∇ f (x, y) = λ∇ g(x, y)
for some λ means solving the system of three scalar equations
g(x, y) = 20,
∂f
∂x = λ ∂g
∂x ,
∂f
∂y = λ ∂g
∂y ,
namely:
2x + 2y = 20,
y = 2λ,
x = 2λ.
The general idea is to solve for λ in the last two equations, then set those expressions equal
(since they both equal λ) to solve for x and y. Doing this we get
y
2 = λ = x
2 ⇒ x = y ,
so now substitute either of the expressions for x or y into the constraint equation to solve for
x and y:
20 = g(x, y) = 2x + 2y = 2x + 2x = 4x ⇒ x = 5 ⇒ y = 5
There must be a maximum area, since the minimum area is 0 and f (5, 5) = 25 > 0, so the
point (5, 5) that we found (called a constrained critical point ) must be the constrained maxi-
mum.
∴ The maximum area occurs for a rectangle whose width and height bo th are 5 m.


## Page 119

3.7 Lagrange Multipliers 111
Example 3.26. Find the points on the circle x2 + y2 = 80 which are closest to and farthest
from the point (1 , 2).
Solution: The distance d from any point ( x, y) to the point (1 , 2) is
d =
√
(x − 1)2 + (y − 2)2 ,
and minimizing the distance is equivalent to minimizing the s quare of the distance. Thus
the problem can be stated as:
Maximize (and minimize) : f (x, y) = (x − 1)2 + (y − 2)2
given : g(x, y) = x2 + y2 = 80
Solving ∇ f (x, y) = λ∇ g(x, y) means solving the following equations:
2(x − 1) = 2λx ,
2(y − 2) = 2λ y
Note that x ̸= 0 since otherwise we would get − 2 = 0 in the ﬁrst equation. Similarly , y ̸= 0.
So we can solve both equations for λ as follows:
x − 1
x = λ = y − 2
y ⇒ x y− y = x y− 2x ⇒ y = 2x
x
y
0
(4, 8)
(1, 2)
(− 4, − 8)
x2 + y2 = 80
Figure 3.7.1
Substituting this into g(x, y) = x2 + y2 = 80 yields 5 x2 = 80,
so x = ± 4. So the two constrained critical points are (4 , 8) and
(− 4, − 8). Since f (4, 8) = 45 and f (− 4, − 8) = 125, and since there
must be points on the circle closest to and farthest from (1 , 2),
then it must be the case that (4 , 8) is the point on the circle clos-
est to (1 , 2) and ( − 4, − 8) is the farthest from (1 , 2) (see Figure
2.7.1).
Notice that since the constraint equation x2+ y2 = 80 describes
a circle, which is a bounded set in R2, then we were guaranteed
that the constrained critical points we found were indeed the
constrained maximum and minimum.
The Lagrange multiplier method can be extended to functions of three variables.
Example 3.27.
Maximize (and minimize) : f (x, y, z) = x + z
given : g(x, y, z) = x2 + y2 + z2 = 1


## Page 120

112 CHAPTER 3. FUNCTIONS OF SEVERAL VARIABLES
Solution: Solve the system of equations g(x, y, z) = 1, ∇ f (x, y, z) = λ∇ g(x, y, z):
x2 + y2 + z2 = 1
1 = 2λx,
0 = 2λ y,
1 = 2λz,
The second equation implies λ ̸= 0 (otherwise we would have 1 = 0), so we can divide by λ in
the third equation to get y = 0 and we can divide by λ in the ﬁrst and last equations to get
x = 1
2λ = z. Substituting these expressions into the constraint equati on x2 + y2 + z2 = 1 yields
the constrained critical points
( 1/∇adicallow
2 , 0, 1/∇adicallow
2 ) and ( − 1/∇adicallow
2 , 0, − 1/∇adicallow
2 ).
Since
f ( 1/∇adicallow
2 , 0, 1/∇adicallow
2 ) > f ( − 1/∇adicallow
2 , 0, − 1/∇adicallow
2 ),
and since the constraint equation x2 + y2 + z2 = 1 describes a sphere (which is bounded) in
R3, then
(
1/∇adicallow
2 , 0, 1/∇adicallow
2
)
is the constrained maximum point and
(
− 1/∇adicallow
2 , 0, − 1/∇adicallow
2
)
is the constrained
minimum point.
Note that solving the equation ∇ f (x, y) = λ∇ g(x, y) means having to solve a system of two
(possibly nonlinear) equations in three unknowns, which as we ha ve seen before, may not be
possible to do. And the 3-variable case can get even more complic ated. All of this somewhat
restricts the usefulness of Lagrange’s method to relativel y simple functions. Luckily there
are many numerical methods for solving constrained optimizat ion problems, though we will
not discuss them here. 11
Exercises
A
1. Find the constrained maxima and minima of f (x, y) = 2x + y given that x2 + y2 = 4.
2. Find the constrained maxima and minima of f (x, y) = x y given that x2 + 3y2 = 6.
3. Find the constrained minima of f (x, y) = x2 + 3y2 given that x y= 1 and show that there is
no constrained maxima.
4. Find the points on the circle x2 + y2 = 100 which are closest to and farthest from the point
(2, 3).
11See B AZARAA , S HERALI and S HETTY .


## Page 121

3.7 Lagrange Multipliers 113
B
5. Find the constrained maxima and minima of f (x, y, z) = x + y2 + 2z given that
4x2 + 9y2 − 36z2 = 36.
6. Find the volume of the largest rectangular parallelepiped with e dges parallel to the coor-
dinate axis that can be inscribed in the ellipsoid
x2
a2 + y2
b2 + z2
c2 = 1 .
C
7. Let ( x0, y0) be a minimum point of smooth function f (x, y) with the constraint g(x, y) ≤ c.
Assume g(x0, y0) = c and ∇ g(x0, y0) ̸= 0. Show that ∇ f (x0, y0) = λ∇ g(x0, y0) for some λ ≤
0. ( Hint: Note that (x0, y0) is also a minimum point of smooth function f (x, y) with the
constraint g(x, y) = c and the points (x0, y0) − t∇ g(x0, y0) satisfy the constraint inequality
for small positive t.)


## Page 122

4 Multiple Integrals
4.1 Double Integrals
In single-variable calculus, differentiation and integrat ion are thought of as inverse opera-
tions. For instance, to integrate a function f (x) it is necessary to ﬁnd the antiderivative of f ,
that is, another function F(x) whose derivative is f (x). Is there a similar way of deﬁning in-
tegration of real-valued functions of two or more variables? The answer is yes, as we will see
shortly . Recall also that the deﬁnite integral of a nonnegati ve function f (x) ≥ 0 represented
the area “under” the curve y = f (x). As we will now see, the double integral of a nonnegative
real-valued function f (x, y) ≥ 0 represents the volume “under” the surface z = f (x, y).
Let f (x, y) be a continuous function such that f (x, y) ≥ 0 for all ( x, y) on the rectangle
R = {(x, y) : a ≤ x ≤ b, c ≤ y ≤ d} in R2. We will often write this as R = [a, b] × [c, d]. For any
number x∗ in the interval [ a, b], slice the surface z = f (x, y) with the plane x = x∗ parallel to
the yz-plane. Then the trace of the surface in that plane is the curve f (x∗ , y), where x∗ is
ﬁxed and only y varies. The area A under that curve (that is, the area of the region between
the curve and the x y-plane) as y varies over the interval [ c, d] then depends only on the
value of x∗ . So using the variable x instead of x∗ , let A(x) be that area (see Figure 4.1.1).
y
z
x
0 A(x)
R
a
x
b
c d
z = f (x, y)
Figure 4.1.1 The area A(x) varies with x
Then A(x) =
/varintd
c f (x, y) d y since we are treating x as ﬁxed, and only y varies. This makes
sense since for a ﬁxed x the function f (x, y) is a continuous function of y over the interval
[c, d], so we know that the area under the curve is the deﬁnite integral . The area A(x) is a
function of x, so by the “slice” or cross-section method from single-vari able calculus we know
114


## Page 123

4.1 Double Integrals 115
that the volume V of the solid under the surface z = f (x, y) but above the x y-plane over the
rectangle R is the integral over [ a, b] of that cross-sectional area A(x):
V =
b/dispvarint
a
A(x) dx =
b/dispvarint
a


d/dispvarint
c
f (x, y) d y

 dx (4.1)
We will always refer to this volume as “the volume under the surf ace”. The above expression
uses what are called iterated integrals . First the function f (x, y) is integrated as a func-
tion of y, treating the variable x as a constant (this is called integrating with respect to y).
That is what occurs in the “inner” integral between the square b rackets in equation (4.1).
This is the ﬁrst iterated integral. Once that integration is pe rformed, the result is then an
expression involving only x, which can then be integrated with respect to x. That is what
occurs in the “outer” integral above (the second iterated in tegral). The ﬁnal result is then
a number (the volume). This process of going through two iterat ions of integrals is called
double integration, and the last expression in equation (4.1) is called a double integral.
Notice that integrating f (x, y) with respect to y is the inverse operation of taking the
partial derivative of f (x, y) with respect to y.
Also, we could have taken the area of cross-sections under the s urface which were parallel
to the xz-plane, which would then depend only on the variable y, so that the volume would
be
V =
d/dispvarint
c


b/dispvarint
a
f (x, y) dx

 d y . (4.2)
It turns out that in general 1 the order of the iterated integrals does not matter . Also, we will
usually discard the brackets and simply write
V =
d/dispvarint
c
b/dispvarint
a
f (x, y) dx d y , (4.3)
where it is understood that the fact that dx is written before d y means that the function
f (x, y) is ﬁrst integrated with respect to x using the “inner” limits of integration a and b,
and then the resulting function is integrated with respect to y using the “outer” limits of
integration c and d. This order of integration can be changed if it is more conveni ent.
Example 4.1. Find the volume V under the plane z = 8x + 6y over the rectangle R = [0, 1] ×
[0, 2].
1due to Fubini’s Theorem . See Ch. 18 in T AYLOR and M ANN .


## Page 124

116 CHAPTER 4. MULTIPLE INTEGRALS
Solution: We see that f (x, y) = 8x + 6y ≥ 0 for 0 ≤ x ≤ 1 and 0 ≤ y ≤ 2, so:
V =
2/dispvarint
0
1/dispvarint
0
(8x + 6y) dx d y
=
2/dispvarint
0
(
4x2 + 6x y
⏐
⏐
⏐
x= 1
x= 0
)
d y
=
2/dispvarint
0
(4 + 6y) d y
= 4y + 3y2
⏐
⏐
⏐
2
0
= 20
Suppose we had switched the order of integration. We can verify tha t we still get the same
answer:
V =
1/dispvarint
0
2/dispvarint
0
(8x + 6y) d y dx
=
1/dispvarint
0
(
8x y+ 3y2
⏐
⏐
⏐
y= 2
y= 0
)
dx
=
1/dispvarint
0
(16x + 12) dx
= 8x2 + 12x
⏐
⏐
⏐
1
0
= 20
Example 4.2. Find the volume V under the surface z = ex+ y over the rectangle R = [2, 3] ×
[1, 2].
Solution: We know that f (x, y) = ex+ y > 0 for all ( x, y), so
V =
2/dispvarint
1
3/dispvarint
2
ex+ y dx d y
=
2/dispvarint
1
(
ex+ y
⏐
⏐
⏐
x= 3
x= 2
)
d y
=
2/dispvarint
1
(e y+ 3 − e y+ 2) d y
= e y+ 3 − e y+ 2
⏐
⏐
⏐
2
1


## Page 125

4.1 Double Integrals 117
= e5 − e4 − (e4 − e3) = e5 − 2e4 + e3
Recall that for a general function f (x), the integral
/varintb
a f (x) dx represents the difference of
the area below the curve y = f (x) but above the x-axis when f (x) ≥ 0, and the area above the
curve but below the x-axis when f (x) ≤ 0. Similarly , the double integral of any continuous
function f (x, y) represents the difference of the volume below the surface z = f (x, y) but above
the x y-plane when f (x, y) ≥ 0, and the volume above the surface but below the x y-plane when
f (x, y) ≤ 0. Thus, our method of double integration by means of iterated integrals can be
used to evaluate the double integral of any continuous function over a rectangle, regardless
of whether f (x, y) ≥ 0 or not.
Example 4.3. Evaluate
2π/dispvarint
0
π/dispvarint
0
sin(x + y) dx d y.
Solution: Note that f (x, y) = sin(x+ y) is both positive and negative over the rectangle [0 , π]×
[0, 2π]. We can still evaluate the double integral:
2π/dispvarint
0
π/dispvarint
0
sin(x + y) dx d y =
2π/dispvarint
0
(
− cos(x + y)
⏐
⏐
⏐
x= π
x= 0
)
d y
=
2π/dispvarint
0
(− cos(y + π) + cos y) d y
= − sin(y + π) + sin y
⏐
⏐
⏐
2π
0
= − sin 3π + sin 2π − (− sin π + sin 0)
= 0
Exercises
A
For Exercises 1–4, ﬁnd the volume under the surface z = f (x, y) over the rectangle R.
1. f (x, y) = 4x y, R = [0, 1] × [0, 1] 2. f (x, y) = ex+ y, R = [0, 1] × [− 1, 1]
3. f (x, y) = x3 + y2, R = [0, 1] × [0, 1] 4. f (x, y) = x4 + x y+ y3, R = [1, 2] × [0, 2]
For Exercises 5–12, evaluate the given double integral.
5.
1/dispvarint
0
2/dispvarint
1
(1 − y)x2 dx d y 6.
1/dispvarint
0
2/dispvarint
0
x(x + y) dx d y


## Page 126

118 CHAPTER 4. MULTIPLE INTEGRALS
7.
2/dispvarint
0
1/dispvarint
0
(x + 2) dx d y 8.
2/dispvarint
− 1
1/dispvarint
− 1
x(x y+ sin x) dx d y
9.
π/2/dispvarint
0
1/dispvarint
0
x ycos(x2 y) dx d y 10.
π/dispvarint
0
π/2/dispvarint
0
sin x cos(y − π) dx d y
11.
2/dispvarint
0
4/dispvarint
1
x y dx d y 12.
1/dispvarint
− 1
2/dispvarint
− 1
1 dx d y
13. Let M be a constant. Show that
d/dispvarint
c
b/dispvarint
a
M dx d y = M(d − c)(b − a).


## Page 127

4.2 Double Integrals Over a General Region 119
4.2 Double Integrals Over a General Region
In the previous section we got an idea of what a double integral over a rectangle represents.
We can now deﬁne the double integral of a real-valued function f (x, y) over more general
regions in R2.
Suppose that we have a region R in the x y-plane that is bounded on the left by the vertical
line x = a, bounded on the right by the vertical line x = b (where a < b), bounded below by
a curve y = g1(x), and bounded above by a curve y = g2(x), as in Figure 4.2.1(a). We will
assume that g1(x) and g2(x) do not intersect on the open interval ( a, b) (they could intersect
at the endpoints x = a and x = b, though).
a b
x
y
0
y = g2(x)
y = g1(x)
R
(a) Vertical slice:
/varintb
a
/varintg2(x)
g1(x) f (x, y) d y dx
x
y
0
x = h1(y)
x = h2(y)
R
c
d
(b) Horizontal slice:
/varintd
c
/varinth2(y)
h1(y) f (x, y) dx d y
Figure 4.2.1 Double integral over a nonrectangular region R
Then using the slice method from the previous section, the doub le integral of a real-valued
function f (x, y) over the region R, denoted by
/dispiint
R
f (x, y) d A, is given by
/dispiint
R
f (x, y) d A =
b/dispvarint
a


g2(x)/dispvarint
g1(x)
f (x, y) d y

 dx (4.4)
This means that we take vertical slices in the region R between the curves y = g1(x) and
y = g2(x). The symbol d A is sometimes called an area element or inﬁnitesimal, with the A
signifying area. Note that f (x, y) is ﬁrst integrated with respect to y, with functions of x as
the limits of integration. This makes sense since the result of the ﬁrst iterated integral will
have to be a function of x alone, which then allows us to take the second iterated integra l
with respect to x.
Similarly , if we have a region R in the x y-plane that is bounded on the left by a curve
x = h1(y), bounded on the right by a curve x = h2(y), bounded below by the horizontal line


## Page 128

120 CHAPTER 4. MULTIPLE INTEGRALS
y = c, and bounded above by the horizontal line y = d (where c < d), as in Figure 4.2.1(b)
(assuming that h1(y) and h2(y) do not intersect on the open interval ( c, d)), then taking
horizontal slices gives
/dispiint
R
f (x, y) d A =
d/dispvarint
c


h2(y)/dispvarint
h1(y)
f (x, y) dx

 d y (4.5)
Notice that these deﬁnitions include the case when the region R is a rectangle. Also, if
f (x, y) ≥ 0 for all ( x, y) in the region R, then
/iint
R
f (x, y) d A is the volume under the surface
z = f (x, y) over the region R.
Example 4.4. Assume the region R is deﬁned by the inequalities x2 ≤ y and y2 ≤ x. Rewrite
double integral /dispiint
R
f (x, y) d A,
as an iterated integral.
Solution: Let us try to write the iterated integral as in (4.5).
First we need to ﬁnd the projection of R to y-axis. In other words, we need to ﬁnd all y
such that ( x, y) belongs to R for some y. The later holds if y4 ≥ y or equivalently if y ∈ [0, 1];
in other words c = 0 and d = 1.
Now for ﬁxed y, such that 0 ≤ y ≤ 1 we need to ﬁnd all values x such that
(x, y) belongs to R. The later holds if y2 ≤ x ≥ /∇adicallow y. In other words, h1(y) = y2
and h2(y) = /∇adicallow y. That is,
/dispiint
R
f (x, y) d A =
1/dispvarint
0


/∇adicallow
y/dispvarint
y2
f (x, y) dx

 d y.
Note that the region R does not change if you switch x and y. Therefore, the same integral
could be written as
/dispiint
R
f (x, y) d A =
1/dispvarint
0


/∇adicallow
x/dispvarint
x2
f (x, y) d y

 dx.
Example 4.5. Find the volume V under the plane z = 8x+ 6y over the plane region R deﬁned
by the inequalities 0 ≤ x ≤ 1 and 0 ≤ y ≤ 2x2}.


## Page 129

4.2 Double Integrals Over a General Region 121
x
y
0
y = 2x2
R
1
Figure 4.2.2
Solution: The region R is shown in Figure 3.2.2. Using vertical slices we
get:
V =
/dispiint
R
(8x + 6y) d A
=
1/dispvarint
0


2x2
/dispvarint
0
(8x + 6y) d y

 dx
=
1/dispvarint
0
(
8x y+ 3y2
⏐
⏐
⏐
y= 2x2
y= 0
)
dx
=
1/dispvarint
0
(16x3 + 12x4) dx
= 4x4 + 12
5 x5
⏐
⏐
⏐
1
0
= 4 + 12
5 = 32
5 = 6.4
x
y
0
2
x =
√
y/2 R
1
Figure 4.2.3
We get the same answer using horizontal slices (see Figure 3.2 .3):
V =
/dispiint
R
(8x + 6y) d A
=
2/dispvarint
0



1/dispvarint
/∇adicallow
y/2
(8x + 6y) dx


 d y
=
2/dispvarint
0
(
4x2 + 6x y
⏐
⏐
⏐
x= 1
x=
/∇adicallow
y/2
)
d y
=
2/dispvarint
0
(4 + 6y − (2y + 6/∇adicallow
2 y/∇adicallow y )) d y =
2/dispvarint
0
(4 + 4y − 3
/∇adicallow
2y3/2) d y
= 4y + 2y2 − 6
/∇adicallow
2
5 y5/2
⏐
⏐
⏐
2
0
= 8 + 8 − 6
/∇adicallow
2
/∇adicallow
32
5 = 16 − 48
5 = 32
5 = 6.4
Example 4.6. Find the volume V of the solid bounded by the three coordinate planes and
the plane 2 x + y + 4z = 4.
Solution: The solid is shown in Figure 4.2.4(a) with a typical vertical sli ce. The volume V
is given by
/iint
R
f (x, y) d A, where f (x, y) = z = 1
4 (4 − 2x − y) and the region R, shown in Figure


## Page 130

122 CHAPTER 4. MULTIPLE INTEGRALS
y
z
x
0 (0, 4, 0)
(0, 0, 1)
(2, 0, 0)
2x + y + 4z = 4
(a)
x
y
0
y = − 2x + 4
R
2
4
(b)
Figure 4.2.4
4.2.4(b), is R = {(x, y) : 0 ≤ x ≤ 2, 0 ≤ y ≤ − 2x + 4}. Using vertical slices in R gives
V =
/dispiint
R
1
4 (4 − 2x − y) d A
=
2/dispvarint
0
[ − 2x+ 4/dispvarint
0
1
4 (4 − 2x − y) d y
]
dx
=
2/dispvarint
0
(
− 1
8 (4 − 2x − y)2
⏐
⏐
⏐
y=− 2x+ 4
y= 0
)
dx
=
2/dispvarint
0
1
8 (4 − 2x)2 dx
= − 1
48 (4 − 2x)3
⏐
⏐
⏐
2
0
= 64
48 = 4
3
For a general region R, which may not be one of the types of regions we have considered so
far , the double integral
/iint
R
f (x, y) d A is deﬁned as follows. Assume that f (x, y) is a nonnega-
tive real-valued function and that R is a bounded region in R2, so it can be enclosed in some
rectangle [a, b]× [c, d]. Then divide that rectangle into a grid of subrectangles. Only consider
the subrectangles that are enclosed completely within the reg ion R, as shown by the shaded
subrectangles in Figure 4.2.5(a). In any such subrectangle [xi, xi+ 1] × [yj, yj+ 1], pick a point
(xi∗ , yj∗ ). Then the volume under the surface z = f (x, y) over that subrectangle is approxi-
mately f (xi∗ , yj∗ ) ∆xi ∆yj, where ∆xi = xi+ 1 − xi, ∆yj = yj+ 1 − yj, and f (xi∗ , yj∗ ) is the height and
∆xi ∆yj is the base area of a parallelepiped, as shown in Figure 4.2.5(b). T hen the total vol-
ume under the surface is approximately the sum of the volumes of a ll such parallelepipeds,
namely ∑
j
∑
i
f (xi∗ , yj∗ ) ∆xi ∆yj , (4.6)


## Page 131

4.2 Double Integrals Over a General Region 123
where the summation occurs over the indices of the subrectangl es inside R. If we take
smaller and smaller subrectangles, so that the length of the largest diagonal of the subrect-
angles goes to 0, then the subrectangles begin to ﬁll more and more of the region R, and so
the above sum approaches the actual volume under the surface z = f (x, y) over the region R.
We then deﬁne
/iint
R
f (x, y) d A as the limit of that double summation (the limit is taken over a ll
subdivisions of the rectangle [ a, b] × [c, d] as the largest diagonal of the subrectangles goes
to 0).
a b x i xi+ 1
x
y
0
d
c
yj
yj+ 1
(xi∗ , yj∗ )
(a) Subrectangles inside the region R
y
z
x
0
R
xi
xi+ 1
yj yj+ 1
z = f (x, y)∆yj
∆xi
(xi∗ , yj∗ )
f (xi∗ , yj∗ )
(b) Parallelepiped over a subrectangle,
with volume f (xi∗ , yj∗ ) ∆xi ∆yj
Figure 4.2.5 Double integral over a general region R
A similar deﬁnition can be made for a function f (x, y) that is not necessarily always non-
negative: just replace each mention of volume by the negative volume in the description
above when f (x, y) < 0. In the case of a region of the type shown in Figure 4.2.1, using the def-
inition of the Riemann integral from single-variable calcu lus, our deﬁnition of
/iint
R
f (x, y) d A
reduces to a sequence of two iterated integrals.
Finally , the region R does not have to be bounded. We can evaluate improper double inte-
grals (that is, over an unbounded region, or over a region which contains points where the
function f (x, y) is not deﬁned) as a sequence of iterated improper single-variab le integrals.
Example 4.7. Evaluate
∞/dispvarint
1
1/x2
/dispvarint
0
2y d y dx.


## Page 132

124 CHAPTER 4. MULTIPLE INTEGRALS
Solution:
∞/dispvarint
1
1/x2
/dispvarint
0
2y d y dx =
∞/dispvarint
1
(
y2
⏐
⏐
⏐
y= 1/x2
y= 0
)
dx
=
∞/dispvarint
1
x− 4 dx = − 1
3 x− 3
⏐
⏐
⏐
∞
1
= 0 − (− 1
3 ) = 1
3
Exercises
A
For Exercises 1–8, evaluate the given double integral.
1.
1/dispvarint
0
1/dispvarint
/∇adicallow
x
24x2 y d y dx 2.
π/dispvarint
0
y/dispvarint
0
sin x dx d y
3.
2/dispvarint
1
ln x/dispvarint
0
4x d y dx 4.
2/dispvarint
0
2y/dispvarint
0
e y2
dx d y
5.
π/2/dispvarint
0
y/dispvarint
0
cos x sin y dx d y 6.
∞/dispvarint
0
∞/dispvarint
0
x ye− (x2+ y2) dx d y
7.
2/dispvarint
0
y/dispvarint
0
1 dx d y 8.
1/dispvarint
0
x2
/dispvarint
0
2 d y dx
For Exercises 9–10 evaluate /dispiint
R
f (x, y) d A,
where
9. f (x, y) = x y and R is the intersection of the unit disc x2 + y2 ≤ 1 and the positive quadrant.
10. f (x, y) = x2 + y and R is the triangle with vertices (0 , 0), (2, 0) and (0 , 1).
11. Find the volume V of the solid bounded by the three coordinate planes and the plane
x + y + z = 1.
12. Find the volume V of the solid bounded by the three coordinate planes and the plane
3x + 2y + 5z = 6.
B
13. Explain why the double integral
/iint
R
1 d A gives the area of the region R. For simplicity ,
you can assume that R is a region of the type shown in Figure 4.2.1(a).
C


## Page 133

4.2 Double Integrals Over a General Region 125
b
c
a
Figure 4.2.6
14. Prove that the volume of a tetrahedron with mutually perpendic-
ular adjacent sides of lengths a, b, and c, as in Figure 3.2.6, is abc
6 .
(Hint: Mimic Example 4.6, and recall from Section 1.5 how three
noncollinear points determine a plane. )
15. Show how Exercise 12 can be used to solve Exercise 10.
B
For Exercises 16–17 rewrite double integral
/dispiint
R
f (x, y) d A,
as an iterated integral. ( Hint: try to visualize the region. )
16. If the region R is deﬁned by the inequalities 2 y2 ≤ x ≤ 1 + y2.
17. If the region R is deﬁned by the inequalities x ≤ 2y ≤ 4x ≤ 1.


## Page 134

126 CHAPTER 4. MULTIPLE INTEGRALS
4.3 Triple Integrals
Our deﬁnition of a double integral of a real-valued function f (x, y) over a region R in R2 can
be extended to deﬁne a triple integral of a real-valued function f (x, y, z) over a solid S in R3.
We simply proceed as before: the solid S can be enclosed in some rectangular parallelepiped,
which is then divided into subparallelepipeds. In each subparallele piped inside S, with sides
of lengths ∆x, ∆y and ∆z, pick a point ( x∗ , y∗ , z∗ ). Then deﬁne the triple integral of f (x, y, z)
over S, denoted by
/iiint
S
f (x, y, z) dV , by
/dispiiint
S
f (x, y, z) dV = lim
∑ ∑ ∑
f (x∗ , y∗ , z∗ ) ∆x ∆y ∆z , (4.7)
where the limit is over all divisions of the rectangular paralle lepiped enclosing S into sub-
parallelepipeds whose largest diagonal is going to 0, and the triple summation is over all the
subparallelepipeds inside S. It can be shown that this limit does not depend on the choice
of the rectangular parallelepiped enclosing S. The symbol dV is often called the volume
element.
Physically , what does the triple integral represent? We saw that a double integral could
be thought of as the volume under a two-dimensional surface. It t urns out that the triple
integral simply generalizes this idea: it can be thought of as r epresenting the hypervolume
under a three-dimensional hypersurface w = f (x, y, z) whose graph lies in R4. In general,
the word “volume” is often used as a general term to signify the same concept for any n-
dimensional object (including length in R1, area in R2 and volume in R3). It may be hard to
get a grasp on the concept of the “volume” of a four-dimensional object, but at least we now
know how to calculate that volume!
In the case where S is a rectangular parallelepiped [ x1, x2] × [y1, y2] × [z1, z2], that is, S =
{(x, y, z) : x1 ≤ x ≤ x2, y1 ≤ y ≤ y2, z1 ≤ z ≤ z2}, the triple integral is a sequence of three iterated
integrals, namely
/dispiiint
S
f (x, y, z) dV =
z2/dispvarint
z1
y2/dispvarint
y1
x2/dispvarint
x1
f (x, y, z) dx d y d z , (4.8)
where the order of integration does not matter . This is the simple st case.
A more complicated case is where S is a solid which is bounded below by a surface z =
g1(x, y), bounded above by a surface z = g2(x, y), y is bounded between two curves h1(x) and
h2(x), and x varies between a and b. Then
/dispiiint
S
f (x, y, z) dV =
b/dispvarint
a
h2(x)/dispvarint
h1(x)
g2(x,y)/dispvarint
g1(x,y)
f (x, y, z) d z d y dx . (4.9)
Notice in this case that the ﬁrst iterated integral will resul t in a function of x and y (since its
limits of integration are functions of x and y), which then leaves you with a double integral of
a type that we learned how to evaluate in Section 3.2. There are, of course, many variations


## Page 135

4.3 Triple Integrals 127
on this case (for example, changing the roles of the variables x, y, z), so as you can probably
tell, triple integrals can be quite tricky . At this point, just learning how to evaluate a triple
integral, regardless of what it represents, is the most importan t thing. We will see some
other ways in which triple integrals are used later in the text.
Example 4.8. Evaluate
3/dispvarint
0
2/dispvarint
0
1/dispvarint
0
(x y+ z) dx d y d z.
Solution:
3/dispvarint
0
2/dispvarint
0
1/dispvarint
0
(x y+ z) dx d y d z =
3/dispvarint
0
2/dispvarint
0
(
1
2 x2 y + xz
⏐
⏐
⏐
x= 1
x= 0
)
d y d z
=
3/dispvarint
0
2/dispvarint
0
(1
2 y + z
)
d y d z
=
3/dispvarint
0
(
1
4 y2 + yz
⏐
⏐
⏐
y= 2
y= 0
)
d z
=
3/dispvarint
0
(1 + 2z) d z
= z + z2
⏐
⏐
⏐
3
0
= 12
Example 4.9. Evaluate
1/dispvarint
0
1− x/dispvarint
0
2− x− y/dispvarint
0
(x + y + z) d z d y dx.
Solution:
1/dispvarint
0
1− x/dispvarint
0
2− x− y/dispvarint
0
(x + y + z) d z d y dx =
1/dispvarint
0
1− x/dispvarint
0
(
(x + y)z + 1
2 z2
⏐
⏐
⏐
z= 2− x− y
z= 0
)
d y dx
=
1/dispvarint
0
1− x/dispvarint
0
(
(x + y)(2 − x − y) + 1
2 (2 − x − y)2)
d y dx
=
1/dispvarint
0
1− x/dispvarint
0
(
2 − 1
2 x2 − x y− 1
2 y2)
d y dx
=
1/dispvarint
0
(
2y − 1
2 x2 y − x y− 1
2 x y2 − 1
6 y3
⏐
⏐
⏐
y= 1− x
y= 0
)
dx
=
1/dispvarint
0
(11
6 − 2x + 1
6 x3)
dx


## Page 136

128 CHAPTER 4. MULTIPLE INTEGRALS
= 11
6 x − x2 + 1
24 x4
⏐
⏐
⏐
1
0
= 7
8
Note that the volume V of a solid in R3 is given by
V =
/dispiiint
S
1 dV . (4.10)
Since the function being integrated is the constant 1, then t he above triple integral reduces
to a double integral of the types that we considered in the previous section if the solid is
bounded above by some surface z = f (x, y) and bounded below by the x y-plane z = 0. There
are many other possibilities. For example, the solid could be b ounded below and above by
surfaces z = g1(x, y) and z = g2(x, y), respectively , with y bounded between two curves h1(x)
and h2(x), and x varies between a and b. Then
V =
/dispiiint
S
1 dV =
b/dispvarint
a
h2(x)/dispvarint
h1(x)
g2(x,y)/dispvarint
g1(x,y)
1 d z d y dx=
b/dispvarint
a
h2(x)/dispvarint
h1(x)
(g2(x, y) − g1(x, y)) d y dx
just like in equation (4.9). See Exercise 10 for an example.
Exercises
A
For Exercises 1–8, evaluate the given triple integral.
1.
3/dispvarint
0
2/dispvarint
0
1/dispvarint
0
x yz dx d y d z 2.
1/dispvarint
0
x/dispvarint
0
y/dispvarint
0
x yz d z d y dx
3.
π/dispvarint
0
x/dispvarint
0
x y/dispvarint
0
x2 sin z d z d y dx 4.
1/dispvarint
0
z/dispvarint
0
y/dispvarint
0
ze y2
dx d y d z
5.
e/dispvarint
1
y/dispvarint
0
1/y/dispvarint
0
x2 z dx d z d y 6.
2/dispvarint
1
y2
/dispvarint
0
z2
/dispvarint
0
yz dx d z d y
7.
2/dispvarint
1
4/dispvarint
2
3/dispvarint
0
1 dx d y d z 8.
1/dispvarint
0
1− x/dispvarint
0
1− x− y/dispvarint
0
1 d z d y dx
9. Let M be a constant. Show that
z2/dispvarint
z1
y2/dispvarint
y1
x2/dispvarint
x1
M dx d y d z= M(z2 − z1)(y2 − y1)(x2 − x1).
B


## Page 137

4.3 Triple Integrals 129
10. Find the volume V of the solid S bounded by the three coordinate planes, bounded above
by the plane x + y + z = 2, and bounded below by the plane z = x + y.
11. Let S be the solid deﬁned by the inequalities x2 − 1 ≤ y ≤ 1 − z2. Rewrite the triple
integral /dispiiint
S
f (x, y, z) dV ,
as an iterated integral.
C
12. Show that
b/dispvarint
a
z/dispvarint
a
y/dispvarint
a
f (x) dx d y d z=
b/dispvarint
a
(b− x)2
2 f (x) dx.
(Hint: Think of how changing the order of integration in the triple integral changes the
limits of integration. )


## Page 138

130 CHAPTER 4. MULTIPLE INTEGRALS
4.4 Numerical Approximation of Multiple Integrals
As you have seen, calculating multiple integrals is tricky ev en for simple functions and
regions. For complicated functions, it may not be possible to e valuate one of the iterated in-
tegrals in a simple closed form. Luckily there are numerical m ethods for approximating the
value of a multiple integral. The method we will discuss is called the Monte Carlo method .
The idea behind it is based on the concept of the average value of a function, which you
learned in single-variable calculus. Recall that for a cont inuous function f (x), the average
value ¯f of f over an interval [ a, b] is deﬁned as
¯f = 1
b − a
b/dispvarint
a
f (x) dx . (4.11)
The quantity b − a is the length of the interval [ a, b], which can be thought of as the
“volume” of the interval. Applying the same reasoning to funct ions of two or three variables,
we deﬁne the average value of f (x, y) over a region R to be
¯f = 1
A(R)
/dispiint
R
f (x, y) d A , (4.12)
where A(R) is the area of the region R, and we deﬁne the average value of f (x, y, z) over a
solid S to be
¯f = 1
V (S)
/dispiiint
S
f (x, y, z) dV , (4.13)
where V (S) is the volume of the solid S. Thus, for example, we have
/dispiint
R
f (x, y) d A = A(R) ¯f . (4.14)
The average value of f (x, y) over R can be thought of as representing the sum of all the
values of f divided by the number of points in R. However , we can not take the sum literary
since there are an inﬁnite number of points in any region (in fa ct, uncounably many — one
can not enumerate them by natural numbers). But what if we took a very large number N
of random points in the region R (which can be generated by a computer) and then took the
average of the values of f for those points, and used that average as the value of ¯f ? This is
exactly what the Monte Carlo method does. So in formula (4.14) t he approximation we get
is
/dispiint
R
f (x, y) d A ≈ A(R) ¯f ± A(R)
√
f 2 − ( ¯f )2
N , (4.15)
where
¯f = 1
N
N∑
i= 1
f (xi, yi) and f 2 = 1
N
N∑
i= 1
( f (xi, yi))2 , (4.16)


## Page 139

4.4 Numerical Approximation of Multiple Integrals 131
with the sums taken over the N random points ( x1, y1), . . ., ( xN, yN). The ± “error term” in
formula (4.15) does not really provide hard bounds on the approxima tion. It represents a
single standard deviation from the expected value of the integral. That is, it provides a likely
bound on the error . Due to its use of random points, the Monte Carl o method is an example
of a probabilistic method (as opposed to deterministic methods such as Newton’s method,
which use a speciﬁc formula for generating points).
For example, we can use formula (4.15) to approximate the volume V under the plane
z = 8x + 6y over the rectangle R = [0, 1] × [0, 2]. In Example 4.1 in Section 3.1, we showed
that the actual volume is 20. Below is a code listing (montecar lo.java) for a Java program
that calculates the volume, using a number of points N that is passed on the command line
as a parameter .
//Program to approximate the double integral of f(x,y)=8x+ 6y
//over the rectangle [0,1]x[0,2].
public class montecarlo {
public static void main(String[] args) {
//Get the number N of random points as a command-line paramet er
int N = Integer.parseInt(args[0]);
double x = 0; //x-coordinate of a random point
double y = 0; //y-coordinate of a random point
double f = 0.0; //Value of f at a random point
double mf = 0.0; //Mean of the values of f
double mf2 = 0.0; //Mean of the values of f^2
for (int i=0;i<N;i++) { //Get the random coordinates
x = Math.random(); //x is between 0 and 1
y = 2 * Math.random(); //y is between 0 and 2
f = 8 *x + 6 *y; //Value of the function
mf = mf + f; //Add to the sum of the f values
mf2 = mf2 + f *f; //Add to the sum of the f^2 values
}
mf = mf/N; //Compute the mean of the f values
mf2 = mf2/N; //Compute the mean of the f^2 values
System.out.println("N = " + N + ": integral = " + vol() *mf + " +/- "
+ vol() *Math.sqrt((mf2 - Math.pow(mf,2))/N)); //Print the result
}
//The volume of the rectangle [0,1]x[0,2]
public static double vol() {
return 1*2;
}
}
Listing 4.1 Program listing for montecarlo.java
The results of running this program with various numbers of ran dom points (for instance,
java montecarlo 100 ) are shown below:


## Page 140

132 CHAPTER 4. MULTIPLE INTEGRALS
N = 10: 19.36543087722646 +/- 2.7346060413546147
N = 100: 21.334419561385353 +/- 0.7547037194998519
N = 1000: 19.807662237526227 +/- 0.26701709691370235
N = 10000: 20.080975812043256 +/- 0.08378816229769506
N = 100000: 20.009403854556716 +/- 0.026346782289498317
N = 1000000: 20.000866994982314 +/- 0.008321168748642816
As you can see, the approximation is fairly good. As N → ∞ , it can be shown that the
Monte Carlo approximation converges to the actual volume (on t he order of O(
/∇adicallow
N), in com-
putational complexity terminology).
In the above example the region R was a rectangle. To use the Monte Carlo method for
a nonrectangular (bounded) region R, only a slight modiﬁcation is needed. Pick a rectangle
˜R that encloses R, and generate random points in that rectangle as before. Then u se those
points in the calculation of ¯f only if they are inside R. There is no need to calculate the area
of R for formula (4.15) in this case, since the exclusion of points not inside R allows you to
use the area of the rectangle ˜R instead, similar to before.
For instance, in Example 4.5 we showed that the volume under the su rface z = 8x + 6y
over the nonrectangular region R = {(x, y) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 2x2} is 6 .4. Since the rectangle
˜R = [0, 1] × [0, 2] contains R, we can use the same program as before, with the only change
being a check to see if y < 2x2 for a random point ( x, y) in [0 , 1] × [0, 2]. Listing 4.2 below
contains the code (montecarlo2.java):
//Program to approximate the double integral of f(x,y)=8x+ 6y over the
//region bounded by x=0, x=1, y=0, and y=2x^2
public class montecarlo2 {
public static void main(String[] args) {
//Get the number N of random points as a command-line paramet er
int N = Integer.parseInt(args[0]);
double x = 0; //x-coordinate of a random point
double y = 0; //y-coordinate of a random point
double f = 0.0; //Value of f at a random point
double mf = 0.0; //Mean of the values of f
double mf2 = 0.0; //Mean of the values of f^2
for (int i=0;i<N;i++) { //Get the random coordinates
x = Math.random(); //x is between 0 and 1
y = 2 * Math.random(); //y is between 0 and 2
if (y < 2 *Math.pow(x,2)) { //The point is in the region
f = 8 *x + 6 *y; //Value of the function
mf = mf + f; //Add to the sum of the f values
mf2 = mf2 + f *f; //Add to the sum of the f^2 values
}
}
mf = mf/N; //Compute the mean of the f values
mf2 = mf2/N; //Compute the mean of the f^2 values
System.out.println("N = " + N + ": integral = " + vol() *mf +


## Page 141

4.4 Numerical Approximation of Multiple Integrals 133
" +/- " + vol() *Math.sqrt((mf2 - Math.pow(mf,2))/N));
}
//The volume of the rectangle [0,1]x[0,2]
public static double vol() {
return 1*2;
}
}
Listing 4.2 Program listing for montecarlo2.java
The results of running the program with various numbers of rando m points (for instance,
java montecarlo2 1000 ) are shown below:
N = 10: integral = 6.95747529014894 +/- 2.9185131565120592
N = 100: integral = 6.3149056229650355 +/- 0.9549009662159 909
N = 1000: integral = 6.477032813858756 +/- 0.3191683726097 3624
N = 10000: integral = 6.349975080015089 +/- 0.100400863468 95105
N = 100000: integral = 6.440184132811864 +/- 0.03200476870 881392
N = 1000000: integral = 6.417050897922222 +/- 0.0100945440 9789472
To use the Monte Carlo method to evaluate triple integrals, yo u will need to generate
random triples ( x, y, z) in a parallelepiped, instead of random pairs ( x, y) in a rectangle, and
use the volume of the parallelepiped instead of the area of a rect angle in formula (4.15) (see
Exercise 2). For a more detailed discussion of numerical integ ration methods, see P RESS et
al.
Exercises
C
1. Write a program that uses the Monte Carlo method to approximate t he double integral
/dispiint
R
ex y d A,
where R = [0, 1] × [0, 1]. Show the program output for N = 10, 100, 1000, 10000, 100000
and 1000000 random points.
2. Write a program that uses the Monte Carlo method to approximate t he triple integral
/dispiiint
S
ex yz dV ,
where S = [0, 1] × [0, 1] × [0, 1]. Show the program output for N = 10, 100, 1000, 10000,
100000 and 1000000 random points.


## Page 142

134 CHAPTER 4. MULTIPLE INTEGRALS
3. Repeat Exercise 1 with the region R = {(x, y) : − 1 ≤ x ≤ 1, 0 ≤ y ≤ x2}.
4. Repeat Exercise 2 with the solid S = {(x, y, z) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 1, 0 ≤ z ≤ 1 − x − y}.
5. Use the Monte Carlo method to approximate the volume of a sphere o f radius 1.
6. Use the Monte Carlo method to approximate the volume of the elli psoid x2
9 + y2
4 + z2
1 = 1.


## Page 143

4.5 Change of Variables in Multiple Integrals 135
4.5 Change of Variables in Multiple Integrals
Given the difﬁculty of evaluating multiple integrals, the reade r may be wondering if it is
possible to simplify those integrals using a suitable substit ution for the variables. The an-
swer is yes, though it is a bit more complicated than the substit ution method which you
learned in single-variable calculus.
Recall that if you are given, for example, the deﬁnite integral
2/dispvarint
1
x3
√
x2 − 1 dx ,
then you would make the substitution
u = x2 − 1 ⇒ x2 = u + 1
du = 2x dx
which changes the limits of integration
x = 1 ⇒ u = 0
x = 2 ⇒ u = 3
so that we get
2/dispvarint
1
x3
√
x2 − 1 dx =
2/dispvarint
1
1
2 x2 ·2x
√
x2 − 1 dx
=
3/dispvarint
0
1
2 (u + 1)
/∇adicallow
u du
= 1
2
3/dispvarint
0
(
u3/2 + u1/2
)
du , which can be integrated to give
= 14
/∇adicallow
3
5 .
Let us take a different look at what happened when we did that substitu tion, which will give
some motivation for how substitution works in multiple integr als. First, we let u = x2 − 1.
On the interval of integration [1 , 2], the function x /mapstocha∇→x2 − 1 is strictly increasing (and maps
[1, 2] onto [0 , 3]) and hence has an inverse function (deﬁned on the interval [ 0, 3]). That is,
on [0, 3] we can deﬁne x as a function of u, namely
x = g(u) =
/∇adicallow
u + 1 .
Then substituting that expression for x into the function f (x) = x3/∇adicallow
x2 − 1 gives
f (x) = f (g(u)) = (u + 1)3/2/∇adicallow
u ,


## Page 144

136 CHAPTER 4. MULTIPLE INTEGRALS
and we see that
dx
du = g ′(u) ⇒ dx = g ′(u) du
dx = 1
2 (u + 1)− 1/2 du ,
so since
g(0) = 1 ⇒ 0 = g− 1(1)
g(3) = 2 ⇒ 3 = g− 1(2)
then performing the substitution as we did earlier gives
2/dispvarint
1
f (x) dx =
2/dispvarint
1
x3
√
x2 − 1 dx
=
3/dispvarint
0
1
2 (u + 1)
/∇adicallow
u du , which can be written as
=
3/dispvarint
0
(u + 1)3/2/∇adicallow
u ·1
2 (u + 1)− 1/2 du , which means
2/dispvarint
1
f (x) dx =
g− 1(2)/dispvarint
g− 1(1)
f (g(u)) g ′(u) du .
In general, if x = g(u) is a one-to-one, differentiable function from an interval [ c, d] (which
you can think of as being on the “ u-axis”) onto an interval [ a, b] (on the x-axis), which means
that g ′(u) ̸= 0 on the interval ( c, d), so that a = g(c) and b = g(d), then c = g− 1(a) and d =
g− 1(b), and
b/dispvarint
a
f (x) dx =
g− 1(b)/dispvarint
g− 1(a)
f (g(u)) g ′(u) du . (4.17)
This is called the change of variable formula for integrals of single-variable functions, and it
is what you were implicitly using when doing integration by substi tution.
This formula turns out to be a special case of a more general for mula which can be used
to evaluate multiple integrals. We will state the formulas for double and triple integrals
involving real-valued functions of two and three variables, respectively . We will assume
that all the functions involved are continuously differenti able and that the regions and solids
involved all have “reasonable” boundaries. The proof of the fo llowing theorem is beyond the
scope of the text. 2
2See T AYLOR and M ANN , § 15.32 and § 15.62 for all the details.


## Page 145

4.5 Change of Variables in Multiple Integrals 137
Theorem 4.1. Change of Variables Formula for Multiple Integrals
Let x = x(u, v) and y = y(u, v) deﬁne a one-to-one mapping of a region R′ in the uv-plane onto
a region R in the x y-plane such that the determinant
J(u, v) =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
∂x
∂u
∂x
∂v
∂y
∂u
∂y
∂v
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
(4.18)
is never 0 in R′. Then
/dispiint
R
f (x, y) d A(x, y) =
/dispiint
R′
f (x(u, v), y(u, v)) | J(u, v)| d A(u, v) . (4.19)
We use the notation d A(x, y) and d A(u, v) to denote the area element in the ( x, y) and ( u, v)
coordinates, respectively .
Similarly , if x = x(u, v, w), y = y(u, v, w) and z = z(u, v, w) deﬁne a one-to-one mapping of
a solid S′ in uvw-space onto a solid S in x yz-space such that the determinant
J(u, v, w) =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
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
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
(4.20)
is never 0 in S′, then
/dispiiint
S
f (x, y, z) dV (x, y, z) =
/dispiiint
S′
f (x(u, v, w), y(u, v, w), z(u, v, w)) | J(u, v, w)| dV (u, v, w) . (4.21)
The determinant J(u, v) in formula (4.18) is called the Jacobian of x and y with respect
to u and v, and is sometimes written as
J(u, v) = ∂(x, y)
∂(u, v) . (4.22)
Similarly , the Jacobian J(u, v, w) of three variables is sometimes written as
J(u, v, w) = ∂(x, y, z)
∂(u, v, w) . (4.23)
Notice that formula (4.19) is saying that d A(x, y) = | J(u, v)| d A(u, v), which you can think of
as a two-variable version of the relation dx = g ′(u) du in the single-variable case.
The following example shows how the change of variables formula is used.
Example 4.10. Evaluate
/dispiint
R
e
x− y
x+ y d A, where R = {(x, y) : x ≥ 0, y ≥ 0, x + y ≤ 1}.


## Page 146

138 CHAPTER 4. MULTIPLE INTEGRALS
Solution: First, note that evaluating this double integral without using substitution is prob-
ably impossible, at least in a closed form. By looking at the nu merator and denominator of
the exponent of e, we will try the substitution u = x − y and v = x + y. To use the change of
variables formula (4.19), we need to write both x and y in terms of u and v. So solving for
x and y gives x = 1
2 (u + v) and y = 1
2 (v − u). In Figure 4.5.1 below , we see how the mapping
x = x(u, v) = 1
2 (u + v), y = y(u, v) = 1
2 (v − u) maps the region R′ onto R in a one-to-one manner .
x
y
0
x + y = 1
1
1
R u
v
0
1
− 1 1
R′
u = v u= − v
x = 1
2 (u + v)
y = 1
2 (v − u)
Figure 4.5.1 The regions R and R′
Now we see that
J(u, v) =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
∂x
∂u
∂x
∂v
∂y
∂u
∂y
∂v
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
=
⏐
⏐
⏐
⏐
⏐
1
2
1
2
− 1
2
1
2
⏐
⏐
⏐
⏐
⏐ = 1
2 ⇒ | J(u, v)| =
⏐
⏐
⏐
⏐
1
2
⏐
⏐
⏐
⏐ = 1
2 ,
so using horizontal slices in R′, we have
/dispiint
R
e
x− y
x+ y d A =
/dispiint
R′
f (x(u, v), y(u, v)) | J(u, v)| d A
=
1/dispvarint
0
v/dispvarint
− v
e
u
v 1
2 du dv
=
1/dispvarint
0
(
v
2 e
u
v
⏐
⏐
⏐
u= v
u=− v
)
dv
=
1/dispvarint
0
v
2 (e − e− 1) dv
= v2
4 (e − e− 1)
⏐
⏐
⏐
1
0
= 1
4
(
e − 1
e
)
= e2 − 1
4e
The change of variables formula can be used to evaluate double integrals in polar coordi-
nates. Letting
x = x(r, θ) = r cos θ and y = y(r, θ) = r sin θ ,


## Page 147

4.5 Change of Variables in Multiple Integrals 139
we have
J(u, v) =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
∂x
∂r
∂x
∂θ
∂y
∂r
∂y
∂θ
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
=
⏐
⏐
⏐
⏐
⏐
cos θ − r sin θ
sin θ r cos θ
⏐
⏐
⏐
⏐
⏐ = r cos2 θ + r sin2 θ = r ⇒ | J(u, v)| = | r| = r ,
so we have the following formula:
Double Integral in Polar Coordinates
/dispiint
R
f (x, y) dx d y =
/dispiint
R′
f (r cos θ, r sin θ) r dr dθ , (4.24)
where the mapping x = r cos θ, y = r sin θ maps the region R′ in the rθ-plane onto the
region R in the x y-plane in a one-to-one manner .
Example 4.11. Find the volume V inside the paraboloid z = x2 + y2 for 0 ≤ z ≤ 1.
y
z
x
0
x2 + y2 = 1
1
Figure 4.5.2 z = x2 + y2
Solution: Using vertical slices, we see that
V =
/dispiint
R
(1 − z) d A =
/dispiint
R
(1 − (x2 + y2)) d A ,
where R = {(x, y) : x2 + y2 ≤ 1} is the unit disk in R2 (see
Figure 3.5.2). In polar coordinates ( r, θ) we know that
x2 + y2 = r2 and that the unit disk R is the set R′= {(r, θ) :
0 ≤ r ≤ 1, 0 ≤ θ ≤ 2π}. Thus,
V =
2π/dispvarint
0
1/dispvarint
0
(1 − r2) r dr dθ
=
2π/dispvarint
0
1/dispvarint
0
(r − r3) dr dθ
=
2π/dispvarint
0
(
r2
2 − r4
4
⏐
⏐
⏐
r= 1
r= 0
)
dθ
=
2π/dispvarint
0
1
4 dθ
= π
2
Example 4.12. Find the volume V inside the cone z =
√
x2 + y2 for 0 ≤ z ≤ 1.


## Page 148

140 CHAPTER 4. MULTIPLE INTEGRALS
y
z
x
0
x2 + y2 = 1
1
Figure 4.5.3 z =
√
x2 + y2
Solution: Using vertical slices, we see that
V =
/dispiint
R
(1 − z) d A =
/dispiint
R
(
1 −
√
x2 + y2
)
d A ,
where R = {(x, y) : x2 + y2 ≤ 1} is the unit disk in R2
(see Figure 3.5.3). In polar coordinates ( r, θ) we know
that
√
x2 + y2 = r and that the unit disk R is the set
R′= {(r, θ) : 0 ≤ r ≤ 1, 0 ≤ θ ≤ 2π}. Thus,
V =
2π/dispvarint
0
1/dispvarint
0
(1 − r) r dr dθ
=
2π/dispvarint
0
1/dispvarint
0
(r − r2) dr dθ
=
2π/dispvarint
0
(
r2
2 − r3
3
⏐
⏐
⏐
r= 1
r= 0
)
dθ
=
2π/dispvarint
0
1
6 dθ
= π
3
In a similar fashion, it can be shown (see Exercises 5–6) that t riple integrals in cylindrical
and spherical coordinates take the following forms:
Triple Integral in Cylindrical Coordinates
/dispiiint
S
f (x, y, z) dx d y d z =
/dispiiint
S′
f (r cos θ, r sin θ, z) r dr dθ d z , (4.25)
where the mapping x = r cos θ, y = r sin θ, z = z maps the solid S′ in rθz-space onto the
solid S in x yz-space in a one-to-one manner .
Triple Integral in Spherical Coordinates
/dispiiint
S
f (x, y, z) dx d y d z =
/dispiiint
S′
f (ρ sin φ cos θ, ρ sin φ sin θ, ρ cos φ) ρ2 sin φ dρ dφ dθ , (4.26)
where the mapping x = ρ sin φ cos θ, y = ρ sin φ sin θ, z = ρ cos φ maps the solid S′ in ρφθ-
space onto the solid S in x yz-space in a one-to-one manner .
Example 4.13. For a > 0, ﬁnd the volume V inside the sphere S = x2 + y2 + z2 = a2.


## Page 149

4.5 Change of Variables in Multiple Integrals 141
Solution: We see that S is the set ρ = a in spherical coordinates, so
V =
/dispiiint
S
1 dV =
2π/dispvarint
0
π/dispvarint
0
a/dispvarint
0
1 ρ2 sin φ dρ dφ dθ
=
2π/dispvarint
0
π/dispvarint
0
(ρ3
3
⏐
⏐
⏐
ρ= a
ρ= 0
)
sin φ dφ dθ =
2π/dispvarint
0
π/dispvarint
0
a3
3 sin φ dφ dθ
=
2π/dispvarint
0
(
− a3
3 cos φ
⏐
⏐
⏐
φ= π
φ= 0
)
dθ =
2π/dispvarint
0
2a3
3 dθ = 4πa3
3 .
Exercises
A
1. Find the volume V inside the paraboloid z = x2 + y2 for 0 ≤ z ≤ 4.
2. Find the volume V inside the cone z =
√
x2 + y2 for 0 ≤ z ≤ 3.
B
3. Find the volume V of the solid inside both x2 + y2 + z2 = 4 and x2 + y2 = 1.
4. Find the volume V inside both the sphere x2 + y2 + z2 = 1 and the cone z =
√
x2 + y2.
5. Prove formula (4.25). 6. Prove formula (4.26).
7. Evaluate
/iint
R
sin
(x+ y
2
)
cos
(x− y
2
)
d A, where R is the triangle with vertices (0 , 0), (2 , 0) and
(1, 1). ( Hint: Use the change of variables u = (x + y)/2, v = (x − y)/2.)
8. Find the volume of the solid bounded by z = x2 + y2 and z2 = 4(x2 + y2).
9. Find the volume inside the elliptic cylinder x2
a2 + y2
b2 ≤ 1 for 0 ≤ z ≤ 2.
C
10. Show that the volume inside the ellipsoid x2
a2 + y2
b2 + z2
c2 = 1 is 4πabc
3 . ( Hint: Use the change
of variables x = au, y = bv, z = cw, then consider Example 4.13. )
11. Show that
+∞/dispvarint
−∞
+∞/dispvarint
−∞
f (x, y) dx d y =
+∞/dispvarint
−∞
+∞/dispvarint
−∞
f (x + y, x + 2y) dx d y
For any smooth function f (x, y) which vanishes outside of a bounded region in the plane.


## Page 150

142 CHAPTER 4. MULTIPLE INTEGRALS
4.6 Application: Center of Mass
a b
x
y
0
y = f (x)
R
( ¯x, ¯y)
Figure 4.6.1 Center of mass of R
Recall from single-variable calculus that for a region
R = {(x, y) : a ≤ x ≤ b, 0 ≤ y ≤ f (x)} in R2 that represents
a thin, ﬂat plate (see Figure 3.6.1), where f (x) is a con-
tinuous function on [ a, b], the center of mass of R has
coordinates ( ¯x, ¯y) given by
¯x =
M y
M and ¯y = Mx
M ,
where
Mx =
b/dispvarint
a
( f (x))2
2 dx , M y =
b/dispvarint
a
x f (x) dx , M =
b/dispvarint
a
f (x) dx , (4.27)
assuming that R has uniform density , i.e the mass of R is uniformly distributed over the
region. In this case the area M of the region is considered the mass of R (the density is
constant, and taken as 1 for simplicity).
In the general case where the density of a region (or lamina) R is a continuous function
δ = δ(x, y) of the coordinates ( x, y) of points inside R (where R can be any region in R2) the
coordinates ( ¯x, ¯y) of the center of mass of R are given by
¯x =
M y
M and ¯y = Mx
M , (4.28)
where
M y =
/dispiint
R
xδ(x, y) d A , Mx =
/dispiint
R
yδ(x, y) d A , M =
/dispiint
R
δ(x, y) d A , (4.29)
The quantities Mx and M y are called the moments (or ﬁrst moments) of the region R about
the x-axis and y-axis, respectively . The quantity M is the mass of the region R. To see this,
think of taking a small rectangle inside R with dimensions ∆x and ∆y close to 0. The mass
of that rectangle is approximately δ(x∗ , y∗ )∆x ∆y, for some point ( x∗ , y∗ ) in that rectangle.
Then the mass of R is the limit of the sums of the masses of all such rectangles in side R as
the diagonals of the rectangles approach 0, which is the double int egral
/iint
R
δ(x, y) d A.
Note that the formulas in (4.27) represent a special case when δ(x, y) = 1 throughout R in
the formulas in (4.29).
Example 4.14. Find the center of mass of the region R = {(x, y) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 2x2}, if the
density function at ( x, y) is δ(x, y) = x + y.


## Page 151

4.6 Application: Center of Mass 143
x
y
0
y = 2x2
R
1
Figure 4.6.2
Solution: The region R is shown in Figure 3.6.2. We have
M =
/dispiint
R
δ(x, y) d A
=
1/dispvarint
0
2x2
/dispvarint
0
(x + y) d y dx
=
1/dispvarint
0
(
x y+ y2
2
⏐
⏐
⏐
⏐
y= 2x2
y= 0
)
dx
=
1/dispvarint
0
(2x3 + 2x4) dx
= x4
2 + 2x5
5
⏐
⏐
⏐
⏐
1
0
= 9
10
and
Mx =
/dispiint
R
yδ(x, y) d A M y =
/dispiint
R
xδ(x, y) d A
=
1/dispvarint
0
2x2
/dispvarint
0
y(x + y) d y dx =
1/dispvarint
0
2x2
/dispvarint
0
x(x + y) d y dx
=
1/dispvarint
0
(
x y2
2 + y3
3
⏐
⏐
⏐
⏐
y= 2x2
y= 0
)
dx =
1/dispvarint
0
(
x2 y + x y2
2
⏐
⏐
⏐
⏐
y= 2x2
y= 0
)
dx
=
1/dispvarint
0
(2x5 + 8x6
3 ) dx =
1/dispvarint
0
(2x4 + 2x5) dx
= x6
3 + 8x7
21
⏐
⏐
⏐
⏐
1
0
= 5
7 = 2x5
5 + x6
3
⏐
⏐
⏐
⏐
1
0
= 11
15 ,
so the center of mass ( ¯x, ¯y) is given by
¯x =
M y
M = 11/15
9/10 = 22
27 , ¯y = Mx
M = 5/7
9/10 = 50
63 .
Note how this center of mass is a little further towards the upper corner of the region R
than when the density is uniform (use the formulas in (4.27) to s how that ( ¯x, ¯y) =
(3
4 , 3
5
)
in
that case). This makes sense since the density function δ(x, y) = x + y increases as ( x, y)
approaches that upper corner , where there is quite a bit of area.


## Page 152

144 CHAPTER 4. MULTIPLE INTEGRALS
In the special case where the density function δ(x, y) is a constant function on the region
R, the center of mass ( ¯x, ¯y) is called the centroid of R.
The formulas for the center of mass of a region in R2 can be generalized to a solid S in R3.
Let S be a solid with a continuous mass density function δ(x, y, z) at any point ( x, y, z) in S.
Then the center of mass of S has coordinates ( ¯x, ¯y, ¯z), where
¯x =
M yz
M , ¯y = Mxz
M , ¯z =
Mx y
M , (4.30)
where
M yz =
/dispiiint
S
xδ(x, y, z) dV , Mxz =
/dispiiint
S
yδ(x, y, z) dV , Mx y =
/dispiiint
S
zδ(x, y, z) dV , (4.31)
M =
/dispiiint
S
δ(x, y, z) dV . (4.32)
In this case, M yz , Mxz and Mx y are called the moments (or ﬁrst moments ) of S around the
yz-plane, xz-plane and x y-plane, respectively . Also, M is the mass of S.
Example 4.15. Find the center of mass of the solid S = {(x, y, z) : z ≥ 0, x2 + y2 + z2 ≤ a2}, if
the density function at ( x, y, z) is δ(x, y, z) = 1.
y
z
x
0 a
( ¯x, ¯y, ¯z)
a
Figure 4.6.3
Solution: The solid S is just the upper hemisphere inside the sphere
of radius a centered at the origin (see Figure 3.6.3). So since the
density function is a constant and S is symmetric about the z-axis,
then it is clear that ¯x = 0 and ¯y = 0, so we need only ﬁnd ¯z. We have
M =
/dispiiint
S
δ(x, y, z) dV =
/dispiiint
S
1 dV = V olume (S).
But since the volume of S is half the volume of the sphere of radius
a, which we know by Example 4.13 is 4πa3
3 , then M = 2πa3
3 . And
Mx y =
/dispiiint
S
zδ(x, y, z) dV
=
/dispiiint
S
z dV , which in spherical coordinates is
=
2π/dispvarint
0
π/2/dispvarint
0
a/dispvarint
0
(ρ cos φ) ρ2 sin φ dρ dφ dθ
=
2π/dispvarint
0
π/2/dispvarint
0
sin φ cos φ
( a/dispvarint
0
ρ3 dρ
)
dφ dθ


## Page 153

4.6 Application: Center of Mass 145
=
2π/dispvarint
0
π/2/dispvarint
0
a4
4 sin φ cos φ dφ dθ
Mx y =
2π/dispvarint
0
π/2/dispvarint
0
a4
8 sin 2φ dφ dθ (since sin 2φ = 2 sinφ cos φ)
=
2π/dispvarint
0
(
− a4
16 cos 2φ
⏐
⏐
⏐
φ= π/2
φ= 0
)
dθ
=
2π/dispvarint
0
a4
8 dθ
= πa4
4 ,
so
¯z =
Mx y
M =
πa4
4
2πa3
3
= 3a
8 .
Thus, the center of mass of S is ( ¯x, ¯y, ¯z) =
(
0, 0, 3a
8
)
.
Exercises
A
For Exercises 1–5, ﬁnd the center of mass of the region R with the given density function
δ(x, y).
1. R = {(x, y) : 0 ≤ x ≤ 2, 0 ≤ y ≤ 4 }, δ(x, y) = 2y
2. R = {(x, y) : 0 ≤ x ≤ 1, 0 ≤ y ≤ x2}, δ(x, y) = x + y
3. R = {(x, y) : y ≥ 0, x2 + y2 ≤ a2}, δ(x, y) = 1
4. R = {(x, y) : y ≥ 0, x ≥ 0, 1 ≤ x2 + y2 ≤ 4 }, δ(x, y) =
√
x2 + y2
5. R = {(x, y) : y ≥ 0, x2 + y2 ≤ 1 }, δ(x, y) = y
B
For Exercises 6–10, ﬁnd the center of mass of the solid S with the given density function
δ(x, y, z).
6. S = {(x, y, z) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 1, 0 ≤ z ≤ 1 }, δ(x, y, z) = x yz
7. S = {(x, y, z) : z ≥ 0, x2 + y2 + z2 ≤ a2}, δ(x, y, z) = x2 + y2 + z2


## Page 154

146 CHAPTER 4. MULTIPLE INTEGRALS
8. S = {(x, y, z) : x ≥ 0, y ≥ 0, z ≥ 0, x2 + y2 + z2 ≤ a2}, δ(x, y, z) = 1
9. S = {(x, y, z) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 1, 0 ≤ z ≤ 1 }, δ(x, y, z) = x2 + y2 + z2
10. S = {(x, y, z) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 1, 0 ≤ z ≤ 1 − x − y}, δ(x, y, z) = 1
C
11. Let F be a ﬁgure in the upper half-plane; denote as ( x0, y0) its center of mass and as A
its the area. Show that
2π A y0
is the volume of the body of revolution obtained by rotating F around x-axis.


## Page 155

4.7 Application: Probability and Expected Value 147
4.7 Application: Probability and Expected Value
In this section we will brieﬂy discuss some applications of multipl e integrals in the ﬁeld of
probability theory . In particular we will see ways in which multipl e integrals can be used to
calculate probabilities and expected values.
Probability
Suppose that you have a standard six-sided (fair) die, and you let a variable X represent
the value rolled. Then the probability of rolling a 3, written as P(X = 3), is 1
6 , since there
are six sides on the die and each one is equally likely to be rolle d, and hence in particular
the 3 has a one out of six chance of being rolled. Likewise the prob ability of rolling at most a
3, written as P(X ≤ 3), is 3
6 = 1
2 , since of the six numbers on the die, there are three equally
likely numbers (1, 2, and 3) that are less than or equal to 3. No te that P(X ≤ 3) = P(X =
1) + P(X = 2) + P(X = 3). We call X a discrete random variable on the sample space (or
probability space ) Ω consisting of all possible outcomes. In our case, Ω = {1, 2, 3, 4, 5, 6}. An
event A is a subset of the sample space. For example, in the case of the die, the event X ≤ 3
is the set {1, 2, 3}.
Now let X be a variable representing a random real number in the interval (0, 1). Note
that for any real number x in (0 , 1), it makes no sense to consider P(X = x) since it must
be 0 (why?). Instead, we consider the probability P(X ≤ x), which is given by P(X ≤ x) = x.
The reasoning is this: the interval (0 , 1) has length 1, and for x in (0 , 1) the interval (0 , x)
has length x. So since X represents a random number in (0 , 1), and hence is uniformly
distributed over (0, 1), then
P(X ≤ x) = length of (0 , x)
length of (0 , 1) = x
1 = x .
We call X a continuous random variable on the sample space Ω = (0, 1). An event A is a
subset of the sample space. For example, in our case the event X ≤ x is the set (0 , x).
In the case of a discrete random variable, we saw how the probabili ty of an event was
the sum of the probabilities of the individual outcomes comprising that event (for instance,
P(X ≤ 3) = P(X = 1) + P(X = 2) + P(X = 3) in the die example). For a continuous random
variable, the probability of an event will instead be the integral of a function, which we will
now describe.
Let X be a continuous real-valued random variable on a sample space Ω in R. For simplic-
ity , letΩ = (a, b). Deﬁne the distribution function F of X as
F(x) = P(X ≤ x) , for −∞ < x < ∞ (4.33)
=







1, for x ≥ b
P(X ≤ x), for a < x < b
0, for x ≤ a .
(4.34)


## Page 156

148 CHAPTER 4. MULTIPLE INTEGRALS
Suppose that there is a nonnegative, continuous real-valued f unction f on R such that
F(x) =
x/dispvarint
−∞
f (y) d y , for −∞ < x < ∞ , (4.35)
and ∞/dispvarint
−∞
f (x) dx = 1 . (4.36)
Then we call f the probability density function for X . We thus have
P(X ≤ x) =
x/dispvarint
a
f (y) d y , for a < x < b . (4.37)
Also, by the Fundamental Theorem of Calculus, we have
F ′(x) = f (x) , for −∞ < x < ∞ . (4.38)
Example 4.16. Let X represent a randomly selected real number in the interval (0 , 1). We
say that X has the uniform distribution on (0, 1), with distribution function
F(x) = P(X ≤ x) =







1, for x ≥ 1
x, for 0 < x < 1
0, for x ≤ 0 ,
(4.39)
and probability density function
f (x) = F ′(x) =
{
1, for 0 < x < 1
0, elsewhere.
(4.40)
In general, if X represents a randomly selected real number in an interval ( a, b), then X has
the uniform distribution function
F(x) = P(X ≤ x) =







1, for x ≥ b
x
b− a , for a < x < b
0, for x ≤ a ,
(4.41)
and probability density function
f (x) = F ′(x) =
{ 1
b− a , for a < x < b
0, elsewhere.
(4.42)


## Page 157

4.7 Application: Probability and Expected Value 149
Example 4.17. A famous distribution function is given by the standard normal distribution,
whose probability density function f is
f (x) = 1/∇adicallow
2π
e− x2/2 , for −∞ < x < ∞ . (4.43)
This is often called a “bell curve”, and is used widely in statis tics. Since we are claiming that
f is a probability density function, we should have
∞/dispvarint
−∞
1/∇adicallow
2π
e− x2/2 dx = 1 (4.44)
by formula (4.36), which is equivalent to
∞/dispvarint
−∞
e− x2/2 dx =
/∇adicallow
2π . (4.45)
We can use a double integral in polar coordinates to verify this i ntegral. First,
∞/dispvarint
−∞
∞/dispvarint
−∞
e− (x2+ y2)/2 dx d y =
∞/dispvarint
−∞
e− y2/2
( ∞/dispvarint
−∞
e− x2/2 dx
)
d y
=
( ∞/dispvarint
−∞
e− x2/2 dx
) ( ∞/dispvarint
−∞
e− y2/2 d y
)
=
( ∞/dispvarint
−∞
e− x2/2 dx
)2
since the same function is being integrated twice in the middle e quation, just with different
variables. But using polar coordinates, we see that
∞/dispvarint
−∞
∞/dispvarint
−∞
e− (x2+ y2)/2 dx d y =
2π/dispvarint
0
∞/dispvarint
0
e− r2/2 r dr dθ
=
2π/dispvarint
0
(
− e− r2/2
⏐
⏐
⏐
⏐
r=∞
r= 0
)
dθ
=
2π/dispvarint
0
(0 − (− e0)) dθ =
2π/dispvarint
0
1 dθ = 2π ,


## Page 158

150 CHAPTER 4. MULTIPLE INTEGRALS
and so
( ∞/dispvarint
−∞
e− x2/2 dx
)2
= 2π , and hence
∞/dispvarint
−∞
e− x2/2 dx =
/∇adicallow
2π .
In addition to individual random variables, we can consider jointly distributed random
variables. For this, we will let X , Y and Z be three real-valued continuous random variables
deﬁned on the same sample space Ω in R (the discussion for two random variables is similar).
Then the joint distribution function F of X , Y and Z is given by
F(x, y, z) = P(X ≤ x, Y ≤ y, Z ≤ z) , for −∞ < x, y, z < ∞ . (4.46)
If there is a nonnegative, continuous real-valued function f on R3 such that
F(x, y, z) =
z/dispvarint
−∞
y/dispvarint
−∞
x/dispvarint
−∞
f (u, v, w) du dv dw , for −∞ < x, y, z < ∞ (4.47)
and
∞/dispvarint
−∞
∞/dispvarint
−∞
∞/dispvarint
−∞
f (x, y, z) dx d y d z = 1 , (4.48)
then we call f the joint probability density function for X , Y and Z. In general, for a1 < b1,
a2 < b2, a3 < b3, we have
P(a1 < X ≤ b1, a2 < Y ≤ b2, a3 < Z ≤ b3) =
b3/dispvarint
a3
b2/dispvarint
a2
b1/dispvarint
a1
f (x, y, z) dx d y d z , (4.49)
with the ≤ and < symbols interchangeable in any combination. A triple integr al, then, can
be thought of as representing a probability (for a function f which is a probability density
function).
Example 4.18. Let a, b, and c be real numbers selected randomly from the interval (0 , 1).
What is the probability that the equation ax2 + bx + c = 0 has at least one real solution x?


## Page 159

4.7 Application: Probability and Expected Value 151
a
c
0
c = 1
4a
1
11
4
R1 R2
Figure 4.7.1 Region
R = R1 ∪ R2
Solution: We know by the quadratic formula that there is at least
one real solution if b2 − 4ac ≥ 0. So we need to calculate P(b2 − 4ac ≥
0). We will use three jointly distributed random variables to do t his.
First, since 0 < a, b, c < 1, we have
b2 − 4ac ≥ 0 ⇔ 0 < 4ac ≤ b2 < 1 ⇔ 0 < 2
/∇adicallow
a
/∇adicallow
c ≤ b < 1 ,
where the last relation holds for all 0 < a, c < 1 such that
0 < 4ac < 1 ⇔ 0 < c < 1
4a .
Considering a, b and c as real variables, the region R in the ac-plane where the above
relation holds is given by R = {(a, c) : 0 < a < 1, 0 < c < 1, 0 < c < 1
4a }, which we can see is a
union of two regions R1 and R2, as in Figure 3.7.1 above.
Now let X , Y and Z be continuous random variables, each representing a randomly s e-
lected real number from the interval (0 , 1) (think of X , Y and Z representing a, b and c,
respectively). Then, similar to how we showed that f (x) = 1 is the probability density func-
tion of the uniform distribution on (0 , 1), it can be shown that f (x, y, z) = 1 for x, y, z in (0, 1)
(0 elsewhere) is the joint probability density function of X , Y and Z. Now ,
P(b2 − 4ac ≥ 0) = P((a, c) ∈ R, 2
/∇adicallow
a
/∇adicallow
c ≤ b < 1) ,
so this probability is the triple integral of f (a, b, c) = 1 as b varies from 2 /∇adicallow a /∇adicallow c to 1 and as
(a, c) varies over the region R. Since R can be divided into two regions R1 and R2, then the
required triple integral can be split into a sum of two triple inte grals, using vertical slices in
R:
P(b2 − 4ac ≥ 0) =
1/4/dispvarint
0
1/dispvarint
0  
R1
1/dispvarint
2/∇adicallow a /∇adicallow c
1 db d c da +
1/dispvarint
1/4
1/4a/dispvarint
0  
R2
1/dispvarint
2/∇adicallow a /∇adicallow c
1 db d c da
=
1/4/dispvarint
0
1/dispvarint
0
(1 − 2
/∇adicallow
a
/∇adicallow
c) d c da +
1/dispvarint
1/4
1/4a/dispvarint
0
(1 − 2
/∇adicallow
a
/∇adicallow
c) d c da
=
1/4/dispvarint
0
(
c − 4
3
/∇adicallow
a c3/2
⏐
⏐
⏐
c= 1
c= 0
)
da +
1/dispvarint
1/4
(
c − 4
3
/∇adicallow
a c3/2
⏐
⏐
⏐
c= 1/4a
c= 0
)
da
=
1/4/dispvarint
0
(
1 − 4
3
/∇adicallow
a
)
da +
1/dispvarint
1/4
1
12a da
= a − 8
9 a3/2
⏐
⏐
⏐
⏐
1/4
0
+ 1
12 ln a
⏐
⏐
⏐
⏐
1
1/4


## Page 160

152 CHAPTER 4. MULTIPLE INTEGRALS
=
(1
4 − 1
9
)
+
(
0 − 1
12 ln 1
4
)
= 5
36 + 1
12 ln 4
P(b2 − 4ac ≥ 0) = 5 + 3 ln 4
36 ≈ 0.2544
In other words, the equation ax2 + bx + c = 0 has about a 25% chance of being solved!
Expected Value
The expected value E X of a random variable X can be thought of as the “average” value of
X as it varies over its sample space. If X is a discrete random variable, then
E X =
∑
x
x P(X = x) , (4.50)
with the sum being taken over all elements x of the sample space. For example, if X repre-
sents the number rolled on a six-sided die, then
E X =
6∑
x= 1
x P(X = x) =
6∑
x= 1
x 1
6 = 3.5 (4.51)
is the expected value of X , which is the average of the integers 1–6.
If X is a real-valued continuous random variable with probability de nsity function f , then
E X =
∞/dispvarint
−∞
x f (x) dx . (4.52)
For example, if X has the uniform distribution on the interval (0 , 1), then its probability
density function is
f (x) =
{
1, for 0 < x < 1
0, elsewhere,
(4.53)
and so
E X =
∞/dispvarint
−∞
x f (x) dx =
1/dispvarint
0
x dx = 1
2 . (4.54)
For a pair of jointly distributed, real-valued continuous rando m variables X and Y with
joint probability density function f (x, y), the expected values of X and Y are given by
E X =
∞/dispvarint
−∞
∞/dispvarint
−∞
x f (x, y) dx d y and EY =
∞/dispvarint
−∞
∞/dispvarint
−∞
y f (x, y) dx d y , (4.55)
respectively .


## Page 161

4.7 Application: Probability and Expected Value 153
Example 4.19. If you were to pick n > 2 random real numbers from the interval (0 , 1), what
are the expected values for the smallest and largest of those n umbers?
Solution: Let U1, . . . ,Un be n continuous random variables, each representing a randomly
selected real number from (0 , 1) with the uniform distribution on (0 , 1). Deﬁne random vari-
ables X and Y by
X = min(U1, . . . ,Un) and Y = max(U1, . . . ,Un) .
Then it can be shown 3 that the joint probability density function of X and Y is
f (x, y) =
{
n(n − 1)(y − x)n− 2, for 0 ≤ x ≤ y ≤ 1
0, elsewhere.
(4.56)
Thus, the expected value of X is
E X =
1/dispvarint
0
1/dispvarint
x
n(n − 1)x(y − x)n− 2 d y dx
=
1/dispvarint
0
(
nx(y − x)n− 1
⏐
⏐
⏐
y= 1
y= x
)
dx
=
1/dispvarint
0
nx(1 − x)n− 1 dx , so integration by parts yields
= − x(1 − x)n − 1
n + 1 (1 − x)n+ 1
⏐
⏐
⏐
1
0
E X = 1
n + 1 ,
and similarly (see Exercise 3) it can be shown that
EY =
1/dispvarint
0
y/dispvarint
0
n(n − 1)y(y − x)n− 2 dx d y = n
n + 1 .
So, for example, if you were to repeatedly take samples of n = 3 random real numbers from
(0, 1), and each time store the minimum and maximum values in the s ample, then the aver-
age of the minimums would approach 1
4 and the average of the maximums would approach
3
4 as the number of samples grows. It would be relatively simple (see Exercise 4) to write a
computer program to test this.
Exercises
B
3See Ch. 6 in H OEL , P ORT and S TONE .


## Page 162

154 CHAPTER 4. MULTIPLE INTEGRALS
1. Evaluate the integral
∞/dispvarint
−∞
e− x2
dx
using anything you have learned so far .
2. For σ > 0 and µ > 0, evaluate
∞/dispvarint
−∞
1
σ
/∇adicallow
2π
e− (x− µ)2/2σ 2
dx.
3. Show that EY = n
n+ 1 in Example 4.19
C
4. Write a computer program (in the language of your choice) that v eriﬁes the results in
Example 4.19 for the case n = 3 by taking large numbers of samples.
5. Repeat Exercise 4 for the case when n = 4.
6. For continuous random variables X , Y with joint probability density function f (x, y),
deﬁne the second moments E(X 2) and E(Y 2) by
E(X 2) =
∞/dispvarint
−∞
∞/dispvarint
−∞
x2 f (x, y) dx d y and E(Y 2) =
∞/dispvarint
−∞
∞/dispvarint
−∞
y2 f (x, y) dx d y ,
and the variances Var(X ) and Var(Y ) by
Var(X ) = E(X 2) − (E X)2 and Var( Y ) = E(Y 2) − (EY )2 .
Find Var(X ) and Var(Y ) for X and Y as in Example 4.19.
7. Continuing Exercise 6, the correlation ρ between X and Y is deﬁned as
ρ = E(X Y) − (E X)(EY )
/∇adicallow
Var(X ) Var(Y )
,
where
E(X Y) =
∞/dispvarint
−∞
∞/dispvarint
−∞
x y f (x, y) dx d y.
Find ρ for X and Y as in Example 4.19.
(Note: The quantity E(X Y) − (E X)(EY ) is called the covariance of X and Y .)
8. In Example 4.18 would the answer change if the interval (0 , 100) is used instead of (0 , 1)?
Explain.


## Page 163

5 Line and Surface Integrals
5.1 Line Integrals
In single-variable calculus you learned how to integrate a r eal-valued function f (x) over an
interval [ a, b] in R1. This integral (usually called a Riemann integral ) can be thought of as
an integral over a path in R1, since an interval (or collection of intervals) is really th e only
kind of “path” in R1. Y ou may also recall that if f (x) represented the force applied along the
x-axis to an object at position x in [ a, b], then the work W done in moving that object from
position x = a to x = b was deﬁned as the integral:
W =
b/dispvarint
a
f (x) dx.
In this section, we will see how to deﬁne the integral of a functio n (either real-valued or
vector-valued) of two variables over a general curve (also cal led path) in R2. This deﬁnition
will be motivated by the physical notion of work. We will begin with real-valued functions of
two variables.
In physics, the intuitive idea of work is that
Work = Force × Distance .
Assume you move a an object of unit weight along a curve C in R2 and want to ﬁnd the work
of the force which works against the friction. Suppose f (x, y) is the coefﬁcient of friction at
the point ( x, y). In this case the force has magnitude f (x, y) and it is applied in the direction
of motion along C (see Figure 5.1.1 below).
x
y
0
C
t = a
t = b
∆s i ≈
√
∆xi
2 + ∆yi
2
t = t i
t = t i+ 1
∆yi
∆xi
Figure 5.1.1 Curve C : x = x(t), y = y(t) for t in [ a, b]
155


## Page 164

156 CHAPTER 5. LINE AND SURFACE INTEGRALS
We will assume for now that the function f (x, y) is continuous and real-valued, so we only
consider the magnitude of the force. Partition the interval [ a, b] as follows:
a = t0 < t1 < t2 < · · · < tn− 1 < tn = b , for some integer n ≥ 2
As we can see from Figure 5.1.1, over a typical subinterval [ t i, t i+ 1] the distance ∆s i traveled
along the curve is approximately
√
∆xi
2 + ∆yi
2, by the Pythagorean Theorem. Thus, if the
subinterval is small enough then the work done in moving the obj ect along that piece of the
curve is approximately
Force × Distance ≈ f (xi∗ , yi∗ )
√
∆xi
2 + ∆yi
2 , (5.1)
where ( xi∗ , yi∗ ) = (x(t i∗ ), y(t i∗ )) for some t i∗ in [ t i, t i+ 1], and so
W ≈
n− 1∑
i= 0
f (xi∗ , yi∗ )
√
∆xi
2 + ∆yi
2 (5.2)
is approximately the total amount of work done over the entire cur ve. But since
√
∆xi
2 + ∆yi
2 =
√(∆xi
∆t i
)2
+
(∆yi
∆t i
)2
∆t i ,
where ∆t i = t i+ 1 − t i, then
W ≈
n− 1∑
i= 0
f (xi∗ , yi∗ )
√(∆xi
∆t i
)2
+
(∆yi
∆t i
)2
∆t i . (5.3)
Taking the limit of that sum as the length of the largest subin terval goes to 0, the sum over
all subintervals becomes the integral from t = a to t = b, ∆xi
∆ti
and ∆yi
∆ti
become x ′(t) and y ′(t),
respectively , and f (xi∗ , yi∗ ) becomes f (x(t), y(t)), so that
W =
b/dispvarint
a
f (x(t), y(t))
√
x ′(t)2 + y ′(t)2 dt . (5.4)
The integral on the right side of the above equation gives us ou r idea of how to deﬁne,
for any real-valued function f (x, y), the integral of f (x, y) along the curve C, called a line
integral:
Deﬁnition 5.1. For a real-valued function f (x, y) and a curve C in R2, parametrized by
x = x(t), y = y(t), a ≤ t ≤ b, the line integral of f (x, y) along C with respect to arc length
s is
/dispvarint
C
f (x, y) ds =
b/dispvarint
a
f (x(t), y(t))
√
x ′(t)2 + y ′(t)2 dt . (5.5)


## Page 165

5.1 Line Integrals 157
The symbol ds is the differential of the arc length function
s = s(t) =
t/dispvarint
a
√
x ′(u)2 + y ′(u)2 du , (5.6)
which you may recognize from Section 1.9 as the length of the cu rve C over the interval [ a, t],
for all t in [a, b]. That is,
ds = s ′(t) dt =
√
x ′(t)2 + y ′(t)2 dt , (5.7)
by the Fundamental Theorem of Calculus.
For a general real-valued function f (x, y), what does the line integral
/varint
C f (x, y) ds rep-
resent? The preceding discussion of ds gives us a clue. Y ou can think of differentials as
inﬁnitesimal lengths. So if you think of f (x, y) as the height of a picket fence along C, then
f (x, y) ds can be thought of as approximately the area of a section of that f ence over some
inﬁnitesimally small section of the curve, and thus the line integral
/varint
C f (x, y) ds is the total
area of that picket fence (see Figure 5.1.2).
x
y
0
C ds
f (x, y)
Figure 5.1.2 Area of shaded rectangle = height × width ≈ f (x, y) ds
Example 5.1. Use a line integral to show that the lateral surface area A of a right circular
cylinder of radius r and height h is 2πrh.


## Page 166

158 CHAPTER 5. LINE AND SURFACE INTEGRALS
y
z
x
0
r
h = f (x, y)
C : x2 + y2 = r2
Figure 5.1.3
Solution: We will use the right circular cylinder with base circle C
given by x2 + y2 = r2 and with height h in the positive z direction
(see Figure 4.1.3). Parametrize C as follows:
x = x(t) = r cos t , y = y(t) = r sin t , 0 ≤ t ≤ 2π
Let f (x, y) = h for all ( x, y). Then
A =
/dispvarint
C
f (x, y) ds =
b/dispvarint
a
f (x(t), y(t))
√
x ′(t)2 + y ′(t)2 dt
=
2π/dispvarint
0
h
√
(− r sin t)2 + (r cos t)2 dt
= h
2π/dispvarint
0
r
√
sin2 t + cos2 t dt
= rh
2π/dispvarint
0
1 dt = 2πrh
Note in Example 5.1 that if we had traversed the circle C twice (that is, let t vary from 0
to 4π) then we would have gotten an area of 4 πrh — twice the desired area, even though the
curve itself is still the same (namely , a circle of radius r). Also, notice that we traversed the
circle in the counter-clockwise direction. If we had gone in the clockwise direction, using the
parametrization
x = x(t) = r cos(2π − t) , y = y(t) = r sin(2π − t) , 0 ≤ t ≤ 2π , (5.8)
then it is easy to verify (see Exercise 12) that the value of th e line integral is unchanged.
In general, it can be shown (see Exercise 15) that reversing th e direction in which a curve
C is traversed leaves
/varint
C f (x, y) ds unchanged, for any f (x, y). If a curve C has a parametriza-
tion x = x(t), y = y(t), a ≤ t ≤ b, then denote by − C the same curve as C but traversed in the
opposite direction. Then − C is parametrized by
x = x(a + b − t) , y = y(a + b − t) , a ≤ t ≤ b , (5.9)
and we have /dispvarint
C
f (x, y) ds =
/dispvarint
− C
f (x, y) ds . (5.10)
Notice that our deﬁnition of the line integral was with respect t o the arc length parameter
s. We can also deﬁne
/dispvarint
C
f (x, y) dx =
b/dispvarint
a
f (x(t), y(t)) x ′(t) dt (5.11)


## Page 167

5.1 Line Integrals 159
as the line integral of f (x, y) along C with respect to x, and
/dispvarint
C
f (x, y) d y =
b/dispvarint
a
f (x(t), y(t)) y ′(t) dt (5.12)
as the line integral of f (x, y) along C with respect to y.
In the derivation of the formula for a line integral, we used the idea of work as force
multiplied by distance. However , we know that force is actually a vector. So it would be
helpful to develop a vector form for a line integral. For this, s uppose that we have a function
f(x, y) deﬁned on R2 by
f(x, y) = P(x, y) i + Q(x, y) j
for some continuous real-valued functions P(x, y) and Q(x, y) on R2. Such a function f is
called a vector ﬁeld on R2. It is deﬁned at points in R2, and its values are vectors in R2. For
a curve C with a smooth parametrization x = x(t), y = y(t), a ≤ t ≤ b, let
r(t) = x(t) i + y(t) j
be the position vector for a point ( x(t), y(t)) on C. Then r′(t) = x′(t) i + y ′(t) j and so
/dispvarint
C
P(x, y) dx +
/dispvarint
C
Q(x, y) d y =
b/dispvarint
a
P(x(t), y(t)) x ′(t) dt +
b/dispvarint
a
Q(x(t), y(t)) y ′(t) dt
=
b/dispvarint
a
(P(x(t), y(t)) x ′(t) + Q(x(t), y(t)) y ′(t)) dt
=
b/dispvarint
a
f(x(t), y(t)) ···r′(t) dt
by deﬁnition of f(x, y). Notice that the function f(x(t), y(t)) ···r ′(t) is a real-valued function on
[a, b], so the last integral on the right looks somewhat similar to o ur earlier deﬁnition of a
line integral. This leads us to the following deﬁnition:
Deﬁnition 5.2. For a vector ﬁeld f(x, y) = P(x, y) i + Q(x, y) j and a curve C with a smooth
parametrization x = x(t), y = y(t), a ≤ t ≤ b, the line integral of f along C is
/dispvarint
C
f ···dr =
/dispvarint
C
P(x, y) dx +
/dispvarint
C
Q(x, y) d y (5.13)
=
b/dispvarint
a
f(x(t), y(t)) ···r ′(t) dt , (5.14)
where r(t) = x(t) i + y(t) j is the position vector for points on C.


## Page 168

160 CHAPTER 5. LINE AND SURFACE INTEGRALS
We use the notation dr = r ′(t) dt = dx i + d yj to denote the differential of the vector-valued
function r. The line integral in Deﬁnition 5.2 is often called a line integral of a vector ﬁeld
to distinguish it from the line integral in Deﬁnition 5.1 which i s called a line integral of a
scalar ﬁeld. For convenience we will often write
/dispvarint
C
P(x, y) dx +
/dispvarint
C
Q(x, y) d y =
/dispvarint
C
P(x, y) dx + Q(x, y) d y ,
where it is understood that the line integral along C is being applied to both P and Q. The
quantity P(x, y) dx + Q(x, y) d y is known as a differential form. For a real-valued function
F(x, y), the differential of F is dF = ∂F
∂x dx + ∂F
∂y d y. A differential form P(x, y) dx + Q(x, y) d y
is called exact if it equals dF for some function F(x, y).
Recall that if the points on a curve C have position vector r(t) = x(t) i + y(t) j, then r ′(t) is a
tangent vector to C at the point ( x(t), y(t)) in the direction of increasing t (which we call the
direction of C). Since C is a smooth curve, then r ′(t) ̸= 0 on [a, b] and hence
T(t) = r ′(t)
r ′(t)


is the unit tangent vector to C at ( x(t), y(t)). Putting Deﬁnitions 5.1 and 5.2 together we get
the following theorem:
Theorem 5.1. For a vector ﬁeld f(x, y) = P(x, y) i + Q(x, y) j and a curve C with a smooth
parametrization x = x(t), y = y(t), a ≤ t ≤ b and position vector r(t) = x(t) i + y(t) j,
/dispvarint
C
f ···dr =
/dispvarint
C
f ···T ds , (5.15)
where T(t) = r ′(t)
∥r ′(t)∥ is the unit tangent vector to C at ( x(t), y(t)).
If the vector ﬁeld f(x, y) represents the force moving an object along a curve C, then the work
W done by this force is
W =
/dispvarint
C
f ···T ds =
/dispvarint
C
f ···dr . (5.16)
Example 5.2. Evaluate
/varint
C(x2 + y2) dx + 2x y d y, where:
(a) C : x = t , y = 2t , 0 ≤ t ≤ 1
(b) C : x = t , y = 2t2 , 0 ≤ t ≤ 1


## Page 169

5.1 Line Integrals 161
x
y
0
(1, 2)
2
1
Figure 5.1.4
Solution: Figure 4.1.4 shows both curves.
(a) Since x ′(t) = 1 and y ′(t) = 2, then
/dispvarint
C
(x2 + y2) dx + 2x y d y =
1/dispvarint
0
(
(x(t)2 + y(t)2)x ′(t) + 2x(t)y(t) y ′(t)
)
dt
=
1/dispvarint
0
(
(t2 + 4t2)(1) + 2t(2t)(2)
)
dt
=
1/dispvarint
0
13t2 dt
= 13t3
3
⏐
⏐
⏐
⏐
1
0
= 13
3
(b) Since x ′(t) = 1 and y ′(t) = 4t, then
/dispvarint
C
(x2 + y2) dx + 2x y d y =
1/dispvarint
0
(
(x(t)2 + y(t)2)x ′(t) + 2x(t)y(t) y ′(t)
)
dt
=
1/dispvarint
0
(
(t2 + 4t4)(1) + 2t(2t2)(4t)
)
dt
=
1/dispvarint
0
(t2 + 20t4) dt
= t3
3 + 4t5
⏐
⏐
⏐
⏐
1
0
= 1
3 + 4 = 13
3
So in both cases, if the vector ﬁeld f(x, y) = (x2 + y2) i + 2x yj represents the force moving an
object from (0 , 0) to (1 , 2) along the given curve C, then the work done is 13
3 . This may lead
you to think that work (and more generally , the line integral o f a vector ﬁeld) is independent
of the path taken. However , as we will see in the next section, this i s not always the case.
Although we deﬁned line integrals over a single smooth curve, i f C is a piecewise smooth
curve, that is
C = C1 ∪ C2 ∪ . . .∪ Cn
is the union of smooth curves C1, . . . ,Cn, then we can deﬁne
/dispvarint
C
f ···dr =
/dispvarint
C1
f ···dr1 +
/dispvarint
C2
f ···dr2 + . . .+
/dispvarint
Cn
f ···drn
where each ri is the position vector of the curve C i.
Example 5.3. Evaluate
/varint
C(x2 + y2) dx + 2x y d y, where C is the polygonal path from (0 , 0) to
(0, 2) to (1 , 2).


## Page 170

162 CHAPTER 5. LINE AND SURFACE INTEGRALS
x
y
0
(1, 2)2
1
C1
C2
Figure 5.1.5
Solution: Write C = C1 ∪ C2, where C1 is the curve given by x = 0, y = t,
0 ≤ t ≤ 2 and C2 is the curve given by x = t, y = 2, 0 ≤ t ≤ 1 (see Figure
4.1.5). Then
/dispvarint
C
(x2 + y2) dx + 2x y d y =
/dispvarint
C1
(x2 + y2) dx + 2x y d y
+
/dispvarint
C2
(x2 + y2) dx + 2x y d y
=
2/dispvarint
0
(
(02 + t2)(0) + 2(0)t(1)
)
dt +
1/dispvarint
0
(
(t2 + 4)(1) + 2t(2)(0)
)
dt
=
2/dispvarint
0
0 dt +
1/dispvarint
0
(t2 + 4) dt
= t3
3 + 4t
⏐
⏐
⏐
⏐
1
0
= 1
3 + 4 = 13
3
Line integral notation varies quite a bit. For example, in phys ics it is common to see the
notation
/varintb
a f ···dl, where it is understood that the limits of integration a and b are for the
underlying parameter t of the curve, and the letter l signiﬁes length. Also, the formulation/varint
C f ···T ds from Theorem 5.1 is often preferred in physics since it emphasiz es the idea of
integrating the tangential component f ···T of f in the direction of T (that is, in the direction
of C), which is a useful physical interpretation of line integrals.
Exercises
A
For Exercises 1–4, calculate /dispvarint
C
f (x, y) ds
for the given function f (x, y) and curve C.
1. f (x, y) = x y; C : x = cos t, y = sin t, 0 ≤ t ≤ π/2
2. f (x, y) = x
x2 + 1 ; C : x = t, y = 0, 0 ≤ t ≤ 1
3. f (x, y) = 2x + y; C: polygonal path from (0 , 0) to (3 , 0) to (3 , 2)
4. f (x, y) = x + y2; C: path from (2 , 0) counterclockwise along the circle x2 + y2 = 4 to the
point (− 2, 0) and then back to (2 , 0) along the x-axis
5. Use a line integral to ﬁnd the lateral surface area of the part o f the cylinder
x2 + y2 = 4 below the plane x + 2y + z = 6 and above the x y-plane.


## Page 171

5.1 Line Integrals 163
For Exercises 6–11, calculate /dispvarint
C
f ···dr
for the given vector ﬁeld f(x, y) and curve C.
6. f (x, y) = i − j; C : x = 3t, y = 2t, 0 ≤ t ≤ 1
7. f (x, y) = y i − x j; C : x = cos t, y = sin t, 0 ≤ t ≤ 2π
8. f (x, y) = x i + y j; C : x = cos t, y = sin t, 0 ≤ t ≤ 2π
9. f (x, y) = (x2 − y) i + (x − y2) j; C : x = cos t, y = sin t, 0 ≤ t ≤ 2π
10. f (x, y) = x y2 i + x y3 j; C : the polygonal path from (0 , 0) to (1 , 0) to (0 , 1) to (0 , 0)
11. f (x, y) = (x2 + y2) i; C : x = 2 + cos t, y = sin t, 0 ≤ t ≤ 2π
B
12. Verify that the value of the line integral in Example 5.1 is unc hanged when using the
parametrization of the circle C given in formulas (5.8).
13. Show that if f ⊥ r ′(t) at each point r(t) along a smooth curve C, then
/dispvarint
C
f ···dr = 0.
14. Show that if f points in the same direction as r ′(t) at each point r(t) along a smooth
curve C, then /dispvarint
C
f ···dr =
/dispvarint
C
∥f∥ ds.
C
15. Prove that /dispvarint
C
f (x, y) ds =
/dispvarint
− C
f (x, y) ds.
(Hint: Use formulas (5.9). )
16. Let C be a smooth curve with arc length L, and suppose that f(x, y) = P(x, y) i + Q(x, y) j
is a vector ﬁeld such that ∥f(x, y)∥ ≤ M for all ( x, y) on C. Show that
⏐
⏐
⏐
⏐
⏐
/dispvarint
C
f ···dr
⏐
⏐
⏐
⏐
⏐ ≤ ML.
(Hint: Recall that
⏐
⏐
⏐
/varintb
a g(x) dx
⏐
⏐
⏐ ≤
/varintb
a | g(x)| dx for Riemann integrals.)
17. Prove that the Riemann integral
/varintb
a f (x) dx is a special case of a line integral.


## Page 172

164 CHAPTER 5. LINE AND SURFACE INTEGRALS
5.2 Properties of Line Integrals
We know from the previous section that for line integrals of re al-valued functions (scalar
ﬁelds), reversing the direction in which the integral is taken a long a curve does not change
the value of the line integral:
/dispvarint
C
f (x, y) ds =
/dispvarint
− C
f (x, y) ds (5.17)
For line integrals of vector ﬁelds, however , the value does chan ge. To see this, let f(x, y) =
P(x, y) i + Q(x, y) j be a vector ﬁeld, with P and Q continuously differentiable functions. Let
C be a smooth curve parametrized by x = x(t), y = y(t), a ≤ t ≤ b, with position vector r(t) =
x(t) i + y(t) j (we will usually abbreviate this by saying that C : r(t) = x(t) i + y(t) j is a smooth
curve). We know that the curve − C traversed in the opposite direction is parametrized by
x = x(a + b − t), y = y(a + b − t), a ≤ t ≤ b. Then
/dispvarint
− C
P(x, y) dx =
b/dispvarint
a
P(x(a + b − t), y(a + b − t)) d
dt (x(a + b − t)) dt
=
b/dispvarint
a
P(x(a + b − t), y(a + b − t)) (− x ′(a + b − t)) dt (by the Chain Rule)
=
a/dispvarint
b
P(x(u), y(u)) (− x ′(u)) (− du) (by letting u = a + b − t)
=
a/dispvarint
b
P(x(u), y(u)) x ′(u) du
= −
b/dispvarint
a
P(x(u), y(u)) x ′(u) du , since
a/dispvarint
b
= −
b/dispvarint
a
, so
/dispvarint
− C
P(x, y) dx = −
/dispvarint
C
P(x, y) dx
since we are just using a different letter ( u) for the line integral along C. A similar argument
shows that /dispvarint
− C
Q(x, y) d y = −
/dispvarint
C
Q(x, y) d y ,
and hence
/dispvarint
− C
f ···dr =
/dispvarint
− C
P(x, y) dx +
/dispvarint
− C
Q(x, y) d y
= −
/dispvarint
C
P(x, y) dx + −
/dispvarint
C
Q(x, y) d y


## Page 173

5.2 Properties of Line Integrals 165
= −
(/dispvarint
C
P(x, y) dx +
/dispvarint
C
Q(x, y) d y
)
/dispvarint
− C
f ···dr = −
/dispvarint
C
f ···dr . (5.18)
The above formula can be interpreted in terms of the work done by a force f(x, y) (treated
as a vector) moving an object along a curve C: the total work performed moving the object
along C from its initial point to its terminal point, and then back to th e initial point moving
backwards along the same path, is zero. This is because when forc e is considered as a vector ,
direction is accounted for .
The preceding discussion shows the importance of always taking th e direction of the curve
into account when using line integrals of vector ﬁelds. For thi s reason, the curves in line
integrals are sometimes referred to as directed curves or oriented curves.
Recall that our deﬁnition of a line integral required that we ha ve a parametrization x =
x(t), y = y(t), a ≤ t ≤ b for the curve C. But as we know , any curve has inﬁnitely many
parametrizations. So could we get a different value for a line in tegral using some other
parametrization of C, say , x = ˜x(u), y = ˜y(u), c ≤ u ≤ d ? If so, this would mean that our
deﬁnition is not well-deﬁned. Luckily , it turns out that the valu e of a line integral of a
vector ﬁeld is unchanged as long as the direction of the curve C is preserved by whatever
parametrization is chosen:
Theorem 5.2. Let f(x, y) = P(x, y) i + Q(x, y) j be a vector ﬁeld, and let C be a smooth curve
parametrized by x = x(t), y = y(t), a ≤ t ≤ b. Suppose that t = α(u) for c ≤ u ≤ d, such that
a = α(c), b = α(d), and α ′(u) > 0 on the open interval ( c, d) (that is, α(u) is strictly increasing
on [c, d]). Then
/varint
C f···dr has the same value for the parametrizations x = x(t), y = y(t), a ≤ t ≤ b
and x = ˜x(u) = x(α(u)), y = ˜y(u) = y(α(u)), c ≤ u ≤ d.
Proof: Since α(u) is strictly increasing and maps [ c, d] onto [ a, b], then we know that t =
α(u) has an inverse function u = α − 1(t) deﬁned on [ a, b] such that c = α − 1(a), d = α − 1(b),
and du
dt = 1
α ′(u) . Also, dt = α ′(u) du, and by the Chain Rule
˜x ′(u) = d ˜x
du = d
du (x(α(u))) = dx
dt
dt
du = x ′(t) α ′(u) ⇒ x ′(t) = ˜x ′(u)
α ′(u)
so making the susbstitution t = α(u) gives
b/dispvarint
a
P(x(t), y(t)) x ′(t) dt =
α − 1(b)/dispvarint
α − 1(a)
P(x(α(u)), y(α(u))) ˜x ′(u)
α ′(u) (α ′(u) du)
=
d/dispvarint
c
P( ˜x(u), ˜y(u)) ˜x ′(u) du ,


## Page 174

166 CHAPTER 5. LINE AND SURFACE INTEGRALS
which shows that
/varint
C P(x, y) dx has the same value for both parametrizations. A similar
argument shows that
/varint
C Q(x, y) d y has the same value for both parametrizations, and hence/varint
C f ···dr has the same value.
QED
Notice that the condition α ′(u) > 0 in Theorem 5.2 means that the two parametrizations
move along C in the same direction. That was not the case with the “reverse” parametriza-
tion for − C: for u = a + b − t we have t = α(u) = a + b − u ⇒ α ′(u) = − 1 < 0.
Example 5.4. Evaluate the line integral
/varint
C(x2 + y2) dx + 2x y d y from Example 5.2, Section
4.1, along the curve C : x = t, y = 2t2, 0 ≤ t ≤ 1, where t = sin u for 0 ≤ u ≤ π/2.
Solution: First, we notice that 0 = sin 0, 1 = sin(π/2), and dt
du = cos u > 0 on (0 , π/2). So by
Theorem 5.2 we know that if C is parametrized by
x = sin u , y = 2 sin2 u , 0 ≤ u ≤ π/2
then
/varint
C(x2 + y2) dx + 2x y d yshould have the same value as we found in Example 5.2, namely
13
3 . And we can indeed verify this:
/dispvarint
C
(x2 + y2) dx + 2x y d y =
π/2/dispvarint
0
(
(sin2 u + (2 sin2 u)2) cosu + 2(sin u)(2 sin2 u)4 sinu cos u
)
du
=
π/2/dispvarint
0
(
sin2 u + 20 sin4 u
)
cos u du
= sin3 u
3 + 4 sin5 u
⏐
⏐
⏐
⏐
π/2
0
= 1
3 + 4 = 13
3
In other words, the line integral is unchanged whether t or u is the parameter for C.
By a closed curve , we mean a curve C whose initial point and terminal point are the
same; that is, for C : x = x(t), y = y(t), a ≤ t ≤ b, we have ( x(a), y(a)) = (x(b), y(b)).
A simple closed curve is a closed curve which does not intersect itself. Note that any
closed curve can be regarded as a union of simple closed curves ( think of the loops in a ﬁgure
eight). We use the special notation
/dispvaroint
C
f (x, y) ds and
/dispvaroint
C
f ···dr
to denote line integrals of scalar and vector ﬁelds, respective ly , along closed curves. In some
older texts you may see the notation ⟲
/dispvarint
or ⟳
/dispvarint
to indicate a line integral traversing a closed
curve in a counterclockwise or clockwise direction, respective ly .


## Page 175

5.2 Properties of Line Integrals 167
/blackt∇iangle∇ight
/blackt∇iangleleft
C
t = a t = b
(a) Closed
/blackt∇iangle∇ight
/blackt∇iangleleft
C
t = a
t = b
(b) Not closed
Figure 5.2.1 Closed vs nonclosed curves
So far , the examples we have seen of line integrals (for instanc e, Example 5.2) have had
the same value for different curves joining the initial point t o the terminal point. That is,
the line integral has been independent of the path joining the two po ints. As we mentioned
before, this is not always the case. The following theorem giv es a necessary and sufﬁcient
condition for this path independence:
Theorem 5.3. In a region R, the line integral
/varint
C f ···dr is independent of the path between
any two points in R if and only if
/varoint
C f ···dr = 0 for every closed curve C which is contained in
R.
Proof: Suppose that
/varoint
C f ···dr = 0 for every closed curve C which is contained in R. Let P1
and P2 be two distinct points in R. Let C1 be a curve in R going from P1 to P2, and let C2
be another curve in R going from P1 to P2, as in Figure 4.2.2.
/blackt∇iangle∇ight
/blackt∇iangle∇ight
C1
C2
P1 P2
Figure 5.2.2
Then C = C1 ∪ − C2 is a closed curve in R (from P1 to
P1), and so
/varoint
C f ···dr = 0. Thus,
0 =
/dispvaroint
C
f ···dr
=
/dispvarint
C1
f ···dr +
/dispvarint
− C2
f ···dr
=
/dispvarint
C1
f ···dr −
/dispvarint
C2
f ···dr , and so
/varint
C1
f ···dr =
/varint
C2
f ···dr. This proves path independence.
Conversely , suppose that the line integral
/varint
C f···dr is independent of the path between any
two points in R. Let C be a closed curve contained in R. Let P1 and P2 be two distinct points


## Page 176

168 CHAPTER 5. LINE AND SURFACE INTEGRALS
on C. Let C1 be a part of the curve C that goes from P1 to P2, and let C2 be the remaining
part of C that goes from P1 to P2, again as in Figure 4.2.2. Then by path independence we
have
/dispvarint
C1
f ···dr =
/dispvarint
C2
f ···dr
/dispvarint
C1
f ···dr −
/dispvarint
C2
f ···dr = 0
/dispvarint
C1
f ···dr +
/dispvarint
− C2
f ···dr = 0 , so
/dispvaroint
C
f ···dr = 0
since C = C1 ∪ − C2 . QED
Clearly , the above theorem does not give a practical way to deter mine path independence,
since it is impossible to check the line integrals around all po ssible closed curves in a region.
What it mostly does is give an idea of the way in which line integra ls behave, and how seem-
ingly unrelated line integrals can be related (in this case, a speciﬁc line integral between
two points and all line integrals around closed curves).
Recall that if z = f (x, y) is a continuously differentiable function of x and y, and both
x = x(t) and y = y(t) are differentiable functions of t, then
d z
dt = ∂z
∂x
dx
dt + ∂z
∂y
d y
dt . (5.19)
This is multivariable version of the Chain Rule, see Theorem 3.3 and Corollary 3.4. We
will now use this version of Chain Rule to prove the following sufﬁcient condition for path
independence of line integrals:
Theorem 5.4. Let f(x, y) = P(x, y) i + Q(x, y) j be a vector ﬁeld in some region R, with P and
Q continuously differentiable functions on R. Let C be a smooth curve in R parametrized
by x = x(t), y = y(t), a ≤ t ≤ b. Suppose that there is a real-valued function F(x, y) such that
∇ F = f on R. Then /dispvarint
C
f ···dr = F(B) − F(A) , (5.20)
where A = (x(a), y(a)) and B = (x(b), y(b)) are the endpoints of C. Thus, the line integral is
independent of the path between its endpoints, since it depends only on t he values of F at
those endpoints.


## Page 177

5.2 Properties of Line Integrals 169
Proof: By deﬁnition of
/varint
C f ···dr, we have
/dispvarint
C
f ···dr =
b/dispvarint
a
(
P(x(t), y(t)) x ′(t) + Q(x(t), y(t)) y ′(t)
)
dt
=
b/dispvarint
a
(∂F
∂x
dx
dt + ∂F
∂y
d y
dt
)
dt (since ∇ F = f ⇒ ∂F
∂x = P and ∂F
∂y = Q)
=
b/dispvarint
a
F(x(t), y(t))′dt (by the Chain Rule in Theorem 3.3)
= F(x(t), y(t))
⏐
⏐
⏐
b
a
= F(B) − F(A)
by the Fundamental Theorem of Calculus.
QED
Theorem 5.4 can be thought of as the line integral version of t he Fundamental Theorem
of Calculus. A real-valued function F(x, y) such that ∇ F(x, y) = f(x, y) is called a potential
for f. A conservative vector ﬁeld is one which has a potential.
Example 5.5. Recall from Examples 5.2 and 5.3 in Section 4.1 that the line in tegral
/varint
C(x2 +
y2) dx + 2x y d y was found to have the value 13
3 for three different curves C going from the
point (0, 0) to the point (1 , 2). Use Theorem 5.4 to show that this line integral is indeed pat h
independent.
Solution: We need to ﬁnd a real-valued function F(x, y) such that
∂F
∂x = x2 + y2 and ∂F
∂y = 2x y .
Suppose that ∂F
∂x = x2 + y2, Then we must have F(x, y) = 1
3 x3 + x y2 + g(y) for some function
g(y). So ∂F
∂y = 2x y+ g ′(y) satisﬁes the condition ∂F
∂y = 2x y if g ′(y) = 0; that is, g(y) = K, where
K is a constant. Since any choice for K will do (why?), we pick K = 0. Thus, a potential
F(x, y) for f(x, y) = (x2 + y2) i + 2x yj exists, namely
F(x, y) = 1
3 x3 + x y2 .
Hence the line integral
/varint
C(x2 + y2) dx + 2x y d yis path independent.
Note that we can also verify that the value of the line integral of f along any curve C going
from (0, 0) to (1 , 2) will always be 13
3 , since by Theorem 5.4
/dispvarint
C
f ···dr = F(1, 2) − F(0, 0) = 1
3 (1)3 + (1)(2)2 − (0 + 0) = 1
3 + 4 = 13
3 .


## Page 178

170 CHAPTER 5. LINE AND SURFACE INTEGRALS
A consequence of Theorem 5.4 in the special case where C is a closed curve, so that the
endpoints A and B are the same point, is the following important corollary:
Corollary 5.5. If a vector ﬁeld f has a potential in a region R, then
/dispvaroint
C
f···dr = 0 for any closed
curve C in R. Equivalently , /dispvaroint
C
∇ F ···dr = 0
for any real-valued function F(x, y).
Example 5.6. Evaluate
/dispvaroint
C
x dx + y d y for C : x = 2 cost, y = 3 sint, 0 ≤ t ≤ 2π.
Solution: The vector ﬁeld f(x, y) = x i + y j has a potential F(x, y):
∂F
∂x = x ⇒ F(x, y) = 1
2 x2 + g(y) , so
∂F
∂y = y ⇒ g ′(y) = y ⇒ g(y) = 1
2 y2 + K
for any constant K, so F(x, y) = 1
2 x2 + 1
2 y2 is a potential for f(x, y). Thus,
/dispvaroint
C
x dx + y d y =
/dispvaroint
C
f ···dr = 0
by Corollary 5.5, since the curve C is closed (it is the ellipse x2
4 + y2
9 = 1).
Exercises
A
1. Evaluate
/dispvaroint
C
(x2 + y2) dx + 2x y d yfor C : x = cos t, y = sin t, 0 ≤ t ≤ 2π.
2. Evaluate
/dispvarint
C
(x2 + y2) dx + 2x y d yfor C : x = cos t, y = sin t, 0 ≤ t ≤ π.
3. Is there a potential F(x, y) for f(x, y) = y i − x j? If so, ﬁnd one.
4. Is there a potential F(x, y) for f(x, y) = x i − y j? If so, ﬁnd one.
5. Is there a potential F(x, y) for f(x, y) = x y2 i + x3 y j? If so, ﬁnd one.


## Page 179

5.2 Properties of Line Integrals 171
B
6. Let f(x, y) and g(x, y) be vector ﬁelds, let a and b be constants, and let C be a curve in R2.
Show that /dispvarint
C
(a f ± b g) ···dr = a
/dispvarint
C
f ···dr ± b
/dispvarint
C
g ···dr .
7. Let C be a curve whose arc length is L. Show that
/varint
C 1 ds = L.
8. Let f (x, y) and g(x, y) be continuously differentiable real-valued functions in a region R.
Show that /dispvaroint
C
f ∇ g ···dr = −
/dispvaroint
C
g ∇ f ···dr
for any closed curve C in R. ( Hint: Use Exercise 21 in Section 2.4. )
9. Let f(x, y) = − y
x2+ y2 i + x
x2+ y2 j for all ( x, y) ̸= (0, 0), and C : x = cos t, y = sin t, 0 ≤ t ≤ 2π.
(a) Show that
f = ∇ F,
for F(x, y) = tan− 1(y/x).
(b) Show that /dispvaroint
C
f ···dr = 2π.
Does this contradict Corollary 5.5? Explain.
C
10. Let g(x) and h(y) be differentiable functions, and let f(x, y) = h(y) i + g(x) j. For which
g(x) and h(y), the vector ﬁeld f is potential? Find the potential F(x, y) for all these cases.


## Page 180

172 CHAPTER 5. LINE AND SURFACE INTEGRALS
5.3 Green’s Theorem
We will now see a way of evaluating the line integral of a smooth vector ﬁeld around a simple
closed curve. A vector ﬁeld f(x, y) = P(x, y) i + Q(x, y) j is smooth if its component functions
P(x, y) and Q(x, y) are smooth. Green’s Theorem relates the line integral around a closed
curve with a double integral over the region inside the curve:
Theorem 5.6. (Green’s Theorem ) Let R be a region in R2 whose boundary is a simple
closed curve C which is piecewise smooth. Let f(x, y) = P(x, y) i + Q(x, y) j be a smooth vector
ﬁeld deﬁned on both R and C. Then
/dispvaroint
C
f ···dr =
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A , (5.21)
where C is traversed so that R is always on the left side of C.
Proof: We will prove the theorem in the case for a simple region R, that is, where the
boundary curve C can be written as C = C1 ∪ C2 in two distinct ways:
C1 = the curve y = y1(x) from the point X 1 to the point X 2 (5.22)
C2 = the curve y = y2(x) from the point X 2 to the point X 1, (5.23)
where X 1 and X 2 are the points on C farthest to the left and right, respectively; and
C1 = the curve x = x1(y) from the point Y2 to the point Y1 (5.24)
C2 = the curve x = x2(y) from the point Y1 to the point Y2, (5.25)
where Y1 and Y2 are the lowest and highest points, respectively , on C. See Figure 4.3.1.
a b
x
y
/blackt∇iangleleft
/blackt∇iangle∇ight
y = y2(x)
y = y1(x)
x = x2(y)
x = x1(y)
Y2
Y1
X 2
X 1 R
C
d
c
Figure 5.3.1
Integrate P(x, y) around C using the representation C = C1 ∪ C2 given by (4.23) and (4.24).
Since y = y1(x) along C1 (as x goes from a to b) and y = y2(x) along C2 (as x goes from b to


## Page 181

5.3 Green’s Theorem 173
a), as we see from Figure 4.3.1, then we have
/dispvaroint
C
P(x, y) dx =
/dispvarint
C1
P(x, y) dx +
/dispvarint
C2
P(x, y) dx
=
b/dispvarint
a
P(x, y1(x)) dx +
a/dispvarint
b
P(x, y2(x)) dx
=
b/dispvarint
a
P(x, y1(x)) dx −
b/dispvarint
a
P(x, y2(x)) dx
= −
b/dispvarint
a
(P(x, y2(x)) − P(x, y1(x))) dx
= −
b/dispvarint
a
(
P(x, y)
⏐
⏐
⏐
y= y2(x)
y= y1(x)
)
dx
= −
b/dispvarint
a
y2(x)/dispvarint
y1(x)
∂P(x, y)
∂y d y dx (by the Fundamental Theorem of Calculus)
= −
/dispiint
R
∂P
∂y d A .
Likewise, integrate Q(x, y) around C using the representation C = C1 ∪ C2 given by (4.25)
and (4.26). Since x = x1(y) along C1 (as y goes from d to c) and x = x2(y) along C2 (as y goes
from c to d), as we see from Figure 4.3.1, then we have
/dispvaroint
C
Q(x, y) d y =
/dispvarint
C1
Q(x, y) d y +
/dispvarint
C2
Q(x, y) d y
=
c/dispvarint
d
Q(x1(y), y) d y +
d/dispvarint
c
Q(x2(y), y) d y
= −
d/dispvarint
c
Q(x1(y), y) d y +
d/dispvarint
c
Q(x2(y), y) d y
=
d/dispvarint
c
(Q(x2(y), y) − Q(x1(y), y)) d y
=
d/dispvarint
c
(
Q(x, y)
⏐
⏐
⏐
x= x2(y)
x= x1(y)
)
d y


## Page 182

174 CHAPTER 5. LINE AND SURFACE INTEGRALS
=
d/dispvarint
c
x2(y)/dispvarint
x1(y)
∂Q(x, y)
∂x dx d y (by the Fundamental Theorem of Calculus)
=
/dispiint
R
∂Q
∂x d A , and so
/dispvaroint
C
f ···dr =
/dispvaroint
C
P(x, y) dx +
/dispvaroint
C
Q(x, y) d y
= −
/dispiint
R
∂P
∂y d A+
/dispiint
R
∂Q
∂x d A
=
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A .
QED
Example 5.7. Evaluate /dispvaroint
C
(x2 + y2) dx + 2x y d y,
where C is the boundary (traversed counterclockwise) of the region R = { (x, y) : 0 ≤ x ≤
1, 2x2 ≤ y ≤ 2x }.
x
y
0
(1, 2)
2
1
C
Figure 5.3.2
Solution: R is the shaded region in Figure 4.3.2. By Green’s Theorem, for
P(x, y) = x2 + y2 and Q(x, y) = 2x y, we have
/dispvaroint
C
(x2 + y2) dx + 2x y d y =
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A
=
/dispiint
R
(2y − 2y) d A =
/dispiint
R
0 d A = 0 .
We actually already knew that the answer was zero. Recall from E xample 5.5 in Section
4.2 that the vector ﬁeld f(x, y) = (x2 + y2) i + 2x yj has a potential function F(x, y) = 1
3 x3 + x y2,
and so
/varoint
C f ···dr = 0 by Corollary 5.5.
Though we proved Green’s Theorem only for a simple region R, the theorem can also
be proved for more general regions; in particular to regions whi ch admit subdivision into


## Page 183

5.3 Green’s Theorem 175
simple regions. 1 It includes regions bounded by few closed curves. For such regi ons, the
“outer” boundary and the “inner” boundaries are traversed so t hat R is always on the left
side.
C1
C2
R1
R2
/blackt∇iangle∇ight
/blackt∇iangleleft
/blackt∇iangleleft
/blackt∇iangle∇ight
(a) Region R with one hole
C1
C2C3
R1
R2
/blackt∇iangle∇ight /blackt∇iangle∇ight
/blackt∇iangleleft /blackt∇iangleleft
/blackt∇iangleleft
/blackt∇iangle∇ight
(b) Region R with two holes
Figure 5.3.3 Multiply connected regions
The idea for why Green’s Theorem holds for such regions is shown in F igure 5.3.3 above.
The idea is to cut region R so that it is divided into simple subregions. For example, in
Figure 5.3.3(a) the region R is the union of the regions R1 and R2, which are divided by the
slits indicated by the dashed lines. Those slits are part of the b oundary of both R1 and R2,
and we traverse then in the manner indicated by the arrows. Notic e that along each slit the
boundary of R1 is traversed in the opposite direction as that of R2, which means that the line
integrals of f along those slits cancel each other out. Assuming that Green’ s Theorem holds
for R1 and R2, we get
/dispvaroint
bdy
of R1
f ···dr =
/dispiint
R1
(∂Q
∂x − ∂P
∂y
)
d A and
/dispvaroint
bdy
of R2
f ···dr =
/dispiint
R2
(∂Q
∂x − ∂P
∂y
)
d A .
But since the line integrals along the slits cancel out, we hav e
/dispvaroint
C1∪ C2
f ···dr =
/dispvaroint
bdy
of R1
f ···dr +
/dispvaroint
bdy
of R2
f ···dr ,
and so
/dispvaroint
C1∪ C2
f ···dr =
/dispiint
R1
(∂Q
∂x − ∂P
∂y
)
d A +
/dispiint
R2
(∂Q
∂x − ∂P
∂y
)
d A =
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A ,
which shows that Green’s Theorem holds in the region R. A similar argument shows that
the theorem holds in the region with two holes shown in Figure 5.3. 3(b).
1See T AYLOR and M ANN , § 15.31 for a discussion of some of the difﬁculties involved when the boundary curve
is “complicated”.


## Page 184

176 CHAPTER 5. LINE AND SURFACE INTEGRALS
Example 5.8. Let f(x, y) = P(x, y) i + Q(x, y) j, where
P(x, y) = − y
x2 + y2 and Q(x, y) = x
x2 + y2 ,
and let R = { (x, y) : 0 < x2 + y2 ≤ 1 }. For the boundary curve C : x2 + y2 = 1, traversed counter-
clockwise, it was shown in Exercise 9(b) in Section 4.2 that
/varoint
C f ···dr = 2π. But
∂Q
∂x = y2 − x2
(x2 + y2)2 = ∂P
∂y ⇒
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A =
/dispiint
R
0 d A = 0 .
This would seem to contradict Green’s Theorem. However , note that R is not the entire
region enclosed by C, since the point (0 , 0) is not contained in R. That is, R has a “hole” at
the origin, so Green’s Theorem does not apply .
x
y
0
C1
C2
1
1
1/2
1/2
R
/blackt∇iangle∇ight
/blackt∇iangleleft
Figure 5.3.4 The annulus R
If we modify the region R to be the annulus R =
{ (x, y) : 1/4 ≤ x2 + y2 ≤ 1 } (see Figure 4.3.3), and take
the “boundary” C of R to be C = C1 ∪ C2, where C1 is
the unit circle x2 + y2 = 1 traversed counterclockwise
and C2 is the circle x2 + y2 = 1/4 traversed clockwise,
then it can be shown (see Exercise 8) that
/dispvaroint
C
f ···dr = 0 .
We would still have
/iint
R
(
∂Q
∂x − ∂P
∂y
)
d A = 0, so for this R
we would have
/dispvaroint
C
f ···dr =
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A ,
which shows that Green’s Theorem holds for the annular region R.
We know from Corollary 5.5 that when a smooth vector ﬁeld f(x, y) = P(x, y) i + Q(x, y) j on
a region R (whose boundary is a piecewise smooth, simple closed curve C) has a potential in
R, then
/varoint
C f···dr = 0. And if the potential F(x, y) is smooth in R, then ∂F
∂x = P and ∂F
∂y = Q, and
so we know that
∂2F
∂y ∂x = ∂2F
∂x ∂y ⇒ ∂P
∂y = ∂Q
∂x in R.
Conversely , if ∂P
∂y = ∂Q
∂x in R then
/dispvaroint
C
f ···dr =
/dispiint
R
(∂Q
∂x − ∂P
∂y
)
d A =
/dispiint
R
0 d A = 0 .


## Page 185

5.3 Green’s Theorem 177
For a simply connected region R (that is, a region with no holes), the following can be
shown:
The following statements are equivalent for a simply connecte d region R in R2:
(a) f(x, y) = P(x, y) i + Q(x, y) j has a smooth potential F(x, y) in R
(b)
/dispvarint
C
f ···dr is independent of the path for any curve C in R
(c)
/dispvaroint
C
f ···dr = 0 for every simple closed curve C in R
(d) ∂P
∂y = ∂Q
∂x in R (in this case, the differential form P dx + Q d y is exact)
A
For Exercises 1–4, use Green’s Theorem to evaluate the given l ine integral around the curve
C, traversed counterclockwise.
1.
/dispvaroint
C
(x2 − y2) dx + 2x y d y; C is the boundary of R = { (x, y) : 0 ≤ x ≤ 1, 2x2 ≤ y ≤ 2x }
2.
/dispvaroint
C
x2 y dx + 2x y d y; C is the boundary of R = { (x, y) : 0 ≤ x ≤ 1, x2 ≤ y ≤ x }
3.
/dispvaroint
C
2y dx − 3x d y; C is the circle x2 + y2 = 1
4.
/dispvaroint
C
(ex2
+ y2) dx + (e y2
+ x2) d y; C is the boundary of the triangle with vertices (0 , 0), (4 , 0)
and (0, 4)
5. Is there a potential F(x, y) for f(x, y) = (y2 + 3x2) i + 2x yj? If so, ﬁnd one.
6. Is there a potential F(x, y) for f(x, y) = (x3 cos(x y) + 2x sin(x y)) i + x2 y cos(x y) j? If so, ﬁnd
one.
7. Is there a potential F(x, y) for f(x, y) = (8x y+ 3) i + 4(x2 + y) j? If so, ﬁnd one.
8. Show that /dispvaroint
C
a dx + b d y= 0
for any constants a, b and any closed simple curve C.
B


## Page 186

178 CHAPTER 5. LINE AND SURFACE INTEGRALS
9. For the vector ﬁeld f as in Example 5.8, show directly that
/varoint
C f ···dr = 0, where C is the
boundary of the annulus R = { (x, y) : 1/4 ≤ x2 + y2 ≤ 1 } traversed so that R is always on
the left.
10. Evaluate /dispvaroint
C
ex sin y dx + (y3 + ex cos y) d y,
where C is the boundary of the rectangle with vertices (1 , − 1), (1 , 1), ( − 1, 1) and ( − 1, − 1),
traversed counterclockwise.
C
11. For a region R bounded by a simple closed curve C, show that the area A of R is
A = −
/dispvaroint
C
y dx =
/dispvaroint
C
x d y = 1
2
/dispvaroint
C
x d y− y dx ,
where C is traversed so that R is always on the left. ( Hint: Use Green’s Theorem and the
fact that A =
/iint
R 1 d A.)
In the following exercises, use Exercise 11 to ﬁnd the area bou nded by curve. (Y ou should
ﬁgure out how the curve traversed around the region it bounds. )
12. The curve (sin t, sin(2t)) for 0 ≤ t ≤ π.
13. The deltoid curve (2 cos t+ cos 2t, 2 sint− sin 2t) for 0 ≤ t ≤ 2π. (The deltoid curve is shown
on the diagram; you can assume without proof that it has no self-i ntesections.)


## Page 187

5.4 Surface Integrals and the Divergence Theorem 179
5.4 Surface Integrals and the Divergence Theorem
In Section 4.1 we learned how to integrate along a curve. We will now learn how to perform
integration over a surface in R3, such as a sphere or a paraboloid. Recall from Section 1.8
how we identiﬁed points ( x, y, z) on a curve C in R3, parametrized by x = x(t), y = y(t), z = z(t),
a ≤ t ≤ b, with the terminal points of the position vector
r(t) = x(t)i + y(t)j + z(t)k for t in [a, b].
The idea behind a parametrization of a curve is that it “transfo rms” a subset of R1 (nor-
mally an interval [ a, b]) into a curve in R2 or R3 (see Figure 5.4.1).
a t b
R1 y
z
x
0
(x(a), y(a), z(a))
(x(t), y(t), z(t))
(x(b), y(b), z(b))r(t)
Cx = x(t)
y = y(t)
z = z(t)
Figure 5.4.1 Parametrization of a curve C in R3
Similar to how we used a parametrization of a curve to deﬁne the li ne integral along the
curve, we will use a parametrization of a surface to deﬁne a surface integral . We will use
two variables, u and v, to parametrize a surface Σ in R3: x = x(u, v), y = y(u, v), z = z(u, v),
for ( u, v) in some region R in R2 (see Figure 5.4.2).
u
v
R
R2
(u, v)
y
z
x
0
Σ
r(u, v)
x = x(u, v)
y = y(u, v)
z = z(u, v)
Figure 5.4.2 Parametrization of a surface Σ in R3
In this case, the position vector of a point on the surface Σ is given by the vector-valued


## Page 188

180 CHAPTER 5. LINE AND SURFACE INTEGRALS
function
r(u, v) = x(u, v)i + y(u, v)j + z(u, v)k for ( u, v) in R.
Since r(u, v) is a function of two variables, deﬁne the partial derivatives ∂r
∂u and ∂r
∂v for (u, v)
in R by
∂r
∂u (u, v) = ∂x
∂u (u, v)i + ∂y
∂u (u, v)j + ∂z
∂u (u, v)k , and
∂r
∂v (u, v) = ∂x
∂v (u, v)i + ∂y
∂v (u, v)j + ∂z
∂v (u, v)k .
The parametrization of Σ can be thought of as “transforming” a region in R2 (in the uv-
plane) into a 2-dimensional surface in R3. This parametrization of the surface is sometimes
called a patch, based on the idea of “patching” the region R onto Σ in the grid-like manner
shown in Figure 5.4.2.
In fact, those gridlines in R lead us to how we will deﬁne a surface integral over Σ. Along
the vertical gridlines in R, the variable u is constant. So those lines get mapped to curves on
Σ, and the variable u is constant along the position vector r(u, v). Thus, the tangent vector
to those curves at a point ( u, v) is ∂r
∂v . Similarly , the horizontal gridlines in R get mapped to
curves on Σ whose tangent vectors are ∂r
∂u .
Now take a point ( u, v) in R as, say , the lower left corner of one of the rectangular grid
sections in R, as shown in Figure 5.4.2. Suppose that this rectangle has a smal l width and
height of ∆u and ∆v, respectively . The corner points of that rectangle are ( u, v), ( u + ∆u, v),
(u+ ∆u, v+ ∆v) and (u, v+ ∆v). So the area of that rectangle is A = ∆u ∆v. Then that rectangle
gets mapped by the parametrization onto some section of the surf ace Σ which, for ∆u and
∆v small enough, will have a surface area that is very close to the area of the parallelogram
which has adjacent sides r(u + ∆u, v) − r(u, v) (corresponding to the line segment from ( u, v)
to ( u + ∆u, v) in R) and r(u, v + ∆v) − r(u, v) (corresponding to the line segment from ( u, v)
to ( u, v + ∆v) in R). Combining our usual notion of a partial derivative (see Deﬁni tion 3.3
in Section 2.2) with that of the derivative of a vector-valued f unction (see Deﬁnition 2.3 in
Section 1.8) applied to a function of two variables, we have
∂r
∂u ≈ r(u + ∆u, v) − r(u, v)
∆u , and
∂r
∂v ≈ r(u, v + ∆v) − r(u, v)
∆v ,
and so the surface area element dσ is approximately

(r(u + ∆u, v) − r(u, v)) ××× (r(u, v + ∆v) − r(u, v))

 ≈



(∆u ∂r
∂u ) ××× (∆v ∂r
∂v )



 =




∂r
∂u ××× ∂r
∂v



 ∆u ∆v
by Theorem 1.13 in Section 1.4. Thus, the total surface area S of Σ is approximately the sum
of all the quantities

 ∂r
∂u ××× ∂r
∂v

 ∆u ∆v, summed over the rectangles in R. Taking the limit of


## Page 189

5.4 Surface Integrals and the Divergence Theorem 181
that sum as the diagonal of the largest rectangle goes to 0 give s
S =
/dispiint
R




∂r
∂u ××× ∂r
∂v



 du dv . (5.26)
We will write the double integral on the right using the special no tation
/dispiint
Σ
dσ =
/dispiint
R




∂r
∂u ××× ∂r
∂v



 du dv . (5.27)
This is a special case of a surface integral over the surface Σ, where the surface area element
dσ can be thought of as 1 dσ. Replacing 1 by a general real-valued function f (x, y, z) deﬁned
in R3, we have the following:
Deﬁnition 5.3. Let Σ be a surface in R3 parametrized by x = x(u, v), y = y(u, v),
z = z(u, v), for ( u, v) in some region R in R2. Let r(u, v) = x(u, v)i + y(u, v)j + z(u, v)k be the
position vector for any point on Σ, and let f (x, y, z) be a real-valued function deﬁned on some
subset of R3 that contains Σ. The surface integral of f (x, y, z) over Σ is
/dispiint
Σ
f (x, y, z) dσ =
/dispiint
R
f (x(u, v), y(u, v), z(u, v))




∂r
∂u ××× ∂r
∂v



 du dv . (5.28)
In particular , the surface area S of Σ is
S =
/dispiint
Σ
1 dσ . (5.29)
Example 5.9. A torus T is a surface obtained by revolving a circle of radius a in the yz-plane
around the z-axis, where the circle’s center is at a distance b from the z-axis (0 < a < b), as
in Figure 5.4.3. Find the surface area of T.
Solution: For any point on the circle, the line segment from the center of the circle to that
point makes an angle u with the y-axis in the positive y direction (see Figure 5.4.3(a)). And
as the circle revolves around the z-axis, the line segment from the origin to the center of that
circle sweeps out an angle v with the positive x-axis (see Figure 5.4.3(b)). Thus, the torus
can be parametrized as:
x = (b + a cos u) cosv , y = (b + a cos u) sinv , z = a sin u , 0 ≤ u ≤ 2π , 0 ≤ v ≤ 2π
So for the position vector
r(u, v) = x(u, v)i + y(u, v)j + z(u, v)k
= (b + a cos u) cosv i + (b + a cos u) sinv j + a sin u k


## Page 190

182 CHAPTER 5. LINE AND SURFACE INTEGRALS
y
z
0
a
(y − b)2 + z2 = a2
u
b
(a) Circle in the yz-plane
x
y
z
v
a
(x,y,z)
(b) Torus T
Figure 5.4.3
we see that
∂r
∂u = − a sin u cos v i − a sin u sin v j + a cos u k
∂r
∂v = − (b + a cos u) sinv i + (b + a cos u) cosv j + 0k ,
and so computing the cross product gives
∂r
∂u ××× ∂r
∂v = − a(b + a cos u) cosv cos u i − a(b + a cos u) sinv cos u j − a(b + a cos u) sinu k ,
which has magnitude 



∂r
∂u ××× ∂r
∂v



 = a(b + a cos u) .
Thus, the surface area of T is
S =
/dispiint
Σ
1 dσ
=
2π/dispvarint
0
2π/dispvarint
0




∂r
∂u ××× ∂r
∂v



 du dv
=
2π/dispvarint
0
2π/dispvarint
0
a(b + a cos u) du dv
=
2π/dispvarint
0
(
abu + a2 sin u
⏐
⏐
⏐
u= 2π
u= 0
)
dv
=
2π/dispvarint
0
2πab dv


## Page 191

5.4 Surface Integrals and the Divergence Theorem 183
= 4π2ab
y
z
x
0
Figure 5.4.4
Assume that a surface Σ is given by a collection of charts.
Note that for each chart r(u, v) in the collection, the vectors ∂r
∂u
and ∂r
∂v are tangent to the surface. Therefore, their crossproduct
∂r
∂u (u, v) ××× ∂r
∂v (u, v) is normal to Σ at the point with position vector
r(u, v).
Assume further that at each point P of the surface Σ one can
choose a unit normal vector n in such a way such that for ev-
ery chart r(u, v) in the collection n at the point with position
vector r(u, v), the crossproduct ∂r
∂u (u, v) ××× ∂r
∂v (u, v) and is codirec-
tional with n. In this case Σ is called oriented and the vector
ﬁeld n is called outward unit normal vector of Σ.
Deﬁnition 5.4. Let Σ be an oriented surface in R3 and let f(x, y, z) be a vector ﬁeld deﬁned
on some subset of R3 that contains Σ. The surface integral of f over Σ is
/dispiint
Σ
f ···dσ =
/dispiint
Σ
f ···n dσ , (5.30)
where, at any point on Σ, n is the outward unit normal vector to Σ.
In particular , if Σ is given by a single chart r(u, v) = x(u, v)i + y(u, v)j + z(u, v)k deﬁned
on a plane region R then
/dispiint
Σ
f ···dσ =
/dispiint
R
f(x(u, v), y(u, v), z(u, v)) ···
(∂r
∂u (u, v) ××× ∂r
∂v (u, v)
)
du dv .
Note in the above deﬁnition that the dot product inside the integra l on the right is a real-
valued function, and hence we can use Deﬁnition 5.3 to evaluate the integral.
Example 5.10. Evaluate the surface integral
/iint
Σ
f···dσ, where f(x, y, z) = yzi+ xzj+ x yk and Σ
is the part of the plane x+ y+ z = 1 with x ≥ 0, y ≥ 0, and z ≥ 0, with the outward unit normal
n pointing in the positive z direction (see Figure 4.4.5).


## Page 192

184 CHAPTER 5. LINE AND SURFACE INTEGRALS
y
z
x
0
1
1
1
Σ
x + y + z = 1
n
Figure 5.4.5
Solution: Since the vector v = (1, 1, 1) is normal to the plane x + y + z = 1
(why?), then dividing v by its length yields the outward unit normal
vector n =
(
1/∇adicallow
3 , 1/∇adicallow
3 , 1/∇adicallow
3
)
. We now need to parametrize Σ. As we can see
from Figure 4.4.5, projecting Σ onto the x y-plane yields a triangular
region R = { (x, y) : 0 ≤ x ≤ 1, 0 ≤ y ≤ 1 − x }. Thus, using ( u, v) instead of
(x, y), we see that
x = u, y = v, z = 1 − (u + v), for 0 ≤ u ≤ 1, 0 ≤ v ≤ 1 − u
is a parametrization of Σ over R (since z = 1 − (x + y) on Σ). So on Σ,
f ···n = (yz, xz, x y) ···
( 1/∇adicallow
3
, 1/∇adicallow
3
, 1/∇adicallow
3
)
= 1/∇adicallow
3
(yz + xz + x y)
= 1/∇adicallow
3
((x + y)z + x y) = 1/∇adicallow
3
((u + v)(1 − (u + v)) + uv)
= 1/∇adicallow
3
((u + v) − (u + v)2 + uv)
for ( u, v) in R, and for r(u, v) = x(u, v)i + y(u, v)j + z(u, v)k = ui + vj + (1 − (u + v))k we have
∂r
∂u ××× ∂r
∂v = (1, 0, − 1) ××× (0, 1, − 1) = (1, 1, 1) ⇒




∂r
∂u ××× ∂r
∂v



 =
/∇adicallow
3 .
Thus, integrating over R using vertical slices (indicated by the dashed line in Figure 4 .4.5)
gives
/dispiint
Σ
f ···dσ =
/dispiint
Σ
f ···n dσ
=
/dispiint
R
(f(x(u, v), y(u, v), z(u, v)) ···n)




∂r
∂u ××× ∂r
∂v



 dv du
=
1/dispvarint
0
1− u/dispvarint
0
1
/∇adicallow
3
((u + v) − (u + v)2 + uv)
/∇adicallow
3 dv du
=
1/dispvarint
0
(
(u + v)2
2 − (u + v)3
3 + uv2
2
⏐
⏐
⏐
⏐
v= 1− u
v= 0
)
du
=
1/dispvarint
0
(1
6 + u
2 − 3u2
2 + 5u3
6
)
du
= u
6 + u2
4 − u3
2 + 5u4
24
⏐
⏐
⏐
⏐
1
0
= 1
8 .


## Page 193

5.4 Surface Integrals and the Divergence Theorem 185
Computing surface integrals can often be tedious, especially wh en the formula for the
outward unit normal vector at each point of Σ changes. The following theorem provides an
easier way in the case when Σ is a closed surface , that is, when Σ encloses a bounded
solid in R3. For example, spheres, cubes, and ellipsoids are closed surface s, but planes and
paraboloids are not.
Theorem 5.7. (Divergence Theorem ) Let Σ be a closed surface in R3 which bounds a
solid S, and let f(x, y, z) = f1(x, y, z)i + f2(x, y, z)j + f3(x, y, z)k be a vector ﬁeld deﬁned on some
subset of R3 that contains Σ. Then
/dispiint
Σ
f ···dσ =
/dispiiint
S
div f dV , (5.31)
where
div f = ∂f1
∂x + ∂f2
∂y + ∂f3
∂z (5.32)
is called the divergence of f.
The proof of the Divergence Theorem is very similar to the proof o f Green’s Theorem. It is
ﬁrst proved for the simple case when the solid S is bounded above by one surface, bounded
below by another surface, and bounded laterally by one or more surfaces. The proof can then
be extended to more general solids. 2
Example 5.11. Evaluate
/iint
Σ
f ···dσ, where f(x, y, z) = xi + yj + zk and Σ is the unit sphere
x2 + y2 + z2 = 1.
Solution: We see that div f = 1 + 1 + 1 = 3, so
/dispiint
Σ
f ···dσ =
/dispiiint
S
div f dV =
/dispiiint
S
3 dV
= 3
/dispiiint
S
1 dV = 3 vol(S) = 3 ·4π(1)3
3 = 4π .
In physical applications, the surface integral
/iint
Σ
f ···dσ is often referred to as the ﬂux of f
through the surface Σ. For example, if f represents the velocity ﬁeld of a ﬂuid, then the ﬂux
is the net quantity of ﬂuid to ﬂow through the surface Σ per unit time. A positive ﬂux means
there is a net ﬂow out of the surface (that is, in the direction of the outward unit no rmal
vector n), while a negative ﬂux indicates a net ﬂow inward (in the directi on of − n).
2See T AYLOR and M ANN , § 15.6 for the details.


## Page 194

186 CHAPTER 5. LINE AND SURFACE INTEGRALS
The term divergence comes from interpreting div f as a measure of how much a vector
ﬁeld “diverges” from a point. This is best seen by using another deﬁnition of div f which is
equivalent3 to the deﬁnition given by formula (5.32). Namely , for a point ( x, y, z) in R3,
div f(x, y, z) = lim
V → 0
1
V
/dispiint
Σ
f ···dσ , (5.33)
where V is the volume enclosed by a closed surface Σ around the point ( x, y, z). In the
limit, V → 0 means that we take smaller and smaller closed surfaces aroun d ( x, y, z), which
means that the volumes they enclose are going to zero. It can b e shown that this limit is
independent of the shapes of those surfaces. Notice that the limi t being taken is of the
ratio of the ﬂux through a surface to the volume enclosed by th at surface, which gives a
rough measure of the ﬂow “leaving” a point, as we mentioned. Vect or ﬁelds which have zero
divergence are often called solenoidal ﬁelds.
The following theorem is a simple consequence of formula (5.33 ).
Theorem 5.8. If the ﬂux of a vector ﬁeld f is zero through every closed surface containing a
given point, then div f = 0 at that point.
Proof: By formula (5.33), at the given point ( x, y, z) we have
div f(x, y, z) = lim
V → 0
1
V
/dispiint
Σ
f ···dσ for closed surfaces Σ containing ( x, y, z), so
= lim
V → 0
1
V (0) by our assumption that the ﬂux through each Σ is zero, so
= lim
V → 0
0
= 0 . QED
Lastly , we note that sometimes the notation
/dispoiint
Σ
f (x, y, z) dσ and
/dispoiint
Σ
f ···dσ
is used to denote surface integrals of scalar and vector ﬁelds, respectively , over closed sur-
faces.
Exercises
A
3See S CHEY , p. 36–39, for an intuitive discussion of this.


## Page 195

5.4 Surface Integrals and the Divergence Theorem 187
For Exercises 1–2, parametrize the surface Σ and rewrite the surface integral
/dispiint
Σ
f ···dσ
as an iterated integral assuming that the orientation on Σ is given by outer normal vector
and f = Pi + Qj + Rk for some function P(x, y, z), Q(x, y, z) and R(x, y, z).
1. If Σ is the ellipse given by equation is x2 + y2
4 + z2
9 = 1.
2. If Σ is the surface of revolution of the circle ( x− 2)2 + z2 = 1 in the ( xz)-plane around z-axis.
For Exercises 3–6, use the Divergence Theorem to evaluate the surface integral
/dispiint
Σ
f ···dσ
of the given vector ﬁeld f(x, y, z) over the surface Σ.
3. f (x, y, z) = xi + 2yj + 3zk, Σ : x2 + y2 + z2 = 9
4. f (x, y, z) = xi + yj + zk, Σ : boundary of the solid cube S = { (x, y, z) : 0 ≤ x, y, z ≤ 1 }
5. f (x, y, z) = x3i + y3j + z3k, Σ : x2 + y2 + z2 = 1
6. f (x, y, z) = 2i + 3j + 5k, Σ : x2 + y2 + z2 = 1
B
7. Show that the ﬂux of any constant vector ﬁeld through any clos ed surface is zero.
8. Evaluate the surface integral from Exercise 2 without using the Divergence Theorem;
that is, using only Deﬁnition 5.3, as in Example 5.10. Note that there will be a different
outward unit normal vector to each of the six faces of the cube .
9. Evaluate the surface integral
/iint
Σ
f ···dσ, where f(x, y, z) = x2i + x yj + zk and Σ is the part of
the plane 6 x + 3y + 2z = 6 with x ≥ 0, y ≥ 0, and z ≥ 0, with the outward unit normal n
pointing in the positive z direction.
10. Use a surface integral to show that the surface area of a sphere of radius r is 4 πr2.
(Hint: Use spherical coordinates to parametrize the sphere. )
11. Use a surface integral to show that the surface area of a right circular cone of radius R
and height h is πR
/∇adicallow
h2 + R2. ( Hint: Use the parametrization x = r cos θ, y = r sin θ, z = h
R r,
for 0 ≤ r ≤ R and 0 ≤ θ ≤ 2π.)


## Page 196

188 CHAPTER 5. LINE AND SURFACE INTEGRALS
12. The ellipsoid x2
a2 + y2
b2 + z2
c2 = 1 can be parametrized using ellipsoidal coordinates
x = a sin φ cos θ , y = b sin φ sin θ , z = c cos φ , for 0 ≤ θ ≤ 2π and 0 ≤ φ ≤ π.
Show that the surface area S of the ellipsoid is
S =
π/dispvarint
0
2π/dispvarint
0
sin φ
√
a2b2 cos2 φ + c2(a2 sin2 θ + b2 cos2 θ) sin2 φ dθ dφ .
(Note: The above double integral can not be evaluated by eleme ntary means. For speciﬁc
values of a, b and c it can be evaluated using numerical methods. An alternative i s to
express the surface area in terms of elliptic integrals.4)
C
13. Use Deﬁnition 5.3 to prove that the surface area S over a region R in R2 of a surface
z = f (x, y) is given by the formula
S =
/dispiint
R
√
1 +
(
∂f
∂x
)2
+
(
∂f
∂y
)2
d A .
(Hint: Think of the parametrization of the surface. )
4BOWMAN , F., Introduction to Elliptic Functions, with Applications , New Y ork: Dover , 1961, § III.7.


## Page 197

5.5 Stokes’ Theorem 189
5.5 Stokes’ Theorem
So far the only types of line integrals which we have discussed are those along curves in R2.
But the deﬁnitions and properties which were covered in Sections 4 .1 and 4.2 can easily be
extended to include functions of three variables, so that we can now discuss line integrals
along curves in R3.
Deﬁnition 5.5. For a real-valued function f (x, y, z) and a curve C in R3, parametrized by
x = x(t), y = y(t), z = z(t), a ≤ t ≤ b, the line integral of f (x, y, z) along C with respect to
arc length s is
/dispvarint
C
f (x, y, z) ds =
b/dispvarint
a
f (x(t), y(t), z(t))
√
x ′(t)2 + y ′(t)2 + z ′(t)2 dt . (5.34)
The line integral of f (x, y, z) along C with respect to x is
/dispvarint
C
f (x, y, z) dx =
b/dispvarint
a
f (x(t), y(t), z(t)) x ′(t) dt . (5.35)
The line integral of f (x, y, z) along C with respect to y is
/dispvarint
C
f (x, y, z) d y =
b/dispvarint
a
f (x(t), y(t), z(t)) y ′(t) dt . (5.36)
The line integral of f (x, y, z) along C with respect to z is
/dispvarint
C
f (x, y, z) d z =
b/dispvarint
a
f (x(t), y(t), z(t)) z ′(t) dt . (5.37)
Similar to the two-variable case, if f (x, y, z) ≥ 0 then the line integral
/varint
C f (x, y, z) ds can be
thought of as the total area of the “picket fence” of height f (x, y, z) at each point along the
curve C in R3.
Vector ﬁelds in R3 are deﬁned in a similar fashion to those in R2, which allows us to deﬁne
the line integral of a vector ﬁeld along a curve in R3.


## Page 198

190 CHAPTER 5. LINE AND SURFACE INTEGRALS
Deﬁnition 5.6. For a vector ﬁeld f(x, y, z) = P(x, y, z) i + Q(x, y, z) j + R(x, y, z) k and a curve C
in R3 with a smooth parametrization x = x(t), y = y(t), z = z(t), a ≤ t ≤ b, the line integral
of f along C is
/dispvarint
C
f ···dr =
/dispvarint
C
P(x, y, z) dx +
/dispvarint
C
Q(x, y, z) d y +
/dispvarint
C
R(x, y, z) d z (5.38)
=
b/dispvarint
a
f(x(t), y(t), z(t)) ···r ′(t) dt , (5.39)
where r(t) = x(t) i + y(t) j + z(t) k is the position vector for points on C.
Similar to the two-variable case, if f(x, y, z) represents the force applied to an object at a
point ( x, y, z) then the line integral
/varint
C f ···dr represents the work done by that force in moving
the object along the curve C in R3.
Some of the most important results we will need for line integral s in R3 are stated below
without proof (the proofs are similar to their two-variable equi valents).
Theorem 5.9. For a vector ﬁeld f(x, y, z) = P(x, y, z) i + Q(x, y, z) j + R(x, y, z) k and a curve
C with a smooth parametrization x = x(t), y = y(t), z = z(t), a ≤ t ≤ b and position vector
r(t) = x(t) i + y(t) j + z(t) k, /dispvarint
C
f ···dr =
/dispvarint
C
f ···T ds , (5.40)
where T(t) = r ′(t)
∥r ′(t)∥ is the unit tangent vector to C at ( x(t), y(t), z(t)).
Theorem 5.10. (Chain Rule ) If w = f (x, y, z) is a continuously differentiable function of
x, y, and z, and x = x(t), y = y(t) and z = z(t) are differentiable functions of t, then w is a
differentiable function of t, and
dw
dt = ∂w
∂x
dx
dt + ∂w
∂y
d y
dt + ∂w
∂z
d z
dt . (5.41)
Also, if x = x(t1, t2), y = y(t1, t2) and z = z(t1, t2) are continuously differentiable function of
(t1, t2), then 5
∂w
∂t1
= ∂w
∂x
∂x
∂t1
+ ∂w
∂y
∂y
∂t1
+ ∂w
∂z
∂z
∂t1
(5.42)
and
∂w
∂t2
= ∂w
∂x
∂x
∂t2
+ ∂w
∂y
∂y
∂t2
+ ∂w
∂z
∂z
∂t2
. (5.43)
5See T AYLOR and M ANN , § 6.5 for a proof.


## Page 199

5.5 Stokes’ Theorem 191
Theorem 5.11. Let f(x, y, z) = P(x, y, z) i + Q(x, y, z) j + R(x, y, z) k be a vector ﬁeld in some
solid S, with P, Q and R continuously differentiable functions on S. Let C be a smooth
curve in S parametrized by x = x(t), y = y(t), z = z(t), a ≤ t ≤ b. Suppose that there is a
real-valued function F(x, y, z) such that ∇ F = f on S. Then
/dispvarint
C
f ···dr = F(B) − F(A) , (5.44)
where A = (x(a), y(a), z(a)) and B = (x(b), y(b), z(b)) are the endpoints of C.
Corollary 5.12. If a vector ﬁeld f has a potential in a solid S, then
/dispvaroint
C
f···dr = 0 for any closed
curve C in S (that is,
/dispvaroint
C
∇ F ···dr = 0 for any real-valued function F(x, y, z)).
Example 5.12. Let f (x, y, z) = z and let C be the curve in R3 parametrized by
x = t sin t , y = t cos t , z = t , 0 ≤ t ≤ 8π .
Evaluate
/varint
C f (x, y, z) ds. (Note: C is called a conical helix. See Figure 5.5.1).
Solution: Since x ′(t) = sin t + t cos t, y ′(t) = cos t − t sin t, and z ′(t) = 1, we have
x ′(t)2 + y ′(t)2 + z ′(t)2 = (sin2 t + 2t sin t cos t + t2 cos2 t) + (cos2 t − 2t sin t cos t + t2 sin2 t) + 1
= t2(sin2 t + cos2 t) + sin2 t + cos2 t + 1
= t2 + 2 ,
so since f (x(t), y(t), z(t)) = z(t) = t along the curve C, then
/dispvarint
C
f (x, y, z) ds =
8π/dispvarint
0
f (x(t), y(t), z(t))
√
x ′(t)2 + y ′(t)2 + z ′(t)2 dt
=
8π/dispvarint
0
t
√
t2 + 2 dt
=
(1
3 (t2 + 2)3/2
) ⏐
⏐
⏐
⏐
8π
0
= 1
3
(
(64π2 + 2)3/2 − 2
/∇adicallow
2
)
.
Example 5.13. Let f(x, y, z) = x i + y j + 2z k be a vector ﬁeld in R3. Using the same curve C
from Example 5.12, evaluate
/varint
C f ···dr.


## Page 200

192 CHAPTER 5. LINE AND SURFACE INTEGRALS
-25-20-15-10-50510152025
-25 -20 -15 -10 -5 0 5 10 15 20 25 30
0
5
10
15
20
25
30
z
t = 0
t = 8π
x
y
z
Figure 5.5.1 Conical helix C
Solution: Note that F(x, y, z) = x2
2 + y2
2 + z2 is a potential for f(x, y, z) (that is, ∇ F = f). So by
Theorem 5.11 we know that
/dispvarint
C
f ···dr = F(B) − F(A) , where A = (x(0), y(0), z(0)) and B = (x(8π), y(8π), z(8π)), so
= F(8π sin 8π, 8π cos 8π, 8π) − F(0 sin 0, 0 cos 0, 0)
= F(0, 8π, 8π) − F(0, 0, 0)
= 0 + (8π)2
2 + (8π)2 − (0 + 0 + 0) = 96π2 .
We will now discuss a generalization of Green’s Theorem in R2 to orientable surfaces in
R3, called Stokes’ Theorem . A surface Σ in R3 is orientable if there is a continuous vector
ﬁeld N in R3 such that N is nonzero and normal to Σ (that is, perpendicular to the tangent
plane) at each point of Σ. We say that such an N is a normal vector ﬁeld .


## Page 201

5.5 Stokes’ Theorem 193
y
z
x
0
N
− N
Figure 5.5.2
For example, the unit sphere x2 + y2+ z2 = 1 is orientable, since the
continuous vector ﬁeld N(x, y, z) = x i+ y j+ z k is nonzero and normal
to the sphere at each point. In fact, − N(x, y, z) is another normal
vector ﬁeld (see Figure 4.5.2). We see in this case that N(x, y, z) is
what we have called an outward normal vector , and − N(x, y, z) is an
inward normal vector . These “outward” and “inward” normal vector
ﬁelds on the sphere correspond to an “outer” and “inner” side, res pec-
tively , of the sphere. That is, we say that the sphere is a two-sided
surface. Roughly , “two-sided” means “orientable”. Other examples of
two-sided, and hence orientable, surfaces are cylinders, parabo loids,
ellipsoids, and planes.
Y ou may be wondering what kind of surface would not have two sides. An example is the
Möbius strip , which is constructed by taking a thin rectangle and connecti ng its ends at
the opposite corners, resulting in a “twisted” strip (see Figure 5.5.3).
A
B A
B
− →
(a) Connect A to A and B to B along the ends
A
→
A
→
(b) Not orientable
Figure 5.5.3 Möbius strip
If you imagine walking along a line down the center of the Möbius strip, as in Figure
5.5.3(b), then you arrive back at the same place from which you s tarted but upside down!
That is, your orientation changed even though your motion was continuous along that ce nter
line. Informally , thinking of your vertical direction as a no rmal vector ﬁeld along the strip,
there is a discontinuity at your starting point (and, in fact, at every point) since your vertical
direction takes two different values there. The Möbius strip ha s only one side, and hence is
nonorientable.6
For an orientable surface Σ which has a boundary curve C, pick a unit normal vector n
such that if you walked along C with your head pointing in the direction of n, then the
surface would be on your left. We say in this situation that n is a positive unit normal vector
and that C is traversed n-positively. We can now state Stokes’ Theorem:
6For further discussion of orientability , see O’N EILL , § IV .7.


## Page 202

194 CHAPTER 5. LINE AND SURFACE INTEGRALS
Theorem 5.13. (Stokes’ Theorem ) Let Σ be an orientable surface in R3 whose boundary
is a simple closed curve C, and let f(x, y, z) = P(x, y, z)i + Q(x, y, z)j + R(x, y, z)k be a smooth
vector ﬁeld deﬁned on some subset of R3 that contains Σ. Then
/dispvaroint
C
f ···dr =
/dispiint
Σ
(curl f) ···n dσ , (5.45)
where
curl f =
(∂R
∂y − ∂Q
∂z
)
i +
(∂P
∂z − ∂R
∂x
)
j +
(∂Q
∂x − ∂P
∂y
)
k , (5.46)
n is a positive unit normal vector over Σ, and C is traversed n-positively .
Proof: As the general case is beyond the scope of this text, we will prove t he theorem only
for the special case where Σ is the graph of z = z(x, y) for some smooth real-valued function
z(x, y), with ( x, y) varying over a region D in R2.
y
z
x
0
n
(x, y)D
CD
C
Σ : z = z(x, y)
Figure 5.5.4
Projecting Σ onto the x y-plane, we see that the closed
curve C (the boundary curve of Σ) projects onto a closed
curve CD which is the boundary curve of D (see Fig-
ure 4.5.4). Assuming that C has a smooth parametriza-
tion, its projection CD in the x y-plane also has a smooth
parametrization, say
CD : x = x(t) , y = y(t) , a ≤ t ≤ b ,
and so C can be parametrized (in R3) as
C : x = x(t) , y = y(t) , z = z(x(t), y(t)) , a ≤ t ≤ b ,
since the curve C is part of the surface z = z(x, y). Now , by the Chain Rule (Theorem 3.3),
for z = z(x(t), y(t)) as a function of t, we know that
z ′(t) = ∂z
∂x x ′(t) + ∂z
∂y y ′(t) ,
and so
/dispvaroint
C
f ···dr =
/dispvarint
C
P(x, y, z) dx + Q(x, y, z) d y+ R(x, y, z) d z
=
b/dispvarint
a
(
P x ′(t) + Q y ′(t) + R
(∂z
∂x x ′(t) + ∂z
∂y y ′(t)
))
dt
=
b/dispvarint
a
((
P + R ∂z
∂x
)
x ′(t) +
(
Q + R ∂z
∂y
)
y ′(t)
)
dt
=
/dispvarint
CD
˜P(x, y) dx + ˜Q(x, y) d y ,


## Page 203

5.5 Stokes’ Theorem 195
where
˜P(x, y) = P(x, y, z(x, y)) + R(x, y, z(x, y)) ∂z
∂x (x, y) , and
˜Q(x, y) = Q(x, y, z(x, y)) + R(x, y, z(x, y)) ∂z
∂y (x, y)
for ( x, y) in D. Thus, by Green’s Theorem applied to the region D, we have
/dispvaroint
C
f ···dr =
/dispiint
D
(∂ ˜Q
∂x − ∂ ˜P
∂y
)
d A . (5.47)
Thus,
∂ ˜Q
∂x = ∂
∂x
(
Q(x, y, z(x, y)) + R(x, y, z(x, y)) ∂z
∂y (x, y)
)
, so by the Product Rule we get
= ∂
∂x (Q(x, y, z(x, y))) +
( ∂
∂x R(x, y, z(x, y))
) ∂z
∂y (x, y) + R(x, y, z(x, y)) ∂
∂x
( ∂z
∂y (x, y)
)
.
Now , by formula (5.42) in Theorem 5.10, we have
∂
∂x (Q(x, y, z(x, y))) = ∂Q
∂x
∂x
∂x + ∂Q
∂y
∂y
∂x + ∂Q
∂z
∂z
∂x
= ∂Q
∂x ·1 + ∂Q
∂y ·0 + ∂Q
∂z
∂z
∂x
= ∂Q
∂x + ∂Q
∂z
∂z
∂x .
Similarly ,
∂
∂x (R(x, y, z(x, y))) = ∂R
∂x + ∂R
∂z
∂z
∂x .
Thus,
∂ ˜Q
∂x = ∂Q
∂x + ∂Q
∂z
∂z
∂x +
(∂R
∂x + ∂R
∂z
∂z
∂x
) ∂z
∂y + R(x, y, z(x, y)) ∂2 z
∂x ∂y
= ∂Q
∂x + ∂Q
∂z
∂z
∂x + ∂R
∂x
∂z
∂y + ∂R
∂z
∂z
∂x
∂z
∂y + R ∂2 z
∂x ∂y .
In a similar fashion, we can calculate
∂ ˜P
∂y = ∂P
∂y + ∂P
∂z
∂z
∂y + ∂R
∂y
∂z
∂x + ∂R
∂z
∂z
∂y
∂z
∂x + R ∂2 z
∂y ∂x .
So subtracting gives
∂ ˜Q
∂x − ∂ ˜P
∂y =
(∂Q
∂z − ∂R
∂y
) ∂z
∂x +
(∂R
∂x − ∂P
∂z
) ∂z
∂y +
(∂Q
∂x − ∂P
∂y
)
(5.48)


## Page 204

196 CHAPTER 5. LINE AND SURFACE INTEGRALS
since ∂2 z
∂x ∂y = ∂2 z
∂y ∂x by the smoothness of z = z(x, y). Hence, by equation (5.47),
/dispvaroint
C
f ···dr =
/dispiint
D
(
−
(∂R
∂y − ∂Q
∂z
) ∂z
∂x −
(∂P
∂z − ∂R
∂x
) ∂z
∂y +
(∂Q
∂x − ∂P
∂y
))
d A (5.49)
after factoring out a − 1 from the terms in the ﬁrst two products in equation (5.48).
Now , recall from Section 2.3 (see p.76) that the vector N = − ∂z
∂x i − ∂z
∂y j + k is normal to the
tangent plane to the surface z = z(x, y) at each point of Σ. Thus,
n = N
N

 =
− ∂z
∂x i − ∂z
∂y j + k
√
1 +
(∂z
∂x
)2
+
(
∂z
∂y
)2
is, in fact, a positive unit normal vector to Σ (see Figure 4.5.4). Hence, using the
parametrization r(x, y) = x i + y j + z(x, y) k, for ( x, y) in D, of the surface Σ, we have
∂r
∂x = i + ∂z
∂x k and ∂r
∂y = j + ∂z
∂y k, and so

 ∂r
∂x ××× ∂r
∂y

 =
√
1 +
(∂z
∂x
)2
+
(
∂z
∂y
)2
. So we see that us-
ing formula (5.46) for curl f, we have
/dispiint
Σ
(curl f) ···n dσ =
/dispiint
D
(curl f) ···n




∂r
∂x ××× ∂r
∂y



 d A
=
/dispiint
D
((∂R
∂y − ∂Q
∂z
)
i +
(∂P
∂z − ∂R
∂x
)
j +
(∂Q
∂x − ∂P
∂y
)
k
)
···
(
− ∂z
∂x i − ∂z
∂y j + k
)
d A
=
/dispiint
D
(
−
(∂R
∂y − ∂Q
∂z
) ∂z
∂x −
(∂P
∂z − ∂R
∂x
) ∂z
∂y +
(∂Q
∂x − ∂P
∂y
))
d A ,
which, upon comparing to equation (5.49), proves the Theorem.
QED
Note: The condition in Stokes’ Theorem that the surface Σ have a (continuously vary-
ing) positive unit normal vector n and a boundary curve C traversed n-positively can be
expressed more precisely as follows: if r(t) is the position vector for C and T(t) = r ′(t)/∥r ′(t)∥
is the unit tangent vector to C, then the vectors T, n, T ××× n form a right-handed system.
Also, it should be noted that Stokes’ Theorem holds even when th e boundary curve C is
piecewise smooth.
Example 5.14. Verify Stokes’ Theorem for f(x, y, z) = z i + x j + y k when Σ is the paraboloid
z = x2 + y2 such that z ≤ 1 (see Figure 4.5.5).


## Page 205

5.5 Stokes’ Theorem 197
y
z
x
0
n
C
Σ
1
Figure 5.5.5 z = x2 + y2
Solution: The positive unit normal vector to the surface
z = z(x, y) = x2 + y2 is
n =
− ∂z
∂x i − ∂z
∂y j + k
√
1 +
(∂z
∂x
)2
+
(
∂z
∂y
)2
= − 2x i − 2y j + k√
1 + 4x2 + 4y2
,
and curl f = (1 − 0) i + (1 − 0) j + (1 − 0) k = i + j + k, so
(curl f) ···n = (− 2x − 2y + 1)/
√
1 + 4x2 + 4y2 .
Since Σ can be parametrized as r(x, y) = x i + y j + (x2 + y2) k for
(x, y) in the region D = { (x, y) : x2 + y2 ≤ 1 }, then
/dispiint
Σ
(curl f) ···n dσ =
/dispiint
D
(curl f) ···n




∂r
∂x ××× ∂r
∂y



 d A
=
/dispiint
D
− 2x − 2y + 1
√
1 + 4x2 + 4y2
√
1 + 4x2 + 4y2 d A
=
/dispiint
D
(− 2x − 2y + 1) d A , so switching to polar coordinates gives
=
2π/dispvarint
0
1/dispvarint
0
(− 2r cos θ − 2r sin θ + 1)r dr dθ
=
2π/dispvarint
0
1/dispvarint
0
(− 2r2 cos θ − 2r2 sin θ + r) dr dθ
=
2π/dispvarint
0
(
− 2r3
3 cos θ − 2r3
3 sin θ + r2
2
⏐
⏐
⏐
r= 1
r= 0
)
dθ
=
2π/dispvarint
0
(
− 2
3 cos θ − 2
3 sin θ + 1
2
)
dθ
= − 2
3 sin θ + 2
3 cos θ + 1
2 θ
⏐
⏐
⏐
2π
0
= π .
The boundary curve C is the unit circle x2 + y2 = 1 laying in the plane z = 1 (see Figure


## Page 206

198 CHAPTER 5. LINE AND SURFACE INTEGRALS
4.5.5), which can be parametrized as x = cos t, y = sin t, z = 1 for 0 ≤ t ≤ 2π. So
/dispvaroint
C
f ···dr =
2π/dispvarint
0
((1)(− sin t) + (cos t)(cos t) + (sin t)(0)) dt
=
2π/dispvarint
0
(
− sin t + 1 + cos 2t
2
)
dt
(
here we used cos 2 t = 1 + cos 2t
2
)
= cos t + t
2 + sin 2t
4
⏐
⏐
⏐
2π
0
= π .
So we see that /dispvaroint
C
f ···dr =
/dispiint
Σ
(curl f ) ···n dσ,
as predicted by Stokes’ Theorem.
The line integral in the preceding example was far simpler to calc ulate than the surface
integral, but this will not always be the case.
Example 5.15. Let Σ be the elliptic paraboloid z = x2
4 + y2
9 for z ≤ 1, and let C be its boundary
curve. Calculate
/varoint
C f ···dr for f(x, y, z) = (9xz + 2y)i + (2x + y2)j + (− 2y2 + 2z)k, where C is
traversed counterclockwise.
Solution: The surface is similar to the one in Example 5.14, except now the boundary curve C
is the ellipse x2
4 + y2
9 = 1 laying in the plane z = 1. In this case, using Stokes’ Theorem is easier
than computing the line integral directly . As in Example 5.14, a t each point ( x, y, z(x, y)) on
the surface z = z(x, y) = x2
4 + y2
9 the vector
n =
− ∂z
∂x i − ∂z
∂y j + k
√
1 +
(∂z
∂x
)2
+
(
∂z
∂y
)2
=
− x
2 i − 2y
9 j + k
√
1 + x2
4 + 4y2
9
,
is a positive unit normal vector to Σ. And calculating the curl of f gives
curl f = (− 4y − 0)i + (9x − 0)j + (2 − 2)k = − 4y i + 9x j + 0 k ,
so
(curl f) ···n =
(− 4y)(− x
2 ) + (9x)(− 2y
9 ) + (0)(1)
√
1 + x2
4 + 4y2
9
= 2x y− 2x y+ 0√
1 + x2
4 + 4y2
9
= 0 ,
and so by Stokes’ Theorem
/dispvaroint
C
f ···dr =
/dispiint
Σ
(curl f) ···n dσ =
/dispiint
Σ
0 dσ = 0 .
In physical applications, for a simple closed curve C the line integral
/varoint
C f···dr is often called
the circulation of f around C. For example, if E represents the electrostatic ﬁeld due to a
point charge, then it turns out 7 that curl E = 0, which means that the circulation
/varoint
C E···dr = 0
7See Ch. 2 in R EITZ , M ILFORD and C HRISTY .


## Page 207

5.5 Stokes’ Theorem 199
by Stokes’ Theorem. Vector ﬁelds which have zero curl are often called irrotational ﬁelds.
In fact, the term curl was created by the 19 th century Scottish physicist James Clerk
Maxwell in his study of electromagnetism, where it is used exten sively . In physics, the
curl is interpreted as a measure of circulation density . This is best seen by using another
deﬁnition of curl f which is equivalent 8 to the deﬁnition given by formula (5.46). Namely , the
value of n ···(curl f) at a point ( x, y, z), is
lim
S→ 0
1
S
/dispvaroint
C
f ···dr, (5.50)
where S is the surface area of a surface Σ containing the point ( x, y, z) and with a simple
closed boundary curve C and positive unit normal vector n at ( x, y, z). In the limit, think of
the curve C shrinking to the point ( x, y, z), which causes Σ, the surface it bounds, to have
smaller and smaller surface area. That ratio of circulation to surface area in the limit is
what makes the curl a rough measure of circulation density (tha t is, circulation per unit
area).
x
y
0
f
Figure 5.5.6 Curl and rotation
An idea of how the curl of a vector ﬁeld is
related to rotation is shown in Figure 4.5.6.
Suppose we have a vector ﬁeld f(x, y, z) which
is always parallel to the x y-plane at each
point (x, y, z) and that the vectors grow larger
the further the point ( x, y, z) is from the y-
axis. For example, f(x, y, z) = (1 + x2) j. Think
of the vector ﬁeld as representing the ﬂow
of water , and imagine dropping two wheels
with paddles into that water ﬂow , as in Fig-
ure 4.5.6. Since the ﬂow is stronger (that
is, the magnitude of f is larger) as you move
away from the y-axis, then such a wheel would
rotate counterclockwise if it were dropped to
the right of the y-axis, and it would rotate
clockwise if it were dropped to the left of the y-axis. In both cases the curl would be nonzero
(curl f(x, y, z) = 2x k in our example) and would obey the right-hand rule; that is, cur l f(x, y, z)
points in the direction of your thumb as you cup your right hand i n the direction of the rota-
tion of the wheel. So the curl points outward (in the positive z-direction) if x > 0 and points
inward (in the negative z-direction) if x < 0. Notice that if all the vectors had the same di-
rection and the same magnitude, then the wheels would not rotate and hence th ere would
be no curl (which is why such ﬁelds are called irrotational, mean ing no rotation).
Finally , by Stokes’ Theorem, we know that if C is a simple closed curve in some solid region
8See S CHEY , p. 78–81, for the derivation.


## Page 208

200 CHAPTER 5. LINE AND SURFACE INTEGRALS
S in R3 and if f(x, y, z) is a smooth vector ﬁeld such that curl f = 0 in S, then
/dispvaroint
C
f ···dr =
/dispiint
Σ
(curl f) ···n dσ =
/dispiint
Σ
0 ···n dσ =
/dispiint
Σ
0 dσ = 0 ,
where Σ is any orientable surface inside S whose boundary is C (such a surface is some-
times called a capping surface for C). So similar to the two-variable case, we have a three-
dimensional version of a result from Section 4.3, for solid re gions in R3 which are simply
connected (that is, regions having no holes):
The following statements are equivalent for a simply connecte d solid region S in R3:
(a) f(x, y, z) = P(x, y, z) i + Q(x, y, z) j + R(x, y, z) k has a smooth potential F(x, y, z) in S;
(b)
/dispvarint
C
f ···dr is independent of the path for any curve C in S;
(c)
/dispvaroint
C
f ···dr = 0 for every simple closed curve C in S;
(d) ∂R
∂y = ∂Q
∂z , ∂P
∂z = ∂R
∂x , and ∂Q
∂x = ∂P
∂y in S (that is, curl f = 0 in S).
Part (d) is also a way of saying that the differential form P dx + Q d y+ R d z is exact.
Example 5.16. Determine if the vector ﬁeld f(x, y, z) = x yzi+ xz j+ x yk has a potential in R3.
Solution: Since R3 is simply connected, we just need to check whether curl f = 0 throughout
R3, that is,
∂R
∂y = ∂Q
∂z , ∂P
∂z = ∂R
∂x , and ∂Q
∂x = ∂P
∂y
throughout R3, where P(x, y, z) = x yz, Q(x, y, z) = xz, and R(x, y, z) = x y. But we see that
∂P
∂z = x y , ∂R
∂x = y ⇒ ∂P
∂z ̸= ∂R
∂x for some ( x, y, z) in R3.
Thus, f(x, y, z) does not have a potential in R3.
Exercises
A
For Exercises 1–3, calculate
/varint
C f (x, y, z) ds for the given function f (x, y, z) and curve C.
1. f (x, y, z) = z; C : x = cos t, y = sin t, z = t, 0 ≤ t ≤ 2π
2. f (x, y, z) = x
y + y + 2yz; C : x = t2, y = t, z = 1, 1 ≤ t ≤ 2


## Page 209

5.5 Stokes’ Theorem 201
3. f (x, y, z) = z2; C : x = t sin t, y = t cos t, z = 2
/∇adicallow
2
3 t3/2, 0 ≤ t ≤ 1
For Exercises 4–9, calculate
/varint
C f ···dr for the given vector ﬁeld f(x, y, z) and curve C.
4. f (x, y, z) = i − j + k; C : x = 3t, y = 2t, z = t, 0 ≤ t ≤ 1
5. f (x, y, z) = y i − x j + z k; C : x = cos t, y = sin t, z = t, 0 ≤ t ≤ 2π
6. f (x, y, z) = x i + y j + z k; C : x = cos t, y = sin t, z = 2, 0 ≤ t ≤ 2π
7. f (x, y, z) = (y − 2z) i + x yj + (2xz + y) k; C : x = t, y = 2t, z = t2 − 1, 0 ≤ t ≤ 1
8. f (x, y, z) = yz i + xz j + x yk; C : the polygonal path from (0 , 0, 0) to (1 , 0, 0) to (1 , 2, 0)
9. f (x, y, z) = x yi + (z − x) j + 2yz k; C : the polygonal path from (0 , 0, 0) to (1 , 0, 0) to (1 , 2, 0)
to (1, 2, − 2)
For Exercises 10–13, state whether or not the vector ﬁeld f(x, y, z) has a potential in R3 (you
do not need to ﬁnd the potential itself).
10. f (x, y, z) = y i − x j + z k 11. f (x, y, z) = a i + b j + c k (a, b, c constant)
12. f (x, y, z) = (x + y) i + x j + z2 k 13. f (x, y, z) = x yi − (x − yz2) j + y2 z k
B
For Exercises 14–15, verify Stokes’ Theorem for the given ve ctor ﬁeld f(x, y, z) and surface Σ.
14. f (x, y, z) = 2y i − x j + z k; Σ : x2 + y2 + z2 = 1, z ≥ 0
15. f (x, y, z) = x yi + xz j + yz k; Σ : z = x2 + y2, z ≤ 1
16. Construct a Möbius strip from a piece of paper , then draw a line down i ts center (like
the dotted line in Figure 5.5.3(b)). Cut the Möbius strip alon g that center line completely
around the strip. How many surfaces does this result in? How would you describe them?
Are they orientable?
C
17. Let Σ be a closed surface and f(x, y, z) a smooth vector ﬁeld. Show that/iint
Σ
(curl f) ···n dσ = 0. ( Hint: Split Σ in half.)
18. Show that Green’s Theorem is a special case of Stokes’ Theorem.


## Page 210

202 CHAPTER 5. LINE AND SURFACE INTEGRALS
5.6 Gradient, Divergence, Curl and Laplacian
In this ﬁnal section we will establish some relationships betwee n the gradient, divergence
and curl, and we will also introduce a new quantity called the Laplacian. We will then show
how to write these quantities in cylindrical and spherical coor dinates.
For a real-valued function f (x, y, z) on R3, the gradient ∇ f (x, y, z) is a vector-valued func-
tion on R3, that is, its value at a point ( x, y, z) is the vector
∇ f (x, y, z) =
(∂f
∂x , ∂f
∂y , ∂f
∂z
)
= ∂f
∂x i + ∂f
∂y j + ∂f
∂z k
in R3, where each of the partial derivatives is evaluated at the point ( x, y, z). So in this way ,
you can think of the symbol ∇ as being “applied” to a real-valued function f to produce a
vector ∇ f .
It turns out that the divergence and curl can also be expressed i n terms of the symbol ∇ .
This is done by thinking of ∇ as a vector in R3, namely
∇ = ∂
∂x i + ∂
∂y j + ∂
∂z k . (5.51)
Here, the symbols ∂
∂x , ∂
∂y and ∂
∂z are to be thought of as “partial derivative operators” that
will get “applied” to a real-valued function, say f (x, y, z), to produce the partial derivatives
∂f
∂x , ∂f
∂y and ∂f
∂z . For instance, ∂
∂x “applied” to f (x, y, z) produces ∂f
∂x .
Is ∇ really a vector? Strictly speaking, no, since ∂
∂x , ∂
∂y and ∂
∂z are not actual numbers. But
it helps to think of ∇ as a vector , especially with the divergence and curl, as we will soo n see.
The process of “applying” ∂
∂x , ∂
∂y , ∂
∂z to a real-valued function f (x, y, z) is normally thought of
as multiplying the quantities:
( ∂
∂x
)
( f ) = ∂f
∂x ,
( ∂
∂y
)
( f ) = ∂f
∂y ,
( ∂
∂z
)
( f ) = ∂f
∂z
For this reason, ∇ is often referred to as the “del operator”, since it “operates” o n functions.
For example, it is often convenient to write the divergence div f as ∇ ···f, since for a vector
ﬁeld f(x, y, z) = f1(x, y, z)i + f2(x, y, z)j + f3(x, y, z)k, the dot product of f with ∇ (thought of as a
vector) makes sense:
∇ ···f =
( ∂
∂x i + ∂
∂y j + ∂
∂z k
)
···( f1(x, y, z)i + f2(x, y, z)j + f3(x, y, z)k)
=
( ∂
∂x
)
( f1) +
( ∂
∂y
)
( f2) +
( ∂
∂z
)
( f3)
= ∂f1
∂x + ∂f2
∂y + ∂f3
∂z
= div f


## Page 211

5.6 Gradient, Divergence, Curl and Laplacian 203
We can also write curl f in terms of ∇ , namely as ∇ ××× f, since for a vector ﬁeld f(x, y, z) =
P(x, y, z)i + Q(x, y, z)j + R(x, y, z)k, we have:
∇ ××× f =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
i j k
∂
∂x
∂
∂y
∂
∂z
P(x, y, z) Q(x, y, z) R(x, y, z)
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
=
(∂R
∂y − ∂Q
∂z
)
i −
(∂R
∂x − ∂P
∂z
)
j +
(∂Q
∂x − ∂P
∂y
)
k
=
(∂R
∂y − ∂Q
∂z
)
i +
(∂P
∂z − ∂R
∂x
)
j +
(∂Q
∂x − ∂P
∂y
)
k
= curl f
For a real-valued function f (x, y, z), the gradient ∇ f (x, y, z) = ∂f
∂x i + ∂f
∂y j + ∂f
∂z k is a vector
ﬁeld, so we can take its divergence:
div ∇ f = ∇ · ·· ∇f
=
( ∂
∂x i + ∂
∂y j + ∂
∂z k
)
···
(∂f
∂x i + ∂f
∂y j + ∂f
∂z k
)
= ∂
∂x
(∂f
∂x
)
+ ∂
∂y
(∂f
∂y
)
+ ∂
∂z
(∂f
∂z
)
= ∂2 f
∂x2 + ∂2 f
∂y2 + ∂2 f
∂z2
Note that this is a real-valued function, to which we will give a s pecial name:
Deﬁnition 5.7. For a real-valued function f (x, y, z), the Laplacian of f , denoted by ∆ f , is
given by
∆ f (x, y, z) = ∇ · ·· ∇f = ∂2 f
∂x2 + ∂2 f
∂y2 + ∂2 f
∂z2 . (5.52)
Example 5.17. Let r(x, y, z) = x i+ y j+ z k be the position vector ﬁeld on R3. Then ∥r(x, y, z)∥2 =
r ···r = x2 + y2 + z2 is a real-valued function. Find
(a) the gradient of ∥r∥2
(b) the divergence of r
(c) the curl of r
(d) the Laplacian of ∥r∥2


## Page 212

204 CHAPTER 5. LINE AND SURFACE INTEGRALS
Solution: (a) ∇∥ r∥2 = 2x i + 2y j + 2z k = 2 r
(b) ∇ ···r = ∂
∂x (x) + ∂
∂y (y) + ∂
∂z (z) = 1 + 1 + 1 = 3
(c)
∇ ××× r =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
i j k
∂
∂x
∂
∂y
∂
∂z
x y z
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
= (0 − 0) i − (0 − 0) j + (0 − 0) k = 0
(d) ∆∥r∥2 = ∂2
∂x2 (x2 + y2 + z2) + ∂2
∂y2 (x2 + y2 + z2) + ∂2
∂z2 (x2 + y2 + z2) = 2 + 2 + 2 = 6
Note that we could have calculated ∆∥r∥2 another way , using the∇ notation along with parts
(a) and (b):
∆∥r∥2 = ∇ · ·· ∇∥r∥2 = ∇ · ··2 r = 2 ∇ ···r = 2(3) = 6
Notice that in Example 5.17 if we take the curl of the gradient of ∥r∥2 we get
∇ ××× (∇∥ r∥2) = ∇ × ×× 2 r = 2 ∇ ××× r = 2 0 = 0 .
The following theorem shows that this will be the case in general :
Theorem 5.14. For any smooth real-valued function f (x, y, z), ∇ ××× (∇ f ) = 0.
Proof: We see by the smoothness of f that
∇ ××× (∇ f ) =
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
i j k
∂
∂x
∂
∂y
∂
∂z
∂f
∂x
∂f
∂y
∂f
∂z
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
⏐
=
( ∂2 f
∂y ∂z − ∂2 f
∂z ∂y
)
i −
( ∂2 f
∂x ∂z − ∂2 f
∂z ∂x
)
j +
( ∂2 f
∂x ∂y − ∂2 f
∂y ∂x
)
k = 0 ,
since the mixed partial derivatives in each component are equal . QED
Corollary 5.15. If a vector ﬁeld f(x, y, z) has a potential, then curl f = 0.
Another way of stating Theorem 5.14 is that gradients are irro tational. Also, notice that
in Example 5.17 if we take the divergence of the curl of r we trivially get
∇ ···(∇ ××× r) = ∇ · ··0 = 0 .
The following theorem shows that this will be the case in general :


## Page 213

5.6 Gradient, Divergence, Curl and Laplacian 205
Theorem 5.16. For any smooth vector ﬁeld f(x, y, z), ∇ ···(∇ ××× f) = 0.
The proof is straightforward and left as an exercise for the re ader .
Corollary 5.17. The ﬂux of the curl of a smooth vector ﬁeld f(x, y, z) through any closed
surface is zero.
Proof: Let Σ be a closed surface which bounds a solid S. The ﬂux of ∇ ××× f through Σ is
/dispiint
Σ
(∇ ××× f ) ···dσ =
/dispiiint
S
∇ ···(∇ ××× f ) dV (by the Divergence Theorem)
=
/dispiiint
S
0 dV (by Theorem 5.16)
= 0 . QED
There is another method for proving Theorem 5.14 which can be us eful, and is often used
in physics. Namely , if the surface integral
/iint
Σ
f (x, y, z) dσ = 0 for all surfaces Σ in some solid
region (usually all of R3), then we must have f (x, y, z) = 0 throughout that region. The proof
is not trivial, and physicists do not usually bother to prove it. But the result is true, and can
also be applied to double and triple integrals.
For instance, to prove Theorem 5.14, assume that f (x, y, z) is a smooth real-valued function
on R3. Let C be a simple closed curve in R3 and let Σ be any capping surface for C (that is, Σ
is orientable and its boundary is C). Since ∇ f is a vector ﬁeld, then
/dispiint
Σ
(∇ ××× (∇ f )) ···n dσ =
/dispvaroint
C
∇ f ···dr by Stokes’ Theorem, so
= 0 by Corollary 5.12.
Since the choice of Σ was arbitrary , then we must have (∇××× (∇ f ))···n = 0 throughout R3, where
n is any unit vector . Using i, j and k in place of n, we see that we must have ∇ ××× (∇ f ) = 0 in
R3, which completes the proof.
Example 5.18. A system of electric charges has a charge density ρ(x, y, z) and produces an
electrostatic ﬁeld E(x, y, z) at points ( x, y, z) in space. Gauss’ Law states that
/dispiint
Σ
E ···dσ = 4π
/dispiiint
S
ρ dV
for any closed surface Σ which encloses the charges, with S being the solid region enclosed
by Σ. Show that ∇ ···E = 4πρ. This is one of Maxwell’s Equations .9
9In Gaussian (or CGS) units.


## Page 214

206 CHAPTER 5. LINE AND SURFACE INTEGRALS
Solution: By the Divergence Theorem and Gauss’ Law , we have
/dispiiint
S
∇ ···E dV =
/dispiint
Σ
E ···dσ
= 4π
/dispiiint
S
ρ dV .
Combining the integrals gives
/dispiiint
S
(∇ ···E − 4πρ) dV = 0 .
Since Σ and hence S was arbitrary , we get ∇ ···E = 4πρ.
Exercises
A
For Exercises 1–6, ﬁnd the Laplacian of the function f (x, y, z).
1. f (x, y, z) = x + y + z 2. f (x, y, z) = x5 3. f (x, y, z) = (x2 + y2 + z2)3/2
4. f (x, y, z) = ex+ y+ z 5. f (x, y, z) = x3 + y3 + z3 6. f (x, y, z) = e− x2− y2− z2
B
For Exercises 7–18, prove the given formula ( r = ∥ r∥ is the length of the position vector ﬁeld
r(x, y, z) = x i + y j + z k).
7. ∇ (1/r) = − r/r3 8. ∆ (1/r) = 0 9. ∇ ···(r/r3) = 0 10. ∇ (ln r) = r/r2
11. div(f + g) = div f + div g 12. curl(f + g) = curl f + curl g
13. div( f g) = f div g + g ··· ∇f 14. div(f ××× g) = g ···curl f − f ···curl g
15. div(∇ f ××× ∇ g) = 0 16. curl( f g) = f curl g + (∇ f ) ××× g
17. curl(curl f) = ∇ (div f) − ∆ f 18. ∆ ( f g) = f ∆ g + g ∆ f + 2(∇ f ··· ∇g)
C
19. Prove Theorem 5.16.
20. Use f = u ∇ v in the Divergence Theorem to prove:
(a) Green’s ﬁrst identity:
/dispiiint
S
(u ∆ v + (∇ u) ···(∇ v)) dV =
/dispiint
Σ
(u ∇ v) ···dσ
(b) Green’s second identity:
/dispiiint
S
(u ∆ v − v ∆ u) dV =
/dispiint
Σ
(u ∇ v − v ∇ u) ···dσ


## Page 215

5.7 Other coordinate systems 207
21. Suppose that ∆ u = 0 (that is, u is harmonic) over R3. Show that
/dispiint
Σ
∇ u ·dσ = 0
for any closed surface Σ.
5.7 Other coordinate systems
Often (especially in physics) it is convenient to use other coor dinate systems when dealing
with quantities such as the gradient, divergence, curl and Lapla cian. We will present the
formulas for these in cylindrical and spherical coordinates.
Recall from Section 1.7 that a point ( x, y, z) can be represented in cylindrical coordinates
(r, θ, z), where x = r cos θ, y = r sin θ, z = z. At each point ( r, θ, z), let er, eθ, ez be unit vectors
in the direction of increasing r, θ, z, respectively (see Figure 5.7.1). Then er, eθ, ez form an
orthonormal set of vectors. Note, by the right-hand rule, th at ez ××× er = eθ.
x
y
z
0
(x, y, z)
(x, y, 0)
θx
y
z
r
er
eθ
ez
Figure 5.7.1
Orthonormal vectors er, eθ, ez
in cylindrical coordinates
x
y
z
0
(x, y, z)
(x, y, 0)
θx
y
zρφ
eρ
eθ
eφ
Figure 5.7.2
Orthonormal vectors eρ, eθ, eφ
in spherical coordinates
Similarly , a point ( x, y, z) can be represented in spherical coordinates ( ρ, θ, φ), where x =
ρ sin φ cos θ, y = ρ sin φ sin θ, z = ρ cos φ. At each point ( ρ, θ, φ), let eρ, eθ, eφ be unit vectors
in the direction of increasing ρ, θ, φ, respectively (see Figure 5.7.2). Then the vectors eρ, eθ,
eφ are orthonormal. By the right-hand rule, we see that eθ ××× eρ = eφ .
We can now summarize the expressions for the gradient, divergen ce, curl and Laplacian
in Cartesian, cylindrical and spherical coordinates in the fol lowing tables:


## Page 216

208 CHAPTER 5. LINE AND SURFACE INTEGRALS
Cartesian (x, y, z): Scalar function F; Vector ﬁeld f = f1 i + f2 j + f3 k
gradient : ∇ F = ∂F
∂x i + ∂F
∂y j + ∂F
∂z k
divergence : ∇ ···f = ∂f1
∂x + ∂f2
∂y + ∂f3
∂z
curl : ∇ ××× f =
(∂f3
∂y − ∂f2
∂z
)
i +
(∂f1
∂z − ∂f3
∂x
)
j +
(∂f2
∂x − ∂f1
∂y
)
k
Laplacian : ∆ F = ∂2F
∂x2 + ∂2F
∂y2 + ∂2F
∂z2
Cylindrical (r, θ, z): Scalar function F; Vector ﬁeld f = f r er + fθ eθ + f z ez
gradient : ∇ F = ∂F
∂r er + 1
r
∂F
∂θ eθ + ∂F
∂z ez
divergence : ∇ ···f = 1
r
∂
∂r (r fr) + 1
r
∂fθ
∂θ + ∂f z
∂z
curl : ∇ ××× f =
(1
r
∂f z
∂θ − ∂fθ
∂z
)
er +
(∂f r
∂z − ∂f z
∂r
)
eθ + 1
r
( ∂
∂r (r fθ) − ∂f r
∂θ
)
ez
Laplacian : ∆ F = 1
r
∂
∂r
(
r ∂F
∂r
)
+ 1
r2
∂2F
∂θ2 + ∂2F
∂z2
Spherical (ρ, θ, φ): Scalar function F; Vector ﬁeld f = fρ eρ + fθ eθ + fφ eφ
gradient : ∇ F = ∂F
∂ρ eρ + 1
ρ sin φ
∂F
∂θ eθ + 1
ρ
∂F
∂φ eφ
divergence : ∇ ···f = 1
ρ2
∂
∂ρ(ρ2 fρ) + 1
ρ sin φ
∂fθ
∂θ + 1
ρ sin φ
∂
∂φ (sin φ fφ )
curl : ∇ ××× f = 1
ρ sin φ
( ∂
∂φ (sin φ fθ) −
∂fφ
∂θ
)
eρ + 1
ρ
( ∂
∂ρ(ρ fφ ) −
∂fρ
∂φ
)
eθ
+
( 1
ρ sin φ
∂fρ
∂θ − 1
ρ
∂
∂ρ(ρ fθ)
)
eφ
Laplacian : ∆ F = 1
ρ2
∂
∂ρ
(
ρ2 ∂F
∂ρ
)
+ 1
ρ2 sin2 φ
∂2F
∂θ2 + 1
ρ2 sin φ
∂
∂φ
(
sin φ ∂F
∂φ
)
The derivation of the above formulas for cylindrical and spheri cal coordinates is straight-
forward but extremely tedious. The basic idea is to take the Car tesian equivalent of the
quantity in question and to substitute into that formula usi ng the appropriate coordinate
transformation. As an example, we will derive the formula for the gradient in spherical
coordinates.


## Page 217

5.7 Other coordinate systems 209
Goal: Show that the gradient of a real-valued function F(ρ, θ, φ) in spherical coordinates is:
∇ F = ∂F
∂ρ eρ + 1
ρ sin φ
∂F
∂θ eθ + 1
ρ
∂F
∂φ eφ
Idea: In the Cartesian gradient formula ∇ F(x, y, z) = ∂F
∂x i + ∂F
∂y j + ∂F
∂z k, put the Cartesian ba-
sis vectors i, j, k in terms of the spherical coordinate basis vectors eρ, eθ, eφ and functions of
ρ, θ and φ. Then put the partial derivatives ∂F
∂x , ∂F
∂y , ∂F
∂z in terms of ∂F
∂ρ , ∂F
∂θ , ∂F
∂φ and functions
of ρ, θ and φ.
Step 1: Get formulas for eρ, eθ, eφ in terms of i, j, k.
We can see from Figure 5.7.2 that the unit vector eρ in the ρ direction at a general point
(ρ, θ, φ) is eρ = r
∥r∥ , where r = x i + y j + z k is the position vector of the point in Cartesian
coordinates. Thus,
eρ = r
∥r∥ = x i + y j + z k√
x2 + y2 + z2
,
so using x = ρ sin φ cos θ, y = ρ sin φ sin θ, z = ρ cos φ, and ρ =
√
x2 + y2 + z2, we get:
eρ = sin φ cos θi + sin φ sin θj + cos φ k
Now , since the angle θ is measured in the x y-plane, then the unit vector eθ in the θ
direction must be parallel to the x y-plane. That is, eθ is of the form a i + b j + 0 k. To ﬁgure
out what a and b are, note that since eθ ⊥ eρ, then in particular eθ ⊥ eρ when eρ is in the
x y-plane. That occurs when the angle φ is π/2. Putting φ = π/2 into the formula for eρ gives
eρ = cos θi+ sin θj+ 0 k, and we see that a vector perpendicular to that is − sin θi+ cos θj+ 0 k.
Since this vector is also a unit vector and points in the (positi ve) θ direction, it must be eθ:
eθ = − sin θi + cos θj + 0 k
Lastly , sinceeφ = eθ ××× eρ, we get:
eφ = cos φ cos θi + cos φ sin θj − sin φ k
Step 2: Use the three formulas from Step 1 to solve for i, j, k in terms of eρ, eθ, eφ .
This comes down to solving a system of three equations in three u nknowns. There are
many ways of doing this, but we will do it by combining the formulas for eρ and eφ to
eliminate k, which will give us an equation involving just i and j. This, with the formula for
eθ, will then leave us with a system of two equations in two unknowns ( i and j), which we
will use to solve ﬁrst for j then for i. Lastly , we will solve for k.
First, note that
sin φ eρ + cos φ eφ = cos θi + sin θj
so that
sin θ(sin φ eρ + cos φ eφ ) + cos θeθ = (sin2 θ + cos2 θ)j = j ,


## Page 218

210 CHAPTER 5. LINE AND SURFACE INTEGRALS
and so:
j = sin φ sin θeρ + cos θeθ + cos φ sin θeφ
Likewise, we see that
cos θ(sin φ eρ + cos φ eφ ) − sin θeθ = (cos2 θ + sin2 θ)i = i ,
and so:
i = sin φ cos θeρ − sin θeθ + cos φ cos θeφ
Lastly , we see that:
k = cos φ eρ − sin φ eφ
Step 3: Get formulas for ∂F
∂ρ , ∂F
∂θ , ∂F
∂φ in terms of ∂F
∂x , ∂F
∂y , ∂F
∂z .
By the Chain Rule, we have
∂F
∂ρ = ∂F
∂x
∂x
∂ρ + ∂F
∂y
∂y
∂ρ + ∂F
∂z
∂z
∂ρ ,
∂F
∂θ = ∂F
∂x
∂x
∂θ + ∂F
∂y
∂y
∂θ + ∂F
∂z
∂z
∂θ ,
∂F
∂φ = ∂F
∂x
∂x
∂φ + ∂F
∂y
∂y
∂φ + ∂F
∂z
∂z
∂φ ,
which yields:
∂F
∂ρ = sin φ cos θ ∂F
∂x + sin φ sin θ ∂F
∂y + cos φ ∂F
∂z
∂F
∂θ = − ρ sin φ sin θ ∂F
∂x + ρ sin φ cos θ ∂F
∂y
∂F
∂φ = ρ cos φ cos θ ∂F
∂x + ρ cos φ sin θ ∂F
∂y − ρ sin φ ∂F
∂z
Step 4: Use the three formulas from Step 3 to solve for ∂F
∂x , ∂F
∂y , ∂F
∂z in terms of ∂F
∂ρ , ∂F
∂θ , ∂F
∂φ .
Again, this involves solving a system of three equations in t hree unknowns. Using a
similar process of elimination as in Step 2, we get:
∂F
∂x = 1
ρ sin φ
(
ρ sin2 φ cos θ ∂F
∂ρ − sin θ ∂F
∂θ + sin φ cos φ cos θ ∂F
∂φ
)
∂F
∂y = 1
ρ sin φ
(
ρ sin2 φ sin θ ∂F
∂ρ + cos θ ∂F
∂θ + sin φ cos φ sin θ ∂F
∂φ
)
∂F
∂z = 1
ρ
(
ρ cos φ ∂F
∂ρ − sin φ ∂F
∂φ
)
Step 5: Substitute the formulas for i, j, k from Step 2 and the formulas for ∂F
∂x , ∂F
∂y , ∂F
∂z from
Step 4 into the Cartesian gradient formula ∇ F(x, y, z) = ∂F
∂x i + ∂F
∂y j + ∂F
∂z k.


## Page 219

5.7 Other coordinate systems 211
Doing this last step is perhaps the most tedious, since it involve s simplifying 3 × 3 + 3 × 3 +
2 × 2 = 22 terms! Namely ,
∇ F = 1
ρ sin φ
(
ρ sin2 φ cos θ ∂F
∂ρ − sin θ ∂F
∂θ + sin φ cos φ cos θ ∂F
∂φ
)
(sin φ cos θeρ − sin θeθ
+ cos φ cos θeφ )
+ 1
ρ sin φ
(
ρ sin2 φ sin θ ∂F
∂ρ + cos θ ∂F
∂θ + sin φ cos φ sin θ ∂F
∂φ
)
(sin φ sin θeρ + cos θeθ
+ cos φ sin θeφ )
+ 1
ρ
(
ρ cos φ ∂F
∂ρ − sin φ ∂F
∂φ
)
(cos φ eρ − sin φ eφ ) ,
which we see has 8 terms involving eρ, 6 terms involving eθ, and 8 terms involving eφ . But
the algebra is straightforward and yields the desired result:
∇ F = ∂F
∂ρ eρ + 1
ρ sin φ
∂F
∂θ eθ + 1
ρ
∂F
∂φ eφ ✓
Example 5.19. In Example 5.17 we showed that ∇∥ r∥2 = 2 r and ∆∥r∥2 = 6, where r(x, y, z) =
x i + y j + z k in Cartesian coordinates. Verify that we get the same answers if we switch to
spherical coordinates.
Solution: Since ∥r∥2 = x2 + y2 + z2 = ρ2 in spherical coordinates, let F(ρ, θ, φ) = ρ2 (so that
F(ρ, θ, φ) = ∥ r∥2). The gradient of F in spherical coordinates is
∇ F = ∂F
∂ρ eρ + 1
ρ sin φ
∂F
∂θ eθ + 1
ρ
∂F
∂φ eφ
= 2ρ eρ + 1
ρ sin φ (0) eθ + 1
ρ (0) eφ
= 2ρ eρ = 2ρ r
∥r∥ , as we showed earlier , so
= 2ρ r
ρ = 2 r , as expected. And the Laplacian is
∆ F = 1
ρ2
∂
∂ρ
(
ρ2 ∂F
∂ρ
)
+ 1
ρ2 sin2 φ
∂2F
∂θ2 + 1
ρ2 sin φ
∂
∂φ
(
sin φ ∂F
∂φ
)
= 1
ρ2
∂
∂ρ(ρ2 2ρ) + 1
ρ2 sin φ (0) + 1
ρ2 sin φ
∂
∂φ
(
sin φ (0)
)
= 1
ρ2
∂
∂ρ(2ρ3) + 0 + 0
= 1
ρ2 (6ρ2) = 6 , as expected.
Exercises
A


## Page 220

212 CHAPTER 5. LINE AND SURFACE INTEGRALS
1. Let f (x, y, z) = (x2 + y2 + z2)3/2 in Cartesian coordinates. Find the Laplacian of f in spher-
ical coordinates.
2. Let f (x, y, z) = e− x2− y2− z2
in Cartesian coordinates. Find the Laplacian of the function i n
spherical coordinates.
3. Let f (x, y, z) = z
x2 + y2 in Cartesian coordinates. Find ∇ f in cylindrical coordinates.
4. For f(r, θ, z) = r er + z sin θeθ + rz ez in cylindrical coordinates, ﬁnd div f and curl f.
5. For f(ρ, θ, φ) = eρ + ρ cos θeθ + ρ eφ in spherical coordinates, ﬁnd div f and curl f.
C
6. Derive the gradient formula in cylindrical coordinates:
∇ F = ∂F
∂r er + 1
r
∂F
∂θ eθ + ∂F
∂z ez.


## Page 221

Bibliography
Abbott, E.A., Flatland, 7th edition. New Y ork: Dover Publications, Inc., 1952
Classic tale about a creature living in a 2-dimensional world who enc ounters a higher-
dimensional creature, with lots of humor thrown in.
Anton, H. and C. Rorres, Elementary Linear Algebra: Applications Version , 8th edition. New
Y ork: John Wiley & Sons, 2000
Standard treatment of elementary linear algebra.
Bazaraa, M.S., H.D. Sherali and C.M. Shetty, Nonlinear Programming: Theory and Algo-
rithms, 2nd edition. New Y ork: John Wiley & Sons, 1993
Thorough treatment of nonlinear optimization.
Farin, G., Curves and Surfaces for Computer Aided Geometric Design: A Practical Guide,
2nd edition. San Diego, CA: Academic Press, 1990
An intermediate-level book on curve and surface design.
Hecht, E., Optics, 2nd edition. Reading, MA: Addison-Wesley Publishing Co., 1987
An intermediate-level book on optics, covering a wide range of t opics.
Hoel, P .G., S.C. Port and C.J. Stone, Introduction to Probability Theory , Boston, MA:
Houghton Mifﬂin Co., 1971
An excellent introduction to elementary , calculus-based probabi lity theory . Lots of good exer-
cises.
Jackson, J.D., Classical Electrodynamics, 2nd edition. New Y ork: John Wiley & Sons, 1975
An advanced book on electromagnetism, famous for being intimidat ing. Most of the mathemat-
ics will be understandable after reading the present book.
Marion, J.B., Classical Dynamics of Particles and Systems , 2nd edition. New Y ork: Academic
Press, 1970
Standard intermediate-level treatment of classical mechanics. Very thorough.
O’Neill, B., Elementary Differential Geometry , New Y ork: Academic Press, 1966
Intermediate-level book on differential geometry , with a modern approach based on differential
forms.
213


## Page 222

214 Bibliography
Pogorelov , A.V .,Analytical Geometry, Moscow: Mir Publishers, 1980
An intermediate/advanced book on analytic geometry .
Press, W .H., S.A. Teukolsky , W .T . Vetterling and B.P . Flannery, Numerical Recipes in FOR-
TRAN: The Art of Scientific Computing , 2nd edition. Cambridge, UK: Cambridge Uni-
versity Press, 1992
An excellent source of information on numerical methods for solving a wide variety of problems.
Though all the examples are in the FORTRAN programming language, the code is clear enough
to implement in the language of your choice.
Protter , M.H. and C.B. Morrey, Analytic Geometry , 2nd edition. Reading, MA: Addison-
Wesley Publishing Co., 1975
Thorough treatment of elementary analytic geometry , with a rigor not found in most recent
books.
Ralston, A. and P . Rabinowitz, A First Course in Numerical Analysis , 2nd edition. New Y ork:
McGraw-Hill, 1978
Standard treatment of elementary numerical analysis.
Reitz, J.R., F .J. Milford and R.W . Christy, Foundations of Electromagnetic Theory , 3rd edi-
tion. Reading, MA: Addison-Wesley Publishing Co., 1979
Intermediate text on electromagnetism.
Schey , H.M.,Div, Grad, Curl, and All That: An Informal Text on Vector Calculus , New Y ork:
W .W . Norton & Co., 1973
Very intuitive approach to the subject, from a physicist’s viewpo int. Highly recommended.
Taylor , A.E. and W .R. Mann,Advanced Calculus, 2nd edition. New Y ork: John Wiley & Sons,
1972
Excellent treatment of n-dimensional calculus. A good book to study after the present book.
Many intriguing exercises.
Uspensky , J.V .,Theory of Equations , New Y ork: McGraw-Hill, 1948
A classic on the subject, discussing many interesting topics.
Weinberger , H.F .,A First Course in Partial Differential Equations , New Y ork: John Wiley &
Sons, 1965
A good introduction to the vast subject of partial differential eq uations.
Welchons, A.M. and W .R. Krickenberger, Solid Geometry, Boston, MA: Ginn & Co., 1936
A very thorough treatment of 3-dimensional geometry from an eleme ntary perspective, in-
cludes many topics which (sadly) do not seem to be taught anymore.


## Page 223

Appendix A
Answers and Hints to Selected Exercises
Chapter 1
Section 1.1 (p. 8)
1.(a)
/∇adicallow
5; (b)
/∇adicallow
5; (c)
/∇adicallow
17; (d) 1;
(e) 2
/∇adicallow
17; 2. Y es; 3. No.
Section 1.2 (p. 14)
1.(a) (− 4, 4, − 3); (b) (2 , 6, − 1);
(c)
(
− 1
/∇adicallow
30 , 5/∇adicallow
30 , − 2/∇adicallow
30
)
; (d)
/∇adicallow
41
2 ; (e)
/∇adicallow
41
2 ;
(f) (14, − 6, 8); (g) ( − 7, 3, − 4); (h) ( − 1, − 6, 1);
(i) ( − 2, − 4, 2); (j) No. 3. No, ∥v∥ + ∥ w∥ is
larger .
Section 1.3 (p. 19)
1. 10; 3. 73.4◦; 5. 90◦; 7. 0◦; 9. Y es,
since v ···w = 0; 11. | v ···w| = 0 <
/∇adicallow
21
/∇adicallow
5 =
∥v∥ ∥w∥; 13. ∥v + w∥ =
/∇adicallow
26 <
/∇adicallow
21 +
/∇adicallow
5 =
∥v∥ + ∥ w∥; 15. Hint: use Deﬁnition 1.6;
24. Hint: See Theorem 1.10(c).
Section 1.4 (p. 31)
1. (− 5, − 23, − 24); 3. (8, 4, − 5); 5. 0 ;
7. 16.72; 9. 4
/∇adicallow
5; 11. 9; 13. 0 and
(8, − 10, 2); 15. 14; 31. A circle of radius
1
∥v∥ centered at the origin in the normal
plane to v.
Section 1.5 (p. 41)
1. (a) (2 , 3, − 2) + t(5, 4, − 3); (b) x = 2 + 5t,
y = 3 + 4t, z = − 2 − 3t; (c) x− 2
5 = y− 3
4 = z+ 2
− 3 ;
3.(a) (2, 1, 3)+ t(1, 0, 1); (b) x = 2+ t, y = 1, z =
3+ t; (c) x− 2 = z − 3, y = 1; 5. x = 1+ 2t, y =
− 2 + 7t, z = − 3 + 8t; 7. 7.65; 9. (1, 2, 3);
11. 4x − 4y + 3z − 10 = 0; 13. x − 2y − z + 2 =
0; 15. 11x − 24y + 21z − 26 = 0; 17. 9/
/∇adicallow
35;
19. x = 5t, y = 2 + 3t, z = − 7t; 21. (10, − 2, 1).
Section 1.6 (p. 49)
1. radius: 1, center: (2 , 3, 5); 3. radius:
5, center: ( − 1, − 1, − 1); 5. No intersection;
7. circle x2 + y2 = 4 in the planes z = ±
/∇adicallow
5;
9. lines x
a = y
b , z = 0 and x
a = − y
b , z = 0;
13.
(
2a
2− c , 2b
2− c , 0
)
.
Section 1.7 (p. 53)
1.(a) (4 , π
3 , − 1); (b) (
/∇adicallow
17, π
3 , 1.816); 3.
(a) (2
/∇adicallow
7, 11π
6 , 0); (b) (2
/∇adicallow
7, 11π
6 , π
2 ); 5.(a) r2+
z2 = 25; (b) ρ = 5; 7.(a) r2 + 9z2 = 36;
(b) ρ2(1 + 8 cos2 φ) = 36; 10. (a, θ, a cot φ);
12. Hint: Use the distance formula for Carte-
sian coordinates.
Chapter 2
Section 2.1 (p. 63)
1. f ′(t) = (1, 2t, 3t2), x = 1 + t, y = z =
1; 3. f ′(t) = (− 2 sin 2t, 2 cos 2t, 1); x = 1,
y = 2t, z = t; 5. v (t) = (1, 1 − cos t, sin t),
a(t) = (0, sin t, cos t); 9.(a) Line parallel to c;
(b) Half-line parallel to c; (c) Hint: Think of
215


## Page 224

216 APPENDIX A: ANSWERS AND HINTS TO SELECTED EXERCISES
the functions as position vectors; 15. Hint:
Theorem 1.16.
Section 2.3 (p. 72)
1. 3π
/∇adicallow
5
2 ; 3. 2(53/2 − 8); 5. Replace t by
((
27s+ 16
2
)2/3
− 4
)/
9; 6. Hint: Use Theo-
rem 2.1(e), Example 2.3, and Theorem 1.16;
7. Hint: Use Exercise 6. 9. Hint: Use
f ′(t) = ∥ f(t)∥T, differentiate that to get f ′′(t),
put those expressions into f ′(t) ××× f ′′(t), then
write T ′(t) in terms of N(t).; 11. T (t) =
1
/∇adicallow
2 (− sin t, cos t, 1), N(t) = (− cos t, − sin t, 0),
B(t) = 1/∇adicallow
2 (sin t, − cos t, 1), κ(t) = 1/2
Chapter 3
Section 3.1 (p. 78)
1. domain: R2, range: [ − 1, ∞ ); 3. domain:
{(x, y) : x2 + y2 ≥ 4}, range: [0 , ∞ ); 5. domain:
R3, range: [ − 1, 1]; 7. 1; 9. does not exist;
11. 2; 13. 2; 15. 0; 17. does not exist.
Section 3.2 (p. 83)
1. ∂f
∂x = 2x, ∂f
∂y = 2y; 3. ∂f
∂x = x(x2 + y + 4)− 1/2,
∂f
∂y = 1
2 (x2 + y + 4)− 1/2; 5. ∂f
∂x = ye x y + y, ∂f
∂y =
xe x y + x; 7. ∂f
∂x = 4x3, ∂f
∂y = 0; 9. ∂f
∂x = x(x2 +
y2)− 1/2, ∂f
∂y = y(x2 + y2)− 1/2; 11. ∂f
∂x = 2x
3 (x2 +
y + 4)− 2/3, ∂f
∂y = 1
3 (x2 + y + 4)− 2/3; 13. ∂f
∂x =
− 2xe − (x2+ y2), ∂f
∂y = − 2ye − (x2+ y2); 15. ∂f
∂x =
y cos(x y), ∂f
∂y = x cos(x y); 17. ∂2 f
∂x2 = 2, ∂2 f
∂y2 = 2,
∂2 f
∂x ∂y = 0; 19. ∂2 f
∂x2 = (y+ 4)(x2+ y+ 4)− 3/2, ∂2 f
∂y2 =
− 1
4 (x2 + y + 4)− 3/2, ∂2 f
∂x ∂y = − 1
2 x(x2 + y + 4)− 3/2;
21. ∂2 f
∂x2 = y2 ex y, ∂2 f
∂y2 = x2 ex y, ∂2 f
∂x ∂y = (1 +
x y)ex y + 1; 23. ∂2 f
∂x2 = 12x2, ∂2 f
∂y2 = 0, ∂2 f
∂x ∂y = 0;
25. ∂2 f
∂x2 = − x− 2, ∂2 f
∂y2 = − y− 2, ∂2 f
∂x ∂y = 0
Section 3.3 (p. 86)
1. 2x + 3y − z − 3 = 0; 3. − 2x + y − z − 2 = 0;
5. x + 2y = z; 7. 1
2 (x − 1) + 4
9 (y − 2) +
/∇adicallow
11
12 (z −
2
/∇adicallow
11
3 ) = 0; 9. 3x + 4y − 5z = 0.
Section 3.4 (p. 91)
1. (2x, 2y); 3. ( x
/∇adicallow
x2+ y2+ 4
, y/∇adicallow
x2+ y2+ 4
); 5. ( 1
x , 1
y );
7. (yz cos(x yz), xz cos(x yz), x ycos(x yz));
9. (2x, 2y, 2z); 11. 2
/∇adicallow
2; 13. 1/∇adicallow
3 ;
15.
/∇adicallow
3 cos(1); 17. increase: (45 , 20), de-
crease: ( − 45, − 20)
Section 3.5 (p. 98)
1. local min. (1 , 0); saddle pt. ( − 1, 0); 3. lo-
cal min. (1 , 1); local max. ( − 1, − 1); saddle pts.
(1, − 1), (− 1, 1); 5. local min. (1 , − 1), saddle
pt. (0 , 0); 7. local min. (0 , 0); 9. local min.
(− 1, 1/2); 11. width = height = depth=10;
13. x = y = 4, z = 2.
Section 3.6 (p. 106)
2. (x0, y0) = (0, 0) : → (0.2858, − 0.3998);
(x0, y0) = (1, 1) : → (1.03256, − 1.94037)
Section 3.7 (p. 112)
1. min.
(
− 4
/∇adicallow
5 , − 2/∇adicallow
5
)
; max.
(
4/∇adicallow
5 , 2/∇adicallow
5
)
; 3. min.(
20/∇adicallow
13 , 30/∇adicallow
13
)
; max.
(
− 20/∇adicallow
13 , − 30/∇adicallow
13
)
4. There is
no global maximum, nor global minimum.
5. 8abc
3
/∇adicallow
3
Chapter 4
Section 4.1 (p. 117)
1. 1; 3. 7
12 ; 5. 7
6 ; 7. 5; 9. 1
2 ; 11. 15.


## Page 225

217
Section 4.2 (p. 124)
1. 1; 3. 8 ln 2− 3; 5. π
4 ; 6. 1
4 ; 7. 2; 9. 1
6 ;
10. 6
5 .
Section 4.3 (p. 128)
1. 9
2 ; 3. (2 cos(π2) + π4 − 2)/4; 5. 1
6 ; 7. 6;
10. 1
3
Section 4.4 (p. 133)
1. The values should converge to ≈ 1.318.
(Hint: In Java the exponential function ex
can be obtained with Math.exp(x). Other
languages have similar functions, otherwise
use e = 2.7182818284590455 in your pro-
gram.) 2. ≈ 1.146; 3. ≈ 0.705; 4. ≈ 0.168.
Section 4.5 (p. 141)
1. 8π; 3. 4π
3 (8 − 33/2); 7. 1 − sin 2
2 ; 9. 2πab
Section 4.6 (p. 145)
1. (1, 8/3) 3. (0, 4a
3π ) 5. (0, 3π/16);
7. (0, 0, 5a/12); 9. (7/12, 7/12, 7/12)
Section 4.7 (p. 153)
1. /∇adicallow
π; 2. 1; 6. Both are n
(n+ 1)2(n+ 2) ; 7. 1
n ;
Chapter 5
Section 5.1 (p. 162)
1. 1/2; 3. 23; 5. 24π; 7. − 2π; 9. 2π 11. 0
Section 5.2 (p. 170)
1. 0; 3. No; 4. Y es.F(x, y) = x2
2 − y2
2 ; 5. No;
9. (b) No. Hint: Think of how F is deﬁned;
10. Y es.F(x, y) = ax y+ bx + c y+ d
Section 5.3 (p. 177)
1. 16/15; 3. − 5π; 5. Y es. F(x, y) = x y2 + x3;
7. Y es.F(x, y) = 4x2 y + 2y2 + 3x
Section 5.4 (p. 186)
3. 216π; 4. 3; 5. 12π/5; 9. 15/4
Section 5.5 (p. 200)
1. 2
/∇adicallow
2 π2 2. (17
/∇adicallow
17 − 5
/∇adicallow
5)/3 3. 2/5; 4. 2;
5. 2π(π − 1); 7. 67/15; 9. 6; 11. Y es;
13. No; 19. Hint: Think of how a vector
ﬁeld f(x, y) = P(x, y) i + Q(x, y) j in R2 can be
extended in a natural way to be a vector ﬁeld
in R3.
Section 5.6 (p. 206)
1. 0; 3. 12
√
x2 + y2 + z2; 5. 6(x + y + z);
Section 5.7 (p. 211)
1. 12ρ; 2. (4ρ2 − 6)e− ρ2
; 3. − 2z
r3 er + 1
r2 ez;
5. div f = 2
ρ − sin θ
sin φ + cot φ, curl f = cot φ cos θeρ +
2eθ − 2 cosθeφ 6. Hint: Start by showing that
er = cos θi + sin θj, eθ = − sin θi + cos θj, ez =
k.


## Page 226

GNU Free Documentation License
Version 1.2, November 2002
Copyright ©2000,2001,2002 Free Software Foundation, Inc.
51 Franklin St, Fifth Floor , Boston, MA 02110-1301 USA
Everyone is permitted to copy and distribute verbatim copies of t his license document, but
changing it is not allowed.
Preamble
The purpose of this License is to make a manual, textbook, or oth er functional and useful
document "free" in the sense of freedom: to assure everyone the effective freedom to copy
and redistribute it, with or without modifying it, either commer cially or noncommercially .
Secondarily , this License preserves for the author and publish er a way to get credit for their
work, while not being considered responsible for modiﬁcations ma de by others.
This License is a kind of "copyleft", which means that derivativ e works of the document
must themselves be free in the same sense. It complements the GN U General Public License,
which is a copyleft license designed for free software.
We have designed this License in order to use it for manuals for f ree software, because free
software needs free documentation: a free program should come wi th manuals providing the
same freedoms that the software does. But this License is not li mited to software manuals; it
can be used for any textual work, regardless of subject matter o r whether it is published as a
printed book. We recommend this License principally for works who se purpose is instruction
or reference.
1. APPLICABILITY AND DEFINITIONS
This License applies to any manual or other work, in any medium, th at contains a notice
placed by the copyright holder saying it can be distributed under t he terms of this License.
Such a notice grants a world-wide, royalty-free license, unlimi ted in duration, to use that
work under the conditions stated herein. The "Document", below , refers to any such manual
or work. Any member of the public is a licensee, and is addressed as "you". Y ou accept
the license if you copy , modify or distribute the work in a way requ iring permission under
copyright law .
A "Modiﬁed Version" of the Document means any work containing the Document or a
portion of it, either copied verbatim, or with modiﬁcations and/o r translated into another
language.
218


## Page 227

219
A "Secondary Section" is a named appendix or a front-matter section of the Document
that deals exclusively with the relationship of the publishers or authors of the Document
to the Document’s overall subject (or to related matters) and contains nothing that could
fall directly within that overall subject. (Thus, if the Docume nt is in part a textbook of
mathematics, a Secondary Section may not explain any mathemat ics.) The relationship
could be a matter of historical connection with the subject or with related matters, or of
legal, commercial, philosophical, ethical or political positi on regarding them.
The "Invariant Sections" are certain Secondary Sections whose titles are designated,
as being those of Invariant Sections, in the notice that says that the Document is released
under this License. If a section does not ﬁt the above deﬁnition o f Secondary then it is not
allowed to be designated as Invariant. The Document may contain zero Invariant Sections.
If the Document does not identify any Invariant Sections then th ere are none.
The "Cover Texts" are certain short passages of text that are listed, as Front-Co ver Texts
or Back-Cover Texts, in the notice that says that the Document is released under this Li-
cense. A Front-Cover Text may be at most 5 words, and a Back-Cove r Text may be at most
25 words.
A "Transparent" copy of the Document means a machine-readable copy , represented i n
a format whose speciﬁcation is available to the general public, that is suitable for revising
the document straightforwardly with generic text editors or (fo r images composed of pixels)
generic paint programs or (for drawings) some widely available drawi ng editor , and that
is suitable for input to text formatters or for automatic tran slation to a variety of formats
suitable for input to text formatters. A copy made in an otherwise Transparent ﬁle format
whose markup, or absence of markup, has been arranged to thwar t or discourage subsequent
modiﬁcation by readers is not Transparent. An image format is no t Transparent if used for
any substantial amount of text. A copy that is not "Transparent " is called "Opaque".
Examples of suitable formats for Transparent copies include plai n ASCII without markup,
Texinfo input format, LaTeX input format, SGML or XML using a publ icly available DTD,
and standard-conforming simple HTML, PostScript or PDF designed fo r human modiﬁca-
tion. Examples of transparent image formats include PNG, XCF an d JPG. Opaque formats
include proprietary formats that can be read and edited only by pro prietary word proces-
sors, SGML or XML for which the DTD and/or processing tools are not g enerally available,
and the machine-generated HTML, PostScript or PDF produced by som e word processors for
output purposes only .
The "Title Page" means, for a printed book, the title page itself, plus such follo wing pages
as are needed to hold, legibly , the material this License requi res to appear in the title page.
For works in formats which do not have any title page as such, "Titl e Page" means the text
near the most prominent appearance of the work’s title, preceding t he beginning of the body
of the text.
A section "Entitled XYZ" means a named subunit of the Document whose title either
is precisely XYZ or contains XYZ in parentheses following text t hat translates XYZ in an-
other language. (Here XYZ stands for a speciﬁc section name ment ioned below , such as
"Acknowledgments", "Dedications", "Endorsements", or "History".) To "Preserve the


## Page 228

220 GNU FREE DOCUMENTATION LICENSE
Title" of such a section when you modify the Document means that it remai ns a section
"Entitled XYZ" according to this deﬁnition.
The Document may include Warranty Disclaimers next to the notic e which states that
this License applies to the Document. These Warranty Disclaimer s are considered to be
included by reference in this License, but only as regards discl aiming warranties: any other
implication that these Warranty Disclaimers may have is void a nd has no effect on the
meaning of this License.
2. VERBATIM COPYING
Y ou may copy and distribute the Document in any medium, either com mercially or non-
commercially , provided that this License, the copyright notic es, and the license notice say-
ing this License applies to the Document are reproduced in all copie s, and that you add no
other conditions whatsoever to those of this License. Y ou may n ot use technical measures to
obstruct or control the reading or further copying of the copies you make or distribute. How-
ever , you may accept compensation in exchange for copies. If you distribute a large enough
number of copies you must also follow the conditions in section 3.
Y ou may also lend copies, under the same conditions stated above , and you may publicly
display copies.
3. COPYING IN QUANTITY
If you publish printed copies (or copies in media that commonly hav e printed covers) of
the Document, numbering more than 100, and the Document’s lice nse notice requires Cover
Texts, you must enclose the copies in covers that carry , clear ly and legibly , all these Cover
Texts: Front-Cover Texts on the front cover , and Back-Cover Texts on the back cover . Both
covers must also clearly and legibly identify you as the publis her of these copies. The front
cover must present the full title with all words of the title equal ly prominent and visible.
Y ou may add other material on the covers in addition. Copying with c hanges limited to the
covers, as long as they preserve the title of the Document and sa tisfy these conditions, can
be treated as verbatim copying in other respects.
If the required texts for either cover are too voluminous to ﬁ t legibly , you should put the
ﬁrst ones listed (as many as ﬁt reasonably) on the actual cove r , and continue the rest onto
adjacent pages.
If you publish or distribute Opaque copies of the Document numberin g more than 100,
you must either include a machine-readable Transparent copy alo ng with each Opaque copy ,
or state in or with each Opaque copy a computer-network location fro m which the general
network-using public has access to download using public-standar d network protocols a com-
plete Transparent copy of the Document, free of added material. If y ou use the latter option,
you must take reasonably prudent steps, when you begin distributi on of Opaque copies in
quantity , to ensure that this Transparent copy will remain thus accessible at the stated lo-
cation until at least one year after the last time you distribu te an Opaque copy (directly or
through your agents or retailers) of that edition to the public .


## Page 229

221
It is requested, but not required, that you contact the authors of the Document well before
redistributing any large number of copies, to give them a chanc e to provide you with an
updated version of the Document.
4. MODIFICATIONS
Y ou may copy and distribute a Modiﬁed Version of the Document under the conditions of
sections 2 and 3 above, provided that you release the Modiﬁed Ver sion under precisely this
License, with the Modiﬁed Version ﬁlling the role of the Documen t, thus licensing distribu-
tion and modiﬁcation of the Modiﬁed Version to whoever possesses a copy of it. In addition,
you must do these things in the Modiﬁed Version:
A. Use in the Title Page (and on the covers, if any) a title disti nct from that of the Document,
and from those of previous versions (which should, if there were a ny , be listed in the
History section of the Document). Y ou may use the same title as a previous version if the
original publisher of that version gives permission.
B. List on the Title Page, as authors, one or more persons or ent ities responsible for au-
thorship of the modiﬁcations in the Modiﬁed Version, together with at least ﬁve of the
principal authors of the Document (all of its principal authors, i f it has fewer than ﬁve),
unless they release you from this requirement.
C. State on the Title page the name of the publisher of the Modiﬁed Version, as the pub-
lisher .
D. Preserve all the copyright notices of the Document.
E. Add an appropriate copyright notice for your modiﬁcations adjace nt to the other copy-
right notices.
F . Include, immediately after the copyright notices, a license notice giving the public per-
mission to use the Modiﬁed Version under the terms of this Licen se, in the form shown
in the Addendum below .
G. Preserve in that license notice the full lists of Invarian t Sections and required Cover
Texts given in the Document’s license notice.
H. Include an unaltered copy of this License.
I. Preserve the section Entitled "History", Preserve its Tit le, and add to it an item stating
at least the title, year , new authors, and publisher of the Modi ﬁed Version as given on the
Title Page. If there is no section Entitled "History" in the Doc ument, create one stating
the title, year , authors, and publisher of the Document as give n on its Title Page, then
add an item describing the Modiﬁed Version as stated in the previo us sentence.


## Page 230

222 GNU FREE DOCUMENTATION LICENSE
J. Preserve the network location, if any , given in the Document for public access to a Trans-
parent copy of the Document, and likewise the network locations gi ven in the Document
for previous versions it was based on. These may be placed in the "History" section. Y ou
may omit a network location for a work that was published at least four years before the
Document itself, or if the original publisher of the version it refers to gives permission.
K. For any section Entitled "Acknowledgments" or "Dedications", Preserve the Title of the
section, and preserve in the section all the substance and ton e of each of the contributor
acknowledgments and/or dedications given therein.
L. Preserve all the Invariant Sections of the Document, unalt ered in their text and in their
titles. Section numbers or the equivalent are not considered part of the section titles.
M. Delete any section Entitled "Endorsements". Such a section may not be included in the
Modiﬁed Version.
N. Do not retitle any existing section to be Entitled "Endorsem ents" or to conﬂict in title
with any Invariant Section.
O. Preserve any Warranty Disclaimers.
If the Modiﬁed Version includes new front-matter sections or a ppendices that qualify as
Secondary Sections and contain no material copied from the Docu ment, you may at your
option designate some or all of these sections as invariant. To do this, add their titles to
the list of Invariant Sections in the Modiﬁed Version’s licen se notice. These titles must be
distinct from any other section titles.
Y ou may add a section Entitled "Endorsements", provided it contains nothing but endorse-
ments of your Modiﬁed Version by various parties–for example, s tatements of peer review
or that the text has been approved by an organization as the auth oritative deﬁnition of a
standard.
Y ou may add a passage of up to ﬁve words as a Front-Cover Text, and a pa ssage of up to
25 words as a Back-Cover Text, to the end of the list of Cover Text s in the Modiﬁed Version.
Only one passage of Front-Cover Text and one of Back-Cover Text may be added by (or
through arrangements made by) any one entity . If the Document a lready includes a cover
text for the same cover , previously added by you or by arrangemen t made by the same entity
you are acting on behalf of, you may not add another; but you may replace the old one, on
explicit permission from the previous publisher that added the old one.
The author(s) and publisher(s) of the Document do not by this Lic ense give permission to
use their names for publicity for or to assert or imply endorseme nt of any Modiﬁed Version.
5. COMBINING DOCUMENTS
Y ou may combine the Document with other documents released under this License, under
the terms deﬁned in section 4 above for modiﬁed versions, provide d that you include in the


## Page 231

223
combination all of the Invariant Sections of all of the origi nal documents, unmodiﬁed, and
list them all as Invariant Sections of your combined work in it s license notice, and that you
preserve all their Warranty Disclaimers.
The combined work need only contain one copy of this License, an d multiple identical In-
variant Sections may be replaced with a single copy . If there are multiple Invariant Sections
with the same name but different contents, make the title of eac h such section unique by
adding at the end of it, in parentheses, the name of the original a uthor or publisher of that
section if known, or else a unique number . Make the same adjustm ent to the section titles
in the list of Invariant Sections in the license notice of the combined work.
In the combination, you must combine any sections Entitled " History" in the various orig-
inal documents, forming one section Entitled "History"; like wise combine any sections En-
titled "Acknowledgments", and any sections Entitled "Dedicati ons". Y ou must delete all
sections Entitled "Endorsements".
6. COLLECTIONS OF DOCUMENTS
Y ou may make a collection consisting of the Document and other documents released un-
der this License, and replace the individual copies of this Licens e in the various documents
with a single copy that is included in the collection, provided tha t you follow the rules of this
License for verbatim copying of each of the documents in all oth er respects.
Y ou may extract a single document from such a collection, and di stribute it individually
under this License, provided you insert a copy of this License int o the extracted document,
and follow this License in all other respects regarding verbat im copying of that document.
7. AGGREGATION WITH INDEPENDENT WORKS
A compilation of the Document or its derivatives with other separa te and independent
documents or works, in or on a volume of a storage or distribution medium, is called an "ag-
gregate" if the copyright resulting from the compilation is no t used to limit the legal rights
of the compilation’s users beyond what the individual works permit . When the Document
is included in an aggregate, this License does not apply to the oth er works in the aggregate
which are not themselves derivative works of the Document.
If the Cover Text requirement of section 3 is applicable to thes e copies of the Document,
then if the Document is less than one half of the entire aggrega te, the Document’s Cover
Texts may be placed on covers that bracket the Document within th e aggregate, or the elec-
tronic equivalent of covers if the Document is in electronic f orm. Otherwise they must ap-
pear on printed covers that bracket the whole aggregate.
8. TRANSLATION
Translation is considered a kind of modiﬁcation, so you may dist ribute translations of the
Document under the terms of section 4. Replacing Invariant Sect ions with translations re-
quires special permission from their copyright holders, but you may include translations of


## Page 232

224 GNU FREE DOCUMENTATION LICENSE
some or all Invariant Sections in addition to the original vers ions of these Invariant Sections.
Y ou may include a translation of this License, and all the lice nse notices in the Document,
and any Warranty Disclaimers, provided that you also include the original English version
of this License and the original versions of those notices an d disclaimers. In case of a dis-
agreement between the translation and the original version o f this License or a notice or
disclaimer , the original version will prevail.
If a section in the Document is Entitled "Acknowledgments", "Dedi cations", or "History",
the requirement (section 4) to Preserve its Title (section 1 ) will typically require changing
the actual title.
9. TERMINATION
Y ou may not copy , modify , sublicense, or distribute the Documentexcept as expressly pro-
vided for under this License. Any other attempt to copy , modify , su blicense or distribute the
Document is void, and will automatically terminate your rights under this License. How-
ever , parties who have received copies, or rights, from you under this License will not have
their licenses terminated so long as such parties remain in fu ll compliance.
10. FUTURE REVISIONS OF THIS LICENSE
The Free Software Foundation may publish new , revised version s of the GNU Free Doc-
umentation License from time to time. Such new versions will b e similar in spirit to the
present version, but may differ in detail to address new problems or concerns. See http://
www.gnu.org/copyleft/.
Each version of the License is given a distinguishing version number . If the Document
speciﬁes that a particular numbered version of this License "o r any later version" applies to
it, you have the option of following the terms and conditions eit her of that speciﬁed version or
of any later version that has been published (not as a draft) by t he Free Software Foundation.
If the Document does not specify a version number of this License , you may choose any
version ever published (not as a draft) by the Free Software Fou ndation.
ADDENDUM: How to use this License for your documents
To use this License in a document you have written, include a copy o f the License in the
document and put the following copyright and license notices jus t after the title page:
Copyright ©YEAR YOUR NAME. Permission is granted to copy , distri bute and/or
modify this document under the terms of the GNU Free Documentation License, Ver-
sion 1.2 or any later version published by the Free Software Fo undation; with no In-
variant Sections, no Front-Cover Texts, and no Back-Cover T exts. A copy of the license
is included in the section entitled "GNU Free Documentation Lic ense".


## Page 233

225
If you have Invariant Sections, Front-Cover Texts and Back- Cover Texts, replace the
"with...Texts." line with this:
with the Invariant Sections being LIST THEIR TITLES, with the Fr ont-Cover Texts
being LIST , and with the Back-Cover Texts being LIST .
If you have Invariant Sections without Cover Texts, or some ot her combination of the
three, merge those two alternatives to suit the situation.
If your document contains nontrivial examples of program code, we recommend releas-
ing these examples in parallel under your choice of free softwar e license, such as the GNU
General Public License, to permit their use in free software.


## Page 234

History
This section contains the revision history of the book. For pe rsons making modiﬁcations to
the book, please record the pertinent information here, follo wing the format in the ﬁrst item
below .
1. VERSION: 1.0
Date: 2008-01-04
Author(s): Michael Corral
Title: Vector Calculus
Modiﬁcation(s): Initial version
2. VERSION: 1.1
Date: 2016-12-04
Author(s): Anton Petrunin
Title: Corral’s Vector Calculus
Modiﬁcation(s): Minor corrections and more exercises.
226


## Page 235

Index
Symbols
C1, C∞ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
D . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 95
Mx, M y . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
Mx y, Mxz , M yz . . . . . . . . . . . . . . . . . . . . . . . . 144
R2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
R3 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
¯x. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .142
¯y . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
¯z . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .144
δ(x, y) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
∂(x, y, z)
∂(u, v, w) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 137
∂f
∂x . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
/iiint
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 126/iint
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 115, 119/varint
C . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 156, 159
er, eθ, ez, eρ, eφ . . . . . . . . . . . . . . . . . . . . . . . 207
i, j, k . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
∇ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 89, 202/oiint
Σ
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 186
/varoint
C . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 166
∂. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
Dv f . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
dr . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 160
A
acceleration . . . . . . . . . . . . . . . . . . . . . . . . . . 2, 61
angle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
annulus . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 176
arc length . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
area element . . . . . . . . . . . . . . . . . . . . . . . . . . 119
average value . . . . . . . . . . . . . . . . . . . . . . . . . 130
B
Bézier curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
bounded set . . . . . . . . . . . . . . . . . . . . . . . . . . . 108
C
capping surface . . . . . . . . . . . . . . . . . . . . . . . 200
Cauchy–Schwarz Inequality . . . . . . . . . . . 17
center of mass . . . . . . . . . . . . . . . . . . . . . . . . . 142
centroid . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 144
Chain Rule . . . . . . . . . . . . . . . . . . . . . . . . . 66, 89
change of variable . . . . . . . . . . . . . . . . 135, 137
circulation. . . . . . . . . . . . . . . . . . . . . . . . . . . . .198
closed curve . . . . . . . . . . . . . . . . . . . . . . . . . . . 166
closed surface . . . . . . . . . . . . . . . . . . . . . . . . . 185
collinear . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
conical helix . . . . . . . . . . . . . . . . . . . . . . . . . . . 191
conservative ﬁeld . . . . . . . . . . . . . . . . . . . . . 169
constrained critical point . . . . . . . . . . . . . 107
continuity. . . . . . . . . . . . . . . . . . . . . . . . . . .57, 78
continuously differentiable . . . . . . . . . 57, 89
coordinates . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
Cartesian . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
curvilinear . . . . . . . . . . . . . . . . . . . . . . . . . 51
cylindrical . . . . . . . . . . . . . . . . . . . . 51, 208
ellipsoidal. . . . . . . . . . . . . . . . . . . . . . . . .188
left-handed . . . . . . . . . . . . . . . . . . . . . . . . . . 2
polar . . . . . . . . . . . . . . . . . . . . . . . . . . 52, 139
rectangular. . . . . . . . . . . . . . . . . . . . . . . . . .1
right-handed . . . . . . . . . . . . . . . . . . . . . . . . 1
spherical . . . . . . . . . . . . . . . . . . . . . . 51, 208
coplanar . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
correlation . . . . . . . . . . . . . . . . . . . . . . . . . . . . 154
covariance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 154
critical point . . . . . . . . . . . . . . . . . . . . . . . . . . . . 93
227


## Page 236

228 Index
cross product . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
curl. . . . . . . . . . . . . . . . . . . . . . . . . .194, 203, 208
cylinder. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .45
D
density . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
derivative . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
directional . . . . . . . . . . . . . . . . . . . . . . . . . 87
mixed partial . . . . . . . . . . . . . . . . . . . . . . 82
partial . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
vector-valued function . . . . . . . . . . . . . 57
determinant . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
differential . . . . . . . . . . . . . . . . . . . . . . . . . . . . 160
differential form . . . . . . . . . . . . . . . . . . . . . . 160
directed curve . . . . . . . . . . . . . . . . . . . . . . . . . 165
direction angles . . . . . . . . . . . . . . . . . . . . . . . . 20
direction cosines . . . . . . . . . . . . . . . . . . . . . . . . 20
directional derivative. . . . . . . . . . . . . . . . . . .87
distance. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .6
between points . . . . . . . . . . . . . . . . . . . . . . 6
from point to line . . . . . . . . . . . . . . . . . . 35
point to plane . . . . . . . . . . . . . . 39, 44, 45
distribution function . . . . . . . . . . . . . . . . . . 147
joint. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .150
normal . . . . . . . . . . . . . . . . . . . . . . . . . . . . 149
divergence . . . . . . . . . . . . . . . . . . 185, 202, 208
Divergence Theorem . . . . . . . . . . . . . . . . . . 185
dot product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
double integral . . . . . . . . . . . . . . . . . . . 115, 119
polar coordinates . . . . . . . . . . . . . . . . . 139
doubly ruled surface . . . . . . . . . . . . . . . . . . . . 48
E
ellipsoid . . . . . . . . . . . . . . . . . . . . . . 46, 141, 188
elliptic cone. . . . . . . . . . . . . . . . . . . . . . . . . . . . .48
elliptic paraboloid . . . . . . . . . . . . . . . . . . . . . . 47
Euclidean space . . . . . . . . . . . . . . . . . . . . . . . . . 1
exact differential form . . . . . . 160, 177, 200
expected value . . . . . . . . . . . . . . . . . . . . . . . . 152
extreme point . . . . . . . . . . . . . . . . . . . . . . . . . . 93
F
ﬂux . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 185
force . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
continuous . . . . . . . . . . . . . . . . . . . . . . . . . 78
scalar . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
vector-valued . . . . . . . . . . . . . . . . . . . . . . 56
G
Gaussian blur . . . . . . . . . . . . . . . . . . . . . . . . . . 79
global maximum . . . . . . . . . . . . . . . . . . . . . . . 93
global minimum . . . . . . . . . . . . . . . . . . . . . . . . 93
gradient . . . . . . . . . . . . . . . . . . . . . . . . . . . 89, 208
Green’s identities . . . . . . . . . . . . . . . . . . . . . 206
Green’s Theorem . . . . . . . . . . . . . . . . . . . . . . 172
H
harmonic . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 207
helicoid . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
helix . . . . . . . . . . . . . . . . . . . . . . . . . . . 56, 66, 191
hyperbolic paraboloid . . . . . . . . . . . . . . . . . . 47
hyperboloid . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
one sheet . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
two sheets. . . . . . . . . . . . . . . . . . . . . . . . . .46
hypersurface . . . . . . . . . . . . . . . . . . . . . . . . . . 126
hypervolume . . . . . . . . . . . . . . . . . . . . . . . . . . 126
I
improper integral . . . . . . . . . . . . . . . . . . . . . 123
integral
double . . . . . . . . . . . . . . . . . . . . . . . 115, 119
improper . . . . . . . . . . . . . . . . . . . . . . . . . . 123
iterated . . . . . . . . . . . . . . . . . . . . . . . . . . . 115
multiple . . . . . . . . . . . . . . . . . . . . . . . . . . 114
surface . . . . . . . . . . . . . . . . . . . . . . . 179, 181
triple. . . . . . . . . . . . . . . . . . . . . . . . . . . . . .126
involute . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
irrotational . . . . . . . . . . . . . . . . . . . . . . . . . . . . 199
iterated integral . . . . . . . . . . . . . . . . . . . . . . 115
J
Jacobi identity . . . . . . . . . . . . . . . . . . . . . . . . . . 32
Jacobian. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .137
joint distribution . . . . . . . . . . . . . . . . . . . . . . 150


## Page 237

Index 229
L
Lagrange multiplier. . . . . . . . . . . . . . . . . . .107
lamina . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
Laplacian . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 208
level curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 75
limit . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 75
vector-valued function . . . . . . . . . . . . . 57
line . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
intersection of planes . . . . . . . . . . . . . . 40
parallel . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36
parametric representation . . . . . . . . . 33
perpendicular . . . . . . . . . . . . . . . . . . . . . . 36
skew . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 36
symmetric representation . . . . . . . . . 34
through two points . . . . . . . . . . . . . . . . . 35
vector representation . . . . . . . . . . . . . . 33
line integral . . . . . . . . . . . . . . . . . . . . . . 156, 159
local maximum . . . . . . . . . . . . . . . . . . . . . . . . . 93
local minimum . . . . . . . . . . . . . . . . . . . . . . . . . 93
M
mass . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 142
matrix . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
mixed partial derivative . . . . . . . . . . . . . . . . 82
Möbius strip . . . . . . . . . . . . . . . . . . . . . . . . . . 193
moment . . . . . . . . . . . . . . . . . . . . . . . . . . 142, 144
momentum . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
Monte Carlo method . . . . . . . . . . . . . . . . . . 130
multiple integral . . . . . . . . . . . . . . . . . . . . . . 114
multiply connected . . . . . . . . . . . . . . . . . . . . 175
N
n-positive direction . . . . . . . . . . . . . . . . . . . 193
normal to a curve . . . . . . . . . . . . . . . . . . . . . . . 90
normal vector ﬁeld . . . . . . . . . . . . . . . . . . . . 192
O
orientable . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 192
P
paraboloid . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
elliptic . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
hyperbolic . . . . . . . . . . . . . . . . . . . . . . 47, 94
of revolution . . . . . . . . . . . . . . . . . . . . . . . 47
parallelepiped . . . . . . . . . . . . . . . . . . . . . . . . . . 26
volume . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
parameter . . . . . . . . . . . . . . . . . . . . . . . . . . 33, 66
parametrization . . . . . . . . . . . . . . . . . . . . . . . . 66
partial derivative . . . . . . . . . . . . . . . . . . . . . . . 80
partial differential equation . . . . . . . . . . . . 83
path independence . . . . . . . . . . 167, 177, 200
pedal curve . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
piecewise smooth curve . . . . . . . . . . . . . . . 161
plane
coordinate . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
Euclidean . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
line of intersection . . . . . . . . . . . . . . . . . 40
normal form . . . . . . . . . . . . . . . . . . . . . . . 37
normal vector . . . . . . . . . . . . . . . . . . . . . . 37
point-normal form . . . . . . . . . . . . . . . . . 37
tangent . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
through three points . . . . . . . . . . . . . . . 38
position vector . . . . . . . . . . . . . . . . . 59, 60, 159
potential . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 169
probability . . . . . . . . . . . . . . . . . . . . . . . . . . . . 147
probability density function . . . . . . . . . . . 148
projection . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
Q
quadric surface . . . . . . . . . . . . . . . . . . . . . . . . . 46
R
random variable . . . . . . . . . . . . . . . . . . . . . . 147
regular reparametrization . . . . . . . . . . . . . 66
reparametrization . . . . . . . . . . . . . . . . . . . . . . 66
Riemann integral . . . . . . . . . . . . . . . . . . . . . 155
right-hand rule . . . . . . . . . . . . . . . . . . . . . . . . . 22
ruled surface . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
S
saddle point . . . . . . . . . . . . . . . . . . . . . . . . . . . . 95
sample space . . . . . . . . . . . . . . . . . . . . . . . . . . 147
scalar . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
combination . . . . . . . . . . . . . . . . . . . . . . . . 13
scalar function . . . . . . . . . . . . . . . . . . . . . . . . . 58
scalar triple product . . . . . . . . . . . . . . . . . . . . 26


## Page 238

230 Index
Second Derivative Test . . . . . . . . . . . . . . . . . 95
second moment. . . . . . . . . . . . . . . . . . . . . . . .154
second-degree equation. . . . . . . . . . . . . . . . .46
simple closed curve . . . . . . . . . . . . . . . . . . . 166
simply connected . . . . . . . . . . . . . . . . . 177, 200
smooth function . . . . . . . . . . . . . . . . . . . . 57, 95
solenoidal . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 186
span . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
sphere . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 43
spherical spiral . . . . . . . . . . . . . . . . . . . . . . . . . 59
standard normal distribution . . . . . . . . . 149
steepest descent . . . . . . . . . . . . . . . . . . . . . . . 106
stereographic projection . . . . . . . . . . . . . . . . 50
Stokes’ Theorem . . . . . . . . . . . . . . . . . 192, 194
surface . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 43
doubly ruled . . . . . . . . . . . . . . . . . . . . . . . 48
orientable . . . . . . . . . . . . . . . . . . . . . . . . . 192
ruled . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
two-sided . . . . . . . . . . . . . . . . . . . . . . . . . 193
surface integral . . . . . . . . . . . . . . . . . . 179, 181
T
tangent plane . . . . . . . . . . . . . . . . . . . . . . . . . . 84
torus . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 181
trace . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
triangle inequality . . . . . . . . . . . . . . . . . . . . . 18
triple integral . . . . . . . . . . . . . . . . . . . . . . . . . 126
cylindrical coordinates . . . . . . . . . . . . 140
spherical coordinates . . . . . . . . . . . . . 140
U
uniform density . . . . . . . . . . . . . . . . . . . . . . . 142
uniform distribution . . . . . . . . . . . . . . . . . . 148
uniformly distributed . . . . . . . . . . . . . . . . . 147
unit disk . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 74
V
variance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 154
vector . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
addition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
angle between. . . . . . . . . . . . . . . . . . . . . .15
basis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
components . . . . . . . . . . . . . . . . . . . . . . . . 13
direction. . . . . . . . . . . . . . . . . . . . . . . . . . . . .3
magnitude . . . . . . . . . . . . . . . . . . . . . 3, 6, 7
normal . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
normalized . . . . . . . . . . . . . . . . . . . . . . . . . 12
parallel . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
perpendicular . . . . . . . . . . . . . . . . . . 16, 17
positive unit normal . . . . . . . . . . . . . . 193
scalar multiplication . . . . . . . . . . . . . . . . 9
subtraction . . . . . . . . . . . . . . . . . . . . . . . . . 10
tangent . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
translation . . . . . . . . . . . . . . . . . . . . . . . . 5, 9
unit . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
zero . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
vector ﬁeld . . . . . . . . . . . . . . . . . . . . . . . . . . . . 159
normal . . . . . . . . . . . . . . . . . . . . . . . . . . . . 192
smooth . . . . . . . . . . . . . . . . . . . . . . . . . . . . 172
vector triple product . . . . . . . . . . . . . . . . . . . . 27
velocity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2, 61
volume element . . . . . . . . . . . . . . . . . . . . . . . 126
W
wave equation . . . . . . . . . . . . . . . . . . . . . . . . . . 83
work . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 155, 190
Z
zenith angle . . . . . . . . . . . . . . . . . . . . . . . . . . . . 52
