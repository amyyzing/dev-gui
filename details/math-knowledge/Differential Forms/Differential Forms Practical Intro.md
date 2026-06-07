# Differential Forms Practical Intro

Source title: A Practical Introduction to

Converted from: `16.pdf`


## Page 1

A Practical Introduction to
Diﬀerential Forms
William C. Schulz
and
Alexia E. Schulz
September 10, 2012
Transgalactic Publishing Company
Flagstaﬀ, Vienna, Cosmopolis


## Page 2

ii
c⃝ 2012 by William C. Schulz and Alexia E. Schulz


## Page 3

Contents
iii


## Page 4

iv CONTENTS


## Page 5

Chapter 1
Introduction and Basic
Applications
1


## Page 6

2 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
1.1 INTRODUCTION
These notes began life as an introduction to diﬀerential forms for a mathematical
physics class and they still retain some of that ﬂavor. Thus the material is
introduced in a rather formal manner and the mathematical complexities are
put oﬀ to later sections. We have tried to write so that those whose primary
interest is in the applications of diﬀerential forms can avoid the theoretical
material provided they are willing to accept the formulas that are derived in
the mathematical sections, which are clearly marked as such. Those who wish
may read the mathematical sections as they occur, or later, or indeed may put
them oﬀ to a more convenient time, perhaps in a future life, without loss to the
continuity of the applied thread. Anyway, such is my hope. But we want to also
emphasize that those who wish will ﬁnd all the mathematical details available, at
a level of rigor usual to the better mathematical physics books. The treatment
is mostly local, and what little manifold theory is needed is quietly developed as
we go. We have tried to introduce abstract material in circumstances where it
is useful to do so and we have also tried to avoid introducting a lot of abstract
mathematical material all at one time.
The two areas most completely addressed in these notes, besides the foun-
dational material, are coordinate changes and Maxwell’s equations since we
feel that these illustrate the power of diﬀerential forms quite well. We treat
Maxwell’s equations in both three and four dimensions in separate sections. We
will also look at a few other things.
Notation has been carefully chosen to be consistent with standard tensor
notation to facilitate comparison with such treatments, and to facilitate learning
basic diﬀerential geometry.
The treatment of Maxwell’s equations requires the derivation of the potential
equations. Although not strictly necessary, we have introduced the codiﬀerential
δ and the Laplace operator△dδ+δd since this is the natural route using modern
mathematics. For example we point out that the condition of Lorenz can be
expressed instantly and easily in terms of the codiﬀerntial in four dimensions.
And as long as we have it available we can look at a couple of other applications
of the Laplace operator on forms.
A justiﬁed criticism of these notes might be that many things are done
twice, which is not eﬃcient. We have sacriﬁced eﬃciency for convenience to the
reader who may wish to deal with only one particular thing, and so would like a
relatively complete treatment in the section without having to read ﬁve others.
Similarly, many formulas are repeated at the beginning of sections where they
are used, rather than referred to in previous sections. The increase in paper is
rather small, and for those getting it electronically there is no waste at all. It
is diﬃcult for a mathematician to resist the call of generality but since one of
us is a physicist the brakes have been applied, and we hope that the product is
a reasonable compromise between the siren song of mathematics and the needs
of practical physics.


## Page 7

1.2. SOME CONVENTIONS 3
1.2 Some Conventions
Here we will introduce some conventions that will be used throughout these
notes. The letter A will be used for a region of 2-dimensional space, for example
the unit disk consisting of points whose distance from the origin is less than or
equal to 1. It’s boundary would be the unit circle consisting of points whose
distance from the origin is exactly 1. We will use the symbol ∂ to indicate the
boundary. Thus if A is the unit disk A ={x∈ R2||x|≤ 1} then the boundary
of A is ∂A ={x∈ R2||x| = 1} which is the unit circle. Notice carefully the
diﬀerence between the terms DISK and CIRCLE. (DISK and CIRCLE are often
confused in common speech.)
The letter M will be used for a (solid) region of 3 dimensional space, for
example the unit ball, M ={x∈ R3||x| ≤1} whose boundary is the unit
sphere ∂M ={x∈ R3||x| = 1}. (The terms BALL and SPHERE are often
confused in common speech, particularly in cases like a beach ball or a basketball
since they are ﬁlled with air.)
The letter S will be used for a (2 dimensional) surface in three dimensional
space, for example the upper half of the unit sphere. The boundary of this S
would be a circle in the x,y plane.
If we do not wish to specify dimension, we will use the letter K. The use of
K indicates that the formula will work in any dimension, and this usually means
any dimension, not just 1, 2 or 3 dimensional space. Naturally ∂K means the
boundary of K.
The ball and sphere have analogs in every dimension. It is customary to
refer to the ball in Rn is the n-ball and its boundary as the ( n− 1)-sphere.
For example, the unit disk is the 2-ball and its boundary, the unit circle, is
the 1-sphere. Note that the m-sphere lives in Rm+1. It is called the m-sphere
because it requires m variables to describe it, like latitude and longitude on the
2-sphere.
Also useful to know are the terms open and closed. This is a tricky topo-
logical concept, so we will treat it only intuitively. K is closed if it includes
its boundary. Thus the unit disk and unit ball are closed. If we remove the
boundary∂K fromK the resulting setK◦ is called open. Thus for the unit ball
in R3 we have
M = {x∈ R3||x|≤ 1} closed 3-ball
M◦ = {x∈ R3||x|< 1} open 3-ball
∂M = {x∈ R3||x| = 1} 2-sphere
We want to give a real world example here but remember it must be inex-
act since real world objects are granular (atomic) in constitution, so can only
approximate the perfect mathematical objects. Some people prefer to eat the
closed peach (with fuzzy skin), some people prefer the open peach (fuzzy skin
removed, peach◦) and the boundary of the peach, ∂peach, is the fuzzy skin.
Perhaps this will help you remember. Deeper knowledge of these matters can
be found in the wonderful book [ ?] and also [ ?].


## Page 8

4 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
For functions we will use a slightly augmented variant of the physics conven-
tion. When we write f :S→ R we mean a function whose input is a pointp∈S
and whose output is a real number. This is theoretically useful but not suitable
for calculation. When we wish to calculate, we need to introduce coordinates. If
we are dealing with the upper half of the unit sphere (set of points in R3 whose
distance from the origin is exactly one and for whichz≥ 0) then we might write
f(x,y ) if we choose to represent points in the x,y coordinate system. Notice,
and this is an important point, that the coordinate x takes as input p∈S and
outputs a real number, it’s x coordinate. Hence the coordinates x and y are
functions just like f. If S is the upper half of the unit sphere in R3 then x
and y are not really good coordinates. It would be be better to use longitude
and colatitude for my coordinates and then we would write f(φ,θ ). 1 Note
use of the same letter f no matter what the coordinate system, because the f
represents a quantity in physics, whereas in math it represents a functional re-
lationship and we would not use the same letter for diﬀerent coordinates. Note
also that f(.5,. 5) is ambiguous in physics unless you have already speciﬁed the
coordinate system. Not so with the math convention.
Finally, we will almost always use the lettersf,g,h for functions onA,M,S,K .
Mostly these will occur in coordinate form, for example f(x,y,z ) for a function
on M.
1.3 Some Formulas to Recall
You are all familiar with the dx,dy,dz which occur in the derivative notation
dy
dx and the integral notation
∫
M
f(x,y )dxdy
∫
M
f(x,y,z )dxdydz
and you recall the Green, divergence and Stokes theorems, which I list here for
convenience:
Green’s theorem
∫
∂A
f(x,y )dx +g(x,y )dy =
∫
A
∂g
∂x− ∂f
∂y dxdy
The divergence theorem or Gauss’s theorem
∫
∂M
f(x,y,z )dydz +g(x,y,z )dzdx +h(x,y,z )dxdy =
∫
M
∂f
∂x + ∂g
∂y + ∂h
∂z dxdydz
1BEW ARE. φ is longitude in physics but colatitude in mathematics. θ is colatitude in
physics but longitude in math.


## Page 9

1.3. SOME FORMULAS TO RECALL 5
The Classical Stokes’ theorem
∫
∂S
f(x,y,z )dx +g(x,y,z )dy +h(x,y,z )dz
=
∫
M
(∂h
∂y− ∂g
∂z
)
dydz +
(∂f
∂z− ∂h
∂x
)
dzdx +
(∂g
∂x− ∂f
∂y
)
dxdy
You might be more familiar with the last two in the vector forms
∫
∂M
v· dS =
∫
M
div vdV
and ∫
∂S
v· dℓ =
∫
S
curl v· dS
There are some conventions on integrals that we will mention now. In for-
mer times when integrating over a three dimensional object we would write∫ ∫ ∫
M div vdV This is now completely antiquated, and we will not do it.
On the other hand, there is a convention that when integrating around curves
or surfaces that have no boundary we put a small circle on the integral, so that
we write ∮
∂M
v· dS for
∫
∂M
v· dS
Since this is favored by the physics community we will mostly use it. Notice that
if a geometric object is the boundary of something, then it itself has no boundary,
and so we will use the circled integral almost exclusively with boundaries.
For our purposes we will deﬁne a diﬀerential form to be an object like
f(x,y )dx f (x,y,z )dydz f (x,y,z )dxdydz
which we ﬁnd as integrands in the written out forms of the Green, divergence
and Stokes theorem above. If ω is a sum of such objects it turns out that the
three theorems collapse to one mighty theorem, called the generalized Stokes
theorem, which is valid for all dimensions:
∮
∂S
ω =
∫
S
dω
To use this theorem and for other purposes it is only necessary to
1. Learn the algebra that the dx, dy, dzsatisfy which is almost the same as
ordinary algebra with one important exception.
2. Learn the rule for the operator d which is almost trivial.
Once these are learned diﬀerential forms can be manipulated easily and with
conﬁdence. It is also useful to learn how various things that happen in vector
analysis can be mimicked by diﬀerential forms, and we will do this, naively at
ﬁrst and then in much more detail.


## Page 10

6 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
If you are concerned about what diﬀerential forms ARE, the answer is a
little tricky and we am going to put it oﬀ for the moment. Later we will
discuss the surprisingly dull answer to this question. Incidentally, the diﬃculty
in explaining what they really are is one reason they have not become more
common in elementary textbooks despite their extreme usefulness.
Just to give a tiny hint of the geometrical interpretation of diﬀerential forms.
A two form measures the density of lines of force of a ﬁeld, as introduced by
James Faraday a century and a half ago. For more on this subject see [ ?] or [?].
We will discuss it a bit more when we have more equipment.
1.4 Coordinate systems
Our ﬁrst job is to talk a little about coordinates. You already know most of this
so we can do it quickly. As already speciﬁed, we will use the notation A for a
ﬁnite region in R2 (which is the standard notation for ordinary two dimensional
real space). We will use M for a three dimensional ﬁnite region of R3 and S
for a curved surface in R3. Standard coordinates for A would be x, y, but we
might want to use polar coordinates r, θor even more general coordinates u, v.
The important thing for A is that there be two coordinates and that they be
”independent”, so that v is not a function of u.
In the case of M, a three dimensional region of R3, we will need three
coordinates x,y,z or r,θ,φ or more generally u,v,w to describe it.
Since S is a surface in R3, it will be described by two coordinates. In
elementary cases this will often be x,y but in more complicated situations it is
often wise to taylor2 the coordinates to the geometric object, for example if one
is working with the Unit Sphere in R3 then the appropriate coordinates would
be θ,φ (longitude and colatitude). Proper choice of coordinates can make a
nasty problem much more pleasant.
It is important to be able to move from one coordinate system for a geometric
situation to a diﬀerent coordinate system and we will discuss this later.
1.5 The Algebra of Diﬀerential Forms
We now begin our discussion of the algebra of diﬀerential forms. The type of
multiplication we will use is called exterior multiplication. The term goes back
to Grassmann and he invented it to contrast with interior multiplication, which
is what we now refer to as the inner product. The multiplication symbol used
is∧ as in dx∧dy but this is very often omitted. We will use it for a while,
and then omit it when we get bored with it, but return to using it whenever we
think it clariﬁes matters.
Let us start with a function in f(x,y,z ) on R3. You already know how to
2bad pun


## Page 11

1.5. THE ALGEBRA OF DIFFERENTIAL FORMS 7
form df:
df = ∂f
∂xdx + ∂f
∂y dy + ∂f
∂z dz
Recalling that, like f, the coordinate x is also a function on R3 the previous
formula writes the diﬀerential off in terms of the diﬀerentials of the threespecial
functions x,y,z . So we note that there is not much diﬀerence between df and
dx; they are the same kind of object. All objects of this type (diﬀerentials of
functions) are collected together in the set
Λ1(R3)
and are called 1-forms.
If we multiply a couple of these together we get objects like
fdx∧gdy =fgdx ∧dy∈ Λ2(R3)
Note that functions f commute withdx: fdx =dxf ; see below. Linear combi-
nations of such objects are called 2-forms. And of course there are 3-forms
fdx∧dy∧dz∈ Λ3(R3)
To complete the system we will place the functions in the basement of the
building: f∈ Λ0(R3). It is customary to omit the wedge when multiplying by
a function; we write
fdx∧dy for f∧dx∧dy
There is no signiﬁcance to this; it is just convention.
The algebra of these objects is just like ordinary algebra except for the
changes caused by the rule
dg∧df =−df∧dg (anti-commutativity)
for the 1-forms df and dg. An algebra satisfying this rule is called an exte-
rior or Grassmann algebra. This algebra was invented by Hermann Guenther
Grassmann about 1840 in an attempt to ﬁnd an algebra mirroring elementary
geometry. It is suﬃcient to postulate this rule for the coordinate diﬀerentials
only,
dy∧dx =−dx∧dy etc.
since the general rule will follow by linearity.
Thus the exterior algebra is not commutative. Our rule is often called anti-
commutative and is the simplest generalization of commutative, but it has many
consequences which seem strange to the beginner. For example, if we substitute
f for g in the rule dg∧df =−df∧dg we get
df∧df =−df∧df


