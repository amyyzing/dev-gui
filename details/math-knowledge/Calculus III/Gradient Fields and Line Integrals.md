# MIT OpenCourseWare

Converted from: `Calculus III\Gradient Fields and Line Integrals.pdf`


## Page 1

MIT OpenCourseWare
http://ocw.mit.edu



18.02 Multivariable Calculus
Fall 2007



For information about citing these materials or our Terms of Use, visit: http://ocw.mit.edu/terms.


## Page 2

�
� �
� � � �
�
18.02 Lecture 21.  –  T ue, Oct 30, 2007
Test for gradient ﬁelds.
Observe: if F� = Mˆı + Nˆj is a gradient ﬁeld then Nx = My. Indeed, if F� = � f then M = fx,
N = fy, so Nx = fyx = fxy = My.
Claim: Conversely, if F� is deﬁned and diﬀerentiable at every point of the plane, and Nx = My,
then F� = Mˆı + Nˆj is a gradient ﬁeld.
Example: F� = − yˆı + xˆj: Nx = 1, My = − 1, so F� is not a gradient ﬁeld.
Example: for which value(s) of a is F� = (4x2 + axy)ˆı + (3y2 + 4x2)ˆj a gradient ﬁeld? Answer:
Nx = 8x, My = ax, so a = 8.
Finding the potential: if above test says F� is a gradient ﬁeld, we have 2 methods to ﬁnd the
potential function f . Illustrated for the above example (taking a = 8):
Method 1: using line integrals (FTC backwards):
We know that if C starts at (0, 0) and ends at (x1, y1) then f (x1, y1) − f (0, 0) = F� d�r. Here C ·
f (0, 0) is just an integration constant (if f is a potential then so is f + c). Can also choose the
simplest curve C from (0, 0) to (x1, y1).
Simplest choice: take C = portion of x-axis from (0, 0) to (x1, 0), then vertical segment from
(x1, 0) to (x1, y1) (picture drawn).
Then F� d�r = (4x 2 + 8xy) dx + (3y 2 + 4x 2) dy:·
C C1+C2
x1 4 x1 4Over C1, 0 ≤ x ≤ x1, y = 0, dy = 0: = (4x 2 + 8x 0) dx = x 3 = x1
3 .· 3 3�C1 �0 0
y1 � �
Over C2, 0 ≤ y ≤ y1, x = x1, dx = 0: = (3y 2 + 4x 2) dy = y 3 + 4x1
2 y
y1
= y 3 + 4x1
2 y1.1 0 1
C2 0
4So f (x1, y1) = x 3
1 + y1
3 + 4x1
2 y1 (+constant). 3
Method 2: using antiderivatives:
We want f (x, y) such that (1) fx = 4x2 + 8xy, (2) fy = 3y2 + 4x2 .
Taking antiderivative of (1) w.r.t. x (treating y as a constant), we get f (x, y) = 3
4 x3 + 4x2y+
integration constant (independent of x). The integration constant still depends on y, call it g(y).
So f (x, y) = 4
3 x3 + 4x2y + g(y). Take partial w.r.t. y, to get fy = 4x2 + g�(y).
Comparing this with (2), we get g�(y) = 3y2, so g(y) = y3 + c.
Plugging into above formula for f , we ﬁnally get f (x, y) = 3
4 x3 + 4x2y + y3 + c.
Curl.
Now we have: Nx = My ⇔ ∗ F� is a gradient ﬁeld ⇔ F� is conservative: C F� · d�r = 0 for any
closed curve.
(*): only holds if F� is deﬁned everywhere, or in a “simply-connected” region – see next week. ⇒
Failure of conservativeness is given by the curl of F�:
Deﬁnition: curl( F�) = Nx − My.
Interpretation of curl: for a velocity ﬁeld, curl = (twice) angular velocity of the rotation
component of the motion.
1


## Page 3

