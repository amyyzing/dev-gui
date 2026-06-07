# Exterior Calculus in Graphics

Source title: Exterior Calculus in Graphics

Converted from: `18.pdf`


## Page 1

Exterior Calculus in Graphics
Course notes for a SIGGRAPH 2023 course
Stephanie Wang, Mohammad Sina Nabizadeh, and Albert Chern
Version 1.00: June 6, 2023
Latest version available at
https://stephaniewang.page/ExteriorCalculusInGraphics/
Permission to make digital or hard copies of part or all of this work for personal or classroom
use is granted without fee provided that copies are not made or distributed for profit or
commercial advantage and that copies bear this notice and the full citation on the first
page. Copyrights for third-party components of this work must be honored. For all other
uses, contact the Owners/Authors.
Copyright is held by the owners/authors.
SIGGRAPH ’23 Courses, August 06-10, 2023, Los Angeles, CA, USA
ACM 979-8-4007-0145-0/23/08.
10.1145/3587423.3595525


## Page 2

[No extractable text on this page]


## Page 3

Abstract
The demand for a more advanced multivariable calculus has rapidly increased in
computer graphics research, such as physical simulation, geometry synthesis, and
differentiable rendering. Researchers in computer graphics often have to turn to
references outside of graphics research to study identities such as the Reynolds
Transport Theorem or the geometric relationship between stress and strain tensors.
This course presents a comprehensive introduction to exterior calculus, which covers
many of these advanced topics in a geometrically intuitive manner. The course
targets anyone who knows undergraduate-level multivariable calculus and linear
algebra and assumes no more prerequisites. Contrary to the existing references,
which only serve the pure math or engineering communities, we use timely and
relevant graphics examples to illustrate the theory of exterior calculus. We also
provide accessible explanations to several advanced topics, including continuum
mechanics, fluid dynamics, and geometric optimizations. The course is organized into
two main sections: a lecture on the core exterior calculus notions and identities with
short examples of graphics applications, and a series of mini-lectures on graphics
topics using exterior calculus.


## Page 4

[No extractable text on this page]


## Page 5

Preface
Disclaimer
Thesenotesarestillbeingdevelopedandtheycontainmistakes. Pleasevisitthecourse
project page athttps://stephaniewang.page/ExteriorCalculusInGraphics/for
the newest version. We encourage the readers to examine the statements and proofs
in these notes and determine the correctness themselves. If you come across any
errors / omissions, please email the authors while providing the page number and
notes version (available on the title page).
Prerequisites
This is a comprehensive beginner-level course to introduceexterior calculus to
students, researchers, educators, and developers. The course prerequisites include
only undergraduate-level linear algebra and multivariable calculus.
Course Rationale
The course aims to extend the mathematical tool set for the audiences to gain short
cuts and geometric intuitions through a variety of important advancements in modern
computer graphics. The scope where exterior calculus applies is not limited to geom-
etry processing which has been taught in computer graphics [Grinspun et al.(2006),
Crane et al.(2013)]. In particular, we cover examples including differentiable render-
ing, optimization techniques, continuum mechanics, optimal transports, and shape
synthesis. This course serves to fulfill the following goals:
I. Fill in the missing episodes of the mathematical language for graphics. Multi-
variable calculus and linear algebra lie at the center of continuous mathematics,


## Page 6

6
which is the pillar of computer graphics that aims at synthesizing our continuous
world. Furthermore, differential calculus has become increasingly important in
the recent developments of major areas of computer graphics such as render-
ing (e.g. differentiable rendering) and simulations (e.g. constitutive models).
However, the computation of differentials can appear less than intuitive using
the traditional tools from multivariable calculus. For instance, how does one
differentiate a surface integral
˜
Σ f dA regarding perturbations in the integra-
tion domain Σ? How does one differentiate a Dirac-δ function relative to its
placement? These questions naturally arise from the sensitivity analysis of
occlusion geometry in rendering and the differentiation of discontinuity and
collision in simulations. While the standard multivariable calculus curriculum
coverspartial derivativesusing coordinates,double and triple integrals, gradient
operators, and a few variations ofStokes Theorems, there remains a gap between
elementary vector calculus and cutting-edge graphics research. This course
provides a bridge to cross this gap by building on top of freshman calculus
and linear algebra and explaining various aspects ofexterior calculus using
examples in graphics.
II. Provide a reference for exterior calculus. Most existing texts on differen-
tial forms and exterior calculus are written for the community of differen-
tial geometers. While a few texts do provide engineering-related exposi-
tions [Flanders(1963), Frankel(2011)], most coverage of continuum mechan-
ics does not include physical simulations or rendering references. More and
more graphics papers (e.g. [Wang and Chern(2021)] in geometry optimization,
[Sellán et al.(2021),Yang et al.(2021)]inphysicssimulations, [ Nicolet et al.(2021),
Zhao et al.(2020a)] for inverse rendering) use the language of geometric calcu-
lus; there has been an increasing demand for a comprehensive reference for
exterior calculus in the graphics community. This course serves to fulfil the
demand by publishing an accompanying course notes that document a list of
exterior calculus notions and identities.
III. Illustrate continuous, geometric intuition to differential forms. Past appearance
of exterior calculus has been limited to courses covering discrete differential
geometry and geometry processing [Grinspun et al.(2006), Crane et al.(2013),
Crane(2018)]. These material focuses on a discrete and computational aspect of
exterior calculus. In particular, differential forms are described as data assigned
to points, edges, faces,etc. Expanding these discrete ideas to continuous ones is
not immediately obvious. This course introduces geometric interpretations for
the continuous exterior calculus that best illustrate the structure dependency.
With these interpretations in mind, one gains more accurate intuitions to the
important concepts in simulations and optimization methods.
Course Contents
The course is organized into two main sections. The first section consists of core
technical exposition of exterior calculus with short applications in graphics along the


## Page 7

7
way. The second section is a few application-focused topics formulated with exterior
calculus.
Part I: Fundamentals
The course starts with the linear algebra ofvectors and covectors. Vectors are
arrows that represent direction, whereas covectors arecontour planesthat represent
slopes. These two concepts are distinct. The significant application for vectors and
covectors is the optimization method ofgradient descent. How does one translate
the information of slope of an objective function to an update direction in an
iterative optimization? It turns out that the method is not unique. Leveraging the
distinction between vectors and covectors can lead to efficient optimization schemes
(see Example 3.9.)
The course moves on to differential forms and introduces three pictures of
differential forms:
(i) Alternating multilinear form.A direct generalization of covectors from contour
planes to lines and points. This picture is the linear algebra aspect of differential
forms.
(ii) Fields to be integrated along geometries.Differential forms are to be paired
with test geometries. For example,flux and stress is to be evaluated on a piece
of surface. Calculus operators are adjoint operators of geometric operations
across the form-geometry pairing. This picture has been integrated in the
computation tools of Discrete Exterior Calculus.
(iii) Codimensional geometry. A point cloud represents a probability measure.
Similarly, a curve cloud, surface cloud,etc. are differential forms. Calculus
operators directly translate to geometric operations on these codimensional
geometries. This picture is the Geometric Measure Theory aspect of differential
forms.
Exterior calculus operations including the wedge product, interior product, exterior
derivative, and pullback are associated to geometric operations of intersection,
extrusion, boundary, and deformation, respectively. The course demonstrates that
many vector identities are examples of self-evident topological statements. The
differentiation of these calculus operations are also covered. The course also covers
Lie derivatives and their applications in continuum mechanics.
Part II: Graphics Topics in Exterior Calculus
While short applications are mentioned along the previous part, the second part of
the course focuses on a few applied topics.
(i) Chapter 3: Geometric optimizations.Optimization problems involving geome-
try is a crucial bit of computer graphics research. We discuss different geometry
representations and how they affect the downstream computations of geometric
properties like boundary and topological changes. We also provide ageometric
picture of the theory of optimizations, where readers will find out about the
important of choosing the correct metric for theirgradient descent method.


## Page 8

(ii) Chapter 4: Continuum Mechanics.Hyperelasticity models are the fundamental
physical models for soft body simulations. These physical models usually
involve many matrix fields representing the stress and strain. The course
decodes these matrices and describe them using the appropriate differential
forms. The formulation makes constitutive models more transparent.
(iii) Chapter 5: Fluid dynamics.The inviscid incompressible fluid flow is governed
by the Euler equation. By applying exterior calculus, we elucidate an alternative
formulation for the Euler equation that uses the velocity covector field as the
primary variable. Using this reformulation, one can obtain deeper insights in
the flow of fluids and come up with better algorithm for their simulation.
Speaker Biographies
Stephanie Wang – https://stephaniewang.page/
Dr. Stephanie Wang is a postdoctoral researcher in Computer Science and Engi-
neering at UCSD. She received her PhD in Mathematics from UCLA in 2020 with
a dissertation on simulating various materials using the Material Point Method.
Her research interests lie in in the intersection of mathematical analysis, scientific
computing, and computer graphics. She works on problems arising from physical
simulations and geometry processing by analyzing the mathematical models and
improving the numerical methods. In her spare time, she enjoys walking for many
hours in the mountains.
Mohammad Sina Nabizadeh – https://sinabiz.github.io/
Mohammad Sina Nabizadeh is a PhD student in Computer Science and Engineering
at UCSD. There, he is advised by Professors Albert Chern and Ravi Ramamoorthi. In
2020, he received his bachelors in Computer Engineering at the University of Waterloo,
Canada, where he was advised by Professor Christopher Batty at the Computational
Motion Group. His interests lie in many different fields of computer graphics research
such as geometric fluid dynamics, geometry processing, and rendering.
Albert Chern – https://cseweb.ucsd.edu/~alchern/
Prof. Albert Chern is an assistant professor in Computer Science and Engineering at
UCSD. He received his PhD in Applied and Computational Mathematics at Caltech
in 2017. He worked as a postdoctoral researcher in Mathematics at TU Berlin from
2017 to 2020 and began his assistant professorship at UCSD in 2020. Prof. Chern’s
research interests lie in the interplay among differential geometry, numerical partial
differential equations, and their applications in geometry processing and physics
simulations in computer graphics.
Acknowledgements
This work was funded by NSF CAREER Award 2239062 and UC San Diego Center
for Visual Computing. Additional support was provided by the WiGRAPH Rising
Stars Program, SideFX Software, and Activision Blizzard.


## Page 9

Contents
I Fundamentals
1 Vectors and Covectors . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
1.1 Dual Pairing 15
1.1.1 Geometric picture of vectors and covectors . . . . . . . . . . . . . . . . . . . . . . . 16
1.1.2 Annihilator . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
1.1.3 Adjoint . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
1.2 Endomorphisms and Bilinear Forms 18
1.2.1 Quadratic form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
1.3 Vector–Covector Conversion 1: Dual Basis 19
1.4 Vector–Covector Conversion 2: Metric 21
1.5 Vector Fields and Covector Fields 24
1.6 Differential of a Function 25
1.6.1 Conversion 1: to partial derivatives . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
1.6.2 Conversion 2: to gradient vector . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
1.6.3 Pushforward of vectors . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
1.6.4 Pullback of covectors . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
1.7 Manifolds 29
2 Exterior Calculus . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
2.1 From Multivariable Calculus to Exterior Calculus 31
2.1.1 Line and surface integral . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
2.1.2 Changing variables for multivariable integrals . . . . . . . . . . . . . . . . . . . . . . 33


## Page 10

2.1.3 Green, Gauss and Kelvin–Stokes theorems . . . . . . . . . . . . . . . . . . . . . . . . . 34
2.2 An Overview of the Language 35
2.3 Differential Forms 37
2.3.1 Integration and pullback . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
2.3.2 Wedge product and interior product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
2.3.3 Exterior derivative . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
2.3.4 Differential forms as codimensional geometries . . . . . . . . . . . . . . . . . . . . . 47
2.4 Vector Fields as Derivations 49
2.4.1 Algebra and derivations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
2.4.2 Lie algebra for vector fields . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 50
2.4.3 Practical calculation of Lie bracket . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
2.4.4 Integrability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 52
2.5 Covariant Derivatives and Vector-Valued Forms 54
2.6 Lie Derivative 56
2.6.1 General definition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
2.6.2 Lie derivative for functions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
2.6.3 Lie derivative for vector fields . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
2.6.4 Lie derivative for differential forms . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 60
2.6.5 Useful identities . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
2.6.6 Lie derivatives in the 3D Cartesian space . . . . . . . . . . . . . . . . . . . . . . . . . . 62
2.7 Pairings, Inner Products and Hodge Stars 64
II Graphics Topics in Exterior Calculus
3 Geometric Optimizations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
3.1 Geometry representations 69
3.1.1 Lagrangian representations: manifold embedding . . . . . . . . . . . . . . . . . 69
3.1.2 Integration pairing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 72
3.1.3 Exterior calculus on combinatorial surfaces and curves (DEC) . . . . . . . . 73
3.1.4 Eulerian representations: geometric measure theory . . . . . . . . . . . . . . . . 74
3.2 A Geometric view of optimization problems 78
3.2.1 Unconstrained problems on (finite-dimensional) manifolds . . . . . . . . . . . 79
3.2.2 Unconstrained problems on functions and differential forms . . . . . . . . . . 79
3.2.3 Optimization with equality constraints . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
3.2.4 Karush–Kuhn–Tucker conditions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
3.3 Computational methods for optimization problems 85
3.3.1 Direct and iterative methods for unconstrained problems . . . . . . . . . . . . 85
4 Continuum Mechanics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 89
4.1 Deformation map 90
4.2 Elasticity overview 91


## Page 11

4.3 Tensor Algebra 93
4.3.1 Tensor product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 93
4.3.2 Tensor power . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 94
4.3.3 Pullback bundle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 96
4.3.4 Type algebra . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 96
4.4 Postulates of Elasticity 99
4.4.1 Deformation gradient . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 99
4.4.2 Pullback metric . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 100
4.4.3 Strain energy density function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
4.5 Derivation of Elasticity 102
4.5.1 Summary of the derivation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 104
4.6 Cauchy stress tensor 105
4.7 More on the strain energy density function 107
4.7.1 Strains . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 108
4.7.2 Isotropic models . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 109
4.8 Conclusion 113
5 Fluid Dynamics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 115
5.1 Euler equations 116
5.1.1 Vector-based Euler equations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 116
5.1.2 Covector Euler equations as a constrained minimization . . . . . . . . . . . . 119
5.2 Advantages of Covector Euler Equation 120
5.3 Conclusion 125
III Appendix
Bibliography . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 129
Index . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 131


## Page 12

[No extractable text on this page]


## Page 13

I
1 Vectors and Covectors . . . . . . . . . . 15
1.1 Dual Pairing
1.2 Endomorphisms and Bilinear Forms
1.3 Vector–Covector Conversion 1: Dual Basis
1.4 Vector–Covector Conversion 2: Metric
1.5 Vector Fields and Covector Fields
1.6 Differential of a Function
1.7 Manifolds
2 Exterior Calculus . . . . . . . . . . . . . . . . . 31
2.1 From Multivariable Calculus to Exterior Calculus
2.2 An Overview of the Language
2.3 Differential Forms
2.4 Vector Fields as Derivations
2.5 Covariant Derivatives and Vector-Valued
Forms
2.6 Lie Derivative
2.7 Pairings, Inner Products and Hodge Stars
Fundamentals


## Page 14

[No extractable text on this page]


## Page 15

1. Vectors and Covectors
This chapter is a review of Linear Algebra, but with emphasis on drawing distinction
between vectors and covectors. We state a few theorems from linear algebra along
the exposition. Most linear algebra textbooks would state the theorems for matrices,
and hence inherently basis dependent. We reprise the theorems using the language
of vectors and covectors. We skip the proofs of most of these theorems. Readers
can easily reconstruct the proofs by following the matrix counterpart from any
matrix-based linear algebra textbook.
1.1 Dual Pairing
The dual pairing is a recurring operation throughout linear algebra. Linear combi-
nations of vectorsa1⃗v1 + a2⃗v2 + a3⃗v3 are pairing between a list of coefficients and a
list of vectors. Matrix multiplications pair row vectors and column vectors:

| r⊺
1
|
| r⊺
2
|


| | |
c1 c2 c3
| | |

 =
r⊺
1c1 r⊺
1c2 r⊺
1c3
r⊺
2c1 r⊺
2c2 r⊺
2c3

. (1.1)
In a linear system of equations, for example
1 kg 1 kg
2 kg 3 kg
 x $/kg
y $/kg

=
$ 3
$ 8

, (1.2)
we see pairings between arrays quantities (rows with unit of kilograms) and an array
of prices (x and y) that produce scalars in costs (right-hand side). From these
examples, we observe that the pairings are betweendifferent typesof objects. In
particular the pairings arenot inner product. It does not make sense to talk about
“cosine of angles” between two vectors of different units!


## Page 16

16 Chapter 1. Vectors and Covectors
⃗0
⃗v
α= 2
α= 1
α= 0
α=−1
⃗0
⃗v
α= 1
α= 0
Figure 1.1 Covector-vector pairing (left) and a simplified representation of a
covector using only a single slab (right). A covectorα is a linear scalar
function that can be visualized as a series of equidistant codimension-
one planes (hyperplanes) representing its level sets. A vector is
represented by an arrow based at the origin⃗0. The dual pairing
of covector α and vector⃗v is computed by counting the number of
piercings of the arrow (⃗v) through the hyperplanes (α).
To distinguish the two types of objects in the linear pairing, we call one of the
object vector and the other onecovector. A covector is to be paired with a vector.
Definition 1.1 A covector is a scalar linear function of vectors. The evaluation,
also known as the dual pairing, of a covectorα and a vector⃗v is denoted by
α(⃗v) = ⟨α|⃗v ⟩ = ⟨⃗v |α⟩. (1.3)
Definition 1.2 — Dual space. Let V be a real vector space. The space of all
covectors on V is called thedual space V ∗ = {α: V
linear
− − − →R}.
Theorem 1.1 For a finite dimensional spaceV, we haveV ∗∗ ∼= V.a In infinite
dimensional cases, we may haveV ∗∗ ⊇ V.
aThis isomorphism is canonical, given byev: V → V ∗∗, ev(⃗v) := (α 7→ ⟨α|⃗v ⟩). In particular,
this is a stronger isomorphism than just having the same dimension. For example, whenV is a
finite dimensional space, one can say thatV ∼= V ∗ because their dimensions are the same. But
there is no canonical map betweenV and V ∗.
Throughout the note, we will postulate thatV ∗∗ = V.
1.1.1 Geometric picture of vectors and covectors
The standard geometric picture of a vector⃗v ∈ V is an arrow based at the origin
⃗0 ∈ V. The geometric postulates for a vector spaceV is that it is an affine space
with a distinguished point called the origin⃗0. An affine space is a space equipped
with the notion of parallelism, or a projective space with a distinguished hyperplane


## Page 17

1.1 Dual Pairing 17
⃗v
⃗0
⃗u
a⃗u
⃗u + ⃗v α β
γ
Figure 1.2 Addition of vectors (left) and covectors (right).
at infinity, or equivalently a Euclidean space without metric. The vector addition
⃗u + ⃗v is constructed by drawing a parallelogram formed by⃗u, ⃗v and connecting the
origin to its opposite vertex (see Figure 1.2, left). The scaling of a vectora⃗v can be
constructed using similar triangles and diagonal bisection in parallelograms.
The geometric picture of a covectorα ∈ V ∗ is a foliation of equidistant parallel
hyperplanes in V, each of which represents a level set{α = k } ⊂ V of the scalar
linear function α. The dual paring⟨α|⃗v ⟩ measures the number of planes ofα pierced
through by the arrow⃗v. See Figure 1.1, left.
Since we know how to geometrically construct equidistant parallel hyperplanes
(again via the parallel postulate) we only need to draw two special level sets:{α = 0}
and {α = 1} for illustrating α. Note that {α = 0} = ker α passes through the origin.
Hence each covector is a slab with one side leaning against the origin. See Figure 1.1,
right.
The covector additionα + β is constructed by first intersecting the two slabs,
which forms a parallelogram prism, followed by building a new slab whose far side
from the origin passes through the diagonal of the parallelogram that is not incident
to the origin (see Figure 1.2). The scaling of a covectoraα is defined by scaling the
thickness of the slab by1/a. In particular, the narrower the slab is, the more dense
the foliation of level sets ofα is, and the larger the slope the linear functionα has.
1.1.2 Annihilator
It is important to note that the dual pairing is different from an inner product. The
dual pairing pairs a vector and a covector, whereas the inner product measures how
aligned two vectors are. We do not need the inner product structure (a metric) to
perform dual pairing. In fact, many inner product related notions we have seen in a
first course in linear algebra are independent of metric. Here, we give an example:
the notion of “orthogonal complement” of a subspace will be metric-independent if
we treat it as a subspace in the dual space.


## Page 18

18 Chapter 1. Vectors and Covectors
Definition 1.3 — Annihilator. Let U ⊂ V be a linear subspace of the vector space
V. The annihilator U ◦ ⊂ V ∗ of U is a linear subspace in the dual space defined
by
U ◦ = {α ∈ V ∗ | ⟨α|⃗u⟩ = 0 for all ⃗u ∈ U } (1.4)
Theorem 1.2 U ◦◦ = U.
1.1.3 Adjoint
A linear map A: U
linear
− − − →V from a vector space U to another vector space V
induces a dual (adjoint) map from the dual target spaceV ∗ back to the dual domain
U ∗.
Definition 1.4 The adjoint of a linear map A: U
linear
− − − →V is the linear map
A∗ : V ∗ linear
− − − →U ∗ defined by
⟨A∗λ|⃗u⟩ = ⟨λ|A⃗u⟩ for all ⃗u ∈ U and λ ∈ V ∗. (1.5)
Theorem 1.3 A∗∗ = A.
In caseU , V are equipped with bases that allow a matrix representationA = (Aij )
for A, the adjointA∗ is simply the transposeA⊺.
Definition 1.5 The four fundamental subspaces of a linear mapA: U
linear
− − − →V
are
• kernel: ker(A) := {⃗u ∈ U | A⃗u = 0} ⊂ U,
• image: im(A) := {A⃗u | ⃗u ∈ U } ⊂ V,
• cokernel: ker(A∗) := {λ ∈ V ∗ | A∗λ = 0} ⊂ V ∗,
• coimage im(A∗) := {A∗λ | λ ∈ V ∗} ⊂ U ∗.
Theorem 1.4 — Theorem of four fundamental subspaces.
ker(A)◦ = im(A∗), im(A)◦ = ker(A∗) (1.6)
1.2 Endomorphisms and Bilinear Forms
In the previous section, we distinguish the difference between vectors and covectors.
In this section, we continue to draw the distinction between them, and separate
linear transformations of typeV
linear
− − − →V and V
linear
− − − →V ∗. While both types can
be represented by a square matrix, their geometric picture are vastly different.
A linear map A: V
linear
− − − →V that maps a vector space to itself is called an
endomorphism. For example, the identity map is an endomorphism. An eigenvalue


## Page 19

1.3 Vector–Covector Conversion 1: Dual Basis 19
problem A⃗v = λ⃗v is formulated for endomorphismsA. Powers Ak, exponentials e A
and so on are defined only for endomorphisms.
A linear mapB : V
linear
− − − →V ∗ that maps a vector space to its dual space is called
a bilinear form. For each⃗v ∈ V, the resulting valueB(⃗v) ∈ V ∗ is a covector. Recall
that a covector is a scalar-valued linear function that can take another vector and
return a scalar. That is, a bilinear map is to be evaluated likeB(⃗v)(⃗w) bi-linearly
dependent on the two input vectors⃗v , ⃗w ∈ V. In other words, a bilinear map can
also be viewed asB : V × V
bilinear
− − − − →R.
Note that the adjoint of a bilinear formB : V
linear
− − − →V ∗ would have the same
type B ∗ : V
linear
− − − →V ∗ (using V ∗∗ = V). Only for bilinear forms we can compareB
with B ∗ as they are objects of the same type.
A bilinear formB is said to besymmetric or self-adjoint if B = B ∗. Equivalently,
a bilinear form is symmetric ifB(⃗u)(⃗v) = B(⃗v)(⃗u) for all ⃗u, ⃗v ∈ V. A bilinear form
is said to beskew-symmetric if B = −B ∗; i.e. B(⃗u)(⃗v) = −B(⃗v)(⃗u).
1.2.1 Quadratic form
A symmetric bilinear form is equivalent to a quadratic form. A quadratic form
q : V
quadratic
− − − − − →R is a function such thatq(a⃗v) = a2q(⃗v) for all scalar a ∈ R. A
bilinear form B : V
linear
− − − →V ∗ gives rise to a quadratic form byq(⃗v) := B(⃗v)(⃗v).
Conversely, a quadratic formq : V
quadratic
− − − − − →R gives rise to a symmetric bilinear form
B : V
linear
− − − →V ∗ using the formula for expanding a square
q(⃗u + ⃗v) = q(⃗u) + q(⃗v) + 2B(⃗u)(⃗v). (1.7)
The symmetric bilinear formB(⃗u)(⃗v) = 1
2(q(⃗u + ⃗v) − q(⃗u) − q(⃗v)) is called the
polarization of q. Therefore, a symmetric bilinear form is fundamentally the same
as a quadratic form.
1.3 Vector–Covector Conversion 1: Dual Basis
Vectors and covectors are different. The former is an arrow based at the origin, and
the latter is a slab bounded by a pair of parallel hyperplanes, one of which passes
through the origin. Without additional structure, there is no method converting a
vector to a covector.
One scenario where we can convert vectors to covectors is when we have a full set
of basis vectors. SupposeV is an n-dimensional vector space. Suppose⃗v1, . . . , ⃗vn are
n linearly independent vectors. Then they form a basis. Geometrically, they span a
non-degenerate parallelepiped. This parallelepiped has faces giving rise ton pairs of
parallel hyperplanes, one of which passes through the origin. As such, there emerges
n covectors. This construction is canonical and unique. The resulting covectors is
called the dual basis for the dual spaceV ∗. See Figure 1.3, left.
Conversely, givenn linearly independent covectors, as a basis forV ∗, we can
geometrically visualize them asn slabs which intersect into parallelepiped with a
corner being the origin. By reading off the edge vectors of the parallelepiped based
at the origin, we get the find the dual basis forV.
The following is the algebraic definition of the above geometric construction.


## Page 20

