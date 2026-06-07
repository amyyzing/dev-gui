# DEC Differential Equations

Source title: Universidad de Guanajuato

Converted from: `20.pdf`


## Page 1

Universidad de Guanajuato
Departamento de Matemáticas
Solving Differential Equations with
Discrete Exterior Calculus
Student: Ricardo Alberto Gloria Picazzo
Professor: Héctor Andrés Chang Lara
Project intended for the course on Partial Differential Equations, Fall of
2022, Guanajuato, Guanajuato, México.


## Page 2

Discrete Exterior Calculus (DEC) aim to discretize Exterior Differential Calculus.
Definitionsin(DEC)triestomimictheexistingsmooththeory[4]. Inhisdoctoralthesis
[6], in the year 2023, Hirani proposed fundaments of Discrete Exterior Calculus using
Discrete Combinatorics and Algebraic Topology definitions. In this way, discrete tools
wereproposedinordertohaveanequivalenttodifferentialformsandoperators,vector
fields, geometric operators, etcetera.
OneofmainDECapplicationsisthecreationofdiscreteoperatorstosolvePartial
Differential Equations (PDE’s) numerically. The proof of it is given in [5] in the year of
2008whereauthorsdiscretizeDarcyflowequationsinordertosolvethemnumerically.
In this project made for a Partial Differential Equations course an introduction
to basic concepts to DEC is presented trying not to avoid theoretical definitions such
as the ones from Algebraic Topology. On the other hand, such theoretical aspects are
widely explained through drawings, figures and examples.
Section1explaindefinitionsrelatedtosimplicialcomplexesborrowedfromAlgebraic
Topology. Section2introducetoDiscreteExteriorCalculusexplainingstepstodiscretize
PDE’s. FinallySection3presentsthreeDECapplications. SpecificallyPoissonequations
with Dirichlet conditions inRand R2 and a Heat equation example.


## Page 3

Solving Differential Equations with Discrete Exterior Calculus
Contents
1 Simplicial Complexes 3
1.1 Euclidean Simplicial Complexes . . . . . . . . . . . . . . . . . . . . . . . 3
1.2 Abstract Simplicial Complexes . . . . . . . . . . . . . . . . . . . . . . . . 4
1.3 Oriented Simplicial Complex . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.4 Dual Complex of a Simplicial Complex . . . . . . . . . . . . . . . . . . . . 6
2 Discrete Exterior Calculus 9
2.1 Discrete Differential Forms . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
2.2 Discrete Exterior Derivative . . . . . . . . . . . . . . . . . . . . . . . . . . 11
2.3 The Hodge Star . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
2.3.1 Hodge Star in Exterior Algebra . . . . . . . . . . . . . . . . . . . . 13
2.3.2 Discrete Hodge Star . . . . . . . . . . . . . . . . . . . . . . . . . . 14
2.4 Laplacian Operator . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
2.4.1 Continuos Laplace Operator . . . . . . . . . . . . . . . . . . . . . 16
2.4.2 Discrete Laplace Operator . . . . . . . . . . . . . . . . . . . . . . . 18
3 Solving Differential Equations 18
3.1 Poisson equation in R . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
3.2 Poisson equation in R2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
3.3 Heat equation in one dimension . . . . . . . . . . . . . . . . . . . . . . . . 24
4 Conclusions and future work 28
References 29
Page 2


## Page 4

1 Simplicial Complexes
ThissectionpresentssomedefinitionsofAlgebraicTopologythatwillbeusefulforour
purposes. Most definitions here, are taken from[8]and[9].
1.1 Euclidean Simplicial Complexes
Webeginbydefiningwhata 𝑘-complexis. First,letusremembersomeLinearAlgebra
definitions. An affine subspaceof a vector space𝑉 is the set𝑓−1(0)where 𝑓 : 𝑉→𝑊
is a function of the form𝑓(𝑥)= 𝑇(𝑥)+𝑏 where, 𝑊 is a vector space and𝑇 is a linear
transformation 𝑇 : 𝑉→𝑊. The dimension of an affine subspace is defined as the
dimension of the kernel:ker(𝑇). Finally,(𝑘−1)-dimensional affine space of a vector
space 𝑉, whose dimension is𝑘, is called anaffine hyperplane.
We say that{𝑣 0, . . . , 𝑣 𝑘}⊂R𝑛 are ingeneral positionor areaffinely independentif
they are not contained in any(𝑘−1)-dimensional affine subspace, or equivalently if
{𝑣 1−𝑣 0, . . . , 𝑣 𝑘−𝑣 0}are linearly independent.
Definition 1. A 𝑘-simplex denoted by 𝜎 is the convex hull of 𝑘+ 1 points
𝑣 0, . . . , 𝑣 𝑘∈R𝑛 in general position, i.e
𝜎 =
( 𝑘Õ
𝑖=0
𝑡𝑖𝑣 𝑖∈R𝑛 :
𝑘Õ
𝑖=0
𝑡𝑖 = 1, 𝑡𝑖≥0
)
.
The set 𝜎⊂R𝑛 is given the subspace topology. We also say that𝑣 0, . . . , 𝑣 𝑘 are
the vertices of the𝑘-simplex and the integer𝑘 is the dimension of𝜎. Notation
⟨𝑣 0, . . . , 𝑣 𝑘⟩denote the simplex spanned by𝑣 0, . . . , 𝑣 𝑘.
Let’s remember in addition that the convex hull of any subset𝐴⊂R𝑛 is the
intersection of all convex sets containing𝐴. One can express the convex hull, as above,
in barycentric coordinates, i.e. as a nonnegative weighted combination of the vertices,
where the weights sum up to one. Next image shows a 0, 1, 2 and 3-simplex.
According to our Definition 1, we can notice that we cannot have a𝑚-simplex in
R𝑛 if 𝑚 > 𝑛.
If 𝜎 is a𝑘-simplex, then:
• we call a simplex spanned by a subset of the vertices of𝜎 aface,
• the faces that are different to𝜎 itself are calledproper faces,


## Page 5

Solving Differential Equations with Discrete Exterior Calculus
• 0-dimensional and 1-dimensional faces of𝜎 are vertices and edges respectively,
• the union of all proper faces is called theboundary of 𝜎 and denoted by Bd𝜎,
• the interiorof 𝜎 is given by Int𝜎 = 𝜎\Bd 𝜎.
Itcanbeshownthatevery 𝑘-simplexisa 𝑘-dimensionalmanifoldwithboundary.
A 𝑛-dimensionalmanifoldwithboundaryisasecondcountableHausdorffspacewhere
each point has a neighborhood homeomorphic to an open subset of the𝑛-dimensional
upper half spaceH :={(𝑥1, . . . , 𝑥 𝑛)∈R𝑛 : 𝑥𝑛≥0}. Let’s recall that a topological space
𝑋 is said to be Hausdorff if for every pair of distinct points𝑝1 and 𝑝2 there exist to
disjoint neighborhoods of𝑝1 and 𝑝2. In the other hand, a topological space𝑋 is said to
be countable if it has a countable basis.
We desire an estructure that is a bunch of simplices connected or linked nicely in
some way:
Definition 2.An Euclidean simplicial complex ia a collection𝒦of simplices in
R𝑛 such that:
i) If 𝜎∈𝒦, then each face of𝜎 is in𝒦.
ii) The intersection of any two simplices in𝒦is either empty or a face of each.
The dimension of𝒦is the maximum dimension of any simplex in𝒦.
1.2 Abstract Simplicial Complexes
The notion of Euclidean simplicial complexes can be generalized in order to work
with different objects other than subsets of Euclidean spaces. We give a more abstract
definitionofSimplicialComplexeswhereweonlycareabouthowthingsareconnected
to each other and not how they are located geometrically:
Definition 3. An Abstract Simplicial Complex is a collection𝒦of nonempty
finite sets called abstract simplices with the following condition: If𝜏∈𝒦, then
every nonempty subset of𝜏 is in𝒦. In addition:
• The dimension of an abstract simplex consisting of𝑘+ 1vertices is defined
to be𝑘.
• The dimension of𝒦is the maximum dimension of any simplex in𝒦, if it
exists. Otherwise𝒦is said to be infinite-dimensional.
• We say that𝒦is a finite complex if𝒦is a finite set.
• Any element of a simplex𝜏∈𝒦is called a vertex of𝜏, and a nonempty
subset of𝜏 is called a face of𝜎.
• A subset of𝒦that is itself a simplicial complex is called a subcomplex of
𝒦.
Page 4


