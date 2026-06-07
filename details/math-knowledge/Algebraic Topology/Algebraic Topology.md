# Algebraic Topology I: Lecture Notes

Converted from: `Algebraic Topology\Algebraic Topology.pdf`


## Page 1

Lectures on Algebraic Topology
Lectures by Haynes Miller
Notes based on a liveT EXed record made by Sanath Devalapurkar
Pictures by Xianglong Ni
Fall 2016
i


## Page 2

iii
Preface
Over the 2016–2017 academic year, I ran the graduate algebraic topology sequence at MIT. The
ﬁrst semester traditionally deals with singular homology and cohomology and Poicaré duality; the
second builds up basic homotopy theory, spectral sequences, and characteristic classes.
My goal was to give a pretty standard classical approach to these subjects. In the ﬁrst semester,
I had various more speciﬁc objectives as well. I wanted to introduce students to the basic language
of category theory and simplicial sets, so useful throughout mathematics and ﬁnding their ﬁrst real
manifestations in algebraic topology. I wanted to stress the methods of homological algebra, for
similar reasons. And I especially wanted to give an honest account of the machinery – relative cap
product and Čech cohomology – needed in the proof of Poincaré duality. The present document
contains a bit more detail on these last matters than was presented in the course itself.
On the other hand I barely touched on some important subjects. I did not talk about simplicial
complexes at all, nor about the Lefschetz ﬁxed point theorem. I gave only a brief summary of the
theory of covering spaces and the fundamental group, in preparation for a proper understanding
of orientations. I avoided some point set topology by working with only compact subspaces rather
than general closed subspaces in the development of Poincaré duality.
I was lucky enough to have in the audience a student, Sanath Devalapurkar, who spontaneously
decidedtoliveT EXtheentirecourse. Thisresultedinaremarkablyaccuraterecordofwhathappened
in the classroom – right down to random alarms ringing and embarassing jokes and mistakes on
the blackboard. Sanath’s TEX forms the basis of these notes, and I am grateful to him for making
them available. The attractive drawings were provided by another student, Xianglong Ni, who also
carefully proofread the manuscript.
In the course of editing these notes, beyond correcting various errors (while hopefully not intro-
ducting too many new ones), I completed a few arguments not done in detail in the actual lectures
and rearranged some of the material to take full advantage of hindsight. I tried not to do too much
damage to the light and spontaneous character of Sanath’s original notes. I hope you ﬁnd these
notes useful, and I welcome comments or corrections!


## Page 3

Contents
Contents iv
1 Singular homology 1
1 Introduction: singular simplices and chains . . . . . . . . . . . . . . . . . . . . . . . 1
2 Homology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
3 Categories, functors, natural transformations . . . . . . . . . . . . . . . . . . . . . . 6
4 Categorical language . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
5 Homotopy, star-shaped regions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
6 Homotopy invariance of homology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
7 Homology cross product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
8 Relative homology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
9 The homology long exact sequence . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
10 Excision and applications . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
11 The Eilenberg Steenrod axioms and the locality principle . . . . . . . . . . . . . . . . 25
12 Subdivision . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
13 Proof of the Locality Principle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
2 Computational methods 35
14 CW-complexes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 35
15 CW-complexes II . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
16 Homology of CW-complexes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
17 Real projective space . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
18 Euler characteristic and homology approximation . . . . . . . . . . . . . . . . . . . . 44
19 Coeﬃcients . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
20 Tensor product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
21 Tensor and Tor . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
22 The fundamental theorem of homological algebra . . . . . . . . . . . . . . . . . . . . 55
23 Hom and Lim . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
24 Universal coeﬃcient theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
25 Künneth and Eilenberg-Zilber . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 63
3 Cohomology and duality 69
26 Coproducts, cohomology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
27 Ext and UCT . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
28 Products in cohomology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 76
29 Cup product, continued . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
30 Surfaces and nondegenerate symmetric bilinear forms . . . . . . . . . . . . . . . . . . 80
31 Local coeﬃcients and orientations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 83
iv


## Page 4

CONTENTS v
32 Proof of the orientation theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 88
33 A plethora of products . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 91
34 Cap product and “Cech” cohomology . . . . . . . . . . . . . . . . . . . . . . . . . . . 93
35 Cech cohomology as a cohomology theory . . . . . . . . . . . . . . . . . . . . . . . . 97
36 The fully relative cap product . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 100
37 Poincaré duality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 102
38 Applications . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 105
Bibliography 109


## Page 5

Chapter 1
Singular homology
1 Introduction: singular simplices and chains
This is a course on algebraic topology. We’ll discuss the following topics.
1. Singular homology
2. CW-complexes
3. Basics of category theory
4. Homological algebra
5. The Künneth theorem
6. Cohomology
7. Universal coeﬃcient theorems
8. Cup and cap products
9. Poincaré duality.
The objects of study are of course topological spaces, and the machinery we develop in this course
is designed to be applicable to a general space. But we are really mainly interested in geometrically
important spaces. Here are some examples.
• The most basic example isn-dimensional Euclidean space, Rn.
• The n-sphere Sn = {x ∈ Rn+1 : |x| = 1}, topologized as a subspace ofRn+1.
• Identifying antipodal points inSn gives real projective spaceRPn = Sn/(x ∼ −x), i.e. the
space of lines through the origin inRn+1.
• Call an ordered collection ofk orthonormal vectors anorthonormal k-frame. The space of
orthonormal k-frames in Rn forms theStiefel manifoldVk(Rn), topologized as a subspace of
(Sn−1)k.
• The Grassmannian Grk(Rn) is the space ofk-dimensional linear subspaces ofRn. Forming
the span gives us a surjectionVk(Rn) → Grk(Rn), and the Grassmannian is given the quotient
topology. For example,Gr1(Rn) = RPn−1.
1


## Page 6

2 CHAPTER 1. SINGULAR HOMOLOGY
All these examples aremanifolds; that is, they are Hausdorﬀ spaces locally homeomorphic to Eu-
clidean space. Aside fromRn itself, the preceding examples are also compact. Such spaces exhibit
a hidden symmetry, which is the culmination of 18.905: Poincaré duality.
As the name suggests, the central aim of algebraic topology is the usage of algebraic tools to
study topological spaces. A common technique is to probe topological spaces via maps to them
from simpler spaces. In diﬀerent ways, this approach gives rise to singular homology and homotopy
groups. We now detail the former; the latter takes the stage in 18.906.
Deﬁnition 1.1. For n ≥ 0, the standard n-simplex ∆n is the convex hull of the standard basis
{e0,...,e n} in Rn+1:
∆n =
{∑
tiei :
∑
ti = 1,ti ≥ 0
}
⊆ Rn+1.
The ti are calledbarycentric coordinates.
The standard simplices are related by face inclusionsdi : ∆n−1 → ∆n for 0 ≤i ≤n, wheredi is
the aﬃne map that sends verticies to vertices, in order, and omits the vertexei.
11
2
0 1
0
1
0
1
0 1
Deﬁnition 1.2. Let X be any topological space. Asingular n-simplex in X is a continuous map
σ : ∆n →X. Denote bySinn(X) the set of alln-simplices inX.
This seems like a rather bold construction to make, asSinn(X) is huge. But be patient!
For 0 ≤i ≤n, precomposition by the face inclusiondi produces a mapdi : Sinn(X) → Sinn−1(X)
sending σ ↦→σ ◦di. This is the “ith face” ofσ. This allows us to make sense of the “boundary” of
a simplex, and we are particularly interested in simplices for which that boundary vanishes.
For example, ifσ is a 1-simplex that forms a closed loop, thend1σ = d0σ. To express the
condition that the boundary vanishes, we would like to writed0σ −d1σ = 0 – but this diﬀerence is
no longer a simplex. To accommodate such formal sums, we will enlargeSinn(X) further by forming
the free abelian group it generates.
Deﬁnition 1.3. The abelian group Sn(X) of singular n-chains in X is the free abelian group
generated byn-simplices
Sn(X) = ZSinn(X).
So ann-chain is a ﬁnite linear combination of simplices,
k∑
i=1
aiσi, a i ∈ Z, σ i ∈ Sinn(X).
If n< 0, Sinn(X) is declared to be empty, soSn(X) = 0.


## Page 7

1. INTRODUCTION: SINGULAR SIMPLICES AND CHAINS 3
We can now deﬁne theboundary operator
d: Sinn(X) →Sn−1(X),
by
dσ =
n∑
i=0
(−1)idiσ.
This extends to a homomorphismd: Sn(X) →Sn−1(X) by additivity.
We use this homomorphism to obtain something more tractable than the entirety ofSn(X).
First we restrict our attention to chains with vanishing boundary.
Deﬁnition 1.4. An n-cycle in X is ann-chainc with dc = 0. Notation:
Zn(X) = ker(d :Sn(X) →Sn−1(X)).
For example, ifσ is a1-simplex forming a closed loop, thenσ ∈Z1(X) sincedσ =d0σ −d1σ = 0.
It turns out that there’s a cheap way to produce a cycle:
Theorem 1.5. Any boundary is a cycle; that is,d2 = 0.
We’ll leave the veriﬁcation of this important result as a homework problem. What we have
found, then, is that the singular chains form a “chain complex,” as in the following deﬁnition.
Deﬁnition 1.6.A graded abelian groupis a sequence of abelian groups, indexed by the integers. A
chain complexis a graded abelian group{An} together with homomorphismsd :An →An−1 with
the property thatd2 = 0.
The group ofn-dimensional boundaries is
Bn(X) = im(d :Sn+1(X) →Sn(X)),
and the theorem tells us that this is a subgroup of the group of cycles: the “cheap” ones. If we
quotient by them, what’s left is the “interesting cycles,” captured in the following deﬁnition.
Deﬁnition 1.7. The nth singular homology groupof X is:
Hn(X) = Zn(X)
Bn(X) = ker(d :Sn(X) →Sn−1(X))
im(d :Sn+1(X) →Sn(X)) .
We use the same language for any chain complex: it has cycles, boundaries, and homology
groups. The homology forms a graded abelian group.
Both Zn(X) and Bn(X) are free abelian groups because they are subgroups of the free abelian
groupSn(X), but the quotientHn(X) isn’t necessarily free. WhileZn(X) andBn(X) are uncount-
ably generated,Hn(X) turns out to be ﬁnitely generated for the spaces we are interested in. IfT is
the torus, for example, then we will see thatH1(T ) ∼= Z ⊕ Z, with generators given by the 1-cycles
illustrated below.


## Page 8

4 CHAPTER 1. SINGULAR HOMOLOGY
We will learn to compute the homology groups of a wide variety of spaces. Then-sphere for
example has the following homology groups:
Hq(Sn) =



Z if q =n> 0
Z if q = 0,n> 0
Z ⊕ Z if q =n = 0
0 otherwise.
2 Homology
In the last lecture we introduced the standardn-simplex ∆n ⊆ Rn+1. Singular simplices in a space
X are mapsσ : ∆n →X and constitute the setSinn(X). For example, Sin0(X) consists of points
of X. We also described the face inclusionsdi : ∆n−1 → ∆n, and the induced “face maps”
di : Sinn(X) → Sinn−1(X), 0 ≤i ≤n,
given by precomposing with face inclusions:diσ = σ ◦di. For homework you established some
quadratic relations satisﬁed by these maps. A collection of setsKn,n ≥ 0, together with maps
di :Kn →Kn−1 related to each other in this way, is asemi-simplicial set. So we have assigned to
any spaceX a semi-simplicial setS∗(X).
To the semi-simplicial set{Sinn(X),di}we then applied the free abelian group functor, obtaining
asemi-simplicialabeliangroup. Usingthe dis, weconstructedaboundarymap dwhichmakes S∗(X)
a chain complex – that is,d2 = 0. We capture this process in a diagram:
{spaces}
Sin∗
↓↓
H∗ →→ {graded abelian groups}
{semi-simplicial sets}
Z(−)
↓↓
{semi-simplicial abelian groups} →→ {chain complexes}
take homology
↑↑
Example 2.1.Suppose we haveσ : ∆1 →X. Deﬁneφ: ∆1 → ∆1 by sending(t, 1 −t) to (1 −t,t ).
Precomposing σ with φ gives another singular simplexσ which reverses the orientation ofσ. It is
not true thatσ = −σ in S1(X).
However, we claim thatσ ≡ −σ modB1(X). This means that there is a2-chain inX whose
boundary isσ +σ. Ifd0σ =d1σ, so thatσ ∈Z1(X), thenσ and −σ are homologous: [σ] = −[σ] in
H1(X).
To construct an appropriate boundary, consider the projection mapπ : ∆2 → ∆1 that is the
aﬃne extension of the map sendinge0 and e2 to e0 and e1 to e1.
2 0
1 1
0


## Page 9

2. HOMOLOGY 5
We’ll computed(σ ◦π). Some of the terms will be constant singular simplices. Let’s write
cn
x : ∆n →X for the constant map with valuex ∈X. Then
d(σ ◦π) =σπd0 −σπd1 +σπd2 =σ −c1
σ(0) +σ.
The constant simplexc1
σ(0) is an “error term,” and we wish to eliminate it. To achieve this we can
use the constant2-simplex c2
σ(0) at σ(0); its boundary is
c1
σ(0) −c1
σ(0) +c1
σ(0) =c1
σ(0).
So
σ +σ =d(σ ◦π +c2
σ(0)),
and σ ≡ −σ modB1(X) as claimed.
Some more language: two cycles that diﬀer by a boundarydc are said to behomologous, and
the chainc is ahomology between them.
Let’s compute the homology of the very simplest spaces,∅ and ∗. For the ﬁrst,Sinn(∅) = ∅,
so S∗(∅) = 0. Hence · · · → S2 → S1 → S0 is the zero chain complex. This means thatZ∗(∅) =
B∗(∅) = 0. The homology in all dimensions is therefore0.
For ∗, we haveSinn(∗) = {cn
∗ } for alln ≥ 0. ConsequentlySn(∗) = Z forn ≥ 0 and 0 forn< 0.
For eachi, dicn
∗ = cn−1
∗ , so the boundary mapsd: Sn(∗) → Sn−1(∗) in the chain complex depend
on the parity ofn as follows:
d(cn
∗) =
n∑
i=0
(−1)icn−1
∗ =
{
cn−1
∗ for n even, and
0 for n odd.
This means that our chain complex is:
0 ← Z 0← −Z 1← −Z 0← −Z 1← − · · ·.
The boundaries coincide with the cycles except in dimension zero, whereB0(∗) = 0 whileZ0(∗) = Z.
Therefore H0(∗) = Z and Hi(∗) = 0 for i ̸= 0.
We’ve deﬁned homology groups for each space, but haven’t yet considered what happens to
maps between spaces. A continuous mapf : X → Y induces a mapf∗ : Sinn(X) → Sinn(Y ) by
composition:
f∗ :σ ↦→f ◦σ.
Forf∗ to be a map of semi-simplicial sets, it needs to commute with face maps: We needf∗ ◦di =
di ◦f∗. A diagram is said to becommutative if all composites with the same source and target are
equal, so this equation is equivalent to commutativity of the diagram
Sinn(X)
f∗ →→
di
↓↓
Sinn(Y )
di
↓↓
Sinn−1(X)
f∗ →→ Sinn−1(Y ).
Well,dif∗σ = (f∗σ) ◦di = f ◦σ ◦di, andf∗(diσ) = f∗(σ ◦di) = f ◦σ ◦di as well. The diagram
remains commutative when we pass to the free abelian groups of chains.


## Page 10

6 CHAPTER 1. SINGULAR HOMOLOGY
IfC∗ andD∗ are chain complexes, achain mapf : C∗ →D∗ is a collection of mapsfn : Cn →Dn
such that the following diagram commutes for everyn:
Cn
fn →→
dC
↓↓
Dn
dD
↓↓
Cn−1
fn−1 →→Dn−1
For example, iff : X →Y is a continuous map, thenf∗ : S∗(X) →S∗(Y ) is a chain map as discussed
above.
A chain map induces a map in homologyf∗ : Hn(C) → Hn(D). The method of proof is a so-
called “diagram chase” and it will be the ﬁrst of many. We check that we get a mapZn(C) →Zn(D).
Let c ∈ Zn(C), so thatdCc = 0. Then dDfn(c) = fn−1dCc = fn−1(0) = 0, because f is a chain
map. This means thatfn(c) is also ann-cycle, i.e.,f gives a mapZn(C) →Zn(D).
Similarly, we get a mapBn(C) → Bn(D). Let c ∈ Bn(C), so that there existsc′ ∈ Cn+1 such
that dCc′ =c. Then fn(c) = fndCc′ =dDfn+1(c′). Thus fn(c) is the boundary offn+1(c′), andf
gives a mapBn(C) →Bn(D).
The two mapsZn(C) → Zn(D) and Bn(C) → Bn(D) quotient to give a map on homology
f∗ :Hn(X) →Hn(Y ).
3 Categories, functors, natural transformations
From spaces and continuous maps, we constructed graded abelian groups and homomorphisms. We
now cast this construction in the more general language of category theory.
Our discussion of category theory will be interspersed throughout the text, introducing new
concepts as they are needed. Here we begin by introducing the basic deﬁnitions.
Deﬁnition 3.1. A category C consists of the following data.
• a class ob(C) of objects;
• for every pair of objectsX and Y, a set ofmorphisms C(X,Y );
• for every objectX an identity morphism 1X ∈ C(X,X ); and
• for every triple of objectsX,Y,Z , acompositionmap C(X,Y ) × C(Y,Z ) → C (X,Z ), written
(f,g ) ↦→g ◦f.
These data are required to satisfy the following:
• 1Y ◦f =f, andf ◦ 1X =f.
• Composition is associative:(h ◦g) ◦f =h ◦ (g ◦f).
Note that we allow the collection of objects to be a class. This enables us to talk about a
“category of all sets” for example. But we require eachC(X,Y ) to be set, and not merely a class.
Some interesting categories have aset of objects; they are calledsmall categories.
We will often writeX ∈ C to meanX ∈ ob(C), andf : X →Y to meanf ∈ C(X,Y ).


## Page 11

3. CATEGORIES, FUNCTORS, NATURAL TRANSFORMATIONS 7
Deﬁnition 3.2. If X,Y ∈ C, thenf : X → Y is an isomorphism if there existsg : Y → X with
f ◦g = 1Y and g ◦f = 1X. We may write
f :X
∼=− →Y
to indicate thatf is an isomorphism.
Example 3.3. Many common mathematical structures can be arranged in categories.
• Sets and functions between them form a categorySet.
• Abelian groups and homomorphisms form a categoryAb.
• Topological spaces and continuous maps form a categoryTop.
• Chain complexes and chain maps form a categorychAb.
• A monoid is the same as a category with one object, where the elements of the monoid are
the morphisms in the category. It’s a small category.
• The sets [n] = {0,...,n } for n ≥ 0 together with weakly order-preserving maps between
them form thesimplex category∆, another small category. It contains as a subcategory the
semi-simplex category∆inj with the same objects but only injective weakly order-preserving
maps.
• A partially ordered set or “poset” forms a category in which there is a morphism fromx to y
iﬀx ≤y. A small category is a poset exactly when (1) there is at most one morphism between
any two objects, and (2) the only isomorphisms are identities. This is to be distinguished
from the category of posets and order-preserving maps between them, which is “large.”
Categoriesmayberelatedtoeachotherbyrulesdescribingeﬀectonbothobjectsandmorphisms.
Deﬁnition 3.4. Let C, D be categories. Afunctor F : C → D consists of the data of
• an assignmentF : ob(C) → ob(D), and
• for allX,Y ∈ ob(C), a functionF : C(X,Y ) → D(F (X),F (Y )) .
These data are required to satisfy the following two properties:
• For allX ∈ ob(C), F (1X) = 1F (X) ∈ D(F (X),F (X)), and
• For all composable pairs of morphismsf,g in C, F (g ◦f) =F (g) ◦F (f).
We have deﬁned quite a few functors already:
Sinn : Top → Set, S n : Top → Ab, H n : Top → Ab,
for example. We also have deﬁned, for eachX, a morphism d : Sn(X) → Sn−1(X). This is a
“morphism between functors.” This property is captured by another deﬁnition.


## Page 12

8 CHAPTER 1. SINGULAR HOMOLOGY
Deﬁnition 3.5. Let F,G : C → D be two functors. A natural transformation or natural map
θ : F →G consists of mapsθX : F (X) →G(X) for allX ∈ ob(C) such that for allf : X →Y the
following diagram commutes.
F (X)
F (f)
↓↓
θX →→G(X)
G(f)
↓↓
F (Y )
θY →→G(Y )
So for example the boundary mapd: Sn →Sn−1 is a natural transformation.
Example 3.6.Suppose that C and D are two categories, and assume thatC is small. We may then
form the category of functorsFun(C, D). Its objects are the functors fromC to D, and given two
functorsF,G, Fun(C, D)(F,G ) is the set of natural transformations fromF toG. We let the reader
deﬁne the rest of the structure of this category, and check the axioms. We needed to assume thatC
is small in order to guarantee that there is no more than a set of natural transformations between
functors.
For example, let G be a group (or a monoid) viewed as a one-object category. An object
F ∈ Fun(G, Ab) is simply a group action ofG on F (∗) = A, i.e., a representation ofG in abelian
groups. Given anotherF′ ∈ Fun(G, Ab) with F′(∗) = A′, a natural transformation fromF → F′
is precisely aG-equivariant homomorphismA →A′.
4 Categorical language
Let Vectk be the category of vector spaces over a ﬁeldk, and linear transformations between them.
Given a vector spaceV, you can consider the dualV∗ = Hom(V,k ). Does this give us a functor? If
you have a linear transformationf :V →W, you get a mapf∗ :W∗ →V∗, so this is like a functor,
but the induced map goes the wrong way. This operation does preserve composition and identities,
in an appropriate sense. This is an example of acontravariant functor.
I’ll leave it to you to spell out the deﬁnition, but notice that there is a univeral example of
a contravariant functor out of a categoryC: C → C op, where Cop has the same objects asC, but
Cop(X,Y ) is declared to be the setC(Y,X ). The identity morphisms remain the same. To describe
the composition in Cop, I’ll writefop for f ∈ C (Y,X ) regarded as an element ofCop(X,Y ); then
fop ◦gop = (g ◦f)op.
Then a contravariant functor fromC to D is the same thing as a (“covariant”) functor fromCop
to D.
Let C be a category, and letY ∈ ob(C). We get a mapCop → Set that takesX ↦→ C(X,Y ), and
takes a mapX → W to the map deﬁned by compositionC(W,Y ) → C (X,Y ). This is called the
functor represented byY. It is very important to note thatC(−,Y ) is contravariant, while, on the
other hand, for any ﬁxedX, C(X, −) is a covariant functor (and is said to be “corepresentable” by
X).
Example 4.1. Recall that the simplex category ∆ has objects the totally ordered sets [n] =
{0, 1,...,n }, with order preserving maps as morphisms. The “standard simplex” gives us a functor
∆: ∆ → Top. Now ﬁx a spaceX, and consider
[n] ↦→ Top(∆n,X ).
This gives us a contravariant functor∆ → Set, or a covariant functor∆op → Set. This functor
carries in it all the face and degeneracy maps we discussed earlier, and their compositions. Let us
make a deﬁnition.


## Page 13

4. CATEGORICAL LANGUAGE 9
Deﬁnition 4.2.Let C be any category. Asimplicial objectin C is a functorK : ∆op → C. Simplicial
objects in C form a category with natural transformations as morphisms. Similarly,semi-simplicial
object in C is a functor∆op
inj → C,
So the singular functorSin∗ gives a functor from spaces to simplicial sets (and so, by restriction,
to semi-simplicial sets).
I want to interject one more bit of categorical language that will often be useful to us.
Deﬁnition 4.3.A morphismf :X →Y in a categoryC is asplit epimorphism(“split epi” for short)
if there existsg :Y →X (called a section or a splitting) such that the compositeY
g
− →X
f
− →Y is
the identity.
Example 4.4. In the category of sets, a mapf :X →Y is a split epimorphism exactly when, for
every element ofY there exists some element ofX whose image inY is the original element. Sof is
surjective. Is every surjective map a split epimorphism? This is equivalent to the axiom of choice!
because a section off is precisely a choice ofx ∈f−1(y) for everyy ∈Y.
Every categorical deﬁnition is accompanied by a “dual” deﬁnition.
Deﬁnition 4.5. A mapg : Y → X is a split monomorphism (“split mono” for short) if there is
f :X →Y such thatf ◦g = 1Y.
Example 4.6. Again let C = Set. Any split monomorphism is an injection: If y,y′ ∈ Y, and
g(y) = g(y′), we want to show thaty =y′. Apply f, to gety =f(g(y)) = f(g(y′)) = y′. But the
injection ∅ →Y is a split monomorphism only ifY = ∅. So there’s an asymmetry in the category
of sets.
Lemma 4.7. A map is an isomorphism if and only if it is both a split epimorphism and a split
monomorphism.
Proof. Easy!
Theimportanceofthesedeﬁnitionsisthis: Functorswillnotingeneralrespect“monomorphisms”
or “epimorphisms,” but:
Lemma 4.8. Any functor sends split epis to split epis and split monos to split monos.
Proof. Apply F to the diagram establishingf as a split epi or mono.
Example 4.9. Suppose C = Ab, and you have a split epif :A →B. Letg :B →A be a section.
We also have the inclusioni : kerf →A, and hence a map
[g i ] :B ⊕ kerf →A.
I leave it to you to check that this map is an isomorphism, and to formulate a dual statement.


## Page 14

10 CHAPTER 1. SINGULAR HOMOLOGY
5 Homotopy, star-shaped regions
We’ve computed the homology of a point. Let’s now compare the homology of a general spaceX
to this example. There’s always a unique mapX → ∗: ∗ is a “terminal object” inTop. We have
an induced map
Hn(X) →Hn(∗) =
{
Z n = 0
0 otherwise.
Any formal linear combinationc = ∑aixi of points ofX is a 0-cycle. The map to ∗ sends c to∑ai ∈ Z. This deﬁnes theaugmentation ϵ :H∗(X) →H∗(∗). If X is nonempty, the mapX → ∗
is split by any choice of point inX, so the augmentation is also split epi. The kernel ofϵ is the
reduced homology ˜H∗(X) of X, and we get a canonical splitting
H∗(X) ∼= ˜H∗(X) ⊕ Z.
Actually, it’s useful to extend the deﬁnition to the empty space by the following device. Extend
the singular chain complex for any space to includeZ in dimension −1, withd :S0(X) →S−1(X)
given by the augmentationϵ sending each 0-simplex to 1 ∈ Z. Let’s write ˜S∗(X) for this chain
complex, and ˜H∗(X) for its homology. WhenX ̸= ∅, ϵ is surjective and you get the same answer
as above. But
˜Hq(∅) =
{
Z forq = −1
0 forq ̸= −1.
This convention is not universally accepted, but I ﬁnd it useful.˜H∗(X) is thereduced homologyof
X.
What other spaces have trivial homology? A slightly non-obvious way to reframe the question
is this:
When do two mapsX →Y induce the same map in homology?
For example, when do1X :X →X and X → ∗ → X induce the same map in homology? If they
do, thenϵ :H∗(X) → Z is an isomorphism.
The key idea is that homology is a discrete invariant, so it should be unchanged by deformation.
Here’s the deﬁnition that makes “deformation” precise.
Deﬁnition 5.1.Letf0,f 1 :X →Y be two maps. Ahomotopy fromf0 tof1 is a maph :X ×I →Y
(continuous, of course) such thath(x, 0) = f0(x) and f(x, 1) = f1(x). We say thatf0 and f1 are
homotopic, and thath is ahomotopy between them. This relation is denoted byf0 ≃f1.
Homotopy is an equivalence relation on maps fromX toY. Transitivity follows from the gluing
lemma of point set topology. We denote by[X,Y ] the set ofhomotopy classesof maps fromX to
Y. A key result about homology is this:
Theorem 5.2 (Homotopy invariance of homology). If f0 ≃ f1, thenH∗(f0) = H∗(f1): homology
cannot distinguish between homotopic maps.
Suppose I have two mapsf0,f 1 :X →Y with a homotopyh :f0 ≃f1, and a mapg :Y →Z.
Composing h with g gives a homotopy betweeng ◦f0 and g ◦f1. Precomposing also works: If


## Page 15

5. HOMOTOPY, STAR-SHAPED REGIONS 11
g :W →X is a map andf0,f 1 :X →Y are homotopic, thenf0 ◦g ≃f1 ◦g. This lets us compose
homotopy classes: we can complete the diagram:
Top(Y,Z ) × Top(X,Y )
↓↓
→→ Top(X,Z )
↓↓
[Y,Z ] × [X,Y ] →→ [X,Z ]
Deﬁnition 5.3. The homotopy category(of topological spaces)Ho(Top) has the same objects as
Top, but Ho(Top)(X,Y ) = [X,Y ] = Top(X,Y )/ ≃.
We may restate Theorem 5.2 as follows:
For eachn, the homology functorHn : Top → Ab factors as Top → Ho(Top) → Ab;
it is a “homotopy functor.”
We will prove this in the next lecture, but let’s stop now and think about some consequences.
Deﬁnition 5.4. A mapf :X →Y is ahomotopy equivalenceif [f] ∈ [X,Y ] is an isomorphism in
Ho(Top). In other words, there is a mapg :Y →X such thatfg ≃ 1Y and gf ≃ 1X.
Such a mapg is ahomotopy inversefor f; it is well-deﬁned only up to homotopy.
Most topological properties are not preserved by homotopy equivalences. For example, com-
pactness is not a homotopy-invariant property: Consider the inclusioni : Sn−1 ⊆ Rn − {0}. A
homotopy inversep : Rn − {0} → Sn−1 can be obtained by dividing a (always nonzero!) vector
by its length. Clearlyp ◦i = 1Sn−1. We have to ﬁnd a homotopyi ◦p ≃ 1Rn−{0}. This is a map
(Rn − {0}) ×I → Rn − {0}, and we can use(v,t ) ↦→tv + (1 −t) v
||v||.
On the other hand:
Corollary 5.5. Homotopy equivalences induce isomorphisms in homology.
Proof. If f has homotopy inverseg, thenf∗ has inverseg∗.
Deﬁnition 5.6. A spaceX is contractibleif the mapX → ∗ is a homotopy equivalence.
Corollary 5.7.LetX be a contractible space. The augmentationϵ :H∗(X) → Z is an isomorphism.
Homotopy equivalences in general may be somewhat hard to visualize. A particularly simple
and important class of homotopy equivalences is given by the following deﬁnition.
Deﬁnition 5.8. An inclusionA ↪→ X is a deformation retractprovided that there is a maph :
X ×I →X such thath(x, 0) = x and h(x, 1) ∈A for allx ∈X and h(a,t ) = a for alla ∈A and
t ∈I.
For example,Sn−1 is a deformation retract ofRn − {0}.
We now set about constructing a proof of homotopy invariance of homology. The ﬁrst step is to
understand the analogue of homotopy on the level of chain complexes.
Deﬁnition 5.9. Let C∗,D∗ be chain complexes, andf0,f 1 : C∗ → D∗ be chain maps. A chain
homotopyh :f0 ≃f1 is a collection of homomorphismsh :Cn →Dn+1 such thatdh +hd =f1 −f0.


## Page 16

12 CHAPTER 1. SINGULAR HOMOLOGY
This relation takes some getting used to. It is an equivalence relation. Here’s a picture (not a
commutive diagram).
· · · →→Cn+1
↓↓
d →→Cn
h
↙↙ ↓↓
d →→Cn−1
h
↙↙ ↓↓
→→ · · ·
· · · →→Dn+1
d →→Dn
d →→Dn−1 →→ · · ·
Lemma 5.10. If f0,f 1 :C∗ →D∗ are chain homotopic, thenf0∗ =f1∗ :H∗(C) →H∗(D).
Proof. We want to show that for everyc ∈Zn(C∗), the diﬀerencef1c −f0c is a boundary. Well,
f1c −f0c = (dh +hd)c =dhc +hdc =dhc.
So homotopy invariance of homology will follow from
Proposition 5.11. Let f0,f 1 : X → Y be homotopic. Then f0∗,f 1∗ : S∗(X) → S∗(Y ) are chain
homotopic.
To prove this we will begin with a special case.
Deﬁnition 5.12. A subsetX ⊆ Rn is star-shaped with respect tob ∈ X if for everyx ∈ X the
interval
{tb + (1 −t)x :t ∈ [0, 1]}
lies inX.
Any nonempty convex region is star shaped. Any star-shaped region X is contractible: A
homotopy inverse toX → ∗ is given by sending∗ ↦→ b. One composite is perforce the identity. A
homotopy from the other composite to the identity1X is given by(x,t ) ↦→tb + (1 −t)x.
So we should expect thatϵ :H∗(X) → Z is an isomorphism ifX is star-shaped. In fact, using
a piece of language that the reader can interpret:
Proposition 5.13.S∗(X) → Z is a chain homotopy equivalence.
Proof. We have mapsS∗(X) ϵ− →Z
η
− →S∗(X) where η(1) = c0
b. Clearly ϵη = 1, and the claim is
that ηϵ ≃ 1 :S∗(X) →S∗(X). The chain mapηϵ concentrates everything at the pointb: ηϵσ =cn
b
for allσ ∈ Sinn(X). Our chain homotopy h : Sq(X) → Sq+1(X) will actually send simplices to


## Page 17

6. HOMOTOPY INVARIANCE OF HOMOLOGY 13
simplices. For σ ∈ Sinq(X), deﬁne the chain homotopy evaluated onσ by means of the following
“cone construction”:h(σ) =b ∗σ, where
(b ∗σ)(t0,...,t q+1) =t0b + (1 −t0)σ
((t1,...,t q+1)
1 −t0
)
.
Explanation: The denominator 1 −t0 makes the entries sum to 1, as they must if we are to apply
σ to this vector. Whent0 = 1, this isn’t deﬁned, but it doesn’t matter since we are multiplying by
1 −t0. So (b ∗σ)(1, 0,..., 0) =b; this is the vertex of the cone.
0
1
0
1
2
Setting t0 = 0, we ﬁnd
d0b ∗σ =σ.
Setting ti = 0 for i> 0, we ﬁnd
dib ∗σ =hdi−1σ.
Using the formula for the boundary operator, we ﬁnd
db ∗σ =σ −b ∗dσ
... unless q = 0, when
db ∗σ =σ −c0
b.
This can be assembled into the equation
db ∗ +b ∗d = 1 −ηϵ
which is what we wanted.
6 Homotopy invariance of homology
We now know that the homology of a star-shaped region is trivial: in such a space, every cycle with
augmentation 0 is a boundary. We will use that fact, which is a special case of homotopy invariance
of homology, to prove the general result, which we state in somewhat stronger form:
Theorem 6.1. A homotopyh :f0 ≃f1 :X →Y determines a natural chain homotopyf0∗ ≃f1∗ :
S∗(X) →S∗(Y ).


## Page 18

14 CHAPTER 1. SINGULAR HOMOLOGY
The proof uses naturality (a lot). For a start, notice that ifk : g0 ≃ g1 : C∗ → D∗ is a chain
homotopy, andj : D∗ → E∗ is another chain map, then the compositesj ◦kn : Cn → En+1 give
a chain homootpy j ◦g0 ≃ j ◦g1. So if we can produce a chain homotopy between the chain
maps induced by the two inclusionsi0,i 1 : X → X ×I, we can get a chain homotopyk between
f0∗ =h∗ ◦i0∗ and f1∗ =h∗ ◦i1∗ in the formh∗ ◦k.
So now we want to produce a natural chain homotopy, with componentskn :Sn(X) →Sn+1(X ×
I). The unit interval hosts a natural 1-simplex given by an identiﬁcation∆1 → I, and we should
imaginek as being given by “multiplying” by that 1-chain. This “multiplication” is a special case of
a chain map
× :S∗(X) ×S∗(Y ) →S∗(X ×Y ),
deﬁned for any two spacesX and Y, with lots of good properties. It will ultimately be used to
compute the homology of a product of two spaces in terms of the homology groups of the factors.
Here’s the general result.
Theorem 6.2. There exists a map× :Sp(X) ×Sq(Y ) →Sp+q(X ×Y ), thecross product, that is:
• Natural, in the sense that iff : X → X′ and g : Y → Y′, anda ∈ Sp(X) and b ∈ Sp(Y ) so
that a ×b ∈Sp+q(X ×Y ), thenf∗(a) ×g∗(b) = (f ×g)∗(a ×b).
• Bilinear, in the sense that(a +a′) ×b = (a ×b) + (a′ ×b), anda × (b +b′) =a ×b +a ×b′.
• The Leibniz rule is satisﬁed, i.e.,d(a ×b) = (da) ×b + (−1)pa ×db.
• Normalized, in the following sense. Let x ∈ X and y ∈ Y. Write jx : Y → X ×Y for
y ↦→ (x,y ), and writeiy : X → X ×Y for x ↦→ (x,y ). If b ∈ Sq(Y ), thenc0
x ×b = (jx)∗b ∈
Sq(X ×Y ), and ifa ∈Sp(X), thena ×c0
y = (iy)∗a ∈Sp(X ×Y ).
The Leibniz rule contains the ﬁrst occurence of the “topologist’s sign rule”; we’ll see these signs
appearing often. Watch for when it appears in our proof.
Proof. We’re going to use induction onp+q; the normalization axiom gives us the casesp+q = 0, 1.
Let’s assume that we’ve constructed the cross-product in total dimensionp +q − 1. We want to
deﬁne σ ×τ for σ ∈Sp(X) and τ ∈Sq(Y ).
Note that there’s a universal example of ap-simplex, namely the identity mapιp : ∆p → ∆p.
It’s universal in the sense anyp-simplexσ : ∆p →X can be written asσ∗(ιp) whereσ∗ : Sinp(∆p) →
Sinp(X) is the map induced byσ. To deﬁneσ ×τ in general, then, it suﬃces to deﬁneιp ×ιq ∈
Sp+q(∆p × ∆q); we can (and must) then takeσ ×τ = (σ ×τ)∗(ιp ×ιq).
Our long list of axioms is useful in the induction. For one thing, ifp = 0 orq = 0, normalization
provides us with a choice. So now assume that bothp andq are positive. We want the cross-product
to satisfy the Leibnitz rule:
d(ιp ×ιq) = (dιp) ×ιq + (−1)pιp ×dιq ∈Sp+q−1(∆p × ∆q)
Since d2 = 0, a necessary condition forιp ×ιq to exist is thatd((dιp) ×ιq + (−1)pιp ×dιq) = 0.
Let’s compute what this is, using the Leibnitz rule in dimensionp +q − 1 where we have it by the
inductive assumption:
d((dιp)×ιq+(−1)pιp×(dιq)) = (d2ιp)×ιq+(−1)p−1(dιp)×(dιq)+(−1)p(dιp)×(dιq)+(−1)qιp×(d2ιq) = 0
because d2 = 0. Note that this calculation would not have worked without the sign!


## Page 19

7. HOMOLOGY CROSS PRODUCT 15
Thesubspace ∆p×∆q ⊆ Rp+1×Rq+1 isconvexandnonempty, andhencestar-shaped. Therefore
we know thatHp+q−1(∆p × ∆q) = 0 (remember, p +q > 1), which means that every cycle is a
boundary. In other words, our necessary condition is also suﬃcient! So, choose any element with
the right boundary and declare it to beιp ×ιq.
The induction is now complete provided we can check that this choice satisﬁes naturality, bilin-
earity, and the Leibniz rule. I leave this as a relaxing exercise for the listener.
The essential point here is that the space supporting the universal pair of simplices –∆p × ∆q
– has trivial homology. Naturality transports the result of that fact to the general situation.
The cross-product that this procedure constructs is not unique; it depends on a choice a choice
of the chainιp ×ιq for each pairp,q with p +q > 1. The cone construction in the proof that
star-shaped regions have vanishing homology provids us with a speciﬁc choice; but it turns out that
any two choices are equivalent up to natural chain homotopy.
We return to homotopy invariance. To deﬁne our chain homotopyhX :Sn(X) →Sn+1(X ×I),
pick any 1-simplexι : ∆1 →I such thatd0ι =c0
1 and d1ι =c0
0, and deﬁne
hXσ = (−1)nσ ×ι.
Let’s compute:
dhXσ = (−1)nd(σ ×ι) = (−1)n(dσ) ×ι +σ × (dι)
But dι =c0
1 −c0
0 ∈S0(I), which means that we can continue (remembering that|∂σ| =n − 1):
= −hXdσ + (σ ×c0
1 −σ ×c0
0) = −hXdσ + (ι1∗σ −ι0∗σ),
using the normalization axiom of the cross-product. This is the result.
7 Homology cross product
In the last lecture we proved homotopy invariance of homology using the construction of a chain
level bilinear cross-product
× :Sp(X) ×Sq(Y ) →Sp+q(X ×Y )
that satisﬁed the Leibniz formula
d(a ×b) = (da) ×b + (−1)pa × (db)
What else does this map give us?
Let’s abstract a little bit. Suppose we have three chain complexesA∗,B∗, andC∗, and suppose
we have maps× :Ap ×Bq →Cp+q that satisfy bilinearity and the Leibniz formula. What does this
induce in homology?
Lemma 7.1. These data determine a bilinear map× :Hp(A) ×Hq(B) →Hp+q(C).
Proof. Let a ∈ Zp(A) and b ∈ Zq(B). We want to deﬁne [a] × [b] ∈ Hp+q(C). We hope that
[a] ×[b] = [a ×b]. We need to check thata ×b is a cycle. By Leibniz,d(a ×b) =da ×b+( −1)pa ×db,
which vanishes becauxea,b are cycles.
Now we need to check that homology class depends only on the homology classes we started
with. So pick other cyclesa′ and b′ in the same homology classes. We want[a ×b] = [a′ ×b′]. In


## Page 20

16 CHAPTER 1. SINGULAR HOMOLOGY
other words, we need to show thata ×b diﬀers froma′ ×b′ by a boundary. We can writea′ =a+da
and b′ =b +db, and compute, using bilinearity:
a′ ×b′ = (a +da) + (b +db) =a ×b +a ×db + (da) ×b + (da) × (db)
We need to deal with the last three terms here. But sinceda = 0,
d(a ×b) = (−1)pa × (db).
Since db = 0,
d((a) ×b) = (da) ×b.
And sinced2b = 0,
d(a ×b) = (da) × (db).
This means thata′ ×b′ and a ×b diﬀer by
d
(
(−1)p(a ×b) +a ×b +a ×db
)
,
and so are homologous.
The last step is to check bilinearity, which is left to the listener.
This gives the following result.
Theorem 7.2. There is a map
× :Hp(X) ×Hq(Y ) →Hp+q(X ×Y )
that is natural, bilinear, and normalized.
We will see that this map is alsouniquely deﬁned by these conditions, unlike the chain-level
cross product.
I just want to mention an explicit choice ofιp ×ιq. This is called the Eilenberg-Zilber chain.
You’re highly encouraged to think about this yourself. It comes from a triangulation of the prism.
The simplices in this triangulation are indexed by order preserving injections
ω : [p +q] → [p] × [q]
Injectivity forcesω(0) = (0, 0) and ω(p +q) = (p,q ). Each such map determines an aﬃne map
∆p+q → ∆p × ∆q of the same name. These will be the singular simplices making upιp ×ιq. To
specify the coeﬃcients, think ofω as a staircase in the rectangle[0,p ] × [0,q ]. LetA(ω) denote the
area under that staircase. Then the Eilenberg-Zilber chain is given by
ιp ×ιq =
∑
(−1)A(ω)ω
0
1 2
3
0
1
2 3
0
1
2 3


## Page 21

8. RELATIVE HOMOLOGY 17
This chain is due to Eilenberg and Mac Lane; the description appears in a paper [4] by Eilenberg
and Moore. It’s very pretty, but it’s combinatorially annoying to check that this satisﬁes the
conditions of the theorem. It provides an explicit chain map
βX,Y :S∗(X) ×S∗(Y ) →S∗(X ×Y )
that satisﬁes many good properties on the nose and not just up to chain homotopy. For example,
it’s associative –
S∗(X) ×S∗(Y ) ×S∗(Z)
βX,Y×1→→
1×βY,Z
↓↓
S∗(X ×Y ) ×S∗(Z)
βX×Y,Z
↓↓
S∗(X) ×S∗(Y ×Z)
βX,Y×Z →→S∗(X ×Y ×Z)
commutes – andcommutative –
S∗(X) ×S∗(Y )
βX,Y →→
T
↓↓
S∗(X ×Y )
S∗(T )
↓↓
S∗(Y ) ×S∗(X)
βY,X →→→→S∗(X ×Y )
commutes, where on spacesT (x,y ) = (y,x ), and on chain complexesT (a,b ) = (−1)pq(b,a ) when a
has degreep and b has degreeq.
We will see that these properties hold up to chain homotopy for any choice of chain-level cross
product.
8 Relative homology
An ultimate goal of algebraic topology is to ﬁnd means to compute the set of homotopy classes
of maps from one space to another. This is important because many geometrical problems can be
rephrased as such a computation. It’s a lot more modest than wanting to characterize, somehow,
all continuous maps fromX to Y; but the very fact that it still contains a great deal of interesting
information means that it is still a very challenging problem.
Homology is in a certain sense the best “additive” approximation to this problem; and its ad-
ditivity makes it much more computable. To justify this, we want to describe the sense in which
homology is “additive.” Here are two related aspects of this claim.
1. If A ⊆X is a subspace, thenH∗(X) a combination ofH∗(A) and H∗(X −A).
2. The homologyH∗(A ∪B) is likeH∗(A) +H∗(B) −H∗(A ∩B).
The ﬁrst hope is captured by the long exact sequence of a pair, the second by the Mayer-Vietoris
Theorem. Both facts show that homology behaves like a measure. The precise statement of both
facts uses the machinery of exact sequences. I’ll use the following language.
Deﬁnition 8.1. A sequenceof abelian groups is a diagram of abelian groups of the form
· · · →Cn+1
fn
− →Cn
fn−1
− − − →Cn−1 → · · · ,
in which all composites are zero; that is,imfn ⊆ kerfn−1 for alln. It isexact at Cn provided that
this inequality is an equality.


## Page 22

18 CHAPTER 1. SINGULAR HOMOLOGY
A sequence is just another name for a chain complex; it is exact atCn if and only ifHn(C∗) = 0.
So homology measures the failure of exactness.
Example 8.2.Sequences may be zero forn large or forn small. We may just not write them down
if all the groups from some point on are zero. For example,0 → A i− →B is exact iﬀi is injective,
and B
p
− →C → 0 is exact iﬀp is surjective.
Exactness was a key concept in the development of algebraic topology, and “exact” is a great
word for the concept. A foundational treatment [5] of algebraic topology was published by Sammy
Eilenberg and Norman Steenrod in 1952. The story goes that in the galleys for the book they left
a blank space whenever the word representing this concept was used, and ﬁlled it in at the last
minute.
Deﬁnition 8.3. A short exact sequenceis an exact sequence of the form
0 →A i− →B
p
− →C → 0.
Any sequence of the formA →B →C expands to a diagram
ker(p)
↘↘
A
↑↑
i →→B
p →→
↘↘
C
coker(i)
↑↑
It is exact at B if and only if A
∼=− →kerp or, equivalently, coker(i)
∼=− →C. It is short exact if
furthermore i is injective andp is surjective.
We will study the homology of a spaceX by comparing it to the homology of a subspaceA and
a complement or quotient modulo the subspace. Note thatS∗(A) injects intoS∗(X). This suggests
considering the quotient group
Sn(X)
Sn(A) .
This is the group ofrelativen-chains of the pair(X,A ).
Let’s formalize this a bit. Along with the categoryTopof spaces, we have the categoryTop2 of
pairsof spaces. An object ofTop2 is a spaceX together with a subspaceA. A map(X,A ) → (Y,B )
is a continuous mapX →Y that sendsA intoB.
There are four obvious functors relatingTopand Top2:
X ↦→ (X, ∅), X ↦→ (X,X ),
(X,A ) ↦→X, (X,A ) ↦→A.
Do the relative chains form themselves into a chain complex?
Lemma 8.4.LetA∗ be a subcomplex of the chain complexB∗. There is a unique structure of chain
complex on the quotient graded abelian groupC∗ with entriesCn =Bn/An such thatB∗ →C∗ is a
chain map.


## Page 23

9. THE HOMOLOGY LONG EXACT SEQUENCE 19
Proof. To deﬁned : Cn → Cn−1, representc ∈ Cn by b ∈ Bn, and hope that[db] ∈ Bn−1/An−1 is
well deﬁned. If we replaceb byb +a for a ∈An, we ﬁnd
d(b +a) =db +da ≡db mod An−1,
so our hope is justiﬁed. Thend2[b] = [d2b] = 0.
Deﬁnition 8.5. The relative singular chain complexof the pair(X,A ) is
S∗(X,A ) = S∗(X)
S∗(A) .
This is a functor from pairs of spaces to chain complexes. Of course
S∗(X, ∅) =S∗(X), S ∗(X,X ) = 0.
Deﬁnition 8.6. The relative singular homologyof the pair(X,A ) is the homology of the relative
singular chain complex:
Hn(X,A ) =Hn(S∗(X,A )).
One of the nice features of the absolute chain groupSn(X) is that it is free as an abelian group.
This is also the case for its quotentSn(X,A ), since the mapSn(A) →Sn(X) takes basis elements
to basis elements.Sn(X,A ) is freely generated by then-simplices inX that do not lie entirely in
A.
Example 8.7. Consider ∆n, relative to its boundary
∂∆n :=
⋃
imdi ∼=Sn−1.
We have the identity mapιn : ∆n → ∆n, the universaln-simplex, in Sinn(∆n) ⊆Sn(∆n). It is not
a cycle; its boundarydιn ∈ Sn−1(∆n) is the alternating sum of the faces of then-simplex. Each
of these singular simplices lies in∂∆n, sodιn ∈ Sn−1(∂∆n), and [ιn] ∈ Sn(∆n,∂ ∆n) is a relative
cycle. We will see that the relative homologyHn(∆n,∂ ∆n) is inﬁnite cyclic, with generator[ιn].
9 The homology long exact sequence
A pair of spaces(X,A ) gives rise to a short exact sequence of chain complexes:
0 →S∗(A) →S∗(X) →S∗(X,A ) → 0.
In homology, this will relateH∗(A), H∗(X), andH∗(X,A ).
To investigate what happens, let’s suppse we have a general short exact sequence of chain
complexes,
0 →A∗ →B∗ →C∗ → 0,
and study what happens in homology. Clearly the compositeH∗(A) →H∗(B) →H∗(C) is trivial.
Is this sequence exact? Let [b] ∈ Hn(B) such thatg([b]) = 0 . It’s determined by some b ∈ Bn
such that d(b) = 0 . If g([b]) = 0 , then there is somec ∈ Cn+1 such that dc = gb. Now, g is
surjective, so there is someb ∈ Bn+1 such that g(b) = c. Then we can consider db ∈ Bn, and
g(d(b)) = d(c) ∈ Cn. What is b −db? This maps to zero in Cn, so by exactness there is some
a ∈ An such thatf(a) = b −db. Is a a cycle? Well,f(da) = d(fa) = d(b −db) = db −d2b = db,
but we assumed thatdb = 0, sof(da) = 0. This means thatda is zero becausef is an injection by


## Page 24

20 CHAPTER 1. SINGULAR HOMOLOGY
exactness. Therefore a is a cycle. What is[a] ∈Hn(A)? Well,f([a]) = [b −db] = [b]. This proves
exactness ofHn(A) →Hn(B) →Hn(C).
On the other hand,H∗(A) →H∗(B) may fail to be injective, andH∗(B) →H∗(C) may fail to
be surjective. Instead:
Theorem 9.1(The homology long exact sequence). Let 0 →A∗ →B∗ →C∗ → 0 be a short exact
sequence of chain complexes. Then there is a natural homomorphism∂ : Hn(C) → Hn−1(A) such
that the sequence
· · · →→Hn+1(C)
∂
←←
Hn(A) →→Hn(B) →→Hn(C)
∂
←←
Hn−1(A) →→ · · ·
is exact.
Proof. We’ll construct∂, and leave the rest as an exercise. Here’s an expanded part of this short
exact sequence:
0 →→An+1
f →→
d
↓↓
Bn+1
g →→
d
↓↓
Cn+1 →→
d
↓↓
0
0 →→An
f →→
d
↓↓
Bn
g →→
d
↓↓
Cn →→
d
↓↓
0
0 →→An−1
f →→Bn−1
g →→Cn−1 →→ 0
Let c ∈ Cn be a cycle:dc = 0. The mapg is surjective, so pick ab ∈ Bn such thatg(b) = c, and
consider db ∈ Bn−1. Well, g(d(b)) = d(g(b)) = dc = 0. So by exactness, there is somea ∈ An−1
such thatf(a) = db. How many choices are there of pickinga? Only one, becausef is injective.
We need to check thata is a cycle. What isd(a)? Well, d2b = 0, soda maps to 0 under f. But
because f is injective,da = 0, i.e.,a is a cycle. This means we can deﬁne∂[c] = [a].
To make sure that this is well-deﬁned, let’s make sure that this choice of homology classa didn’t
depend on theb that we chose. Pick some otherb′ such thatg(b′) = c. Then there isa′ ∈ An−1
such thatf(a′) = db′. We wanta −a′ to be a boundary, so that[a] = [a′]. We wanta ∈An such
thatda =a −a′. Well,g(b −b′) = 0, so by exactness, there isa ∈An such thatf(a) =b −b′. What
isda? Well,da =d(b −b′) =db −db′. Butf(a −a′) =b −b′, so becausef is injective,da =a −a′,
i.e., [a] = [a′]. I leave the rest of what needs checking to the listener.
Example 9.2. A pair of spaces(X,A ) gives rise to a natural long exact sequence in homology:
· · · →→Hn+1(X,A )
∂
←←
Hn(A) →→Hn(X) →→Hn(X,A )
∂
←←
Hn−1(A) →→ · · ·
.


## Page 25

9. THE HOMOLOGY LONG EXACT SEQUENCE 21
Example 9.3.Let’s think again about the pair(Dn,Sn−1). By homotopy invariance we know that
Hq(Dn) = 0 for q >0, sinceDn is contractible. So
∂ :Hq(Dn,Sn−1) →Hq−1(Sn−1)
is an isomorphism forq >1. The bottom of the long exact sequence looks like this:
0 →→H1(Dn,Sn−1)
←←
H0(Sn−1) →→H0(Dn) →→H0(Dn,Sn−1) →→ 0
When n > 1, both Sn−1 and Dn are path-connected, so the map H0(Sn−1) → H0(Dn) is an
isomorphism, and
H1(Dn,Sn−1) =H0(Dn,Sn−1) = 0.
When n = 1, we discover that
H1(D1,S 0) = Z and H0(D1,S 0) = 0.
The generator ofH1(D1,S 0) is represented by any 1-simplexι1 : ∆ 1 → D1 such that d0ι = c0
1
and d1ι =c0
0 (or vice versa). To go any further in this analysis, we’ll need another tool, known as
“excision.”
We can set this up for reduced homology (as in Lecture 5) as well. Note that any map induces
an isomorphism in ˜S−1, so to a pair(X,A ) we can associate a short exact sequence
0 → ˜S∗(A) → ˜S∗(X) →S∗(X,A ) → 0
and hence a long exact sequence
· · · →→Hn+1(X,A )
∂
←←˜Hn(A) →→ ˜Hn(X) →→Hn(X,A )
∂
←←˜Hn−1(A) →→ · · ·
.
In the example(Dn,Sn−1), ˜H∗(Dn) = 0 and so
∂ :Hq(Dn,Sn−1)
∼=− →˜Hq−1(Sn−1)
for alln and q. This even works whenn = 0; remember thatS−1 = ∅ and ˜H−1(∅) = Z. This is
why I like this convention.
The homology long exact sequence is often used in conjunction with an elementary fact about
a map between exact sequences known as theﬁve lemma. Suppose you have two exact sequences
of abelian groups and a map between them – a “ladder”:
A4
d →→
f4
↓↓
A3
d →→
f3
↓↓
A2
d →→
f2
↓↓
A1
d →→
f1
↓↓
A0
f0
↓↓
B4
d →→B3
d →→B2
d →→B1
d →→B0


## Page 26

22 CHAPTER 1. SINGULAR HOMOLOGY
When can we guarantee that the middle mapf2 is an isomorphism? We’re going to “diagram chase.”
Just follow your nose, making assumptions as necessary.
Surjectivity: Let b2 ∈ B2. We want to show that there is something inA2 mapping to b2.
We can considerdb2 ∈ B1. Let’s assume that f1 is surjective. Then there’s a1 ∈ A1 such that
f1(a1) = db2. What is da1? Well, f0(da1) = d(f1(a1)) = d(db) = 0 . So we want f0 to be
injective. Then da1 is zero, so by exactness of the top sequence, there is somea2 ∈ A2 such that
da2 =a1. What isf2(a2)? To answer this, begin by asking: What isd(f2(a2))? By commutativity,
d(f2(a2)) =f1(d(a2)) =f1(a1) =db2. Let’s considerb2 −f2(a2). This maps to zero underd. So by
exactness, there isb3 ∈ B3 such thatd(b3) = b2 −f2(a2). If we assume thatf3 is surjective, then
there isa3 ∈A3 such thatf3(a3) =b3. But nowd(a3) ∈A2, andf2(d(a3)) =d(f3(a3)) =b2−f2(a2).
This means thatb2 =f(a2 +d(a3)), verifying surjectivity off2.
This proves the ﬁrst half of the following important fact. The second half is “dual” to the ﬁrst.
Proposition 9.4(Five lemma). In the map of exact sequences above,
• If f0 is injective andf1 and f3 are surjective, thenf2 is surjective.
• If f4 is surjective andf3 and f1 are injective, thenf2 is injective.
Very commonly one knows thatf0,f 1,f 3, andf4 are all isomorphisms, and concludes thatf2 is
also an isomorphism. For example:
Corollary 9.5. Let
0 →→A′
∗ →→
f
↓↓
B′
∗ →→
g
↓↓
C′
∗ →→
h
↓↓
0
0 →→A∗ →→B∗ →→C∗ →→ 0
be a map of short exact sequences of chain complexes. If two of the three maps induced in homology
by f,g , andh are isomorphisms, then so is the third.
Here’s an application.
Proposition 9.6.Let (A,X ) → (B,Y ) be a map of pairs, and assume that two ofA →B,X →Y,
and (X,A ) → (Y,B ) induce isomorphims in homology. Then the third one does as well.
Proof. Just apply the ﬁve lemma to the map between the two homology long exact sequences.
10 Excision and applications
We have found two general properties of singular homology: homotopy invariance and the long
exact sequence of a pair. We also claimed thatH∗(X,A ) “depends only onX −A.” You have to
be careful about this. The following deﬁnition gives conditions that will capture the sense in which
the relative homology of a pair(X,A ) depends only on the complement ofA in X.
Deﬁnition 10.1. A triple (X,A,U ) where U ⊆ A ⊆ X, isexcisive if U ⊆ Int(A). The inclusion
(X −U,A −U) ⊆ (X,A ) is then called anexcision.
Theorem 10.2. An excision induces an isomorphism in homology,
H∗(X −U,A −U)
∼=− →H∗(X,A ).


## Page 27

10. EXCISION AND APPLICATIONS 23
So you can cut out closed bits of the interior ofA without changing the relative homology. The
proof will take us a couple of days. Before we give applications, let me pose a diﬀerent way to
interpret the motto “H∗(X,A ) depends only onX −A.” Collapsing the subspaceA to a point gives
us a map of pairs
(X,A ) → (X/A, ∗).
When does this map induce an isomorphism in homology? Excision has the following consequence.
Corollary 10.3. Assume that there is a subspaceB of X such that(1) A ⊆ IntB and (2) A →B
is a deformation retract. Then
H∗(X,A ) →H∗(X/A, ∗)
is an isomorphism.
Proof. The diagram of pairs
(X,A )
↓↓
i →→ (X,B )
↓↓
(X −A,B −A)
k
↓↓
j←←
(X/A, ∗) ı →→ (X/A,B/A) ( X/A − ∗,B/A − ∗)
←←
commutes. We want the left vertical to be a homology isomorphism, and will show that the rest of
the perimeter consists of homology isomorphisms. The mapk is a homeomorphism of pairs whilej
is an excision by assumption (1). The mapi induces an isomorphism in homology by assumption
(2), the long exact sequences, and the ﬁve-lemma. SinceI is a compact Hausdorﬀ space, the map
B ×I →B/A ×I is again a quotient map, so the deformationB ×I →B, which restricts to the
constant deformation onA, descends to show that∗ → B/A is a deformation retract. So the map
ı is also a homology isomorphism. Finally, ∗ ⊆ Int(B/A) in X/A, by deﬁnition of the quotient
topology, so induces an isomorphism by excision.
Now what are some consequences? For a start, we’ll ﬁnally get around to computing the ho-
mology of the sphere. It happens simultaneously with a computation ofH∗(Dn,Sn−1). (Note that
S−1 = ∅.) To describe generators, for eachn ≥ 0 pick a homeomorphism
(∆n,∂ ∆n) → (Dn,Sn−1),
and write
ιn ∈Sn(Dn,Sn−1)
for the corresponding relativen-chain.
Proposition 10.4. Letn> 0 and let ∗ ∈ Sn−1 be any point. Then:
Hq(Sn) =



Z = ⟨[∂ιn+1]⟩ if q =n> 0
Z = ⟨[c0
∗]⟩ if q = 0,n> 0
Z ⊕ Z = ⟨[c0
∗], [∂ι1]⟩ if q =n = 0
0 otherwise
and
Hq(Dn,Sn−1) =
{
Z = ⟨[ιn]⟩ if q =n
0 otherwise.


## Page 28

24 CHAPTER 1. SINGULAR HOMOLOGY
Proof. The division into cases forHq(Sn) can be eased by employing reduced homology. Then the
claim is merely that forn ≥ 0
˜Hq(Sn−1) =
{
Z if q =n − 1
0 if q ̸=n − 1
and the map
∂ :Hq(Dn,Sn−1) → ˜Hq−1(Sn−1)
is an isomorphism. The second statement follows from the long exact sequence in reduced homology
together with the fact that˜H∗(Dn) = 0 since Dn is contractible. The ﬁrst uses induction and the
pair of isomorphisms
˜Hq−1(Sn−1)
∼=← −Hq(Dn,Sn−1)
∼=− →Hq(Dn/Sn−1, ∗)
since Dn/Sn−1 ∼=Sn. The right hand arrow is an isomorphism sinceSn−1 is a deformation retract
of a neighborhood inDn.
Why should you care about this complicated homology calculation?
Corollary 10.5. If m ̸=n, thenSm and Sn are not homotopy equivalent.
Proof. Their homology groups are not isomorphic.
Corollary 10.6. If m ̸=n, then Rm and Rn are not homeomorphic.
Proof. Ifm orn is zero, this is clear, so letm,n> 0. Assume we have a homeomorphismf : Rm →
Rn. This restricts to a homeomorphismRm − {0} → Rn − {f(0)}. But these spaces are homotopy
equivalent to spheres of diﬀerent dimension.
Theorem 10.7(Brouwer ﬁxed-point theorem). If f :Dn →Dn is continuous, then there is some
pointx ∈Dn such thatf(x) =x.
Proof. Suppose not. Then you can draw a ray fromf(x) through x. It meets the boundary ofDn
at a pointg(x) ∈ Sn−1. Check thatg : Dn → Sn−1 is continuous. Ifx is on the boundary, then
x =g(x), sog provides a factorization of the identity map onSn−1 throughDn. This is inconsistent
with our computation because the identity map induces the identity map on˜Hn−1(Sn−1) ∼= Z, while
˜Hn−1(Dn) = 0.


## Page 29

11. THE EILENBERG STEENROD AXIOMS AND THE LOCALITY PRINCIPLE 25
Our computation of the homology of a sphere also implies that there are many non-homotopic
self-maps of Sn, for any n ≥ 1. We will distinguish them by means of the “degree”: A map
f : Sn → Sn induces an endomorphism of the inﬁnite cyclic groupHn(Sn). Any endomorphism
of an inﬁnite cyclic group is given by multiplication by an integer. This integer is well deﬁned
(independent of a choice of basis), and any integer occurs. ThusEnd(Z) = Z×, the monoid of
integers under multiplication. The homotopy classes of self-maps ofSn also form a monoid, under
composition, and:
Theorem 10.8. Letn ≥ 1. The degree map provides us with a surjective monoid homomorphism
deg : [Sn,Sn] → Z×.
Proof. Degree is multiplicative by functoriality of homology.
We construct a map of degreek on Sn by induction onn. If n = 1, this is just the winding
number; an example is given by regardingS1 as unit complex numbers and sendingz to zk. The
proof that this has degreek is an exercise.
Suppose we’ve constructed a mapfk :Sn−1 →Sn−1 of degreek. Extend it to a mapfk :Dn →
Dn by deﬁning fk(tx) = tfk(x) for t ∈ [0, 1]. We may then collapse the sphere to a point and
identify the quotient withSn. This gives us a new mapgk : Sn → Sn making the diagram below
commute.
Hn−1(Sn−1)
fk∗
↓↓
Hn(Dn,Sn−1)
∼=←← ∼= →→
↓↓
Hn(Sn)
gk∗
↓↓
Hn−1(Sn−1) Hn(Dn,Sn−1)
∼=←← ∼= →→Hn(Sn)
The horizontal maps are isomorphisms, sodeggk =k as well.
We will see (in 18.906) that this map is in fact an isomorphism.
11 The Eilenberg Steenrod axioms and the locality principle
Before we proceed to prove the excision theorem, let’s review the properties ofsingular homology
as we have developed them. They are captured by a set of axioms, due to Sammy Eilenberg and
Norman Steenrod [5].
Deﬁnition 11.1. A homology theory(on Top) is:
• a sequence of functorshn : Top2 → Ab for alln ∈ Z and
• a sequence of natural transformations∂ :hn(X,A ) →hn−1(A, ∅)
such that:
• If f0,f 1 : (X,A ) → (Y,B ) are homotopic, thenf0∗ =f1∗ :hn(X,A ) →hn(Y,B ).
• Excisions induce isomorphisms.
• For any pair(X,A ), the sequence
· · · →hq+1(X,A ) ∂− →hq(A) →hq(X) →hq(X,A ) ∂− → · · ·
is exact, where we have writtenhq(X) for hq(X, ∅).


## Page 30

26 CHAPTER 1. SINGULAR HOMOLOGY
• (The dimension axiom): The grouphn(∗) is nonzero only forn = 0.
We add the following “Milnor axiom” [8] to our deﬁnition. To state it, letI be a set and suppose
that for eachi ∈I we have a spaceXi. We can form their disjoint union orcoproduct ∐Xi. The
inclusion mapsXi → ∐Xi induce mapshn(Xi) →hn(∐Xi), and these in turn induce a map from
the direct sum, or coproduct inAb:
α :
⨁
i∈I
hn(Xi) →hn
(∐
i∈I
Xi
)
.
Then:
• The mapα is an isomorphism for alln.
Ordinary singular homology satisﬁes these, withh0(∗) = Z. We will soon add “coeﬃcents” to
homology, producing a homology theory whose value on a point is any prescribed abelian group.
In later developments, it emerges that the dimension axiom is rather like the parallel postulate in
Euclidean geometry: it’s “obvious,” but, as it turns out, the remaining axioms accomodate extremely
interesting alternatives, in whichhn(∗) is nonzero for inﬁnitely many values ofn (both positive and
negative).
Excision is a statement that homology is “localizable.” To make this precise, we need some
deﬁnitions.
Deﬁnition 11.2. Let X be a topological space. A familyA of subsets ofX is acover if X is the
union of the interiors of elements ofA.
Deﬁnition 11.3. Let A be a cover ofX. An n-simplex σ is A-small if there isA ∈ A such that
the image ofσ is entirely inA.
Notice that ifσ : ∆n → X is A-small, then so isdiσ; in fact, for any simplicial operatorφ,
φ∗σ is again A-small. Let’s denote by SinA
∗ (X) the graded set of A-small simplices. This us a
sub-simplicial set ofSin∗(X). Applying the free abelian group functor, we get the subcomplex
SA
∗ (X)
of A-small singular chains. WriteH A
∗ (X) for its homology.
Theorem 11.4 (The locality principle). The inclusionSA
∗ (X) ⊆ S∗(X) induces an isomorphism
in homology,H A
∗ (X)
∼=− →H∗(X).
This will take a little time to prove. Let’s see right now how it implies excision.
Suppose X ⊃ A ⊃ U is excisive, so thatU ⊆ IntA, or Int(X −U) ∪ IntA = X. This if we let
B =X −U, then A = {A,B } is a cover ofX. Rewriting in terms ofB,
(X −U,A −U) = (B,A ∩B),
so we aim to show that
S∗(B,A ∩B) →S∗(X,A )


## Page 31

11. THE EILENBERG STEENROD AXIOMS AND THE LOCALITY PRINCIPLE 27
induces an isomorphism in homology. We have the following diagram of chain complexes with exact
rows:
0 →→S∗(A)
=
↓↓
→→SA
∗ (X)
↓↓
→→SA
∗ (X)/S∗(A)
↓↓
→→ 0
0 →→S∗(A) →→S∗(X) →→S∗(X,A ) →→ 0
The middle vertical induces an isomorphism in homology by the locality principle, so the homology
long exact sequences combine with the ﬁve-lemma to show that the right hand vertical is also a
homology isomorphism. But
SA
n (X) =Sn(A) +Sn(B) ⊆Sn(X)
and a simple result about abelian groups provides an isomorphism
Sn(B)
Sn(A ∩B) = Sn(B)
Sn(A) ∩Sn(B)
∼=− →Sn(A) +Sn(B)
Sn(A) = SA
n (X)
Sn(A) ,
so excision follows.
This case of a cover with two elements leads to another expression of excision, known as the
“Mayer-Vietoris sequence.” In describing it we will use the following notation for the various inclu-
sion.
A ∩B
j1 →→
j2
↓↓
A
i1
↓↓
B i2
→→X
Theorem 11.5 (Mayer-Vietoris). Assume that A = {A,B } is a cover ofX. There are natural
maps ∂ :Hn(X) →Hn−1(A ∩B) such that the sequence
· · ·
β →→Hn+1(X)
∂
←←
Hn(A ∩B) α →→Hn(A) ⊕Hn(B)
β →→Hn(X)
∂
←←
Hn−1(A ∩B) α →→ · · ·
is exact, where
α =
[ j1∗
−j2∗
]
, β = [i1∗ i2∗ ].
Proof. This is the homology long exact sequence associated to the short exact sequence of chain
complexes
0 →S∗(A ∩B) α− →S∗(A) ⊕S∗(B)
β
− →SA
∗ (X) → 0,
combined with the locality principle.


## Page 32

28 CHAPTER 1. SINGULAR HOMOLOGY
The Mayer-Vietoris theorem follows from excision as well, via the following simple observation.
Suppose we have a map of long exact sequences
· · · →→C′
n+1
k →→
h
↓↓
A′
n →→
f
↓↓
B′
n →→
∼=
↓↓
C′
n →→
h
↓↓
· · ·
· · · →→Cn+1
k →→An →→Bn →→Cn →→ · · ·
in which every third arrow is an isomorphism as indicated. Deﬁne a map
∂ :An →Bn
∼=← −B′
n →C′
n.
An easy diagram chase shows:
Lemma 11.6. The sequence
· · · − →C′
n+1

 h
−k


− − − − − − →Cn+1 ⊕A′
n
[
k f
]
− − − − − − →An
∂− − →C′
n − → · · ·
is exact.
To get the Mayer-Vietoris sequence, let{A,B } be a cover ofX and apply the lemma to
· · · →→Hn(A ∩B)
↓↓
→→Hn(B)
↓↓
→→Hn(B,A ∩B)
∼=
↓↓
→→Hn−1(A ∩B)
↓↓
→→Hn−1(B)
↓↓
→→ · · ·
· · · →→Hn(A) →→Hn(X) →→Hn(X,A ) →→Hn−1(A) →→Hn−1(X) →→ · · ·.
12 Subdivision
We will begin the proof of the locality principle today, and ﬁnish it in the next lecture. The key is
a process of subdivision of singular simplices. It will use the “cone construction”b∗ from Lecture 5.
The cone construction dealt with a regionX in Euclidean space, star-shaped with respect tob ∈X,
and gave a chain-homotopy between the identity and the “constant map” onS∗(X):
db ∗ +b ∗d = 1 −ηϵ
where ϵ :S∗(X) → Z is the augmentation andη : Z →S∗(X) sends 1 to the constant 0-chainc0
b.
Let’s see how the cone construction can be used to “subdivide” an “aﬃne simplex.” Anaﬃne
simplex is the convex hull of a ﬁnite set of points in Euclidean space. To make this non-degenerate,
assume that the pointsv0,v 1,...,v n, have the property that{v1 −v0,...,v n −b0} is linearly inde-
pendent. The barycenterof this simplex is the center of mass of the vertices,
b = 1
n + 1
∑
vi.
Start withn = 1. To subdivide a 1-simplex, just cut it in half. For the2-simplex, look at the
subdivision of each face, and form the cone of them with the barycenter of the 2-simplex. This gives
us a decomposition of the 2-simplex into six sub-simplices.


## Page 33

12. SUBDIVISION 29
We want to formalize this process, and extend it to singular simplices (using naturality, of
course). Deﬁne a natural transformation
$ :Sn(X) →Sn(X)
by deﬁning it on standardn-simplex, namely by specifying what$(ιn) is whereιn : ∆n → ∆n is the
universaln-simplex, and then extending by naturality:
$(σ) =σ∗$(ιn).
Here’s the deﬁnition. Whenn = 0, deﬁne $ to be the identity; i.e.,$ι0 =ι0. Forn> 0, deﬁne
$ιn :=bn ∗ $dιn
where bn is the barycenter of∆n. This makes a lot of sense if you draw out a picture, and it’s a
very clever deﬁnition that captures the geometry we described.
The dollar sign symbol is a little odd, but consider: it derives from the symbol for the Spanish
piece of eight, which was meant to be subdivided (so for example two bits is a quarter).
Here’s what we’ll prove.
Proposition 12.1. $ is a natural chain mapS∗(X) →S∗(X) that is naturally chain-homotopic to
the identity.
Proof. Let’s begin by proving that it’s a chain map. We’ll use induction onn. It’s enough to show
that d$ιn = $dιn, because then, for anyn-simplex σ,
d$σ =d$σ∗ιn =σ∗d$ιn =σ∗$dιn = $dσ∗ιn = $dσ.
Dimension zero is easy: sinceS−1 = 0, d$ι0 and $dι0 are both zero and hence equal.
Forn ≥ 1, we want to computed$ιn. This is:
d$ιn =d(bn ∗ $dιn)
= (1 −ηbϵ −bn ∗d)($dιn)
What happens whenn = 1? Well,
ηbϵ$dι1 =ηbϵ$(c0
1 −c0
0) =ηbϵ(c0
1 −c0
0) = 0,


## Page 34

30 CHAPTER 1. SINGULAR HOMOLOGY
since ϵ takes sums of coeﬃcients. So theηbϵ term drops out for anyn ≥ 1. Let’s continue, using
the inductive hypothesis:
d$ιn = (1 −bn ∗d)($dιn)
= $dιn −bn ∗d$dιn
= $dιn −bn$d2ιn
= $dιn
because d2 = 0.
To deﬁne the chain homotopyT, we’ll just write down a formula and not try to justify it. Making
use of naturality, we just need to deﬁneTιn. Here it is:
Tιn =bn ∗ ($ιn −ιn −Tdιn) ∈Sn+1(∆n).
Once again, we’re going to check thatT is a chain homotopy by induction, and, again, we need to
check only on the universal case.
Whenn = 0, the formula givesTι 0 = 0 (which starts the inductive deﬁnition!) so it’s true that
dTι 0 −Tdι 0 = $ι0 −ι0. Now let’s assume thatdTc −Tdc = $c −c for every (n − 1)-chainc. Let’s
start by computingdTιn:
dTιn =dn(bn ∗ ($ιn −ιn −Tdιn))
= (1 −bn ∗d)($ιn −ιn −Tdιn)
= $ιn −ιn −Tdιn −bn ∗ (d$ιn −dιn −dTdιn)
All we want now is thatbn ∗(d$ιn −dιn −dTdιn) = 0. We can do this using the inductive hypothesis,
because dιn is in dimensionn − 1.
dTdιn = −Td (dιn) + $dιn −dιn
= $dιn −dιn
=d$ιn −dιn.
This means thatd$ιn −dιn −dTdιn = 0, soT is indeed a chain homotopy.
13 Proof of the Locality Principle
We have constructed the subdivision operator$ :S∗(X) →S∗(X), with the idea that it will shrink
chains and by iteration eventually render any chainA-small. Does $ succeed in making simplices
smaller? Let’s look ﬁrst at the aﬃne case. Recall that the “diameter” of a subsetX of a metric
space is given by
diam(X) = sup{d(x,y ) :x,y ∈X}.
Lemma 13.1.Letσ be an aﬃnen-simplex, andτ a simplex in$σ. Then diam(τ) ≤ n
n+1diam(σ).
Proof. Suppose that the vertices ofσ arev0,v 1,...,v n. Letb be the barycenter ofσ, and write the
vertices ofτ as w0 =b,w 1,...,w n. We want to estimate|wi −wj|. First, compute
|b −vi| =
⏐⏐⏐⏐
v0 + · · · +vn − (n + 1)vi
n + 1
⏐⏐⏐⏐ =
⏐⏐⏐⏐
(v0 −vi) + (v1 −vi) + · · · + (vn −vi)
n + 1
⏐⏐⏐⏐ .


## Page 35

13. PROOF OF THE LOCALITY PRINCIPLE 31
One of the terms in the numerator is zero, so we can continue:
|b −vi| ≤ n
n + 1 max
i,j
|vi −vj| = n
n + 1diam(σ)
Since wi ∈σ,
|b −wi| ≤ max
i
|b −vi| ≤ n
n + 1diam(σ).
For the other cases, we use induction:
|wi −wj| ≤ diam(simplex in $dσ) ≤ n − 1
n diam(dσ) ≤ n
n + 1diam(σ).
Now let’s transfer this calculation to singular simplices in a spaceX equipped with a coverA.
Lemma 13.2. For any singular chainc, some iterate of the subdivision operator sendsc to an
A-small chain.
Proof. We may assume thatc is a single simplexσ : ∆n →X, because in general you just take the
largest of the iterates of$ needed to send the simplices inc to a A-small chains. We now encounter
another of the great virtues of singular homology: we pullA back to a cover of the standard simplex.
Deﬁne an open cover of∆n by
U := {σ−1(Int(A)) :A ∈ A}.
The space ∆n is a compact metric space, and so is subject to the Lebesgue covering lemma, which
we apply to the open coverU.
Lemma 13.3(Lebesgue covering lemma). LetM be a compact metric space, and letU be an open
cover. Then there isϵ> 0 such that for allx ∈M, Bϵ(x) ⊆U for someU ∈ U.
To apply this, we will have to understand iterates of the subdivision operator.
Lemma 13.4. For anyk ≥ 1, $k ≃ 1 :S∗(X) →S∗(X).
Proof. Weconstruct Tk suchthat dTk+Tkd = $k−1. Tobegin, wetakeT1 =T, sincedT +Td = $−1.
Let’s apply $ to this equation. We get$dT + $Td = $2 − $. Sum up these two equations to get
dT +Td + $dT + $Td = $2 − 1,
which simpliﬁes to
d($ + 1)T + ($ + 1)Td = $2 − 1
since $d =d$.
So deﬁneT2 = ($ + 1)T. Continuing, you see that we can deﬁne
Tk = ($k−1 + $k−2 + · · · + 1)T.
We are now in position to prove the Locality Principle, which we recall:


## Page 36

32 CHAPTER 1. SINGULAR HOMOLOGY
Theorem 13.5 (The locality principle). Let A be a cover of a spaceX. The inclusion SA
∗ (X) ⊆
S∗(X) is a quasi-isomorphism; that is,H A
∗ (X) →H∗(X) is an isomorphism.
Proof. To prove surjectivity letc be ann-cycle inX. We want to ﬁnd anA-small n-cycle that is
homologous toc. There’s only one thing to do. Pickk such that $kc is A-small. This is a cycle
because because $k is a chain map. I want to compare this new cycle withc. That’s what the chain
homotopyTk is designed for:
$kc −c =dTkc +Tkdc =dTkc
since c is a cycle. So$kc and c are homologous.
Now for injectivity. Supposec is a cycle inSA
n (X) such thatc =db for someb ∈Sn+1(X). We
wantc to be a boundary of anA-small chain. Use the chain homotopyTk again: Suppose thatk is
such that$kc is A-small. Compute:
d$kb −c =d($k − 1)b =d(dTk +Tkd)b =dTkc
so
c =d$kb −dTkc =d($kb −Tkc).
Now, $kb is A-small, by choice ofk. Is Tkc also A-small? I claim that it is. Why? It is enough
to show thatTkσ is A-small ifσ is. We know thatσ =σ∗ιn. Because σ is A-small, we know that
σ : ∆n → X is the compositioni∗σ where σ : ∆n → A and i : A → X is the inclusion of some
A ∈ A. By naturality, then,Tkσ =Tki∗σ =i∗Tkσ, which certainly isA-small.
This completes the proof of the Eilenberg Steenrod axioms for singular homology. In the next
chapter, we will develop a variety of practical tools, using these axioms to compute the singular
homology of many spaces.


## Page 37

13. PROOF OF THE LOCALITY PRINCIPLE 33
Lefschetz progeny
According to the Mathematical Genealogy Project, Solomon Lefschetz had 9312 academic descendents as of March 2018. Here are just a
few, with special attention to MIT faculty (marked with an asterisk).
Solomon Lefschetz
Norman Steenrod Ralph Fox Albert Tucker
Frank Peterson∗ George Whitehead∗ Edgar Brown Barry Mazur John Milnor∗ Marvin Minsky∗ John Nash∗
David Anick∗ John Moore Ralph Cohen Noam Elkes Silvio Micali∗ Manuel Blum Patrick Winston∗
Peter May William Browder Haynes Miller∗ Henry Cohn*
Abhinav Kumar*
Bonnie Burger∗ Gary Lee Miller Mike Sipser∗
Mark Behrens∗ Dennis Sullivan∗ George Lusztig∗ Tom Leighton∗ Dan Spielman∗ Andrew Sutherland∗
Curt McMullen Hal Abelson ∗ Peter Shor∗ Ankur Moitra∗


## Page 38

Chapter 2
Computational methods
14 CW-complexes
There are various ways to model geometrically interesting spaces. Manifolds provide one important
model, well suited to analysis. Another model, one we have not talked about, is given by simplicial
complexes. It’s very combinatorial, and constructing a simplicial complex model for a given space
involves making a lot of choices that are combinatorial rather than topological in character. A
more ﬂexible model, one more closely reﬂecting topological information, is given by the theory of
CW-complexes.
In building up a space as a CW-complex, we will successively “glue” cells onto what has been
already built. This is a general construction.
Suppose we have a pair(B,A ), and a mapf :A →X. Deﬁne a spaceX ∪f B (or X ∪AB) in
the diagram
A
f →→↙ ↖
↓↓
X
↓↓
B →→X ∪f B
by
X ∪f B =X ⊔B/ ∼
where the equivalence relation is generated by requiring thata ∼f(a) for alla ∈A. We say that
we have “attachedB to X along f (or alongA).”
There are two kinds of equivalence classes inX ∪f B: (1) singletons containing elements of
B −A, and (2){x} ⊔f−1(x) for x ∈X. The topology onX ∪f B is the quotient topology, and is
characterized by a universal property: any solid-arrow commutative diagram
A
f →→↙ ↖
↓↓
X
j
↓↓ j
↘↘
B →→
g
→→
X ∪f B
↘↘
Y
can be uniquely ﬁlled in. It’s a “push-out.”
35


## Page 39

36 CHAPTER 2. COMPUTATIONAL METHODS
Example 14.1. If X = ∗, then ∗ ∪f B =B/A.
Example 14.2. If A = ∅, thenX ∪f B is the coproductX ⊔B.
Example 14.3. If both,
B/∅ = ∗ ∪∅B = ∗ ⊔B.
For example,∅/∅ = ∗. This is creation from nothing. We won’t get into the religious ramiﬁcations.
Example 14.4(Attaching a cell). A basic collection of pairs of spaces is given by the disks relative
to their boundaries: (Dn,Sn−1). (Recall thatS−1 = ∅.) In this context,Dn is called an “n-cell,”
and a mapf :Sn−1 →X allows us to attach ann-cell toX, to form
Sn−1 f →→↙ ↖
↓↓
X
↓↓
Dn →→X ∪f Dn
You might want to generalize this a little bit, and attach a bunch ofn-cells all at once:
∐
α∈ASn−1
α
f →→↙ ↖
↓↓
X
↓↓∐
α∈ADn
α →→X ∪f
∐
α∈ADn
α
What are some examples? Whenn = 0, (D0,S−1) = ( ∗, ∅), so you are just adding a discrete
set toX:
X ∪f
∐
α∈A
D0 =X ⊔A
More interesting: Let’s attach two 1-cells to a point:
S0 ⊔S0 f →→↙ ↖
↓↓
∗
↓↓
D1 ⊔D1 →→ ∗ ∪f (D1 ⊔D1)
Again there’s just one choice forf, and ∗ ∪f (D1 ⊔D1) is a ﬁgure 8, because you start with two
1-disks and identify the four boundary points together. Let me writeS1 ∨S1 for this space. We
can go on and attach a single 2-cell to manufacture a torus. Think of the ﬁgure 8 as the perimeter
of a square with opposite sides identiﬁed.


## Page 40

14. CW-COMPLEXES 37
The inside of the square is a 2-cell, attached to the perimeter by a map I’ll denote byaba−1b−1:
S1 aba−1b−1
→→↙ ↖
↓↓
S1 ∨S1
↓↓
D2 →→ (S1 ∨S1) ∪f D2 =T 2.
This example illuminates the following deﬁnition.
Deﬁnition 14.5. A CW-complex is a spaceX equipped with a sequence of subspaces
∅ = Sk−1X ⊆ Sk0X ⊆ Sk1X ⊆ · · · ⊆ X
such that
• X is the union of theSknX’s, and
• for alln, there is a pushout diagram like this:
∐
α∈AnSn−1
α
fn →→↙ ↖
↓↓
Skn−1X
↓↓∐
α∈AnDn
α
gn →→ SknX
.
The subspace SknX is the n-skeleton of X. Sometimes it’s convenent to use the alternate
notation Xn for then-skeleton. The ﬁrst condition is intended topologically, so that a subset ofX
is open if and only if its intersection with eachSknX is open; or, equivalently, a mapf :X →Y is
continuous if and only if its restriction to eachSknX is continuous. The mapsfn are theattaching
maps and the mapsgn are characteristic maps.
Example 14.6.We just constructed the torus as a CW complex withSk0T 2 = ∗, Sk1T 2 =S1 ∨S1,
and Sk2T 2 =T 2.
Deﬁnition 14.7. A CW-complex isﬁnite-dimensional if SknX = X for somen; of ﬁnite type if
each An is ﬁnite, i.e., ﬁnitely many cell in each dimension; andﬁnite if it’s ﬁnite-dimensional and
of ﬁnite type.
Thedimension of a CW complex is the largestn for which there aren-cells. This is not obviously
a topological invariant, but, have no fear, it turns out that it is.
In “CW,” the “C” is for cell, and the “W” is for weak, because of the topology on a CW-complex.
This deﬁnition is due to J. H. C. Whitehead. Here are a couple of important facts about them.
Theorem 14.8. Any CW-complex is Hausdorﬀ, and it’s compact if and only if it’s ﬁnite.
Any compact smooth manifold admits a CW structure.
Proof. See [2] Prop. IV.8.1, [6] Prop. A.3.


## Page 41

38 CHAPTER 2. COMPUTATIONAL METHODS
15 CW-complexes II
We have a few more general things to say about CW complexes.
Suppose X is a CW complex, with skeleton ﬁltration∅ =X−1 ⊆X0 ⊆X1 ⊆ · · · ⊆ X and cell
structure
∐
α∈AnSn−1
α
fn →→↙ ↖
↓↓
Xn−1
↓↓∐
α∈AnDn
α
gn →→Xn
.
In each case, the boundary of a cell gets identiﬁed with part of the previous skeleton, but the
“interior”
IntDn = {x ∈Dn : |x|< 1}
does not. (Note thatIntD0 =D0.) Thus as sets – ignoring the topology –
X =
∐
n≥0
∐
α∈An
Int(Dn
α).
The subsets IntDn
α are called “openn-cells,” despite the fact that they not generally open in the
topology onX, and (except whenn = 0) they are not homeomorphic to compact disks.
Deﬁnition 15.1. Let X be a CW-complex with a cell structure{gα :Dn
α →Xn :α ∈An,n ≥ 0}.
A subcomplex is a subspace Y ⊆ X such that for all n, there is a subset Bn of An such that
Yn =Y ∩Xn providesY with a CW-structure with characteristic maps{gβ :β ∈Bn,n ≥ 0}.
Example 15.2. SknX ⊆X is a subcomplex.
Proposition 15.3. LetX be a CW-complex with a chosen cell structure. Any compact subspace of
X lies in some ﬁnite subcomplex.
Proof. See [2], p. 196.
Remark15.4. Forﬁxedcellstructures, unionsandintersectionsofsubcomplexesaresubcomplexes.
Then-sphereSn (forn> 0) admits a very simple CW structure: Let∗ = Sk0(Sn) = Sk1(Sn) =
· · · = Skn−1(Sn), and attach ann-cell using the unique mapSn−1 → ∗. This is a minimal CW
structure – you need at least two cells to buildSn.
This is great – much simpler than the simplest construction ofSn as a simplicial complex – but
it is not ideal for all applications. Here’s another CW-structure onSn. Regard Sn ⊆ Rn+1, ﬁlter
the Euclidean space by leading subspaces
Rk = ⟨e1,...,e k⟩.
and deﬁne
SkkSn =Sn ∩ Rk+1 =Sk.


## Page 42

15. CW-COMPLEXES II 39
Now there are twok-cells for eachk with 0 ≤k ≤n, given by the two hemispheres ofSk. For
eachk there are two characteristic maps,
u,ℓ :Dk →Sk
deﬁning the upper and lower hemispheres:
u(x) = (x,
√
1 − |x|2), ℓ (x) = (x, −
√
1 − |x|2).
Note that if|x| = 1 then |u(x)| = |ℓ(x)| = 1, so each characteristic map restricts on the boundary
to a map toSk−1, and serves as an attaching map. This cell structure has the advantage thatSn−1
is a subcomplex ofSn.
The casen = ∞ is allowed here. Then R∞ denotes the countably inﬁnite dimensional inner
product space that is the topological union of the leading subspacesRn. The CW-complexS∞ is
of ﬁnite type but not ﬁnite dimensional. It has the following interesting property. We know that
Sn is not contractible (because the identity map and a constant map have diﬀerent behavior in
homology), but:
Proposition 15.5.S∞ is contractible.
Proof. This is an example of a “swindle,” making use of inﬁnite dimensionality. LetT : R∞ → R∞
send (x1,x 2,... ) to (0,x 1,x 2,... ). This sends S∞ to itself. The location of the leading nonzero
entry is diﬀerent forx andTx, so the line segment joiningx toTx doesn’t pass through the origin.
Therefore
x ↦→ tx + (1 −t)Tx
|tx + (1 −t)Tx |
provides a homotopy1 ≃ T. On the other hand,T is homotopic to the constant map with value
(1, 0, 0,... ), again by an aﬃne homotopy.
This “ineﬃcient” CW structure onSn has a second advantage: it’sequivariant with respect to
the antipodal involution. This provides us with a CW structure on the orbit space for this action.
Recall that RPk =Sk/ ∼ where x ∼ −x. The quotient mapπ :Sk → RPk is a double cover,
identifying upper and lower hemispheres. The inclusion of one sphere in the next is compatible with
this equivalence relation, and gives us “linear” embeddingsRPk−1 ⊆ RPk. This suggests that
∅ ⊆ RP0 ⊆ RP1 ⊆ · · · ⊆ RPn


## Page 43

40 CHAPTER 2. COMPUTATIONAL METHODS
might serve as a CW ﬁltration. Indeed, for eachk,
Sk−1 →→
π
↓↓
Dk
u
↓↓
RPk−1 →→ RPk
is a pushout: A line in Rk+1 either lies in Rk or is determined by a unique point in the upper
hemisphere ofSk.
16 Homology of CW-complexes
The skeleton ﬁltration of a CW complex leads to a long exact sequence in homology, showing that
the relative homologyH∗(Xk,Xk−1) controls how the homology changes when you pass fromXk−1
to Xk. What is this relative homology? If we pick a set of attaching maps, we get the following
diagram. ∐
αSk−1 ↘ ↙ →→
f
↓↓
∐
αDk
α →→
↓↓
⋁
αSk
α
↓↓
Xk−1
↘ ↙ →→Xk ∪f B →→Xk/Xk−1
where ⋁is the wedge sum (disjoint union with all basepoints identiﬁed):⋁
αSk
α is a bouquet of
spheres. The dotted map exists and is easily seen to be a homeomorphism.
Luckily, the inclusionXk−1 ⊆Xk satisﬁes what’s needed to conclude that
Hq(Xk,Xk−1) →Hq(Xk/Xk−1, ∗)
is an isomorphism. After all,Xk−1 is a deformation retract of the space you get fromXk by deleting
the center of eachk-cell.
We knowHq(Xk/Xk−1, ∗) very well:
Hq(
⋁
α∈Ak
Sk
α, ∗) ∼=
{
Z[Ak] q =k
0 q ̸=k .
Lesson: The relative homologyHk(Xk,Xk−1) keeps track of thek-cells ofX.
Deﬁnition 16.1. The group ofcellular n-chains in a CW complexX is
Ck(X) :=Hk(Xk,Xk−1) = Z[Ak].
If we put the fact thatHq(Xk,Xk−1) = 0 forq ̸=k,k + 1into the homology long exact sequence
of the pair, we ﬁnd ﬁrst that
Hq(Xk−1)
∼=− →Hq(Xk) for q ̸=k,k − 1,
and then that there is a short exact sequence
0 →Hk(Xk) →Ck(X) →Hk−1(Xk−1) → 0.
So if we ﬁx a dimensionq, and watch howHq varies as we move through the skelata ofX, we
ﬁnd the following picture. Sayq >0. SinceX0 is discrete,Hq(X0) = 0. ThenHq(Xk) continues to


## Page 44

16. HOMOLOGY OF CW-COMPLEXES 41
be 0 till you get up toXq. Hq(Xq) is a subgroup of the free abelian groupCq(X) and hence is free
abelian. Relations may get introduced into it when we pass toXq+1; but thereafter all the maps
Hq(Xq+1) →Hq(Xq+2) → · · ·
are isomorphisms. All theq-dimensional homology ofX is created onXq, and all the relations in
Hq(X) occur byXq+1.
This stable value ofHq(Xk) maps isomorphically toHq(X), even ifX is inﬁnite dimensional.
This is because the union of the images of any ﬁnite set of singular simplices inX is compact and so
lies in a ﬁnite subcomplex and in particular lies in a ﬁnite skeleton. So any chain inX is the image
of a chain in some skeleton. SinceHq(Xk)
∼=− →Hq(Xk+1) for k >q, we ﬁnd thatHq(Xq) →Hq(X)
is surjective. Similarly, ifc ∈Sq(Xk) is a boundary inX, then it’s a boundary inXℓ for someℓ ≥k.
This shows that the mapHq(Xq+1) →Hq(X) is injective. We summarize:
Proposition 16.2. Letk,q ≥ 0. Then
Hq(Xk) = 0 for k<q
and
Hq(Xk)
∼=− →Hq(X) for k>q.
In particular,Hq(X) = 0 if q exceeds the dimension ofX.
We have deﬁned the cellularn-chains of a CW complexX,
Cn(X) =Hn(Xn,Xn−1),
and found that it is the free abelian group on the set ofn cells. We claim that these abelian groups
are related to each other; they form the groups in a chain complex.
What should the boundary of ann-cell be? It’s represented by a characteristic mapDn →Xn
whose boundary is the attaching mapα :Sn−1 →Xn−1. This is a lot of information, and hard to
interpret becauseXn−1 is itself potentially a complicated space. But things get much simpler if I
pinch outXn−2. This suggests deﬁning
d :Cn(X) =Hn(Xn,Xn−1) ∂− →Hn−1(Xn) →Hn−1(Xn−1,Xn−2) =Cn−1(X).
The fact thatd2 = 0 is embedded in the following large diagram, in which the two columns and
the central row are exact.
Cn+1(X) =Hn+1(Xn+1,Xn)
∂n
↓↓
d
→→
0 =Hn−1(Xn−2)
↓↓
Hn(Xn) →→ jn →→
↓↓
Cn(X) =Hn(Xn,Xn−1)
∂n−1 →→
d
→→
Hn−1(Xn−1)
jn−1
↓↓
Hn(Xn+1)
↓↓
Cn−1(X) =Hn−1(Xn−1,Xn−2)
0 =Hn(Xn+1,Xn)
Now, ∂n−1 ◦jn = 0. So the composite of the diagonals is zero, i.e.,d2 = 0, and we have a chain
complex! This is the “cellular chain complex” ofX.


## Page 45

42 CHAPTER 2. COMPUTATIONAL METHODS
We should compute the homology of this chain complex,Hn(C∗(X)) = kerd/ imd. Now
kerd = ker(jn−1 ◦∂n−1).
But jn−1 is injective, so
kerd = ker∂n−1 = imjn =Hn(Xn).
On the other hand
imd =jn(im∂n) = im∂n ⊆Hn(Xn).
So
Hn(C∗(X)) =Hn(Xn)/ im∂n =Hn(Xn+1)
by exactness of the left column; but as we know this is exactlyHn(X)! We have proven the following
result.
Theorem 16.3. For a CW complexX, there is an isomorpphism
H∗(C∗(X)) ∼=H∗(X)
natural with respect to ﬁltration-preserving maps between CW complexes.
This has an immediate and surprisingly useful corollary.
Corollary 16.4. Suppose that the CW complexX has only even cells – that is,X2k ↪→ X2k+1 is
an isomorphism for allk. Then
H∗(X) ∼=C∗(X).
That is,Hn(X) = 0 for n odd, is free abelian for alln, and the rank ofHn(X) for n even is the
number ofn-cells.
Example 16.5. Complex projective spaceCPn has a CW structure in which
Sk2kCPn = Sk2k+1CPn = CPk.
The attachingS2k−1 → CPk sends v ∈S2k−1 ⊆ Cn to the complex line throughv. So
Hk(CPn) =
{
Z for 0 ≤k ≤ 2n, keven
0 otherwise.
Finally, notice that in our proof of Theorem 16.3 we used only properties contained in the
Eilenberg-Steenrod axioms. As a result, any construction of a homology theory satisfying the
Eilenberg-Steenrod axioms gives you the same values on CW complexes as singular homology.
17 Real projective space
Let’s try to computeH∗(RPn). This computation will invoke a second way to think of the cellular
chain groupCn(X). Each cell has a characteristic mapDn →Xn, and we have the diagram
∐(Dn,Sn−1) →→
→→
(Xn,Xn−1)
↓↓
(⋁Sn, ∗).


## Page 46

17. REAL PROJECTIVE SPACE 43
We’ve shown that the vertical map induces an isomorphism in homology, and the diagonal does as
well. (For example,∐Dn has a CW structure in which the(n − 1)-skeleton is ∐Sn−1.) So
Hn(∐(Dn,Sn−1))
∼=− →Cn(X).
We have a CW structure onRPn with Skk(RPn) = RPk; there is onek-cell – which we’ll
denote byek – for eachk between 0 and n. So the cellular chain complex looks like this:
0 C0(RPn)←← C1(RPn)←← · · ·←← Cn(RPn)←← 0←←
0 Z⟨e0⟩←← Z⟨e1⟩d=0←← · · ·←← Z⟨en⟩←← 0←←
The ﬁrst diﬀerential is zero because we know whatH0(RPn) is (it’s Z!). The diﬀerential in the
cellular chain complex is given by the top row in the following commutative diagram.
Cn =Hn(RPn, RPn−1)∂ →→Hn−1(RPn−1) →→
→→
Hn−1(RPn−1, RPn−2) =Cn−1
∼=
↓↓
Hn(Dn,Sn−1)
∼=
↑↑
∂
∼=
→→Hn−1(Sn−1)
π∗
↑↑
→→Hn−1(Dn−1/Sn−2, ∗).
The map π : Sn−1 → RPn−1 is the attaching map of the top cell ofRPn; that is, the double
cover. The diagonal composite pinches the subspace RPn−2 to a point. The composite map
Sn−1 →Dn−1/Sn−2 factors as follows:
Sn−1 double cover →→
→→
RPn−1 pinch →→Dn−1/Sn−2 ∼=Sn−1
Sn−1/Sn−2 =Sn−1 ∨Sn−1
→→
One of the mapsSn−1 →Sn−1 from the wedge is the identity, and the other map is the antipodal
map α : Sn−1 → Sn−1. Write σ for a generator ofHn−1(Sn−1). Then in Hn−1 we haveσ ↦→
(σ,σ ) ↦→ σ +α∗σ. So we need to know the degree of the antipodal map onSn−1. The antipodal
map reverses alln coordinates in Rn. Each reversal is a reﬂection, and acts onSn−1 by a map of
degree −1. So
degα = (−1)n.
Therefore the cellular complex ofRPn is as follows:
dim −1 0 1 · · · n n + 1 · · ·
0 Z0←← Z2←← · · ·0←← Z2 or 0←← 0←← · · ·←←
The homology is then easy to read oﬀ.
Proposition 17.1. The homology of real projective space is as follows.
Hk(RPn) =



Z k = 0
Z k =n odd
Z/2Z k odd, 0<k<n
0 otherwise.


## Page 47

44 CHAPTER 2. COMPUTATIONAL METHODS
Here’s a table. Missing entries are0.
dim 0 1 2 3 4 5 · · ·
RP0 Z
RP1 Z Z
RP2 Z Z /2
RP3 Z Z /2 0 Z
RP4 Z Z /2 0 Z/2
RP5 Z Z /2 0 Z/2 0 Z... ... ... ... ... ... ...
Summary: In real projective space, odd cells create new generators; even cells (except for the
zero-cell) create torsion in the previous dimension.
This example illustrates the signiﬁcance of cellular homology, and, therefore, of singular homol-
ogy. A CW structure involves attaching maps
∐Sn−1 → Skn−1X.
Knowing these, up to homotopy, determines the full homotopy type of the CW complex. Homology
does not record all this information. Instead, it records only information about the composite
obtained by pinching outSkn−2X.
∐
a∈AnSn−1
a →→
→→
Skn−1X
↓↓⋁
b∈An−1Sn−1
b .
In Hn−1, this can be identiﬁed with a map
∂ : Z[An] → Z[An−1]
that is none other than the diﬀerential in the cellular chain complex.
The moral: homology picks oﬀ only the “ﬁrst order” structure of a CW complex.
On the other hand, we’ll see in the next lecture that it does a very good job of that.
18 Euler characteristic and homology approximation
Theorem 18.1. LetX be a ﬁnite CW-complex withan n-cells. Then
χ(X) =
∞∑
k=0
(−1)kak
depends only on the homotopy type ofX; it is independent of the choice of CW structure.


## Page 48

18. EULER CHARACTERISTIC AND HOMOLOGY APPROXIMATION 45
This integerχ(X) is called theEuler characteristicof X. We will prove this theorem by show-
ing thatχ(X) equals a number computed from the homology groups ofX, which are themselves
homotopy invariants.
We’ll need a little bit of information about the structure of ﬁnitely generated abelian groups.
Let A be an abelian group. The set oftorsion elements ofA,
Tors(A) = {a ∈A :na = 0 for somen ̸= 0},
is a subgroup ofA. A group istorsion freeif Tors(A) = 0. For anyA the quotient groupA/Tors(A)
is torsion free.
For a general abelian group, that’s about all you can say. But now assumeAis ﬁnitely generated.
Then Tors(A) is a ﬁnite abelian group andA/Tors(A) is a ﬁnitely generated free abelian group,
isomorphic to Zr for some integerr called the rank of A. Pick elements ofA that map to a set
of generators ofA/Tors(A), and use them to deﬁne a mapA/TorsA → A splitting the projection
map. This shows that ifA is ﬁnitely generated then
A ∼= Tors(A) ⊕ Zr.
A ﬁnite abelian groupA is necessarily of the form
Z/n1 ⊕ Z/n2 ⊕ · · · ⊕ Z/nt where n1|n2| · · · |nt.
The ni are the “torsion coeﬃcients” ofA. They are well deﬁned natural numbers.
Lemma 18.2. Let 0 → A → B → C → 0 be a short exact sequence of ﬁnitely generated abelian
groups. Then
rankA − rankB + rankC = 0.
Theorem 18.3. LetX be a ﬁnite CW complex. Then
χ(X) =
∑
k
(−1)krankHk(X).
Proof. Pick a CW-structure with, say,ak k-cells for eachk. We have the cellular chain complex
C∗. WriteH∗,Z∗, andB∗ for the homology, the cycles, and the boundaries, in this chain complex.
From the deﬁnitions, we have two families of short exact sequences:
0 →Zk →Ck →Bk−1 → 0
and
0 →Bk →Zk →Hk → 0.
Let’s use them and facts about rank rewrite the alternating sum:
∑
k
(−1)kak =
∑
k
(−1)krank(Ck)
=
∑
k
(−1)k(rank (Zk) + rank (Bk−1))
=
∑
k
(−1)k(rank (Bk) + rank (Hk) + rank (Bk−1))
Theterms rankBk + rankBk−1 cancelbecauseit’sanalternatingsum. Thisleaves ∑
k(−1)krankHk.
But Hk ∼=H sing
k (X).


## Page 49

46 CHAPTER 2. COMPUTATIONAL METHODS
In the early part of the 20th century, “homology groups” were not discussed. It was Emmy
Noether who ﬁrst described things that way. Instead, people worked mainly with the sequence of
ranks,
βk = rankHk(X),
which are known (following Poincaré) as theBetti numbersof X.
GivenaCW-complex X ofﬁnitetype, canwegivealowerboundonthenumberof k-cellsinterms
of the homology ofX? Let’s see.Hk(X) is ﬁnitely generated becauseCk(X) ←↩Z k(X)↠Hk(X).
Thus
Hk(X) =
t(k)⨁
i=1
Z/ni(k)Z ⊕ Zr(k)
where then1(k)| · · · |nt(k)(k) are the torsion coeﬃcients ofHk(X) and r(k) is the rank.
The minimal chain complex withHk = Zr andHq = 0 forq ̸=k is just the chain complex with0
everywhere except forZr in thekth degree. The minimal chain complexof free abelian groupswith
Hk = Z/nZ and Hq = 0 for q ̸= k is the chain complex with0 everywhere except in dimensions
k + 1 and k, where we haveZ n− →Z These small complexes are calledelementary chain complexes.
This implies that a lower bound on the number ofk-cells is
r(k) +t(k) +t(k − 1).
The ﬁrst two terms give generators forHk, and the last gives relations forHk−1.
TheseelementarychaincomplexescanberealizedasthereducedcellularchainsofCWcomplexes
(at least ifk >0). A wedge ofr copies ofSk has a CW structure with one0-cell andr k-cells, so
its cellular chain complex hasZr in dimensionk and 0 in other positive dimensions. To construct a
CW complex with cellular chain complex given byZ n− →Z in dimensionsk + 1andk and 0 in other
positive dimensions, start withSk as k-skeleton and attach ak + 1-cell by a map of degreen. For
example, whenk = 1 and n = 2, you haveRP2. These CW complexes are called “Moore spaces.”
This maximally eﬃcient construction of a CW complex in a homotopy type can in fact be
achieved, at least in the simply connected case:
Theorem 18.4 (Wall, [10]). Let X be a simply connected CW-complex of ﬁnite type. Then there
exists a CW complexY with r(k) +t(k) +t(k − 1) k-cells, for allk, and a homotopy equivalence
Y →X.
We will prove this theorem in 18.906.
The construction of Moore spaces can be generalized:
Proposition 18.5. For any graded abelian groupA∗ with Ak = 0 for k ≤ 0, there exists a CW
complexX with ˜H∗(X) =A∗.
Proof. LetA be any abelian group. Pick generators forA. They determine a surjection from a free
abelian groupF0. The kernelF1 of that surjection is free, being a subgroup of a free abelian group.
WriteG0 for minimal set of generators ofF0, andG1 for a minimal set of generators forF1.
Let k ≥ 1. Deﬁne Xk to be the wedge of|G0| copies ofSk, soHk(Xk) = ZG0. Now deﬁne an
attaching map
α :
∐
b∈G1
Sk
b →Xk


## Page 50

19. COEFFICIENTS 47
by specifying it on each summandSk
b. The generatorb ∈G1 is given by a linear combination of the
generators ofF0, say
b =
s∑
i=1
niai.
We want to mimic this in topology. To do this, ﬁrst mapSk → ⋁sSk by pinching(s − 1) tangent
circles to points. In homology, this map takes a generator ofHk(Sk) to the sum of the generators
of thek-dimensional homology of the various spheres in the bouquet. Map theith sphere in the
wedge toSk
ai ⊆Xk by a map of degreeni. The map on the summandSk
b is then the composite of
these two maps,
Sk
b →
s⋁
i=1
Sk →
⋁
a
Sk
a.
Altogether, we get a mapα that realizesF1 →F0 inHk. So using it as an attaching map produces
a CW complexX with ˜Hq(X) = A for q = k and 0 otherwise. WriteM(A,k ) for a CW complex
produced in this way.
Finally, given a graded abelian groupA∗, form the wedge overk of the spacesM(Ak,k ).
Such a spaceM(A,k ), with ˜Hq(M(A,k )) =A forq =k and 0 otherwise, is called aMoore space
of type (A,k ) [9]. The notation is a bit deceptive, sinceM(A,k ) cannot be made into a functor
Ab → HoTop.
19 Coeﬃcients
Abelian groups can be quite complicated, even ﬁnitely generated ones. Vector spaces over a ﬁeld
are so much simpler! A vector space is determined up to isomorphism by a single cardinality, its
dimension. Wouldn’t it be great to have a version of homology that took values in the category of
vector spaces over a ﬁeld?
We can do this, and more. LetR be any commutative ring at all. Instead of forming the free
abelian group onSin∗(X), we could just as well form the freeR-module:
S∗(X;R) =RSin∗(X)
This gives, ﬁrst, a simplicial object in the category ofR-modules. Forming the alternating sum of
the face maps produces a chain complexof R-modules: Sn(X;R) is anR-module for eachn, and
d :Sn(X;R) →Sn−1(X;R) is anR-module homomorphism. The homology groups are then again
R-modules:
Hn(X;R) = ker(d :Sn(X;R) →Sn−1(X;R))
im(d :Sn+1(X;R) →Sn(X;R)) .
This is thesingular homology ofX with coeﬃcients in the commutative ringR. It satisﬁes all
the Eilenberg-Steenrod axioms, with
Hn(∗;R) =
{
R for n = 0
0 otherwise.
(We could actually have replaced the ringR by any abelian group here, but this will become much
clearer after we have the tensor product as a tool.) This means that all the work we have done
for “integral homology” carries over to homology with any coeﬃcients. In particular, ifX is a


## Page 51

48 CHAPTER 2. COMPUTATIONAL METHODS
CW complex we have the cellular homology with coeﬃcients inR, C∗(X;R), and its homology is
isomorphic toH∗(X;R).
The coeﬃcient rings that are most important in algebraic topology are simple ones: the integers
and the prime ﬁeldsFp and Q; almost always a PID.
As an experiment, let’s computeH∗(RPn;R) for various ringsR. Let’s start withR = F2, the
ﬁeld with 2 elements. This is a favorite among algebraic topologists, because using it for coeﬃcients
eliminates all sign issues. The cellular chain complex hasCk(RPn; F2) = F2 for 0 ≤ k ≤ n, and
the diﬀerential alternates between multiplication by 2 and by 0. But inF2, 2 = 0: so d = 0, and
the cellular chains coincide with the homology:
Hk(RPn; F2) =
{
F2 for 0 ≤k ≤n
0 otherwise.
On the other hand, suppose thatR is a ring in which2 is invertible. The universal case isZ[1/2],
but any subring of the rationals containing1/2 would do just as well, as wouldFp for p odd. Now
the cellular chain complex (in dimensions 0 throughn) looks like
R 0← −R
∼=← −R 0← −R
∼=← − · · ·
∼=← −R
for n even, and
R 0← −R
∼=← −R 0← −R
∼=← − · · ·0← −R
for n odd. Therefore forn even
Hk(RPn;R) =
{
R for k = 0
0 otherwise
and forn odd
Hk(RPn;R) =



R for k = 0
R for k =n
0 otherwise.
You get a much simpler result: Away from 2, even projective spaces look like points, and odd
projective spaces look like spheres!
I’d like to generalize this process a little bit, and allow coeﬃcients not just in a commutative
ring, but more generally in a moduleM over a commutative ring; in particular, any abelian group.
This is most cleanly done using the mechanism of the tensor product. That mechanism will also let
us address the following natural question:
Question 19.1. GivenH∗(X;R), can we deduceH∗(X;M) for anR-module M?
The answer is called the “universal coeﬃcient theorem”. I’ll spend a few days developing what
we need to talk about this.
20 Tensor product
The category ofR-modules is what might be called a “categorical ring,” in which addition corre-
sponds to the direct sum, the zero element is the zero module,1 is R itself, and multiplication is
...well, the subject for today. We care about the tensor product for two reasons: First, it allows
us to deal smoothly with bilinear maps such that the cross-product. Second, and perhaps more


## Page 52

20. TENSOR PRODUCT 49
important, it will allow us relate homology with coeﬃcients in an anyR-module to homology with
coeﬃcients in the PIDR; for example, relateH∗(X;M) to H∗(X), whereM is any abelian group.
Let’s begin by recalling the deﬁnition of a bilinear map over a commutative ringR.
Deﬁnition 20.1. Given threeR-modules, M,N,P , a bilinear map(or, to be explicit,R-bilinear
map) is a functionβ :M ×N →P such that
β(x +x′,y ) =β(x,y ) +β(x′,y ), β (x,y +y′) =β(x,y ) +β(x,y′),
and
β(rx,y ) =rβ(x,y ), β (x,ry ) =rβ(x,y ),
for x,x′ ∈M, y,y′ ∈N, andr ∈R.
Example 20.2. Rn × Rn → R given by the dot product is anR-bilinear map. The cross product
R3 × R3 → R3 is R-bilinear. If R is a ring, the multiplicationR ×R →R is R-bilinear, and the
multiplication on anR-module M given byR ×M → M is R-bilinear. This enters into topology
because the cross-productHm(X;R) ×Hn(Y ;R) ×− →Hm+n(X ×Y ;R) is R-bilinear.
Wouldn’t it be great to reduce stuﬀ about bilinear maps to linear maps? We’re going to do this
by means of a universal property.
Deﬁnition 20.3.LetM,N be R-modules. A tensor productofM andN is anR-module P and a
bilinear mapβ0 :M ×N →P such that for everyR-bilinear mapβ :M ×N →Q there is a unique
factorization
M ×N
β0 →→
β
↘↘
P
f
↓↓
Q
through anR-module homomorphismf.
We should have pointed out that the compositionf ◦β0 is indeed againR-bilinear; but this is
easy to check.
Soβ0 isauniversalbilinearmapoutof M ×N. Insteadof β0 we’regoingtowrite ⊗ :M ×N →P.
This means thatβ(x,y ) = f(x ⊗y) in the above diagram. There are lots of things to say about
this. When you have something that is deﬁned via a universal property, you know that it’s unique
...but you still have to check that it exists!
Construction 20.4.I want to construct a univeralR-bilinear map out ofM ×N. Letβ :M ×N →
Q be anyR-bilinear map. This β isn’t linear. Maybe we should ﬁrst extend it to a linear map.
There is a uniqueR-linear extension over the freeR-moduleR⟨M ×N ⟩ generated by the setM ×N:
M ×N
β →→
[−]
↘↘
Q
R⟨M ×N ⟩
β
↗↗
The map [−], including a basis, isn’t bilinear. So we should quotientR⟨M ×N ⟩ by a submoduleS
of relations to make it bilinear. SoS is the subR-module generated by the four familes of elements
(corresponding to the four relations in the deﬁnition ofR-bilinearity):


## Page 53

50 CHAPTER 2. COMPUTATIONAL METHODS
1. [(x +x′,y )] − [(x,y )] − [(x′ −y)]
2. [(x,y +y′)] − [(x,y )] − [(x,y′)]
3. [(rx,y )] −r[(x,y )]
4. [(x,ry )] −r[(x,y )]
for x,x′ ∈ M, y,y′ ∈ N, andr ∈ R. Now the compositeM ×N → R⟨M ×N ⟩/S is R-bilinear -
we’ve quotiented out by all things that prevented it from being so! And the mapR⟨M ×N ⟩ → Q
factors asR⟨M ×N ⟩ → R⟨M ×N ⟩/S
f
− →Q, wheref isR-linear, and uniquely because the map to
the quotient is surjective. This completes the construction.
If you ﬁnd yourself using this construction, stop and think about what you’re doing. You’re
never going to use this construction to compute anything. Here’s an example: for any abelian group
A,
A × Z/nZ →A/nA, (a,b ) ↦→ba mod nA
is clearly bilinear, and is universal as such. Just look: If β : A × Z/nZ → Q is bilinear then
β(na,b ) = nβ(a,b ) = β(a,nb ) = β(a, 0) = 0, soβ factors throughA/nA; andA × Z/nZ →A/nA
is surjective. SoA ⊗ Z/nZ =A/nA.
Remark 20.5.The image ofM ×N inR⟨M ×N ⟩/S generates it as anR-module. These elements
x ⊗y are called “decomposable tensors.”
What are the properties of such a universal bilinear map?
Property 20.6(Uniqueness). Suppose β0 :M ×N →P andβ′
0 :M ×N →P′ are both universal.
Then there’s a linear mapf :P →P′ such thatβ′
0 =fβ 0 and a linear mapf′ :P′ →P such that
β0 =f′β′
0. The compositef′f :P →P is a linear map such thatf′fβ 0 =f′β′
0 =β0. The identity
map is another. But by universality, there’s only one such linear map, sof′f = 1P. An identical
argument shows thatff′ = 1P′ as well, so they are inverse linear isomorphism. In brief:
The target of a univeralR-bilinear map β0 : M ×N → P is unique up to a unique
R-linear isomorphism compatible with the mapβ0.
This entitles us to speak of “the” universal bilinear map out ofM ×N, and give the target a symbol:
M ⊗RN. IfR is the ring of integers, or otherwise understood, we will drop it from the notation.
Property 20.7(Functoriality). Suppose f :M →M′ and :N →N′. Study the diagram
M ×N
f×g
↓↓
⊗ →→
↘↘
M ⊗N
f⊗g
↓↓
M′ ×N′ ⊗ →→M′ ⊗N′
There is a uniqueR-linear mapf ⊗g because the diagonal map isR-bilinear and the mapM ×N →
M ⊗N is the universalR-bilinear map out ofM ×N. You are invited to show that this construction
is functorial.


## Page 54

20. TENSOR PRODUCT 51
Property 20.8(Unitality, associativity, commutativity). I said that this was going to be a “cate-
gorical ring,” so we should check various properties of the tensor product. For example,R ⊗RM
should be isomorphic to M. Let’s think about this for a minute. We have an R-bilinear map
R ×M → M, given by multiplication. We just need to check the universal property. Suppose we
have anR-bilinear map β : R ×M → P. We have to construct a mapf : M → P such that
β(r,x ) =f(rx) and show it’s unique. Our only choice isf(x) =β(1,x ), and that works.
Similarly, we should check that there’s a unique isomorphismL ⊗ (M ⊗N)
∼=− →(L ⊗M) ⊗N
that’s compatible with L × (M ×N) ∼= (L ×M) ×N, and that there’s a unique isomorphism
M ⊗N →N ⊗M that’s compatible with the switch mapM ×N →N ×M. There are a few other
things to check, too: Have fun!
Property 20.9(Sums). What happens withM ⊗
(⨁
α∈ANα
)
? This might be a ﬁnite direct sum,
or maybe an uncountable collection. How does this relate to⨁
α∈A(M ⊗Nα)? Let’s construct a
map
f :
⨁
α∈A
(M ⊗Nα) →M ⊗
(⨁
α∈A
Nα
)
.
We just need to deﬁne mapsM ⊗Nα →M ⊗
(⨁
α∈ANα
)
because the direct sum is the coproduct.
We can use1 ⊗inα where inα :Nα → ⨁
α∈ANα. These give you a mapf.
What about a map the other way? We’ll deﬁne a map out of the tensor product using the
universal property. So we need to deﬁne a bilinear map out ofM ×
(⨁
α∈ANα
)
. By linearity in
the second factor, it will suﬃce to say where to send elements of the form(x,y ) ∈ M ⊗Nβ. Just
send it tox ⊗ inβy, where inβ :Nβ → ⨁
α∈ANα is the inclusion of a summand. It’s up to you to
check that these are inverses.
Property 20.10(Distributivity). Suppose f :M′ →M, r ∈R, andg0,g 1 :N′ →N. Then
f ⊗ (g0 +g1) =f ⊗g0 +f ⊗g1 :M′ ⊗N′ →M ⊗N
and
f ⊗rg0 =r(f ⊗g0) :M′ ⊗N′ →M ⊗N.
Again I’ll leave this to you to check.
Our immediate use of this construction is to give a clean deﬁnition of “homology with coeﬃcients
inM,” whereM is any abelian group. First, endow singular chains with coeﬃcients inM like this:
S∗(X;M) =S∗(X) ⊗M
Then we deﬁne
Hn(X;M) =Hn(S∗(X;M)).
SinceSn(X) = ZSinn(X),Sn(X;M) is a direct sum of copies ofM indexed by then-simplices inX.
If M happens to be a ring, this coincides with the notation used in the last lecture. The boundary
maps are justd ⊗ 1 :Sn(X) ⊗M →Sn−1(X) ⊗M.
As we have noted, the sequence
0 →Sn(A) →Sn(X) →Sn(X,A ) → 0
is split short exact, and therefore applying the functor− ⊗ M to it produces another split short
exact sequence. So
Sn(X,A ) ⊗M =Sn(A;M)/Sn(X;M),


## Page 55

52 CHAPTER 2. COMPUTATIONAL METHODS
and it makes sense to use the notationSn(X,A ;M) for this. This is again a chain complex (by
functoriality of the tensor product), and we deﬁne
Hn(X,A ;M) =Hn(Sn(X,A ;M)).
Notice that
Hn(∗;M) =
{
M for n = 0
0 otherwise.
The following result is immediate:
Proposition 20.11.For any abelian groupM, (X,A ) ↦→H∗(X,A ;M) provides a homology theory
satisfying the Eilenberg-Steenrod axioms withH0(∗;M) =M.
Suppose R is a commutative ring andA is an abelian group. ThenA ⊗R is naturally anR-
module. SoS∗(X;R) is a chain complex ofR-modules –freeR-modules. We can go a little further:
suppose thatM is anR-module. Then A ⊗M is anR-module; andS∗(X;M) is a chain complex
of R-modules. We can also write
S∗(X;M) =S∗(X;R) ⊗RM.
This construction is natural in theR-module M; and, again using the fact that sums of exact
sequences are exact, a short exact sequence ofR-modules
0 →M′ →M →M′′ → 0
leads to a short exact sequence of chain complexes
0 →S∗(X;M′) →S∗(X;M) →S∗(X;M′′) → 0
and hence to a long exact sequence in homology, a “coeﬃcient long exact sequence”:
· · · →→Hn+1(X;M′′)
∂
←←
Hn(X;M′) →→Hn(X;M) →→Hn(X;M′′)
∂
←←
Hn−1(X;M′) →→ · · ·.
A particularly important case is whenR is a ﬁeld; thenS∗(X;R) is a chain complex of vector
spaces overR, andH∗(X;R) is a graded vector space overR.
Question 20.12. A reasonable question is this: Suppose we know H∗(X). Can we compute
H∗(X;M) for an abelian group M? More generally, suppose we know H∗(X;R) and M is an
R-module. Can we computeH∗(X;M)?


## Page 56

21. TENSOR AND TOR 53
21 Tensor and Tor
We continue to study properties of the tensor product. Recall that
A ⊗ Z/nZ =A/nA.
Consider the exact sequence
0 → Z 2− →Z → Z/2Z → 0.
Let’s tensor it withZ/2Z. We get
0 → Z/2Z → Z/2Z → Z/2Z → 0.
This cannot be a short exact sequence! This is a major tragedy: tensoring doesn’t preserve exact
sequences; one says that the functorZ/nZ ⊗ − is not “exact.” This is why we can’t form homology
with coeﬃcients inM by simply tensoring homology withM.
Tensoring does respect certain exact sequences:
Proposition 21.1. The functorN ↦→M ⊗RN preserves cokernels; it isright exact.
Proof. Suppose thatN′ →N →N′′ → 0 is exact and letf :M ⊗N →Q. We wish to show that
there is a unique factorization as shown in the diagram
M ⊗N′ →→
0
↘↘
M ⊗N
f
↓↓
→→M ⊗N′′ →→
↙↙
0
Q.
This is equivalent to asking whether there is a unique factorization of the corresponding diagram of
bilinear maps,
M ×N′ →→
0
↘↘
M ×N
β
↓↓
→→M ×N′′ →→
↙↙
0
Q
– uniqueness of the linear factorization is guaranteed by the fact thatM ×N′′ generates M ⊗N′′.
This unique factorization reﬂects the fact thatM × − preserves cokernels.
Failure of exactness is bad, so let’s try to repair it. A key observation is that ifM is free, then
M ⊗R − is exact. IfM =RS, the freeR-module on a setS, thenM ⊗RN = ⊕SN, since tensoring
distributes over direct sums. Then we remember the following “obvious” fact:
Lemma 21.2. If M′
i →Mi →M′′
i is exact for alli ∈I, then so is
⨁
M′
i →
⨁
Mi →
⨁
M′′
i .
Proof. Clearly the composite is zero. Let(xi ∈ Mi,i ∈ I) ∈ ⨁Mi and suppose it maps to zero.
That means that eachxi maps to zero inM′′
i and hence is in the image of somex′
i ∈M′
i. Just make
sure to takex′
i = 0 if xi = 0.


## Page 57

54 CHAPTER 2. COMPUTATIONAL METHODS
To exploit this observation, we’ll “resolve”M by free modules. This means: ﬁnd a surjection
from a freeR-module,F0 →M. This amounts to specifyingR-module generators. For a general ring
R, the kernel ofF0 →M may not be free. For the moment, let’s make sure that it is by assuming
thatR is a PID, and writeF1 for the kernel. The failure ofM ⊗ − to be exact is measured, at least
partially, by the leftmost term (deﬁned as a kernel) in the exact sequence
0 → TorR
1 (M,N ) →F1 ⊗RN →F0 ⊗RN →M ⊗RN → 0.
The notation suggests that this Tor term is independent of the resolution. This is indeed the
case, as we shall show presently. But before we do, let’s compute some Tor groups.
Example 21.3. For any PIDR, ifM = F is free overR we can takeF0 = F and F1 = 0, and
discover that thenTorR
1 (F,N ) = 0 for anyN.
Example 21.4. Let R = Z and M = Z/nZ, andN any abelian group. WhenR = Z it is often
omitted from the notation for Tor. There is a nice free resolution staring at us:F0 =F1 = Z, and
F1 →F0 given by multiplication byn. The sequence deﬁningTor1 looks like
0 → Tor1(Z/nZ,N ) → Z ⊗N n⊗1− − →Z ⊗N → Z/nZ ⊗N → 0,
so
Z/nZ ⊗N =N/nN, Tor1(Z/nZ,N ) = ker(n|N).
The torsion in this case is the “n-torsion” inN. This accounts for the name.
Functors likeTor1 can be usefully deﬁned for any ring, and moving to that general case makes
their signiﬁcance clearer and illuminates the reason whyTor1 is independent of choice of generators.
So letR be any ring andM a module over it. By pickingR-module generators I can produce a
surjection from a freeR-module, F0 → M. WriteK0 for the kernel of this map. It is the module
of relations among the generators. We can no longer guarantee that it’s free, but we can at least
ﬁnd a set of module generators for it, and construct a surjection from a freeR-module, F1 →K0.
Continuing in this way, we get a diagram like this –
· · · →→
↘↘
F2
↘↘
d →→F1
↘↘
d →→F0
↘↘
K2
↗↗
↘↘
K1
↗↗
↘↘
K0
↗↗
↘↘
N
↘↘
0
↗↗
0
↗↗
0
↗↗
0
↗↗
0
– in which the upside-down V subdiagrams are short exact sequences andFs is free for alls. Splicing
these exact sequences gives you an exact sequence in the top row. This is afree resolution ofN.
The top row,F∗, is a chain complex. It maps to the very short chain complex withN in degree
0 and 0 elsewhere, and this chain map is a homology isomorphism (or “quasi-isomorphism”). We
have in eﬀect replacedN with this chain complex of free modules. The moduleN may be very
complicated, with generators, relations, relations between relations .... All this is laid out in front
of us by the free resolution. Generators ofF0 map to generators forN, and generators forF1 map
to relations among those generators.


## Page 58

22. THE FUNDAMENTAL THEOREM OF HOMOLOGICAL ALGEBRA 55
Now we can try to deﬁne higher Tor functors by tensoringF∗ with N and taking homology. If
R is a PID and the resolution is justF1 →F0, forming homology is precisely taking cokernel and
kernel, as we did above. In general, we deﬁne
TorR
n (M,N ) =Hn(M ⊗RF∗).
In the next lecture we will check that this is well-deﬁned – independent of free resolution, and
functorial in the arguments. For the moment, notice that
TorR
n (M,F ) = 0 forn> 0 if F is free,
since I can takeF
∼=← −F ← 0 ← · · · as a free resolution; and that
TorR
0 (M,N ) =M ⊗RN
since we know thatM ⊗R − is right-exact.
22 The fundamental theorem of homological algebra
We will now show that theR-modules TorR
n (M,N ) are well-deﬁned and functorial. This will be an
application of a very general principle.
Theorem 22.1(Fundamental Theorem of Homological Algebra). LetM and N beR-modules; let
0 ←M ←E0 ←E1 ← · · ·
be a sequence in which eachEn is free; let
0 ←N ←F0 ←F1 ← · · ·
be an exact sequence; and letf :M →N be a homomorphism. Then we can liftf to a chain map
f∗ :E∗ →F∗, uniquely up to chain homotopy.
Proof. Let’s try to constructf0. Consider:
0 →→K0 = ker(ϵM) →→
g0
↓↓
E0
ϵM →→
f0
↓↓
M
f
↓↓
0 →→L0 = ker(ϵN) →→F0
ϵN →→N →→ 0
We know thatE0 = RS for some setS. What we do is map the generators ofE0 into M via ϵM
and then intoF via f, and then lift them toF0 via ϵN (which is possible because it’s surjective).
Then extend to a homomorphism, to getf0. You can restrictf0 to kernels to getg0.
Now the mapd :E1 →E0 satisifes ϵM ◦d = 0, and so factors through a map toK0 = kerϵM.
Similarly,d : F1 → F0 factors through a mapF1 → L0, and this map must be surjective because
the sequenceF1 →F0 →N is exact. We ﬁnd ourselves in exactly the same situation:
0 →→K1 →→
g1
↓↓
E1 →→
f1
↓↓
K0
g0
↓↓
0 →→L1 →→F1 →→L0 →→ 0


## Page 59

56 CHAPTER 2. COMPUTATIONAL METHODS
So we constructf∗ by induction.
Now we need to prove the chain homotopy claim. So suppose I havef∗,f′
∗ :E∗ →F∗, both lifting
f :M →N. Thenf′
n −fn (which we’ll renameℓn) is a chain map lifting0 :M →N. We want to
consruct a chain null-homotopy ofℓ∗; that is, we wanth :En →Fn+1 such thatdh +hd =ℓn. At
the bottom,E−1 = 0, so we wanth : E0 → F1 such thatdh = ℓ0. This factorization happens in
two steps.
E0
ℓ0
↓↓↙↙
h
←←
→→M
0
↓↓
F1 →→ →→L0 →→F0
ϵN →→N.
First, ϵNℓ0 = 0 implies that ℓ0 factors through L0 = ker ϵN. Next, F1 → L0 is surjective, by
exactness, andE0 is free, so we can lift generators and extendR-linearly to geth :E0 →F1..
The next step is organized by the diagram
E1
d →→
ℓ1
↓↓↙↙
h
←←
E0
ℓ0
↓↓
h
↙↙
F2 →→ →→
d
→→L1 →→F1
d →→F0
This diagram doesn’t commute;dh = ℓ0, but the (d,h,ℓ 1) triangle doesn’t commute. Rather, we
want to constructh :E1 →F2 such thatdh =ℓ1 −hd. Since
d(ℓ1 −hd) =ℓ0d −dhd = (ℓ0 −dh)d = 0.
the mapℓ1 −hd lifts toL1 = kerd. But then it lifts throughF2, sinceF2 → L1 is surjective and
E1 is free.
Exactly the same process continues.
This proof uses a property of freeness that is shared by a broader class of modules.
Deﬁnition 22.2.AnR-module P is projectiveif any map out ofP factors through any surjection:
M
↓↓↓↓
P
↗↗
→→N
Every free module is projective, and this is the property of freeness that we jave been using; the
Fundamental Theorem of Homological Algebra holds under the weaker assumption that eachEn is
projective.
Any direct summand in a projective is also projective. Any projective module is a direct sum-
mand of a free module. Over a PID, every projective is free, because any submodule of a free is
free. But there are examples of nonfree projectives:
Example 22.3.Letk be a ﬁeld and letR be the product ringk ×k. It acts onk in two ways, via
(a,b )c =ac and via (a,b )c =bc. These are both projectiveR-modules that are not free.
Now we will apply Theorem 22.1 to verify that our proposed construction ofToris independent
of free (or projective!) resolution, and is functorial.


## Page 60

22. THE FUNDAMENTAL THEOREM OF HOMOLOGICAL ALGEBRA 57
Suppose I have f : N′ → N. Pick arbitrary free resolutions N′ ← F′
∗ and N ← F∗, and
pick any chain mapf∗ : F′
∗ → F∗ lifting f. We claim that the map induced in homology by
1 ⊗f∗ :M ⊗RF′
∗ →M ⊗RF∗ is independent of the choice of lift. Supposef′
∗ is another lift, and
pick a chain homotopyh :f∗ ≃f′
∗. SinceM ⊗R − is additive, the relation
1 ⊗h : 1 ⊗f∗ ≃ 1 ⊗f′
∗
still holds. So1 ⊗f∗ and 1 ⊗f′
∗ induce the same map in homology.
For example, suppose thatF∗ and F′
∗ are two projective resolutions ofN. Any two lifts of the
identity map are chain-homotopic, and so induce the same mapH∗(M ⊗RF∗) → H∗(M ⊗RF′
∗).
So iff :F∗ →F′
∗ and g :F′
∗ →F∗ are chain maps liﬁng the identity, thenf∗ ◦g∗ induces the same
self-map ofH∗(M ⊗RF′
∗) as the identity self-map does, and so (by functoriality) is the identity.
Similarly,g∗ ◦f∗ induces the identity map onH∗(M ⊗RF∗). So they induce inverse isomorphisms.
Putting all this together shows that any two projective resolutions ofN induce canonically
isomorphic modules TorR
n (M,N ), and that a homomorphismf : N′ → N induces a well deﬁned
map TorR
n (M,N′) → TorR
n (M,N ) that renders TorR
n (M, −) a functor.
My last comment aboutToris that there’s a symmetry there. Of course,M ⊗RN ∼=N ⊗RM.
This uses the fact that R is commutative. This leads right on to saying that TorR
n (M,N ) ∼=
TorR
n (N,M ). We’ve been computingTorby taking a resolution of the second variable. But I could
equally have taken a resolution of the ﬁrst variable. This follows from Theorem 22.1.
Example 22.4.I want to give an example when you do have higherTormodules. Letk be a ﬁeld,
and letR =k[d]/(d2). This is sometimes called the “dual numbers,” or the exterior algebra overk.
What is anR-module? It’s just ak-vector spaceM with an operatord (given by multiplication by
d) that satisﬁesd2 = 0. Even though there’s no grading around, I can still deﬁne the “homology”
of M:
H(M;d) = kerd
imd .
This k-algebra is augmented by an algebra mapϵ : R → k splitting the unit;ϵ(d) = 0. This
rendersk anR-module. Let’s construct a freeR-module resolution of this module. Here’s a picture.
• ←←
• •←←
• •←←
• •←←
• •←←
The vertical lines indicate multiplication byd. We could write this as
0 ←k ϵ← −R d← −R d← −R ← · · · .
Now tensor this overR with anR-moduleM; soM is a vector space equipped with an operator
d withd2 = 0. Each copy ofR gets replaced by a copy ofM, and the diﬀerential gives multiplication
byd on M. So taking homology gives
TorR
n (k,M ) =
{
k ⊗RM =M/dM for n = 0
H(M;d) forn> 0.
So for example
TorR
n (k,k ) =k for n ≥ 0.


## Page 61

58 CHAPTER 2. COMPUTATIONAL METHODS
23 Hom and Lim
We will now develop more properties of the tensor product: its relationship to homomorphisms and
to direct limits.
The tensor product arose in our study of bilinear maps. Even more natural arelinear maps.
Given a commutative ringR and twoR-modules M and N, we can think about the collection of
all R-linear maps fromM to N. Not only does this set form an abelian group (under pointwise
addition of homomorphisms); it forms anR-module, with
(rf)(y) =f(ry) =rf(y), r ∈R, y∈M.
The check that this is again anR-module homomorphism uses commutativity ofR. We will write
HomR(M,N ), or justHom(M,N ), for thisR-module.
Since Hom(M,N ) is anR-module, we are entitled to think about what anR-module homomor-
phism into it is. Given
f :L → Hom(M,N )
we can deﬁne a new function
ˆf :L ×M →N, ˆf(x,y ) = (f(x))(y) ∈N.
You should check that this new functionˆf is R-bilinear! So we get a natural map
Hom(L, Hom(M,N )) → Hom(L ⊗M,N ).
Conversely, given a mapˆf :L ⊗M →N and x ∈L, we can deﬁnef(x) :M →N by the same
formula. These are inverse operations, so:
Lemma 23.1. The natural mapHom(L, Hom(M,N )) → Hom(L ⊗M,N ) is an isomorphism.
One says that⊗ and Hom are adjoint, a word suggested by Sammy Eilenberg to Dan Kan, who
ﬁrst formulated this relationship between functors [7].
The second thing we will discuss is a generalization of one perspective on how the rational
numbers are constructed from the integers – by a limit process: there are compatible maps in the
diagram
Z 2 →→
1
↓↓
Z 3 →→
1/2
↓↓
Z 4 →→
1/3!
↓↓
Z 5 →→
1/4!
↓↓
· · ·
Q = →→ Q = →→ Q = →→ Q = →→ · · ·
and Q is the “universal,” or “initial,” abelian group you can map to.
We will formalize this process, using partially ordered sets as indexing sets. Recall from Lecture
3 that apartially ordered set, or poset, is a small categoryI such that #I(i,j ) ≤ 1 and the only
isomorphisms are the identity maps. We will be interested in a particular class of posets.
Deﬁnition 23.2. A poset (I, ≤) is directed if for everyi,j ∈ I there existsk ∈ I such thati ≤k
and j ≤k.
Example 23.3. This is a very common condition. A ﬁrst example is the natural numbersN with
≤ as the order. Another example is the positive natural numbers, withi ≤j ifi|j. This is because
i,j |(ij). A topological example: ifX is a space,A a subspace, andI is the set of open subsets of
X containing A, directed by saying thatU ≤ V if U ⊇ V. This is because an intersection of two
opens is again open.


## Page 62

23. HOM AND LIM 59
Deﬁnition 23.4.Let I be a directed set. AnI-directed systemin a categoryC is a functorI → C .
This means that for everyi ∈ I we are given an objectXi ∈ C, and for everyi ≤j we are given a
map fi,j :Xi →Xj, in such a way thatfi,i = 1Xi and ifi ≤j ≤k then fi,k =fj,k ◦fi,j :Xi →Xk.
Example 23.5. If I = (N, ≤), then you get a “linear system”X0
f01
− − →X1
f12
− − →X2 → · · ·.
Example 23.6. Suppose I = (N>0, |), i.e., the second example above. You can considerI → Ab,
say assigning to eachi the integersZ, andfij : Z
j/i
− − →Z.
Thesedirectedsystemscanbealittlecomplicated. Butthere’sasimpleone, namelytheconstant
one.
Example 23.7. Let I be any directed system. Any objectA ∈ C determines an I-directed set,
namely the constant functorcA : I → C .
Not every directed system is constant, but we can try to ﬁnd a best approximating constant
system. To compare systems, we need morphisms. I-directed systems in C are functors I → C .
They are related by natural transformations, and those are the morphisms in the category ofI-
directed systems. That is to say, a morphism is a choice of mapgi :Xi →Yi, for eachi ∈ I, such
that
Xi →→
gi
↓↓
Xj
gj
↓↓
Yi →→Yj
commutes for alli ≤j.
Deﬁnition 23.8. Let X : I → C be a directed system. Adirect limitis an objectL and a map
X →cL that is initial among maps to constant systems. This means that given any other map to
a constant system, sayX →cA, there is a unique mapf :L →A such that
cL
cf
↓↓
X
→→
→→cA
commutes.
This is a “universal property.” So two diﬀerent direct limits are canonically isomorphic; but a
directed system may fail to have a direct limit. For example, the linear directed systems we used
to create the rational numbers exists in the category of ﬁnitely generated abelian groups; butQ is
not ﬁnitely generated, and there’s no ﬁnitely generated group that will serve as a direct limit of this
system in the category of ﬁnitely generated abelian groups.
Example 23.9. Suppose we have an increasing sequence of subspaces,X0 ⊆X1 ⊆ · · · ⊆ X. This
gives us a directed system of spaces, directed by the poset(N, ≤). It’s pretty clear that as aset the
direct limit of this system is the union of the subspaces. Saying thatX is the direct limit of this
directed system of spaces is saying ﬁrst thatX is the union of theXi’s, and second that the topology
on X is determined by the topology on the subspaces; it’s the “weak topology,” characterized by
the property that a mapf :X →Y is continuous if and only if the restriction off to eachXn is
continuous. This is saying that a subset ofX is open if and only if its intersection with eachXn is
open inX. Our example is that a CW-complex is the direct limit of its skelata.


## Page 63

60 CHAPTER 2. COMPUTATIONAL METHODS
Direct limits may be constructed from the material of coproducts and quotients. So suppose
X : I → C is a directed system. To construct the direct limit, begin by forming the coproduct over
the elements ofI, ∐
i∈I
Xi.
There are maps ini : Xi → ∐Xi, but they are not yet compatible with the order relation inI.
Form a quotient of the coproduct to enforce that compatibility:
lim− →i∈I
Xi =
(∐
i∈I
Xi
)
/ ∼
where ∼ is the equivalence relation generated by requiring that for anyi ∈ I and anyx ∈Xi,
inix ∼ injfij(x).
The process of forming the coproduct and the quotient will depend upon the category you are
working in, and may not be possible. In sets, coproduct is disjoint union and the quotient just
forms equivalence classes. In abelian groups, the coproduct is the direct sum and to form the
quotient you divide by the subgroup generated by diﬀerences.
Direct limits and the tensor product are nicely related, and the way to see that is to use the
adjunction with Hom that we started with today.
Proposition 23.10. Let I be a direct set, and letM : I → ModR be a I-directed system of
R-modules. There is a natural isomorphism
(lim− →I
Mi) ⊗RN ∼= lim− →I
(Mi ⊗RN).
Proof. Let’s verify that both sides satisfy the same universal property. A map from(lim− →IMi) ⊗RN
to anR-module L is the same thing as a linear maplim− →IMi → HomR(N,L ). This is the same as
a compatible family of mapsMi → HomR(N,L ), which in turn is the same as a compatible family
of mapsMi ⊗RN →L, which is the same as a linear maplim− →I(Mi ⊗RN) →L.
Here’s a lemma that lets us identify when a map to a constant functor is a direct limit.
Lemma 23.11.LetX : I → Ab (or ModR). A mapf :X →cL (given byfi :Xi →L for i ∈ I)
is the direct limit if and only if:
1. For everyx ∈L, there exists ani and anxi ∈Xi such thatfi(xi) =x.
2. Letxi ∈Xi be such thatfi(xi) = 0 in L. Then there exists somej ≥i such thatfij(xi) = 0
in Xj.
Proof. Straightforward.
Proposition 23.12. The direct limit functorlim− →I : Fun(I, Ab) → Ab is exact. In other words, if
X
p
− →Y
q
− →Z is an exact sequence ofI-directed systems (meaning that at every degree we get an
exact sequence of abelian groups), thenlim− →IX → lim− →IY → lim− →IZ is exact.


## Page 64

24. UNIVERSAL COEFFICIENT THEOREM 61
Proof. First of all,qp : X → Z is zero, which is to say that it factors through the constant zero
object, so lim− →IX → lim− →IZ is certainly the zero map. Lety ∈ lim− →IY, and supposey maps to 0 in
lim− →IZ. By condition (1) of Lemma 23.11, there existsi such thaty =fi(yi) for someyi ∈Yi. Then
0 =q(y) =fiq(yi) because q is a map of direct systems. By condition (2), this means that there is
j ≥i such thatfijq(yi) = 0 in Zj. So qfijyi = 0, again becauseq is a map of direct systems. We
have an element inYj that maps to zero underq, so there is somexj ∈ Xj such thatp(xj) = yj.
Then fj(xj) ∈ lim− →IX maps toy.
The exactness of the direct limit has many useful consequences. For example:
Corollary 23.13. Let i ↦→ C(i) be a directed system of chain complexes. Then there is a natural
isomorphism
lim− →i∈I
H∗(C(i)) →H∗(lim− →i∈I
C(i)).
Putting together things we have just said:
Corollary 23.14.H∗(X; Q) =H∗(X) ⊗ Q.
So we can redeﬁne the Betti numbers of a spaceX as
βn = dimQHn(X; Q)
and discuss the Euler characteristic entirely in terms of the rational vector spaces making up the
rational homology ofX.
24 Universal coeﬃcient theorem
Suppose that we are givenH∗(X; Z). Can we computeH∗(X; Z/2Z)? This is non-obvious. Consider
the mapRP2 →S2 that pinchesRP1 to a point. NowH2(RP2; Z) = 0, so inH2 this map is zero.
But in Z/2Z-coeﬃcients, in dimension2, this map gives an isomorphism. This shows that there’s
no functorial determination of H∗(X; Z/2) in terms ofH∗(X; Z); the eﬀect of a map in integral
homology does not determine its eﬀect in mod 2 homology. So howdo we go between diﬀerent
coeﬃcients?
LetR be a commutative ring andM anR-module, and suppose we have a chain complexC∗ of
R-modules. It could be the singular complex of a space, but it doesn’t have to be. Let’s compare
Hn(C∗) ⊗M withHn(C∗ ⊗M). (Here and below we’ll just write⊗ for ⊗R.) The latter thing gives
homology with coeﬃcients inM. How can we compare these two? Let’s investigate, and build up
conditions onR and C∗ as we go along.
First, there’s a natural map
α :Hn(C∗) ⊗M →Hn(C∗ ⊗M),


## Page 65

62 CHAPTER 2. COMPUTATIONAL METHODS
sending [z] ⊗m to [z ⊗m]. We propose to ﬁnd conditions under which it is injective. The mapα
ﬁts into a commutative diagram with exact columns like this:
0 0
Hn(C∗) ⊗M α →→
↑↑
Hn(C∗ ⊗M)
↑↑
Zn(C∗) ⊗M →→
↑↑
Zn(C∗ ⊗M)
↑↑
Cn+1 ⊗M = →→
↑↑
Cn+1 ⊗M.
↑↑
Now, Zn(C∗ ⊗M) is a submodule ofCn ⊗M, but the mapZn(C) ⊗M → Cn ⊗M need not be
injective ...unless we impose more restrictions. If we can guarantee that it is, then a diagram chase
shows thatα is a monomorphism.
So let’s assume thatR is a PID and thatCn is a freeR-module for alln. Then the submodule
Bn−1(C∗) ⊆Cn−1 is again free, so the short exact sequence
0 →→Zn(C∗) →→Cn →→
d
↘↘
Bn−1(C∗) →→
↓↓
0
Cn−1
splits. SoZn(C∗) →Cn is a split monomorphism, and henceZn(C∗) ⊗M →Cn ⊗M is too.
In fact, a little thought shows that this argument produces a splitting of the mapα.
Now, α is not always an isomorphism. But it certainly is ifM = R, and it’s compatible with
direct sums, so it certainly is ifM is free. The idea is now to resolveM by frees, and see where
that idea takes us.
So let
0 →F1 →F0 →M → 0
be a free resolution ofM. Again, we’re using the assumption thatR is a PID, to guarantee that
ker(F0 →M) is free. Again using the assumption that eachCn is free, we get a short exact sequence
of chain complexes
0 →C∗ ⊗F1 →C∗ ⊗F0 →C∗ ⊗M → 0.
In homology, this gives a long exact sequence. Unsplicing it gives the left-hand column in the


## Page 66

25. KÜNNETH AND EILENBERG-ZILBER 63
following diagram.
0
↓↓
0
↓↓
coker(Hn(C∗ ⊗F1) →Hn(C∗ ⊗F0))
↓↓
∼= →→ coker(Hn(C∗) ⊗F1 →Hn(C∗) ⊗F0))
↓↓
Hn(C∗ ⊗M)
∂
↓↓
= →→Hn(C∗ ⊗M)
↓↓
ker(Hn−1(C∗ ⊗F1) →Hn−1(C∗ ⊗F0))
∼= →→
↓↓
ker(Hn−1(C∗) ⊗F1 →Hn−1(C∗) ⊗F0)
↓↓
0 0
The right hand column occurs becauseα is an isomorphism when the module involved is free. But
coker(Hn(C∗) ⊗F1 →Hn(C∗) ⊗F0)) =Hn(C∗) ⊗M
and
ker(Hn−1(C∗) ⊗F1 →Hn−1(C∗) ⊗F0) = TorR
1 (Hn−1(C∗),M ).
We have proved the following theorem.
Theorem 24.1 (Universal Coeﬃcient Theorem). Let R be a PID andC∗ a chain complex ofR-
modules such thatCn is free for alln. Then there is a natural short exact sequence ofR-modules
0 →Hn(C∗) ⊗M α− →Hn(C∗ ⊗M) ∂− →TorR
1 (Hn−1(C∗),M ) → 0
that splits (but not naturally).
Example 24.2.The pinch mapRP2 →S2 induces the following map of universal coeﬃcient short
exact sequences:
0 →→H2(RP2) ⊗ Z/2Z
0
↓↓
→→H2(RP2; Z/2Z)
∼=
↓↓
∼= →→ Tor1(H1(RP2), Z/2Z)
0
↓↓
→→ 0
0 →→H2(S2) ⊗ Z/2Z
∼= →→H2(S2; Z/2Z) →→ Tor1(H1(S2), Z/2Z) →→ 0
This shows that the splitting of the universal coeﬃcient short exact sequence cannot be made
natural, and it explains the mystery that we began with.
Exercise 24.3. The hypotheses are essential. Construct two counterexamples: one withR = Z
but in which the groups in the chain complex are not free, and one in whichR =k[d]/d2 and the
modules inC∗ are free overR.
25 Künneth and Eilenberg-Zilber
We want to compute the homology of a product. Long ago, in Lecture 7, we constructed a bilinear
map Sp(X) ×Sq(Y ) → Sp+q(X ×Y ), called the cross product. So we get a linear mapSp(X) ⊗
Sq(Y ) →Sp+q(X ×Y ), and it satisﬁes the Leibniz formula, i.e.,d(x ×y) =dx ×y + (−1)px ×dy.
The method we used works with any coeﬃcient ring, not just the integers.


## Page 67

64 CHAPTER 2. COMPUTATIONAL METHODS
Deﬁnition 25.1. Let C∗,D∗ be two chain complexes. Theirtensor productis the chain complex
with
(C∗ ⊗D∗)n =
⨁
p+q=n
Cp ⊗Dq.
Thediﬀerential (C∗⊗D∗)n → (C∗⊗D∗)n−1 sendsCp⊗Dq intothesubmodule Cp−1⊗Dq
⨁Cp⊗Dq−1
by
x ⊗y ↦→dx ⊗y + (−1)px ⊗dy.
So the cross product is a map of chain complexesS∗(X) ⊗S∗(Y ) →S∗(X ×Y ). There are two
questions:
(1) Is this map an isomorphism in homology?
(2) How is the homology of a tensor product of chain complexes related to the tensor product of
their homologies?
It’s easy to see what happens in dimension zero, becauseπ0(X) ×π0(Y ) = π0(X ×Y ) implies
that H0(X) ⊗H0(Y )
∼=− →H0(X ×Y ).
Let’s dispose of the purely algebraic question (2) ﬁrst.
Theorem 25.2. LetR be a PID andC∗,D∗ be chain complexes ofR-modules. Assume thatCn is
a freeR-module for alln. There is a short exact sequence
0 →
⨁
p+q=n
Hp(C) ⊗Hq(D) →Hn(C∗ ⊗D∗) →
⨁
p+q=n−1
TorR
1 (Hp(C),Hq(D)) → 0
natural in these data, that splits (but not naturally).
Proof. This is exactly the same as the proof for the UCT. It’s a good idea to work through this on
your own.
Corollary 25.3. Let R be a PID and assumeC′
n and Cn are R free for alln. If C′
∗ → C∗ and
D′
∗ →D∗ are homology isomorphisms then so isC′
∗ ⊗D′
∗ →C∗ ⊗D∗.
Our attack on question (1) is via the method of “acyclic models.” This is really a special case of
the Fundamental Theorem of Homological Algebra, Theorem 22.1.
Deﬁnition 25.4. Let C be a category, and ﬁx a setM of objects in C, to be called the “models.”
A functor F : C → Ab is M-free if it is the free abelian group generated by a coproduct of
corepresentable functors. That is, F is a direct sum of functors of the form ZC(M, −) where
M ∈ M.
Example 25.5. Since we are interested in the singular homology of a product of two spaces, it
may be sensible to take asC the category of ordered pairs of spaces,C = Top2, and forM the set
of pairs of simplicies,M = {(∆p, ∆q) :p,q ≥ 0}. Then
Sn(X ×Y ) = Z[Top(∆n ×X) × Top(∆n,Y )] = ZTop2((∆n, ∆n), (X,Y )).
is M-free.
Example 25.6. With the same category and models,
(S∗(X) ⊗S∗(Y ))n =
⨁
p+q=n
Sp(X) ⊗Sq(Y ),


## Page 68

25. KÜNNETH AND EILENBERG-ZILBER 65
is M-free, since the tensor product has as free basis the set
∐
p+q=n
Sinp(X) × Sinq(Y ) =
∐
p+q=n
Top2((∆p, ∆q), (X,Y )).
Deﬁnition 25.7. A natural transformation of functors θ : F → G is an M-epimorphism if
θM : F (M) → G(M) is a surjection of abelian groups for everyM ∈ M. A sequence of natu-
ral transformations is a composable pairG′ → G → G′′ with trivial composition. Let K be the
objectwise kernel ofG →G′′. There is a factorizationG′ →K. The sequence isM-exact ifG′ →K
is a M-epimorphism. Equivalently,G′(M) →G(M) →G′′(M) is exact for allM ∈ M.
Example 25.8. We claim that
· · · →Sn(X ×Y ) →Sn−1(X ×Y ) → · · · → S0(X ×Y ) →H0(X ×Y ) → 0
is M-exact. Just plug in(∆p, ∆q): you get an exact sequence, since∆p × ∆q is contractible.
Example 25.9. The sequence
· · · → (S∗(X) ⊗S∗(Y ))n → (S∗(X) ⊗S∗(Y ))n−1 → · · · → S0(X) ⊗S0(Y ) →H0(X) ⊗H0(Y ) → 0.
is also M-exact, by Corollary 25.3.
The terms “M-free” and “M-exact” relate to each other in the expected way:
Lemma 25.10.Let C be a category with a set of modelsM and letF,G,G′ : C → Ab be functors.
Suppose thatF is M-free, letG′ → G be a M-epimorphism, and letf : F → G be any natural
transformation. Then there is a lifting:
G′
↓↓
F
f
↗↗
f →→G
Proof. Clearly we may assume thatF (X) = ZC(M,X ). Suppose thatX =M ∈ M. We get:
G′(M)
↓↓↓↓
ZC(M,M )
f M
↗↗
fM →→G(M)
Consider 1M ∈ ZC(M,M ). Its image fM(1M) ∈ G(M) is hit by some element incM ∈ G′(M),
since G′ →G is an M-epimorphism. Deﬁne fM(1M) =cM.
Now we exploit naturality! Anyϕ :M →X produces a commutative diagram
C(M,M )
f M →→
ϕ∗
↓↓
G′(M)
ϕ∗
↓↓
C(M,X )
f X →→G′(X)
Chase 1M around the diagram, to see what the value offX(ϕ) must be:
fX(ϕ) =fX(ϕ∗(1M)) =ϕ∗(fM(1M)) =ϕ∗(cM).
Now extend linearly. You should check that this does deﬁne a natural transformation.


## Page 69

66 CHAPTER 2. COMPUTATIONAL METHODS
This is precisely the condition required to prove the Fundamental Theorem of Homological
Algebra. So we have the
Theorem 25.11 (Acyclic Models). Let M be a set of models in a categoryC. Let θ : F → G be
a natural transformation of functors fromC to Ab. Let F∗ and G∗ be functors from C to chain
complexes, with augmentationsF0 →F andG0 →G. Assume thatFn is M-free for alln, and that
G∗ →G → 0 is an M-exact sequence. Then there is a unique chain homotopy class of chain maps
F∗ →G∗ coveringθ.
Corollary 25.12.Suppose furthermore thatθ is a natural isomorphism. If eachGn is M-free and
F∗ →F → 0 is an M-exact sequence, then any natural chain mapF∗ →G∗ coveringθ is a natural
chain homotopy equivalence.
Applying this to our categoryTop2 with models as before, we get the following theorem that
completes work we did in Lecture 7.
Theorem 25.13(Eilenberg-Zilber theorem). There are unique chain homotopy classes of natural
chain maps:
S∗(X) ⊗S∗(Y )⇆S∗(X ×Y )
covering the usual isomorphism
H0(X) ⊗H0(Y ) ∼=H0(X ×Y ),
and they are natural chain homotopy inverses.
Corollary 25.14. There is a canonical natural isomorphismH(S∗(X) ⊗S∗(Y )) ∼=H∗(X ×Y ).
Combining this theorem with the algebraic Künneth theorem, we get:
Theorem 25.15(Künneth theorem). Take coeﬃcients in a PIDR. There is a short exact sequence
0 →
⨁
p+q=n
Hp(X) ⊗RHq(Y ) →Hn(X ×Y ) →
⨁
p+q=n−1
TorR
1 (Hp(X),Hq(Y )) → 0
natural inX, Y. It splits asR-modules, but not naturally.
Example 25.16. If R =k is a ﬁeld, every module is free, so theTorterm vanishes, and you get a
Künneth isomorphism:
× :H∗(X;k) ⊗kH∗(Y ;k)
∼=− →H∗(X ×Y ;k)
This is rather spectacular. For example, what isH∗(RP3 × RP3;k), wherek is a ﬁeld? Well,
if k has characteristic diﬀerent from 2,RP3 has the same homology asS3, so the product has the
same homology asS3 ×S3: the dimensions are 1, 0, 0, 2, 0, 0, 1. If chark = 2, on the other hand,
the cohomology modules are either 0 ork, and we need to form the graded tensor product:
k k k k
k k k k
k k k k
k k k k
so the dimensions of the homology of the product are1, 2, 3, 4, 3, 2, 1.


## Page 70

25. KÜNNETH AND EILENBERG-ZILBER 67
The palindromic character of this sequence will be explained by Poincaré duality. Let’s look
also at what happens over the integers. Then we have the table of tensor products
Z Z /2Z 0 Z
Z Z Z /2Z 0 Z
Z/2Z Z/2Z Z /2Z 0 Z/2Z
0 0 0 0 0
Z Z Z /2Z 0 Z
There is only one nonzeroTor group, namely
TorZ
1 (H1(RP3),H 1(RP3)) = Z/2Z.
Putting this together, we get the groups
H0 Z
H1 Z/2Z ⊕ Z/2Z
H2 Z/2Z
H3 Z ⊕ Z ⊕ Z/2Z
H4 Z/2Z ⊕ Z/2Z
H5 0
H6 Z
The failure of perfect symmetry here is interesting, and will also be explained by Poincaré duality.


## Page 71

Chapter 3
Cohomology and duality
26 Coproducts, cohomology
The next topic is cohomology. This is like homology, but it’s a contravariant rather than covariant
functor of spaces. There are three reasons why you might like a contravariant functor.
(1) Many geometric contructionspull back; that is, they behave contravariantly. For example, if I
have some covering space ˜X → X and a mapf : Y → X, I get a pullback covering spacef∗ ˜X.
A better example is vector bundles (that we’ll talk about in 18.906) – they don’t push out, they
pullback. So if we want to study them by means of “natural” invariants, these invariants will have
to lie in a (hopefully computable) group that also behaves contravariantly. This will lead to the
theory ofcharacteristic classes.
(2) The structure induced by the diagonal map from a space to its square induces stucture in
contravariant functors that is more general and easier to study.
(3) Cohomology turns out to be the target of the Poincaré duality map.
Let’s elaborate on point (2). Every space has a diagonal map
X ∆− →X ×X.
This induces a mapH∗(X;R) → H∗(X ×X;R), for any coeﬃcient groupR. Now, ifR is a ring,
we get a cross product map
× :H∗(X;R) ⊗RH∗(X;R) →H∗(X ×X;R).
If R is a PID, the Künneth Theorem tells us that this map is a monomorphism. If the remaining
term in the Künneth Theorem is zero, the cross product is an isomorphism. So ifH∗(X;R) is free
overR (or even just ﬂat overR), we get a “diagonal” or “coproduct”
∆ :H∗(X;R) →H∗(X;R) ⊗RH∗(X;R).
If R is a ﬁeld, this map is universally deﬁned, and natural inX.
This kind of structure is unfamiliar, and at ﬁrst seems a bit strange. After all, the tensor product
is deﬁned by a universal property for mapsout of it; mapsinto it just are what they are.
Still, it’s often useful, and we pause to ﬁll in some of its properties.
Deﬁnition 26.1.LetR be a ring. A(graded) coalgebraoverR is a (graded)R-moduleM equipped
with a “comultiplication”∆ :M →M ⊗RM and a “counit” mapε :M →R such that the following
69


## Page 72

70 CHAPTER 3. COHOMOLOGY AND DUALITY
diagrams commute.
M
∆
↓↓
=
→→
=
←←
R ⊗RM M ⊗RM
ε⊗1←← 1⊗ε →→M ⊗RR
M ∆ →→
∆
↓↓
M ⊗RM
∆⊗1
↓↓
M ⊗RM
1⊗∆→→M ⊗RM ⊗RM
It iscommutative if in addition
M
∆
↙↙
∆
↘↘
M ⊗RM τ →→M ⊗RM
commutes, whereτ(x ⊗y) = (−1)|x|·|y|y ⊗x is the twist map.
Using acyclic models, you saw for homework that the the Künneth map is associative and
commutative: The diagrams
S∗(X) ⊗S∗(Y ) ⊗S∗(Z)
×⊗1 →→
1⊗×
↓↓
S∗(X ×Y ) ⊗S∗(Z)
×
↓↓
S∗(X) ⊗S∗(Y ×Z)
× →→S∗(X ×Y ×Z)
and
S∗(X) ⊗S∗(Y ) τ →→
×
↓↓
S∗(Y ) ⊗S∗(X)
×
↓↓
S∗(X ×Y )
T∗ →→S∗(Y ×X)
commute up to natural chain homotopy, whereτ is as deﬁned above on the tensor product and
T :X ×Y →Y ×X is the swap map. Similar diagrams apply to the standard comparison map for
the homology of tensor products of chain complexes,
µ :H∗(C) ⊗H∗(D) →H∗(C ⊗D),
and the result is this:
Corollary 26.2.SupposeR is a PID andH∗(X;R) is free overR. ThenH∗(X;R) has the natural
structure of a commutative graded coalgebra overR.
We could now just go on and talk about coalgebras. But they are less familiar, and available
only ifH∗(X;R) is free overR. So instead we’re going to dualize, talk about cohomology, and get
an algebra structure. Some say that cohomology is better because you have algebras, but that’s
more of a sociological statement than a mathematical one.
Let’s get on with it.


## Page 73

26. COPRODUCTS, COHOMOLOGY 71
Deﬁnition 26.3. Let N be an abelian group. A singular n-cochain on X with values inN is a
function Sinn(X) →N.
IfN is anR-module, then I can extend linearly to get anR-module homomorphismSn(X;R) →
N.
Notation 26.4. Write
Sn(X;N) = Map(Sinn(X),N ) = HomR(Sn(X;R),N ).
This is going to give us something contravariant, that’s for sure. But we haven’t quite ﬁnished
dualizing. The diﬀerentiald :Sn+1(X;R) →Sn(X;R) induces a “coboundary map”
d :Sn(X;N) →Sn+1(X;N)
deﬁned by
(df)(σ) = (−1)n+1f(dσ).
The sign is a little strange, and we’ll see an explanation in a minute. Anyway, we get a “cochain
complex,” with a diﬀerential thatincreasesdegree by 1. We still haved2 = 0, since
(d2f)(σ) = ±d(f(dσ)) = ±f(d2σ) = ±f(0) = 0,
so we can still take homology of this cochain complex.
Deﬁnition 26.5.Thenth singular cohomology groupofX with coeﬃcients in an abelian groupN
is
Hn(X;N) = ker(Sn(X;N) →Sn+1(X;N))
im(Sn−1(X;N) →Sn(X;N)) .
If N is anR-module, thenHn(X;N) is again anR-module.
Let’s ﬁrst computeH0(X;N). A 0-cochain is a functionSin0(X) →N; that is, a function (not
required to be continuous!)f :X →N. To computedf, take a1-simplexσ : ∆1 →X and evaluate
f on its boundary:
(df)(σ) = −f(dσ) = −f(σ(e0) −σ(e1)) =f(σ(e1)) −f(σ(e0)).
So f is a cocycle if it’s constant on path components. That is to say:
Lemma 26.6.H0(X;N) = Map(π0(X),N ).
Warning 26.7. Sn(X; Z) = Map(Sin n(X); Z) = ∏
Sinn(X) Z, which is probably an uncountable
product. An awkward fact is that this is never free abelian.
Theﬁrstthingacohomologyclassdoesistogivealinearfunctionalonhomology, by“evaluation.”
Let’s spin this out a bit.
We want to tensor together cochains and chains. But to do that we should make the diﬀerential
in S∗(X) go down, not up. Just as a notational matter, let’s write
S∨
−n(X;N) =Sn(X;N)
and deﬁne a diﬀerentiald :S∨
−n(X) →S∨
−n−1(X) to be the diﬀerentiald :Sn(X) →Sn+1(X). Now
S∨
∗ (X) is a chain complex, albeit a negatively graded one. Form the graded tensor product, with
(
S∨
∗ (X;N) ⊗S∗(X)
)
n =
⨁
p+q=n
S∨
p (X;N) ⊗Sq(X).


## Page 74

72 CHAPTER 3. COHOMOLOGY AND DUALITY
Now evaluation is a map of graded abelian groups
⟨−, −⟩ :S∨
∗ (X;N) ⊗S∗(X) →N,
where N is regarded as a chain complex concentrated in degree 0. We would like this map to be a
chain map. So letf ∈Sn(X;N) and σ ∈Sn(X), and compute
0 =d⟨f,σ ⟩ = ⟨df,σ⟩ + (−1)n⟨f,dσ ⟩.
This forces
(df)(σ) = ⟨df,σ⟩ = −(−1)nf(dσ),
explaining the odd sign in our deﬁnition above.
Here’s the payoﬀ: There’s a natural map
H−n(S∨
∗ (X;N)) ⊗Hn(S∗(X))
µ
− →H0
(
S∨
∗ (X;N) ⊗S∗(X)
)
→N
This gives us theKronecker pairing
⟨−, −⟩ :Hn(X;N) ⊗Hn(X) →N.
We can develop the properties of cohomology in analogy with properties of homology. For
example: If A ⊆ X, there is a restriction mapSn(X;N) → Sn(A;N), induced by the injection
Sinn(A) ↪→ Sinn(X). And as long asA is nonempty, we can split this injection, so any function
Sinn(A) → N extends to Sinn(X) → N. This means that Sn(X;N) → Sn(A;N) is surjective.
(This is the case ifA = ∅, as well!)
Deﬁnition 26.8. The relativen-cochain groupwith coeﬃcients inN is
Sn(X,A ;N) = ker (Sn(X;N) →Sn(A;N)) .
This deﬁnes a sub cochain complex ofS∗(X;N), and we deﬁne
Hn(X,A ;N) =Hn(S∗(X,A ;N)).
The short exact sequence of cochain complexes
0 →S∗(X,A ;N) →S∗(X;N) →S∗(A;N) → 0
induces thelong exact cohomology sequence
· · ·
H1(X,A ;N) →→H1(X;N) →→H1(A;N)
δ
←←
H0(X,A ;N) →→H0(X;N) →→H0(A;N).
δ
←←


## Page 75

27. EXT AND UCT 73
27 Ext and UCT
LetR be a ring (probably a PID) andN anR-module. The singular cochains onX with values in
N,
S∗(X;N) = Map(Sin∗(X),N ),
then forms a cochain complex ofR-modules. It is contravariantly functorial inX and covariantly
functorial inN. The Kronecker pairing deﬁnes a map
Hn(X;N) ⊗RHn(X;R) →N
whose adjoint
β :Hn(X;N) → HomR(Hn(X;R),N )
gives us an estimate of the cohomology in terms of the homology ofX. Here’s how well it does:
Theorem 27.1 (Mixed variance Universal Coeﬃcient Theorem). Let R be a PID andN an R-
module, and letC∗ be a chain-complex of freeR-modules. Then there is a short exact sequence of
R-modules,
0 → Ext1
R(Hn−1(C∗),N ) →Hn(HomR(C∗,N )) → HomR(Hn(C∗),N ) → 0,
natural inC∗ and N, that splits (but not naturally).
TakingC∗ =S∗(X;R), we have the short exact sequence
0 → Ext1
R(Hn−1(X;R),N ) →Hn(X;N)
β
− →HomR(Hn(X;R),N ) → 0
that splits, but not naturally. This also holds for relative cohomology.
What is this Ext?
The problem that arises is thatHomR(−,N ) : ModR → ModR is not exact. Suppose I have
an injectionM′ →M. Is Hom(M,N ) → Hom(M′,N ) surjective? Does a mapM′ →N necessarily
extend to a mapM →N? No! For example,Z/2Z↪→ Z/4Z is an injection, but the identity map
Z/2Z → Z/2Z does not extend overZ/4Z.
On the other hand, ifM′ i− →M
p
− →M′′ → 0 is an exact sequence ofR-modules then
0 → HomR(M′′,N ) → HomR(M,N ) → HomR(M′,N )
is again exact. Check this statement!
Now homological algebra comes to the rescue to repair the failure of exactness. Pick a free
resolution ofM,
0 ←M ←F0 ←F2 ← · · · .
Apply Hom(−,N ) to get a cochain complex
0 → HomR(F0,N ) → HomR(F1,N ) → HomR(F2,N ) → · · · .
Deﬁnition 27.2. Extn
R(M,N ) =Hn(HomR(F∗,N )).
Remark 27.3. Ext is well-deﬁned and functorial, by the Fundamental Theorem of Homological
Algebra, Theorem 22.1. IfM is free (or projective) thenExtn
R(M, −) = 0 for n >0, since we can
takeM as its own projective resolution. IfR is a PID, then we can assumeF1 = ker(F0 →M) and
Fn = 0 for n> 1, so Extn
R = 0 if n> 1. IfR is a ﬁeld, thenExtn
R = 0 for n> 0.


## Page 76

74 CHAPTER 3. COHOMOLOGY AND DUALITY
Example 27.4. Let R = Z and takeM = Z/kZ. This admits a simple free resolution:0 → Z k− →
Z → Z/kZ → 0. Apply Hom(−,N ) to it, and remember thatHom(Z,N ) = N, to get the very
short cochain complex, with entries in dimensions 0 and 1:
0 →N k− →N → 0.
Taking homology gives us
Hom(Z/kZ,N ) = ker(k|N) Ext 1(Z/kZ,N ) =N/kN.
Proof of Theorem 27.1.First of all, we can’t just copy the proof (in Lecture 24) of the homology
universal coeﬃcient theorem, sinceExt1
R(−,R ) is not generally trivial.
Instead, we start by thinking about what ann-cocycle inHomR(C∗,N ) is: it’s a homomorphism
Cn →N such that the compositeCn+1 →Cn →N is trivial. WriteBn ⊆Cn for the submodule of
boundaries. We have a homomorphism that killsBn; that is,
Zn(HomR(C∗,N ))
∼=− →HomR(Cn/Bn,N ).
NowHn(C∗) (which we’ll abbreviate asHn) is the submoduleZn/Bn of Cn/Bn; we have an exact
sequence
0 →Hn →Cn/Bn →Bn−1 → 0.
Apply HomR(−,N ) to this short exact sequence. The result is again short exact, becauseBn−1 is a
submodule of the freeR-module Cn−1 and hence is free. This gives us the bottom line in the map
of short exact sequences
0 →→Bn HomR(C∗,N ) →→
↓↓
Zn HomR(C∗,N )
∼=
↓↓
→→Hn(HomR(C∗,N ))
β
↓↓
→→ 0
0 →→ HomR(Bn−1,N ) →→ HomR(Cn/Bn,N ) →→ HomR(Hn,N ) →→ 0.
The mapβ is the one we started with. The snake lemma now shows that it is surjective and that
kerβ ∼= coker(Bn HomR(C∗,N ) → HomR(Bn−1,N )).
An element ofBn HomR(C∗,N ) is a mapCn → N that factors asCn
d− →Cn−1 → N. The
observation is now that this is the same as factoring asCn
d− →Zn−1 → N; once this factorization
has been achieved, the mapZn−1 → N automatically extends to all ofCn−1. This is because
Zn−1 ⊆Cn−1 as a direct summand: the short exact sequence
0 →Zn−1 →Cn−1 →Bn−2 → 0
splits sinceBn−2 is free. Consequently we can rewrite our forumula forkerβ as
kerβ ∼= coker(HomR(Zn−1,N ) → HomR(Bn−1,N )).
But after all
0 ←Hn−1 ←Zn−1 ←Bn−1 ← 0
is a free resolution, so this cokernel is preciselyExt1
R(Hn−1(C∗),N ).


## Page 77

27. EXT AND UCT 75
Question 27.5. Why isExt called Ext?
Answer: It classiﬁes extensions. LetR be a commutative ring, and letM,N be twoR-modules. I
can think about “extensions ofM byN,” that is, short exact sequences of the form
0 →N →L →M → 0.
For example, I have two extensions ofZ/2Z by Z/2Z:
0 → Z/2Z → Z/2Z ⊕ Z/2Z → Z/2Z → 0
and
0 → Z/2Z → Z/4Z → Z/2Z → 0.
We’ll say that two extensions areequivalent if there’s a map of short exact sequences between them
that is the identity onN and onM. The two extensions above aren’t equivalent, for example.
Another deﬁnition of Ext1
R(M,N ) is: the set of extensions like this modulo this notion of
equivalence. The zero in the group is the split extension.
The universal coeﬃcient theorem is useful in transferring properties of homology to cohomology.
For example, iff :X →Y is a map that induces an isomorphism inH∗(−;R), then it induces an
isomorphism inH∗(−;N) for anyR-module N, at least provided thatR is a PID. (This is in fact
true in general.)
Cohomology satisﬁes the appropriate analogues of the Eilenberg-Steenrod axioms.
Homotopy invariance:If f0 ≃f1 : (X,A ) → (Y,B ), then
f∗
0 =f∗
1 :H∗(Y,B ;N) →H∗(X,A ;N).
I can’t use the UCT to address this. But we established a chain homotopyf0,∗ ≃f1,∗ :S∗(X,A ) →
S∗(Y,B ), and applyingHom converts chain homotopies to cochain homotopies.
Excision: If U ⊆A ⊆X such thatU ⊆ Int(A), thenH∗(X,A ;N) →H∗(X −U,A −U;N) is an
isomorphism. This follows from excision in homology and the mixed variance UCT.
Milnor axiom: The inclusions induce an isomorphism
H∗(
∐
α
Xα;N) →
∏
α
H∗(Xα;N).
As a result, it enjoys the fruit of these axioms, such as:
The Mayer-Vietoris sequence:If A,B ⊆X are such that their interiors coverX, then there is
a long exact sequence
Hn+1(X;N) →→ · · ·
Hn(X;N) →→Hn(A;N) ⊕Hn(B;N) →→Hn(A ∩B;N)
←←
· · · →→Hn−1(A ∩B;N)
←←


## Page 78

76 CHAPTER 3. COHOMOLOGY AND DUALITY
28 Products in cohomology
We’ll talk about the cohomology cross product ﬁrst. The ﬁrst step is to produce a map on chains
that goes in the reverse direction from the cross product we constructed in Lecture 7.
Construction 28.1.For each pair of natural numbersp,q, we will deﬁne a natural homomorphism
α :Sp+q(X ×Y ) →Sp(X) ⊗Sq(Y ).
It suﬃces to deﬁne this on simplices, so letσ : ∆p+q →X ×Y be a singular(p +q)-simplex in the
product. Let
σ1 = pr1 ◦σ : ∆p+q →X and σ2 = pr2 ◦σ : ∆p+q →Y
be the two coordinates ofσ. I have to produce ap-simplex inX and aq-simplex inY.
First deﬁne two maps in the simplex category:
– the “front face”αp : [p] → [p +q], sendingi to i for 0 ≤i ≤p, and
– the “back face”ωq : [q] → [p +q], sendingj to j +p for 0 ≤j ≤q.
Use the same symbols for the aﬃne extensions to maps∆p → ∆p+q and ∆q → ∆p+q. Now let
α(σ) = (σ1 ◦αp) ⊗ (σ2 ◦ωq).
This seems like a very random construction; but it works! It’s named after two great early
algebraic topologists, James W. Alexander and Hassler Whitney. For homework, you will show that
these maps assemble into a chain map
α :S∗(X ×Y ) →S∗(X) ⊗S∗(Y ).
This works over any ringR. To get a map in cohomology, we should form a composite
Sp(X;R)⊗RSq(Y ;R) → HomR(Sp(X;R)⊗RSq(Y ;R),R ) α∗
− →HomR(Sp+q(X×Y ;R),R ) =Sp+q(X×Y ;R).
The ﬁrst map goes like this: Given chain complexesC∗ and D∗, we can consider the dual cochain
complexes HomR(C∗,R ) and HomR(D∗,R ), and construct a chain map
HomR(C∗,R ) ⊗R HomR(D∗,R ) → HomR(C∗ ⊗RD∗,R )
by
f ⊗g ↦→
{
(x ⊗y ↦→ (−1)pqf(x)g(y)) |x| = |f | =p, |y| = |g| =q
0 otherwise.
Again, I leave it to you to check that this is a cochain map.
Altogether, we have constructed a natural cochain map
× :Sp(X) ⊗Sq(Y ) →Sp+q(X ×Y )
From this, we get a homomorphism
H∗(S∗(X) ⊗S∗(Y )) →H∗(X ×Y ).
I’m not quite done! As in the Künneth theorem, there is an evident natural map
µ :H∗(X) ⊗H∗(Y ) →H∗(S∗(X) ⊗S∗(Y )).


## Page 79

29. CUP PRODUCT, CONTINUED 77
The composite
× :H∗(X) ⊗H∗(Y ) →H∗(S∗(X) ⊗S∗(Y )) →H∗(X ×Y )
is thecohomology cross product.
It’s not very easy to do computations with this, directly. We’ll ﬁnd indirect means. Let me
make some points about this construction, though.
Deﬁnition 28.2. The cup productis the map obtained by takingX =Y and composing with the
map induced by the diagonal∆ :X →X ×X:
∪ :Hp(X) ⊗Hq(X) ×− →Hp+q(X ×X) ∆∗
− − →Hp+q(X),.
These deﬁnitions make good sense with any ring for coeﬃcients.
Let’s explore this deﬁnition in dimension zero. I claim thatH0(X;R) ∼= Map(π0(X),R ) as
rings. Whenp =q = 0, bothα0 andω0 are the identity maps, so we are just forming the pointwise
product of functions.
There’s a distinguished element inH0(X), namely the the functionπ0(X) → R that takes on
the value 1 on every path component. This is the identity for the cup product. This comes about
because when p = 0 in our above story, thenα0 is just including the 0-simplex, and ωq is the
identity.
The cross product is also associative, even on the chain level.
Proposition 28.3. Letf ∈Sp(X), g ∈Sq(Y ), andh ∈Sr(Z), and letσ : ∆p+q+r →X ×Y ×Z
be any simplex. Then
((f ×g) ×h)(σ) = (f × (g ×h))(σ).
Proof. Writeσ12 for the composite ofσ with the projection mapX ×Y ×Z →X ×Y, and so on.
Then
((f ×g) ×h)(σ) = (−1)(p+q)r(f ×g)(σ12 ◦αp+q)h(σ3 ◦ωr).
But
(f ×g)(σ12 ◦αp+q) = (−1)pqf(σ1 ◦αp)g(σ2 ◦µq),
where µq is the “middle face,” sendingℓ to ℓ +p for 0 ≤ℓ ≤q. In other words,
((f ×g) ×h)(σ) = (−1)pq+qr+rpf(σ1 ◦αp)g(σ2 ◦µq)h(σ3 ◦ωr).
I’ve used associativity of the ring. You get exactly the same thing when you expand(f ×(g ×h))(σ),
so the cross product is associative.
Of course the diagonal map is “associative,” too, and we ﬁnd that the cup product is associative:
(α ∪β) ∪γ =α ∪ (β ∪γ).
29 Cup product, continued
We have constructed an explicit mapSp(X) ⊗Sq(Y ) ×− →Sp+q(Y ) via:
(f ×g)(σ) = (−1)pqf(σ1 ◦αp)g(σ2 ◦ωq)


## Page 80

78 CHAPTER 3. COHOMOLOGY AND DUALITY
whereαp : ∆p → ∆p+q sendsi toi for 0 ≤i ≤p andωq : ∆q → ∆p+q sendsj toj +p for 0 ≤j ≤q.
This is a cochain map; it induces a “cross product”Hp(X) ⊗Hq(Y ) → Hp+q(X ×Y ), and, by
composing with the map induced by the diagonal embedding, the “cup product”
∪ :Hp(X) ⊗Hq(X) →Hp+q(X).
We formalize the structure that this product imposes on cohomology.
Deﬁnition 29.1. Let R be a commutative ring. A graded R-algebra is a graded R-module
...,A −1,A 0,A 1,A 2,... equipped with maps Ap ⊗R Aq → Ap+q and a map η : R → A0 that
make the following diagram commute.
Ap ⊗RR
1⊗η →→
=
↘↘
Ap ⊗RA0
↓↓
A0 ⊗RAq
↓↓
R ⊗RAq
η⊗1←←
=
↙↙Ap Aq
Ap ⊗R (Aq ⊗RAr) →→
↓↓
Ap ⊗RAq+r
↓↓
Ap+q ⊗RAr →→Ap+q+r
A gradedR-algebra A is commutative if the following diagram commutes:
Ap ⊗RAq
τ →→
↘↘
Aq ⊗RAp
↙↙
Ap+q
where τ(x ⊗y) = (−1)pqy ⊗x.
We claim thatH∗(X;R) forms a commutative gradedR-algebra under the cup product. This
is nontrivial. On the cochain level, this is clearly not graded commutative. We’re going to have to
work hard – in fact, so hard that you’re going to do it for homework. What needs to be checked is
that the following diagram commutes up to natural chain homotopy.
S∗(X ×Y )
T∗ →→
αX,Y
↓↓
S∗(Y ×X)
αY,X
↓↓
S∗(X) ⊗RS∗(Y ) τ →→S∗(Y ) ⊗RS∗(X)
Acyclic models helps us prove things like this.
You might hope that there is some way to produce a commutative product on a chain complex
modeling H∗(X). With coeﬃcients inQ, this is possible, by a construction due to Dennis Sullivan.
With coeﬃcients in a ﬁeld of nonzero characteristic, it is not possible. Steenrod operations provide
the obstruction.
My goal now is to compute the cohomology algebras of some spaces. Some spaces are easy!
There is no choice for the product structure onH∗(Sn), for example. (Whenn = 0, we get a free
module of rank 2 in dimension 0. This admits a variety of commutative algebra structures; but we


## Page 81

29. CUP PRODUCT, CONTINUED 79
have already seen thatH0(S0) = Z × Z as an algebra.) Maybe the next thing to try is a product
of spheres. More generally, we should ask whether there is an algebra structure onH∗(X) ⊗H∗(Y )
making the cross product an algebra map. IfA and B are two graded algebras, thereis a natural
algebra structure onA ⊗B, given by1 = 1 ⊗ 1 and
(a′ ⊗b′)(a ⊗b) = (−1)|b′|·|a|a′a ⊗b′b.
If A and B are commutative, then so isA ⊗B with this algebra structure.
Proposition 29.2. The cohomology cross product
× :H∗(X) ⊗H∗(Y ) →H∗(X ×Y )
is anR-algebra homomorphism.
Proof. I have diagonal maps∆X : X → X ×X and ∆Y : Y → Y ×Y. The diagonal onX ×Y
factors as
X ×Y
∆X×Y →→
∆X×∆Y
→→
X ×Y ×X ×Y
X ×X ×Y ×Y .
1×T×1
→→
Let α1,α 2 ∈ H∗(X) and β1,β 2 ∈ H∗(Y ). Then α1 ×β1,α 2 ×β2 ∈ H∗(X ×Y ), and I want to
calculate (α1 ×β1) ∪ (α2 ×β2). Let’s see:
(α1 ×β1) ∪ (α2 ×β2) = ∆∗
X×Y (α1 ×β1 ×α2 ×β2)
= (∆X × ∆Y )∗(1 ×T × 1)∗(α1 ×β1 ×α2 ×β2)
= (∆X × ∆Y )∗(α1 ×T∗(β1 ×α2) ×β2)
= (−1)|α2|·|β1|(∆X × ∆Y )∗(α1 ×α2 ×β1 ×β2).
Naturality of the cross product asserts that the diagram
H∗(X ×Y ) H∗(X) ⊗RH∗(Y )
×X×Y←←
H∗(X ×X ×Y ×Y )
(∆X×∆Y )∗
↑↑
H∗(X ×X) ⊗H∗(Y ×Y ).
×X×X,Y×Y←←
∆∗
X⊗∆∗
Y
↑↑
commute. We learn:
(α1 ×β1) ∪ (α2 ×β2) = (−1)|α2|·|β1|(∆X × ∆Y )∗(α1 ×α2 ×β1 ×β2)
= (−1)|α2|·|β1|(α1 ∪α2) × (β1 ∪β2).
That’s exactly what we wanted.
We will see later, in Theorem 33.3, that the cross product map is often an isomorphism.
Example 29.3.How aboutH∗(Sp ×Sq)? I’ll assume thatp andq are both positive, and leave the
other cases to you. The Künneth theorem guarantees that× : H∗(Sp) ⊗H∗(Sq) → H∗(Sp ×Sq)
is an isomorphism. Writeα for a generator ofSp and β for a generator ofSq; and use the same
notations for the pullbacks of these elements toSp ×Sq under the projections. Then
H∗(Sp ×Sq) = Z⟨1,α,β,α ∪β⟩,


## Page 82

80 CHAPTER 3. COHOMOLOGY AND DUALITY
and
α2 = 0, β 2 = 0, αβ = (−1)pqβα.
This calculation is useful!
Corollary 29.4. Letp,q >0. Any mapSp+q →Sp ×Sq induces the zero map inHp+q(−).
Proof. Let f : Sp+q → Sp ×Sq be such a map. It induces an algebra mapf∗ : H∗(Sp ×Sq) →
H∗(Sp+q). This map must killα and β, for degree reasons. But then it also kills their product,
since f∗ is multiplicative.
The spaceSp ∨Sq ∨Sp+q has the same homology and cohomology groups asSp ×Sq. Both
are built as CW complexes with cells in dimensions0,p,q , andp +q. But they are not homotopy
equivalent. We can see this now because there is a map Sp+q → Sp ∨Sq ∨Sp+q inducing an
isomorphism in Hp+q(−), namely, the inclusion of that summand.
30 Surfaces and nondegenerate symmetric bilinear forms
We are aiming towards a proof of a fundamental cohomological property of manifolds.
Deﬁnition 30.1. A (topological) manifold is a Hausdorﬀ space such that every point has an open
neighborhood that is homeomorphic to some (ﬁnite dimensional) Euclidean space.
If all these Euclidean spaces can be chosen to beRn, we have ann-manifold.
In this lecture we will state a case of the Poincaré duality theorem and study some consequences
of it, especially for compact 2-manifolds. This whole lecture will be happening with coeﬃcients in
F2.
Theorem 30.2. LetM be a compact manifold of dimensionn. There exists a unique class[M] ∈
Hn(M), called thefundamental class, such that for everyp,q with p +q =n the pairing
Hp(M) ⊗Hq(M) ∪− →Hn(M)
⟨−,[M]⟩
− − − − − →F2
is perfect.
This means that the adjoint map
Hp(M) → Hom(Hq(M), F2)
is an isomorphism. Since cohomology vanishes in negative dimensions, one thing this implies is that
Hp(M) = 0 for p>n . SinceM is compact,π0(M) is ﬁnite, and
Hn(M) = Hom(H0(M), F2) = Hom(Map(π0(M), F2), F2) = F2[π0(M)].
A vector spaceV admitting a perfect pairingV ⊗W → F2 is necessarily ﬁnite dimensional; so
Hp(M) is in fact ﬁnite-dimensional for allp.
Combining this pairing with the universal coeﬃcient theorem, we get isomorphisms
Hp(M)
∼=− →Hom(Hp(M), F2)
∼=← −Hq(M).
The homology and cohomology classes corresponding to each other under this isomorphism are said
to be “Poincaré dual.”


## Page 83

30. SURFACES AND NONDEGENERATE SYMMETRIC BILINEAR FORMS 81
Using these isomorphisms, the cup product pairing can be rewritten as a homology pairing:
Hp(M) ⊗Hq(M) ⑂ →→
∼=
↓↓
Hn−p−q(M)
∼=
↓↓
Hn−p(M) ⊗Hn−q(M)∪ →→H2n−p−q(M).
This is theintersection pairing. Here’s how to think of it. Take homology classesα ∈Hp(M) and
β ∈Hq(M)andrepresentthem(ifpossible!) astheimageofthefundamentalclassesofsubmanifolds
of M, of dimensionsp and q. Move them if necessary to make them intersect “transversely.” Then
their intersection will be a submanifold of dimensionn −p −q, and it will represent the homology
class α⑂β.
This relationship between the cup product and the intersection pairing is the source of the
symbol for the cup product.
Example 30.3. Let M =T 2 =S1 ×S1. We know that
H1(M) = F2⟨a,b ⟩
anda2 =b2 = 0, whileab =bageneratesH2(M). ThePoincarédualsoftheseclassesarerepresented
by cyclesα andβ wrapping around one or the other of the two factor circles. They can be made to
intersect in a single point. This reﬂects the fact that
⟨a ∪b, [M]⟩ = 1.
Similarly, the fact thata2 = 0 reﬂects the fact that its Poincaré dual cycleα can be moved so as
not to intersect itself. The picture below shows two possibleα’s.
This example exhibits a particularly interesting fragment of the statement of Poincaré duality:
In an even dimensional manifold – sayn = 2k – the cup product pairing gives us a nondegenerate
symmetric bilinear form onHk(M). As indicated above, this can equally well be considered a
bilinear form onHk(M), and it is then to be thought of as describing the number of points (mod
2) twok-cycles intersect in, when put in general position relative to one another. It’s called the
intersection form. We’ll denote it by
α ·β = ⟨a ∪b, [M]⟩,
where againa and α are Poincaré dual, andb and β are dual.
Example 30.4. In terms of the basisα,β, the intersection form forT 2 has matrix
[ 0 1
1 0
]
.
This is a “hyperbolic form.”


## Page 84

82 CHAPTER 3. COHOMOLOGY AND DUALITY
Let’s discuss ﬁnite dimensional nondegenerate symmetric bilinear forms overF2 in general. A
form onV restricts to a form on any subspaceW ⊆V, but the restricted form may be degenerate.
Any subspace has anorthogonal complement
W⊥ = {v ∈V :v ·w = 0 for allw ∈W }.
Lemma 30.5. The restriction of a nondegenerate bilinear form onV to a subspaceW is nonde-
generate exactly whenW ∩W⊥ = 0. In that caseW⊥ is also nondegenerate, and the splitting
V ∼=W ⊕W⊥
respects the forms.
Using this easy lemma, we may inductively decompose a general (ﬁnite dimensional) symmetric
bilinear form. First, if there is a vectorv ∈V such thatv ·v = 1, then it generates a nondegenerate
subspace and
V = ⟨v⟩ ⊕ ⟨v⟩⊥.
Continuing to split oﬀ one-dimensional subspaces brings us to the situation of a nondegenerate
symmetric bilinear form such thatv ·v = 0 for every vector. UnlessV = 0 we can pick a nonzero
vectorv. Since the form is nondegenerate, we may ﬁnd another vectorw such thatv ·w = 1. The
two together generate a 2-dimensional hyperbolic subspace. Split it oﬀ and continue. We conclude:
Proposition 30.6. Any ﬁnite dimensional nondegenerate symmetric bilinear form overF2 splits
as an orthogonal direct sum of forms with matrices[1] and
[ 0 1
1 0
]
.
Let Bil be the set of isomorphism classes of ﬁnite dimensional nondegenerate symmetric bilinear
forms overF2. We’ve just given a classiﬁcation of these things. This is a commutative monoid under
orthogonal direct sum. It can be regarded as the set of nonsingular symmetric matrices modulo the
equivalence relation of “similarity”: Two matricesM and N are similar if N = AMAT for some
nonsingular A.
Claim 30.7. 

1
1
1

 ∼


1
1
1


Proof. This is the same thing as saying that


1
1
1

 = AAT for some nonsingularA. Let
A =


1 1 1
1 0 1
0 1 1

.
It’s easy to see that there are no further relations;Bil is the commutative monoid with two
generators I and H, subject to the relationI +H = 3I.
Let’s go back to topology. Letn = 2. Then you get an intersection pairing onH1(M). Consider
RP2. We know thatH1(RP2) = F2. This must be the form we labelledI. This says that anytime
you have a nontrivial cycle on a projective plane, there’s nothing you can do to remove its self
interesections. You can see this. The projective plane is a Möbius band with a disk sown on along


## Page 85

31. LOCAL COEFFICIENTS AND ORIENTATIONS 83
the boundary. The waist of the Möbius band serves as a generating cycle. The observation is that
if this cycle is moved to intersect itself tranversely, it must intersect itself an odd number of times.
We can produce new surfaces from old by a process of “addition.” Given two connected surfaces
Σ1 and Σ2, cut a disk out of each one and sew them together along the resulting circles. This is the
connected sumΣ1#Σ2.
Proposition 30.8. There is an isomorphism
H1(Σ1#Σ2) ∼=H1(Σ1) ⊕H1(Σ2)
compatible with the intersection forms.
Proof. Let’s compute the cohomology ofΣ1#Σ2 using Mayer-Vietoris. The two dimensional coho-
mology ofΣi −D2 vanishes because the punctured surface retracts onto its 1-skeleton. The relevant
fragment is
0 →H1(Σ1#Σ2) →H1(Σ1 −D2) ⊕H1(Σ2 −D2) →H1(S1) δ− →H2(Σ1#Σ2) → 0.
The boundary map must be an isomorphism, because the connected sum is a compact connected
surface so has nontrivialH2. We leave the veriﬁcation that the direct sum is orthogonal to you.
Write Surf for the set of homeomorphism classes of compact connected surfaces. Connected
sum provides it with the structure of a commutative monoid. The classiﬁcation of surfaces may
now be summarized as folows:
Theorem 30.9.Formation of the intersection bilinear form gives an isomorphism of commutative
monoids Surf → Bil.
This is a kind of model result of algebraic topology! – a complete algebraic classiﬁcation of a
class of geometric objects. The oriented surfaces correspond to the bilinear forms of typegH; g is
the genus. But it’s a little strange. We must have a relation corresponding toH ⊕I = 3I, namely
T 2#RP2 ∼= (RP2)#3.
You should verify this for yourself!
There’s more to be said about this. Away from characteristic 2, symmetric bilinear forms and
quadratic forms are interchangeable. But overF2 you can ask for a quadratic formq such that
q(x +y) =q(x) +q(y) +x ·y.
This is a “quadratic reﬁnement” of the symmetric bilinear form. Of course it implies thatx ·x = 0
for allx, so this will correspond to some further structure on an oriented surface. This structure is a
“framing,” a trivialization of the normal bundle of an embedding into a high dimensional Euclidean
space. There are then further invariants of this framing; this is the story of the Kervaire invariant.
31 Local coeﬃcients and orientations
The fact that a manifold is locally Euclidean puts surprising constraints on its cohomology, captured
in the statement of Poincaré duality. To understand how this comes about, we have to ﬁnd ways to
promote local information– like the existence of Euclidean neighborhoods – toglobal information–


## Page 86

84 CHAPTER 3. COHOMOLOGY AND DUALITY
like restrictions on the structure of the cohomology. Today we’ll study the notion of an orientation,
which is the ﬁrst link between local and global.
The local-to-global device relevant to this is the notion of a “local coeﬃcient system,” which is
based on the more primitive notion of a covering space. We merely summarize that theory, since it
is a prerequisite of this course.
Deﬁnition 31.1. A continuous mapp :E →B is acovering spaceif
(1) every point pre-image is a discrete subspace ofE, and
(2) everyb ∈ B has a neighborhoodV admitting a mapp−1(V ) → p−1(b) such that the induced
map
p−1(V )
∼= →→
p
↘↘
V ×p−1(b)
pr1
↙↙B
is a homeomorphism.
The spaceB is the “base,”E the “total space.”
Example 31.2. A ﬁrst example is given by the projection mappr1 : B ×F → B where F is
discrete. A covering space of this form is said to betrivial, so the covering space condition can be
rephrased as “local triviality.”
The ﬁrst interesting example is the projection mapSn → RPn obtained by identifying antipodal
maps on the sphere. This example generalizes in the following way.
Deﬁnition 31.3.An action of a groupπ on a spaceX is principalor totally discontinuous(terrible
language, since we are certainly assuming that every group element acts by homeomorphisms)
provided every elementx ∈X has a neighborhoodU such that the only timeU andgU intersect is
when g = 1.
This is a strong form of “freeness” of the action. It is precisely what is needed to guarantee:
Lemma 31.4. If π acts principally onX then the orbit projection mapX → π\X is a covering
space.
It is not hard to use local triviality to prove the following:
Theorem 31.5 (Unique path lifting). Let p : E → B be a covering space, andω : I → B a path
in the base. For anye ∈E such thatp(e) =ω(0), there is a unique path˜ω :I →E in E such that
p˜ω =ω and ˜ω(0) =e.
This leads to a right action ofπ1(B,b ) onF =p−1(b): Represent an element ofπ1(B) by a loop
ω; for an elemente ∈p−1(b) let ˜ω be the lift ofω with ˜ω(0) =e; and deﬁne
e · [ω] = ˜ω(1) ∈E.
This element lies inF because ω was a loop, ending at b. One must check that this action by
[ω] ∈ π1(B,b ) does not depend upon the choice of representativeω, and that we do indeed get a
right action:
e · (ab) = (e ·a) ·b, e · 1 =e.
Given a principalπ-action onX, with orbit spaceB, we can do more than just form the orbit
space! If we also have a right action ofπ on a setF, we can form a new covering space overB with


## Page 87

31. LOCAL COEFFICIENTS AND ORIENTATIONS 85
F as “generic” ﬁber. WriteF ×πX for the quotient of the product spaceF ×X by the equivalence
relation
(s,gx ) ∼ (sg,x ), g ∈π.
The composite projectionF ×X → X → B factors through a mapF ×πX → B, which is easily
seen to be a covering space. Any elementx ∈X determines a homeomorphism
F →p−1p(x) by s ↦→ [s,x ].
Of course ∗ ×πX =B, and if we letπ act on itself by right translation,π ×πX =X.
Covering spaces of a ﬁxed spaceB form a category CovB, in which a morphismE′ → E is
“covering transformation,” that is, a mapf :E′ →E making
E′ f →→
↘↘
E
↙↙
B
commute. Sendingp :E →B to p−1(b) with its action byπ1(B,b ) gives a functor
CovB → Set−π1(B,b )
to the category of right actions ofπ1(B,b ) on sets. For connected spaces, this is usually an equiv-
alence of categories. The technical assumption required is this: A spaceB is semilocally simply
connectedif is path connected and for every pointb and every neighborhoodU of b, there exists a
smaller neighborhoodV such thatπ1(V,b ) →π1(X,b ) is trivial. This is a very weak condition.
Theorem 31.6. Assume that B is semi-locally simply connected. Then the functor CovB →
Set−π1(B,b ) is an equivalence of categories.
This is another one of those perfect theorems in algebraic topology!
The covering space corresponding under this equivalence to the translation action ofπ1(B,b ) on
itselfisthe universal coverofB, denotedby ˜B →B. Itissimplyconnected. Sincetheautomorphism
group ofπ as a rightπ-set isπ (acting by left translation), the automorphism group of˜B →B as
a covering space ofB is π1(B,b ). This action is principal, and the covering space corresponding to
a π1(B,b )-set S is given by the balanced productS ×π1(B,b) ˜B.
Covering spaces come up naturally in our study of topological manifolds. For any spaceX,
we can probe the structure ofX in the neighborhood ofx ∈X by studying the gradedR-module
H∗(X,X −x;R), the local homology ofX at x. By excision, this group depends only on the
structure ofX “locally atx”: For any neighborhoodU ofx, excising the complement ofU gives an
isomorphism
H∗(U,U −x)
∼=− →H∗(X,X −x).
When the space is ann-manifold – let’s writeM for it – the local homology is very simple. It’s
nonzero only in dimensionn. This has a nice immediate consequence, by the way: there is a well-
deﬁned locally constant functiondim :M → N, sendingx to the dimension in whichH∗(M,M −x)
is nontrivial. For ann-manifold, it’s the constant function with valuen.
In fact the whole family of homology groupsHn(M,M −x) is “locally constant.” This is captured
in the statement that taken together, asx varies overM, they constitute a covering space overM.
So begin by deﬁning
oM =
∐
x∈M
Hn(M,M −x)


## Page 88

86 CHAPTER 3. COHOMOLOGY AND DUALITY
as sets. There is an evident projection mapp : oM → M. We aim to put a topology onoM with
the property that this map is a covering space. This will use an important mapjA,x, deﬁned for
any closed setA ⊆M and x ∈A as the map induced by an inclusion of pairs:
jA,x :Hn(M,M −A) →Hn(M,M −x)
Deﬁne a basis of opensVU,x,α in oM indexed by triples(U,x,α ) where U is open inM, x ∈U, and
α ∈Hn(M,M −U):
VU,x,α = {jU,x(α) :x ∈U }.
Eachα ∈Hn(M,M −U) thus deﬁnes a “sheet” ofoM overU. We leave it to you to check that this
is indeed a covering space.
This covering space has more structure: each ﬁber is an abelian group, an inﬁnite cyclic abelian
group. These structures vary continuously as you move from one ﬁber to another. To illuminate this
structure, observe that the categoryCovB has ﬁnite products; they are given by the ﬁber product
or pullback,E′ ×BE →B. The empty product is the terminal object,B →B. This lets us deﬁne
an “abelian group object” inCovB; it’s an objectE → B together with mapsE ×B E → E and
B →E overB, satisfying some evident conditions that are equivalent to requiring that they render
each ﬁber an abelian group. If you have a ring around you can also ask for a map(B ×R)×BE →E
making each ﬁber anR-module.
The structure we have deﬁned is alocal coeﬃcient system(of R-modules). We already have an
example; ifM is ann-manifold, we have theorientation local systemoM overM.
It’s useful to allow coeﬃcients in a commutative ringR; so denote by
oM ⊗R
the local system ofR-modules obtained by tensoring each ﬁber withR.
The classiﬁcation theorem for covering spaces has as a corollary:
Theorem 31.7. Let B be path connected and semi-locally simply connected. Then forming the
ﬁber over a point gives an equivalence of categories from the category of local coeﬃcient systems of
R-modules overB and the category of modules over the group algebraR[π1(B,b )].
The ﬁbers of our local coeﬃcient systemoM are quite simple: they are free of rank 1. Since any
automorphism of such anR-module is given by multiplication by a unit inR, we ﬁnd that the local
coeﬃcient system is deﬁned by giving a homomorphism
π1(M,b ) →R×
or, what is the same, an element ofH1(M;R×).
When R = Z, this homomorphism
w1 :π1(M,b ) → {±1}
isthe“ﬁrstStiefel-Whitneyclass.” Ifitistrivial, youcanpickconsistentgeneratorsfor Hn(M,M −x)
asxruns overM: the manifold is “orientable,” and isorientedby one of the two possible choices. If it
is nontrivial, the manifold isnonorientable. I hope it’s clear that the Möbius band is nonorientable,
and hence any surface containing the Möbius band is as well.
The set of abelian group generators of the ﬁbers ofoM form a sub covering space, a double cover
of M, denoted byo×
M. It is the “orientation double cover.” IfM is orientable (and connected) it
is trivial; it consists of two copies ofM. An orientation consists in chosing one or the other of the


## Page 89

31. LOCAL COEFFICIENTS AND ORIENTATIONS 87
components. IfM is nonorientable (and connected) the orientation double cover is again connected.
An interesting and simple fact is that its total space is a manifold in its own right, and is orientable;
in fact it carries a canonical orientation.
Similarly we can form the sub covering space ofR-module generators of the ﬁbers ofoM ⊗R;
write (oM ⊗R)× for it.
Now ifp :E →B is a covering space, one of the things you may want to do is consider asection
of p; that is, a continuous functionσ :B →E such thatp ◦σ = 1B. Write Γ(B;E) for the set of
sections ofp :E →B. Under the corresondence between covering spaces and actions ofπ,
Γ(B;E) = (p−1(b))π1(B,b),
the ﬁxed point set for the action ofπ1(B,b ) on p−1(b). IfE is a local system ofR-modules, this is
a subR-module.
A “localR-orientation atx” is a choice ofR-module generator ofHn(M,M −x;R), and we make
the following deﬁnition.
Deﬁnition 31.8. An R-orientation of ann-manifold M is a section of(oM ⊗R)×.
For example, whenR = F2, every manifold is orientable, and uniquely so, sinceF×
2 = {1}. A
Z-orientation (or simply “orientation”) is a section of the orientation double cover. A manifold is
“R-orientable” if it admits anR-orientation. A connected n-manifold is either non-orientable, or
admits two orientations. Euclidean space is orientable.
This relates to the “globalization” project we started out talking about. A section overB is in
fact called a “global section.” In the case of the orientation local system, we have a canonical map
j :Hn(M;R) → Γ(M;oM ⊗R),
described as follows. The value ofj(a) atx ∈M is the restriction ofa toHn(M,M −x). The ﬁrst
“local-to-global” theorem, a special case of Poincaré duality, is this:
Theorem 31.9(Orientation Theorem). If M is compact, the mapj :Hn(M;R) → Γ(M;oM ⊗R)
is an isomorphism.
We will prove this theorem in the next lecture.
The representation ofπ1(B) on the ﬁber ofoM ⊗R overb is given by the compositeπ1(B) →
{±1} → R×. If this is the trivial homomorphism, the ﬁxed points of this representation onR form
all ofR. If not, the ﬁxed points are the subgroup ofR of elements of order 2, writtenR[2].
Corollary 31.10. If M is a compact connectedn-manifold, then
Hn(M;R) ∼=
{
R if M is orientable
R[2] if not.
In the ﬁrst case, a generator ofHn(M;R) is afundamental classfor the manifold. You should
think of the manifold itself as a cycle representing this homology class. It is characterized as a class
restricting to a generator ofHn(M,M −x) for allx; this is saying that the cycle “covers” the point
x once.
The ﬁrst isomorphism in the theorem depends upon this choice of fundamental class. But in the
second case, the isomorphism is canonical. OverF2, any compact connected manifold has a unique
fundamental class, the generator ofHn(M; F2) = F2.


## Page 90

88 CHAPTER 3. COHOMOLOGY AND DUALITY
32 Proof of the orientation theorem
We are studying the way in which local homological information gives rise to global information,
especially on ann-manifold M. The tool was the map
j :Hn(M;R) → Γ(M;oM ⊗R)
sending a classc to the section of the orientation local coeﬃcient system given atx ∈ M by the
restrictionjx(c) ∈Hn(M,M −x). We asserted that ifM is compact thenj is an isomorphism and
that Hq(M) = 0 for q >n. The proof will be by induction.
To make the induction go, we will need a reﬁnement of this construction. LetA ⊆ M be a
compact subset. A class inHn(M,M −A) is represented by a cycle whose boundary lies outside
of A. It may coverA evenly. We can give meaning to this question as follows. Letx ∈ A. Then
M −A ⊆M −x, so we have a map
jA,x :Hn(M,M −A) →Hn(M,M −x)
that tests whether the chain coversx. As x ranges overA, these maps together give us a map to
the group of sections ofoM overA,
jA :Hn(M,M −A) → Γ(A;oM).
Because Hn(M,M −A) deals with homology classes that “stretch overA,” we will write
Hn(M,M −A) =Hn(M |A).
Theorem32.1. LetM be ann-manifold and letA be a compact subset ofM. ThenHq(M |A;R) = 0
for q >n, and the mapjA :Hn(M |A;R) → Γ(A;oM ⊗R) is an isomorphism.
TakingA =M (assuming M compact) we ﬁnd thatHq(M;R) = 0 for q >n and
jM :Hn(M;R)
∼=− →Γ(M;oM ⊗R).
But the theorem covers much more exotic situations as well; perhapsA is a Cantor set in some
Euclidean space, for example.
We follow [2] in proving this, and refer you to that reference for the modiﬁcations appropriate
for the more general statement whenA is assumed merely closed rather than compact.
First we establish two general results.
Proposition 32.2. LetA and B be closed subspaces ofM, and suppose the result holds forA, B,
and A ∩B. Then it holds forA ∪B.
Proof. The relative Mayer-Vietoris theorem and the hypothesis thatHn+1(M |A ∩B) = 0 gives us
exactness of the top row in the ladder
0 →→Hn(M |A ∪B)
jA∩B
↓↓
→→Hn(M |A) ⊕Hn(M |B)
jA⊕jB
↓↓
→→Hn(M |A ∩B)
jA∩B
↓↓
0 →→ Γ(A ∪B;oM) →→ Γ(A;oM) ⊕ Γ(B;oM) →→ Γ(A ∩B;oM).
Exactness of the bottom row is clear: A section overA ∪B is precisely a section overA and a
section overB that agree on the intersection. So the ﬁve-lemma shows thatjA∪B is an isomorphism.
Looking further back in the Mayer-Vietoris sequence gives the vanishing ofHq(M |A) forq >n.


## Page 91

32. PROOF OF THE ORIENTATION THEOREM 89
Proposition 32.3. Let A1 ⊇ A2 ⊇ · · · be a decreasing sequence of compact subsets ofM, and
assume that the theorem holds for eachAn. Then it holds for the intersectionA = ⋂Ai.
The proof of this proposition entails two lemmas, which we’ll dispose of ﬁrst.
Lemma 32.4. LetA1 ⊇A2 ⊇ · · · be a decreasing sequence of compact subsets of a spaceX, with
intersectionA. Then
lim− →i
Hq(X,X −Ai)
∼=− →Hq(X,X −A).
Proof. Let σ : ∆q → X be anyq-simplex inX −A. The subsets X −Ai form an open cover of
im(σ), so by compactness it lies in some singleX −Ai. This shows that
lim− →i
Sq(X −Ai)
∼=− →Sq(X −A).
Thus
lim− →i
Sq(X|Ai)
∼=− →Sq(X|Ai)
by exactness of direct limit, and the claim then follows for the same reason.
Lemma 32.5.LetA1 ⊇A2 ⊇ · · · be a decreasing sequence of compact subsets in a Hausdorﬀ space
X with intersectionA. For any open neighborhoodU of A there existsi such thatAi ⊆U.
Proof. A is compact, being a closed subset of the compact Hausdorﬀ spaceA1. Since A is the
intersection of theAi, and A ⊆ U, the intersection of the decreasing sequence of compact sets
Ai −U is empty. Thus by the ﬁnite intersection property one of them must be empty; but that says
that Ai ⊆U.
Proof of Proposition 32.3.By Lemma 32.4,Hq(M |A) = 0 for q > n. In dimensionn, we contem-
plate the commutative diagram
lim− →i
Hn(M |Ai)
∼= →→
∼=
↓↓
Hn(M |A)
↓↓
lim− →i
Γ(Ai;oM)
∼= →→ Γ(A;oM).
The top map an isomorphism by Lemma 32.4.
To see that the bottom map is an isomorphism, we’ll verify the two conditions for a map to be a
direct limit from Lecture 23. First letx be a section ofoM overA. By compactness, we may cover
A by a ﬁnite set of opens over each of whichoM is trivial. The section extends over their unionU,
by unique path lifting. By Lemma 32.5 this open set contains someAi, and we conclude that any
section overA extends to someAi.
On the other hand, suppose that a sectionx ∈ Γ(Ai;oM) vanishes onA. Then it vanishes on
some open set containingA, again by unique path lifting and local triviality. SomeAj lies in that
open set, again by Lemma 32.5. We may assume thatj ≥i, and conclude thatx already vanishes
on Aj.


## Page 92

90 CHAPTER 3. COHOMOLOGY AND DUALITY
Proof of Theorem 32.1.There are ﬁve steps. In describing them, we will call a subset ofM “Eu-
clidean” if it lies inside some open set homeomorphic toRn.
(1) M = Rn, A a compact convex subset.
(2) M = Rn, A a ﬁnite union of compact convex subsets.
(3) M = Rn, A any compact subset.
(4) M arbitrary,A a ﬁnite union of compact Euclidean subsets.
(5) M arbitrary,A an arbitrary compact subset.
Notes on the proofs: (1) To be clear, “convex” implies nonempty. By translatingA, we may
assume that 0 ∈A. The compact subsetA lies in some disk, and by a homothety we may assume
that the disk is the unit diskDn. Then we claim that the inclusion i : Sn−1 → Rn −A is a
deformation retract. A retraction is given byr(x) =x/||x||, and a homotopy fromir to the identity
is given by
h(x,t ) =
(
t + 1 −t
||x||
)
x.
It follows thatHq(Rn, Rn −A) ∼= Hq(Rn, Rn −Dn) for allq. This group is zero forq > n.
In dimension n, note that restricting to the origin gives an isomorphismHn(Rn, Rn −Dn) →
Hn(Rn, Rn − 0) since Rn −D is a deformation retract ofRn − 0. The local systemoRn is trivial,
since Rn is simply connected, so restricting to the origin gives an isomorphism Γ(Dn,o Rn) →
Hn(Rn, Rn − 0). This implies thatjDn :Hn(Rn, Rn −Dn) → Γ(Dn,o Rn) is an isomorphism. The
restriction Γ(Dn,o Rn) → Γ(A,o Rn) is also an isomorphism, sinceA →Dn is a deformation retract.
So by the commutative diagram
Hn(Rn, Rn −Dn)
∼= →→
jDn
↓↓
Hn(Rn, Rn −A)
jA
↓↓
Γ(Dn,o Rn) →→ Γ(A,o Rn)
we ﬁnd thatjA :Hn(Rn, Rn −A) → Γ(A;oRn) is an isomorphism.
(2) by Proposition 32.2.
(3) For eachj ≥ 1, letCj be a ﬁnite subset ofA such that
A ⊆
⋃
x∈Cj
B1/j(x).
Since any intersection of convex sets is either empty or convex,
Ak =
k⋂
j=1
⋃
x∈Cj
B1/j(x)
is a union of ﬁnitely many convex sets, and sinceA is closed it is the intersection of this decreasing
family. So the result follows from (1), (2), and Proposition 32.3.
(4) by (3) and (2).
(5) CoverA by ﬁnitely many open subsets that embed in Euclidean opens as open disks with
compact closures. Their closures then form a ﬁnite cover by closed Euclidean disksDi in Euclidean
opens Ui. For eachi, excise the closed subsetM −Ui to see that
Hq(M,M −A ∩Di) ∼=Hq(Ui,Ui −A ∩Di) ∼=Hq(Rn, Rn −A ∩Di).
By (4), the theorem holds for each of these. Each intersection(A ∩Di) ∩(A ∩Dj) is again a compact
Euclidean subset, so the result holds for them by excision as well. The result then follows by (1).


## Page 93

33. A PLETHORA OF PRODUCTS 91
33 A plethora of products
We are now heading towards a statement of Poincaré duality.
Recall that we have the Kronecker pairing
⟨−, −⟩ :Hp(X;R) ⊗Hp(X;R) →R.
It’s obviously not “natural,” becauseHp is contravariant while homology is covariant. But given
f :X →Y, b ∈Hp(Y ), andx ∈Hp(X), we can ask: How does⟨f∗b,x ⟩ relate to ⟨b,f∗x⟩?
Claim 33.1. ⟨f∗b,x ⟩ = ⟨b,f∗x⟩.
Proof. This is easy! I ﬁnd it useful to write out diagrams to show where things are. We’re going to
work on the chain level.
Hom(Sp(Y ),R ) ⊗Sp(X)
1⊗f∗ →→
f∗⊗1
↓↓
Hom(Sp(Y ),R ) ⊗Sp(Y )
⟨−,−⟩
↓↓
Hom(Sp(X),R ) ⊗Sp(X)
⟨−,−⟩ →→R
We want this diagram to commute. Suppose[β] =b and [ξ] =x. Then going to the right and then
down gives
β ⊗ξ ↦→β ⊗f∗(ξ) ↦→β(f∗ξ).
The other way gives
β ⊗ξ ↦→f∗(β) ⊗ξ = (β ◦f∗) ⊗ξ ↦→ (β ◦f∗)(ξ).
This is exactlyβ(f∗ξ).
There’s actually another product in play here:
µ :H(C∗) ⊗H(D∗) →H(C∗ ⊗D∗)
given by[c]⊗[d] ↦→ [c⊗d]. I used it to pass from the chain level computation we did to the homology
statement.
We also have the two cross products:
× :Hp(X) ⊗Hq(Y ) →Hp+q(X ×Y )
and
× :Hp(X) ⊗Hq(Y ) →Hp+q(X ×Y ).
You might think this is ﬁshy because both maps are in the same direction. But it’s OK, because we
used diﬀerent things to make these constructions: the chain-level cross product (or Eilenberg-Zilber
map) for homology and the Alexander-Whitney map for cohomology. Still, they’re related:
Lemma 33.2. Leta ∈Hp(X),b ∈Hq(Y ),x ∈Hp(X),y ∈Hq(Y ). Then:
⟨a ×b,x ×y⟩ = (−1)|x|·|b|⟨a,x ⟩⟨b,y ⟩.


## Page 94

92 CHAPTER 3. COHOMOLOGY AND DUALITY
Proof. Look at the chain-level cross product and the Alexander-Whitney maps:
× :S∗(X) ⊗S∗(Y )⇆S∗(X ×Y ) :α
They are inverse isomorphisms in dimension 0, and both sides are projective resolutions with respect
to the models(∆p, ∆q); so by acyclic models they are natural chain homotopy inverses.
Say [f] =a, [g] =b, [ξ] =x, [η] =y. Writefg for the composite
Sp(X) ⊗Sq(Y ) ×− →Sp+q(X ×Y )
f⊗g
− − →R ⊗R →R.
Then:
(f ×g)(ξ ×η) = (fg )α(ξ ×η) ≃ (fg )(ξ ⊗η) = (−1)pqf(ξ)g(η).
We can use this to prove a restricted form of the Künneth theorem in cohomology.
Theorem 33.3. LetR be a PID. Assume thatHp(X) is a ﬁnitely generated freeR-module for all
p. Then
× :H∗(X;R) ⊗RH∗(Y ;R) →H∗(X ×Y ;R)
is an isomorphism.
Proof. WriteM∨ for the linear dual of anR-moduleM. By our assumption aboutHp(X), the map
Hp(X)∨ ⊗Hq(Y )∨ → (Hp(X) ⊗Hq(Y ))∨ ,
sending f ⊗g to (x ⊗y ↦→ (−1)pqf(x)g(y)), is an isomorphism. The homology Künneth theorem
guarantees that the bottom map in the following diagram is an isomorphism.
⨁
p+q=nHp(X) ⊗Hq(Y )
× →→
∼=
↓↓
Hn(X ×Y )
∼=
↓↓⨁
p+q=nHp(X)∨ ⊗Hq(Y )∨ ∼= →→
(⨁
p+q=nHp(X) ⊗Hq(Y )
)∨
Hn(X ×Y )∨∼=←←
Commutativity of this diagram is exactly the content of Lemma 33.2.
We saw before that × is an algebra map, so under the conditions of the theorem it is an
isomorphism of algebras. You do need some ﬁniteness assumption, even if you are working over a
ﬁeld. For example letT be an inﬁnite set, regarded as a space with the discrete topology. Then
H0(T ;R) = Map(T,R ). But
Map(T,R ) ⊗ Map(T,R ) → Map(T ×T,R )
sendingf ⊗g to (s,t ) →f(s)g(t) is not surjective; the characteristic function of the diagonal is not
in the image, for example (unlessR = 0).
There are more products around. For example, there is a map
Hp(Y ) ⊗Hq(X,A ) →Hp+q(Y ×X,Y ×A).
Constructing this is on your homework. SupposeY =X. Then I get
∪ :H∗(X) ⊗H∗(X,A ) →H∗(X ×X,X ×A) ∆∗
− − →H∗(X,A )


## Page 95

34. CAP PRODUCT AND “CECH” COHOMOLOGY 93
where ∆ : (X,A ) → (X ×X,X ×A) is the “relative diagonal.” Thisrelative cup productmakes
H∗(X,A ) into a module over the graded algebraH∗(X). The relative cohomology isnot a ring –
it doesn’t have a unit, for example – but it is a module. And the long exact sequence of the pair is
a sequence ofH∗(X)-modules.
I want to introduce you to one more product, one that will enter into our expression of Poincaré
duality. This is the cap product. What can I do with Sp(X) ⊗Sn(X)? Well, I can form the
composite:
∩ :Sp(X) ⊗Sn(X)
1×(α◦∆∗)
− − − − − − →Sp(X) ⊗Sp(X) ⊗Sn−p(X)
⟨−,−⟩⊗1
− − − − − →Sn−p(X)
Using our explicit formula forα, we can write:
∩ :β ⊗σ ↦→β ⊗ (σ ◦αp) ⊗ (σ ◦ωq) ↦→ (β(σ ◦αp)) (σ ◦ωq)
We are evaluating the cochain onpart ofthe chain, leaving a lower dimensional chain left over.
This composite is a chain map, and so induces a map in homology:
∩ :Hp(X) ⊗Hn(X) →Hn−p(X).
Notice how the dimensions work. Long ago a bad choice was made: If cohomology were graded
with negative integers, the way the gradations work here would look better.
There are also two slant products. Maybe I won’t talk about them. In the next lecture, I’ll
check a few things about cap products, and then get into the machinery of Poincaré duality.
34 Cap product and “Cech” cohomology
We have a few more things to say about the cap product, and will then use it to give a statement
of Poincaré duality.
Proposition 34.1. The cap product enjoys the following properties.
(1) (a ∪b) ∩x =a ∩ (b ∩x) and 1 ∩x =x: H∗(X) is a module forH∗(X).
(2) Given a mapf :X →Y, b ∈Hp(Y ), andx ∈Hn(X),
f∗(f∗(b) ∩x) =b ∩f∗(x).
(3) Letϵ :H∗(X) →R be the augmentation. Then
ε(b ∩x) = ⟨b,x ⟩.
(4) Cap and cup are adjoint:
⟨a ∩b,x ⟩ = ⟨a,b ∩x⟩.
Proof. (1) Easy.
(2) Letβ be a cocycle representingb, andσ an n-simplex inX. Then
f∗(f∗(β) ∩σ) =f∗((f∗(β)(σ ◦αp)) · (σ ◦ωq))
=f∗(β(f ◦σ ◦αp) · (σ ◦ω))
=β(f ◦σ ◦αp) ·f∗(σ ◦ωq)
=β(f ◦σ ◦αp) · (f ◦σ ◦ωq)
=β ∩f∗(σ)


## Page 96

94 CHAPTER 3. COHOMOLOGY AND DUALITY
This formula goes by many names: the “projection formula,” or “Frobenius reciprocity.”
(3) We get zero unlessp =n. Again letσ ∈ Sinn(X), and compute:
ε(β ∩σ) =ε(β(σ) ·c0
σ(n)) =β(σ)ε(c0
σ(n)) =β(σ) = ⟨β,σ ⟩.
Here now is a statement of Poincaré duality. It deals with the homological structure of compact
topological manifolds. We recall the notion of an orientation, and Theorem 31.9 asserting the
existence of a fundamental class[M] ∈Hn(M;R) in a compactR-orientedn-manifold.
Theorem 34.2(Poincaré duality). LetM be a topologicaln-manifold that is compact and oriented
with respect to a PID R. Then there is a unique class [M] ∈ Hn(M;R) that restricts to the
orientation class inHn(M,M −a;R) for everya ∈M. It has the property that
− ∩ [M] :Hp(M;R) →Hq(M;R), p +q =n,
is an isomorphism for allp.
You might want to go back to Lecture 25 and verify thatRP3 × RP3 satisﬁes this theorem.
Our proof of Poincaré duality will be by induction. In order to make the induction go we will
prove a substantially more general theorem, one that involves relative homology and cohomology.
So we begin by understanding how the cap product behaves in relative homology.
Suppose A ⊆X is a subspace. We have:
0
↓↓
0
↓↓
Sp(X) ⊗Sn(A)
1⊗i∗
↓↓
i∗⊗1 →→Sp(A) ⊗Sn(A) ∩ →→Sq(A)
i∗
↓↓
Sp(X) ⊗Sn(X) ∩ →→
↓↓
Sq(X)
↓↓
Sp(X) ⊗Sn(X,A )
↓↓
→→Sq(X,A )
↓↓
0 0
The left sequence is exact because0 →Sn(A) →Sn(X) →Sn(X,A ) → 0 splits and tensoring with
Sp(X) (which is not free!) therefore leaves it exact. The solid arrow diagram commutes precisely
by the chain-level projection formula. There is therefore a uniquely deﬁned map on cokernels.
This chain map yields therelative cap product
∩ :Hp(X) ⊗Hn(X,A ) →Hq(X,A )
It rendersH∗(X,A ) a module for the graded algebraH∗(X).
I want to come back to an old question, about the signiﬁcance of relative homology. Suppose
thatK ⊆X is a subspace, and consider the relative homologyH∗(X,X −K). Since the complement
of X −K in X is K, these groups should be regarded as giving information aboutK. If I enlarge


## Page 97

34. CAP PRODUCT AND “CECH” COHOMOLOGY 95
K, I makeX −K smaller: K ⊆L induces H∗(X,X −L) →H∗(X −K); the relative homology is
contravariantin the variableK (regarded as an object of the poset of subspaces ofX).
Excision gives insight into howH∗(X,X −K) depends on K. Suppose K ⊆ U ⊆ X with
K ⊆ Int(U). To simplify things, let’s just suppose thatK is closed andU is open. ThenX −U is
closed, X −K is open, andX −U ⊆X −K, so excision asserts that the inclusion map
H∗(U,U −K) →H∗(X,X −K)
is an isomorphism.
The cap product puts some structure onH∗(X,X −K): it’s a module overH∗(X). But we
can do better! We just decided thatH∗(X,X −K) = H∗(U,U −K), so theH∗(X) action factors
through an action byH∗(U), for any open setU containingK. How does this reﬁned action change
when I decreaseU?
Lemma 34.3. LetK ⊆V ⊆U ⊆X, withK closed andU,V open. Then:
Hp(U) ⊗Hn(X,X −K)
i∗⊗1
↓↓
∩
→→
Hq(X,X −K)
Hp(V ) ⊗Hn(X,X −K)
∩
→→
commutes.
Proof. This is just the projection formula again!
Let UK be the set of open neighborhoods ofK inX. It is partially ordered by reverse inclusion.
This poset is directed, since the intersection of two opens is open. By the lemma,Hp : UK → Ab
is a directed system.
Deﬁnition 34.4. The Čech cohomologyof K is
ˇHp(K) = lim− →U∈UK
Hp(U).
I apologize for this bad notation; its possible dependence on the wayK is sitting inX is not
recorded. The maps in this directed systen are all maps of graded algebras, so the direct limit is
naturally a commutative graded algebra. Since tensor product commutes with direct limits, we now
get a cap product pairing
∩ : ˇHp(K) ⊗Hn(X,X −K) →Hq(X,X −K)
satifying the expected properties. This is the best you can do. It’s the natural structure that this
relative homology has:H∗(X,X −K) is a module overˇH∗(K).
There are compatible restriction mapsHp(U) →Hp(K), so there is a natural map
ˇH∗(K) →H∗(K).
This map is often an isomorphism. SupposeK ⊆X satisﬁes the following “regular neighborhood”
condition: For every openU ⊇K, there exists an openV with U ⊇V ⊇K such thatK ↪→V is a
homotopy equivalence (or actually just a homology isomorphism).


## Page 98

96 CHAPTER 3. COHOMOLOGY AND DUALITY
Lemma 34.5. Under these conditions, ˇH∗(K) →H∗(K) is an isomorphism.
Proof. We will check that the map toHp(K) satisﬁes the conditions we established in Lecture 23
to be a direct limit.
So let x ∈ Hp(K). Let U be a neighborood of K in X such that Hp(U) → Hp(K) is an
isomorphism. Then indeedx is in the image ofHp(U).
Then letU be a neighborhood ofK and letx ∈ Hp(U) restrict to 0 inHp(K). Let V be a
sub-neighborood such thatHp(V ) →Hp(K) is an isomorphism. Thenx restricts to 0 inHp(V ).
On the other hand, here’s an example that distinguishesˇH∗ fromH∗. This is a famous example.
The “topologist’s sine curve” is the subspace ofR2 deﬁned as follows. It is union of three subsets,
A, B, and C. A is the graph of sin(π/x) where 0 < x <1. B is the interval 0 × [−1, 1]. C
is a continuous curve from(0, −1) to (1, 0) and meeting A ∪B only at its endpoints. This is a
counterexample for a lot of things; you’ve probably seen it in 18.901.
What is the singular homology of the topologist’s sine curve? Use Mayer-Vietoris! I can choose
V to be some connected portion of the continuous curve from(0, −1) to (1, 0), andU to contain
the rest of the space in a way that intersectsV in two open intervals. ThenV is contractible, and
U is made up of two contractible connected components. (This space is not locally path connected,
and one of these path components is not closed.)
The Mayer-Vietoris sequence looks like
0 →H1(X) ∂− →H0(U ∩V ) →H0(U) ⊕H0(V ) →H0(X) → 0.
The two path components ofU ∩V do not become connected inU, so ∂ = 0 and we ﬁnd that
ε :H∗(X)
∼=− →H∗(∗) and henceH∗(X) ∼=H∗(∗).
How about ˇH∗? Let X ⊂ U be an open neighborhood. The interval 0 × [−1, 1] has an ϵ-
neighborhood, for some smallϵ, that’s contained inU. This implies that there exists a neighborhood
X ⊆V ⊆U such thatV ≃S1. This implies that
lim− →U∈UX
H∗(U) ∼=H∗(S1)
by a coﬁnality argument that we will detail later. SoˇH∗(X) ̸=H∗(X).
Nevertheless, under quite general conditions the Čech cohomology of a compact Hausdorﬀ space
is a topological invariant. The Čech construction forms a limit over open covers of the cohomology
of the nerve of the cover. It is a topological invariant by construction.
Theorem 34.6. Let X be a compact subset of some Euclidean space. If there is an open neigh-
borhood of which it is a retract, thenˇH∗(X;R) is canonically isomorphic to the cohomology deﬁned
using the Čech construction, and is therefore independent of the embedding into Euclidean space.
See Dold’s beautiful book [3] for this and other topics discussed in this chapter.


## Page 99

35. CECH COHOMOLOGY AS A COHOMOLOGY THEORY 97
35 Cech cohomology as a cohomology theory
Let X be any space, and letK ⊆X be a closed subspace. We’ve deﬁned the Čech cohomology of
K as the direct limit ofH∗(U) as U ranges over the posetUK of open neighborhoods ofK. This
often coincides withH∗(K) but will not be the same in general. Nevertheless it behaves like a
cohomology theory. To expand on this claim, we should begin by deﬁning a relative version.
Suppose L ⊆ K is a pair of closed subsets of a spaceX. Let (U,V ) be a “neighborhood pair”
for (K,L ):
L ⊆ K
⊆
⊆
V ⊆ U
with U and V open. These again form a directed set UK,L, with partial order given by reverse
inclusion of pairs. Then deﬁne
ˇHp(K,L ) = lim− →
(U,V )∈UK,L
Hp(U,V ).
We will want to verify versions of the Eilenberg-Steenrod axioms for these functors. For a start,
I have to explain how maps induce maps.
Let I be a directed set andA : I → Ab a functor. If we have an order-preserving map – a
functor –ϕ : J → I from another directed set, we getAϕ : J → Ab; so(Aϕ)j =Aϕ(j). I can form
two direct limits:lim− →J Aϕ and lim− →IA. I claim that they are related by a map
lim− →J
Aϕ → lim− →I
A.
Using the universal property of direct limits, we need to come up with compatible mapsfj :Aϕ(j) →
lim− →IA. We have compatible mapsini :Ai → lim− →IA for i ∈ I, so we can takefj = inϕ(j).
These maps are compatible under composition of order-preserving maps.
Example 35.1. A closed inclusioni :K ⊇L induces an order-preserving mapϕ : UK → UL. The
functor Hp : UK → Ab restricts toHp : UL → Ab, so we get maps
lim− →UK
Hp = lim− →UK
Hpϕ → lim− →UL
Hp.
i.e.
i∗ : ˇHp(K) → ˇHp(L).
This makes ˇHp into a contravariant functor on the partially ordered set of closed subsets ofX.
I can do the same thing for relative cohomology, and get the maps involved in the following two
theorems, whose proofs will come in due course.
Theorem 35.2 (Long exact sequence). Let (K,L ) be a closed pair inX. There is a long exact
sequence
· · · → ˇHp(K,L ) → ˇHp(K) → ˇHp(L) δ− →ˇHp+1(K,L ) → · · ·
that is natural in the pair.


## Page 100

98 CHAPTER 3. COHOMOLOGY AND DUALITY
Theorem 35.3 (Excision). Suppose A and B are closed subsets of a normal space, or compact
subsets of a Hausdorﬀ space. Then the map
ˇHp(A ∪B,A )
∼=− →ˇHp(B,A ∩B)
induced by the inclusion is an isomorphism.
Each of these theorems relates direct limits deﬁned over diﬀerent directed sets. To prove them, I
will want to rewrite the various direct limits as direct limits over the same directed set. This raises
the following ...
Question 35.4. When doesϕ : J → I induce an isomorphismlim− →J Aϕ → lim− →IA?
This is a lot like taking a sequence and a subsequence and asking when they have the same
limit. There’s a coﬁnality condition in analysis, that has a similar expression here.
Deﬁnition 35.5.ϕ : J → I is coﬁnal if for alli ∈ I, there existsj ∈ J such thati ≤ϕ(j).
Example 35.6. Any surjective order-preserving map is coﬁnal.
For another example, let(N>0,< ) be the positive integers with their ususal order, and(N>0, |)
the same set but with the divisiblity order. There is an order-preservingmapϕ : (N>0,< ) → (N>0, |)
given byn ↦→n!. This map is far from surjective, but any integern divides some factorial (n divides
n!, for example), soϕ is coﬁnal. We claimed that both these systems produceQ as direct limit.
Lemma 35.7. If ϕ : J → I is coﬁnal thenlim− →J Aϕ → lim− →IA is an isomorphism.
Proof. Check that{Aϕ(j) → lim− →IA} satisﬁes the necessary and suﬃcient conditions to belim− →J Aϕ.
1. For eacha ∈ lim− →IA there existsj ∈ J andaj ∈Aϕ(j) such thataj ↦→a: We know that there
exists somei ∈ I and ai ∈A such thatai ↦→a. Pickj such thati ≤ϕ(j). Then ai ↦→aϕ(j),
and by compatibility we getaϕ(j) ↦→a.
2. Suppose a ∈ Aϕ(j) maps to 0 ∈ lim− →IA. Then there is somei ∈ I such thatϕ(j) ≤ i and
a ↦→ 0 in Ai. But then there isj′ ∈ J such thati ≤ϕ(j′), anda ↦→ 0 ∈Aϕ(j′) as well.
Proof of Theorem 35.2, the long exact sequence.Let (K,L ) be a closed pair in the spaceX. We
have
ˇHp(K,L ) = lim− →
(U,V )∈UK,L
Hp(U,V ), ˇHp(K) = lim− →U∈UK
Hp(U), and ˇHp(L) = lim− →V∈VL
Hp(V ).
We can rewrite the entire sequence as the direct limit of a directed system of exact sequences indexed
by UK,L, since the order-preserving maps
UK ← UK,L → UL
U ↦→(U,V ) ↦→V
are both surjective and hence coﬁnal. So the long exact sequence of a pair in Čech cohomology is
the direct limit of the system of long exact sequences of the neighborhood pairs(U,V ) and so is
exact.


## Page 101

35. CECH COHOMOLOGY AS A COHOMOLOGY THEORY 99
The proof of the excision theorem depends upon another pair of coﬁnalities.
Lemma 35.8.Assume thatX is a normal space andA,B closed subsets, or thatX is a Hausdorﬀ
space andA,B compact subsets. Then the order-preserving maps
U(A∪B,B) ← UA × UB → U(A,A∩B)
given by
(W ∪Y,Y ) ↦→(W,Y ) ↦→ (W,W ∩Y )
are both coﬁnal.
Proof. The left map is surjective, because if(U,V ) ∈ UA∪B,B then U ∈ UA, V ∈ UB, and (U,V ) =
(U ∪V,V ).
To see that the right map is coﬁnal, start with(U,V ) ∈ UA,A∩B.
Note thatA is disjoint fromB ∩ (X −V ), so by normality, or compactness in a Hausdorﬀ space,
there exist non-intersecting open setsS andT withA ⊆S andB ∩ (X −V ) ⊆T. Then takeW =
U ∩S ∈ UA andY =V ∪T ∈ UB, and observe thatW ∩Y =V ∩S and so(W,W ∩Y ) ⊆ (U,V ).
Proof of Theorem 35.3.Combine Lemma 35.8 with excision for singular cohomology:
lim− →(W,Y )∈UA×UB
Hp(W ∪Y,Y )
∼= →→
∼=
↓↓
lim− →UA×UB
Hp(W,W ∩Y )
∼=
↓↓
lim− →(U,V )∈UA∪B,B
Hp(U,V ) →→ lim− →(U,V )∈UA,A∩B
Hp(U,V )
ˇHp(A ∪B,B ) →→ ˇHp(A,A ∩B)
The Mayer-Vietoris long exact sequence is a consequence of these two results.
Corollary 35.9(Mayer-Vietoris). SupposeA and B are closed subsets of a normal space, or com-
pact subsets of a Hausdorﬀ space. There is a natural long exact sequence:
· · · → ˇHp−1(A ∪B) → ˇHp−1(A) ⊕ ˇHp(B) → ˇHp−1(A ∩B) →Hp(A ∪B) → · · · .


## Page 102

100 CHAPTER 3. COHOMOLOGY AND DUALITY
Proof. Apply Lemma 11.6 to the ladder
· · · →→ ˇHp−1(A ∪B)
↓↓
→→ ˇHp−1(B)
↓↓
→→ ˇHp(A ∪B,B )
∼=
↓↓
→→ ˇHp(A ∪B)
↓↓
→→ ˇHp(B)
↓↓
→→ · · ·
· · · →→ ˇHp−1(A) →→ ˇHp−1(A ∩B) →→ ˇHp(A,A ∩B) →→ ˇHp(A) →→ ˇHp(A ∩B) →→ · · ·.
36 The fully relative cap product
Čech cohomology appeared as the natural algebra acting onH∗(X,X −K), whereK is a closed
subspace ofX:
∩ : ˇHp(K) ⊗Hn(X,X −K) →Hq(X,X −K), p +q =n.
If we ﬁxxK ∈Hn(X,X −K), then capping withxK gives a map
∩xK : ˇHp(K) →Hq(X,X −K), p +q =n.
We will be very interested in showing that this map is an isomorphism under certain conditions.
This is a kind of duality result, comparing cohomology and relative homology and reversing the
dimensions. We’ll try to show that such a map is an isomorphism by embedding it in a map of long
exact sequences and using the ﬁve-lemma.
For a start, let’s think about how these maps vary as we changeK. So letL be a closed subset
of K, soX −K ⊆X −L and we get a “restriction map”
i∗ :Hn(X,X −K) →Hn(X,X −L).
Deﬁne xL as the image ofxK. The diagram
ˇHp(K) →→
−∩xK
↓↓
ˇHp(L)
−∩xL
↓↓
Hq(X,X −K) →→Hq(X,X −L)
commutes by the projection formula. This embeds into a ladder shown in the theorem below. We
will accompany this ladder with a second one, to complete the picture.
Theorem 36.1.LetL ⊆K be closed subspaces of a spaceX. There is a “fully relative” cap product
∩ : ˇHp(K,L ) ⊗Hn(X,X −K) →Hq(X −L,X −K), p +q =n,
such that for anyxK ∈Hn(X,X −K) the ladder
· · · →→ ˇHp(K,L ) →→
∩xK
↓↓
ˇHp(K) →→
∩xK
↓↓
ˇHp(L) δ →→
∩xL
↓↓
ˇHp+1(K,L ) →→
∩xK
↓↓
· · ·
· · · →→Hq(X −L,X −K) →→Hq(X,X −K) →→Hq(X,X −L) ∂ →→Hq−1(X −L,X −K) →→ · · ·


## Page 103

36. THE FULLY RELATIVE CAP PRODUCT 101
commutes, wherexL is the restriction ofxK to Hn(X,X −L), and for anyx ∈Hn(X)
· · · →→ ˇHp(X,K )
∩x
↓↓
→→ ˇHp(X,L )
∩x
↓↓
→→ ˇHp(K,L )
∩xK
↓↓
δ →→ ˇHp+1(X,K )
∩x
↓↓
→→ · · ·
· · · →→Hq(X −K) →→Hq(X −L) →→Hq(X −L,X −K) ∂ →→Hq−1(X −K) →→ · · ·
commutes, wherexK is the restriction ofx to Hn(X,X −K).
Proof. What I have to do is deﬁne a cap product along the bottom row of the diagram (with
p +q =n)
ˇHp(K) ⊗Hn(X,X −K) ∩ →→Hq(X,X −K)
ˇHp(K,L ) ⊗Hn(X,X −K)
↑↑
∩ →→Hq(X −L,X −K)
↑↑
This requires going back to the origin of the cap product. Our mapˇHp(K) ⊗Hn(X,X −K) →
Hq(X,X −K) came (via excision) from a chain mapSp(U) ⊗Sn(U,U −K) →Sq(U,U −K) where
U ⊇K, deﬁned byβ ⊗σ ↦→β(σ ◦αp) · (σ ◦ωq). Now given inclusions
L ⊆ K
⊆
⊆
V ⊆ U
we can certainly ﬁll in the bottom row of the diagram
Sp(U) ⊗Sn(U)/Sn(U −K) →→Sq(U)/Sq(U −K)
Sp(U,V ) ⊗Sn(U)/Sn(U −K) →→
↑↑
Sq(U −L)/Sq(U −K)
↑↑
Since cochains inSp(U,V ) kill chains inV, we can extend the bottom row to
Sp(U) ⊗Sn(U,U −K) →→Sq(U,U −K)
Sp(U,V ) ⊗ (Sn(U −L) +Sn(V ))/Sn(U −K) →→
≃
↓↓
↑↑
Sq(U −L)/Sq(U −K)
↑↑
Sp(U,V ) ⊗Sn(U)/Sn(U −K)
ButL ⊆V, so(U −L)∪V =U, and the locality principle then guarantees thatSn(U −L)+Sn(V ) →
Sn(U) is a quasi-isomorphism. By excision,Hn(U,U −K) → Hn(X,X −K) is an isomorphism.
Now use our standard mapµ :H∗(C) ⊗H∗(D) →H∗(C ⊗D).
This gives the construction of the fully relative cap product. We leave the checks of commuta-
tivity to the listener.
The diagram
ˇHp(L) δ →→
−∩xL
↓↓
ˇHp+1(K,L )
−∩xK
↓↓
Hq(X,X −L) ∂ →→Hq−1(X −L,X −K)


## Page 104

102 CHAPTER 3. COHOMOLOGY AND DUALITY
provides us with the memorable formula
(δb) ∩xK =∂(b ∩xL).
The construction of the Mayer-Vietoris sequences now gives:
Theorem 36.2. Let A,B be closed in a normal space or compact in a Hausdorﬀ space. The
Čech cohomology and singular homology Mayer-Vietoris sequences are compatible: for anyxA∪B ∈
Hn(X,X −A ∪B), there is a commutative ladder (where again we use the notationHq(X|A) =
Hq(X,X −A), and againp +q =n)
· · · →→ ˇHp(A ∪B) →→
∩xA∪B
↓↓
ˇHp(A) ⊕ ˇHp(B) →→
(∩xA)⊕(∩xB)
↓↓
ˇHp(A ∩B) →→
∩xA∩B
↓↓
ˇHp+1(A ∪B) →→
∩xA∪B
↓↓
· · ·
· · · →→Hq(X|A ∪B) →→Hq(X|A) ⊕Hq(X|B) →→Hq(X|A ∩B) →→Hq−1(X|A ∪B) →→ · · ·
in which the homology classesxA,xB,xA∩B are restrictions of the classxA∪B in the diagram
Hn(X,X −A)
→→
Hn(X,X −A ∪B)
→→
→→
Hn(X,X −A ∩B)
Hn(X,X −B)
→→
37 Poincaré duality
Let M be an-manifold andK a compact subset. By Theorem 32.1
Hn(M,M −K;R)
∼=− →Γ(K;oM ⊗R).
Anorientation alongK is a section ofoM ⊗RoverK that restricts to a generator ofHn(M,M −x;R)
for everyx ∈ K. The corresponding class inHn(M,M −K;R) is a fundamental class alongK,
[M]K. We recall also the fully relative cap product pairing (in whichp +q = n and L is a closed
subset ofK)
∩ : ˇHp(K,L ;R) ⊗RHn(M,M −K;R) →Hq(M −L,M −K;R).
We now combine all of this in the following climactic result.
Theorem 37.1 (Fully relative Poincaré duality). Let M be ann-manifold andK ⊇ L a pair of
compact subsets. Assume given anR-orientation along K, with corresponding fundamental class
[M]K. Withp +q =n, the map
∩[M]K : ˇHp(K,L ;R) →Hq(M −L,M −K;R).
is an isomorphism.


## Page 105

37. POINCARÉ DUALITY 103
We have seen that these isomorphisms are compatible; they form the rungs of the commuting
ladder
· · · →→ ˇHp−1(L) →→
∩[M]L
↓↓
ˇHp(K,L ) →→
∩[M]K
↓↓
ˇHp(K) →→
∩[M]K
↓↓
ˇHp(L) →→
∩[M]L
↓↓
· · ·
· · · →→Hq+1(M,M −L) →→Hq(M −L,M −K) →→Hq(M,M −K) →→Hq(M,M −L) →→ · · ·
Also, ifM is compact andR-oriented with fundamental class[M] restricting alongK to [M]K, we
have the ladder of isomorphisms
· · · →→ ˇHp(M,L ) →→
∩[M]
↓↓
ˇHp(K,L ) →→
∩[M]K
↓↓
ˇHp+1(M,K ) →→
∩[M]
↓↓
ˇHp+1(M,L ) →→
∩[M]
↓↓
· · ·
· · · →→Hq(M −L) →→Hq(M −L,M −K) →→Hq−1(M −K) →→Hq−1(M −L) →→ · · ·
To prove this theorem, we will follow the same ﬁve-step process we used to prove the Orientation
Theorem 32.1. We have already prepared the Mayer-Vietoris ladder for this purpose. We will also
need:
Lemma 37.2. LetA1 ⊇A2 ⊇ · · · be a decreasing sequence of compact subspaces ofM. Then
ˇHp(Ak) → ˇHp(A)
is an isomorphism.
Proof. This follows from the observation that a direct limit of direct limits is a direct limit.
Proof of Theorem 37.1.By the top ladder and the ﬁve-lemma, we may assumeL = ∅; so we want
to prove that
∩[M]K : ˇHp(K;R) →Hq(M,M −K;R)
is an isomorphism.
(1) M = Rn, K a compact convex set. We claim that
ˇH∗(K)
∼=− →H∗(K).
For anyϵ> 0, letUϵ denote theϵ-neighborhood ofK,
Uϵ =
⋃
x∈K
Bϵ(x).
For anyy ∈ Uϵ there is a closest point inK, since the distance function toy is continuous and
bounded below on the compact setK and so achieves its inﬁmum. If x′,x′′ ∈ K are the same
distance fromy, then the midpoint of the segment joiningx′ and x′′ is closer, but lies inK since
K is convex. So there is a unique closest point,f(y). We let the listener check thatf :Uϵ →K is
continuous. It is also clear that ifi :K →Uϵ is the inclusion theni ◦f is homotopic to the identity
on Y, by an aﬃne homotopy.


## Page 106

104 CHAPTER 3. COHOMOLOGY AND DUALITY
Now letDn be a disk centered at the origin and containing the compact setK, and consider
the commutative diagram
Hp(K)
∩[Rn]K →→Hq(Rn, Rn −K)
Hp(Dn)
∼=
↑↑
→→
∼=
↓↓
Hq(Rn, Rn −Dn)
∼=
↑↑
∼=
↓↓
Hp(∗) →→Hq(Rn, Rn − ∗).
The groups are zero unlessp = 0,q =n. By naturality of the cap product, the bottom map is given
by 1 ↦→ 1 ∩ [Rn]∗, and this is[Rn]∗ since capping with 1 is the identity, and this fundamental class
is a generator ofHn(Rn, Rn − ∗).
(2) K a ﬁnite union of compact convex subsets ofRn. This follows by induction and the ﬁve
lemma applied to the Mayer-Vietoris ladder 36.2.
(3) K is any compact subset ofRn. This follows as before by a limit argument, using Lemmas
32.4 and 37.2.
(4) M arbitrary,K is a ﬁnite union of compact Euclidean subsets ofM. This follows from (3)
and Theorem 36.2.
(5) M arbitrary,K an arbitrary compact subset. This follows just as in the proof of Theorem
32.1.
Let’s point out some special cases. WithK =M, we get:
Corollary 37.3.Suppose thatM is a compactR-orientedn-manifold, and letL be a closed subset.
Then (withp +q =n) we have the commuting ladder whose rungs are isomorphisms:
· · · →→ ˇHp−1(L)
∩[M]L
↓↓
→→ ˇHp(M,L )
∩[M]
↓↓
→→Hp(M)
∩[M]
↓↓
→→ ˇHp(L)
∩[M]L
↓↓
→→ · · ·
· · · →→Hq+1(M,M −L) →→Hq(M −L) →→Hq(M) →→Hq(M,M −L) →→ · · ·
With L = ∅, we get:
Corollary 37.4.Suppose thatM is ann-manifold, and letK be a compact subset. AnR-orientation
along K determines (withp +q =n) an isomorphism
∩[M]K : ˇHp(K;R) →Hq(M,M −K;R).
The intersection of these two special cases is:
Corollary 37.5(Poincaré duality). LetM be a compactR-orientedn-manifold. Then
∩[M] :Hp(M;R) →Hn−p(M;R)
is an isomorphism.


## Page 107

38. APPLICATIONS 105
38 Applications
Today we harvest consequences of Poincaré duality. We’ll use the form
Theorem 38.1. Let M be an n-manifold and K a compact subset. An R-orientation along K
determines a fundamental class[M]K ∈Hn(M,M −K), and capping gives an isomorphism:
∩[M]K : ˇHn−q(K;R)
∼=− →Hq(M,M −K;R).
Corollary 38.2. ˇHp(K;R) = 0 for p>n .
We can contrast this with singular (co)homology. Here’s an example:
Example 38.3 (Barratt-Milnor, [1]). A two-dimensional versionK of the Hawaiian earring, i.e.,
nested spheres all tangent to a point whose radii are going to zero. What they proved is that
Hq(K; Q) is uncountable for everyq >1. But Čech cohomology is much more well-behaved.
Theorem 38.4(Alexander duality). For any compact subsetK of Rn, the composite
ˇHn−q(K;R)
∩[Rn]K
− − − − − →Hq(Rn, Rn −K;R) ∂− →˜Hq−1(Rn −K;R)
is an isomorphism.
Proof. ˜H∗(Rn;R) = 0.
This is extremely useful! For example
Corollary 38.5. If K is a compact subset ofRn then ˇHn(K;R) = 0.
Corollary 38.6. The complement of a knot inS3 is a homology circle.
Example 38.7. Take the caseq = 1:
ˇHn−1(K;R)
∼=− →˜H0(Rn −K;R) = ker(ε :Rπ0(Rn −K) →R).
The augmentation is a split surjection, so this is a freeR-module. This shows, for example, that
RP2 can’t be embedded inR3 – at least not with a regular neighborhood.
If we taken = 2 and suppose that ˇH∗(K) =H∗(S1), we ﬁnd that the complement ofK has two
path components. This is theJordan Curve Theorem.
There is a useful purely cohomological consequence of Poincaré duality, obtained by combining
it with the universal coeﬃent theorem
0 → Ext1
Z(Hq−1(X), Z) →Hq(X) → Hom(Hq(X), Z) → 0.
First, note that Hom(Hq(X), Z) is always torsion-free. If I assume thatHq−1(X) is ﬁnitely gen-
erated, then Ext1
Z(Hq−1(X), Z) is a ﬁnite abelian group. So the UCT is providing the short exact
sequence
0 → torsHq(X) →Hq(X) →Hq(X)/tors → 0
– that is,
Hq(X)/tors
∼=− →Hom(Hq(X)/tors, Z).


## Page 108

106 CHAPTER 3. COHOMOLOGY AND DUALITY
That is to say, the Kronecker pairing descends to a perfect pairing
Hq(X)
tors ⊗ Hq(X)
tors → Z.
Let’s combine this with Poincaré duality. LetX = M be a compact orientedn-manifold, so
that
∩[M] :Hn−q(M)
∼=− →Hq(M).
We get a perfect pairing
Hq(X)
tors ⊗ Hn−q(X)
tors → Z.
And what is that pairing? It’s given by the composite
Hq(M) ⊗Hn−q(M) →→
1⊗(−∩[M])
↓↓
Z
Hq(M) ⊗Hq(M)
⟨−,−⟩
→→
and we’ve seen that
⟨a,b ∩ [M]⟩ = ⟨a ∪b, [M]⟩
We have usedR = Z, but the same argument works for any PID – in particular for any ﬁeld, in
which casetorsV = 0. We have proven:
Theorem 38.8. LetR be a PID anM a compactR-orientedn-manifold. Then
a ⊗b ↦→ ⟨a ∪b, [M]⟩
induces a perfect pairing (withp +q =n)
Hp(M;R)
tors ⊗R
Hq(M;R)
tors →R.
Example 38.9. Complex projective 2-space is a compact 4-manifold, orientable since it is simply
connected. It has a cell structure with cells in dimensions0, 2, and4, so its homology isZ in those
dimensions and 0 elsewhere, and so the same is true of its cohomology. Up till now the cup product
structure has been a mystery. But now we know that
H2(CP2) ⊗H2(CP2) →H4(CP2)
is a perfect pairing. So if we writea for a generator ofH2(CP2), thena ∪a =a2 is a free generator
for H4(CP2). We have discovered that
H∗(CP2) = Z[a]/a3.
By the way, notice that if we had chosen−a as a generator, we would still produce the same
generator forH4(CP2): so there is a preferred orientation, the one whose fundamental class pairs
to 1 againsta2.
This calculation shows that whileCP2 and S2 ∨S4 are both simply connected and have the
same homology, they are not homotopy equivalent. This implies that the attaching mapS3 →S2
for the top cell inCP2 – the Hopf map– is essential.
How about CP3? It just adds a 6-cell, so now H6(CP3) ∼= Z. The pairing H2(CP3) ⊗
H4(CP3) → H6(CP3) is perfect, so we ﬁnd thata3 generates H6(CP3). Continuing in this way,
we have
H∗(CPn) = Z[a]/(an+1).


## Page 109

38. APPLICATIONS 107
Example 38.10. Exactly the same argument shows that
H∗(RPn; F2) = F2[a]/(an+1)
where |a| = 1.
I’ll end with the following application.
Theorem 38.11 (Borsuk-Ulam). Think of Sn as the unit vectors inRn+1. For any continuous
function f :Sn → Rn, there existsx ∈Sn such thatf(x) =f(−x).
Proof. Suppose that no suchx exists. Then we may deﬁne a continuous functiong :Sn →Sn−1 by
g :x ↦→ f(x) −f(−x)
||f(x) −f(−x)||.
Note thatg(−x) = −g(x): g is equivariant with respect to the antipodal action. It descends to a
map g : RPn → RPn−1.
We claim thatg∗ :H1(RPn) →H1(RPn−1) is nontrivial. To see this, pick a basepointb ∈Sn
and choose a 1-simplexσ : ∆1 →Sn such thatσ(e0) = b and σ(e1) = −b. The groupH1(RPn) is
generated by the cyclepσ. The image of this cycle inH1(RPn−1) is represented by the loopgpσ
at b = pb, which is the image of the 1-simplexgσ joining gb to g(−b) = −g(b). The class of this
1-simplex thus generatesH1(RPn−1).
Thereforeg is nontrivial inH1(−; F2), and hence also inH1(−; F2). Writingan for the generator
of H1(RPn; F2), we must havean = g∗an−1, and consequentlyan
n = (g∗an−1)n = g∗(an
n−1). But
Hn(RPn−1; F2) = 0, soan
n−1 = 0; whilean
n ̸= 0. This is a contradiction.


## Page 110

Bibliography
[1] M. G. Barratt and J. Milnor, An example of anomalous singular homology, Proc. Amer. Math.
Soc. 13 (1962) 293–297.
[2] G. Bredon,Topology and Geometry, Springer-Verlag, 1993.
[3] A. Dold,Lectures on Algebraic Topology, Springer-Verlag, 1980.
[4] S. Eilenberg and J. C. Moore, Homology and ﬁbrations, I: Coalgebras, cotensor product and its
derived functors, Comment. Math. Helv. 40 (1965) 199–236.
[5] S. Eilenberg and N. Steenrod,Foundations of Algebraic Topology, Princeton University Press,
1952.
[6] A. Hatcher,Algebraic Topology, Cambridge University Press, 2002.
[7] D. Kan, Adjoint funtors, Trans. Amer. Math. Soc. 87 (1958) 294–329.
[8] J. Milnor, On axiomatic homology theory, Paciﬁc J. Math 12 (1962) 337–341.
[9] J. C. Moore, On the homotopy groups of spaces with a single non-vanishing homology group,
Ann. Math. 59 (1954) 549–557.
[10] C. T. C Wall, Finiteness conditions for CW complexes, Ann. Math. 81 (1965) 56–69.
109


## Page 111

MIT OpenCourseWare
https://ocw.mit.edu
18.905 Algebraic Topology I
Fall 2016
For information about citing these materials or our Terms of Use, visit: https://ocw.mit.edu/terms.
