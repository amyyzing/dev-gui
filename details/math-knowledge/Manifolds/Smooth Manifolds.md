# William Minicozzi Notes by Serena An

Converted from: `Manifolds\Smooth Manifolds.pdf`


## Page 1

18.965 Geometry of Manifolds I
William Minicozzi
Notes by Serena An
December 19, 2025
Contents
1 Smooth Manifolds 3
1.1 Topological spaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.2 Differentiable manifolds . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.3 Tangent spaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.4 Basis theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
1.5 Differential of a map . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.6 Vector fields . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
1.7 Tensor algebras . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.8 Traces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
1.9 Metrics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
1.10 Induced metrics on tensors . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
1.11 Raising and lowering indices . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
2 Connections and covariant derivatives 14
2.1 Affine connections . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
2.2 Christoffel symbols . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
2.3 Levi-Civita connection . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
2.4 Christoffel symbols in terms of the metric . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
2.5 Parallel transport . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
2.6 Killing fields . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
3 Curvature 19
3.1 Riemann curvature tensor . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
3.2 Ricci curvature . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
4 Submanifolds 22
4.1 Induced structure on submanifolds . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
4.2 Gauss equation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
4.3 Codazzi equation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
4.4 Umbilic submanifolds . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
5 Geodesics 30
5.1 Geodesic definition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
5.2 Exponential map . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
5.3 Gauss lemma . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
5.4 Riemannian distance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
Page 1 of 77


## Page 2

William Minicozzi (December 19, 2025)
5.5 Hopf–Rinow theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
6 Variational theory of geodesics 40
6.1 Jacobi equation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
6.1.1 Normal Jacobi fields on constant curvature spaces . . . . . . . . . . . . . . . . . . . . 42
6.2 Conjugate points . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
6.3 Energy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
6.3.1 First variation of energy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
6.3.2 Second variation of energy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
6.4 Bonnet–Myers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 46
7 Laplacian 47
7.1 Harmonic functions and eigenvalues . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
7.2 Bochner formula . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 50
7.3 Isomperimetric and Wirtinger inequalities . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
7.4 Submanifolds . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 55
7.5 Spherical harmonics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
8 Minimal submanifolds 57
8.1 First variation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
8.2 Regularity theory . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
9 Laplacian comparison 62
9.1 Laplacian computations in Euclidean space . . . . . . . . . . . . . . . . . . . . . . . . . . . . 62
9.2 Distance function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 62
9.3 Calabi’s barriers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 64
9.4 Cut points . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 64
9.5 Bishop–Gromov . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 68
9.6 Dirichlet Poincar´ e inequality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
10 Gradient estimate and Liouville theorems 70
10.1 Gradient estimate . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 70
10.2 Harnack inequality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 72
10.3 Mean value inequality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 74
10.4 Harmonic functions of polynomial growth . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 75
Page 2 of 77


## Page 3

September 4, 2025 Smooth Manifolds
1 Smooth Manifolds
1.1 Topological spaces
A topological space is a set X with a notion of open sets satisfying 3 properties:
1. X and ∅ are both open.
2. Any union (even infinite) of open sets is also an open set.
3. If U and V are open, then so is U ∩ V (or any finite intersection).
An example is Rn, where a set U is open if ∀y ∈ U, ∃δ > 0 such that Bδ(y) ⊂ U, where
Bδ(y) = {z ∈ Rn | |y − z|< δ }.
A subset S ⊂ X is closed if X \ S is open. The closure of a set S is the intersection of all closed sets
containing S. A set is connected if the only subsets that are both open and closed are itself and ∅.
X is Hausdorff if for all points x1 ̸= x2, there exist open sets U1 ∋ x1 and U2 ∋ x2 with U1 ∩ U2 = ∅.
X is second countable if there is a countable basis of open sets. A basis is a collection B of open sets such
that for all U open and x ∈ U, there exists V ∈ B such that x ∈ V ⊂ U. Every open set is thus a (likely
infinite) union of open sets in B.
Example 1.1
Rn is second countable by taking B to be all open balls with rational centers and rational radii.
A map f: X → Y is continuous if for all V ⊂ Y open, f −1(V ) ⊂ X is open. A map f is a homeomorphism
if it is a continuous bijection, and f −1 is continuous. The identity map id: X → X is always continuous,
and so is any constant map.
1.2 Differentiable manifolds
Intuitively, a manifold is a topological space that is locally homeomorphic to subsets of Rn.
Definition 1.2 (manifold, chart, atlas) . M is an n-dimensional (topological) manifold if
1. M is a second countable and Hausdorff topological space.
2. For all x ∈ M, there exists an open set U ∋ x and a homeomorphism ϕ: U → V ⊂ Rn.
Note that V is open because homeomorphisms push open sets. The pair ( U, ϕ) is a chart, and a
collection of pairs is an atlas.
The open sets U in an atlas form an open cover of M. An atlas is not necessarily unique, as there can be
many open covers of a space. For Rn, there is an atlas with just one chart using the standard coordinates.
It does not make sense to say a map from M → Rn is differentiable, because M may not have a differential
structure. We work around this as follows.
Definition 1.3 (differentiable manifold). M is differentiable if for any pair of charts (U1, ϕ1) and (U2, ϕ2)
with U1 ∩ U2 = W ̸= ∅, the map
ϕ2 ◦ ϕ−1
1 : ϕ1(W ) → ϕ2(W )
is differentiable. Note that ϕ1(W ) and ϕ2(W ) are open subsets of Rn.
The map ϕ2 ◦ ϕ−1
1 is called a transition map.
Page 3 of 77


## Page 4

Smooth Manifolds September 4, 2025
We will work withsmooth manifolds where the transition maps ϕ2 ◦ϕ−1
1 are smooth (infinitely differentiable).
Given a topological manifold, the question of if there exists a differential structure (or multiple) was the
beginning of the subject of differential topology.
Definition 1.4 (smooth map) . For smooth manifolds M and N, a map F : M → N is smooth if for all
x ∈ M, there exist charts (U, ϕ) and (V, ψ) with x ∈ U and F (x) ∈ V such that ψ ◦F ◦ϕ−1: ϕ(x) → ψ(x)
is smooth.
We only need to find one pair of charts, because it will then be true for all pairs of charts by transition
functions.
Example 1.5 (smooth maps)
Letting N = R, we have smooth functions f: M → R, the set of which is denoted by C(M).
Letting M = I ⊂ R be an interval, we have smooth curves γ: I → N.
Definition 1.6 (diffeomorphism). A diffeomorphism F : M → N is a smooth bijection such that F −1 is
smooth.
Page 4 of 77


## Page 5

