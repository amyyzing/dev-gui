# Forms on Manifolds

Source title: chap4-new7.dvi

Converted from: `23.pdf`


## Page 1

CHAPTER 4: FORMS ON MANIFOLDS
JUSTIN M. CURRY
Contents
1. Manifolds 2
1.1. The Notion of a Topological Space 2
1.2. The Hausdorﬀ Axiom 3
1.3. Paracompactness 3
1.4. Manifolds Deﬁned 4
1.5. Diﬀerentiable Manifolds 4
1.6. Smooth Mappings between Manifolds 7
1.7. Smooth Mappings between Arbitrary Subsets 8
1.8. Submanifolds 9
1.9. A More Intuitive Picture 9
1.10. Exercises 10
2. Tangent Spaces 12
2.1. Curves and Tangents 13
2.2. Mappings between Tangent Spaces 14
2.3. The Inverse Function Theorem 16
2.4. Submersions 17
2.5. Submanifolds and Regular Values 19
2.6. Immersions 20
2.7. Immersions and the Subset Picture 21
2.8. Exercises 23
3. Vector Fields on Manifolds 23
3.1. Push-Forwards and Pull-Backs 24
3.2. Smooth Vector Fields 24
3.3. Integral Curves 25
3.4. ODE Theory on Manifolds 25
3.5. Complete Vector Fields 26
3.6. One-Parameter Groups of Diﬀeomorphisms 28
3.7. Exercises 29
4. Diﬀerential Forms on Manifolds 31
4.1. Push-Forwards and Pull-Backs 31
4.2. Smooth k-forms 32
4.3. The Exterior Diﬀerentiation Operation 33
1


## Page 2

2 JUSTIN M. CURRY
4.4. The Interior Product and Lie Derivative Operation 34
4.5. Exercises in Symplectic Geometry: The Cotangent Bundl e 35
5. Some Topological Results 36
5.1. The Support of a Function 36
5.2. Partitions of Unity 37
5.3. Proper Mappings 37
5.4. The Whitney imbedding theorem 38
It is our agenda in this chapter to extend to manifolds the res ults of
Chapters 2 and 3 and to reformulate and prove manifold versio ns of two
of the fundamental theorems of integral calculus: Stokes’ t heorem and
the divergence theorem. In this ﬁrst section we aim to introd uce the
necessary background to understand the term “manifold”. In doing
so, we will be able to say much more sophisticated things than “a
manifold is something which locally looks like Rn”. Other results in
diﬀerential topology beyond integral calculus will also be come much
easier to handle once this ﬁrst section is understood.
1. Manifolds
Before we can state the abstract deﬁnition of a manifold, we m ust
ﬁrst restate some background material from topology, most n otably,
the deﬁnition of a topological space.
1.1. The Notion of a Topological Space.
Deﬁnition 1.1. Let X be a set and J a collection of subsets of X.
If J satisﬁes the following properties, then we say that J deﬁnes a
topology on X or (X, J ) is a topological space. The properties are:
(a) X and ∅ are in J .
(b) For every (ﬁnite or inﬁnite) sub-collection U = {Uα,α ∈I} of
J , ⋃
α ∈IUα is in J .
(c) For every ﬁnite sub-collection U = {Ui,i = 1 ,...,n } of J ,⋂n
i=1Ui is in J .
Deﬁnition 1.2. We say that a set U ∈ J is an open subset of X.
Many of you are most likely familiar with the concept of an ope n
set from an introductory analysis course, albeit deﬁned in a diﬀerent
manner than above. The open sets deﬁned in analysis provide a nice
example of the metric space topology.


## Page 3

CHAPTER 4: FORMS ON MANIFOLDS 3
Example 1.3. Let (X,d ) be a non-empty metric space. Recall the
open ball of radius ǫ around a point x0 ∈ X is deﬁned as the set
Bǫ(x0) = {x ∈X,d (x,x 0)<ǫ }. We then say that U ⊆ X is open, i.e.
belongs to the metric space topology Jd if and only if for every x0 ∈U
there exists an ǫ> 0 such that Bǫ (x0) ⊂ U.
For those of you who haven’t had a course in topology and only a
course in analysis, one can assume that “topological space” =“metric
space”, that is, the metric space ( X,d ) induces a topology J on the set
X to make a topological space ( X, J ) according to the above example.
However, topological spaces are more general than metric sp aces as
there are topologies that don’t arise from any metric. It is i mportant
to remember that a topological space is a set with extra data s peciﬁed.
That extra data speciﬁes what the open sets are. For more info rma-
tion on topological spaces, please review Chapter 2 of James Munkres’
Topology.
1.2. The Hausdorﬀ Axiom. One of the nice properties that metric
space topologies satisfy is known as the Hausdorﬀ axiom. (It is an
exercise to show that all metrizable topologies are Hausdor ﬀ.)
Deﬁnition 1.4. (X, J ) is a Hausdorﬀ topological space if for every
p1,p 2 ∈X p1 ̸= p2 there exist open sets Ui i = 1, 2 with pi ∈Ui with
U1 ∩U2 = ∅ .
1.3. Paracompactness. Another nice property that metrizable topolo-
gies have is known as paracompactness. First we oﬀer a preliminary
deﬁnition.
Deﬁnition 1.5. A collection of compact sets Ci ⊆ X is an exhaustion
of X if Ci ⊆ Int(Ci+1) and ⋃Ci =X.
Deﬁnition 1.6. A spaceX is paracompact if there exists an exhaustion
of X by compact sets.
Example 1.7. The space X = Rn is paracompact. Simply build an
exhaustion via n-balls of increasing integer radii, i.e. Ci =Bn
i (0).
Lemma 1.8. Closed subsets of paracompact sets are paracompact.
Proof. If a space X is paracompact then there exists an exhaustion
{Ci} of X be compact sets. Suppose S ⊆ X is a closed subset. Since
closed subsets of compact sets are compact, we have that S is exhausted
by {Ci ∩S}, which are compact. □


## Page 4

4 JUSTIN M. CURRY
1.4. Manifolds Deﬁned. Recall that a homeomorphism is a map be-
tween topological spaces that is continuous and has a contin uous in-
verse. Since continuity is deﬁned in terms of open sets, we ca n think of
two homeomorphic topological spaces as topologically equi valent. As a
convention, we will just say X is a topological space instead of ( X, J ).
We are now in a position to deﬁne what a manifold is.
Deﬁnition 1.9. Let X be a paracompact, Hausdorﬀ space. X is an
n-dimensional manifold (or n-manifold for short) if for every p ∈ X
there exists an open neighborhood U of p in X, an open set V in Rn
and a homeomorphism ϕ :U → V .
Deﬁnition 1.10. The triple (U,V,ϕ ) is called a chart.
The homeomorphism between U ⊆ X andV ⊆ Rn is a rigorous way
of saying that a manifold “locally looks like” Rn.
Deﬁnition 1.11. A chart (U,V,ϕ ) is centered at p if ϕ (p) = 0 ∈ Rn.
Note that since we usually consider only one chart at a time, w e can
always center it via translation.
1.5. Diﬀerentiable Manifolds. The above deﬁnition is the deﬁni-
tion of what is called a topological manifold. For the purposes of this
book, we are interested almost exclusively with diﬀerentiable mani-
folds. Detailing this extra diﬀerentiability condition require s a little
extra work. Just as we began with a set and provided extra data to
deﬁne a topological space, we will have to start with a manifo ld and
specify extra structure to deﬁne a diﬀerentiable manifold. This extra
structure details how various charts interact with each oth er.
Let X be a topological manifold and ( Ui,Vi,ϕ i) i = 1 , 2 be two
charts. We use the following overlap diagram
U1 ∩U2
ϕ 1
↙↙←←←←←←←←← ϕ 2
↘↘↑↑↑↑↑↑↑↑↑
V1, 2
ϕ 1,2 →→
V2, 1
to detail how these charts interact. Here V1, 2 =ϕ 1(U1 ∩U2) and V2, 1 =
ϕ 2(U1 ∩U2). These sets are open subsets of V1 and V2 and ϕ 1, 2 :=
ϕ 2 ◦ϕ − 1
1 |V1,2.
Remark 1.12. The map ϕ 1, 2 is a homeomorphism of V1, 2 and V2, 1. It’s
inverse is ϕ 2, 1 =ϕ 1 ◦ϕ − 1
2 |V2,1.
We now state one of the crucial conditions involved in deﬁnin g a
diﬀerentiable manifold.


## Page 5

CHAPTER 4: FORMS ON MANIFOLDS 5
Deﬁnition 1.13. The charts (Ui,Vi,ϕ ) i = 1, 2 are compatible if ϕ 1, 2
is a diﬀeomorphism. In which case ϕ 2, 1 = (ϕ 1, 2)− 1 is also a diﬀeomor-
phism.
Deﬁnition 1.14. An atlas is a collection of charts
A = {(Uα,Vα,ϕ α ),α ∈I}
such that any two charts in the collection are compatible and ⋃
α ∈IUα =
X.
Deﬁnition 1.15. Let A be an atlas and ( U,V,ϕ ) a chart. ( U,V,ϕ ) is
said to be A-compatible if it is compatible with all charts in A.
Lemma 1.16. If (Ui,Vi,ϕ i) i = 1, 2 are A-compatible, then they are
compatible with each other.
Proof. The proof is left as an exercise. Hint: Let ( Ui,Vi,ϕ i) i = 1, 2, 3
be charts in A. Look at overlap diagrams of the form:
U1 ∩U2 ∩U3
ϕ 1
↙↙←←←←←←←←←←← ϕ 2
↘↘↑↑↑↑↑↑↑↑↑↑↑
V1, 2, 3
ϕ 1,2 →→
V2, 1, 3
Show that in this diagram ϕ 1, 2 =ϕ 2, 3 ◦ϕ 1, 3. □
Deﬁnition 1.17. An atlas A is complete or maximal if every A-
compatible chart is already in A.
Theorem 1.18. Given any atlas A there exists a complete atlas ˆA
containing A.
Proof. Take ˆA to be the atlas consisting of all charts that are compat-
ible with the charts in A. By the above lemma, any two charts in ˆA
are compatible with each other, which, by deﬁnition, makes ˆA an atlas
as well. By construction, ˆA is a complete atlas as well. □
Thus if we’re given an atlas, we can always avail ourselves of the
completion process to turn it into a complete atlas. We are no w in a
position to state the additional “diﬀerentiable structure ” that we must
put on a topological manifold to make it a diﬀerentiable mani fold.
Deﬁnition 1.19. An n-dimensional diﬀerentiable manifold is a pair
(X, A) where X is an n-dimensional topological manifold with a com-
plete atlas A.
One of the simplest examples of a manifold of this type is the u nit
circle S1.


## Page 6