## Page 12

8 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
so moving the right side to the left side by the usual algebraic processes which
are all valid here we get
df∧df +df∧df = 0
2df∧df = 0
df∧df = 0
Thus the product of a one form with itself is 0, which is very important. Let’s
look at another example
(fdx +gdy )∧ (fdx +gdy ) = ffdx∧dx +fgdx ∧dy +gfdy∧dx +ggdy∧dy
= 0 + fg (dx∧dy +dy∧dx) + 0
= fg 0 = 0
as promised.
We also see from this that there are no four forms in 3-space, since if we
multiply four of the objects dx,dy,dz together there will be a repetition which
will kill the form:
dx∧dy∧dz∧dx =−dx∧dy∧dx∧dz =dx∧dx∧dy∧dz = 0∧dy∧dz = 0
In general, for a space K of dimension n there will be forms ω∈ Λj(K) for
j = 0,...,n . It is not true in general that for r-forms ω with r ≥ 2 that
ω∧ω = 0 although this is fortuitously true for dimensions n≤ 3. There is an
example in dimension 4 where ω∧ω̸= 0 in the problems.
Now let us start to deal a little more abstractly, so we will use a region K
of dimension n, and consider ω∈ Λj(K) and η∈ Λk(K). Then a little thought
shows that
η∧ω = (−1)jkω∧η
For example, with ω =dx∈ Λ1(R3) and η =dy∧dz∈ Λ2(R3) we have
(dy∧dz)∧dx = dy∧dz∧dx
= −dy∧dx∧dz
= dx∧dy∧dz
and if you look at how this special case works you will see why the general case
works.
Note that nothing prevents us from mixing things up as in
2dx + 3dx∧dy
but such things do not occur in practise. Forms where each term has the same
number of diﬀerentials (forms of the same degree) are called homogeneous, and
we almost always use homogeneous expressions.


## Page 13

1.6. THE OPERATOR D 9
1.6 The Operator d
Our next project is the diﬀerential operator d, which we introduce according to
the following four rules, where K is a space with coordinates u1,...,u n:
d is the unique operator that satisﬁes the following laws
1. d is a linear operator
2. On the functions Λ 0(K), df is given by the advanced calculus formula
df = ∂f
∂u1 du1 +... + ∂f
∂un dun
3. if ω∈ Λj(K) and η∈ Λk(K) then (Leibniz’s Rule)
d(ω∧η) =dω∧η + (−1)jω∧dη
4. dd = 0 (and thus ddf = 0 and ddui = 0)
We have used coordinates u1,...,u n rather than x1,...,x n to emphasize
that these coordinates need not be rectangular or even orthogonal.
Let’s look at some examples in 3-space of how these rules make everything
work. First we examine d(fdx). Since f∈λ0(R3) we have, using rule 3,
d(fdx ) =df∧dx + (−1)0f∧ddx =df∧dx + 0
we also used rule 4, ddx = 0, in the last equation. This derives the practical
rule in a special case, and the general case (see problems) will be the same.
d(fdx i1∧... ∧dxik) =df∧dxi1∧... ∧dxik
This is the practical rule for d and the one you will use for almost everything
you do, so learn it well.
Now let ω =fdx and η =gdy . Then we have
d(fdx∧gdy ) = d(fdx )∧gdy + (−1)1fdx∧d(gdy )
= ( df∧dx)∧gdy−fdx∧ (dg∧dy)
= dfg ∧dx∧dy +fdg ∧dx∧dy
= ( dfg +fdg )∧dx∧dy
= d(fg )dx∧dy
just as we expected from the practical rule since fdx ∧gdy = fgdx ∧dy.
This also illustrates how rule 2 is a generalization of Leibniz’s formula for the
derivative of a product.


## Page 14

10 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
1.7 Orientation
At this point we must deal with one of the less pleasant aspects of elementary
geometry which is orientation. An orientation, to speak loosely, is a sense of
twist in a space. For example, in R2 our standard sense of twist is counter-
clockwise; we measure angles from th x axis in the direction of the y axis. If we
reverse either axis, we get the opposite twist. If the y axis went down instead
of up then we would measure angles in a clockwise direction and R2 would have
the opposite orientation. If we reverse both axes then the sense of twist returns
to counterclockwise.
In R3 the standard orientation is given by the following rule: if you place
the ﬁngers of your RIGHT hand so that the ﬁngers curl from the x to the y
coordinate axes then your thumb points in the direction of the z axis. This
is called the right hand rule . It has become standard to use this in Calculus
books only since the 1940’s, and the opposite convention is still found in Italian
books, so it is wise to check. To appreciate the subtlety of this concept, think
of trying to communicate it to inhabitants of a planet in another galaxy. Since
nature is almost symmetric in terms of left and right, the only way we know to
clarify this is certain non-symmetric aspects of beta decay. This is referred to
in physics as parity. Hopefully parity properties remain the same from galaxy
to galaxy.
This idea of orientation, though subtle, is strongly coupled with diﬀerential
forms and is the reason for the anticommutativity. It also is a prime source of
mistakes, and great care must be taken to keep things in correct order. In R2
(and it’s subspaces) the correct order, which expresses the orientation properly,
is dx∧dy. Thus dy∧dx is in incorrect order as indicated by the minus sign in
dy∧dx =−dx∧dy
Recall that when using Green’s theorem
∮
∂A
f(x,y )dx +g(x,y )dy =
∫
A
∂g
∂x− ∂f
∂y dxdy
it is critical that the direction around the boundary of the left integral be coun-
terclockwise. If it is taken clockwise then the two sides of the equation will have
opposite signs. This is again due to the orientation which is built into R2 but
which we seldom notice explicitly. There are similar worries in the use of the
divergence theorem and Stokes theorem.
In applications, the principal place where orientation occurs in Rn is in n-
forms and ( n− 1)-forms. We will ﬁrst tell you the the general formula and
then give you practical methods to make orientation (relatively) easy to deal
with. Let the variables used in Rn be u1,u 2,...,u n. (We have switched from
x1,x 2,...,x n to u1,u 2,...,u n to emphasize that the variables can be general;
not necessarily rectangular or orthogonal.) The use of superscripts to number
the variables is to conform to tensor analysis standards and we don’t need to go
into the reasons for it here; just do it! And remember u3 is the third variable,


## Page 15

1.7. ORIENTATION 11
not the cube of u. If we choose an order for the variables, which we did by
numbering them, this chooses one of the two orientations. Then
du1∧du2∧... ∧dun is in correct order
du2∧du1∧... ∧dun is in incorrect order
because
du2∧du1∧... ∧dun =−du1∧du2∧... ∧dun
As you can see with a little practice, interchanging any two of the dui reverses
the sign and changes correct to incorrect order or incorrect to correct order. If
you are familiar with permutations, odd permutations of du1∧du2∧... ∧dun
give incorrect order and even permutations give correct order.
That part is easy. The tricky part is the ( n− 1)-forms. Here the correct
order is (with dui missing from the list)
(−1)i−1du1∧... ∧dui−1∧dui+1∧... ∧dun
The reason for this choice is so that
dui∧ ((−1)i−1du1∧... ∧dui−1∧dui+1) =du1∧... ∧dun
which is correct because thedui must hop over then−1 elementsdu1,...,du i−1
in order to get back into correct order and each hop contributes a minus sign.
So much for theory. In R3 correct order is
dx∧dy∧dz correct order
and for 2-forms we have
dy∧dz, −dx∧dz, dx ∧dy correct order
For practical use it is much better to write these in cyclic order. 3
dy∧dz, dz ∧dx, dx ∧dy correct order
and the correct order can be easily remembered by writing
dxdydzdxdydz
and noting that the order of a wedge of two diﬀerentials is correct if it occurs
in this list, for example dz∧dx is correct but dx∧dz is incorrect since dxdz
does not occur in the list. Other incorrects are dy∧dx anddz∧dy. The use of
diﬀerential forms in R3 relies critically on writing things with correct order.
3Cyclic order is a 3-space concept and does not generalize to n-space at all well.


## Page 16

12 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
1.8 Diﬀerential Forms and Vectors
Standard 3-dimensional vector analysis was cobbled together by Josiah Willard
Gibbs in the 1890s using pieces from a variety of sources. While it works well for
many practical purposes it has large deﬁciencies from a theoretical standpoint.
Those parts of it which concern the dot (scalar) product are ﬁne, but those parts
which concern the cross (vector product v× w) are mathematically clumsy. To
see this, consult any textbook for a proof of the vector triple product law
u× (v× w) = (u· w)v− (u· v)w
It is often said that the cross product cannot be generalized to higher dimensions
but this is not true; what is true is that the analog of the cross product in n
dimensions involves not two but n− 1 vectors. Thus the elementary geometric
applications of the cross product can often be reproduced, but the physical
applications not so much, which is the reason that for relativity (4 dimensions
and space-time rather than just space) we must fall back on Tensor Analysis.
In 3 dimensions there are many formal analogies between diﬀerential forms
and vector analysis. That is, diﬀerential forms will act like vectors in many ways.
It is a little diﬃcult to ﬁnd good mathematical reasons for these analogies and
we will not concern ourselves here with what these reasons might be, although
we will return to the matter later. The practical consideration is that things
will work well if we keep in mind the following rules. For 1-forms we have the
correspondences
dx↔ ˆi dy↔ ˆj dz↔ ˆk
For 2-forms we have the correspondences
dy∧dz↔ ˆi dz∧dx↔ ˆj dx∧dy↔ ˆk
Note that in the second case we have been careful to place the 2-forms in proper
order. This is critical. If you screw this up you will get the wrong sign. Watch
dz∧dx term particularly carefully.
With these correspondences kept in mind, we can easily derive many for-
mulas of vector analysis in simple ways. Many things which appear diﬀerent in
vector analysis can be treated in a uniﬁed way with diﬀerential forms.
1.9 grad, curl and div
In this section we show how the three vector operators grad, curl and div occur
naturally in the context of diﬀerential forms. Since we are in R3 we have 0-forms
(functions), 1-forms, 2-forms and 3-forms. The d operator vanishes on 3-forms
as previously discussed. Hence we look at d on 0-forms, 1-forms and 2-forms.
First 0-forms. Let f be a function (0-form) of the coordinates x,y,z . Then
df is just the old Calculus df:
df = ∂f
∂xdx + ∂f
∂ydy + ∂f
∂zdz


## Page 17

1.9. GRAD, CURL AND DIV 13
and we see here the components of the gradient
gradf =
(∂f
∂x,∂f
∂y,∂f
∂z
)
Next we do 1-forms where we omit terms that are 0:
d(fdx +gdy +hdz ) = df∧dx +dg∧dy +dh∧dz
=
(∂f
∂x dx + ∂f
∂y dy + ∂f
∂z dz
)
∧dx
+
(∂g
∂x dx + ∂g
∂y dy + ∂g
∂z dz
)
∧dy
+
(∂h
∂x dx + ∂h
∂y dy + ∂h
∂z dz
)
∧dz
= ∂f
∂y dy∧dx + ∂f
∂z dz∧dx
+ ∂g
∂x dx∧dy + ∂g
∂z dz∧dy
+ ∂h
∂x dx∧dz + ∂h
∂y dy∧dz
=
(∂h
∂y− ∂g
∂z
)
dy∧dz
+
(∂f
∂z− ∂h
∂x
)
dz∧dx
+
(∂g
∂x− ∂f
∂y
)
dx∧dy
Now recall that if v =fi +gj +hk then
curl v =
⏐⏐⏐⏐⏐⏐
i j k
∂
∂x
∂
∂y
∂
∂z
f g h
⏐⏐⏐⏐⏐⏐
=
(∂h
∂y− ∂g
∂z
)
i +
(∂f
∂z− ∂h
∂x
)
j +
(∂g
∂x− ∂f
∂y
)
k
Thus we see we have counterfeited the curl on vectors provided we keep the
2-forms in correct order (so the signs come out right) and we use the correspon-
dence
dy∧dz↔ i dz∧dx↔ j dx∧dy↔ k
Finally, we want to see the diﬀerential forms turn up the divergence. Let
once again v =fi +gj +hk and using the above correspondence let us apply d
to the form fdy ∧dz +gdz∧dx +hdx∧dy. Then we get
d(fdy ∧dz +gdz∧dx +hdx∧dy) = df∧dy∧dz +dg∧dz∧dx +dh∧dx∧dy


## Page 18

