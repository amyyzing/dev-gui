# Chapter 1 Vector Calculus

Converted from: `Calculus III\Vector Calculus Notes.pdf`


## Page 1

Chapter 1
Vector Calculus
   01 第 1 頁


## Page 2

VECTOR FUNCTIONS AND VECTOR FIELDSA.
Parametric equations and curves(1)
Consider the equation of a circle:

We will never be able to write the equation above down as a single
function of the form       . There are, in fact, two functions, each
formula gives a portion of the circle,

We, thus, introduce parametric equations through the followings:







Recall the trigonometry identity

where  is the subtended angle, called a parameter.
We can see that



A circle can be defined as the locus of all points that satisfy the
equations


Now, each value of  defines a point            .
We then define a function                  called a vector function
to describe points on the circle.
EXAMPLES:
Sketch the curve          for  in       by      .1.
ANSWER:

Let



The curve is            for       .
1-1 Calculus With Vector Fields
   01 第 2 頁


## Page 3

Assuming an ideal projectile motion     , the height of the
object can be described by            . Describe the
trajectory by a vector function.
2.
ANSWER:



Let



For    , we have


The trajectory is                     for         .
Physically, the parametric variable  should be a physical
quantity. Thus, we use the kinetic equations:



Since      for     , we obtain




The trajectory is                  for      .
   01 第 3 頁


## Page 4

Consider the tendency of movements in space(2)
Each point           gives the value and direction to describe the
the tendency of movements. Thus, each point in space indicates a
vector. We then define                 to describe vectors in space as

where          is called a vector field, and          ,          and
         are scalar functions.
EXAMPLES:
Sketch the vector field                        1.
ANSWER:
   01 第 4 頁


## Page 5

LOCAL PROPERTIES OF VECTOR FIELDSB.
Derivative with vector functions(1)













Derivative with vector fields(2)
Consider a vector field

The vector field can be locally characterized in space by derivatives
with dot product and cross product:



































   01 第 5 頁


## Page 6

Let  (called "nabla") be an operator




The dot product of  and   can be expressed as




which measures the tendency of vectors to collect or disperse at a
point, called divergence.
The cross product of  and   can be expressed as








which measures the tendency of vectors to swirl around the point
(right-hand rule), called curl.
   01 第 6 頁


## Page 7

EXAMPLES:
Sketch and characterize the vector field              1.
ANSWER:
The divergence is







The curl is















Sketch and characterize the vector field                   2.
ANSWER:
The divergence is







The curl is



















   01 第 7 頁


## Page 8

Sketch and characterize the vector field              3.
ANSWER:
The divergence is







The curl is















Second derivative with vector fields(3)
Divergence of curl:
























•
If the divergence of a vector field
    is also called a solenoidal field (no divergences).
Curl of curl:































•
   01 第 8 頁


## Page 9

GLOBAL PROPERTIES OF VECTOR FIELDSC.
Line integral(1)
Consider a path  connect points  and  .
The line integral of   along the path  is




where    is the infinitesimal displacement vector.
Method I (direct integral):•
Decomposing the path  into line segments, the line integral is

















Method II (parameterization):•
Describe the path  by a vector function      as

The line integral is
   01 第 9 頁


## Page 10

The line integral is











EXAMPLES:
Evaluate




1.
of the vector field                  from        to
along two different paths  :
ANSWER:
Direct integral:
Path 1:


















Path 2:
























Parameterization:
Path 2:





   01 第 10 頁


## Page 11

Gauss's divergence theorem(2)
Consider a vector field passing through an infinitesimal area    as a
flux:



The total flux of the vector field passing through a closed surface  ,
which enclose a volume  , is




Consider the divergence of the vector field in an infinitesimal volume
  :
   01 第 11 頁


## Page 12

The sum of all sources and sinks of the vector field within the enclosed
volume  is




 The total flux of a vector field passing through a closed surface is
the sum of all sources and sinks of the vector field within the enclosed
volume.







EXAMPLES:
Evaluate the total flux of a vector field
     go through a unit cube at the origin.
1.
   01 第 12 頁


## Page 13

ANSWER:
According to Gauss's divergence theorem,







L.H.S.:













   (i)












   (ii)














   (iii)










   (iv)









      (v)









      (vi)
So the total flux is








R.H.S.:

   01 第 13 頁


## Page 14

Stokes' theorem(3)
Consider the line integral of a vector field along an infinitesimal loop as
a circulation:



The total circulation of the vector field along the closed path  , which
spans the surface  , is




Consider the curl of the vector field in an infinitesimal area    :
The sum of all curls of the vector field within the spanned surface  is
   01 第 14 頁


## Page 15

The sum of all curls of the vector field within the spanned surface  is




 The total circulation of a vector field along a closed path equals to
the sum of all curls of the vector field within the spanned surface.







EXAMPLES:
Evaluate the circulation of a vector field
      for a unit square surface at    .
1.
ANSWER:
According to Stokes' theorem,







L.H.S.:

   01 第 15 頁


## Page 16

(i)








   (ii)







     (iii)







    (iv)
So the total circulation is






R.H.S.:










Since    , we obtain











   01 第 16 頁


## Page 17

GRADIENT VECTOR FIELDSA.
Consider a scalar function         . Take derivatives at a give point
       in directions          and   .
(1)
The directional derivative in the direction    is






The parameterized infinitesimal steps are




The directional derivative can also be expressed as