6 JUSTIN M. CURRY
Example 1.20 (The Unit Circle) . Let X = S1 = {(x1,x 2) ∈ R2,x 2
1 +
x2
2 = 1 } and U1 = S1 − (0, 1) and U2 = S1 − (0, −1). We would like
to show that the circle is a one-dimensional manifold. First we must
provide homeomorphisms to open subsets of R. This is accomplished
via stereographic projection. We ﬁrst project from (0 , 1) – also known
as the “north pole” – via ϕ 1 by taking a line passing through (0 , 1) and
any point p ∈ U1 and deﬁning the image ϕ (p) to be the intersection
point of the line with the x-axis. Similarly, we can deﬁne ϕ 2 to be
stereographic projection from the south pole (0 , −1).
Exercise: Write down explicit formulas for ϕ i i = 1, 2 and show that
they deﬁne homeomorphisms onto ϕ i(Ui) =: Vi = R. Then show that
V1, 2 := ϕ 1(U1 ∩U2) and V2, 1 := ϕ 2(U1 ∩U2) both equal R − 0 and
ϕ 1, 2 :=ϕ 2 ◦ϕ − 1
1 = 1
x . Conclude that the pair ( Ui,Vi,ϕ i) i = 1, 2 deﬁne
an atlas on S1. This is known as The Mercator Atlas .
From this atlas we get a complete atlas by our completion proc ess.
This makes S1 into a one-dimensional diﬀerentiable manifold.
Example 1.21 (The n-Sphere). As an exercise, see if you can extend
this construction to Sn, n ≥ 2. Hint: The construction is virtually the
same but the overlap map ϕ 1, 2 : Rn− 1 ∖ 0 → Rn− 1 ∖ 0 is x
||x||2 .
The process of giving a manifold a diﬀerentiable or smooth structure,
may seem a little haphazard, as there are several diﬀerent at lases that
a given manifold could have. The following example illustra tes an
alternative atlas for Sn.
Example 1.22 (The Coordinate Atlas) . In the previous exercise you
were asked to extend the Mercator construction to the n-sphere. That
atlas is in some ways the most eﬃcient in that it requires only two
charts. In this example we construct an atlas that requires 2 n + 2
charts. Our initial data is as follows:
X = Sn = {x ∈ Rn+1, ||x||= 1}
U +
i = {(x1,...,x n+1) ∈ Sn,xi > 0}
U −
i = {(x1,...,x n+1) ∈ Sn,xi < 0}
V = Bn = {y ∈ Rn, ||y||< 1}
ϕ ±
i :U ±
i ⊂ Sn → V ⊂ Rn to be the projection map deﬁned by
ϕ ±
i (x1,...,x n+1) = (x1,..., ˆxi,...,x n+1).
In the case of S2 ⊂ R3, the maps would be ϕ ±
1 (x,y,z ) = ( y,z ),
ϕ ±
2 (x,y,z ) = (x,z ) and ϕ ±
3 (x,y,z ) = (x,y ). The inverse in the general


## Page 7

CHAPTER 4: FORMS ON MANIFOLDS 7
case is
(ϕ ±
i )− 1(x1,..., ˆxi,...,x n+1) = (x1,..., ±
√
1 −
∑
j̸=i
x2
j,...,x n+1).
Exercise: Compute ϕ ±
i ◦(ϕ ±
j )− 1 and show that they are smooth. Deduce
that Sn is a diﬀerentiable manifold.
The previous several exercises may seem like a great deal of e ﬀort
to show that the familiar n-sphere is a manifold – it is by deﬁnition a
subset of Euclidean space! The next example exhibits a manif old that
is not easily visualized as a subset of a larger ambient space .
Example 1.23 (Real Projective Space) . RPn,n-dimensional real pro-
jective space, is deﬁned as the space of one-dimensional sub spaces
(lines) in Rn+1. Deﬁne the map
Sn π →→
RPn
that sends a vector v to its span <v >.
Exercise: Check this is a two-to-one map. Check that π :U +
i֒→RPn
is injective and onto a set Ui. We then have the charts deﬁned with
homeomorphisms
ϕ i :Ui
π − 1
→→U +
i
ϕ +
i →→
V.
These form an atlas, making RPn into a manifold. More details about
this example can be found in the exercises at the end of the sec tion.
Example 1.24. If (X, A) is a manifold and U is an open subset of X,
then U is a manifold in its own right.
Proof. Let (Uα,Vα,ϕ α ),α ∈I be the elements of an atlas A. Let
U ′
α = Uα ∩U,
V ′
α = ϕ α (Uα ∩U),
ϕ ′
α = ϕ |Uα∩U.
Observe that (U ′
α,V ′
α,ϕ ′
α ),α ∈I deﬁne an atlas A′ on U. □
1.6. Smooth Mappings between Manifolds.
Notation 1.25 (Conventions for the Chapter) . From now on we will
adopt the convention that “manifolds” will actually mean “d iﬀeren-
tiable manifold”. Furthermore, we will simply refer to “a ma nifoldX”,
assuming that (X, A) is implicitly understood. Also in this spirit when
we refer to a chart ( U,V,ϕ ) we’ll assume without saying that ( U,V,ϕ )
is in A.


## Page 8

8 JUSTIN M. CURRY
Deﬁnition 1.26. Let X be an n-dimensional manifold and f : X →
Rm a continuous map. We say that f is C∞ if for every chart ( U,V,ϕ )
the map f ◦ϕ − 1 :V → Rm is C∞ .
Remark 1.27. The assumption that f is continuous is not necessary to
the deﬁnition, because the deﬁnition of smoothness implies continuity;
however, it is convenient to have that the pre-image of open s ets is
open before doing further work.
The map f ◦ϕ − 1 is sometimes called the coordinate representation
of f as it is the function of the coordinates on the open set, V ⊆ Rn.
Thus the above deﬁnition says that a function on a manifold is smooth
if and only if it is smooth in every coordinate representatio n of that
function. A similar result is true for maps between manifold s.
Deﬁnition 1.28. Let X and Y be n and m-dimensional manifolds
respectively and f : X → Y a continuous map. We say f is C∞ if for
everyp ∈X and for every chart ( U,V,ϕ ) on Y ϕY ◦f :f − 1(U) → Rm
is C∞ .
Note that since f is continuous f − 1(U) is open in X and is thus a
manifold in its own right. Putting together the above two deﬁ nitions
yields the following, more general, deﬁnition.
Deﬁnition 1.29. Let X and Y be n and m-dimensional manifolds
respectively and f : X → Y a continuous map. We say f is C∞ if for
everyp ∈X there exist charts ( UX,VX,ϕ X) and (UY,VY,ϕ Y ) about p
and f (p) respectively so that ϕ Y ◦f ◦ϕ − 1
X is C∞ .
Remark 1.30 (For Every vs. There Exists) . Traditionally the diﬀerence
between “for every” and “there exists” in mathematical deﬁn itions is
night and day, but in the case of smooth manifold theory this i s not
true. In particular, in the above several deﬁnitions, we cou ld have
simply required that there exist one chart where the required function
is C∞ . The fact that all the charts in the atlas are assumed to be
compatible then gives us for free that the function is C∞ in every chart!
Lemma 1.31 (Composition of smooth maps is smooth) . Assume Xi
for i = 1, 2, 3 are manifolds. If fi : Xi → Xi+1 for i = 1, 2 are C∞
maps, then f2 ◦f1 is a C∞ map.
Proof. Left as an exercise for the reader. □
1.7. Smooth Mappings between Arbitrary Subsets. AssumeMi
i = 1, 2 are manifolds and Xi a subset of Mi with f : X1 → X2 a
continuous map.


## Page 9

CHAPTER 4: FORMS ON MANIFOLDS 9
Deﬁnition 1.32. f is a C∞ map if for every p ∈ X1 there exists a
neighborhood O of p in M1 and a C∞ map ˜f : O → M2 such that
f = ˜f on X1 ∩ O
Theorem 1.33. Assume Mi i = 1, 2, 3 are manifolds with subsets Xi.
If fi :Xi → Xi+1 i = 1, 2 are C∞ maps, then f2 ◦f1 :X1 → X3 is C∞
as well.
Exercise 1.34. Prove the preceding Theorem.
Deﬁnition 1.35. ForXi ⊆ Mi i = 1, 2 f : X1 → X2 is a diﬀeomor-
phism if f is 1 − 1, onto and f and f − 1 are C∞ maps.
1.8. Submanifolds.
Deﬁnition 1.36. Let M =Mn be an n-dimensional manifold and X
a subset of M. X is a k-dimensional submanifold of M if for every
p ∈X there exists an open neighborhood U of p in X, an open set V
in Rk and a diﬀeomorphism ϕ :U → V .
Claim 1.37. The collection of all triples (U,V,ϕ ) whereU is an open
set in X, V an open set in Rk and ϕ : U → V a diﬀeomorphism,
deﬁnes an atlas A on X.
Proof. Given the charts ( Ui,Vi,ϕ i) i = 1, 2
U1 ∩U2
ϕ 1
↙↙←←←←←←←←← ϕ 2
↘↘↑↑↑↑↑↑↑↑↑
V1, 2
ϕ 1,2 →→
V2, 1
we see that if ϕ 1 and ϕ 2 are diﬀeomorphisms and ϕ 1, 2 :=ϕ 2 ◦ϕ − 1
1 |V1,2,
then ϕ 1, 2 is automatically a diﬀeomorphism. □
1.9. A More Intuitive Picture. Although manifolds such as RPn
are not easily visualized as subsets of Euclidean space – thu s lending
support to the “intrinsic” viewpoint of manifolds – many man ifolds
that we will encounter later on are naturally submanifolds o f RN for
some N.
In fact we will describe below (see §2.7) a result which says that
every manifold is a submanifold of RN for some N. In other words no
generality is lost by regarding manifolds as being submanif olds of RN .
This viewpoint we will call the “subset” or “extrinsic” pict ure of man-
ifolds to contrast it with the intrinsic picture of manifold s that we’ve
been exposing in this chapter. A clear exposition of this “ex trinsic”
picture can be found in Spivak’s Calculus on Manifolds or Munkres’
Analysis on Manifolds . One of its advantages is that their deﬁnition of


## Page 10

