# BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS EDWARD KARABINUS

Converted from: `Functional Analysis\Functional Analysis Applications.pdf`


## Page 1

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS
EDWARD KARABINUS
Abstract. We provide a broad overview of functional analysis, starting with
Banach and Hilbert spaces and eventually ﬁnishing with basic spectral theory
for self-adjoint, compact operators. Following this, we brieﬂy cover quantum
mechanics and motivate the derivation and proof of the Heisenberg uncertainty
principle.
Contents
1. Banach and Hilbert spaces 1
2. Bounded, unbounded, and compact operators 2
3. Functionals and the Hahn-Banach theorem 3
4. Adjointness and the dual space 4
5. The Baire category theorem and the uniform boundedness principle 6
6. The open mapping and closed graph theorems 7
7. The Riesz representation theorem 8
8. Spectral theory for operators 8
9. States, observables, and the Heisenberg uncertainty principle 10
Acknowledgments 11
References 12
1. Banach and Hilbert spaces
We recall the notion of a vector space X over the ﬁeld K. A normed vector
space is such a linear space equipped with a norm. By convention, we will specify
that the base ﬁeld K = R, although these deﬁnitions and theorems can easily be
extended to the complex numbers.
Deﬁnition 1.1. A norm is a real-valued function on X, whose value at an x ∈ X
is denoted by∥x∥ and which has the properties:
(1) ∥x∥≥ 0, with equality if and only if x = 0.
(2) ∥αx∥ =|α|∥x∥, for all α∈ R.
(3) ∥x + y∥≤∥ x∥ +∥y∥, for all y∈ X.
The concept of a norm is similar to that of ametric; in fact, a norm on X induces
a metric d on X which is given by d(x, y) =∥x− y∥ for all x, y∈ X. A Banach
space is a normed vector space that is complete; that is, every Cauchy sequence in
the metric induced by the norm of X converges to a limit in X.
Date: 26 August 2011.
1


## Page 2

2 EDWARD KARABINUS
Deﬁnition 1.2. An inner product space is a vector space X over a ﬁeld R along
with an inner product, which is a mapping ( ·,·) : V × V → R that satisﬁes the
following three axioms for all x, y, z∈ X and α∈ R:
(1) ( x, y) = (y, x)
(2) ( αx, y) = α (x, y) and ( x + y, z) = (x, z) + (y, z)
(3) ( x, x)≥ 0, with equality if and only if x = 0.
An inner product deﬁnes a norm on X given by∥x∥ =
√
(x, x) for every x∈ X.
Similar to the case of a general vector space, the norm on X also induces a metric
on that space, given by d(x, y) =∥x− y∥ =
√
(x− y, x− y), for all x, y∈ X. A
Hilbert space is an inner product space that is complete with respect to the metric
deﬁned by the inner product.
2. Bounded, unbounded, and compact operators
Suppose that E and F are normed linear (hence Banach) spaces over the ﬁeld R
(note, however, that much of quantum mechanics is concerned with Hilbert spaces
over the complex numbers). An operator from E into F is simply a mapping of
elements of E onto elements of F , much like a real-valued function on R maps
elements from some subset of R to R itself.
Deﬁnition 2.1. The operator A is a linear operator from E into F if its domain
D(A) is a linear subspace of E and, for every x, y∈ D(A), and every α, β∈ C,
A(αx + βy) = αA(x) + βA(y). For a linear operator, the image A(x) is usually
written Ax.
We will next introduce the concepts of boundedness and continuity, which are
equivalent for linear operators.
Deﬁnition 2.2. An operator is said to be continuous if for every ϵ > 0, there exists
a δ > 0 such that the inequality∥f(x)− f(y)∥F < ϵ holds whenever∥x− y∥E < δ,
for every x, y∈ E.
Deﬁnition 2.3. A linear operator is said to be bounded if there exists a constant
c such that∥Ax∥F < c∥x∥E.
Theorem 2.4. A linear operator is continuous if and only if it is bounded.
Proof. We begin by proving the forward implication. Assume that the linear oper-
ator A is not bounded. Then for every natural number n we can ﬁnd xn∈ R such
that∥Axn∥F > n∥x∥E. We set yn = xn/(n∥xn∥E). This implies that ∥yn∥ = 1
n
and that lim n→∞ yn = 0. However, we also have
∥Ayn∥F =
A
( xn
n∥xn∥
)
F
= (n∥xn∥E)−1∥Axn∥F > 1.
Hence, A is not continuous, which contradicts the hypothesis.
We move on to the reverse implication. Since A is bounded, for all vectors
v, h∈ E such that h̸= 0, we have
∥A(v + h)− Av∥F =∥Ah∥F≤ M∥h∥E.
As h→ 0,∥A(v + h)− Av∥F becomes arbitrary small, proving that A is continuous.
□