��
� ��
� �
2
(Ex: F� = �a, b� uniform translation, F� = �x, y� expanding motion have curl zero; whereas
F� = �−y, x� rotation at unit angular velocity has curl = 2).
For a force ﬁeld, curl F� = torque exerted on a test mass, measures how F� imparts rotation motion.
Force dFor translation motion: = acceleration = (velocity). Mass dt
Torque dFor rotation eﬀects: = angular acceleration = (angular velocity).Moment of inertia dt
18.02 Lecture 22.  –  Thu, Nov 1, 2007
Handouts: PS8 solutions, PS9, practice exams 3A and 3B.
Green’s theorem.
If C is a positively oriented closed curve enclosing a region R, then � � � � � �
F� r = F dA M dx + N dy = (Nx − Myd� curl � which means ) dA.·
C R C R
Example (reduce a complicated line integral to an easy ):
Let C = unit circle centered at (2,0), counterclockwise. R = unit disk at (2, 0). Then � � � � � � �
ye− x dx + ( 1 x 2 − e− x) dy = Nx − My dA = (x + e− x) − e− x dA = x dA.
C 2 R R R
This is equal to area x¯ = π 2 = 2π (or by direct computation of the iterated integral). (Note: · ·
direct calculation of the line integral would probably involve setting x = 2 + cos θ, y = sin θ, but
then calculations get really complicated.)
Application: proof of our criterion for gradient ﬁelds.
Theorem: if F� = Mˆı + Nˆj is deﬁned and continuously diﬀerentiable in the whole plane, then
Nx = My ⇒ F� is conservative ( F� is a gradient ﬁeld).
�
⇔
�� ��
If Nx = My then by Green, C F� r = R F dA = R 0 dA = 0. So F� is conservative. d� curl �·
Note: this only works if F� and its curl are deﬁned everywhere inside R. For the vector ﬁeld on
PS8 Problem 2, we can’t do this if the region contains the origin – for example, the line integral
along the unit circle is non-zero even though curl( F�) is zero wherever it’s deﬁned.
Proof of Green’s theorem. 2 preliminary remarks: � �� � ��
1) the theorem splits into two identities, C M dx = − R My dA and C N dy = Nx dA.R
2) additivity: if theorem is true for R1 and R2 then it’s true for the union R = R1 ∪ R2 (picture � � � �� �� ��
shown): C = C1
+ C2
(the line integrals along inner portions cancel out) and R = R1
+ R2
.
Main step in the proof: prove M dx = − My dA for “vertically simple” regions: a < x < b,C R
f0(x) < y < f1(x). (picture drawn). This involves calculations similar to PS5 Problem 3.
LHS: break C into four sides (C1 lower, C2 right vertical segment, C3 upper, C4 left vertical
segment); C2
M dx = C4
M dx = 0 since x = constant on C2 and C4. So
� � � � b � b
= + = M (x, f0(x)) dx − M (x, f1(x)) dx
C C1 C3 a a
(using along C1: parameter a ≤ x ≤ b, y = f0(x); along C2, x from b to a, hence − sign; y = f1(x)).


## Page 4