10 JUSTIN M. CURRY
“manifold” completely avoids the complications of charts a nd atlases:
If M1 and M2 are Euclidean spaces, all one needs to make sense of
the deﬁnitions (1.37) and (1.41) in the previous section is e lementary
freshman calculus. On the other hand this viewpoint also has its dis-
advantages. For instance it is explained in §5.4 how to realize RP 2 as
a submanifold of R6, but the “extrinsic” picture of RP 2 as a subman-
ifold of R6 is not nearly illuminating as the intrinsic picture of RP 2
described in §1. (This remark applies to a lot of other examples as
well, for instance the example discussed in §1.10, exercise 7.)
1.10. Exercises.
(1) Products. Assume that M1,...,M k are topological manifolds
of dimensions n1,...,n k respectively. Prove that the product
manifoldM1 × · · · ×Mk is a topological manifold of dimension
(n1 + · · · +nk). Assume that the Mi are smooth manifolds and
prove that the resulting product is a smooth manifold as well .
(2) Graphs. Let f : U ⊆ Rn → Rk be a continuous function.
Deﬁne the graph of f to be the set
Gf = {(x,y ) ∈ Rn × Rk,x ∈U,y =f (x)}
and prove that it is a manifold of dimension n. Hint – How
does this set come equipped with its own chart? Now assume
that f is C∞ . Prove that the graph is a smooth manifold.
(3) Spheres and Atlases. Review the construction of the Merca-
tor atlas and the coordinate atlas for the n-sphere. Show that
the two atlases are compatible.
(4) Atlas Revisited. Let M be a set and let U = {Ui,i ∈I} be
a collection of subsets of X. Suppose that for each i ∈I one is
given an open set Vi in Rn and a bijective map ϕ i : Ui → Vi.
We will call U an atlas if
• ⋃Ui =M
•ϕ i(Ui ∩Uj) =: Vi,j is an open subset of Vi for all i,j ∈I
• In the overlap diagram below, the bottom arrow is a dif-
feomorphism.
Ui ∩Uj
ϕ i
↙↙←←←←←←←←← ϕ j
↘↘↑↑↑↑↑↑↑↑↑
Vi,j
ϕ i,j →→
Vj,i
(a) Prove that M can be equipped with a topology by decree-
ing that U ⊆ M is open if and only if ϕ i(U ∩Ui) is open
for all i.


## Page 11

CHAPTER 4: FORMS ON MANIFOLDS 11
(b) Show that if M is equipped with this topology then the
atlas above really is an atlas in the sense deﬁned in the
previous section. Deduce that M is a manifold.
(5) Real Projective Space. RPn – Let π : Rn+1 ∖ 0 → RPn be
the map that sends a vector to its span, i.e.
π (x1,...,x n+1) = [x1,...,x n+1]
where the brackets denote homogeneous coordinates. Thus, for
a given x ∈ Rn+1 ∖ 0, π (x) = [x] denotes the equivalence class
of vectors contained in the same one-dimensional subspace g en-
erated by x.
(a) Deﬁne Ui to be the set of projected points [ x1,...,x n+1]
where xi ̸= 0. Show that the map
ϕ i :Ui
∼
= →→
Rn
deﬁned by
ϕ i([x1,...,x n+1]) = (x1
xi
,..., xi− 1
xi
,xi+1
xi
,..., xn+1
xi
)
is indeed a homeomorphism.
(b) Check that U is an atlas in the sense of Exercise 4.
(6) Real Projective Space Re-visited. Another approach to
deﬁning the manifold structure on RPn. The 2 − 1 map Sn →
RPn.
(7) Grassmannians Let Gr(k,n ) denote the space of all k-dimen-
sional subspaces of an n-dimensional vector space, i.e Rn. Note
that this is a generalization of projective space, since Gr( 1,n +
1) ∼
= RPn.
Letei fori = 1,...,n be the standard basis vectors of Rn. For
everyk-element subset,I, of {1,...,n }letVI = span{ej,i /∈I}.
LetUI be the set of all k-dimensional subspaces of V of Rn, i.e.
V ∈ Gr(k,n ), with V ∩VI = {0}.
We will sketch below a proof of the following result:
Theorem 1.38. The UI’s deﬁne an atlas in the sense of Exer-
cise 4.
(a) Suppose V is a k-dimensional subspace of Rn. Let wr =
(a1,r,...,a n,r ) for r = 1,...,k be a basis of V and let A
be the k × n matrix whose row vectors are the wr’s. Let
AI be the k ×k minor of A whose columns are the vectors
vi = (ai, 1,...,a i,k ) i ∈I. Show that det AI ̸= 0 if and only
if V ∩VI = {0}.


## Page 12

12 JUSTIN M. CURRY
Hint: Show that if det AI = 0 there exists a vector ( c1,...,
ck) = c ∈ Rk ∖ {0} with AIc = 0 and conclude that∑crwr = ∑
i/∈Iλ jej.
(b) Let V ∩VI = {0}. Show that there is a unique basis,
wr = (a1,r,...,a n,r ) for r = 1,...,k , of V for which the
k ×k matrix AI is the identity matrix.
(c) For each V ∈ UI choose a basis wr = (a1,r,...,a n,r ) r =
1,...,k such that AI is the identity matrix. Let AV be the
k × (n − k) dimensional matrix obtained from the k × n
matrixA = [ai,j ] by deleting the minor AI. Show that the
map V ∈UI → AV is a bijective map
φ I :UI
∼
= →→
Mk,n −k
(d) Show that, equipped with these maps, the collection {UI,I ⊆
{1,...,n }}is an atlas in the sense of Exercise 4.
Hints:
(i) Suppose V ∈ UI ∩UJ and let wr = (a1,r,...,a n,r ) r =
1,...,k be a basis of V . Show that φ I(V ) = Mk,n −k is the
matrix A− 1
I A with its I-minor deleted and φ J (V ) is the
matrix A− 1
J A with its J-minor deleted.
(ii) For each A ∈Mk,n letρI(A) ∈Mk,n −k be the matrix A with
itsI-th minor deleted and for each B ∈Mk,n −k letγI(B) be
the matrix obtained from B by inserting the k ×k identity
matrix as the I-th minor of γI(B). Show that B ∈φ I(UI ∩
UJ ) if and only if the J-th minor of γI(B) is non-singular
and show that if γI(B) = A, then φ J ◦φ − 1
I (B) = ρJ (A− 1
J A).
Conclude that φ J ◦φ − 1
I is a C∞ map.
2. Tangent Spaces
The entire point of introducing diﬀerentiable manifolds is to have
manifolds that one can “do Calculus on”. In order for this to m ake sense
we need a concept of a derivative. Diﬀerentiation, as unders tood in
elementary calculus courses, involves tangent-making. Es sentially the
same is true for the manifold case with a few subtleties. In pa rticular,
if we adopt the intrinsic viewpoint of manifolds, how does on e make
sense of a space “tangent” to a manifold when there isn’t a lar ger
ambient space for the manifold and tangent space to live in? J ust as
we have presented two pictures of manifolds, we must now deve lop their
corresponding versions of tangent spaces.


## Page 13

CHAPTER 4: FORMS ON MANIFOLDS 13
Notation 2.1. We will now use M and N to refer to diﬀerentiable
manifolds instead of the previously used X and Y . Occasionally Mn
will be used to denote an n-dimensional diﬀerentiable manifold M.
2.1. Curves and Tangents.
Deﬁnition 2.2. A curve inM is a pair ( γ,I ) where I ⊆ R is an open
interval and γ : I → M is a smooth map. We will denote the set of
curves passing through a point p ∈M by
Cp(M) := {(γ,I ), 0 ∈I,γ (0) = p}.
Remark 2.3. Notice that in the above deﬁnition we have given the point
p ∈ M the “special” position of γ (t) for t = 0. Note that as long as
a curve γ passes through the point p for some tp ∈ I, we can then
re-parametrize and obtain ˜γ =γ (t −tp).
As a convention, we consider ( γ 1,I 1) ≡ (γ 2,I 2) if and only if γ 1 =γ 2
on a subinterval I of I1 ∩I2 with 0 ∈I.
Remark 2.4. For the initiated reader Cp(M) is called the set of “germs
of C∞ maps γ : (R, 0) → (M,p ).”
Since the tangent space only depends locally on the manifold , we
will focus on the set of curves passing through neighborhood U of
p ∈ M, and, via the equivalence relation “ ≡” identify Cp(U) with
Cp(M). Furthermore, we want to capture the notion of a tangent
space in terms of vectors tangent to curves . In order to do so we will
temporarily assume that U ⊆ Rn — translating back to the intrinsic
manifold viewpoint later.
Deﬁnition 2.5. Assume (γi,Ii) ∈Cp(U),i = 1, 2 for U ⊆ Rn. We say
that (γ 1,I 1) and (γ 2,I 2) are tangent at p if dγ 1
dt (0) = dγ 2
dt (0).
Note that in this setup γi :Ii → U ⊆ Rn are vector-valued functions
and so their derivatives can be thought of as tangent vectors .
Deﬁnition 2.6. Two curves inCp(U) are equivalent if they are tangent
at p, i.e.
(γ 1,I 1) ∼p (γ 2,I 2) ⇔ dγ 1
dt (0) = dγ 2
dt (0).
Exercise 2.7. Check that this does indeed deﬁne an equivalence rela-
tion. Hint – Check that ∼p is reﬂexive, symmetric and transitive.
Deﬁnition 2.8. The tangent space to a point p ∈U consists of the set
of equivalence classes of curves, i.e.
TpU :=Cp(U)⧸ ∼p


## Page 14

14 JUSTIN M. CURRY
Remark 2.9 (Functoriality). The map
(γ,I ) → dγ
dt (0)
induces a bijective map
Tp(U) → Rn.
Now let V be an open subset of Rm and f : (U,p ) → (V,q =f (p)) a
C∞ map. This induces a map
˜f :Cp(U) → Cq(V )
(γ,I ) ↦→ (f ◦γ,I )
which, in turn, induces a map on tangent spaces, i.e. gives ri se to a
diagram
Cp(U)
↓↓
˜f →→Cq(V )
↓↓
TpU
↓↓
dfp →→TqV
↓↓
Rn Jf (p) →→ Rm
We now would like to translate these deﬁnitions to the intrin sic man-
ifold setting. In particular, two curves on a manifold are ta ngent if and
only if their coordinate representations are tangent.
Deﬁnition 2.10. Assume M is a manifold, with chart ( U,V,ϕ ) cen-
tered at p ∈M, then (γi,Ii) ∈Cp(M),i = 1, 2 are tangent atp ifϕ ◦γ 1
and ϕ ◦γ 2 are tangent at ϕ (p) = 0 ∈ Rn.
Exercise 2.11. Show that this deﬁnition is independent of the choice of
chart. Hint – Use overlap diagrams and the diagram from the pr evious
remark.
As before, tangency is an equivalence relation ∼p, thus allowing us
to deﬁne the tangent space to a manifold in an identical manne r.
Deﬁnition 2.12. Tp(M) := Cp(M)⧸ ∼p
2.2. Mappings between Tangent Spaces.
Claim 2.13. If Mm,N n are manifolds and f : ( M,p ) → (N,q ) a
smooth map, then the map ˜f :Cp(M) → Cp(N) preserves tangency.


## Page 15

CHAPTER 4: FORMS ON MANIFOLDS 15
Proof. Suppose γi ∈ Cp(M) i = 1, 2 are tangent. By deﬁnition, in
some chart ( UM,VM,ϕ M ) centered at p, d(ϕ M ◦γ 1)/dt (0) = d(ϕ M ◦
γ 2)/dt (0). If ( UN,VN,ϕ N ) is a chart on N such that f (UM ) ⊆ UN , we
see that
d(ϕ N ◦f ◦γi)/dt (0) = d(ϕ N ◦f ◦ϕ − 1
M )|0d(ϕ M ◦γi)/dt (0)
are equal for i = 1, 2 so tangency is preserved. Note that ˆ γi := ϕ M ◦
γi : R → Rm so these derivatives are well-deﬁned. The coordinate
representative of f is ˆf =ϕ N ◦f ◦ϕ − 1
M so that derivative is also well-
deﬁned. □
Remark 2.14 (Functoriality for Mappings of Manifolds) . Let (U,V,ϕ )
be a chart centered at p and (U ′,V ′,ϕ ′) at chart centered at f (p) = q,
with f (U) ⊆ U ′.
U
ϕ ∼
=
↓↓
f →→U ′
∼
= ϕ ′
↓↓V
g →→V ′
Here g = ϕ ′◦f ◦ϕ − 1, which, as before, induces a map on the set of
curves:
Cp(U)
˜ϕ ∼
=
↓↓
˜f →→Cq(U ′)
∼
= ˜ϕ ′
↓↓C0(V )
˜g →→C0(V ′)
Applying the equivalence relation from before then induces a map on
the tangent spaces:
Tp(U)
dϕ p ∼
=
↓↓
dfp →→Tq(U ′)
∼
= dϕ ′
p
↓↓
T0(V )
dg0 →→T0(V ′)
Claim 2.15. The map, dfp,is independent of the choice of chart.
Proof. For any n-dimensional manifold M we get the overlap diagram
U1 ∩U2
ϕ 1
↙↙←←←←←←←←← ϕ 2
↘↘↑↑↑↑↑↑↑↑↑
V1, 2
ϕ 1,2 →→V2, 1


## Page 16

16 JUSTIN M. CURRY
and
TpM
∼
=
(dϕ 1)p
↙↙←←←←←←←←← (dϕ 2)p
∼
= ↘↘↑↑↑↑↑↑↑↑↑
T0Rn (dϕ 1,2)0 →→
∼
=
↓↓
T0Rn
∼
=
↓↓Rn
Jϕ1,2 (0)
→→ Rn
Since the maps ϕ i i = 1, 2 are diﬀeomorphisms, their derivatives are
bijections and hence so is ( dϕ 1, 2). □
Consider now the case where Mn is a manifold and ( U,V,ϕ ) is a
chart centered at p. The map dϕ p allows us to put coordinates on
the tangent space, TpM, just as ϕ does for the underlying manifold.
Moreover by claim 2.15 this vector space structure is indepe ndent of
charts. In other words
Deﬁnition 2.16. TpM becomes a vector space by requiring dϕ p to be
linear.
We will leave for you to check the following two claims.
Claim 2.17. If f : ( M,p ) → (N,q ) is a smooth map, then dfp :
TpM → TqN is a linear map of vector spaces.
Claim 2.18. If f : (M,p ) → (N,q ) is a diﬀeomorphism, then dfp :
TpM → TqN is an isomorphism of vector spaces.
This latter claim actually has a stronger cousin known as the inverse
function theorem. Studying maps of tangent spaces reveals important
properties of the underlying maps and vice-versa.
2.3. The Inverse Function Theorem. AssumeU1,U2 are open sets
in Rn and f : (U1,p 1) → (U2,p 2) is a C∞ map. The Jacobi mapping
Jf (p) : Rn → Rn Jf (p1) = [ ∂f i
∂x j
(p1)] is the derivative of f at p1, which
is the best linear approximation to the map. We have the follo wing
result:
Theorem 2.19 (Inverse Function Theorem for Rn). The map Jf (p1)
is bijective if and only if f maps a neighborhood of p1 in U1 diﬀeomor-
phically onto a neighborhood of p2 in U2.
From the diagram
Tp1U1
dfp1 →→
∼
=
↓↓
Tp2U2
∼
=
↓↓Rn Jf (p1) →→ Rn


## Page 17

CHAPTER 4: FORMS ON MANIFOLDS 17
we know that Jf (p1) bijective ⇔ dfp1 bijective.
Theorem 2.20 (Inverse Function Theorem for Manifolds) . Assume
that Mn
1,M n
2 are manifolds and f : (M1,p 1) → (M2,p 2) is a smooth
map. dfp1 :Tp1M1 → Tp2M2 is bijective if and only if f maps a neigh-
borhood of p1 diﬀeomorphically onto a neighborhood of p2.
Proof. Assume (Ui,Vi,ϕ i)i = 1, 2 are charts centered atpi withf (U1) ⊂
U2. Setting g :=ϕ 2 ◦f ◦ϕ − 1
1 we get the commutative diagram
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
g →→V2
which induces the corresponding diagram on the tangent spac es
Tp1M1
dfp1 →→
∼
=
↓↓
Tp2M2
∼
=
↓↓T0V1
dg0 →→T0V2
We know that the vertical arrows are bijections by the chain r ule.
Accordingly,dfp1 is bijective if and only if dg0 bijective. If dg0 is bi-
jective than g is a local diﬀeomorphism at 0 by the inverse function
theorem for Rn and thus f is a local diﬀeomorphism at pi. □
2.4. Submersions. The Inverse Function Theorem provides useful in-
formation about mappings by looking at their closest linear approxi-
mation – the derivative. The assumption that df is bijective is a very
strong assumption and we should consider ways of weakening t his as-
sumption. In this subsection we consider the case when df is merely
onto (submersions). In the next subsection we consider when df is 1 − 1
(immersions).
Since the derivative is a linear mapping, it is natural to ass ume that
some linear algebra is involved. Let’s review some basic fac ts.
Deﬁnition 2.21 (Canonical Submersion) . For k < n we deﬁne the
canonical submersion
π : Rn → Rk
to be the map π (x1,...,x n) = (x1,...,x k).
We then have the following nice linear algebra result regard ing sub-
mersions:


## Page 18

18 JUSTIN M. CURRY
Proposition 2.22. If A : Rn → Rk is onto, there exists a bijective
linear map B : Rn → Rn such that AB =π .
Proof. The proof is an exercise for the reader. Hint: Show that one
can choose a basis, v1,...,v n of Rn such that
Avi =ei, i = 1,...,k
is the standard basis of Rk and
Avi = 0, i>k.
Let e1,...,e n be the standard basis of Rn and set Bei =vi. □
Now let us return to the manifold setting.
Deﬁnition 2.23. Assume Mm
1 ,M n
2 are manifolds with m ≥ n and
f : (M1,p 1) → (M2,p 2) is a smooth map. f is a submersion at p1 if
and only if dfp1 is onto.
Theorem 2.24. If f is a submersion at p1 then there exist charts
(Ui,Vi,ϕ i) centered at pi such that f (U1) ⊆ U2 and the following dia-
gram commutes
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
π →→V2
Proof. Choose any charts ( Ui,Vi,ϕ i) centered at pi such that f (U1) ⊂
U2. Setting g :=ϕ 2 ◦f ◦ϕ − 1
1 as before
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
g →→V2
Check that if dfp1 is onto then dg0 is onto. Hint – Chain Rule. Now
we can make a linear change of coordinates in Rm such that Jg(0) = π .
Let G : (V1, 0) → (Rm, 0) be the map sending x = (x1,...,x m) to
G(x) = (g1(x),...,g n(x),xn+1,...,x m). Recognize that
JG(0) =
[
Jg(0) 0
0 I
]
and since Jg(0) = π we have that JG(0) = I and π ◦G = g. By the
inverse function theorem we know that G is a diﬀeomorphism of V1


## Page 19

CHAPTER 4: FORMS ON MANIFOLDS 19
onto a neighborhood W1 of 0 in Rm. This results in the diagram
U1
f →→
ϕ 1
↓↓
U2
ϕ 2
↓↓
V1
g →→
G ∼
=
↓↓
V2
W1
π
↗↗↙↙↙↙↙↙↙↙
Replacing ϕ 1 with G ◦ϕ 1 provides the desired diagram:
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
π →→V2
□
2.5. Submanifolds and Regular Values. One important class of
submanifolds are “pre images of regular values of mappings” . More
explicitly:
Deﬁnition 2.25. Assume Mn
1,M m
2 are manifolds with n > m and
f :M1 → M2 is a smooth map. We say q ∈M2 is a regular value of f
if for every p ∈M1, p ∈f − 1(q), f is a submersion at p.
Theorem 2.26. Let k = n − m and let X = f − 1(q), then X is a
k-dimensional submanifold of M1.
Proof. Putting p1 = p and p2 = q, the canonical submersion theorem
says that there exist charts (Ui,Vi,ϕ i) centered at pi such that f (U1) =
U2 and
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
π →→V2
is a commutative diagram and π (x1,...,x n) = (xk+1,...,x n). Thus
π − 1(0) = {x ∈V1,xk+1 = · · · =xn = 0}
= V1 ∩ Rk
and ϕ maps U1 ∩f − 1(p2) bijectively onto V1 ∩ Rk. Since X =f − 1(p2)
X ∩U1 =U is diﬀeomorphic to an open subset V =V1 ∩ Rk of Rk. □


## Page 20

20 JUSTIN M. CURRY
Example 2.27 (The n-Sphere) . If M = Rn+1 and f : Rn+1 → R
f (x) = x2
1 +· · ·+x2
n+1, then f − 1(1) = Sn. Check that 1 ∈ R is a regular
value of f thus verifying that Sn is an n-dimensional submanifold of
Rn+1.
Example 2.28 (Orthogonal Matrices) . We begin with the following
two manifolds
M1 = Mn = Rn2
M2 = Sn = Rn(n+1)
where Mn denotes the space of all n ×n real matrices and Sn denotes
the space of real symmetric matrices. We then have the map f :M1 →
M2 deﬁned byf (A) = AtA. Check that the n×n identity matrixI ∈ Sn
is a regular value of f . Conclude that the space of n × n orthogonal
matrices On =f − 1(I) is an n(n− 1)/ 2 dimensional submanifold of Mn.
2.6. Immersions. Again, we recall what is meant by immersions in
the linear algebra sense.
Deﬁnition 2.29 (Canonical Immersion) . For k < n we deﬁne the
canonical immersion
ι : Rk → Rn
to be the map ι(x1,...,x k) = (x1,...x k, 0,... 0).
Exercise 2.30. Verify that the inclusion map deﬁned above is the
transpose of the projection map, i.e. π t =ι.
Checking the previous exercise leads to a quick proof that ev ery
injective map can be put into its canonical form.
Proposition 2.31. IfA : Rk → Rn is one–one, there exists a bijective
linear map C : Rn → Rn such that CA =ι.
Proof. The rank of [ai,j ] is equal to the rank of [aj,i ], so if if A is one–one,
there exists a bijective linear map B : Rn → Rn such that AtB = π .
LettingC =Bt and taking transposes we get ι =π t =CB □
Deﬁnition 2.32. Let f : (M1,p 1) → (M2,p 2) be a smooth map as
before. f is an immersion atp1 if and only if dfp1 is injective, i.e. 1 − 1.
Theorem 2.33. If f is a immersion at p1 then there exist charts
(Ui,Vi,ϕ i) centered at pi such that f (U1) ⊆ U2 and the following dia-
gram commutes
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
ι →→V2