## Page 6

Solving Differential Equations with Discrete Exterior Calculus
1.3 Oriented Simplicial Complex
Wedesiretohavethenotionoforientationina 𝑘-simplex. Wecanthinka 𝑘-simplexas
an array of𝑘+ 1 vertices. This array can be sorted in many ways. Having this in mind
the following definition is presented in [9].
Definition 4. Let 𝜎 be a simplex (either geometric or abstract). Define two
orderings of its vertex set to be equivalent if they differ from one another by an
even permutation. Ifdim 𝜎 > 0, the orderings of the vertices of𝜎 then fall into
twoequivalenceclasses. Eachoftheseclassesiscalledan orientation of 𝜎. If 𝜎 is
a 0-simplex, then there is only one class and hence only one orientation of𝜎. An
oriented simplexis a simplex𝜎 together with an orientation of𝜎.
We will use the symbol
𝑣 0, . . . , 𝑣 𝑘
to denote the simplex they span. The symbol
[𝑣 0, . . . , 𝑣 𝑘]
willdenotetheorientedsimplexconsistingofthesimplex 𝑣 0, . . . , 𝑣 𝑘andtheequivalence
class of the particular ordering(𝑣 0, . . . , 𝑣 𝑘). An oriented simplicial complex is a
simplicial complex whose simplices are oriented simplices.
We can compare to simplices by its orientation as it is explained in [2]. If we
have a 𝑘-simplex complex 𝜎 = [𝑣 0, . . . , 𝑣 𝑘], then the induced orientation on each
of the(𝑘−1)-simplices is given by the equivalence class represented by the simplex
[𝑣 0, . . . ,ˆ𝑣 𝑖 , . . . , 𝑣 𝑛]whereˆ𝑣 𝑖 means 𝑣 𝑖 is omitted. For example if we have a2−simplex
[𝑣 0, 𝑣 1, 𝑣 2]the induced orientation of each of its 1-dimensional faces correspond to
[𝑣 1, 𝑣 2],[𝑣 0, 𝑣 2]and[𝑣 0, 𝑣 1].
Now, given two adjacent 𝑘−simplices (ie they share a maximal face) we can
compare their orientations as follows:
Definition5. Twoadjacentorientedsimpliceshavethesame relativeorientation
if the (maximal) faces in their intersection have opposite orientation considering
both orientations induced by each simplex.
Figure 1.1 presents an easy example in order to understand the notion of relative
orientation.
The notion of relative orientation allows to define what is a primal mesh:
Definition 6. A primal mesh with dimension 𝑛 is a simplicial complex
with dimension 𝑛 such that every adjacent𝑛-simplices have the same relative
orientation.
Page 5


## Page 7

Solving Differential Equations with Discrete Exterior Calculus
Figure 1.1: No, I didn’t swap them.
1.4 Dual Complex of a Simplicial Complex
First, let’s remember from elementary school what a circumcenter is. We take the
following definition from Hirani’s thesis [6] :
Definition7. Thecircumcenterofa 𝑘-simplex 𝜎⊂R𝑘 denotedby 𝑐(𝜎)isgivenby
the center of the unique𝑘-sphere that has all𝑘+ 1 vertices of𝜎 on its surface. If
thecircumcenterofasimplexliesinitsinteriorwecallitawell-centeredsimplex.
Asimplicialcomplexallofwhosesimplices(ofalldimensions)arewell-centered
will be called a well-centered simplicial complex.
Image below shows on the left a well-centered3-simplex and on the right a3-
simplex which is not well-centered.
As mention in [6], the circumcenter of a𝑘−simplex can be obtained by taking the
intersection of the normals to the boundary faces, where the normals are emanating
form the circumcenter of the face. In this way one can compute the circumcenter of a
𝑘-simplex in a recursive way.
Letssupposenowthatwehaveasimplicialcomplex 𝒦ofdimension 𝑛. Somehow
wewouldliketoconstructasimplicialcomplex,againofdimension 𝑛,startingfromthe
circumcentersofsimplicesin 𝒦. Inordertoimplementthisprocedurewewillneed 𝒦
to be a well centered simplicial complex, otherwise the circumcenter subdivision may
Page 6


## Page 8

Solving Differential Equations with Discrete Exterior Calculus
not produce a simplicial complex. Following definition is taken from [6]:
Definition8. Thecircumcentersubdivisionofawell-centeredsimplicialcomplex
𝒦of dimension 𝑛 is denoted by csd(𝒦), and it is a simplicial complex
with the same underlying space as𝒦and consisting of all simplices of the
form[𝑐(𝜎1), . . . , 𝑐(𝜎𝑘)]for 𝑘 = 1, . . . , 𝑛 (each index of sigma doesn’t represent
dimensionality). Here 𝜎1≺𝜎2≺···≺𝜎𝑘, which means𝜎𝑖 is a proper face of𝜎𝑗
whenever 𝑖 < 𝑗 and each𝜎𝑖 is in𝒦.
The preceding definition may be confusing, so we present a couple of examples.
Figure 1.2 shows an example with a simplicial complex with dimension𝑛 = 1, ie a
graph. Figure 1.3 is an example for𝑛 = 2 consisting only of a single2-simplex ie a
triangle.
Figure 1.2: On the left it is shown colored in blue the simplicial complex𝒦=(𝑉 , 𝐸).
The 0-simplices ofcsd(𝒦)(on red) consists of the circumcenters𝑐(𝑣)for each 𝑣 ∈𝑉
and 𝑐(𝑒)for every𝑒∈𝐸, note that𝑐(𝑒)is the midpoint of the edge. In the other hand,
1-simplices ofcsd(𝒦)are the two halves of each edge.
This section is concluded with the following definition taken from [6]:
Definition9. Let𝒦beawell-centeredprimalmeshofdimension 𝑛 andlet 𝜎𝑝 be
a simplex in𝒦. Thecircumcenter dual cellof 𝜎𝑝, denoted𝐷(𝜎𝑝), is given by
𝐷(𝜎𝑝)=
𝑛−𝑝Ø
𝑟=0
Ø
𝜎𝑝≺𝜎1≺···≺𝜎𝑟
Int([𝑐(𝜎𝑝)𝑐(𝜎1). . . 𝑐(𝜎𝑟)]).
As in Definition 8,𝜎1≺𝜎2≺···≺𝜎𝑘, means 𝜎𝑖 is a proper face of𝜎𝑗 whenever
𝑖 < 𝑗, and each𝜎𝑖 is in𝒦. For 𝑟 = 0 interpret 𝜎𝑝≺𝜎1≺. . .≺𝜎𝑟 simply as𝜎𝑝.
Finally, the collection of dual cells is called thedual cell decompositionof𝒦.
This is a cell complex and will be denoted𝐷(𝒦).
Page 7