where   is a vector that indicates the maximum value of the
1-2 Gradient Fields
   01 第 17 頁


## Page 18

where   is a vector that indicates the maximum value of the
directional derivative in a certain direction.
If  is a scalar function of  and  , then



(2)
is called the gradient of  .
  is a vector field on the   -plane, not on the surface of  .
Suppose the scalar function       with level curve         .(3)
The gradient   is perpendicular to the level curve of         at a
point on the   -plane.
   01 第 18 頁


## Page 19

point on the   -plane.
EXAMPLES:
Consider a scalar function

.
Sketching the gradient   .
1.
ANSWER:
The topographic graph
The gradient

Level curves and the gradient
   01 第 19 頁


## Page 20

Consider a scalar function
. Sketching the
gradient   .
2.
ANSWER:
The topographic graph
The gradient is




Level curves and the gradient
   01 第 20 頁


## Page 21

LOCAL PROPERTIES OF GRADIENT FIELDS B.
The divergence and curl of a gradient field(1)
Divergence of gradient:

















•
Let   be an operator




We obtain

Curl of gradient:















•
In math, if the curl of a vector field
   is also called an irrotational field (no curls).
Second derivative with gradient fields(2)
Divergence of curl:

•
Curl of curl:•
   01 第 21 頁


## Page 22

Curl of curl:

•
GLOBAL PROPERTIES OF GRADIENT FIELDSC.
Line integral(1)
Consider a path  connect points  and  .
The line integral of   along the path  is




































The line integral of a gradient only depends on the initial point and
final point, and is independent of path.
Thus, the gradient vector field   is also called a conservative field,
EXAMPLES:
Evaluate




1.
from        to        .
ANSWER:
   01 第 22 頁


## Page 23

ANSWER:




Gauss's divergence theorem










(2)
Stokes' theorem





































(3)
   01 第 23 頁


## Page 24

HELMHOLTZ DECOMPOSITION THEOREMA.
Helmholtz theorem (1858)(1)
Let       be a vector field such that


and     and       go to zero sufficiently rapidly at infinity, then
has a unique decomposition:

where






















CONSEDQUENCIES OF HELMHOLTZ THEOREMB.
Consider that


(1)
According to Helmholtz theorem, we have












Thus, we obtain






   is also called an irrotational field (no curls).
Helmholtz theorem claims that the field of          is the same as
the field       through a scalar function  , if   is an irrotational
field.
(2)
1-3 Helmholtz Theorem
   01 第 24 頁


## Page 25

field.
EXAMPLES:
Sketch the level surfaces of a scalar function



1.
ANSWER:
The topographic of
The contour map of
   01 第 25 頁


## Page 26

Sketch the level surfaces of a scalar function



2.
ANSWER:
The contour map of
Consider that


(3)
According to Helmholtz theorem, we have












Thus, we obtain






   is also called a solenoidal field (no divergences).
Helmholtz theorem claims that the field of       is the same as
   01 第 26 頁


## Page 27

Helmholtz theorem claims that the field of            is the same as
the field        through a vector field   , if   is a solenoidal field.
(4)
EXAMPLES:
Sketch the vector field of

1.
ANSWER:
   01 第 27 頁


## Page 28

SYMMETRY OF FUNCTIONS AND VECTOR FIELDSA.
Cartesian coordinates(1)
Scalar Function:

Vector Field:

Spherical symmetry and coordinates(2)



Scalar Function:

1-4 Symmetry and Curvilinear Coordinates
   01 第 28 頁


## Page 29

Vector Field:

EXAMPLES:

      1.
Cylindrical symmetry and coordinates(3)



Scalar Function:

Vector Field:

DIFFERENTIAL OPERATORSB.
Cartesian coordinates(1)
   01 第 29 頁


## Page 30

Cartesian coordinates(1)
Gradient:




Divergence:




Curl:








Spherical coordinates(2)
Gradient:






Divergence:







Curl:














Cylindrical coordinates(3)
Gradient:




Divergence:






Curl:











   01 第 30 頁


## Page 31

EXAMPLES:
Find the gradient of    , where           .1.
ANSWER:
In Cartesian coordinates:
Since




we have









In spherical coordinates:





Find the divergence of     , where           .2.
ANSWER:
In spherical coordinates:






INTEGRALC.
Cartesian coordinates(1)
   01 第 31 頁


## Page 32

volume elements:







Spherical coordinates(2)
surface elements:












   01 第 32 頁


## Page 33

volume elements:











Cylindrical coordinates(3)
surface element:












volume element:











EXAMPLES:
Dirac delta function1.
A distribution which is well defined only when it appears under
an integral sign
   01 第 33 頁


## Page 34

an integral sign




where     can be either figure (a) or figure (b)
Conventionally, we adopt the figure (b) and define the Dirac
delta function by
      when
and




which is a   y “    -and-    ”    k
origin.
Sifting property:







•
Within this infinitesimally small interval       ,     is
approximately constant and equal to     . Therefore,     can be
pulled out of the integral:







Paradox of the Gauss's divergence theorem for a point charge:2.
The electric field of a point charge at the origin is


The Gauss's divergence theorem states







L.H.S.:
We integrate over a sphere of radius  , centered at the origin

















   01 第 34 頁


## Page 35

R.H.S.:






The divergence is zero everywhere except at the origin because as
   ,       grows faster than     .
We thus define the divergence of the electric field by the Dirac
delta function as


Thus we obtain







   01 第 35 頁