14 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
= ∂f
∂x dx∧dy∧dz + ∂g
∂y dy∧dz∧dx
+ ∂h
∂z dz∧dx∧dy
=
(∂f
∂x + ∂g
∂y + ∂h
∂z
)
dx∧dy∧dz
and we see div v as the coeﬃcient of dx∧dy∧dz. Of course dx∧dy∧dz
corresponds to dV in vector analysis. We will have much more to say about
the relations between these operators and diﬀerential forms in the section on
change of coordinates.
1.10 The Poincar´ e Lemma and it’s Converse
Of the many theorems about diﬀerential forms, the three most important are the
converse of the Poincar´ e lemma, Stokes’ theorem and the Frobenius theorem.
Here we treat the Poincar´ e lemma; Stokes’s theorem will be treated in the next
section.
The Poincar´ e lemma was used by Poincar´ e in his work on the Calculus of
Variations. It is very simple; it says that ifω is a diﬀerential form thenddω = 0.
Let us see why this works for functions. We will do it in R3 space but it works
the same in any dimension.
df = ∂f
∂x dx + ∂f
∂y dy + ∂f
∂z dz
ddf =
( ∂2f
∂y∂z − ∂2f
∂z∂y
)
dy∧dz +
( ∂2f
∂z∂x− ∂2f
∂x∂z
)
dz∧dx
+
( ∂2f
∂x∂y− ∂2f
∂y∂x
)
dx∧dy
= 0
because of the equality of mixed partials: ∂2f
∂y∂z = ∂2f
∂z∂y . It is worth noticing that
this is one of the places where we need the functions to have two continuous
derivatives to guarantee this equality.
So much for the easy stuﬀ. The converse of the Poincar´ e Lemma says that
if ω is a diﬀerential form and ω∈ Λr(K) then there exists a diﬀerential form
α∈ Λr−1(K) for which dα = ω. Sadly the converse is not true in general. To
be sure it is true, we need to know that K is not too complicated a region.
Speciﬁcally we need to know that K is simply connected. This will be a new
concept for most of you. We will try to clarify it with some examples which are
of importance in themselves.
First let us look at the unit disk in R2 which is all the points in R2 whose
distance from the origin is less than or equal to 1. We will call this D0(1). Let
us draw a curve (say a circle of radius 1/2) then we may ”shrink” the curve in a
continuous manner until is down to just a point. (The technical terminology is


## Page 19

1.10. THE POINCAR ´E LEMMA AND IT’S CONVERSE 15
that the curve is homotopic to a point.) A simple closed curve is a continuous
curve with no end points and no intersections with itself. It should be intuitively
clear that any simple closed curve in D0(1) can be shrunk to a point.
For contrast, consider the annulus consisting of points in R2 that have dis-
tance from the origin less than or equal to 1 and greater than or equal to 1/2.
For this regionK some simple closed curves can be shrunk to points and others
(those that go round the central ”hole”) cannot be shrunk to points. As a third
example consider the unit disk with just the center removed. Then, exactly like
the annulus where a whole disk was removed, a curve round the origin cannot
be shrunk to a point, because the point we need, the origin, is not in K.
Def A region K is simply connected if and only if any simple closed curve in K
can be shrunk to a point in K.
A few more examples, this time in R3. A ball (solid sphere) is simply con-
nected, as is also a ball with the center removed. However, a ball around the
origin with the z axis removed is not simply connected and neither is the whole
of R3 with the z axis removed. The unit sphere (points in R3 at unit distance
from origin) is simply connected. (Note the contrast to the unit circle in R2
which is not simply connected.
These kinds of considerations are called topological, and there is a wonderful
branch of mathematics which studies such things called topology. Due to the
enormous amount of material needed in an engineering curriculum, it is not
customary for topology to be included, but if you wish to learn more we rec-
ommend the books [ ?] and [?], which are speciﬁcally written with the engineer
and physicist in mind.
Now that we know some topology, we can state the theorem:
Theorem (Converse of Poincar´ e Lemma) LetK be a simply connected region
and ω∈ Λr(K) and dω = 0. Then there is an α∈ Λr−1(K) such that dα =ω.
It should be mentioned that the α is highly non-unique; there are many α’s
that will work.
In the problems we will see examples where the region is not simply con-
nected and, thoughdω = 0 there is noα for whichdα =ω. Practically speaking,
this usually takes the form of α being multi-valued, like√x, and thus not being
a proper function. In this case, we can often manage to get some use out of the
multi-valued function provided we restrict our attention to a simply connected
subregion. The vector potential of the magnetic ﬁeld of an inﬁnite vertical
current carrying wire is the paradigm example and we will look at it in the
problems.
Next we will derive two popular theorems of vector analysis (in R3) from
the converse of the Poincar´ e lemma.
For the ﬁrst we again let v =fi +gj +hk and we suppose that curl v = 0.
We then form the corresponding diﬀerential 1-formω =fdx +gdy +hdz . From
the results of the last section, we see that the condition curl v = 0 translates
into the condition dω = 0. Assuming the region K⊆ R3 is simply connected


## Page 20

16 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
we may conclude that there is a 0-form (function) k for which dk =ω, that is
dk = ∂k
∂x dx + ∂k
∂y dy + ∂k
∂z dz = fdx +gdy +hdz
Translating back into vector notation we have
∂k
∂x i + ∂k
∂y j + ∂k
∂z k = fi +gj +hk
grad f = v
We have thus proved the vector analysis theorem
Corollary Over a simply connected region K ⊆ R3 a curl free vector is a
gradient.
There is a very similar theorem which you will prove in the problems. It
reads
Corollary Over a simply connected region K⊆ R3 a divergence free vector is
a curl.
More explicitly, if div v = 0 then there is a vector w so that curl w = v.
Although formulas for ﬁnding the objects whose existence is asserted exist,
they are of no great practical utility and we will not discuss them.
Other formulas which are easily derived at this point and which you will
derive in the problems are
curl grad k = 0
div curl v = 0
These are both consequences of dd = 0 which you probably already ﬁgured out.
Also available are results about path independent line integrals which we will
look at in the problems.
1.11 Boundaries
Before we can deal with Stokes theorem we must talk a bit about boundaries
and their orientation, and also how to compute integrals of diﬀerential forms.
The boundary of a area or surface is simply its edge. We will be satisﬁed
with an intuitive understanding of this and not go into the topological details.
The symbol of the boundary of a region or surface K is ∂K. For example the
boundary of the unit disk in R2 is the unit circle, and the boundary of the upper
half of the unit sphere in R3 is the unit circle in thex,y -plane. The boundary of
the unit ball in R3 is the unit sphere. It is common for there to be no boundary;
the boundary of the unit sphere in R3 is empty, which we write ∂S(0, 1) =∅
where∅ is the empty set.
For Stokes theorem it is important that the boundary ∂K be oriented cor-
rectly relative to K itself. We will do this with examples, but the methods are


## Page 21

1.11. BOUNDARIES 17
selected so that they work in any dimension. If K is n-dimensional in n-space,
like A or M then it inherits an orientation from the n-space, that determined
by the order x,y for A or x,y,z for M and analogously for higher dimensions.
To orient the boundary of such regions, which necessarily is described by n− 1
parameters, one uses the exterior normal vector ˆn toK so that ˆn followed by the
parameters has the same orientation asK. (We will clarify this with examples.)
This gives an order to the parameters which is then the order used below in the
integrals. There is no way to get around the fact that this is a bit tricky.
For out ﬁrst example let A be the unit disk in R2, with boundary the unit
circle and parameter t for the unit circle. Let r(t) trace out the unit circle.
Then
ˆT =
dr
dt⏐⏐dr
dt
⏐⏐
is the unit tangent vector . There are two directions one may go along a curve,
and the parameterization must be chosen so that ˆn, ˆT has the same orientation
as x,y . This amounts to, ﬁrst, the angle from ˆn to ˆT is a positive right angle,
and second that as t increases we trace the boundary counterclockwise around
A. So this comes down to just going around A counterclockwise.
ForM the situation is more diﬃcult to see since the boundary will be two
dimensional. Suppose the parameters are u and v. Let the surface be given
by r(u,v ). Then when we increase u and hold v ﬁxed, a curve will be traced
out in certain direction and it will have tangent vector ru = ∂r
∂u pointing in
that direction. Similarly for rv. Then the requirement is that ˆn, ru, rv have the
same orientation as x,y,z . If the orientation is opposite, reverse the order of
the parameters u and v.
On a practical note, one usually ﬁnds the ˆn for ∂M by forming
ˆn = ru× rv
|ru× rv|
so that one really has only to check whether this ˆn is pointing in or out of M
and if it is pointing in change the order of u andv. Also, one does not actually
have to calculate ru× rv, only ﬁgure out its direction.
As an example, take the upper half of the unit sphere and let us use for
coordinates longitude φ and colatitude θ. A tangent vector to a phi curve goes
to the ﬁght (looking at the sphere from outside) and a tangent vector to the
θ curve goes down. Crossing these gives a vector pointing in so we have the
wrong order: the order should be θ,φ not φ,θ . Any 2-forms that occur should
thus be presented as f(θ,φ )dθ∧dφ. This will be critically important when we
form integrals.
Also as a practical matter, for ∂M ⊂ R3 one often uses two of x,y,z as
parameters. If this is the case, the proper orders are dy∧dz, dz∧dx, dx∧dy
as one can determine by using the above rules.
The last case we are going to discuss isS, the surface in R3. If the surface has
no boundary then the situation is just that of ∂M above (practically speaking)
and we have already covered the situation; an example would be the unit sphere.


## Page 22

18 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
However, if the surface has a boundary, then there is no obvious way to decide
which way the normal should point. Mathematically one just has to choose
oneself either a direction for the normal ˆn or, equivalently, and order for the
coordinates u,v . Physically there may be an obvious way to make the choice.
Make sure that your ˆn is consistent with your choice of u,v so that ˆn, ru, rv is
oriented like x,y,z . Once this is settled it only remains to orient the boundary
∂S. Since ∂S is one dimensional, it is only a question of choosing which way to
go around it. Here is the rule.
Walk around the boundary of the surfaceS with your body pointing the same
way as ˆn and your LEFT hand pointing toward the surface. The direction your
are walking is the correct orientation of the boundary.
This is the orientation you must use for the correct application of Stokes
theorem. If you mess it up the sign will be wrong.
Of course in physics the sign often comes out wrong, and one just reverses
it at the end. Still, it is reassuring when it comes out right without human
intervention.
1.12 Integrals of Forms
This is extremely simple. First, the integrals of forms must be taken over regions
of the same dimension as the degree of the form. Thus
a 1-form must be integrated over a curve C
a 2-form must be integrated over a surface S or A
a 3-form must be integrated over a region M
To calculate the integral we recall that in a multiple integral the order of the
diﬀerentials doesn’t matter but for forms the order matters, as the sign will
change if two diﬀerentials are interchanged. The calculation of an integral is
reduced to three steps.
1. Rearrange the integral so that the diﬀerentials are in correct order.
2. Remove the wedges to get an ordinary multiple integral
3. Calculate the multiple integral by the appropriate iterated integral
This should become clear from an example. We wish to calculate the integral
∫
A
xdy∧dx
whereA is the unit disk in R2. Step 1 is to realize that the diﬀerentials are not
in the right order. We ﬁx.
∫
A
xdy∧dx =−
∫
A
xdx∧dy


## Page 23

1.13. VARIABLE CHANGES 19
Now the diﬀerentials under the integral are in the correct order. Step 2 is to
throw out the wedges
−
∫
A
xdx∧dy =−
∫
A
xdxdy
where the last integral is an ordinary double integral from your advanced cal-
culus course. Step 3 is then to go over to the an iterated integral
−
∫
A
xdxdy =−
∫ 1
−1
∫ √
1−x2
−
√
1−x2
xdxdy
Step 4, which we did not mention above, is then to plug it into your fancy cal-
culator and get the answer. Another method is to calculate the double integral
by switching to polar coordinates
−
∫
A
xdxdy =−
∫ 2π
0
∫ 1
0
(r cosθ)rdrdθ
from which we see immediately that the result is 0.
This pretty much is the whole story. With a modest amount of care this will
come out right.
1.13 Variable Changes
We begin this section with the following observations. Suppose we are calculat-
ing ∫
A
f(x,y )dx∧dy
Now suppose we ﬁnd it convenient to change to polar coordinates or some other
coordinates u,v . Then the old x,y coordinates are functions of the new u,v
coordinates.
x = x(u,v )
y = y(u,v )
Diﬀerential Forms allow us to convert the integral immediately. We have
f(x,y ) = f(x(u,v ),y (u,v )) = ˜f(u,v )
dx∧dy =
(∂x
∂u du + ∂x
∂v dv
)
∧
(∂y
∂u du + ∂y
∂v dv
)
=
(∂x
∂u
∂y
∂v− ∂x
∂v
∂y
∂u
)
du∧dv
Thus ∫
A
f(x,y )dx∧dy =
∫
A
˜f(u,v )
(∂x
∂u
∂y
∂v− ∂x
∂v
∂y
∂u
)
du∧dv


## Page 24

20 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Naturally there are generalizations to higher dimensions. Before we deal with
that, though, we should systematize what we have here. The cleverer students,
or those with really good memories, will recognize that expression in brackets
as the determinant of the matrix
∂(x,y )
∂(u,v ) =
⏐⏐⏐⏐
∂x
∂u
∂x
∂v∂y
∂u
∂y
∂v
⏐⏐⏐⏐
which is called the Jacobian matrix4 of the variable change. Thus we can write
the above equation, with det signifying the determinant, as
∫
A
f(x,y )dx∧dy =
∫
A
˜f(u,v )
(
det∂(x,y )
∂(u,v )
)
du∧dv
Naturally the description ofA will be quite diﬀerent in thex,y andu,v variables.
If we now go over to unoriented integrals, that is ordinary double integrals, we
will have, assuming that x,y and u,v give the same orientation to A,
∫
A
f(x,y )dxdy =
∫
A
˜f(u,v )
(
det∂(x,y )
∂(u,v )
)
dudv
Sincex,y andu,v give the same orientation toA, the determinant in the integral
will have a positive value. If the orientations are reversed, it will all be taken
care of in the oriented integrals but in the ordinary integrals we need to make
the determinant positive, so we have
∫
A
f(x,y )dxdy =
∫
A
˜f(u,v )
⏐⏐⏐⏐det∂(x,y )
∂(u,v )
⏐⏐⏐⏐dudv
This is the famous change of variable formula. In most Calculus books they do
not prove it because the proof without diﬀerential forms is somewhat diﬃcult.
Using diﬀerential forms it is quite easy, as you have seen. The reason for this
is that diﬀerential forms keep control of the orientation, whereas old techniques
have to deal with it in an ad hoc and confusing way.
Everything we have done here in 2 dimensions will work perfectly well in
n-dimensions. Enthusiasts may wish to work it out for 3 dimensions. You will
then see the connection between diﬀerential forms and determinants. We can
assert, with certainty of contradiction, that determinants are important because
they are the coeﬃcients in Grassmann Algebra calculations. We will see more
of this.
1.14 Surface integrals
It is convenient to work out the connection between surface integrals in vector
form and diﬀerential forms at this point, so we have it available for Stokes
theorem. We will work it out for surfaces in R3 but the techniques applied will
4properly pronounced Yacobian, although we know it’s hopeless


## Page 25

1.14. SURFACE INTEGRALS 21
work just as well for ( n− 1)-surfaces in Rn. This is one of the places in the
theory which, while not diﬃcult, is a little tricky.
While it may not be possible to cover the surface with a single coordinate
patch, it is always possible to break up the integral into integrals over each
patch and add them. Hence we only need to work out the formula for a single
coordinate patch.
The standard thing to have to work out for surface integrals is
∫
S
Pdy ∧dz +Qdz∧dx +Rdy∧dz
If we let v =P ˆi +Qˆj +R ˆk then the above is a disguised form of our old friend
from advanced calculus ∫
S
v· ˆndS =
∫
S
v· dS
First we need to get some idea of what dS should be. We will be using the
variablesu,v as coordinates on the surface. If a normal is already available be
sure to pick the order of the variables so that ˆn,du,dv has the same orientation
as x,y,z . The surface will then be described by r(u,v ). If we think of moving
from a point p in the u and v directions we will have vectors
r(u + ∆u,v )− r(u,v ) ≈ ∂r
∂u ∆u
r(u,v + ∆v)− r(u,v ) ≈ ∂r
∂v ∆v
and so the bit of oriented area can be obtained from the cross product
∆S =
(∂r
∂u× ∂r
∂v
)
∆u∆v
Now remembering that
r(u,v ) =x(u,v )ˆi +y(u,v )ˆj +z(u,v ) ˆk
we have
∂r
∂u = ∂x
∂u
ˆi + ∂y
∂u
ˆj + ∂z
∂u
ˆk
∂r
∂v = ∂x
∂v
ˆi + ∂y
∂v
ˆj + ∂z
∂v
ˆk
∂r
∂u× ∂r
∂v =
(∂y
∂u
∂z
∂v− ∂z
∂u
∂y
∂v
)
ˆi +
(∂z
∂u
∂x
∂v− ∂x
∂u
∂z
∂v
)
ˆj
+
(∂x
∂u
∂y
∂v− ∂y
∂u
∂x
∂v
)
ˆk
= ∂(y,z )
∂(u,v )
ˆi + ∂(z,x )
∂(u,v )
ˆj + ∂(x,y )
∂(u,v )
ˆk


## Page 26

22 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Going over from ∆ to d we have at last
dS =
(∂r
∂u× ∂r
∂v
)
dudv
=
(∂(y,z )
∂(u,v )
ˆi + ∂(z,x )
∂(u,v )
ˆj + ∂(x,y )
∂(u,v )
ˆk
)
dudv
Now we also have
ˆn =
∂r
∂u× ∂r
∂v
|∂r
∂u× ∂r
∂v|
Finally we have
∫
S
Pdy ∧dz +Pdz ∧dx +Pdx ∧dy
=
∫
S
P ∂(y,z )
∂(u,v )du∧dv +Q∂(z,x )
∂(u,v )du∧dv +R∂(x,y )
∂(u,v )du∧dv
=
∫
S
(P i +Q j +R k)·
(∂(y,z )
∂(u,v )
ˆi + ∂(z,x )
∂(u,v )
ˆj + ∂(x,y )
∂(u,v )
ˆk
)
du∧dv
=
∫
S
(P i +Q j +R k)·
(∂(y,z )
∂(u,v )
ˆi + ∂(z,x )
∂(u,v )
ˆj + ∂(x,y )
∂(u,v )
ˆk
)
dudv
=
∫
S
v· dS
In the next to the last step we switched from an oriented to an unoriented
integral since everything was carefully set up to be correctly oriented.
We can sweat a little more out of this. The scalar element of area is of course
the absolute value of dS so that
dS =|dS| =
√(∂(y,z )
∂(u,v )
)2
+
(∂(z,x )
∂(u,v )
)2
+
(∂(x,y )
∂(u,v )
)2
dudv
This is itself a very important formula. Also since
ˆn =
∂r
∂u× ∂r
∂v
|∂r
∂u× ∂r
∂v|
we have
dS = ∂r
∂u× ∂r
∂v dudv = ˆn
⏐⏐⏐⏐
∂r
∂u× ∂r
∂v
⏐⏐⏐⏐ dudv = ˆndS
we can write ∫
S
v· dS =
∫
S
v· ˆndS
It would be wise to note that the integrals we have been working with in
this section are often called ﬂux integrals. In contrast, there is another kind of


## Page 27

1.15. THE GENERALIZED STOKES THEOREM 23
surface integral which has little to do with what we are doing. This kind of
integral is not vectorial in nature. They look like
∫
S
f(x,y,z )dS
A problem that utilized this kind of integral would be ﬁnding the center of mass
of a hemispherical shell. We have developed the necessary tools to evaluate
these integrals, although for us this is a side issue and we only mention it since
students should be aware of the two distinct kinds of surface integral.
To evaluate this kind of integral, choose parameter u,v for the surface, (or
a portion of the surface,) and then use the above above formula for dS to get
∫
S
f(x,y,z )dS
=
∫
f(x(u,v ),y (u,v ),z (u,v ))
√(∂(y,z )
∂(u,v )
)2
+
(∂(z,x )
∂(u,v )
)2
+
(∂(x,y )
∂(u,v )
)2
dudv
These kinds of integrals are very sensitive to the choice of parameters, and an
integral that might be extremely diﬃcult with parameters x,y (so that z =
z(x,y )) might be quite easy with, say, θ,φ as parameters.
1.15 The Generalized Stokes Theorem
The generalized Stokes theorem is one of the triumphs of elementary mathemat-
ics, subsuming as it does the fundamental theorem of Calculus, Green’s theorem,
the divergence theorem (= Gauss’s theorem), and the ordinary Stokes’s theo-
rem. Moreover, it is dimension independent; it works as well in 26 dimensions
as in 2 or 3.
Theorem (Generalized Stokes Theorem)
Let K be a oriented subset of Rd of dimension n and let ∂K be the properly
oriented boundary of K. Let ω be an (n-1)-form. Then
∫
K
dω =
∮
∂K
ω
One of the important qualities of this theorem is that it is very easy to
remember. Hence it can be used to write down the Green, divergence and
Stokes’ theorems even if you don’t precisely remember where the signs go; it
ﬁgures that out for you. We will now look at the Green, divergence and Stokes’
theorems one at a time and see how they fall out of the generalized Stokes
theorem. At the end, for fun, we will come back and look at the fundamental
theorem of Calculus, which is tricky because it is too simple.
Green’s theorem Let A⊂ R2 be a region with boundary ∂A oriented coun-
terclockwise. Then∮
∂A
P (x,y )dx +Q(x,y )dy =
∫
K
∂Q
∂x − ∂P
∂y dxdy


## Page 28

24 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Proof Let ω = P (x,y )dx +Q(x,y )dy. Applying the general Stokes’ theorem
we have
∮
∂A
P (x,y )dx +Q(x,y )dy =
∫
∂A
ω
=
∮
K
dω
=
∫
K
d(P (x,y )dx +Q(x,y )dy)
=
∫
K
(∂P
∂y dy∧dx + ∂Q
∂x dx∧dy
)
=
∫
K
(∂Q
∂x − ∂P
∂y
)
dx∧dy
=
∫
K
(∂Q
∂x − ∂P
∂y
)
dxdy
where we used dy∧dx =−dx∧dy and in the last line we used the rule from
converting from oriented integrals to ordinary double integrals.
Notice that it was not necessary for us to remember where the sign goes in
Green’s theorem; our methodology automatically puts it in the correct place.
We will do Stokes’ theorem next since it looks so similar in many ways to
Green’s theorem.
Stokes’ Theorem Let S be a surface in R3 with deﬁnite choice of normal ˆn
and correctly oriented boundary ∂S. Let v =P ˆi +Qˆj +R ˆk Then
∮
∂S
Pdx +Qdy +Rdz =
=
∫
S
(∂R
∂y − ∂Q
∂z
)
dydz +
∫
S
(∂P
∂z − ∂R
∂x
)
dzdx +
∫
S
(∂Q
∂x − ∂P
∂y
)
dxdy
or in vector notation ∮
∂S
v· dl =
∫
S
curl v· ˆndS
Recall that the boundary of S is oriented so that when you walk around the
boundary with your body in the direction of ˆn and your left hand reaching
in toward the surface then you are walking in the direction of the orientation.
(This can be reformulated in terms of ﬁngers and thumb but we ﬁnd this less
confusing.)
Proof: Let ω be the 1-form
ω =Pdx +Qdy +Rdz
Then applying Stokes’ theorem
∮
∂S
Pdx +Qdy +Rdz =


## Page 29

1.15. THE GENERALIZED STOKES THEOREM 25
=
∮
∂S
ω
=
∫
S
dω
=
∫
S
d(Pdx +Qdy +Rdz )
=
∫
S
(∂R
∂y − ∂Q
∂z
)
dy∧dz +
∫
S
(∂P
∂z − ∂R
∂x
)
dz∧dx +
∫
S
(∂Q
∂x − ∂P
∂y
)
dx∧dy
=
∫
S
(∂R
∂y − ∂Q
∂z
)
dydz +
∫
S
(∂P
∂z − ∂R
∂x
)
dzdx +
∫
S
(∂Q
∂x − ∂P
∂y
)
dxdy
=
∫
S
curl v· dS
where we have used the rules governing the transition from oriented to unori-
ented (ordinary) integrals. Recall that in unoriented integrals the order of the
diﬀerentials does not matter, but we have left them in cyclic form as a matter
of good practise. The transition to vector form was discussed in the previous
section.
Now to the divergence theorem. This is quite easy.
The Divergence theorem (Gauss’s theorem) LetM be a region of R3 and
∂M the surface which is its correctly oriented boundary. Then
∮
∂M
Pdydz +Qdzdx +Pdxdy =
=
∫
M
(∂P
∂x + ∂Q
∂y + ∂R
∂z
)
dxdydz
or in vector notation
∮
∂M
v· ˆndS =
∫
M
div vdxdydz
Proof Let ω be the 2-form
ω =Pdy ∧dz
Then applying the generalized Stokes’ theorem
∮
∂M
Pdxdy =
∮
∂M
Pdx ∧dy
=
∮
∂M
ω
=
∫
M
dω
=
∫
M
d(Pdy∧dz)


## Page 30

26 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
=
∫
M
∂P
dx dx∧dy∧dz
=
∫
M
∂P
dx dxdydz
The other two terms are handled similarly. Notice that we have proved slightly
more than the theorem states; we have proved the analog of the theorem for
each term. This can occasionally be useful.
1.16 Curvilinear Coordinates I: preliminary for-
mulas
In this section we will derive formulas for the gradient, curl, divergence and
Laplacian in curvilinear coordinates. This is not nearly as straightforward as
one might expect, but you will not see these troubles because of good organiza-
tion. The central trick in this development is to express each of the diﬀerential
operators in terms of operators that are manifestly coordinate independent.
Each of these operators has a coordinate formulation and when they are put
together the desired expression arises.
Unfortunately the derivation of some of the basic formulas is a little more
conceptual and diﬃcult than most of the material in these notes. To spare
those who are interested only in the results, we have put these derivations into
Chapter 2 (Mathematical Theory). There is also a lower level introduction to
the∗ operator in the section after the Curvilinear coordinate sections.
To express grad, divergence and curl invariantly we need two functions,
Φ :V →V∗ and∗ : Λr(V )→λn−r(V ). Both of these functions are independent
of the choice of the coordinate system, as can be seen in Chapter 2. Although we
are just using these formulas to derive the formulas for curvilinear coordinates,
they have much wider application in modern mathematics, and eﬀort put into
learning them may well pay oﬀ in other circumstances. And you will be glad to
know that in our circumstances there is not much diﬃculty.
We will write the formulas we need in n-space because it is no more diﬃcult
than writing them in 3-space, and indeed some things are actually clearer. Also
it is important to know which things work generally and which things, like curl,
work only in three space.
Letu1,u 2,...,u n be curvilinear coordinates. Then we have a position vector
r and its derivatives which are more or less the base vectors. They require
normalization later, but it would be a big mistake to normalize now.
r = r(u1,...,u n)
ei = ∂r
∂ui
gij = ( ei, ej) = ei· ej
(gij) = ( gij)−1


## Page 31

1.16. CURVILINEAR COORDINATES I: PRELIMINARY FORMULAS 27
We are going to mostly use the parentheses notation ( ei, ej) instead of ei· ej
because it keeps things grouped together better. It is just notation. The gij are
called the metric coeﬃcients and allow one to work with distance an angles in
the coordinates u1,u 2,...,u n. We think of vectors as being based at particular
points which are determined by r. This is an elementary form of the concept
tangent space which we are not going to use.
Any vector v based at r(u1,...,u n) can be expressed in terms of the basis
vectors e1,..., en which are also thought of as being based at r. Thus
v =
n∑
i=1
viei =viei (sum sign ommited)
The sum sign is often omitted when the same letter appears both up and down;
since invented by Einstein it is probably a good idea, but you do need to keep
it in mind. This simpliﬁes the notation considerably.
Next we need a function where you input the vector v and it outputs the ith
coordinate vi. You have known this function for years, but never knew what it
was. It is dui. Thus
dui(v) =vi
This is indeed what dui really is, but with the current organization of the math
curriculum it is not convenient to explain this at the entry level. However, now
you know! Incidentally, it is possible to make this consistent with the idea that
dui is a little bit of ui. It works like this. Nearby points are connected by
vectors which are very short. If v is such a short vector, then vi = dui(v) is
also small. So if we abbreviate dui(v) by dui it will behave as a small number,
sort of. It’s surprising that this works as well as it does.
Sincedui :V → R (and is linear) it is a linear functional and thus dui∈V∗,
where V∗ is the vector space of linear functionals on V . A wedge product of
three dui, for example du1∧du3∧du5 would then be in Λ 3(V∗).
The du1,...,du n are the dual basis to e1,...,e n and form a basis for V∗.
Now we discuss Φ : V →V∗ and Φ−1 :V∗→V . We have
Φ(v) = Φ( viei) = gijviduj
Φ−1(ω) = Φ −1(λidui) = gijωiej
Hereω is an arbitrary element of V∗ and the λi are its coordinates in the basis
du1,...,du n.
Recall that the gij give an inner (dot) product for V and in Chapter two we
show that this may be ”lifted” to V∗. If
λ = λidui λ∈V∗ λi∈ R
µ = µidui µ∈V∗ µi∈ R
then
(λ,µ ) =gijλiµj


## Page 32

28 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
just like
(u, v) =gijuivj
but using the inverse matrix.
Now we digest the information on the∗ operator, which is derived in subse-
quent section and in Chapter 2.
∗dui =
∑
k
(−1)k−1gik√gdu 1∧... ∧duk−1∧duk+1∧... ∧dun
∗∗ω = ( −1)r(n−r)ω for ω∈ Λr(V∗)
Ω0 = √gdu 1∧... ∧dun
∗Ω0 = 1
∗1 = Ω 0
If the coordinates are orthogonal then things simplify. Setting
(ei, ej) = gij = h2
i δij =
{ h2
i for i =j
0 for i̸=j
(dui,duj) = gij = 1
h2
i
δij =
{ 1
h2
i
for i =j
0 for i̸=j
√g = h1h2...h n
We know that a basis for Λr(V∗) is given by
dui1∧dui2∧... ∧duir where i1 <i 2 <··· <i r
Let{k1,...,k n−r} ={1, 2,...,n }−{i1,...,i r} so that we can form the permu-
tation ( 1 ... r
i1 ... i r
⏐⏐⏐⏐
r + 1 ... n
k1 ... k n−r
)
of{1, 2,...,n }. The sign of this permutation is (−1)s where s is the number
of interchanges necessary to rearrange the bottom line into the top line (or vice
versa). The vertical line is just for the convenience of the reader; it divides the
ﬁrst part of the permutation from the second. Then
∗(dui1∧dui2∧... ∧duir) = (−1)shk1··· hkn−r
hi1··· hir
duk1∧duk2∧... ∧dukn−r
as we show in the Chapter 2.
Now it is time for two examples. The results will just be listed but it is
easy to verify they are correct; mostly they can be done in ones head. We will
now begin to omit the wedges between diﬀerentials; the reader may assume that
if diﬀerentials are being multiplied that wedges have been omitted for ease of
reading.


## Page 33

1.16. CURVILINEAR COORDINATES I: PRELIMINARY FORMULAS 29
Example 1. n = 3 and coordinates are x,y,z .
r = ( x,y,z )
e1 = ∂r
∂x = (1 , 0, 0)
e2 = ∂r
∂y = (0 , 1, 0)
e3 = ∂r
∂z = (0 , 0, 1)
gij =ei·ej = (ei,ej) = δij =
{ 1 if i =j
0 if i̸=j
Thus we have orthogonal coordinates and also h2
i =gii = 1. Thus our formulas
give
∗dx = dy∧dz ∗dy = ( −1)dx∧dz ∗dz = dx∧dy
∗dy∧dz = dx ∗dx∧dz = ( −1)dy ∗dx∧dy = dz
Naturally in practise we prefer dz∧dx (cyclic order) to (−1)dx∧dz.
Example 2. n = 3 and coordinates are ρ,θ,φ .
Here θ (physics standard) is the angle oﬀ the z-axis.
r = ( ρ sinθ cosφ,ρ sinθ sinφ,ρ cosθ)
e1 = ∂r
∂ρ = (sin θ cosφ, sinθ sinφ, cosθ) h2
1 =g11 = 1
e2 = ∂r
∂θ = ( ρ cosθ cosφ,ρ cosθ sinφ,−ρ sinθ) h2
2 =g22 =ρ2
e3 = ∂r
∂φ = ( −ρ sinθ sinφ,ρ sinθ cosφ, 0) h2
3 =g33 =ρ2 sin2θ
g = det(gij = h2
1h2
2h2
3
√g = h1h2h3 = ρ2 sinθ
Ω0 = √gdρdθdφ = ρ2 sinθdρdθdφ
∗dρ = h2h3
h1
dθdφ = ρ2 sinθ dθdφ
∗dθ = −h1h3
h2
dρdφ = h1h3
h2
dφdρ = sin θdφdρ
∗dφ = h1h2
h3
dρdθ = 1
sinθdρdθ
∗(dθdφ) = 1
ρ2 sinθdρ
∗(dφdρ) = 1
sinθdθ
∗(dρdθ) = sin θdφ
For the last three equations use ∗∗ ω = (−1)r(n−r)ω


## Page 34

30 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
1.17 Curvilinear Coordinates II: the calculations
Now we must consider the strategy of how we will ﬁnd the formulas for grad, div
and curl in curvilinear coordinates. This is quite simple once you know how.
We look at the formulas in x,y,z coordinates and ﬁgure how to express the
x,y,z expressions in terms of the operators Φ and∗. Since these are coordinate
independent, we can use the formulas we ﬁnd in any coordinate system. The
rest is just relatively easy calculations.
We will start with curl. Recall that the input and output of curl are vectors
and that if we set ω =v1dx +v2dy +v3dz then
dω =
(∂v 3
∂y − ∂v 2
∂z
)
dydz +
(∂v 1
∂z − ∂v 3
∂x
)
dzdx +
(∂v 2
∂x − ∂v 1
∂y
)
dxdy
which looks a lot like curl. Now if we are starting with a vector v = v1e1 +
v2e2 +v3e3 we can get to ω by using Φ. Indeed, using the formulas from the
last section,
Φ(v) = gijviduj
= δijviduj
= v1dx +v2dy +v3dz
= ω
Then dω gives us the above 2-form. However, we cannot use Φ −1 to descend
again to vectors because Φ−1 eats only 1-forms. However∗ gets us from 2-forms
to 1-forms, and we have
∗dω =
(∂v 3
∂y − ∂v 2
∂z
)
dx +
(∂v 1
∂z − ∂v 3
∂x
)
dy +
(∂v 2
∂x − ∂v 1
∂y
)
dz
Φ−1(∗dω) =
(∂v 3
∂y − ∂v 2
∂z
)
⃗ e1 +
(∂v 1
∂z − ∂v 3
∂x
)
⃗ e2 +
(∂v 2
∂x − ∂v 1
∂y
)
⃗ e3
Φ−1(∗dΦ(v)) = curl v
Thus we see, using◦ for function composition,
curl = Φ−1◦∗◦ d◦ Φ
Since Φ,∗, and d are all independent of the choice of coordinate system, so is
curl= Φ−1◦∗◦ d◦ Φ. Thus we can use this formula for curl in any coordinate
system; we just have to be able to calculate the functions Φ ,∗, and d in the
new coordinates and this is trivial. We will now use our method to get formulas
for curl in any orthogonal coordinate system. We could do it in an arbitrary
coordinate system also, but this would be beyond the needs of most engineers
and scientists, and would also come out messy.
We will ﬁnd the formula for curl in the orthogonal coordinate systemu1,u 2,u 3.
Although we will eventually have to change over to physical coordinates, we will


## Page 35

1.17. CURVILINEAR COORDINATES II: THE CALCULATIONS 31
begin with v expressed in the natural coordinates system
ei = ∂r
∂ui
v = v1⃗ e1 +v2⃗ e2 +v3⃗ e3
Since the coordinate system is orthogonal, we havegij = 0 fori̸=j andgii =h2
i .
Thus we have
v = v1⃗ e1 +v2⃗ e2 +v3⃗ e3
Φ(v) = gijviduj = h2
1v1du1 +h2
2v2du2 +h2
3v3du3
dΦ(v) =
(∂(h2
3v3)
∂u2 − ∂(h2
2v2)
∂u3
)
du2du3 + etc.
∗dΦ(v) = h1
h2h3
(∂(h2
3v3)
∂u2 − ∂(h2
2v2)
∂u3
)
du1 + etc.
curl v = Φ−1∗dΦ(v) = 1
h2
1
h1
h2h3
(∂(h2
3v3)
∂u2 − ∂(h2
2v2)
∂u3
)
e1 + etc.
= 1
h1h2h3
(∂(h2
3v3)
∂u2 − ∂(h2
2v2)
∂u3
)
e1 + etc.
This is correct but it is in terms of the natural basis e1, e2, e3 whereas in physics
it is usual to express the vector in terms of the normalized vectors
ˆe1 = 1
h1
e1, ˆe2 = 1
h2
e2, ˆe3 = 1
h3
e3
Then we have
v = v1e1 +v1e2 +v1e3
= v1h1ˆe1 +v2h2ˆe2 +v3h3ˆe3
= ˜v1ˆe1 + ˜v2ˆe2 + ˜v3ˆe3
where
˜v1 =h1v1 ˜v2 =h2v2 ˜v3 =h3v3
In terms of the ˜vi and the ˆei the formula for curl becomes
curl v = 1
h1h2h3
[ (∂(h2
3v3)
∂u2 − ∂(h2
2v2)
∂u3
)
h1ˆe1 + etc.
= 1
h1h2h3
[ (∂(h3˜v3)
∂u2 − ∂(h2˜v2)
∂u3
)
h1ˆe1 + etc.
= 1
h1h2h3
⏐⏐⏐⏐⏐⏐
h1ˆe1 h2ˆe2 h3ˆe3
∂
∂u1
∂
∂u1
∂
∂u1
h1˜v1 h1˜v2 h1˜v3
⏐⏐⏐⏐⏐⏐
This is the formula you ﬁnd in reference books.


## Page 36

32 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
As an example, let us write the formula for Spherical Coordinates using the
material for Spherical coordinates at the end of the previous section. Recall
that h1 = 1, h2 =ρ, h3 =ρ sinθ. Then
curl v = 1
ρ2 sinθ
⏐⏐⏐⏐⏐⏐
ˆe1 ρ ˆe2 ρ sinθ ˆe3
∂
∂ρ
∂
∂θ
∂
∂φ
˜v1 ρ˜v2 ρ sinθ˜v3
⏐⏐⏐⏐⏐⏐
While the curl will only work in 3 dimensions, we can get formulas for grad
and div in n dimensions with no extra eﬀort at all. This is important since
we might need either of them in 2 as well as 3 dimensions, and maybe even 4
dimensions for relativity. So we shall do them all at once.
There is no diﬃculty at all with grad. It inputs a function and outputs a
vector so the immediate candidate for grad is Φ −1◦d. This obviously works in
rectangular coordinates since then Φ( ei) =dui. and thus
grad f = Φ −1(∂f
∂ui dui) (sum on i understood)
=
n∑
i=1
∂f
∂ui ei
The last is our old friend the advanced calculus gradient. Notice that we could
not use the summation convention here since both the i’s in the last term count
as low indices. (Recall that high index in a denominator counts as low.) Watch
carefully in the next developments to see why this has happened.
Next recall that for general (not necessarily orthogonal) coordinates we have
Φ(ei) =gijduj Φ−1(dui) =gijej
and so
grad f = Φ −1(df)
= Φ −1(∂f
∂uidui)
= ∂f
∂uigijej
which is nice and simple. For orthogonal coordinates we have
gij =
{ 0 if i̸=j
1
gii
= 1
h2
i
if i =j
and thus, and thus with natural basis vectors ei and physical (normalized) basis
vectors ˆei = 1
hi
ei we have
grad f =
n∑
i=1
1
h2
i
∂f
∂ui ei
=
n∑
i=1
1
hi
∂f
∂ui ˆei


## Page 37

1.17. CURVILINEAR COORDINATES II: THE CALCULATIONS 33
The second formula, with physical basis vectors ˆei, is what one generally sees
in reference books.
Our next task is the divergence. This is harder, since we must use the ∗
operator, but we can break it down into easy steps. The ﬁrst observation we
make is important for many purposes. Let
ω =
n∑
i=1
(−1)i−1vidu1∧···∧ dui−1∧dui+1∧···∧ dun
It is customary to write this as
ω =
n∑
i=1
(−1)i−1vidu1∧···∧ dˆui∧···∧ dun
where the hat on thedˆui indicates that it is NOT THERE. This is just notation;
it tends to make everything look cleaner, but you must keep your wits about
you and watch for it. Now when we ﬁnd dω it comes out very nice:
dω =
n∑
i,j=1
(−1)i−1∂vi
∂ujduj∧du1∧···∧ dˆui∧···∧ dun
Now note that if j̸= i then the diﬀerential contain a repetition and thus give
0. Hence only the terms with j =i need be retained and we have
dω =
n∑
i,j=1
(−1)i−1∂vi
∂ujduj∧du1∧···∧ dˆui∧···∧ dun
=
n∑
i=1
(−1)i−1∂vi
∂uidui∧du1∧···∧ dˆui∧···∧ dun
=
n∑
i=1
∂vi
∂ui du1∧···∧ dui∧···∧ dun
=
( n∑
i=1
∂vi
∂ui
)
du1∧···∧ dun
where in one step the dui had to hop over i− 1 other diﬀerentials to ﬁnd its
proper slot. You will notice has this has the look of divergence about it.
To utilize this formula we must get from our vector to an ( n− 1)-form. We
can get from the vector to a 1-form using Φ and then to an ( n− 1)-form using
∗. From there, d will take us to an n-form and then another ∗ will get us back
to a 0-form, or scalar, so ∗◦ d◦∗◦ Φ will get us from a vector to a scalar as we
wish for divergence. Thus ∗◦ d◦∗◦ Φ is a good candidate for divergence. Let’s
try it in rectangular coordinates. In rectangular coordinates the natural basis
e1,... en is just i, j, k when n = 3
v = viei


## Page 38

34 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Φ(v) = vidui
∗Φ(v) =
n∑
i=1
vi(−1)i−1du1∧···∧ dˆui∧···∧ dun
d∗ Φ(v) =
( n∑
i=1
∂vi
∂ui
)
du1∧···∧ dun
as we saw above. Finally
∗d∗ Φ(v) =
n∑
i=1
∂vi
∂ui = div v
which shows us that indeed the invariant form of div is ∗◦ d◦∗◦ Φ. If you are
worried about the expressions for ∗, they follow immediately from the general
expressions below.
Before we launch into the ﬁnal calculation for div, let’s recall the formulas
for the∗ operator. For ω =ωidui we have
∗ω =
n∑
i,k=1
(−1)k−1gik√gωidu1∧... ∧dˆuk∧... ∧dun
where, as before, the hat on dˆuj indicates the term is NOT THERE. This is
derived in the Chapter 2. Also derived there are
Ω0 = √gdu 1∧... ∧dun
∗ Ω0 = 1
∗ 1 = Ω 0
We also require the formula in general coordinates for Φ.
Φ(v) = Φ(viei) =gijviduj
Now we are ready for the ﬁnal calculation for div.
div v = ∗d∗ Φ(v)
= ∗d∗ (gijviduj)
= ∗d
( n∑
k=1
(−1)k−1gjk√g (gijvi)du1∧... ∧dˆuk∧... ∧dun
)
Sincegjkgij =δk
i , the only non-zero terms are whenk =i, to the above simpliﬁes
to
div v = ∗d
( n∑
i=1
(−1)i−1√gvidu1∧... ∧dˆui∧... ∧dun
)


## Page 39

1.17. CURVILINEAR COORDINATES II: THE CALCULATIONS 35
= ∗


n∑
i,j=1
(−1)i−1∂(√gvi)
∂uj duj∧du1∧... ∧dˆui∧... ∧dun


= ∗
( n∑
i=1
∂(√gvi)
∂ui ∧du1∧... ∧dui∧... ∧dun
)
= ∗
(
1√g
n∑
i=1
∂(√gvi)
∂ui
)
√gdu 1∧... ∧dun
=
(
1√g
n∑
i=1
∂(√gvi)
∂ui
)
and this is the formula for div when v is expressed in natural coordinates v =
viei. For orthogonal coordinates we have as usual ei =hiˆei and
v =
n∑
i=1
viei
=
n∑
i=1
vihiˆei
=
n∑
i=1
˜viˆei
where ˜vi = hivi are the physical coordinates with respect to the ortho normal
basis ˆei. Now using
√g = h1h2··· hn
˜vi = hivi no sum on i
we have
div v = 1
h1h2··· hn
n∑
i=1
∂
∂ui (h1h2··· hnvi)
= 1
h1h2··· hn
n∑
i=1
∂
∂ui (h1··· hi−1hi+1··· hn˜vi)
Lastly we want to give a formula for the Laplacian. In physics the formula
for the Laplacian in rectangular coordinates is
△pf =
n∑
i=1
∂f
∂ui
The normal notation for the Laplacian is△f. However, in recent years in math-
ematics there has been a big tendency to use the symbol △f for the negative


## Page 40

36 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
of the sum above. There are very good reasons for this 5. So to make sure there
will be no confusion, we will use the symbol △pf for the Laplacian as custom-
ary in physics. It will be awhile before we need to deal with the mathematical
Laplacian.
To ﬁnd the Laplacian of functions in any coordinate system is now absurdly
easy, because we have
△pf = div grad f
Thus we need only recall the two previously derived formulas for grad and div
grad f = ∂f
∂uigijej
div v = 1√g
n∑
j=1
∂(√gvj)
∂uj
Thus it comes down to substituting
vj = ∂f
∂uigij
into the formula for div v to get
△pf = 1√g
n∑
i,j=1
∂
∂uj
(√ggij ∂f
∂ui
)
One sees immediately that in orthogonal coordinates we have
△pf = 1
h1··· hn
n∑
i=1
∂
∂ui
(
h1··· hi−1hi+1··· hn
∂f
∂ui
)
1.18 Surfaces and Manifolds
Up to this point we have conﬁned ourselves mostly to Rn but now it is time
to take a more general viewpoint, especially since it will require no additional
eﬀort.
1.19 The Dualizing Operator ∗
One cannot get very far in diﬀerential forms without the dualizing operator
∗ : Λr(R)→ Λn−r(R). This operator reﬂects analytically certain geometric
properties studied in higher geometry courses called duality properties. Sadly
we cannot take the time to talk about this geometry, which would take many
pages to deal with and anyway is not a matter of great practical importance for
5For example, the mathematical Laplacian has positive or 0 eigenvalues; the physics one
has negative or 0 eigenvalues


## Page 41

1.19. THE DUALIZING OPERATOR ∗ 37
most of physics. In this section we will give a brief introduction to ∗ which will
suﬃce for most of the more elementary applications, as for example Maxwell’s
equations which we present in a later section.
In most elementary applications of ∗ we deal with the cases
r = 0 ∗ : Λ0(R) → Λn(R)
r =n ∗ : Λn(R) → Λ0(R)
and
r = 1 ∗ : Λ1(R) → Λn−1(R)
r =n− 1 ∗ : Λn−1(R) → Λ1(R)
In each case it is only necessary to derive one of the two formulas; the other is
then obtained from
∗∗ ω = (−1)r(n−r) for ω∈ Λr(R)
To deﬁne∗ it is necessary ﬁrst to put an inner product on each Λ r. This is
easily done; We deﬁne the inner product with
ω =ωidui and η =ηidui
by
(ω,η ) =gijωiηj
We can now put an inner product on each Λ r as follows
(ω1∧... ∧ωr, η1∧... ∧ηr) =
⏐⏐⏐⏐⏐⏐⏐
(ω1,η 1) ... (ω1,ηr)
... ... ...
(ωr,η 1) ... (ωn,ηr)
⏐⏐⏐⏐⏐⏐⏐
and extending by linearity. This deﬁnes an inner product on Λ r for 1≤r≤n,
but we also need it on Λ 0 which is just the scalars. For these we deﬁne
(r,s ) = rs for r,s scalers
For completeness, we remark that ifω∈ Λr andη∈ Λs andr̸=s, 0≤r,s≤n,
then we put
(ω, η) = 0
Our most important use of this formula is the following case where r =n:
(ω1∧... ∧ωn, η1∧... ∧ηn) =
⏐⏐⏐⏐⏐⏐⏐
(ω1,η 1) ... (ω1,ηn)
... ... ...
(ωn,η 1) ... (ωn,ηn)
⏐⏐⏐⏐⏐⏐⏐
Noting that the above formula gives us
(dur,dus) = (δi
rdui,δj
sduj) =gijδi
rδj
s =grs


## Page 42

38 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
we have with the inner product in Λ n
(du1∧... ∧dun, du1∧... ∧dun) =
⏐⏐⏐⏐⏐⏐⏐
(du1,du 1) ... (du1,dun)
... ... ...
(dun,du 1) ... (dun,dun)
⏐⏐⏐⏐⏐⏐⏐
=
⏐⏐⏐⏐⏐⏐⏐
g11 ... g 1n
... ... ...
gn1 ... g nn
⏐⏐⏐⏐⏐⏐⏐
= det ( gi,j) = 1
g
Thus
(√gdu 1∧... ∧dun,√gdu1∧... ∧dun) = 1
We will deﬁne
Ω0
def
= √gdu 1∧... ∧dun
and refer to it as the normalized topform. The normalized topform is unique up
to sign; it will change sign if two variables interchange their numbers. Choice of
a sign is the same as choice of an orientation. The reason it is essentially unique
is that Λn is one-dimensional, so there are only two elements of size 1 and they
are negatives of one another.
If M is a n-dimensional region than the volume of M is
vol(M) =
∫
M
Ω0
There are of course subtleties here; for example the sign could come out wrong.
And of course you have to prove this works using whatever your deﬁnition of
volume is. We will ignore these problems. Also we mention that if f is the
density of something, electrical charge for example, or gas, then the amount of
the stuﬀ will be
Amount of stuﬀ in M =
∫
M
f Ω0
Next we want the oﬃcial deﬁnition of ∗ which is at last possible since we
have the inner product on Λ r. For any α∈ Λn−r we will always have
ω∧α =k Ω0
for some constant k. Then for η∈ Λr we deﬁne∗η as that unique element of
Λn−r for which the constant k is (ω,η ), which comes down to
ω∧∗η = (ω,η ) Ω0
This is the most important equation involving ∗; if you remember this you
can derive everything else. The existence and uniqueness of ∗η are derived in
Chapter 2, but it is not a diﬃcult matter; it comes down to the representation
of a linear functional in an inner product space.


## Page 43

1.19. THE DUALIZING OPERATOR ∗ 39
Some equations readily follow from the basic equation. For example, we
have
ω∧∗η = (ω, η)Ω0 = ( ηω )Ω0 = η∧∗ω
ω∧∗η = η∧∗ω
which has important uses, for example in the next section on the codiﬀerential.
Other important equations like
∗∗ ω = (−1)r(n−r)ω for ω∈ Λr
do not follow so readily from the basic equation. We will have more to say about
this equation later.
Next, using the basic equation ω∧∗η = ( ω,η ) Ω0 we want to derive the
formulas for ∗ for general coordinates and 1-forms. Recall that a hat over a
term means that it is missing. We have {du1,...,du n} is a basis for Λ 1. A
basis for Λn−1 is
du1∧... ∧ ˆdui∧... ∧dun 1≤i≤n
Thus, since dui∈ Λ1, we have∗dui∈ Λn−1 and then we can express ∗dui as
∗dui =
n∑
j=1
(−1)j−1ajdu1∧... ∧ ˆduj∧... ∧dun
where the aj are functions of u1,...,u n which we must determine and the
(−1)j−1 is inserted for convenience. We now compute both sides of the basic
equation and setting them equal will give us the aj. The basic equation is
duk∧∗dui = (duk,dui)Ω0. Computing the left side of the basic equation we
have
duk∧∗dui = duk∧


n∑
j=1
(−1)j−1ajdu1∧... ∧ ˆduj∧... ∧dun


=
n∑
j=1
(−1)j−1ajduk∧du1∧... ∧ ˆduj∧... ∧dun
All terms on the right side in the sum will be 0 except the one where j = k
because if j̸= k there will be repetition in the diﬀerentials killing the term.
Thus
duk∧∗dui = akdu1∧... ∧duk∧... ∧dun
Notice how the (−1)j−1 was used to returnduk to its proper place in the product
of diﬀerentials. This is a good trick to remember, though it is never important,
just convenient. Next we compute the right side of the of the basic equation.
We have
(duk,dui)Ω0 = gki√gdu 1∧... ∧dun


## Page 44

40 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Comparing the two expressions we see that
ak =gki√g
and thus
∗dui =
n∑
k=1
(−1)k−1akdu1∧... ∧ ˆduk∧... ∧dun
=
n∑
k=1
(−1)k−1gki√gdu1∧... ∧ ˆduk∧... ∧dun
This equation
∗dui = ∑n
k=1(−1)k−1gki√gdu1∧... ∧ ˆduk∧... ∧dun
is of fundamental importance. You have already seen it used in the derivation
of the formulas for curvilinear coordinates.
It is possible to determine ∗du1∧... ∧ ˆduk∧... ∧dun in the same way but
that method leads into a forest of determinants. Instead, we will use the formula
∗∗ω = (−1)r(n−r)ω withr = 1 and some trickery involving the inverse matrices
(gji) and (gik).
∗dui =
n∑
j=1
(−1)j−1gji√gdu 1∧... ∧ ˆduj∧... ∧dun
n∑
i=1
gik∗dui =
n∑
i,j=1
(−1)j−1gjigik
√gdu 1∧... ∧ ˆduj∧... ∧dun
=
n∑
j=1
(−1)j−1


n∑
j=1
gjigik

√gdu 1∧... ∧ ˆduj∧... ∧dun
=
n∑
j=1
(−1)j−1δj
k
√gdu 1∧... ∧ ˆduj∧... ∧dun
= ( −1)k−1√gdu 1∧... ∧ ˆduk∧... ∧dun
Hence, starring both sides, we have
(−1)k−1√g∗du1∧... ∧ ˆduk∧... ∧dun =
n∑
i=1
gik∗∗ dui
=
n∑
i=1
gik(−1)1(n−1)dui
∗du1∧... ∧ ˆduk∧... ∧dun = ( −1)−k+1(−1)n−1
n∑
i=1
gikdui


## Page 45

1.19. THE DUALIZING OPERATOR ∗ 41
giving us our ﬁnal answer
∗du1∧... ∧ ˆduk∧... ∧dun = (−1)n−k ∑n
i=1gikdui
This is not quite suﬃcient for our needs. We also need formulas for ∗ when
r = 0 and when r =n. These are easy. Recall that Λ 0 is just the scalars R and
that the inner product is just the ordinary product in R and that a basis for R
is just the single scalar 1. Then
∗1 = Ω0
since
1∧∗ 1 = 1∧ Ω0 = Ω0 = (1, 1)Ω0
as required. Then
∗Ω0 =∗∗ 1 = (−1)0(n−0)1 = 1
We have determined the formulas in generalized coordinates for 0-forms, 1-
forms, (n− 1)-forms and n-forms. It is possible to work out similar formulas
for r-forms, but these are not as important in applied mathematics and to
derive them we would have to introduce some equipment involving minors of
determinants. Hence we will put this oﬀ to Chapter 2 and concentrate here
on the more practically oriented formulas for orthogonal coordinates which are
relatively easy to derive. Recall that for orthogonal coordinates we have for the
position vector R = R(u1,...,u n)
ej = ∂R
∂ui
hi = ( ei, ei)
ˆei = 1
hi
ei
(dui,duj) = gii = 1
h2
i
(hidui, hiduj) = 1
Ei = hidui
so that {h1du1,...,h ndun} form an orthonormal set. For convenience let us
set Ei = hidui. Then ( Ei, Ej) = δij. Now from the basic equation ω∧∗η =
(ω, η)Ω0 we see immediately that
∗(Ei1∧···∧ Eir) = sgn(σ)(Ej1∧···∧ Ejn−r)
where{j1,...,j n−r} ={1,...,n }−{ i1,..., ır} and σ is the permutation
σ =
( 1 ... r
i1 ... i r
⏐⏐⏐⏐
r + 1 ... r
j1 ... j n−r
)


## Page 46

42 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Here the convention is 1≤i1 <...<i r≤n and 1≤j1 <...<j n−r≤n but in
fact the formula will work just as well with the i’s and j’s in any order. Indeed
it suﬃces to check this for ω running through a basis {Ek1∧···∧ Ekr) 1 ≤
i1,..., ≤kr} of Λr.
(Ek1∧···∧ Ekr)∧∗ (Ei1∧···∧ Eir) = Ek1∧···∧ Ekr∧ sgn(σ)(Ej1∧···∧ Ejn−r)
Now if{k1,...,k r}̸ ={i1,...,i r} there will be repetitions on the right side and
the result will be 0. Hence we will take {k1,...,k r} ={i1,...,i r} and since
both are in increasing order we have iℓ =kℓ and
(Ei1∧···∧ Eir)∧∗ (Ei1∧···∧ Eir) = Ei1∧···∧ Eir∧ sgn(σ)(Ej1∧···∧ Ejn−r)
= E1∧···∧ En
= ( h1du1)∧···∧ (hndun)
= h1··· hndu1∧···∧ dun
= √gdu 1∧···∧ dun
= Ω 0
On the other hand
(Ek1∧···∧ Ekr, Ei1∧···∧ Eir)Ω0 = det
(
(Ekℓ,Eim)
)
Ω0
Now if{k1,...,k r}̸ ={i1,...,i r} then there will be a row in the determinant
which is entirely 0. Hence we take {k1,...,k r} ={i1,...,i r} and since both
are in increasing order we have iℓ = kℓ, the determinant has 1’s on the main
diagonal and 0’s elsewhere, so the determinant is 1 and the result is
(Ei1∧···∧ Eir, Ei1∧···∧ Eir)Ω0 = Ω 0
Hence if{k1,...,k r}̸ ={i1,...,i r} both sides of the fundamental equation are
0 and if{k1,...,k r} ={i1,...,i r} then both sides are Ω 0, proving that
∗(Ei1∧···∧ Eir) = sgn(σ)(Ej1∧···∧ Ejn−r)
Replacing the Ei byhidui we have
∗(hi1dui1∧···∧ hirduir) = sgn(σ)(hj1duj1∧···∧ hjn−rdujn−r)
and from this
∗(dui1∧···∧ duir) = sgn(σ)hj1··· hjn−r
hi1··· hir
(duj1∧···∧ dujn−r)
where σ is the permutation
σ =
(
1 ... r
i1 ... i r
⏐⏐⏐⏐
r + 1 ... n
j1 ... j n−r
)


## Page 47

1.20. THE CODIFFERENTIAL δ 43
This gives us a formula valid for any r
This is also a convenient moment to prove the formula
∗∗ ω = (−1)r(n−r)ω
We can do this using the basis {E1,...,E n}. We deﬁne the reverse ˜σ of σ to
be, with the above σ,
˜σ =
( 1 ... n −r
j1 ... j n−r
⏐⏐⏐⏐
n−r + 1 ... n
i1 ... i r
)
Now if we move the r i’s each past the n−r j’s there will be a total of r(n−r)
hops to get from ˜σ back toσ. Hence if it takes s hops to returnσ to the identity,
sgn(σ) = (−1)s and
sgn(˜σ) = ( −1)s+r(n−r) = (−1)r(n−r)sgn(σ)
sgn(σ)sgn(˜σ) = ( −1)r(n−r)
Then, with ω =Ei1∧···∧ Eir we have
∗∗ ω = ∗∗ Ei1∧···∧ Eir
= sgn( σ)∗Ej1∧···∧ Ejn−r
= sgn( σ)sgn(˜σ)Ei1∧···∧ Eir
= ( −1)r(n−r)Ei1∧···∧ Eir
= ( −1)r(n−r)ω
Since this is true for the elements of a basis, it will be true for all ω.
1.20 The Codiﬀerential δ
To deal with the Laplacian for forms, we need the codiﬀerential δ : Λr→ Λr−1.
We will use this in our treatment of Maxwell’s equations. For example, the
condition of Lorenz is naturally expressed in terms of the codiﬀerential.
In contrast to previous constructions, δ depends for its very deﬁnition on
the presence of an inner product for the forms on a manifold M. Using the∗ we
can easily deﬁne such an inner product. Let ω, η∈ Λr. Then the inner product
is deﬁned by either of the following
((ω, η)) =
∫
M
ω∧∗η =
∫
M
(ω, η)Ω0
Some points to remember. The inner product ( ω, η) is an inner product that
lives in Tp(M) for each p∈M. It and ∗ are strictly local, being algebraic con-
structions on each tangent spaceTp(M) separately. On the other hand, ((ω, η))
depends on integrating the information given at each p over the manifold. It is
thus a global object. Second, although we express it in our formulas for a single


## Page 48

44 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
coordinate system, in many cases it will be necessary to cut M into separate
pieces each of which lives inside the domain of a coordinate system, and to use
that coordinate system when integrating over that piece. Sometimes, as for the
sphere, we can use a single coordinate system even though that system is bad
at speciﬁc points, like the North and South pole. This is best considered dumb
luck, and one should always be careful when doing it. But it does work often in
applications as long as nothing is discontinuous at the bad points.
Now that we have the inner product on forms, we can consider (( ω, dη))
where ω∈ Λr and η∈ Λr−1. We will consider two possible scenarios
a The manifold M has no boundary; ∂M =∅ Such a manifold is often referred
to as closed. The idea ”no boundary” includes ”no boundary at inﬁnity”
so that in this case the manifold M is compact.
b Either ω or η vanishes oﬀ a compact subset M0 of M, so the integral will
always be ﬁnite.
With one of these situations in place, we can do an integration by parts in
the way you have seen done in diﬀerential equations, and come up with formal
adjoint δ for d. After all this preamble, the actual calculation is quite short.
We need to recall that, with ω∈ Λr−1 and η∈ Λr
ω∧∗η = η∧∗ω
d(ω∧∗η) = dω∧∗η + (−1)r−1ω∧d∗η
Also note because of the above assumptions on ω and η we have by Stokes
theorem ∫
K
d(ω∧η) =
∫
∂K
ω∧η = 0
We can now derive the formula for the (formal) adjoint of d.
((dω,η )) =
∫
K
dω∧∗η
=
∫
K
d(ω∧η)− (−1)r−1
∫
K
ω∧d∗η
= 0 + ( −1)r
∫
K
ω∧d∗η
= ( −1)r(−1)(n−r+1)(r−1)
∫
K
ω∧∗∗ d∗η
Now we must simplify the exponent. Recall that
k2 ≡ k (mod 2)
−k ≡ k
2k ≡ 0
k(k− 1) ≡ 0


## Page 49

1.20. THE CODIFFERENTIAL δ 45
Thus
r + (n−r + 1)(r− 1) ≡ r + (n−r)(r− 1) +r− 1 (mod 2)
≡ (n−r)(r− 1)− 1
≡ n(r− 1)−r(r− 1)− 1
≡ n(r− 1)− 1 + 2
≡ n(r− 1) + 1
Hence
((dω,η )) = ( −1)n(r−1)+1
∫
K
ω∧∗∗ d∗η
=
∫
K
ω∧∗
(
(−1)n(r−1)+1∗d∗η
)
Thus if we set
δ : Λr→ Λr−1
deﬁned by
δη = (−1)n(r−1)+1∗d∗η η ∈ Λr
we have
((dω,η )) = ((ω,δη )) ω∈ Λr−1, η∈ Λr
as we wanted. Naturally δ is only a formal adjoint to d because we have not
considered any boundary conditions, but this is not unusual in mathematical
physics.
It is worth noticing that the formula for δ simpliﬁes if we consider the cases
of even and odd dimensional spaces separately. We have
n odd: δω = (−1)r∗d∗ω
n even: δω =−∗ d∗ω
There are some useful identities connecting ∗, d, and δ which are conse-
quences of∗ being almost an involution, which we now derive. First we have
∗δω = ( −1)n(r−1)+1∗∗ d∗ω ω ∈ Λr
= ( −1)n(r−1)+1(−1)(n−r+1)(r−1)d∗ω ω ∈ Λr
= ( −1)rd∗ω ω ∈ Λr
since
n(r− 1) + 1 + (n−r + 1)(r− 1) ≡ (n +n−r + 1)(r− 1) + 1 mod 2
≡ −(r− 1)(r− 1) + 1
≡ (r− 1)2 + 1
≡ (r− 1) + 1
≡ r


## Page 50

46 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
Applying our identity to∗ω we have
∗δ∗ω = ( −1)n−rd∗∗ ω
= ( −1)n−r+r(n−r)dω
= ( −1)(n−r)(r+1)dω
∗∗ δ∗ω = ( −1)(n−r)(r+1)∗ dω
(−1)(n−r−1)(r+1)δ∗ω = ( −1)(n−r)(r+1)∗ dω
δ∗ω = ( −1)(n−r)(r+1)+(n−r−1)(r+1)∗ dω
δ∗ω = ( −1)(r+1)(n−r+n−r−1)∗ dω
δ∗ω = ( −1)r+1∗ dω
The r in these formulas always refers to the degree of ω, and this must be
carefully remembered when applying the formulas. It is easy to make mistakes
applying these formulas.
1.21 The Laplacian
One of the most important operators in mathematical physics is the Laplacian.
We have derived formulas for the Laplacian on functions but using the codiﬀer-
ential it is possible to give formulas for the Laplacian on diﬀerential forms also.
This is important, for example, in Electromagnetic theory where we need the
Laplacian of the one form which expresses the vector potential of the magnetic
ﬁeld.
1.22 Maxwell’s Equations in 3-space
In this section we will show how the standard vector analysis treatment of
Maxwell’s equations can be recast in the notation of diﬀerential forms. Notation
has been chosen to make it easy to switch over to a tensor treatment, which we
provide in an addendum to the section.
The prerequisites for this section include the ∗ operator, the codiﬀerential
which in three dimensions is δ =∗d∗ and the Laplacian △ = δd +dδ (math
form) and△p =−△ (physics form).
A standard form of Maxwell’s equations using vector formulation is
div D = ρ curl E = − 1
c
∂B
∂t D = ϵE
div B = 0 curl H = 1
c
∂D
∂t + 1
cj B = µH
The form of these equations indicates how they should be put into diﬀerential
forms. The dievergence is mirrored byd on 2-forms and the curl byd on 1-forms.
This suggests that D and B should be 2 forms and E and H should be 1-forms.
We also note that this suggests the e.g. D and E are not trivial variants of one
another, which was the attitude expressed by Maxwell and Faraday. We set
D =D1dydz +D2dzdx +D3dzdx E =E1dx +E2dy +E3dz


## Page 51

1.22. MAXWELL’S EQUATIONS IN 3-SPACE 47
B =B1dydz +B2dzdx +B3dzdx H =H1dx +H2dy +H3dz
Since j is a current density (to be integrated over a surface) it should be a two
form
j =j1dydz +j2dzdx +j3dzdx
and since ρ is a charge denisity it should be integrated over a region and thus
should be a three form, for which we will use the letter P, an upper case Greek
ρ.
P =ρ Ω0
In rectangular coordinates P = ρdxdydz . The matter equations can also be
written as forms, for which we require the ∗ operator:
D = ϵ∗E
B = µ∗H
and then the diﬀerential equations become
dD =P dE =−1
c
∂B
∂t
dB = 0 dH = 1
c
∂B
∂t + 1
cj
The equations of most signiﬁcance derived from these are the equation of con-
tinuty and the potential equations. The equation of continuity is easy:
dH = 1
c
∂B
∂t + 1
cj
0 = ddH = 1
c
∂
∂t dB + 1
cdj
0 = 1
c
∂
∂tP + 1
cdj
0 = ∂P
∂t +dj
This is the form that the equation of continuity takes in our treatment. We note
however that if we just consider the coeﬃcient of dxdydz from the equation it
becomes
0 = ∂ρ
∂t + div j
Now we start on the potential equations.
dB = 0 = ⇒ B =dA
(by the converse of the Poincar´ e lemma), whereA is a 1-form. A is not uniquely
determined; we can add dG to A for any G∈ Λ0 (that is, a function), since
d(A +dg) =dA +ddG =dA + 0 =B


## Page 52

48 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
We can use this G to modify A and this is called changing the gauge . We will
return to this matter later on. Next we have
dE = −1
c
∂
∂t B
= −1
c
∂
∂t dA = −1
cd
(∂A
∂t
)
d
(
E + 1
c
∂A
∂t
)
= 0
Since E + 1
c
∂A
∂t is a 1-form, there must be a 0-form −φ for which
E + 1
c
∂A
∂t =−dφ
(The minus sign is historical and of no theoretical importance.) φ is called the
scalar potential. Often the letter U is used for it instead of φ. A is called the
vector potential.
If A is changed to A′ = A +dG there will be a corresponding change in φ
which we now determine.
E + 1
c
∂A
∂t = −dφ
E + 1
c
∂A′
∂t = −dφ′
E + 1
c
∂A
∂t + 1
c
∂
∂t dG = −dφ′
−dφ + 1
c
∂
∂t dG = −dφ′
d(φ′−φ + 1
c
∂
∂t G) = 0
φ′−φ + 1
c
∂
∂t G = C
where C is some constant. Thus
φ′ =φ− 1
c
∂
∂t G +C
Digesting, we have
A′ = A +dG
φ′ = φ− 1
c
∂
∂t G
where we have set C = 0 as customary.
Our next job is to derive the potential equations. However, there is so much
slop inA that we cannot reasonably expect nice equations without putting some
extra conditions on A. We could simply pull the condition out of the air, but it
will be more fun to see it appear in context.


## Page 53

1.22. MAXWELL’S EQUATIONS IN 3-SPACE 49
Recall that the physics Laplacian △p is the negative of the mathematical
Laplacian△ =dδ +δd where δ in three dimenstions is
δω = (−1)r∗d∗ω ω ∈ Λr
Now we have
△A = ( δd +dδ)A = δdA +dδA
= δB +dδA
= ( −1)2∗d∗B +dδA
= ∗d(µH) +dδA = µ∗dH +dδA
= µ∗
(1
c
∂D
∂t + 1
cj
)
+dδA
= µ
(1
c
∂(∗D)
∂t + 1
c ∗j
)
+dδA
= µ
(1
c
∂(ϵE)
∂t + 1
c ∗j
)
+dδA
= µ
c ∗j + ϵµ
c
∂E
∂t +dδA
= µ
c ∗j + ϵµ
c
∂
∂t
(
−dφ− 1
c
∂A
∂t
)
+dδA
= µ
c ∗j− ϵµ
c2
∂2A
∂t2 +d
(
δA− ϵµ
c
∂φ
∂t
)
Rearranging and replacing△A by−△pA we have
ϵµ
c2
∂2A
∂t2 −△pA = µ
c ∗j +d
(
δA− ϵµ
c
∂φ
∂t
)
This would be the familiar wave equation for A
□A = ϵµ
c2
∂2A
∂t2 −△pA = µ
c ∗j
with velocity c√ϵµ if not for the term d
(
δA− ϵµ
c
∂φ
∂t
)
. Hence, using the slop in
A, we will set this to 0.
δA− ϵµ
c
∂φ
∂t = 0 Condition of Lorenz
Of course, we need to know that adding a suitable dG will force the Condition
of Lorenz to be true. We will look at this later. (Usually this step is neglected!)
We must also have the potential equation for φ. This is derived in a similar
manner, but easier. It is interesting that it throws up the same extra terms
which we eliminate with the Condiditon of Lorenz. This suggests that the
time and space variables might have more of a connection than we expect ´ a


## Page 54

50 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS
priori. This was likely one of the things that induced Lorenz develop the Lorenz-
Einstein transformation equations. We imitate the previous calulation, noting
that δφ = 0 since δ is 0 on Λ 0,
△φ = ( δd +dδ)φ = δdφ +dδφ
= δ
(
−E− 1
c
∂A
∂t
)
+ 0
= −δE− 1
c
∂(δA)
∂t
= −(−1)1∗d∗E− 1
c
∂
∂t
(ϵµ
c
∂φ
∂t
)
− 1
c
∂
∂t
(
δA− ϵµ
c
∂φ
∂t
)
= ∗d1
ϵ D− ϵµ
c2
∂2φ
∂t2
where we have invoked the Condition of Lorenz δA− ϵµ
c
∂φ
∂t = 0 once again.
Continuing
△φ = 1
ϵ∗P− ϵµ
c2
∂2φ
∂t2
ϵµ
c2
∂2φ
∂t2 −△pφ = 1
ϵ∗P = ρ∗ Ω0
ϵµ
c2
∂2φ
∂t2 −△pφ = 1
ϵρ
which is the familiar wave equation forφ in coordinate independent form (except
for orientation considerations and provided that ρ really is the physical charge
density and has not been modiﬁed to ﬁt into some special coordinate system).
Note that we used△pφ =−△φ again. Note also that the equation is identical in
form to the Dalembertian equation forA. And ﬁnally note that the Condition of
Lorenz did not pop up so naturally in this derivation as it did in the calculation
for A.
Our next job is a look at the Condition of Lorenz. A close examination of
the derivation of the wave equation for A will show that if A is a solution of
the equation then the Condition of Lorenz must hold. The question is, can we
always force the Condition of Lorenz to hold by choosing an appropriate G in
A′ =A +dG φ ′ =φ− 1
c
∂G
∂t
The answer, as we will show, is yes. We need
δA′− ϵµ
c
∂φ′
∂t = 0
How do we ﬁnd the G?. Substituting into this equation we have
δ(A +dG)− ϵµ
c
∂
∂t
(
φ− 1
c
∂G
∂t
)
= 0


## Page 55

1.22. MAXWELL’S EQUATIONS IN 3-SPACE 51
Since δG = 0, this can be rewritten as
(δd +dδ)G + ϵµ
c2
∂2G
∂t2 +δA− ϵµ
c
∂φ
∂t = 0
ϵµ
c2
∂2G
∂t2 +△G = −
(
δA− ϵµ
c
∂φ
∂t
)
ϵµ
c2
∂2G
∂t2 −△pG = −
(
δA− ϵµ
c
∂φ
∂t
)
(recalling that△p =−△) and once again we have a wave equation. We solve for
G, correct the A and φ to A′ and φ′, and then solve the wave equations for A′
and φ′. Actually we don’t have to make the correction, since solving the wave
equations forA andφ will work just ﬁne; theA andφ we ﬁnd will automatically
satisfy the Condition of Lorenz. The importance of the above is to show that
A and φ we seek actually exist.


## Page 56

52 CHAPTER 1. INTRODUCTION AND BASIC APPLICATIONS


## Page 57

Chapter 2
Mathematical Theory
53


## Page 58

54 CHAPTER 2. MATHEMATICAL THEORY
2.1 INTRODUCTION
In this chapter we will discuss the mathematical theories that underlie the de-
velopment in the ﬁrst chapter. Also, we will look at the theory in a more general
setting; that of a diﬀerentiable manifold rather than simply n-space. A diﬀer-
entiable manifold is like a surface in n-space but with more dimensions and
without the n-space. If the manifold is actually inside an n-space the manifold
is called embedded. In point of fact, all manifolds can be embedded in an n-
space of suﬃciently high dimension, but it is no longer customary to do this.
We wil discuss this further in the succeeding sections.
2.2 Permutations
One cannot get very far using diﬀerential forms without the dualizing operator
∗ which we saw used in the previous section for deriving formulas for curvilinear
coordinates. In this section we will give an introduction to the∗ operator which
will be more of a tour than a treatment; the full treatment will be found in
Chapter 2. Thus this section will present the basic ideas and the formulas the
physicist will ﬁnd most useful. Formulas for more sophisticated uses will be
found in Chapter 2.
A critical and not particularly well liked part of this is some of the lore of
permuatations. A permustation is a rearrangement of the set {1, 2,...,n }; for
example{3, 5, 6, 1, 2, 4} is a rearrangement of {1, 2, 3, 4, 5, 6}. By interchang-
ing two elements, adjacent or not, a permuatation may be brought back to
{1, 2,...,n }. There are many ways to do this of course, but it turns out that
the number of interchanges to do this is always the same mod 2. Thus no matter
how the interchanges are done, (−1)s will always have the same value, and that
value is the sign of the permutation. It is convenient for us (though somewhat
nonstandard) to write a permutation σ as a function with inputs at the top and
outputs at the botton. Thus the permuatation above would be written
σ =
( 1 2 3 4 5 6
3 5 6 1 2 4
)
Here are a possible sequence of interchanges to get back to the identity.
( 1 2 3 4 5 6
3 5 4 1 2 6
)
−→
( 1 2 3 4 5 6
3 2 4 1 5 6
)
−→
( 1 2 3 4 5 6
1 2 4 3 5 6
)
−→
( 1 2 3 4 5 6
1 2 3 4 5 6
)
We used four interchanges; s = 4. Clearly this can be done in many ways but
the number of interchanges s will always be an even number, and thus
sgn(σ) = (−1)s = +1
is well deﬁned.


## Page 59

2.3. THE OPERATOR Φ 55
There is one other useful observation. Suppose that a permuation has the
property that it compounded of two increasing subsequences of the numbers
{1, 2,...,n }; for example
( 1 2 3 4
3 5 7 8
⏐⏐⏐⏐
5 6 7 8 9
1 2 4 6 9
)
or more generally with i1 <...<i r and ir+1 <...<i n
σ =
( 1 ... r
i1 ... i r
⏐⏐⏐⏐
r + 1 ... n
ir+1 ... i n
)
Note that the elements after the vertical line are determines by those before it.
Now the interesting thing here is that the sign of such a permutation can be
found as follows. First set
Tr = 1 + 2 +··· +r = r(r + 1)
2
Then for such a σ
sgn(σ) = (−1)
∑r
j=1ij−Tr
Thus for the example above
sgn(σ) = (−1)3+5+7+8−T4 = (−1)23−10 =−1
Since this kind of permatation is the most common type in diﬀerential forms,
this is quite handy.
2.3 The operator Φ
In this mathematical appendix we provide mathematical justiﬁcation for many
of the things that were skipped over in the foregoing sections. For example, in
some of the sections we showed how diﬀerential forms ”mimicked” the action of
curl on vectors. In this section we show how this can be made mathematically
precise.
There are two coordinate independent operators whose theory we must de-
velop. We do not do this in complete generality, but limit ourself to our particu-
lar needs. Nevertheless, we do enough so that anyone who reads and understands
this appendix will ﬁnd large areas of diﬀerential geometry familiar.
The ﬁrst operator, which we call Φ, sets up an isomorphism between a vector
spaceV with an inner product and its dual space, the space of linear functionals
on V , which we call V∗. This is quite easy and is merely an invariant form of
the raising and lowering of indices used in Tensor Analysis.
The second operator is the∗ operator, invented by Heinrich Grassmann and
popularized by William V. D. Hodge. This is a little more diﬃcult and requires
introduction of an inner product on the dual space and also the introduction of
a normalized topform, which we explain below.


## Page 60

56 CHAPTER 2. MATHEMATICAL THEORY
LetV be an-dimensional vector space with an inner product, which we write
(v, w) rather than v· w, and let e1, e2,..., en be a basis. We set
gij = (ei, ej)
Then v = ∑
iviei for any v ∈ V but, following Einstein, we will omit the
sum sign when an index is repeated, one up one down, and we will write this
v =viei. Similarly w =wiei and we have
(v, w) = ( viei,wjej)
= viwj(ei, ej)
= gijviwj
This connects ( v, w) whose value does not depend on a choice of basis with
quantitiesgij, vi andwj whose values do depend upon the basis. It is important
to be able to go back and forth between coordinate free notation and indexed
notation where the objects depend upon the choice of basis. Tensor notation is
an attempt to live in both worlds, and it does it quite well, at the expense of
rather complex looking equations.
Because an inner product is non-degenerate, (which means that if (v, w) = 0
for all w∈V then v = 0) we must have
det(gij)̸= 0
This is most important.
A linear functional ℓ is deﬁned by the requirement that
ℓ(αv +βw) =αℓ (v) +βℓ (w)
The set of all linear functionals is a vector space and is called V∗.
An important theorem is
Theorem Representation of linear functional.
Let ℓ be a linear functional on a vector space with an inner product. There
there exists a unique u∈V for which
ℓ(v) = (u, v)
We will prove this shortly. First we give an important example. If v = viei
the we can deﬁne a linear functional whose value on v is vi. This functional is
called Ei (note upper index). It should be clear that
Ei(ej) =δi
j =
{ 1 if i =j
0 if i̸=j
Now let ℓ∈ V∗ be a linear functional and let λi = ℓ(ei). Then I claim that
ℓ =λiEi. Indeed
λiEi(v) = λiEi(vj ej)


## Page 61

2.3. THE OPERATOR Φ 57
= λivjEi(ej)
= λivjδi
j
= λjvj
= vjℓ(ej)
= ℓ(vjej)
= ℓ(v)
Then it is easy to prove that the Ei are linearly independent and thus form a
basis for V∗.
Now back to Φ : V → V∗. Let ℓ∈ V∗ be a linear functional and let it be
represented by u∈V . Then the theorem says that for all v∈V we have
ℓ(v) = (u, v)
We deﬁne Φ by
Φ(u) =ℓ
Since this has been deﬁned in terms of the inner product, which does not depend
upon the basis, Φ is independent of the basis.
For our next task we need to deﬁne
(gij) = (gij)−1
When these matrices are written out the inverse relationship becomes
gijgjk = δk
i
gijgjk = δi
k
Also note that gij = ( ei, ej) = ( ej, ei) = gji the order of the indices in the
above equations is not important.
It is now time to prove the theorem. Since we would like to know the
connection betweenℓ and u in coordinates, it makes sense to prove the theorem
using coordinates. Let ℓ =λjEj and deﬁne u by
ui =gijλj and u =uiei
We now verify this works:
(u, v) = ( uiei,vkek)
= gikuivk
= gikgijλjvk
= gkigijλjvk
= δj
kλjvk
= λkvk
= λk Ek(v)
= ℓ(v)


## Page 62

58 CHAPTER 2. MATHEMATICAL THEORY
Then the formula for Φ in coordinates is
Φ(u) =ℓ if and only if gijuj =λi
and of course
Φ−1(ℓ) = u if and only if gijλj =ui
Our next job is to put an inner product onV∗ and we will do this byexporting
the inner product on V toV∗ in such a way as to make Φ an isometry. That is
we deﬁne, for λ,µ∈V∗,
(λ,µ )
Def
= (Φ−1(λ), Φ−1(µ))
Now to do this is coordinates we have, with λ =λkEk and µ =µnEn
(λ,µ ) = gijgikλkgjmµm
= δk
jλkgjmµm
= λjgjmµm
= gjmλjµm
which is the desired formula for the inner product in coordinates.


## Page 63

Bibliography
[1] Misner, Thorne and Wheeler, GRAVITATION, W.H. Freeman, San
Francisco, 1973
[2] Frankel, Theodore THE GEOMETRY OF PHYSICS, 3 rd edition,
Cambridge University Press, Cambridge,etc, 2012
[3] Gilkey, Peter B. INVARIANCE THEORY, THE HEAT EQUATION
AND THE ATIZYA-SINGER INDEX THEOREM, 2nd Edition Boca
Raton 1995
[4] Nakahara, Mikio GEOMETRY, TOPOLOGY, AND PHYSICS, Insti-
tute of Physics Publishing, London, 2003
[5] Lovelock, David and Rund, Hanno TENSORS, DIFFERENTIAL
FORMS AND VARIATIONAL PRINCIPLES, Wiley Interscience
[6] Roe, John, ELLIPTIC OPERATORS, TOPOLOGY AND ASYMP-
TOTIC METHODS, 2nd Edition, Boca Raton, 1998
[7] Rosenberg, S. THE LAPLACIAN ON A RIEMANNIAN MANI-
FOLD, Cambridge, 1997
[8] Schulz, William, THEORY AND APPLICATION OF GRASSMANN
ALGEBRA, http://www.cefns.nau.edu/ schulz/grassmann.pdf
59