## Page 9

Solving Differential Equations with Discrete Exterior Calculus
Figure 1.3: On the left it is shown colored in blue the simplicial complex𝒦. The
0-simplices of csd(𝒦)(on red) are the circumcenters; each vertex of the triangle, the
midpointsoftheedgesandthecircumcenterofthetriangle. The1-simplicesarethetwo
halves of each edge and edges joining the circumcenter of the triangle to the vertices
and midpoints of the edges.
Definition 9 may be even more confusing that the eighth one. Therefore, an
example is shown above. On the right, the circumcenter dual cells corresponding to
each simplex on the left.
ForpracticalpurposesFigure1.4presentshowthedualmeshisconstructedfrom
the primal mesh. This practical recipe is given in [3]. This will be particularly useful
to construct the discrete Hodge star, which at the same time is needed to discretize the
Laplacian operator (Sections 2.3 and 2.4).
Page 8


## Page 10

Solving Differential Equations with Discrete Exterior Calculus
Figure 1.4: Dual mesh construction
2 Discrete Exterior Calculus
2.1 Discrete Differential Forms
We aim to discretize differential forms. The concept of cochain will be introduced
here as an analogue of differential forms. At the same time, the role of𝑘-manifolds
will be played by𝑘-chains. First, lets understand what a𝑘-chain is with the following
definition taken from [9]
Definition 10. Let𝒦be an oriented simplicial complex. A𝑝-chain on𝒦is a
function 𝑐 from the set of oriented𝑝-simplices of𝐾, denoted by𝒦𝑝, to the reals,
such that:
• 𝑐(𝜎)=−𝑐(𝜎′)if 𝜎 and 𝜎′are the opposite orientations of the same simplex.
• 𝑐(𝜎)= 0for all but finitely many oriented𝑝-simplices 𝜎.
We add 𝑝-chains by adding their values; the resulting group is denoted𝒞𝑝(𝒦)
and its called the group of (oriented)𝑝-chains of𝐾. If 𝑝 < 0 or 𝑝 > dim𝒦), we
let𝒞𝑝(𝒦)denote the trivial group.
Important remark:Usually 𝑝-chains are considered to be functions𝑐 :𝒦𝑝→Z.
As mentioned in [6] it is possible to define𝑝-chains as functions𝑐 :𝒦𝑝→R. This
has the advantage that𝒞𝑝(𝒦)is not only a group, but also a vector space overR with
dimension
𝒦𝑝
. This, according to Hirani, has some advantages. Actually in [4],
𝑝-chains are defined in this way.We will consider𝑝-chains as definition above.
As previous definitions, the above one seems too abstract as well. Nevertheless,
asremarkedinwecanthinkabouta 𝑝-chainsimplyasanarrayortableoftheoriented
𝑝−simplices of the given complex𝒦. An integer is entered corresponding to each
simplex. We can add up to tables by adding up the corresponding entries. Such set of
tables turns out to be an abelian group.
The following figure shows an example of a 0-chain, 1-chain and 2-chain over the
Page 9


## Page 11

Solving Differential Equations with Discrete Exterior Calculus
same simplicial complex of dimension𝑛 = 2. Here 𝑐 only takes integers values, but as
mentioned in the last remark, it could take any real values.
Now we will define a particular chain that will result to be very useful
Definition11. If 𝜎 isanorientedsimplex,the elementarychain 𝑐 corresponding
to 𝜎 is the function defined as follows:
𝑐(𝜎)= 1,
𝑐(𝜎′)=−1, if 𝜎′is the opposite orientation of𝜎,
𝑐(𝜏)= 0 for all other oriented simplices.
Above definition was taken from [9]. For an oriented simplex𝜎, the elementary
chain 𝑐 corresponding to𝜎 will be denoted by𝑐𝜎. It is worth to mention that often the
symbol 𝜎 is used not only to denote a simplex but also to denote the corresponding
chain. Therefore, with this convention you can write𝜎 =−𝜎′. However we will try to
avoid such convention and we’ll use𝑐𝜎 instead.
We can observe that, given a simplicial complex𝒦, the set of elementary chains
correspondingtoeachsimplexin 𝒦𝑝 (consideringonlyoneorientationofeachsimplex)
is a basis for𝒞𝑝(𝒦). Such basis will be denoted by𝛼𝑝.
Now we can define our analogue to differential forms whose role will be played,
as it was already mention, by𝑝−cochains. We’ll consider definition presented in [4]:
Definition 12.Given a simplicial complex𝒦. A 𝑝−cochain is a linear mapping
𝜔 :𝒞𝑝(𝒦)→R.
Let’s remember that𝒞𝑝(𝒦)is a vector space whose dimension is
𝒦𝑝
. Then
the space of𝑝-cochains is also a vector space with dimension
𝒦𝑝
. Therefore, if we
represent each cochains and chains as column vectors, we use following notations
𝜔(𝑐)= 𝜔𝑇 𝑐 =⟨𝜔, 𝑐⟩for each 𝑐∈𝒞𝑝(𝒦).
We connect this subsection with the next one through following definition taken
again from [4]. This definition highlight the analogy of chains and cochains with
manifolds and forms respectively:
Page 10


## Page 12

Solving Differential Equations with Discrete Exterior Calculus
Definition 13.The integral of a𝑝−cochain 𝜔 over a𝑝−chain 𝑐 is defined to be
∫
𝑐
𝜔 = 𝜔(𝑐).
Putting together notations we have for a𝑝-chain 𝑐 and a𝑝-cochain 𝜔 that:
∫
𝑐
𝜔 = 𝜔(𝑐)= 𝜔𝑇 𝑐 =⟨𝜔, 𝑐⟩.
2.2 Discrete Exterior Derivative
Here we aim to define an analogue version of the exterior derivative. First we need to
define the boundary operator𝜕. Definition below is taken from [9]
Definition 14. Let𝒦be a simplicial complex. The boundary operator is a
homomorphism:
𝜕𝑝 :𝒞𝑝(𝒦)→𝒞𝑝−1(𝒦).
If 𝜎 =[𝑣 0, . . . , 𝑣 𝑝]is an oriented simplex with𝑝 > 0, we define
𝜕𝑝(𝑐𝜎)= 𝜕𝑝(𝑐[𝑣 0,...,𝑣 𝑝])=
𝑝Õ
𝑖=0
(−1)𝑖 𝑐[𝑣 0,...,ˆ𝑣 𝑖 ,...,𝑣 𝑝],
wherethesymbol ˆ𝑣 𝑖 meansthatthevertex 𝑣 𝑖 istobedeletedfromthearray. Since
𝒞𝑝(𝒦)is the trivial group for𝑝 < 0, the operator𝜕𝑝 is the trivial homomorphism
for 𝑝≤0.
We observe that the boundary operator𝜕𝑝 is actually a linear transformation.
Therefore 𝜕𝑝 can be represented as a matrix of size
𝒦𝑝−1
×
𝒦𝑝
. As in previous
definitions an example is presented. A very similar example with a hexagon is
explained in [3]. Lets consider the following simplicial complex𝒦:
Page 11


