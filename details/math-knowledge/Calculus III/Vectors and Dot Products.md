# MIT OpenCourseWare

Converted from: `Calculus III\Vectors and Dot Products.pdf`


## Page 1

MIT OpenCourseWare
http://ocw.mit.edu



18.02 Multivariable Calculus
Fall 2007



For information about citing these materials or our Terms of Use, visit: http://ocw.mit.edu/terms.


## Page 2

�
18.02 Lecture 1. – Thu, Sept 6, 2007
Handouts: syllabus; PS1; ﬂashcards.
Goal of multivariable calculus: tools to handle problems with several parameters – functions of
several variables.
Vectors. A vector (notation: A�) has a direction, and a length (|A�|). It is represented by
a directed line segment. In a coordinate system it’s expressed by components: in space, A� =
�a1, a2, a3� = a1ˆı + a2ˆj + a3kˆ. (Recall in space x-axis points to the lower-left, y to the right, z up).
Scalar multiplication
Formula for length? Showed picture of �3, 2, 1� and used ﬂashcards to ask for its length. Most
students got the right answer (
√
14).
   why |A�| = a1
2 + a2
2 + a3
2 by reducing to the Pythagorean theorem in the
plane (Draw a picture,   showing  A� and its projection to the xy-plane, then derived |A�|  from length
of projection + Pythagorean theorem).
Vector addition: A�+B� by head-to-tail addition:    in a parallelogram (showed how
the diagonals are A� + B� and B� − A�);
 A� = 3ˆı + 2ˆj + kˆ on the displayed example.
Dot product.
Deﬁnition: A� B� = a1b1 + a2b2 + a3b3 (a scalar, not a vector).·
Theorem: geometrically, A� · B� = |A�||B�| cos θ.
Explained the theorem as follows: ﬁrst, A� A� = A� 2 cos 0 = |A� 2 is consistent with the deﬁnition.· | | |
2Next, consider a triangle with sides A�, B�, C� = A� − B�. Then the law of cosines gives C� =
|A�|2 + |B�|2 − 2|A�||B�| cos θ, while we get
| |
C = C C = (A� − B�) (A� − B�) = |A� 2 + | � − 2A� B.| �|2 � · � · | B|2 · �
Hence the theorem is a vector formulation of the law of cosines.
A� B�
Applications. 1) computing lengths and angles: cos θ = · .
|A�||B�|
Example: triangle in space with vertices P = (1, 0, 0), Q = (0, 1, 0), R = (0, 0, 2), ﬁnd angle at P :
P Q P R cos θ =
−−→ · −−→
= �−1, 1, 0� · �− 1, 0, 2� = 1 , θ ≈ 71.5 ◦ .
|−−→ P R |
√
2
√
5
√
10P Q ||−−→
Note the sign of dot product: positive if angle less than 90◦ , negative if angle more than 90◦ ,
zero if perpendicular.
2) detecting orthogonality.
Example: what is the set of points where x + 2y + 3z = 0? (possible answers: empty set, a point,
a line, a plane, a sphere, none of the above, I don’t know).
Answer: plane; can see “by hand”, but more geometrically use dot product: call A� = �1, 2, 3�,
P = (x, y, z), then A� · OP = x + 2y + 3z = 0 ⇔ | � OP | cos θ = 0 ⇔ θ = π/2 ⇔ � OP . So we−−→ A||−−→ A ⊥ −−→
get the plane through O with normal vector A�.
1
You can explain
addition works componentwise, and it is true that
Draw a picture


## Page 3

��
�
�
�
�
�
�
�
�
��
��
��
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
��
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
2
18.02 Lecture 2. – Fri, Sept 7, 2007
We’ve seen two applications of dot product: ﬁnding lengths/angles, and detecting orthogonality.
A third one: ﬁnding components of a vector. If uˆ is a unit vector, A�·uˆ = |A�| cos θ is the component
of A� along the direction of uˆ. E.g., A� ˆı = component of A� along x-axis.·
Example: pendulum making an angle with vertical, force = weight of pendulum F� pointing
downwards: then the physically important quantities are the components of F� along tangential
direction (causes pendulum’s motion), and along normal direction (causes string tension).
Area. E.g. of a polygon in plane: break into triangles. Area of triangle = 1 base × height = 2
1 |A�||B�| sin θ (= 1/2 area of parallelogram). Could get sin θ using dot product to compute cos θ and2
sin2 + cos2 = 1, but it gives an ugly formula. Instead, reduce to complementary angle θ� = π/2 − θ
by considering A�� = A� rotated 90◦ counterclockwise (drew a picture). Then area of parallelogram
= |A�||B�| sin θ = |A��||B�| cos θ� = A�� · B�.
Q: if A� = �a1, a2�, then what is A��? (showed picture, used ﬂashcards). Answer: A�� = �−a2, a1�.
(explained on picture). So area of parallelogram is �b1, b2� · �−a2, a1� = a1b2 − a2b1.
a1 a2Determinant. Deﬁnition: det( � B) = A, � = a1b2 − a2b1. b1 b2
Geometrically:
 a1 a2
b1 b2
= ± area of parallelogram.
     sign of 2D determinant has to do with whether B� is counterclockwise
or clockwise from

A�,
 without details.
Determinant in space: det( � B, �A, � C) =
a1 a2 a3
b1 b2 b3
c1 c2 c3
= a1
b2 b3
c2 c3
− a2
b1 b3
c1 c3
+a3
b1 b2
c1 c2
.
Geometrically: det( � B, �A, � C) = ± volume of parallelepiped. Referred to the notes for more about
determinants.
Cross-product. (only for 2 vectors in space); gives a vector, not a scalar (unlike dot-product).
ˆı ˆj kˆ a2 a3 a1 a3 + kˆ
 a1 a2A� × B� =
 = ˆı
 − ˆj
Deﬁnition:
 a1 a2 a3 .
b2 b3 b1 b3 b1 b2b1 b2 b3
(the 3x3 determinant is a symbolic notation, the actual formula is the expansion).
Geometrically: |A� × B�| = area of space parallelogram with sides A�, B�; direction = normal to
the plane containing A� and B�.
How to decide between the two perpendicular directions = right-hand rule. 1) extend right hand
in direction of A�; 2) curl ﬁngers towards direction of B�; 3) thumb points in same direction as A�× B�.
   ˆı × ˆj =? (answer: kˆ, checked both by geometric description and by
calculation).
Triple product: volume of parallelepiped = area(base) · height = |B� × C�| (A� · nˆ), where ˆn =
B� × � |B� × �| � · (B� × C�) = det( � B, �C/ C . So volume = A A, � C). The latter identity can also be checked
directly using components.
The
Flashcard Question:
