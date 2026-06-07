# AN INTRODUCTION TO FUNCTIONAL ANALYSIS DILEEP MENON

Converted from: `Functional Analysis\Functional Analysis Intro.pdf`


## Page 1

AN INTRODUCTION TO FUNCTIONAL ANALYSIS
DILEEP MENON
Abstract. In this paper we discuss some fundamental results in real and func-
tional analysis including the Riesz representation theorem, the Hahn-Banach
theorem, and the Baire category theorem. We also discuss applications of
these theorems to other topics in analysis.
Contents
1. Introduction 1
2. Some Basic Deﬁnitions 2
3. Preliminaries 3
4. Dual Spaces and the Riesz Representation Theorem 5
5. The Hahn-Banach Theorem 7
5.1. The Analytic Hahn-Banach Theorem 7
5.2. The Geometric Hahn-Banach Theorems 11
6. The Baire Category Theorem and the Uniform Boundedness Principle 13
7. Weak and Weak-* Convergence 15
Acknowledgments 17
References 17
1. Introduction
The goal of this paper is to develop the foundations of functional analysis. In
doing so, we ﬁrst review some basic concepts from real analysis. After a brief
review of Banach space and Hilbert space theory, we introduce Lp spaces, which
will serve as our primary working example throughout the paper. We circumvent a
detailed discussion of measure theory and simply assume the reader is comfortable
with Lebesgue integration. In section 4, we introduce bounded linear operators and
dual spaces which are the building blocks in the theory that follows. We conclude
this section with the Riesz representation theorem which states that the dual of
any Hilbert space is isometrically isomorphic with itself. The Riesz representation
theorem is undoubtedly one of the most important results in real analysis, because it
allows us to explicitly describe certain dual spaces. In section 5, we prove the Hahn-
Banach theorem using Zorn’s Lemma and discuss some corollaries. We continue by
proving two geometric versions of the Hahn-Banach theorem. In section 6, we prove
the Baire category theorem in order to prove the uniform boundedness principle. In
the ﬁnal section, we introduce the notions of weak and weak-* convergence. We will
apply the Hahn-Banach theorem and the uniform boundedness principle to deduce
Date: August 7, 2010.
1


## Page 2

2 DILEEP MENON
properties of these weaker topologies. The weak topologies are fundamental in the
study of functional analysis and partial diﬀerential equations.
2. Some Basic Definitions
In this section we deﬁne Banach spaces and Hilbert spaces. We also note that
every Hilbert space is a Banach space under an appropriate norm, but the converse
is not always true.
Deﬁnition 2.1. A normed linear space is a vector space X over R and a func-
tion∥·∥ : X→ R satisfying:
(i)∥x∥≥ 0 for all x∈X,
(ii)∥x∥ = 0 if and only if x = 0,
(iii)∥αx∥ =|α|∥x∥ for all x∈X, α∈ R,
(iv)∥x +y∥≤∥ x∥ +∥y∥ for all x,y∈X.
A metric spaceX is complete if every Cauchy sequence inX converges. A Banach
space is a complete normed linear space.
Deﬁnition 2.2. A subset Y of a Banach space X is dense inX if for every ϵ> 0
and x∈X there exists a y∈Y such that∥x−y∥<ϵ (or equivalently if Y =X).
A Banach space X is separable if it has a countable dense subset.
We can generalize the notion of length through the norm, and similarly we can
generalize the notion of the angle between two elements by introducing the inner
product.
Deﬁnition 2.3. An inner product over R, on a general vector space X, is a map
(·,·) : X×X→ R, such that
(i) (λx +µy,z ) =λ(x,z ) +µ(y,z )
(ii) (x,y ) = (y,x ) for all x,y∈X, and
(iii) (x,x )≥ 0 for all x∈X, with equality if and only if x = 0.
The natural norm associated with the inner product is given by,
(2.4) ∥x∥ = (x,x )1/2.
Deﬁnition 2.5. A Hilbert Space is a complete inner product space.
We now state a very useful inequality that provides the triangle inequality for
the norm deﬁned in (2.4).
Theorem 2.6. (Cauchy-Schwarz Inequality) Letx,y∈X, then
|(x,y )|≤∥ x∥∥y∥.
By deﬁning a norm through (2.4), any Hilbert space is also a Banach space.
However, the converse is not necessarily true. For example, the Lp spaces, p̸= 2,
are Banach spaces, but not Hilbert spaces. We will discuss Lp spaces in section 3.


## Page 3

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 3
3. Preliminaries
In this section we wish to review the theory of Lp spaces of Lebesgue integrable
functions and some properties of Hilbert spaces.
We begin by stating the dominated convergence theorem, a fundamental conver-
gence result from the theory of Lebesgue integration:
Theorem 3.1. (Dominated Convergence Theorem) Let Ω be an open subset
of Rn and{fn} be a sequence of measurable functions converging pointwise almost
everywhere to a limit on Ω. If there is a function g∈L1(Ω) such that|fn(x)|≤ g(x)
for every n and almost every x∈ Ω, then
lim
n→∞
∫
Ω
fn(x)dx =
∫
Ω
(
lim
n→∞
fn(x)
)
dx.
Now we deﬁne the norm onLp(Ω), 1≤p< ∞, which makes use of the Lebesgue
integral:
Deﬁnition 3.2. The Lp-norm is given by the integral (to be understood in the
Lebesgue sense):
(3.3) ∥f∥Lp =
(∫
Ω
|f(x)|pdx
)1/p
,
and we deﬁne the space
Lp(Ω) ={f :∥f∥Lp <∞}
with 1≤p< ∞.
Next we record H¨ older’s inequality which is used to prove the triangle inequality
for the Lp-norm:
Lemma 3.4. (H¨ older′s Inequality) Letp,q >1 withp−1 +q−1 = 1 and 1<p<
∞, and suppose that f∈Lp(Ω) and g∈Lq(Ω). Then, fg∈L1(Ω), with
(3.5) ∥fg∥L1≤∥f∥Lp∥g∥Lq.
Now we state the triangle inequality for theLp spaces, which is called Minkowski’s
inequality.
Lemma 3.6. (Minkowski′s Inequality ) If f,g ∈ Lp(Ω), 1 ≤ p <∞, then
f +g∈Lp(Ω), with
(3.7) ∥f +g∥Lp≤∥f∥Lp +∥g∥Lq.
Although we do not prove it here, one can show that all Lp spaces are complete
and thus Banach spaces.
One “Lebesgue” space that does not arise naturally from the integration theory
is L∞(Ω), the space of “essentially bounded” functions.
Deﬁnition 3.8. L∞(Ω) is the space of all functions f such that the essential
supremum of f, given by
(3.9) ∥f∥∞ = ess supΩ|f(x)|,
is ﬁnite. The essential supremum off is the smallest value that boundsf almost
anywhere:
ess supΩ|f(x)| = inf
{
sup
x∈S
|f(x)| :S⊂ Ω, with Ω\S of measure zero
}
.


## Page 4

4 DILEEP MENON
In particular|f(x)|≤∥ f∥∞ almost everywhere, and it follows that iff∈C0
b (Ω),
the space of bounded continuous functions on Ω, then the essential supremum of f
is the same as its supremum.
Remark 3.10. L∞ is a Banach space.
Now we deﬁne a related family of spaces, the lp spaces of sequences.
Deﬁnition 3.11. For 1≤p< ∞, lp is the space of all inﬁnite sequences {xn}∞
n=1
such that the lp-norm
(3.12) ∥x∥lp =


∞∑
j=1
|xj|p


1/p
is ﬁnite. l∞ consists of all bounded sequences, with norm
(3.13) ∥x∥l∞ = sup
j∈Z+
|xj|.
At this point we wish to clarify the relationship betweenLp andlp spaces. First,
consider the characteristic function:
χ[n,n+1](x) =
{ 1 : x∈ [n,n + 1]
0 : x /∈ [n,n + 1]
Given{αn}∈ lp, let f be deﬁned such that
f(x) =
∞∑
n=1
αnχ[n,n+1](x).
Then the Lp norm of f is
∥f(x)∥Lp =
(∫ (∞∑
n=1
αnχ[n,n+1](x)
)p)1/p
=
(∞∑
n=1
(αn)p
)1/p
=∥αn∥lp <∞.
which is the lp-norm of the sequence {αn}∞
n=1 with f∈Lp.
We end this section by stating, without proof, the orthogonal decomposition of
Hilbert spaces onto a linear subspace. We will use this result in the proof of the
Riesz representation theorem.
Deﬁnition 3.14. If M is a subset of a Hilbert space H, then the orthogonal
complement of H, M⊥, is given by
M⊥ ={u∈H : (u,v ) = 0 for all v∈M}.
Proposition 3.15. If M is a closed linear subspace of H, then every x∈H has a
unique decomposition as
x =u +v, u ∈M,v ∈M⊥.


## Page 5

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 5
4. Dual Spaces and the Riesz Representation Theorem
In this section we prove some useful results about bounded linear operators and
introduce dual spaces. We then prove our ﬁrst major result, the Riesz representation
theorem.
Deﬁnition 4.1. An operator A on a vector space V is linear if
A(x +λy) =Ax +λAy
for all x,y∈V and λ∈ R (or C).
Deﬁnition 4.2. A linear operator A from a normed vector space (X,∥·∥ X) into
another normed space (Y ,∥·∥Y ) is bounded if there exists a constantM such that
(4.3) ∥Ax∥Y ≤M∥x∥X for all x∈X.
LetL(X,Y ) denote the space of all bounded linear maps from X into Y.
Deﬁnition 4.4. The operator norm of an operator A : X→ Y is the smallest
value of M such that (4.3) holds:
(4.5) ∥A∥L(X,Y ) = inf{M :∥Ax∥Y ≤M∥x∥X for all x∈X}.
Equivalently,
(4.6) ∥A∥L(X,Y ) = sup
x̸=0
∥Ax∥Y
∥x∥X
= sup
∥x∥X=1
∥Ax∥Y.
The spaceL(X,Y ) is a Banach space whenever Y is a Banach space; this does
not depend on whether or not the space X is complete.
Proposition 4.7. Let X be a normed vector space and Y a Banach space. Then
L(X,Y ) is a Banach space.
Proof. Let{An} be a Cauchy sequence inL(X,Y ). We want to show thatAn→A
for some A∈L (X,Y ). Since An is Cauchy, givenϵ> 0 there exists an N such that
(4.8) ∥An−Am∥L(X,Y )≤ϵ for all n,m≥N.
We now show that for every ﬁxed x∈X the sequence{Anx} is Cauchy inY . This
follows since
(4.9) ∥Anx−Amx∥Y =∥(An−Am)x∥Y ≤∥An−Am∥L(X,Y )∥x∥X,
and{An} is Cauchy in L(X,Y ). Since Y is complete, it follows that Anx→ y,
where y depends on x. Let us deﬁne a mapping A :X→Y by Ax =y. First we
show that A is linear since
A(x +λy) = lim
n→∞
An(x +λy) = lim
n→∞
Anx +λ lim
n→∞
Any =Ax +λAy.
In order to show that A is bounded, take n,m ≥ N (from (4.8)) in (4.9) and let
m→∞ . Since Amx→Ax this shows that
(4.10) ∥Anx−Ax∥Y ≤ϵ∥x∥X.
Since (4.10) holds for every x it follows that
(4.11) ∥An−A∥L(X,Y )≤ϵ,
and so An−A∈L (X,Y ). Since L(X,Y ) is a vector space and An∈L (X,Y ) it
follows that A∈L (X,Y ), and An→A inL(X,Y ). □


## Page 6

6 DILEEP MENON
An extremely useful property of linear operators is that boundedness is equiva-
lent to continuity.
Proposition 4.12. LetL :X→Y be a linear map. Then L is continuous if and
only if it is bounded.
Proof. First let us suppose L is bounded, then
∥L(xn−x)∥Y ≤∥L∥L(X,Y )∥xn−x∥X,
which implies continuity since given any ϵ >0 there exists δ >0 such that∥xn−
x∥X <δ implies∥L(xn−x)∥Y <ϵ .
Now let us suppose L is continuous but unbounded; this implies that for every
n there exists a yn such that∥Lyn∥Y >n 2∥yn∥X. Now let
xn = yn
(n∥yn∥X)→ 0,
but∥lxn∥Y >n , so that L is not continuous at the origin, which is a contradiction.
Thus continuity implies boundedness. □
Deﬁnition 4.13. A bounded linear map from a Banach spaceX into R (an element
ofL(X, R)) is called a linear functional on X. The space L(X, R) of all linear
functionals on X is denoted by X∗ and is called the dual space of X.
Before we start working with dual spaces, we will provide an example using Lp
spaces.
Example 4.14. The Dual Space of Lp, 1<p< ∞:
Let p,q > 1 with p−1 +q−1 = 1. Then if f ∈ Lq(Ω), we can deﬁne a linear
functional Lf on Lp by
(4.15) Lf(g) =
∫
Ω
f(x)g(x)dx,
and this is well deﬁned because H¨ older’s inequality gives us
|Lf(g)|≤∥ f∥Lq∥g∥Lp <∞.
Clearly, we have∥Lf∥(Lp)∗≤∥f∥Lq. If we set
g(x) =|f(x)|q−2f(x)
then
∥g(x)∥Lp =
(∫
Ω
|f(x)|(q−1)pdx
)1/p
=
(∫
Ω
|f(x)|qdx
)1/p
=∥f∥q/p
Lq ,
and
|Lf(g)| =
⏐⏐⏐⏐
∫
Ω
|f(x)|qdx
⏐⏐⏐⏐ =∥f∥q
Lq.
Therefore,
|Lf(g)| =∥f∥Lq∥g∥Lp,
showing that we have
∥Lf(g)∥(Lp)∗ =∥f∥Lq.
We have shown that the map f ↦→ Lf is an isometry from Lq into (Lp)∗. Fur-
thermore, one can show that every element of (Lp)∗ can be realized as Lf for some
f ∈ Lq. (In other words that the map f ↦→ Lf is onto). It follows that Lq and


## Page 7

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 7
(Lp)∗ are isometrically isomorphic, denoted as Lq≃ (Lp)∗. We conclude that every
element of (Lp)∗ can be identiﬁed with an element of Lq.
It is important to note that ( L∞)∗̸≃ L1. We will prove this later using the
Hahn-Banach theorem.
Now we show that for any Hilbert Space H, the dual of H is identiﬁable with H
itself. In particular, we show that any linear functional l on H can be represented
as an inner product with some appropriate element xl of H itself:
Theorem 4.16. (Riesz Representation Theorem). For any Hilbert space H,
H∗≃H. In particular, for every x∈H,
(4.17) lx(y)≡ (x,y )
is bounded and has norm ∥lx∥H∗ =∥x∥. Furthermore, for every bounded linear
functional l∈H∗ there exists a unique xl∈H such that
(4.18) l(y) = (xl,y ) for all y∈H,
and∥xl∥H =∥l∥H∗. It follows that l↦→xl is continuous.
Proof. By using equation (4.17) and the Cauchy-Schwarz inequality we get
|lx(y)| =|(x,y )|≤∥ x∥∥y∥
so that lx∈H∗ with∥lx∥H∗≤∥x∥, thus lx is bounded. By choosing y =x we see
that in fact∥lx∥H∗ =∥x∥.
Now suppose thatl∈H∗. Since l is bounded it is also continuous by Prop. 4.12.
We know that if l is continuous then the pre-image of a closed set is closed. Then
the kernel ofl,K ={y∈H :l(y) = 0}, is a closed subspace of H. We next observe
that the subspace K⊥ of vectors orthogonal to K is a one-dimensional subspace of
H. To see this, for u,v∈K⊥ we have
l[l(u)v−l(v)u] = 0
and so [l(u)v−l(v)u]∈K by deﬁnition. Since u and v are orthogonal to K, so is
l(u)v−l(v)u. Thus l(u)v−l(v)u is in K and K⊥ and hence is equal to 0. This
shows that u and v are proportional.
Now choose a unit vector z∈ K⊥. By Prop. 3.15, we can decompose every
y∈ H as y = (z,y )z +w, where w∈ K. Then l(y) = (z,y )l(z), and so if we set
xl =l(z)z, we have
(xl,y ) = (l(z)z,y ) =l(z)(z,y ) =l(y).
Again using Cauchy-Schwarz we see that ∥l∥H∗ ≤ ∥xl∥H and in fact, ∥l∥H∗ =
∥xl∥H. To show thatxl is unique supposel(y) = (x1,y ) = (x2,y ), withx1,x 2∈K⊥.
This implies that x1 = λx2 for some λ∈ R. Therefore, x1 = x2. It also follows
that l↦→xl is continuous since l is bounded. □
5. The Hahn-Banach Theorem
5.1. The Analytic Hahn-Banach Theorem.
Deﬁnition 5.1. A set S is called partially ordered if there is a relation x≺ y
deﬁned for certain pairs of elements ( x,y ) of S such that
(i) x≺x for all x∈S,


## Page 8

8 DILEEP MENON
(ii) x≺y, y≺x implies x =y,
(iii) x≺y, y≺z implies x≺z.
Deﬁnition 5.2. The set S is called totally ordered if for each pair ( x,y ) of
elements of S, one has either x≺y or y≺x (or both).
Deﬁnition 5.3. LetT be a subset of a partially ordered set S. Then x0∈S is an
upper bound of T if x≺x0 for all x∈T . An element x0 is said to be maximal
for S if x0≺x implies x =x0.
Lemma 5.4. (Zorn′s Lemma) IfS is a partially ordered set such that each totally
ordered subset has an upper bound in S, then S has a maximal element.
Now we prove that any linear functional deﬁned on a linear subspace of a Banach
space X can be extended to a bounded functional on all of X:
Theorem 5.5. (Hahn-Banach Theorem) LetE be a vector space andp :E→ R
be a function such that
(i) p(λx) =λp(x) for all x∈E and λ∈ R, λ> 0 (homogeneity),
(ii) p(x +y)≤p(x) +p(y) for all x,y∈E (sublinearity).
SupposeG is a subspace ofE andg is a linear functional deﬁned onG which satisﬁes
g(x)≤ p(x) for all x∈ G. Then, there exists a linear functional f : E→ R with
f(x) =g(x) for all x∈G and f(y)≤p(y) for all y∈E.
Proof. Let P denote the set of all linear maps h : D(h)→ R, where D(h) is a
subspace of E, such that
h|G =g, andh(x)≤p(x) for all x∈D(h).
Clearly P is nonempty since g∈P .
Let us deﬁne a partial order on P such that
h1≤h2 if and only if D(h1)⊂D(h2) and h2(x) =h1(x) for all x∈D(h1).
Now we will show that every totally ordered subset Q ofP has an upper bound.
Let
Q = (hi)i∈I.
If
D(h) =
⋃
i∈I
D(hi) and h(x) =hi(x) for all x∈D(hi)
thenh∈P andhi≤h for all i∈I, and therefore, h is an upper bound. By Zorn’s
Lemma P admits a maximal element, f.
Then by construction f : D(f)→ R, f(x) = g(x) for all x∈ G, and f≤ p on
D(f).
If D(f) =E then the proof is complete.
IfD(f)̸=E then there existsx0∈E\D(f). We will show that f can be further
extended which contradicts the maximality of f. Let us construct
˜f :D(f) + Rx0 =D( ˜f)→ R.
Deﬁne ˜f(x0) =α and ˜f(x +tx0) =f(x) +tα. Clearly ˜f is a linear functional that
extends g.


## Page 9

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 9
Now we want to show f(x) +tα≤p(x +tx0) for all t∈ R and x∈D(f). Since
p is positively homogeneous of degree 1, let t =±1, so
f(x)−α≤p(x−x0)
f(y) +α≤p(y +x0),
for all x,y∈D(f). Then
f(x)−p(x−x0)≤α≤p(y +x0)−f(y),
for all x,y∈D(f). Now it suﬃces to show that
f(x)−p(x−x0)≤p(y +x0)−f(y),
and we know that
f(x) +f(y) =f(x +y)≤p(x +y)≤p(x−x0) +p(y +x0),
since f≤p on D(f). Thus we have shown that f can be further extended, which
contradicts the maximality of f inE. Hence D(f) =E and the theorem is proved.
□
The Hahn-Banach theorem is an extremely powerful tool in functional analysis;
here we state just a few of its immediate consequences:
Remark 5.6. Note that if we let p(x) =∥g∥G∗∥x∥, then by the Hahn-Banach theo-
rem there exists f∈E∗ such that f(x) =g(x) for all x∈G and f(y)≤∥g∥G∗∥y∥
for all y∈E. It follows that
∥f∥E∗ = sup
x∈E
|f(x)|
∥x∥ =∥g∥G∗.
Corollary 5.7. LetX be a Banach space.
(i) If x∈X, then there exists f∈X∗ such that∥f∥X∗ = 1, f(x) =∥x∥X.
(ii) For all x∈X,
∥x∥X = max
f∈X∗,∥f∥≤1
f(x).
Proof. (i) LetG be a subspace of E such that G = Rx. Deﬁne g :G→ R onG by
g(αx) =α∥x∥ for all α∈ R.
Then g is linear, and
|g(αx)| =|α|·∥ x∥ =∥αx∥.
So g is bounded on G and,
∥g∥G∗ = sup
x∈G,x̸=0
g(x)
∥x∥ = 1.
Then by the Hahn-Banach theorem, there is a bounded linear functional f on X
such that∥f∥X∗ = 1 and f(x) =∥x∥X.
(ii) It follows from Remark 5.6 that
|f(x)|≤∥ f∥∥x∥.
Therefore,
∥x∥≥ sup
f∈X∗,f̸=0
|f(x)|
∥f∥ .


## Page 10

10 DILEEP MENON
However, by (i) for each x ∈ X there is an f ∈ X∗ such that ∥f∥ = 1 and
f(x) =∥x∥. So,
∥x∥ = max
f∈X∗,f̸=0
|f(x)|
∥f∥ .
□
Corollary 5.8. Let X be a Banach space. If x,y ∈X and f(x) = f(y) for every
f∈X∗ then x =y.
Proof. If x = y = 0 then the proof is done. Therefore, without loss of generality
assume that x̸= 0. Assume x̸=y and let Y be the linear subspace spanned by x
and y. If x and y are linearly dependent, set
g(αx) =α|x|,
otherwise set
g(αx +βy) =α|x| for all β∈ R.
In both casesg(x)̸=g(y). Then by using the Hahn-Banach theorem, we can extend
g to an element f∈X∗. Clearly, f(x)̸=f(y). □
We use the Hahn-Banach theorem in the following example to show that L1 is
not the whole dual space of L∞.
Example 5.9. We want to show that not every element of the dual of L∞ is given
by
Λ(g) =
∫ 1
−1
f(x)g(x)dx
for some f∈L1.
Proof. Let C[−1, 1] be the space of continuous functions on the closed interval
[−1, 1]. Clearly, C[−1, 1] is a subspace of L∞[−1, 1]. Also, C[−1, 1] is a Banach
space with norm
∥·∥ ∞ = max
x∈[−1,1]
|f(x)|.
Let Λ : C[−1, 1]→ R be such that Λ(f) =f(0)≤∥f∥∞ and assume Λ is linear.
By the Hahn-Banach theorem, there exists Λ :L∞[−1, 1]→ R such that
Λ(f) =f(0) for all f∈C[−1, 1],
and Λ∈ (L∞)∗. We want to show that there does not exist g∈L1 such that
Λ(f) =
∫ 1
−1
f(x)g(x)dx for all f∈L∞[−1, 1].
To show this suppose there exists such a function g ∈ L1[−1, 1]. Consider the
sequence of functions{fn} such that
fn(x) = max{1−n|x|, 0}.
fn(x) converges to 0 pointwise and clearly, |f(x)|≤ 1.
We know Λ is well deﬁned since∫
|fn(x)g(x)|dx≤
∫
|g(x)|dx< ∞.


## Page 11

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 11
Hence, by the dominated convergence theorem we have
lim
n→∞
Λ(fn) = lim
n→∞
∫
fn(x)g(x)dx =
∫
lim
n→∞
fn(x)g(x)dx = 0.
However, fn(0) = 1 for all n, by deﬁnition, which leads to a contradiction. This
shows that there does not exist such a function g∈L1[−1, 1]. □
5.2. The Geometric Hahn-Banach Theorems. Here we apply the analytic
Hahn-Banach theorem to prove two versions of the geometric Hahn-Banach theo-
rem. The geometric versions of the Hahn-Banach theorem are often more useful
when trying to prove results in analysis.
Deﬁnition 5.10. Let f : E→ R be a nonzero linear functional, and α∈ R. We
then deﬁne a hyperplaneH on E by the set H ={x∈E :f(x) =α}.
Deﬁnition 5.11. Let E be a normed vector space and let A and B be subsets
of E. We say that a hyperplane H ={x∈ E : f(x) = α} separates A and B if
f(x)≤α for all x∈A andf(y)≥α for all y∈B. H strictly separates A and B
if f(x)<α for all x∈A and f(y)>α for all y∈B.
We state and prove two lemmas that will allow us to prove one version of the
Geometric Hahn-Banach theorem.
Lemma 5.12. Let C be an open convex subset of a normed vector space E such
that 0∈C. Then there exists p :E→ R such that
(i) p(βx) =βp(x) for all β∈ R and x∈E,
(ii) p(x +y)≤p(x) +p(y) for all x,y∈E,
(iii) 0≤p(x)≤M∥x∥ for all x∈E,
(iv) C ={x∈E :p(x)< 1}.
Proof. For allx∈E deﬁne p(x) = inf{α> 0 :α−1x∈C}.
(i) Clearly,p(βx) = inf{α> 0 :α−1βx∈C} =βp(x).
(iii) Since C is open, there exists an r > 0 such that B(0,r )⊂ C, which im-
plies p(x)≤ 1
r∥x∥ for all x∈E. Set M = 1
r .
(iv) Since C is open, x∈ C implies (1 + ϵ)x∈ C, 0 < ϵ≪ 1. By deﬁnition it
follows that p(x)≤ 1
1+ϵ < 1, which implies that C⊆{ p(x) < 1}. Now suppose
that p(x)< 1, then there exists α∈ (0, 1) such that α−1x∈C. Since C is convex
and 0,α−1x∈C this implies x∈C. This shows that C ={x∈E :p(x)< 1}.
(ii) For everyx∈E and ϵ> 0,
x
p(x) +ϵ∈C,
because
p
( x
p(x) +ϵ
)
= p(x)
p(x) +ϵ < 1.
Again, since C is convex, for all t∈ [0, 1],
tx
p(x) +ϵ + (1−t)y
p(y) +ϵ∈C.


## Page 12

12 DILEEP MENON
Now, set
t = p(x) +ϵ
p(x) +p(y) + 2ϵ
It follows that
x +y
p(x) +p(y) + 2ϵ∈C, and p
( x +y
p(x) +p(y) + 2ϵ
)
< 1.
This gives
p(x +y)≤p(x) +p(y) + 2ϵ.
□
Lemma 5.13. LetC be a nonempty open convex subset of a normed vector space
E and x0∈E\C. Then there exists f∈E∗ such that f(x)<f (x0) for all x∈C.
Proof. Without loss of generality, assume 0 ∈ C. Let G be a subspace of E such
that G = Rx0 and g :G→ R be a linear functional such that g(tx0) =t.
Deﬁne p :E→ R as in Lemma 5.12 above. Note that x0̸∈C, then g≤p on G
since 1≤p(x0). Then by the Hahn-Banach theorem, there exists a bounded linear
functional f :E→ R such that f(x) =g(x) for all x∈G and f≤p on E.
It follows that f(x)≤ M∥x∥ for all x∈ E, and f(x)≤ p(x) < 1 for all x∈ C.
Set f(x0) = 1, then f(x)<f (x0) for all x∈C. □
Now we are well equipped to prove the geometric Hahn-Banach theorems:
Theorem 5.14. (Geometric Hahn-Banach 1). Let A and B be nonempty dis-
joint convex subsets of a normed vector space E. If A is open, then there exists a
hyperplaneH separatingA and B.
Proof. LetC =A−B ={x−y :x∈A,y∈B}. Since A andB are disjoint 0̸∈C.
It is easy to see that C is also a nonempty open convex subset of E.
By Lemma 5.13, if x0∈E\C, then there exists f∈E∗ such that f(z)<f (x0)
for all z∈C. Let x0 = 0 and f(0) = 0. Then, f(z)< 0 for all z∈C.
It follows that
f(x−y)< 0,
f(x)≤f(y) for all x∈A,y∈B.
So there exists an α∈ R such that
sup
x∈A
f(x)≤α≤ inf
y∈B
f(y).
Thus the hyperplane H ={x∈E :f(x) =α} separates A and B. □
Theorem 5.15. (Geometric Hahn-Banach 2). Let A and B be nonempty dis-
joint convex subsets of a normed vector space E. If A is closed and B is compact,
then there exists a hyperplane H that strictly separates A and B.
Proof. Deﬁne Aϵ =A +B(0,ϵ ) and Bϵ =B +B(0,ϵ ). Then, both Aϵ and Bϵ are
nonempty, open and convex.
We claim there exists ϵ >0 such that Aϵ∩Bϵ =∅. To see why, suppose not.
Then for every ϵ> 0 we have Aϵ∩Bϵ̸=∅. Choose a sequence {ϵk}→ 0 such that
we can ﬁnd sequences{xk}⊂ A and{yk}⊂ B satisfying
|xk−yk|< 2ϵk.


## Page 13

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 13
for all k≥N, N∈ N.
SinceB is compact,{yk} has a convergent subsequence{ykj} such that{ykj}→
y in B. So there exists N1∈ N such that for all k≥N1
|ykj−y|< 2ϵkj.
Deﬁne a subsequence{xkj} of{xk} such that
|xkj−ykj|< 2ϵkj.
Then,
|xkj−y|≤| xkj−ykj| +|ykj−y|< 4ϵkj.
Since A is closed, it must follow that y∈ A and y∈ B. This is a contradiction
since A and B are disjoint, so Aϵ∩Bϵ =∅ for some ϵ> 0.
Now if we apply the ﬁrst geometric Hahn-Banach theorem (Theorem 5.13) on
Aϵ and Bϵ we have
f(x +βϵ)≤α≤f(y−βϵ) for all x∈A, y∈B,
for some 0 < β <1. Hence, A and B are strictly separated by the hyperplane
H ={x∈E :f(x) =α}. □
Here we state one important corollary of the the second geometric Hahn-Banach
theorem.
Corollary 5.16. LetF be a subspace of a normed vector spaceE such that F̸=E.
Then there exists f∈E∗\{ 0} such that f(x) = 0 for all x∈F .
Proof. SinceF̸=E, there existsx0∈E\F . Let A =F andB ={x0}. Then by the
second geometric Hahn-Banach theorem (Theorem 5.15) there exists a hyperplane
determined by the pair (f,α ), f∈E∗, that strictly separates A and B,
(5.17) f(x)<α<f (y) for all x∈A.
Now since A is a subspace of E it is closed under scalar multiplication and since
(5.17) holds for all x∈A we can write:
f(βx) =βf (x)<α<f (y) for all x∈A, β∈ R.
In order for this to hold, f(x) is necessarily 0 for all x∈F . □
This corollary is one of the most important results related to the Hahn-Banach
theorem, because it provides an alternative way of showing density of a subspace.
This is often much easier to work with than trying to verify the topological deﬁnition
of a dense subspace.
6. The Baire Category Theorem and the Uniform Boundedness
Principle
Another fundamental result in functional analysis is the uniform boundedness
principle. In order to prove the uniform boundedness principle, we will have to use
the following topological result from real analysis, the Baire Category theorem.
Theorem 6.1. (Baire Category Theorem). If Ui is a countable family of dense
open subsets of a Banach space X, then
U =
∞⋂
n=1
Un


## Page 14

14 DILEEP MENON
is dense in X.
Proof. Takex∈ X, and r > 0; we want to show that B(x,r ) ⋂U is not empty.
Now, since each Un is dense and open, for some y∈Un and s> 0, we have
B(x,r )∩Un⊃B(y, 2s)⊃B(y,s ).
First take x1 ∈ X and r1 < 1/2 such that B(x1,r 1)⊂ U1∩B(x,r ), then take
x2∈ X and r2 < 2−2 such that B(x2,r 2)⊂ U2∩B(x1,r 1), and in general take
xn∈X andrn < 2−n such thatB(xn,rn)⊂Un∩B(xn−1,rn−1). By this we obtain
a nested sequence of closed sets
(6.2) B(x1,r 1)⊃B(x2,r 2)⊃··· .
Since the space X is complete we have,
∞⋂
n=1
B(xn,rn) =x0.
So, the points {xj} form a Cauchy sequence by (6.2), and they converge to x0,
which is the intersection of all the nested sets. Now, x0∈B(x1,r 1)⊂B(x,r ), and
also x0∈B(xn,rn)⊂Un for all n. So x0∈U∩B(x,r ) as asserted. □
By taking complements, we have this immediate useful corollary:
Corollary 6.3. Let X be a Banach space and Fj a countable sequence of nowhere
dense subsets. Then
∞⋃
j=1
Fj̸=X.
We now prove the uniform boundedness principle, which will come into play in
proving some results about weak convergence.
Theorem 6.4. (Uniform Boundedness Principle ). Let X be a Banach space
and Y normed space. Let S⊂L (X,Y ), and let
sup
T∈S
∥Tx∥Y <∞ for all x∈X.
Then
sup
T∈S
∥T∥L(X,Y ) <∞.
Proof. Consider the sets
Gj ={x∈X :∥Tx∥Y ≤j for all T∈S}.
Then ⋃
jGj =X, and since Gj is closed, Corollary 6.3 shows that at least one of
the Gj must have a nonempty interior, call it Gn. Then there exists y∈ X, and
r> 0 such that B(y,r )⊂Gn.
Therefore, if∥x∥X≤r, so that (y +x)∈Gn,
∥Tx∥Y =∥T (y +x) +T (−y)∥≤ n +∥Ty∥Y ≤R
for some R >0, since supT∈S∥Ty∥Y is bounded. Thus, for any x with∥x∥X = r
we have
∥Tx∥Y ≤ R
r∥x∥X, for all T∈S.


## Page 15

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 15
This shows that,
∥T∥L(X,Y )≤ R
r for all T∈S,
□
7. Weak and Weak-* Convergence
First, we introduce the notion of a reﬂexive space in order to prove some basic
results about weak convergence.
Let X be a general Banach space. Then for an element x∈X we can deﬁne a
linear functional Gx on X∗ by
(7.1) Gx(f) =f(x) for all f∈X∗.
with Gx∈ X∗∗≡ (X∗)∗. If we set Ax = Gx we get a linear map A : X→ X∗∗.
Note that
|Gx(f)|≤∥ f∥X∗∥x∥,
then,
∥Gx∥X∗∗≤∥x∥.
Now by Corollary 5.7, given an x∈X there exists an f∈X∗ with∥f∥X∗ = 1 and
f(x) =|x|; therefore,
(7.2) ∥Gx∥X∗∗ =∥x∥,
and hence A is an isometry from X onto a subspace of X∗∗. When the isometry is
onto (when X≃X∗∗), we say that X is reﬂexive.
Deﬁnition 7.3. LetX be a Banach space. A sequence xn∈X converges weakly
to x∈X, denoted by
xn ⇀x in X,
if f(xn)→f(x) for every f∈X∗.
In order to motivate the preceding terminology, we point out that the standard
notion of convergence in the norm is referred to as strong convergence. Now we
show that strong convergence implies weak convergence, but the converse is not
always true.
Lemma 7.4. If xn→x (strong convergence) then xn ⇀x (weak convergence).
Proof. Every element of the dual space, X∗ is a bounded linear functional and
therefore is continuous. So, f(xn)→ f(x) for every f ∈ X∗, which is exactly
xn ⇀x . □
Example 7.5. Here we provide a simple example of weakly convergent subse-
quences that do not converge strongly:
Let{ej} be an orthonormal basis in a separable Hilbert space. The unit ball in
an inﬁnite-dimensional Hilbert space is not compact, so the{ej} have no convergent
subsequence. Hence the sequence {ej} does not converge strongly. However, we
will show that ej ⇀ 0.


## Page 16

16 DILEEP MENON
By the Riesz representation theorem, every element l∈H∗ has a representation
as (xl,·) for some xl∈H. It suﬃces to consider sequences ( xl,ej) for each xl∈H.
Now since{ej} is an orthonormal basis, we have
∥xl∥2 =
∞∑
j=l
|(xl,ej)|2,
and as j→∞ we have|(xl,ej)|→ 0. And this is precisely l(ej)→ 0 for every
l∈H∗, and therefore ej ⇀ 0.
The following result relies on the Hahn-Banach Theorem and uniform bounded-
ness principle.
Proposition 7.6. Weak limits are unique, and weakly convergent sequences are
bounded.
Proof. If xn ⇀ xand xn ⇀ ythen it follows that f(x) = f(y) for every f∈ X∗.
By Corollary 5.8, this implies that x =y.
For boundedness, notice that for each f∈X∗,{f(xn)} is a convergent sequence
of real numbers and is bounded,
|f(xn)|≤ Cf for all n.
Now deﬁne an element Gn∈X∗∗ that corresponds to xn,
Gn(f) =f(xn) for all f∈X∗.
Then
|Gn(f)|≤ Cf for all n,
and{Gn(f)} is a bounded sequence for everyf∈X∗. By Prop. 4.7 X∗ is complete
and then by the uniform boundedness principle the sequence{∥Gn∥X∗∗} is bounded.
Finally, by equation (7.2)∥Gn∥X∗∗ =∥xn∥, so{xn} is bounded as wanted. □
Taking weak limits can decrease the norm, however it can never increase it. The
following lemma shows this:
Lemma 7.7. If xn ⇀x in X then
∥x∥≤ lim inf
n→∞
∥xn∥.
Proof. If xn ⇀ x, choose f∈ X∗ such that∥f∥X∗ = 1, f(x) =∥x∥X (Corollary
5.7). Then
∥x∥ =∥f(x)∥ = lim
n→∞
∥f(xn)∥≤ lim inf
n→∞
∥f∥X∗∥xn∥ = lim inf
n→∞
∥xn∥.
□
Now we introduce the notion of weak-* convergence which is a type of weak
convergence for a sequence {fn} in X∗ deﬁned in terms of the action of the fn on
elements of X.
Deﬁnition 7.8. A sequence fn∈X∗ converges weakly-* to f, written
fn
∗
⇀f,
if fn(x)→f(x) for every x∈X.
Proposition 7.9. -
(i) Weak-* limits are unique, and weakly-* convergent sequences are bounded,


## Page 17

AN INTRODUCTION TO FUNCTIONAL ANALYSIS 17
(ii) weak convergence implies weak-* convergence, and
(iii) weak-* convergence implies weak convergence if X is reﬂexive.
Proof. (i) Uniqueness follows directly from the deﬁnition: if f,g ∈X∗ withf(x) =
g(x) for all x∈ X, then f = g. We can apply the uniform boundedness principle
directly to the sequence {fn} to show it is bounded (this is identical to the proof
of Prop 7.6).
(ii) By (7.1) we have X⊂X∗∗, using
(7.10) Gx(f) =f(x) for all f∈X∗.
By weak convergence we have
(7.11) G(fn)→G(f) for all G∈X∗∗.
In particular we have
Gx(fn)→Gx(f) for some x∈X.
Which gives by deﬁnition of Gx,
fn(x)→f(x) for all x∈X.
which is weak-* convergence.
(iii) IfX is reﬂexive then every element of G∈X∗∗ can be written as Gx for some
x∈X (see 7.10). Now for each G we have
Gx(fn) =fn(x)→f(x) =Gx(f)
by weak-* convergence. Since (7.11) holds for all G ∈ X∗∗, weak convergence
follows. □
Acknowledgments. It is a pleasure to thank my mentors, Jessica Lin and Yan
Zhang, for their patience and enthusiasm in teaching me functional analysis. I
would like to especially thank Jessica Lin for carefully and thoroughly helping me
revise this paper.
References
1. Ha¨ ım Brezis,Analyse fonctionnelle , Collection Math´ ematiques Appliqu´ ees pour la Maˆ ıtrise.
[Collection of Applied Mathematics for the Master’s Degree], Masson, Paris, 1983, Th´ eorie et
applications. [Theory and applications]. MR MR697382 (85a:46001)
2. Gerald B. Folland, Real analysis, second ed., Pure and Applied Mathematics (New York),
John Wiley & Sons Inc., New York, 1999, Modern techniques and their applications, A Wiley-
Interscience Publication. MR MR1681462 (2000c:00001)
3. James C. Robinson, Inﬁnite-dimensional dynamical systems , Cambridge Texts in Applied
Mathematics, Cambridge University Press, Cambridge, 2001, An introduction to dissipative
parabolic PDEs and the theory of global attractors. MR MR1881888 (2003f:37001a)