## Page 3

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS 3
Deﬁnition 2.5. Let E and F be two Banach spaces. An unbounded linear operator
from E into F is a linear map A : D(A)⊂ E→ F deﬁned on a linear subspace
D(A)⊂ E with values in F . The set D(A) is called the domain of A.
By ”unbounded,” we mean ”not necessarily bounded”; hence, it may turn out
that an unbounded operator is actually bounded.
Here are some important attributes of an operator A:
Graph of A = G(A) ={[u, Au]; u∈ D(A)}⊂ E× F ,
Range of A = R(A) ={Au; u∈ D(A)}⊂ F ,
Kernel of A = N(A) ={u∈ D(A); Au = 0}⊂ E.
Deﬁnition 2.6. The unit ball BE in E is equal to the set {x∈ E;∥x∥≤ 1}.
Notation 2.7. Let E and F be two normed vector spaces (not necessarily distinct;
if E = F , then this space is writtenL (E)). The space of continuous linear operators
from E into F is denoted L (E, F ) and is equipped with the norm:
∥T∥L (E,F ) = sup
x∈E
∥x∥≤1
∥T x∥
Deﬁnition 2.8. A bounded operator T∈ L (E, F ) is said to be compact if T (BE)
has compact closure in F (in the strong topology).
In the following two deﬁnitions, we use the concepts of the dual space and the
adjoint, which are covered in detail in section 4. Brieﬂy consult ahead for the
relevant deﬁnitions if need be.
Deﬁnition 2.9. A sequence (xn) in a Banach space E is said to converge strongly
if there is an x∈ E such that lim n→∞∥xn− x∥ = 0. A sequence xn in a Banach
space E is said to converge weakly if there is an x∈ E such that for every f∈ E⋆,
limn→∞ f(xn) = f(x).
Deﬁnition 2.10. Let (fn) be a sequence of bounded linear functionals on a Banach
space E. The sequence ( fn) is said to converge in the strong topology if there is
an F∈ E⋆ such that∥fn− f∥→ 0. It is said to converge in the weak* topology if
there is an f∈ E⋆ such that fn(x)→ f(x) for every x∈ E.
3. Functionals and the Hahn-Banach theorem
A functional is a function deﬁned on a Banach space E (or on some subspace of
E) that takes values inR. We now present a very important theorem for functionals.
Theorem 3.1 (Hahn-Banach theorem, analytic form) . Let p : E→ R be a func-
tional satisfying
(1) p(λx) = λp(x), for all x∈ E and all λ > 0; and
(2) p(x + y)≤ p(x) + p(y), for all x, y∈ E.
Let G⊂ E be a linear subspace and let g : G→ R be a linear functional such that
g(x)≤ p(x) for all x∈ G. Under these assumptions, there exists a linear functional
f deﬁned on all of E that extends g, i.e., g(x) = f(x) for all x∈ G, and such that
f(x)≤ p(x) for all x∈ E.


## Page 4

4 EDWARD KARABINUS
In order to proceed with the proof of the analytic form of the Hahn-Banach
theorem, we must ﬁrst state Zorn’s lemma (a well-known result that is equivalent
to the Axiom of Choice) and state some relevant vocabulary:
Lemma 3.2. Every nonempty ordered set that is inductive has a maximal element.
Deﬁnition 3.3. Let P be a set with a (partial) order relation ≤. We say that a
subset Q⊂ P is totally ordered if for any pair ( a, b) in Q either a≤ b or b≤ a (or
both). Let Q⊂ P be a subset of P ; we say that c∈ P is an upper bound for Q if
a≤ c for every a∈ Q. We say that m∈ P is a maximal element of P if there is no
element x∈ P such that m≤ x, except for x = m. Note that a maximal element
of P need not be an upper bound for P .
We say that P is inductive if every totally ordered subset Q in P has an upper
bound.
Proof. Consider the set
P =