## Page 13

Solving Differential Equations with Discrete Exterior Calculus
Inthisway,forthesimplicialcomplex 𝒦aboveweconsiderthefollowingordered
basis for𝒞0(𝒦),𝒞1(𝒦)and𝒞2(𝒦)
• 0-simplices:
𝛼0 =

𝑐[𝑣 0], 𝑐[𝑣 1], 𝑐[𝑣 2], 𝑐[𝑣 3], 𝑐[𝑣 4]

⊂𝒞0(𝒦).
• 1-simplices:
𝛼1 =

𝑐[𝑣 0,𝑣 1], 𝑐[𝑣 1,𝑣 2], 𝑐[𝑣 2,𝑣 3], 𝑐[𝑣 3,𝑣 4], 𝑐[𝑣 4,𝑣 0], 𝑐[𝑣 4,𝑣 1], 𝑐[𝑣 3,𝑣 1]

⊂𝒞1(𝒦).
• 2-simplices:
𝛼2 =

𝑐[𝑣 0,𝑣 1,𝑣 4], 𝑐[𝑣 4,𝑣 3,𝑣 1], 𝑐[𝑣 1,𝑣 3,𝑣 2]

⊂𝒞2(𝒦).
We compute𝜕1 for each edge:
𝜕1(𝑐[𝑣 0,𝑣 1])= 𝑐[𝑣 1]−𝑐[𝑣 0],
𝜕1(𝑐[𝑣 1,𝑣 2])= 𝑐[𝑣 2]−𝑐[𝑣 1],
𝜕1(𝑐[𝑣 2,𝑣 3])= 𝑐[𝑣 3]−𝑐[𝑣 2],
𝜕1(𝑐[𝑣 3,𝑣 4])= 𝑐[𝑣 4]−𝑐[𝑣 3],
𝜕1(𝑐[𝑣 4,𝑣 0])= 𝑐[𝑣 0]−𝑐[𝑣 4],
𝜕1(𝑐[𝑣 4,𝑣 1])= 𝑐[𝑣 1]−𝑐[𝑣 4],
𝜕1(𝑐[𝑣 3,𝑣 1])= 𝑐[𝑣 1]−𝑐[𝑣 3].
Then thematrix representation of𝜕1 in the ordered basis𝛼1 and 𝛼0 is
[𝜕]1 =
©­­­­­
«
−1 0 0 0 1 0 0
1 −1 0 0 0 1 1
0 1 −1 0 0 0 0
0 0 1 −1 0 0 −1
0 0 0 1 −1 −1 0
ª®®®®®
¬
We observe that𝜕1 is actually the operator𝐷𝑇 =−div on a graph as seen in the first
part of the EDP course [1] in the Discrete Calculus section.
Now we compute𝜕2 for each triangle:
𝜕2(𝑐[𝑣 0,𝑣 1,𝑣 4])= 𝑐[𝑣 1,𝑣 4]−𝑐[𝑣 0,𝑣 4]+ 𝑐[𝑣 0,𝑣 1]= 𝑐[𝑣 0,𝑣 1]+ 𝑐[𝑣 4,𝑣 0]−𝑐[𝑣 4,𝑣 1],
𝜕2(𝑐[𝑣 4,𝑣 3,𝑣 1])= 𝑐[𝑣 3,𝑣 1]−𝑐[𝑣 4,𝑣 1]+ 𝑐[𝑣 4,𝑣 3]=−𝑐[𝑣 3,𝑣 4]−𝑐[𝑣 4,𝑣 1]+ 𝑣[𝑣 3,𝑣 1],
𝜕2(𝑐[𝑣 1,𝑣 3,𝑣 2])= 𝑐[𝑣 3,𝑣 2]−𝑐[𝑣 1,𝑣 2]+ 𝑐[𝑣 1,𝑣 3]=−𝑐[𝑣 1,𝑣 2]−𝑐[𝑣 2,𝑣 3]−𝑐[𝑣 3,𝑣 1].
Then thematrix representation of𝜕2 in the ordered basis𝛼2 and 𝛼1 is
[𝜕]2 =
©­­­­­­­­
«
1 0 0
0 0 −1
0 0 −1
0 −1 0
1 0 0
−1 −1 0
0 1 −1
ª®®®®®®®®
¬
Page 12


## Page 14

Solving Differential Equations with Discrete Exterior Calculus
We can notice that
[𝜕1◦𝜕2]=[𝜕]1[𝜕]2 =
©­­­­­
«
0 0 0
0 0 0
0 0 0
0 0 0
0 0 0
ª®®®®®
¬
.
This is not coincidence. It is always satisfied that𝜕𝑝−1◦𝜕𝑝 = 0 as proved in [9].
We are now ready to discretize the exterior derivative operator:
Definition 15. The 𝑝th discrete exterior derivative of𝜔 is the transpose of the
(𝑝+ 1)st boundary operator:
𝑑𝑝 = 𝜕𝑇
𝑝+1.
Therefore 𝑑𝑝 can be represented by a|𝒦𝑝+1|×|𝒦𝑝|.
The justification of previous definition is that, considering Definition 13, we can
count on the Stokes Theorem in a discrete setting:
∫
𝑐
𝑑𝑝 𝜔 =

𝑑𝑝 𝜔, 𝑐

=
D
𝜕𝑇
𝑝+1𝜔, 𝑐
E
=

𝜔, 𝜕𝑝+1𝑐

=

𝜕𝑝+1𝑐, 𝜔

=
∫
𝜕𝑝+1𝑐
𝜔.
where 𝑐 is a𝑝-chain and𝜔 is a𝑝-cochain.
2.3 The Hodge Star
In this subsection we aim to discretize Hodge star operator inR2. First we need to
understand how Hodge star operator exactly works, and overall, what exactly is the
Hodge star operator. We’ll focus inR2 and everything well be tried to be explained in
a simplified and not too theoretical way as it is done in [3] and [7].
2.3.1 Hodge Star in Exterior Algebra
Inexterioralgebra,theHodgestaroperator,denotedby ★,isananalogueoforthogonal
complementinlinearalgebra. Ingeneral,if 𝑣 isa 𝑘-vector∈R𝑛,then ★𝑣 isa(𝑛−𝑘)-vector
that somehow is a complement in some way [7].
Let’s consider the canonical vector𝑒1∈R2. We aim to find another vector𝑣∈R2
such that they form has area 1. There are multiple choices for𝑣, however, if we desire
orthogonality and standard orientation the unique solution is the canonical vector
𝑣 = 𝑒2. This is what★ operator does, it says that𝑒1 and 𝑒2 are complement between
them. This is,★𝑒1 = 𝑒2 and ★𝑒2 =−𝑒1.
The equation that defines the Hodge star operator for any𝑣∈R2 is
𝑤∧(★𝑣)=⟨𝑤, 𝑣⟩𝑒1∧𝑒2 for every 𝑤∈R2.
Particularly 𝑣∧(★𝑣)=|𝑣|2 𝑒1∧𝑒2issatisfied. Thismeans 𝑣 and ★𝑣 formasquarewhose
area is|𝑣|2. Therefore, for vectors inR2, the Hodge star is just a quarter-rotation in the
counter-clockwise direction as shown below.
Page 13