## Page 21

CHAPTER 4: FORMS ON MANIFOLDS 21
Proof. Choose any charts ( Ui,Vi,ϕ i) centered at pi such that f (U1) ⊂
U2. Setting g :=ϕ 2 ◦f ◦ϕ − 1
1 as before
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
g →→V2
Check that if dfp1 is injective then dg0 is injective. Now we can make
a linear change of coordinates in Rn such that Jg(0) = ι. Let ˜V ⊆ Rn
be the open set {(x1,...,x n) ∈ Rn, (x1,...,x m) ∈V } and let G : ˜V →
Rn be the map sending x = (x1,...,x n) to G(x) = g(x1,...,x m) +
(0,..., 0,xm+1,...,x n). Check that JG(0) = I and G ◦ι =g.
By the inverse function theorem G maps a neighborhood, W , of 0
in ˜V diﬀeomorphically onto a neighborhood of 0 in V2. In the dia-
gram above lets replace V2 by (V2)new = G(W ) and V1 by (V1)new =
g− 1(G(W )). Shrinking U1 and U2 if necessary we get the diagram:
U1
f →→
ϕ 1
↓↓
U2
ϕ 2
↓↓
V1
g →→
ι
↘↘↗↗↗↗↗↗↗↗ V2
W
∼
= G
↑↑
Replacingϕ 2 byG− 1 ◦ϕ 2 and letting (V2)new =W provides the desired
diagram:
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
ι →→V2
□
2.7. Immersions and the Subset Picture.
Theorem 2.34. Assume M is an n-dimensional manifold. If X a k-
dimensional submanifold then the inclusion map ι :֒→M is a 1 − 1
proper immersion.
Proof. Left as an exercise for the reader. Here are some hints: Let p ∈
X andU an open neighborhood of p inX,V an open neighborhood of
0 in Rk andϕ :U → V a diﬀeomorphism. Shrinking U if necessary, we
can extendϕ to a C∞ map ˜ϕ : ˜U → V where ˜U is an open neighborhood


## Page 22

22 JUSTIN M. CURRY
of p in M and ˜ϕ is a C∞ map. Show that ϕ = ˜ϕ ◦ι and deduce the
injectivity of dιp from the chain rule and bijectivity of dϕ p. □
A corollary of this result and the canonical immersion theor em is
the existence of adapted charts for submanifolds. These charts give
us the nice coordinate property that a k-dimensional submanifold only
requires k coordinates of the original n-dimensional chart.
Corollary 2.35. LetMn be a manifold and X ⊂ M a closed subset of
M. X is an k-dimensional submanifold of M if for every p ∈X there
exists a chart (U,V,ϕ ) centered atp and an open neighborhood W of 0
in Rk such that
(2.36) ϕ (U ∩X) = ι(W ).
By projecting onto the ﬁrst k-coordinates, we get a homeomorphism
ψ :U ∩X → W with the deﬁning property
U ∩X
ϕ →→
ψ ↘↘↑↑↑↑↑↑↑↑↑ V
W
ι
↗↗↙↙↙↙↙↙↙↙
Deﬁnition 2.37. A chart (U,V,ϕ ) with the property 2.36 is called an
adapted chart for the submanifold X.
We alluded in §1.9 to the “intrinsic” deﬁnition of manifolds via charts
and atlases and contrasted this with the “extrinsic” deﬁnit ion in which
manifolds are, by assumption, “submanifolds of RN ”. A celebrated
theorem of Hassler Whitney, the Whitney imbedding theorem asserts
that every n-dimensional manifold can be imbedded diﬀeomorphically
into R2n+1 as an n-dimensional submanifold, thus showing that these
two deﬁnitions are compatible. We won’t attempt to prove Whi tney’s
theorem; however in §5 we will sketch a (weak form of) a special case
of this theorem, and leave for you, as an exercise, to ﬁll in th e details.
We’ll ask you to show that every compact n-dimensional manifold is,
up to diﬀeomorphism, a submanifold of some RN . (However, we won’t
require you to show that N = 2n + 1.)
Remark 2.38 (Tangent Space is a Vector Subspace) . Assume that M is
ann-dimensional manifold and X is a k-dimensional submanifold with
ι :֒→M the inclusion map. For every p ∈X the map
dιp :TpX → TpM
is injective so by identifying TpX with its image under this map we can
think of TpX as a vector subspace of TpM.


## Page 23

CHAPTER 4: FORMS ON MANIFOLDS 23
The above remark is visually helpful when M = Rn and so TpM ∼=
Rn. In this case we can think of the tangent space to Xk atp,TpX, as a
k-dimensional plane sitting inside a copy of Rn centered atp ∈X ⊂ Rn.
For manifolds X realized as inverse images of regular values under
a mapping f , the vector subspace structure of TpX can be deﬁned in
terms of the linear mapping dfp.
Claim 2.39. AssumeM1,M2 are manifolds, f :M1 → M2 a map with
regular value q ∈ M2 deﬁning a submanifold X = f − 1(q). If p ∈ X
then
TpX = kerdfp.
Proof. Composing f with the inclusion map deﬁnes a map f ◦ι :X →
M2. Since for all points p ∈X, f (p) = q it deﬁnes a constant map on
X, thusd(f ◦ι)p =dfp ◦dιp = 0. Consequently, Im dιp ⊆ kerdfp proving
that TpX ⊆ kerdfp. To prove equality, we use a dimension argument.
Since
dimX = dim M1 − dimM2
= dim TpM1 − dimTqM2
= dim ker dfp
and dim X = dimTpX, we have that dim TpX = dim kerdfp and thus
TpX = kerdfp. □
Example 2.40 (Skew-Symmetric Matrices) . Recall that we showed
that On =f − 1(I) where f : Mn → S n is the map f (A) = AtA. Show
that at the identity matrix I ∈ Mn dfI(A) = A +At. Conclude that
TI On = {A ∈ Mn,At = −A}.
2.8. Exercises.
(1) Let f : X → Y be a C∞ map and deﬁne Z := graph f . Show
that the tangent space to Z at a point ( x,y ) is
Tx,yZ = {v,dfx(v),v ∈Tx}.
(2) Let X and Y be manifolds and X × Y their product. Show
that:
Tx,yX ×Y ∼=TxX ×TyY
3. Vector Fields on Manifolds
Deﬁnition 3.1. Assume Mn is an n-dimensional manifold. A vector
ﬁeld on M is a function v that associates with every point p a vector
v(p) ∈TpM.


## Page 24

24 JUSTIN M. CURRY
3.1. Push-Forwards and Pull-Backs.
Deﬁnition 3.2. Let X and Y be manifolds and f : X → Y a C∞
mapping. Given a vector ﬁeld, v, on X and a vector ﬁeld, w, on Y ,
we’ll say that v and w are f -related if, for all p ∈X and q =f (p)
(3.3) ( df)pv(p) = w(q).
Deﬁnition 3.4 (Push-Forward for Vector Fields) . Assume X and Y
are manifolds and f : X → Y is a diﬀeomorphism. The push-forward
of a vector ﬁeld v on X to a vector ﬁeld w =: f∗v on Y is deﬁned
point-wise by equation 3.3.
Deﬁnition 3.5 (Pull-Back for Vector Fields). Similarly, given a vector
ﬁeld, w, on Y we can deﬁne a vector ﬁeld, v, on X by applying the
same construction to the inverse diﬀeomorphism, f − 1 : Y → X. We
will call the vector ﬁeld ( f − 1)∗w the pull-back of w byf and denote it
byf ∗w.
Remark 3.6 (Functoriality) . Let X, Y and Z be manifolds and f :
X → Y and g : Y → Z diﬀeomorphisms. If v is a vector ﬁeld on X,
then
(g ◦f )∗v =g∗(f∗v)
is a vector ﬁeld on Z. Similarly, if w is a vector ﬁeld on Z, then
(g ◦f )∗w =f ∗(g∗w)
is a vector ﬁeld on X.
Exercise 3.7. Describe why the assumption that f : X → Y is a
diﬀeomorphism is necessary for the deﬁnition of push-forwa rds and
pull-backs for vector ﬁelds. Later we will see that pull-bac ks for k-
forms only require C∞ maps.
3.2. Smooth Vector Fields. With the push-forward/pull-back ter-
minology in place, we now have a convenient language for disc ussing
smooth vector ﬁelds . If a vector ﬁeld v is deﬁned on an open subset U
ofX then we know, by deﬁnition, that for every p ∈U there exists an
open neighborhood O of p and a diﬀeomorphism ϕ : O → V ⊆ Rn.
Since Rn is a manifold, and V ⊆ Rn a submanifold, we can just set
Y = V and f = ϕ in the deﬁnition of a push-forward to obtain the
vector ﬁeld ϕ ∗v on V . Following our previous strategy, we will deﬁne
a smooth vector ﬁeld as one whose push-forward on Rn is smooth.
Deﬁnition 3.8. A vector ﬁeld v on U ⊆ X is C∞ if ϕ ∗v is C∞ .
In similar fashion we can deﬁne a smooth vector ﬁeld globally if it is
smooth locally for all points on the manifold.


## Page 25