h : D(h)⊂ E→ R
⏐⏐⏐⏐⏐⏐
D(h) is a linear subspace of E,
h is linear, G⊂ D(h),
h extends g, and h(x)≤ p(x) for all x∈ D(h)


 .
On P we deﬁned the order relation (h1≤ h2) ⇐⇒ (D(h1)⊂ D(h2) and h2 extends
h1). It is clear that P is nonempty, since g∈ P . We claim that P is inductive.
Let Q⊂ P be a totally ordered subset; we write Q as Q = ( hi)i∈I and we set
D(h) =⋃
i∈I D(hi), h(x) = hi(x) if x∈ D(hi) for some i. It is easy to see that the
deﬁnition of h makes sense, that h∈ P , and that h is an upper bound for Q. We
may therefore apply Zorn’s lemma, and so we have a maximal element f in P . We
claim that D(f) = E, which completes the proof of the theorem.
Suppose, by contradiction, that D(f)̸= E. Let x0 /∈ D(f), set D(h) = D(f) +
Rx0, and for every x ∈ D(f), set h(x + tx0) = f(x) + tα(t ∈ R), where the
constant α∈ R will be chosen in such a way that h∈ P . We must ensure that
f(x) + tα≤ p(x + tx0) for all x∈ D(f) and all t∈ R. It suﬃces to check that
{
f(x) + α≤ p(x + x0) ∀x∈ D(f)
f(x)− α≤ p(x− x0) ∀x∈ D(f).
In other words, we must ﬁnd someα satisfying supy∈D(f) ={f(y)−p(y−x0)}≤ α≤
inf x∈D(f){p(x+x0)−f(x)}. Such an α exists, since f(y)−p(y−x0)≤ p(x+x0)−f(x)
for all x, y∈ D(f); indeed, it follows from (2) that f(x) + f(y)≤ p(x + y)≤
p(x + x0) + p(y− x0). We conclude that f≤ h, but this is impossible because f is
maximal and h̸= f. □
4. Adjointness and the dual space
Notation 4.1. Given f∈ E⋆ and x∈ E we can write ( f, x) instead of f(x); we
say that (·,·) is the scalar product for the duality E⋆, E.
Deﬁnition 4.2 (Deﬁnition of the adjoint A⋆). Let A : D(A)⊂ E→ F be an un-
bounded linear operator that is densely deﬁned. We shall introduce an unbounded
operator A⋆ : D(A⋆)⊂ F ⋆→ E⋆ as follows. First, one deﬁnes its domain:
D(A⋆) ={v∈ F ⋆;∃c≥ 0 such that| (v, Au)|≤ c∥u∥,∀u∈ D(A)}
It is clear that D(A⋆) is a linear subspace of F ⋆. We shall now deﬁne A⋆v. Given
v∈ D(A⋆), consider the map g : D(A)→ R deﬁned by g(u) = ( v, Au), for all


## Page 5

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS 5
u∈ D(A). We have|g(u)|≤ c∥u∥, for all u∈ D(A). By the Hahn-Banach theorem,
there exists a linear map f : E→ R that extends g and such that|f(u)|≤ c∥u∥, for
all u∈ E. It follows that f∈ E⋆. Note that the extension of g is unique because
D(A) is dense in E.
Set A⋆v = f. The unbounded linear operator A⋆ : D(A⋆)⊂ F ⋆→ E⋆ is called
the adjoint of A. The fundamental relation between A and A⋆ is given by
(v, Au)(F ⋆,F) = (A⋆v, u)(E⋆,E), for all u∈ D(A), for all v∈ D(A⋆).
As noted above, this is called the scalar product for the duality E, E ⋆.
Furthermore note that if A is a bounded operator, then A⋆ is also a bounded
operator (from F ⋆ into E⋆) and that∥A⋆∥L (F ⋆,E⋆) =∥A∥L (E,F ).
Notation 4.3. We denote by E⋆ the dual space of E, that is, the space of all
continuous linear functionals on E; the (dual) norm on E⋆ is deﬁned by
∥f∥E⋆ = sup
x∈E
∥x∥≤1
|f(x)| = sup
x∈E
∥x∥≤1
f(x).
E⋆ is a Banach space, i.e., E⋆ is complete (even if E is not), following from the
fact that R is complete.
Deﬁnition 4.4. A metric space E is separable if there exists a subset D⊂ E that
is countable and dense.
Deﬁnition 4.5. Let E be a Banach space and let E⋆ be the dual space with norm
∥f∥E⋆ = sup
x∈E
∥x∥≤1
| (f, x)|.
The bidual E⋆⋆ is the dual of E⋆ with norm
∥ξ∥E⋆⋆ = sup
f∈E⋆
∥f∥≤1
| (ξ, f)| (ξ∈ E⋆⋆).
There is a canonical injection J : E→ E⋆⋆ deﬁned as follows: given x∈ E, the
map f↦→ (f, x) is a continuous linear functional on E⋆; thus, it is an element of
E⋆⋆, which we denote by J x. We have
(J x, f)E⋆⋆,E = (f, x)E⋆,E
for all x∈ E and all f∈ E⋆.
It is clear that J is linear and that J is an isometry, that is, ∥J x∥E⋆⋆ =∥x∥E;
indeed, we have
∥J x∥E⋆⋆ = sup
f∈E⋆
∥f∥≤1
| (J x, f)| = sup
f∈E⋆
∥f∥≤1
| (f, x)| =∥x∥.
Deﬁnition 4.6. Let E be a Banach space and let J : E→ E⋆⋆ be the canonical
injection from E into E⋆⋆. The space E is said to be reﬂexive if J is surjective, i.e.,
there is an isomorphism (hence a bijection) between J and E⋆⋆.


## Page 6

6 EDWARD KARABINUS
5. The Baire category theorem and the uniform boundedness
principle
Theorem 5.1 (Baire category theorem). Let X be a complete metric space and let
(Xn)n≥1 be a sequence of closed subsets in X. Assume that Int Xn =∅ for every
n≥ 1. Then Int (∪∞
n=1Xn) =∅.
Proof. Set On = X c
n, so that On is open and dense in X for every n≥ 1. We wish
to show that G =∩∞
n=1On is dense in X. Let ω be a nonempty open set in X; we
shall prove that ω∩ G̸=∅.
Recall that B(x, r) ={y∈ X; d(y, x) < r}. Pick any x0∈ ω and r0 > 0 such
that B(x0, r0)⊂ ω. Then, choose x1∈ B(x0, r0)∩ O1 and r1 > 0 such that
{
B(x1, r1)⊂ B(x0, r0)∩ O1,
0 < r1 < r0
2 ,
which is always possible since O1 is open and dense. By induction one constructs
two sequences (xn) and ( rn) such that
{
B(xn+1, rn+1)⊂ B(xn, rn)∩ On+1 ∀n≥ 0,
0 < r n+1 < rn
2 .
It follows that ( xn) is a Cauchy sequence; let xn→ l.
Since xn+p∈ B(xn, rn) for every n≥ 0 and for every p≥ 0, we obtain at the
limit (as p→∞ ),
l∈ B(xn, rn),∀n≥ 0.
In particular, l∈ ω∩ G. □
We will use the Baire category theorem to prove a surprising fact about the
uniform boundedness of a family of continuous linear operators (which is, unsur-
prisingly, called the uniform boundedness principle).
Theorem 5.2 (uniform boundedness principle). Let E and F be two Banach spaces
and let (Ti)i∈I be a family (not necessarily countable) of continuous linear operators
from E into F . Assume that
sup
i∈I
∥Tix∥ <∞, ∀x∈ E.
Then
sup
i∈I
∥Ti∥L (E,F ) <∞.
In other words, there exists a constant c such that∥Tix∥≤ c∥x∥, for all x∈ E and
all i∈ I.
Proof. For every n≥ 1, let Xn ={x∈ E;∀i∈ I,∥Tix∥≤ n}, so that Xn is closed.
This implies that
∞⋃
n=1
Xn = E
by hypothesis. It follows from the Baire category theorem that Int( Xn0)̸=∅ for
some n0≥ 1. Pick x0∈ E and r > 0 such that B(x0, r)⊂ Xn0. We have
∥Ti(x0 + rz)∥≤ n0,∀i∈ I,∀z∈ B(0, 1).


## Page 7

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS 7
This leads to∥Ti(x0 + rz)∥ =∥Ti(rz− x0)∥ =|r∥Tiz∥−∥ Tix0∥|≤ r∥Tiz∥−∥ Tix0∥.
This implies that∥Tiz∥≤ 1
r (n0+n0) = 2n0
r , which implies the uniform boundedness
of the family ( Ti)i∈I of continuous linear operators. □
6. The open mapping and closed graph theorems
Theorem 6.1 (open mapping theorem) . Let E and F be two Banach spaces and
let T be a continuous linear operator from E into F that is surjective. Then there
exists a constant c≥ 0 such that
(6.2) T (BE(0, 1))⊃ BF (0, c).
Proof. We split the argument into two steps:
Step 1. Assume that T is a linear surjective operator fromE onto F . Then there
exists a constant c > 0 such that T (B(0, 1))⊃ B(0, 2c). Set Xn = nT (B(0, 1)).
Since T is surjective, we have ∪∞
n=1Xn = F , and by the Baire category theorem
there exists some n0 such that Int( Xn0 ̸=∅. It follows that Int [T (B(0, 1))]̸=∅.
Pick c > 0 and y0∈ F such that
(6.3) B(y0, 4c)⊂ T (B(0, 1)).
In particular, y0∈ T (B(0, 1)), and by symmetry,
(6.4) −y0∈ T (B(0, 1)).
Adding equations (6.3) and (6.4) leads to B(0, 4c)⊂ T (B(0, 1)) + T (B(0, 1)). On
the other hand, since T (B(0, 1)) is convex, we have T (B(0, 1)) + T (B(0, 1)) =
2T (B(0, 1)), and we conclude that T (B(0, 1))⊃ B(0, 2c).
Step 2 . Assume T is continuous linear operator from E into F that satisﬁes
Equation (6.2). Then we have T (B(0, 1)) ⊃ B(0, c). Choose any y ∈ F with
∥y∥ < c . the aim is to ﬁnd some x∈ E such that ∥x∥ < 1 and T x = y. By
Equation (2,10), we know that for every ϵ > 0, there exists a z∈ E with∥z∥ < 1
2
and∥y− T z∥ < ϵ . Choosing ϵ = c/2, we ﬁnd some z1∈ E such that ∥z1∥ < 1
2
and∥y− T Z1∥ < c
2. By the same construction applied to y− T z1 (instead of y)
with ϵ = c/4 we ﬁnd some z2∈ E such that∥z2∥ < 1
4 and∥(y− T z1)− T z2∥ < c
4.
Proceeding similarly, by induction we obtain a sequence ( zn) such that∥zn∥ < 1
2n
and∥y− T (z1 + z2 + . . . + zn)∥ < c
2n , for all n.
It follows that the sequence xn = z1 + z2 + . . . + zn is a Cauchy sequence. Let
xn→ x with, clearly,∥x∥≤ 1 and y = T x (since T is continuous). □
Corollary 6.5. Let E and F be two Banach spaces and let T be a continuous linear
operator from E into F that is bijective. Then T−1 is also continuous (from F into
E).
Proof. Equation (6.2) and the hypothesis that T is bijective (hence injective) imply
that if x∈ E is chosen so that ∥T x∥ < c, then∥x∥ < 1. By homogeneity, we ﬁnd
that
∥x∥≤ 1
c∥T x∥,∀x∈ E
and therefore T−1 is continuous. □
Corollary 6.6. Let E be a vector space provided with two norms, ∥∥ 1 and∥∥ 2.
Assume that E is a Banach space for both norms and that there exists a constant


## Page 8

8 EDWARD KARABINUS
C≥ 0 such that ∥x∥2≤ C∥x∥1∀x∈ E. Then there exists a constant c > 0 such
that∥x∥1≤ c∥x∥2∀x∈ E.
Proof. Apply Corollary (6.5) with E = (E,∥∥ 1), F = (E,∥∥ 2), and T = I. □
Theorem 6.7 (closed graph theorem). Let E and F be two Banach spaces. Let T
be a linear operator from E into F . Assume that the graph of T , G(T ), is closed
in E× F . Then T is continuous.
Proof. Consider, on E, the two norms ∥x1∥ =∥x∥E +∥T x∥F and∥x∥2 =∥x∥E
(the norm∥∥ 1 is called the graph norm).
Because G(T ) is closed, E is a Banach space for the norm ∥∥ 1. On the other
hand, E is also a Banach space for the norm ∥∥ 2 and∥∥ 2≤∥∥ 1. It follows from
Corollary (2.11) that there exists a constant c > 0 such that ∥x∥1≤ c∥x∥2. We
conclude that∥T x∥F≤ c∥x∥E. □
7. The Riesz representation theorem
We begin by recalling the analytic notion of an Lp space.
Deﬁnition 7.1. Let p∈ R with 1 < p <∞; we set
Lp(Ω) =
{
f : Ω→ R; f is measurable and|f|p∈ L1(Ω)
}
with
∥f∥Lp =∥f∥p =
[∫
Ω
|f(x)|pdµ
]1/p
.
Theorem 7.2 (Riesz representation theorem) . Let 1 < p < ∞ and 1 < q < ∞
such that 1
p + 1
q = 1 and let φ∈ (Lp)⋆. Then there exists a unique function u∈ Lq
such that (φ, f) =
∫
uf,∀f∈ Lp. Moreover,∥u∥q =∥φ∥(Lp)⋆.
Proof. We consider the operator T : Lq→ (Lp)⋆ deﬁned by ( T u, f) =
∫
uf, for
all u∈ Lq, for all f∈ Lp. By H¨ older’s inequality, we have| (T u, f)∥≤∥ u∥p∥f∥q,
for all f ∈ Lq, which implies that ∥T u∥(Lq)⋆ ≤∥ u∥p. Furthermore, set f0(x) =
|u(x)|p−2u(x). Clearly we have f0∈ Lq,∥f0∥q =∥u∥p
p−1, and ( T u, f0) =∥u∥p
p;
thus∥T u∥(Lq)⋆≥ (T u,f0)
∥f0∥q
=∥u∥p. Hence, ∥T u∥(Lp)⋆ =∥u∥q, for all u∈ lq.
We claim that T is surjective. Let E = T (Lq). Since E is a closed subspace, it
suﬃces to prove that E is dense in ( Lp)⋆. Let h∈ (Lp)⋆⋆ satisfy (h, T u) = 0, for
all u∈ Lq. Since Lp is reﬂexive, h∈ Lp, and satisﬁes
∫
uh = 0, for all u∈ Lq.
Choosing u =|h|p−2h, we see that h = 0. □
8. Spectral theory for operators
Deﬁnition 8.1. Let T∈ L (E). The resolvent set, denoted by ρ(T ), is deﬁned by
ρ(T ) ={λ∈ R; (T− λI) is bijective from E into E}.
The spectrum, denoted by σ(T ), is the complement of the resolvent set, i.e., σ(T ) =
R\ ρ(T ). A real number λ is said to be an eigenvalue of T if N(T− λI)̸={0};
N(T− λI) is the corresponding eigenspace. The set of all eigenvalues is denoted
by EV (T ).


## Page 9

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS 9
Deﬁnition 8.2. In a Hilbert space H, a bounded operator T∈ L (H) is said to
be self-adjoint if T ⋆ = T , i.e.,
(T u, v) = (u, T v)∀u, v∈ H,
where (·,·) is the inner product on H.
Theorem 8.3. Every separable Hilbert space has an orthonormal basis.
Proof. Let (vn) be a countable dense subset of H. Let Fk denote the linear space
spanned by {v1, v2, . . . , vk}. The sequence ( Fk) is a nondecreasing sequence of
ﬁnite-dimensional spaces such that ∪∞
k=1Fk is dense in H. Pick any unit vector e1
in F1. If F2̸= F1, there is some vector e2 in F2 such that{e1, e2} is an orthonormal
basis of F2. We proceed by induction: suppose that there exists an orthonormal
basis for Fn with elements{e1, . . . , en}. Then, by the construction above, we can
ﬁnd a vector en+1 in Fn+1 such that{e1, . . . , en, en+1} is an orthonormal basis for
Fn+1.
Since∪∞
k=1Fk is dense in H, the set{e1, e2, . . . , en, . . .} is an orthonormal basis
for H. This completes the proof. □
Deﬁnition 8.4. Let ( En)n≥1 be a sequence of closed subspaces of H. One says
that H is the Hilbert sum of the En’s and one writes H =⊕nEn if
(1) the spaces En are mutually orthogonal, i.e.,
(u, v) = 0 ∀u∈ En, ∀v∈ Em, m̸= n,
(2) the linear space spanned by ∪∞
n=1En is dense in H.
Theorem 8.5. Let H be a separable Hilbert space and let T be a compact self-
adjoint operator.Then there exists a Hilbert basis composed of eigenvectors of T .
Proof. Let (λn)n≤1 be the sequence of all (distinct) nonzero eigenvalues of T . Set
λ0 = 0, E0 = N(T ), and En = N(T− λnI). Recall that 0 ≤ dim E0≤∞ and
0 < dim En <∞. We claim that H is the Hilbert sum of the En’s, n = 0, 1, 2, . . ..
We must show that the spaces ( En)n≥0 are mutually orthogonal (1) and that F ,
the vector space spanned by the spaces ( En)n≥0, is dense in H (2).
(1) If u∈ Em and v∈ En with m̸= n, then T u = λmu and T v = λnv, so that
(T u, v) = λm(u, v) = (u, T v) = λn(u, v). Thus ( u, v) = 0.
(2) Clearly, T (F )⊂ F . It follows that T (F⊥)⊂ F⊥; indeed, given u∈ F⊥
we have ( T u, v) = ( u, T v) = 0 for all v∈ F , so that T u∈ F⊥. The operator T
restricted to F⊥ is denoted by T0. This is a self-adjoint compact operator on F⊥.
We claim that σ(T0) = 0. Suppose not; suppose that some λ̸= 0 belongs to σ(T0).
Since λ∈ EV (T0), there is some u∈ F⊥, u̸= 0, such that T0u = λu. Therefore,
λ is one of the eigenvalues of T , say λ = λn with n≥ 1. Thus u∈ En⊂ F . Since
u∈ F⊥∩ F , we deduce that u = 0, a contradiction.
We must show that T vanishes on F⊥. In order to do so, we present (without
proof, due to space constraints) a lemma from [Br11].
Lemma 8.6. Let T∈ L (H) be a self-adjoint operator such that σ(T ) = 0. Then
T = 0.
Applying the lemma, we deduce that T0 = 0, which proves that T indeed van-
ishes on F⊥. It follows that F⊥⊂ N(T ). On the other hand, N(T )⊂ F and
consequently F⊥⊂ F . This implies that F⊥ = 0, and so F is dense in H.


## Page 10

10 EDWARD KARABINUS
Finally, we choose in each subspace ( En)n≥0 a Hilbert basis (the existence of
such a basis for E0 follows from the previous theorem; for the other En’s, n≥ 1,
this follows from the fact that they are ﬁnite-dimensional). The union of these
bases is clearly a Hilbert basis for H, composed of eigenvectors of T . □
9. States, observables, and the Heisenberg uncertainty principle
For ease of presentation, we consider a physical system in one dimension consist-
ing of a single particle. In classical mechanics, the state of our system at a given
instant can be described by the position and velocity of the particle. Because of the
simpliﬁed, one-dimensional nature of our system, this information can be condensed
into a double of signed scalars. However, in quantum mechanics, the state of our
system is indicated by a complex-valued function ψ deﬁned on R, whose argument
is a single real variable q.
We assume that ψ is an element of the Hilbert space L2(−∞, +∞). Using ψ,
we can compute the probability that the particle will be found in a given subset
J⊂ R: ∫
J
|ψ(q)|2dq
In order for this probability to make sense, we must impose a normalizing con-
dition; in this case, the probability assigned to the entire space R should be 1:
∥ψ∥2 =
∫ +∞
−∞
|ψ(q)|2dq = 1
Hence, we have replaced a deterministic conception of the system with a proba-
bilistic one. Following from these calculations, we deﬁne a state of our physical sys-
tem at a given time to be an equivalence class of elementsψ1, ψ2, . . .∈ L2(−∞, +∞)
with the relation ψ1∼ ψ2 ⇐⇒ ψ1 = αψ2,|α| = 1 and α∈ C.
The expected value of the distribution is µψ =
∫∞
−∞ q|ψ(q)|2dq, the variance is
varψ =
∫∞
−∞(q− µψ)2|ψ(q)|2dq, and the standard deviation is sdψ =√varψ.
We now deﬁne the operator Q : D(Q)→ L2(−∞, +∞) by Qψ(q) = qψ(q) (i.e.,
we multiply by the independent variable q). This is analogous to the calculation
of µψ for a given distribution, so Q is called the position operator. By deﬁnition,
D(Q) consists of all ψ∈ L2(−∞, +∞) such that Qψ∈ L2(−∞, +∞). This type of
operator is called an observable, because it contains information about a quantity
we can observe experimentally.
Deﬁnition 9.1. An observable (of our physical system at some instant) is a self-
adjoint linear operator T : D(T )→ L2(−∞, +∞), where D(T ) is dense in the space
L2(−∞, +∞).
Another important observable is the momentum p; the momentum operator is
deﬁned as
D : D(D)→ L2(−∞, +∞)
ψ↦→ h
2πi
dψ
dq
where h is Planck’s constant and the domain D(D)⊂ L2(−∞, +∞) consists of
all functions ψ∈ L2(−∞, +∞) which are absolutely continuous on every compact
interval on R and such that Dψ∈ L2(−∞, +∞).


## Page 11

BASIC FUNCTIONAL ANALYSIS WITH APPLICATIONS 11
Let S and T be any self-adjoint linear operators with domains in the same
complex Hilbert space. Then the operator C = ST− T S is called the commutator
of S and T and is deﬁned on D(C) = D(ST )∪ D(T S).
In quantum mechanics, the canonical commutation relation is between position
and momentum. By diﬀerentiation, we obtain DQψ(q) = D(qψ(q)) = h
2πi [ψ(q) +
qψ′(q)] = h
2πi ψ(q) + QDψ(q). We have therefore derived the Heisenberg commuta-
tion relation
DQ− QD = h
2πi
˜I
where ˜I is the identity operator on the domain D(DQ− QD) = D(DQ)∪ D(QD).
Theorem 9.2 (commutator). Let S and T be self-adjoint linear operators with
domain and range in L2(−∞, +∞). Then C = ST − T S satisﬁes |µψ(C)| ≤
2sdψ(S)sdψ(T ) for every ψ in the domain of C.
Proof. We write µ1 = µψ, µ2 = µψ(T ), A = S− µ1I, and B = T− µ2I. It is clear
that C = ST− T S = AB− BA. Since S and T are self-adjoint and µ1 and µ2 are
inner products, it follows that A and B are self-adjoint as well. From the deﬁnition
of a mean value, we write
µψ(C) = (( AB− BA)ψ, ψ)
= ( ABψ, ψ)− (BAψ, ψ)
= ( Bψ, Aψ)− (Aψ, Bψ)
The last two products are equal in absolute value. Hence by the triangle and
Cauchy-Schwarz inequalities we have
|µψ(C)|≤| (Bψ, Aψ)| +| (Aψ, Bψ)|≤ 2∥Bψ∥∥Aψ∥.
Thus proving the desired inequality. Note that we have
∥Bψ∥ =
(
(T− µ2I)2ψ, ψ
)1/2
=
√
varψ(T ) = sdψ(T )
and similarly for∥Aψ∥. □
We recall that the commutator of the position and momentum operators is
C = (h/2πi)˜I. Hence |µψ(C)| = h/2π and we obtain the Heisenberg uncertainty
principle.
Theorem 9.3. For the position operator Q and the momentum operator D,
sdψ(D)sdψ(Q)≥ h
4π .
These inequalities imply that one cannot measure both the position and momen-
tum of a particle simultaneously with arbitrarily high precision. This realization
was central to a revolution in physics in the twentieth century, given that it con-
tradicted centuries of belief in determinism and realism.
Acknowledgments. It is a pleasure to thank my mentor, Bobby Wilson, for his
help in preparing this paper and learning the basics of functional analysis. I greatly
appreciated his guidance, tutelage, and recommendations at every step of the pro-
cess.
I would also like to thank my parents, John and Vicky, for their support through-
out my mathematics career.


## Page 12

12 EDWARD KARABINUS
References
[Br11] Haim Brezis. Functional Analysis, Sobolev Spaces, and Partial Diﬀerential Equations.
Springer Science+Business Media, LLC. 2011.
[KF57] A. N. Kolmogorov and S. V. Fomin. Elements of the Theory of Functions and Functional
Analysis, Vol. 1. Translated by Leo F. Boron. Graylock Press. 1957.
[Kr78] Erwin Kreyszig. Introductory Functional Analysis with Applications. John Wiley and Sons.
1978.