September 4, 2025 Smooth Manifolds
1.3 Tangent spaces
The intuition for a bump function is that it is 0 in most places and positive on an interval. For example,
start with the smooth function
f(x) =
(
e−1/x2
x if x > 0
0 if x ≤ 0
which is infinitely differentiable at 0 because the e−1/x2
term dominates any polynomial terms from the
derivatives. Reflect horizontally and translate f(x) to the right to get some function g(x), and then the
product f(x)g(x) can be taken as a bump function. Note that bump functions can not be analytic (as it
would have to be 0 everywhere), but can be smooth.
Lemma 1.7 (bump function)
Given x ∈ M and U ∋ x open, there exists a bump function u ∈ C(M) on M such that
1. u ≡ 1 in an open set containing x.
2. The support of u is contained in U.
3. 0 ≤ u ≤ 1 everywhere (i.e. the image of u is in [0 , 1]).
We can modify the example with e−1/x2
x to make it 0 on x ≤ 0, indeterminate for some time, and 1 after
some time, and extend it to Rn by rotation.
Definition 1.8 (tangent vector). A tangent vector V at p ∈ M is an R-linear map V : C(M) → R which
satisfies the Leibniz rule
V (f g) = f(p)V (g) + g(p)V (f).
This property is being a derivation. Let TpM denote the set of all tangent vectors at p.
R-linear means that V (f + g) = V (f) +V (g) and V (af) = aV (f) for all a ∈ R and f, g ∈ C(M). It is clear
TpM is an R-vector space, but we will see that it is n-dimensional when M is n-dimensional.
Example 1.9
Directional derivatives are tangent vectors in M = Rn.
There is always the zero tangent vector, and we will prove that there exists a nontrivial tangent vector.
Lemma 1.10
Suppose V ∈ TpM.
1. If u, w ∈ C(M) are equal in a neighborhood of p, then V (u) = V (w). (Locality)
2. If u is constant, then V (u) = 0.
Proof. By R-linearity, V (0) = V (0 + 0) = V (0) + V (0), so V (0) = 0.
Page 5 of 77


## Page 6

Smooth Manifolds September 9, 2025
1. Let η be a bump function with support in an open set where u = w, and η(p) = 1. Then the product
η(u − w) ≡ 0, because either u − w ≡ 0, or η ≡ 0 when u − w ̸≡ 0. Then V (η(u − w)) = 0, and applying
the Leibniz rule shows
0 = η(p)V (u − w) + (u − w)(p)V (η)
= V (u − w)
= V (u) − V (w)
because η(p) = 1 and ( u − w)(p) = 0. Thus, V (u) = V (w).
2. By the Leibniz rule,
V (1) = V (1 · 1) = 1 · V (1) + 1 · V (1),
so V (1) = 0. Then also V (c) = cV (1) = 0 for any constant function c ∈ R.
1.4 Basis theorem
Lemma 1.11
Given a derivation V on R at 0, we have for all u ∈ C(R) that
V (u) = V (x)u′(0).
In other words, V is a constant times the ordinary derivative, and that the space of derivations on R is
1-dimensional.
Proof. By Taylor expansion, we may write u(x) = u(0) + xw(x) for some w ∈ C(R). Then by R-linearity,
V (u) = V (u(0)) + V (xw) = V (xw), since u(0) is a constant function. Then by the derivation property,
V (xw) = V (x)w(0) + x(0)V (w), but x(0) = 0 so we obtain V (u) = V (x)w(0). Note that u′(0) = w(0).
What happens if V is a derivation on R at p ∈ R? An essentially identical proof works: write u(x) =
u(p) + (x − p)w(x) and apply V to obtain V (u) = (x − p)(p)V (w) + w(p)V (x − p) = w(p)V (x − p). Once
again, ∂u
∂x (p) = w(p) ∂
∂x (x − p) = w(p), so V (u) = u′(p)V (x − p).
Lemma 1.12
Generalizing to a derivation V on Rn at p ∈ Rn, we have for all u ∈ C(Rn) that
V (u) =
nX
i=1
V (xi) ∂u
∂xi
(p).
We see that ∂
∂xi
forms a basis for derivations on Rn at a point: they span by Lemma 1.12 with coefficients
V (xi), and they are linearly independent as ∂
∂xi
(xj) = δij.
We next show the existence of nonzero vector fields in TpM in general.
Definition 1.13 (coordinate system). An n-tuple of functions x1, . . . , xn ∈ C(M) is a coordinate system
at p ∈ M if there is an open set U ∋ p such that ( x1, . . . , xn): U → Rn is a diffeomorphism to an open
subset of Rn.
Page 6 of 77


## Page 7

September 9, 2025 Smooth Manifolds
Definition 1.14. Let (U, ϕ) be a chart with p ∈ U and ϕ(p) = 0, and pick a coordinate system x1, . . . , xn
of Rn. Corresponding to each xi, there is a tangent vector ∂i|p ∈ TpM defined by
∂i|p(u) := ∂(u ◦ ϕ−1)
∂xi
(0).
Note u ◦ ϕ−1 is a map Rn → R. This is a derivation of p because ∂
∂xi
is and ϕ−1(0) = p:
∂i|p(uv) = ∂(uv ◦ ϕ−1)
∂xi
(0)
= (u ◦ ϕ−1)(0) ∂(v ◦ ϕ−1)
∂xi
(0) + (v ◦ ϕ−1)(0) ∂(u ◦ ϕ−1)
∂xi
(0)
= u(p)∂i|p(v) + v(p)∂i|p(u).
Theorem 1.15 (Basis Theorem)
Any tangent vector V ∈ Tp(M) can be written as
V =
nX
i=1
V (xi)∂i|p.
In particular, dim Tp(M) = n, and ∂i|p for 1 ≤ i ≤ n form a basis of TpM as an R-vector space.
Similar to before, ∂i|p span by Theorem 1.15, and they are linearly independent as ∂i|p(xj) ≡ δij. Strictly
speaking, we need V (xiη) where η is an appropriate bump function so that things are defined, but V (xiη) =
V (xi) by locality (Lemma 1.10).
Proof (sketch). We first write a Taylor expansion
w(x) = w(0) +
nX
i=1
xiwi(x).
Page 7 of 77


## Page 8

Smooth Manifolds September 9, 2025
Let w = u ◦ ϕ−1 so that u = w ◦ ϕ. Then applying V to both sides yields
V (u) = V

w(0) +
nX
i=1
(xi ◦ ϕ)(wi ◦ ϕ)

=
nX
i=1
(wi ◦ ϕ(p))V (xi ◦ ϕ)
=
nX
i=1
wi(0)V (xi ◦ ϕ)
=
nX
i=1
V (xi ◦ ϕ) ∂w
∂xi
(0),
where the second line is by the Leibniz rule and xi ◦ ϕ(p) = xi(0) = 0.
There’s a trick for showing this Taylor expansion exists. Fix x, and define a function F (t) = w(tx). Then
F (1) − w(0) = w(x) − w(0)
=
Z 1
0
dF
dt dt
=
Z 1
0
nX
i=1
xi
∂w
∂xi
(tx) dt
=
nX
i=1
xi
Z 1
0
∂w
∂xi
(tx) dt,
so we can let wi(x) :=
R 1
0
∂w
∂xi
(tx) dt.
1.5 Differential of a map
Definition 1.16 (differential). A smooth map F : M → N induces a linear map
dFp: TpM → TF (p)N
at each p ∈ M given by dFp(V )(u) = V (u ◦ F ). The map dFp is the differential of F at p.
Page 8 of 77


## Page 9

September 9, 2025 Smooth Manifolds
Lemma 1.17
Let xi be a coordinate chart near p ∈ M and yj be a coordinate chart near F (p) ∈ N. Then
dFp(∂xi|p) =
X
j
 ∂(yj ◦ F )
∂xi
(p)

∂yj |F (p).
(It’s the usual Jacobian.)
Definition 1.18 (tangent vector of curve) . Let γ: I → N be a differentiable curve where I ⊂ R is
parameterized by s. For each p ∈ I, there is a natural tangent vector γ′(p) ∈ Tγ(p)N by defining
γ′(p)(u) := dγp(∂s)(u) = ∂(u ◦ γ)
∂s (p).
Definition 1.19 (immersion, embedding) . F is an immersion if dFp is injective for all p.
F is an embedding it if is a one-to-one immersion and a homeomorphism onto its image.
Example 1.20
The figure 8 curve in R2 is an immersion but not an embedding.
If ϕ: M → N is an immersion, then dim M ≤ dim N. The difference dim N − dim M is the codimension.
1.6 Vector fields
Definition 1.21 (vector field). A vector field V on M is a smooth choice of tangent vector V (p) ∈ TpM
for every p ∈ M. (This is saying that V is globally defined, and the coefficients V (xi) are smooth in
every chart.) Let Γ( M) denote the space of vector fields on M.
Equivalently, avector field V is a derivation V : C(M) → C(M), meaning that it is R-linear and satisfies
the Leibniz rule V (f g) = f V(g) + gV (f).
The fact that these are equivalent is pset 1.5.
Page 9 of 77


## Page 10

Smooth Manifolds September 11, 2025
Example 1.22
Let U be a chart and ∂i be a coordinate vector field on U. If η is a bump function with support inside
U, then η∂i is a vector field (that is 0 outside U).
Definition 1.23 (Lie bracket). Given two vector fields V, W ∈ Γ(M), the Lie bracket [V, W ] ∈ Γ(M) is
[V, W ](u) = V (W (u)) − W (V (u)).
Intuitively, this measures how the vector field changes? It’s clear that [V, W ] is R-linear, but it’s not obvious
that the Leibniz rule holds. It turns out that the second derivatives cancel:
[V, W ](f g) = V (W (f g)) − W (V (f g))
= V (f W(g) + gW (f)) − W (f V(g) + gV (f))
= V (f)W (g) + f V(W (g)) + V (g)W (f) + g(V (W (f))
− W (f)V (g) − f W(V (g)) − W (g)V (f) − gW (V (f))
= f

V (W (g)) − W (V (g))

+ g

V (W (f)) − W (V (f))

= f[V, W ](g) + g[V, W ](f).
Lemma 1.24
Given f ∈ C(M) and X, Y ∈ Γ(M), we have
[f X, Y] = f[X, Y ] − Y (f)X.
Proof. We have
[f X, Y](u) = f X(Y (u)) − Y (f X(u))
= f X(Y (u)) − Y (f)X(u) − f Y(X(u))
= f[X, Y ](u) − Y (f)X(u).
1.7 Tensor algebras
For a vector space V , its dual vector space is
V ∗ = {linear maps θ: V → R}.
If dim V is finite, then dim V = dim V ∗, because the only choices for an element of V ∗ are what it does to
basis elements of V . Letting vi be a basis for V , there is a dual basis θj for V ∗ given by θj(vi) = δij.
Definition 1.25 (1-form). A 1-form α is a C(M)-linear map α: Γ(M) → C(M). The set of all 1-forms
is denoted Γ ∗(M).
Equivalently (more locally), let T ∗
p M = (TpM)∗ = {linear maps TpM → R}. We can define a 1-form α
to be a smooth family of α(p) ∈ T ∗
p M as p varies.
In a chart, we have a basis ∂i for TpM, and let dxi be a dual basis for T ∗
p M. We can write
α =
nX
i=1
αidxi
Page 10 of 77


## Page 11

September 11, 2025 Smooth Manifolds
for some functions αi with αi = α(∂i). Then applying α to V = Pn
i=1 Vi∂i (Theorem 1.15), we have by
C(M)-linearity that
α(V ) =
nX
i=1
Viα(∂i) =
nX
i=1
αiVi. (1.1)
This is the basis theorem for 1-forms .
Definition 1.26 (tensor). An (r, s)-tensor A is a C(M)-multilinear map from r 1-forms α1, . . . , αr and
s vector fields V1, . . . , Vs to C(M). The set of ( r, s)-tensors is denoted by Γ r,s(M).
Example 1.27
• A (0, 1)-tensor is a map Γ( M) → C(M), which is a 1-form.
• A (1, 0)-tensor is a vector field, with V taking α to α(V ).
• A (1, 1)-tensor A locally takes V =Pn
i=1 V i∂i and α =Pn
j=1 αjdxj, so
A(V, α) = A
 nX
i=1
V i∂i,
nX
j=1
αjdxj

=
X
i,j
A(∂i, dxj)V iαj.
Let us define Aj
i := A(∂i, dxj), so
A =
X
i,j
Aj
i dxi ⊗ ∂j,
and dxi ⊗ ∂j is a “basis.”
• A (0, 2)-tensor is a map from 2 vector fields to C(M), so in a chart we get P
ij gijdxi ⊗ dxj.
• A (2, 0)-tensor is a map H =P
i,j H ij∂i ⊗ ∂j.
1.8 Traces
Definition 1.28 (trace). In a chart, the trace of a (1 , 1)-tensor B is
Tr(B) =
nX
i=1
B(∂i, dxi).
It turns out this does not depend on the chart! Let {yj} be an overlapping chart; we have
dxi =
X
j
dxi(∂yj)dyj, ∂ xi =
X
k
∂xi(yk)∂yk
by the dual basis and basis theorems. Then
X
i
B(∂xi, dxi) =
X
i,j,k
B
 ∂yk
∂xi
∂yk , dxi(∂yj)dyj

=
X
i,j,k
B(∂yk , dyj) ∂yk
∂xi
∂xi
∂yj
=
X
j
B(∂yj , dyj),
Page 11 of 77


## Page 12

Smooth Manifolds September 11, 2025
where the last equality is by the chain rule:
X
i
∂yk
∂xi
∂xi
∂yj
= ∂yk
∂yj
= δjk .
We see that the trace of a (1 , 1)-tensor gives a (0 , 0)-tensor. In general, the trace of ( r, s)-tensor gives an
(r − 1, s − 1)-tensor (but you have rs choices for which indices to trace over).
1.9 Metrics
Definition 1.29 (metric). A metric g is a (0 , 2)-tensor such that
1. g(V, W ) = g(W, V ) (symmetric).
2. g(V, V )(p) ≥ 0, with equality if and only if V (p) = 0 (positive definite).
Definition 1.30 (Riemannian manifold). A Riemannian manifold (M n, g) is a smooth manifold M n with
a metric g.
In a chart, we have g =P
i,j gijdxi ⊗ dxj, where gij = g(∂i, ∂j). At each point p, the matrix {gij(p)} must
be positive definite and symmetric ( gij = gji).
Example 1.31
Rn with metric gij = δij is Euclidean space. The identity matrix is positive definite and symmetric.
Definition 1.32 (length). We can now define the length of a curve γ: [a, b] → M by
L(γ) =
Z b
a
p
g(γ′(s), γ′(s)) ds,
where g(γ′(s), γ′(s)) is the norm of the tangent vector.
Definition 1.33 (volume). For an open set U in a chart, we can define its volume by
vol(U) =
Z
ϕ(U)
q
|det gij| dx1 · · · dxn.
1.10 Induced metrics on tensors
Metrics can measure tensors too. For V ∈ Γ(M), define |V |2 = g(V, V ). In a chart, we have
|V |2 =
X
i,j
gijV iV j.
Page 12 of 77


## Page 13

September 16, 2025 Smooth Manifolds
For α ∈ Γ∗(M), we similarly define
|α|2 =
X
i,j
gijαiαj,
where {gij} is the inverse matrix of {gij}. It turns out this is a (2 , 0)-tensor called g−1 (pset 1.4).
For a (2, 0)-tensor B, we define
|B|2 =
X
i,j,p,q
BijBpqgipgjq
which does not depend on the chart because it is the 4-time trace of the (4 , 4)-tensor B ⊗ B ⊗ g ⊗ g.
Definition 1.34 (pullback metric) . Let F : M → N be an immersion where N has a metric g. The
pullback metric F ∗g on M is given by
(F ∗g)(V, W )(p) = g(dF (V ), dF(W ))(F (p)).
1.11 Raising and lowering indices
Given a Riemannian metric g, there is a canonical 1-form αV ∈ Γ∗(M) associated to each vector field
V ∈ Γ(M) given by
αV (W ) = g(V, W ).
In local coordinates, let V =P
i V i∂xi, W =P
j W j∂xj, and g =P
k,ℓ gkℓdxk ⊗ dxℓ. Then
αV (W ) = g
X
i
V i∂xi,
X
j
W j∂xj

=
X
i,j
V iW jg(∂xi, ∂xj)
=
X
i,j
V iW jgij,
as expected. Thinking of it as a tensor contraction of V ⊗ W ⊗ g is another way to see that it is well defined.
Remark 1.35. Technically,V i and W j are not in C(M) as they are only defined locally, so it is somewhat
illegal to use the C(M)-linearity of g above. However, we can multiply them by bump functions so they
become C(M) functions, as we are working locally. For the rest of the course, we will not mention this.
On the other hand from the basis theorem for 1-forms (1.1), we have
αV (W ) =
X
j
W jαV (∂xj) =
X
j
W j(αV )j,
so
(αV )j =
X
i
gijV i.
This process is called lowering the index .
The process of raising the index takes a 1-form ((0 , 1)-tensor) to a vector field ((1 , 0)-tensor). An example
is the gradient ∇f which locally is
∇f =
X
i,j
gij ∂f
∂xi
∂xj
Page 13 of 77


## Page 14

Connections and covariant derivatives September 16, 2025
with jth coordinate
∇f j =
X
i
gij ∂f
∂xi
.
We see that the norm is preserved after raising the index:
|∇f |2 =
X
i,j
gij∇f i∇f j
=
X
i,j,ℓ,m
gij

giℓ ∂f
∂xℓ

gjm ∂f
∂xm

=
X
j,ℓ,m
δjℓ
∂f
∂xℓ
gjm ∂f
∂xm
=
X
ℓ,m
gℓm ∂f
∂xℓ
∂f
∂xm
= |d f|2 .
In general, we can go between any ( r, s)-tensors as long as r + s is kept constant. The same proof shows
that raising or lowering indices in general preserves the norm.
Example 1.36
We know that every vector field on S2 vanishes at some point (hairy ball theorem). Similarly, every
1-form must vanish at some point, because lowering the index preserves the norm.
2 Connections and covariant derivatives
2.1 Affine connections
Definition 2.1 (affine connection). An affine connection is a map ∇•(•): Γ(M) ×Γ(M) → Γ(M) sending
X, Y 7→ ∇ X Y such that
1. ∇X Y is C(M)-linear in X
2. ∇X Y is R-linear in Y
3. ∇X(f Y) = f ∇X Y + X(f)Y (Leibniz rule for Y ).
Think of it as differentiating Y with respect to X. Note that if ∇X Y were C(M)-linear in Y , then it would
be a (1 , 2)-tensor. Intuitively, multiplying Y by a function should have some Leibniz rule.
Lemma 2.2
If V ∈ Γ(M), then ∇•V is a (1 , 1)-tensor with ∇•V (W, α) := α(∇W V ).
Proof. It is C(M)-linear in W ∈ Γ(M) by definition and in α ∈ Γ∗(M) because α is C(M)-linear.
We can use the Leibniz rule to define ∇ for all tensors. Given α ∈ Γ∗(M), we want a 1-form ∇X α satisfying
X(α(V )) = (∇X α)(V ) + α(∇X V ), so we define
(∇X α)(V ) ≡ X(α(V )) − α(∇X V ).
Page 14 of 77


## Page 15

September 16, 2025 Connections and covariant derivatives
Similarly given g ∈ Γ0,2(M), we define ∇X g by
(∇X g)(V, W ) ≡ X(g(V, W )) − g(∇X V, W ) − g(V, ∇X W ). (2.1)
For B(V, α) ∈ Γ1,1(M), we define ∇X B by
(∇X B)(V, α) ≡ X(B(V, α)) − B(∇X V, α) − B(V, ∇X α).
2.2 Christoffel symbols
Definition 2.3 (Christoffel symbols). The Christoffel symbols are locally defined functions Γ k
ij satisfying
∇∂i∂j =
X
k
Γk
ij∂k.
Remark 2.4. The Γ k
ij are only locally defined and depend on the choice of coordinates. They do not
vary algebraically (i.e. via some matrix multiplication) because partials are involved.
If we know the Γ k
ij, then we can compute ∇X Y locally:
∇X Y =
X
i,j
∇X i∂i(Y j∂j)
=
X
i,j
X i∇∂i(Y j∂j)
=
X
i,j
X i[Y j∇∂i∂j + ∂i(Y j)∂j]
=
X
i,j
X i
h
Y jX
k
Γk
ij∂k + ∂i(Y j)∂j
i
.
where the second equality uses linearity in the bottom entry, and the third equality is by the Leibniz rule.
There is a dual identity with
∇∂idxj = −
X
k
Γj
ikdxk.
This follows from
(∇∂idxj)(∂k) = ∂i(dxj(∂k)) − dxj(∇∂i∂k)
= −dxj
X
ℓ
Γℓ
ik∂ℓ

=
X
ℓ
δjℓΓℓ
ik
= −Γj
ik,
where the first equality is by the Leibniz rule, and the second equality is from ∂i(Id) = 0.
2.3 Levi-Civita connection
If we impose two additional conditions on ∇X Y , there will be a canonical affine connection.
1. Metric compatibility: ∇X g = 0 for any X. Then from (2.1), X(g(Y, Z)) = g(∇X Y, Z) + g(Y, ∇X Z).
Page 15 of 77


## Page 16

Connections and covariant derivatives September 18, 2025
2. Symmetry: [ X, Y ] = ∇X Y − ∇Y X. In local coordinates, it is equivalent to Γ k
ij = Γk
ji for all i, j, k, as
0 = [∂i, ∂j]
= ∇∂i∂j − ∇∂j ∂i
=
X
k
(Γk
ij − Γk
ji)∂k.
Theorem 2.5 (Levi-Civita connection)
There exists a unique connection for each g, called the Levi-Civita connection.
From now on, let ⟨X, Y ⟩ denote g(X, Y ).
Proof. We will find a formula for ∇X Y to show uniqueness. From metric compatibility, we get
X⟨Y, Z⟩ = ⟨∇X Y, Z⟩ + ⟨Y, ∇X Z⟩ (2.2)
Y ⟨Z, X⟩ = ⟨∇Y Z, X⟩ + ⟨Z, ∇Y X⟩ (2.3)
Z⟨X, Y ⟩ = ⟨∇ZX, Y ⟩ + ⟨X, ∇ZY ⟩. (2.4)
From (2.2) + (2.3) − (2.4), we have
X⟨Y, Z⟩ + Y ⟨Z, X⟩ − Z⟨X, Y ⟩ = ⟨∇X Y, Z⟩ + ⟨Z, ∇Y X⟩ + ⟨Y, ∇X Z − ∇ZX⟩ + ⟨X, ∇Y Z − ∇ZY ⟩
= 2⟨∇X Y, Z⟩ − ⟨∇X Y, Z⟩ + ⟨∇Y X, Z⟩ + ⟨Y, [X, Z]⟩ + ⟨X, [Y, Z]⟩
= 2⟨∇X Y, Z⟩ + ⟨Z, [Y, X]⟩ + ⟨Y, [X, Z]⟩ + ⟨X, [Y, Z]⟩
so we know ⟨∇X Y, Z⟩ for all Z. As g is positive definite and in particular invertible, this uniquely determines
∇Y X.
It remains to check that this definition of ∇X Y satisfies Definition 2.1, which is pset 2.2.
2.4 Christoffel symbols in terms of the metric
Applying the formula from Theorem 2.5 with X = ∂i, Y = ∂j, Z = ∂k yields
∂igij + ∂jgik − ∂kgij = 2⟨∇∂i∂j, ∂k⟩
= 2
DX
ℓ
Γℓ
ij∂ℓ, ∂k
E
= 2
X
ℓ
Γℓ
ijgℓk.
Multiplying by gmk and summing over k, we obtain
2Γm
ij =
X
k
gmk(∂igjk + ∂jgik − ∂kgij).
Example 2.6
On Rn, Γ ≡ 0 because the metric is δij.
Page 16 of 77


## Page 17

September 18, 2025 Connections and covariant derivatives
Remark 2.7. We will begin to use the Einstein summation notation which omits the summation P
if there is an index variable appearing as an upper and a lower index. For example, we would write
2Γm
ij = gmk(∂igjk + ∂jgik − ∂kgij)
Remark 2.8. Vector fields use upper indices, 1-forms use lower indices, and tensors use an appropriate
combination of upper and lower indices. When tracing over an index, it should appear in both upper
and lower indices.
2.5 Parallel transport
Let γ be a curve with tangent vector γ′. In local coordinates, γ is given by its components γi for 1 ≤ i ≤ n.
Let
γi
s(s) = ∂γ i
∂s (s), γ ′(s) =
X
i
γi
s(s)∂i.
Let V be a vector field along the curve and write V =P
j V j(s)∂j. We want to define a derivative along
the curve by
∇γ′V ?=
X
i,j
γi
s∇∂i(V j∂j)
?=
X
i,j
γi
s(∂i(V j)∂j + V j∇∂i∂j)
?=
X
j
V j
s ∂j +
X
i,j,k
γi
sV jΓk
ij∂k.
where
V j
s (s) = d
ds V j(γ(s)).
Note V j is only defined along the curve so terms like ∇di(V j∂j) do not actually make sense, but this is the
motivation for the actual definition.
Definition 2.9 (derivative along curve) . For a curve γ and a vector field V , we define
∇γ′V =
X
j
V j
s ∂j +
X
i,j,k
γi
sV jΓk
ij∂k.
This function takes in a point on γ and outputs a tangent vector at that point.
Definition 2.10 (parallel along curve) . V is parallel along γ if ∇γ′V ≡ 0.
The parallel condition is a 1st order system of ODEs in s. Existence and uniqueness of ODEs implies that
each initial condition has a unique solution, called parallel transport along γ.
Example 2.11
On Euclidean space, parallel transport leaves the vector constant. From Γ k
ij ≡ 0, we need V j
s ≡ 0.
Page 17 of 77


## Page 18

Connections and covariant derivatives September 18, 2025
Definition 2.12 (parallel). A tensor A is parallel if ∇X A ≡ 0 for any vector field X. A parallel vector
field A = V on the entire space is also parallel along any curve γ.
Claim 2.13 — The length |V |2 is preserved under parallel transport.
Proof. By the chain rule, we have
d
ds |V |2 (γ(s)) = γ′(|V |2) = 2⟨∇γ′V, V ⟩ = 2⟨0, V ⟩ = 0.
2.6 Killing fields
Definition 2.14 (Lie derivative). For a vector field V and an (r, s)-tensor A, we define the Lie derivative
LV A, which is an ( r, s)-tensor, as follows. Let LV W = [V, W ] and LV f = V (f). Then we can define
LV on any tensor by the Leibniz rule.
For example, the Lie derivative of a Riemannian metric g is
(LV g)(X, Y ) = V ⟨X, Y ⟩ − ⟨LV X, Y ⟩ − ⟨X, LV Y ⟩
= ⟨∇V X, Y ⟩ + ⟨X, ∇V Y ⟩ − ⟨[V, X], Y ⟩ − ⟨X, [V, Y ]⟩ (metric compatibility)
= ⟨∇V X, Y ⟩ + ⟨X, ∇V Y ⟩ − ⟨∇V X − ∇X V, Y ⟩ − ⟨X, ∇V Y − ∇Y V ⟩ (symmetry)
= ⟨∇X V, Y ⟩ + ⟨X, ∇Y V ⟩.
Definition 2.15 (Killing fields). A vector field V is Killing if LV g = 0. Equivalently,
⟨∇X V, Y ⟩ + ⟨X, ∇Y V ⟩ = 0,
meaning that ⟨∇•V, •⟩ is skew.
Example 2.16 (rotation)
On (R2, δij), consider the vector field V = x1∂2 − x2∂1. Then ∇V =
 0 1
−1 0

by computing
⟨∇∂1V, ∂1⟩ = 0, ⟨∇∂2V, ∂2⟩ = 0, ⟨∇∂1V, ∂2⟩ = 1, ⟨∇∂2V, ∂1⟩ = −1,
so ∇V is skew-symmetric.
The Killing field V generates a one-parameter family of isometries (rotations) with
R(θ) =
cos θ − sin θ
sin θ cos θ

.
We have
cos θ − sin θ
sin θ cos θ
 x1
x2

=
x1 cos θ − x2 sin θ
x1 sin θ + x2 cos θ

. Taking the derivative and restricting to θ = 0
yields
∂
∂θ R(θ)
x1
x2

θ=0
=
−x1 sin θ − x2 cos θ
x1 cos θ − x2 sin θ

θ=0
=
−x2
x1

which gives V = −x2∂1 + x1∂2.
Page 18 of 77


## Page 19

September 23, 2025 Curvature
Pset 2.4 involves finding all Killing forms on Euclidean space (consider translations and rotations at least).
There will be few solutions because it is a first-order system.
3 Curvature
3.1 Riemann curvature tensor
Definition 3.1 (Riemann tensor). A Riemann tensor R is a (1, 3)-tensor with R(X, Y )Z ∈ Γ(M) defined
by
R(X, Y )Z = ∇Y ∇X Z − ∇X ∇Y Z + ∇[X,Y ]Z.
It is canonically the same as a (0 , 4)-tensor with
R(X, Y, Z, W) = ⟨R(X, Y )Z, W ⟩.
We will prove that R is a tensor. It is clear that R is R-linear in each slot, but we need to show that it is
C(M)-linear.
We apply Lemma 1.24 which states [ f X, Y] = f[X, Y ] − Y (f)X.
R(f X, Y)Z ≡ ∇ Y ∇f XZ − ∇f X∇Y Z + ∇[f X,Y ]Z
= ∇Y (f ∇X Z) − f ∇X ∇Y Z + ∇f[X,Y ]−Y (f)X(Z)
= Y (f)∇X Z + f ∇Y ∇X − f ∇X ∇Y Z + f ∇[X,Y ]Z − Y (f)∇X Z
= f ∇Y ∇X − f ∇X ∇Y Z + f ∇[X,Y ]Z
= f R(X, Y )Z.
This shows C(M)-linearity in X, and by skew-symmetry R(X, Y )Z = −R(Y, X)Z it is also C(M)-linear in
Y . Finally we check C(M)-linearity in Z:
R(X, Y )(f Z) ≡ ∇ Y ∇X(f Z) − ∇X ∇Y (f Z) + ∇[X,Y ](f Z)
= ∇Y (f ∇X Z + X(f)Z) − ∇X(Y (f)Z + f ∇Y Z) + [X, Y ](f)Z + f ∇[X,Y ]Z
= Y (f)∇X Z + f ∇Y ∇X Z + Y (X(f))Z + X(f)∇Y Z
− X(Y (f))Z − Y (f)∇X Z − f ∇X ∇Y Z − X(f)∇Y Z + [X, Y ](f)Z + f ∇[X,Y ]Z
= f ∇Y ∇X Z − f ∇X ∇Y Z + f ∇[X,Y ]Z
= f R(X, Y )Z.
The Riemann tensor has many symmetries in addition to skew-symmetry R(X, Y )Z = −R(Y, X)Z.
Lemma 3.2 (first Bianchi identity)
R(X, Y )Z + R(Y, Z)X + R(Z, X)Y = 0.
The key is showing that it equals the Jacobi identity [ Y, [X, Z]] + [X, [Z, Y ]] + [Z, [Y, X]] = 0 from pset 1.
Page 19 of 77


## Page 20

Curvature September 23, 2025
Proof.
R(X, Y )Z + R(Y, Z)X + R(Z, X)Y = ∇Y ∇X Z − ∇X ∇Y Z + ∇[X,Y ]Z
+ ∇Z∇Y X − ∇Y ∇ZX + ∇[Y,Z]X
+ ∇X ∇ZY − ∇Z∇X Y + ∇[Z,X]Y
= ∇Y [X, Z] + ∇X[Z, Y ] + ∇Z[Y, X]
+ ∇[X,Y ]Z + ∇[Y,Z]X + ∇[Z,X]Y
= [Y, [X, Z]] + [X, [Z, Y ]] + [Z, [Y, X]]
= 0
Recall that the (0 , 4)-tensor R(X, Y, Z, W) from lowering an index is given by ⟨R(X, Y )Z, W ⟩.
Lemma 3.3 (skew in last two)
R(X, Y, Z, W) = −R(X, Y, W, Z)
Proof. Using polarization, we just need to show that R(X, Y, V, V ) = 0 for all V .
R(X, Y, V, V ) = ⟨∇Y ∇X V, V ⟩ − ⟨∇X ∇Y V, V ⟩ + ⟨∇[X,Y ]V, V ⟩
=

Y ⟨∇X V, V ⟩ − ⟨∇X V, ∇Y V ⟩

−

X⟨∇Y V, V ⟩ − ⟨∇Y V, ∇X V ⟩

+ 1
2[X, Y ]⟨V, V ⟩
= 1
2 Y X ⟨V, V ⟩ − 1
2 XY ⟨V, V ⟩ + 1
2[X, Y ]⟨V, V ⟩
= 0
where we use metric compatibility.
Lemma 3.4 (symmetry in pairs)
R(X, Y, Z, W) = R(Z, W, X, Y).
Proof. Using the first Bianchi identity, we have
0 = R(X, Y, Z, W) + R(Y, Z, X, W) + R(Z, X, Y, W) (3.1)
0 = R(X, Z, W, Y) + R(Z, W, X, Y) + R(W, X, Z, Y) (3.2)
0 = R(X, Y, W, Z) + R(Y, W, X, Z) + R(W, X, Y, Z) (3.3)
0 = R(Y, Z, W, X) + R(Z, W, Y, X) + R(W, Y, Z, X). (3.4)
Taking (3.1) - (3.3) and using Lemma 3.3, we get
0 = 2R(X, Y, Z, W) + R(Y, Z, X, W) + R(Z, X, Y, W) − R(Y, W, X, Z) − R(W, X, Y, Z).
Taking (3.2) - (3.4) and using Lemma 3.3, we get
0 = 2R(Z, W, X, Y) + R(X, Z, W, Y) + R(W, X, Z, Y) − R(Y, Z, W, X) − R(W, Y, Z, X).
The colored terms match up, so the remaining terms 2 R(X, Y, Z, W) and 2 R(Z, W, X, Y) are equal.
We did the only thing that we could do to prove these identities.
Page 20 of 77


## Page 21

September 23, 2025 Curvature
Lemma 3.5 (second Bianchi identity)
(∇X R)(Y, Z)W + (∇Y R)(Z, X)W + (∇ZR)(X, Y )W = 0.
Recall ∇X R is defined by the Leibniz rule:
(∇X R)(Y, Z)W = ∇X(R(Y, Z)W ) − R(∇X Y, Z) − R(Y, ∇X Z)W − R(Y, Z)∇X W.
3.2 Ricci curvature
Definition 3.6 (Ricci tensor) . The Ricci tensor is a (0 , 2)-tensor from tracing R in an orthonormal
frame:
Ric(X, Y ) =
nX
i=1
R(X, ei, Y, ei)
where ⟨ei, ej⟩ = δij.
There are three possible ways to trace, but R(X, Y, ei, ei) gives 0, and R(X, ei, ei, Y ) is the negative. Note
Ric(X, Y ) = Ric(Y, X) by symmetry in pairs (Lemma 3.4).
Definition 3.7 (Einstein). A manifold is Einstein if Ric = λg for a constant λ ∈ R.
We say Ric ≥ λ for λ ∈ R if Ric(V, V ) ≥ λ |V |2. Ric ≥ 0 is a common condition.
Example 3.8
Euclidean space is Einstein because R = 0 so Ric = 0.
Definition 3.9 (scalar curvature). Tracing the Ricci tensor gives the scalar curvature S ∈ C(M) defined
by
S =
nX
i=1
Ric(ei, ei)
where ei is an orthonormal frame.
In a general frame, S =Pn
i,k=1
Pn
j=1 gij Ricjk (raise an index and then trace, because we can’t directly
trace a (0 , 2)-tensor).
Definition 3.10 (sectional curvature). Given orthonormal vectors V, W , the sectional curvature is
KV W = R(V, W, V, W).
Lemma 3.11 (Schur)
dS = 2 div(Ric)
∇ Ric is (0, 3)-tensor, which we raise to get (1 , 2)-tensor, and then trace to get a (0 , 1)-tensor, i.e. a 1-form.
Page 21 of 77


## Page 22

Submanifolds September 25, 2025
In an orthonormal frame,
div(Ric)(V ) =
nX
i=1
(∇ei Ric)(ei, V )
=
nX
i=1

ei Ric(ei, V ) − Ric(∇eiei, V ) − Ric(ei, ∇eiV

=
nX
i,j=1

eiR(ei, ej, V, ej) − R(∇eiei, ej, V, ej) − R(ei, ej, ∇eiV, ej)

=
nX
i,j=1

(∇eiR)(ei, ej, V, ej) + R(ei, ∇eiej, V, ej) + R(ei, ej, V, ∇eiej)

2nd Bianchi says that ( ∇eiR)(ei, ej) + (∇eiR)(ej, ei) + (∇ej R)(ei, ei) = 0.
4 Submanifolds
A circle in Euclidean space of radius R has curvature 1
R.
Definition 4.1 (geodesic curvature) . The geodesic curvature is kg(p) = ± 1
R where the ± is depending
on whether the circle is inside or outside.
The intrinsic curvature of a curve viewed as a manifold is 0, but the extrinsic curvature when viewed as a
submanifold is more interesting.
4.1 Induced structure on submanifolds
Consider an immersion F : M m ,→ N n, which means dF is injective and m ≤ n.
Page 22 of 77


## Page 23

September 25, 2025 Submanifolds
At each point p ∈ F (M), we view TpM as a subspace of TpN and write
TpN = (TpM) ⊕ (TpM)⊥.
In particular, any V can be written as
V = V ⊤ + V ⊥
where V ⊤ ∈ TpM is the tangential part and V ⊥ ∈ (TpM)⊥ is the normal part.
The structure of N induces various structures on M. For now think of F as the identity map, but these
definitions can be modified for any immersion F .
• Induced metric : gN induces a metric gM on M with
gM(V, W ) ≡ gN(dF (V ), dF(V )).
It also induces a metric on ( TpM)⊥.
• Induced connections : An affine connection ∇ on N induces an affine connection ∇ on M by
∇V W ≡ (∇V W )⊤
for V, W vector fields tangent to M. To check that it is a connection, we first see that it is C(M)-linear
in the lower entry. Also for f ∈ C(M), we have
∇V (f W) = (∇V (f W))⊤
= (f ∇V W + V (f)W )⊤
= f(∇V W )⊤ + V (f)W.
• Induced connection on normal bundle : If X normal vector field (i.e. a vector field that is per-
pendicular at each point to TpM) and V is a tangent vector field, then we can define
∇
⊥
V X ≡ (∇V X)⊥.
The normal part that we throw away in the induced connection is called the second fundamental form.
Definition 4.2 (second fundamental form) . The second fundamental form is A(V, W ) = ( ∇V W )⊥ for
tangent vector fields V, W .
A is in Γ 0,2(M) ⊗ Γ(T M⊥) as it takes in two tangent vector fields and outputs a normal vector field.
Page 23 of 77


## Page 24

Submanifolds September 25, 2025
Example 4.3 (S1 ,→ R2)
Consider the embedding S1 ,→ R2. Then
∇θ(cos θ, sin θ) = (− sin θ, cos θ).
Since the Levi-Civita connection on R2 is the directional derivative, we have
∇∂θ ∂θ = (− cos θ, − sin θ)
which is purely normal and equal to ( ∇∂θ ∂θ)⊥. Then ( ∇∂θ ∂θ)⊤ = 0 and
A(∂θ, ∂θ) = (− cos θ, − sin θ),
so the second fundamental form is the inward-pointing vector.
For general V = f(θ)∂θ, we have ∇∂θ(f(θ)∂θ) = f ′(θ)∂θ.
Proposition 4.4
The second fundamental form is symmetric: A(V, W ) = A(W, V ). (In the two tangent slots, although
it also has a normal slot.)
Proof. We have
A(V, W ) − A(W, V ) = (∇V W )⊥ − (∇W V )⊥
= (∇V W − ∇W V )⊥
= ([V, W ])⊥
= 0
where the last equation is by the general fact that if V, W are tangent to M then so is [ V, W ]. To show
this, work in a local coordinate chart and choose coordinates ( x1, . . . , xn) on N such that M is given by
{xm+1 = · · · = xn = 0}. We can do this by implicit function theorem.
Page 24 of 77


## Page 25

September 25, 2025 Submanifolds
Then V =Pm
i=1 V i∂i and W =Pm
j=1 W j∂j are linear combinations of only ∂1, . . . , ∂m. We compute
V (W (u)) =
X
i,j
V i∂i(W juj) =
X
i,j
V i(∂iW j)uj + V iW juji
W (V (u)) =
X
i,j
W j∂j(V iui) =
X
i,j
W j(∂jV i)ui + V iW juji
[V, W ](u) =
X
i,j
V i(∂iW j)uj − W j(∂jV i)ui.
(Here ui = ∂
∂xi
u.) Note that the uji terms cancel, and we are left with just a linear combination of∂1, . . . , ∂m,
implying that [ V, W ] is tangent to M.
Since A is symmetric, all eigenvalues are real and are called principal curvatures. The sum of all principal
curvatures is the mean curvature.
Definition 4.5 (mean curvature). The mean curvature is the trace Tr A = ⃗H.
If ⃗H = ⃗0 then it is called minimal.
4.2 Gauss equation
Lemma 4.6 (Gauss equation)
Let M ⊂ N be a submanifold, and let R and R be Riemann curvature tensors on M and N. Then for
any vector fields W, X, Y, Z tangent to M, we have
R(X, Y, Z, W) = R(X, Y, Z, W) + ⟨A(X, Z), A(Y, W )⟩ − ⟨A(Y, Z), A(X, W)⟩.
This is saying that the curvature is determined by the curvature R in ambient space and how M sits in the
ambient space via A.
Proof.
R(X, Y, Z, W) = ⟨W, ∇⊤
Y (∇⊤
X Z) − ∇⊤
X(∇⊤
Y Z) + ∇⊤
[X,Y ]Z⟩
= ⟨W, ∇Y (∇⊤
X Z) − ∇X(∇⊤
Y Z) + ∇[X,Y ]Z⟩
= ⟨W, ∇Y (∇X Z − A(X, Z)) − ∇X(∇Y Z − A(Y, Z)) + ∇[X,Y ]Z⟩
= R(X, Y, Z, W) − ⟨W, ∇Y A(X, Z)⟩ + ⟨W, ∇X A(Y, Z)⟩
= R(X, Y, Z, W) + ⟨∇Y W, A(X, Z)⟩ − ⟨∇X W, A(Y, Z)⟩
= R(X, Y, Z, W) + ⟨∇⊥
Y W, A(X, Z)⟩ − ⟨∇⊥
X W, A(Y, Z)⟩
= R(X, Y, Z, W) + ⟨A(Y, W ), A(X, Z)⟩ + ⟨A(X, W), A(Y, Z)⟩.
Since W is tangential, we can get rid of the ⊤’s in the second equation. We use metric compatibility in the
fifth equation and add back the ⊥’s in the sixth equation because A(•, •) is normal.
Page 25 of 77


## Page 26

Submanifolds September 30, 2025
Example 4.7
Consider Sn ,→ Rn+1 where Sn = {|⃗ x|2 = 1}. If V, W are tangent vectors to Sn, then at the point x we
have
A(V, W ) = ⟨∇V W, ⃗ x⟩⃗ x= −⟨W, ∇V ⃗ x⟩⃗ x
because A(V, W ) is the normal part of ∇V W . The second equation is by metric compatibility because
⟨W, ⃗ x⟩ = 0.
The Euclidean space miracle is that ∇V ⃗ x= V for any vector V . For example in R2, taking the derivative
of the vector field ( x, y) with respect to ( a, b) gives
∇(a,b)(x, y) = (∂(a,b)x, ∂(a,b)y)
= (a∂xx + b∂yx, a∂xy + b∂yy)
= (a, b)
since ∂xx = ∂yy = 1, ∂yx = ∂xy = 1.
So from the above, we have
A(V, W ) = −⟨W, V ⟩⃗ x.
Now by Gauss’s equation, we have
R(X, Y, Z, W) = ⟨X, Z⟩⟨Y, W ⟩ − ⟨Y, Z⟩⟨X, W ⟩.
If V, W are orthonormal, then the sectional curvature is constant and equal to 1:
KV W = R(V, W, V, W) = ⟨V, V ⟩⟨W, W⟩ − ⟨W, V ⟩⟨V, W ⟩ = 1 · 1 − 0 · 0 = 1.
Then Ric = (n − 1)g which is Einstein, and S = n(n − 1).
4.3 Codazzi equation
Lemma 4.8 (Codazzi)
If U, V, W ∈ Γ(M), then
(R(U, V )W )⊥ = (∇V A)(U, W) − (∇U A)(V, W ).
Proof. The LHS is
(R(U, V )W )⊥ = ∇⊥
V ∇U W − ∇⊥
U ∇V W + ∇⊥
[U,V ]W
= ∇⊥
V (∇U W + A(U, W)) − ∇⊥
U(∇V W + A(V, W )) + A([U, V ], W)
= A(V, ∇U W ) + ∇⊥
V (A(U, W)) − A(U, ∇V W ) − ∇⊥
U(A(V, W )) + A([U, V ], W)
For the RHS, we use the Leibniz rule:
(∇V A)(U, W) = ∇V (A(U, W)) − A(∇V U, W) − A(U, ∇V W )
= ∇
⊥
V (A(U, W)) − A(∇V U, W) − A(U, ∇V W )
(∇U A)(V, W ) = ∇
⊥
U(A(V, W )) − A(∇U V, W ) − A(V, ∇U W ).
They are equal, noting that A([U, V ], W) = A(∇U V, W ) − A(∇V U, W) by symmetry (Section 2.3).
Page 26 of 77


## Page 27

September 30, 2025 Submanifolds
The Codazzi equation is the most useful when the LHS is zero, such as when R = 0 in Euclidean space Rn.
Then
(∇V A)(U, W) = (∇U A)(V, W )
and ∇A is fully symmetric in U, V, W.
Example 4.9
Let Ω be an open subset of R2 and consider the graph of u ∈ C(R2)
Ω′ = {(x, y, u(x, y)) : (x, y) ∈ Ω}.
For example, the upper hemisphere is u =
p
1 − x2 − y2.
On R2, we have local coordinate vector fields ∂x, ∂y (actually global in this case). The induced metric
from this immersion is
gxx = g(∂x, ∂x) = ⟨dF (∂x), dF(∂x)⟩ = 1 + u2
x
because dF (∂x) = (1, 0, ux). Similarly dF (∂y) = (0, 1, uy) so
gxy = uxuy
gyy = 1 + u2
y.
The unit normal vector is a unit vector perpendicular to dF (∂x) and dF (∂y), so it is
⃗ n= (−ux, −uy, 1)q
1 + u2x + u2y
.
Example 4.10
Intuitively, a path in R2 with this metric has the same length as if we were going along the surface of
the sphere. Going from (0 , 0) to (0 , 1) should have length π
2 .
Consider the curve γ(s) = (0, s) in R2. Since γ′ = (0, 1) = ∂y, we have
γ′2 = gyy = 1 + u2
y(0, s)
Since u =
p
1 − x2 − y2,
uy = −yp
1 − x2 − y2
=⇒ 1 + u2
y = 1 − x2
1 − x2 − y2 .
At (x, y) = (0, s), we have
γ′2 (s) = 1
1 − s2
so the arc length is
L(γ) =
Z 1
0
1√
1 − s2 ds = arcsin s

1
0
= π
2 .
There are two ways to find the Levi-Civita connection for this g. The first way is to compute Γ m
ij from the
Page 27 of 77


## Page 28

Submanifolds September 30, 2025
formula 2Γm
ij =P
k gmk(∂igjk + ∂jgik − ∂kgij). The second is using submanifold geometry:
∇FxFx = ∇Fx((1, 0, ux)) = (0, 0, uxx)
since Fx is just moving in the x direction, and the second equality is by the chain rule. Then
(∇FxFx)⊥ = (0, 0, uxx)⊥
= ⟨(0, 0, uxx), ⃗ n⟩⃗ n
=
*
(0, 0, uxx), (−ux, −uy, 1)q
1 + u2x + u2y
+
⃗ n
= uxxq
1 + u2x + u2y
⃗ n
so we can compute the induced Levi-Civita connection ∇FxFx = (∇FxFx)⊤.
4.4 Umbilic submanifolds
Assume there is a unit normal ⃗ n(existing locally). The shape operator S: TpM → TpM is defined by
⟨S(V ), W ⟩ := ⟨A(V, W ), ⃗ n⟩
= ⟨∇V W, ⃗ n⟩
= V ⟨W, ⃗ n⟩ − ⟨W, ∇V ⃗ n⟩ (metric compatibility)
= −⟨W, ∇V ⃗ n⟩,
where the last equation is because W is ⊤ and ⃗ nis ⊥. The RHS is some number because A(V, W ) and ⃗ n
are both normal. Note that ⟨∇V ⃗ n, ⃗ n⟩ = 1
2 V ⟨⃗ n, ⃗ n⟩ = 0.
In particular if S ≡ 0, then ⃗ nis constant.
Corollary 4.11
Let M be a sub- n-manifold of Rn+1. If A ≡ 0 and M is connected, then M is a hyperplane.
Proof. Taking p ∈ M, there is a neighborhood around p where ⃗ nis defined. Choose coordinates such that
⃗ n(p) = ∂n+1 and xn+1(p) = 0 (rotate and translate). We claim that M ⊆ {xn+1 = 0} which implies equality.
The set M ∩ {xn+1 = 0 } is automatically closed (because xn+1 is continuous) and nonempty (as p is in
there). By connectedness, it remains to show that is is also open.
Take a curve γ in M with γ(0) = p. Let
f(s) = ⟨⃗ n(γ(s)), ∂n+1⟩.
so f(0) = 1. By the chain rule,
f ′(s) = γ′⟨⃗ n(γ(s)), ∂n+1⟩
= ⟨∇γ′⃗ n, ∂n+1⟩
= ⟨∇⊤
γ′⃗ n, ∂n+1⟩ + ⟨∇⊥
γ′⃗ n, ∂n+1⟩
= ⟨∇γ′⃗ n, ∂⊤
n+1⟩ + 0
= −⟨⃗ n,∇γ′∂⊤
n+1⟩ (metric compatibility)
= −⟨⃗ n, A(γ′, ∂⊤
n+1)⟩
= 0. (A ≡ 0)
Note in the fourth equation that ∇⊥
γ′⃗ n= 0 because ⟨∇γ′⃗ n, ⃗ n⟩ = 0.
Page 28 of 77


## Page 29

October 2, 2025 Submanifolds
S: TpM → TpM is a (1 , 1)-tensor that is “symmetric”, meaning
⟨S(V ), W ⟩ = ⟨S(W ), V ⟩.
Thus it has real eigenvalues λ1, . . . , λn which we call the principal curvatures.
Definition 4.12 (umbilic). An n-manifold M is umbilic if λ1 = · · · = λn at every point.
In other words, S is multiplication by a constant at each point, but not necessarily the same constant.
Example 4.13
Rn and Sn are umbilic. It turns out that these are the only two examples.
Proposition 4.14
Umbilic implies flat in Rn for n ≥ 3.
Proof. Since S is scalar multiplication (a diagonal matrix with the same entry along the diagonal), we can
locally find a function f such that S(V ) = f V. Then
f ⟨V, W ⟩ = ⟨S(V ), W ⟩ = ⟨⃗ n, A(V, W )⟩.
We compute the divergence
div(S) = Tr(∇•S)
which is a (0 , 1)-tensor (i.e. 1-form) because S is a (1 , 1)-tensor and the covariant derivative ∇•S is a
(1, 2)-tensor.
Let S =P
i,j Si
j∂i ⊗ dxj and ∇•S =P
i,j,k Si
j,k(∂i ⊗ dxj ⊗ dxk) where we write Si
j,k for (∇•S)i
j,k. Then
Si
j,k = (∇∂k S)(dxi, ∂j)
= ∂k(S(dxi, ∂j)) − S(∇∂k dxi, ∂j) − S(dxi, ∇∂k ∂j). (Leibniz rule)
To compute S(dxi, ∂j), we use
X
i
Si
jgiℓ =
DX
i
Si
j∂i, ∂ℓ
E
= ⟨S(∂j), ∂ℓ⟩ = ⟨Ajℓ, ⃗ n⟩.
Now multiply both sides by gℓk and sum over ℓ to get
X
ℓ
gℓk⟨Ajℓ, ⃗ n⟩ =
X
i,ℓ
gℓkSi
jgiℓ
=
X
i
δikSi
j
= Sk
j ,
so
S(dxi, ∂j) = Sj
i =
X
ℓ
gℓj⟨Aiℓ, ⃗ n⟩.
Taking ∂k, some terms cancel with S(∇∂k dxi, ∂j) and S(dxi, ∇∂k ∂j), and we end up with
Si
j,k =
X
ℓ
gℓi⟨Ajℓ,k , ⃗ n⟩.
Page 29 of 77


## Page 30

Geodesics October 2, 2025
Ajℓ,k is fully symmetric in j, ℓ, k by the Codazzi equation.
We now compute div(S)(V ) in two ways. On one hand,
div(S)(V ) =
X
i,j
Si
j,iV j
=
X
i
(∇eiS(ei))(V ) − S(∇eiei)(V )
=
X
i
(∇ei(f ei))(V ) − f(∇eiei)(V )
=
X
i
(∇eif)ei(V )
= V (f).
On the other hand,
div(S)(V ) =
X
i
(∇V S)(ei)(ei)
=
X
i
(∇V (f ei) − f ∇V ei)(ei)
=
X
i
V (f)⟨ei, ei⟩
= (n − 1)V (f).
Assuming n > 2, this means V (f) = 0 for all V , and f is constant. There are two possibilities:
• If f ≡ 0, then A ≡ 0 which implies A is flat.
• If f ≡ λ for λ ̸= 0, then define a map ϕ: Σ → Rn by
ϕ(x) = x + 1
λ⃗ n(x).
For any tangent vector V , we have
V (ϕ) = ∇V X + 1
λ ∇V ⃗ n= V − 1
λ S(V ) = 0
from assuming S(V ) = λV . This implies ϕ is constant, there is some fixed point p = ϕ(x) for all x.
Then Σ has to be contained in the ( n − 1)-sphere with radius 1
|λ| and center p.
5 Geodesics
5.1 Geodesic definition
Definition 5.1 (geodesic). A curve γ: [a, b] → M is a geodesic if ∇γ′γ′ = 0.
Corollary 5.2
The length |γ′| is constant.
Page 30 of 77


## Page 31

October 2, 2025 Geodesics
Proof. The derivative of |γ′|2 is
d
dt
γ′2 = 2⟨∇γ′γ′, γ′⟩ = 2⟨0, γ′⟩ = 0.
Locally, write γ(t) = (γi(t))1≤i≤n so that γ′ =P
i γi
t∂i (where γi
t = d
dt γi). Then
∇γ′γ′ =
X
i,j
γi
t∇∂i(γj
t ∂j)
=
X
i,j
γi
t(∂i(γj
t )∂j + γj
t ∇∂i∂j)
=
X
j
γj
tt∂j +
X
i,j,k
γi
tγj
t Γk
ij∂k,
which must equal 0 for a geodesic.
Example 5.3
In Euclidean space, we need γj
tt = 0 for all j, so the geodesics γ are straight lines parameterized at
constant speeds.
In general, a geodesic is a second order system. Being given an initial position and velocity determines the
geodesic.
Consider a curve γ in M which is a submanifold of N. Then
0 = ∇⊤
γ′γ′
= ∇γ′γ′ − ∇⊥
γ′γ′
so
∇γ′γ′ = A(γ′, γ′).
Example 5.4
Let M = Sn be the unit sphere, so A(γ′, γ′) = − |γ′|2 γ. Spherical geodesics have to satisfy γtt = − |γt|2 γ
where |γt| is constant by Corollary 5.2. If |γt| = 1 (unit speed), then each component of γ has γj
tt = −γj,
and the functions that satisfy this are sin and cos. Geodesics in Sn are great circles (see pset).
5.2 Exponential map
Given p ∈ M, we define a map exp p: TpM → M with exp p(0) = p as follows. Let γ(p, V, t) be the geodesic
with
γ(p, V, 0) = p, γ t(p, V, 0) = V.
By existence and uniqueness of ODEs, this is defined for |t| ≤ C for some constant C. Note for a > 0 that
γ(p, V, at) = γ(p, aV, t)
if γ(t) is a geodesic, then σ(t) := γ(at) is also a geodesic (drawing γ at a faster speed). Alternatively from
the original equation, we see ∇aγ′aγ′ = a2∇γ′γ′ = 0.
Definition 5.5. The map exp p: TpM → M is defined by exp p(V ) = γ(p, V, 1).
Page 31 of 77


## Page 32

Geodesics October 7, 2025
Example 5.6
In Rn, the geodesic is γ(p, V, t) = p + tV , and the exponential map is exp p(V ) = p + V .
Given initial conditions γ(0) = p and γ′(0) = V ∈ TpM, we get γ: [0, t0] → M. We call γ by γp,V to show
the initial conditions.
Given V , a solution γp,V exists up to some time t0. Using γp,V (at) = γp,aV (t) and setting a = t0, then
γp,aV (1) is defined. For |V | < δ fixed, expp(V ) is defined.
We determine the differential ( d expp)V of the exponent map. Since the tangent space of TpM is itself, the
map expp: TpM → M induces
(d expp)V : TpM → Texpp(V )M.
We first consider V = 0, so ( d expp)0 is a map TpM → TpM.
Lemma 5.7
(d expp)0 = Id.
Proof. Let α be a curve with α(s) = sV . Consider σ: [0, 1] → M given by σ(s) = exp p(sV ) = γp,sV (1) =
γp,V (s). By the chain rule, we have
σ′(0) = (d expp)0(dα(∂s)) = (d expp)0(V ).
Also explicitly, σ′(0) = γ′
p,V (0) = V , so ( d expp)0(V ) = V .
The inverse function theorem implies exp p is a diffeomorphism in some ball Bδ(0), called a normal neigh-
borhood. For a set U ⊂ M, a totally normal neighborhood is a ball Bδ′(0) in which exp q is a diffeomorphism
for all q ∈ U.
Page 32 of 77


## Page 33

October 7, 2025 Geodesics
5.3 Gauss lemma
Definition 5.8. For V, W ∈ TpM perpendicular, define F : R2 → M by
F (s, t) = expp(t(V + sW )).
When only t varies, it is a geodesic. When only s varies, it traces out different geodesics. There are two
nice vector fields along the image, namely Fs = dF (∂s) and Ft = dF (∂t).
By the chain rule (the s derivative of t(V + sW ) is tW , and the t derivative is V + sW ),
Fs(s, t) = (d expp)t(V +sW )(tW )
Ft(s, t) = (d expp)t(V +sW )(V + sW ).
At t = 0, (d expp)0 = Id so
Fs(s, 0) = Id(0W ) = 0
Ft(s, 0) = Id(V + sW ) = V + sW.
Lemma 5.9 (Gauss)
(a) |Ft(s, t)|2 = |V |2 + s2 |W |2 =
(d expp)t(V +sW )(V + sW )
2.
(b) ⟨Fs(0, t), Ft(0, t)⟩ = 0 = ⟨(d expp)tV (V ), (d expp)tV (W )⟩.
Proof. We can check that (a) is true for t = 0 by using Ft(s, 0) = V + sW , and cross terms disappear
because V, W orthogonal. Also (b) is true from Fs(0, 0) = 0. Now we consider the derivatives of both sides.
We use these facts:
(i) [ Fs, Ft] = 0 because it equals dF ([∂s, ∂t]) = dF (0) = 0.
(ii) ∇Ft(Ft) = 0 for any ( s, t) because the image of Ft is a geodesic.
(iii) As a consequence of (ii), ∂t |Ft|2 = 0 for any geodesic (Corollary 5.2).
Now (a) is obvious from (iii). To prove (b), We know ⟨Fs, Ft⟩ = 0 at t = 0. Differentiating, we get
dF (∂t⟨Fs, Ft⟩) = Ft(⟨Fs, Ft⟩)
= ⟨∇FtFs, Ft⟩ + ⟨Fs, ∇FtFt⟩ (metric compatibility)
= ⟨∇FtFs, Ft⟩
= ⟨∇FsFt, Ft⟩ (using (i))
= 1
2 ∂s |Ft|2
= s |W |2 (using (a))
= 0, (s = 0)
Page 33 of 77


## Page 34

Geodesics October 7, 2025
as desired.
Corollary 5.10
Given any vector fields Z, X ∈ TpM, we decompose Z as the part Y = ⟨Z,X⟩
⟨X,X⟩ X along X, and the normal
part Z − Y . Then
(d expp)X(Z)
2 =
(d expp)X(Y )
2 +
(d expp)X(Z − Y )
2
= |Y |2 +
(d expp)X(Z − Y )
2 .
We can make the radial part V and the angular part W , and then apply Gauss.
5.4 Riemannian distance
Definition 5.11 (Riemannian distance). For points p, q ∈ M connected, define
d(p, q) = inf
γ
L(γ)
as γ ranges over curves from p to q that are piecewise smooth (finitely many breaks).
To check this is a metric, we need to check that it is
• Symmetric: d(p, q) = d(q, p).
• Positive definite: d(p, q) ≥ 0 with equality if and only if p = q.
• Triangle inequality: d(x, z) ≤ d(x, y) + d(y, z).
Symmetric follows by going along the curve backwards. The triangle inequality follows from pasting two
curves together. Positive definiteness is not obvious–although each curve has positive length, there could be
curves with length converging to 0.
We want to find a positive lower bound for L(γ) for γ: p → q with p ̸= q. By the Hausdorff condition,
there exists some open neighborhood Ω of p not containing q. There exists some δ such that exp p is a
diffeomorphism in Bδ(0), and the image exp p(∂Bδ(0)) is contained in Ω and isomorphic to Sn−1. Note
q /∈ expp(Bδ(0)). If γ is any curve from p to q, it must pass through exp p(∂Bδ(0)).
Page 34 of 77


## Page 35

October 9, 2025 Geodesics
Lemma 5.12
Suppose that exp p is a diffeomorphism on Bδ(0). Let 0 < r1 < r2 ≤ δ and σ be a curve in TpM. Given
that σ(0) ∈ ∂Br1(0), σ(1) ∈ ∂Br2(0) and σ ⊂ Br2(0) \ Br1(0) then L(expp(σ)) ≥ r2 − r1.
Equality holds if and only if σ is a monotone ray, meaningσ/|σ| is a constant vector and |σ| is monotone.
The first part of the lemma implies δ is a lower bound. Later we’ll see why monotone ray part is useful.
Proof. For Z, X ∈ TpM, we decompose Z as the part Y := ⟨Z,X⟩
⟨X,X⟩ X along X, and the normal part Z − Y .
As in Corollary 5.10, we have by the Gauss lemma on Y and Z − Y that
(d expp)X(Z)
2 =
(d expp)X(Y )
2 +
(d expp)X(Z − Y )
2
= |Y |2 +
(d expp)X(Z − Y )
2
= ⟨Z, X⟩2
|X|2 +
(d expp)X(Z − Y )
2
≥ ⟨Z, X⟩2
|X|2
with equality if and only if ( d expp)X(Z − Y ) = 0, or Z = Y if expp is a diffeomorphism. The first equation
is by Gauss lemma (b) which says the cross term is 0, and the second equation is by Gauss lemma (a).
Let γ = expp(σ). Applying the above inequality to Z = σ′ and X = σ, we obtain
γ′2 =
(d expp)σ(t)(σ′)
2
≥ ⟨σ′, σ⟩2
|σ|2
Page 35 of 77


## Page 36

Geodesics October 9, 2025
with equality if and only if σ′ = ⟨σ′,σ⟩
|σ|2 σ. Integrating yields
L(γ) =
Z b
a
γ′ (t) dt
≥
Z b
a
|⟨σ′, σ⟩|
|σ| (t) dt
=
Z b
a

d
dt |σ|
 dt
≥
Z b
a
d
dt |σ| dt
= |σ| (b) − |σ| (a)
= r2 − r1
The third line is by
2 |σ| |σ|′ = d
dt |σ(t)|2 = 2⟨σ′, σ⟩,
so |σ|′ = ⟨σ′,σ⟩
|σ| . (As a concrete example, we can compute the derivative of |x|.)
The second inequality is sharp if and only if σ is monotonic. The first inequality is sharp if and only if
σ′ = ⟨σ′,σ⟩
|σ|2 σ, which we claim is equivalent to σ
|σ| constant. Geometrically, it’s clear you should stay along
the ray from that equation if it’s a multiple of the ray pointing to the origin. Algebraically,
 σ
|σ|
′
= σ′
|σ| − σ |σ|′
|σ|2 =
|σ| σ′ − σ ⟨σ′,σ⟩
|σ|
|σ|2 = |σ|2 σ′ − σ⟨σ′, σ⟩
|σ|3 = 0
using σ′ = aσ for a ∈ R.
Definition 5.13. A curve γ: [a, b] → M is (length) minimizing if L(γ) = d(γ(a), γ(b)).
It is not necessarily unique, e.g. on a sphere between two antipodal points. It also may not exist, e.g. on a
disk missing a point.
Corollary 5.14 (of Lemma 5.12)
If γ is length minimizing, then we can (monotonically) reparameterize γ such that it is a geodesic.
Proof. We know that any subcurve of γ is also minimizing, and that γ is monotone. Reparameterize γ such
that the speed |γ′| = 1 is constant, which is still length minimizing because reparameterizing doesn’t change
the length.
Page 36 of 77


## Page 37

October 9, 2025 Geodesics
By compactness, we can cover γ by a finite collection of totally normal neighborhoods. In each totally
normal neighborhood (centered at p), the inverse image of γ in expp must be a monotone ray, so γ must be
a monotone geodesic ray. (We are using the fact that in a normal neighborhood, a length minimizing curve
is a geodesic.) In the regions where two geodesics overlap, it is the same curve and with the same speed, so
γ is a geodesic.
5.5 Hopf–Rinow theorem
Theorem 5.15 (Hopf–Rinow)
Let M be a connected manifold with Riemannian distance d. TFAE:
1. There exists p ∈ M such that exp p is defined on all of TpM.
2. Any subset of M that is closed and bounded is also compact.
3. ( M, d) is complete (every Cauchy sequence converges).
4. M is geodesically complete (for all p ∈ M, expp is defined on all of TpM).
Any of these imply that for all p, q ∈ M there exists a length minimizing geodesic γ from p to q.
Lemma 5.16
Let x ∈ M such that exp x is a diffeomorphism on Bδ′(0) for δ′ > δ. For y /∈ Bδ(x),
1. There exists z ∈ ∂Bδ(x) such that d(z, y) = inf w∈∂Bδ(x) d(w, y).
2. Any such z satisfies d(x, y) = d(x, z) + d(z, y) = δ + d(z, y).
Proof. 1. ∂Bδ(x) = exp x(∂Bδ(0)) is the image of a sphere so it is compact. The distance function is
Lipschitz by the triangle inequality and has a minimum on the compact set ∂Bδ(x).
2. The fact that d(x, z) = δ for z ∈ ∂Bδ(x) is by the Gauss lemma. For the first equality, the ≤ direction
is by the triangle inequality. For the ≥ direction, any curve γ from x to y must hit the boundary
∂Bδ(x), say at z′. Then L(γ) ≥ d(x, z′) + d(z′, y) ≥ δ + d(z, y). Taking the infimum over all γ yields
d(x, y) ≥ δ + d(y, z).
Proposition 5.17
Condition 1 in Theorem 5.15 implies for all q that there exists a minimizing geodesic γ from p to q.
This implies exp p is onto.
Proof. By Lemma 5.16, choose z0 ∈ ∂Bδ(p) which minimizes the distance to q. Choose a geodesic γ such
that |γ′| ≡ 1, γ(0) = p, and γ(δ) = z0. This γ is defined for all time t by condition 1.
Page 37 of 77


## Page 38

Geodesics October 14, 2025
Let r = d(p, q) and we show that γ(r) = q. Define
A := {t ∈ [0, r] : r ≥ t + d(γ(t), q)}.
To see that r ∈ A, we note
• 0 ∈ A.
• A is closed.
• If t ∈ A and s < t , then s ∈ A. By the triangle inequality, we have
d(γ(s), q) ≤ d(γ(t), γ(s)) + d(γ(t), q)
≤ (t − s) + (r − t)
= r − s.
• A is open. Say t ∈ [0, r) is in A so that d(γ(t), q) ≤ r − t. In fact d(γ(t), q) = r − t because the reverse
inequality is the triangle inequality.
Choose 0 < δ1 < r − t such that B2δ1(γ(t)) is a normal neighborhood. Let z1 ∈ ∂Bδ1(γ(t)) be closest
to q. (Note this image is misleading because z1 and q will be on γ, but we don’t know that yet.)
Lemma 5.16 part 2 says d(γ(t), q) = δ1 + d(z1, q). Then
r − t = δ1 + d(z1, q) = ⇒ d(z1, q) = r − (t + δ1).
Then by the triangle inequality,
r = d(p, q) ≤ d(p, γ(t)) + d(γ(t), z1) + d(z1, q) = t + δ1 + (r − t + δ1) = r,
so d(p, z1) = t + δ1. The curve p → γ(t) → z1 is length minimizing and has to be a geodesic by
Corollary 5.14. Uniqueness of ODEs says that it has to be γ because they agrees up to time t. Thus
γ(t + δ1) = z1, which implies t + δ1 ∈ A.
Recall that the metric is d(p, q) = inf {L(γ) | γ: p → q}. The Gauss lemma showed that given exp p is a
diffeomorphism on Bδ(0), if q = expp(V ) with |V | < δ, then d(p, q) = |V | and any γ: p → q of length |V | is
a “monotone ray.”
Page 38 of 77


## Page 39

October 16, 2025 Geodesics
Proof of Theorem 5.15 (Hopf–Rinow). 4 ⇒ 1: This is clear.
1 ⇒ 2: Let p ∈ M be the point for which exp p is defined on all of TpM. Ω being closed and bounded
means there exists R such that d(p, x) ≤ R for all x ∈ Ω. By Proposition 5.17, Ω ⊂ expp(BR(0)) since any
x ∈ Ω has a geodesic leaving p to x with length d(p, x) ≤ R. BR(0) is compact in TpM ≃ Rn and exp p is
continuous, so expp(BR(0)) is compact. Since Ω is a closed subset of exp p(BR(0)), Ω is compact.
2 ⇒ 3: A Cauchy sequence ( pn) is bounded, so it lies inside a compact set by our assumption. Then there
exists a convergent subsequence, which implies convergence for a Cauchy sequence.
3 ⇒ 4: We are given that ( M, d) is complete. We show that a geodesic γ starting at p ∈ M can be extended
for all time t. By the normal neighborhood, we can do this for t ∈ [0, δ]. Let
A := {t ∈ [0, ∞) : γ(t) is defined}.
A is automatically open, as we can consider a normal neighborhood around γ(t) (e.g. consider a geodesic
from the origin to the surface of the unit ball).
It remains to show that A is closed: given that γ(t) is defined for all t ∈ [0, T), we wish to extend it to T .
Let ti be an increasing sequence converging to T . The sequence γ(ti) is Cauchy because
d(γ(ti), γ(tj)) = L(γ|[ti,tj]) ≤
γ′ |tj − ti| <
γ′ ϵ
when |ti − tj| < ϵ. By completeness, γ(ti) converges to some x ∈ M. Looking at a totally normal neighbor-
hood about x, we have γ(T ) = x by uniqueness of ODEs.
To find the length of a curve in a metric space, we partition the curve at pointsti, considerP d(γ(ti), γ(ti+1)),
and take the size of the partition to 0.
Example 5.18
Consider partitioning the perimeter P of the circle. Given that π is the area of the circle, the area of
one 1
N sector is π
N ≈ 1
2 bh ≈ 1
2 · 1 · P
N . Then P = 2π.
Page 39 of 77


## Page 40

V ariational theory of geodesics October 16, 2025
6 Variational theory of geodesics
Recall that a curveγ: [a, b] → M is a geodesic if ∇γ′γ′ = 0. These have constant speed |γ′|. A curve σ: [a, b] →
M is minimizing if L(σ) = d(σ(a), σ(b)). We showed that such a σ is a monotone reparameterization of a
geodesic.
6.1 Jacobi equation
Definition 6.1 (variation, proper). Given a curve γ: [a, b] → M, a variation of γ is a continuous (usually
piecewise smooth) map F : (−ϵ, ϵ) × [a, b] → M such that F (0, t) = γ(t).
A variation F is proper if the endpoints are fixed, meaning F (s, a) = γ(a) and F (s, b) = γ(b) for all s.
For F , there are two natural vector fields along the image:
• Fs = dF (∂s), called the variation vector field.
• Ft = dF (∂t), which gives the tangent along each curve for each s.
At s = 0, Ft = γ′ = γt. If F is proper, then Fs = 0 at the endpoints.
Corollary 6.2
∇Fs∇FtFt = ∇Ft∇FtFs + R(Ft, Fs)Ft.
Proof. Recall that [ Fs, Ft] = 0 because [ ∂s, ∂t] = 0 in R2 and dF preserves the Lie bracket. Then
∇Fs∇FtFt = R(Ft, Fs)Ft + ∇Ft∇FsFt − ∇[Ft,Fs]Ft
= R(Ft, Fs)Ft + ∇Ft∇FtFs
where [Ft, Fs] = 0 and symmetry implies ∇FsFt = ∇FtFs.
If Ft is a geodesic, then ∇FtFt = 0, and we get that the RHS above is 0.
Definition 6.3 (Jacobi field). Let γ be a geodesic. A vector field J along γ is a Jacobi field if
∇γ′∇γ′J + R(γ′, J)γ′ = 0.
If t → F (s, t) is a geodesic for every s, then Fs is a Jacobi field.
Example 6.4
On Rn, geodesics γ are straight lines. Since R ≡ 0, J is a Jacobi field if and only if ∇γ′∇γ′J = 0. Let
e1, . . . , en−1, en = γ′ be a parallel orthonormal frame along γ. Writing J = Pn
i=1 fi(t)ei(t), we have
∇γ′J = Pn
i=1 f ′
i(t)ei(t) and ∇γ′∇γ′J = P
i f ′′
i (t)ei(t) because the ei are parallel. Thus, J is Jacobi
when fi(t) is affine for all i, i.e. fi(t) = ai + bit for constants ai, bi.
Page 40 of 77


## Page 41

October 16, 2025 V ariational theory of geodesics
Jacobi fields are supposed to be infinitesimal generators of nearby geodesics, so it makes sense that they are
linear on Rn.
Lemma 6.5
Let γ: [a, b] → M n be a geodesic. Then
1. The space of Jacobi fields along γ is 2 n-dimensional and is uniquely determined by J(a) and
J ′(a) = (∇γ′J)(a).
2. If J(a) = 0, then J(t) = (d expγ(a))(t−a)γ′(a)(tJ ′(a)).
Proof. 1. The Jacobi equation is a 2nd order ODE, so it is determined by J and J ′ at a. There are n
choices for the coefficients of J(a), and similarly for J ′(a).
2. Define a variation
F (s, t) = expγ(a)

(t − a)(γ′(a) + sJ ′(a))

where γ′(a) is a fixed constant vector. For s fixed, this is a geodesic. Then Fs|s=0 is a Jacobi field.
Note that Fs(s, a) = 0.
What is ∇Ft(Fs|s=0) = ∇FtFs?
Fs(0, t) = (d expγ(a))(t−a)γ′(a)((t − a)J ′(a))
= (t − a)(d expγ(a))(t−a)γ′(a)(J ′(a)).
When we compute ∇γ′ of this at t = a, the term with ( t − a) after the chain rule vanishes, and the
other term is
∇FtFs = (d expγ(a))(t−a)γ′(a)(J ′(a))|t=a
= (d expγ(a))0(J ′(a))
= J ′(a)
at s = 0 and t = a, using ( d expγ(a))0 = Id by Lemma 5.7. The uniqueness in part (a) implies that
Fs = J.
Example 6.6
There are always two simple Jacobi fields
• J = γ′, because ∇γ′∇γ′γ′ = 0 and R(γ′, γ′)γ′ = 0 (R is skew).
• J = tγ′, because ∇γ′∇γ′(tγ′) = ∇γ′(t′γ′ + t∇γ′γ′) = ∇γ′γ′ = 0 and R(γ′, tγ′)γ′ = 0 (pull out t by
linearity).
We show that the other 2 n − 2 Jacobi fields must be normal.
Proposition 6.7
If J is a Jacobi field with J(0) and J ′(0) normal to γ′(0), then J is normal to γ′ for all t.
Page 41 of 77


## Page 42

V ariational theory of geodesics October 23, 2025
Proof.
∂t⟨J, γ′⟩ = ⟨J ′, γ′⟩ + ⟨J, ∇γ′γ′⟩
= ⟨J ′, γ′⟩
=⇒ ∂2
t ⟨J, γ′⟩ = ∂t⟨J ′, γ′⟩
= ⟨∇γ′∇γ′J, γ′⟩
= −⟨R(γ′, J)γ′, γ′⟩ (Jacobi equation)
= −R(γ′, J, γ′, γ′)
= 0 (Lemma 3.3)
Then ⟨J, γ′⟩ = a + bt for some a, b ∈ R. As J and J ′ are both perpendicular to γ′ at 0, we must have
a = b = 0. Then ⟨J, γ′⟩ ≡ 0.
6.1.1 Normal Jacobi fields on constant curvature spaces
Suppose M has constant sectional curvature κ. Assume |γ′| = 1. If V is a parallel normal vector field along
γ (so ∇γ′V = 0), then f V is a Jacobi field if and only if
0 = ∇γ′∇γ′(f V) + R(γ′, f V)γ′
= f ′′V + f R(γ′, V )γ′ (∇γ′V = 0)
= f ′′V + κf V
= (f ′′ + κf)V.
For the third equation, recall that R(X, Y, Z, W) = κ(⟨X, Z⟩⟨Y, W ⟩ − ⟨X, W ⟩⟨Y, Z⟩) for all tangent vectors
X, Y, Z, W (pset 3.3). Then ⟨R(γ′, V )γ′, W ⟩ = κ⟨V, W ⟩ for all W , so R(γ′, V )γ′ = κV .
This is a differential equation that we can solve:
• If κ = 0, then f ′′ = 0 and f = a + bt.
• If κ = 1 (e.g. Sn), then f ′′ = −f and f = a sin t + b cos t.
• If κ = −1 (e.g. hyperbolic space) then f ′′ = f and f = a cosh t + b sinh t.
6.2 Conjugate points
Geodesics on Sn get farther apart until they get to the equator, then they get closer together until they
coincide at the antipode. In hyperbolic space, then initially grow linearly, but then exponentially.
Definition 6.8 (conjugate points). Let γ be a geodesic. Then γ(a) and γ(b) are conjugate if there exists
a nonzero Jacobi field J such that J(a) = J(b) = 0.
Conjugate points correspond to places where exp is not a diffeomorphism? There are no conjugate points
in Rn, as if f = a + bt = 0 and f ′ = 0 then a = b = 0. There are also no conjugate points in hyperbolic
space. However, antipodal points are conjugate on Sn.
6.3 Energy
Definition 6.9 (energy). The energy E(γ) of a curve γ: [a, b] → M is
E(γ) =
Z b
a
γ′2 (t) dt.
Page 42 of 77


## Page 43

October 23, 2025 V ariational theory of geodesics
If it were |γ′| instead of |γ′|2, that would be the length of the curve.
Lemma 6.10
We have
d(γ(a), γ(b))2 ≤ L(γ)2 ≤ (b − a)E(γ)
with equality if and only if γ is a minimizing geodesic for both L and E.
Recall the Cauchy–Schwarz inequality
Z b
a
uv
2
≤
Z b
a
u2
Z b
a
v2

with equality if and only if u, v are multiples of each other. It comes from the L2-norm inequality
⟨u, v⟩2
L2 ≤ ||u||2
L2 ||v||2
L2
which is always true in an inner product space. A special case is that
Z b
a
|u|
2
≤
Z b
a
1
Z b
a
u2

= (b − a)
Z b
a
u2
with equality if and only if u is constant.
Proof. The first inequality is by the definition of d. The second inequality is by Cauchy–Schwarz:
L(γ)2 =
Z b
a
γ′
2
≤
Z b
a
1
Z b
a
γ′2
= (b − a)E(γ).
If the first inequality is an equality, then γ is a monotone reparameterization of a length minimizing geodesic
by Corollary 5.14. The second equality implies |γ′| is constant, so γ is a length minimizing geodesic.
There are too many choices for curves that minimize length, so we consider one with minimal energy. Given
a length minimizing curve, we can reparameterize it to be energy minimizing. A length minimizing geodesic
is the same as an energy minimizing curve.
Remark 6.11. Historical aside: Poincar´ e asked when given a complete manifold, whether there is
always a closed geodesic (a map from S1 → M). For example on the sphere, we can take an equator.
For surfaces with genus ≥ 1, we can take a nontrivial loop and find a variation that minimizes energy,
which will then be a geodesic.
On simply connected surfaces such as the sphere, this doesn’t work because all loops are null homotopic.
Birkhoff used sweepouts, or a family of curves which start and end at a point curve. He considered a
curve with maximal length, which turned out to be a geodesic.
Page 43 of 77


## Page 44

V ariational theory of geodesics October 23, 2025
6.3.1 First variation of energy
Let γ: [a, b] → M be continuous and piecewise smooth with breaks at a = t0 < t 1 < · · · < t k < t k+1 = b.
Let γ′(t−
i ) be the incoming tangent vector, and let γ′(t+
i ) be the outgoing tangent vector.
Let F (s, t) be a proper, piecewise smooth, continuous variation so F (s, a) ≡ γ(a) and F (s, b) ≡ γ(b) for all
s. We compute the variation dE
ds , where E(s) is the energy of F (s):
E(s) =
Z b
a
|Ft(s, t)|2 dt =
X
i
Z ti+1
ti
|Ft(s, t)|2 dt.
Differentiating,
E′(s) =
X
i
Z ti+1
ti
Fs⟨Ft, Ft⟩ dt
= 2
X
i
Z ti+1
ti
⟨∇FsFt, Ft⟩ dt (metric compatibility)
= 2
X
i
Z ti+1
ti
⟨∇FtFs, Ft⟩dt ([Fs, Ft] = 0 and symmetry)
= 2
X
i
Z ti+1
ti
(Ft⟨Fs, Ft⟩ − ⟨Fs, ∇FtFt⟩) dt (metric compatibility)
= 2
X
i
⟨Fs, Ft⟩

ti+1
ti
− 2
Z b
a
⟨Fs, ∇FtFt⟩ dt (FTC)
= −2
Z b
a
⟨Fs, ∇FtFt⟩ dt + 2
X
i
(⟨Ft, Fs⟩(t−
i+1) − ⟨Ft, Fs⟩(t+
i ))
= −2
Z b
a
⟨Fs, ∇FtFt⟩ dt + 2
X
i
⟨Fs, Ft(t−
i ) − Ft(t+
i )⟩ (6.1)
The last sum would telescope if γ were smooth to yield
E′(s) = −2
Z b
a
⟨Fs, ∇FtFt⟩ dt + 2⟨Fs, Ft(b) − Ft(a)⟩. (6.2)
Proposition 6.12
γ is a smooth geodesic if and only if E′(0) = 0 for all proper variations of γ.
Proof. (⇒) The first term in (6.1) vanishes because Fs = 0 for a geodesic, and the second term vanishes
when γ is smooth.
(⇐) Every vector field V on γ gives a variation F (s, t) = expγ(t)(sV (t)), where Fs(0, t) = V (t).
Page 44 of 77


## Page 45

October 28, 2025 V ariational theory of geodesics
We first show that γ is a broken geodesic. We let V be 0 at the breakpoints, so the summation term in (6.1)
is 0. Then the integral term is 0, but Fs can be arbitrary so ∇FtFt = 0.
Next we show that γ is smooth. If γ has a break point at ti, then we let V jump at ti, so Fs(0, ti) =
Ft(t−
i ) − Ft(t+
i ), and Fs(0, tj) = 0 for all j ̸= i. Then there would be a nonzero contribution in the second
term, which is a contradiction.
6.3.2 Second variation of energy
Proposition 6.13
If γ: [a, b] → M is a smooth geodesic, then
1
2 E′′(0) =
Z b
a
|∇FtFs|2 − R(Ft, Fs, Ft, Fs) dt.
Note that ∇Ft∇FtFs + R(Ft, Fs)Ft is the Jacobi operator and equals 0 when Fs is a Jacobi field.
Proof. We have
1
2 E′′(0) = −
Z b
a
Fs(⟨Fs, ∇FtFt⟩) dt
= −
Z b
a
⟨∇FsFs, ∇FtFt⟩ + ⟨Fs, ∇Fs∇FtFt⟩ dt
= −
Z b
a
⟨Fs, ∇Fs∇FtFt⟩ dt
= −
Z b
a
⟨Fs, ∇Ft∇FtFs + R(Ft, Fs)Ft⟩ dt (Corollary 6.2)
= −
Z b
a
⟨Fs, ∇Ft∇FtFs⟩ + R(Ft, Fs, Ft, Fs) dt
= −
Z b
a
Ft(⟨Fs, ∇FtFs⟩) − ⟨∇FtFs, ∇FtFs⟩ + R(Ft, Fs, Ft, Fs) dt
= ⟨Fs, ∇FtFs⟩

b
a
+
Z b
a
|∇FtFs|2 − R(Ft, Fs, Ft, Fs) dt
=
Z b
a
|∇FtFs|2 − R(Ft, Fs, Ft, Fs) dt.
The third equation is because ∇FtFt = 0 at s = 0 since γ is a geodesic.
The RHS
R b
a |∇FtFs|2 − R(Ft, Fs, Ft, Fs) dt ≡ I(Fs, Fs) is called an index form.
Definition 6.14. An index form I satisfies
I(V, V ) =
Z b
a
|∇FtV |2 − R(Ft, V, Ft, V ) dt.
This motivates Bonnet–Myers, which says that a length minimizing geodesic can not be too long.
Recall that if γ is a minimizing geodesic, then
0 ≤ I(V, V ) =
Z ∇γ′V
2 − R(γ′, V, γ′, V )
for all V along γ that vanish at the endpoints.
Page 45 of 77


## Page 46

V ariational theory of geodesics October 28, 2025
6.4 Bonnet–Myers
Theorem 6.15 (Bonnet–Myers)
Suppose (M n, g) is complete and Ric ≥ c for some constant c > 0. Then
diam(M)2 ≤ (n − 1) π2
c .
As a corollary, M is compact.
Proof. By Hopf–Rinow, there is a minimizing geodesic between any two points. It then suffices to show for
any minimizing geodesic γ of length L that L2 ≤ (n − 1) π2
c .
Say |γ′| = 1, so γ: [0, L] → M. Choose a parallel orthonormal frame e1, . . . , en−1, en = γ′ along γ; note γ′ is
parallel because ∇γ′γ′ = 0. Define
Vj = sin
 πt
L

ej,
which makes Vj = 0 at the endpoints t = 0, L. Then
0 ≤ I(Vj, Vj)
=
Z L
0
∇γ′

sin
 πt
L

ej

2
− sin2
 πt
L

R(γ′, ej, γ′, ej) dt
=
Z L
0

π
L cos
 πt
L

ej

2
− sin2
 πt
L

R(γ′, ej, γ′, ej) dt
=
Z L
0
π2
L2 cos2
 πt
L

− sin2
 πt
L

R(γ′, ej, γ′, ej) dt.
Summing over 1 ≤ j ≤ n − 1 yields
0 ≤ (n − 1) π2
L2
Z L
0
cos2
 πt
L

dt −
Z L
0
sin2
 πt
L
 n−1X
j=1
R(γ′, ej, γ′, ej) dt
= (n − 1) π2
L2
Z L
0
cos2
 πt
L

dt −
Z L
0
sin2
 πt
L

Ric(γ′, γ′) dt
≤ (n − 1) π2
L2
Z L
0
cos2
 πt
L

dt − c
Z L
0
sin2
 πt
L

dt.
The summation equals Ric( γ′, γ′) because the missing term is R(γ′, γ′, γ′, γ) = 0. The two integrals are
equal, so dividing out yields
c ≤ (n − 1) π2
L2 .
Page 46 of 77


## Page 47

October 28, 2025 Laplacian
Remark 6.16. Taking V = sin( πt
L )ej results in the optimal bound. If V = f ej with f = 0 at the
endpoints and κ ≡ 1, then
0 ≤ I(V, V )
=
Z L
0
(f ′)2 − f 2R(γ′, ej, γ′, ej) dt
=
Z L
0
(f ′)2 − f 2 dt.
We want to minimize the Raleigh quotient
R L
0 (f ′)2 dt
R L
0 f 2 dt
.
Letting L = π for simplicity and writing the Fourier series f =P∞
n=1 an sin(nx), the quotient becomes
P∞
n=1 a2
nn2
P∞
n=1 a2n
,
which is minimized when a1 = 1 and a2 = a3 = · · · = 0.
Remark 6.17. Cheng’s maximal diameter theorem states that if equality occurs, then M is a round
sphere.
Example 6.18
There is no complete metric on R2 with Ric ≥ c > 0 because it is not compact.
Corollary 6.19
If (M n, g) is complete with Ric ≥ c > 0, then π1(M) is finite.
Proof. Let fM be the universal cover of M. fM is also complete and satisfies the same diameter bound
because it has a natural metric by lifting the metric on M. By Bonnet–Myers, fM is compact, so π1(M) is
finite.
Example 6.20
T 2 = S1 × S1 has no such metric, because π1(T 2) ∼= Z2 × Z2 is infinite.
7 Laplacian
7.1 Harmonic functions and eigenvalues
Let u ∈ C(M) be a function.
Page 47 of 77


## Page 48

Laplacian October 28, 2025
Definition 7.1 (gradient). The gradient of u is the vector field obtained by raising the index:
∇u =
X
i,j
gijuj∂xi.
Definition 7.2 (Hessian). The Hessian of u is a (1 , 1)-tensor and the covariant derivative of u:
Hess u = ∇(∇u).
Definition 7.3 (Laplacian). The Laplacian of u is the trace of the Hessian:
∆u = Tr∇(∇u).
Example 7.4
On Rn, ∇u = ui, ∇(∇u) = uij, and
∆u =
nX
j=1
ujj = ∂2u
∂x2
1
+ · · · + ∂2u
∂x2n
.
Definition 7.5 (divergence). The divergence of a vector field V is the function
div V = Tr∇V.
Note that ∆ u = div(∇u). In an orthonormal frame ei, we have
div V =
nX
i=1
⟨∇eiV, ei⟩.
In local coordinates, the divergence of V =P
j V j∂j is
div V =
X
i
∂iV i +
X
i,j
Γj
ijV i.
By the Leibniz rule, we have [ ∇(uV )]i
j = ujV i + uV i
j , so
div(uV ) =
X
i
(uiV i + uV i
i ) = u div V + V (u) = u div V + ⟨∇u, V ⟩.
Applying this when V = ∇v, we have
div(u∇v) = u∆v + ⟨∇u, ∇v⟩.
Theorem 7.6 (Riemann divergence)
Let Ω ⊂ M be a domain with boundary ∂Ω. Then
R
∂Ω Flux V =
R
Ω div V .
Corollary 7.7
If M is compact (no boundary), then
R
M ∆u = 0 for any u.
Page 48 of 77


## Page 49

October 28, 2025 Laplacian
Corollary 7.8
If u, v ≡ 0 on ∂Ω, then Z
Ω
u∆v =
Z
Ω
v∆u = −
Z
Ω
⟨∇u, ∇v⟩.
The Laplacian is self-adjoint.
Definition 7.9 (harmonic). A function u is harmonic if ∆u = 0.
Example 7.10
On R2, some harmonic functions are
x, y, xy, x2 − y2, x3 − 3xy2, y3 − 3x2y, . . . .
In general, Re( x + yi)k and Im(x + yi)k are harmonic by the Cauchy–Riemann equation.
Lemma 7.11
Suppose ∆u ≡ 0 on Ω and v ≡ 0 on ∂Ω. Then
Z
Ω
|∇(u + v)|2 =
Z
Ω
|∇u|2 +
Z
Ω
|∇v|2 .
In other words, the energy of u + v is the sum of the energies of u and v. In particular, a harmonic function
u minimizes the energy across all functions that are the same as u on ∂Ω.
Proof. The difference between the two sides is
2
Z
Ω
⟨∇u, ∇v⟩ = 2
Z
Ω
div(v∇u) − v∆u
= 0
because v∇u ≡ 0 on ∂Ω, and ∆ u ≡ 0.
Lemma 7.12 (Reverse Poincar´ e inequality)
Let u be a harmonic function and ϕ be a cutoff function (i.e. compact support). Then
Z
|∇u|2 ϕ2 ≤ 4
Z
u2 |∇ϕ|2 .
Proof. Since ϕ has compact support, div( ϕ2u∇u) integrates to 0. This evaluates to
ϕ2u∆u + ϕ2 |∇u|2 + 2ϕu⟨∇ϕ, ∇u⟩,
so Z
ϕ2 |∇u|2 = −2
Z
ϕu⟨∇ϕ, ∇u⟩.
Page 49 of 77


## Page 50

Laplacian October 30, 2025
Then by the absorbing inequality (AM-GM) 2 ab ≤ ϵa2 + b2
ϵ with ϵ = 1
2, a = ϕ |∇u|, and b = u |∇ϕ|, we have
Z
ϕ2 |∇u|2 ≤ 2
Z
|ϕu⟨∇ϕ, ∇u⟩|
≤ 1
2
Z
ϕ2 |∇u|2 + 2
Z
u2 |∇ϕ|2
=⇒
Z
ϕ2 |∇u|2 ≤ 4
Z
u2 |∇ϕ|2 .
Corollary 7.13 (Yau)
An L2-harmonic function on a complete (connected) manifold must be constant.
Proof. Fix any point p ∈ M. Let ϕj be a sequence of cutoff functions with ϕj ≡ 1 on the ball Bj that cuts
off on Bj+1 \ Bj linearly in distance:
ϕj(x) =



1 d(x, p) ≤ j
j + 1 − d(x, p) j ≤ d(x, p) ≤ j + 1
0 d(x, p) ≥ j + 1
.
Applying the reverse Poincar´ e inequality onϕj, the LHS converges to
R
|∇u|2, while the RHS converges to
0 (because u is in L2 and the dominated convergence theorem).
7.2 Bochner formula
For a function u ∈ C(M), recall that
• The gradient ∇u is a (1 , 0)-tensor, and the differential du is a (0 , 1)-tensor.
• The Hessian ∇∇u is a (1 , 1)-tensor, and ∇du is a (0 , 2)-tensor.
• The Laplacian ∆ u = Tr(∇∇u) = div(∇u) is a function.
Lemma 7.14 (Bochner)
1
2∆ |∇u|2 = |Hessu|2 + ⟨∇u, ∇∆u⟩ + Ric(∇u, ∇u).
The formula is most useful when ∆ u = 0, so the middle term vanishes.
Corollary 7.15
If ∆u ≡ 0 and Ric ≥ 0, then ∆ |∇u|2 ≥ 0.
The Bochner formula is an equality of functions, so choose coordinates to make the computation easier.
Definition 7.16 (geodesic normal coordinates). Geodesic normal coordinates about a fixed p ∈ M satisfy
• gij(p) = δij, so the ∂i are orthonormal at p.
• Γk
ij(p) = 0, so ∇•∂i(p) ≡ 0 and ∇•dxi(p) ≡ 0.
Page 50 of 77


## Page 51

October 30, 2025 Laplacian
We show that such a coordinate system exists. Let ei be an orthonormal of TpM. Let xi denote the ith
coordinate of V under this basis. Then yi = xi ◦ exp−1
p is a coordinate system in some neighborhood U ⊂ M
of p. They are orthonormal (only) at p because (d expp)0 = Id and the ei are orthonormal by construction.
The curve γ(t) = t(a1, . . . , an) for some constants ai is a geodesic. Then from γ′ =P
i ai∂i, we have
0 = ∇γ′γ′ =
X
i
ai∇∂i(aj∂j) =
X
i,j
aiaj∇∂i∂j =
X
i,j,k
aiajΓk
ij∂k.
At p, this implies
0 =
X
i,j,k
aiajΓk
ij(p)∂k,
for any ai, so Γ k
ij(p) = 0.
This implies ∇∂i(p) = 0 and ∇dxi(p) = 0, because they can be written in terms of Γ k
ij(p).
Proof of Lemma 7.14. The facts we will use are
1. Symmetry of the Hessian: ⟨∇V ∇f, W ⟩ = ⟨∇W ∇f, V ⟩.
The LHS is V ⟨∇f, W ⟩ − ⟨∇ f, ∇V W ⟩, while the RHS is W ⟨∇f, V ⟩ − ⟨∇ f, ∇W V ⟩. Recalling that
⟨∇f, W ⟩ = W (f), the difference is V (W (f)) − W (V (f)) − ⟨∇f, [V, W ]⟩ = 0.
2. At p, ∆ f(p) = P
i⟨∇∂i∇f, ∂i⟩(p) = P
i ∂i⟨∇f, ∂i⟩(p). The first equality is the definition of trace,
and the second equality is by metric compatibility and how ∇∂i∂i(p) = 0 by the geodesic normal
coordinates.
3. ∇∂i∇∇u∇u = R(∇u, ∂i)∇u + ∇∇u∇∂iu − ∇[∇u,∂i]∇u by the definition of R.
4. If f = 1
2 |∇u|2, then ⟨∇f, V ⟩ = V (f) = 1
2 V ⟨∇u, ∇u⟩ = ⟨∇V ∇u, ∇u⟩ = ⟨∇∇u∇u, V ⟩, where the last
equality is by the symmetry of the Hessian.
Page 51 of 77


## Page 52

Laplacian October 30, 2025
Now we compute
∆f(p) =
X
i
∂i⟨∇f, ∂i⟩ (by 2)
=
X
i
∂i⟨∇∇u∇u, ∂i⟩ (by 4)
=
X
i
⟨∇∂i∇∇u∇u, ∂i⟩ (metric compatibility, ∇∂i(p) = 0)
=
X
i
R(∇u, ∂i, ∇u, ∂i) + ⟨∇∇u∇∂i∇u − ∇[∇u,∂i]∇u, ∂i⟩ (by 3)
= Ric(∇u, ∇u) +
X
i
∇u⟨∇∂i∇u, ∂i⟩ −
X
i
⟨∇∂i∇u, [∇u, ∂i]⟩ (by 1)
= Ric(∇u, ∇u) +
X
i
∇u⟨∇∂i∇u, ∂i⟩ +
X
i
⟨∇∂i∇u, ∇∂i∇u⟩
= Ric(∇u, ∇u) +
X
i
∇u⟨∇∂i∇u, ∂i⟩ + |Hessu|2
where [∇u, ∂i] = −∇∂i∇u because ∇•∂i = 0 at p.
It remains to show that ⟨∇u, ∇∆u⟩ =P
i ∇u⟨∇∂i∇u, ∂i⟩ at p, which is true because
⟨∇u, ∇∆u⟩ = ∇u(∆u)
= ∇u
X
i
dxi(∇∂i∇u)

=
X
i
(∇∇udxi)(∇∂i∇u) + dxi(∇∇u∇∂i∇u) (Leibniz rule)
=
X
i
0 + ⟨∇∇u∇∂i∇u, ∂i⟩
=
X
i
∇u⟨∇∂i∇u, ∂i⟩. (metric compatibility, ∇∂i(p) = 0)
The first term in the third line is 0 at p, and applying dxi is the same as applying ⟨•, ∂i⟩ at p.
The following theorem gives a lower bound for eigenvalues of the Laplacian.
Theorem 7.17 (Lichnerowicz)
If M n is complete, Ric ≥ c > 0, and ∆ u = −λu for some λ ∈ R \ {0} with
R
u2 = 1, then λ ≥ cn
n−1.
Example 7.18
On a sphere we have c = n − 1, so any eigenvalue λ must be at least n. It turns out that coordinate
functions u attain this bound and that Lichnerowicz’s theorem holds only for the sphere.
Proof. In general,
1
2∆u2 = div

∇1
2 u2

= div(u∇u) = |∇u|2 + u∆u
Then in our case,
1
2∆u2 = |∇u|2 − λu2.
Page 52 of 77


## Page 53

November 4, 2025 Laplacian
By the divergence formula,
R
∆v =
R
Flux = 0 because the Flux is across a boundary that does not exist.
Integrating the above equation, Z
|∇u|2 = λ
Z
u2 = λ.
In particular, λ ≥ 0.
By the Bochner formula,
1
2∆ |∇u|2 = |Hessu|2 + ⟨∇u, ∇(−λu)⟩ + Ric(∇u, ∇u),
so
0 =
Z
|Hessu|2 − λ
Z
|∇u|2 +
Z
Ric(∇u, ∇u)
≥
Z
|Hessu|2 − λ2 + cλ
where
R
Ric(∇u, ∇u) ≥ c
R
|∇u|2 by assumption. Then
λ2 − cλ ≥
Z
|Hessu|2 .
Given a symmetric n × n matrix S, we have Tr S = S · δij (Rn2
dot product), so by Cauchy–Schwarz,
|TrS|2 = |S · δij|2 ≤ |S|2 |δij|2 = n |S|2 ,
so (∆u)2 ≤ n |Hessu|2. Integrating yields
λ2 − cλ ≥
Z
|Hessu|2 ≥ 1
n
Z
(∆u)2 = λ2
n
Z
u2 = λ2
n ,
which rearranges to what we want: λ ≥ cn
n−1.
7.3 Isomperimetric and Wirtinger inequalities
Theorem 7.19 (Isoperimetric inequality)
For Ω ⊂ R2, we have
Area(Ω)
L(∂Ω)2 ≤ 1
4π
with equality if and only if Ω is a circle.
Proposition 7.20 (Wirtinger inequality)
1. If f: [0, π] → R satisfies f(0) = f(π) = 0, then
Z π
0
f 2 ≤
Z π
0
(f ′)2.
Equality holds if and only if f(x) = sin x.
2. If f is a C1 function on S1 = [0, 2π] and
R
S1 f = 0, then
Z
S1
f 2 ≤
Z
S1
(f ′)2.
Equality holds if and only if f(x) = a sin x + b cos x.
Page 53 of 77


## Page 54

Laplacian November 4, 2025
Note that
R
(f ′)2
R
f 2 is not dimensionless. Taking F (x) = f(λx), we have
R
(F ′)2
R
F 2 = λ2
R
(f ′)2
R
f 2 .
Proof. Let g(x) = f(x)2 cos x
sin x which is smooth and equals 0 at the endpoints because f(x)2 vanishes to order
2 while sin x vanishes to order 1. By the FTC,
0 =
Z π
0
g′ dx =
Z π
0
2f f′ cos x
sin x − f 2 − f 2 cos2 x
sin2 x dx.
Then
Z π
0
f 2 dx =
Z π
0
2f f′ cos x
sin x − f 2 cos2 x
sin2 x dx
=
Z π
0
(f ′)2 −

f ′ − f cos x
sin x
2
dx
≤
Z π
0
(f ′)2 dx.
For equality, we need f ′
f = (sin x)′
sin x so f is a multiple of sin x.
Proof of Theorem 7.19. We can assume that Ω is connected because it suffices to prove the inequality on
each connected component. Also ∂Ω is connected, because otherwise filling in any holes of Ω increases the
area and decreases the boundary. WLOG suppose L(∂Ω) = 2π, so we wish to show that Area(Ω) ≤ π.
Let ∂Ω be given by a map γ: S1 → R2 where |γ′| = 1. Writing γ = (γ1, γ2), we can translate Ω such thatR
S1 γ1 =
R
S1 γ2 = 0. By the Wirtinger inequality (Proposition 7.20),
Z
S1
γ2
1 ≤
Z
S1
(γ′
1)2
and same for γ2. Adding these inequalities yields
Z
S1
|γ|2 ≤
Z
S1
γ′2 =
Z
S1
1 = 2π.
Since |γ′| = 1, we can reparameterize
R
∂Ω |x|2 =
R
S1 |γ|2 ≤ 2π where x = (x1, x2). On R2, div x = ∂x1
∂x1
+ ∂x2
∂x2
=
2. Then letting n be the outward unit normal,
2 Area(Ω) =
Z
Ω
div x
=
Z
∂Ω
x · n (divergence theorem)
≤
Z
∂Ω
|x|2
 1
2
Z
∂Ω
|n|2
 1
2
(Cauchy–Schwarz)
≤ (2π)
1
2 (2π)
1
2
= 2π
where |n|2 = 1 pointwise. For equality in the Cauchy–Schwarz inequality, we need |x|2 to also be constant
on ∂Ω.
Page 54 of 77


## Page 55

November 4, 2025 Laplacian
7.4 Submanifolds
Let Σ ,→ M be a submanifold, so the induced connection is ∇u = ∇⊤u. Then Hessu = ∇∇u, and for any
tangent vectors V and W ,
Hessu(V, W ) = ⟨∇⊤
V ∇⊤u, W ⟩
= ⟨∇V ∇⊤u, W ⟩ (W tangent)
= ⟨∇V (∇u − ∇⊥u), W ⟩
= Hessu(V, W ) − ⟨∇V ∇⊥u, W ⟩
= Hessu(V, W ) + ⟨∇⊥u, ∇V W ⟩ (metric compatibility ∇⊥u ⊥ W )
= Hessu(V, W ) + ⟨A(V, W ), ∇u⟩.
Tracing,
∆u =
nX
i=1
Hessu(ei, ei) + ⟨∇u, H⟩
= ∆u + ⟨∇u, H⟩
where ei is an orthonormal frame for Σ, and H is the mean curvature.
Theorem 7.21 (Minkowski)
Let Ω ⊂ Rn+1 be a compact subset of dimension n with smooth boundary ∂Ω. Let ⃗ nbe the outward
unit normal on ∂Ω.
1.
R
∂Ω⟨x, ⃗ n⟩ = (n + 1) Vol(Ω).
2.
R
∂Ω⟨x, ⃗ n⟩⟨H, ⃗ n⟩ = −
R
∂Ω n = −n Area(∂Ω).
A consequence of 2 is that ∂Ω can never be minimal, because then the integrand and integral are 0.
Proof. 1. This follows from div x = n + 1 on Rn+1.
2. We apply the divergence theorem to x⊤ on ∂Ω. Letting ei be an orthonormal frame on ∂Ω,
div(x⊤) =
X
i
⟨∇eix⊤, ei⟩
=
X
i
⟨∇ei(x − x⊥), ei⟩
=
X
i
⟨ei − ∇eix⊥, ei⟩
= n −
X
i
⟨∇eix⊥, ei⟩
= n +
X
i
⟨x⊥, ∇⊥
eiei⟩ (metric compatibility)
= n + ⟨x⊥, H⟩.
Integrating gives the claim.
Page 55 of 77


## Page 56

Laplacian November 6, 2025
7.5 Spherical harmonics
We specialize to the case of Sn ,→ Rn+1. Let x be the unit normal, so we know that
A(V, W ) = −⟨V, W ⟩x, κ ≡ 1, Ric = (n − 1)g, H = −nx.
Lemma 7.22
The xi are eigenfunctions with ∆xi = −nxi.
Note this is the equality case of the Lichnerowicz theorem (Theorem 7.17).
Proof. Since Hessxi ≡ 0 (the second derivatives of xi are 0), ∆ xi = 0. Then
∆xi = ⟨∇xi, H⟩ = ⟨∂i, −nx⟩ = −nxi.
Definition 7.23 (homogeneous). A function u is homogeneous on Rn+1 of degree d if u(sx) = sdu(x)
for all s ∈ R>0.
Taking the s derivative yields
⟨∇u(sx), x⟩ = dsd−1u(x).
Differentiating again yields
Hessu(x, x)(sx) = d(d − 1)sd−2u(x).
Plugging in s = 1 results in
⟨∇u(x), x⟩ = du(x)
Hessu(x, x) = d(d − 1)u(x).
Now consider the sphere Sn ,→ Rn+1. Let e1, . . . , en, x be an orthonormal frame of Rn+1 (x is normal), so
∆u =
nX
i=1
Hessu(ei, ei) − n⟨∇u, x⟩
= ∆u − Hessu(x, x) − n⟨∇u, x⟩
= ∆u − d(d − 1)u − ndu
= ∆u − d(d + n − 1)u.
Note the second equality is because tracing Hess u over all n + 1 directions yields ∆ u.
Theorem 7.24 (Spherical harmonics)
Suppose u is a function on Rn+1 that is homogeneous of degree d and ∆u ≡ 0. Then on Sn,
∆u = −d(d + n − 1)u,
so u is an eigenfunction with eigenvalue d(d + n − 1).
• For d = 1, we get the coordinate functions xi, with eigenvalue λ = 1(1 + n − 1) = n.
• If n = 1, then λ = d2, which will yield rd sin dθ and rd cos dθ (we haven’t proven this).
Page 56 of 77


## Page 57

November 6, 2025 Minimal submanifolds
8 Minimal submanifolds
8.1 First variation
We show that there exist energy-minimizing curves. Consider the space of curves γ on [0, L] with γ(0) = p
and γ(L) = q. We want to show there is a subsequence that converges. To apply Ascoli–Arzel´ a, we need
equicontinuity (we already have uniform boundedness):
|d(γ(x), γ(y))| ≤ L(γ([x, y]))
=
Z y
x
γ′(t)
 dt
≤
Z y
x
γ′2
 1
2
Z y
x
1
 1
2
≤ c
p
|x − y|.
This argument can be used in 2 dimensions but fails for 3+ dimensions.
Let Σn ,→ M N be a submanifold. Consider a variation
F : Σ × (−ϵ, ϵ) → M
where (−ϵ, ϵ) is parameterized by s, and let Fs = dF (∂s) which is a variation vector field. A proper variation
means that Fs ≡ 0 on the boundary.
Let dv denote the induced volume element from M onto Σ × (−ϵ, ϵ).
Lemma 8.1 (First variation formula)
∂sdv =

div(F ⊤
s ) − ⟨F ⊥
s , H⟩

dv
Proof. Let x1, . . . , xn be local coordinates, and let Fi = dF (∂xi). As before, we have [ Fs, Fi] = 0, and
[Fi, Fj] = 0. The induced metric is gij = ⟨Fi, Fj⟩, and the volume element is dv =pdet gij dx. Then
∂sgij = Fs⟨Fi, Fj⟩
= ⟨∇FsFi, Fj⟩ + ⟨Fi, ∇FsFj⟩
= ⟨∇FiFs, Fj⟩ + ⟨Fs, ∇Fj Fi⟩
where
⟨∇FiFs, Fj⟩ = ⟨∇FiF ⊤
s , Fj⟩ + ⟨∇FiF ⊥
s , Fj⟩
= ⟨∇FiF ⊤
s , Fj⟩ − ⟨F ⊥
s , ∇FiFj⟩
= ⟨∇FiF ⊤
s , Fj⟩ − ⟨F ⊥
s , ∇⊥
FiFj⟩
= ⟨∇FiF ⊤
s , Fj⟩ − ⟨F ⊥
s , A(Fi, Fj)⟩.
Analogously, ⟨Fs, ∇Fj Fi⟩ = ⟨∇Fj F ⊤
s , Fj⟩ − ⟨F ⊥
s , A(Fi, Fj)⟩, so
∂sgij = ⟨∇FiF ⊤
s , Fj⟩ + ⟨∇Fj F ⊤
s , Fi⟩ − 2⟨F ⊥
s , A(Fi, Fj)⟩.
By Lemma 8.2,
∂s
q
det gij = 1
2pdet gij
∂s(det gij)
= 1
2pdet gij
det gij Tr(g−1∂sgij).
Page 57 of 77


## Page 58

Minimal submanifolds November 6, 2025
Next, we compute that
1
2 Tr(g−1∂sgij) = 1
2 Tr

g−1[⟨∇FiF ⊤
s , Fj⟩ + ⟨∇Fj F ⊥
s , Fi⟩]

− Tr

g−1⟨F ⊤
s , A(Fi, Fj)⟩

= div(F ⊤
s ) − ⟨F ⊥
s , H⟩.
since Tr(g−1Aij) ≡ H. All together,
∂s
q
det gij =
q
det gij

div(F ⊤
s ) − ⟨F ⊥
s , H⟩

which implies the desired result.
Lemma 8.2
Let B and C be n × n matrices with B invertible. Then
∂s|s=0det(B + sC) = (det B)(TrB−1C).
Proof. We have
det(B + sC) = det B det(I + sB−1C).
Differentiating yields
∂s|s=0det(B + sc) = (det B)

∂s det(I + sB−1C)|s=0

= (det B)(TrB−1C).
To see the last equality, we do an example:
det
1 + sa11 sa12
sa21 1 + sa22

= 1 + s(a11 + a22) + s2(a11a22 − a12a21).
The derivative at s = 0 is the trace a11 + a22. Then we can prove it inductively on n.
Definition 8.3 (Vol). Given Ω ⊆ Σ compact, let VolΩ(s) be the volume of the image of Ω at time s:
VolΩ(s) =
Z
Ω
dv.
Corollary 8.4
If Σ is minimal (so H ≡ 0), then Vol′
Ω(0) = 0 for all compact subdomains Ω ⊆ Σ.
Proof. By the first variation formula,
∂s|s=0Vol(s) =
Z
Ω
div(F ⊤
s ) dv −
Z
Ω
⟨F ⊥
s , H⟩ dv
= −
Z
Ω
⟨F ⊥
s , H⟩ dv
because the first term is 0 when Fs has compact support (proper variation). The second term is also 0 when
H ≡ 0.
Page 58 of 77


## Page 59

November 6, 2025 Minimal submanifolds
Corollary 8.5
If Σn ,→ RN minimal, and xi are the coordinate functions of RN, then
1. ∆xi = 0.
2. ∆ |x|2 = 2n.
3. div

∇⊤|x|2
|x|n

=
2n|x⊥|
2
|x|n+2 .
Proof. 1. We have ∆xi = ∆xi + ⟨∇xi, H⟩ = 0 because both terms vanish.
2. Let e1, . . . , en be an orthonormal frame for Σ. On RN, we have ∇ |x|2 = 2x. Then ∇⊤ |x|2 = 2x⊤ =
2x − 2x⊥. Then
∆ |x|2 = div(2x − 2x⊥)
= 2
nX
i=1
⟨∇ei(x − x⊥), ei⟩ (∇eix = ei)
= 2n − 2
nX
i=1
⟨∇eix⊥ei⟩
= 2n +
nX
i=1
⟨x⊥, ∇⊥
eiei⟩ (this is H)
= 2n.
3. By the Leibniz rule, we have
div
 ∇⊤ |x|2
|x|n

= ∇ |x|2
|x|n + ⟨∇ |x|2 , ∇ |x|−n⟩ (Leibniz rule)
= ∇ |x|2
|x|n +
D
∇ |x|2 , n
2 |x|−(n+2) ∇ |x|2
E
= 2n
|x|n + 2n |x|−(n+2)
x⊤

2
= 2n(|x|2 −
x⊤2)
|x|n+2
= 2n
x⊥2
|x|n+2 .
Theorem 8.6 (Monotonicity)
If Σn ,→ RN is minimal, then for any r1 < r2,
Vol(Br1 ∩ Σ)
rn
1
≤ Vol(Br2 ∩ Σ)
rn
2
.
Equality holds if and only if x⊥ = 0 between r1 and r2, where x is a position vector (same thing as x
is tangent to Σ at every point, i.e. being conical).
Page 59 of 77


## Page 60

Minimal submanifolds November 6, 2025
On Rn, we have ∆ |x|2 = 2n too. Also,
2n Vol(BR) =
Z
BR
∆ |x|2
=
Z
∂BR
∇ |x|2 · x
|x| (divergence theorem)
=
Z
∂BR
2x · x
|x|
= 2R Area(∂BR)
It’s like how integrating 4 πr2 gives 4
3 πr3.
Definition 8.7 (critical, regular value) . Recall for a smooth function f: M → R, if ∇f(y) = 0, then y is
a critical point and f(y) is a critical value. The set of regular values is im(f) \ {critical values}.
• The implicit function theorem says that the inverse image of a regular value is a smooth submanifold.
• Sard’s theorem says that the set of critical values has measure 0.
Proof of Theorem 8.6. Case 1: r1 and r2 are regular values of the function |x| : Σ → R.
If r is a regular value, then Σ r := Br ∩ Σ is smooth with smooth boundary ∂Σr ⊂ ∂Br. We can then
compute the volume of Σ r as
2n Vol(Σr) =
Z
Σr
∆ |x|2 (Corollary 8.5)
=
Z
∂Σr
⟨∇ |x|2 , ⃗ n⟩
= 2
Z
∂Σr
⟨x⊤, ⃗ n⟩
where ⃗ n= x⊤
|x⊤| is the unit normal vector. Let
f(r) := Vol(Σr)
rn ,
Page 60 of 77


## Page 61

November 18, 2025 Minimal submanifolds
so
2nf(r2) − 2nf(r1) = 2
Z
∂Σr2
⟨x⊤, ⃗ n⟩
|x|n − 2
Z
∂Σr1
⟨x⊤, ⃗ n⟩
|x|n
= 2
Z
Σr2 \Σr1
div
 x⊤
|x|n

= 2
Z
Σr2 \Σr1
x⊤2
|x|n+2 (Corollary 8.5)
> 0.
Case 2: Suppose at least one of r1, r2 is not regular. Find a decreasing sequence {r1,j} → r1 of regular
values and an increasing sequence {r2,j} → r2 of regular values. We can assume that r1,j ≤ r2,j for all j.
By the regular case, we have f(r1,j) ≤ f(r2,j). Also
f(r1) ≤
 r1,j
r1
n
f(r1,j)
≤
 r1,j
r1
n
f(r2,j)
≤
 r1,j
r1
n r2
r2,j
n
f(r2).
Example 8.8
On Euclidean space, the inequality is an equality: we claim that Vol(Br)
rn is constant if and only if
Voln−1(∂Br)
rn−1 is constant. We have |∂Br|
rn−1 =
R
∂Br
r1−n =
R
∂Br
∇|x|2−n
2−n · ⃗ nfor ⃗ nnormal. By the divergence
theorem, this equals 1
2−n
R
Br interior div(∇ |x|2−n) which is a constant.
8.2 Regularity theory
Recall that Σ n ,→ RN is minimal if H = 0 (mean curvature). For geodesics, it’s simple: any energy-
minimizing curve between two points is a smooth geodesic. The next case is surfaces in R3. Take a curve γ
and consider the spanning surface Σ of least area. The questions are does Σ exist, and is it smooth?
Example 8.9 (classical plateau problem)
Minimize the area of F : B1 → R3 where B1 ⊂ R2 is such that F (∂B1) = γ.
Remark 8.10. A function is a linear functional on C∞
comp (smooth functions with compact support),
because a function f determines a map ϕ 7→
R
f ϕ. Now consider the more general space D of linear
functionals on C∞
comp. An example of another element of D is ϕ 7→ ϕ(0).
If ∆f = g, then we should have for all ϕ that
R
gϕ =
R
ϕ∆f =
R
f∆ϕ, so
R
f∆ϕ =
R
gϕ could be taken
as the definition of ∆ f = g in the distributional sense.
In geometric measure theory, we think of submanifolds as functionals on functionsf on R3. There are curves
in R3 that don’t have a minimal surface, such as knotted curves, with the simplest being the trefoil.
Page 61 of 77


## Page 62

Laplacian comparison November 18, 2025
9 Laplacian comparison
9.1 Laplacian computations in Euclidean space
Question 9.1. What is ∆ |x| on Rn \ {0}?
We first note that
∆ |x|2 = ∆(x2
1 + · · · + x2
n) = 2n.
By the product rule,
∆ |x|2 = ∆(|x| · |x|) = 2 |x| ∆ |x| + 2 |∇ |x||2 .
By the chain rule,
2x = ∇ |x|2 = 2 |x| ∇ |x| =⇒ ∇ | x| = x
|x| ,
so |∇ |x|| = 1 for x ̸= 0. All together,
2n = ∆ |x|2 = 2 |x| ∆ |x| + 2 =⇒ ∆ |x| = n − 1
|x|
on Rn \ {0}.
In general on M n with Ric ≥ 0, defining d(x) := d(p, x) for a fixed p, we have ∆d ≤ n−1
d .
Remark 9.2. We can similarly compute Hess |x|. We know that Hess |x|2 = 2δij, so
2δij = ∂2 |x|2
∂xi ∂xj
= ∂
∂xi
 ∂
∂xj
|x|2

= ∂
∂xi

2 |x| ∂ |x|
∂xj

= 2 |x| ∂2 |x|
∂xi ∂xj
+ 2∂ |x|
∂xi
∂ |x|
∂xj
= 2 |x| ∂2 |x|
∂xi ∂xj
+ 2 xixj
|xi| |xj| .
In particular,
Hess|x| =
 1
|x| Idn−1 0
0 0

has eigenvalues of 1
|x| (multiplicity n − 1) and 0 (multiplicity 1). The trace is the Laplacian n−1
|x| .
9.2 Distance function
Let p ∈ M n be fixed, and define d(x) := d(p, x). Note that d is 1-Lipschitz by the triangle inequality. By
Rademacher’s theorem, d is differentiable almost everywhere.
Proposition 9.3 (Laplacian comparison at smooth points)
If M n satisfies Ric ≥ 0, and q is a smooth point of d, then ∆ d ≤ n−1
d at q.
Page 62 of 77


## Page 63

November 18, 2025 Laplacian comparison
Proposition 9.4
Let L = d(p, q). Suppose γ: [0, L] → M is a unit-speed minimizing geodesic with γ(0) = p, γ(L) = q,
and that d is smooth in a neighborhood of every point in im γ \ p. Then
1. ∇d(γ(t)) = γ′(t).
2. Hess d has rank at most n − 1 along γ and is 0 along γ′ itself.
In Rn, think about how along a ray from the origin to a point, the gradient is exactly the tangent to the
geodesic (1). The rank of Hess was n − 1, and the kernel was in the radial direction (2).
Proof. 1. We have d(γ(t)) = t because γ is a minimizing unit-speed geodesic. Differentiating with respect
to t yields ⟨∇d(γ(t)), γ′(t)⟩ = 1. Both ∇d(γ(t)) and γ′(t) are unit vectors, so we need ∇d(γ(t)) = γ′(t).
2. Differentiating ⟨∇d(γ(t)), γ′(t)⟩ = 1 again,
0 = ⟨∇γ′∇d(γ(t)), γ′⟩ + ⟨∇d, ∇γ′γ′⟩
= ⟨∇γ′∇d, γ′⟩
= ⟨Hessd(γ′, γ′), γ′⟩
which implies γ′ is in the kernel of the Hessian.
Proof of Proposition 9.3. We know |∇d|2 = 1 along γ, and in a neighborhood of each point on γ. This
means we can take ∆ |∇d|2. The Bochner formula (Lemma 7.14) says
0 = 1
2∆ |∇d|2 = |Hessd|2 + ⟨∇d, ∇∆d⟩ + Ric(∇d, ∇d) ≥ |Hessd|2 + 2⟨∇d, ∇∆d⟩.
For an n × n symmetric rank ≤ n − 1 matrix A, we have (Tr(A))2 ≤ (n − 1) |A|2. Letting A = Hessd, then
(∆d)2 ≤ (n − 1) |Hessd|2. Then
0 ≥ 1
n − 1(∆d)2 + ⟨γ′, ∇∆d⟩
= 1
n − 1(∆d)2 + γ′(∆d)
= 1
n − 1(∆d)2 + (∆d)′.
Define f(t) = (∆d)(γ(t)). We have shown that f ′ ≤ − f 2
n−1 and will be done by the following lemma.
Lemma 9.5
If f: [0, L] → R satisfies f ′ ≤ − f 2
n−1, then f(L) ≤ n−1
L .
Proof. We can assume that f > 0, since f is nonincreasing and would then satisfy f(L) ≤ 0 ≤ n−1
L . We
can set u(t) := 1
f(t), so u′ = − f ′
f 2 ≥ 1
n−1. FTC says that u(L) − u(ϵ) ≥ 1
n−1(L − ϵ). Since u(ϵ) > 0, we have
u(L) ≥ L−ϵ
n−1 and f(L) ≤ n−1
L−ϵ. Since this is true for all ϵ > 0 arbitrarily small, we have f(L) ≤ n−1
L .
Page 63 of 77


## Page 64

Laplacian comparison November 20, 2025
9.3 Calabi’s barriers
Suppose f, g are continuous functions at p. We give a new definition of ∆ f ≥ g even when we can not
necessarily take second derivatives of f.
Definition 9.6 (barrier sense). For f, g continuous functions, we say “∆ f ≥ g” in the barrier sense if
for every ϵ > 0, there exists a C2-function hϵ and a neighborhood Uϵ of p such that
1. hϵ ≤ f in Uϵ with equality at p.
2. ∆ hϵ ≥ g − ϵ at p.
Note that f − hϵ has a local minimum at p. If f is indeed C2, then at p we have ∇f = ∇hϵ, and the 2nd
derivative test yields ∆(f − hϵ) ≥ 0. Then ∆ f ≥ ∆hϵ ≥ g − ϵ. So at p, ∆f ≥ g − ϵ for all ϵ > 0, so ∆f ≥ g.
Definition 9.7 (viscosity sense). We say that “∆f ≥ g” at p in the viscosity sense if for every open set
U ∋ p and C2-function ϕ on U with f ≤ ϕ and equality at p, then ∆ ϕ(p) ≥ g(p).
The viscosity sense is weaker than the barrier sense: if ϕ ≥ hϵ with equality at p, then ϕ − hϵ has a local
minimum at p. Then ∆ ϕ ≥ ∆hϵ ≥ g − ϵ at p.
Theorem 9.8 (Laplacian comparison)
If M n is complete with Ric ≥ 0, then we have ∆ d ≤ n−1
d in the barrier sense (and thus in the viscosity
sense).
Corollary 9.9
We have ∆d2 ≤ 2n at every point in the barrier sense.
9.4 Cut points
Let M n be a complete manifold with no boundary, and fix p ∈ M.
Page 64 of 77


## Page 65

November 20, 2025 Laplacian comparison
Definition 9.10. For each V ∈ Sn−1
1 ⊂ TpM, there is a unit speed geodesic γ with γ(0) = p and
γ′(0) = V . Define
T (V ) = sup
t>0
{t : d(γ(t)) = t},
i.e. for how long the geodesic is minimizing. If T (V ) < ∞, then γ(T (V )) is a cut point. Let Cut( p) be
the union of all cut points as V varies.
Example 9.11
Note that d(γ(t)) = t holds at least when t is within the normal neighborhood.
• On Sn−1, T (V ) = π for all V , so Cut( p) = {antipode of p}.
• On Rn, T (V ) = ∞, so Cut( p) = ∅.
Lemma 9.12
If q /∈ Cut(p), then there exists a unique minimizing geodesic from p to q.
Proof. By Hopf–Rinow (Theorem 5.15), there exists a minimizing geodesic γ. Suppose there is a second
minimizing geodesic eγ, which must have the same length from p to q. Extending γ past q, it can no longer
minimizing because there is a piecewise geodesic with the same length following eγ. This implies q is a cut
point.
Lemma 9.13
If q ∈ Cut(p), then at least one of the following hold.
1. q is the first conjugate point to p along γ.
2. q is the first point where there are distinct minimizers from p.
The sphere satisfies both 1 and 2, while the cylinder satisfies only 2 (it does not have conjugate points).
Proof. The reverse direction is straightforward, so consider the forward direction. Let q ∈ Cut(p), and γ be
a geodesic of unit speed with L = d(q), so γ(L) = q. Let V = γ′(0) be the initial direction. By definition,
• γ is minimizing on [0, L] i.e. d(γ(t)) = t for t ≤ L (it is true for t < L , and being minimizing is a closed
condition).
• d(γ(t)) < t for t > L .
Take a decreasing sequence ti → L. There is some minimizing geodesic γi ̸= γ from p to γ(ti) = expp(tiV )
with unit speed, so let Wi := γ′
i(0) ∈ Sn−1. Note Wi ̸= V by uniqueness of ODEs. Define si < t i by
γi(si) = γ(ti).
Because Sn−1 is compact, there is a subsequence Wi → W ∈ Sn−1. Let σ be a unit speed geodesic with
σ′(0) = W , so γi → σ. We have si → L by the squeeze theorem and then σ(L) = q by continuity.
Page 65 of 77


## Page 66

Laplacian comparison November 20, 2025
If σ ̸= γ, then this is 2. If σ = γ, then W = V . Since exp p(siWi) = exp p(tiV ), both sides converge to q
as i → ∞ . However, notice that si < t i, so siWi and tiV are two distinct points in TpM. Since they go
towards the same point under exp p, this means exp p: TpM → M is not injective in a neighborhood of LV ,
so (d expp)LV is not invertible. Let U be the tangent vector such that ( d expp)LV (LU) = 0. By Lemma 6.5,
there is a Jacobi field J(t) = ( d expp)γ(t)(tU) with J(0) = J(L) = 0. Then γ(0) = p and γ(L) = q are
conjugate points.
Corollary 9.14
If γ is a minimizing geodesic from p to q, then there are no cut points before q along γ.
Corollary 9.15
Cut(p) is closed and has measure 0.
Proof. It has measure 0 because along each ray in TpM there is at most one point which maps to a cut
point.
To show that it is closed, intuitively, the two conditions in Lemma 9.13 are closed. Rigorously, consider
qi ∈ Cut(p) with qi → q ∈ M, and we must show that q ∈ Cut(p). Let ℓi = d(qi), γi be the minimizing
geodesic from p to qi, and ℓ = d(q). By continuity of d, we have ℓi → ℓ. Choose ti > ℓ i with ti → ℓ. By the
definition of a cut point, there exist geodesics σi from p to γi(ti) of length si < t i.
By the compactness of Sn−1 implies that σi → σ and γi → γ for some geodesics σ, γ from p with σ(ℓ) =
γ(ℓ) = q. If σ ̸= γ then 2 in Lemma 9.13 is satisfied. If σ = γ, then like before, exp p is not invertible and p
and q are conjugate points.
Remark 9.16. Consider a set A ⊂ Rn, δ > 0, and p > 0. We say that the measure Hp
δ(A) ≤ K if there
exists a countable collection of balls Bri(xi) with ri ≤ δ such that A ⊂S
i Bri(xi) and P
i rp
i ≤ K. If
p = n, then rn
i is essentially the volume of the balls. The limit lim δ→0 Hp
δ(A) exists (may be ∞) and is
called the p-dimensional Hausdorff measure Hp(A).
Proposition 9.17 (smoothness away from cut points)
If q /∈ Cut(p), q ̸= p, and d(q) = ℓ, then
1. d is smooth in a neighborhood of q.
2. There exists a unique minimizing geodesic γ from p to q with unit speed such that ∇d(γ(t)) = γ′(t)
for all t ≤ ℓ.
Page 66 of 77


## Page 67

November 25, 2025 Laplacian comparison
Proof. 1. Let Ω = exp −1
p (M \ (Cut(p) ∪ {p})). In other words, it is rays of TpM that go to up until the
cut points. Since Ω is starshaped, it is naturally like Rn, and expp is a local diffeomorphism on Ω that
maps it to M \ Cut(p). So for any q /∈ Cut(p) ∪ {p}, there exists x ∈ Ω such that exp p(x) = q. Then
d(p, q) = d(p, expp(x)) = |x|, so d is smooth at q.
2. For any q /∈ Cut(p) ∪ {p}, there exists a unique unit speed geodesic γ with γ(0) = p, γ(d(p, q)) = q,
and |γ′(0)| = 1. Fix V ∈ TqM. Let σ be a unit speed curve with σ(0) = q and σ′(0) = V . For s
sufficiently small, σ(s) is not a cut point because Cut( p) is closed and σ(0) = q is not a cut point.
Then there exists a unique geodesic γs from p to σ(s). By the first variation formula (Equation (6.2)),
⟨V, ∇d⟩(q) = d
ds d(σ(s))

s=0
= E′(0) = ⟨V, γ ′⟩(q).
Since this holds for any V , we have ∇d(q) = γ′(q).
Proof of Theorem 9.8. We want to prove that ∆ d ≤ n−1
d at q ∈ Cut(p), which means (c.f. Definition 9.6)
for all ϵ > 0, there exists a C2-function hϵ (near q) such that
1. d ≤ hϵ with equality at q,
2. ∆ hϵ ≤ n−1
d + ϵ at q.
Let γ: [0, ℓ] → M be the unit speed minimizing geodesic from p to q. Given δ > 0, define
h(x) = d(γ(δ), x) + δ.
If δ = 0, then h(x) = d(x). Note that h(q) = ℓ = d(q). In general, we have by the triangle inequality that
d(x) = d(p, x) ≤ d(p, γ(δ)) + d(γ(δ), x) = δ + d(γ(δ), x) = h(x),
so d ≤ h with equality at q, giving condition 1.
For condition 2, first note that q /∈ Cut(γ(δ)). If q ∈ Cut(γ(δ)), then γ(δ) ∈ Cut(q) because being a
cut point is a symmetric condition, but continuing γ past γ(δ) would no longer not be minimizing. Then
by smoothness away from cut points (Proposition 9.17) and and Laplacian comparison at smooth points
(Proposition 9.3),
∆h(q) = ∆d(γ(δ), q) ≤ n − 1
d(γ(δ), q) = n − 1
d(q) − δ ≤ n − 1
d(q) + ϵ
for δ sufficiently small.
Remark 9.18. We also just showed that ∆ d2 ≤ 2n, and similarly for other powers da. At smooth
points,
∆d2 = 2d∆d + 2 |∇d|2 ≤ 2d · n − 1
d + 2 = 2n.
At cut points, use h2.
Page 67 of 77


## Page 68

Laplacian comparison November 25, 2025
9.5 Bishop–Gromov
Theorem 9.19 (Bishop–Gromov)
For M n with Ric ≥ 0, the volume ratio Vol(Br(p))
rn is nonincreasing as r increases.
This is the opposite direction as for minimal submanifolds (Theorem 8.6). In particular, minimal submani-
folds can not have nonnegative Ricci curvature.
Corollary 9.20 (Bishop 1964)
Vol(Br(p)) ≤ Vol(Br ⊂ Rn).
Corollary 9.21 (volume doubling)
Vol(B2r(p))
Vol(Br(p)) ≤ 2n.
Proof. Rearrange Vol(B2r(p))
(2r)n ≤ Vol(Br(p))
rn .
Fake proof of Theorem 9.19. A fake proof is that |∇d|2 = 1 almost everywhere, and ∆ d2 ≤ 2n.
The coarea formula (“slicing”) says that for any s ∈ R and functions f, g ∈ C(M),
Z
f ≤s
g |∇f | =
Z s
∞
Z
{f=t}
g dt.
Define V (r) := Vol(Br(p)) and A(r) := Area(∂Br(p)) = V ′(r). The fact that A(r) = V ′(r) follows from the
coarea formula, because
V (r) =
Z
d≤r
|∇d| (|∇d| = 1 a.e.)
=
Z r
0
Z
{d=t}
1 dt (coarea formula)
=
Z r
0
A(t) dr,
and then FTC. Then
V ′(r) =
Z
d=r
|∇d|
=
Z
d=r
∇d2
2d
= 1
2r
Z
d=r
∇d2
= 1
2r
Z
d=r
⟨∇d2, conormal⟩
= 1
2r
Z
d<r
∆d2 (divergence theorem)
≤ 1
2r
Z
d<r
2n (Remark 9.18)
= n
r V (r).
Page 68 of 77


## Page 69

November 25, 2025 Laplacian comparison
This shows V ′ ≤ n
r V , so ( r−nV )′ = − n
rn+1 V + V ′
rn ≤ 0.
The flaw in this “proof” is that we can’t apply the divergence theorem, because it requires the boundary to
be smooth.
Real proof of Theorem 9.19. For each V ∈ Sn−1 ⊂ TpM, let
T (V ) := sup
t>0
{t | d(expp(tV )) = t} ∈ R+ ∪ {∞},
which is the last point where the geodesic from 0 to exp p(tV ) is smooth. Define Ω ⊂ TpM to be
Ω :=
[
V ∈Sn−1
[
t∈[0,T (V ))
tV.
For example, on Rn, Ω = TpM = Rn, while on Sn, Ω = Bπ(0). We can show that Ω is open, and that
expp is injective and a local diffeomorphism on Ω. Thus exp p is a global diffeomorphism onto its image
Im(Ω) = M \ Cut(p).
Since M is complete, we have Br(p) = expp(Ω ∩ Br(0)) up to cut points, so
V (r) := Vol(Br(p)) = Vol(expp(Ω ∩ Br)).
By changing variables, we get
V (r) =
Z
Ω∩Br(0)
det(d expp) =
Z r
0
Z
∂Bs∩Ω
det(angular part) ds,
where the last equality is by switching to polar coordinates where there is a radial part and an angular part.
Gauss’s lemma (Lemma 5.9) says that d expp looks like a 1 on the radial part and an (n −1) ×(n −1) matrix
on the angular part.
Let a(s, θ) be the Jacobian determinant for each θ ∈ ∂Br ∩Ω, so V (r) =
R r
0
R
θ∈∂Bs∩Ω a(s, θ) ds. By the proof
of Lemma 8.1, we know how to differentiate the area factor:
a′
a = mean curvature of the level set
= div(unit normal)
= div(∇d) = ∆d ≤ n − 1
d .
Incomplete proof in class.
9.6 Dirichlet Poincar´ e inequality
This is a generalization of the Wirtinger inequality. Let M n be complete with Ric ≥ 0 and no boundary.
Theorem 9.22 (Dirichlet Poincar´ e inequality)
There exists a constant cn such that if f ∈ C(M n) with f ≡ 0 on ∂Br(p), then
Z
Br(p)
f 2 ≤ cnr2
Z
Br(p)
|∇f |2 .
Page 69 of 77


## Page 70

Gradient estimate and Liouville theorems December 2, 2025
Lemma 9.23
Fix a point q, and let d(x) = d(q, x). Then ∆ d−n ≥ 2nd−n−2.
Proof. Chain rule and Laplacian comparison.
Proof of Theorem 9.22. Pick any point q such that d(p, q) = 2r. Define w := d(q, x)−n. Lemma 9.23 says
∆w ≥ 2nd(q, x)−n−2 ≥ 2n(3r)−n−2.
On the other hand,
|∇w| ≤ n
d(q, x)n+1 ≤ n
rn+1
on Br(p).
The function f 2∇w is 0 on ∂Br(p), so the divergence theorem says
0 =
Z
Br(p)
div(f 2∇w)
=
Z
Br(p)
f 2∆w + 2f ⟨∇f, ∇w⟩
≥
Z
Br(p)
2n(3r)−n−2f 2 + 2f ⟨∇f, ∇w⟩.
Then
2n(3r)−n−2
Z
Br(p)
f 2 ≤ 2
Z
Br(p)
|f | |∇f | |∇w|
≤ 2n
rn+1
Z
Br(p)
|f | |∇f |
≤ 2n
rn+1
Z
Br(p)
f 2
 1
2
Z
Br(p)
|∇f |2
 1
2
by Cauchy–Schwarz. Rearrange to get 3−n−2
r
R
Br(p) f 2
 1
2
≤
R
Br(p) |∇f |2
 1
2
, so
Z
Br(p)
f 2 ≤ 32n+4r2
Z
Br(p)
|∇f |2 ,
where cn = 32n+4.
10 Gradient estimate and Liouville theorems
10.1 Gradient estimate
Recall that a function u is harmonic if ∆u = 0. Liouville’s theorem on Rn says that if ∆ u = 0 and u > 0
on all of Rn, then u is constant.
In this section, we always assume M n is complete and connected with Ric ≥ 0.
Page 70 of 77


## Page 71

December 2, 2025 Gradient estimate and Liouville theorems
Theorem 10.1 (Cheng–Yau gradient estimate)
If u ∈ C(M) satisfies ∆ u = 0 and u > 0 on BR(p), then |∇ log u| ≤ Cn
R on BR/2(p), for some constant
Cn depending only on n.
An estimate like this will blow up near the boundary of BR(p).
Corollary 10.2 (Yau’s Liouville theorem)
If ∆u = 0 and u > 0 on all of M, then u is constant.
Proof. Then |∇ log u| ≤ Cn
R holds for every R, and Cn
R → 0.
Note that ∆u = 0 and u > L for any L ∈ R implies u is constant by Liouville’s theorem on u − L. The same
is true if |u| ≤ L.
Corollary 10.3
If ∆u = 0 on BR(p), then
sup
x∈BR/2(p)
|∇u(x)| ≤ 3Cn
R sup
x∈BR(p)
|u(x)| .
In other words, we can control the derivative on a smaller ball by controlling the values on a larger ball.
Proof. Set L = supBR(p) |u| and w = u + 2L, so w > 0 on BR(p). By the gradient estimate (Theorem 10.1),
|∇u|
u+2L = |∇ log w| ≤ Cn
R on BR/2(p), so |∇u| ≤ Cn
R (u + 2L) ≤ Cn
R (3L).
Lemma 10.4
For u ∈ C(M) with ∆ u = 0, the function w := log u satisfies
1. ∆ w = − |∇w|2
2. 1
2∆ |∇w|2 ≥ 1
n |∇w|4 − ⟨∇w, ∇ |∇w|2⟩.
Proof. 1. ∆ w = div(∇w) = div( ∇u
u ) = ∆u
u − |∇u|2
u2 = − |∇w|2.
2. By the Bochner formula,
1
2∆ |∇w|2 = |Hessw|2 + ⟨∇w, ∇∆w⟩ + Ric(∇w, ∇w) ≥ |Hessw|2 − ⟨∇w, ∇ |∇w|2⟩.
Cauchy–Schwarz (Tr A)2 ≤ n |A|2 on the n × n symmetric matrix A = Hess w implies (∆ w)2 ≤
n |Hessw|2. Then |Hessw|2 ≥ 1
n(− |∇w|2)2 = 1
n |∇w|4, and combine with the above inequality.
At an interior maximum of F , the first derivative test says that ∇F = 0. The second derivative test says
HessF ≤ 0, so tracing yields ∆ F ≤ 0.
At an interior maximum of ∇ |∇w|2, by 2 we would have ∇ |∇w|2 = 0 and ∆ |∇w|2 ≤ 0. Then by 2, we
would have |∇w|4 = 0 = ⇒ ∇ w = 0, which is suspicious. The problem is that |∇w|2 may not have an
interior maximum, but we will use a cutoff function η.
Page 71 of 77


## Page 72

Gradient estimate and Liouville theorems December 2, 2025
Proof of Theorem 10.1. Define η ≥ 0 with
η(x) =
(
R2 − d(p, x)2 if x ∈ BR(p)
0 else .
Define F := η2 |∇w|2 which does have an interior maximum. Choose y ∈ BR(p) with F (y) = max F . We
will show that F (y) ≤ C′
nR2, which will imply that C′
nR2 ≥ F (x) for any x. Then if x ∈ BR/2(p),
C′
nR2 ≥ F (x) = |∇w|2 (x)η2(x) ≥ 9
16 R4 |∇w|2 (x).
Dividing by R4 yields the gradient estimate.
Assuming that F (y) ≤ C′
nR2 for now, at a maximum y for F , the first derivative test says
0 = ∇F = 2η |∇w|2 ∇η + 2η2∇ |∇w|2 =⇒ ∇ |∇ w|2 = − |∇w|2 ∇η
η (10.1)
The second derivative test says
0 ≥ 1
2∆F = 1
2∆(η2 |∇w|2)
= 1
2 |∇w|2 ∆η2 + η2 ∆ |∇w|2
2 + ⟨∇η2, ∇ |∇w|2⟩
≥ −2nR2 |∇w|2 + η2
 1
n |∇w|4 − ⟨∇w, ∇ |∇w|2⟩

+ 2η⟨∇η, ∇ |∇w|2⟩ (Lemma 10.4(2))
= −2nR2 |∇w|2 + η2
n |∇w|4 + η2
D
∇w, |∇w|2 ∇η
η
E
− 2η
D
∇η, |w|2 ∇η
η
E
. (by (10.1))
Dividing by |∇w|2 and rearranging yields
2nR2 ≥ η2 |∇w|2
n + η⟨∇w, ∇η⟩ − 2 |∇η|2
≥ η2 |∇w|2
n − η |∇w| |∇η| − 2 |∇η|2
= 1
n F −
√
F |∇η| − 2 |∇η|2
≥ 1
n F −
 1
2n F + n
2 |∇η|2

− 2 |∇η|2 (AM-GM)
We know ∇η = −2d + ∇d where ∇d ≤ 1, so |∇η| ≤ 2R, and ∆ η = −∆d2 ≥ −2n by Laplacian comparison.
Rearranging and using |∇η|2 ≤ 4R2,
F ≤ 2n2R2 + n
 n
2 + 2

R2 = CR2
where C = Θ(n2).
10.2 Harnack inequality
Theorem 10.5 (Harnack)
If ∆u = 0 and u > 0 on BR(p), then
sup
BR/2(p)
u ≤ Cn inf
BR/2(p)
u
for some Cn depending only on n.
Page 72 of 77


## Page 73

December 4, 2025 Gradient estimate and Liouville theorems
Proof. Take any q ∈ BR/2(p) and let γ be a minimizing geodesic from p to q, which is contained in BR/2(p).
Let f(t) := log u(γ(t)), so
f ′(t)
 =
⟨∇ log u(γ(t)), γ′(t)⟩

≤ |∇ log u(γ(t))| (Cauchy–Schwarz and |γ′| = 1)
≤ C′
n
R . (gradient estimate Theorem 10.1)
Then FTC implies
|log u(p) − log u(q)| =

Z d(p,q)
0
f ′(t) dt
 ≤
Z d(p,q)
0
f ′(t)
 dt ≤ C′
n
R d(p, q) ≤ C′
n
2
which implies u(p) ≤ u(q)eC′
n/2, and the inequality holds with Cn = eC′
n.
Remark 10.6. By a limiting argument with u + ϵ and ϵ → 0, this inequality is also true for u ≥ 0.
Corollary 10.7
For α < 1, we have sup BαR(p) u ≤ Cα inf BαR(p) u where Cα → ∞ as α → 1.
Proof. One way to prove this is with a stronger gradient estimate: for all q ∈ BαR(p), |∇ log u(q)| ≤ Cn
(1−α)R.
Another way is to use Harnack’s inequality and iterate.
Lemma 10.8 (Kato’s inequality)
At any point where |∇u| ̸= 0, |∇ |∇u|| ≤ | Hessu|.
Proof. First note
2 |∇u| ∇ |∇u| = ∇ |∇u|2 = 2⟨∇•∇u, ∇u⟩ = 2 Hessu(∇u, •),
so dividing by 2 |∇u| implies ∇ |∇u| = Hess u( ∇u
|∇u| , •). Choose an orthonormal frame e1, . . . , en such that
e1 = ∇u
|∇u|. Then
|∇ |∇u||2 =
nX
i=1
⟨∇ |∇u| , ei⟩2 =
nX
i=1
u2
1i ≤
nX
i,j=1
u2
ji = |Hessu|2 .
Next we give an easier proof of another version of Corollary 10.3, in the case of Rn.
Theorem 10.9
Let M n be a manifold (not necessarily Ric ≥ 0) and u ∈ C(M) satisfy ∆ u = 0. Then there exists a
constant C = Cn such that
sup
x∈BR/2(p)
|∇u(x)| ≤ C
R sup
x∈BR(p)
|u(x)| .
Page 73 of 77


## Page 74

Gradient estimate and Liouville theorems December 4, 2025
Proof. WLOG let p = 0. Consider the cutoff function η := R2 = |x|2 which vanishes on ∂BR. We want to
bound η2 |∇u|2. Recall that
∆η = −2n
∆η2 = 2η∆η + 2 |∇η|2 ≥ −4nη ≥ −4nR2
|∇η| = 2η.
Kato’s inequality says
∆ |∇u|2 = 2 |Hessu|2 + 2⟨∇u, ∇∆u⟩ ≥ 2 |∇ |∇u||2 .
Then
∆(η2 |∇u|2) = η2∆ |∇u|2 + |∇u|2 ∆η2 + 2⟨∇ |∇u|2 , ∇η2⟩
≥ 2η2 |∇ |∇u||2 − 4nR2 |∇u|2 + 4⟨∇η2, |∇ |∇u|| |∇u|⟩
≥ 2η2 |∇ |∇u||2 − 4nR2 |∇u|2 − 8η |∇η| |∇ |∇u|| |∇u|
≥ 2η2 |∇ |∇u||2 − 4nR |∇u|2 − 16Rη |∇u| |∇ |∇u|| (|∇η| ≤ 2R)
By the absorbing inequality, 16 η |∇u| |∇ |∇u|| ≤ 2η2 |∇ |∇u||2 + 32 |∇u|2 R2,so
∆(η2 |∇u|2) ≥ −(4n + 32)R2 |∇u|2 .
Since ∆u2 = 2u∆u + 2 |∇u|2 = 2 |∇u|2, we get
∆(η2 |∇u|2 + (2n + 16)R2u2) ≥ 0.
By the maximum principle, η2 |∇u|2 + (2n + 16)R2u2 has its maximum on the boundary. However, η ≡ 0
on the boundary, so the maximum value is at most (2 n + 16)R2 supBR(p) |u|2. Then
(2n + 16)R2 sup
x∈BR(p)
|u(x)|2 ≥ η(x)2 |∇u(x)|2 + (2n + 16)2R2u(x)2
≥ η(x)2 |∇u(x)|2
≥ 9R4
16 |∇u(x)|2 ,
which implies the result, where C = Θ(n).
10.3 Mean value inequality
Theorem 10.10 (Mean value inequality)
Suppose Ric ≥ 0, and let v ∈ C(M) satisfy v ≥ 0 and ∆ v ≥ 0 on B4R(p). Then
sup
BR(p)
v2 ≤ Cn
R
B4R(p) v2
Vol(B4R(p)) .
In other words, the mean value can be compared to the maximum.
Proof. Let ϕ be a cutoff function such that ϕ ≡ 1 on B2R(p), ϕ ≡ 0 on ∂B4R(p), and |∇ϕ| ≤ 1
2R. Reverse
Poincar´ e (Lemma 7.12) says
Z
B2R(p)
|∇v|2 ≤ 4
Z
B4R(p)
v2 |∇ϕ|2 =⇒
Z
B2R(p)
|∇v|2 ≤ 1
R2
Z
B4R(p)
v2. (10.2)
Page 74 of 77


## Page 75

December 9, 2025 Gradient estimate and Liouville theorems
Now we solve for u such that ∆ u = 0 in B2R(p) and u = v on ∂B2R(p). Note that ∆( v − u) = ∆v ≥ 0, so
v − u has its maximum on the boundary ∂B2R(p). However, v − u = 0 on ∂B2R(p), so v ≤ u inside B2R(p).
By Lemma 7.11, we have
R
Ω |∇(u + w)|2 =
R
Ω |∇u|2 +
R
Ω |∇w|2. Then by (10.2),
1
R2
Z
B4R(p)
v2 ≥
Z
B2R(p)
|∇v|2 =
Z
B2R(p)
|∇u|2 + |∇(u − v)|2 ≥
Z
B2R(p)
|∇(u − v)|2 .
By Dirichlet Poincar´ e (Theorem 9.22),u − v ≡ 0 on ∂B2R(p) implies
Z
B2R(p)
(u − v)2 ≤ C1R2
Z
B2R(p)
|∇(u − v)|2 ≤ C1
Z
B4R(p)
v2.
Since u is harmonic and u ≥ 0, the Harnack inequality (Theorem 10.5) says v2 ≤ u2 ≤ C inf BR(p) u2. Then
sup
BR(p)
v2 ≤ sup
BR(p)
u2 ≤ C inf
BR(p)
u2
≤ C
Vol(BR(p))
Z
BR(p)
u2
≤ C
Vol(BR(p))
Z
B2R(p)
u2
≤ 2C
Vol(BR(p))
Z
B2R(p)
v2 +
Z
B2R(p)
(u − v)2

≤ 2C
Vol(BR(p))
Z
B4R(p)
v2 + C1
Z
B4R(p)
v2

≤ 2 · 4n · C(1 + C1)
Vol(B4R(p))
Z
B4R(p)
v2
where the last line is by Bishop–Gromov (Theorem 9.19).
10.4 Harmonic functions of polynomial growth
Recall Liouville’s theorem says that any bounded harmonic function is constant. There is also a stronger
result: if ∆ u = 0 and sup BR(p) |u| ≤ C′Rα for some α < 1, then the easier gradient estimate says that
sup
BR/2(p)
|∇u| ≤ C
R sup
BR(p)
u.
So if ∆ u = 0 and |u| ≤ C′, then u is constant. On Rn, u = x1 grows like this.
Definition 10.11 (space of harmonic functions) . Define Hd(M) as the space of harmonic functions that
grow almost like degree d. In other words, there exist p ∈ M and C ∈ R such that
|u(x)| ≤ C(1 + d(p, x))d.
In particular, M n with Ric ≥ 0 implies Hd(M) = {0} for d < 1.
Example 10.12
On Rn, we can show that Hd(Rn) is finite: if ∆ u = 0 then ∂u
∂xi
is harmonic too, and the gradient
estimate implies ∂u
∂xi
∈ H d−1(Rn). Do this d times to get a constant, which implies u is a polynomial
with degree ≤ d. Then dim Hd(Rn) = O(nd).
Page 75 of 77


## Page 76

Gradient estimate and Liouville theorems December 9, 2025
Theorem 10.13 (Colding–Minicozzi 1997)
If Ric ≥ 0, then dim Hd(M n) is finite dimensional. It is also true for ( M,eg) if Ric g ≥ 0 and g,eg are
bi-Lipschitz.
In 1998, they furthermore showed that dim Hd(M n) ≤ Cdn−1.
Theorem 10.14
There exists a constant Cn such that if u1, . . . uN are harmonic, L2(B2r)-orthonormal, and
R
Br
u2
i ≥
α > 0, then N ≤ C
α .
Theorem 10.15
If v1, . . . , v2n ∈ H d(M n) and are linearly independent, then there exist R > 0 and u1, . . . , un in the span
of the vi’s such that
1.
R
B2R
uiuj = δij (L2(B2R)-orthonormal).
2.
R
BR
u2
i > 2−4(d+n).
Together, these imply N ≤ C24(d+n), so dim Hd(M n) < ∞.
Lemma 10.16
Given x ∈ B2r, there exists y ∈ SN −1 satisfying w =PN
i=1 yiui hasP
i ui(x)2 = w(x)2.
Proof. Let
y = ⟨u1(x), . . . , uN(x)⟩p
u1(x)2 + · · · + un(x)2 .
Proof of Theorem 10.14. Fix x ∈ Br, and choose w as in the above lemma, so
nX
i=1
ui(x)2 = w(x)2 ≤ C
Vol(Br(x))
Z
B2r(x)
w2 ≤ C
Vol(Br(x))
by the mean value inequality and
R
B2r
w2 = 1.
Since Br(p) ⊂ B2r(x), Vol(Br(p)) ≤ Vol(B2r(x)) ≤ 2n Vol(Br(x)) by Bishop–Gromov. Thus
nX
i=1
u2
i (x) ≤ C2n
Vol(Br(p))
where the RHS does not depend on x. Integrating over Br(p) yields N α ≤
R
Br(p)
Pn
i=1 u2
i (x) ≤ C2n.
Polynomial growth means that if F (r) = rd, then F (2r)
F (r) = 2d.
Lemma 10.17
If F : [1, ∞) → R satisfies 0 < F (r) ≤ Cr d for all r, then for any ϵ > 0, there exist infinitely many k ∈ N
such that F (2k+1)
F (2k) ≤ 2d+ϵ.
Page 76 of 77


## Page 77

December 9, 2025 Gradient estimate and Liouville theorems
Proof. FSOC there exists k0 ∈ N such that for all k ≥ k0, F (2k+1) > 2d+ϵF (2k). This implies
F (2k0+m) > (2d+ϵ)mF (2k0).
On the other hand, F (2k0+m) ≤ C(2k0+m)d implies 2dm+ϵmF (2k0) ≤ C(2k0+m)d. Dividing by 2 dm yields
2ϵm ≤ C
F (2k0)2k0d
This is a contradiction because as m → ∞, the LHS goes to infinity while the RHS is constant.
Proof of Theorem 10.15. Let Λ j = span {v1, . . . , vj−1} ⊂ H d(M). Fix r, and let wj,r be the L2(Br)-
orthogonal projection of vj onto Λj. Define
fj(r) :=
Z
Br
(vj − wj,r)2 ≤
Z
Br
(vj − w)2
for any w ∈ Λj, vj − wj,r is perpendicular to Λ j. Note that
1. The independence of the vi implies there exists rj such that fj(rj) > 0.
2. By letting w = 0, we have fj(r) ≤
R
Br
v2
j ≤ Cjr2d+n for some constant Cj depending only on j.
3. We have fj(r1) ≤ fj(r2) for r1 < r2 because
fj(r1) =
Z
Br1
(vj − wj,r1)2 ≤
Z
Br1
(vj − wj,r2)2 ≤
Z
Br2
(vj − wj,r2)2 = fj(r2).
Now define F (r) =Q2n
j=1 fj(r). By 1, we have F (r) > 0 for r > max{rj}. By 2, we have F (r) ≤ C(r2d+n)2N.
By, Lemma 10.17, there exists some R = 2 k such that F (2R)
F (R) ≤ 2(d+n)2N. Every fi is nondecreasing, so
Q2N
i=1 fi(2R)Q2N
i=1 fi(R) ≤ 2(d+n)4N which implies at least N of the fi’s satisfy fi(2R)
fi(R) ≤ 24(d+n). For each such i, set
ui = vi − wi,2Rp
fi(2R)
which are orthonormal by Gram–Schmidt. Finally,
Z
BR
u2
i = 1
fi(2R)
Z
B2R
(vi − wi,2R)2
≥ 1
fi(2R)
Z
BR
(vi − wi,R)2
≥ 1
fi(2R)
Z
BR
(vi − wi,R)2
= fi(R)
fi(2R)
≥ 2−4(d+n).
Page 77 of 77