## Page 15

Solving Differential Equations with Discrete Exterior Calculus
We’ve seen what★does to vectors inR2. Now, let’s see what★does to bivectors.
This, is let’s see what★(𝑣∧𝑤)is for 𝑣, 𝑤 ∈R2. We need to treat bivectors as vectors
not inR2 but in a different space:Ó2 R2. Thus, somehow replicating relation above for
vectors inR2, we have:
(𝑣∧𝑤)∧★(𝑣∧𝑤)= vol(𝑣∧𝑤)2𝑒1∧𝑒2
where vol(𝑣∧𝑤)is the area of𝑣∧𝑤. We know that𝑣∧𝑤 = vol(𝑣∧𝑤)𝑒1∧𝑒2 is a
bivector. Therefore,★(𝑣∧𝑤)has to be a vector, specifically
★(𝑣∧𝑤)= vol(𝑣∧𝑤).
We can notice that★(𝑒1∧𝑒2)= vol(𝑒1∧𝑒2)= 1.
Although explanation above is enough for our purposes, the formal definition of
the Hodge star operator is presented:
Definition 16.Let 𝑉 be a𝑛−dimensional vector space with a symmetric bilinear
form⟨·,·⟩and the orthonormal oriented basis{𝑒1, . . . , 𝑒𝑛}. The Hodge star
operator is a linear operator mapping𝑘-vectors to(𝑛−𝑘)−vectors (𝑘 = 1, . . . , 𝑛)
with the following property which defines it completely:
𝛼∧(★𝛽)=

𝛼, 𝛽

𝑒1∧𝑒2∧···∧𝑒𝑛.
2.3.2 Discrete Hodge Star
We saw above that if𝑣 is a𝑘−vector, then★𝑣 is a(𝑛−𝑘)−vector. In the other hand, in
Section1.4weobservedthatthedualcellofa 𝑘-simplexhasdimension 𝑛−𝑘 (seeimage
below Definition 9). This gives a clue: dual meshes will play some important role that
will help discretize the Hodge star operator.
We’d said that inR2, Hodge star operator only rotates vectors 90 degrees in the
counter-clockwise direction. If we have an edge[𝑎, 𝑏]we get★[𝑎, 𝑏]by rotating[𝑎, 𝑏]
90 degrees around its midpoint. We can see that the dual cell𝐷[𝑎, 𝑏]is in the same
position than★[𝑎, 𝑏]but it has different length.
Page 14


## Page 16

Solving Differential Equations with Discrete Exterior Calculus
However we know that
ℓ(★[𝑎, 𝑏])= ℓ([𝑎, 𝑏])
where ℓ represents the length of an edge. Therefore we have the relationship:
𝐷[𝑎, 𝑏]
ℓ(𝐷[𝑎, 𝑏])= ★[𝑎, 𝑏]
ℓ(★[𝑎, 𝑏])= ★[𝑎, 𝑏]
ℓ([𝑎, 𝑏]).
Thus
𝐷[𝑎, 𝑏]= ℓ(𝐷[𝑎, 𝑏])
ℓ([𝑎, 𝑏])★[𝑎, 𝑏]
If we apply Hodge operator to every 1-simplex (edges) we get the diagonal
Discrete Hodge matrix:
M 1 =
©­­­­­­­­
«
ℓ(𝐷(𝑒1))
ℓ(𝑒1) 0 0 ··· 0
0 ℓ(𝐷(𝑒2))
ℓ(𝑒2) 0 ··· 0
0 0 ℓ(𝐷(𝑒2))
ℓ(𝑒2) ··· 0
... ... ... . . . 0
0 0 0 ···ℓ(𝐷(𝑒𝑚))
ℓ(𝑒𝑚)
ª®®®®®®®®
¬
where
• 𝑒𝑖 is each 1-simplex (edge) in our primal mesh𝒦given in some order,
• 𝐷(𝑒1)is the dual cell of𝑒1, which is again an edge and
• 𝑚 =|𝒦1|is the number of edges in the primal mesh.
In general, let{𝜎𝑘
𝑖}be the𝑘-simplices of𝐾. Then the discrete𝑘th Hodge staris a
diagonal matrix such that
(M 𝑘)𝑖𝑖 =
vol(𝐷(𝜎𝑘
𝑖))
vol(𝜎𝑘
𝑖)
where vol(𝜎)indicatesthelength,areaorvolumeof 𝜎,whichbyconventionequalsone
for a point (vertex).
In section 2.1 we saw that evaluating a discrete manifolds (a chain) in a discrete
form (a cochain) can be thought as integrating a form over a manifold (cells). This
Page 15


## Page 17

Solving Differential Equations with Discrete Exterior Calculus
makes sense with our definition of discretize Hodge star: evaluating a discrete form
over a primal or dual form should be the same in some way, but we need to take into
consideration that primal and dual cells have different volume. Therefore Hodge star
normalize by some ratio of lengths, areas or volumes when mapping between primal
and dual [7].
WecannoticethattheinverseofthediscreteHodgestaroperatortakesdualforms
to primal forms. Particularly
M−1
0 =
©­­­­­­­
«
1
vol(𝐷[𝑣 1]) 0 0 ··· 0
0 1
vol(𝐷[𝑣 2]) 0 ··· 0
0 0 1
vol(𝐷[𝑣 3])··· 0
... ... ... . . . 0
0 0 0 ··· 1
vol(𝐷[𝑣 𝑚])
ª®®®®®®®
¬
willbeusefulforusinordertodiscretizetheLaplacianoperator. Here, 𝑣 𝑖 iseachofthe
𝑚 vertices in the primal mesh.
2.4 Laplacian Operator
Laplace operator is very important because it plays fundamental roles in geometric
and physical contexts. For instance, we know that it appears in diffusion and wave
equations. We may know the classical definition of the Laplacian, but as we aim to
discretize it, we need to write it in a different and convoluted way.
2.4.1 Continuos Laplace Operator
We know that Laplace Operator is defined as follows:
Δ 𝑓 = 𝜕2 𝑓
𝜕𝑥2
1
+ 𝜕2 𝑓
𝜕𝑥2
2
+···+𝜕2 𝑓
𝜕𝑥2
𝑛
.
for any 𝑓 : Ω⊂R𝑛→R such that 𝑓∈𝐶2(Ω). Let’s recall that the divergence operator
is given by
div 𝐹 = 𝜕𝐹1
𝜕𝑥1
+ 𝜕𝐹2
𝜕𝑥1
+···+𝜕𝐹𝑛
𝜕𝑥𝑛
.
where 𝐹 =(𝐹1, . . . , 𝐹𝑛)isadifferentiablevectorfield. WecanwriteLaplaceoperatoras
Δ 𝑓 = div(grad 𝑓).
Such expression is not enough to discretizeΔ.
We’ll focus only inΩ⊂R2. Let 𝑓 : Ω→R a function in𝐶2(Ω). If we apply the
exterior derivative to𝑓 we get a 1-form:
𝑑 𝑓 = 𝜕 𝑓
𝜕𝑥 𝑑𝑥+ 𝜕 𝑓
𝜕𝑦 𝑑𝑦.
Wecanencodea1-forminavectorfieldusingthesharpoperator ♯,flatoperator ♭does
the reverse. Then we have the vector field:
grad 𝑓 =
 𝜕 𝑓
𝜕𝑥 , 𝜕 𝑓
𝜕𝑦

