# Geometric Topology

Source title: An Introduction to Geometric Topology

Converted from: `10.pdf`


## Page 1

An Introduction to Geometric Topology
Bruno Martelli


## Page 2

Bruno Martelli
University of Pisa, Italy
http://people.dm.unipi.it/martelli/
Version 4 of September 2025


## Page 3

To Ada, Sara, and Ylenia.


## Page 4

[No extractable text on this page]


## Page 5

Contents
Introduction 1
Part 1. Hyperbolic geometry 5
Chapter 1. Preliminaries 7
1.1. Diﬀerential topology 7
1.2. Riemannian geometry 15
1.3. Measure theory 23
1.4. Groups 25
1.5. Group actions 32
1.6. Homology 34
1.7. Cells and handle decompositions 36
Chapter 2. Hyperbolic space 45
2.1. The models of hyperbolic space 45
2.2. Compactiﬁcation and isometries of hyperbolic space 58
2.3. Isometry groups in dimensions two and three 64
2.4. Geometry of hyperbolic space 68
Chapter 3. Hyperbolic manifolds 73
3.1. Discrete groups of isometries 73
3.2. Polyhedra 78
3.3. Tessellations 82
3.4. Fundamental domains 90
3.5. Geodesic boundary, non-complete, and cone manifolds 97
3.6. Orbifolds 102
Chapter 4. Thick-thin decomposition 109
4.1. Tubes and cusps 109
4.2. The Margulis Lemma 115
4.3. Geodesic spectrum, isometry groups, and ﬁnite covers 123
4.4. The Bieberbach Theorem 128
Chapter 5. The sphere at inﬁnity 135
5.1. Limit set 135
5.2. Extensions of homotopies 143
v


## Page 6

vi CONTENTS
Part 2. Surfaces 151
Chapter 6. Surfaces 153
6.1. Topological classiﬁcation 153
6.2. Geometrisation 157
6.3. Curves on surfaces 169
6.4. Homotopy and isotopy 181
6.5. Mapping class group 186
Chapter 7. Teichmüller space 193
7.1. Introduction 193
7.2. Earthquakes and length functions 196
7.3. Fenchel–Nielsen coordinates 204
7.4. Shear coordinates 213
Chapter 8. Surface diﬀeomorphisms 221
8.1. Thurston’s compactiﬁcation 221
8.2. Geodesic currents 225
8.3. Laminations 241
8.4. Surface diﬀeomorphisms 261
Part 3. Three-manifolds 269
Chapter 9. Topology of three-manifolds 271
9.1. Algebraic topology 271
9.2. Prime decomposition 274
9.3. Incompressible surfaces 290
9.4. Haken manifolds 296
Chapter 10. Seifert manifolds 305
10.1. Lens spaces 305
10.2. Circle bundles 312
10.3. Seifert manifolds 316
10.4. Classiﬁcation 333
Chapter 11. Constructions of three-manifolds 345
11.1. Heegaard splittings 345
11.2. Knots and links 347
11.3. Dehn surgery 354
11.4. Surface bundles 362
11.5. JSJ decomposition 366
Chapter 12. The eight geometries 371
12.1. Introduction 371
12.2. Elliptic three-manifolds 372
12.3. Flat three-manifolds 382
12.4. The product geometries 385


## Page 7

CONTENTS vii
12.5. Nil geometry 388
12.6. ˜SL2 geometry 394
12.7. Sol geometry 398
12.8. Summary 401
12.9. The geometrisation conjecture 403
Chapter 13. Mostow rigidity theorem 407
13.1. Volume of tetrahedra 407
13.2. Simplicial volume 412
13.3. Mostow rigidity 419
Chapter 14. Hyperbolic three-manifolds 423
14.1. Cusped three-manifolds 423
14.2. Closed hyperbolic three-manifolds 435
Chapter 15. Hyperbolic Dehn ﬁlling 445
15.1. Introduction 445
15.2. The solution space 452
15.3. Proof of the theorem 463
15.4. Volumes 470
Bibliography 481
Index 485


## Page 8

[No extractable text on this page]


## Page 9

Introduction
The aim of this book is to introduce the reader to an area of mathe-
matics calledgeometric topology. The text should be suitable to a master
or PhD student in mathematics interested in geometry, and more generally
to any curious mathematician with a standard background in topology and
analysis.
Weinterprettheterm“geometrictopology” inaquiterestrictivesense:
for us, this topic is the study of topological manifolds via the assignment
of a preferred “geometric structure,” that is some Riemannian metric of a
particular nice kind. It is one of the most important discoveries in modern
geometry that such preferred metrics exist on every compact manifold of
dimension two and three, and this is exactly what this book is about.
In other words, this book is an introduction to surfaces and three-
manifolds, and to their geometrisation, due to Poincaré and Koebe in
1907 in dimension two and to Thurston and Perelmann in 2002 in dimen-
sion three. Therefore this is also a textbook onlow-dimensional topology,
exceptthatwecompletelyneglectfour-manifolds, thatformarelevantpart
of this area but which do not (yet?) ﬁt in any geometrisation perspective.
There are already many good textbooks on surfaces, so our main new
contribution is probably to furnish a complete introduction to Thurston’s
geometrisation of three-manifolds, that includes both the topological side
of the story (the decomposition of three-manifolds along spheres and tori,
the classiﬁcation of Seifert manifolds) and the geometric side (hyperbolic
geometry, Thurston’s Dehn ﬁlling Theorem, Mostow rigidity, the eight
geometries).
This book is essentially self-contained: in the ﬁrst chapter we recall
all the relevant background material in diﬀerential topology and geometry,
andfromthesecondchapteronwenevermentionatheoremwithoutgiving
a proof – with only one important but unavoidable exception: Perelman’s
solution of the geometrisation conjecture, stated in Chapter 12.
Outline. Hereisabriefoutlineofthematerialcontainedineachchap-
ter. The book is divided into three parts. In the ﬁrst, we introduce hyper-
bolic geometry and its relatives, the elliptic and ﬂat geometries. Hyperbolic
geometry is by far the richest, the most beautiful, and also the most im-
portant geometry in dimensions two and three: its relevance is witnessed
1


## Page 10

2 INTRODUCTION
by the folk sentence that a “generic” manifold of dimension two or three
has a hyperbolic structure, that is a Riemannian structure locally isometric
to the hyperbolic plane or space.
Chapter 1 includes all the preliminaries that we will need: in particu-
lar, we quickly review various general notions of diﬀerential topology and
geometry that can be found in many excellent books.
Chapter 2 introduces the reader to the hyperbolic spaceHn: as oppo-
site to the sphereSn and to the euclidean spaceRn, the hyperbolic space
may be represented in at least four diﬀerent ways, none of which is preva-
lent: each representation is called amodel. We introduce the models, and
then study the isometries, the compactiﬁcation ofHn, and its subspaces.
Chapter 3 deals with hyperbolic manifolds. Maybe unexpectedly, these
objects are related to a number of diﬀerent beautiful mathematical con-
cepts like discrete subgroups of Lie groups, polyhedra, and tessellations.
We also present some generalisations like manifolds with geodesic bound-
ary, cone manifolds, and orbifolds.
Chapter 4 introduces thethick-thin decomposition, a general struc-
tural theorem on hyperbolic manifolds that allows us to understand in par-
ticular the topology of the complete hyperbolic manifolds that have ﬁnite
volume but are not compact. It also contains various information on ﬂat
and elliptic manifolds, including Bieberbach’s Theorem.
Chapter 5 introduces a variety of notions and results on hyperbolic
manifolds that are connected with the points at inﬁnity ofHn.
The second part of the book deals with surfaces. We classify and
geometrise every surface of ﬁnite type in Chapter 6, where we also study
simple closed curves in surfaces and deﬁne themapping class group.
Chapter 7 presents theTeichmüller spaceof a genus-g surface, as the
space of its hyperbolic structures. We use the Fenchel–Nielsen coordinates
to show that this space is in fact homeomorphic toR6g−6.
Chapter 8 introduces Thurston’s beautiful theory of diﬀeomorphisms
of surfaces. We introduce Thurston’s compactiﬁcation of the Teichmüller
space, and the consequent classiﬁcation of the elements of the mapping
class group into three classes. We deﬁne and study some intriguing objects
called geodesic currentsand laminations.
The last (and longest) part of the book is devoted to three-manifolds.
In Chapter 9 we introduce the ﬁrst topological facts, including the prime
decomposition, incompressible surfaces, and Haken manifolds.
Chapter 10 is entirely devoted to Seifert manifolds, a class of three-
manifoldsthatcontainsmanyinterestingexamples. Weclassifytheseman-
ifolds completely.
In Chapter 11 we present various techniques that topologists use every
day to construct three-manifolds: Heegaard splittings, knots and links,
Dehn surgery, and surface bundles. We end by stating and proving the
canonical torus decomposition.


## Page 11

INTRODUCTION 3
In Chapter 12 we ﬁnally move from topology to geometry: there are
eight relevant geometries in dimension three, and we introduce them with
some detail. We show in particular that the Seifert manifolds occupy
precisely six of them.
In Chapter 13 it is due time to start investigating the most interesting
of the three-dimensional geometries, the hyperbolic one: we prove that in
dimension three every manifold has at most one hyperbolic structure, and
this important fact is known asMostow’s rigidity Theorem.
In Chapter 14 we construct many examples of hyperbolic 3-manifolds,
by introducing ideal triangulations andThurston’s equations.
Chapter 15 contains a complete proof of Thurston’shyperbolic Dehn
ﬁlling theoremand a discussion on the volumes of hyperbolic 3-manifolds.
As we mentioned above, this book is almost entirely self-contained
and the bibliography is minimised to the strict necessary: each chapter
ends with a short section containing the pertaining references, that consist
essentially in the sources that we have consulted for that chapter. Many of
the topics presented here have their origin in Thurston’s notes and papers
and are of course already covered by other books, that we have widely
used, so our bibliography consists mainly of secondary sources.
Acknowledgements. This book has been written in the years 2011-
16, as a slowly growing textbook that has accompanied the author and
his students during the master courses in Pisa on hyperbolic geometry,
surfaces, and three-manifolds. The author has largely proﬁted of many
discussions with students and colleagues, and in particular he would like
to warmly thank Giovanni Alberti, Vinicius Ambrosi, Ludovico Battista,
Riccardo Benedetti, Andrea Bianchi, Francesco Bonsante, Sabrina Bot-
ticchio, Alessio Carrega, Jacopo Guoyi Chen, Gemma Di Petrillo, Xiaom-
ing Du, Leonardo Ferrari, Irene Filoscia, Stefano Francaviglia, Roberto
Frigerio, David Futer, John Hubbard, Wolfgang Keller, Patrick Lin, Filippo
Mazzoli, Alice Merz, Gabriele Mondello, Andrea Monti, Matteo Novaga,
Carlo Petronio, Nicola Picenni, Stefano Riolo, Dan Rutherford, Federico
Salmoiraghi, Leone Slavich, Chaitanya Tappu, Giacomo Tendas, Dylan
Thurston, and Gabriele Viaggi for their help.
Copyright notices. The text is released under the Creative Com-
mons-BY-NC-SA license. You are allowed to distribute, modify, adapt,
and use of this work for non-commercial purposes, as long as you correctly
attribute its authorship and keep using the same license.
Thepicturesusedhereareallinthepublicdomain(boththosecreated
by the author and those downloaded from Wikipedia, which were already
in the public domain), except the following ones that are released with a
CC-BY-SA license and can be downloaded from Wikipedia:
• Figure 1.3 created by Oleg Alexandrov,
• Figure 1.7 (triangulated torus) created by Ag2gaeh,


## Page 12

4 INTRODUCTION
• Figure 2.4 (tessellation of hyperbolic plane), Figure 2.13 (horo-
sphere), Figure4.2(pseudosphere), andFigure3.6(tessellations
of hyperbolic plane) created by Claudio Rocchini,
• Figure 3.3-right (dodecahedron) created by DTR,
• Figure3.9and3.10(dodecahedraltessellations)createdbyRoice3,
• Figure 3.14 (Voronoi tessellation) created by Mysid and Cyp,
• Figure 3.15 (fundamental domain of the modular group) and
Figure 11.10 (Seifert surface for the trefoil knot) created by
Kilom691,
• Figure 6.10 created by Tttrung,
• Figure 8.4 created by Adam Majewski,
• Figure 10.9 (The Hopf ﬁbration) created by Niles Johnson,
• Figure 11.3 (Knot sum) originally created by Maksim and tP-
brocks13,
• Figure 11.9 (Satellite knots) originally created by RyBu.
The painting in the front page is a courtesy of Mariette Michelle Egreteau.
The Figures 5.1, 5.2, 5.3 and 5.4 were made by Jacopo Guoyi Chen.


## Page 13

Part 1
Hyperbolic geometry


## Page 14

[No extractable text on this page]


## Page 15

CHAPTER 1
Preliminaries
We expect the reader to be familiar with the mathematics usually
taught to undergraduates, like multivariable diﬀerential calculus, group
theory, topological spaces, and fundamental groups.
Some knowledge on diﬀerentiable and Riemannian manifolds would
also help, at least on an intuitive way: in any case, this chapter introduces
from scratch everything we need from diﬀerential topology and geometry.
We also include some important information on groups (like Lie groups
and group actions), and a few basic notions of measure theory and alge-
braic topology, with a very quick overview of homology theory. Finally, we
use these tools to introduce cell complexes, handle decompositions, and
triangulations: these are the main practical instruments that we have to
build manifolds concretely.
Most results stated here are given without a proof: details can be
found in various excellent books, some of which will be cited below.
1.1. Diﬀerential topology
Weintroducemanifolds,bundles,embeddings,tubularneighbourhoods,
isotopies, and connected sums. Throughout this book, we will always work
in the smooth category. The material contained in this section is carefully
explained inDiﬀerentiable manifoldsof Kosinksi [34].
1.1.1. Diﬀerentiablemanifolds. Atopologicalmanifold ofdimension
n is a paracompact Hausdorﬀ topological spaceM locally homeomorphic
to Rn. In other words, there is a covering{Ui } of M consisting of open
sets Ui homeomorphic to open setsVi in Rn.
Topological manifolds are diﬃcult to investigate, their deﬁnition is
too general and allows to directly deﬁne and prove only few things. Even
the notion of dimension is non-trivial: to prove that an open set ofRk
is not homeomorphic to an open set ofRh for diﬀerent k and h we need
to use non-trivial constructions like homology. It is also diﬃcult to treat
topological subspaces: for instance, theAlexander horned sphereshown in
Figure 1.1 is a subspace ofR3 topologically homeomorphic to a 2-sphere.
It is a complicated object that has many points that are not “smooth” and
that cannot be “smoothened” in any reasonable way.
7


## Page 16

8 1. PRELIMINARIES
Figure 1.1. The Alexander horned sphereis a subset ofR3
homeomorphic to the 2-sphere S2. It divides R3 into two
connected components, none of which is homeomorphic to
an open ball. It was constructed by Alexander as a coun-
terexample to a natural three-dimensional generalisation of
Jordan’s curve theorem. The natural generalisation would
be the following: does every 2-sphere in R3 bound a ball?
If the 2-sphere is only topological, the answer is negative
as this counterexample shows. If the sphere is a diﬀeren-
tiable submanifold, the answer is however positive as proved
by Alexander himself.
We need to deﬁne some “smoother” objects, and for that purpose
we can luckily invoke the powerful multivariable inﬁnitesimal calculus. Let
U ⊂ Rn be an open set: a mapf : U → Rk is smooth if it isC∞, i.e. it has
partial derivatives of any order.
Deﬁnition 1.1.1. Let M be a topological manifold. Achart is a ﬁxed
homeomorphism ϕi : Ui → Vi between an open setUi of M and an open
set Vi of Rn. Anatlas is a set of charts
{
(Ui , ϕi )
}
where the open setsUi
cover M.
If Ui ∩ Uj ̸= ∅ there is atransition map ϕj i = ϕj ◦ ϕ−1
i that sends
homeomorphically the open setϕi (Ui ∩ Uj ) onto the open setϕj (Ui ∩ Uj ).
Since these two open sets are inRn, it makes sense to requireϕi j to be
smooth. The atlas isdiﬀerentiable if all transition maps are smooth.
Deﬁnition 1.1.2. A diﬀerentiable manifold is a topological manifold
that is equipped with a diﬀerentiable atlas.


## Page 17

1.1. DIFFERENTIAL TOPOLOGY 9
Figure 1.2. The tangent space atp is deﬁned as the set of
all curves γ with γ(0) = p seen up to an equivalent relation
that identiﬁes two curves having (in some chart) the same
tangent vector atp. This is a chart-independent condition.
We will often use the wordmanifold to indicate a diﬀerentiable mani-
fold. The integern is thedimension of the manifold. We have deﬁned the
objects, so we now turn to their morphisms.
Deﬁnition 1.1.3. A mapf : M → M′ between diﬀerentiable manifolds
is smooth if it is smooth when read locally through charts. This means
that for every p ∈ M there are two charts(Ui , ϕi ) of M and (U′
j , ϕ′
j ) of
N with p ∈ Ui and f (p) ∈ U′
j such that the compositionϕ′
j ◦ f ◦ ϕ−1
i is
smooth wherever it is deﬁned.
A diﬀeomorphism is a smooth mapf : M → M′ that admits a smooth
inverse g : M′ → M. Acurve in M is a smooth mapγ : I → M deﬁned on
some open intervalI of the real line, which may be bounded or unbounded.
Deﬁnition 1.1.4. A diﬀerentiable manifold isoriented if it is equipped
with an atlas where all transition functions are orientation-preserving (that
is, the determinant of their diﬀerential at any point is positive).
A manifold which can be oriented is calledorientable.
1.1.2. Tangent space.Let M be a diﬀerentiable manifold of dimen-
sion n. We may deﬁne for every pointp ∈ M a n-dimensional vector space
TpM called thetangent space.
The space TpM may be deﬁned as the set of all curvesγ : ( −a, a) →
M such that γ(0) = p and a > 0 is arbitrary, considered up to some
equivalence relation. The relation is the following: we identify two curves
that, read on some chart(Ui , ϕi ), have the same tangent vector atϕi (p).
The deﬁnition does not depend on the chart chosen.
A chart identiﬁes TpM with the usual tangent spaceRn at ϕi (p) in
the open setVi = ϕi (Ui ). Two distinct chartsϕi and ϕj provide diﬀerent
identiﬁcationswith Rn, whichdiﬀerbyalinearisomorphism: thediﬀerential


## Page 18

10 1. PRELIMINARIES
d ϕj i of the transition mapϕi j. The structure ofTpM as a vector space is
then well-deﬁned, while its identiﬁcation withRn is not.
Every smooth map f : M → N between diﬀerentiable manifolds in-
duces at each point p ∈ M a linear map dfp : TpM → Tf (p)N between
tangent spaces in the simplest way: the curveγ is sent to the curvef ◦ γ.
Deﬁnition 1.1.5. A smooth mapf : M → N is alocal diﬀeomorphism
at a pointp ∈ M if there are two open setsU ⊂ M and V ⊂ N containing
respectively p and f (p) such that f |U : U → V is a diﬀeomorphism.
The inverse function theorem inRn implies easily the following fact,
that demonstrates the importance of tangent spaces.
Theorem 1.1.6. Let f : M → N be a smooth map between manifolds
of the same dimension. The map is a local diﬀeomorphism atp ∈ M if
and only if the diﬀerentialdfp : TpM → Tf (p)N is invertible.
In this theorem a condition satisﬁed at a single point (diﬀerential
invertible at p) implies a local property (local diﬀeomorphism). Later on,
we will see that in Riemannian geometry a condition satisﬁed at a single
point may also imply a global property.
If γ : I → M is a curve, itsvelocity γ′(t) in t ∈ I is the tangent vector
γ′(t) = d γt(1). Here“1” meansthevector1inthetangentspace Tt I = R.
We note that the velocity is a vector and not a number: the modulus of
a tangent vector is not deﬁned in a diﬀerentiable manifold (because the
tangent space is just a real vector space, without a norm).
1.1.3. Diﬀerentiable submanifolds. Let N be a diﬀerentiable mani-
fold of dimensionn.
Deﬁnition 1.1.7. A subset M ⊂ N is adiﬀerentiable submanifold of
dimension m ⩽ n if every p ∈ M has an open neighbourhood U ⊂ N
diﬀeomorphic to an open setV ⊂ Rn via a map ϕ: U → V that sends
U ∩ M onto V ∩ L, where L is a linear subspace of dimensionm.
The pairs {(U ∩ M, ϕ|U∩M)} form an atlas for M, which inherits a
structure of m-dimensional diﬀerentiable manifold. At every pointp ∈ M
the tangent spaceTpM is a linear subspace ofTpN.
1.1.4. Fibre bundles. We introduce a particularly nice kind of maps.
Deﬁnition 1.1.8. Asmooth ﬁbre bundleis a smooth map
π : E − →B
such that every ﬁbreπ−1(p) is diﬀeomorphic to a ﬁxed manifoldF and π
looks locally like a projection. This means thatB is covered by open sets
Ui equipped with diﬀeomorphismsψi : Ui × F → π−1(Ui ) such that π ◦ ψi
is the projection on the ﬁrst factor.


## Page 19

1.1. DIFFERENTIAL TOPOLOGY 11
The manifoldsE and B are called thetotal andbase manifold, respec-
tively. The manifoldF is theﬁbre of the bundle. Asection of the bundle
is a smooth map s : B → E such that π ◦ s = id B. Two ﬁbre bundles
π : E → B and π′ : E′ → B are isomorphic if there is a diﬀeomorphism
ψ : E → E′ such that π = π′ ◦ ψ.
1.1.5. Vector bundles. A smooth vector bundle is a smooth ﬁbre
bundle where every ﬁbreπ−1(p) has the structure of an-dimensional real
vector space which varies smoothly with p. Formally, we require that
F = Rn and ψi (p, ·) : F → π−1(p) be an isomorphism of vector spaces for
every ψi as above.
The zero-section of a smooth vector bundle is the sections : B → E
that sendsp to s(p) = 0, the zero in the vector spaceπ−1(p). The image
s(B) of the zero-section is typically identiﬁed withB via s.
Two vector bundles areisomorphic if there is a diﬀeomorphismψ as
above, whichrestrictstoanisomorphismofvectorspacesoneachﬁbre. As
every manifold here is diﬀerentiable, likewise every bundle will be smooth
and we will hence often omit this word.
1.1.6. Tangent and normal bundle.Let M be a diﬀerentiable mani-
fold of dimensionn. The union of all tangent spaces
T M =
⋃
p∈M
TpM
is naturally a diﬀerentiable manifold of double dimension2n, called the
tangent bundle. The tangent bundleT M is naturally a vector bundle over
M, the ﬁbre overp ∈ M being the tangent spaceTpM.
Let M ⊂ N be a smooth submanifold ofN. The normal space at a
point p ∈ M is the quotient vector spaceνpM = TpN/Tp M. The normal
bundle νM is the union
νM =
⋃
p∈M
νpM
and is also naturally a smooth vector bundle overM. The normal bundle is
not canonically contained inT N like the tangent bundle, but (even more
usefully) it may be embedded directly inN, as we will soon see.
1.1.7. Vector ﬁelds. A vector ﬁeld X on a smooth manifold M is
a section of its tangent bundle. A pointp determines an integral curve
α: I → M starting from p, that is a smooth curve withα(0) = p and
α′(t) = X(α(t)) for all t ∈ I. The curve α is unique if we require the
interval I to be maximal. It depends smoothly onp.
1.1.8. Immersions and embeddings.A smooth mapf : M → N be-
tween manifolds is animmersion if its diﬀerential is everywhere injective:
note that this does not imply thatf is injective. The map is anembedding
if it is a diﬀeomorphism onto its image: this means thatf is injective, its
image is a submanifold, andf : M → f (M) is a diﬀeomorphism.


## Page 20

12 1. PRELIMINARIES
Theorem1.1.9. If M iscompact, everyinjectiveimmersion f : M → N
is an embedding.
1.1.9. Isotopy and ambient isotopy.Let X and Y be two topolog-
ical spaces. We recall that a homotopy between two continuous maps
ϕ, ψ : X → Y is a continuous mapF : X × [0, 1] → Y such that F0 = ϕ
and F1 = ψ, where Ft = F (·, t).
Let M and N be diﬀerentiable manifolds. Asmooth isotopybetween
two embeddings ϕ, ψ : M → N is a smooth homotopyF between them,
such that every mapFt is an embedding. Again, we will shortly use the
word isotopy to mean a smooth isotopy. We note that many authors do
not require an isotopy to be smooth, but we do.
Being isotopic is an equivalence relation for smooth mapsM → N:
two isotopies Ft and Gu can be glued if F1 = G0, and since we want a
smooth map we priorly modifyF and G so that they are constant near
t = 1 and u = 0. This can be done easily by reparametrisingt and u.
An ambient isotopy on N is an isotopy betweenidN and some other
diﬀeomorphism ϕ: N → N, such that every level is a diﬀeomorphism. Two
embeddings ϕ, ψ : M → N are ambiently isotopic if there is an ambient
isotopy F of N such that ψ = F1 ◦ ϕ.
Theorem 1.1.10.If M is compact, two embeddingsϕ, ψ : M → N are
isotopic if and only if they are ambiently isotopic.
1.1.10. Tubular neighbourhood.Let M ⊂ N be a diﬀerentiable sub-
manifold. Atubular neighbourhoodof M is an open subsetU ⊂ N with a
diﬀeomorphism νM → U sending identically the zero-section ontoM.
Theorem 1.1.11. Let M ⊂ N be a closed diﬀerentiable submanifold.
A tubular neighbourhood forM exists and is unique up to an isotopy ﬁxing
M and up to pre-composing with a bundle isomorphism ofνM.
If we are only interested in the open setU and not its parametrisation,
we can of course disregard the bundle isomorphisms ofνM.
Vector bundles are hence useful (among other things) to understand
neighbourhoods of submanifolds. Since we will be interested essentially in
manifolds of dimension at most 3, two simple cases will be important.
Proposition 1.1.12. A connected compact manifoldM has a unique
line bundle E → M up to isomorphism with orientable total spaceE.
The orientable line bundle onM is a productM × R precisely whenM
is also orientable. IfM is not orientable, the unique orientable line bundle
is indicated byM ×
∼
R.
Proposition 1.1.13. For everyn, there are exactly two vector bundles
of dimension n over S1 up to isomorphism, one of which is orientable.


## Page 21

1.1. DIFFERENTIAL TOPOLOGY 13
Again, the orientable vector bundle isS1 × Rn and the non-orientable
one is denoted byS1 ×
∼
Rn. These simple facts allow us to fully under-
stand the possible neighbourhoods of curves in surfaces, and of curves and
surfaces inside orientable 3-manifolds.
1.1.11. Manifolds with boundary. Let a diﬀerentiable manifold M
with boundary be a topological space with charts on a ﬁxed closed half-
space of Rn instead of Rn, forming a smooth atlas. (By deﬁnition, maps
from subsets ofRn are smooth if they locally admit extensions to smooth
functions deﬁned on open domains.)
The points corresponding to the boundary of the half-space form a
subset of M denoted by ∂M and called boundary. The boundary of a
n-manifold is naturally a(n − 1)-dimensional manifold without boundary.
The interior of M is M \ ∂M.
We can deﬁne the tangent spaceTpM at a pointp ∈ ∂M as the set
of all curves inM starting from or arriving top, with the same equivalence
relation as above. The space TpM is a vector space that contains the
hyperplane Tp∂M. Most of the notions introduced for manifolds extend
in an appropriate way to manifolds with boundary. Asubmanifold of a
manifold with boundaryM is the image of an embeddingN ↪→ M, where
N is another manifold with boundary.
The most important manifold with boundary is certainly thedisc
Dn =
{
x
⏐⏐ ∥x∥ ⩽ 1
}
⊂ Rn.
More generally, adisc in a n-manifold N is a submanifold D ⊂ N with
boundary diﬀeomorphic to Dn. Since a disc is in fact a (closed) tubu-
lar neighbourhood of any point in its interior, the uniqueness of tubular
neighbourhoods implies the following.
Theorem 1.1.14 (Cerf – Palais).Let N be a connected and oriented
smooth n-manifold. Two orientation-preserving embeddings f , g: Dn →
int(N) are ambiently isotopic.
A boundary component N of M is a connected component of∂M. A
collar for N is an open neighbourhood diﬀeomorphic toN × [0, 1). As for
tubular neighbourhoods, every compact boundary component has a collar,
unique up to isotopy.
A closed manifoldis a compact manifold without boundary.
1.1.12. Cut and paste.If M ⊂ N is a closed and orientable(n − 1)-
submanifold in the interior of an orientablen-manifold N, it has a tubular
neighbourhood diﬀeomorphic toM × R. The operation ofcutting N along
M consists of the removal of the portion M × (−1, 1). The resulting
manifold N′ has two new boundary componentsM × {−1} and M × {1},
both diﬀeomorphic toM. By the uniqueness of the tubular neighbourhood,
the manifoldN′ depends (up to diﬀeomorphisms) only on the isotopy class
of M ⊂ N.


## Page 22

14 1. PRELIMINARIES
M M'
M#M'
Figure 1.3. A connected sum of closed surfaces.
Let M and N be connected. The submanifold M is separating if its
complement consists of two connected components. The cut manifold has
two or one components depending on whetherM is separating or not.
Conversely, let M and N be two n-manifolds with boundary, and let
ϕ: ∂M → ∂N be a diﬀeomorphism. It is possible toglue M and N along
ϕ and obtain a newn-manifold as follows.
A naïve approach would consist in taking the topological spaceM ⊔ N
and identify p with ϕ(p) for all p ∈ ∂M. The resulting quotient space is
indeed a topological manifold, but the construction of a smooth atlas is
not immediate. A quicker method consists of taking two collars∂M ×[0, 1)
and ∂N × [0, 1) of the boundaries and then consider the topological space
(M \ ∂M ) ⊔ (N \ ∂N ).
Now we identify the points(p, t) and (ϕ(p), 1 − t) of the open collars,
for all p ∈ ∂M and all t ∈ (0, 1). Having now identiﬁed twoopen subsets
of M \ ∂M and N \ ∂N, a diﬀerentiable atlas for the new manifold is
immediately derived from the atlases ofM and N.
Proposition 1.1.15. The resulting smooth manifold depends (up to
diﬀeomorphism) only on the isotopy class ofϕ.
1.1.13. Connected sum. We introduce an important cut-and-paste
operation. The connected sumof two connected orientedn-manifolds M
and M′ is a newn-manifold obtained by choosing twon-discs D ⊂ int(M)
and D′ ⊂ int(M′)andanorientation-reversingdiﬀeomorphism ϕ: D → D′.
The new manifold is constructed in two steps: we ﬁrst remove the interiors
of D and D′ from M ⊔ M′, thus creating two new boundary components
∂D and ∂D′, and then glue these boundary components alongϕ|∂D. See
Figure 1.3.
We denote the resulting manifold byM#M′. Since ϕ is orientation-
reversing, the manifold M#M′ is oriented coherently with M and M′.
Theorem 1.1.14 implies the following.


## Page 23

1.2. RIEMANNIAN GEOMETRY 15
Proposition 1.1.16. The oriented smooth manifold M#M′ depends
(up to diﬀeomorphism) only onM and M′. The connected sum operation
# is commutative, associative, andSn serves as the identity element.
We can invert a connected sum as follows. Suppose an-manifold M
contains a separating(n −1)-sphere N ⊂ int(M). We ﬁx a diﬀeomorphism
ϕ: N → ∂D n. By cutting M along N we get two new boundary compo-
nents diﬀeomorphic toN and we glue two discs to them via the mapϕ.
We get two manifoldsN1, N2 such that M = N1#N2.
1.1.14. Transversality. Let f : M → N be a smooth map between
manifolds and X ⊂ N be a submanifold. We say thatf is transverse to X
if for anyp ∈ f−1X the following condition holds:
Im (dfp) + Tf (p)X = Tf (p)N.
The maps transverse to a ﬁxedX are generic, that is they form an open
dense subset in the space of all smooth maps fromX to Y, with respect
to an appropriate topology. In particular the following holds.
Theorem 1.1.17. Let f : M → N be a continuous map andd a dis-
tance on N compatible with the topology ofN. For every ε > 0 there is
a smooth mapg transverse toX, homotopic tof, with d(f (p), g(p)) < ε
for all p ∈ M.
1.2. Riemannian geometry
We brieﬂy introduce Riemannian manifolds and their geometric prop-
erties: distance, geodesics, volume, exponential map, injectivity radius,
completeness, curvature, and isometries. These notions are carefully ex-
plained in do Carmo’sRiemannian Geometry[16].
1.2.1. Metric tensor. A diﬀerentiable manifold lacks many natural
geometricnotions, suchasdistancebetweenpoints, anglebetweenvectors,
path lengths, geodesics, volumes, etc. It is a quite remarkable fact that the
introduction of a single additional mathematical entity suﬃces to recover
all these geometric notions: this miraculous object is the metric tensor.
A metric tensor for a diﬀerentiable manifold M is the datum of a
scalar product on each tangent spaceTpM of M, which varies smoothly
on p. More speciﬁcally, on a chart the scalar product may be expressed as
a matrix, and we require that its coeﬃcients vary smoothly onp.
Deﬁnition 1.2.1. A Riemannian manifold is a diﬀerentiable manifold
with a metric tensor that is positive deﬁnite at every point.
A Riemannian manifold is usually denoted as a pair(M, g), where M
is the manifold andg is the metric tensor.
Example 1.2.2. TheEuclidean spaceis Rn with the Euclidean metric
tensor g(x , y) = ∑n
i=1 xi yi at every tangent spaceTpRn = Rn.


## Page 24

16 1. PRELIMINARIES
Example1.2.3. Everydiﬀerentialsubmanifold N inaRiemannianman-
ifold M is also Riemannian: it suﬃces to restrict at everyp ∈ N the metric
tensor on TpM to the linear subspaceTpN.
In particular, thesphere
Sn =
{
x ∈ Rn+1 ⏐⏐ ∥x∥ = 1
}
is a submanifold ofRn+1 and is hence Riemannian.
The metric tensor g deﬁnes in particular a norm for every tangent
vector, and an angle between tangent vectors with the same basepoint.
The velocity γ′(t) of a curve γ : I → M at time t ∈ I now has a norm
∥γ′(t)∥ ⩾ 0 called speed, and two curves that meet at a point with non-
zero velocities form a well-deﬁned angle. Thelength of γ is deﬁned as
L(γ) =
∫
I
∥γ′(t)∥d t
and can be ﬁnite or inﬁnite. Areparametrisation of γ is the curveη : J →
M obtained asη = γ ◦ ϕ where ϕ: J → I is a diﬀeomorphism of intervals.
The length is invariant under reparametrisations, that isL(γ) = L(η).
1.2.2. Distance and geodesics.Let (M, g)be a connected Riemann-
ian manifold. The curves inM now have a length and hence may be used
to deﬁne a distance onM.
Deﬁnition 1.2.4. Thedistance d(p, q) between p, q ∈ M is
d(p, q) = inf
γ
L(γ)
where γ varies among all curvesγ : [0 , 1] → M with γ(0) = p, γ(1) = q.
The manifoldM equipped with the distanced is a metric space (com-
patible with the initial topology ofM).
Deﬁnition 1.2.5. Ageodesic is a curveγ : I → M with constant speed
k thatrealiseslocallythedistance. Thismeansthatevery t ∈ I hasaclosed
neighbourhood [t0, t1] ⊂ I with d(γ(t0), γ(t1)) = L(γ|[t0,t1]) = k(t1 − t0).
Note that with this deﬁnition the constant curveγ(t) = p0 is a geo-
desic with constant speedk = 0. Such a geodesic is calledtrivial. A curve
that realises the distance locally may not realise it globally.
Example 1.2.6. The non-trivial geodesics in Euclidean spaceRn are
aﬃne lines run at constant speed. The non-trivial geodesics in the sphere
Sn are portions of great circles, run at constant speed.
Ageodesic γ : I → M ismaximal ifitcannotbeextendedtoageodesic
on a strictly larger intervalJ ⊃ I. Maximal geodesics are determined by
some ﬁrst-order conditions:
Theorem 1.2.7.Let p ∈ M be a point andv ∈ TpM a tangent vector.
There exists a unique maximal geodesicγ : I → M with γ(0) = p and
γ′(0) = v. The intervalI is open and contains0.


## Page 25

1.2. RIEMANNIAN GEOMETRY 17
1.2.3. Volume. If the diﬀerentiable manifoldM is oriented, the met-
ric tensor also induces avolume form.
The best method to deﬁne volumes on an-manifold M is to construct
an appropriaten-form. A n-form ω is an alternating multilinear form
ωp : TpM × . . . × TpM  
n
− →R
at each point p ∈ M, which varies smoothly with p. The alternating
condition means that if we swap two vectors the result changes by a sign.
The n-forms are designed to be integrated: it makes sense to write
∫
D
ω
on any open setD. Avolume formon an oriented manifoldM is an-form
ω such thatωp(v1, . . . , vn) > 0 for every positive basisv1, . . . , vn of Tp and
every p ∈ M.
The metric tensor deﬁnes a volume form as follows: it suﬃces to set
ωp(e1, . . . , en) = 1 on every positive orthonormal basise1, . . . , en. With
this deﬁnition every open setD of M has a well-deﬁnedvolume
Vol(D) =
∫
D
ω
which is a positive number or inﬁnity. IfD has compact closure the volume
is necessarily ﬁnite; in particular, a compact Riemannian manifoldM has
ﬁnite volume Vol(M).
On a chart, the volume form can be calculated from the metric tensor
g via the following formula:
ω =
√
det g · d x1 · · · d xn.
1.2.4. Completeness. A Riemannian manifold(M, g) is also a metric
space, and as such it may be complete or not. For instance, a compact
Riemannian manifold is always complete; on the other hand, by remov-
ing a point from a Riemannian manifold we always get a non-complete
space. Non-compact manifolds likeRn typically admit both complete and
non-complete Riemannian structures. The completeness of a Riemannian
manifold may be expressed in various ways:
Theorem 1.2.8 (Hopf – Rinow).Let (M, g) be a connected Riemann-
ian manifold. The following are equivalent:
(1) M is complete,
(2) a subset ofM is compact if and only if it is closed and bounded,
(3) every geodesic can be extended on the wholeR.
If M is complete, any two points p, q ∈ M are joined by aminimising
geodesic γ, i.e. a curve such thatL(γ) = d(p, q).


## Page 26

18 1. PRELIMINARIES
1.2.5. Exponential map. Let M be a complete Riemannian manifold.
The fact that geodesics are determined by ﬁrst-order conditions allows us
to introduce the following.
Deﬁnition 1.2.9. Let p ∈ M be a point. Theexponential map
expp : TpM − →M
is deﬁned as follows. A vectorv ∈ TpM determines a maximal geodesic
γv : R → M with γv (0) = p and γ′
v (0) = v. We setexpp(v) = γv (1).
Theorem 1.2.10. The diﬀerential of the exponential mapexpp at the
origin is the identity and henceexpp is a local diﬀeomorphism at the origin.
Via the exponential map, a small neighborhood of the origin inTpM
can be used as a chart nearp: we recover here the intuitive idea that the
tangent space approximates the manifold nearp.
When M is not complete, the exponential map is only deﬁned in some
open star-shaped neighbourhood Vp ⊂ TpM of the origin, and Theorem
1.2.10 holds also in this case.
1.2.6. Injectivity radius.Let M be a complete Riemannian manifold.
We introduce the following.
Deﬁnition 1.2.11. The injectivity radius injpM > 0 of M at a point
p ∈ M isthesupremumofall r > 0suchthat expp |B0(r) isadiﬀeomorphism
onto its image.
Here B0(r ) is the open ball with centre0 and radius r in the tangent
space TpM. The injectivity radius is positive by Theorem 1.2.10. For every
r < injpM the exponential map transforms the ball of radiusr in Tp(M)
into the metric ball of radiusr in M. That is, the following equality holds:
expp(B0(r )) = Bp(r )
and the metric ballBp(r ) is indeed diﬀeomorphic to an open ball inRn.
When r ≥ injpM this may not be true: for instance ifM is compact there
is a R > 0 such that Bp(R) = M.
The injectivity radiusinjp(M) varies continuously with respect top ∈
M; the injectivity radiusinj(M) of M is deﬁned as
inj(M) = inf
p∈M
injpM.
Proposition 1.2.12. A compact Riemannian manifold has positive in-
jectivity radius.
Proof. The injectivity radiusinjpM is positive and varies continuously
with p, hence it has a positive minimum on the compactM. □
Finally we note the following. Aloop is a curveγ : [ a, b] → M with
γ(a) = γ(b).


## Page 27

1.2. RIEMANNIAN GEOMETRY 19
Proposition1.2.13. Let M beacompleteRiemannianmanifold. Every
loop γ in M shorter than2 · inj(M) is homotopically trivial.
Proof. Set p = γ(a) = γ(b). Since γ is shorter than 2 · inj(M), it
cannot escape the ballBp(r ) for some r < inj(M) ⩽ injpM. This ball is
diﬀeomorphic to a ball inRn, hence in particular it is contractible, soγ is
homotopically trivial. □
A proof of the continuity ofinjp(M) can be found in [35].
1.2.7. Curvature. The curvature of a Riemannian manifold(M, g) is
somemathematicalentitythatmeasureshowdistorted g iswhencompared
to the familiar Euclidean structure onRn. The curvature is encoded by
various kinds of mathematical objects, and some of them may be frustrat-
ingly complicated whenn = dim M ⩾ 3. Luckily, most of the Riemannian
manifolds that we will encounter in this book have “constant curvature”
and these objects will simplify dramatically. We brieﬂy recall them here.
The metric tensorg induces theLevi-Civita connection ∇, which can
be used to diﬀerentiate any vector ﬁeld with respect to a tangent vector
at any point ofM. We concentrate on an open chart and suppose that
M = U is an open set ofRn; let e1, . . . , en be the coordinate vector ﬁelds
on U and ∇i be the Levi-Civita diﬀerentiation with respect toei. We have
∇i ej = Γk
i jek
for some smooth functionsΓk
i j : U → R called theChistoﬀel symbols. Here
we use the Einstein notation: repeated indices should be added from1 to
n. The Christoﬀel symbols are determined byg via the formula:
Γk
i j = 1
2 gkℓ
(∂gℓi
∂x j + ∂gℓj
∂x i − ∂gi j
∂x ℓ
)
.
Here gkℓ is just the inverse matrix ofg = gkℓ. Christoﬀel symbols are very
useful but depend heavily on the chosen chart; a more intrinsic object is
the Riemann tensorthat may be deﬁned (quite obscurely) as
Ri
j kℓ = ∂kΓi
ℓj − ∂ℓΓi
kj + Γi
km Γm
ℓj − Γi
ℓmΓm
kj .
By contracting two indices we get theRicci tensor
Ri j = Rk
i kj = ∂kΓk
j i − ∂j Γk
ki + Γk
km Γm
j i − Γk
j mΓm
ki .
The Ricci tensor is symmetric, and by further contracting we get thescalar
curvature
R = gi jRi j.


## Page 28

20 1. PRELIMINARIES
Figure 1.4. Three surfaces in space (hyperboloid with one
sheet, cylinder, sphere) whose gaussian curvature is respec-
tively negative, null, and positive at each point. The curva-
ture on the sphere is constant, while the curvature on the
hyperboloid varies: a complete surface in R3 cannot have
constant negative curvature.
1.2.8. Scalar curvature. What kind of geometric information is con-
tained in the tensors introduced above? The scalar curvature R is the
simplest curvature detector, and it measures the local discrepancy between
volumes in M and in Rn. Let Bp(ε) ⊂ M be the ε-ball in M centred at p
and B0(ε) ⊂ Rn be the ε-ball in the EuclideanRn. We have
Vol
(
Bp(ε)
)
= Vol
(
B0(ε)
)
·
(
1 − R
6(n + 2) ε2
)
+ O(ε4).
We note in particular thatR is positive (negative) if Bp(ε) has smaller
(bigger) volume than the usual Euclidean volume.
If M has dimension 2, that is it is a surface, the Riemann and Ricci
tensors simplify dramatically and are fully determined by the scalar curva-
ture R, which is in turn equal to twice thegaussian curvature K: if M is
contained inR3 the gaussian curvature is deﬁned as the product of its two
principal curvatures, but whenM is abstract principal curvatures make no
sense. On surfaces, the formula above reads as
Area(Bp(ε)) = πε2 − πε4
12 K + O(ε4).
1.2.9. Sectional curvature. If (M, g) has dimensionn ⩾ 3 the scalar
curvature is a weak curvature detector when compared to the Ricci and
Riemann tensors. Moreover, there is yet another curvature detector which
encodes the same amount of information of the full Riemann tensor, but
in a more geometric way: this is thesectional curvature.
Deﬁnition 1.2.14. Let (M, g) be a Riemannian manifold. Letp ∈ M
beapointand W ⊂ TpM bea2-dimensionalvectorsubspace. ByTheorem


## Page 29

1.2. RIEMANNIAN GEOMETRY 21
1.2.10 there exists an open neighbourhoodUp ⊂ TpM of the origin where
expp is a diﬀeomorphism onto its image. In particularS = exp p(Up ∩ W )
is a smooth surface inM passing through p, with tangent planeW. As a
submanifold of M, the surfaceS inherits a Riemannian structure fromg.
The sectional curvatureof (M, g) along W is deﬁned as the gaussian
curvature of S in p.
We can use the sectional curvature to unveil the geometric nature of
the Ricci tensor: the Ricci tensorRi j in p measures the average sectional
curvature along axes, that is for every unit vectorv ∈ Tp(M) the number
Ri jv i v j is (n − 1) times the average sectional curvature of the planes
W ⊂ Tp(M) containing v.
The Riemann tensor is determined by the sectional curvatures and
vice-versa. In dimension n = 3 the Ricci tensor fully determines the sec-
tional curvatures and hence also the Riemann tensor. This is not true in
dimension n ⩾ 4.
1.2.10. Constantsectionalcurvature. ARiemannianmanifold (M, g)
has constant sectional curvature K if the sectional curvature of every 2-
dimensional vector spaceW ⊂ TpM at every pointp ∈ M is alwaysK.
Remark 1.2.15. On a Riemannian manifold(M, g) one may rescale
the metric by some factorλ > 0 substituting g with the tensor λg. At
every point the scalar product is rescaled byλ. Consequently, lengths of
curves are rescaled by
√
λ and volumes are rescaled byλ
n
2. The sectional
curvature is rescaled by1/λ.
By rescaling the metric we may transform every Riemannian mani-
fold with constant sectional curvatureK into one with constant sectional
curvature −1, 0, or1.
Example 1.2.16. Euclidean spaceRn has constant curvature zero. A
sphere of radiusR has constant curvature1/R2.
1.2.11. Isometries. Every honest category has its morphisms. Rie-
mannian manifolds are so rigid, that in fact one typically introduces only
isomorphisms: these are calledisometries.
Deﬁnition 1.2.17. A diﬀeomorphism f : M → N between two Rie-
mannian manifolds (M, g) and (N, h) is an isometry if it preserves the
scalar product. That is, the equality
⟨v , w⟩ = ⟨dfp(v), dfp(w )⟩
holds for allp ∈ M and every pair of vectorsv , w ∈ TpM. The symbols
⟨, ⟩ indicate the scalar products inTpM and Tf (p)N.
As we said, isometries are extremely rigid. These are determined by
their ﬁrst-order behaviour at any single point.


## Page 30

22 1. PRELIMINARIES
Theorem 1.2.18. Let f , g: M → N be two isometries between two
connected Riemannian manifolds. If there is a point p ∈ M such that
f (p) = g(p) and dfp = d gp, then f = g everywhere.
Proof. Let us show that the subsetS ⊂ M of the pointsp such that
f (p) = g(p) and dfp = d gp is open and closed.
The locus where two functions coincide is typically closed, and this
holds also here (to prove it, take a chart). We prove that it is open: pick
p ∈ S. By Theorem 1.2.10 there is an open neighbourhoodUp ⊂ TpM of
the origin where the exponential map is a diﬀeomorphism onto its image.
We show that the open setexpp(Up) is entirely contained inS.
A point q ∈ expp(Up) is the image q = exp( v) of a vector v ∈ Up
and hence q = γ(1) for the geodesic γ determined by the dataγ(0) =
p, γ′(0) = v. The maps f and g are isometries and hence send geodesics
to geodesics: heref ◦ γ and g ◦ γ are geodesics starting fromf (p) = g(p)
with the same initial velocities and thus they coincide. This implies that
f (q) = g(q). Since f and g coincide on the open setexpp(Up), also their
diﬀerentials do. □
1.2.12. Local isometries. A local isometry f : M → N between Rie-
mannianmanifoldsisamapwhereevery p ∈ M hasanopenneighbourhood
U such that f |U is an isometry onto its image. Theorem 1.2.18 applies
with the same proof to local isometries.
The following proposition relates nicely the notions of local isometry,
topological covering, and completeness.
Proposition 1.2.19. Let f : M → N be a local isometry.
(1) If M is complete, the mapf is a covering.
(2) If f is a covering, thenM is complete ⇐ ⇒N is complete.
Proof. Since f is a local isometry, every geodesic inM projects to a
geodesic in N. If f is also a covering, the converse holds: every geodesic
in N lifts to a geodesic inM (at any starting point).
If f is a covering we can thus project and lift geodesics viaf: therefore
every geodesic inM can be extended toR if and only if every geodesic in
N can; this proves (2) using the Hopf – Rinow Theorem 1.2.8.
We prove (1) by showing that the ballB = B(p, injpN) is well-covered
for all p ∈ N. Since M is complete, every geodesic inN can be lifted to
a geodesic inM (at any starting point). For every˜p ∈ f−1(p) the map f
sends the geodesics exiting from˜p to geodesics exiting fromp and hence
sends isometrically B(˜p, injpN) onto B. On the other hand, given a point
q ∈ f−1(B), the geodesic inB connecting f (q) to p lifts to a geodesic
connecting q to some point˜p ∈ f−1(p). Therefore
f−1(
B(p, injpN)
)
=
⨆
˜p∈f−1(p)
B(˜p, injpN)
and f is a covering. □


## Page 31

1.3. MEASURE THEORY 23
Proposition 1.2.20.Let f : M → N be a local isometry and a degree-d
covering. We have
Vol(M) = d · Vol(N).
Sketch of the proof. We may ﬁnd a disjoint union of well-covered
open sets in N whose complement has zero measure. Every such open
set lifts tod copies of it inM, and the zero-measure set lifts to a zero-
measure set. □
The formula makes sense also when some of the quantitiesVol(M),
Vol(N), and d are inﬁnite.
1.2.13. Totally geodesic submanifolds.A diﬀerentiable submanifold
M in a Riemannian manifoldN is totally geodesic if every geodesic inM
with the induced metric is also a geodesic inN.
When dim M = 1 thisnotionisequivalenttothatofanunparametrized
embeddedgeodesic; if dim M ⩾ 2then M isaquitepeculiarobject: generic
Riemannian manifolds do not contain totally geodesic surfaces at all. An
equivalent condition is that, for everyp ∈ M and every v ∈ Tp(M), the
unique geodesic inN passing throughp with velocityv stays inM for some
interval (−ε, ε).
1.2.14. Riemannian manifolds with boundary.Many geometric no-
tions in Riemannian geometry extend easily to manifoldsM with boundary.
The boundary ∂M of a Riemannian manifoldM is naturally a Riemannian
manifold without boundary. A particularly nice (and exceptional) case is
when ∂M is totally geodesic.
1.3. Measure theory
We will use some basic measure theory only in Chapter 8.
1.3.1. Borel measure. A Borel set in a topological spaceX is any
subset obtained from open sets through the operations of countable union,
countable intersection, and relative complement. LetF denote the set of
all Borel sets. ABorel measureon X is a functionµ: F → [0, +∞] which
is additive on any countable collection of disjoint sets.
The measure islocally ﬁnite if every point has a neighbourhood of
ﬁnite measure and istrivial if µ(S) = 0 for all S ∈ F.
Exercise 1.3.1. Ifµ is a locally ﬁnite Borel measure thenµ(X) < +∞
for any compact Borel setK ⊂ X.
Example 1.3.2. Let D ⊂ X be a discrete set. TheDirac measure δD
concentrated in D is the measure
δD(S) = #( S ∩ D).
Since D is discrete, the measureδD is locally ﬁnite.


## Page 32

24 1. PRELIMINARIES
The support of a measure is the set of all pointsx ∈ X such that
µ(U) > 0 for any open setU containing x. The support is a closed subset
of X. The measure isfully supportedif its support isX. The support of
δD is of courseD. A pointx ∈ X is anatom for µ if µ({x}) > 0.
1.3.2. Construction by local data.A measure can be deﬁned using
local data in the following way.
Proposition 1.3.3. Let {Ui }i∈I be a countable, locally ﬁnite open cov-
ering of X and for any i ∈ I let µi be a locally ﬁnite Borel measure on
Ui. If µi |Ui∩Uj = µj |Ui∩Uj for all i , j ∈ I there is a unique locally ﬁnite Borel
measure µ on X whose restriction toUi is µi for all i.
Proof. For every ﬁnite subsetJ ⊂ I we deﬁne
XJ =
(
∩j∈J Uj
)
\
(
∪i∈I\J Ui
)
.
The sets XJ form a countable partition ofX into Borel sets and everyXJ
is equipped with a measureµJ = µj |Xj for any j ∈ J. Deﬁne µ by setting
µ(S) =
∑
j∈J
µ(S ∩ Xj )
on any BorelS ⊂ X. □
When X is a reasonable space some hypothesis may be dropped.
Proposition 1.3.4. If X is paracompact and separable, Proposition
1.3.3 holds for any open covering{Ui }i∈I.
Proof. By paracompactness and separability the open covering{Ui }
has a reﬁnement that is locally ﬁnite and countable: apply Proposition
1.3.3tothereﬁnementtogetameasure µ. Toprovethatindeed µ|Ui = µi
applyProposition1.3.3againtothecoveringof Ui givenbythereﬁnement.
□
1.3.3. Topology on the measures space.In what follows we suppose
for simplicity thatX is a ﬁnite-dimensional topological manifold, although
everything is valid in a much wider generality. We indicate byM (X) the
space of all locally ﬁnite Borel measures onX and by Cc(X) the space of
all continuous functionsX → R with compact support: the spaceCc(X)
is not a Banach space, but it is a topological vector space.
Recall that thetopological dualof a topological vector spaceV is the
vector space V∗ formed by all continuous linear functionalsV → R. A
measure µ ∈ M (X) acts like a continuous functional onCc(X) as follows
µ: f ↦− →
∫
µ
f
and hence deﬁnes an element ofC∗
c (X). A functional inC∗
c (X) is positive
if it assumes non-negative values on non-negative functions.


## Page 33

1.4. GROUPS 25
Theorem1.3.5(Rieszrepresentation). Thespace M (X)maybeiden-
tiﬁed in this way to the subset inCc(X)∗ of all positive functionals.
The spaceM (X)in Cc(X)∗ is closed with respect to sum and product
with a positive scalar. We now use the embedding ofM (X) into Cc(X)∗
to deﬁne a natural topology onM (X).
Deﬁnition 1.3.6. Let V be a real topological vector space. Every
vector v ∈ V deﬁnes a functional inV∗ as f ↦→ f (v). Theweak-* topology
on V∗ is the weakest topology among those where these functionals are
continuous.
We give Cc(X)∗, and henceM (X), the weak-* topology.
1.3.4. Sequences of measures. By deﬁnition, a sequence of mea-
sures µi converges toµ if and only if
∫
µi
f →
∫
µ f for anyf ∈ Cc(X). This
type of weak convergence is usually denoted with the symbolµi ⇀ µ.
Exercise1.3.7. Let xi beasequenceofpointsin X thattendto x ∈ X:
we get δxi ⇀ δ x.
It is important to note thatµi ⇀ µ does not imply µi (U) → µ(U) for
any open (or closed) setU: consider for instance a sequenceµi = δxi with
xi exiting from (or entering into) the setU. We can get this convergence
on compact sets if we can control their topological boundary.
Proposition 1.3.8. Let K ⊂ X be a Borel compact subset. Ifµi ⇀ µ
and µ(∂K ) = 0 then µi (K) → µ(K).
On Banach spaces, the unitary ball is compact in the weak-* topology.
Here M (X)isnotaBanachspace, butwehaveananalogouscompactness
theorem.
Theorem1.3.9. Asequenceofmeasures µi suchthat µi (K)isbounded
on every Borel compact setK ⊂ X converges on a subsequence.
1.4. Groups
We recall some basic deﬁnitions and properties of groups.
1.4.1. Presentations. Recall that aﬁnite presentationof a groupG
is a description ofG as
⟨g1, . . . , gk | r1, . . . , rs ⟩
where g1, . . . , gk ∈ G are thegenerators and r1, . . . , rs are words ing±1
i
called relations, such that
G ∼= F (gi )/N(rj )
where F (gi ) is the free group generated by thegi’s andN(rj ) ◁ F(gi ) is the
normal closureof the rj’s, the smallest normal subgroup containing them.
Not every group G has a ﬁnite presentation: a necessary (but not
suﬃcient) condition is thatG must be ﬁnitely generated.


## Page 34

26 1. PRELIMINARIES
1.4.2. Commutators. Let G be a group. The commutator of two
elements h, k ∈ G is the element
[h, k] = hkh−1k−1.
The commutator[h, k] is trivial if and only ifh and k commute. Commu-
tators do not form a subgroup in general, but we can use them to generate
one.
More generally, let H, K < G be two subgroups. We deﬁne [H, K]
as the subgroup of G generated by all commutators[h, k] where h and
k vary in H and K, respectively. Every element in[H, K] is a product of
commutators [h, k] and of their inverses [h, k]−1 = [ k, h], and we have
[H, K] = [ K, H].
Proposition1.4.1. If Hand K arenormalsubgroupsof G then [H, K] <
H ∩ K and [H, K] is a normal subgroup ofG.
Proof. If H and K are normal we get[h, k] = hkh−1k−1 ∈ H ∩ K.
Moreover, for everyg ∈ G we have
g−1 · [h1, k1]±1 · · ·[hi , ki ]±1 · g = [g−1h1g, g−1k1g]±1 · · ·[g−1hi g, g−1ki g]±1
hence [H, K] is normal inG if H and K are. □
The group[G, G] is thecommutator subgroupof G. It is trivial if and
only if G is abelian.
1.4.3. Series. We can use commutators iteratively to create some
characteristic subgroups ofG. There are two natural ways to do this, and
they produce two nested sequences of subgroups.
The lower central seriesof G is the sequence of normal subgroups
G = G0 > G 1 > . . . > G n > . . .
deﬁned iteratively by setting
Gn+1 = [Gn, G].
The derived seriesis the sequence of normal subgroups
G = G(0) ⊿ G (1) ⊿ . . . ⊿ G (n) ⊿ . . .
deﬁned by setting
G(n+1) = [G(n), G(n)].
We clearly haveG(n) < G n for all n.
Deﬁnition 1.4.2. A groupG is nilpotent if Gn is trivial for somen. It
is solvable if G(n) is trivial for somen.
The following implications are obvious:
G abelian =⇒ G nilpotent =⇒ G solvable.
The converses are false, as we will see.


## Page 35

1.4. GROUPS 27
Proposition 1.4.3. Subgroups and quotients of abelian (nilpotent,
solvable) groups are also abelian (nilpotent, solvable).
Proof. If H < G then Hn < G n and H(n) < G (n). If H = G/N, then
Hn = Gn/N and H(n) = G(n)/N. This is proved by induction onn. □
1.4.4. Nilpotentgroups. Everyabeliangroup G isobviouslynilpotent
since G1 is trivial.
Exercise 1.4.4. Let theHeisenberg group Nil consist of all matrices


1 x z
0 1 y
0 0 1


where x , y ,and z vary inR, with the multiplication operation. Prove that
the Heisenberg group is non-abelian and nilpotent. Indeed the matrices
with x = y = 0 form an abelian subgroupR < Nil and we have
[Nil, Nil] = R, [R, Nil] = {e}.
We will use at some point the following criterion.
Proposition 1.4.5. Let G be a group generated by some setS and
n > 0 a number. Suppose that
[a1, . . .[an−1, [an, b]] · · ·]
is trivial for alla1, . . . , an, b ∈ S. Then Gn = {e} and thus G is nilpotent.
Proof. We claim thatGn is generated by some elements of type
[a1, . . .[am−1, [am, b]] · · ·]
with m ⩾ n and a1, . . . , am, b ∈ S: this clearly implies the proposition.
The claim is proved by induction onn using the formula
[a, bc] = [ a, b] · [b, [a, c]] · [a, c]
which holds in every group. □
We note the following.
Proposition 1.4.6.A nilpotent non-trivial group has non-trivial centre.
Proof. Let Gn be the last non-trivial group in the lower central series.
Since Gn+1 = [Gn, G] is trivial, the centre ofG contains Gn. □


## Page 36

28 1. PRELIMINARIES
1.4.5. Solvable groups. Solvable groups form a strictly larger class
than nilpotent groups.
Exercise 1.4.7. The permutation groupS3 is solvable but not nilpo-
tent.
Exercise 1.4.8. The groupAﬀ(R) = {x ↦→ ax + b | a ∈ R∗, b ∈ R} of
aﬃne transformations is solvable but not nilpotent. Indeed the subgroup
[Aﬀ(R), Aﬀ(R)] = R consists of all translations and
[R, Aﬀ(R)] = R, [R, R] = {e}.
Exercise 1.4.9. The permutation groupSn is not solvable forn ⩾ 5.
The latter fact is related to the existence of polynomials of degree
n ⩾ 5 that are not solvable by radicals.
Solvable groups are farther from being abelian than nilpotent groups:
for instance, they may have trivial centre (likeS3). However, they still
share some nice properties with the abelian world:
Proposition 1.4.10. A solvable group contains a non-trivial normal
abelian subgroup.
Proof. Let G(n) be the last non-trivial group in the derived series. It
is normal inG and abelian, since[G(n), G(n)] is trivial. □
1.4.6. Lie groups. A Lie groupis a smooth manifoldG which is also
a group, such that the operations
G × G → G, (a, b) ↦→ ab
G → G, a ↦→ a−1
are smooth.
Example 1.4.11. The basic examples areGL(n, R) and GL(n, C) con-
sisting of invertible real and complexn ×n matrices, with the multiplication
operation. These contain many interesting Lie subgroups:
• SL(n, R) and SL(n, C), the matrices with determinant 1;
• O(n) and U(n), the orthogonal and unitary matrices;
• SO(n) = SL( n, R) ∩ O(n) and SU(n) = SL( n, C) ∩ U(n).
The Lie groupsO(n) and U(n) are compact.
Exercise 1.4.12. The following Lie groups are isomorphic:
S1 ∼= U(1) ∼= SO(2).
Here are some ways to construct more examples:
• the product of two Lie groups is a Lie group,
• a closed subgroup of a Lie group is a Lie group,
• the universal cover of a Lie group is a Lie group.


## Page 37

1.4. GROUPS 29
A Lie group G is often not connected, and we denote by G◦ the
connected component of G containing the identity. The subset G◦ is a
normal Lie subgroup ofG. For instance O(n) has two components and
O(n)◦ = SO(n).
Another important example is the Lie group
O(m, n) =
{
A ∈ GL(m + n, R)
⏐⏐ tAIm,nA = Im,n
}
deﬁned for any pairm, n ⩾ 0 of integers, whereIm,n is the diagonal matrix
Im,n =
(Im 0
0 −In
)
.
The Lie groupO(m, n) has two connected components if eitherm or n is
zero(inthatcasewerecovertheorthogonalgroup)andhasfourconnected
components otherwise.
Remark 1.4.13. Not all the Lie groups are subgroups ofGL(n, C): for
instance, the universal cover ofSL(2, R) is not.
A homomorphism ϕ: G → H of Lie groups is a smooth group homo-
morphism. The kernel ofϕ is a closed subgroup and hence a Lie subgroup
of G. An isomorphism of Lie groups is a group isomorphism that is also a
diﬀeomorphism.
1.4.7. Vector ﬁelds, metrics, and diﬀerential forms.A Lie groupG
acts on itself in two ways: by left and right multiplication. Both actions
are smooth, free, and transitive.
A geometric object onG is left-invariant if it is invariant by left mul-
tiplication. Right-invariance is deﬁned analogously. In general, it is easy
to ﬁnd objects that are either left- or right-invariant, but not necessarily
both.
There is a natural 1-1 correspondence between:
• vectors in Te G and left-invariant vector ﬁelds onG,
• scalar products onTe G and left-invariant Riemannian metrics on
G,
• n-forms on Te G and left-invariant n-forms on G,
• orientations on Te G and left-invariant orientations onG.
This holds because left-multiplication by an elementg ∈ G is a diﬀeo-
morphism that transports everything fromTe G to TgG. The same holds
for right-invariant objects.
Every basis ofTe G extends in this way ton independent left-invariant
vector ﬁelds: this shows thatG is parallelizable, i.e. the tangent bundle of
G is trivial.
1.4.8. Simple Lie groups.A simple Lie groupG is a connected, non-
abelian Lie groupG that does not contain any non-trivial connected normal
subgroup (the trivial cases being of course{e} and G itself).


## Page 38

30 1. PRELIMINARIES
The classiﬁcation of simple Lie groups is due to E. Cartan. The
following theorem furnishes many examples.
Theorem 1.4.14.The groupsO(m, n)◦ are all simple whenm +n ⩾ 3,
except the cases(m, n) = (4 , 0), (2, 2), (0, 4).
1.4.9. Haar measures. Let G be a Lie group. As we just said, non-
vanishing left-invariant n-forms ω on G are in 1-1 correspondence with
non-trivial n-forms on Te G, and since the latter are all proportional, the
form ω is unique up to multiplication by a non-zero scalar.
The form ω deﬁnes a left-invariant orientation (a basisv1, . . . , vn is
positive when ω(v1, . . . , vn) > 0); it is a volume form and hence deﬁnes a
left-invariant locally ﬁnite Borel measure onG, called theHaar measureof
G. Summing up, the Haar measure depends only onG up to rescaling.
Since left- and right-multiplications commute, right-multiplication by
an element g ∈ G transforms ω into another non-vanishing left-invariant
form which must be equal toλ(g)ω for some positive real numberλ(g).
This deﬁnes a Lie group homomorphismλ: G → R>0 to the multiplicative
group of positive real numbers, called themodular function.
The Lie groupG is unimodular if the left-invariant Haar measures are
also right-invariant, that is if the modular functionλ is trivial. Recall that
a group G is simple if its normal subgroups are{e} and G.
Proposition 1.4.15. Compact, abelian, and simple Lie groups are uni-
modular.
Proof. If G is compact, the image ofλ is compact inR>0 and hence
trivial. If G is abelian, left- and right-multiplications coincide. If G is
simple, the connected normal Lie subgroup(ker λ)◦ must be G. □
Corollary 1.4.16.The groupO(m, n)is unimodular if(m, n)is distinct
from (4, 0), (2, 2), (0, 4).
Proof. The identity componentO(m, n)◦ is simple and hence unimod-
ular. The modular functionλ: O( m, n) → R is trivial on the ﬁnite-index
subgroup O(m, n)◦ and is hence trivial. □
Remark1.4.17. When (m, n) = (4 , 0), (2, 2), (0, 4)thegroup O(m, n)
is semisimple, which means that it looks roughly like a product of simple
groups, and is in fact unimodular also in this case. We will not need to
introduce this concept rigorously here.
The solvable Lie groupAﬀ(R) is not unimodular.
1.4.10. Discrete subgroups. Let G be a Lie group. A closed sub-
group H < G is discrete if it forms a discrete topological subset, that is if
every point inH is isolated.
Exercise 1.4.18. A subgroupH < G is discrete if and only ife ∈ G is
an isolated point inG.


## Page 39

1.4. GROUPS 31
1.4.11. TheSelbergLemma. Thegroup GL(n, C)istheprototypical
Lie group, since it contains many Lie groups. A couple of purely algebraic
facts about this group will have some important geometric consequences
in this book. The ﬁrst is the Selberg Lemma. Recall that a grouphas no
torsion if every non-trivial element in it has inﬁnite order.
Lemma 1.4.19 (Selberg’s Lemma).Every ﬁnitely generated subgroup
G < GL(n, C) has a ﬁnite-index normal subgroupH ◁ G without torsion.
The second fact is quite related. A groupG is residually ﬁniteif one
of the following equivalent conditions holds:
• for every non-trivial elementg ∈ G there is a ﬁnite groupF and
a surjective homomorphismϕ: G → F with ϕ(g) ̸= e;
• for every non-trivial elementg ∈ G there is a ﬁnite-index normal
subgroup H ◁ G which does not containg;
• theintersectionofallﬁnite-indexnormalsubgroupsin G istrivial.
Lemma1.4.20. Everyﬁnitelygeneratedsubgroupof GL(n, C)isresid-
ually ﬁnite.
Theproofofthesetwolemmasisnotparticularlyhard(seeforinstance
[49, Chapter 7.6]) but it employs some purely algebraic techniques that
are distant from the scope of this book. Their geometric consequences,
as we will see, are quite remarkable.
1.4.12. Lie algebras. A Lie algebra g is a real vector space equipped
with an alternate bilinear product
[, ] : g × g → g
called Lie bracketthat satisﬁes the Jacobi identity
[x ,[y , z]] + [y ,[z , x]] + [z ,[x , y]] = 0
for all x , y , z ∈ g.
The tangent spaceTe G at e ∈ G of a Lie groupG has a natural Lie
algebra structure and is denoted byg. It is equipped with a naturalexpo-
nential map exp : g → G that sends 0 to e and is a local diﬀeomorphism
at 0.
The diﬀerentiald ϕe : g → h of a Lie group homomorphismϕ: G → H
is a Lie algebra homomorphism and is denoted byϕ∗. The diagram
g
ϕ∗ →→
exp
↓↓
h
exp
↓↓
G ϕ
→→ H
commutes. The basic example is the following: the Lie algebragl(n, C)
of GL(n, C) is the vector spaceM(n, C) of all n × n matrices; here the
map exp is the usual matrix exponential and[A, B] = AB − BA is the


## Page 40

32 1. PRELIMINARIES
usual commutator bracket. The Lie algebras ofGL(n, R), SL(n, R), O(n),
SO(n) are:
gl(n, R) = M(n, R),
sl(n, R) = {A ∈ M(n, R) | trA = 0},
o(n) = {A ∈ M(n, R) | A + tA = 0},
so(n) = {A ∈ M(n, R) | A + tA = 0, trA = 0}.
Proposition 1.4.21. Let G and H be connected. A Lie group ho-
momorphism ϕ: G → H is a topological covering if and only ifϕ∗ is an
isomorphism.
1.5. Group actions
Groups acting of spaces are so important in geometry, that they are
sometimes used as a deﬁnition of “geometry” itself.
1.5.1. Deﬁnitions. The action of a groupG on a topological space
X is a homomorphism
G → Homeo(X)
where Homeo(X) is the group of all self-homeomorphisms of X. The
quotient set X/G is the set of all orbits inX and we give it the usual
quotient topology. We denote by g(x) the image of x ∈ X along the
homeomorphism determined byg ∈ G. The action is:
• free if g(x) ̸= x for all non-trivialg ∈ G and all x ∈ X;
• properly discontinuous if any two pointsx , y ∈ X have neigh-
bourhoods Ux and Uy such that the set
{
g ∈ G
⏐⏐ g(Ux ) ∩ Uy ̸= ∅
}
is ﬁnite.
The relevance of these deﬁnitions is due to the following.
Proposition 1.5.1.Let G act on a Hausdorﬀ connected spaceX. The
following are equivalent:
(1) G acts freely and properly discontinuously;
(2) the quotient X/G is Hausdorﬀ andX → X/G is a covering.
A covering of typeX → X/G is calledregular. A covering X → Y is
regular if and only if the image ofπ1(X) in π1(Y ) is normal, and in that
case G is the quotient of the two groups. In particular every universal cover
is regular. Summing up:
Corollary 1.5.2. Every path-connected locally contractible Hausdorﬀ
topological spaceX is the quotient˜X/ G of its universal cover by the action
of some groupG acting freely and properly discontinuously.
The group G is isomorphic toπ1(X).


## Page 41

1.5. GROUP ACTIONS 33
Exercise 1.5.3. Let a discrete groupG act on a locally compact space
X. The following are equivalent:
• the action is properly discontinuous;
• for every compactK ⊂ X, the set
{
g | g(K) ∩ K ̸= ∅
}
is ﬁnite;
• the mapG ×X → X ×X that sends(g, x ) to (g(x), x) is proper.
1.5.2. Isometry group. We now want to consider the case where a
group G acts by isometries on a Riemannian manifoldM. In this case we
have a homomorphism
G → Isom(M)
withvaluesinthe isometrygroup Isom(M)of M,i.e.thegroupofallisome-
tries f : M → M. The groupIsom(M) is much smaller thanHomeo(M).
Theorem1.5.4(Myers–Steenrod). Thegroup Isom(M)hasanatural
Lie group structure compatible with the compact-open topology. The map
F : Isom( M) × M → M × M that sends (ϕ, p) to (ϕ(p), p) is proper.
Corollary 1.5.5. If M is compact thenIsom(M) is compact.
Proposition 1.5.6.The stabilizer of any pointx ∈ M is a compact Lie
subgroup of Isom(M).
Proof. The stabilizer of x is closed and hence is a Lie subgroup of
Isom(M). The isometries that ﬁx x are determined by their orthogonal
action on Tx M and therefore form a compact Lie subgroup ofO(n). □
The hard part of the Myers – Steenrod Theorem is to endowIsom(M)
with a Lie group structure. In fact, in all the concrete cases that we will
encounter, the Lie group structure ofIsom(M) will be evident from the
context, so we will not need the full strength of Theorem 1.5.4. The rest
of the theorem is not diﬃcult to prove and we can leave it as an exercise.
Exercise 1.5.7. Prove thatF is proper.
We denote byIsom+(M) the subgroup of Isom(M) consisting of all
the orientation-preserving isometries. It has index one or two inIsom(M).
1.5.3. Discretegroups. Let M beaRiemannianmanifold. Thegroup
Isom(M) is a Lie group, so it makes sense to consider discrete subgroups.
Proposition 1.5.8. A group Γ < Isom(M) acts properly discontinu-
ously on M if and only if it is discrete.
Proof. If Γ is discrete, Theorem 1.5.4 and Exercise 1.5.3 imply that it
actsproperlydiscontinuously. Conversely, if Γactsproperlydiscontinuously
then e ∈ Γ is easily seen to be isolated, and we apply Exercise 1.4.18.□
If Γ < Isom(M) is discrete and acts freely, the mapM → M/Γ is a
covering. Moreover, the Riemannian structure projects fromM to M/Γ.


## Page 42

34 1. PRELIMINARIES
Proposition 1.5.9. Let Γ < Isom(M) act freely and properly discon-
tinuously on M. There is a unique Riemannian structure on the manifold
M/Γ such that the coveringπ : M → M/Γ is a local isometry.
Proof. Let U ⊂ M/Γ be a well-covered set: we haveπ−1(U) = ⊔i∈I Ui
and π|Ui : Ui → U is a homeomorphism. Pick ani ∈ I and assign toU the
smooth and Riemannian structure ofUi transported alongπ. The resulting
structure on U does not depend oni since the open setsUi are related by
isometries in Γ. We get a Riemannian structure onM/Γ, determined by
the fact thatπ is a local isometry. □
1.5.4. Measures. The case where a groupG acts by preserving some
measure instead of a Riemannian metric is also very interesting, although
quite diﬀerent. This situation will occur only in Chapter 8.
Let a group G act on a manifold M. A Borel measure µ on M is
G-invariant if µ(S) = µ(g(S)) for every Borel setS ⊂ M.
If G acts on M freely and properly discontinuously, thenM → M/G is
a covering and everyG-invariant measure µ on M descends to a natural
measure on the quotientM/G which we still indicate byµ. The measure
on M/G is deﬁned as follows: for every well-covered open setU ⊂ M/G
we have π−1(U) = ⊔i∈I Ui and we assign toU the measure ofUi for any
i ∈ I. This assignment extends to a unique Borel measure onM/G by
Proposition 1.3.4.
Note that the measure onM/G is not the push-forward ofµ, namely
it is not true thatµ(U) = µ(π−1(U)).
1.6. Homology
The singular homology theory needed in this book is not very deep:
all the homology groups of the manifolds that we consider are boringly
determined by their fundamental group. The theory is quickly reviewed in
this section, a standard introduction is Hatcher’sAlgebraic Topology[25].
1.6.1. Deﬁnition. Let X be a topological space andR be a ring. The
cases R = Z, R, or Z/2Z are typically the most interesting ones.
A singular k-simplex is a continuous mapα: ∆ k → X from the stan-
dard k-dimensional simplex ∆k into X. A k-chain is an abstract linear
combination
λ1α1 + . . . + λhαh
of singular k-simplexes α1, . . . , αh with coeﬃcients λ1, . . . , λh ∈ R. The
set Ck(X, R) of all k-chains is a R-module. There is a linear boundary
map ∂k : Ck(X, R) → Ck−1(X, R) such that∂k−1 ◦ ∂k = 0. Thecycles and
boundaries are the elements of the submodules
Zk(X, R) = ker ∂k , B k(X, R) = Im ∂k+1.
The k-th homology groupis the quotient
Hk(X, R) = Zk(X, R)/Bk (X,R).


## Page 43

1.6. HOMOLOGY 35
We sometimes omitR and write Hk(X) instead of Hk(X, R).
By taking the dual spacesCk(X, R) = Hom( Ck(X, R), R) we deﬁne
analogously thecohomology group Hk(X, R). (Co-)homology groups are
also deﬁned for pairs(X, Y ) with Y ⊂ X. When X = U ∪ V and U, V are
open we get the exactMayer – Vietoris sequence:
. . . − →Hn+1(X) − →Hn(U ∩ V ) − →Hn(U) ⊕ Hn(V ) − →Hn(X) − →. . .
(Co-)homology groups arefunctorial in the sense that continuous maps
induce natural homomorphisms of groups. Homotopic maps induce the
same homomorphisms.
If X is path-connected, thenH0(X, R) = R and there is a canonical
homomorphism
π1(X) − →H1(X, Z).
The homomorphism is surjective and its kernel is generated by the commu-
tators of π1(X): in other wordsH1(X, Z) is theabelianization of π1(X).
Concerning cohomology, we have
H1(X, Z) = Hom
(
H1(X, Z), Z
)
= Hom(π1(X), Z).
The relation betweenHi (X, Z) and Hi (X, Z) for i > 1 is not so immediate.
1.6.2. Dualities. Let M be a compact oriented connectedn-manifold
with (possibly empty) boundary. The abelian groupHk(M, Z) is ﬁnitely
generated and hence decomposes as
Hk(M, Z) ∼= Fk ⊕ Tk
where Fk = Zbk is free andTk is ﬁnite. Thetorsion subgroup Tk consists
of all ﬁnite-order elements inHk(M, Z). The rank bk of Fk is the k-th
Betti numberof M. In cohomology things change only a little:
Hk(M, Z) ∼= Fk ⊕ Tk−1.
All these groups vanish whenk > n . Even when the torsion vanishes, there
is no canonical isomorphism betweenHk(M) and Hk(M). On the other
hand, theLefschetz dualityprovides a canonical identiﬁcation
Hk(M) = Hn−k(M, ∂M)
for any ring R. When ∂M = ∅ this is the Poincaré duality Hk(M) =
Hn−k(M). In particular we get
Hn(M, ∂M, Z) = H0(M, Z) ∼= Z
and the choice of an orientation for M is equivalent to a choice of a
generator [M] ∈ Hn(M, ∂M, Z) called thefundamental classof M.
An important exact sequence forM is the following:
. . . − →Hn(M) − →Hn(M, ∂M) − →Hn−1(∂M ) − →Hn−1(M) − →. . .


## Page 44

36 1. PRELIMINARIES
1.6.3. Intersection form. Let G and H be ﬁnitely generated abelian
groups, seen asZ-modules. A bilinear form
ω : G × H − →Z
is non-degenerate if for every inﬁnite-order elementg ∈ G there is ah ∈ H
such that ω(g, h) ̸= 0. If G = H, we say thatω is symmetric (resp. skew-
symmetric) ifω(g1, g2) equals ω(g2, g1) (resp. −ω(g2, g1)) for allg1, g2 ∈
G. A skew-symmetric non-degenerate form is calledsymplectic.
Let M be a compact oriented connected n-manifold with (possibly
empty) boundary. The Lefschetz duality furnishes a non-degenerate bilin-
ear form
ω : Hk(M, Z) × Hn−k(M, ∂M, Z) − →Z
called theintersection form. It has the following geometric interpretation.
An oriented closedk-submanifold S ⊂ M deﬁnes a class[S] ∈ Hk(M)
as the image of its fundamental class via the mapi∗ : Hk(S) → Hk(M)
induced by the inclusion. If S has boundary and is properly embedded
(that is, ∂S = ∂M ∩ S), it deﬁnes a class[S] ∈ Hk(M, ∂M).
Suppose two oriented submanifolds S and S′ have complementary
dimensions k and n − k and intersect transversely: every intersection point
x is isolated and has a sign±1, deﬁned by comparing the orientations of
Tx S ⊕ Tx S′ and Tx M. Thealgebraic intersection S · S′ of S and S′ is the
sum of these signs.
Theorem 1.6.1. Let S, S′ be transverse and represent two classes
[S] ∈ Hk(M) and [S′] ∈ Hn−k(M, ∂M). We have
ω([S], [S′]) = S · S′.
Corollary 1.6.2. The intersection number of two transverse oriented
submanifolds of complementary dimension depends only on their homology
classes.
When M is closed and has even dimension2n, the central form
ω : Hn(M, Z) × Hn(M, Z) − →Z
is symmetric or skew-symmetric, depending on whethern is even or odd.
Everything we said about fundamental classes, Lefschetz duality, and
intersection forms holds for non-orientable manifolds as well, provided that
we pick R = Z/2Z and consider bilinear forms and intersections inZ/2Z.
1.7. Cells and handle decompositions
Many nice topological spaces can be constructed iteratively starting
from ﬁnitely many points and then attaching some discs of increasing di-
mension calledcells. When the topological space is a diﬀerentiable mani-
fold one typically thickens the cells tohandles.
CellsandhandlesarebeautifullyintroducedbyHatcher[ 25]andKosinksi
[34], respectively.


## Page 45

1.7. CELLS AND HANDLE DECOMPOSITIONS 37
1.7.1. Cell complexes. A ﬁnite cell complexof dimension n (brieﬂy,
a n-complex) is a topological space obtained iteratively in the following
manner:
• a 0-complex X0 is a ﬁnite set of points,
• a n-complex Xn is obtained from a (n − 1)-complex X n−1 by
attaching ﬁnitely manyn-cells, that is copies ofDn glued along
continuous maps ϕ: ∂D n → X n−1.
The closed subsetXk ⊂ X n is the k-skeleton of X n, for allk < n .
Proposition1.7.1. Let X bea n-complex. Theinclusionmap X k ↪→ X
induces an isomorphismπj (Xk) → πj (X) for all j < k .
Proof. Bytransversality, mapsSj → X andhomotopiesbetweenthem
can be homotoped away from cells of dimension⩾ j + 2. □
In particular, the spaceX is connected if and only ifX1 is, and its
fundamental group is captured byX2.
Theorem 1.7.2. Every diﬀerentiable compactn-manifold may be re-
alised topologically as a ﬁniten-complex.
A presentation for the fundamental group of a cell complexX can be
constructed as follows. If x0 ∈ X0, we ﬁx a maximal treeT ⊂ X1 con-
taining x0 and equip thek arcs inX1 \ T with some arbitrary orientations.
These arcs determine some generatorsg1, . . . , gk ∈ π1(X, x0). The bound-
ary of a2-cell makes a circular path inX1: every time it crosses an arc
gi in some direction (entering from one side and exiting from the other)
we write the corresponding letterg±1
i and get a word. The s two-cells
produce s word relations. We have constructed a presentation forπ1(X).
1.7.2. Euler characteristic. The Euler characteristicof a n-complex
X is the integer
χ(X) =
n∑
i=0
(−1)i Ci
where Ci is the number ofi-cells in X. It is also equal to
χ(X) =
n∑
i=0
(−1)i bi (X)
where bi (X) is the i-th Betti number ofX. Therefore χ(X) is a number
which depends only on the topology ofX, that can be easily calculated
from any cell decomposition ofX.
Proposition1.7.3. If ˜X → X isadegree- d coveringofﬁnitecomplexes
then χ( ˜X) = d · χ(X).
Proof. A k-cell in X is simply-connected and hence lifts tod distinct
k-cells in ˜X. A cell decomposition ofX thus induces one of˜X where the
numbers Ci are all multiplied byd. □


## Page 46

38 1. PRELIMINARIES
It is much harder to control homology under coverings. The Euler
characteristic of a closed manifold measures the obstruction of construct-
ing a nowhere-vanishing vector ﬁeld.
Theorem 1.7.4. A closed diﬀerentiable manifold M has a nowhere-
vanishing vector ﬁeld if and only ifχ(M) = 0.
1.7.3. Aspherical cell-complexes.A ﬁnite cell complex is locally con-
tractible and hence has a universal cover˜X. If ˜X is contractible the com-
plex X is calledaspherical.
Example 1.7.5. Every closed manifoldM covered byRn is aspherical.
By a theorem of Whitehead, a ﬁnite cell complexX is aspherical if
and only if all its higher homotopy groupsπi (X) with i ⩾ 2 vanish.
The following theorem says that maps to aspherical spaces are deter-
mined (up to homotopy) by homomorphisms between fundamental groups.
Theorem1.7.6. Let (X, x0), (Y, y0)bepointedconnectedﬁnitecellular
complexes. If Y is aspherical, every homomorphismπ1(X, x0) → π1(Y, y0)
is induced by a continuous map(X, x0) → (Y, y0), unique up to homotopy.
Proof. We construct a continuous mapf : X k → Y k iteratively on
the k-skeleta, starting fromk = 1.
Let T be a maximal tree inX1. The oriented 1-cells g1, . . . , gk in
X1 \ T deﬁne generators inπ1(X, x0). We deﬁnef : X1 → Y 1 by sending
T to y0 and each gi to any loop inY representing the image ofgi along
the given homomorphismπ1(X, x0) → π1(Y, y0).
The mapf sends the boundary of each 2-cell to a homotopically trivial
loop inY and hence extends to a mapf : X2 → Y 2. Since Y is aspherical,
the higher homotopy groupsπi (Y ) with i ⩾ 2 vanish and hencef extends
to a mapf : X k → Y k iteratively for allk ⩾ 3.
We prove thatf is unique up to homotopy. Letf′ be a map that re-
alises the given homomorphism on fundamental groups. We can construct
a homotopy betweenf and f′ iteratively on Xk as follows.
For k = 1, we can suppose that bothf and f′ send T to y0. By
hypothesis they send the generatorsgi to homotopic loops, hence we can
homotope f′ to f on X1. For k ⩾ 2, the mapsf and f′ on each k-cell are
homotopic because they glue to a mapSk → Y, which is null-homotopic
because πk(Y ) is trivial. □
Corollary 1.7.7. Let X and Y be connected ﬁnite aspherical com-
plexes. Every isomorphism π1(X) → π1(Y ) is realised by a homotopic
equivalence X → Y, unique up to homotopy.
In particular the homotopy type of an aspherical manifold is fully de-
termined by its fundamental group.
Corollary 1.7.8.Two aspherical closed manifolds of distinct dimension
have non-isomorphic fundamental groups.


## Page 47

1.7. CELLS AND HANDLE DECOMPOSITIONS 39
Proof. Two closed manifolds of diﬀerent dimension cannot be homo-
topically equivalent because they have non-isomorphic homology groups.
□
We cite for completeness this result, although we will never use it.
Theorem 1.7.9 (Cartan–Hadamard). A complete Riemannian mani-
fold M with sectional curvature everywhere⩽ 0 has a universal covering
diﬀeomorphic to Rn and is hence aspherical.
Sketch of the proof. Pick a pointx ∈ M. Since M is complete, the
exponential map expx : Tx M → M is deﬁned onTx M. The fact that the
sectionalcurvaturesare ⩽ 0implythat (d expx )y isinvertibleforany y ∈ Tx
and expx is a covering. □
At a single point in this book we will need the following theorem.
Theorem 1.7.10. The fundamental group of an aspherical manifold
M has no torsion.
Sketch of the proof. Up to passing to a cover, it suﬃces to consider
the case π1(M) ∼= Z/nZ for some n ⩾ 2. This case is excluded because
the cohomology ofM is isomorphic to the (suitably deﬁned) cohomology
of Z/nZ, which has however inﬁnite dimension. □
1.7.4. Gluing portion of boundaries. Every compact diﬀerentiable
n-manifold M can be obtained topologically as a ﬁnite complex. The
ﬁnite complex structure is however not designed to describe the smooth
structure of M, and for that purpose it is better to replacek-cells with
some thickened objects calledk-handles. These handles aren-discs glued
iteratively along portions of their boundaries. Before describing them, we
brieﬂy explain how smooth manifolds can be glued along portions of their
boundaries.
Let M and N betwo n-manifoldswithboundaryand X ⊂ ∂M, Y ⊂ ∂N
be two compact(n − 1)-submanifolds with boundary. A diﬀeomorphism
ϕ: X → Y deﬁnes a topological space
M ∪ϕ N
that may be promoted to a diﬀerentiable manifold: it suﬃces to use a
collar as in Section 1.1.12, see Figure 1.5. The glued manifold depends
(up to diﬀeomorphism) only on the isotopy class ofϕ.
1.7.5. Handles. Let M be a (possibly empty or disconnected) n-
manifoldwithboundaryand 0 ⩽ k ⩽ n. A k-handle isamanifold Dk ×Dn−k
attached to M along some diﬀeomorphismϕ: ∂D k × Dn−k → Y ⊂ ∂M,
hence producing a new manifoldM′.
For instance, a0-handle is aD0 × Dn = Dn attached to nothing, since
∂D 0 = ∅. This means that attaching a 0-handle toM consists of adding


## Page 48

40 1. PRELIMINARIES
M N
X Y
M
X Y
N M N
Figure 1.5. To glue two smooth manifolds along portions
of their boundaries (left) we pick a collar for these portions
(centre), then we removeX, Y and identify the interiors of
the collars (right).
Figure 1.6. Two 0-handles (yellow), two 1-handles (or-
ange), one 2-handle (red) in dimension 2 (left). Two 0-
handles (yellow), a 1-handle (orange) in dimension 3 (right).
a disjoint discDn to it. For instance, by attaching a 0-handle to the empty
set we create a discDn out of nothing.
A 1-handle is aD1 × Dn−1 attached along ∂D 1 × Dn−1 = S0 × Dn−1,
thatistwocopiesof Dn−1. Someexamplesindimension n = 2, 3areshown
in Figure 1.6. A2-handle is aD2 × Dn−2 attached along ∂D 2 × Dn−2 =
S1 × Dn−2. When n = 2 this is a disc attached along its boundary, see
Figure 1.6-(left).
1.7.6. Handle decompositions. A sequence of handle attachments
∅ ⇝ M1 ⇝ . . . ⇝ Mk = M
starting from the empty set and producing a compact manifoldM with
(possibly empty) boundary is called ahandle decompositionfor M. Using
Morse theory one proves the following.
Theorem 1.7.11. Every compact manifold (possibly with boundary)
can be obtained from a handle decomposition.
Example 1.7.12. The disc Dn has an obvious handle decomposition
consisting of a single0-handle. It also has more complicate handle decom-
positions, as Figure 1.6 shows.
By transversality, handles may always be reordered so that the lower
indexhandlesareattachedﬁrst, andhandlesofthesameindexareattached
simultaneously. So we can think of a decomposition as the appearing of


## Page 49

1.7. CELLS AND HANDLE DECOMPOSITIONS 41
Figure 1.7. A triangulated torus.
some 0-handles, then the simultaneous attaching of some 1-handles, then
of some 2-handles, and so on.
A handle decomposition of a closed manifold may be turned upside
down, by reversing all arrows and interpreting everyk-handle as a(n − k)-
handle.
Proposition 1.7.13. Every compact connected manifoldM has a han-
dle decomposition with one0-handle and at most onen-handle.
If M has a handle decomposition withni handles of indexi then
χ(M) =
n∑
i=0
(−1)i ni .
1.7.7. Triangulations. Instead of decomposing a manifold into han-
dles, one may decide to decompose it into simplexes as in Figure 1.7.
One such decomposition is called a triangulation: we now give a formal
deﬁnition.
An (abstract and ﬁnite)simplicial complexis a ﬁnite setS of vertices
together with a set X of subsets of S, called faces, which contains all
singletons and such that every subset of a face is also a face. A face of
cardinality k + 1 has dimension k.
Asimplicialcomplex X hasatopologicalrealisation |X|, inwhichevery
face F ∈ X of dimension k transforms into ak-simplex with vertices inF
(we get a cell complex). The complexX is purely n-dimensional if every
face is contained in a face of dimensionn. This implies that |X| is the
union of itsn-simplexes.
Let now M be a diﬀerentiable n-manifold. A smooth k-simplex in
M is a subset∆ ⊂ M diﬀeomorphic to ak-simplex in Rn (we mean that
there is a diﬀeomorphism between open neighbourhoods of∆ and of the
simplex sending the ﬁrst to the second). Asmooth triangulationof M is a
pure n-dimensional simplicial complexX together with a homeomorphism


## Page 50

42 1. PRELIMINARIES
between |X| and M that transforms everyk-simplex in X into a smooth
k-simplex in M.
Theorem1.7.14. Everycompactmanifoldwith(possiblyempty)bound-
ary has a smooth triangulation.
Handle decompositions are often more ﬂexible and eﬃcient than trian-
gulations, but triangulations have a more combinatorial nature and can for
instance be handled by a computer. Both constructions are widely used.
On a simplicial complexX, thestar of a vertexv is the set of all sim-
plexes containing v plus all their sub-simplexes; thelink of v is the subset
ofthestarconsistingofthesimplexesthatdonotcontain v. Topologically,
the star ofv is a closed neighbourhood ofv homeomorphic to a cone on
its link.
1.7.8. Hypersurfaces and cohomology. The techniques introduced
in this chapter furnish another characterisation of the ﬁrst cohomology
groupof amanifold. Let [X, Y ]denotethe homotopyclasses ofcontinuous
maps X → Y.
Proposition 1.7.15. Let X be a cell complex. There is a canonical
identiﬁcation
H1(X; Z) = [ X, S1].
Proof. We know thatH1(X; Z) = Hom( π1(X), Z). The circle S1 is
aspherical with π1(S1) = Z, so by Theorem 1.7.6 every homomorphism
π1(X) → π1(S1)isrealisedbyamap X → S1, uniqueuptohomotopy. □
We have noted that an orientedk-submanifold S ⊂ M determines a
class [S] ∈ Hk(M, Z). It is natural to ask whether every homology class
may be represented by an oriented submanifold: this is false in general, but
it is true in codimension one.
Proposition 1.7.16. Let M be a compact oriented n-manifold with
(possibly empty) boundary. Every class inHn−1(M, ∂M; Z) is represented
by an oriented properly embedded hypersurfaceS ⊂ M.
Proof. We have
Hn−1(M, ∂M; Z) = H1(M; Z) = Hom( π1(M), Z) = [ M, S1].
Every map M → S1 is homotopic to a smooth map, hence each class
α ∈ H1(M, Z) is represented by a smooth mapf : M → S1. By Sard’s
lemma there is a regular valuex ∈ S1, whose counter-imageS = f−1(x)
is a hypersurface, transversely oriented byf and hence oriented (because
M is).
To prove that[S] = α we verify that[S] and α act on π1(M) in the
same way. Pick a loopγ ∈ π1(M) transverse to S. The number α(γ) is
the degree off ◦ γ, that is the number of timesf ◦ γ crosses x counted


## Page 51

1.7. CELLS AND HANDLE DECOMPOSITIONS 43
with signs, which equals the number of timesγ crosses S counted with
signs. □
Proposition 1.7.17. An oriented connected properly embedded hyper-
surface S ⊂ M is separating if and only if[S] ∈ Hn−1(M, ∂M; Z) is trivial.
Proof. The surface S is separating if and only ifS · α = 0 for every
loop α transverse to S (exercise). Since ω([S], [α]) = S · α and ω is
non-degenerate (see Section 1.6.3), this holds precisely when[S] = 0. □
1.7.9. Topological discs. Finally, we mention a purely topological
theorem that will be used only at one point in this book, in Chapter 8.
Theorem 1.7.18.Let M be a compact topological manifold, whose in-
terior and boundary are homeomorphic respectively toBn and Sn−1. Then
M is homeomorphic toDn.
Proof. We use two important theorems on topological manifolds,
whose proofs can be found in the ﬁrst chapter of the bookTopological
embeddings of Rushing [51].
As in every compact topological manifold, the boundary∂M has a
topologicalcollarbyatheoremofBrown(seeTheorem1.7.4inthatbook).
The interior boundary sphere of the collar is contained inint(M) ∼= Bn and
hence bounds a closed disc by the Generalised Schönﬂies Theorem (see
Theorem 1.8.2 there). The manifoldM is obtained by collaring a closed
disc and is hence a closed disc. □


## Page 52

[No extractable text on this page]


## Page 53

CHAPTER 2
Hyperbolic space
In every dimension n ⩾ 2 there exists a unique simply connected
complete Riemannian manifold with constant sectional curvature1, 0, or
−1. These are the sphereSn, the Euclidean spaceRn, and the hyperbolic
space Hn.
These manifolds are the three most important spaces in Riemannian
geometry. We introduce in this chapter the least familiar and the most
interesting of the three: hyperbolic space.
2.1. The models of hyperbolic space
In contrast withSn and Rn, the hyperbolic spaceHn may be described
in various diﬀerent ways, no-one of which is prevalent in the literature.
Each description is amodel for Hn. We ﬁrst introduce the hyperboloid
model, which has a more algebraic ﬂavour, and then we turn to the disc
and half-space models that are somehow more geometric (and easier to
visualise in dimensionsn = 2 and 3).
2.1.1. Hyperboloid. The sphereSn is the set of all points with norm
1 in Rn+1, equipped with the Euclidean scalar product. Analogously, we
may deﬁne Hn as the set of all points of norm−1 in Rn+1, equipped with
the usualLorentzian scalar product. This set forms a hyperboloid with two
sheets, and we choose one.
Deﬁnition 2.1.1. TheLorentzian scalar producton Rn+1 is:
⟨x , y⟩ =
n∑
i=1
xi yi − xn+1yn+1.
It has signature(n, 1). A vectorx ∈ Rn+1 is time-like, light-like, orspace-
like if ⟨x , x⟩ is negative, null, or positive respectively. The hyperboloid
model In is deﬁned as follows:
In =
{
x ∈ Rn+1 ⏐⏐ ⟨x , x⟩ = −1, x n+1 > 0
}
.
The set of pointsx with ⟨x , x⟩ = −1 is ahyperboloid with two sheets,
and In is the connected component (sheet) withxn+1 > 0. Let us prove a
general fact. For us, a scalar product is a real non-degenerate symmetric
bilinear form.
45


## Page 54

46 2. HYPERBOLIC SPACE
Figure 2.1. The hyperboloid with two sheets deﬁned by the
equation⟨x , x⟩ =−1. The model In for Hn is the upper
sheet.
Proposition 2.1.2. Let ⟨, ⟩ be a scalar product onRn+1. The function
f : Rn+1 → R given by
f (x) = ⟨x , x⟩
is everywhere smooth and has diﬀerential
dfx (y) = 2 ⟨x , y⟩.
Proof. The following equality holds:
⟨x + y , x + y ⟩ = ⟨x , x⟩ + 2⟨x , y⟩ + ⟨y , y⟩.
The component ⟨x , y⟩ is linear iny while ⟨y , y⟩ is quadratic. □
Corollary 2.1.3. The hyperboloid In is a Riemannian manifold.
Proof. The hyperboloid is the set of points withf (x) = ⟨x , x⟩ = −1.
For all x ∈ In the diﬀerential y ↦→ 2⟨x , y⟩ is surjective and hence the
hyperboloid is a diﬀerentiable submanifold of codimension 1.
The tangent spaceTx In at x ∈ In is the hyperplane
Tx = ker dfx =
{
y
⏐⏐ ⟨x , y⟩ = 0
}
= x⊥
orthogonal to x in the Lorentzian scalar product. Sincex is time-like, the
restriction of the Lorentzian scalar product tox⊥ is positive deﬁnite and
hence deﬁnes a metric tensor onIn. □
The hyperboloid In is a model for hyperbolic spaceHn. We will prove
that it is simply connected, complete, and has constant curvature−1.


## Page 55

2.1. THE MODELS OF HYPERBOLIC SPACE 47
2.1.2. Isometries of the hyperboloid.The isometries ofIn are easily
classiﬁed using linear algebra.
Let O(n, 1) be the group of linear isomorphismsf of Rn+1 that pre-
serve the Lorentzian scalar product,i.e. such that ⟨v , w⟩ = ⟨f (v), f (w )⟩
for any v , w ∈ Rn. An element inO(n, 1) preserves the hyperboloid with
twosheets, andtheelementspreservingtheuppersheet In formasubgroup
of index two inO(n, 1) that we indicate withO+(n, 1).
Proposition 2.1.4. The following equality holds:
Isom(In) = O+(n, 1).
Proof. Pick f ∈ O+(n, 1). If x ∈ In then f (x) ∈ In and f sends x⊥ to
f (x)⊥ isometrically, hencef ∈ Isom(In). Therefore O+(n, 1) ⊆ Isom(In).
To prove the converse inclusion we show that for every pairx , y ∈ In
and every linear isometryg : x⊥ → y⊥ there is an elementf ∈ O+(n, 1)
such thatf (x) = y and f |x⊥ = g. Since isometries are determined by their
ﬁrst-order behaviour at a pointx, this impliesIsom(In) ⊆ O+(n, 1).
Via elementary linear algebra we prove thatO+(n, 1) acts transitively
on In and hence we may suppose thatx = y = (0, . . . ,0, 1). Now x⊥ = y⊥
is the horizontal hyperplane andg ∈ O(n). To deﬁnef simply take
f =
(g 0
0 1
)
.
The proof is complete. □
The isometry groups ofSn and Rn are described analogously:
Proposition 2.1.5. The following equalities hold:
Isom(Sn) = O(n + 1),
Isom(Rn) =
{
x ↦→ Ax + b
⏐⏐ A ∈ O(n), b ∈ Rn}
.
Proof. The proof is analogous to the one above. □
We have also proved the following fact. Aframe at a point p in a
Riemannian manifold M is an orthonormal basis forTpM.
Corollary 2.1.6. Let M = Sn, Rn, or Hn. Given two pointsp, q ∈ M
and two frames atp and q, there is a unique isometry that carries the ﬁrst
frame to the second.
2.1.3. Subspaces. We introduce the following natural objects.
Deﬁnition 2.1.7. A k-dimensional subspace of Rn, Sn, In is:
• an aﬃne k-dimensional space inRn,
• theintersectionofa (k +1)-dimensionalvectorsubspaceof Rn+1
with Sn,
• theintersectionofa (k +1)-dimensionalvectorsubspaceof Rn+1
with In, when it is non-empty.


## Page 56

48 2. HYPERBOLIC SPACE
Remark 2.1.8. Elementary linear algebra shows that the following
conditions are equivalent for any (k + 1)-dimensional vector subspace
W ⊂ Rn+1:
(1) W ∩ In ̸= ∅,
(2) W contains at least a time-like vector,
(3) the signature of⟨, ⟩|W is (k, 1).
A k-subspace inRn, Sn, Hn is itself isometric toRk , Sk , Hk. The non-
empty intersection of two subspaces is always a subspace. An isometry of
Rn, Sn, Hn sends k-subspaces to k-subspaces.
Exercise 2.1.9. Let S be a k-subspace in Rn, Sn, or Hn and p ∈ S a
point. There is a unique(n − k)-subspace S′ intersecting S orthogonally
in p.
2.1.4. Reﬂections. We now introduce a basic kind of isometry. The
reﬂection rS along a subspace S in In is an isometry of In deﬁned as
follows. By deﬁnition S = In ∩ W with ⟨, ⟩|W non-degenerate, hence
Rn+1 = W ⊕ W⊥ and we set rS|W = id and rS|W⊥ = −id. Analogous
deﬁnitions work for subspaces ofSn and Rn.
Exercise 2.1.10. The reﬂection rS has ﬁxed set S and preserves all
the subspaces orthogonal toS. It is orientation-preserving if and only ifS
has even codimension.
Proposition 2.1.11. Reﬂections along hyperplanes generate the isom-
etry groups ofSn, Rn, and Hn.
Proof. It is a standard linear algebra fact that orthogonal reﬂections
along vector hyperspaces generate O(n). This proves the case Sn and
shows that reﬂections generate the stabiliser of any point inRn and Hn.
To conclude it suﬃces to check that reﬂections act transitively on points:
to send x to y, reﬂect along the hyperplane orthogonal to the segment
connecting x to y in its midpoint. □
2.1.5. Lines. A 1-subspaceisa line. Weshowthatlinesandgeodesics
are the same thing. Recall the hyperbolic trigonometric functions:
sinh(t) = et − e−t
2 , cosh(t) = et + e−t
2 .
Proposition 2.1.12. A non-trivial complete geodesic inSn, Rn, or Hn
is a line run at constant speed. Concretely, letp ∈ M be a point and
v ∈ TpM a unit vector. The geodesicγ exiting from p with velocity v is:
• γ(t) = cos( t) · p + sin(t) · v if M = Sn,
• γ(t) = p + tv if M = Rn,
• γ(t) = cosh( t) · p + sinh(t) · v if M = In.
Proof. Let p ∈ In be a point, v ∈ TpM a unit vector, and γ the
geodesic exiting fromp with velocity v. The plane W ⊂ Rn+1 generated


## Page 57

2.1. THE MODELS OF HYPERBOLIC SPACE 49
by p and v intersects In into a linel containing p and tangent tov. To
provethat l isthesupportof γ weuseasymmetryargument: thereﬂection
rl ﬁxes p and v and hence γ, therefore γ is forced to be contained in its
ﬁxed locus, which isl. This shows that non-trivial geodesics are lines run
at constant speed.
We now consider the curveα(t) = cosh( t) · p + sinh(t) · v. We have
α(0) = p and α′(0) = v. It remains to prove thatα parametrizes l with
unit speed, and from this we deduce thatγ = α. We note that
⟨α(t), α(t)⟩ = cosh2(t)⟨p, p⟩ + 2 cosh(t) sinh(t)⟨p, v ⟩ + sinh2(t)⟨v , v⟩
= − cosh2(t) + sinh2(t) = −1.
Therefore α parametrizes l. Its velocity is
α′(t) = cosh′(t) · p + sinh′(t) · v = sinh(t) · p + cosh(t) · v
whose squared norm is− sinh2(t) + cosh2(t) = 1. Therefore γ = α. The
proofs forSn and Rn are analogous. □
Corollary 2.1.13. The spaces Sn, Rn, and Hn are complete.
Proof. The previous proposition shows that geodesics are deﬁned on
R, hence the space is complete by the Hopf – Rinow Theorem 1.2.8.□
It is easy to show that two points inHn are contained in a unique line.
Remark 2.1.14. Euclid’s ﬁfth postulate holds only inR2. Given a line
r and a pointP ̸∈ r, there is exactly one line passing throughP and disjoint
from r in R2, there is no-one inS2, and there are inﬁnitely many inH2.
We can easily calculate the distance between two points.
Proposition 2.1.15. Let p, q ∈ M be two points. We have
• cos(d(p, q)) = ⟨p, q⟩ if M = Sn,
• cosh(d(p, q)) = −⟨p, q⟩ if M = In.
Proof. Let γ be a geodesic that goes fromp to q at unit speed. We
have γ(0) = p and γ(t) = q with t = d(p, q). Set v = γ′(0) and use
Proposition 2.1.12 to conclude. □
2.1.6. The Poincaré disc.We introduce two models ofHn, thedisc
and thehalf-space, that are easier to visualise especially in the dimensions
n = 2, 3 we are interested in. The ﬁrst model is thePoincaré disc
Dn =
{
x ∈ Rn ⏐⏐ ∥x∥ < 1
}
.
The metric tensor onDn is obviously not the Euclidean one ofRn,
but instead is induced by a particular diﬀeomorphism betweenIn and Dn
that we construct now. We identify Rn with the horizontal hyperplane
xn+1 = 0 in Rn+1 and note that the projection towardsP = (0, . . . ,0, −1)


## Page 58

50 2. HYPERBOLIC SPACE
P
Dn
I n
Figure 2.2. The projection towardsP = (0 , . . . ,0,−1) in-
duces a bijection between the hyperboloid modelIn and the
disc model Dn.
depicted in Figure 2.2 induces a bijection betweenIn and the horizontal
disc Dn ⊂ Rn. The projectionp may be written as:
p(x1, . . . , xn+1) = (x1, . . . , xn)
xn+1 + 1
and is indeed a diﬀeomorphism p : In → Dn that transports the metric
tensor on In to some metric tensorg on Dn.
Proposition 2.1.16. The metric tensorg at x ∈ Dn is:
gx =
( 2
1 − ∥x∥2
)2
· gE
x
where gE is the Euclidean metric tensor onDn ⊂ Rn.
Proof. The inverse q : Dn → In of p is:
q(x) =
( 2x1
1 − ∥x∥2 , . . . , 2xn
1 − ∥x∥2 , 1 + ∥x∥2
1 − ∥x∥2
)
.
Pick x ∈ Dn. Rotations around the xn+1 axis are isometries of In and
commute with p, therefore they are isometries of (Dn, g) too. Up to
rotating we may takex = (x1, 0, . . . ,0) and ﬁnd
d qx = 2
1 − x 2
1
·


1+x2
1
1−x2
1
0 · · · 0
0 1 · · · 0
...
... ... ...
0 0 · · · 1
2 x1
1−x2
1
0 · · · 0


.
The column vectors form an orthonormal basis ofTq(x)In. Hence d qx
stretches all vectors of a constant 2
1−x2
1
. Therefore gx = 4
(1−x2
1 )2 gE
x . □


## Page 59

2.1. THE MODELS OF HYPERBOLIC SPACE 51
g
a b
Figure 2.3. Three lines that determine a hyperbolic triangle
in the Poincaré disc. The inner anglesα, β, and γ coincide
with the Euclidean ones, and we haveα + β + γ < π .
The Poincaré disc is aconformal model of Hn: it is a model where
the metric diﬀers from the Euclidean metric only by multiplication by a
positive scalar
( 2
1−∥x∥2
)2
that depends smoothly onx. We note that the
scalar tends to inﬁnity whenx tends to ∂D n. On a conformal model the
lengths of vectors are diﬀerent from the Euclidean lengths, but the angles
formed by two adjacent vectors coincide with the Euclidean ones. Shortly:
lengths are distorted but angles are preserved.
Let us see how we can easily visualisek-subspaces in the disc model.
Proposition 2.1.17. The k-subspaces in Dn are the intersections of
Dn with k-spheres and k-planes of Rn orthogonal to ∂D n.
Proof. Since every k-subspace is an intersection of hyperplanes, we
easily restrict to the casek = n − 1. A hyperplane inIn is In ∩ v⊥ for some
space-like vectorv. If v is horizontal (i.e. its last coordinate is zero) then
v⊥ is vertical andp(In ∩ v⊥) = Dn ∩ v⊥, a hyperplane orthogonal to∂D n.
If v is not horizontal, up to rescaling and rotating aroundxn+1 we may
suppose v = (α, 0, . . . ,0, 1) with α > 1. The hyperplane is
{
x 2
1 + . . . + x 2
n − x 2
n+1 = −1
}
∩
{
xn+1 = αx1
}
.
On the other hand the sphere in Rn of centre (α, 0, . . . ,0) and radius√
α2 − 1 is orthogonal to∂D n and is described by the equation
{
(y1 − α)2 + y 2
2 + . . . + y 2
n = α2 − 1
}
=
{
y 2
1 + . . . + y 2
n − 2αy1 = −1
}
which is equivalent to||y ||2 = −1 + 2αy1. If y = p(x) the relations
y1 = x1
xn+1 + 1 , ∥y ∥2 = xn+1 − 1
xn+1 + 1
transform the latter equation inxn+1 = αx1. □
Three lines inD2 delimiting a hyperbolic triangle are drawn in Figure
2.3. Since the disc is a conformal model, the inner anglesα, β, γ are the
ones we see on the picture. In particular we verify easily thatα+β+γ < π.


## Page 60

52 2. HYPERBOLIC SPACE
Figure 2.4. A tessellation of S2, R2 o H2 is a subdivision of
the plane into polygons. The tessellation ofH2 shown here
is obtained by drawing inﬁnitely many lines in the plane. The
triangles have inner anglesπ
2 , π
5 , π
5 and are all isometric.
Exercise 2.1.18. For any triple of positive anglesα, β, γ with α + β +
γ < π there is a triangle with inner anglesα, β, γ. This triangle is unique
up to isometry.
2.1.7. Inversions. To construct our second conformal model we need
to introduce a geometric transformation called inversion.
Deﬁnition 2.1.19. Let S = S(x0, r) be the sphere in Rn centred in
x0 and with radius r. The inversion along S is the map ϕ: Rn \ {x0} →
Rn \ {x0} deﬁned as follows:
ϕ(x) = x0 + r 2 x − x0
∥x − x0∥2 .
The map may be extended continuously on the whole sphere Sn,
identiﬁed with Rn ∪ {∞} through the stereographic projection, by set-
ting ϕ(x0) = ∞ and ϕ(∞) = x0. A geometric description is shown in
Figure 2.5.
We have already talked about conformal models. More generally, a
diﬀeomorphism f : M → N between two oriented Riemannian manifolds is
conformal (respectively, anticonformal) if for anyp ∈ M the diﬀerential
dfp is the product of a scalar dilationλp > 0and an isometry that preserves
(respectively, inverts) the orientation. The scalarλp depends smoothly on
p. A conformal map preserves the angle between two tangent vectors but
multiplies their lengths byλp.
Exercise 2.1.20. The stereographic projection is conformal.
Proposition 2.1.21. The following hold:
(1) every inversion is a smooth and anticonformal map;


## Page 61

2.1. THE MODELS OF HYPERBOLIC SPACE 53
Figure 2.5. The inversion trough a sphere of centreO and
radius r moves P to P′ so that OP× OP′ = r 2 (left). It
transforms ak-sphere S (blue) into ak-plane (green) ifO∈
S (centre) or into ak-sphere (green) ifO̸∈ S (right).
(2) inversionssend k-spheresand k-planesto k-spheresand k-planes.
Proof. Up to conjugating with translations and dilations we may sup-
pose x0 = 0 and r = 1. The inversion is ϕ(x) = x
∥x∥2 and we show that
d ϕx is 1
∥x∥2 times a reﬂection with respect to the hyperplane orthogonal to
x. We may supposex = (x1, 0, . . . ,0) and calculate the partial derivatives:
ϕ(x1, . . . , xn) = (x1, . . . , xn)
∥x∥2 , ∂ϕi
∂xj
= δi j∥x∥2 − 2xi xj
∥x∥4 .
The partial derivatives atx = (x1, 0, . . . ,0) are
∂ϕ1
∂x1
= − 1
x 2
1
, ∂ϕi
∂xi
= 1
x 2
1
, ∂ϕj
∂xk
= 0
for all i > 1 and j ̸= k. This proves our assertion.
The fact that an inversion preserves sphere and planes may be easily
reduced to the two-dimensional case (with circles and lines), a classical
fact of Euclidean geometry. □
2.1.8. Thehalf-spacemodel. Weintroduceanotherconformalmodel.
The half-space modelis the space
Hn =
{
(x1, . . . , xn) ∈ Rn ⏐⏐ xn > 0
}
.
It is obtained from the disc modelDn by an inversion inRn with centre
C = (0, . . . ,0, −1) and radius
√
2 as shown in Figure 2.6. The boundary
∂H n is the horizontal hyperplane{xn = 0}, to which we add the point∞
at inﬁnity to get a bijective correspondence between∂H n and ∂D n through
the inversion.
Proposition 2.1.22. The half-space Hn is a conformal model forHn.
Its k-subspaces are thek-planes and k-spheres in Rn orthogonal to ∂H n.


## Page 62

54 2. HYPERBOLIC SPACE
C
Dn
Hn
O
Figure 2.6. The inversion along the sphere with centreC =
(0, . . . ,0,−1) and radius
√
2 transforms the Poincaré disc
Dn into the half-space modelHn. Here n = 2.
Figure 2.7. Lines and planes in the half-space model forH3.
Proof. Theinversionisanticonformalandhencepreserveangles,more-
over it transforms k-spheres and k-planes in Dn orthogonal to ∂D n into
k-spheres and k-planes in Hn orthogonal to ∂H n. □
Some lines and planes in H3 are drawn in Figure 2.7. The metric
tensor g on Hn has a particularly nice form.
Proposition 2.1.23. The metric tensor onHn is:
gx = 1
x 2n
· gE
where gE is the Euclidean metric tensor onHn ⊂ Rn.
Proof. The inversion ϕ: Dn → Hn is the function
ϕ(x1, . . . , xn) = (0 , . . . ,0, −1) + 2 (x1, . . . , xn−1, xn + 1)
∥(x1, . . . , xn−1, xn + 1)∥2
= (2x1, . . . ,2xn−1, 1 − ∥x∥2)
∥x∥2 + 2xn + 1 .


## Page 63

2.1. THE MODELS OF HYPERBOLIC SPACE 55
As seen in the proof of Proposition 2.1.21, the inversionϕ is anticonformal
with scalar dilation
2
∥(x1, . . . , xn−1, xn + 1)∥2 = 2
∥x∥2 + 2xn + 1 .
The map ϕ hence transforms the metric tensor
(
2
1−∥x∥2
)2
· gE in x ∈ Dn
into the following metric tensor inϕ(x) ∈ Hn:
( 2
1 − ∥x∥2
)2
·
(∥x∥2 + 2xn + 1
2
)2
· gE = 1
ϕn(x)2 · gE.
The proof is complete. □
2.1.9. Geodesics in the conformal models. The disc Dn and the
half-space Hn are conformal models forHn. In both models the hyperbolic
metric diﬀers from the Euclidean one only by a multiplication with some
function.
In the half-spaceHn the lines are Euclidean vertical half-lines or half-
circles orthogonal to ∂H n as in Figure 2.7. Vertical geodesics have a
particularly simple form.
Proposition 2.1.24. The vertical geodesic inHn passing through the
point (x1, . . . , xn−1, 1) at time t = 0 pointing upward with unit speed is:
γ(t) = ( x1, . . . , xn−1, et).
Proof. A tangent vectorv at (x1, . . . , xn) ∈ Hn has norm∥v∥E
xn where
∥v ∥E indicates the Euclidean norm. We get
∥γ′(t)∥ = ∥(0, . . . ,0, et)∥ = et
et = 1.
Therefore γ(t) runs on a line at unit speed. □
Wecaneasilydeduceaparametrisationforthegeodesicsin Dn passing
through the origin. Recall the hyperbolic tangent:
tanh(t) = sinh(t)
cosh(t) = et − e−t
et + e−t = e2t − 1
e2t + 1 .
Proposition 2.1.25. The geodesic inDn passing through the origin at
time t = 0 and pointing towardsx ∈ Sn−1 at unit speed is:
γ(t) = et − 1
et + 1 · x =
(
tanh t
2
)
· x .
Proof. We can supposex = (0 , . . . ,0, 1) and obtain this parametri-
sation from that of the vertical line inHn through inversion. □
We obtain in particular:


## Page 64

56 2. HYPERBOLIC SPACE
Corollary2.1.26. Theexponentialmap exp0 : T0Dn → Dn attheorigin
0 ∈ Dn is the diﬀeomorphism:
exp0(x) = e∥x∥ − 1
e∥x∥ + 1 · x
∥x∥ =
(
tanh∥x∥
2
)
· x
∥x∥ .
Since the isometries ofHn act transitively on points, we deduce that
the exponential map at anyp ∈ Hn is a diﬀeomorphism. As a consequence,
the injectivity radius ofHn is ∞, as in the EuclideanRn.
2.1.10. Isometriesoftheconformalmodels. Inthehalf-spacemodel
it is easy to identify some isometries:
Proposition 2.1.27. The following are isometries ofHn:
• horizontal translations x ↦→ x + b with b = (b1, . . . , bn−1, 0),
• dilations x ↦→ λx with λ > 0,
• inversions with respect to spheres orthogonal to∂H n.
Proof. Horizontal translations obviously preserve the metric tensor
g = 1
x2n
· gE. We indicate by∥ · ∥ and ∥ · ∥ E the hyperbolic and Euclidean
norm of tangent vectors. On a dilationϕ(x) = λx we get
∥d ϕx (v)∥ = ∥d ϕx (v)∥E
ϕ(x)n
= λ∥v ∥E
λxn
= ∥v ∥E
xn
= ∥v ∥.
Concerning inversions, up to conjugating by translations and dilations
it suﬃces to consider the mapϕ(x) = x
∥x∥2. We have already seen that
d ϕx is 1
∥x∥2 times a linear reﬂection. Therefore
∥d ϕx (v)∥ = ∥d ϕx (v)∥E
ϕ(x)n
= ∥v ∥E/∥x∥2
xn/∥x∥2 = ∥v ∥E
xn
= ∥v ∥.
This completes the proof. □
In the disc model we can easily write the isometries that ﬁx the origin:
Proposition 2.1.28. The group O(n) acts isometrically onDn.
Proof. The metric tensor onDn has a spherical symmetry. □
It is harder to write the isometries that ﬁx another point ofDn or Hn.
Proposition 2.1.29. On the conformal modelsDn and Hn, the isom-
etry group is generated by inversions along spheres and reﬂections along
Euclidean planes orthogonal to the boundary.
Proof. We know from Proposition 2.1.27 that these maps are isome-
tries of Hn. One such isometry ﬁxes a hyperplane S, hence it is the
hyperbolic reﬂection rS (which is the unique non-trivial isometry ﬁxingS).
Hyperbolic reﬂections generate the isometry group by Proposition 2.1.11.
In Dn the proof is the same, we leave as an exercise to prove that a
sphere inversion preserves the metric tensor and is hence an isometry.□


## Page 65

2.1. THE MODELS OF HYPERBOLIC SPACE 57
Figure 2.8. A tessellation of H2 into regular triangles and
heptagons in the Klein model.
2.1.11. Balls in the conformal models.How does a metric ball in
the hyperbolic space look like? The answer in the conformal models is
surprisingly simple.
Proposition 2.1.30. In the conformal models balls are Euclidean balls.
Proof. In the disc modelB(0, r) is a ball centred at0 by symmetry.
Theball B(x0, r)atanotherpoint x0 isobtainedfrom B(0, r)bycomposing
inversions, which send spheres to spheres and hence balls to balls. The
inversion Dn → Hn also sends balls to balls. □
The centre of the ball is not its Euclidean centre in general!
2.1.12. The Klein model.There is a fourth model for the hyperbolic
space that is some kind of intermediate version between the hyperboloid
and the Poincaré disc model.
The Klein or projective model for Hn is obtained by embedding the
hyperboloid In inside RPn via the projectionRn+1 \ {0} → RPn. The image
of this embedding is an open disc Kn ⊂ RPn bounded by the quadric
x 2
1 + . . . + x 2
n − x 2
n+1 = 0. We equipKn with the metric tensor transported
from In , so thatKn is indeed a model forHn.
When read in the chartxn+1 = 1, the Klein modelKn becomes the
open disc x 2
1 + . . . + x 2
n < 1. It is like the Poincaré discDn, but with a
diﬀerent metric tensor!
TheKleinmodel Kn isnotconformalanditsmetrictensorisabitmore
complicated than that ofDn or Hn. On the other hand, the subspaces
in Kn are easier to identify: by deﬁnition, these are just the projective
subspaces of RPn intersected with the open discKn. Therefore lines are
straight lines, but the angles and distances are distorted. Note also that
the isometries ofKn are projective transformations. The distance function
is particularly nice:


## Page 66

58 2. HYPERBOLIC SPACE
Exercise 2.1.31. The distance of two distinct pointsp, q in Kn is
d(p, q) = 1
2 | log β(p, q, r, s )|
where r, s are the intersections of the projective linel containing p and q
with ∂K n, and β(p, q, r, s ) is the cross-ratio of the four points.
2.2. Compactiﬁcation and isometries of hyperbolic space
In this section we compactify the hyperbolic spaceHn by adding some
“points at inﬁnity”. The compactiﬁcation will then be used to classify the
isometriesof Hn intothreetypes. Wealsostudythemutualpositionoftwo
subspaces and deﬁne some peculiar hyperbolic objects: the horospheres.
2.2.1. Points at inﬁnity.Let ageodesic half-linein Hn be a geodesic
γ : [0 , +∞) → Hn with constant unit speed.
Deﬁnition 2.2.1. The set∂Hn of thepoints at inﬁnityin Hn is the set
of all geodesic half-lines, taken up to the following equivalence relation:
γ1 ∼ γ2 ⇐ ⇒ sup
t∈[0,+∞)
{
d
(
γ1(t), γ2(t)
)}
< +∞.
We add its points at inﬁnity toHn by deﬁning
Hn = Hn ∪ ∂Hn.
Proposition 2.2.2.On the disc model there is a natural 1-1 correspon-
dence between∂D n and ∂Hn and hence betweenDn and Hn.
Proof. A geodesic half-lineγ in Dn is a circle or line arc orthogonal to
∂D n and hence the Euclidean limitlimt→∞ γ(t) is a point in∂D n. We now
prove that two half-lines converge to the same point if and only if they lie
in the same equivalence class.
Suppose that two half-geodesicsγ1, γ2 converge to the same point
p ∈ ∂D n. Up to isometries and inversions, we can change the conformal
model to Hn and take p = ∞. In this nicer settingγ1 and γ2 are vertical
lines:
γ1(t) = ( x1, . . . , xn−1, xnet), γ 2(t) = ( y1, . . . , yn−1, ynet).
The geodesic
γ3(t) = ( y1, . . . , yn−1, xnet)
is equivalent to γ2 since d(γ2(t), γ3(t)) = | ln yn
xn | for all t and is also
equivalent to γ1 because d(γ1(t), γ3(t)) → 0 as shown in Figure 2.9.
Suppose that γ1 and γ2 converge to distinct points in∂D n. We can
use the half-space model again and suppose thatγ1 is upwards vertical and
γ2 tends to some other point in{xn = 0}. In that case we easily see that
d(γ1(t), γ2(t)) → ∞: for anyM > 0 there is at0 > 0 such thatγ1(t) and
γ2(t) lie respectively in{xn > M } and
{
xn < 1
M
}
for all t > t 0. Whatever
curve connects these two open sets, it has length at leastln M2, hence
d(γ1(t), γ2(t)) > ln M2 for all t > t 0. □


## Page 67

2.2. COMPACTIFICATION AND ISOMETRIES OF HYPERBOLIC SPACE 59
xn
xn
d 0
t
d
de-t
g
1
g
3
g
1
g
3
Figure 2.9. Two vertical linesγ1 and γ3 in the half-space
model Hn at Euclidean distance d. Thehyperbolic length of
the horizontal segment between them at heightxn is d
xn and
hence tends to zero asxn→∞ (left). Using as a height pa-
rameter the more intrinsic hyperbolic arc-length, we see that
the two vertical geodesicsγ1 and γ3 approach at exponential
rate, since d(γ1(t), γ3(t)) ⩽ d e−t (right).
2.2.2. The compactiﬁcation. We can give Hn the topology of Dn,
and in that way we havecompactiﬁed Hn by adding its points at inﬁnity.
The interior ofHn is Hn, and the points at inﬁnity form a sphere∂Hn.
The topology onHn may also be deﬁned intrinsically: for anyp ∈ ∂Hn
we deﬁne a system of open neighbourhoods ofp in Hn as follows. Let γ
be a half-line with[γ] = p and V be an open neighbourhood of the vector
γ′(0) in the unitary sphere inTγ(0)Hn. Pick r > 0 and deﬁne the following
subset of Hn:
U(γ, V, r ) =
{
α(t)
⏐⏐ α(0) = γ(0), α′(0) ∈ V, t > r
}
⋃ {
[α]
⏐⏐ α(0) = γ(0), α′(0) ∈ V
}
where α indicates a half-line inHn and [α] ∈ ∂Hn its class, see Figure 2.10.
We deﬁne an open neighbourhoods system{U(γ, V, r )} for p by lettingγ,
V, and r vary. The resulting topology onHn coincides with that ofDn.
Note that Hn is a complete Riemannian manifold (and hence a com-
plete metric space), while its compactiﬁcation Hn is only a topological
space: a point in∂Hn has inﬁnite distance from any other point inHn.
2.2.3. Klein model. In the Klein modelKn ⊂ RPn, the compactiﬁca-
tion is obtained by adding the quadric∂K n = {x 2
1 + . . . + x 2
n − x 2
n+1 = 0},
which is the image of the light cone inRn+1. Analogously, in the hy-
perboloid model In we may represent ∂I n as the set of rays in the light
cone.
A nice feature of the Klein model is that the pointsx ∈ RPn that
lie “beyond the inﬁnity”, that is outsideKn, can also be given a natural
geometric interpretation. One such x ∈ RPn \ Kn is a space-like ray in


## Page 68

60 2. HYPERBOLIC SPACE
p
g(0)
g
Figure 2.10. An open neighbourhoodU(γ, V, r ) of p∈ ∂Hn
(in yellow). We use the Klein model here.
Figure 2.11. Two incident, asymptotic parallel, and ultra-
parallel lines.
Rn+1 and as such it deﬁnes a hyperplanex⊥ of signature(n − 1, 1) in Rn+1,
which projects to a hyperbolic hyperplane inKn. The points beyond the
inﬁnity are in 1-1 correspondence with the hyperbolic hyperplanes inKn.
2.2.4. Incident, parallel, and ultraparallel subspaces.A k-subspace
S ⊂ Hn has a topological closure S in the compactiﬁcation Hn. The
boundary ∂S = S ∩ ∂Hn of S is a (k − 1)-sphere.
For instance, the boundary of a linel consists of two distinct points,
the endpoints of l. The boundary of a plane is a circle. Two distinct points
in ∂Hn are the endpoints of a unique line. A circle in the sphere∂D 3 is
the boundary of a unique plane in the disc model.
The usual distance d(A, B) between two subsets A, B in a metric
space is deﬁned as
d(A, B) = inf
x∈A,y∈B
{
d(x , y)
}
.
There are three types of conﬁgurations for two subspaces inHn, de-
picted in Figure 2.11.
Proposition 2.2.3. Let S and S′ be subspaces in Hn of arbitrary di-
mension. Precisely one of the following holds:


## Page 69

2.2. COMPACTIFICATION AND ISOMETRIES OF HYPERBOLIC SPACE 61
Figure 2.12. Two ultraparallel subspacesS, S′ and a lineγ
orthogonal to both.
(1) S ∩ S′ ̸= ∅,
(2) S ∩ S′ = ∅ and S ∩ S′ is a point in∂Hn; moreoverd(S, S′) = 0
and there is no geodesic orthogonal to bothS and S′,
(3) S ∩ S′ = ∅; moreover d = d(S, S′) > 0 and there is a unique
geodesic γ orthogonal to bothS, S′: the segment ofγ between
S and S′ is the unique arc connecting them of lengthd.
Proof. If S∩S′ containstwopointsthenitcontainsthelineconnecting
them and henceS ∩ S′ ̸= ∅.
In (2) we use the half-space model and sendS ∩ S′ at inﬁnity. Then
S and S′ are Euclidean vertical subspaces and Figure 2.9 shows that
d(S, S′) = 0 . Geodesics are vertical or half-circles and cannot be or-
thogonal to bothS and S′.
In (3), letxi ∈ S and x′
i ∈ S′ be such thatd(xi , x′
i ) → d. Since Hn is
compact, on a subsequencexi → x ∈ S and x′
i → x′ ∈ S′. By hypothesis
x ̸= x′ and hence x , x′ ∈ Hn since d < ∞. Therefore d > 0.
Let γ be the line passing throughx and x′. The segment betweenx
and x′ has lengthd(x , x′) = d. The line is orthogonal toS and S′: if it had
an angle smaller thanπ
2 with S′ we could ﬁnd another pointx′′ ∈ S′ near
x′ with d(x , x′′) < d . We can draw S, S′, γ as in Figure 2.12 by placing
the origin betweenx and x′: no other line can be orthogonal to bothS
and S′. □
Two subspaces of type (1), (2) or (3) are called respectivelyincident,
asymptotically parallel, andultra-parallel.
2.2.5. The conformal sphere at inﬁnity.The sphere at inﬁnity∂Hn
has no metric structure, but it has instead aconformal structure, that is a
Riemannian structure considered up to conformal transformations. Before
deﬁning it we note the following.


## Page 70

62 2. HYPERBOLIC SPACE
Proposition 2.2.4. Every isometry ϕ: Hn → Hn extends to a unique
homeomorphism ϕ : Hn → Hn. An isometry ϕ is determined by its trace
ϕ|∂Hn at the boundary.
Proof. The extension ofϕ to ∂Hn is deﬁned intrinsically: a boundary
point is a class[γ] of geodesic half-lines and we setϕ([γ]) = [ ϕ(γ)].
To prove the second assertion we show that an isometryϕ that ﬁxes
the points at inﬁnity is the identity. The isometryϕ ﬁxes every line as a set
(because it ﬁxes its endpoints), and since every point is the intersection of
two lines it ﬁxes also every point. □
We give ∂Hn the conformal structure of the sphere∂D n. The group
Isom(Hn) is generated by sphere inversions, which act conformally: al-
though the metric tensor of∂D n is not preserved by this action, its con-
formal class is preserved and hence the conformal structure on∂Hn is
well-deﬁned.
2.2.6. Elliptic,parabolic,andhyperbolicisometries. Itisconvenient
to classify the isometries ofHn into three types.
Proposition 2.2.5. Let ϕ be a non-trivial isometry ofHn. Precisely
one of the following holds:
(1) ϕ has at least one ﬁxed point inHn,
(2) ϕ has no ﬁxed points inHn and has exactly one in∂Hn,
(3) ϕ has no ﬁxed points inHn and has exactly two in∂Hn.
Proof. The extension ϕ : Hn → Hn is continuous and has a ﬁxed
point by Brouwer’s Theorem. We only need to prove that ifϕ has three
ﬁxed points P1, P2, P3 at the boundary then it has some ﬁxed point in the
interior. The isometryϕ ﬁxes the liner with endpoints P1 and P2. There
is only one line s with endpoint P3 and orthogonal to r (exercise): the
isometry ϕ must also ﬁxs and hence ﬁxes the pointr ∩ s. □
Isometries of type (1), (2), and (3) are called respectivelyelliptic,
parabolic, and hyperbolic. A hyperbolic isometry ﬁxes two pointsp, q ∈
∂Hn and hence preserves the unique linel with endpointsp and q. The line
l is theaxis of the hyperbolic isometry, which acts onl as a translation.
2.2.7. Horospheres. Parabolic transformations are related to some
objects in Hn called horospheres.
Deﬁnition 2.2.6. Let p be a point in∂Hn. A horosphere centred in
p is a connected complete hypersurface orthogonal to all the lines exiting
from p.
Horospheres may be easily visualised in the half-space modelHn by
sending p atinﬁnity. Thelinesexitingfrom p aretheEuclideanverticallines
and the horospheres centred atp are precisely the horizontal hyperplanes
{xn = k} with k > 0.


## Page 71

2.2. COMPACTIFICATION AND ISOMETRIES OF HYPERBOLIC SPACE 63
Figure 2.13. A horocycle in H2 centred in p ∈ ∂H2 is a
circle tangent to p. It is orthogonal to all the lines exiting
from p.
Remark 2.2.7. Since the metric tensorg = 1
x2n
gE is constant on each
hyperplane {xn = k}, each horosphere isisometric to the EuclideanRn.
The horospheres centred atp ̸= ∞ in ∂H n or at any pointp ∈ ∂D n
are precisely the Euclidean spheres tangent inp to the sphere at inﬁnity.
The horospheres in H2 are circles and are calledhorocycles, see Figure
2.13. The portion ofHn delimited by a horosphere is called ahoroball.
Let us go back to the isometries ofHn. We sometimes write a point
in the half-spaceHn as a pair(x , t) with x ∈ Rn−1 and t > 0. Isometries
with nice ﬁxed points have nice expressions in the conformal models.
Proposition 2.2.8. Let ϕ be an isometry ofHn:
(1) if ϕ is elliptic with ﬁxed point0 ∈ Dn then
ϕ(x) = Ax
for some matrixA ∈ O(n);
(2) if ϕ is parabolic with ﬁxed point∞ in Hn then
ϕ(x , t) = ( Ax + b, t)
for some matrixA ∈ O(n − 1) and some vectorb;
(3) if ϕ is hyperbolic with ﬁxed points0 and ∞ in Hn then
ϕ(x , t) = λ(Ax , t)
for some matrixA ∈ O(n − 1) and some positive scalarλ ̸= 1.
Proof. Point (1) is obvious. In (2) the isometryϕ ﬁxes ∞ and hence
permutes the horospheres centred at∞: we ﬁrst prove that this permu-
tation is trivial. The mapϕ sends a horosphereO0 at height t = t0 to a
horosphere O1 at some heightt = t1. If t1 ̸= t0, up to changingϕ with
its inverse we may suppose thatt1 < t 0.


## Page 72

64 2. HYPERBOLIC SPACE
We know that the mapψ : O1 → O0 sending (x , t1) to (x , t0) is a
contraction: hence ϕ ◦ ψ : O1 → O1 is a contraction and thus has a ﬁxed
point (x , t1). Therefore ϕ(x , t0) = ( x , t1). Since ϕ(∞) = ∞, the vertical
geodesic passing through(x , t0) and (x , t1) is preserved byϕ, and hence
we have found another ﬁxed point(x ,0) ∈ ∂Hn, a contradiction.
We now know thatϕ preserves the horosphereO at heightt, for allt.
The metric tensor onO is Euclidean (rescaled by1
t2), hence ϕ acts on O
like an isometryx ↦→ Ax + b. Since ϕ sends vertical geodesics to vertical
geodesics, it acts with the same formula on each horosphere and we are
done.
Concerning (3), the axis l of ϕ is the vertical line with endpoints
0 = (0 , 0) and ∞, and ϕ acts on l by translations: hence it sends(0, 1)
to some (0, λ). The diﬀerential d ϕ at (0, 1) is necessarily
(A 0
0 λ
)
for some
A ∈ O(n−1)and henceϕis globally as stated. The caseλ = 1 is excluded
because (0, 1) would be a ﬁxed point inHn. □
The minimum displacement d = d(ϕ) of an isometryϕ of Hn is
d(ϕ) = inf
x∈Hn d
(
x , ϕ(x)
)
.
A point x realises the minimum displacement ifd(x , ϕ(x)) = d(ϕ).
Corollary 2.2.9. The following hold:
(1) anelliptictransformation ϕhas d = 0 realisedonitsﬁxedpoints;
(2) a parabolic transformationϕwith ﬁxed pointp ∈ ∂Hn has d = 0
realised nowhere and ﬁxes every horosphere centred inp;
(3) a hyperbolic transformationϕ with ﬁxed pointsp, q ∈ ∂Hn has
d > 0 realised on its axis.
Proof. Point (1) is obvious. Point (2) was already noticed while prov-
ing Proposition 2.2.8. Concerning (3), letl be the axis of the hyperbolic
transformation ϕ. The hyperplane orthogonal to l at a point x ∈ l is
sent to the hyperplane orthogonal tol in ϕ(x). The two hyerplanes are
ultraparallel and by Proposition 2.2.3 their minimum distance is realised
at the points x and ϕ(x). Hence the points on l realise the minimum
displacement for ϕ. □
2.3. Isometry groups in dimensions two and three
Withthehyperboloidmodeltheisometrygroup Isom(Hn)isthematrix
group O+(n, 1). We now see that in dimensionsn = 2 and 3 the group
Isom+(Hn) is also isomorphic to some familiar groups of2 × 2 matrices.
We start with a concise tour on Möbius transformations.
2.3.1. Möbius transformations.Let theRiemann spherebe S = C∪
{∞}, homeomorphic toS2. Consider the group
PSL2(C) = SL 2(C)/±I = GL2(C)/{λI} = PGL2(C)


## Page 73

2.3. ISOMETRY GROUPS IN DIMENSIONS TWO AND THREE 65
of all2 × 2 invertible complex matrices considered up to scalar multiplica-
tion. The group PSL2(C) acts on S as follows: a matrix
(a b
c d
)
∈ PSL2(C)
determines theMöbius transformation
z ↦→ az + b
cz + d
which is an orientation-preserving self-diﬀeomorphism ofS, and in fact
also a biolomorphism.
Exercise 2.3.1. Möbius transformations act freely and transitively on
triples of distinct points inS.
Amatrix
(a b
c d
)
∈ PSL2(C)alsodeterminesa Möbiusanti-transformation
z ↦→ a¯z + b
c ¯z + d
which is an orientation-reversing self-diﬀeomorphism ofS. The compo-
sition of two anti-transformations is a Möbius transformation. Transfor-
mations and anti-transformations together form a groupConf(S) which
contains the Möbius transformations as an index-two subgroup.
Proposition2.3.2. CircleinversionsandlinereﬂectionsarebothMöbius
anti-transformations and generateConf(S).
Proof. By conjugating with translationsz ↦→ z + b and complex dila-
tions z ↦→ az every circle inversion transforms into the inversion along the
unit circle z ↦→ 1
¯z, and every line reﬂection transforms intoz ↦→ ¯z.
Bycomposinglinereﬂectionswegetalltranslationsandrotations, and
by composing circle inversions we get all dilations. With these operations
and the inversionz ↦→ 1
¯z one can easily act transitively on triples of points.
They generate Conf(S) by Exercise 2.3.1. □
2.3.2. Möbius transformations of H2. We consider the half-plane
H2 ⊂ C as H2 = {z | ℑ z > 0} and denote byConf(H2) the subgroup of
Conf(S) consisting of all maps that preserveH2.
Remark2.3.3. Bystandardresultsincomplexanalysis, thetwogroups
Conf(S)and Conf(H2)contain precisely all the conformal diﬀeomorphisms
of S and H2, whence their names. We will not use this fact here.
Proposition 2.3.4. The maps inConf(H2) are of the form
z ↦→ az + b
cz + d and z ↦→ a¯z + b
c ¯z + d
with a, b, c, d ∈ R and having ad − bc equal to 1 and −1, respectively.
Proof. The transformations listed have real coeﬃcients and hence
preserve the lineR ∪ ∞ and permute the two half-planes inC \ R. The
sign condition onad − bc = ±1 ensures precisely thati is sent to some
point in H2 and hence H2 is preserved.


## Page 74

66 2. HYPERBOLIC SPACE
On the other hand, a transformation that preservesH2 must preserve
∂H 2 = R ∪ ∞ and it is easy to see that since the images of0, 1, ∞ are
real all the coeﬃcientsa, b, c, d can be taken inR. □
The Möbius transformations inConf(H2) form a subgroup of index
two which is naturally isomorphic to
PSL2(R) = SL 2(R)/±I.
An ordered triple of distinct points inR ∪ ∞ is positive if they are
oriented counterclockwise, like0, 1, ∞.
Exercise 2.3.5. The group PSL2(R) acts freely and transitively on
positive triples of points inR ∪ ∞.
Let C ⊂ C be a circle or line orthogonal to R. The inversion or
reﬂection along C preserves H2 and is hence an element ofConf(H2).
Proposition 2.3.6. Inversions along circles and reﬂections along lines
orthogonal to R generate Conf(H2).
Proof. Composingreﬂectionsweobtainallhorizontaltranslations z ↦→
z + b with b ∈ R, composing inversions we obtain all dilationsz ↦→ λz with
λ ∈ R∗. These maps together with the inversionz ↦→ 1
¯z act transitively on
positive triples of points inR ∪ ∞. □
Exercise 2.3.7. The inversion sendingH2 to D2 is
z ↦→ ¯z + i
i ¯z + 1 .
2.3.3. Isometries of H2. After this short detour on Möbius transfor-
mations, we turn back to our hyperbolic spaces. We can characterise the
isometry group ofH2.
Proposition 2.3.8. We haveIsom(H2) = Conf( H2).
Proof. Both groups are generated by inversions along circles and re-
ﬂections along lines orthogonal to ∂H 2 = R by Propositions 2.1.29 and
2.3.6. □
In particular we have
Isom+(H2) = PSL2(R).
We will henceforth identify these two groups. The trace of an element in
PSL2(R) is well-deﬁned up to sign and carries some relevant information:
Proposition 2.3.9. A non-trivial isometryA ∈ PSL2(R) is elliptic, par-
abolic, hyperbolic ⇐ ⇒respectively |trA| < 2, |trA| = 2, |trA| > 2.


## Page 75

2.3. ISOMETRY GROUPS IN DIMENSIONS TWO AND THREE 67
Proof. Take A =
(a b
c d
)
with det A = ad − bc = 1. The Möbius
transformation z ↦→ az+b
cz +d has a ﬁxed pointz ∈ C if and only if
az + b
cz + d = z ⇐ ⇒cz 2 + (d − a)z − b = 0.
We ﬁnd
∆ = ( d − a)2 + 4bc = (d + a)2 − 4 = tr 2A − 4.
There is a ﬁxed point inH2 if and only if∆ < 0; if∆ > 0 we ﬁnd two ﬁxed
points in R ∪ {∞} and if ∆ = 0 only one. □
2.3.4. Isometriesof H3. Wehaveprovedthat Isom+(H2) = PSL2(R).
Quite surprisingly, the isometry groupIsom+(H3) is also isomorphic to a
group of 2 × 2 matrices! To prove this, we make the following identiﬁca-
tions:
R3 = C × R = {(z , t) | z ∈ C, t ∈ R}
hence H3 = {(z , t) | t > 0}. We also writeC for C × {0}. The boundary
trace of an isometry ofH3 is a homeomorphism of the Riemann sphere
∂H 3 = C ∪ {∞} = S.
Proposition 2.3.10. The boundary trace induces an identiﬁcation
Isom(H3) = Conf( S).
Proof. The group Isom(H3) is generated by inversions along spheres
and reﬂections along planes orthogonal to∂H 3. Their traces are inversions
along circles and reﬂections along lines inS. These generateConf(S). □
In particular we have
Isom+(H3) = PSL2(C).
Wewillalsohenceforthidentifythesetwogroups. Asabove, thetraceofan
element inPSL2(C)is well-deﬁned up to sign and carries some information:
Proposition 2.3.11. A non-trivial isometry A ∈ PSL2(C) is elliptic,
parabolic, hyperbolic if and only if respectivelytrA ∈ (−2, 2), trA = ±2,
trA ∈ C \ [−2, 2].
Proof. Every non-trivial matrixA ∈ SL2(C) is conjugate to one of:
±
(1 1
0 1
)
,
(λ 0
0 λ−1
)
for some λ ∈ C∗, and these represent the following isometries:
(z , t) ↦− →(z + 1, t), (z , t) ↦− →(λ2z ,|λ|2t).
In the ﬁrst casetrA = ±2 and A is parabolic with ﬁxed point∞, in the
second case A has a ﬁxed point inH3 if and only if|λ| = 1, i.e. trA =
λ + λ−1 ∈ (−2, 2), the ﬁxed point being(0, 1). If |λ| ̸ = 1 there are two
ﬁxed points 0 and ∞ at inﬁnity and henceA is hyperbolic. □


## Page 76

68 2. HYPERBOLIC SPACE
Summing up, we have
Isom+(H2) = PSL2(R), Isom+(H3) = PSL2(C).
The groupPSL2(R) acts directly onH2, whilePSL2(C) acts on the bound-
ary sphere ofH3.
2.4. Geometry of hyperbolic space
We study the geometry ofHn. We prove thatHn has constant sec-
tional curvature −1, that the distance function along lines is convex, we
deﬁne convex combinations and barycenters, and study parallel transport
along lines. Finally, we prove thatIsom(Hn) is a unimodular Lie group.
2.4.1. Area and curvature.We can verify thatHn has constant sec-
tional curvature −1. It should be no surprise thatHn has constant cur-
vature, since it has many symmetries (i.e. isometries). To calculate its
sectional curvature we compute the area of a disc.
Proposition 2.4.1. The disc of radiusr in H2 has area
A(r ) = π
(
e
r
2 − e− r
2
)2
= 4π sinh2 r
2 = 2π(cosh r − 1).
Proof. Recall that the volume form is
ω =
√
det g · d x1 · · · d xn.
Let D(r ) be a disc inH2 of radiusr. If we centre it in0 in the disc model,
its Euclidean radius istanh r
2 by Corollary 2.1.26 and we get
A(r ) =
∫
D(r)
√
det g · d x d y=
∫
D(r)
( 2
1 − x 2 − y 2
)2
d x d y
=
∫ 2π
0
∫ tanh r
2
0
( 2
1 − ρ2
)2
ρ · d ρd θ= 2π
[ 2
1 − ρ2
]tanh r
2
0
= 4π
(
1
1 − tanh2 r
2
− 1
)
= 4π sinh2 r
2 .
The proof is complete. □
Corollary 2.4.2.The hyperbolic spaceHn has sectional curvature−1.
Proof. Pick p ∈ Hn and W ⊂ Tp a 2-dimensional subspace. The
image expp(W ) is the hyperbolic plane tangent toW in p. On a hyperbolic
plane
A(r ) = 2 π(cosh r − 1) = 2 π
(r 2
2! + r 4
4! + o(r 4)
)
= πr 2 + πr 4
12 + o(r 4)
and hence K = −1 following the area formula in Section 1.2.8. □


## Page 77

2.4. GEOMETRY OF HYPERBOLIC SPACE 69
Figure 2.14. Distance between points in disjoint lines is a
strictly convex function in hyperbolic space.
2.4.2. Convexity of the distance function.We recall that a function
f : Rn → R is strictly convexif
f (tv + (1 − t)w ) < tf (v) + (1 − t)f (w )
for any pairv , w ∈ Rn of distinct points and anyt ∈ (0, 1).
Exercise 2.4.3. A positive strictly convex function is continuous and
admits a minimum if and only if it is proper.
We now prove that the distance function is strictly convex on disjoint
lines ofHn. Given two linesl , l′ ⊂ Hn, we ﬁx an isometry of each line with
R and we get an identiﬁcation ofl × l′ with the Euclidean planeR × R.
Proposition 2.4.4. Let l , l′ ⊂ Hn be two disjoint lines. The map
l × l′ − →R⩾0
(x , y) ↦− →d(x , y)
is strictly convex; it is proper if and only if the lines are ultraparallel.
Proof. With our identiﬁcations we have(x , y) ∈ R × R. The function
d is clearly continuous, hence to prove its convexity it suﬃces to show that
d
(x1 + x2
2 , y1 + y2
2
)
< d(x1, y1) + d(x2, y2)
2
for any pair of distinct points(x1, y1), (x2, y2) ∈ l × l′. Suppose x1 ̸= x2
and denote bym and n the midpoints x1+x2
2 and y1+y2
2 as in Figure 2.14.
Let σp bethereﬂectionatthepoint p ∈ Hn. Theisometry τ = σn ◦σm
translates the liner containing the segmentmn by the quantity2d(m, n):
hence it is a hyperbolic transformation with axisr. We draw the points
o = τ(m) and zi = τ(xi ) in the ﬁgure and note thatz1 = σn(x2), hence
d(x2, y2) = d(z1, y1). The triangular inequality implies that
d(x1, z1) ⩽ d(x1, y1) + d(y1, z1) = d(x1, y1) + d(x2, y2).


## Page 78

70 2. HYPERBOLIC SPACE
A hyperbolic transformation has minimum displacement on its axisr and
x1 ̸= m is not inr, hence
2d(m, n) = d(m, o) = d(m, τ(m)) < d (x1, τ(x1)) = d(x1, z1).
Finally we get2d(m, n) < d (x1, y1) + d(x2, y2) and hence d is convex.
The function d is proper, that is it has minimum, if and only if the
two lines are ultraparallel by Proposition 2.2.3. □
Exercise 2.4.5. The distance function on parallel lines inRn is not
strictly convex (it is only convex).
2.4.3. Convex combinations. Let p1, . . . , pk be k points in Hn, Rn,
or Sn and t1, . . . , tk be non-negative numbers witht1 + . . . + tk = 1. The
convex combination
p = t1p1 + . . . + tk pk
is another point in the space deﬁned as follows:
in Rn : p = t1p1 + . . . + tk pk
in In, Sn : p = t1p1 + . . . + tk pk
∥t1p1 + . . . + tk pk ∥
where ∥v ∥ =
√
−⟨v , v⟩ on In. Using convex combination we may deﬁne
the barycenter of the points as1
k p1 + . . . + 1
k pk. The barycenter may in
turn be used to prove the following.
Proposition 2.4.6. Let ϕ: Hn → Hn be a non-trivial isometry and
k ⩾ 2. Then:
• if ϕ is elliptic thenϕk is elliptic or trivial;
• if ϕ is parabolic thenϕk is parabolic;
• if ϕ is hyperbolic thenϕk is hyperbolic.
Proof. If ϕ: Hn → Hn is an isometry with no ﬁxed points, thenϕk
also is: ifϕk(x) = x then ϕ ﬁxes the ﬁnite set{x , ϕ(x), . . . , ϕk−1(x)} and
hence also its barycenter.
If ϕisparabolicthenitﬁxesthehorospherescentredatsomepoint p ∈
∂Hn and also ϕk does, hence it is still parabolic (it cannot be hyperbolic).
If ϕ is hyperbolic it has two ﬁxed points at inﬁnity, andϕk too. □
Proposition2.4.7. Everyﬁnitesubgroup Γ < Isom(Hn)ﬁxesa p ∈ Hn.
Proof. The barycenter of any orbit is ﬁxed byΓ. □
2.4.4. Paralleltransport. OnRiemannianmanifolds,theparalleltrans-
port is a way to slide frames along geodesics. OnHn we can do this simply
as follows: for every geodesic γ, we put γ into vertical position in the
half-space model Hn, and slide the frames vertically in the obvious way.
This construction furnishes in particular, for every pairx , y ∈ Hn of
points, a canonical isometry betweenTx Hn and Ty Hn, obtained by sliding
frames along the unique geodesicγ containing x and y.


## Page 79

2.4. GEOMETRY OF HYPERBOLIC SPACE 71
This canonical identiﬁcation is of course not transitive on a triple of
non-collinear points x , y , z: the curvature ofHn is responsible for that.
2.4.5. Unimodularity. This is a consequence of Corollary 1.4.16.
Corollary 2.4.8. The isometry groupIsom(Hn) is unimodular.
Remark 2.4.9. A Haar measure for Isom(Hn) may be constructed
concretely as follows: ﬁx a point x ∈ Hn and deﬁne the measure of a
Borel set S ⊂ Isom(Hn) as the measure ofS(x) = ∪ϕ∈Sϕ(x) ⊂ Hn. This
measure is obviously left-invariant, and is hence also right-invariant since
Isom(Hn) is unimodular. As a consequence, it does not depend on the
choice of x.
2.4.6. References. Thehyperbolicspaceisintroducedinmanybooks:
two standard references are Benedetti – Petronio [4] and Ratcliﬀe [49],
and most of the arguments presented here were borrowed from these two
sources. The proof of Proposition 2.4.4 was taken from Farb – Margalit
[18]. Thurston’s notes contain some useful trigonometric formulae that
we have omitted, see [56, Chapter 2].


## Page 80

[No extractable text on this page]


## Page 81

CHAPTER 3
Hyperbolic manifolds
A hyperbolic manifold is a Riemannian manifold locally isometric to
the hyperbolic space Hn. Maybe the most striking aspect of geometric
topology is that, despite this quite restrictive deﬁnition, there are plenty of
hyperbolic manifolds around, especially in the dimensionsn = 2 and 3. For
that reason hyperbolic manifolds (and hence hyperbolic geometry) play a
central role in the topology of surfaces and three-manifolds.
The study of complete hyperbolic manifolds is tightly connected to
that of discrete subgroups in the Lie groupIsom(Hn) and of polyhedra in
Hn, soithasbothanalgebraicandgeometricﬂavour. Westartthischapter
by describing these connections; then we show some examples and discuss
some important variations: non-complete hyperbolic manifolds, hyperbolic
manifolds with geodesic boundary, cone manifolds, and orbifolds.
3.1. Discrete groups of isometries
We deﬁne hyperbolic manifolds and prove a crucial theorem, that says
that every complete hyperbolic manifold is isometric to a quotientHn/Γ
for some discrete groupΓ < Isom(Hn) acting freely onHn.
3.1.1. Hyperbolic, ﬂat, and elliptic manifolds.We introduce three
important classes of Riemannian manifolds.
Deﬁnition 3.1.1. Ahyperbolic (resp.ﬂat orelliptic)manifold is a con-
nected Riemanniann-manifold that may be covered by open sets isometric
to open sets ofHn (resp. Rn o Sn).
A hyperbolic (resp. ﬂat or elliptic) manifold has constant sectional
curvature −1 (resp. 0 or +1). We show that the model Hn is indeed
unique.
Theorem 3.1.2.Every complete simply connected hyperbolic manifold
M is isometric toHn.
Proof. Pick a point x ∈ M and choose an isometryD : U → V be-
tween an open ballU containing x and an open ballV ⊂ Hn. We show
that D extends (uniquely) to an isometryD : M → Hn.
For every y ∈ M, choose an arc α: [0 , 1] → M from x to y. By
compactness there is a partition0 = t0 < t 1 < . . . < t k = 1 and for
73


## Page 82

74 3. HYPERBOLIC MANIFOLDS
each i = 0, . . . , k − 1 an isometry Di : Ui → Vi from an open ballUi in M
containing α([ti , ti+1]) to an open ballVi ⊂ Hn.
We may suppose that U0 ⊂ U and D0 = D|U0. Inductively on i,
we now modifyDi so that Di−1 and Di coincide on the componentC of
Ui−1 ∩ Ui containing α(ti ). To do so, note that
Di−1 ◦ D−1
i : Di (C) − →Di−1(C)
is an isometry of open connected sets in Hn and hence extends to an
isometry of Hn. Then it makes sense to compose Di with Di−1 ◦ D−1
i ,
so that the new maps Di−1 and Di coincide on C. Finally, we deﬁne
D(y) = Dk−1(y).
The proof thatD(y) is well-deﬁned is a standard argument. First, it
is easy to check that diﬀerent partitions0 = t0 < . . . < t k = 1 do not
vary D(y), just by considering a common reﬁnement. Then we consider
another path β connecting x to y. Since M is simply-connected, there is
a homotopy connectingα and β. The image of the homotopy is compact
and is hence covered by ﬁnitely many open ballsUi isometric to open balls
Vi ⊂ Hn via some maps Di. By the Lebesgue number theorem, there is
a N > 0 such that in the grid in[0, 1] × [0, 1] of 1
N × 1
N squares, the
image of every square is entirely contained in at least oneUi. We can now
modify as above the isometriesDi inductively on the grid, starting from
the bottom-left square, so that they all glue up and show thatD(y) does
not depend onα or β.
The resulting map D : M → Hn is a local isometry by construction.
Since M is complete, the map D is a covering by Proposition 1.2.19.
Since Hn is simply connected, the coveringD is a homeomorphism andD
is actually an isometry. □
The isometry D : M → Hn constructed in the proof is called adevel-
oping map. The same proof shows that every complete simply connected
ﬂat (or elliptic) n-manifold is isometric toRn (or Sn).
3.1.2. Completehyperbolicmanifolds. Wehavedeterminedtheunique
complete simply connected hyperbolic n-manifold, and we now look at
complete hyperbolic manifolds with arbitrary fundamental group. We ﬁrst
note that if Γ < Isom(Hn) is a group of isometries that acts freely and
properly discontinuously onHn, the quotient manifoldHn/Γ has a natural
Riemannian structure that promotes the covering
π : Hn − →Hn/Γ
to a local isometry, see Proposition 1.5.9. The quotientHn/Γ is a com-
plete hyperbolic manifold. We now show that every complete hyperbolic
manifold is realised in this way:
Proposition 3.1.3.Every complete hyperbolicn-manifold M is isomet-
ric to Hn/Γ for some subgroup Γ < Isom(Hn) acting freely and properly
discontinuously.


## Page 83

3.1. DISCRETE GROUPS OF ISOMETRIES 75
Proof. The universal cover ofM inherits a Riemannian structure that
is complete (by Proposition 1.2.19), hyperbolic, and simply connected:
hence it is isometric to Hn by Theorem 3.1.2. The deck transforma-
tions Γ of the coveringHn → M are necessarily locally isometries, hence
isometries. We conclude that M = Hn/Γ and Γ acts freely and properly
discontinuously using Proposition 1.5.1. □
Note that Γ is isomorphic to the fundamental groupπ1(M).
Remark 3.1.4. A groupΓ < Isom(Hn) acts freely if and only if it does
not contain elliptic isometries: that is, every non-trivial isometry inΓ is
either hyperbolic or parabolic.
Note also thatΓ acts properly discontinuously if and only if it is dis-
crete, see Proposition 1.5.8.
Remark 3.1.5. The same proofs show that every complete ﬂat or
spherical n-manifold is isometric toRn/Γ or Sn/Γ for some discrete group
Γ of isometries acting freely onRn or Sn.
Corollary 3.1.6. There is a natural 1-1 correspondence



complete hyperbolic
manifolds M
up to isometry


 ← →



discrete subgroups Γ < Isom(Hn)
without elliptics
up to conjugation



Proof. When passing from the complete hyperbolic manifoldM to
the groupΓ, the only choice we made is an isometry between the universal
cover of M and Hn. Diﬀerent choices produce conjugate groupsΓ. □
3.1.3. Discrete groups. We investigate some basic properties of dis-
crete groups Γ of isometries ofHn.
Exercise 3.1.7. If Γ < Isom(Hn) is discrete then it is countable.
Note thatΓis not necessarily ﬁnitely generated. We denote byΓp < Γ
the stabiliser of a pointp ∈ Hn.
Proposition 3.1.8. Let Γ < Isom(Hn) be discrete andp ∈ Hn a point.
The stabiliser Γp is ﬁnite and the orbitΓ(p) = {g(p) | g ∈ Γ} is discrete.
Proof. Both are obvious consequence of the fact thatΓ acts properly
discontinuously. □
Of courseΓ acts freely onHn if and only ifΓp is trivial for allp ∈ Hn.
A set of subspaces inHn is locally ﬁnite if every compact subset inHn
intersects only ﬁnitely many of them.
Proposition 3.1.9. Let Γ < Isom(Hn) be discrete. The pointsp ∈ Hn
with trivial stabiliserΓp form an open dense set inHn.


## Page 84

76 3. HYPERBOLIC MANIFOLDS
Proof. The ﬁxed-points set Fix(g) of a non-trivial isometry g is a
proper subspace ofHn. The subspacesFix(g) with g ∈ Γ are locally ﬁnite:
if inﬁnitely many of them intersect a compact set they accumulate andΓ
does not act properly discontinuously. The complement of a locally ﬁnite
set of proper subspaces is open and dense. □
Recall that a grouphas no torsion if every non-trivial element has
inﬁnite order.
Proposition 3.1.10. A discrete groupΓ < Isom(Hn) acts freely onHn
if and only if it has no torsion.
Proof. By Proposition 2.4.6 parabolic and hyperbolic elements have
inﬁnite order. On the other hand, an elliptic elementg ∈ Γ has ﬁnite order
since Γp is ﬁnite forp ∈ Fix(g). □
Corollary 3.1.11. The fundamental group of a complete hyperbolic
manifold has no torsion.
It is now time to exhibit some examples. Recall thatH2 is the half-
plane model, see Section 2.3.
Example 3.1.12. Themodular group
Γ = PSL2(Z) < PSL2(R) = Isom +(H2)
consists of all matrices inPSL2(R) having integer entries and is clearly a
discrete subgroup. It does not act freely onH2, however: the matrix
(0 1
−1 0
)
represents the elliptic transformationz ↦→ − 1
z with ﬁxed pointi.
3.1.4. Coverings. We now make a simple but crucial observation: if
Γ < Isom(Hn) acts freely and properly discontinuously, then also every
subgroup Γ′ < Γ does; we get a manifolds covering
Hn/Γ′ − →Hn/Γ
whose degree d is precisely the index ofΓ′ in Γ. Recall from Proposition
1.2.20 that we get
Vol
(
Hn/Γ′
)
= d · Vol
(
Hn/Γ
)
where some of the terms in the formula may be inﬁnite. Moreover, every
covering of a hyperbolic completeM = Hn/Γ is constructed in this way:
there is a nice bijective correspondence
{
coverings of M
}
← →
{
subgroups of Γ
}
.
This holds of course also for ﬂat and spherical manifolds.


## Page 85

3.1. DISCRETE GROUPS OF ISOMETRIES 77
3.1.5. Congruence subgroups. We can now exhibit a family of two-
dimensional hyperbolic manifolds.
Pick an integerm ⩾ 2. Let SL2(Z/mZ) be the group of2 × 2 matrices
with coeﬃcients inZ/mZ and determinant 1. We deﬁne the quotient
PSL2(Z/mZ) = SL 2(Z/mZ)/{±I}.
The reduction modulo m homomorphism Z → Z/mZ induces the group
homomorphisms SL2(Z) → SL2(Z/mZ) and
PSL2(Z) − →PSL2(Z/mZ).
The kernel of this homomorphism is theprincipal congruence subgroup
Γ(m) of PSL2(Z). It is clearly discrete, since PSL2(Z) is. It has ﬁnite
index in PSL2(Z) because PSL2(Z/mZ) is ﬁnite.
Proposition 3.1.13. If m ⩾ 4 the group Γ(m) acts freely onH2.
Proof. An element A ∈ Γ(m) is a matrix
(a b
c d
)
congruent to
(1 0
0 1
)
modulo m. In particular a + d is congruent to 2 modulom, and hence is
not −1, 0, 1. Therefore A is never elliptic. □
The quotientH2/Γ(m) is a hyperbolic surface. We will construct many
hyperbolic surfaces in Section 6.2 via some more geometric methods.
3.1.6. Selberg’s lemma. The discrete groupΓ = PSL2(Z) does not
act freely onH2, but its ﬁnite-index normal subgroupΓ(m) does as soon
as m ⩾ 4. Is this the instance of a more general principle? Yes, it is.
Proposition 3.1.14. Every ﬁnitely generated discrete subgroup Γ <
Isom(Hn) has a ﬁnite-index normal subgroupΓ′ ◁ Γ that acts freely onHn.
Proof. The group Isom(Hn) is isomorphic to O+(n, 1) < GL(n +
1, C), so Selberg’s Lemma 1.4.19 applies toΓ, and it furnishes a ﬁnite-
index torsion-free normal subgroupΓ′ ◁ Γ. This subgroup acts freely by
Proposition 3.1.10. □
Every ﬁnitely generated discrete groupΓ < Isom(Hn)contains at least
one ﬁnite-index subgroup that acts freely. But how many such subgroups
does it contain? Quite a lot, in fact.
Proposition 3.1.15. Every ﬁnitely generated discrete subgroup Γ <
Isom(Hn) is residually ﬁnite.
Proof. See Lemma 1.4.20. □
The following corollary shows that there is an abundance of torsion-
free subgroups. Although algebraic in nature, it has some remarkable geo-
metric consequences, that will be revealed soon in Section 4.3.5.
Corollary 3.1.16.Let Γ < Isom(Hn)be discrete and ﬁnitely generated.
For every non-trivialg ∈ Γ there is a ﬁnite-index normal subgroupΓ′ ◁ Γ
that acts freely onHn and does not containg.


## Page 86

78 3. HYPERBOLIC MANIFOLDS
3.2. Polyhedra
A polyhedron inHn is a natural geometric object, that may be used to
visualise discrete groups inIsom(Hn) and hyperbolic manifolds. Polyhedra
may sometimes be combined to form some tessellations of the space.
3.2.1. Polyhedra. A half-space in Hn is the closure of one of the
two portions of space delimited by a hyperplane. We say that a set of
half-spaces is locally ﬁnite if their boundary hyperplanes are.
Deﬁnition 3.2.1. A n-dimensional polyhedron P in Hn is the inter-
section of a locally ﬁnite set of half-spaces. We also assume thatP has
non-empty interior.
A subset S ⊂ Hn is convex if x , y ∈ S implies that the segment
connecting x , y is also contained inS (such a segment is a half-line or a
line if one or both points lie in∂Hn). Every polyhedronP is clearly convex
because it is the intersection of convex sets. Its closureP in Hn is also
convex.
Let H ⊂ Hn be a half-space containing the polyhedronP. If non-
empty, the intersectionF = ∂H ∩ P is called aface of P. Thesupporting
subspace of F is the smallest subspace ofHn containing F; thedimension
of a face is the dimension of its supporting subspace. A face of dimension
0, 1, and n − 1 is called avertex, anedge, and afacet.
Exercise 3.2.2. If non-empty, the intersection of faces ofP is a face.
Exercise 3.2.3. Every k-dimensional face is a polyhedron in its sup-
porting k-dimensional space.
The convex hullof a setS ⊂ Hn is the intersection of all the convex
sets containing S.
Exercise 3.2.4. The convex hull of ﬁnitely many points inHn that are
not contained in a hyperplane is a compact polyhedron. Conversely, every
compact polyhedron has ﬁnitely many vertices and is the convex hull of
them.
Everything we said holds with no modiﬁcations forRn. On Sn some
care should be taken: some deﬁnitions need to be modiﬁed slightly to take
into account the annoying presence of antipodal points. We gloss over this
technical point.
3.2.2. Finite polyhedra. We now enlarge slightly the class of com-
pact polyhedra by admitting ﬁnitely many vertices at inﬁnity.
Deﬁnition 3.2.5. Aﬁnite polyhedronis the convex hull of ﬁnitely many
points x1, . . . , xk ∈ Hn thatarenotcontainedintheclosureofahyperplane.
The xi’sthatliein ∂Hn arecalled idealvertices, whiletheusualvertices
of P are theﬁnite oractual vertices. The ideal vertices form the setP \ P.


## Page 87

3.2. POLYHEDRA 79
Figure 3.1. The cone C over a domainD⊂ O has volume
proportionaltotheareaof D(left). Ifthedomainiscompact,
the cone has ﬁnite volume: therefore a ﬁnite polyhedron has
ﬁnite volume (right).
Exercise 3.2.6. A ﬁnite polyhedronP has ﬁnitely many faces and is
the convex hull of its ideal and ﬁnite vertices.
We want to estimate the volume of ﬁnite polyhedra, and to do this
we need a lemma. Given a horosphereO centred atp ∈ ∂Hn and a domain
D ⊂ O, thecone C of D over p is the union of all the half-lines exiting
from D and pointing towardsp, see Figure 3.1.
Lemma 3.2.7. Let O be a horosphere centred atp ∈ ∂Hn, D ⊂ O
any domain andC the cone overD. The following equality holds:
Vol(C) = VolO(D)
n − 1
where VolO is the (n − 1)-dimensional volume in the(n − 1)-manifold O.
Proof. Let O have some heightxn = h as in Figure 3.1. We get
Vol(C) =
∫
D
d x
∫ ∞
h
1
t n d t = 1
n − 1
∫
D
d x
hn−1 = 1
n − 1 · VolO(D).
The proof is complete. □
We now turn to ﬁnite polyhedra.
Proposition 3.2.8. Every ﬁnite polyhedron has ﬁnite volume.
Proof. For every ideal vertex ofP, a small horoball centred atp inter-
sects P into a cone that has ﬁnite volume. The polyhedronP decomposes
into ﬁnitely many cones and a bounded region, see Figure 3.1-(right).□
Aﬁnitepolyhedronwithoutﬁniteverticesiscalledan idealpolyhedron.


## Page 88

80 3. HYPERBOLIC MANIFOLDS
Figure 3.2. A triangle with at least an ideal vertex (left).
The area of a triangle with ﬁnite vertices can be derived as
the area diﬀerence of triangles with one ideal vertex (right).
3.2.3. Polygons. A polygon is just a polyhedron of dimension two. In
contrast with Euclidean geometry, a strikingly simple formula relates the
area of a ﬁnite polygon with its inner angles. We deﬁne the inner angle of
an ideal vertex to be zero.
Proposition 3.2.9. A polygonP with inner anglesα1, . . . , αn has area
Area(P ) = ( n − 2)π −
n∑
i=1
αi .
Proof. Every polygon decomposes into triangles, and it suﬃces to
prove the formula on these. Consider ﬁrst a triangleT with at least one
vertex at inﬁnity. We use the half-plane model and send this vertex to∞
as in Figure 3.2-(left). We suppose that the red dot is the origin ofR2, so
T =
{
(r cos θ, y ) | β ⩽ θ ⩽ π − α, y ⩾ r sin θ
}
and we get
Area(T ) =
∫
T
1
y 2 d x d y=
∫ β
π−α
∫ ∞
r sin θ
−r sin θ
y 2 d y d θ
=
∫ β
π−α
−r sin θ
[
− 1
y
]∞
r sin θ
d θ =
∫ π−α
β
r sin θ
r sin θ d θ
=
∫ π−α
β
1 = π − α − β.
The area of a triangle with ﬁnite verticesABC is deduced as in Figure
3.2-(right) using the formula
Area(ABC) = Area( AB∞) + Area(BC∞) − Area(AC∞).
The proof is complete. □
The sum of the inner angles of a hyperbolic polygon is strictly smaller
than that of a Euclidean polygon with the same number of sides, and the
diﬀerence between these two numbers is precisely its area.


## Page 89

3.2. POLYHEDRA 81
Figure 3.3. The regular icosahedron and dodecahedron.
Corollary 3.2.10. Every ideal triangle has areaπ.
3.2.4. Platonic solids. The theory of three-dimensional polyhedra in
H3 is very rich: we limit ourselves to the study of the platonic solids.
The ﬁve Euclidean platonic solids are the regular tetrahedron, the
cube, the regular octahedron, icosahedron, and dodecahedron. We now
see that each platonic solidP ⊂ R3 generates a nice continuous family of
solids in the three geometriesH3, R3, and S3.
To construct this family we ﬁx any pointx in H3 and represent P
centred at x with varying size. To do this, we putP inside the Euclidean
tangent space Tx H3 centred at the origin and with some radiust > 0.
Consider the image of its vertices by the exponential map and take their
convex hull. We indicate byP (−t) the resulting polyhedron inH3. The
polyhedron P (−t) is combinatorially equivalent to P and has the same
symmetries of P.
We extend this family to the other geometries as follows. The poly-
hedron P (0) is the Euclidean P (unique up to dilations), andP (t) with
t > 0 is the sphericalP, constructed as above withS3 instead of H3: we
ﬁx x ∈ S3, take a copy ofP inside Tx S3 with radiust, project its vertices,
and take the convex hull. We deﬁne the sphericalP (t) only fort ∈ (0, π
2 ]:
when t = π
2 it degenerates to a hemisphere. We also deﬁneP (−∞) as
the ideal hyperbolic platonic solid obtained by sending all the vertices at
inﬁnity.
We have deﬁned a polyhedronP (t) for all t ∈ [−∞, π
2 ], that lies in
H3, R3, S3 depending on whethert is negative, null, or positive. In some
sense the polyhedronP (t) depends continuously ont also when it crosses
the valuet = 0: when t → 0 the polyhedron inH3 or S3 shrinks, and every
polyhedron tends to a Euclidean one when shrunk.
In particular the dihedral angleθ(t) of P (t) varies continuously with
t ∈ [−∞, π
2 ]. Thefunction θ(t)isstrictlymonotoneandwenowdetermine
its image. Thevertex valenceof P is the number of edges at each vertex.


## Page 90

82 3. HYPERBOLIC MANIFOLDS
polyhedron θ = π
3 θ = 2π
5 θ = π
2 θ = 2π
3
tetrahedron ideal H3 S3 S3 S3
cube ideal H3 H3 R3 S3
octahedron ideal H3 S3
icosahedron H3
dodecahedron ideal H3 H3 H3 S3
Table 3.1. The platonic solids with dihedral angle θ that
divide 2π.
Proposition 3.2.11. Let P have vertex valencen ∈ {3, 4, 5}. Then
θ
([
−∞, π
2
])
=
[ n − 2
n π, π
]
.
Proof. Since θ is continuous and monotone increasing, it suﬃces to
show that θ(−∞) = n−2
n π and θ( π
2 ) = π.
By intersecting the ideal polyhedronP (−∞) with a small horosphere
O centredatanidealvertex v wegetaregular n-gonintheEuclideanplane
O, with interior anglesn−2
n π. The dihedral angle at an edgee incident to
v is measured by intersectingP (−∞) with any hypersurface orthogonal to
e: since O is orthogonal toe we get θ(−∞) = n−2
n π.
The polyhedron P ( π
2 ) is a hemisphere and henceθ( π
2 ) = π. □
For some values oft, the platonic solidP (t) may have nice dihedral
angles θ(t), for instance angles that divide2π. In the Euclidean world,
the only platonic solid with such nice dihedral angles is the cube. In the
hyperbolic and spherical world we ﬁnd more.
The platonic solids with dihedral angles that divide2π are listed in
Table3.1. ThetableisjustaconsequenceofProposition3.2.11: itsuﬃces
to know the Euclidean dihedral angles forP, and all the angles bigger
(smaller) than this value are spherical (hyperbolic).
In particular, there are four right-angled platonic solids: the spherical
tetrahedron, the Euclidean cube, the hyperbolic dodecahedron, and the
ideal hyperbolic octahedron.
3.3. Tessellations
A tessellation is a nice paving ofHn made of polyhedra. Not only
tessellations are beautiful objects, but they are also tightly connected with
discrete groups ofIsom(Hn) and hence with hyperbolic manifolds.
Deﬁnition 3.3.1. Atessellation of Hn (or Rn, Sn) is a locally ﬁnite set
of polyhedra that cover the space and intersect only in common faces.
Some examples in spherical and Euclidean space are shown in Figure
3.4. We now construct some families explicitly.


## Page 91

3.3. TESSELLATIONS 83
Figure 3.4. A tessellation ofS2 into squares, hexagons, and
decagons, and a tessellation ofR3 into truncated octahedra.
Figure 3.5. The tessellations(2, 3, 3), (2, 3, 4) and (2, 3, 5)
of the sphere.
3.3.1. Triangles. Wewanttodeﬁnesomenicetessellationsof H2, R2,
and S2 into triangles. The following exercise says that every triple of acute
angles is realised by some triangle in the appropriate geometry.
Exercise 3.3.2. Given three real numbers 0 < α, β, γ ⩽ π
2 there is
a triangle ∆ with inner angles α, β, γ inside H2, R2, or S2 depending on
whether the sumα + β + γ is smaller, equal, or bigger thanπ.
Let a, b, c ⩾ 2be three natural numbers and∆be a triangle with inner
angles π
a , π
b , π
c. The triangle∆ lies in H2, R2, orS2 depending on whether
1
a + 1
b + 1
c is smaller, equal, or bigger than 1. In all cases, by mirroring
iteratively ∆ along its edges we construct a tessellation of the space.
Thetriplesrealisablein S2 are (2, 2, c), (2, 3, 3), (2, 3, 4),and (2, 3, 5):
the last three tessellations are shown in Figure 3.5 and are connected to
the platonic solids. They consist of24, 48, and 120 triangles.
The triples realisable inR2 are (2, 3, 6), (2, 4, 4), and (3, 3, 3): the
tessellations are shown in Figure 3.6. There are inﬁnitely many triples
realisable in H2, and some are shown in Figure 3.7.


## Page 92

84 3. HYPERBOLIC MANIFOLDS
Figure3.6. Thetessellations (2, 3, 6), (2, 4, 4), and(3, 3, 3)
of the Euclidean plane.
Figure3.7. Thetessellations (2, 3, 7), (2, 4, 5), and(3, 3, 4)
of the hyperbolic plane.
In the hyperbolic plane we can also use triangles with vertices at in-
ﬁnity, which have inner angle zero by deﬁnition.
Exercise 3.3.3. Given three real numbers0 ⩽ α, β, γ ⩽ π
2 with sum
smaller than π there is a triangle∆ ⊂ H2 with inner anglesα, β, γ.
For any triple(a, b, c) of numbers in N ∪ {∞} with 1
a + 1
b + 1
c < 1
we may take the triangle∆ ⊂ H2 with inner angles π
a, π
b, π
c and reﬂect it
iteratively to get a tessellation ofH2.
Thetriple (∞, ∞, ∞)givesanicetessellationintoidealtrianglescalled
the Farey tessellationand shown in Figure 3.8.
3.3.2. Platonic solids. We now turn to tessellations of 3-dimensional
spaces. Table 3.1 displays a ﬁnite list of platonic solidsP with dihedral
angles 2π
k containedin H3, R3, orS3. Foreachsolidinthelist, byreﬂecting
iteratively P along its faces we get a tessellation of the space.
The Figures 3.9, 3.10, and 3.11 show the tessellations ofH3, H3, and
S3 by regular dodecahedra with dihedral anglesπ
2, π
3, and 2π
3 . The ﬁrst two
tessellations contain inﬁnitely many polyhedra and appear in the ﬁgures as
seen by an observer ﬂoating insideH3. The reader is invited to observe the
diﬀerences between the ﬁrst two tessellations of the hyperbolic space. The
third tessellation contains ﬁnitely many polyhedra and the ﬁgure shows its
stereographic projection inR3.


## Page 93

3.3. TESSELLATIONS 85
Figure 3.8. The Farey tessellation(∞,∞,∞) of the hyper-
bolic plane.
Figure 3.9. The tessellation ofH3 into right-angled regular
dodecahedra, seen from insideH3.
3.3.3. Regular tessellations. Platonic solids areregular, that is they
have many symmetries. A notion of regularity may be deﬁned in all dimen-
sions for polyhedra and tessellations as follows.
Every tessellation inHn, Rn, or Sn has a symmetry group, consisting
of all the isometries of the ambient space that preserve it. Aﬂag is a
sequence of faces f0 ⊂ . . . ⊂ fn of the tessellation with dim fi = i. A
tessellation isregular if the symmetry group acts transitively on ﬂags.


## Page 94

86 3. HYPERBOLIC MANIFOLDS
Figure 3.10. The tessellation of H3 into ideal regular do-
decahedra with dihedral angleπ
3, seen from insideH3. Note
that all vertices lie at inﬁnity.
These deﬁnitions apply also to polyhedra. We note that a regular
polyhedron in Rn, considered up to similarities, may be interpreted as a
regular tessellation inSn−1, and vice versa.
The Schläﬂi notation beautifully encodes various regular tessellations,
in all dimensions and in all geometries. The symbol{n}with n ⩾ 3denotes
the regularn-gon, that is a regular tessellation ofS1 by n congruent arcs,
and by extension {∞} denotes the regular tessellation ofR by inﬁnitely
many congruent segments.
The symbol {p, q} denotes a regular tessellation inH2, R2, or S2 by
p-gons where q of them meet at every vertex. The ﬁve platonic solids are
{3, 3}, {3, 4}, {3, 5}, {4, 3}, {5, 3},
the symbols {3, 6}, {4, 4}, and {6, 3} denote the two regular tessellations
of R2 into equilateral triangles, squares, and regular hexagons, and every
other pair{p, q} denotes a tessellation of regularp-gons inH2 with angles
2π
q , that meet at q at every vertex. We can also interpret{p, ∞} as a
regular tessellation ofH2 into ideal regularp-gons (the Farey tessellation
is {3, ∞}) and {∞, q} as a regular tessellation of∞-gons that meet atq
at every vertex, whose edges form aq-regular tree (a tree whereq edges
meet at every vertex). Finally {∞, ∞} is a regular tessellation of ideal
∞-gons. See Figure 3.12
The symbol{p, q, r } denotes a regular tessellation inH3, R3, or S3 by
polyhedra {p, q} where r of them meet at every edge. We deduce from


## Page 95

3.3. TESSELLATIONS 87
Figure 3.11. The tessellation ofS3 into 120 regular dodec-
ahedra with dihedral angle 2π
3 , transposed into R3 via the
stereographic projection, that transforms straight faces into
round ones but preserves the angles.
Figure 3.12. The tessellations ofH2 with Schläﬂi symbols
{4,∞},{∞, 4}, and{∞,∞}.
Table 3.1 that the regular tessellations ofS3 are
{3, 3, 3}, {3, 3, 4}, {3, 3, 5}, {3, 4, 3}, {4, 3, 3}, {5, 3, 3}.
These are the six regular polyhedra (usually calledpolytopes) in dimension
four: wewillencounterthemagaininChapter12.2.3. Thesymbol {4, 3, 4}


## Page 96

88 3. HYPERBOLIC MANIFOLDS
Figure 3.13. In the tessellation{6, 3, 3} of H3 every poly-
hedron has inﬁnitely many hexagonal faces, whose vertices
all lie in a single horosphere.
indicates the tessellation ofR3 into cubes, and
{3, 3, 6}, {3, 4, 4}, {3, 5, 3}, {4, 3, 5}, {4, 3, 6}, {5, 3, 4}, {5, 3, 5}, {5, 3, 6}
denote the tessellations ofH3 into platonic solids. It is also possible to
interpret more triples{p, q, r } in an appropriate way, sometimes by repre-
sentingtheverticesofthepolyhedraasspace-likevectorsinthehyperboloid
model.
Every regular tessellation has adual regular tessellation obtained by
taking the barycenters of all the cells involved. The dual of{a, b, . . . , z}
is {z , . . . , b, a}. Duals of ideal tessellations involve inﬁnite polyhedra: for
instance {6, 3, 3} is shown in Figure 3.13.
The story continues in four dimensions: we denote by{p, q, r, s } a
regular tessellation made of polytopes of type{p, q, r } that meet ins at
every codimension-two face. With the same techniques of Section 3.2.4
we can identify the regular polytopes inH4, R4 and S4 with dihedral angles
that divide2π, and the corresponding tessellations of the ambient space –
that we are unfortunately unable to see.
3.3.4. Voronoi tessellations. In the previous section we have con-
structed some tessellations by exploiting the symmetries of regular polyhe-
dra: we can probably extend these methods to less symmetric polyhedra,
but how far can we go? How can we construct highly non-regular tessel-
lations?


## Page 97

3.3. TESSELLATIONS 89
Figure 3.14. A Voronoi tessellation of the Euclidean plane.
There is a strikingly simple procedure that transforms every discrete
set S of points inHn into a tessellation, called theVoronoi tessellationof
S. The construction goes as follows.
For every pointp ∈ S we deﬁne
D(p) =
{
q ∈ Hn ⏐⏐ d(q, p) ⩽ d(q, p′) ∀p′ ∈ S
}
.
Proposition 3.3.4. The set D(p) is a polyhedron and the polyhedra
D(p) as p ∈ S varies form a tessellation ofHn.
Proof. It is an easy exercise to show that the points inHn having the
same distance from two distinct ﬁxed points form a hyperplane. For every
p′ ∈ S diﬀerent from p we deﬁne the half-space
Hp′ =
{
q ∈ Hn ⏐⏐ d(q, p) ⩽ d(q, p′)
}
.
Theset D(p)istheintersection ofthehalf-paces Hp′ as p′ variesin S \{p}.
Since S isdiscrete, thesehalf-spacesarelocallyﬁnite(thereareﬁnitely
many points inS at bounded distance fromp, hence ﬁnitely many hyper-
planes). Therefore D(p) is a polyhedron. SinceS is discrete, every point
q ∈ Hn has at least one nearest pointp ∈ S: therefore the polyhedraD(p)
cover Hn as p ∈ S varies.
It remains to prove that the polyhedraD(p) intersect along common
faces. We have D(p) ∩ D(p′) = D(p) ∩ ∂Hp′ and hence D(p) ∩ D(p′) is
either empty or a face ofD(p). The case of multiple intersections follows
from Exercise 3.2.2. □
Voronoi tessellations of course make sense also inRn and Sn, see
Figure 3.14. We have just proved that tessellations are not exoteric, but
quite ordinary objects, and we now show that they are useful to study
hyperbolic manifolds.


## Page 98

90 3. HYPERBOLIC MANIFOLDS
3.4. Fundamental domains
We turn back to our discrete subgroupsΓ < Isom(Hn). The geometry
of a discreteΓ is nicely controlled by some polyhedra, calledfundamental
domains. We introduce these objects and make some important examples.
3.4.1. FundamentalandDirichletdomains. Let Γbeadiscretegroup
of isometries ofHn. The groupΓ may or may not act freely onHn.
Deﬁnition 3.4.1. Afundamental domainfor Γ is a polyhedronD ⊂ Hn
whose translates g(D) as g ∈ Γ varies are distinct and form a tessellation
of the spaceHn.
If D is a fundamental domain, the groupΓ acts freely and transitively
on the tessellation
{
g(D)
}
g∈Γ, so in particular the polyhedrag(D) are all
isometric.
We describe a procedure that builds a fundamental domain for any
discrete subgroup Γ < Isom(Hn). Pick a point p ∈ Hn with trivial sta-
biliser Γp, which exists by Proposition 3.1.9. The groupΓ acts freely and
transitively on the orbitΓ(p), which is discrete by Proposition 3.1.8.
The discrete orbit Γ(p) deﬁnes a Γ-invariant Voronoi tessellation of
Hn, and every polyhedron of the tessellation is a fundamental domain. The
polyhedron D(p) of the tessellation containing p is called the Dirichlet
domain for Γ centred at p. By construction we have
D(g(p)) = g(D(p))
for all g ∈ Γ. We have proved in particular the following.
Proposition 3.4.2. Every discrete groupΓ < Isom(Hn) has a funda-
mental domain.
Fundamental domains are far from being unique. The Dirichlet do-
main D(p) depends on p in a continuous fashion, and many fundamental
domains are not Dirichlet domains.
Exercise 3.4.3. Prove that the shadowed triangle in Figure 3.15 is a
fundamental domain for the modular groupPSL2(Z).
Everything we say also holds forRn and Sn.
3.4.2. Fundamental domain of manifolds.Let Γ < Isom(Hn) be a
discrete subgroup that acts freely onHn and D be a fundamental domain
for Γ. We can get some information on the hyperbolic manifoldM = Hn/Γ
by looking atD.
Proposition 3.4.4. Let M = Hn/Γ be a hyperbolic manifold and D
a fundamental domain forΓ. The projection π : Hn → M restricts to a
surjective mapD → M that sendsint(D) isometrically onto an open dense
subset of M. In particular we have
Vol(D) = Vol(M).


## Page 99

3.4. FUNDAMENTAL DOMAINS 91
Figure 3.15. The shadowed triangle (with one ideal vertex)
is a fundamental domain forΓ = PSL2(Z) acting on the half-
space H2. The translates of the fundamental domain form
the tessellation shown.
If D is a Dirichlet domain, it is compact if and only ifM is.
Proof. The translates g(D) cover Hn, hence the projection D →
M is surjective. The translates g(int(D)) are disjoint, hence int(D) is
sent isometrically inside M. The boundary ∂D has measure zero, hence
Vol(D) = Vol(int(D)) = Vol(M).
If D is compact thenM clearly is. IfD = D(p) is a Dirichlet domain
and M is compact, M has ﬁnite diameterδ and hence every point inHn is
at distance ⩽ δ of some point in the orbit ofp. Hence D(p) is contained
in the closure ofB(p, δ). □
A fundamental domainD alone however does not determineM: we
willsoonseeinSection3.4.8thatasquarein R2 isthefundamentaldomain
of two non homeomorphic compact ﬂat surfaces.
3.4.3. Asteroids. The facets of a fundamental domainD are nat-
urally partitioned into isometric pairs, as follows. Ever facet f of D is
incident to D and to another fundamental domaing(D) of the tessella-
tion. The isometry g−1 sends g(D) to D and hence sends f to another
facet f′ of D. One checks immediately that (f′)′ = f, so f and f′ are
paired isometrically.
One should think ofM as obtained fromD by identifying these facets
in pairs: we can picture an observer – say, a spaceship – ﬂoating and
travelinginside M byvisualisingitin D, andjumpingfrom f to f′ everytime
it crosses the interior of a facetf, like in the 1979 video gameAsteroids.
3.4.4. Spine and cut locus.Another picture that may help to under-
stand M geometrically is thespine S ⊂ M deﬁned as S = π(∂D). This
is a (n − 1)-dimensional object in M whose complement is an open ball.


## Page 100

92 3. HYPERBOLIC MANIFOLDS
When D = D(p) is the Dirichlet domain of a pointp, the spineS is called
the cut locusof the pointq = π(p) ∈ M.
Exercise 3.4.5. The cut locus ofq ∈ M consists of all pointsq′ such
that there are at least two geodesics of minimal length connectingq to q′.
We now exhibit some important examples of discrete groups of isome-
tries in the three geometriesHn, Rn, and Sn, and study their fundamental
domains.
3.4.5. Triangle groups. Let a, b, c ⩾ 2 be natural numbers and ∆
be the triangle inH2, S2, or R2 with inner angles π
a, π
b, π
c. By reﬂecting
iteratively ∆ along its sides we get a tessellationT, see Section 3.3.1.
The triangle group Γ = Γ( a, b, c) is the group of isometries ofS2,
R2, or H2 generated by the reﬂections x , y , zalong the three sides of∆
opposite to the vertices with inner anglesa, b, c, respectively.
Proposition 3.4.6. The triangle groupΓ(a, b, c) acts freely and tran-
sitively on the triangles of the tessellationT. Hence it is discrete and∆ is
a fundamental domain forΓ. A presentation for the group is
⟨x , y , z | x 2, y 2, z2, (x y)c , (y z)a, (z x)b⟩.
Proof. We restrict for simplicity to the hyperbolic case, the others
being analogous. It is convenient to construct the tessellationT abstractly
(this also furnishes a rigorous proof that by mirroring∆ along its sides we
get a tessellation ofH2).
We denote by x , y , z both the sides of ∆ and the reﬂections along
them. For every g ∈ Γ we deﬁne an abstract copy∆g of ∆, and then we
glue all these abstract copies altogether by pairing their sides as follows:
for every side of∆, say x, and everyg ∈ Γ, we identify the two copies of
the side x in ∆g and ∆gx with the obvious identity map.
Via these identiﬁcations we get an abstract spaceT tessellated into
thetriangles ∆g. Thegroup Γactsfreelyandtransitivelyonthetessellation
(the elementg′ ∈ Γ sends ∆g to ∆g′g). We now prove thatT has a natural
structure of a hyperbolic surface: sinceΓ acts transitively, it suﬃces to
check this for the pointsp lying in∆e. If p lies in the interior of∆e or of a
side, this is clear by construction. Ifp is a vertex, say with inner anglea, by
construction a cycle of2a triangles ∆e , ∆y , ∆y z, ∆y z y, ∆y z y z, . . .is attached
around p because (y z)a = e, and henceT is naturally a hyperbolic surface
also near p.
The hyperbolic surfaceT is easily seen to be connected and complete.
There is a natural developing mapϕ: T → H2 that sends∆g to g(∆). The
map ϕ is a local isometry, hence a covering by Proposition 1.2.19, hence
an isometry sinceH2 is simply connected. We identifyT with H2 via ϕ.
It remains to prove thatΓ may be presented as stated. LetG be the
group presented as
⟨x , y , z | x 2, y 2, z2, (x y)c , (y z)a, (z x)b⟩.


## Page 101

3.4. FUNDAMENTAL DOMAINS 93
There is a natural surjectionG → Γ. We may repeat all the arguments
above usingG instead ofΓ and get anotherT′ isometric toH2 that covers
T. We deduce thatT′ = T and G = Γ. □
The triangle group Γ(2, 2, c) ∼= Z/2Z × D2c has order 4c and is the
symmetry group of a prism. The triangle groupsΓ(2, 3, 3), Γ(2, 3, 4), and
Γ(2, 3, 5) have order24, 48, and 120 and are the symmetry groups of the
regular tetrahedron, octahedron, and icosahedron: the reader is invited to
check all these facts visually by looking at Figure 3.5.
The triangle groups Γ(2, 3, 6), Γ(2, 4, 4), and Γ(3, 3, 3) are discrete
groups of isometries ofR2 with compact quotientR2/Γ. If 1
a + 1
b + 1
c < 1
the group Γ(a, b, c) is a discrete subgroup ofIsom(H2). It contains inﬁn-
itely many elliptic elements, such as reﬂections along lines and ﬁnite-order
rotations around the vertices of the triangles. By Selberg’s Lemma, there
isatorsion-freesubgroup Γ′ < Γofsomeﬁniteindex h. Thequotient H2/Γ′
is a closed hyperbolic surface and is tessellated intoh triangles isometric
to ∆.
3.4.6. Coxeter polyhedra. Triangle groups may be generalised to all
dimensions as follows. A polyhedron P in Hn (or Rn, Sn) is a Coxeter
polyhedron if the dihedral angle of every codimension-two face dividesπ.
For instance, the regular ideal tetrahedron and octahedron are Coxeter
polyhedra.
The following theorem generalises Proposition 3.4.6. LetP be a ﬁnite
Coxeter polyhedron: it is the convex hull of ﬁnitely many vertices inHn
(or Rn, Sn) and hask facets, that we number as1, . . . , k; we denote byri
the reﬂection along thei-th facet, and byπ
ai j
the dihedral angle formed by
the i-th and j-th facets, if they are incident. LetΓ be the isometry group
generated by the reﬂections along the facets ofP.
Theorem 3.4.7. By mirroring iteratively a ﬁnite Coxeter polyhedron
P along its facets we get a tessellation ofHn (or Rn, Sn). The group Γ
acts freely and transitively on the tessellation: hence it is discrete andP
is a fundamental domain forΓ. A presentation forΓ is
⟨r1, . . . , rk | r 2
i , (ri rj )ai j ⟩
where i varies in1, . . . , kand the pairi , jvaries among the incident facets.
Proof. Same proof as Proposition 3.4.6, with in addition an induction
on the dimensionn. Here are the details. We consider for simplicity only
the hyperbolic case.
Forevery g ∈ Γwedeﬁneanabstractcopy Pg of P, andweidentifythe
i-th facet ofPg and Pgri for allg ∈ Γ and alli. To prove that the resulting
space T is naturally a hyperbolic manifold, we use the induction hypothesis
as follows. Every p ∈ Pe lies in the interior of someh-dimensional face
f, and let Γf < Γ be the subgroup generated by the reﬂections along
all the facets of P containing f. The point p is adjacent in T to the


## Page 102

94 3. HYPERBOLIC MANIFOLDS
polyhedra Pg such that g ∈ Γf. By intersecting each suchPg with a small
codimension h + 1sphere centred inp and contained in the codimensionh
subspace orthogonal tof, we get some spherical polytopeQg of dimension
n − h − 1 < n. (The spherical polytopeQt is usually called thespherical
link of f.)
By constructionQe ⊂ Sn−h−1 is a Coxeter polytope and the subgroup
Γf < Isom(Sn−h−1) is generated by the reﬂections along its facets. By
applying the induction hypothesis on Qe we deduce that the polytopes
Qg with g ∈ Γf form a tessellation of Sn−h−1, hence the polyhedra Pg
incident to p form naturally a hyperbolic ball locally nearp. Therefore T
is a hyperbolic manifold.
Proving that T is complete requires a bit of care ifPe has some ideal
vertex v. In that casev has a Euclidean link (obtained by intersectingPe
with a small horosphere) and we conclude by induction as above that the
Euclidean links of thePg incident tov in T glue to form a EuclideanRn−1,
that is a horosphere, so by intersecting eachPg with small horoballs we
get a horoball nearv, which is complete.
The hyperbolic spaceT is complete and connected, and we conclude
as in the proof of Proposition 3.4.6. □
A group generated by some reﬂections along hyperplanes is called a
reﬂection group. The following proposition shows that Coxeter polyhedra
generate all the interesting reﬂection groups.
Proposition 3.4.8. Every discrete reﬂection group Γ is generated by
the reﬂections along the facets of some Coxeter polyhedron.
Proof. Consider the mirror hyperplanes of all the reﬂections in Γ.
Since Γ is discrete, these form a locally ﬁnite set and hence deﬁne a
tessellation of Hn onto which Γ acts transitively. Pick one polyhedron
P of the tessellation. The reﬂections along the facets ofP generate Γ
(exercise). □
Coxeter polyhedra are beautiful objects that can be used to construct
hyperbolic manifolds: every ﬁnite Coxeter polyhedronP generates a reﬂec-
tion groupΓ which contains, by Selberg’s Lemma, a torsion-free subgroup
Γ′ of some ﬁnite indexh. The quotient M = Hn/Γ′ is a hyperbolic mani-
fold and is tessellated intoh copies of P, so thatVol(M) = hVol(P ). By
residual ﬁniteness, there are plenty of such manifolds.
3.4.7. Coxeter graphs. If a Coxeter polyhedronP has a reasonable
number of facets (for instance, ifP is a simplex), then one can study many
of its properties by looking at itsCoxeter graph, which is constructed
as follows: draw one node for each facet of P, and for every pair of
facets intersecting with dihedral angleπ
a connect the corresponding nodes
with an edge labeled with a. One also uses thickened or dashed edges
to denote non-incident faces that do or do not intersect at some ideal


## Page 103

3.4. FUNDAMENTAL DOMAINS 95
Figure 3.16. A fundamental domain in R2 for the torus
(left) and the Klein bottle (centre): opposite sides should
be identiﬁed as indicated by the arrows. A fundamental do-
main in S2 for RP2 (right).
vertex, respectively (these cases cannot occur on simplexes). Given the
abundance of right angles, one usually omit the edges with label 2.
Exercise3.4.9. Let P bearegularpolytopeortessellationwithSchläﬂi
symbol {a, b, . . . , z}. By quotienting P via all its isometries we get a
Coxeter simplex, called itscharacteristic simplex, whose Coxeter graph is
3.4.8. Flat tori. The isometry group Isom(Rn) of Rn contains the
translations subgroup that we identify withRn. The integer translations
Γ = Zn form a discrete subgroup that acts freely onRn, therefore the
quotient Rn/Γ is a ﬂat manifold. It is naturally diﬀeomorphic to then-
dimensional torus:
Rn/Zn = (R/Z)n ∼= S1 × . . . × S1
  
n
.
Exercise 3.4.10. For every p ∈ Rn the Dirichlet domain D(p) is a
n-dimensional unit cube centred atp.
The ﬂat n-torus may be seen as the unitn-cube with its opposite
facets identiﬁed by translations. The two-dimensional case is shown in
Figure 3.16-(left): by identifying the opposite sides of a square we get a
torus.
The n-torus possesses a continuous family of non-isometric ﬂat met-
rics. Alattice Γ < Rn is a discrete subgroup isomorphic toZn which spans
Rn as a vector space. We seeΓ as a group of translations.
Exercise 3.4.11. For every latticeΓ, the ﬂat manifoldRn/Γ is diﬀeo-
morphictothe n-torus. Afundamentaldomainistheparallelotopespanned
by n generators ofΓ.
A Dirichlet domain forΓ is almost never a parallelotope! In thehexag-
onal torus R2/Γ the group Γ is the equilateral lattice generated by the
translations
(1, 0),
(1
2 ,
√
3
2
)


## Page 104

96 3. HYPERBOLIC MANIFOLDS
and the Dirichlet domain of any point is a regular hexagon. Orientable ﬂat
manifolds are easily classiﬁed (up to diﬀeomorphism) in dimension two.
Proposition 3.4.12. Every closed ﬂat orientable surface is a torus.
Proof. A closed ﬂat surfaceS is isometric toR2/Γ for some discrete
group Γ of orientation-preserving isometries acting freely. Every ﬁxed-
point-free orientation-preserving isometry ofR2 is a translation (exercise),
hence Γ < R2. If Γ has rank one then S is not compact, hence Γ is a
lattice and S is a torus. □
Flat manifolds more complicated than tori can be constructed by con-
sidering also non-translational isometries ofRn, which exist forn ⩾ 3 and
also for n = 2 in the non-orientable setting. For instance, in dimension
two we ﬁnd theKlein bottle by taking Γ as the group generated by the
isometries:
τ : ( x , y) ↦→ (x + 1, y), η : ( x , y) ↦→ (1 − x , y + 1).
AfundamentaldomainfortheKleinbottleisshowninFigure3.16-(centre).
Every subgroup Γ′ < Γ furnishes another ﬂat manifold R2/Γ′ that
covers the Klein bottle. For instance, the subgroups⟨τ ⟩ and ⟨η⟩ generated
respectively byτ and η are both isomorphic toZ but provide two diﬀerent
coverings: the manifold R2/⟨τ⟩ is an inﬁnite cylinder while R2/⟨η⟩ is an
inﬁnite Möbius strip.
The subgroupΓ′ generated by the translationsτ and η2 is isomorphic
to Z2 and has index 2 inΓ. The Klein bottle is doubly covered by the
ﬂat torus H2/Γ′. A fundamental domain forΓ′ is a rectangle with vertices
(0, 0), (1, 0), (0, 2), (1, 2).
We have seen that the Klein bottle is covered by a torus. In fact, we
will see in Section 4.4 thatevery closed ﬂat n-manifold is covered by a ﬂat
n-torus.
Exercise3.4.13. Asquare Q ⊂ R2 isaCoxeterpolygonanddetermines
areﬂectiongroup Γ. Whatistheminimumindexofatorsion-freesubgroup
Γ′ < Γ? Which topological surfacesR2/Γ′ do we get?
3.4.9. Real projective spaces. We now exhibit some elliptic mani-
folds. Every elliptic manifold is covered bySn and is hence compact and
has ﬁnite fundamental group (because coverings between compact mani-
folds have ﬁnite degree).
An important example is the real projective spaceRPn = Sn/Γ where
Γ is the order-two group generated by the antipodal mapι(x) = −x.
Exercise 3.4.14. For everyp ∈ Sn, the Dirichlet domainD(p) of Γ is
the hemisphere centred atp.
The two-dimensional case is shown in Figure 3.16-(right). The only
elliptic surfaces areS2 and RP2 in virtue of the following.


## Page 105

3.5. GEODESIC BOUNDARY, NON-COMPLETE, AND CONE MANIFOLDS 97
Proposition 3.4.15.In even dimensionn the only elliptic manifolds are
Sn and RPn.
Proof. Let M = Sn/Γ be an elliptic manifold. Every matrix inSO(n +
1) has an eigenvalue +1 because n is even (exercise) and hence acts in
Sn with a ﬁxed point. Therefore Γ contains no non-trivial orientation-
preserving isometries, and since these form a group of index at most two,
either Γ is trivial or is generated by an orientation-reversing ﬁxed-point free
involution in O(n + 1), and −I is the only such element (exercise). □
3.4.10. Lens spaces. In dimension twoRP2 and S2 are the only ellip-
tic manifolds, but in dimension three there are more. Letp ⩾ 1 and q ⩾ 1
be coprime integers and setω = e
2πi
p . We identifyR4 with C2 and see S3
as
S3 =
{
(z , w) ∈ C2 ⏐⏐ |z|2 + |w |2 = 1
}
.
The map
f (z , w) = ( ωz , ωqw )
is an isometry ofR4 because it consists of two simultaneous rotations on
the coordinate planes w = 0 and z = 0. The map f hence induces an
isometry of S3. It has orderp and none of its iteratesf , f 2, . . . , f p−1 has
a ﬁxed point. Therefore the groupΓ = ⟨f ⟩ generated by f acts freely on
S3, and is discrete because it is ﬁnite.
We have constructed an elliptic manifoldS3/Γ, called alens spaceand
indicated with the symbolL(p, q). Its fundamental group is isomorphic to
Γ = Z/pZ. Note that the manifold depends on bothp and q.
3.5. Geodesic boundary, non-complete, and cone manifolds
We now introduce three important variations on the complete hyper-
bolic manifolds theme. The ﬁrst consists of admitting a totally geodesic
boundary, the second is a brief overlook of some phenomena that may
occur when the completeness hypothesis is dropped, and in the third we
allow some conical singularity on a codimension-two geodesic stratum.
3.5.1. Hyperbolic manifolds with geodesic boundary.We reformu-
late a deﬁnition of hyperbolic (elliptic, ﬂat) manifolds that allows the pres-
ence of some geodesic boundary. These manifolds are useful because they
can be glued along their boundaries to produce new hyperbolic (elliptic,
ﬂat) manifolds.
Deﬁnition3.5.1. A hyperbolic (elliptic, ﬂat)manifold M withgeodesic
boundary is a Riemannian manifold with boundary where every point has
an open neighbourhood isometric to an open set in a half-space inHn (Sn,
Rn).
The boundary ∂M of a hyperbolic (elliptic, ﬂat)n-manifold with ge-
odesic boundary is a hyperbolic (elliptic, ﬂat) (n − 1)-manifold without
boundary. Theorem 3.1.2 extends appropriately to this context.


## Page 106

98 3. HYPERBOLIC MANIFOLDS
Figure 3.17. An intersection of (possibly inﬁnitely many!)
half-planes. The universal cover of a hyperbolic surface with
boundary is isometric to such an object.
Theorem 3.5.2.Every complete simply connected hyperbolic manifold
M with geodesic boundary is isometric to the intersection of some half-
spaces in Hn with disjoint boundaries.
Proof. We construct a developing mapD : M → Hn as in Theorem
3.1.2. The map D is injective, because every two pointsp, q ∈ M are
connected by a geodesic (exercise: use completeness and geodesic bound-
ary), which is sent to a geodesic viaD, so p, q are sent to distinct points
D(p), D(q).
Therefore D(M) ⊂ Hn is isometric to M. Since it is complete and
with geodesic boundary, its boundary consists of disjoint hyperplanes, and
hence D(M) is the intersection of half-spaces bounded by them. □
An example is sketched in Figure 3.17. Every complete hyperbolic
manifold with geodesic boundary can be enlarged to a hyperbolic manifold
without boundary in a canonical way.
Corollary 3.5.3. Every complete hyperbolic n-manifold M with geo-
desic boundary is contained in a complete hyperbolicn-manifold N without
boundary, such thatN \ int(M) is diﬀeomorphic to∂M × [0, +∞).
Proof. The proof of Proposition 3.1.3 applies and shows thatM =
˜M/Γ where ˜M ⊂ ˜Hn is an intersection of half-spaces andΓ < Isom( ˜M)
acts freely and properly discontinuously on˜M.
Every local isometry in Hn extends to a global isometry, therefore
Γ < Isom( ˜M) < Isom(Hn). The group Γ acts freely on ˜M and hence also
on Hn: if it had a ﬁxed pointx ∈ Hn, it would ﬁx also the unique point
y ∈ ˜M that is the closest tox. The manifoldN = Hn/Γ contains naturally
M.
For every p ∈ ∂M, let γp(t) be the unit speed geodesic starting atp
orthogonal to∂M and directed outward. By looking at the universal cover
one sees easily that the map∂M × [0, +∞) → N \ int(M), (p, t) ↦→ γp(t)
is a diﬀeomorphism (we use here that˜M ⊂ Hn is convex). □


## Page 107

3.5. GEODESIC BOUNDARY, NON-COMPLETE, AND CONE MANIFOLDS 99
3.5.2. Cut and paste.Hyperbolic manifolds with geodesic boundary
are useful because they can be glued to produce new hyperbolic manifolds.
Let M and N be hyperbolic manifolds with geodesic boundary and
ψ : ∂M → ∂N be an isometry. Let M ∪ψ N be the topological space
obtainedbyquotientingthedisjointunion M ⊔N bytheequivalencerelation
that identiﬁes p to ψ(p) for all p ∈ ∂M.
Proposition 3.5.4. The space M ∪ψ N has a natural structure of hy-
perbolic manifold.
Proof. The interiors of M and N inherit their hyperbolic metrics.
When we gluep to ψ(p) we get a pointq that has two half-disc neigh-
bourhoods on its sides, which glue to a honest hyperbolic disc, inducing a
hyperbolic metric nearq. □
Conversely, if an orientable hyperbolic manifoldM contains an ori-
entable geodesic hypersurfaceN, we can cutM along N to get a hyper-
bolic manifold with geodesic boundary. The boundary will consist of two
copies of N.
3.5.3. Non-complete hyperbolic manifolds. There is no classiﬁca-
tion of simply connected non-complete hyperbolic manifolds: for instance,
we may get plenty of uninteresting examples by removing complicated
closed sets from Hn. However, the ﬁrst part of the proof of Theorem
3.1.2 still applies and provides the following:
Proposition 3.5.5. Let M be a non-complete simply connected hyper-
bolic n-manifold. There is a local isometry
D : M → Hn
which is unique up to post-composing withIsom(Hn).
Proof. Construct D as in the proof of Theorem 3.1.2: the complete-
ness of M is used there only in the last paragraph to show thatD is a
covering. As a local isometry, the mapD is determined by its ﬁrst-order
behaviour at any pointp ∈ M, and is hence unique up to post-composing
with an isometry ofHn. □
The map D is called a developing map and is neither injective nor
surjective in general. We can push-forward isometries alongD as follows.
Proposition 3.5.6.Let M be a hyperbolicn-manifold andD : M → Hn
be a local isometry. For every g ∈ Isom(M) there is a unique ρ(g) ∈
Isom(Hn) such that
ρ(g) ◦ D = D ◦ g.
The resulting mapρ: Isom( M) → Isom(Hn) is a homomorphism.


## Page 108

100 3. HYPERBOLIC MANIFOLDS
Proof. Pick a point p ∈ M and deﬁne ρ(g) as the unique isometry
of Hn such that ρ(g) ◦ D = D ◦ g on a small neighbourhood ofp. This
equality between local isometries holds locally and hence globally onM.
The map ρ is easily checked to be a homomorphism. □
The homomorphismρis theholonomy associated toD. If M is a non-
complete hyperbolic n-manifold, its universal coveringπ : ˜M → M inherits
a non-complete hyperbolic metric. Therefore we get a developing map
D : ˜M → Hn
together with a holonomy
ρ: Aut( π) − →Isom(Hn)
which is the restriction ofρ to the subgroupAut(π) < Isom( ˜M). By ﬁxing
a point in ˜M we identifyAut(π) with π1(M) and get a holonomy
ρ: π1(M) − →Isom(Hn).
As every metric space, a non-complete Riemannian manifoldM has
a uniquecompletion M, a complete metric space that containsM as an
open dense set. The completionM is however not necessarily a manifold,
except in some lucky cases. These lucky cases are extremely important
in dimension three, as we will see in Chapter 14. In that chapter we will
understand the completionM of a hyperbolic three-manifold by studying
its developing map and holonomy.
3.5.4. Singularities. A particular class of non-complete hyperbolic
manifolds deserves our attention, because their completions are some nice
and natural objects: manifolds withcone anglesalong some codimension-
two singular geodesic stratum.
Let S ⊂ Hn be a codimension-two subspace. The incomplete hyper-
bolic manifold Hn \ S has fundamental groupZ and we denote by
π : X − →Hn \ S
its universal covering: hereX is an interesting non-complete simply con-
nectedhyperbolicmanifold. Notethat πmaybeinterpretedasadeveloping
map π : X → Hn which is neither injective nor surjective.
Exercise 3.5.7. The metric completion ofX is X = X ⊔ ˜S where ˜S is
an identical copy ofS. The coveringπ extends to a surjective map
π : X → Hn
that sends ˜S to S. If p ∈ ˜S and q ∈ X then d(p, q) = d(π(p), π(q)).
The space ˜S is thesingularity of X and should be interpreted as lying
in X with inﬁnite cone angle: the spaceX looks like a book with inﬁnitely
many pages (it is not locally compact at˜S). Singularities with ﬁnite cone
angles will be deﬁned in the next section as quotients of this model. The


## Page 109

3.5. GEODESIC BOUNDARY, NON-COMPLETE, AND CONE MANIFOLDS 101
dimensions that will be interesting for us are of coursen = 2 and 3, where
˜S is a point and a line, respectively.
3.5.5. Cone manifolds. For everyθ ∈ R there is a well-deﬁned rota-
tion Rotθ : X → X of angleθ around ˜S, which projects to a rotation inHn
of angle θ around S; note thatRotθ ̸= id for allθ ̸= 0, including θ = 2kπ.
We ﬁxθ ̸= 0, so thatRotθ generates a free cyclic groupΓ < Isom(X).
Exercise 3.5.8. The metric spaceX/Γ is the completion ofX/Γ and
is homeomorphic toRn.
The image of ˜S along the quotient π : X → X/Γ is a copy of ˜S
and should now be interpreted as a singularity with cone angleθ. When
θ = 2kπ for some integerk the map π : X → Hn factors as
X
π1
− →X/Γ
π2
− →Hn.
When k = ±1 the map π2 is an isometry. We introduce the following
deﬁnition.
Deﬁnition3.5.9. A hyperbolicmanifold M withconeangles isametric
space with charts in someX/Γ and transition maps that are isometries.
The term “isometries” should be interpreted in the strongest sense:
the transition maps send singular points to singular points, and outside of
the singular points these are isometries of Riemannian manifolds.
The points inM that are mapped along charts to some singular set
form a hyperbolic codimension-two submanifold inM with some cone angle
θ, and diﬀerent components may have diﬀerent cone angles. Points with
cone angle2π may be considered as ordinary points, while points with cone
angle diﬀerent from2π are singular and form thesingular locusof M.
The singular locus ofM is a geodesic codimension-two manifold, and
its complement is an ordinary hyperbolic manifold, whose metric comple-
tion isM. Flat and spherical manifolds with cone angles are deﬁned in the
same way.
3.5.6. Examples. The following simple construction is a source of
many two-dimensional examples: let P be any polygon inH2, R2, or S2,
with some inner anglesα1, . . . , αk. By doublingP along its edges we get a
topological sphere withk cone points of angles2α1, . . . ,2αk < 2π. This
is a hyperbolic, ﬂat, or spherical surface with cone angles.
Another simple but maybe more intriguing construction is the follow-
ing: pickanypolyhedron P in H3, R3, orS3. Thefacesof P are(hyperbolic,
ﬂat, or elliptic) polygons that glue isometrically along the edges: hence∂P
is a topological sphere with a natural structure of (hyperbolic, ﬂat, or el-
liptic) manifold with cone angles at the vertices.
To construct examples in dimension three we need a bit more work
because polyhedra have more strata. Non-compact examples are easier to
build: let P ⊂ H3 be any ideal hyperbolic polyhedron, with somek edges


## Page 110

102 3. HYPERBOLIC MANIFOLDS
with dihedral anglesα1, . . . , αk; the double ofP is naturally a hyperbolic
cone manifold where the edges form the singular locus with cone angles
2α1, . . . ,2αk.
3.6. Orbifolds
An orbifold is an object locally modelled on ﬁnite quotients ofRn.
It naturally arises when we quotient a Riemannian manifold by a discrete
groupofisometriesthatmaynotactfreely. Orbifoldsbehavelikemanifolds
on many aspects.
3.6.1. Deﬁnition. Let Γ < O(n) be a ﬁnite group of linear isometries
and V ⊂ Rn be a Γ-invariant open set. The resulting map
ϕ: V − →V /Γ
is called alocal orbifold model. For instance, we may pickV = B(0, r).
We now generalise manifolds by allowing local orbifold models in the atlas.
Deﬁnition3.6.1. Let ObeaHausdorﬀparacompacttopologicalspace.
An orbifold atlas on O is an open covering{Ui }i∈I of O, closed by ﬁnite
intersections and equipped with local orbifold models
ϕi : Vi − →Vi /Γi = Ui .
The local models are connected by some appropriate transition functions:
for every inclusionUi ⊂ Uj there is an injective homomorphism
fi j : Γ i ↪→ Γj
and a Γi-equivariant smooth embeddingψi j : Vi ↪→ Vj compatible with the
local models, that is
ϕj ◦ ψi j = ϕi .
Two such atlases are equivalent if the are contained in some bigger at-
las. Thespace O equippedwithanorbifoldatlasisan orbifold ofdimension
n. See an example in Figure 3.18.
Remark 3.6.2. We think at the mapsψi j and fi j as deﬁned only up to
the action ofΓj (which acts onψi j by composition and onfi j by conjuga-
tion). In particular, ifUi ⊂ Uj ⊂ Uk then we can verify that the equalities
ψi k = ψj k ◦ ψi j and fi k = fj k ◦ fi j hold only up to this ambiguity. See Figure
3.18.
The isotropy group Γp of a pointp ∈ O is the stabiliser of any lift of
p in any local modelV with respect to the action ofΓ. By deﬁnition Γp
is a ﬁnite subgroup ofO(n). A point p is regular if its isotropy group is
trivial, andsingular otherwise.
Example 3.6.3. The isotropy groupOp in the orbifoldO from Figure
3.18 is Z2 × Z2 at the origin,Z2 at the axis, and trivial elsewhere.
Proposition 3.6.4. The regular points form a dense subset inO.


## Page 111

3.6. ORBIFOLDS 103
V1 V2
V3
O
w
1
w
2 w
3
c
21
c
32
Figure 3.18. An orbifold O with three local models O =
U1 ⊃ U2 ⊃ U3. The group Γ1 = Z2× Z2 acts on V1 by
reﬂections on the two coordinate axis, the groupΓ2 = Z2
acts on V2 by reﬂection on the horizontal axis,Γ3 is trivial.
Proof. On a local model V → V /Γ, a singular point is the image
of the ﬁxed point locus of some element inΓ, which is in turn a proper
subspace. □
An orbifold islocally oriented if all the ﬁnite groupsΓ lie in SO(n),
and it isoriented if, in addition, all the transition mapsψi j are orientation-
preserving. In a locally oriented orbifold reﬂections are not admitted and
hence the singular locus has codimension ⩾ 2. An open subset of an
orbifold is naturally an orbifold.
3.6.2. Examples. Orbifolds are natural objects and there are plenty
of nice examples around.
Example 3.6.5. A diﬀerentiable manifold is an orbifold whose points
are all regular. A diﬀerentiable manifold with boundary may be interpreted
as an orbifold whose boundary points have the local structure of type
Rn/Γ where Γ = Z2 is generated by a reﬂection along a hyperplane. The
boundary should be interpreted as amirror.
Exercise 3.6.6. Construct an orbifold structure on the triangle as sug-
gested by Figure 3.19.
Example 3.6.7. LetΓ < O(n) be ﬁnite andV ⊂ Rn a Γ-invariant open
set. The quotientV /Γ has an orbifold structure, deﬁned by the unique local
model V → V /Γ.
We generalise the last example.
Proposition 3.6.8. If M a Riemannian manifold andΓ < Isom(M) is
a discrete subgroup, the quotientM/Γ has a natural orbifold structure.


## Page 112

104 3. HYPERBOLIC MANIFOLDS
Figure 3.19. An orbifold structure on the triangle con-
structed using the local models from Figure 3.18. The
isotropy group is Z2× Z2 at the vertices, Z2 at the edges,
and trivial in the interior.
Proof. Take a pointp ∈ M/Γ and ˜p ∈ M a lift. Since Γ is discrete,
the stabiliserΓ˜p of ˜p is ﬁnite and there is ar > 0 such thatexp˜p(Br (0)) =
Br (˜p) and g(Br (˜p)) intersects Br (˜p) for someg ∈ Γ if and only ifg ∈ Γ˜p.
The ball Br (˜p) is clearly Γ˜p-invariant. The groupΓ˜p acts linearly and
orthogonally on Br (0) and we get an orbifold local model
Br (0) − →Br (0)/Γ˜p
∼= Br (˜p)/Γ˜p = Up
where the diﬀeomorphism is induced by the exponential map. We have
constructed an orbifold local modelUp around p. We extend the covering
{Up} thus obtained by adding all the non-empty intersections. □
This is the richest source of nice examples. The quotient mapM →
M/Γ is a covering, in an appropriate sense that we now explain.
3.6.3. Coverings. Let Γ′ < Γ < O(n) be ﬁnite groups andV ⊂ Rn a
Γ-invariant open set. The natural map
ϕ: V /Γ′ ↦− →V /Γ
between the two orbifolds is alocal covering.
Deﬁnition 3.6.9. A continuous mapp : ˜O → O between orbifolds is a
covering if every pointp ∈ O has a neighbourhoodU with p−1(U) = ⊔i∈I Ui
and every restrictionp|Ui : Ui → U is a local covering.
The following is the main source of examples.
Example 3.6.10. Let M be a Riemannian manifold and Γ′ < Γ <
Isom(M) be discrete groups. The natural mapM/Γ′ → M/Γ is an orbifold
covering.
Deﬁnition 3.6.11 (The good, the bad, and the very good). An orbifold
is good if it is covered by a manifold, and it isbad otherwise. It is very
good if it is ﬁnitely covered by a manifold.


## Page 113

3.6. ORBIFOLDS 105
3.6.4. Hyperbolic, ﬂat, and elliptic orbifolds. We deﬁne a hyper-
bolic, ﬂat, or elliptic orbifold to be an orbifold whose local models are
isometric quotients of balls inHn, Rn, or Sn, and whose transition func-
tions are also isometries.
The quotient of a hyperbolic, ﬂat, or spherical manifold by a discrete
group of isometries is naturally a hyperbolic, ﬂat, or elliptic orbifold.
Example 3.6.12. The triangle groupΓ(a, b, c) introduced in Section
3.4.5 is a discrete group of isometries ofS2, R2, or H2. It deﬁnes a trian-
gular orbifold∆, which is hyperbolic, ﬂat, or elliptic, according to whether
1
a + 1
b + 1
c is smaller, equal, or bigger than 1. The isotropy groups are
the dihedralD2a, D2b, and D2c at the vertices,Z2 at the edges, and trivial
elsewhere.
Theindex-twosubgroup Γor(a, b, c)◁Γ(a, b, c)consistingoforientation-
preserving isometries is sometimes called avon Dyck group. It deﬁnes an
orientable orbifold O that double-covers ∆. The orbifold O is a topo-
logical sphere with three singular points having rotation isotopy groups
Z/aZ, Z/bZ, Z/cZ. See Figure 3.20.
Exercise 3.6.13. Show that this is a presentation forΓor(a, b, c):
⟨ r, s, t | r a, sb, tc , r st ⟩.
The tripler, s, t of generators is intrinsically determined in the group up to
simultaneous conjugation or inversion. Diﬀerent unordered triples(a, b, c)
produce non-isomorphic Von Dyck groupsΓor(a, b, c).
Hints. The group Γ(a, b, c) preserves the tessellation T of H2, R2,
or S2 into triangles with angles π
a , π
b , π
c, so its ﬁnite-order elements are
rotations along some vertices of T. Three rotations r, s, t that satisfy
r st = 1 are of some very special kind. □
Example 3.6.14. More generally, every hyperbolic (or ﬂat, elliptic)
Coxeter polyhedron is a hyperbolic (or ﬂat, elliptic) orbifold.
Example 3.6.15. Quotient the ﬂat torus T = R2/Z2 by the elliptic
involution (x , y) ↦→ (−x ,−y). This isometry of T has four ﬁxed points
and the quotient ﬂat orbifold is a sphere with four singular points, see
Figure 3.21.
There are also many interesting non-compact orbifolds.
Example 3.6.16. A fundamental domain forPSL2(Z) was shown in
Figure 3.15. By gluing its sides according to the action we see quite easily
that the hyperbolic orbifoldH2/PSL2(Z) is non-compact and contains two
rotational points of order 2 and 3, see Figure 3.22.
Exercise 3.6.17. The 1-dimensional compact orbifolds areS1 and the
segment [0, 1] with mirrored endpoints. Show that there are coverings
S1 → [0, 1] of degree 2, and also coverings[0, 1] → [0, 1] of any positive
degree.


## Page 114

106 3. HYPERBOLIC MANIFOLDS
a b
c
a b
c
Figure 3.20. The index-two orientation-preserving
Γor(a, b, c) ◁ Γ(a, b, c) deﬁnes an index-two orbifold covering
O → ∆, where O is a 2-sphere with three singular points
and ∆ a triangle.
Figure 3.21. The elliptic involution quotients the torus to a
sphere with four singular points. The ﬁxed points and their
images are drawn in red. We show both a planar (left) and
spacial (right) picture.
Figure 3.22. The hyperbolic orbifoldH2/PSL2(Z) is obtained
by mirroring the sides of a triangle with inner anglesπ
3, π
2,
and zero (left). The orbifold is topologically a punctured
sphere with two singular points with rotational isotropyZ2
and Z3 (right).


## Page 115

3.6. ORBIFOLDS 107
When O = X/Γ and X is a simply connected manifold, we say thatΓis
the fundamental groupof O. It is also possible to deﬁne the fundamental
group for a generic orbifold using the appropriate orbi-notions of paths and
homotopies.
3.6.5. Cone manifolds. Hyperbolic (ﬂat, elliptic) cone manifolds and
orbifolds are diﬀerent objects, but they have a wide common intersection.
A hyperbolic (ﬂat, elliptic) orbifoldO whose isotropy groups Op are
either trivial or generated by a2π
p -rotation along a codimension-two sub-
spaceisnaturallyahyperbolic(ﬂat, elliptic)conemanifoldwithconeangles
2π
p . The singular set may consist of various connected components and
the natural numberp depends on the component.
Conversely, every hyperbolic (ﬂat, elliptic) manifold with cone angles
that divide 2π can be given a natural hyperbolic (ﬂat, elliptic) orbifold
structure whose singular set consists of rotational points only. Moreover,
we can easily prove that it is a good one:
Proposition 3.6.18. Every hyperbolic (ﬂat, elliptic) manifoldM with
cone angles that divide2π is a good hyperbolic (ﬂat, elliptic) orbifold. If
M is complete, then M = Hn/Γ (Rn/Γ, Sn/Γ) for some discrete groupΓ
of isometries.
Proof. We consider for simplicity only the hyperbolic case. We must
prove that M is orbifold-covered by a hyperbolic manifold.
The singular set S ⊂ M decomposes into connected components
S = ⊔i Si, each with a cone angle 2π
pi
for some integer pi ⩾ 2. The
complement M′ = M \ S is a non-complete hyperbolic manifold and as
such it is equipped with a developing mapD : ˜M′ → Hn and a holonomy
ρ: π1(M′) → Isom(Hn).
We pick a loopµi around each componentSi of S and note that by
deﬁnition ρ(µi )isanellipticisometrythatrotates Hn aroundacodimension-
two subspace by the angle2π
pi
. In particularρ(µi ) has order pi.
We consider the regular coveringN → M′ corresponding to the sub-
group ker ρ and give N the hyperbolic structure induced byM′. The com-
pletion N of N is a hyperbolic manifold that orbifold-coversM: since ρ(µi )
has order preciselypi, the added singular points inN have cone angle2π
and are hence ordinary.
If M is complete, then N also is and henceN = Hn/Γ′. We deﬁne
Γ < Isom(Hn) to be the group generated byΓ′ and any lifts of the deck
transformations of N → M, and we getM = Hn/Γ. □
Corollary 3.6.19. If M is complete and has ﬁnitely generated funda-
mental group, then it is very good.
Proof. We know thatM = Hn/Γ and we apply Selberg’s Lemma. □


## Page 116

108 3. HYPERBOLIC MANIFOLDS
Summing up, complete hyperbolic cone manifolds with angles that
divide 2π can be promoted to good orbifolds and hence to quotientsHn/Γ.
We will encounter many examples in dimensions two and three later on.
3.6.6. References. All the material presented here is standard and
introduced in various books, like Benedetti – Petronio [4] and Ratcliﬀe
[49]. A beautiful introduction to regular polytopes is Coxeter’s 1963 book
[14],whilethereaderinterestedinCoxeterpolytopesmayconsultVinberg’s
survey [59].
The theory of orbifolds and cone manifolds presented here is quite
limited: to get more background, the reader may consult Thurston’s notes
[56, Chapter 13] for the orbifolds, and McMullen’s paper [40] for the cone
manifolds.


## Page 117

CHAPTER 4
Thick-thin decomposition
A peculiar aspect of hyperbolic geometry is the existence of complete
hyperbolic manifolds that have ﬁnite volume but are not compact. These
manifolds behave like the compact ones in many aspects, but are some-
times easier to construct. They arise naturally when we study hyperbolic
surfaces, and are a fundamental constituent of Thurston’s geometrisation
of three-manifolds.
We prove here a structure theorem for all such manifolds. The the-
orem says that every ﬁnite-volume complete hyperbolic manifold can be
decomposed into two domains: athick partwhich is compact and has in-
jectivity radius bounded from below, and athin partthat consists ofcusps.
A cusp is a (truncated) hyperbolic manifold of typeN × [0, +∞), where
every section N × t has a ﬂat metric that shrinks exponentially witht.
The core of this theorem is a lemma about discrete subgroups of Lie
groups called theMargulis Lemma. We will apply this lemma also to the
other geometries and prove Bierbach’s Theorem, that states that every
compact ﬂat manifold is covered by a torus.
Throughout the discussion we will also study some general aspects
of ﬁnite-volume complete hyperbolic manifolds, concerning in particular
closed geodesics, isometry groups, and ﬁnite covers.
4.1. Tubes and cusps
We introduce here two very simple kinds of hyperbolic manifolds, so
simple that their fundamental groups will be calledelementary in the se-
quel: the tubes and the cusps. Before introducing them we show that the
injectivity radius of a hyperbolic manifold behaves nicely.
We also study the closed geodesics in a hyperbolic manifoldM, and
prove that there is precisely one in every free homotopy class of closed
curves of hyperbolic type.
4.1.1. Injectivity radius. Like many other geometric properties, the
injectivity radius of a complete hyperbolic manifold may be nicely observed
by looking at its universal cover. IfS ⊂ Hn is a discrete set, we letd(S)
be the inﬁmum ofd(x1, x2) among all pairsx1, x2 of distinct points inS.
Recallthateverycompletehyperbolicmanifoldisaquotient M = Hn/Γ
by some groupΓ of isometries acting freely onHn.
109


## Page 118

110 4. THICK-THIN DECOMPOSITION
Proposition 4.1.1. Let M = Hn/Γ be a complete hyperbolic manifold
and π : Hn → M the projection. For everyx ∈ M we have
injx M = 1
2 · d(π−1(x)).
Proof. The number injx M is the supremum of allr > 0 such that
B(x , r) is isometric to a ball of radiusr in Hn. The open set B(x , r) is
a ball of radiusr if and only if its counterimage viaπ consists of disjoint
balls of radius r, and this holds⇔ two distinct points inπ−1(x) stay at
distance at least2r. □
Recall that d(γ) is the minimum displacement ofγ ∈ Isom(Hn).
Corollary 4.1.2.If M = Hn/Γ be a complete hyperbolic manifold, then
injM = 1
2 · inf
{
d(γ)
⏐⏐ γ ∈ Γ, γ ̸= id
}
.
Proof. We have
injx M = 1
2 · d(π−1(x)) = 1
2 · inf
{
d(˜x , γ(˜x))
⏐⏐ γ ∈ Γ, γ ̸= id, ˜x ∈ π−1(x)
}
.
Therefore
injM = inf
x∈M
injx M = 1
2 · inf
{
d(γ)
⏐⏐ γ ∈ Γ, γ ̸= id
}
.
The proof is complete. □
Corollary 4.1.3. If M = Hn/Γ is a compact hyperbolic manifold then
every non-trivial element inΓ is hyperbolic.
Proof. Every nontrivial element inΓ is either hyperbolic or parabolic.
If M is compact theninjM > 0. If Γ contains a parabolicγ then d(γ) = 0
and hence injM = 0. □
4.1.2. Tubes. Considertheinﬁnitecyclicgroup Γ = ⟨ϕ⟩generatedby
a hyperbolic transformationϕon Hn with axisl and minimum displacement
d > 0. Theiterates ϕk areagainhyperbolictransformationswithaxis l and
displacement kd. Therefore Γ acts freely onHn. The quotient manifold
M = Hn/Γ is called aninﬁnite tube.
Exercise 4.1.4. Fixq ∈ l. Let q1, q2 be the two points inl at distance
d
2 from q and π1, π2 the two hyperplanes orthogonal tol in q1, q2. The
Dirichlet domain D(q) of Γ is the space comprised betweenπ1 and π2.
The inﬁnite tubeM = Hn/Γ is obtained fromD(q) by identifying π1
and π2 along ϕ. Its fundamental group is isomorphic toΓ ∼= Z. The axis
l projects in M onto a closed geodesicγ of length d. We haveinjM = d
2
by Corollary 4.1.2 and the points inγ are precisely those with minimum
injectivity radius. The closed geodesic γ is sometimes called the core
geodesic of the tube.


## Page 119

4.1. TUBES AND CUSPS 111
l
N  lR( )
Figure 4.1. The R-neighbourhood NR(l) of a vertical line in
the half-space model is a Euclidean cone. The boundary of
the cone is not totally geodesic: the cone is however convex.
Proposition 4.1.5. Every inﬁnite tube is diﬀeomorphic toS1 × Rn−1
or S1 ×
∼
Rn−1 according to whetherϕ is orientation-preserving or not.
Proof. By projecting Hn orthogonally onto l, we give Hn the struc-
ture of aRn−1-bundle over l which is preserved byϕ and hence descends
to a structure of Rn−1-bundle over γ. The conclusion follows from the
classiﬁcation of vector bundles overS1, see Proposition 1.1.13. □
A tube of radiusR, or aR-tube, is the quotientNR(l)/Γ of the closed
R-neighbourhood NR(l) of l, shown in Figure 4.1. It is diﬀeomorphic to
Dn−1 × S1 or Dn−1 ×
∼
S1, and in particular it is compact. Note that the
boundary of a tube is not totally geodesic, see Figure 4.1.
4.1.3. Cusps. We now introduce another simple type of hyperbolic
manifolds. In the previous example the discrete groupΓconsisted of hyper-
bolic transformations ﬁxing the same linel, nowΓ will consist of parabolic
transformations ﬁxing the same point at inﬁnity.
Let Γ < Isom(Rn−1)beanon-trivialdiscretegroupofEuclideanisome-
tries acting freely onRn−1: the quotient M = Rn−1/Γ is a ﬂat (n − 1)-
manifold. If we use the half-space model forHn with coordinates (x , t),
every element ϕ ∈ Γ acts as a parabolic transformation onHn by sending
(x , t) to (ϕ(x), t). The whole group Γ is a discrete group of parabolic
transformations of Hn ﬁxing the point∞.
The quotientHn/Γ is naturally diﬀeomorphic toM × R>0. The metric
tensor at the point(x , t) is
g(x ,t) = gM
x ⊕ 1
t2
where gM is the metric tensor of the ﬂatM. The manifoldHn/Γ is called
a cusp. Since Γ contains parabolics we haveinjM = 0.


## Page 120

112 4. THICK-THIN DECOMPOSITION
Figure 4.2. The pseudosphere is a surface inR3 isometric
to the union of two truncated cusps, each with constant
gaussian curvature−1.
Remark 4.1.6. The vertical coordinatet may be parametrized more
intrinsically using arc-length. As we have seen in Proposition 2.1.24, a
vertical geodesic with unit speed is parametrized as t = eu. Using u
instead of t the cusp is isometric toM × R with metric tensor
g(x ,u) = (e−2ugM
x ) ⊕ 1.
The lengths in the ﬂat sliceM × u are shrunk or dilated by the factore−u.
A truncated cusp is a portion N = M × [a, +∞), bounded by the
Euclidean manifold M × a: note that the boundary∂N is Euclidean but
not totally geodesic. The volume of a truncated cusp is strikingly simple.
Proposition 4.1.7. Let N be a truncated cusp. We have
Vol
(
N
)
= Vol(∂N )
n − 1 .
Proof. It follows from Lemma 3.2.7. □
In particular a (non truncated) cusp has inﬁnite volume.
Example 4.1.8. In dimension n = 2 there is only one cusp up to
isometry. The groupΓ < Isom(R) is the inﬁnite cyclic group generated by
a translation x ↦→ x + b and up to conjugating inIsom(H2) we may take
b = 1. The cusp is diﬀeomorphic toS1 × R, and the circleS1 × {u} has
length e−u. Some truncated cusp (but not the whole cusp!) embeds inR3
as in Figure 4.2.
Remark 4.1.9. Pick p ∈ H2. Note that a cusp andH2 \ {p} are both
hyperbolic and diﬀeomorphic to an open annulusS1 × R. However, they
are not isometric because the cusp is complete whileH2 \ {p} is not.
It is customary to employ the wordcusp to indicate a truncated cusp.


## Page 121

4.1. TUBES AND CUSPS 113
4.1.4. Closed geodesics. A closed curvein a manifoldM is a smooth
map γ : S1 → M. A (possibly closed) curve issimple if it is an embedding.
We consider S1 as the unit circle inC. A closed geodesic in a Rie-
mannian manifoldM is a smooth mapγ : S1 → M whose liftγ ◦π : R → M
along the universal coveringπ(t) = ei t is a non-constant geodesic. Two
closed geodesicsγ1, γ2 that diﬀer only by a rotation,i.e.such thatγ1(z) =
γ2(z ei t) for some ﬁxed t ∈ R, are implicitly considered equivalent. The
closed geodesics γ(z) and γ(z) = γ(¯z) are however distinct (they have
opposite orientations).
Proposition 4.1.10. Let γ be a closed geodesic in a Riemannian man-
ifold M. Exactly one of the following holds:
(1) the curve γ is simple,
(2) the curve γ self-intersects transversely in ﬁnitely many points,
(3) the curve γ wraps k ⩾ 2 times along a curve of type (1) or (2).
Proof. If the geodesic is not simple, it self-intersects. If it self-
intersects only with distinct tangents, then (2) holds. Otherwise (3)
holds. □
The natural numberk in (3) is themultiplicity of the closed geodesic.
A closed geodesicγ of multiplicity k is of typeγ(ei t) = η(eki t) for some
geodesic η of type (1) or (2).
Remark 4.1.11. A closed geodesic on a Riemannian manifoldM is
determined by its support, its orientation, and its multiplicity.
4.1.5. Closed geodesics in a hyperbolic manifold.Closed geodesics
in hyperbolic manifolds have a particularly nice behaviour.
Let X, Y be topological spaces: as usual we indicate by[X, Y ] the
homotopy classes of continuous mapsX → Y. Let X be path-connected.
There isa naturalmap π1(X, x0) → [S1, X], andthe followingis astandard
exercise in topology.
Exercise 4.1.12. The map induces a bijection between the conjugacy
classes in π1(X, x0) and [S1, X].
A simple closed curve inX is homotopically trivialif it is homotopic to
a constant. As a corollary, a simple closed curveγ is homotopically trivial
if and only if it represents the trivial element inπ1(X, γ(1)).
On a complete hyperbolic manifoldM = Hn/Γ the conjugacy classes
of π1(M) correspond to those inΓ and we get a correspondence
{
conjugacy classes in Γ
}
← →[S1, M].
This correspondence works as follows: given ϕ ∈ Γ, pick any x ∈ Hn,
connect x to ϕ(x) with any arc, and project it to a closed curve inM.
Two conjugate elements inΓ are of the same type (trivial, parabolic,
or hyperbolic) and have the same minimum displacement. Therefore every
element in [S1, M] has a well-deﬁned type and minimum displacement.


## Page 122

114 4. THICK-THIN DECOMPOSITION
Proposition 4.1.13. Let M be a complete hyperbolic manifold. Every
hyperbolic element of[S1, M] is represented by a unique closed geodesic,
of length d equal to its minimum displacement. The trivial and parabolic
elements are not represented by closed geodesics.
Proof. Take M = Hn/Γ. A hyperbolic isometry ϕ ∈ Γ has a unique
invariant geodesic in Hn, its axis, which projects to a closed geodesic of
length d. Conjugate isometries determine the same closed geodesic inM.
On the other hand, a closed geodesic inM lifts to a segment connect-
ingtwodistinctpoints x0 and ϕ(x0)forsome ϕ ∈ Γwhichpreservestheline
passing throughx0 and ϕ(x0): since ϕ preserves a line, it is hyperbolic.□
We get a bijection
{
hyperbolic conjugacy classes in Γ
}
← →
{
closed geodesics in M
}
.
Corollary 4.1.14. Let M be a closed hyperbolic manifold. Every non-
trivial element in[S1, M] is represented by a unique closed geodesic.
Proof. Since M is compact there are no parabolics. □
Corollary 4.1.15. Let M be a complete hyperbolic manifold. Every
closed geodesic has the minimum length among the closed curves in its
homotopy class.
Proof. If α is a closed geodesic, its length equals the minimum dis-
placement d of a corresponding hyperbolic transformationϕ. Every closed
curve β homotopic to α lifts to an arc connecting two points˜x and ϕ(˜x)
that have distance at leastd; hence β has length at leastd. □
Not only a purely topological object like a hyperbolic homotopy class
of closed curves has a unique geometric nice representative, but this repre-
sentative is the shortest possible one. Informally, we may think that every
closed curve may be shrunk until it becomes a closed geodesic, and the
negative curvature forces this closed geodesic to be unique: we will soon
see that the uniqueness is lost in the elliptic and ﬂat geometries.
It is worth recalling that a closed geodesic may not be simple. When
it is simple, we now show that the closed geodesic has some nice small
neighbourhoods. We deﬁned theR-tubes in Section 4.1.2.
Proposition 4.1.16.The R-neighbourhood of a simple closed geodesic
γ in a complete hyperbolic manifold is isometric to aR-tube, if R > 0 is
suﬃciently small.
Proof. By compactness ofγ there is a suﬃciently smallR > 0 such
that the R-neighbourhood of γ lifts to disjoint R-neighbourhoods of its
geodesic lifts inHn. Hence their quotient is aR-tube. □


## Page 123

4.2. THE MARGULIS LEMMA 115
4.2. The Margulis Lemma
We state and prove theMargulis Lemma, that concerns arbitrary dis-
crete groups in Lie groups and more speciﬁcally inIsom(Hn). The lemma
implies that there is a constantε > 0, which depends only on the dimen-
sion n, such that the ε-thin part of any complete hyperbolicn-manifold
consists of truncated cusps and tubes only. Theε-thin part is by deﬁnition
the set of all the points with injectivity radius smaller thanε.
The proof of the lemma for general Lie groups is surprisingly simple
and elegant; its application to the hyperbolic case needs however a more
technical argument. We start by exposing some preliminary facts on the
isometries of the hyperbolic space that are of independent interest.
4.2.1. Isometries that commute or generate discrete groups.Two
isometries of Hn that commute or generate a discrete group must be of a
particular kind. LetFix(ϕ) denote the ﬁxed points inHn of an isometryϕ.
Lemma 4.2.1. Let ϕ1, ϕ2 ∈ Isom(Hn) be two hyperbolic or parabolic
isometries. If they commute thenFix(ϕ1) = Fix( ϕ2).
Proof. Iftheycommute, themap ϕ1 actson Fix(ϕ2)andviceversa. If
ϕ2 is hyperbolic, thenFix(ϕ2) = {p, q}and ϕ1 ﬁxes the line with endpoints
p and q, hence is again hyperbolic withFix(ϕ1) = {p, q}. If ϕ1 and ϕ2 are
parabolic then they have the same ﬁxed pointFix(ϕ1) = Fix( ϕ2). □
Lemma 4.2.2. Let ϕ1, ϕ2 ∈ Γ be two non-trivial isometries in a dis-
crete group Γ < Isom(Hn) that acts freely on Hn. Either Fix(ϕ1) ∩
Fix(ϕ2) = ∅, or one of the following holds:
• ϕ1 and ϕ2 are parabolics with the same ﬁxed point,
• ϕ1 and ϕ2 are powers of the same hyperbolicϕ ∈ Γ.
Proof. Suppose thatϕ1 and ϕ2 have some common ﬁxed points. We
ﬁrst consider the case whereϕ1 is hyperbolic andϕ2 is parabolic. We pick
the half-space model and supposeFix(ϕ1) = {0, ∞} and Fix(ϕ2) = {∞}.
Proposition 2.2.8 says that
ϕ1(x , t) = λ(Ax , t), ϕ 2(x , t) = ( A′x + b, t)
with A, A′ ∈ O(n − 1) and λ ̸= 1. Hence
ϕn
1 ◦ ϕ2 ◦ ϕ−n
1 (x , t) = ϕn
1
(
A′(λ−nA−nx) + b, λ−nt)
=
(
AnA′A−nx + λnAnb, t
)
.
Up to interchangingϕ1 and ϕ−1
1 we may supposeλ < 1 and get
lim
n→∞
ϕn
1 ◦ ϕ2 ◦ ϕ−n
1 (0, t) = lim
n→∞
(λnAnb, t) = (0 , t).
A contradiction sinceΓ is discrete.


## Page 124

116 4. THICK-THIN DECOMPOSITION
We now suppose that bothϕ1 and ϕ2 are hyperbolic, withFix(ϕ1) =
{a, ∞} and Fix(ϕ2) = {b, ∞}. The isometries ϕ1 and ϕ2 permute the
horospheres centred at∞ and
[ϕ1, ϕ2] = ϕ1 ◦ ϕ2 ◦ ϕ−1
1 ◦ ϕ−1
2 ∈ Γ
ﬁxes every horizontal horosphere. Hence the commutator is parabolic or
trivial: the ﬁrst case is excluded by the previous discussion, in the second
case we havea = b by Lemma 4.2.1.
Both ϕ1 and ϕ2 have the same axis l, and since they generate a
discrete group Γ0 < Γ they are both powers of some hyperbolicϕ ∈ Γ0
with that axis. To prove this, note thatΓ0 acts eﬀectively onl as a discrete
group of translations, henceΓ0 ∼= Z. □
Two isometries are contained in some discrete group if and only if
they generate a discrete group, so the previous lemma is actually a fact on
pairs of isometries that generate discrete groups. The two lemmas have
important geometric consequences.
Corollary 4.2.3.Let Hn/Γ beacompletehyperbolicmanifold. Theaxis
in Hn of two hyperbolic isometries inΓ are either incident or ultra-parallel
(not asymptotically parallel).
Corollary 4.2.4. Let Hn/Γ be a complete hyperbolic manifold. Every
subgroup of Γ isomorphic to Z × Z consists of parabolic elements ﬁxing
the same point at inﬁnity.
Corollary 4.2.5.The fundamental groupπ1(M) of a closed hyperbolic
manifold M does not contain subgroups isomorphic toZ × Z.
Corollary 4.2.6. The torus has no hyperbolic structure.
4.2.2. The Margulis Lemma.We now introduce the main character
of this chapter, the Margulis Lemma. We ﬁrst state a general version for
Lie groups and then turn more speciﬁcally toIsom(Hn).
Lemma 4.2.7. Let G be a Lie group. There is a neighbourhoodU
of e ∈ G such that every discrete subgroupΓ < G generated by some
elements in U is nilpotent.
Note that the discreteness ofΓis essential here, since every connected
Lie groupG is generated by arbitrarily small elements, andG needs not to
be nilpotent.
Proof. Consider the commutator map
[ , ] : G × G → G
that sends(g, h) to the commutator[g, h]. The map is smooth and sends
G × {e} and {e} × G to the point e. Therefore its diﬀerential at(e, e)


## Page 125

4.2. THE MARGULIS LEMMA 117
vanishes. We identify a neighbourhood of e in G with Rn, so that the
commutator map near(e, e) can be read as
[ , ] : U × U − →Rn
forsomeneighbourhood U ⊂ Rn oftheorigin. Sinceitsdiﬀerentialat (0, 0)
vanishes, up to restrictingU we may suppose that the map is1
2-Lipschitz.
Therefore for allx , y ∈ U we get
∥[x , y]∥ < ∥[x ,0]∥ + 1
2 ∥y ∥ = 1
2 ∥y ∥, ∥[x , y]∥ < ∥[0, y]∥ + 1
2 ∥x∥ = 1
2 ∥x∥
and hence
∥[x , y]∥ < 1
2 min
{
∥x∥, ∥y ∥
}
.
This implies that for every smaller neighbourhoodV ⊂ U of 0 there is a
k > 0 such that
[U, [U, . . .[U, U]] · · ·]  
k
⊂ V.
We now turn back toG. Let Γbe discrete and generated by some elements
S ⊂ U. We choose a smaller neighbourhoodV of e such thatV ∩Γ = {e},
hence for anya1, . . . , ak , b ∈ S we get [a1, [a2, . . .[ak , b]] · · ·] ∈ V ∩ Γ =
{e}. Proposition 1.4.5 says thatΓ is nilpotent. □
We now want to reﬁne this lemma whenG = Isom(Hn). Let P be a
property of groups, like being abelian, nilpotent, etc. A group isvirtually
P if it has a ﬁnite-index subgroup which isP.
Lemma 4.2.8 (Margulis Lemma).In every dimension n ⩾ 2 there is
a constant εn > 0 such that for all x ∈ Hn, every discrete group Γ <
Isom(Hn) generated by elements that movex at distance smaller thanεn
is virtually nilpotent.
Proof. It suﬃces to prove the theorem for a ﬁxedx ∈ Hn since the
isometries of Hn act transitively on points. By Lemma 4.2.7 there is a
neighbourhood U of e in G = Isom( Hn) such that every discrete group
generated by some elements inU is nilpotent.
Let Vε ⊂ Isom(Hn) be the set of all the isometries that movex at
distance smaller thanε > 0. As ε > 0 varies, the relatively compact sets
Vε form a neighbourhood system for the compact stabiliserGx < Isom(Hn)
of x, isomorphic toO(n). We can prove (exercise) thatV−1
ε = Vε and
V k
ε = Vkε
for every positivek ∈ N. Since Gx is compact, it is covered by somem
translates of U. Pick a ε > 0 such that Vε is contained in the union of
these m translates. We prove the theorem withεn = ε/m.
Let Γ be a discrete group generated by some elementsS ⊂ Vεn. We
need to show thatΓ is virtually nilpotent. In fact we prove that the nilpo-
tent subgroup ΓU generated byΓ ∩ U has index at mostm in Γ.


## Page 126

118 4. THICK-THIN DECOMPOSITION
Suppose by contradiction that Γ/ΓU contains more than m cosets.
Let r (i) be the number of cosets represented by elements inΓ that are
products of at most i generators in S. We have r (1) > 1, otherwise
Γ = Γ U. If r (i) = r (i + 1) for some i, then it is easy to deduce thatr (i)
stabilises forever. This easily implies thatr (m) > m. Therefore there are
m + 1 elements in V m
εn = Vmεn = Vε belonging to m + 1 distinct cosets. By
hypothesis two of them, sayg and h, belong to the same translate ofU
covering Vε. Therefore gh−1 ∈ Γ ∩ U, contradicting the fact thatg and h
lie in distinct cosets. □
For a discrete groupΓ < Isom(Hn) and a pointx ∈ Hn, we denote by
Γε(x) < Γ the subgroup generated by all elementsg ∈ Γ that move x of a
distance smaller thanε. We have proved thatΓεn (x) is virtually nilpotent
for every x ∈ Hn and every discreteΓ.
A Margulis constantin a ﬁxed dimensionn is any numberεn > 0 for
which Lemma 4.2.8 holds. Every suﬃciently small number is a Margulis
constant.
4.2.3. Elementarygroups. Anon-trivialdiscretegroup Γ < Isom(Hn)
is elementary if it preserves a ﬁnite set of points inHn.
Proposition 4.2.9. An elementaryΓ acting freely onHn is:
• generated by a hyperbolic isometry, or
• generated by parabolic isometries having the same ﬁxed point at
∞.
Proof. Since Γcontainsnoelliptics, everynon-trivialelementﬁxesone
or two points at inﬁnity inHn, and no other ﬁnite set of points (because
of Proposition 2.4.6). We conclude using Lemma 4.2.2. □
Proposition 4.2.10. Let Γ < Isom(Hn) be a discrete group acting
freely on Hn. If Γ′ < Γ has ﬁnite index and is elementary, thenΓ also is.
Proof. We know that every element inΓ′ is either hyperbolic with axis
l, or parabolic with ﬁxed pointp ∈ ∂Hn. If ϕ ∈ Γ then ϕk ∈ Γ′ for some
k: hence ϕ is also of that type. □
Corollary 4.2.11. Let Γ < Isom(Hn) be discrete and acting freely. If
Γ is virtually nilpotent, it is either trivial or elementary.
Proof. We know thatΓ contains a ﬁnite-index nilpotent subgroupH.
If H is trivial then Γ is ﬁnite and hence trivial. IfH is non-trivial, it has
a non-trivial centre by Proposition 1.4.6. Lemma 4.2.1 then implies that
all the elements inH have the same ﬁxed points and soH is elementary.
Therefore Γ is elementary by Proposition 4.2.10 □
Let εn be a Margulis constant. We can strengthen the Margulis
Lemma.


## Page 127

4.2. THE MARGULIS LEMMA 119
Corollary 4.2.12.Let Γ < Isom(Hn) be discrete and acting freely. For
every point x ∈ Hn the subgroup Γεn (x) is either trivial or elementary.
4.2.4. Thick-thin decomposition. A notable geometric consequence
of the Margulis Lemma is that every complete hyperbolic manifold decom-
poses into a thick and a thin part, where the thin part consists only of
particularly simple star-shaped pieces. This decomposition is known as the
thick-thin decompositionof hyperbolic manifolds.
We deﬁne astar-shaped set centred at p ∈ ∂Hn to be any subset
U ⊂ Hn that intersects every half-line pointing top in a half-line. For
instance, a horoball is star-shaped. Astar-shaped neighbourhoodof a line
l ⊂ Hn is any neighbourhoodV of l that intersects every line orthogonal to
l intoaconnectedset. Forinstance, a R-neighbourhoodof l isstar-shaped.
These deﬁnitions pass to quotients. Astar-shaped cusp neighbour-
hood is the quotient U/Γ of a Γ-invariant star-shaped set U centred at
p ∈ ∂Hn via a discrete groupΓ of parabolic transformations ﬁxingp and
acting freely. Analogously, astar-shaped simple closed geodesic neighbour-
hood is the quotientV /Γ of aΓ-invariant star-shaped neighbourhoodV of
l via a discrete groupΓ ∼= Z of hyperbolic transformations with axisl.
The truncated cusps andR-tubes studied in Section 4.1 are particu-
larly nice star-shaped cusp and geodesic neighbourhoods.
Let εn > 0 be a Margulis constant. We deﬁne M[εn ,∞) and M(0,εn]
respectively as the set of all pointsx ∈ M having injx M ⩾ εn
2 , and as the
closure of the complementary setM \ M[εn ,∞). They form respectively the
thick and thin partof M.
Remark 4.2.13. We do not deﬁne the thin part simply as the set of
all points x having injx M ⩽ εn
2 because we want to discard the degenerate
and unlucky case of a closed geodesicγ having length preciselyεn. The
injectivity radius would beεn
2 at the points inγ and strictly bigger thanεn
2
near γ. With our deﬁnition, the geodesicγ is contained in M[εn ,+∞) and
not in M(0,εn].
Thefollowingtheoremisarguablythemostimportantstructuralresult
on complete hyperbolic manifolds of any dimensionn.
Theorem 4.2.14 (Thick-thin decomposition).Let M be a complete
hyperbolic n-manifold. The thin part M(0,εn] consists of a disjoint union
of star-shaped neighbourhoods of cusps and of simple closed geodesics of
length < ε n.
Proof. We have M = Hn/Γ. For every isometryϕ ∈ Γ we deﬁne
Sϕ(ε) =
{
x ∈ Hn ⏐⏐ d(ϕ(x), x) ⩽ ε
}
⊂ Hn.


## Page 128

120 4. THICK-THIN DECOMPOSITION
By Proposition 4.1.1 the thin partM(0,εn] is the image of the set
S =
{
x ∈ Hn ⏐⏐ ∃ϕ ∈ Γ, ϕ ̸= id such that d(ϕ(x), x) ⩽ εn
}
=
⋃
ϕ∈Γ,ϕ̸=id
Sϕ(εn).
More precisely, we should exclude the hyperbolicϕ ∈ Γ with d(ϕ) = εn,
see Remark 4.2.13, but this is not an important point and we ignore it. It
is easy to check thatSϕ(ε) is star-shaped, centred at ap ∈ ∂Hn or at a
line l according to whetherϕ is parabolic ﬁxingp or hyperbolic ﬁxingl.
Suppose that x ∈ Sϕ(εn) ∩ Sψ(εn) for some non-trivial isometries
ϕ, ψ ∈ Γ. By the Margulis Lemma bothϕ and ψ belong to the elementary
group Γεn (x) and hence by Proposition 4.2.9 both ϕ and ψ are either
parabolic ﬁxing the same pointp at inﬁnity or hyperbolic ﬁxing the same
line l.
Therefore every connected component S0 of S is the union of all
Sϕ(εn) where ϕ varies in some maximal elementary subgroupΓ0 < Γ of
parabolics ﬁxing the same pointp or hyperbolics ﬁxing the same linel.
The set S0 is a union of star-shaped sets centred atp or l and is hence
also star-shaped.
The groupΓ preserves S and the only isometries inΓ that preserveS0
arethosein Γ0, thereforethequotient M(0,εn] = S/Γ consistsofstar-shaped
neighbourhoods of cusps and of simple closed geodesics. □
Star-shaped neighbourhoods are particularly nice in low dimensions.
Proposition 4.2.15. Let M be a complete orientable hyperbolic mani-
fold of dimensionn ⩽ 3. The thin partM(0,εn] consists of truncated cusps
and R-tubes.
Proof. Pick a non-trivial ϕ ∈ Isom+(Hn). We check that Sϕ(ε) is
either empty, or aR-neighbourhood of a linel, or a horoball, for allε > 0.
This proves the proposition.
Suppose thatϕ is hyperbolic with axisl. The distanced(x , ϕ(x)) de-
pends only ond(x , l) since all the orientation-preserving hyperbolic trans-
formations with axisl commute with ϕ and act transitively on the points
at ﬁxed distance froml. It is easy to check thatd(x , ϕ(x)) increases with
d(x , l) and hence Sϕ(ε) is either empty or aR-neighbourhood of l.
If ϕ is parabolic, it acts on each horosphere centred atp like a Eu-
clidean ﬁxed-point-free orientation-preserving isometry onRn−1: this must
be a translation whenn ⩽ 3. Therefore d(x , ϕ(x)) depends only on the
horosphere O containing x anddecreasesas O movestowards p. Therefore
Sϕ(ε) is a horoball. □
See the picture in Figure 4.3.
Corollary 4.2.16. Let M be a complete hyperbolicn-manifold. The
closed geodesics inM of length < ε n are simple and disjoint.


## Page 129

4.2. THE MARGULIS LEMMA 121
Figure 4.3. The thick-thin decomposition of a complete hy-
perbolic surface: the thin part (yellow) consists of truncated
cusps and neighbourhoods of short geodesics (blue).
Proof. These closed geodesics lie in the thin part. Star-shaped cusp
neighbourhoods contain no closed geodesics, and each star-shaped geo-
desic neighbourhood contains only one closed geodesic, its core, which is
simple. □
4.2.5. Finite-volume hyperbolic manifolds.A speciﬁc feature of hy-
perbolic geometry is the existence of complete hyperbolic manifolds that
have ﬁnite volume without being compact. The thin-thick decomposition
furnishes a nice topological description of such manifolds.
Proposition 4.2.17. A complete hyperbolic manifoldM has ﬁnite vol-
ume if and only if its thick part is compact.
Proof. If the thick part is not compact, it contains an inﬁnite number
of points that stay pairwise at distance greater thanεn. The open balls of
radius εn
2 centred at these points are embedded and disjoint and all have
the same volume: therefore their union has inﬁnite volume.
If the thick part is compact, it has ﬁnite volume. Its boundary is also
compact, and hence has ﬁnitely many connected components. Therefore
the thin part consists of ﬁnitely many star-shaped neighbourhoods of cusps
and closed geodesics, each with compact boundary. Each such object has
ﬁnite volume (because it is contained in a bigger abstract truncated cusp
with compact base, or aR-tube, which has ﬁnite volume). □
Corollary 4.2.18.Every complete ﬁnite-volume hyperbolic manifoldM
is diﬀeomorphic to the interior of a compact manifoldN with boundary.
The boundary ∂N consists of manifolds that admit some ﬂat structure.
Proof. We have seen in the previous proof that the thick part ofM
is compact, and the thin part consists of ﬁnitely many star-shaped neigh-
bourhoods of cusps and closed geodesics, each with compact boundary.
Every cusp neighbourhood has compact base and hence contains a
smaller truncated cusp, diﬀeomorphic toX × [0, 1) for some closed ﬂat
manifold X. The complement inM of these truncated cusps is compact: it
is obtained from the thick part by adding ﬁnitely many neighbourhoods of
closed geodesics (that are compact) and compact portions of cusp neigh-
bourhoods. Each truncated cusp is diﬀeomorphic toX × [0, 1) and can be


## Page 130

122 4. THICK-THIN DECOMPOSITION
compactiﬁed by addingX × 1. The resulting manifoldN is compact with
boundary. □
Every boundary componentX of N inherits a ﬂat structure, uniquely
determined up to rescaling (diﬀerent truncations modifyX only by rescal-
ing.) As already mentioned, a truncated cusp is often called simply acusp:
for instance we say that the surface sketched in Figure 4.3 has two cusps.
We brieﬂy discuss the eﬀects of Corollary 4.2.18 on low-dimensional
manifolds. Let M be a complete hyperbolic manifold of ﬁnite volume of
dimension n. If n = 2, the manifoldM is diﬀeomorphic to the interior of
a compact surfaceN with boundary. Every boundary component ofN is
of course a circle.
If n = 3, the manifoldM is diﬀeomorphic to the interior of a compact
3-manifold N with boundary, and every boundary componentX of N is a
ﬂat surface: if M is orientable, then∂N also is, and by Proposition 3.4.12
it consists of tori.
4.2.6. Geodesic boundary and cusps.Most of the arguments of this
chapter extend to hyperbolic manifolds with compact geodesic boundary.
Proposition 4.2.19.Every complete ﬁnite-volume hyperbolic manifold
M with compact geodesic boundary is diﬀeomorphic to a compact mani-
fold N with some boundary components removed. The removed compo-
nents have a ﬂat structure. The remaining components form the geodesic
boundary of M and hence have a hyperbolic structure.
Proof. Double M along the geodesic boundary to obtain a ﬁnite-
volume hyperbolic manifold to which Corollary 4.2.18 applies. □
We brieﬂy discuss the eﬀects in low dimensions. In dimensionn = 2
the boundary ∂N consists of circles: some are geodesic components of
∂M, while some others are removed and correspond to cusps. In dimension
n = 3, ifM is orientable the removed boundary of∂N consists of tori (the
cusps), while the geodesic boundary ofM cannot contain any torus: a
torus has no hyperbolic structure by Corollary 4.2.6.
We add some information on fundamental groups. Let the manifolds
M and N be as in Proposition 4.2.19.
Proposition 4.2.20. For every boundary componentX of N the ho-
momorphism π1(X) → π1(N) induced by inclusion is injective. Two ho-
motopically non-trivial closed curves in distinct boundary components of
N are not freely homotopic inN.
Proof. We have M = C/Γ for some convex C ⊂ H3 with boundary
consisting of hyperplanes. If X is a (cusp) ﬂat component of ∂N, it is
isometric to Rn−1/ΓX and the mapΓX = π1(X) → π1(N) = Γ is injective
since it sends a Euclidean isometry to a corresponding parabolic isometry.


## Page 131

4.3. GEODESIC SPECTRUM, ISOMETRY GROUPS, AND FINITE COVERS 123
If X is geodesic, it lifts to a hyperplane in∂C, which is simply connected:
hence π1(X) → π1(N) is injective.
A homotopically non-trivial closed curveγ ⊂ X determines a conju-
gacy class of hyperbolic or parabolic transformations inΓ. Every element in
this class preserves a unique boundary hyperplane or a point at inﬁnity ofC
that projects back toX, so the conjugacy class determinesX. Therefore
distinct boundary components contain diﬀerent conjugacy classes. □
We note that a ﬁnite-volume hyperbolic manifoldM may have non-
compact geodesic boundary: an ideal polygon inH2 is a simple example.
4.3. Geodesic spectrum, isometry groups, and ﬁnite covers
We now study the geodesic spectrum and the isometry group of hy-
perbolic manifolds. The geodesic spectrum ofM is the set of the lengths
of all the closed geodesics inM. We prove that a ﬁnite-volumeM has a
discrete geodesic spectrum (with ﬁnite multiplicities) and a ﬁnite isometry
group.
Thenweturntoﬁnitecoversandderivesomegeometricconsequences
from the residually ﬁniteness of fundamental groups.
We are almost exclusively interested in ﬁnite-volume hyperbolic man-
ifolds. The general strategy when proving something about ﬁnite-volume
hyperbolic manifolds is the following: we ﬁrst suppose that the manifold is
compact for simplicity, and then we adapt the proof to the non-compact
case by looking at what happens to the cusps.
4.3.1. Geodesic spectrum. We start by proving the following.
Proposition4.3.1. Let M beaﬁnite-volumecompletehyperbolicman-
ifold. For everyL > 0there are ﬁnitely many closed geodesics inM shorter
than L.
Proof. Suppose that there are inﬁnitely many closed geodesics shorter
than L. We know that M decomposes into a compact part and a ﬁnite
union of truncated cusps. The compact part has ﬁnite diameterD.
Every closed geodesic intersects the compact part because a cusp
contains no closed geodesic. Therefore we can ﬁx a basepointx0 ∈ M
and connect x0 to these inﬁnitely many geodesics of length< L with arcs
shorter than D. We use these arcs to freely homotope the geodesics into
loops based at x0 of length < L + 2D, and lift the loops to arcs inHn
starting from some basepoint˜x0 ∈ Hn.
If two such arcs end at the same point, the corresponding closed
geodesicsin M arefreelyhomotopic: thisisexcludedbyProposition4.1.13,
hence these endpoints are all distinct. The orbit of˜x0 now contains inﬁn-
itely many points in the ballB(˜x0, L + 2D), a contradiction because the
orbit is discrete. □


## Page 132

124 4. THICK-THIN DECOMPOSITION
The lengths of the closed geodesics inM form a discrete subset ofR
called thegeodesic spectrumof M. Let ℓ1(M) > 0 be the minimum of the
spectrum of M: a shortest closed geodesicin M is a closed geodesic of
shortest length ℓ1(M). It is not necessarily unique (not even if considered
up to orientation reversal), but there are ﬁnitely many of them.
Proposition 4.3.2. If M is a closed hyperbolic manifold, then
injM = 1
2 · ℓ1(M)
and every shortest closed geodesic is simple.
Proof. The length of a closed geodesic is the minimum displacement
of the corresponding hyperbolic transformation, so Corollary 4.1.2 gives
the equality.
Let nowγ be a shortest closed geodesic. Consider Proposition 4.1.10:
if γ wraps multiple times along a curveη, then η is shorter than γ, a
contradiction. If γ self-intersects transversely at some point p, we can
split γ naturally as γ1 ∗ γ2 in π1(M, p), where bothγ1 and γ2 are shorter
than γ. Either γ1 or γ2 is non-trivial inπ1(M, p) and is hence hyperbolic,
but it has length smaller thanℓ1(M): this contradicts Corollary 4.1.15.□
Remark 4.3.3. A shortest geodesic may be non-simple whenM has
cusps! By doubling an ideal triangle along its boundary we construct a
hyperbolicsurfacecalledthe thrice-puncturedsphere whichhasthreecusps
andcontainsvariousclosedgeodesics,noneofwhichissimple. SeeChapter
6.
4.3.2. Isometry group. We now study the isometry groupIsom(M)
ofahyperbolicmanifold M. Recallthatthe normaliser N(H)ofasubgroup
H < G is the set of elementsg ∈ G such that gH = Hg. It is the biggest
subgroup of G containing H as a normal subgroup. The isometry group
Isom(M) has an algebraic representation.
Proposition 4.3.4. Let M = Hn/Γ be a complete hyperbolic manifold.
There is a natural isomorphism
Isom(M) ∼= N(Γ)/Γ.
Proof. Every isometry ϕ: M → M lifts to an isometry˜ϕ
Hn ˜ϕ →→
π
↓↓
Hn
π
↓↓
M ϕ
→→ M
such that ˜ϕΓ = Γ ˜ϕ: hence ˜ϕ ∈ N(Γ). The lift is uniquely determined up
to left- or right-multiplication by elements inΓ, hence we get a homomor-
phism
Isom(M) → N(Γ)/Γ


## Page 133

4.3. GEODESIC SPECTRUM, ISOMETRY GROUPS, AND FINITE COVERS 125
which is clearly surjective (every element inN(Γ) determines an isometry)
and injective (if ˜ϕ ∈ Γ then ϕ = id). □
Recall that thecentraliser of H < G is the set of elementsg ∈ G
such that gh = hg for all h. It is a subgroup ofG.
Exercise 4.3.5. LetM = Hn/Γ be a ﬁnite-volume hyperbolic manifold.
The centralizer ofΓ in Isom(Hn) is trivial.
4.3.3. Outer automorphism group. The automorphism group of a
group G is the groupAut(G) of all the isomorphismsG → G. The inner
automorphisms arethoseisomorphismsoftype g ↦→ hgh−1 forsome h ∈ G,
and they form a normal subgroupInt(G) ◁ Aut(G). The quotient
Out(G) = Aut( G)/Int(G)
is called theouter automorphism groupof G.
If x0, x1 are two points in a path-connected topological spaceX there
is a non-canonical isomorphismπ1(X, x0) → π1(X, x1), unique only up to
post-composing with an inner automorphism. Therefore there is acanon-
ical isomorphism Out(π1(X, x0)) → Out(π1(X, x1)). Hence Out(π1(X))
depends very mildly on the basepoint.
The group Homeo(X) of all homeomorphisms ofX does not act di-
rectly onπ1(X) because of the inner-automorphism ambiguity, but we get
a natural homomorphism
Homeo(X) − →Out(π1(X))
which isneither injectivenor surjective ingeneral. Wenote that homotopic
self-homeomorphisms give rise to the same element inOut(π1(X)).
4.3.4. Finiteisometrygroups. Weturnbacktohyperbolicmanifolds.
Proposition 4.3.6. If M is a ﬁnite-volume complete hyperbolic mani-
fold, the natural map
Isom(M) − →Out(π1(M))
is injective.
Proof. Set M = Hn/Γ, identify Γ with π1(M) and Isom(M) with
N(Γ)/Γ. With these identiﬁcations the map
N(Γ)/Γ − →Out(Γ)
is just the conjugacy action that sendsh ∈ N(Γ) to the automorphism
g ↦→ h−1gh of Γ. This is an inner automorphism if and only if there is a
f ∈ Γ such that h−1gh = f−1gf for all g ∈ Γ, that is ifhf−1 commutes
with g for all g ∈ Γ. Exercise 4.3.5 givesh = f ∈ Γ and hence the map is
injective. □
Corollary 4.3.7. Let M be a ﬁnite-volume complete hyperbolic mani-
fold. Distinct isometries ofM are not homotopic.


## Page 134

126 4. THICK-THIN DECOMPOSITION
This is a quite strong fact, from which we deduce the following.
Corollary 4.3.8. The isometry group of every ﬁnite-volume complete
hyperbolic manifold M is ﬁnite.
Proof. We know thatM is diﬀeomorphic to the interior of some com-
pact N having k ⩾ 0 boundary components. Let C1, . . . , Ck ⊂ M be
disjoint truncated cusps, all of the same small volume V > 0. Every
isometry ofM permutes these truncated cusps and ﬁxes their complement
C = M \ int(C1 ∪ . . . ∪ Ck).
The setC is compact and preserved by the Lie groupIsom(M), which
is hence compact. To show that it is ﬁnite it suﬃces to prove that it
is discrete. Suppose that a sequence of isometriesϕi converges to the
identity: we will deduce that ϕi is homotopic to id for suﬃciently large
values of i, a contradiction.
For anyε > 0 there is aϕi that moves all points ofC at distance< ε.
If ε > 0 is suﬃciently small, the isometryϕi preserves eachCi, it restricts
to an isometry of the ﬂat torusXi = ∂Ci and its extension toCi is just a
smaller rescaling ofϕi |Xi at every ﬂat torus leaf in the cusp.
Let alsoε > 0 be suﬃciently small, so thatε < injx M for everyx ∈ C.
We getd(x , ϕi (x)) < injx M for allx ∈ C, and sinceϕi acts on eachCi just
by rescaling its action onXi, we get the same inequality for everyx ∈ M.
For every x ∈ M there is a unique geodesicγx of length d(x , ϕi (x))
connecting x and ϕi (x). The geodesicsγx vary continuously withx and we
canusethemtodeﬁneahomotopybetween ϕi and id: acontradiction. □
The ﬁniteness of the isometry groups is peculiar to the hyperbolic
world: we will see in Remark 7.1.3 that the isometry group of a ﬂat torus
is inﬁnite.
4.3.5. Finite covers. Let M = Hn/Γ be a complete ﬁnite-volume
hyperbolic manifold. How many ﬁnite covers˜M → M are there aboveM?
Quite a lot, thanks to the following.
Proposition4.3.9. Thefundamentalgroup π1(M)ofacompleteﬁnite-
volume hyperbolic manifoldM is residually ﬁnite.
Proof. The group π1(M) is ﬁnitely generated (actually, ﬁnitely pre-
sented) becauseM is homeomorphic to the interior of a compact manifold
with boundary, so Proposition 3.1.15 applies. □
This algebraic fact has some nice geometric consequences. Recall
that ℓ1(M) is the length of the shortest closed geodesic inM.
Corollary 4.3.10.For everyL > 0 there is a ﬁnite cover˜M → M with
ℓ1( ˜M) > L.
Proof. Thereareﬁnitelymanyhyperbolicelements a1, . . . , ak ∈ π1(M)
such that every closed geodesic inM of length < L is freely homotopic


## Page 135

4.3. GEODESIC SPECTRUM, ISOMETRY GROUPS, AND FINITE COVERS 127
to some of these. By residually ﬁniteness there is a ﬁnite-index normal
H ◁ π 1(M) that does not contain any of the elements a1, . . . , ak, and
hence none of their conjugates.
The ﬁnite-index H determines a ﬁnite cover π : ˜M → M such that
π∗(π1( ˜M)) = H. A closed geodesic in˜M cannot be shorter thanLbecause
its image inM would be freely homotopic to one ofa1, . . . , ak. □
Corollary 4.3.11.If M is a closed hyperbolic manifold, for everyR > 0
there is a ﬁnite cover˜M → M with inj ˜M > R.
We can summarise this by saying that every closed hyperbolic manifold
has arbitrarily fat ﬁnite covers.
4.3.6. Subgroup separability.The geometric consequences of resid-
ually ﬁniteness are quite remarkable: we now introduce a stronger algebraic
notion that will lead to more geometric applications.
Let G beagroup. Asubgroup H < G isseparable iftheintersectionof
all the ﬁnite-index subgroups ofG containing H is H itself. In other words,
for every non-trivial elementa ∈ G \ H, there is a ﬁnite-index subgroup
G′ < G that contains H but not a and hence “separates”H from a.
By deﬁnition, the trivial subgroup{e} in G is separable if and only if
G is residually ﬁnite. Note that, for generalH < G, we cannot require the
subgroup G′ to be normal inG, because H itself may not be normal inG,
as opposite to{e}. The following proposition furnishes some interesting
examples.
Proposition 4.3.12. Every maximal abelian subgroupH in a residually
ﬁnite group G is separable.
Proof. More generally, we suppose thatH is maximal with respect to
some word relationf (h1, . . . , hn) = e. (In our case,f (h1, h2) = [ h1, h2].)
Since G is residually ﬁnite, there is a sequenceNi ◁ Gof ﬁnite-index normal
subgroups with ∩Ni = {e}.
We show thatH = ∩i HNi, and we conclude sinceHNi > N i has ﬁnite
index in G. We have H ⊂ ∩ i HNi. We now show that the elements of
∩i HNi satisfy f = e, and by maximality ofH we get H = ∩i HNi.
For every Ni and h1, . . . , hn ∈ H, we have f (h1Ni , . . . , hnNi ) ⊂ Ni
since its projection inG/Ni is trivial. Therefore∩i f (HNi , . . . , HNi ) = {e}
and the elements of∩i HNi satisfy f = e. □
Corollary 4.3.13. Let M be a complete ﬁnite-volume hyperbolic n-
manifold. The following subgroups are separable:
• the subgroup⟨ϕ⟩ = Z generated by a primitive hyperbolic trans-
formation ϕ;
• the subgroup π1(T ) generated by a(n − 1)-torus cusp section
T.
Proof. Both subgroups are maximal abelian, see Section 4.2.1. □


## Page 136

128 4. THICK-THIN DECOMPOSITION
We deduce a couple of geometric consequences from this algebraic
fact.
Corollary 4.3.14. Let M be a complete ﬁnite-volume hyperbolic n-
manifold. Every closed geodesicγ in M lifts to a closed geodesic in some
ﬁnite covers ofM of arbitrarily large degree.
Proof. We have M = Hn/Γ. The closed geodesic γ is obtained by
projecting the axisl of a primitive hyperbolic elementϕ ∈ Γ. Since ⟨ϕ⟩ is
separable, there are subgroupsH < π 1(M) of arbitrarily large index that
contain ⟨ϕ⟩. □
We have discovered in particular that there are many closed hyperbolic
manifolds of bounded injectivity radius with arbitrarily large volume. We
can also use separability to promote some primitive closed geodesics to
simple ones on some ﬁnite coverings.
Corollary 4.3.15. Let M be a complete ﬁnite-volume hyperbolic n-
manifold. Every primitive closed geodesicγ in M lifts to a simple closed
geodesic in some ﬁnite cover ofM.
Proof. We have M = Hn/Γ. The closed geodesic γ is obtained by
projecting the axis l of a primitive hyperbolic element ϕ ∈ Γ. If γ is
not simple, it self-intersects ink > 0 points, which lift to k transverse
intersectionsbetween l andsometranslates ϕ1(l), . . . , ϕk(l),forsome ϕi ∈
Γ. Therefore the elementsψ ∈ Γ such that ψ(l) intersects l transversely
are those of the formψ = ϕhϕi ϕl for some i = 1, . . . , k and h, l ∈ Z.
Since ⟨ϕ⟩ is separable, there is a ﬁnite-indexH < Γ with ϕ1, . . . , ϕk ̸∈
H and ⟨ϕ⟩ ⊂ H. No ϕhϕi ϕl lies in H, hence for everyψ ∈ H the lines l
and ψ(l) coincide or are disjoint. The linel projects to a simple geodesic
in Hn/H. □
Concerning cusps, we deduce analogously the following.
Corollary 4.3.16. Let M be a complete ﬁnite-volume hyperbolic n-
manifold and T ⊂ M be a (n − 1)-torus cusp section. The cusp section
T lifts to a cusp section in some ﬁnite covers ofM with arbitrarily large
degree.
Proof. The subgroupπ1(T ) is separable, so there are subgroupsH <
π1(M) of arbitrarily large ﬁnite degree containing it. □
4.4. The Bieberbach Theorem
The Margulis Lemma for Lie groups is fairly general and has important
applications also in the elliptic and ﬂat geometries. The most important
one is the Bieberbach Theorem.


## Page 137

4.4. THE BIEBERBACH THEOREM 129
4.4.1. Ellipticmanifolds. Recallthateverycompleteellipticmanifold
is isometric toSn/Γ for some ﬁnite groupΓ < O(n) = Isom( Sn−1) acting
freely. We now improve the Margulis Lemma 4.2.7 for G = O( n) by
promoting “nilpotent” to “abelian”. To this purpose we need the following.
Lemma 4.4.1. There is a neighbourhoodU of I ∈ O(n) such that for
every A ∈ O(n) and every B ∈ U we have
[A, [A, B]] = I =⇒ [A, B] = I.
Proof. We prove the lemma for the bigger Lie groupU(n) consisting
of all unitary matrices. An immediate computation shows that
[A, [A, B]] = I ⇐ ⇒ [A, BA−1B−1] = I.
Let Cn = ⊕Vi be the decomposition into orthogonal eigenspaces forA
and A−1 (with respect to the standard hermitian product ofCn). The
decomposition for the conjugateBA−1B−1 is just Cn = ⊕B(Vi ).
Let U be the neighbourhood ofI consisting of all matrices that move
every vector of an angle< π
2. Pick B ∈ U. Since theVi are orthogonal we
get B(Vi )∩Vj = {0}forall i ̸= j. Ontheother hand, theendomorphisms A
and BA−1B−1 commute and hence have a basis of common eigenvectors:
hence the only possibility is thatB(Vi ) = Vi for all i.
The restriction A|Vi is just λi I and hence commutes withB|Vi, for all
i. Therefore A and B commute everywhere. □
Corollary 4.4.2. There is a neighbourhoodU of I ∈ O(n) such that
everyﬁnitesubgroup Γ < O(n)generatedbysomeelementsin U isabelian.
Proof. We know from Margulis Lemma 4.2.7 that there is aU where
every such Γ is nilpotent. The previous lemma promotesΓ to an abelian
group, because [A, [A, . . .[A, B] · · ·]] = I implies after ﬁnitely many steps
that [A, B] = I for every generatorsA, B ∈ Γ ∩ U. □
Proposition 4.4.3. Let G be a compact Lie group andU a neighbour-
hood of e ∈ G. There is a N > 0 such that for every groupΓ < G, the
subgroup ΓU < Γ generated byΓ ∩ U has index at mostN in Γ.
Proof. Let W ⊂ U be a smaller neighbourhood such thatW−1 = W
and W 2 ⊂ U and set N = Vol(G)/Vol(W ) using the Haar measure forG.
We conclude by showing that ifgΓU and g′ΓU are distinct cosets of
ΓU in Γ, then gW ∩ g′W = ∅. This implies thatΓU has index at mostN
in Γ.
Indeed, if gW ∩ g′W ̸= ∅ there are w , w′ ∈ W such that gw = g′w′
which implies thatg−1g′ = w (w′)−1 ∈ W 2 ⊂ U and henceg−1g′ ∈ ΓU. □
We obtain a fairly interesting corollary about ﬁnite subgroups ofO(n).
Corollary 4.4.4. For every n there is a N > 0 such that every ﬁnite
subgroup of O(n) contains an abelian subgroup of index at mostN.


## Page 138

130 4. THICK-THIN DECOMPOSITION
4.4.2. IsometriesofEuclideanspace. Wenowturntoﬂatmanifolds.
Recall that a complete ﬂat manifold is isometric toRn/Γ for some discrete
group Γ < Isom(Rn) acting freely. Every isometryg of Rn can be written
uniquely as
g : x ↦− →Ax + b
for some A ∈ O(n) and b ∈ Rn. The rotational and translational partof
g are A and b respectively. Let Fix(A) be the ﬁxed points ofx ↦→ Ax.
Proposition 4.4.5. Let Ax + b be an isometry ofRn. Then:
• its inverse isA−1x − A−1b,
• if it acts freely thenFix(A) ̸= {0},
• ∃ a translation of Rn that conjugates it toAx + b′ with b′ ∈
Fix(A).
Proof. If it acts freely thenAx + b = x has no solutionx ∈ Rn. By
rewriting the equation as(A − I)x = −b we see thatA − I is not surjective,
hence not injective, henceFix(A) is non-trivial.
A translation x + d conjugates Ax + b into
(
A(x + d) + b
)
− d = Ax + (A − I)d + b.
Since A is orthogonal, we getIm (A − I) = ker( A − I)⊥ = Fix( A)⊥ and
hence there is ad such that b′ = (A − I)d + b ∈ Fix(A). □
Exercise 4.4.6. The commutator of two isometries is
[Ax + b, Cx + d] = [ A, C]x + A(I − C)A−1b + AC(I − A−1)C−1d .
In particular we get
[Ax + b, x + d] = x + (A − I)d .
4.4.3. Discrete groups. The homomorphism r : Isom( Rn) → O(n)
that sends every isometry to its rotational part induces an exact sequence
0 − →Rn − →Isom(Rn)
r
− →O(n) − →0
where we indicate byRn the group of translations ofRn.
Let Γ < Isom(Rn) be a discrete group. We get an exact sequence
0 − →H − →Γ − →r (Γ) − →0
where H ◁ Γ is thetranslation subgroupof Γ. The subgroupr (Γ) < O(n)
is not necessarily discrete, as the following example shows.
Example 4.4.7. Arototranslation in R3 is a rotation of some angleθ
along an axisr composed with a translation of some distancet > 0 in the
direction of r. A rototranslation generates a discrete groupΓ = Z acting
freely on R3, whose quotientR3/Γ is diﬀeomorphic toR2 × S1. If θ is not
commensurable with π the image r (Γ) is not discrete and forms a dense
subset of the circle inO(3) of all rotations alongr.
We now extend Corollary 4.4.4 to this context.


## Page 139

4.4. THE BIEBERBACH THEOREM 131
Theorem 4.4.8.For everyn there is aN > 0 such that every discrete
subgroup of Isom(Rn) contains an abelian subgroup of index at mostN.
Proof. We pick a small neighbourhoodU ⊂ O(n) of I, such that the
commutator is contracting in U (see the proof of the Margulis Lemma
4.2.7), it is symmetric (U = U−1) and A − I contracts vectors uniformly
for all A ∈ U, more precisely∥(A − I)v ∥ < 1
4 ∥v ∥ for all v ̸= 0.
Let Γ < Isom(Rn) be discrete and r (Γ)U be the group generated by
r (Γ) ∩ U. By Proposition 4.4.3 the index ofr (Γ)U in r (Γ) is bounded by
some N depending only onU. Therefore its counterimage inΓ
Γ∗ = r−1(r (Γ)U) ∩ Γ
has index inΓ bounded byN. The groupΓ∗ is the subgroup ofΓ consisting
of all Ax + b with A ∈ r (Γ)U. It remains to prove thatΓ∗ is abelian.
Let A1x + b1 and A2x + b2 be two elements inΓ∗. Deﬁne
Ai+1x + bi+1 = [A1x + b1, Ai x + bi ]
for all i ⩾ 2. Exercise 4.4.6 gives
(1) Ai+1x + bi+1 = [A1, Ai ]x + A1(I − Ai )A−1
1 b1 + A1Ai (I − A−1
1 )A−1
i bi
and hence
Ai+1 = [A1, Ai ],
bi+1 = A1(I − Ai )A−1
1 b1 + A1Ai (I − A−1
1 )A−1
i bi .
Suppose A1, A2 ∈ U. Since the commutator is contracting inU and Ai − I
contractvectorsuniformly, weget Ai → I and bi → 0as i → ∞. Therefore
Ai x + bi tends to the identity, and sinceΓ∗ is discrete itis the identity for
all i bigger or equal than somei0. In particular Ai0 = I and Lemma 4.4.1
used backwards givesA3 = [A1, A2] = I: hence A1 and A2 commute.
Since r (Γ∗) is generated byr (Γ∗) ∩ U, we deduce thatr (Γ∗) is abelian.
Therefore (1) may be restated as
(2) Ai+1x + bi+1 = x + (I − Ai )b1 + (A1 − I)bi .
We now consider the caseA1 ∈ U and A2 = I. We get
Ai+1x + bi+1 = x + (A1 − I)i−1b2.
Since A1 ∈ U we get(A1 −I)i b2 → 0 and hence(A1 −I)i b2 = 0 for somei,
which gives (A1 − I)b2 = 0 since A1 is diagonalisable. Thusb2 ∈ Fix(A1).
Wehaveprovedthatif Γ∗ containsatranslation x +b, thenb ∈ Fix(A)
for all A ∈ r (Γ∗) ∩ U. Since theseA generate r (Γ∗), the vectorb belongs
to
W = Fix(r (Γ∗)) =
{
x
⏐⏐ Ax = x ∀A ∈ r (Γ∗)
}
.
Pick now two arbitrary elementsAx + b and Cx + d in Γ∗. By (2) we get
[Ax + b, Cx + d] = x + (I − C)b + (A − I)d .


## Page 140

132 4. THICK-THIN DECOMPOSITION
By what just said(I − C)b + (A − I)d ∈ W. On the other hand
Im (I − C) = ker(I − C)⊥ = Fix(C)⊥ ⊂ W⊥
and hence (I − C)b ∈ W⊥, and analogously(A − I)d ∈ W⊥. We deduce
that (I − C)b + (A − I)d ∈ W ∩ W⊥ is trivial and all elements in Γ∗
commute. □
4.4.4. Crystallographic groups. A crystallographic group is a dis-
crete subgroup Γ < Isom(Rn) with compact quotientRn/Γ.
Proposition 4.4.9. The image r (Γ) of a crystallographic groupΓ <
Isom(Rn) is ﬁnite.
Proof. By Theorem 4.4.8 we may suppose thatΓ is abelian. We now
prove that Γ abelian implies that r (Γ) is trivial, i.e. all elements in Γ are
translations.
Suppose that Γ contains a non-translationAx + b. We conjugate Γ
by a translation as in Proposition 4.4.5 to getb ∈ Fix(A). Pick another
isometry Cx + d in Γ. The commutator
[Ax + b, Cx + d] = x + (A − I)d − (C − I)b
is trivial. Since A and C commute, we get (C − I)b ∈ Fix(A), hence
(A − I)d ∈ Fix(A) and ﬁnally d ∈ Fix(A).
We have proved thatd ∈ Fix(A) ⊊ R n for all elements Cx + d in
Γ. Therefore the Γ-orbit of 0 ∈ Rn is contained in Fix(A). But the
compactness ofRn/Γ implies that there is a compact fundamental domain,
and hence aR > 0such that every point inRn is R-close to any ﬁxed orbit:
a contradiction sinceFix(A) is a proper vector subspace ofRn. □
Corollary 4.4.10.Everycrystallographicgrouphasaﬁnite-indextrans-
lation subgroup isomorphic toZn.
Recall from Section 3.4.8 that aﬂat torus is a n-torus Rn/Γ where
Γ is a lattice,i.e. a discrete group isomorphic toZn that spans Rn as a
vector space.
Corollary4.4.11(Bieberbach’sTheorem). Everyclosedﬂat n-manifold
is ﬁnitely covered by a ﬂat torus.
We conclude the discussion by noting that there are no “cusps” in
Euclidean geometry.
Proposition4.4.12. Everyﬁnite-volumecompleteﬂatmanifoldisclosed.
Proof. Let M = Rn/Γ be a ﬁnite-volume ﬂat manifold. Up to taking
ﬁnite indexes, the groupΓ is abelian by Theorem 4.4.8. If all the elements
are translations, we are done: ﬁnite-volume easily implies thatΓ = Zn,
thus M is closed.
Suppose some element Ax + b is not a translation: every element
of Γ commutes with it and hence preserves the spaceFix(A) that has


## Page 141

4.4. THE BIEBERBACH THEOREM 133
dimension k < n ; henceM is isometric toFix(A)/Γ × Rn−k and has inﬁnite
volume. □
4.4.5. References. Most of the material introduced in this chapter is
standard and can be found in Benedetti – Petronio [4], Ratcliﬀe [49], and
of course in Thurston’s notes [56]. We have also consulted Thurston’s
book [57] for the part on chrystallographic groups. Proposition 4.3.12 was
taken from a paper of Long [36].


## Page 142

[No extractable text on this page]


## Page 143

CHAPTER 5
The sphere at inﬁnity
We have discovered that every complete hyperbolic manifold is a quo-
tient M = Hn/Γ for some discrete groupΓ < Isom(Hn) acting freely, and
we now raise the following question: how doesΓ act on the boundary∂Hn
at inﬁnity? Does the action ofΓ on ∂Hn furnish some information on the
geometry of M?
We show in this chapter that∂Hn subdivides naturally into two Γ-
invariant subsets: an open set Ω(Γ) called the domain of discontinuity
where the action ofΓ is properly discontinuous (like inHn) and a comple-
mentary closed setΛ(Γ) called thelimit setwhere the action ofΓ is more
chaotic.
We then use the limit set to deﬁne a canonical decomposition of
cuspedhyperbolicmanifoldsintoidealpolyhedra,calledthe Epstein–Penner
decomposition.
We also devote some time to prove Theorem 5.2.1, which states
that every smooth homotopy equivalence M → N between two closed
hyperbolic manifolds lifts to a mapHn → Hn that extends nicely to the
compactiﬁcations Hn → Hn. This fact will have important applications in
the study of hyperbolic manifolds in the subsequent chapters.
5.1. Limit set
How does a discrete groupΓ of isometries ofHn act on the bound-
ary at inﬁnity∂Hn? We now prove that∂Hn divides canonically into two
Γ-invariant subsets: an open zoneΩ(Γ) where Γ acts properly discontinu-
ously, and a closed oneΛ(Γ) where it does not. These regions are called
respectively thedomain of discontinuityand thelimit setof Γ.
5.1.1. The limit set. Throughout this section, we letΓ be a non-
trivial discrete group of isometries ofHn. Fix a point x ∈ Hn. We know
that the orbitΓ(x) is a discrete subset ofHn. The limit set Λ(Γ) ⊂ ∂Hn
of Γ is the set of all the accumulation points of the orbitΓ(x) in Hn.
Exercise 5.1.1. The limit set does not depend onx.
The limit set is clearly a closedΓ-invariant subset of∂Hn. If Γ′ < Γ
we obviously getΛ(Γ′) ⊂ Λ(Γ).
Exercise 5.1.2. If Γ′ has ﬁnite index inΓ then Λ(Γ′) = Λ(Γ).
135


## Page 144

136 5. THE SPHERE AT INFINITY
Recall that Γ is elementary if it ﬁxes a ﬁnite set of points inHn.
Example 5.1.3. If Γ is elementary and acts freely, that isM = Hn/Γ
is wither a cusp or a tube (see Proposition 4.2.9), thenΛ(Γ) = Fix(Γ)
consists of one or two points.
We now characterise the elementary subgroups ofIsom(Hn). Recall
that Γ is virtually Pif it has a ﬁnite-index subgroup that is P (where P is
some property).
Proposition 5.1.4. The following are equivalent:
(1) Γ is elementary,
(2) Γ ﬁxes either a pointx ∈ Hn, or a line, or a pointx ∈ ∂Hn and
all the horospheres centred atx,
(3) Γ is virtually abelian,
(4) Λ(Γ) consists of 0, 1, or 2 points.
Proof. (1) ⇒ (2). We expand on the proof of Proposition 4.2.9 by
taking elliptic elements into account.
By hypothesis Γ ﬁxes a ﬁnite set of points inHn. If some of them
lie in Hn, then Γ ﬁxes their barycenter and we are done. IfΓ ﬁxes more
than two points in∂Hn, a barycenter is also deﬁned: their convex hull is an
ideal polyhedron of dimension at least 2, we can truncate (via horospheres)
all the vertices by the same small volume and take the barycenter of the
vertices of the resulting compact combinatorial polyhedron. So we are
done also in this case. IfΓ ﬁxes two points, it ﬁxes a line.
We are left with the case whereΓ ﬁxes a pointx ∈ ∂Hn, and no other
ﬁnite set of points. The proof of Lemma 4.2.2 extends as is whenϕ2 is
elliptic, and shows that ifΓ contains a hyperbolic elementϕ1 then every
other non-trivial element ofΓ is either hyperbolic or elliptic and ﬁxes the
same axis of ϕ1, but this is excluded: soΓ contains only parabolics and
elliptics, and these must ﬁx all the horospheres centred atx, as required.
(2) ⇒ (3). The groupΓ is virtually isomorphic to a discrete subgroup
of Isom(Rm) for some m and we apply Theorem 4.4.8.
(3) ⇒ (4). By Exercise 5.1.2 we may suppose thatΓ is abelian. By
adapting the proof of Lemma 4.2.1 to elliptics we see (exercise) thatΓ
satisﬁes (2) and hence we get (4).
(4) ⇒ (1). If Λ(Γ) is empty then Γ is ﬁnite and ﬁxes a point by
Proposition 2.4.7. If it consists of one or two points, these are preserved
by Γ. □
5.1.2. Minimality. Let Γ be a non elementary non-trivial discrete
group of isometries ofHn. We are interested in the action ofΓ on Λ(Γ).
We want to prove that the action isminimal, that isΛ(Γ) has no invariant
non-empty proper closed subset.
Recall from Section 3.2.1 that every closed subsetS ⊂ Hn has a
well-deﬁned convex hullC(S) ⊂ Hn. The convex hullC(S) is closed and


## Page 145

5.1. LIMIT SET 137
is the intersection of all the closed half-spaces containingS. We have
C(S) ∩ ∂Hn = S ∩ ∂Hn.
Proposition5.1.5. If Γisnotelementary, itsactionon Λ(Γ)isminimal.
Proof. Let S ⊂ Λ(Γ) be a non-empty closedΓ-invariant subset. Since
S is Γ-invariant, its convex hullC(S) also is. SinceΓ is not elementary,S
contains at least two points and hence the intersectionC(S) ∩ Hn is not
empty. If x ∈ C(S) ∩ Hn, its Γ-orbit is conﬁned inC(S) and hence also
its accumulation points are: thereforeΛ(Γ) ⊂ C(S) ∩ ∂Hn = S and hence
Λ(Γ) = S. □
Corollary 5.1.6. If Γ is not elementary andΓ′ ◁ Γ is an inﬁnite normal
subgroup, then Λ(Γ′) = Λ(Γ).
Proof. For every γ ∈ Γ we have γ−1Γ′γ = Γ′, so γ sends the orbit
Γ′(x) to the orbitΓ′(γ(x)) and hence preservesΛ(Γ′). Therefore Λ(Γ′) is
Γ-invariant.
The limit setΛ(Γ′) is not empty becauseΓ′ is inﬁnite: the minimality
of Λ(Γ) implies that Λ(Γ′) = Λ(Γ). □
5.1.3. The convex core.If C ⊂ Hn is a closed convex set, we deﬁne
the nearest point retraction
r : Hn → C
as the map that sendsx to the point r (x) ∈ C that is closer to x. If
x ∈ ∂Hn, we interpret r (x) as the ﬁrst point ofC that is contained in
some horosphere centred atx. We have r (x) = x if and only ifx ∈ C.
The map r is continuous. Using the geodesic from x to r (x) we can
construct a natural deformation retraction ofHn onto the closed convex
set C.
Let Γ < Isom(Hn)be a non elementary non-trivial discrete group. The
convex hull ofΛ(Γ)is Γ-invariant, so it makes sense to deﬁne the following.
Deﬁnition 5.1.7. The convex core of the orbifold O = Hn/Γ is the
quotient C(Λ(Γ))/Γ ⊂ O of the convex hullC(Λ(Γ)) of the limit setΛ(Γ).
We are of course mostly interested in the case whereΓ acts freely and
hence M = Hn/Γ is a manifold. The deformation retraction deﬁned above
is Γ-invariant, therefore every complete hyperbolic manifoldM deformation
retracts onto its convex core. In particular,M is homotopically equivalent
to its convex core.
5.1.4. The domain of discontinuity. Let Γ < Isom(Hn) be a non
elementary non-trivial discrete group. Thedomain of discontinuityof Γ is
the open set
Ω(Γ) = ∂Hn \ Λ(Γ).
The following proposition explains the terminology.


## Page 146

138 5. THE SPHERE AT INFINITY
Proposition 5.1.8. The action ofΓ on Hn ∪ Ω(Γ) is properly discon-
tinuous.
Proof. The nearest point retractionr sends Hn ∪ Ω(Γ) to C(Λ(Γ)) \
Λ(Γ) and commutes withΓ. The action ofΓ on the latter set is properly
discontinuous (since it is contained inHn), so the action on the former
also is. □
Proposition 5.1.9. If Vol(Hn/Γ) < +∞ then Λ(Γ) = ∂Hn.
Proof. If Ω(Γ) ̸= ∅, pickx ∈ Ω(Γ). The pointx has a neighbourhood
system consisting of half-spaces. SinceΓ acts properly discontinuously on
Hn ∪ Ω(Γ), there is some half-spaceH which intersects only ﬁnitely many
Γ-translates, contradicting the ﬁnite volume hypothesis. □
In this book we are mostly interested in ﬁnite-volume complete hy-
perbolic manifolds or orbifoldsHn/Γ, and for these the limit set is just the
whole boundary, regardless ofΓ. This apparently disappointing piece of
information has some interesting algebraic consequences.
Corollary 5.1.10. If Vol(Hn/Γ) < +∞ then Γ does not contain any
non-trivial virtually abelian normal subgroup.
Proof. Let H ◁ Γ be virtually abelian. If H is inﬁnite, then Λ(H) =
Λ(Γ) = ∂Hn by Corollary 5.1.6, contradicting Proposition 5.1.4. IfH is
ﬁnite, then Fix(H) is a non-empty proper subspace ofHn and Γ acts on
Fix(H) because H is normal. If Fix(H) is a point then Γ is elementary,
otherwise we getΛ(Γ) ⊂ ∂Fix(H), a contradiction in both cases. □
Corollary 5.1.11.The fundamental group of a ﬁnite-volume complete
hyperbolic manifold is never solvable.
Proof. Solvable groups have non-trivial normal abelian subgroups, as
proved in Proposition 1.4.10. □
5.1.5. Schottky groups. In all the examples encountered up to now
the limit setΛ(Γ) consists of either few points or the whole of∂Hn. There
are many cases whereΛ(Γ) is a more interesting (and often beautiful) set.
The simplest examples are probably the following.
Choose a number k ⩾ 2 and 2k half-spaces H1, . . . , H2k ⊂ Hn with
disjoint closures inHn. The closed complementC = Hn \int(H1 ∪. . .∪H2k)
is a convex subset bounded by2k disjoint hyperplanes. If we pair isomet-
rically these hyperplanes we get a complete (exercise) hyperbolic manifold
M, which is henceM = Hn/Γ for someΓ. The hyperbolic manifoldM has
inﬁnite volume and is the interior of a compact manifold that decomposes
into one 0-handle andk 1-handles. The groupΓ is free withk generators.
Exercise 5.1.12. If n = 2, then Λ(Γ) ⊂ ∂H2 = S1 is a Cantor set.


## Page 147

5.1. LIMIT SET 139
5.1.6. Parabolic and hyperbolic points.Let Γ < Isom(Hn) be a non
elementary non-trivial discrete group. Aparabolic point x ∈ ∂Hn for Γ is a
point that is ﬁxed by some parabolic elementγ ∈ Γ. Similarly, ahyperbolic
point is a point that is ﬁxed by some hyperbolic element.
Proposition 5.1.13. The set of all parabolic (hyperbolic) points is ei-
ther empty or a dense subset ofΛ(Γ).
Proof. They clearly form aΓ-invariant subset, so its closure also is.
We conclude becauseΛ(Γ) is minimal. □
Corollary 5.1.14.If Vol(Hn/Γ) < +∞, the set of all parabolic (hyper-
bolic) points is either empty or dense in∂Hn.
5.1.7. Horoballsinthehyperboloidmodel. Intheconformalmodels,
horoballs are just Euclidean balls tangent to the boundary at inﬁnity. In
the hyperboloid modelIn there is a more algebraic description. Let
L = {x ∈ Rn+1 ⏐⏐ ⟨x , x⟩ = 0, x n+1 > 0}
be the positive light cone and recall from Section 2.2.3 that the boundary
at inﬁnity ∂I n may be interpreted as the set of rays inL. More than that,
every vector x ∈ L determines a horoballO centred at [x] ∈ ∂I n, via the
equation
O =
{
y ∈ In | − 1 ⩽ ⟨x , y⟩ < 0
}
.
The horoball gets smaller asx goes to inﬁnity.
Exercise 5.1.15. This is really a horoball centred at[x].
Hint. Prove that the boundary horosphere⟨x , y⟩ = −1 is orthogonal
to all the lines pointing tox. □
There is also a simple (and maybe surprising) geometric relation be-
tween the vector x and the corresponding horoball in the Poincaré disc
model Dn. Represent Dn inside the hyperplanexn+1 = 0, and letπ : In →
Dn the isometry obtained by projecting towardsP = (0, . . . ,0, −1), con-
sidered in Section 2.1.6. By projecting towardsP we also get a homeo-
morphism π : L → Dn.
Exercise 5.1.16. The Euclidean centre of the horoballπ(O) is π(x).
5.1.8. The Epstein–Penner decomposition. We now show that ev-
ery cusped ﬁnite-volume hyperbolic manifold decomposes canonically into
some ideal polyhedra. This decomposition is known as thecanonical or
Epstein–Penner decomposition.
Let M = Hn/Γ be a non-compact ﬁnite-volume complete hyperbolic
manifold. The manifold M is diﬀeomorphic to the interior of a compact
N with c ⩾ 1 boundary components. We ﬁx c disjoint truncated cusps
H1, . . . , Hc ⊂ M. Their lifts in Hn are c disjoint Γ-orbits Bi
1, . . . , Bi
c of
disjoint horoballs.


## Page 148

140 5. THE SPHERE AT INFINITY
Figure 5.1. By glueing two identical ideal triangles along
theirsideswegetathrice-puncturedsphere S, andwechoose
three disjoint truncated cusps in it having the same area
(left). In the universal cover, the two ideal triangles ofS
lift to the Farey tessellation already shown in Figure 3.8, and
each of the three truncated cusps lifts to inﬁnitely many dis-
joint horoballs (right). The Euclidean centre of the horoballs
is shown here, in relation to Exercise 5.1.16.
Example 5.1.17. Consider the thrice-punctured sphereS obtained by
gluing two identical copies of an ideal triangle along their sides. This is
a complete ﬁnite-volume hyperbolic surface with three cusps. We may
ﬁx three disjoint truncated cusps of the same area, as sketched in Figure
5.1-(left). These lift to three families of disjoint horoballs as in Figure
5.1-(right).
We use the hyperboloid modelIn and interpret a horoball as a point in
the positive light coneL as explained in the previous section. TheΓ-orbits
Bi
1, . . . , Bi
c of horoballs form a discrete subset inL. If we modify the initial
truncated cuspHj, all the pointsBi
j ∈ Lare rescaled by the same constant.
We make a crucial observation: the pointsBi
j are discrete inL, but
the rays that contain them form a countable dense subset ofL, because
they correspond to the parabolic points ofΓ, that are dense by Corollary
5.1.14.
We now deﬁneC ⊂ Rn+1 as the convex hull of the pointsBi
j in Rn+1.
We note thatC is Γ-invariant. An example is shown in Figure 5.2. The
convex hull will deﬁne a decomposition ofM into ideal polyhedra.
The convex hullC is contained in the convex hull ofL, that consists
of all the positive timelike and lightlike vectors. The following proposition
says that C intersects L into countably many half-lines based at theBi
j.
Proposition 5.1.18. The set C ∩ L is the set ofαBi
j for some α ⩾ 1.
Proof. Pick a pointx ∈ L not of this type: the segment0x does not
intersect {Bi
j }. Since {Bi
j } ⊂ L is discrete, we can perturb the hyperplane
H tangent inx to L so that it intersectsL into a small ellipsoid around0x,
and so that{Bi
j } lies on the opposite side ofH of x. Therefore x ̸∈ C.


## Page 149

5.1. LIMIT SET 141
Figure 5.2. A portion of the convex hullC for the thrice-
punctured sphere of Figure 5.1. As suggested by Exercise
5.1.16 we determine the horoballs inL by projecting the Eu-
clidean centers of their representations in the disc model.
The black half-line above each horoball inL is contained in
C, see Proposition 5.1.18.
Conversely, pick a pointx = αBi0
j0. The rays containing the points
Bi
j form a dense set inL, so we can ﬁnd a sequence ofBi
j ̸= Bi0
j0 such
that [Bi
j ] converges to [Bi0
j0 ]. Since {Bi
j } is discrete, the pointsBi
j go to
inﬁnity in the sequence and hence the segment with endpointsBi
j and Bi0
j0
approaches x in the limit. Thereforex ∈ C. □
Proposition 5.1.19. Every timelike ray intersects∂C exactly once.
Proof. Every timelike ray r enters in the interior of a polyhedron
spanned by someBi
j, so it intersectsC and hence ∂C. Consider a point
x ∈ ∂C ∩ r. Every supporting hyperplane forx must be spacelike because
the rays containing theBi
j are dense. ThereforeC ∩ r is a half-line andx
is its endpoint. □
In particular∂C = (∂lC) ⊔(∂tC) consists of the lightlike vectors∂lC =
C ∩ L and some timelike vectors∂tC. The previous proposition furnishes
a natural 1-1 correspondence∂tC ← →In with the hyperboloid model by
projecting along timelike lines.
Proposition5.1.20. Thetimelikeboundary ∂tC istessellatedbycount-
ably many Euclideann-dimensional polyhedra with vertices in{Bi
j }.
Proof. Consider a point x ∈ ∂tC and a supporting hyperplane H.
As already mentioned, the hyperplaneH is spacelike and the intersection
H ∩ ∂tC is some k-dimensional polyhedron, convex hull of ﬁnitely many


## Page 150

142 5. THE SPHERE AT INFINITY
Figure5.3. The Γ-invariantdecompositionofthehyperbolic
planeintoidealpolygonsobtainedbyprojectingtheEuclidean
polygonsofFigure5.2from ∂C to I2. ThisisinfacttheFarey
tessellation of Figure 5.1.
Figure 5.4. Diﬀerent choices of truncated cusps may lead
to distinct decompositions into ideal polyhedra.
points in {Bi
j }. If k < n we can rotateH until it meets one more pointBi
j
and after ﬁnitely many rotations we get an-dimensional polyhedron.
We have proved that∂tC is paved by n-dimensional polyhedra with
vertices in {Bi
j } and intersecting in common faces. The polyhedra are
locally ﬁnite because{Bi
j } is discrete, hence they form a tessellation.□
The tessellation of ∂tC is Γ-invariant and projects to a Γ-invariant
tessellation of the hyperbolic spaceIn into ideal polyhedra, which projects
in turn to a tessellation ofM into ﬁnitely many ideal polyhedra, called
the canonical or Epstein-Penner decomposition. An example is shown in
Figure 5.3. We have discovered the following.
Theorem 5.1.21. Every ﬁnite-volume non-compact complete hyper-
bolic manifold can be tessellated into ﬁnitely many ideal polyhedra.


## Page 151

5.2. EXTENSIONS OF HOMOTOPIES 143
Thecanonicaltessellationdependsonlyonthechoseninitialtruncated
cusps H1, . . . , Hc. Diﬀerent choices may give diﬀerent canonical tessella-
tions, an example is sketched in Figure 5.4. We can parametrize these
choices by recording the volumesV1, . . . , Vc>0 of the truncated cusps (or
the areas of∂Hi, that areVi /(n − 1) by Proposition 4.1.7).
Proposition 5.1.22. If we multiply all volumesV1, . . . , Vc by the same
constant λ > 0 we get the same canonical tessellation.
Proof. The set Bi
j changes by a global rescaling, and hence also the
tessellation does. Its projection onIn is unaﬀected. □
A way to get a truly canonical decomposition ofM, which depends
on no choice, consists of takingV1 = . . . = Vc > 0. Note that whenc = 1
any choice leads to the same canonical decomposition.
5.2. Extensions of homotopies
This section is entirely devoted to the proof of the following theorem.
Recall that every mapf : M → N between connected manifolds lifts to a
(non-unique) map ˜f : ˜M → ˜N between their universal covers.
Theorem 5.2.1. Let f : M → N be a smooth homotopy equivalence
between closed hyperbolicn-manifolds. Every lift ˜f : Hn → Hn extends to
a continuous map ˜f : Hn → Hn whose restriction ˜f |∂Hn : ∂Hn → ∂Hn is a
homeomorphism.
Every smooth homotopy equivalence extends to a homeomorphism of
theboundariesoftheuniversalcoverings. Thistheoremwillhaveimportant
consequences in the Chapters 8 and 13. To prove it, we need to deﬁne a
weaker notion of isometry.
5.2.1. Quasi-isometries. We introduce the following.
Deﬁnition 5.2.2. A mapF : X → Y between metric spaces is aquasi-
isometry if there are two constantsC1 > 0, C2 ⩾ 0 such that
1
C1
d(x1, x2) − C2 ⩽ d(F (x1), F (x2)) ⩽ C1d(x1, x2) + C2
for all x1, x2 ∈ X and d(F (X), y) ⩽ C2 for all y ∈ Y.
A quasi-isometry is an isometry up to some error: note thatF might
neither be continuous nor injective. Two metric spaces arequasi-isometric
if there is a quasi-isometryF : X → Y (which implies the existence of a
quasi-isometry G : Y → X, exercise) and quasi-isometry is an equivalence
relation between metric spaces. Intuitively, looking at a space up to quasi-
isometries is like watching it from some distance. Compact metric spaces
are obviously quasi-isometric to a point.
This notion is an important ingredient ingeometric group theory: one
may for instance give every ﬁnitely-presented groupG a canonical metric
(through itsCayley graph), uniquely determined up to quasi-isometries.


## Page 152

144 5. THE SPHERE AT INFINITY
5.2.2. Pseudo-isometries. Let f : M → N be a homotopic equiva-
lence between closed hyperbolicn-manifolds. Every continuous function
is homotopic to a smooth one, hence we suppose thatf is smooth. The
map lifts to a map˜f : Hn → Hn. We will prove that˜f is a quasi-isometry.
Actually, the map ˜f is also continuous and (as we soon see) Lipschitz:
it will be useful for us to retain this information on˜f to simplify some
arguments, so we introduce a diﬀerent (more restrictive but less natural)
version of a quasi-isometry.
Deﬁnition 5.2.3. A map F : X → Y between metric spaces is a
pseudo-isometry if there are two positive constantsC1, C2 > 0 such that
1
C1
d(x1, x2) − C2 ⩽ d(F (x1), F (x2)) ⩽ C1d(x1, x2)
for all x1, x2 ∈ X.
In particular a pseudo-isometry isC1-Lipschitz and hence continuous.
Let f : M → N be a smooth map between Riemanniann-manifolds; the
maximum dilatationof f at a pointx ∈ M is the maximum ratio∥dfx (v)∥
∥v∥
where v variesamongalltheunitaryvectorsin Tx. Themaximumdilatation
of f is the supremum of all maximum dilatations asx ∈ M varies.
Exercise 5.2.4. If f : M → N has maximum dilatationC the map f is
C-Lipschitz.
Proposition 5.2.5.Let f : M → N be a smooth homotopy equivalence
of closed hyperbolic n-manifolds. Every lift ˜f : Hn → Hn is a pseudo-
isometry.
Proof. Let g : N → M be a homotopic inverse. The homotopy be-
tween g ◦ f and idM lifts to a homotopy between a lift˜g ◦ f and idHn. Let
˜g be a lift ofg such that ˜g( ˜f (p)) = ( ˜g ◦ f )(p) for somep. It follows that
˜g ◦ f = ˜g ◦ ˜f.
Since M is compact, the mapf has some ﬁnite maximum dilatation
C. Since ˜f is locally likef, it also has maximum dilatationC and is hence
C-Lipschitz. The same holds forg. Therefore there is aC1 > 0 such that
d
(˜f (x1), ˜f (x2)
)
⩽ C1 · d(x1, x2) ∀x1, x2 ∈ Hn,
d
(
˜g(y1), ˜g(y2)
)
⩽ C1 · d(y1, y2) ∀y1, y2 ∈ Hn.
Since M is compact, the homotopy fromidM to g ◦ f moves every point
of M along some arc with uniformly bounded length< K . The lifted
homotopy ˜g ◦ ˜f inherits the same property, hence
d(x1, x2) − 2K ⩽ d
(
˜g( ˜f (x1)), ˜g( ˜f (x2))
)
⩽ C1 · d
(˜f (x1), ˜f (x2)
)
forall x1, x2 ∈ Hn. Therefore ˜f isapseudo-isometrywith C2 = 2K/C1. □


## Page 153

5.2. EXTENSIONS OF HOMOTOPIES 145
Figure 5.5. We use the half-space model. The hyperbolic
cosine of the distance betweenx and π(x) is the inverse of
the cosine ofθ (left). To determine the maximum dilatation
we decompose the tangent spaceTx orthogonally as U⊕ V
(right).
5.2.3. Boundary extension of a pseudo-isometry. We now prove
that not only pseudo-isometries Hn → Hn extend at inﬁnity, but their
extensions at ∂Hn eliminate the “errors” and behave nicely.
Theorem 5.2.6. Every pseudo-isometry F : Hn → Hn extends to a
continuous map F : Hn → Hn that injects ∂Hn into itself.
We separate the proof in some lemmas.
Lemma 5.2.7. Consider the picture in Figure 5.5. We have
cosh d(x , π(x)) = 1
cos θ .
Proof. We can work with the half-plane modelH2 ⊂ C and up to
translations and dilations suppose that π(x) = i. The geodesic r is
parametrized as i et. The Möbius transformationz ↦→ z+1
−z+1 sends r to γ
and ﬁxes i, hence γ(t) = i et +1
−i et +1 . Set s = d(x , π(x)). We get x = i es +1
−i es +1
and
cos θ = ℑx = ℑ (i es + 1)2
e2s + 1 = 2es
e2s + 1 = 2
es + e−s = 1
cosh s .
The proof is complete. □
Lemma 5.2.8. Let r ⊂ Hn be a line andπ : Hn → r be the orthogonal
projection to r. The maximum dilatation ofπ at x ∈ Hn is
d = 1
cosh s
where s = d(x , r).
Proof. We use the half-space model withr and x as in Figure 5.5-
(left): we know that cosh s = 1
cos θ. We have Tx = U ⊕ V as in Figure
5.5-(right) with V = ker d πx. A generator u of U is just rotated byd πx


## Page 154

146 5. THE SPHERE AT INFINITY
Figure 5.6. We use the red paths to estimate the distance
between F (r) and F (s). On the left: sinceF is C1-Lipschitz,
the blue path has length at mostC1d(r, s). Its projection
onto l has dilatation at most 1/cosh R by Lemma 5.2.8,
hence the red path inl has length at mostC1d(r, s)/ cosh R.
Therefore d(F (r), F (s)) ⩽ C1
d(r,s )
cosh R + 2R. On the right we
get d(F (r), F (s)) ⩽ 2R.
with respect to the Euclidean metric; with respect to the hyperbolic metric
we have
∥d πx (u)∥
∥u∥ = xn
π(x)n
= cos θ = 1
cosh s .
The proof is complete. □
We write pq for the segment with endpointsp and q and we denote
by Nr (A) the r-neighbourhood of A.
Lemma 5.2.9. Let F : Hn → Hn be a pseudo-isometry. There is a
R > 0 such that
F (pq) ⊂ NR
(
F (p)F (q)
)
for all distinct pointsp, q ∈ Hn.
Proof. Let C1, C2 be the pseudo-isometry constants ofF. Fix a suﬃ-
ciently big R so thatcosh R > 2C2
1. Let l be the line containingF (p) and
F (q). We show thatF (pq) can exit fromNR(l) only for a limited amount
of time. Let r s ⊂ pq be a maximal segment whereF (r s) is disjoint from
the interior ofNR(l), as the blue arc in Figure 5.6-(left). We have
1
C1
d(r, s) − C2 ⩽ d(F (r ), F (s)) ⩽ C1d(r, s).
We can improve the right inequality as shown in Figure 5.6-(left) and write
1
C1
d(r, s) − C2 ⩽ d(F (r ), F (s)) ⩽ C1
d(r, s)
cosh R + 2R.
Therefore ( 1
C1
− C1
cosh R
)
d(r, s) ⩽ 2R + C2.


## Page 155

5.2. EXTENSIONS OF HOMOTOPIES 147
F(p)
F(l(u))
F(l(t))atu <R
Figure 5.7. For every 0 < u < t , the pointF (l(u)) is con-
tained in the (yellow)R-neighbourhood of F (p)F (l(t)). If u
is big, the blue segmentF (p)F (l(u)) is long, while the red
one is bounded byR: hence the angleαtu between vt and vu
is small. Thereforevt is a Cauchy sequence.
Since cosh R > 2C2
1 we deduce that d(r, s) < M for some constant M
that depends only onC1 and C2.
We have proved thatF (pq) may exit fromNR(l) only on subsegments
of pq with length< M. Since F is C1-Lipchitz the curveF (pq)lies entirely
in NR+C1M(l), and we replaceR with R + C1M.
It remains to prove thatF (pq) lies entirely (up to taking a biggerR)
in the bounded setNR(F (p)F (q)): the proof is analogous and easier, since
Figure 5.6-(right) shows thatd(F (r ), F (s)) ⩽ 2R. □
In the previous and following lemmas, the constantR depends only
on the pseudo-isometry constantsC1 and C2.
Lemma 5.2.10. Let F : Hn → Hn be a pseudo-isometry. There is a
R > 0 such that for allp ∈ Hn and every half-linel starting from p there
is a unique half-linel′ starting from F (p) such that
F (l) ⊂ NR(l′).
Proof. We parametrize l as a geodesic l : [0 , +∞) → Hn with unit
speed. We havel(0) = p. Since F is a pseudo-isometry we get
lim
t→∞
d
(
F (p), F (l(t))
)
= ∞.
Let vt ∈ TF (p) be the unitary tangent vector pointing towardsF (l(t)):
Figure 5.7 shows that{vt }t∈N is a Cauchy sequence, hence it converges
to a unitary vectorv ∈ TF (p). Let l′ be the half-line starting fromF (p)
with directionv. It is easy to check thatF (l) ⊂ NR(l′) and l′ is the unique
half-line from p with this property. □
The previous lemma gives a recipe to transform every half-linel into
a half-line l′ that approximatesF (l). Since ∂Hn is an equivalence relation
of half-lines, we deﬁne the extensionF : ∂Hn → ∂Hn by sending l to l′.
Lemma 5.2.11. The boundary extension F : ∂Hn → ∂Hn is well-
deﬁned and injective.


## Page 156

148 5. THE SPHERE AT INFINITY
Figure 5.8. Let l and H be a line and an orthogonal hyper-
plane. The orthogonal projection ofH onto l is obviously a
point l∩H; thepseudo-isometry F mildlydistortsthispicture:
the image F (H) projects to a bounded segment inl′.
Proof. Let l1, l2 be two half-lines at bounded distanced(l1(t), l2(t)) <
M for all t. If d(l′
1(t), l′
2(t)) → ∞ we get d
(
F (l1(t)), F (l2(t))
)
→ +∞, a
contradiction sinceF is Lipschitz. Thereforel′
1, l′
2 are at bounded distance
and F is well-deﬁned.
Injectivity is proved analogously: ifl1 and l2 are divergent thenl′
1 and
l′
2 also are becauseF is a pseudo-isometry. □
It remains to prove that the extensionF : Hn → Hn is continuous. We
start by extending Lemma 5.2.10 from half-lines to lines.
Lemma 5.2.12. Let F : Hn → Hn be a pseudo-isometry. There is a
R > 0 such that for every linel there is a unique linel′ with F (l) ⊂ NR(l′).
Proof. Parametrize l as l : ( −∞, +∞) → Hn with unit speed. By
cutting l into two half-lines we know thatF (l(t)) is a curve that tends to
two distinct pointsx± ∈ ∂Hn as t → ±∞. Let l′ be the line with endpoints
x±. For anyt > 0 we have
F
(
l([−t, t ])
)
⊂ NR
(
F (l(−t))F (l(t))
)
and by sendingt → +∞ we deduce thatF (l) ⊂ NR(l′). □
The next lemma says that a pseudo-isometry does not distort much
lines and orthogonal hyperplanes. We will need it to prove continuity.
Lemma 5.2.13. Let F : Hn → Hn be a pseudo-isometry. There is a
R > 0 such that for any linel and hyperplaneH orthogonal tol, the image
F (H) projects orthogonally tol′ onto a bounded segment length smaller
than R.
Proof. See Figure 5.8. Consider a generic lines ⊂ H passing through
p = l ∩ H. By the previous lemmas F (s) ⊂ NR(s′) with s′ ̸= l′, and
the orthogonal projection onl′ sends any other line s′ onto a segment,
bounded by the images of the endpoints ofs′.


## Page 157

5.2. EXTENSIONS OF HOMOTOPIES 149
l
H
l'
s
dd
s1
s2
s'1
s'2
p
∞s
∞F(s )
F(p)
f
F
q
Figure 5.9. The lines s1 and s2 have a distance d from p
which depends on nothing (in fact,cosh d =
√
2). The lines
l′, s′
1, and s′
2 approximate up to an errorR the images ofl,
s1, and s2 along F. The projection q of F (p) on l′ is hence
R-close to F (p), which is in turn (C1d)-close to the lines
s′
i. Therefore q is (C1d + 2R)-close to boths′
1 and s′
2. This
easily implies thatf is (C1d + 2R)-close to q.
Consider as in Figure 5.9 the lines, with one endpoints∞ and the
corresponding endpointF (s∞) of s′. The ﬁgure shows that the projection
f of F (s∞) to l′ is at bounded distance from a pointq which does not
depend on s. □
Finally, we prove that the extendedF is continuous.
Lemma 5.2.14. The extension F : Hn → Hn is continuous.
Proof. Consider x ∈ ∂Hn and its imageF (x) ∈ ∂Hn. Let l be a half-
linepointingto x: hence l′ pointsto F (x). Thehalf-spacesorthogonalto l′
determine a neighbourhood system forF (x): consider one such half-space
S.
Let R > 0 be as in the previous lemmas. The imageF (l) is R-close
to l′, hence for suﬃciently bigt the point F (l(t)) and its projection into
l′ lie in S at distance > R from ∂S. By the previous lemma the image
F (H(t)) of the hyperplaneH(t) orthogonal to l in l(t) is also contained
in S. Hence the entire half-space bounded by one suchH(t) goes insideS
through F. This shows thatF is continuous at every pointx ∈ ∂Hn. □
With some eﬀort, we have proved that every pseudo-isometry ofHn
extends continuously to the boundary. Theorem 5.2.1 now follows easily.
Proof of Theorem 5.2.1. We know that˜f is a pseudo-isometry and
hence extends to a map˜f : Hn → Hn that sends injectively∂Hn to itself.
It remains to prove that˜f |∂Hn is a homeomorphism.
Pick a smooth homotopic inverseg for f. The homotopyidM ∼ g ◦ f
lifts to a homotopyidHn ∼ ˜g ◦ ˜f for some lift ˜g. Since M is compact,


## Page 158

150 5. THE SPHERE AT INFINITY
the latter homotopy moves every point at uniformly bounded distance and
hence ˜g ◦ ˜f extends continuously to the identity on∂Hn, and the same
holds for ˜f ◦ ˜g. Therefore ˜g|∂Hn is the inverse of˜f |∂Hn and they are both
homeomorphisms. □
5.2.4. References. As in the previous chapters, we have mostly con-
sulted Benedetti – Petronio [4], Ratcliﬀe [49], and Thurston’s notes [56].
The Epstein – Penner decomposition is taken from their 1988 paper [17].


## Page 159

Part 2
Surfaces


## Page 160

[No extractable text on this page]


## Page 161

CHAPTER 6
Surfaces
A surface is a diﬀerentiable manifold of dimensionn = 2, possibly
with boundary. The closed orientable surfaces are classiﬁed topologically
bytheirEulercharacteristic, acompleteinvariantthatalsodeterminestheir
possible geometries: a closed surface has a hyperbolic, ﬂat, or spherical
structure if and only if its Euler characteristic is negative, null, or positive.
We devote some time here to expose the topological classiﬁcation
and the geometrisation of closed surfaces. Then we describe some of the
beautiful features of geometrisation: the geometry of a surface (typically,
hyperbolic geometry) can be used to prove in an elegant way various non-
trivial topological facts.
We end this chapter by deﬁning and studying themapping class group,
a group that encodes the topological symmetries of a surface.
6.1. Topological classiﬁcation
A surface can be topologically quite complicated: think for instance
of R2 with a Cantor set removed. We decide to restrict our investigation
to the surfacesof ﬁnite type, i.e. obtained from a closed one by removing
points and/or open discs: these include all the compact surfaces with or
without boundary. We introduce here these surfaces and classify them up
to diﬀeomorphism.
We manipulate surfaces using various cut-and-paste tools: bound-
ary gluings, removal of discs or points, handle decompositions, connected
sums. See Section 1.1 to refresh these notions.
6.1.1. Gluing surfaces. A simple way to construct a surface is by
gluing simpler surfaces along their boundaries. We show here that the
glued surface depends only on the orientation classes of the gluing maps.
Two self-diﬀeomorphisms ofS1 are co-oriented if they both preserve
or both invert the orientation ofS1.
Lemma 6.1.1. Co-oriented self-diﬀeomorphisms ofS1 are isotopic.
Proof. Let f0, f1 : S1 → S1 be two co-oriented self-diﬀeomorphisms.
Their lifts ˜f0, ˜f1 : R → R are periodic and monotone, hence˜ft = (1 − t) ˜f0 +
t ˜f1 also is and descends to an isotopyft connecting f0 and f1. □
153


## Page 162

154 6. SURFACES
Figure 6.1. A surface of genus 3 may be represented in
various ways.
Corollary 6.1.2.Ifwegluetwoorientedsurfacesalongtheirboundaries
via orientation-reversing diﬀeomorphisms, the resulting oriented surface
does not depend on the diﬀeomorphisms chosen.
Proof. Alltheorientation-reversinggluingmapsareisotopicbyLemma
6.1.1, and isotopic gluing maps produce diﬀeomorphic manifolds, as stated
in Proposition 1.1.15. □
In a non-oriented context, we have two possible maps for every glued
boundary component.
Corollary 6.1.3. If we glue two discs we get a sphere.
Proof. The two discs are copies of D2 ⊂ C glued along a diﬀeo-
morphism ϕ: S1 → S1. Up to mirroring one we may suppose thatϕ is
orientation-reversing, and by Corollary 6.1.2 we may suppose thatϕ(z) =
¯z. The resulting surface is diﬀeomorphic to a sphere (exercise). □
Warning 6.1.4. In dimensionn ⩾ 7, by gluing two discs we may get
a manifold that is homeomorphic butnot diﬀeomorphic to a sphere! See
Section 6.4.2.
6.1.2. Classiﬁcationofsurfaces. InSection1.1.13weintroducedthe
connectedsum, atwo-stepsoperationwhichconsistsofﬁrstremovingballs
and then gluing the new sphere boundaries. LetSg be the connected sum
Sg = T # . . .#T  
g
of g tori T = S1 × S1. By convention S0 = S2 is the sphere andS1 = T
is the torus. The numberg is the genus of the closed surfaceSg. The
surface Sg may be represented inR3 in various ways, see Figure 6.1.
Proposition 6.1.5. We have χ(Sg) = 2 − 2g.
Proof. Let S, S′ besurfacesand D ⊂ int(S), D′ ⊂ int(S′)discs. Then
χ(S#S′) = χ(S \ D) + χ(S′ \ D′) − χ(S1) = χ(S) + χ(S′) − 2.
Therefore χ(Sg) = 2 − 2g by induction ong. □


## Page 163

6.1. TOPOLOGICAL CLASSIFICATION 155
Figure 6.2. The 0-handle and k 1-handles form a subsur-
face S′⊂ S with connected boundary, to which the 2-handle
is attached (left). A 0-handle and two linked 1-handles (cen-
tre). If we attach a 2-handle to the centre ﬁgure we get a
handle decomposition of the torus (right).
Theorem 6.1.6 (Classiﬁcation of surfaces).Every closed, connected,
orientable surface is diﬀeomorphic toSg for some g ⩾ 0.
Proof. Being a closed manifold, every closed orientable surfaceS has
a handle decomposition. By Proposition 1.7.13 it has one with one 0-
handle, a certain number k of 1-handles, and one 2-handle. We get
χ(S) = 2 − k. We prove by induction on k that k = 2 g is even and
S is diﬀeomorphic toSg.
If k = 0 then S is obtained by gluing two discs (the 0- and 2-handle)
and is hence a sphere by Corollary 6.1.3.
Suppose k > 0. The 0-handle is a disc and the 1-handles are rectan-
gles attached to its boundary as in Figure 6.2-(left). Note that sinceS is
orientable every rectangle is attached without a twist, otherwise it would
create a Möbius strip. The 0- and 1-handles altogether form a compact
surface S′ ⊂ S with only one boundary component, to which the 2-handle
is attached.
Since ∂S′ is connected, every rectangle is linked to some other rec-
tangle as in Figure 6.2-(centre). A pair of linked rectangles form a sub-
subsurface S′′ ⊂ S′ ⊂ S asinFigure6.2-(centre)withconnectedboundary.
If we cutS along the curve∂S′′ and then cap oﬀ with two discs we perform
the inverse of a connected sum.
Therefore S = S1#S2, where S1 is S′′ with a disc attached,i.e. a
torus as Figure 6.2-(right) shows. The surfaceS2 decomposes into a 0-
handle, k − 2 1-handles, and one 2-handle. We conclude by induction on
k. □
6.1.3. Homology. The homology ofSg is easily calculated.
Proposition 6.1.7. We have
H0(Sg, Z) = Z, H 1(Sg, Z) = Z2g, H 2(Sg, Z) = Z.


## Page 164

156 6. SURFACES
Figure 6.3. These 6 oriented curves represent a symplectic
basis for H1(S3, Z) = Z6.
Figure 6.4. The ﬁnite type surfaceSg,b,p.
Proof. Since Sg isclosed,connected,andorientable,wehave H0(Sg) =
H2(Sg) = Z. Since χ(Sg) = 2 − 2g, the groupH1(Sg) has rank 2g. By
Poincaré dualityH1(Sg) = H1(Sg) = Hom( π1(Sg), Z) has no torsion. □
Recall from Section 1.6.3 that by ﬁxing an orientation forSg we get
a symplectic intersection formω on H1(Sg, Z). A basis for H1(Sg, Z) is
symplectic if ω =
(0 Ig
−Ig 0
)
with respect to this basis: see Figure 6.3.
Thealgebraicintersection oftwoclosedcurvesistheintersectionform
of their classes inH1(Sg, Z); if the curves are transverse, this is just the
algebraic sum of their intersections, where each intersection counts as±1
according to the local orientations.
6.1.4. Surfacesofﬁnitetype. Weextendourinvestigationtoalarger
interesting class of surfaces.
Deﬁnition 6.1.8. Let g, b, p ⩾ 0 be three natural numbers. Thesur-
face of ﬁnite typeSg,b,p is the surface obtained fromSg by removing the
interior of b disjoint discs andp points.
See Figure 6.4. We say that Sg,b,p has genus g, has b boundary
components, and p punctures. Its Euler characteristic is
χ(Sg,b,p ) = 2 − 2g − b − p.


## Page 165

6.2. GEOMETRISATION 157
We also use the notationSg,b to indicate Sg,b,0.
Proposition 6.1.9. Every compact connected orientable surface with
boundary is diﬀeomorphic toSg,b for some g, b ⩾ 0.
Proof. Let S be a compact orientable surface with someb boundary
components. If we glueb discs to ∂S we get a closed orientable surface,
hence diﬀeomorphic toSg for someg ⩾ 0. The originalS is obtained from
Sg by removing the interiors ofb disjoint open discs. □
The compact connected orientable surfaces withχ > 0 are S2 = S0
and D2 = S0,1, while those withχ = 0 are the annulusA = S0,2 and the
torus T = S1.
Corollary 6.1.10 (Smooth Jordan curve Theorem).Every smooth sim-
ple closed curveγ ⊂ R2 bounds a disc.
Proof. Consider the curve γ inside S2 = R2 ∪ {∞}. By cutting S2
along γ we get one or two compact orientable surfaces with non-empty
boundary and withχ = 2 in total. The only possibility is that we get two
discs. □
6.1.5. Triangulations. Like every honest smooth compact manifold,
compact surfaces admit smooth triangulations, see Section 1.7.7. Con-
versely, we may use simplicial complexes to construct smooth surfaces
combinatorially.
Let X be a two-dimensional pure simplicial complex where every edge
is incident to two faces, and the link of every vertex is a circle.
Proposition 6.1.11. The complex X is the smooth triangulation of a
closed surface S, unique up to diﬀeomorphism.
Proof. By dualising X we get a handle decomposition: triangles,
edges, and vertices transform into 0-, 1-, and 2-handles, and we get a
smooth surface S triangulated by X. The way the handles are attached
is determined up to isotopy, thereforeS is determined up to diﬀeomor-
phism. □
Warning 6.1.12. It is worth noting that this procedure (getting a
unique smooth structure from a simplicial complex) does not work in all
dimensions (here we used implicitly Lemma 6.1.1).
6.2. Geometrisation
We now prove that every surface Sg,b,p of ﬁnite type can be ge-
ometrised, that is it may be equipped with a hyperbolic, ﬂat, or elliptic
metric. The metric type is prescribed by the sign of the Euler characteris-
tic of the surface.


## Page 166

158 6. SURFACES
a b
c
b
c c
Figure6.5. Apair-of-pants, anannuluswithonepuncture, a
disc with two punctures, and a thrice-punctured sphere. The
last three surfaces may be considered as some degenerated
hyperbolicpairs-of-pantswhereoneormoreboundarylengths
a, b, or c are zero, and we get cusps instead of geodesic
boundary components there.
6.2.1. Hyperbolic pair-of-pants. The sphere has of course an ellip-
tic structure, and the torus has many ﬂat structures, see Section 3.4.8.
We now construct hyperbolic structures on all the surfacesSg of genus
g ⩾ 2, and more generally on all the surfacesSg,b,p of negative Euler char-
acteristic. We start with a simple block, thepair-of-pants S0,3, with Euler
characteristic −1.
Proposition 6.2.1.Given three real numbersa, b, c ⩾ 0 there is (up to
isometries) a unique complete ﬁnite-volume hyperbolic pair-of-pants with
geodesic boundary, with boundary curves of lengtha, b, and c.
Whensome length ina, b, c iszero, wemean thatthe geodesic bound-
ary is actually a cusp (recall Section 4.2.5) and hence the surface is topo-
logically a punctured annulus S0,2,1, a twice punctured disc S0,1,2, or a
thrice-punctured sphere S0,0,3: see Figure 6.5.
To prove this proposition we construct some right-angled hexagons
in H2 as in Figure 6.6-(left). Three alternate sides on a hexagon are
three pairwise non-incident sides, like thea, b, c shown in the ﬁgure. A
degenerate hexagon is one where the length of some alternate sides is zero
as in Figure 6.7.
Lemma 6.2.2.Given three real numbersa, b, c ⩾ 0 there exists (up to
isometries) a unique (possibly degenerate) hyperbolic right-angled hexagon
with three alternate sides of lengtha, b, and c.
Proof. We ﬁrst supposea, b > 0. The construction of the hexagon
is depicted in Figure 6.6-(right). Ifx = 0 the blue lines coincide, hence
P = Q and f (0) = 0. The functionf : [0 , +∞) → [0, +∞) is continuous,
strictly monotonic, and withlimx→∞ f (x) = ∞: therefore there is precisely
one x such that f (x) = c.
If exactly two parameters are zero, saya = b = 0, a simpler construc-
tion works: take a segment of lengthc as in Figure 6.7-(centre), draw the
perpendiculars at their endpoints, and a line connecting the endpoints of
these.


## Page 167

6.2. GEOMETRISATION 159
x
f(x)
a b
c
a b
P Q
A B
A' B'
r s
T U
l
Figure 6.6. A right-angled hexagon with alternate sides of
length a, b and c (left) and its construction (right), which
goes as follows: take a line l with two arbitrary points A
and B in it (bottom black). Draw the perpendiculars from
A and B (red). At distances a and b we ﬁnd two pointsA′
and B′ and we draw again two perpendiculars (black)r and
s, with some points at inﬁnityP and Q. Draw the (unique)
perpendiculars tol pointing toP and Q(blue): they intersect
l in two pointsT and U. Note that AT and UB have some
ﬁxed length depending only on a and b. We can vary the
parameter x = T U: if x > 0 the lines r and s are ultra-
parallel and there is a unique segment orthogonal to both of
some length f (x).
Figure 6.7. A right-angled hexagon with parameters
a, b, c ⩾ 0 degenerates to a pentagon, quadrilateral, or tri-
angle with ideal vertices if one, two, or three parameters are
zero.
If a = b = c = 0, pick any ideal triangle. Ideal triangles are indeed
unique up to isometry: use the half-space model and recall thatPSL2(R)
acts transitively on the ordered triples of points in∂H2. □
The most degenerate case is so important that we single it out.
Corollary 6.2.3. All the ideal triangles inH2 are isometric.


## Page 168

160 6. SURFACES
a b
c
a b
c
22 22
22
a b
c
22 22
22
Figure 6.8. By gluing two identical right-angled hexagons
along their black sides we get a hyperbolic pair-of-pants with
geodesic boundary.
Bygluingtwoidentical(possiblydegenerate)hexagonsalongalternate
sides as in Figure 6.8 we construct a (possibly degenerate) hyperbolic pair-
of-pantswhosegeodesicboundaryconsistsofthreesimpleclosedgeodesics
of length 2a, 2b, and 2c.
Proof of Proposition 6.2.1. We have proved the existence of a geo-
desic pairs-of-pants with any parametersa, b, c ⩾ 0, and we now turn to
its uniqueness. Let P be a pair-of-pants with geodesic boundary curves
C1, C2, C3 of length a, b, c > 0.
Since P, C1, andC2 are compact, there are pointsx1 ∈ C1 and x2 ∈ C2
at minimum distanced = d(x1, x2), connected by some curveγ3 of length
d. The curve is a simple geodesic orthogonal to bothC1 and C2: if not,
some other curve connectingx1 and x2 would be shorter. We construct
analogously two orthogeodesicsγ1 and γ2 connecting C2 to C3 and C3 to
C1 having minimal length.
The fact that γ1, γ2, γ3 have minimal length easily implies that they
are disjoint (if they intersect, we ﬁnd shorter curves). The three ortho-
geodesics subdivide P into two hexagons, with alternate sides of length
L(γ1), L(γ2), and L(γ3): by Lemma 6.2.2 the two hexagons are isomet-
ric, and hence the three other alternating sides also have the same length
a
2 , b
2, and c
2. Hexagons are unique up to isometry and hence the original
pair-of-pants also are.
We can extend the argument to the more general case2a, 2b, 2c ⩾ 0
as follows. If a = 0, a neighbourhood of the puncture is a cusp, and we
truncate it at some small horocycleC1 (we do the same ifb = 0 or c = 0).
After these truncations we get a compact pair-of-pants (whose boundary
is not geodesic at the horocycles) and decompose it into two hexagons as
above. The resulting curveγ3 is orthogonal to the horocycleC1, hence it
extends to a half-line pointing towards the puncture. The curvesγ1, γ2, γ3
decompose the surface into degenerate hexagons. □
6.2.2. Hyperbolic surfaces. The pairs-of-pants can be used as build-
ing blocks to construct topologically all ﬁnite type surfaces withχ < 0.


## Page 169

6.2. GEOMETRISATION 161
Figure 6.9. Every surface of ﬁnite type withχ < 0 decom-
poses into pair-of-pants. We show here a decomposition of
S3.
Proposition 6.2.4. If χ(Sg,b,p ) < 0 then Sg,b,p decomposes topologi-
cally into −χ(Sg,b,p ) (possibly degenerate) pairs-of-pants.
Proof. If b + p = 0 then g ⩾ 2 and the surface decomposes easily
in many ways, see for instance Figure 6.9. Ifb + p > 0 and χ < −1, a
decomposition for Sg,b,p may be obtained from one ofSg,b−1,p or Sg,b,p−1
by inserting one more (possibly degenerate) pair-of-pants. Ifχ = −1 the
surface is either a pair-of-pants, or a torus with a puncture or boundary
component, which is in turn obtained by glueing two boundary components
of a pair-of-pants. □
We can use this building block to construct hyperbolic structures.
Corollary 6.2.5. If χ(Sg,b,p ) < 0 then Sg,b,p admits a complete hyper-
bolic metric withb geodesic boundary components of arbitrary length.
Proof. Decompose Sg,b,p in pair-of-pants, assign an arbitrary length
to all the closed curves of the decomposition (the 6 red curves shown in
Figure 6.9) and give each pair-of-pants the hyperbolic metric determined
by the three assigned boundary lengths. Everything glues to a complete
hyperbolic metric forSg,b,p thanks to Proposition 3.5.4. □
Can we geometrise the few orientable surfaces withχ ⩾ 0? Yes,
but since there are no cusps in the elliptic and ﬂat geometries we do not
consider surfaces with punctures. The compact orientable surfaces with
χ > 0 are the sphere and the disc, and they all have an elliptic metric with
geodesic boundary (represent the disc as a hemisphere). Those withχ = 0
are the torus and the annulus, and they admit ﬂat metrics with geodesic
boundary.


## Page 170

162 6. SURFACES
Figure 6.10. The Klein bottle immersed inR3.
6.2.3. Non-orientable surfaces. The classiﬁcation of all the ﬁnite-
type non-orientable surfaces is also simple. LetSno
g be the connected sum
Sno
g = RP2# . . .#RP2
  
g
of g ⩾ 1 copies of the projective planeRP2.
Proposition 6.2.6. We have χ(Sno
g ) = 2 − g. The surface Sno
2 is
diﬀeomorphic to the Klein bottleK shown in Figure 6.10. We have
Sg#RP2 ∼= Sno
2g+1.
Proof. The formula forχ follows fromχ(RP2) = 1. The Klein bottle
K may be cut along a closed curve into two Möbius strips, andRP2 minus
an open disc is a Möbius strip too, henceRP2#RP2 = K. The latter
equalityisaconsequenceof T #RP2 ∼= K#RP2 whichisleftasanexercise.
□
Proposition 6.2.7. Every closed, connected, non-orientable surface is
diﬀeomorphic to Sno
g for some g ⩾ 1.
Proof. Pick a handle decomposition of the surfaceS. Since it is non-
orientable, at least one 1-handle is twisted and forms a Möbius strip. We
have proved that S contains a Möbius strip, and we now remove it and
substitute it with a disc to get a new surfaceS′. We have S = S′#RP2
and we conclude by induction on−χ(S′). □
We may also denote bySno
g,b,p the surface obtained fromSno
g by re-
moving the interiors ofb discs and p points.
Exercise 6.2.8. If χ(Sno
g,b,p ) < 0 then Sno
g,b,p decomposes into pairs-
of-pants and hence admits a complete hyperbolic metric with geodesic
boundaries of arbitrary length.
As in the orientable case, compact surfaces withχ ⩾ 0 can be ge-
ometrised: these are RP2, the Möbius strip, and the Klein bottle. The
ﬁrst has an elliptic structure while the other two have ﬂat structures with
geodesic boundary.


## Page 171

6.2. GEOMETRISATION 163
n
n2
Figure 6.11. A mirror, a cone point, and a corner reﬂector
on a two-dimensional orbifold.
6.2.4. Orbifolds. We can push the classiﬁcation and geometrisation
further to compact two-dimensional orbifolds.
The ﬁnite subgroups of O(2) are: the cyclic Z2 generated by a re-
ﬂection, the cyclic Zn generated by a rotation, and the dihedralD2n con-
taining reﬂections and rotations. Therefore every singular point x on a
two-dimensional orbifoldO is locally of one of these types:
V /Z2 , V / Zn , V / D2n
with V the unit ball inR2. The point x is called respectively amirror, a
cone, and acorner reﬂector point of O, see Figure 6.11.
Weconsiderforsimplicityonly locallyorientable orbifolds,i.e.orbifolds
with isotropy groups in SO(2). In other words, we exclude mirrors and
corner reﬂectors. One such orbifoldO is easily encoded as
(S, p1, . . . , pk)
where S is a surface, and the orbifoldO is S with k cone points with
rotational isotropy groups of orderp1, . . . , pk > 1. We do not requireO
to be globally orientable, soS can be a non-orientable surface likeRP2.
We deﬁne theEuler characteristicof that orbifold as
χ(O) = χ(S) −
∑ (
1 − 1
pi
)
.
This deﬁnition is designed to behave well under coverings. Thedegree of
an orbifold covering O → O′ is the cardinality of the ﬁbre of any non-
singular point inO′.
Proposition 6.2.9. If O → O′ is a degree-d orbifold covering then
χ(O) = d · χ(O′).
Proof. Pick a cellularisation of O′ whose vertices contain the cone
points: it lifts to a similar cellularisation ofO. We consider all the vertices
of these cellularisations as cone points, possibly with order 1, and we get
χ(O′) = V − E + F −
∑ (
1 − 1
p′
i
)
= −E + F +
∑ 1
p′
i


## Page 172

164 6. SURFACES
orbifold Γ
S2 {e}
(S2, n, n) Zn
RP2 Z2
(RP2, n) D2n
orbifold Γ
(S2, 2, 2, n) D2n
(S2, 2, 3, 3) T12
(S2, 2, 3, 4) O24
(S2, 2, 3, 5) I60
Table6.1. Exceptthetwobadcases, everylocallyorientable
closed orbifoldO with χ(O) > 0 can be geometrised asO =
S2/Γ for some discrete Γ < O(3). In all cases Γ < SO(3)
and hence O is orientable, exceptRP2 and (RP2, n) whose Γ
contains the antipodal map. The groups on the right table
are the spherical Von Dyck groups, see Section 3.6.4. The
groups T12, O24, I60 are the orientation-preserving isometry
groups of the tetrahedron, octahedron, and icosahedron, and
are isomorphic toA4, S4, A5 respectively.
where V, E, F is the number of vertices, edges, and faces in the cellulari-
sation of O′. The same formula holds forO:
χ(O) = −d E + d F +
∑ 1
pj
.
A cone point of order p′
i in O′ lifts to some cone points with orders
pj1 , . . . , pjl of O, such that
d =
l∑
a=1
p′
i
pja
=⇒ d · 1
p′
i
=
l∑
a=1
1
pja
.
This implies thatχ(O) = d · χ(O′). □
6.2.5. Geometrisation of orbifolds. Recall that an orbifold is good
if it is covered by a manifold. With a couple of exceptions, all the closed
two-orbifolds are good and geometric.
Theorem 6.2.10. Every closed locally orientable 2-orbifoldO is good
except the following
(S2, p), (S2, p1, p2)
with p1 ̸= p2. A good orbifoldO has an elliptic, ﬂat, hyperbolic structure
⇐ ⇒χ(O) is positive, zero, negative. The elliptic orbifolds are listed in
Table 6.1.
Proof. The orbifolds (S2, p) and (S2, p1, p2) are bad: subdivide S2
into two discs, each containing at most one cone point; each disc has
a unique surface (disc) covering, but the two coverings do not match if
p ̸= 1 or p1 ̸= p2. The remaining orbifolds withχ(O) > 0 are
S2, (S2, n, n), RP2, (RP2, n),


## Page 173

6.2. GEOMETRISATION 165
a
b c
a
b c2 2
2
a
c
b a
c
b
2
2 2
Figure 6.12. For every angleα ⩽ π
2 and lengths b, c > 0
there is a pentagon as shown (left); by doubling it along
the unmarked edges we get a hyperbolic annulus with a cone
point of angle 2α. For every angles α, β ⩽ π
2 and every
length c > 0 there is a quadrilateral as shown (right). By
doubling it along the unmarked edges we get a hyperbolic
disc with cone points of angle2α and 2β.
(S2, 2, 2, n), (S2, 2, 3, 3), (S2, 2, 3, 4), (S2, 2, 3, 5)
and they can all be realised asS2/Γ for an appropriate ﬁniteΓ < O(3), see
Table 6.1. The orbifolds withχ(O) = 0 are
(S2, 2, 3, 6), (S2, 2, 4, 4), (S2, 3, 3, 3), (S2, 2, 2, 2, 2),
(RP2, 2, 2), K, T
where K and T are the Klein bottle and the torus. The ﬁrst four orbifolds
were obtained asR2/Γ in Section 3.6.4. The orbifold(RP2, 2, 2) is R2/Γ
where Γ is generated by two glide reﬂections with orthogonal axis:
(x , y) ↦→ (x + 1, −y), (x , y) ↦→ (−x , y + 1).
To prove this, consider the fundamental domain[− 1
2 , 1
2 ] × [− 1
2 , 1
2 ].
If χ(O) < 0 we construct a hyperbolic metric as we did in the surface
case. If O = ( S2, p1, p2, p3) we get O = H2/Γor(p1,p2,p3) using Von Dyck
groups, see Section 3.6.4. Otherwise, the orbifoldO easily decomposes
along disjoint simple closed curves (that avoid the cone points) into some
basic pieces withχ < 0, which are of the following kind:
P, (A, p), (D, p1, p2)
where P, A, Darethepair-of-pants,theannulus,andthedisc,and (p1, p2) ̸=
(2, 2). We can give a hyperbolic structure toP with any ﬁxed length at
the boundaries.
Analogously, we can give a cone manifold structure with geodesic
boundary to (A, p) (respectively, (D, p1, p2)) with one (two) cone point
of angle 2π
p ( 2π
p1
and 2π
p2
), for any ﬁxed lengths at the boundaries. We
already know this forP, and the proof for(A, p) and (D, p1, p2) is similar:
instead of constructing right-angled hexagons, we construct pentagons
with angles π
2 , π
2 , π
2 , π
2 , π
p and quadrilaterals with angles π
2 , π
2 , π
p1
, π
p2
, and
we double them, see Figure 6.12.


## Page 174

166 6. SURFACES
By gluing all the pieces we obtain a hyperbolic cone structure onO
with cone angles 2π
pi
and we apply Proposition 3.6.18 to translate it to a
hyperbolic orbifold structure. □
Recallthatanorbifoldisverygoodifitisﬁnitelycoveredbyamanifold.
In the following corollary we use the geometrisation to prove shortly a non-
trivial topological fact.
Corollary 6.2.11.Every good closed locally orientable 2-orbifold is also
very good.
Proof. It is geometric, so Corollary 3.6.19 applies. □
The punctured case is also interesting whenχ(O) < 0. We deﬁne a
punctured orbifoldto be one of type
O = (Sg,0,b, p1, . . . , pk).
Theorem 6.2.12. Every punctured orbifold O with χ(O) < 0 has a
hyperbolic structure.
Proof. Same proof as above, where we use triangular groups with
possibly ideal vertices and we allow the piecesP, (A, p), (D, p1, p2) to
have boundary components and/or cone points that degenerate to cusps.
To construct them we build hexagons, pentagons, quadrilaterals with some
lengths or angles that may be zero. □
These punctured orbifolds are also very good for the same reason
above. It is also possible to consider orbifolds based on surfacesSg,b,p with
boundary: every boundary component can be considered in two natural
but distinct ways, either as a mirror (hence the orbifold is locally non-
orientable), or as a boundary component: to do this we need to deﬁne an
appropriate notion of orbifold with boundary.
6.2.6. Gauss–Bonnet formula. How can we compute the area of a
hyperbolic surface? We can easily answer this question in the closed case.
Proposition 6.2.13 (Gauss–Bonnet). Let S be a closed hyperbolic
surface. We have
Area(S) = −2πχ(S).
Proof. Pick a Dirichlet domainD for S. It is a (2n)-gon with inner
angles α1, . . . , α2n. By Proposition 3.2.9 we have
Area(S) = Area( D) = (2 n − 2)π −
2n∑
i=1
αi .
The surface S is obtained from D by gluing isometrically some pairs of
edges. We get a cellularisation ofS with some v vertices, n edges, and
one face D. Therefore
χ(S) = v − n + 1.


## Page 175

6.2. GEOMETRISATION 167
Each of the v vertices is obtained by identifying some of the vertices of
D, whose inner angles must sum to2π. Therefore we get
2n∑
i=1
αi = 2πv
and hence
Area(S) = (2 n − 2)π − 2πv = −2π(v − n + 1) = −2πχ(S).
The proof is complete. □
We can extend the formula to orbifolds and to the other geometries.
Corollary 6.2.14. Let O be a closed hyperbolic, ﬂat, or elliptic locally
orientable 2-orbifold. We have
K · Area(O) = 2 πχ(O)
where K = −1, 0, or+1 respectively.
Proof. If O is an orientable surface, then the equality holds: in the
hyperbolic case this is Proposition 6.2.13, in the ﬂat case we get0 = 0,
and in the elliptic caseS = S2 and Area(S2) = 4 π = 2πχ(S2).
In general there is a degree-d covering S → O of an orientable geo-
metric surface S by Corollary 6.2.11. The equality holds forS and hence
also for O since
χ(S) = d · χ(O), Area(S) = d · Area(O).
The proof is complete. □
6.2.7. Lie subgroups ofSO(3). The following proposition is of gen-
eral interest and is used in many diﬀerent contexts. It shows, among other
things, that orientable elliptic orbifolds arerigid: their geometry is fully
determined by their fundamental group. (Flat and hyperbolic surfaces are
not rigid, as we will soon see.)
Proposition 6.2.15. Every non-trivial proper Lie subgroup ofSO(3) is
conjugate to one of the following:
Cn, D 2n, T 12, O 24, I 60, SO(2), SO(2) ⋊ C2.
These are the orientation-preserving isometry groups of: a regular n-
pyramid, n-prism, tetrahedron, octahedron, icosahedron, cone, and cylin-
der.
Proof. The Lie algebrag = so(3, R) is generated by the matrices
Ax =


0 0 0
0 0 −1
0 1 0

 , A y =


0 0 1
0 0 0
−1 0 0

 , A z =


0 −1 0
1 0 0
0 0 0


with the relations
[Ax , Ay ] = Az , [Ay , Az ] = Ax , [Az , Ax ] = Ay .


## Page 176

168 6. SURFACES
Therefore g is isomorphic toR3 equipped with the standard vector product
×. We deduce that the only non-trivial proper sub-algebras of g have
dimension 1, and hence every non-trivial proper Lie subgroupG < SO(3)
has dimension 0 or 1.
If a Lie subgroupG < SO(3) has dimension zero, it is ﬁnite. Every
non-trivial element inG is a rotation along some axis, and hence it acts on
S2 with two (antipodal) ﬁxed points. LetP ⊂ S2 be the set of the ﬁxed
points of all the non-trivial elements ofG.
The groupG clearly acts onP, and a double-counting argument gives
2
(
|G| − 1
)
=
∑
p∈P
(
|Gp| − 1
)
where Gp < G is the stabiliser ofp. The fundamental theorem on group
actions says that
|Gp| = |G|
|O(p)|
where O(p) is the orbit ofp. Therefore
2
(
|G| − 1
)
=
∑
p∈P
( |G|
|O(p)| − 1
)
=
∑
O
(
|G| − |O|
)
where in the latter we sum on orbitsO. We divide by|G| to get
(3) 2 − 2
|G| =
r∑
i=1
(
1 − 1
ai
)
where a1, . . . , ar are the orders of the stabilisers of ther orbits.
If r = 1 we get a1 = |G| = 1 and hence G is trivial, a contradiction.
If r = 2 we get a1 = a2 = |G| and hence every orbit is a single point, with
stabiliser G. Therefore the points are antipodal andG = Cn.
If r = 3 then (a1, a2, a3) is a triple with1
a1
+ 1
a2
+ 1
a3
> 1, that is one
of
(2, 2, n), (2, 3, 3), (2, 3, 4), (2, 3, 5).
In each case one calculates |G| using (3) and deduces the cardinalities
of the three orbits. For instance in the(2, 2, n) case we have |G| = 2 n
and the orbits have cardinality(n, n, 2). One deduces thatG contains an
index-two cyclic groupCn and is the symmetry groupD2n of the prism.
In the (2, 3, 3) case we get|G| = 12 and hence the orbits have order
(6, 4, 4). The stabiliser of a point in the order-4 orbitO is a 2π
3 -rotation
that rotates the other three points: one deduces that the points inO are
the vertices of a regular tetrahedron andG is its symmetry group. The
other cases are treated analogously.
If G has dimension one, it contains the groupSO(2) of all rotations
along some axis r. Either G = SO(2), or there is ag ∈ G \ SO(2). If
g(r ) ̸= r, then G contains another SO(2) of rotations along g(r ), and
these two copies of SO(2) generate a Lie subgroup of dimension ⩾ 2
in G, a contradiction. Therefore every element in G \ SO(2) preserves


## Page 177

6.3. CURVES ON SURFACES 169
r and is hence aπ-rotation along an axis perpendicular tor. Therefore
G = SO(2) ⋊ C2. □
6.3. Curves on surfaces
It is natural to study a manifold by examining the lower-dimensional
sub-manifolds that it contains: we now look at closed curves in surfaces
and unveil an unexpectedly rich world. We will discover that the study of
curves in surfaces is tightly connected to hyperbolic geometry: each of the
two topics seems designed to give us a better understanding of the other.
We ﬁrst prove various facts on curves, and then we use this knowledge
to deduce some topological non-trivial results on surfaces. We will end
up by showing that two self-diﬀeomorphisms of a closed surfaceSg are
homotopic if and only if they are isotopic, a theorem that will be important
also in our topological study of three-manifolds in the subsequent chapters.
We concentrate for simplicity on the genus-g closed orientable sur-
faces Sg, although much of the discussion could be easily extended to
ﬁnite-type surfaces Sg,b,p with the appropriate modiﬁcations.
6.3.1. Deﬁnitions. We start by recalling and ﬁxing some deﬁnitions.
A curve on a diﬀerentiable manifoldM is a smooth mapγ : I → M deﬁned
on some intervalI, while aclosed curveis a smooth mapγ : S1 → M.
A (possibly closed) curveγ is regular if γ′(t) ̸= 0 for all t. All the
curves will be tacitly assumed to be regular; moreover, with a little abuse
we will sometimes indicate byγ the support of the curve γ, that is its
image.
A curve issimple if it is an embedding, and the support of a simple
closed curve is a one-dimensional submanifold ofM diﬀeomorphic to S1.
Recall that all isotopies are smooth by assumption, see Section 1.1.9.
Two simple closed curves are isotopic if and only if they are ambiently
isotopic. Two simple closed curves with the same support and orientation
are isotopic by Lemma 6.1.1.
6.3.2. Simple closed curves on the sphere.We would like to classify
the simple closed curves on a given closed surface up to isotopy, but we
will soon realise that this task is harder than one could expect. A closed
surface may contain many complicated closed curves, diﬃcult to draw and
visualise.
For the moment we content ourselves with a very simple case. A
simple closed curve on a surfaceS is trivial if it bounds a disc.
Proposition 6.3.1. All simple closed curves inS2 are isotopic.
Proof. Every simple closed curve inS2 is trivial by Jordan’s Theorem
(see Corollary 6.1.10).
Theorem 1.1.14 and Lemma 6.1.1 together imply that there are at
most two isotopy classes of trivial simple closed curves on any connected


## Page 178

170 6. SURFACES
surface S, depending on their orientations. WhenS = S2 the situation
is quite special and the two classes reduce to one: aπ-rotation along a
horizontal axis transforms an eastward-run equator into a westward-run
one. □
The simple closed curves in a torus are much more interesting.
6.3.3. Simple closed curves in the torus.We now classify the simple
closed curves in the torusT = S1 × S1 up to isotopy. The fundamental
group π1(T ) = Z × Z is abelian, hence a closed curveγ is determined up
to free homotopy by its class(m, n) ∈ Z × Z.
Proposition 6.3.2.The class(m, n) ̸= (0, 0)is represented by a simple
closed curve if and only ifm and n are coprime. In that case, the simple
closed curve is unique up to isotopy.
Proof. We visualise the torus as a quotientT = R2/Z2. If m and n
are coprime, the vector line generated by(m, n) ∈ R2 projects to a simple
closed curve inT representing the class(m, n), see Figure 6.13.
Conversely, letγ ⊂ T be a simple closed curve. We cutT along γ and
get a surfaceS with χ(S) = 0. If γ separates, then by the classiﬁcation
of surfaces the only possibility is thatS consists of a one-holed torus and
a disc, soγ is trivial and(m, n) = (0 , 0), which is excluded. Ifγ does not
separate, there is another curveη intersecting it transversely in one point.
This implies thatη and γ have algebraic intersection±1 and hence(m, n)
are coprime: if (m, n) = k(p, q) with k ⩾ 2 the algebraic intersection
would be divided byk.
Finally,wepicktwosimpleclosedcurves γ, η ofthesametype (m, n) ̸=
(0, 0) and prove that they are isotopic. We putγ, η in transverse position,
and we cutT along γ to get an annulusA. If η does not intersectγ, by
cutting A along η we get two annuli: henceη and γ cobound an annulus
and we can use this annulus to build an isotopy between them. Ifη inter-
sects γ, the curve η decomposes into arcs inA as in Figure 6.14-(left).
Since the algebraic intersection ofη and γ is zero, there is an arc with
both endpoints in the same boundary component ofA. This arc forms a
bigon, which we can slide by isotopy as in Figure 6.14-(right) to decrease
the intersection points inγ ∩ η and conclude by induction. □
Simple closed curves in surfaces of higher genus are more complicated
to classify, but are still very important. A couple of techniques used in
the previous proof (cutting along curves and simplifying bigons) will be
employed again in the higher-genus context.
6.3.4. Preliminaries on simple curves.Let Sg be a closed orientable
surface of some genusg ⩾ 1. We now prove some topological facts on
simple closed curves inSg, sometimes employing hyperbolic geometry.


## Page 179

6.3. CURVES ON SURFACES 171
Figure 6.13. If (m, n) are coprime the line generated by
(m, n)∈ R2 projects to a simple closed curve inT. Here
(m, n) = (3 , 2).
Figure 6.14. Two homotopic simple closed curves in a torus
are isotopic: put them in transverse position, cut the ﬁrst to
get an annulus, then remove bigons to destroy intersections.
Proposition 6.3.3. There are ﬁnitely many simple closed curves inSg
up to diﬀeomorphisms ofSg.
Proof. By cutting Sg along a simple closed curveγ we get a surface
S′ with the same Euler characteristic asSg, with one or two components,
and with the boundary oriented asγ: there are only ﬁnitely many diﬀeo-
morphism types forS′.
Supposethatbycutting Sg along γ1 and γ2 wegettwosurfaces S′
1 and
S′
2 of the same type. By hypothesis there is a diﬀeomorphismϕ: S′
1 → S′
2
that preserves the boundary orientations. By Lemma 6.1.1 we may modify
ϕ near the boundary so that it extends to a diﬀeomorphismϕ: Sg → Sg
sending γ1 to γ2. This concludes the proof. □
Exercise 6.3.4. There is preciselyone non-separating simple closed
curve in Sg up to diﬀeomorphism!
Every non-separating simple closed curve inSg may be transformed
into your favourite one by some diﬀeomorphism ofSg, see Figure 6.15.
This quite useful fact, analogous to the possibility of changing a basis in
a vector space, was called thechange of coordinates principleby Farb and
Margalit.
Recall that a non-trivial elementg ∈ G in a group isprimitive if it
cannot be written as g = hn for some n ⩾ 2 and some h ∈ G. This
condition is conjugacy-invariant, so the following makes sense.


## Page 180

172 6. SURFACES
Figure 6.15. There are inﬁnitely many non-separating sim-
ple closed curves inSg up to isotopy wheng ⩾ 1, but there is
only one up to self-diﬀeomorphism ofSg. For instance, some
diﬀeomorphism of S2 sends the blue simple closed curve to
the red one (a self-diﬀeomorphism may be quite hard to vi-
sualise directly...).
Proposition 6.3.5. Let γ be a simple closed curve inSg. It holds:
• if γ is homotopically trivial, it bounds a disc;
• if γ is not homotopically trivial, it is primitive inπ1(Sg).
Proof. Let S′ be the surface obtained by cuttingS = Sg along γ.
The surface S′ may have one or two components and has the same Euler
characteristic ofS. If one component ofS′ is a disc, we are done. IfS′ is
an annulus, thenS is a torus and we are done by Proposition 6.3.2.
In all the other cases there is a hyperbolic metric onS where γ is
a geodesic: each component ofS′ has negative Euler characteristic and
hence can be given a hyperbolic structure with geodesic boundary curves
of length 1; by gluing them we get the hyperbolic metric onS.
We now apply Proposition 4.1.13 multiple times. Sinceγ is a closed
geodesic, itisnothomotopicallytrivial. If γ = ηk isnotprimitivein π1(Sg),
then η is homotopic to a closed geodesic¯η and hence γ is homotopic to
¯η run k times: a closed curve cannot be homotopic to two distinct closed
geodesics, a contradiction. □
We have employed hyperbolic geometry to prove a topological fact
on surfaces: this will be a refrain in this chapter. Let theinverse γ∗ of a
closed curve γ be γ run with opposite orientation.
Proposition 6.3.6. A non-trivial simple closed curve in Sg is never
freely homotopic to its inverse.
Proof. If g = 1 the curves γ and γ∗ represent distinct elements (and
hence conjugacy classes) inπ1(S1) = Z × Z. If g ⩾ 2, giveSg a hyperbolic
metric. The curveγ is homotopic to a closed geodesic¯γ and hence γ∗ is
homotopic to its inverse¯γ∗, which is distinct from¯γ as a closed geodesic
by deﬁnition. Distinct closed geodesics are not homotopic. □
6.3.5. Simple closed geodesics.Let now Sg have genus g ⩾ 2 and
be equipped with a hyperbolic metric. We know from Corollary 4.1.14 that


## Page 181

6.3. CURVES ON SURFACES 173
Figure 6.16. The cones and bananasR-neighbourhoods of
a geodesic l in the half-plane (left) and disc (right) models.
every homotopically non-trivial closed curve inSg has a unique geodesic
representative. We now prove that, if the original curve is simple, then the
geodesic representative also is.
Recall that the R-neighbourhood of an object in a metric space is
the set of all points of distance at mostR from that object. The R-
neighbourhoods of lines inH2 are particularly simple.
Proposition 6.3.7. The R-neighbourhood of a linel ⊂ H2 in a con-
formal model is bounded by two Euclidean lines or circle arcs having the
same endpoints asl as in Figure 6.16.
Proof. Put l in the half-space model with endpoints at0 and ∞. A
R-neighbourhood is invariant by the isometryx ↦→ λx and is hence a cone
as in the ﬁgure. The other cases follow because isometries and inversions
send lines and circles to lines and circles. □
We use R-neighbourhoods to prove the following.
Proposition 6.3.8. Let Sg be equipped with a hyperbolic metric. Ev-
ery non-trivial simple closed curve inSg is homotopic to a simple closed
geodesic.
Proof. Every non-trivial simple closed curveγ in Sg = H2/Γ is homo-
topic to a closed geodesic¯γ by Corollary 4.1.14, and we now prove that
¯γ is simple. The counterimage ofγ in H2 consists of disjoint simplearcs,
while the counterimage of¯γ consists of straightlines: we prove that these
lines are also disjoint.
The homotopy betweenγ and ¯γ lifts to a homotopy between the arcs
and the lines. The homotopy between γ and ¯γ has compact support,
hence there is aR > 0 such that every point in the arcs is moved in the
lifted homotopy to some distance smaller thanR. Therefore every arc is
contained in theR-neighbourhood of a line as in Figure 6.17-(left).
This shows that lines and arcs have the same endpoints in∂H2. If two
lines intersects, their endpoints are linked in the circle∂H2 and hence also
the corresponding arcs intersect, see Figure 6.17-(right): a contradiction.


## Page 182

174 6. SURFACES
Figure 6.17. The lifts ofγ (black arcs) and of its geodesic
representative (red lines) have the same endpoints in∂H2
(left). If two lines intersect, the arcs do (right).
Since the lifts of ¯γ do not intersect, the geodesic ¯γ does not self-
intersect transversely. Then ¯γ is either simple or wraps multiple times
a simple geodesic, but the second possibility is excluded by Proposition
6.3.5. □
We will soon promote “homotopic” to “isotopic”.
6.3.6. Geometricintersection. Isotopyclassesofsimpleclosedcurves
on Sg form a complicate and interesting set, and a way to study it consists
of looking at the way these curves intersect each other. Thealgebraic
intersection is too weak a tool, because it detects only their homology
classes. We now introduce the much ﬁnergeometric intersection.
Let γ1 and γ2 be two simple closed curves in an orientable surface
S. Let the geometric intersection i(γ1, γ2) be the minimum number of
intersections of two transverse simple closed curvesγ′
1, γ′
2 homotopic to
γ1 and γ2. The geometric intersection depends only on the homotopy
classes of γ1 and γ2.
Proposition 6.3.9. We have i(γ, γ) = 0 for every simple closedγ.
Proof. A tubular neighbourhood ofγ is diﬀeomorphic toS1 × [−1, 1]
because S is orientable, hence γ has two disjoint parallel representatives
S1 ×
{
− 1
2
}
and S1 ×
{1
2
}
which do not intersect. □
Recall that thealgebraic intersection of two curves counts the inter-
sections with sign. Geometric and algebraic intersections behave much
diﬀerently and are equal only modulo2.
The geometric intersectioni(γ1, γ2) remains unaﬀected if we substi-
tute γ1 with its inverse, that is if we reverse its orientation.
6.3.7. The bigon criterion.Two simple closed curvesγ1 and γ2 in an
orientable surface S are inminimal position if they intersect transversely
in exactly i(γ1, γ2) points. How can we know if two transverse simple


## Page 183

6.3. CURVES ON SURFACES 175
Figure 6.18. Two curvesγ1 and γ2 are in minimal position
if and only if they do not create bigons, like this one.
Figure 6.19. A bigon can be eliminated via homotopies
(left). If γ1 bounds a disc and γ2 intersects γ1, there is
a bigon (right).
closed curves in Sg are in minimal position? We now prove a nice and
simple criterion: they are in minimal position if and only if they do not
form bigons.
The complement of two transverse simple closed curves is a ﬁnite
disjoint union of open sets with polygonal boundaries; one such set is a
bigon if it is a disc with two sides as in Figure 6.18.
Theorem6.3.10(Bigoncriterion). Twotransversesimpleclosed γ1, γ2
in Sg are in minimal position if and only if they do not form bigons.
Proof. If γ1 and γ2 create a bigon, the homotopies in Figure 6.19-
(left)transform γ1 and γ2 intotwocurvesthatintersectinasmallernumber
of points: henceγ1 and γ2 are not in minimal position.
Suppose now thatγ1 and γ2 do not form bigons: we must show that
they are in minimal position. Ifγ1 is trivial, it bounds a discD as in Figure
6.19-(right). If γ2 intersects γ1, aninnermost argument shows that they
form a bigon: the curveγ2 intersects D in arcs, each dividingD into two
parts; if one part contains no other arc it is a bigon, otherwise we iterate.
Therefore γ1 and γ2 are disjoint and hence in minimal position.
It remains to consider the case where bothγ1 and γ2 are non-trivial.
The torus caseg = 1 is obtained by readapting the proof of Proposition
6.3.2 and is left as an exercise, so we supposeg ⩾ 2.


## Page 184

176 6. SURFACES
Figure 6.20. The lifts of γi and ¯γi have distance bounded
by R and hence have the same endpoints (left). Two curves
that intersect in more than one point form a bigon (right).
Fix an arbitrary hyperbolic metricSg = H2/Γ and let π : H2 → H2/Γ
be the projection. The closed curvesγ1 and γ2 are now homotopic to two
simple closed geodesics¯γ1 and ¯γ2. The lifts ofγi and ¯γi in H2 arearcs and
lines and there is aR > 0 such that every arc lies in theR-neighbourhood
of a line, see the proof of Proposition 6.3.8. Arcs and lines have the same
endpoints at inﬁnity as in Figure 6.20-(left).
Two distinct arcs may intersect at most in one point: if they intersect
more, an innermost argument shows that they form a bigonD as in Figure
6.20-(right), which projects to a bigonπ(D) in Sg. (It is not immediate
that π(D) is a bigon! The two vertices ofπ(D) might coincide, but this
is easily excluded becauseSg is orientable.)
We now show how to count the intersections betweenγ1 and γ2 di-
rectly in H2. Let C(γi ) ⊂ Γ be the conjugacy class of all the hyperbolic
transformations corresponding to γi. We know that the lifts of ¯γi are
precisely the axis of the hyperbolic transformations inC(γi ).
By Corollary 4.2.3 any two such axis are either incident or ultra-
parallel. Hence two lifts ofγ1 and γ2 intersect (in a single point) if and only
if the corresponding lifts of¯γ1 and ¯γ2 intersect (in a single point), and this
holds if and only if the endpoints are linked in∂H2. We have established
two bijective correspondences
π−1(γ1) ∩ π−1(γ2) ← →π−1(¯γ1) ∩ π−1(¯γ2) ← →X
with
X =
{
(ϕ1, ϕ2) ∈ C(γ1) × C(γ2)
⏐⏐ Fix(ϕ1) and Fix( ϕ2) are linked
}
.
The bijective correspondences areΓ-equivariant. We quotient by Γ and
ﬁnd
γ1 ∩ γ2 ← →¯γ1 ∩ ¯γ2 ← →X/Γ.


## Page 185

6.3. CURVES ON SURFACES 177
The cardinalityk of X/Γ depends only on the homotopy type ofγ1 and γ2.
Therefore any two curves homotopic toγ1 and γ2 will have at least these
k intersections. Hence γ1 and γ2 are in minimal position. □
The bigon criterion furnishes an eﬃcient algorithm to calculate the
geometric intersection of any pairγ1 and γ2 of simple closed curves inSg:
we put them in transverse position, and then we simplify bigons as much
as we can. After ﬁnitely many steps we get two curves in minimal position.
Geodesic representatives are typically eﬃcient: they minimise lengths
(see Proposition 4.1.15), and they also minimise mutual intersections.
Corollary 6.3.11. Let g ⩾ 2 and Sg have a hyperbolic metric. Two
simple closed geodesics with distinct supports are in minimal position.
Proof. Two geodesics do not form bigons: if they do, the bigon lifts
to a bigon between two lines inH2, but lines intersect at most once. □
Here is a very simple application of the bigon criterion.
Corollary 6.3.12.Iftwosimpleclosedcurves γ, η intersecttransversely
in one point, we havei(γ, η) = 1. In particular, they are both non-trivial.
Proof. The curves γ and η cannot form bigons. □
The following exercise shows that the geometric intersection distin-
guishes a trivial curve from a non-trivial one.
Exercise 6.3.13. If a simple closed curveγ is not trivial, there is an-
other simple closed curveη such that i(γ, η) > 0.
Hint. Use Proposition 6.3.3 to transformγ into a comfortable curve
and draw aη which intersects γ in at most2 points without bigons. □
On the contrary, the algebraic intersection doesnot distinguish the
trivial curve from any other separating curve.
Exercise 6.3.14. Letγ and η be non-trivial simple closed curves in the
torus T of type(p, q) and (r, s). We have
i(γ, η
)
=
⏐⏐⏐⏐det
(p r
q s
)⏐⏐⏐⏐ .
6.3.8. Homotopy and isotopy of curves.We are now going to prove
some“homotopyimpliesisotopy” theorems: westartwithclosedcurvesand
we end in the next section with self-diﬀeomorphisms of surfaces. These
slightly technical theorems have the remarkable and pleasant eﬀect of
making life easier in dimensions two and three (their impact to three-
dimensional topology will be clear in the next chapter): topologists use
these theorems everyday when they manipulate two- and three-manifolds.
We start by showing that two non-trivial simple closed curves are
homotopic if and only if they are isotopic. We consider a particular case.


## Page 186

178 6. SURFACES
Lemma 6.3.15. Let γ1 and γ2 be two non-trivial simple closed curves
in Sg. If they are disjoint and homotopic, they are parallel.
Proof. Cut Sg along γ1 ∪ γ2. We do not obtain discs because the
curves are non-trivial and if we obtain an annulus the two curves are par-
allel. In all the other cases we obtain surfaces of negative Euler charac-
teristic, and we may assign some hyperbolic metrics to them that glue to
a hyperbolic metric onSg where both γ1 and γ2 are distinct geodesics: a
contradiction. □
We now turn to the general case.
Proposition 6.3.16 (Homotopy implies isotopy).Two non-trivial sim-
ple closed curves inSg are homotopic if and only if they are isotopic.
Proof. Let γ1 and γ2 be two non-trivial simple closed curves. With
a small isotopy we put them in transverse position. Since i(γ1, γ2) =
i(γ1, γ1) = 0 the two curves are either disjoint or form some bigon. If they
form a bigon, we can eliminate it via isotopies as in Figure 6.19-(left) and
after ﬁnitely many steps we get two disjoint curves.
The curves γ1 and γ2 are parallel by Lemma 6.3.15, and we use the
annulus they cobound to moveγ2 isotopically over γ1. The two curves
now have the same support and the same orientation by Proposition 6.3.6:
by Lemma 6.1.1 they are isotopic. □
Warning 6.3.17. Two homotopic simple closed curves in a three-
manifold are not necessarily isotopic, because they may be knotted dif-
ferently: theknot theorystudies precisely this phenomenon.
Corollary 6.3.18. Let g ⩾ 2 and Sg have a hyperbolic metric. Every
non-trivial simple closed curve inSg is isotopic to a simple closed geodesic.
6.3.9. Multicurves. Our next goal is to prove a “homotopy implies
isotopy” theorem for self-diﬀeomorphisms of surfaces. The core of the
proof is contained in the next section, and we will need there the notion
of multicurve: we now introduce this simple concept and extend some of
the previous results from curves to multicurves.
Deﬁnition 6.3.19. Amulticurve µ in Sg is a ﬁnite set of disjoint non-
trivial simple closed curves.
See an example in Figure 6.21, and note that every component of
a multicurve is oriented. A multicurve is essential if it has no parallel
components. By cuttingSg along an essential multicurveµ we get ﬁnitely
many surfaces of negative Euler characteristic: if each such surface is
a pair-of-pants, then µ is a pants decomposition, already considered in
Section 6.2.2.


## Page 187

6.3. CURVES ON SURFACES 179
Figure 6.21. A multicurve in a surface of genus two.
Proposition 6.3.20. An essential multicurve µ in Sg with g ⩾ 2 has
at most 3g − 3 components, and it has3g − 3 if and only if it is a pants
decomposition.
Proof. By cutting Sg along µ we get some surfaces S1, . . . , Sk of
negative Euler characteristic such thatχ(Sg) = χ(S1) + . . . + χ(Sk). If
each Si is a pair-of-pants thenχ(Si ) = −1 and k = −χ(Sg) = 2 g − 2;
the curves are 3
2 (2g − 2) = 3 g − 3 because each curve separates two
pants. If some Si is not a pair-of-pants it can be further subdivided into
pair-of-pants. □
We deﬁne thegeometric intersection i(µ1, µ2) of two multicurvesµ1
and µ2 as the minimum number of intersections of two transverse mul-
ticurves µ′
1, µ′
2 isotopic to µ1, µ2. This deﬁnition extends the geometric
intersectionofsimpleclosedcurves(theoriginaldeﬁnitionforsimpleclosed
curves is with “homotopic” instead of “isotopic”, but these are equivalent
by Proposition 6.3.16).
Two transverse multicurvesµ1 and µ2 are inminimal positionif they
intersect exactly ini(µ1, µ2) points: the bigon criterion easily extends to
this context.
Proposition 6.3.21. Let µ1, µ2 ⊂ Sg be two transverse multicurves.
The following equality holds:
i(µ1, µ2) =
∑
γ1⊂ µ1
γ2⊂ µ2
i(γ1, γ2)
wherethesumistakenonallcomponents γ1, γ2 of µ1, µ2. Themulticurves
µ1 and µ2 are in minimal position if and only if they do not form bigons.
Proof. If µ1 and µ2 form no bigons, then any two componentsγ1 and
γ2 form no bigons too (exercise) and are therefore in minimal position.
This proves the equality and thatµ1 and µ2 are in minimal position. □
The formula says that if we consider a multicurve as a “sum” of dis-
joint simple closed curves, then the geometric intersectioni behaves like a
bilinear form: this viewpoint will be further explored in Chapter 8.


## Page 188

180 6. SURFACES
Figure 6.22. A bigon betweenη and η′ intersects µ in ver-
tical arcs and can be removed via an ambient isotopy that
preserves the support ofµ.
Note again thati(µ, µ) = 0. We extend Proposition 6.3.16 to essen-
tial multicurves.
Proposition 6.3.22 (Homotopy implies isotopy).Let
µ1 = {γ1,1, . . . , γ1,n}, µ 2 = {γ2,1, . . . , γ2,n}
be two essential multicurves inSg. If γ1,i is homotopic toγ2,i for alli then
there is an isotopy movingµ1 to µ2.
Proof. We adapt the proof of Proposition 6.3.16. Sincei(γ1,i , γ2,j ) =
i(γ1,i , γ1,j ) = 0 we get i(µ1, µ2) = 0 by Proposition 6.3.21 and after an
isotopy that destroys the bigons we getµ1 ∩ µ2 = ∅. Then Lemma 6.3.15
implies that γ1,i and γ2,i are parallel and we are done. □
Corollary 6.3.23. Let g ⩾ 2 and Sg have a hyperbolic metric. Ev-
ery essential multicurve can be isotoped to a (unique) geodesic essential
multicurve.
In particular every pants decomposition straightens to a (unique) ge-
odesic one: this fact will be used in Chapter 7 to parametrize all the
hyperbolic metrics on a givenSg.
6.3.10. Minimal position. We end this discussion on multicurves by
showing that the minimal position is unique up to isotopy.
Proposition 6.3.24. Let µ, η be two multicurves in minimal position
in Sg. The union µ ∪ η of their supports depends up to ambient isotopy
only on the isotopy classes ofµ and η.
Proof. Let µ′, η′ be multicurves in minimal position, individually iso-
topic to µ, η. We need to prove that the supportsµ′ ∪ η′ and µ ∪ η are
ambiently isotopic.
By hypothesis there is an isotopy carryingµ′ to µ, which is ambient
since multicurves are compact: hence we can supposeµ′ = µ. We now
construct an isotopy that ﬁxesµ′ = µ as a set (not pointwise!) and carries
η′ to η.
Up to a small ambient isotopy ﬁxing the setµ we may suppose that
η and η′ intersect transversely. Ifη ∩ η′ ̸= ∅ then η and η′ form a bigon


## Page 189

6.4. HOMOTOPY AND ISOTOPY 181
as in Figure 6.22-(left): the multicurveµ intersects the bigon in arcs that
join distinct edges as in the ﬁgure (becauseµ′ = µ forms no bigons with
η and η′). We can eliminate the bigon by an ambient isotopy that ﬁxesµ
as a set, as shown in Figure 6.22.
After ﬁnitely many steps we getη ∩η′ = ∅. Since η and η′ are disjoint
and isotopic, every component ofη is parallel to a component ofη′. A
maximal set of parallel curves inη ∪ η′ is contained in a bigger annulus
[−1, 1] ×S1 which intersectsµ either into arcs[−1, 1] × {pt} or into circles
{pt} × S1. In both cases we easily see thatµ ∪ η is ambiently isotopic to
µ ∪ η′. □
As an example, consider two essential multicurvesη and µ in Sg with
g ⩾ 2 (for instance, two non-trivial simple closed curves). A hyperbolic
metric onSg produces two geodesic representatives¯η and ¯µ for them, and
the following holds:
Corollary 6.3.25. The support ¯η ∪ ¯µ in Sg does not depend (up to
ambient isotopy) on the chosen hyperbolic metric.
Proof. With the exception of the common components of¯η and ¯µ,
the rest intersects in minimal position. □
This corollary is one of the many instances of the following nice phe-
nomenon: a hyperbolic metric onSg may be used as an auxiliary structure
to deﬁne objects or to prove statements which turn outa posteriori not
to depend on the chosen metric. We will employ this strategy many times
in Chapter 8.
6.4. Homotopy and isotopy
We have proved that “homotopy implies isotopy” for non-trivial simple
closed curves in Sg, and now we want to prove an analogous result for
diﬀeomorphisms ofSg. A crucial ingredient is a theorem proved by Smale
in the 1950s, which considers the self-diﬀeomorphisms of the discD2.
Theorem 6.4.1. Two diﬀeomorphismsϕ, ψ : D2 → D2 that coincide
on ∂D 2 are isotopic, via an isotopy that ﬁxes∂D 2 pointwise.
There is a proof of Theorem 6.4.1 in the topological category that is
surprisingly easy and works in any dimension.
6.4.1. The Alexander trick. The proof of the following fact is so
immediate, that it has a name: it is usually called theAlexander trick.
Proposition6.4.2(Alexandertrick). Twohomeomorphisms ϕ, ψ : Dn →
Dn that coincide on∂D n are continuously isotopic, via an isotopy that ﬁxes
∂D n pointwise.


## Page 190

182 6. SURFACES
Proof. We consider f = ϕ ◦ ψ−1 and idDn and deﬁne an isotopy that
transforms f into idDn ﬁxing ∂D n. The following function does the job:
F (x , t) =
{ x if ∥x∥ ⩾ t,
tf
(x
t
)
if ∥x∥ ⩽ t.
The proof is complete. □
Unfortunately this proof does not work in the smooth category, be-
cause the function F is not smooth (and not smoothable) at(0, 0). Of
course, as every continuous map, ourF may be approximated by smooth
functions, but the injectivity of the slicesF (·, t) can be lost in the approx-
imation.
Moreover, the statement in the smooth category is just false in dimen-
sion n ⩾ 7: there are self-diﬀeomorphisms ofDn that arenot smoothly
isotopic to idDn in high dimension, and this is connected to the existence
of exotic spheres, diﬀerentiable manifolds that are homeomorphic but not
diﬀeomorphic to Sn.
6.4.2. Self-diﬀeomorphisms of the disc.After this very brief excur-
sion in the topological world, we turn back to the smooth category: every
map considered so far is smooth by assumption like in the rest of the book.
We prove here Theorem 6.4.1. We need a fact on planar ﬁelds.
Proposition 6.4.3.On a nowhere-vanishing vector ﬁeld onR2, a max-
imal integral curve is never trapped in a compact set.
Proof. Supposebycontradictionthatamaximalintegralcurve α: I →
R2 lies in a compact setK for all t > t 0. Its ω-limit ω(α) ⊂ K is the
set of all pointsx ∈ K to which γ accumulates, that is the intersection of
the closures ofα(t0, ∞) for allt0 ∈ I. The ω-limit is the intersection of a
ﬁltration of compact sets and is hence non-empty. Pick a pointp ∈ ω(α).
Up to a local diﬀeomorphism, the vector ﬁeld nearp is constant ver-
tical as in Figure 6.23-(1). The integral curves nearp are vertical. Since
p ∈ ω(α), the curveα contains inﬁnitely many of them that tend to the
one containing p. Two subsequent ones determine a closed curve as in
Figure 6.23-(2), that bounds a disc by the Jordan curve theorem.
We prove that such a disc cannot exist. If it existed, we could reverse
all arrows and rotate it to obtain another disc as in Figure 6.23-(3), and by
gluing the two discs we would construct as in Figure 6.23-(4) a nowhere-
vanishing vector ﬁeld on the sphere. Such a ﬁeld of course does not exist
since the sphere has non-zero Euler characteristic. □
We can now prove Theorem 6.4.1.
Proof of Theorem 6.4.1. After composing withψ−1 we can suppose
that ψ = id. Now ϕ|S1 is the identity. Every self-diﬀeomorphism of any
compact manifold that ﬁxes the boundary is isotopic to one which is the


## Page 191

6.4. HOMOTOPY AND ISOTOPY 183
p
(1) (2) (3) (4)
Figure 6.23. At a pointp, after a local diﬀeomorphism we
may suppose that the vector ﬁeld is constantly vertical (1). If
p is a limit point of an integral curveα we may ﬁnd a closed
curve that bounds a disc (2). If such a disc existed, we could
rotate it and inverse all arrows (3) and glue the two portions
to form a nowhere-vanishing vector ﬁeld on the sphere (4).
Figure 6.24. A self-diﬀeomorphism ϕ of D2 ﬁxing ∂D 2
pointwise (left). To get an isotopy ﬁxing∂D 2 pointwise we
need to rescale via a diﬀeomorphism that maps each arc as
in the right ﬁgure to itself, and varies smoothly fromid to
f−1
t from bottom to top (right).
identity on a collar of the boundary: hence we can suppose thatϕ = id on
a collar ofS1.
We sketchϕ in Figure 6.24-(left): vertical lines are transformed into
paths with the same endpoints. We want to construct an isotopy be-
tween ϕ and idD2 that “straightens” smoothly these lines, and we start by
straightening their tangent vector ﬁelds.
Consider the constant unitary vertical vector ﬁeldX0 = (0, 1) on D2
and letX1 be its image along the diﬀeomorphismϕ. It is easy to construct
a homotopy Xt between X0 and X1 through non-vanishing vector ﬁelds:
we see bothX0 and X1 as maps D2 → C∗, we lift them to mapsD2 → C
via the universal coverexp : C → C∗, we make a convex combination and
we project it back toC∗. By construction the vectorsXt are constantly
(0, 1) on a collar ofS1.
We now carefully integrate the homotopyXt of vector ﬁelds to an
isotopy of diﬀeomorphisms. LetS1
+ and S1
− be the upper and lower hemi-
sphere of S1. The vectors Xt at S1
− point inside and those atS1
+ point


## Page 192

184 6. SURFACES
outside D2. By Proposition 6.4.3 the integral curveγt
x of Xt starting from
a point(x ,−
√
1 − x 2) ∈ S1
− exits at some point inS1
+ after some timeT t
x
that varies smoothly inx and t.
The point γt
x (u) is deﬁned for u ∈ [0, T t
x ] and varies smoothly on
x , t, u. We obviously haveT 0
x = 2
√
1 − x 2 and also T 1
x = T 0
x since γ1
x =
ϕ ◦ γ0
x. However T t
x may not be constant int, so we rescale the integral
curves as
˜γt
x (u) = γt
x
(
u · T t
x
2
√
1 − x 2
)
.
The new curve ˜γt
x is deﬁned in the interval
[
0, 2
√
1 − x 2
]
not depending
on t. We can now deﬁne
ϕt
(
x ,−
√
1 − x 2 + u
)
= ˜γt
x (u) .
The diﬀeomorphism ϕt : D2 → D2 furnishes an isotopy betweenid = ϕ0
and ϕ = ϕ1. However, the diﬀeomorphismϕt does not ﬁx the points in
S1
+ since the endpoint of˜γt
x has a ﬁrst coordinateft(x) which might be
distinct from x when 0 < t < 1 (but varies smoothly ont and x).
To ﬁx that it suﬃces to compose eachϕt with a diﬀeomorphism ofD2
that maps each arc as in Figure 6.24-(right) to itself and varies smoothly
from id to f−1
t from bottom to top. □
Remark 6.4.4. If ϕ: D2 → D2 is the identity on a collar ofS1, we
can easily transform the isotopyϕt so that it is the identity on this collar
for all t. This will be useful to glue isotopies.
6.4.3. Homotopyandisotopyofdiﬀeomorphisms. Wearenowready
to promote homotopies to isotopies of diﬀeomorphisms. We start with the
easier sphere case, which is a simple consequence of Theorem 6.4.1.
Theorem 6.4.5. Two diﬀeomorphisms ϕ, ψ : S2 → S2 are isotopic
⇐ ⇒they are homotopic⇐ ⇒they are co-oriented.
Proof. We suppose thatϕ and ψ are co-oriented and we must prove
that they are isotopic. Pick any discD ⊂ S2. Both ϕ and ψ send D to
some disc in S2. Theorem 1.1.14 furnishes an ambient isotopy relating
these maps, so we may suppose thatϕ and ψ coincide on D. The closed
complement is another disc and we conclude by Theorem 6.4.1.
More precisely, we pick a smaller closed discD′ ⊂ int(D) and consider
the closed complement D′′ = S2 \ int(D′). The diﬀeomorphisms ϕ and
ψ of D′′ coincide on a collar of∂D′′ and Theorem 6.4.1 together with
Remark 6.4.4 furnishes an isotopy that is the identity on that collar. We
extend this isotopy as the identity onD \ D′′ and we are done. □
The theorem has a very important three-dimensional application.
Corollary 6.4.6 (Smale’s Theorem).Every self-diﬀeomorphism ofS2
extends to a self-diﬀeomorphism ofD3.


## Page 193

6.4. HOMOTOPY AND ISOTOPY 185
Figure 6.25. Two essential multicurves (blue and red) in
minimal position, which subdivide the surface into hexagons.
Proof. Every self-diﬀeomorphism ofS2 is isotopic either to the iden-
tity or to a reﬂection by Theorem 6.4.5. We map a collar ofS2 to itself
using this isotopy, then extend to the rest ofD3 using the identity or the
reﬂection. □
We can ﬁnally promote homotopies to isotopies on a general genus-g
surface Sg. The proof uses many of the techniques introduced in the last
sections: we employ multicurves to cut the surface into discs, and then
use Theorem 6.4.1 individually on each disc.
Theorem 6.4.7. Two diﬀeomorphismsϕ, ψ : Sg → Sg are isotopic if
and only if they are homotopic.
Proof. We have seen the case g = 0, so we suppose g ⩾ 1. By
composing with ψ−1 we can suppose thatψ = id.
Fix two essential multicurvesµ and η as in Figure 6.25. The ﬁgure
easily generalises to any genusg, and the reader may check thatµ and η
subdivide the surface into hexagons (or a single square wheng = 1). The
important point is thatSg \ (µ ∪ η) consists of polygons, none of which is
a bigon.
By hypothesisϕis homotopic to the identity, so the image multicurves
ϕ(µ) and ϕ(η) are curve by curve homotopic toµ and η. By Proposition
6.3.22 the multicurveϕ(µ) is isotopic toµ, and ϕ(η) is isotopic toη.
The curves µ and η are in minimal position because there are no
bigons. The imagesϕ(µ) and ϕ(η) are also in minimal position becauseϕ
is a diﬀeomorphism. By Proposition 6.3.24 the supportsµ∪η and ϕ(µ∪η)
are ambiently isotopic, so we may suppose that they coincide.
The graph µ ∪ η is made of vertices (the intersectionsµ ∩ η) and
edges. The components of µ and η are pairwise non-homotopic simple
closed curves, henceϕ sends necessarily every component to itself, and it
does so orientation-preservingly by Proposition 6.3.6. This implies easily
that vertices and edges are sent to themselves byϕ. Hence ϕ = id on
vertices and after an isotopy we may suppose thatϕ = id on edges too.
After an isotopy we may also suppose thatϕ = id on a regular neigh-
bourhood U of µ ∪ η, obtained by thickening the cellularisation ofµ ∪ η
to a handle decomposition with 0- and 1-handles. The complement ofU


## Page 194

186 6. SURFACES
consists of discs (the hexagons). Consider one such discD, enlarged a bit
so that ∂D ⊂ int(U). The map ϕ sends D to itself and is the identity on
a collar of∂D. By Theorem 6.4.1 and Remark 6.4.4 there is an isotopy
connecting ϕ to id on every such discD that ﬁxes pointwise this collar, so
we can extend it constantly on the rest ofU and get a global isotopy on
Sg connecting ϕ and id. □
This theorem has important consequences in dimensions 2 and 3.
6.5. Mapping class group
We have just proved that two self-diﬀeomorphisms ofSg are homo-
topic if and only if they are isotopic. We have also seen that wheng = 0
there are only two self-diﬀeomorphisms up to isotopy: the identity and a
reﬂection. Do we get a more complicated picture wheng ⩾ 1? Yes, we
get an interesting group, called themapping class groupof Sg. The group
is naturally deﬁned on all ﬁnite-type surfacesSg,b,p.
6.5.1. Deﬁnition. Recall that the ﬁnite-type orientable surfaceSg,b,p
has genus g, it hasb boundary components, andp punctures.
Deﬁnition 6.5.1. Themapping class groupof Sg,b,p is the group
MCG(Sg,b,p ) = Diﬀeo +(Sg,b,p )/∼
where Diﬀeo+(Sg,b,p ) indicates the group of all orientation-preserving dif-
feomorphisms Sg,b,p → Sg,b,p that ﬁx pointwise the boundary andϕ ∼ ψ
if ϕ and ψ are connected by an isotopy that ﬁxes the boundary pointwise
at every level.
Example 6.5.2. The groups MCG(S2) and MCG(D2) are trivial by
Theorems 6.4.1 and 6.4.5.
The group MCG(Sg,b,p ) acts on H1(Sg,b,p , Z) since homotopic func-
tions induce the same maps in homology. We get a group homomorphism
MCG(Sg,b,p ) − →Aut+(
H1(Sg,b,p , Z)
)
= Aut+(
Zn)
= SLn(Z)
with n = 2g + max{b + p − 1, 0}. This homomorphism is neither injective
nor surjective in general. Its kernel is called theTorelli groupof Sg,b,p.
The mapping class group of a sphere is trivial, so we look at the torus.
6.5.2. The torus. The mapping class group of the torus is a familiar
group of 2 × 2 matrices.
Proposition 6.5.3. The Torelli group of the torusT is trivial and
MCG(T ) ∼= Aut+(H1(T )) = SL 2(Z).
Proof. Fix a meridian m and longitude l of T. A diﬀeomorphism ϕ
of T that acts trivially on H1(T ) = π1(T ) = Z2 sends m and l to two
simple closed curves ϕ(m) and ϕ(l) homotopic and hence isotopic tom


## Page 195

6.5. MAPPING CLASS GROUP 187
Figure 6.26. A Dehn twist along a curveγ maps a trans-
verse arc µ onto an arc which makes a complete left turn.
and l: the proof of Theorem 6.4.7 shows thatϕ is isotopic to the identity.
Therefore the Torelli group is trivial.
A matrix A ∈ SL2(Z) acts linearly on R2 preserving the orientation
and the lattice Z2 and hence descends to a self-diﬀeomorphism ofT =
R2/Z2. This shows that the mapMCG(T ) → Aut+(H1(T )) = SL 2(Z) is
surjective. □
The mapping class group of a surfaceSg of genus g ⩾ 2 is not iso-
morphic to a familiar group of matrices, at least as far as we know: indeed
(except some low-genus cases) it is still unknown whetherMCG(Sg,b,p ) is
linear, i.e. isomorphic to a subgroup ofGL(n, C) for some integern.
For the moment we content ourselves with a concrete description of
some particularly simple elements ofMCG(Sg,b,p ) called Dehn twists.
6.5.3. Dehn twists. Let γ be a non-trivial simple closed curve in the
interior ofSg,b,p. TheDehn twistalong γ is the elementTγ ∈ MCG(Sg,b,p )
deﬁned as follows.
Pick a tubular neighbourhood ofγ orientation-preservingly diﬀeomor-
phic to S1 × [−1, 1] where γ lies as S1 × {0}. Let f : [ −1, 1] → R be a
smooth function which is zero in
[
−1, − 1
2
]
and 2π on
[1
2 , 1
]
. Let
Tγ : Sg,b,p − →Sg,b,p
bethediﬀeomorphismthatactsonthetubularneighbourhoodas Tγ(ei α, t) =
(ei(α+f (t)), t) and on its complementary set inSg,b,p as the identity. We
may visualise Tγ by noting that it gives a complete left turn to any arcµ
that intersects γ as in Figure 6.26.
Proposition 6.5.4. The elementTγ ∈ MCG(Sg,b,p ) is well-deﬁned and
depends only on the isotopy class ofγ.
Proof. In the deﬁnition ofTγ we have chosen a tubular neighbourhood
for γ and a smooth function f. Tubular neighbourhoods are ambiently
isotopic, and functions with ﬁxed extremes are isotopic too: these facts
imply easily that the isotopy class ofTγ is well-deﬁned and depends only
on the isotopy class ofγ. □


## Page 196

188 6. SURFACES
Remark 6.5.5. To deﬁneTγ we needed the orientation ofSg,b,p, but
not an orientation forγ. A bit surprisingly, if we change the orientation of
γ the element Tγ remains unaﬀected.
The inverse T−1
γ transforms every curveµ crossing γ via a complete
right-turn and is sometimes called anegative Dehn twist.
We construct some examples in the torusT. Let m and l be some
ﬁxed meridian and longitude on the orientedT forming a positive basis, so
that m · l = +1 and we get an identiﬁcationMCG(T ) = SL 2(Z).
Proposition 6.5.6. The Dehn twistsTm and Tl are
Tm =
(1 −1
0 1
)
, T l =
(1 0
1 1
)
.
Proof. In homology we ﬁnd
Tm(m) = m, T m(l) = l − m, T l (l) = l , T l (m) = m + l .
The proof is complete. □
By Exercise 6.3.4 there is a unique non-separating simple closed curve
γ in Sg up to self-diﬀeomorphism for everyg ≥ 1. Therefore the Dehn
twists Tγ along non-separating curves inSg are all conjugate inMCG(Sg).
In the torus case these can be easily identiﬁed algebraically.
Corollary 6.5.7. An element A ∈ SL2(Z) = MCG( T ) is a (positive or
negative) Dehn twist⇐ ⇒it is primitive andtrA = 2.
Proof. Every such matrix inSL2(Z) is conjugate to
(1±1
0 1
)
. □
Exercise 6.5.8. The Dehn twistsTm and Tl generate MCG(T ).
We have seen that Dehn twists generateMCG(T ), while many ele-
ments A ∈ MCG(T ) are neither Dehn twists nor powers of Dehn twists
(those with trA ̸= 2). These two facts extend to higher-genus surfaces
Sg; we start by generalising the ﬁrst.
6.5.4. Dehn twists generate.Dehn twists are basic elements in the
mapping class group, and we now prove that they generate the whole
group. We restrict ourselves for simplicity to compact surfacesSg,b.
Theorem 6.5.9. The group MCG(Sg,b) is generated by Dehn twists.
To prove the theorem we will need some preliminary facts. We say
that two non-separating simple closed curves in the interior ofSg,b are
related if there is a combination of isotopies and Dehn twists transforming
the ﬁrst into the second.
Lemma 6.5.10. The non-separating curves inSg,b are all related.


## Page 197

6.5. MAPPING CLASS GROUP 189
a
b Ta Tb
Figure 6.27. Two curvesα (red) andβ (green) intersecting
in one point are related: we getα = Tβ(Tα(β)).
(1) (2)
a
b
g g
a
b
a
b
a
b
2g1
Figure 6.28. Pick two consecutive points inα (green) that
intersect β (red). We can ﬁnd a third non-separating curve
γ (blue) intersecting α and β in < k points. There are two
cases (1) and (2): in (1) the curveγ intersects β in one point
and is hence non-separating, in (2) we have two possibilities
γ1, γ2, and one is certainly non-separating sinceβ is.
Proof. Let α and β be two non-separating curves. Up to isotopy they
intersect transversely into somek points. If k = 1 they are related by a
couple of Dehn twists as shown in Figure 6.27. Ifk = 0, since they are
both non-separating, one sees easily that there is another curveγ with
i(α, γ) = i(β, γ) = 1: hence α and β are both related toγ, so they are
related themselves. If k ⩾ 2 we can ﬁnd a curveγ intersecting α and β
transversely into < k points as shown in Figure 6.28 and we proceed by
induction on k. □
We now considerSg,b with b ⩾ 2and ﬁx two pointsp, q in two distinct
boundary components ofSg,b. We consider all the properly embedded arcs
in Sg,b with endpoints atp and q. As above, we say that two such arcs are
related if there is a combination of Dehn twists and isotopies transforming
the ﬁrst into the second.
Lemma 6.5.11. The arcs in Sg,b with endpoints at p and q are all
related.
Proof. Pick two arcsα and β and put them into transverse position:
they intersect at their endpointsp and q and maybe transversely at some
k other points. Figure 6.29 shows that after isotopies and Dehn twists we
get α = β. □


## Page 198

190 6. SURFACES
Figure 6.29. The arcs α (red) and β (green) intersect at
their endpoints and maybe at somek interior points. Ifk = 0
and they are oriented as in (1), a Dehn twist alongγ trans-
forms β into α. Iftheyareorientedasin(2), anegativeDehn
twist alongγ transforms this conﬁguration into (1). Ifk > 0
we look at the ﬁrst intersection point inα. If the orientations
are coherent as in (3) a Dehn twist alongγ decreases k. It
the orientations are not coherent we change them as in (2).
We can ﬁnally prove Theorem 6.5.9.
Proof of Theorem 6.5.9. Letϕbe a self-diﬀeomorphism ofSg,b ﬁxing
pointwise the boundary. We prove thatϕ is generated by isotopies and
Dehn twists.
We ﬁrst prove the case g = 0 by induction on b. We know that
MCG(S0,1) is trivial, so we supposeb ⩾ 2. Let p, q be points in distinct
boundary components of S0,b, and α be an arc connecting them. All
the arcs with endpoints inp and q are related, and henceα and ϕ(α) are.
Therefore up to composing with Dehn twists and isotopies we may suppose
that ϕ is the identity ofα and hence also on a tubular neighbourhood of
α. We cut S0,b along α and get S0,b−1, with ϕ transformed into a self-
diﬀeomorphism of S0,b−1. By induction on b the new ϕ is generated by
Dehn twists and isotopies, so the originalϕ also is.
We prove the caseg > 0by induction ong. Let αbe a non-separating
simple closed curve. Since these are all related, up to isotopies and Dehn
twists we may suppose thatϕ is the identity onα; as above we can cut
Sg,b along α, get Sg−1,b+2 and conclude by induction ong. □


## Page 199

6.5. MAPPING CLASS GROUP 191
6.5.5. Action on simple closed curves.We now show that every el-
ement ϕ ∈ MCG(Sg) is determined by the way it permutes the (isotopy
classes of) simple closed curves inSg.
Proposition 6.5.12. The action of ϕ ∈ MCG(Sg) on the isotopy
classes of simple closed curves is faithful.
Proof. The proof of Theorem 6.4.7 shows that ifϕ ﬁxes the isotopy
classes of two essential multicurvesµ and η as in Figure 6.25 then it is
isotopic to the identity. □
Recall that every simple closed curve is oriented by assumption: if we
considered unoriented simple closed curves the proposition would be false,
because in low genus there are someϕ that send every curve to its inverse:
this happens for instance with the map−I ∈ SL2(Z) = MCG( T ).
6.5.6. References. The main source for this chapter is the book of
Farb–Margalit[ 18], whichcontainsalotmoreinformationonthemapping
class group of surfaces. We have also consulted Benedetti – Petronio [4]
and Thurson’s notes [56] and book [57], in particular for Smale’s Theorem,
that was originally proved in [54].


## Page 200

[No extractable text on this page]


## Page 201

CHAPTER 7
Teichmüller space
We have discovered in Chapter 6 that every surfaceSg of genusg ⩾ 2
can be equipped with a hyperbolic metric, and we have already noticed that
this metric is not unique: this chapter is entirely devoted to studying this
non-uniqueness phenomenon.
It turns out that Sg admits a continuous family of non-equivalent
hyperbolic metrics, that form altogether a nice topological space called
the Teichmüller spaceof Sg. We prove in his chapter that the Teichmüller
space of Sg is homeomorphic to an open ball of dimension6g − 6. To
prove this fact we will introduce and study concepts likelength functions,
earthquakes, andFenchel–Nielsen coordinates. The simple closed curves
and their geodesic representatives will play a fundamental role in all the
discussion.
7.1. Introduction
Let Sg be as usual a closed orientable surface of genusg. We know
that Sg admits an elliptic, ﬂat, or hyperbolic metric if and only ifg = 0,
g = 1, or g ⩾ 2 respectively. The elliptic metric on the two-sphere is
unique up to isometries, but the ﬂat and hyperbolic metrics on the other
surfaces are not.
We want to deﬁne the space of all ﬂat or hyperbolic metrics onSg
when g ⩾ 1. There are two natural ways do to this:
Deﬁnition 7.1.1. Themoduli spaceof Sg is the set of all the ﬂat or
hyperbolic metrics onSg considered up to orientation-preserving isometries
and rescaling.
The Teichmüller spaceTeich(Sg) is the set of all the ﬂat or hyperbolic
metrics on Sg considered up to isometries isotopic to the identity and
rescaling.
The rescaling of the metric is a simple operation that takes place only
on the ﬂat metrics on the torusT. On the torus T a ﬂat metric g can
be rescaled by any constantλ > 0 to give another ﬂat metric λg: the
rescaling changes the lengths by a factor
√
λ and the area by a factorλ.
Up to rescaling, we may for instance require thatT has unit area.
At a ﬁrst sight, the moduli space seems a more natural object to
study. It turns out however that the Teichmüller space is homeomorphic
193


## Page 202

194 7. TEICHMÜLLER SPACE
Figure 7.1. The ﬂat metric on the torusT determined by
z∈ H2 may be constructed by identifying the opposite sides
of the parallelogram with vertices0, 1, z , z + 1. The lattice
Γ is generated by1 and z and the parallelogram is a funda-
mental domain.
(for some natural topology) to an open ball, while the moduli space is
topologically more involved: it is then more comfortable to deﬁne and
study the Teichmüller space ﬁrst, and then consider the moduli space as a
quotient of Teichmüller space.
7.1.1. The Teichmüller space of the torus.The ﬂat metrics on the
torus T are classiﬁed quite easily. We have seen in Proposition 3.4.12 that
every ﬂat torusT is of typeC/Γ for some latticeΓ < C isomorphic toZ2.
Fix two generatorsm, l for π1(T ). These are identiﬁed to two gener-
ators of Γ. Up to rescaling the metric, rotatingC around the origin, and
reﬂecting along the real axis, we may suppose that these generators are
1 and some complex numberz lying in the upper half-planeH2, so that
Γ = ⟨1, z⟩.
Proposition 7.1.2. By sending the ﬂat metric on T to z we get a
bijection:
Teich(T ) − →H2.
Proof. The map is well-deﬁned: two metrics related by an isometry
isotopic to the identity produce the samez. The inverse H2 → Teich(T )
is constructed by identifyingT with C/⟨1,z⟩ sending (m, l) to (1, z). □
The ﬂat metric that corresponds toz ∈ H2 may be constructed by
identifying the opposite sides of a parallelogram as in Figure 7.1. We will
oftentacitlyidentify Teich(T )withtheprojectiveplane H2 viathisbijective
correspondence.
Remark 7.1.3. Let T = C/Γ be a ﬂat torus. Every translationz ↦→
z + w in C commutes with Γ and hence descends to an isometry ofT.
Therefore the isometry groupIsom+(T ) is not discrete: every ﬂat torus is
homogeneous, i.e. for every pair of pointsx , y ∈ T there is an isometry
sending x to y.


## Page 203

7.1. INTRODUCTION 195
Remark 7.1.4. LetT = C/Γ be a ﬂat torus. Every non-trivial element
γ ∈ π1(T ) is represented by a closed geodesic, unique up to translations.
Its counterimage in C consists of parallel lines whose slope depends only
on γ. The geodesic is simple if and only ifγ is primitive.
7.1.2. Action of the mapping class group.Recall that the mapping
class group MCG(Sg) of Sg is the group of all the orientation-preserving
self-diﬀeomorphisms of Sg considered up to isotopy (or equivalently, ho-
motopy). We now show that the mapping class group ofSg acts on its
Teichmüller space.
A diﬀeomorphism ϕ: Sg → Sg transports a metric m on Sg into a
new metric ϕ∗m by pushing it forward as follows:
(ϕ∗m)ϕ(x)
(
d ϕx (v), d ϕx (w )
)
= mx (v , w).
If m varies through an isotopy, the metricϕ∗m varies through a corre-
sponding isotopy: thereforeϕ acts on Teich(Sg) as follows
Teich(Sg) − →Teich(Sg)
[m] ↦− →[ϕ∗m]
If we varyϕ by an isotopy the action is unaﬀected. Therefore the mapping
class group MCG(Sg) acts on Teich(Sg), and by deﬁnition the quotient
Teich(Sg)/MCG(Sg )
is the moduli space ofSg.
Everything can be written explicitly for the torus. Recall that we have
identiﬁed Teich(T ) with H2 and MCG(T ) with SL2(Z), see Proposition
6.5.3.
Proposition 7.1.5. The action ofMCG(T ) on Teich(T ) is the follow-
ing action ofSL2(Z) on H2 as Möbius transformations:
(a b
c d
)
: z ↦− → az − b
−cz + d .
Proof. The metric z assigns to T the structure R2/Γ with Γ = ⟨1, z⟩
and (m, l) sent to (1, z).
Pick ϕ =
(a b
c d
)
∈ SL2(Z) = MCG( T ). Since ϕ−1 =
( d −b
−c a
)
, in the
new metric ϕ∗(z) we assign to(m, l) the translations (d − cz , −b + az ),
which transform via rotations and dilations into(1, az−b
−cz +d ). □
We note in particular thatMCG(T ) acts via isometries on the hyper-
bolic plane H2. The kernel of the action is{±I}: two matricesA and −A
act in the same way onTeich(T ).
Corollary 7.1.6. The moduli space ofT is the orbifoldH2/PSL2(Z).
The orbifoldH2/PSL2(Z) is described in Figure 3.22. It has two singular
points of order 2 and 3: these represent the square and hexagonal torus,
see Section 3.4.8 and Figure 3.15.


## Page 204

196 7. TEICHMÜLLER SPACE
Figure 7.2. A R-annulus around a simple closed geodesicγ
on a hyperbolic surface is the quotient of aR-neighbourhood
of a line l by a hyperbolic transformation. The orthogonal
(green) geodesic segments are parametrized by arc length as
[−R, R], hence the R-annulus is naturally parametrized as
S1× [−R, R].
We have constructed a bijection betweenTeich(T ) and H2, and we
now want to construct for g ⩾ 2 an analogous identiﬁcation between
Teich(Sg) and some open set ofRN for some N depending on g. To this
purpose we need to introduce some concepts.
7.2. Earthquakes and length functions
Simple closed geodesics are a formidable tool to studyTeich(Sg): we
can use a simple closed geodesic totwist a metric (the operation is called
an earthquake), and by simply looking at the lengths of the other closed
geodesics we can measure how the metric varies along this transforma-
tion. We introduce these operations here; later on, we will use them to
parametrize Teich(Sg).
7.2.1. Earthquakes. The hyperbolic, ﬂat, and spherical metrics on
surfaces may be twisted along simple closed geodesics: this operation is
called anearthquake.
Let m be a complete hyperbolic, ﬂat, or elliptic metric on an oriented
surface S and γ be a simple closed geodesic inS. Recall that γ is a map
γ : S1 → S. Fix an angle θ ∈ R. Informally, a new complete hyperbolic,
ﬂat, or elliptic metric mθ on S is constructed by cuttingS along γ and
regluing with a counterclockwise twist of angleθ. Formally, the new metric
is deﬁned as follows.
In the hyperbolic case, recall from Proposition 4.1.16 thatγ has a
R-neighbourhood isometric to a R-tube for some R > 0. A R-tube in
dimension two is aR-annulus as in Figure 7.2, deﬁned by quotienting aR-
neighbourhood of a linel by a hyperbolic transformation. TheR-annulus
is naturally parametrized asS1 × [−R, R], where {ei t} × [−R, R] is the


## Page 205

7.2. EARTHQUAKES AND LENGTH FUNCTIONS 197
Figure 7.3. To deﬁne the earthquake we pick a diﬀeomor-
phism of the R-annulus that modiﬁes the orthogonal seg-
ments as shown here.
geodesic segment orthogonal toγ in γ(ei t) parametrized by arc length.
The ﬂat and elliptic cases are analogous.
We choose a diﬀeomorphismϕ of S1 × [−R, R] that curves the seg-
ments left-wise with step θ as in Figure 7.3-(right). More precisely, let
f : [ −R, R] → R be a smooth function which is zero on
[
−R, − R
2
]
and is
constantly θ on
[ R
2 , R
]
. We setϕ(ei t, s) = ( ei(t+f (s)), s).
We deﬁne a new metricmθ on Sg as follows: the metric tensormθ
coincides with ϕ∗m on the R-annulus and coincides withm on the com-
plement of the R
2-annulus S1 ×
[
− R
2 , R
2
]
.
Proposition 7.2.1. The metric tensor mθ is well-deﬁned and gives a
complete hyperbolic, ﬂat, or elliptic metric toSg.
Proof. It is well-deﬁned becausem and mθ coincide on S1 ×
[ R
2 , R
]
,
since (ei t, s) ↦→ (ei(t+θ), s)isanisometryofthe R-annulus. Itishyperbolic,
ﬂat, or elliptic because both patchesm and ϕ∗m are. □
Remark 7.2.2. In the new metric mθ the curve γ is still a simple
closed geodesic of the same length as before, and itsR-neighbourhood is
also unchanged.
Of course by deforming an elliptic metric in this way we get nothing
new, because all the elliptic metrics onS2 are isometric. Earthquakes are
interesting only in the ﬂat and hyperbolic geometries.
7.2.2. The earthquake map.We consider the surfaceSg with g ⩾ 1
and show that earthquakes deﬁne nice actions on the Teichmüller space
Teich(Sg).
If m is any ﬂat or hyperbolic metric andγ is a non-trivial simple closed
curve in Sg, we deﬁne mγ
θ to be the ﬂat or hyperbolic metric obtained
from m via an earthquake of angleθ performed along the unique (up to
translations ifg = 1) simple closed geodesic homotopic toγ in the metric
m.


## Page 206

198 7. TEICHMÜLLER SPACE
Proposition 7.2.3. The earthquake map
Eγ : R × Teich(Sg) − →Teich(Sg)
(θ, m) ↦− →mγ
θ
is a well-deﬁned action ofR on Teich(Sg). The map Eγ depends only on
the homotopy class ofγ.
Proof. The only ambiguity in the deﬁnition ofmγ
θ is the choice of
the function f : [ −R, R] → R. If we use another functionf′ the resulting
metric (mγ
θ )′ changes only by an isotopy: the diﬀeomorphism ofSg which
is the identity outside theR-annulus and sends(ei t, s) to (ei(t+f (s)−f′(s)), s)
is an isometry betweenmγ
θ and (mγ
θ )′, and is clearly isotopic to the identity.
To prove thatEγ is an action we need to check that
mγ
θ+θ′ =
(
mγ
θ′
)γ
θ .
By Remark 7.2.2 we can take the sameR-annulus to compose two earth-
quakes and the equality follows. □
Like the Dehn twistsTγ deﬁned in Section 6.5.3, the actionEγ de-
pends on the orientation ofSg but not on the orientation ofγ. There is
indeed a strong relation between earthquakes and Dehn twists onγ: as
objects acting on Theichmüller space, the ﬁrst generalise the second.
Proposition 7.2.4. We have Tγ(m) = Eγ(2π, m).
Proof. It follows directly from the deﬁnitions. □
We now want to study the Teichmüller space and the action ofEγ on
it. In mathematics a space is often beautifully described by some natural
functions deﬁned on it: this role is played here by the length functions of
closed curves.
7.2.3. Length functions. A homotopically nontrivial (possibly non
simple) closed curveγ in Sg deﬁnes alength function
ℓγ : Teich(Sg) → R>0
which assigns to a metricm ∈ Teich(Sg) the length ℓγ(m) of the unique
closed geodesic homotopic toγ.
When g = 1 we must actually specify a couple of things in the def-
inition: the closed geodesicγ is unique only up to translations, which do
not aﬀect its length; on the other hand rescalingdoes aﬀect lengths, so
to get a well-deﬁned length function we rescalem to have unit area.
We want to study these length functions, and as usual we ﬁrst analyse
the simpler torus ﬂat world, where everything can be described explicitly.


## Page 207

7.2. EARTHQUAKES AND LENGTH FUNCTIONS 199
1
z
1
z
g
u
a
Figure 7.4. A torus with metricz (left) twisted along the
horizontal curve γ (right). The curveα is a closed geodesic
in the new metric.
7.2.4. Length functions on the torus. We denote every (isotopy
class of) non-trivial simple closed curve onT with a coprime pair(p, q)
of integers and we identify the Teichmüller spaceTeich(T ) with H2 ⊂ C,
see Propositions 6.3.2 and 7.1.2. The length functions may be written
explicitly.
Proposition 7.2.5. The formula holds:
ℓ(p,q)(z) = |p + qz |√
ℑz
for every simple closed curve(p, q) and every metricz ∈ H2.
Proof. Up to rescaling we have T = R2/Γ with Γ = ⟨1, z⟩. The
translation in Γ corresponding to (p, q) is p · 1 + q · z and the closed
geodesic it produces has length|p + qz |. The area of the torusT is ℑz
(see a fundamental domain in Figure 7.1) and hence we must rescale it by
1/
√
ℑz. □
We can also write the earthquake action on the meridianm = (1, 0).
Exercise 7.2.6. We have:
Em(θ, z) = z + θ
2π .
Hint. Look at the closed geodesicα in Figure 7.4. □
We have discovered in particular thatEm is a parabolic isometry ofH2,
and we now consider the earthquake action along a generic curve(p, q).
Corollary7.2.7. Theearthquakeaction E(p,q) isthe1-parameterfamily
of parabolic transformations with ﬁxed point− p
q ∈ ∂H 2.
Proof. We know this when(p, q) = (1 , 0) = m. In general, we send
(1, 0) to (p, q) via some element of the mapping class group: this element
acts by isometries ofH2 by Proposition 7.1.5 and sends∞ to − p
q. □


## Page 208

200 7. TEICHMÜLLER SPACE
The orbits of E(p,q) are the horospheres centred at − p
q. We have
discovered that, quite unexpectedly, the hyperbolic geometry of the plane
H2 is well designed to model the Teichmüller space of the ﬂat torusT.
It is now natural to identify theunoriented simple closed curve±(p, q)
with the rational point − p
q in R ∪ {∞} ⊂ ∂H 2. We get the following
convexity property.
Corollary7.2.8. Let γ, ηbetwosimpleclosedcurveson T. If i(γ, η) >
0 the length functionℓη is strictly convex on the orbits ofEγ.
Proof. We may suppose γ = m = (1 , 0) and note that the con-
dition i(γ, η) > 0 translates into η = ( p, q) ̸= ( ±1, 0). The function
in Proposition 7.2.5 is strictly convex on the horospheresℑz = k when
(p, q) ̸= (±1, 0). □
Summing up, the torus picture is the following:
• the mapping class group acts on the Teichmüller space roughly
like PSL2(Z) acts isometrically on the hyperbolic planeH2,
• the unoriented simple closed curves are in 1-1 correspondence
with the rational points in∂H 2 = R ∪ ∞,
• earthquakes act like parabolic transformations centred at these
rational points,
• the length functionℓγ is constant at the horospheres centred at
γ but strictly convex at the horospheres centred at all the other
curves.
The main goal of Chapters 7 and 8 is to draw a similar picture for
surfaces Sg of higher genus g ⩾ 2. Everything is more diﬃcult in the
hyperbolic world, because there are no nice explicit formulas describing the
length functions, the action of the mapping class group, the simple closed
curves, and the earthquakes. We now start by generalising the last point:
the strict convexity of length functions.
7.2.5. Convexity of the length functions.We consider Sg with g ⩾
2. Our aim now is to generalise Corollary 7.2.8 to the hyperbolic setting
and then later use this convexity property to parametrizeTeich(Sg). We
need a preliminary result.
Exercise 7.2.9. Letf : Rm × Rn → R⩾0 be strictly convex and proper.
The function
F : Rn − →R⩾0
y ↦− →min
{
f (x , y)
⏐⏐ x ∈ Rm}
is well-deﬁned, strictly convex, and proper.
The following generalisation of Corollary 7.2.8 says that length func-
tions are convex on the earthquakes orbits, and very often they are strictly
convex and proper.


## Page 209

7.2. EARTHQUAKES AND LENGTH FUNCTIONS 201
Figure 7.5. A geodesic in mγ
θ can be seen on the original
metric m as follows: it is a geodesic outside the annulus and
deviates on the left by an angleθ every time it crosses it
(centre). We may simplify the picture by describing it as a
broken geodesic line that makes a leftθ-jump each time that
it crosses γ (right).
Proposition 7.2.10.Let η and γ be two homotopically non-trivial sim-
ple closed curves inSg and m be a hyperbolic metric onSg. The function
R − →R⩾0
θ ↦− →ℓη(mγ
θ )
is
• constant if i(η, γ) = 0,
• strictly convex and proper ifi(η, γ) > 0.
Proof. The metric mγ
θ is obtained by twistingm of an angleθ along
the simple closed geodesicγ. If i(η, γ) = 0 the curvesη and γ are disjoint
geodesics in m and η is not aﬀected by the earthquakes that we perform
near γ, hence the functionℓη(mγ
θ ) is constant.
Consider the casen = i(η, γ) > 0. Denote by ¯ηθ the geodesic repre-
sentative of η in the twisted metricmγ
θ: it intersects γ transversely in n
points.
Fixasuﬃcientlysmall R-annulusaround γ andnotethatthegeodesics
in mγ
θ can be seen in the original metricm as follows: these are curves that
are geodesic outside theR-annulus and deviate smoothly on the left each
time they cross it as in Figure 7.5-(centre). We may substitute each
smooth deviation with a broken jump as shown in Figure 7.5-(right) and
get a bijection
{ closed geodesics
with respect to mγ
θ
}
← →
{ broken geodesics
with respect to m
}
where abroken geodesic is a geodesic that at every crossing ofγ jumps
to the left at distanceθL(γ)
2π and then keeps going on, leavingγ with the
same incidence angle (hereL(γ) is the length ofγ). This correspondence
is useful because it preserves the lengths: the length of the closed geodesic
for mγ
θ is equal to the length of the corresponding broken geodesic (which


## Page 210

202 7. TEICHMÜLLER SPACE
x -  '
'
x -  '
Figure 7.6. The (blue) linel is a lift of¯η. Consider n con-
secutiveintersectionswithlifts r1, . . . , rn+1 of γ (inred), with
τ(r1) = rn+1, and parametrize eachri with R via arc-length.
We set θ′ = θL(γ)/2pi.
is the sum of the lengths of its components), because the segments in
Figure 7.5-(left) and (right) are isometric.
We lift this description to the universal coverH2. We ﬁx a lift l of
¯η = ¯η0 and pick n + 1 consecutive intersections r1, . . . , rn+1 of l with the
lifts of γ as in Figure 7.6. The hyperbolic transformationτ with axis l
corresponding toη sends r1 to rn+1. We parametrise eachri with R via arc
length.
The closed geodesic ¯ηθ, represented as a broken geodesic, lifts to a
broken geodesic which starts at some pointx1 − θL(γ)/2π ∈ r1 and arrives
at some other pointx2 ∈ r2, then jumps on the left at distanceθL(γ)/2π
and starts again fromx2 − θL(γ)/2π, and so on until it reaches the point
τ(x1) ∈ τ(r1) = rn+1. If we make the pointsx1 ∈ r1, . . . , xn ∈ rn vary we
get various broken paths in this way, but only one arrives and exits from
each line ri with the same incidence angles and thus represents¯ηθ. The
other broken paths represent piecewise-geodesic curves homotopic to¯ηθ
and are therefore longer than¯ηθ. Hence
ℓη(mγ
θ ) = min
{ n∑
i=1
d
(
xi − θL(γ)
2π , xi+1
) ⏐⏐⏐⏐⏐ (x1, . . . , xn) ∈ Rn
}
where xn+1 = τ(x1). We can now prove that the functionθ ↦→ ℓη(mγ
θ ) is
proper and strictly convex. The function
ψ : R2n − →R
(x1, y1, . . . , xn, yn) ↦− →
n∑
i=1
d(yi , xi+1)


## Page 211

7.2. EARTHQUAKES AND LENGTH FUNCTIONS 203
where xn+1 = τ(x1) is strictly convex and proper by Proposition 2.4.4. The
auxiliary function
φ: R2n × R − →R
(x , θ) ↦− →ψ(x)
is only convex, but its restriction to the subspace
H =
{
yi = xi − θl (γ)
2π
}
is strictly convex and proper, because the subspaceH is not parallel to the
direction (0, . . . ,0, 1). The coordinates xi and θ identify H with Rn × R.
The restriction f = φ|H is hence a functionf : Rn × R → R and we obtain
ℓη(mγ
θ ) = min
{
f (x , θ)
⏐⏐ x ∈ Rn}
.
By Exercise 7.2.9 the functionθ ↦→ ℓη(mγ
θ ) is strictly convex and proper.
□
We now employ this convexity property to prove some facts on the
earthquakes and the Teichmüller space.
7.2.6. Earthquakes on essential multicurves.We use the convexity
of the length functions to prove the following. We suppose again that
g ⩾ 2.
Corollary 7.2.11. For every simple closed curve γ, the earthquake
action Eγ on Teich(Sg) is free.
Proof. Suppose by contradiction that m = mγ
θ0 for some θ0 > 0.
Then m = mγ
nθ0 for every n ∈ Z. Let η be a simple closed curve with
i(η, γ) > 0, which exists by Exercise 6.3.13; the functionθ ↦→ ℓη(mγ
θ ) is
strictly convex and constant on{nθ0, n ∈ Z}, a contradiction. □
The earthquake action is deﬁned more generally for essential multi-
curves. An essential multicurve µ = γ1 ⊔ · · · ⊔ γk of Sg determines an
action
Eµ : Rk × Teich(Sg) − →Teich(Sg)
(θ, m) ↦− →mµ
θ
where θ = ( θ1, . . . , θk) and mµ
θ = mγ1
θ1 ◦ · · · ◦ mγk
θk. Note that the actions
on disjoint curves commute.
Corollary 7.2.12. For every essential multicurve µ, the earthquake
action Eµ on Teich(Sg) is free.
Proof. We may completeµ to a pants-decompositionµ = γ1 ⊔ . . . ⊔
γ3g−3. Pick for every i = 1 , . . . ,3g − 3 a curve γ′
i as in Figure 7.7 such
that i(γi , γ′
i ) > 0 for all i and i(γi , γ′
j ) = 0 for all i ̸= j.
Suppose by contradiction thatm = mµ
θ for someθ ̸= 0: hence mµ
nθ =
m for all n ∈ Z. There is an i such that θi ̸= 0. The length function


## Page 212

204 7. TEICHMÜLLER SPACE
Figure 7.7. Choose for each componentγi of a pants de-
composition µ a curve γ′
i that intersects γi in one or two
points and is disjoint from the other components ofµ. There
are two cases to consider, depending on whether the two
pants adjacent toγi are distinct (left) or not (right).
Figure 7.8. A frame for the Fenchel-Nielsen coordinates
consists of a (red) pants decompositionµ and a (blue) trans-
verse multicurve ν that cuts each pair of pants into two
hexagons. The number of components ofµ is 3g− 3, that
of ν can vary.
ℓγ′
i (mµ
θ )dependsonlyon θi andnotontheothercoordinatesof θ: therefore
it equals ℓγ′
i (mγi
θi ) which is strictly convex, a contradiction. □
7.3. Fenchel–Nielsen coordinates
It is now time to ﬁx a global set of coordinates for the Teichmüller
space when g ⩾ 2. These are theFenchel–Nielsen coordinates and they
identify Teich(Sg) with R6g−6, more precisely withR3g−3
>0 × R3g−3.
7.3.1. The coordinates. We want to construct a parametrisation for
Teich(Sg) when g ⩾ 2. To identify a ﬁnite-dimensional vector space with
Rn one needs to ﬁx a basis; likewise, here the parametrisation depends on
the choice of a frame.
Let Sg be oriented. Aframe for Sg consists of two essential multic-
urves µ and ν in minimal position, such that:
(1) the multicurve µ is a pants decomposition,
(2) themulticurve ν decomposeseverypair-of-pantsintwohexagons.
An example that generalises easily to any genusg ≥ 2 is shown in
Figure 7.8. The pants decomposition µ = γ1 ⊔ . . . ⊔ γ3g−3 consists of
3g − 3 curves, while the number of curves inν is not ﬁxed a priori and


## Page 213

7.3. FENCHEL–NIELSEN COORDINATES 205
Figure7.9. Aclosedgeodesic ¯γ1 andthetwoadjacentpairs-
of-pants. Thetorsionparameter θ1 measuresthedistance(in
theuniversalcovering)betweentwoorthogeodesics(coloured
in green) via the formulaθi = 2πsi
li
.
depends on our choice ofν. We now show that a frame induces aFenchel–
Nielsen map
FN : Teich(Sg) − →R3g−3
>0 × R3g−3
m ↦− →(l1, . . . , l3g−3, θ1, . . . , θ3g−3).
The map FN is deﬁned as follows. Let m ∈ Teich(Sg) be a hyperbolic
metric. The 3g − 3 length parameters li = ℓγi (m) are deﬁned using the
length functions: the multicurveµ has a unique geodesic representative
¯µ = ¯γ1 ⊔ . . . ⊔ ¯γ3g−3
in the metricm by Corollary 6.3.23, andli is the length of¯γi. Note that
these parameters depend only onµ and not onν.
The torsion angles θi are more subtle to deﬁne: the geodesic multic-
urve ¯µ decomposes Sg into geodesic pairs-of-pants, and the angleθi mea-
sures somehow the way the two geodesic pairs-of-pants are glued along
the closed geodesic ¯γi. The precise deﬁnition of θi needs the auxiliary
multicurve ν.
We ﬁx i = 1 for simplicity and deﬁne θ1. Figure 7.9-(left) shows
the two geodesic pants adjacent to¯γ1 (they might coincide). The second
multicurve ν intersects these pants in four blue arcs, two of whichλ, λ′
intersect ¯γ1: we pick one, sayλ. We ﬁx a lift˜P ∈ H2 of P = ¯γ1 ∩ λ and
we lift all the curves incident toP: the geodesic¯γ1 lifts to a line˜γ1 and λ
lifts to a (non-geodesic) curve˜λ that connects two lifts˜γ2 and ˜γ3 of the
closed geodesics ¯γ2 and ¯γ3. See Figure 7.9-(right).
We draw as in the ﬁgure the unique orthogeodesics connecting˜γ1 to
˜γ2 and ˜γ3 and we denote bys1 the signed length of the segment in˜γ1
comprised between these two orthogeodesics, with positive sign if (as in
the ﬁgure) an observer walking on a orthogeodesic towards˜γ1 sees the
other orthogeodesic on its left (here we use the orientation ofSg).


## Page 214

206 7. TEICHMÜLLER SPACE
Figure 7.10. If we pickλ′ instead of λ we ﬁnd a segment
of the same lengths1. This holds because the two geodesic
pairs-of-pants incident to γ1 decompose into two hexagons
isometric to A and B as shown, and the sides ofA and B
contained in ˜γ1 have the same lengthl(γ1)
2 , that is half the
length of γ1.
By repeating this construction for each¯γi we ﬁnd some real numbers
si. Finally, the torsion parameterθi is
θi = 2πsi
li
.
Theorem 7.3.1 (Fenchel-Nielsen coordinates).The map FN is well-
deﬁned and is a bijection.
Proof. We ﬁrst note that in the deﬁnition of the torsion parameters
we could have chosenλ′ instead of λ. We would have obtained the same
length si as shown in Figure 7.10. Moreover a hyperbolic metricm′ iso-
metric to m through a diﬀeomorphismϕ isotopic to the identity has the
same parametersli and θj since they depend only on the isotopy classes of
µ and ν. Therefore FN is well-deﬁned.
We prove that FN is surjective. For every vector (l1, . . . , l3g−3) ∈
R3g−3
>0 we may use Proposition 6.2.1 and construct a metric on Sg by
assigning to each pair-of-pants of the pants decompositionµ the (unique)
hyperbolic metric with boundary lengthsli. We get a metric with some
arbitrarytorsionangles θ,whichcanbechangedarbitrarilybyanearthquake
along µ: it is easy to check that an earthquake with anglesθ′ changes the
torsion angles fromθ to θ +θ′, hence any torsion parameter can be realised
and FN is surjective.
We prove thatFN is injective. If FN(m) = FN( m′), up to acting via
earthquakes we suppose thatFN(m) = FN( m′) = ( l1, . . . , l3g−3, 0, . . . ,0).
Sincethetorsionparameteriszero,theorthogeodesicsinFigure7.9-(right)
match and project in Sg to a geodesic multicurve ¯ν isotopic to ν and


## Page 215

7.3. FENCHEL–NIELSEN COORDINATES 207
g g'
g''
g
g' g''
Figure7.11. Thecurves γ (red), γ′ (blue), andγ′′ = Tγ(γ′)
(green) on the torus.
orthogonal to ¯µ. Therefore Sg \ (¯µ ∪ ¯ν) is a tessellation ofSg into right-
angled hexagons, determined by the lengthsli. Both metrics m and m′
have the same tessellation and are hence isometric, via an isometry which
is isotopic to the identity. □
Remark 7.3.2. As shown in the proof, the torsion parameters form
are zero if and only if the geodesic representatives¯ν and ¯µ of ν and µ are
everywhere orthogonal.
7.3.2. Length functions of 9g − 9 curves. It is now natural to ask
whether the length functions determine every point inTeich(Sg). The
answer is positive; as usual, to warm up we start by examining the torus.
Let γ, γ′ be two simple closed curves in the torusT with i(γ, γ′) = 1
and let γ′′ = Tγ(γ′) be obtained by Dehn twistingγ′ along γ, see Figure
7.11.
Proposition 7.3.3. The map
L: Teich(T ) − →R3
>0
m ↦− →
(
ℓγ(m), ℓγ′
(m), ℓγ′′
(m)
)
is injective.
Proof. After ﬁxing γ and γ′ as a homology basis, we haveγ = (1, 0),
γ′ = (0, 1), and γ′′ = (1, −1). Proposition 7.2.5 gives
L(z) =
( 1√
ℑz
, |z|√
ℑz
, |z − 1|√
ℑz
)
which is easily seen to be injective onTeich(T ) = H2. □
A similar set of9g − 9 curves does the job onSg when g ⩾ 2. Let
µ = γ1 ⊔ . . . ⊔ γ3g−3 be a pants decomposition forSg. For each γi we
choose a curve γ′
i as in Figure 7.7, and we indicate byγ′′
i = Tγi (γ′
i ) the
curveobtainedbyDehn-twisting γ′
i along γi, seeanexampleinFigure7.12.
Proposition 7.3.4. The map
L: Teich(Sg) − →R9g−9
>0
m ↦− →
(
ℓγi (m), ℓγ′
i (m), ℓγ′′
i (m)
)


## Page 216

208 7. TEICHMÜLLER SPACE
gi gi '
gi ''
Figure 7.12. The curves γi (red), γ′
i (blue), and γ′′
i =
Tγi (γ′
i ) (green) whenγi is adjacent twice to the same pair of
pants. It is an instructive exercise to drawγ′
i and γ′′
i when
γi is incident to distinct pair of pants.
is injective.
Proof. We compose L with FN−1 and obtain a map
L ◦ FN−1 : R3g−3
>0 × R3g−3 − →R9g−9
>0
(li , θi ) ↦− →(li , l′
i , l′′
i )
We prove that it is injective: it suﬃces to consider the case where the
values li are ﬁxed andθi vary. Note thatγ′
i and γ′′
i intersect γj if and only
if i = j: hence l′
i and l′′
i depend only on θi and not on the other torsion
parameters θj. Proposition7.2.10saysthat l′
i = f (θi )isstrictlyconvexand
Proposition 7.2.4 givesl′′
i = f (θi + 2π). A strictly convex proper function
f : R → R is at most 2 to 1, hence the function
R − →R × R
θi ↦− →
(
f (θi ), f (θi + 2π)
)
is injective. ThereforeL is injective. □
7.3.3. Collar lemma. The thick-thin decomposition theorem implies
thattheclosedgeodesicsoflengthsmallerthanaMargulisconstant ε2 ona
complete hyperbolic surface aresimple andhave disjointR-neighbourhoods
(see Corollary 4.2.16). When the curves are very short, one may choose
R to be very large: this fact is called thecollar lemma and we prove it
directly using elementary tools.
For any numberl > 0, draw the quadrilateral as in Figure 7.13-(left)
and deﬁne f (l) to be the distance between its opposite sidesl and r.
Exercise 7.3.5. The functionf : R>0 → R>0 is strictly decreasing and
a homeomorphism. In particular we getliml→0 f (l) = ∞. Explicitly, we
have
sinh f (l) = 1
sinh l
2
.
Hint. Put l in vertical position inH2 and use Lemma 5.2.7. □
The function f is simple to deﬁne, and is particularly useful.


## Page 217

7.3. FENCHEL–NIELSEN COORDINATES 209
l
f( )l a
r
s
r
b
Figure 7.13. Pick a segment of lengthl and draw two per-
pendiculars at the endpoints: this determines a quadrilateral
with two ideal vertices; letf (l) be the distance between the
opposite sides l and r (left). A geodesic pair-of-pants is
the union of two isometric hexagons, which form inH2 a
right-angled octagon as drawn. The picture shows that the
closed boundary geodesics a and b have disjoint f (a) and
f (b)-neighbourhoods, coloured here in yellow (right).
Proposition 7.3.6. Let P be a geodesic pair-of-pants with boundary
lengths a, b, and c. The f (a), f (b), and f (c)-neighbourhoods of the
boundary components form three disjoint collars.
Proof. Consider two boundary componentsa and b. The geodesic
pair-of-pants P is divided into two isometric hexagons, and we lift them
to H2 where they form a right-angled octagon as in Figure 7.13-(right).
The picture shows that thef (a) and f (b)-neighbourhoods of a and b are
disjoint. □
Here is the collar lemma.
Lemma 7.3.7 (Collar lemma).Let g ⩾ 2 and Sg have a hyperbolic
metric. Disjoint simple closed geodesicsγ1, . . . , γk of lengthl1, . . . , lk have
disjoint tubular f (li )-neighbourhoods.
Proof. We may suppose (by adding more simple closed geodesics if
necessary) that the closed geodesics form a pants decomposition, and
it suﬃces to consider two curves that cobound the same pair-of-pants.
Proposition 7.3.6 applies. □
We recall from Corollary 4.2.16 that every closed geodesic shorter
than ε2 is simple. Therefore very short closed geodesics are simple and
have large disjoint tubular neighbourhoods: the more we shrink the curves,
the larger are their neighbourhoods, and hence the larger is the diameter
of the surface (the diameter of a metric space is the supremum of the
distance of its points). In particular, if on a sequence of closed hyperbolic


## Page 218

210 7. TEICHMÜLLER SPACE
surfaces the injectivity radius tends to zero, their diameters must tend to
inﬁnity.
Among the many consequences of the collar lemma, we focus on a
simple inequality which relates the geometric intersection of simple closed
geodesics to their lengths. We denote byL(γ) the length ofγ.
Corollary 7.3.8. Let g ⩾ 2 and Sg have a hyperbolic metric. Let γ
and η be two simple closed geodesics inSg. The following inequality holds:
L(η) ⩾ 2i(η, γ) · f (L(γ)).
Proof. The geodesic γ has a tubular f (L(γ))-neighbourhood. The
geodesic η intersects γ in i(η, γ) points and hence crosses the tubular
neighbourhood at least i(η, γ) times, each with a segment of length⩾
2f (L(γ)). □
7.3.4. AtopologyfortheTeichmüllerspace. Therearevariousequiv-
alent ways to assign a topology to the Teichmüller space. On the torus
T, we have seen thatTeich(T ) can be identiﬁed with the hyperbolic plane
H2, and the mapping class group acts as isometries on it: we could not
hope for a better picture ofTeich(T ) and we are fully satisﬁed.
When g ⩾ 2 we could similarly use the Fenchel-Nielsen coordinates
and giveTeich(Sg) the topology ofR6g−6, but then to be honest we should
also check that the topology does not depend on the frame... we prefer
to equip the Teichmüller space with an intrinsic topology and then prove
that the Fenchel-Nielsen coordinates are homeomorphisms.
We indicate byS = S (Sg) the set of all the non-trivial simple closed
curves inSg, considered up to isotopy and orientation reversal (we say that
the curves areunoriented). Each elementγ ∈ S induces a length function
ℓγ : Teich(Sg) − →R>0.
We indicate as usual withRS the set of all functionsS → R and give it
the usual product topology (the weakest one such that all the projections
are continuous). The natural map
Teich(Sg) − →RS
m ↦− →
(
γ ↦− →ℓγ(m)
)
is injective by Propositions 7.3.3 and 7.3.4. We may hence consider
Teich(Sg) as a subspace ofRS and assign it the subspace topology. This
topology on Teich(Sg) is the weakest one where the length functionsℓγ
are continuous. Recall that a topological space issecond-countable if it
has a countable base.
Proposition 7.3.9.The spaceRS is Hausdorﬀ and second-countable.
Proof. Every product of Hausdorﬀ spaces is Hausdorﬀ, and every
countable product of second-countable spaces is second-countable. □


## Page 219

7.3. FENCHEL–NIELSEN COORDINATES 211
We recall the following topological fact.
Proposition 7.3.10. Let f : X → Y be a continuous and proper map
between topological spaces. IfY is Hausdorﬀ and second-countable then
f is closed.
Proper maps onto reasonable spaces are closed. If they are also in-
jective, we can obtain more.
Corollary 7.3.11.Let f : X → Y be acontinuous, proper, and injective
map between topological spaces. IfY is Hausdorﬀ and second-countable
then f is a homeomorphism onto its image.
We will use this corollary in a moment. Recall that every isometry
ϕ ∈ Isom+(H2) = PSL2(R) has a tracetrϕ deﬁned only up to sign, whose
modulus is > 2 precisely when ϕ is hyperbolic, see Proposition 2.3.9.
Proposition 7.3.12.Let S = H2/Γ be an orientable hyperbolic surface.
Every hyperbolic transformationϕ ∈ Γ produces a closed geodesicγ in S
with
|trϕ| = 2 cosh L(γ)
2 .
Proof. Up to conjugacy we haveϕ(z) = eL(γ)z. The matrix is
ϕ =
(
e
L(γ)
2 0
0 e− L(γ)
2
)
hence |trϕ| = 2 cosh L(γ)
2 . □
In particular, the length ofγ depends continuously on the transforma-
tion ϕ. We will use this fact to prove the following. We supposeg ⩾ 2.
Proposition 7.3.13. The Fenchel-Nielsen map
FN : Teich(Sg) − →R3g−3
>0 × R3g−3
is a homeomorphism.
Proof. We consider Teich(Sg) inside RS and examine the inverse
FN−1 : R3g−3
>0 × R3g−3 − →RS .
We prove that FN−1 is continuous. The map FN−1 assigns to the
parameters (li , θi ) a metric on Sg constructed by attaching right-angled
hexagons. Both the hexagons and the attaching maps depend continu-
ouslyontheparameters (li , θi )andlifttoatessellationof H2 intohexagons.
Since the decomposition into hexagons varies continuously, its deck trans-
formations vary continuously inPSL2(R) and hence the length functions
too by Proposition 7.3.12. ThereforeFN−1 is continuous.
We prove thatFN−1 is proper. Take a diverging sequence of param-
eters (li , θi ) (that is, without converging subsequences) inR3g−3
>0 × R3g−3:


## Page 220

212 7. TEICHMÜLLER SPACE
we need to show that its image is also a diverging subsequence. The the-
sis is equivalent to show that the length function of some curve goes to
inﬁnity. If li → +∞ for some i we are done. If li → 0, the length of
any curve intersecting essentially the shrinking curveγi goes to inﬁnity by
Corollary 7.3.8. It remains to consider the case where the length parame-
ters li converge to some non-zero value, but some twist parameterθj goes
to inﬁnity: in that case the length of any curve intersecting the twisted
curve γj goes to inﬁnity by Proposition 7.2.10.
Finally, themap FN−1 isahomeomorphismontoitsimagebyCorollary
7.3.11. The proof is complete. □
During the proof we have also discovered the following.
Proposition 7.3.14. If a sequencemi ∈ Teich(Sg) diverges, there is a
γ ∈ S such that ℓγ(mi ) → ∞ on a subsequence.
Recall that the action of a topological groupG on a topological space
X is continuous if the action mapG × X → X is continuous. This implies
that G acts on X by homeomorphisms. We give the mapping class group
MCG(Sg) the discrete topology.
Proposition 7.3.15.The earthquakes and mapping class group actions
on the Teichmüller space are continuous.
Proof. The mapping class group acts onS by permutations, hence
its action onRS is continuous. On Fenchel-Nielsen coordinates the earth-
quake action sendsθ to θ + θ′ and is hence continuous. □
The immersion inR9g−9 is also a topological embedding.
Proposition 7.3.16. The injective representationTeich(Sg) ↪→ R9g−9
furnished by Proposition 7.3.4 is a homeomorphism onto its image.
Proof. Using Fenchel-Nielsen coordinates the map is clearly continu-
ous. The proof that it is proper is as in Proposition 7.3.13. □
7.3.5. Surfaces of ﬁnite type.We have considered only closed sur-
faces Sg for simplicity, but most of the arguments exposed in this chapter
extend easily to all surfacesSg,b,p of ﬁnite type with negative Euler char-
acteristic.
The Teichmüller space Teich(Sg,b,p ) is the set of all the complete
hyperbolic metrics with geodesic boundary, considered up to isometries
that are isotopic to the identity. Fenchel-Nielsen coordinates are deﬁned
analogously: the surface decomposes into −χ(Sg,b,p ) = 2 g + b + p − 2
pairs-of-pants, and the interior curves of the decomposition are
1
2
(
3(2g + b + p − 2) − b − p
)
= 3g + b + p − 3.
The Fenchel-Nielsen coordinates are
(
l1, . . . , l3g+b+p−3, l ∂
1 , . . . , l∂
b , θ1, . . . , θ3g+b+p−3
)


## Page 221

7.4. SHEAR COORDINATES 213
where theli and l ∂
j are the length parameters of the3g + b + p − 3 interior
and b boundary curves, and theθi are the torsion angles of the interior
curves. We get a bijection
FN : Teich(Sg,b,p ) − →R3g+2b+p−3
>0 × R3g+b+p−3
which is a homeomorphism with respect to the natural topology on Te-
ichmüller space as a subset ofRS. Therefore the Teichmüller space is
homeomorphic to a ball of dimension−3χ(Sg,b,p ) − p.
Forinstance,theTeichmüllerspaceofapair-of-pantsis R3
>0 parametrized
by the lengths of the boundary geodesics, while that of a thrice-punctured
sphere is a point (there is a unique metric).
An alternative description of the Teichmüller space for punctured sur-
faces, with ideal triangles playing the role of pairs-of-pants, is described in
the next section.
7.4. Shear coordinates
TheTeichmüllerspaceofapuncturedsurfacemayalsobeparametrized
using ideal triangles instead of pairs-of-pants: this viewpoint is maybe a bit
simpler, and generalises successfully to dimension three (via ideal tetrahe-
dra). The coordinates that it produces are calledshear coordinates.
7.4.1. Ideal triangulations. In dimension two and three it is custom-
ary to relax the deﬁnition oftriangulation, originally restricted to simplicial
complexes, see Section 1.7.7. We prefer to deﬁne a triangulation in a
looser sense, as a ﬁnite set of triangles glued together by pairing their
edges.
Let ∆1, . . . ,∆2k be an even number of identical copies of the standard
oriented 2-simplex. Atriangulation T is a partition of the6k edges of the
triangles into3k pairs, and for each pair a simplicial isometry between the
two edges. The triangulation is oriented if the simplicial isometries are
orientation-reversing. If we glue the triangles along the isometries we get
a compact surface S: we always suppose that S is connected and T is
oriented, hence S = Sg for some g ⩾ 0.
The surface S is triangulated with2k triangles, 3k edges, and some
p vertices. Vertices, edges, and triangles form a cellularisation ofS, but
not necessarily a simplicial complex: for instance two or three vertices of
the same triangle∆i can be identiﬁed to a single one along the process,
as the following exercise shows.
Exercise 7.4.1. Construct a triangulation of the torus with one vertex,
three edges, and two triangles.
Let Σbethenon-compactsurfaceobtainedbyremovingthe p vertices
of the triangulationT from S: we say thatT is anideal triangulationfor
Σ. The surfaceΣ is apunctured surface, i.e. Σ = Sg,0,p with p ⩾ 1.


## Page 222

214 7. TEICHMÜLLER SPACE
Figure 7.14. The standard representation ofSg by identi-
fying the edges of a4g-gon has one vertex; we triangulate
the 4g-gon and get an ideal triangulation forSg,0,1 (left). A
move that modiﬁes a triangulation by adding a new vertex
(right).
Proposition7.4.2. Wehave χ(Σ) = −k < 0. Everypuncturedsurface
of negative Euler characteristic has an ideal triangulation.
Proof. We have χ(Σ) = χ(S) − p = p − 3k + 2k − p = −k. An
ideal triangulation for S0,0,3 is constructed by attaching ∆1 and ∆2 via
the obvious maps. An ideal triangulation forSg,0,1 is constructed in Figure
7.14-(left) for allg ⩾ 1. An ideal triangulation forSg,0,p with χ(Sg,0,p) < 0
and p ⩾ 2 is obtained from one of these by increasingp as in Figure 7.14-
(right). □
7.4.2. Hyperbolic ideal triangulations. Let T be an oriented trian-
gulation with triangles∆1, . . . ,∆2k. We substitute every∆i with an ideal
hyperbolic triangle (recall that it is unique up to isometry) and pair the
edges with some orientation-reversing isometries. The resulting oriented
punctured surface Σ inherits a hyperbolic structure of areakπ, since an
ideal triangle has areaπ. We callT a hyperbolic ideal triangulationfor Σ.
The edges are inﬁnite lines and the gluing isometry is not unique: in-
deed there is a 1-parameter family of isometries to choose from at every
pair of edges, and the hyperbolic structure depends on that – although the
topology of Σ does not. To encode this dependence, we note that every
edge of an ideal triangle has a preferredmidpoint deﬁned in Figure 7.15.
The orientation-reversing isometry between two edges of two triangles is
determined by the signed distanced (called shear) of their two midpoints
as shown in Figure 7.16-(left). The hyperbolic structure onΣ is deter-
mined by theshear coordinates d = ( d1, . . . , d3k) of the 3k edges of the
triangulation.
7.4.3. Complete solutions. The hyperbolic structure on Σ may be
incomplete! Recall that a hyperbolic surface is complete if and only if its
universal cover isH2, so we now look at the universal cover ofΣ.


## Page 223

7.4. SHEAR COORDINATES 215
Figure 7.15. On an ideal triangle every edge has a unique
perpendicular which ends at the opposite vertex. The base of
this perpendicular is themidpoint of the edge and the three
perpendiculars intersect in a point calledbarycenter (left).
There is a unique conﬁguration of three pairwise tangent
horocycles centred at the ideal vertices, and their tangency
points are the midpoints of the edges (right).
d
d1
d2
d3
1 2 3 1
'
Figure 7.16. The shear is the signed distance d between
two midpoints after the gluing. By convention the sign is
positive d > 0 if the points are as shown here, that is an
observer that arrives at the midpoint of an edge sees the
other midpoint on its left: we need the orientation ofT here
(left). We develop a triangulation around a puncturev: here
h = 3 (right).
Proposition 7.4.3. The universal cover ˜Σ of Σ is isometric to the
interior of the intersection of some half-planes inH2 with disjoint boundary
lines (see Figure 7.17). The surfaceΣ is complete if and only if˜Σ ∼= H2.
Proof. Recall from Section 3.5.3 the developing mapD : ˜Σ → H2.
We prove thatD is injective.
We can constructD as follows: the hyperbolic ideal triangulationT
of Σ lifts to a hyperbolic ideal triangulation˜T of ˜Σ with inﬁnitely many
triangles. Send a triangle of˜T to an arbitrary ideal triangle ofH2 and then
develop the map D by attaching subsequently all the triangles of˜T. At
each step the image ofD is an ideal polygon and we attach a new triangle


## Page 224

216 7. TEICHMÜLLER SPACE
Figure 7.17. The universal covering ofΣ is isometric to the
interior of a convex set delimited by some lines inH2, which
is the intersection of (possibly inﬁnitely many) half-planes
bounded by disjoint lines.
to the exterior of some side of the polygon. Therefore at each stepD is
injective and henceD is globally injective.
Since D is injective we identify˜Σ with its open image inH2. Pick a
point x ∈ ∂ ˜Σ. Every neighbourhood of x must intersect inﬁnitely many
triangles of ˜T, hence there is a sequence of edgesei of ˜T such thatd(ei , x)
is monotone decreasing and tends to zero. Since theei are disjoint, their
endpoints in ∂H2 are monotone and tend to two points, which determine
a line l. We must haved(l , x) = 0 and hence x ∈ l and l ⊂ ∂ ˜Σ.
We have discovered that ∂ ˜Σ consists of disjoint lines. This proves
that the closure of ˜Σ is the intersection of half-planes. A surface Σ is
complete if and only if˜Σ is complete, and hence isometric toH2. □
The hyperbolic structure onΣ depends on the shearing coordinates
d ∈ R3k, and we now want to understand which values ofd produce a
complete metric. An ideal vertexv of the triangulationT is adjacent to
some h triangles, which we denote by∆1, . . . ,∆h for simplicity although
there might be repetitions, and toh edges with some shearing coordinates
thatwealsoindicateby d1, . . . , dh forsimplicity. Thevertex v isapuncture
of Σ and let N(v) be a small topological punctured closed disc aroundv.
Proposition 7.4.4. The punctured discN(v) is complete if and only if
d1 + . . . + dh = 0.
Proof. We construct a portion of the developing mapD : ˜Σ → H2 as
follows: we use the half-plane model and send∆1 to H2 with v = ∞ as in
Figure 7.16-(right), then we develop the triangulation horizontally. In the
picture h = 3 so we reproduce∆1, ∆2, ∆3 and then another copy∆′
1 of ∆1.
Let ϕ ∈ PSL2(R) be the holonomy isometry that sends∆1 to ∆′
1.
If d1 + . . .+ dh = 0 the midpoints of∆1 and ∆′
1 are at the same height
as in Figure 7.16-(right) and thereforeϕ is a parabolic mapϕ: z ↦→ z + b


## Page 225

7.4. SHEAR COORDINATES 217
1 2 3
1 2 3' ' '
1 2 3'' '' ''
1 2 3''' ''' '''
1 2 3' ' '3
l
0
s
Figure 7.18. When d1 + . . . + dh̸= 0, the isometryϕ send-
ing ∆1 to ∆′
1 is hyperbolic, with some axis l which (up to
translations) has endpoints 0 and∞. Hence ϕ(z) = ed z
and the triangulation develops towardsl as shown here.
for someb ∈ R. Therefore N(v) is a truncation of the cuspH2/⟨ϕ⟩, which
is complete.
If d1 + . . . + dh ̸= 0 the midpoints of ∆1 and ∆′
1 are at diﬀerent
heights and thereforeϕ is not parabolic. Since∞ ∈ Fix(ϕ), the isometry
ϕ is a hyperbolic transformation having some other ﬁxed point inR. Up
to translating everything we may suppose thatFix(ϕ) = {0, ∞}, hence
the axis l of ϕ is the vertical coordinate axis, andϕ(z) = ed z with d =
d1 + . . . + dh. The mapD develops towardsl as shown in Figure 7.18: we
get l ⊂ ∂ ˜Σ, so ˜Σ ̸= H2 is not complete. □
Summing up, we have acompleteness equationof typedi1 +. . .+dih =
0 for each of thep ideal vertices of the triangulation.
Corollary 7.4.5.The hyperbolic structure onΣ is complete if and only
if d satisﬁes the p completeness equations.
Proof. Let N(v) be a small punctured closed disc atv for every ideal
vertex v. The closure ofΣ \ ∪v N(v) is compact. ThereforeΣ is complete
if and only if eachN(v) is. □
7.4.4. Shear coordinates for Teichmüller space.The solution space
of the completeness equations is some linear subspaceV ⊂ R3k of di-
mension at least 3k − p = −3χ(Σ) − p. Note that this is precisely the
dimension of Teich(Σ), see Section 7.3.5. We have constructed a map
sh : V − →Teich(Σ).
Wewillprovebelowthat shisahomeomorphismandhence dim V = 3k −p.
We will use the following.
Proposition 7.4.6. Let Σ be a complete hyperbolic punctured sur-
face. Every ideal triangulation ofΣ is isotopic to a unique hyperbolic ideal
triangulation.


## Page 226

218 7. TEICHMÜLLER SPACE
1 2 3
1 2 3' ' '
1 2 3'' '' ''
1 2 3''' ''' '''
1 2 3' ' '3
l
0
s
Figure 7.19. Let s be a Euclidean line at hyperbolic distance
R from l. If R is suﬃciently small, the lines does not inter-
sect the lower edges of∆1, ∆2, ∆3. Let S be the region lying
above s.
Proof. We describe a procedure thatstraightens every ideal triangu-
lation T of Σ = H2/Γ to a hyperbolic one.
Truncate the cusps ofΣ to get a compact sub-surface. The ideal
triangulation T is now truncated to a decomposition into hexagons, each
with three boundary and three interior edges. We lift the truncated cusps
and the hexagons toH2. Truncated cusps lift to horoballs, bounded by
horocycles, and hexagons lift to hexagons (the hexagons are not geodesic,
only smooth).
An interior edge of a hexagon inH2 cannot have both its endpoints
in the same horocycle, since it would form a bigon with it, and a bigon
does not decompose into hexagons (by a Euler characteristic argument).
Therefore every interior edge connects two distinct horocycles, centred
at two distinct points of∂H2. Replace this edge with the geodesic line
connecting these two ideal points.
If we do this at every interior edge we get aΓ-invariant hyperbolic
ideal triangulation ofH2, which projects to a hyperbolic ideal triangulation
for Σ isotopic to T. □
We can now parametrizeTeich(Σ).
Corollary 7.4.7. The map sh is a bijection.
Proof. Proposition 7.4.6 shows that in every metric the initial trian-
gulation T straightens to an ideal hyperbolic one and is hence realised by
some d, so sh is surjective. Moreover the straightened triangulation is
unique and the parameters di are obtained intrinsically from it, sosh is
also injective. □
7.4.5. Incomplete metrics. The shear coordinatesd may deﬁne an
incomplete metric onΣ, and we now determine its metric completionΣ.
Recall that every ideal vertexv has atotal shear dv = di1 + . . . + dih
which is zero precisely whenΣ is complete nearv.


## Page 227

7.4. SHEAR COORDINATES 219
Figure7.20. Nearanidealvertex v, horocycles(inblue)and
edges of the triangulation (in red) are mutually orthogonal.
They behave much diﬀerently in presence of a cusp (left) or
of a geodesic boundary (right): in a cusp, horocycles form
parallel circles and edges point toward the cusp; near a geo-
desic boundary, the horocycle point orthogonally toward the
boundary and the edges spin and wind around it indeﬁnitely.
Proposition 7.4.8. The metric completion Σ is a hyperbolic surface
with geodesic boundary, whose boundary lengths are the absolute values
of the total shears of the vertices.
Proof. Let N(v) be a small closed punctured disc aroundv. If dv = 0
we already know thatN(v) is a truncated cusp. Ifdv ̸= 0 we developN(v)
in H2 as in Figure 7.19. The hyperbolic transformation isϕ(z) = edv z and
the points at distanceR from l form a Euclidean lines starting from 0.
Pick R small so thats does not intersect the lower edges of∆1, . . . ,∆h.
Since s is ϕ-invariant, it is contained in the union of all the developed
triangles of Figure 7.19 and hence in˜Σ.
The line s projects to a (non-geodesic) circle inΣ around v, and we
can suppose that∂N (v)is that circle. We haveN(v) = S/γ where S ⊂ H2
is the region lying aboves. The completion S equals S ∪ l and therefore
N(v) = S/γ is an annulus with two boundary components: the original
non-geodesic ∂N (v) and a new geodesicl /γ, a curve of length|dv |. □
If dv ̸= 0,theedgesofthetriangulationpointingtowards v spinaround
the geodesic boundary as shown in Figure 7.20-(right). The spinning di-
rection induces an orientation on each component of∂Σ, which depends
on the sign ofdv.
Summing up, every shear coordinated = ( d1, . . . , d3k) ∈ R3k deter-
mines a hyperbolic surfaceΣ with some p′ cusps and b oriented geodesic
boundary, where b + p′ = p is the number of vertices of the ideal trian-
gulation. The surface Σ is diﬀeomorphic to Sg,b,p′. Let Teichor(Sg,b,p′)


## Page 228

220 7. TEICHMÜLLER SPACE
denote the Teichmüller space of the surfaceSg,b,p′ equipped with an ori-
entation of theb boundary components: of course this is just2b copies of
Teich(Sg,b,p′).
Proposition 7.4.9. The shear coordinates induce a bijection
R3k ← →
⨆
b+p′=p
Teichor(Sg,b,p′).
Proof. The map sendsd ∈ R3k to the complete hyperbolicΣ, and we
now exhibit an inverse. LetΣ be a surface of ﬁnite type with a hyperbolic
structure withp′ cusps andb oriented geodesic boundary components, and
Σ = int( Σ). We may straighten any ideal triangulationT of Σ similarly
as we did in Proposition 7.4.6, with the only diﬀerence that horocycles are
replaced byoriented geodesic lines as lifts of oriented geodesic boundary
components; in the construction, we use the ﬁnal endpoint of the oriented
line instead of the ideal point of the horocycle. We get an ideal triangula-
tion of Σ whose completion isΣ. □
For instance, R3 parametrizes altogether all the hyperbolic metrics
on the pair of pants, where each boundary component becomes either an
oriented geodesic or “degenerates” to a cusp.
7.4.6. References. Most of the material presented here is standard
and can be found in many books, starting from Thurston’s notes [56].
The main reference is Farb – Margalit [18], which also contains the proof
of Proposition 7.2.10, that appeared originally in a paper of Bestvina,
Bromberg, Fujiwara, and Souto [5]. The proof of the Collar Lemma is
taken from Hubbard [30].


## Page 229

CHAPTER 8
Surface diﬀeomorphisms
We describe in this chapter an analogy between the hyperbolic space
Hn and the Teichmüller space Teich(Sg) of a closed orientable surface
Sg of genus g ⩾ 1. The theory, originated from Thurston in the late
1970s, provides a beautiful and powerful framework for the analysis of the
geometricanddynamicalpropertiesofthesurfaces Sg andoftheirmapping
class group MCG(Sg).
Here is a quick sketch of this analogy. We have already seen that
Hn compactiﬁes to a closed discHn, that Isom(Hn) acts on it, that by
Brouwer’s theorem every non-trivial isometryϕ has a ﬁxed point inHn,
and we have called ϕ elliptic, parabolic, or hyperbolic according to the
position of its ﬁxed points.
We construct in this chapter a similar compactiﬁcation of the open
ball Teich(Sg) to a closed disc. The action of the mapping class group
MCG(Sg) extends to this closed disc, and by Brouwer’s theorem every
non-trivial element ϕ of MCG(Sg) has a ﬁxed point there. According to
the position of the ﬁxed points ofϕ, we say thatϕisﬁnite order, reducible,
or pseudo-Anosov.
If ϕ is an isometry for some hyperbolic structure ofSg, it belongs to
the ﬁrst type. Dehn twists belong to the second. The pseudo-Anosov
maps are both the most mysterious and the most important, and for their
study we need to introduce a wealth of beautiful new technology:geodesic
currents, laminations, andtrain tracks.
8.1. Thurston’s compactiﬁcation
Let Sg be a surface of genusg ⩾ 2. Recall that Teich(Sg) is the
Teichmüller space ofSg and S = S (Sg) is the set of all non-trivial simple
closed curves inSg, considered up to isotopy and orientation reversal: all
the closed curves considered in this chapter areunoriented.
Although Teich(Sg) and S are very diﬀerent in nature, we want to
compactify both spaces by embedding them in a single bigger space. The
model that we have in mind, and that we would like to extend to higher
genus surfaces, is the ﬂat torus picture that was painted in Section 7.2.4.
We brieﬂy summarise it. The Teichmüller spaceTeich(T ) of the torus
T is H2 and it compactiﬁes toH2; the mapping class groupMCG(T ) acts
221


## Page 230

222 8. SURFACE DIFFEOMORPHISMS
on H2 as a discrete group of isometries; as such, the non-trivial elements
of MCG(T ) are divided into three classes (hyperbolic, parabolic, elliptic);
the simple closed curves form a dense countable set of rational points in
∂H2 = R ∪ {∞}.
We now may wonder whether there is an analogous identiﬁcation
between Teich(Sg) and H6g−6 that transforms Teich(Sg) into a discrete
subgroup of Isom(Hn). This is unfortunately not the case, and the com-
pactiﬁcation of Teich(Sg) must be constructed from scratch via diﬀerent
methods: we compactify Teich(Sg) by embedding it in a bigger inﬁnite-
dimensional space.
8.1.1. Projective immersion. In Chapter 7 we have used the length
functions to construct an embedding
i : Teich(Sg) ↪→ RS .
We know thatTeich(Sg) is homeomorphic to an open ball of dimension
6g − 6, and we want to compactify it in a geometrically meaningful way. A
ﬁrst tentative could be to take its closure inRS, but this does not work:
Proposition 8.1.1. The subspace i(Teich(Sg)) is closed inRS.
Proof. Inclusion is proper, hence closed by Proposition 7.3.10. □
We are apparently stuck, so we turn back to our model, hyperbolic
space, to get some inspiration. We recall thatHn is properly embedded
in the lorentzian Rn+1 as a hyperboloid In. To compactify Hn, we may
consider its imageKn in RPn (the Klein model) and take the closureKn
there. We try to mimic this construction, by considering the projective
space P(RS ) with the projection
π : RS \ {0} − →P(RS ).
We ﬁrst need to check thatTeich(Sg) embeds there.
Proposition 8.1.2. The composition
π ◦ i : Teich(Sg) − →P(RS )
is injective.
Proof. Suppose by contradiction that there are two distinct points
m, m′ ∈ Teich(Sg) with π(i(m)) = π(i(m′)); this implies that there is a
constant k > 1 such that ℓγ(m) = k · ℓγ(m′) for all γ ∈ S. That sounds
very unlikely, and we now prove that it easily leads to a contradiction.
Let γ1, γ2 ∈ S be two curves withi(γ1, γ2) = 1. We takex0 = γ1 ∩γ2
as a basepoint forπ1(Sg, x0)and note that the elementsγ2 ∗γ1 and γ2 ∗γ−1
1
are represented by two more non-trivial simple closed curves inSg. It is
easily checked that the formula
tr(A) · tr(B) = tr( AB) + tr(A−1B)


## Page 231

8.1. THURSTON’S COMPACTIFICATION 223
holds for anyA, B ∈ SL2(R). Proposition 7.3.12 implies that
2 cosh
(L(γ1)
2
)
· cosh
(L(γ2)
2
)
= cosh
(L(γ2 ∗ γ1)
2
)
+ cosh
(L(γ2 ∗ γ−1
1 )
2
)
We have obtained a relation between the lengths ofγ1, γ2, γ2 ∗ γ1, and
γ2 ∗ γ−1
1 that holds for any hyperbolic metric onSg. It may be rewritten
as:
cosh
(
L(γ1)+L(γ2)
2
)
+cosh
(
L(γ1)−L(γ2)
2
)
= cosh
(
L(γ2∗γ1)
2
)
+cosh
(L(γ2∗γ−1
1 )
2
)
.
By contradiction every m′-length is k times a m-length: this equation is
hence valid after multiplying every argument byk. It is easy to check that
cosh a+cosh b = cosh c +cosh d , cosh ka +cosh kb = cosh kc +cosh kd
if and only if{a, b} = {c, d }. This leads to a contradiction: the number
L(γ1) +L(γ2) is strictly bigger thanL(γ2 ∗ γ1) or L(γ2 ∗ γ−1
1 ), sinceγ2 ∗ γ1
and γ2∗γ−1
1 haveanon-geodesicrepresentativeoflength L(γ1)+L(γ2). □
We have embeddedTeich(Sg) in P(RS ), and we now turn toS.
8.1.2. Thurston’s compactiﬁcation. We now embedS in P(RS ).
A simple closed curveγ ∈ S deﬁnes a functionali(γ) ∈ RS by setting:
i(γ)(η) = i(γ, η).
We have constructed a mapi : S → RS.
Proposition 8.1.3. The composition
π ◦ i : S − →P(RS )
is injective.
Proof. Let γ1, γ2 ∈ S be distinct. There is always a curveη ∈ S
with i(γ1, η) ̸= 0 and i(γ2, η) = 0. (If i(γ1, γ2) > 0, simply takeη = γ2.
Otherwise, it is an easy exercise.) □
We will now tacitly consider bothTeich(Sg) and S as subsets ofRS.
Proposition8.1.4. Thesubsets Teich(Sg)and S aredisjointin P(RS ).
Proof. For each γ ∈ S we have i(γ, γ) = 0 , while every curve has
positive length on any hyperbolic metric. □
We can now state Thurston’s compactiﬁcation theorem.
Theorem 8.1.5. The closure Teich(Sg) of Teich(Sg) in P(RS ) is
homeomorphic to the closed discD6g−6. Its interior isTeich(Sg) and its
boundary sphere containsS as a dense subset.


## Page 232

224 8. SURFACE DIFFEOMORPHISMS
In particular, the closure ofS is homeomorphic to a sphereS6g−7.
The proof of Theorem 8.1.5 occupies most of this chapter and will be
completed in Section 8.3.18. We will introduce in the process various
new geometric objects that play an important role in the topology of man-
ifolds in dimension two and three:geodesic currents, laminations, andtrain
tracks.
For the moment we content ourselves with checking that this pro-
jective embedding strategy works at least on the much simpler ﬂat torus
case.
8.1.3. The torus. The Teichmüller space of the torusT is described
in Section 7.2.4 and needs no further comment; nevertheless, we prove
here that the projective embedding strategy works forT, just as a sanity
check before approaching the more complicated higher genus surfaces.
Proposition 8.1.6. The space Teich(T ) embeds in P(RS ) and its
closure there is homeomorphic to a closed discD2. The interior of this
disc is Teich(T ) and its boundary containsS as a dense subset.
Proof. Everything can be written explicitly by identifying Teich(T )
with the half-plane H2 and S with the set Q ∪ {∞} ⊂ ∂H 2. Exercise
6.3.14 and Proposition 7.2.5 give
i
(p
q , r
s
)
=
⏐⏐⏐⏐det
(p r
q s
)⏐⏐⏐⏐ = |ps − qr | = |s| ·
⏐⏐⏐p − q r
s
⏐⏐⏐ ,
ℓ
p
q (z) = |p + qz |√
ℑz
.
Therefore the images of r
s ∈ S and z ∈ H2 = Teich(T ) in P(RS ) are
respectively the functionals
p
q ↦− →
⏐⏐⏐p − q r
s
⏐⏐⏐ if s ̸= 0 and |q| if s = 0,
p
q ↦− → |p + qz | .
We could remove the constants|s| and
√
ℑz because we are considering
functionals in P(RS ) rather than in RS. We deﬁne for all z ∈ H2 the
functional
fz : p
q ↦− → |p + qz | if z ̸= ∞,
f∞ : p
q ↦− → |q|.
and we get a continuous immersion z ↦→ fz of H2 into P(RS ). The
immersionisclosedbecauseitsendsacompactspacetoaHausdorﬀspace,
hence it is a homeomorphism onto its image. The image is the closure of
Teich(T ) and its boundary containsS as a dense set. □


## Page 233

8.2. GEODESIC CURRENTS 225
8.2. Geodesic currents
We will prove Thurston’s compactiﬁcation Theorem 8.1.5 using a
slightly diﬀerent perspective. We are guided by the analogy with the hy-
perbolic space: when we embed (actually, deﬁne) the spaceHn in Rn+1,
we make an essential use of the lorentzian form⟨, ⟩ in Rn+1, so that Hn
consistsofsomepoints v with ⟨v , v⟩ = −1, and∂Hn maybeidentiﬁedwith
the light cone rays, that is the rays spanned by vectorsv with ⟨v , v⟩ = 0.
It would be nice to have a similar nice bilinear form⟨, ⟩ on RS, with
the property thatTeich(Sg) and S consist of points with⟨v , v⟩ = k and
⟨v , v⟩ = 0 respectively, for some ﬁxedk ̸= 0. Unfortunately we are not
able to deﬁne such a bilinear form inRS, and in order to get one we now
substitute RS with a similar (but more structured) inﬁnite-dimensional
space, the space ofgeodesic currents.
In geometric measure theory, acurrent is a measure on some space,
whichgeneralisesthenotionof m-dimensionalsubmanifoldina n-manifold.
A geodesic currentis a similar tool introduced by Bonahon in 1988 specif-
ically designed for geodesics on hyperbolic surfaces.
We will see that the geodesic currents are indeed equipped with a
bilinear form, which generalises beautifully both the intersection number
i(α, β) of curves and the length functionsℓγ on the Teichmüller space.
8.2.1. Geodesics. Fromnowon, andthroughalltherestofthischap-
ter, we will consider geodesics only as subsets, neglecting their parametri-
sation.
More precisely, let M a complete hyperbolic manifold. We indicate
by G (M) the set of the supports of all the complete non-trivial geodesics
R → M. With a little language abuse, we call an element ofG (M) a
geodesic.
A geodesic inG (M) is closed if it is the support of a closed geodesic
S1 → M, that is if it is compact; otherwise, it isopen. We say that a
geodesic issimple if it has a simple geodesic parametrisation, either as an
open geodesic R → M or as a closed oneS1 → M.
We are particularly interested in the setG = G (H2) of lines inH2. A
line is determined by its extremes, hence there is a natural bijection
G ← →
(
∂H2 × ∂H2 \ ∆
)
/∼
where ∆ = {(a, a) | a ∈ ∂H2} is the diagonal and (a, b) ∼ (b, a). We
assign to G the topology of
(
∂H2 × ∂H2 \ ∆
)
/∼.
Exercise 8.2.1. The space G is homeomorphic to an open Möbius
strip. The lines intersecting a compact set K ⊂ H2 form a compact
subset of G.
The isometries ofH2 act naturally onG by homeomorphisms.


## Page 234

226 8. SURFACE DIFFEOMORPHISMS
Proposition 8.2.2. If S = H2/Γ is a complete hyperbolic surface there
is a natural bijection
G (S) ← →G /Γ.
Proof. Every geodesic inS lifts to aΓ-orbit of lines inH2. □
It is typically more comfortable to lift objects fromS to the universal
cover H2, and to study them there: we will often see a geodesicγ ∈ G (S)
as a Γ-orbit of lines inH2.
Wewillsincenowconsideronlyclosedsurfaces Sg ofgenus g ⩾ 2. We
now prove the crucial fact thatG (Sg) depends only mildly on the chosen
hyperbolic metric forSg. An isomorphism between two pairs(G1, Γ1) and
(G2, Γ2) of groups Γi acting on topological spaces Gi is an isomorphism
ψ : Γ 1 → Γ2 together with aψ-equivariant homeomorphismG1 → G2.
Proposition 8.2.3.Let g ⩾ 2and Sg = H2/Γ have a hyperbolic metric.
The pair (G , Γ) does not depend (up to canonical isomorphisms) on the
chosen hyperbolic metric.
Proof. Let m, m′ be two hyperbolic structures onSg, inducing two
diﬀerent coverings π, π′ : H2 → Sg. The identity mapSg → Sg lifts to a
map H2 → H2 that extends to an equivariant homeomorphism∂H2 → ∂H2
by Theorem 5.2.1. This induces an equivariant homeomorphism G →
G. □
Here and in the next sections, the hyperbolic metric onSg has only an
auxiliary role: we need it to identifySg with H2/Γ and to deﬁne and study
some geometric objects likeG (Sg) = G /Γ, but most of our discoveries will
be independenta posterioriof the auxiliary hyperbolic metric.
Let Sg = H2/Γ be a hyperbolic surface. We note thatΓ does not act
properly discontinuously onG.
Proposition 8.2.4. The Γ-orbit of a linel ∈ G is discrete if and only
if l projects to a closed geodesic inSg.
Proof. Let π(l) ⊂ Sg be the projection ofl in Sg. Since Sg is com-
pact, the projectionπ(l) is not a closed geodesic⇔ there is a small disc
D ⊂ Sg intersecting π(l) into inﬁnitely many distinct segments⇔ there
is a small discD ⊂ H2 intersecting inﬁnitely many lines of theΓ-orbit ofl
⇔ the Γ-orbit is not discrete. □
The lines l ⊂ H2 that project to closed geodesics inSg are precisely
theaxisofthehyperbolicisometries ϕin Γ, andthe Γ-orbitofonesuchaxis
l consists of the axis of all the isometries inΓ conjugate to ϕ. Two such
axis are either incident or ultraparallel by Corollary 4.2.3, and the closed
geodesic in Sg is simple if and only if all the distinct axis in theΓ-orbit are
ultraparallel.
Proposition 8.2.4 implies in particular that theΓ-orbit of l is discrete
only for countably many linesl ∈ G.


## Page 235

8.2. GEODESIC CURRENTS 227
RecallfromCorollary4.1.14thateveryhomotopicallynon-trivialclosed
curve in Sg is homotopic to a unique closed geodesic.
8.2.2. Geodesic currents. We now introduce a measure-theoretical
notion which is at ﬁrst sight unrelated with everything we have seen up to
now; we will later show that, on the contrary, it generalises many of the
geometric objects that we have encountered in the last pages. The basic
notions of measure theory that we will need are summarised in Section 1.3.
Deﬁnition 8.2.5. LetSg = H2/Γ have a hyperbolic metric. Ageodesic
current on Sg is a locally ﬁniteΓ-invariant Borel measure onG = G (H2).
We denote byC = C (Sg) the set of all the geodesic currents inSg.
It is a subset of the spaceM (G ) of all the locally ﬁnite Borel measures
on G, closed with respect to sums and products with non-negative scalars,
and it inherits its topology, see Section 1.3.3.
The currents spaceC is independent of the auxiliary hyperbolic metric
on Sg up to canonical isomorphisms, since the pair(G , Γ) is.
8.2.3. Closed geodesics. We now introduce a fundamental example
of geodesic current.
Example 8.2.6 (Closed geodesics). A closed geodesicγ on Sg = H2/Γ
lifts by Proposition 8.2.4 to a discreteΓ-orbit of lines inH2. The Dirac
measure on this discrete set is locally ﬁnite andΓ-invariant, hence it is a
geodesic current.
We can therefore interpret every closed geodesic inSg as a particular
geodesic current with discrete support. In particular we get an embedding
S ↪→ C
of the setS of all (isotopy classes of) unoriented non-trivial simple closed
curves in Sg into C. The embedding is deﬁned by taking the geodesic
representative of each curve. Recall that the hyperbolic metric plays only
an auxiliary role.
The following proposition implies that – conversely – every current
supported on a discrete set is a linear combination of closed geodesics.
Proposition 8.2.7. If l ∈ G is an atomic point for a geodesic current
µ, that is ifµ({l}) > 0, then l projects to a closed geodesic inSg.
Proof. Since l is atomic and µ is Γ-invariant and locally ﬁnite, the
Γ-orbit ofl in G is discrete. We conclude thanks to Proposition 8.2.4.□
It is an important aspect of the theory that atomic points may be only
of a very speciﬁc type. We remind that many closed geodesics are not
simple.


## Page 236

228 8. SURFACE DIFFEOMORPHISMS
a a
b
c
d
Figure 8.1. A pencil and a box (in the Klein model).
8.2.4. Pencils. We have determined the 0-dimensional subsets of
G that may have positive mass, and we now look at some natural 1-
dimensional ones. Let apencil p ⊂ G of lines centred ata ∈ ∂H2 be some
Borel set of lines all having one endpoint ata, as in Figure 8.1-(left).
Wenotethatapencilmaycontainatmostoneaxisofsomehyperbolic
transformation in Γ, because two axis are never asymptotically parallel by
Corollary 4.2.3.
Proposition 8.2.8. Let µ be a geodesic current. The mass of a pencil
p is zero, unless it contains the axis of some non-trivial element inΓ.
Proof. It suﬃces to consider the case wherep contains no axis, and
consists of all lines with one endpoint ina and another in some segment
[b, c] ⊂ ∂H2 not containing a.
As the lines inp point to a, they project inSg to a narrow beam of
linesthatgoonrunningforeverandexponentially-narrowingin Sg butnever
close up. There is a discD ⊂ Sg intersecting them inﬁnitely many times,
hence a lift D ⊂ H2 intersects inﬁnitely many disjointΓ-translates of p.
The lines intersectingD form a compact subset ofG, henceµ(p) = 0. □
8.2.5. Boxes. We now investigate some natural 2-dimensional sub-
sets of G. Let a, b, c, d ∈ ∂H2 be four distinct counterclockwise-ordered
pointsasinFigure8.1-(right): theydeterminetwodisjointarcs [a, b], [c, d ]
in ∂H2 and hence a compact setB = [a, b] × [c, d ] ⊂ G consisting of all
lines with endpoints in[a, b] and [c, d ], see Figure 8.1-(right). We call this
compact set B a box.
The topological boundary ∂B of a box B has four sides: the four
pencils of lines inB with one endpoint ina, b, c, or d. We say that the
box B is generic if no line l ∈ ∂B projects to a closed geodesic,i.e. no
l ∈ ∂B is the axis of some hyperbolic transformation inΓ. This is indeed a
generic condition: if neither ofa, b, c, d is the endpoint of some axis, then
B is certainly generic, and recall that there are only countably many axis
overall.


## Page 237

8.2. GEODESIC CURRENTS 229
Figure 8.2. The box B containing l and the sub-boxesB′,
B′′ (left). A linel∈ Uγ parametrised as(t, θ) (right).
We equip the currents spaceC with the weak-* topology introduced
in Section 1.3.3. We now prove that a converging sequence of currents
behave well on generic boxes.
Proposition 8.2.9. If µi ⇀ µ is a converging sequence of geodesic
currents and B is a generic box, thenµi (B) → µ(B).
Proof. By Proposition 1.3.8 it suﬃces to prove thatµ(∂B) = 0, and
this follows from Proposition 8.2.8. □
8.2.6. Rigidityofatoms. Wenowuseboxestoprovethattheatomic
points in C are somehow rigid.
Proposition 8.2.10.The closed geodesics form a discrete subset inC.
Proof. Let µ ∈ C be a closed geodesic,i.e it is the Dirac measure on
the Γ-orbit of an axisl ⊂ H2 of some hyperbolic transformationϕ ∈ Γ.
Let B = [ a, b] × [c, d ] be a small generic box containingl and no
other Γ-translate of l, so thatµ(B) = 1. Up to substitutingϕ with ϕ−1
we may suppose thatϕ([a, b]) = [ a′, b′] ⊂ [a, b]. Consider the sub-boxes
B′ = [ a, a′] × [c, d ] and B′′ = [ b′, b] × [c, d ] shown in Figure 8.2-(left).
Since ϕ contracts [a, b] and expands [c, d ], we have
(4) B \ p ⊂
∞⋃
i=1
ϕi (B′ ⊔ B′′).
where p is the pencil containingl and other lines with one endpoint varying
in [c, d ]. Note that p contains no axis ofΓ other than l. If necessary, we
move a′ and b′ slightly farther froma and b to ensure thatB′ and B′′ (and
hence all theirϕ-translates) are generic while (4) still holds.
We have µ(B′ ⊔ B′′) = 0 and we deﬁne an open neighbourhoodU of
µ in the current spaceC as follows:
U =
{
η ∈ C | η(B′ ⊔ B′′) < ε, η (B) > 1 − ε
}


## Page 238

230 8. SURFACE DIFFEOMORPHISMS
for some ﬁxed0 < ε < 1. This is indeed an open set becauseB, B′, and
B′′ are generic. We now prove thatU contains no closed geodesic except
µ.
By contradiction, suppose U contains a closed geodesic η. Since
η(B) > 1 − ε > 0, at least one atoml′ of η is contained inB. If l′ = l
then η = µ and we are done. Otherwise, the linel′ is contained inB \ p
and hence inϕi (B′ ⊔ B′′) for some i. This is impossible since this set has
measure ε < 1. □
We have classiﬁed the elements inC supported on discrete sets, and
it is now due time to introduce some geodesic currents supported on the
whole of G.
8.2.7. The Liouville measure. There is a continuous measure on
G = G (H2) that is invariant under the action of the whole isometry group
Isom(H2). This measure is called theLiouville measure, and is deﬁned as
follows.
Let γ : R → H2 be a geodesic parametrised by arc length, andUγ ⊂ G
be the open set consisting of all the lines intersectingγ, except γ itself.
We can parametriseUγ via the homeomorphism
R × (0, π) → Uγ
that sends(t, θ) to the linel that intersectsγ at the pointγ(t) with angle
θ, see Figure 8.2-(right). We deﬁne a volume 2-form onUγ by setting:
Lγ = 1
2 sin θ d t ∧ d θ.
Since G is non-orientable, we cannot hope to deﬁne a global area form on
G. However all these local forms match up to sign and hence give rise to
a measure.
Proposition 8.2.11. The charts Uγ form a diﬀerentiable atlas forG.
The 2-forms Lγ match up to sign and hence deﬁne a measureL on G.
Proof. Every line in H2 intersects some other line, hence the charts
cover G. We consider a liner ∈ Uγ ∩ Uγ′. The charts Uγ and Uγ′ have
parametrisations (t, θ) and (t′, θ′) and 2-forms
Lγ = 1
2 sin θd t ∧ d θ, L γ′ = 1
2 sin θ′d t′ ∧ d θ′.
We consider the jacobianJ = ∂(t′,θ′)
∂(t,θ) and recall that
d t′ ∧ d θ′ = det J · d t ∧ d θ
so we need to show that
(5) det J = ± sin θ
sin θ′ .
We can reparametriseγ at our please, since this may changeLγ only by a
sign. We may suppose thatγ and γ′ are asymptotically parallel, because


## Page 239

8.2. GEODESIC CURRENTS 231
0 1
g
C
g'
r
u
u'
R
Figure 8.3. The two asymptotic linesγ, γ′ in the half-space
model H2 and the liner intersecting both.
any two linesγ, γ′ intersecting r are connected by a pathγ = γ1, . . . , γk =
γ′ of lines intersectingr, such that any two subsequent linesγi, γi+1 are
asymptotically parallel (actuallyk = 3 suﬃces).
We represent the linesγ, γ′, and r in the half-plane modelH2 ⊂ R2
as in Figure 8.3. Up to isometries and reparametrisations we have
γ(t) = (0 , et), γ ′(t′) = (1 , et′
).
The line r is a Euclidean half-circle with center at some pointC ∈ R
and with some radiusR > 0. It intersects γ and γ′ at some heights et
and et′
, with some anglesθ and θ′. We now calculate the determinant of
J = ∂(t′,θ′)
∂(t,θ) . Figure 8.3 shows that
R = et
sin θ = et′
sin θ′
C = −et cot θ, 1 − C = et′
cot θ′.
Now
∂(C, R)
∂(t, θ) =
(−et cos θ sin−1 θ e t sin−2 θ
et sin−1 θ −et cos θ sin−2 θ
)
whosedeterminantis −e2t sin−1 θ = −R sin θ, andwegetthesameformula
for ∂(C,R)
∂(t′,θ′). Therefore
det ∂(t′, θ′)
∂(t, θ) = det ∂(t′, θ′)
∂(C, R) ·det ∂(C, R)
∂(t, θ) = (−R sin θ′)−1 ·(R sin θ) = sin θ
sin θ′
and we ﬁnally obtain (5), as required. □
The measure L on G is called the Liouville measure and is clearly
invariant by the action ofIsom(H2). The renormalising factor 1
2 in the
deﬁnition was chosen to get the following property, which nicely charac-
terises L.
Proposition 8.2.12. Let s ⊂ H2 be a geodesic segment of lengthl.
The lines inH2 intersecting s form a set of measurel.


## Page 240

232 8. SURFACE DIFFEOMORPHISMS
Proof. The set has measure
∫ π
0
∫ l
0
1
2 sin θ d t d θ = l
∫ π
0
1
2 sin θ d θ = l .
The proof is complete. □
The Liouville measureL is supported on the whole ofG.
Exercise 8.2.13. The Liouville measure of a boxB = [a, b] × [c, d ] is
L(B) =
⏐⏐ log β(a, b, c, d )
⏐⏐
where β is the cross-ratio of the four points.
8.2.8. The Liouville current.Let now Sg = H2/Γ be equipped with
a hyperbolic metric. The Liouville measure onG is Isom(H2)-invariant: in
particular it isΓ-invariant and hence deﬁnes a currentL ∈ C (Sg), called
the Liouville current.
It is important to note that the space of currentsC = C (Sg) does
not depend on the given hyperbolic metric forSg, but the Liouville current
does! Every metric m ∈ Teich(Sg) induces a Liouville currentLm ∈ C,
and in this way we get aLiouville map
Teich(Sg) − →C
that sends m to Lm. We will soon see that this map is injective: as
promised, we have mapped both S and Teich(Sg) inside the currents
space C.
Remark 8.2.14. We constructed the Liouville currentLm by assigning
to G a diﬀerentiable atlas – hence a smooth structure – and a 2-form
deﬁned up to sign. We note that the smooth structure onG also depends
crucially on m, because the boundary extension of Theorem 5.2.1 is not
guaranteed to be a diﬀeomorphism.
The crucial feature that makes C preferable to P(RS ) as a com-
fortable ambient space for bothS and Teich(Sg) is the existence of a
nice bilinear form inC that extends both the length and the geometric
intersection of closed geodesics. We now introduce this bilinear form.
8.2.9. The projective frame bundle.We denote byI ⊂ G × G the
open subset consisting of all the pairs ofincident distinct lines inH2. We
give I the topology induced byG × G, hence I is an open topological
4-manifold. Since two distinct incident lines intersect in a single point
p ∈ H2, the set I can be interpreted as the set of triples(p, l1, l2) with
p ∈ H2 and l1, l2 two distinct vector lines in the tangent planeTpH2.
Let nowSg = H2/Γ be equipped with a hyperbolic metric. The action
of Γ on G is not properly discontinuous, but the diagonal action ofΓ on
I is, as the following shows.
Proposition 8.2.15. The map I → I /Γ is a topological covering.


## Page 241

8.2. GEODESIC CURRENTS 233
Proof. The group Γ acts freely and properly discontinuously onH2,
and hence it does soa fortiorion the triples(p, l1, l2). □
In particular I /Γ is a four-manifold, and it is naturally a bundle over
Sg, whose ﬁbre above p ∈ Sg consists of the ordered pairs of distinct
vector lines l1, l2 in TpSg. Recall that theframe bundle on a manifoldM
is a bundle whose ﬁbre abovep ∈ M is the set of allframes (i.e. basis)
in TpM. The space I /Γ can be seen as some projective quotient of the
frame bundle onSg.
8.2.10. Intersectionform. Twogeodesiccurrents α, β ∈ C = C (Sg)
induce a Γ-invariant product measureα × β on G × G and hence onI.
This measure descends via the coveringI → I /Γ to a measure onI /Γ
which we still indicate byα × β, see Section 1.5.4.
Deﬁnition 8.2.16. The intersection i(α, β) of two geodesic currents
is the total volume ofI /Γ in the measureα × β.
The intersection i(α, β) does not depend on the auxiliary hyperbolic
metric forSg. The ﬁniteness ofi(α, β) is not immediate sinceI /Γ is not
compact, and it deserves a proof.
Proposition 8.2.17. The intersection i(α, β) is ﬁnite.
Proof. Let Dbeacompactfundamentaldomainfor Sg = H2/Γ. Since
D iscompact, thelinesintersecting D formacompactsubset X ⊂ G which
has ﬁnite measuresα(X) and β(X). The projection sends(X × X) ∩ I
surjectively onto I /Γ. Therefore i(α, β) = ( α × β)(I /Γ) < α (X) ·
β(X). □
The form i is clearly bilinear and symmetric.
8.2.11. Geometric intersection and length of closed geodesics.We
now show that this abstract-looking intersection form generalises both the
geometric intersection and the length of simple closed geodesics. We
consider as usual the set S of simple closed curves as a subset ofC.
The following proposition explains why we employed the notationi for the
intersection form of two geodesic currents.
Proposition 8.2.18. If α, β ∈ S, the numberi(α, β) is the geometric
intersection of the simple closed curvesα and β.
Proof. Represent α and β as simple closed geodesics. The measure
α × β is the Dirac measure with support the pairs of incident lines inH2
that cover respectivelyα and β. The Γ-orbits of these pairs are in natural
bijection with the transverse intersection points inα∩β. Hence the volume
of I /Γ is the cardinality ofα ∩ β, except whenα = β and in this case we
get zero. □


## Page 242

234 8. SURFACE DIFFEOMORPHISMS
We note in particular thati(α, α) = 0 for every α ∈ S, hence the
set S is contained in the “light cone” consisting of all the currentsα with
i(α, α) = 0 . (Of course i(α, α) ⩾ 0 for every geodesic currentα.) We
now consider the Liouville currentLm ∈ C determined by some hyperbolic
metric m on Sg.
Proposition 8.2.19. If α ∈ S then i(Lm, α) = ℓα(m) is the length of
the geodesic representative ofα in the metricm.
Proof. Represent α as a simple closed geodesic in the metricm, of
length ℓα(m). The measure Lm × α has its support on the pairs(l , l′) of
incident lines wherel is arbitrary andl′ is a lift ofα.
Any segment s′ ⊂ l′ of length ℓα(m) in a ﬁxed liftl′ of α is a funda-
mental domain for the action ofΓ on the lifts ofα. Therefore i(Lm, α)
is the volume of the pairs(l , l′) where l′ is ﬁxed, and l is arbitrary and
intersects s′. By Proposition 8.2.12 these pairs have volumeℓα(m). □
The intersection formi on C generalises both the geometric intersec-
tion of curves and the length functions on Teichmüller space, two appar-
ently unrelated objects! As promised, we can easily deduce thatTeich(Sg)
embeds in C.
Corollary 8.2.20. The Liouville mapTeich(Sg) → C is injective.
Proof. If m ̸= m′ there is a curveγ ∈ S with ℓγ(m) ̸= ℓγ(m′) by
Proposition 7.3.4 and thusi(Lm, γ) ̸= i(Lm′ , γ). Hence Lm ̸= Lm′. □
We will since now consider bothTeich(Sg) and S as subsets of C.
We know the geometric meaning of the intersection of two curves, and of
a curve and a hyperbolic metric. What is the intersection of two hyperbolic
metrics? When they coincide, we get a positive constant.
Proposition8.2.21. If m ∈ Teich(Sg)wehave i(Lm, Lm) = −π2χ(Sg).
Proof. The metric m produces a smooth structure onG and hence
on I, and Lm is induced by aΓ-invariant 2-form onG deﬁned up to sign,
that we also denote asLm. We need to integrate the 4-formLm × Lm on
I /Γ.
Recall that I /Γ may be interpreted as a bundle overSg. We make a
ﬁrst-ordercomputationonaverysmallregionof Sg, whichwemaysuppose
to be Euclidean: a very thin rectangleR in Sg of sidesl and a with a ≪ l.
We compute the volume of the portion of bundle lying aboveR.
We integrate Lm × Lm on all the pairs of segments intersecting in
some point inR, and we consider only segments with both endpoints on
the bigl sides, neglecting the smalla sides. A segment meeting thel sides
at angle θ has length L(θ) = a/ sin θ. By Proposition 8.2.12 theLm × Lm
volume of the portion ofI above R is (at a ﬁrst order) equal to
∫ π
0
∫ l
0
1
2 sin θ · L(θ) d t d θ ∼ 1
2 l
∫ π
0
sin θ · a
sin θ = π
2 l a.


## Page 243

8.2. GEODESIC CURRENTS 235
The ﬁrst-order contribution of a small region is henceπ
2 times its area.
Since the volume is induced by a diﬀerentiable form, by taking the limit
we ﬁnd that the contribution of any region is preciselyπ
2 its area and we
conclude by the Gauss-Bonnet theorem. □
We have already noted thati is symmetric and bilinear. As we men-
tioned, there is an evident analogy between the embeddingsTeich(Sg) ↪→
C and Hn ↪→ Rn+1, since there is a bilinear form on both spacesC and
Rn+1, andTeich(Sg) is also contained in a “hyperboloid” consisting of vec-
tors v with i(v , v) = k for some ﬁxed k ̸= 0. On the other hand S is
contained in the “light cone” formed by all vectorsv with i(v , v) = 0.
We may compactify Hn by projecting the hyperboloid to the Klein
model Kn ⊂ RPn. Now Kn is an open disc, whose boundary is the image of
the light cone. We would like to apply the same compactiﬁcation strategy
to Teich(Sg). Before doing that, we need to prove a slightly technical fact:
that the bilinear formi is continuous.
8.2.12. Continuity of the intersection form.Let Sg = H2/Γ be a
closed hyperbolic surface. The following theorem is not obvious because
I is not compact: the proof relies on the fact that closed geodesics form
a discrete rigid set inC and therefore atomic points cannot “escape to
inﬁnity” on a converging sequence of currents.
Theorem 8.2.22. The form i : C × C → R is continuous.
Proof. Let β1, β2 be two currents converging to α1, α2. We need
to prove that i(β1, β2) converges to i(α1, α2). The bundle I /Γ is not
compact and we need to control that no mass escapes to inﬁnity: the
inﬁnity here is the diagonal∆ ⊂ G × G, so our aim is to cover∆ with small
boxes and prove that they contribute very little toi(β1, β2). For any box
B, we deﬁne
Ψ(B) =
(
(B × B) ∩ I
)
/Γ.
We show that for everyε > 0 there are ﬁnitely many small generic boxes
Bi whose Γ-translates cover G, such that
(β1 × β2)(∪i Ψ(Bi )) < ε
as soon asβ1, β2 are suﬃciently close toα1, α2. Since theΓ-translates of
∪i (Bi ×Bi )form an open neighbourhood of∆, the set(I /Γ)\(∪i Ψ(Bi ))is
compact with zero-measure boundary (because the boxesBi are generic)
so its contribution to i(β1, β2) tends to that to i(α1, α2) if β1, β2 are
suﬃciently close, and the theorem is proved.
It remains to construct the boxesBi. We ﬁrst ﬁx ﬁnitely many generic
boxes Bi whose Γ-translates cover G. Let K > 0 be bigger than the total
α1 and α2-mass of the boxes.
We now pick a small number0 < ε′ < ε/ 2K and subdivide each box
Bi into ﬁnitely many generic sub-boxes (which we still callBi) such that
the following holds for eachi and each j = 1, 2:


## Page 244

236 8. SURFACE DIFFEOMORPHISMS
(1) either αj (Bi ) < ε′, or
(2) thereisanatomicpoint l ∈ Bi with αj (l) > ε′ and αj (Bi \l) < ε′.
If the second case holds for bothj = 1 , 2, we also requirel ∈ Bi to be
the same line forj = 1, 2. We note that the totalα1 and α2-mass of the
boxes is still smaller thanK after the subdivision. We have
(β1 × β2)(Ψ(B)) ⩽ β1(B) · β2(B)
so if β1, β2 are suﬃciently close to α1, α2 the boxes Bi that are of the
ﬁrst kind for at least one value ofj = 1, 2 contribute toi(β1, β2) less than
2ε′K < ε.
We are left to consider the boxesBi containing a linel whose α1 and
α2-mass are both bigger thanε′. This is a potentially bad situation since
the point (l , l) ∈ G × G is atomic and contained in the frontier ofI, and
could enter inside I abruptly for some arbitrarily small perturbations of
α1 and α2. We show that this cannot happen because atomic points are
rigid, as noted in Proposition 8.2.10.
As in the proof of Proposition 8.2.10, we setBi = B = [a, b] × [c, d ]
and construct B′ = [a, a′] × [c, d ], B′′ = [b′, b] × [c, d ] whose ϕ-translates
cover B \ p where p is a pencil containingl. We note that
(β1 × β2)(Ψ(B)) ⩽ β1(B′ ⊔ B′′) · β2(B) + β2(B′ ⊔ B′′) · β1(B)
is smaller thanε′(β1(B) +β2(B)) and hence by summing on theBi we get
again a contribution smaller than2ε′K < ε. □
8.2.13. Filling geodesic currents.We now deﬁne an interesting class
of currents, whose importance will be evident in the next section.
We say that a geodesic currentα ∈ C (Sg) ﬁlls the surfaceSg = H2/Γ
if every line inH2 intersects transversely at least one line in the support of
α. For instance, a Liouville measure ﬁllsSg since its support is the whole
of G. We say that k closed geodesics γ1, . . . , γk ﬁll Sg if the geodesic
current γ1 + . . . + γk does.
Proposition 8.2.23. Let γ1, . . . , γk be closed geodesics. IfSg \ (γ1 ∪
· · · ∪ γk) consists of polygons, the curves ﬁllSg.
Proof. Every geodesic inSg intersects these curves. □
As an example, we can pick two multicurvesη and µ in Sg that in-
tersect transversely forming only polygons but no bigons. By the bigon
criterion η and µ are in minimal position and by Proposition 6.3.24 their
geodesic representatives have the same conﬁguration asη ∪ µ, so they ﬁll
Sg.
It is a bit more diﬃcult to construct a single (non-simple) closed
geodesic that ﬁllsSg. The following remark is straightforward.
Remark 8.2.24. Letα and β be currents. We havei(α, β) > 0 if and
only if there are two distinct intersecting lines in the supports ofα and β.


## Page 245

8.2. GEODESIC CURRENTS 237
Corollary 8.2.25. If α ﬁlls Sg then i(α, β) > 0 for every non-trivial
β ∈ C.
8.2.14. A compactness criterion.We now state a simple and gen-
eral compactness criterion for subsets of C that has various nice (and
apparently unrelated) geometric consequences.
Proposition 8.2.26 (Compactness criterion).If α ∈ C ﬁlls Sg, the set
of all β ∈ C with i(α, β) ⩽ M is compact, for allM > 0.
Proof. Let C ⊂ C be the set of allβ with i(α, β) ⩽ M. It is closed
because i is continuous.
Let l be a line in H2. By hypothesis there is another line l′ in the
support of α which intersects l in a point. Let B′, B be two suﬃciently
small boxes neighbourhoods ofl′, l in G, so thatB′ × B ⊂ I and B′ × B
is mapped injectively intoI /Γ. If β ∈ C we have
α(B′)β(B) = ( α × β)(B′ × B) ⩽ (α × β) (I /Γ) = i(α, β) ⩽ M.
Therefore every linel in H2 has a box neighbourhoodB such that
β(B) ⩽ Kl ∀β ∈ C
for some constantKl = M/α(B′) that depends only onl. The set C is
relatively compact by Theorem 1.3.9, and hence compact since it is closed.
The proof is complete. □
We now state some corollaries. The ﬁrst concerns the immersion of
Teich(Sg) in C.
Corollary 8.2.27. The Liouville mapTeich(Sg) ↪→ C is proper and a
homeomorphism onto its image.
Proof. We prove that the map is proper: ifmj ∈ Teich(Sg) is a di-
verging sequence of metrics, we know from Proposition 7.3.14 that there is
a closed curveγ ∈ S such thatℓγ(mj ) = i(mj , γ) → ∞ on a subsequence.
Since i is continuous, the sequencemj diverges also inC.
WedenotetheLiouvillemapby L. Weshouldnowprovethat Liscon-
tinuous, but we prefer to consider the inverse mapL−1 : L(Teich(Sg)) →
Teich(Sg). The mapL−1 is continuous becausei is andTeich(Sg) has the
weakesttopologywherethelengthfunctionsarecontinuous. Weshowthat
L−1 isproper. Let γ1, . . . , γk besimpleclosedcurvesthatﬁll Sg. If L(mi )is
a diverging sequence, by Proposition 8.2.26 we havei(L(mi ), ∑
t γt) → ∞
and hencei(L(mi ), γt) → ∞ for somet. Therefore mi is divergent also in
Teich(Sg).
Now L−1 is continuous and proper and hence a homeomorphism by
Corollary 7.3.11. □
A second immediate corollary is a general compactness criterion for
the Teichmüller space.


## Page 246

238 8. SURFACE DIFFEOMORPHISMS
Corollary 8.2.28.Let γ1, . . . , γk be some closed geodesics that ﬁllSg.
The metrics m ∈ Teich(Sg) with ℓγi (m) ⩽ M form a compact subset of
Teich(Sg), for allM > 0.
We can similarly deduce the following.
Corollary 8.2.29. Let γ1, . . . , γk be simple closed curves that ﬁllSg.
For every M there are only ﬁnitely manyα ∈ S with i(γi , α) < M for all
i.
Exercise 8.2.30. Use the compactness criterion to re-prove that on a
hyperbolic closed surface there are only ﬁnitely many closed geodesics of
bounded length.
We are ﬁnally ready to construct Thurston’s compactiﬁcation of the
Teichmüller space, using Bonahon’s geodesic currents.
8.2.15. Projective currents. As usual, we pick a hyperbolic closed
surface Sg = H2/Γ. The currents spaceC is equipped with a multiplication
by positive scalars, hence we can deﬁne its projectivisation
π : C \ 0 − →PC
where PC = ( C \ 0)/∼ with α ∼ λα for all λ > 0. We give PC the
quotient topology.
Proposition 8.2.31. The space PC is compact.
Proof. Pick an α ∈ C that ﬁlls Sg. By the compactness criterion
the set C = {β ∈ C | i(α, β) = 1 } is compact. By Corollary 8.2.25 we
have i(α, β) > 0 for all β, hence λβ ∈ C for some λ > 0. Therefore
π(C) = PC and PC is compact. □
We now want to embed bothTeich(Sg) and S in PC.
Proposition 8.2.32. The composition S → C \ 0 → PC is injective.
Proof. Let γ1, γ2 ∈ S be distinct. There is always a closed curve
η ∈ S with i(γ1, η) ̸= 0 and i(γ2, η) = 0. □
Proposition 8.2.33. The composition Teich(Sg) → C \ 0 → PC is
injective and a homeomorphism onto its image.
Proof. We see Teich(Sg) already properly embedded in C. Since
i(m, m) = −π2χ(Sg) is constant on Teich(Sg), the composition is in-
jective. The restriction π : Teich(Sg) → π(Teich(Sg)) is also continuous,
and we now prove that it is proper (note that we need to restrict the
codomain to get this).
Consider a diverging sequencemj ∈ Teich(Sg). By compactness of
PC the sequence [mj ] ∈ PC converges on a subsequence to some[α] ∈


## Page 247

8.2. GEODESIC CURRENTS 239
PC. For each j there is a λj > 0 such that λj mj → α in C. Since mj
diverges in Teich(Sg) and hence inC we get λj → 0. We get
i(α, α) = lim
j→∞
i(λj mj , λj mj ) = −π2χ(Sg) lim
j→∞
λ2
j = 0.
Inparticular [α] ̸∈ π(Teich(Sg)). Thereforetherestriction π : Teich(Sg) →
π(Teich(Sg)) is proper and hence a homeomorphism. □
We will since now consider bothS and Teich(Sg) embedded in PC.
8.2.16. Thurston’s compactiﬁcation. We now consider the closure
Teich(Sg) of Teich(Sg) inside PC. This closure is compact sincePC is,
and it is called theThurston compactiﬁcation of Teichmüller space. We
deﬁne itsboundary simply as
∂Teich(Sg) = Teich(Sg) \ Teich(Sg).
Our aim is now to identify the topology of the Thurston boundary. The
proof of Proposition 8.2.33 already shows the following.
Proposition8.2.34. TheThurstonboundaryconsistsofprojectivecur-
rents [α] with i(α, α) = 0.
We will later prove that the Thurston boundary actually consists ofall
the projective currents[α] with i(α, α) = 0. For the moment we content
ourselves with some examples.
8.2.17. Weighted pants decompositions. We construct some geo-
desic currents based on geodesic pants decompositions. We will need the
following.
Exercise 8.2.35. Let P be a hyperbolic geodesic pair-of-pants. Every
simple geodesic γ in the interior of P is open and has both ends that
converge to ∂P, winding around it.
Hint. Decompose P into two right-angled hexagons. □
Let aweighted pants decompositionfor Sg be a pants decomposition
µ = γ1 ⊔ . . . ⊔ γ3g−3 equipped with some real numbersλ1, . . . , λ3g−3 ⩾ 0.
A weighted pants decomposition deﬁnes a geodesic currentµ = λ1γ1 +
. . . + λ3g−3γ3g−3 such that i(µ, µ) = 0.
We will soon prove that[µ] lies in the Thurston boundary ifµ ̸= 0.
Wewillneedthefollowinglemmathatcharacterisesthepositivelyweighted
pants decompositions among all currents.
Lemma 8.2.36. Let µ = ∑λi γi be a weighted pants decomposition
with all positive weightsλi > 0. A current α ∈ C has i(α, µ) = 0 if and
only if α = ∑λ′
i γi for some weightsλ′
i ⩾ 0.


## Page 248

240 8. SURFACE DIFFEOMORPHISMS
Proof. If α = ∑λ′
i γi, then clearlyi(α, µ) = 0. Conversely, let α be
a current withi(α, µ) = 0. Since λi > 0, the support ofµ is the preimage
in H2 of the geodesic pants decomposition. Sincei(α, µ) = 0, the support
of α consists of lines that are either contained or disjoint from that ofµ.
By Exercise 8.2.35 a linel of the latter type has both its endpoints at
the endpoints of some line ofµ, so there are only countably many of them
overall; they are not atomic since their projection inSg is not closed and
hence have zero mass. So such linesl do not occur. The support ofα is
hence contained in that ofµ and the proof is complete. □
We now characterise simple closed curves.
Lemma 8.2.37. Let γ ∈ S be a simple closed curve andµ ∈ C be a
non-trivial current. If i(γ, α) = 0 implies i(µ, α) = 0 for all α ∈ S, then
we have[µ] = [ γ].
Proof. Extend γ = γ1 to a geodesic pants decompositionβ = ∑
i γi.
The previous lemma implies thatµ = ∑
i λi γi and by letting the pants
decomposition vary we getµ = λ1γ1. □
8.2.18. Pinching and twisting.How can we construct sequences of
hyperbolic metrics onSg that converge to some point at inﬁnity? We can
do this quite easily bypinching a simple geodesic, or bytwisting along it.
Todeﬁnetheformer, weneedtoﬁxsomeFenchel–Nielsencoordinates
(li , θi ) for Teich(Sg) based on a pants decompositionµ = γ1 ⊔ . . . ⊔ γ3g−3.
Fix a metric(li , θi ) ∈ Teich(Sg). Apinching along γ = γ1 is any sequence
of metrics where the ﬁrst length coordinatel1 tends to zero and all the
other coordinates are kept bounded (from above and below).
Proposition 8.2.38. The limit of a pinching is[γ].
Proof. By the Collar Lemma 7.3.7, the length of a closed geodesicα
in the pinched metrics tends to inﬁnity ifi(γ, α) > 0 and stays bounded
if i(γ, α) = 0 . Therefore the pinched metrics tend inPC to a class [µ]
such that i(γ, α) = 0 ⇒ i(µ, α) = 0 for all α ∈ S. Lemma 8.2.37 gives
[µ] = [ γ]. □
Let m ∈ Teich(Sg) be any metric andγ be a simple closed geodesic.
We denoted bymγ
θ the metric obtained fromm via an earthquake of angle
θ along γ, see Section 7.2.1.
Proposition 8.2.39. The limit ofmγ
θ as θ → ±∞ is [γ].
Proof. By Proposition 7.2.10 the length of a closed geodesicα tends
to inﬁnity if i(γ, α) > 0 and is constant ifi(γ, α) = 0 . We conclude as
above that the metrics tend to[γ]. □
To appreciate the qualitative diﬀerence between pinching and twisting
along γ, recall the explicit torus case from Section 7.2.4: if we pinch along


## Page 249

8.3. LAMINATIONS 241
γ, the sequence of metrics converge to[γ] ∈ ∂H2 roughly like a geodesic
pointing to [γ], while if we twist alongγ it does so along a horosphere
centred at [γ].
We have discovered in particular that the setS is entirely contained
in Thurston’s boundary. To fully identify the Thurston boundary, we now
analyse the geodesic currentsα lying in the “light cone”, that is those with
i(α, α) = 0 . We already know that the weighted pants decompositions
are there, but there is more: we will soon see that the light cone contains
many new fascinating objects calledlaminations.
8.3. Laminations
In this section we characterize geometrically the currentsα ∈ C con-
tained in the “light cone,”i.e. those with i(α, α) = 0. Every such current
may be represented as ameasured geodesic lamination, a closed subset of
Sg foliated by geodesics and equipped with a transverse measure. These
unexpected objects play an important part in the topology of manifolds of
dimension two and three.
8.3.1. Geodesic laminations. Let S = H2/Γ be a hyperbolic surface.
Recall that in this chapter we consider geodesics only as subsets ofS,
neglecting their parametrisation.
A geodesic laminationλ is a set of disjoint simple complete geodesics
in S, whose union is a closed subset ofS. Each geodesic may be closed
or open and is called aleaf; their union is thesupport of λ. We will often
confuse λ with its support for simplicity, since the support determines the
set of geodesics in all the interesting cases (see below).
The following examples of geodesic laminations are fundamental:
• ageodesicmulticurve(thatisaﬁnitesetofdisjointsimpleclosed
geodesics) in S;
• a set of disjoint lines inH2 whose union is closed.
A lamination in H2 may be particularly complicated, see Figure 8.4.
Recallthat G = G (H2)isthesetofalllinesin H2, withitsnaturaltopology.
Exercise 8.3.1. A setλ of disjoint lines inH2 forms a closed set inH2
if and only ifλ is closed when considered as a subset ofG.
If a set of disjoint lines inH2 is not closed, it suﬃces to take its closure
to get a lamination. Every lamination inS = H2/Γ lifts to a Γ-invariant
lamination in H2, hence the laminations inS are in natural bijection with
the Γ-invariant laminations inH2.
8.3.2. Local behaviour. A geodesic lamination is often too compli-
cated to be determined with full precision. In fact, its topology is already
quite involved, and we now start by examining it locally. Letλ be a geo-
desic lamination on a hyperbolic surfaceS = H2/Γ. The following exercise
may be proved by passing to the universal coverH2.


## Page 250

242 8. SURFACE DIFFEOMORPHISMS
Figure 8.4. A geodesic lamination inH2.
Exercise 8.3.2. Every pointp ∈ λ has an open neighbourhoodU and a
chart U → (−1, 1)×(−1, 1) that sendsp to (0, 0) and λ∩U to (−1, 1)×J
for some closed subsetJ ⊂ (0, 1).
What kind ofJ ⊂ (0, 1) may arise? It is possible to construct some
laminations in H2 or in some simple hyperbolic surfaces like cusps and
tubes, where their support is the whole manifold. In this caseJ is the full
interval (0, 1). These cases are however of no interest for us, because of
the following.
Proposition 8.3.3. If S has ﬁnite volume, thenJ has empty interior.
Proof. Suppose by contradiction thatJ contains some open interval.
This open interval determines a set of leaves ofλ, whose lift inH2 forms
an open subsetU ⊂ H2 foliated into lines. Its limit in∂H2 has non-empty
interior S. By Corollary 5.1.14 there is a hyperbolic transformationγ ∈ Γ
with an attracting limit point inS. This implies easily that there areγ-
translates of some lines inU that intersect some lines ofU transversely, a
contradiction. □
Corollary 8.3.4.If S has ﬁnite volume, every geodesic laminationλ in
S has empty interior and is determined by its support.
8.3.3. Complementary regions. Let λ ⊂ S be a geodesic lamination
in a hyperbolic surface S = H2/Γ. A complementary region (shortly, a
region) is a connected component of the open complementS \ λ. The
abstract completion of a complementary region is a hyperbolic surface with
non-empty geodesic boundary consisting of lines and/or circles.
In general, a complementary region may have genus and/or inﬁnitely
many boundary components. Note that in any case there are at most
countably many regions, and hence only countably many leaves ofλ may
be incident to a region: ifλ has uncountably many leaves (this will be the


## Page 251

8.3. LAMINATIONS 243
typical case), most leaves are not incident to any region (compare this with
the Cantor subset in[0, 1], which contains uncountably many points, but
only countably many of them are adjacent to some complementary open
segment).
Proposition8.3.5. Ageodesiclamination λ ⊂ Sg inaclosedhyperbolic
surface Sg = H2/Γ has at most 4g − 4 complementary regions. The
boundary of each region has ﬁnitely many components.
Proof. Every complementary region has area at leastπ (the area of
an ideal triangle) and a region with inﬁnitely many boundary components
has inﬁnite area. By Gauss-Bonnet we get Area(Sg) = −2πχ(Sg) =
(4g − 4)π. □
A lamination λ ⊂ Sg is full if every region is an ideal polygon.
8.3.4. Transverse measures.Let λ ⊂ S be a geodesic lamination in
a hyperbolic surface S. A transverse arc to λ is the support of a simple
regular curve α: [ a, b] → S transverse to each leaf ofλ, whose endpoints
α(a) and α(b) are not contained inλ.
Deﬁnition 8.3.6. A transverse measure for a lamination λ ⊂ S is a
locally ﬁnite Borel measureLα on each transverse arcα such that:
(1) if α′ ⊂ α is a sub-arc ofα, the measureLα′ is the restriction of
Lα;
(2) the support ofLα is α ∩ λ;
(3) the measure is invariant through isotopies of transverse arcs.
In particular every arcα transverse to λ has a ﬁnitelength, deﬁned
as the total measure of the arc. The arc has length zero if and only if
α ∩ λ = ∅. A measured geodesic lamination is a geodesic lamination
equipped with a transverse measure.
Example 8.3.7. A geodesic multicurveλ ⊂ S has a natural transverse
measure: for any transverse arcα, the measureLα on α is just the Dirac
measure supported on the ﬁnite setα ∩ λ.
More generally, we may assign a positive weightai > 0 at each com-
ponent λi of λ and deﬁne a measured geodesic lamination by giving the
weight ai at each intersectionα ∩ γi. By varying weights we get distinct
measured geodesic laminations with the same support.
8.3.5. Currentsandmeasuredgeodesiclaminations. Let Sg = H2/Γ
be a closed hyperbolic surface. We now construct a natural bijection be-
tween the measured geodesic laminations onSg and the geodesic currents
λ with i(λ, λ) = 0, i.e. those lying in the “light cone.” We see a measured
geodesic lamination in Sg as a Γ-invariant measured geodesic lamination
in H2.
Let λ ∈ C be a geodesic current withi(λ, λ) = 0. By Remark 8.2.24
the support of λ is a closed Γ-invariant subset of G formed by disjoint


## Page 252

244 8. SURFACE DIFFEOMORPHISMS
lines, hence aΓ-invariant lamination inH2. The geodesic current induces
also a transverse measure as follows. Letα be an arc transverse to the
lamination λ. Up to cuttingα in ﬁnitely many arcs we may suppose that it
intersects each leaf ofλ in at most one point. We deﬁne the measure of a
Borel setU ⊂ α as the λ-measure in G of the lines inλ that it intersects.
Exercise 8.3.8. This transverse measure satisﬁes the axioms of Deﬁ-
nition 8.3.6 and givesλ the structure of aΓ-invariant measured geodesic
lamination.
Proposition 8.3.9. We have just deﬁned a bijection
{
currents λ with i(λ, λ) = 0
}
← →
{
measured geodesic laminations in Sg
}
Proof. We deﬁne the inverse map by transforming aΓ-invariant mea-
sured geodesic laminationλ into a geodesic current with supportλ ⊂ G
as follows. For every leaf l of λ, we pick a small transverse arcα that
intersects all the leaves in a neighbourhoodUl of l in λ, each once. The
measure on α translates into a measure onUl, and all the measures on
these small setsUl match to yield a measure onλ thanks to Proposition
1.3.4. □
We denote by M L ⊂ C the set of all the measured geodesic lam-
inations on Sg, henceforth identiﬁed with the currents lying in the “light
cone”. With this identiﬁcationM L is independent of the auxiliary hyper-
bolic metric onSg.
Recall that a multicurve onSg is a ﬁnite collection of disjoint non-
trivial simple closed curves. A multicurve determines a measured geodesic
lamination: consider n parallel components as a single one with weight
n, take the geodesic representative of the resulting essential multicurve
(keeping the same weights), and use Example 8.3.7. We obtain the inclu-
sions
S ⊂ M ⊂ M L ⊂ C
where S and M are the simple closed curves and multicurves inSg.
8.3.6. Some properties. We can now use our knowledge on the geo-
desic currents to get some information about the measured geodesic lam-
inations.
Proposition 8.3.10. Let λ ⊂ Sg be a measured geodesic lamination.
For every p ∈ ∂H2, there are at most two lines in the preimage˜λ ⊂ H2
incident to p, and if there are two, none of them projects to a closed
geodesic in λ.
Proof. If there are at least three linesl1, l2, l3 incident to p, with l2
lying strictly betweenl1 and l3, we may ﬁnd a small arcα transverse to ˜λ,
whose support lies betweenl1 and l3, that intersectsl2 and possibly other
lines incident to p, and no other line of˜λ (use Proposition 8.3.3 nearl2
here). The lines intersected by α form a pencil with positive mass. By


## Page 253

8.3. LAMINATIONS 245
Proposition8.2.8thepencilconsistsofasingleline, theaxisofahyperbolic
element ϕ ∈ Γ.
On the other hand, ifp is the endpoint of the axis of someϕ, then no
other leaf l ⊂ ˜λ can be incident top, otherwise inﬁnitely many linesϕi (l)
would also be, and the same argument above would give a contradiction.
□
Exercise 8.3.11. There are some geodesic laminations inSg that do
not support any transverse measure.
Hint. Construct a geodesic lamination λ ⊂ Sg consisting of some
disjointsimpleclosedcurvesandﬁnitelymanyopenleavesthatwindaround
them (see Section 7.4.5). The pre-image˜λ ⊂ H2 contradicts Proposition
8.3.10. □
8.3.7. Intersection form. What is the geometric meaning of the in-
tersection form i of two geodesic currents, when applied to a measured
geodesic lamination? Letλ be a measured geodesic lamination in a hyper-
bolic closed surfaceSg = H2/Γ. Three cases are relevant for us:
(1) If γ is a simple closed geodesic, then eitherγ is contained in
λ, and we geti(γ, λ) = 0, or γ is disjoint fromλ, and we still
get i(γ, λ) = 0, orγ is transverse toλ, and in that casei(λ, γ)
equals the full measureL(γ) of γ as a transverse curve toλ.
(2) If λ′ is another measured geodesic lamination, then i(λ, λ′)
“counts” the (possibly inﬁnitely many) transverse intersections
of λ and λ′ with respect to the product of the two transverse
measures.
(3) If m is a hyperbolic metric, theni(λ, m) measures the “length”
of λ with respect tom, that is the integral overλ of the usual
length weighted with the transverse measure.
We now consider a non-geodesic non-trivial simple closed curve γ
transverse toλ, and we denote byL(γ) its full transverseλ-measure. The
quantities L(γ) and i(γ, λ) need not to be equal in this case (becauseγ
is not geodesic), but this phenomenon is easily controlled by a suitable
version of the bigon criterion.
Proposition 8.3.12. We have L(γ) ⩾ i(γ, λ) and the equality holds
⇐ ⇒γ forms no bigon with any leaf ofλ.
Proof. We follow the proof of Theorem 6.3.10. Let˜λ be the coun-
terimage of λ in H2. A lift ˜γ of γ has distinct endpoints in∂H2 and ˜γ
must intersect the leaves of˜λ whose endpoints are linked with them. The
curve ˜γ intersects each such leaf only once and no other leaf⇔ ˜γ forms
no bigon with any leaf of˜λ ⇔ γ forms no bigon with any leaf ofλ. □
Proposition 8.3.13. If λ ∈ M L is full, we havei(λ, α) > 0 for every
current α that is not a measured sublamination ofλ.


## Page 254

246 8. SURFACE DIFFEOMORPHISMS
(1)
(2)
Figure 8.5. A switch containsa ⩾ 1 and b ⩾ 1 branches on
each side: here a = 3 and b = 2 (1). The complementary
regions of a train track contain no discs, annuli, monogons,
or bigons (2).
Figure 8.6. A train track on the genus-three surfaceS3.
Proof. If i(λ, α) = 0 then every linel in the support ofα is either a
leaf of λ or an inﬁnite diagonal in some complementary ideal polygon; a
diagonal would be an atomic point inα that would cover a closed geodesic
and could be added toλ contradicting Proposition 8.3.10. □
8.3.8. Train tracks. How can one construct a measured geodesic
lamination, concretely? There are some nice combinatorial tools designed
to this purpose, called train tracks.
A train trackin a closed surfaceSg is a closed subsetτ ⊂ Sg built by
taking a ﬁnite set of points (calledvertices or switches) and joining them
with disjoint arcs called branches. We require that every switch looks
locally like Figure 8.5-(1): all branches have the same tangent line, and
there is at least one branch at each side.
The complementary regions of τ are the abstract closures of the
connected components ofSg \τ. Each complementary region is naturally a
compact surface with ﬁnitely many singular vertices in its boundary having


## Page 255

8.3. LAMINATIONS 247
“zero interior angle”. In the deﬁnition of a train track, we also require that
no complementary region be a disc, an annulus, a monogon, or a bigon, as
in Figure 8.5. An example is shown in Figure 8.6. The exclusion of these
complementary regions is essential to get the following.
Exercise 8.3.14. A train track contains at most−6χ(Sg) switches
and at most −2χ(Sg) regions; it contains −6χ(Sg) switches if and only
if every switch is trivalent and every complementary region is a triangle.
The sphere and the torus contain no train track.
Hint. Make the appropriate Euler characteristic computation. □
Exercise8.3.15. Constructatraintrackwith −2χ(Sg)triangularcom-
plementary regions inSg for every g ⩾ 2.
Hint. Take a pants decomposition and add three arcs (tangent to the
boundary) inside each pants to cut it into two triangular regions. □
We obtain a ﬁniteness property.
Corollary 8.3.16. There are only ﬁnitely many train tracksτ in Sg up
to diﬀeomorphism (but not up to isotopy!).
Proof. Thereareonlyﬁnitelymanycombinatorialtypesfor τ, itscom-
plementary regions, and the way they are adjacent. □
8.3.9. Weight systems. A weight system on a train track τ ⊂ Sg
is the assignment of a non-negative real number, calledweight, to each
branch of τ, such that at every vertex theswitch condition holds: the
sum of the weights on the left branches should be equal to the sum of the
weights on the right branches.
Let w be an integral weight system, that is one whose weights are
all integers. The integral weight systemw determines a closed 1-manifold
in Sg as follows: replace every branch with weighta with a parallel copies
of it, and pair all the branches at every switch in the obvious way (this is
possible thanks to the switch condition).
Proposition 8.3.17. The resulting closed 1-manifold is a multicurve.
Proof. Since no complementary region ofτ is a disc or monogon, the
complementary regions of the closed 1-manifold have non-positive Euler
characteristic (exercise). □
Our aim now is to use the train tracks to parametrise all the mul-
ticurves in Sg. Later on, we will extend everything from multicurves to
measured geodesic laminations.


## Page 256

248 8. SURFACE DIFFEOMORPHISMS
Figure 8.7. Decompose S into pairs of pants and annuli, so
that each simple closed curve separates a pair of pants from
an annulus. We mark a blue point in each curve.
Figure 8.8. Identify each pair of pants and annulus with one
of these two ﬁxed models.
8.3.10. Aparametrisationfor M. Let Sg havegenus g ⩾ 2. Wenow
construct ﬁnitely many train tracks that parametrise all the multicurves in
Sg, and to this purpose we ﬁx a frame similar to the one used in the
Fenchel-Nielsen parametrisation of the Teichmüller space.
We decompose Sg into pairs of pants and annuli as in Figure 8.7.
We mark (in blue) an arbitrary point in each closed curve and we also ﬁx
once for all a diﬀeomorphism (preserving orientation and marked points)
between each pair of pants and annulus with the corresponding model in
Figure 8.8. The resulting parametrisation ofM will depend also on these
ﬁxed diﬀeomorphisms.
Let acolouring be the assignment of a tripleai , bi , ci of non-negative
numbers to each annulus of the decomposition, such that one of the fol-
lowing equalities holds:
ai = bi + ci , b i = ci + ai , c i = ai + bi .
We assign the colourai to each of the two curves that bound the annulus.
Since there are − 3
2 χ(Sg) = 3 g − 3 annuli, we get − 9
2 χ(Sg) = 9 g − 9
colours overall. The colouring isintegral if the colours are integers and
also the following holds: for each pair of pants, the sumai + aj + ak of the
colours of its boundary curves must be even.
We now transform each colouring into a weighted train trackτ as
follows. The boundary components of each pair-of-pantsP are coloured
by some tripleai , aj , ak. We insert inP a portion of train track as in Figure
8.9: its shape depends on the position of the point[ai , aj , ak] in RP2 and


## Page 257

8.3. LAMINATIONS 249
[1,0,0]
[0,1,0] [0,0,1]
[1,1,0] [1,0,1]
[0,1,1]
ak
aj
a -i j aka -
ai aj ak   -j+ ak ai aj   -+
aj ak ai   -+
2 2
2
2
aia -k aja -i
2
aiaj
ai
aiak
a -j aia -k
2
Figure 8.9. The portion of weighted train track in a pair of
pants P is determined by the pointQ = [ ai , aj , ak ]∈ RP2.
Having non-negative entries, the pointQ is contained in the
triangle with vertices [1, 0, 0], [0, 1, 0], [0, 0, 1]. This trian-
gle subdivides into four sub-triangles by adding the vertices
[0, 1, 1], [1, 0, 1], [1, 1, 0] and the shape of the train track
depends on which sub-triangle containsQ. The three edges
of the train track are given the weights indicated in the ﬁg-
ure: these are the only weights that sum toai , aj , ak at the
boundaries. When Q lies in the frontier of two or more tri-
angles some branch has weight zero and we delete it: the
diﬀerent shapes prescribed by the adjacent triangles coincide
after deleting this branch.
its weights depend linearly onai , aj , ak. Note that there are ﬁnitely many
possible shapes overall.
We extend the train track inside each annulusAcoloured withai , bi , ci
as shown in Figure 8.10. Again, the shape of the portion depends on the
position of[ai , bi , ci ]in RP2. As a result we get a train trackτ with integral
weights and hence a multicurve.
Proposition 8.3.18. The construction produces a bijection
{
integral colourings
}
← →M .


## Page 258

250 8. SURFACE DIFFEOMORPHISMS
Figure 8.10. The portion of weighted train track in each
annulus A is determined by the point Q = [ a, b, c] =
[ai , bi , ci ]∈ RP2. By hypothesisQ is contained in the bound-
aryofthetrianglewithvertices [1, 0, 0], [0, 1, 0], [0, 0, 1]. The
boundarysubdividesintothreesegmentsandtheshapeofthe
train track depends on which segment containsQ. When Q
is a vertex some branch has weight zero and we delete it.
Proof. We start by proving surjectivity. Given a multicurveµ ∈ M,
we minimise its intersections with our decomposition into pants and annuli:
now µ intersects every pair of pantsP into non-trivial simple closed curves
and arcs (an arc is trivial if it forms a bigon with∂P).
By decomposing P into two hexagons, and minimising the intersec-
tions of the curves and arcs with them, one deduces easily thatP contains
only three isotopy classes of non-trivial closed curves (one parallel to each
component of∂P) and six isotopy classes of non-trivial arcs (one connect-
ing every pair of components of∂P). Note that isotopies arenot required
to ﬁx ∂P pointwise.
We isotope all the closed curves away fromP and place them inside
the adjacent annuli, so there are only arcs. As above, we check easily
that the isotopy class of the whole set of arcs inP is determined by the
intersection numbers ai , aj , ak with the components of ∂P and is hence
represented by the corresponding train track portion from Figure 8.9.
We now turn to annuli. On each annulusA, there is only one isotopy
class of non-trivial arcs and one isotopy class of non-trivial closed curves.
However, an arc may wind many times aroundA and we are not allowed
to use isotopies that move∂A anymore because the conﬁguration inP is


## Page 259

8.3. LAMINATIONS 251
a
b
c a
b
c{
{
{
(1) (2) (3)
a
{
Figure8.11. Howtoconstructalaminationfromaweighted
train track. Here we have a switch with weightsa, b, c (1)
and the switch conditiona = b + c allows all the Euclidean
rectangles (2) to glue (3).
already ﬁxed: one deduces easily that the triples(a, b, c) from Figure 8.10
describe precisely all the possible conﬁgurations.
The injectivity is surprisingly simple to prove: the conﬁguration ofµ
that minimises its intersections with the decomposition into pairs of pants
and annuli is unique thanks to Proposition 6.3.24 and hence the numbers
ai , bi , ci are easily determined byµ. The proof is complete. □
We have found a complete combinatorial parametrisation for the set
M, and we now want to extend it toM L.
8.3.11. Topological laminations. A train trackτ in Sg with integer
weights parametrises a multicurve. We now show that, more generally, a
weighted train track parametrises a measured geodesic lamination.
The construction goes as follows. First, we remove all the branches
with zero weight, and we replace every branch of weighta > 0 with a
Euclidean rectangle of widtha and with arbitrary length as in Figure 8.11-
(2). Thanks to the switch conditions, these rectangles glue nicely at each
switch as in Figure 8.11-(3).
In Figure 8.11-(3) we see that all the lines from left- and right-
rectangles are matched in a 1-1 correspondence, with a ﬁnite number of
exceptions. At each exception, somem ⩾ 1 left-lines are matched to some
n ⩾ 1 right-lines at some point, and we havem + n = 3 or 4. We call
these lines and pointssingular.
After gluing the rectangles we get a closed subsetλ of Sg foliated by
lines, with ﬁnitely many singular points and lines. We now eliminate the
singular points and lines by cuttingλ carefully along them: ifm + n = 4
this amounts simply to doubling the singular point; ifm + n = 3 we double
the singular leaf by opening a small open corridor in the foliation, starting
from the singular point and digging along the leaf. Since the singular leaf
may be non-compact, for the process to converge inSg we need to shrink
the width of the corridor suﬃciently fast.
After this cut we get a closed subset ofSg, which we still nameλ,
nicely partitioned into disjoint lines that may be either open or closed:


## Page 260

252 8. SURFACE DIFFEOMORPHISMS
Figure 8.12. The decomposition into pants and annuli ofSg
is homotopic to a geodesic pants decomposition (with each
curve counted twice) whose counterimage inH2 consists of
inﬁnitely many disjoint ultraparallel lines as in the picture.
We show that the lift of a leafl of λ in H2 has two distinct
endpoints in ∂H2: if l is a closed curve in an annulus A,
then it is isotopic to a closed geodesic and we are done; ifl
intersects annuli and pairs of pants into non-trivial arcs, its
lift intersects the ultraparallel lines forming no bigons, hence
it intersects each line at most once: therefore it has disjoint
limits at±∞ (left). The straightening replaces the lift with
the unique line with these endpoints (right).
we call it atopological lamination. After the cut every rectangle of type
L × [0, a] as in Figure 8.11 transforms into a setL × J where J is obtained
by cutting[0, a] along (at most) countably many points. Note thatJ may
be a Cantor set.
The set J inherits from [0, a] a Borel measure with total mass a.
This measure gives a transverse measure to the leaves of the rectangle
L × J, and λ inherits the structure of a measured topological lamination
(the notion of a transverse measure is exactly the same as in the geodesic
case).
It only remains to promote the topological lamination to a geodesic
lamination: thisisusuallydoneby straightening itsleaves. Wedescribethis
procedure only for a particular class of train tracks: the ones introduced
in the previous section to parametriseM.
8.3.12. A parametrisation forM L. We now extend the arguments
of Section 8.3.10 from multicurves to laminations.
We ﬁx a decomposition ofSg into pants and annuli. Every colouring
(ai , bi , ci ) produces a weighted train track, which in turn parametrises a
measured topological lamination λ. We ﬁx a hyperbolic structure Sg =
H2/Γ.
The laminationλ can bestraightened to a measured geodesic lamina-
tion ¯λ as follows. A leafl of λ is either a closed curve in some annulusA,
or it intersects every annulusA and pair of pantsP in non-trivial arcs: in


## Page 261

8.3. LAMINATIONS 253
both cases, every lift ofl in H2 is a curve with two distinct limit endpoints
in ∂H2, see Figure 8.12. We replace every lift ofl with the unique line
having these endpoints, and we do this for every leafl of λ.
The result is aΓ-invariant closed set of disjoint lines inH2 that project
to a geodesic lamination ¯λ in Sg. The transverse measure on λ easily
induces one on the straightened¯λ: it suﬃces to consider transverse arcs
contained in the decomposition into pairs of pants and annuli. Note that
some parallel closed leaves ofλ may have collapsed to a single atom closed
geodesic in ¯λ.
Proposition 8.3.19. The construction induces a bijection
{
colourings
}
← →M L.
Proof. We adapt the proof of Proposition 8.3.18, starting with sur-
jectivity: given a measured geodesic laminationλ, we determine a colour
(ai , bi , ci ) representing it.
The decomposition into pairs of pants and annuli is homotopic to a
geodesicpantsdecomposition µ = γ1⊔. . .⊔γ3g−3 (witheachcurvecounted
twice). We setai = i(γi , λ).
The measured geodesic lamination λ ∈ M L decomposes as λ =
λ0 ⊔λ1 where λ0 = ∑
i ki γi is a weighted pants decomposition with support
in µ and λ1 is transverse toµ. If ki ̸= 0 then necessarily ai = 0 and we
set bi = ci = ki.
At every pair of pantsP the three coloursai , aj , ak determine a portion
of weighted train track as prescribed by Figure 8.9. The intersectionλ1 ∩P
consistsofgeodesicandhencenon-trivialarcs: thereforetheweightedtrain
track describes faithfully this portion of measured geodesic lamination, up
to isotopy. The numbersbi and ci are then determined by the way these
two portions wind and match alongγi. The colours(ai , bi , ci ) parametrise
λ.
The choices of the colours(ai , bi , ci ) were forced by the intersection
of λ with the two pantsP adjacent toγi (exercise). This shows injectivity.
□
We have parametrisedM L, and we now investigate its topology. The
spaceofallcolourings (ai , bi , ci )formsthesubset C×. . .×C ⊂ R3×. . .×R3
where C ⊂ R3 is the cone based on the origin over the sides of the triangle
with vertices (1, 1, 0), (0, 1, 1), and (1, 0, 1), and is homeomorphic toR2.
The space of colourings is homeomorphic toR2·(3g−3) = R6g−6, that is to
the Teichmüller space itself!
The parametrisation identiﬁes M L with C × . . . × C. We want to
show that this identiﬁcation is a homeomorphism, and to this purpose we
study the intersection form.


## Page 262

254 8. SURFACE DIFFEOMORPHISMS
gg
Figure 8.13. A monotonic curveγ intersects the products
L× J in monotonic paths (left) and forms no bigons outside
the products (right).
8.3.13. Intersection form. We now show that the intersection form
i between curves and laminations has a surprisingly simple behaviour after
that we parametrise the spaceM L as C × . . . × C.
We note thatC × . . . × C is a piecewise-linear object inR9g−9, that
is it is the support of a simplicial complex. Recall that a continuous map
between simplicial complexes issimplicial if it sends each simplex onto a
simplex in an aﬃne linear way, and it ispiecewise linear if it restricts to
a simplicial map on some subdivisions. Finally, the map ishalf-integral
piecewise linear if all the aﬃne linear maps have half-integer (possibly
integer) coeﬃcients.
Proposition 8.3.20. For everyγ ∈ S the map
C × . . . × C → R
λ ↦− →i(γ, λ)
is half-integral piecewise linear.
Proof. A colour(ai , bi , ci ) ∈ C ×. . .×C deﬁnes a weighted train track
τ and hence a measured topological laminationλ, obtained by substituting
every edge ofτ with some productL × J of horizontal leaves. Thanks to
Proposition 8.3.12 the intersectioni(γ, λ) is realized by some representa-
tive γ which is either a leaf ofλ or is transverse toλ and forms no bigon
with any leaf ofλ.
We say that a closed curve transverse toλ is monotonic if
(1) it intersects every productL × J into arcs that are monotonic in
both coordinates, and the same monotonicity is preserved when
the curve goes from one productL × J to an adjacent one as in
Figure 8.13-(left);
(2) it makes no bigons outside the rectangles as in Figure 8.13-
(right).
Concerning (1), a horizontal path inL × J disjoint from λ is allowed,
but it must keep being horizontal on the adjacent products.


## Page 263

8.3. LAMINATIONS 255
Figure 8.14. If a monotonic curveγ forms a bigon with a
leaf α, by cutting carefullyτ along γ we construct a portion
of train track on this bigon containingα and with truncated
edges exiting orthogonally fromγ (left). We then simplify
the triangles adjacent toγ (right).
A simple closed curve that forms no bigons with any leaf ofλ can
be easily isotoped to be monotonic. Conversely, we now prove that a
monotonic curveγ forms no bigons with any leaf ofλ. If it did, by cutting
τ along γ we would get an abstract bigon with a portion of train track as
in Figure 8.14-(left). Ifγ is adjacent to some triangles as in Figure 8.14-
(right) we close them as shown there. Finally, by doubling the bigon along
γ we get a train track on a disc, and by doubling again we build a train
trackinasphere, whichisabsurd(onecheckseasilythatnocomplementary
region is a disc, annulus, monogon, or bigon: there are no bigons because
we have closed the triangles as in Figure 8.14-(right)).
The λ-transversal length L(γ) of a monotonic γ is the sum of the
lengths of the sub-paths intersecting sequences of productsL × J as in
Figure 8.13-(left). One checks easily that the length of each sub-path
is a half-integer linear combination of the colours(ai , bi , ci ). Therefore
L(γ) = i(γ, λ) is a half-integer combination of the colours.
If we vary the colouring(ai , bi , ci ) a little, the curve γ keeps being
monotonic in the same way as before, except when a portion ofγ is hor-
izontal: in that case the new monotonicity depends on how the colouring
varies. In all cases, the newγ is still monotonic, hence bigonless, hence
L(γ) = i(γ, λ) again.
If there are no horizontal portions inγ, the length L(γ) varies lin-
early with the same integral formula found above. If there are horizontal
portions, then the colour lies in a hyperplane ofR9g−9, and there are two
diﬀerent linear formulas joining there. Hencei(γ, λ) is half-integral piece-
wise linear. □
The map λ ↦→ i(γ, λ) is also obviously homogeneous, in the sense
that i(γ, tλ) = ti (γ, λ) for all t ⩾ 0.


## Page 264

256 8. SURFACE DIFFEOMORPHISMS
The proof of Proposition 8.3.20 contains a recipe for calculating
i(γ, λ). It suﬃces to putγ in monotonic position and then add the contri-
butions of each monotonic arc. For instance, thei-th curveγi of the pants
decomposition has an obvious monotone position givingi(γi , λ) = ai.
The coloursbi and ci do not have such an immediate description, but
the following holds anyway.
Exercise 8.3.21. There exist ﬁnitely many simple closed curves γj
whose intersectionsi(λ, γj )determine the colouring(ai , bi , ci )representing
λ in a half-integral piecewise-linear continuous fashion.
Hint. Choose some additional curves as in Proposition 7.3.4 and com-
pute their intersections withλ. □
8.3.14. TheThurstonboundary. Wecanﬁnallydeterminethetopol-
ogy of the measured geodesic laminations spaceM L and of the Thurston
boundary of the Teichmüller space.
Proposition 8.3.22. The colouring parametrisation induces a homeo-
morphism M L ∼= R6g−6.
Proof. Themap M L → C×. . .×C ∼= R6g−6 iscontinuousbyExercise
8.3.21. Itisproper: ifthecolours (ai , bi , ci )staybounded,theintersections
i(λ, γi ) with ﬁnitely many ﬁlling curves γi stay bounded, and hence λ
moves in a compact set by Proposition 8.2.26. The continuous map is a
homeomorphism by Proposition 7.3.11. □
Letnow PM L ⊂ PC bethesetofall projectivemeasuredlaminations ,
that is the image ofM L \ 0 in PC. The setPM L contains the projective
simple closed curvesPS and the projective multicurvesPM.
Theorem 8.3.23. The following homeomorphism holds
∂Teich(Sg) = PM L ∼= S6g−7.
The set PS is dense inPM L.
Proof. The homeomorphism M L ∼= R6g−6 induces PM L ∼= S6g−7.
Concerning the Thurston boundary, we know from Section 8.2.18 and
Proposition 8.2.34 that
PS ⊂ ∂Teich(Sg) ⊂ PM L.
We now show thatPS is dense inPM L, and this concludes the proof.
First, we prove thatPM is dense inPM L. Rational colours(ai , bi , ci )
form a dense subset ofC × . . .× C and project to a dense subset ofPM L.
Every rational colour is a multiple of an integer colour, which represents a
multicurve.
Second, we prove thatPS is dense in PM. Let µ be a multicurve
in Sg. Up to acting viaMCG(Sg) we may suppose thatµ is supported on
the pants decompositionγ1, . . . , γ3g−3 used to deﬁneC × . . . × C, hence


## Page 265

8.3. LAMINATIONS 257
µ is deﬁned by some integral colour(ai , bi , ci ) = (0 , bi , bi ). Now pick any
simple closed curveγ with a′
i = i(γ, γi ) > 0 for all i, represented by some
colours (a′
i , b′
i , c′
i ). By Dehn twistingγ along the γi we vary the pairb′
i , c′
i
as we please, and by twisting at the correct rates we construct a sequence
of simple closed curves that converge projectively to[µ]. □
The mapping class groupMCG(Sg) acts naturally on the whole setC
of currents and in particular it acts by homeomorphisms on∂Teich(Sg).
The identiﬁcation of∂Teich(Sg) = PM L with the projectivisation of
C×. . .×C isofcoursenotcanonicalbecauseitdependsonadecomposition
of Sg into pairs of pants and annuli. However, Proposition 8.3.20 and
Exercise 8.3.21 imply that any two diﬀerent identiﬁcations diﬀer by some
projective integral piecewise-linear homeomorphisms, hence the Thurston
boundary has a naturalprojective integral piecewise linearstructure, called
PIP for short, which is preserved byMCG(Sg). In particularPM Lcontains
some natural rational points, and these arePM.
8.3.15. A projection.The reader has probably noted that the coordi-
natesthatyieldthehomeomorphisms Teich(Sg) ∼= R6g−6 and ∂Teich(Sg) ∼=
S6g−7 are quite similar: they both depend on a pants decompositionµ plus
some additional marking, and every curve of the pants decomposition con-
tributes roughly with two parameters, a “length” and a “twist”. It would
now be reasonable to expect that both these coordinates merge nicely to
give a global homeomorphismTeich(Sg) ∼= D6g−6, but this is unfortunately
not the case.
The proof thatTeich(Sg)is homeomorphic toD6g−6 is disappointingly
indirect. We ﬁrst prove that Teich(Sg) is a topological manifold with
boundary, by constructing some charts. To construct a chart, we ﬁrst
build a map
q : Teich(Sg) → M L
that depends only on a ﬁxed pants decompositionµ. For a given hyperbolic
metric m ∈ Teich(Sg), we construct a measured geodesic laminationq(m)
as follows. We straighten µ to its geodesic representative (with respect
to m), and we consider separately each geodesic pair of pantsP of the
decomposition. We ﬁrst show thatP has a natural partial foliation, that
depends only on its metric, whose leaves are not geodesics. We then glue
these partial foliations to get a partial foliation onSg, and then straighten
it to a geodesic laminationq(m).
The natural partial foliation onP is constructed as follows. Let gi j
be the unique orthogeodesic connecting thei-th and j-th boundary com-
ponent of P, for all 1 ⩽ i , j ⩽ 3. Let a1, a2, a3 be the lengths of the
boundaries of P. We consider the pointQ = [a1, a2, a3] in the triangle of
Figure 8.9, pick the three orthogeodesicsgi j isotopic to the three curves
indicated in the sub-triangle of Figure 8.9 containingQ, and thicken each
gi j toametric R-neighbourhoodof gi j, whereRisthelinearcombinationof


## Page 266

258 8. SURFACE DIFFEOMORPHISMS
(1) (2)
Figure 8.15. Every geodesic pair of pants P has a natu-
ral partial foliation: the shape of the foliation is determined
by the sub-triangle containingQ = [a1, a2, a3] in Figure 8.9,
where a1, a2, a3 arethelengthsof ∂P; thetwopicturesshown
here correspond to two cases. In each case, there are three
rectangles: each is theR-neighbourhood of the correspond-
ing(unique)orthogeodesic(drawninblue),and Risthelinear
combination ofa1, a2, a3 prescribed by Figure 8.9, that is the
uniquecombinationthatguaranteesthatthethreerectangles
match nicely as in the ﬁgure (1). We cut the geodesic pants
P along the three blue orthogeodesics and get two right-
angled hexagons. Since by hypothesis the three red sides
have length ⩾ ε/2, one sees easily that the central triangle
has diameter bounded by some constantC′ depending only
on ε, and hence every leaf in each of the three rectangles is
shorter than someC′′ that also depends only onε (2).
a1, a2, a3 indicatedinFigure8.9. The R-neighbourhoodisnaturallyfoliated
into (non-geodesic) arcs staying at ﬁxed distance fromgi j and the foliated
neighbourhoods cover nicely much of the pair of pantsP, as shown in Fig-
ure 8.15-(1). Every foliated rectangle is equipped with a natural transverse
measure induced by the orthogonal distance between leaves.
The partial foliations of all the pairs of pants ofSg glue to a singular
measured foliation forSg, which straightens as prescribed in Section 8.3.12
to a measured geodesic laminationq(m).
Let µ = γ1 ⊔ . . . ⊔ γ3g−3 be our original pants decomposition.
Proposition 8.3.24. The map q restricts to a homeomorphism
q : Teich(Sg) − →
{
λ ∈ M L
⏐⏐ i(λ, γi ) > 0 ∀i
}
.
Proof. Compare the coordinates(li , θi ) for Teich(Sg) and (ai , bi , ci )
for M L. The map q sends (li , θi ) to (li , bi , ci ) for some (bi , ci ) that
depends homeomorphically onθi ∈ R for each i. Note that ai = i(λ, γi ).
□
8.3.16. The fundamental lemma.We now show that the projection
q distorts very little the lengths of the simple closed curves, as long as we
put a lower bound on the lengths of the curvesγ1, . . . γ3g−3 of the ﬁxed


## Page 267

8.3. LAMINATIONS 259
pants decomposition µ. This technical fact is called the Fundamental
Lemma [19].
For every ε > 0, we deﬁneV (ε) ⊂ Teich(Sg) to be the open subset
consisting of all metricsm such that i(m, γi ) > ε for all i.
Lemma 8.3.25. For every simple closed curveα ∈ S there exists a
constant C > 0 such that, for allm ∈ V (ε), we have
i(q(m), α) ⩽ i(m, α) ⩽ i(q(m), α) + C.
Proof. We representq(m) as a singular partial foliation, without any
straightening. Thetransversemeasureof q(m)isjustthelengthoforthog-
onalgeodesics, hencethe q(m)-measureofanypiecewise-transverseclosed
curve is smaller or equal than its length: this proves thati(q(m), α) ⩽
i(m, α).
We prove the other inequality. Ifα = γi then i(m, α) = i(q(m), α),
so we suppose that i(α, µ) > 0. Up to isotopy we may take α to be
monotonically transverse toq(m), recall the proof of Proposition 8.3.20.
The curve α intersects each pair of pantsP into some essential arcsβ
that cross each foliated rectangle monotonically.
We can easily homotope each of these arcsβ ⊂ α ∩ P with ﬁxed end-
points into a (not necessarily simple!) piecewise smooth arc that decom-
poses into ﬁnitely many sub-arcs, that are alternatively contained either in
a component of∂P or in a leaf of some foliated rectangle. Each sub-arc
in a component of∂P may make many full turns (and hence may not be
injective). Each of the three rectangles contains at most one leaf that is a
sub-arc of β. We arrange the homotopy eﬃciently so that the newβ has
the same transverseq(m)-measure as before.
The transverse q(m)-measure of β on the sub-arcs in∂P is equal to
its length, whereas on the leaf sub-arcs it is zero. Therefore them-length
of β is equal to its measure plus the length of at most 3 leaves of some
rectangles in P. Figure 8.15-(2) shows that each such leaf is shorter than
some constant C′′ that depends only onε.
Note that α is decomposed intoi(α, µ) arcs like β. By homotoping
each β as above we ﬁnd a homotopic representative forα whose length
is at most theq(m)-measure of α plus C = 3 i(α, µ)C′′. The length of
any homotopic representative is greater or equal than the lengthi(m, α)
of the geodesic one, and this proves the second inequality. □
Corollary 8.3.26.Let mi ∈ V (ε)be a diverging sequence inTeich(Sg).
The sequence converges inTeich(Sg) ⇐ ⇒the sequence [q(mi )] ∈ PM L
does, and in this case they tend to the same limit.
Proof. If mi converges to some[α] ∈ PM L, we haveλi mi → α for
some real numbersλi → 0. By the fundamental lemma, for every simple
closed curve γ ∈ S we get
⏐⏐i
(
λi mi , γ
)
− i
(
λi q(mi ), γ
)⏐⏐ → 0.


## Page 268

260 8. SURFACE DIFFEOMORPHISMS
Therefore λi q(mi ) converges (on a subsequence) to aβ ∈ M L such that
i(α, γ) = i(β, γ) for all γ ∈ S. Exercise 8.3.21 givesβ = α.
The other implication is analogous. □
8.3.17. Atopologicalchart. Pickanarbitraryelement [λ] ∈ PM L =
∂Teich(Sg). We construct an explicit neighbourhood of[λ] in Teich(Sg).
Let µ = γ1⊔. . .⊔γ3g−3 beapantsdecompositionsuchthat i(γi , λ) > 0
for all i. We ﬁx ε > 0 and deﬁne as aboveV (ε) ⊂ Teich(Sg) as the set
of all the metricsm such that i(γi , m) > ε for all i. We deﬁne similarly
W ⊂ PM L as the set of all[α] such that i(γi , α) > 0 for all i. We have
[λ] ∈ W.
Proposition 8.3.27. We have
π(q(V (ε))) = π(q(Teich(Sg))) = W.
The set W ∪ V (ε) is an open neighbourhood of[λ] in Teich(Sg).
Proof. Proposition 8.3.24 implies the second equality, the ﬁrst holds
because every [α] ∈ W is represented by anα with i(γi , α) ⩾ ε.
The setsW and V (ε) are open inPM L and Teich(Sg) respectively. If
W ∪V (ε)werenotopenin Teich(Sg), therewouldbeasequence mi ̸∈ V (ε)
of metrics converging to some [α] ∈ W. On a subsequence we may
suppose that i(mi , γj ) < ε for some ﬁxedj and therefore i(α, γi ) = 0, a
contradiction. □
We have found an open neighbourhood of[λ] and we now want to
determine its topology.
Proposition 8.3.28. There is a homeomorphism
φ: W ∪ V (ε) − →U
onto an open subset U ⊂ H of a half-space H ⊂ R6g−6, with φ(W ) =
U ∩ ∂H.
Proof. We complete the pants decompositionµ to a ﬁlling setµ′ ∈ C
of simple closed curves in Sg, considered as a current. We know from
Proposition 8.2.28 that the metricsm with i(m, µ′) ⩽ M form a compact
subset in Teich(Sg). We deﬁne the map
φ: W ∪ V (ε) − →W × [0, 1]
x ↦− →
{ (x ,0) if x ∈ W,
(π(q(x)), e−i(q(x),µ′)) if x ∈ V (ε).
The mapφ is continuous: if a sequencemi ∈ V (ε) of metrics tends to
[α] ∈ PM L, then i(mi , µ′) → ∞, hence i(q(mi ), µ′) → ∞ by the funda-
mental lemma. Moreover π(q(mi )) → [α] by Corollary 8.3.26. Summing
up, we get thatφ(mi ) → ([α], 0) = φ([α]).


## Page 269

8.4. SURFACE DIFFEOMORPHISMS 261
The map φ is injective: given two metricsm, m′, if the ﬁrst compo-
nents of φ(m), φ(m′) are equal then q(m) = λq(m′), and if the second
components are equal we getλ = 1.
By similar methods one proves that the image ofφ is open and the
inverse there is continuous. The set W × [0, 1] embeds in H since W
embeds in R6g−7. □
Corollary 8.3.29. The space Teich(Sg) is a topological manifold with
boundary ∂Teich(Sg).
8.3.18. Conclusion. Wehavediscoveredthat Teich(Sg)isacompact
topological manifold with boundary, and we now invoke Theorem 1.7.18
to deduce that it is a disc. We have ﬁnally completed the proof of the
following theorem, which is the main achievement of the whole chapter.
Theorem8.3.30. Theclosure Teich(Sg)of Teich(Sg)in PC ishomeo-
morphic to the closed discD6g−6. Its interior isTeich(Sg) and its boundary
contains S as a dense subset.
Thurston’s original compactiﬁcation theorem embeds everything in
RS instead of C. We can easily deduce it from Theorem 8.3.30.
Proof of Theorem 8.1.5. The natural mapC → RS induced by the
intersection form i is continuous since i is, and it induces a continuous
map ϕ: PC → P(RS ) on their projective spaces.
The Teichmüller space is embedded in both projective spaces and
ϕ restricts to a homeomorphism between the two embeddings, and to a
continuous surjective map from their compactiﬁcations. The map on com-
pactiﬁcations is actually injective sinceϕ|PML is (intersections with simple
closed curves distinguish laminations) and is hence a homeomorphism.□
8.4. Surface diﬀeomorphisms
We have discovered that Thurston’s compactiﬁcationTeich(Sg) of
the Teichmüller space is homeomorphic to a closed disc. The mapping
class group MCG(Sg) acts on it naturally. We can now apply Brouwer’s
ﬁxed point theorem to every elementϕ ∈ MCG(Sg), and characteriseϕ
according to the position of its ﬁxed points, much similarly as we did for
the isometries ofHn.
8.4.1. The torus case.As usual, the ﬂat torus case is very instructive
because everything can be written explicitly.
We know from Proposition 7.1.5 thatMCG(T ) acts onTeich(T ) like
the Möbius transformationsPSL2(Z) do on the hyperbolic half-planeH2.
The action of course extends to the compactiﬁcationH2 = H2 ∪ R ∪
{∞} and every non-trivial isometryA ∈ PSL2(Z) is elliptic, parabolic, or
hyperbolic according to the position of its ﬁxed points.
As an integral matrix, the isometryA has also more properties that
are easy to check: if it is elliptic, it has ﬁnite order becausePSL2(Z) is


## Page 270

262 8. SURFACE DIFFEOMORPHISMS
discrete; if it is parabolic, it is conjugate inPSL2(Z) to a matrix
(1 n
0 1
)
for
some n ̸= 0 and is thus then-th power of a Dehn twist; if it is hyperbolic, it
is conjugate inPSL2(R) to a diagonal matrix
(λ 0
0 λ−1
)
for some λ > 1, with
some basis of eigenvectorsv , w. The two foliations ofR2 into lines parallel
to v or w are both preserved byA and descend to foliations inT = R2/Z2
that are preserved byA. The two foliations are both irrational (because
λ is), that is every leaf is dense inT, and A stretches one foliation byλ
and contracts the other by1/λ. One such diﬀeomorphism ofT is called
Anosov.
Summing up, the non-trivial elements inMCG(T ) either have ﬁnite
order, or preserve a simple closed curve, or are Anosov. We now deﬁne an
analogous trichotomy for the elements inMCG(Sg)when g ⩾ 2, where the
foliations are replaced by measured geodesic laminations, and the measure
is there to encode stretchings and contractions.
8.4.2. Thetrichotomy. Let Sg havegenus g ⩾ 2. Themappingclass
group MCG(Sg) acts naturally on the whole spaceC of currents and in
particular on the compactiﬁcationTeich(Sg) ∼= D6g−6 of the Teichmüller
space.
Let ϕ ∈ MCG(Sg) be a non-trivial element. By Brouwer’s ﬁxed point
theorem, ϕ ﬁxes at least one point inTeich(Sg). We say thatϕ is:
(1) ﬁnite orderif it ﬁxes a hyperbolic metricm ∈ Teich(Sg);
(2) reducible if it ﬁxes a multicurveµ ∈ M;
(3) pseudo-Anosov in all the other cases.
We now analyse the three cases individually.
8.4.3. Finite order elements.We must ﬁrst explain the terminology.
Proposition 8.4.1. A non-trivial elementϕ ∈ MCG(Sg) is ﬁnite order
if and only if it has indeed ﬁnite order inMCG(Sg).
Proof. Suppose that ϕ preserves the isotopy class[m] ∈ Teich(Sg)
of a hyperbolic metric m in Sg. We can choose a representative for ϕ
that ﬁxes m. This representative is an isometry form. Since the isometry
group of a closed hyperbolic manifold is ﬁnite (see Corollary 4.3.8) we have
ϕn = id for some n > 1 and ϕ has indeed ﬁnite order inMCG(Sg).
Conversely, letϕ be an element having ﬁnite order inMCG(Sg). The
subgroup ⟨ϕ⟩ generated by ϕ cannot act freely on Teich(Sg) ∼= R6g−6,
otherwise it would quotient R6g−6 to an aspherical manifold with ﬁnite
fundamental group, contradicting Theorem 1.7.10. Therefore some non-
trivial power ofϕ has a ﬁxed point inTeich(Sg).
If ϕ has prime order we easily conclude that alsoϕ has a ﬁxed point
and we are done. However, ifϕ has order p1 · · · ps for some primespi, we
need to do more work. By induction,ϕ′ = ϕp1···ps−1 has a ﬁxed point[m] ∈
Teich(Sg) and is hence represented by an isometry forSg with metric m.
The isometryϕ′ quotients Sg to a hyperbolic orbifold, and the ﬁxed points


## Page 271

8.4. SURFACE DIFFEOMORPHISMS 263
Fix(ϕ′) of ϕ′ in Teich(Sg) can be identiﬁed naturally with the (suitably
deﬁned) Teichmüller space of this orbifold, which is homeomorphic toRN
for some N > 0 like in the surface case (exercise).
Since ϕ and ϕ′ commute, the ﬁrst act as a mapping class onFix(ϕ′)
with order p1 · · · ps−1: we conclude by induction ons that ϕ has a ﬁxed
point in Teich(Sg). □
We get in particular the following corollary, which is far from obvious
because MCG(Sg) does not act itself on Sg, and algebraic relations in
MCG(Sg)do not translate into algebraic relations between representatives,
except in some very lucky cases.
Corollary 8.4.2. If ϕ ∈ MCG(Sg) has order k, it may be represented
by a diﬀeomorphismϕ: Sg → Sg such that ϕk = id.
Proof. The class ϕ has a representativeϕ: Sg → Sg that is an isom-
etry for some hyperbolic metric; the isometryϕk is isotopic to the identity
and is hence the identity by Corollary 4.3.7. □
8.4.4. Reducible elements. We must explain the terminology also in
this case. Ifϕ ﬁxes a multicurveµ, one can cutSg along µ and look at the
restriction of ϕ to the resulting pieces: after extending all the theory to
surfaces with boundary (that we have not done here for simplicity), we can
hence study inductively each piece, and this explains the wordreducible.
The cases (1) and (2) are not exclusive: there are isometries of hy-
perbolic surfaces that preserve some multicurve. On the other hand, there
are ﬁnite order elements that are not reducible (exercise) and reducible
mapping classes that are not of ﬁnite order: for instance, Dehn twists.
8.4.5. The action on M L. The mapping class groupMCG(Sg) of
Sg acts on the currents spaceC and hence on the “light cone” subspace
M L of all measured geodesic laminations, which contains the spaceM of
multicurves.
The action ofMCG(Sg) on M L can be seen concretely insideSg. It
suﬃces to considerM L as the space of all measuredtopological lamina-
tions (deﬁned in Section 8.3.11) considered up to isotopy and collapsing of
parallel closed leaves. Nowϕ ∈ MCG(Sg) acts on M L simply by sending
the measured topological laminationµ to ϕ(µ).
We now prove that ifϕ ﬁxes a non-trivial point inM L we fall back
into one of the two cases already considered.
Proposition 8.4.3. If ϕ(µ) = µ for some non-trivialµ ∈ M L, then ϕ
is either ﬁnite order or reducible.
Proof. Weﬁxahyperbolicmetricon Sg andrepresent µasameasured
geodesic lamination there.
By Proposition 8.3.5 there are ﬁnitely many complementary regions
in Sg \ µ. If µ is not full, some region is not an ideal polygon and hence


## Page 272

264 8. SURFACE DIFFEOMORPHISMS
deformation-retracts onto a subsurface S′ ⊂ Sg, whose boundary com-
ponents ∂S′ are non-trivial simple closed curves inSg. The union of all
such curves ∂S′ as S′ varies produces a multicurve preserved byϕ, which
is hence reducible.
If µ is full, all the complementary regions are ideal polygons, and after
substituting ϕ with a ﬁnite power we can suppose that each region is ﬁxed
(not pointwise) byϕ, together with each of its boundary components. We
consider the preimage˜µ ⊂ H2 and note that its complementary regions in
H2 are still ideal ﬁnite polygons, the lifts of the ones inSg.
The diﬀeomorphism ϕ lifts to a homeomorphism ˜ϕ: H2 → H2 that
ﬁxes ˜µ, and we may suppose that it ﬁxes (not pointwise) a complementary
polygon and each of its boundary lines. In particularϕ ﬁxes orientation-
preservingly a linel ⊂ ˜µ.
Remember that G is the set of all lines inH2. We now prove that,
if ˜ϕ ﬁxes (orientation-preservingly) a linel ⊂ ˜µ ⊂ G, then it ﬁxes (still
orientation-preservingly) all the lines in˜µcontained in some neighbourhood
of l ∈ G. This is done as follows: since the boxes form a neighbourhood
system for G, and ˜ϕ acts via homeomorphisms onG, there are two boxes
B ⊂ B′ containing l such that ˜ϕ(B) ⊂ B′. Now B ∩ ˜µ ⊂ B′ ∩ ˜µ consists of
someparallellines,whichlooklike J×R ⊂ J′×Rforsomemeasuredordered
set J′ and some subsegmentJ ⊂ J′: the map ϕ sends J to J′ preserving
both the ordering and the measure, and ﬁxing the point corresponding to
l: hence it is the identity.
On the other hand, every complementary region of˜µ is a ﬁnite ideal
polygon: henceif ˜ϕﬁxes(orientation-preservingly)onesideofthepolygon,
it ﬁxes all the others.
The two properties just listed together easily imply that, sincel is
ﬁxed, the whole of˜µ is. Since the lines are ﬁxed orientation-preservingly,
their endpoints are ﬁxed: the map˜ϕ ﬁxes all the endpoints of all lines in˜µ,
and since these endpoints form a dense subset of∂H2 the map ˜ϕ ﬁxes ∂H2
pointwise and henceϕ is trivial inMCG(Sg) by Proposition 6.5.12. □
The previous proposition shows in particular that pseudo-Anosov el-
ements act freely onM L \ { 0}. We now investigate more closely these
mysterious mapping classes.
8.4.6. Pseudo-Anosov elements. A pseudo-Anosov elementϕ is by
deﬁnition neither ﬁnite order nor reducible. We have just seen thatϕ acts
freely on M L \ {0}, but this does not prevent it from having some ﬁxed
points inPM L; indeed we now show that there are two ﬁxed points there,
one attracting and the other repelling, so thatϕ looks very much like a
hyperbolic isometry on the hyperbolic space.
Theorem 8.4.4. Let ϕ ∈ MCG(Sg) be a pseudo-Anosov element.
There are two measured geodesic laminationsµs , µu ∈ M L and a real


## Page 273

8.4. SURFACE DIFFEOMORPHISMS 265
Figure 8.16. The appropriate lift ˜ϕ acts on ∂H2 with 2k
ﬁxed points that are alternatively attractive and repelling.
By joining the repelling points we ﬁnd another laminationµu
ﬁxed by ϕ. Here k = 5.
number λ > 1 such that
ϕ(µs) = λµs , ϕ (µu) = 1
λ µu.
The laminations µs and µu are full, and they altogether ﬁllSg.
Proof. By Brouwer’s ﬁxed point theorem, a pseudo-Anosov element
ϕ has a ﬁxed point inTeich(Sg) ∼= D6g−6 which is (by deﬁnition) neither
a metric nor a multicurve. Thereforeϕ ﬁxes a projective measured lami-
nation [µ] which is full (otherwiseϕ would be reducible: see the proof of
Proposition 8.4.3).
Since [µ] is a projective class, we have ϕ(µ) = λµ for some real
number λ > 0. Up to replacing ϕ with its inverse ϕ−1 we may suppose
that λ ⩾ 1, and Proposition 8.4.3 shows thatλ > 1. We denote thisµ by
µs.
We now constructµu. As in the proof of Proposition 8.4.3, we con-
sider the preimage˜µs ⊂ H2 of µs, and after replacingϕ with a ﬁnite power
we may choose a lift˜ϕ of ϕ that ﬁxes a complementary polygonal region
R of ˜µs and its sides, hence in particular the vertices ofR, see Figure 8.16.
The k vertices of R divide ∂H2 into ˜ϕ-invariant arcs I1, . . . , Ik, cor-
responding to the sidess1, . . . , sk of R, see Figure 8.16. Sinceµs is full,
each si is the limit of a sequence of leaves in˜µs with both endpoints inIi
converging to the endpoints ofsi but distinct from them by Proposition
8.3.10. Since λ > 1, the map ˜ϕ pushes these leaves towardssi, so in
particular the vertices ofR are local attractors for the action of˜ϕ on ∂H2,
see Figure 8.16.


## Page 274

266 8. SURFACE DIFFEOMORPHISMS
Since the endpointsp and q of li are attractors, the map˜ϕ ﬁxes at
least one point in the interior ofIi, and we show that it cannot ﬁx two: if
˜ϕ ﬁxes r and s in the interior ofIi, then it ﬁxes the box[p, r ] × [s, q] that
has non-zero measure, a contradiction sinceλ > 1. There is a single ﬁxed
point in li, and it must be repulsive.
The dynamics of˜ϕ on ∂H2 is described in Figure 8.16. The closure of
the projection of thek green lines is another invariant geodesic lamination
µu, which must be full becauseϕ is pseudo-Anosov.
We now prove thatµu admits some (non unique) transverse measure
and can hence be considered as an element ofM L. The dynamics shows
that for some curveγ ∈ S the supports of ϕ−k(γ) tend to that ofµu.
The sequence ϕ−k([γ]) ∈ PM L hence converges on a subsequence to a
projective measured geodesic lamination with supportµu.
In principle, the measure supported byµu needs not to be unique,
not even up to rescaling: hence the element [µu] may not be uniquely
determined and we cannot conclude that it is ﬁxed byϕ, unfortunately.
However, distinct measures on the same support form obviously a convex
cone in the current spaceC and hence a closed disc inPC, the class ϕ
acts on this disc and therefore has a ﬁxed point there by Brouwer’s ﬁxed
point theorem again.
We have ϕ(µu) = λ′µu for some λ′. It is clear thatµu and µs ﬁll Sg
altogether, and in particulari(µu, µs) > 0. Therefore
0 < i (µu, µs) = i(ϕ(µu), ϕ(µs)) = λλ′i(µu, µs)
gives λ′ = 1
λ. The proof is complete. □
The laminations µs and µu are thestable and theunstable measured
geodesic laminations ﬁxed by ϕ, and λ is the dilatation of ϕ. We now
prove a converse to Theorem 8.4.4.
Proposition 8.4.5. If ϕ ∈ MCG(Sg) is such thatϕ(µ) = λµ for some
full µ ∈ M L and λ > 1, then ϕ is pseudo-Anosov.
Proof. We need to prove thatϕ is neither ﬁnite order nor reducible,
that is thatϕ ﬁxes no non-trivial currentα ∈ Teich(Sg) ∪ M. We have
i
(
ϕk(α), µ
)
= i
(
α, ϕ−k(µ)
)
= λ−k i
(
α, µ) → 0
as k → +∞. Therefore ϕ(α) ̸= α unless i(α, µ) = 0, which is excluded
since µ is full. □
8.4.7. Examples. We now construct plenty of pseudo-Anosov diﬀeo-
morphisms. We need a bit of simple linear algebra.
We say that a matrix or vector ispositive if all its entries are. A square
matrix M with non-negative integral entries isPerron-Frobenius if M k is
positive for somek > 0.
Proposition 8.4.6. Every Perron-Frobenius integral matrix M has a
positive eigenvector v with some eigenvalueλ > 1.


## Page 275

8.4. SURFACE DIFFEOMORPHISMS 267
a
b
a
b
a
b b'
a'
Figure 8.17. We smoothen α∪ β to a bigon track that
contains both α and β (left). The bigon track may have
some bigons as complementary regions (right).
Proof. The matrix M has non-negative entries and hence preserves
the standard simplex∆ = {xi ⩾ 0, ∑xi = 1}, so by Brouwer’s ﬁxed point
theorem it has a ﬁxed pointv ∈ ∆ there. Since M k > 0 and v is an
eigenvector forM k, we getv > 0. Since M k is integral we getλk > 1 and
hence λ > 1. □
The following examples were constructed by Penner in 1988. Recall
that a multicurveα in Sg is essential if it contains no parallel components:
this holds for instance ifα is a simple closed curve or a pants decomposi-
tion.
Theorem 8.4.7. Let α and β be two essential multicurves that al-
together ﬁll Sg. Let ϕ ∈ MCG(Sg) be any composition of Dehn twists
T +1
a and T−1
b where a and b vary among the curves inα and β. If every
component a, b of α, β occurs at least once, thenϕ is pseudo-Anosov.
TheDehntwistsmayoccurinanyorder,forinstance ϕ = T 2
a T−3
b T−1
b′ Ta′.
Proof. We put α and β in minimal position and smoothen the trans-
verse intersections as in Figure 8.17-(left) to get abigon track τ. A bigon
track is like a train track, except that it may contain some complementary
bigon as in Figure 8.17-(right). The straightening procedure described
in Section 8.3.12 works also in this case (exercise), so every weight sys-
tem on τ determines a measured geodesic lamination inSg. (Diﬀerent
weight systems may determine the same geodesic laminations because of
the bigons.)
We haveα = a1 ⊔. . .⊔am and β = b1 ⊔. . .⊔bn. Each ai and bj may be
representedbyassigningweights1or0totheedgesof τ, andtheseweights
form m+nindependent(exercise)vectors v1, . . . , vm+n intheweightsspace
of τ. Let V be the (m + n)-dimensional sub-cone of the weights space
generated byv1, . . . , vm+n via combinations with non-negative coeﬃcients.
Every vector inV models a measured geodesic lamination inSg.


## Page 276

268 8. SURFACE DIFFEOMORPHISMS
Let Ω be them + n square matrixΩi j = i(vi , vj ). We haveΩ =
(0 H
K 0
)
.
The crucial point here is that bothTaj and T−1
bk act on V like the matrix
Qi = I + Di Ω
where I is the identity andDi has 1 on thei-th entry of the diagonal and
0 everywhere else. The map ϕ therefore acts on V as a product M =
Qi1 · · · Qih of non-negative matrices. Since eachi = 1 , . . . , m + n occurs
at least once as an index, we may deduce (exercise) thatM is Perron-
Frobenius. Therefore M has a positive eigenvectorv with eigenvalue λ >
1.
The positive eigenvectorv determines an elementµ ∈ M L such that
ϕ(µ) = λµ. We leave to the reader the proof that µ is full, and we
conclude using Proposition 8.4.5. □
8.4.8. References. The material contained in this chapter is well
known to experts, but it is hard to ﬁnd a source in the literature that
contains everything in a fully self-contained way. The whole theory was
presented by Thurston in a very nice and readable paper [55] that however
contained no proof. The most complete book on the subject is then Fathi
– Laudenbach – Poénaru [19], and this is also the main source that we
have used for writing this chapter. Another important source is Casson –
Bleiler [12].
We have chosen to describe the whole theory using Bonahon’s geo-
desiccurrents, thatoriginatedinthepapers[ 6,7]. Tothispurposewehave
also consulted McMullen [39], Aramayona – Leininger [3], and Calegari [9].
We also borrowed some arguments on train tracks and measured geodesic
laminations from a nice and self-contained paper of Hatcher [27]. The
proof of Proposition 8.4.1 was taken from [18, Theorem 6.1]. Theorem
8.4.7 was proved by Penner in [44].


## Page 277

Part 3
Three-manifolds


## Page 278

[No extractable text on this page]


## Page 279

CHAPTER 9
Topology of three-manifolds
The three-manifolds world is topologically much richer than the sur-
faces realm, while yet not so crazy as the four-manifolds universe. In
dimension two a simple homological invariant (the Euler characteristic)
suﬃces to classify topologically all the closed orientable manifolds: at the
complete opposite, the closed four-manifolds cannot be classiﬁed in any
reasonable sense. The three-manifolds lie in the middle: we do not have
yet a complete satisfactory picture, but we understand them a good deal.
The rest of this book is devoted to three-manifolds, more speciﬁ-
cally to compact orientable three-manifolds, possibly with boundary (the
orientability assumption is not essential, but it helps to simplify many argu-
ments). Wesplittheirstudyintosomeparts. First,westatesomeuniversal
topological facts, mostly concerning the way surfaces can be contained in
three-manifolds. Then we construct some classes of three-manifolds, fo-
cusing mostly on Seifert manifolds. After classifying the Seifert manifolds
topologically, we assign a geometry to each: there are eight interesting
geometries in dimension three, and we introduce them with some care.
Finally, we concentrate on the most interesting and beautiful of the eight:
hyperbolic geometry.
In this chapter we start to study the topology of three-manifolds. We
begin with some algebraic topology, then we show that the connected sum
behaves like products of numbers: every closed three-manifold splits in
a unique way in a unique list of prime factors. Finally we introduce the
important notion of incompressible surface.
9.1. Algebraic topology
The algebraic topology of compact 3-manifolds is not complicated.
9.1.1. Integralhomology. Inthissectionallthehomologygroupsare
considered over Z. We ﬁrst note that, for closed orientable 3-manifolds,
the fundamental group determines everything.
Proposition 9.1.1. The homology H∗(M) of a closed orientable 3-
manifold M is determined byπ1(M).
Proof. As in every path connected space, the groupH1(M) is the
abelianisation of π1(M) and H1(M) = Hom( H1(M), Z), which is hence
271


## Page 280

272 9. TOPOLOGY OF THREE-MANIFOLDS
isomorphic to H1(M) modulo its torsion. By Poincaré dualityH2(M) =
H1(M) and H2(M) = H1(M). Finally H3(M) = Z. □
9.1.2. Homologyspheres. Ahomology n-sphere isaclosedorientable
n-manifold M whose homology is the same as that ofSn. That is, we have
H0(M) = Hn(M) = Z and Hi (M) vanishes for all0 < i < n .
By Poincaré duality, a closed 3-manifoldM is a homology sphere if
and only ifH1(M) vanishes. Since H1(M) is the abelianization ofπ1(M),
this happens precisely whenπ1(M) is aperfect group, that is a group with
trivial abelianization.
In 1900 Poincaré conjectured that every homology 3-sphere should be
homeomorphic toS3. Four years later, he found himself a counterexample
by constructing what is known today asPoincaré’s homology sphere, a
closed 3-manifold with a perfect fundamental group of order 120. He then
modiﬁed his original conjecture by asking whether every simply connected
closed 3-manifold should be homeomorphic toS3. This fact, widely known
as Poincaré’s Conjecture, was proved only in 2002 by Perelman.
We will construct Poincaré’s homology sphere (and many more ho-
mologyspheres)inChapter10, andwewilldiscussthePoincaréConjecture
in Section 12.9, as a part of Thurston’s widerGeometrisation Conjecture,
also proved by Perelman in 2002.
9.1.3. Theboundary. TheEulercharacteristic χ(M)ofaclosedodd-
dimensional manifold vanishes, and on manifolds with boundary we have
the following.
Proposition 9.1.2. If M is a compact 3-manifold with boundary, then
χ(M) = χ(∂M )
2 .
Proof. We only use thatM has odd dimensionn. If M is closed and
orientable, we haveχ(M) = ∑n
i=0(−1)i bi and the Betti numbersbi and
bn−i are equal by Poincaré duality, henceχ(M) = 0. If M is non-orientable
then it has an orientable double-coverN and χ(N) = d χ(M) on degree-d
covers, hence χ(N) = 0 implies χ(M) = 0. If M has boundary then
0 = χ(DM) = 2 χ(M) − χ(∂M )
where DM is thedouble of M, constructed by taking two identical copies
of M and identifying their boundaries in the obvious way. □
The manifold M has half the Euler characteristic of∂M, and is also
responsible for half of the ﬁrst homology group of∂M. More precisely, we
are interested in the boundary map
∂ : H2(M, ∂M) − →H1(∂M )
and we want to prove that its image is a particular half-dimensional sub-
group. Recall from Proposition 1.7.16 that every class inH2(M, ∂M) is


## Page 281

9.1. ALGEBRAIC TOPOLOGY 273
represented by an oriented properly embedded surfaceΣ, and ∂ sends [Σ]
to [∂Σ].
Let M be oriented. The boundary∂M may be disconnected and in-
herits an orientation. Recall thatH1(∂M ) ∼= Z2n for some n and H1(∂M )
is equipped with a symplectic intersection formω, see Section 6.1.3. A
subgroup L < H 1(∂M ) is lagrangian if ω|L ≡ 0.
Exercise 9.1.3. If L is lagrangian thenrkL ⩽ n.
When rkL = n we say thatL has maximal rank.
Proposition 9.1.4. Let M be an oriented compact 3-manifold with
boundary. The image of the map
∂ : H2(M, ∂M, Z) − →H1(∂M, Z)
is a lagrangian subgroup ofH1(∂M, Z) of maximal rank.
Proof. Consider the long exact sequence
. . . − →H2(M, ∂M)
∂
− →H1(∂M )
i∗
− →H1(M) − →. . .
We have two pairings
ω : H1(∂M ) × H1(∂M ) − →Z,
η : H2(M, ∂M) × H1(M) − →Z.
The latter is provided by Lefschetz duality and is non-degenerate after
quotienting the torsion subgroups. We have
ω(∂α, β) = η(α, i∗β)
for allα ∈ H2(M, ∂M) and β ∈ H1(∂M ): this equality can be proved easily
by representing the elements ofH2(M, ∂M) as surfaces (which we can do
thanks to Proposition 1.7.16). Now ifβ = ∂α′ we get
ω(∂α, ∂α′) = η(α, i∗∂α′) = η(α, 0) = 0
and hence Im ∂ is lagrangian. It has maximal rank since H2(M, ∂M) =
H1(M) and H1(M) have the same rank: ifrk Im ∂ < 1
2 b1(∂M ), then we
get rk Im i∗ > 1
2 b1(∂M ) and rk ker∂ > b 1(M) − 1
2 b1(∂M ), a contradiction
since Im i∗ and ker ∂ are η-orthogonal. □
Corollary 9.1.5. Let M be an oriented compact 3-manifold. We have
b1(M) ⩾ b1(∂M )
2 .
Proof. The rank ofH1(M) equals that ofH1(M) = H2(M, ∂M). □
Corollary 9.1.6. The boundary of a simply connected compact 3-
manifold consists of spheres.


## Page 282

274 9. TOPOLOGY OF THREE-MANIFOLDS
9.1.4. Non-orientable surfaces. Let M be an orientable 3-manifold
and S ⊂ M beaconnectedsurface. If S isorientable,byProposition1.1.12
a tubular neighbourhood forS is diﬀeomorphic to the productS × R.
The orientable manifold M may also contain a non-orientable sur-
face S: for instance the orientable projective spaceRP3 contains the non-
orientable projective planeRP2. In that case a tubular neighbourhood of
S is diﬀeomorphic to the unique orientable interval bundleS ×
∼
R over S,
see Proposition 1.1.12 again. A compact tubular neighbourhood ofS is
an interval bundleS ×
∼
I, whose boundary is the orientable double cover
of S. For instance, the boundary ofRP2 ×
∼
I is a sphere.
A non-orientable properly embedded surfaceS ⊂ M does not deﬁne a
homology class inZ, but it deﬁnes one inZ2, that is[S] ∈ H2(M, ∂M; Z2).
As opposite to orientable surfaces, this class[S] is always non-trivial.
Proposition 9.1.7. Let M be orientable. Every non-orientable surface
S determines a non-trivial class[S] ∈ H2(M, ∂M; Z2). The manifold M
contains at mostdim H2(M, ∂M; Z2) disjoint non-orientable surfaces.
Proof. A tubular neighbourhoodS ×
∼
I of S contains a simple closed
loop α intersecting S transversely in one point. The homology class[S] ∈
H2(M, ∂M; Z2) = H1(M; Z2) sends α to 1 ∈ Z2 and is hence non-trivial. If
S = S1⊔. . .⊔Sk areallnon-orientable, each Si hasitsown αi andtherefore
the elements[S1], . . . ,[Sk] ∈ H2(M, ∂M; Z2) are linearly independent. □
Corollary 9.1.8. A simply-connected three-manifold does not contain
any closed non-orientable surface.
9.2. Prime decomposition
In this section we study spheres and discs in three-manifolds. We
prove that every sphere in R3 bounds a disc, and we callirreducible a
three-manifoldthathasthisproperty. Thenwestudytheconnectedsumof
three-manifolds, and we show that it behaves like multiplication of natural
numbers: every closed oriented three-manifold decomposes uniquely into
some prime factors.
9.2.1. Balls. In general dimensionn, we have used the termdisc to
denote the closed Euclidean discDn, and the termball for its open interior.
Speaking about three-dimensional spaces, we will henceforth use a more
intuitive terminology and calldisc and ball respectively the closed discsD2
and D3, and we will use the symbolsD and B for them.
Let M be a connected 3-manifold. Theorem 1.1.14 says that all the
closed balls B ⊂ int(M) in M are isotopic and hence the removal of the
interior of B from M produces a new manifoldN with boundary, which
does not depend onB. We have∂N = ∂M ⊔ ∂B.


## Page 283

9.2. PRIME DECOMPOSITION 275
The inverse operation consists ofcapping oﬀ a boundary component
of N diﬀeomorphic to S2 by attaching a ballB to it, via some diﬀeomor-
phism. This operation depends only on the boundary component that is
capped oﬀ.
Proposition9.2.1. Themanifold M obtainedbycappingoﬀaspherical
boundary component ofN does not depend on the diﬀeomorphism chosen.
Proof. There are only two diﬀeomorphisms up to isotopy, see The-
orem 6.4.5, and they are related by a reﬂection ofB, so they produce
diﬀeomorphic manifolds. □
In dimension 3 we can therefore freely remove and add balls without
aﬀecting much the topology of the manifold. In particular, by removing
the interior of a ball fromS3 we get another ballB, and by attaching a ball
to B we get S3 back. We must thank Smale’s Theorem 6.4.1 for that:
the situation in higher dimensions is more complicated.
9.2.2. Connected sums. Connected sums exist in any dimensionn,
but when n ⩽ 3 they may be redeﬁned in slightly simpler terms:
Deﬁnition 9.2.2. The connected sum M = M1#M2 of two oriented
connected 3-manifolds M1, M2 is constructed by removing the interiors
of two closed balls fromM1 and M2, and then gluing the two resulting
spheres via any orientation-reversing diﬀeomorphism.
In dimension n ⩽ 3 these diﬀeomorphisms are all isotopic, see Theo-
rem 6.4.5, hence this is a good deﬁnition (in arbitrary dimension we require
the diﬀeomorphism to extend to the removed discs). We usually work
with oriented 3-manifolds to have a uniquely deﬁned connected sum, but
in some cases this is not necessary. An orientable manifoldM is mirrorable
if it admits an orientation-reversing self-diﬀeomorphism.
Exercise 9.2.3. If M1 is mirrorable, the manifoldM = M1#M2 does
not depend (up to diﬀeomorphisms) on the orientations ofM1 and M2.
If both M1 and M2 are oriented and not mirrorable, it may happen
that M1#M2 and M1#M2 are not diﬀeomorphic (hereM2 is M2 with the
reverse orientation). There is also a boundary-version of connected sum:
Deﬁnition9.2.4. The ∂-connectedsum M = M1#∂M2 oftwooriented
3-manifolds with boundary is constructed by gluing two discsD1 ⊂ ∂M1
and D2 ⊂ ∂M2 via an orientation-reversing diﬀeomorphism.
The operation depends only on the components of∂M1, ∂M2 contain-
ing D1, D2, because of Theorem 1.1.14. The following holds:
M#S3 = M, M #∂B = M, ∂ (M1#∂M2) = ( ∂M1)#(∂M2).
In the latter equality we suppose that∂M1 and ∂M2 are connected.


## Page 284

276 9. TOPOLOGY OF THREE-MANIFOLDS
Figure 9.1. Non-degenerate points of index 0, 1, and 2.
Figure 9.2. The height function on this torus is a Morse
function. It has four critical points of index (from bottom to
top) 0, 1, 1, 2.
Exercise 9.2.5. Let M = M1#M2 or M = M1#∂M2. We have
π1(M) = π1(M1) ∗ π2(M2).
Hint. Use Van Kampen. □
Corollary 9.2.6. We have H1(M, Z) = H1(M1, Z) ⊕ H1(M2, Z).
9.2.3. Irreducible 3-manifolds. We introduce an important deﬁni-
tion. Let M be a connected, oriented 3-manifold with (possibly empty)
boundary.
Deﬁnition 9.2.7. The manifold M is irreducible if every sphere S ⊂
int(M) bounds a ball.
Itisimportanttorecallherethatthespheremustbeasmoothsurface.
If we admitted also topological spheres, no 3-manifold would be irreducible:
there are “wild” topological spheres inside every ball, as in Figure 1.1.
9.2.4. Alexandertheorem. Theﬁrst3-manifoldtolookatisofcourse
R3. We prove here thatR3 is irreducible.
We need some Morse theory. LetS ⊂ R3 be a closed surface and
f (x , y , z) = z be the height function. The functionf is aMorse function
for S if f |S has ﬁnitely many critical points, and at each critical point the
Hessian of f |S is non-singular (the Hessian is read on a chart forS, but
this deﬁnition is chart-independent). The critical point is a local minimum,


## Page 285

9.2. PRIME DECOMPOSITION 277
P P
Figure 9.3. The plane P intersects S into circles. Starting
from the innermost ones, we cutS along the circles and cap
them oﬀ by adding pairs of discs. The resulting surface does
not intersect P anymore.
a saddle, or a local maximum, according to the signature of the Hessian,
see Figure 9.1. These critical points haveindex 0, 1, and 2, respectively.
Exercise 9.2.8. A critical pointp for f |S is non-degenerate if and only
if p is a regular (i.e. non-critical) point for the Gauss mapS → S2.
Lemma 9.2.9. Let S ⊂ R3 be a closed surface. After rotatingS of
an arbitrarily small angle, the height functionf is a Morse function forS.
Proof. Consider the Gauss mapψ : S → S2. By Sard lemma there
are regular values arbitrarily close tov = (0, 0, 1). Rotate S so thatv is a
regular value. Now ψ−1(v) is the set of critical points forf and they are
all non-degenerate. □
We are now ready to prove the following.
Theorem 9.2.10 (Alexander’s Theorem).The spaceR3 is irreducible.
Proof. Let S ⊂ R3 be a 2-sphere. Up to a small rotation we suppose
that the height functionf |S is a Morse function, and after a further small
rotation we may suppose that thek critical points off |S stay at distinct
heights z1 < . . . < z k. Pick a regular value ui ∈ (zi , zi+1) for every i =
1, . . . , k − 1. The horizontal planeP at heightui intersects S transversely
into circles. Starting from the innermost ones, we cutS along these circles
and cap them oﬀ by adding pairs of discs as in Figure 9.3. The resulting
surface is disjoint fromP.
At every cut a sphere decomposes into two spheres. If we do this for
every i = 1, . . . , k − 1 we end up with many spheres of the types shown in
Figure 9.4, that clearly bound balls inR3.
Nowwereversetheprocessandundoallthecuts: weproveinductively
that at each backward step we have a set of spheres bounding balls (note
that the balls are not disjoint!). At each backward step we replace two
spheres S1, S2 bounding balls B1, B2 with one sphere S. Isotope S1 and


## Page 286

278 9. TOPOLOGY OF THREE-MANIFOLDS
Figure 9.4. After capping oﬀ at each ui we end up with
many spheres of these basic types, which clearly bound balls.
S
a
N
Figure 9.5. If S⊂ M is non-separating, there is a simple
closed curve α intersecting S transversely in one point: here
S is drawn as a disc whose boundary should be collapsed to
a point, andα is a line whose endpoints should be identiﬁed
(left). Pick two tubular neighbourhoods of S and α and
consider their unionN (right).
S2, so that they intersect in a discD. If the interiors ofB1 and B2 are
disjoint, thenS bounds the ballB1 ∪B2. If they are not disjoint, then one is
containedintheother, say B1 ⊂ B2 and S boundstheball B2\int(B1). □
Corollary 9.2.11. Every sphere contained in a sub-ballB ⊂ M of a
3-manifold M bounds a ballB′ ⊂ B.
Corollary 9.2.12. Every sphere inS3 bounds a ball on both sides.
Proof. Choose two pointsp, q ̸∈ S on opposite sides with respect to
S. We haveS3 \ p = S3 \ q = R3 hence S is contained inR3 in two ways
and bounds a ball in each. □
Alexander’s Theorem generalises the smooth Jordan curve Theorem
to dimension 3. The situation in higher dimensions is much more prob-
lematic: it is still unknown whether every smooth 3-sphere inR4 bounds a
smooth 4-disc (this is usually called theSchönﬂies problem).
9.2.5. Prime manifolds. A connected sumM1#M2 is trivial if either
M1 or M2 is a sphere.
Deﬁnition 9.2.13. A connected, oriented 3-manifold M is prime if
every connected sumM = M1#M2 is trivial.
Being prime is equivalent to be irreducible, with a single exception.


## Page 287

9.2. PRIME DECOMPOSITION 279
Proposition 9.2.14. Every oriented 3-manifoldM ̸= S2 × S1 is prime
if and only if it is irreducible.
Proof. The inverse operation of a connected sumM = M1#M2 con-
sists of cutting along a separating sphereS ⊂ M and then capping oﬀ
the two resulting manifoldsN1, N2 with balls. The cappedNi is S3 if and
only if Ni is a ball. Therefore the connected sum is trivial if and only if
S bounds a ball on one side. ThereforeM is prime if and only if every
separating sphere S ⊂ M bounds a ball.
If M is irreducible, then it is clearly prime. If M is prime and not
irreducible, there is a non-separating sphereS ⊂ M. There is a simple
closed curve α ⊂ M intersecting S transversely in one point as in Figure
9.5-(left). Pick two tubular neighbourhoods ofS and α as in Figure 9.5-
(right): their union is a manifoldN with a boundary sphere∂N = S′. The
sphere S′ is separating andM is prime, henceS′ bounds a ballB on the
other side andM = N ∪ B.
We now prove thatM = S2 ×S1. We embedS ∪αnaturally inS2 ×S1
as S = S2 × y and α = x × S1. Decompose S2 = D ∪ D′ in two discs and
S1 = I ∪I′ in two intervals. The manifoldN also embeds asS2 × I ∪D × S1
and its complementB = D′ × I′ is a ball. ThereforeM = S2 × S1. □
9.2.6. Some irreducible manifolds. The Alexander theorem gener-
ates many more examples of irreducible 3-manifolds.
Proposition9.2.15. Everycompactthree-dimensionalsubmanifold M ⊂
S3 with connected boundary is irreducible.
Proof. Every sphere S ⊂ M bounds two balls in S3. Since ∂M is
connected, it is contained in one of them, so the other is contained in
M. □
We turn to coverings.
Proposition 9.2.16. Let p : M → N be a covering of 3-manifolds. If
M is irreducible thenN also is.
Proof. A sphere S ⊂ N lifts to many spheres inM, each bounding at
least one ball. Pick an innermost such ballB. We prove that p(B) is a
ball with boundaryS and we are done.
To do this, note thatp|∂B is a diﬀeomorphism ontoS and p(int(B))
is disjoint fromS since B is innermost. This implies thatp|B : B → p(B)
is a covering and since it has degree one onS it is a diﬀeomorphism. □
Corollary 9.2.17. Elliptic, ﬂat, hyperbolic 3-manifolds are irreducible.
Proof. Their universal covering is diﬀeomorphic toS3 or R3. □
Finally, we consider the exceptionS2 × S1. It is not irreducible since
it contains a non-separating sphere, but it is prime.


## Page 288

280 9. TOPOLOGY OF THREE-MANIFOLDS
Figure 9.6. A handlebody of genus3.
Proposition 9.2.18. The manifold S2 × S1 is prime.
Proof. Let S ⊂ S2 × S1 be a separating sphere: we must prove that
it bounds a ball. It separatesS2 × S1 into two manifoldsM and N, and on
fundamental groups we getZ = π1(M) ∗ π1(N). This implies easily that
either π1(M) or π1(N) must be trivial: suppose the ﬁrst.
Since M is simply connected, a copyM′ of M lifts to the universal
cover S2 ×Rof S2 ×S1. Weidentify S2 ×R = R3 \0. Thiscopy M′ nowlies
in R3, and ∂M′ = S2 implies that M′ is a ball by Alexander theorem. □
9.2.7. Handlebodies and line bundles.We now introduce some ba-
sic, but important, compact 3-manifolds with boundary. Ahandlebody is a
connected orientable 3-manifold that decomposes into 0- and 1- handles.
Proposition 9.2.19. The boundary of a handlebody is Sg for some
g ⩾ 0. Two handlebodies are diﬀeomorphic if and only if they have the
same g.
Proof. By simplifying handles we may decompose the handlebody into
one 0-handle and some g 1-handles, so that the boundary is a genus-g
surface, see Figure 9.6. Each 1-handle is attached along a pair of discs;
theorientabilityassumptiontogetherwithTheorem1.1.14easilyimplythat
the result of attaching a 1-handle depends on nothing and the handlebody
depends only ong up to diﬀeomorphisms. □
The genus of a handlebodyHg is the genusg of its boundary surface.
Proposition 9.2.15 implies the following.
Corollary 9.2.20. Handlebodies are irreducible.
Some other simple manifolds are irreducible.
Proposition 9.2.21. If g ⩾ 1 then Sg × [0, 1] is irreducible.
Proof. Its universal coverR2 × [0, 1] is irreducible, because its interior
is diﬀeomorphic toR3. □
Exercise 9.2.22. If b ⩾ 1 the manifold Sg,b × [0, 1] is homeomorphic
to a handlebody of genus2g + b − 1 = −χ(Sg,b) + 1.


## Page 289

9.2. PRIME DECOMPOSITION 281
Figure 9.7. A normal surface intersects every tetrahedron
in triangles or squares.
D
S S'
Figure 9.8. We cansurger a surface S along a discD with
∂D = D∩ S. The operation consists of removing an annular
tubular neighbourhood of ∂D in S and adding two parallel
copies of D. We get a new surfaceS′.
9.2.8. Normal surfaces. Let M be a compact 3-manifold with (pos-
sibly empty) boundary. As every smooth compact manifold,M has a tri-
angulation T, made of a certain numbert of tetrahedra. We now show
that T can be used to treat combinatorially many interesting surfaces in
M.
A properly embedded surfaceS ⊂ M is transverse to T if it is trans-
verse to all its simplexes. In particularS does not intersect the vertices
of T, and it intersects every edge, face, and tetrahedron respectively into
a ﬁnite number of points, curves, and surfaces. Every properly embedded
surface S ⊂ M can be perturbed to be transverse toT.
Deﬁnition 9.2.23. Anormal surfaceis a properly embedded surfaceS
transverse to T that intersects every tetrahedron into triangles or squares
as in Figure 9.7.
Example 9.2.24. For every vertexv of T lying inint(M) we may take
a small sphere centred atv that intersects every incident tetrahedron in a
small triangle: we get a normal sphere. Ifv lies in ∂M we get similarly a
normal disc. A surface of this type is calledvertex-linking. Vertex-linking
spheres are not very interesting since they bound balls.
Exercise 9.2.25. A connected normal surface is vertex-linking if and
only if it consists of triangles only (no squares).


## Page 290

282 9. TOPOLOGY OF THREE-MANIFOLDS
D
S
S'a
b
∂M ∂M
Figure 9.9. We can also surger a surfaceS along a discD
touching the boundary in a segment. The result is a new
properly embedded surfaceS′.
Figure 9.10. Starting from the innermost curves in∂∆∩ S
we surger along discs so thatS∩ ∆ consists only of discs and
closed components, which we then remove.
Let S ⊂ M be a properly embedded, possibly disconnected, compact
surface. Anelementary transformationon S is one of the following moves:
• the removal of a connected component ofS contained in some
ball;
• let D ⊂ int(M) be a disc with∂D = D ∩ S: wesurger S along
D as shown in Figure 9.8;
• let D ⊂ M be a disc withD ∩ (S ∪ ∂M ) = ∂D = α ∪ β, where
α is an arc inS and β an arc in∂M as in Figure 9.9-(left): we
surger S as shown in the ﬁgure.
Every elementary transformation is local,i.e. it takes place in a ball. It
transforms S into a new surfaceS′. We ﬁx a triangulationT for M.
Proposition9.2.26. Everyproperlyembeddedsurface S ⊂ M becomes
normal after ﬁnitely many isotopies and elementary transformations.
Proof. Put S transverse to T. It intersects every tetrahedron∆ into
surfaces as in Figure 9.10-(left). The intersectionS ∩∂∆consists of closed
curves: the innermost ones bound discs in∂∆, which may be pushed a bit
inside ∆ and then used to surgerS. We do this with all curves (starting
with the innermost ones) to transformS as in Figure 9.10, so that at the
end S ∩ ∆ consists only of discs and closed surfaces. Then we remove the


## Page 291

9.2. PRIME DECOMPOSITION 283
Figure 9.11. The closed curves contained in a triangle are
the intersections of small spherical components of S with
that triangle. We just remove them.
Figure 9.12. If the boundary of a (yellow) discD intersects
an edge e of ∂∆ twice, we pick two innermost intersections,
that must be in opposite directions. There must be a red disc
as shown (exercise: use Alexander’s theorem), which can be
used to pushS in the direction indicated by the arrow. The
resulting surface is shown in the right. Ife⊂ ∂M, we cannot
push S outside ∂M: instead, we surger along the red disc.
closed surfaces: this is an elementary transformation since∆ is a ball. We
do this for every tetrahedron∆.
Now S intersects every tetrahedron∆ in discs. Consider the boundary
curve of one such disc: if it is contained in a face as in Figure 9.11-(left),
it belongs to one or two discs (depending on whether the face belongs to
∂M or not), which form a component ofS contained in a ball that can be
removed.
Suppose the boundary curve crosses twice an edge of∆: if the edge
lies in the interior ofM, we isotopeS as shown in Figure 9.12 to decrease
the number of intersections ofS with the 1-skeleton ofT; if the edge lies
in ∂M we simplify analogously by surgerying along the red disc shown in
the ﬁgure. In all cases then we go back to the ﬁrst step of the algorithm.
After ﬁnitely many steps we get a surfaceS intersecting every tetra-
hedron ∆ in discs, whose boundary curves intersect every edge of∆ at
most once. One such disc is either a triangle or a square. □


## Page 292

284 9. TOPOLOGY OF THREE-MANIFOLDS
Figure 9.13. If we cut a tetrahedron∆ along triangles and
squares we get arbitrarily many prisms with triangular or
quadrilateral basis, and at most6 other pieces (here we get
4 pyramids and two esahedra).
9.2.9. Interestingsurfacescannothavetoomanycomponents. We
know from Proposition 9.1.7 that a compact orientableM cannot contain
too many disjoint non-orientable surfaces. It can however contain arbi-
trarily many orientable surfaces: for instance, small surfaces contained in
disjoint balls. A crucial aspect of 3-manifolds theory is thatM cannot
contain arbitrarily many “interesting” surfaces, as we now see.
Two disjoint connected diﬀeomorphic surfacesΣ, Σ′ ⊂ M are parallel
if they cobound a region diﬀeomorphic toΣ × [0, 1] with Σ = Σ × 0 and
Σ′ = Σ × 1. Two parallel surfaces are obviously isotopic.
Let T beatriangulationofacompact M with(possiblyempty)bound-
ary. Lett bethenumberoftetrahedrain T andset b2 = dim H2(M, ∂M, Z2).
Lemma 9.2.27. Let S be an orientable normal surface. IfS has more
than 10t + b2 components, then two componentsΣ, Σ′ of S are parallel
and cobound aΣ × [0, 1] which is disjoint from the other components.
Proof. The complement M \ S intersects every tetrahedron ∆ into
polyhedra: therearemanyprismslyingbetweenparalleltrianglesorsquares,
and at most6 other pieces, see Figure 9.13. These at most 6 pieces are
adjacent to at most 1+1+1+1+3+3 = 10 triangles and squares.
This implies that, except at most10t of them, the components ofS
are only adjacent (on both sides) to prisms. These prisms glue to form
I-bundles. Therefore at leastb2 + 1 components of S are adjacent toI-
bundles on both sides. The twistedI-bundles are at mostb2 by Proposition
9.1.7, and each is adjacent to one surface. Therefore at least one surface
is adjacent to a productI-bundle Σ × [0, 1]. □
We get a topological corollary. A ball with holes is a 3-manifold
obtained by removing somek ⩾ 0 disjoint small open balls from a ball.


## Page 293

9.2. PRIME DECOMPOSITION 285
A sphere system for a 3-manifold M is a surface S ⊂ int(M) consisting
of disjoint spheres, such that no component ofM \ S is a ball with holes
disjoint from ∂M. (Balls with holes adjacent to spherical components of
∂M are allowed.)
Corollary 9.2.28.Let M be a compact orientable 3-manifold that does
not contain any non-separating sphere. There is aK > 0 such that every
sphere system inM contains less thanK spheres.
Proof. Pick a triangulationT of M with somet tetrahedra: we prove
that K = 10 t + b2 + 1 works, with b2 = dim H2(M, ∂M; Z2). Suppose
by contradiction that there is a sphere systemS with ⩾ K spheres. Via
isotopies and elementary transformations we transformS into a normal
surface S′.
We now examine the eﬀect of elementary transformations in detail.
No component ofS is contained in a ball, otherwise by Alexander theorem
aninnermostcomponentof M \S wouldbeaball. Thereforeanelementary
transformation cannot cancel a component ofS.
A surgery along a disc splits a sphere S0 into two spheres S1, S2.
We now prove that by substitutingS0 with either S1 or S2 we still get a
sphere system. If we pushS1 and S2 away fromS0 the surfaces S0, S1, S2
altogether bound a ball with two holesB.
By our hypothesis onM the spheres S0, S1, and S2 are separating.
Let Ni be the component ofM \ (S0 ∪ S1 ∪ S2) adjacent toSi distinct from
B, for i = 0 , 1, 2. If both N1, N2 are balls with holes disjoint from∂M,
then N1 ∪ N2 ∪ B also is, which is excluded. Therefore one, sayN1, is not
a ball with holes disjoint from∂M. On the other side, ifN2 ∪ B ∪ N0 were
a ball with holes disjoint from∂M, then N0 would also be (by Alexander’s
theorem), which is excluded. Therefore by substitutingS0 with S1 we still
get a sphere system.
This proves that the ﬁnal normal surfaceS′ contains a sphere system
with the same number⩾ K of components asS. Lemma 9.2.27 gives a
contradiction. □
9.2.10. Prime decomposition. We now show that the connected
sum operation on oriented three-manifolds behaves like the product of
natural numbers: every object decomposes uniquely into prime factors.
Theorem9.2.29. Everycompactoriented3-manifold M with(possibly
empty) boundary decomposes into prime manifolds:
M = M1# . . .#Mk
Thislistofprimefactorsisuniqueuptopermutationsandadding/removing
copies of S3.
Proof. We ﬁrst show the existence of a decomposition. IfM con-
tains a non-separating sphere, then the proof of Proposition 9.2.14 shows


## Page 294

286 9. TOPOLOGY OF THREE-MANIFOLDS
B
N1
N2
Figure 9.14. A reducing set of spheres (red) for M =
M1#M2#(S2× S1). Here B is a ball with three holes and
Ni is Mi with one hole.
that M = M′#(S2 × S1). Since H1(M) = H1(M′) ⊕ Z, up to factoring
ﬁnitely many copies ofS2 × S1 we may suppose that every sphere inM is
separating.
If M is prime we are done. If not, it decomposes asM = M1#M2. We
keep decomposing each factor until all factors are prime: this process must
end, because a decompositionM = M1# . . .#Mk gives rise to a system
of k − 1 spheres, and k cannot be arbitrarily big by Corollary 9.2.28.
We turn to uniqueness. Let
M = M1# . . .#Mk#h(S2 × S1), M = M′
1# . . .#M′
k′#h′(S2 × S1)
be two prime decompositions withMi , M′
j ̸= S2 × S1, so Mi , M′
j are irre-
ducible for alli , j. We say that a setS ⊂ M of disjoint spheres is areducing
set of spheresfor the decomposition M = M1# . . .#Mk#h(S2 × S1) if
M \ S consists of precisely oneMi with some holes for eachi, and some
balls with holes disjoint from∂M. An example is drawn in Figure 9.14. In
general, we may constructS by taking the spheres of the prime decom-
position, plus one non-separating sphere inside eachS2 × S1 summand.
Similarly, letS′ be a reducing set of spheres for the other decomposition.
The ﬁrst observation we make is that if we add toS any sphere Σ
disjoint from S, then we still get a reducing set of spheres for the same
decomposition as before. This is because Σ is contained in a holedMi
or S3, and sinceMi is irreducible Σ bounds a ballB there. Therefore by
adding Σwestillgetthesameholed Mi, plusapossiblyholed(if B∩S ̸= ∅)
ball B.
We assume S and S′ intersect transversely in circles and pick an in-
nermost circle in a component ofS bounding a discD ⊂ S. We surgerS′
along D, thus substituting a componentS′
0 of S′ with two spheresS′
1 ⊔ S′
2.


## Page 295

9.2. PRIME DECOMPOSITION 287
We check that the result is another sphere system for the same decom-
position. We isotope the spheresS′
0, S′
1, S′
2 so that they are disjoint and
cobound a ball with two holesB2: the systemS′ ⊔ S′
1 ⊔ S′
2 is still reducing
by the observation above. The removal ofS′
0 then adds B2 to the outside
of S′
0, and this is equivalent to making one more hole there.
After ﬁnitely many surgeries we getS ∩ S′ = ∅. By the same obser-
vation above S ∪ S′ is a reducing set of spheres for both decompositions:
therefore the piecesMi and M′
j of the decompositions are pairwise diﬀeo-
morphic.
Finally we must haveh = h′ since M = N#h(S2 × S1) = N#h′(S2 ×
S1) and H1(M) = H1(N) ⊕ Zh = H1(N) ⊕ Zh′
. □
This important result is known as thePrime decomposition Theorem
for 3-manifolds: the existence of a decomposition was proved by Kneser
[33] in 1929, and its uniqueness by Milnor [41] in 1962. In light of this
result, topologists have since long restricted their attention to prime 3-
manifolds, or almost equivalently to irreducible 3-manifolds.
The strategy of cutting canonically a three-manifold along surfaces
has proved successful with spheres, so we now try to do the same with
other surfaces. We start by studying properly embedded discs, which of
course occur only in manifolds with boundary. It is tempting to guess that
discs should behave roughly like spheres, because by doubling a 3-manifold
along its boundary we transform properly embedded discs into spheres. We
now see that this is indeed the case. As for spheres, we need to distinguish
the interesting ones, that we callessential, from the others.
9.2.11. Essential discs. Let M be a compact 3-manifold with (possi-
bly empty) boundary. A properly embedded surfaceS ⊂ M is ∂-parallel if
it is obtained by slightly pushing insideM the interior of a compact surface
S′ ⊂ ∂M, possibly with boundary.
In what followsD and S are properly embedded. We say that:
• a sphere S ⊂ M is essential if it does not bound a ball,
• a disc D ⊂ M is essential if it is not∂-parallel.
Now, the manifoldM is:
• irreducible if it does not contain essential spheres, and
• ∂-irreducible if it does not contain essential discs.
To warm up, we show the following. Asolid torusis a handlebody of
genus 1, that is a three-manifold diﬀeomorphic toD × S1.
Proposition 9.2.30. Let M be a compact, irreducible, orientable 3-
manifold with boundary, and letD ⊂ M be an essential disc. LetΣ ⊂ ∂M
be the boundary component containing∂D. Then:
• the curve ∂D is non-trivial inΣ;
• if Σ is a torus thenM is a solid torus.


## Page 296

288 9. TOPOLOGY OF THREE-MANIFOLDS
Proof. If ∂D bounds a disc D′ ⊂ Σ then D ∪ D′ is a sphere, which
bounds a ball because M is irreducible; this ball furnishes a parallelism
between D and D′ and hence D is ∂-parallel, a contradiction.
If Σ is a torus, by surgeryingΣ along D we get a sphere which must
bound a ball B. Therefore M is obtained by adding a one-handle toB,
that is it is a solid torus. □
9.2.12. Decomposition along discs. We now show that essential
discs behave roughly like essential spheres, in the sense that there is a
kind of prime decomposition theorem also for discs. After stating and
proving this theorem, we will essentially forget about essential spheres and
discs and focus on the 3-manifolds that do not contain them.
Let M be a compact 3-manifold with (possibly empty) boundary. A
disc systemin M is a set of pairwise disjoint non-parallel essential discs.
Proposition 9.2.31. There is aK > 0 such that every disc system in
M cannot contain more thanK discs.
Proof. The proof is analogous to that of Corollary 9.2.28 □
We now want to cut irreducible manifolds along essential discs.
Remark 9.2.32. The opposite operation of cutting a manifold along
a properly embedded disc is a 1-handle addition.
We now state the analogue of Theorem 9.2.29 in this context. Note
that M isirreduciblebyhypothesis: wehavealreadyeliminatedtheessential
spheres, and we now remove the essential discs.
Theorem 9.2.33. Every compact oriented irreducible 3-manifoldM is
obtained by adding 1-handles to a ﬁnite list
M1, . . . , Mk
of connected irreducible and∂-irreducible 3-manifolds. The list is unique
up to permutations and adding/removing balls.
Proof. The proof is similar to Theorem 9.2.29. If we cutM along a
maximal disc system we get some connected manifoldsM1, . . . , Mk. Each
Mi is ∂-irreducible because the disc system is maximal, and it is irreducible
because every sphere inMi ⊂ M bounds a ballB in M, andB is necessarily
contained in Mi.
We prove uniqueness. Pick two sets of discsS, S′ ⊂ M such that by
cutting along each we get irreducible and∂-irreducible components. We
prove that these components are the same up to adding/removing balls.
We assume thatS and S′ intersect transversely.
A circleS ∩ S′ which is innermost with respect toS is bounded by two
sub-discs D ⊂ S and D′ ⊂ S′, which together form a sphere: this sphere
in turn bounds a ball (becauseM is irreducible) as in Figure 9.15. We


## Page 297

9.2. PRIME DECOMPOSITION 289
D D'
S S' S S'
D'
Figure 9.15. The discs D and D′ form a sphere which
bounds a ball since M is irreducible. We can use this ball
to isotope S′ away fromS.
can use the ball to isotopeS′ away fromS and reduce the intersections in
S ∩ S′. After ﬁnitely many isotopies there are no circles inS ∩ S′.
We are left to consider the arcs inS ∩ S′. We end precisely as in
Theorem 9.2.29. We observe that by adding more discs toS or S′ we get
a set of discs that∂-reduces M into the same list ofMi’s, plus possibly
some balls.
Thanks to an innermost argument, we may surger some discD0 ⊂ S
along an arc in D0 ∩ S′ and transform it into two discsD1 ⊔ D2, both
disjoint from S and with less intersections withS′. The set S ⊔ D1 ⊔ D2
is still a reducing set for theMi’s. If we removeD0 from this new system,
in the complement we only remove a ball: hence we can replaceD0 with
D1 ⊔ D2. After ﬁnitely many steps we getS ∩ S′ = ∅ and thereforeS ∪ S′
is a reducing set producing the sameMi’s of S and S′, up to balls. □
9.2.13. Projectiveplanes. Thepreviousdiscussionsshowhowtodeal
with spheres and discs, and we now turn to the only remaining compact
surface with χ > 0: the projective plane. There is not much to say about
it.
Proposition 9.2.34. Every compact irreducible orientable 3-manifold
M that contains RP2 is diﬀeomorphic toRP3.
Proof. The orientable M contains the orientable tubular neighbour-
hood N = RP2 ×
∼
I of RP2. The boundary ∂N is the orientable coverS2
of RP2. Since M is irreducible, the sphere∂N bounds a ball B. There-
fore M is uniquely determined as the manifold obtained by capping oﬀ the
boundary sphere ofN.
The manifoldRP3 is irreducible (because its coverS3 is) and contains
RP2, hence we must haveM = RP3. □
This proposition does not hold for non-orientable three-manifolds,
which might containRP2 with a product neighbourhoodRP2 × I. These
cases are diﬃcult to deal with, so one typically excludes thema prioriby


## Page 298

290 9. TOPOLOGY OF THREE-MANIFOLDS
requiring the manifold to beRP2-irreducible, which means that it does not
contain two-sided projective planes.
9.3. Incompressible surfaces
We have proved that every compact oriented 3-manifold decomposes
along essential spheres and discs, into some canonical pieces that do not
contain essential spheres or discs anymore.
We would like to pursue this strategy with the next simplest surfaces,
namely tori and annuli. To this purpose we deﬁne the important notion of
incompressible surface in a three-manifold, which applies to all surfaces of
non-positive Euler characteristic.
9.3.1. Incompressible surfaces. Throughout all this section M de-
notes a compact orientable 3-manifold with (possibly empty) boundary.
Let S ⊂ M be a properly embedded orientable surface. Acompressing
disc for S is a disc D ⊂ M with ∂D = D ∩ S, such that ∂D does not
bound a disc inS. With this hypothesis, the surgery in Figure 9.8 is called
a compression: it transformS into a new surfaceS′ ⊂ M which is simpler
than S.
Proposition 9.3.1. The surface S′ may have one or two components
S′
i, and χ(S′
i ) > χ(S) for each component.
Proof. We have χ(S′) = χ(S) + 2. If S′ has one component we are
done, so supposeS′ = S′
1 ⊔ S′
2. Since ∂D did not bound a disc inS, noS′
i
is a sphere, henceχ(S′
i ) ⩽ 1 that implies χ(S′
i ) > χ(S) for i = 1, 2. □
A properly embedded connected orientable compact surfaceS ⊂ M
with χ(S) ⩽ 0 is compressible if it has a compressing disc, andincom-
pressible otherwise. See Figure 9.16-(top).
Corollary 9.3.2. Let S ⊂ M be any properly embedded orientable
surface. After compressing it a ﬁnite number of times it transforms into a
disjoint union of spheres, discs, and incompressible surfaces.
Proof. We compress S as much as we can; after ﬁnitely many steps
we must stop because of Proposition 9.3.1. □
Remark 9.3.3. By deﬁnition, an orientable 3-manifold is∂-irreducible
if and only if its boundary consists of incompressible components. (Strictly
speaking, a boundary component is not properly embedded and hence can-
not be incompressible: we implicitly push it inside the 3-manifold.)
A simple incompressibility criterion is the following.
Proposition 9.3.4. Let S ⊂ M be an orientable, connected, properly
embedded surface withχ(S) ⩽ 0. If the mapπ1(S) → π1(M) induced by
inclusion is injective, thenS is incompressible.


## Page 299

9.3. INCOMPRESSIBLE SURFACES 291
D
S
D
S
∂M
S
D D'
D
S
D'
Figure 9.16. A surface S is incompressible ( ∂-
incompressible) if the existence of a disc D as in the
top-left (bottom-left) picture implies the existence of
another disc D′ ⊂ S as in the top-right (bottom-right)
picture. If in additionM is irreducible (∂-irreducible) the two
discs D and D′ form a sphere (disc) which bounds a ball (is
∂-parallel), and hence by substitutingD′ with D we get two
isotopic surfaces.
Proof. Suppose that a discD compresses S. Its boundary ∂D is a
non-trivial element in π1(S) because it does not bound a disc inS by
Proposition 6.3.5, but is clearly trivial inπ1(M): a contradiction. □
The converse is also true, but its proof is much harder! We will com-
plete it at the end of this chapter. For the moment we content ourselves
with the following.
Proposition 9.3.5. If S ⊂ M is incompressible, every component of
∂S is non-trivial in∂M.
Proof. If a component of∂S is trivial in∂M, it bounds a discD ⊂ ∂M
there. By taking an innermost one we getD ∩ S = ∂D, and by pushingD
inside M we ﬁnd a compressing disc forS. □
9.3.2. Tori. The ﬁrst closed surface to look at is the torus.
Proposition 9.3.6. Let T ⊂ M be a torus in an irreducible 3-manifold.
One of the following holds:
(1) T is incompressible,
(2) T bounds a solid torus,
(3) T is contained in a ball.
Proof. If T is not incompressible, it compresses along a discD. The
result of the compression is necessarily a sphereS ⊂ M which bounds a
ball B since M is irreducible. IfB is disjoint fromT, thenT bounds a solid


## Page 300

292 9. TOPOLOGY OF THREE-MANIFOLDS
D
B
T
D
B
T
Figure9.17. Atorusinanirreducible3-manifoldiseitherin-
compressible, or it bounds a solid torus (left), or is contained
in a ball (right).
torus as in Fig.9.17-(left). IfB contains T, then case (3) holds as shown
in Figure 9.17-(right). □
If M = S3 the case (3) can be excluded: ifT is contained in a ballB,
then it bounds a solid torus “on the outside” using the complementary ball
S3 \ B. We will also exclude the case (1) when we show thatS3 contains
no incompressible surfaces.
9.3.3. ∂-incompressible surfaces.There is of course also a∂-version
of incompressibility. LetS ⊂ M be a properly embedded orientable surface
ina3-manifold M. A ∂-compressingdisc for S isadisc D with ∂D = α∪β,
where α lies in S and β in ∂M as in Figure 9.9-(left); we also require that
there is no sub-discD′ ⊂ S with ∂D′ = α ∪ β′ and β′ ⊂ ∂S. The move
in Figure 9.9 is a∂-compression and transforms S into a surfaceS′ ⊂ M
simpler than S:
Proposition 9.3.7. The surface S′ may have one or two components
S′
i, and χ(S′
i ) > χ(S) for each component.
Proof. We have χ(S′) = χ(S) + 1. If S′ has one component we are
done, so supposeS′ = S′
1 ⊔ S′
2. Since α did not bound a disc inS, no S′
i
is a disc, henceχ(S′
i ) ⩽ 0 that implies χ(S′
i ) > χ(S) for i = 1, 2. □
A properly embedded connected orientable compact S ⊂ M with
χ(S) ⩽ 0 is ∂-compressible if it has a ∂-compressing disc, and it is∂-
incompressible otherwise. See Figure 9.16.
Corollary 9.3.8. Let S ⊂ M be any properly embedded orientable
surface. After ∂-compressing it a ﬁnite number of times it transforms into
a disjoint union of spheres, discs, and∂-incompressible surfaces.
9.3.4. Annuli. The ﬁrst non-closed surface to look at is the annulus.
Let atube be the tubular neighbourhood of a properly embedded arc.


## Page 301

9.3. INCOMPRESSIBLE SURFACES 293
Figure9.18. Anannulus Ainanirreducibleand ∂-irreducible
3-manifoldiseitherincompressibleand ∂-incompressible, oris
parallel to an annulus in∂M (left), or bounds a tube (centre),
or is contained in a ball intersecting∂M in a disc (right).
Proposition 9.3.9. Let A ⊂ M be a properly embedded annulus in an
irreducible and ∂-irreducible 3-manifold. One of the following holds:
(1) A is incompressible and∂-incompressible,
(2) A bounds a tube,
(3) A is parallel to an annulus in∂M,
(4) A is contained in a ballB intersecting ∂M in a disc.
Proof. If A compresses along a discD, it transforms into two discs
that are parallel to two discsD1, D2 ⊂ ∂M since M is ∂-irreducible. If
D1 ∩ D2 = ∅ then A bounds a tube as in Figure 9.18-(right); ifD1 ⊂ D2
then A is contained in a ballB intersecting ∂M in D2.
If A ∂ -compresses along a disc D, it transforms into a disc which
is again ∂-parallel and hence A is as in Figure 9.18-(left) or bounds a
tube. □
As a corollary, we get a simple criterion for detecting incompressible
and ∂-incompressible annuli:
Corollary 9.3.10. Let A ⊂ M be a properly embedded annulus in
an irreducible and∂-irreducible 3-manifold. If the components of∂A are
non-trivial and non-parallel in ∂M, the annulus A is incompressible and
∂-incompressible.
9.3.5. Handlebodies. We study some examples. We investigate the
incompressible and ∂-incompressible surfaces in the three-sphere and in
the handlebodies. Recall that a (∂)-incompressible surface is always com-
pact, orientable, connected, properly embedded, and with non-positive Eu-
ler characteristic by hypothesis.
Proposition 9.3.11. There are no incompressible surfaces inR3.
Proof. Let S be a surface in R3. By applying as is the proof of
Alexander Theorem 9.2.10 we ﬁnd thatS transforms into spheres after
surgerying along discs. ThereforeS compresses somewhere. □


## Page 302

294 9. TOPOLOGY OF THREE-MANIFOLDS
A high genus closed surface may be embedded inR3 in a rather com-
plicated way (which may be hard to imagine) and the proposition says that
no matter how intricate the surface is, there is always a compressing disc
somewhere that one can use to simplify the picture. After ﬁnitely many
compressionsthecomplicatedsurfaceisatomisedintosometrivialspheres.
Corollary 9.3.12. There are no incompressible surfaces inS3.
Corollary 9.3.13. There are no incompressible surfaces in the ballB.
Proof. Use Proposition 9.3.5. □
Corollary 9.3.14. Every torus in S3 bounds a solid torus and every
properly embedded annulus inB bounds a tube.
Proof. Apply Propositions 9.3.6 and 9.3.9. Since the manifold isS3
or B, the cases (3) or (4) easily imply (2). □
The solid torus inS3 and the tube inB may of course be knotted!
We now turn to handlebodies. Recall that a handlebody of genusg ≥ 1 is
irreducible by Corollary 9.2.20, but it is clearly not∂-irreducible.
Proposition 9.3.15 (Handlebodies).The genus-g handlebody Hg con-
tains no incompressible and∂-incompressible surfaces.
Proof. Suppose that S ⊂ Hg is incompressible and∂-incompressible.
Pick disjoint essential discsD1, . . . , Dg that cutHg into a ballB. Put S in
transverse position with respect to⊔i Di, so that the intersection ofS with
⊔i Di consists of circles and properly embedded arcs. SinceHg is irreducible
and S is incompressible and ∂-incompressible, all these intersections can
be removed by an isotopy ofS, as explained below. Then Corollary 9.3.13
gives a contradiction.
The intersections removal goes as follows. Letα be one arc or circle
in S ∩ Dj. Since S is incompressible and∂-incompressible, there is a disc
D′ ⊂ S bounded byα (if α is a circle) or byα ∪ β with β ⊂ ∂S (if α is an
arc) as in Figure 9.16. After substitutingα with an innermost intersection
of D′ with ⊔i Di we may suppose thatD′ is entirely contained inB and
hence we may eliminateα with an isotopy as explained in Figure 9.16.□
We can be more speciﬁc on the solid torusH1.
Proposition 9.3.16. Every incompressible surface in a solid torus is a
∂-parallel annulus.
Proof. Every incompressible surface S ⊂ H1 is ∂-compressible by
Proposition 9.3.15. If we ∂-compress it, we get either a disc or an in-
compressible surface again. Therefore S is constructed iteratively from
some discs by a sequence of moves opposite to the∂-compression, that
produce incompressible surfaces at each step. One easily sees that the
only incompressible surface that this move can produce at the ﬁrst step is
a ∂-parallel annulus (from a single disc), and then one gets stuck. □


## Page 303

9.3. INCOMPRESSIBLE SURFACES 295
D
e
S
e
S
Figure 9.19. A move that decreases the intersection num-
ber of S with the vertical edges (left). The surfaceS inter-
sects every prism into horizontal triangles (centre) or vertical
rectangles (right).
Warning9.3.17. Thehandlebody H2 containsmanycomplicatedprop-
erlyembeddedincompressiblesurfaces! However,theseare ∂-compressible.
The main diﬀerence betweenH1 and H2 is that π1(H2) = Z ∗ Z is a free
group of rank two and contains many free groups of arbitrarily high rank,
so there is a lot of space forπ1-injective incompressible surfaces inH2 with
boundary (whose fundamental group is free).
9.3.6. Line bundles. We now turn to product line bundles. Recall
that Sg is the closed orientable surface of genusg.
Proposition 9.3.18 (Line bundles). Fix g ⩾ 1. The product M =
Sg × [−1, 1] is irreducible and ∂-irreducible. The incompressible and ∂-
incompressible surfaces inM are precisely the following (up to isotopy):
• the horizontal surface Sg × 0,
• a vertical annulus γ × [−1, 1] for each non-trivial simple closed
curve γ ⊂ Sg.
Proof. We know that M is irreducible by Proposition 9.2.21. The
horizontal surface and the vertical annuli are both incompressible and∂-
incompressible by Propositions 9.3.4 and 9.3.10. Propositions 9.3.4 also
shows that M is ∂-irreducible.
We now prove that every incompressible and∂-incompressible S is
either vertical or horizontal, up to isotopy. We use a version of normal
surface theory, with prisms instead of tetrahedra.
Atriangulation ∆of Sg determinesadecompositionof Sg×[−1, 1]into
prisms. Everyvertex v of ∆givesrisetoaverticaledge e = v ×[−1, 1]. We
suppose that S is transverse to the prisms and has minimum intersection
number with the vertical edges. The intersection of S with a vertical
rectangular face consists of arcs and circles. The simpliﬁcation argument
described below shows that after an isotopy we get only horizontal or
vertical arcs (that is, arcs joining opposite sides of the rectangle). By


## Page 304

296 9. TOPOLOGY OF THREE-MANIFOLDS
further isotopies we can also suppose thatS intersects every horizontal
triangle of the prism into arcs joining distinct sides. ThereforeS intersects
necessarily every prism into either horizontal triangles or vertical rectangles
as in Figure 9.19-(centre) and (right). These pieces glue up to give a
horizontal or vertical surface.
Here is the simpliﬁcation argument. There cannot be arcs with end-
points in two consecutive edges, because they could be removed by an iso-
topy as in Figure 9.19-(left) contradicting minimality. Analogously there
are no arcs with both endpoints in the same vertical edge. Circles and arcs
with endpoints in the same horizontal edge are removed as in the proof of
Proposition 9.3.15. □
9.4. Haken manifolds
There are two classes of irreducible closed three-manifolds: those that
contain incompressible surfaces, and those that do not. Both classes are
very important and contain a wealth of interesting manifolds.
The manifolds belonging to the ﬁrst class are calledHaken manifolds
and are somehow easier to study, because they can be cut into balls via a
standardprocedurecalled hierarchy: wecutthemanifoldalonganessential
surface, then along another, and we iterate until we get balls. We study
thesemanifoldshere. WealsoprovetheconverseofProposition9.3.4,that
is that a closed surface is incompressible if and only if it isπ1-injective, see
Theorem 9.4.14.
9.4.1. Introduction. If not otherwise mentioned, all the 3-manifolds
M we will consider in this section will be connected, compact, oriented and
with (possibly empty) boundary. We introduce a deﬁnition.
Deﬁnition 9.4.1. A Haken manifold is a compact, connected, ori-
ented 3-manifold M with (possibly empty) boundary, which is irreducible,
∂-irreducible, and contains an incompressible and∂-incompressible surface.
The reader should not be frightened by the abundance of adjectives:
this deﬁnition is really clever because it summarises various reasonable
hypothesis in a unique word. The rest of this chapter is mainly devoted to
the study of Haken manifolds. We start by looking at their boundaries.
Proposition 9.4.2.Every boundary componentX of a Haken manifold
M has χ(X) ⩽ 0 and is incompressible.
Proof. No component X of ∂M is a sphere: if it were so, it would
bound a ballB and we would haveM = B, contradicting Corollary 9.3.13.
Hence χ(X) ⩽ 0 and X is incompressible becauseM is ∂-irreducible. □
We now prove that there are plenty of Haken manifolds. We start
with a general proposition.


## Page 305

9.4. HAKEN MANIFOLDS 297
Proposition 9.4.3. Let M be an oriented, compact, irreducible, and
∂-irreducible 3-manifold with (possibly empty) boundary. Every non-trivial
homology class α ∈ H2(M, ∂M; Z) is represented by a disjoint union of
incompressible and ∂-incompressible oriented surfaces.
Proof. Every class α is represented by a properly embedded oriented
surface S by Proposition 1.7.16. A compression as in Figure 9.8 and 9.9
does not alter the homology class of the surface: indeed in homology we
have S′ − S = ∂B where B = D × [−1, 1] is a tubular neighbourhood of
the compressing discD. Hence [S′] = [ S] = α.
We compressS until its connected components are either incompress-
ible and∂-incompressible surfaces, discs, or spheres. SinceM is irreducible
and ∂-irreducible, discs and spheres bound balls and are hence homologi-
cally trivial, so they can be removed. □
Corollary 9.4.4. Let M be oriented, compact, irreducible, and ∂-
irreducible. If H2(M, ∂M; Z) ̸= {e} then M is Haken.
Corollary 9.4.5. Let M be oriented, compact, irreducible, and ∂-
irreducible. If ∂M ̸= ∅ and M ̸= B, then M is Haken.
Proof. If ∂M contains a sphere, it bounds a ballB and henceM = B.
Otherwise H1(∂M ) has positive rank, and hence H2(M, ∂M) = H1(M)
also has positive rank by Corollary 9.1.5. □
We recall that every compact orientable 3-manifold decomposes along
spheres and disc into irreducible and∂-irreducible pieces. If one such piece
has non-empty boundary then either it is ball, or it is Haken.
The following lemma will be useful soon. It says that every Haken
manifold contains an interesting “spanning” surfaceS, that touches all the
boundary components (the spanning surface need not to be connected).
Lemma 9.4.6. Every Haken manifoldM contains an oriented surface
S, whose components are incompressible and∂-incompressible, such that
[∂S ∩ X] ∈ H1(X, Z) is non-trivial for every boundary componentX of M.
Proof. We have∂M = X1 ⊔ . . . ⊔ Xk with χ(Xi ) ⩽ 0 for alli. Propo-
sition 9.1.4 says that the image of
∂ : H2(M, ∂M, Z) − →H1(∂M, Z)
is a lagrangian subgroupL of maximal rank. We have
H1(∂M, Z) = ⊕k
i=1H1(Xi , Z).
The decomposition is orthogonal with respect to the symplectic intersec-
tion form ω. There is an α ∈ L whose projection to eachH1(Xi , Z) is
non-trivial: if not, the spaceL would be ω-orthogonal to someH1(Xi , Z)
andhencecontainedinasmallersymplecticsubspace, acontradictionsince
L has maximal rank. Pick any incompressible and∂-incompressible surface
S such that ∂[S] = α. □


## Page 306

298 9. TOPOLOGY OF THREE-MANIFOLDS
9.4.2. Normal surfaces. On Haken manifolds, incompressible sur-
faces are eﬃciently detected by normal surfaces.
Proposition 9.4.7. Let M be Haken andT be a triangulation forM.
Every compact surface S ⊂ M whose components are all incompressible
and ∂-incompressible is isotopic to a normal surface.
Proof. We know thatS becomes normal after surgeries as in Figure
9.8 or Figure 9.9. These surgeries are actually isotopies sinceS is incom-
pressible and ∂-incompressible, and M is irreducible and∂-irreducible (see
Figure 9.16). □
Note that in the proof of Proposition 9.4.7, as in many other proofs,
it is crucial that M be irreducible and ∂-irreducible. We can now apply
Lemma 9.2.27 to get the following.
Corollary 9.4.8. Let M be a Haken manifold. There is aK > 0 such
that every set S of pairwise disjoint and non-parallel incompressible and
∂-incompressible surfaces inM consists of at mostK elements.
Our aim is now to cut a Haken manifold iteratively along incompress-
ible and∂-incompressible surfaces. The two-dimensional analogue to keep
in mind is the following: every surfaceSg of genus ⩾ 2 can be cut into
pairs-of-pants; a pair-of-pants is a quite simple surface, but we are still
not satisﬁed and we further cut it along three arcs into two discs (two
hexagons). We have constructed a two-step decomposition of Sg into
discs: this is what we would like to extend from two to three dimensions.
9.4.3. Cutting along surfaces.When we cut a 3-manifold along an
incompressible surface, some nice properties of the manifold are preserved.
Proposition 9.4.9. Let M be compact and irreducible, andS ⊂ M be
either an essential disc or an incompressible surface. LetM′ be obtained
by cutting M along S. The following holds:
• the manifold M′ is irreducible;
• a closed Σ ⊂ M′ is incompressible inM′ ⇐ ⇒it is so inM.
Proof. We prove that M′ is irreducible. Let Σ ⊂ M′ be a sphere.
Since M is irreducible, the sphereΣ bounds a ball B ⊂ M. The ball B
cannot containS because all surfaces in a ball are compressible. Therefore
B ⊂ M′ and M′ is irreducible.
To prove the second assertion, we show thatΣhas a compressing disc
D in M if and only if it has one inM′. If D lies inM′ then of course it lies
also in M. Conversely, supposeD lies in M. Put D in transverse position
with respect toS and pick an innermost intersection circle inD, bounding
a disc D′ ⊂ D. Since D′ cannot compress S, and sinceM is irreducible,
the disc D′ can be isotoped away fromS. This simpliﬁesD ∩ S and after
ﬁnitely many steps we getD ∩ S = ∅ and hence D ⊂ M′. □


## Page 307

9.4. HAKEN MANIFOLDS 299
Corollary 9.4.10.If we cut a Haken 3-manifold along a closed incom-
pressible surface, we get a disjoint union of Haken 3-manifolds.
The following consequence is also interesting.
Corollary 9.4.11. Let M be compact with non-empty boundary. If
M is irreducible, then either it is a handlebody or it contains a closed
incompressible surface.
Proof. The manifold M decomposes along essential discs into mani-
folds M1, . . . , Mk that are irreducible and∂-irreducible. If everyMi is a ball
then M is a handlebody. IfMi is not a ball, the closed surfaceS = ∂Mi is
not a sphere and is incompressible inMi, and hence also inM by Proposi-
tion 9.4.9. □
9.4.4. Hierarchies. We want to use incompressible surfaces to cut
every Haken manifold into simpler pieces. The procedure goes as follows.
A hierarchy for a Haken 3-manifoldM is a sequence of 3-manifolds
M = M0
S0
⇝ M1
S1
⇝ M2
S2
⇝ . . .
Sh−1
⇝ Mh
where each Mi+1 is obtained cuttingMi along a properly embedded (pos-
sibly disconnected) surfaceSi ⊂ Mi, such that the following holds:
• every component ofSi is an incompressible and∂-incompressible
surface or an essential disc, for alli;
• the ﬁnal manifoldMh consists of balls.
The number h is the height of the hierarchy. We now show that every
Haken manifold can be “atomised” into balls in three steps.
Theorem 9.4.12. Every Haken manifold has a hierarchy of height3.
Proof. Let S0 be a maximal family of pairwise disjoint and non-parallel
closed incompressible surfaces inM, which exists by Corollary 9.4.8. We
cut M0 = M along S0 and get M1.
Every connected componentM i
1 of M1 is Haken by Corollary 9.4.10.
By Lemma 9.4.6 for everyi there is a “spanning” surfaceSi
1 ⊂ M i
1 made
of incompressible and∂-incompressible components that intersects every
boundary component ofM i
1. We cutM1 along the spanningS1 = ⊔Si
1 and
get a new manifoldM2.
We now prove that M2 contains no closed incompressible surface.
Indeed, ifΣ ⊂ M2 were closed and incompressible, then it would be so also
in M by Proposition 9.4.9. SinceS0 is maximal, the surfaceΣ would be
parallel to a component ofS0, that is it would cobound aΣ × [0, 1] with it.
Since the spanning surfaceS1 intersects all the boundary components of
M1, acomponentof S1 wouldbecontainedin Σ×[0, 1]andwouldintersect
the boundary only on the side ofS0: this is excluded by Proposition 9.3.18
(productsdonotcontainincompressibleand ∂-incompressiblesurfaceswith
boundary only on one side).


## Page 308

300 9. TOPOLOGY OF THREE-MANIFOLDS
S2
S0
S1
S2S1
S0
Figure 9.20. The strataS0, S1, andS2 intersect in vertices
(left). The boundary of each ballB⊂ M2 is tessellated into
domains belonging toS0, S1, orS2. Three of them intersect
at a 3-valent vertex (right).
Every component ofM2 is a handlebody by Corollary 9.4.11. We cut
it along a setS2 of essential discs to get balls. □
Hierarchies may be used to prove theorems on Haken manifolds. We
will now use them to prove that incompressible surfaces must be π1-
injective: we need a preliminary discussion and a lemma.
In our hierarchy of height3, the surfaces inS0 are closed, the span-
ning surfaces in S1 have boundary, andS2 consists of discs. To simplify
notations, we redeﬁneS0 as ∂M ∪ S0.
It is convenient to consider all the surfacesS0, S1, and S2 inside M,
without cutting M along them. With this perspective ∂S1 is glued to
S0 and ∂S2 is glued to S0 ∪ S1, via transverse maps. Every intersection
S0 ∩S1 ∩S2 is avertex as in Figure 9.20-(left). The spaceX = S0 ∪S1 ∪S2
is a two-dimensional cell complex whose complement inM is a union of
open balls: such an objectX is usually called aspine for M.
We say that our hierarchy of height3 is minimal if the essential discs
in S2 are chosen to minimise the total number of vertices. We can of
course suppose that the hierarchy is minimal.
The ﬁnal manifold M3 is the abstract closure ofM \ (S0 ∪ S1 ∪ S2)
and consists of balls. The boundary of every such ballB is tessellated into
domains belonging toS0, S1, or S2. Three domains intersect at 3-valent
vertices as in Figure 9.20-(right). We say thatB isessential if every simple
closed curve γ ⊂ ∂B transverse to the tessellation and intersecting⩽ 3
domains is the boundary of a discD ⊂ ∂B intersecting only these domains:
see Figure 9.21.
Lemma9.4.13. Ifthehierarchyisminimal, everyballin M3 isessential.
Proof. Let γ ⊂ ∂B intersect k ⩽ 3 domains. The curve γ obviously
bounds a properly embedded discD′ ⊂ B. If k = 1, the curve is entirely
contained in Si for some i. Since S0 and S1 are incompressible and S2
consists of discs, the curve γ bounds a disc D also in Si. Since S1 is


## Page 309

9.4. HAKEN MANIFOLDS 301
γ γ
D
γ γ
D
γ γ
D
Figure 9.21. If γ intersects at most three domains, it
bounds a disc D intersecting only these domains, as shown
here.
γ γ
D
γ
D
Figure 9.22. By minimality the region inS2 is incident to a
single vertex and we can slideγ through it. Then we resume
to the k = 2 case.
incompressibleand S2 consistsofessentialdiscs, theboundarycomponents
of Sj with j > i are not attached in the interior ofD, so D is entirely
contained in the domain containingγ and we are done.
If k = 2 , the curve γ is contained in Si ∪ Sj for some i < j . If
(i , j) = (0 , 1) we use that S1 is ∂-incompressible to get a discD as in
Figure 9.21-(top-right). If j = 2, then γ cuts a disc inS2 into two discs
D1 ∪ D2.
Wehavethreehalf-discs D′, D1, D2 intersectinginanarc,allcontained
in a handlebodyH ⊂ M2. Recall thatH \ S2 consists of balls. If we replace
D1 ∪ D2 by either D1 ∪ D′ or D2 ∪ D′ (say, the ﬁrst) we still get a disc
system that cutsH into balls, and hence another hierarchy. By minimality
D2 = D is adjacent to no vertices,i.e. it is as in Figure 9.21-(top-right)
and we are done.
The case k = 3 is analogous: the curveγ cuts a disc inS2 into two
parts D1 ∪ D2 and we may replace it withD1 ∪ D′. By minimality D2 is
incident to at most one vertexv: we isotope γ through v as in Figure
9.22, and then conclude using thek = 2 case. □


## Page 310

302 9. TOPOLOGY OF THREE-MANIFOLDS
1
1
2
1
1
1
1
2
2
1
Figure 9.23. The counterimage of S0∪ S1∪ S2 along f.
An edge with labeli goes to Si (unlabelled edges go toS0).
Here there is a0-gon (yellow) and three2-gons (green). The
correct notion ofk-gon should be clear from the picture.
9.4.5. Dehn’sLemma. Proposition9.3.4saysthatanorientablecon-
nected properly embedded π1-injective surface S ⊂ M with χ(S) ⩽ 0 is
incompressible. We can ﬁnally prove the converse, at least for closed sur-
faces.
The following result is often proved as a corollary of a famous topo-
logical fact called theDehn Lemma. We do not state Dehn’s Lemma here,
and we prove directly the following using hierarchies.
Theorem 9.4.14. Let M be a compact oriented 3-manifold. A con-
nected oriented closedS ⊂ M with χ(S) ⩽ 0 is incompressible if and only
if the induced mapi∗ : π1(S) → π1(M) is injective.
Proof. We know one implication from Proposition 9.3.4; here we sup-
pose thatS incompressible and prove thati∗ : π1(S) → π1(M) is injective.
The decomposition of M into irreducible and ∂-irreducible factors is
made by cuttingM along essential spheres and discs transverse toS. Since
S is incompressible, we may surgerS along these spheres and discs without
altering i∗, so thatS is disjoint from them and hence contained in a single
factor. Therefore we may supposeM is irreducible and∂-irreducible.
Now M contains the incompressibleS and is hence Haken. Theorem
9.4.12 furnishes a hierarchy of height⩽ 3. We may suppose thatS0 is a
maximal system of closed incompressible surfaces containingS and that
the hierarchy is minimal. The balls inM3 are essential by Lemma 9.4.13.
Suppose by contradiction that i∗ is not injective: there is a loop
γ : S1 → S which is homotopically trivial inM but not in S. The triv-
iality in M furnishes a continuous mapf : D2 → M which extends γ. We
homotope f to a smooth map, transverse to all the strata ofS0 ∪ S1 ∪ S2.
By transversality, the counterimagef−1(S0 ∪ S1 ∪ S2) is a graph in
D2 as in Figure 9.23, which dividesD2 into regions. The graph is itself


## Page 311

9.4. HAKEN MANIFOLDS 303
α α α
Figure9.24. Theimmersedcurve αintersects k ⩽ 3regions
and is hence of one of these types (becauseB is essential).
a hierarchy, with edges of type0, 1, 2 attached iteratively. An easy Euler
characteristic argument shows that at least one regionR is a k-gon with
k ⩽ 3, see Figure 9.23. The regionR is mapped inside a ballB ⊂ M3, and
∂R is mapped to an immersed curveα ⊂ ∂B intersecting k ⩽ 3 domains
of the tessellated∂B.
Since B is essential, the curveα is of one of the types shown in Figure
9.24. In all cases we may slide the discf (R)away fromB and decrease the
number of regions inD by destroying R. After ﬁnitely many homotopies
of this kind we getf (D) ∩ (S0 ∪ S1 ∪ S2) = ∅ and hence f (D) is entirely
contained in a ballB ⊂ M3. Therefore γ is trivial inS, a contradiction. □
Corollary 9.4.15. A Haken manifold has inﬁnite fundamental group.
Proof. It contains the fundamental group of a closed surface with
χ ⩽ 0, which is inﬁnite. □
Corollary 9.4.16. Elliptic 3-manifolds are not Haken.
We will see in the subsequent chapters that every ﬂat 3-manifold is
Haken. Hyperbolic 3-manifolds may or may not be Haken.
9.4.6. Essential surfaces. Topologists sometimes use the term “es-
sential” to summarise various reasonable notions in a single word. We
already know what an essential disc or sphere is (see Section 9.2.11) and
we now turn to surfaces with non-positive Euler characteristic.
Let M be a compact oriented three-manifold andS ⊂ M be a properly
embedded connected compact surface withχ(S) ⩽ 0. We say thatS is
essential if it is incompressible,∂-incompressible, and not∂-parallel.
9.4.7. Simple manifolds. Let M be irreducible and∂-irreducible. We
introduce yet some more deﬁnitions. We say that
• M is atoroidal if it does not contain essential tori,
• M is acylindrical if it does not contain essential annuli.
Finally, the manifoldM is simple if it is atoroidal and acylindrical. We
can summarise this deﬁnition as follows:


## Page 312

304 9. TOPOLOGY OF THREE-MANIFOLDS
Deﬁnition 9.4.17. A compact oriented 3-manifoldM with (possibly
empty) boundary issimple if it does not contain any essential sphere, disc,
torus, or annulus.
Many examples come from elliptic and hyperbolic geometry:
Proposition 9.4.18. Every closed elliptic or hyperbolic 3-manifoldM
is simple.
Proof. We know that M is irreducible. The manifold M does not
contain incompressible tori becauseπ1(M) does not containZ × Z: if M is
elliptic then π1(M) is ﬁnite, if it is hyperbolic we use Corollary 4.2.5.□
The ﬂat geometry is an exception: the three-torus S1 × S1 × S1
contains many incompressible tori and is hence not simple. For instance,
the two-torusS1 × S1 × p is incompressible (because it isπ1-injective).
Our next goal will be to decompose every irreducible and∂-irreducible
manifold M along some canonical set of essential tori and annuli into some
pieces. These pieces will be either simple, or belong to a particular class:
the Seifert manifolds. We introduce this class in the next chapter.
9.4.8. References. Themainsourcesthatwehaveusedforthischap-
ter are an unﬁnished book of Hatcher [26] and Fomenko–Matveev [20].
The proof of Theorem 9.4.14 through hierarchies is due to Aitchison and
Rubinstein [2].


## Page 313

CHAPTER 10
Seifert manifolds
In the previous chapter we have proved various general theorems on
three-manifolds, and it is now time to construct examples. A rich and
important source is a family of manifolds built by Seifert in the 1930s,
which generalises circle bundles over surfaces by admitting some “singular”
ﬁbres. Thethree-manifoldsthatadmitsuchkindofﬁbrationarenowcalled
Seifert manifolds.
In this chapter we introduce and completely classify (up to diﬀeomor-
phisms) the Seifert manifolds. In Chapter 12 we will then show how to
geometrise them, by assigning a nice Riemannian metric to each. We will
show, for instance, that all the elliptic and ﬂat three-manifolds are in fact
particular kinds of Seifert manifolds.
10.1. Lens spaces
We introduce some of the simplest 3-manifolds, the lens spaces.
These manifolds (and many more) are easily described using an impor-
tant three-dimensional construction, calledDehn ﬁlling.
10.1.1. Dehnﬁlling. Ifa3-manifold M hasasphericalboundarycom-
ponent, we can cap it oﬀ with a ball. IfM has a toric boundary component,
there is no canonical way to cap it oﬀ: the simplest object that we can
attach to it is a solid torusD × S1, but the resulting manifold depends on
the gluing map. This operation is called aDehn ﬁllingand we now study
it in detail.
Let M be a 3-manifold andT ⊂ ∂M be a boundary torus component.
Deﬁnition 10.1.1. A Dehn ﬁlling of M along T is the operation of
gluing a solid torusD × S1 to M via a diﬀeomorphismϕ: ∂D × S1 → T.
Theclosedcurve ∂D ×{x}isgluedtosomesimpleclosedcurve γ ⊂ T,
see Figure 10.1. The result of this operation is a new manifoldMﬁll, which
has one boundary component less thanM.
Lemma 10.1.2. The manifold Mﬁll depends only on the isotopy class
of the unoriented curveγ.
Proof. Decompose S1 into two closed segments S1 = I ∪ J with
coincidingendpoints. Theattachingof D×S1 maybeseenastheattaching
305


## Page 314

306 10. SEIFERT MANIFOLDS
Figure 10.1. The Dehn ﬁlling Mﬁll of a 3-manifold M is
determined by the unoriented simple closed curveγ⊂ T to
which a meridian∂D of the solid torus is attached.
of a 2-handleD × I along ∂D × I, followed by the attaching of a 3-handle
D × J along its full boundary.
If we change γ by an isotopy, the attaching map of the 2-handle
changes by an isotopy and hence gives the same manifold. The attaching
map of the 3-handle is irrelevant by Proposition 9.2.1. □
We say that the Dehn ﬁllingkills the curveγ, since this is what really
happens on fundamental groups, as we now see.
The normaliser of an element g ∈ G in a group G is the smallest
normal subgroup N(g) ◁ G containing g. The normaliser depends only on
the conjugacy class ofg±1, hence the subgroupN(γ) ◁ π1(M) makes sense
without ﬁxing a basepoint or an orientation forγ.
Proposition 10.1.3. We have
π1(Mﬁll) = π1(M)/N(γ).
Proof. The Dehn ﬁlling decomposes into the attachment of a 2-
handle over γ and of a 3-handle. By Van Kampen, the ﬁrst operation
kills N(γ), and the second leaves the fundamental group unaﬀected.□
Let a slope on a torus T be the isotopy class γ of an unoriented
homotopically non-trivial simple closed curve. The set of slopes onT was
indicated byS in Chapter 7. If we ﬁx a basis(m, l) for H1(T, Z) = π1(T ),
everyslopemaybewrittenas γ = ±(pm+ql )forsomecoprimepair (p, q).
Therefore we get a 1-1 correspondence
S ← →Q ∪ {∞}
by sending γ to p
q. If T is a boundary component ofM, every number p
q
determines a Dehn ﬁlling ofM that kills the corresponding slopeγ.


## Page 315

10.1. LENS SPACES 307
Diﬀerent values of p
q typically produce non-diﬀeomorphic manifolds
Mﬁll: this is not always true - a notable exception is described in the next
section - but it holds in “generic” cases.
10.1.2. Lens spaces. The simplest manifold that can be Dehn-ﬁlled
is the solid torusM = D × S1 itself. The orientedmeridian m = S1 × {y }
and longitude l = {x} × S1 form a basis forH1(∂M, Z).
Deﬁnition 10.1.4. Thelens spaceL(p, q)is the result of a Dehn ﬁlling
of M = D × S1 that kills the slopeqm + pl.
A lens space is a three-manifold that decomposes into two solid tori.
We have already encountered lens spaces in the more geometric setting
of Section 3.4.10, and we will soon prove that the two deﬁnitions are
coherent. Since L(p, q) = L(−p, −q) we usually supposep ⩾ 0.
Exercise 10.1.5. We haveπ1
(
L(p, q)
)
= Z/pZ.
Proposition 10.1.6. We have L(0, 1) = S2 × S1 and L(1, 0) = S3.
Proof. The lens space L(0, 1) is obtained by killing m, that is by
mirroring D × S1 along its boundary. The lens spaceL(1, 0) is S3 because
the complement of a standard solid torus inS3 is another solid torus, with
the roles ofm and l exchanged (exercise). □
Exercise 10.1.7. Every Dehn ﬁlling of one component of the product
T × [0, 1] is diﬀeomorphic to D × S1. Therefore by Dehn-ﬁlling both
components of T × [0, 1] we get a lens space.
The solid torusD × S1 has a non-trivial self-diﬀeomorphism
(x , ei θ) ↦− →(x ei θ, ei θ)
called atwist along the discD × {y }. The solid torus can also bemirrored
via the map
(x , ei θ) ↦− →(x , e−i θ).
Exercise 10.1.8. We haveL(p, q) ∼= L(p, q′) if q′ ≡ ±q±1 (mod p).
Hint. Twist, mirror, exchange the two solid tori givingL(p, q). □
Remark 10.1.9. The meridianm of the solid torusM = D × S1 may
be deﬁned intrinsically as the unique slope in∂M that is homotopically
trivial inM. The longitudel is not intrinsically determined: a twist sendsl
to m + l. The solid torus contains inﬁnitely many non-isotopic longitudes,
and there is no intrinsic way to choose one of them.


## Page 316

308 10. SEIFERT MANIFOLDS
10.1.3. Equivalence of the two deﬁnitions.When p > 0, we have
deﬁned the lens spaceL(p, q) in two diﬀerent ways: as the(q, p)-Dehn
ﬁlling of the solid torus, and as an elliptic manifold in Section 3.4.10. In
the latter description we set
ω = e
2πi
p , f (z , w) = ( ωz , ωqw )
and deﬁneL(p, q) as S3/Γ where Γ = ⟨f ⟩ is generated byf. We now show
that the two deﬁnitions produce the same manifolds.
Proposition 10.1.10. The manifold S3/⟨f⟩ is the(q, p)-Dehn ﬁlling of
the solid torus.
Proof. The isometry f preserves the central torus
T =
{
(z , w)
⏐⏐ |z| = |w | =
√
2
2
}
that divides S3 into two solid tori
N1 =
{
(z , w)
⏐⏐ |z| ⩽
√
2
2 , |w | =
√
1 − |z|2
}
,
N2 =
{
(z , w)
⏐⏐ |w | ⩽
√
2
2 , |z| =
√
1 − |w |2
}
.
Identify T with S1 ×S1 = R2/Z2 intheobviousway, sothat H1(T ) = Z×Z.
The meridians ofN1 and N2 are (1, 0) and (0, 1). The isometryf act on
T as a translation of vector v =
(1
p , q
p
)
. The quotient T /⟨f⟩ is again
a torus, with fundamental domain the parallelogram generated byv and
w = (0, 1).
The quotientsN1/⟨f⟩, andN2/⟨f⟩ are again solid tori. ThereforeS3/⟨f⟩
is also a union of two solid tori. Their meridians are the projections of
the horizontal and vertical lines inR2 to T /⟨f⟩ = R2/⟨v ,w⟩. In the basis
(v , w) these meridians arepv − qw and w respectively. Therefore S3/⟨f⟩
is a (−q, p)-Dehn ﬁlling on the solid torus, which is diﬀeomorphic to the
(q, p)-Dehn ﬁlling by mirroring the solid torus. □
Corollary 10.1.11. We have L(1, 0) = S3 and L(2, 1) = RP3.
Proof. We have f = id and f = −id, correspondingly. □
10.1.4. Classiﬁcation of lens spaces.Which lens spaces are diﬀeo-
morphic? It is not so easy to answer this question, because many lens
spaces like L(5, 1) and L(5, 2) have the same homotopy and homology
groups, while there is no evident diﬀeomorphism between them. A com-
plete answer was given by Reidemeister in 1935, who could distinguish lens
spacesusinganewinvariant, nowknownasthe Reidemeistertorsion. More
topological proofs were discovered in th 1980s by Bonahon and Hodgson.
We follow here Hatcher [26].
Theorem 10.1.12. The lens spaces L(p, q) and L(p′, q′) are diﬀeo-
morphic ⇐ ⇒p = p′ and q′ ≡ ±q±1 (mod p).


## Page 317

10.1. LENS SPACES 309
Figure 10.2. We require thep sheets of the spine∆ to lie
above every local maximum forf|Σ.
Proof. We may supposep > 1. Exercise 10.1.8 furnishes one impli-
cation, so we start with a lens spaceL(p, q) and we prove that there is
(up to isotopy) only one torusT dividing L(p, q) into two solid tori: this
fact then implies that one can recoverp and q intrinsically from L(p, q),
up to the stated ambiguity forq (which depends on the chosen longitudes
and orientations, and changes by switching the solid tori). So we suppose
that there is another torusT′.
Let Σ be the core circle of one solid torus adjacent toT′. If we can
isotope Σ inside the torusT, we are done: in that caseT′ is isotopic to
the boundary of a small tubular neighbourhood ofΣ, hence bothT and T′
are cut into two annuliT = A1 ∪ A2 and T′ = A′
1 ∪ A′
2 such that Σ ⊂ A1,
all four annuli share the same boundaries, andA2 is contained in the large
outside solid torus bounded by T′; the annulus A2 is incompressible in
this solid torus by Proposition 9.3.4 (otherwiseΣ would be homotopically
trivial, contradictingp > 1) and hence∂-parallel by Proposition 9.3.16, so
it is isotopic to eitherA′
1 or A′
2, suppose toA′
2; since A1 is clearly isotopic
to A′
1 we conclude thatT and T′ are isotopic.
Our aim is now to prove thatΣ can be isotoped insideT. To this
purpose we construct two diﬀerent objects fromT′ and T, aspine ∆ and
a foliation F. The spine ∆ ⊂ M is built by adding toΣ the meridian D
of the other solid torus incident toT′, enlarged so that∂D is glued along
Σ like a degree-p covering. Note thatM \ ∆ is an open ball.
We construct the foliation F of M by subdividing each solid torus
bounded by T into concentric tori, with a central singular circle in each.
We represent F as the level sets of a mapf : L(p, q) → [0, 1] where the
singular circles are the extreme levelsf−1(0) and f−1(1).
We now put ∆ in some good position with respect toF. We ﬁrst
perturb Σ so that it is disjoint from the singular circles ofF and f |Σ
is a Morse function with singular points in distinct levels. At every local
maximum (minimum) of f |Σ we isotope ∆ so that the p sheets of ∆ lie
above(below) ΣasinFigure10.2. Finally, werequire ∆tobetransverseto
the two singular circles ofF and f |∆\Σ to be a Morse function, with critical
points at distinct levels (also distinct from those of the critical points of
f |Σ).


## Page 318

310 10. SEIFERT MANIFOLDS
Figure 10.3. The singular points inD can be centres (top
left), saddles (top right) and half-saddles (bottom).
Figure 10.4. A singular leaf exiting from a singular point
may be of one of these kinds. The dots in (e) indicate that
theremightbeanotherhalf-saddleattheotherendpoint: this
is because there are half-saddles at the same level (precisely
p for every local maximum or minimum forf|Σ).
The foliation F induces a singular foliation on∆ that pulls back to
D via the map D → ∆. There are three types of singular points in the
foliation, shown in Figure 10.3: centres, saddles, and half-saddles.
A leaf inD incident to a singular point issingular. Since we minimised
the critical points that may stay at the same level, the singular leaves
exiting from a singular point may be only of the six possible kinds shown
in Figure 10.4. The saddles and half-saddles of type (a) and (e) are called
essential, and the othersinessential. In (a) the singular leaves divideD
into fourquarter discs, and in (e) they cut oﬀ two or morehalf discs.
Among all possible good conﬁgurations of∆, we pick one that min-
imises ﬁrst the number of critical points inf |Σ, and second the number of
essential saddles.
Let D′ ⊂ D beaquarterorhalf-discnotcontaininganysmallerquarter
or half-disc. Deﬁneα = D′ ∩ ∂D. Suppose ﬁrst thatD′ is a half-disc and
both endpoints ofα are singular. The singular discD′ can contain some
singular point of type (b), and it certainly contains one singular point of
type (f), see Figure 10.5-(left). (It contains no other singular point except
these.) The image ofD′ in ∆ is shown in Figure 10.5-(right). In this case


## Page 319

10.1. LENS SPACES 311
Figure 10.5. The disc D′ is a half-disc andα is incident to
two singular points.
Figure 10.6. The disc D′ is a half-disc andα is incident to
one singular point.
Figure 10.7. The disc D′ is a quarter disc.
we can slide α along D′ to the green arc shown in the ﬁgure which lies
entirely in a level torus off. If we could do this for all the arcs of∂D
cut by singular points, we would happily isotopeΣ inside a torus level and
hence into T, and we would be done.
There are however two other cases to consider, and both will be ex-
cluded by our minimality assumption on ∆. One is that D′ may be a
half-disc with only one singular endpoint forα, as in Figure 10.6. In that
case we can isotopeα to the green curve throughD′, dragging the spine
∆ behind. In the new conﬁgurationf |Σ has strictly less critical points, a
contradiction.


## Page 320

312 10. SEIFERT MANIFOLDS
In the last case D′ is a quarter disc as in Figure 10.7 and we can
isotope α to the green curve draggingΣ as above, but more carefully: we
enlarge the otherp − 1 sheets of ∆ by parallel copies ofD′. In the new
conﬁguration the number of critical points inf |Σ is unchanged, but there
are strictly fewer essential saddles: at least one is destroyed and no new
one is created. (Note that many inessential saddles may be created.) This
is also excluded. □
Wehavediscovered,inparticular,thatthereareclosedthree-manifolds
like L(5, 1) and L(5, 2) that are not diﬀeomorphic, although their funda-
mental groups are both isomorphic toZ/5Z; the two manifolds are both
covered by S3, so they also have isomorphic higher homotopy groups.
10.2. Circle bundles
We now introduce another simple class of 3-manifolds, the orientable
circle bundles over some compact surfaceS. We will discover that there
is essentially only one circle bundle ifS has boundary, and inﬁnitely many
if S is closed, distinguished by an integer called theEuler number.
10.2.1. The trivial circle bundle. Let S be a compact connected
surface. Aseveryconnectedmanifold, ithasauniqueorientablelinebundle
S × I or S ×
∼
I
depending on whetherS is orientable or not. We denote by
M = S × S1 or S ×
∼
S1
respectively the double ofS × I and S ×
∼
I along its boundary. If we do
not know whetherS is orientable or not, we use the symbolsS ×
(∼)
I and
S ×
(∼)
S1 to denote these objects. The manifoldS ×
(∼)
S1 is an orientable
circle bundle overS, called thetrivial one.
10.2.2. Circlebundleswithboundary. Westartbyexploringthecase
where the base surface S has non-empty boundary: in this case every
bundle M over S is a 3-manifold with boundary; the boundary consists of
tori, one ﬁbering above each circle in∂S, because the torus is the unique
orientable surface that ﬁbres overS1.
There is essentially only one bundle overS:
Lemma 10.2.1. If ∂S ̸= ∅, the orientable circle bundles onS are all
isomorphic.
Proof. Let N → S be an orientable circle bundle. DecomposeS as
a disc D with some pairs of disjoint segments(Ii , Ji ) in ∂D to be glued.
Since D is contractible the restriction of N to D is a product D × S1
and N is obtained from it by gluing the annuliIi × S1 and Ji × S1 via
orientation-reversing ﬁbre-preserving maps. Two such maps are always
isotopic (exercise) and henceN is uniquely determined. □


## Page 321

10.2. CIRCLE BUNDLES 313
A
S
Figure 10.8. A twist along a ﬁbered annulusA modiﬁes a
section S as shown.
We now want to study thesections of the trivial bundle M → S,
because these will be useful in the study of bundles over closed surfaces.
We now discover that, although the bundle is trivial, it contains many non
isotopic sections, and we want to classify them.
Recall that asection of the bundle π : M → S is a map i : S → M
such that π ◦ i = id. Since the sectioni is determined by its imagei(S),
we simply consider the surfacei(S) as a section of π. By construction
M is the double of an interval bundle overS and as such it contains the
zero-section S there. However, this section is not unique in general, not
even up to isotopy.
To modify a section, pick a properly embedded arc inS. The arc
determines a ﬁbered annulusA ⊂ M above it, which we may use totwist
the section as shown in Figure 10.8. This operation modiﬁes the curves
∂S ⊂ ∂M via two Dehn twists (one positive and one negative) on the tori
∂M along the two curves in∂A.
By twisting along annuli we may construct all the sections ofM:
Lemma 10.2.2. Two sections ofS ×
(∼)
S1 are connected by a compo-
sition of twists along ﬁbered annuli and ﬁbre-preserving isotopies.
Proof. Let i1, i2 be two sections. DecomposeS as a 0-handleD with
some rectangular 1-handles attached to∂D. The bundle is trivial on each
handle. Since D is contractible, every mapi : D → S1 is homotopic to a
constant and we may hence isotopei1 and i2 so that they coincide onD.
See a 1-handle as [−1, 1]2 with {±1} × [−1, 1] glued to D. The
sections i1, i2 : [ −1, 1]2 → S1 coincide on {±1} × [−1, 1], and up to
reparametrising we may suppose that they are constantly1 there. The
section i1 : [ −1, 1]2 → S1 deﬁnes an element d ∈ π1(S1, 1) = Z, deter-
mined by the loopt ↦→ i1(t, u), whose homotopy class does not depend on
the ﬁxed u ∈ [−1, 1]. The section is in fact determined up to isotopy by
d, and by twisting along the annulus0 × [−1, 1] we can vary this integer
arbitrarily. Therefore after some twists and isotopies the sectionsi0 and i1
are both constantly 1 on 1-handles, and thus coincide everywhere. □


## Page 322

314 10. SEIFERT MANIFOLDS
Corollary 10.2.3.If S hasonlyoneboundarycomponent, theboundary
of a section ofM = S ×
(∼)
S1 is a slope in∂M that does not depend on
the section.
Proof. Distinct sections are connected by ﬁnitely many Dehn twists
along annuli. One such twist acts on the torus∂M as a composition of
two opposite Dehn twists, which cancel each other. Hence it does not
aﬀect the boundary slope of a section. □
Exercise 10.2.4. Prove this corollary using Proposition 9.1.4.
10.2.3. Closed circle bundles.We turn to closed circle bundles. In
this section we prove that the oriented circle bundles over a closed surface
are parameterised by an integer called theEuler number.
We prefer to see the bundles over closed surfaces as Dehn ﬁllings of
bundles over surfaces with boundary. Here are the details.
Let S be a compact surface with non-empty boundary. PickM =
S ×
(∼)
S1 and ﬁx an orientation forM. Recall that we denote by S the
zero-section of M. Every boundary component T of M is an oriented
torus, which contains two natural unoriented simple closed curves: the
boundary m = T ∩ ∂S of the sectionS and the ﬁbrel of the bundle. If
oriented, the curvesm and l form a basis(m, l) for H1(T, Z). We choose
orientations for m and l such that (m, l) form a positively oriented basis:
there is a unique choice up to reversing bothm and l.
A Dehn ﬁlling onT is determined as usual by a pair(p, q) of coprime
integers that indicate the slope±(pm + ql ) to be killed.
Suppose now thatS has only one boundary component and letMﬁll
be obtained by Dehn ﬁllingM along the slope(1, q). Let ˆS be the closed
surface obtained by cappingS with a disc.
Proposition 10.2.5. The circle bundle M → S extends to a circle
bundle Mﬁll → ˆS. Every oriented circle bundle on ˆS is obtained in this
way, and distinct values ofq yield vector bundles that are not orientation-
preservingly isomorphic.
Proof. The meridian of the ﬁlling solid torus ism′ = m + ql. The
ﬁbre l has geometric intersection 1 withm′ and is hence a longitude for
the ﬁlling solid torus. We may represent the ﬁlling solid torus asD × S1
with m′ = S1 × {y } and l = {x} × S1. The circle bundleM → S extends
naturally to a circle bundleMﬁll → ˆS with ˆS = S ∪ D.
Every closed circle bundleN → ˆS arises in this way: the bundle above
a disc D ⊂ ˆS is the trivial D × S1, and if we remove it we getM → S
back. The number q is intrinsically determined: the meridianm does not
depend on the section ofM → S by Corollary 10.2.3, and the equality
m′ = m + ql determines q. Therefore distinct values of q yield non-
isomorphic bundles. □


## Page 323

10.2. CIRCLE BUNDLES 315
The integer q is theEuler number of the circle bundle and is usually
denoted with the lettere. We summarise our discovery:
Corollary 10.2.6. For everye ∈ Z and every closed surfaceS there is
a unique oriented circle bundle overS with Euler numbere.
A change of orientation forM transforms e into −e. Recall that every
closed surfaceS has a trivial circle bundleS ×
(∼)
S1 constructed by doubling
the unique oriented line bundle onS.
Exercise 10.2.7. An oriented circle bundle over a closed surface is
trivial ⇐ ⇒e = 0 ⇐ ⇒the bundle has a section.
We may see the Euler number of a bundleM → S over a closedS as
an obstruction for the existence of a section.
Remark 10.2.8. Every oriented n-dimensional vector bundle E → S
over a closed orientedn-manifold S has aEuler numberdeﬁned by taking
two generic sections and counting their signed intersections. We brieﬂy
explain how this number is closely related to the one we deﬁned here.
Eachvector bundle E → S inducesaspherebundle M → S: itsuﬃces
to ﬁx a Riemannian metric onE and take the sub-bundle consisting of unit
tangent vectors. Whenn = 2 we get a circle bundleM → S and the Euler
number of E → S coincides with that ofM → S that we deﬁned above.
When E is the tangent bundle ofS, the Euler number is the Euler
characteristic χ(S). For instance, the unit tangent bundle ofS2 has Euler
number e = χ(S2) = 2 and hence it is diﬀeomorphic toL(2, 1) = RP3.
Exercise 10.2.9. Let M be a circle bundle over the genus-g surface
Sg with Euler numbere. We haveH1(M, Z) = Z2g × Z/eZ.
Corollary 10.2.10. Let M → Sg and M′ → Sg′ be circle bundles with
Euler numbers e and e′. The manifoldsM and M′ are diﬀeomorphic⇐ ⇒
g = g′ and |e| = |e′|.
Exercise 10.2.11. The circle bundleM over S2 with Euler numbere
is diﬀeomorphic to the lens spaceL(|e|, 1).
Hint. Thebasesphere S2 decomposesintotwodiscs,andtheﬁbration
over each disc is a solid torus. SoM is the union of two solid tori. □
We end the discussion by deﬁning explicitly a famous non-trivial circle
bundle over S2.
10.2.4. The Hopf ﬁbration.The quotient map
(C2)∗ − →CP1
(z , w) ↦− →[z , w]
restricts to a circle bundleS3 → CP1 = S2 called theHopf ﬁbration. The
ﬁbre over [z , w] is the circle(ωz , ωw) as ω ∈ S1 varies. See Figure 10.9.
Exercise 10.2.11 implies that the Euler number of the Hopf ﬁbration
S3 → S2 is ±1, and hence it has no section by Exercise 10.2.7.


## Page 324

316 10. SEIFERT MANIFOLDS
Figure 10.9. The ﬁbre of every point in the Hopf ﬁbration
S3 → S2 is a circle, and the counterimage of a circle in
S2 is a torus in S3. The picture shows the counterimage
of three circle arcs: each is a portion of standard torus in
S3 = R3∪∞, foliated by circles of type(1, 1).
10.3. Seifert manifolds
We now enlarge the class of circle bundles over surfaces by admitting
some kind of singular ﬁbres. We introduce theSeifert ﬁbrations, whose
total spaces are calledSeifert manifolds. These manifolds were introduced
by Herbert Seifert in 1933 and ﬁt perfectly in the much more recent ge-
ometrisation perspective: in the next chapter we will introduce the eight
three-dimensional geometries, and prove that six of them are realised pre-
cisely by the Seifert manifolds.
10.3.1. Deﬁnition. We deﬁne the Seifert manifolds as Dehn ﬁllings
of trivial bundles over surfaces with boundary. Here are the details.
Let M be the (unique) oriented bundleS ×
(∼)
S1 over a compact con-
nected (possibly non-orientable) surfaceS with boundary. We denote by
S the zero-section.
Let T1, . . . , Tk be the boundary tori ofM. On each Ti we choose an
orientation for the meridianmi = Ti ∩ ∂S and for the ﬁbreli of the bundle
so that the basis(mi , li ) for H1(Ti , Z) be positively oriented.
A (pi , qi )-Dehn ﬁlling onTi kills the slopepi mi + qi li. We say that the
Dehn ﬁlling isﬁbre-parallel if pi = 0, i.e. if it kills a ﬁbre.


## Page 325

10.3. SEIFERT MANIFOLDS 317
Deﬁnition 10.3.1. A Seifert manifold is any 3-manifold N obtained
from M by Dehn ﬁlling someh ⩽ k boundary tori in a non-ﬁbre-parallel
way, that is withpi ̸= 0 for all i.
The Seifert manifold is closed ifh = k, and hask − h boundary tori
otherwise. It is not important to know whichh tori are ﬁlled, in virtue of
the following.
Proposition 10.3.2.Every permutation of the boundary tori is realised
by a self-diﬀeomorphism ofM that preserves the pairs±(mi , li ).
Proof. Every permutation of the boundary circles ofS is realised by
a self-diﬀeomorphism of S, that extends orientation-preservingly to the
orientable I-bundle and its doubleM. □
The pair (pi , qi ) is determined up to sign, so we can always suppose
pi > 0 and we fully encode the Seifert manifoldN using the following
notation:
(6) N =
(ˆS, (p1, q1), . . . ,(ph, qh)
)
where ˆS is S with h boundary components capped. The reason for using
ˆS instead of S is that N has a particular ﬁbration ontoˆS, as we will soon
see. Before constructing this ﬁbration we list some simple examples that
should hopefully help the reader to familiarise with the notation (6), that
will be used extensively in the whole chapter.
Example 10.3.3. The Seifert manifold
(
Sg, (1, e)
)
is the circle bundle
over the orientable genus-g surface Sg with Euler numbere, by construc-
tion. In particular
(
Sg, (1, 0)
)
= Sg × S1.
Example 10.3.4. The Seifert manifold
(
S2, (p, q)
)
is diﬀeomorphic to
the lens spaceL(q, p).
The following facts follow from Exercise 10.1.7.
Exercise 10.3.5. The Seifert manifold
(
D2, (p, q)
)
is a solid torus.
In the following exercise, it should be clear that the resulting manifold
is a lens space (by Exercise 10.1.7) and the hard part is to check carefully
that the proposed lens space parameters are correct.
Exercise 10.3.6. The Seifert manifold
(
S2, (p1, q1), (p2, q2)
)
is the
lensspace L(p1q2+q1p2, r q2+sp 2)where r, s aresuchthat p1s −q1r = ±1.
In particular, this Seifert manifold isS3 when p1q2 + q1p2 = ±1.
10.3.2. Seifert ﬁbrations. As we anticipated, a Seifert manifoldN as
in (6) possesses some kind of singular ﬁbration over the ﬁlled surfaceˆS.
We clarify this point here by deﬁning the notion ofSeifert ﬁbration.
Let (p, q) be two coprime integers withp > 0. A standard ﬁbered
solid toruswith coeﬃcients (p, q) is the solid torus
D × [0, 1]/ψ


## Page 326

318 10. SEIFERT MANIFOLDS
Figure 10.10. A standard ﬁbered solid torus. We identify
the top and bottom discs by a 2π q
p rotation, for some q
coprime withp. Here p = 5. Every non-central ﬁbre (green)
winds p times along the central ﬁbre (red).
where ψ : D × 0 → D × 1 is a rotation of angle2π q
p. The ﬁbration into
vertical segments{pt}× [0, 1]extends to a ﬁbration into circles of the solid
torus. The central ﬁbre obtained by identifying the endpoints of0 × [0, 1]
is the core of the solid torus, and every non-central ﬁbre windsp times
around the core ofM: see Figure 10.10.
The positive numberp is themultiplicity of the central ﬁbre. Ifp = 1
theﬁberedsolidtorusisdiﬀeomorphictotheusualproductﬁbration D×S1
and the central ﬁbre isregular. If p > 1 the central ﬁbre issingular.
Deﬁnition 10.3.7. ASeifert ﬁbrationis a partition of a compact ori-
ented 3-manifoldN with (possibly empty) boundary into circles, such that
everycirclehasaﬁberedneighbourhooddiﬀeomorphictoastandardﬁbered
solid torus.
Let S be the topological space obtained fromN by quotienting circles
to points.
Proposition 10.3.8.The spaceS is a compact connected surface with
(possibly empty) boundary.
Proof. Every standard ﬁbered solid torus quotients to a disc: a sector
z = ρe i θ with 0 ⩽ ρ ⩽ 1 and 0 ⩽ θ ⩽ 2π
p with two edges θ = 0 and
θ = 2π
p identiﬁed by a rotation. This disc actually looks like a “cone”, and
this motivates the following discussion. □
The map N → S is in fact what we call a Seifert ﬁbration. The
surface S may have boundary and may be non-orientable, and its interior
has a natural orbifold structure: if the preimage ofx ∈ S is a ﬁbre of
order p, we see x as a cone point of orderp, see Section 6.2.4. If N
has boundary, thenS also has, and we say thatS itself is an orbifold for
simplicity although we actually mean only its interior. Morally, we should
consider the ﬁbrationN → S as a circle bundle over the orbifoldS.


## Page 327

10.3. SEIFERT MANIFOLDS 319
A Seifert ﬁbration without singular ﬁbres is just an ordinary circle
bundle. We now show that Seifert manifolds and Seifert ﬁbrations are
more or less the same thing.
Proposition 10.3.9. The Seifert manifold
N =
(
S, (p1, q1), . . . ,(ph, qh)
)
has a Seifert ﬁbrationN → S over the orbifold
(S, p1, . . . , ph).
Every Seifert ﬁbration arises in this way.
Proof. The Seifert manifoldN is obtained by ﬁllingh components of
a bundleM = S′ ×
(∼)
S1. The bundleM → S′ extends to a Seifert ﬁbration
N → S where the orbifoldS is obtained fromS′ by attachingh discs with
cone points p1, . . . , ph.
More precisely, we ﬁll each boundary torusTi of M with a solid torus
having meridianµi = pi mi + qi li. We ﬁx a longitudeλi = ri mi + si li for this
solid torus by choosingri , si with pi si − qi ri = 1. We get li = pi λi − ri µi.
By hypothesis the Dehn ﬁlling is not ﬁbre-parallel, hencepi ̸= 0 and the
ﬁbration M → S′ extends to a standard ﬁbration of the solid torus with
coeﬃcients (pi , −ri ).
Every Seifert ﬁbration N → S arises in this way: if we remove the
singular ﬁbres (or a regular one, if there are not) we get an ordinary circle
bundle over a surface with boundary, which is trivial. ThereforeN is a
Dehn ﬁlling of this trivial bundle, hence a Seifert manifold. □
We have seen that the notation
(7) N =
(
S, (p1, q1), . . . ,(ph, qh)
)
deﬁnes a Seifert ﬁbrationN → S and a Seifert manifoldN.
Example 10.3.10. If the orbifoldS is a disc with at most one singular
point then N is a standard ﬁbered solid torus. IfS is S2 with at most2
singular points thenN is a lens space: see Exercises 10.3.5 and 10.3.6.
10.3.3. Classiﬁcation of Seifert ﬁbrations.We say that two Seifert
ﬁbrations π1 : N1 → S, π2 : N2 → S are isomorphic if there is a diﬀeomor-
phism ψ : N1 → N2 such that π1 = π2 ◦ ψ. Two diﬀerent notations as in
(7) may describe isomorphic ﬁbrations, but this phenomenon is completely
understood.
Proposition10.3.11. Twonotationsasin(7)describetwoorientation-
preservingly isomorphic Seifert ﬁbrations if and only if they are related by
a ﬁnite sequence of the following moves and their inverses:
(pi , qi ), (pi+1, qi+1) ↦− →(pi , qi + pi ), (pi+1, qi+1 − pi+1),(8)
(p1, q1), . . . ,(ph, qh) ↦− →(p1, q1), . . . ,(ph, qh), (1, 0),(9)
(pi , qi ) ↦− →(pi , qi + pi ) if ∂N ̸= ∅,(10)


## Page 328

320 10. SEIFERT MANIFOLDS
and permutations of the pairs(pi , qi )’s.
Proof. Recall that N is a Dehn ﬁlling ofM = S′ ×
(∼)
S1. Move (8) is
the result of twistingM along a ﬁbered annulusA connecting the toriTi
and Ti+1 in ∂M: this self-diﬀeomorphism ofM acts onTi and Ti+1 like two
opposite Dehn twists and extends to an isomorphism of the two ﬁbrations.
In (10) we twist along an annulus connectingTi and ∂N. The move (9)
corresponds to drilling a nonsingular ﬁbered torus and reﬁlling it back.
We now prove that these moves suﬃce to connect two isomorphic
Seifert ﬁbrations. Suppose that two distinct notations as in (7) describe
isomorphic ﬁbrations. We use the moves (8), (9), and (10) to eliminate
the parameters pi = 1 as much as possible from both notations. If there
are no singular ﬁbres, we end up with a single parameter(1, e) if S is
closed, and no parameters at all if∂S ̸= ∅. We conclude by Corollary
10.2.6.
If the ﬁbration has at least one singular ﬁbre, we can eliminate all
pi = 1 and the (pi , qi ) correspond to singular ﬁbres. An isomorphism of
Seifert ﬁbrations sends singular ﬁbres to singular ﬁbres and hence induces
an isomorphism of their complementS′ ×
(∼)
S1. The parameters(pi , qi )are
determined by the choice of a section inS′ ×
(∼)
S1. Diﬀerent sections are
related by Dehn twist along annuli and hence the parameters are related
by the moves (8) and (10). □
Proposition 10.3.11 classiﬁes all the Seifert ﬁbrations up to isomor-
phism. A classiﬁcation of Seifert manifolds up todiﬀeomorphism would
also be desirable, but it is much harder to obtain because a three-manifold
may admit many non-isomorphic Seifert ﬁbrations. For instance, Exercise
10.3.6 shows that the lens spaces may ﬁbre in many diﬀerent ways; a man-
ifold as familiar asS3 ﬁbres over the orbifold(S2, p1, p2) if p1 and p2 are
coprime and hence has inﬁnitely many non-isomorphic ﬁbrations. It is a
stimulating exercise to try to visualise these Seifert ﬁbrations ofS3.
We now start a long journey in Seifert manifolds theory, whose ulti-
mate goal is to classify them completely up to diﬀeomorphism. We will
see at the end that the only Seifert manifolds admitting non-isomorphic
ﬁbrations are the “smallest” ones, likeS3, the lens spaces, and few more
that will be classiﬁed using somead hocargument.
Exercise 10.3.12. The number of non-isomorphic Seifert ﬁbrations
over a ﬁxed orbifoldS is ﬁnite ⇐ ⇒∂S ̸= ∅.
10.3.4. Euler number. We now extend the notion of Euler number
from ordinary to Seifert ﬁbrations. We deﬁne theEuler number of the
ﬁbration (7) to be the rational number
e(N) =
h∑
i=1
qi
pi
.


## Page 329

10.3. SEIFERT MANIFOLDS 321
The Euler number is only deﬁned moduloZ when N has boundary. The
good deﬁnition follows from Proposition 10.3.11 (the moves do not aﬀect
e, except (10) that modiﬁese into e + 1 and applies only when N has
boundary) and is coherent with the circle bundle case. The Euler number
depends on the ﬁbration and not only onN, but we writee(N) anyway for
simplicity. Proposition 10.3.11 easily implies the following.
Corollary 10.3.13. Two Seifert ﬁbrations
(
S, (p1, q1), . . . ,(ph, qh)
)
,
(
S′, (p′
1, q′
1), . . . ,(p′
h′ , q′
h′)
)
with pi , p′
i ⩾ 2 are orientation-preservingly isomorphic if and only ifS = S′,
h = h′, e = e′, and up to reorderingpi = p′
i and qi ≡ q′
i (mod pi) for alli.
Thenumbers e and e′ indicatetheEulernumbersofthetwoﬁbrations,
and recall that they are only deﬁned moduloZ when ∂S ̸= ∅.
Remark 10.3.14. The move
(
S, (p1, q1), . . . ,(ph, qh)
)
↦− →
(
S, (p1, −q1), . . . ,(ph, −qh)
)
corresponds to a change of orientation for the three-manifold and trans-
forms e into −e.
10.3.5. Homology. We now characterise the Seifert manifolds that
have ﬁnite homology groups, and in particular the homology spheres.
Proposition 10.3.15. The homology groupH1(M, Z) of
M =
(
S, (p1, q1), . . . ,(ph, qh)
)
is ﬁnite ⇐ ⇒one of the following holds:
• S = S2 and e ̸= 0, and we get|H1(M, Z)| = |e|p1 · · · ph;
• S = RP2, and we get|H1(M, Z)| = 4p1 · · · ph.
Proof. If M is not closed thenH1(M, Z) is inﬁnite becauseH1(∂M, Z)
is. If S ̸= S2, RP2 then H1(S) is inﬁnite. It is easy to check that the
ﬁbration M → S induces a surjectionH1(M) → H1(S) and hence H1(M)
is also inﬁnite.
Suppose S = S2. The manifoldM is a(pi , qi )-Dehn ﬁlling ofS0,h ×S1
where S0,h is the sphere with h holes. The homology of S0,h × S1 is
generated by m1, . . . , mh, l with the relationm1 + . . . + mh = 0. The i-th
Dehn ﬁlling adds the relationpi mi + qi li = 0. The relations form a square
(h + 1)-matrix


1 p1 0 · · · 0
1 0 p2
... ...
...
... ... ... 0
1 0 0 · · · ph
0 q1 q2 · · · qh


∼


1 p1 0 · · · 0
1 0 p2
... ...
...
... ... ... 0
1 0 0 · · · ph
−e 0 0 · · · 0


.


## Page 330

322 10. SEIFERT MANIFOLDS
We have used Gauss moves to simplify the last row. The determinant of
this matrix is ±ep1 · · · ph. The order |H1(M, Z)| is the absolute value of
the determinant if it is non-zero, and is inﬁnite if it is zero.
Suppose S = RP2 and let Sno
1,h be RP2 with h holes. The homology
of Sno
1,h ×
∼
S1 is generated bya, m1, . . . , mh, l, where a is an orientation-
reversing curve in Sno
1,h, with the relations 2a + m1 + . . . + mh = 0 and
2l = 0. The relations now form a square(h + 2)-matrix with determinant
det


2 0 0 . . . 0
1 0 p1
... 0
...
...
... ... ...
1 0 0 · · · ph
0 2 q1 · · · qh


= ±2 det


2 0 · · · 0
1 p1
... ...
...
... ... ...
1 0 · · · ph


= ±4p1 · · · ph.
The proof is complete. □
We deduce an elegant description of all the Seifert homology spheres.
Corollary 10.3.16. For every setp1, . . . , ph of pairwise coprime inte-
gers pi ⩾ 2thereisauniquehomologysphere Σ(p1, . . . , ph)Seifert-ﬁbering
over (S2, p1, . . . , ph). Every Seifert homology sphere arises in this way.
Proof. By the previous proposition a Seifert manifold
M =
(
S, (p1, q1), . . . ,(ph, qh)
)
is a homology sphere if and only ifS = S2 and |ep1 · · · ph| = 1. We have
ep1 · · · ph =
h∑
i=1
qi
pi
p1 · · · ph =
h∑
i=1
qi p1 · · · ˆpi · · · ph =
h∑
i=1
qi p′
i
where we set p′
i = p1 · · · ˆpi · · · ph. The integers p1, . . . , ph are pairwise
coprime if and only ifp′
1, . . . , p′
h are globally coprime (no prime number
divides all of them). The equation ∑
i=1 qi p′
i = 1 is satisﬁed by some
q1, . . . , qh ⇐ ⇒they are globally coprime. Diﬀerent solutionsqi are related
bymovesasinProposition10.3.11(exercise)andproducethesameSeifert
ﬁbration. □
For instance, the homology spheresΣ(p1) and Σ(p1, p2) are just S3
by Example 10.3.10. The simplest homology sphere with three singular
ﬁbres is Σ(2, 3, 5). This manifold is called thePoincaré homology sphere
and we will soon see that its fundamental group has order 120. All the
other Seifert homology spheres have inﬁnite fundamental group: this is
related to the fact that∑1
pi
< h − 2 for all choices of(p1, . . . , ph) with
h ⩾ 3 except (2, 3, 5), as we will soon see. A Seifert homology sphere of
type Σ(p1, p2, p3) is called aBrieskorn homology sphere.


## Page 331

10.3. SEIFERT MANIFOLDS 323
10.3.6. Coverings. WenowstarttoinvestigatethecoveringsofSeifert
ﬁbered spaces. Our main goal will be to subdivide the Seifert manifolds
into nine classes: this will be done in Section 10.3.9.
Like ordinary ﬁbrations, Seifert ﬁbrations behave well with respect to
coverings. Let M → S be a Seifert ﬁbration and˜M → M a covering. The
foliation into circles ofM lifts to a foliation into circles or lines in˜M, with
some quotient space˜S.
Proposition 10.3.17. The quotient ˜S is an orbifold covering ofS.
• If ˜M foliates in circles then˜M → ˜S is a Seifert ﬁbration,
• If ˜M foliates in lines then˜M → ˜S is a line bundle.
In the second case˜S has no singular points.
Proof. This holds on all coverings of a standard ﬁbered solid torus
and hence holds everywhere. □
We now concentrate ourselves on the ﬁnite-degree case.
10.3.7. Finite-degree coverings. We deﬁne aﬁnite-degree covering
of a Seifert ﬁbrationM → S to be a commutative diagram
˜M →→
↓↓
M
↓↓˜S →→ S
where ˜M → ˜S isaSeifertﬁbration, ˜M → M isaﬁnite-degreecovering, and
˜S → S is an orbifold covering. Proposition 10.3.17 implies the following.
Corollary 10.3.18. Let M → S be a Seifert ﬁbration. Every ﬁnite-
degree covering ˜M → M induces a ﬁnite-degree covering of Seifert ﬁbra-
tions:
˜M →→
↓↓
M
↓↓˜S →→ S
The dotted arrows indicate the maps that are induced. The degreed
of such a covering˜M → M splits into two parts:
• the horizontal degree dh is the degree of the covering˜S → S,
• the vertical degree dv is the degree with which a regular ﬁbre of
˜M covers a regular ﬁbre ofM.
The vertical degree is well-deﬁned since regular ﬁbres in˜M form a con-
nected set. The pre-image of a regular ﬁbre inM consists of dh regular
ﬁbres in ˜M, each ﬁbering with degreedv. Therefore
d = dh · dv.
Acovering ˜M → M ishorizontal orvertical ifrespectively dv = 1 or dh = 1.


## Page 332

324 10. SEIFERT MANIFOLDS
Proposition 10.3.19 (Pull-back). Let M → S be a Seifert ﬁbration.
Every ﬁnite-degree orbifold covering ˜S → S is induced by a unique hori-
zontal covering of Seifert ﬁbrations:
˜M →→
↓↓
M
↓↓˜S →→ S
Proof. Like for ordinary bundles, there is a unique way to deﬁne˜M
by pulling back the Seifert ﬁbration on ﬁbered solid tori. □
Recall that an orbifold isvery good when it is ﬁnitely covered by a
surface. Every locally orientable 2-orbifold is very good except the bad
orbifolds S2(p1) and S2(p1, p2) with p1 ̸= p2, see Theorem 6.2.10 and
Corollary 6.2.11.
Corollary 10.3.20. If S is good, every Seifert ﬁbration M → S is
ﬁnitely covered by a circle bundle over a surface.
Proof. Pull-back the ﬁbration along the surface cover˜S → S. □
Proposition 10.3.21. Every ﬁnite-degree covering between Seifert ﬁ-
brations is a composition of one vertical and one horizontal covering.
Proof. Let p : ˜M → M be a covering of Seifert ﬁbrations, with base
spaces ˜S → S. If we pull-back M to ˜S we get a horizontal covering
ph : Mh → M. There is a natural vertical pv : ˜M → Mh such that p =
ph ◦ pv. □
10.3.8. Euler number and Euler characteristic.The Euler number
of the ﬁbration and the Euler characteristic of the base orbifold (deﬁned
in Section 6.2.4) behave well with coverings.
Proposition 10.3.22. Let p : ˜M → M be a ﬁnite covering of closed
Seifert ﬁbrations with base orbifolds˜S, S, with degrees(dh, dv). We get
χ( ˜S) = dh · χ(S),
e( ˜M) = dh
dv
· e(M).
Proof. The ﬁrst equality holds for every orbifold covering˜S → S.
Concerning the second one, by Proposition 10.3.21 we may supposep is
either vertical or horizontal. Write
M =
(
S, (p1, q1), . . .(ph, qh)
)
and recall thatM is obtained from a circle bundleN by (pi , qi )-ﬁlling the
boundary torusTi for all i = 1, . . . , h. Set ˜Ti = p−1(Ti ) and ˜N = p−1(N).
If p is vertical, we ﬁx a section of˜N and note that it projects to a
section of N: these sections induce meridians on˜Ti and Ti. Here ˜Ti is a


## Page 333

10.3. SEIFERT MANIFOLDS 325
single torus and ˜Ti → Ti wraps the ﬁbre with degreed = dv. Since the
covering extends to the ﬁlled solid tori, we haved|qi and ˜Ti is ﬁlled with
parameters (pi , qi /d). Therefore e( ˜M) = e(M)/d.
If p is horizontal, we ﬁx a section ofN, and its counterimage is a
sectionof ˜N: thesesectionsinducemeridianson Ti and ˜Ti. Now ˜Ti consists
of some tori˜Ti = ˜Ti ,1 ⊔ . . . ⊔ ˜Ti ,ki and ˜Ti ,j → Ti wraps the meridians with
some degreedi ,j. The total sum of these local degrees isdi ,1 + . . .+ di ,ki =
d = dh. Similarly as above we havedi ,j|pi and the ﬁlling solid torus at˜Ti ,j
has parameters(pi /di ,j, qi ). Therefore
e( ˜M) =
h∑
i=1
ki∑
j=1
di ,jqi
pi
=
h∑
i=1
d · qi
pi
= d · e(M).
This concludes the proof. □
An important consequence is that the signs ofχ(S) and e(M) are
invariant under ﬁnite coverings.
10.3.9. Commensurability classes. We now would like to subdivide
the Seifert manifolds into few classes, and to this purpose we introduce a
general equivalence relation between manifolds.
Deﬁnition 10.3.23. Two manifolds M and N are commensurable if
there is a manifold that covers bothM and N with ﬁnite degrees.
Proposition 10.3.24. Commensurability is an equivalence relation.
Proof. If M is commensurable withN1 and N2, it has ﬁnite-sheeted
coverings M1, M2 that cover N1 and N2 corresponding to ﬁnite-index sub-
groups Γ1, Γ2 < π 1(M). The subgroup Γ = Γ 1 ∩ Γ2 has also ﬁnite index
and determines a manifold that covers bothN1 and N2. □
Exercise 10.3.25. There are three commensurable classes of closed
surfaces, determined by their Euler characteristic being positive, null, or
negative.
We now classify the commensurability classes of Seifert manifolds.
The 3-torus is of courseT × S1 = S1 × S1 × S1.
Proposition 10.3.26. A closed Seifert ﬁbrationM → S has:
• χ(S) > 0 and e = 0 ⇐ ⇒M is covered byS2 × S1,
• χ(S) > 0 and e ̸= 0 ⇐ ⇒M is covered byS3,
• χ(S) = 0 and e = 0 ⇐ ⇒M is covered by the 3-torus,
• χ(S) = 0 and e ̸= 0 ⇐ ⇒M is covered by a twisted bundle over
T,
• χ(S) < 0 and e = 0 ⇐ ⇒M is covered by Sg × S1 for some
g > 1,
• χ(S) < 0 and e ̸= 0 ⇐ ⇒M is covered by a twisted bundle over
Sg for some g > 1.


## Page 334

326 10. SEIFERT MANIFOLDS
χ > 0 χ = 0 χ < 0
e = 0 S2 × S1 S1 × S1 × S1 S2 × S1
e ̸= 0 S3 (
T, (1, 1)
) (
S2, (1, 1)
)
∂M ̸= ∅ D × S1 T × [0, 1] P × S1
Table 10.1.There are 9 commensurability classes of Seifert
manifolds: 6 closed and 3 with boundary. Every Seifert man-
ifold M is commensurable with one (and only one) of these
9 manifolds. The commensurability class ofM is easily de-
tected by looking at its invariantsχ and e (the latter only in
the closed case). The surfacesT, S2, D, P are the torus, the
genus-2 surface, the disc, and the pair-of-pants. Note that
S3 =
(
S2, (1, 1)
)
.
Proof. If S is a bad orbifold, then S = S2(p) or S2(p1, p2) with
p1 ̸= p2 and hence we gete ̸= 0 and χ(S) > 0. The manifoldM is a lens
space by Example 10.3.10 and is hence covered byS3.
If S is good, the ﬁbrationM → S is covered by a circle bundle˜M → ˜S
over an orientable closed surface˜S by Corollary 10.3.20. By Proposition
10.3.22 the numbers χ( ˜S) and e( ˜M) have the same signs ofχ(S) and
e(M). Therefore ˜S = S2, T, or Sg with g > 1, depending on whether
χ(S) is positive, null, or negative. Exercise 10.2.7 says that the circle
bundle ˜M → ˜S is trivial ⇐ ⇒e( ˜M) = 0 ⇐ ⇒e(M) = 0 . Note that a
non-trivial bundle overS2 is a lens spaceL(e, 1) with e ̸= 0 and is hence
covered by S3.
We have proved thatM is covered (according to the signs ofχ and e)
by a manifold belonging to one of the six types:S3, S2 × S1, the 3-torus,
a twisted bundle overT, Sg × S1, and a twisted bundle overSg. It remains
to prove thatM cannot be covered by two manifoldsM1, M2 belonging to
two diﬀerent types: this holds because manifolds of distinct types are not
commensurable. To prove that, note that the ﬁnite cover of a manifold
of one of the six types is a manifold of the same type, and Corollary
10.2.10 implies that a manifold cannot belong to two diﬀerent types. If
two manifolds of distinct types were commensurable they would be covered
by a manifold belonging to both types, yielding a contradiction. □
We can now easily classify all closed Seifert manifolds up to commen-
surability. To conclude we just need to solve the following exercise.
Exercise 10.3.27. Pick S = Sg and e > 0. Construct:
• a degree-e vertical covering
(
S, (1, 1)
)
→
(
S, (1, e)
)
,
• a degree-e horizontal covering
(˜S, (1, e)
)
→
(
S, (1, 1)
)
if g ⩾ 1.


## Page 335

10.3. SEIFERT MANIFOLDS 327
Hint. If g ⩾ 1 then S has covers of any degreee. To construct them,
pick surjective homomorphismsπ1(S) → H1(S) → Z/eZ. □
Corollary 10.3.28. There are six commensurability classes of closed
Seifert manifolds, depending onχ and e as shown in Table 10.1.
Proof. By the previous exercise the non-trivial (or trivial) bundles over
closed surfaces withχ < 0 (or χ = 0, χ > 0) are all commensurable. □
Corollary 10.3.29. A closed Seifert ﬁbrationM → S has e = 0 ⇐ ⇒
it is ﬁnitely covered by a trivial circle bundle.
We recall that a Seifert manifoldM may have non-isomorphic Seifert
ﬁbrations M → S and M → S′, and the invariantsχ, χ′ and e, e′ of the
two ﬁbrations are not necessarily equal; howeverχ is positive, null, or
negative if and only ifχ′ is, and e vanishes if and only ife′ does (in the
closed case). This holds because the commensurability class ofM does
not depend on its ﬁbration. For instance, Exercise 10.3.6 shows that a
lens space M = L(p, q) with p > 0 has many ﬁbrations, but each with
χ > 0 and e ̸= 0.
We now consider the boundary case, which is simpler because circle
bundles over orientable surfaces with boundary are always trivial. LetA
denote the annulus andSg,b be the surface of genusg with b open discs
removed.
Proposition 10.3.30. A Seifert ﬁbrationM → S with boundary has
• χ(S) > 0 ⇐ ⇒M = D × S1,
• χ(S) = 0 ⇐ ⇒M is covered byA × S1 = T × [0, 1],
• χ(S) < 0 ⇐ ⇒M is covered bySg,b × S1 for some g + b > 2.
Proof. Every Seifert manifold with boundary is covered by a circle
bundle over an orientable surface, and such a bundle is trivial here. If
χ > 0 the base surface is a disc with at most one cone point and hence
M is a standard ﬁbered solid torus. □
Corollary 10.3.31.There are three commensurability classes of Seifert
manifolds with boundary, depending onχ as shown in Table 10.1.
Proof. The surfaces Sg,b, with b > 0 and g + b > 2 are commensu-
rable (exercise). □
We now characterise some commensurability classes by looking at the
fundamental groups.


## Page 336

328 10. SEIFERT MANIFOLDS
χ > 0 χ = 0 χ < 0
e = 0 Z Z 3
e ̸= 0 {e}
∂M ̸= ∅ Z Z 2
Table 10.2. There are ﬁve Seifert manifolds M with
π1(M) = Zh and they belong to distinct commensurability
classes. The fundamental groupπ1(N) of every other mani-
fold N in these ﬁve classes is virtually abelian: it containsZh
as a ﬁnite-index subgroup.
10.3.10. Virtually abelian fundamental groups.A group G is virtu-
ally abelian of rankh if it containsZh as a ﬁnite-index subgroup.
This is a ﬁnite-index-independent property: ifG′ < G has ﬁnite index,
the group G′ is virtually abelian of rankh if and only ifG is. Therefore a
manifold M has a virtually abelian fundamental group of rankh ⇐ ⇒every
manifold N commensurable with M also has ⇐ ⇒there is a manifoldN in
the commensurability class withπ1(N) = Zh.
Proposition10.3.32. ThereareﬁvecommensurabilityclassesofSeifert
manifolds with virtually abelian fundamental groups, shown in Table 10.2.
Proof. Theseﬁveclassescontain S2×S1, S1×S1×S1, S3, D×S1,and
A × S1. The remaining four classes do not contain manifolds with abelian
fundamental group: every manifold in these classes is covered by some
S × S1 with χ(S) < 0 or
(
Sg, (1, e)
)
with g ⩾ 1 and e ⩾ 1 (use Exercise
10.3.27). The fundamental group of such manifolds is notZh: the former
because π1(S) is not abelian, and the latter because its abelianization
contains torsion, see Exercise 10.2.9. □
It could be reasonable to expect these ﬁve commensurability classes
to contain manifolds of some simpler topological nature, which are easier
to study and classify. We will see however in Section 10.4.7 that the
Seifert manifolds covered byS3 are quite interesting and their topological
classiﬁcation is certainly not immediate: we already experienced that for
lens spaces in Theorem 10.1.12, whose classiﬁcation is quite involved. The
other four classes are indeed of a simpler nature: we now prove that each
contains ﬁnitely many manifolds, and we classify them completely.
10.3.11. Finite commensurability classes.We now completely iden-
tify the commensurability classes of Seifert manifolds that contain only
ﬁnitely many manifolds.
We start by considering manifoldsM with boundary. We have already
seen that the classχ > 0 contains only the solid torus. The classχ = 0
also contains few manifolds:


## Page 337

10.3. SEIFERT MANIFOLDS 329
Figure10.11. DrawtheorientablelinebundleovertheKlein
bottle as S1× [−1, 1]× [−1, 1]/ψ where ψ identiﬁes the
lower and upper (yellow) annuliS1×[−1, 1]×{±1} by gluing
(ei θ, t) to (e−i θ,−t). The Klein bottle is drawn in green
(left). This manifold has two ﬁbrations: a horizontal one
with ﬁbres S1× x× y and base surface the green Möbius
strip (centre), and a vertical one with ﬁbresx× y× [−1, 1]
and base surface the green disc with two cone points of order
two (the green annulus becomes a disc after identifying the
points (ei θ, 0)and (e−i θ, 0)). The two singular ﬁbres of order
two lie above(±1, 0) and are drawn in red (right).
Proposition 10.3.33. Every Seifert ﬁbration with boundary andχ = 0
is isomorphic to one of the following:
A × S1, S ×
∼
S1,
(
D, (2, 1), (2, −1)
)
.
The Seifert manifold is correspondingly diﬀeomorphic to the interval bun-
dles T × I, K ×
∼
I, and K ×
∼
I again. Here A, S, and K are the annulus,
the Möbius strip, and the Klein bottle.
Proof. Theorbifoldswithboundaryand χ = 0 are A, S, and(D, 2, 2).
EverySeifertﬁbrationover (D, 2, 2)isisomorphicto
(
D, (2, 2n+1), (2, 2m+
1)
)
and does not depend onn, m ∈ Z by Proposition 10.3.11. Hence there
is only one Seifert ﬁbration over the orbifold(D, 2, 2), which we write as(
D, (2, 1), (2, −1)
)
only for aesthetic reasons (to gete = 0).
We get three manifolds and we now prove that they are all diﬀeo-
morphic to some interval bundle. The diﬀeomorphismA × S1 ∼= T × I
is obvious. Draw K ×
∼
I as S1 × [−1, 1] × [−1, 1]/ψ as in Figure 10.11.
The manifold has two ﬁbrations: a horizontal one by circlesS1 × x × y,
and a vertical one by segmentsx × y × [−1, 1]. The horizontal one gives
S ×
∼
S1 and the vertical one closes to a Seifert ﬁbration over the disc with
two singular ﬁbres of order two, and hence is(D, (2, 1), (2, −1)). □


## Page 338

330 10. SEIFERT MANIFOLDS
Corollary 10.3.34.Every Seifert manifold with boundary andχ ⩾ 0 is
diﬀeomorphic to D × S1, T × I, or K ×
∼
I.
We now turn to closed Seifert manifolds. We have seen thatK ×
∼
I
ﬁbres in two non-isomorphic ways, and this has some consequences.
Corollary 10.3.35. The following diﬀeomorphisms hold:
(
S2, (2, 1), (2, −1), (p, q)
)∼=
(
RP2, (q, p)
)
,
(
S2, (2, 1), (2, 1), (2, −1), (2, −1)
)∼= K ×
∼
S1.
Proof. Both equalities follow from
(
D, (2, 1), (2, −1)
)∼= S ×
∼
S1. In
theﬁrstwelookatFigure10.11tocheckthata (p, q)curvein
(
D, (2, 1), (2, −1)
)
becomes a (q, p) curve in S ×
∼
S1. The second equality is obtained by
doubling the line bundleK ×
∼
I. □
WewanttoclassifytheclosedSeifertmanifoldswith χ ⩾ 0and e = 0.
We start with the caseχ > 0.
Proposition 10.3.36. Every closed Seifert ﬁbration withχ > 0 and
e = 0 is isomorphic to one of the following:
S2 × S1, RP2 ×
∼
S1,
(
S2, (p, q), (p, −q)
)
.
The manifolds of the last type are all diﬀeomorphic toS2 × S1.
Proof. If the base surfaceS is a sphere with⩽ 2 singular ﬁbres, we
use Exercise 10.3.6. Otherwise S is one of the following orbifolds (see
Table 6.1):
(S2, 2, 2, p), (S2, 2, 3, 3), (S2, 2, 3, 4), (S2, 2, 3, 5), RP2, (RP2, p)
with p ⩾ 2. In all cases exceptRP2, we gete ̸= 0 for any choice of Dehn
ﬁlling parameters: for instance
e
(
S2, (2, q1), (2, q2), (p, q3)
)
= q1 + q2
2 + q3
p ̸= 0.
The other cases are analogous. □
The manifold RP2 ×
∼
S1 is not diﬀeomorphic to S2 × S1, because
they have non-isomorphic fundamental groups. Moreover, RP2 ×
∼
S1 is
not prime:
Exercise 10.3.37. The two manifoldsRP2 ×
∼
S1 and RP3#RP3 are
diﬀeomorphic.
We will soon see thatRP2 ×
∼
S1 is the unique non-prime Seifert man-
ifold. We now turn to theχ = 0 case.
Proposition 10.3.38. Every closed Seifert ﬁbration withχ = 0 and
e = 0 is isomorphic to one of the seven listed in Table 10.3. These seven
manifolds are all pairwise non-diﬀeomorphic, except
(
S2, (2, 1), (2, 1), (2, −1), (2, −1)
)∼= K ×
∼
S1.


## Page 339

10.3. SEIFERT MANIFOLDS 331
M H1(M, Z)
T × S1 Z3
K ×
∼
S1 Z × Z/2Z × Z/2Z
(
S2, (2, 1), (2, 1), (2, −1), (2, −1)
)
Z × Z/2Z × Z/2Z
(
S2, (3, 1), (3, 1), (3, −2)
)
Z × Z/3Z
(
S2, (2, 1), (4, −1), (4, −1)
)
Z × Z/2Z
(
S2, (2, 1), (3, 1), (6, −5)
)
Z(
RP2, (2, 1), (2, −1)
)
Z/4Z × Z/4Z
Table 10.3. The seven closed Seifert ﬁbrations withχ = 0
and e = 0. Two of these manifolds are actually diﬀeomor-
phic, so we get six closed Seifert manifolds up to diﬀeomor-
phism, distinguished by their homology.
χ > 0 χ = 0 χ < 0
e = 0 2 6 ∞
e ̸= 0 ∞ ∞ ∞
∂M ̸= ∅ 1 2 ∞
Table 10.4. The number of Seifert manifolds in each com-
mensurability class.
Proof. The closed orbifolds withχ = 0 are
T, K, (RP2, 2, 2), (S2, 2, 2, 2, 2), (S2, 2, 3, 6), (S2, 3, 3, 3), (S2, 2, 4, 4).
It is easy to show that by imposinge = 0 we get the ﬁbrations listed.
The homology calculation is an easy exercise and luckily distinguishes all
the manifolds except (of course) the two diﬀeomorphic ones (see Corollary
10.3.35). □
Summingup,therearefourcommensurabilityclassescontainingﬁnitely
many manifolds, and their number is shown in Table 10.4.
10.3.12. Universal cover. We now determine the universal cover of
all the closed Seifert manifolds. Nothing strange happens: we either get
S3, S2 × R, or R3.
Proposition 10.3.39. The universal cover of a closed Seifert manifold
is shown in Table 10.5.


## Page 340

332 10. SEIFERT MANIFOLDS
χ > 0 χ = 0 χ < 0
e = 0 S2 × R R 3 R3
e ̸= 0 S3 R3 R3
Table 10.5.The universal cover of a closed Seifert manifold
depends on its invariantse and χ.
Proof. The universal cover of a circle bundle over a surfaceS with
χ(S) ⩽ 0 is a line bundle over the universal coverR2 of S. The line bundle
is trivial sinceR2 is contractible and we getR2 × R = R3. □
Corollary 10.3.40. Every Seifert manifoldM is irreducible or covered
by S2 × R. In the latter caseM is diﬀeomorphic toS2 × S1 or RP2 ×
∼
S1.
Proof. Iftheuniversalcoveris S3 or R3, itisirreducibleandhencealso
M is. When M has boundary, we apply the proof of Proposition 10.3.39
to the interior ofM and ﬁnd that its universal cover isR3. □
Hence every Seifert manifold is prime exceptRP2 ×
∼
S1 = RP3#RP3.
10.3.13. Fibre-Parallel Dehn ﬁlling. We have investigated various
topological properties of Seifert manifolds, and we are now curious: what
happens if we perform a forbidden ﬁbre-parallel Dehn ﬁlling? We start by
looking at the basic blockP × S1, where P is a pair-of-pants.
Proposition 10.3.41. A ﬁbre-parallel Dehn ﬁlling onP × S1 produces
the connected sum of two solid tori; the ﬁbres ofP × S1 become the
meridians of the solid tori.
Proof. Let γ ⊂ ∂P be the component whose torusγ × S1 is ﬁlled.
Pick an essential arcα in P with both endpoints inγ: the ﬁbered annulus
A = α × S1 closes up to a two-sphereS in the Dehn ﬁlling.
The sphere S separates the ﬁlled manifold into two portions, each
diﬀeomorphic to T × [0, 1] with a two-handle attached along a non-trivial
curve: this is a holed solid torus. Every ﬁbre now bounds a disc there.□
We now turn to arbitrary bundles.
Exercise 10.3.42. Let S be a compact surface withb ⩾ 1 boundary
components. The ﬁbre-parallel Dehn ﬁlling ofS ×
∼
S1 is diﬀeomorphic to
the connected sum ofb − 1 solid tori and−χ(S) + 2− b copies ofS2 × S1.
We now deduce a more general fact: a ﬁbre-parallel Dehn ﬁlling of a
Seifert manifold is a connected sum of lens spaces and solid tori.
Corollary 10.3.43. The ﬁber-parallel Dehn ﬁlling of
(
S, (p1, q1), . . . ,(ph, qh)
)


## Page 341

10.4. CLASSIFICATION 333
is diﬀeomorphic to the connected sum
L(p1, q1)# . . .#L(ph, qh)#k(S2 × S1)#b−1(D2 × S1)
where S has b boundary components andk = −χ(S) + 2 − b.
If S is orientable thenk is twice the genus ofS.
Corollary 10.3.44. Every Dehn ﬁlling of a Seifert manifold is a con-
nected sum of Seifert manifolds.
If we have a Seifert manifoldM with many boundary components and
we Dehn ﬁll some of them, we are guaranteed to produce a new Seifert
manifold, unless one of the Dehn ﬁlling kills a ﬁber-parallel slope: in that
case the manifold “degenerates” to a connected sum of lens spaces and
solid tori. This is an interesting phenomenon to keep in mind, because it
will reproduce in Chapter 15 in the hyperbolic world: we will show that
by Dehn ﬁlling a cusped hyperbolic three-manifold we always get a new
hyperbolic manifold if we avoid a ﬁnite number of “exceptional slopes”
on every boundary torus; if some of the exceptional slopes is employed,
the manifold is possibly not hyperbolic, and it typically “degenerates” and
breaks into simpler pieces.
10.4. Classiﬁcation
In the previous section we have classiﬁed the Seifert ﬁbrations up to
isomorphism and the Seifert manifolds up to commensurability. We now
want to complete our study by classifying Seifert manifolds up to diﬀeo-
morphism: our ﬁnal achievement will be Theorem 10.4.19 that determines
precisely the Seifert manifolds that admit non-isomorphic ﬁbrations.
The proof of Theorem 10.4.19 is not straightforward: we will apply
diﬀerent techniques to diﬀerent classes of Seifert manifolds. We start by
studying the fundamental group of Seifert manifolds, showing in particular
that it ﬁts into a nice short exact sequence. Then we study essential sur-
faces: we show that these can always be isotoped to be either in “vertical”
or “horizontal” position with respect to the ﬁbration.
In “most” cases, a Seifert manifold contains many incompressible ver-
tical tori and these can be used to characterise the manifold. When the
Seifert manifold is “small” it contains no such tori, and we must use diﬀer-
ent techniques: for instance we look at its fundamental group, which may
be ﬁnite or inﬁnite.
10.4.1. Fundamental group. We study the fundamental group of
Seifert manifolds. Recall that every closed Seifert ﬁbration has two fun-
damental invariantsχ and e that determine the commensurability class of
the Seifert manifold. Finite fundamental groups are easily detected:
Proposition 10.4.1. A closed Seifert manifold has ﬁnite fundamental
group ⇐ ⇒it is covered byS3 ⇐ ⇒it has χ > 0 and e ̸= 0.


## Page 342

334 10. SEIFERT MANIFOLDS
Proof. A compact manifold has ﬁnite fundamental group⇐ ⇒its uni-
versal cover is also compact. Table 10.5 applies. □
Ordinary ﬁbrations generate exact sequences in homotopy, and also
Seifert ﬁbrations do. Recall that a good orbifold has a well-deﬁned fun-
damental group, and that all locally orientable surface orbifolds are good
except (S2, p) and (S2, p1, p2) with p1 ̸= p2. We will ignore bad orbifolds,
since the Seifert manifolds ﬁbering over them are lens spaces.
Proposition 10.4.2. Let M → S be a Seifert ﬁbration over a good
orbifold S. There is an exact sequence
1 − →K − →π1(M) − →π1(S) − →1
where K is the normal cyclic subgroup ofπ1(M) generated by a regular
ﬁber and π1(S) is the orbifold fundamental group ofS.
Proof. The universal cover ˜M of M ﬁbres over the universal cover˜S
of S. The ﬁber is a circle or a line, depending on whetherπ1(M) is ﬁnite
or inﬁnite, see Proposition 10.3.39.
The groupπ1(M) acts ﬁbre-preservingly on˜M and hence acts also on
˜S as a covering automorphism for˜S → S. This induces a natural homo-
morphism π1(M) → π1(S). Its kernel consists of all deck transformations
of ˜M that ﬁx the ﬁbres: these are precisely K. The homomorphism is
surjective because every loop inS lifts to a loop inM. □
We now look more closely at the normal cyclic subgroupK.
Proposition 10.4.3. The group K is inﬁnite if and only ifπ1(M) is.
Proof. The group K acts freely and proper discontinuously on each
ﬁber of the universal cover˜M, and it quotients it to a circle. The ﬁber in
˜M is compact if and only ifπ1(M) is ﬁnite. □
Proposition 10.4.4. The group K lies in the centre ofπ1(M) if and
only if S is orientable orK has order two.
Proof. If S is orientable, the manifoldM is a Dehn ﬁlling of a product
S′ × S1 where the ﬁber is obviously in the centre, and it remains so after
the Dehn ﬁlling. IfS is non-orientable, pick an orientation-reversing loop
α in S: there is a Klein bottle ﬁbering aboveα and we getαgα−1 = g−1
for the ﬁberg ∈ K. Therefore K is central if and only ifg2 = e. □
In many cases the subgroupK may be characterised intrinsically.
Proposition 10.4.5. Let M be a Seifert manifold whose fundamental
group is not virtually abelian. The subgroup K ◁ π 1(M) is the unique
maximal cyclic normal subgroup ofπ1(M).


## Page 343

10.4. CLASSIFICATION 335
Proof. Suppose by contradiction thatπ1(M) contains a cyclic normal
subgroup K′ which is not contained inK. Therefore its image inπ1(S) is
a non-trivial cyclic normal subgroup.
If χ(S) < 0 then int(S) = H2/Γ for a discrete groupΓ = π1(S) of
isometries of H2. Corollary 5.1.10 implies that Γ does not contain non-
trivial cyclic normal subgroups.
If χ(S) = 0 then int(S) = R2/Γ for a discrete groupΓ = π1(S) of
isometries of R2, which in fact may contain cyclic normal subgroups: so
we need a more careful analysis. Sinceπ1(M) is not virtually abelian, the
surface S is closed ande ̸= 0.
The image of K′ in π1(S) is non-trivial, normal, and cyclic, and is
hence inﬁnite (ﬁnite cyclic groups are generated by rotations and cannot
be normal). Therefore K′ is inﬁnite and it intersects non-trivially every
ﬁnite-index subgroup ofπ1(M): up to substitutingM with a ﬁnite cover
we may suppose thatS is a torus.
The image of K′ is a non-trivial subgroup ofπ1(S) = Z × Z. Pick
two elementsa′ ∈ K′, b ∈ π1(M) whose images inπ1(S) generate a ﬁnite-
index subgroup of π1(S). Pick a generator a ∈ K. The three elements
a, a′, bgenerateaﬁnite-indexsubgroupof π1(M). Theelement a iscentral
by Proposition 10.4.4. We have b−1a′b = ( a′)±1 because K′ = Z is
normal. Theelements a, a′, b2 commuteandgenerateaﬁnite-indexabelian
Z3 < π 1(M): a contradiction. □
Corollary 10.4.6. Let M be a Seifert manifold whose fundamental
group is not virtually abelian. The centre ofπ1(M) is K if S is orientable
and trivial otherwise.
Proof. Use Propositions 10.4.4 and 10.4.3. □
We have collected some important information on the fundamental
group of Seifert manifolds. We now move from algebra to topology and
study the essential surfaces in Seifert manifolds: we will prove a theorem
analogous to Proposition 9.3.18, namely that every essential surface in a
Seifert manifold is either horizontal or vertical.
10.4.2. Horizontalandverticalsurfaces. Wenowwanttostudyhow
Seifertmanifoldsmaycontaininterestingsurfaces. Let M → S beaSeifert
ﬁbration. A properly embedded surfaceΣ ⊂ M is
• vertical if it is a union of some regular ﬁbres,
• horizontal if it is transverse to all ﬁbres.
If Σ is vertical, it is either an annulus, a torus, or a Klein bottle, pro-
jecting respectively to an arc, an orientation-preserving, or an orientation-
reversing simple closed curve that avoids the cone points. Vertical surfaces
are in 1-1 correspondence with 1-dimensional objects inS and are thus eas-
ily determined.


## Page 344

336 10. SEIFERT MANIFOLDS
S0
D1
D2
D3
Figure 10.12. We cut S along k (blue) arcs to get S =
S0∪ D1∪ . . .∪ Dk with Di a disc containing the (red) cone
point pi: here k = 3.
Horizontal surfaces are more subtle. We ﬁrst note that ifΣ is hori-
zontal, the natural projectionΣ → S is an orbifold covering. When does
M contain a horizontal surface? It certainly does whenM has boundary.
Proposition 10.4.7. Every Seifert ﬁbration M → S with boundary
contains a horizontal surface.
Proof. We have M =
(
S, (p1, q1), . . . ,(pk , qk)
)
. We cut S along k
arcs as in Figure 10.12 to getS = S0 ∪ D1 ∪ . . . ∪ Dk with Di a disc
containing the cone pointpi. Let p be a common multiple ofp1, . . . , pk.
The bundle over S0 has no singular ﬁbres and is henceS0 ×
(∼)
S1. The
bundle S0 ×
(∼)
S1 contains a (possibly disconnected) horizontal surfaceΣ
intersecting the ﬁbres in any ﬁxed numbern of points (exercise) and we
pick one Σ with n = p.
For every i = 1 , . . . , k there is a standard ﬁbered solid torus lying
above Di, attached toS0 ×
(∼)
S1 via a vertical annulusA. The meridian of
this solid torus intersectsA into pi horizontal segments. Pick p
pi
parallel
meridians: bothΣandthesemeridiansintersect Ain p horizontalsegments
and can hence be glued to form a horizontal surface forM. □
On closed Seifert manifolds the existence of a horizontal surface is
fully detected by the Euler number.
Proposition 10.4.8. A closed Seifert ﬁbrationM → S contains a hor-
izontal surface if and only ife = 0.
Proof. Suppose M → S contains a horizontal surfaceΣ. We pull-
back the ﬁbration along the orbifold coveringΣ → S to get a ˜M → Σ.
The horizontal surfaceΣ lifts to a section of˜M → Σ. Since the ﬁbration
has a section, we gete( ˜M) = 0 and hence e(M) = 0.
Conversely, supposee(M) = 0. Drill one open ﬁbered solid torus from
M: we know by the previous proposition that the resulting ﬁbration has


## Page 345

10.4. CLASSIFICATION 337
a horizontal surface Σ. Its boundary consists of parallel curves of some
type (p, q) with p > 0. If we Dehn-ﬁll the manifold by killing these curves
we get another Seifert manifoldM′, to which the ﬁbration and the section
extend: therefore e(M′) = 0 . At most one pair (p, q) may produce a
manifold with e = 0, and henceM = M′. □
10.4.3. Essential surfaces. Recall the deﬁnition of essential surface
from Sections 9.2.11 and 9.4.6. We now show that essential surfaces in
irreducible Seifert manifolds are either vertical or horizontal.
Proposition 10.4.9. Let M → S be a Seifert ﬁbration and M be
irreducible. Every essential surfaceΣ is isotopic to a vertical or horizontal
surface.
Proof. See M as a Dehn ﬁlling of S ×
(∼)
S1. We suppose that Σ
intersects transversely the cores of the ﬁlling solid tori in the minimum
number of points up to isotopy. After an isotopyΣ intersects the ﬁlling
solid tori into parallel horizontal discs.
Decompose S into one 0-handle and someg one-handles. We see the
0-handle as a2g-gon and each 1-handle as a rectangle. Above each edge
of the2g-gon or of a rectangle there is a vertical annulusA. We putΣ in
transverse position with respect to these vertical annuli and up to isotopy
we may suppose thatΣ ∩ A consists either of vertical ﬁbres or horizontal
arcs for eachA. Indeed we can easily eliminate trivial circles (becauseΣ
is incompressible and M is irreducible) and arcs forming bigons with∂A
(because Σ is ∂-irreducible and has minimal intersection with the solid tori
cores).
Above every polygonal handle ofS there is a prismatic solid torusW.
The closed curvesΣ ∩ ∂W are made of horizontal or vertical arcs and are
hence essential, forming some parallel slopes in∂W. We can suppose that
Σ ∩ W consists of essential discs or incompressible surfaces (if there is a
compressing disc D inside W, then ∂D ⊂ Σ bounds a disc inΣ which we
isotope to D reducing the intersection with the vertical annuli). We can
also suppose thatΣ ∩ W is ∂-incompressible with respect to every vertical
annulus A ⊂ ∂W, in the sense that there is no∂-compressing discD with
∂D ⊂ A ∪ Σ (otherwise we isotopeΣ and reduce intersections).
By Proposition 9.3.16 the surfaceΣ ∩ W consists either of essential
discs or ∂-parallel annuli (not both). In the ﬁrst caseΣ ∩ ∂W consists of
horizontal curves and Σ ∩ W consists of horizontal discs. In the second
case, since the annuli are ∂-incompressible with respect to the vertical
annuli in ∂W, their boundaries must be vertical circles lying in distinct
vertical annuli. Up to isotopyΣ ∩ W consists of vertical annuli.
We have decomposedΣ into horizontal discs or vertical annuli, and
both cannot coexist. HenceΣ is either horizontal or vertical. □
Corollary10.4.10. EverySeifertmanifoldisirreducibleand ∂-irreducible,
except S2 × S1, RP2 ×
∼
S1, and D × S1.


## Page 346

338 10. SEIFERT MANIFOLDS
(1) (2) (3) (4)
Figure 10.13. A vertical torus or annulus is essential, unless
its projection is: the boundary of a disc containing zero (1) or
one (2) singular cone points, an arc parallel to the boundary
(3), or a∂-parallel closed curve (4).
Figure 10.14. Essential vertical annuli and tori in a Seifert
manifold ﬁbering over a disc with 2 or 3 singular points.
Proof. We already know it is irreducible with the ﬁrst two exceptions.
If it contains an essential discD, it contains a horizontal one which covers
thebasesurface S oftheﬁbration, hence χ(S) > 0andweget D×S1. □
We now prove a converse to Proposition 10.4.9.
Proposition 10.4.11. Let M → S be a Seifert ﬁbration and M be
irreducible. Let Σ ⊂ M be an orientable connected surface. Suppose that
• Σ is horizontal, or
• Σ is vertical and its projection is not as in Figure 10.13.
Then Σ is essential.
Proof. If Σ is horizontal, it ﬁnitely coversS and hence π1(Σ) injects
in π1(S). Therefore it injects also inπ1(M) and Σ is incompressible. By
doubling everything along∂M we get a horizontalDΣ inside DM, which
must also be incompressible: this implies thatΣ is ∂-incompressible. It is
also clearly not∂-parallel, so it is essential.
If Σ is vertical, by cutting along it we get one or two Seifert ﬁbrations.
Since ΣisnotasinFigure10.13, thebaseorbifoldsoftheseﬁbrationshave
χ ⩽ 0, so their boundary is incompressible by Corollary 10.4.10. Therefore
Σ is incompressible and∂-incompressible. Moreover it is not a∂-parallel
torus because none of the cut Seifert manifold isA × S1. □
Example 10.4.12. The curves in Figure 10.14 determine vertical es-
sential annuli and tori in Seifert manifolds ﬁbering over the disc with 2 or
3 singular ﬁbres.


## Page 347

10.4. CLASSIFICATION 339
We can now fully detect essential tori in almost all Seifert manifolds.
Corollary 10.4.13. Let M → S be a Seifert ﬁbration andM be irre-
ducible. If M is not covered by a 3-torus orT × [0, 1], every essential torus
or annulus is vertical.
Proof. Horizontal tori or annuli may arise only whenχ = 0 and ∂M ̸=
0 or e = 0. □
10.4.4. Simple Seifert manifolds.We want to classify Seifert mani-
folds up to diﬀeomorphism. To do so, we group them into some classes,
and use diﬀerent techniques on each class. Recall that a 3-manifold is
simple if it contains no essential sphere, disc, annulus, or torus.
Proposition 10.4.14. A Seifert manifold is simple⇐ ⇒it ﬁbres over
S2 with at most three singular ﬁbres and is not covered byS2 × S1 or the
3-torus.
Proof. Let M → S be a Seifert ﬁbration. The manifoldM contains
an essential vertical torus or annulus⇐ ⇒the orbifold S contains an arc
or an orientation-preserving simple closed curve that is not as in Figure
10.13. The only orbifolds that do not contain such arcs or curves are:D
with at most one ﬁber,S2 with at most three ﬁbres, andRP2 with at most
one ﬁber. In the ﬁrst caseM is a solid torus, which contains an essential
disc, and in the third caseM also ﬁbres overS2 with at most three singular
ﬁbres, see Corollary 10.3.35.
We are left to consider horizontal closed essential surfaces withχ ⩾ 0.
These arise only whene = 0 and χ(S) ⩾ 0, i.e. when M is covered by
S2 × S1 or the 3-torus. □
We note in particular that all the simple Seifert manifolds are closed.
Remark 10.4.15. Among the nine commensurability classes of Seifert
manifolds, three contain simple manifolds: those with empty boundary and
e ̸= 0. The Euler characteristicχ of a sphere with 3 singular ﬁbres may
in fact be positive, null, or negative. In particular there are simple Seifert
manifolds with ﬁnite and with inﬁnite fundamental group.
10.4.5. Seifert manifolds with boundary.To classify Seifert mani-
folds up to diﬀeomorphism, we will show that (except a few explicit excep-
tions) a generic Seifert manifold has a unique ﬁbration up to isomorphism.
We start with the easier non-empty-boundary case.
Proposition10.4.16. EverySeifertmanifold M withnon-emptybound-
ary admits only one ﬁbration up to isomorphism, except in the following
cases:
• M = D × S1 ﬁbres as
(
D, (p, q)
)
,
• M = S ×
∼
S1 ﬁbres as
(
D, (2, 1), (2, −1)
)
.
Here S is the Möbius strip.


## Page 348

340 10. SEIFERT MANIFOLDS
Proof. If M ﬁbres over an orbifoldS with χ(S) ⩾ 0, we have already
proved this in Section 10.3.11. Suppose thatM has two ﬁbrationsM → S
and M → S′ with χ(S), χ(S′) < 0.
Pick a minimal collection of properly embedded arcs inS that avoid
the cone points and decomposeS into discs, each containing at most one
cone point. Each arc determines an essential vertical annulus inM → S.
The complement of these annuli consists of vertical ﬁbered solid tori.
By Proposition 10.4.11 these annuli are essential and by Proposition
10.4.9theyareisotopictoverticalannuliwithrespecttotheotherﬁbration
M → S′ (they cannot be horizontal since χ(S′) < 0). Therefore we
may isotope the ﬁbrationM → S′ so that the annuli are vertical in both
ﬁbrations, and by further isotoping we can in fact suppose that the two
ﬁbrations coincide on a neighbourhood of these annuli.
The complement of this neighbourhood consists of solid tori. The two
ﬁbrations are obtained from the same ﬁbration by Dehn-ﬁlling along the
same slopes, and hence they are isomorphic. □
10.4.6. Seifert manifolds with inﬁnite fundamental group.We now
turn to closed Seifert manifolds. We start by examining theχ ⩽ 0 case.
Proposition 10.4.17. Every closed Seifert manifoldM not covered by
S3 or S2 × S1 admits only one ﬁbration up to isomorphism, except:
(
S2, (2, 1), (2, 1), (2, −1), (2, −1)
)∼= K ×
∼
S1.
Proof. If the Seifert manifoldM is covered by the 3-torus, we have
already proved this in Proposition 10.3.38. Suppose thatM is not covered
by S3, S2 × S1, or the 3-torus. LetM have two ﬁbrationsM → S and
M → S′.
We ﬁrst suppose thatM contains an essential torus. We try to pro-
ceed as in the proof of Proposition 10.4.16 using vertical tori instead of
annuli. Essential tori are vertical to both ﬁbrations by Corollary 10.4.13.
In particular both S and S′ are not spheres with at most three singular
points.
Let ˙S ⊂ S be S without its singular points. Pick two multicurves
C1, C2 ⊂ ˙S without puncture-parallel components, that ﬁll˙S and intersect
minimally. By ﬁlling ˙S we mean that˙S \(C1 ∪C2) consists of discs or once-
punctured discs, and minimality implies that no such disc is an unpunctured
bigon.
Let T1, T2 be the collections of tori ﬁbering aboveC1, C2. The setT1
consists of disjoint essential tori, and we can isotope the ﬁbrationM → S′
so that they are vertical with respect to the ﬁbrationsM → S, M → S′.
We turn to the toriT2, that are vertical with respect toM → S.
Up to isotopy, each simple closed curve inT1 ∩ T2 is either horizontal or
vertical with respect to M → S′. Each annulus in T2 \ T1 is essential
in M \ T1 and hence it is correspondingly horizontal or vertical after an
isotopy. Horizontal annuli would glue to a horizontal torus inT2, which is


## Page 349

10.4. CLASSIFICATION 341
excluded: hence the annuli are vertical with respect toM → S′. We can
therefore isotope the ﬁbrationM → S′ so that the toriT2 are also vertical.
Now T1 ∪ T2 is vertical with respect to both ﬁbrations. SinceC1 and
C2 ﬁll, every torus inT1 intersects one inT2 and viceversa, soT1 ∪ T2 is
made of vertical annuli attached along the vertical curvesT1 ∩ T2. Up to
isotopy the ﬁbrationsM → S and M → S′ coincide on the vertical annuli,
hence on T1 ∪ T2, hence on a neighbourhood ofT1 ∪ T2.
The complement M \ (T1 ∪ T2) consists of vertical solid tori and we
conclude as in Proposition 10.4.16 that the two ﬁbrations are isomorphic.
We are left to consider the case whereM contains no essential tori,
and hence is a simple manifold. BothS, S′ are spheres with exactly three
singular points by Proposition 10.4.14 (not less than three singular points
since M is not covered byS3 or S2 × S1).
By Corollary 10.4.6, the fundamental groupsπ1(S) and π1(S′) are
both isomorphic toπ1(M)quotiented by its centre. Exercise 3.6.13 implies
that the two orbifolds are isomorphic, soS = S′ = (S2, p1, p2, p3)for some
p1, p2, p3 ⩾ 2. Consider the exact sequence
1 − →K − →π1(M) − →π1(S) − →1.
Fix a generatorl ∈ K and coherently an orientation for the ﬁbres of both
ﬁbrations M → S and M → S′. The Von Dyck groupπ1(S2, p1, p2, p3)
has a presentation
⟨ r1, r2, r3 | r p1
1 , r p2
2 , r p3
3 , r1r2r3 ⟩
and the three generators r1, r2, r3 are intrinsically determined up to si-
multaneous conjugation or inversion, see Exercise 3.6.13. Fix three lifts
m1, m2, m3 of r1, r2, r3 in π1(M) with m1m2m3 = 1: these lifts determine
sections for the ﬁbrationsM → ˙S and M → ˙S′ with boundary meridians
m1, m2, m3. We use these sections to determine the parametersqi and q′
i
in both ﬁbrations, fori = 1, 2, 3.
Thecentre K isinﬁnitesince π1(M)is, seeProposition10.4.3. There-
fore mpi
i ∈ K equals l q′′
i for some uniqueq′′
i ∈ Z. By construction we have
q′′
i = qi and q′′
i = q′
i, hence qi = q′
i. The two ﬁbrations M → S and
M → S′ are isomorphic. □
10.4.7. Seifert manifolds with ﬁnite fundamental group.This long
journey through Seifert manifolds is almost ﬁnished: it remains to classify
theSeifertmanifoldswithﬁnitefundamentalgroup,thatisthatarecovered
by the three-sphere.
Proposition 10.4.18. Let M be a Seifert manifold covered byS3 that
is not a lens space. It has a unique ﬁbration over one of the orbifolds
S = (S2, 2, 2, p), (S2, 2, 3, 3), (S2, 2, 3, 4), (S2, 2, 3, 5)
for some p ⩾ 2. The centre ofM is the cyclic groupK in
1 − →K − →π1(M) − →π1(S) − →1.


## Page 350

342 10. SEIFERT MANIFOLDS
ﬁbration e(M) |π1(S)| | π1(M)| | H1(M, Z)|
(
S2, (2, 1), (2, 1), (p, q)
) p+q
p 2p 4p|p + q| 4|p + q|
(
S2, (2, 1), (3, 1), (3, q)
) 5+2q
6 12 24 |5 + 2q| 3|5 + 2q|
(
S2, (2, 1), (3, 1), (4, q)
) 10+3q
12 24 48 |10 + 3q| 2|10 + 3q|
(
S2, (2, 1), (3, 1), (5, q)
) 25+6q
30 60 120 |25 + 6q| | 25 + 6q|
Table 10.6. The non-lens Seifert manifolds M with ﬁnite
fundamental group. For each ﬁxed base orbifoldS, the ﬁ-
bration is determined by the order ofH1(M, Z): when two
diﬀerent parameters q give the same order ofH1(M, Z), the
ﬁbrations are actually the same (with opposite orientations
and hence Euler numbers).
The manifold M is determined byS and H1(M), see Table 10.6.
Proof. We haveM → S with χ(S) > 0 and henceS is either a sphere
with at most two singular points (soM is a lens space), one of the orbifolds
listed, orRP2 with one singular point; in the latter caseM also ﬁbres over
(S2, 2, 2, p) by Corollary 10.3.35.
Thesubgroup K iscentralbyProposition10.4.4. Supposethat π1(M)
contains a central element disjoint fromK: its image in π1(S) is a non-
trivial central element. However S is spherical and π1(S) is a non-cyclic
group of rotations ofS2: two rotations with diﬀerent axis never commute.
The subgroup K < π 1(M) is intrinsically determined as the centre,
hence the quotient π1(S) is also determined, and S also is by Exercise
3.6.13. Therefore M cannot ﬁber on two diﬀerent orbifolds in the list.
To conclude, we prove that the ﬁbrationM → S is determined by
S and the ﬁnite number |H1(M, Z)|. We analyse each case separately.
First, we transform the ﬁbration as in Table 10.6: using the move from
Proposition 10.3.11-(8) we manage to transform each(2, q′) in (2, 1) and
(3, q′) in either (3, 1) or (3, 2), and by reversing orientation (see Remark
10.3.14) we transform(3, 2) into (3, −2) and hence into(3, 1).
Using Proposition 10.3.15 we see that|H1(M)| is as in Table 10.6.
The only cases where diﬀerent values ofq give the same|H1(M)| are the
following:
• S = (S2, 2, 2, p) and |p + q| = |p + q′|, hence q′ = −q − 2p,
• S = ( S2, 2, 3, 3) and |5 + 2q| = |5 + 2q′|, hence q′ = −q − 5
which implies q, q′ ≡ 2 (mod 3).
In these cases it is easy to verify that the ﬁbrations withq and q′ are
isomorphic using Proposition 10.3.11-(8) and Remark 10.3.14.


## Page 351

10.4. CLASSIFICATION 343
The order |π1(M)| in Table 10.6 is obtained using the formula
|π1(M)| = 4e(M)
χ(S)2
that we now prove. Since the orbifolds are good, the ﬁbration is covered
horizontally by a ﬁbration overS2, which is in turn covered vertically by(
S2, (1, 1)
)
= S3. The total degree is d = dh · dv. Proposition 10.3.22
gives
dh = χ(S2)
χ(S) = 2
χ(S) , 1 = e(S2, (1, 1)) = dh
dv
· e(M).
Therefore dv = dh · e(M) and
d = dh · dv = d 2
h · e(M) = 4e(M)
χ(S)2
as required. □
10.4.8. Summary. We now summarise the topological classiﬁcation
of Seifert manifolds in a single statement.
TheSeifertﬁbrations M → S arefullyclassiﬁedbyProposition10.3.11
and Corollary 10.3.13. The latter says that two Seifert ﬁbrations
(
S, (p1, q1), . . . ,(ph, qh)
)
,
(
S′, (p′
1, q′
1), . . . ,(p′
h′ , q′
h′)
)
with pi , p′
i ⩾ 2 are orientation-preservingly isomorphic if and only ifS = S′,
h = h′, e = e′, and up to reorderingpi = p′
i and qi ≡ q′
i (mod pi) for alli.
We easily understand when two Seifert ﬁbrations are isomorphic. To
classify Seifert manifolds up to diﬀeomorphism it only remains to under-
stand which Seifert manifolds can have non-isomorphic ﬁbrations. A long
discussion has shown the following. We writeS2 × S1 as the lens space
L(0, 1).
Theorem10.4.19. EverySeifertmanifoldhasauniqueSeifertﬁbration
up to isomorphism, except the following:
• L(p, q) ﬁbres over S2 with ⩽ 2 singular points in many ways,
• D × S1 ﬁbres over D with ⩽ 1 singular point in many ways,
•
(
D, (2, 1), (2, −1)
)∼= S ×
∼
S1,
•
(
S2, (2, 1), (2, −1), (p, q)
)∼=
(
RP2, (q, p)
)
,
•
(
S2, (2, 1), (2, 1), (2, −1), (2, −1)
)∼= K ×
∼
S1.
Here S and K are the Möbius strip and the Klein bottle.
10.4.9. References. The main sources that we have consulted for
this long chapter are Hatcher [26] and Scott [52]. Some material can also
be found in Fomenko – Matveev [18]. Two classical references are Seifert’s
original paper [53] and Orlik [43].


## Page 352

[No extractable text on this page]


## Page 353

CHAPTER 11
Constructions of three-manifolds
In the previous chapter we have introduced and fully classiﬁed an im-
portant family of three-manifolds calledSeifert manifolds, and we now ad-
dress the following question: how can we construct more three-manifolds?
The most popular techniques employed for the construction and ma-
nipulation of three-manifolds are of cut-and-paste type: we build three-
manifolds by gluing some blocks altogether, and we try to describe both
the blocks and their gluing with some reasonable combinatorial formalism.
The choice of the right blocks is of course fundamental, and diﬀerent
choices lead to quite diﬀerent environments. The ﬁrst reasonable option
may be to use tetrahedra as blocks, and in that case we talk abouttrian-
gulations of three-manifolds: this construction has a strong combinatorial
ﬂavour and can be easily carried on by a computer. Other choices involve
blocks without “ridges”, that is manifolds with boundary: by using handle-
bodies we getHeegaard splittings, with knot/link complements and solid
tori we getDehn surgery, and with product manifoldsΣ × [−1, 1] we get
surface bundles. We introduce here all these topological constructions.
We end this chapter by showing that every prime three-manifold has a
canonicaldecompositionalongdisjointembeddedtori, calledthe geometric
decomposition – the reason for adopting this name will be evident in the
next chapters.
11.1. Heegaard splittings
A Heegard splittingis a decomposition of a closed three-manifold in
two manifolds of the simple kinds, the handlebodies.
11.1.1. Deﬁnition. The following proposition is quite surprising, be-
causeitshowsthateveryclosedorientablethree-manifolddecomposesinto
two pieces of a very simple type.
Proposition11.1.1. Everyclosedorientable3-manifold M decomposes
into two handlebodies of some genusg.
Proof. The 3-manifoldM has a handle decomposition with 0-, 1-, 2-,
and3-handles. The0-and1-handlesaltogetherformahandlebody. The2-
and 3-handles may be turned upside down to form a handle decomposition
into 0- and 1-handles, so another handlebody. □
345


## Page 354

346 11. CONSTRUCTIONS OF THREE-MANIFOLDS
H
H'
S
Figure 11.1. A stabilisation of a Heegaard splitting.
A decomposition of M into two handlebodies is called aHeegaard
splitting. The two handlebodies have necessarily the same genusg, since
their boundaries are glued together and are hence diﬀeomorphic surfaces.
Deﬁnition 11.1.2. The Heegaard genus g(M) of a closed orientable
M is the minimum genus of a Heegaard splitting forM.
11.1.2. Examples. The manifolds of genus zero and one are perfectly
understood.
Proposition 11.1.3.The 3-sphere has genus zero, lens spaces (except
S3) have genus one, and all the other closed orientable three-manifolds
have genus at least two.
Proof. By gluing two discs we get a 3-sphere, and by deﬁnition by
gluing two solid tori we get a lens space. □
Classifying closed manifolds of genus two is a much harder task. We
limit ourselves to a class of examples.
Exercise11.1.4. EverySeifertmanifold
(
S2, (p1, q1), (p2, q2), (p3, q3)
)
with p1, p2, p3 ⩾ 2 has genus two.
Hint. Pick two singular ﬁbres and connect them with a horizontal arc.
A regular neighbourhood of this graph is a genus-two handlebody: prove
that its complement is also a handlebody. □
11.1.3. Stabilisation. The same manifold may have various non iso-
topic Heegaard splittings: for instance there is a simple move that modiﬁes
a Heegaard splitting by increasing its genus in a somehow trivial way.
A stabilisation is a move as in Figure 11.1 that transforms a Heegaard
splitting M = H ∪S H′ of genus g into one of genusg + 1 of the same
manifold M. We add an unknotted handle to the surfaceS = ∂H = ∂H′,
so that bothH and H′ are transformed into handlebodies of genusg + 1.
Example 11.1.5. The complement of a standardly embedded genus-g
handlebody inS3 as in Figure 9.6 is another handlebody, and together they
form a genus-g Heegaard splitting ofS3 obtained by stabilisingg times the
genus-0 Heegaard splitting ofS3.


## Page 355

11.2. KNOTS AND LINKS 347
11.1.4. Triangulations. Smooth triangulations are somehow related
to Heegaard splittings, at least in one direction.
Every compact manifold admits a smooth triangulation (see Section
1.7.7) and in dimension three we can luckily prove a converse statement,
much as we did in dimension two (in Section 6.1.5).
Let X be a three-dimensional pure simplicial complex, where: every
face is incident to two tetrahedra, every edge is contained in a cycle of
adjacent tetrahedra, and the link of every vertex is a sphere.
Proposition 11.1.6. The complex X is the smooth triangulation of a
closed three-manifold M, unique up to diﬀeomorphism.
Proof. By dualising X we get a handle decomposition: tetrahedra,
triangles, edges, and vertices determine 0-, 1-, 2-, and 3-handles. This
procedure constructs a smooth closed three-manifoldM triangulated by
X. The way handles are attached is determined up to isotopy, and hence
M is determined up to diﬀeomorphism. □
As we did with surfaces, it is worth noting that this procedure (getting
a unique smooth structure from a simplicial complex) does not work in all
dimensions (here we used implicitly the non-obvious Proposition 9.2.1).
Topologists usually prefer to loosen the notion of “triangulation” by
allowing self- and multiple adjacencies between tetrahedra, see Section
14.1.2. What is important to note here is that, no matter what the
deﬁnition of “triangulation” is, a triangulated three-manifold always has
a well-deﬁned smooth structure determined only by the combinatorics of
the triangulation. This shows that smooth three-manifolds can be treated
combinatorially, for instance by a computer.
A relation between triangulations and Heegaard splittings is the fol-
lowing: a smooth triangulation of a closed manifold witht tetrahedra gives
rise to a dual handle decomposition and hence to a Heegaard splitting of
genus t. A fundamental diﬀerence between the two notions is that there
is a bounded number of closed three-manifolds triangulated by at most
t tetrahedra for every t, while there are inﬁnitely many manifolds with
Heegaard genus at mostg for every g ⩾ 1.
11.2. Knots and links
Knots and links are fundamental and beautiful objects in geometric
topology. Knots and links in S3 have a combinatorial and mildly two-
dimensional nature because they can be treated as planar diagrams, but
they should be considered as intrinsically three-dimensional objects.
11.2.1. Deﬁnition. A link in a 3-manifoldM is a compact submani-
fold of dimension one. Being compact, it consists of ﬁnitely many circles,
and a connected link is called aknot. Links and knots are usually consid-
ered up to ambient isotopy.


## Page 356

348 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Figure 11.2. Every knot may be described via a planar dia-
gram with over/under crossings (left) and its tubular neigh-
bourhood is a knotted solid torus (right).
Every link in S3 can be projected to a plane: if the link is generic
with respect to the projection, its image is adiagram as in Figure 11.2-
(left). Every link in S3 can be described via a diagram and can be thus
treated combinatorially, but it is important to note that the same link can
be represented via inﬁnitely many diagrams and it is hard in general to tell
whether two given diagrams represent the same link. Thetrivial knot(or
unknot) K ⊂ S3 is the one that has a planar diagram without crossings.
11.2.2. Chirality. The mirror imageof a knot or link is obtained by
reﬂecting it with respect to any plane inS3. On a diagram, this operation
is realised simply by inverting all crossings simultaneously.
A knot ischiral if it is not isotopic to its mirror image, andachiral
otherwise. For instance, the trivial knot is achiral, but the trefoil knot
(shown in Figure 11.2) is chiral. As in the rest of this book, we mostly
ignore orientation issues and often consider implicitly two mirrored knots
or links as equivalent.
11.2.3. Link complement. The tubular neighbourhood of a linkL in
an orientable M consists of solid tori by Proposition 1.1.13, and thelink
complement of L is the three-manifold with boundary obtained fromM
by removing the interiors of these solid tori. IfM is compact, the link
complement also is.
Proposition 11.2.1. Let K ⊂ S3 be a knot. The complement ofK is
an irreducible manifold. Moreover, the following facts are equivalent:
(1) K is trivial,
(2) K bounds a disc inS3,
(3) the complement ofK is a solid torus.
Proof. The complement of K is irreducible by Proposition 9.2.15.
Theimplication(1) ⇒(2)isthesmoothJordancurvetheorem,and(2) ⇒(1)
holds because all discs in a connected three-manifold are isotopic.


## Page 357

11.2. KNOTS AND LINKS 349
Figure 11.3. Connected sum of knots: put two knots in
disjoint balls and connect them with a band as shown.
A trivial knot thickens to a standardly embedded solid torus, whose
complement is a solid torus: hence (1)⇒(3). Conversely, if the com-
plement of K is a solid torus thenS3 decomposes into two solid tori as
S3 = L(1, q). The meridian of the complement solid torus extends to a
disc with boundaryK, hence (3)⇒(2). □
Corollary 11.2.2. All Heegaard tori forS3 are isotopic
Proof. A Heegaard torusT ⊂ S3 is by deﬁnition a torus that decom-
poses S3 into two solid tori. By the proposition the core of one of these
solid tori is always isotopic to a trivial knot and henceT is isotopic to a
standard torus. □
A link complement inS3 can be reducible: this holds precisely when
there is a sphereΣ ⊂ S3 disjoint from the linkL that cutS3 into two balls,
each containing some components ofL. In that case we say that the link
is split.
Corollary 11.2.3. Let L ⊂ S3 be a non-trivial knot or non-split link.
The link complement is Haken.
Proof. Thelinkcomplement M isirreduciblebyassumption; byPropo-
sition 9.2.30, if M contains an essential disc then it is a solid torus and
hence L is the trivial knot, which is excluded. NowM is Haken by Corollary
9.4.5. □
11.2.4. Prime knots. There is an operation on knots inS3 called
connected sum, similar to the one on manifolds and described in Figure
11.3. A connected sum istrivial if one of the two knots is trivial; a non-
trivial knot isprime if it is not the result of a non-trivial connected sum,
and composite otherwise.
The crossing number of a knot is the minimum number of crossings
in a diagram describing it. Prime knots with small crossing number have
been tabulated since the XIX century: at present all the prime knots with
up to 16 crossing have been classiﬁed (by Hoste – Thistlethwaite – Weeks
[29] in 1998) and the ﬁrst 14 numbers of them are listed in Table 11.1.
The prime knots with⩽ 7 crossings are shown in Figure 11.4: the ﬁrst
three in the list are the unknot, thetrefoil, and theﬁgure-eight knot.


## Page 358

350 11. CONSTRUCTIONS OF THREE-MANIFOLDS
c 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
n 1 0 0 1 1 2 3 7 21 49 165 552 2176 9988 46972
Table 11.1.The numbern of prime knots withc crossings,
for all c ⩽ 14.
Figure 11.4. Prime knots in S3 with at most 7 crossings.
The knots31 and 41 are thetrefoil and theﬁgure-eight knots
respectively.
Figure 11.5. A connected sum produces a sphere (dotted
in the ﬁgure) intersecting the knot in two points.
A connected sum gives rise to a sphere which intersects the new knot
in two points, see Figure 11.5. The sphere intersects the knot complement
into an essential annulus.


## Page 359

11.2. KNOTS AND LINKS 351
Figure 11.6. The meridianm (red) and longitudel (blue) of
a standard torus are oriented as shown here, like a right-hand
screw.
Figure 11.7. The torus knot(2,−7) and the torus link(2,−8).
11.2.5. Torus knots.We now introduce a simple and natural family
of prime knots. Consider the standardly embedded torus T ⊂ S3 with
meridian m and longitudel oriented as in Figure 11.6. A pair(p, q) of co-
prime integers determines a simple closed curve inT that is homologically
qm + pl, and such a curve is called a(p, q)-torus knot. More generally, a
pair of integers(a, b) determines a multicurve inT that is homologically
bm + al, called an(a, b)-torus link.
For instance, the trefoil knot is a(2, −3)-torus knot. More examples
are in Figure 11.7. The knots31, 51, 71 from Figure 11.4 are torus knots.
Exercise 11.2.4. If |p| ⩽ 1 or |q| ⩽ 1 the torus knot is the unknot.
The torus knots with parameters(p, q), (−p, −q), and(q, p) are isotopic,
the torus knot with parameters(p, −q) is the mirror image of(p, q).
The complement of a torus knot is a quite simple kind of Seifert
manifold. In the following we suppose thatp, q ⩾ 1 are coprime.


## Page 360

352 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Figure 11.8. The Hopf link is the(2, 2)-torus link.
Proposition11.2.5. Thecomplementofa (p, q)-torusknotisaSeifert
manifold ﬁbering over the orbifold(D, p, q). More precisely, it is
(
D, (p, r ), (q, s)
)
where (r, s) is any pair such thatps + qr = 1.
Proof. Let K ⊂ T ⊂ S3 be the (p, q)-torus knot. The pair (r, −s)
determines another simple closed curveα ⊂ T that intersects K in one
point. The complement of K in a tubular neighbourhoodT × [−1, 1] of
T is diﬀeomorphic to P × S1, where P is a pair of pants. On the tori
T × {−1} and T × {1} the curves(∂P × {pt}) ∩ (T × {−1}) and {pt} ×S1
are isotopic toα and K.
The complement ofT × [−1, 1] in S3 consists of two solid tori, with
meridians (1, 0) and (0, 1). Read in the basis (α, K) the meridians are
(q, s) and (p, r ). The complement ofK in S3 is obtained fromP × S1 by
ﬁlling these curves and hence we get
(
D, (p, r ), (q, s)
)
. □
Inparticularthecomplementofthetrefoilknotis
(
D, (2, 1), (3, 1)
)
. If
we supposep, q ⩾ 2, two torus knots with distinct (unordered) parameters
have non-diﬀeomorphic complements and hence are not isotopic. Our
intuition says that a torus knot is prime, and we can prove this rigorously.
Proposition 11.2.6. Every torus knot is prime.
Proof. If K is obtained as a non-trivial connected sum, there is an
essential annulus in the complement, whose boundary curves are meridians
of K. There is only one essential annulus in
(
D, (p, r ), (q, s)
)
and its
boundary curves are not meridians. □
The (2, 2)-torus link is called theHopf link and is drawn in Figure
11.8.
Exercise 11.2.7. The complement of the Hopf link isT × [0, 1]. Any
two distinct ﬁbres of the Hopf ﬁbration form a Hopf link.


## Page 361

11.2. KNOTS AND LINKS 353
Figure 11.9. Two satellite knots.
11.2.6. Satelliteknots. Wehavediscoveredthatchecompositeknots
contain essential annuli in their complement, and we now look for essential
tori. It is convenient to introduce the following deﬁnition.
Deﬁnition 11.2.8. A knot K ⊂ S3 is a satellite if its complement
contains an essential torus.
We now formulate an equivalent and more inspiring deﬁnition of satel-
lite knots which justiﬁes the terminology. A knot in a solid torusD2 × S1
is local if it is contained in a ball, and acore if it is isotopic to{x} × S1.
An embedding ϕ: D2 × S1 ↪→ S3 is trivial (or unknotted) if the image of
a core is a trivial knot.
Proposition 11.2.9. A knot K ⊂ S3 is satellite ⇐ ⇒it is the image of
a knot K′ ⊂ D2 × S1 which is neither local nor a core, along a non-trivial
embedding ϕ: D2 × S1 ↪→ S3.
Proof. A knotK = ϕ(K′) constructed in this way is satellite, because
the torusϕ(S1 × S1) is essential in the complement ofK: it is incompress-
ible (on one side becauseϕ is non-trivial, and on the other becauseK′ is
not local) and not∂-parallel (because K′ is not a core).
Conversely, if K is a satellite knot then its complement contains an
essential torus T ⊂ S3. As every torus inS3, the torusT bounds a solid
torus. Since T is essential, the knotK is contained in this solid torus in a
non-local and non-core way. Moreover the solid torus is knotted, otherwise
T would be compressible on the other side. □
The non-trivial embeddingϕ sends the core curve ofD2 × S1 to some
non-trivial knot H ⊂ S3 called the companion of K: we should think of
K as orbiting as a “satellite” around its companionH, with orbit path
K′. When K′ is contained in the boundary of the solid torusD2 × S1 the
satellite knot K is called acable knot. Some examples are in Figure 11.9.


## Page 362

354 11. CONSTRUCTIONS OF THREE-MANIFOLDS
11.2.7. Simple complements.Recall from Section 9.4.7 that a com-
pact three-manifold is simple if it contains no essential sphere, disc, torus,
and annulus. Which knots have a simple complement? To answer to this
question, we need a general lemma on three-manifolds that identiﬁes the
few cases where there are essential annuli without essential tori.
Lemma11.2.10. Let M beirreducibleand ∂-irreducible,withboundary
consisting of tori. The manifoldM contains no essential tori but contains
some essential annuli⇐ ⇒it is diﬀeomorphic to one of the following:
(
D, (p1, q1), (p2, q2)
)
,
(
A, (p, q)
)
, P × S1
with p1, p2 ⩾ 2. Here P is a pair of pants.
Proof. Propositions 10.4.9 and 10.4.11 imply that the Seifert mani-
folds listed contain vertical essential annuli, but not essential tori.
Conversely, let M contain an essential annulus A. Suppose that A
connects two distinct boundary toriT, T′ of M. A regular neighbourhood
of T ∪ T′ ∪ A is diﬀeomorphic to P × S1, and its boundary contains a
third torus T′′ ⊂ M. Since T′′ cannot be essential, it is either boundary
parallel or bounds a solid torus inM, and M is diﬀeomorphic respectively
to P × S1 or a Dehn ﬁlling of it. In the latter case, the Dehn ﬁlling is not
ﬁbre-parallel because M is ∂-reducible (use Corollary 10.3.43), hence we
get a Seifert manifold of type
(
A, (p, q)
)
.
If A connects one boundary component to itself we conclude similarly
and may also getM =
(
D, (p1, q1), (p2, q2)
)
. □
We can now state and prove an important trichotomy on knots.
Proposition 11.2.11. Every knot K ⊂ S3 is either a torus knot, a
satellite knot, or has a simple complement.
Proof. We only need to prove that if the complementM contains
an essential annulus and no essential tori thenK is a torus knot. The
previous lemma givesM =
(
D, (p1, q1), (p2, q2)
)
, and to getS3 back we
must have a Dehn ﬁllingS3 =
(
S2, (p1, q1), (p2, q2), (1, n)
)
. In particular
K is isotopic to a ﬁbre and hence contained in a vertical Heegaard torus
for S3. Heegaard tori are standard by Corollary 11.2.2, and henceK is a
torus knot. □
The relevance of this proposition will be magniﬁed later, after intro-
ducing geometrisation. Note that in particular all the composite knots are
satellite knots: where is the essential torus?
11.3. Dehn surgery
While a Dehnﬁlling consists of attaching a solid torus to a boundary
component, a Dehnsurgery is a two-step operation that consists of drilling
a tubular neighbourhood of a knot and then re-gluing it via a diﬀerent map.


## Page 363

11.3. DEHN SURGERY 355
Using this fundamental operation we can describeevery closed three-
manifold via some reasonable and combinatorial drawing on the plane:
a link diagram with some rational numbers attached to its components.
Such a combinatorial description has a strong four-dimensional ﬂavour and
is called aKirby diagram.
In this section we introduce some basic knot theory concepts: lon-
gitudes, Seifert surfaces, Dehn surgery, and the Lickorish-Wallace Theo-
rem which asserts that every closed orientable 3-manifold is obtained by
surgerying some link inS3.
11.3.1. Canonical longitudes. The tubular neighbourhood N of a
knot K ⊂ S3 is a solid torus. As usual with solid tori, ameridian is a
simple closed curve m ⊂ ∂N bounding a disc in N and a longitude is
any other simple closed curvel such that m and l generate H1(∂N, Z).
The meridian m is unique up to sign, but the longitudel is not: if l is a
longitude, then l + km also is for anyk ∈ Z.
The purpose of this section is to deﬁne a canonical longitude.
Proposition 11.3.1. Let L ⊂ S3 be a link withk components and M
its complement. We haveH1(M, Z) = Zk, generated by thek meridians.
Proof. Let N = N1 ⊔ . . . ⊔ Nk be the solid tori neighbourhoods ofL
and Ti = ∂Ni. The Mayer–Vietoris sequence onS3 = M ∪ N gives
0 − →H1(T1 ⊔ . . . ⊔ Tk) − →H1(M) ⊕ H1(N1 ⊔ . . . ⊔ Nk) − →0
since H2(S3) = H1(S3) = 0. The equalitiesH1(Ti ) = Z × Z and H1(Ni ) =
Z imply that H1(M) = Zk. The groupH1(Ti ) is generated by(mi , li ) and
mi goes to zero in H1(Ni ). Therefore the meridians m1, . . . , mk go to
generators of H1(M). □
Corollary 11.3.2.Let K ⊂ S3 be a knot andM be its complement. A
unique (up to sign) longitudel ⊂ ∂M vanishes in H1(M, Z).
Proof. In the mapZ × Z = H1(∂M ) → H1(M) = Z the meridian m
goes to a generator, hence the kernel is generated by a longitudel. □
We call l the canonical longitudeof K. The torus T = ∂M is hence
equipped with a canonical basis (m, l) for H1(T, Z); we orient m and l
as shown in Figure 11.6, like a right-hand screw. The pair(m, l) is well-
deﬁned up to reversing both their signs.
11.3.2. Seifert surfaces. We now show that the canonical longitude
has a concrete geometric interpretation.
Deﬁnition 11.3.3. A Seifert surface for a knot K ⊂ S3 is any ori-
entable connected compact surfaceS ⊂ S3 with ∂S = K.


## Page 364

356 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Figure 11.10. A Seifert surface for the trefoil knot: it is a
punctured torus.
See an example in Figure 11.10. Every Seifert surfaceS determines
a longitude l for K: pick a small tubular neighbourhoodN of K and set
l = S ∩ ∂N. The same knotK has plenty of non-isotopic Seifert surfaces,
but luckily these all induce the same longitude:
Proposition 11.3.4. Every knot K has a Seifert surface S. Every
Seifert surface forK induces the canonical longitudel.
Proof. Let M be the complement ofK. Let S be a surface represent-
ing a generator ofH2(M, ∂M) = H1(M) = Z. The long exact sequence
. . . − →H2(M, ∂M) − →H1(∂M ) − →H1(M) − →. . .
impliesthat [S]ismappedtoanon-trivialprimitiveelement α ∈ H1(∂M ) =
Z×Z that is trivial inH1(M). Therefore [∂S] = α = [l] and ∂S consists of
an odd number of parallel copies ofl and some homotopically trivial simple
closed curves inT = ∂M. The homotopically trivial components may be
eliminated by isotoping them insideM and capping them with discs; if the
parallel copies are more than 1, since their signed sum is 1, there must be
two of them that are close and with opposite signs, that can be canceled
by isotoping them insideM and capping them with an annulus. At the end
we get ∂S = K. □
The Seifert genusof K is the minimum genus of a Seifert surface.
Proposition 11.3.5. The unknot is the only knot with Seifert genus 0.
Proof. A knot has genus zero⇐ ⇒it bounds a disc. □
Figure 11.10 shows that the trefoil knot has genus one.
11.3.3. Dehn surgery. Let L ⊂ M be a link withk components in
an orientable 3-manifoldM. ADehn surgeryon L is a Dehn ﬁlling of the
complement of L. That is, it is a two-step operation that consists of:
(1) (drilling) the removal of small open tubular neighbourhoods of
L, that creates new boundary toriT1, . . . , Tk;
(2) (ﬁlling) a Dehn ﬁlling of the new boundary toriT1, . . . , Tk.


## Page 365

11.3. DEHN SURGERY 357
Figure 11.11. Two Kirby diagrams describing the lens space
L(p, q) and the Poincaré homology sphereΣ(2, 3, 5).
Weremovethetubularneighbourhoodsof Landgluethembackdiﬀerently:
this explains the use of the wordsurgery. The outcome is a new manifold
N with the same boundary ofM, that is often not diﬀeomorphic toM.
The surgered manifold N is determined by the slopes inT1, . . . , Tk
that are killed by the Dehn ﬁlling, see Section 10.1.1. WhenM = S3,
every torus Ti is equipped with a canonical basis mi , li, the slope is of
the form ±(pi mi + qi li ) and is hence determined by the rational number
pi
qi
∈ Q ∪ {∞}. The full surgery on the link is comfortably encoded by
assigning the numberpi
qi
to thei-th component ofL, for everyi = 1, . . . , k.
The result of a Dehn surgery alongL ⊂ S3 is a closed orientable
3-manifold. The slope∞ = 1
0 indicates the meridianmi.
Proposition 11.3.6. An ∞-surgery on a knotK has no eﬀect.
Proof. It consists of removing a solid torus neighbourhood ofK and
regluing it back with the same map. □
A Kirby diagramis a link diagram on the plane with a rational number
pi
qi
assigned to each component. Such a diagram deﬁnes a Dehn surgery
and hence a closed orientable three-manifold. Some examples are shown
in Figure 11.11.
Exercise 11.3.7. The p
q-surgery on the unknot yieldsL(p, q).
The slope 0 indicates the canonical longitudeli. More generally, the
integer ni ∈ Z encodes the longitudeni mi + li. The surgery isintegral if
the coeﬃcients pi
qi
are all integers.
Remark 11.3.8. The notion ofintegral Dehn surgery exists for any
link L ⊂ M in any 3-manifoldM: a Dehn surgery is integral if the killed
slopes are longitudes of the previously removed solid tori. However on a
generic M there is no rule for choosing a canonical longitude and hence to
transform slopes into numbers.
Let N be obtained by Dehn surgery onK ⊂ S3 with coeﬃcient p
q.
Proposition 11.3.9. The surgered manifoldN has H1(N, Z) = Z/pZ.


## Page 366

358 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Proof. Let M be the complement of the knotK. We know that the
meridian m generates H1(M) = Z while the longitudel is zero there. The
Dehn ﬁlling kills the elementpm + ql = pm. □
Recall that ahomology sphere is a closed 3-manifoldM having the
same integral homology asS3, that is with trivialH1(M, Z).
Corollary 11.3.10. If the coeﬃcient is1
q the surgered manifoldN is a
homology sphere.
We have found a simple method to construct many homology spheres.
11.3.4. Torus knots. As a ﬁrst example, we study the eﬀect of a
Dehn surgery on torus knots. We supposep, q ⩾ 1.
Proposition 11.3.11.The t
u-Dehn surgery on a(p, q)-torus knot gives
(
S2, (p, r ), (q, s), (t − pqu, u )
)
if t
u ̸= pq,(11)
L(p, r )#L(q, s) if t
u = pq(12)
where (r, s) is any pair withps + qr = 1.
Proof. Recall from the proof of Proposition 11.2.5 that the comple-
ment of K in T × [−1, 1] is diﬀeomorphic toP × S1. The meridian m of
K is isotopic to a component of∂P × {pt}, so the canonical longitudel of
K is isotopic tol′ + km for somek ∈ Z, where l′ is isotopic to{pt} × S1,
i.e. it is the framing induced byT.
By Proposition 11.2.5 the Dehn ﬁlling is
(
S2, (p, r ), (q, s), (t −ku, u )
)
and we need to determinek. Recall that ift
u = 0
1 the manifold has inﬁnite
cyclic homology, hence it is a Seifert manifold withe = 1
pq − 1
k = 0 by
Proposition 10.3.15: we deduce thatk = pq.
When t − pqu = 0 the ﬁlling is ﬁber-parallel and Corollary 10.3.43
shows that we actually getL(p, r )#L(q, s). □
Recall from Corollary 10.3.16 that for every triple(p, q, n) of pairwise
coprime natural numbers p, q, n ⩾ 2 there is a unique Seifert homology
sphere Σ(p, q, n) ﬁbering over the orbifold(S2, p, q, n).
Corollary 11.3.12. Fix two coprimep, q ⩾ 2. The Seifert homology
sphere obtained by1
u-surgery on the(p, q)-torus knot isΣ(p, q, |pqu −1|).
In particular the1-surgery on the trefoil knot (seen as a(2, 3)-torus
knot) depicted in Figure 11.11 produces the Poincaré homology sphere
Σ(2, 3, 5).
Exercise 11.3.13. Every homology sphere of typeΣ(2, 3, k) may be
obtained via a Dehn surgery of the trefoil knot.
Note that whent − pqu = ±1 the Seifert manifold (11) has only two
singular ﬁbres and is hence a lens space.


## Page 367

11.3. DEHN SURGERY 359
S
A
Figure 11.12. We pushγ in a collar for∂H2 and drill a solid
torus neighbourhood, drawn here as a yellow parallelepiped.
Corollary 11.3.14. Fix two coprimep, q ⩾ 2 and n ⩾ 1. When t
u =
pq ± 1
n the t
u-Dehn surgery on a(p, q)-torus knot produces the lens space
L(t, uq 2) = L(npq ± 1, nq2).
Proof. The Seifert manifold (11) is
(
S2, (p, r ), (q, s), (1, ±n)
)
=
(
S2, (p, r ), (q, s ± nq)
)
= L(p(s ± nq) + r q, (−q)(s ± nq) + sq )
= L(1 ± npq, ∓nq2)
using Exercise 10.3.6. □
We note that we never getS2 × S1 or S3 via non-trivial surgeries on
non-trivial torus knots. The lens space with smallest fundamental group
that we may get isL(5, 1), which arises from a5-Dehn surgery on the
trefoil knot.
11.3.5. TheLickorish-Wallacetheorem. WenowprovethattheDehn
surgery construction is as general as possible.
Theorem11.3.15(Lickorish-Wallacetheorem). Everyclosedorientable
3-manifold can be described via an integral Dehn surgery along a link
L ⊂ S3.
Proof. Let M be a closed orientable 3-manifold. Pick a Heegaard
splitting M = H1 ∪ψ H2 where H1 and H2 are genus-g handlebodies and
ψ : ∂H1 → ∂H2 is a diﬀeomorphism. We ﬁx an identiﬁcation of both
H1 and H2 with a model handlebodyH, so that ψ can be interpreted as
an element of the mapping class groupMCG(S) of the genus-g surface
S = ∂H.
Example 11.1.5 shows that the three-sphere also decomposes asS3 =
H1 ∪ϕ H2 for some ϕ ∈ MCG(S). Theorem 6.5.9 says thatψ ◦ ϕ−1 is a
composition of Dehn twists
ψ ◦ ϕ−1 = T±1
γk ◦ . . . ◦ T±1
γ1


## Page 368

360 11. CONSTRUCTIONS OF THREE-MANIFOLDS
along some curvesγi ⊂ S. Set Mi = H1 ∪ψi H2 with
ψi = T±1
γi ◦ . . . ◦ T±1
γ1 ◦ ϕ.
We have M0 = S3 and Mk = M. We prove thatMi can be described via
an integral Dehn surgery along ai-components link inS3 by induction on
i. To obtain that it suﬃces to check thatMi+1 can be obtained fromMi
via integral Dehn surgery along a knot. We have
Mi = H1 ∪ψi H2, M i+1 = H1 ∪T±1γi+1◦ψi
H2.
Nowﬁxacollarof S = ∂H2 in H2 andpush γi+1 insidethecollarasinFigure
11.12. Drill from H2 a solid torus aroundγi+1 (a yellow parallelepiped in
the ﬁgure) to get a submanifoldHdrill
2 ⊂ H2. We seeTγ±1
i+1
as a Dehn twist
supported in the annulusA ⊂ S drawn in the ﬁgure.
TheDehntwistsupportedon Aextendsproduct-wisetothesolidtorus
A × [0, 1] lying betweenA and the drilled yellow parallelepiped, and extends
trivially to a self-diﬀeomorphismT : Hdrill
2 → Hdrill
2 such that T |S = T±1
γi+1.
We deﬁne
Mdrill
j = H1 ∪ψj Hdrill
2
for j = i , i + 1. Since T |S = T±1
γi+1 the map T extends to a diﬀeomorphism
T : Mdrill
i − →Mdrill
i+1.
Therefore Mi+1 is obtained from Mi by Dehn surgery along γi+1. The
surgery is integral sinceT sends a meridian of the drilled yellow solid torus
to a longitude. The proof is complete. □
The theorem shows that every closed orientable three-manifold can
be constructed using Kirby diagrams. As for knots and many other com-
binatorial descriptions of topological objects, it is important to note that
many diﬀerent Kirby diagrams may describe the same three-manifold, and
in general it is hard to tell, given two diagrams, whether they deﬁne the
same manifold or not.
11.3.6. Four-manifolds. The theorem of Lickorish and Wallace has
a nice four-dimensional interpretation, which shows in particular that every
closed orientable three-manifold is the boundary of a simply-connected
four-manifold.
Recall from Section 1.7.5 that in dimension four a two-handleH =
D2 × D2 is attached to an orientable four-manifoldW via an embedding
ψ : S1 × D2 → ∂W. After attaching the handleH to W, the boundary of
W changes by substituting the solid torusψ(S1 × D2) with another solid
torus D2 × S1: in other words, it changes by Dehn surgery. The Dehn
surgery is integral because the meridians of the two solid tori intersect in
one points.
Conversely, every integral Dehn surgery on a knotK ⊂ ∂W may be
interpretedastheeﬀectof attachingsome2-handle: it suﬃcestointerpret


## Page 369

11.3. DEHN SURGERY 361
the drilled and ﬁlled solid tori as horizontal and vertical boundaries of a
four-dimensional two-handle.
With such an interpretation, we may considerS3 as the boundary of
D4 and see the integral Dehn surgery on a linkL ⊂ S3 as the result of
attaching some two-handles toD4. The Lickorish-Wallace theorem implies
the following.
Corollary11.3.16. Everyclosedorientablethree-manifoldisthebound-
ary of a simply-connected compact four-manifold.
Proof. Every closed orientable three-manifold is the result of an inte-
gral surgery on a linkL ⊂ S3 and is hence the boundary of a four-manifold
obtained by attaching some two-handles toD4. Every such manifold is
simply-connected by Van Kampen’s theorem. □
This theorem reveals in particular that it is fairly easy to construct
plenty of simply connected four-manifolds with boundary. Note that the
simply connected four-manifolds constructed in this way are not con-
tractible: indeed the following proposition shows that they have a non-
trivial second homology group.
Proposition 11.3.17. A four-manifold with one 0-handle and k 2-
handles is homotopy equivalent to a bouquet ofk two-spheres.
Proof. We ﬁrst deformation retract the two-handles over their core
discs, and then we shrink the whole 0-handle to a point. □
Toconstructcontractiblefour-manifolds,weneedtoemploy1-handles.
11.3.7. Three-manifoldswithboundary. TheLickorish-WallaceThe-
orem extends to compact manifolds with boundary, in the appropriate way.
Proposition 11.3.18. Every compact orientable 3-manifold M with
boundary is obtained fromS3 as follows: pickL ⊔ C ⊂ S3 where L is a link
and C is a 1-complex; remove an open regular neighbourhood ofC and
perform an integral surgery onL.
Proof. Cap oﬀ the boundary of M by adding handlebodies Hg, to
get a closed manifold M′. Choose a 1-complex C ⊂ M′ whose regular
neighbourhood consists of these handlebodies, so that by removingC we
get M back.
Now M′ is obtained from S3 via integral surgery along some linkL,
and by general position we may suppose thatC is disjoint from the cores
of the surgered solid tori, so we can see bothC and L disjointly inS3. □
If ∂M consists of tori we may suppose thatC is also a link.


## Page 370

362 11. CONSTRUCTIONS OF THREE-MANIFOLDS
11.4. Surface bundles
Seifert manifolds have base orbifolds of dimension 2 and smooth ﬁbres
of dimension 1. We now introduce a complementary construction where
the base orbifolds have dimension 1 and the smooth ﬁbres have dimension
2. These are calledsurface bundles.
11.4.1. Surface bundles. A surface bundle overS1 is a ﬁbre bundle
M → S1 of a compact orientable 3-manifoldM (possibly with boundary)
over S1, whose ﬁbreΣ is a connected compact orientable surface. IfM
has boundary, thenΣ also has, and∂M consists of tori ﬁbering overS1.
Proposition 11.4.1. Every surface bundle over S1 is constructed by
taking Σ × [0, 1] and glueing Σ × 0 to Σ × 1 via an orientation-preserving
diﬀeomorphism ψ.
Proof. One such glueing clearly gives rise to a surface bundle over
S1. Conversely, by cutting a surface bundle overS1 along a ﬁbre we get a
surface bundle over the interval, which is a productΣ × [0, 1]. □
The diﬀeomorphism ψ is themonodromy of the surface bundleMψ.
Sinceisotopicglueingsproducediﬀeomorphicmanifolds,thethree-manifold
Mψ depends only of the class ofψ in the mapping class groupMCG(Σ)
on Σ. More than that, it actually depends only on its conjugacy class:
Proposition 11.4.2. If ψ and φ are conjugate inMCG(Σ), then Mψ
and Mφ are diﬀeomorphic.
Proof. The diﬀeomorphismg : Σ → Σ that conjugates them extends
to Σ × [0, 1] and gives a diﬀeomorphismMψ → Mφ. □
Themanifolds Mψ and Mψ−1 areorientation-reversinglydiﬀeomorphic.
11.4.2. Properties. Wenowstarttoinvestigatethetopologicalprop-
erties of surface bundles. LetM → S1 be a surface bundle with ﬁbreΣ.
Exercise 11.4.3. The mapsΣ → M → S1 induce an exact sequence
0 − →π1(Σ) − →π1(M) − →π1(S1) − →0.
This implies in particular thatπ1(M) surjects onto Z and therefore:
Corollary 11.4.4. We have b1(M) ⩾ 1.
In other terms, the surface ﬁbreΣ is non-separating and hence[Σ] ∈
H2(M, ∂M) is non-trivial (and has inﬁnite order).
Note that there is an obvious degree-n regular covering Mψn → Mψ
for every n and an inﬁnite regular coveringΣ × R → Mψ induced by the
normal subgroup π1(Σ) ◁ π1(M).
Proposition 11.4.5. The ﬁbre Σ is an essential surface. Ifχ(Σ) > 0
then M is diﬀeomorphic toD × S1 or S2 × S1. If χ(Σ) ⩽ 0 the universal
cover of int(M) is R3 and M is Haken.


## Page 371

11.4. SURFACE BUNDLES 363
Proof. If χ(Σ) > 0 then MCG(Σ) is trivial and we are done, so we
suppose χ(Σ) ⩽ 0. The ﬁbre Σ is incompressible becauseπ1(Σ) injects,
and is also∂-incompressible by a doubling argument (the doubleDM ﬁbres
to S1 with incompressible ﬁbre DΣ, hence Σ is ∂-incompressible). The
ﬁbre is clearly not∂-parallel, hence it is essential.
The manifold M is covered by Σ × R, whose interior is covered by
R2 × R = R3: hence M is irreducible. It is also∂-irreducible because its
double also ﬁbres and hence is irreducible. ThereforeM is Haken. □
11.4.3. Semi-bundles. The Seifert ﬁbrations are circle bundles over
two-dimensional orbifolds, and likewise it is natural to consider surface
bundles over 1-orbifolds. The compact 1-orbifolds areS1 and the closed
segment with mirrored endpoints. We have already considered theS1 case
and we now deﬁne some surface bundles over the closed segment, called
semi-bundles.
Let Σbeanon-orientablesurface,withorientabledoublecover p : ˜Σ →
Σ and deck transformationτ that gives Σ = ˜Σ/τ. We have
Σ ×
∼
(−1, 1) =
(˜Σ × (−1, 1)
)
/(τ,ι)
with ι(x) = −x. A local semi-bundle is the map Σ ×
∼
(−1, 1) → [0, 1)
that sends (p, x) to |x|. The ﬁbre over0 is Σ, that overx ∈ (0, 1) is ˜Σ.
A semi-bundle M → [−1, 1] is a map which is a local semi-bundle
when restricted to[−1, 1 − ε) and (ε, 1]. The ﬁbre over±1 is Σ and the
ﬁbre of x ∈ (−1, 1) is ˜Σ. We should think about this object as a surface
bundle over the segment orbifold[−1, 1] with mirror points±1.
Exercise11.4.6. Everysemi-bundleisconstructedbygluingtwocopies
of Σ ×
∼
[−1, 1] along their boundaries via some diﬀeomorphism.
Set I = [ −1, 1]. Let M → I be a semi-bundle with ﬁbresΣ and ˜Σ.
Note that I = R/Γ where Γ < Isom(R) is generated by the reﬂections at
the points ±1. The orbifold fundamental group ofI is
π1(I) = Γ = Z/2Z ∗ Z/2Z.
Exercise 11.4.7. The maps˜Σ → M → I induce an exact sequence
0 − →π1( ˜Σ) − →π1(M) − →π1(I) − →0.
Proposition11.4.8. If χ(Σ) > 0then M isdiﬀeomorphicto RP2 ×
∼
S1.
If χ(Σ) ⩽ 0theorientable ﬁbre ˜Σisessential, theuniversalcover of int(M)
is R3, and M is Haken.
Proof. Same proof as in the standard bundle case. □
Exercise 11.4.9. An orientable 3-manifold M has a (semi-)bundle
structure if and only if there is an orientableΣ ⊂ M that cuts M into
interval bundles.


## Page 372

364 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Let M → I be a semi-bundle. We may pull-back the semi-bundle
along the orbifold double coverS1 → I and get an ordinary surface bundle
˜M → S1, so that the following diagram commutes:
˜M →→
↓↓
M
↓↓
S1 →→ I
Every semi-bundle is thus covered by an ordinary bundle.
11.4.4. Seifertmanifolds. WenowclassifytheSeifertmanifoldsthat
have a surface (semi-)bundle structure.
Proposition 11.4.10.A Seifert manifoldM has a (semi-)bundle struc-
ture if and only if one of the following holds:
• ∂M ̸= ∅,
• e(M) = 0,
• M =
(
T, (1, e)
)
or
(
K, (1, e)
)
,
• M =
(
S2, (2, 1), (2, 1), (2, 1), (2, 2q + 1)
)
,
• M =
(
RP2, (2, 1), (2, 2q + 1)
)
.
The manifolds in the last two lines occur only as semi-bundles.
Proof. If ∂M ̸= ∅or e(M) = 0 then M → S has an orientable section
Σ, whichcuts M intointervalbundles: hence Σisaﬁbreofa(semi-)bundle
(see Exercise 11.4.9).
Let S be one of the orbifolds
T, K, (S2, 2, 2, 2, 2), (RP2, 2, 2).
It contains a circle that splitsS into one or two annuli, Möbius strips, or
(D, 2, 2). Every circle ﬁbering over these pieces is an interval bundle by
Proposition 10.3.33. Therefore every ﬁberingM → S contains a vertical
torus that splitsM into interval bundles and is hence a (semi-)bundle.
Conversely, if M has a (semi-)bundle structure the orientable ﬁbre is
essential and is hence either horizontal or vertical: we get one of the types
listed. □
11.4.5. Torus bundles.A torus bundleis of course a surface bundle
M → S1 with ﬁbre a torusT. We ﬁx a basis forπ1(T ), so thatMCG(T ) =
SL2(Z). By what said above, every matrix A ∈ SL2(Z) deﬁnes a torus
bundle MA with monodromy A. We want to understand when MA is a
Seifert manifold.
Exercise 11.4.11. For everye ∈ Z there are diﬀeomorphisms
M(
1 e
0 1
)∼=
(
T, (1, e)
)
, M (
−1 e
0 −1
)∼=
(
K, (1, e)
)
.
The classiﬁcation of torus bundles reduces to linear algebra.


## Page 373

11.4. SURFACE BUNDLES 365
Proposition11.4.12. Twotorusbundles MA and MA′ arediﬀeomorphic
if and only ifA′ is conjugate toA±1 in SL2(Z).
Proof. Let MA ∼= MA′ be a diﬀeomorphism. Consider the tori T
and T′ of the two ﬁbrations both insideMA and minimise their transverse
intersection.
If T ∩ T′ = ∅, by Proposition 9.3.18 the tori are parallel and the two
ﬁbrations are isotopic, soA′ is conjugate toA±1. Otherwise by the same
proposition T′ decomposes into ﬁbered annuli in the productMA \ T. One
such ﬁbered annulus identiﬁes a circleγ ⊂ T preserved by A. Thus A is
conjugate to
(1 e
0 1
)
or
(−1 e
0 −1
)
, and A′ is conjugate to
(1 e′
0 1
)
or
(−1 e′
0 −1
)
for the
same reason. Exercise 11.4.11 implies thatA′ = A±1. □
Exercise 11.4.13. A matrixA ∈ SL2(Z) has ﬁnite order if and only if
A = ±I or |trA| < 2. Every ﬁnite-orderA is conjugate to one of
(1 0
0 1
)
,
(−1 0
0 −1
)
,
(−1 1
−1 0
)
,
(0 −1
1 0
)
,
(1 −1
1 0
)
or their inverses. These matrices have order 1, 2, 3, 4, 6.
Hint. Use Proposition 2.3.9. □
We can easily determine whether a torus bundle is Seifert by looking
at its monodromyA.
Proposition 11.4.14.Let M = MA be a torus bundle with monodromy
A ̸= ±I. The following holds:
• if |trA| < 2 then M is a Seifert manifold withe = 0 and χ = 0,
• if |trA| = 2 then M is a Seifert manifold withe ̸= 0 and χ = 0,
• if |trA| > 2 then M is not a Seifert manifold.
Proof. Consider T × [−1, 1] foliated by lines{x} × [−1, 1]. The foli-
ation extends toMA. If A has ﬁnite order, thenMA is ﬁnitely covered by
MI = T × S1 and hence all ﬁbers are compact. ThereforeMA is Seifert
ﬁbered and covered byT × S1, and we gete = χ = 0.
If |trA| = 2 then Ais conjugate to
(±1 e
0 ±1
)
and we use Exercise 11.4.11.
Proposition 11.4.10 easily shows that all the Seifert manifolds that are
torus bundles are realised with|trA| ⩽ 2, hence if|trA| > 2 the manifold
M is not Seifert by Proposition 11.4.12. □
When |trA| > 2 we say that the monodromyA is Anosov.
11.4.6. Bundles with χ(Σ) < 0. Proposition 11.4.12 does not ex-
tend to surface bundles withχ(Σ) < 0; indeed it may happen that non-
conjugate monodromies in MCG(Σ) give rise to diﬀeomorphic manifolds
and understanding when this happens is a hard problem.
Proposition 11.4.14 extends nevertheless and reﬂects the trichotomy
of mapping classes. LetΣ be a closed orientable surface withχ(Σ) < 0.


## Page 374

366 11. CONSTRUCTIONS OF THREE-MANIFOLDS
Recall from Section 8.4 that every elementψ ∈ MCG(Σ) is either ﬁnite
order, reducible, or pseudo-Anosov.
Proposition 11.4.15. Let Mψ be a surface bundle with ﬁbreΣ and
monodromy ψ ∈ MCG(Σ). The following holds:
• if ψ has ﬁnite order, thenMψ is Seifert withχ < 0 and e = 0,
• if ψ is reducible, thenMψ contains an essential torus,
• if ψ is pseudo-Anosov, thenMψ is simple and not Seifert.
Proof. Same proof as Proposition 11.4.14. Ifψ has ﬁnite order, it
is an isometry for some hyperbolic metric onΣ, and the line ﬁbration of
Σ × [−1, 1] glues to a Seifert ﬁbration forMψ.
If ψ is reducible there are some disjoint essential simple closed curves
γ1, . . . , γk with ψ(γi ) = γi+1 cyclically; by gluing the annuliγi × [−1, 1] we
get a torusT ⊂ Mψ. It is essential because by cutting along it we still get
a ﬁbration overS1 with ﬁbers havingχ ⩽ 0.
If ψ is pseudo-Anosov there are no essential toriT ⊂ Mψ, for by
minimising T ∩ Σ then Mψ \ T would consist of essential annuli of type
γ ×[−1, 1]andhence ψ wouldbereducible. Themanifold Mψ isnotSeifert
because the ﬁbreΣ would become a horizontal surface: thenM would be
covered byΣ × S1 and hence ψ would be of ﬁnite order. □
11.5. JSJ decomposition
In Chapter 9 we cut every closed three-manifold along spheres, and
it is now time to decompose it further along tori. This two-steps cutting
operation is called theJSJ decompositionof the manifold, after the names
of Jaco, Shalen, and Johansson who discovered it in the mid 1970s.
The core of this decomposition is the existence of a canonical set of
disjoint essential tori, unique up to isotopy.
11.5.1. Canonical torus decomposition.Let M be an orientable irre-
ducibleand ∂-irreduciblecompact3-manifoldwith(possiblyempty)bound-
ary consisting of tori. How can we deﬁne a canonical set of disjoint essen-
tial tori inM? The answer is not obvious: for instance, ifM is a Seifert
manifold, it may contain many vertical incompressible tori and there is no
canonical way to choose among them.
We will soon see that the Seifert manifolds are in fact the only possible
source of ambiguity. Let
S = T1 ⊔ · · · ⊔ Tk
be a set of disjoint essential toriTi ⊂ int(M). We say that S is atorus
decomposition of M if it decomposesM into blocks that are either:
• torus (semi-)bundles,
• Seifert manifolds, or
• simple manifolds.


## Page 375

11.5. JSJ DECOMPOSITION 367
A torus decomposition isminimal if no proper subset ofS is a torus
decomposition. We prove here the following.
Theorem 11.5.1 (JSJ decomposition).Let M be an orientable irre-
ducibleand ∂-irreduciblecompact3-manifoldwith(possiblyempty)bound-
ary consisting of tori. A minimal torus decomposition forM exists and is
unique up to isotopy.
Such a minimal decomposition is called thecanonical torus decompo-
sition or theJSJ decompositionof M. The canonical torus decomposition
may be empty: this holds precisely whenM is itself a torus (semi-)bundle,
Seifert, or simple.
Remark 11.5.2. Torus (semi-)bundles are closed: therefore ifM is not
itself a torus (semi-)bundle, the blocks of its canonical decomposition are
either Seifert or simple.
11.5.2. Existenceanduniqueness. Let M beanorientableirreducible
and ∂-irreducible compact 3-manifold with (possibly empty) boundary con-
sisting of tori. We now prove Theorem 11.5.1. Let us start by showing
existence.
Proposition 11.5.3. The manifold M has a torus decomposition.
Proof. Let T1, . . . , Tk be a maximal set of disjoint non-parallel es-
sential tori in M, which exists by Corollary 9.4.8. We now prove that
S = T1 ⊔ · · · ⊔ Tk is a torus decomposition.
Suppose it is not: one block N of the decomposition is neither a
(semi-)bundle, nor Seifert, nor simple. The block N is irreducible and
∂-irreducible since these properties are preserved after cutting along in-
compressible surfaces. Being not simple, it contains an essential annulus
A or an essential torusT.
In the latter case we can add T to the family T1, . . . , Tk and get
a contradiction since S is maximal. In the former case Lemma 11.2.10
applies and N is Seifert. □
Since M has a torus decomposition, it certainly has a minimal one.
We now prove that it is unique.
Proposition 11.5.4. The manifold M has a unique minimal torus de-
composition up to isotopy.
Proof. Let S = T1 ⊔ · · · ⊔ Tk and S′ = T′
1 ⊔ · · · ⊔ T′
k′ be two minimal
torus decompositions forM. We minimise their transverse intersections,
so that S ∩ S′ consists of essential circles cutting some tori into annuli.
Let T′
i bedecomposedintosomeannuli. Eachsuchannulusisessential
in M \ S, hence it is contained in some non-simple block,i.e. a Seifert one.
It is contained there horizontally or vertically: in the former case, the
block is
(
D, (2, 1), (2, 1)
)
, S∗ ×
∼
S1, or A × S1 with S∗ the Möbius strip.


## Page 376

368 11. CONSTRUCTIONS OF THREE-MANIFOLDS
The ﬁrst two blocks are diﬀeomorphic, and by swapping the ﬁbration the
annulus becomes vertical. The third block T × I is excluded since S is
minimal.
Now all annuli inT′
i are vertical. Two consequent vertical annuli are
separated by some torusTj; since the two annuli are ﬁbered, the ﬁbers of
the two Seifert blocks incident toTj are isotopic: hence the two blocks
glue to a bigger Seifert block andTj can be removed, a contradiction since
S is minimal.
We have shown thatS ∩ S′ = ∅. If Ti is parallel toT′
j we superpose
the two tori, cut M along Ti = T′
j and proceed by induction. Now we
suppose by contradiction that there is no parallelism.
Every T′
i is an essential vertical torus in a Seifert block ofM \ S, and
vice versa. This easily implies that all the blocks inM \ S, M \ S′, and
all their intersections are Seifert! Pick one such intersection. It has a
unique Seifert ﬁbration, unless it isK ×
∼
I which may ﬁber in two ways.
Since ∂(K ×
∼
I) is connected, one block isK ×
∼
I itself and we change
the ﬁbration on this block if necessary. Now all intersections and all blocks
have unique ﬁbrations and they all glue to a Seifert ﬁbration forM, a
contradiction. □
The proof of Theorem 11.5.1 is complete.
Remark 11.5.5. The sphere decomposition of Theorem 9.2.29 and
the torus decomposition of Theorem 11.5.1 diﬀer in two aspects: (i) the
set of decomposing spheres isnot canonical up to isotopy, while the set of
tori is; (ii) on the other hand, after cutting along the spheres and capping
oﬀ we get a canonical set of prime manifolds, whereas if we cut along the
tori we get some canonical manifolds with toric boundaries, but there is
no canonical way to cap them oﬀ.
11.5.3. Geometric decomposition. The geometric decompositionis
a slight variation of the canonical torus decomposition that is more suited
to the geometrisation perspective that we will encounter in the next chap-
ters. It is constructed from the canonical torus decompositionS for M as
follows. Whenever a blockN of the torus decomposition is diﬀeomorphic
to K ×
∼
I, we substitute the torus∂N in S with the core Klein bottleK
of K ×
∼
I. This substitution has the eﬀect of deletingN from the list of
blocks of the decomposition.
ThegeometricdecompositionconsistsofincompressibletoriandKlein
bottles. One reason for preferring the geometric decomposition to the
canonical torus one is that it contains no interval bundles and every Seifert
block has a unique ﬁbration up to isotopy (because we have eliminated the
K ×
∼
I blocks). In particular we get the following easy criterion, whose
proof is straightforward.


## Page 377

11.5. JSJ DECOMPOSITION 369
Proposition 11.5.6. Let M be an orientable irreducible∂-irreducible
compact 3-manifold with (possibly empty) boundary consisting of tori. A
non-empty torus decomposition ofM is the geometric one if and only if:
• every block is simple or Seifert withχ < 0,
• the ﬁbrations of two adjacent Seifert blocks do not match.
Another reason for preferring the geometric decomposition is that
every Seifert block can be geometrised with ﬁnite volume, whereasK ×
∼
I
needs inﬁnite volume (this will be shown in the next chapter).
Geometric decompositions also behave well under ﬁnite coverings. Let
˜M → M be a ﬁnite covering between two orientable irreducible and∂-
irreducible compact 3-manifolds with (possibly empty) boundary consisting
of tori.
Proposition 11.5.7. The geometric decomposition of ˜M is the coun-
terimage of that ofM.
Proof. The criterion of Proposition 11.5.6 lifts fromM to ˜M. □
11.5.4. Graphmanifolds. Waldhausenintroducedinthe1960sasim-
ple but non-trivial class of three-manifolds using only two blocks. HereD
and P are the disc and the pair-of-pants.
Deﬁnition 11.5.8. Agraph manifold is any orientable three-manifold
that decomposes along disjoint tori into pieces diﬀeomorphic toD × S1 or
P × S1.
One may describe any such manifold via a graph with vertices of va-
lence 1 and 3 representing the blocks, and some appropriate2×2-matrices
labelling the edges telling the way the two incident blocks are glued. As
usual, diﬀerent graphs may represent the same manifold.
Exercise11.5.9. Let M beanorientablethree-manifold. Thefollowing
are equivalent:
(1) M is a graph manifold,
(2) M = M1# . . .#Mh forsomeprimemanifolds Mi whosegeomet-
ric decompositions consist of Seifert manifolds or torus (semi-
)bundles.
Hint. Use Corollary 10.3.44 and Proposition 11.5.6. □
11.5.5. References. Most of the arguments contained in this chapter
are well-known to three-dimensional topologists and can be found in many
books. A standard introduction to knots and links is Rolfsen [50], and
much more on Dehn surgeries and their four-dimensional interpretations
is contained in Gompf – Stipsicz [23]. A proof of the JSJ decomposition
can be found in Hatcher [26], the original papers of Jaco – Shalen and
Johannson are [31] and [32]. Fomenko – Matveev [18] contains a chapter
devoted to graph manifolds; the original paper of Waldhausen is [60].


## Page 378

[No extractable text on this page]


## Page 379

CHAPTER 12
The eight geometries
We have concluded the previous chapter by deﬁning ageometric de-
composition of three-manifolds along sphere and tori. The reason for
using this terminology is the famousgeometrisation conjecture, proposed
by Thurston in 1982 and proved by Perelman in 2003, which states that
each of the blocks of the decomposition should begeometric, in the sense
that it may be equipped with a nice Riemannian metric.
There are eight nice Riemannian metrics available in dimension three.
Three of them are the constant curvature ones (hyperbolic, elliptic, and
ﬂat), while the other ﬁve are some kind of (sometimes twisted) products of
low-dimensional geometries. All these metrics arehomogeneous: distinct
points have isometric neighbourhoods.
TheSeifertmanifoldsstudiedinthepreviouschaptersoccupyprecisely
six of these eight geometries, and we analyse them in detail here.
12.1. Introduction
A connected Riemannian manifold M is homogeneous if for every
p, q ∈ M there is an isometry ofM sending p to q, and isisotropic if at
each point p every isometry ofTpM is realised by an isometry ofM. It is
easy to prove that a complete isotropic manifold is also homogeneous and
has constant sectional curvature: the fundamental examples of isotropic
spaces are Sn, Rn, and Hn.
The homogeneous condition alone (without isotropy) is more relaxed
and produces manifolds that may not have constant sectional curvature.
We introduce here eight important homogeneous simply-connected com-
plete Riemannian 3-manifolds:
S3, R3, H3, S 2 × R, H2 × R, Nil, Sol, ˜SL2.
The ﬁrst three manifolds are also isotropic and have constant sectional
curvature, the other ﬁve are not.
Let M be one of these eight model manifolds. We say that a Rie-
mannian 3-manifold N has a geometric structure modelled onM if N is
locally isometric to M, that is if every pointp ∈ N has an open neigh-
bourhood isometric to some open set inM. This implies thatN is locally
homogeneous: every two pointsp, q ∈ N have isometric neighbourhoods
U(p) ∼= U(q), both isometric to anε-ball at any point ofM.
371


## Page 380

372 12. THE EIGHT GEOMETRIES
χ > 0 χ = 0 χ < 0
e = 0 S2 × R R 3 H2 × R
e ̸= 0 S3 Nil ˜SL2
Table 12.1. The closed manifolds modelled on six geome-
tries are precisely the six commensurable classes of Seifert
manifolds, distinguished by the numberse and χ.
If N is complete, the developing map construction of Theorem 3.1.2
applies also in this context and shows thatN = M/Γ for some discrete
group Γ < Isom(M) acting freely.
We now start a long journey through these eight geometries. The
ﬁnal goal of this chapter is to prove the following.
Theorem12.1.1. Aclosedorientable3-manifoldhasageometricstruc-
ture modelled on one of the following six geometries:
S3, R3, S 2 × R, H2 × R, Nil, ˜SL2
if and only if it is a Seifert manifold of the appropriate commensurability
class, as prescribed by Table 12.1. It has aSol geometric structure if and
only if it is a torus (semi-)bundle of Anosov type.
It is a surprising (and maybe disappointing) fact that, despite its ele-
gance and generality, the only known proof of this theorem available today
works by investigating each geometry separately and carefully, often em-
ploying quite diﬀerent techniques. We start with the elliptic case.
12.2. Elliptic three-manifolds
We start our journey by investigating elliptic 3-manifolds, that is man-
ifolds modelled onS3. We want to prove the following.
Theorem 12.2.1. A closed 3-manifoldM admits an elliptic metric if
and only if it is a Seifert manifold withe ̸= 0 and χ > 0.
An important ingredient of the proof is the complete classiﬁcation of
elliptic three-manifolds: to achieve this goal we need to study the isome-
tries of S3, and these are described elegantly via quaternions.
12.2.1. Unit quaternions. We write as usual aquaternion as
q = a + bi + cj + d k
with a, b, c, d ∈ R and i 2 = j 2 = k 2 = i j k = −1. Quaternions form a
non-commutative algebra, identiﬁed with R4 by sending q to (a, b, c, d )
and with C2 by sending q to (a + bi , c + d i). The norm is
|q| =
√
a2 + b2 + c 2 + d 2


## Page 381

12.2. ELLIPTIC THREE-MANIFOLDS 373
and we have|qq′| = |q||q′|. The conjugate ofq is
¯q = a − bi − cj − d k
and we have |q|2 = q ¯q. Unit quaternions are identiﬁed withS3 and are
closed under multiplication: this givesS3 a Lie group structure.
Exercise 12.2.2. The centre ofS3 is {±1}.
Left or right multiplication by a ﬁxed elementq ∈ S3 is an orientation-
preserving isometry of bothR4 and S3. We consider the homomorphism
Ψ : S3 × S3 − →Isom+(S3) = SO(4)
(q1, q2) ↦− →
{
x ↦− →q1x q−1
2
}
Proposition12.2.3. Thehomomorphism Ψisadegree-2coveringwith
kernel {±(1, 1)}. Therefore it induces an isomorphism
SO(4) = S3 × S3/{±(1,1)}.
Proof. If (q1, q2) lies in the kernel, by settingx = 1 we getq1q−1
2 = 1
and so q1 = q2. The general x implies that q1 = q2 lies in the centre
and hence (q1, q2) = ±(1, 1). Since SO(4) has the same dimension6 of
S3 × S3 and is connected, we get a covering by Proposition 1.4.21.□
We now specialiseΨ to the caseq = q1 = q2. The isometry
x ↦− →qx q−1
ﬁxes 1 and hence preserves the orthogonal 3-space generated byi , j, k,
which we identify withR3. We get a homomorphism
Φ : S3 − →Isom+(R3) = SO(3)
q ↦− →
{
x ↦− →qx q−1}
Proposition12.2.4. Thehomomorphism Φisadegree-2coveringwith
kernel ±1. Therefore it induces an isomorphism
SO(3) = S3/{±1}.
Proof. The centre of S3 is {±1} and SO(3) is connected and has
dimension 3 likeS3, hence Φ is a covering. □
The real part ofq = a + bi + cj + d k is of coursea.
Corollary 12.2.5. Two elements q, q′ ∈ S3 are conjugate if and only
if they have the same real part.
Proof. Conjugations are isometries that ﬁx the real axis and hence
preserve the real part; rotations inSO(3) connect any two elements with
the same real part. □
Corollary 12.2.6.Every unit quaternion is conjugate to a unit complex
quaternion q = a ± bi, unique up to complex conjugation.


## Page 382

374 12. THE EIGHT GEOMETRIES
The conjugacy classes inS3 are the poles+1 and −1, and the parallel
two-spheres between them. Let theimaginary two-spherebe the maximal
two-sphere consisting of all elements with zero real part.
Corollary 12.2.7. The only element in S3 of order two is−1. The
elementsoforderfourformtheimaginarytwo-sphereandareallconjugate.
Proof. An element of order four is conjugate to a complex onea + bi,
which must be±i and is hence purely imaginary. □
Exercise 12.2.8. By sending the unit quaternion(w , z) ∈ C2 to the
matrix ( w z
−¯z ¯w
)
we get a Lie group isomorphism betweenS3 and SU(2).
Note that ¯q = q−1 on unit quaternions. The inversionq ↦→ q−1 is an
orientation-reversing isometry ofS3.
12.2.2. Finite groups of quaternions. We classify the ﬁnite sub-
groups of the Lie groupS3. Recall from Proposition 6.2.15 that the ﬁnite
subgroups of SO(3) up to conjugation are:
Cn, D 2m, T 12 ∼= A4, O 24 ∼= S4, I 60 ∼= A5
with n ⩾ 1 and m ⩾ 2. Here Cn is cyclic generated by a 2π
n -rotation,
and D2m, T, O, I are the orientation-preserving isometry groups of the
regular m-prism, tetrahedron, octahedron (or cube), and icosahedron (or
dodecahedron). The group D2m is the dihedral group. The subscript
always indicates the order of the group (except in the alternatingAn and
symmetric Sn that have ordern!
2 and n!).
We deﬁned above a degree-2 coveringΦ : S3 → SO(3). Let
D∗
4m, T ∗
24, O ∗
48, I ∗
120
be the counterimages ofD2m, T12, O24, I60 along Φ. They are called the
binary dihedral, tetrahedral, octahedral, and icosahedral group. We now
classify the ﬁnite subgroups ofS3.
Proposition 12.2.9. Every ﬁnite subgroup of S3 is either binary or
cyclic. The ﬁnite subgroups up to conjugation are listed in Table 12.2.
Proof. If G < S 3 is ﬁnite then Φ(G) = Cn, D2m, T, O, or I up to
conjugation. If Φ−1(Φ(G)) = G we are done (the counterimage ofCn is
still cyclic: exercise). This holds precisely when−1 ∈ G.
If G has even order, it contains an order-2 element which is necessarily
−1 and we are done. IfG has odd order,Φ(G) has odd order and is cyclic,
so G is contained in the cyclicΦ−1(Φ(G)) and is hence cyclic. □


## Page 383

12.2. ELLIPTIC THREE-MANIFOLDS 375
name elements
Cn cyclic
{
e
2aπi
n
}
a=1,...,n
D∗
4m binary dihedral
{
e
aπi
m , e
aπi
m j
}
a=1,...,2m
T∗
24 binary tetrahedral
{
± 1, ± i ,± j, ± k, 1
2
(
± 1 ± i ± j ± k
)}
O∗
48 binary octahedral T∗
24 ∪
{±1±i√
2 , ±1±j√
2 , . . . ,±i±k√
2 , ±j±k√
2
}
I∗
120 binary icosahedral T∗
24 ∪
{
± 1
2 i ±
√
5−1
4 j ±
√
5+1
4 k, . . .
}
Table 12.2.Every ﬁnite subgroup ofS3 is conjugate to one
of these groups. The group O∗
48 consists of T∗
24 and the
6× 4 = 24 numbers obtained from±1±i√
2 by permuting the
elements 1, i , j, k and varying the signs. The groupI∗
120 con-
sists of T∗
24 and the 12× 8 = 96 numbers obtained from
± 1
2 i±
√
5−1
4 j±
√
5+1
4 k by permuting the elements 1, i , j, k
with aneven permutation and varying the signs.
The smallest non-abelian group in the list is thequaternion group
Q8 = D∗
8 consisting of theLipschitz units
Q8 = {±1, ±i ,±j, ±k}.
The quaternion group is contained inT∗
24 as a normal subgroup, giving an
exact sequence
(13) 0 − →Q8 − →T∗
24 − →Z3 − →0.
The binary dihedral groupD∗
4m contains the index-two cyclic groupC2m,
giving an exact sequence
(14) 0 − →C2m − →D∗
4m − →Z2 − →0.
Remark 12.2.10. Every groupΓ in Table 12.2 acts freely and isomet-
rically onS3 by right multiplication, henceS3/Γ is an elliptic manifold with
fundamental group Γ. The only perfect group in the list (i.e. with trivial
abelianisation) is I∗
120 and we will soon see thatS3/I∗
120 is the ubiquitous
Poincaré homology sphereΣ(2, 3, 5), deﬁned in Section 10.3.5.
12.2.3. Regular polytopes. There are six regular polytopes in dimen-
sion four, listed in Table 12.3, and the ﬁnite groups ofS3 can be used to
describe ﬁve of them. The convex hull ofQ8 in R4 is the16-cell, whose
dual is thehypercube. The groupT∗
24 consists of the vertices of the 16-cell
and of the dual hypercube altogether.
The convex hull of T∗
24 is the 24-cell: this is the unique self-dual
regular polytope in all dimensionsn ⩾ 3 which is not a simplex! See Figure
12.1. The groupO∗
48 consists of the vertices of the 24-cell and of its dual.
Finally, the convex hull ofI∗
120 is the600-cell, whose dual is the120-cell.


## Page 384

376 12. THE EIGHT GEOMETRIES
name vertices edges faces facets Schläﬂi
simplex 5 10 10 5 tetrahedra {3, 3, 3}
hypercube 16 32 24 8 cubes {4, 3, 3}
16-cell 8 24 32 16 tetrahedra {3, 3, 4}
24-cell 24 96 96 24 octahedra {3, 4, 3}
120-cell 600 1200 720 120 dodecahedra {5, 3, 3}
600-cell 120 720 1200 600 tetrahedra {3, 3, 5}
Table 12.3. The six regular polytopes in dimension four,
with their Schläﬂi notation (see Section 3.3.3). The groups
Q8, T∗
24, and I∗
120 consist of the vertices of the 16-cell, 24-
cell, and 600-cell respectively.
Figure 12.1. A stereographic projection of the tessellation
of S3 induced by the 24-cell. Its24 vertices form the binary
tetrahedral group T∗
24. Its facets are 24 regular octahedra.
12.2.4. Classiﬁcation of elliptic 3-manifolds.We now want to clas-
sify all the elliptic 3-manifolds. We start with a linear algebra exercise.
Exercise 12.2.11. Let A ∈ O(4). Then
• if det A = −1, it ﬁxes pointwise a line,


## Page 385

12.2. ELLIPTIC THREE-MANIFOLDS 377
• if det A = +1, it preserves two orthogonal planes and acts as a
rotation on each.
Every elliptic 3-manifold is isometric toS3/Γ for some ﬁnite subgroup
Γ < O(4) acting freely. The exercise implies that Γ < SO(4), since
orientation-reversing elements ﬁx some point inS3. Therefore we get:
Corollary 12.2.12. Every elliptic 3-manifold is orientable.
We have already encountered the lens spaceL(p, q) = S3/Γ where
the cyclic groupΓ = Cp,q is generated by the isometry
(z , w) ↦− →(ωz , ωqw ) with ω = e
2πi
p .
Another consequence of the exercise is the following.
Corollary 12.2.13. Every ﬁnite abelian groupΓ < SO(4) acting freely
is conjugate toCp,q for some coprimep, q.
Proof. An abelianΓ ﬁxes two orthogonal planesU and V and acts on
each as rotations. The restriction mapΓ → Isom+(U) is injective because
Γ acts freely onS3. Therefore Γ is cyclic, generated by an element that
acts on both planes by rotations of orderp = |Γ|, so Γ is conjugate to
Cp,q. □
We now want to construct non-abelian examples. It is convenient to
look at SO(4) as the image ofS3 × S3 via the surjective mapΨ deﬁned
above. Which elements of S3 × S3 act freely on S3? The answer is
particularly simple.
Proposition 12.2.14. The isometry Ψ(q1, q2) of S3 has a ﬁxed point
if and only ifq1 and q2 are conjugate inS3.
Proof. We have q1x q−1
2 = x for some x ∈ S3 if and only if q1 =
x q2x−1, that isq1 and q2 are conjugate. □
The following corollary will help to rule out many cases.
Corollary 12.2.15. If q1 and q2 have both order four, the isometry
Ψ(q1, q2) has a ﬁxed point.
We now construct more examples.
Proposition 12.2.16. If two ﬁnite subgroupsG, H < S 3 have coprime
orders, the imageΨ(G × H) acts freely onS3.
Proof. If (g1, g2) ∈ G × H is non-trivial, the elementsg1 and g2 have
coprime and hence distinct orders, thus they are not conjugate. □
Corollary 12.2.17. If G is a group from Table 12.2 andn is coprime
with the order ofG, then Ψ(G × Cn) acts freely onS3.


## Page 386

378 12. THE EIGHT GEOMETRIES
Γ conditions |Γ| Z Γ/Z
Cp,q p > 0, (p, q) = 1 p C p {e}
Ψ
(
D∗
4m × Cn
)
m > 1, n > 0, (4m, n) = 1 4 mn C 2n D2m
Γ <
2
Ψ
(
D∗
4m × C4n
)
m > 1, n > 0, n even, (m, n) = 1 4 mn C 2n D2m
Ψ
(
T∗
24 × Cn
)
n > 0, (24, n) = 1 24 n C 2n T12
Γ <
3
Ψ
(
T∗
24 × C6n
)
n > 0, n odd, 3|n 24n C 2n T12
Ψ
(
O∗
48 × Cn
)
n > 0, (48, n) = 1 48 n C 2n O24
Ψ
(
I∗
120 × Cn
)
n > 0, (120, n) = 1 120 n C 2n I60
Table 12.4.The ﬁnite subgroupsΓ < SO(4) that act freely
on S3, up to conjugation in O(4). For each we show its
centre Z and the quotient Γ/Z. If Γ is not cyclic, the two
groups Z and Γ/Z determine Γ up to conjugation (note that
n satisﬁessomecongruenceequalitywhichseparateslines2,3
and 4,5). The symbolΓ <i G indicates that Γ has index i.
This corollary produces most of the non-cyclic subgroups ofSO(4)
acting freely on S3, but not all of them! Table 12.4 lists all the ﬁnite
subgroups ofSO(4) acting freely, up to conjugation inO(4). The ﬁrst line
shows the cyclic groupsCp,q, and the other families of groups are all of
type Ψ(G × Cn), except the third and ﬁfth line which we now explain.
Remark 12.2.18. For all groups in Table 12.4 of typeG × Cn, we have
Ψ(G × Cn) ∼= G × Cn because n is odd and hence(−1, −1) ̸∈ G × Cn.
In the third line of Table 12.4, the groupΓ is an index-two subgroup
of Ψ(D∗
4m × C4n). It is the image alongΨ of the kernel of the map
D∗
4m × C4n − →Z2
(g1, g2) ↦− →f1(g1) + f2(g2)
where f1 is the map in (14) andf2 is the surjective homomorphismC4n →
Z2. Analogously, the groupΓ in the ﬁfth line is an index-three subgroup
of Ψ(T∗
24 × C6n): it is the image alongΨ of the kernel of the map
T∗
24 × C6n − →Z3
(g1, g2) ↦− →f1(g1) + f2(g2)
where f1 is the map in (13) andf2 is any surjective homomorphismC6n →
Z3. Both f1 and f2 are well-deﬁned only up to automorphisms ofZ3, but
the kernel is well-deﬁned up to conjugation inS3 × S3 anyway: there are
four possibilities and they are related by conjugations via the elements


## Page 387

12.2. ELLIPTIC THREE-MANIFOLDS 379
(1, j) and
(1+i√
2 , 1
)
, as one can easily check (these conjugations permute
the cosets ofC2n ◁ C6n and Q8 ◁ T∗
24).
Proposition 12.2.19. The ﬁnite subgroups ofSO(4) shown in Table
12.4 act freely onS3.
Proof. We only need to prove this for the groupsΓ that belong to
the third and ﬁfth family. Concerning the third, pick an element(g1, g2) ∈
S3 × S3 that projects to a non-trivial element inΓ. We want to prove that
g1 and g2 have distinct orders and are hence non-conjugate.
By hypothesis f1(g1) + f2(g2) = 0 in Z2 and hence f1(g1) = f2(g2) is
either 0 or 1. In the ﬁrst case we getg1 ∈ C2m and g2 ∈ C2n which have
distinct orders since(m, n) = 1 and (g1, g2) ̸= ±(1, 1). In the second case
g1 ∈ D∗
4m \ C2m has order four (check from Table 12.2) andg2 ∈ C4n \ C2n
does not have order four sincen is even.
The ﬁfth family is treated similarly. Pick(g1, g2) ∈ Γ with non-trivial
image in SO(4). If f1(g1) = f2(g2) = 0 then g1 ∈ Q8 has order 1, 2, or 4
and g2 ∈ C2n does not have order 4 sincen is odd. Iff1(g1) = −f2(g2) ̸= 0
then g1 ∈ T∗
24 \ Q8 has order 3 or 6 (check from Table 12.2) whileg2 ∈
C6n \ C2n cannot have order 3 or 6 since3 divides n. □
We now show that Table 12.4 exhausts all possibilities.
Proposition 12.2.20. Every ﬁnite subgroup ofSO(4) acting freely on
S3 is conjugate inO(4) to one in Table 12.4.
Proof. Let a ﬁnite Γ < SO (4) act freely on S3. We consider its
counterimage G = Ψ−1(Γ) in S3 × S3.
We note that the orientation-reversing isometryq ↦→ q−1 of S3 con-
jugates Ψ(q1, q2) to Ψ(q2, q1), since
x ↦− →(q1x−1q−1
2 )−1 = q2x q−1
1 .
Therefore via conjugation inO(4) we may swap the factors ofS3 × S3.
If G is a productG = G1 × G2, then G1 and G2 are some groups from
Table 12.2. If they are both cyclic, thenΓ is abelian and we conclude by
Corollary 12.2.13. If they are both non-cyclic, they both contain order-4
elements and we get a contradiction from Proposition 12.2.15.
Therefore G = G1 × Ck with G1 equal to D∗
4m, T∗
24, O∗
48, or I∗
120, and
k not divisible by four. Since (−1, −1) ∈ G we get k = 2 n, and n odd
implies that Ψ(G1 × Cn) = Ψ( G1 × C2n). Moreover n is coprime with the
order of G1 otherwise Proposition 12.2.14 would easily give a ﬁxed point.
Therefore we get a product group as in Table 12.4.
We are left to consider the caseG is not a product. Let G1 × G2
(resp. G′
1 ×G′
2) be the smallest (resp. biggest) product subgroup ofS3 ×S3
such that
G′
1 × G′
2 < G < G 1 × G2.


## Page 388

380 12. THE EIGHT GEOMETRIES
The subgroup G1 (resp. G′
1) consists of allg1 ∈ S3 such that (g1, g2) ∈ G
for some g2 (resp. such that(g1, 1) ∈ G). It is easy to check thatG′
i ◁ Gi
and
G/G′
1×G′
2
∼= G1/G′
1
∼= G2/G′
2
.
Each Gi and G′
i is ﬁnite and hence conjugate to one in Table 12.2. If
both G1 and G2 are cyclic, the groupΓ is abelian and we are done. We
henceforth suppose thatG1 and G2 are not both cyclic.
By the same reasoning above, up to reorderingG′
2 contains no order-4
elements and henceG′
2 = Cs with s not divisible by four.
We now prove thatG′
1 contains all the order-4 elements ofG1. To
do so we pick an order-4 elementg1 ∈ G1 and prove that±g1 ∈ G′
1: this
suﬃces since g1 = ( −g1)3. We have (g1, g2) ∈ G for some g2 of some
order 2t k with k odd. We have (gk
1 , gk
2 ) = ( ±g1, gk
2 ), so up to replacing
g2 with gk
2 we may supposek = 1 and g2 has order2t.
We have(1, g4
2) = ( g4
1 , g4
2) ∈ G and henceg4
2 ∈ G′
2. Suppose s is odd.
Therefore g4
2 ∈ G′
2 = Cs is trivial andg2 has order 2t; thus g2 has order
1, 2, or 4. It cannot have order4 by Corollary 12.2.15, thereforeg2 = ±1
and hence ±g1 ∈ G′
1 as required.
If s is even we get the same conclusion: now(−1, g2
2) = ( g2
1 , g2
2) ∈ G
hence (1, −g2
2) ∈ G gives −g2
2 ∈ G′
2 and thus g2
2 ∈ G′
2 since s is even.
Again this implies thatg2 has order 1,2, or 4 and we conclude as above.
We have proved that G′
1 contains all order-4 elements ofG1. The
groups D∗
4n, O∗
48, and I∗
120 are generated by their order-4 elements (exer-
cise), hence G′
1 ̸= G1 implies that G1 is not one of them. Then it is either
cyclic or T∗
24.
If G1 = Ch is cyclic, then G′
1 and G1/G′
1
∼= G2/G′
2
also are. By as-
sumption G2 is not cyclic, but it contains the cyclicG′
2 with non-trivial
cyclic quotient: the only possibility from Table 12.2 is thatG2 = D∗
4m and
G′
2 = C2m. Therefore G is an index-two subgroup ofG1 × G2 = Ch × D∗
4m
as in the third line of Table 12.4.
We need to prove thath = 4 n with n even and (n, m) = 1 . Since
G′
1 < G 1 has index two,h is even. Since(1, −1) ∈ G′
1 × C2m < G, we also
have (−1, 1) ∈ G and hence −1 ∈ G′
1. Therefore |G′
1| is even and 4|h.
Since G′
1 contains all order-4 elements ofG1, four divides|G′
1| and hence
8|h. Therefore h = 4 n with n even, as required. Moreover (m, n) = 1
since G′
1 × G′
2 = C2n × C2m ⊂ G.
If G1 = T∗
24 the order-4 elements generate the index-three subgroup
Q8 and hence G′
1 = Q8 and G2/G′
2
∼= G1/G′
1
∼= Z3. Recall that G′
2 = Cs
with s not divisible by four. As above,−1 ∈ G′
1 implies −1 ∈ G′
2 and hence
s = 2n with n odd. Therefore G2 has order6n and must hence be cyclic.
The group G is an index-3 subgroup ofG1 × G2 = T∗
24 × C6n as in the
ﬁfth line of Table 12.4. We must have3|n otherwise G contains an ele-
ment (g1, g2) with bothg1, g2 having order 3 (see the proof of Proposition
12.2.19). □


## Page 389

12.2. ELLIPTIC THREE-MANIFOLDS 381
We can ﬁnally summarise our discoveries:
Corollary 12.2.21.Table 12.4 lists all the ﬁnite subgroupsΓ < SO (4)
acting freely onS3 up to conjugation inO(4), without repetitions.
Proof. There are no repetitions because the non-cyclic groups listed
are all non-isomorphic: the isomorphism types of the centreZ and Γ/Z
suﬃce to determine Γ in that list, see Table 12.4 (note thatn satisﬁes
some congruence equality which separates the lines 2,3 and 4,5).
To compute|Γ|, we use Remark 12.2.18 and note that(−1, −1) be-
longs to (D∗
4m × C4n) and (T∗
24 × C6n).
To compute Z and Γ/Z, we note that in all the non-cyclic casesΓ
is the image of a subgroup in some productG∗ × Ckn which is “diagonal”,
in the sense that it maps surjectively to both factorsG∗ and Ckn. The
map ontoG∗ pushes-forward to a surjectionΓ → G, whose kernel is easily
detected as being the centreZ and isomorphic toC2n in all cases. □
12.2.5. Seifert ﬁbrations of elliptic 3-manifolds.We now turn back
to Seifert manifolds and prove Theorem 12.2.1. LetS1 ⊂ S3 be the unit
complex numbers. Recall that S3 × S3 acts on S3 via Ψ. The following
proposition is crucial: it says that a big Lie subgroup ofS3 × S3 preserves
the Hopf ﬁbration; later on we will discover that every ﬁnite subgroupΓ
of S3 × S3 acting freely may be conjugated into this big group and hence
every quotient S3/Γ inherits a Seifert structure from the Hopf ﬁbration,
hence every elliptic three-manifold is Seifert.
Proposition 12.2.22. The groupS1 × S3 preserves the Hopf ﬁbration.
Proof. Represent quaternions as pairs(z1, z2) of complex numbers.
The Hopf ﬁbrationS3 → CP1 is the map(z1, z2) → [z1, z2]. One checks
easily that quaternion multiplication acts as follows:
(z1, z2)(w1, w2) = ( z1w1 − z2 ¯w2, z2 ¯w1 + z1w2).
Therefore right-multiplication by(w1, w2) ∈ S3 acts C-linearly on C2 and
hence preserves the Hopf ﬁbration.
Left multiplication by (w1, w2) is not C-linear in general, but it is
so when (w1, w2) = ( w1, 0) ∈ S1, since (w1, 0)(z1, z2) = ( w1z1, w1z2).
Therefore S1 × S3 preserves each ﬁbre of the Hopf ﬁbration. □
We can ﬁnally prove Theorem 12.2.1.
Theorem 12.2.23. A closed 3-manifoldM admits an elliptic metric if
and only if it is a Seifert manifold withe ̸= 0 and χ > 0.
Proof. If M is elliptic thenM = S3/Γ for some ﬁnite subgroupΓ <
SO(4) acting freely. IfΓ is conjugate toCp,q we get a lens space and we
are done. Otherwise Table 12.4 shows thatΓ is conjugate to the image of
a subgroup ofS1 × S3 (because Cn < S 1). Therefore up to conjugationΓ


## Page 390

382 12. THE EIGHT GEOMETRIES
ﬁbration condition Γ
(
S2, (2, 1), (2, 1), (p, q)
)
p + q > 0 odd Ψ
(
D∗
4p × Cp+q
)
(
S2, (2, 1), (2, 1), (p, q)
)
p + q > 0 even Γ <
2
Ψ
(
D∗
4p × C4(p+q)
)
(
S2, (2, 1), (3, 1), (3, q)
)
3 ∤ 5 + 2q Ψ
(
T∗
24 × C|5+2q|
)
(
S2, (2, 1), (3, 1), (3, q)
)
3|5 + 2q > 0 Γ <
3
Ψ
(
T∗
24 × C6(5+2q)
)
(
S2, (2, 1), (3, 1), (4, q)
)
Ψ
(
O∗
48 × C|10+3q|
)
(
S2, (2, 1), (3, 1), (5, q)
)
Ψ
(
I∗
120 × C|25+6q|
)
Table 12.5. The non-lens elliptic manifolds, listed without
repetitions. For each we show its Seifert ﬁbration and fun-
damental groupΓ < SO(4). Here p > 1. The integerq may
be negative, if not forbidden explicitly. In the fourth line3
divides 5 + 2q, which must be positive.
preserves the Hopf ﬁbration ofS3, which descends to a Seifert ﬁbration.
We have χ > 0 and e ̸= 0 because the universal cover ofM is S3.
Conversely, we now show that every Seifert manifold withχ > 0 and
e ̸= 0 arises as an elliptic manifoldS3/Γ. The Seifert manifolds were listed
inTable10.6, andthecorresponding ΓisshowninTable12.5. Toverifythe
correspondence, note that the centreZ of Γ = π1(M) and the quotient
Γ/Z are shown in Table 12.4 and they fully determineΓ. Proposition
10.4.18 says that Z < π 1(M) is generated by a regular ﬁbre andΓ/Z is
the orbifold fundamental group of the base. □
In particular we have the following:
π1
(
S2, (2, 1), (2, 1), (2, −1)
)
= Q8,
π1
(
S2, (2, 1), (2, 1), (p, 1 − p)
)
= D∗
4p,
π1
(
S2, (2, 1), (3, 1), (3, −2)
)
= T∗
24,
π1
(
S2, (2, 1), (3, 1), (4, −3)
)
= O∗
48,
π1
(
S2, (2, 1), (3, 1), (5, −4)
)
= I∗
120.
The latter is Poincaré’s homology sphere, the unique elliptic three-
manifold with perfect fundamental group (see Section 10.3.5).
12.3. Flat three-manifolds
We turn to ﬂat three-manifolds. In dimension two, every orientation-
preserving isometry ofR2 is a translation, and this easily implies that every
ﬂat orientable closed surface is a torus. In dimension three we also have
rototranslations, which produce more orientable manifolds.


## Page 391

12.3. FLAT THREE-MANIFOLDS 383
We now classify all the closed ﬂat orientable three-manifolds up to
diﬀeomorphism and prove the following.
Theorem 12.3.1.A closed orientable 3-manifoldM admits a ﬂat met-
ric if and only if it is a Seifert manifold withe = χ = 0.
There are six such manifolds, listed in Table 10.3.
12.3.1. Classiﬁcation. Every closed ﬂat 3-manifold is isometric to
R3/Γ for some crystallographic group Γ < Isom(R3) acting freely, see
Section 4.4.4.
Exercise 12.3.2. Every element inΓ is either a translation or a roto-
translation (deﬁned in Example 4.4.7).
We prove one half of Theorem 12.3.1.
Proposition 12.3.3.Every closed orientable ﬂat 3-manifold is a Seifert
manifold with e = χ = 0.
Proof. We have M = R3/Γ. Recall the exact sequence
0 − →H − →Γ − →r (Γ) − →0
where H ◁ Γ is the translation subgroup and r (Γ) < SO (3) is ﬁnite by
Proposition 4.4.9. We now prove thatΓ preserves a foliation ofR3 into
parallel lines that projects to a Seifert structure onM.
If r (Γ) is trivial, then Γ = H consists of translations and preserves
many foliations into parallel lines that project to a Seifert structure on the
quotient 3-torusM. If r (Γ) is non-trivial, it is isomorphic toCn, D2m, T12,
O24, orI60. If r (Γ) = Cn or D2m, it has a common ﬁxed vector linel ⊂ R3
and Γ preserves the foliation of lines parallel tol.
If r (Γ) = T12, O24, or I60 we obtain a contradiction as follows. In all
cases we have T12 ⊂ r (Γ). The group T12 consists of the identity, the
π-rotations along the three coordinate axis, and the± 2π
3 -rotations along
the axis spanned by(1, 1, 1), (1, −1, −1), (−1, 1, −1), and (1, −1, −1).
Pick a rototranslationh ∈ Γ with axis l parallel to(1, 1, 1), and up to
conjugating Γ by a translation we may suppose thatl contains the origin
0 ∈ R3. Wehave h(0) = ( d , d , d)forsome d ̸= 0. Since h3 isatranslation
we get(3d ,3d ,3d) ∈ H.
The group Γ and hence T12 acts on H via conjugation. Therefore H
is T12-symmetric and (3d ,−3d ,−3d) ∈ H using the π-rotation along the
ﬁrst axis. Hencet = (6d ,0, 0) = (3 d ,3d ,3d)+(3 d ,−3d ,−3d) ∈ H. The
composition t ◦ h2 has a ﬁxed point, because it sends0 to (2d ,2d ,2d) −
(6d ,0, 0) = ( −4d ,2d ,2d) which is orthogonal tol: a contradiction.
In all cases M has a Seifert structure. By Bieberbach’s Theorem
(stated as Corollary 4.4.11) the manifoldM is ﬁnitely covered by the 3-
torus, and henceχ = e = 0 by Proposition 10.3.26. □
We now prove the other half.


## Page 392

384 12. THE EIGHT GEOMETRIES
L
L
P
P
P
P
PP
P
P P
P
F
F
Figure 12.2. The six closed orientable ﬂat 3-manifolds, up
to diﬀeomorphism. Each is constructed by pairing isometri-
cally the faces of a polyhedron inR3 according to the labels.
When a face has no label, it is simply paired to its oppo-
site by a translation. The polyhedra shown here are three
cubes, two prisms with regular hexagonal basis, and one par-
allelepiped made of two cubes.
Proposition 12.3.4. Every closed Seifert manifoldM with e = χ = 0
admits a ﬂat metric.
Proof. There are six such Seifert manifolds up to diﬀeomorphism,
listed in Table 10.3. We build a ﬂat metric for each in Figure 12.2.
The ﬁgure shows six ﬂat manifolds, constructed by identifying isomet-
rically the faces of a polyhedron inR3. The reader is invited to check that
each construction gives indeed a ﬂat manifold, by verifying that the ﬂat
metric extends to the edges and to the vertices.
In all cases the foliation by parallel horizontal lines (orthogonal to the
P faces) descends to a Seifert ﬁbration on the ﬂat manifold. By looking at
these lines one checks that the base surface of the ﬁbration is respectively
T, (S2, 2, 2, 2, 2), (S2, 2, 4, 4), (S2, 2, 3, 6), (S2, 3, 3, 3), (RP2, 2, 2).
These orbifolds are obtained respectively from the ﬁgures by considering:
the square torus, its quotient via aπ-rotation, via a π
2-rotation, the quo-
tientofahexagontorusbya π
3-rotation, bya 2π
3 -rotation, andthequotient
of a Klein bottle via aπ-rotation.
These ﬂat Seifert manifolds have e = 0 by Proposition 12.3.3, and
hence they are precisely those listed in Table 10.3. □


## Page 393

12.4. THE PRODUCT GEOMETRIES 385
Figure 12.3. The Hantsche-Wendt manifold M = R3/Γ.
The groupΓ is generated by three rototranslations along the
three red axis shown, each of angleπ and with unit displace-
ment (this is a unit cube). A fundamental domain forΓ is
made of two unit cubes as in Figure 12.2-(bottom, right).
We have proved Theorem 12.3.1.
Remark 12.3.5. The rotational imager (Γ) < SO (3) of Γ for the six
ﬂat manifolds M = R3/Γ constructed in Figure 12.2 is respectively{e},
C2, C4, C6, C3, and the dihedral D4 = C2 × C2. The sixth manifold is
called theHantzsche-Wendt manifold: the group Γ is generated by three
rototranslations as in Figure 12.3.
In contrast with the hyperbolic case, a ﬁnite-volume complete ﬂat
manifold is necessarily closed (see Proposition 4.4.12). The Seifert mani-
folds with boundary andχ = 0 are diﬀeomorphic to the bundlesT × I and
K ×
∼
I. Their interiorsT × R and K ×
∼
R may be given aninﬁnite-volume
complete ﬂat structure. The lack of a ﬁnite-volume complete ﬂat struc-
ture forK ×
∼
R is a reason for preferring the geometric decomposition to
the canonical torus decomposition, see Section 11.5.3.
12.4. The product geometries
The eight three-dimensional geometries include the three isotropic
ones, plus ﬁve more. Among the ﬁve non-isotropic geometries, two are
products of lower-dimensional geometries. We analyse them here.
12.4.1. S2 × R geometry. We equipS2 × R with the product metric.
The product S2 × R is the poorest of the eight geometries, in the sense
that there are very few manifolds modelled onS2 × R.
Recall that the sectional curvature is a number assigned to every plane
inthetangentspaceofeverypoint p ∈ S2×R. Onesuchplaneis horizontal
if it is tangent to theS2 factor andvertical if it contains the line tangent
to the R factor.
Proposition12.4.1. Thesectionalcurvaturesofhorizontalandvertical
planes are1 and 0, respectively.
Proof. Let γ ⊂ S2 beaclosedgeodesic. Thesurfaces S2×y and γ×R
are totally geodesic, because they are ﬁxed by some isometric reﬂections


## Page 394

386 12. THE EIGHT GEOMETRIES
of S2 × R. Thus the sectional curvatures of horizontal and vertical planes
equal the gaussian curvatures of these surfaces, which are1 and 0. □
Proposition 12.4.2. We have
Isom(S2 × R) = Isom( S2) × Isom(R).
Proof. We certainly have the inclusion⊃, which gives to every point
x ∈ S2 × R a stabiliser in Isom+(S2 × R) isomorphic to SO(2) ⋊ C2, a
proper maximal subgroup ofSO(3) by Proposition 6.2.15.
If there were more isometries than that, there would be more ﬁxingp
since they act transitively onS2 × R and the stabiliser would be the whole
of SO(3), a contradiction because the sectional curvature ofS2 × R is not
constant. □
Since the isometry groups ofS2 and R have two connected compo-
nents each, the groupIsom(S2 × R) has four connected components, two
of which are orientation-preserving.
Proposition 12.4.3. An orientable manifoldM admits a ﬁnite-volume
S2 ×Rgeometry ⇐ ⇒M is a closed Seifert manifold withe = 0 and χ > 0.
Proof. The closed Seifert manifolds withe = 0 and χ > 0 are just
S2 × S1 and RP2 ×
∼
S1, and they are diﬀeomorphic to(S2 × R)/Γ where
Γ is generated respectively by
{
(id, τ)
}
,
{
(ι, r), (ι, r′)
}
where τ is any translation,ι is the antipodal map andr, r′ are reﬂections
with respect to distinct points inR.
Conversely, pick an orientableM = ( S2 × S1)/Γ. The discrete sub-
group Γ < Isom(S2)×Isom(R)preservesthefoliationintospheres S2 ×{x}
which descends into a foliation into spheres and/or projective planes for
M. Therefore M decomposes into orientable interval bundlesS2 × I and
RP2 ×
∼
I, and is hence eitherS2 × S1 or RP2 ×
∼
S1. □
12.4.2. H2 × R geometry. We giveH2 × R the product metric. The
discussion of the previous section applies as is to this case, showing that
horizontal and vertical planes in the tangent spaces have sectional curva-
ture −1 and 0. This in turn implies that
Isom(H2 × R) = Isom( H2) × Isom(R)
has four connected components, two being orientation-preserving. It is
convenient to write the exact sequence
0 − →Isom(R) − →Isom(H2 × R)
p
− →Isom(H2) − →0.
A discrete groupΓ < Isom(X) is coﬁnite if X/Γ has ﬁnite volume.
Proposition 12.4.4. A discrete groupΓ < Isom(H2 × R) is coﬁnite if
and only if bothp(Γ) and Γ ∩ ker p are discrete and coﬁnite.


## Page 395

12.4. THE PRODUCT GEOMETRIES 387
Proof. If p(Γ) is discrete we get
(15) Vol
(
(H2 × R)/Γ
)
= Area(H2/p(Γ)) × Length
(
R/Γ∩ker p
)
.
This surprisingly simple formula is proved by picking a fundamental domain
D ⊂ H2 for p(Γ) and noticing that
Vol
(
(H2 × R)/Γ
)
= Vol
(
p−1(D)/Γ∩ker p
)
.
We deduce thatΓ is coﬁnite if and only if bothp(Γ) and Γ ∩ ker p are.
If p(Γ) is not discrete, we prove thatΓ cannot be coﬁnite. Up to
replacing Γ with an index-four subgroup we may suppose
Γ < Isom+(H2) × Isom+(R) = Isom +(H2) × R.
Pick a neighbourhood U ⊂ Isom+(H2) × R of e such that [U, U] ⊂ U
and U ∩ Γ = {e}. Let f , g ∈ Γ be two elements. We now prove that if
p(f ), p(g) ∈ p(U) then f and g commute. We note that the commutator
[f , g] depends only on the imagesp(f ) and p(g), and since they lie inp(U)
we may suppose thatf , g ∈ U and get[f , g] ∈ U ∩ Γ, which must be trivial.
The elements inp(Γ) ∩ p(U) commute. Two non-trivial elements in
Isom+(H2) commute if and only if they are both hyperbolic, parabolic, or
elliptic ﬁxing the same line, point in∂H2, or point inH2. Therefore all the
isometries in p(Γ) ∩ p(U) are of the same type and ﬁx the same line or
point.
Analogously, for everyf ∈ Γ we pick a neighbourhoodUf of e such
that [f , Uf ] ⊂ U and conclude that f commutes with all the elements in
Γ projecting to p(Uf ). (There are non-trivial such elements sincep(Γ) is
not discrete.) Thereforep(f ) also ﬁxes the same line or point as above.
Wehaveprovedthat p(Γ)ﬁxesaline, ahorocycle, orapointin H2 and
hence ﬁxes its inverse image inH2 × R which is a line or a Euclidean plane.
Moreover Γ acts freely and proper discontinuously on it: henceΓ = Z or
Z2 up to ﬁnite index and it is easy to deduce thatΓ is not coﬁnite. □
Corollary 12.4.5. If the interior of a compact orientable manifoldM
admits a ﬁnite-volume complete H2 × R geometry then M is a Seifert
manifold with χ < 0. If M is closed then alsoe = 0.
Proof. We haveint(M) = ( H2 × R)/Γ with Γ coﬁnite: by Proposition
12.4.4 the groupΓ ∩ ker p quotients every line{x} × R to a circle inM,
giving a Seifert ﬁbrationM → S onto the ﬁnite-area orbifoldS = H2/p(Γ).
We have χ(S) < 0, and either e(M) = 0 or ∂M ̸= ∅ because H2 × y
projects to a section forM → S. □
We now prove the converse of Corollary 12.4.5.
Proposition 12.4.6. If M is a Seifert manifold withχ < 0 and either
∂M ̸= ∅ or e = 0, the interior of M admits a ﬁnite-volume complete
H2 × S1 geometry.


## Page 396

388 12. THE EIGHT GEOMETRIES
Proof. By hypothesis there is a sectionΣ of M → S, which is the
ﬁbre of a bundleM → O over a 1-orbifoldO, see Section 11.4.4. The two
structures give two exact sequences
0 − →K − →π1(M)
f
− →π1(S) − →0,
0 − →π1(Σ) − →π1(M)
g
− →π1(O) − →0.
Since χ(S) < 0 we may write S = H2/Γ and identify π1(S) with Γ <
Isom(H2). Analogously we considerπ1(O) inside Isom(R). The map
(f , g) : π1(M) − →Isom(H2) × Isom(R)
is injective and its image is discrete and acts freely onH2 × R, inducing a
ﬁnite-volume H2 × R structure on M. □
12.5. Nil geometry
There are still three non-isotropic geometries to analyse. These ge-
ometries are not products, but they have a reasonable bundle structure, so
that many of the arguments of the previous section can be extended with
not much eﬀort.
We start with the geometryNil, which is aR-bundle over R2. This
geometry is fully carried by a Lie group called theHeisenberg group.
12.5.1. The Heisenberg group. The Heisenberg group consists of
all matrices 

1 x z
0 1 y
0 0 1


with x , y , z ∈ R, with the multiplication operation. This is a nilpotent (but
non-abelian) Lie group (see Exercise 1.4.4) and is hence also called Nil. It
is clearly diﬀeomorphic toR3. There is a Lie groups exact sequence
0 − →R − →Nil − →R2 − →0
where R = [Nil , Nil] is the centre ofNil and consists of all matrices with
x = y = 0. Therefore Nil is naturally a line bundle overR2. We identify Nil
with R3 using the coordinates(x , y , z). The product operation becomes
(x , y , z) · (x′, y′, z′) = ( x + x′, y + y′, z + z′ + x y′).
Exercise 12.5.1. The commutator of two elements is
[
(x , y , z), (x′, y′, z′)
]
= (0, 0, x y′ − x′y).
12.5.2. The geometry of Nil.Every left-invariant Riemannian struc-
ture on a Lie group G is constructed by ﬁxing a scalar product at the
tangent space Te G of e ∈ G and then extending it by left-multiplication.
Here e = (0 , 0, 0) and we giveTeNil = R3 the Euclidean scalar product.
This deﬁnes a left-invariant Riemannian structure onNil.


## Page 397

12.5. NIL GEOMETRY 389
x
y
z
Figure 12.4. The planes orthogonal to thez axis inNilform
the standard contact structure onR3.
Exercise 12.5.2. The metric tensor at(x , y , z) is


1 0 0
0 x 2 + 1 −x
0 −x 1

 .
The following triple is an orthonormal basis at(x , y , z):
(16) (1, 0, 0), (0, 1, x), (0, 0, 1).
The planes spanned by the ﬁrst two vectors form the standardcontact
structure in R3 shown in Figure 12.4. It is a non-integrable distribution of
planes: no surface is tangent to it at every point.
We remark that the metric tensor has unit determinant at every point:
therefore the volume form onNil is the standard one onR3.
We can calculate the Christoﬀel symbolsΓk
i j by hand or using a com-
puter code; these are all zero except the following:
Γ1
22 = −x , Γ1
23 = Γ1
32 = 1
2 ,
Γ2
12 = Γ2
21 = x
2 , Γ2
13 = Γ2
31 = − 1
2 ,
Γ3
12 = Γ3
21 = x 2 − 1
2 , Γ3
13 = Γ3
31 = − x
2 .
The Ricci tensor at(x , y , z) is
Ri j = 1
2 ·


−1 0 0
0 x 2 − 1 −x
0 −x 1

 .
When x = 0 the Ricci tensor is a diagonal matrix with entries− 1
2 , − 1
2 , 1
2.
For a unit vectorv ∈ TpNil, recall that Ri jv i v j equals twice the average
value of the sectional curvatures of the planes containingv: this average
value ranges here from− 1
4 to 1
4 and is maximal whenv = (0, 0, ±1). This
holds when x = 0 and hence at all pointsp ∈ Nil by left-multiplication.


## Page 398

390 12. THE EIGHT GEOMETRIES
12.5.3. The isometry group of Nil.The group Nil acts on itself iso-
metrically by left-multiplication. Left-multiplication by(a, b, c) preserves
the bundle Nil → R2 and induces onR2 a translation by the vector(a, b).
There are also more complicate isometries ofNil that preserve the
bundle structure but induce rotations onR2: one such isometry ϕ sends
(x , y , z) to
(
x cos θ − y sin θ, x sin θ + y cos θ, z + 1
2 (x 2 − y 2) sin θ cos θ − x y sin2 θ
)
.
This map preserves the bundle and induces a rotation onR2.
Proposition 12.5.3. The map ϕ is an isometry ofNil.
Proof. Set (x′, y′, z′) = ϕ(x , y , z). The diﬀerentiald ϕat (x , y , z) is


cos θ − sin θ 0
sin θ cos θ 0
x sin θ cos θ − y sin2 θ −y sin θ cos θ − x sin2 θ 1


and may be rewritten as


cos θ − sin θ 0
sin θ cos θ 0
x′ sin θ x ′ cos θ − x 1.


The diﬀerential d ϕsends the orthonormal basis (16) to
(cos θ, sin θ, x′ sin θ), (− sin θ, cos θ, x′ cos θ), (0, 0, 1).
These vectors at(x′, y′, z′) are also orthonormal. □
We deduce the following.
Proposition 12.5.4. Every isometry of Nil preserves the line bundle
and induces an isometry ofR2. We have
0 − →R − →Isom+(Nil)
p
− →Isom(R2) − →0
where R is the centre ofNil. The groupIsom+(Nil) has two components.
Proof. The rotational isometries ϕ with angle θ introduced above
forma S1-subgroupof Isom+(Nil). Thesubgroups S1 and Nilbelongtothe
component Isom+
◦ (Nil) < Isom+(Nil) containing the identity, which hence
has dimension at least1 + 3 = 4 and acts transitively onNil. Stabilisers
have dimension at least4 − 3 = 1 and cannot have bigger dimension by
Proposition 6.2.15, otherwiseNil would have constant sectional curvature:
therefore dim(Isom+
◦ (Nil)) = 4 and Isom+
◦ (Nil) is generated byS1 and Nil,
and it preserves the line bundle sinceS1 and Nil do.
The subgroup Isom+
◦ (Nil) preserves the orientation of the ﬁbres and
of R2. We leave as an exercise the existence of another component of
Isom+(Nil) which inverts the orientation of the ﬁbres and ofR2. □


## Page 399

12.5. NIL GEOMETRY 391
L
x
z
y
L
F
F
Figure 12.5. The Nil manifold M = Nil /Γ is obtained by
identifying the faces of this unit cube as follows: the trian-
gular faces are glued via the aﬃne maps as shown by the
labels, and the pairs of unlabelled opposite square faces are
identiﬁed by translations. The cube is a fundamental domain
for Γ.
Example 12.5.5. A manifoldM = Nil /Γ modelled on Nil is described
in Figure 12.5. The ﬁgure shows a fundamental domain for the group
Γ < Isom+(Nil) generated by the isometries
(x , y , z) ↦− →(x + 1, y , z + y),
(x , y , z) ↦− →(x , y + 1, z), (x , y , z) ↦− →(x , y , z+ 1).
obtained by left-multiplication with the canonical basis ofR3. Both the
unit cube and M have volume one. The manifold M is clearly a torus
bundle with monodromy
(1 1
0 1
)
and is hence diﬀeomorphic to the Seifert
manifold
(
T, (1, 1)
)
by Exercise 11.4.11.
A groupΓ < Isom(X) is cocompact if X/Γ is compact. We prove that
cocompact groups inIsom(R2) do not lift.
Proposition 12.5.6. Let Γ < Isom(R2) be discrete and cocompact.
There is no homomorphismf : Γ → Isom+(Nil) such that p ◦ f = id.
Proof. Up to taking a ﬁnite-index subgroup we may suppose that
Γ is generated by two translations along independent vectors(x , y) and
(x′, y′). We prove that two liftsϕ, ϕ′ ∈ Isom+(Nil) of these translations
never commute, thus forbidding the existence of a homomorphismf.
If ϕ, ϕ′ ∈ Nil, Exercise 12.5.1 gives[ϕ, ϕ′] = (0 , 0, x y′ − x′y) ̸= 0.
All the other lifts are of typegϕ, g′ϕ′ for some g, g′ ∈ R, hence we get
the same commutator. □
Let Isom+
0 (Nil) < Isom+(Nil) be the component containinge.
Exercise 12.5.7. We have
[
Isom+
0 (Nil), Isom+
0 (Nil)
]
= R.
Therefore Isom+
0 (Nil) is nilpotent.


## Page 400

392 12. THE EIGHT GEOMETRIES
Corollary 12.5.8. If a three-manifold M has a Nil geometry, then
π1(M) is virtually nilpotent.
Proof. It has a nilpotent subgroup of index at most two, because the
subgroup Isom+
0 (Nil) < Isom+(Nil) is nilpotent and has index two. □
12.5.4. Nil geometry. We classify the manifolds modelled onNil.
Proposition 12.5.9. A discrete groupΓ < Isom+(Nil) is coﬁnite if and
only if bothp(Γ) and Γ ∩ ker p are discrete and coﬁnite.
Proof. We follow the proof of Proposition 12.4.4. Up to taking ﬁnite-
index subgroups we may suppose thatΓ < Isom+
0 (Nil). If p(Γ) is discrete
the proof of Proposition 12.4.4 applies also here; note that the formula
(15) holds because the volume form inNil is the standard one onR3.
If p(Γ) is not discrete then that proof shows that there is a neigh-
bourhood U ⊂ Isom+(Nil) of e such that every two elements f , g ∈ Γ
projecting in p(U) commute. (It is still true that[f , g] depends only on
p(f ) and p(g) since ker p = R is central.) We deduce again that the
isometries in p(Γ) commute: hence they are either rotations ﬁxing the
same point or translations.
Intheformercase Γisnotcoﬁnite. Inthelatter, weget Γ < Nilacting
as left-multiplication. Every twof , g ∈ Γ projecting top(U) commute and
hence project to parallel translations by Exercise 12.5.1. As in the proof
of Proposition 12.4.4 we deduce thatp(Γ) preserves a line, and hence it
is not coﬁnite. □
Corollary 12.5.10. If the interior of a compact orientable manifoldM
admits a ﬁnite-volume completeNil geometry then M is a closed Seifert
manifold with χ = 0 and e ̸= 0.
Proof. Wehave int(M) = Nil /Γ with ΓcoﬁniteandProposition12.5.9
provides a Seifert ﬁbrationM → S over a ﬁnite-area orbifoldS = R2/p(Γ).
Finite-area ﬂat orbifolds haveχ(S) = 0 and are closed (there are no cusps
in ﬂat geometry), henceM is closed.
We havee ̸= 0, otherwise up to ﬁnite-index we would getM = T ×S1
contradicting Proposition 12.5.6. □
We prove the converse.
Proposition 12.5.11. If M is a closed Seifert manifold withχ = 0 and
e ̸= 0, then M admits a Nil geometry.
Proof. We have
M =
(
S, (p1, q1), . . . ,(pk , qk)
)
.


## Page 401

12.5. NIL GEOMETRY 393
Suppose S is a closed orientable surface of genusg ⩾ 0. In the following
π1(S) is the orbifold fundamental group. We have:
π1(S) = ⟨a1, b1, . . . , ag, bg, c1, . . . , ck | [a1, b1] · · ·[ag, bg]c1 · · · ck , cpi
i ⟩,
π1(M) = ⟨a1, b1, . . . , ag, bg, c1, . . . , ck , l | [a1, b1] · · ·[ag, bg]c1 · · · ck , cpi
i l qi ,
[ai , l], [bi , l]⟩.
We ﬁx any ﬂat structure on the orbifoldS and get an injectionπ1(S) →
Isom+(R2). We now want to lift this map to an injection π1(M) →
Isom+(Nil), so that the resulting diagram commutes:
π1(M) →→
↓↓
Isom+(Nil)
↓↓
π1(S) →→ Isom+(R2)
Recall that Isom+
0 (Nil) contains the group R of vertical translations: we
use the multiplicative notation and indicate it asR>0. We note thatR>0
is central inIsom+
0 (Nil) because it commutes withNil and the isometries
ϕ from Proposition 12.5.3, which altogether generateIsom+
0 (Nil).
We identify π1(S) with its image in Isom+(R2). We lift arbitrarily
ai , bi , ci inside Isom+(Nil) and pick l ∈ R>0. We get
[a1, b1] · · ·[ag, bg]c1 · · · ck = eµ,
c pi
i l qi = eλi
for some µ, λi ∈ R. To get a homomorphism π1(M) → Isom+(Nil) we
need µ = λi = 0. To obtain that we change the lifts asc′
i = eti ci, l′ = eul
to get
[a1, b1] · · ·[ag, bg]c′
1 · · · c′
k = et1+...+tk +µ,
(c′
i )pi (l′)qi = eti pi +uqi +λi .
We want
t1 + . . . + tk = −µ,
ti pi + uqi = −λi .
The determinant of the(k + 1) × (k + 1) coeﬃcient matrix was already
calculated in the proof of Proposition 10.3.15, and is
±
∑ qi
pi
(p1 · · · pk) = ±e · p1 · · · pk ̸= 0.
Therefore the linear system has a unique solution(t1, . . . , tk , u). The liftl′
is necessarily non-trivial, otherwise we would get a liftπ1(S) → Isom+(Nil)
that is excluded by Proposition 12.5.6. Therefore the lift is injective.
If S is non-orientable the proof is similar and left as an exercise.□


## Page 402

394 12. THE EIGHT GEOMETRIES
12.6. ˜SL2 geometry
The ˜SL2 geometry is similar toNil, but it is now aR-bundle over H2.
The geometry is again fully carried by the Lie group˜SL2, which is the
universal cover of bothSL2(R) and PSL2(R). It is convenient to identify
PSL2(R) with the unit tangent bundle ofH2.
12.6.1. The unit tangent bundle.The tangent bundleT M of a Rie-
mannian n-manifold M has a natural Riemannian structure, which we
brieﬂy introduce.
The tangent space at any pointx ∈ T M splits into avertical sub-
space Vx = ker d px where p : T M → M is the projection, and ahorizontal
subspace Hx determined by the metric tensor onM as follows: use the
parallel transport to move the tangent vectorx along all geodesics exiting
from p(x); the result is a smalln-surface in T M containing x and we set
Hx to be its tangent space atx.
To deﬁne a metric onT M we impose thatVx and Hx be orthogonal
and we give to each space the metric ofTx M, via the natural identiﬁcation
Vx = Tx M and via the isomorphismd px : Hx → Tx M.
The unit tangent bundle UM ⊂ T M consists of all unitary tangent
vectors and inherits a Riemannian structure. Every isometryf : M → M
induces an isometrydf : UM → UM.
12.6.2. The space UH2. We now focus on the caseM = H2 we are
interested in. Parallel transport was deﬁned explicitly in Section 2.4.4. We
represent H2 using the upper half-plane modelH2 = {ℑz > 0}, so that
T H2 = H2 × C and UH 2 = H2 × S1 has coordinates (z , θ). The tangent
space T(z ,θ)UH 2 is naturally identiﬁed withC × R = R3.
Lemma 12.6.1. The metric tensor ofUH 2 at (z , θ) is


2y−2 0 y−1
0 y−2 0
y−1 0 1


where z = x + i y.
Proof. We ﬁrst consider the disc modelD2 of H2 with T D2 = D2 × C
and T(z ,v)T D2 = C × C. We focus at a point(0, v) and determine the
decomposition
T(0,v) = H(0,v) ⊕ V(0,v).
We have V(0,v) = 0 × C and we now determine H(0,v). Every geodesic
through 0 is a Euclidean line l and the parallel transport of v ∈ T0D2
along l forms a constant angle withl: the parallel transport ofv at z ∈ l
is just the rescaled vector(1 − |z|2)v. Parallel transports ofv along lines
passingthrough 0formasurface, whichisthegraphofthefunction f (z) =
(1 − |z|2)v, whose tangent plane at0 is H(0,v) = C × 0 since ∂f
∂x = ∂f
∂y = 0
at 0.


## Page 403

12.6. ˜SL2 GEOMETRY 395
We have discovered that the horizontal and vertical planes at(0, v)
are just the coordinate ones ofT(0,v) = C × C. By deﬁnition these are
orthogonal and inherit a metric tensor from that ofT0D2, which is4 times
the Euclidean one. Therefore the metric tensor atT(0,v) = C2 is 4 times
the Euclidean one.
We now turn to the unitary sub-bundleUD 2 = D2 × S1. We use the
natural identiﬁcations T(0,θ)UD 2 = C × R = R3 and we deduce that the
vectors (1, 0, 0), (0, 1, 0), (0, 0, 1) ∈ T(0,θ) are orthogonal and have norm
2, 2, 1 respectively.
The Möbius transformation
f (z) = z − i
i z − 1
is an isometry between the two modelsD2 and H2 that sends 0 to i. It is
holomorphic and its complex derivative is
f′(z) = −2
(i z − 1)2 .
The isometry f : D2 → H2 induces an isometryf∗ : UD 2 → UH 2, that is
f∗ : D2 × S1 → H2 × S1, which is as follows:
f∗(z , θ) =
( z − i
i z − 1 , θ + arg(f′(z))
)
=
( z − i
i z − 1 , θ + π − 2arg(i z − 1)
)
=
( z − i
i z − 1 , θ + π − 2ℑ log(i z − 1)
)
.
In particularf∗(0, θ) = ( i , θ+ π). Recall that the Jacobians of a holomor-
phic g and of log g are
Jg =
(ℜg′ −ℑg′
ℑg′ ℜg′
)
, J (log g) =
(
ℜ g′
g −ℑ g′
g
ℑ g′
g ℜ g′
g
)
.
The diﬀerential off∗ at the point(z , θ) is hence
(df∗)(z ,θ) =


ℜ −2
(i z−1)2 −ℑ −2
(i z−1)2 0
ℑ −2
(i z−1)2 ℜ −2
(i z−1)2 0
−2ℑ 1
z+i −2ℜ 1
z+i 1

 .
In particular atz = 0 we get
(df∗)(0,θ) =


−2 0 0
0 −2 0
2 0 1

 .
Sincethisisanisometry, thethreeimagevectors (−2, 0, 2), (0, −2, 0), and
(0, 0, 1) are orthogonal with norm2, 2, 1, hence (1, 0, −1), (0, 1, 0), and


## Page 404

396 12. THE EIGHT GEOMETRIES
(0, 0, 1) form an orthonormal basis atT(i ,θ+π)UH 2 and the metric tensor
there is 

2 0 1
0 1 0
1 0 1

 .
The tensor is independent ofθ. To ﬁnd its value at(z , θ) for a generic
z ∈ H2 it suﬃces to transport it via an isometry that sendsi to z. Every
such isometry is a composition of a horizontal translation (which does not
change the tensor) and a dilationg(z) = λz with λ > 0. We haveg′(z) =
λ and g∗(z , θ) = ( λz , θ), therefored g∗ sends the above orthonormal basis
at T(i ,θ) to the basis(λ, 0, −1), (0, λ, 0), (0, 0, 1). The metric tensor at
(λi , θ) is hence 

2λ−2 0 λ−1
0 λ−2 0
λ−1 0 1

 .
The proof is complete. □
At a point(x , y , θ) ∈ UH 2, an orthonormal basis is
(17) (y ,0, −1), (0, y ,0), (0, 0, 1).
The planes orthogonal to(0, 0, 1) form a contact structure similar to the
one drawn in Figure 12.4.
We remark that the metric tensor at(x , y , θ) has determinant y−4,
like in the product metricH2 × S1: therefore the volume form inUH 2 is
the same as in the product metric (although the metric tensor is not).
The non-zero Christoﬀel symbols at(x , y , θ) are:
Γ1
12 = Γ1
21 = − 3
2y , Γ1
23 = Γ1
32 = − 1
2 ,
Γ2
11 = 2
y , Γ2
13 = Γ2
31 = 1
2 , Γ2
22 = − 1
y ,
Γ3
12 = Γ3
21 = 1
y 2 , Γ3
23 = Γ3
32 = 1
2y .
The Ricci tensor is
Ri j = 1
2 ·


−2y−2 0 y−1
0 −3y−2 0
y−1 0 1

 .
When y = 1 we can represent the Ricci tensor in the orthonormal basis
(17) and get a diagonal matrix with values − 3
2, − 3
2, 1
2. For a vector
v ∈ T(z ,θ)UH2, recall thatRi jvi vj is twice the average value of the sectional
curvatures of the planes containingv: this average value ranges from− 3
4
to 1
4 and is maximal whenv = (0 , 0, ±1). This holds when y = 1 and
hence for anyz ∈ UH2 by acting via isometries ofH2.


## Page 405

12.6. ˜SL2 GEOMETRY 397
12.6.3. ˜SL2 geometry. Let ˜SL2 be the universal cover of SL2 =
SL2(R). As a universal cover of a Lie group, it is also a Lie group. We
have coverings
˜SL2 − →SL2 − →PSL2(R) = Isom +(H2).
The group PSL2(R) acts freely and transitively onUH2 and hence we can
identify PSL2(R) with UH2. With this identiﬁcation PSL2(R) inherits a
left-invariant Riemannian metric that lifts to a left-invariant Riemannian
metric on the Lie group˜SL2.
In the previous section we have identiﬁedUH2 with H2 × S1 and we
can likewise identify ˜SL2 with H2 × R, and get an explicit metric tensor
from Lemma 12.6.1.
Since UH2 is a circle bundle overH2, likewise˜SL2 is a line bundle over
H2. The groupR acts isometrically on˜SL2 by translating every ﬁbre.
Proposition 12.6.2. Every isometry of ˜SL2 preserves the line bundle
and induces an isometry ofH2. We have
0 − →R − →Isom+(˜SL2)
p
− →Isom(H2) − →0.
The group Isom+(˜SL2) has two components.
Proof. The groups R and ˜SL2 belong to the componentIsom+
◦ (˜SL2)
containing e which has dimension at least1 + 3 = 4. We conclude as in
the proof of Proposition 12.5.4. □
Exercise 12.6.3. The unit tangent bundle of a ﬁnite-area complete
hyperbolic surface is naturally a manifold modelled on˜SL2.
As forNil, cocompact groups do no lift.
Proposition 12.6.4. Let Γ < Isom(H2) be discrete and cocompact.
There is no homomorphismf : Γ → Isom+(˜SL2) such that p ◦ f = id.
Proof. Up to taking a ﬁnite index subgroup we may suppose that
Γ acts freely and hence S = H2/Γ is a closed hyperbolic surface. If Γ
lifts, consider the groupG < Isom+(˜SL2) generated by f (Γ) and 2π ∈ R,
isomorphic to Γ × Z. The quotient ˜SL2/G is naturally the unit tangent
bundle of S and is hence the Seifert manifold
(
S, (1, χ(S))
)
by Remark
10.2.8. Its fundamental group is however not a productΓ × Z by Exercise
10.2.9. □
Proposition 12.6.5. A discrete group Γ < Isom+(˜SL2) is coﬁnite if
and only if bothp(Γ) and Γ ∩ ker p are discrete and coﬁnite.
Proof. Same proof as Proposition 12.4.4, with a minor variation: if
p(Γ) is not discrete, up to taking an index-two subgroup we suppose that
p(Γ) < Isom+(H2); theR-action commutes withΓ and [f , g] depends only
on p(f ) and p(g), so that proof applies. □


## Page 406

398 12. THE EIGHT GEOMETRIES
We now classify the manifolds having a˜SL2 geometry.
Corollary 12.6.6. If the interior of a compact orientable manifoldM
admitsaﬁnite-volumecomplete ˜SL2 geometrythen M isaSeifertmanifold
with χ < 0. If M is closed thene ̸= 0.
Proof. We have int(M) = ˜SL2/Γ with Γ coﬁnite. Proposition 12.6.5
furnishes a Seifert ﬁbration M → S over the ﬁnite-area orbifold S =
H2/p(Γ). If M is closed we gete ̸= 0: if not, up to taking a ﬁnite index
subgroup we would getM = S × S1 contradicting Proposition 12.6.4. □
We now prove the converse.
Proposition 12.6.7. If M is a Seifert manifold withχ < 0 and either
∂M ̸= ∅ or e ̸= 0, the interior ofM admits a ﬁnite-volume˜SL2 geometry.
Proof. If M is closed we apply the proof of Proposition 12.5.11. If
∂M ̸= ∅ the presentations of π1(S) and π1(M) are as described there,
except that they do not contain the relatorc pi
i whenever ci represents a
boundary component ofM. So we have less constraints and we easily see
that a solution to the ﬁnal linear problem exists also in this case. □
12.7. Sol geometry
The Sol geometry is the least symmetric one among the eight. It has
a bundle structure, but with a one-dimensional basis: it is aR2-bundle over
R. Again, the geometry is fully governed by a Lie groupSol.
12.7.1. TheLiegroupSol. TheLiegroup Solisthespace R3 equipped
with the following operation
(x , y , z) · (x′, y′, z′) = ( x + e−z x′, y + ez y′, z + z′).
Exercise 12.7.1. We have
(x , y , z)−1 = (−x ez , −y e−z , −z),
[(x , y , z), (x′, y′, z′)] =
(
x(1−e−z′
)−x′(1−e−z ), y(1−ez′
)−y′(1−ez ),0
)
,
[(x , y , z), (x′, y′, 0)] =
(
− x′(1 − e−z ), −y′(1 − ez ), 0
)
.
The subgroup R2 consisting of all elements(x , y ,0) is normal inSol
and by settingp(x , y , z) = z we get an exact sequence
0 − →R2 − →Sol
p
− →R − →0.
Therefore Sol is a plane bundle overR. Exercise 12.7.1 implies the follow-
ing.
Exercise 12.7.2. We have [Sol, Sol] = R2 and hence Sol is solvable.
However [Sol, R2] = R2 and hence Sol is not nilpotent.


## Page 407

12.7. SOL GEOMETRY 399
We deﬁne a Riemannian metric onSol by assigning the scalar product


e2z 0 0
0 e−2z 0
0 0 1


to the point(x , y , z). The metric is left-invariant and every planez = k
is isometric to the EuclideanR2. This is the geometry with the smallest
amount of symmetries.
We remark that the metric tensor has unit determinant at every point:
therefore the volume form onSol is the standard one onR3.
The non-zero Christoﬀel symbols at(x , y , z) are
Γ1
13 = Γ1
31 = 1,
Γ2
23 = Γ2
32 = −1,
Γ3
11 = −e2z , Γ3
22 = e−2z .
The Ricci tensor is 

0 0 0
0 0 0
0 0 −2

 .
The average value of the sectional curvatures of the planes containing
v ∈ T(x ,y ,z)Sol ranges from −1 to 0, and is minimal whenv = (0, 0, ±1).
12.7.2. Sol geometry. We start with a simple exercise.
Exercise 12.7.3. The eight maps
(x , y , z) ↦→ (±x ,±y , z), (x , y , z) ↦→ (±y ,±x ,−z)
are isometries and form the dihedral groupD8. The orientation-preserving
ones form the subgroupD4 = Z2 × Z2.
Let Isom∗(R2) < Isom(R2) be the subgroup consisting of all maps
v ↦→ ±v + b. It has two components, one being the translationsR2.
Proposition 12.7.4. Every isometry ofSol preserves the plane bundle
and induces an isometry ofR. We have
0 − →Isom∗(R2) − →Isom+(Sol)
p
− →Isom(R) − →0.
The groupIsom+(Sol) has four components, one of which isSol acting by
left-multiplication.
Proof. The group Sol acts transitively and freely onSol itself, and
to conclude it suﬃces to check that the stabiliser of the origin0 is the
dihedral D4 described in Exercise 12.7.3.
The Ricci tensor tells us that an isometry ﬁxing a point also ﬁxes the
vertical axis and the horizontal plane. Therefore the vertical unitary con-
stant vector ﬁeldX = (0, 0, 1) is preserved up to sign by any isometry of
Sol. The covariant diﬀerentiationv ↦→ ∇ v X deﬁnes an endomorphism of


## Page 408

400 12. THE EIGHT GEOMETRIES
TpSol for all p ∈ Sol. We have∇ei X = Γ k
i3ek and therefore the endomor-
phism is 

1 0 0
0 −1 0
0 0 0

 .
The three coordinate axis are precisely the eigenvectors of the endomor-
phism, and being intrinsically deﬁned they are preserved by every isometry.
Therefore the orientation-preserving stabiliser of a point isD4. □
Proposition 12.7.5.A discrete groupΓ < Isom+(Sol) is coﬁnite if and
only if bothp(Γ) and Γ ∩ ker p are discrete and coﬁnite.
Proof. If p(Γ) is discrete we get
Vol
(
Sol/Γ
)
= Length(R/p(Γ)) × Area
(
R2/Γ∩ker p
)
.
This formula is proved as above by taking a fundamental domain forp(Γ).
We now prove thatp(Γ) is in fact discrete (sinceΓ is).
Up to taking an index-four subgroup we suppose thatΓ < Sol. If
γ ∈ Sol does not lie inR2, then it ﬁxes a vertical line. To prove that, note
that γ = (x , y , z) acts on R3 as an aﬃne transformation, which permutes
the vertical lines and acts onR2 as (x′, y′) ↦→ (x + e−z x′, y + ez y′). If
z ̸= 0 this map has a ﬁxed point (because1 is not an eigenvalue of its
linearisation).
If Γ is abelian, either it is contained inR2 or it ﬁxes a vertical line: in
both cases we get a discretep(Γ). If Γ is non-abelian, then[Γ, Γ] < R2 is
non-trivial soΓ contains a non-trivial elementγ ∈ R2 and anotherη ̸∈ R2.
Theelements γ and ηγη−1 arebothin R2 andindependent,hence R2/Γ∩ker p
is compact. This implies easily thatp(Γ) is discrete (sinceΓ is). □
We now classify the manifolds modelled onSol. Recall that every
semi-bundle is doubly covered by a canonical bundle. A torus bundle isof
Anosov typeif its monodromy is Anosov. A torus semi-bundle is of Anosov
type if its double-covering is.
Proposition 12.7.6. The interior of a compact orientable manifoldM
admits a ﬁnite-volume completeSol geometry if and only if it is a torus
(semi-)bundle of Anosov type.
Proof. If int(M) = Sol /Γ has ﬁnite volume, then bothΓ ∩ ker p and
p(Γ)arediscreteandcoﬁnite. Thehorizontalfoliationof SolintoEuclidean
planes z = k is preserved byΓ and projected to a surface bundle over the
1-orbifold R/p(Γ), which is eitherS1 or an interval. The ﬁbres are ﬂat and
have ﬁnite area, hence they are tori or Klein bottles.
If p(Γ) acts by translations, thenM is a torus bundle with an Anosov
monodromy ±
(e−z 0
0 ez
)
for somez > 0. If M is a semi-bundle, this holds on
its double-covering.


## Page 409

12.8. SUMMARY 401
Conversely, let MA be a torus bundle with Anosov monodromyA ∈
SL2(Z). We haveMA = R3/Γ where Γ is generated by the aﬃne maps
(x , y , z) ↦→ (x +1 , y , z), (x , y , z) ↦→ (x , y+1 , z), (¯x , z) ↦→ (A¯x , z+ h)
where ¯x = (x , y) and h > 0 is any positive number. A linear isomorphism
ψ of R2 conjugates A into a diagonal matrix±
(e−a 0
0 ea
)
for somea > 0 and
transforms the generators into
(¯x , z) ↦→ (¯x + ¯v , z), (¯x , z) ↦→ (¯x + ¯w , z), (x , y , z) ↦→ (±e−ax ,±eay , z+ h)
where ¯v = ψ(1, 0) and ¯w = ψ(0, 1). If trA > 0 and h = a these maps are
left-multiplications by the following elements ofSol:
(¯v ,0), ( ¯w ,0), (¯0, a)
where ¯0 = (0 , 0), and we are done. If trA < 0 we compose the third
generator with the isometry(x , y , z) ↦→ (−x ,−y , z).
If M is a semi-bundle double-covered byMA, we represent it asR3/Γ′
where Γ′ is generated by the groupΓ representing MA plus the element
(x , y , z) ↦→
(
x + 1
2 , −y ,−z
)
which will be transformed viaψ into an isometry ofSol. □
Corollary 12.7.7. If a closed three-manifold M has a Sol geometry,
then π1(M) is virtually solvable but not virtually nilpotent.
Proof. Itisvirtuallysolvablebecause Solhasﬁniteindexin Isom+(Sol).
The proof of Proposition 12.7.6 shows that up to ﬁnite indexM = Sol/Γ
and Γ is generated by
(¯v ,0), ( ¯w ,0), (¯0, a).
Exercise 12.7.1 implies that[(¯0, a), (¯v ,0)] = (¯v′, 0) for some ¯v′ ̸= 0 and
hence Γ is not nilpotent. This holds for anyΓ of this kind, and therefore
Γ is not virtually nilpotent, either. □
12.8. Summary
We have proudly completed the proof of Theorem 12.1.1. We state
that theorem again here:
Theorem12.8.1. Aclosedorentable3-manifoldhasageometricstruc-
ture modelled on one of the following six geometries:
S3, R3, S 2 × R, H2 × R, Nil, ˜SL2
if and only if it is a Seifert manifold of the appropriate commensurability
class, as prescribed by Table 12.1. It has aSol geometric structure if and
only if it is a torus (semi-)bundle of Anosov type.
We can deduce that the eight geometries are mutually exclusive:


## Page 410

402 12. THE EIGHT GEOMETRIES
Proposition 12.8.2. Two closed 3-manifolds admitting diﬀerent ge-
ometries are not diﬀeomorphic, and not even commensurable.
Proof. We already know that the six Seifert geometries form six dis-
tinct commensurability classes. A manifold of typeSol is not Seifert by
Proposition 11.4.14. A closed hyperbolic manifold is neither Seifert nor
Sol because its fundamental group is inﬁnite and does not contain an inﬁ-
nite normal abelian subgroup by Corollary 5.1.10 (as opposite to the other
geometries, see Proposition 10.4.3).
Two manifolds having diﬀerent geometries cannot be commensurable,
since a common ﬁnite cover would inherit both geometries. □
In fact one can tell the geometry of the manifold directly from its
fundamental group.
Proposition 12.8.3.Let M be a closed manifold modelled on oneX of
the eight geometries; this ﬂowchart shows how to determineX from the
fundamental group π1(M):
• if π1(M) is ﬁnite, thenX = S3; otherwise
• if π1(M) is virtually cyclic, thenX = S2 × R; otherwise
• if π1(M) is virtually abelian, thenX = R3; otherwise
• if π1(M) is virtually nilpotent, thenX = Nil; otherwise
• if π1(M) is virtually solvable, thenX = Sol; otherwise
• if π1(M) contains a normal cyclic groupK, then:
– if a ﬁnite-index subgroup of the quotient lifts,X = H2 × R,
– otherwise X = ˜SL2;
• otherwise X = H3.
Proof. The virtually abelian cases were settled in Section 10.3.10.
The Nil and Sol geometries were considered by Corollaries 12.5.8 and
12.7.7.
If X = H2 × R or ˜SL2 then π1(M) surjects onto π1(S) for some
closed hyperbolic surfaceS. This implies that π1(M) is not solvable, for
otherwise (by Propositions 1.4.3 and 1.4.10) the groupπ1(S) would also
be, and hence it would contain a normal cyclic subgroup, contradicting
Corollary 5.1.10.
If X = ˜SL2 then π1(S) = π1(M)/K and no ﬁnite-index subgroup of
π1(S) can lift toπ1(M) by Proposition 12.6.4.
Finally, if X = H3 then π1(M) contains no normal cyclic groupK by
Corollary 5.1.10 again. □
The boundary case is slightly diﬀerent. Of the eight geometries, only
three produce non-compact ﬁnite-volume complete orientable manifolds:
H3, H2 × R, ˜SL2.
These non-compact ﬁnite-volume manifolds are diﬀeomorphic to the inte-
rior of a compact manifoldM with boundary consisting of tori.


## Page 411

12.9. THE GEOMETRISATION CONJECTURE 403
Theorem 12.8.4. Let M be a compact orientable 3-manifold with
boundary consisting of tori. The following are equivalent:
• M has a ﬁnite-volume completeH2 × R structure,
• M has a ﬁnite-volume complete˜SL2 structure,
• M is Seifert withχ < 0.
In contrast with the closed case, a non-closedM may admit two dif-
ferent geometric structures of Seifert type. On the other hand, a manifold
M cannot admit both a hyperbolic and a Seifert structure.
12.9. The geometrisation conjecture
We can ﬁnally state the famous Geometrisation Conjecture, proposed
by Thurston in 1982 and proved twenty years later by Perelman in 2002.
12.9.1. Statement and main consequences.We say that a compact
3-manifold with (possibly empty) boundary consisting of tori isgeometric
if its interior has a ﬁnite-volume complete geometric structure modelled
on one of the eight geometries:
S3, R3, H3, S 2 × R, H2 × R, Nil, Sol, ˜SL2.
The following conjecture was formulated by Thurston in 1982:
Conjecture 12.9.1 (Geometrisation Conjecture). Let M be an irre-
ducible orientable compact 3-manifold with (possibly empty) boundary
consisting of tori. Every block of the geometric decomposition ofM is
geometric.
The conjecture has been proved by Perelman in 2002 and its proof
goes very very far from the scope of this book. It is however quite easy to
deduce important consequences from it.
Conjecture 12.9.2 (Poincaré conjecture). Every closed simply con-
nected three-manifold M is diﬀeomorphic toS3.
Proof using geometrisation. Via the prime decomposition we may re-
strict to the caseM is prime, hence irreducible. The groupπ1(M) is trivial
and hence does not containZ × Z: every torus in M is thus compress-
ible and the geometric decomposition is trivial. By geometrisationM is
itself geometric. The only geometry with ﬁnite fundamental groups isS3,
and hence M = S3/Γ is elliptic. Since M is simply connected, the group
Γ = π1(M) is trivial and henceM = S3. □
Conjecture 12.9.3 (Elliptisation).Every closed 3-manifoldM with ﬁ-
nite π1(M) is elliptic.
Proof using geometrisation. Same proof as above. Note that this is
not aconsequenceofPoincaréconjectureingeneral,foramanifoldcovered
by Sn needs not to be elliptic a priori. □


## Page 412

404 12. THE EIGHT GEOMETRIES
Conjecture12.9.4(Hyperbolisation). Everyclosedirreducible3-manifold
M with inﬁnite π1(M) not containing Z × Z is hyperbolic.
Proof using geometrisation. Sinceπ1(M) does not containZ × Z ev-
ery torus is compressible and the geometric decomposition ofM is trivial.
By geometrisation M is geometric. Its geometry is notS3 since π1(M) is
inﬁnite, and is notS2 × R since M is irreducible. In the other Seifert ge-
ometries and inSol the fundamental groupπ1(M) always contain aZ × Z
(there is always a ﬁnite covering containing an incompressible torus).□
Corollary 12.9.5.Let ˜M → M be a ﬁnite covering. If˜M is geometric,
then M also is (with the same geometry).
Proof using geometrisation. Note that this is stronger than Conjec-
ture 12.9.3. Since ˜M is geometric, it is irreducible and hence alsoM is.
Proposition11.5.7impliesthatthegeometricdecompositionof M istrivial,
and by geometrisationM is geometric. □
Concerningboundedmanifolds,wegetthefollowingsimplestatement.
Corollary 12.9.6. Every simple compact manifold M bounded by a
non-empty collection of tori is hyperbolic.
Proof using geometrisation. Being simple, it is geometric. Seifert
manifolds with boundary are never simple. □
That statement is not true for closed manifolds, because many Seifert
manifolds ﬁbering overS2 with at most 3 singular ﬁbres are simple.
12.9.2. Surface bundles. There is a nice way to formulate geometri-
sation for surface bundles. We start with the much simpler torus case.
Proposition 12.9.7. Let MA be a torus bundle with monodromyA ̸=
±I. The following holds:
• if |trA| < 2, i.e. A has ﬁnite order, thenMA is ﬂat;
• if |trA| = 2, i.e. A is reducible, thenMA is Nil;
• if |trA| > 2, i.e. A is Anosov, thenMA is Sol.
Proof. Use Proposition 11.4.14. □
We now turn to the generic case. LetΣ be a closed orientable surface
with χ(Σ) < 0.
Theorem 12.9.8. Let Mψ be a surface bundle with ﬁbreΣ and mon-
odromy ψ ∈ MCG(Σ). The following holds:
• if ψ has ﬁnite order, thenMψ has a H2 × R geometry,
• if ψ is reducible, thenMψ contains an essential torus,
• if ψ is pseudo-Anosov, thenMψ is hyperbolic.
Proof using geometrisation. Use Proposition 11.4.15. □


## Page 413

12.9. THE GEOMETRISATION CONJECTURE 405
Theorem 12.9.8 was initially proved by Thurston in the 1980s. In
the same years Thurston also proved the geometrisation conjecture for
all Haken 3-manifolds. Before Perelman’s proof the conjecture was open
“only” in the non-Haken case, and it naturally split in three parts: the
Conjectures 12.9.2, 12.9.3, and 12.9.4. Perelman’s proof certiﬁes ge-
ometrisation in all cases with a uniﬁed technique.
12.9.3. References. This chapter contains many technical proofs.
Most of them were taken from Scott [52], that is the standard refer-
ence on the geometrisation of Seifert manifolds, and Thurson’s book [57].
We have also consulted a nice survey of Bonahon [8], that contains in par-
ticular the suggestion of calculating the Ricci tensors in the non-product
geometries. Thurson’s geometrisation conjecture appears in [58] in 1982,
while Perelman’s proof consists of three papers that he sent to the arXiv
in 2003 [45, 46, 47].


## Page 414

[No extractable text on this page]


## Page 415

CHAPTER 13
Mostow rigidity theorem
We have deﬁned in Chapter 7 the Teichmüller spaceTeich(Sg) of
a genus-g closed orientable surfaceSg as the space of all the hyperbolic
metrics onSg, considered up to isometries isotopic to the identity; we have
then proved thatTeich(Sg) is homeomorphic toR6g−6 using the Fenchel–
Nielsen coordinates.
This deﬁnition ofTeich(M) actually applies to any closed hyperbolic
manifold M, andweshow herea strikingdiﬀerence betweenthedimensions
two and three: ifdim M = 3 then Teich(M) is a single point. This strong
result is known as theMostow rigidity Theorem.
The impact of Mostow’s rigidity on our knowledge of 3-dimensional
topology cannot be overestimated. Thanks to this theorem every geo-
metric information on a given closed hyperbolic three-manifoldM like its
volume, geodesic spectrum, etc. is promoted to atopological invariant
of M, that is it depends on the diﬀerentiable structure ofM only. In its
strongest version, Mostow’s rigidity says that the hyperbolic metric ofM
is fully determined by the groupπ1(M) alone.
We expose here Gromov’s proof of Mostow’s rigidity, which uses hy-
perbolic tetrahedra and introduces a nice invariant on closed manifolds of
any dimension, called thesimplicial volume.
13.1. Volume of tetrahedra
Thevolumeofanidealhyperbolictetrahedronisasimple(butintegral)
formula that involves theLobachevsky function: we now prove this formula
here. As a consequence we show that the regular ideal tetrahedron is the
hyperbolic tetrahedron with maximal volume.
13.1.1. The Lobachevsky function.The Lobachevsky functionis
Λ(θ) = −
∫ θ
0
log |2 sin t|d t.
The function log |2 sin t| is −∞ on πZ but is integrable, henceΛ is well-
deﬁned and continuous onR. Its ﬁrst derivatives are
Λ′(θ) = − log |2 sin θ|, Λ′′(θ) = − cot θ.
The functionΛ has derivative+∞ on πZ and is an odd function, because
its derivative is even.
407


## Page 416

408 13. MOSTOW RIGIDITY THEOREM
Proposition 13.1.1. The function Λ is π-periodic. We have Λ(0) =
Λ
(π
2
)
= Λ( π) = 0 . The function Λ is strictly positive on
(
0, π
2
)
, strictly
negative on
(π
2 , π
)
, and has absolute maximum and minimum atπ
6 and
5
6 π. For allm ∈ N the following holds:
Λ(mθ) = m
m−1∑
k=0
Λ
(
θ + kπ
m
)
.
Proof. We prove the equality form = 2:
Λ(2θ)
2 = − 1
2
∫ 2θ
0
log |2 sin t|d t = −
∫ θ
0
log |2 sin 2t|d t
= −
∫ θ
0
log |2 sin t|d t −
∫ θ
0
log
⏐⏐⏐2 sin
(
t + π
2
)⏐⏐⏐ d t
= Λ(θ) −
∫ π
2 +θ
π
2
log |2 sin t|d t
= Λ(θ) + Λ
(
θ + π
2
)
− Λ
(π
2
)
.
By setting θ = π
2 we get Λ(π) = 0. Since the derivativeΛ′ is π-periodic
and Λ(π) = 0, alsoΛ is π-periodic. Since Λ is π-periodic and odd, we have
Λ
(π
2
)
= 0. We have also proved the formula form = 2.
To prove the formula for genericm we use a generalisation of the
duplication formula for the sinus. From the equality
z m − 1 =
m−1∏
k=0
(
z − e− 2πi k
m
)
we deduce
2 sin(mt) =
m−1∏
k=0
2 sin
(
t + kπ
m
)
and hence
Λ(mθ)
m = − 1
m
∫ mθ
0
log |2 sin t|d t = −
∫ θ
0
log |2 sin(mt)|d t
= −
m−1∑
k=0
∫ θ
0
log
⏐⏐⏐⏐2 sin
(
t + kπ
m
)⏐⏐⏐⏐ d t
= −
m−1∑
k=0
(∫ θ+ kπ
m
0
log |2 sin t|d t −
∫ kπ
m
0
log |2 sin t|d t
)
=
m−1∑
k=0
Λ
(
θ + kπ
m
)
+ C(m)


## Page 417

13.1. VOLUME OF TETRAHEDRA 409
Figure 13.1. Every pair of opposite edges in an ideal tetra-
hedron has an axis orthogonal to both which is a symmetry
axis for the tetrahedron.
where C(m) is a constant independent ofθ. By integrating both sides we
get
1
m
∫ π
0
Λ(mθ) =
m−1∑
k=0
∫ π
0
Λ
(
θ + kπ
m
)
+ C(m)π.
Since Λ is odd andπ-periodic, we have
∫ π
0
Λ(mθ) = 0
for any integer m. Hence C(m) = 0 and the formula is proved. Finally
we note that Λ′′(θ) = − cot θ is strictly negative in (0, π
2 ) and strictly
positive in( π
2 , π), henceΛ is strictly positive in(0, π
2 ) and strictly negative
in ( π
2 , π). □
13.1.2. Volumes of ideal tetrahedra.An ideal tetrahedron inH3 is
the convex hull of four non-planar ideal points. Quite surprisingly, every
ideal tetrahedron has some non-trivial symmetries.
Proposition 13.1.2. For any pair of opposite edges in an ideal tetra-
hedron ∆ there is a unique liner orthogonal to both as in Figure 13.1 and
∆ is symmetric with respect to aπ-rotation around r.
Proof. The opposite edges e ed e′ are ultraparallel lines inH3 and
hence have a common perpendicularr. A π-rotation aroundr inverts both
e and e′ but preserve the 4 ideal vertices of∆, hence ∆ itself. □
As a consequence, two opposite edges in∆ have coinciding dihedral
angles as in Figure 13.2-(left). Moreover, we haveα + β + γ = π because
a small horosphere based at a vertex intersects∆ into a Euclidean triangle
with inner anglesα, β, and γ. The regular ideal tetrahedron has of course
equal angles α = β = γ = π
3.


## Page 418

410 13. MOSTOW RIGIDITY THEOREM
Figure 13.2. The dihedral anglesα, β, γ of an ideal tetrahe-
dron. Opposite edges have the same angle andα+β +γ = π
(left). To calculate the volume we use the half-space model,
send a vertex to∞, and divide the tetrahedron in six sub-
tetrahedra (right).
Theorem 13.1.3. Let ∆ be an ideal tetrahedron with dihedral angles
α, β and γ. We have
Vol(∆) = Λ(α) + Λ(β) + Λ(γ).
Proof. We represent∆ in the half-space modelH3 with one vertexv0
at inﬁnity and three verticesv1, v2, v3 in C. Let C be the circle containing
v1, v2, andv3: up to composing with elements inPSL2(C) we can suppose
that C = S1. The Euclidean triangle T ⊂ C with vertices v1, v2, and v3
has interior anglesα, β, and γ.
We ﬁrst consider the case0 ∈ T, that isα, β, γ ⩽ π
2. We decompose
T into six triangles as in Figure 13.2: the tetrahedron ∆ decomposes
accordingly into six tetrahedra lying above them, and we prove that the
one ∆α lying above the yellow triangle has volumeΛ(α)
2 . This proves the
theorem.
The tetrahedron∆α is the intersection of four half-spaces: three ver-
tical ones bounded by the hyperplanesy = 0, x = cos α, and y = x tan α,
and one bounded by the half-spherez 2 = x 2 + y 2. Therefore
Vol(∆α) =
∫ cos α
0
d x
∫ x tan α
0
d y
∫ ∞
√
1−x2−y 2
1
z 3 d z
=
∫ cos α
0
d x
∫ x tan α
0
d y
[
− 1
2z 2
]∞
√
1−x2−y 2
= 1
2
∫ cos α
0
d x
∫ x tan α
0
1
1 − x 2 − y 2 d y .
To solve this integral we use the relation
1
1 − x 2 − y 2 = 1
2
√
1 − x 2
( 1√
1 − x 2 − y + 1√
1 − x 2 + y
)


## Page 419

13.1. VOLUME OF TETRAHEDRA 411
and hence Vol(∆α) equals
1
4
∫ cos α
0
d x√
1 − x 2
([
− log(
√
1 − x 2 − y)
]x tan α
0
+
[
log(
√
1 − x 2 + y)
]x tan α
0
)
= 1
4
∫ cos α
0
d x√
1 − x 2
(
− log(
√
1 − x 2 − x tan α) + log(
√
1 − x 2 + x tan α)
)
.
By writing x = cos t and hence d x = − sin t d t we obtain
Vol(∆α) = 1
4
∫ α
π
2
− sin t
sin t
(
− log sin t cos α − cos t sin α
sin t cos α + cos t sin α
)
d t
= − 1
4
∫ α
π
2
log sin(t + α)
sin(t − α) d t = − 1
4
∫ α
π
2
log |2 sin(t + α)|
|2 sin(t − α)| d t
= 1
4
∫ π
2 +α
2α
log |2 sin t|d t − 1
4
∫ π
2−α
0
log |2 sin t|d t
= 1
4
(
−Λ
(π
2 + α
)
+ Λ(2α) + Λ
(π
2 − α
))
= 1
4
(
−Λ
(π
2 + α
)
+ 2Λ(α) + 2Λ
(π
2 + α
)
− Λ
(π
2 + α
))
= 1
2 Λ(α)
using Proposition 13.1.1.
If 0 ̸∈ T the triangleT may be decomposed analogously into triangles,
someofwhichcontributenegativelytothevolume, andweobtainthesame
formula. □
Corollary 13.1.4.The regular ideal tetrahedron is the hyperbolic tetra-
hedron of maximum volume.
Proof. It is easy to prove that every hyperbolic tetrahedron is con-
tained in an ideal tetrahedron: hence we may consider only ideal tetrahe-
dra. Consider the triangleT = {0 ⩽ α, β, α + β ⩽ π} and
f : T − →R
(α, β) ↦− →Λ(α) + Λ(β) + Λ(π − α − β).
The continuous functionf is null on∂T and strictly positive on the interior
of T because it measures the volume of the ideal tetrahedron of dihedral
angles α, β, γ = π − α − β. Hence f has at least a maximum on some
interior point(α, β). The gradient∇f is equal to
(Λ′(α) − Λ′(π − α − β)
Λ′(β) − Λ′(π − α − β)
)
=
(− log |2 sin α| + log |2 sin(π − α − β)|
− log |2 sin β| + log |2 sin(π − α − β)|
)
and it must vanish there: this holds if and only ifsin α = sin(π − α − β) =
sin β, i.e. if and only if the tetrahedron has all dihedral anglesπ
3. □


## Page 420

412 13. MOSTOW RIGIDITY THEOREM
13.2. Simplicial volume
Gromov has introduced a topological invariant on closed manifolds of
any dimension called thesimplicial volume. This nice invariant can be used,
among other things, to prove Mostow’s rigidity theorem.
13.2.1. Deﬁnition. Gromov has introduced a measure of “volume”
of a closed manifold M which makes use only of the homology of M.
Quite surprisingly, this notion of volume coincides (up to a factor) with
the Riemannian one whenM is hyperbolic.
Consider a topological space X and its homology with ringR. We
deﬁne thenorm of a cycleα = λ1α1 + . . . + λhαh as follows:
|α| = |λ1| + . . . + |λh|.
Deﬁnition 13.2.1. Thenorm of a classa ∈ Hk(X, R) is the inﬁmum
of the norms of its elements:
|a| = inf
{
|α|
⏐⏐ α ∈ Zk(X, R), [α] = a
}
.
Recallthata seminormonarealvectorspace V isamap |·| : V → R⩾0
such that
• | λv | = |λ||v | for any scalarλ ∈ R and vector v ∈ V,
• | v + w | ⩽ |v | + |w | for any pair of vectorsv , w ∈ V.
A norm is a seminorm where |v | = 0 implies v = 0. The following is
immediate.
Proposition 13.2.2. The norm | · | induces a seminorm onHk(X, R).
Although it is only a seminorm, the function| · | is called a norm for
simplicity. Let nowM be an oriented closed connected manifold: we know
that Hn(M, Z) ∼= Z and the orientation ofM determines a fundamental
class [M] ∈ Hn(M, Z) that generates the group. MoreoverHn(M, R) ∼= R
and there is a natural inclusion
Z ∼= Hn(M, Z) ↪→ Hn(M, R) ∼= R
hence the fundamental class[M] is naturally inHn(M, R) and has a norm.
Deﬁnition 13.2.3. Thesimplicial volume ∥M∥ ∈ R⩾0 of a closed ori-
ented connected M is the norm of its fundamental class:
∥M∥ = |[M]|
Since |[M]| = | − [M]| the simplicial volume actually does not depend
on the orientation. WhenM is non-orientable we set∥M∥ =
 ˜M
/2where
˜M is the orientable double cover ofM. The deﬁnition of∥M∥ is relatively
simple but has various non-obvious consequences.


## Page 421

13.2. SIMPLICIAL VOLUME 413
13.2.2. Properties. A continuous map f : M → N between closed
oriented n-manifolds induces a homomorphismf∗ : Hn(M, Z) → Hn(N, Z),
and recall that thedegree of f is the integerdeg f such that
f∗([M]) = deg f · [N].
Proposition 13.2.4. Let f : M → N be a continuous map between
closed oriented manifolds. The following inequality holds:
∥M∥ ⩾ | deg f | · ∥N∥.
Proof. Every description of[M] as a cycleλ1α1 + . . . + λhαh induces
a description off∗([M]) = deg f [N] as a cycleλ1f ◦ α1 + . . . + λhf ◦ αh
with the same norm (or less, if there is some cancelation). □
Corollary 13.2.5.If M and N are closed orientable and homotopically
equivalent n-manifolds then ∥M∥ = ∥N∥.
Proof. A homotopic equivalence consists of two mapsf : M → N
and g : N → M whose compositions are both homotopic to the identity.
In particular bothf and g have degree ±1. □
Corollary 13.2.6. If M admits a continuous self-mapf : M → M of
degree at least two then∥M∥ = 0.
Corollary 13.2.7. Every sphere Sn has norm zero. More generally we
have ∥M × Sn∥ = 0 for every closedM and any n ⩾ 1.
Proof. A sphere Sn admits self-maps of degree⩾ 2, and hence also
the product M × Sn does. □
Among the genus-g surfaces Sg, we deduce that the sphere and the
torus have simplicial volume zero. We will see soon that every surface of
genus g ⩾ 2 has positive simplicial volume. When the continuous map is a
covering the inequality from Proposition 13.2.4 is promoted to an equality.
Proposition 13.2.8. If f : M → N is a degree-d covering we have
∥M∥ = d · ∥N∥.
Proof. The reason for this equality is that cycles can be lifted and
projected through the covering. More precisely, we already know that
∥M∥ ⩾ d · ∥N∥. Conversely, letα = λ1α1 + . . .+ λhαh represent [N]; each
αi is a map∆n → N. Since ∆n is simply connected, the mapαi lfts to d
distinct maps α1
i , . . . , αd
i : ∆ n → N. The chain ˜α = ∑
i j λi αj
i is a cycle in
M and f∗( ˜α) = d α. Hence ∥M∥ ⩽ d · ∥N∥. □
We also note the following fact.
Proposition 13.2.9. If M is triangulated withk simplices, ∥M∥ ⩽ k.


## Page 422

414 13. MOSTOW RIGIDITY THEOREM
Proof. Up to taking a double cover we may suppose thatM is ori-
ented. The closedn-manifold M is triangulated into simplices∆1, . . . ,∆k,
and we ﬁx an orientation-preserving parametrisationsi : ∆ → ∆i of each.
We would like to say thats1 + . . .+ sk is a fundamental cycle, however this
singular chain is not necessarily a cycle because the restriction to adjacent
faces coincide only up to the symmetriesSn+1 of ∆.
We can ﬁx this problem easily by averaging eachsi on all its permu-
tations, that is we substitute eachsi with 1
(n+1)!
∑
σ∈Sn+1(−1)sgn(σ)si ◦ σ.
Now s = s1 + . . . + sk is a fundamental cycle and|s| = k. □
13.2.3. Seifert manifolds. We can now calculate the simplicial vol-
ume of Seifert manifolds.
Proposition13.2.10. If M isaclosedSeifert3-manifoldthen ∥M∥ = 0.
Proof. Every Seifert manifold is ﬁnitely covered by a productS × S1
(if e = 0) or by a bundle
(
S, (1, 1)
)
with Euler number 1 (ife ̸= 0). In the
ﬁrst case we are done since∥S × S1∥ = 0.
In the second, if S = S2 then
(
S2, (1, 1)
)
= S3 and ∥S3∥ = 0, so
we suppose χ(S) ⩽ 0. There is a universal K > 0 such that
(
S, (1, 1)
)
triangulates with at mostK|χ(S)| + K tetrahedra (exercise) and therefore(
S, (1, 1)
) ⩽ K|χ(S)| + K. Exercise 10.3.27 shows that for everye > 0
there is a degree-e covering ˜S → S and two degree-e coverings
(˜S, (1, 1)
)
− →
(˜S, (1, e)
)
− →
(
S, (1, 1)
)
which compose to a degree-e2 covering
(˜S, (1, 1)
)
→
(
S, (1, 1)
)
. Thus
(
S, (1, 1)
) =
(˜S, (1, 1)
)
e2 ⩽ K|χ( ˜S)| + K
e2 ⩽ Ke |χ(S)| + K
e2 → 0
as e → ∞. □
13.2.4. Simplicial and hyperbolic volume.In the next pages we will
prove the following theorem. Let v3 be the volume of the regular ideal
tetrahedron in H3.
Theorem 13.2.11.Let M be a closed hyperbolic3-manifold. We have
Vol(M) = v3∥M∥.
The theorem furnishes in particular some examples of manifolds with
positive simplicial volume and shows thatVol(M) is a topological invariant
of M, thus generalising the Gauss-Bonnet theorem to dimensionn = 3.
Mostowrigiditywillthenstrengthenthisresultindimension n = 3, showing
that the hyperbolic metric itself (not only its volume) is a topological
invariant.
Both quantities Vol(M) and ∥M∥ are multiplied byd if we substitute
M with a degree-d covering. In particular, up to substitutingM with its
orientable double cover we can suppose thatM is orientable.


## Page 423

13.2. SIMPLICIAL VOLUME 415
13.2.5. Cycle straightening. The straight singular k-simplex with
vertices v0, . . . , vk ∈ Hn is the map
α: ∆ k − →Hn
(t0, . . . , tk) ↦− →t0v0 + . . . + tk vk
deﬁned using convex combinations, see Section 2.4.3. If thek + 1 ver-
tices are not contained in a(k − 1)-plane the singular k-simplex is non-
degenerate and its image is a hyperbolick-simplex.
Thestraightening αst of a singular simplexα: ∆ k → Hn is the straight
singular simplex with the same vertices ofα. The straightening αst of a
singular simplexα: ∆ k → M in a hyperbolic manifoldM = Hn/Γ is deﬁned
by lifting the singular simplex inHn, straightening it, and projecting it back
to M by composition with the covering map. Diﬀerent lifts produce the
same straightening inM because they are related by isometries ofHn.
The straightening extends by linearity to a homomorphism
st : Ck(M, R) → Ck(M, R)
which commutes with∂ and hence induces a homomorphism in homology
st∗ : Hk(M, R) → Hk(M, R).
Proposition 13.2.12. The map st∗ is the identity.
Proof. We may deﬁne a homotopy between a singular simplexσ and
its straightening σst using the convex combination
σt(x) = tσ(x) + (1 − t)σst(x).
This deﬁnes a chain homotopy betweenst∗ and id via the same technique
used to prove that homotopic maps induce the same maps in homology.
□
The abstract volumeof a straightened singularn-simplex α: ∆ n → M
is the volume of its lift inHn and may also be calculated as
⏐⏐⏐⏐
∫
α
ω
⏐⏐⏐⏐
where ω is the volume form on M pulled back along α. If α is non-
degenerate, we say that itssign is positive if α is orientation-preserving
and negative otherwise: equivalently, it is the sign of
∫
α ω.
We now concentrate on the dimensionn = 3 where we know that
a tetrahedron has maximum volume v3 if and only if it is both regular
and ideal: a straight simplex is compact and hence its abstract volume is
strictly smaller thanv3. We can now easily prove one inequality.
Proposition 13.2.13. Let M be a closed hyperbolic3-manifold. We
have
Vol(M) ⩽ v3∥M∥.


## Page 424

416 13. MOSTOW RIGIDITY THEOREM
Proof. As we said above, we can suppose thatM is orientable. Take
a cycle α = λ1α1 + . . . + λk αk that represents [M]. We can suppose it
is straightened, because the straightening preserves both the coeﬃcients
and the homology class. Letω be the volume form onM. We get
Vol(M) =
∫
M
ω =
∫
α
ω = λ1
∫
α1
ω + . . . + λk
∫
αk
ω.
The quantity
⏐⏐ ∫
αi
ω
⏐⏐ is the abstract volume ofαi. Hence
⏐⏐ ∫
αi
ω
⏐⏐ < v 3 and
Vol(M) <
(
|λ1| + . . . + |λk |
)
v3.
This holds for allα, hence Vol(M) ⩽ v3∥M∥. □
The proof of the converse inequality is less immediate.
13.2.6. Eﬃcient cycles. Let M = H3/Γ be a closed oriented hyper-
bolic 3-manifold. Anε-eﬃcient cyclefor M is a straightened cycle
α = λ1α1 + . . . + λk αk
representing [M] where the abstract volume ofαi if bigger thanv3 − ε and
the sign ofαi is coherent with the sign ofλi, for alli.
We will construct anε-eﬃcient cycle for everyε > 0. This will con-
clude the proof of Theorem 13.2.11 in virtue of the following:
Lemma 13.2.14. If for every ε > 0 the manifold M admits an ε-
eﬃcient cycle, then we haveVol(M) ⩾ v3∥M∥.
Proof. Let α = λ1α1 + . . . λk αk be an ε-eﬃcient cycle andω be the
volume form onM. Coherence of signs givesλi
∫
αi
ω > 0 for alli. We get
Vol(M) =
∫
M
ω =
∫
α
ω = λ1
∫
α1
ω + . . . + λk
∫
αk
ω
⩾
(
|λ1| + . . . + |λk |
)
· (v3 − ε).
Therefore Vol(M) ⩾ ∥M∥ · (v3 − ε) for all ε > 0. □
It remains to constructε-eﬃcient cycles.
Exercise13.2.15. If ∆i isasequenceoftetrahedrain H3 whosevertices
tend to the vertices of a regular ideal tetrahedron in∂H3, then
Vol(∆i ) → v3.
For any t > 0, let ∆(t) be a regular tetrahedron obtained as in Sec-
tion 3.2.4 as follows. Pick a pointx ∈ H3 and a regular tetrahedron in
the Euclidean tangent spaceTx H3, centred at the origin with vertices at
distance t from it, project the vertices inH3 via the exponential map, and
pick their convex hull.
A t-simplex is a tetrahedron isometric to∆(t) equipped with an or-
dering of its vertices: the ordering allows us to consider it as a straightened
singular simplex. LetS(t) be the set of allt-simplices in H3.


## Page 425

13.2. SIMPLICIAL VOLUME 417
Exercise 13.2.16. The groupIsom(H3) acts on S(t) freely and tran-
sitively.
Recall from Corollary 2.4.8 thatIsom(H3) is unimodular: the Haar
measure on Isom(H3) induces an Isom(H3)-invariant measure onS(t).
Let M = H3/Γ be a closed hyperbolic 3-manifold andπ : H3 → M
the covering projection. Fix a base pointx0 ∈ H3 and consider its orbit
O = Γx0. Consider the set
Σ = Γ 4/Γ
of the 4-uples (g0, g1, g2, g3) considered up to the diagonal action ofΓ:
g · (g0, g1, g2, g3) = ( gg0, gg1, gg2, gg3).
An element σ = (g0, g1, g2, g3) ∈ Σ determines a singular simplex˜σ in H3
with vertices g0(x0), g1(x0), g2(x0), g3(x0) ∈ O only up to translations by
g ∈ Γ, hence it gives a well-deﬁned singular simplex inM, which we still
denote by σ. We now introduce the chain
α(t) =
∑
σ∈Σ
λσ(t) · σ
for some appropriate real coeﬃcientsλσ(t) that we now deﬁne. The base
point x0 determines the Dirichlet tessellation ofH3 into domainsD(g(x0)),
g ∈ Γ. Forσ = (g0, g1, g2, g3)welet S+
σ (t) ⊂ S(t)bethesetofallpositive
t-simplices whosei-th vertex lies inD(gi (x0)) for alli. The numberλ+
σ (t)
is the measure ofS+
σ (t). We deﬁne analogouslyλ−
σ (t) and set
λσ(t) = λ+
σ (t) − λ−
σ (t).
Lemma 13.2.17. The chain α(t) has ﬁnitely many addenda and is a
cycle. If t is suﬃciently big the cycleα(t) represents a positive multiple
of [M] in the groupH3(M, R).
Proof. We prove that the sum is ﬁnite. Letd , T be the diameters of
D(x0) and of at-simplex. We writeσ = (id, g1, g2, g3) for allσ ∈ Σ: that
is, all simplices have their ﬁrst vertex atx0. If λσ(t) ̸= 0 then d(gi x0, x0) <
2d + T for all i: therefore α(t) has ﬁnitely many addenda (becauseO is
discrete).
We prove thatα(t) is a cycle. The boundary∂α(t) is a linear com-
bination of straight2-simplices with vertices in(g0x0, g1x0, g2x0) as g0, g1,
and g2 vary. The coeﬃcient of one such2-simplex is
∑
g∈Γ
(
− λ(g,g0,g1,g2)(t) + λ(g0,g,g1,g2)(t) − λ(g0,g1,g,g2)(t) + λ(g0,g1,g2,g)(t)
)
.
We prove that each addendum summed alongg ∈ Γ is zero; for simplicity
we consider the last addendum and get
∑
g∈Γ
λ(g0,g1,g2,g)(t) =
∑
g∈Γ
λ(g0,g1,g2,g)(t)+ −
∑
g∈Γ
λ(g0,g1,g2,g)(t)−.


## Page 426

418 13. MOSTOW RIGIDITY THEOREM
The ﬁrst addendum measures the positivet-simplices whose ﬁrst 3 ver-
tices lie in D(g0(x0)), . . . , D(g2(x0)), the second measures the negative
t-simplices with the same requirement. These two subsets have the same
volume in S(t) because they are related by the involutionr : S(t) → S(t)
that mirrors a simplex with respect to its ﬁrst facet.
We show that for suﬃciently bigt the cycle is a positive multiple of
[M]. Let t be suﬃciently big so that two vertices in at-simplex have
distance bigger than2d. This condition implies that if there is a positive
t-simplex with vertices inD(g0(x0)), . . . , D(g3(x0)), then any straight sim-
plex with vertices inD(g0(x0)), . . . , D(g3(x0)) is positive. Therefore in the
expression
α(t) =
∑
σ∈Σ
λσ(t) · σ
the signs ofλσ(t) and σ are coherent and
∫
α(t)
ω =
∑
σ∈Σ
λσ(t) ·
∫
σ
ω > 0.
Therefore α(t) is a positive multiple of[M]. □
For suﬃciently big t we have α(t) = kt[M] in homology for some
kt > 0. The rescaled ¯α(t) = α(t)/kt hence represents [M]. We have
found our ε-eﬃcient cycles.
Lemma 13.2.18. For any ε > 0 there is a t0 > 0 such that ¯α(t) is
ε-eﬃcient for allt > t 0.
Proof. Let d be the diameter of the Dirichlet domainD(x0). Let
a quasi t-simplex be a simplex whose vertices are at distance< d from
those of at-simplex. By construction¯α(t) is a linear combination of quasi
t-simplices.
We now show that for anyε > 0 there is at0 > 0 such that for allt >
t0 every quasi t-simplex has volume bigger thanv3 − ε. By contradiction,
let ∆t be a sequence of quasit-simplices of volume smaller thanv3 − ε
with t → ∞. The vertices of∆t are d-closed to at-simplex ∆t
∗, and we
move the pair∆t , ∆t
∗ isometrically so that thet-simplices ∆t
∗ have the same
barycenter. Now both the vertices of∆t and ∆t
∗ tend to the vertices of an
ideal regular tetrahedron and Exercise 13.2.15 gives a contradiction.□
The previous lemmas together prove the second half of Theorem
13.2.11.
Corollary 13.2.19.Let M be a closed hyperbolic3-manifold. We have
Vol(M) ⩾ v3∥M∥.
Theorem 13.2.11 has some non-trivial consequences.


## Page 427

13.3. MOSTOW RIGIDITY 419
Corollary 13.2.20. Let M, N be two closed orientable hyperbolic3-
manifolds. If there is a map f : M → N of degree d then Vol(M) ⩾
|d| · Vol(N).
Corollary 13.2.21. Two homotopically equivalent and closed hyper-
bolic 3-manifolds have the same volume.
Remark 13.2.22. If we are able to prove that the regular ideal simplex
has the maximum volumevn among hyperbolicn-simplices inHn, then the
whole proof extends as is fromH3 to Hn and shows thatVol(M) = vn · |M|
for any closed hyperbolicn-manifold M. This is obviously true whenn = 2,
and we getv2 = π.
13.3. Mostow rigidity
13.3.1. Introduction. We want to prove the following.
Theorem 13.3.1 (Mostow rigidity).Let M and N be closed connected
orientable hyperbolic 3-manifolds. Every isomorphism π1(M)
∼
→ π1(N)
between fundamental groups is induced by a unique isometryM
∼
→ N.
This powerful theorem says that an algebraic isomorphism between
fundamental groups suﬃces to produce and characterise an isometry.
Corollary 13.3.2. Two closed orientable hyperbolic 3-manifolds with
isomorphic fundamental groups are isometric.
We prove Mostow’s rigidity in this section. All the ingredients are
already there, we only need to make a little last eﬀort.
We note that closed hyperbolic manifolds are aspherical because their
universal cover Hn is contractible. For such manifolds every isomorphism
π1(M) → π1(N) is induced by a homotopy equivalencef : M → N, unique
up to homotopy: see Corollary 1.7.7. To prove Mostow’s theorem we need
to promote this homotopy equivalence to an isometry in dimensionn = 3.
We already know thatVol(M) = Vol(N) by Corollary 13.2.21.
13.3.2. Proof of Mostow’s theorem.Let f : M → N be a smooth
homotopy equivalence. Recall from Theorem 5.2.1 thatf lifts to a map
˜f : H3 → H3 which extends continuously to a homeomorphism˜f : ∂H3 →
∂H3 of the boundary spheres. We start with a lemma.
Lemma 13.3.3. The extension ˜f : ∂H3 → ∂H3 sends the vertices of
every regular ideal simplex to the vertices of some regular ideal simplex.
Proof. Let w0, . . . , w3 be vertices of a regular ideal simplex and sup-
pose by contradiction that their images ˜f (w0), . . . , ˜f (w3) span a non-
regular ideal simplex, which has volume smaller thanv3 − 2δ for some
δ > 0. By Exercise 13.2.15 there are neighbourhoodsUi of wi in H3 for i =
0, . . . ,3 such that the volume of the simplex with vertices˜f (u0), . . . , ˜f (u3)
is smaller thanv3 − δ for any choice ofui ∈ Ui.


## Page 428

420 13. MOSTOW RIGIDITY THEOREM
In Section 13.2.6 we have deﬁned a cycle
α(t) =
∑
σ∈Σ
λσ(t) · σ
where t depends on ε. We say that a singular simplexσ ∈ Σ is bad if its
i-th vertex is contained inUi for all i. Let Σbad ⊂ Σ be the subset of all
bad singular simplices and deﬁne
α(t)bad =
∑
σ∈Σbad
λσ(t) · σ.
We want to estimate|α(t)| and |α(t)bad|. We prove that
|α(t)| =
∑
σ∈Σ
|λσ(t)|
is a real number independent of t: let S0 ⊂ S(t) be the set of all t-
simplices having the ﬁrst vertex in the Dirichlet domainD(x0) of the ﬁxed
base point x0 ∈ H3. It follows from the deﬁnitions that|α(t)| equals the
measure of S0 for suﬃciently big t. Moreover the set S0 is in natural
correspondence with the set of all isometries that sendx0 to some point
in D(x0): its volume does not depend ont.
To estimate|α(t)bad| we ﬁxg0 ∈ Γ so thatD(g0x0) ⊂ U0. Let Sbad ⊂
S(t) be the set of all badt-simplices with ﬁrst vertex inD(g0x0). If t is
suﬃciently big, the volume ofSbad is bigger than a constant independent
of t (exercise).
We have proved that|α(t)bad|/|α(t)| > C > 0 independently of t.
We may suppose thatα(t) represents [M] up to renormalising. The map
f : M → N has degree ±1 and it sendsα(t) to a class
f∗(α(t)) =
∑
σ∈Σ
λσ(t) · (f ◦ σ)st
representing ±[N]. Since a C-portion of α(t) is bad, aC-portion of sim-
plices in f∗(α(t)) has volume smaller thanv3 − δ and hence
Vol(N) =
⏐⏐⏐⏐
∫
f∗(α(t))
ω
⏐⏐⏐⏐ < |α(t)|((1 − C)v3 + C(v3 − δ)) = |α(t)|(v3 − δC).
Since this holds for allt and |α(t)| → ∥ M∥ we get
Vol(N) < ∥M∥(v3 − δC) = Vol(M) − δC · ∥M∥.
Corollary 13.2.21 givesVol(M) = Vol(N), a contradiction. □
Proposition 13.3.4. Every ideal triangle inH3 is the face of precisely
two regular ideal tetrahedra.
Proof. Pick the line l orthogonal to the barycenter of the triangle:
the vertex of a regular ideal tetrahedron must be an endpoint ofl. To
prove that these vertices give regular ideal tetrahedra, note that all ideal
triangles in H3 are isometric, so one concrete example suﬃces. □


## Page 429

13.3. MOSTOW RIGIDITY 421
We turn back to Mostow rigidity.
Proposition 13.3.5. Let f : M → N be a smooth homotopic equiv-
alence between closed hyperbolic orientable 3-manifolds. The restriction
˜f |∂H3 : ∂H3 → ∂H3 is the trace of an isometryψ : H3 → H3.
Proof. Let v0, . . . , v3 ∈ ∂Hn be vertices of a regular ideal tetrahedron
∆. By Lemma 13.3.3 the lift˜f sends them to the vertices of some regular
idealtetrahedron, andlet ψ betheuniqueisometryof H3 suchthat ψ(vi ) =
˜f (vi ) for all i.
By Proposition 13.3.4 there is a unique point v4 ̸= v3 such that
v0, v1, v2, v4 are the vertices of an ideal regular tetrahedron, andψ(v4)
is the unique point other than ψ(v3) such that v0, v1, v2, ψ(v4) are the
vertices of an ideal regular tetrahedron. By Lemma 13.3.3 we also have
˜f (v4) = ψ(v4).
If we mirror∆ along its faces iteratively we get a tessellation ofH3 via
regular ideal tetrahedra, whose ideal vertices form a dense subset of∂H3.
By iterating this argument in all directions the functionsψ and ˜f coincide
on this dense subset and hence on the whole of∂H3. □
We can ﬁnally prove Mostow’s rigidity theorem.
Theorem 13.3.6 (Mostow Rigidity).Let f : M → N be a homotopic
equivalence between closed orientable hyperbolic 3-manifolds. The mapf
is homotopically equivalent to an isometry.
Proof. Set M = H3/Γ and N = H3/Γ′, and pick a lift˜f. We have
(18) ˜f ◦ g = f∗(g) ◦ ˜f ∀g ∈ Γ
for an isomorphismf∗ : Γ → Γ′. We may supposef smooth. The boundary
extension of ˜f is the trace of an isometryψ : H3 → H3 and hence
(19) ψ ◦ g = f∗(g) ◦ ψ ∀g ∈ Γ
holds at ∂H3. Both terms in (19) are isometries, and isometries are de-
termined by their boundary traces: hence (19) holds for all points inH3.
Therefore ψ descends to an isometry
ψ : M → N.
A homotopy betweenf and ψ may be constructed from a convex combina-
tion of ˜f and ψ in Hn, which is alsoΓ-equivariant and hence descends. □
13.3.3. Consequences of Mostow rigidity.The most important con-
sequence is that the entire geometry of a closed hyperbolic3-manifold is a
topological invariant: numerical quantities like the volume of the manifold,
its geodesic spectrum, etc. depend only on the topology of the manifold.
We single out another application.


## Page 430

422 13. MOSTOW RIGIDITY THEOREM
Corollary 13.3.7.Let M be a closed orientable hyperbolic 3-manifold.
The natural map
Isom(M) → Out(π1(M))
is an isomorphism.
Proof. We already know that it is injective by Proposition 4.3.6. We
prove that it is surjective: every automorphism ofπ1(M) is represented by
a homotopy equivalence sinceM is aspherical (see Corollary 1.7.7), which
is in turn homotopic to an isometry by Mostow’s rigidity. □
We note that this is false in dimensionn = 2, where Isom(S) is ﬁnite
and Out(π1(S)) is inﬁnite.
13.3.4. Orbifolds and cone manifolds.While by Mostow’s theorem
an orientable closed 3-manifoldM can have at most one hyperbolic struc-
ture, it may have plenty of hyperbolic cone manifold or orbifold structures,
typically distinguished by their singular sets and their cone angles. For
instance M = S3 has plenty of such structures, as we will see.
For the moment we note that the volumes of these hyperbolic orbifold
structures may be arbitrarily big, but not arbitrarily small:
Proposition 13.3.8. Let a closed orientable 3-manifoldM be the un-
derlying space of a hyperbolic orbifoldO. We have
Vol(O) ⩾ v3∥M∥.
Proof. BySelberg’sLemmathereisadegree- d orbifoldcovering N →
O which is a closed hyperbolic manifold. We haveVol(N) = dVol(O), and
since the covering is a degree-d map N → M we can apply Corollary
13.2.20 and get∥M∥ ⩽ ∥N∥
d = Vol(N)
d v3
= Vol(O)
v3
. □
13.3.5. References. Most of the proofs presented in this chapter
were taken from Benedetti – Petronio [4], and are also contained in Thur-
son’s notes [56]. The proof of Mostow’s rigidity presented here was pro-
posed by Gromov and applies to every dimensionn ⩾ 3, because ideal
regular simplexes have indeed the maximum volume by Haagerup and
Munkholm [24].


## Page 431

CHAPTER 14
Hyperbolic three-manifolds
We have studied and classiﬁed the three-manifolds having seven of
the eight geometries, and we are now left with the most interesting ones:
hyperbolic three-manifolds.
In dimension two every closed hyperbolic surface is constructed by
gluing some geodesic pair-of-pants. In dimension three, although closed
hyperbolic three-manifolds are everywhere, it is somehow harder to con-
struct them explicitly: the most general procedure to determine a hy-
perbolic metric (if any) on a given closed 3-manifold consists of solving
Thurston’s equations.
Thurston’s equations arise naturally in the attempt of constructing
a hyperbolic three-manifold by triangulating it into hyperbolic tetrahedra.
The most relevant and unexpected aspect of the theory is that it is much
easier to employ hyperbolic ideal tetrahedra than compact ones. The
combinatorial framework in the ideal case is so convenient, that we use it
also for closed three-manifolds.
In this chapter we describe these equations and use them to determine
various ﬁnite-volume hyperbolic 3-manifolds. We start with the cusped
case and then turn to the slightly more complicate closed one.
14.1. Cusped three-manifolds
We know that every cusped ﬁnite-volume complete hyperbolic surface
is constructed by gluing isometrically ﬁnitely many ideal triangles along
their edges (see Proposition 7.4.6). Likewise, we now construct plenty
of cusped hyperbolic three-manifolds by gluing isometrically ﬁnitely many
ideal tetrahedra along their faces.
14.1.1. Ideal tetrahedra. Ideal triangles are all isometric, but ideal
tetrahedraarenot! Wenowshowthattheycanbedescribeduptoisometry
by a single complex parameterz with ℑz > 0.
An ideal tetrahedron is determined by its ideal verticesv1, v2, v3, v4 ∈
∂H3. We use the half-space modelH3 and recall that ∂H 3 = C ∪ {∞}
and Isom+(H3) = PSL2(C), hence there is a unique orientation-preserving
isometryof H3 thatsendsthevertices v1, v2, v3, v4 respectivelyto 0, 1, ∞, z
for somez. Up to mirroring with the orientation-reversing reﬂectionz ↦→ ¯z
we can suppose thatℑz > 0.
423


## Page 432

424 14. HYPERBOLIC THREE-MANIFOLDS
Figure 14.1. An ideal tetrahedron with three vertices in
0, 1,∞ in the half-space mode is determined by the posi-
tion z∈ C∪{∞} of the fourth vertex. A small horosphere
centred at the ideal vertex intersects the tetrahedron in a
Euclidean triangle uniquely determined up to similarities.
z z
z
0 1
z
z-1
z
1
1- z
z-1
z
z-1
z
1
1- z 1
1- z
Figure 14.2. At each ideal vertex we have a Euclidean tri-
angle deﬁned up to similarities: each vertex of the triangle
has a well-deﬁned complex angle (left). We can assign the
complex angles directly to the edges of the tetrahedron. The
argument is the dihedral angle of the edge (right).
Remark 14.1.1. By deﬁnition the numberz is thecross-ratio of the
four complex numbersv1, v2, v3, v4.
A horosphere centred at the vertexv3 = ∞ is a horizontal Euclidean
plane that intersects the ideal tetrahedron in a Euclidean triangle as in
Figure 14.1. The oriented similarity class of the triangle depends only on
the vertex v4, because a horosphere change results in a dilation: we can
represent it as a triangle inC = R2 with vertices at0, 1, andz as in Figure
14.2-(left). The complex angle of a vertex of the triangle is the ratio of


## Page 433

14.1. CUSPED THREE-MANIFOLDS 425
Figure 14.3. A truncated tetrahedron.
the two adjacent sides, taken with clockwise order and seen as complex
numbers. The three complex angles shown in Figure 14.2-(left) are:
z , 1
1 − z , z − 1
z .
The argument is the usual angle, and the modulus is the ratio of the two
lengths of the adjacent sides.
Proposition 13.1.2 shows that some symmetries of an ideal tetrahe-
dron act on its vertices like the alternating groupA4 and hence transi-
tively. Therefore every vertex has the same triangular section as in Figure
14.2-(left), and all the sections can be encoded by assigning the complex
numbers directly to the edges of∆ as shown in Figure 14.2-(right). These
labels on the edges are calledmoduli and determine the ideal tetrahedron
up to orientation-preserving isometries ofH3. The argument of a modulus
is the dihedral angle of the edge.
On a regular ideal tetrahedron the triangular sections are equilateral
and hence all edges have the same modulusz = e
πi
3 .
14.1.2. Ideal triangulations. Let ∆1, . . . ,∆n be identical copies of
the standard oriented 3-simplex. As in the two-dimensional case, atrian-
gulation T is a partition of the4n faces of the tetrahedra into2n pairs, and
foreachpairasimplicialisometrybetweenthetwofaces. Thetriangulation
is oriented if the simplicial isometries are orientation-reversing. If we glue
the tetrahedra along the simplicial isometries we get a topological space
X, which is not necessarily a topological manifold. LetM be X minus the
vertices of the triangulation: we say thatT is anideal triangulationfor M.
Proposition 14.1.2. If T is oriented, thenM is homeomorphic to the
interior of a compact oriented 3-manifold with boundary.
Proof. To prove thatM is a manifold we only need to check that a
point x ∈ e in an edgee has a neighbourhood homeomorphic to an open
ball. A cycle of tetrahedra is attached toe, and sinceT is oriented we are
certain that a neighbourhood ofx is a cone over a 2-sphere and not over
a projective plane.


## Page 434

426 14. HYPERBOLIC THREE-MANIFOLDS
Figure14.4. Ifwemanagetoglueallthetetrahedraincident
to an edge e inside H3 as shown, the hyperbolic structure
is deﬁned also in e (left). Let z1, . . . , zh be the complex
moduli assigned to the sides of the h incident tetrahedra
(here h = 5). We can glue everything inH3 if and only if
z1··· zh = 1 and the arguments sum to2π (right).
If we truncate the tetrahedra as in Figure 14.3 before gluing them,
we get a compact manifoldN ⊂ M with boundary such that M \ N ∼=
∂N × [0, 1). Therefore M is homeomorphic toint(N). □
We will always suppose thatT is oriented and M is connected, so
M = int(N) for some compactN with boundary. Every ideal vertexv in T
is locally a cone over a small triangulated closed surfaceΣ ⊂ M obtained
by truncating the tetrahedra incident tov. We call such aΣ the link of v.
14.1.3. Hyperbolic ideal triangulations.Let T be an oriented ideal
triangulation with tetrahedra∆1, . . . ,∆n of a 3-manifoldM. We now sub-
stitute every ∆i with an ideal hyperbolic tetrahedron and pair their faces
with orientation-reversing isometries. As opposite to the two-dimensional
case, the ideal hyperbolic tetrahedra are not unique (they depend on a
complex modulus zi) but the isometric pairing of their faces is uniquely
determined in virtue of the following.
Proposition 14.1.3.Given two ideal triangles∆ and ∆′, every bijection
between the ideal vertices of∆ and of ∆′ is realised by a unique isometry.
Proof. We see the ideal triangles inH2 and recall that for any two
triples of points in∂H2 there is a unique isometry sending pointwise the
ﬁrst triple to the second. Alternatively, we may use the barycentric de-
composition shown in Figure 7.15-(left). □


## Page 435

14.1. CUSPED THREE-MANIFOLDS 427
If we substitute each∆i with an ideal hyperbolic tetrahedron, we im-
mediately get a well-deﬁned hyperbolic structure onM minus the edges of
T. We now try to extend this hyperbolic structure to the edges: we can
do this if we are able to glue all theh tetrahedra around each edgee inside
H3 as in Figure 14.4. Letz1, . . . , zh be the complex moduli associated to
the edges of the h tetrahedra incident to e. As shown in the ﬁgure, if
z1 · · · zh = 1 and the sum of their argument is2π (and not some higher
multiple of 2π) then all tetrahedra can be glued simultaneously insideH3
and the hyperbolic structure extends naturally toe. If this holds at every
edge e of T then M inherits a hyperbolic structure andT is said to be a
hyperbolic (or geometric) ideal triangulationfor M.
14.1.4. Consistency equations. We want to parametrize the hyper-
bolic structures on M that may be constructed in this way from a ﬁxed
ideal triangulation T. We pick an arbitrary edge for every tetrahedron∆i
and assign to it a complex variablezi with ℑzi > 0, and the other edges
of ∆i are automatically labeled by one of the variableszi, zi−1
zi
, or 1
1−zi
as
indicated in Figure 14.2 (recall that the tetrahedra are oriented). As we
have seen, for every edgee in T we obtain an equation of type
w1 · · · wh = 1
(to which we must add the condition that the sum of the arguments is
2π), where eachwj equals zi, zi−1
zi
, or 1
1−zi
for some i.
We have thus obtained a system ofconsistency equations, with a
variable zi for each tetrahedron and an equationw1 · · · wh = 1 for each
edge. A solutionz = (z1, . . . , zn) to these equations produces a hyperbolic
ideal triangulation and hence a hyperbolic structure onM. Recall that we
assume ℑzi > 0 ∀i.
As in the two-dimensional case, the resulting hyperbolic structure is
not necessarily complete, and to get a complete hyperbolic manifold we
must add more equations.
14.1.5. Completeness equations. Our aim is to construct a com-
plete ﬁnite-volume hyperbolic metric onM. By Corollary 4.2.18 ifM has
such a metric the link of every ideal vertex ofT is a triangulated torus and
identiﬁes a cusp ofM, so we will henceforth suppose that the links of all
vertices are tori. In other wordsM is the interior of a compact 3-manifold
N bounded by somec > 0 tori.
Let z = (z1, . . . , zn) be a solution to the consistency equations, pro-
viding a hyperbolic structure to M. Every boundary torus T ⊂ ∂N is
triangulated by T: every triangle in T is the truncation triangle of some
∆i and hence inherits the complex moduli of the three adjacent edges of
∆i as in Figure 14.5-(left), thus it has a Euclidean structure well-deﬁned
up to similarities. We want to study the following problem: do these Eu-
clidean structures on the triangles glue to form a Euclidean structure on


## Page 436

428 14. HYPERBOLIC THREE-MANIFOLDS
w2
w1
w3
w4
w6
w5
w7 w9
w8 w10
w11
w12
w13 w14
w15
w17
w16
w18w19
w20w21
w23w24
w22
w25
w27
w26
w29
w30
w28
w2
w1
w3
Figure 14.5. Every boundary torusT⊂ ∂N is triangulated,
and each triangle has a Euclidean structure well-deﬁned up
to similarities and inherits three complex moduliw1, w2, w3
at its vertices (left). At every vertex of the triangulation,
the product of the adjacent moduli is1, for instance here
w12w15w16w19w23 = 1. The red path contributes to µ(γ)
with the factor−w30w29w25w24w23w19w20 (right).
w1
w2
w3 w1
w2
w3
Figure 14.6. This move forγ does not aﬀectµ(γ).
T? We will see that M is complete if and only if the answer is “yes” at
each boundary torusT.
Pick γ ∈ π1(T ) = H1(T, Z) ∼= Z2. We representγ as a simplicial path
in the triangulation ofT and then deﬁne µ(γ) ∈ C∗ to be (−1)|γ| times
the product of all the complex moduli thatγ encounters at its right side,
with |γ| being the number of edges ofγ, see Figure 14.5-(right).
Proposition14.1.4. Theelement µ(γ)iswell-deﬁnedand µ: π1(T ) →
C∗ is a homomorphism.
Proof. Two diﬀerent paths forγ are related by moves as in Figure
14.6. This move does not aﬀectµ(γ) since w1w2w3 = −1 and the product
ofthemoduliaroundavertexis +1. Themap µisclearlyahomomorphism.
□
Let C(T ) ⊂ M be a closed collar of the torusT in N, intersected with
M. It is diﬀeomorphic toT × [0, +∞).
Proposition 14.1.5. The following facts are equivalent:
(1) the homomorphism µ is trivial,


## Page 437

14.1. CUSPED THREE-MANIFOLDS 429
(2) there is a Euclidean structure onT that induces all the moduli,
(3) the manifold C(T ) is complete and contains a truncated cusp.
Proof. The equivalence (1)⇔(2) is a simple exercise. If (2) holds we
may choose small horosections of all the hyperbolic tetrahedra incident to
v that match to give a Euclidean torusT∗ ⊂ C(T ). The non-compact
part of C(T ) bounded by T∗ is a truncated cusp with baseT∗ and is thus
complete. On the other hand, if (1) does not hold, there is a path of
horosections from a tetrahedron to itself which ends at a bigger height
and we conclude that C(T ) is not complete as in the two-dimensional
case, see the proof of Proposition 7.4.8. □
Corollary 14.1.6. The hyperbolic manifold M is complete ⇐ ⇒µ is
trivial for every torusT ⊂ ∂N.
Fix for every boundary torusT two generatorsm, l for H1(T, Z). The
homomorphism µ is trivial ⇐ ⇒the following two equations are satisﬁed:
µ(m) = 1 , µ (l) = 1 .
Each equation is of some type w1 · · · wk = 1 . We get two equations
for each of the c boundary tori and hence2c equations in total, called
the completeness equations for the triangulation T. We summarise our
discussion:
Proposition 14.1.7. Let T be an ideal triangulation ofM = int( N)
with n tetrahedra and ∂N consisting of c tori. If a pointz = (z1, . . . , zn)
with ℑzi > 0satisﬁesthe n consistencyequationsandthe 2c completeness
equations, then M admits a ﬁnite-volume complete hyperbolic metric.
14.1.6. Examples. On a triangulation T, the valence of an edge e
is the number of tetrahedra incident to it, counted with multiplicity. The
simplest kinds of solutions arise in the following construction.
Proposition 14.1.8. Let T be a triangulation where all edges have
valence six. The point(e
πi
3 , . . . , e
πi
3 ) is a solution of both the consistency
and completeness equations and deﬁnes a hyperbolic structure where all
the ideal tetrahedra are regular.
Proof. Note that whenz = e
πi
3 the tetrahedron is regular and we get
z = z − 1
z = 1
1 − z = e
πi
3 .
Therefore the moduli aree
πi
3 everywhere. The consistency equations are
satisﬁedsince (e
πi
3 )6 = 1 andalsothecompletenessequationsare, because
by assigning length 1 to each edge of the triangulation of a torusT we
get a global Euclidean structure onT tessellated into isometric equilateral
triangles. □


## Page 438

430 14. HYPERBOLIC THREE-MANIFOLDS
F
J
J
RP
F
P R
Figure 14.7. An oriented triangulation with 2 tetrahedra:
faces with the same letterF, J, P, R are paired with a simpli-
cial map that matches the letters. We get two edges with
valence six (the red and white dots).
P P
FF
J
L
RY G G
QQ
J
L
RY
Figure 14.8. By pairing the faces of two ideal regular octa-
hedra as shown we get a cusped complete hyperbolic three-
manifold. Faces with the same letter are paired with the
unique isometry that matches the letters. We get six edges
with valence four (marked with coloured dots).
Figure 14.7 shows an ideal triangulation with two tetrahedra and two
edges, each with valence six: this deﬁnes a cusped ﬁnite-volume com-
plete hyperbolic three-manifoldM that decomposes into two regular ideal
tetrahedra.
Every ﬁnite covering ˜M of M is another example: the ideal triangu-
lation T lifts to an ideal triangulation˜T where all the edges have valence
six. Sincethefundamentalgroup π1(M)isresiduallyﬁnite(seeProposition
4.3.9) there are plenty of such coverings.
Exercise 14.1.9. Construct a triangulation T with one tetrahedron
and one edge. The edge has valence six and hence the construction of
Proposition 14.1.8 produces a cusped hyperbolic manifold. Note however


## Page 439

14.1. CUSPED THREE-MANIFOLDS 431
that the triangulation is not orientable and a cusp section is a Klein bottle!
This non-orientable hyperbolic manifold is called theGieseking manifold.
Similar kinds of “regular” examples may be constructed using some
other platonic solids. The ideal regular octahedron is particularly inter-
esting and useful because it is right-angled, see Section 3.2.4. If we
pick ﬁnitely many oriented regular ideal octahedra O1, . . . , Oh and pair
orientation-reversingly their triangular faces in a way that every resulting
edgehasvalencefour, weconstructaﬁnite-volumecuspedhyperbolicman-
ifold M because 4 × π
2 = 2π. An example with two octahedra is shown in
Figure 14.8.
We can further decompose each regular ideal octahedron into four
non-regular ideal tetrahedra (there are three ways to do this: you must
choose a diagonal connecting two opposite vertices) to get an ideal trian-
gulation T for M. The moduli of each such tetrahedron are
i , 1
1 − i = 1 + i
2 , i − 1
i = 1 + i
and they satisfy the consistency and completeness equations in a less trivial
way than before. The edges of the resulting triangulation have varying
valences 4, 6, and 8.
14.1.7. SnapPea. Itisofcoursehardtoconstructidealtriangulations
by hand, except in some very symmetric and simple cases like the one
just described. And it is even more diﬃcult to solve the consistency and
completeness equations.
There is a beautiful computer program that does all this for you! This
is SnapPea, written by Jeﬀ Weeks in the 1980s. Using SnapPea you can
draw any link diagramL and the program immediately constructs an ideal
triangulation for the complement ofL in S3. Then it uses the Newton
method to ﬁnd a numerical solution to the consistency and completeness
equations: the solution is only numerical, but then one can use somea
posteriori argument to conﬁrm it rigorously.
For instance, if we draw the trefoil knot, SnapPea triangulates its
complement and ﬁnds no solution to the equations: this is not surprising
since its complement is Seifert and hence not hyperbolic, see Proposition
11.2.5.
If we draw the ﬁgure-eight knot in Figure 14.9-(left), SnapPea con-
structs precisely the ideal triangulation of Figure 14.7, and we have hence
discovered that the complement of the ﬁgure-eight knot is hyperbolic and
decomposes into two ideal regular tetrahedra.
We may draw links with many components, and discover for instance
that the complement of the Borromean rings from Figure 14.9-(right) is
hyperbolic and decomposes into two right-angled ideal regular octahedra.
We can also Dehn-ﬁll some boundary components to obtain more cusped
manifolds that are not link complements inS3.


## Page 440

432 14. HYPERBOLIC THREE-MANIFOLDS
Figure14.9. Theﬁgure-eightknotandtheBorromeanrings
arehyperbolic, that is their complements admit complete hy-
perbolic metrics.
tetrahedra 1 2 3 4 5 6 7
1 cusp 2 9 52 223 913 3388
2 cusps 4 11 48 162
3 cusps 1 2
Table 14.1. The number of cusped orientable hyperbolic
three-manifolds that can be triangulated with at most 7 ideal
tetrahedra.
SnapPea can calculate numerically a wealth of geometrical invariants
with some precision, including the volume and the ﬁrst segment of the
geodesicspectrum. Itcanmanipulatemanifolds(Dehn-ﬁlling, drillingalong
short simple closed geodesics, ﬁnite covers) and change triangulations. It
provides beautiful pictures of the Dirichlet domain and of the cusp shapes.
Is SnapPea guaranteed to ﬁnd a hyperbolic structure onM if there
is one? No, it is not, although in practice it succeeds most of the time.
The fact thatM is hyperbolic does not guarantee that there is a solution
to Thurston’s equations on a given triangulationT, and the existence of
a solution does not guarantee that SnapPea will be able to ﬁnd it.
We note that for most ideal triangulationsT of a hyperbolicM there
is no solution to Thurston’s equations, and SnapPea is clever enough to
modify T to increase the probability to ﬁnd one. In all known examples,
a cusped hyperbolicM admits at leastone geometric ideal triangulation,
but whether this holds true for all cusped hyperbolic 3-manifoldsM is still
an open question.
14.1.8. Cusped census. As with knots tabulations, topologists have
used computers to list the cusped hyperbolic manifolds that can be trian-
gulated with few ideal tetrahedra.


## Page 441

14.1. CUSPED THREE-MANIFOLDS 433
Name Volume Homology Symmetry SG C
M21 2.0298832128 Z D4 1.09 a
M22 2.0298832128 Z + Z5 Z2 + Z4 0.86 a
M31 2.5689706009 Z + Z5 D4 0.65 c
M32 2.5689706009 Z + Z3 D4 0.65 c
M33 2.6667447834 Z + Z2 D4 0.63 c
M34 2.6667447834 Z + Z6 D4 0.63 c
M35 2.7818339124 Z Z 2 0.51 c
M36 2.8281220883 Z D4 0.56 c
M37 2.8281220883 Z Z 2 0.58 c
M38 2.8281220883 Z + Z7 D4 0.56 c
M39 2.9441064867 Z Z 2 0.43 c
Table 14.2. The 1-cusped orientable hyperbolic manifolds
that can be triangulated with at most 3 ideal tetrahedra.
Thename Mij indicatesthat themanifoldistheonewith j-th
smallest volume among those that can be triangulated withi
tetrahedra. The column SG shows the length of the shortest
closed geodesic (volume and SG values are truncated after
few digits). The column C indicates whether the manifold is
achiral (a) or chiral (c), that is if it admits an orientation-
reversing isometry or not.
Name Volume Homology Symmetry SG C
M42
1 3.6638623767 Z + Z D8 1.06 c
M42
2 3.6638623767 Z + Z D8 0.96 c
M42
3 4.0597664256 Z + Z D12 0.86 c
M42
4 4.0597664256 Z + Z D8 0.86 a
Table 14.3. The 2-cusped orientable hyperbolic manifolds
that can be triangulated with 4 ideal tetrahedra. The name
Mi k
j indicates the k-cusped manifold withj-th smallest vol-
ume among those that are triangulated withi tetrahedra.
The number of cusped hyperbolic orientable manifolds that can be
ideally triangulated with n tetrahedra (and not less thann) is written in
Table 14.1 for alln ⩽ 7. The 1-cusped manifolds withn = 2, 3 are listed
with more detail in Table 14.2 and the 2-cusped ones withn = 4 are in
Table 14.3. These tables were produced by Callahan – Hildebrand – Weeks
[10] in 1999 via a computer enumeration.
The ﬁgure-eight knot complement isM21, while M22 is another hy-
perbolic manifold that decomposes into two regular ideal tetrahedra: it
is not a knot complement in S3 since its homology is not Z, but it is


## Page 442

434 14. HYPERBOLIC THREE-MANIFOLDS
Figure 14.10. A remarkable sequence of hyperbolic links.
These are the ﬁgure eight knot, the Whitehead link, and
some particularchain linkswith 3,4,5 components.
the complement of a knotK in the lens spaceL(5, 1), called theﬁgure-
eight knot sibling. This knot is obtained by performing a (−5)-surgery
on one component of theWhitehead link shown in Figure 14.10: since
this component is trivial, the surgered manifold isL(5, 1) and the other
unsurgered component is our knotK. Both manifoldsM21 and M22 have
volume 2.0298832128 . . .since the volume of the ideal regular tetrahedron
is 3Λ
(π
3
)
= 1.0149416064 . . .
The manifold M42
1 is the Whitehead link complement, that can be
obtained by pairing the faces of a single ideal regular octahedronO. Indeed
the volume ofO is 8Λ
(π
4
)
= 3.6638623767 . . .
After theﬁgure eightknot andthe Whiteheadlink, anotable sequence
of hyperbolic links inS3 with increasing number of components is shown
in Figure 14.10. Their complements are conjectured to be the smallest
hyperbolic manifolds with i = 1 , . . . ,5 cusps (see the references at the
end of the chapter).
14.1.9. Hyperbolic knots. How many hyperbolic knots are there in
the three-sphere? There are in fact inﬁnitely many hyperbolic knots, and
inﬁnitely many non-hyperbolic knots. Geometrisation translates hyperbol-
icity into an appealing topological condition:
Theorem 14.1.10. A knot K ⊂ S3 is either a torus knot, a satellite
knot, or a hyperbolic knot.
Proof using geometrisation. Proposition 11.2.11 says thatK is either
a torus knot, a satellite knot, or has simple complementM. In the latter
case M is hyperbolic by Corollary 12.9.6. □
Notethatthethreecasesaremutuallyexclusive. Thenumberofprime
knots with c ⩽ 14 crossings in each of the three classes is shown in Table
14.4, taken from Hoste – Thistlethwaite – Weeks [29]: the table shows
a strong predominance of hyperbolic knots, but it is unknown whether it
persists also whenc tends to inﬁnity.


## Page 443

14.2. CLOSED HYPERBOLIC THREE-MANIFOLDS 435
c 3 4 5 6 7 8 9 10 11 12 13 14
torus 1 0 1 0 1 1 1 1 1 0 1 1
satellite 0 0 0 0 0 0 0 0 0 0 2 2
hyperbolic 0 1 1 3 6 20 48 164 551 2176 9985 46969
Table 14.4. The number of torus, satellite, and hyperbolic
prime knots withc crossings, for allc ⩽ 14.
14.2. Closed hyperbolic three-manifolds
We have described in Section 14.1 a method to construct cusped
ﬁnite-volume hyperbolic three-manifolds. How can we now build some
closed hyperbolic three-manifolds?
Following the same path, we could try to parametrizecompact hyper-
bolic tetrahedra via some variables, and then encode the isometric gluings
of their faces via some equations. However, it is really hard to parametrize
compact tetrahedra and their gluings, and nobody has ever constructed
any closed hyperbolic three-manifold in this way!
The usual procedure for building closed hyperbolic three-manifolds
consists of using (again) ideal tetrahedra: we start with a cusped manifold,
and then we slightly modify the completeness equations to allow some
appropriate Dehn-ﬁlling of some (or all) cusps.
14.2.1. Dehn ﬁlling parameters.We now consider an orientable 3-
manifold M = int(N) where N is compact and∂N = T1 ⊔ . . .⊔ Tc consists
of tori. For simplicity we will always assume that eachTi is incompressible,
so that π1(Ti ) = Z × Z injects in π1(N) = π1(M) for all i.
Weﬁxonceforalltwogenerators mi , li of π1(Ti )foreach i = 1, . . . , c.
A Dehn ﬁlling parameter s = ( s1, . . . , sc) is a sequence where eachsi is
either a pair (p, q) of coprime integers or the symbol∞. It is useful to
think of si as a point in the two-sphereS2 = R2 ∪ {∞}.
A Dehn ﬁlling parameters determines a Dehn ﬁlling ofN as follows:
for every i, if si = ( p, q) we ﬁll Ti by killing the slope pmi + qli, while
if si = ∞ we do nothing. The result is a new compact manifold, whose
interior we denote byMﬁll, that may be closed (if there are no∞ in s) or
may be bounded by some tori.
We ﬁx a Dehn ﬁlling parameters, producing a ﬁlled manifoldMﬁll.
14.2.2. The modiﬁed equations.Let T be an oriented ideal triangu-
lation for M. We now describe some equations similar to that of Section
14.1, whose solutions now identify hyperbolic structures onMﬁll instead of
M. The equations of course will depend on the Dehn ﬁlling parameters,
since the manifoldMﬁll does.


## Page 444

436 14. HYPERBOLIC THREE-MANIFOLDS
The triangulation T consists of some n tetrahedra ∆1, . . . ,∆n; we
choose an edge in each ∆i and we assign it the variable zi ∈ C with
ℑzi > 0 as we did in Section 14.1.
The edges of all tetrahedra are coloured with modulizi, 1
1−zi
, zi−1
zi
that
lie in the upper half-plane and as such may be written in polar coordinates
as ρe i θ with θ ∈ (0, π). It is convenient to consider these variables as
elements of the multiplicative group
˜C∗ =
{
ρei θ ⏐⏐ ρ ∈ R>0, θ ∈ R
}
that covers C∗ and is isomorphic toC via the mapexp : C → ˜C∗.
Every edge ofT furnishes aconsistency equationin ˜C∗ as described
in Section 14.1, of the form
w1 · · · wh = e2πi .
Note that e2πi ̸= 1 in ˜C∗, so by interpreting the consistency equations in
˜C∗ we have also incorporated the request that all angles sum to2π.
Let z = ( z1, . . . , zn) be a solution to the consistency equations. We
have deﬁned in Proposition 14.1.4 a homomorphismµ: π1(Ti ) → C∗ for
every boundary torusTi, and we now lift it to˜C∗.
Deﬁnition14.2.1. Representeachnon-trivial γ ∈ π1(Ti )asasimplicial
path that lifts to an embedded path in the universal cover ofTi. Deﬁne
˜µ(γ) to bee−|γ|πi times the product of all the moduli thatγ encounters at
its right side, considered now as elements in the group˜C∗. If γ is trivial,
set ˜µ(γ) = 1.
Exercise 14.2.2. The element˜µ(γ) ∈ ˜C∗ is well-deﬁned and
˜µ: π1(Ti ) → ˜C∗
is a homomorphism.
We now deﬁne some newcompleteness equationsat Ti for each i =
1, . . . , cthat depend on the Dehn ﬁlling parametersi. There are two cases
to consider for eachi = 1, . . . , c. If si = ∞, the completeness equations
relative to Ti are the two equations
µ(mi ) = µ(li ) = 1
already considered in Section 14.1.5. (If we wish, we can substitute them
with the equations˜µ(mi ) = ˜µ(li ) = 1. Both choices will work.)
If si = (p, q) we deﬁne one new completeness equation
˜µ(mi )p · ˜µ(li )q = e2πi .
The total number of completeness equations therefore varies fromc to 2c,
depending on the number of cusps that are left unﬁlled. The main goal of
this section is to prove the following.


## Page 445

14.2. CLOSED HYPERBOLIC THREE-MANIFOLDS 437
Theorem 14.2.3. A solution z = ( z1, . . . , zn) to the consistency and
completeness equations determines a hyperbolic structure on M whose
completion M is a complete hyperbolic manifold diﬀeomorphic toMﬁll.
If s ̸= (∞, . . . ,∞) the solutionz determines an incomplete hyperbolic
metric on M, and the miracle here is that the completionM is another
hyperbolic manifold!
We note that both the consistency and completeness equations are
of type w1 · · · wh = 1 or e2πi. The rest of this section is mainly devoted
to the proof of Theorem 14.2.3. We start with a short discussion that
introduces (truncated) solid tori with cone angles: these objects will be
crucial in the proof of the theorem.
14.2.3. The inﬁnite branched covering.Let l ⊂ H3 be any line and
recall the universal cover
π : X − →H3 \ l
already considered in Section 3.5.4 when we introduced manifolds with
cone singularities. The manifoldX is incomplete and its completionX is
obtained by adding a copy˜l of l.
We use the half-space model and representl as the vertical axis, so
that H3 \ l = C∗ × R>0 and we can write
X = ˜C∗ × R>0.
Note that ˜C∗ acts on X via isometries: the elementw ∈ ˜C∗ acts as
(z , t) ↦− →(w z ,|w |t).
When w = eαi this is the rotation of angleα that was used to deﬁne
hyperbolic cone manifolds. When|w | ̸= 1 the map projects to a hyperbolic
isometry of H3 with axis l and translation distancelog |w |.
14.2.4. Tubes with cone angles.A non-trivial discrete group Γ <
˜C∗ ∼= C is either isomorphic toZ or toZ × Z; it acts freely onX and (not
necessarily freely!) on the line˜l. Concerning Z × Z, there are two cases
to consider.
If Γ = Z × Z contains a non-trivial rotation, it is generated by some
maps
(z , t) ↦→ (eαi z , t), (z , t) ↦→ eλ(eβi z , t)
with λ ̸= 0, anditactson ˜l astranslationswhosestepisanintegermultiple
of λ. The quotient X/Γ is naturally a complete hyperbolic manifold with
cone angles: it is an open solid torus with singular locus a closed geodesic
of length |λ| and with cone angleα. We call it atube with cone angle
α. When α = 2 π we get an ordinary tube as in Section 4.1.2, with no
singular points.
If Γ = Z × Z does not contain a rotation, it acts on˜l as an indiscrete
group of translations and hence X/Γ is not a hyperbolic manifold with
cone angles (it is not even Hausdorﬀ). We also note thatX/Γ is not the


## Page 446

438 14. HYPERBOLIC THREE-MANIFOLDS
completion of the hyperbolic manifoldX/Γ in that case, but it only maps
surjectively onto it: the completion adds a single point toX/Γ.
Tubeshavenaturaltruncations. Forevery R > 0the R-neighbourhood
NR(˜l) ⊂ X of the singular line˜l projects onto theR-neighbourhood NR(l)
of l, which is a Euclidean cone with axisl. The group Γ preserves NR(˜l)
and in the ﬁrst case its quotient is a truncated tube with cone angles.
14.2.5. Incomplete solutions. We now go back to our triangulation
T, and we letz = (z1, . . . , zn) be a solution to the consistency equations
for T. The solution z furnishes a hyperbolic metric onM, which might
not be complete: we want to understand the metric completion M of
M. Recall that M is diﬀeomorphic to the interior of a compactN whose
boundary consists ofc tori.
We pick a boundary torusT ⊂ ∂N and deﬁne acollar C(T ) ⊂ M of T
to be the intersection of a closed collar ofT in N with M. We know from
Proposition 14.1.5 that when µ: π1(T ) → C∗ is trivial there is a collar
C(T ) isometric to a truncated cusp, that is the truncated quotient ofH3
by a discreteZ × Z of parabolic elements.
When µ is not trivial, we now show that a similar (but diﬀerent) con-
ﬁguration arises: there is a collarC(T ) isometric to a truncated quotient
of the hyperbolic manifoldX considered above by a discreteZ × Z. The
crucial diﬀerence is thatC(T ) now is incomplete, becauseX is. To prove
this fact we use developing maps and holonomies.
The hyperbolic ideal triangulation T of M determined by z lifts to
a hyperbolic ideal triangulation ˜T for the universal cover ˜M → M with
inﬁnitely many tetrahedra. The triangulated torusT is the link of a vertex
v of T. We ﬁx a lift˜v of v in ˜T, and the link of˜v is a triangulated surface
˜T that covers T. Since T is incompressible, π1(T ) injects in π1(M) and
hence ˜T is a plane.
Recall from Section 3.5.3 that there is a developing mapD : ˜M → H3
and a holonomy ρ: π1(M) → Isom+(H3), and both are determined once
we deﬁneD on an ideal tetrahedron in˜T. We choose for our convenience
one ideal tetrahedron incident to˜v and we map it to the half-space model
H3 with an isometryD that sends ˜v to ∞.
The developing map D sends all tetrahedra of ˜T incident to ˜v to
vertical ideal tetrahedra inH3 with one vertex at∞. If γ ∈ π1(T ), then
ρ(γ) permutes these tetrahedra and ﬁxes∞. Therefore the holonomy ρ
sends π1(T ) = Z × Z to a group of commuting elements inPSL2(C) ﬁxing
∞. Every such element may be written asz ↦→ az + b, and there are two
possibilities:
• the group consists of translationsz ↦→ z + b,
• the group ﬁxes a pointp ∈ C.
In the second case we may supposep = 0 up to translating everything,
so the maps are all of typez ↦→ az. Not surprisingly, the holonomyρ is
tightly connected with the homomorphismµ: π1(T ) → C∗.


## Page 447

14.2. CLOSED HYPERBOLIC THREE-MANIFOLDS 439
Exercise 14.2.4. The derivativeρ(γ)′, that is the coeﬃcient1 or a in
the above examples, equalsµ(γ).
We now suppose thatµ is non-trivial and hence the ﬁrst possibility
is excluded: the group ρ(π1(T )) consists of maps z ↦→ az and we can
identify ρ with µ. The map D induces a developing mapD : ˜T → C with
holonomy µ.
Proposition 14.2.5. The image D( ˜T ) misses the origin.
Proof. The vector ﬁeld v(z) = z on C is µ(π1(T ))-invariant and
hence pulls-back via D to a vector ﬁeld on T. If 0 ∈ D( ˜T ) then this
vector ﬁeld onT has some zeroes, all with index1: a contradiction since
χ(T ) = 0. □
Let St˜v ⊂ ˜M be the open star of ˜v, that is the union of all ideal
tetrahedra incident to ˜v, with the faces not incident to˜v removed: it is
homeomorphic to ˜T × (0, +∞) and hence simply connected. The propo-
sition implies that the restrictionD|St˜v of the developing map misses the
entire vertical linel ⊂ H3 above the origin and hence lifts to a map
˜D : St ˜v − →X.
Likewise the holonomyρ at π1(T ) lifts to a holonomy
˜ρ: π1(T ) − →˜C∗ < Isom+(X)
which is of course related to the homomorphism˜µ: π1(T ) → ˜C∗.
Exercise 14.2.6. We have˜ρ = ˜µ.
After this long discussion, we can ﬁnally discover how a collarC(T )
of T looks like.
Proposition 14.2.7. If µ is non-trivial then˜µ is injective with discrete
image. There is a collarC(T ) that is isometric to a truncation ofX/Im ˜µ.
Proof. We have deﬁned a lifted developing map˜D : St ˜v → X with
holonomy ˜ρ = ˜µ.
Let ∆i1 , . . . ,∆ih be the tetrahedra incident tov (with multiplicities),
and let ˜∆i1 , . . . , ˜∆ih be any lifts in ˜T incident to ˜v. We ﬁx a suﬃciently
small R0 > 0 such that the coneNR0(˜l) ⊂ X does not intersect the lower
faces of the tetrahedra˜D(˜∆i1), . . . , ˜D(˜∆ih ), see Figure 14.11-(left). Since
NR0(˜l) is ρ(π1(T ))-invariant, it does not intersect the lower faces of any
ideal tetrahedron in the image of ˜D, and hence it intersects every ideal
tetrahedron in a curved triangle as in Figure 14.11-(right).
We deﬁne ˜C(T ) ⊂ ˜M as the preimage ofNR0(˜l) along ˜D. By con-
struction it is aπ1(T )-invariant submanifold that projects to a submanifold
C(T ) ⊂ M. This submanifold intersects every tetrahedron incident tov


## Page 448

440 14. HYPERBOLIC THREE-MANIFOLDS
0 0
l l
Figure 14.11. For suﬃciently smallR > 0 the cone neigh-
bourhood NR(˜l) of ˜l does not intersect the lower faces of
the developed images of˜∆i1 , . . . , ˜∆ih (left). These tetrahe-
dra intersect∂NR(˜l) into triangles that glue up to determine
a torus TR in C(T ) (right).
into a cone neighbourhood ofv and is hence a collar forT. We want to
prove that the map
˜D : ˜C(T ) − →NR0(˜l) \ ˜l
is an isometry. Being a local isometry, it suﬃces to prove that it is injective
and surjective. We prove this using the natural foliation ofNR0(˜l) \ ˜l into
the sheets ∂NR(˜l) with R ⩽ R0.
For everyR ⩽ R0 the map ˜D restricts to a local isometry of surfaces
˜DR : ˜TR → ∂NR(˜l)
where ˜TR = ˜D−1(∂NR(˜l)) is π1(T )-invariant and covers a torusTR ⊂ M
parallel to T. Since TR is compact, the cover˜TR is complete. Therefore
˜DR is a covering by Proposition 1.2.19 and is hence an isometry since
∂NR(˜l) is simply-connected. In particular it is a bijection for allR < R 0,
and hence ˜D is a bijection.
Since ˜D is an isometry, its holonomy˜ρ is discrete and injective and
C(T ) ∼=
(
NR0(˜l) \ ˜l
)
/˜ρ(π1(T )).
The proof is complete. □
14.2.6. The completion. We now have an isometric model for the
collar C(T ) of T and we study its completion. This analysis will lead to a
proof of Theorem 14.2.3.
We suppose thatµ is non-trivial and henceC(T ) is not complete. By
Proposition 14.2.7, the completionC(T ) of C(T ) depends on theZ × Z
group Im ˜µ < ˜C∗ acting on X: see Section 14.2.4 where we deﬁned in
particular the (truncated) tubes with cone angles.


## Page 449

14.2. CLOSED HYPERBOLIC THREE-MANIFOLDS 441
Proposition 14.2.8. If Im ˜µ contains a non-trivial rotation thenC(T )
is a truncated tube with some cone angle; otherwise it is a one-point
compactiﬁcation of C(T ).
In the ﬁrst case, there are generatorsγ, η for π1(T ) such that
˜µ(γ) = eαi , ˜µ(η) = eλ+βi
and the core geodesic ofC(T ) has cone angleα and length|λ|. The curve
γ is a meridian of the truncated tube.
Proof. We know thatC(T ) is isometric to a truncation ofX/Im ˜µ and
we apply the discussion of Section 14.2.4. □
We now look atM globally: every boundary torus Ti ⊂ ∂N has its
own homomorphismsµ and ˜µ.
Corollary 14.2.9. Suppose that at every boundary torusTi ⊂ ∂N one
of the following holds:
(1) µ is trivial, or
(2) there is a primitiveγi ∈ π1(Ti ) such that ˜µ(γi ) = eαi i.
The completion M is a complete hyperbolic cone manifold obtained by
Dehn ﬁlling the slopes γi. The core of the i-th Dehn ﬁlling is a closed
geodesic with cone angleαi.
Theorem 14.2.3 now follows immediately.
Proof of 14.2.3. The equation ˜µ(mi )p ˜µ(li )q = e2πi implies that ˜µ(pmi +
qli ) = e2πi and therefore the completion is a hyperbolic manifold (with no
cone angles sinceα = 2π) diﬀeomorphic toMﬁll. □
14.2.7. Generalised Dehn ﬁlling invariants.We have proved Theo-
rem 14.2.3 and we now make some comments that will be useful in the
next chapter. Letz be a solution of the consistency equations and consider
a boundary torusTi ⊂ ∂N with ﬁxed generatorsmi , li for π1(T ).
Proposition 14.2.10. If µ is non-trivial, there is a unique(p, q) ∈ R2
such that ˜µ(mi )p ˜µ(li )q = e2πi.
Proof. We know from Proposition 14.2.7 that˜µ is injective and has
discrete image. Therefore ˜µ(mi ) and ˜µ(li ) form a basis of˜C∗ considered
as a R-vector space. □
We now deﬁne thegeneralised Dehn ﬁlling invariant (p, q) ∈ S2 =
R2 ∪ {∞} of the solutionz at the torusTi to be:
• (p, q) = ∞ if µ is trivial,
• the (p, q) ∈ R2 from Proposition 14.2.10 ifµ is non-trivial.
If (p, q) = ∞ there is a complete collarC(Ti ) of Ti that is a truncated
cusp; if (p, q) ∈ R2 then Proposition 14.2.7 provides a nice incomplete
collar C(Ti )and Proposition 14.2.8 tells us everything about its completion
C(Ti ). Namely, the following holds:


## Page 450

442 14. HYPERBOLIC THREE-MANIFOLDS
• if p
q ∈ Q ∪ {∞} then (p, q) = k(r, s) for a unique real number
k > 0 and coprime integers(r, s), andC(Ti ) is a solid torus with
meridian r m+ sl, isometric to a truncated tube with cone angle
2π
k ;
• if p
q ̸∈ Q∪{∞} then C(Ti ) is the much less interesting one-point
compactiﬁcation.
We deduce the following:
• if (p, q) are coprime integers thenC(Ti ) is a standard truncated
tube; if this holds at all boundary toriTi then M is a hyperbolic
manifold;
• if (p, q) are integers then k is a natural number and the cone
angle divides2π; if this holds at all boundary toriTi then M may
be interpreted as an orbifold thanks to Proposition 3.6.18;
• if p
q ∈ Q ∪ {∞} at all boundary toriTi then M is a hyperbolic
cone manifold.
Corollary 14.2.11. If the generalised Dehn ﬁlling invariants(p, q) at
each Ti are either∞ or coprime integers, the completionM is a complete
hyperbolic manifold obtained by(p, q)-Dehn ﬁlling the cusps of the second
type.
We end this discussion by calculating(p, q) explicitly. We deﬁne
ui = log ˜µ(mi ), v i = log ˜µ(li )
and ﬁnd the following.
Proposition 14.2.12. If µ is non trivial we have
p = −2π ℜvi
ℑ( ¯ui vi ) , q = 2π ℜui
ℑ( ¯ui vi ) .
Proof. The pair (p, q) is the unique solution of
(20) pui + qvi = 2πi
when ui , vi ̸= 0, or is ∞ otherwise. Note that ui = 0 ⇔ vi = 0. The
relation
iℑ( ¯ui v) = −(ℜvi )ui + (ℜui )vi
implies easily that the pair(p, q) stated above is a solution to (20). □
14.2.8. Closed census.The Lickorish-Wallace Theorem 11.3.15 says
that every closed orientable three-manifold M is the result of a Dehn
surgery along some linkL ⊂ S3, and as such it can be easily presented
to SnapPea. The program tries to solve numerically the consistency and
completeness equations forM, based on some ideal triangulation for the
complement of L.
If it succeeds to ﬁnd a solutionz, the closed manifoldM is hyperbolic
and SnapPea calculates numerically various geometric invariants of M:
the volume (which is just the sum of the volumes of the ideal tetrahedra),


## Page 451

14.2. CLOSED HYPERBOLIC THREE-MANIFOLDS 443
Name Volume Homology Symmetry SG C
Vol1 0.94270736 Z5 + Z5 D12 0.5846 c
Vol2 0.98136883 Z5 D4 0.5780 c
Vol3 1.01494161 Z3 + Z6 S16 0.8314 a
Vol4 1.26370924 Z5 + Z5 D8 0.5750 c
Vol5 1.28448530 Z6 D4 0.4803 c
Vol6 1.39850888 {e} D4 0.3661 c
Vol7 1.41406104 Z6 D4 0.7941 c
Vol8 1.41406104 Z10 D4 0.3648 c
Vol9 1.42361190 Z35 D4 0.3523 c
Vol10 1.44069901 Z3 D4 0.3615 c
Table 14.5.The ten closed hyperbolic three-manifolds with
smallestvolumeknown. Here S16 isthesemidihedralgroupof
order 16 with presentation⟨x , y| x 8 = y 2 = 1, y−1x y = x 3⟩,
SG indicates the length of the shortest geodesics (volume
and SG values are truncated after few digits), and C indi-
cates whether the manifold is achiral (a) or chiral (c), that
is whether it admits an orientation-reversing isometry or not.
the length of the core geodesics of the ﬁlling solid tori (using Proposition
14.2.8), a segment of the geodesic spectrum, a Dirichlet domain, etc.
Various closed manifoldsM have been tested and listed, and the ten
closed hyperbolic three-manifolds of smallest volume known today are in
Table 14.5, taken from Hodgson – Weeks [28].
14.2.9. References. Thematerialcontainedinthischapteroriginated
from Thurston’s notes [56] and Neumann – Zagier [42], see also Benedetti
– Petronio [4]. The program SnapPea is freely available and can now be
used via a Python interface [15]. We have used the computer censuses
of Callahan – Hildebrand – Weeks [10], Hoste – Thistlethwaite – Weeks
[29], and Hodgson – Weeks [28].
It is conjectured in [1] that each link in Figure 14.10 withc = 1, . . . ,5
cusps has minimum volume among orientable hyperbolic manifolds withc
cusps. This has been proved forc = 1 by Cao and Meyerhoﬀ [11], for
c = 2 by Agol [1], and forc = 4 by Yoshida [61]. The manifold Vol1 from
Table 14.5 is called theFomenko – Matveev – Weeks manifoldand has
indeed smallest volume among all complete hyperbolic three-manifolds by
Gabai – R. Meyerhoﬀ – P. Milley [22].


## Page 452

[No extractable text on this page]


## Page 453

CHAPTER 15
Hyperbolic Dehn ﬁlling
WehavecompletelyclassiﬁedinChapter10theclosedthree-manifolds
that belong to the six Seifert geometries, and now we long for a similar
catalogue that displays all the closed hyperbolic three-manifolds that exist
in nature. Is there something like a “name” to assign to each closed hy-
perbolic three-manifold, together with some reasonable tables that list all
possible names?
There is not yet one such thing, and we do not know if there will ever
be one: we still do not understand hyperbolic three-manifolds globally.
The main diﬃculty is that there are really many hyperbolic three-manifolds
around, so many that topologists often say informally that “most three-
manifolds are hyperbolic.”
This folk sentence is supported by a fundamental theorem that we
prove in this chapter, theHyperbolic Dehn ﬁlling Theorem, which says
roughly that by Dehn-ﬁlling generically a cusped hyperbolic three-manifold
we still get a hyperbolic manifold.
15.1. Introduction
Itsometimeshappensinthree-dimensionaltopology,thatatopological
or geometric property of a manifold is preserved under Dehn ﬁllings, with
only few exceptions. For instance, the Dehn ﬁlling of a Seifert manifold
is again a Seifert manifold, with only one exception (a ﬁbre-parallel Dehn
ﬁlling gives a connected sum of Seifert manifolds, see Corollary 10.3.44).
The most striking appearance of this phenomenon is the Hyperbolic
Dehn ﬁlling Theorem, proved by Thurston at the end of the 1970s. This
theorem says roughly that “most” Dehn ﬁllings of a cusped hyperbolic
manifold are still hyperbolic.
15.1.1. Generalised Dehn ﬁlling parameters.In all this chapter, we
consider a compact oriented three-manifoldN with ∂N = T1 ⊔ . . . ⊔ Tc
consisting of tori, and we ﬁx generatorsmi , li for every π1(Ti ).
Leta generalisedDehnﬁllingparameter s = (s1, . . . , sc)beasequence
where each si is either the symbol∞ or a rationally related pair of real
numbers (p, q) = ( kp′, kq′) = k(p′, q′) where k > 0 is real and(p′, q′) are
coprime integers. We think atsi as lying in the two-sphereS2 = R2 ∪{∞}.
445


## Page 454

446 15. HYPERBOLIC DEHN FILLING
A generalised Dehn ﬁlling parameters determines a Dehn ﬁllingNﬁll
of N as follows: for everyi, if si = k(p′, q′) we ﬁll Ti by killing the slope
p′mi + q′li, while ifsi = ∞ we do nothing. The result is a new compact
manifold, that may be closed (if there are no∞ in s) or be bounded by
some tori. We also mark the cores of the ﬁlled solid tori with the label
αi = 2π
k > 0.
15.1.2. TheHyperbolicDehnﬁllingTheorem. Thischapterismainly
devoted to the proof of the following theorem.
Theorem 15.1.1. Let M = int( N) be a complete orientable ﬁnite-
volume cusped hyperbolic three-manifold. There is a neighbourhoodU of
(∞, . . . ,∞) in S2 × . . . × S2 such that for every generalised Dehn ﬁlling
parameter s ∈ U the interior Mﬁll of the manifoldNﬁll obtained by Dehn
ﬁlling N along s admits a ﬁnite-volume complete hyperbolic structure with
cone angles.
The cores of the ﬁlling solid tori are closed geodesics with cone angles
αi. The singular locus ofMﬁll consists of the core geodesics withαi ̸= 2π.
If s ∈ U is an ordinary (not extended) Dehn ﬁlling parameter (see
Section 14.2.1), that is ifsi is either ∞ or a coprime pair(p, q) for all i,
then αi = 2 π and Nﬁll is a hyperbolic manifold without cone angles: this
is of course the case of most interest.
Corollary 15.1.2. Let M = int( N) be a complete orientable ﬁnite-
volume hyperbolic three-manifold. For everyi = 1 , . . . , c there is a ﬁnite
set Si of slopes in Ti such that for every Dehn ﬁlling parameters with
si ̸∈ Si for all i, the ﬁlled manifoldMﬁll = int(Nﬁll) is hyperbolic.
When M has one cusp, the corollary may be stated simply as follows.
Corollary 15.1.3. If M is a complete orientable ﬁnite-volume hyper-
bolic three-manifold with one cusp, all but ﬁnitely many Dehn ﬁllingsMﬁll
are hyperbolic.
To appreciate the power of these theorems, consider for instance a
hyperbolic link L ⊂ S3 (recall that L ⊂ S3 is hyperbolic ifS3 \ L admits a
ﬁnite-volume complete hyperbolic metric). By the hyperbolic Dehn ﬁlling
theorem, there is a ﬁnite subsetS ⊂ Q such that every surgery onL with
coeﬃcients in Q \ S produces a closed hyperbolic manifold.
15.1.3. Examples. We describe a couple of clarifying examples. We
know that the ﬁgure eight knotK ⊂ S3 is hyperbolic: by the Dehn ﬁlling
Theorem, there is an open neighbourhoodU ⊂ S2 of ∞ such that every
Dehn surgery on K with parameter s ∈ U produces a hyperbolic cone
manifold.
We will prove in the next section that the subsetU shown in Figure
15.1 fulﬁls this requirement. The only coprime pairs(p, q) that are not


## Page 455

15.1. INTRODUCTION 447
0
(-4,-1) (4,-1)
(-4,1) (4,1)
(-5,0) (5,0)
U
Figure 15.1. Hyperbolic Dehn ﬁllings on the ﬁgure-eight
knot complement.
p
q manifold
0 T(
3 1
−1 0
)
±1
(
S2, (2, 1), (3, 1), (7, −6)
)
±2
(
S2, (2, 1), (4, 1), (5, −4)
)
±3
(
S2, (3, 1), (3, 1), (4, −3)
)
±4
(
D, (2, 1), (2, 1)
)⋃(
0 1
1 0
)(
D, (2, 1), (3, 1)
)
Table 15.1. The non-hyperbolic Dehn surgeries of the
ﬁgure-eight knot. We get a torus bundle with Anosov mon-
odromy and hence ofSol geometry, three Seifert manifolds
of ˜SL2 geometry, and a graph manifold that splits into two
Seifert manifolds via a map that interchanges the ﬁbres and
the boundary sections of the two portions (the map is here
denoted by a matrix in the section-ﬁbre basis).
contained in U are those withp
q equal to one of the following
(21) −4, −3, −2, −1, 0, 1, 2, 3, 4, ∞.
Every other surgery onK yields a closed hyperbolic three-manifold. For
instance, the manifold Vol2 from Table 14.5 can be obtained withp
q = ±5
(there is a symmetry ofK sending p
q to − p
q).
On the other hand, ap
q surgery from the list (21) does not produce a
hyperbolic manifold: see Table 15.1, taken from Martelli – Petronio [38].
More generally, a parameterk(p, q) ∈ U produces a hyperbolic closed
manifold with a core geodesic of cone angle2π
k , which may be interpreted
as an orbifold when k ∈ N. In particular, if (p, q) = (1 , 0) the closed
manifold is justS3, because an∞-surgery on a knot inS3 gives S3 back.


## Page 456

448 15. HYPERBOLIC DEHN FILLING
P R
F
J
P R
J
F
I
V
III VII
VIII
IV
VI II
2
2 3
3
1
1 2
2 3
3
1
1
3
1 2
3
1 2
3
1 2
3
1 2
3
1 2
3
1 2
3
1 2
3
1 2
Figure 15.2. We truncate the tetrahedra and ﬂatten their
boundary. We assign a modulusz and w to them. The edge
numbered i = 1, 2, 3has moduluszi (on the left tetrahedron)
or wi (on the right tetrahedron).
By looking at Figure 15.1 we discover that for everyk ⩾ 5 there is a
hyperbolic structure onS3 with cone angle2π
k on the ﬁgure-eight knotK.
We now consider a link with two components. TheWhitehead link
L shown in Figure 14.10 is hyperbolic: it is hard to determine an explicit
open set U ⊂ S2 × S2 in this case, but a careful computer-aided analysis
carried with SnapPy [15] shows the following, see [38].
Theorem 15.1.4. A ( p
q , r
s ) surgery on the Whitehead link produces a
closed hyperbolic manifold, unless one of the following holds:
• either p
q or r
s belongs to the set{0, 1, 2, 3, 4, ∞},
• up to permutation the pair
(p
q , r
s
)
belongs to the set
{
(−4, −1), (−3, −1), (−2, −2), (−2, −1),
(3
2 , 5
)
,
(4
3 , 5
) (5
2 , 7
2
)}
.
The proposition is symmetric in the two coeﬃcients because the link
itself has a symmetry that interchanges the two components. All the
Dehnﬁllingparameterslistedinthetheoremindeedproducenon-hyperbolic
manifolds. For instance, ifp
q ∈ {1, 2, 3} we get a Seifert manifold ﬁbering
over the disc with two singular ﬁbres, see [38].
We ﬁrst prove Theorem 15.1.1 for the ﬁgure-eight knot, where the
combinatorics is so simple that everything can be veriﬁed by hand. We will
then prove the theorem in general in Section 15.2 using more sophisticated
tools.
15.1.4. Theﬁgure-eightknotexample. Wenowdiscussindetailthe
standard example: the ﬁgure-eight knot complement, one of the very few
cases where the consistency and completeness equations can be solved by
hand. This part will not be needed in the proof of Theorem 15.1.1, so the
reader may wish to skip it and go directly to Section 15.1.5.


## Page 457

15.1. INTRODUCTION 449
I III
II IV VI VIII
V VIIm
l
z1 z2
z3
z1 z2
z3
z3 z1
z2
z3 z1
z2
w1 w3
w2
w1 w3
w2
w2 w1
w3
w2 w1
w3
Figure 15.3. The triangulated boundary is a torus obtained
by identifying the opposite edges of this parallelogram. The
triangulationT has two edges, that we colour in red and
white. Their endpoints are shown here.
Let T be the triangulation with two tetrahedra shown in Figure 14.7.
The truncated version is in Figure 15.2. We assign the complex variablez
and w to the left and right tetrahedron, respectively. We set
z1 = z , z 2 = 1
1 − z , z 3 = z − 1
z
and deﬁne w1, w2, w3 similarly. Recall that
(22) z1z2z3 = w1w2w3 = −1.
The modulus of an edge in Figure 15.2 labeled withi ∈ { 1, 2, 3} is zi or
wi depending on the tetrahedron. With some patience one sees that the
boundary triangulated surface is a torusT as in Figure 15.3. The triangu-
lation T has two edges shown in Figure 14.7, each yielding a consistency
equation. Figure 15.3 shows that the consistency equations are
z 2
2 z3w 2
2 w3 = 1, z 2
1 z3w 2
1 w3 = 1.
Using (22) we see that the equations are both equivalent to
z2w2 = z1w1,
that is
(23) z(1 − z)w (1 − w ) = 1 .
We now look at the boundary torusT. Let m and l be the generators of
π1(T ) shown in Figure 15.3. We have
(24) µ(m) = −z1z3w1 = w (1 − z), µ (l) = z 2
2 z 2
3 w 4
1 w 2
2 w 2
3 = w 2
z 2 .
The completeness equations are
(25) w (1 − z) = 1 , z 2 = w 2.
Exercise 15.1.5. The only solution to (23) and (25) isz = w = e
πi
3 .
We have conﬁrmed that the ﬁgure-eight complementM has a com-
plete hyperbolic structure obtained by representing both tetrahedra with
ideal regular hyperbolic tetrahedra. We now investigate the non-complete
solutions of the consistency equations.


## Page 458

450 15. HYPERBOLIC DEHN FILLING
0 1
i
i2
complete 0
(-4,-1) (4,-1)
(-4,1) (4,1)
(-5,0) (5,0)
R s
d
Figure15.4. Every w∈ Rdeterminesahyperbolicstructure
for M (left). The Dehn ﬁlling generalised invariantsd map
R onto a neighbourhood of∞ (right).
The two ideal tetrahedra have moduliw and z and the consistency
equations reduce to one equation (23) which we rewrite as
z 2 − z + 1
w (1 − w ) = 0.
The solutions are
z =
1 ±
√
1 − 4
w(1−w)
2 .
We are only interested in solutions withℑz ,ℑw > 0. For every w with
ℑw > 0 there is a unique solutionz with ℑz > 0, except when∆ ∈ R⩾0.
Exercise 15.1.6. We have ∆ = 1 − 4
w(1−w) ∈ R⩾0 if and only if w
belongs to the half-lines =
{1
2 + y i with y ⩾
√
15
2
}
, see Figure 15.4-(left).
We deﬁne the open region
R = {w ∈ C | ℑ w > 0} \ s.
Every w ∈ R determines a hyperbolic structure for M. The complete
structure is obtained atw0 = 1
2 +
√
3
2 , see Figure 15.4-(left).
The manifold M is a knot complement and hence the boundary torus
T is equipped with its natural meridian/longitude basism′, l′, see Section
11.3.1. Using SnapPea we ﬁnd out that
m′ = m, l ′ = l + 2m.
From (24) we get
(26) ˜µ(m′) = w (1 − z), ˜µ(l′) = z 2
w 2 w 2(1 − z)2 = z 2(1 − z)2.
We ﬁx m′, l′ as generators forπ1(T ). We deﬁned in Section 14.2.7 the
generalised Dehn surgery invariant(p, q) = d(w ) for every non-complete
solution w ∈ R \ {w0}. This gives a continuous map
d : R − →S2
that sends w0 to ∞.


## Page 459

15.1. INTRODUCTION 451
Proposition 15.1.7. The image d(R) contains the coloured region
shown in Figure 15.4-(right).
Proof. The domain R is an open disc and its abstract closure¯R is
homeomorphic to the closed disc. We show thatd extends to a continuous
map ¯R → S2 whichsends ∂R tothealmost-rectangleshowninFigure15.4.
The invariants d(w ) = ( p, q) are such that
(27) w p(1 − z)p+2qz 2q = e2πi .
The regionR has two involutions (determined in fact by isometries of
M):
• the involution τ(w ) = z =
1±
√
1− 4
w(1−w)
2 . This involution sends
µ(m) to µ(m)−1 = µ(m−1), hence d(τ(w )) = −d(w );
• the involution σ(w ) = 1 − w: using (26) we get d(σ(w )) =
d(w ).
Now we note that whenw tends to a point in the linel+ = [1, +∞] then
z tends to a point inl− = [−∞, 0]. Therefore the argument ofw , z ,1 − z
tends respectively to0, π, 0. Equation (27) implies thatq → 1.
If w → 1 then z → −∞ and (27) implies thatp + 2q + 2q = p +
4q → 0, so (p, q) → (−4, 1). If w → +∞ then z → 0 and equation
z(1 − z)w (1 − w ) = 1 implies that|z||w |2 → 1; here (27) gives|w |p−4q →
1, hence p − 4q → 0, so (p, q) → (4, 1). We have proved thatd maps
[1, +∞] onto the segment
(−4, +1), (+4, +1).
Using the involutionτ we deduce thatd maps [−∞, 0] onto the segment
(+4, −1), (−4, −1).
When w is near the right side of the half-lines, the number z tends to
the segment (0, 1
2 ]. Therefore the arguments of z and 1 − z tend to 0
and (27) implies that the argument ofw p tends to 2π. When w ∈ s the
argument of w is at leastarctan
√
15 = 1 .31811607 . . . and hence p is at
most 2π
arctan
√
15 = 4 .374 . . . < 5. This implies that we can connect(4, 1)
and (4, −1) while staying inside the image ofd with a curve as in Figure
15.4. □
15.1.5. Aroadmap. Therestofthischapterismostlydevotedtothe
proofofTheorem15.1.1. Hereisourplan: weﬁrststudythecombinatorial
propertiesofanarbitraryidealtriangulation T for M, andweprovethatthe
solutions to the consistency equations form a complex manifoldDef(M, T )
of(complex)dimension c equaltothenumberofcuspsof M. Themanifold
Def(M, T ) is nicely parametrized by the holonomies on anyc ﬁxed curves
at diﬀerent cusps.
The manifoldDef(M, T ) is often empty, but sinceM is hyperbolic we
expectthatthereshouldbesomeidealtriangulation T forwhich Def(M, T )


## Page 460

452 15. HYPERBOLIC DEHN FILLING
is not empty and contains a solutionz that also satisﬁes the completeness
equations (we are unfortunately not able to prove this in general, and this
will be a technical issue). The generalised Dehn ﬁlling invariants deﬁned
in Section 14.2.7 furnish a local diﬀeomorphismd : Def( M, T ) → S2 ×
. . . × S2 that sends z to (∞, . . . ,∞). In particular this map is open and
its image covers a neighbourhoodU of (∞, . . . ,∞). We conclude thanks
to the discussion of Section 14.2.7.
We start by deﬁning and exploring the solution spaceDef(M, T ).
15.2. The solution space
In this section we study the combinatorial properties of ideal trian-
gulations of three-manifolds in general. We study the space of solutions
to the consistency equations, we prove that it is a complex manifold and
exhibit a concrete parametrisation via the holonomy of peripheral curves.
15.2.1. Edges and tetrahedra.Throughout this section, we letN be
a compact oriented three-manifoldN with ∂N = T1 ⊔ . . . ⊔ Tc consisting
of tori, and deﬁneM = int(N). Let T be any ideal triangulation forM.
Proposition 15.2.1. The ideal triangulationT has the same number
n of tetrahedra and edges.
Proof. The total space |T | of the triangulation T has v vertices, e
edges, f faces, andt tetrahedra. Since χ(∂N ) = 2 χ(N)for every compact
3-manifold N and ∂N consists of tori, we getχ(N) = 0. Therefore
v = v + χ(N) = χ(|T |) = v − e + f − t = v − e + t
since f = 2t. Then e = t. □
Recall that in the consistency equations we get one complex variable
zi for each tetrahedron and one equation for each edge; since we have the
same number of edges and tetrahedra, one would guess that the solutions
form typically a discrete set of points, but this is surprisingly not the case:
we now show that some equations are redundant, leaving some space for
a higher-dimensional space of solutions. The origin of this redundancy lies
in the combinatorial properties of three-dimensional triangulations.
15.2.2. Incidence matrices. We denote respectively by ∆1, . . . ,∆n
and e1, . . . , en the tetrahedra and edges ofT. We ﬁx an orientation onM,
which induces an orientation on each tetrahedron, and we assign numbers
1,2,and3topairsofoppositeedgesoneach ∆i inawaythatisorientation-
preservingly isomorphic to Figure 15.5.
We now deﬁne a2n × 3n integral matrixA that encodes some combi-
natorial adjacencies between tetrahedra. The matrixA should be seen as
a 2 × 3 rectangle of n × n sub-matrices as in Figure 15.6-(left), where:


## Page 461

15.2. THE SOLUTION SPACE 453
1
1
2
2
3
3
1 2
3
Figure 15.5. We label the edges of everyoriented tetrahe-
dron as shown: the labelling is determined once we chose
arbitrarily a pair of opposite edges and label them with 1
(left). The vertices of everyoriented triangle in the triangu-
lated boundary inherit labels as in the ﬁgure (right).
I I I n
n
n n n
c
n n
A
B
1
1
2 2
3
3
Figure 15.6. The incidence matrices A and B count the
incidences between edge pairs, tetrahedra, edges, and ideal
vertices.
• each column of A corresponds to a pair of opposite edges of
one tetrahedron, more precisely the columnsi , i + n, and i + 2n
correspond the opposite edges of type 1,2,3 of∆i;
• the ﬁrst n rows of A correspond to the tetrahedra∆1, . . . ,∆n;
• the last n rows of A correspond to the edgese1, . . . , en.
When i ⩽ n, the entryAi j is 1 or 0 depending on whether∆i contains the
j-th edge pair. In other words, the top threen × n sub-matrices of A are
three identity matrices, see Figure 15.6-(left).
When i = n + i′ with i′ > 0, the entryAi j counts how many edges in
the j-th edge pair are glued to thei′-th edge ei′: this number is hence 0,
1, or 2.
Exercise 15.2.2. The entries on each column ofA sum to 3.
Letnow v1, . . . , vc betheidealverticesof T. Wedeﬁneanother c ×2n
integral matrix B, which consists of twoc × n sub-matrices as in Figure
15.6-(right), where:
• the rows ofB correspond to the ideal verticesv1, . . . , vc;


## Page 462

454 15. HYPERBOLIC DEHN FILLING
• theﬁrst ncolumnsof Bcorrespondtothe ntetrahedra ∆1, . . . ,∆n;
• the last n columns correspond to the edgese1, . . . , en.
When j ⩽ n, the entryBi j is minus the number of times∆j is incident
to vi, and whenj = n + j′ with j′ > 0 the entry Bi j is plus the number of
times ej′ is incident tovi. The possible entries are0, −1, −2, −3, −4 and
0, 1, 2 respectively.
Exercise 15.2.3. The entries on each column ofB sum to −4 or 2.
The matrices A and B are designed to be interpreted as linear maps,
and to be composed.
Proposition 15.2.4. The following sequence is exact:
R3n A
− →R2n B
− →Rc − →0.
The proof of this proposition splits into three lemmas.
Lemma 15.2.5. We have BA = 0.
Proof. The i-th row ofB corresponds to the ideal vertexvi and the
k-th column of A corresponds to the k-th pair of opposite edges. The
sum ∑2n
j=1 Bi jAj k counts minus the number of timesvi is incident to the
tetrahedroncontainingtheedgepair, plus thenumberoftimesitisincident
to the two edges of the pair. These numbers are equal and hence we get
0. □
Lemma 15.2.6. The c rows in B are independent vectors.
Proof. Suppose there is a vanishing linear combination∑c
i=1 λi Bi = 0
of the rowsBi of B. If the edgeej has endpoints atva and vb, the entries in
the (n + j)-th columnBn+j are 1 at the rowsa and b and zero everywhere
else: therefore we getλa + λb = 0. If we apply this argument to the three
edges of a triangle we get
λa + λb = 0, λ b + λc = 0, λ c + λa = 0
which implies λa = λb = λc = 0. Then all coeﬃcientsλa vanish. □
Lemma 15.2.7. The c rows in B generate ker(A⊺).
Proof. Since BA = 0 implies A⊺B⊺ = 0, we already know that the
rows inB are contained inker(A⊺), and we must prove that they generate
it. We pick a generic horizontal vector q = ( q1, . . . , q2n) ∈ R2n with
qA = 0 and we need to prove thatq is generated by the rowsBi of B.
Recall that the columnsAj , Aj+n, Aj+2n of A correspond to the edge
pairs of type 1, 2, and 3 of the tetrahedron∆j. We label the vertices of∆j
as a, b, c, d, the edges of∆j as pairs likeab, and the corresponding vertices
and edges inT as j(a)and j′(ab), interpreted as numbers in{1, . . . , c}and
{1, . . . , n} respectively. Moreover we setj(ab) = j′(ab) + n. We suppose
that ab, ac, ad are of type 1, 2, 3.


## Page 463

15.2. THE SOLUTION SPACE 455
The conditions qAj = qAj+n = qAj+2n = 0 say that
qAj = qj + qj(ab) + qj(cd ) = 0,
qAj+n = qj + qj(ac) + qj(bd ) = 0,
qAj+2n = qj + qj(ad) + qj(bc) = 0.
This implies that
(28) qj(ab) + qj(cd ) = qj(ac) + qj(bd ) = qj(ad) + qj(bc) = −qj .
We now prove thatq = ∑λi Bi where the coeﬃcients λi are deﬁned as
follows. Consider an ideal triangle in∆j with vertices a, b, c and deﬁne
λj(a) = qj(ab) + qj(ca) − qj(bc)
2 .
We check thatλj(a) does not depend on the ideal triangle: the triangle in
∆j with vertices a, b, d gives
λj(a) = qj(ab) + qj(d a) − qj(bd )
2 = qj(ab) + qj(ca) − qj(bc)
2
using (28). Two triangles incident to the ideal vertexvj(a) are connected
by a path of adjacent tetrahedra and henceλj(a) is well-deﬁned.
Finally, we need to check that indeed q = ∑λi Bi. We consider
the edge j(ab) and recall that the j(ab)-th column of B is everywhere
zero except at rowsj(a) and j(b); hence thej(ab)-th entry of∑λi Bi is
λj(a) + λj(b), which by deﬁnition equalsqj(ab), so we are done.
Analogously, the j-th column of B is everywhere zero except at the
rows j(a), j(b), j(c), j(d) and hence thej-th entry of∑λi Bi is −(λj(a) +
λj(b) + λj(c) + λj(d)) which equals −qj(ab) − qj(cd ) = qj. The proof is
complete. □
These three lemmas imply Proposition 15.2.4. In particular we get
the following:
Corollary 15.2.8. We haverkA = 2n − c.
15.2.3. A symplectic form.We deﬁne an alternating bilinear formω
on R3n as follows: for everyi = 1, . . . , nconsider the form
ωi =


0 1 −1
−1 0 1
1 −1 0


on the subspaceVi generated by ei , ei+n, and ei+2n, and deﬁneω = ⊕i ωi.
Strictly speaking, the formω is not symplectic because it is degenerate:
its radical is generated by all vectors of typeei + ei+n + ei+2n, that is by
the ﬁrst n rows of the matrixA. The form ω becomes symplectic after
quotienting R3n by the radical.
Proposition 15.2.9. The rows ofA generate a lagrangian subspace.


## Page 464

456 15. HYPERBOLIC DEHN FILLING
Proof. In other words, we need to prove thatω(Aj , Ak) = 0 for any
rows Aj , Ak of A. The ﬁrst n rows lie in the radical, hence we are left to
check that ω(An+j , An+k) = 0 for all 0 < j < k ⩽ n corresponding to the
j-th and k-th edge of the triangulation.
Each tetrahedron ∆i contributes to the numberω(An+j , An+k) as fol-
lows: if two edges contained in some facef of ∆i correspond to the edges
j and k of the triangulation, they contribute with a±1; the facef is also
contained in an adjacent tetrahedron where they contribute with opposite
sign, and hence everything sums to zero. □
15.2.4. The solution space. We now employ the combinatorial re-
sults of the previous sections to study the consistency equations forT.
We assign the variableszj, 1
1−zj
, and
zj−1
zj
to the edges of type 1, 2, and 3
in each tetrahedron∆j. These three variables lie in the upper half-plane
C+ =
{
ℑz > 0
}
which we see as the subsetC+ ⊂ ˜C∗ consisting of allρei θ with 0 < θ < π .
The consistency equation at the edgeei is the following equation in˜C∗:
(29) gi (z) =
n∏
j=1
z
An+i ,j
j
( 1
1 − zj
)An+i ,n+j (zj − 1
zj
)An+i ,2n+j
= e2πi .
The elements 1
1−zj
,
zj−1
zj
∈ C+ ⊂ ˜C∗ depend holomorphically onzj ∈ C+.
We have deﬁned a complex function
g : Cn
+ − →
(˜C∗
)n
by setting g = (g1, . . . , gn). Thesolution spaceis the set
Def(M, T ) = g−1(e2πi , . . . , e2πi ).
This space consists precisely of the solutions to the consistency equations
of T. Each solutionz ∈ Def(M, T ) gives a hyperbolic metric onM, which
“deforms” asz varies: this justiﬁes the use of the symbol “Def”. We want
to prove thatDef(M, T ) is a complex manifold of dimensionc.
15.2.5. Complex diﬀerentials. We now use the biholomorphic map
log : ˜C∗ → C and deﬁne the functionG(z) = log g(z) for allz ∈ Cn
+. Now
Def(M, T ) = G−1(2πi , . . . ,2πi ).
We may write
Gi (z) =
n∑
j=1
A′
i ,j log zj + A′
i ,n+j log(1 − zj ) + Ni πi
where A′ is the n × 2n integral matrix deﬁned by
A′
i ,j = An+i ,j − An+i ,2n+j , A ′
i ,n+j = −An+i ,n+j + An+i ,2n+j


## Page 465

15.2. THE SOLUTION SPACE 457
and Ni is some ﬁxed integer that depends on the way we interpretlog(1 −
zj ). The complex diﬀerential atz splits as a composition of linear maps
d Gz : Cn Z
− →C2n A′
− →Cn
where
Z =


1
z1
0 . . . 0
0 1
z2
. . . 0
...
... ... ...
0 0 . . . 1
zn
1
z1−1 0 . . . 0
0 1
z2−1 . . . 0
...
... ... ...
0 0 . . . 1
zn−1


is obtained by diﬀerentiatinglog zj and log(1 − zj ). Let now
B′ : Cn − →Cc
be the linear map deﬁned by the right(c × n)-sub-matrix B′ of B, that is
B′
i ,j = Bi .n+j .
Proposition 15.2.10. The following sequence is exact:
C2n A′
− →Cn B′
− →Cc − →0.
Proof. Lemma15.2.6showsthat B issurjective, anditsproofactually
shows that B′ is surjective. Recall that A decomposes into six square
matrices, and via Gauss moves on columns we get
(30) A=
( I I I
A1 A2 A3
)
− →
( 0 0 I
A1 − A3 −A2 + A3 A3
)
=
( 0 I
A′ A3
)
Now BA = 0 ⇒ B′A′ = 0, and rkA = 2n − c ⇒ rkA′ = n − c. □
This shows in particular that the image ofG lies in a ﬁxed aﬃne
subspace parallel to ker B′ of complex codimension c. We now consider
the standard symplectic formω =
(0 I
−I 0
)
on R2n.
Proposition 15.2.11. The rows ofA′ generate a lagrangian subspace.
Proof. We know that the rows ofA generate a lagrangian subspace
with respect to the degenerate form onR3n by Proposition 15.2.9. The
Gauss moves (30) imply the assertion. □
Proposition15.2.12. Forevery z ∈ Cn
+ thefollowingsequenceisexact:
Cn d Gz
− →Cn B′
− →Cc − →0.


## Page 466

458 15. HYPERBOLIC DEHN FILLING
Proof. We have d Gz = A′Z. Proposition 15.2.10 gives an exact
sequence
C2n A′
− →Cn B′
− →Cc − →0.
We only need to prove thatIm (A′Z) = Im A′, that is rk(A′Z) = n − c.
We prefer to consider the transpose matrixM = (A′Z)⊺ = Z⊺(A′)⊺. Then
Z⊺ =


1
z1
0 . . . 0 1
z1−1 0 . . . 0
0 1
z2
. . . 0 0 1
z2−1 . . . 0
...
... ... ...
...
... ... ...
0 0 . . . 1
zn 0 0 . . . 1
zn−1


.
The map Z⊺ : C2n → Cn is obviously not injective, but its restriction
Z⊺|R2n : R2n − →Cn
is an isomorphism of real spaces because1
zi
and 1
zi−1 are independent over
R (we use here thatzi ̸∈ R).
We deﬁne a symplectic formΩon the real vector spaceCn by pushing-
forward ω along Z⊺|R2n, that is we set Ω(Z⊺v , Z ⊺w ) = ω(v , w). By
construction Ω is a sum of symplectic forms on the coordinate complex
lines of Cn. Note that a symplectic form onC is unique up to rescaling.
Since Im zi > 0, the complex numbers1
zi
and 1
zi−1 form a negatively-
oriented R-basis ofC, and this implies thatΩ(v , i v) < 0for every non-zero
vector v ∈ Cn. In particular ⟨·, ·⟩ = −Ω(·, i·) is a positive-deﬁnite scalar
product that induces a norm∥ · ∥ on Cn.
On each coordinate complex line ofCn, the formΩ is just a rescaling
of the standard symplectic form and hence⟨, ⟩is a rescalingof the standard
scalar product. In particularΩ(i v , i w) = Ω( v , w) and ⟨i v , i w⟩ = ⟨v , w⟩.
Finally, we suppose by contradiction thatrkM < n − c. Since Z⊺|R2n
is injective, the real subspace M(Rn) has real dimension n − c. Since
rkM < n − c, there are vectorsv1, v2 ∈ Rn such thatM(v1 + i v2) = 0 while
Mv1 ̸= 0 and Mv2 ̸= 0. Proposition 15.2.11 gives
Ω(Mv1, Mv2) = ω((A′)⊺v1, (A′)⊺v2) = 0
and therefore
0 = ∥M(v1 + i v2)∥2 = ∥Mv1∥2 + ∥i Mv2∥2 + 2⟨Mv1, i Mv2⟩
= ∥Mv1∥2 + ∥Mv2∥2 − 2Ω(Mv1, −Mv2)
= ∥Mv1∥2 + ∥Mv2∥2
implies Mv1 = Mv2 = 0, a contradiction. □
Corollary 15.2.13. The solution space Def(M, T ) ⊂ Cn
+ is either
empty or a complex submanifold of dimensionc.


## Page 467

15.2. THE SOLUTION SPACE 459
Figure 15.7. We mark with a dot all the interior angles that
γ encounters on its right as in the picture: each dot deter-
mines an edge in some tetrahedron∆j and hence an edge pair
(left). We also consider the “degenerate path” consisting of
a single point “run counterclockwise”, and recover the lastn
rows of A in this way (right).
Proof. Theimageof G : Cn
+ → Cn liesentirelyina (n−c)-dimensional
complex aﬃne spaceS parallel to ker B′ ⊂ Cn and by the previous propo-
sition the holomorphic mapG : Cn
+ → S is a submersion onto its image.
Therefore the counterimage of any point is a either empty or is a complex
submanifold of dimensionn − (n − c) = c. □
We now want to deﬁne a nice holomorphic parametrisation for the
manifold Def(M, T ), andtothis purpose weneed toinvestigatefurther the
combinatorial properties ofT by looking more closely at its ideal vertices.
15.2.6. Boundary curves. Recall thatM = int(N) and the ideal ver-
tices v1, . . . , vc of T correspondtotheboundarytori T1, . . . , Tc of N, which
are triangulated byT. Recall also that there aren tetrahedra ∆1, . . . ,∆n
in T and each ∆i has three edge pairs labeled withi , n + i ,and 2n + i.
Every simplicial closed oriented curve γ in a triangulated torus Ti
determines an integer vectorvγ ∈ R3n that counts the (right-)incidences
between γ and the 3n edge pairs ofT. More precisely, each interior angle
of a triangle inTi determines an edge in some tetrahedron∆j and hence
an edge pair: we deﬁne(vγ)j to be the number of timesγ encounters the
j-th edge pair on its right, as in Figure 15.7-(left).
We deﬁned an alternating degenerate formω on R3n and we now want
to extend Proposition 15.2.9. We denote byγ ·γ′ the algebraic intersection
of γ and γ′ in H1(∂M, Z).
Proposition 15.2.14.Let γ, γ′ be simplicial closed curves in∂N. Then
• ω(vγ, vγ′) = 2 γ · γ′,
• ω(vγ, Ai ) = 0 for every rowAi of A.
Proof. The rowAi with i ⩽ n lies in the radical ofω, andAn+i records
the incidences of thei-th edge ei of T with the 3n edge pairs. We may


## Page 468

460 15. HYPERBOLIC DEHN FILLING
Figure 15.8. We draw the pathsγ, γ′ and their dots in blue
and red.
+1 0 -1
Figure 15.9. Two dots in a triangle contribute toω(γ, γ′)
with +1, 0, or−1 according to their mutual position.
write An+i = vγ′ where γ′ is a “degenerate” closed path consisting of a
single point (one of the endpoints ofei), see Fig 15.7-(right). Now the
second assertion is just a special case of the ﬁrst.
We draw the two pathsγ and γ′ in blue and red as in Figure 15.8,
marking with dots the angles they encounter on their right. A couple of
blue and red dots in the same triangle contribute toω(vγ, vγ′) according
to their mutual position as shown in Figure 15.9. Therefore portions of
blue and red paths intersecting the same triangle contribute toω(vγ, vγ′)
as shown in Figure 15.10.
For every contribution +1 as in Figure 15.10-(top-left), there is an
analogous but opposite contribution −1 provided by the other triangle
adjacent to the edge joining the coloured endpoints: these all cancel. We
areleftwitha +1everytimetheredpathexitsleftwardfromanintersection
withthebluepath, a −1everytimeitentersfromtheleft, andtheopposite
contributions with the blue/red colours interchanged. We easily get a total
of 2γ · γ′.
The proof is not yet complete, because every tetrahedron∆i deter-
mines four triangles in∂N and some contributions toω(vγ, vγ′) arise also
from paths intersecting distinct triangles of the same∆i: we need to prove
that these contributions all cancel.


## Page 469

15.2. THE SOLUTION SPACE 461
+1 0
1-1=0
+1
01-1+1=1 1-1=0
-1
Figure15.10. Twoportionsofblueandredpathsthatinter-
sect the same triangle contribute toω(γ, γ′) as shown here.
The contribution depends on their mutual conﬁguration, and
changes by a sign if we interchange the blue/red colours. If
one of the two portions contains at least two edges (as in
bottom-right) it determines a vector in the radical, and the
contribution is always zero.
=
-1
=
+1
=
-1
=
+1
e e
Figure 15.11. When γ and γ′ encounter in diﬀerent trun-
cated triangles of the same tetrahedron∆i, they also con-
tribute to ω(vγ , vγ′ ).


## Page 470

462 15. HYPERBOLIC DEHN FILLING
I I I n
n
n n n
c
Figure 15.12. The enlarged matrix ¯A.
Up to symmetries of the tetrahedron and up to interchanging the
colours, the possible non-zero contributions are all shown in Figure 15.11.
Each conﬁguration as in the ﬁrst row cancels with an opposite one pro-
duced by the tetrahedron adjacent to the grey face. The contributions in
the second row arise whenγ and γ′ cross the endpoints of an edgee on
opposite sides, and one checks that the contributions of all the cycle of
tetrahedra incident toe sum to zero (exercise). □
15.2.7. Holonomy parameters. We now ﬁx a non-trivial oriented
simple closed curve γi on each Ti and a representation of γi as a sim-
plicial (possibly non-injective) path in the triangulatedTi.
We enlarge the incident2n × 3n matrix A to a (2n + c) × 3n matrix
¯A by adding the vectorsvγ1 , . . . , vγc at its bottom, see Figure 15.12.
Proposition 15.2.15. We have rk ¯A = 2 n. The rows of ¯A generate a
maximal lagrangian subspace inR3n.
Proof. Let µi ⊂ Ti be a simplicial closed curve withγi · µi = 1. We
already know that the ﬁrst2n rows of ¯A generate a lagrangian subspace
of dimension2n − c, and to conclude it suﬃces to use Proposition 15.2.14
and deduce thatvµi is ω-orthogonal to all the rows of¯Aexcept ¯A2n+i = vγi.
Therefore rk ¯A = rkA + c = 2n. □
Every point z ∈ Def(M, T ) determines a hyperbolic structure onM
and a homomorphism
˜µz : π1(Ti ) → ˜C∗
for each i = 1, . . . , c, see Deﬁnition 14.2.1. We deﬁne
hi (z) = ˜µz (γi ) = e−|γi|πi
n∏
j=1
z
¯A2n+i ,j
j
( 1
1 − zj
) ¯A2n+i ,n+j (zj − 1
zj
) ¯A2n+i ,2n+j


## Page 471

15.3. PROOF OF THE THEOREM 463
and get a holomorphic function
h : Cn
+ − →
(˜C∗
)c
.
We want to prove that h furnishes a nice parametrisation for the c-
dimensional space Def(M, T ). The letter h stands for “holonomy”: recall
that hi is the holonomy ofγi, see Exercise 14.2.6.
As in Section 15.2.5, we deﬁneH(z) = log h(z). We get a map
G × H : Cn
+ − →Cn × Cc .
As above, the diﬀerential splits as a composition of linear maps
d(G × H)z : Cn Z
− →C2n ¯A′
− →Cn × Cc
where ¯A′ is constructed from ¯A exactly as A′ from A.
Proposition 15.2.16. The diﬀerentiald(G × H)z is injective∀z ∈ Cn
+.
Proof. As above, Proposition 15.2.15 implies that the rows of¯A′ form
a lagrangian subspace of dimensionn and we conclude with the same proof
as Proposition 15.2.12. □
Corollary 15.2.17. The restriction
h|Def(M,T ) : Def( M, T ) − →
(˜C∗
)c
is a local biholomorphism.
Acomplete solutionz ∈ Def(M, T )is one that determines a complete
metric on M, that is such thath(z) = (1 , . . . ,1).
Corollary 15.2.18. Every complete solution inDef(M, T ) is isolated.
The local biholomorphismh depends on the isotopy class of the curves
γi chosen: diﬀerent choices give diﬀerent parametrisations. Note however
that the condition thathi (z) = 1 corresponds geometrically to the com-
pleteness of Ti and hence does not depend onγi.
15.3. Proof of the theorem
We now conclude the proof of Theorem 15.1.1. Through all this
section, we letM = int(N) be a complete orientable ﬁnite-volume cusped
hyperbolic three-manifold. We have∂N = T1 ∪ . . . ∪ Tc for some c ⩾ 1.
We also ﬁx a positive pairmi , li of generators forπ1(Ti ) at eachTi. Recall
that each Ti has Euclidean structure, deﬁned up to rescaling.


## Page 472

464 15. HYPERBOLIC DEHN FILLING
15.3.1. Near the complete solution.We now suppose thatM has a
geometricdecomposition T intoideal hyperbolictetrahedra, in otherwords
the space Def(M, T ) is non-empty and contains a complete solutionz 0.
We want to studyDef(M, T ) near z 0.
We deﬁned in Section 14.2.7 the generalised Dehn ﬁlling invariant of
a solution z ∈ Def(M, T ) at Ti to be ∞ if µ(mi ) = µ(li ) = 1 , or the
unique point (p, q) ∈ R2 such that ˜µ(mi )p ˜µ(li )q = e2πi otherwise. We
denote this invariant bydi (z) ∈ S2 = R2 ∪ {∞} and get a map
d : Def( M, T ) − →S2 × . . . × S2
  
c
such that d(z 0) = ( ∞, . . . ,∞).
Proposition 15.3.1. The map d is a local homeomorphism atz 0.
Proof. We set
ui = log ˜µ(mi ), v i = log ˜µ(li ).
The sets (u1, . . . , uc) and (v1, . . . , vc) are both biholomorphic coordinates
on Def(M, T ) which vanish atz 0. Moreover vi vanishes precisely whereui
does (on solutions that are complete atTi ).
Recall from Exercise 14.2.4 thatµ = ρ′ is the derivative of the holo-
nomy ρ at Ti. When ui = vi = 0 the solution is complete atTi and up to
conjugation we have
ρ(mi ) : z ↦→ z + 1, ρ (li ) : z ↦→ z + wi
for some wi ∈ C with ℑwi > 0 which determines the cusp shape ofTi.
When ui , vi ̸= 0 the solution is incomplete and
ρ(mi ) : z ↦→ az , ρ (li ) : z ↦→ bz
for some a, b ̸= 0. When ui , vi → 0, a fundamental domain ofIm ρ with
vertices at x , ax , bx , abx tends up to rescaling to one with vertices at
x , x + 1, x + wi , x + 1 + wi. Since a, b → 1 we get
vi = log b ∼ b − 1 ∼ wi (a − 1) ∼ wi log a = wi ui
where ∼ means ﬁrst-order equality. Therefore vi
ui
= wi at the complete
solution v = u = 0. We deduce in particular that the functionvi
ui
is analytic
on Def(M, T ). In what follows we only use thatℑwi > 0.
We consider the following map, deﬁned whenever(pi , qi ) ̸= (0, 0) for
all i:
ϕ
(
(p1, q1), . . . ,(pc , qc)
)
= 2πi
( 1
p1 + q1w1
, . . . , 1
pc + qc wc
)
.
We extend it continuously to the case(pi , qi ) = ∞ by setting the i-th
component of the image to be zero. By composingΦ = ϕ ◦ d we get
a map Φ : Def(M, T ) → Cc that sends the complete solutionu = 0 to


## Page 473

15.3. PROOF OF THE THEOREM 465
(0, . . . ,0). We prove that Φ is diﬀerentiable and dΦ0 is invertible: this
will conclude the proof. Whenuj , vj ̸= 0 we have
pj uj + qj vj = 2πi
and Proposition 14.2.12 gives
pj = −2π ℜvj
ℑ( ¯uj vj ) , q j = 2π ℜuj
ℑ( ¯uj vj ) .
Near u = v = 0 we have vj ∼ wj uj and hence
pj ∼ −2π ℜwj ℜuj − ℑwj ℑuj
|uj |2ℑwj
, q j ∼ 2π ℜuj
|uj |2ℑwj
and therefore
ϕj = 2πi 1
pj + qj wj
∼ i |uj |2ℑwj
−ℜwj ℜuj + ℑwj ℑuj + wj ℜuj
= i |uj |2ℑwj
ℑwj ℑuj + iℑwj ℜuj
= i |uj |2ℑwj
i ¯uj ℑwj
= uj
giving dΦ0 = id. □
If M has a geometric decompositionT into ideal tetrahedra, we can
easily conclude the proof of Theorem 15.1.1 as follows: the geometric
ideal triangulation T determines a complete solution z 0 ∈ Def(M, T ),
and by Proposition 15.3.1 the image of the generalised Dehn ﬁlling map
d : Def( M, T ) → S2 × . . . × S2 is an open setU containing (∞, . . . ,∞).
The discussion in Section 14.2.7 ﬁnishes the proof.
However, we still do not know if every complete cusped ﬁnite-volume
M decomposes into ideal tetrahedra! If that were the case, we would be
done. Unfortunately we are not able to prove this, so more eﬀort is needed
to complete the proof.
15.3.2. Triangulations with ﬂat tetrahedra.As we said, we are not
able to prove that every cusped ﬁnite-volumeM decomposes into ideal
tetrahedra. The best that we can do is to show thatM decomposes into
ideal tetrahedra that are either ordinary or “ﬂat”, that is degenerated to
an ideal quadrilateral. We show this using the Epstein–Penner canonical
decomposition.
The Epstein-Penner canonical decomposition (see Theorem 5.1.21)
partitions M intosomeidealpolyhedra P1, . . . , Pk, gluedisometricallyalong
their faces. Can we further subdivide this partition to get a geometric
triangulation of M? We start by triangulating eachPi individually.
Proposition 15.3.2. Every ideal polyhedron P ⊂ H3 subdivides into
ideal tetrahedra.
Proof. We can use the Klein model, so that ideal polyhedra inH3
correspond to Euclidean polyhedra with vertices inS2. We ﬁx a vertex
v ∈ P, and a vertex vi in every face fi of P not incident to v. We


## Page 474

466 15. HYPERBOLIC DEHN FILLING
v
v'
Figure15.13. Thetriangulationsoftwoisometricfacesthat
do not match (left) because they are obtained by coning
along distinct vertices v ̸= v′ (centre). We can add some
additional “ﬂat” tetrahedra to correct this (right).
triangulate eachfi by coning alongvi, and then we triangulateP by coning
all the triangulated facesfi along v. □
The problem is, that we are not able to guarantee that the trian-
gulations of the polyhedraP1, . . . , Pk match at each pair of glued faces.
The typical situation is shown in Figure 15.13-(left): two isometricn-gons
(with n ⩾ 4) are triangulated by coning on distinct verticesv ̸= v′.
There is one thing that we can do, however: we can insert some
ﬂat tetrahedra between the twon-gons that connect the two mismatching
triangulations as in Figure 15.13-(right), and obtain a partially-ﬂat ideal
triangulation of M. The ﬂat tetrahedra can be inserted as follows: ifv
and v′ share an edge we insertn − 3 ﬂat tetrahedra as suggested by Figure
15.13-(right); otherwise, the diagonal joiningv and v′ is common to both
triangulations and we proceed inductively on each of the two sub-polygons
cut by this diagonal.
The resulting ideal triangulationT contains n tetrahedra ∆1, . . . ,∆n;
each ∆i is eitherfat (it lies inside some polyhedronPj) orﬂat (it connects
two faces of thePj). We now ﬁx arbitrarily a pair of opposite edges in
each ∆i and denote byzi ∈ C the modulus of∆i at these edges. If∆i is
fat, then ℑzi > 0 as usual; if∆i is ﬂat, the modulus zi still makes sense
as a number in R \ {0, 1}: the vertex triangle of Figure 14.2-(left) is a
degenerated ﬂat triangle with three vertices0, 1, zi. The ﬂat tetrahedron
has three real modulizi , zi−1
zi
, 1
1−zi
; two arguments are0 and one isπ.
We set z 0 = (z1, . . . , zn). By construction, the pointz 0 satisﬁes the
consistency equations (29).


## Page 475

15.3. PROOF OF THE THEOREM 467
15.3.3. Perturbations. We now letU be a small contractible neigh-
bourhood of z 0 in (C \ {0, 1})n. Note that U necessarily contains some
points z with ℑzi < 0 for some i. The consistency equations (29) make
sense in U, and we deﬁneDef U ⊂ U to be the set of solutions. We still
have Def U = G−1(2πi , . . . ,2πi ).
Does a solutionz ∈ Def U determine a hyperbolic structure onM? In-
tuitively, each moduluszj with ℑzj = 0 should represent a ﬂat tetrahedron,
each zj with ℑzj < 0 a negatively oriented fat tetrahedron, and positively
and negatively oriented tetrahedra should overlap; although appealing, it
is however hard (and sometimes impossible) to translate this idea into a
concrete deﬁnition in general.
Our aim is to prove Theorem 15.1.1 by perturbingz 0, so we only need
here to furnish a geometric interpretation for the solutionsz that lie in a
suﬃciently small neighbourhoodU. We do this as follows.
If z is suﬃciently close toz 0, all the fat tetrahedra that triangulate a
single polyhedron Pi stay positively fat, and since they satisfy the consis-
tency equations along the internal edges ofPi they glue to form a possibly
non-convex polyhedron Pi (z) ⊂ H3. The original faces ofPi are now bent
in Pi (z) along their diagonals.
We now consider the originally ﬂat tetrahedra joining two faces of
two polyhedra Pi (z) and Pj (z). We assign all of them to one of the
two polyhedra, sayPi (z), and forget aboutPj (z). These tetrahedra are
attached to somen-gonal face f of Pi (z), bent along its diagonals. The
eﬀect of each attached tetrahedron∆j is to ﬂip a diagonal, and we modify
Pi (z) accordingly by replacing the two ideal triangles inf incident to the
old diagonal with the two triangles sharing the new one. Geometrically,
this corresponds to adding∆j if ℑzi > 0, or to cut∆j away fromPj (z) if
ℑzj < 0. At the end of the process, we get a new polyhedronP′
j (z) with
the same vertices asPj (z), whose faces are bent along diﬀerent diagonals.
The new possibly non-convex polyhedraP′
j (z) glue isometrically along
their paired faces, that are now bent along the same diagonals. The con-
sistency equations are satisﬁed along these diagonals, hence we get a hy-
perbolic structure forM. We summarise our discoveries:
Proposition 15.3.3. If U is suﬃciently small, every solutionz ∈ Def U
represents naturally a hyperbolic structure onM.
15.3.4. Local smoothness. We have seen that every solutionz that
is suﬃciently close toz 0 determines a hyperbolic metric onM. We now
need to extend Corollary 15.2.13.
Proposition 15.3.4. If U is suﬃciently small thenDef U is a complex
manifold of dimensionc.
Proof. As in Corollary 15.2.13, it suﬃces to prove thatd Gz0 : V n →
ker B′ has maximum rank and is hence invertible.


## Page 476

468 15. HYPERBOLIC DEHN FILLING
The only place where we usedℑzj > 0 is the proof of Proposition
15.2.12, and we now modify it so that it applies also to our partially ﬂat
solution z 0. We have M = Z⊺(A′)⊺ and we need to prove thatrkM =
rkA′ = n − c.
We needed zi ̸∈ R to prove that Z⊺|R2n is injective: this is not the
case here, since 1
zi
and 1
zi−1 are not R-independent when ∆i is ﬂat. Now
we have
ker Z⊺|R2n = Span{zi ei + (1 − zi )ei+n | ∆i is ﬂat }.
For K = R, C we write
K2n = K2n
fat ⊕ K2n
ﬂat, Kn = Kn
fat ⊕ Kn
ﬂat
where K2n
fat (K2n
ﬂat) is generated by theei , ei+n such that∆i is fat (ﬂat), and
similarly Kn
fat (Kn
ﬂat) is generated by theei such that ∆i is fat (ﬂat).
The following restriction ofZ⊺ is still an isomorphism:
Z⊺|R2n
fat
: R2n
fat − →Cn
fat.
We use it to push-forwardω to a symplectic formΩon Cn
fat, and we extend
it trivially to an alternating bilinear formΩ on Cn with radical Cn
ﬂat.
Itisstilltruethat M(R2n)hasrealdimension n−c, because(A′)⊺(R2n)
intersects ker Z⊺ trivially. To prove this, suppose that a vectorv′ ∈ R2n
that is R-generated by the rows ofA′ lies in the kernel ofZ⊺, that is:
• (v′
i , v′
i+n) = (0 , 0) for every fat∆i,
• (v′
i , v′
i+n) = ki (zi , 1 − zi ) for some ki ∈ R, for every ﬂat∆i.
We deﬁne v ∈ R3n by setting
vi = v′
i , v n+i = −v′
n+i , , v 2n+i = 0
for all i = 0, . . . , n − 1. We note that each triple(vi , vn+i , v2n+i ) is either
(0, 0, 0), or it contains three pairwise distinct real numbers. The vector
v′ ∈ R2n is generated by the n rows of A′ ⇐ ⇒the vector v ∈ R3n is
generated by then rows of A (exercise).
We interpretv as a colouring of the3n edge pairs inT. The colouring
v is everywhere zero on all fat tetrahedra, and on each ﬂat tetrahedron it
is either (0, 0, 0) or consists of three pairwise distinct numbers. We must
prove that it is zero everywhere.
The vectorv is contained in the lagrangian subspace generated by the
rows A1, . . . , A2n of A. In particular we haveω(v , An+i ) = 0 for alli. Every
row An+i corresponds to an edgee of T, and this equality says that the
colours on all tetrahedra incident toe of the edge pairs not containinge
sumtozero, providedthattheyarecountedwithsignsineachtetrahedron.
This implies the following: if all such tetrahedra except one∆j have colour
zero on all their edge pairs, then two edge pairs on∆j have the same
colours, and by what just said onv this implies that all colours are zero
also on ∆j.


## Page 477

15.3. PROOF OF THE THEOREM 469
Consider a sequence∆1, . . . ,∆k of ﬂat tetrahedra that connects two
faces of two polyhedra Pi and Pj of the Epstein-Penner decomposition.
There is one edge of ∆1 that is incident only to fat tetrahedra except
∆1, and the above discussion implies that all the colours on∆1 are zero;
by induction we deduce that all the ﬂat∆i have zero colours. Therefore
v = 0, as required.
We have proved thatdim M(R2n) = n − c, and we conclude as in the
proof of Proposition 15.2.12. The formΩ deﬁnes a positive semideﬁnite
scalar product ⟨, ⟩ on Cn with radical Cn
ﬂat. If rkM < n − c, there are two
vectors v1, v2 ∈ Rn such thatM(v1 +i v2) = 0 while Mv1 ̸= 0 and Mv2 ̸= 0.
We get ∥Mv1∥ = ∥Mv2∥ = 0 as in the proof of Proposition 15.2.12, and
this implies thatMv1, Mv2 both lie in the radicalCn
ﬂat.
If Mv1, Mv2 ∈ Cn
ﬂat then bothMv1 and Mv2 are real since1
zi
, 1
zi−1 ∈ R
for every ﬂat ∆i. Now 0 = M(v1 + i v2) = Mv1 + i Mv2 implies that
Mv1 = Mv2 = 0, a contradiction. □
15.3.5. Conclusion of the proof.The proof of Theorem 15.1.1 ﬁn-
ishes like in the geometric triangulation case. All the discussion of Section
15.2.7 applies here: the holonomies are deﬁned also in this context and
may be used to parametrize the complex manifoldU(z 0). The strategy of
Section 15.3.1 is still valid: the generalised Dehn ﬁlling invariant mapd
sends U(z 0) to an open neighbourhood of(∞, . . . ,∞) in S2 × . . .× S2 and
the discussion in Section 14.2.7 ﬁnishes the proof. We have completed the
proof of Theorem 15.1.1.
15.3.6. Mostow–Prasad rigidity. We can use the Dehn ﬁlling Theo-
rem 15.1.1 to extend Mostow Rigidity Theorem 13.3.1 from the closed to
the cusped case. The cusped case was proved by Prasad in 1973, hence
the theorem is known asMostow–Prasad Rigidity Theorem.
Let N a be compact orientable three-manifold bounded by somec ⩾ 0
tori, and letM = int(N).
Theorem 15.3.5 (Mostow–Prasad rigidity).The manifold M admits
at most one ﬁnite-volume complete hyperbolic metric up to isometries
homotopic to the identity.
Proof. The c = 0 case is Theorem 13.3.1, so we supposec ⩾ 1.
Roughly, the metric onM is unique because it is the limit of hyperbolic
metricsonitsclosedDehnﬁllings, thatareuniquebyTheorem13.3.1. (We
are using the hyperbolic Dehn ﬁlling theorem as a trick to extend Mostow’s
rigidity from the closed to the cusped case: this is certainly not Prasad’s
original proof, that was published before any hyperbolic Dehn ﬁlling was
studied, and more importantly it applies to all dimensionsn ⩾ 3.)
More precisely, letM have two ﬁnite-volume hyperbolic metricsm1
and m2. The Dehn ﬁlling Theorem holds for both, and yields sequences
M j
i of closed hyperbolic three-manifolds obtained fromM by Dehn ﬁlling
with parameter s j such that s j → (∞, . . . ,∞), for i = 1, 2.


## Page 478

470 15. HYPERBOLIC DEHN FILLING
Mostow theorem furnishes an isometryM j
1 → M j
2 homotopic to the
identity. Thecoreclosedgeodesicsoftheﬁllingsolidtoriareuniqueintheir
homotopy classes, hence by removing them we get isometric incomplete
metrics. Since m1 and m2 are limits of these, they are also isometric.
This latter sentence can be made rigorous as follows: let T be a
partially ﬂat ideal triangulation for M in the metric m1. Pick an ideal
tetrahedron ∆ in T and note that it can be straightened uniquely also in
the incomplete metrics forM close to the complete ones, just by extending
the construction in the proof of Proposition 7.4.9 from dimension two
to three (an orientation of the core geodesics is needed to deﬁne the
straightening unambiguously). The modulusz ∈ C>0 ∪ (R \ {0, 1}) of the
straightened ∆ in M is intrinsically determined as the limit of the moduli of
the straightenings of∆ in theM j
i, hence it is the same for both metricsm1
and m2. It follows thatm2 has the same geometric ideal decomposition of
m1, and hencem1 = m2 after a homotopy. □
15.4. Volumes
Wehavediscoveredthat“most” Dehnﬁllingsofacuspedﬁnite-volume
hyperbolic manifold are hyperbolic, and we now discuss their volumes.
Let M be a complete orientable ﬁnite-volume cusped hyperbolic three-
manifold. We say that a Dehn ﬁlling ofM is non-trivial if it ﬁlls at least
one boundary torus; in other words, it is determined by some Dehn ﬁlling
parameter s diﬀerent from(∞, . . . ,∞), after ﬁxing some arbitrary homol-
ogy bases for the boundary tori. We prove in this section the following
theorem.
Theorem 15.4.1.If a non-trivial Dehn ﬁllingMﬁll of M admits a com-
plete ﬁnite-volume hyperbolic metric, then
Vol(Mﬁll) < Vol(M).
If s i is any sequence of non-trivial Dehn ﬁlling parameters converging to
(∞, . . . ,∞), and M i is the manifold obtained by ﬁllingM along s i, then
M i is eventually hyperbolic and
Vol(M i ) ↗ Vol(M).
The cores of the ﬁlling solid tori are eventually simple closed geodesics and
their lengths tend to zero.
We already know that ifs i → (∞, . . . ,∞) then Vol(M i ) → Vol(M)
and the cores of the solid tori are closed geodesics whose length tend to
zero: this follows from the construction of the metric onM i via geometric
ideal triangulations. In some sense (that we will not make precise), the
metric on M i converges to that ofM, and the core geodesics become so
short that they disappear in the limit producing cusps.
The only new fact to prove is that the volume strictly decreases under
any Dehn ﬁlling Mﬁll, not only those that are close to(∞, . . . ,∞): this is


## Page 479

15.4. VOLUMES 471
rather subtle, because the hyperbolic metric onMﬁll might not be obtained
by completing ideal triangulations ofM. (For instance, the core tori in
Mﬁll may not be isotopic to closed geodesics.)
We prove the theorem as follows. We ﬁrst consider the case whereM
has an ideal geometric triangulationT: in that caseDef(M, T ) is a nice
smooth complex manifold and we investigate the volume function
Vol : Def(M, T ) − →R>0
that computes the volume of each hyperbolic structure onM. We show
that the volume function makes sense in a bigger convex set containing
Def(M, T ) and is also easier to study there. This bigger convex set is the
set ofangle structureson T. We prove that the volume function is strictly
concave there, and the complete solution is a global maximum.
We conclude with a couple of ﬁnite-covering tricks to pass from local
(near (∞, . . . ,∞)) to global, and to deal with more general manifoldsM
that do not decompose into hyperbolic ideal tetrahedra.
15.4.1. Angle structures. Let M = int(N) where N is an orientable
compact three-manifold bounded byc > 0 tori, equipped with an oriented
ideal triangulation T with n tetrahedra ∆1, . . . ,∆n and n edges e1, . . . , en.
We identify orientation-preservingly each∆i with the one shown in Figure
15.5, and we label the edge pairs of type 1, 2, 3, with the numbersi, i + n,
and i + 2n respectively.
An angle structure θ on M is the assignment of anangle 0 < θ j < π
to the j-th edge pair inT, with the following requirements:
(1) at each tetrahedron∆i we have θi + θi+n + θi+2n = π,
(2) at each edgeei, the sum of the incident angles is2π.
The set of angle structures is thus a subsetA ⊂ R3n
>0. It is the intersection
of the aﬃne subspace inR3n determined by the conditions (1) and (2)
with the cone R3n
>0, so in particular it is convex. By deﬁnition this aﬃne
subspace is the solution space of the linear system
Aθ =
( π
2π
)
where A is the incidence2n × 3n deﬁned in Section 15.2.2 and depicted
in Figure 15.6-(left), andθ = (θ1, . . . , θ3n) ∈ R3n.
What is the geometric meaning of an angle structureθ on T? Thanks
to condition (1), every∆i is realised by a unique ideal hyperbolic tetrahe-
dron with dihedral anglesθi , θi+n, and θi+2n whose complex modulus is
(31) zi = sin θi+n
sin θi+2n
ei θi .
Angle structures are then in natural 1-1 correspondence with the realisa-
tions of the tetrahedra∆1, . . . ,∆n as ideal hyperbolic tetrahedra, with the
mild condition (2) that their dihedral angles around edges must sum to
2π.


## Page 480

472 15. HYPERBOLIC DEHN FILLING
Condition (2) is only “half” of the consistency equation at eachei,
which requires the product of the complex moduli to be 1: condition (2)
alone doesnot guarantee that by gluing these tetrahedra we get a hyper-
bolic structure onM: some “shearing” may arise around an edges.
With this geometric description, the deformation spaceDef(M, T ) is
naturally a smooth submanifold ofA.
15.4.2. Dimensions. We will henceforth suppose thatDef(M, T ) is
non-empty and contains a complete solutionz 0, that isT can be realised
as a geometric ideal triangulation. This implies in particular that A is
also non-empty and has dimensiondim kerA = 3n − (2n − c) = n + c by
Corollary 15.2.8. The space Def(M, T ) is a real smooth submanifold of
dimension 2c.
The tangent spaceTθAat any pointθ ∈ A is of courseker A. We now
constructanexplicitsetofgeneratorsfor ker A. RecallfromSection15.2.6
that every simplicial closed oriented curveγ in a triangulated boundary
torus Ti deﬁnes an integer vectorvγ ∈ R3n.
Recall the alternating formω on R3n from Section 15.2.3: we consider
it as a matrix and writev∗ = ωv for allv ∈ R3n, so thatω(v , w) = ⟨v , w∗⟩
where ⟨, ⟩ is the Euclidean scalar product. We denote byAi the i-th row
of A, considered as a vector inR3n.
We ﬁx two arbitrary generatorsmi , li of π1(Ti ) for all i = 1, . . . , c.
Proposition 15.4.2. The tangent spaceTθA = ker A is generated by
the (not independent)n + 2c vectors A∗
n+1, . . . , A∗
2n, v∗
m1 , v∗
l1 , . . . , v∗
mc , v∗
lc.
Proof. Propositions 15.2.9 and 15.2.14 say that the rows ofA are ω-
orthogonaltothemselvesandto vγ forany γ,hencetheyare ⟨, ⟩-orthogonal
to all vectorsA∗
i and v∗
γ, in other wordsA∗
i , v∗
γ ∈ ker A.
To prove that then + 2c listed vectors generateker A it suﬃces to
show that they span a subspace of dimensionn + c. Proposition 15.2.15
says that if we add the rowsvm1 , . . . , vmc to A we get a rank-2n matrix.
The same proof shows that by further adding the rowsvl1 , . . . , vlc we get
a rank-(2n + c) matrix.
The vectors A1, . . . , A2n, vm1 , vl1 , . . . , vmc , vlc span a dimension-(2n +
c)space. Since dim kerω = n, thevectors A∗
1, . . . , A∗
2n, v∗
m1 , v∗
l1 , . . . , v∗
mc , v∗
lc
span a space of dimension at least2n + c − n = n + c. Since A∗
1 = . . . =
A∗
n = 0, we are done. □
15.4.3. The volume function. The volume function on Def(M, T )
extends naturally to a function
Vol : A − →R>0
which assigns to each angle structureθ the sum of the volumes of the ideal
hyperbolic realisations of∆1, . . . ,∆n determined byθ. Recall from Section
13.1 that the volume of∆i is
Vol(∆i ) = Λ( θi ) + Λ(θi+n) + Λ(θi+2n)


## Page 481

15.4. VOLUMES 473
where Λ is the Lobachevsky function
Λ(α) = −
∫ α
0
log |2 sin t|d t.
We therefore get a simple-looking formula
Vol(θ) =
3n∑
j=1
Λ(θj )
which implies immediately the following important fact.
Proposition 15.4.3. For everyθ ∈ A and v ∈ TθA we have
∂Vol
∂v =
3n∑
j=1
−vj log sin θj , ∂2Vol
∂v 2 < 0.
Proof. We consider a single addendumΛ(θj ) of Vol(θ). We have
∂Λ(θj )
∂v = Λ′(θj ) ∂θj
∂v = − log |2 sin θj |vj = −vj log 2 − vj log sin θj .
Since v ∈ TθAwe havevi +vi+n +vi+2n = 0 for alli and hence∑
j vj sin 2 =
0. This proves the ﬁrst equality. To estimate the second derivative, we
may suppose up to symmetries thatθi , θi+n < π
2 and we get
− ∂2Vol(∆i )
∂v 2 = v 2
i cot θi + v 2
i+n cot θi+n + v 2
i+2n cot θi+2n
= v 2
i cot θi + v 2
i+n cot θi+n + (vi + vi+n)2 1 − cot θi cot θi+n
cot θi + cot θi+n
= (vi + vi+n)2 + (vi cot θi − vi+n cot θi+n)2
cot θi + cot θi+n
> 0.
Indeed the denominator is positive sinceθi , θi+n < π
2, and if the numerator
is 0 thenvi = −vi+n and hence cot θi = − cot θi+n, a contradiction. □
We have proved thatVol is a smooth strictly concave function onA.
15.4.4. The complete solution.We now remember thatDef(M, T )
contains a complete solutionz 0 by assumption.
Proposition 15.4.4. The function Vol : A → R>0 has a unique global
maximum at the complete solutionz 0.
Proof. Thecompletesolution z 0 hasananglestructure θ. Proposition
15.4.3 says that
∂Vol
∂v =
3n∑
j=1
−vj log sin θj
for all v ∈ TθA. At every edge ei, the consistency equation is of type∑
j log wj = 2πi where w1, . . . , wk are the moduli of the incident tetrahe-
dra. The imaginary part of this equation is satisﬁed at every point ofA,


## Page 482

474 15. HYPERBOLIC DEHN FILLING
so we look at the real part and using (31) we discover that
0 = ℜ
∑
j
log wj =
∑
j
log |wj | =
∑
j
(
log sin α1
j − log sin α2
j
)
where α1
j and α2
j are the other two angles in the tetrahedron with modulus
wj, in counterclockwise order. The latter expression is equivalent to
−
3n∑
j=1
(A∗
n+i )j log sin θj = ∂Vol
∂A∗
n+i
which is hence zero for alli = 1, . . . , n.
We make some analogous considerations for the completeness equa-
tions. Since z 0 is complete, for every simplicial boundary curveγ we have∑
j log wj = |γ|πi where w1, . . . , wk are the moduli encountered byγ at
its right, and the real part of this equation implies that∂Vol
∂v∗γ
= 0.
Proposition 15.4.2 shows that vectors of typeA∗
n+i and v∗
γ generate
TθA, hence the gradient ofVolvanishes atθ. Since Volis strictly concave,
this critical point is the unique global maximum. □
Corollary 15.4.5. The space Def(M, T ) contains at most one com-
plete solution.
15.4.5. VolumesandDehnﬁlling. WecannowproveTheorem15.4.1
onmanifoldshavingageometricidealtriangulation. Westartwitha“local”
version which also considers generalised Dehn ﬁllings, see Section 15.1.1.
Lemma 15.4.6. If M has a geometric ideal triangulation, there is
a neighbourhood U of (∞, . . . ,∞) such that Vol(Mﬁll) < Vol(M) for
every non-trivial generalised Dehn ﬁlling parameter s ∈ U. Moreover
Vol(Mﬁll) ↗ Vol(M) as s tends to (∞, . . . ,∞).
Proof. The Dehn Filling Theorem 15.1.1 says that all Dehn ﬁllings in
an open neighbourhoodU of (∞, . . . ,∞) are hyperbolic and constructed
by completing solutions inDef(M, T ), and they have smaller volume than
M in virtue of Proposition 15.4.4. (The completion adds a circle toM
which does not contribute to the volume.)
The volume of Mﬁll depends smoothly on s ∈ U and has a global
maximum at (∞, . . . ,∞). In particular, when s → (∞, . . . ,∞) we get
Vol(Mﬁll) → Vol(M) from below. □
We now need to drop the open setU and prove that volume decreases
under any Dehn ﬁlling ofM.
Lemma 15.4.7. Let M have a geometric ideal triangulation. If a non-
trivial Dehn ﬁllingMﬁll admits a complete ﬁnite-volume hyperbolic metric,
then Vol(Mﬁll) < Vol(M).


## Page 483

15.4. VOLUMES 475
Proof. Let s = (s1, . . . , sc) be the Dehn ﬁlling parameter givingMﬁll
and let U be the open neighbourhood of(∞, . . . ,∞) furnished by Lemma
15.4.6. For suﬃciently big integerk > 0 we have ks ∈ U and hence Mﬁll
also admits a hyperbolic metric with cone angles2π
k on the core geodesics
of the ﬁlling solid tori, with volume strictly smaller thanVol(M). We may
interpret this metric as a hyperbolic orbifoldO, and we have Vol(O) <
Vol(M).
If Mﬁll is closed Proposition 13.3.8 gives
Vol(M) > Vol(O) ⩾ v3∥Mﬁll∥ = Vol(Mﬁll)
and we are done.
If Mﬁll is not closed, we can ﬁnd some closed ﬁllings ofMﬁll with
volume arbitrarily close toVol(O) that can be interpreted as orbifolds, and
get Vol(O) ⩾ Vol(Mﬁll) as a limit. □
The proof of Lemma 15.4.7 shows also the following.
Lemma 15.4.8. Let M have a geometric ideal triangulation. We have
v3∥Mﬁll∥ < Vol(M) for every closed Dehn ﬁllingMﬁll of M.
We prove a lemma that will be useful below.
Lemma 15.4.9. Let M have a geometric ideal triangulation. IfMi is
a hyperbolic Dehn ﬁlling ofM with parameter s i and Vol(Mi ) → Vol(M),
then s i → (∞, . . . ,∞).
Proof. We may suppose that theMi are closed, since every sequence
of Dehn ﬁllings can be approximated by a sequence of closed ones. Ifs i
lies deﬁnitely in the open setU furnished by Theorem 15.1.1, the asser-
tion follows because the volume function there hasVol(M) as a unique
maximum (thanks to Proposition 15.4.4).
Otherwise, there is a ﬁxed bigk ∈ N such that ks i ∈ U for all i on a
subsequence, butks i does not converge to(∞, . . . ,∞). Thus Mi admits a
hyperbolicorbifoldstructure Oi with Vol(M)−ε > Vol(Oi )andProposition
13.3.8 gives Vol(M) − ε > Vol(O) ⩾ v3∥Mi ∥ = Vol(Mi ) ∀i. □
Again, the proof shows also the following.
Lemma 15.4.10. Let M have a geometric ideal triangulation. IfMi is
a closed Dehn ﬁlling ofM with parameters i and v3∥Mi ∥ → Vol(M), then
s i → (∞, . . . ,∞).
To conclude the proof of Theorem 15.4.1 we only need to consider
the unlucky case whereM has no geodesic ideal triangulations. We prove
that geometric triangulations exist on some ﬁnite cover ofM, and this will
suﬃce for our purposes.


## Page 484

476 15. HYPERBOLIC DEHN FILLING
15.4.6. Geometric triangulations exist virtually.We prove here the
following result.
Theorem 15.4.11.Every cusped complete ﬁnite-volume 3-manifoldM
has a ﬁnite-sheeted cover˜M with a geometric ideal triangulationT.
Proof. The Epstein-Penner decomposition subdivides M into ideal
polyhedra P1, . . . , Pk. If distinct vertices ofPi lie in distinct cusps ofM for
all i, then the decomposition can be easily subdivided into an ideal trian-
gulation: we order the cusps, so the vertices of eachPi inherit an ordering
which is preserved along the matching faces; we subdivide eachPi as in
the proof of Proposition 15.3.2 by coning on the smallest vertex at each
step: the triangulations on the paired faces match and we get a geometric
ideal triangulation forM itself.
We now show that some cover˜M has a decomposition of this type.
The decomposition ofM into P1, . . . , Pk lifts in any degree-d cover ˜M to
a decomposition of ˜M into P i
1, . . . , Pi
k with i = 1 , . . . , d. We now prove
that there is a˜M such that distinct vertices ofP i
j lie in distinct cusps, for
all i , j.
To do so, we prove that for every pair of verticesv ̸= v′ of some
Pi there is a covering where the lifts˜v , ˜v′ in P j
i for some j lie in distinct
cusps. This is enough to conclude: pick aregular covering ˜M that covers
all these ﬁnitely many coverings; since its desk transformation group acts
transitively on lifts, all distinct vertices on everyP j
i lie in distinct cusps.
We have M = H3/Γ. We ﬁx an arbitrary lift ˜Pi ⊂ H3 of Pi. Two
vertices v ̸= v′ of Pi lie in the same cuspT ⇔ there is a γ ∈ Γ such
that γ(˜v) = ˜v′, where ˜v , ˜v′ ∈ ˜Pi are the lifts of v , v′. The subgroup
StabΓ(˜v) = π1(T ) is separable by Corollary 4.3.13 and hence there is a
ﬁnite-index H < Γ that contains StabΓ(˜v) but avoids γ.
No element ϕ ∈ H is such thatϕ(˜v) = ˜v′, otherwise we would have
γ−1ϕ ∈ StabΓ(v) < H and hence γ ∈ H, a contradiction. We have
constructed a ﬁnite-coverH3/H where in some liftP j
i of Pi the two lifted
vertices ˜v , ˜v′ lie in distinct cusps. □
15.4.7. Conclusionoftheproof. WecannowproveTheorem15.4.1.
Proof of 15.4.1. Some degree- d cover ˜M of M has an ideal geometric
triangulation, hence the theorem holds for˜M.
For every Dehn ﬁllingMﬁll of M, there is a Dehn ﬁlling˜Mﬁll of ˜M such
that the cover ˜M → M extends to a degree-d map ˜Mﬁll → Mﬁll.
If Mﬁll is closed hyperbolic, we have
dVol(M) = Vol( ˜M) > v 3∥( ˜Mﬁll)∥ ⩾ d v3∥Mﬁll∥ = dVol(Mﬁll)
using Lemma 15.4.8, henceVol(M) > Vol(Mﬁll).
If Mﬁll is cusped hyperbolic, it can be approximated by closed hyper-
bolic ﬁllings Mﬁll
i , and there are closed ﬁllings˜Mﬁll
i of ˜Mﬁll with degree-d


## Page 485

15.4. VOLUMES 477
maps ˜Mﬁll
i → Mﬁll
i . By Lemma 15.4.10 there is anε > 0 such that
Vol( ˜M) − ε > v 3∥ ˜Mﬁll
i ∥ ⩾ d v3∥Mﬁll
i ∥ = dVol(Mﬁll
i )
for all i, hence dVol(M) − ε = Vol( ˜M) − ε ⩾ dVol(Mﬁll). □
15.4.8. Bounded volume. How many hyperbolic manifolds are there
with bounded volume? In general, inﬁnitely many.
Wehavejustdiscoveredthatthereareinﬁnitelymanyhyperbolicmani-
folds with volume smaller than2v3 = 2.0298832128 . . .because the ﬁgure-
eight knot complementM has Vol(M) = 2 v3 and every hyperbolic Dehn
ﬁlling of M has volume smaller thanVol(M). Moreover, the volumes of
the Dehn ﬁllings ofM form an indiscrete set that tends to2v3 from below.
Theorem 15.4.1 shows that this is the typical situation: the hyperbolic
Dehn ﬁlling produces inﬁnite sequences of manifolds with bounded volume.
Despite this variety of manifolds, we can still control topologically the
hyperbolic manifolds having bounded volume, at least in principle.
Theorem 15.4.12. For everyV > 0 there is a compact 3-manifoldN
bounded by tori, such that every complete ﬁnite-volume orientable hyper-
bolic 3-manifold M with Vol(M) < V is diﬀeomorphic to the interior of
some Dehn ﬁlling ofN.
Proof. This is a consequence of the thick-thin decomposition. Let
ε > 0 be a ﬁxed Margulis constant: every complete ﬁnite-volumeM de-
composes along disjoint embedded tori asM = Mthick ∪ Mthin where Mthick
is compact and has injectivity radius> ε, and Mthin consists of truncated
cusps and tube neighbourhoods of short geodesics. In particularM is a
Dehn ﬁlling ofMthick.
Wenowshowthatthereareonlyﬁnitelymanypossiblediﬀeomorphism
typesfor Mthick withvolume < V . Thisconcludestheproof: byProposition
11.3.18 every such diﬀeomorphism type is realised from a linkL ∪ C ⊂ S3
by surgerying alongL and drilling alongC; we take a disjoint union of all
these links inS3, and the complement of the resulting link inS3 is our N.
Let X ⊂ Mthick be amaximal ε
2-net, that is a ﬁnite set of points that
stay at pairwise distance⩾ ε
2, such that every other point inMthick stays
at distance < ε
2 from X (X exists because Mthick is compact). The ε
4-
balls centred at the points inX are embedded and disjoint: henceX has
cardinality at mostC(V ) = V /Vol
(
B(x , ε
4 )
)
.
The set X determines a cellularisation of Mthick as follows. Lift X
to ˜X ⊂ H3, take the Voronoi tessellation (see Section 3.3.4) determined
by ˜X and project it back toM: this furnishes a subdivision ofMthick into
polyhedra. Since X is maximal, every polyhedron has at mostC′(ε) faces
with C′ depending only onε. Hence there are ﬁnitely many combinatorial
types of polyhedra, depending only onε. With at mostC(V ) of them we


## Page 486

478 15. HYPERBOLIC DEHN FILLING
obtain only ﬁnitely many manifolds. (The proof of Proposition 11.1.6 ap-
plies to polyhedra and shows that the combinatorial subdivision determines
the smooth manifold.) □
15.4.9. Volumesofhyperbolicthree-manifolds. Weﬁnishthischap-
ter by furnishing some qualitative information on the set of volumes of
hyperbolic three-manifolds. We start with the following.
Proposition 15.4.13.Let Mi be a sequence of non-diﬀeomorphic com-
plete orientable hyperbolic three-manifolds of uniformly bounded volume.
After passing to a subsequence, we may suppose that there is a hyper-
bolic manifold M such that eachMi is a Dehn ﬁlling ofM with parameter
s i → (∞, . . . ,∞) .
Proof using geometrisation. We know from Theorem 15.4.12 that
there is a manifoldN such that each Mi is a Dehn ﬁlling ofN with pa-
rameter s i. After passing to a subsequence, we may suppose that at each
boundary torus Tj of N the slope s i
j is either constant or goes to inﬁnity.
Let M be obtained fromN by Dehn ﬁlling the slopes that stay constant.
If M is hyperbolic, we are done. Unfortunately, this may not be the
case, and we use geometrisation to solve this annoying possibility (the
originalproofofJørgensenandThurston[ 56]doesnotneedgeometrisation
and follows from a discussion on the geometric convergence of hyperbolic
manifolds: we employ geometrisation only for simplicity). If M is not
prime, it contains some essential spheres that always bound balls in the
ﬁlled Mi and hence we may cut M along them and cup oﬀ with balls
(reducing the components of ∂M). Now M is prime and its geometric
decomposition must contain some hyperbolic block, otherwiseM would be
a graph manifold and no Dehn ﬁlling ofM would be hyperbolic (it would
be a graph manifold again). The tori of the decomposition ofM become
compressiblein Mi, souptopassingtoasubsequencewemaysupposethat
each Mi is a Dehn ﬁlling of one ﬁxed hyperbolic block ofM. If si does not
tend to(∞, . . . ,∞) in this new setting, we restart from the beginning and
proceed by induction on the number of boundary components ofM. □
Corollary 15.4.14. The set of volumes of all complete orientable hy-
perbolic three-manifolds is well-ordered. For every valueV there are only
ﬁnitely many such manifolds with volumeV.
Proof. Suppose that there are Mi with Vol(M1) > Vol(M2) > . . .
By the previous proposition these are all obtained by Dehn ﬁlling the same
hyperbolic M with s i → (∞, . . . ,∞), andTheorem15.4.1saystheyshould
converge to Vol(M) from below, a contradiction. The same argument
show that there are ﬁnitely many manifolds of any ﬁxed volume. □
We deduce that the volumes of all the complete orientable hyperbolic
three-manifolds are indexed by countable ordinals. The volumesv1 < v 2 <


## Page 487

15.4. VOLUMES 479
Figure 15.14. The volumes of complete orientable hyper-
bolic 3-manifolds form a well-ordered subset ofR of typeωω.
. . . , of the smallest closed manifolds converge to the volumevω of the
smallest 1-cusped manifold; the volumesvω < v 2ω < . . . of the smallest
1-cusped manifolds converge to the volumevω2 of the smallest 2-cusped
manifold, and so on. The set of volumes has order typeωω, see Figure
15.14. We can also deduce the following.
Corollary 15.4.15.For everyV > 0 and R > 0 there are ﬁnitely many
closed hyperbolic 3-manifoldsM with Vol(M) < V and inj(M) > R.
Proof. On a sequence of closed hyperbolic 3-manifolds with bounded
volume, the length of some core geodesic tends to zero. □
15.4.10. References. TofurnishacompleteproofofThurston’sDehn
ﬁlling Theorem we have patched together a number of diﬀerent sources.
The most relevant ones are as usual Thurston’s notes [56], Benedetti –
Petronio [4], and Ratcliﬀe [49], together with Neumann – Zagier [42].
Some arguments have been updated here in light of some new results
that were discovered more recently by some authors. The list of non-
exceptional slopes for the ﬁgure-eight knot and the Whitehead link can
be found in Martelli – Petronio [38]. The smoothness of the deformation
space stated in Corollary 15.2.13 has been proved by Choi [13] in 2004.
Manyoftheargumentsofthischapter, includingallthediscussiononangle
structures, have been taken from a nice paper of Futer – Guéritaud [21].


## Page 488

480 15. HYPERBOLIC DEHN FILLING
The ﬁrst complete proof of Thurson’s Dehn ﬁlling Theorem, that takes
care of the annoying case of triangulations with ﬂat tetrahedra, is due to
Petronio – Porti [48]. We diverge from that proof in the last arguments,
where we extend Choi’s smoothness theorem to this partially ﬂat context
in Proposition 15.3.4 (this proposition is probably the only original result
of this book). The virtual existence of geometric triangulations was proved
by Luo – Schleimer – Tillmann [37] in 2008.


## Page 489

Bibliography
[1] I. Agol, The minimal volume orientable hyperbolic 2-cusped 3-manifolds ,
Proc. Amer. Math. Soc.138 (2010), 3723–3732.
[2] I. R. Aitchison – J. H. Rubinstein,Localising Dehn’s lemma and the loop theorem in
3-manifolds, Math. Proc. Cambrdge Phil. Soc.137 (2004), 281 – 292.
[3] J.Aramayona–C.J.Leininger, Hyperbolicstructuresonsurfacesandgeodesiccurrents ,
in“AlgorithmicandGeometricTopicsAroundFreeGroupsandAutomorphisms”, withV.
Diekert, C.Leininger, P.Silva, A.Weiss.AdvancedCoursesinMath(CRM),Birkhauser.
[4] R. Benedetti – C. Petronio, “Lectures on hyperbolic geometry,” Universitext, Springer-
Verlag, 1991.
[5] M.Bestvina, K.Bromberg, K.Fujiwara, J.Souto, Shearingcoordinatesandconvexityof
length functions on Teichmüller space, American Journal of Math.135 (2013), 1449–
1476.
[6] F. Bonahon. Bouts des variétés hyperboliques de dimension 3, Ann. of Math. 124
(1986), 71–158.
[7] , The geometry of Teichmüller space via geodesic currents, Invent. Math. 92
(1988), 139–162.
[8] , Geometric structures on 3-manifolds, Handbook of Geometric Topology
(2002), Elsevier, 93–164.
[9] D. Calegari, “Foliations and the Geometry of 3-Manifolds,” Oxford University Press,
2007.
[10] P. J. Callahan – M. V. Hildebrand – J. R. Weeks,A census of cusped hyperbolic3-
manifolds, Math. Comp.68 (1999), 321-332.
[11] C. Cao – G. R. Meyerhoﬀ,The orientable cusped hyperbolic 3-manifolds of minimum
volume, Invent. Math.146 (2001), 451–478.
[12] A. J. Casson – S. A. Bleiler, “Automorphisms of surfaces after Nielsen and Thurston”,
LondonMathematicalSocietyStudentTexts 9, CambridgeUniversityPress, Cambridge,
1988.
[13] Y-E. Choi,Positively oriented ideal triangulations on hyperbolic three-manifolds, Topol-
ogy 43 (2004), 1345–1371.
[14] H. Coxeter, “Regular Polytopes,” Dover, II edition, 1963.
[15] M. Culler – N. Dunﬁeld – J. Weeks, SnapPy, a computer program for studying the
geometry and topology of 3-manifolds,http://www.math.uic.edu/t3m/SnapPy/
[16] M. P. Do Carmo, “Riemannian Geometry,” Birkhäuser, 1992.
[17] D. B. A. Epstein – R. C. Penner,Euclidean decompositions of noncompact hyperbolic
manifolds, J. Diﬀ. Geom.27 (1988), 67–80.
[18] B. Farb – D. Margalit, “A primer on the mapping class group,” Princeton Mathematical
Series 49, Princeton University Press, 2011.
[19] A. Fathi – F. Laudenbach – V. Poénaru, “Travaux de Thurston sur les surfaces,”
Astérisque, 66-67, Soc. Math. France, Paris, 1979.
[20] A. T. Fomenko – S. V. Matveev, “Algorithmic and computer methods for three-
manifolds”, Mathematics and its Applications,425, Kluwer Academic Publishers, Dor-
drecht, 1997.
[21] D. Futer – F. Guéritaud,From angled triangulations to hyperbolic structures, Contem-
porary Mathematics541 (2011), 159–182.
[22] D. Gabai – R. Meyerhoﬀ – P. Milley, Minimum volume cusped hyperbolic three-
manifolds, J. Amer. Math. Soc.22 (2009), 1157–1215.
[23] R. E. Gompf – A. I. Stipsicz, “4-Manifolds and Kirby calculus,” Amer. Math. Soc. Prov-
idence, RI (1999).
481


## Page 490

482 BIBLIOGRAPHY
[24] U. Haagerup – H. J. Munkholm,Simplices of maximal volume in hyperbolicn-space,
Acta Math. 147 (1981), 1–11.
[25] A. Hatcher, “Algebraic Topology,” Cambridge University Press, 2002, available from
https://www.math.cornell.edu/ hatcher/AT/ATpage.html
[26] , “Notes on Basic 3-Manifold Topology,” available from
http://www.math.cornell.edu/~hatcher/3M/3Mdownloads.html
[27] ,Measuredlaminationspacesforsurfacesfromthetopologicalviewpoint ,Topol-
ogy Appl. 30 (1988), 63–88.
[28] C. D. Hodgson – J. R. Weeks,Symmetries, isometries and length spectra of closed
hyperbolic three-manifolds, Experiment. Math.3 (1994), 261-274.
[29] J. Hoste – M. Thistlethwaite – J. Weeks,The First 1,701,936 Knots, Math. Intell.20,
33–48.
[30] J. H. Hubbard, “Teichmüller Theory and Applications to Geometry, Topology, and Dy-
namics,” Volume I: Teichmüller Theory.
[31] W. H. Jaco – P. B. Shalen, Seifert ﬁbered spaces in 3-manifolds , Memoirs of
Amer. Math. Soc.21 (1979).
[32] K. Johannson, “Homotopy equivalences of 3-manifolds with boundaries,” Lecture Notes
in Mathematics 761, Springer, Berlin (1979)
[33] H. Kneser, Geschlossene Flächen in dreidimensionalen Mannigfaltigkeiten ,
Jahr. Deutsch. Math. Verein.38 (1929), 248–260.
[34] A. Kosinski, “Diﬀerential Manifolds”, Academic Press, 1993.
[35] J. Lee, “Introduction to Riemannian Manifolds”, Springer Graduate Texts in Mathemat-
ics 176, 2018.
[36] D. D. Long, Immersions and embeddings of totally geodesic surfaces, Bull. London
Math. Soc. 19 (1987), 481–484.
[37] F. Luo – S. Schleimer – S. Tillmann, Geodesic ideal triangulations exist virtually,
Proc. Amer. Math. Soc.136 (2008), 2625–2630.
[38] B.Martelli–C.Petronio, Dehnﬁllingofthe‘magic’3-manifold , Comm.Anal.Geom. 14
(2006), 967–1024.
[39] C. McMullen, “Riemann surfaces, dynamics and geometry,” available from
http://www.math.harvard.edu/~ctm/papers/index.html
[40] , The Gauss-Bonnet theorem for cone manifolds and volumes of moduli spaces,
to appear in Amer. J. Math.
[41] J. Milnor,A unique factorization for 3-manifolds, Amer. J. Math.84 (1962), 1–7.
[42] W. Neumann – D. Zagier,Volumes of hyperbolic three-manifolds, Topology24 (1985),
307–332.
[43] P. Orlik, “Seifert manifolds,” Lecture notes in mathematics, Springer291 (1972).
[44] R. C. Penner, A construction of pseudo-Anosov homeomorphisms ,
Trans. Amer. Math. Soc.310 (1988), 179–197.
[45] G. Perelman, The entropy formula for the Ricci ﬂow and its geometric applications,
2002, arXiv:math/0211159
[46] , Ricci ﬂow with surgery on three-manifolds, 2003, arXiv:math/0303109
[47] , Finite extinction time for the solutions to the Ricci ﬂow on certain three-
manifolds, 2003, arXiv:math/0307245
[48] C. Petronio – J. Porti,Negatively oriented ideal triangulations and a proof of Thurston’s
hyperbolic Dehn ﬁlling theorem, Expos. Math.18 (2000), 1–35.
[49] J. Ratcliﬀe, “Foundations of hyperbolic manifolds”, Graduate texts in mathematics149,
Springer-Verlag, 1994.
[50] D. Rolfsen, “Knots and links,” Publish or Perish (1976).
[51] T. B. Rushing, “Topological embeddings,” Pure and Applied Mathematics52, Academic
Press Inc, 1973.
[52] P. Scott,The geometries of 3-manifolds, Bull. London Math. Soc.15(1983), 401–487.
[53] H. Seifert,Topologie dreidimensionaler gefaserter Räume, Acta Math.60 (1933) 147–
238.
[54] S. Smale,Diﬀeomorphisms of the 2-sphere, Proc. Amer. Math. Soc.10 (1959), 621–
626.
[55] W. Thurston, On the geometry and dynamics of diﬀeomorphisms of surfaces ,
Bull. Amer. Math. Soc.19 (1988), 417–431.
[56] “The geometry and topology of three-manifolds,” Princeton University Mathe-
matics Department, 1979.
[57] , “Three-dimensional geometry and topology,” Volume I, edited by Silvio Levy,
Princeton Mathematical Series,35, 1997


## Page 491

BIBLIOGRAPHY 483
[58] , Three-dimensional manifolds, Kleinian groups and hyperbolic geometry .
Amer. Math. Society. Bulletin.6 (1982), 357–381.
[59] E. B. Vinberg,Hyperbolic reﬂection groups, Russian Math. Surveys40 (1985), 31–75.
[60] F. Waldhausen,Eine Klasse von 3-dimensionalen Mannigfaltigkeiten, Invent. Math. 3
(1967), 308-333
[61] K. Yoshida,The minimal volume orientable hyperbolic 3-manifold with 4 cusps, Paciﬁc
Math. 266 (2013), 457–476.


## Page 492

[No extractable text on this page]


## Page 493

Index
Dn, 49
Hn, 53
In, 45
L(p, q), 97
O(n, 1), 47
O+(n, 1), 47
[X, Y ], 113
Λ(Γ), 135
Nil geometry, 388
Ω(Γ), 137
SO(3), 167
Sol geometry, 398
M, 244
ML, 244
S, 210
RPn, 96
˜SL2 geometry, 394
3-torus, 325
Alexander theorem, 277
Alexander trick, 181
algebraic intersection, 36
algebraic intersection of curves, 156
angle structure, 471
Anosov diﬀeomorphism, 262
ball with holes, 285
barycenter, 70
Betti number, 35
Bieberbach Theorem, 132
Borel measure, 23
Borel set, 23
box, 228
Brieskorn homology sphere, 322
Cartan–Hadamard theorem, 39
Cayley graph, 143
cell complex, 37
aspherical cell complex, 38
centraliser, 125
change of coordinates principle, 171
Christoﬀel symbol, 19
closed curve, 169
collar, 13
collar lemma, 208
commensurability of manifolds, 325
commutator, 26
commutator subgroup, 26
compressing disc, 290
connected sum, 14, 275
contact structure, 389
convex combination, 70
convex core, 137
convex hull, 78
convex subset, 78
convexity of the distance function, 69
convexity of the length functions, 200
Coxeter graph, 94
cross-ratio, 58, 424
curvature, 19
cusp, 111
truncated cusp, 112
cut and paste, 13
cut locus, 92
Dehn ﬁlling, 305
Dehn lemma, 302
Dehn surgery, 356
Dehn twist, 187
derived series, 26
developing map, 74, 99
diﬀeomorphism, 9
local diﬀeomorphism, 10
Dirichlet domain, 90
disc, 13
essential disc, 287
domain of discontinuity, 137
earthquake, 196
earthquake map, 197
elliptic manifold, 73
with cone angles, 101
with geodesic boundary, 97
embedding, 11
Epstein–Penner decomposition, 139
Euclid’s V postulate, 49
Euler characteristic, 37
of an orbifold, 163
Euler number, 314, 315, 320
exotic sphere, 182
485


## Page 494

486 INDEX
exponential map, 18
Fenchel–Nielsen coordinates, 204
ﬁbre bundle, 11
ﬁnite presentation, 25
ﬁnite-order mapping class, 262
ﬂat manifold, 73
with cone angles, 101
with geodesic boundary, 97
ﬂat torus, 95, 132
fundamental class, 35, 412
fundamental domain, 90
Gauss–Bonnet formula, 166
gaussian curvature, 20
geodesic, 16
closed geodesic, 113
geodesic half-line, 58
geodesic current, 227
geodesic lamination, 241
full, 243
measured geodesic lamination, 243
projective measured geodesic
lamination, 256
stable and unstable measured
geodesic lamination, 266
geodesic spectrum, 123
geometric decomposition, 368
geometric group theory, 143
geometric intersection of curves, 174
geometric structure, 372
geometrisation conjecture, 403
Gieseking manifold, 431
graph manifold, 369
group
automorphism group, 125
binary group, 374
crystallographic group, 132
elementary group, 118, 136
Heisenberg group, 27, 388
Lie group, 28
unimodular Lie group, 30
mapping class group, 186
nilpotent group, 26
outer automorphism group, 125
perfect group, 272
quaternion group, 375
reﬂection group, 94
residually ﬁnite group, 31
Schottky group, 138
solvable group, 26
Torelli group, 186
triangle group, 92
von Dyck group, 105
handle decomposition, 40
handlebody, 280
Heegaard genus, 346
Heegaard splitting, 346
hexagonal torus, 96
hierarchy, 299
holonomy, 100
homology group, 35
homology sphere, 272
Hopf – Rinow theorem, 17
Hopf ﬁbration, 315
horosphere, 62
hyperbolic Dehn ﬁlling theorem, 445
hyperbolic ideal triangulation, 427
hyperbolic manifold, 73
with cone angles, 101
with geodesic boundary, 97
hyperbolic point, 139
hyperbolic space, 45
compactiﬁcation of hyperbolic space,
59
conformal model, 51
disc model, 50
half-space model, 53
hyperboloid model, 45
Klein model, 57
projective model, 57
subspace of hyperbolic space, 47
ideal tetrahedron, 409, 423
ideal triangulation, 213
immersion, 11
injectivity radius, 18
innermost argument, 175
intersection form in homology, 36
intersection form on currents, 233
isometry, 21
elliptic, parabolic, and hyperbolic
isometry, 62
isometry group, 33
local isometry, 22
isotopy, 12
JSJ decomposition, 366
Kirby diagram, 357
Klein bottle, 96
knot, 347
achiral and chiral knot, 348
cable knot, 353
crossing number, 349
ﬁgure-eight knot, 349
prime and composite knot, 349
satellite knot, 353
Seifert genus, 356
torus knot, 351
trefoil knot, 348
lagrangian subgroup, 273
lattice, 95
Lefschetz duality, 35
length function, 198
lens space, 97, 307
Levi-Civita connection, 19
Lie algebra, 31
limit set, 135
line, 48
link, 347
Hopf link, 352
split link, 349
torus link, 351
link complement, 348


## Page 495

INDEX 487
link of a vertex, 42
Liouville current, 232
Liouville map, 232
Liouville measure, 230
Lipschitz unit, 375
Lobachevsky function, 407
Lorentzian scalar product, 45
lower central series, 26
Möbius transformation and
anti-transformation, 64
manifold, 7
closed manifold, 13
diﬀerentiable manifold, 8
manifold with boundary, 13
mirrorable manifold, 275
oriented manifold, 9
Riemannian manifold, 15
homogeneous Riemannian
manifold, 371
isotropic Riemannian manifold, 371
Margulis constant, 118
Margulis Lemma, 117
maximum dilatation, 144
Mayer – Vietoris sequence, 35
meridian and longitude, 307
metric tensor, 15
minimum displacement, 64
modular group, 76
moduli space, 193
Morse function, 277
Mostow–Prasad rigidity theorem, 407,
469
multicurve, 178
Myers – Steenrod theorem, 33
nearest point retraction, 137
normal space, 11
normal surface, 281
vertex-linking normal surface, 281
normaliser, 124, 306
orbifold, 102
geometrisation of orbifolds, 164
hyperbolic, ﬂat, elliptic orbifold, 105
isotropy group of an orbifold, 102
local model of an orbifold, 102
orbifold covering, 104
the bad, the good, and the very good
orbifold, 104
pair-of-pants, 158
pants decomposition, 178
weighted pants decomposition, 239
parabolic point, 139
parallel transport, 70
pencil, 228
Perron-Frobenius matrix, 266
PIP structure, 257
Poincaré duality, 35
Poincaré homology sphere, 322, 382
polyhedron, 78
Coxeter polyhedron, 93
ﬁnite polyhedron, 78
ideal polyhedron, 79
regular polyhedron, 85
prime decomposition of three-manifolds,
285
principal congruence subgroup, 77
pseudo-Anosov mapping class, 262
pseudo-isometry, 144
pseudosphere, 112
quasi-isometry, 143
quaternion, 372
reducible mapping class, 262
reﬂection, 48
regular curve, 169
regular polytope, 375
Reidemeister torsion, 308
Ricci tensor, 19
Riemann tensor, 19
scalar curvature, 19
Schönﬂies problem, 278
Schläﬂi notation, 86
sectional curvature, 20
Seifert ﬁbration, 318
Seifert manifold, 317
Seifert surface, 355
Selberg lemma, 31, 77
separable subgroup, 127
shear coordinates, 213
shortest geodesic, 124
simplex
characteristic simplex, 95
simplicial complex, 41
simplicial volume, 407, 412
slope, 306
Smale theorem, 184
smooth Jordan curve theorem, 157
solid torus, 287
standard ﬁbered solid torus, 317
sphere, 16
essential sphere, 287
sphere inversion, 52
sphere system, 285
spine, 91
star of a vertex, 42
submanifold
diﬀerentiable submanifold, 10
Riemannian submanifold, 23
totally geodesic submanifold, 23
subspace
incident, asymptotically parallel,
ultra-parallel subspaces, 61
surface
∂-compressible and ∂-incompressible
surface, 292
∂-parallel surface, 287
classiﬁcation of surfaces, 155
compressible and incompressible
surface, 290
essential surface, 303
genus of a surface, 154
surface of ﬁnite type, 156


## Page 496

488 INDEX
surface bundle overS1, 362
symplectic basis, 156
symplectic form, 36
tangent space, 9
Teichmüller space, 193
tessellation, 82
Farey tessellation, 84
regular tessellation, 85
Voronoi tessellation, 89
thick-thin decomposition, 119
three-manifold, 271
RP2-irreducible three-manifold, 290
∂-irreducible three-manifold, 287
atoroidal and acylindrical
three-manifold, 303
geometric three-manifold, 403
Haken three-manifold, 296
Hantzsche-Wendt manifold, 385
irreducible three-manifold, 276
prime three-manifold, 278
simple three-manifold, 303
Thurson’s hyperbolicity equations, 429
Thurston’s compactiﬁcation theorem,
223
topological lamination, 252
torus
hexagonal torus, 95
torus bundle, 364
torus decomposition, 366
train track, 246
bigon track, 267
transverse map, 15
triangulation, 42
tube, 110
tubular neighbourhood, 12
unknot, 348
vector
time-like, light-like, and space-like
vector, 45
vector bundle, 11
vector ﬁeld, 11
volume, 17
volume form, 17