CHAPTER 4: FORMS ON MANIFOLDS 25
Deﬁnition 3.9. A vector ﬁeld v on a manifold Xn is C∞ if, for every
pointp ∈X, v is C∞ on a neighborhood of p.
Exercise 3.10. Show that these deﬁnitions are independent of the
choice of chart.
Proposition 3.11. Assumev is a C∞ vector ﬁeld on X andf :X → Y
is a diﬀeomorphism, then f∗v is C∞ . Similarly, if w is a C∞ vector ﬁeld
on Y then f ∗w is a C∞ vector ﬁeld on X.
3.3. Integral Curves. Assume M = Mn is an n-dimensional mani-
fold. Recall that a smooth curve passing through p ∈M is a C∞ map
γ : I ⊂ R → M satisfying γ (0) = p. The derivative at 0, or tangent
map at 0, is dγ 0 : T0R → TpM. If we apply dγ 0 to the unit vector
u = 1, we obtain
dγ
dt (0) = dγ 0(1).
Recall that a vector ﬁeld v just assigns to points on the manifold to vec-
tors in the corresponding tangent space, i.e. v :M → TM . Similarly,
by ﬁxing the unit vector as we have done above and letting the p oint
of evaluation t to vary we obtain a map dγt :t ∈I ⊂ R → Tγ (t)M. If a
vector ﬁeld and a curve agree on this map, we call the curve an integral
curve.
Deﬁnition 3.12. γ :I → M is an integral curve of v if for all a ∈I
dγ
dt (a) = v(γ (a)).
3.4. ODE Theory on Manifolds.
Proposition 3.13. Let X and Y be manifolds and f : X → Y a C∞
map. If v andw are vector ﬁelds on X andY which are f -related, then
integral curves of v get mapped by f onto integral curves of w.
Proof. If the curve, γ :I → X is an integral curve of v we have to show
that f ◦γ :I → Y is an integral curve of w. If γ (t) = p and q =f (p)
then by the chain rule
w(q) = dfp(v(p)) = dfp(dγt(⃗ u))
= d(f ◦γ )t(⃗ u).
□
From this result it follows that the local existence, unique ness and
“smooth dependence on initial data” results about vector ﬁe lds that we
described in §2.1 of Chapter 2 are true for vector ﬁelds on manifolds.
More explicitly, let U ⊆ X be the domain of some chart and ( U,V,ϕ ).


## Page 26

26 JUSTIN M. CURRY
Since V ⊆ Rn these results are true for the vector ﬁeld w = ϕ ∗v and
hence, since w and v are ϕ -related, they are true for v. In particular,
we have recaptured the following important theorems for diﬀ erential
equations on manifolds:
Proposition 3.14 (Local Existence) . For every p ∈U there exists an
integral curve, γ (t), −ǫ<t<ǫ , of v with γ (0) = p.
Proposition 3.15 (Local Uniqueness) . Let γi : Ii → U i = 1, 2 be
integral curves of v and let I =I1 ∩I2. If γ 2(a) = γ 1(a) for some a ∈I
then γ 1 ≡ γ 2 on I. Furthermore, there exists a unique integral curve,
γ :I1 ∪I2 → U with γ =γ 1 on I1 and γ =γ 2 on I2.
Proposition 3.16 (Smooth Dependence on Initial Data) . For every
p ∈U there exists a neighborhood, O of p inU, an interval (−ǫ,ǫ ) and
a C∞ map, h : O × (−ǫ,ǫ ) → U such that for every p ∈ O the curve
γp(t) = h(p,t ), −ǫ<t<ǫ,
is an integral curve of v with γp(0) = p.
3.5. Complete Vector Fields.
Deﬁnition 3.17. A C∞ curve γ : [0,b ) → M is a maximal integral
curve of v if it can’t be extended to an interval [0 ,b ′] where b′>b , i.e.
there is no integral curve γ ′: [0,b ′] → M such that γ =γ ′|[0,b ).
Deﬁnition 3.18. A sequence of points pi ∈ M i = 1, 2,... tends to
inﬁnity in M if for every compact set C ⊆ M there exists an i0 such
that pi /∈C for i>i 0.
Theorem 3.19. If γ : [0,b ) → M is a maximal integral curve of v
then either of the following is true:
(a) b = +∞
(b) There exists a sequence {ti} ∈ [0,b ) with ti → b and the image
sequence {γ (ti)} tends to inﬁnity in M.
Proof. (See Birkhoﬀ and Rota page 172.) Suppose not. Then there
exists a compact set C such that for all t ∈ [0,b ) γ (t) ∈C and hence
there exists a sequence ti ∈ [0,b ) and a point p ∈C such that ti → t
and γ (ti) → p. Let U be a open neighborhood of p and
h :U × (−ǫ,ǫ ) → M
a C∞ map such that for all q ∈ U γq(t) = h(q,t ) −ǫ < t < ǫis an
integral curve of p with γq(0) = q. Since γ (ti) → p and ti → b there


## Page 27