=(𝑑 𝑓)♯.
Page 16


## Page 18

Solving Differential Equations with Discrete Exterior Calculus
Let’s keep that in mind and procede to discretizediv operator. Let 𝐹 =(𝐹1, 𝐹2)
be a differentiable vector field. We know that applying the Hodge star operator to a
1-form inR2 is the same as rotating the 1-form by 90 degrees counter-clockwise. This
is,
★(𝐴 𝑑𝑥+ 𝐵 𝑑𝑦)=−𝐵 𝑑𝑥+ 𝐴 𝑑𝑦.
for any 1-form inR2. Therefore
★𝐹♭ = ★(𝐹1 𝑑𝑥+ 𝐹2 𝑑𝑦)
=−𝐹2 𝑑𝑥+ 𝐹1 𝑑𝑦.
Applying exterior derivative we get:
𝑑 ★ 𝐹♭ = 𝑑(−𝐹2 𝑑𝑥+ 𝐹1 𝑑𝑦)
= 𝑑(−𝐹2 𝑑𝑥)+𝑑(𝐹1 𝑑𝑦)
=−

𝜕𝐹2
𝜕𝑥 𝑑𝑥+ 𝜕𝐹2
𝜕𝑦 𝑑𝑦

∧𝑑𝑥+

𝜕𝐹1
𝜕𝑥 𝑑𝑥+ 𝜕𝐹1
𝜕𝑦 𝑑𝑦

∧𝑑𝑦
=−𝜕𝐹2
𝜕𝑦 𝑑𝑦∧𝑑𝑥+ 𝜕𝐹1
𝜕𝑥 𝑑𝑥∧𝑑𝑦
=

𝜕𝐹1
𝜕𝑥 + 𝜕𝐹2
𝜕𝑦

𝑑𝑥∧𝑑𝑦.
By taking the Hodge star in both sides we get the divergence operator.
★𝑑 ★ 𝐹♭ =

𝜕𝐹1
𝜕𝑥 + 𝜕𝐹2
𝜕𝑦

= div 𝐹.
Finally, substituting in above equation𝐹 = grad 𝑓 and recalling thatgrad 𝑓 =(𝑑 𝑓)♯ we
obtain:
Δ 𝑓 = div(grad 𝑓)= div((𝑑 𝑓)♯)= ★𝑑 ★((𝑑 𝑓)♯)♭ = ★𝑑 ★ 𝑑 𝑓 .
We have gotten the desire expression for the Laplacian:
Δ = ★𝑑 ★ 𝑑.
A similar computing forR3 can be found in [7] (chapter 4).
{0−forms} {1−forms}
{(𝑛−1)−forms}
{0−forms} {𝑛−forms}
𝑑
Δ
★
𝑑
★
Figure 2.1: Exterior derivative operator takes𝑘-forms to(𝑘+ 1)-forms. Hodge star
operator takes𝑘-forms to(𝑛−𝑘)-forms. Recall that0-forms areR𝑛→Rfunctions.
Laplacianalsocanbedefinedfor 𝑘-formsingeneral. ThediscretizationforLaplace
operatorinsuchcaseisgivenby Δ = ★𝑑 ★ 𝑑+ 𝑑 ★ 𝑑★. Notethatif 𝑘 = 0theterm 𝑑 ★ 𝑑★
equals cero (see[7]chapter 6).
Page 17


## Page 19

Solving Differential Equations with Discrete Exterior Calculus
2.4.2 Discrete Laplace Operator
WeaimtodiscretizeLaplaceOperator. Wealreadyhavedonealmostalltheworkaswe
have discretizedΔin terms of★and 𝑑 operators and in addition we have discretized★
and 𝑑 operators.
Let’s suppose that we have a primal mesh𝒦with 𝑁 vertices and𝑀 edges. We
desire to discretizeΔ 𝑓 for 𝑓 ∈𝐶2(Ω)where Ω⊂R2. For each vertex 𝑣 𝑖 we denote
𝑓𝑖 = 𝑓(𝑣 𝑖), 𝑖 = 1, . . . , 𝑁. In section 2.1 we define discrete𝑝-forms to be𝑝-cochains. At
the same time𝑝-cochains can be represented as vectors (arrays) with length
𝒦𝑝
. In
this case, the vector
𝑓 =(𝑓1, 𝑓 2, . . . , 𝑓 𝑁)
is the discrete version of the0-form 𝑓 : Ω→R.
InSection2.2wedefinetheboundaryoperator 𝜕andthediscreteexteriorderivate
to be 𝑑 = 𝜕𝑇. We also saw that𝜕1 can be represented as a𝑁×𝑀 matrix. Therefore
𝑑0 = 𝜕𝑇
1 is a𝑀×𝑁 matrix. Then 𝑑0 𝑓 is a vector inR𝑀 (array of size𝑀) which can be
seen as a discrete 1-form.
NowwehavetoapplytheHodgestaroperator M 1 definedinthelastsubsection.
This will take to 1-form𝑑0 𝑓 to another 1-form but in thedual mesh. This make sense
because M 1𝑑0 𝑓∈R𝑀 and the dual mesh has𝑀 edges as well.
Then, we need to apply another discrete derivate. In this case we can think that
operators 𝜕and 𝑑willswitchrolesoverthedualmesh. Discreteexteriorderivativewill
be in this case the−𝜕1 operator. So far we have−𝜕1M 1𝑑0 𝑓 ∈R𝑁 which is a discrete
2-form in the dual mesh.
Let’s make a brief parenthesis to connect the ideas with the section of Discrete
Calculus in the course. We discretize Laplacian for graphs (simplicial complexes with
dimension 1) asΔ = div grad. Using notation presented here we havegrad = 𝑑0 and
div = 𝜕1. However we didn’t care about how long the edges were. In this case we do,
so we resize calculations via Hodge star operators.
Finally we take another Hodge star operator. Notice that we are in the dual mesh
yet, so we need to return to the primal mesh via theinverseHodge operatorM−1
0 that
takes discrete2-forms in the dual mesh to discrete0-forms in the primal mesh. Notice
that−M−1
0 𝜕1M 1𝑑0 𝑓 ∈R𝑁. The i-th entry of−M−1
0 𝜕1M 1𝑑0 𝑓 takes the valueΔ 𝑓(𝑣 𝑖).
Avoiding subindices we have the Discrete Laplace operator:
Δ = M 𝜕M 𝑑.
Notice that diagram shown in Figure 2.1 also applies to the discrete setting.
3 Solving Differential Equations
3.1 Poisson equation in R
Method explained in this subsection will be useful to solve Poisson equation with
boundary Dirichlet conditions
𝑓′′(𝑥)= 𝑔(𝑥), 𝑥 ∈[𝑎, 𝑏],
𝑓(𝑎)= 𝛼, 𝑓 (𝑏)= 𝛽.
Page 18


## Page 20