� ��
�
�
�
�
� �
� � �
3
� � � b � f1(x) � b
RHS: − My dA = − My dy dx = − (M (x, f1(x)) − M (x, f0(x)) dx (= LHS).
R a f0(x) a
Finally observe: any region R can be subdivided into vertically simple pieces (picture shown); � �� � ��
for each piece Ci
M dx = − Ri
My dA, so by additivity C M dx = − R My dA.
Similarly C N dy = R Nx dA by subdividing into horizontally simple pieces. This completes
the proof.
Example. The area of a region R can be evaluated using a line integral: for example, x dy = �� C
1dA = area(R).R
This idea was used to build mechanical devices that measure area of arbitrary regions on a piece
of paper: planimeters (photo of the actual object shown, and principle explained brieﬂy: as one
moves its arm along a closed curve, the planimeter calculates the line integral of a suitable vector
ﬁeld by means of an ingenious mechanism; at the end of the motion, one reads the area).
18.02 Lecture 23.  –  F ri, Nov 2, 2007
Flux. The ﬂux of a vector ﬁeld F� across a plane curve C is C F� nˆ ds, where nˆ = normal vector ·
to C, rotated 90◦ clockwise from Tˆ .
We now have two types of line integrals: work, F� Tˆ ds, sums F� Tˆ = component of F� in� · ·
direction of C, along the curve C. Flux, F� nˆ ds, sums F� nˆ = component of F� perpendicular to · ·
C, along the curve.
If we break C into small pieces of length Δ s, the ﬂux is i(F� nˆ) Δs i.·
Physical interpretation: if F� is a velocity ﬁeld (e.g. ﬂow of a ﬂuid), ﬂux measures how much
matter passes through C per unit time.
Look at a small portion of C: locally F� is constant, what passes through portion of C in unit
time is contents of a parallelogram with sides Δs and F� (picture shown with F� horizontal, and
portion of curve = diagonal line segment). The area of this parallelogram is Δs height = Δs (F� nˆ).· ·
(picture shown rotated with portion of C �horizontal, at base of parallelogram). Summing these
contributions along all of C, we get that (F� nˆ) ds is the total ﬂow through C per unit time; ·
counting positively what ﬂows towards the right of C, negatively what ﬂows towards the left of C,
as seen from the point of view of a point travelling along C.
Example: C = circle of radius a counterclockwise, F� = xˆı + yˆj (picture shown): along C,
F //n ˆ, and |F | = a, so F� · nˆ� = a. So �
F� nˆ ds = a ds = a length(C) = 2πa2 .·
C C
Meanwhile, the ﬂux of − yˆı + xˆj across C is zero (ﬁeld tangent to C).
That was a geometric argument. What about the general situation when calculation of the line
integral is required?
Observe: d�r = Tˆ ds = �dx, dy�, and nˆ is Tˆ rotated 90◦ clockwise; so nˆ ds = �dy, − dx�.
So, if F� = P ˆı + Qˆj (using new letters to make things look diﬀerent; of course we could call the
components M and N ), then
F� · nˆ ds = �P, Q�·�dy, − dx� =
C
− Q dx + P dy.
C C


## Page 5

�
� � �
� �
�
 � �

��
4
(or if F� = �M, N �, C − N dx + M dy).
So we can compute ﬂux using the usual method, by expressing x, y, dx, dy in terms of a parameter
variable and substituting (no example given).
Green’s theorem for ﬂux. If C encloses R counterclockwise, and F� = P ˆı + Qˆj, then
F� nˆ ds = div( F�) dA, where F ) = Px + Qy is the divergence of �div( � F . ·
C R
Note: the counterclockwise orientation of C means that we count ﬂux of F� out of R through C.
Proof: F� nˆ ds = − Q dx + P dy. Call M = − Q and N = P , then apply usual Green’s ·
� C C � �
theorem M dx + N dy = (Nx − My) dA to get
C R� � � � �
− Q dx + P dy = (Px − (− Qy)) dA = div( F�) dA.
C R R
This proof by “renaming” the components is why we called the components P, Q instead of M, N .
If we call F� = �M, N � the statement becomes − N dx + M dy = (M x + Ny) dA.
C R
Example: in the above example (xˆı + yˆj across circle), div F� = 2, so ﬂux = R 2 dA =
2 area(R) = 2πa2 . If we translate C to a diﬀerent position (not centered at origin) (picture shown)
then direct calculation of ﬂux is harder, but total ﬂux is still 2πa2 .
Physical interpretation: in an incompressible ﬂuid ﬂow, divergence measures source/sink den­
sity/rate, i.e. how much ﬂuid is being added to the system per unit area and per unit time.