CHAPTER 4: FORMS ON MANIFOLDS 27
exists a ti such that ti >b − ǫ
2 and γ (ti) ∈U. Set c =ti and q =γ (ti).
Then the curve ˜γ (t) : [0,b + ǫ
2) → M deﬁned by
˜γ (t) =
{
γ (t) 0 ≤ t ≤ c
γq(t +c) c ≤ t ≤ b + ǫ
2
is an integral curve extending γ . □
IfM is compact then we can, in fact, say more. Because an integral
curve cannot, by deﬁnition, leave the manifold, then if the m anifold is
compact, it can never tend to inﬁnity. By the previous theore m, this
curve exists for all future time. Vector ﬁelds that have inte gral curves
for all time are called complete.
Deﬁnition 3.20. A vector ﬁeld v is complete if for every p ∈M there
exists an integral curve γp(t) −∞ <t< ∞ satisfying γp(0) = p.
Theorem 3.21. If M is compact, then, for any vector ﬁeld v on M,
v is complete.
Proof. By the theorem above there exists for every p ∈M an integral
curve γp : [0, ∞ ) → M with γp(0) = p. Noting that integral curves
of −v are just integral curves of v reparametrized by setting t → − t.
Accordingly, by the theorem above, for every p ∈M an integral curve
γp : ( −∞ , 0] → M of v with γp(0) = p and putting these two results
together an integral curve of v γp : (−∞ , ∞ ) → M withγp(0) = p. □
Complete vector ﬁelds naturally give rise to a map that allow s us to
“ﬂow” open sets on a manifold based on how the individual inte gral
curves evolve in time for each point. Such a map f : M × R → M is
obtained by setting
f (p,t ) := γp(t)
and then deﬁning the associated map ft :M → M to be a function of
points rather than time, i.e.
ft(p) := f (p,t ).
One can visualize this map as placing a tracer particle in som e deter-
ministic ﬂuid ﬂow and watching the particle, originating at some point
p, get carried after some time s to a point fs(p). Allowing the map to
begin with fs(p) and ﬂow for some time t should obtain the same result
as starting at p and ﬂowing for time t+s, since the ﬂow is deterministic.
Claim 3.22. If v is complete and ft : M → M is deﬁned as above,
then ft ◦fs =ft+s.


## Page 28

28 JUSTIN M. CURRY
Proof. Let q = fs(p). Then the curves γ 1(t) = fs+t(p) −∞ < t <∞
andγ 2(t) = ft(q) −∞ <t< ∞ are both integral curves of v with initial
pointγ 1(0) = γ 2(0) = q and hence they coincide for all time. □
Theorem 3.23. If M is compact then f :M × R → M is C∞ .
Proof. By smooth dependence on initial data there exists for every
p ∈M a neighborhood Up of p and an ǫp > 0 such that
f :Up × (−ǫp,ǫp) → M
is C∞ . The sets Up for p ∈M are a covering of M, which is compact.
There exists a ﬁnite subcoverUpii = 1,...,k ofM. Now let ǫ = minǫpi.
Since the sets Upi × (−ǫ,ǫ ) cover M × (−ǫ,ǫ ) and f restricted to each
of these sets is C∞ ,
f :M × (−ǫ,ǫ ) → M
is a C∞ map. Now note that for any T >0 there exists a large positive
integerN such that T/N <ǫ . Using the fact that
fT =fT/N ◦ · · · ◦fT/N
and since each fT/N is C∞ , the composition f : M × (−T,T ) → M is
C∞ . Since T is arbitrary, we conclude that f :M × R → M is C∞ . □
Remark 3.24. With a little eﬀort, the assumption that M is compact
in Theorem 3.23 can be weakened. See Exercises 12 and 13 at the end
of the section for more details.
3.6. One-Parameter Groups of Diﬀeomorphisms. You may have
observed from Claim 3.22 that the functions ft are parameterized by
the additive group ( R, +). In particular, f0 = Id M is the identity
mapping and for any t ∈ R there exists a −t ∈ R so that ft ◦f−t =
ft−t = f0 = IdM , so the set ft has an identity element and inverses –
making it a group. The result stating that f :M × R → M is C∞ gives
us that ft :M → M is C∞ for any t as well. Consequently, both ft and
its inverse (ft)− 1 =f−t are C∞ – making it a diﬀeomorphism.
Deﬁnition 3.25. The set of functions
{ft, −∞ <t< ∞}
is called a one-parameter group of diﬀeomorphisms generated by v.
If the vector ﬁeld v is not complete then it does not generate a
one-parameter group of diﬀeomorphisms. We have shown that i f the
underlying manifold M is compact, then any vector ﬁeld is complete,
but if M is not compact, then it admits a great deal of incomplete
vector ﬁelds.


## Page 29

CHAPTER 4: FORMS ON MANIFOLDS 29
Example 3.26. Let M = R and v = x2 ∂
∂x . Exercise – What are the
integral curves? Where are they undeﬁned?
Proposition 3.27. If a vector ﬁeld v is compactly supported then it
is complete – and thus generates a one-parameter group of diﬀ eomor-
phisms.
Proof. The proof is identical to the case when M is compact. See
above. □
3.7. Exercises.
(1) Let X ⊆ R3 be the paraboloid, x3 = x2
1 +x2
2 and let w be the
vector ﬁeld
w =x1
∂
∂x 1
+x2
∂
∂x 2
+ 2x3
∂
∂x 3
.
(a) Show that w is tangent to X and hence deﬁnes by
restriction a vector ﬁeld, v, on X.
(b) What are the integral curves of v?
(2) Let S2 be the unit 2-sphere, x2
1 +x2
2 +x2
3 = 1, in R3 and let w
be the vector ﬁeld
w =x1
∂
∂x 2
−x2
∂
∂x 1
.
(a) Show that w is tangent to S2, and hence by restriction
deﬁnes a vector ﬁeld, v, on S2.
(b) What are the integral curves of v?
(3) As in problem 2 let S2 be the unit 2-sphere in R3 and let w be
the vector ﬁeld
w = ∂
∂x 3
−x3
(
x1
∂
∂x 1
+x2
∂
∂x 2
+x3
∂
∂x 3
)
(a) Show that w is tangent to S2 and hence by restriction
deﬁnes a vector ﬁeld, v, on S2.
(b) What do its integral curves look like?
(4) Let S1 be the unit circle, x2
1 +x2
2 = 1, in R2 and let X =S1 ×S1
in R4 with deﬁning equations
f1 = x2
1 +x2
2 − 1 = 0
f2 = x2
3 +x2
4 − 1 = 0 .
(a) Show that the vector ﬁeld
w =x1
∂
∂x 2
−x2
∂
∂x 1
+λ
(
x4
∂
∂x 3
−x3
∂
∂x 4
)
,


## Page 30

30 JUSTIN M. CURRY
λ ∈ R, is tangent to X and hence deﬁnes by restriction a
vector ﬁeld, v, on X.
(b) What are the integral curves of v?
(c) Show that Lwfi = 0.
(5) For the vector ﬁeld, v, in problem 4, describe the one-parameter
group of diﬀeomorphisms it generates.
(6) Let X and v be as in problem 1 and let f : R2 → X be the
map, f (x1,x 2) = (x1,x 2,x 2
1 +x2
2). Show that if u is the vector
ﬁeld,
u =x1
∂
∂x 1
+x2
∂
∂x 2
,
then f∗u =v.
(7) Let X be a submanifold of X in RN and let v and w be the
vector ﬁelds on X and U. Denoting by ι the inclusion map of
X into U, show that v and w are ι-related if and only if w is
tangent to X and its restriction to X is v.
(8) Let X be a submanifold of RN and U an open subset of RN
containing X, and let v and w be the vector ﬁelds on X and
U. Denoting by ι the inclusion map of X into U, show that
v and w are ι-related if and only if w is tangent to X and its
restriction to X is v.
(9)An elementary result in number theory asserts
Theorem 3.28. A number, λ ∈ R, is irrational if and only if
the set
{m +λn, m and n integers}
is a dense subset of R.
Let v be the vector ﬁeld in problem 4. Using the theorem
above prove that if λ/ 2π is irrational then for every integral
curve, γ (t), −∞ < t <∞ , of v the set of points on this curve
is a dense subset of X.
(10) Let v be a vector ﬁeld on X and ϕ : X → R, a C∞ function.
Show that if the function
(3.29) Lvϕ =ι(v)dϕ
is zero ϕ is constant along integral curves of v.
(11) Suppose that ϕ :X → R is proper. Show that if Lvϕ = 0, v is
complete.
Hint: For p ∈ X let a = ϕ (p). By assumption, ϕ − 1(a) is
compact. Let ρ ∈ C ∞
0 (X) be a “bump” function which is one
on ϕ − 1(a) and let w be the vector ﬁeld, ρv . By Theorem 3.27,
w is complete and since


## Page 31

CHAPTER 4: FORMS ON MANIFOLDS 31
Lwϕ =ι(ρv )dϕ =ρι (v)dϕ = 0
ϕ is constant along integral curves of w. Let γ (t), −∞ <t<
∞ , be the integral curve of w with initial point, γ (0) = p. Show
that γ is an integral curve of v.
(12) Show that in Theorem 3.23 the hypothesis that M is compact
can be replaced with v compactly supported.
(13) Let Ci i = 1, 2,... be an exhaustion of M by compact sets and
ρi ∈ C ∞
o (M) a bump function which is 1 on Ci. By 12, Theorem
3.23 is true for each of the vector ﬁelds vi :=ρiv. Conclude that
Theorem 3.23 is true for v itself. Here are a few hints:
(a) Let γ : [0,T ] → M be an integral curve of v. Show that
for some i γ([0,T ]) is contained in Int Ci.
(b) Conclude that γ is an integral curve of vi.
(c) Let ( fi)t, −∞ < t < ∞ be the one-parameter group of
diﬀeomorphisms associated with vi. Show that there exists
a neighborhood, U, of γ (0) with the property
(fi)t(U) ⊆ IntCi
for 0 ≤ t ≤ T .
(d) Conclude that, on the set U × [0,T ),fi =f .
(e) Conclude from the foregoing that f :U × [0,T ] → M is a
C∞ map.
(f) Finally, noting that p =γ (0) can be an arbitrary point on
M andT an arbitrary positive real number, conclude that
f :M × (−∞ , ∞ ) → M
is C∞ .
4. Differential Forms on Manifolds
Deﬁnition 4.1. LetX be a manifold. A diﬀerentialk-form is a func-
tion ω that assigns to each p ∈X an element ω (p) of Λ k(T ∗
pX).
4.1. Push-Forwards and Pull-Backs. Recall that in the previous
section we deﬁned the terms push-forward and pull-back for vector
ﬁelds via a diﬀeomorphism f . For diﬀerential forms the situation is
even nicer. Just as in §2.5 we can deﬁne the pull-back operation on
forms for any C∞ map f :X → Y . Speciﬁcally: Let ω be a k-form on
Y . For every p ∈X, and q =f (p) the linear map
dfp :TpX → TqY


## Page 32

32 JUSTIN M. CURRY
induces by (1.8.2) a pull-back map
(dfp)∗ : Λk(T ∗
q ) → Λk(T ∗
p )
and, as in §2.5, we’ll deﬁne the pull-back, f ∗ω , of ω to X by deﬁning
it at p by the identity
(4.2) ( f ∗ω )(p) = (dfp)∗ω (q).
Notice that, in contrast to vector ﬁelds where we deﬁned push -
forwards ﬁrst, pull-backs of k-forms are deﬁned ﬁrst for any C∞ map,
independent of push-forwards. However, in both scenarios, we can get
push-forwards as pull-backs of the inverse map. To summariz e:
Deﬁnition 4.3 (Pull-backs and Push-forwards) . Suppose X and Y
are manifolds, ω a k-form in Y , with f : X → Y a C∞ map where
f (p) = q. The pull-back of ω is deﬁned point-wise as
(f ∗ω )(p) = (dfp)∗ω (q).
Now suppose that η is a k-form on X and g : X → Y is a diﬀeomor-
phism,g(p) = q then the push-forward of η is
(g∗η )(q) = (g− 1∗η )(q) = (dg− 1
q )∗η (p).
Remark 4.4 (Functoriality) . Let X, Y and Z be manifolds and f :
X → Y and g :Y → Z C∞ maps. Then if ω is a k-form on Z
f ∗(g∗ω ) = (g ◦f )∗ω.
Now assume that ω is a k-form on X and f : X → Y , g : Y → Z are
diﬀeomorphisms. Observe that
(g ◦f )∗ω = [( g ◦f )− 1]∗ω
= ( f − 1 ◦g− 1)∗ω
= g− 1∗(f − 1∗ω )
= g∗(f∗ω ).
4.2. Smooth k-forms. As with vector ﬁelds, smooth k-forms are k-
forms whose local coordinate representations are smooth.
Deﬁnition 4.5. AssumeU ⊆ X is the domain of some chart ( U,V,ϕ )
and ω is a k-form on U. ω is C∞ if ϕ ∗ω is C∞ on V .
Extending this deﬁnition globally provides us with the deﬁn ition:
Deﬁnition 4.6. A k-form ω on X is C∞ if, for every point p ∈X, ω
is C∞ on some neighborhood of p.
Exercise 4.7. As with vector ﬁelds, show that these deﬁnitions are
independent of choice of chart.


## Page 33

CHAPTER 4: FORMS ON MANIFOLDS 33
Proposition 4.8. Assume Xi i = 1, 2 are manifolds and f :X1 → X2
is a C∞ map. If ω is a C∞ k-form on Y , then f ∗ω is a C∞ k-form on
X.
Proof. Forpi ∈Xi i = 1, 2 and p2 =f (p1) let Ui be neighborhoods of
pi, shrinking U1 if necessary so that f (U1) ⊆ U2. Assuming ( Ui,Vi,ϕ i)
i = 1, 2 are charts in their respective atlases, then the map g := ϕ 2 ◦
f ◦ϕ − 1
1 :V1 → V2 is C∞ . Since ω is a C∞ k-form on Y , ϕ 2∗ω is C∞ , so
ϕ 1∗(f ∗ω ) = (f ◦ϕ − 1)∗ω = (ϕ − 1
2 ◦g)∗ =g∗(ϕ 2∗ω )
is C∞ . □
4.3. The Exterior Diﬀerentiation Operation.
Deﬁnition 4.9. Let ω be a C∞ k-form on a manifold X. For p ∈X
take a chart (U,V,ϕ ) and deﬁne the exterior derivative ofω ,dω , on X
by the formula
(4.10) dω := (ϕ − 1)∗dϕ ∗ω.
We now wish to show that this deﬁnition is independent of char t.
Assumep ∈X is contained in two charts ( Ui,Vi,ϕ i)i = 1, 2 and deﬁne
ψ :=ϕ 2 ◦ϕ − 1
1 . Observe that
dϕ 2∗ω = d(ψ ◦ϕ 1)∗ω
= dψ ∗ϕ 1∗ω
= ψ ∗dϕ 1∗ω
= ϕ 2∗ϕ − 1
1∗dϕ 1∗ω
hence
ϕ − 1
2∗dϕ 2∗ω = ϕ − 1
1∗dϕ 1∗ω.
Note that we have used the fact that ψ ∗d = dψ ∗, i.e. the push-
forward commutes with the exterior derivative d. This follows from
the fact that the pull-back commutes with the exterior deriv ative and
deﬁning the push-forward as the pull-back via the inverse ma p. Recall
that for ω =fdxI and a C∞ mapG,G∗dω =G∗(df∧dxI) = d(f ◦G) ∧
d(xI ◦G) = dG∗(fdxI).
We can therefore, deﬁne the exterior derivative, dω , globally by
deﬁning it to be equal to (4.10) on every chart.
It’s easy to see from the Deﬁnition 4.9 that this exterior diﬀ erenti-
ation operation inherits from the exterior diﬀerentiation operation on
open subsets of Rn the properties from Section 2.3 of Chapter 2:
I. For ω 1, ω 2 in Ωk(U) d(ω 1 +ω 2) = dω 1 +dω 2.


## Page 34

34 JUSTIN M. CURRY
II. For ω 1 ∈ Ωk(U) and ω 2 ∈ Ωℓ (U) d(ω 1 ∧ω 2) = dω 1 ∧ω 2 +
(−1)kω 1 ∧dω 2.
III. For ω ∈ Ωk(U) d(dω ) = 0.
Note that for zero forms, i.e., C∞ functions, f : X → R, df is the
“intrinsic”df deﬁned in Section 2.1, i.e., for p ∈X dfp is the derivative
of f
dfp :TpX → R
viewed as an element of Λ 1(T ∗
pX).
4.4. The Interior Product and Lie Derivative Operation. Given
ak-form,ω ∈ Ωk(X) and a C∞ vector ﬁeld,w, we will deﬁne the interior
product
(4.11) ι(v)ω ∈ Ωk− 1(X),
as in §2.4, by setting
(ι(v)ω )p =ι(vp)ω p
and the Lie derivative
Lvω = Ω k(X)(4.12)
by setting
Lvω = ι(v)dω +dι(v)ω.(4.13)
It’s easily checked that these operations satisfy the ident ities (2.4.2)–
(2.4.8) and (2.4.12)–(2.4.13) (since, just as in §2.4, these identities are
deduced from the deﬁnitions (4.11) and (3.3) by purely forma l manip-
ulations). Moreover, if v is complete and
ft :X → X, −∞ <t< ∞
is the one-parameter group of diﬀeomorphisms of X generated byv the
Lie derivative operation can be deﬁned by the alternative re cipe
(4.14) Lvω =
( d
dtf ∗
tω
)
(t = 0)
as in (2.5.22). (Just as in §2.5 one proves this by showing that the
operation (4.14) has the properties (2.12) and (2.13) and he nce that it
agrees with the operation (4.13) provided the two operation s agree on
zero-forms.)


## Page 35

CHAPTER 4: FORMS ON MANIFOLDS 35
4.5. Exercises in Symplectic Geometry: The Cotangent Bun-
dle. The following is an extremely important example of a manifol d.
It arises naturally in classical mechanics, by considering an N-particle
system constrained to a certain conﬁguration space X (X is typically
a submanifold of R3N ). A concrete example is the pendulum, whose
conﬁguration space is simply X = S1. The phase space – or position-
momentum space – is then described by the cotangent bundle, w hich
we will deﬁne below.
Deﬁnition 4.15. LetM =M 2n be an even dimensional manifold and
ω ∈ Ω2(M). We say ω is a symplectic form ifdω = 0 (ω is closed) and
(ω ∧ · · · ∧ω )p =ω ∧n
p ̸= 0 for all p ∈M (ω is non-degenerate).
Deﬁnition 4.16. If M = M 2n and ω is a symplectic form, then we
call (M,ω ) a symplectic manifold .
(1) Cotangent Bundle as a Manifold. LetX be ann-dimensional
manifold,
T ∗X = {(p,ζ ),p ∈X,ζ ∈T ∗
pX}
the cotangent bundle, and π : T ∗X → X the projection map
(p,ζ ) ↦→ p. Show that if ( U,V,ϕ ) is a chart on X and T ∗U =
π − 1(U) is the subset of T ∗X “sitting over U” then one gets a
bijective map
˜ϕ : ˜U :=T ∗U → V × Rn∗ =: ˜V
mapping (p,ζ ) to ( q,η ) where ϕ (p) = q η ∈ T ∗
q Rn ∼
= Rn∗ ζ =
(dϕ p)∗η . Show that the collection ( ˜U, ˜V, ˜ϕ ) is an atlas in the
sense of Exercise 4. Conclude that the cotangent bundle of a
manifold, T ∗X, is a manifold.
(2) Canonical One Form. Let M =T ∗X be the cotangent bun-
dle of a manifold. For each point q = (p,ζ ) ∈M, let α q be the
element of T ∗
qM deﬁned by the identity α q = (dπ )∗
qζ . Note that
dπq is a map from TqM → TpX so its transpose goes in the
opposite direction. Show that the assignment q ∈ M ↦→ α q ∈
T ∗
qM deﬁnes a one-form. (This form is called the canonical
one-form on M.)
(3) Functoriality. Show that if Xi are manifolds, f : X1 → X2
a diﬀeomorphism, and Mi = T ∗Xi i = 1, 2 are the respective
cotangent bundles, then f gives rise to a diﬀeomorphism g :
M1 → M2 where
g(p1,ζ 1) = (p2,ζ 2) ⇔
{
p2 =f (p1)
ζ 1 = (dfp1)∗ζ 2


## Page 36

36 JUSTIN M. CURRY
Show that if α 1 and α 2 are the canonical one-forms on M1 and
M2 then g∗α 2 =α 1. Hint: Look at
Tq1M
dg →→
dπ q1
↓↓
Tq2M
dπ q2
↓↓
Tp1X1
df →→Tp2X2
which after applying transposes reverses the vertical and h ori-
zontal arrows.
(4) Show that if X = Rn and M = T ∗Rn = Rn × Rn∗, with linear
coordinates, x1,...,x n, ξ 1,...,ξ n, then the canonical one-form
α is equal to ∑
iξidxi. Conclude that α is smooth.
(5) Let M = T ∗X and let ω = −dα be the exterior derivative of
the canonical one-form. Show that ω is symplectic. Hint: By
functoriality it suﬃces to check this for X = Rn.
(6) Hamiltonian Vector Fields. Let H be a C∞ function on
M. Show that there is a unique vector ﬁeld vH on M with the
deﬁning property
ι(vH )ω =dH.
Hint: By linear algebra, check that ω n
p ̸= 0 if and only if the
map TpM → T ∗
pM v ↦→ ι(v)ω p is bijective. Alternative Hint:
By functoriality, check the special case X = Rn.
(7) Conservation of Energy. Suppose vH is complete. Let ft :
M → M be the one-parameter group of diﬀeomorphisms. From
ι(vH )ω = dH conclude that f ∗
tH = H, i.e. the Hamiltonian –
“energy” – is conserved. Hint: Show LvHH = 0, f ∗
tω =ω .
(8) Conservation of Volume. Following the previous exercise,
from ι(vH )ω = 0 conclude that f ∗
tω n =ω n.
5. Some Topological Results
5.1. The Support of a Function.
Deﬁnition 5.1. Assume thatU is an open subset of Rn andf :U → R
a C∞ map. Deﬁne the support of a function f to be the closed set
supp(f ) := {p ∈U,f (p) ̸= 0}.
Deﬁnition 5.2. A function is said to be compactly supported if its
support is compact. For U ⊆ Rn, the space of compactly supported
C∞ functions deﬁned on U is denoted C∞
o (U).


## Page 37

CHAPTER 4: FORMS ON MANIFOLDS 37
Remark 5.3. Assume X is a manifold and U ⊆ X. If f ∈ C ∞
o (U) then
we can regard f as being in C∞
o (X), i.e. we can extend f to a function
on all of X by setting f ≡ 0 on X ∖U.
5.2. Partitions of Unity. We are now poised to introduce the use
of partitions of unity. Requisite to their deﬁnition is the e xistence of
so-called bump functions .
Lemma 5.4. Let X be an n-dimensional manifold. For every point
p ∈ X and open set U ⊆ X containing p there exists a function f ∈
C∞
o (U) such that f ≡ 1 on a neighborhood of p and 0 ≤ f ≤ 1.
Proof. Shrinking U if necessary, we can assume U is the domain of a
chart ϕ :U → V . Let q =ϕ (p). The result is true for V,q and hence
for U,p .
□
Theorem 5.5. If X is a manifold with an open cover {Uα,α ∈ I},
then there exist functions ρi ∈ C ∞
o (X),i ∈ N such that
(1) 0 ≤ ρi ≤ 1
(2) for every compact set C there exists an i0 such that supp(ρi) ∩
C = ∅ for i>i 0
(3) ∑
iρi = 1
(4) For every i there exists an α i ∈I such that supp(ρi) ⊆ Uα i.
Proof. Let C1 ⊆ C2 ⊆ · · · be a compact exhaustion of X. Pick a
point p ∈ Ci ∖ Int(Ci− 1). p ∈ Uα for some α ∈ I and there exists
a bump function fp ∈ C ∞
o ((Int(Ci+1) − Ci− 2) ∩Uα ) with fp ≡ 1 on
a neighborhood Up of p. The sets Up,p ∈ Ci ∖ Int(Ci− 1) cover Ci ∖
Int(Ci− 1). Since Ci ∖Int(Ci− 1) is compact there exists a ﬁnite subcover
Upk, 1 ≤ k ≤ Ni. Let fk,i = fpk, i.e. fk = fk, 1 1 ≤ k ≤ N1, fk+N1 =
fk, 2 1 ≤ k ≤ N2, etc. The functions fi have all the properties desired
above except the third property, and to arrange that they hav e this
property simply renormalize, setting ρi = fiPfi
. □
5.3. Proper Mappings.
Lemma 5.6. IfMi i = 1, 2 are manifolds and f :M1 → M2 is a proper
C∞ map, then
(a) f (M1) is a closed subset of M2
(b) Given p1 ∈M1 and U1 a neighborhood of p1 in M1 there exists
a neighborhood U2 of the image point p2 = f (p1) in M2 such
that f − 1(U2) ⊂ U1


## Page 38

38 JUSTIN M. CURRY
Theorem 5.7. If f :M1 → M2 is a 1 − 1 proper immersion and X =
f (M1), then X is a closed submanifold of M2 andf is a diﬀeomorphism
of M1 onto X.
Proof. Let p1 ∈ M1 and p2 = f (p1). By the canonical immersion
theorem, there exists a chart ( Ui,Vi,ϕ i) centered at pi such that U1 ⊂
f − 1(U2) and
U1
f →→
∼
=
↓↓
U2
∼
=
↓↓V1
ι →→V2
where ι : Rk → Rn is the canonical immersion
ι(x1,...,x k) = (x1,...,x k, 0,..., 0)
(k and n are the dimensions of M1 and M2). By the above lemma
we can shrink U2 such that f − 1(U2) = U1 and hence ι(V1) = ϕ 2(U2 ∩
X). Thus ι− 1 ◦ϕ 2 : U2 ∩X → V1 is a diﬀeomorphism of the open
neighborhood U = U2 ∩X of p2 in V onto the open subset V1 of
Rk. □
5.4. The Whitney imbedding theorem. The following exercises
outline a proof of the Whitney Embedding Theorem for compact man-
ifolds.
(1) Partitions of Unity on Compact sets. LetX be a compact
set and Uα α = 1,...m an open cover. If ρi i = 1,...k is a
partition of unity subordinate to the open cover, show that t his
partition of unity can be chosen so that m =k and the support
of ρi is contained in Ui.
(2) Whitney Embedding for Compact Manifolds. LetX be a
compactn-manifold. Suppose (Ui,Vi,ϕ i) are charts on X whose
domains are a cover of X. Show that there is a 1 − 1 immersion
f : X → RnN +N . Hint: Let ρi i = 1,...,N be a partition of
unity as in Exercise 1. Show that the map f : X → RnN +N
deﬁned by
f (x) = (ρ 1ϕ 1(x),...,ρ Nϕ N (x),ρ 1,...,ρ N )
is such a 1 − 1 immersion. Sub-Hint: Show that if p ∈Ui and
dfp(v) = 0 then ( dρi)p(v) = 0 and ρi(p)(dϕ i)p(v) = 0.
(3) Whitney Embedding for RP2. Consider the map γ : S2 →
R6 deﬁned by
(x1,x 2,x 3) → (x2
1,x 2
2,x 2
3,x 1x2,x 1x3,x 2,x 3).


## Page 39

CHAPTER 4: FORMS ON MANIFOLDS 39
(a) Show that this map is an immersion.
(b) Show that it is 2 − 1 i.e. that
γ (x1,x 2,x 3) = γ (−x1, −x2, −x3).
(c) Conclude that there is a 1 − 1 immersion ˜γ : RP2 → R6
with the property
˜γ ([x1,x 2,x 3]) = γ (x1,x 2,x 3)
for (x1,x 2,x 3) ∈ S2.