Solving Differential Equations with Discrete Exterior Calculus
where 𝑓 is the unknown function.
We explain such method with the simple ODE
𝑓′′(𝑥)= sin(𝑥), 𝑥 ∈[0, 2𝜋],
𝑓(0)= 5, 𝑓 (2𝜋)= 6.
By integrating two times in both sides of the equation we get𝑓(𝑥)=−sin(𝑥)+𝑐1𝑥+ 𝑐2
for constants𝑐1, 𝑐2∈R. Boundary condition 𝑓(0)= 5 implies 𝑐2 = 5. Then, 𝑓(2𝜋)= 6
implies 𝑐1 = 1/2𝜋. Therefore
𝑓(𝑥)=−sin(𝑥)+ 1
2𝜋 𝑥+ 5.
is the ground truth for the solution. Let’s approximate such solution through Discrete
Exterior Calculus.
First we discretize interval[0, 2𝜋]through a partition. For convenience each
subinterval in the partition has same lengthℓ.
We need to compute𝜕1 operator for our simplicial complex:
𝜕1 =
©­­­­­
«
−1 0 0 0
1 −1 0 0
0 1 −1 0
0 0 1 −1
0 0 0 1
ª®®®®®
¬
.
Recall that 𝑑0 = 𝜕𝑇
1. We will need Hodge star matrices as well. For that we need the
dual mesh
We needM 1 and M 0. In this case,M 1 takes primal 1-forms to dual 0-forms:
M 1 =
©­­­­­
«
vol(𝐷[𝑣 1,𝑣 2])
vol([𝑣 1,𝑣 2]) 0 0 0
0 vol(𝐷[𝑣 2,𝑣 3])
vol([𝑣 2,𝑣 3]) 0 0
0 0 vol(𝐷[𝑣 2,𝑣 3])
vol([𝑣 2,𝑣 3]) 0
0 0 0 vol(𝐷[𝑣 3,𝑣 4])
vol([𝑣 3,𝑣 4])
ª®®®®®
¬
=
©­­­
«
1
ℓ 0 0 0
0 1
ℓ 0 0
0 0 1
ℓ 1
0 0 0 1
ℓ
ª®®®
¬
.
On the other hand matrixM 0 takes primal 0-forms to dual 1-forms:
M 0 =
©­­­­­­­­
«
vol(𝐷[𝑣 1])
vol([𝑣 1]) 0 0 0 0
0 vol(𝐷[𝑣 2])
vol([𝑣 2]) 0 0 0
0 0 vol(𝐷[𝑣 3])
vol([𝑣 3]) 0 0
0 0 0 vol(𝐷[𝑣 4])
vol([𝑣 4]) 0
0 0 0 0 vol(𝐷[𝑣 5])
vol([𝑣 5])
ª®®®®®®®®
¬
=
©­­­­­
«
ℓ
2 0 0 0 0
0 ℓ 0 0 0
0 0 ℓ 0 0
0 0 0 ℓ 0
0 0 0 0 ℓ
2
ª®®®®®
¬
.
Page 19


## Page 21

Solving Differential Equations with Discrete Exterior Calculus
Now, we can construct Discrete Laplacian matrix:
Δ =−M−1
0 𝜕1M 1𝑑0 =
©­­­­­
«
−8
𝜋2
8
𝜋2 0 0 0
4
𝜋2
−8
𝜋2
4
𝜋2 0 0
0 4
𝜋2
−8
𝜋2
4
𝜋2 0
0 0 4
𝜋2
−8
𝜋2
4
𝜋2
0 0 0 8
𝜋2
−8
𝜋2
ª®®®®®
¬
.
We have the linear system
Δ 𝑓 =
©­­­­­
«
−8
𝜋2
8
𝜋2 0 0 0
4
𝜋2
−8
𝜋2
4
𝜋2 0 0
0 4
𝜋2
−8
𝜋2
4
𝜋2 0
0 0 4
𝜋2
−8
𝜋2
4
𝜋2
0 0 0 8
𝜋2
−8
𝜋2
ª®®®®®
¬
©­­­­­
«
𝑓1
𝑓2
𝑓3
𝑓4
𝑓5
ª®®®®®
¬
=
©­­­­­
«
sin(𝑣 1)
sin(𝑣 2)
sin(𝑣 3)
sin(𝑣 4)
sin(𝑣 5)
ª®®®®®
¬
where 𝑓𝑖 := 𝑓(𝑣 𝑖). We notice that rank(Δ)= 4. However we know that 𝑓1 = 5 and
𝑓5 = 6. So we only need to solve the system for𝑓2, 𝑓 3 and 𝑓4. We define Δ(𝑎,𝑏)as the
matrix obtained by deleting rows and columns corresponding to vertices𝑣 1 and 𝑣 2 (in
this case rows and columns 1 and 5):
Δ(0,2𝜋)= ©­
«
−8
𝜋2
4
𝜋2 0
4
𝜋2
−8
𝜋2
4
𝜋2
0 4
𝜋2
−8
𝜋2
ª®
¬
.
Matrix Δ(0,2𝜋)has rank equal to 3 so we can solve the linear system
Δ(0,2𝜋)
©­
«
𝑓2
𝑓3
𝑓4
ª®
¬
= ©­
«
sin(𝑣 2)
sin(𝑣 3)
sin(𝑣 4)
ª®
¬
−©­
«
𝑓1Δ2,1+ 𝑓5Δ2,5
𝑓1Δ3,1+ 𝑓5Δ3,5
𝑓1Δ4,1+ 𝑓5Δ4,5
ª®
¬
obtaining values 𝑓2, 𝑓 3 and 𝑓4. In this way, we get the following approximation
Page 20


## Page 22

Solving Differential Equations with Discrete Exterior Calculus
We get can compute the Mean Square Error:
𝑀𝑆𝐸 := 1
𝑁
𝑁Õ
𝑖=1
(𝑓𝑖−𝑦𝑖)2 = 0.021846378853579356.
where 𝑦𝑖 is the ground truth for vertex𝑖.
If we do the same but this time we discretize[0, 2𝜋]with a partition with 200
vertices we obtain a very accurate approximation
Such approximation has a very small error:
𝑀𝑆𝐸 = 3.4338479197291504×10−9.
3.2 Poisson equation in R2
This example was done for a project in a Discrete Differential Geometry course. It was
implemented in Python. We consider Poisson equation with Dirichlet conditions
Δ 𝑓 = 𝑔, (𝑥, 𝑦)∈Ω
𝑓(𝑥, 𝑦)= 𝜑(𝑥, 𝑦) (𝑥, 𝑦)∈𝜕Ω.
Most of the theoretical work has been done in Section 2. Moreover, this example
isalmostthesameasthe1-dimensionalcasebutthistimewehavemorethan2vertices
in 𝜕Ω. We first need to construct a mesh for domainΩ as the one shown in Figure 3.1
but a more refined one. Notice that there are many points of the discretization that are
in 𝜕Ω.
As explained before we only need to construct matrix
Δ =−M−1
0 𝜕1M 1𝑑0
that depends only on the mesh. In this case matricesM 1 and M−1
0 are those shown in
Section 2.3.2. Notice thatΔ is a𝑁×𝑁 matrix where𝑁 is the number of vertices in the
mesh.
Page 21


## Page 23

Solving Differential Equations with Discrete Exterior Calculus
Figure3.1: Discretizationof Ω.
On the other hand, let
𝑏 =(𝑔(𝑣 1), 𝑔(𝑣 2), . . . , 𝑔(𝑣 𝑁))∈R𝑁 .
Then, we have the linear system
Δ 𝑓 = 𝑏.
However, notice that 𝑓 ∈R𝑁 is such that 𝑓𝑖 =
𝜑(𝑣 𝑖)if the 𝑖th vertex is in𝜕Ω. We therefore need to
solve an auxiliar system only for the vertices inΩ:
ΔΩ 𝑓Ω = 𝑏′
Here, as in the 1-dimensional case,ΔΩ is the square matrix obtained by deleting rows
andcolumnscorrespondingtoverticesin 𝜕Ω. Ingeneral,foravector 𝑢∈R𝑁 wedenote
by 𝑢Ω the vector obtained by deleting entries corresponding to vertices in𝜕Ω. Then 𝑏′
is given by
𝑏′= 𝑏Ω−(Δℎ)Ω
where
ℎ𝑖 =