20 Chapter 1. Vectors and Covectors
Theorem 1.5 — Dual basis. Let ⃗v1, . . . , ⃗vn ∈ V be a basis for a vector spaceV.
Then there exists a unique set of covectorsα1, . . . , αn ∈ V ∗ forming a basis for
V ∗ such that
⟨αi |⃗vj ⟩ = δij =
(
1 i = j
0 i ̸= j . (1.8)
If V = Rn and ⃗v1, . . . , ⃗vn are column vectorsv1, . . . ,vn, then the relationship
between v1, . . . ,vn and the dual basis as row vectorsα1, . . . , αn is a matrix inversion


| α1
|
...
| αn
|

 =


| |
v1 · · · vn
| |


−1
. (1.9)
Note that we need a full set of basis vectors to produce a full set of basis covectors.
We cannot turn a single vector to a single covector without any additional structure.
■ Example 1.1 — Diagonalization. Rn = R ⊕ R ⊕ · · · ⊕ R is a special vector
space called Cartesian space. Each element is ann-tuple of numbers. A map
D: Rn → Rn is called adiagonal matrix if the map is just a channel-wise scaling
D: (r1, . . . ,rn) 7→ (λ1r1, . . . , λnrn). (1.10)
A basis ⃗v1, . . . , ⃗vn for a vector space V induces a map X : Rn linear
− − − →V by
X ((r1, . . . ,rn)) :=Pn
i=1 ri⃗vi. Note that the inverse mapX −1 : V
linear
− − − →Rn is given
by X −1(⃗u) = (⟨α1|⃗u⟩, . . .⟨αn|⃗u⟩) where α1, . . . , αn ∈ V ∗ is the dual basis.
A diagonalization of an endomorphismA ∈ End(V ) is to express the endo-
morphism by
A = X ◦ D ◦ X −1, (1.11)
which is achieved by solving the eigenvalue problem.
Definition 1.6 The trivial Cartesian metric onRn and Rn∗ = Rn is the identity
map I.
If V is equipped with a metric, then a basisX : Rn linear
− − − →V is orthonormal if
and only ifX : (Rn, I) → (V , ♭) is an isometry (a map that preserves the metric).
Theorem 1.6 If X : (Rn, I)
isometry
− − − − →(V , ♭) is an orthonormal basis, then
X −1 = X ∗ ◦ ♭ (1.12)
■
■ Example 1.2 — Polar decomposition. Let U , V be two spaces equipped with


## Page 21

1.4 Vector–Covector Conversion 2: Metric 21
⃗e1
⃗e2
α1
α2 ⃗v ♭
⃗v
♭(⃗x)(⃗x) = 1
“unit sphere”
Figure 1.3 Converting covectors to vectors and vice versa using either the dual
basis (left) or a metric (right).
metric ♭U , ♭V. The polar decomposition of a linear mapA: U → V is
A = RY , where R : U
isometry
− − − − →V and Y ∈ End(U ) (1.13)
such that ♭U ◦ Y is a symmetric positive definite bilinear form. ■
1.4 Vector–Covector Conversion 2: Metric
A metric or an inner product is an additional structure for a vector space. The
most common vector space equipped with a metric is the Euclidean space(Rn, ⟨·, ·⟩)
where the Euclidean inner product⟨⃗u, ⃗v ⟩ measures the length and the angle between
vectors ⃗u and ⃗v.
Definition 1.7 A metric is an injective symmetric bilinear form♭: V
linear
− − − →V ∗
(injectivity means thatker(♭) = {0} or that ♭ is invertible). We usually denote
♭(⃗u)(⃗v) = ⟨⃗u, ⃗v ⟩ and ♭(⃗u) = ⃗u ♭. The inverse♭−1 of the bilinear form♭ is denoted
by ♯ = ♭−1 : V ∗ linear
− − − →V.
The symbols ♭, ♯ are called flat and sharp respectively, together they are called
musical isomorphisms.
Recall that a symmetric bilinear form is equivalent to a quadratic form. In the
case of a metric, we denote the quadratic form by| · |2:
|⃗v |2 = ♭(⃗v)(⃗v) = ⟨⃗v ♭|⃗v ⟩ = ⟨⃗v , ⃗v ⟩. (1.14)
Conversely, we can derive the musical isomorphism♭ from the quadratic form| · |2
by using the polarization identity ifV is a R-vector space:
♭(⃗u)(⃗v) = ⟨⃗u, ⃗v ⟩ = 1
2

|⃗u + ⃗v |2 − |⃗u|2 − |⃗v |2
. (1.15)
A metric | · |2 on V induces a metric onV ∗ given by
|α|2
V ∗ := ⟨α|α♯⟩. (1.16)


## Page 22

22 Chapter 1. Vectors and Covectors
Geometrically, we can visualize a metric structure| · |2 on V by the “unit sphere”
Q :=

⃗x ∈ V
 |⃗x |2 = 1

⊂ V , (1.17)
which is a non-degenerate quadratic surface in the affine space centered at the origin.
In addition to the parallelism structure in the vector space, we have a “compass”
allowing us to define distances and angles. The relationship between the arrow⃗v ∈ V
and the slab⃗v ♭ ∈ V ∗ is that the tip⃗v of the arrow and the{⃗v ♭ = 1} hyperplane
of the slab are inpolarity with respect to the quadratic surfaceQ. See Figure 1.3,
right.
Definition 1.8 In projective geometry, thepolar hyperplane h to a pointx with
respect to a quadratic hypersurfaceQ is the hyperplane that passes through all
the points on Q at which the tangent plane toQ contains x. If x is inside Q
so that there is no tangent plane ofQ containing x, then h is defined by the
collection of points (outside ofQ) whose polar hyperplane containsx. The point
x is called thepole of the planeh with respect toQ if h is the polar of x.
If α = ⃗v ♭, then the parallel hyperplanes ofα are orthogonal to⃗v with respect to
the metric ♭.
Musical isomorphisms generally give different vector–covector conversions from
the dual basis construction. In fact:
Theorem 1.7 Let ⃗v1, . . . , ⃗vn ∈ V be a basis for a vector spaceV and let α1, . . . , αn
be its dual basis. Let♭ be a metric onV. Then αi = ⃗v ♭
i if and only if⃗v1, . . . , ⃗vn is
an orthonormal basis with respect to the metric♭.
Definition 1.9 A metric is calledpositive definite if |⃗v |2 > 0 for all ⃗v ̸= 0.
For most discussion we do not need to assume that a metric is positive definite.
■ Example 1.3 — Eigenvalue problems for symmetric matrices. Eigenvalue prob-
lems are posed for endomorphisms and symmetry are adjective only for bilinear
forms. This makes us wonder what is going on with the famous theorem stating
that “if a matrix is symmetric, then it has real eigenvalues and the eigenvectors
are orthogonal.” The answer is that there is a hidden metric that is often omitted.
Here is the restored version of the statement.
Let B , C be two bilinear forms of typeV
linear
− − − →V ∗. Then it is sensible to pose
the eigenvalue problem as
B⃗v = λC ⃗v . (1.18)


## Page 23

1.4 Vector–Covector Conversion 2: Metric 23
Theorem 1.8 If ♭ is a positive definite metric onV, and B : V
linear
− − − →V ∗ is a
symmetric bilinear form. Then there exists an orthonormal basis⃗v1, . . . , ⃗vn
with respect to♭ and real numbersλ1, . . . , λn ∈ R such that
B⃗vi = λi ♭⃗vi . (1.19)
⃗vi and ⃗vj are perpendicular under both♭ and B: ♭(⃗vi)(⃗vj ) = B(⃗vi)(⃗vj ) = 0 for
i ̸= j.
Theorem 1.9 The result of Theorem 1.8 holds (except that the eigenvalues
λ1, . . . , λn may be complex) for the more generalnormal bilinear forms. A
bilinear form B : V
linear
− − − →V ∗ is called normal if
B ∗ ◦ ♯ ◦ B = B ◦ ♯ ◦ B ∗. (1.20)
■
■ Example 1.4 — Rotation matrices. A matrix R is called a special orthogonal
matrix or a rotation matrix ifR⊺R = I. Rotation is supposed to be an endomor-
phism, as it maps a vector to a rotated vector in the same space. But then the
adjoint R⊺ would be an endomorphism on the dual spaceV ∗. It does not make
sense to composeR⊺ with R. What is missing here is some metric dependency.
Definition 1.10 Let V be a vector space with metric♭: V
linear
− − − →V ∗. An endo-
morphism R ∈ End(V ) is said to beorthogonal or unitary if the composition
of the following cyclic sequence of linear maps is the identity endomorphism
V R // V
♭

V ∗
♯
OO
V ∗
R∗
oo
(1.21)
If det(R) = 1, then R is called a special unitary transform. Another way to
describe unitarity is that the pullback metricR∗ ◦ ♭ ◦ R by R is the same as
the metric ♭ = R∗ ◦ ♭ ◦ R. In other words, it is alinear isometry.
Definition 1.11 In general, for two spacesU , V both equipped with metric
♭U , ♭V, a linear mapA: U
linear
− − − →V is an isometry if
A∗ ◦ ♭V ◦ A = ♭U . (1.22)
Equivalently,
⟨A⃗x , A⃗y⟩V = ⟨⃗x , ⃗y⟩U for all ⃗x , ⃗y ∈ U. (1.23)
■


## Page 24

24 Chapter 1. Vectors and Covectors
■ Example 1.5 — Singular value decomposition. Let U , V be two spaces equipped
with metric ♭U , ♭V. The singular value decomposition (SVD) of a linear map
A: U → V is to find an orthonormal basisEU : Rm linear
− − − →U and an orthonormal
basis EV : Rn linear
− − − →V such that
A = EV ◦


σ1
σ2
. . .

 ◦ E −1
U|{z}
E ∗
U ◦♭U
(1.24)
where σ1 ≥ σ2 ≥ · · · and the diagonal matrix may be truncated to a rectangular
matrix if m ̸= n. ■
1.5 Vector Fields and Covector Fields
A typical picture of a vector field is many arrows scattered over a domain, each
having a different based point. This collection of arrows represents a flow where each
arrow gives away the flow direction at the location of its base point. Note that the
arrows composing the vector field are based at different based points, which is in
contrast to vectors in a vector space which are all based at the same origin. Therefore,
to describe vector fields sensibly, we must consider a collection of vector spacesVp
indexed by the base pointp in the domain. A vector field⃗v is an assignment of a
vector ⃗vp ∈ Vp for every pointp in the domain.
With the above picture in mind, let us introduce the standard mathematical
notations for vector fields.
Let M ⊂ Rn be a region in ann-dimensional space representing a domain. For
each p ∈ M, define a vector spaceTpM given by a copy ofRn. We callTpM the
tangent space to the domainM at p. The elements ofTpM are called tangent
vectors at p.
The elements ofTpM are associated withvelocities at which a particle atp can
travel. For each smooth parameterized curveγ : (−ϵ, ϵ) → M that passes through
p at t = 0, that isγ(0) = p, the instantaneous velocitydγ
dt at t = 0 is an element
of TpM; that is, ˙γ(0) ∈ TpM. Conversely, for each tangent vector⃗vp ∈ TpM, there
exists (non-uniquely) a parameterized curveγ : (−ϵ, ϵ) → M such that γ(0) = p and
˙γ(0) = ⃗vp.
The collection TM = {(p, ⃗vp) | p ∈ M , ⃗vp ∈ TpM } =F
p∈M TpM of all tangent
vectors at various base pointsp is called thetangent bundle over M. There is a
projection operator π : TM → M, π : ⃗vp 7→ p. That is,π takes in a tangent vector
⃗vp ∈ TM and returns the information p ∈ M of which base point⃗vp has. The
tangent space TpM at p is the same as the preimageπ−1({p}) of the pointp via the
projection. The preimage π−1({p}) of a point via the projection of a bundle is often
called a fiber of the bundle.
A vector field is an assignment of an element in each fiber of the tangent bundle.
Such an object is called asection of the bundle.


## Page 25

1.6 Differential of a Function 25
Definition 1.12 A section ⃗v of a bundleπ : TM → M is a map⃗v : M → TM such
that π ◦ ⃗v = idM. That is, π(⃗v(p)) = p for all p ∈ M.
The formal definition given above is equivalent to saying that at any given point
p ∈ M, the map⃗v(p) is a vector in the tangent spaceTpM of the pointp, and hence
π(⃗v(p)) = p.
The space of all sections of the tangent bundle (i.e. the space of all vector fields
defined over M) is denoted byΓ(TM ). So, a vector field would be instanced as
⃗v ∈ Γ(TM ).
A covector fieldα ∈ Γ(T ∗M ) is a section of thecotangent bundle T ∗M over M.
The cotangent bundle is defined such that each of its fiberT ∗
p M is the dual space of
the tangent spaceTpM at the same base point.
1.6 Differential of a Function
One of the most important applications of distinguishing vectors and covectors is to
understand the meaning of taking derivatives of a function.
Let M ⊂ Rn be a region in ann-dimensional space representing a domain, on
which we will consider generic scalar-valued non-linear functionsg : M → R.
Definition 1.13 The differential of a functiong : M → R at a pointp ∈ M in a
domain M is a covectordg|p based at p. This covector takes in a vector⃗vp based
at p (representing a small displacement aboutp) and returns the rate of change
⟨dgp|⃗vp⟩ of g in the direction of⃗vp. Concretely, for each⃗vp ∈ TpM consider a
parameterized curve γ : (−ϵ, ϵ) → M with γ(0) = p and ˙γ(0) = ⃗vp, and define
D
dg|p
⃗vp
E
:= d
dt

t=0
g(γ(t)). (1.25)
The differentialdg of a scalar functiong : M → R is a covector fielddg ∈ Γ(T ∗M )
describing the “slope” ofg at every point by the best fitting linear function on every
tangent space.
1.6.1 Conversion 1: to partial derivatives
A coordinate system on M is a set of scalar functionsx1 : M → R, . . . ,xn : M → R
such that the covectorsdx1, . . . ,dxn form a basis for every cotangent spaceT ∗
p M.
Let ⃗e1, . . . , ⃗en ∈ Γ(TM ) be the dual basis ofdx1, . . . ,dxn.
Definition 1.14 — Partial derivatives. The partial derivative ofg along the k-th
direction in a coordinate system(x1, . . . ,xn) is defined by
∂g
∂xk
:= ⟨dg|⃗ek ⟩. (1.26)
Equivalently, ∂g
∂x1
, . . . , ∂g
∂xn
are the coefficients when expressing the covectordg in


## Page 26

26 Chapter 1. Vectors and Covectors
terms of the covector basis from the coordinate system
dg = ∂g
∂x1
dx1 + · · · ∂g
∂xn
dxn. (1.27)
R The partial derivative ∂g
∂x1
depends not only on the coordinate functionx1 but
it depends on the entire coordinate systemx1, . . . ,xn. This is because the
construction relies on taking the dual basis. Intuitively, the partial derivative
depends on which other variables are fixed during the variation.
1.6.2 Conversion 2: to gradient vector
The gradient vector of a function g is the vector whose direction is the steep-
est ascending direction and whose magnitude is the slope along that direction.
Definition 1.15 — Gradient. Let M be a domain equipped with metric♭ on every
tangent space. Then thegradient grad g of a functiong : M → R is defined by
grad g := (dg)♯. (1.28)
One may use the polarity geometric picture of the musical isomorphism about the
unit sphere to see why the gradient vector points in the steepest ascending direction.
Note that the gradient of a function is independent of the coordinate. It does
however depend on a choice of metric.
R In many expositions in optimization or machine learning, the gradient is
defined by the array of partial derivatives
grad g ?=
 ∂g
∂x1
, . . . , ∂g
∂xn

. (1.29)
This is not true unless the coordinate system is orthonormal and therefore it
is misleading. Note that partial derivatives arise from the conversion of dual
basis, and the gradient arises from the conversion using a metric.
1.6.3 Pushforward of vectors
The idea of the differential of a functiondgp : TpM
linear
− − − →R of a scalar function
g : M → R can be extended for general maps.
Let ϕ: M → N be a general nonlinear map from a spaceM to another spaceN.
Then the differentiald ϕ of the mapϕ is a linear map between the corresponding
tangent spaces
d ϕp : TpM
linear
− − − →Tϕ(p)N . (1.30)
Such a linear map transforms a rate of change⃗vp ∈ TpM at the inputp ∈ M to a
rate of change of(d ϕp)(⃗v) ∈ Tϕ(p)N at the outputϕ(p) ∈ N (Figure 1.4). That is,
d ϕp(⃗vp) describes how sensitive the value ofϕ is depending on variation in the⃗v
direction.


## Page 27

1.6 Differential of a Function 27
Definition 1.16 — Pushforward. Let ϕ: M → N be a general nonlinear map. The
linear map ϕ∗ = d ϕ: TM → TN, with (ϕ∗)p : TpM
linear
− − − →Tϕ(p)N, is called the
pushforward map of ϕ. It is defined such that for every scalar functiong : N → R,
the composited scalar functionf := (g ◦ ϕ): M → R has the differential given by
the compositions of linear maps
df = dg ◦ ϕ∗. (1.31)
Theorem 1.10 — Jacobian matrix. Suppose we put a coordinate systemx1, . . . ,
xm : M → R on M and a coordinate system y1, . . . ,yn : N → R on N. Let
⃗a1, . . . , ⃗am be the coordinate vectors as the dual basis of the covector basis
dx1, . . . ,dxm. Similarly, let ⃗e1, . . . , ⃗en be the dual basis of dy1, . . . ,dyn. Now,
call ϕi := yi ◦ ϕ: M → R as the resulting coordinate value of the mappingϕ.
For each vector⃗v on M, we can write it under the basis as⃗v =Pm
i=1 vi⃗ai. The
resulting vector after being applied by pushforward isϕ∗⃗v =Pn
j=1 wj⃗ej. Then,


w1
...
wn

 =


∂ϕ1
∂x1
· · · ∂ϕ1
∂xm
... ...
∂ϕn
∂x1
· · · ∂ϕn
∂xm


| {z }
F


v1
...
vm

 (1.32)
where the partial derivatives are defined in the way of Section 1.6.1. The matrix
F ∈ Rn×m is called theJacobian matrix or the deformation gradient of ϕ under
the coordinates (x1, . . . ,xm) and (y1, . . . ,yn).
Theorem 1.11 The sensitivity analysis for a compositionψ ◦ ϕ: M → L of maps
ϕ: M → N and ψ : N → L is simply the composition of their pushforwards:
(ψ ◦ ϕ)∗ = ψ∗ϕ∗, or d(ψ ◦ ϕ)p = d ψϕ(p)d ϕp. (1.33)
This rule is called thechain rule.
Evaluating the differential by composing the chain of differentials of subcomponents
is the basis for theforward mode auto-differentiation programs.
1.6.4 Pullback of covectors
Definition 1.17 — Pullback of covectors. The adjoint
ϕ∗ : T ∗
ϕ(p)N
linear
− − − →T ∗
p M (1.34)
of the pushforwardϕ∗ : TpM
linear
− − − →Tϕ(p)N is called thepullback operator (for
covectors) via the mappingϕ: M → N. For each covector (field)α on N, ϕ∗α
becomes a covector (field) onM and is called the pullback covector throughϕ.


## Page 28

28 Chapter 1. Vectors and Covectors
p q
ϕ(p)
ϕ(q)
ϕ∗
⃗v ϕ∗⃗v
ϕ∗ α
ϕ∗α
M N
Figure 1.4 Given a map ϕ: M → N, a point p ∈ M is mapped to ϕ(p) ∈ N,
a vector ⃗v ∈ Tq M is sent toϕ∗⃗v ∈ Tϕ(q)N using the pushforward
operator, and a covectorα ∈ T ∗
ϕ(p)N is sent to a covectorϕ∗α ∈ T ∗
p M
using the pullback operator.
By definition of adjoint,
⟨ϕ∗α|⃗v ⟩ = ⟨α|ϕ∗⃗v ⟩ for all α ∈ T ∗
ϕ(p)N and ⃗v ∈ TpM. (1.35)
See Figure 1.4.
When written in coordinates, the pullback operator is the transpose of the
Jacobian matrix.
The wordpullback can also be used for composition of function. Supposeg : N →
R is a function on N and suppose ϕ: M → N. Then f : M → R defined by
f = g ◦ ϕ =: ϕ∗g is called thepullback of g via the mappingϕ.
In summary, the overloaded concept of pullback are given as follows. When it is
acted on functions and on covector fields: forϕ: M → N,
ϕ∗
func
: (N → R)
linear
− − − →(M → R), ϕ ∗
func
g = g ◦ ϕ (1.36)
ϕ∗
covec
: Γ(T ∗N )
linear
− − − →Γ(T ∗M ), ( ϕ∗
covec
α)|p = (d ϕ|p)∗(α|ϕ(p)). (1.37)
Now, the chain rule can be summarized as:
Theorem 1.12 — Pullback and differential commute. The pullbacks ϕ∗ for func-
tions g and covectors dg satisfy
d( ϕ∗
func
g) = ϕ∗
covec
(dg) (1.38)
Theorem 1.13 Let ϕ: M → N and ψ : N → L. Then
(ψ ◦ ϕ)∗ = ϕ∗ ◦ ψ∗. (1.39)


## Page 29

1.7 Manifolds 29
■ Example 1.6 — Back-propagation. Suppose we have the sensitivityϕ∗ = d ϕ,
ψ∗ = d ψ of maps ϕ: M → N and ψ : N → L. Suppose g : L → R is some “cost
function.” Throughϕ and ψ we can pull the function back and formulate a cost
function f on the parameter spaceM defined by f = g ◦ ψ ◦ ϕ.
How do we compute the differentialdfp at a particular set of parameters
p ∈ M?
In a forward-mode differentiation method, one would first say thatdfp is, under
a coordinate system(x1, . . . ,xm), given bydf = ∂f
∂x1
dx1 + · · ·+ ∂f
∂xm
dxm where ∂f
∂xi
=
df (⃗ai) where ⃗ai is the coordinate vector. To find each of these partial derivatives,
we expand df = (dg)(d ψ)(d ϕ), and evaluatedf (⃗ai) = (dg)(d ψ)(d ϕ)(⃗ai) for each i.
These pushforward operations have to be performed form numbers of time.
An alternative approach is the so-calledreversed-mode differentiation (a.k.a.
back-propagation)
dfp = (ϕ∗
p)(ψ∗
ϕ(p))(dgψ(ϕ(p))). (1.40)
In this case, we only need to pullback one covector (sinceg is scalar valued),
rather than pushing forwardm vectors like in the forward mode differentiation.■
1.7 Manifolds
The domain M discussed in Section 1.5 and onward were assumed to be a subset
of Rn. In general, the above above discussion also works seamlessly whenM is a
manifold. What is a manifold? At high level it is a generalization of curves and
surfaces, which are particularly interested in computer graphics. Its precise definition
in mathematics is somewhat subtle.
Consider the following curve that almost touches itself somewhere. When per-
forming computations on this curve, we care about the relation between point A and
point B a lot more than the relation between point A and point C, despite point C
being closer to point A in the “ambient” space, which is the whiteboard where the
curve was drawn on. This leads to us defining a customary “neighboring relation”
over a geometry instead of using the absolute Euclidean distance. Such neighboring
relation is formally referred to astopology. Mathematicians definetopological spaces
in the broadest sense, and later definemanifolds as topological spaces that can afford
differentiation and integration, similar to a Euclidean space.


## Page 30

30 Chapter 1. Vectors and Covectors
a manifold
 not a manifold
a manifold
 not a manifold
In essence, a manifold is a space that can be locally parameterized by a Cartesian
space. Through pullback and pushforward, calculus that is built upon differentials
of functions automatically carries over from Cartesian space to manifolds. So, in the
remainder of the course note, we can either think of a domain as a manifold or a
subset of Rn; the language is the same.


## Page 31

2. Exterior Calculus
In this chapter, we assume that the reader has a firm understanding of multivariable
calculus, as well as the linear algebra that involves vectors and covectors (Chapter 1).
However, you might wonder, why then, do we need to exploreexterior calculus if
multivariable calculus already provides a comprehensive mathematical framework?
Historically, exterior calculus has emerged as a tool primarily because it provides
powerful notations to elucidate the principles of differential and integral calculus on
manifolds, abstract entities that can represent general domains and curved geometries.
Under the framework, one carefully distinguishes coordinate-dependent multivariable
quantities, and directly works with their geometrically meaningful, coordinate-free
representations.
It turns out that exterior calculus is a powerful language not limited to the abstract
manifold study. It proves to be useful in the broader application of multivariable
calculus, even for problems defined on flat domains. Examples include solid mechanics,
fluid dynamics, and optimization problems. The coordinate-free formalism exposes
the underlying structures far better than piles of indices pointing to various coordinate
components. One may write down equations that relate geometric measurements,
say in a continuum, at a higher level that is closer to our physical and geometric
intuition. Consequently, this approach results in a clearer, more straightforward
pathway for mathematical reasoning for the phenomena and algebraic identities
within these differential equations.
2.1 From Multivariable Calculus to Exterior Calculus
When it comes to multivariable integration in the introductory calculus, there are two
important topics: change of variables (change of coordinates) formula, and integral
theorems namely the Green, Gauss, Stokes theorems. One of the motivations of
exterior calculus is to work in a framework that the change of variables are automatic,


## Page 32

32 Chapter 2. Exterior Calculus
and all the Stokes-like theorems are unified. Once we have such a framework, we
have a more unified way for talking about, for example, derivatives of changes of
variables (e.g. derivatives with respect to change of integration domain), which are
crucial in applications such as continuum mechanics and differentiable rendering.
Here is a quickly recap of these topics in multivariable calculus. We follow one
of the very first written textbooks on these topics, Maxwell’s 1873 “a Treatise on
Electricity and Magnetism, Vol. 1, Preliminary.” At the dawn of vector calculus,
Maxwell has made several remarks indicating that the natural structure to unify
multivariable calculus is to use the skew-symmetric structure of differential forms.
What exterior calculus is built upon is the linear algebra of these skew-symmetric
forms.
2.1.1 Line and surface integral
An important operation is the integration of the component of a vector field projected
along a line or a curve. This is called thecirculation of a vector field along a curve
(not necessarily closed).
Let γ = ( x1, x2, x3): [0, S] → R3 be a curve, and v = ( v1, v2, v3): R3 → R3 a
vector field. Then the circulation of the curve is given by
C =
ˆ S
0
⟨v, γ′⟩ ds which can be expressed as
=
ˆ S
0
v1
dx1
ds ds + v2
dx2
ds ds + v3
dx3
ds ds or simply
=
ˆ S
0
⟨v, d γ⟩ =
ˆ
γ([0,S])
v1 dx1 + v2 dx2 + v3 dx3
Here v1 dx1 + v2 dx2 + v3 dx3 is called a1-form. This quantityC with integral
´
γ([0,S])
generally depends on the entire pathγ([0, S]), as opposed to an integral
´ b
a depending
only on the two end pointsa = γ(0), b = γ(S). However, when within a certain
region the one-form takes the form of
v1 dx1 + v2 dx2 + v3 dx3 = dΨ for some potential functionΨ
that is, is an exact differential within that region, the value ofC becomes
C = Ψ(b) − Ψ(a)
and is the same for any two paths betweena and b, provided the path can be changed
into the other by continuous motion without passing out of this region.1
1The necessary condition for the 1-formv1 dx1 + v2 dx2 + v3 dx3 to be an exact differential of a
potential is
curl v =
 ∂v3
∂x2
− ∂v2
∂x3
, ∂v1
∂x3
− ∂v3
∂x1
, ∂v2
∂x1
− ∂v1
∂x2

= (0, 0, 0).
However, there are cases in which the conditioncurl v = 0 is fulfilled throughout a domain, and
yet the line integralC from a to b may be different for two curves. This may be the case if the
domain is multiply connected,i.e. there exists closed loop that cannot deform and shrink to a


## Page 33

2.1 From Multivariable Calculus to Exterior Calculus 33
Another important operation that involves a surface integral is theflux of a vector
field through a surface. LetΣ be a surface,dA the surface area element,2 and n the
unit normal to the surface drawn towards the positive side of the surface. The flux
of v over the surface is given and expressed by
¨
Σ
⟨v, n⟩ dA =
¨
Σ
v1n1 dA +
¨
Σ
v2n2 dA +
¨
Σ
v3n3 dA
=
¨
Σ
v1 dx2 dx3 +
¨
Σ
v2 dx3 dx1 +
¨
Σ
v3 dx1 dx2.
The quantity v1 dx2 dx3 + v2 dx3 dx1 + v3 dx1 dx2 is called a2-form.
Here dx1 dx2 is the area element projected to the x1x2-plane. The flux of a
vector field through a surface is the sum of its contribution from all three projected
components, each of which is the area integral of the vector component normal to the
respective plane. It is important to note that these area integrals are signed integral
inherited from the orientation of the space. The normal of thedx2 dx3-plane is x1,
the normal of thedx3 dx1-plane is x2, etc. In particular, when writing flux integral in
this form, the ordering of differentials matter
˜
v1 dx2 dx3 = −
˜
v1 dx3 dx2.
Similarly, in this context, a volumetric integral
˝
h dx1 dx2 dx3 should have the
ordering of the differentialdx1 dx2 dx3 positively oriented.
More generally, it turns out that the right structure for integration that evaluate
circulations, fluxes,etc., is infinitesimally askew symmetric product of differentials
dxi1 · · · dxik. Later, in order not to be confused with the unsigned integrals, we shall
use the notationdxi1 ∧ · · · ∧ dxik to emphasize the skew symmetry nature. We will
spend 2.3 to study the linear algebra of these forms.
2.1.2 Changing variables for multivariable integrals
Suppose D is a domain of in the Cartesian space Rn with coordinates labeled
x1, . . . ,xn. Let F : D → Rn be a map into another Cartesian space with coordinates
labeled y1, . . . ,yn. This map parametrizes the imageF(D) (as a signed multiset)
with yi = Fi(x1, . . . ,xn) for i = 1, . . . ,n. Let h : F(D) → R be a scalar function.
Then the integral
ˆ
F(D)
h(y1, . . . ,yn) dy1 · · · dyn
can be written in terms of an integral over(x1, . . . ,xn) ∈ D as
ˆ
F(D)
h(y1, . . . ,yn) dy1 · · · dyn =
ˆ
D
(h ◦ F)(x1, . . . ,xn) J dx 1 · · · dxn,
point (nontrivialcycles), and if the two paths froma and b follow the opposite segments of such
nontrivial loops. In this case, the one path cannot be transformed into the other. Two cycles are
said to be equivalent if they together form the boundary of a surface embedded in the space. In a
multiply connected domain, every cycle (up to equivalence) is a multiple, or a linear combination,
of finitely many basis cycles.
If curl v = 0 and the circulations along those basis cycles vanish, thenv1 dx + v2 dx2 + v3 dx3 = dΨ.
2Here dA does not mean the derivatived of a functionA.


## Page 34

34 Chapter 2. Exterior Calculus
where J is the Jacobian determinant:
J = det


∂F1/∂x1 · · · ∂F1/∂xn
... . . . ...
∂Fn/∂x1 · · · ∂Fn/∂xn

 = det

dF(e1), . . . ,dF(en)

.
Here e1, . . . ,en is the canonical basis for the Cartesian space.
In exterior calculus, we will simply write
ˆ
F(D)
ω =
ˆ
D
F ∗ω,
i.e., the integral ofω over the imageF(D) of a mapF is the same as the integral
of the pullback differential F ∗ω via the map over the domainD. The notion of
pullback in exterior calculus will be the abstraction of the routine procedure of
changing variables for the integrand.
2.1.3 Green, Gauss and Kelvin–Stokes theorems
Another important topic of multivariable calculus includes theorems about integrals
of derivatives, which are higher dimensional versions of the fundamental theorem of
calculus.
• The surface integral of the flux through a closed surface may be expressed as
an integral over the enclosed volume.
• The circulation taken around a closed curve may be expressed in terms of a
surface integral taken over a surface subtended by the curve.
Let v: R2 → R2 be a vector field in the2-dimensional Cartesian space. Let
D ⊂ R2 be a region, and let∂D be its boundary curve. Then by integrating the
derivatives in each variable and noting the integration orientation to assign an
appropriate sign, we obtainGreen’s Theorem
¨
D
 ∂v1
∂x1
+ ∂v2
∂x2

dx1 dx2 =
˛
∂D
v1 dx2 − v2 dx1.
In general, inn-dimension,Pn
i=1 ∂vi/∂xi is called thedivergence of v. Its integral
over ann-dimensional region equals to the total (outward) flux through the boundary
surface. Take 3D for example. Supposeu: R3 → R3 is a vector field in 3D (with
coordinates labeled withy), D ⊂ R3 is a 3D domain, and∂D is its boundary surface
with normal vectors denoted byn: ∂D → R3. Then we haveGauss’ Divergence
Theorem
˚
D
3X
i=1
∂ui
∂yi
dy1 dy2 dy3 =
‹
∂D
u1 dy2 dy3 + u2 dy3 dy1 + u3 dy1 dy2
=
‹
∂D
⟨v, n⟩ dA.


## Page 35

2.2 An Overview of the Language 35
Let us come back to Green’s Theorem. Suppose: D ⊂ R2 → R3 is a parametrized
surface, whose restriction to the boundaryf : ∂D → R3 is a parametrized space curve.
Let ⃗u : R3 → R3 be a vector field in 3D. Then thecirculation of u along f(∂D) is
˛
f(∂D)
⟨u, d f ⟩ =
˛
f(∂D)
3X
i=1
ui dyi =
˛
∂D
3X
i=1
2X
j=1
ui
∂fi
∂xj
dxj
Green’s Thm.
=
3X
i=1
¨
D
 ∂
∂x2

ui
∂fi
∂x1

− ∂
∂x1

ui
∂fi
∂x2

dx1 dx2
=
3X
i=1
3X
j=1
¨
D
 ∂ui
∂yj
∂fi
∂x1
∂fj
∂x2
− ∂ui
∂yj
∂fi
∂x2
∂fj
∂x1

dx1 dx2
=
3X
i=1
3X
j=1
¨
D
 ∂ui
∂yj
− ∂uj
∂yi
 ∂fi
∂x1
∂fj
∂x2
dx1 dx2
=
¨
D
det (curlu, d f(e1), d f(e2)) dx1 dx2 =
¨
f(D)
⟨curl u, n⟩ dA,
which is the total flux ofcurl u = (∂u2/∂y3 − ∂u3/∂y2, ∂u3/∂y1 − ∂u1/∂y3, ∂u1/∂y2 − ∂u2/∂y1)
through the surfacef(D). This is theKelvin–Stokes Theorem.
In exterior calculus, vector calculus operators such asgrad (∇), curl (∇×), div
(∇·) all coalesce into a single derivatived. Similarly, important theorems such as
the Fundamental Theorem of Calculus, or Gauss’ and Green’s Theorem all become
instances of one single general statement, the so-called Stokes’ theorem
ˆ
M
d ω =
ˆ
∂M
ω,
i.e., the integral of the differential ofω over the domainM is the same ofω over the
boundary of the domain.
2.2 An Overview of the Language
The main objects that exterior calculus deals with aredifferential forms. Functions,
or scalar fields, take a given point of the domain, and return a value. Extending this
idea, differential forms are to be evaluated (integrated) over given curves, surfaces,
or volumes,etc.
Specifically, letM be a 3-dimensional domain. OnM, a k-form is a differential
form that is to be integrated over ak-dimensional (oriented) submanifold:
• A 3-form is to be integrated over a volumetric region. For example, the
mass density ρ of physical matter should be regarded as a 3-form, denoted by
ρ ∈ Ω3(M ). Given a regionU ⊂ M, the total mass withinU is denoted by´
U ρ.
• A 2-form is to be integrated over an oriented surface. For example, a fluxω of
a flow should be regarded as a 2-form, denoted byω ∈ Ω2(M ). It describes
each total flux over a given surfaceΣ, denoted by
´
Σ ω.


## Page 36

36 Chapter 2. Exterior Calculus
• A 1-form is to be line integrated over a path. For example, a force fieldη
should be regarded as a 1-form, denoted byη ∈ Ω1(M ). The total work done
by the force along a given pathΓ is denoted by
´
Γ η.
• A 0-form is a function, or a scalar field. For example, the temperatureu of
a material is a 0-form, denoted byu ∈ Ω0(M ). It is to be evaluated at each
point.
We will encounter only 5 algebraic and differential operators for differential forms:
• Pullback operator. If we have a differential formα ∈ Ωk(W ), and a map
f : M → W, then we have a pullback differential formf ∗α ∈ Ωk(M ). It has a
natural definition that its evaluation over ak-dimensional surface Σ ⊂ M is
given by
´
Σ(f ∗α) =
´
f (Σ) α.
• Exterior derivative. Denoted by d, the exterior derivative is a differential
operator that sends ak-form α to a (k + 1)-form d α. The evaluation ofd α
over a(k + 1)-dimensional surface Σ is designed so that
´
Σ d α =
´
∂Σ α.
• Wedge product. It is an algebraic operator that produces higher-degree forms.
If α ∈ Ωk(M ) and β ∈ Ωℓ(M ) then their wedge productα ∧ β ∈ Ωk+ℓ(M ).
• Interior product. Provided a given direction, the interior product as an algebraic
operator lowers the degree of a form. SupposeX is a tangent vector ofM, and
α is a k-form, then the interior productiX α is a (k − 1)-form.
• Hodge star. Denoted by ⋆, it is an algebraic operator that turns ak-form α
into an(n − k)-form ⋆α, where n = dim(M ). Among these 5 operators, this
Hodge star operator is the only one that requires a Riemannian metric forM.
Macroscopic and Microscopic View
A differential 1-formη is a quantity that is waiting to be integrated over a curve
γ. This is the “macroscopic” viewpoint for differential forms. Let us take a short
parametrized curve γ, which is so short thatγ is well-described by a pointx = γ(0),
a tangent vectorv = γ′(0) at x as the velocity for the curve, and a smallε as the
length of the interval of the parameter for the curve. Abusing the notation slightly,
we write γ = εv. Then with continuity inη, we expect
´
εv η ∼ O(ε). The limit
lim
ε→0
1
ε
ˆ
εv
η =: η(v)
is a quantity depending linearly on the velocity vectorv. We sayη(v)is the evaluation
of the 1-form on a tangent vectorv. This is the algebraic, or the “microscopic,”
viewpoint of differential forms.
Conversely, given a 1-formη as a scalar-valued linear function on tangent vectors,
we can understand its “macroscopic” counterpart as follows. The integral ofη over a
curve γ can be obtained by first partitioning the parameter interval ofγ and then
taking the sum of microscopic evaluation
ˆ
γ
η := lim
partion
refines
X
i
η

γ′(ti)

(ti+1 − ti).


## Page 37

2.3 Differential Forms 37
Similarly, a differential 2-formω in a “macroscopic” view is a quantity to be
evaluated over an oriented surface. Its “microscopic” version is a function linearly
evaluating on an infinitesimal oriented parallelogram spanned by two vectorsv1, v2.
More precisely, ω(v1, v2) is bilinear (linear in each component if fixing the other)
and skew symmetricω(v1, v2) = −ω(v2, v1). To assemble a microscopic 2-form into
its integral over a surface, partition the surface into infinitesimal parallelograms and
sum the values of the bilinear forms.
As mentioned in Section 2.1, it turns out that the right structure for integration
that evaluate circulations, fluxes,etc., is infinitesimally askew symmetric multilinear
form. In Section 2.3 we study the linear algebra of these forms.
Starting from Section 2.4 we will expand on related concepts about vector fields.
This will lead up to an important operation calledLie derivativein Section 2.6. This
operation is essential in many applications such as continuum mechanics that is often
overlooked in multivariable calculus. Finally, we introduce Hodge star in Section 2.7.
2.3 Differential Forms
Algebraically, differential forms are skew symmetric multilinear form. With such
an object defined over a domain, it becomes a mathematical object that can be
integrated over a submanifold (Section 2.3.1). In Section 2.3.2, we introduce how
differential forms are made from covectors by thetheory of extension. Using the
same extension technique, we extend the notion of “the differential of a function”
to general differential forms (Section 2.3.3). Finally, in Section 2.3.4, we give a
geometric interpretation of differential forms and the operations among them.
Definition 2.1 Let M be a manifold. Ak-form ω is a skew symmetrick-linear form
field; that is, for eachp ∈ M, we have a function linear in each of itsk arguments
ωpJ·, . . . ,·K: TpM × · · · × TpM| {z }
k
multilinear
− − − − − − →R (2.1)
satisfying
ωpJX1, . . . ,Xi , . . . ,Xj , . . . ,Xk K = −ωpJX1, . . . ,Xj , . . . ,Xi , . . . ,Xk K. (2.2)
Such a skew-symmetrick-linear form atp is collectively
ωp ∈Vk T ∗
p M . (2.3)
The space ofk-forms is denoted byΩk(M ) = Γ(Vk T ∗M ).a
aThe motivation for the notation “∧k T ∗M” will become clear in Section 2.3.2.
Space Ω0(M ) of 0-forms are just space of functionsΩ0(M ) = {f : M → R}. Space
Ω1(M ) of 1-forms are the space of covector fields.
For eachp in an n-dimensional manifold M, the dimension of the vector spaceVk T ∗
p M is
n
k

. Every k-form would be 0 ifk > n.


## Page 38

38 Chapter 2. Exterior Calculus
■ Example 2.1 In the 3D Cartesian space, each vector written in coordinates
a = ( a1, a2, a3)⊺ can be converted into a 1-form(a)1-form or a 2-form (a)2-form,
whose evaluation on a vectoru or a pair of vectorsu, v are defined by
(a)1-formJuK = a1u1 + a2u2 + a3u3 (2.4)
(a)2-formJu, vK = det


a1 u1 v1
a2 u2 v2
a3 u3 v3

 . (2.5)
A scalar functiona, which is a 0-forma = (a)0-form, can be converted into a 3-form
(a)3-form
(a)3-formJu, v, wK = a det


u1 v1 w1
u2 v2 w2
u3 v3 w3

 . (2.6)
■
2.3.1 Integration and pullback
Differential forms can be treated as objects to-be-integrated along ak-dimensional
surface. Suppose S : Dk → M is a parametrick-dimensional surface defined over
a k-dimensional parameter space Dk with values in M. Recall that dS = S∗
is its pushforward map. Let θ1, . . . , θk , θ i : Dk → R, be an arbitrary coordinate
system. That is, we have d θ1, . . . ,d θk as basis covector field, whose dual basis
⃗e1, . . . , ⃗ek ∈ Γ(T Dk) is a coordinate vector field.
Definition 2.2 Let ω ∈ Ωk(M ) be a k-form on M. The integral
´
S ω of ω over a
surface S described above is defined by
ˆ
S
ω :=
¨
· · ·
ˆ 
Dk
ωS(θ1,...,θk)JS∗⃗e1, . . . ,S∗⃗ek K d θ1 · · · d θk . (2.7)
This definition is independent of reparametrization ofS.
■ Example 2.2 In the 3D Cartesian space, for a scalar functiona and a vector
field a we have
ˆ
p
a = a(p), (2.8)
ˆ
C
(a)1-form =
ˆ
C
a · d l, (2.9)
ˆ
S
(a)2-form =
¨
S
a · ndA, (2.10)
ˆ
V
(a)3-form =
˚
V
a dV . (2.11)
■


## Page 39

2.3 Differential Forms 39
Definition 2.3 For each smooth mapϕ: M → N, we define thepullback operator
ϕ∗ : Ωk(N )
linear
− − − →Ωk(M ) (2.12)
that for eachω ∈ Ωk(N ),
(ϕ∗ω)pJX1, . . . ,Xk K := ωϕ(p)Jϕ∗X1, . . . , ϕ∗Xk K. (2.13)
Theorem 2.1 — Pullback as change of integration variables.
ˆ
ϕ(S)
ω =
ˆ
S
ϕ∗ω. (2.14)
■ Example 2.3 Let ϕ: R3 → R3 be a smooth map between the 3D Cartesian space.
Let F = ∇ϕ, denoted as a matrixFij = ∂ϕi
∂xj
called the deformation gradient. Let
J = det(F). Then
ϕ∗
0-form
(a)0-form = (a ◦ ϕ)0-form, (2.15)
ϕ∗
1-form
(a)1-form = (F⊺a ◦ ϕ)1-form, (2.16)
ϕ∗
2-form
(a)2-form = (J F−1a ◦ ϕ)2-form, (2.17)
ϕ∗
3-form
(a)3-form = (Ja ◦ ϕ)3-form. (2.18)
■
2.3.2 Wedge product and interior product
In Definition 2.1, we described what a differential form is. At each point, a differential
form is a skew symmetrick-linear form. If we have such an object, we can talk about
its integration and the associated changes of variables (pullback) (Section 2.3.1).
But how do we obtain these skew symmetrick-linear form in the first place? Some
instances of differential forms are concretely given, but only under a 3D Cartesian
coordinate system (Example 2.1). Is there a way to systematically construct skew
symmetric k-linear forms?
Well, we do have a starting point.Covectors are 1-forms.They are canonically
defined by taking the dual space of a vector space. By thetheory of extension
introduced by Grassmann (1862), we can extend the elementary covectors intok
forms through a new multiplication calledwedge product. We can also extend the
elementary vector–covector dual pairing to pairingk-forms and k vectors, making
k-forms truly objects satisfying Definition 2.1. The extension of dual pairing to
k-forms is called theinterior product.
In fact, using the same technique of extension, we can extend operators other
than the vector–covector dual pairing. For example, at the level between functions
and covector fields, we have the notion of taking differentials (the differential of a
function is a covector field). We can extend such a differentiation notion, and obtain


## Page 40

40 Chapter 2. Exterior Calculus
exterior derivative (Section 2.3.3).
The following Definitions 2.4, 2.5 and 2.6 collectively serve as an alternative ax-
iomaticdefinitionfordifferentialformsthatcanreplaceDefinition2.1.
Definition 2.4 — Wedge product. Let V be a vector space, and letV ∗ be its dual
space. Define
V• V ∗ = R ⊕ V ∗ ⊕ (V2 V ∗) ⊕ (V3 V ∗) ⊕ · · · (2.19)
as the free algebraa generated by a new multiplication calledwedge product
∧: Vk V ∗ ×Vℓ V ∗ bilinear
− − − − →Vk+ℓ V ∗ (2.20)
that satisfies the following two rules:
• Associativity: (α ∧ β) ∧ γ = α ∧ (β ∧ γ); (2.21)
• Anti-commutativity: α ∧ α = 0 for 1-forms α ∈ V ∗. (2.22)
Here,Vk V ∗ in (2.19) is the collection of all linear combinations of degree-k wedge
products of covectors.
aThe space of all polynomial expressions but without commutativity on multiplication.
Definition 2.5 — Interior product. For each vectorX ∈ V in a vector spaceV,
define a linear map
iX : ∧k V ∗ linear
− − − → ∧k −1V ∗ (2.23)
that satisfies
• Base definition: iX α = ⟨α|X ⟩ for all 1-formsα ∈ V ∗; (2.24)
• Nilpotent: iX iX = 0; (2.25)
• Graded Leibniz rule: iX (α ∧ β) = (iX α) ∧ β + (−1)deg(α)α ∧ (iX β). (2.26)
Definition 2.6 — Evaluation of k-forms. For ω ∈ ∧ k V ∗ and X1, . . . ,Xk ∈ V, define
ωJX1, . . . ,Xk K := iXk · · · iX2iX1ω. (2.27)
In particular,
(iX ω)JY1, . . . ,Yk −1K = ωJX , Y1, . . . ,Yk −1K. (2.28)
The wedge product and interior product generalize to the pointwise wedge product
and interior product for the space ofk-form fieldsΩk(M ) := Γ(∧k T ∗M )
∧: Ωk(M ) × Ωℓ(M )
bilinear
− − − − →Ωk+ℓ(M ), (α ∧ β)p := αp ∧ βp (2.29)
iX : Ωk(M )
linear
− − − →Ωk −1(M ), (iX ω)p := iXp ωp, (2.30)


## Page 41

2.3 Differential Forms 41
where X ∈ Γ(TM ) is a vector field.
Theorem 2.2 — Graded anti-commutativity.
α ∧ β = (−1)k ℓβ ∧ α (2.31)
when α is a k-form and β is an ℓ-form.
Proof. First, we have
α ∧ β = −β ∧ α when k = ℓ = 1 (2.32)
as a consequence of (2.22):
0 = (α + β) ∧ (α + β) = α ∧ α|{z}
0
+α ∧ β + β ∧ α + β ∧ β|{z}
0
. (2.33)
For generalk-forms and ℓ-forms, write α, β as linear combinations of∧ of 1-forms,
and reorder α ∧ β into β ∧ α by applying the swaps (2.32)k ℓ number of times.
Theorem 2.3 For α1, . . . , αk ∈ Ω1(M ),
(α1 ∧ · · · ∧ αk)JX1, . . . ,Xk K = det


⟨α1|X1⟩ · · · ⟨ α1|Xk ⟩
... . . . ...
⟨αk |X1⟩ · · · ⟨ αk |Xk ⟩

 . (2.34)
Proof. Using the definition (2.27) and repeatedly apply the Leibniz rule (2.26)
and (2.24), we obtain an expressionP
σ∈Sk
(−1)|σ|Qk
i=1⟨αi |Xσ(i)⟩, which is Leibniz’s
formula for the determinant of the matrix⟨αi |Xj ⟩.
From Theorem 2.3, it is apparent that thek-forms generated by k forms are
precisely the ones described in Definition 2.1.
■ Example 2.4 In the 3D Cartesian spaceR3 with covector basis dx , dy, dz ∈
Ω1(R3), the conversion (Example 2.1) from Cartesian vectors/scalars to forms are
explicitly given by
(a)0-form = a, (2.35)
(a)1-form = a1 dx + a2 dy + a3 dz , (2.36)
(a)2-form = a1 dy ∧ dz + a2 dz ∧ dx + a3 dx ∧ dy (2.37)
= i(a)vec(dx ∧ dy ∧ dz), (2.38)
(a)3-form = a dx ∧ dy ∧ dz . (2.39)
One can check that this is consistent with Example 2.1 using Theorem 2.3.■


## Page 42

42 Chapter 2. Exterior Calculus
■ Example 2.5 In the 3D Cartesian space,
(a)0-form ∧ (b)0-form = (ab)0-form, (2.40)
(a)0-form ∧ (b)1-form = (ab)1-form, (2.41)
(a)0-form ∧ (b)2-form = (ab)2-form, (2.42)
(a)0-form ∧ (b)3-form = (ab)3-form, (2.43)
(a)1-form ∧ (b)1-form = (a × b)2-form, (2.44)
(a)1-form ∧ (b)2-form = (a · b)3-form. (2.45)
■
■ Example 2.6 In the 3D Cartesian space,
iv(a)1-form = (a · v)0-form, (2.46)
iv(a)2-form = (a × v)1-form, (2.47)
iv(a)3-form = (av)2-form. (2.48)
■
■ Example 2.7 — Vector algebra identities. The following 3D vector identities
are special cases of the Leibniz rule(2.26) for the interior product written out in
3D vector algebra.
Theorem 2.4 — Vector triple product. a × (b × c) = (a · c)b − (a · b)c.
Proof. (a × (b × c))1-form
(2.47)
= −ia(b × c)2-form
(2.44)
= −ia((b)1-form ∧ (c)1-form)
(2.26)
=
−ia(b)1-form(c)1-form + (b)1-formia(c)1-form
(2.46)
= ( −(a · b)c + (a · c)b)1-form.
Theorem 2.5 — Cauchy–Binet identity. (a×b)·(c×d) = (a·c)(b·d)−(a·d)(b·c).
Proof. [(a × b) · (c × d)]3-form
(2.45)
= (a × b)1-form ∧ (c × d)2-form
(2.47)
(2.44)
= −ia(b)2-form ∧
(c)1-form ∧ (d)1-form
(2.26)
= (b)2-form ∧ ia(c)1-form ∧ (d)1-form − (b)2-form ∧ (c)1-form ∧
ia(d)1-form
(2.46)
(2.45)
= ( a · c)(b · d)3-form − (a · d)(b · c)3-form.
Theorem 2.6 — Vector quadruple product. (a × b) × (c × d) = det(a, c, d)b −
det(b, c, d)a.
Proof. [(a × b) × (c × d)]2-form
(2.44)
= (a × b)1-form ∧ (c × d)1-form
(2.47)
= ia(b)2-form ∧
ic(d)2-form
(2.26)
= ia[(b)2-form ∧ ic(d)2-form] − (b)2-formiaic(d)2-form
(2.47),(2.45)
(2.6)
= ia(b · (d ×
c))3-form −(b)2-form det(d, c, a)
(2.48)
= (a)2-form det(b, d, c) −(b)2-form det(d, c, a).
■


## Page 43

2.3 Differential Forms 43
Interaction with pullbacks
The pullback operator Definition 2.3 preserves the wedge product and interior product.
This is because Definition 2.3 is consistent to the pullback operator for covectors
(Definition 1.17 and Definition 1.4), and the rest of the extension construction is
canonical (Definition 2.4–2.6).
Theorem 2.7 — Pullback distributes over wedge products.
ϕ∗(α ∧ β) = (ϕ∗α) ∧ (ϕ∗β). (2.49)
Theorem 2.8 — Passing pullback through interior product.
ϕ∗(iϕ∗(X )ω) = iX (ϕ∗ω). (2.50)
■ Example 2.8 — Matrix vector identities. We can write Theorem 2.7 and The-
orem 2.8 in the 3D Cartesian space using the correspondence given by Exam-
ple 2.3.
Theorem 2.9 Let u, v ∈ R3, F ∈ R3×3, and J = det(F). Then
J F−1(u × v) = (F⊺u) × (F⊺v). (2.51)
F⊺(u × (Fv)) = (J F−1u) × v. (2.52)
Proof. (2.51) is (2.49) when both α and β are 1-forms. (2.52) is (2.50) when ω is
a 2-form.
■
Integral picture for interior product
Differential k-forms can be evaluated by insertingk vectors (Definition 2.6). Differ-
ential k-forms cam also be integrated overk-dimensional surface (Section 2.3.1). In
the former algebraic picture, the interior product is the “insertion” operation(2.28).
For the latter integral picture, it turns out that the interior product is dual to the
“extrusion” operation, stated as follows.
Suppose S : Dk → M is a(k −1)-dimensional surface. LetX ∈ Γ(TM ) be a vector
field. Consider extruding the(k − 1)-dimensional surface S into a k-dimensional
surface extϵ
X S along X. Concretely, it is the solution to the initial value problem of
flowing along X:
(extϵ
X S): [0 , ϵ] × Dk → M , (2.53)
∂(extϵ
X S)
∂t (t, θ1, . . . , θk −1) = X |(extϵ
X S)(t,θ1,...,θk −1) (2.54)
(extϵ
X S)(0, θ1, . . . , θk −1) = S(θ1, . . . , θk −1). (2.55)
This geometric operation of extrusion is illustrated in Figure 2.1. The following
theorem states that the interior product using a vector fieldX measures the rate
of change of measurement when the integration domain is an extrusion along the
vector field.


## Page 44

44 Chapter 2. Exterior Calculus
S
X
extϵ
X S
Figure 2.1 The extrusion of a(k − 1)-dimensional surface S along a vector field
X (left) yields ak-dimensional surface (right).
Theorem 2.10 — Extrusion and interior product.
d
d ϵ

ϵ=0
ˆ
extϵ
X S
ω =
ˆ
S
iX ω. (2.56)
2.3.3 Exterior derivative
Taking the differential of a function produces a covector field (Definition 1.6). Using
a similar extension rule as in Definition 2.5, we obtain:
Definition 2.7 — Exterior derivative. Define d : Ωk(M )
linear
− − − →Ωk+1(M ) satisfying
• Base case: df is the differential off for any0-form f; (2.57)
• Nilpotent: d ◦ d = 0; (2.58)
• Graded Leibniz rule: d(α ∧ β) = (d α) ∧ β + (−1)deg(α)α ∧ (d β). (2.59)
■ Example 2.9 In the 3D Cartesian space,
d(f )0-form = (∇f )1-form, (2.60)
d(v)1-form = (∇ × v)2-form, (2.61)
d(v)2-form = (∇ · v)3-form. (2.62)
■
Next, we state two important theorems about the exterior derivative. The first is
that exterior derivative and pullback commute. This is a consequence of the same
theorem for the base case (Theorem 1.12), and that its extension to the general
exterior derivatives (Definition 2.7) is defined using its interaction with∧, which is
conserved under pullback (Theorem 2.7).
Theorem 2.11 — Exterior derivative and pullback commute.
ϕ∗(d α) = d(ϕ∗α). (2.63)


## Page 45

2.3 Differential Forms 45
S ∂S
Figure 2.2 The boundary of a k-dimensional surface S (left) is a (k − 1)-
dimensional surface (right).
The second important theorem is the Stokes theorem. Similar to how the interior
product is dual to extrusion (Theorem 2.10), the exterior derivative is dual to the
boundary operation on the integration domain (Figure 2.2).
Theorem 2.12 — Stokes Theorem.
ˆ
S
d α =
ˆ
∂S
α. (2.64)
Proof. Let the k-dimensional surface S be parameterized by ϕ: Ω ⊂ Rk → M.
By Theorem 2.1 and Theorem 2.11, the Stokes theorem reduces to the divergence
theorem on thek-dimensional region Ω ⊂ Rk.
■ Example 2.10 — Nilpotence (2.58) in 3D.
(∇ × )(∇) = 0, (2.65)
(∇ · )(∇ × ) = 0. (2.66)
■
■ Example 2.11 — Leibniz rule (2.59) in 3D. Let f : R3 → R, u, v: R3 → R3 be
function and vector fields. The Leibniz rule(2.59) becomes the following vector
calculus identities. When it is applied to a 0-form and a 1-form, we get
Theorem 2.13 ∇ × (f u) = (∇f ) × u + f (∇ × u).
For 0-form and 2-form:
Theorem 2.14 ∇ · (f u) = (∇f ) · u + f (∇ · u).
For 1-form and 1-form:
Theorem 2.15 ∇ · (u × v) = (∇ × u) · v − u · (∇ × v).
■
■ Example 2.12 — Theorem 2.11 in 3D. In the 3D Cartesian space, Theorem 2.11
becomes the following vector identities. Letϕ: R3 → R3, F = ∇ϕ, and J =


## Page 46

46 Chapter 2. Exterior Calculus
det(F). Recall Example 2.3 for the pullback formulas in 3D. Theorem 2.11 applied
to 0-forms yields
Theorem 2.16 — Chain rule revisited. Let f : R3 → R. Then,
F⊺(∇f ◦ ϕ) = ∇(f ◦ ϕ) (2.67)
Theorem 2.11 applied to 1-forms yields
Theorem 2.17 — Change of variables for curl. Let u: R3 → R3. Then,
J F−1((∇ × u) ◦ ϕ) = ∇ × (F⊺u ◦ ϕ). (2.68)
Theorem 2.11 applied to 2-forms yields
Theorem 2.18 — Piola identity. Let u: R3 → R3. Then,
J((∇ · u) ◦ ϕ) = ∇ · (J F−1u ◦ ϕ). (2.69)
This example really shows the power of Theorem 2.11. The simple concept of
commutativity Theorem 2.11 becomes rather opaque vector identities especially
for the Piola identity (Theorem 2.18) and its counterpart for curl (Theorem 2.17)
which is in fact too complicated to be discovered with a name in vector calculus.
The Piola identity also implies the following identity [Evans(1998), Sec 8.1].
Specialize u into a constant coordinate vector, and note that the cofactor matrix
of F is given bycof(F) = J F−⊺.
Theorem 2.19 The cofactor matrix of the Jacobian matrix of any map has
divergence-free rows.
■
■ Example 2.13 — Theorem 2.12 in 3D. In the 3D Cartesian space, Theorem 2.12
becomes the following theorems. Theorem 2.12 applied to 0-forms becomes
Theorem 2.20 — Fundamental theorem of calculus. Let f : R3 → R, and C
be a curve connectinga ∈ R3 to b ∈ R3. Then,
ˆ
C
∇f · d l = f (b) − f (a). (2.70)
Theorem 2.12 applied to 1-forms becomes
Theorem 2.21 — Kelvin–Stokes curl theorem. Let u: R3 → R, and S be a
surface in R3 with normal vectorn. Then,
¨
S
(∇ × u) · ndA =
˛
∂S
u · d l. (2.71)
Theorem 2.12 applied to 2-forms becomes


## Page 47

2.3 Differential Forms 47
S
α
ˆ
S
α = amount of
intersections
Figure 2.3 The integration of ak-form α along a k-dimensional surface S mea-
sures thetotal amountof intersections betweenS and thecodimension-
k geometries representing α.
Theorem 2.22 — Gauss’ divergence theorem. Let u: R3 → R, and V be a
volumetric region inR3 with boundary normaln. Then,
˚
V
(∇ · u)dV =
‹
∂V
u · ndA. (2.72)
■
2.3.4 Differential forms as codimensional geometries
In this last part of Section 2.3, we provide visual representations for differential
forms, wedge products, interior products, and exterior derivatives. These geometric
interpretations are given in the appendix of [Yin et al.(2023)].
Geometrically, a vector field X is an assignment of an infinitesimal “arrow”
Xp ∈ TpM at every point p ∈ M, whose directions and magnitudes depict some
“instantaneous flow velocity” within the domainM. A k-form α ∈ Ωk(M ), on the
other hand, is a distribution of(n − k)-dimensional (codimension-k) oriented planes
over M. See Figure 2.4. For example, in 3D, a 3-form is illustrated as a point
cloud, a 2-form is a line segment cloud, a1-form is a plane field, and a0-form is a
superposition of sublevel sets of the corresponding scalar function.
Integration is counting signed intersection
The orientations and densities of the codimension-k plane cloud are given so that
the integration
´
S α over a testk-surface S is the total signed intersection between
S and the codimensional-k plane cloud (Figure 2.3).3
Pullback is taking preimage
The pullback ϕ∗α of a k-form α ∈ Ωk(M ) has its codimension cloud given by the
preimage of the codimension cloud ofα through ϕ.
3For n = 2, 3, every k-form at each tangent space admits a distinguished(n − k)-subspace that
represents the orientation of the plane field. Forn > 3 and 1 < k < n − 1, the codimension-k plane
fields are generally no longer described by a distinguished oriented subspace but a superposition of
many. This is related to thedecomposability of forms (Definition 4.3).


## Page 48

48 Chapter 2. Exterior Calculus
0-form 1-form 2-form 3-form
Figure 2.4 Differential k-forms can be represented by clouds of codimension-k
geometries.
α
β
α ∧ β
α
X
iX α
Figure 2.5 Wedge products are intersections (left) and interior products are
extrusions (right).
Wedge product is taking intersection
The wedge product α ∧ β of a k-form α ∈ Ωk(M ) and an ℓ-form β ∈ Ωℓ(M ) is a
(k + ℓ)-form whose codimension cloud is given by the intersection of the codimension
clouds of α and β (Figure 2.5, left).
Interior products are extrusions
The interior productiX α of a k-form α ∈ Ωk with a vector fieldX ∈ Γ(TM ) is a
(k − 1)-form whose codimension cloud is given by the extrusion of the codimension
cloud of α along X (Figure 2.5, right.)
Exterior derivatives are boundary operators
The exterior derivative operatord : Ωk(M ) → Ωk+1(M ) takes the boundary of the
codimensional geometric representation. For eachα ∈ Ωk(M ), its exterior derivative
d α ∈ Ωk+1(M ) has the(n −k −1) dimensional cloud elements given by the boundaries
of the (n − k)-dimensional cloud elements ofα (Figure 2.6). The Stokes Theorem´
S d α =
¸
∂S α can be interpreted as the invariant of intersection number when
swapping the boundary operation. Ak-form α ∈ Ωk(M ) is closed if d α = 0. For
a closed form, the boundaries of each instance of the codimensional cloud cancel
out with the neighboring boundaries. As a consequence, the codimensional cloud
of a closed form stitches together into global pieces of(n − k)-dimensional surfaces
foliating the space (Figure 2.7).


## Page 49

2.4 Vector Fields as Derivations 49
α d α
− − − − →
d
Figure 2.6 Taking exterior derivative is taking boundary.
Non-closed k-form Closed k-form
Figure 2.7 A k-form is closed when the boundaries of its codimension-k geome-
tries cancel out.
2.4 Vector Fields as Derivations
Now, we will take a pause on studying the operations on differential forms, and
expand on the idea of directional derivatives of functions. Directional derivatives
are the starting point of multivariable calculus. It turns out that the collection of
directional derivative operations form a space that is naturally endowed with an
algebra that encodes important information about the direction fields themselves.
This algebra is called aLie algebra. Such an algebra is used in mechanics and robotics
for distinguishing constrained systems (holonomic constraints or non-holonomic
constraints).
2.4.1 Algebra and derivations
Definition 2.8 — Algebra. A vector spaceA is called analgebra if it is equipped
with a bilinear function×: A × A
bilinear
− − − − → A.
■ Example 2.14 The space Rn×n of n-by-n matrices is an algebra, with matrix-
matrix multiplication as the bilinear function. ■
■ Example 2.15 The space Ω0(M ) of functions is an algebra, with pointwise
multiplication as the bilinear function. ■
Note that the multiplication structure (bilinear function) for an algebra does not
need to be associative:


## Page 50

50 Chapter 2. Exterior Calculus
■ Example 2.16 (R3, ×)withcrossproduct ×isanalgebra. Notethat u×(v×w) ̸=
(u × v) × w in general. ■
Definition 2.9 — Derivations. Let (A, ×) be an algebra. A linear mapX : A
linear
− − − →
A is called aderivation if
X (a × b) = (Xa) × b + a × (Xb) a, b ∈ A (2.73)
The space of all derivations over an algebra is denoted byDer(A).
Definition 2.10 — View vector fields as derivations. Each vector fieldX ∈ Γ(TM )
is also viewed as an operator on functionsX : Ω0(M ) → Ω0(M ) defined by
Xf := df JX K. (2.74)
Note that this functional operator is a derivation on functions
X (fg) = (Xf )g + f (Xg). (2.75)
In fact, a converse statement is true:every derivation on function is a vector field:
Γ(TM ) = Der(Ω0(M )). (2.76)
This equivalence between vector fields and the algebraic definition of derivations
on functions motivates many differential geometry textbooks to adopt(2.76) as the
definition for vector fields.
The takeaway for this abstraction is that we can think of each vector field as the
directional derivative operator (2.74) that obeys the derivation property (2.75).
2.4.2 Lie algebra for vector fields
Definition 2.11 — Lie algebra. An algebra (A, [·, ·]) is called aLie algebra if the
bilinear function [·, ·]: A × A
bilinear
− − − − → Asatisfies skew symmetry
[a, b] = −[b, a] (2.77)
and theJacobi identity
[a, [b, c]] + [b, [c, a]] + [c, [a, b]] = 0. (2.78)
Here are two elementary examples for Lie algebra.
■ Example 2.17 (R3, ×) with the 3D cross product× is a Lie algebra. ■
■ Example 2.18 (Rn×n, [·, ·]) is a Lie algebra, where the bracket operation is the
matrix commutator[A, B] = AB − BA. ■


## Page 51

2.4 Vector Fields as Derivations 51
Theorem 2.23 The space of vector fieldsΓ(TM ) is a Lie algebra, with Lie bracket
[X , Y ] of vector fieldsX , Y defined by
[X , Y ]f := X (Yf ) − Y (Xf ) (2.79)
when it is operated on functions.
Proof. We only need to verify two properties. First,[X , Y ] := X ◦ Y − Y ◦ X is
still a derivation on functions, and hence[·, ·] is a valid algebra operation. Second,
[X , Y ] satisfies the Jacobi identity. Each of these properties is easy to check straight
from definitions.
R Space of tangent vector fields, or equivalently the space of derivations on
functions, is naturally equipped with a Lie algebra structure.
2.4.3 Practical calculation of Lie bracket
Suppose M is a subset ofRn with coordinate systemx 1, . . . ,x n. Let X , Y be two
vector fields. As derivations, we represent them as directional differential operators
X =
nX
i=1
X i ∂
∂x i , Y =
nX
i=i
Y i ∂
∂x i (2.80)
where each componentsX i , Y i of the vector fields are functions defined overM. Let
Z = [X , Y ]. Our goal is to determine its componentZ i as in Z =Pn
i=1 Z i ∂
∂x i in
terms of the components ofX i , Y i. Expanding the definition of Lie bracket,
Zf = X (Yf ) − Y (Xf ) =
X
i,j
X i ∂
∂x i

Y j ∂f
∂x j

− Y i ∂
∂x i

X j ∂f
∂x j

(2.81)
=
X
i,j

X i ∂Y j
∂x i − Y i ∂X j
∂x i
 ∂f
∂x j +

X i Y j − Y i X j ∂2f
∂x i ∂x j
| {z }
=0
. (2.82)
Therefore,
Z j = X i ∂Y j
∂x i − Y i ∂X j
∂x i . (2.83)
If “∇” denotes taking componentwise differential, we can write
Z = [X , Y ] = ∇X Y − ∇Y X . (2.84)
Note that each of the coordinate-componentwise differential∇X Y or ∇Y X depends
on the choice of coordinate. But the difference∇X Y − ∇Y X becomes [X , Y ] which
is coordinate independent.
In practice, to compute the Lie bracket of two vector fields, one can chooseany
coordinate system (which doesn’t need to be orthonormal) and take the mutual
componentwise derivative (2.84).


## Page 52

52 Chapter 2. Exterior Calculus
2.4.4 Integrability
Why do we care about the Lie algebra structure for vector fields? One of the most
important application of the Lie structure for vector fields is theintegrability to
coordinate system.
Theorem 2.24 Suppose x1, . . . ,xn ∈ Ω0(M ) be a coordinate system, which gives
rise to covector basis fielddx1, . . . ,dxn ∈ Ω1(M ). Let ⃗e1, . . . , ⃗en ∈ Γ(TM ) be the
dual basis fromdx1, . . . ,dxn ∈ Ω1(M ), called coordinate vectors. Then[⃗ei , ⃗ej ] = 0.
Conversely, if a basis vector fieldX1, . . . ,Xn ∈ Γ(TM ) satisfies [Xi , Xj ] = 0 for
each pair ofi, j = 1, . . . ,n. Then they are locally the coordinate vectors of some
coordinate system.
Definition 2.12 — Distribution. A distribution A is an assignment of a linear
subspace Ap ⊂ TpM of the tangent space at each pointp ∈ M. We say a vector
field X ∈ Γ(TM ) belongs to the distribution, denoted byX ∈ Γ(A), if Xp ∈ A p
for all p ∈ M.
A distribution can be seen as a plane field defined over the spaceM. Like Figure 2.7,
there may be two cases: a general plane field may not stitch together with its
neighbor, or it may stitch together and form a foliation of submanifolds. In the
former case, we say the distribution is non-integrable. In the latter case, we say that
the distribution is integrable.
Definition 2.13 A distribution A ⊂ TM is said to beintegrable if the plane field
associated to A is locally the tangent plane of a family of submanifolds inM.
Theorem 2.25 — Frobenius theorem of integrability. A distribution A ⊂ TM is
integrable if and only ifΓ(A) ⊂ Γ(TM ) is not only a vector subspace but also a
Lie subalgebra; that is, the Lie bracket of vector fields in the distribution stays in
the distribution: [X , Y ] ∈ Γ(A) for all X , Y ∈ Γ(A).
This notion of integrability plays a crucial role in characterizing robotics and
mechanical constructs. Such systems are parameterized through general coordinates
like joint angles. Often, these parameters are subject to limitations concerning their
infinitesimal mobility.
The range of feasible infinitesimal movements constitutes a distribution over the
tangent bundle of the parameter space. If this distribution proves to be integrable,
the constraint is referred to as aholonomic constraint. Otherwise, if the distribution
is non-integrable, it is termed anon-holonomic constraint.
A system with holonomic constraints can be simplified to a lower-dimensional
system, which is the submanifold integrated from the distribution. On the other
hand, a system with non-holonomic constraints allows for certain maneuvers within
the realm of feasible movements, yet these can lead to directions transversal to the
distribution. Essentially, non-holonomic constraints are velocity restrictions that do
not sufficiently confine the positions to lower-dimensional spaces.


## Page 53

2.4 Vector Fields as Derivations 53
■ Example 2.19 — Rolling ball. A rolling ball moving on a surface without slipping
presents an example of a nonholonomically constrained system. In this case, the
constraint arises from the no-slip condition, which dictates that the point of the
ball in contact with the surface has zero velocity relative to the surface. Under this
constraint, the 3D orientation of the ball have only 2 degrees of freedom among
the 3-dimensional space of all 3D rotations. However, moving in an infinitesimal
cycle using the 2 degrees of freedom can yield a net motion into the 3rd degree of
freedom.
Let M = SO(3) be the space of 3D rotations. Consider a basis of vector fields
XR = [e1×]R, YR = [e2×]R, ZR = [e3×]R ∈ TR SO(3) (2.85)
at each R ∈ SO(3) ⊂ R3×3. Here, [
h a
b
c
i
×] =
h 0 −c b
c 0 −a
−b a 0
i
is the matrix represen-
tation of cross product. The rolling-without-slipping condition means that the
allowed motion is in the span ofX , Y. Note that, using the matrix components as
our coordinate system, the directional derivative of the coordinate is∇X R = XR,
∇Y R = YR. In particular, ∇X (Y ) = [e2×]∇X R = [e2×][e1×]R. By a similar
computation, we get
[X , Y ]R = ∇X YR − ∇Y XR = [e1×][e2×]R − [e2×][e1×]R (2.86)
= [e1 × e2]R = [e3×]R = ZR. (2.87)
In particular, Lie bracket between vector fields within the distributionspan(X , Y )
can leave the distribution. Therefore, we have a non-holonomically constrained
system. ■
■ Example 2.20 — Parallel parking. The configuration space of a four-wheel car
on a plane isM = {(x , y, θ, κ): x , y ∈ R, θ, κ ∈ [0, 2π)}, where (x , y) denotes the
location of the car on the plane,θ denotes the angle between the central axis of
the car and thex-axis, and κ denotes the angle at which the front wheels are
turned from the car’s central axis.
θ
κ
y
x
The car can move by hitting its acceleration and going forward in its current
direction θ and changing its direction by its current steering wheel angleκ, or the


## Page 54

54 Chapter 2. Exterior Calculus
car can move by changing the angle of its steering wheel. These two actions each
corresponds to the following two generators:
Xforward =
 cos θ
sin θ
κ
0

and Xturn =
 0
0
0
1

. (2.88)
To see the effect of applying the following sequence of actions: move forward, steer
to the left, move backward, steer to the right, we can look at the Lie bracket of
these two generators:
[Xforward, Xturn] = ∇XforwardXturn − ∇XturnXforward
=
 0 0 − sin θ 0
0 0 cos θ 0
0 0 0 1
0 0 0 0
 0
0
0
1

−
 0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
 cos θ
sin θ
κ
0

=
 0
0
1
0

. (2.89)
This means that the action sequence generates a spinning motion. We denote its
generator by
Xspin =
 0
0
1
0

. (2.90)
We can further analyze the effect of the following sequence of actions: spin to
the left, move forward, spin to the right, move backward by calculating the Lie
bracket
[Xspin, Xforward] = ∇XspinXforward − ∇XforwardXspin
=
 0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
 cos θ
sin θ
κ
0

−
 0 0 − sin θ 0
0 0 cos θ 0
0 0 0 1
0 0 0 0
 0
0
1
0

=
 − sin θ
cos θ
0
0

. (2.91)
This means that the action sequence generates a sideway motion where the car
moves towards − sin θ, cos θ while its front points towards(cos θ, sin θ. We can
denote this generator as Xsideway. We’ve thus far obtained four generators of
motion:
Xforward =
 cos θ
sin θ
κ
0

, Xturn =
 0
0
0
1

, Xspin =
 0
0
1
0

,and Xsideway =
 − sin θ
cos θ
0
0

. (2.92)
What we are seeing is that by introducing Lie bracket, the space of all possible
motion made from sequencing moving forward and turning the steering wheel
is actually enough to cover the entire tangent spaceTpM of the configuration
manifold M, meaning the car is capable of traveling over the entire plane even
though it only has two motions. ■
2.5 Covariant Derivatives and Vector-Valued Forms
As we briefly remarked at(2.84), the componentwise differential “∇X Y” of a vector
field Y along the X direction is coordinate dependent. What is a coordinate-
independent notion of∇X Y?
So far, we have only been looking at scalar-valuedk-forms. (Componentwise
differentials in (2.84) is treating vectors as multi-component scalars.) Another
frequently occurring type of object isvector-valued k-forms. Recall a k-form is a


## Page 55

2.5 Covariant Derivatives and Vector-Valued Forms 55
section of the bundleVk T ∗M. One may take a pointwise tensor product with the
tangent bundle (Vk T ∗M ) ⊗ TM, whose sections are both ak-form and a vector
field. These are vector-valuedk-forms. For notation convenience we call
Γ

(Vk T ∗M ) ⊗ TM

= Ωk(M ; TM ). (2.93)
A vector fieldY ∈ Γ(TM )can also be seen as a vector-valued 0-formY ∈ Ω0(M ; TM ).
One may ask what is its directional derivative along a directionX ∈ TpM at a point
p ∈ M.
The natural definition of the directional derivative of a vector would depend on a
metric.
Definition 2.14 Let (M , ♭) be a Riemannian manifold. A differential operator that
takes a vector field to a vector-valued 1-form
∇: Ω0(M ; TM ) → Ω1(M ; TM ) (2.94)
is a Levi-Civita connection or a covariant derivative if
• Compatible with differential of scalar:∇(fY ) = (df )Y +f ∇Y for f ∈ Ω0(M )
and Y ∈ Ω0(M ; TM ); (2.95)
• Compatible with metric: d ⟨X , Y ⟩ = ⟨∇X , Y ⟩ + ⟨X , ∇Y ⟩; (2.96)
• Compatible with Lie bracket (torsion free):∇X Y − ∇Y X = [X , Y ]. (2.97)
Theorem 2.26 — Fundamental theorem of Riemannian geometry. The Levi-Civita
connection exists and is unique.
So, on a manifold with metric, we can just take differential of a vector field like
taking differential of a standard 0-form. The only difference in notation is that we
use ∇ instead of d.
Definition 2.15 — Exterior covariant derivative. Using the covariant derivative∇
we can apply exterior derivative to vector-coefficientk-forms (i.e. vector-valued
k-forms). The operator
d ∇ : Ωk(M ; TM ) → Ωk+1(M ; TM ) (2.98)
is characterized by that
• It is the same as∇ when k = 0. (2.99)
• Graded Leibniz rule: d ∇(α ∧ A) = (d α) ∧ A + (−1)deg(α)α ∧ d ∇A for scalar-
valued form α and vector-valued formA. (2.100)
R Despite the similarity betweend ∇ and d, there are some differences. For
example,
d ∇ ◦ d ∇ (2.101)


## Page 56

56 Chapter 2. Exterior Calculus
is generally nonzero. In fact,d ∇ ◦ d ∇ = R∧ where R is a matrix-valued 2-form
called Riemann curvature tensor.
Definition 2.16 The identity is a vector valued 1-form
I ∈ Ω1(M ; TM ), I JX K := X . (2.102)
The identity 1-formI is useful for expressing the flat of a vector
X ♭ = ⟨X , I ⟩. (2.103)
One checks thatX ♭JY K = ⟨X , I JY K⟩ = ⟨X , Y ⟩.
Theorem 2.27 The torsion free condition(2.97) for a derivative operator ∇ is
equivalent to
d ∇I = 0. (2.104)
Proof. The exterior (covariant) derivatived on a 1-formα has an explicit formula of
(d α)JX , Y K = d(αJY K)JX K − d(αJX K)JY K − αJ[X , Y ]K, which we will give a proof
later in Theorem 2.36. Now, lettingα be I, and X , Y be arbitrary vector fields, we
get
(d ∇I )JX , Y K = ∇(I JY K)JX K − ∇(I JX K)JY K − I J[X , Y ]K (2.105)
= ∇X Y − ∇Y X − [X , Y ]. (2.106)
This expression vanishes if and only if the torsion free condition (2.97) holds.
2.6 Lie Derivative
Lie derivative is an extremely fundamental derivative in multivariable calculus, which
is unfortunately not mentioned in most of the course on multivariable calculus.
Lie derivative is defined bythe rate of change of a time-dependent pullback
operator. Recall that the pullback operator is the just the unification of general
changes of coordinates/variables. The question about what the rate of change is
of a time-dependent change of coordinates/variables naturally arises. The unifying
concept for this rate of change is the Lie derivative, which is as important as how
changes of variables are important in calculus.
The use of Lie derivative is independently introduced, with different names, in
applied research fields when rates of change of changes of variables are unavoidable.
For example, its special cases include Reynolds transport theorem that is used in
differentiable rendering [Zhao et al.(2020b)]. Lie derivative also unifies convection
and stretching terms in continuum mechanics, which is the study of the differential
relations of a deformable body.


## Page 57

2.6 Lie Derivative 57
2.6.1 General definition
Let A ∈ ⟨ type⟩M be a field defined overM of a particular type⟨type⟩. This space
⟨type⟩M can be functions (0-forms)Ω0(M ), k-forms Ωk(M ), vector fieldsΓ(TM ), or
any other types that has a pullback operator
φ∗
⟨type⟩
: ⟨type⟩M
linear
− − − → ⟨type⟩M (2.107)
associated to any mapφ: M → M. The Lie derivative is the differential operator
that measures the rate of change of the pullbackφ∗
t
⟨type⟩
A of A when the time-dependent
map φt as a flow map has a known velocity field.
Definition 2.17 — Flow map generated by vector field. For each vector field
X ∈ Γ(TM ) on M, the flow map φt : M → M, t ∈ (−ϵ, ϵ), generated byX is the
solution to
∂φ
∂t = X ◦ φ and φ0 = idM . (2.108)
Definition 2.18 — Lie derivative. Let X ∈ Γ(TM ) be a vector field onM and let
φt : M → M be the flow map generated byX (Definition 2.17). Define theLie
derivative for ⟨type⟩
LX
⟨type⟩
: ⟨type⟩M
linear
− − − → ⟨type⟩M (2.109)
by
LX
⟨type⟩
A := ∂
∂t

t=0
( φ∗
t
⟨type⟩
A). (2.110)
This notion of Lie derivative can be used in situations beyond taking derivative of
the infinitesimally flow map(2.108) generated around the identity map. Whenever
there is a time dependent map, the rate of change can of the pullback can be written
in terms of the Lie derivative.
Theorem 2.28 — Rate of change of pullback. Let M and W be two manifolds.
Let ϕt : M → W be a time-dependent map, and suppose there is⃗u ∈ Γ(TW ) so
that
∂ϕt
∂t = ⃗u ◦ ϕt . (2.111)
Let A ∈ ⟨type⟩W be some field defined onW. Then
∂
∂t

ϕ∗
t
⟨type⟩
A
!
= ϕ∗
t
⟨type⟩

L⃗u
⟨type⟩
A
!
. (2.112)


## Page 58

58 Chapter 2. Exterior Calculus
Corollary 2.29 — Passing the time derivative through a pullback. Continue the
setup of Theorem 2.28. SupposeAt ∈ ⟨type⟩W is a time-dependent field defined
on W. Then
∂
∂t

ϕ∗
t
⟨type⟩
At
!
= ϕ∗
t
⟨type⟩

∂
∂t At + L⃗u
⟨type⟩
At
!
. (2.113)
We call the operator( ∂
∂t + L⃗u) the Lie material derivative.
Definition 2.19 We say that a time-dependent fieldAt ∈ ⟨type⟩W is Lie-advected
by ⃗u if
∂
∂t At + L⃗u
⟨type⟩
At = 0; (2.114)
equivalently, for ∂ϕt
∂t = ⃗u ◦ ϕt,
ϕ∗
t
⟨type⟩
At = ϕ∗
0
⟨type⟩
A0 is time independent. (2.115)
2.6.2 Lie derivative for functions
The Lie derivative for functions is just the directional derivative.
Theorem 2.30 — Lie derivative for functions. For f ∈ Ω0(M )
LX
0-form
f = df JX K = Xf . (2.116)
Proof. Let φt be the flow map generated byX ∈ Γ(TM ) (Definition 2.17). Then
LX
0-form
f = ∂
∂t |t=0( φ∗
t
0-form
f ) = ∂
∂t |t=0(f ◦ φt) = df |φt J ∂φt
∂t K|t=0 = df JX K.
2.6.3 Lie derivative for vector fields
The Lie derivative for vector fields is the Lie bracket (Theorem 2.23).
Theorem 2.31 — Lie derivative for vector fields. For X , Y ∈ Γ(TM )
LX
vec
Y = [X , Y ]. (2.117)
To show Theorem 2.31, first note that the pullback of a vector field is given by
φ∗
t
vec
Y = (d φt)−1Y . (2.118)
This pullback of vectors is natural, as we have
φ∗
t
0-form
(Yf ) = (φ∗
t
vec
Y )( φ∗
t
0-form
f ). (2.119)


## Page 59

2.6 Lie Derivative 59
p
X
Y
φt(p)
p
X
Y
φt(p)
∇X Y = 0 LX
vec
Y = 0
Figure 2.8 The difference between the covariant derivative∇X Y and the Lie
derivative LX Y = [X , Y ]. Vanishing covariant derivative implies
that Y is parallel transported by the path generated byX (left). The
dashed lines are geodesics constituting infinitesimal parallelograms for
the transportation (known asSchild’s ladder), indicating the metric
dependency of ∇X. On the other hand, vanishing Lie derivative
implies that Y is the pushed forward by the flow map generated by
X (right), which is metric independent but requires the neighborhood
information of X instead of only along a path.
Proof of Theorem 2.31.Let φt be the flow map generated byX ∈ Γ(TM ), and let
f be an arbitrary function. Taking the time derivative of (2.119) yields
LX
0-form
(Yf ) = (LX
vec
Y )f + Y ( LX
0-form
f ) (2.120)
=⇒ X (Yf ) = (LX
vec
Y )f + Y (Xf ) (2.121)
=⇒ (LX
vec
Y )f = X (Yf ) − Y (Xf ) = [X , Y ]f . (2.122)
Comparison between covariant derivative ∇X Y and Lie derivative LX Y
We have learned two derivatives of a vector fieldY ∈ Γ(TM ) along another vector
field X ∈ Γ(TM ). One is the covariant derivative∇X Y (Definition 2.14), and the
other is the Lie derivativeLX
vec
Y (Theorem 2.31). Figure 2.8 shows their differences.
Consider the vector fieldsY that satisfies ∇X Y = 0, and respectivelyLX
vec
Y = 0.
The equation ∇X Y = 0 implies that Y is parallel transportedalong X, and
∇X Y measures how muchY deviates from being parallel when we take a step in
the X direction. This type of X-directional derivative ofY only depends on the
direction of X at a single point. But the result∇X Y depends on a metric as is
required in Definition 2.14. In fact, since∇X Y is a directional derivative, we have
∇X Y = L ∇
X
0-form
Y (2.123)
where Y is viewed as a vector-valued 0-form, and the Lie derivative is built by taking
the rate of change of the 0-form-typed pullback.
The equation LX
vec
Y = 0, on the other hand, implies thatY is pushed forward by
the flow generated byX. The quantityLX
vec
Y measures how muchY deviates from


## Page 60

60 Chapter 2. Exterior Calculus
being purely pushed forward by the flow. The idea of pushforward by a flow, as well
as the Lie bracket, is independent of any metric. However, this type of “directional
derivative” ofY along a flowX requires the information ofX in a neighborhood,
not only at one point. It is the neighborhood behavior ofX that establishes an
infinitesimal pushforward (deformation gradient or Jacobian matrix) of the flow.
2.6.4 Lie derivative for differential forms
Finally, wegivetheformulafortheLiederivativefordifferentialforms.
Theorem 2.32 — Cartan’s magic formula. For α ∈ Ωk(M )
LX
k-form
α = iX d α + diX α. (2.124)
Lie derivatives for differential forms are particularly important, as they allow us to
take derivative on the integration domain:
Theorem 2.33 — Derivative of an integral. Let X be the vector field so that
˙ϕ = X ◦ ϕ. Then,
d
dt
ˆ
ϕt(S)
αt =
ˆ
ϕt(S)
 ∂
∂t αt + LX
k-form
αt

(2.125)
Proof of Theorem 2.33. ∂
∂t
´
ϕt(S) αt = ∂
∂t
´
S ϕ∗
t αt =
´
S
∂
∂t (ϕ∗
t αt) =
´
S ϕ∗
t ( ∂
∂t α + LX α)
=
´
ϕt(S)( ∂
∂t α + LX α).
Now we give a simple but abstract proof for Cartan’s magic formula(2.124). This
proof still deserves geometric intuition, which we will provide afterward.
Proof of Theorem 2.32.The operator LX
k-form
must satisfy the following 3 properties:
• Base definition: LX
k-form
= LX
0-form
when k = 0;
• Derivation: LX
form
(α ∧ β) = (LX
form
α) ∧ β + α ∧ (LX
form
β);
• Commutativity with d: LX
form
d α = d LX
form
α.
The “derivation” and “commutativity withd” properties follow directly from the
analogous properties Theorem 2.7 and Theorem 2.11 for the pullback operator. Now,
notice that the operators on differential forms that satisfy these 3 properties must be
unique. This is because any differential formω can be written as a linear combination
(with 0-form as coefficients) of wedge products of thed of some coordinate functions
ω =P
i1<...<ik
ωi1...ik dx i1 ∧ · · · ∧ dx ik, and the above 3 properties form a sufficient
set of rules to evaluate the Lie derivative of this expression. To complete the proof,
check that (2.124) satisfy all the 3 properties.


## Page 61

2.6 Lie Derivative 61
d
dt
φt(S) = = + +
−
+
+ + −−
+ +
boundary of
extrusion
extrusion of
boundary
Figure 2.9 An intuition behind Cartan’s magic formula. The Lie derivative of a
differential form is dual to the rate of change of a moving integration
domain. This rate of change of a domain can be written as the
boundary of the extrusion plus the extrusion of the boundary.
Geometric intuition behind Cartan’s magic formula
The geometric intuition behind(2.124) is best appreciated when viewed under an
integral sign. To understand this, consider(2.125), but withα being independent of
t, and ϕt = φt representing the flow map generated byX around the identity map
as given by Definition 2.17:
ˆ
S
LX α = d
dt
ˆ
φt(S)
α. (2.126)
In essence, the Lie derivative, through the integral pairing between an integration
domain and a differential form, acts as the dual operator to the rate of change of the
integration domain.
As illustrated in Figure 2.9, this rate of change of the integration domain can
be expressed as the sum of the boundary of the extrusion along the flow and the
extrusion of the boundary. Recall from Theorem 2.10 and Theorem 2.12 that the
operations of extrusion and taking boundary are dual to the interior product and
the exterior derivative, respectively. Thus, we arrive at Cartan’s magic formula.
2.6.5 Useful identities
We have explored different types of Lie derivatives in Sections 2.6.2–2.6.4. Here,
we collect a few identities by combining these various types of Lie derivatives.
Theorem 2.34 Let X , Y1, . . . ,Yk be vector fields andα be a k-form. Then
LX (αJY1, . . . ,Yk K) = (LX α)JY1, . . . ,Yk K + αJ[X , Y1], . . . ,Yk K+
· · · + αJY1, . . . ,[X , Yk]K (2.127)
Proof. This follows from taking thet-derivative of
φ∗
t
0-form
(αJY1, . . . ,Yk K) = ( φ∗
t
k-form
)Jφ∗
t
vec
Y1, . . . , φ∗
t
vec
Yk K. (2.128)
Similar to Theorem 2.34, we have:


## Page 62

62 Chapter 2. Exterior Calculus
Theorem 2.35 Let X , Y be vector fields andα be a k-form. Then we have
LX (iY α) = i[X ,Y ]α + iY (LX α). (2.129)
The following identity is an explicit formula for the evaluation of thed of a 1-
form.
Theorem 2.36 For α ∈ Ω1(M ), we have
(d α)JX , Y K = X ⟨α|Y ⟩ − Y ⟨α|X ⟩ − ⟨α|[X , Y ]⟩. (2.130)
Proof. (d α)JX , Y K = iY iX d α
(2.124)
= iY (LX α) − iY diX α| {z }
Y ⟨α|X ⟩
(2.129)
= LX (iY α) − i[X ,Y ]α −
Y ⟨α|X ⟩ = X ⟨α|Y ⟩ − ⟨α|[X , Y ]⟩ − Y ⟨α|X ⟩.
2.6.6 Lie derivatives in the 3D Cartesian space
■ Example 2.21 In the 3D Cartesian space, the Lie derivatives for differential
forms and vector fields correspond to the following expressions in vector calcu-
lus.
Theorem 2.37 — Lie derivatives in vector calculus.
Lu
0-form
(a)0-form = (u · ∇a)0-form, (2.131)
Lu
1-form
(a)1-form = (u · ∇a + (∇u)⊺a)1-form, (2.132)
Lu
2-form
(a)2-form = (u · ∇a − a · ∇u + (∇ · u)a)2-form, (2.133)
Lu
3-form
(a)3-form = (u · ∇a + (∇ · u)a)3-form. (2.134)
Lu
vec
(a)vec = (u · ∇a − a · ∇u)vec. (2.135)
The traditional material derivative along a vector fieldu defined in most
existing textbook is given by
D
Dt := ∂
∂t + u · ∇. (2.136)
The Lie material derivative, which measures the real rate of change of various
forms, deviates from the material derivative by additional terms:
( ∂
∂t + Lu
0-form
)(a)0-form = ( D
Dt a)0-form, (2.137)
( ∂
∂t + Lu
1-form
)(a)1-form = ( D
Dt a + (∇u)⊺a)1-form, (2.138)
( ∂
∂t + Lu
2-form
)(a)2-form = ( D
Dt a − a · ∇u + (∇ · u)a)2-form, (2.139)
( ∂
∂t + Lu
3-form
)(a)3-form = ( D
Dt a + (∇ · u)a)3-form, (2.140)
( ∂
∂t + Lu
vec
)(a)vec = ( D
Dt a − a · ∇u)vec. (2.141)


## Page 63

2.6 Lie Derivative 63
Now, let us show Theorem 2.37.
Proof of (2.131). Eq. (2.131) follows directly from Theorem 2.30.
Proof of (2.132). Using (2.103), we write(a)1-form = ⃗a ♭ = ⟨⃗a, I ⟩, where⃗a = (a)vec
and I is the identity vector-valued 1-form (Definition 2.16). For clarity we also
write ⃗u = (u)vec. Now, Lu(a)1-form = L⃗u⟨⃗a, I ⟩
(2.124)
= di⃗u⟨⃗a, I ⟩ + i⃗ud ⟨⃗a, I ⟩
(2.96)
=
d ⟨⃗a, ⃗u⟩+i⃗u⟨∇⃗a ∧I ⟩+i⃗u⟨⃗a, d ∇I ⟩
Thm. 2.27
(2.96),(2.26)
= ⟨∇⃗a, ⃗u⟩+⟨⃗a, ∇⃗u⟩+⟨∇⃗u⃗a, I ⟩−⟨∇⃗a, ⃗u⟩ =
⟨⃗a, ∇⃗u⟩ + ⟨∇⃗u⃗a, I ⟩ = ((∇u)⊺a + ∇ua)1-form.
Proof of (2.135). Eq. (2.135) follows from Theorem 2.31 and (2.97).
Proof of (2.134). Let µ = (1)3-form be the 3D volume form. Theniuµ = (u)2-form
and Lu µ
(2.124)
= diuµ = d(u)2-form = (∇·u)3-form. Now, Lu(a)3-form = Lu((a)0-formµ)
= Lu(a)0-formµ + (a)0-form Lu µ = (∇ua + (∇ · u)a)3-form.
Proof of (2.133). Writing (a)2-form = i⃗aµ where ⃗a = (a)vec and µ is the 3D volume
form, we haveL⃗u(a)2-form = L⃗u(i⃗aµ)
(2.129)
= i[⃗u,⃗a]µ + i⃗a(L⃗u µ)
(2.134)
= i[⃗u,⃗a]µ + (∇ ·
u)i⃗aµ
(2.135)
= ( ∇ua − ∇au + (∇ · u)a)2-form.
In fact, during our proof of(2.133), we only used the fact that a 2-form is
the contraction of a vector and a 3-form, each of which has an established Lie
derivatives (2.134) and (2.135). What we may also explore is to expand the
left-hand side of (2.133) using Cartan’s formula (2.124):
Lu(a)2-form = diu(a)2-form + iud(a)2-form (2.142)
= (∇ × (a × u) + (∇ · a)u)2-form. (2.143)
Combining this result with (2.133) yields the following vector calculus iden-
tity
Theorem 2.38 — Curl of cross product.
∇ × (a × u) = u · ∇a − a · ∇u + (∇ · u)a − (∇ · a)u. (2.144)
Similarly, combining Cartan’s magic formula for 1-forms with(2.132) gives us
the following vector calculus identity
Theorem 2.39 — Cross product of curl.
(∇ × a) × u = u · ∇a + ∇(a · u) − (∇u)⊺a. (2.145)
■
■ Example 2.22 — Reynolds’ transport theorems. Consider (2.125) with S =
Ω ⊂ Rn being an n-dimensional region, and α = (f µ) being an n-form, where
f is some function andµ is the volume form inRn. Let Ωt = ϕt(Ω) denote a
moving domain, and letu be the velocity of the moving boundary; more precisely,


## Page 64

64 Chapter 2. Exterior Calculus
u is the velocity field written in coordinates so that˙ϕt = ( u)vec ◦ ϕt. Then,
by Cartan’s magic formula and Stokes’ theorem,
´
Ω L⃗u
n-form
(f µ) =
´
Ω di⃗u(f µ) =
¸
∂Ω f (u)(n − 1)-form. Hence (2.125) can be written as the following vector calculus
identity:
Theorem 2.40 — Reynolds’ transport theorem. Let Ωt be a domain moving
with a velocityu. Then
d
dt
ˆ
Ωt
f dV =
ˆ
Ωt
∂f
∂t dV +
˛
∂Ωt
f u · ndA. (2.146)
ThespecialcaseoftheReynolds’transporttheoremin n = 1is:
Theorem 2.41 — Leibniz’s integral rule. In 1D calculus,
d
dt
ˆ b(t)
a(t)
f (t, x)dx =
ˆ b(t)
a(t)
∂f (t, x)
∂t dx + b′(t)f (t, b(t)) − a ′(t)f (t, a(t)).
(2.147)
Specializing (2.125) to the case of a surface in the 3D Cartesian space yields
Theorem 2.42 Let St be a surface in 3D moving at a velocityu. Let f be a
(time-dependent) vector field defined on the 3D space. Then,
d
dt
¨
St
f · ndA =
¨
St
 ∂f
∂t + (∇ · f)u

· ndA +
˛
∂St
(f × u) · d l. (2.148)
An alternative formula (using (2.133)) is
d
dt
¨
St
f · ndA =
¨
St
 ∂f
∂t + u · ∇f − f · ∇u + (∇ · u)f

· ndA (2.149)
Specializing (2.125) to the case of a curve in the 3D Cartesian space yields
Theorem 2.43 Let Ct be a curve in 3D moving at a velocityu. Let f be a
(time-dependent) vector field defined on the 3D space. Then,
d
dt
ˆ
Ct
f · d l =
ˆ
Ct
 ∂f
∂t + (∇ × f) × u

· d l + (f · u)|∂Ct . (2.150)
Alternatively, using (2.132), we also have
d
dt
ˆ
Ct
f · d l =
ˆ
Ct
 ∂f
∂t + u · ∇f + (∇u)⊺f

· d l. (2.151)
■
2.7 Pairings, Inner Products and Hodge Stars
In this last section of the chapter, we introduce theHodge star. The previous
operators we have introduced (∧, iX, d, Lie brackets,etc.) are built with canonical


## Page 65

2.7 Pairings, Inner Products and Hodge Stars 65
construction without depending on metric. In particular, they all have simple
interplay with the pullback operator. The Hodge star that we are studying here is
metric dependent. In particular, it does not have simple interplay with pullback or
other operators.
The Hodge star is defined with the notion of anL2 inner product. Let us first
clarify dual pairing and inner product.
Theorem 2.44 — Metric-independent pairing. The dual space ofk-forms is iso-
morphic to (n − k)-forms.

Ωk(M )
∗ ∼= Ωn−k(M ). (2.152)
This is done through the following dual pairing
Ωk(M ) × Ωn−k(M )
bilinear
− − − − →R
(α, β) 7→
ˆ
M
α ∧ β. (2.153)
■ Example 2.23 In the 3D Cartesian space,
´
M (a)1-form ∧ (b)2-form =
˝
M a · b dV.
■
Definition 2.20 — Inner product between forms. Suppose ♭ is an inner product
structure on a vector spaceV. This inner product structure defines a natural
volume form
µ ∈ ∧ nV ∗, µ JX1, . . . ,XnK = 1 if X1, . . . ,Xn are positively orthonormal.
(2.154)
The metric also defines a natural inner product onk-forms: for α, β ∈ ∧ k V ∗
⟨α, β⟩ :=
X
1≤i1<···<ik ≤n
αJXi1, . . . ,Xik K βJXi1, . . . ,Xik K (2.155)
using any orthonormal basisX1, . . . ,Xn.
Definition 2.21 — Hodge star. Suppose ♭ is an inner product structure on a vector
space V. Let µ be the associated volume form. Define
⋆k : ∧k V ∗ linear
− − − → ∧n−k V ∗ (2.156)
such that
α ∧ ⋆β = ⟨α, β⟩µ. (2.157)
Definition 2.22 — L2 inner product. Suppose ♭ is an inner product structure on


## Page 66

66 Chapter 2. Exterior Calculus
TpM for each p ∈ M. Define theL2 inner product for Ωk(M ) as
⟪α, β⟫ :=
ˆ
M
⟨α, β⟩ µ =
ˆ
M
α ∧ ⋆β. (2.158)
■ Example 2.24 In the 3D Cartesian space
⋆ (a)0-form = (a)3-form, (2.159)
⋆ (a)1-form = (a)2-form, (2.160)
⋆ (a)2-form = (a)1-form, (2.161)
⋆ (a)3-form = (a)0-form. (2.162)
■
Theorem 2.45 The Hodge star gives a duality relation between the wedge product
and the interior product
iX ⋆k α = (−1)k ⋆k+1 (X ♭ ∧ α). (2.163)
That is,
∧0V ∗
⋆0

∧1V ∗ivoo
⋆1

OO
v♭∧
∧2V ∗ivoo
⋆2

OO
v♭∧
∧3V ∗ivoo
⋆3

OO
v♭∧
∧n−1V ∗···oo
⋆n−1

∧nV ∗ivoo
⋆n

OO
v♭∧
∧nV ∗
iv
// ∧n−1V ∗
−iv
// ∧n−2V ∗
iv
// ∧n−3V ∗ ··· // ∧1V ∗
(−1)n−1iv
// ∧0V ∗
(2.164)
We conclude our exterior calculus chapter here. There are more objects one
can build with the Hodge star that we have not covered, such as the codifferential
δ = (−1)k ⋆−1 d ⋆ and Hodge Laplacian∆ = d δ + δd.
Technically, exterior calculus with metric (i.e. with Hodge star mixed in) makes it
the so-called geometric calculus. In particular, one can replace the wedge product
with thegeometric productformed by the geometric algebra (Clifford algebra) of the
given metric. One obtains the Dirac operatord + δ as the natural generalization ofd
to geometric algebra. In this sense, just as exterior algebra is the geometric algebra
with 0 metric, the exterior calculus is the metric-independent geometric calculus.
That is why it reveals the important structures about the differential topological
aspect of multivariable calculus such as pullback, Lie derivative.


## Page 67

II
3 Geometric Optimizations . . . . . . . 69
3.1 Geometry representations
3.2 A Geometric view of optimization problems
3.3 Computational methods for optimization prob-
lems
4 Continuum Mechanics . . . . . . . . . . 89
4.1 Deformation map
4.2 Elasticity overview
4.3 Tensor Algebra
4.4 Postulates of Elasticity
4.5 Derivation of Elasticity
4.6 Cauchy stress tensor
4.7 More on the strain energy density function
4.8 Conclusion
5 Fluid Dynamics . . . . . . . . . . . . . . . . . . 115
5.1 Euler equations
5.2 Advantages of Covector Euler Equation
5.3 Conclusion
Graphics Topics in Exterior
Calculus


## Page 68

[No extractable text on this page]


## Page 69

3. Geometric Optimizations
In this chapter, we take a new, geometric look at the study of optimizations. This
includes optimization problems where the optimal solution in search is itself a
geometry (Section 3.1) and the geometric picture of the computation of optimization
problems (Section 3.2 and Section 3.3).
3.1 Geometry representations
In graphics, geometry can refer to a point distribution (a point cloud), a curve,
a surface, or a volumetric object. They each have co-dimension 3, 2, 1, and 0,
and they correspond to thedomains on which 0-form, 1-form, 2-form, 3-forms are
integrated.
Notation 3.1 Throughout this chapter, we useM to denote thematerial space
and W to denote theworld space. M is theabstract space of the manifold, like
the index of particles of a point cloud, or the combinatorial structure of a mesh.
W is the world space where the manifold isembedded and in most case, just the 2-
or 3-dimensional Euclidean space. We always denotes the dimension ofM as m
and the dimension ofW as n.
3.1.1 Lagrangian representations: manifold embedding
Definition 3.1 An embedding is an injective smooth map f : M → W that
preserves the topological and the manifold structure. In the context of computer
graphics, this correspondsthe positions of the verticesof a mesh / polycurve,
while the manifoldM itself corresponds to thecombinatorial structureof the mesh
/ polycurve.


## Page 70

70 Chapter 3. Geometric Optimizations
vertex 1
position (x1, y1)
vertex 2
position (x2, y2)
vertex 3
position (x3, y3)
vertex 4
position (x4, y4)
Manifold M
Triangle id Vertices
1 (1, 2, 3)
2 (3, 2, 4)
Embedding f : M → W
Vertex id Position
1 (x1, y1)
2 (x2, y2)
3 (x3, y3)
4 (x4, y4)
■ Example 3.1 — Function graph. Given a function graphz = g(x , y), we can
view it as an embedding
f : M → W
(x , y) 7→ (x , y, f (x , y)).
Here the material spaceM is the 2-dimensional parameter space ofx and y, and
W is the 3-dimensional world space ofx , y, and z. ■
Many classical geometric properties likecurvature and second fundamental form
are defined using the embedding of a manifold. We give a few examples of them
below.
Definition 3.2 — Differential geometry of curves by embedding function. Let M
be an 1-dimensional manifold andf : M → W is an embedding ofM into W = R3.
Let p ∈ M be a point. Locally (in a neighborhood aroundp), we can parametrize
M as an interval(a, b) of the real line, and use the Cartesian coordinatesx , y, z
for R3 and write the embedding f : (a, b) → R3 as f (t) = ( x(t), y(t), z(t)) for
t ∈ (a, b). The unit tangent vector is given as
T(t) = (x ′(t), y ′(t), z ′(t))
|(x ′(t), y ′(t), z ′(t))|ℓ2
, (3.1)
where |(x , y, z)|ℓ2 =
p
x 2 + y2 + z 2 denotes the Euclidean norm. An intuitive
observation tells us that the faster the tangent direction changes, thecurvier the
curve is. Notice that the curviness property only depends on the tangentdirection,
not the derivative of the embedding function. We hence define thecurvature as


## Page 71

3.1 Geometry representations 71
Figure 3.1 An abstract 1-dimensional manifoldM (bottom left) that resembles
a circle can be embedded to any wiggly shape (top right) but we can
never embed it to something that has an open endpoints (top left) or
something knotted (bottom right).
the rate of change of the unit tangent:
κ(t) =
 ˙T

ℓ2
. (3.2)
R It is crucial that the readers see that the above definition of unit tangent and
curvature are bothembedding dependent! Without an embedding function
f : M → W, the manifold still has its own (albeit abstract) tangent space
TpM ∼= R. An embedding f : M → W can convert the abstract tangent to an
R3 vector by the push-forward map
df : TpM ∼= R linear− − − →Tf (p)W ∼= R3
1 linear7− − − →


x ′(t)
y ′(t)
z ′(t)

 .
(3.3)
R Another crucial insight is that the embedding functionf : M → W has to
be smooth. The smoothness requirement means that the embedding must
preserve the manifold’stopology, includingtopological featureslike genus,
knottedness, or open endpoints. See Figure 3.1 and Figure 3.2. This is why
when a simulation artist uses meshed surfaces to model fracturing material (e.g.
tearing a piece of paper), their simulation pipeline cannot simply modify the
vertex positions but it sometimes have to modify the combinatorial structure
(often calledremeshing) when the surface go throughtopological changes!


## Page 72

72 Chapter 3. Geometric Optimizations
Figure 3.2 An abstract 2-dimensional manifoldM (bottom left) that resembles
a sphere can be embedded to any wiggly shape (top right) but we
can never embed it to something that has boundary (top left) or
something with a nonzero genus (bottom right).
3.1.2 Integration pairing
Now that we’ve learned about the distinction between an abstract manifoldM and
their embedding f : M → W into the world space, we can dive into the relation
between an embedded manifoldM
f
,− →W and differential forms in the world space
Ωm(W ).
Definition 3.3 Wedefinethe integration pairingbetweenanembedded k-dimensional
manifold M
f
,− →W a and a k-form α ∈ Ωk(W ) as the k-dimensional integral:
⟨M |α⟩ :=
ˆ
M
α. (3.4)
The integration pairing corresponds to function evaluation(k = 0), oriented line
integral (k = 1), oriented surface integral (k = 2), and the usual volumetric
integral (k = 3).
aIt is possible to consider a broader range of integration pairings: as long as the differential
forms are smooth, we can integrate them not only on smoothly embedded manifolds, but also on
rectifiable sets, which are patches of smoothly embedded manifolds joined together in a merely
continuous sense.
Theorem 3.1 The integration pairing is bilinear, meaning that we can take linear


## Page 73

3.1 Geometry representations 73
combination in both thek-dimensional embedded manifolds and thek-forms: for
a1, a2 ∈ R two real numbers,M1, M2 ⊂ W two embedded k-dimensional manifolds,
α1, α2 ∈ Ωk(W ) two k-forms,
⟨a1M1 + a2M2|α⟩ = a1
ˆ
M1
α + a2
ˆ
M2
α = a1⟨M1|α⟩ + a2⟨M2|α⟩, (3.5)
⟨M |a1α1 + a2α2⟩ = a1
ˆ
M
α1 + a2
ˆ
M
α2 = a1⟨M |α1⟩ + a2⟨M |α2⟩. (3.6)
Theorem 3.2 By Stokes’ Theorem (Theorem 2.12), the exterior derivatived of
differential forms and the operation of taking boundary∂ of the integration domain
are adjoint of each other under the integration pairing:
⟨S |d α⟩ =
ˆ
S
d α
Stokes
=
ˆ
∂S
α = ⟨∂S |α⟩. (3.7)
3.1.3 Exterior calculus on combinatorial surfaces and curves (DEC)
Definition 3.4 A tessellated (meshed) surface is a tuple(V , E , F) of vertices V,
edges E, and facesF. A vertex has dimension 0, so we called it a0-cell. We call
an edge a1-cell and a face a2-cell. Together, we call(V , E , F) a cell complex.
The boundary operator ∂ is defined by the following:
• Since, for example, a face can have multiple edges that form its boundary,
the boundary operator needs to map a face to a combination of multiple
edges.
• We denote the set of all weighted sum of faces asCF, weighted sum of edges
as CE, and weighted sum of vertices asCV. The orientation of an edge /
face corresponds to the sign of the weightseij = −eji , fijk = fjki = fkij =
−fjik = −fikj = −fkji. For reference, we referred to a weighted sum of cells
as a chain.
• We then define the boundary operator as the linear maps∂1, ∂2
CV
∂1
← −CE
∂2
← −CF (3.8)
such that ifeij , ejk , eki are the three edges forming the boundary of a triangu-
lar face fijk, then ∂2(fijk) = eij + ejk + eki, and ifvi , vj are the two endpoints
forming the boundary of an edgeeij, then ∂1(eij ) = −vi + vj. Readers can
check that ∂1 ◦ ∂2 = 0 as the boundary of a face is a loop, which has no
endpoints.
Definition 3.5 With the above example in mind, we can define a generalized
m-dimensional cell complex as M = (M0, · · · , Mm) together with a boundary


## Page 74

74 Chapter 3. Geometric Optimizations
operator and the chain complex:
C0
∂1
← −C1
∂2
← − · · ·
∂m
← −Cm. (3.9)
This definition should cover poly-lines (1-dimensional cell complex), tesselated
(meshed) surfaces (2-dimensional cell complex), and volumetric meshes (e.g. tetra-
hedral mesh) (3-dimensional cell complex).
Since each Ck is a finite dimensional vector space, its dual spaceC k := (Ck)∗ is also
finite dimensional, too. Just like the dual of vectors is called a covector (linear maps
from vectors to real numbers), the dual of chains is called acochain (linear maps
from chains to real numbers). In Theorem 3.2 we saw that the adjoint of boundary
operator ∂ is the exterior derivatived, thus gives rise to thecochain complex,
similar to (3.9):
C 0 ∂∗
1=d0
− − − →C 1 ∂∗
2=d1
− − − → · · ·
∂∗
m=dm−1
− − − − − →C m. (3.10)
The k-cells Mk = {c1, · · · , cN } automatically form a basis of the space of weighted
sums of them,a.k.a. k-chains Ck. Each cellc ∈ Mk corresponds to a linear functional
on k-cochains by the integration pairing:
c: α ∈ Ωk(M ) 7→
ˆ
c
α. (3.11)
We can therefore view the space of cochainsC k as differential k-forms up to minor
difference that cannot be distinguished by integration onk-cells. More precisely,
suppose α, β ∈ Ωk(M ) are two differentialk-forms such that their integral values are
the same on allk-cells, ˆ
c
α =
ˆ
c
β, for all c ∈ Ck . (3.12)
For the purpose of any computation on the cell complex,α and β are virtually
indistinguishable. As a result, they can be represented as the sameN real numbers:


´
c1
β´
c2
β
...´
cN
β

 =


´
c1
α´
c2
α
...´
cN
α

 ∈ RN . (3.13)
In other words, α and β belongs to the same equivalence class, and the space of
cochains C k is exactly the collection of these equivalence classes. We can further
derive an entire theory about the exterior calculus of these “differential forms up
to minor differences that cannot be distinguished by the cell complex” (equivalence
classes). Another SIGGRAPH course [Crane(2018)] already covered a wide range
of exterior calculus operations on discrete surfaces and curves and we omit the
discussions here.
3.1.4 Eulerian representations: geometric measure theory
Eulerian representations, contrary to Lagrangian ones, seeks to represent geometries
contained in the world spaceW as functionals of differential forms.


## Page 75

3.1 Geometry representations 75
Recall that a Dirac-δ measure ρp of a pointp ∈ W is an n-form (sometimes also
called ameasure) where for any (volumetric) subsetA ⊂ W,
ˆ
A
ρp =
(
1, if p ∈ A
0, if p /∈ A. (3.14)
The Dirac-δ n-form ρp induces a linear functionalT via dual pairing:
T: Ω0(W )
linear
− − − →R
f
linear
7− − − →
ˆ
W
f ρp.
(3.15)
Readers can verify that this functionalT is linear in its inputf ∈ Ω0(W ) by verifying
that T(af + bg) = aT(f ) + bT(g) for a, b ∈ R and f , g ∈ Ω0(W ).
We can approximate the Dirac-δ n-form by ρϵ defined as
ˆ
A
ρϵ = Vol(A ∩ Bp(ϵ))
Vol(Bp(ϵ)) . (3.16)
Here Bp(ϵ) denotes the neighborhood ball centered at pointp with radius ϵ > 0. The
induced linear functional on 0-forms is:
Tϵ: Ω0(W )
linear
− − − →R
f
linear
7− − − →
´
Bp(ϵ) f µ
´
Bp(ϵ) µ .
(3.17)
For continuous functionsf, the above corresponds to theaverage of f on the ϵ-ball
Bp(ϵ) and it converges to the function valuef (p) as ϵ → 0.1
The intuition behind Dirac-δ n-form is that each pointp ∈ W corresponds to
a linear functionalTp that maps a 0-formf ∈ Ω0(W ) to its evaluationf (p) at the
point p. A point p is of dimension 0. For geometries of other dimension, we can
similarly define a linear function on differential forms.
Definition 3.6 — Currents / Dirac- δ forms. One way to to represent ak-dimensional
geometry S ⊂ W is by the linear functionalTS that maps differentialk-forms
Ωk(W ) to their integral onS:
TS: Ωk(W )
linear
− − − →R
α
linear
7− − − → ⟨S |α⟩ =
ˆ
S
α.
(3.18)
We call the functionalTS the k-current associated with S. In lieu of the dual
pairing between(n − k)-forms and k-forms:
α ∈ Ωk(W ), β ∈ Ωn−k(W ) 7→
ˆ
W
α ∧ β, (3.19)
1This is true for more general, integrable functions for almost allp ∈ W. Interested readers can
read about Lebesgue differentiation theorem.


## Page 76

76 Chapter 3. Geometric Optimizations
we can now viewk-dimensional geometries as(n − k)-forms!
{k-dimensional geomeries} ∼=

Ωk(W )
∗ ∼= Ωn−k(W ). (3.20)
We call the(n − k)-form δS ∈ Ωn−k(W ) satisfying the following equation the
Dirac-δ form associated with S:
ˆ
W
α ∧ δS =
ˆ
S
α. (3.21)
We saw in Theorem 3.2 that the adjoint of the exterior derivatived is the
boundary operator ∂. In the context of currents / Dirac-δ forms, we have a similar
insight.
Theorem 3.3 Let S ⊂ W be a k-dimensional geometry andδS ∈ Ωn−k(W ) be the
associated Dirac-δ form. If we take an exactk-form d α ∈ Ωk(W ) for some smooth
α ∈ Ωk −1(W ) as the input of the dual pairing, then
ˆ
W
d α ∧ δS =
ˆ
S
d α
Stokes
=
ˆ
∂S
α =
ˆ
W
α ∧ δ∂S . (3.22)
We then apply Leibniz rule (2.59)
d (α ∧ δS)| {z }
(n−1)-form
= d α ∧ δS + α ∧ (−1)(k −1)d δS , (3.23)
Since
´
W d(α ∧ δS) =
´
∂W α ∧ δS = 0 a, the left hand side of(3.22) turns into´
W α ∧ (−1)k d δS. Since the equation holds true for allα ∈ Ωk −1(W ), we conclude
that as an(n − k + 1)-form,
d δS = (−1)k δ∂S . (3.24)
aIn most cases, we can assumeS is a bounded geometry,i.e. it doesn’t intersect the boundary
∂Wthe world space W; therefore δS |∂M = 0. We will need to use testing smooth forms
α ∈ Ωk −1
c (M ) that vanish at the boundary∂W / has compact support if S is not as well-
behaved.
R Recall that if we represented the geometryS ⊂ W as a manifold with an
embedding map, the process of taking the boundary∂S would involve dealing
with the combinatorial structure representing the abstract manifold. It is when
we adopt the Eulerian view of geometry representations that we can use a
simple linear operation d to take the boundary of a geometry.
■ Example 3.2 — Surface area. Let W be the 3-dimensional Euclidean space.
Suppose S ⊂ W is a 2-dimensional geometry (surface) with boundary∂S. The
surface area ofS is the same as the surface integral of the unit normal vector field


## Page 77

3.1 Geometry representations 77
n: S → TW
Area(S) =
ˆ
S
1dA =
ˆ
S
⟨n, n⟩, (3.25)
where ⟨·, ·⟩ denotes the Euclidean metric. At any given pointp ∈ S, the unit
normal vector np ∈ TpW is the vector that yields the largestflux, i.e.
⟨np, np⟩ = max
v∈Tp W ∼=R3
⟨v, np⟩. (3.26)
Combining the above equations, we see that surface area is determined by the
maximal flux amongst all unit vector fields
Area(S) = max
X:W →R3,|X|≤1
ˆ
S
X♭. (3.27)
Using the Hodge star and musical isomorphisms associated with Euclidean metric,
we can associate any vector fieldX: W → R3 with a 2-formα ∈ Ω2(W ) such that
X = (⋆α)♯. The constraint thatX is a unit vector field is equivalent to
∥α∥max := max
p∈M
|αp| ≤ 1. (3.28)
We now write everything using the Dirac-δ 1-form δS representing S:
Area(S) = max
α∈Ω2(W ),∥α∥max ≤1
ˆ
S
α (3.29)
= max
α∈Ω2(W ),∥α∥max ≤1
ˆ
W
α ∧ δS (3.30)
=: ∥δS ∥mass. (3.31)
The last two lines and is the same as saying∥ · ∥mass is the dual norm of ∥ · ∥max.
By combining the boundary operator from Theorem 3.3 and the above deriva-
tion, we can now solve the classicalPlateau problem of finding surface S of
minimal surface area subject to a fixed boundary curveΓ ⊂ W:
minimize
S ⊂W :a surface
Area(S)
subject to ∂S = Γ.
(3.32)
The equivalent problem written in terms of Dirac-δ forms look like
minimize
η∈Ω1(W ):a 1-form
∥η∥mass
subject to d η = δΓ.
(3.33)
■


## Page 78

78 Chapter 3. Geometric Optimizations
Figure 3.3 Minimal surfaces computed using Eulerian representation as described
by Problem 3.33 [Wang and Chern(2021)]. Unlike Lagrangian rep-
resentation that requires tricky combinatorial effort in computing
surface boundary, problems formulated using Eulerian representations
only require a linear equation when assigning the boundary!
3.2 A Geometric view of optimization problems
Optimization is a type of math problems commonly found in engineering and science.
The most basic optimization problem was perhaps introduced in one’s first Calculus
class.
Problem 3.1 — Optimization on the real line. Given anobjective function f : R → R,
find the optimal input xopt ∈ R such that f attains the minimal value atxopt, i.e.
f (xopt) = min
x ∈R
f (x). (3.34)
We learned in Calculus that for differentiablef, a necessary condition that an input
x0 is optimal is that the first derivative off attains zero:
f ′(x0) = 0. (3.35)
The above equation is referred to as thefirst order optimality condition for the
optimization problem(3.34). If f is twice differentiable, then the first order optimality
condition together with the inequality
f ′′(x0) ≥ 0 (3.36)
ensures that x0 is alocal minimum, which means all nearby pointsx ∈ (x0 − ϵ, x0 + ϵ)
are less optimal than (or equally optimal to)x0, i.e. f (x) ≤ f (x0).


## Page 79

3.2 A Geometric view of optimization problems 79
f (x0)
f ′(x0) = 0
x0 x0 + ϵx0 − ϵ
In this section, we explore the geometric picture of optimization problems: re-
placing real line with finite-dimensional manifolds or even function spaces, adding
equality constraints, adding inequality constraints, the geometric meaning of La-
grange multipliers, and iterative numerical methods for solving optimization methods.
We focus on deriving the necessary condition for an optimal solution, similar to
(3.35), and leave the discussions of the sufficient condition for other textbooks,e.g.
[Boyd and Vandenberghe(2004)].
3.2.1 Unconstrained problems on (finite-dimensional) manifolds
Problem 3.2 M is an n-dimensional manifold and f : M → R is a function onM.
An unconstrained optimization problem on the manifoldM is about finding a point
p ∈ M such that f (p) attains minimal value:
minimize
p∈M
f (p). (3.37)
The locally optimal solutionp ∈ M must satisfy that all its neighboring points
are less optimal than (or equally optimal to)p. This property can be captured by the
property that ifγ: [−ϵ, ϵ] → M is a path inM passing through the pointp = γ(0),
then the functionF = f ◦ γ: [−ϵ, ϵ]
γ
− →M
f
− →R takes a local minimum whens = 0
and γ(s) = p. Apply the first order optimality condition (3.35), we get
0 = F ′(0) = d
ds f ◦ γ(s)|s=0 = dfγ(0)J ˙γ(0)K = dfpJv K, (3.38)
where v ∈ TpM = ˙γ(0) is the tangent of the pathγ at the pointp. Since this has to
hold true for all pathγ at all tangent directionv ∈ TpM, we conclude that the first
order condition for a local optimal solutionp is the same as the differentialdf of the
objective function f is zero as a 1-form atp:
dfp = 0. (3.39)
3.2.2 Unconstrained problems on functions and differential forms
We now take a look at unconstrained optimization problems on the space of functions
and differential formsΩk(M ). When k = 0, the study of optimization problems
on the space of functionsΩ0(M ) is often calledCalculus of Variations. One nice
property about differential forms is that they have a linear structure. To perturb an
input α ∈ Ωk(M ), one can simply pick anotherk-form ˚α ∈ Ωk(M ) and add it toα.
In Figure 3.5, we visualize this concept for 0-formsa.k.a. functions.


## Page 80

80 Chapter 3. Geometric Optimizations
u
u + ˚u
˚u
[
a
]
b
Figure 3.4 The function spaceV = Ω0([a, b])is a vector space. With any function
u: [a, b] → R, we can always take another function˚u: [a, b] → R and
add it tou to get a modified functionu + ˚u: [a, b] → R. Effectively,
the tangent space atu is the entire function spaceTu V = V.
Problem 3.3 M is an n-dimensional manifold andV = Ωk(M ) is the vector space of
all k-forms defined onM. Let E: V → R be a functional2 defined on V. We use the
notation E because a common origin of optimization problems on function spaces
is about minimizing anenergy functional. An unconstrained optimization problem
on k-forms V = Ωk(M ) is about finding an optimalα ∈ V such that E[α] attains
minimal value:
minimize
α∈V
E(α). (3.40)
The differentiald E at an inputα ∈ V is a covectord E| α ∈ V ∗. We can understand
this infinite dimensional covector by pairing it with a tangent vector˚α ∈ TαV = V:
d EαJ˚αK =

d Eα
˚α
 := d
d ϵ

ϵ=0
E(α + ϵ˚α). (3.41)
Each tangent vector˚α ∈ TαV = V acts on α by varying its valueαp to αp + ˚αp
at any pointp ∈ M. Hence we call the tangent vector˚α a variation. We use the
notation of˚α to indicate that it is a variation in the objectα. Likewise, we sometimes
write
˚E = ⟨d Eα|˚α⟩ (3.42)
to denote the corresponding variation inE.
The locally optimal solutionα ∈ V must satisfy thatα + ϵ˚α is less optimal than
(or equally optimal to)α for small ϵ > 0. As a result, the functionF (s) = E(α + s˚α)
must attain local minimum whens = 0 and F(0) = E(α). By (3.35),
0 = F ′(0) = d
d ϵ

ϵ=0
E(α + ϵ˚α) = d EαJ˚αK. (3.43)
Since this has to hold true for all variations˚α ∈ V, we conclude that the first order
condition for a local optimal solutionα is the same as the differentiald E of the
2A functional is just another name for function with an emphasis that it may be a function over
a space of functions.


## Page 81

3.2 A Geometric view of optimization problems 81
energy functional E vanishes at α as a covector:
d E| α = 0 ∈ V ∗. (3.44)
■ Example 3.3 Let V = {u : [a, b] → R} = Ω 0([a, b]). Define E : V → R as
E(u) =
´ b
a u2(x) dx. The differentiald E| u : V
linear
− − − →R is
d EuJ˚uK = d
d ϵ

ϵ=0
ˆ b
a
(u(x) + ϵ˚u(x))2dx (3.45)
=
ˆ b
a
2(u(x) + ϵ˚u(x))˚u(x) dx

ϵ=0
(3.46)
=
ˆ b
a
2u(x)˚u(x) dx . (3.47)
■
■ Example 3.4 — Dirichlet energy. Let V = Ω 0([a, b]). Define E : V → R as
E(u) =
´ b
a
1
2 u ′(x)2 dx, which is often called theDirichlet energy. We can use
integration by parts to understand the differentiald E| u : V
linear
− − − →R,
d EuJ˚uK = d
d ϵ

ϵ=0
ˆ b
a
(u ′(x) + ϵ˚u ′(x))2dx (3.48)
=
ˆ b
a
u ′(x)˚u ′(x) dx (3.49)
IbyP
= u ′(b)˚u(b) − u ′(a)˚u(a) −
ˆ b
a
u ′′(x)˚u(x) dx . (3.50)
The expression after the integration by parts appear more directly as anL2 linear
pairing (see Definition 2.22) with˚u together with some finite dimensional dot
product pairing at the boundary. ■
d E| α isthedifferentialof E at α, whichisacovectorin V ∗ =

Ωk(M )
∗ ∼= Ωn−k(M )
3. It is not to be confused with the gradient of the functionalgrad E| α ∈ V = Ωk(M ).
It is also not to be confused with the differential of the input variabled α ∈ Ωk+1(M ).
Let ♭V : V → V ∗, or “uncurried” as⟪·, ·⟫V = ♭V(·)(·), be some metric (inner product
structure) defined onV. Then we have a unique vectorgrad E| α := d E| ♯V
α defined
such that
⟪grad E| α, ˚α⟫ = d E| αJ˚αK ∀ ˚α ∈ V . (3.51)
■ Example 3.5 Let V = {u : [a, b] → R}. Define E : V → R as E(u) =
´ b
a u2(x) dx,
whose variation is known asd EuJ˚uK =
´ b
a 2u(x)˚u(x) dx. If we define an inner
3See Theorem 2.44.


## Page 82

82 Chapter 3. Geometric Optimizations
product structure by
⟪u, v ⟫ :=
ˆ b
a
u(x)v(x)m(x) dx (3.52)
using some given positive functionm : [a, b] → R>0. Then the gradient ofE is
given by
grad E| u(x) = 2u(x)
m(x) . (3.53)
■
The domain forE does not need to be a vector space. One typical extension is
that A is an affine space parallel toV. That is, V is the tangent space ofA at any
point α ∈ A. Then d E| α is a covector inV ∗, and grad E| α is a vector inV. The first
order optimality condition for a minimization problem on an affine spaceA is the
same: the differentiald E| α is zero as a covector inV ∗.
u
u + ˚u
˚u
[
a
]
b
u(a) = ca
u(b) = cb
˚u(a) = 0
˚u(a) = 0
Figure 3.5 The function space with boundary conditions A = {u ∈
Ω0([a, b]), u(a) = ca , u(b) = cb} is an affine space. With any function
u ∈ A, we can always take another function that vanishes on the
boundary ˚u ∈ V = {˚u: [a, b] → R,˚u(a) = ˚u(b) = 0} and add it tou
to get a modified functionu + ˚u: [a, b] → R. Effectively, the tangent
space at u is the space of functions with vanishing boundary values
Tu A = V.
■ Example 3.6 — Dirichlet energy with boundary conditions. Let A = {u : [a, b] →
R, u(a) = ca, u(b) = cb} for some constantsca, cb. Note that A is an affine space.
That is, the difference between any two elements in A form a vector space
V = {˚u : [a, b] → R,˚u(a) = ˚u(b) = 0} which is closed under additions and scalar
multiplications. Let E : A → R be the Dirichlet energyE(u) =
´ b
a
1
2 u ′(x)2 dx for
u ∈ V. (3.50) states that
d EuJ˚uK = −
ˆ b
a
u ′′(x)˚u(x) dx . (3.54)
Consider the m(x)-weighted inner product ⟪˚u,˚v ⟫ =
´ b
a ˚u(x)˚v(x)m(x) dx for


## Page 83

3.2 A Geometric view of optimization problems 83
˚u,˚v ∈ V and write
d EuJ˚uK =
ˆ b
a
 −u ′′(x)
m(x)

˚u(x)m(x)dx = ⟪ −u ′′
m|{z}
grad Eu
,˚u⟫ . (3.55)
The gradient grad Eu ∈ V as a function is
grad Eu(x) = − u ′′(x)
m(x) , x ∈ [a, b]. (3.56)
■
■ Example 3.7 Let L: R × R → R, L = L(u1, u2) be some expression. Let its
differential be denoted by
dL = ∂L
∂u1
du1 + ∂L
∂u2
du2. (3.57)
Now, consider A = {y : [a, b] → R | y(a) = ya, y(b) = yb} for some givenya, yb.
Note that A is an affine space with tangent vector space V = {˚y : [a, b] →
R |˚y(a) = ˚y(b) = 0}. Let E : A → R,
E(y) :=
ˆ b
a
L (y(x), y ′(x)) dx . (3.58)
Then its variation is
d E| y J˚yK =
ˆ b
a
 ∂L
∂u1
(y(x), y ′(x))˚y(x) + ∂L
∂u2
(y(x), y ′(x))˚y ′(x)

dx (3.59)
=
ˆ b
a
 ∂L
∂u1
(y(x), y ′(x)) − d
dx
 ∂L
∂u2
(y(x), y ′(x))

˚y(x) dx . (3.60)
A common shorthand notation is
d E| y J˚yK =
ˆ b
a
 ∂L
∂y − d
dx
∂L
∂y ′

˚y dx . (3.61)
■
In a more general case, the domain ofE is an infinite dimensional manifoldM.
Its variation is a covector fieldd E ∈ Γ(T ∗M) and its gradient with respect some
inner product structure is a vector fieldgrad E ∈ Γ(T M).
Problem 3.4 M is an infinite dimensional manifold andE: M → R is a function
defined on M. The following defines an unconstrained optimization problem onM:
minimize
y∈M
E(y). (3.62)
The necessary condition for alocally optimal solutiony ∈ M is that variation of


## Page 84

84 Chapter 3. Geometric Optimizations
the energy along any variation˚y ∈ Ty M must vanish:
d E| y J˚yK = 0, for all˚y ∈ Ty M, (3.63)
or simply
d E| y = 0 ∈ T ∗
y M. (3.64)
Using any inner product, this vanishing variation condition becomes
grad E| y = 0. (3.65)
We call(3.65) the Euler–Lagrange equation. It is not a surprise that the optimality
condition for problems on finite dimensional manifold (Problem 3.2) and problems on
infinite dimensional manifold (Problem 3.4) look almost identical, but we usually use
Euler-Lagrange equation to refer to the metric-informed equation(3.65) for infinite
dimensional cases.
In the sections to follow, we always denote our optimization variable asx ∈ M
where M can be a finite- or infinite-dimensional manifold.
3.2.3 Optimization with equality constraints
An optimization with equality constraints takes the following general form. Let
M be a manifold,F : M → R be the objective function, and letG : M → U be a
constraint function for some vector spaceU. The optimization problem is stated as
minimize
x ∈M
F(x)
subject to G(x) = 0U .
(3.66)
Here 0U simply denotes the zero element in the vector spaceU. We assume bothF
and G are smooth. The necessary condition for the optimal solutionx is
d F |x J˚x K = 0 for all˚x ∈ (d G|x)⊥ (3.67)
where (d G|x)⊥ denotes the annihilator subspace
(d G|x)⊥ =

˚x
 d G|x J˚x K = 0

. (3.68)
Note that the type ofd G|x is d G|x : Tx M
linear
− − − → U. The condition implies that there
exists a Lagrange multiplier λ0 ∈ U ∗ such that G|x = 0 and
d F |x +
D
λ0
d G|x
E
U ∗×U
= 0 ∈ Tx M. (3.69)
3.2.4 Karush–Kuhn–Tucker conditions
Let us look at optimization problems with both equality constraints and inequality
constraints. The energy function is still given as a functionF : M → R on a general
manifold M. The equality constraints are given through a functionG : M → U to a
vector space U. The inequality constraints are defined by a (proper) convex cone


## Page 85

3.3 Computational methods for optimization problems 85
C ⊂ V in a vector spaceV and a functionH: M → V . The optimization problem
takes the following form:



minimize
y∈M
F(y) subject to
G(y) = 0U
H(y) ∈ C .
(3.70)
The necessary stationary conditions for an optimal solutiony0 ∈ M are the following
Karush–Kuhn–Tucker (KKT) conditions. There exist Lagrange multipliesλ0 ∈ U ∗ and
µ0 ∈ C ◦ :=
n
µ ∈ V ∗
 ⟨µ|v ⟩V ∗×V ≤ 0 for all v ∈ C
o
⊂ V ∗ (3.71a)
(C◦ is called thepolar cone of C) such thatG|y0 = 0, H|y0 ∈ C,
d F |y0 +
D
λ0
d G|y0
E
U ∗×U
+
D
µ0
d H|y0
E
V ∗×V
= 0 ∈ Ty0M, (3.71b)
and
D
µ0
H(y0)
E
V ∗×V
= 0. (3.71c)
The last condition(3.71c) is called the complementary slackness condition. It
implies that if H(y0) is the interior of the coneC, then the Lagrange multiplier
term is deactivated µ0 = 0. Only when H(y0) lies on the boundary of the cone,
we see an associated “normal force”µ0 emerges to keep H(y0) in the interior of
the cone. Condition (3.71c) is the pullback of the corresponding complementary
slackness condition about the convex cone onV back toM via the mapH. In(3.71b),
the 2nd and 3rd terms can also be interpreted as the pullbacks of the covectors
λ0 ∈ U ∗, µ0 ∈ V ∗ via G and H respectively.
3.3 Computational methods for optimization problems
3.3.1 Direct and iterative methods for unconstrained problems
For an unconstrained problem on a (finite- or infinite-dimensional) manifoldM
minimize
x ∈M
F(x), (3.72)
there are two ways to find the optimal solution. The first method is to solve the
optimality condition directly
d F |x = 0 ∈ Tx M. (3.73)
The second method is to find a metric♯: T ∗M
linear
− − − →TM and solve thegradient
flow: starting with an initial guessx0 ∈ M, the pathx: [0, ∞) → M satisfying the
following differential equation
˙x(t) = −(d Fx(t))♯ = − grad Fx(t) (3.74)


## Page 86

86 Chapter 3. Geometric Optimizations
will4 converge to the stable pointxopt ∈ M with vanishing the gradient
(d F |x opt)♯ = grad F |x opt = 0. (3.75)
Numerically, this is often done via aforward Euler scheme, where a sequence of
intermediate states x (k) is defined iteratively
x (0) = x0 (initial guess)
x (k+1) = x (k) − ∆t(k) (d F |x (k ))♯ ,
(3.76)
where ∆t(k) > 0 denotes thek-th time step, which can be a fixed value or determined
via line search. The iterative scheme(3.76) is often called theGradient Descent
method.
■ Example 3.8 — An extended discussion on Dirichlet energy from Example 3.6.
Let A = {u : [a, b] → R, u(a) = ca, u(b) = cb} for some constantsca, cb. Consider
the Dirichlet energyE(u) =
´ b
a
1
2 u ′(x)2 dx. We saw in Example 3.6 that
d EuJ˚uK =
ˆ b
a
u ′(x)˚u ′(x) dx = −
ˆ b
a
u ′′(x)˚u(x) dx , (3.77)
andthegradient grad Eu associatedwiththe m(x)-weightedinnerproduct ⟪˚u,˚v ⟫L2 =´ b
a ˚u(x)˚v(x)m(x)dx is
grad Eu(x) = − u ′′(x)
m(x) . (3.78)
Using the direct method, we can solve the optimality condition (also called
Euler-Lagrange equation) 


u ′′(x) = 0
u(a) = ca
u(b) = cb.
(3.79)
Alternatively, one can use the gradient flow method, and solve the differential
equation for u: [a, b] × [0, ∞) → R
(
d
dt u(x , t) = − grad Eu(·,t) = u ′′(x ,t)
m(x)
u(x , 0) = u0(x),
(3.80)
where u0(x) ∈ A is an arbitrary initial function.
Interestingly,(3.79) corresponds to solving aLaplace problem with specified
boundary value, while(3.80) corresponds to solving theheat equation with an
arbitrary initial value. Both of them gives aharmonic function with the specified
boundary value! ■
4The convergence to a stable point often requires additional assumptions on the objective
function F such as convexity, superlinearity,etc.. Thankfully most objective functions in computer
graphics do possess these nice properties.


## Page 87

3.3 Computational methods for optimization problems 87
■ Example 3.9 — Newton’s method. Let M be an m-dimensional manifold and
f : M → R be an objective function and we want to solve the following optimization
problem:
minimize
x ∈M
f (x). (3.81)
Suppose M has a coordinate system(x1, · · · , xm): M → Rm that are not necessarily
orthonormal. Given a pointx ∈ M and a tangent˚x ∈ Tx M, the differential can
be written in terms of the coordinates:
˚f = dfx J˚x K (3.82)
= ∂f
∂x1
(x)˚x1 + · · · + ∂f
∂xm
(x)˚xm, where ˚x =


˚x1
...
˚xm

 (3.83)
We need a metric⟨·, ·⟩ to define the gradient flow. Write the metric as a matrix-
valued function µ =

µij

: M → Rm×m using the coordinates:
*

˚x1
...
˚xm

 ,


˚y1
...
˚ym


+
=

˚x1 · · · ˚xm



µ11(x) · · · µ1m(x)
... . . . ...
µm1(x) · · · µmm(x)




˚y1
...
˚ym

 (3.84)
We can use the usual matrix algebra and compute
dfx J˚x K =
h
∂f
∂x1
(x) · · · ∂f
∂xm
(x)
iT


˚x1
...
˚xm

 (3.85)
=
*

µ11(x) · · · µ1m(x)
... . . . ...
µm1(x) · · · µmm(x)


−1

∂f
∂x1
(x)
...
∂f
∂xm
(x)


| {z }
gradµ f |x
,


˚x1
...
˚xm


+
. (3.86)
Since the original optimization Problem 3.81 doesn’t concern to assign a metric
to the manifoldM, we can choose a metric ourselves such that the matrixµ(x)
coincides with theHessian of f:


µ11(x) · · · µ1m(x)
... . . . ...
µm1(x) · · · µmm(x)

 =


∂2f
∂x 2
1
(x) · · · ∂2f
∂x1∂xm
(x)
... . . . ...
∂2f
∂xm ∂x1
(x) · · · ∂2f
∂x 2m
(x)

 =: Hf (x). (3.87)


## Page 88

88 Chapter 3. Geometric Optimizations
Optimization methods based on the gradient flow of this Hessian metric are called
Newton’s method:
˙x = Hf (x)−1


∂f
∂x1
(x)
...
∂f
∂xm
(x)

 . (3.88)
■


## Page 89

4. Continuum Mechanics
Continuum mechanics is the study of the statics and dynamics of deformable bodies.
These deformable bodies can behave like elastic solid, Newtonian fluid, elastoplastic
solid, viscoplasticity (non-Newtonian) fluid, ferrofluid, or plasma. Which behavior
should a deformable body follow depends on a constitutive model. These models boil
down to describing how a potential energy is defined as a function of the deformation
of the body, and how a dissipation function depends on both the deformation and
the rate of deformation of the body. The equations of motion are derived from the
model by variational principle.
• (Hyper)elasticity The potential energy is only a function of the metric induced
by the deformation from the world metric. Examples include elastic bodies
such as jelly, rubber,etc. Examples also include most solids undergone small
deformations or rigid motions.
• Newtonian fluid The potential energy is only a function of the induced change
of volume by the deformation; the dissipation is only a function of the rate of
deformation.
• Elastoplasticity An elasticity setup but the system carries extra variables that
encode a reference metric for rest state, and the dissipation function depends
on the rate of change of the rest metric. Examples include solids undergone
irreversible plastic deformation, hardening, and fracturing.
• Viscoplasticity In addition to elastoplasticity setup, the fluid carries a con-
vectedtensorfielddescribingthestatisticsofthedirectionmicroscopicanisotropic
molecules. The dissipation also depends on the rate of change of the defor-
mation. Examples are fluids consisting long polymers such as starch water
mixture.


## Page 90

90 Chapter 4. Continuum Mechanics
• Ferrofluid A Newtonian fluid that carries an additional convected field of mag-
netization, adding magnetic terms to the potential energy and the dissipation
function. Examples are ferromagnetic liquids.
• Magnetohydrodynamic fluids Magnetohydrodynamic fluids are fluids with
free electrons,i.e. they are electrically conductive fluids. In particular, such
a continuum is a Newtonian fluid that carries trapped magnetic field due to
the electric conductivity of the fluid. This adds electromagnetic term to the
potential energy. Examples include liquid metals and ionized gas (plasmas).
Theadvantageofemployingexteriorcalculusinformulatingcontinuummechanical
equations are
• Strong type system for tensors: Instead of identifying tensors as matrices or
arrays of various sizes, a stronger type system is able to distinguish the type
of, for example, stress and strain, which have different geometric and physical
meanings, even though their matrix representations are the same size.
• More fundamental and simpler understanding of the relationship between
objects: The language sorts out that many objects in continuum mechanics
are related by the canonical pullback operator, which is an important insight
when we need to invoke, for example, the commutativity between pullback and
exterior derivative.
• Exterior calculus includes the Lie derivative, which is fundamental for doing
calculus on deformations. Without the vocabulary of Lie derivatives, differential
equations that describe conservation laws are broken into many obscure terms.
• Theorems such as symmetry of stress tensors, conservation of circulation in
inviscid fluid etc can be reasoned just by type checking.
In this chapter, we will only focus on hyperelasticity.
4.1 Deformation map
A universal postulate for a continuum mechanical system is that the state of the
system is a map representing the shape of a deformable body.
Postulate 4.1 — Continuum mechanical system. We have the following setups for
a continuum mechanical system.
• M: a manifold representingmaterial domain or Lagrangian coordinate.
• W: a manifold representingworld coordinate or Eulerian coordinate.
• The state of deformation is described by a (time-dependent) embedding
ϕ = ϕ(t): M → W. We call itdeformation map or flow map.
• M is equipped with a time-independentρM ∈ Ωn(M ) representing mass.


## Page 91

4.2 Elasticity overview 91
• W is equipped with a time-independent metric♭W.
The material domainM is typically Rn but sometimes just an index set of particles.
When M = R3 coordinate system is denoted by (X , Y , Z ) or interchangeably
(X 1, X 2, X 3). The world domain W is typically Rn. When W = R3 coordinate
system is denoted by(x , y, z) or interchangeably(x 1, x 2, x 3).
Using the above objects, we can define the kinetic energy of a moving ob-
ject.
Definition 4.1 — Kinetic energy. The kinetic energy of a deformation map is given
by
K(ϕ, ˙ϕ) :=
ˆ
M
1
2 | ˙ϕ|2
♭W ρM . (4.1)
In a conservative Newtonian mechanical system, we can derive the equations of
motion by the kinetic energyK(ϕ, ˙ϕ) and the potential energyU(ϕ) of the system,
both of which are functions of our state variableϕ (and its time derivative˙ϕ for the
kinetic energy). Explicitly, the equation of motion is given by
∇
dt
∂K
∂ ˙ϕ
= −d U . (4.2)
This equation is the critical point of theaction
S(ϕ) =
ˆ T
0

K(ϕ, ˙ϕ) − U(ϕ)

dt. (4.3)
over the space of pathsϕ: [0, T] → (M → W ) on the space(M → W ) of deforma-
tions with fixed initial and final positions.
To describe elasticity, we only need a minimal assumption on the form of the
potential energyU (Section 4.4). The remaining derivation for the equation of motion
is to evaluate the differentiald U with respect toϕ. This calculation will lead to the
emergence of the notion of stress with delicate tensor types (Section 4.5).
Before carrying out this calculation in Section 4.5, we first give an overview of the
classical exposition of elasticity in Section 4.2, followed by a preliminary on tensor
algebra in Section 4.3.
4.2 Elasticity overview
In this section, we give a quick overview of the classical exposition of elasticity. This
exposition is based on how the system was discovered and explained, instead of how it
could have been derived by calculatingd U. In this section, we will introduce several
many matrices in this section, some of which represent strain and others represent
stress of various kinds. Later in Section 4.5, we will re-introduce these tensors using
a principled argument, from which we discover a more delicate understanding of
these tensors.
When studying elasticity, we first introduce the concept of stress. Phenomeno-
logically, a solid body has internal force. In the early 19th century, Augustin-Louis


## Page 92

92 Chapter 4. Continuum Mechanics
Cauchy showed that the internal forceT acting on an infinitesimal internal surface,
known as thetraction force, is a linear function of the surface normal. So we can
write T = σn where n is the surface normal, andσ is the matrix representing this
linear function. This matrixσ is called theCauchy stress.
The net force acting on an infinitesimal volume is the given by the sum of
traction force on the volume’s boundary. Hence, the net force density is given
by the divergence fnet = ∇ · σ of the Cauchy stress. When the solid is in static
equilibrium, one can show thatσ must be a symmetric matrix. However, in fact,
σ is symmetric even under accelerated motion for a different reason (under the
assumption of hyperelasticity).
Hyperelasticity is the model for large deformation. When it comes to this large
deformation, one starts to introduce many more otheralternative stress measures.
Only writing a few major ones, we have theKirchhoff stress τ, thefirst Piola–Kirchhoff
stress P, the second Piola–Kirchhoff stress S, the nominal stress N = P⊺. Their
conversions are given by
Equation
for σ τ P S
σ = σ 1
J τ 1
J PF⊺ J −1FSF⊺
τ = J σ τ PF⊺ FSF⊺
P = J σF−⊺ τ F−⊺ P FS
S = J F−1σF−⊺ F−1τ F−⊺ F−1P S
where thedeformation gradient F = ∇ϕ is Jacobian matrix of the deformation map
ϕ, and J = det(F). A stress–strain relation is given by some functionS = S(C)
where C = F⊺F is called the Cauchy–Green tensor.
Where do all these stresses come from? Also, they are all represented by square
matrices of the same size, which are inherently coordinate dependent and there is no
information of what type they are (are they endomorphism or bilinear form, or some
other type?) What are their geometric intuition?
In fact, we do see something familiar in this conversion table. Recall Example 2.3
that the pullback of a 2-form in 3D involvesJ F−1. In particular, the relationship
between P and σ looks like a pullback for 2-forms. This conversion relation between
P and σ hints that, perhaps, both of them are 2-form. If we think about it, we realize
that of course! σ is a force-(co)vector valued 2-form. The Cauchy stress represents
the traction force of a given infinitesimal surface. Instead of representing the traction
force as σn using a normal vector, a more geometrically accurate description is
that the force is given byσJX , Y K on an infinitesimal parallelogram spanned by
vectors X , Y. In that case, the 1st Piola–Kirchhoff stressP is merely the change of
coordinate to the material coordinate
P = ϕ∗
2-form
σ. (4.4)
From this example, we see that the theory of elasticity would be much more natural
when written in exterior calculus.
What is more, all of the above stress tensors arise automatically and carry specific
differential form types when we try to derived U, essentially making exterior calculus
unavoidable. Following this first-principle derivation, we do not need any prerequisite


## Page 93

4.3 Tensor Algebra 93
phenomenological knowledge about the existence of internal traction force, Cauchy
stress, or any other alternative stresses. They are just the results of variational
calculus. Using representations other than exterior calculus remove some information
about the physical and geometric nature of these stress tensors.
4.3 Tensor Algebra
What are tensors? In geometry, vectors, covectors, endomorphisms, bilinear forms,
differential forms, etc., are all special cases of tensors. When these objects are
written in basis or coordinate, they become arrays of numbers. For example, vectors,
covectors and(n − 1)-forms are represented asRn under basis; endomorphisms and
bilinear forms are both represented as square matricesRn×n.
For convenience, many introductions of tensors classify tensors by their array
size. Tensors that are represented by 1D arrayRn of numbers are called order-1
tensors; tensors that are represented by a matrixRn×n of numbers are called order-2
tensors. More generally, order-k tensors are arrays whose entries can be querried
by k indices. However, just as the distinctions between vectors and covectors are
important, describing tensors by their array size does not give enough information of
their geometric meaning.
Here we define tensors with the starting point of vector spaces and vector bundles
as building blocks. The construction of tensors retain the information of the type of
these vector spaces (bundle).
4.3.1 Tensor product
The notion oftensor product allows us to combine two vector spaces and produce a
new vector space.
Definition 4.2 — Tensor product space. Let U , V be two vector spaces. Consider
a new vector space, denoted byU ⊗ V, and a non-degenerate bilinear function
called tensor product
(·) ⊗ (·): U × V
bilinear
− − − − →U ⊗ V . (4.5)
By the bilinearity we have rules such as
(c⃗u) ⊗ ⃗v = ⃗u ⊗ (c⃗v) = c(⃗u ⊗ ⃗v) for all ⃗u ∈ U , ⃗v ∈ V and c ∈ R. (4.6)
and by the non-degeneracy⃗u1 ⊗ ⃗v and ⃗u2 ⊗ ⃗v are linearly independent inU ⊗ V
whenever ⃗u1, ⃗u2 are linearly independent inU.
Concretely, let(⃗ei ∈ U )i∈I be a basis forU and let (⃗fj ∈ V )j ∈J be a basis forV.
Then the vector spaceU ⊗ V is the linear combination of⃗hij := ⃗ei ⊗⃗fj as basis vectors
with indices running over alli ∈ I , j ∈ J. The tensor product of⃗u =P
i∈I u i⃗ei ∈ U
and ⃗v =P
j ∈J v j⃗fj ∈ V is given by
⃗u ⊗ ⃗v :=
X
i∈I
X
j ∈J
u i v j ⃗hij . (4.7)


## Page 94

94 Chapter 4. Continuum Mechanics
In particular,
dim(U ⊗ V ) = dim(U ) dim(V ), (4.8)
in contrast todim(U × V ) = dim(U ) + dim(V ).
A general elementA ∈ U ⊗ V takes the form
A =
X
i∈I
X
j ∈J
Aij ⃗hij . (4.9)
Here A = (Aij )i∈I ,j ∈J is the matrix representation of the tensorA.
Definition 4.3 — Decomposable tensor. An element A in U ⊗ V is said to be
decomposable if there exist⃗u ∈ U and ⃗v ∈ V so that A = ⃗u ⊗ ⃗v. In a basis
representation, decomposability meansAij = u i v j, i.e. the matrix A = (Aij )ij can
be expressed as an outer productA = uv⊺.
A generic element inU ⊗ V is not decomposable, unless eitherU or V is a one-
dimensional vector space.
■ Example 4.1 The space of endomorphismsEnd(U ) := {A: U
linear
− − − →U } on a
vector spaceU is the tensor product spaceEnd(U ) = U ∗ ⊗ U. An endomorphism
is a vector-valued covector, as it takes in a vector and spits out a vector. ■
■ Example 4.2 The space of bilinear forms{B : U
linear
− − − →U ∗} = {B : U ×U
bilinear
− − − − →
R} on a vector spaceU is the tensor product spaceU ∗ ⊗ U ∗. ■
Definition 4.4 — Tensor product bundle. Let E1, E2 be two vector bundles defined
over a common manifoldM. Then E1 ⊗ E2 is a new vector bundle overM where
each fiber(E1 ⊗ E2)p is defined by the tensor product space(E1)p ⊗ (E2)p for each
p ∈ M.
4.3.2 Tensor power
A special case of constructing tensor product spaces is taking tensor product between
the same vector space. LetU be a vector space. Then we may takeU ⊗ U =: ⊗2U
and continue tensoring more copies of the same space⊗3U := U ⊗ U ⊗ U and so on.
Definition 4.5 — Tensor power space. We recursively define⊗k U by ⊗0U :=
R, ⊗1U = U, and a non-degenerate bilinear function
⊗: ⊗k U × ⊗ℓU
bilinear
− − − − → ⊗k+ℓU (4.10)
such that it is associative
(A ⊗ B) ⊗ C = A ⊗ (B ⊗ C ) for all A ∈ ⊗ k U , B ∈ ⊗ ℓU , C ∈ ⊗ mU. (4.11)


## Page 95

4.3 Tensor Algebra 95
■ Example 4.3 Space of bilinear forms onU is the tensor space⊗2U ∗. ■
Under a basis forU and its dual basis forU ∗, bilinear forms onU is represented
by a square matrix with sizen-by-n where n = dim(U ). Just as the consideration
of symmetric matrices and skew-symmetric matrices are important when studying
bilinear forms, we should also discuss the symmetric and skew-symmetric tensor
powers.
Using a similar formal definition we define the following special spaces of tensor
power spaces.
Definition 4.6 — Symmetric tensor power space. We recursively define⊙k U by
⊙0U := R, ⊙1U = U, and a non-degenerate bilinear function
⊙: ⊙k U × ⊙ℓU
bilinear
− − − − → ⊙k+ℓU (4.12)
satisfying
• associativity:
(A ⊙ B) ⊙ C = A ⊙ (B ⊙ C ) for all A ∈ ⊙ k U , B ∈ ⊙ ℓU , C ∈ ⊙ mU.
(4.13)
• symmetry:
⃗u ⊙ ⃗v = ⃗v ⊙ ⃗u for all ⃗u, ⃗v ∈ U . (4.14)
The space ⊙k U is included in ⊗k U by the inclusion map for decomposable
symmetric tensors:
⊙k U ,→ ⊗ k U
⃗u1 ⊙ · · · ⊙ ⃗uk 7→
X
σ∈Sk
⃗uσ(1) ⊗ · · · ⊗ ⃗uσ(k) (4.15)
where Sk is the permutation group on{1, . . . ,k }.
Definition 4.7 — Skew-symmetric tensor power space (Exterior algebra revisited).
We recursively define∧k U by ∧0U := R, ∧1U = U, and a non-degenerate bilinear
function
∧: ∧k U × ∧ℓU
bilinear
− − − − → ∧k+ℓU (4.16)
satisfying
• associativity:
(A ∧ B) ∧ C = A ∧ (B ∧ C ) for all A ∈ ∧ k U , B ∈ ∧ ℓU , C ∈ ∧ mU.
(4.17)


## Page 96

96 Chapter 4. Continuum Mechanics
• skew-symmetry:
⃗u ∧ ⃗u = 0 for all ⃗u ∈ U . (4.18)
The space ∧k U is included in ⊗k U by the inclusion map for decomposable
symmetric tensors:
∧k U ,→ ⊗ k U
⃗u1 ∧ · · · ∧ ⃗uk 7→
X
σ∈Sk
(−1)|σ|⃗uσ(1) ⊗ · · · ⊗ ⃗uσ(k) (4.19)
where Sk is the permutation group on{1, . . . ,k }, and (−1)|σ| is +1 (resp. −1)
when σ is an even (resp. odd) permutation.
4.3.3 Pullback bundle
Suppose we have a deformation mapϕ: M → W. What is the type of its temporal
derivative ˙ϕ = ∂
∂t ϕ and its spatial derivatived ϕ? The object ˙ϕ is to be evaluated at
a point inM, but its value is a vector inTW. The object d ϕ can take a vector at a
point in M, but spits out a vector inTW. The subtlety here is thatTW is not a
bundle over M.
To characterize the type of objects such as˙ϕ and d ϕ, we need the concept of
pullback bundle.
Definition 4.8 — Pullback bundle. Let E be a vector bundle overW and let
ϕ: M → W be a map. Then there induces a vector bundleEϕ over M where each
fiber (Eϕ)p, p ∈ M, is defined by
(Eϕ)p := Eϕ(p). (4.20)
For exampleTϕW becomes a bundle overM; the fibers are(TϕW )x = Tϕ(x)W.
Using pullback bundle, we can characterize the tensor types of derivatives ofϕ:
˙ϕ ∈ Γ(TϕW ), d ϕ ∈ Γ(T ∗M ⊗ TϕW ). (4.21)
4.3.4 Type algebra
We will be using the following isomorphisms between tensor spaces.
Recall that the space of linear homomorphisms between two vector spacesU , V
is denoted by
Hom(U ; V ) := {A: U
linear
− − − →V }. (4.22)
Theorem 4.1 Hom(U ; V ) ∼= U ∗ ⊗ V.


## Page 97

4.3 Tensor Algebra 97
Theorem 4.2 (U ⊗ V )∗ ∼= U ∗ ⊗ V ∗. The dual pairing betweenU ∗ ⊗ V ∗ and U ⊗ V
is given by
⟨α ⊗ β|⃗u ⊗ ⃗v ⟩ := ⟨α|⃗u⟩⟨β|⃗v ⟩ (4.23)
for α ∈ U ∗, β ∈ V ∗, ⃗u ∈ U, and ⃗v ∈ V.
Combining Theorem 4.1 and Theorem 4.2 gives:
Theorem 4.3 Hom(U ; V )∗ ∼= Hom(U ∗; V ∗). The dual pairing between a linear
operator B ∈ Hom(U ∗; V ∗) and A ∈ Hom(U ; V ) is given by
⟨B |A⟩ = tr(A∗B) = tr(B ∗A) = tr(AB ∗) = tr(BA∗). (4.24)
Theorem 4.4 Let E be a vector bundle overM. Then Γ(E)∗ ∼= Γ(E ∗ ⊗ ∧nT ∗M ).
The dual pairing between a fieldS ∈ Γ(E ∗ ⊗ ∧nT ∗M ) and a fieldX ∈ Γ(E) is
given by
⟪S |X ⟫ :=
ˆ
M
⟨S |X ⟩. (4.25)
Note that in(4.25) the pairing⟨S |X ⟩ is a pointwise dual pairing between fibers ofE ∗
and fibers ofE, leaving ⟨S |X ⟩ ∈ Γ(∧nT ∗M ) = Ωn(M ) that can still be integrated
over M. That is why the dual space of the space scalar functions are measures:
(Ω0(M ))∗ ∼= Ωn(M ). (4.26)
The dual space of the space of vector fields is the space of covector-valued measures.
Γ(TM )∗ ∼= Γ(T ∗M ⊗ ∧nT ∗M ). (4.27)
Theorem 4.5 Let U be an n-dimensional vector space. Then
U ⊗ ∧nU ∗ ∼= ∧n−1U ∗. (4.28)
The isomorphism is given by
⃗u ⊗ µ 7→ i⃗uµ ⃗ u ∈ U , µ ∈ ∧ nU ∗. (4.29)
Proof. One can check that(4.36) is non-degenerate, and thatU ⊗ ∧nU ∗ and ∧n−1U ∗
share the same dimension (note thatdim(∧nU ∗) = 1). One can also construct an
explicit inverse map for(4.36). For eachω ∈ ∧ n−1U ∗, pick aµ ∈ ∧ nU ∗ and our goal
is to reconstruct⃗u ∈ U so that i⃗uµ = ω. (Note that a different choice ofµ will only
lead to rescaled⃗u, and still resulting in the samei⃗uµ and ⃗u ⊗ µ using (4.6).) The
reconstruction goes as picking an arbitrary basis⃗e1, . . . , ⃗en for U and
⃗u =
nX
k=1
u k⃗ek , u k = (−1)k ωJ⃗e1, . . . ,b⃗ek , . . . , ⃗enK
µJ⃗e1, . . . , ⃗enK (4.30)
wherec(·) means skipping over the term.


## Page 98

98 Chapter 4. Continuum Mechanics
■ Example 4.4 — Cramer’s rule. Let A: U
linear
− − − →U be a linear map. Given⃗b ∈ U,
find ⃗x ∈ U such that A⃗x = ⃗b.
Pick an arbitrary basis⃗e1, . . . , ⃗en for U and an arbitrary volume formµ ∈ ∧ nU ∗.
Note that det(A) = ( A∗
n-form
µ)/µ, which is independent of the choice ofµ. We may
assume µJ⃗e1, . . . , ⃗enK = 1. Now, A: U
linear
− − − →U induces a pullback on(n −1)-forms:
A∗
(n − 1)-form
: ∧n−1 U ∗ linear
− − − → ∧n−1U ∗. (4.31)
Note that
A∗
(n − 1)-form
(i⃗bµ) = iA−1⃗b A∗
n-form
µ = det(A)i⃗x µ. (4.32)
Hence, using (4.30) we can reconstruct⃗x asPn
i=1 x k⃗ek with
x k = 1
det(A)(−1)k(A∗i⃗bµ)J⃗e1, . . . ,b⃗ek , . . . , ⃗enK (4.33)
= 1
det(A) µJ⃗a1, . . . , ⃗b|{z}
k-th
slot
, . . . , ⃗anK (4.34)
where ⃗ai = A⃗ei. ■
The following is a more general version of Theorem 4.5.
Theorem 4.6 Let U be an n-dimensional vector space. Then
(⊗k U ) ⊗ ∧nU ∗ ∼= ∧n−k U ∗. (4.35)
The isomorphism is given by
(⃗u1 ⊗ · · · ⊗ ⃗uk) ⊗ µ 7→ i⃗uk · · · i⃗u1µ, ⃗ u1, . . . , ⃗uk ∈ U , µ ∈ ∧ nU ∗. (4.36)
Using Theorem 4.6 and 4.4 we can reason the dual space of the space ofk-form
fields:
Ωk(M )∗ = Γ(∧k T ∗M )∗ ∼= Γ(∧k TM ⊗ ∧nT ∗M ) ∼= Γ(∧n−k T ∗M ) = Ωn−k(M ).
(4.37)
Theorem 4.7 Ωk(M )∗ ∼= Ωn−k(M ). The dual pairing betweenα ∈ Ωn−k(M ) and
β ∈ Ωk(M ) is given by
⟪α|β⟫ =
ˆ
M
α ∧ β. (4.38)
See also Theorem 2.44.


## Page 99

4.4 Postulates of Elasticity 99
4.4 Postulates of Elasticity
In addition to the general postulate Postulate 4.1 for continuum mechanics laid out in
Section4.1, (hyper)elasticityhasthefollowingadditionalassumption.
Postulate 4.2 — Hyperelasticity. A hyperelasticity system is a conservative con-
tinuum mechanical system with the potential energyU(ϕ) taking the form of
U(ϕ) =
´
M Ψ( ϕ∗
⊙2T ∗W
♭W ), where ϕ∗
⊙2T ∗W
♭W is the induced metric (a.k.a. pullback
metric) from ♭W by the deformation mapϕ, and Ψ: ⊙2 (T ∗M )
(nonlinear)
− − − − − − → ∧nT ∗M
is a base-point preserving map. This functionΨ is called thestrain energy density
function.
The equation of motion for a hyperelastic system is given by(4.2) (following
the least action principle)
ρM
∇
¨ϕ = − ∂U
∂ϕ + fext (4.39)
with possibly an external forcefext ∈ Γ(∧nT ∗M ⊗ ∧nT ∗
ϕ W ).
The induced metric is the measurement of world-space distances and angles, as a
tensor defined onM. The elastic potential energy is the integral of some pointwise
evaluation of local energyΨ, and this local energy is only a function of the local
induced metric.
We will derive −∂U
∂ϕ in Section 4.5. We spend the remainder of this section to
explain objects such as the pullback metric and the deformation gradient.
4.4.1 Deformation gradient
Let ϕ: M → W be a deformation map. We define thedeformation gradient as the
world-vector-valued 1-form onM:
Definition 4.9 — Deformation gradient.
F := d ϕ ∈ Γ(T ∗M ⊗ TϕW ) ∼= Γ(Hom(TM ; TϕW )). (4.40)
The deformation is the pushforward operator given from the flow mapϕ. Each
displacement as a vector in the material is mapped to a displacement as a tangent
vector in the world.
■ Example 4.5 Under a Cartesian coordinate inR3, if we write


x
y
z

 = ϕ(X , Y , Z ) =


ϕ1(X , Y , Z )
ϕ2(X , Y , Z )
ϕ3(X , Y , Z )

 (4.41)


## Page 100

100 Chapter 4. Continuum Mechanics
then the deformation gradient has a matrix representation given by
F = d ϕ =


∂ϕ1
∂X
∂ϕ1
∂Y
∂ϕ1
∂Z
∂ϕ2
∂X
∂ϕ2
∂Y
∂ϕ2
∂Z
∂ϕ3
∂X
∂ϕ3
∂Y
∂ϕ3
∂Z

 (4.42)
■
4.4.2 Pullback metric
Recall that
♭W ∈ Γ(⊙2T ∗W ) ∼= Γ(Homsym(TW ; T ∗W )) (4.43)
denote the metric on the world spaceW. Now, with the deformation gradientF
and its adjoint, we find a diagram
TM F // TW
♭W

T ∗M T ∗WF ∗
oo
(4.44)
By composing these arrows, we obtain a symmetric bilinear form that can serve as a
metric on M.
Definition 4.10 — Pullback metric. Define
ϕ∗
⊙2T ∗W
: ⊙2 T ∗W → ⊙2T ∗M , ϕ ∗
⊙2T ∗W
♭W := F ∗♭W F (4.45)
where F = d ϕ ∈ Γ(Hom(TM ; TϕW )) and ♭W ∈ Γ(Homsym(TW ; T ∗W )) are
treated as linear maps like in(4.44). When viewing ϕ∗♭W as a bilinear form that
takes in two vectors, this definition is equivalent to
⟨⃗a, ⃗b⟩ϕ∗♭W =
D
d ϕJ⃗aK, d ϕJ⃗bK
E
♭W
, ⃗ a, ⃗b ∈ TpM . (4.46)
We call
C := F ∗♭W F ∈ Γ(⊙2T ∗M ) (4.47)
the (right) Cauchy–Green tensor.
TM F //
C
oo
TW
♭W

T ∗M T ∗WF ∗
oo
(4.48)
The physical meaning of the pullback metric is best understood by(4.46). The
pullback metric gives the following inner product structure: The inner product
between two vectors⃗a, ⃗b in the material is evaluated by taking their world-space


## Page 101

4.4 Postulates of Elasticity 101
inner product; the deformation gradientF = d ϕ first realizes these material vectors
as world vectors before taking the world-space inner product.
Note that the inner product structure encodes the notion of lengths and angles.
In particular, it encodes how much the material is stretched and sheared (after
comparing it with a fixed reference material metric).
Definition 4.11 — Cauchy–Green constructor. Define
C : Γ(T ∗M ⊗ TϕW ) → Γ(⊙2T ∗M ) (4.49)
C(F) := F ∗♭W F . (4.50)
■ Example 4.6 Continuing Example 4.5 in the Cartesian 3D space, where the
metric tensor for♭W is represented by the identity matrix, the right Cauchy–Green
tensor is given by
C = F⊺F. (4.51)
■
4.4.3 Strain energy density function
One postulates that the elastic potential energy is only a function of the pullback
metric C, which encodes all information of the local world-space measurements of
distance and angle. This local potential energy is the strain energy density function
of C. The strain energy density function is a base-point preserving map between
vector bundles:
Ψ: ⊙2 T ∗M
(nonlinear)
− − − − − − → ∧nT ∗M . (4.52)
It is the core material property. The valueΨ(C ) describes how much energy is stored
(as an n-form) for a given pullback metricC. The functionΨp : ⊙2 T ∗
p M → ∧ nT ∗
p M
can depend onp ∈ M for an inhomogeneous material.
Definition 4.12 — Derivative of Ψ. For each pointp ∈ M, the differentiald(Ψp) of
the functionΨp : ⊙2T ∗
p M → ∧ nT ∗
p M over the domain⊙2T ∗
p M is a∧nT ∗
p M-valued
covector of ⊙2T ∗
p M; that is,
d(Ψp) ∈ (⊙2T ∗
p M )∗ ⊗ ∧nT ∗
p M ∼= (⊙2TpM ) ⊗ ∧nT ∗
p M . (4.53)
We denote this differential as
∂Ψ
∂C ∈ Γ

(⊙2TM ) ⊗ ∧nT ∗M

, ∂Ψ
∂C

p
:= d(Ψp). (4.54)
The base-point-preserving function (as a function ofC)
∂Ψ
∂C : Γ(⊙2T ∗M ) → Γ

(⊙2TM ) ⊗ ∧nT ∗M

(4.55)


## Page 102

102 Chapter 4. Continuum Mechanics
is called astress–strain relation.
For a general hyperelastic model, we do not need to make any further assumption.
For whicheverΨ that is modeled, there is a derived∂Ψ
∂C. We will only need to know
∂Ψ
∂C ∈ Γ(⊙2TM ⊗ ∧nT ∗M ) to derive d U (Section 4.5).
More discussion about special models and physical designs forΨ will be given in
Section 4.7.
4.5 Derivation of Elasticity
Our goal is to derive∂
∂ϕ U(ϕ) for (4.39) for hyperelastic systems (Postulate 4.2). The
“computation tree” for evaluatingU(ϕ) =
´
M Ψ(C ) is given by
C ∞(M ; W ) d // Γ(T ∗M ⊗ TϕW )
Def. 4.11
C // Γ(⊙2T ∗M )
Sec. 4.4.3
Ψ // Γ(∧nT ∗M )
´
M // R
ϕ F = d ϕ C = C(F) Ψ( C ) U(ϕ)
(4.56)
To compute the variation∂U
∂ϕ we apply the method of back propagation. The tangent
spaces of (4.56) and the differentials are
Γ(TϕW ) d ∇
// Γ(T ∗M ⊗ TϕW )
dC|F // Γ(⊙2T ∗M )
dΨ|C // Γ(∧nT ∗M )
´
M // R. (4.57)
Here, the variation of the first mapd requires the Levi-Civita connection∇W for
♭W on W:
∂
∂ϵ

ϵ=0 ϕϵ = ˚ϕ ∈ Γ(TϕW ) = ⇒ ∂
∂ϵ

ϵ=0 ( d
0-form
ϕϵ) = d ∇
TW-valued
0-form
˚ϕ. (4.58)
Using the duality theorems in Section 4.3.4, we find the dual spaces of the sequence
of vector spaces in (4.57) and connect them by the adjoint maps:
Γ(TϕW ) d ∇
// Γ(T ∗M ⊗ TϕW )
dC|F // Γ(⊙2T ∗M )
dΨ|C // Γ(∧nT ∗M )
´
M // R
Γ( ∧n T ∗M
⊗ T ∗
ϕ W )
Γ( ∧n−1 T ∗M
⊗ T ∗
ϕ W )
(d ∇)∗
oo Γ( ⊙2 TM
⊗ ∧nT ∗M )
(dCF )∗
oo Ω0(M )
(dΨC )∗
oo R∗(
´
M )∗
oo
(4.59)
Take 1 ∈ R∗ as the seed and back-propagate it using these adjoint maps. The
intermediate variables during the back-propagation are known as thestress tensors
of various kinds.
The adjoint of integration distributes1 into the constant function
1 = (
´
M )∗(1) ∈ Ω0(M ). (4.60)


## Page 103

4.5 Derivation of Elasticity 103
The next adjoint map(dΨ)∗ yields
∂Ψ
∂C = (dΨ|C )∗(1) ∈ Γ(⊙2TM ⊗ ∧nT ∗M ), (4.61)
which we assume can be looked up (Section 4.4.3) while further discussions about its
evaluation can be found in Section 4.7.
Definition 4.13 — 2nd Piola–Kirchhoff stress tensor. The 2nd Piola–Kirchhoff stress
tensor (PK2) S ∈ Γ(⊙2TM ⊗ ∧nT ∗M ) is defined by
S
2 := ∂Ψ
∂C = (dΨ|C )∗(1). (4.62)
The next adjoint map(d C)∗ gives us:
Definition 4.14 — 1st Piola–Kirchhoff stress tensor.
P := (d C|F)∗ ∂Ψ
∂C = (d C|F)∗(dΨ|C )∗(1) ∈ Γ(∧n−1T ∗M ⊗ T ∗
ϕ W ). (4.63)
called the 1st Piola–Kirchhoff stress tensor (PK1).
Finally,
∂U
∂ϕ = (d ∇)∗P = (d ∇)∗(d C|F)∗(dΨ|C )∗(1) ∈ Γ(∧nT ∗M ⊗ T ∗
ϕ W ). (4.64)
To complete the calculation, we derive explicit formulas for the adjoints(d ∇)∗ and
(d C|F)∗.
Theorem 4.8 Represent the domainΓ(⊙2TM ⊗ ∧nT ∗M ) and the target space
Γ(∧n−1T ∗M ⊗ T ∗
ϕ W ) of (d C|F)∗ as spaces of linear mapsΓ(Homsym(T ∗M ; TM ) ⊗
∧nT ∗M ) and Γ(Hom(T ∗M ; T ∗
ϕ W ) ⊗ ∧nT ∗M ) respectively using Theorem 4.1 and
Theorem 4.5. Then the linear map
d C|∗
F : Γ(Homsym(T ∗M ; TM ) ⊗ ∧nT ∗M )
linear
− − − →Γ(Hom(T ∗M ; T ∗
ϕ W ) ⊗ ∧nT ∗M )
(4.65)
is explicitly given by
d C|∗
F JH K = 2♭W FH , H ∈ Γ(Homsym(T ∗M ; TM ) ⊗ ∧nT ∗M ), (4.66)
intermsoflinearmaps F ∈ Γ(Hom(TM ; TϕW ))and ♭W ∈ Γ(Homsym(TϕW ; T ∗
ϕ W )).
Proof. Differentiating (4.50) (C(F) = F ∗♭W F) with respect toF, we obtain
d CF J˚F K = ˚F ∗♭W F + F ∗♭W ˚F , ˚F ∈ Γ(Hom(TM ; TϕW )). (4.67)
Since this is a pointwise linear operation, we may focus on its pointwise adjoint as in


## Page 104

104 Chapter 4. Continuum Mechanics
the following diagram (withΓ(· · ·) and ⊗ ∧n T ∗M dropped):
˚F
Hom(TM ; TϕW )
dC|F //
˚F ∗♭W F+F ∗♭W ˚F
Homsym(TM ; T ∗M )
Hom(T ∗M ; T ∗
ϕ W ) Hom sym(T ∗M ; TM )
H
dC|∗
Foo dC|∗
Foo dC|∗
Foo
(4.68)
Using the dual pairing between linear maps (Theorem 4.3) the adjointd C∗
F must
satisfy
tr

(d C|∗
F JH K)∗˚F

def’n of
adjoint
and (4.67)
= tr( H ∗(˚F ∗♭W F + F ∗♭W ˚F)) (4.69)
= tr(H ∗˚F ∗♭W F) + tr(H ∗F ∗♭W ˚F) (4.70)
= 2 tr(H ∗F ∗♭W ˚F) (4.71)
where the last step uses invariance of trace under cyclic permutations (tr(ABCD) =
tr(BCDA))andadjoints tr(A) = tr(A∗), andthat H ∗ = Hfor H ∈ Homsym(TM ∗; TM ).
Therefore, d C|∗
F JH K = 2♭W FH.
Theorem 4.9 The adjoint of d ∇
TW-valued
0-form
is −d ∇
T ∗W-valued
(n − 1)-form
up to a boundary integral.
Γ(TϕW )
d ∇
0-form // Γ(T ∗M ⊗ TϕW )
Γ(∧nT ∗M ⊗ T ∗
ϕ W ) Γ( ∧n−1T ∗M ⊗ T ∗
ϕ W )
(d ∇)∗
= −d ∇
(n − 1)-form
oo
(4.72)
Proof. For each˚ϕ ∈ Γ(TϕW ) and P ∈ Γ(∧n−1T ∗M ⊗ T ∗
ϕ W ), we have
ˆ
M
d
(n − 1)-form
⟨˚ϕ|P ⟩
| {z }
=
¸
∂M ⟨˚ϕ|P ⟩
=
ˆ
M
⟨ d ∇
TW-valued
0-form
˚ϕ ∧ P ⟩
| {z }
⟪d ∇˚ϕ|P ⟫
+
ˆ
M
⟨˚ϕ| d ∇
T ∗W-valued
(n − 1)-form
P ⟩
| {z }
⟪˚ϕ|d ∇P ⟫
. (4.73)
Therefore, up to a boundary term, the adjoint of d ∇
TW-valued
0-form
is −d ∇
T ∗W-valued
(n − 1)-form
.
4.5.1 Summary of the derivation
The derivation for the differential of the potential energyU(ϕ) follows the same logic
as a reversed mode automatic differentiation. We first perform a forward evaluation,
involving several intermediate spaces. Then we perform a back-propagation along
their dual spaces. The intermediate variables are the Piola–Kirchhoff stress tensors.


## Page 105

4.6 Cauchy stress tensor 105
The following diagram shows the forward nonlinear evaluations (upper row) and the
linear back-propagation (lower row).
ϕ
flow
map
F = d ϕ
deformation
gradient
C = F ∗♭W F
Cauchy–Green
tensor
Ψ(C )
energy
density
U(ϕ)
total
energy
C ∞(M ; W ) d // Γ(T ∗M ⊗ TϕW ) C // Γ(⊙2T ∗M ) Ψ // Γ(∧nT ∗M )
´
M // R
Γ( ∧n T ∗M
⊗ T ∗
ϕ W )
Γ( ∧n−1 T ∗M
⊗ T ∗
ϕ W )
(d ∇)∗
oo Γ( ⊙2 TM
⊗ ∧nT ∗M )
(dCF )∗
oo Ω0(M )
(dΨC )∗
oo R∗(
´
M )∗
oo
−d ∇
(n − 1)-form
P
(minus)
force
P = ♭W FS
1st Piola–
Kirchhoff stress
S
2 = ∂Ψ
∂C
2nd Piola–
Kirchhoff stress
1
constant
“one” function
1
seed
(4.74)
The equation of motion for the flow map is given by substituting the result of the
derivative computation into (4.39)
ρM
∇
¨ϕ = d ∇
(n − 1)-form
P + fext. (4.75)
■ Example 4.7 — Summary in 3D. We can translate the tensors in(4.74) into
matrices under the 3D Cartesian coordinate, continuing Example 4.5 (F = ∇ϕ)
and Example 4.6 (C = F⊺F).
The 1st (P) and 2nd (S) Piola–Kirchhoff stress tensors are 3-by-3 matrices
given by
S = 2 ∂Ψ
∂C

Sij = 2 ∂Ψ(C)
∂Cij

, P = FS. (4.76)
The elastic force is given by taking the divergence of the 1st Piola–Kirchhoff stress
tensor on the 2nd index:
fM = − ∂U
∂ϕ = ∇ · P

fi =
X
j
∂
∂X j Pij
!
. (4.77)
Here fM is interpreted as force density per material volume. ■
4.6 Cauchy stress tensor
The 1st Piola–Kirchhoff stress tensorP ∈ Γ(∧n−1T ∗M ⊗ T ∗
ϕ W ) is a world-covector-
valued (n − 1)-form. It is to be evaluated on a codimension-1 infinitesimal plane,
and it returns the force as a covector in the world space.
The 1st Piola–Kirchhoff stress tensor assigns a world force covector on
each codimension-1 plane in the material.


## Page 106

106 Chapter 4. Continuum Mechanics
By a change of coordinate of the same object, we have theCauchy stress tensor.
The Cauchy stress tensor assigns a world force covector on each codimension-
1 plane in the world.
Definition 4.15 — Cauchy stress tensor. Given a 1st Piola–Kirchhoff stress tensor
P ∈ Γ(∧n−1T ∗M ⊗ T ∗
ϕ W ), the Cauchy stress tensor is a covector-valued(n − 1)-
form
σ ∈ Γ(∧n−1T ∗W ⊗ T ∗W ) (4.78)
(on the image ofϕ) defined such that
P = ϕ∗
(n − 1)-form
σ. (4.79)
■ Example 4.8 In a 3D Cartesian space, the relationship between the Cauchy
stress tensor σ and the 1st Piola–Kirchhoff stress tensorP is given by
P = J σF−⊺, J = det(F). (4.80)
This is a direct application that in 3D
ϕ∗(w)2-form = (J F−1w)2-form ◦ ϕ. (4.81)
The multiplication byF−1 in (4.80) is from the right with a transpose because it
is the 2nd index ofP and σ that corresponds to being a 2-form. ■
Theorem 4.10 Let f ∈ Γ(∧nT ∗M ⊗ T ∗W ) be the force covector measure defined
on the world so that the total elastic forced ∇σ:
d ∇
(n − 1)-form
P = ϕ∗
n-form
f . (4.82)
Then
d ∇
(n − 1)-form
σ = f . (4.83)
Proof. Exterior derivative and pullback commutes:
ϕ∗
n-form
d ∇
(n − 1)-form
σ = d ∇
(n − 1)-form
ϕ∗
(n − 1)-form
σ = d ∇
(n − 1)-form
P = ϕ∗
n-form
f . (4.84)
■ Example 4.9 In the 3D Cartesian setup, iffW represents the force density per
world-space volume andfM represents the force density per material-space volume.


## Page 107

4.7 More on the strain energy density function 107
Then
fM = J fW ◦ ϕ, ∇ · σ = fW , ∇ · P = fM . (4.85)
■
Next, we show that the Cauchy stress tensor is symmetric. In contrast to physical
arguments about angular momentum conservation (many versions of which apply
only to W being Euclidean or under the assumption of equilibrium), we show the
symmetry by type checking.
First, consider a version of the Cauchy stress so that its force-covector is converted
into a vector using the inner product structure of the world:
˜σ := ♯W σ ∈ Γ(∧n−1T ∗W ⊗ TW ) (4.86)
∼= Γ(TW ⊗ TW ⊗ ∧nT ∗W ). (4.87)
Note that in the 3D Cartesian representation ˜σ and σ share the same matrix
representation. Now, in the type of(4.87) it is sensible to ask whether˜σ belong to
the symmetric sub-type
˜σ
?
∈ Γ(TW ⊙ TW ⊗ ∧nT ∗W ). (4.88)
Theorem 4.11 Under Postulate 4.2, we must have
˜σ ∈ Γ(TW ⊙ TW ⊗ ∧nT ∗W ). (4.89)
Proof. Regarding ˜σ as a homomorphism-valued measure
˜σ ∈ Γ(Hom(T ∗W ; TW ) ⊗ ∧nT ∗W ) (4.90)
we have
ϕ∗
n-form
˜σ = ( ϕ∗
(n − 1)-form
˜σ)F ∗ = ♯W ( ϕ∗
(n − 1)-form
σ)F ∗ (4.91)
= ♯W PF ∗ = ♯W ♭W FSF ∗ = FSF ∗ (4.92)
which is self-adjoint asS is self-adjoint. The pullback ϕ∗
n-form
on the n-form part does
not change the symmetry type of its homomorphism values.
4.7 More on the strain energy density function
In Section 4.4.3 we described that the strain energy density function is a pointwise
(base-point preserving) map from a Cauchy–Green tensor to an energy density
Ψ: ⊙2 T ∗M
(nonlinear)
− − − − − − → ∧nT ∗M . (4.93)
How do we modelΨ? We need more context of geometry and physics.


## Page 108

108 Chapter 4. Continuum Mechanics
Postulate 4.3 — Existence of rest metric. There is a time-independentmaterial
metric ♭M ∈ Γ(⊙2T ∗M ). Having ♭M, one can compare the pullback metric
C = F ∗♭W F with ♭M by their quotient
ˆC := ♯M C = ♭−1
M C ∈ Γ(Hom(TM ; TM )) (4.94)
which is an endomorphism onTM (and by contrastC is a bilinear form):
TM F //
C
oo
TW
♭W

T ∗M T ∗WF ∗
oo
TM F //
♭M

ˆC
OO TW
♭W

T ∗M T ∗WF ∗
oo
(4.95)
The energy Ψ(C ) can be written as a scalar-valued function ofˆC
Ψ(C ) = ˆΨ( ˆC )ρM , ˆΨ: End( TM ) → R, (4.96)
and ˆΨ attains its minimum atˆC = idTM. The value of ˆΨ is called theinternal
energy or Helmholtz’s free energy.
The endomorphism ˆC indicates how much itself deviates from the identity, as a
measurement of relative stretching. When the internal energy is only a function of
ˆC and not on other “latent variables” such as entropy or temperature, then internal
energy is equivalent to Helmholtz’s free energy.
R In thermoelasticity, ˆΨ can depend on entropy (isentropic material) or on
temperature (isothermal material). In the former case,ˆΨ is the internal energy,
and in the latter caseˆΨ is Helmholtz’s free energy.
In elastoplasticity, ♭M becomes variable as well. A changed rest metric♭M
models a permanent plastic deformation.
4.7.1 Strains
A strain is an expression ofˆC that measures its deviation from identity.
• Green–St. Venant strainEStV := 1
2( ˆC − I ).
• Biot strain EBiot :=
p
ˆC − I.
• Hencky strain EHencky = ˆH := 1
2 ln ˆC.
• Almansi strain EAlmansi := 1
2(I − ˆC −1).
All these strains agree with each other to first order whenˆC ≈ I.
In many scenario for large deformations, it is natural to consider Hencky’s
logarithmic strain as our main measurement for the deviation from identity. By a


## Page 109

4.7 More on the strain energy density function 109
mere change of variable, one may also model the internal energy as a function of the
Hencky strain:
Ψ(C ) = ˆΨ( ˆC )ρM = ˆΨlog( ˆH )ρM , 0 ∈ argmin
ˆH ∈End(TM )
ˆΨlog( ˆH ) (4.97)
■ Example 4.10 — St. Venant–Kirchhoff model. In theSt. Venant–Kirchhoff model,
one defines the internal energy as the following quadratic energy of some strain
ˆΨStVK( ˆC ) =
ˆλ
2 tr(E)2 + ˆµ tr(E 2). (4.98)
Here ˆλ, ˆµ are the (per unit mass)Lamé constants.
The corresponding stress–strain relation is
S = 2 ∂Ψ(C )
∂C = ♯M
∂ ˆΨ( ˆC )
∂ ˆC
ρM =

ˆλ tr(E)♯M + 2ˆµ♯M E

ρM (4.99)
= λ tr(E)♯M + 2µ♯M E (4.100)
where λ = ˆλρM , µ = ˆµρM are Lamé constants asn-forms.
In Cartesian coordinate,
S = λ tr(E)I + 2µE. (4.101)
■
4.7.2 Isotropic models
To design a more generalˆΨ( ˆC ) beyond a quadratic function on some strain, one
takes advantage of another symmetry under the following isotropy assumption.
Postulate 4.4 — Isotropic material. We call a materialisotropic if
ˆΨ( ˆC ) = ˆΨ(R−1 ˆCR) (4.102)
for all R ∈ End(TM ) so that R∗♭M R = ♭M and det(R) = 1 (i.e. for rotation
transformations R with respect to♭M).
■ Example 4.11 (4.98) is isotropic. ■
Since ♭M ˆC = C is self-adjoint, there exists a♭M-orthonormal basis, or equivalently
a ♭M-rotation transformation R, that diagonalizes ˆC. Therefore, for an isotropic
material (♭M-rotation invariance), ˆΨ( ˆC ) depends only on the eigenvalues ofˆC. The
eigenvalues of ˆC are also the squares of the singular values ofF : TM
linear
− − − →TϕW
using ♭M and ♭W as the inner product structures for the singular value decomposi-
tion.


## Page 110

110 Chapter 4. Continuum Mechanics
Theorem 4.12 A material is isotropic if and only ifˆΨ( ˆC ) is a function of the
eigenvalues {λ1, λ2, . . . , λn} of ˆC modulo permutation.
A general function ofn variables {λ1, . . . , λn} that is invariant under their permuta-
tion can be expressed as a function of the coefficients of the polynomial whose roots are
{λ1, . . . , λn}. Therefore, Theorem 4.12 is equivalent to the following Theorem 4.13.
Definition 4.16 — Invariants of an endomorphism. The coefficientsI1, . . . ,In of
the characteristic polynomial ofˆC
P ˆC (z) = det(zI − ˆC ) = z n − I1z n−1 + I2z n−2 − · · · + (−1)nIn (4.103)
are called theprincipal invariants of ˆC. The trace of the firstn powers of ˆC
Jk := tr( ˆC k), k = 1, . . . ,n (4.104)
are called themain invariantsof ˆC. When the Hencky strainˆH = 1
2 ln( ˆC ) (4.97) is
our main variable for material modeling, we also consider the principal invariants
and the main invariants ofˆH. They are denoted by lower case letters:
det(zI − ˆH ) =: z n − i1z n−1 + i2z n−2 − · · · + (−1)nin (4.105)
jk := tr( ˆH k). (4.106)
Theorem 4.13 — Principal invariants. A material is isotropic if and only ifˆΨ( ˆC )
can be written as
ˆΨ( ˆC ) = w(I1, . . . ,In) (4.107)
where I1, . . . ,In are the principal invariants ofˆC, and w : Rn → R is some function.
R Similarly, isotropic materials can be modeled withˆΨlog( ˆH ) = w(i1, . . . ,in).
The following example demonstrates that one can perform change of variables to
convert any functions oftr( ˆC k) (even whenk > n) into an expression of the principal
invariants.
■ Example 4.12 In 3D, the 3 principal invariants of the Cauchy–Green endomor-
phism ˆC are
I1 = λ1 + λ2 + λ3 = tr( ˆC ) (4.108)
I2 = λ1λ2 + λ1λ3 + λ2λ3 = 1
2(tr( ˆC )2 − tr( ˆC 2)) (4.109)
I3 = λ1λ2λ3 = det( ˆC ). (4.110)


## Page 111

4.7 More on the strain energy density function 111
Conversely,
tr( ˆC ) = I1 (4.111)
tr( ˆC 2) = I 2
1 − 2I2 (4.112)
tr( ˆC 3) = I 3
1 − 3I1I2 + 3I3 (4.113)
where the 3rd equation is obtained by taking trace on theCayley–Hamilton
Theorem
ˆC 3 − I1 ˆC 2 + I2 ˆC − I3I = 0. (4.114)
Higher moments such astr( ˆC 4) can be obtained by repeated substitutions using
the Cayley–Hamilton equation:tr( ˆC 4) = tr( ˆC ( ˆC 3)) = tr( ˆC (I1 ˆC 2 − I2 ˆC + I3I )).
tr( ˆC 4) = I 4
1 − 4I 2
1 I2 + 4I1I3 + 2I 2
2 , (4.115)
tr( ˆC 5) = I 5
1 − 5I 3
1 I2 + 5I 2
1 I3 + 5I1I 2
2 − 5I2I3. (4.116)
In general,
tr( ˆC k) =

1 0 0



0 1 0
0 0 1
I3 −I2 I1


k

1
I1
I 2
1 − 2I2

 . (4.117)
Using power series, any expressiontr(f ( ˆC )), for any analytic functionf, can be
written as an analytic function ofI1, I2, I3. ■
A useful tip about taking the derivative of the determinant of a matrix with
respect to a matrix (endomorphism) is
∂ det(A)
∂A = cof(A) = det(A)A∗−1. (4.118)
Applying this identity to our characteristic polynomial we get
∂P ˆC (z)
∂ ˆC
= −P ˆC (z)(zI − ˆC )∗−1 (4.119)
and
∂Ik
∂ ˆC
= 1
k!
d k
dz k

z=0
∂P ˆC (z)
∂ ˆC
= − 1
k!
d k
dz k

z=0

P ˆC (z)(zI − ˆC )∗−1

. (4.120)
This allows us to compute the 2nd Piola–Kirchhoff stress for a general function
w(I1, . . . ,In) of the invariants:
∂Ψ(C )
∂C = ♯M
∂ ˆΨ( ˆC )
∂ ˆC
ρM , ∂ ˆΨ( ˆC )
∂ ˆC
=
nX
k=1
∂Ik
∂ ˆC
∂w
∂Ik
. (4.121)


## Page 112

112 Chapter 4. Continuum Mechanics
■ Example 4.13 — Neo-Hookean.
ˆΨ( ˆC ) = w(I1, . . . ,In) = ˆµ
2 (I1 − n − ln In) +
ˆλ
2 (
p
In − 1)2. (4.122)
■
The following are special model one can consider in the framework of hyperelas-
ticity models. They are used in conformal mappings in geometry processing and
fluid simulations. Although they are usually not discussed together with elastic
solid simulation, we can describe them in our current discussion about the effects of
stress–strain energy designs.
■ Example 4.14 — Conformal energy. In 2D (n = 2), an energy that only penalizes
conformal distortion but not area distortion takes the form
ˆΨlog( ˆH ) = w(i1, i2) = ˜w

i 2
1 − 2i2

(4.123)
In terms of the singular valuess1 = √λ1, s2 = √λ2 of the deformation gradientF
with respect to♭M and ♭W,
Q = i 2
1 − 2i2 = ln
 s1
s2

(4.124)
which is also known as thedilatation or the quasiconformal error. A quasicon-
formal map is when the maximal conformal distortion, for examplesupM ( 1+e Q
1−e Q =
coth −Q
2 ) over the domainM, is bounded or minimized.
A deformation isconformal or conformally constrained if Q = 0 everywhere.
When a deformation is conformal,F is locally a scaled isometry (scale rotation)
C = ϕ∗♭W = e2u♭M for some conformal factore2u. The conformal energy and the
conformal constraint will induce a “conformal stress” that restores conformality,
which are derived in [Soliman et al.(2021)]. Under the conformal constraint, the
flow map ϕ is still free to deform conformally, and the energy is insensitive to
those deformations. ■
■ Example 4.15 — Volumetric energy. In nD, an energy that only penalizes
volume change but on any other mode of deformation takes the form
ˆΨ( ˆC ) = w(I1, . . . ,In) = w(In). (4.125)
Note that thenth principal invariant ofˆC is In = J 2 where J = (ϕ∗µW )/(µM )
where µW and µM are the volume forms with respect to the metrics♭W and
♭M respectively. There are two notable consequences of this design of energy.
First, as we will derive in Chapter 5, the Cauchy stress tensor will always bea
scalar times the identity. This scalar is called thepressure. Second, the energy is
completely insensitive to any volume-preserving deformation; that is, the material
is unable to create any restoration force on other modes of deformation, such as
volume-preserving stretching and shearing. When a material behaves like this, we


## Page 113

4.8 Conclusion 113
call it afluid.
Inviscid barotropic compressible fluids are in fact exactly the same as a
hyperelastic body with the assumption of(4.125). If the energy(4.125) is stiff,
producing a volumetrically constrained system, then the flow map can only be a
volume preserving one. Note that the material becomes rigid in its volume, but
still free to shear and stretch. In that limit, we obtain anincompressible fluid.
The governing equation of motion becomes theincompressible Euler equation.
Perhaps a philosophical take-away is: The idea of fluid and the concept of
pressure can be derived from a minimalistic set of postulates, in contrast to
phenomenologically reasoned. ■
4.8 Conclusion
Exterior calculus naturally arises in continuum mechanics when we derive the equa-
tions of motion from first principle and keeping track of the types of objects. The
back-propagationmethod that we employed for the derivation demands the distinction
between vectors and their duals. The result is that we obtain stress tensors (1st
Piola–Kirchhoff stress or cauchy stress) as covector-valued(n − 1)-forms. This fits
very well with the original physical intuition of a stress tensor: there is an assignment
of force on every infinitesimal surface. The language of exterior calculus allows us to
accurately describe this delicate tensor type and distinguish it from other matrices
of the same array size. Moreover, changes of coordinates between the material space
and world space use only one unified concept: pullback. Using the commutativity
between pullbacks and exterior derivatives, we immediately obtain Theorem 4.10
without using any vector identity.
Overall, there is much less assumption and identities, and there is a more fine-
grained understanding of formulas in elasticity and symmetry of stress tensor revealed
by the exterior calculus language.


## Page 114

[No extractable text on this page]


## Page 115

5. Fluid Dynamics
In this chapter, we study the motion of fluids. Similar to the philosophy of Chapter 4,
we can characterize Newtonian fluids from a minimalistic set of postulates, and
subsequently derive and study the equations of motion based on first principles. Our
study will primarily concentrate on non-dissipative (inviscid) fluids. Hence, we only
need to look at the kinetic and potential energy of the physical system.
The following postulates follows Example 4.15.
Postulate 5.1 — Inviscid barotropic fluid. An inviscid barotropic fluidisanisotropic
hyperelasticbody(Postulates4.1–4.4)whoseinternalenergy ˆΨ( ˆC )isonlyafunction
of the volume changeˆΨ( ˆC ) = w(det( ˆC )).
In the limit that the internal energy in response to a volume change is infinitely stiff,
the deformable body becomes volumetrically rigid for every material element. In
that case, a barotropic fluid becomes incompressible.
Postulate 5.2 — Inviscid incompressible fluid. An inviscid incompressible fluid is a
volume-constrained (det( ˆC ) is time-independent) barotropic fluid (Postulate 5.1).
R “Barotropic” means the compressible fluid has its internal energy, and conse-
quently the pressure, depend only on the change of fluid density (or the change
of specific volume). A more general compressible fluid, such as anisentropic
fluid governing gas dynamics, will have its internal energy depending on other
hidden variables such as entropy.
R For fluids, Postulate 4.3 can be simplified to that the material space has a rest
volume form µM, instead of a full-blown rest metric tensor♭M.


## Page 116

116 Chapter 5. Fluid Dynamics
We first derive the equations of motion for these systems, known asEuler equa-
tions. These classical equations describe the motion of fluid’s velocity as avector-
valued 0-form. Then, we move on to looking at the same equations in theircovector-
based variants, i.e. they describe the motion of fluid’s velocity as a1-form. We can
arrive at the covector-based Euler equation either by changes of variables at the
PDE level, or from first principles. We show how this covector-based fluid equation
provides visuals and computational efficiency advantages for fluid simulations.
5.1 Euler equations
We follow the same principles established in the previous chapter and study our
dynamical system using its kinetic and potential energy, and its associated Euler-
Lagrange equation to prove the equations of motion.
5.1.1 Vector-based Euler equations
Following Postulate 4.2, the kinetic energy for a flow map of a continuum is given
by K( ˙ϕ) =
´
M
1
2 | ˙ϕ|2
♭W
ρM, and together with the potential energyU(ϕ) =
´
M Ψ(C ),
C = ϕ∗♭W = F ∗♭W F, we can find the equation of motion as in (4.2):
d
dt
∂K
∂ ˙ϕ
= − ∂U
∂ϕ . (5.1)
Using (4.75), and assuming no external forces, the equation simplifies to:
ρM
∇
¨ϕ = d ∇
(n − 1)-form
P (5.2)
whre P = 2♭W F ∂Ψ
∂C. As demonstrated in Example 4.7, in 3D Cartesian space, the
equation is further simplified to:
ρM
∇
¨ϕ = ∇ · P, (5.3)
where P = FS, S = ∂Ψ
∂C, F = ∇ϕ, and C = F⊺F.
Now let us substitute the assumptions of Postulate 5.1 (Example 4.15) for fluids.
Specifically, the potential energy only depends on its top-dimensional principal
invariant, or equivalentlyˆΨ( ˆC ) = w(I3) = w(J 2) in 3D, whereJ = det(F). In the
coordinate-free language, J = det(F) = ϕ∗µW
µM
where µW and µM are the volume
forms on W and M respectively.
Definition 5.1 We denote the mass form in the world coordinate asρ ∈ Ωn(W ),
which given by the relation
ρM =: ϕ∗
n-form
ρ. (5.4)


## Page 117

5.1 Euler equations 117
Define the material-space and world-space mass density 0-forms by
qM := ρM
µM
∈ Ω0(M ), q := ρ
µW
∈ Ω0(W ). (5.5)
One can check that
ϕ∗
0-form
q = q ◦ ϕ = qM
J . (5.6)
Theorem 5.1 Under the assumption of Postulate 5.1, the Cauchy stress tensor
takes the form of a scalar times identity
σ = −pI ⊗ µW , p ∈ Ω0(W ) (5.7)
We callp the pressure.
Proof. Using (4.118), the derivative ofˆΨ( ˆC ) = w(I3) with respect to ˆC is given by
∂ ˆΨ
∂ ˆC = w ′(I3)cof( ˆC ) = w ′(J 2)J 2 ˆC ∗−1 = w ′(J 2)J 2♭M C −1. Then, by(4.121) we have
the 2nd Piola stress tensor given by
S = 2 ∂Ψ(C )
∂C = 2♯M w ′(J 2)J 2♭M C −1ρM (5.8)
= 2w ′(J 2)J 2C −1ρM (5.9)
= 2w ′(J 2)J 2F −1♯W F ∗−1ρM (5.10)
Transforming the 2nd Piola–Kirchhoff stress tensor to the 1st Piola–Kirchhoff and
subsequently Cauchy stress tensor, we get
P = ♭W FS = 2w ′(J 2)J 2F ∗−1ρM (5.11)
P = ϕ∗
2-form
σ =⇒ σ = 2w ′(J 2)J(I ⊗ ρ) (5.12)
We complete the proof by defining
p := −2w ′(J 2)Jq. (5.13)
Definition 5.2 — Fluid velocity. We define⃗u = u ∈ Γ(TW ) as the fluid velocity,
defined by
˙ϕ = u ◦ ϕ = ϕ∗
0-form
u (5.14)
We use the notationu and ⃗u interchangeably, both of which represent the vector
type or the vector-valued 0-form type.
Also define
η := ♭W u ∈ Ω1(W ) (5.15)


## Page 118

118 Chapter 5. Fluid Dynamics
as the fluid velocity covector.
Theorem 5.2 — Barotropic Euler equation. Under the general equation of motion
(5.2), the velocity fieldu satisfies
∂q
∂t + div(qu) = 0, (5.16)
∂u
∂t + ∇uu = −grad p
q , (5.17)
where p is a function ofq derived from (5.13).
Proof. The continuity equation(5.16) follows from ρM being time-independent in
terms of Lie derivative (2.134).
Noting that P = ϕ∗
2-form
σ and σ = −pI ⊗ µW, we can write the equation of motion
as:
ρM
∇
¨ϕ = d ∇P = d ∇ ϕ∗
2-form
σ = ϕ∗
3-form
d ∇σ, (5.18)
= ϕ∗
3-form
(− grad p ⊗ µW ) = −( ϕ∗
3-form
µW )( ϕ∗
0-form
grad p) (5.19)
= −J µM (grad p ◦ ϕ). (5.20)
Recall that ˙ϕ = u ◦ ϕ = ϕ∗
0-form
u. From Corollary 2.29, we can interpret the second
derivative of the flow mapϕ as the Lie material derivative of the velocity vector field
as a 0-form:
∇
¨ϕ = ∇
∂t

ϕ∗
0-form
u

= ϕ∗
0-form
 ∂u
∂t + L ∇
u
0-form
u

. (5.21)
Further, note thatJ µM
ρM
= J
qM
= ϕ∗
0-form
1
q using (5.6). This allows us to now write the
Euler equations in the Eulerian coordinate:
∂u
∂t + ∇uu = −grad p
q . (5.22)
R The formulation of the Euler equation through the above process describes
the conservation law on linear momentum.
For the remainder of this chapter, we assume thatq = 1 to reduce the system
into an incompressible fluid system.


## Page 119

5.1 Euler equations 119
Corollary 5.3 — Incompressible Euler equation. Under Postulate 5.2, the velocity
field u satisfies
(div u)µW = Lu
n-form
µW = 0, (5.23)
∂u
∂t + ∇uu = −grad p, (5.24)
5.1.2 Covector Euler equations as a constrained minimization
One may re-derive the equations of motion in terms of the velocity covector field.
For this, we formulate the action minimization in terms of the Eulerian coordinate
energy as follows:
minimize
u,ψ
S(u) =
ˆ
W
1
2 |u|2µW
subject to ˙ψ + Lu
0-form
ψ = 0and Lu
n-form
µ = 0.
(5.25)
Here, ψ is the inverse flow map given byψ ◦ ϕ = ϕ∗
0-form
ψ = id. The first constraint,
referred to asLin’s Constraint, comes from the Lie material derivative for the 0-form
backward flow map ˙ψ + Lu
0-form
ψ = 0, and the second constraint enforces incom-
pressibility for the fluid. Rewriting the action using Lagrange multipliers we get
to:
S(u, ψ) =
ˆ
W
1
2 |u|2µW − ⟨η0| ˙ψ + Lu ψ⟩µW − ⟨λ| Lu µW ⟩, (5.26)
where λ ∈ Ω0(W ) and η0 ∈ Γ(T ∗
ψM ) are the Lagrange multipliers for the incompress-
ibility and Lin’s constraint, respectively. By taking variations in terms ofu and ψ
we can find the following equations of motion:
η = ψ∗
1-form
η0 − d λ, (5.27)
∂η0
∂t = 0. (5.28)
where η = u♭. Using Theorem 2.28, we can take the time derivative of the above to
the covector-based Euler equations:
˙η + Lu
1-form
η = −d λ. (5.29)
R The covector formulation of the Euler equation describes a conservation law
on the circulation of velocity 1-form.


## Page 120

120 Chapter 5. Fluid Dynamics
Consistency between(5.29) and (5.24)
We can check that(5.29) is consistent with(5.24) as follows. As shown in Exam-
ple 2.21, we can write the Lie material derivative of the velocity 1-formη = u♭ for
3D Cartesian space:
∂η
∂t + Lu
1-form
η =
 ∂u
∂t + u · ∇u + (∇u)⊺u
♭
. (5.30)
To get to the Euler equation for fluid dynamics, we can add a modified gradient
pressure term λ = p − 1
2 iuη = p − 1
2 |u|2 to both sides.
∂η
∂t + Lu
1-form
η + d λ =
 ∂u
∂t + u · ∇u + (∇u)⊺u + ∇λ
♭
(5.31)
=
 ∂u
∂t + u · ∇u + ∇p
♭
= 0. (5.32)
Corollary 5.4 — Vorticity equation. By taking d on (5.29), we obtain
˙ω + Lu
2-form
ω = 0, (5.33)
where
ω = d η (5.34)
is called thevorticity 2-form.
5.2 Advantages of Covector Euler Equation
While the covector-based equation of motion is equivalent to the vector-based
equation, it can provide alternative advantages that are desirable for the animation
and simulation of fluid dynamics.
The common convention in fluid solvers is to freeze the velocityv ← u, and split
the Euler equations in two steps of advection and projection. These steps, however,
prove to induce additional numerical dissipation in the simulation which can hinder
the computational performance and visual fidelity of the results. We can see that
the covector-based formulation provides a formulation that can significantly improve
the visual fidelity of the results while reducing numerical dissipation.
Given a frozen background velocity fieldv, and splitting the Euler equations of
motion (5.17) and (5.29), we get to the following transport equations for covector-
based transport:
˙η + Lv
1-form
η = 0. (5.35)
and for vector-based transport equation:
˙u + v · ∇u = 0. (5.36)


## Page 121

5.2 Advantages of Covector Euler Equation 121
Covector-based transport in vector calculus
From Example 2.21, we can transform (5.35) to a vector calculus equivalent of:
˙u + v · ∇u = −(∇v) · u. (5.37)
This form reveals how the covector-based Euler equation involves a stretching term
that was not present in the vector-based transport (5.36).
Thisequationisalsothebasisforthe impulse methods[Buttke(1993),Cortez(1995),
Feng et al.(2022)]. In the literature,(5.35) is treated as a non-trivial dynamical sys-
tem for each flowing particleDu
Dt = −(∇v) · u. The standard method for solving
this PDE is to further split the transport equation which brings about additional
instability due to the right-hand side stretching term.
Solving covector-based transport without inducing instability from the stretching
term
To remedy the problems associated with solving(5.37), we can instead study(5.35).
The solution to this PDE, as stated in Corollary 2.29, is given by:
ηt = e − Lv t η0, (5.38)
= ψ∗
t η0. (5.39)
In 3D Cartisen domain (see Figure 5.1), this is simply
ut = (∇ψt)⊺u ◦ ψt . (5.40)
Note the difference to the solution of vector-based Euler equation which is the
component-wise Lie-material derivative of a vector-valued 0-form˙u + Lv
0-form
u = 0
given by:
ut = u0 ◦ ψt . (5.41)
As opposed to theImpulse methods, the advection through the pullback operator
does not need the splitting of the stretching term, which allows for a more stable
transport equation.
Conservation of Circulation
Kelvin’s conservation of circulation[Thomson(1868),Frisch and Villone(2014)]states
that the circulation
¸
C u · d l or equivalently
¸
C ηt, around every closed loop is con-
served. Since the solution to the covector-based transport is simply the pullback
of the 1-form fieldηt = ψ∗
t η0, this conservation law follows naturally according to
Theorem 2.1. Concretely:
˛
C
ψ∗
t η0 =
˛
ψ(C)
η0. (5.42)
As opposed to the vector-based formulation of Euler equations which results
in a conservation of linear momentum, the covector-based formulation leads to a
conservation of circulation.


## Page 122

122 Chapter 5. Fluid Dynamics
(a) (b) (c)
u
ψ(x)
x
v
u(ψ(x))
transported
velocity
x
ψ(x)
u
u(ψ(x))−∇p
d ψ(x)
d ψ(x)⊺
u(ψ(x))
dψ(x)⊺u(ψ(x))
covector-
transported
velocity
Figure 5.1 (a) In a standard fluid solver, the velocityu is transported by the
flow v using an inverse flow mapψ. (b) This process can turn a
rotation motion into a divergent one which is subsequently damped
by the pressure projection. (c) Our advection method maintains the
vorticity by a multiplication with the transposed Jacobian of the
inverse flow map.
For simulating vortex-dominant phenomena, computations based on the con-
servation of circulation [Elcott et al.(2007), Nabizadeh et al.(2022)] are more advan-
tageous. The difference between the two motion laws(5.17) and (5.29) becomes
apparent in a flow dominated by vorticity. In(5.17), the pressure force is respon-
sible for the concentration of vorticity. Without the pressure, the inertial motion
(conservation of linear momentum) turns into a centrifugal force that makes vortices
disintegrate. In(5.29), the Lagrangian pressure playsno role in the persistence of
vorticity. The mechanism for the conservation of vorticity is entirely encoded in
the left-hand side of the equation. Such a property makes an algorithm based on
time-splitting into advection and pressure steps especially appealing.
Equivalence to a vortex method
The traditional advection-projection method introduces a splitting error that destroys
vorticity [Zhang et al.(2015), Zehnder et al.(2018)]. This phenomenon arises solely
from the advection step, since the projection step only modifies the velocityu with
a pure gradient which leads to no change in its curl.
Theorem 5.5 — Vector-based transport as a vortex method. Under the classical
advection equation ( ∂
∂t + v · ∇)u = 0, the vorticityw = ∇ × u evolves according
toa
∂
∂t w + v · ∇w − w · ∇v = ⟨∇u × ∇v⟩. (5.43)
This modified vorticity equationdeviates from the correct vorticity equation by a
term ⟨∇u × ∇v⟩.
aIn index notation⟨∇u × ∇v⟩i = ϵijk ∂j u ℓ∂k v ℓ.
Proof. The vector-based transport equation( ∂
∂t + v · ∇)u = 0, is equivalent to the
following equation ∂
∂t η + Lv η = ⟨∇v, u⟩ using the velocity covectorη = u♭. Taking


## Page 123

5.2 Advantages of Covector Euler Equation 123
d on both sides of the equation yields
∂
∂t ω + Lv ω = d ⟨∇v, u⟩ = ⟨d ∇∇v| {z }
=0
, u⟩ − ⟨∇v ∧ ∇u⟩
= ⟨∇u ∧ ∇v⟩,
where the first identity is the Leibniz rule with metricd ⟨A ∧ B⟩ = ⟨d ∇A ∧ B⟩ +
(−1)k ⟨A ∧ d ∇B⟩, and the termd ∇∇v is zero since there is no curvature in flat space
(i.e. d ∇d ∇ = 0). Converting 2-forms to vector fields in 3D usingω = iwµ, we obtain
∂
∂t w + ∇vw − ∇wv = ⟨∇u × ∇v⟩.
Theorem 5.6 — Covector-based transport as a vortex method. The evolution of
w = ∇ × u that undergoes (5.37) is
∂
∂t w + v · ∇w − w · ∇v = 0 (5.44)
which is the correct vorticity equation.
Proof. As shown in Corollary 2.29, Eq.(5.37) is equivalent to(5.35), i.e.∂
∂t η + Lv η =
0, given thatη = u♭. Applying d to (5.35), and using the commutativity between
d and Lv, we obtain ∂
∂t ω + Lv ω = 0 for thevorticity 2-form ω = d η. In 3D, the
relationship between the 2-formω = d u♭ and the vector fieldw = curl u is given by
ω = iwµ where µ ∈ Ω3(M ) is the volume form. Using this relationship we obtain
0 = ∂
∂t ω + Lv ω = ∂
∂t (iwµ) + Lv(iwµ)
= i∂w/∂tµ + i[v,w]µ + iwLv µ|{z}
=0
(Lv µ = 0 since div v = 0)
= i(∂w/∂t+[v,w])µ,
where in the second line we used the identity of Lie derivative on contraction
Lv(iwα) = i[v,w]α + iw(Lv α). Therefore, ∂
∂t w + [v, w] = 0. Finally, we arrive at
(5.44) by substituting[v, w] = ∇vw − ∇wv under Theorem 2.27.
By advancing u via the covector transportation(5.35) or (5.37), we implicitly solve
the vorticity equation(5.44), which is the modeling equation for vortex methods.
The ability to solve(5.44) at the velocity level without using the vorticity variable is
significant. Previous vortex methods which solve(5.44) have to include an expensive
integration that converts vorticity back to velocity.
Commutativity between covector transportation and pressure projection
In a traditional fluid solver, the splitting error between traditional advection and
the projection arises because two operations do not commute. Here we show that
advection and projectioncommute in CF. This property of CF fundamentally removes
the splitting error of these two operations.
Consider the equivalence classes ofΩ1(M ) where [ξ] = [η] whenever ξ −η = d φ for
some function φ. This is a natural abstraction for our discussion since two covector
fields are equivalent if and only if they share the same pressure projection result.


## Page 124

124 Chapter 5. Fluid Dynamics
The pressure projection can be understood as extracting the unique divergence-free
representative in each equivalence class[η] ∈ Ω1(M )/ im(d).
Now consider two covector fieldsξ0, η0 ∈ Ω1(M ), divergence-free or not, and
transport them by the covector advection equation(5.38) to obtain ξt , ηt respectively.
Then
[ξ0] = [η0] if and only if [ξt] = [ηt]. (5.45)
To see this assertion, use(5.38) to express ξt − ηt as the pullback ofξ0 − η0 by the
inverse flow map
ξt − ηt = ψ∗
t (ξ0 − η0) (5.46)
and apply Theorem 2.11 so that the pullback of an exact differential is still exact.
Therefore, whether one first projects then advects, advects then projects, or inserts a
projection (or reflection [Zehnder et al.(2018)]) at the halfway point of the advection,
one will obtain covector fields all in the same equivalence class and hence the same
divergence-free representative.
Note that the same argument does not apply to the traditional advections. The
transportation with a simple value look-up(5.41) generally turns an exact gradient
vector field into a non-gradient field.
Extending CF with a long-time characteristic mapping
The analysis in Section 5.2 implies that we may delay the pressure projection for a
longer time (rather than a time step) and just transport the velocity covector fieldη
using a long-time flow map.
Let ψt : Wt → M0 be the inverse flow map (Eulerian-to-Lagrangian map) which
is the Lagrangian marker carried by the history of the solution
∂
∂t ψt + ut · ∇ψt = 0, ψ 0 = idM . (5.47)
Then the velocity covector field at the current timet is the pressure projection of
ηt = ψ∗
t η0. (5.48)
In other words, if we maintain a Lagrangian markerψt we obtain the fluid state
through a single-step look up. This drastically reduces the amount of interpolation
in the advection-projection iteration.
Such a long-time method of characteristic mapping (MCM) is proposed by
[Tessendorf and Pelfrey(2011), Sato et al.(2018), Qu et al.(2019)]. We call the vari-
ant of the CF method based on (5.47) and (5.48)CF+MCM.
R CF+MCM is subtly different from the traditional MCM. The latter requires
an accumulation of the pressure gradient over time whereas the former does
not. In the traditional MCM [Qu et al.(2019)], one evaluates ut by (5.24)
integrating over time along particle trajectories:
ut(x) = u0(ψt(x)) +
´ t
0 (∇pτ)(ϕτ(ψt(x))) d τ. (5.49)


## Page 125

5.3 Conclusion 125
In CF+MCM, the time integration of (5.29) yields
ηt = ψ∗
t η0 +
´ t
0 (ϕτ ◦ ψt)∗d λτ d τ
= ψ∗
t η0 + d
´ t
0 (ϕτ ◦ ψt)∗λτ d τ

.
(5.50)
which is a comparable notation to (5.49) corresponds to
ut(x) = d ψ⊺
t u0(ψt(x))
+
´ t
0 d ψ⊺
t d ϕ⊺
τ(∇(pτ − |uτ |2
2 ))(ϕτ(ψt(x))) d τ
= d ψ⊺
t u0(ψt(x)) + ∇
´ t
0 (pτ − |uτ |2
2 )(ϕτ(ψt(x))) d τ

.
(5.51)
As omitted in(5.48), the second terms in(5.50) and (5.51) can be absorbed
in a single pressure projection as they are exact differentials. This is possible
since d (resp. ∇) in(5.50) (resp. (5.51)) can be pulled out of the integral by the
commutativity property (cf. Theorem 2.11) betweend and pullback operators.
By contrast in(5.49), the ∇ in the pressure term cannot be pulled out of the
time integral. The accumulated pressure
´ t
0 (∇pτ) ◦ ϕτ ◦ ψt d τ is generally not
an exact gradient. Therefore, a traditional MCM must carefully record the
accumulated pressure. This procedure is entirely removed in CF+MCM.
5.3 Conclusion
One can write the equations of motion of fluid mechanics following the same process
established in the previous chapter. While this gets us to a vector-based Euler
equation following the conservation of linear momentum, with a modified procedure
of minimizing action in the Lagrangian frame, one can write the same equations of
motion in terms of velocity covector. These equation reveal multiple benefits when
it comes to simulating incompressible ideal fluids, since the formulation naturally
guarantees the preservation of circulation while involving a simple modification by
multiplying the looked up velocity with the inverse transpose of the flow map’s
jacobian (i.e. u ← (∇ψt)⊺u ◦ ψt as opposed to u ← u ◦ ψt). Additionally, this
formulation completely removes the splitting error between the pressure projection
and advection steps as it follows the commutativity between exterior derivative
and the pullback operator. The method emulates a vorticity-based Euler equation,
which is preferable in vortex-dominated flows, without incurring instability due to
the stretching term as the pullback operator is exact solution to the Lie-material
derivative for 1-form velocity field. This natural solution also allows for using long-
term method of characteristics mapping since the pullback operator remains the
exact solution regardless of the duration of the timesteps.


## Page 126

[No extractable text on this page]


## Page 127

III
Bibliography . . . . . . . . . . . . . . . . . . . . . 129
Index . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 131
Appendix


## Page 128

[No extractable text on this page]


## Page 129

Bibliography
[Boyd and Vandenberghe(2004)]Stephen P Boyd and Lieven Vandenberghe. 2004.
Convex optimization. Cambridge university press.
[Buttke(1993)] Tomas F Buttke. 1993. Velicity methods: Lagrangian numerical
methods which preserve the Hamiltonian structure of incompressible fluid flow.
In Vortex flows and related numerical methods. Springer, 39–57.
[Cortez(1995)] Ricardo Cortez. 1995. Impulse-based methods for fluid flow.https:
//doi.org/10.2172/87798
[Crane(2018)] Keenan Crane. 2018. Discrete differential geometry: An applied
introduction. Notices of the AMS, Communication(2018), 1153–1159.
[Crane et al.(2013)]Keenan Crane, Fernando De Goes, Mathieu Desbrun, and Peter
Schröder. 2013. Digital geometry processing with discrete exterior calculus. In
ACM SIGGRAPH 2013 Courses. 1–126.
[Elcott et al.(2007)]Sharif Elcott, Yiying Tong, Eva Kanso, Peter Schröder, and
Mathieu Desbrun. 2007. Stable, circulation-preserving, simplicial fluids.ACM
Transactions on Graphics (TOG)26, 1 (2007), 4–es.
[Evans(1998)] Lawrence C Evans. 1998.Partial differential equations. American
Mathematical Society.
[Feng et al.(2022)]Fan Feng, Jinyuan Liu, Shiying Xiong, Shuqi Yang, Yaorui Zhang,
and Bo Zhu. 2022. Impulse Fluid Simulation.IEEE Transactions on Visualiza-
tion and Computer Graphics(2022).
[Flanders(1963)] Harley Flanders. 1963.Differential forms with applications to the
physical sciences by harley flanders. Elsevier.


## Page 130

130 BIBLIOGRAPHY
[Frankel(2011)] Theodore Frankel. 2011.The geometry of physics: an introduction.
Cambridge university press.
[Frisch and Villone(2014)]Uriel Frisch and Barbara Villone. 2014. Cauchy’s almost
forgotten Lagrangian formulation of the Euler equation for 3D incompressible
flow. The European Physical Journal H39, 3 (2014), 325–351.
[Grinspun et al.(2006)]Eitan Grinspun, Mathieu Desbrun, Konrad Polthier, Peter
Schröder, and Ari Stern. 2006. Discrete differential geometry: an applied
introduction. ACM Siggraph Course7, 1 (2006).
[Nabizadeh et al.(2022)]Mohammad Sina Nabizadeh, Stephanie Wang, Ravi Ra-
mamoorthi, and Albert Chern. 2022. Covector fluids.ACM Transactions on
Graphics (TOG)41, 4 (2022), 1–16.
[Nicolet et al.(2021)]BaptisteNicolet, AlecJacobson, andWenzelJakob.2021. Large
steps in inverse rendering of geometry.ACM Transactions on Graphics (TOG)
40, 6 (2021), 1–13.
[Qu et al.(2019)]Ziyin Qu, Xinxin Zhang, Ming Gao, Chenfanfu Jiang, and Baoquan
Chen. 2019. Efficient and conservative fluids using bidirectional mapping.ACM
Transactions on Graphics (TOG)38, 4 (2019), 1–12.
[Sato et al.(2018)]Takahiro Sato, Christopher Batty, Takeo Igarashi, and Ryoichi
Ando. 2018. Spatially adaptive long-term semi-Lagrangian method for accurate
velocity advection.Computational Visual Media4, 3 (2018), 223–230.
[Sellán et al.(2021)]Silvia Sellán, Jack Luong, Leticia Mattos Da Silva, Aravind
Ramakrishnan, Yuchuan Yang, and Alec Jacobson. 2021. Breaking Good:
Fracture Modes for Realtime Destruction.arXiv preprint arXiv:2111.05249
(2021).
[Soliman et al.(2021)]Yousuf Soliman, Albert Chern, Olga Diamanti, Felix Knöppel,
Ulrich Pinkall, and Peter Schröder. 2021. Constrained Willmore surfaces.ACM
Transactions on Graphics (TOG)40, 4 (2021), 1–17.
[Tessendorf and Pelfrey(2011)]Jerry Tessendorf and Brandon Pelfrey. 2011. The
characteristic map for fast and efficient vfx fluid simulations. InComputer
Graphics International Workshop on VFX, Computer Animation, and Stereo
Movies. Ottawa, Canada.
[Thomson(1868)] William Thomson. 1868. On Vortex Motion.Earth and Environ-
mental Science Transactions of the Royal Society of Edinburgh25, 1 (1868),
217–260.
[Wang and Chern(2021)]Stephanie Wang and Albert Chern. 2021. Computing
minimal surfaces with differential forms.ACM Transactions on Graphics (TOG)
40, 4 (2021), 1–14.


## Page 131

BIBLIOGRAPHY 131
[Yang et al.(2021)]Shuqi Yang, Shiying Xiong, Yaorui Zhang, Fan Feng, Jinyuan
Liu, and Bo Zhu. 2021. Clebsch gauge fluid.ACM Transactions on Graphics
(TOG) 40, 4 (2021), 1–11.
[Yin et al.(2023)]Hang Yin, Mohammad Sina Nabizadeh, Baichuan Wu, Stephanie
Wang, and Albert Chern. 2023. Fluid cohomology. ACM Transactions on
Graphics (TOG)42, 4 (2023), 1–24.
[Zehnder et al.(2018)]Jonas Zehnder, Rahul Narain, and Bernhard Thomaszewski.
2018. An advection-reflection solver for detail-preserving fluid simulation.ACM
Transactions on Graphics (TOG)37, 4 (2018), 1–8.
[Zhang et al.(2015)]Xinxin Zhang, Robert Bridson, and Chen Greif. 2015. Restoring
the missing vorticity in advection-projection fluid solvers.ACM Transactions
on Graphics (TOG)34, 4 (2015), 1–8.
[Zhao et al.(2020a)]Shuang Zhao, Wenzel Jakob, and Tzu-Mao Li. 2020a. Physics-
based differentiable rendering: from theory to implementation. InACM SIG-
GRAPH 2020 Courses. 1–30.
[Zhao et al.(2020b)]Shuang Zhao, Wenzel Jakob, and Tzu-Mao Li. 2020b. Physics-
based differentiable rendering: from theory to implementation. InACM siggraph
2020 courses. 1–30.


## Page 132

Index
1st Piola–Kirchhoff stress, 92, 103
2nd Piola–Kirchhoff stress, 92, 103
Action, 91
Adjoint, 18
Algebra, 49
Annihilator, 17
Back-propagation, 29
Bilinear form, 18
Cartan’s magic formula, 60
Cauchy stress, 92, 105
Cauchy–Binet identity, 42
Cauchy–Green tensor, 100
Cayley–Hamilton theorem, 111
Cell complex, 73
Chain, 73
Chain rule, 27, 46
Circulation, 32, 35
Conformal energy, 112
Continuum mechanics, 89
Coordinate system, 25
Cotangent bundle, 25
Covariant derivative, 54, 59
Covector, 16
Covector field, 24, 25
Cramer’s rule, 98
Current, 75
Cycles, 33
Decomposable tensor, 94
Deformation gradient, 27, 39, 92, 99
Deformation map, 90
Derivation, 49, 50
Diagonalization, 20
Differential, 25
Differential form, 35, 37
Dirac δ form, 75
Dirichlet energy, 81
Distribution, 52
Divergence, 34
Divergence theorem, 34, 47
Dual basis, 19
Dual norm, 77
Dual pairing, 15
Dual space, 16
Elasticity, 91
derivation, 102
postulate, 99, 108
Embedding, 69
Endomorphism, 18
Euler equation, 116
barotropic, 118
incompressible, 119
Euler–Lagrange equation, 84


## Page 133

INDEX 133
Eulerian coordinate, 90
Eulerian representation, 74
Exterior calculus, 31
discrete, 73
Exterior covariant derivative, 55
Exterior derivative, 36, 44, 48
Extrusion, 43
Fiber, 24
Flat, 21
Flow map, 57, 90
Fluid
barotropic, 115
incompressible, 115
Fluid dynamics, 115
Fluid velocity, 117
Flux, 33
Four fundamental subspaces, 18
Function graph, 70
Fundamental theorem of calculus, 46
Fundamental theorem of Riemannian ge-
ometry, 55
Geometric measure theory, 74
Gradient, 26
Gradient descent, 86
Green’s theorem, 34
Helmholtz’s free energy, 108
Hodge star, 36, 64
Holonomic constraint, 52
Homomorphism
linear, 96
Identity 1-form, 56
Impulse method, 121
Integrability
distribution, 52
Integration, 38, 47
Integration pairing, 72
Interior product, 36, 39, 48
Internal energy, 108
Isometry, 20, 23
Isotropic material, 109
Jacobian, 27
Karush–Kuhn–Tucker conditions, 84
Kelvin’s circulation theorem, 121
Kelvin–Stokes theorem, 35, 46
Kinetic energy, 91
Kirchhoff stress, 92
Lagrangian coordinate, 90
Lagrangian representation, 69
Lamé constants, 109
Leibniz’s integral rule, 64
Levi-Civita connection, 55
Lie advection, 58
Lie algebra, 50
Lie bracket, 51
Lie derivative, 56, 57
differnetial form, 60
function, 58
vector field, 58
Lie material derivative, 58
Lin’s constraint, 119
Main invariants, 110
Manifold, 29
Material derivative, 62
Material space, 69, 90
Metric, 21
Musical isomorphism, 21
Neo-Hookean model, 112
Newton’s method, 87
Nominal stress, 92
Non-holonomic constraint, 52
Orthonormal basis, 22
Partial derivative, 25
Piola identity, 46
Plateau problem, 77
Polar, 22
Polar cone, 85
Polar decomposition, 20
Polarization, 19, 21
Pole, 22
Positive definite, 22
Pressure, 113, 117
Principal invariants, 110
Pullback, 27, 34, 36, 38, 47
covector, 27
differential form, 34, 38, 47


## Page 134

134 INDEX
exterior derivative, 44
function, 28
interior product, 43
metric, 100
vector field, 58
wedge product, 43
Pullback bundle, 96
Pushforward, 26
Quadratic form, 19
Reynolds’ transport theorem, 63
Section, 25
Sharp, 21
Singular value decomposition, 24
St. Venant–Kirchhoff model, 109
Stokes theorem, 45
Strain, 108
Strain energy density function, 101, 107
Stress–strain relation, 102
Tangent bundle, 24
Tangent space, 24
Tangent vector, 24
Tensor, 93
Tensor power, 94
skew-symmetric, 95
symmetric, 95
Tensor product, 93
Tensor product bundle, 94
Traction force, 92
Unitary, 23
Vector, 16
Vector fields, 24
Vector quadruple product, 42
Vector triple product, 42
Vorticity, 120
Wedge product, 36, 39, 48, 95
World space, 69, 90