𝑓𝑖 if 𝑣 𝑖∈𝜕Ω,
0 otherwise.
In this way, solving the systemΔΩ 𝑓Ω = 𝑏′we obtain 𝑓(𝑣 𝑖)for vertices inΩ and we
would have gotten an estimation of𝑓 for each vertex in the primal mesh.
If we set
𝑔(𝑥, 𝑦)=−3𝜋

2𝜋 sin

3𝜋
2(𝑥2+ 𝑦 2)

+ 3𝜋(𝑥2+ 𝑦 2)cos

3𝜋
2(𝑥2+ 𝑦 2)

and boundary condition𝜑(𝑥, 𝑦)= 0. We get solution
Page 22


## Page 24

Solving Differential Equations with Discrete Exterior Calculus
On the other hand, DEC approximation is shown below:
Page 23


## Page 25

Solving Differential Equations with Discrete Exterior Calculus
3.3 Heat equation in one dimension
Here we aim to solve numerically Heat equation with Dirichlet boundary condition
𝜕𝑡𝑢 = 𝜕2
𝑥𝑢, 𝑥 ∈(𝑎, 𝑏),
𝑢(𝑎, 𝑡)= 𝛼, 𝑢 (𝑏, 𝑡)= 𝛽.
and initial condition
𝑢(𝑥, 0)= 𝜑(𝑥).
Supposingthattheprimalmeshof [𝑎, 𝑏]has 𝑁 vertices,let’sthinkuasafunction
u : R→R𝑁 where 𝑖th entry u𝑖(𝑡)corresponds to 𝑢(𝑣 𝑖 , 𝑡). We construct matrixΔ as
in Section 3.1. However we need to discretize temporal derivative𝜕𝑡𝑢. We may try
to use a partition{𝑡1, 𝑡2, . . . , 𝑡𝑀}such that 𝑡𝑗+1−𝑡𝑗 = ℎ, initial condition and an ODE
numerical method as Euler’s one:
u(𝑡𝑗+1)= u(𝑡𝑗)+ℎΔu(𝑡𝑗).
ThisschemeiscalledforwardEuler[7](Section6.6). Asmentionedin [7],forwardEuler
isnotnumericallystable. InadditionwecouldnotplugDirichletboundaryconditions
so easily.
Page 24


## Page 26

Solving Differential Equations with Discrete Exterior Calculus
Fortunately we could use another scheme. If we think backwards we can write:
u(𝑡𝑗)= u(𝑡𝑗+1)−ℎΔu(𝑡𝑗+1)=(𝐼−ℎΔ)u(𝑡𝑗+1).
This scheme is called backward Euler and it is far more stable [7]. Nevertheless it is
computationally more expensive as we need to solve system for𝑢(𝑡𝑗):
u(𝑡𝑗)= 𝐴u(𝑡𝑗+1), 𝐴 := 𝐼−ℎΔ.
We can solve this system as we did in Section 3.1 plugging boundary conditions.
An example taken from [10] which was solve as a homework of the EDP course
[1]
Problem1. Arodhaslenght 𝑙 = 1and(diffusion)constant 𝑘 = 1. Itstemperature
satisfies the heat equation. Its left end is held at temperature 0, its right end ar
temperature 1. Initially (at𝑡 = 0) the temperature is given by
𝜑(𝑥)=

5𝑥/2 , 𝑥 ∈[0, 2/3]
3−2𝑥 , 𝑥 ∈[2/3, 1]
We have PDE:
𝜕𝑡𝑢 = 𝜕2
𝑥𝑢, 𝑥 ∈(0, 1),
𝑢(0, 𝑡)= 0, 𝑢 (1, 𝑡)= 1.
and initial condition
𝑢(𝑥, 0)= 𝜑(𝑥).
We saw that exact solution is given in terms of the serie:
𝑢(𝑥, 𝑡)= 𝑥+ 9
𝜋2
∞Õ
𝑛=1
1
𝑛2 exp(−𝑛2𝜋2𝑡)sin

2𝜋𝑛
3

sin(𝑛𝜋𝑥).
Page 25


## Page 27

Solving Differential Equations with Discrete Exterior Calculus
Here, ground truth is taken as the sum of first 100 terms of the serie. Now, we
plot Discrete Exterior Calculus approximation
Page 26


## Page 28

Solving Differential Equations with Discrete Exterior Calculus
Page 27


## Page 29

Solving Differential Equations with Discrete Exterior Calculus
4 Conclusions and future work
Discrete Exterior Calculus is a very useful tool to solve numerically many types of
Partial Differential Equations. It is an alternative to classical Finite Element approach.
The main contributions of this project are:
• Explanations of basic theoretical DEC concepts in a simple way but without
forgetting important theoretical aspects.
• Connect theoretical definitions from Algebraic Topology and Hirani’s thesis [6]
with more practical and applicative concepts from[7]and[3].
• Definitions are visualized through images and figures with a more pedagogical
approach.
• Practical and simple examples of problems that can be solve though DEC.
• DEC applications in Section 3 were made from scratch, except for Example 3.2
that was part of a project in a Discrete Differential Geometry course.
Some work and ideas that can be worked as a future work are:
• ImplementationsofapplicationsinSection3canbedoneinafasterprogramming
language as Julia or C++. Organized libraries con be programmed in order to
work in a more organized and easier way.
• Explore discretizations of other differential operators different from the Laplace
operator. For instance, in [5] and [4] an scheme to solve Darcy Flow Equation is
presented.
• Explore other domains as surfaces inR3 or curves in the plane or space.
• Explore other boundary conditions other than Dirichlet’s.
I would like to thank Juan Parra for providing LaTex template for this project.
Page 28


## Page 30

Solving Differential Equations with Discrete Exterior Calculus
References
[1] Hector Chang. Métodos de matemáticas aplicadas.
[2] Keenan Crane. What is a "mesh?".
[3] Humberto Esqueda, Rafael Herrera, Salvador Botello, and Miguel Moreles.
Discrete exterior calculus for general triangulations. 01 2018.
[4] Andrew Gillette. Notes on discrete exterior calculus.University of Texas at Austin,
2009.
[5] Anil N. Hirani, Kalyana B. Nakshatrala, and Jehanzeb H. Chaudhry. Numerical
method for darcy flow derived using discrete exterior calculus, 2008.
[6] Anil Nirmal Hirani.Discrete exterior calculus. California Institute of Technology,
2003.
[7] MathieuDesbrunKeenanCrane, FernandodeGoes. Digitalgeometryprocessing
with discrete exterior calculus. InACM SIGGRAPH 2013 courses, SIGGRAPH ’13,
New York, NY, USA, 2013. ACM.
[8] J.M. Lee. Introduction to Topological Manifolds. Graduate texts in mathematics.
Springer, 2000.
[9] James R. Munkres. Elements of Algebraic Topology. Addison Wesley Publishing
Company, 1984.
[10] W.A. Strauss.Partial Differential Equations: An Introduction. Wiley, 2007.
Page 29
